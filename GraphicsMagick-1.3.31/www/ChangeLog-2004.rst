2004-12-29  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/image.c (DescribeImage): Add normalized channel
    statistics to output.

  - NEWS: Updated with changes since July.

  - magick/constitute.c (ImportImagePixelArea): For GrayQuantum,
    GrayInvertedQuantum, GrayAlphaQuantum, and
    GrayInvertedAlphaQuantum, observe image storage\_class so that a
    gray DirectClass image may be created.

  - coders/tiff.c (ReadTIFFImage): Fix overflow when computing
    colormap size for bits-per-sample of 32.
    (WriteTIFFImage): Support writing 32-bit RGB(A) for
    QuantumDepth=32 build.
    (ReadTIFFImage): Support reading 32-bit RGB(A) for QuantumDepth=32
    build.  Support reading 32-bit grayscale without any quality loss
    for QuantumDepth=32 build.

2004-12-28  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/tiff.c (WriteTIFFImage): TrueColor 16-bits/sample RGB
    images were being written incorrectly on little-endian CPUs.
    Added byte swapping to fix this problem.

2004-12-26  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/operator.c: New file for quantum operator implementation.
    (QuantumOperatorImage): Moved from image.c.
    (QuantumOperatorRegionImage): Moved from from image.c.

2004-12-22  Ralf Wildenhues  <Ralf.Wildenhues@gmx.de>

  - magick/Makefile.am (MAGICK\_BASE\_SRCS): Remove mention of
    non-existent mmath.h.

  - configure.ac: AC\_LIBTOOL\_SETUP is an internal macro and must not
    be used externally (will be pulled in automatically).

  - PerlMagick/Makefile.am: Missing file needed to be committed to CVS.

  - tests/Makefile.am (TESTS\_TIFF\_XFAIL\_TESTS): EPT and PTIF tests
    are expected to fail if libtiff is missing.

2004-12-21  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - TODO.txt: Organized todo list for 1.2 release.

2004-12-20  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/bmp.c (WriteBMPImage): Handle the case where the image
    has an over-sized colormap.  Was writing on unallocated heap memory.

  - coders/dib.c (WriteDIBImage): Handle the case where the image
    has an over-sized colormap.  Was writing on unallocated heap memory.

2004-12-19  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/gem.c (Modulate): Hue argument now represents a rotation
    from -180 degrees to +180 degrees expressed as an argument of 0 to
    2.0 (1.0 for no change). Note that this change also effects the
    -modulate argument and the Magick++ modulate method(). This change
    is made because the previous hue adjustment strategy only
    succeeded in corrupting the image.

2004-12-04  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/nt\_base.c (opendir): Ensure that data may not overwrite
    the stack.
    (readdir): Ensure that data may not overwrite the stack.

  - magick/blob.c (ImageToBlob): Ensure that image->logging is
    set prior to encoding image.

  - magick/constitute.c (WriteImage): Ensure that image->logging is
    set prior to encoding image.

2004-11-30  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - rungm.sh.in: Compute final variable definitions from within
    configure in order to improve MinGW test execution times.

2004-11-15  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/gif.c: Fix two error-path memory leaks which were noticed
    by Glenn Randers-Pehrson.

2004-11-10  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/png.c (UnregisterPNGImage): Eliminate Warning: module
    registration for "JNG" from module "PNG" still present!

2004-11-08  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/constitute.c (DispatchImage): Fix documentation error
    regarding return status.

2004-11-07  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/nt\_base.h: Only define HAVE\_GLOBALMEMORYSTATUSEX for MSVC
    7.0 and later.

2004-11-07  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/tiff.c (WriteTIFFImage): Ensure that words in the
    scanline are converted to little-endian format on little-endian
    CPUs.

2004-11-06  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/utility.c (MagickStrlCat): New function which is
    equivalent to to OpenBSD's strlcat() function.  Concatenates one
    string onto another within a fixed size buffer while ensuring null
    termination.
    (MagickStrlCpy): New function which is equivalent to OpenBSD's
    strlcpy() function.  Copies a string into a fixed size buffer
    while ensuring null termination.

  - coders/gif.c (DecodeImage): Improve handling of corrupt GIF
    files.  Resolves SourceForge bug #1042904.  Also, eliminate a
    potential memory leak.

  - magick/constitute.c (WriteImages): ImageInfo argument is now a
    const pointer.

2004-10-26 Glenn Randers-Pehrson <glennrp@glennrp.com>

  - magick/render.c (TracePath): Applied bugfix from Cristy.

2004-10-09  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/resource.c (InitializeMagickResources): Use
    GlobalMemoryStatusEx if it is available.

  - magick/nt\_base.c (lt\_dlopen): Handle errors while loading
    modules rather than allow Windows to display a GUI dialog box.
    (NTKernelAPISupported): New function to support testing to see if
    a Windows kernel API is supported.

  - magick/constitute.c (ExportImagePixelArea): Add special-case for
    bilevel gray image in order to restore performance.
    (ImportImagePixelArea): Add special-case for bilevel gray image in
    order to restore performance.

  - coders/jpeg.c (ReadJPEGImage): Fix GCC warning about variable
    being clobbered by longjmp.

  - Re-port build to MinGW. Modules build passes all tests.

  - Skip build and install of modules if a key library is not available.

  - Partial recode of metadata handling to use Get/Set profile
    functions.  Big job!

  - GCC warnings reduction.

  - Remove MVG detection from magic.mgk due to security risk.

2004-09-19  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/tiff.c (WriteTIFFImage): Properly detect and handle
    errors reported by libtiff so that failure is reported rather than
    writing a corrupted output file.
    (WriteNewsProfile): Re-write so implementation is easier to
    understand.

2004-09-14  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/tiff.c: Don't use deprecated tiff.h \_SUPPORT defines.
    Support retrieving and saving XMP profile.  Use profile set/get
    methods in implementation.

  - coders/mat.c,coders/topol.c (ReadBlobWordLSB,ReadBlobDoublesLSB):
    Use better variable name than `I` for image.

2004-09-07  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/miff.c (WriteMIFFImage): Ensure that MIFF files are never
    written with bogus compression values.

  - magick/image.h: Protected/hid constants which only exist to
    support the library implementation.

  - tests/Makefile.am (TESTS\_X11\_XFAIL\_TESTS): Fixed syntax error.

  - Makefile.am: Use one Makefile to rule them all as described in
    Peter Miller's excellent paper, Recursive Make Considered Harmful,
    "http://www.pcug.org.au/~millerp/rmch/recu-make-cons-harm.html".
    Some glitches may remain.

  - coders/tiff.c (TIFFErrors): Prevent possible stack overflow on
    error.
    (TIFFWarnings): Prevent possible stack overflow on error.

  - magick/constitute.c (ImportImagePixelArea): For RGBQuantum
    initialize the opacity channel since it is easier than altering
    all code to properly access it.

