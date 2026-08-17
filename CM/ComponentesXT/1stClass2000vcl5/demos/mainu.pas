unit mainu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, fcImageForm, fcbutton,
  ComCtrls, Buttons, fcmsg, fcShapeBtn, fcImgBtn, fcImage, fcClearPanel,
  fcButtonGroup, fcStatusBar, fcOutlookList, fcOutlookBar, fcFontCombo,
  fcCombo, fcTreeCombo, fcLabel, fcdbtreeview, Db, DBTables, fcColorCombo,
  DBCtrls, ShellApi, fcDemoRichEdit;

type
  TMainForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet4: TTabSheet;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DemoButtonImageBtn: TfcShapeBtn;
    GroupBox1: TGroupBox;
    DemoButtonShapeBtn1: TfcShapeBtn;
    DemoButtonLabel: TfcShapeBtn;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox5: TGroupBox;
    DemoButtonDBTreeView: TfcShapeBtn;
    GroupBox6: TGroupBox;
    DemoButtonTreeView: TfcShapeBtn;
    TabSheet3: TTabSheet;
    TabSheet5: TTabSheet;
    DemoButtonButtonGroup: TfcShapeBtn;
    DemoButtonImageForm: TfcShapeBtn;
    DemoButtonOutlookBar: TfcShapeBtn;
    TabSheet6: TTabSheet;
    GroupBox4: TGroupBox;
    DemoButtonColor: TfcShapeBtn;
    GroupBox7: TGroupBox;
    DemoButtonTreeCombo: TfcShapeBtn;
    TabSheet7: TTabSheet;
    DemoButtonStatusBar: TfcShapeBtn;
    TabSheet8: TTabSheet;
    DemoButtonTiler: TfcShapeBtn;
    fcShapeBtn1: TfcShapeBtn;
    fcImageForm1: TfcImageForm;
    fcButtonGroup1: TfcButtonGroup;
    TitleLabel: TfcLabel;
    fcShapeBtn3: TfcShapeBtn;
    fcLabel2: TfcLabel;
    Shape1: TShape;
    fcImageBtn1: TfcImageBtn;
    fcShapeBtn2: TfcShapeBtn;
    fcShapeBtn4: TfcShapeBtn;
    fcShapeBtn5: TfcShapeBtn;
    fcShapeBtn6: TfcShapeBtn;
    fcShapeBtn7: TfcShapeBtn;
    fcShapeBtn8: TfcShapeBtn;
    fcOutlookBar1: TfcOutlookBar;
    RichEditPage1: TfcShapeBtn;
    RichEditPage2: TfcShapeBtn;
    RichEditPage3: TfcShapeBtn;
    RichEditPage4: TfcShapeBtn;
    RichEditPage5: TfcShapeBtn;
    RichEditPage6: TfcShapeBtn;
    RichEditPage7: TfcShapeBtn;
    RichEditPage8: TfcShapeBtn;
    fcDemoRichEdit1: TfcDemoRichEdit;
    fcDemoRichEdit2: TfcDemoRichEdit;
    fcDemoRichEdit3: TfcDemoRichEdit;
    fcDemoRichEdit4: TfcDemoRichEdit;
    fcDemoRichEdit5: TfcDemoRichEdit;
    fcDemoRichEdit6: TfcDemoRichEdit;
    fcDemoRichEdit7: TfcDemoRichEdit;
    fcDemoRichEdit8: TfcDemoRichEdit;
    fcImageBtn2: TfcImageBtn;
    procedure fcShapeBtn3Click(Sender: TObject);
    procedure fcShapeBtn2Click(Sender: TObject);
    procedure DemoButtonTilerClick(Sender: TObject);
    procedure DemoButtonStatusBarClick(Sender: TObject);
    procedure fcButtonGroup2Change(ButtonGroup: TfcCustomButtonGroup;
      OldSelected, Selected: TfcButtonGroupItem);
    procedure DemoButtonLabelClick(Sender: TObject);
    procedure DemoButtonShapeBtn1Click(Sender: TObject);
    procedure DemoButtonImageBtnClick(Sender: TObject);
    procedure DemoButtonOutlookBarClick(Sender: TObject);
    procedure DemoButtonButtonGroupClick(Sender: TObject);
    procedure DemoButtonTreeComboClick(Sender: TObject);
    procedure fcShapeBtn1Click(Sender: TObject);
    procedure fcButtonGroup1Change(ButtonGroup: TfcCustomButtonGroup;
      OldSelected, Selected: TfcButtonGroupItem);
    procedure DemoButtonImageFormClick(Sender: TObject);
    procedure fcShapeBtn4Click(Sender: TObject);
    procedure DemoButtonDBTreeViewClick(Sender: TObject);
    procedure DemoButtonTreeViewClick(Sender: TObject);
    procedure DemoButtonColorClick(Sender: TObject);
    procedure fcShapeBtn5Click(Sender: TObject);
    procedure fcShapeBtn6Click(Sender: TObject);
    procedure fcShapeBtn7Click(Sender: TObject);
    procedure fcShapeBtn8Click(Sender: TObject);
    procedure fcImageBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure ExecuteDemo(AFormClass:TFormClass);
  end;

