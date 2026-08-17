unit IvDialog;

{$I IVMULTI.INC}

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  Messages, Dialogs, CommDlg,
  IvDictio;

function IvGetOpenFileName(
  var ofn: TOpenFilename;
  dictionary: TIvDictionary;
  center: Boolean;
  parent: HWnd): Bool; {$IFDEF WIN32}stdcall;{$ELSE}export;{$ENDIF}

function IvGetSaveFileName(
  var ofn: TOpenFilename;
  dictionary: TIvDictionary;
  center: Boolean;
  parent: HWnd): Bool; {$IFDEF WIN32}stdcall;{$ELSE}export;{$ENDIF}

function IvChooseColor(
  var cc: TChooseColor;
  dictionary: TIvDictionary;
  center: Boolean;
  parent: HWnd): Bool; {$IFDEF WIN32}stdcall;{$ELSE}export;{$ENDIF}

function IvChooseFont(
  var cf: TChooseFont;
  dictionary: TIvDictionary;
  center: Boolean;
  parent: HWnd): Bool; {$IFDEF WIN32}stdcall;{$ELSE}export;{$ENDIF}

function IvFindText(
  var fr: TFindReplace;
  dictionary: TIvDictionary;
  center: Boolean;
  parent: HWnd): HWnd; {$IFDEF WIN32}stdcall;{$ELSE}export;{$ENDIF}

function IvReplaceText(
  var fr: TFindReplace;
  dictionary: TIvDictionary;
  center: Boolean;
  parent: HWnd): HWnd; {$IFDEF WIN32}stdcall;{$ELSE}export;{$ENDIF}

function IvPrintDlg(
  var pd: TPrintDlg;
  dictionary: TIvDictionary;
  center: Boolean;
  parent: HWnd): Bool; {$IFDEF WIN32}stdcall;{$ELSE}export;{$ENDIF}

{$IFDEF WIN32}
function IvPageSetupDlg(
  var ps: TPageSetupDlg;
  dictionary: TIvDictionary;
  center: Boolean;
  parent: HWnd): Bool; stdcall;
{$ENDIF}

implementation

uses
{$IFDEF WIN32}
  CommCtrl,
{$ENDIF}
  SysUtils;

var
  FDictionary: TIvDictionary;
  FCenter: Boolean;
  FParent: HWnd;
  FCounter: Integer;
  FOpenFile: TOpenFilename;
  FWndProc, FHookProc, FSetupProc, FButtonProc: TFarProc;
{$IFDEF WIN32}
  FPS: TPageSetupDlg;
{$ENDIF}

{ Centers the window to the center of screen }

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

{$IFDEF WIN32}
{ Window procedure of the explorer typed file dialogs }

function IvExplorerProc(wnd: HWnd; msg: UINT; wParam: WPARAM; lParam: LPARAM): Integer; stdcall;
type
{$IFDEF IVWIDE}
  PIvToolTipTextW = PToolTipTextW;
{$ELSE}
  // The COMMDTRL.PAS in Delphi 2 has an error

  PIvToolTipTextW = ^TIvToolTipTextW;
  TIvToolTipTextW = packed record
    hdr: TNMHDR;
    lpszText: PWideChar;
    szText: array[0..79] of WideChar;
    hinst: THandle;
    uFlags: UINT;
  end;
{$ENDIF}
var
  ttt: PIvToolTipTextW;
begin
  if msg = WM_NOTIFY then
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

  Result := CallWindowProc(FWndProc, wnd, msg, wParam, lParam);
end;
{$ENDIF}


{ Open }

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

function IvExplorerOpenHook(wnd: HWnd; msg: UINT; wParam: WPARAM; lParam: LPARAM):
{$IFDEF IVBIDI}
  UINT;
{$ELSE}
  Integer;
{$ENDIF}
  stdcall;
var
  parentWnd: Integer;