2004-09-02  Glenn Randers-Pehrson <glennrp@glennrp.com>

  - magick/transform.c: Bugfix from Cristy in CoalesceImages().

2004-08-26  Glenn Randers-Pehrson <glennrp@glennrp.com>

  - Avoid error introduced in libpng-1.2.6 that causes the encoder
    to write out-of-spec zlib header bytes.

2004-08-24  Glenn Randers-Pehrson <glennrp@glennrp.com>

  - coders/bmp.c is said to have a potential buffer overrun.
    Patch from Cristy applied (also to avi.c and dib.c).

2004-08-23  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/tiff.c (WriteTIFFImage): Use ExportImagePixelArea to
    write grayscale and colormapped output.

  - magick/constitute.c (ImportImagePixelArea): Implemented support
    for GrayInvertedQuantum & GrayInvertedAlphaQuantum.
    (ExportImagePixelArea): Implemented support for
    GrayInvertedQuantum & GrayInvertedAlphaQuantum.

  - magick/constitute.h (enum QuantumType): Added
    GrayInvertedQuantum & GrayInvertedAlphaQuantum to support
    min-is-white gray images.

2004-08-22  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - PerlMagick/t/tiff/write.t: Adjusted file naming.

  - PerlMagick/t/tiff/read.t: Added more tests.

  - coders/tiff.c (ReadTIFFImage): Use ImportImagePixelArea to read
    PseudoClass tiff.
    (WriteTIFFImage): Allow user to set the bits-per-sample define to
    any value in the range of 1 to 32.
    (ReadTIFFImage): Fix endian-reordering for DirectClass read and
    bits-per-sample values ranging 9-15.

  - coders/rgb.c: Support reading & writing 32-bit depths for raw
    RGB images.

  - coders/cmyk.c: Support reading & writing 32-bit depths for raw CMYK
    images.

  - coders/gray.c: Support reading & writing 32-bit depths for raw gray
    images.

  - magick/deprecate.c (PopImagePixels): Deprecated function.
    (PushImagePixels): Deprecated function.

  - magick/constitute.c (ExportImagePixelArea): New function to
    export pixel region using specified QuantumType and
    bits-per-sample.
    (ImportImagePixelArea): New function to import pixel region using
    specified QuantumType and bits-per-sample.

2004-08-14  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/cache.c (ClonePixelCache): It appeared that cloning a
    disk-based pixel cache was limited to the maximum value of
    size\_t. This would result in a truncated cache.  The offset type
    is changed from size\_t to magick\_off\_t in order to avoid this.

  - configure.ac: Check to see if the `char` type is unsigned,
    mostly out of curiosity since the code does not currently make use
    of the result.

  - Fixed many compilation warnings when the compiler warning level
    is set as high as possible.

  - configure.ac: Check /usr/share/ghostscript/fonts for Ghostscript Type1
    fonts.

2004-08-13  Glenn Randers-Pehrson <glennrp@glennrp.com>

  - tEXt and zTXt were inadvertently included in list of unused chunks.

2004-08-09  Glenn Randers-Pehrson <glennrp@glennrp.com>

  - fix incorrect argument to png\_set\_keep\_unknown\_chunks().

2004-08-07  David R. Linn  <drl@vuse.vanderbilt.edu>

  - www/formats.html: Titles for JNG and MNG were reversed.

2004-08-07  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/widget.c (XCommandWidget): Replace ImageMagick logo in
    display command menu with GraphicsMagick logo.

2004-08-05  Glenn Randers-Pehrson <glennrp@glennrp.com>

  - coders/png.c: Fixes for CERT security alert TA04-217A described
    at "http://www.us-cert.gov/cas/techalerts/TA04-217A.html".

2004-08-02  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/image.h (Image): Changed type of `colors` and `depth`
    members from type `unsigned long` to `unsigned int`. This change
    is made because on 64-bit CPUs, `unsigned long` is a 64-bit
    type. The depth member is often used in switch statements.  It is
    not recommended to use 64-bit types in switch statements.  The
    maximum number of colors in the colormap is limited to 64K so a
    64-bit type is not required.

2004-08-01  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/tiff.c (ReadTIFFImage): Restore previous 8/16
    bits-per-sample support code in order to regain lost performance.

2004-07-31  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/tiff.c (ReadTIFFImage): Support reading RGB/CMYK scanline
    oriented TIFF images with arbitrary depth.

2004-07-28  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - Makefile.am:  Update to Automake 1.9.

2004-07-20  Mike Chiarappa  <mikechiarappa@libero.it>

  - BCBMagick\magick\GM\_magick.bpr: Updated to reflect changes since last update.

  - BCBMagick\magick\libMagick.bpr: Updated to reflect changes since last update.

  - BCBMagick\bzlib\GM\_bzlib.bpr: Updated version number. 

  - BCBMagick\lcms\BCB6\GM\_lcms.bpr: Updated version number.  

  - BCBMagick\Magickpp\lib\GM\_magickpp.bpr: Updated version number.  

  - BCBMagick\ttf\GM\_ttf.bpr: Updated version number.  

  - BCBMagick\zlib\GM\_zlib.bpr: Updated version number.  

  - BCBMagick now support full LZW encoding (read/write).
    
2004-07-24  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - tiff/libtiff/tif\_lzw.c: Replace with version which supports LZW encoding.

  - magick/channel.c: New source file.
    (ExportImageChannel): New function to export an image channel.
    (ImportImageChannel): New function to import an image channel.

2004-07-20  Mike Chiarappa  <mikechiarappa@libero.it>

  - lcms/src/cmsio1.c: Test [testcms.c] related to lcms 1.13 fail
    with error #12288 when perform "Checking saved linearization
    devicelink".  Fixed function \_\_cmsSaveProfile().  "...malloc(0) is
    implementation dependent and may return non NULL pointer on some
    compilers, like VC++ and gcc. This is not the case of Borland C++
    Builder" - Thanks to Marti Maria that have supplied me this
    patched file: this will be part of the next lcms 1.14 which
    probabily will be released on summer's end.

2004-07-20  Mike Chiarappa  <mikechiarappa@libero.it>

  - lcms/include/lcms.h: Modified to achieve BCBMagick DLL compilation.
    Included modifications was introduced in GM in 2004-01-16 and 
    probabily lost with latest update of library.

