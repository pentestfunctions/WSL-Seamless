# WSL-Seamless
Seamless mode integration for WSL


Steps to use:
1. Ensure you have installed kali-linux in WSL on windows
wsl --install --distribution kali-linux

Ensure you have activated it by typing in wsl and setting a password and username

Also ensure that you set kali-linux as your default if you have other distros installed such as Ubuntu
wsl --set-default kali-linux


Now simply download the .bat file 
https://github.com/pentestfunctions/WSL-Seamless/blob/main/seamless.bat

You can save it to your desktop or wherever you need

Ensure you have installed 
https://ixpeering.dl.sourceforge.net/project/vcxsrv/vcxsrv/1.20.14.0/vcxsrv-64.1.20.14.0.installer.exe

Also make sure you allow it through your firewall by pressing the windows key, firewall and network protection, allow an app through firewall - selecting "Change settings", then clicking allow another app. Then navigate to where you installed the vcxsrv file (by default it will be C:\Program Files\VcXsrv - and choose the vcxsrv file to allow through firewall. Also choose the tickbox for public/private for what you need.

Now simply double click the .bat file whenever you want to start/restart it.

Right click the menu bar and choose Panel, Panel preferences, and adjust the length slider to make it fit nicer, also make sure you disable 'lock panel' so you can move it around.
Any  other icons you wish to remove, can be removed in the Items tab in the panel.
