unit ImgButtonDemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, fcLabel, ComCtrls, StdCtrls, DBCtrls, Db, DBTables, fcButton,
  fcImgBtn, fcShapeBtn, fcText, fcCombo, fcColorCombo, fcTreeCombo,
  fcButtonGroup, Buttons, fcClearPanel, fcCommon, fcDemoRichEdit;

type
  TImageBtnDemoForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    ImageList1: TImageList;
    TabSheet4: TTabSheet;
    Panel3: TPanel;
    ButtonTab: TfcButtonGroup;
    ButtonTabfcImageBtn1: TfcImageBtn;
    ButtonTabfcImageBtn2: TfcImageBtn;
    ButtonTabfcImageBtn3: TfcImageBtn;
    ButtonTabfcImageBtn4: TfcImageBtn;
    ButtonTabfcImageBtn5: TfcImageBtn;
    TabSheet5: TTabSheet;
    Panel4: TPanel;
    Panel5: TPanel;
    fcDemoRichEdit3: TfcDemoRichEdit;
    Panel1: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel7: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    StyleLabel1: TLabel;
    StyleLabel2: TLabel;
    StyleLabel3: TLabel;
    StyleLabel4: TLabel;
    CompBtnFlat: TfcImageBtn;
    CompBtnHighlight: TfcImageBtn;
    CompBtnNormal: TfcImageBtn;
    CompBtnRaised: TfcImageBtn;
    Roundflat: TfcImageBtn;
    RoundHighlight: TfcImageBtn;
    RoundNormal: TfcImageBtn;
    RoundRaised: TfcImageBtn;
    KnightHighlight: TfcImageBtn;
    KnightNormal: TfcImageBtn;
    KnightRaised: TfcImageBtn;
    KnightFlat: TfcImageBtn;
    StarFlat: TfcImageBtn;
    StarHighlight: TfcImageBtn;
    StarNormal: TfcImageBtn;
    StarRaised: TfcImageBtn;
    Label5: TLabel;
    ComputerImage: TfcImageBtn;
    fcDemoRichEdit2: TfcDemoRichEdit;
    Bevel1: TBevel;
    LightSwitch: TImage;
    LEDLabel: TfcLabel;
    switchlabel: TfcLabel;
    fcLabel4: TfcLabel;
    tacklabel2: TfcLabel;
    Bevel2: TBevel;
    CountryLabel: TfcLabel;
    Checkboxlabel: TfcLabel;
    Panel2: TPanel;
    NorthAmerica: TfcImageBtn;
    Europe: TfcImageBtn;
    Asia: TfcImageBtn;
    Africa: TfcImageBtn;
    Australia: TfcImageBtn;
    SouthAmerica: TfcImageBtn;
    LightSwitch1: TfcImageBtn;
    led4: TfcImageBtn;
    TackButton: TfcImageBtn;
    Checkboxbtn: TfcImageBtn;