2004-07-20  Mike Chiarappa  <mikechiarappa@libero.it>

  - BCBMagick: Updated lcms to version 1.13.
      + Modified files: BCBMagick\All\bcbMagick.mak; BCBMagick\lcms\BCB6\GM\_lcms.bpr;
        BCBMagick\lcms\BCB6\lcms.bpg; BCBMagick\lcms\BCB6\lcms.bpr; 
        BCBMagick\lcms\BCB6\testcms.bpr
      + Deleted files: BCBMagick\lcms\BCB6\lcms.cpp; BCBMagick\lcms\BCB6\testcms.cpp
      + Added file: BCBMagick\lcms\BCB6\lcms.bpf

2004-07-19  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - doc/options.imdoc: Fix typo regarding -define tiff:samples-per-pixel.

  - doc/GNUmakefile (utility-install): Utility HTML targets were not being installed.

2004-07-17  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - lcms: Updated to version 1.13.

2004-07-17  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - version.sh (CVS\_BRANCH\_TAG): Record the CVS branch tag that
    source package is obtained from.

2004-07-17  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - configure.ac: Pass essential flags on down to subordinate
    configures when performing `make distcheck`.  Support DESTDIR
    installs for PERL 5.8.1 and later, which support DESTDIR
    internally.

2004-07-16  Mike Chiarappa  <mikechiarappa@libero.it>

  - BCBMagick\coders\libCoders.bpr; BCBMagick\magick\GM\_magick.bpr: include
      file jbig.h could not be found during compilation. Solved.
    
2004-07-15  Mike Chiarappa  <mikechiarappa@libero.it>

  - BCBMagick\magick\magick\_config.h.: enabled LZW compression by default.

  - BCBMagick: included jbig delegate library. 
      + Modified these files into directory BCBMagick: All\bcbMagick.mak;
        All\GMlib.bpg; All\GMdll.bpg; coders\libCoders.bpr; magick\GM\_magick.bpr;
        utilities\gm\_lib.bpr; utilities\gm\_dll.bpr
      + Added these files into new directory BCBMagick\jbig: jbig.bpr; 
        jbig.bpf; GM\_jbig.bpr; GM\_jbig.c; tstcodec.bpr
      + Modified file jbig\jbiglib\jbig.h; 

  - BCBMagick\readme.txt: updated documentation.    

2004-07-10  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/command.c (MogrifyUsage): -ordered-dither help was
    formatted incorrectly.

  - doc/options.imdoc: Improve formatting a bit for manual pages and
    fix some syntax errors.

2004-07-09  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - NEWS: Updated to reflect changes since last update.

2004-07-09  Glenn Randers-Pehrson <randeg@alum.rpi.edu>

  - coders/bmp.c (ReadBMPImage): Removed if-test on reading
    red\_mask, green\_mask, and blue\_mask.  These are only \*valid\*
    under certain conditions, but they are always present in the
    file.

2004-07-08  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - Enable LZW compression by default.

2004-07-05  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/jpeg.c (WriteJPEGImage): Don't enable Huffman compression
    for large images (> 16 Mpixels for the moment) in order to
    conserve memory.  When Huffman compression is enabled the entire
    image is buffered in memory prior to encoding and writing
    anything.  Huffman compression is a method of eliminating
    redundant data so when the Huffman compression is disabled, files
    sizes will be larger, but otherwise the image is the same.

  - wand/magick\_wand.c (MagickSetPassphrase): String was being
    copied to a null pointer.  Now memory is allocated as required
    prior to a copy.
    Ensure that all unimplemented functions return a proper error
    report.

2004-07-01  Mike Chiarappa  <mikechiarappa@libero.it>

  - BCBMagick: updated to GraphicsMagick v.1.2

  - BCBMagick\All: project GMlib-1.1.bpr has been replaced with
    GMlib.bpr

  - BCBMagick\All: project GMdll-1.1.bpr has been replaced with
    GMdll.bpr

  - BCBMagick\readme.txt: updated documentation.

2004-06-28  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/command.c (MogrifyImage): For -units, don't reset
    resolution if units are undefined. Report an error if the -units
    argument is not supported.

2004-06-27  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/command.c (MogrifyImage): When setting image units, also
    adjust existing image x\_resolution and y\_resolution so that
    existing image resolution is not trashed.
    (MogrifyImage): When re-sampling an image, report an error if the
    image does not contain a valid resolution.

2004-06-21  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/pcx.c (WritePCXImage): Support writing large PCX files.
    (WritePCXImage): Ensure that UndefinedResolution is handled
    properly. Avoid round-off error for centimeter based resolution.

2004-06-10  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - configure.ac: Look for mozilla by default rather than netscape.

2004-06-02  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/type.c (ReadTypeConfigureFile): Determine location of
    Ghostscript fonts only once in order to improve performance.

  - magick/nt\_base.c (NTGhostscriptFonts): Properly determine
    Ghostscript font location for Ghostscript 8.0 and later.

  - GraphicsMagick.spec.in: Install \*-config scripts with mode 755
    rather than default 644.

2004-05-30  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/module.c (InitializeModuleSearchPath): Evaluate and cache
    module search path.
    (FindMagickModule): Use cached module search path.
    (OpenModules): Load all modules rather than just the modules in
    the directory where the LOGO module is found.  Besides allowing
    user-provided modules in non-GraphicsMagick directories to be
    loaded, this allows the "moby" shared build to load additional
    modules via OpenModules.

2004-05-28  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - utilities/Makefile.am (check): Add convert -list tests.

2004-05-23  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - configure.ac: Magick++ needs to be built as a static library
    under Cygwin and MinGW since C++ exceptions don't work otherwise.
    Be more assertive about that.

  - magick/nt\_base.h: Avoid conflict with ssize\_t definition under
    MinGW.

2004-05-22  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/constitute.c (DispatchImage): Support 8-bit output to
    common formats BGR, BGRO, BGRP, RGB, RGBO, and I as special cases
    in order to improve performance.
    (ConstituteImage): Support 8-bit input from common formats BGR,
    BGRO, BGRP, RGB, RGBO, and I as special cases in order to improve
    performance.

2004-05-20  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - ltmain.sh: Fix to allow exe wrapper to work under MinGW.

  - wand/magick\_compat.c (QueryMagickColor): Fixed DLL export.

  - wand/magick\_wand.c: Fixed some DLL exports (MagickExport->WandExport).

2004-05-17  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/image.c (SetImageClipMask): Consistently report any
    exceptions to image->exception.

2004-05-16  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - Makefile.am: Update to Automake 1.8.5.

  - magick/image.h (ImageInfo): New `progress` monitor to indicate
    if progress monitor and busy cursor are enabled while displaying
    an image.  Defaults to True.

  - magick/display.c, magick/xwindow.c: Use +progress to disable
    progress monitor and busy cursor.

  - magick/command.c (MogrifyUsage): Usage didn't list -operator.
    (ConvertUsage): Usage didn't list -operator.

