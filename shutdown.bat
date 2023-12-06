@REM usage: shutdown demo
call setenv

FOR /F "tokens=5 delims= " %%P IN ('netstat -nao ^| find "LISTENING" ^| find "8080"') DO (
    set "PID=%%P"
)

IF DEFINED PID (
    echo Stopping the application with PID: %PID%
    taskkill /F /PID %PID%
) ELSE (
    echo No application is running 8080
)
