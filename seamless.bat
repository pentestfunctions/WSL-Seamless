@echo off

cls

:: Check if config.xlaunch exists, create it if not
if not exist "config.xlaunch" (
    echo Creating config.xlaunch file...
    (
    echo ^<?xml version="1.0" encoding="UTF-8"?^>
    echo ^<XLaunch WindowMode="MultiWindow" ClientMode="NoClient" LocalClient="False" Display="-1" LocalProgram="xcalc" RemoteProgram="xterm" RemotePassword="" PrivateKey="" RemoteHost="" RemoteUser="" XDMCPHost="" XDMCPBroadcast="False" XDMCPIndirect="False" Clipboard="True" ClipboardPrimary="True" ExtraParams="" Wgl="True" DisableAC="True" XDMCPTerminate="False"/^>
    ) > config.xlaunch
) else (
    echo config.xlaunch file already exists.
)

:: Check if connector.bat exists, create it if not
if not exist "connector.bat" (
    echo Creating config.xlaunch file...
    (
    echo @echo off
    echo wsl -d kali-linux -e bash -c "kex --sl -s; while true; do pkill -9 xfdesktop; sleep 1; done"
    ) > connector.bat
) else (
    echo connector.bat file already exists.
)

echo Stopping any VcXsrv Windows X Server processes...

:: Use tasklist to find vcxsrv.exe processes and taskkill to terminate them
for /f "tokens=2" %%i in ('tasklist /NH /FI "IMAGENAME eq vcxsrv.exe"') do (
    echo Found VcXsrv process with PID %%i. Terminating...
    taskkill /PID %%i /F
)

echo Stopping any Kex processes in Kali Linux...
wsl -d kali-linux pkill -f kex

:: Run the config.xlaunch file
echo Starting XLaunch from config.xlaunch...
start "" "config.xlaunch"

:: Run the WSL command
echo Starting Kali Linux Kex...
start "" "connector.bat"

:: Wait for a moment to ensure the script has started
timeout /t 10 /nobreak >nul

del "connector.bat"
del "config.xlaunch"
