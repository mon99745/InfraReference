chcp 65001
@REM usage: deploy demo test- C:\deploy

call setenv

set BUILD_PATH=build\libs

set MODULE_NAME=%1
if "%ROOT_DIR%" == "" (set ROOT_DIR=C:\deploy)
set TARGET_DIR=%ROOT_DIR%

md %TARGET_DIR%\war
copy %TARGET_DIR%\%MODULE_NAME%* %TARGET_DIR%\war\%TODAY%_%TOTIME%*
copy %MODULE_NAME%\%BUILD_PATH%\*.* %TARGET_DIR%
