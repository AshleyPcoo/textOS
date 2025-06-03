@echo off
title Starting textOS...
setlocal enabledelayedexpansion
reg query "HKCU\Software\textOS" > nul 2>&1
if %errorlevel% equ 0 (
    for /f "tokens=2*" %%a in ('reg query "HKCU\Software\textOS" /v firstrun ^| find "firstrun"') do (
        set "firstrun_value=%%b"
    )
    if !firstrun_value! equ 1 (
        goto app.textos.home
    )
)
:app.textos.setup
set text-version=v1
cls
title Welcome to textOS Setup.
echo Hi there. Thanks for deciding to use textOS!
echo.
echo What do we need to do to continue with Setup?
echo 1. Show you the Pcoo Group TOS for this product. 
pause
cls
title textOS's TOS.
powershell "irm https://raw.githubusercontent.com/PcooGroup/OnlineServices/refs/heads/main/ashley/textOS/tos.txt"
echo.
echo If you do not agree with the TOS, please close textOS now. By pressing any key from this point, you agree to the TOS shown above.
pause
reg add "HKCU\Software\textOS" /v firstrun /t REG_SZ /d "1" /f
goto app.textos.home
:app.textos.home
cls
title %username%'s HOME.
powershell "irm https://raw.githubusercontent.com/PcooGroup/OnlineServices/refs/heads/main/ashley/textOS/messageboard-home.txt"
powershell "irm https://raw.githubusercontent.com/PcooGroup/OnlineServices/refs/heads/main/ashley/textOS/home-ad.txt"
echo.
echo Press 1 and then enter to open System Settings.
echo Press 2 and then enter to open Message Board.
echo Press 3 and then enter to open File Manager.
echo Press 4 and then enter to check for updates.
echo Type 'exit' and then enter to quit textOS.
set /p function.textos.home.option=
if %function.textos.home.option% == 1 goto app.textos.settings
if %function.textos.home.option% == 2 goto app.textos.messages
if %function.textos.home.option% == 3 goto app.textos.filemanager
if %function.textos.home.option% == 4 goto app.textos.update
if %function.textos.settings.option% == exit exit
:app.textos.settings
cls
title textOS Settings
echo Welcome to Settings.
echo You're currently running textOS %text-version%.
echo.
echo Press 1 and then enter to enter setup.
echo Press 2 and then enter for Personalisation.
echo Press 3 and then enter for the issue tracker.
echo Press 4 and then enter to return to the HOME Menu.
set /p function.textos.settings.option=
if %function.textos.settings.option% == 1 goto app.textos.setup
if %function.textos.settings.option% == 2 goto app.textos.persetup
if %function.textos.settings.option% == 3 goto app.textos.issues
if %function.textos.settings.option% == 4 goto app.textos.home
:app.textos.persetup
cls
title Personalise your install of textos.
echo Type 1 and then enter to change your system colour to Default.
echo Type 2 and then enter to change your system colour to Green Text on Black.
echo Type 3 and then enter to change your system colour to Aqua Text on Black.
echo Type 4 and then enter to change your system colour to Red Text on Black.
echo Type 5 and then enter to change your system colour to Purple Text on Black.
echo Type 6 and then enter to change your system colour to Yellow Text on Black
echo Type 7 and then enter to change your system colour to Light Mode (Black Text on White).
echo Type 8 and then enter to change your system colour to Chill Mode.
set /p function.textos.persetup.option=
if %function.textos.persetup.option% == 1 goto app.textos.persetup.default
if %function.textos.persetup.option% == 2 goto app.textos.persetup.gtob
if %function.textos.persetup.option% == 3 goto app.textos.persetup.atob
if %function.textos.persetup.option% == 4 goto app.textos.persetup.rtob
if %function.textos.persetup.option% == 5 goto app.textos.persetup.ptob
if %function.textos.persetup.option% == 6 goto app.textos.persetup.ytob
if %function.textos.persetup.option% == 7 goto app.textos.persetup.btow
if %function.textos.persetup.option% == 8 goto app.textos.persetup.chl
:app.textos.persetup.default
color 07
goto app.textos.home
:app.textos.persetup.gtob
color 0a
goto app.textos.home
:app.textos.persetup.atob
color 0b
goto app.textos.home
:app.textos.persetup.rtob
color 0c
goto app.textos.home
:app.textos.persetup.ptob
color 0d
goto app.textos.home
:app.textos.persetup.ytob
color 0e
goto app.textos.home
:app.textos.persetup.wtob
color f0
goto app.textos.home
:app.textos.persetup.chl
echo Warning: Chill Mode is very bright, please make sure you are in a well-lit area before using it. 
echo Type '1' if you would like to continue to use this theme, or type '2' to return to the HOME menu.
set /p function.textos.persetup.chl.option=
if %function.textos.persetup.chl.option% == 1 goto app.textos.persetup.chl.on
if %function.textos.persetup.chl.option% == 2 goto app.textos.home
:app.textos.persetup.chl.on
color ed
goto app.textos.home
:app.textos.issues
cls
title Issue Tracker.
echo Issue Tracker
echo Press enter to launch the issue tracker.
pause
echo Launching the issue tracker. 
start "" https://github.com/AshleyPcoo/textOS/issues
goto app.textos.home
:app.textos.messages
cls
echo textOS Message Board:
echo.
powershell "irm https://raw.githubusercontent.com/PcooGroup/OnlineServices/refs/heads/main/ashley/textOS/messageboard.txt"
echo.
echo Press any key to return to the HOME menu.
pause
goto app.textos.home
:app.textos.filemanager
cls
title File Manager
echo Type the full path of the directory you would like to view (including the drive letter).
set /p functiondir=
cd %functiondir%
goto app.textos.foldercontents
:app.textos.foldercontents
cls
title File Manager
echo Contents of %functiondir%.
dir
cd ../
echo.
echo Type "home" to go back to the HOME Menu.
echo Type "changedir" to change the directory you would like to view.
echo Type "open" to open a file.
echo Type "music" to initiate the textOS music player.
echo Type "folder" to make a directory.
echo Type "file" to make a file.
set /p fileoption=
if %fileoption% == home goto app.textos.home
if %fileoption% == changedir goto app.textos.filemanager
if %fileoption% == open goto app.textos.openapp
if %fileoption% == music goto app.textos.openmusic
if %fileoption% == folder goto app.textos.mkdir
if %fileoption% == file goto app.textos.mkfile
:app.textos.openapp
cls
title File Manager
cd %functiondir%
echo Please type the name of the file (with the extension) in %functiondir%.
set /p functionopenapp=
start "" %functionopenapp%
goto app.textos.filemanager
:app.textos.openmusic
cls
title Music Player
cd %functiondir%
echo Please type the name of the music file (with the extension) in %functiondir%.
set /p functionopenmusic=
set "vbs=%temp%\%~n0.vbs"
echo Set Sound = CreateObject("WMPlayer.OCX.7"^) >"%vbs%"
echo Sound.URL = "%functionopenmusic%" >>"%vbs%"
echo Sound.Controls.play >>"%vbs%"
echo do while Sound.currentmedia.duration = 0 >>"%vbs%"
echo wscript.sleep 100 >>"%vbs%"
echo loop >>"%vbs%"
echo wscript.sleep (int (Sound.currentmedia.duration^)+1^)*1000 >>"%vbs%"
start /min "" "%vbs%"
pause
taskkill /im "wscript.exe" /f
goto app.textos.foldercontents
:app.textos.mkdir
cls
title File Manager
cd %functiondir%
echo Please type the name of the directory you would like to make in %functiondir%.
set /p functiondir2=
mkdir %functiondir2%
echo Created!
pause
goto app.textos.filemanager
:app.textos.mkfile
cls
title File Manager
cd %functiondir%
echo Please type the name of the file you would like to make in %functiondir%.
set /p functionfile=
powershell "New-Item %functiondir%/%functionfile% -erroraction 'silentlycontinue'"
echo File "%functionfile%" created!
pause
goto app.textos.filemanager
:app.textos.update
cls
title textos Update
echo You are currently running version:
echo %text-version%
echo.
echo The latest version is:
powershell "irm https://raw.githubusercontent.com/PcooGroup/OnlineServices/refs/heads/main/ashley/textOS/latestversion.txt"
echo.
echo Whats new in the latest version:
powershell "irm https://raw.githubusercontent.com/PcooGroup/OnlineServices/refs/heads/main/ashley/textOS/latestversiondesc.txt"
echo.
pause
goto app.textos.home