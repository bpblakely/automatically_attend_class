:start
choice /c yn /t 180 /d y /m "Press y to Exit Zoom or n to Not Exit Zoom. 3 minutes to respond before terminating Zoom"
IF %errorlevel% == 1 GOTO kill
IF %errorlevel% == 2 GOTO sleep
:kill
taskkill /im zoom.exe /F
GOTO end
:sleep
echo Waiting 5 minutes. Press CTRL-C then select n to exit wait and go back to choice prompt
timeout /t 300 /nobreak
GOTO start
:end
exit