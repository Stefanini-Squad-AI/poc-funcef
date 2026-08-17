{ This translator module component translates the common dialog components. }

unit IvDlgMod;

{$I IVMULTI.INC}

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  Classes, Controls, Dialogs,
  IvMulti, IvDictio;

{$IFNDEF WIN32}
const
  WM_CTLCOLORDLG = $0136;

type
  UINT = Word;
  WPARAM = Word;
  LPARAM = Longint;
{$ENDIF}

type
  TIvDialogModule = class(TIvModule)
  protected
    procedure Loaded; override;

  public
    procedure TranslateDialog(handle: HWnd);

    class function AddDialogClass(dialog: TClass): Boolean;
    class function RemoveDialogClass(dialog: TClass): Boolean;
  end;

function IvCommonDialogProc(
  handle: HWND;
  msg: UINT;
  wParam: WPARAM;
  lParam: LPARAM): Longint; {$IFDEF WIN32}stdcall{$ELSE}export{$ENDIF};

implementation

uses
{$IFDEF WIN32}
  CommCtrl,
{$ENDIF}
{$IFDEF IVWIDE}
  ExtDlgs,
{$ENDIF}
  SysUtils, Messages, Forms;

type
  PPointer = ^Pointer;

{$IFDEF WIN32}
  {$IFDEF IVWIDE}
  PIvToolTipTextW = PToolTipTextW;
  {$ELSE}
  { The COMMDTRL.PAS in Delphi 2 and C++Builder 1 has an error }

  PIvToolTipTextW = ^TIvToolTipTextW;
  TIvToolTipTextW = packed record
    hdr: TNMHDR;
    lpszText: PWideChar;
    szText: array[0..79] of WideChar;
    hinst: THandle;
    uFlags: UINT;
  end;
  {$ENDIF}
{$ENDIF}

  TIvFindDialog = class(TFindDialog)
  protected
{$IFDEF IVWIDE}
    function MessageHook(var msg: TMessage): Boolean; override;
{$ELSE}
    function Message(var msg: TMessage): Boolean; override;
{$ENDIF}
  end;

  TIvCommonDialog = class(TCommonDialog)
  protected
{$IFDEF IVWIDE}
    function MessageHook(var msg: TMessage): Boolean; override;
{$ELSE}
    function Message(var msg: TMessage): Boolean; override;
{$ENDIF}
  end;

var
  FDictionary: TIvDictionary;
  FDialog: TCommonDialog;
  {FParent: HWnd;}
  FClosing: Boolean;
  FOldDialogProc: Longint;
  FOffset, FCounter: Integer;
  FCommonModule: TIvDialogModule;
  FRegisteredDialogs, FOriginalDialogProcs: TList;
{$IFDEF WIN32}
  FButtonProc: TFarProc;
{$ELSE}
  FOldExitProc: Pointer;
{$ENDIF}


{ Centers the window to the center of screen or parent }

{
procedure CenterWindow(wnd: HWnd);
var
  rect, parentRect: TRect;
begin
  GetWindowRect(wnd, rect);
  if FParent = 0 then
  begin
    SetWindowPos(
      wnd,
      0,
      (GetSystemMetrics(SM_CXSCREEN) - (rect.Right - rect.Left)) div 2,
      (GetSystemMetrics(SM_CYSCREEN) - (rect.Bottom - rect.Top)) div 2,
      0,
      0,
      SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER);
  end
  else
  begin
    GetWindowRect(FParent, parentRect);
    SetWindowPos(
      wnd,
      0,
      parentRect.Left + (parentRect.Right - parentRect.Left - (rect.Right - rect.Left)) div 2,
      parentRect.Top + (parentRect.Bottom - parentRect.Top - (rect.Bottom - rect.Top)) div 2,
      0,
      0,
      SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER);
  end;
end;
}

