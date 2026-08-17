unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, dxfShapedForm, dxfPictureButton, StdCtrls, dxfLabel, dxfColorButton,
  dxfOutlookBar, Db, DBTables, dxfDesigner,
  dxfExplorer, Spin, dxfProgressBar, dxfGroupBox, dxfCheckBox, dxfTimer,
  dxfClock, dxfConnection, dxfQuickTyp, DBCtrls, Mask, Grids, ImgList;

type
  TMainForm = class(TForm)
    dxfShapedForm1: TdxfShapedForm;
    dxfLabel1: TdxfLabel;
    NB: TNotebook;
    OutlookBar: TdxfOutlookBar;
    OutlookGroup1: TdxfOutlookGroup;
    OutlookGroup2: TdxfOutlookGroup;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button1: TButton;
    FontDialog: TFontDialog;
    GridImageList: TImageList;
    imglstGrid: TImageList;
    SideLargeImageList: TImageList;
    SideSmallImageList: TImageList;
    BkGroundPanel: TPanel;
    DesignerPanel: TPanel;
    dxfDesigner: TdxfDesigner;
    Memo: TMemo;
    dxfLabel18: TdxfLabel;
    dxfColorButton8: TdxfColorButton;
    dxfLabel19: TdxfLabel;
    dxfLabel20: TdxfLabel;
    dxfLabel21: TdxfLabel;
    dxfLabel22: TdxfLabel;
    Exp: TdxfExpressionExplorer;
    seA: TSpinEdit;
    seB: TSpinEdit;
    seC: TSpinEdit;
    seD: TSpinEdit;
    PB1: TdxfProgressBar;
    dxfLabel28: TdxfLabel;
    PB2: TdxfProgressBar;
    dxfLabel30: TdxfLabel;
    dxfLabel31: TdxfLabel;
    PB3: TdxfProgressBar;
    PB4: TdxfProgressBar;
    PB5: TdxfProgressBar;
    dxfLabel32: TdxfLabel;
    dxfLabel33: TdxfLabel;
    dxfLabel34: TdxfLabel;
    dxfLabel35: TdxfLabel;
    PB6: TdxfProgressBar;
    PB7: TdxfProgressBar;
    dxfLabel38: TdxfLabel;
    PB8: TdxfProgressBar;
    PB9: TdxfProgressBar;
    PB10: TdxfProgressBar;
    PB11: TdxfProgressBar;
    PB12: TdxfProgressBar;
    PBTimer: TTimer;
    dxfPictureButton1: TdxfPictureButton;
    dxfPictureButton2: TdxfPictureButton;
    dxfPictureButton3: TdxfPictureButton;
    dxfPictureButton4: TdxfPictureButton;
    dxfPictureButton5: TdxfPictureButton;
    dxfPictureButton6: TdxfPictureButton;
    dxfPictureButton7: TdxfPictureButton;
    dxfPictureButton17: TdxfPictureButton;
    dxfPictureButton18: TdxfPictureButton;
    dxfPictureButton19: TdxfPictureButton;
    dxfPictureButton20: TdxfPictureButton;
    dxfPictureButton21: TdxfPictureButton;
    dxfPictureButton22: TdxfPictureButton;
    dxfPictureButton23: TdxfPictureButton;
    dxfColorButton1: TdxfColorButton;
    dxfPictureButton9: TdxfPictureButton;
    dxfPictureButton10: TdxfPictureButton;
    dxfPictureButton11: TdxfPictureButton;
    dxfPictureButton12: TdxfPictureButton;
    dxfPictureButton13: TdxfPictureButton;
    dxfPictureButton14: TdxfPictureButton;
    dxfPictureButton15: TdxfPictureButton;
    dxfPictureButton16: TdxfPictureButton;
    RotatedLabel: TdxfLabel;
    NormalLabel: TdxfLabel;
    dxfLabel3: TdxfLabel;
    dxfLabel23: TdxfLabel;
    dxfLabel2: TdxfLabel;
    dxfLabel27: TdxfLabel;
    dxfLabel5: TdxfLabel;
    dxfLabel8: TdxfLabel;
    dxfLabel6: TdxfLabel;
    dxfLabel7: TdxfLabel;
    dxfLabel24: TdxfLabel;
    dxfColorButton9: TdxfColorButton;
    dxfColorButton11: TdxfColorButton;
    dxfColorButton2: TdxfColorButton;
    dxfColorButton3: TdxfColorButton;
    dxfColorButton4: TdxfColorButton;
    dxfColorButton5: TdxfColorButton;
    dxfColorButton6: TdxfColorButton;
    dxfColorButton7: TdxfColorButton;
    dxfColorButton10: TdxfColorButton;
    dxfColorButton12: TdxfColorButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    dxfGroupBox1: TdxfGroupBox;
    Label21: TLabel;
    dxfGroupBox2: TdxfGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    dxfCheckBox1: TdxfCheckBox;
    dxfCheckBox2: TdxfCheckBox;
    dxfCheckBox3: TdxfCheckBox;
    dxfCheckBox4: TdxfCheckBox;
    dxfCheckBox5: TdxfCheckBox;
    dxfCheckBox6: TdxfCheckBox;
    dxfCheckBox7: TdxfCheckBox;
    dxfCheckBox8: TdxfCheckBox;
    dxfCheckBox9: TdxfCheckBox;
    dxfCheckBox10: TdxfCheckBox;
    dxfCheckBox11: TdxfCheckBox;
    dxfCheckBox12: TdxfCheckBox;
    dxfCheckBox13: TdxfCheckBox;
    dxfCheckBox14: TdxfCheckBox;
    Label24: TLabel;
    dxfCheckBox15: TdxfCheckBox;
    dxfCheckBox16: TdxfCheckBox;
    dxfCheckBox17: TdxfCheckBox;
    Label25: TLabel;
    dxfCheckBox18: TdxfCheckBox;
    dxfClock1: TdxfClock;
    Label26: TLabel;
    dxfClock2: TdxfClock;
    Label27: TLabel;
    Label28: TLabel;
    dxfClock3: TdxfClock;
    dxfClock4: TdxfClock;
    Label29: TLabel;
    Label30: TLabel;
    dxfClock5: TdxfClock;
    dxfTimer1: TdxfTimer;
    dxfColorButton13: TdxfColorButton;
    dxfColorButton14: TdxfColorButton;
    dxfColorButton15: TdxfColorButton;
    Label31: TLabel;
    dxfTimer2: TdxfTimer;
    dxfTimer3: TdxfTimer;
    dxfTimer4: TdxfTimer;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    dxfConnector1: TdxfConnector;
    dxfConnector2: TdxfConnector;
    dxfConnector3: TdxfConnector;
    Label36: TLabel;
    Panel4: TPanel;
    dxfQuickTyper: TdxfQuickTyper;
    DBCheckBox1: TDBCheckBox;
    CheckBox1: TCheckBox;
    DBEdit1: TDBEdit;
    Edit2: TEdit;
    Edit1: TEdit;
    dxfDBQuickTyper1: TdxfDBQuickTyper;
    DrawGrid1: TDrawGrid;
    procedure dxfLabel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dxfPictureButton7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ExpConvertWord(Sender: TObject; var CurrentWord: String);
    procedure ExpFunctionPerforming(Sender: TObject; FunctionName: String;
      var Parameter: Double);
    procedure dxfColorButton8Click(Sender: TObject);
    procedure PBTimerTimer(Sender: TObject);
    procedure dxfColorButton1Click(Sender: TObject);
    procedure dxfColorButton13Click(Sender: TObject);
    procedure dxfColorButton14Click(Sender: TObject);
    procedure dxfColorButton15Click(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dxfTimer1EndOfTime(Sender: TdxfTimer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  d : integer;
implementation

uses BkGraund, Design;

{$R *.DFM}

procedure TMainForm.dxfLabel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  SC_DragMove = $F012;
begin
  ReleaseCapture;
  Perform(WM_SysCommand, SC_DragMove, 0);
end;

procedure TMainForm.dxfPictureButton7Click(Sender: TObject);
begin
  PBTimer.Enabled := False;
  if TdxfPictureButton(Sender).Tag < NB.Pages.Count then
    NB.PageIndex := TdxfPictureButton(Sender).Tag;
  if TdxfPictureButton(Sender).Tag = 4 then BkGroundForm.Show;
  if TdxfPictureButton(Sender).Tag = 5 then begin
    DesignerForm.Show;
    dxfDesigner.Active := DesignerForm.CheckBox1.Checked;
  end else dxfDesigner.Active := False;
  if TdxfPictureButton(Sender).Tag = 7 then PBTimer.Enabled := True;

end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  NB.PageIndex := 0;
  dxfDesigner.IniFile := ExtractFilePath(Application.ExeName)+'Position.ini';
end;

procedure TMainForm.RadioButton2Click(Sender: TObject);
begin
  OutlookBar.Orientation := orVert;
end;

procedure TMainForm.RadioButton1Click(Sender: TObject);
begin
   OutlookBar.Orientation := orHorz;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  FontDialog.Font := OutlookBar.Font;
  if FontDialog.Execute then OutlookBar.Font := FontDialog.Font;
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
  DesignerForm.Show;
end;

procedure TMainForm.ExpConvertWord(Sender: TObject;
  var CurrentWord: String);
begin
  if CurrentWord = 'A' then CurrentWord := seA.Text;
  if CurrentWord = 'B' then CurrentWord := seB.Text;
  if CurrentWord = 'C' then CurrentWord := seC.Text;
  if CurrentWord = 'D' then CurrentWord := seD.Text;
end;

procedure TMainForm.ExpFunctionPerforming(Sender: TObject;
  FunctionName: String; var Parameter: Double);
begin
  if FunctionName = 'ROUND' then Parameter := Round(Parameter);
end;

procedure TMainForm.dxfColorButton8Click(Sender: TObject);
begin
    Exp.Expressions.Text := Memo.Lines.Text;
    try
      Exp.Execute;
      MessageDlg('Result = '+ FloatToStr(Exp.Value), mtInformation, [mbOK], 0);
    except
      MessageDlg('Error', mtInformation, [mbOK], 0);
    end;
end;

procedure TMainForm.PBTimerTimer(Sender: TObject);
begin
  with PB1 do begin
    if Position = 0   then d := 1;
    if Position = 100 then d := -1;
  end;
  PB1.StepBy(d);
  PB2.StepBy(d);
  PB3.StepBy(d);
  PB4.StepBy(d);
  PB5.StepBy(d);
  PB6.StepBy(d);
  PB7.StepBy(d);
  PB8.StepBy(d);
  PB9.StepBy(d);
  PB10.StepBy(d);
  PB11.StepBy(d);
  PB12.StepBy(d);
end;

procedure TMainForm.dxfColorButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.dxfColorButton13Click(Sender: TObject);
begin
  dxfTimer1.Start;
  dxfTimer2.Start;
  dxfTimer3.Start;
  dxfTimer4.Start;
end;

procedure TMainForm.dxfColorButton14Click(Sender: TObject);
begin
  dxfTimer1.Stop;
  dxfTimer2.Stop;
  dxfTimer3.Stop;
  dxfTimer4.Stop;
end;

procedure TMainForm.dxfColorButton15Click(Sender: TObject);
begin
  dxfTimer1.Reset;
  dxfTimer2.Reset;
  dxfTimer3.Reset;
  dxfTimer4.Reset;
end;

procedure TMainForm.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  SC_DragMove = $F012;
begin
  ReleaseCapture;
  TPanel(Sender).Perform(WM_SysCommand, SC_DragMove, 0);
end;

procedure TMainForm.dxfTimer1EndOfTime(Sender: TdxfTimer);
begin
   ShowMessage('End of Time');
end;

end.
