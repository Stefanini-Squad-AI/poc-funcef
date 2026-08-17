unit colordemou;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBGrids, fcColorCombo, fcCombo, ExtCtrls, Mask, ComCtrls, fcLabel, fcCommon,
  DBCtrls, Db, DBTables, Grids, fcDemoRichEdit;

type
  TColorDemoForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    fcColorCombo1: TfcColorCombo;
    TabSheet2: TTabSheet;
    fcColorList3: TfcColorList;
    fcColorList2: TfcColorList;
    fcColorList4: TfcColorList;
    fcColorList1: TfcColorList;
    fcLabel1: TfcLabel;
    fcLabel2: TfcLabel;
    fcLabel3: TfcLabel;
    fcLabel4: TfcLabel;
    fcLabel5: TfcLabel;
    fcLabel6: TfcLabel;
    fcLabel7: TfcLabel;
    Panel2: TPanel;
    ColorListBoxOptions: TGroupBox;
    CheckBox5: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox1: TCheckBox;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    DropDownCountEdit: TEdit;
    DropDownWidthEdit: TEdit;
    ItemHeightEdit: TEdit;
    UpDown4: TUpDown;
    itemheightlabel: TLabel;
    dropdowncountlabel: TLabel;
    dropdownwidthlabel: TLabel;
    DropDownTitle: TLabel;
    Bevel1: TBevel;
    Panel3: TPanel;
    ShowMatchCheckbox: TCheckBox;
    ShowButtonCheckbox: TCheckBox;
    ButtonStyleRadio: TRadioGroup;
    ColorAlignmentRadio: TRadioGroup;
    AppearanceTitle: TLabel;
    Bevel2: TBevel;
    ColorWidthEdit: TEdit;
    Colorwidthlabel: TLabel;
    UpDown3: TUpDown;
    SortByRadio: TRadioGroup;
    Shape1: TShape;
    CheckBox6: TCheckBox;
    fcDemoRichEdit1: TfcDemoRichEdit;
    procedure CheckBox1Click(Sender: TObject);
    procedure SortByRadioClick(Sender: TObject);
    procedure ShowButtonCheckboxClick(Sender: TObject);
    procedure ShowMatchCheckboxClick(Sender: TObject);
    procedure ButtonStyleRadioClick(Sender: TObject);
    procedure fcColorCombo1DropDown(Sender: TObject);
    procedure DropDownCountEditExit(Sender: TObject);
    procedure DropDownWidthEditExit(Sender: TObject);
    procedure ColorWidthEditExit(Sender: TObject);
    procedure ItemHeightEditExit(Sender: TObject);
    procedure UpDown3Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown4Click(Sender: TObject; Button: TUDBtnType);
    procedure ColorAlignmentRadioClick(Sender: TObject);
    procedure fcColorCombo1Change(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ColorDemoForm: TColorDemoForm;

implementation

{$R *.DFM}

function StripTrailing(s: string): string;
  var len: integer;
begin
  len := length(s);
  while (len > 0) and (s[len] in [' ', #9]) do len := len - 1;
  SetLength(s, len);
  result:= s;
end;

procedure TColorDemoForm.CheckBox1Click(Sender: TObject);
begin
   with (Sender as TCheckBox),fcColorCombo1.ColorListOptions do begin
      if Checked then begin
         case Tag of
           1:Options := Options + [ccoShowCustomColors];
           2:Options := Options + [ccoShowSystemColors];
           3:Options := Options + [ccoShowStandardColors];
           4:Options := Options + [ccoShowGreyScale];
           5:Options := Options + [ccoShowColorNone];
         end;
      end
      else begin
         case Tag of
           1:Options := Options - [ccoShowCustomColors];
           2:Options := Options - [ccoShowSystemColors];
           3:Options := Options - [ccoShowStandardColors];
           4:Options := Options - [ccoShowGreyScale];
           5:Options := Options - [ccoShowColorNone];
         end;
      end;
   end;
   fcColorCombo1.ListBox.AllColors.Clear;
   fcColorCombo1.RefreshList;
   fcColorCombo1.ItemIndex := -1;
   fcColorCombo1.Text:='';
end;

procedure TColorDemoForm.SortByRadioClick(Sender: TObject);
begin
  case (Sender as TRadioGroup).ItemIndex of
    0:fcColorCombo1.ColorListOptions.SortBy := csoNone;
    1:fcColorCombo1.ColorListOptions.SortBy := csoByRGB;
    2:fcColorCombo1.ColorListOptions.SortBy := csoByName;
    3:fcColorCombo1.ColorListOptions.SortBy := csoByIntensity;
  end;
end;

procedure TColorDemoForm.ShowButtonCheckboxClick(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked then
    fcColorCombo1.ShowButton := True
  else fcColorCombo1.ShowButton := False;
end;

procedure TColorDemoForm.ShowMatchCheckboxClick(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked then
    fcColorCombo1.ShowMatchText := True
  else fcColorCombo1.ShowMatchText := False;
end;


procedure TColorDemoForm.ButtonStyleRadioClick(Sender: TObject);
begin
  case (Sender as TRadioGroup).ItemIndex of
    0:fcColorCombo1.ButtonStyle := cbsEllipsis;
    1:fcColorCombo1.ButtonStyle := cbsDownArrow;
  end;
end;


procedure TColorDemoForm.fcColorCombo1DropDown(Sender: TObject);
begin
 with (Sender as TfcColorCombo) do begin
   DropDownCount := StrToInt(StripTrailing(DropDownCountEdit.Text));
   DropDownWidth := StrToInt(StripTrailing(DropDownWidthEdit.Text));
   ColorListOptions.ColorWidth := StrToInt(StripTrailing(ColorWidthEdit.Text));
   ColorListOptions.ItemHeight := StrToInt(StripTrailing(ItemHeightEdit.Text));
   ListBox.ItemHeight := ColorListOptions.ItemHeight;
   ListBox.ColorWidth := ColorListOptions.ColorWidth;
 end;
end;

procedure TColorDemoForm.DropDownCountEditExit(Sender: TObject);
begin
  if StrToIntDef((Sender as TEdit).Text,UpDown2.Max+1) > UpDown2.Max then
     (Sender as TEdit).Text := IntToStr(UpDown2.Max);
end;

procedure TColorDemoForm.DropDownWidthEditExit(Sender: TObject);
begin
  if StrToIntDef((Sender as TEdit).Text,UpDown1.Max+1) > UpDown1.Max then
     (Sender as TEdit).Text := IntToStr(UpDown1.Max);
end;

procedure TColorDemoForm.ColorWidthEditExit(Sender: TObject);
begin
  if StrToIntDef((Sender as TEdit).Text,UpDown3.Max+1) > UpDown3.Max then
     (Sender as TEdit).Text := IntToStr(UpDown3.Max);
   fcColorCombo1.ColorListOptions.ColorWidth := StrToInt(StripTrailing(ColorWidthEdit.Text));
   fcColorCombo1.ListBox.ColorWidth := fcColorCombo1.ColorListOptions.ColorWidth;
   fcColorCombo1.Invalidate;
end;

procedure TColorDemoForm.ItemHeightEditExit(Sender: TObject);
begin
  if StrToIntDef((Sender as TEdit).Text,UpDown4.Max+1) > UpDown4.Max then
     (Sender as TEdit).Text := IntToStr(UpDown4.Max);
   fcColorCombo1.ColorListOptions.ItemHeight := StrToInt(StripTrailing(ItemHeightEdit.Text));
   fcColorCombo1.ListBox.ItemHeight := fcColorCombo1.ColorListOptions.ItemHeight;
   fcColorCombo1.Invalidate;
end;


procedure TColorDemoForm.UpDown3Click(Sender: TObject; Button: TUDBtnType);
begin
   ColorWidthEditExit(ColorWidthEdit);
end;

procedure TColorDemoForm.UpDown4Click(Sender: TObject; Button: TUDBtnType);
begin
   ItemHeightEditExit(ItemHeightEdit);
end;

procedure TColorDemoForm.ColorAlignmentRadioClick(Sender: TObject);
begin
  case (Sender as TRadioGroup).ItemIndex of
    0:fcColorCombo1.ColorAlignment := taLeftJustify;
    1:fcColorCombo1.ColorAlignment := taRightJustify;
  end;
end;

procedure TColorDemoForm.fcColorCombo1Change(Sender: TObject);
begin
  Shape1.Brush.Color := (Sender as TfcColorCombo).SelectedColor;
end;

procedure TColorDemoForm.CheckBox6Click(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked then
    fcColorCombo1.AutoDropDown := True
  else fcColorCombo1.AutoDropDown := False;
end;

end.