function IvCommonDialogProc(
  handle: HWND;
  msg: UINT;
  wParam: WPARAM;
  lParam: LPARAM): LongInt;
{$IFDEF WIN32}
var
  ttt: PIvToolTipTextW;
{$ENDIF}
begin
  Result := 1;
  if (msg <> WM_USER + $12C) and (FOldDialogProc <> 0) then
    Result := CallWindowProc(Pointer(FOldDialogProc), handle, msg, wParam, lParam);

  case msg of
{$IFDEF WIN32}
    WM_NOTIFY:
    begin
      if PNMHDR(LParam).code = TTN_NEEDTEXTW then
      begin
        ttt := PIvToolTipTextW(LParam);
        case ttt^.hdr.idFrom of
          40961: IvWStrPCopy(
            ttt^.szText,
            IvStrToWStr(FDictionary.Translate('Up One Level'), FDictionary.LanguageData.CodePage));

          40962: IvWStrPCopy(
            ttt^.szText,
            IvStrToWStr(FDictionary.Translate('Create New Folder'), FDictionary.LanguageData.CodePage));

          40963: IvWStrPCopy(
            ttt^.szText,
            IvStrToWStr(FDictionary.Translate('List'), FDictionary.LanguageData.CodePage));

          40964: IvWStrPCopy(
            ttt^.szText,
            IvStrToWStr(FDictionary.Translate('Details'), FDictionary.LanguageData.CodePage));
        end;
        Result := 0;
        Exit;
      end;
    end;
{$ENDIF}

    WM_CTLCOLORDLG,
    WM_ACTIVATE:
      FCommonModule.TranslateDialog(handle);

    WM_COMMAND:
{$IFDEF WIN32}
      if (LongRec(wParam).Lo = 1025) or (LongRec(wParam).Lo = 1024) then
{$ELSE}
      if (wParam = 1025) or (wParam = 1024) then
{$ENDIF}
      begin
        FCommonModule.TranslateDialog(Handle);
      end;

    WM_DESTROY,
    WM_CLOSE:
      if FOldDialogProc <> 0 then
      begin
        FClosing := True;
        SetWindowLong(handle, GWL_WNDPROC, FOldDialogProc);
        FOldDialogProc := 0;
      end;
  end;
end;


{ TIvFindDialog }

{$IFDEF IVWIDE}
function TIvFindDialog.MessageHook(var msg: TMessage):Boolean;
{$ELSE}
function TIvFindDialog.Message(var msg: TMessage):Boolean;
{$ENDIF}
begin
{$IFDEF IVWIDE}
  Result:= inherited MessageHook(msg);
{$ELSE}
  Result:= inherited Message(msg);
{$ENDIF}

  case msg.Msg of
    WM_CREATE:
      FClosing := False;

    WM_KILLFOCUS:
      if (FOldDialogProc = 0) and not FClosing then
      begin
        FDialog := Self;
        FOldDialogProc :=
          SetWindowLong(Msg.WParam, GWL_WNDPROC, LongInt(@IvCommonDialogProc));
      end;
  end;
end;


{ TIvCommonDialog }

{$IFDEF IVWIDE}
function TIvCommonDialog.MessageHook(var msg: TMessage): Boolean;
{$ELSE}
function TIvCommonDialog.Message(var msg: TMessage): Boolean;
{$ENDIF}
var
  h: HWnd;
begin
{$IFDEF IVWIDE}
  Result:= inherited MessageHook(msg);
{$ELSE}
  Result:= inherited Message(msg);
{$ENDIF}

  case msg.Msg of
    { Sets the windows hook. }

    WM_WINDOWPOSCHANGED:
      if FOldDialogProc = 0 then
      begin
        FClosing := False;
        FDialog := Self;
        h := GetActiveWindow;
        if (Owner = nil) or
          ((Owner is TWinControl) and (h <> TWinControl(Owner).Handle)) then
        begin
          FOldDialogProc :=
            SetWindowLong(h, GWL_WNDPROC, LongInt(@IvCommonDialogProc));
        end;
      end;

    { Sets the windows hook in the case of color dialog. }

    WM_ENTERIDLE:
      if (FOldDialogProc = 0) and Self.InheritsFrom(TColorDialog) then
      begin
        FClosing := False;
        FDialog := Self;
        h := GetActiveWindow;
        if (Owner = nil) or
          ((Owner is TWinControl) and (h <> TWinControl(Owner).Handle)) then
        begin
          FOldDialogProc :=
            SetWindowLong(h, GWL_WNDPROC, LongInt(@IvCommonDialogProc));
          SendMessage(h, WM_ACTIVATE, 0, 0);
        end;
      end;
  end;