//    fcDemoRichEdit1: TfcDemoRichEdit;
    fcDemoRichEdit5: TfcDemoRichEdit;
    TackLabel: TfcLabel;
    fcLabel9: TfcLabel;
    fcLabel10: TfcLabel;
    fcLabel11: TfcLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    SwitchTitleLabel: TfcLabel;
    InfoLabel: TfcLabel;
    LightButton3: TfcImageBtn;
    LightButton2: TfcImageBtn;
    lightbutton1: TfcImageBtn;
    Switch1: TfcImageBtn;
    Switch2: TfcImageBtn;
    LEDButton: TfcImageBtn;
    CoolCheckbox: TfcImageBtn;
    ThumbTack: TfcImageBtn;
    Switch3: TfcImageBtn;
    PushPin: TfcImageBtn;
    SwitchBox: TfcImageBtn;
    HandleButton: TfcImageBtn;
    GroupBox1: TGroupBox;
    RadioGroupLabel: TfcLabel;
    RadioButtonGroup1: TfcButtonGroup;
    fcDemoRichEdit4: TfcDemoRichEdit;
    fcLabel1: TfcLabel;
    fcLabel2: TfcLabel;
    fcLabel3: TfcLabel;
    fcLabel5: TfcLabel;
    fcLabel6: TfcLabel;
    Bevel3: TBevel;
    GroupBox2: TGroupBox;
    Butterfly1: TfcImageBtn;
    Butterfly2: TfcImageBtn;
    Butterfly3: TfcImageBtn;
    DitherLabel3: TLabel;
    DitherLabel2: TLabel;
    DitherLabel1: TLabel;
    fcLabel12: TfcLabel;
    fcColorCombo2: TfcColorCombo;
    Panel13: TPanel;
    puz1: TfcImageBtn;
    puz3: TfcImageBtn;
    puz4: TfcImageBtn;
    puz2: TfcImageBtn;
    puz5: TfcImageBtn;
    fcColorCombo1: TfcColorCombo;
    fcImageCombo1: TfcTreeCombo;
    fcLabel7: TfcLabel;
    fcLabel8: TfcLabel;
    Bevel4: TBevel;
    Label1: TLabel;
    fcLabel13: TfcLabel;
    fcImageBtn1: TfcImageBtn;
    fcColorCombo3: TfcColorCombo;
    Shape1: TShape;
    fcImageBtn2: TfcImageBtn;
    TfcDemoRichEdit1: TfcDemoRichEdit;
    procedure LightSwitch1Click(Sender: TObject);
    procedure TackButtonClick(Sender: TObject);
    procedure NorthAmericaClick(Sender: TObject);
    procedure fcColorCombo1Change(Sender: TObject);
    procedure fcImageCombo1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageButton2SelChange(Sender: TObject);
    procedure ThumbTackClick(Sender: TObject);
    procedure HandleButtonClick(Sender: TObject);
    procedure Switch1Click(Sender: TObject);
    procedure ButtonTabChange(ButtonGroup: TfcCustomButtonGroup;
      OldSelected, Selected: TfcButtonGroupItem);
    procedure lightbutton1Click(Sender: TObject);
    procedure fcColorCombo2Change(Sender: TObject);
    procedure fcColorCombo3Change(Sender: TObject);
    procedure led4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ImageBtnDemoForm: TImageBtnDemoForm;

implementation

{$R *.DFM}

procedure TImageBtnDemoForm.LightSwitch1Click(Sender: TObject);
begin
   led4.Down := (Sender as TfcImageBtn).Down;
end;

procedure TImageBtnDemoForm.TackButtonClick(Sender: TObject);
begin
   if (Sender as TfcImageBtn).Down then
     TackLabel2.Caption := 'Tack'+#13#10+'(In)'
   else TackLabel2.Caption := 'Tack'+#13#10+'(Out)';
end;

procedure TImageBtnDemoForm.NorthAmericaClick(Sender: TObject);
begin
  case (Sender as TfcImageBtn).Tag of
  1: CountryLabel.Caption := 'North America';
  2: CountryLabel.Caption := 'South America';
  3: CountryLabel.Caption := 'Europe';
  4: CountryLabel.Caption := 'Africa';
  5: CountryLabel.Caption := 'Asia';
  6: CountryLabel.Caption := 'Australia';
  end;
end;

procedure TImageBtnDemoForm.fcColorCombo1Change(Sender: TObject);
begin
   puz1.DitherColor := (Sender as TfcColorCombo).SelectedColor;
   puz2.DitherColor := (Sender as TfcColorCombo).SelectedColor;
   puz3.DitherColor := (Sender as TfcColorCombo).SelectedColor;
   puz4.DitherColor := (Sender as TfcColorCombo).SelectedColor;
   puz5.DitherColor := (Sender as TfcColorCombo).SelectedColor;
end;

