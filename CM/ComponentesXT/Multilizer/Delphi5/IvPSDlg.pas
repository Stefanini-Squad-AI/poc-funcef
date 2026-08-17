unit IvPSDlg;

{$I IVMULTI.INC}

interface

uses
  Windows, Classes, Controls, Graphics, Dialogs, CommDlg,
  IvDictio;

type
  TIvPageSetupOption = (ivpoDefaultMinMargins, ivpoDisableMargins,
    ivpoDisableOrientation, ivpoDisablePagePainting, ivpoDisablePaper,
    ivpoDisablePrinter, ivpoNoWarning, ivpoShowHelp);
  TIvPageSetupOptions = set of TIvPageSetupOption;
  TIvPSPaperType = (ivptPaper, ivptEnvelope);
  TIvPSPaperOrientation = (ivpoPortrait, ivpoLandscape);
  TIvPSPrinterType = (ivptDotMatrix, ivptHPPCL);
  TIvPSPaintWhat = (ivpwFullPage, ivpwMinimumMargins, ivpwMargins,
    ivpwGreekText, ivpwEnvStamp, ivpwYAFullPage);

  TIvPSMeasurements = (ivpmDefault, ivpmMillimeters, ivpmInches);
  
  TIvPSPrinterEvent = procedure(sender: TObject; wnd: HWnd) of object;

  PIvPageSetupDlg = ^TIvPageSetupDlg;
  TIvPageSetupDlg = TPageSetupDlg;

  TIvPSInitPaintPageEvent = function(
    sender: TObject;
    paperSize: Integer;
    paperType: TIvPSPaperType;
    paperOrientation: TIvPSPaperOrientation;
    printerType: TIvPSPrinterType;
    setupData: PIvPageSetupDlg): Boolean of object;

  TIvPSPaintPageEvent = function(
    sender: TObject;
    paintWhat: TIvPSPaintWhat;
    canvas: TCanvas;
    rect: TRect): Boolean of object;

  TIvPageSetupDialog = class(TCommonDialog)
  private
    FOptions: TIvPageSetupOptions;
    FPaperSize: TPoint;
    FMinimumMargins: TRect;
    FMargins: TRect;
    FMeasurements: TIvPSMeasurements;
    FParent: TWinControl;
    FPositions: TIvDialogPositions;
    FDictionary: TIvDictionary;
    FDictionaryName: String;
    FOnPrinter: TIvPSPrinterEvent;
    FOnInitPaintPage: TIvPSInitPaintPageEvent;
    FOnPaintPage: TIvPSPaintPageEvent;

    procedure SetDictionary(value: TIvDictionary);
    procedure SetDictionaryName(const value: String);
    procedure InitDictionary;
    function GetParentWnd: HWnd;

    function DoPrinter(wnd: HWnd): Boolean;
    function DoExecute(func: Pointer): Boolean;

  protected
    function Printer(wnd: HWnd): Boolean; virtual;
    function TaskModalDialog(dialogFunc: Pointer; var dialogData): Bool; override;

  public
    constructor Create(owner: TComponent); override;

    function Execute: Boolean; override;

    property PaperSize: TPoint read FPaperSize write FPaperSize;
    property MinimumMargins: TRect read FMinimumMargins write FMinimumMargins;
    property Margins: TRect read FMargins write FMargins;
    property Dictionary: TIvDictionary read FDictionary write SetDictionary;

  published
    property Options: TIvPageSetupOptions read FOptions write FOptions default [ivpoDefaultMinMargins, ivpoShowHelp];
    property Measurements: TIvPSMeasurements read FMeasurements write FMeasurements default ivpmDefault;
    property Positions: TIvDialogPositions read FPositions write FPositions default [ivdpParent, ivdpCenter];
    property Parent: TWinControl read FParent write FParent;
    property DictionaryName: String read FDictionaryName write SetDictionaryName;
    property OnPrinter: TIvPSPrinterEvent read FOnPrinter write FOnPrinter;
    property OnInitPaintPage: TIvPSInitPaintPageEvent read FOnInitPaintPage write FOnInitPaintPage;
    property OnPaintPage: TIvPSPaintPageEvent read FOnPaintPage write FOnPaintPage;
  end;