end;


{ Translates the open dialog }

function TranslateOpenDialog(wnd: HWnd; reserved: LPARAM): Bool; {$IFDEF WIN32}stdcall;{$ELSE}export;{$ENDIF}
begin
  Result := True;
  if wnd = 0 then
    Exit;

  { Translates the window text }

{$IFDEF WIN32}
  case GetWindowLong(wnd, GWL_ID) of
{$ELSE}
  case GetWindowWord(wnd, GWW_ID) of
{$ENDIF}
    1: FDictionary.TranslateWindow(wnd, 'OK', True);
    2: FDictionary.TranslateWindow(wnd, 'Cancel', True);
    1037: FDictionary.TranslateWindow(wnd, 'Net&work...', True);
    1038: FDictionary.TranslateWindow(wnd, '&Help', True);
    1040: FDictionary.TranslateWindow(wnd, '&Read only', True);
    1089: FDictionary.TranslateWindow(wnd, 'List files of &type:', True);
    1090: FDictionary.TranslateWindow(wnd, 'File &name:', True);
    1091: FDictionary.TranslateWindow(wnd, 'Dri&ves:', True);
    65535: FDictionary.TranslateWindow(wnd, '&Folders:', True);
  end;

  { Translates the child controls }

  EnumChildWindows(wnd, @TranslateOpenDialog, 0);
end;


{ Translates the explorer open dialog }

{$IFDEF WIN32}
function TranslateExplorerOpenDialog(wnd: HWnd; reserved: Integer): Bool; stdcall;
var
  i, count: Integer;
  buffer: array[0..255] of Char;
  str: String;
  headerItem: THDItem;
begin
  Result := True;

  { Translates the window text }

  GetClassName(wnd, buffer, SizeOf(buffer));
  if buffer = WC_HEADER then
  begin
    { Translates a Header control }

    count := Header_GetItemCount(wnd);
    for i := 0 to count - 1 do
    begin
      headerItem.mask := HDI_TEXT;
      headerItem.pszText := buffer;
      headerItem.cchTextMax := SizeOf(buffer);
      Header_GetItem(wnd, i, headerItem);

      case i of
        0: str := FDictionary.Translate('Name');
        1: str := FDictionary.Translate('Size');
        2: str := FDictionary.Translate('Type');
        3: str := FDictionary.Translate('Modified');
        4: str := FDictionary.Translate('Attributes');
      else
        str := FDictionary.Translate(headerItem.pszText);
      end;

      if str <> buffer then
      begin
        headerItem.pszText := PChar(str);
        Header_SetItem(wnd, i, headerItem);
      end;
    end;
  end
  else
  begin
    case GetWindowLong(wnd, GWL_ID) of
      1: FDictionary.TranslateWindow(wnd, '&Open', True);
      2: FDictionary.TranslateWindow(wnd, 'Cancel', True);
      1038: FDictionary.TranslateWindow(wnd, '&Help', True);
      1040: FDictionary.TranslateWindow(wnd, 'Open as &read-only', True);
      1089: FDictionary.TranslateWindow(wnd, 'Files of &type:', True);
      1090: FDictionary.TranslateWindow(wnd, 'File &name:', True);
      1091: FDictionary.TranslateWindow(wnd, 'Look &in:', True);
    end;
  end;

  { Translates the child controls }

  EnumChildWindows(wnd, @TranslateExplorerOpenDialog, 0);
end;
{$ENDIF}


{ Translates the save dialog }

{$IFDEF WIN32}
function IvButtonProc(wnd: HWnd; msg: UINT; wParam: WPARAM; lParam: LPARAM): Integer; stdcall;
begin
  if msg <> WM_SETTEXT then
    Result := CallWindowProc(FButtonProc, wnd, msg, wParam, lParam)
  else
    Result := Integer(True);
end;

