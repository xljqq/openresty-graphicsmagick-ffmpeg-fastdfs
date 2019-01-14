FROM openresty/openresty:1.13.6.2-2-centos

ADD luajit-ffi /tmp/luajit-ffi

ADD magick /tmp/magick

ADD ffmpeg-4.1.tar.bz2 /tmp

ADD GraphicsMagick-1.3.31 /tmp/GraphicsMagick-1.3.31

RUN yum install -y gcc \
                   gcc-c++ \
                   zlib \
                   zlib-devel \
                   openssl \
                   openssl-devel \
                   pcre pcre-devel \
                   bzip2  \
                   libpng \
                   libjpeg \
                   libpng-devel \
                   libjpeg-devel \
                   ghostscript \
                   libtiff \
                   libtiff-devel \
                   freetype \
                   freetype-devel \
                   ImageMagick \
                   ImageMagick-devel
RUN cd /tmp && \
     cd GraphicsMagick-1.3.31 && \
    ./configure && \
     make && \
     make install && \
     cd /usr/lib64/ && \
     ln -sv liblzma.so.5 liblzma.so && \
     cd /tmp/ffmpeg-4.1 && \
     ./configure --enable-shared --disable-x86asm && \
     make && \
     make install && \
     echo "/usr/local/lib" >> /etc/ld.so.conf && \
     ldconfig && \
     ls /tmp && \
     cd /tmp/luajit-ffi && \
     chmod +x build.sh && \
     ./build.sh && \
     mv /tmp/luajit-ffi/libavmeta.so /usr/local/lib/ && \
     ldconfig && \
     mkdir -p /srv/image_cache && \
    mkdir -p /srv/video_cache && \
    cd /tmp && \
     cd magick && \
     luarocks install magick && \
     yum remove -y make && \
    yum clean all && \
    rm -rf /tmp/*  
	
COPY nginx.conf.template /usr/local/openresty/nginx/conf/nginx.conf.template

COPY download_server.lua /usr/local/openresty/site/

COPY upload_server.lua /usr/local/openresty/site/

COPY luajit-ffi/libavmeta.lua /usr/local/openresty/lualib/

ADD magick /usr/local/openresty/lualib/

ADD lua-resty-fastdfs/lib/resty /usr/local/openresty/lualib/resty

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/usr/bin/openresty", "-g", "daemon off;"]

STOPSIGNAL SIGQUIT

