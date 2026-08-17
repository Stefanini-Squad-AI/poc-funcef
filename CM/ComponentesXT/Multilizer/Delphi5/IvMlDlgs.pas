unit IvMlDlgs;

{$I IVMULTI.INC}

{$R-}

{$IFNDEF WIN32}
  {$S-,W-}
  {$C PRELOAD}
{$ENDIF}

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, CommDlg,
  StdCtrls, ExtCtrls, Buttons, IvDictio;

type
{$IFDEF WIN32}
  { TIvCommonDialog }

  TIvCommonDialog = class(TComponent)
  private
    FCtl3D: Boolean;
    FDefWndProc: Pointer;
    FHelpContext: THelpContext;
    FHandle: HWnd;
    FObjectInstance: Pointer;
    FTemplate: PChar;
    FParent: TWinControl;
    FPositions: TIvDialogPositions;
    FDictionary: TIvDictionary;
    FDictionaryName: String;
    FOnClose: TNotifyEvent;
    FOnShow: TNotifyEvent;

    procedure WMDestroy(var msg: TWMDestroy); message WM_DESTROY;
    procedure WMInitDialog(var msg: TWMInitDialog); message WM_INITDIALOG;
    procedure WMNCDestroy(var msg: TWMNCDestroy); message WM_NCDESTROY;
    procedure MainWndProc(var Message: TMessage);

  protected
    procedure DoClose; dynamic;
    procedure DoShow; dynamic;
    procedure WndProc(var msg: TMessage); virtual;
    function MessageHook(var msg: TMessage): Boolean; virtual;
    function TaskModalDialog(dialogFunc: Pointer; var dialogData): Bool; virtual;
    function Execute: Boolean; virtual; abstract;
    property Template: PChar read FTemplate write FTemplate;

    procedure SetDictionary(value: TIvDictionary);
    procedure SetDictionaryName(const value: String);
    procedure InitDictionary;
    function GetParentWnd: HWnd;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure DefaultHandler(var msg); override;

    property Handle: HWnd read FHandle;
    property Dictionary: TIvDictionary read FDictionary write SetDictionary;

  published
    property Ctl3D: Boolean read FCtl3D write FCtl3D default True;
    property HelpContext: THelpContext read FHelpContext write FHelpContext default 0;
    property Positions: TIvDialogPositions read FPositions write FPositions default [ivdpParent, ivdpCenter];
    property Parent: TWinControl read FParent write FParent;
    property DictionaryName: String read FDictionaryName write SetDictionaryName;
    property OnClose: TNotifyEvent read FOnClose write FOnClose;
    property OnShow: TNotifyEvent read FOnShow write FOnShow;
  end;

  TIvOpenDialog = class(TIvCommonDialog)
  private
    FHistoryList: TStrings;
    FOptions: TOpenOptions;
    FFilter: String;
    FFilterIndex: Integer;
    FCurrentFilterIndex: Integer;
    FInitialDir: String;
    FTitle: String;
    FDefaultExt: String;
    FFileName: String;
    FFiles: TStrings;
    FFileEditStyle: TFileEditStyle;
    FOnSelectionChange: TNotifyEvent;
    FOnFolderChange: TNotifyEvent;
    FOnTypeChange: TNotifyEvent;

    function GetFileName: String;
    function GetFilterIndex: Integer;
    procedure ReadFileEditStyle(Reader: TReader);
    procedure SetHistoryList(Value: TStrings);
    procedure SetInitialDir(const Value: String);

  protected
    procedure WndProc(var msg: TMessage); override;
    procedure DefineProperties(Filer: TFiler); override;
    function DoExecute(Func: Pointer): Bool;
    procedure DoSelectionChange; dynamic;
    procedure DoFolderChange; dynamic;
    procedure DoTypeChange; dynamic;
{$IFDEF IVWIDE}
    function GetStaticRect: TRect; virtual;
{$ENDIF}

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean; override;

    property FileEditStyle: TFileEditStyle read FFileEditStyle write FFileEditStyle;
    property Files: TStrings read FFiles;
    property HistoryList: TStrings read FHistoryList write SetHistoryList;

  published
    property DefaultExt: String read FDefaultExt write FDefaultExt;
    property FileName: String read GetFileName write FFileName;
    property Filter: String read FFilter write FFilter;
    property FilterIndex: Integer read GetFilterIndex write FFilterIndex default 1;
    property InitialDir: String read FInitialDir write SetInitialDir;
    property Options: TOpenOptions read FOptions write FOptions default [ofNoNetworkButton];
    property Title: String read FTitle write FTitle;
    property OnFolderChange: TNotifyEvent read FOnFolderChange write FOnFolderChange;
    property OnSelectionChange: TNotifyEvent read FOnSelectionChange write FOnSelectionChange;
    property OnTypeChange: TNotifyEvent read FOnTypeChange write FOnTypeChange;
  end;

  TIvSaveDialog = class(TIvOpenDialog)
  public
    function Execute: Boolean; override;
  end;

{$IFDEF IVWIDE}
  TIvOpenPictureDialog = class(TIvOpenDialog)
  private
    FPicture: TPicture;
    FPicturePanel: TPanel;
    FPictureLabel: TLabel;
    FPreviewButton: TSpeedButton;
    FPaintPanel: TPanel;
    FPaintBox: TPaintBox;

    procedure PaintBoxPaint(Sender: TObject);
    procedure PreviewClick(Sender: TObject);
    procedure PreviewKeyPress(Sender: TObject; var Key: Char);

  protected
    procedure DoClose; override;
    procedure DoSelectionChange; override;
    procedure DoShow; override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function Execute: Boolean; override;
  end;

  TIvSavePictureDialog = class(TIvOpenPictureDialog)
    function Execute: Boolean; override;
  end;
{$ENDIF}

  TIvColorDialog = class(TIvCommonDialog)
  private
    FColor: TColor;
    FOptions: TColorDialogOptions;
    FCustomColors: TStrings;

    procedure SetCustomColors(Value: TStrings);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean; override;

  published
    property Color: TColor read FColor write FColor default clBlack;
    property Ctl3D default False;
    property CustomColors: TStrings read FCustomColors write SetCustomColors;
    property Options: TColorDialogOptions read FOptions write FOptions default [];
  end;

  TIvFontDialog = class(TIvCommonDialog)
  private
    FFont: TFont;
    FDevice: TFontDialogDevice;
    FOptions: TFontDialogOptions;
    FOnApply: TFDApplyEvent;
    FMinFontSize: Integer;
    FMaxFontSize: Integer;
    FFontCharsetModified: Boolean;
    FFontColorModified: Boolean;

    procedure DoApply(Wnd: HWND);
    procedure SetFont(Value: TFont);
    procedure UpdateFromLogFont(const LogFont: TLogFont);

  protected
    procedure Apply(Wnd: HWND); dynamic;
{$IFDEF IVWIDE}
    procedure WndProc(var msg: TMessage); override;
{$ENDIF}

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean; override;

  published
    property Font: TFont read FFont write SetFont;
    property Device: TFontDialogDevice read FDevice write FDevice default fdScreen;
    property MinFontSize: Integer read FMinFontSize write FMinFontSize;
    property MaxFontSize: Integer read FMaxFontSize write FMaxFontSize;
    property Options: TFontDialogOptions read FOptions write FOptions default [fdEffects];
    property OnApply: TFDApplyEvent read FOnApply write FOnApply;
  end;

  TIvPrinterSetupDialog = class(TIvCommonDialog)
  public
    function Execute: Boolean; override;
  end;

  TIvPrintDialog = class(TIvCommonDialog)
  private
    FFromPage: Integer;
    FToPage: Integer;
    FCollate: Boolean;
    FOptions: TPrintDialogOptions;
    FPrintToFile: Boolean;
    FPrintRange: TPrintRange;
    FMinPage: Integer;
    FMaxPage: Integer;
    FCopies: Integer;

    procedure SetNumCopies(Value: Integer);

  public
    function Execute: Boolean; override;

  published
    property Collate: Boolean read FCollate write FCollate default False;
    property Copies: Integer read FCopies write SetNumCopies default 0;
    property FromPage: Integer read FFromPage write FFromPage default 0;
    property MinPage: Integer read FMinPage write FMinPage default 0;
    property MaxPage: Integer read FMaxPage write FMaxPage default 0;
    property Options: TPrintDialogOptions read FOptions write FOptions default [];
    property PrintToFile: Boolean read FPrintToFile write FPrintToFile default False;
    property PrintRange: TPrintRange read FPrintRange write FPrintRange default prAllPages;
    property ToPage: Integer read FToPage write FToPage default 0;
  end;

  TIvFindFunc = function(var data: TFindReplace; dictionary: TIvDictionary; center: Boolean): HWnd stdcall;

  TIvFindDialog = class(TIvCommonDialog)
  private
    FOptions: TFindOptions;
    FPosition: TPoint;
    FFindReplaceFunc: TIvFindFunc;
    FRedirector: TWinControl;
    FOnFind: TNotifyEvent;
    FOnReplace: TNotifyEvent;
    FFindHandle: HWnd;
    FFindReplace: TFindReplace;
    FFindText: array[0..255] of Char;
    FReplaceText: array[0..255] of Char;

    function GetFindText: string;
    function GetLeft: Integer;
    function GetPosition: TPoint;
    function GetReplaceText: string;
    function GetTop: Integer;
    procedure SetFindText(const Value: string);
    procedure SetLeft(Value: Integer);
    procedure SetPosition(const Value: TPoint);
    procedure SetReplaceText(const Value: string);
    procedure SetTop(Value: Integer);

  protected
    function MessageHook(var msg: TMessage): Boolean; override;
    procedure Find; dynamic;
    procedure Replace; dynamic;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CloseDialog;
    function Execute: Boolean; override;
    property Left: Integer read GetLeft write SetLeft;
    property Position: TPoint read GetPosition write SetPosition;
    property Top: Integer read GetTop write SetTop;

  published
    property FindText: string read GetFindText write SetFindText;
    property Options: TFindOptions read FOptions write FOptions default [frDown];
    property OnFind: TNotifyEvent read FOnFind write FOnFind;
  end;

  TIvReplaceDialog = class(TIvFindDialog)
  public
    constructor Create(AOwner: TComponent); override;

  published
    property ReplaceText: string read GetReplaceText write SetReplaceText;
    property OnReplace: TNotifyEvent read FOnReplace write FOnReplace;
  end;