function TranslateExplorerSaveDialog(wnd: HWnd; reserved: Integer): Bool; stdcall;
const
  TEST_C = 'test';
var
  i, count: Integer;
  buffer: array[0..255] of Char;
  str: String;
  headerItem: THDItem;
begin
  Result := True;

  { Translates the window text }

  GetClassName(wnd, buffer, SizeOf(buffer));
  if buffer = WC_HEADER then
  begin
    { Translates a Header control }

    count := Header_GetItemCount(wnd);
    for i := 0 to count - 1 do
    begin
      headerItem.mask := HDI_TEXT;
      headerItem.pszText := buffer;
      headerItem.cchTextMax := SizeOf(buffer);
      Header_GetItem(wnd, i, headerItem);

      case i of
        0: str := FDictionary.Translate('Name');
        1: str := FDictionary.Translate('Size');
        2: str := FDictionary.Translate('Type');
        3: str := FDictionary.Translate('Modified');
        4: str := FDictionary.Translate('Attributes');
      else
        str := FDictionary.Translate(headerItem.pszText);
      end;

      if str <> buffer then
      begin
        headerItem.pszText := PChar(str);
        Header_SetItem(wnd, i, headerItem);
      end;
    end;
  end
  else
  begin
    case GetWindowLong(wnd, GWL_ID) of
      1:
      begin
        FDictionary.TranslateWindow(wnd, '&Save', True);
        if not Assigned(FButtonProc) then
        begin
          FButtonProc := TFarProc(GetWindowLong(wnd, GWL_WNDPROC));
          SetWindowLong(wnd, GWL_WNDPROC, Integer(@IvButtonProc));
        end;
      end;

      2: FDictionary.TranslateWindow(wnd, 'Cancel', True);
      1038: FDictionary.TranslateWindow(wnd, '&Help', True);
      1040: FDictionary.TranslateWindow(wnd, 'Open as &read-only', True);
      1089: FDictionary.TranslateWindow(wnd, 'Save as &type:', True);
      1090: FDictionary.TranslateWindow(wnd, 'File &name:', True);
      1091: FDictionary.TranslateWindow(wnd, 'Save &in:', True);
    end;
  end;

  { Translates the child controls }

  EnumChildWindows(wnd, @TranslateExplorerSaveDialog, 0);
end;
{$ENDIF}


{ Color dialog }

function TranslateColorDialog(wnd: HWnd; reserved: LPARAM): Bool; {$IFDEF WIN32}stdcall;{$ELSE}export;{$ENDIF}
begin
  Result := True;

  { Translates the window text }

{$IFDEF WIN32}
  case GetWindowLong(wnd, GWL_ID) of
{$ELSE}
  case GetWindowWord(wnd, GWW_ID) of
{$ENDIF}
    0: FDictionary.TranslateWindow(wnd, 'Color', False);
    1: FDictionary.TranslateWindow(wnd, 'OK', True);
    2: FDictionary.TranslateWindow(wnd, 'Cancel', True);
    712: FDictionary.TranslateWindow(wnd, '&Add to Custom Colors', True);
    719: FDictionary.TranslateWindow(wnd, '&Define Custom Colors >>', True);
    723: FDictionary.TranslateWindow(wnd, 'Hu&e:', True);
    724: FDictionary.TranslateWindow(wnd, '&Sat:', True);
    725: FDictionary.TranslateWindow(wnd, '&Lum:', True);
    726: FDictionary.TranslateWindow(wnd, '&Red:', True);
    727: FDictionary.TranslateWindow(wnd, '&Green:', True);
    728: FDictionary.TranslateWindow(wnd, 'Bl&ue:', True);
    730: FDictionary.TranslateWindow(wnd, 'Color', True);
    731: FDictionary.TranslateWindow(wnd, '|S&olid', True);
    1038: FDictionary.TranslateWindow(wnd, '&Help', True);
    65535:
      begin
        case FCounter of
          0: FDictionary.TranslateWindow(wnd, '&Basic colors:', True);
          1: FDictionary.TranslateWindow(wnd, '&Custom colors:', True);
        end;
        Inc(FCounter);
      end;
  end;

  { Translates the child controls }

  EnumChildWindows(wnd, @TranslateColorDialog, 0);