procedure TImageBtnDemoForm.fcImageCombo1Change(Sender: TObject);
begin
   case fcImageCombo1.treeview.Selected.index of
   0: begin
        puz1.DitherStyle := dsFill;
        puz2.DitherStyle := dsFill;
        puz3.DitherStyle := dsFill;
        puz4.DitherStyle := dsFill;
        puz5.DitherStyle := dsFill;
      end;
   1: begin
        puz1.DitherStyle := dsDither;
        puz2.DitherStyle := dsDither;
        puz3.DitherStyle := dsDither;
        puz4.DitherStyle := dsDither;
        puz5.DitherStyle := dsDither;
      end;
   2: begin
        puz1.DitherStyle := dsBlendDither;
        puz2.DitherStyle := dsBlendDither;
        puz3.DitherStyle := dsBlendDither;
        puz4.DitherStyle := dsBlendDither;
        puz5.DitherStyle := dsBlendDither;
      end;
   end;
end;

procedure TImageBtnDemoForm.FormShow(Sender: TObject);
begin
   fcImageCombo1.Text := 'DitherBlend';
end;

procedure TImageBtnDemoForm.PageButton2SelChange(Sender: TObject);
begin
  if not (Sender as TfcImageBtn).Down then
    (Sender as TfcImageBtn).Font.Color := clWhite;
end;


procedure TImageBtnDemoForm.ThumbTackClick(Sender: TObject);
begin
   if (Sender as TfcImageBtn).Down then
     TackLabel.Caption := 'Tack'+#13#10+'(In)'
   else TackLabel.Caption := 'Tack'+#13#10+'(Out)';
end;

procedure TImageBtnDemoForm.HandleButtonClick(Sender: TObject);
begin
   SwitchBox.Down := (Sender as TfcImageBtn).Down;
end;

procedure TImageBtnDemoForm.Switch1Click(Sender: TObject);
begin
   case (Sender as TfcImageBtn).Tag of
   1: LightButton1.Down := (Sender as TFcImageBtn).Down;
   2: LightButton2.Down := (Sender as TFcImageBtn).Down;
   3: LightButton3.Down := (Sender as TFcImageBtn).Down;
   end;
end;

procedure TImageBtnDemoForm.ButtonTabChange(
  ButtonGroup: TfcCustomButtonGroup; OldSelected,
  Selected: TfcButtonGroupItem);
begin
  if OldSelected.Button <> nil then OldSelected.Button.Font.Color := clWhite;
  Selected.Button.Font.Color := clYellow;
  case Selected.Button.Tag of
   1: PageControl1.ActivePage := TabSheet1;
   2: PageControl1.ActivePage := TabSheet2;
   3: PageControl1.ActivePage := TabSheet3;
   4: PageControl1.ActivePage := TabSheet4;
   5: PageControl1.ActivePage := TabSheet5;
  end;
end;

procedure TImageBtnDemoForm.lightbutton1Click(Sender: TObject);
begin
   case (Sender as TfcImageBtn).Tag of
   1: Switch1.Down := (Sender as TFcImageBtn).Down;
   2: Switch2.Down := (Sender as TFcImageBtn).Down;
   3: Switch3.Down := (Sender as TFcImageBtn).Down;
   end;
end;

procedure TImageBtnDemoForm.fcColorCombo2Change(Sender: TObject);
begin
  Butterfly1.DitherColor := (Sender as TfcColorCombo).SelectedColor;
  Butterfly2.DitherColor := (Sender as TfcColorCombo).SelectedColor;
  Butterfly3.DitherColor := (Sender as TfcColorCombo).SelectedColor;
end;


procedure TImageBtnDemoForm.fcColorCombo3Change(Sender: TObject);
begin
//  Shape1.Brush.Color := (Sender as TfcColorCombo).SelectedColor;
  fcImageBtn1.Color := (Sender as TfcColorCombo).SelectedColor;
  fcImageBtn2.Color := (Sender as TfcColorCombo).SelectedColor;
end;

procedure TImageBtnDemoForm.led4Click(Sender: TObject);
begin
   LightSwitch1.Down := (Sender as TfcImageBtn).Down;
end;

end.
