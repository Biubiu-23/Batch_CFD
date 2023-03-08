set WORK_DIR=%1

for /d %%f in (*) do ( 
    echo %%f
    cd/d .\%%f && infout1r.exe
    cd ..
    timeout /nobreak /t 2
)