end;


{ Font }

function TranslateFontDialog(wnd: HWnd; reserved: LPARAM): Bool; {$IFDEF WIN32}stdcall;{$ELSE}export;{$ENDIF}
begin
  Result := True;

  { Translates the window text }

{$IFDEF WIN32}
  case GetWindowLong(wnd, GWL_ID) of
{$ELSE}
  case GetWindowWord(wnd, GWW_ID) of
{$ENDIF}
    0: FDictionary.TranslateWindow(wnd, 'Font', False);
    1: FDictionary.TranslateWindow(wnd, 'OK', True);
    2: FDictionary.TranslateWindow(wnd, 'Cancel', True);
    1026: FDictionary.TranslateWindow(wnd, '&Apply', True);
    1038: FDictionary.TranslateWindow(wnd, '&Help', True);
    1040: FDictionary.TranslateWindow(wnd, 'Stri&keout', True);
    1041: FDictionary.TranslateWindow(wnd, '&Underline', True);
    1072: FDictionary.TranslateWindow(wnd, 'Effects', True);
    1073: FDictionary.TranslateWindow(wnd, 'Sample', True);
    1088: FDictionary.TranslateWindow(wnd, '&Font:', True);
    1089: FDictionary.TranslateWindow(wnd, 'Font st&yle:', True);
    1090: FDictionary.TranslateWindow(wnd, '&Size:', True);
    1091: FDictionary.TranslateWindow(wnd, '&Color:', True);
    1094: FDictionary.TranslateWindow(wnd, 'Sc&ript:', True);
  end;

  { Translates the child controls }

  EnumChildWindows(wnd, @TranslateFontDialog, 0);
end;


{ Print and Priner Setup dialogs }

function TranslatePrintDialog(wnd: HWnd; reserved: LPARAM): Bool; {$IFDEF WIN32}stdcall;{$ELSE}export;{$ENDIF}
begin
  Result := True;

  { Translates the window text }

{$IFDEF WIN32}
  case GetWindowLong(wnd, GWL_ID) of
{$ELSE}
  case GetWindowWord(wnd, GWW_ID) of
{$ENDIF}
    0: FDictionary.TranslateWindow(wnd, 'Print', False);
    1: FDictionary.TranslateWindow(wnd, 'OK', True);
    2: FDictionary.TranslateWindow(wnd, 'Cancel', True);

    1025: FDictionary.TranslateWindow(wnd, '&Properties', True);
    1040: FDictionary.TranslateWindow(wnd, 'Print to fi&le', True);
    1041: FDictionary.TranslateWindow(wnd, 'C&ollate', True);
    1056: FDictionary.TranslateWindow(wnd, '&All', True);
    1057: FDictionary.TranslateWindow(wnd, '&Selection', True);
    1058: FDictionary.TranslateWindow(wnd, 'Pa&ges', True);
    1072: FDictionary.TranslateWindow(wnd, 'Print range', True);
    1073: FDictionary.TranslateWindow(wnd, 'Copies', True);
    1075: FDictionary.TranslateWindow(wnd, 'Printer', True);
    1089: FDictionary.TranslateWindow(wnd, '&from:', True);
    1090: FDictionary.TranslateWindow(wnd, '&to:', True);
    1092: FDictionary.TranslateWindow(wnd, 'Number of &copies:', True);
    1093: FDictionary.TranslateWindow(wnd, '&Name:', True);
    1094: FDictionary.TranslateWindow(wnd, 'Type:', True);
    1095: FDictionary.TranslateWindow(wnd, 'Status:', True);
    1096: FDictionary.TranslateWindow(wnd, 'Comment:', True);
    1097: FDictionary.TranslateWindow(wnd, 'Where:', True);
  end;

  { Translates the child controls }

  EnumChildWindows(wnd, @TranslatePrintDialog, 0);
end;

function TranslatePrinterSetupDialog(wnd: HWnd; reserved: LPARAM): Bool; {$IFDEF WIN32}stdcall;{$ELSE}export;{$ENDIF}
begin
  Result := True;

  { Translates the window text }

