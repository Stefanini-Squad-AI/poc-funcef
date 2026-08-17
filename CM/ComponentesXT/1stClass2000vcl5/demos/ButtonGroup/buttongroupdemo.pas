unit buttongroupdemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcImager, ExtCtrls, fcClearPanel, fcButtonGroup, fcImgBtn, StdCtrls,
  fcCombo, fcColorCombo, fcLabel, ComCtrls, fcTreeCombo, fccommon,
  fcButton, fcShapeBtn, TypInfo, fcDemoRichEdit, ImgList;

type
  TButtonGroupDemo2 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    fcLabel1: TfcLabel;
    fcLabel2: TfcLabel;
    fcLabel3: TfcLabel;
    DownColorCombo: TfcColorCombo;
    HotTrackColorCombo: TfcColorCombo;
    FontColorCombo: TfcColorCombo;
    TabSheet2: TTabSheet;
    fcLabel4: TfcLabel;
    ImageList1: TImageList;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    RichEdit6: TRichEdit;
    GroupBox2: TGroupBox;
    ShapeCombo: TfcTreeCombo;
    fcLabel5: TfcLabel;
    GroupBox4: TGroupBox;
    ShapeBtnGroup1: TfcButtonGroup;
    OrientationCombo: TfcTreeCombo;
    fcLabel10: TfcLabel;
    HotTrackBtnGroup: TfcButtonGroup;
    fcImager1: TfcImager;
    RadioGroup1: TRadioGroup;
    OvalSlantBtnGroup2: TfcButtonGroup;
    DiamondBtnGroup: TfcButtonGroup;
    fcImager2: TfcImager;
    CheckBox1: TCheckBox;
    OvalImageBtnGroup: TfcButtonGroup;
    CheckBoxEditBtnGroup: TfcButtonGroup;
    MultiColumnBtnGroup: TfcButtonGroup;
    fcLabel12: TfcLabel;
    Panel1: TPanel;
    HorizontalShapeBtnGroup: TfcButtonGroup;
    Choice1: TfcShapeBtn;
    Choice2: TfcShapeBtn;
    Choice3: TfcShapeBtn;
    Choice4: TfcShapeBtn;
    fcLabel9: TfcLabel;
    Panel2: TPanel;
    fcLabel11: TfcLabel;
    VerticalShapeBtnGroup2: TfcButtonGroup;
    Bevel1: TBevel;
    CheckBox2: TCheckBox;
    RadioGroup2: TRadioGroup;
    Bevel2: TBevel;
    UpColorCombo: TfcColorCombo;
    fcLabel16: TfcLabel;
    fcLabel17: TfcLabel;
    HorizontalImageBtnGroup: TfcButtonGroup;
    Shape1: TShape;
    SlantOval1: TfcImageBtn;
    SlantOval2: TfcImageBtn;
    SlantOval3: TfcImageBtn;
    SlantOval4: TfcImageBtn;
    SlantOval5: TfcImageBtn;
    SlantOval6: TfcImageBtn;
    Right: TfcImageBtn;
    Up: TfcImageBtn;
    Left: TfcImageBtn;
    Down: TfcImageBtn;
    Diamond: TfcImageBtn;
    Diamond2: TfcImageBtn;
    Diamond3: TfcImageBtn;
    Diamond4: TfcImageBtn;
    OvalGold: TfcImageBtn;
    OvalGold2: TfcImageBtn;
    OvalGold3: TfcImageBtn;
    RoundRectShape1: TfcShapeBtn;
    RoundRectShape2: TfcShapeBtn;
    RoundRectShape3: TfcShapeBtn;
    Bar4: TfcImageBtn;
    Bar3: TfcImageBtn;
    Bar2: TfcImageBtn;
    Bar1: TfcImageBtn;
    MultiColumnBtnGroupfcShapeBtn1: TfcShapeBtn;
    MultiColumnBtnGroupfcShapeBtn2: TfcShapeBtn;
    MultiColumnBtnGroupfcShapeBtn3: TfcShapeBtn;
    MultiColumnBtnGroupfcShapeBtn4: TfcShapeBtn;
    MultiColumnBtnGroupfcShapeBtn5: TfcShapeBtn;
    MultiColumnBtnGroupfcShapeBtn6: TfcShapeBtn;
    MultiColumnBtnGroupfcShapeBtn7: TfcShapeBtn;
    MultiColumnBtnGroupfcShapeBtn8: TfcShapeBtn;
    MultiColumnBtnGroupfcShapeBtn9: TfcShapeBtn;
    ShapeBtnGroup1fcShapeBtn1: TfcShapeBtn;
    ShapeBtnGroup1fcShapeBtn2: TfcShapeBtn;
    ShapeBtnGroup1fcShapeBtn3: TfcShapeBtn;
    ShapeBtnGroup1fcShapeBtn4: TfcShapeBtn;
    ShapeBtnGroup1fcShapeBtn5: TfcShapeBtn;
    CheckboxButtonEdt: TfcImageBtn;
    CheckBoxBtnEdit2: TfcImageBtn;
    CheckBoxBtnEdit3: TfcImageBtn;
    fcDemoRichEdit1: TfcDemoRichEdit;
    fcDemoRichEdit2: TfcDemoRichEdit;
    fcDemoRichEdit3: TfcDemoRichEdit;
    fcDemoRichEdit4: TfcDemoRichEdit;
    fcDemoRichEdit5: TfcDemoRichEdit;
    fcImager3: TfcImager;
    procedure HotTrackBtnGroupChange(ButtonGroup: TfcCustomButtonGroup;
      OldSelected, Selected: TfcButtonGroupItem);
    procedure DownColorComboChange(Sender: TObject);
    procedure FontColorComboChange(Sender: TObject);
    procedure ShapeComboChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OrientationComboChange(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure fcButtonGroup3Item1MouseEnter(Sender: TObject);
    procedure fcButtonGroup3Item1MouseLeave(Sender: TObject);
    procedure OvalSlantBtnGroup2Change(ButtonGroup: TfcCustomButtonGroup;
      OldSelected, Selected: TfcButtonGroupItem);
    procedure CheckBox2Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure UpColorComboChange(Sender: TObject);
    procedure DownDitherColorComboChange(Sender: TObject);
    procedure HorizontalImageBtnGroupChange(ButtonGroup: TfcCustomButtonGroup;
      OldSelected, Selected: TfcButtonGroupItem);
    procedure SlantOval1MouseEnter(Sender: TObject);
    procedure SlantOval1MouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ButtonGroupDemo2: TButtonGroupDemo2;

implementation

{$R *.DFM}

procedure TButtonGroupDemo2.HotTrackBtnGroupChange(
  ButtonGroup: TfcCustomButtonGroup; OldSelected,
  Selected: TfcButtonGroupItem);
begin
  //Restore Old Selected Color
  if (OldSelected <> nil) and (OldSelected.Button <> nil) then
     OldSelected.Button.Color := UpColorCombo.SelectedColor;

  //Set New Down Color
  if DownColorCombo.SelectedColor <> clNullColor then
     Selected.Button.Color := DownColorCombo.SelectedColor;
end;

procedure TButtonGroupDemo2.DownColorComboChange(Sender: TObject);
begin
  if (HotTrackBtnGroup.Selected <> nil) then
     HotTrackBtnGroup.Selected.Button.Color :=
        (Sender as TfcColorCombo).SelectedColor;
end;

procedure TButtonGroupDemo2.FontColorComboChange(Sender: TObject);
var i:integer;
begin
  for i:= 0 to HotTrackBtnGroup.ButtonItems.Count-1 do
     HotTrackBtnGroup.ButtonItems[i].Button.Font.Color :=
        (Sender as TfcColorCombo).SelectedColor;
end;

procedure TButtonGroupDemo2.ShapeComboChange(Sender: TObject);
var i:integer;
begin
  for i:= 0 to ShapeBtnGroup1.ButtonItems.Count-1 do
    with (Sender as TfcTreeCombo).TreeView.Selected,
         ShapeBtnGroup1.ButtonItems[i].Button as TfcShapeBtn do
    case index of
       0:Shape := bsArrow;
       1:Shape := bsDiamond;
       2:Shape := bsEllipse;
       3:Shape := bsRect;
       4:Shape := bsRoundRect;
       5:Shape := bsStar;
       6:Shape := bsTriangle;
    end;

  with (Sender as TfcTreeCombo).TreeView.Selected do
    OrientationCombo.enabled:= (index=0) or (index=5) or (index=6);
end;

procedure TButtonGroupDemo2.FormShow(Sender: TObject);
begin
   ShapeCombo.Text := 'RoundRect';
   OrientationCombo.Text := 'Right';

   if ((GetDeviceCaps(Canvas.Handle, BITSPIXEL) *
        GetDeviceCaps(Canvas.Handle, PLANES)) <= 8) then begin
     fcImager1.Visible := False;
     fcImager2.Visible := False;
   end;
   PageControl1.ActivePage := TabSheet1;
end;

procedure TButtonGroupDemo2.OrientationComboChange(Sender: TObject);
var i:integer;
    orientation: TfcShapeOrientation;
begin
  with (Sender as TfcTreecombo).TreeView do begin
     if (Selected=nil) then exit;

     for i:= 0 to ShapeBtnGroup1.ButtonItems.Count-1 do
     begin
        orientation:=  TfcShapeOrientation(
              GetEnumValue(TypeInfo(TfcShapeOrientation), Selected.StringData));
        TfcShapeBtn(ShapeBtnGroup1.ButtonItems[i].Button).Orientation := orientation;
     end;
  end;

{  with (Sender as TfcTreeCombo).TreeView.Selected,
       fcButtonGroup2.Items[i].Button as TfcShapeBtn do
    case index of
       0:Orientation := soRight;
       1:Orientation := soUp;
       2:Orientation := soLeft;
       3:Orientation := soDown;
    end;}
end;

procedure TButtonGroupDemo2.RadioGroup1Click(Sender: TObject);
var i:integer;
begin
  for i:=0 to ShapeBtnGroup1.ButtonItems.Count-1 do
     TfcShapeBtn(ShapeBtnGroup1.ButtonItems[i].Button).Down := False;

  case ((Sender as TRadioGroup).ItemIndex) of
  0:begin
    ShapeBtnGroup1.ClickStyle := bcsRadioGroup;
    ShapeBtnGroup1.AutoBold := True;
    end;
  1:begin
    ShapeBtnGroup1.ClickStyle := bcsCheckList;
    ShapeBtnGroup1.AutoBold := False;
    end;
  2:begin
    ShapeBtnGroup1.ClickStyle := bcsClick;
    ShapeBtnGroup1.AutoBold := False;
    end;
  end;
end;


procedure TButtonGroupDemo2.CheckBox1Click(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked then
  begin
     OvalImageBtnGroup.Transparent := True;
     CheckBoxEditBtnGroup.Transparent := True
  end
  else begin
     OvalImageBtnGroup.Transparent := False;
     CheckBoxEditBtnGroup.Transparent := False;
  end;
end;

procedure TButtonGroupDemo2.fcButtonGroup3Item1MouseEnter(Sender: TObject);
begin
  if not (Sender as TfcImageBtn).Down then
     (Sender as TfcImageBtn).Color := clWhite;
end;

procedure TButtonGroupDemo2.fcButtonGroup3Item1MouseLeave(Sender: TObject);
begin
  if not (Sender as TfcImageBtn).Down then
     (Sender as TfcImageBtn).Color := clNone;
end;

procedure TButtonGroupDemo2.OvalSlantBtnGroup2Change(
  ButtonGroup: TfcCustomButtonGroup; OldSelected,
  Selected: TfcButtonGroupItem);
begin
  if (OldSelected <> nil) and (OldSelected.Button <> nil) then
     OldSelected.Button.Color := clNone;
  Selected.Button.Color := clYellow;
end;

procedure TButtonGroupDemo2.CheckBox2Click(Sender: TObject);
begin
   if (Sender as TCheckBox).Checked then
      VerticalShapeBtnGroup2.AutoBold := True
   else VerticalShapeBtnGroup2.AutoBold := False;
end;


procedure TButtonGroupDemo2.RadioGroup2Click(Sender: TObject);
var i:integer;
begin
  for i:=0 to VerticalShapeBtnGroup2.ButtonItems.Count-1 do
     TfcShapeBtn(VerticalShapeBtnGroup2.ButtonItems[i].Button).Down := False;

  case ((Sender as TRadioGroup).ItemIndex) of
  0:begin
    VerticalShapeBtnGroup2.ClickStyle := bcsRadioGroup;
    CheckBox2.Enabled := True;
    CheckBox2.Checked := True;
    end;
  1:begin
    VerticalShapeBtnGroup2.ClickStyle := bcsCheckList;
    CheckBox2.Checked := False;
    CheckBox2.Enabled := False;
    end;
  2:begin
    VerticalShapeBtnGroup2.ClickStyle := bcsClick;
    CheckBox2.Checked := False;
    CheckBox2.Enabled := False;
    end;
  end;
end;

procedure TButtonGroupDemo2.UpColorComboChange(Sender: TObject);
var i:integer;
begin
  for i:= 0 to HotTrackBtnGroup.ButtonItems.Count-1 do
     if not HotTrackBtnGroup.ButtonItems[i].selected then
     TfcImageBtn(HotTrackBtnGroup.ButtonItems[i].Button).Color :=
        (Sender as TfcColorCombo).SelectedColor;
end;

procedure TButtonGroupDemo2.DownDitherColorComboChange(Sender: TObject);
var i:integer;
begin
  for i:= 0 to HotTrackBtnGroup.ButtonItems.Count-1 do
     TfcImageBtn(HotTrackBtnGroup.ButtonItems[i].Button).DitherColor :=
        (Sender as TfcColorCombo).SelectedColor;
end;
procedure TButtonGroupDemo2.HorizontalImageBtnGroupChange(
  ButtonGroup: TfcCustomButtonGroup; OldSelected,
  Selected: TfcButtonGroupItem);
begin
  if (OldSelected <> nil) and (OldSelected.Button <> nil) then
     OldSelected.Button.Font.Color := clWhite;
  Selected.Button.Font.Color := clBlack;
end;

procedure TButtonGroupDemo2.SlantOval1MouseEnter(Sender: TObject);
begin
  if not (Sender as TfcImageBtn).Down then
     (Sender as TfcImageBtn).Color := HotTrackColorCombo.SelectedColor;
end;

procedure TButtonGroupDemo2.SlantOval1MouseLeave(Sender: TObject);
begin
  if not (Sender as TfcImageBtn).Down then
     (Sender as TfcImageBtn).Color := UpColorCombo.SelectedColor;
end;

end.
