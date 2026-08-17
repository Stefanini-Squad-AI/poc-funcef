; My Inno Setup Extensions messages - Default/English

; Important note: Make sure that all messages also work for the classic
; wizard style. If you want to use more text for a message but you can't
; because it gets truncated, please email me at mlaan@cs.vu.nl and I'll
; probably create two seperate messages: one for the classic style and one
; for the modern style. Thanks.

; Note: When translating this text, do not add periods (.) to the end of
; messages that didn't have them already, because on those messages Inno
; Setup adds the periods automatically (appending a period would result in
; two periods being displayed).

[Messages]

; *** My Inno Setup Extensions messages
WizardSelectComponents=Select Components
SelectComponentsLabel=Select the components you want to install, clear the components you do not want to install:
FullInstallation=Full installation
; if possible don't translate 'Compact' as 'Minimal' (I mean 'Minimal' in your language)
CompactInstallation=Compact installation
CustomInstallation=Custom installation
ReadyMemoDir=Destination directory:
ReadyMemoType=Setup Type:
ReadyMemoComponents=Selected Components:
ReadyMemoGroup=Program group:
; FinishedRestartMessage should be the same as Inno Setup's FinishedRestartLabel two %n's added
FinishedRestartMessage=To complete the installation of [name], Setup must restart your computer.%n%nWould you like to restart now?

; *** My Inno Setup Extensions messages - 1.3.9
; used for example as 'Run MyProg.exe'
RunEntryExec=Run %1
; used for example as 'View Readme.txt'
RunEntryShellExec=View %1

; *** My Inno Setup Extensions messages - 1.3.9.1
; first part of Inno Setup's WelcomeLabel
WelcomeLabel1=Welcome to the [name] setup program.
; second part of Inno Setup's WelcomeLabel
WelcomeLabel2=This will install [name/ver] on your computer.%n%nIt is strongly recommended that you close all other applications you have running before continuing. This will help prevent any conflicts during the installation process.
; first part of Inno Setup's PasswordLabel
PasswordLabel1=This installation is password protected.
; second part of Inno Setup's PasswordLabel
PasswordLabel2=Please provide the password. Passwords are case-sensitive.
; similar to Inno Setup's InfoBeforeLabel and InfoAfterLabel
LicenseLabel=Please read the following important information before continuing.

; *** My Inno Setup Extensions messages - 1.3.10
; _WelcomeFont=Arial,12
ClickNextModern=Click Next to continue, or Cancel to exit Setup.

; *** My Inno Setup Extensions messages - 1.3.10.1
WizardInstalling=Setup Status
InstallingLabel=Please wait while Setup is installing [name] on your computer.
NoUninstallWarningTitle=Components Exist
NoUninstallWarning=Setup has detected that the following components are already installed on your computer:%n%n%1%n%nDeselecting these components will not uninstall them.%n%nWould you like to continue anyway?

; *** My Inno Setup Extensions messages - 1.3.12.1
ComponentSize1=%1 KB

; *** My Inno Setup Extensions messages - 1.3.13
ComponentSize2=%1 MB
WizardUninstalling=Uninstall Status
StatusUninstalling=Uninstalling %1...

; *** My Inno Setup Extensions messages - 1.3.17
; similar to Inno Setup's DiskSpaceMBLabel
ComponentsDiskSpaceMBLabel=Current selection requires at least [mb] MB of disk space.
; the %1 below is changed to ProgramManagerNew
NoProgramGroupCheck=&Don't create a %1 group
WizardSelectTasks=Select Additional Tasks
SelectTasksLabel=Select the additional tasks you would like Setup to perform while installing [name]:
ReadyMemoTasks=Additional tasks:

; *** My Inno Setup Extensions messages - other
; append your own notes to this message if you want to, starting with two %n's
AboutSetupNote=My Inno Setup Extensions homepage:%nhttp://www.wintax.nl/isx/%n%nInnerfuse Pascal Script homepage:%nhttp://www.weyert.com/ifs/
BeveledLabel=