2004-05-15  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/compress.c (HuffmanDecodeImage): Properly return error status.
    (HuffmanEncode2Image): Properly return error status.

  - magick/composite.c (CompositeImage): Properly return error status.

  - magick/quantize.c (ClassifyImageColors): Properly return error status.
    (GetImageQuantizeError): Properly return error status.
    (OrderedDitherImage): Properly return error status.

  - magick/profile.c (ProfileImage): Properly return error status.

  - magick/paint.c (ColorFloodfillImage): Properly return error status.
    (MatteFloodfillImage): Properly return error status.
    (OpaqueImage): Properly return error status.
    (TransparentImage): Properly return error status.

  - magick/enhance.c (ContrastImage): Properly return error status.
    (EqualizeImage): Properly return error status.
    (GammaImage): Properly return error status.
    (LevelImage): Properly return error status.
    (LevelImageChannel): Properly return error status.
    (ModulateImage): Properly return error status.
    (NegateImage): Properly return error status.
    (NormalizeImage): Properly return error status.

  - magick/image.c (GetImageClipMask): New function to retrieve an
    associated clip-mask image.
    (SetImageClipMask): Clip-mask image parameter may be const since
    it is cloned prior to storage.
    (ChannelImage): Properly return error status.
    (GradientImage): Properly return error status.
    (RGBTransformImage): Properly return error status.
    (TransformRGBImage): Properly return error status.
    (SyncImage): Return an error status.

  - magick/enhance.c (NegateImage): If image has a clip mask,
    then force image to DirectClass so clip mask takes effect.

2004-05-15  Vladimir Lukianov  <lvm@integrum.ru>

  - magick/image.c (SetImageOpacity): Ensure that image is
    DirectClass. If specified opacity is TransparentOpacity, then
    replace existing opacity with TransparentOpacity.

2004-04-20  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - configure.ac: Avoid duplicated test status messages for \_\_func\_\_
    tests.  Avoid duplicated test status message for jpeg 6b test.

2004-04-19  Patrick Welche  <prlw1@newn.cam.ac.uk>

  - www/header.html: HTML syntax fixes.

2004-04-18  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - : Change web pages to a frames-based design.

2004-04-17  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - utilities/Makefile.am (check): Change geometry arguments which
    were expressed as 0.0xVAL to avoid the problematic Linux scanf
    feature back to 0xVAL.

2004-04-14  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/symbols.h (GetMagickDimension): Added GetMagickDimension.

2004-04-11  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/utility.c (GetMagickDimension): New function to replace
    occurances of scanf(geometry,"%lfx%lf",&w,&h) since Linux scanf()
    and strtod() misbehave for strings that start with "0x". The Linux
    versions always treat 0x as the start of a value expressed in hex
    and can't be forced to read the leading value as a double.  This
    function has been applied globally to replace the problem scanf's.	

  - magick/version.h.in: Make it clear in the -version output that a
    mutitude of copyrights and licenses apply to this software.

  - magick/utility.c (GetPathComponent): Avoid strncpy() of
    overlapping regions.

  - magick/command.c (DisplayImageCommand): Eliminate double-free
    of resource\_info->image\_geometry.
    (DisplayImageCommand): `display` was improperly requiring at least
    one argument (bug was added yesterday).

2004-04-10  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - utilities/gm.c (main): Default usage message wasn't right for
    aliased utility.

  - configure.ac: Added the --enable-magick-compat option to install
    compatibility links to emulate ImageMagick commands.

  - magick/command.c: Ensure that each sub-command responds to -help
    and -version appropriately.

  - utilities/gm.c (main): Invoke appropriate sub-command if gm is
    executed under a traditional alternate name such as "convert". The
    user may create hard or symbolic links from `gm` to a traditional
    ImageMagick utility name (or just copy `gm` to the desired
    sub-command name) in order to be 100% command-line compatible with
    ImageMagick 5.5.2. This is necessary in order to work with
    existing software designed to execute ImageMagick utilities.

2004-04-08  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/compress.c (Ascii85Tuple): Encoding bug is indeed fixed
    on DEC Alpha. Also warnings reduction with Digital Unix compiler.

2004-04-07  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/compress.c (Ascii85Tuple): Add casts to reduce compiler
    warnings, and maybe even fix a bug.

  - coders/pdf.c (ReadPDFImage): Double-check that Ghostscript
    produced an output file since sometimes it reports success after
    it has spewed an error message and has produced no output.

2004-04-06  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/compress.c (HuffmanEncode2Image): Avoid out of bounds
    array access.

  - magick/studio.h (\_FILE\_OFFSET\_BITS): Fix \_FILE\_OFFSET\_BITS
    #ifdef to avoid warnings when it is not defined.

2004-04-05  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - configure.ac: Fix minor shell syntax error (used ==).

2004-04-04  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - Merged in updates from 1.1 release branch.

  - version.sh (PACKAGE\_VERSION): Release version 1.1.
    (PACKAGE\_VERSION): Next major release will be 1.1.  Bump library
    versions since we anticipate adding interfaces.

  - magick/studio.h: Disabled use of Windows message lookups
    entirely since this doesn't seem to work for programs.  It
    probably only works for DLLs like ImageMagickObject.

  - magick/delegate.c (ListDelegateInfo): Don't get stuck in a loop
    if fprintf() returns zero.

2004-04-03  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - VisualMagick/\*/\*.bat: Add .exe to exe file names in order to
    ensure that the executable is executed rather than something else
    (such as a batch script).

  - magick/locale.c: Only use Windows resource message lookup for
    the DLL build since it doesn't seem to work for static
    executables.

  - magick/utility.c (SetClientPath): Ensure that client path is
    null terminated.
    (SetClientFilename): Initialize default client filename to ""
    rather than "gm.exe" and ensure that filename is null terminated.
    (SetClientName): Ensure that client path is null terminated.

  - magick/blob.c (GetConfigureBlob): Enable logging the load of
    log.mgk

  - magick/log.c: Re-designed logging initialization in order to
    avoid the "chicken and the egg" snafu.  This allows logging the
    initialization of the logging subsystem.

2004-04-01  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - VisualMagick/bin/log.mgk: Add comments to help document usage.

  - config/log.mgk: Add comments to help document usage.

  - magick/utility.c (IsAccessible): Use access() rather than stat().
    (IsAccessibleNoLogging): Use access() rather than stat().
    (IsDirectory): Implemented return status according to existing API
    documentation.
    (GetExecutionPathUsingName): Complete re-write in order to minimize
    path computation logic and fix failure with partial paths.

2004-03-31  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - doc/options.imdoc: Add "Color" to the arguments available for -list.