begin
  Result := 0;
  parentWnd := GetWindowLong(Wnd, GWL_HWNDPARENT);
  case Msg of
    WM_NOTIFY:
    begin
      if (POFNotify(LParam).hdr.code = CDN_INITDONE) and FCenter then
        CenterWindow(parentWnd);

      if (POFNotify(LParam).hdr.code = CDN_FOLDERCHANGE) and (FDictionary <> nil) then
      begin
        if (FOpenFile.lpstrTitle <> nil) and (StrLen(FOpenFile.lpstrTitle) > 0) then
          FDictionary.TranslateWindow(parentWnd, FOpenFile.lpstrTitle, False)
        else
          FDictionary.TranslateWindow(parentWnd, 'Open', False);
        TranslateExplorerOpenDialog(parentWnd, 0);
        if not Assigned(FWndProc) then
        begin
          FWndProc := TFarProc(GetWindowLong(parentWnd, GWL_WNDPROC));
          SetWindowLong(parentWnd, GWL_WNDPROC, Integer(@IvExplorerProc));
        end;
      end;
    end;
  end;

  if Assigned(FHookProc) then
    Result := CallWindowProc(FHookProc, wnd, msg, wParam, lParam);
end;
{$ENDIF}

function TranslateOpenDialog(wnd: HWnd; reserved: Integer): Bool; {$IFDEF WIN32}stdcall;{$ELSE}export;{$ENDIF}
begin
  Result := True;

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

{$IFDEF WIN32}
function IvOpenHook(wnd: HWnd; msg: UINT; wParam: WPARAM; lParam: LPARAM):
{$IFDEF IVBIDI}
  UINT;
{$ELSE}
  Integer;
{$ENDIF}
  stdcall;
{$ELSE}
function IvOpenHook(wnd: HWnd; msg, wParam: Word; lParam: Longint): Word; export;
{$ENDIF}
begin
  Result := 0;
  case Msg of
    WM_INITDIALOG:
      if FCenter then
        CenterWindow(Wnd);

    WM_ACTIVATE:
      if (LOWORD(WParam) = WA_ACTIVE) and (FDictionary <> nil) then
      begin
        if (FOpenFile.lpstrTitle <> nil) and (StrLen(FOpenFile.lpstrTitle) > 0) then
          FDictionary.TranslateWindow(
            wnd,
{$IFDEF WIN32}
            FOpenFile.lpstrTitle,
{$ELSE}
            StrPas(FOpenFile.lpstrTitle),
{$ENDIF}
            False)
        else
          FDictionary.TranslateWindow(wnd, 'Open', False);
        TranslateOpenDialog(wnd, 0);
      end;
  end;

  if Assigned(FHookProc) then
    Result := CallWindowProc(FHookProc, wnd, msg, wParam, lParam);
end;

function IvGetOpenFileName(
  var ofn: TOpenFilename;
  dictionary: TIvDictionary;
  center: Boolean;
  parent: HWnd): Bool; {$IFDEF WIN32}stdcall;{$ENDIF}
begin
  FDictionary := dictionary;
  FCenter := center;
  FParent := parent;
  FOpenFile := ofn;
  FWndProc := nil;

  if Assigned(ofn.lpfnHook) then
    FHookProc := @ofn.lpfnHook
  else
    FHookProc := nil;

  ofn.flags := ofn.flags or OFN_ENABLEHOOK;
{$IFDEF WIN32}
  if (ofn.flags and OFN_EXPLORER) <> 0 then
    ofn.lpfnHook := IvExplorerOpenHook
  else
{$ENDIF}
    ofn.lpfnHook := IvOpenHook;

  Result := GetOpenFileName(ofn);
end;


{ Save }

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

function IvExplorerSaveHook(wnd: HWnd; msg: UINT; wParam: WPARAM; lParam: LPARAM):
{$IFDEF IVBIDI}
  UINT;
{$ELSE}
  Integer;
{$ENDIF}
  stdcall;
var
  parentWnd: Integer;
