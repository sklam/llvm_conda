if "%ARCH%"=="32" (set MASM_CMD=ml) else (set MASM_CMD=ml64)

mkdir build
cd build

REM Configure step
set CMAKE_CUSTOM=-DCMAKE_ASM_MASM_COMPILER=%MASM_CMD% -DLLVM_INCLUDE_TESTS=OFF
cmake -G "%CMAKE_GENERATOR%" -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% -DCMAKE_INSTALL_PREFIX:PATH=%LIBRARY_PREFIX% %CMAKE_CUSTOM% %SRC_DIR%
if errorlevel 1 exit 1

REM Build step
devenv %PKG_NAME%.sln /Build "%RELEASE_TARGET%"
if errorlevel 1 exit 1

REM Install step
devenv %PKG_NAME%.sln /Build "%RELEASE_TARGET%" /Project INSTALL
if errorlevel 1 exit 1