{$IFDEF WIN32}
  case GetWindowLong(wnd, GWL_ID) of
{$ELSE}
  case GetWindowWord(wnd, GWW_ID) of
{$ENDIF}
    0: FDictionary.TranslateWindow(wnd, 'Print Setup', False);
    1: FDictionary.TranslateWindow(wnd, 'OK', True);
    2: FDictionary.TranslateWindow(wnd, 'Cancel', True);

    1025: FDictionary.TranslateWindow(wnd, '&Properties', True);
    1037: FDictionary.TranslateWindow(wnd, 'Net&work...', True);
    1056: FDictionary.TranslateWindow(wnd, 'P&ortrait', True);
    1057: FDictionary.TranslateWindow(wnd, 'L&andscape', True);
    1072: FDictionary.TranslateWindow(wnd, 'Orientation', True);
    1073: FDictionary.TranslateWindow(wnd, 'Paper', True);
    1075: FDictionary.TranslateWindow(wnd, 'Printer', True);
    1089: FDictionary.TranslateWindow(wnd, 'Si&ze:', True);
    1090: FDictionary.TranslateWindow(wnd, '&Source:', True);
    1093: FDictionary.TranslateWindow(wnd, '&Name:', True);
    1094: FDictionary.TranslateWindow(wnd, 'Type:', True);
    1095: FDictionary.TranslateWindow(wnd, 'Status:', True);
    1096: FDictionary.TranslateWindow(wnd, 'Comment:', True);
    1097: FDictionary.TranslateWindow(wnd, 'Where:', True);
  end;

  { Translates the child controls }

  EnumChildWindows(wnd, @TranslatePrinterSetupDialog, 0);
end;


{ Find }

function TranslateFindDialog(wnd: HWnd; reserved: LPARAM): Bool; {$IFDEF WIN32}stdcall;{$ELSE}export;{$ENDIF}
begin
  Result := True;

  { Translates the window text }

{$IFDEF WIN32}
  case GetWindowLong(wnd, GWL_ID) of
{$ELSE}
  case GetWindowWord(wnd, GWW_ID) of
{$ENDIF}
    0: FDictionary.TranslateWindow(wnd, 'Find', False);
    1: FDictionary.TranslateWindow(wnd, '&Find Next', True);
    2: FDictionary.TranslateWindow(wnd, 'Cancel', True);
    1038: FDictionary.TranslateWindow(wnd, '&Help', True);
    1040: FDictionary.TranslateWindow(wnd, 'Match &whole word only', True);
    1041: FDictionary.TranslateWindow(wnd, 'Match &case', True);
    1056: FDictionary.TranslateWindow(wnd, '&Up', True);
    1057: FDictionary.TranslateWindow(wnd, '&Down', True);
    1072: FDictionary.TranslateWindow(wnd, 'Direction', True);
    65535: FDictionary.TranslateWindow(wnd, 'Fi&nd what:', True);
  end;

  { Translates the child controls }

  EnumChildWindows(wnd, @TranslateFindDialog, 0);
end;


{ Replace }

function TranslateReplaceDialog(wnd: HWnd; reserved: LPARAM): Bool; {$IFDEF WIN32}stdcall;{$ELSE}export;{$ENDIF}
begin
  Result := True;

  { Translates the window text }

{$IFDEF WIN32}
  case GetWindowLong(wnd, GWL_ID) of
{$ELSE}
  case GetWindowWord(wnd, GWW_ID) of
{$ENDIF}
    0: FDictionary.TranslateWindow(wnd, 'Replace', False);
    1: FDictionary.TranslateWindow(wnd, '&Find Next', True);
    2: FDictionary.TranslateWindow(wnd, 'Cancel', True);
    1038: FDictionary.TranslateWindow(wnd, '&Help', True);
    1024: FDictionary.TranslateWindow(wnd, '&Replace', True);
    1025: FDictionary.TranslateWindow(wnd, 'Replace &All', True);
    1040: FDictionary.TranslateWindow(wnd, 'Match &whole word only', True);
    1041: FDictionary.TranslateWindow(wnd, 'Match &case', True);
    65535:
      begin
        case FCounter of
          0: FDictionary.TranslateWindow(wnd, 'Fi&nd what:', True);
          1: FDictionary.TranslateWindow(wnd, 'Re&place with:', True);
        end;
        Inc(FCounter);
      end;
  end;

  { Translates the child controls }

  EnumChildWindows(wnd, @TranslateReplaceDialog, 0);