begin
  Result := Integer(True);
  parentWnd := GetWindowLong(Wnd, GWL_HWNDPARENT);
  case Msg of
    WM_NOTIFY:
    begin
      if (POFNotify(LParam).hdr.code = CDN_INITDONE) and FCenter then
        CenterWindow(parentWnd);

      if (FOpenFile.lpstrTitle <> nil) and (StrLen(FOpenFile.lpstrTitle) > 0) then
        FDictionary.TranslateWindow(parentWnd, FOpenFile.lpstrTitle, False)
      else
        FDictionary.TranslateWindow(parentWnd, 'Save As', False);
      TranslateExplorerSaveDialog(parentWnd, 0);
      if not Assigned(FWndProc) then
      begin
        FWndProc := TFarProc(GetWindowLong(parentWnd, GWL_WNDPROC));
        SetWindowLong(parentWnd, GWL_WNDPROC, Integer(@IvExplorerProc));
      end;
    end;
  end;

  if Assigned(FHookProc) then
    Result := CallWindowProc(FHookProc, wnd, msg, wParam, lParam);
end;
{$ENDIF}

function TranslateSaveDialog(wnd: HWnd; reserved: Integer): Bool; {$IFDEF WIN32}stdcall;{$ELSE}export;{$ENDIF}
begin
  Result := True;

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
    1089: FDictionary.TranslateWindow(wnd, 'Save file as &type:', True);
    1090: FDictionary.TranslateWindow(wnd, 'File &name:', True);
    1091: FDictionary.TranslateWindow(wnd, 'Dri&ves:', True);
    65535: FDictionary.TranslateWindow(wnd, '&Folders:', True);
  end;

  { Translates the child controls }

  EnumChildWindows(wnd, @TranslateSaveDialog, 0);
end;

{$IFDEF WIN32}
function IvSaveHook(Wnd: HWnd; Msg: UINT; WParam: WPARAM; LParam: LPARAM):
{$IFDEF IVBIDI}
  UINT;
{$ELSE}
  Integer;
{$ENDIF}
  stdcall;
{$ELSE}
function IvSaveHook(Wnd: HWnd; Msg, WParam: Word; LParam: Longint): Word; export;
{$ENDIF}
begin
  Result := 0;
  case Msg of
    WM_INITDIALOG:
      if FCenter then
        CenterWindow(Wnd);

    WM_ACTIVATE:
      if (LOWORD(WParam) = WA_ACTIVE) and (FDictionary <> nil) then
      begin
        if (FOpenFile.lpstrTitle <> nil) and (StrLen(FOpenFile.lpstrTitle) > 0) then
          FDictionary.TranslateWindow(
            wnd,
{$IFDEF WIN32}
            FOpenFile.lpstrTitle,
{$ELSE}
            StrPas(FOpenFile.lpstrTitle),
{$ENDIF}
            False)
        else
          FDictionary.TranslateWindow(wnd, 'Save As', False);
        TranslateSaveDialog(Wnd, 0);
      end;
  end;

  if Assigned(FHookProc) then
    Result := CallWindowProc(FHookProc, wnd, msg, wParam, lParam);
end;

function IvGetSaveFileName(
  var ofn: TOpenFilename;
  dictionary: TIvDictionary;
  center: Boolean;
  parent: HWnd): Bool; {$IFDEF WIN32}stdcall;{$ENDIF}
begin
  FDictionary := dictionary;
  FCenter := center;
  FParent := parent;
  FWndProc := nil;
  FButtonProc := nil;
  FOpenFile := ofn;

  if Assigned(ofn.lpfnHook) then
    FHookProc := @ofn.lpfnHook
  else
    FHookProc := nil;

  ofn.flags := ofn.flags or OFN_ENABLEHOOK;
{$IFDEF WIN32}
  if (ofn.flags and OFN_EXPLORER) <> 0 then
    ofn.lpfnHook := IvExplorerSaveHook
  else
{$ENDIF}
    ofn.lpfnHook := IvSaveHook;

  Result := GetSaveFileName(ofn);
end;


{ Color }

function TranslateColorDialog(wnd: HWnd; reserved: Integer): Bool; {$IFDEF WIN32}stdcall;{$ELSE}export;{$ENDIF}
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

