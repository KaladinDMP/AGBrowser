@echo off
setlocal enableExtensions disableDelayedExpansion
echo                             ^.______  .______  ._____ ___ ._____  .______  .______  .____  ___
echo                             ^:   _   \: __   \ :     V   ^|:     \ : _._  \ : _._  \ :    \ ^|  ^|  
echo                             ^|  ^|_^|  ^|^|  \____^|^|   \  /  ^|^|    __^|^|^|   ^:  ^|^|^|   ^:  ^|^|  ^|\ \^|  ^|
echo                             ^|   ^:   ^|^|   :  \ ^|   ^|\/   ^|^|   /  ^|^|^:_._^|  ^|^|^:_._^|  ^|^|  ^| \ \  ^|
echo                             ^|___^|   ^|^|   ^|___\^|___^| ^|   ^|^|      ^|^| .____/ ^| .____/ ^|__^|  \   ^|
echo                                 ^|___^|^|___^|          ^|___^|: _____^|:/       :/          DMP \__^|
echo                            :----------------PC/PCVR------:/------:--------:-----------------:
echo. 

set /p cstm=Type in any needed arguments or just hit enter for none (EG:"-VR -Windowed", no quotes): 
echo.
echo.
echo Arguments set!
echo.
echo.
TIMEOUT /T 3

echo "C:\Program Files\Virtual Desktop Streamer\VirtualDesktop.Streamer.exe" "%~nx1" ^%cstm% > VD.bat
goto :end

:end
endlocal