function IvPageSetupDlg(
  var ps: TPageSetupDlg;
  dictionary: TIvDictionary;
  center: Boolean;
  parent: HWnd): Bool; stdcall;

function TranslatePageSetupDialog(wnd: HWnd; reserved: Integer): Bool; stdcall;

implementation

uses
  SysUtils, Messages, Forms, Printers;

var
  FCreationControl: TIvPageSetupDialog = nil;
  FHookCtl3D: Boolean;
  FPageSetupDialog: TIvPageSetupDialog;
  FCenter: Boolean;
  FParent: HWnd;
  FPS: TPageSetupDlg;
  FHookProc: TFarProc;
  FCommonDictionary: TIvDictionary;

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

function TranslatePageSetupDialog(wnd: HWnd; reserved: Integer): Bool; stdcall;
begin
  Result := True;

  { Translates the window text }

  case GetWindowLong(wnd, GWL_ID) of
    0: FCommonDictionary.TranslateWindow(wnd, 'Page Setup', False);

    1: FCommonDictionary.TranslateWindow(wnd, 'OK', False);
    2: FCommonDictionary.TranslateWindow(wnd, 'Cancel', False);
    1026: FCommonDictionary.TranslateWindow(wnd, '&Printer...', False);

    1073: FCommonDictionary.TranslateWindow(wnd, 'Paper', False);
    1089: FCommonDictionary.TranslateWindow(wnd, 'Si&ze:', True);
    1090: FCommonDictionary.TranslateWindow(wnd, '&Source:', True);

    1072: FCommonDictionary.TranslateWindow(wnd, 'Orientation', False);
    1056: FCommonDictionary.TranslateWindow(wnd, 'P&ortrait', True);
    1057: FCommonDictionary.TranslateWindow(wnd, 'L&andscape', True);

    1075:
      if (FPS.Flags and PSD_INHUNDREDTHSOFMILLIMETERS) <> 0 then
        FCommonDictionary.TranslateWindow(wnd, 'Margins (millimeters)', False)
      else
        FCommonDictionary.TranslateWindow(wnd, 'Margins (inches)', False);

    1102: FCommonDictionary.TranslateWindow(wnd, '&Left:', True);
    1103: FCommonDictionary.TranslateWindow(wnd, '&Right:', True);
    1104: FCommonDictionary.TranslateWindow(wnd, '&Top:', True);
    1105: FCommonDictionary.TranslateWindow(wnd, '&Bottom:', True);
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
      if (LOWORD(wParam) = WA_ACTIVE) and (FCommonDictionary <> nil) then
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
  FCommonDictionary := dictionary;
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

procedure GetPrinter(var deviceMode, deviceNames: THandle);
var
  Device, Driver, Port: array[0..79] of Char;
  DevNames: PDevNames;
  Offset: PChar;
begin
  Printer.GetPrinter(Device, Driver, Port, DeviceMode);
  if DeviceMode <> 0 then
  begin
    DeviceNames := GlobalAlloc(GHND, SizeOf(TDevNames) +
     StrLen(Device) + StrLen(Driver) + StrLen(Port) + 3);
    DevNames := PDevNames(GlobalLock(DeviceNames));
    try
      Offset := PChar(DevNames) + SizeOf(TDevnames);
      with DevNames^ do
      begin
        wDriverOffset := Longint(Offset) - Longint(DevNames);
        Offset := StrECopy(Offset, Driver) + 1;
        wDeviceOffset := Longint(Offset) - Longint(DevNames);
        Offset := StrECopy(Offset, Device) + 1;
        wOutputOffset := Longint(Offset) - Longint(DevNames);;
        StrCopy(Offset, Port);
      end;
    finally
      GlobalUnlock(DeviceNames);
    end;
  end;
