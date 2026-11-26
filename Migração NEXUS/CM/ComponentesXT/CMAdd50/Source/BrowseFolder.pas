{*******************************************************************************
   Unit
      uBrowseFolder.pas
   Description:
      Just one more wrapper to SHBrowseForFolder.
   Version:
      2.1a
   Autor(s):
      Dimitry Statilko - dstatus@iname.com, dima@mobitel.com
   Comments:
   History:
      2.1a  -  20/11/1998
               Several bug fixes:
               - Did not go to the specified directory when started
               - Window titles was not shown properly
      2.1  	-  10/10/1998
      			1. New property Caption: String - caption of browse directory window.
      			2. Component now keeps and maintains the dialog's handle within dialogs
               	life-time.
               3.	Caption and directory now can be set while dialog is opened.
               4. Some minor fixes.
      2.0*  - 	End of Sep. 1998
      			Initial release

*     I did not track the versions before, so let's consider it as 2.0               
*******************************************************************************}

unit BrowseFolder;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   SHLOBJ, Activex, BfDialogs;

type
	TBrowseOption = (bfFileSysDirsOnly, bfDontGoBelowDomain, bfStatusText,
         bfFileSysAncestors, bfBrowseForComputer, bfBrowseForPrinter);

   TSHFolders = ( foDesktop, foPrograms, foControls, foPrinters, foPersonal, foFavorites,
      foStartup, foRecent, foSendto, foRecycleBin, foStartMenu, foDesktopDirectory,
      foMyComputer, foNetwork, foNetworkNeighborhood, foFonts, foTemplates, foCustom);


   TBrowseOptions = set of TBrowseOption;

   TBrowseDialogEvent = procedure(Sender: TObject; Wnd: HWND;
      Path: string; var ShowText: string; var OKButtonEnabled: Boolean) of object;

   EsBrowseFolderException = class(Exception);

   TsBrowseFolderDialog = class(TsBfCustomDialog)
   private
      FCaption: String;
      FDirectory: string;
      FDisplayName: String;
      FDlgWnd: HWND;
      FFolder: TSHFolders;
      FImageIndex: Integer;
      FInitialized: Boolean;
      FOptions: TBrowseOptions;
      FParentHandle: HWND;
      FShowPath: Boolean;
      FTitle: String;
      FOnInitialized: TBrowseDialogEvent;
      FOnSelectionChanged: TBrowseDialogEvent;
      procedure SetCaption(const Value: string);
      procedure ForceCaption;
      procedure SetDirectory(Value: String);
      function GetDirectory: String;
      procedure SetFolder( Value: TSHFolders);
      procedure SetShowPath(Value: Boolean);
      procedure SetTitle(Value: String);
      procedure SendSelectionMessage;
   protected
      function Message(var Msg: TMessage): Boolean; virtual;
   public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      function Execute: Boolean; override;
      procedure SelectionChanged(Wnd: HWND; Path: string; var ShowText: string;
         var OKButtonEnabled: Boolean);
      procedure Initialized(Wnd: HWND; Path: string; var ShowText: string;
         var OKButtonEnabled: Boolean);
      property ParentHandle: HWND read FParentHandle write FParentHandle;
      property ImageIndex: Integer read FImageIndex;
      property DisplayName: String read FDisplayName;
   published
      property Caption: String read FCaption write SetCaption;
      property Directory: String read GetDirectory write SetDirectory;
      property Folder: TSHFolders read FFolder write SetFolder default foDesktop;
      property Options: TBrowseOptions read FOptions write FOptions default [];
      property ShowPath: Boolean read FShowPath write SetShowPath;
      property Title: String read FTitle write SetTitle;
      property OnInitialized: TBrowseDialogEvent read FOnInitialized write FOnInitialized;
      property OnSelectionChanged: TBrowseDialogEvent read FOnSelectionChanged write FOnSelectionChanged;
   end;


function BrowseDirectory( var FolderName: String; Caption: String): Boolean;

implementation

uses BfFileUtils, BfConsts;

function BrowseDirectory( var FolderName: String; Caption: String): Boolean;
begin
   with TsBrowseFolderDialog.Create(nil) do try
      Folder := foCustom;
      Directory := FolderName;
      Options := [bfStatusText];
      Title := Caption;
      Result := Execute;
      if Result then
         FolderName := Directory;
   finally
      Free;
   end;
end;

constructor TsBrowseFolderDialog.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
	SetLength(FDisplayName,MAX_PATH);
	SetLength(FDirectory,MAX_PATH);
   FParentHandle := 0;
   FDlgWnd := 0;
end;

destructor TsBrowseFolderDialog.Destroy;
begin
	inherited;
end;

procedure TsBrowseFolderDialog.Initialized( Wnd: HWND; Path: string;
      var ShowText: string; var OKButtonEnabled: Boolean);
