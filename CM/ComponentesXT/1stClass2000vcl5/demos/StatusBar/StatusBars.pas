unit StatusBars;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcStatusBar, Menus, fcLabel, ComCtrls, Buttons, Db, DBTables, StdCtrls,
  DBCtrls, ExtCtrls, Gauges, fcClearPanel, fcButtonGroup, ShellAPI,
  fcButton, fcImgBtn, fcShapeBtn, fcDemoRichEdit;

type
  TStatusBarDemoForm = class(TForm)
    MainMenu1: TMainMenu;
    Main1: TMenuItem;
    Item11: TMenuItem;
    Item1: TMenuItem;
    Item3: TMenuItem;
    Secondary1: TMenuItem;
    psMenu1: TMenuItem;
    Menu1: TMenuItem;
    RichEditRowCol1: TMenuItem;
    Control1: TMenuItem;
    ImageList1: TImageList;
    Timer1: TTimer;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    fcDemoRichEdit2: TfcDemoRichEdit;
    fcDemoRichEdit3: TfcDemoRichEdit;
    fcDemoRichEdit4: TfcDemoRichEdit;
    fcDemoRichEdit5: TfcDemoRichEdit;
    fcDemoRichEdit6: TfcDemoRichEdit;
    fcDemoRichEdit7: TfcDemoRichEdit;
    fcDemoRichEdit8: TfcDemoRichEdit;
    fcButtonGroup1: TfcButtonGroup;
    Keyboardstyles: TfcImageBtn;
    datetimestyles: TfcImageBtn;
    computerinfostyle: TfcImageBtn;
    imagestyle: TfcImageBtn;
    hintsstyle: TfcImageBtn;
    RichEditstyle: TfcImageBtn;
    customcontrolstyle: TfcImageBtn;
    fcStatusBar2: TfcStatusBar;
    fcStatusBar3: TfcStatusBar;
    fcStatusBar4: TfcStatusBar;
    fcStatusBar5: TfcStatusBar;
    fcStatusBar6: TfcStatusBar;
    fcStatusBar7: TfcStatusBar;
    fcStatusBar8: TfcStatusBar;
    ProgressBar1: TProgressBar;
    SpeedButton1: TSpeedButton;
    Gauge1: TGauge;
    Panel1: TPanel;
    fcLabel1: TfcLabel;
    Close1: TMenuItem;
    procedure Item11Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure fcStatusBar3Panels3DrawText(Panel: TfcStatusPanel;
      var Text: String; var Enabled:Boolean);
    procedure fcStatusBar4Panels0DrawText(Panel: TfcStatusPanel;
      var Text: String; var Enabled:Boolean);
    procedure fcStatusBar4Panels1DrawText(Panel: TfcStatusPanel;
      var Text: String; var Enabled:Boolean);
    procedure fcStatusBar7Panels0DrawText(Panel: TfcStatusPanel;
      var Text: String; var Enabled:Boolean);
    procedure fcStatusBar7Panels1DrawText(Panel: TfcStatusPanel;
      var Text: String; var Enabled:Boolean);
    procedure fcStatusBar7Panels3DrawText(Panel: TfcStatusPanel;
      var Text: String; var Enabled:Boolean);
    procedure fcLabel1MouseEnter(Sender: TObject);
    procedure fcLabel1MouseLeave(Sender: TObject);
    procedure fcLabel1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure fcButtonGroup1Change(ButtonGroup: TfcCustomButtonGroup;
      OldSelected, Selected: TfcButtonGroupItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StatusBarDemoForm: TStatusBarDemoForm;

implementation

{$R *.DFM}

procedure TStatusBarDemoForm.Item11Click(Sender: TObject);
begin
  fcButtonGroup1.ButtonItems[(Sender as TMenuItem).Tag].Button.Down := True;
end;

procedure TStatusBarDemoForm.Timer1Timer(Sender: TObject);
begin
  ProgressBar1.StepIt;
  if Gauge1.Progress=100 then Gauge1.Progress := 0;
  Gauge1.AddProgress(10);
end;

procedure TStatusBarDemoForm.fcStatusBar3Panels3DrawText(
  Panel: TfcStatusPanel; var Text: String; var Enabled:Boolean);
begin
  Text := FormatDateTime('dddddd',Date);
end;

procedure TStatusBarDemoForm.fcStatusBar4Panels0DrawText(
  Panel: TfcStatusPanel; var Text: String; var Enabled:Boolean);
begin
   Text := 'Computer Name: '+Text;
end;

procedure TStatusBarDemoForm.fcStatusBar4Panels1DrawText(
  Panel: TfcStatusPanel; var Text: String; var Enabled:Boolean);
begin
   Text := 'User Name: '+Text;
end;

procedure TStatusBarDemoForm.fcStatusBar7Panels0DrawText(
  Panel: TfcStatusPanel; var Text: String; var Enabled:Boolean);
begin
   Text := 'Current Line is: '+IntToStr(Panel.Row+1);
end;

procedure TStatusBarDemoForm.fcStatusBar7Panels1DrawText(
  Panel: TfcStatusPanel; var Text: String; var Enabled:Boolean);
begin
   Text := 'Current Column is: '+IntToStr(Panel.Col);
end;

procedure TStatusBarDemoForm.fcStatusBar7Panels3DrawText(
  Panel: TfcStatusPanel; var Text: String; var Enabled:Boolean);
begin
  Text := '('+IntToStr(Panel.Row+1)+','+IntToStr(Panel.Col)+')';
end;

procedure TStatusBarDemoForm.fcLabel1MouseEnter(Sender: TObject);
begin
  (Sender as TfcLabel).Font.Color := clBlue;
end;

procedure TStatusBarDemoForm.fcLabel1MouseLeave(Sender: TObject);
begin
  (Sender as TfcLabel).Font.Color := clBlack;
end;

procedure TStatusBarDemoForm.fcLabel1Click(Sender: TObject);
begin
   ShellExecute(Handle, 'OPEN',
     PChar('https://www.he.net/cgi-bin/suid/~wol2wol/ordering/order.cgi'),
           nil, nil, sw_shownormal);
end;


procedure TStatusBarDemoForm.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TStatusBarDemoForm.fcButtonGroup1Change(
  ButtonGroup: TfcCustomButtonGroup; OldSelected,
  Selected: TfcButtonGroupItem);
begin
  if OldSelected.Button <> nil then
    OldSelected.Button.Font.Color := clBlack;
  Selected.Button.Font.Color := clRed;

  PageControl1.ActivePage :=
     FindComponent('TabSheet'+IntToStr(Selected.Button.Tag)) as TTabSheet;
end;

end.
