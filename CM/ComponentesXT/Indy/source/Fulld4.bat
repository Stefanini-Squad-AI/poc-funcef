@echo off
if exist setenv.bat call setenv.bat
computil SetupD4
if exist setenv.bat call setenv.bat
call clean.bat
if not exist ..\D4\*.* md ..\D4 >nul

REM ***************************************************
REM Compile Runtime Package Indy40
REM ***************************************************
%NDD4%\bin\dcc32.exe Indy40.dpk /b /h /w /N..\D4 /LE..\D4 /LN..\D4 -$d-l-n+p+r-s-t-w- %1 %2 %3
if errorlevel 1 goto enderror
copy ..\D4\Indy40.bpl %NDWINSYS% >nul

REM ***************************************************
REM Compile Design-time Package dclIndy40
REM ***************************************************
%NDD4%\bin\dcc32.exe dclIndy40.dpk /b /h /w /N..\D4 /LE..\D4 /LN..\D4 /L..\D4\Indy40.dcp /U..\D4 -$d-l-n+p+r-s-t-w- %1 %2 %3
if errorlevel 1 goto enderror

REM ***************************************************
REM Clean-up
REM ***************************************************
del ..\D4\dclIndy40.dcu >nul
del ..\D4\dclIndy40.dcp >nul
del ..\D4\Indy40.dcu >nul
del ..\D4\Indy40.bpl >nul
del ..\D4\IdAbout.dcu >nul
del ..\D4\IdDsnPropEdBinding.dcu >nul
del ..\D4\IdDsnRegister.dcu >nul
del ..\D4\IdRegister.dcu >nul
goto endok
:enderror
call clean
echo Error!
:endok