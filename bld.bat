mkdir build
cd build

REM Configure step
if "%ARCH%" == "32" set CMAKE_GENERATOR="Visual Studio 12 2013"
if "%ARCH%" == "64" set CMAKE_GENERATOR="Visual Studio 12 2013 Win64"

cmake -G %CMAKE_GENERATOR% -DCMAKE_BUILD_TYPE="Release" -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% -DCMAKE_INSTALL_PREFIX:PATH=%LIBRARY_PREFIX% %SRC_DIR%
if errorlevel 1 exit 1

REM Build step
devenv %PKG_NAME%.sln /Build "Release"
if errorlevel 1 exit 1

REM Install step
devenv %PKG_NAME%.sln /Build "Release" /Project INSTALL
if errorlevel 1 exit 1