{$IFDEF WIN32}
function IvColorHook(Wnd: HWnd; Msg: UINT; WParam: WPARAM; LParam: LPARAM):
{$IFDEF IVBIDI}
  UINT;
{$ELSE}
  Integer;
{$ENDIF}
  stdcall;
{$ELSE}
function IvColorHook(Wnd: HWnd; Msg, WParam: Word; LParam: Longint): Word; export;
{$ENDIF}
begin
  Result := 0;
  case Msg of
    WM_INITDIALOG:
      if FCenter then
        CenterWindow(Wnd);

    WM_ACTIVATE:
      if (LOWORD(WParam) = WA_ACTIVE) and (FDictionary <> nil) then
      begin
        FCounter := 0;
        TranslateColorDialog(Wnd, 0);
      end;
  end;

  if Assigned(FHookProc) then
    Result := CallWindowProc(FHookProc, wnd, msg, wParam, lParam);
end;

function IvChooseColor(
  var cc: TChooseColor;
  dictionary: TIvDictionary;
  center: Boolean;
  parent: HWnd): Bool;
begin
  FDictionary := dictionary;
  FCenter := center;
  FParent := parent;
  cc.flags := cc.flags or CC_ENABLEHOOK;
  if Assigned(cc.lpfnHook) then
    FHookProc := @cc.lpfnHook
  else
    FHookProc := nil;
  cc.lpfnHook := IvColorHook;
  Result := ChooseColor(cc);
end;


{ Font }

function TranslateFontDialog(wnd: HWnd; reserved: Integer): Bool; {$IFDEF WIN32}stdcall;{$ELSE}export;{$ENDIF}
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

{$IFDEF WIN32}
function IvFontHook(Wnd: HWnd; Msg: UINT; WParam: WPARAM; LParam: LPARAM):
{$IFDEF IVBIDI}
  UINT;
{$ELSE}
  Integer;
{$ENDIF}
  stdcall;
{$ELSE}
function IvFontHook(Wnd: HWnd; Msg, WParam: Word; LParam: Longint): Word; export;
{$ENDIF}
begin
  Result := 0;
  case Msg of
    WM_INITDIALOG:
      if FCenter then
        CenterWindow(Wnd);

    WM_ACTIVATE:
      if (LOWORD(WParam) = WA_ACTIVE) and (FDictionary <> nil) then
        TranslateFontDialog(Wnd, 0);
  end;

  if Assigned(FHookProc) then
    Result := CallWindowProc(FHookProc, wnd, msg, wParam, lParam);
end;

function IvChooseFont(
  var cf: TChooseFont;
  dictionary: TIvDictionary;
  center: Boolean;
  parent: HWnd): Bool;
begin
  FDictionary := dictionary;
  FCenter := center;
  FParent := parent;
  cf.flags := cf.flags or CF_ENABLEHOOK;
  if Assigned(cf.lpfnHook) then
    FHookProc := @cf.lpfnHook
  else
    FHookProc := nil;
  cf.lpfnHook := IvFontHook;
  Result := ChooseFont(cf);
end;


{ Find }

function TranslateFindDialog(wnd: HWnd; reserved: Integer): Bool; {$IFDEF WIN32}stdcall;{$ELSE}export;{$ENDIF}
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

{$IFDEF WIN32}
function IvFindHook(Wnd: HWnd; Msg: UINT; WParam: WPARAM; LParam: LPARAM):
{$IFDEF IVBIDI}
  UINT;
{$ELSE}
  Integer;
{$ENDIF}
  stdcall;
{$ELSE}
function IvFindHook(Wnd: HWnd; Msg, WParam: Word; LParam: Longint): Word; export;
{$ENDIF}
begin
  Result := 0;
  case Msg of
    WM_INITDIALOG:
      if FCenter then
        CenterWindow(Wnd);

    WM_ACTIVATE:
      if (LOWORD(WParam) = WA_ACTIVE) and (FDictionary <> nil) then
        TranslateFindDialog(Wnd, 0);
  end;

  if Assigned(FHookProc) then
    Result := CallWindowProc(FHookProc, wnd, msg, wParam, lParam);
end;

function IvFindText(
  var fr: TFindReplace;
  dictionary: TIvDictionary;
  center: Boolean;
  parent: HWnd): HWND;
begin
  FDictionary := dictionary;
  FCenter := center;
  FParent := parent;
  fr.flags := fr.flags or FR_ENABLEHOOK;
  if Assigned(fr.lpfnHook) then
    FHookProc := @fr.lpfnHook
  else
    FHookProc := nil;
  fr.lpfnHook := IvFindHook;
  Result := FindText(fr);
