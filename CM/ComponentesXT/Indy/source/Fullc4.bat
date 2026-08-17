@echo off
if exist setenv.bat call setenv.bat
computil SetupC4
if exist setenv.bat call setenv.bat
call clean.bat
if not exist ..\C4\*.* md ..\C4 >nul
call clean.bat ..\C4\

REM ***************************************************
REM Compile Runtime Package Indy40
REM ***************************************************
%NDC4%\bin\dcc32.exe Indy40.dpk /DBCB /B /H /W /JPHN /LE..\C4 /LN..\C4 /N..\C4 -$d-l-n+p+r-s-t-w-y- %1 %2 %3
if errorlevel 1 goto enderror
copy *.obj ..\C4 >nul
del *.obj >nul
copy *.hpp ..\C4 >nul
del *.hpp >nul
copy Indy40.bpi ..\C4 >nul
del Indy40.bpi >nul
copy Indy40.lsp ..\C4 >nul
del Indy40.lsp >nul
%NDC4%\bin\dcc32.exe Indy40.dpk /DBCB /H /W /LE..\C4 /LN..\C4 /N..\C4 -$d-l-n+p+r-s-t-w-y- %1 %2 %3
if errorlevel 1 goto enderror
copy ..\C4\Indy40.bpl %NDWINSYS% >nul

REM ***************************************************
REM Create .LIB file
REM ***************************************************
echo Creating Indy40.LIB file, please wait...
for %%9 in (..\C4\*.obj) do %NDC4%\bin\tlib.exe ..\C4\Indy40.lib +%%9 >nul
del ..\C4\Indy40.bak >nul

REM ***************************************************
REM Compile Design-time Package RPDT30
REM ***************************************************
%NDC4%\bin\dcc32.exe dclIndy40.dpk /DBCB /H /W /N..\C4 /LE..\C4 /LN..\C4 /L..\C4\Indy40.dcp /U..\C4 -$d-l-n+p+r-s-t-w-y- %1 %2 %3
if errorlevel 1 goto enderror

REM ***************************************************
REM Clean-up
REM ***************************************************
del ..\C4\dclIndy40.dcu >nul
del ..\C4\dclIndy40.dcp >nul
del ..\C4\Indy40.dcu >nul
del ..\C4\Indy40.bpl >nul

goto endok
:enderror
call clean
echo Error!
:endok