begin
   if FCaption <> '' then
      SendMessage( Wnd, WM_SETTEXT, 0, LPARAM(FCaption));
   if Assigned(FOnInitialized) then
      FOnInitialized(Self, Wnd, Path, ShowText, OKButtonEnabled);
end;

procedure TsBrowseFolderDialog.SelectionChanged(Wnd: HWND; Path: string;
   var ShowText: string; var OKButtonEnabled: Boolean);
begin
   if Assigned(FOnSelectionChanged) then
      FOnSelectionChanged(Self, Wnd, Path, ShowText, OKButtonEnabled);
   FDirectory := Path;
end;

procedure CenterWindow(HWindow: HWND);
var
   Rect: TRect;
   FWRect: TRect;
begin
   GetWindowRect( HWindow,Rect);
   FWRect := Classes.Rect( 0, 0, Screen.Width, Screen.Height);
   SetWindowPos( HWindow, 0,
		   (FWRect.Left + (FWRect.Right - FWRect.Left) div 2)-(Rect.Right - Rect.Left) div 2,
		   FWRect.Top + ((FWRect.Bottom-FWRect.Top) div 4),
		   0, 0, SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER);
end;

function BrowseCallbackProc( wnd: HWND; uMsg: Cardinal; lParam: LPARAM; lpData: LPARAM): Integer stdcall;
var
   Path: array [0..512] of Char;
   ShowText: string;
   OKButtonEnabled: Boolean;
   Dir: string;