end;


{ TIvDialogModule }

procedure TIvDialogModule.TranslateDialog(handle: HWnd);

  procedure TranslateOpenCaption;
  begin
    if TOpenDialog(FDialog).Title = '' then
      FDictionary.TranslateWindow(handle, 'Open', False)
  end;

  procedure TranslateSaveCaption;
  begin
    if TOpenDialog(FDialog).Title = '' then
      FDictionary.TranslateWindow(handle, 'Save As', False)
  end;

begin
  FDictionary := GetDefaultDictionary;
  FCounter := 0;

  { Translates the active dialog }

  if (FDialog is TSaveDialog)
{$IFDEF IVWIDE}
    or (FDialog is TSavePictureDialog)
{$ENDIF}
  then
  begin
{$IFDEF WIN32}
    if not (ofOldStyleDialog in TOpenDialog(FDialog).Options) then
      TranslateExplorerSaveDialog(handle, 0)
    else
{$ENDIF}
      TranslateOpenDialog(handle, 0);
    TranslateSaveCaption;
  end
  else if (FDialog is TOpenDialog)
{$IFDEF IVWIDE}
    or (FDialog is TOpenPictureDialog)
{$ENDIF}
  then
  begin
{$IFDEF WIN32}
    if not (ofOldStyleDialog in TOpenDialog(FDialog).Options) then
      TranslateExplorerOpenDialog(handle, 0)
    else
{$ENDIF}
      TranslateOpenDialog(handle, 0);
    TranslateOpenCaption;
  end
  else if FDialog is TColorDialog then
    TranslateColorDialog(handle, 0)
  else if FDialog is TFontDialog then
    TranslateFontDialog(handle, 0)
  else if FDialog is TReplaceDialog then
    TranslateReplaceDialog(handle, 0)
  else if FDialog is TFindDialog then
    TranslateFindDialog(handle, 0)
  else if FDialog is TPrintDialog then
    TranslatePrintDialog(handle, 0)
  else if FDialog is TPrinterSetupDialog then
    TranslatePrinterSetupDialog(handle, 0);
end;

class function TIvDialogModule.AddDialogClass(dialog: TClass): Boolean;
var
  proc: PPointer;
  protect: Longint;
{$IFNDEF WIN32}
  sel, seg: Word;
{$ENDIF}
begin
  { If the given class is null or not a common dialog or the dialog has already
    been registered, exists. }

  if (dialog = nil) or
    not dialog.InheritsFrom(TCommonDialog) or
    (FRegisteredDialogs.IndexOf(Pointer(dialog)) <> -1) then
  begin
    Result := False;
    Exit;
  end;

  { Calculates the offset of the message hook variable in the common dialog }

  if FOffset = 0 then
  begin
{$IFDEF IVWIDE}
    while (@TIvCommonDialog.MessageHook <> PPointer(LongInt(TIvCommonDialog) + FOffset)^) do
{$ELSE}
    while (@TIvCommonDialog.Message <> PPointer(LongInt(TIvCommonDialog) + FOffset)^) do
{$ENDIF}
    begin
      Inc(FOffset);
    end;
  end;

  { Replaces the VCL standard message function with ML one. }

  proc := PPointer(Longint(dialog) + Longint(FOffset));
  FRegisteredDialogs.Add(Pointer(dialog));
  FOriginalDialogProcs.Add(proc^);
{$IFDEF WIN32}
  VirtualProtect(Proc, 4, PAGE_READWRITE, @protect);
{$ELSE}
  seg := PtrRec(proc).Seg;
  GlobalPageLock(seg);
  sel := AllocSelector(seg);
  PrestoChangoSelector(seg, sel);
  proc := Ptr(sel, PtrRec(proc).Ofs);
{$ENDIF}

