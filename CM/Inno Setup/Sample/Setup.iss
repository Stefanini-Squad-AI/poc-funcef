;This script is used to create the My Inno Setup Extensions installer.
;It is intended as a sample script for some of the new features and will
;probably not compile on your system because of missing files.

[Setup]
AppName=My Inno Setup Extensions
AppVerName=My Inno Setup Extensions 1.3.25
AppVersion=1.3.25
AppMutex=InnoSetupExtensionsCompilerAppMutex
AppPublisher=Martijn Laan
AppPublisherURL=http://www.wintax.nl/isx
AppSupportURL=http://www.wintax.nl/isx
AppUpdatesURL=http://www.wintax.nl/isx
AppCopyright=My Inno Setup Extensions, copyright © 2000 Martijn Laan
DefaultDirName={pf}\My Inno Setup Extensions
DefaultGroupName=My Inno Setup Extensions
CompressLevel=9
InfoBeforeFile=isx.rtf
OutputBaseFilename=Isxsetup
OutputDir=d:\www\www.wintax.nl\isx\new
UninstallDisplayIcon={app}\compil32.exe
AllowNoIcons=yes
WizardImageFile=compiler:WizModernImage2.bmp
WizardSmallImageFile=compiler:WizModernSmallImage2.bmp

[Messages]
DiskSpaceMBLabel=The program requires at least [kb] KB of disk space.
ComponentsDiskSpaceMBLabel=Current selection requires at least [kb] KB of disk space.

[Types]
Name: full; Description: Full installation
Name: compact; Description: Compact installation
Name: custom; Description: Custom installation; Flags: iscustom

[Components]
Name: main; Description: My Inno Setup Extensions application files; Types: full compact custom; Flags: fixed
Name: docs; Description: My Inno Setup Extensions documentation; Types: full compact
Name: sample; Description: My Inno Setup Extensions sample scripts; Types: full compact
;Name: source; Description: My Inno Setup Extensions source; Types: full
Name: classic; Description: Classic Inno Setup wizard style support; Types: full; Flags: disablenouninstallwarning
;Name: "isl"; Description: "Additional language files"; Types: full

[Tasks]
Name: desktopicon; Description: "Create a &desktop icon"; GroupDescription: "Additional icons:"; Components: main
Name: quicklaunchicon; Description: "Create a &Quick Launch icon"; GroupDescription: "Additional icons:"; Components: main; Flags: unchecked

[Dirs]
Name: {app}\Sample; Components: sample
;Name: {app}\Src; Components: source
;Name: "{app}\Languages"; Components: isl

[Files]
Source: Compil32.exe; DestDir: {app}; CopyMode: alwaysoverwrite; Components: main
Source: Iscmplr.dll; DestDir: {app}; CopyMode: alwaysoverwrite; Components: main
Source: Default.isl; DestDir: {app}; CopyMode: alwaysoverwrite; Components: main
Source: DefaultIsx.isl; DestDir: {app}; CopyMode: alwaysoverwrite; Components: main
Source: Wiz*.bmp; DestDir: {app}; CopyMode: alwaysoverwrite; Components: main
Source: SetupLdr.e32; DestDir: {app}; CopyMode: alwaysoverwrite; Components: main
Source: Uninst.e32; DestDir: {app}; CopyMode: alwaysoverwrite; Components: main
Source: Regsvr.e32; DestDir: {app}; CopyMode: alwaysoverwrite; Components: main
Source: SetupModern.e32; DestDir: {app}; CopyMode: alwaysoverwrite; Components: main
Source: isetup.hlp; DestDir: {app}; CopyMode: alwaysoverwrite; Components: docs
Source: isetup.cnt; DestDir: {app}; CopyMode: alwaysoverwrite; Components: docs
Source: isfaq.htm; DestDir: {app}; CopyMode: alwaysoverwrite; Components: docs
Source: howto.html; DestName: isxhowto.htm; DestDir: {app}; CopyMode: alwaysoverwrite; Components: docs
Source: scripthowto.html; DestName: isxscripthowto.htm; DestDir: {app}; CopyMode: alwaysoverwrite; Components: docs
Source: isx.gif; DestDir: {app}; CopyMode: alwaysoverwrite; Components: docs
Source: Samples\*.*; DestDir: {app}\Sample; CopyMode: alwaysoverwrite; Components: sample
Source: Setup.iss; DestDir: {app}\Sample; CopyMode: alwaysoverwrite; Components: sample
;Source: Src\*.*; DestDir: {app}\Src; CopyMode: alwaysoverwrite; Components: source
Source: SetupClassic.e32; DestDir: {app}; CopyMode: alwaysoverwrite; Components: classic
;Source: "Isl\*.isl"; DestDir: "{app}\Languages"; CopyMode: alwaysoverwrite; Components: isl
Source: license.txt; DestDir: {app}; CopyMode: alwaysoverwrite

[Icons]
Name: {group}\Inno Setup with My Inno Setup Extensions; Filename: {app}\Compil32.exe; Components: main
Name: {group}\My Inno Setup Extensions sample script; Filename: {app}\Compil32.exe; Parameters: """{app}\Sample\Setup.iss"""; IconFilename: {app}\Compil32.exe; IconIndex: 1; Components: sample
Name: {userdesktop}\Inno Setup with My Inno Setup Extensions; Filename: {app}\Compil32.exe; Components: main; Tasks: desktopicon
Name: {userappdata}\Microsoft\Internet Explorer\Quick Launch\Inno Setup with My Inno Setup Extensions; Filename: {app}\Compil32.exe; Components: main; Tasks: quicklaunchicon

[Run]
Filename: {app}\Compil32.exe; Description: Launch the My Inno Setup Extensions compiler; Flags: nowait postinstall skipifsilent
Filename: {app}\Isxhowto.htm; Description: View the 'how to' instructions; Components: docs; Flags: shellexec postinstall unchecked skipifsilent

[InstallDelete]
;Obsolete files
Type: files; Name: {app}\Setup.e32
Type: files; Name: {app}\WizImage.bmp
;SetupClassic.e32 is optional, so delete old version to avoid compatibility problems
Type: files; Name: {app}\SetupClassic.e32

;Type: files; Name: {app}\Src\CmnFunc2.pas
;Type: files; Name: {app}\Src\Setup.dpr
;Type: files; Name: {app}\Src\Wizard.pas
;Type: files; Name: {app}\Src\Wizard.dfm
;Type: files; Name: {app}\Src\RichEditViewer.pas
