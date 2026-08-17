@echo off
if exist setenv.bat call setenv.bat
computil SetupC5
if exist setenv.bat call setenv.bat
call clean.bat
if not exist ..\C5\*.* md ..\C5 >nul
call clean.bat ..\C5\

REM ***************************************************
REM Compile Runtime Package Indy50
REM ***************************************************
%NDC5%\bin\dcc32.exe Indy50.dpk /DBCB /B /H /W /JPHN /LE..\C5 /LN..\C5 /N..\C5 -$d-l-n+p+r-s-t-w-y- %1 %2 %3
if errorlevel 1 goto enderror
copy *.obj ..\C5 >nul
del *.obj >nul
copy *.hpp ..\C5 >nul
del *.hpp >nul
copy Indy50.bpi ..\C5 >nul
del Indy50.bpi >nul
copy Indy50.lsp ..\C5 >nul
del Indy50.lsp >nul
%NDC5%\bin\dcc32.exe Indy50.dpk /DBCB /H /W /LE..\C5 /LN..\C5 /N..\C5 -$d-l-n+p+r-s-t-w-y- %1 %2 %3
if errorlevel 1 goto enderror
copy ..\C5\Indy50.bpl %NDWINSYS% >nul

REM ***************************************************
REM Create .LIB file
REM ***************************************************
echo Creating Indy50.LIB file, please wait...
for %%9 in (..\C5\*.obj) do %NDC5%\bin\tlib.exe ..\C5\Indy50.lib +%%9 >nul
del ..\C5\Indy50.bak >nul

REM ***************************************************
REM Compile Design-time Package dclIndy50
REM ***************************************************
%NDC5%\bin\dcc32.exe dclIndy50.dpk /DBCB /H /W /N..\C5 /LE..\C5 /LN..\C5 /L..\C5\Indy50.dcp /U..\C5 -$d-l-n+p+r-s-t-w-y- %1 %2 %3
if errorlevel 1 goto enderror

REM ***************************************************
REM Clean-up
REM ***************************************************
del ..\C5\dclIndy50.dcu >nul
del ..\C5\dclIndy50.dcp >nul
del ..\C5\Indy50.dcu >nul
del ..\C5\Indy50.bpl >nul

goto endok
:enderror
call clean
echo Error!
:endok