end;

procedure SetPrinter(DeviceMode, DeviceNames: THandle);
var
  DevNames: PDevNames;
begin
  DevNames := PDevNames(GlobalLock(DeviceNames));
  try
    with DevNames^ do
      Printer.SetPrinter(PChar(DevNames) + wDeviceOffset,
        PChar(DevNames) + wDriverOffset,
        PChar(DevNames) + wOutputOffset, DeviceMode);
  finally
    GlobalUnlock(DeviceNames);
    GlobalFree(DeviceNames);
  end;
end;

function CopyData(Handle: THandle): THandle;
var
  Src, Dest: PChar;
  Size: Integer;
begin
  if Handle <> 0 then
  begin
    Size := GlobalSize(Handle);
    Result := GlobalAlloc(GHND, Size);
    if Result <> 0 then
      try
        Src := GlobalLock(Handle);
        Dest := GlobalLock(Result);
        if (Src <> nil) and (Dest <> nil) then
          Move(Src^, Dest^, Size);
      finally
        GlobalUnlock(Handle);
        GlobalUnlock(Result);
      end
  end
  else
    Result := 0;
end;

function IvPageSetupDialogHook(wnd: HWnd; msg: UINT; wParam: WPARAM; lParam: LPARAM):
{$IFDEF IVBIDI}
  UINT;
{$ELSE}
  Integer;
{$ENDIF}
  stdcall;
const
  PAGE_PAINT_WHAT_C: array[WM_PSD_FULLPAGERECT..WM_PSD_YAFULLPAGERECT] of TIvPSPaintWhat = (
    ivpwFullPage, ivpwMinimumMargins, ivpwMargins,
    ivpwGreekText, ivpwEnvStamp, ivpwYAFullPage);
  PRINTER_MASK_C = $00000002;
  ORIENT_MASK_C  = $00000004;
  PAPER_MASK_C   = $00000008;
  IDPRINTERBTN_C = $0402;
var
  paperData: Word;
  paper: TIvPSPaperType;
  orient: TIvPSPaperOrientation;
  printer: TIvPSPrinterType;
  paintRect: TRect;
  paintCanvas: TCanvas;
begin
  Result := 0;
  case msg of
    WM_INITDIALOG:
      begin
        if FHookCtl3D then
        begin
          Subclass3DDlg(Wnd, CTL3D_ALL);
          SetAutoSubClass(True);
        end;
        Result := 1;
      end;

    WM_DESTROY:
      if FHookCtl3D then
        SetAutoSubClass(False);

    WM_COMMAND:
      if (LongRec(WParam).Lo = IDPRINTERBTN_C) and
        (LongRec(WParam).Hi = BN_CLICKED) then
      begin
        Result := Ord(FPageSetupDialog.DoPrinter(Wnd));
      end;

    WM_PSD_PAGESETUPDLG:
      // The dialog box is about to draw the sample page

      if Assigned(FPageSetupDialog.FOnInitPaintPage) then
      begin
        PaperData := HiWord(WParam);
        if (PaperData and PAPER_MASK_C > 0) then
          Paper := ivptEnvelope
        else
          Paper := ivptPaper;

        if (PaperData and ORIENT_MASK_C > 0) then
          Orient := ivpoPortrait
        else
          Orient := ivpoLandscape;

        if (PaperData and PAPER_MASK_C > 0) then
          Printer := ivptHPPCL
        else
          Printer := ivptDotMatrix;

        Result := Ord(
          FPageSetupDialog.FOnInitPaintPage(
            FPageSetupDialog,
            LoWord(WParam),
            Paper,
            Orient,
            Printer,
            PIvPageSetupDlg(LParam)));
      end;

    WM_PSD_FULLPAGERECT,
    WM_PSD_MINMARGINRECT,
    WM_PSD_MARGINRECT,
    WM_PSD_GREEKTEXTRECT,
    WM_PSD_ENVSTAMPRECT,
    WM_PSD_YAFULLPAGERECT:
      // The dialog box is about to draw the sample page

      if Assigned(FPageSetupDialog.FOnPaintPage) then
      begin
        if LParam <> 0 then
          PaintRect := PRect(LParam)^
        else
          PaintRect := Rect(0,0,0,0);

        PaintCanvas := TCanvas.Create;
        PaintCanvas.Handle := HDC(WParam);
        try
          Result := Ord(FPageSetupDialog.FOnPaintPage(
            FPageSetupDialog,
            PAGE_PAINT_WHAT_C[Msg],
            PaintCanvas,
            PaintRect));
        finally
          PaintCanvas.Free;
        end;
      end;
  end;