{$ELSE}
  { 16 bit }

  TIvCommonDialog = class(TComponent)
  private
    FCtl3D: Boolean;
    FHelpContext: THelpContext;
    FDictionary: TIvDictionary;
    FDictionaryName: String;

  protected
    function Message(var msg: TMessage): Boolean; virtual;

    procedure SetDictionary(value: TIvDictionary);
    procedure SetDictionaryName(const value: String);
    procedure InitDictionary;

  public
    constructor Create(AOwner: TComponent); override;

    property Dictionary: TIvDictionary read FDictionary write SetDictionary;

  published
    property Ctl3D: Boolean read FCtl3D write FCtl3D default True;
    property HelpContext: THelpContext read FHelpContext write FHelpContext default 0;
    property DictionaryName: String read FDictionaryName write SetDictionaryName;
  end;

  TIvOpenDialog = class;
  TIvComboButton = class;

  TIvDlgControl = class(TObject)
  private
    FObjectInstance: Pointer;
    FDefWndProc: Pointer;
    FOwner: TIvComboButton;
    FHandle: THandle;
    FVisible: Boolean;
    FReserved: Byte;

    constructor Create(Owner: TIvComboButton);
    destructor Destroy; override;
    procedure Init; virtual; abstract;
    procedure DefaultHandler(var msg); override;
    procedure SetVisible(Value: Boolean);
    procedure MainWndProc(var msg: TMessage);
    procedure WndProc(var msg: TMessage); virtual;
    procedure WMNCDestroy(var msg: TWMNCDestroy); message WM_NCDESTROY;
  end;

  TIvComboButton = class(TObject)
  private
    FObjectInstance: Pointer;
    FDefWndProc: Pointer;
    FEditWnd: HWnd;
    FHandle: HWnd;
    FCanvas: TCanvas;
    FGlyph: TBitmap;
    FDown: Boolean;
    FPressed: Boolean;
    FOpenDialog: TIvOpenDialog;
    FDropListBox: TIvDlgControl;
    FEditControl: TIvDlgControl;
    FDlg: TIvDlgControl;

    constructor Create(Owner: TIvOpenDialog);
    destructor Destroy; override;
    procedure Closeup;
    procedure DropDown;
    procedure RegisterClass;
    procedure Repaint;
    procedure WMCommand(var msg: TWMCommand); message WM_COMMAND;
    procedure WMDestroy(var msg: TWMDestroy); message WM_DESTROY;
    procedure WMNCDestroy(var msg: TWMNCDestroy); message WM_NCDESTROY;
    procedure WMPaint(var msg: TWMPaint); message WM_PAINT;
    procedure WMLButtonDown(var msg: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMLButtonUp(var msg: TWMLButtonUp); message WM_LBUTTONUP;
    procedure WMMouseMove(var msg: TWMMouseMove); message WM_MOUSEMOVE;
    procedure CreateWnd(Dlg: HWnd; ControlID: Word);
    procedure DefaultHandler(var msg); override;
    procedure WndProc(var msg: TMessage);
  end;

  TIvOpenDialog = class(TIvCommonDialog)
  private
    FHistoryList: TStrings;
    FComboBox: TIvComboButton;
    FOptions: TOpenOptions;
    FFilter: PString;
    FFilterIndex: Integer;
    FInitialDir: PString;
    FTitle: PString;
    FDefaultExt: TFileExt;
    FFileName: TFileName;
    FFiles: TStrings;
    FFileEditStyle: TFileEditStyle;
    FReserved: Byte;

    function GetFilter: string;
    function GetInitialDir: string;
    function GetFiles: TStrings;
    function GetTitle: string;
    procedure SetFilter(const AFilter: string);
    procedure SetInitialDir(const AInitialDir: string);
    procedure SetHistoryList(Value: TStrings);
    procedure SetTitle(const ATitle: string);
    function DoExecute(Func: Pointer): Bool;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean; virtual;
    property Files: TStrings read GetFiles;

  published
    property DefaultExt: TFileExt read FDefaultExt write FDefaultExt;
    property FileEditStyle: TFileEditStyle read FFileEditStyle write FFileEditStyle default fsEdit;
    property FileName: TFileName read FFileName write FFileName;
    property Filter: string read GetFilter write SetFilter;
    property FilterIndex: Integer read FFilterIndex write FFilterIndex default 1;
    property InitialDir: string read GetInitialDir write SetInitialDir;
    property HistoryList: TStrings read FHistoryList write SetHistoryList;
    property Options: TOpenOptions read FOptions write FOptions default [];
    property Title: string read GetTitle write SetTitle;
  end;

  TIvSaveDialog = class(TIvOpenDialog)
    function Execute: Boolean; override;
  end;

  TIvColorDialog = class(TIvCommonDialog)
  private
    FColor: TColor;
    FOptions: TColorDialogOptions;
    FCustomColors: TStrings;
    procedure SetCustomColors(Value: TStrings);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean;

  published
    property Color: TColor read FColor write FColor default clBlack;
    property Ctl3D default False;
    property CustomColors: TStrings read FCustomColors write SetCustomColors;
    property Options: TColorDialogOptions read FOptions write FOptions default [];
  end;

  TIvFontDialog = class(TIvCommonDialog)
  private
    FFont: TFont;
    FDevice: TFontDialogDevice;
    FOptions: TFontDialogOptions;
    FOnApply: TFDApplyEvent;
    FMinFontSize: Integer;
    FMaxFontSize: Integer;
    procedure DoApply(Wnd: HWND);
    procedure SetFont(Value: TFont);
    procedure UpdateFromLogFont(const LogFont: TLogFont);

  protected
    procedure Apply(Wnd: HWND); dynamic;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean;

  published
    property Font: TFont read FFont write SetFont;
    property Device: TFontDialogDevice read FDevice write FDevice default fdScreen;
    property MinFontSize: Integer read FMinFontSize write FMinFontSize;
    property MaxFontSize: Integer read FMaxFontSize write FMaxFontSize;
    property Options: TFontDialogOptions read FOptions write FOptions default [fdEffects];
    property OnApply: TFDApplyEvent read FOnApply write FOnApply;
  end;

  TIvPrinterSetupDialog = class(TIvCommonDialog)
  public
    procedure Execute;
  end;

  TIvPrintDialog = class(TIvPrinterSetupDialog)
  private
    FFromPage: Integer;
    FToPage: Integer;
    FCollate: Boolean;
    FOptions: TPrintDialogOptions;
    FPrintToFile: Boolean;
    FPrintRange: TPrintRange;
    FMinPage: Integer;
    FMaxPage: Integer;
    FCopies: Integer;

  public
    function Execute: Boolean;

  published
    property Collate: Boolean read FCollate write FCollate default False;
    property Copies: Integer read FCopies write FCopies default 0;
    property FromPage: Integer read FFromPage write FFromPage default 0;
    property MinPage: Integer read FMinPage write FMinPage default 0;
    property MaxPage: Integer read FMaxPage write FMaxPage default 0;
    property Options: TPrintDialogOptions read FOptions write FOptions default [];
    property PrintToFile: Boolean read FPrintToFile write FPrintToFile default False;
    property PrintRange: TPrintRange read FPrintRange write FPrintRange default prAllPages;
    property ToPage: Integer read FToPage write FToPage default 0;
  end;

  TIvFindDialog = class(TIvCommonDialog)
  private
    FOnFind: TNotifyEvent;
    FOptions: TFindOptions;
    FFindText: string;
    FFindReplace: TFindReplace;
    FSafeHandle: HWnd;
    FLeft: Integer;
    FTop: Integer;

    function DoExecute(Func: Pointer): Bool;

  protected
    procedure ConvertFields; virtual;
    procedure ConvertFieldsForCallBack; virtual;
    function GetLeft: Integer;
    function GetTop: Integer;
    procedure SetLeft(Value: Integer);
    procedure SetTop(Value: Integer);
    function GetPosition: TPoint;
    procedure SetPosition(const Point: TPoint);
    function Message(var msg: TMessage): Boolean; override;
    procedure Find; dynamic;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean; virtual;
    procedure CloseDialog;
    property Position: TPoint read GetPosition write SetPosition;
    property Handle: HWnd read FSafeHandle;
    property Left: Integer read GetLeft write SetLeft default -1;
    property Top: Integer read GetTop write SetTop default -1;

  published
    property FindText: String read FFindText write FFindText;
    property Options: TFindOptions read FOptions write FOptions default [frDown];
    property OnFind: TNotifyEvent read FOnFind write FOnFind;
  end;

  TIvReplaceDialog = class(TIvFindDialog)
  private
    FOnReplace: TNotifyEvent;
    FReplaceText: string;

  protected
    procedure ConvertFields; override;
    procedure ConvertFieldsForCallBack; override;
    procedure Replace; dynamic;

  public
    destructor Destroy; override;
    function Execute: Boolean; override;
    function Message(var msg: TMessage): Boolean; override;

  published
    property ReplaceText: string read FReplaceText write FReplaceText;
    property OnReplace: TNotifyEvent read FOnReplace write FOnReplace;
  end;
{$ENDIF}

implementation

{$IFDEF WIN32}
uses
{$IFDEF IVWIDE}
  ExtDlgs, Dlgs,
{$ENDIF}
  CommCtrl, Printers,
  IvDialog, IvMlCons;

{$IFDEF IVWIDE}
  {$R IVMLDLGS.RES}
{$ENDIF}

const
  IDAPPLYBTN = $402;

var
  creationControl: TIvCommonDialog = nil;
  helpMsg: Cardinal;
  findMsg: Cardinal;
  wndProcPtrAtom: TAtom = 0;
  hookCtl3D: Boolean;
  commonTitle: String;
  fontDialog: TIvFontDialog;

function DialogHook(Wnd: HWnd; Msg: UINT; WParam: WPARAM; LParam: LPARAM): UINT; stdcall;
begin
  Result := 0;
  case Msg of
    WM_INITDIALOG:
      begin
        if HookCtl3D then
        begin
          Subclass3DDlg(Wnd, CTL3D_ALL);
          SetAutoSubClass(True);
        end;
        CreationControl.FHandle := Wnd;
        CreationControl.FDefWndProc := Pointer(SetWindowLong(Wnd, GWL_WNDPROC,
          Longint(CreationControl.FObjectInstance)));
        CallWindowProc(CreationControl.FObjectInstance, Wnd, Msg, WParam, LParam);
        CreationControl := nil;
      end;
    WM_DESTROY:
      if HookCtl3D then
        SetAutoSubClass(False);
  end;
end;

{ TIvCommonDialog }

constructor TIvCommonDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCtl3D := True;
  FObjectInstance := MakeObjectInstance(MainWndProc);
  FDictionary := nil;
  FPositions := [ivdpParent, ivdpCenter];
end;

destructor TIvCommonDialog.Destroy;
begin
  if FObjectInstance <> nil then
    FreeObjectInstance(FObjectInstance);
  inherited Destroy;
end;

function TIvCommonDialog.GetParentWnd: HWnd;
begin
  if (ivdpParent in FPositions) and (FParent <> nil) then
    Result := FParent.Handle
  else if (ivdpParent in FPositions) and (Owner is TWinControl) then
    Result := TWinControl(Owner).Handle
  else
    Result := Application.Handle;
end;

procedure TIvCommonDialog.InitDictionary;
begin
  if FDictionaryName <> '' then
    FDictionary := Dictionaries.FindDictionary(FDictionaryName);

  if (FDictionary = nil) and (Dictionaries.Count > 0) then
    FDictionary := Dictionaries[0];
end;

procedure TIvCommonDialog.SetDictionary(value: TIvDictionary);
begin
  if value <> FDictionary then
  begin
    FDictionary := value;
    if FDictionary <> nil then
      FDictionaryName := FDictionary.DictionaryName;
  end;
end;

procedure TIvCommonDialog.SetDictionaryName(const value: String);
begin
  if FDictionaryName <> value then
  begin
    Dictionary := Dictionaries.FindDictionary(value);
    FDictionaryName := value;
  end;
end;

function TIvCommonDialog.MessageHook(var msg: TMessage): Boolean;
begin
  Result := False;
  if (Msg.Msg = HelpMsg) and (FHelpContext <> 0) then
  begin
    Application.HelpContext(FHelpContext);
    Result := True;
  end;
end;

procedure TIvCommonDialog.DefaultHandler(var msg);
begin
  if FHandle <> 0 then
    with TMessage(msg) do
      Result := CallWindowProc(FDefWndProc, FHandle, Msg, WParam, LParam)
  else inherited DefaultHandler(msg);
end;

procedure TIvCommonDialog.MainWndProc(var Message: TMessage);
begin
  try
    WndProc(Message);
  except
    Application.HandleException(Self);
  end;
end;

procedure TIvCommonDialog.WndProc(var msg: TMessage);
begin
  Dispatch(msg);
end;

procedure TIvCommonDialog.WMDestroy(var msg: TWMDestroy);
begin
  inherited;
  DoClose;
end;

procedure TIvCommonDialog.WMInitDialog(var msg: TWMInitDialog);
begin
  { Called only by non-explorer style dialogs }
  DoShow;
  { Prevent any further processing }
  msg.Result := 0;
end;

procedure TIvCommonDialog.WMNCDestroy(var msg: TWMNCDestroy);
begin
  inherited;
  FHandle := 0;
end;

function TIvCommonDialog.TaskModalDialog(DialogFunc: Pointer; var DialogData): Bool;
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
      CreationControl := Self;
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

procedure TIvCommonDialog.DoClose;
begin
  if Assigned(FOnClose) then
    FOnClose(Self);
end;

procedure TIvCommonDialog.DoShow;
begin
  if Assigned(FOnShow) then
    FOnShow(Self);
end;


{ TIvOpenDialog }

function IvExplorerOpenDialogHook(wnd: HWnd; msg: UINT; wParam: WPARAM; lParam: LPARAM):
{$IFDEF IVBIDI}
  UINT;
{$ELSE}
  Integer;
{$ENDIF}
  stdcall;
begin
  Result := 0;
  case msg of
    WM_INITDIALOG:
    begin
      CreationControl.FHandle := wnd;
      CreationControl.FDefWndProc := Pointer(SetWindowLong(
        wnd,
        GWL_WNDPROC,
        Longint(CreationControl.FObjectInstance)));
      CallWindowProc(CreationControl.FObjectInstance, wnd, msg, wParam, lParam);
      CreationControl := nil;
    end;
  end;
end;

function IvOpenDialogHook(wnd: HWnd; msg: UINT; wParam: WPARAM; lParam: LPARAM):
{$IFDEF IVBIDI}
  UINT;
{$ELSE}
  Integer;
{$ENDIF}
  stdcall;
begin
  Result := 0;
  case msg of
    WM_INITDIALOG:
      begin
        if HookCtl3D then
        begin
          Subclass3DDlg(Wnd, CTL3D_ALL);
          SetAutoSubClass(True);
        end;
        CreationControl.FHandle := Wnd;
        CreationControl.FDefWndProc := Pointer(SetWindowLong(
          wnd,
          GWL_WNDPROC,
          Longint(CreationControl.FObjectInstance)));
        CallWindowProc(CreationControl.FObjectInstance, wnd, msg, wParam, lParam);
        CreationControl := nil;
      end;

    WM_DESTROY:
      if HookCtl3D then
        SetAutoSubClass(False);
  end;
end;

function IvExplorerSaveDialogHook(wnd: HWnd; msg: UINT; wParam: WPARAM; lParam: LPARAM):
{$IFDEF IVBIDI}
  UINT;
{$ELSE}
  Integer;
{$ENDIF}
  stdcall;
begin
  Result := 0;
  case msg of
    WM_INITDIALOG:
    begin
      CreationControl.FHandle := Wnd;
      CreationControl.FDefWndProc := Pointer(SetWindowLong(
        wnd,
        GWL_WNDPROC,
        Longint(CreationControl.FObjectInstance)));
      CallWindowProc(CreationControl.FObjectInstance, wnd, msg, wParam, lParam);
      CreationControl := nil;
    end;
  end;
end;

function IvSaveDialogHook(wnd: HWnd; msg: UINT; wParam: WPARAM; lParam: LPARAM):
{$IFDEF IVBIDI}
  UINT;
{$ELSE}
  Integer;
{$ENDIF}
  stdcall;
begin
  Result := 0;
  case msg of
    WM_INITDIALOG:
      begin
        if HookCtl3D then
        begin
          Subclass3DDlg(Wnd, CTL3D_ALL);
          SetAutoSubClass(True);
        end;
        CreationControl.FHandle := Wnd;
        CreationControl.FDefWndProc := Pointer(SetWindowLong(
          wnd,
          GWL_WNDPROC,
          Longint(CreationControl.FObjectInstance)));
        CallWindowProc(CreationControl.FObjectInstance, wnd, msg, wParam, lParam);
        CreationControl := nil;
      end;

    WM_DESTROY:
      if HookCtl3D then
        SetAutoSubClass(False);
  end;
end;

constructor TIvOpenDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FHistoryList := TStringList.Create;
  FOptions := [ofHideReadOnly];
  FFiles := TStringList.Create;
  FFilterIndex := 1;
  FFileEditStyle := fsEdit;
end;

destructor TIvOpenDialog.Destroy;
begin
  FFiles.Free;
  FHistoryList.Free;
  inherited Destroy;
end;

procedure TIvOpenDialog.WndProc(var msg: TMessage);
var
  index: Integer;
begin
  msg.Result := 0;
  { If not ofOldStyleDialog then DoShow on CDN_INITDONE, not WM_INITDIALOG }
  if (msg.Msg = WM_INITDIALOG) and not (ofOldStyleDialog in Options) then
    Exit
  else if (msg.Msg = WM_NOTIFY) then
  begin
    case (POFNotify(msg.LParam)^.hdr.code) of
      CDN_INITDONE:
        DoShow;

      CDN_SELCHANGE:
        DoSelectionChange;

      CDN_FOLDERCHANGE:
        DoFolderChange;

      CDN_TYPECHANGE:
      begin
        index := POFNotify(msg.LParam)^.lpOFN^.nFilterIndex;
        if index <> FCurrentFilterIndex then
        begin
          FCurrentFilterIndex := index;
          DoTypeChange;
        end;
      end;
    end;
  end;

  inherited WndProc(msg);
end;

procedure TIvOpenDialog.DoSelectionChange;
begin
  if Assigned(FOnSelectionChange) then FOnSelectionChange(Self);
end;

procedure TIvOpenDialog.DoFolderChange;
begin
  if Assigned(FOnFolderChange) then FOnFolderChange(Self);
end;

procedure TIvOpenDialog.DoTypeChange;
begin
  if Assigned(FOnTypeChange) then FOnTypeChange(Self);
end;

procedure TIvOpenDialog.ReadFileEditStyle(Reader: TReader);
begin
  { Ignore FileEditStyle }
  Reader.ReadIdent;
end;

procedure TIvOpenDialog.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('FileEditStyle', ReadFileEditStyle, nil, False);
end;

function TIvOpenDialog.DoExecute(Func: Pointer): Bool;
const
  MultiSelectBufferSize = 8192;
  OpenOptions: array [TOpenOption] of Longint = (
    OFN_READONLY, OFN_OVERWRITEPROMPT, OFN_HIDEREADONLY,
    OFN_NOCHANGEDIR, OFN_SHOWHELP, OFN_NOVALIDATE, OFN_ALLOWMULTISELECT,
    OFN_EXTENSIONDIFFERENT, OFN_PATHMUSTEXIST, OFN_FILEMUSTEXIST,
    OFN_CREATEPROMPT, OFN_SHAREAWARE, OFN_NOREADONLYRETURN,
    OFN_NOTESTFILECREATE, OFN_NONETWORKBUTTON, OFN_NOLONGNAMES,
    OFN_EXPLORER, OFN_NODEREFERENCELINKS
{$IFDEF IVBIDI}
    , OFN_ENABLEINCLUDENOTIFY, OFN_ENABLESIZING
{$ENDIF}
    );
var
  Option: TOpenOption;
  OpenFilename: TOpenFilename;
{$IFDEF IVWIDE}
  Separator: Char;
{$ENDIF}

{$IFDEF IVWIDE}
  function AllocFilterStr(const S: string): string;
  var
    P: PChar;
  begin
    Result := '';
    if S <> '' then
    begin
      Result := S + #0;  // double null terminators
      P := AnsiStrScan(PChar(Result), '|');
      while P <> nil do
      begin
        P^ := #0;
        Inc(P);
        P := AnsiStrScan(P, '|');
      end;
    end;
  end;
{$ELSE}
  function AllocFilterStr(const S: string): PChar;
  var
    P: PChar;
  begin
    Result := nil;
    if S <> '' then
    begin
      Result := StrCopy(StrAlloc(Length(S) + 2), PChar(S));
      P := Result;
      while P^ <> #0 do
      begin
        if P^ = '|' then
          P^ := #0;
        Inc(P);
      end;
      Inc(P);
      P^ := #0;
    end;
  end;
{$ENDIF}

  function ExtractFileName(P: PChar; var S: string): PChar;
{$IFNDEF IVWIDE}
  var
    Separator: Char;
{$ENDIF}
  begin
{$IFDEF IVWIDE}
    Result := AnsiStrScan(P, Separator);
    if Result = nil then
    begin
      S := P;
      Result := StrEnd(P);
    end
    else
    begin
      SetString(S, P, Result - P);
      Inc(Result);
    end;
{$ELSE}
    Separator := #0;
    if (ofAllowMultiSelect in FOptions) and
      ((ofOldStyleDialog in FOptions) or not NewStyleControls) then
    begin
      Separator := ' ';
    end;
    Result := P;
    while (Result[0] <> #0) and (Result[0] <> Separator) do
      Inc(Result);
    SetString(S, P, Result - P);
    if Result[0] = Separator then
      Inc(Result);
{$ENDIF}
  end;

  procedure ExtractFileNames(P: PChar);
  var
    DirName, FileName: string;
  begin
    P := ExtractFileName(P, DirName);
    P := ExtractFileName(P, FileName);
    if FileName = '' then
      FFiles.Add(DirName)
    else
    begin
{$IFDEF IVWIDE}
      if AnsiLastChar(DirName)^ <> '\' then
        DirName := DirName + '\';
{$ELSE}
      if DirName[Length(DirName)] <> '\' then
        DirName := DirName + '\';
{$ENDIF}
      repeat
        if (FileName[1] <> '\') and ((Length(FileName) <= 3) or
          (FileName[2] <> ':') or (FileName[3] <> '\')) then
          FileName := DirName + FileName;
        FFiles.Add(FileName);
        P := ExtractFileName(P, FileName);
      until FileName = '';
    end;
  end;

var
  TempFilename, TempExt: String;
{$IFDEF IVWIDE}
  TempFilter: String;
{$ENDIF}
begin
{$IFDEF IVWIDE}
  Separator := #0;
  if (ofAllowMultiSelect in FOptions) and
    ((ofOldStyleDialog in FOptions) or not NewStyleControls) then
    Separator := ' ';
{$ENDIF}
  FFiles.Clear;
  FillChar(OpenFileName, SizeOf(OpenFileName), False);
  with OpenFilename do
  begin
    lStructSize := SizeOf(TOpenFilename);

{$IFDEF IVWIDE}
    hInstance := SysInit.HInstance;
{$ELSE}
    hInstance := HInstance;
{$ENDIF}

    hwndOwner := Application.Handle;

{$IFDEF IVWIDE}
    TempFilter := AllocFilterStr(FFilter);
    lpstrFilter := PChar(TempFilter);
{$ELSE}
    lpstrFilter := AllocFilterStr(FFilter);
{$ENDIF}
    nFilterIndex := FFilterIndex;

    if ofAllowMultiSelect in FOptions then
      nMaxFile := MultiSelectBufferSize
    else
      nMaxFile := MAX_PATH;

    SetLength(TempFilename, nMaxFile + 2);
    lpstrFile := PChar(TempFilename);
    FillChar(lpstrFile^, nMaxFile + 2, False);
    StrLCopy(lpstrFile, PChar(FFileName), nMaxFile);
    lpstrInitialDir := PChar(FInitialDir);
    lpstrTitle := PChar(FTitle);
    HookCtl3D := FCtl3D;
    Flags := OFN_ENABLEHOOK;
    for Option := Low(Option) to High(Option) do
    begin
      if Option in FOptions then
        Flags := Flags or Cardinal(OpenOptions[Option]);
    end;

    if NewStyleControls then
      Flags := Flags xor OFN_EXPLORER
    else
      Flags := Flags and not OFN_EXPLORER;

    TempExt := FDefaultExt;
    if (TempExt = '') and (Flags and OFN_EXPLORER = 0) then
    begin
      TempExt := ExtractFileExt(FFilename);
      Delete(TempExt, 1, 1);
    end;

    if TempExt <> '' then
      lpstrDefExt := PChar(TempExt);

    if (ofOldStyleDialog in Options) or not NewStyleControls then
    begin
      if Func = @IvGetOpenFileName then
        lpfnHook := IvOpenDialogHook
      else
        lpfnHook := IvSaveDialogHook;
    end
    else
    begin
      if Func = @IvGetOpenFileName then
        lpfnHook := IvExplorerOpenDialogHook
      else
        lpfnHook := IvExplorerSaveDialogHook;
    end;

    if Template <> nil then
    begin
      Flags := Flags or OFN_ENABLETEMPLATE;
      lpTemplateName := Template;
    end;

    commonTitle := Title;
    Result := TaskModalDialog(Func, OpenFileName);
    if Result then
    begin
      if ofAllowMultiSelect in FOptions then
      begin
        ExtractFileNames(lpstrFile);
        FFileName := FFiles[0];
      end
      else
      begin
        ExtractFileName(lpstrFile, FFileName);
        FFiles.Add(FFileName);
      end;
      if (Flags and OFN_EXTENSIONDIFFERENT) <> 0 then
        Include(FOptions, ofExtensionDifferent)
      else
        Exclude(FOptions, ofExtensionDifferent);
      if (Flags and OFN_READONLY) <> 0 then
        Include(FOptions, ofReadOnly)
      else
        Exclude(FOptions, ofReadOnly);
      FFilterIndex := nFilterIndex;
    end;
  end;
end;

{$IFDEF IVWIDE}
function TIvOpenDialog.GetStaticRect: TRect;
begin
  if FHandle <> 0 then
  begin
    if not (ofOldStyleDialog in Options) then
    begin
      GetWindowRect(GetDlgItem(FHandle, stc32), Result);
      MapWindowPoints(0, FHandle, Result, 2);
    end
    else
      GetClientRect(FHandle, Result)
  end
  else
    Result := Rect(0,0,0,0);
end;
{$ENDIF}

function TIvOpenDialog.GetFileName: string;
var
  Path: array[0..MAX_PATH] of Char;
begin
  if NewStyleControls and (FHandle <> 0) then
  begin
    SendMessage(GetParent(FHandle), CDM_GETFILEPATH, SizeOf(Path), Integer(@Path));
    Result := StrPas(Path);
  end
  else Result := FFileName;
end;

function TIvOpenDialog.GetFilterIndex: Integer;
begin
  if FHandle <> 0 then
    Result := FCurrentFilterIndex
  else
    Result := FFilterIndex;
end;

procedure TIvOpenDialog.SetHistoryList(Value: TStrings);
begin
  FHistoryList.Assign(Value);
end;

procedure TIvOpenDialog.SetInitialDir(const Value: string);
var
  L: Integer;
begin
  L := Length(Value);
{$IFDEF IVWIDE}
  if (L > 1) and IsPathDelimiter(Value, L) and not IsDelimiter(':', Value, L - 1) then
{$ELSE}
  if (L > 1) and (Value[L] = '\') and (Value[L - 1] <> ':') then
{$ENDIF}
    Dec(L);
  FInitialDir := Copy(Value, 1, L);
end;

function TIvOpenDialog.Execute: Boolean;
begin
  InitDictionary;
  Result := DoExecute(@IvGetOpenFileName);
end;


{ TIvSaveDialog }

function TIvSaveDialog.Execute: Boolean;
begin
  InitDictionary;
  Result := DoExecute(@IvGetSaveFileName);
end;


{ TIvOpenPictureDialog }

{$IFDEF IVWIDE}
constructor TIvOpenPictureDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Filter := GraphicFilter(TGraphic);
  FPicture := TPicture.Create;
  FPicturePanel := TPanel.Create(Self);
  with FPicturePanel do
  begin
    Name := 'PicturePanel';
    Caption := '';
    SetBounds(204, 5, 169, 200);
    BevelOuter := bvNone;
    BorderWidth := 6;
    TabOrder := 1;
    FPictureLabel := TLabel.Create(Self);
    with FPictureLabel do
    begin
      Name := 'PictureLabel';
      Caption := '';
      SetBounds(6, 6, 157, 23);
      Align := alTop;
      AutoSize := False;
      Parent := FPicturePanel;
    end;
    FPreviewButton := TSpeedButton.Create(Self);
    with FPreviewButton do
    begin
      Name := 'PreviewButton';
      SetBounds(77, 1, 23, 22);
      Enabled := False;
      Glyph.LoadFromResourceName(HInstance, 'IVPREVIEWGLYPH');
      Hint := 'Preview';
      ParentShowHint := False;
      ShowHint := True;
      OnClick := PreviewClick;
      Parent := FPicturePanel;
    end;
    FPaintPanel := TPanel.Create(Self);
    with FPaintPanel do
    begin
      Name := 'PaintPanel';
      Caption := '';
      SetBounds(6, 29, 157, 145);
      Align := alClient;
      BevelInner := bvRaised;
      BevelOuter := bvLowered;
      TabOrder := 0;
      FPaintBox := TPaintBox.Create(Self);
      Parent := FPicturePanel;
      with FPaintBox do
      begin
        Name := 'PaintBox';
        SetBounds(0, 0, 153, 141);
        Align := alClient;
        OnDblClick := PreviewClick;
        OnPaint := PaintBoxPaint;
        Parent := FPaintPanel;
      end;
    end;
  end;
end;

destructor TIvOpenPictureDialog.Destroy;
begin
  FPaintBox.Free;
  FPaintPanel.Free;
  FPreviewButton.Free;
  FPictureLabel.Free;
  FPicturePanel.Free;
  FPicture.Free;
  inherited Destroy;
end;

procedure TIvOpenPictureDialog.DoSelectionChange;
var
  FullName: string;
  ValidPicture: Boolean;

  function ValidFile(const FileName: String): Boolean;
  begin
    Result := GetFileAttributes(PChar(FileName)) <> $FFFFFFFF;
  end;

begin
  FullName := FileName;
  ValidPicture := FileExists(FullName) and ValidFile(FullName);
  if ValidPicture then
  try
    FPicture.LoadFromFile(FullName);
    FPictureLabel.Caption := Format(' (%dx%d)', [FPicture.Width, FPicture.Height]);
    FPreviewButton.Enabled := True;
  except
    ValidPicture := False;
  end;
  if not ValidPicture then
  begin
    FPictureLabel.Caption := 'Picture:';
    if FDictionary <> nil then
      FPictureLabel.Caption := FDictionary.Translate(FPictureLabel.Caption);
    FPreviewButton.Enabled := False;
    FPicture.Assign(nil);
  end;
  FPaintBox.Invalidate;
  inherited DoSelectionChange;
end;

procedure TIvOpenPictureDialog.DoClose;
begin
  inherited DoClose;
  { Hide any hint windows left behind }
  Application.HideHint;
end;

procedure TIvOpenPictureDialog.DoShow;
var
  PreviewRect, StaticRect: TRect;
begin
  { Set preview area to entire dialog }
  GetClientRect(Handle, PreviewRect);
  StaticRect := GetStaticRect;
  { Move preview area to right of static area }
  PreviewRect.Left := StaticRect.Left + (StaticRect.Right - StaticRect.Left);
  Inc(PreviewRect.Top, 4);
  FPicturePanel.BoundsRect := PreviewRect;
  FPreviewButton.Left := FPaintPanel.BoundsRect.Right - FPreviewButton.Width - 2;
  FPicture.Assign(nil);
  FPicturePanel.ParentWindow := Handle;
  inherited DoShow;
end;

function TIvOpenPictureDialog.Execute;
begin
  InitDictionary;
  
  if NewStyleControls and not (ofOldStyleDialog in Options) then
    Template := 'IVDLGTEMPLATE'
  else
    Template := nil;
  Result := inherited Execute;
end;

procedure TIvOpenPictureDialog.PaintBoxPaint(Sender: TObject);
var
  DrawRect: TRect;
  SNone: string;
begin
  with TPaintBox(Sender) do
  begin
    Canvas.Brush.Color := Color;
    DrawRect := ClientRect;
    if FPicture.Width > 0 then
    begin
      with DrawRect do
        if (FPicture.Width > Right - Left) or (FPicture.Height > Bottom - Top) then
        begin
          if FPicture.Width > FPicture.Height then
            Bottom := Top + MulDiv(FPicture.Height, Right - Left, FPicture.Width)
          else
            Right := Left + MulDiv(FPicture.Width, Bottom - Top, FPicture.Height);
          Canvas.StretchDraw(DrawRect, FPicture.Graphic);
        end
        else
          with DrawRect do
            Canvas.Draw(Left + (Right - Left - FPicture.Width) div 2, Top + (Bottom - Top -
              FPicture.Height) div 2, FPicture.Graphic);
    end
    else
      with DrawRect, Canvas do
      begin
        SNone := '(None)';
        if FDictionary <> nil then
          SNone := FDictionary.Translate(SNone);

        TextOut(Left + (Right - Left - TextWidth(SNone)) div 2, Top + (Bottom -
          Top - TextHeight(SNone)) div 2, SNone);
      end;
  end;
end;

procedure TIvOpenPictureDialog.PreviewClick(Sender: TObject);
var
  PreviewForm: TForm;
  Panel: TPanel;
begin
  PreviewForm := TForm.Create(Self);
  with PreviewForm do
  try
    Name := 'PreviewForm';
    Caption := 'Preview';
    if FDictionary <> nil then
      Caption := FDictionary.Translate(Caption);
    BorderStyle := bsSizeToolWin;
    KeyPreview := True;
    Position := poScreenCenter;
    OnKeyPress := PreviewKeyPress;
    Panel := TPanel.Create(PreviewForm);
    with Panel do
    begin
      Name := 'Panel';
      Caption := '';
      Align := alClient;
      BevelOuter := bvNone;
      BorderStyle := bsSingle;
      BorderWidth := 5;
      Color := clWindow;
      Parent := PreviewForm;
      with TImage.Create(PreviewForm) do
      begin
        Name := 'Image';
        Caption := '';
        Align := alClient;
        Stretch := True;
        Picture.Assign(FPicture);
        Parent := Panel;
      end;
    end;
    if FPicture.Width > 0 then
    begin
      ClientWidth := FPicture.Width + (ClientWidth - Panel.ClientWidth)+ 10;
      ClientHeight := FPicture.Height + (ClientHeight - Panel.ClientHeight) + 10;
    end;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TIvOpenPictureDialog.PreviewKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    TForm(Sender).Close;
end;


{ TIvSavePictureDialog }

function TIvSavePictureDialog.Execute: Boolean;
begin
  InitDictionary;

  if NewStyleControls and not (ofOldStyleDialog in Options) then
    Template := 'IVDLGTEMPLATE'
  else
    Template := nil;
  Result := DoExecute(@IvGetSaveFileName);
end;
{$ENDIF}


{ TIvColorDialog }

function IvColorDialogHook(wnd: HWnd; msg: UINT; wParam: WPARAM; lParam: LPARAM):
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
      begin
        if HookCtl3D then
        begin
          Subclass3DDlg(Wnd, CTL3D_ALL);
          SetAutoSubClass(True);
        end;
        CreationControl.FHandle := Wnd;
        CreationControl.FDefWndProc := Pointer(SetWindowLong(Wnd, GWL_WNDPROC,
          Longint(CreationControl.FObjectInstance)));
        CallWindowProc(CreationControl.FObjectInstance, Wnd, Msg, WParam, LParam);
        CreationControl := nil;
      end;

    WM_DESTROY:
      if HookCtl3D then
        SetAutoSubClass(False);
  end;
end;

constructor TIvColorDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCustomColors := TStringList.Create;
end;

destructor TIvColorDialog.Destroy;
begin
  FCustomColors.Free;
  inherited Destroy;
end;

function TIvColorDialog.Execute: Boolean;
const
  DialogOptions: array[TColorDialogOption] of LongInt = (
    CC_FULLOPEN, CC_PREVENTFULLOPEN, CC_SHOWHELP, CC_SOLIDCOLOR,
    CC_ANYCOLOR);
var
  ChooseColorRec: TChooseColor;
  Option: TColorDialogOption;
  CustomColorsArray: TCustomColors;
  ColorPrefix, ColorTags: string;

  procedure GetCustomColorsArray;
  var
    I: Integer;
  begin
    for I := 0 to MaxCustomColors - 1 do
      FCustomColors.Values[ColorPrefix + ColorTags[I + 1]] :=
        Format('%.6x', [CustomColorsArray[I]]);
  end;

  procedure SetCustomColorsArray;
  var
    Value: string;
    I: Integer;
  begin
    for I := 0 to MaxCustomColors - 1 do
    begin
      Value := FCustomColors.Values[ColorPrefix + ColorTags[I + 1]];
      if Value <> '' then
        CustomColorsArray[I] := StrToInt('$' + Value) else
        CustomColorsArray[I] := -1;
    end;
  end;

begin
  InitDictionary;

  ColorPrefix := 'Color';
  ColorTags := 'ABCDEFGHIJKLMNOP';
  with ChooseColorRec do
  begin
    SetCustomColorsArray;
    lStructSize := SizeOf(ChooseColorRec);

{$IFDEF IVWIDE}
    hInstance := SysInit.HInstance;
{$ELSE}
    hInstance := HInstance;
{$ENDIF}

    hwndOwner := Application.Handle;

    rgbResult := ColorToRGB(FColor);
    lpCustColors := Pointer(@CustomColorsArray);
    Flags := CC_RGBINIT or CC_ENABLEHOOK;
    for Option := Low(Option) to High(Option) do
      if Option in FOptions then
        Flags := Flags or Cardinal(DialogOptions[Option]);

    if Template <> nil then
    begin
      Flags := Flags or CC_ENABLETEMPLATE;
      lpTemplateName := Template;
    end;

    HookCtl3D := FCtl3D;
    lpfnHook := IvColorDialogHook;
    lCustData := Longint(FDictionary);
    Result := TaskModalDialog(@IvChooseColor, ChooseColorRec);
    if Result then
    begin
      FColor := rgbResult;
      GetCustomColorsArray;
    end;
  end;
end;

procedure TIvColorDialog.SetCustomColors(Value: TStrings);
begin
  FCustomColors.Assign(Value);
end;


{ TIvFontDialog }

function IvFontDialogHook(wnd: HWnd; msg: UINT; wParam: WPARAM; lParam: LPARAM):
{$IFDEF IVBIDI}
  UINT;
{$ELSE}
  Integer;
{$ENDIF}
  stdcall;
begin
  if (Msg = WM_COMMAND) and
    (LongRec(WParam).Lo = IDAPPLYBTN) and
    (LongRec(WParam).Hi = BN_CLICKED) then
  begin
    FontDialog.DoApply(Wnd);
    Result := 1;
  end else
    Result := DialogHook(Wnd, Msg, wParam, lParam);
end;

constructor TIvFontDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFont := TFont.Create;
  FOptions := [fdEffects];
end;

destructor TIvFontDialog.Destroy;
begin
  FFont.Free;
  inherited Destroy;
end;

{$IFDEF IVWIDE}
procedure TIvFontDialog.WndProc(var msg: TMessage);
begin
  { Make sure we only take values from the color combobox and script combobox
    if they have been changed. }
  if (msg.Msg = WM_COMMAND) and (msg.WParamHi = CBN_SELENDOK) then
  begin
    if (msg.WParamLo = cmb4) then
      FFontColorModified := True
    else if (msg.WParamLo = cmb5) then
      FFontCharsetModified := True;
  end;

  inherited WndProc(msg);
end;
{$ENDIF}

procedure TIvFontDialog.Apply(Wnd: HWND);
begin
  if Assigned(FOnApply) then
    FOnApply(Self, Wnd);
end;

procedure TIvFontDialog.DoApply(Wnd: HWND);
const
  IDCOLORCMB = $473;
var
  I: Integer;
  LogFont: TLogFont;
begin
  SendMessage(Wnd, WM_CHOOSEFONT_GETLOGFONT, 0, LongInt(@LogFont));
  UpdateFromLogFont(LogFont);
  I := SendDlgItemMessage(Wnd, IDCOLORCMB, CB_GETCURSEL, 0, 0);
  if I <> CB_ERR then
    Font.Color := SendDlgItemMessage(Wnd, IDCOLORCMB, CB_GETITEMDATA, I, 0);
  try
    Apply(Wnd);
  except
    Application.HandleException(Self);
  end;
end;

function TIvFontDialog.Execute: Boolean;
const
  FontOptions: array[TFontDialogOption] of Longint = (
    CF_ANSIONLY, CF_TTONLY, CF_EFFECTS, CF_FIXEDPITCHONLY, CF_FORCEFONTEXIST,
    CF_NOFACESEL, CF_NOOEMFONTS, CF_NOSIMULATIONS, CF_NOSIZESEL,
    CF_NOSTYLESEL, CF_NOVECTORFONTS, CF_SHOWHELP, CF_WYSIWYG, CF_LIMITSIZE,
    CF_SCALABLEONLY, CF_APPLY);
  Devices: array[TFontDialogDevice] of Longint = (
    CF_SCREENFONTS, CF_PRINTERFONTS, CF_BOTH);
var
  ChooseFontRec: TChooseFont;
  LogFont: TLogFont;
  Option: TFontDialogOption;
  SaveFontDialog: TIvFontDialog;
  OriginalFaceName: String;
begin
  InitDictionary;

  with ChooseFontRec do
  begin
    lStructSize := SizeOf(ChooseFontRec);

{$IFDEF IVWIDE}
    hInstance := SysInit.HInstance;
{$ELSE}
    hInstance := HInstance;
{$ENDIF}

    hwndOwner := Application.Handle;

    hDC := 0;
    if FDevice <> fdScreen then
      hDC := Printer.Handle;
    lpLogFont := @LogFont;
    GetObject(Font.Handle, SizeOf(LogFont), @LogFont);
    OriginalFaceName := LogFont.lfFaceName;
    Flags := Devices[FDevice] or (CF_INITTOLOGFONTSTRUCT or CF_ENABLEHOOK);
    for Option := Low(Option) to High(Option) do
      if Option in FOptions then
        Flags := Flags or Cardinal(FontOptions[Option]);
    if Assigned(FOnApply) then
      Flags := Flags or CF_APPLY;
    if Template <> nil then
    begin
      Flags := Flags or CF_ENABLETEMPLATE;
      lpTemplateName := Template;
    end;
    rgbColors := Font.Color;
    lCustData := 0;
    HookCtl3D := Ctl3D;
    lpfnHook := IvFontDialogHook;
    nSizeMin := FMinFontSize;
    nSizeMax := FMaxFontSize;
    if nSizeMin > nSizeMax then
      Flags := Flags and (not CF_LIMITSIZE);
    SaveFontDialog := FontDialog;
    FontDialog := Self;
    FFontColorModified := False;
    FFontCharsetModified := False;
    Result := TaskModalDialog(@IvChooseFont, ChooseFontRec);
    FontDialog := SaveFontDialog;
    if Result then
    begin
{$IFDEF IVWIDE}
      if AnsiCompareText(OriginalFaceName, LogFont.lfFaceName) <> 0 then
        FFontCharsetModified := True;
{$ENDIF}
      UpdateFromLogFont(LogFont);
{$IFDEF IVWIDE}
      if FFontColorModified then
{$ENDIF}
        Font.Color := rgbColors;
    end;
  end;
end;

procedure TIvFontDialog.SetFont(Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TIvFontDialog.UpdateFromLogFont(const LogFont: TLogFont);
var
  Style: TFontStyles;
begin
  with LogFont do
  begin
    Font.Name := LogFont.lfFaceName;
    Font.Height := LogFont.lfHeight;
{$IFDEF IVWIDE}
    if FFontCharsetModified then
      Font.Charset := TFontCharset(LogFont.lfCharSet);
{$ENDIF}
    Style := [];
    with LogFont do
    begin
      if lfWeight > FW_REGULAR then
        Include(Style, fsBold);

      if lfItalic <> 0 then
        Include(Style, fsItalic);

      if lfUnderline <> 0 then
        Include(Style, fsUnderline);

      if lfStrikeOut <> 0 then
        Include(Style, fsStrikeOut);
    end;
    Font.Style := Style;
  end;
end;


{ Printer dialog routines }

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


{ TIvPrinterSetupDialog }

function IvPrintHook(wnd: HWnd; msg: UINT; wParam: WPARAM; lParam: LPARAM):
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
      begin
        if HookCtl3D then
        begin
          Subclass3DDlg(Wnd, CTL3D_ALL);
          SetAutoSubClass(True);
        end;
        CreationControl.FHandle := Wnd;
        CreationControl.FDefWndProc := Pointer(SetWindowLong(
            Wnd,
            GWL_WNDPROC,
            Longint(CreationControl.FObjectInstance)));
        CallWindowProc(CreationControl.FObjectInstance, Wnd, Msg, WParam, LParam);
        CreationControl := nil;
      end;

    WM_DESTROY:
      if HookCtl3D then
        SetAutoSubClass(False);
  end;
end;

function TIvPrinterSetupDialog.Execute: Boolean;
var
  PrintDlgRec: TPrintDlg;
  DevHandle: THandle;
begin
  InitDictionary;
  
  FillChar(PrintDlgRec, SizeOf(PrintDlgRec), False);
  with PrintDlgRec do
  begin
    lStructSize := SizeOf(PrintDlgRec);

{$IFDEF IVWIDE}
    hInstance := SysInit.HInstance;
{$ELSE}
    hInstance := HInstance;
{$ENDIF}

    hwndOwner := Application.Handle;

    GetPrinter(DevHandle, hDevNames);
    hDevMode := CopyData(DevHandle);
    Flags := PD_ENABLESETUPHOOK or PD_PRINTSETUP;
    HookCtl3D := Ctl3D;
    lpfnSetupHook := IvPrintHook;

    Result := TaskModalDialog(@IvPrintDlg, PrintDlgRec);
    if Result then
      SetPrinter(hDevMode, hDevNames)
    else
    begin
      if hDevMode <> 0 then
        GlobalFree(hDevMode);
      if hDevNames <> 0 then
        GlobalFree(hDevNames);
    end;
  end;
end;


{ TIvPrintDialog }

procedure TIvPrintDialog.SetNumCopies(Value: Integer);
begin
  FCopies := Value;
  Printer.Copies := Value;
end;

function TIvPrintDialog.Execute: Boolean;
const
  PrintRanges: array[TPrintRange] of Integer =
    (PD_ALLPAGES, PD_SELECTION, PD_PAGENUMS);
var
  PrintDlgRec: TPrintDlg;
  DevHandle: THandle;
begin
  InitDictionary;
  
  FillChar(PrintDlgRec, SizeOf(PrintDlgRec), False);
  with PrintDlgRec do
  begin
    lStructSize := SizeOf(PrintDlgRec);

{$IFDEF IVWIDE}
    hInstance := SysInit.HInstance;
{$ELSE}
    hInstance := HInstance;
{$ENDIF}

    hwndOwner := Application.Handle;

    GetPrinter(DevHandle, hDevNames);
    hDevMode := CopyData(DevHandle);
    Flags := PrintRanges[FPrintRange] or (PD_ENABLEPRINTHOOK or PD_ENABLESETUPHOOK);

    if FCollate then
      Inc(Flags, PD_COLLATE);

    if not (poPrintToFile in FOptions) then
      Inc(Flags, PD_HIDEPRINTTOFILE);

    if not (poPageNums in FOptions) then
      Inc(Flags, PD_NOPAGENUMS);

    if not (poSelection in FOptions) then
      Inc(Flags, PD_NOSELECTION);

    if poDisablePrintToFile in FOptions then
      Inc(Flags, PD_DISABLEPRINTTOFILE);

    if FPrintToFile then
      Inc(Flags, PD_PRINTTOFILE);

    if poHelp in FOptions then
      Inc(Flags, PD_SHOWHELP);

    if not (poWarning in FOptions) then
      Inc(Flags, PD_NOWARNING);

    nFromPage := FFromPage;
    nToPage := FToPage;
    nMinPage := FMinPage;
    nMaxPage := FMaxPage;
    HookCtl3D := Ctl3D;
    lpfnPrintHook := IvPrintHook;
    lpfnSetupHook := IvPrintHook;

    Result := TaskModalDialog(@IvPrintDlg, PrintDlgRec);
    if Result then
    begin
      SetPrinter(hDevMode, hDevNames);
      FCollate := Flags and PD_COLLATE <> 0;
      FPrintToFile := Flags and PD_PRINTTOFILE <> 0;
      if Flags and PD_SELECTION <> 0 then
        FPrintRange := prSelection
      else if Flags and PD_PAGENUMS <> 0 then
        FPrintRange := prPageNums
      else
        FPrintRange := prAllPages;
      FFromPage := nFromPage;
      FToPage := nToPage;
      if nCopies = 1 then
        Copies := Printer.Copies
      else
        Copies := nCopies;
    end
    else
    begin
      if hDevMode <> 0 then
        GlobalFree(hDevMode);
      if hDevNames <> 0 then
        GlobalFree(hDevNames);
    end;
  end;
end;

{ TRedirectorWindow }
{ A redirector window is used to put the find/replace dialog into the
  ownership chain of a form, but intercept messages that CommDlg.dll sends
  exclusively to the find/replace dialog's owner.  TRedirectorWindow
  creates its hidden window handle as owned by the target form, and the
  find/replace dialog handle is created as owned by the redirector.  The
  redirector wndproc forwards all messages to the find/replace component.
}

type
  TRedirectorWindow = class(TWinControl)
  private
    FFindReplaceDialog: TIvFindDialog;
    FFormHandle: THandle;
    procedure CMRelease(var Message); message CM_Release;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure WndProc(var Message: TMessage); override;
  end;

procedure TRedirectorWindow.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := WS_VISIBLE or WS_POPUP;
    WndParent := FFormHandle;
  end;
end;

procedure TRedirectorWindow.WndProc(var Message: TMessage);
begin
  inherited WndProc(Message);
  if (Message.Result = 0) and Assigned(FFindReplaceDialog) then
    Message.Result := Integer(FFindReplaceDialog.MessageHook(Message));
end;

procedure TRedirectorWindow.CMRelease(var Message);
begin
  Free;
end;


{ Find and Replace dialog routines }

function IvFindReplaceWndProc(Wnd: HWND; Msg, WParam, LParam: Longint): Longint; stdcall;

  function CallDefWndProc: Longint;
  begin
    Result := CallWindowProc(Pointer(GetProp(Wnd,
      MakeIntAtom(WndProcPtrAtom))), Wnd, Msg, WParam, LParam);
  end;

begin
  case Msg of
    WM_DESTROY:
      if Application.DialogHandle = Wnd then
        Application.DialogHandle := 0;

    WM_NCACTIVATE:
      if WParam <> 0 then
      begin
        if Application.DialogHandle = 0 then
          Application.DialogHandle := Wnd;
      end
      else
      begin
        if Application.DialogHandle = Wnd then
          Application.DialogHandle := 0;
      end;

    WM_NCDESTROY:
      begin
        Result := CallDefWndProc;
        RemoveProp(Wnd, MakeIntAtom(WndProcPtrAtom));
        Exit;
      end;
   end;
   Result := CallDefWndProc;
end;

function IvFindDialogHook(Wnd: HWnd; Msg: UINT; WParam: WPARAM; LParam: LPARAM): UINT; stdcall;
begin
  Result := DialogHook(Wnd, Msg, wParam, lParam);
  case Msg of
    WM_DESTROY:
      if HookCtl3D then
        SetAutoSubClass(False);
  end;

  if Msg = WM_INITDIALOG then
  begin
    with TIvFindDialog(PFindReplace(LParam)^.lCustData) do
      if (Left <> -1) or (Top <> -1) then
        SetWindowPos(Wnd, 0, Left, Top, 0, 0, SWP_NOACTIVATE or
          SWP_NOSIZE or SWP_NOZORDER);
    SetProp(Wnd, MakeIntAtom(WndProcPtrAtom), GetWindowLong(Wnd, GWL_WNDPROC));
    SetWindowLong(Wnd, GWL_WNDPROC, Longint(@IvFindReplaceWndProc));
    Result := 1;
  end;
end;

function IvReplaceDialogHook(Wnd: HWnd; Msg: UINT; WParam: WPARAM; LParam: LPARAM): UINT; stdcall;
begin
  Result := DialogHook(Wnd, Msg, wParam, lParam);
  case Msg of
    WM_DESTROY:
      if HookCtl3D then
        SetAutoSubClass(False);
  end;

  if Msg = WM_INITDIALOG then
  begin
    with TIvFindDialog(PFindReplace(LParam)^.lCustData) do
      if (Left <> -1) or (Top <> -1) then
        SetWindowPos(Wnd, 0, Left, Top, 0, 0, SWP_NOACTIVATE or
          SWP_NOSIZE or SWP_NOZORDER);
    SetProp(Wnd, MakeIntAtom(WndProcPtrAtom), GetWindowLong(Wnd, GWL_WNDPROC));
    SetWindowLong(Wnd, GWL_WNDPROC, Longint(@IvFindReplaceWndProc));
    Result := 1;
  end;
end;

const
  FindOptions: array[TFindOption] of Longint = (
    FR_DOWN, FR_FINDNEXT, FR_HIDEMATCHCASE, FR_HIDEWHOLEWORD,
    FR_HIDEUPDOWN, FR_MATCHCASE, FR_NOMATCHCASE, FR_NOUPDOWN, FR_NOWHOLEWORD,
    FR_REPLACE, FR_REPLACEALL, FR_WHOLEWORD, FR_SHOWHELP);

{ TIvFindDialog }

constructor TIvFindDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FOptions := [frDown];
  FPosition.X := -1;
  FPosition.Y := -1;
  with FFindReplace do
  begin
    lStructSize := SizeOf(TFindReplace);
{$IFDEF IVWIDE}
    hInstance := SysInit.HInstance;
{$ELSE}
    hInstance := HInstance;
{$ENDIF}
    hWndOwner := Application.Handle;
    lpstrFindWhat := FFindText;
    wFindWhatLen := SizeOf(FFindText);
    lpstrReplaceWith := FReplaceText;
    wReplaceWithLen := SizeOf(FReplaceText);
    lCustData := Longint(Self);
    lpfnHook := IvFindDialogHook;
  end;
  FFindReplaceFunc := TIvFindFunc(@IvFindText);
end;

destructor TIvFindDialog.Destroy;
begin
  if FHandle <> 0 then
    SendMessage(FHandle, WM_CLOSE, 0, 0);
  FRedirector.Free;
  inherited Destroy;
end;

procedure TIvFindDialog.CloseDialog;
begin
  if FHandle <> 0 then
    PostMessage(FHandle, WM_CLOSE, 0, 0);
end;

function GetTopWindow(Wnd: THandle; var ReturnVar: THandle):Bool; stdcall;
var
  Test: TWinControl;
begin
  Test := FindControl(Wnd);
  Result := True;
  if Assigned(Test) and (Test is TForm) then
  begin
    ReturnVar := Wnd;
    Result := False;
   end;
end;

function TIvFindDialog.Execute: Boolean;
var
  Option: TFindOption;
begin
  InitDictionary;
  
  if FHandle <> 0 then
  begin
    BringWindowToTop(FHandle);
    Result := True;
  end
  else
  begin
    HookCtl3D := Ctl3D;
    FFindReplace.Flags := FR_ENABLEHOOK;
    if Self is TIvReplaceDialog then
      FFindReplace.lpfnHook := IvReplaceDialogHook
    else
      FFindReplace.lpfnHook := IvFindDialogHook;
    FRedirector := TRedirectorWindow.Create(nil);
    with TRedirectorWindow(FRedirector) do
    begin
      FFindReplaceDialog := Self;
      EnumThreadWindows(GetCurrentThreadID, @GetTopWindow, LPARAM(@FFormHandle));
    end;

    FFindReplace.hwndOwner := FRedirector.Handle;

    for Option := Low(Option) to High(Option) do
      if Option in FOptions then
        FFindReplace.Flags := FFindReplace.Flags or Cardinal(FindOptions[Option]);
    if Template <> nil then
    begin
      FFindReplace.Flags := FFindReplace.Flags or FR_ENABLETEMPLATE;
      FFindReplace.lpTemplateName := Template;
    end;
    CreationControl := Self;
    FFindHandle := FFindReplaceFunc(FFindReplace, FDictionary, ivdpCenter in FPositions);
    Result := FHandle <> 0;
  end;
end;

procedure TIvFindDialog.Find;
begin
  if Assigned(FOnFind) then
    FOnFind(Self);
end;

function TIvFindDialog.GetFindText: string;
begin
  Result := FFindText;
end;

function TIvFindDialog.GetLeft: Integer;
begin
  Result := Position.X;
end;

function TIvFindDialog.GetPosition: TPoint;
var
  Rect: TRect;
begin
  Result := FPosition;
  if FHandle <> 0 then
  begin
    GetWindowRect(FHandle, Rect);
    Result := Rect.TopLeft;
  end;
end;

function TIvFindDialog.GetReplaceText: string;
begin
  Result := FReplaceText;
end;

function TIvFindDialog.GetTop: Integer;
begin
  Result := Position.Y;
end;

function TIvFindDialog.MessageHook(var Msg: TMessage): Boolean;
var
  Option: TFindOption;
  Rect: TRect;
begin
  Result := inherited MessageHook(Msg);
  if not Result then
    if (Msg.Msg = FindMsg) and (Pointer(Msg.LParam) = @FFindReplace) then
    begin
      FOptions := [];
      for Option := Low(Option) to High(Option) do
        if (FFindReplace.Flags and FindOptions[Option]) <> 0 then
          Include(FOptions, Option);
      if (FFindReplace.Flags and FR_FINDNEXT) <> 0 then
        Find
      else if (FFindReplace.Flags and (FR_REPLACE or FR_REPLACEALL)) <> 0 then
        Replace
      else if (FFindReplace.Flags and FR_DIALOGTERM) <> 0 then
      begin
        GetWindowRect(FHandle, Rect);
        FPosition := Rect.TopLeft;
        FHandle := 0;
        PostMessage(FRedirector.Handle,CM_RELEASE,0,0); // free redirector later
        FRedirector := nil;
      end;
      Result := True;
    end;
end;

procedure TIvFindDialog.Replace;
begin
  if Assigned(FOnReplace) then
    FOnReplace(Self);
end;

procedure TIvFindDialog.SetFindText(const Value: string);
begin
  StrLCopy(FFindText, PChar(Value), SizeOf(FFindText) - 1);
end;

procedure TIvFindDialog.SetLeft(Value: Integer);
begin
  SetPosition(Point(Value, Top));
end;

procedure TIvFindDialog.SetPosition(const Value: TPoint);
begin
  if (FPosition.X <> Value.X) or (FPosition.Y <> Value.Y) then
  begin
    FPosition := Value;
    if FHandle <> 0 then
      SetWindowPos(
        FHandle,
        0,
        Value.X,
        Value.Y,
        0,
        0,
        SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER);
  end;
end;

procedure TIvFindDialog.SetReplaceText(const Value: string);
begin
  StrLCopy(FReplaceText, PChar(Value), SizeOf(FReplaceText) - 1);
end;

procedure TIvFindDialog.SetTop(Value: Integer);
begin
  SetPosition(Point(Left, Value));
end;

{ TIvReplaceDialog }

constructor TIvReplaceDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFindReplaceFunc := TIvFindFunc(@IvReplaceText);
  with FFindReplace do
    lpfnHook := IvReplaceDialogHook;
end;

{ Initialization and cleanup }

procedure InitGlobals;
var
  AtomText: array[0..31] of Char;
begin
  HelpMsg := RegisterWindowMessage(HelpMsgString);
  FindMsg := RegisterWindowMessage(FindMsgString);
  WndProcPtrAtom := GlobalAddAtom(StrFmt(
    AtomText,
    'IvWndProcPtr%.8X%.8X',
    [HInstance, GetCurrentThreadID]));
end;

initialization
  InitGlobals;
finalization
  if WndProcPtrAtom <> 0 then
    GlobalDeleteAtom(WndProcPtrAtom);
{$ELSE}

{ 16 bit }

uses
  Printers, Consts, Dlgs,
  IvDialog;

type
  TTranslateFunction = function(wnd: HWnd; reserved: Longint): Bool;

  TIvDropListBox = class(TIvDlgControl)
  private
    procedure Init; override;
    procedure WMLButtonUp(var msg: TWMLButtonUp); message WM_LBUTTONUP;
  end;

  TIvDlgEditControl = class(TIvDlgControl)
  private
    procedure Init; override;
    procedure DefaultHandler(var msg); override;
    procedure WMKillFocus(var msg: TWMKillFocus); message WM_KILLFOCUS;
  end;

  TIvCommonDlg = class(TIvDlgControl)
  private
    procedure Init; override;
    procedure WMLButtonDown(var msg: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMNCLButtonDown(var msg: TWMNCLButtonDown); message WM_NCLBUTTONDOWN;
  end;

const
  WndProcSegAtom: TAtom = 0;
  WndProcOfsAtom: TAtom = 0;
  EditControlId = 1152;
  HookCtl3D: Boolean = False;
  HookColorDlg: Boolean = False;
  ComboBox: TIvComboButton = nil;
  DialogTitle: PChar = nil;

var
  HelpMsg: Word;
  FindMsg: Word;
  counter: Integer;
  translateFunction: TTranslateFunction;
  translateDictionary: TIvDictionary;

procedure TranslateWindow(wnd: HWnd; const str: String; resize: Boolean);
var
  dc: HDC;
  width, style: Integer;
  rect, calcRect: TRect;
  buffer: array[0..255] of Char;
begin
  { Changes the text of the window. If resizing was allowed resized the window. }

  SetWindowText(wnd, StrPCopy(buffer, str));
  if resize then
  begin
    { Calculates the width of the text. If the current width of the windows is
      less then resizez the window. }

    dc := GetWindowDC(wnd);
    SelectObject(dc, GetStockObject(SYSTEM_FONT));
    width := DrawText(dc, StrPCopy(buffer, str), -1, calcRect, DT_LEFT or DT_CALCRECT or DT_SINGLELINE);
    ReleaseDC(wnd, dc);
    if width <= 0 then
      Exit;

    width := calcRect.right - calcRect.left;
    GetClassName(wnd, buffer, SizeOf(buffer));
    StrLower(buffer);
    if StrComp(buffer, 'button') = 0 then
    begin
      { Check box and radion buttons need some space for the input area. }

      style := GetWindowLong(wnd, GWL_STYLE);
      if ((style and BS_CHECKBOX) <> 0) or ((style and BS_RADIOBUTTON) <> 0) then
        width := width + 20
      else
        Exit;
    end;

    { If the current width is less the the needed width resizes the windows }

    GetWindowRect(wnd, rect);
    if (rect.right - rect.left) < width then
      SetWindowPos(wnd, 0, 0, 0, width, rect.bottom - rect.top, SWP_NOMOVE or SWP_NOZORDER);
  end;
end;

function IvTranslateOpenDialog(wnd: HWnd; reserved: Longint): Bool; export;
begin
  Result := True;
  if (wnd = 0) or (translateDictionary = nil) then
    Exit;

  { Translates the window text }

  case GetWindowWord(wnd, GWW_ID) of
    0: TranslateWindow(wnd, translateDictionary.Translate('Open'), False);
    1: TranslateWindow(wnd, translateDictionary.Translate('OK'), True);
    2: TranslateWindow(wnd, translateDictionary.Translate('Cancel'), True);
    1037: TranslateWindow(wnd, translateDictionary.Translate('Net&work...'), True);
    1038: TranslateWindow(wnd, translateDictionary.Translate('&Help'), True);
    1040: TranslateWindow(wnd, translateDictionary.Translate('&Read only'), True);
    1089: TranslateWindow(wnd, translateDictionary.Translate('List files of &type:'), True);
    1090: TranslateWindow(wnd, translateDictionary.Translate('File &name:'), True);
    1091: TranslateWindow(wnd, translateDictionary.Translate('Dri&ves:'), True);
    65535: TranslateWindow(wnd, translateDictionary.Translate('&Folders:'), True);
  end;

  { Translates the child controls }

  EnumChildWindows(wnd, @IvTranslateOpenDialog, 0);
end;

function IvTranslateSaveDialog(wnd: HWnd; reserved: Longint): Bool; export;
begin
  Result := True;
  if translateDictionary = nil then
    Exit;

  { Translates the window text }

  case GetWindowWord(wnd, GWW_ID) of
    0: TranslateWindow(wnd, translateDictionary.Translate('Save As'), False);
    1: TranslateWindow(wnd, translateDictionary.Translate('OK'), True);
    2: TranslateWindow(wnd, translateDictionary.Translate('Cancel'), True);
    1037: TranslateWindow(wnd, translateDictionary.Translate('Net&work...'), True);
    1038: TranslateWindow(wnd, translateDictionary.Translate('&Help'), True);
    1040: TranslateWindow(wnd, translateDictionary.Translate('&Read only'), True);
    1089: TranslateWindow(wnd, translateDictionary.Translate('Save file as &type:'), True);
    1090: TranslateWindow(wnd, translateDictionary.Translate('File &name:'), True);
    1091: TranslateWindow(wnd, translateDictionary.Translate('Dri&ves:'), True);
    65535: TranslateWindow(wnd, translateDictionary.Translate('&Folders:'), True);
  end;

  { Translates the child controls }

  EnumChildWindows(wnd, @IvTranslateSaveDialog, 0);
end;

function IvTranslateColorDialog(wnd: HWnd; reserved: Longint): Bool; export;
begin
  Result := True;
  if translateDictionary = nil then
    Exit;

  { Translates the window text }

  case GetWindowWord(wnd, GWW_ID) of
    0: TranslateWindow(wnd, translateDictionary.Translate('Color'), False);
    1: TranslateWindow(wnd, translateDictionary.Translate('OK'), True);
    2: TranslateWindow(wnd, translateDictionary.Translate('Cancel'), True);
    712: TranslateWindow(wnd, translateDictionary.Translate('&Add to Custom Colors'), True);
    719: TranslateWindow(wnd, translateDictionary.Translate('&Define Custom Colors >>'), True);
    723: TranslateWindow(wnd, translateDictionary.Translate('Hu&e:'), True);
    724: TranslateWindow(wnd, translateDictionary.Translate('&Sat:'), True);
    725: TranslateWindow(wnd, translateDictionary.Translate('&Lum:'), True);
    726: TranslateWindow(wnd, translateDictionary.Translate('&Red:'), True);
    727: TranslateWindow(wnd, translateDictionary.Translate('&Green:'), True);
    728: TranslateWindow(wnd, translateDictionary.Translate('Bl&ue:'), True);
    730: TranslateWindow(wnd, translateDictionary.Translate('Color'), True);
    731: TranslateWindow(wnd, translateDictionary.Translate('|S&olid'), True);
    1038: TranslateWindow(wnd, translateDictionary.Translate('&Help'), True);
    65535:
      begin
        case counter of
          0: TranslateWindow(wnd, translateDictionary.Translate('&Basic colors:'), True);
          1: TranslateWindow(wnd, translateDictionary.Translate('&Custom colors:'), True);
        end;
        Inc(counter);
      end;
  end;

  { Translates the child controls }

  EnumChildWindows(wnd, @IvTranslateColorDialog, 0);
end;

function IvTranslateFontDialog(wnd: HWnd; reserved: Longint): Bool; export;
begin
  Result := True;
  if translateDictionary = nil then
    Exit;

  { Translates the window text }

  case GetWindowWord(wnd, GWW_ID) of
    0: TranslateWindow(wnd, translateDictionary.Translate('Font'), False);
    1: TranslateWindow(wnd, translateDictionary.Translate('OK'), True);
    2: TranslateWindow(wnd, translateDictionary.Translate('Cancel'), True);
    1026: TranslateWindow(wnd, translateDictionary.Translate('&Apply'), True);
    1038: TranslateWindow(wnd, translateDictionary.Translate('&Help'), True);
    1040: TranslateWindow(wnd, translateDictionary.Translate('Stri&keout'), True);
    1041: TranslateWindow(wnd, translateDictionary.Translate('&Underline'), True);
    1072: TranslateWindow(wnd, translateDictionary.Translate('Effects'), True);
    1073: TranslateWindow(wnd, translateDictionary.Translate('Sample'), True);
    1088: TranslateWindow(wnd, translateDictionary.Translate('&Font:'), True);
    1089: TranslateWindow(wnd, translateDictionary.Translate('Font st&yle:'), True);
    1090: TranslateWindow(wnd, translateDictionary.Translate('&Size:'), True);
    1091: TranslateWindow(wnd, translateDictionary.Translate('&Color:'), True);
    1094: TranslateWindow(wnd, translateDictionary.Translate('Sc&ript:'), True);
  end;

  { Translates the child controls }

  EnumChildWindows(wnd, @IvTranslateFontDialog, 0);
end;

function IvTranslatePrintDialog(wnd: HWnd; reserved: Longint): Bool; export;
begin
  Result := True;
  if translateDictionary = nil then
    Exit;

  { Translates the window text }

  case GetWindowWord(wnd, GWW_ID) of
    0: TranslateWindow(wnd, translateDictionary.Translate('Print'), False);
    1: TranslateWindow(wnd, translateDictionary.Translate('OK'), True);
    2: TranslateWindow(wnd, translateDictionary.Translate('Cancel'), True);
    1024: TranslateWindow(wnd, translateDictionary.Translate('&Setup...'), True);
    1038: TranslateWindow(wnd, translateDictionary.Translate('&Help'), True);
    1040: TranslateWindow(wnd, translateDictionary.Translate('Print to fi&le'), True);
    1041: TranslateWindow(wnd, translateDictionary.Translate('Collate cop&ies'), True);
    1056: TranslateWindow(wnd, translateDictionary.Translate('&All'), True);
    1057: TranslateWindow(wnd, translateDictionary.Translate('S&election'), True);
    1058: TranslateWindow(wnd, translateDictionary.Translate('&Pages'), True);
    1072: TranslateWindow(wnd, translateDictionary.Translate('Print range'), True);
    1089: TranslateWindow(wnd, translateDictionary.Translate('&From:'), True);
    1090: TranslateWindow(wnd, translateDictionary.Translate('&To:'), True);
    1091: TranslateWindow(wnd, translateDictionary.Translate('Print &quality:'), True);
    1092: TranslateWindow(wnd, translateDictionary.Translate('&Copies:'), True);
    1093: TranslateWindow(wnd, translateDictionary.Translate('Printer:'), True);
  end;

  { Translates the child controls }

  EnumChildWindows(wnd, @IvTranslatePrintDialog, 0);
end;

function IvTranslatePrinterSetupDialog(wnd: HWnd; reserved: Longint): Bool; export;
begin
  Result := True;
  if translateDictionary = nil then
    Exit;

  { Translates the window text }

  case GetWindowWord(wnd, GWW_ID) of
    0: TranslateWindow(wnd, translateDictionary.Translate('Print Setup'), False);
    1: TranslateWindow(wnd, translateDictionary.Translate('OK'), True);
    2: TranslateWindow(wnd, translateDictionary.Translate('Cancel'), True);
    1024: TranslateWindow(wnd, translateDictionary.Translate('&Options...'), True);
    1037: TranslateWindow(wnd, translateDictionary.Translate('Net&work...'), True);
    1038: TranslateWindow(wnd, translateDictionary.Translate('&Help'), True);
    1056: TranslateWindow(wnd, translateDictionary.Translate('Po&rtrait'), True);
    1057: TranslateWindow(wnd, translateDictionary.Translate('&Landscape'), True);
    1058: TranslateWindow(wnd, translateDictionary.Translate('&Default printer'), True);
    1059: TranslateWindow(wnd, translateDictionary.Translate('Specific &printer:'), True);
    1072: TranslateWindow(wnd, translateDictionary.Translate('Orientation'), True);
    1073: TranslateWindow(wnd, translateDictionary.Translate('Paper'), True);
    1074: TranslateWindow(wnd, translateDictionary.Translate('Printer'), True);
    1089: TranslateWindow(wnd, translateDictionary.Translate('Si&ze:'), True);
    1090: TranslateWindow(wnd, translateDictionary.Translate('&Source:'), True);
  end;

  { Translates the child controls }

  EnumChildWindows(wnd, @IvTranslatePrinterSetupDialog, 0);
end;

function IvTranslateFindDialog(wnd: HWnd; reserved: Longint): Bool; export;
begin
  Result := True;
  if translateDictionary = nil then
    Exit;

  { Translates the window text }

  case GetWindowWord(wnd, GWW_ID) of
    0: TranslateWindow(wnd, translateDictionary.Translate('Find'), False);
    1: TranslateWindow(wnd, translateDictionary.Translate('&Find Next'), True);
    2: TranslateWindow(wnd, translateDictionary.Translate('Cancel'), True);
    1038: TranslateWindow(wnd, translateDictionary.Translate('&Help'), True);
    1040: TranslateWindow(wnd, translateDictionary.Translate('Match &whole word only'), True);
    1041: TranslateWindow(wnd, translateDictionary.Translate('Match &case'), True);
    1056: TranslateWindow(wnd, translateDictionary.Translate('&Up'), True);
    1057: TranslateWindow(wnd, translateDictionary.Translate('&Down'), True);
    1072: TranslateWindow(wnd, translateDictionary.Translate('Direction'), True);
    65535: TranslateWindow(wnd, translateDictionary.Translate('Fi&nd what:'), True);
  end;

  { Translates the child controls }

  EnumChildWindows(wnd, @IvTranslateFindDialog, 0);
end;

function IvTranslateReplaceDialog(wnd: HWnd; reserved: Longint): Bool; export;
begin
  Result := True;
  if translateDictionary = nil then
    Exit;

  { Translates the window text }

  case GetWindowWord(wnd, GWW_ID) of
    0: TranslateWindow(wnd, translateDictionary.Translate('Replace'), False);
    1: TranslateWindow(wnd, translateDictionary.Translate('&Find Next'), True);
    2: TranslateWindow(wnd, translateDictionary.Translate('Cancel'), True);
    1038: TranslateWindow(wnd, translateDictionary.Translate('&Help'), True);
    1024: TranslateWindow(wnd, translateDictionary.Translate('&Replace'), True);
    1025: TranslateWindow(wnd, translateDictionary.Translate('Replace &All'), True);
    1040: TranslateWindow(wnd, translateDictionary.Translate('Match &whole word only'), True);
    1041: TranslateWindow(wnd, translateDictionary.Translate('Match &case'), True);
    65535:
      begin
        case counter of
          0: TranslateWindow(wnd, translateDictionary.Translate('Fi&nd what:'), True);
          1: TranslateWindow(wnd, translateDictionary.Translate('Re&place with:'), True);
        end;
        Inc(counter);
      end;
  end;

  { Translates the child controls }

  EnumChildWindows(wnd, @IvTranslateReplaceDialog, 0);
end;

function IvDialogHook(Wnd: HWnd; Msg, WParam: Word; LParam: Longint): Word; export;
var
  Width: Integer;
  Rect: TRect;
begin
  Result := 0;
  try
    case Msg of
      WM_INITDIALOG:
        begin
          if ComboBox <> nil then
          begin
            ComboBox.CreateWnd(Wnd, EditControlId);
            ComboBox := nil;
          end;
          if HookCtl3D then
          begin
            Subclass3DDlg(Wnd, CTL3D_ALL);
            SetAutoSubClass(True);
          end;
          GetWindowRect(Wnd, Rect);
          Width := Rect.Right - Rect.Left;
          SetWindowPos(Wnd, 0,
            (GetSystemMetrics(SM_CXSCREEN) - Width) div 2,
            (GetSystemMetrics(SM_CYSCREEN) - Rect.Bottom + Rect.Top) div 3,
            0, 0, SWP_NOACTIVATE + SWP_NOSIZE + SWP_NOZORDER);
          Result := 1;
        end;

      WM_DESTROY:
        if HookCtl3D then
          SetAutoSubClass(False);

      WM_CTLCOLOR:
        if HookCtl3D and (@Ctl3DCtlColorEx <> nil) then
          Result := Ctl3DCtlColorEx(Wnd, Msg, WParam, LParam);

      WM_ACTIVATE:
        if WParam = WA_ACTIVE then
          translateFunction(Wnd, 0);

      WM_NCACTIVATE,
      WM_NCPAINT,
      WM_SETTEXT:
        if HookCtl3D and (@Ctl3DDlgFramePaint <> nil) then
        begin
          { The following fixes a Ctrl3D bug under Windows NT }
          if (GetWinFlags and $4000 <> 0) and (Msg = WM_SETTEXT) and
            (DialogTitle <> nil)
          then
            LParam := Longint(DialogTitle);
          SetWindowLong(
            Wnd,
            DWL_MSGRESULT,
            Ctl3DDlgFramePaint(Wnd, Msg, WParam, LParam));
          Result := 1;
        end;
    end;
  except
    Application.HandleException(nil);
  end;
end;

function TaskModalDialog(DialogFunc: Pointer; var DialogData): Bool;
type
  TDialogFunc = function(var DialogData): Bool;
var
  ActiveWindow: HWnd;
  WindowList: Pointer;
begin
  ActiveWindow := GetActiveWindow;
  WindowList := DisableTaskWindows(0);
  try
    Result := TDialogFunc(DialogFunc)(DialogData);
  finally
    EnableTaskWindows(WindowList);
    SetActiveWindow(ActiveWindow);
  end;
end;

function ValidHandle(Handle: THandle): Boolean;
var
  Count: Cardinal;
begin
  Result := IsBadWritePtr(Ptr(Handle, 0), Count);
end;

{ TIvDlgControl }

constructor TIvDlgControl.Create(Owner: TIvComboButton);
begin
  inherited Create;
  FObjectInstance := MakeObjectInstance(MainWndProc);
  FOwner := Owner;
end;

destructor TIvDlgControl.Destroy;
begin
  FreeObjectInstance(FObjectInstance);
  inherited Destroy;
end;

procedure TIvDlgControl.DefaultHandler(var msg);
begin
  if (FHandle <> 0) and (FDefWndProc <> nil) then
    with TMessage(msg) do
      Result := CallWindowProc(FDefWndProc, FHandle, Msg, wParam, lParam);
end;

procedure TIvDlgControl.MainWndProc(var msg: TMessage);
begin
  try
    WndProc(msg);
  except
    Application.HandleException(Self);
  end;
end;

procedure TIvDlgControl.SetVisible(Value: Boolean);
const
  Visble: array[Boolean] of Word = (
    SWP_HIDEWINDOW or SWP_NOMOVE or SWP_NOSIZE,
    SWP_SHOWWINDOW or SWP_NOMOVE or SWP_NOSIZE);
var
  Wnd: HWND;
begin
  if Value <> FVisible then
  begin
    FVisible := Value;
    if FVisible then
      Wnd := HWND_TOPMOST
    else Wnd := HWND_NOTOPMOST;
    SetWindowPos(FHandle, Wnd, 0, 0, 0, 0, Visble[FVisible]);
  end;
end;

procedure TIvDlgControl.WndProc(var msg: TMessage);
begin
  Dispatch(msg);
end;

procedure TIvDlgControl.WMNCDestroy(var msg: TWMNCDestroy);
begin
  inherited;
  FHandle := 0;
end;

{ TIvDlgEditControl }

procedure TIvDlgEditControl.Init;
begin
  FHandle := FOwner.FEditWnd;
  FDefWndProc := Pointer(SetWindowLong(FHandle, GWL_WNDPROC,
    Longint(FObjectInstance)));
end;

procedure TIvDlgEditControl.DefaultHandler(var msg);
begin
  with TMessage(msg) do
    case Msg of
      WM_KEYDOWN, WM_SYSKEYDOWN:
        if wParam in [VK_UP, VK_DOWN] then
        begin
          if not FOwner.FDropListBox.FVisible and (wParam = VK_DOWN) and
            (lParam and $20000000 <> 0) then
          begin
            FOwner.DropDown;
          end
          else
            SendMessage(FOwner.FDropListBox.FHandle, Msg, WParam, LParam);
          Exit;
        end;
    end;

  inherited DefaultHandler(msg);
end;

procedure TIvDlgEditControl.WMKillFocus(var msg: TWMKillFocus);
begin
  FOwner.Closeup;
  inherited;
end;

{ TIvCommonDlg }

procedure TIvCommonDlg.Init;
begin
  FHandle := GetParent(FOwner.FHandle);
  FDefWndProc := Pointer(SetWindowLong(FHandle, GWL_WNDPROC,
    Longint(FObjectInstance)));
end;

procedure TIvCommonDlg.WMLButtonDown(var msg: TWMLButtonDown);
begin
  FOwner.CloseUp;
  inherited;
end;

procedure TIvCommonDlg.WMNCLButtonDown(var msg: TWMNCLButtonDown);
begin
  FOwner.CloseUp;
  inherited;
end;

{ TIvDropListBox }

procedure TIvDropListBox.Init;
begin
  FHandle := CreateWindow('LISTBOX', '', WS_CHILD or LBS_HASSTRINGS or
    WS_VSCROLL or WS_BORDER or LBS_NOTIFY, 0, 0, 0, 0, FOwner.FHandle, $FFFF,
    HInstance, nil);
  if FHandle <> 0 then
  begin
    FDefWndProc := Pointer(SetWindowLong(FHandle, GWL_WNDPROC,
      Longint(FObjectInstance)));
    SetParent(FHandle, 0);
    CallWindowProc(FDefWndProc, FHandle, WM_SETFOCUS, 0, 0);
  end
  else
    raise EOutOfResources.Create(LoadStr(SWindowCreate));
end;

procedure TIvDropListBox.WMLButtonUp(var msg: TWMLButtonUp);
begin
  inherited;
  FOwner.CloseUp;
end;

{ File Common dialog ComboBox wrapper }

const
  WndClassName = 'DropListButton';
  ButtonWidth = 17;

constructor TIvComboButton.Create(Owner: TIvOpenDialog);
begin
  inherited Create;
  FOpenDialog := Owner;
  FObjectInstance := MakeObjectInstance(WndProc);
  FCanvas := TCanvas.Create;
  FGlyph := TBitmap.Create;
  FGlyph.Handle := LoadBitmap(0, PChar(OBM_COMBO));
  FDropListBox := TIvDropListBox.Create(Self);
  FEditControl := TIvDlgEditControl.Create(Self);
  FDlg := TIvCommonDlg.Create(Self);
end;

destructor TIvComboButton.Destroy;
begin
  FreeObjectInstance(FObjectInstance);
  FCanvas.Free;
  FGlyph.Free;
  FDropListBox.Free;
  FEditControl.Free;
  FDlg.Free;
  inherited Destroy;
end;

procedure TIvComboButton.Closeup;
begin
  FDropListBox.SetVisible(False);
end;

procedure TIvComboButton.DropDown;
var
  EditText: array[Byte] of Char;
  CurSel: Integer;

  procedure AdjustDropDown(CtrlWnd: HWnd);
  var
    DC: HDC;
    SaveFont: HFONT;
    I, W, ItemCount, ListWidth, MaxWidth: Integer;
    Metrics: TTextMetric;
    EditSize, ButtonSize: TRect;
    EditWnd, Wnd: HWnd;
    Height, Top: Integer;

    function TextWidth(const S: string): Integer;
    var
      C: array[Byte] of Char;
      Size: TSize;
    begin
      GetTextExtentPoint(DC, StrPCopy(C, S), Length(S), Size);
      Result := Size.cX;
    end;

  begin
    DC := CreateCompatibleDC(0);
    SaveFont := SelectObject(DC, SendMessage(CtrlWnd, WM_GETFONT, 0, 0));
    GetTextMetrics(DC, Metrics);
    try
      ItemCount := FOpenDialog.FHistoryList.Count;
      if ItemCount < 1 then ItemCount := 1;
      if ItemCount > 8 then ItemCount := 8;
      Wnd := GetParent(FHandle);
      GetWindowRect(FEditWnd, EditSize);
      GetWindowRect(FHandle, ButtonSize);
      ListWidth := ButtonSize.Right - EditSize.Left;
      MaxWidth := ListWidth * 2;
      for I := 0 to FOpenDialog.FHistoryList.Count - 1 do
      begin
        W := TextWidth(FOpenDialog.FHistoryList[I]);
        if FOpenDialog.FHistoryList.Count > 8 then
          Inc(W, GetSystemMetrics(SM_CXVSCROLL));
        if (W > ListWidth) and (W < MaxWidth) then
          ListWidth := W;
      end;
      Height := Metrics.tmHeight * ItemCount + 2;
      Top  := EditSize.Top + (EditSize.Bottom - EditSize.Top) - 1;
      if (Top + Height) > Screen.height then
         Top := EditSize.Top - Height + 1;
      if Top < 0  then
         Top  := EditSize.Top + (EditSize.Bottom - EditSize.Top) - 1;
      SetWindowPos(CtrlWnd, 0, EditSize.Left, Top, ListWidth, Height, SWP_NOACTIVATE);
    finally
      SelectObject(DC, SaveFont);
      DeleteDC(DC);
    end;
  end;

begin
  if not FDropListBox.FVisible then
  begin
    AdjustDropDown(FDropListBox.FHandle);
    SetFocus(FEditWnd);
    GetWindowText(FEditWnd, EditText, SizeOf(EditText));
    CurSel := SendMessage(FDropListBox.FHandle, LB_FINDSTRINGEXACT, $FFFF, Longint(@EditText));
    SendMessage(FDropListBox.FHandle, LB_SETCURSEL, CurSel, 0);
    FDropListBox.SetVisible(True);
  end;
end;

procedure TIvComboButton.WMCommand(var msg: TWMCommand);
var
  CurSel: Integer;
  CurText: array[Byte] of Char;
begin
  with msg do
    if NotifyCode = LBN_SELCHANGE then
    begin
      CurSel := SendMessage(FDropListBox.FHandle, LB_GETCURSEL, 0, 0);
      if CurSel <> LB_ERR then
      begin
        SendMessage(FDropListBox.FHandle, LB_GETTEXT, CurSel, Longint(@CurText));
        SetWindowText(FEditWnd, CurText);
        SendMessage(FEditWnd, EM_SETSEL, 0, MakeLong(0, $FFFF));
      end;
    end;
  inherited;
end;

procedure TIvComboButton.WMDestroy(var msg: TWMDestroy);
begin
  inherited;
  if FDropListBox.FHandle <> 0 then
    DestroyWindow(FDropListBox.FHandle);
end;

procedure TIvComboButton.WMNCDestroy(var msg: TWMNCDestroy);
begin
  inherited;
  FHandle := 0;
end;

procedure TIvComboButton.WMPaint(var msg: TWMPaint);
var
  DC: HDC;
  PS: TPaintStruct;
  GlyphLeft, GlyphTop: Integer;
  ClientRect: TRect;
  Width, Height: Integer;
begin
  DC := msg.DC;
  if DC = 0 then
    DC := BeginPaint(FHandle, PS);
  try
    FCanvas.Handle := DC;
    try
      GetClientRect(FHandle, ClientRect);
      Width := ClientRect.Right;
      Height := ClientRect.Bottom;
      with FCanvas do
      begin
        Pen.Color := clWindowFrame;
        Brush.Color := clBtnFace;
        Rectangle(0, 0, Width, Height);
        if FDown then
          Pen.Color := clBtnShadow
        else
          Pen.Color := clBtnHighlight;
        MoveTo(1, Height - 2);
        LineTo(1, 1);
        LineTo(Width - 1, 1);
        GlyphLeft := (Width - FGlyph.Width) div 2;
        GlyphTop := (Height - FGlyph.Height) div 2;
        if FDown then
        begin
          Inc(GlyphLeft);
          Inc(GlyphTop);
        end else
        begin
          Pen.Color := clBtnShadow;
          MoveTo(1, Height - 2);
          LineTo(Width - 2, Height - 2);
          LineTo(Width - 2, 0);
        end;
        Draw(GlyphLeft, GlyphTop, FGlyph)
      end;
    finally
      FCanvas.Handle := 0;
    end;
  finally
    if msg.DC = 0 then
      EndPaint(FHandle, PS);
  end;
end;

procedure TIvComboButton.WMLButtonDown(var msg: TWMLButtonDown);
begin
  inherited;
  if FDropListBox.FVisible then
    CloseUp
  else
  begin
    DropDown;
    SetCapture(FHandle);
    FDown := True;
    FPressed := True;
    Repaint;
  end;
end;

procedure TIvComboButton.WMMouseMove(var msg: TWMMouseMove);
var
  NewDown: Boolean;
  P: TPoint;
  Rect: TRect;
begin
  inherited;
  if FPressed then
    with msg do
    begin
      GetClientRect(FHandle, Rect);
      NewDown := (XPos >= 0) and (YPos >= 0) and
        (XPos < Rect.Right) and (YPos < Rect.Bottom);
      if FDown <> NewDown then
      begin
        FDown := NewDown;
        Repaint;
      end;
      if not FDown and FDropListBox.FVisible then
      begin
        P := SmallPointToPoint(Pos);
        ClientToScreen(FHandle, P);
        GetWindowRect(FDropListBox.FHandle, Rect);
        if PtInRect(Rect, P) then
        begin
          SendMessage(FHandle, WM_LBUTTONUP, 0, 0);
          SendMessage(FDropListBox.FHandle, WM_LBUTTONDOWN, 0, 0);
        end;
      end;
    end;
end;

procedure TIvComboButton.WMLButtonUp(var msg: TWMLButtonUp);
begin
  inherited;
  if FPressed then
  begin
    ReleaseCapture;
    FDown := False;
    FPressed := False;
    Repaint;
  end;
end;

procedure TIvComboButton.CreateWnd(Dlg: HWnd; ControlID: Word);
const
  Gap = 8;
var
  EditSize: TRect;
  I: Integer;
  StringBuf: array[0..255] of Char;
  Font: HFont;
begin
  if Dlg <> 0 then
  begin
    RegisterClass;
    FEditWnd := GetDlgItem(Dlg, ControlID);
    if FEditWnd <> 0 then
    try
      GetWindowRect(FEditWnd, EditSize);
      ScreenToClient(Dlg, EditSize.TopLeft);
      ScreenToClient(Dlg, EditSize.BottomRight);
      Dec(EditSize.Right, ButtonWidth + Gap);
      SetWindowPos(FEditWnd, 0, 0, 0, EditSize.Right - EditSize.Left,
        EditSize.Bottom - EditSize.Top, SWP_NOMOVE);
      FHandle := CreateWindow(WndClassName, '', WS_CHILD or WS_VISIBLE,
        EditSize.Right + Gap, EditSize.Top, ButtonWidth, EditSize.Bottom - EditSize.Top,
        Dlg, $FFFF, HInstance, nil);
      if FHandle <> 0 then
      begin
        FDefWndProc := Pointer(SetWindowLong(FHandle, GWL_WNDPROC,
          Longint(FObjectInstance)));
        FDropListBox.Init;
        FEditControl.Init;
        Font := SendMessage(Dlg, WM_GETFONT, 0, 0);
        SendMessage(FDropListBox.FHandle, WM_SETFONT, Font, 0);
        if FOpenDialog.FHistoryList <> nil then
          for I := 0 to FOpenDialog.FHistoryList.Count - 1 do
            SendMessage(FDropListBox.FHandle, LB_ADDSTRING, 0,
              Longint(StrPCopy(StringBuf, FOpenDialog.FHistoryList[I])));
      end
      else
        raise EOutOfResources.Create(LoadStr(SWindowCreate));
      FDlg.Init;
      UpdateWindow(FHandle);
    except
      if FHandle <> 0 then DestroyWindow(FHandle);
      raise;
    end;
  end;
end;

procedure TIvComboButton.RegisterClass;
var
  WndClass: TWndClass;
  ClassName: array[0..63] of Char;
begin
  if not GetClassInfo(HInstance, WndClassName, WndClass) then
  begin
    FillChar(WndClass, SizeOf(WndCLass), 0);
    with WndClass do
    begin
      style := CS_HREDRAW or CS_VREDRAW;
      lpfnWndProc := @DefWindowProc;
      hCursor := LoadCursor(0, IDC_ARROW);
      hbrBackground := COLOR_WINDOW + 1;
      lpszClassName := StrPCopy(ClassName, WndClassName);
    end;
    WndClass.hInstance := HInstance;
    if not WinProcs.RegisterClass(WndClass) then
      raise EOutOfResources.Create(LoadStr(SWindowClass));
  end;
end;

procedure TIvComboButton.Repaint;
begin
  InvalidateRect(FHandle, nil, False);
  UpdateWindow(FHandle);
end;

procedure TIvComboButton.DefaultHandler(var msg);
begin
  if (FHandle <> 0) and (FDefWndProc <> nil) then
    with TMessage(msg) do
      Result := CallWindowProc(FDefWndProc, FHandle, Msg, wParam, lParam);
end;

procedure TIvComboButton.WndProc(var msg: TMessage);
begin
  try
    Dispatch(msg);
  except
    Application.HandleException(Self);
  end;
end;

{ Common Dialog main window manager }

type
  TIvCommonDialogList = class(TList)
  private
    function CheckHelpAndIsDialog(Code: Integer; WParam: Word;
      var Msg: TMsg): LongInt;
  public
    Hook: HHook;
    procedure Add(CommonDialog: TIvCommonDialog);
    procedure Remove(CommonDialog: TIvCommonDialog);
    destructor Destroy; override;
  end;

var
  CommonDialogList: TIvCommonDialogList;

function HelpFilterHook(Code: Integer; WParam: Word; LParam: Longint): LongInt; export;
begin
  try
    Result := 0;
    if (Code >= 0) and (WParam = MSGF_DIALOGBOX) then
      Result := CommonDialogList.CheckHelpAndIsDialog(Code, WParam, PMsg(LParam)^);
    if Result = 0 then
      Result := CallNextHookEx(CommonDialogList.Hook, Code, WParam, LParam);
  except
    Application.HandleException(nil);
  end;
end;

destructor TIvCommonDialogList.Destroy;
begin
  if Hook <> 0 then
  begin
    UnHookWindowsHookEx(Hook);
    Hook := 0;
  end;
  inherited Destroy;
end;

procedure TIvCommonDialogList.Add(CommonDialog: TIvCommonDialog);
begin
  if Count = 0 then
    Hook := SetWindowsHookEx(WH_MSGFILTER, HelpFilterHook,
      GetInstanceModule(HInstance), GetCurrentTask);
  inherited Add(CommonDialog);
  Application.HookMainWindow(CommonDialog.Message);
end;

procedure TIvCommonDialogList.Remove(CommonDialog: TIvCommonDialog);
begin
  inherited Remove(CommonDialog);
  Application.UnhookMainWindow(CommonDialog.Message);
  if Count = 0 then
  begin
    if Hook <> 0 then
    begin
      UnHookWindowsHookEx(Hook);
      Hook := 0;
    end;
  end;
end;

function TIvCommonDialogList.CheckHelpAndIsDialog(Code: Integer; WParam: Word;
  var Msg: TMsg): LongInt;
var
  OurWindow, DlgWindow, WorkWindow, HelpButton: HWND;

  function IsCorrectHelpKey: Boolean;
  begin
    Result := (Msg.wParam = VK_F1) and ((Msg.lParam and $00000004) = 0) and
      (GetKeyState(VK_CONTROL) >= 0) and (GetKeyState(VK_SHIFT) >= 0);
  end;

  procedure RetrieveHandles;
  begin
    OurWindow := 0;
    DlgWindow := 0;
    WorkWindow := Msg.hwnd;
    while WorkWindow <> 0 do
    begin
      DlgWindow := OurWindow;
      OurWindow := WorkWindow;
      WorkWindow := GetParent(WorkWindow);
    end;
  end;

begin
  Result := 0;
  RetrieveHandles;
  if (OurWindow <> 0) and (OurWindow = Application.Handle) and (DlgWindow <> 0) then
  begin
    if (Msg.Message = WM_KEYDOWN) and IsCorrectHelpKey then
    begin
      HelpButton := GetDlgItem(DlgWindow, pshHelp);
      if HelpButton <> 0 then
      begin
        PostMessage(DlgWindow, WM_COMMAND, pshHelp, MakeLong(BN_CLICKED,
          HelpButton));
        Result := 1;
      end;
    end;
  end;
end;

{ TIvCommonDialog }

constructor TIvCommonDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCtl3D := True;
end;

function TIvCommonDialog.Message(var Msg: TMessage): Boolean;
begin
  Result := False;
  if (Msg.Msg = HelpMsg) and (FHelpContext <> 0) then
  begin
    Application.HelpContext(FHelpContext);
    Result := True;
  end;
end;

procedure TIvCommonDialog.InitDictionary;
begin
  if FDictionaryName <> '' then
    FDictionary := Dictionaries.FindDictionary(FDictionaryName);

  if FDictionary = nil then
    FDictionary := Dictionaries[0];
end;

procedure TIvCommonDialog.SetDictionary(value: TIvDictionary);
begin
  if value <> FDictionary then
  begin
    FDictionary := value;
    if FDictionary <> nil then
      FDictionaryName := FDictionary.DictionaryName;
  end;
end;

procedure TIvCommonDialog.SetDictionaryName(const value: String);
begin
  if FDictionaryName <> value then
  begin
    Dictionary := Dictionaries.FindDictionary(value);
    FDictionaryName := value;
  end;
end;

{ TIvOpenDialog }

constructor TIvOpenDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FHistoryList := TStringList.Create;
  FFiles := TStringList.Create;
  FComboBox := TIvComboButton.Create(Self);
  FFilter := NullStr;
  FInitialDir := NullStr;
  FTitle := NullStr;
  FFilterIndex := 1;
  FFileEditStyle := fsEdit;
end;

destructor TIvOpenDialog.Destroy;
begin
  DisposeStr(FTitle);
  DisposeStr(FInitialDir);
  DisposeStr(FFilter);
  FComboBox.Free;
  FHistoryList.Free;
  FFiles.Free;
  inherited Destroy;
end;

function TIvOpenDialog.DoExecute(Func: Pointer): Bool;
const
  OpenOptions: array [TOpenOption] of Longint = (
    OFN_READONLY, OFN_OVERWRITEPROMPT, OFN_HIDEREADONLY,
    OFN_NOCHANGEDIR, OFN_SHOWHELP, OFN_NOVALIDATE, OFN_ALLOWMULTISELECT,
    OFN_EXTENSIONDIFFERENT, OFN_PATHMUSTEXIST, OFN_FILEMUSTEXIST,
    OFN_CREATEPROMPT, OFN_SHAREAWARE, OFN_NOREADONLYRETURN,
    OFN_NOTEXTFILECREATE);
var
  Option: TOpenOption;
  OpenFilename: TOpenFilename;
  CDefaultExt: array[0..SizeOf(TFileExt) - 1] of Char;
  CInitialDir: array[0..79] of Char;
  CTitle: array[0..79] of Char;
  CFilter: array[0..257] of Char;

  function StrFilterCopy(P: PChar; const S: string): PChar;
  begin
    Result := nil;
    if S <> '' then
    begin
      Result := StrPCopy(P, S);
      while P^ <> #0 do
      begin
        if P^ = '|' then P^ := #0;
        Inc(P);
      end;
      Inc(P);
      P^ := #0;
    end;
  end;

  function ProcessIndividualItem(var P: PChar): string;
  var
    I: Integer;
  begin
    I := 0;
    while (P[I] <> #0) and (P[I] <> ' ') do
    begin
      Result[I + 1] := P[I];
      Inc(I);
    end;
    Result[0] := Char(I);
    if P[I] = #0 then Inc(P, I) else Inc(P, I + 1);
  end;

  procedure ProcessMultipleSelection(P: PChar);
  var
    DirPart, FilePart: String;
  begin
    DirPart := ProcessIndividualItem(P);
    if Length(DirPart) <> 0 then
    begin
      repeat
        FilePart := ProcessIndividualItem(P);
        if FilePart <> '' then
          FFiles.Add(DirPart + '\' + FilePart);
      until FilePart = '';
      if FFiles.Count = 0 then
        FFiles.Add(DirPart);
    end;
  end;

begin
  FFiles.Clear;
  FillChar(OpenFileName, SizeOf(OpenFileName), 0);
  with OpenFilename do
  begin
    lStructSize := SizeOf(TOpenFilename);
    hInstance := System.HInstance;
    lpstrFilter := StrFilterCopy(CFilter, FFilter^);
    nFilterIndex := FFilterIndex;
    if ofAllowMultiSelect in FOptions then
      nMaxFile := $1000
    else
      nMaxFile := sizeof(TFileName);
    try
      GetMem(lpstrFile, nMaxFile + 1);
      FillChar(lpstrFile^, nMaxFile + 1, 0);
      StrPCopy(lpstrFile, FFileName);
      lpstrInitialDir := StrPLCopy(CInitialDir, FInitialDir^,
        SizeOf(CInitialDir) - 1);
      lpstrTitle := StrPLCopy(CTitle, FTitle^, SizeOf(CTitle) - 1);
      if Length(FTitle^) > 0 then DialogTitle := lpstrTitle;
      Flags := OFN_ENABLEHOOK;
      for Option := Low(Option) to High(Option) do
        if Option in FOptions then
          Flags := Flags or OpenOptions[Option];
      lpstrDefExt := StrPCopy(CDefaultExt, FDefaultExt);
      lpfnHook := IvDialogHook;
      if Func = @GetOpenFileName then
        translateFunction := IvTranslateOpenDialog
      else
        translateFunction := IvTranslateSaveDialog;
      HookCtl3D := FCtl3D;
      HookColorDlg := False;
      if FFileEditStyle = fsComboBox then
        ComboBox := FComboBox
      else ComboBox := nil;
      CommonDialogList.Add(Self);
      hWndOwner := Application.Handle;
      if FDictionary = nil then
        translateDictionary := nil
      else
        translateDictionary := FDictionary;
      Result := TaskModalDialog(Func, OpenFileName);
      DialogTitle := nil;
      CommonDialogList.Remove(Self);
      if Result then
      begin
        ProcessMultipleSelection(lpstrFile);
        FFileName := FFiles.Strings[0];
        if (Flags and OFN_EXTENSIONDIFFERENT) <> 0 then
          FOptions := FOptions + [ofExtensionDifferent]
        else
          FOptions := FOptions - [ofExtensionDifferent];
        if (Flags and OFN_READONLY) <> 0 then
          FOptions := FOptions + [ofReadOnly]
        else
          FOptions := FOptions - [ofReadOnly];
      end;
    finally
      FreeMem(lpstrFile, nMaxFile + 1);
    end;
  end;
end;

function TIvOpenDialog.GetFilter: string;
begin
  Result := FFilter^;
end;

function TIvOpenDialog.GetInitialDir: string;
begin
  Result := FInitialDir^;
end;

function TIvOpenDialog.GetTitle: string;
begin
  Result := FTitle^;
end;

procedure TIvOpenDialog.SetFilter(const AFilter: String);
begin
  AssignStr(FFilter, AFilter);
end;

procedure TIvOpenDialog.SetInitialDir(const AInitialDir: String);

  function TrimBackslash(const Dir: string): string;
  begin
   if (Dir = '') or ((Length(Dir) = 3) and (Dir[3] = '\')) or
     (Dir[Length(Dir)] <> '\') then
      Result := Dir
    else if Dir[Length(Dir)] = '\' then
      Result := Copy(Dir, 1, Length(Dir) - 1);
  end;

begin
  AssignStr(FInitialDir, TrimBackslash(AInitialDir));
end;

procedure TIvOpenDialog.SetHistoryList(Value: TStrings);
begin
  FHistoryList.Assign(Value);
end;

function TIvOpenDialog.GetFiles: TStrings;
begin
  Result := FFiles;
end;

procedure TIvOpenDialog.SetTitle(const ATitle: String);
begin
  AssignStr(FTitle, ATitle);
end;

function TIvOpenDialog.Execute: Boolean;
begin
  InitDictionary;
  Result := DoExecute(@GetOpenFileName);
end;

{ TIvSaveDialog }

function TIvSaveDialog.Execute: Boolean;
begin
  InitDictionary;
  Result := DoExecute(@GetSaveFileName);
end;

{ TIvColorDialog }

constructor TIvColorDialog.Create(AOwner: TComponent);
var
  I: Integer;
begin
  inherited Create(AOwner);
  FCtl3D := False;
  FCustomColors := TStringList.Create;
end;

destructor TIvColorDialog.Destroy;
begin
  FCustomColors.Free;
  inherited Destroy;
end;

function TIvColorDialog.Execute: Boolean;
const
  DialogOptions: array[TColorDialogOption] of LongInt = (
    CC_FULLOPEN, CC_PREVENTFULLOPEN, CC_SHOWHELP);
var
  ChooseColorRec: TChooseColor;
  Option: TColorDialogOption;
  CustomColorsArray: TCustomColors;
  ColorPrefix, ColorTags: string;

  procedure GetCustomColorsArray;
  var
    I: Integer;
  begin
    if (Length(ColorPrefix) > 0) and (Length(ColorTags) > 0) then
      for I := 1 to MaxCustomColors do
        FCustomColors.Values[ColorPrefix + ColorTags[I]] :=
          Format('%x', [CustomColorsArray[I - 1]]);
  end;

  procedure SetCustomColorsArray;
  var
    Value: string;
    I: Integer;
  begin
    if (Length(ColorPrefix) > 0) and (Length(ColorTags) > 0) then
      for I := 1 to MaxCustomColors do
      begin
        Value := FCustomColors.Values[ColorPrefix + ColorTags[I]];
        if Value <> '' then CustomColorsArray[I - 1] := StrToInt('$' + Value)
        else CustomColorsArray[I - 1] := -1;
      end;
  end;

begin
  InitDictionary;
  
  with ChooseColorRec do
  begin
    lStructSize := SizeOf(ChooseColorRec);
    rgbResult := ColorToRGB(FColor);
    lpCustColors := @CustomColorsArray;
    Flags := CC_RGBINIT or CC_ENABLEHOOK;
    for Option := Low(Option) to High(Option) do
      if Option in FOptions then
        Flags := Flags or DialogOptions[Option];
    ColorPrefix := 'Color';
    ColorTags := 'ABCDEFGHIJKLMNOP';
    SetCustomColorsArray;
    lpfnHook := IvDialogHook;
    translateFunction := IvTranslateColorDialog;
    HookCtl3D := FCtl3D;
    HookColorDlg := True;
    CommonDialogList.Add(Self);
    hWndOwner := Application.Handle;
    if FDictionary = nil then
      translateDictionary := nil
    else
      translateDictionary := FDictionary;
    Result := TaskModalDialog(@ChooseColor, ChooseColorRec);
    CommonDialogList.Remove(Self);
    GetCustomColorsArray;
    if Result then FColor := rgbResult;
  end;
end;

procedure TIvColorDialog.SetCustomColors(Value: TStrings);
begin
  FCustomColors.Assign(Value);
end;

{ TIvFontDialog }

constructor TIvFontDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFont := TFont.Create;
  FOptions := [fdEffects];
end;

destructor TIvFontDialog.Destroy;
begin
  FFont.Free;
  inherited Destroy;
end;

procedure TIvFontDialog.UpdateFromLogFont(const LogFont: TLogFont);
var
  Style: TFontStyles;
begin
  with LogFont do
  begin
    Font.Name := StrPas(LogFont.lfFaceName);
    Font.Height := LogFont.lfHeight;
    Style := [];
    with LogFont do
    begin
      if lfWeight > FW_REGULAR then Include(Style, fsBold);
      if lfItalic <> 0 then Include(Style, fsItalic);
      if lfUnderline <> 0 then Include(Style, fsUnderline);
      if lfStrikeOut <> 0 then Include(Style, fsStrikeOut);
    end;
    Font.Style := Style;
  end;
end;

procedure TIvFontDialog.Apply(Wnd: HWND);
begin
  if Assigned(FOnApply) then FOnApply(Self, Wnd);
end;

procedure TIvFontDialog.DoApply(Wnd: HWND);
const
  IDCOLORCMB = $473;
var
  I: Integer;
  LogFont: TLogFont;
begin
  { Retrieve current state from dialog }
  SendMessage(Wnd, WM_CHOOSEFONT_GETLOGFONT, 0, LongInt(@LogFont));
  UpdateFromLogFont(LogFont);
  I := SendDlgItemMessage(Wnd, IDCOLORCMB, CB_GETCURSEL, 0, 0);
  if I <> CB_ERR then
    Font.Color := SendDlgItemMessage(Wnd, IDCOLORCMB, CB_GETITEMDATA, I, 0);
  try
    Apply(Wnd);
  except
    Application.HandleException(Self);
  end;
end;

procedure TIvFontDialog.SetFont(Value: TFont);
begin
  FFont.Assign(Value);
end;

const
  IDAPPLYBTN = $402;

var
  FontDlg: TIvFontDialog;

function IvFontDialogHook(Wnd: HWnd; Msg, WParam: Word; LParam: Longint): Word; export;
begin
  if (Msg = WM_COMMAND) and (wParam = IDAPPLYBTN) and
    (LongRec(lParam).Hi = BN_CLICKED) then
  begin
    FontDlg.DoApply(Wnd);
    Result := 1;
  end
  else
    Result := IvDialogHook(Wnd, Msg, wParam, lParam);
end;

function TIvFontDialog.Execute: Boolean;
const
  FontOptions: array[TFontDialogOption] of LongInt = (
    CF_ANSIONLY, CF_TTONLY, CF_EFFECTS, CF_FIXEDPITCHONLY, CF_FORCEFONTEXIST,
    CF_NOFACESEL, CF_NOOEMFONTS, CF_NOSIMULATIONS, CF_NOSIZESEL, CF_NOSTYLESEL,
    CF_NOVECTORFONTS, CF_SHOWHELP, CF_WYSIWYG, CF_LIMITSIZE, CF_SCALABLEONLY);
  Devices: array[TFontDialogDevice] of LongInt = (
    CF_SCREENFONTS, CF_PRINTERFONTS, CF_BOTH);
var
  ChooseFontRec: TChooseFont;
  LogFont: TLogFont;
  Option: TFontDialogOption;
  OldFontDlg: TIvFontDialog;
begin
  InitDictionary;
  
  with ChooseFontRec do
  begin
    lStructSize := SizeOf(ChooseFontRec);
    hDC := 0;
    if FDevice <> fdScreen then hDC := Printer.Handle;
    lpLogFont := @LogFont;
    GetObject(Font.Handle, SizeOf(LogFont), @LogFont);
    Flags := (CF_INITTOLOGFONTSTRUCT or CF_ENABLEHOOK) or Devices[FDevice];
    for Option := Low(Option) to High(Option) do
      if Option in FOptions then
        Flags := Flags or FontOptions[Option];
    if Assigned(FOnApply) then
      Flags := Flags or CF_APPLY;
    rgbColors := Font.Color;
    lCustData := 0;
    OldFontDlg := FontDlg;
    FontDlg := Self;
    lpfnHook := IvFontDialogHook;
    translateFunction := IvTranslateFontDialog;
    HookCtl3D := FCtl3D;
    HookColorDlg := False;
    nSizeMin := FMinFontSize;
    nSizeMax := FMaxFontSize;
    if nSizeMin > nSizeMax then Flags := Flags and (not CF_LIMITSIZE);
    CommonDialogList.Add(Self);
    hWndOwner := Application.Handle;
    if FDictionary = nil then
      translateDictionary := nil
    else
      translateDictionary := FDictionary;
    Result := TaskModalDialog(@ChooseFont, ChooseFontRec);
    FontDlg := OldFontDlg;
    CommonDialogList.Remove(Self);
    if Result then
    begin
      UpdateFromLogFont(LogFont);
      Font.Color := rgbColors;
    end;
  end;
end;

{ TPrinterSetupDialog }

type
  PDevNamesRec = ^TDevNamesRec;
  TDevNamesRec = record
    DriverOfs: Word;
    DeviceOfs: Word;
    PortOfs: Word;
    Reserved: Word;
  end;

procedure GetPrinter(var DeviceMode, DeviceNames: THandle);
var
  DevRec: PDevNamesRec;
  Device, Driver, Port: array[0..79] of Char;
  P: PChar;
begin
  Printer.GetPrinter(Device, Driver, Port, DeviceMode);
  if DeviceMode <> 0 then
  begin
    DeviceNames := GlobalAlloc(GHND, SizeOf(TDevNamesRec) +
      StrLen(Device) + StrLen(Driver) + StrLen(Port) * 3);
    DevRec := Ptr(DeviceNames, 0);
    P := PChar(DevRec) + SizeOf(TDevNamesRec);
    with DevRec^ do
    begin
      DeviceOfs := PtrRec(P).Ofs;
      P := StrECopy(P, Device) + 1;
      DriverOfs := PtrRec(P).Ofs;
      P := StrECopy(P, Driver) + 1;
      PortOfs := PtrRec(P).Ofs;
      StrCopy(P, Port);
    end;
  end;
end;

procedure SetPrinter(DeviceMode, DeviceNames: THandle);
var
  DevRec: PDevNamesRec;
begin
  DevRec := Ptr(DeviceNames, 0);
  with DevRec^ do
    Printer.SetPrinter(@PChar(DevRec)[DeviceOfs],
      @PChar(DevRec)[DriverOfs], @PChar(DevRec)[PortOfs], DeviceMode);
  GlobalFree(DeviceNames);
end;

procedure TIvPrinterSetupDialog.Execute;
var
  PrintDlgRec: TPrintDlg;
  hTmpDevMode: THandle;
begin
  InitDictionary;
  
  FillChar(PrintDlgRec, SizeOf(PrintDlgRec), 0);
  with PrintDlgRec do
  begin
    lStructSize := SizeOf(PrintDlgRec);
    hInstance := System.HInstance;
    GetPrinter(hDevMode, hDevNames);
    hTmpDevMode := hDevMode;
    Flags := PD_ENABLESETUPHOOK or PD_PRINTSETUP;
    lpfnSetupHook := IvDialogHook;
    translateFunction := IvTranslatePrinterSetupDialog;
    HookCtl3D := FCtl3D;
    HookColorDlg := False;
    CommonDialogList.Add(Self);
    if FDictionary = nil then
      translateDictionary := nil
    else
      translateDictionary := FDictionary;
    hWndOwner := Application.Handle;
    if TaskModalDialog(@PrintDlg, PrintDlgRec) then
      SetPrinter(hDevMode, hDevNames)
    else
    begin
      if (hTmpDevMode <> hDevMode) and ValidHandle(hDevMode) then
        GlobalFree(hDevMode);
      if ValidHandle(hDevNames) then GlobalFree(hDevNames);
    end;
    CommonDialogList.Remove(Self);
  end;
end;

{ TIvPrinterDialog }

function TIvPrintDialog.Execute: Boolean;
const
  APrintRange: array[TPrintRange] of Integer =
    (PD_ALLPAGES, PD_SELECTION, PD_PAGENUMS);
var
  PrintDlgRec: TPrintDlg;
  F: LongInt;
begin
  InitDictionary;
  
  FillChar(PrintDlgRec, SizeOf(PrintDlgRec), 0);
  with PrintDlgRec do
  begin
    lStructSize := SizeOf(PrintDlgRec);
    hInstance := System.HInstance;
    F := PD_ENABLEPRINTHOOK or PD_ENABLESETUPHOOK or APrintRange[FPrintRange];
    if FCollate then Inc(F, PD_COLLATE);
    if not (poPrintToFile in FOptions) then Inc(F, PD_HIDEPRINTTOFILE);
    if not (poPageNums in FOptions) then Inc(F, PD_NOPAGENUMS);
    if not (poSelection in FOptions) then Inc(F, PD_NOSELECTION);
    if (poDisablePrintToFile in FOptions) then Inc(F, PD_DISABLEPRINTTOFILE);
    if FPrintToFile then Inc(F, PD_PRINTTOFILE);
    if poHelp in FOptions then Inc(F, PD_SHOWHELP);
    if not (poWarning in FOptions) then Inc(F, PD_NOWARNING);
    Flags := F;
    nFromPage := FFromPage;
    nToPage := FToPage;
    nMinPage := FMinPage;
    nMaxPage := FMaxPage;
    nCopies := FCopies;
    lpfnPrintHook := IvDialogHook;
    lpfnSetupHook := IvDialogHook;
    translateFunction := IvTranslatePrintDialog;
    HookCtl3D := FCtl3D;
    HookColorDlg := False;
    GetPrinter(hDevMode, hDevNames);
    CommonDialogList.Add(Self);
    hWndOwner := Application.Handle;
    if FDictionary = nil then
      translateDictionary := nil
    else
      translateDictionary := FDictionary;
    Result := TaskModalDialog(@PrintDlg, PrintDlgRec);
    CommonDialogList.Remove(Self);
    if Result then
    begin
      SetPrinter(hDevMode, hDevNames);
      F := Flags;
      FCollate := F and PD_COLLATE <> 0;
      FPrintToFile := F and PD_PRINTTOFILE <> 0;
      if F and PD_SELECTION <> 0 then FPrintRange := prSelection
      else if F and PD_PAGENUMS <> 0 then FPrintRange := prPageNums
      else FPrintRange := prAllPages;
      FFromPage := nFromPage;
      FToPage := nToPage;
      FCopies := nCopies;
    end
    else
      if ValidHandle(hDevNames) then GlobalFree(hDevNames);
  end;
end;

function SearchReplaceWndProc(Wnd: HWND; Msg, WParam: Word; LParam: Longint): Longint; export;

  function CallDefDialogProc: Longint;
  var
    DlgProc: TFarProc;
  begin
    PtrRec(DlgProc).Ofs := THandle(GetProp(Wnd, MakeIntAtom(WndProcOfsAtom)));
    PtrRec(DlgProc).Seg := THandle(GetProp(Wnd, MakeIntAtom(WndProcSegAtom)));
    Result := CallWindowProc(DlgProc, Wnd, Msg, WParam, LParam);
  end;

begin
  try
    case Msg of
      WM_DESTROY:
        Application.DialogHandle := 0;

      WM_NCACTIVATE:
        if Bool(wParam) then
          Application.DialogHandle := Wnd
        else
          Application.DialogHandle := 0;

      WM_NCDESTROY:
        begin
          Result := CallDefDialogProc;
          RemoveProp(Wnd, MakeIntAtom(WndProcOfsAtom));
          RemoveProp(Wnd, MakeIntAtom(WndProcSegAtom));
          Exit;
        end;
     end;
     Result := CallDefDialogProc;
   except
     Application.HandleException(nil);
   end;
end;

function SearchReplaceDialogHook(Wnd: HWnd; Msg, WParam: Word; LParam: Longint): Word; export;
var
  PrevWndProc: Pointer;
  DPtr: TFindDialog;
  Rect: TRect;
begin
  Result := 0;
  try
    case Msg of
      WM_INITDIALOG:
        begin
          DPtr := TFindDialog(PFindReplace(LParam)^.lCustData);
          if (DPtr.Left <> -1) or (DPtr.Top <> -1) then
          begin
            GetWindowRect(Wnd, Rect);
            MoveWindow(Wnd, DPtr.Left, DPtr.Top, Rect.Right - Rect.Left,
              Rect.Bottom - Rect.Top, True);
          end;
          if HookCtl3D then
            Subclass3DDlg(Wnd, CTL3D_ALL);
          PrevWndProc := Pointer(GetWindowLong(Wnd, GWL_WNDPROC));
          SetProp(Wnd, MakeIntAtom(WndProcOfsAtom), THandle(PtrRec(PrevWndProc).Ofs));
          SetProp(Wnd, MakeIntAtom(WndProcSegAtom), THandle(PtrRec(PrevWndProc).Seg));
          SetWindowLong(Wnd, GWL_WNDPROC, Longint(@SearchReplaceWndProc));
          translateFunction(Wnd, 0);
          Result := 1;
        end;
    else
      Result := IvDialogHook(Wnd, Msg, wParam, lParam);
    end;
  except
    Application.HandleException(nil);
  end;
end;

{ TIvFindDialog }

constructor TIvFindDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FOptions := [frDown];
  FLeft := -1;
  FTop := -1;
end;

destructor TIvFindDialog.Destroy;
begin
  with FFindReplace do
    if lpstrFindWhat <> nil then
    begin
      FreeMem(lpstrFindWhat, wFindWhatLen);
      lpstrFindWhat := nil;
    end;
  inherited Destroy;
end;

function TIvFindDialog.Message(var Msg: TMessage): Boolean;
begin
  Result := inherited Message(Msg);
  if not Result then
    if (Msg.Msg = FindMsg) and (@FFindReplace = Pointer(Msg.lParam)) then
    begin
      ConvertFieldsForCallBack;
      if (FFindReplace.Flags and FR_FINDNEXT) <> 0 then
      begin
        Find;
        Result := True;
      end
      else if (FFindReplace.Flags and FR_DIALOGTERM) <> 0 then
      begin
        FSafeHandle := 0;
        CommonDialogList.Remove(Self);
        Result := True;
      end;
    end;
end;

const
  FindOptions: array [TFindOption] of LongInt = (
    FR_DOWN, FR_FINDNEXT, FR_HIDEMATCHCASE, FR_HIDEWHOLEWORD,
    FR_HIDEUPDOWN, FR_MATCHCASE, FR_NOMATCHCASE, FR_NOUPDOWN, FR_NOWHOLEWORD,
    FR_REPLACE, FR_REPLACEALL, FR_WHOLEWORD, FR_SHOWHELP);

procedure TIvFindDialog.ConvertFields;
var
  Option: TFindOption;
begin
  with FFindReplace do
  begin
    Flags := FR_ENABLEHOOK;
    for Option := Low(Option) to High(Option) do
      if Option in FOptions then
        Flags := Flags or FindOptions[Option];
    if lpstrFindWhat = nil then
    begin
      wFindWhatLen := 255;
      GetMem(lpstrFindWhat, wFindWhatLen);
      FillChar(lpstrFindWhat^, wFindWhatLen, 0);
    end;
    StrPCopy(lpstrFindWhat, FindText);
  end;
end;

procedure TIvFindDialog.ConvertFieldsForCallBack;
var
  Option: TFindOption;
begin
  FFindText := StrPas(FFindReplace.lpstrFindWhat);
  FOptions := [];
  for Option := Low(Option) to High(Option) do
    if (FFindReplace.Flags and FindOptions[Option]) <> 0 then
      Include(FOptions, Option);
end;

function TIvFindDialog.DoExecute(Func: Pointer): Bool;
type
  TSearchFunc = function (var SearchData): HWnd;
begin
  with FFindReplace do
  begin
    if FSafeHandle <> 0 then
      SetWindowPos(FSafeHandle, HWND_TOP, 0, 0, 0, 0,
        SWP_NOMOVE or SWP_NOSIZE or SWP_SHOWWINDOW)
    else
    begin
      lStructSize := SizeOf(TFindReplace);
      hInstance := System.HInstance;
      CommonDialogList.Add(Self);
      hWndOwner := Application.Handle;
      HookCtl3D := FCtl3D;
      lCustData := LongInt(Self);
      lpfnHook := SearchReplaceDialogHook;
      if Self is TIvReplaceDialog then
        translateFunction := IvTranslateReplaceDialog
      else
        translateFunction := IvTranslateFindDialog;
      lpTemplateName := nil;
      ConvertFields;
      if FDictionary = nil then
        translateDictionary := nil
      else
        translateDictionary := FDictionary;
      FSafeHandle := TSearchFunc(Func)(FFindReplace);
    end;
  end;
end;

function TIvFindDialog.Execute: Boolean;
begin
  InitDictionary;
  DoExecute(@IvFindText);
end;

procedure TIvFindDialog.CloseDialog;
begin
  if FSafeHandle <> 0 then
    PostMessage(FSafeHandle, wm_Close, 0, 0);
end;

function TIvFindDialog.GetLeft: Integer;
var
  Placement: TWindowPlacement;
begin
  Result := FLeft;
  Placement.Length := SizeOf(Placement);
  if (FSafeHandle <> 0) and
     (GetWindowPlacement(FSafeHandle, @Placement) <> False) then
  begin
    Result := Placement.rcNormalPosition.Left;
    FLeft := Result;
  end;
end;

function TIvFindDialog.GetTop: Integer;
var
  Placement: TWindowPlacement;
begin
  Result := FTop;
  Placement.Length := SizeOf(Placement);
  if (FSafeHandle <> 0) and
     (GetWindowPlacement(FSafeHandle, @Placement) <> False) then
  begin
    Result := Placement.rcNormalPosition.Top;
    FTop := Result;
  end;
end;

function TIvFindDialog.GetPosition: TPoint;
var
  Placement: TWindowPlacement;
begin
  Result.X := Left;
  Result.Y := Top;
  Placement.Length := SizeOf(Placement);
  if (FSafeHandle <> 0) and
     (GetWindowPlacement(FSafehandle, @Placement) <> False) then
    Result := Placement.rcNormalPosition.TopLeft;
  FLeft := Result.X;
  FTop := Result.Y;
end;

procedure TIvFindDialog.SetPosition(const Point: TPoint);
var
  Rect: TRect;
begin
  if (Point.X <> FLeft) or (Point.Y <> FTop) then
  begin
    FLeft := Point.X;
    FTop := Point.Y;
    if FSafeHandle <> 0 then
    begin
      GetWindowRect(FSafeHandle, Rect);
      MoveWindow(FSafeHandle, Point.X, Point.Y, Rect.Right - Rect.Left,
        Rect.Bottom - Rect.Top, True);
    end;
  end;
end;

procedure TIvFindDialog.SetLeft(Value: Integer);
begin
  SetPosition(Point(Value, FTop));
end;

procedure TIvFindDialog.SetTop(Value: Integer);
begin
  SetPosition(Point(FLeft, Value));
end;

procedure TIvFindDialog.Find;
begin
  if Assigned(FOnFind) then FOnFind(Self);
end;

{ TIvReplaceDialog }

destructor TIvReplaceDialog.Destroy;
begin
  with FFindReplace do
    if lpstrReplaceWith = nil then
    begin
      FreeMem(lpstrReplaceWith, wReplaceWithLen);
      lpstrReplaceWith := nil;
    end;
  inherited Destroy;
end;

function TIvReplaceDialog.Execute: Boolean;
begin
  InitDictionary;
  DoExecute(@CommDlg.ReplaceText);
end;

function TIvReplaceDialog.Message(var Msg: TMessage): Boolean;
begin
  Result := inherited Message(Msg);
  if not Result then
    if (Msg.Msg = FindMsg) and (@FFindReplace = Pointer(Msg.lParam)) then
      if (FFindReplace.Flags and (FR_REPLACE or FR_REPLACEALL)) <> 0 then
      begin
        Replace;
        Result := True;
      end;
end;

procedure TIvReplaceDialog.ConvertFields;
begin
  inherited ConvertFields;
  with FFindReplace do
  begin
    if lpstrReplaceWith = nil then
    begin
      wReplaceWithLen := 255;
      GetMem(lpstrReplaceWith, wReplaceWithLen);
      FillChar(lpstrReplaceWith^, wReplaceWithLen, 0);
    end;
    StrPCopy(lpstrReplaceWith, ReplaceText);
  end;
end;

procedure TIvReplaceDialog.ConvertFieldsForCallBack;
begin
  inherited ConvertFieldsForCallBack;
  FReplaceText := StrPas(FFindReplace.lpstrReplaceWith);
end;

procedure TIvReplaceDialog.Replace;
begin
  if Assigned(FOnReplace) then
    FOnReplace(Self);
end;

procedure DestroyGlobals; far;
begin
  if CommonDialogList <> nil then
    CommonDialogList.Free;
  GlobalDeleteAtom(WndProcOfsAtom);
  GlobalDeleteAtom(WndProcSegAtom);
end;

procedure InitDialogs;
var
  AtomText: array[0..17] of Char;
begin
  HelpMsg := RegisterWindowMessage(HelpMsgString);
  FindMsg := RegisterWindowMessage(FindMsgString);
  CommonDialogList := TIvCommonDialogList.Create;
  WndProcOfsAtom := GlobalAddAtom(
    StrFmt(AtomText, 'IvWndProcOfs%.4X', [HInstance]));
  WndProcSegAtom := GlobalAddAtom(
    StrFmt(AtomText, 'IvWndProcSeg%.4X', [HInstance]));
  AddExitProc(DestroyGlobals);
end;

begin
  InitDialogs;
{$ENDIF}
end.