var
  MainForm: TMainForm;

implementation

uses StatusBars, labelu, Shapeu, ImgButtonDemo, PaintUnit,
  ImgCombos, mapu, orderformu, tabbuttons, imagetabformu,
  DBTreeSample1, TreeDemo, colordemou, TilerUnit, buttongroupdemo,
  ImagerMain, proportional, OutlookBarUnit, Frameu;


{$R *.DFM}

procedure TMainForm.ExecuteDemo(AFormClass: TFormClass);
begin
   Screen.cursor:= crHourGlass;
   with AFormClass.create(Application) do begin
      Screen.cursor:= crDefault;
      ShowModal;
      Free;
   end
end;

procedure TMainForm.fcShapeBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.fcButtonGroup2Change(ButtonGroup: TfcCustomButtonGroup;
  OldSelected, Selected: TfcButtonGroupItem);
begin
  PageControl1.ActivePage :=
     FindComponent('TabSheet'+IntToStr(Selected.Button.Tag)) as TTabSheet;
end;

procedure TMainForm.fcButtonGroup1Change(ButtonGroup: TfcCustomButtonGroup;
  OldSelected, Selected: TfcButtonGroupItem);
begin
  {Color Active Button's Font and reset old font}
  if OldSelected <> Nil then
     OldSelected.Button.Font.Color := clWhite;
  Selected.Button.Font.Color := clYellow;

  PageControl1.ActivePage :=
     (FindComponent('TabSheet'+IntToStr(Selected.Button.Tag)) as TTabSheet);

  fcOutlookBar1.ActivePage := 
     (FindComponent('RichEditPage'+IntToStr(Selected.Button.Tag)) as TfcCustomBitBtn);

  TitleLabel.Caption := Selected.Button.Caption;
end;

procedure TMainForm.fcShapeBtn2Click(Sender: TObject);
begin
   ExecuteDemo(TTabBtnGroupForm);
end;

procedure TMainForm.DemoButtonTilerClick(Sender: TObject);
begin
   ExecuteDemo(TTilerForm);
end;

procedure TMainForm.DemoButtonStatusBarClick(Sender: TObject);
begin
   ExecuteDemo(TStatusBarDemoForm);
end;

procedure TMainForm.DemoButtonLabelClick(Sender: TObject);
begin
   ExecuteDemo(TLabelForm);
end;

procedure TMainForm.DemoButtonShapeBtn1Click(Sender: TObject);
begin
   ExecuteDemo(TShapeBtnDemoForm);
end;

procedure TMainForm.DemoButtonImageBtnClick(Sender: TObject);
begin
   ExecuteDemo(TImageBtnDemoForm);
end;

procedure TMainForm.DemoButtonOutlookBarClick(Sender: TObject);
begin
   ExecuteDemo(TPaintForm);
end;

procedure TMainForm.DemoButtonButtonGroupClick(Sender: TObject);
begin
   if FileExists(PChar(ExtractFileDir(Application.ExeName) + '\ButtonGroup\Demo1stClassMDI.exe')) then
      ShellExecute(Handle, 'OPEN', PChar(ExtractFileDir(Application.ExeName) + '\ButtonGroup\Demo1stClassMDI.exe'), nil, nil, sw_shownormal)
   else
      ShellExecute(Handle, 'OPEN', PChar(ExtractFileDir(Application.ExeName) + '\Demo1stClassMDI.exe'), nil, nil, sw_shownormal);
end;

procedure TMainForm.DemoButtonTreeComboClick(Sender: TObject);
begin
   ExecuteDemo(TTreeComboDemoForm);
end;

procedure TMainForm.fcShapeBtn1Click(Sender: TObject);
begin
   ExecuteDemo(TMapForm);
end;

procedure TMainForm.DemoButtonImageFormClick(Sender: TObject);
begin
   ExecuteDemo(TOrderForm);
end;

procedure TMainForm.fcShapeBtn4Click(Sender: TObject);
begin
   ExecuteDemo(TImageTabForm);
end;

procedure TMainForm.DemoButtonDBTreeViewClick(Sender: TObject);
begin
   ExecuteDemo(TDMTreeViewForm);
end;

procedure TMainForm.DemoButtonTreeViewClick(Sender: TObject);
begin
   ExecuteDemo(TTreeViewDemoForm);
end;

procedure TMainForm.DemoButtonColorClick(Sender: TObject);
begin
   ExecuteDemo(TColorDemoForm);
end;

procedure TMainForm.fcShapeBtn5Click(Sender: TObject);
begin
   ExecuteDemo(TButtonGroupDemo2);
end;

procedure TMainForm.fcShapeBtn6Click(Sender: TObject);
begin
   ExecuteDemo(TImagerForm);
end;

procedure TMainForm.fcShapeBtn7Click(Sender: TObject);
begin
   ExecuteDemo(TProportionalDemo);
end;

procedure TMainForm.fcShapeBtn8Click(Sender: TObject);
begin
   ExecuteDemo(TOutlookBarForm);
end;

procedure TMainForm.fcImageBtn2Click(Sender: TObject);
begin
   ExecuteDemo(TFrameDemo);
end;

end.
 