end;

constructor TIvPageSetupDialog.Create(owner: TComponent);
begin
  inherited Create(owner);
  FOptions := [ivpoDefaultMinMargins, ivpoShowHelp];
  FDictionary := nil;
  FPositions := [ivdpParent, ivdpCenter];
  FOnPrinter := nil;
  FOnInitPaintPage := nil;
  FOnPaintPage := nil;
  FPaperSize := Point(0, 0);
  FMinimumMargins := Rect(0, 0, 0, 0);
  FMargins := Rect(2500, 2500, 2500, 2500);
  FMeasurements := ivpmDefault;
end;

procedure TIvPageSetupDialog.InitDictionary;
begin
  if FDictionaryName <> '' then
    FDictionary := Dictionaries.FindDictionary(FDictionaryName);

  if (FDictionary = nil) and (Dictionaries.Count > 0) then
    FDictionary := Dictionaries[0];
end;

procedure TIvPageSetupDialog.SetDictionary(value: TIvDictionary);
begin
  if value <> FDictionary then
  begin
    FDictionary := value;
    if FDictionary <> nil then
      FDictionaryName := FDictionary.DictionaryName;
  end;
end;

procedure TIvPageSetupDialog.SetDictionaryName(const value: String);
begin
  if FDictionaryName <> value then
  begin
    Dictionary := Dictionaries.FindDictionary(value);
    FDictionaryName := value;
  end;
end;

function TIvPageSetupDialog.GetParentWnd: HWnd;
begin
  if (ivdpParent in FPositions) and (FParent <> nil) then
    Result := FParent.Handle
  else if (ivdpParent in FPositions) and (Owner is TWinControl) then
    Result := TWinControl(Owner).Handle
  else
    Result := Application.Handle;
end;

function TIvPageSetupDialog.TaskModalDialog(DialogFunc: Pointer; var DialogData): Bool;
type
  TDialogFunc = function(
    var DialogData;
    dictionary: TIvDictionary;
    center: Boolean;
    parent: HWnd): Bool stdcall;
var
  ActiveWindow: HWnd;
  WindowList: Pointer;
begin
  ActiveWindow := GetActiveWindow;
  WindowList := DisableTaskWindows(0);
  try
    Application.HookMainWindow(MessageHook);
    try
      FCreationControl := Self;
      Result := TDialogFunc(DialogFunc)(DialogData, FDictionary, ivdpCenter in FPositions, GetParentWnd);
      // Avoid FPU control word change in NETRAP.dll, NETAPI32.dll, etc
{$IFDEF IVWIDE}
      Set8087CW(Default8087CW);
{$ENDIF}
    finally
      Application.UnhookMainWindow(MessageHook);
    end;
  finally
    EnableTaskWindows(WindowList);
    SetActiveWindow(ActiveWindow);
  end;
end;

function TIvPageSetupDialog.DoExecute(func: pointer): Boolean;
const
  PAGE_SETUP_OPTIONS_C: array[TIvPageSetupOption] of DWord = (
    PSD_DEFAULTMINMARGINS, PSD_DISABLEMARGINS, PSD_DISABLEORIENTATION,
    PSD_DISABLEPAGEPAINTING, PSD_DISABLEPAPER, PSD_DISABLEPRINTER,
    PSD_NOWARNING, PSD_SHOWHELP);