end;


{ Replace }

function TranslateReplaceDialog(wnd: HWnd; reserved: Integer): Bool; {$IFDEF WIN32}stdcall;{$ELSE}export;{$ENDIF}
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

{$IFDEF WIN32}
function IvReplaceHook(Wnd: HWnd; Msg: UINT; WParam: WPARAM; LParam: LPARAM):
{$IFDEF IVBIDI}
  UINT;
{$ELSE}
  Integer;
{$ENDIF}
  stdcall;
{$ELSE}
function IvReplaceHook(Wnd: HWnd; Msg, WParam: Word; LParam: Longint): Word; export;
{$ENDIF}
begin
  Result := 0;
  case Msg of
    WM_INITDIALOG:
      if FCenter then
        CenterWindow(Wnd);

    WM_ACTIVATE:
      if (LOWORD(WParam) = WA_ACTIVE) and (FDictionary <> nil) then
      begin
        FCounter := 0;
        TranslateReplaceDialog(Wnd, 0);
      end;
  end;

  if Assigned(FHookProc) then
    Result := CallWindowProc(FHookProc, wnd, msg, wParam, lParam);
end;

function IvReplaceText(
  var fr: TFindReplace;
  dictionary: TIvDictionary;
  center: Boolean;
  parent: HWnd): HWnd;
begin
  FDictionary := dictionary;
  FCenter := center;
  FParent := parent;
  fr.flags := fr.flags or FR_ENABLEHOOK;
  if Assigned(fr.lpfnHook) then
    FHookProc := @fr.lpfnHook
  else
    FHookProc := nil;
  fr.lpfnHook := IvReplaceHook;
  Result := ReplaceText(fr);
end;


{ Print and Priner Setup dialogs }

function TranslatePrintDialog(wnd: HWnd; reserved: Integer): Bool; {$IFDEF WIN32}stdcall;{$ELSE}export;{$ENDIF}
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

{$IFDEF WIN32}
function IvPrintHook(wnd: HWnd; msg: UINT; wParam: WPARAM; lParam: LPARAM):
{$IFDEF IVBIDI}
  UINT;
{$ELSE}
  Integer;
{$ENDIF}
  stdcall;
{$ELSE}
function IvPrintHook(wnd: HWnd; msg, wParam: Word; lParam: Longint): Word; export;
{$ENDIF}
begin
  Result := 0;
  case Msg of
    WM_INITDIALOG:
      if FCenter then
        CenterWindow(wnd);

    WM_ACTIVATE:
      if (LOWORD(wParam) = WA_ACTIVE) and (FDictionary <> nil) then
        TranslatePrintDialog(wnd, 0);
  end;

  if Assigned(FHookProc) then
    Result := CallWindowProc(FHookProc, wnd, msg, wParam, lParam);
end;

function TranslatePrinterDialog(wnd: HWnd; reserved: Integer): Bool; {$IFDEF WIN32}stdcall;{$ELSE}export;{$ENDIF}
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

  EnumChildWindows(wnd, @TranslatePrinterDialog, 0);
end;

{$IFDEF WIN32}
function IvSetupHook(wnd: HWnd; msg: UINT; wParam: WPARAM; lParam: LPARAM):
{$IFDEF IVBIDI}
  UINT;
{$ELSE}
  Integer;
{$ENDIF}
  stdcall;
{$ELSE}
function IvSetupHook(wnd: HWnd; msg, wParam: Word; lParam: Longint): Word; export;
{$ENDIF}
begin
  Result := 0;
  case Msg of
    WM_INITDIALOG:
      if FCenter then
        CenterWindow(wnd);

    WM_ACTIVATE:
      if (LOWORD(wParam) = WA_ACTIVE) and (FDictionary <> nil) then
        TranslatePrinterDialog(wnd, 0);
  end;

  if Assigned(FSetupProc) then
    Result := CallWindowProc(FSetupProc, wnd, msg, wParam, lParam);
end;