2004-03-29  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - version.sh (PACKAGE\_CHANGE\_DATE): Updated version to 1.1Beta3

  - magick/nt\_base.c (NTSystemComman): Have not been successful with using
    MsgWaitForMultipleObjects() reliably, so back out usage of it for
    now.

  - magick/fx.c (ConvolveImage): Support convolution in CMYK
    colorspace.

2004-03-28  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - version.sh (PACKAGE\_CHANGE\_DATE): Update release to 1.1Beta2.

  - magick/constitute.c (ReadImage): Ignore errors of type
    ConfigureError when loading modules so that error report can still
    report the familiar "No delegate for this image format" message
    while still being able to report problems with loading a module if
    it was found.  This is a compromise which reports useless messages
    when the modules are not found at all, but I can't think of a way
    around it.

  - magick/nt\_base.c (NTSystemComman): Adjust
    MsgWaitForMultipleObjects() arguments to wait for object to be
    signaled only (FALSE) rather wait for object to be signaled as
    well as an input event received(TRUE).  It seems that process
    status changes do not result in an input event, so the call was
    deadlocking.

  - magick/constitute.c (ReadImage): If module loading reported an
    error, ReadImage immediately returned an error rather than trying
    to use a delegate defined by delegates.mgk.

2004-03-25  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - version.sh: Updated version to 1.1Beta1

2004-03-24  Mike Chiarappa  <mikechiarappa@libero.it>

  - BCBMagick/magick/libMagick.bpr: updated to latest source modifications.

  - BCBMagick/magick/GM\_Magick.bpr: updated to latest source modifications.

2004-03-23  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/plasma.c (ReadPlasmaImage): srand() is already invoked by
    InitializeMagick() so don't call it here.

  - configure.ac: Check for rand\_r().

  - magick/tempfile.c (ComposeTemporaryFileName): The full range of
    safe characters was not being used, thereby limiting the number of
    unique temporary file names available.

2004-03-22  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/image.c (GetImageStatistics): New function to obtain
    image statistics (minimum, maximum, mean, variance, and standard
    deviation).
    (DescribeImage): Include image channel statistics in verbose
    output.

2004-03-21  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/constitute.c (DispatchImage): Removed some unreachable
    code that was accidentially left in the switch statement.

  - magick/pixel\_iterator.c (PixelIterateDualRead): Extended so that
    the region in each image may use a different origin.
    (PixelIterateDualModify): Extended so that
    the region in each image may use a different origin.

  - magick/composite.c (CompositeImage): Fix XorCompositeOp overflow
    condition which occured on non-Intel architectures.

2004-03-20  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - NEWS: Updated with changes up to today's date.

  - tests/constitute.c (main): Float type seems to require allowing
    a bit of error for Q:32.

  - magick/constitute.c (DispatchImage): Be more careful when
    rounding pixel intensity.
    (ConstituteImage): Be more careful when converting float and
    double to Quantum.

  - magick/composite.c (CompositeImage): Fix Multiply composite
    operator for Q:32 build (was all black image).
    (CompositeImage): Tidied up the documented composite operators so
    the implementation is easier to understand.

  - PerlMagick/t/ttf/read.t: Set a desired label size so output
    image should be the same size as the reference image even if the
    FreeType type hinter is disabled.

  - magick/annotate.c (RenderFreetype): Improve outline bounding box
    computation accuracy.

2004-03-18  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - PerlMagick/t/x/write.t: Don't test X11 if DISPLAY is not set.

  - PerlMagick/t/x/read.t: Don't test X11 if DISPLAY is not set.

2004-03-17  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/Makefile.am: Removed some apparently unnecessary library
    dependencies.

  - Makefile.am (windows-src): Added a way to generate a Windows
    source zip file.

2004-03-16  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/command.c: The -operator command now supports
    floating-point and percent of range arguments.

2004-03-15  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/command.c: Added support for -operator command with
    syntax "-operator channel operator rvalue" which applies a
    arithmetic or bitwise operator to a specified image channel
    or all channels.

2004-03-13  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - PerlMagick/t/filter.t: Fix Solarize test case.

  - PerlMagick/t/wmf/read.t: Added another WMF test case.

  - coders/wmf.c: Resolve WMF rendering bug with black color.

  - magick/utility.c (StringToArgv): Free argv data prior to error
    return.

2004-03-10  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/jpeg.c (WriteJPEGImage): If image\_info->colorspace is set
    to GRAYColorspace then make sure that image is in a gray
    colorspace.

  - magick/image.c (TransformRGBImage): If colorspace is already an
    RGB type (RGBColorspace, GRAYColorspace, or TransparentColorspace),
    then simply return.  Do \*not\* set image->colorspace to RGBColorspace
    since this potentially loses a valuable setting.

2004-03-10  Peter Boos  <pedib@colorfullife.com>

  - magick/annotate.c (RenderFreetype): If DrawAnnotation is called
    with a string containing only one character and this character is
    not recognized by the TrueType engine, a crash occured due to the
    failure of FT\_Load\_Glyph. The failure caused an uninitialized
    glyph.image pointer to be used by FT\_Done\_Glyph() later in the
    code. The solution is to initialize the glyph.image pointer to
    null.

2004-03-09  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/image.c (QuantumOperatorRegionImage): Properly handle
    over and underflow of arithmetic operators.

  - magick/draw.c (DrawGetFillOpacity): Use fill opacity, and invert
    opacity range so it is 0.0 to 1.0 (was acting like transparency).
    (DrawSetStrokeOpacity): Validate range of stroke\_opacity.
    (DrawSetFillOpacity): Save value to context->fill.opacity and
    validate the range of fill\_opacity.

  - magick/image.c (QuantumOperatorImage): New function to apply an
    arithmetic or bitwise operator to the pixel quantums in an image.
    (QuantumOperatorRegionImage): New function to apply an arithmetic
    or bitwise operator to the pixel quantums in an image region.

  - magick/image.c (IsImagesEqual): Re-implemented using the new
    pixel iteration functions as a proof of concept.

  - magick/pixel\_iterator.h: Added some pixel iteration functions in
    order to make it easier to implement algorithms which only need to
    iteratively access pixels in a region. These functions are not
    part of the API yet so their interface should be considered
    unstable.

  - doc/GNUmakefile: Rename Makefile to GNUmakefile since it relies
    on GNU make extensions.