var
  isMetric: Boolean;
  option: TIvPageSetupOption;
  pageSetup: TPageSetupDlg;
  savePageSetupDialog: TIvPageSetupDialog;
  devHandle: THandle;
begin
  FillChar(pageSetup, SizeOf(pageSetup), 0);
  with pageSetup do
  try
    lStructSize := SizeOf(TPageSetupDlg);

{$IFDEF IVWIDE}
    hInstance := SysInit.HInstance;
{$ELSE}
    hInstance := System.HInstance;
{$ENDIF}

    hwndOwner := Application.Handle;

    Flags := PSD_MARGINS;

    for Option := Low(Option) to High(Option) do
      if Option in FOptions then
        Flags := Flags or PAGE_SETUP_OPTIONS_C[Option];

    rtMinMargin := FMinimumMargins;
    rtMargin := FMargins;

    if FMeasurements = ivpmDefault then
    begin
      if Dictionary <> nil then
        isMetric := Dictionary.LocaleData.MeasurementSystem = ivmsMetric
      else
        isMetric := GetLocaleStr(LOCALE_USER_DEFAULT, LOCALE_IMEASURE, '0') = '0';

      if isMetric then
        Flags := Flags or PSD_INHUNDREDTHSOFMILLIMETERS
      else
      begin
        Flags := Flags or PSD_INTHOUSANDTHSOFINCHES;

        rtMinMargin.Left := Round(rtMinMargin.Left/254)*100;
        rtMinMargin.Right := Round(rtMinMargin.Right/254)*100;
        rtMinMargin.Top := Round(rtMinMargin.Top/254)*100;
        rtMinMargin.Bottom := Round(rtMinMargin.Bottom/254)*100;

        rtMargin.Left := Round(rtMargin.Left/254)*100;
        rtMargin.Right := Round(rtMargin.Right/254)*100;
        rtMargin.Top := Round(rtMargin.Top/254)*100;
        rtMargin.Bottom := Round(rtMargin.Bottom/254)*100;
      end;
    end
    else if FMeasurements = ivpmMillimeters then
      Flags := Flags or PSD_INHUNDREDTHSOFMILLIMETERS
    else
      Flags := Flags or PSD_INTHOUSANDTHSOFINCHES;

    Flags := Flags or PSD_ENABLEPAGESETUPHOOK or PSD_ENABLEPAGEPAINTHOOK;
    lpfnPageSetupHook := IvPageSetupDialogHook;
    lpfnPagePaintHook := IvPageSetupDialogHook;

    GetPrinter(devHandle, hDevNames);
    hDevMode := CopyData(devHandle);

    FHookCtl3D := Ctl3D;
    ptPaperSize := FPaperSize;

    savePageSetupDialog := FPageSetupDialog;
    FPageSetupDialog := Self;
    Result := TaskModalDialog(Func, pageSetup);
    FPageSetupDialog := savePageSetupDialog;
    if Result then
    begin
      FPaperSize := ptPaperSize;
      FMinimumMargins := rtMinMargin;
      FMargins := rtMargin;
      SetPrinter(hDevMode, hDevNames);
    end
    else
    begin
      if hDevMode <> 0 then
        GlobalFree(hDevMode);
      if hDevNames <> 0 then
        GlobalFree(hDevNames);
    end;
  finally
  end;
end;

function TIvPageSetupDialog.Execute: boolean;
begin
  InitDictionary;
  Result := DoExecute(@IvPageSetupDlg);
end;

function TIvPageSetupDialog.Printer(Wnd: HWND): boolean;
begin
  Result :=  assigned(FOnPrinter);
  if Result then
    FOnPrinter(Self, Wnd);
end;

function TIvPageSetupDialog.DoPrinter(Wnd: HWND): boolean;
begin
  try
    Result := Printer(Wnd);
  except
    Result := FALSE;
    Application.HandleException(Self);
  end;
end;

end.
