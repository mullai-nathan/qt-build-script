REM Set up Microsoft Visual Studio 2019, where <arch> is amd64, x86, etc.
SET VS_ENVIRONMENT="C:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Auxiliary\Build\vcvarsall.bat" x64

set "PERL_ROOT=C:\PERL\perl\bin"

set PATH=%PERL_ROOT%;%PATH%


rem Check if the tools are in PATH
where perl.exe
where python.exe
where cmake.exe
where ninja.exe


SET SRC_DIR="C:\Users\Mullai.Nathan\AppData\Local\Programs\qt-everywhere-src-6.4.2"
SET BUILD_DIR="C:\Qt\qt-everywhere-src-6.4.2-build\"
SET INSTALL_DIR="C:\Qt\Qt6.4.2-static"
SET CONFIGURE_OPTIONS= -opensource -platform win32-msvc -opengl desktop -static -static-runtime -nomake examples -nomake tests -openssl -openssl-linked -I C:/OpenSSL/include -L C:/OpenSSL/lib ^
  -skip qt3d -skip qt5compat -skip qtactiveqt -skip qtcharts -skip qtcoap -skip qtconnectivity ^
  -skip qtdatavis3d -skip qtdoc -skip qtlottie -skip qtmqtt -skip qtnetworkauth -skip qtopcua ^
  -skip qtserialport -skip qtpositioning -skip qtquicktimeline -skip qtquick3d -skip qtremoteobjects ^
  -skip qtscxml -skip qtsensors -skip qtserialbus -skip qtvirtualkeyboard -skip qtwayland ^
  -skip qtwebchannel -skip qtwebengine -skip qtwebview -skip qtquick3dphysics -skip qtspeech -skip qthttpserver ^

rmdir %INSTALL_DIR%% /Q /S
rmdir %BUILD_DIR% /Q /S

call %VS_ENVIRONMENT%
mkdir %BUILD_DIR%
mkdir %INSTALL_DIR%

cd %BUILD_DIR%
call %SRC_DIR%\configure -prefix %INSTALL_DIR% %CONFIGURE_OPTIONS%
pause


cmake --build . --parallel
pause
cmake --install .
pause
