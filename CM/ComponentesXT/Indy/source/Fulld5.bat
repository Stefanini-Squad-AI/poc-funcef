@echo off
if exist setenv.bat call setenv.bat
computil SetupD5
if exist setenv.bat call setenv.bat
call clean.bat
if not exist ..\D5\*.* md ..\D5 >nul

REM ***************************************************
REM Compile Runtime Package Indy50
REM ***************************************************
%NDD5%\bin\dcc32.exe Indy50.dpk /b /h /w /N..\D5 /LE..\D5 /LN..\D5 -$d-l-n+p+r-s-t-w- %1 %2 %3
if errorlevel 1 goto enderror
copy ..\D5\Indy50.bpl %NDWINSYS% >nul

REM ***************************************************
REM Compile Design-time Package dclIndy50
REM ***************************************************
%NDD5%\bin\dcc32.exe dclIndy50.dpk /b /h /w /N..\D5 /LE..\D5 /LN..\D5 /L..\D5\Indy50.dcp /U..\D5 -$d-l-n+p+r-s-t-w- %1 %2 %3
if errorlevel 1 goto enderror

REM ***************************************************
REM Clean-up
REM ***************************************************
del ..\D5\dclIndy50.dcu >nul
del ..\D5\dclIndy50.dcp >nul
del ..\D5\Indy50.dcu >nul
del ..\D5\Indy50.bpl >nul
del ..\D5\IdAbout.dcu >nul
del ..\D5\IdDsnPropEdBinding.dcu >nul
del ..\D5\IdDsnRegister.dcu >nul
del ..\D5\IdRegister.dcu >nul
goto endok
:enderror
call clean
echo Error!
:endok