2004-03-06  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/constitute.c (ConstituteImage): Add support for `T`
    (transparency) and `O` (opacity) map types.  Simplify
    implementation.
    (DispatchImage): Add support for `T` (transparency) and `O`
    (opacity) map types.  Simplify implementation.

  - config/delegates.mgk.in: Quote delegate command names so
    that they can contain embedded spaces.

  - VisualMagick/bin/delegates.mgk: Quote delegate command names so
    that they can contain embedded spaces.

  - coders/tiff.c (WriteTIFFImage): Use the libtiff default endian
    mode when writing TIFF rather than forcing MSB2LSB bit order.
    (ReadTIFFImage): Enable reading in MSB2LSB bit order (better for
    our byte-level parsing), enable memory mapping, and enable strip
    chopping.  Memory mapping and strip chopping are probably enabled
    by default.

  - magick/nt\_base.c (NTSystemComman): Use
    MsgWaitForMultipleObjects() rather than WaitForSingleObject() in
    order to avoid possible deadlock when application code directly or
    indirectly creates windows.

2004-02-28  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/animate.c (XMagickCommand): URL should point to
    http://graphicsmagick.org/.

  - magick/display.c (XMagickCommand): URL should point to
    http://graphicsmagick.org/.

  - magick/image.c (DisplayImages): Changes to fix memory leaks in
    X11 commands had bugs which seriously broke DisplayImages.  Now
    DisplayImages works properly again.

  - magick/xwindow.c (XDestroyResourceInfo): New function to destroy
    XResourceInfo.

  - coders/x.c (WriteXImage): Implement based on DisplayImages().
    (RegisterXImage): Always register X coder, but with read/write
    support disabled if X11 not available.

2004-02-26  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/command.c (ImportImageCommand): Eliminate memory leaks.

  - magick/memory.c (LiberateMemory): Use MagickFreeMemory macro for
    implementation.
    (ReacquireMemory): Use MagickReallocMemory macro for
    implementation.
    (AcquireMemory): Use MagickAllocateMemory for implementation.

2004-02-26  Vladimir  <lvm@integrum.ru>

  - magick/memory.c (CloneMemory): Fixes to compile under Microsoft
    Visual C++ 6.0.

2004-02-25  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/animate.c (XAnimateImages): Memory leak reduction and
    better integration with gm command.

  - magick/display.c (XDisplayImage): Display was leaking memory
    like a sieve.  Now it doesn't.

  - magick/memory.c (CloneMemory): Computation for when it is safe
    to use memcpy() was incorrect.  Use memmove() rather than
    backwards-copy loop.

  - Makefile.am ($(DIST\_ARCHIVE\_SRPM)): Added rules to build a
    source RPM.

  - configure.ac: Search for `buildrpm` or `rpm` programs in order to
    support creating RPM packages on a system which has RPM installed.

  - version.sh (PACKAGE\_VERSION): Changed snapshot release naming so
    that there is only one dash in the name and the snapshot date is
    prefixed with `0` to assure proper directory sorting.  This allows
    snapshot naming to be acceptable to RPM.  The snapshot package
    name is now similar to GraphicsMagick-1.1.020040218.tar.bz2

2004-02-16  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/xwd.c (RegisterXWDImage): Always register XWD, but only
    register read/write methods if it is supported.

  - wand/magick\_wand.c: Synchronized with latest ImageMagick API
    changes.

2004-02-16  Lars Ruben Skyum  <lars.skyum@stibo.com>

  - magick/resize.c (HorizontalFilter): Fixed: do process K channel
    for CMYK images.
    (VerticalFilter): do process K channel for CMYK images.
    
2004-02-15  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/tga.c (ReadTGAImage): Fix matte channel handling. For
    16-bit packets, use integer rather than floating point. Return
    gray images as PseudoClass and set is\_grayscale flag.  Add
    logging.

  - magick/fx.c (WaveImage): Ensure that image is
    DirectClass. Ensure that matte channel is initialized if
    necessary. Include background color in is\_grayscale evaluation.

  - magick/gem.c (GenerateNoise): Scale noise to range of quantum.

2004-02-13  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/jp2.c (WriteJP2Image): Support passing all documented
    Jasper options using -define.

2004-02-13  Peter Boos  <pedib@colorfullife.com>

  - coders/wmf.c (util\_draw\_arc): Fixes to improve handling for pie,
    arc, and chord.  These fixes produce correct output for
    wmf/examples/fjftest.wmf, but it is not known if they are correct
    for all cases.

2004-02-12  Tim Hunter  <cyclists@nc.rr.com>

  - magick/profile.c (SetImageProfile): Bug fixes.

2004-02-11  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/xpm.c (UnregisterXPMImage): Unregister PICON registration.

2004-02-10  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/Makefile.am (label\_la\_LDFLAGS): Add a dependency on the
    math library since floor() is used.

  - wand/magick\_wand.c (MagickRemoveImageProfile): Use C comments in
    C files.

  - magick/constitute.c (MapQuantumType): Fix spurious comma in
    enum definition.

  - magick/blob.c (GetBlobStreamHandler): Apparently return type can
    not be const.

2004-02-09  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - configure.ac: Check for Windows fonts under
    /usr/X11R6/lib/X11/fonts/truetype (XFree86 standard location?).

  - coders/jp2.c (WriteJP2Image): Support providing a compression
    rate value (range 0.0 to 1.0) using command line syntax similar to
    `-define jp2:rate=0.5`.  In Magick++ this option may be accessed
    similar to image.defineValue("jp2","rate","0.5");

  - magick/command.c (DisplayImageCommand): Exit status was inverted
    so `gm display` was returning 1 for successful commands, and 0 for
    failures.
    (AnimateImageCommand): Exit status was inverted so `gm animate`
    was returning 1 for successful commands, and 0 for failures.

2004-02-08  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/utility.h (MagickReallocMemory): Solaris compiler
    complains about cast so remove it.

  - coders/xwd.c (WriteXWDImage): Right-size the pixels buffer and
    tune writer loops a bit.

  - magick/color.h (VerifyColormapIndex): Improve diagnostics.

  - coders/pict.c (WritePICTImage): Eliminate use of uninitialized
    data when writing RGB PICT. Fix OpenBlob assertion when writing
    JPEG PICT.	
    (ReadPICTImage): Validate `tile\_image` colormap indexes rather
    than `image` colormap indexes. Preserve compression attribute from
    tile image.

  - magick/constitute.c (DispatchImage): Don't access image opacity
    channel unless image->matte is True.