{$IFDEF IVWIDE}
  if (dialog.InheritsFrom(TFindDialog)) then
    proc^ := @TIvFindDialog.MessageHook
  else
    proc^ := @TIvCommonDialog.MessageHook;
{$ELSE}
  if (dialog.InheritsFrom(TFindDialog)) then
    proc^ := @TIvFindDialog.Message
  else
    proc^ := @TIvCommonDialog.Message;
{$ENDIF}

{$IFDEF WIN32}
  VirtualProtect(proc, 4, protect, @protect);
{$ELSE}
  GlobalPageUnlock(seg);
{$ENDIF}

  Result := True;
end;

class function TIvDialogModule.RemoveDialogClass(dialog: TClass): Boolean;
var
  proc: PPointer;
  protect, index: LongInt;
{$IFNDEF WIN32}
  sel, seg: Word;
{$ENDIF}
begin
  index := FRegisteredDialogs.IndexOf(Pointer(dialog));
  if index = -1 then
  begin
    Result := False;
    Exit;
  end;

  proc := PPointer(LongInt(dialog) + FOffset);

{$IFDEF WIN32}
  VirtualProtect(proc, 4, PAGE_READWRITE, @protect);
{$ELSE}
  seg := PtrRec(Proc).Seg;
  GlobalPageLock(seg);
  sel := AllocSelector(seg);
  PrestoChangoSelector(seg, sel);
  proc := Ptr(sel, PtrRec(proc).Ofs);
{$ENDIF}

  proc^ := FOriginalDialogProcs.Items[Index];

{$IFDEF WIN32}
  VirtualProtect(proc, 4, Protect, @protect);
{$ELSE}
  GlobalPageUnlock(seg);
{$ENDIF}

  FRegisteredDialogs.Delete(index);
  FRegisteredDialogs.Pack;
  FOriginalDialogProcs.Delete(index);
  FOriginalDialogProcs.Pack;

  Result := True;
end;

procedure TIvDialogModule.Loaded;
var
  i: Integer;
begin
  inherited Loaded;
  if not (csDesigning in ComponentState) then
  begin
    { Registers the standard common dialog components of VCL to the module }

    TIvDialogModule.AddDialogClass(TOpenDialog);
    TIvDialogModule.AddDialogClass(TSaveDialog);
{$IFDEF IVWIDE}
    TIvDialogModule.AddDialogClass(TOpenPictureDialog);
    TIvDialogModule.AddDialogClass(TSavePictureDialog);
{$ENDIF}
    TIvDialogModule.AddDialogClass(TColorDialog);
    TIvDialogModule.AddDialogClass(TSaveDialog);
    TIvDialogModule.AddDialogClass(TFontDialog);
    TIvDialogModule.AddDialogClass(TPrintDialog);
    TIvDialogModule.AddDialogClass(TPrinterSetupDialog);
    TIvDialogModule.AddDialogClass(TFindDialog);
    TIvDialogModule.AddDialogClass(TReplaceDialog);

    { Registers the other common dialog components on the host form }

    for i := 0 to Owner.ComponentCount - 1 do
      if Owner.Components[i] is TCommonDialog then
        AddDialogClass(Owner.Components[i].ClassType);
  end;
end;

procedure RemoveDialogClasses;
begin
  while FRegisteredDialogs.Count > 0 do
    TIvDialogModule.RemoveDialogClass(TClass(FRegisteredDialogs.Items[0]));
  FOriginalDialogProcs.Free;
  FRegisteredDialogs.Free;
end;

{$IFNDEF WIN32}
procedure ExitUnit; far;
begin
  ExitProc := FOldExitProc;
  RemoveDialogClasses;
end;
{$ENDIF}

initialization
{$IFNDEF WIN32}
  FOldExitProc := ExitProc;
  ExitProc := @ExitUnit;
{$ENDIF}

  FOldDialogProc := 0;
  FOffset := 0;
  FClosing := False;
  FRegisteredDialogs := TList.Create;
  FOriginalDialogProcs := TList.Create;
{$IFDEF WIN32}
finalization
  RemoveDialogClasses;
{$ENDIF}
end.