begin
   Result := 0;
   if not (TObject(lpData) is TsBrowseFolderDialog) then
      Exit;
   Path := '';
   ShowText := '';
   OKButtonEnabled := TRUE;
   case uMSG of
      BFFM_INITIALIZED: begin
         TsBrowseFolderDialog(lpData).FDlgWnd := Wnd;
         TsBrowseFolderDialog(lpData).ForceCaption;
         CenterWindow(Wnd);
         if TsBrowseFolderDialog(lpData).Directory <> '' then begin
            Dir := TsBrowseFolderDialog(lpData).Directory;
            if (Length(Dir) > 3) and (Dir [Length(Dir)] = '\') then
               Delete(Dir, Length(Dir), 1);
            SendMessage(Wnd, BFFM_SETSELECTION, Longint(TRUE), Longint(PChar(Dir)));
         end;
         if TsBrowseFolderDialog(lpData).ShowPath then
            ShowText := CompressPath(String(Dir), 35);
         TsBrowseFolderDialog(lpData).Initialized(Wnd, Dir, ShowText, OKButtonEnabled);
         TsBrowseFolderDialog(lpData).FInitialized := TRUE;
      end;
      BFFM_SELCHANGED: begin
         SHGetPathFromIDList(PItemIDList(lParam), Path);
         if TsBrowseFolderDialog(lpData).ShowPath then
            ShowText := CompressPath(String(Path), 35);
         if TsBrowseFolderDialog(lpData).FInitialized then
            TsBrowseFolderDialog(lpData).SelectionChanged(Wnd, string(Path), ShowText, OKButtonEnabled);
      end;
      else
         Exit;
   end;
   SendMessage(Wnd, BFFM_SETSTATUSTEXT, 0, Longint(PChar(ShowText)));
   SendMessage(Wnd, BFFM_ENABLEOK, 0, Longint(OKButtonEnabled));
end;

function TsBrowseFolderDialog.Message(var Msg: TMessage): Boolean;
begin
   Result := False;
end;

const
      BrowseFolders: array[TSHFolders] of Integer=
      (CSIDL_DESKTOP, CSIDL_PROGRAMS, CSIDL_CONTROLS, CSIDL_PRINTERS, CSIDL_PERSONAL,
       CSIDL_FAVORITES, CSIDL_STARTUP, CSIDL_RECENT, CSIDL_SENDTO, CSIDL_BITBUCKET,
       CSIDL_STARTMENU, CSIDL_DESKTOPDIRECTORY, CSIDL_DRIVES, CSIDL_NETWORK,
       CSIDL_NETHOOD, CSIDL_FONTS, CSIDL_TEMPLATES, -1);

function TsBrowseFolderDialog.Execute: Boolean;
const
   BrowseOptions: array [TBrowseOption] of UINT = (
		BIF_RETURNONLYFSDIRS, BIF_DONTGOBELOWDOMAIN, BIF_STATUSTEXT,
      BIF_RETURNFSANCESTORS, BIF_BROWSEFORCOMPUTER, BIF_BROWSEFORPRINTER);
var
   BrowseInfo: TBrowseInfo;
   PStr: array[0..MAX_PATH - 1] of Char;
   pidlBrowse: PItemIDList;
   Option: TBrowseOption;
   ActiveWindow: HWnd;
   WindowList: Pointer;
begin
   FInitialized := FALSE;
   Result := FALSE;
   pidlBrowse := nil;
   try
      with BrowseInfo do begin
         if FParentHandle <> 0 then   // Pass 0 if want owner handle
            hwndOwner := FParentHandle
         else if Owner is TWinControl then
            hwndOwner := (Owner as TWinControl).Handle
         else
            hwndOwner:= Application.Handle;
         if (FFolder = foDesktop) or (BrowseFolders[FFolder] = -1) then
            pidlRoot := nil
         else
            SHGetSpecialFolderLocation(Application.Handle, BrowseFolders[FFolder], pidlRoot);
         pszDisplayName := PChar(FDisplayName);
         lpszTitle := PChar(FTitle);

         ulFlags := 0;
         for Option := Low(Option) to High(Option) do
            if Option in FOptions then
               ulFlags := ulFlags or BrowseOptions[Option];
         lpfn := BrowseCallbackProc;
         lParam := Longint(Self);
         iImage := 0;
      end;

      ActiveWindow := GetActiveWindow;
      WindowList := DisableTaskWindows(0);
      try
         Application.HookMainWindow(Message);
         try
            pidlBrowse := SHBrowseForFolder(BrowseInfo);
         finally
            FDlgWnd := 0;
            Application.UnhookMainWindow(Message);
         end;
      finally
         EnableTaskWindows(WindowList);
         SetActiveWindow(ActiveWindow);
      end;
      Result := pidlBrowse <> nil;
      if Result then begin
         FDirectory := '';
         if SHGetPathFromIDList(pidlBrowse, PStr) then
            FDirectory := StrPas(PStr);
         FImageIndex := BrowseInfo.iImage;
      end;
   finally
      if Result then
         CoTaskMemFree(pidlBrowse);
      if BrowseInfo.pidlRoot <> nil then
         CoTaskMemFree(BrowseInfo.pidlRoot);
   end;
   if (csDesigning in ComponentState) and Result then
      MessageDlg(Format( STestMessage, [FDirectory]), mtInformation, [mbOk], 0);
end;

function TsBrowseFolderDialog.GetDirectory: String;
var
	ItemIDList: PItemIDList;
   Path: array[0..MAX_PATH - 1] of Char;
begin
   if FFolder = foCustom then
      Result := FDirectory
   else try
      SHGetSpecialFolderLocation(Application.Handle, BrowseFolders[FFolder], ItemIDList);
      SHGetPathFromIDList(ItemIDList, Path);
      FDirectory := StrPas(Path);
   finally
      CoTaskMemFree(ItemIDList);
   end;
end;

procedure TsBrowseFolderDialog.SetDirectory(Value: String);
begin
   if FFolder = foCustom then begin
      if FDirectory <> TerminateDir(Value) then begin
         FDirectory := TerminateDir(Value);
         if FDlgWnd <> 0 then
				SendSelectionMessage;
      end;
   end;
end;

procedure TsBrowseFolderDialog.SendSelectionMessage;
var
   pidlBrowse: PItemIDList;
   ShellFolder: IShellFolder;
   OLEStr: array[0..MAX_PATH] of TOLEChar;
   Eaten: ULONG;
   Attr: ULONG;
begin
   if Copy(FDirectory, 1, 2) = '\\' then begin
		if SHGetDesktopFolder(ShellFolder) = NO_ERROR then begin
      	if ShellFolder.ParseDisplayName(FDlgWnd, NIL,
         	StringToWideChar(FDirectory, OLEStr, MAX_PATH), Eaten,
         	pidlBrowse, Attr) = NO_ERROR then try
            SendMessage(FDlgWnd, BFFM_SETSELECTION, 0, LPARAM(pidlBrowse))
      	finally
         	if pidlBrowse <> nil then
      			CoTaskMemFree(pidlBrowse);
    		end;
		end;
   end else
   	SendMessage(FDlgWnd, BFFM_SETSELECTION, 1, LPARAM(FDirectory));
end;

procedure TsBrowseFolderDialog.SetCaption(const Value: string);
begin
	if FCaption <> Value then begin
  		FCaption := Value;
      ForceCaption;
	end;
end;

procedure TsBrowseFolderDialog.ForceCaption;
begin
   if FDlgWnd <> 0 then
      SendMessage(FDlgWnd, WM_SETTEXT, 0, LPARAM(FCaption));
end;

procedure TsBrowseFolderDialog.SetShowPath(Value: Boolean);
begin
	if FShowPath <> Value then begin
   	FShowPath := Value;
      FOptions := FOptions + [bfStatusText];
   end;
end;

procedure TsBrowseFolderDialog.SetTitle(Value: String);
begin
	if FTitle <> Value then begin
  		FTitle := Value;
	end;
end;

procedure TsBrowseFolderDialog.SetFolder( Value: TSHFolders);
begin
   if FFolder <> Value then begin
      FFolder := Value;
      if FFolder <> foCustom then
         FDirectory := GetDirectory;
   end;
end;

end.