2004-02-07  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/png.c (UnregisterPNGImage): Destroy PNG semaphore.

  - magick/image.c (SetImageInfo): Since we don't know what the
    "IMPLICIT" specifier is supposed to do, support for it is
    removed. Perhaps by removing support for it, we will be reminded
    why it exists.

  - magick/magick.c (DestroyMagickInfo): Invoke
    UnregisterStaticModules().
    (GetMagickInfo): Remove registration for "IMPLICIT" format since
    its purpose is presumed bogus.

  - magick/static.c (UnregisterStaticModules): New function so we
    can unregister static modules.

  - coders/plasma.c (UnregisterPLASMAImage): Unregister FRACTAL.

  - coders/icon.c (UnregisterICONImage): Unregister CUR.

  - coders/bmp.c (UnregisterBMPImage): Unregister BMP2 and BMP3.

  - coders/meta.c (UnregisterMETAImage): Unregister APP1JPEG, IPTC,
    IPTCTEXT, IPTCWTEXT, and PICON.

  - coders/miff.c: Check for run-length termination before testing
    memory and only check opacity channel if matte is valid.

  - magick/compress.c: Check for run-length termination before
    testing memory (bad read error).

2004-02-07  Glenn Randers-Pehrson <randeg@alum.rpi.edu>

  - coders/bmp.c: Fix off-by-one error while initializing padding bytes.

  - coders/dib.c: Fix off-by-one error while initializing padding bytes.

  - magick/enhance.c: MaxMap vs MaxRGB error fixed.  Reported by Cristy.

2004-02-04  Glenn Randers-Pehrson <randeg@alum.rpi.edu>

  - magick/compress.c:  avoid a reference to uninitialized data.

2004-02-04  Glenn Randers-Pehrson <randeg@alum.rpi.edu>

  - coders/dib.c: initialize padding bytes.

2004-02-04  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/montage.c (MontageImages): Fix leak of texture image (big
    leak).

2004-02-03  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/tiff.c (WriteTIFFImage): Fix detection of when to use a
    temporary file when writing TIFF.  Writing to TIFF BLOBs was
    broken by the recent changes to make BlobInfo a private type.

  - magick/render.c (DestroyEdge): Use memmove for overlapping copy.

2004-02-03  Glenn Randers-Pehrson <randeg@alum.rpi.edu>

  - coders/bmp.c: initialize padding bytes.

2004-02-02  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/constitute.c (ConstituteImage): Added map support for `P`,
    in order to skip over a pad quantum.
    (DispatchImage): Added map support for `P`, in order to write a pad
    quantum.

  - magick/resize.c (HorizontalFilter): Don't process opacity
    channel unless matte is enabled.
    (VerticalFilter): Don't process opacity channel unless matte is
    enabled.

  - magick/compress.c (Ascii85Initialize): Don't overwrite an
    existing ascii85 allocation.

  - magick/utility.c (Strip): Use `memmove` rather than `memcpy` to
    copy overlapping data.

  - tests/rwfile.c (main): Fix memory leak in test. Only apply size
    if format requires it.

  - tests/rwblob.c (main): Fix memory leak in test. Only apply size
    if format requires it.

  - coders/mono.c (RegisterMONOImage): Mono is a raw format.

  - magick/magic.c (GetMagicInfo): Ensure that magic tests are
    within the range of header data which was read.

2004-02-02  Glenn Randers-Pehrson <randeg@alum.rpi.edu>

  - coders/bmp.c: fix potential use of uninitialized data.

  - coders/png.c: fix potential use of uninitialized data.

2004-01-31  Mike Chiarappa  <mikechiarappa@libero.it>

  - magick/studio.h: Fixed problem related to DLL version of BCBMagick.
    Sometimes was incorrectly checked the presence of VC++ DLL. Thanks 
    very much to Oliver Bertini for bringing this problem to our attention.

  - BCBMagick: added libpng delegate library in both static and DLL
    modes.

  - BCBMagick: removed all unuseful files from CVS.
    
2004-01-31  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/render.c (CloneDrawInfo): Fixed nasty memory leak which
    becomes painfully evident when using Magick++.

  - magick/type.c (ReadTypeConfigureFile): Fix problem with parsing
    <include> directive.

  - configure.ac: The type.mgk generated had a syntax error.

  - magick/effect.c (SpreadImage): Eliminate read from uninitialized
    memory.

  - magick/quantize.c (NodeInfo): Store nodes in a list similar to
    ImageMagick.
    (DestroyCubeInfo): Eliminate a small memory leak.

2004-01-27  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/montage.c (MontageImages): Free thumbnails once they are
    no longer needed (big leak).

  - magick/blob.c (OpenBlob): Ensure that magick array is
    fully initialized, even if the fread() is short.

  - magick/list.c (ImageListToArray): Add a null pointer to the end
    of the image list to serve as a handy list terminator.

  - magick/tempfile.c (DestroyTemporaryFiles): Fix memory leak of
    semaphore.

  - magick/map.c (MagickMapDeallocateMap): Fix memory leak of
    semaphore.

  - coders/png.c (WriteOneJNGImage): Use DestroyBlob.

  - magick/list.c (SyncNextImageInList): Use DestroyBlob.

  - magick/image.c (AllocateNextImage): Use DestroyBlob.
    (DestroyImage): DestroyBlob.

  - coders/wpg.c (ExtractPostscript): Use DestroyBlob.

  - magick/blob.c (DestroyBlob): New function. Similar to
    DestroyBlobInfo except that it requires an Image \* argument and
    zeros the blob pointer. This one is preferred for use over
    DestroyBlobInfo.

2004-01-27  Glenn Randers-Pehrson <randeg@alum.rpi.edu>

  - coders/png.c: Add DestroyBlobInfo() calls to stop memory leak when
    processing JNG datastreams.

2004-01-26  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/utility.h (MagickReallocMemory): Added a cast required to
    make C++ Happy.

  - coders/tiff.c: Adjust for bitstream API function renaming.

  - magick/bit\_stream.h: Rename BitStreamRead() to
    BitStreamMSBRead() to indicate that it reads most significant bytes
    first ("big endian" order).  Rename BitStreamWrite() to
    BitStreamMSBWrite() to indicate that it writes most significant
    bytes first ("big endian" order).

  - wand/magick\_wand.c: Updated to lastest ImageMagick API.

2004-01-26  Mike Chiarappa  <mikechiarappa@libero.it>

  - magick/stream.c: (SetPixelStream) removed "const" from definition of 
    local variable [StreamHandler stream]. Borland C++Builder compiler signal
    error "Cannot modify a const object".
    