function IvPrintDlg(
  var pd: TPrintDlg;
  dictionary: TIvDictionary;
  center: Boolean;
  parent: HWnd): Bool;
begin
  FDictionary := dictionary;
  FCenter := center;
  FParent := parent;
  if (pd.Flags and PD_PRINTSETUP) <> 0 then
  begin
    pd.flags := pd.flags or PD_ENABLESETUPHOOK;
    if Assigned(pd.lpfnSetupHook) then
      FSetupProc := @pd.lpfnSetupHook
    else
      FSetupProc := nil;
    pd.lpfnSetupHook := IvSetupHook;
  end
  else
  begin
    pd.flags := pd.flags or PD_ENABLEPRINTHOOK;
    if Assigned(pd.lpfnPrintHook) then
      FHookProc := @pd.lpfnPrintHook
    else
      FHookProc := nil;
    pd.lpfnPrintHook := IvPrintHook;
  end;
  Result := PrintDlg(pd);
end;


{ Page Setup dialog }

{$IFDEF WIN32}
function TranslatePageSetupDialog(wnd: HWnd; reserved: Integer): Bool; stdcall;
begin
  Result := True;

  { Translates the window text }

  case GetWindowLong(wnd, GWL_ID) of
    0: FDictionary.TranslateWindow(wnd, 'Page Setup', False);

    1: FDictionary.TranslateWindow(wnd, 'OK', False);
    2: FDictionary.TranslateWindow(wnd, 'Cancel', False);
    1026: FDictionary.TranslateWindow(wnd, '&Printer...', False);

    1073: FDictionary.TranslateWindow(wnd, 'Paper', False);
    1089: FDictionary.TranslateWindow(wnd, 'Si&ze:', True);
    1090: FDictionary.TranslateWindow(wnd, '&Source:', True);

    1072: FDictionary.TranslateWindow(wnd, 'Orientation', False);
    1056: FDictionary.TranslateWindow(wnd, 'P&ortrait', True);
    1057: FDictionary.TranslateWindow(wnd, 'L&andscape', True);

    1075:
      if (FPS.Flags and PSD_INHUNDREDTHSOFMILLIMETERS) <> 0 then
        FDictionary.TranslateWindow(wnd, 'Margins (millimeters)', False)
      else
        FDictionary.TranslateWindow(wnd, 'Margins (inches)', False);

    1102: FDictionary.TranslateWindow(wnd, '&Left:', True);
    1103: FDictionary.TranslateWindow(wnd, '&Right:', True);
    1104: FDictionary.TranslateWindow(wnd, '&Top:', True);
    1105: FDictionary.TranslateWindow(wnd, '&Bottom:', True);
  end;

  { Translates the child controls }

  EnumChildWindows(wnd, @TranslatePageSetupDialog, 0);
end;

function IvPageSetupHook(wnd: HWnd; msg: UINT; wParam: WPARAM; lParam: LPARAM):
{$IFDEF IVBIDI}
  UINT;
{$ELSE}
  Integer;
{$ENDIF}
  stdcall;
begin
  Result := 0;
  case Msg of
    WM_INITDIALOG:
      if FCenter then
        CenterWindow(wnd);

    WM_ACTIVATE:
      if (LOWORD(wParam) = WA_ACTIVE) and (FDictionary <> nil) then
        TranslatePageSetupDialog(wnd, 0);
  end;

  if Assigned(FHookProc) then
    Result := CallWindowProc(FHookProc, wnd, msg, wParam, lParam);
end;

function IvPageSetupDlg(
  var ps: TPageSetupDlg;
  dictionary: TIvDictionary;
  center: Boolean;
  parent: HWnd): Bool;
begin
  FDictionary := dictionary;
  FCenter := center;
  Fparent := parent;
  FPS := ps;
  ps.flags := ps.flags or PSD_ENABLEPAGESETUPHOOK;
  if Assigned(ps.lpfnPageSetupHook) then
    FHookProc := @ps.lpfnPageSetupHook
  else
    FHookProc := nil;
  ps.lpfnPageSetupHook := IvPageSetupHook;
  Result := PageSetupDlg(ps);
end;
{$ENDIF}

end.
