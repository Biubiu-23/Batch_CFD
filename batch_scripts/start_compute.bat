
set WORK_DIR=%1

for /d %%f in (*) do ( 
    echo %%f
    start cmd /k "cd/d .\%%f && run.bat"
    timeout /nobreak /t 2
)
@REM for /d %%i in (.\) do (
    
@REM )
@REM start cmd /k echo Hello,World!