2004-01-25  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/tiff.c (TIFFMapBlob): Allow libtiff to access memory
    mapped file (or BLOB in memory) directly.  This provides a small
    performance increase.

  - magick/constitute.c (ReadImage): If a .mpc file is a temporary
    file, then be sure to remove the associated .cache file when
    removing the .mpc file.

  - magick/log.h (LogEventType): ExceptionEventMask now maps to
    WarningEventMask|ErrorEventMask|FatalErrorEventMask so that
    `-debug exception` works again.

  - magick/blob.c (CloseBlob): Allow CloseBlob to be invoked on a
    blob which is not open (in UndefinedStream state).
    (BlobInfo): The definition of BlobInfo is now private to blob.c.
    (StreamType): The StreamType enumeration is now private to blob.c.
    (GetBlobFileHandle): New function to access the blob file handle.
    (GetBlobStreamHandler): New function to access the blob stream
    handler.
    (GetBlobStreamType): This function is removed entirely.
    (BlobIsSeekable): New function to test if SeekBlob will work
    properly for this blob type.
    (GetBlobClosable): New function to test if the blob is allowed to
    be closed by the library (may be an externally provided file
    descriptor).
    (GetBlobTemporary): New function to test if input file is a
    temporary file which is to be removed.
    (SetBlobClosable): New function to support setting the flag which
    keeps the input file from being closed.
    (SetBlobTemporary): New function to support setting the flag which
    indicates that the input file is a temporary file.

  - coders/jpeg.c (ReadJPEGImage): Invoke CloseBlob even if
    blob is in UndefinedStream state.

  - magick/error.h (ThrowReaderException): Ditto.
    (ThrowWriterException): Ditto.
    (ThrowWriterException2): Ditto.
    (ThrowWriterException3): Ditto.

  - magick/tempfile.h (ThrowReaderTemporaryFileException): Ditto.
    (ThrowWriterTemporaryFileException): Ditto.

  - coders/dps.c,coders/jpeg.c, coders/meta.c, coders/mvg.c,
    coders/png.c, coders/tiff.c, magick/constitute.c, magick/stream.c:
    Use new blob accessor functions.

  - magick/cache.c (OpenCache): For Windows, set the sequential
    access flag in all cases.  Maybe it will make a difference.

2004-01-18  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/blob.c (GetConfigureBlob): Don't check Windows registry
    if MagickLibConfigPath or MagickShareConfigPath is defined.

  - magick/locale.c: Use a Unix-style message database for MinGW.

  - rungm.sh.in: Translate environment paths to Windows format when
    running under MinGW.

  - magick/nt\_base.c (mmap): Re-wrote mmap emulation to support
    64-bit file offsets and to support anonymous mapping.
    (msync): A crude emulation of Unix msync().

  - acinclude.m4 (GM\_FUNC\_MMAP\_FILEIO): Change result define from
    HAVE\_MMAP to HAVE\_MMAP\_FILEIO so that it doesn't conflict with
    Autoconf standard definition.

2004-01-17  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/cache.c (OpenCache): While allocating the pixel cache
    from the heap, reserve enough memory to contain a full PseudoClass
    image in order to reduce the chance that there will be a memory
    allocation failure while processing the image. This also avoids
    the possibility that the image pixels will be block-copied to a
    new location due to heap memory fragmentation. If there is
    insufficient heap memory (malloc() fails), then a disk-based pixel
    cache will be used.

  - coders/wpg.c: Backed out Jaroslav Fojtik's patch from 2004-01-13
    because WPG was failing PerlMagick's existing WPG read test.

2004-01-16  Mike Chiarappa  <mikechiarappa@libero.it>

  - BCBMagick: updated to recent Windows delegate libraries.

  - BCBMagick: modified build procedure. Removed all unused directories
    and include files.

  - lcms/include/lcms.h: Modified to achieve BCBMagick compilation.

  - tiff/libtiff/tiffio.h: Modified to achieve BCBMagick compilation

  - ttf/include/freetype/config/ftoption.h: Modified to achieve
    BCBMagick compilation

  - Magick++/lib/Magick++/Include.h: Modified to achieve BCBMagick compilation.
    	
2004-01-13  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/wpg.c: Applied patch from Jaroslav Fojtik to support
    reading the CTM (current transform matrix).  The CTM is not
    applied yet (expect later patch).

2004-01-12  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - coders/sfw.c (ReadSFWImage): Added size\_t cast.

  - coders/msl.c (MSLStartElement): Added size\_t cast.

  - coders/meta.c (convertHTMLcodes): Added size\_t cast.

  - coders/locale.c: Add size\_t casts and update to use memory
    allocation macros.

  - coders/html.c (WriteHTMLImage): Added size\_t cast.

  - magick/utility.h (MagickAllocateMemory): Added size\_t cast.
    (MagickReallocMemory): Added size\_t cast.

  - coders/bmp.c (WriteBMPImage): Added size\_t cast.

  - coders/art.c (ReadARTImage): Use memory allocation macros.

  - VisualMagick/configure/configure.cpp: Update to support library
    .def exports files with Visual C++ 7.0.

  - Updated Windows delegate libraries: LCMS 1.12, FreeType 2.1.5,
    BIG-KIT 1.5, libpng 1.2.5, libwmf 0.2.8.2, and zlib 1.2.1.

  - Verified Windows static and DLL compilation with Visual C++ 6.0.

  - Makefile.am: Update to automake 1.8.2.

  - coders/gif.c (WriteGIFImage): Use ColorMatch rather than
    FuzzyColorMatch when comparing colormap entries.

2004-01-09  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/profile.c: Needed to include "magick/profile.h" in order
    to obtain prototypes.

2004-01-07  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - wand/wandtest.c: Change MagickCloneWand to MagickGetImage since
    the API name changed.

  - wand/pixel\_wand.c: Synchronized with
    latest daily ImageMagick updates.

  - wand/magick\_wand.c (MagickRemoveImageProfile): Synchronized with
    latest daily ImageMagick updates.

  - magick/profile.c (DeleteImageProfile): New method to make
    it easier to destroy an image profile.

  - magick/profile.h: New source file to contain functions for
    dealing with embedded image profiles.

  - magick/profile.c: New source file to contain functions for
    dealing with embedded image profiles.

  - Makefile.am (DISTDIRS): Distribute TclMagick subdirectory.

2004-01-06  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - wand/magick\_wand.c: Ported over the latest ImageMagick Wand API
    updates.  Note that a comment now says that the Wand API will not
    be finished until around 4th quarter of 2004.  This represents a
    1-1/2 year slip from the original estimate!

2004-01-04  Bob Friesenhahn  <bfriesen@simple.dallas.tx.us>

  - magick/image.c (IsImagesEqual): Simplified implementation.

  - magick/magick.c: Removed some unused code.

  - contrib/win32/ATL7/ImageMagickObject/ImageMagickObject.cpp
    (IDispatch): Comment out InitializeSemaphore() so code compiles.

  - libtool.m4: Updated to 2004-01-03 version of CVS libtool. This
    should fix configure problems under AIX and IRIX.

2004-01-03  Glenn Randers-Pehrson <randeg@alum.rpi.edu>

  - coders/sgi.c: opacity channel was lost when writing grayscale
    SGI images.  See bug report in magick-users list.

