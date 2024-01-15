@echo off

set "downloadURL1=https://github.com/KaladinDMP/AGBrowser/raw/main/ARMGDDNBrowser.zip.001"
set "downloadURL2=https://github.com/KaladinDMP/AGBrowser/raw/main/ARMGDDNBrowser.zip.002"
set "fileName=ARMGDDNBrowser.exe"

REM If you know enough to read this bat and understand it you dont need it just download those two files above from downloadurl1 and downloadurl2 and extract them and run the installer manually. This is just for the idiots that i cant trust to not fuck up a wet dream. Love DMP

powershell -command "$PSVersionTable.PSVersion.Major" > temp_version.txt
set /p powershell_version=<temp_version.txt
del temp_version.txt

if %powershell_version% LSS 5 (
    echo This script requires PowerShell 5.1 or later to run properly.
    echo Please update your PowerShell version and try again.
    pause
    exit /b
)

powershell -command "if((Get-ExecutionPolicy) -ne 'RemoteSigned') { Set-ExecutionPolicy RemoteSigned -Scope Process }"

echo Fabricating %fileName% out of nano bots...
powershell -command "(New-Object Net.WebClient).DownloadFile('%downloadURL1%', 'ARMGDDNBrowser.zip.001')"
powershell -command "(New-Object Net.WebClient).DownloadFile('%downloadURL2%', 'ARMGDDNBrowser.zip.002')"

echo Combining downloaded files...
copy /B "ARMGDDNBrowser.zip.001" + "ARMGDDNBrowser.zip.002" "ARMGDDNBrowser.zip"

echo Extracting the files from the zip archive...
powershell -command "Expand-Archive -Path 'ARMGDDNBrowser.zip' -DestinationPath '.' -Force"

if not exist "%fileName%" (
    echo Error: Failed to extract %fileName% from the ZIP archive.
    echo Please ensure that the downloaded files are complete and not corrupted.
    pause
    exit /b
)

CLS
echo If you say 'No' the bat will silently autoinstall to "C:\ARMGDDN Browser"
echo.
set /p installChoice=Do you want to install %fileName% yourself? (y/n): 
if /i "%installChoice%"=="yes" goto SkipInstallation
if /i "%installChoice%"=="y" goto SkipInstallation
if /i "%installChoice%"=="no" goto ContinueInstallation
if /i "%installChoice%"=="n" goto ContinueInstallation

echo Invalid input. Please enter 'yes', 'y', 'no', or 'n'.
PAUSE
exit /b

:SkipInstallation
CLS
echo Launching installer and deleting downloaded files...
del "ARMGDDNBrowser.zip.001"
del "ARMGDDNBrowser.zip.002"
del "ARMGDDNBrowser.zip"
start "" /wait ".\%fileName%"

goto EOF

:ContinueInstallation
CLS
echo Silently installing "%fileName%" to "C:\ARMGDDN Browser"
start "" /wait ".\%fileName%" /S

echo Installed! Deleting downloaded files...
del "ARMGDDNBrowser.zip.001"
del "ARMGDDNBrowser.zip.002"
del "ARMGDDNBrowser.zip"
goto EOF

:EOF
del "ARMGDDNBrowser.exe"
Echo ARMGDDN Browser has been installed!
Echo Launch from the desktop shortcut to update the config
del "%~f0"
