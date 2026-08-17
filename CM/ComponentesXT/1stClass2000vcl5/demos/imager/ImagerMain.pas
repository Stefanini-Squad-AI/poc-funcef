unit ImagerMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcImager, ComCtrls, StdCtrls, ExtCtrls, fcCommon, fcCombo, fcColorCombo,
  CheckLst, fcTreeCombo, fcStatusBar, PicEdt, fcFontCombo, TypInfo,
  ExtDlgs,fcClearPanel, fcButtonGroup, fcOutlookBar, Buttons
  {$ifndef Ver100}
  ,ImgList
  {$endif}
  ,fcButton, fcImgBtn, fcShapeBtn, fcDemoRichEdit;

type
  TImagerForm = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    Panel2: TPanel;
    Panel3: TPanel;
    Bevel3: TBevel;
    fcStatusBar1: TfcStatusBar;
    ImageList1: TImageList;
    fcOutlookBar1: TfcOutlookBar;
    fcOutlookBar1fcShapeBtn1: TfcShapeBtn;
    fcOutlookBar1fcShapeBtn2: TfcShapeBtn;
    fcOutlookBar1fcShapeBtn3: TfcShapeBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label17: TLabel;
    combo_Color: TfcColorCombo;
    combo_DrawStyle: TComboBox;
    CheckListBox1: TCheckListBox;
    CheckListBoxHints: TMemo;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edit_Rotation_Angle: TEdit;
    edit_Rotation_X: TEdit;
    UpDown7: TUpDown;
    edit_Rotation_Y: TEdit;
    UpDown8: TUpDown;
    UpDown9: TUpDown;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    edit_AlphaBlend_Amount: TEdit;
    UpDown10: TUpDown;
    GroupBox3: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edit_Wave_Ratio: TEdit;
    UpDown11: TUpDown;
    checkbox_Wave_Wrap: TCheckBox;
    edit_Wave_XDiv: TEdit;
    edit_Wave_YDiv: TEdit;
    UpDown12: TUpDown;
    UpDown13: TUpDown;
    SpeedButton2: TSpeedButton;
    Track_Lightness: TTrackBar;
    Track_Contrast: TTrackBar;
    Track_Sponge: TTrackBar;
    Track_GaussianBlur: TTrackBar;
    Track_Saturation: TTrackBar;
    Track_Sharpen: TTrackBar;
    SpeedButton1: TSpeedButton;
    fcImager1: TfcImager;
    fcDemoRichEdit1: TfcDemoRichEdit;
    checkbox_AlphaBlend_Transparent: TCheckBox;
    procedure IntPropChange(Sender: TObject);
    procedure combo_ColorChange(Sender: TObject);
    procedure CheckListBox1ClickCheck(Sender: TObject);
    procedure RotationOffsetChange(Sender: TObject);
    procedure RotationAngleChange(Sender: TObject);
    procedure BlendBitmapBtnClick(Sender: TObject);
    procedure AlphaBlendAmountChange(Sender: TObject);
    procedure WaveIntChange(Sender: TObject);
    procedure checkbox_Wave_WrapClick(Sender: TObject);
    procedure combo_DrawStyleChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure fcImager1Click(Sender: TObject);
    procedure CheckListBox1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Track_LightnessChange(Sender: TObject);
    procedure checkbox_AlphaBlend_TransparentClick(Sender: TObject);
  private
    { Private declarations }
    FDefaultsStream: TMemoryStream;
  public
    { Public declarations }
  end;

var
  ImagerForm: TImagerForm;


implementation

{$R *.DFM}

procedure TImagerForm.IntPropChange(Sender: TObject);
begin
  with Sender as TEdit do
    fcSetOrdProp(fcImager1.BitmapOptions, fcGetToken(Name, '_', 1), StrToIntDef(Text, 0));
end;

procedure TImagerForm.combo_ColorChange(Sender: TObject);
begin
  with Sender as TfcColorCombo do
    fcSetOrdProp(fcImager1.BitmapOptions, fcGetToken(Name, '_', 1), SelectedColor);
end;

procedure TImagerForm.CheckListBox1ClickCheck(Sender: TObject);
var i: Integer;
  function Comp: TPersistent;
  begin
    if i < 5 then result := fcImager1.BitmapOptions
    else result := fcImager1;
  end;
begin
  with Sender as TCheckListBox do
  begin
    fcImager1.BitmapOptions.BeginUpdate;
      for i := 0 to Items.Count - 1 do
        fcSetOrdProp(Comp, fcReplace(Items[i], ' ', ''), ord(Checked[i]));
    fcImager1.BitmapOptions.EndUpdate;
  end;
end;

procedure TImagerForm.RotationOffsetChange(Sender: TObject);
begin
  with Sender as TEdit do
    fcSetOrdProp(fcImager1.BitmapOptions.Rotation, 'Center' + fcGetToken(Name, '_', 2), StrToIntDef(Text, 0));
end;

procedure TImagerForm.RotationAngleChange(Sender: TObject);
begin
  with Sender as TEdit do
    fcSetOrdProp(fcImager1.BitmapOptions.Rotation, fcGetToken(Name, '_', 2), StrToIntDef(Text, 0));
end;

procedure TImagerForm.BlendBitmapBtnClick(Sender: TObject);
var ABitmap: TBitmap;
begin
  ABitmap := TBitmap.Create;
  with fcImager1.BitmapOptions.AlphaBlend do
  begin
    Bitmap.Transparent := False;
    if ExecutePictureEditor(Bitmap, ABitmap) then Bitmap.Assign(ABitmap);
    Bitmap.Transparent := Transparent;
  end;
  ABitmap.Free;
  Abort;
end;

procedure TImagerForm.AlphaBlendAmountChange(Sender: TObject);
begin
  fcImager1.BitmapOptions.AlphaBlend.Bitmap.Transparent := checkbox_AlphaBlend_Transparent.Checked;
  fcImager1.BitmapOptions.AlphaBlend.Amount := StrToIntDef((Sender as TEdit).Text, 0);
  {  fcImager1.BitmapOptions.AlphaBlend.Bitmap.Transparent := checkbox_AlphaBlend_Transparent.Checked;
  with Sender as TEdit do
    fcSetOrdProp(fcImager1.BitmapOptions.AlphaBlend, fcGetToken(Name, '_', 2), StrToIntDef(Text, 0));}

end;

procedure TImagerForm.WaveIntChange(Sender: TObject);
begin
  with Sender as TEdit do
    fcSetOrdProp(fcImager1.BitmapOptions.Wave, fcGetToken(Name, '_', 2), StrToIntDef(Text, 0));
end;

procedure TImagerForm.checkbox_Wave_WrapClick(Sender: TObject);
begin
  with Sender as TCheckBox do
    fcSetOrdProp(fcImager1.BitmapOptions.Wave, fcGetToken(Name, '_', 2), ord(Checked));
end;

procedure TImagerForm.combo_DrawStyleChange(Sender: TObject);
begin
  with Sender as TComboBox do
    fcImager1.DrawStyle := TfcImagerDrawStyle(GetEnumValue(TypeInfo(TfcImagerDrawStyle), 'ds' + Text));
end;

procedure TImagerForm.FormShow(Sender: TObject);
var i: Integer;
  function Comp: TPersistent;
  begin
    if i < 5 then result := fcImager1.BitmapOptions
    else result := fcImager1;
  end;
begin
  combo_DrawStyle.ItemIndex := 0;
  with CheckListBox1 do
  begin
    fcImager1.BitmapOptions.BeginUpdate;
      for i := 0 to Items.Count - 1 do
        Checked[i] := Boolean(fcGetOrdProp(Comp, fcReplace(Items[i], ' ', '')));
    fcImager1.BitmapOptions.EndUpdate;
    fcImager1.Invalidate;
  end;
  if FDefaultsStream.Size = 0 then for i := 0 to ComponentCount - 1 do
    if not (Components[i] is TfcCustomButtonGroup)
       and not (Components[i] is TfcCustomColorCombo)
       and not (Components[i] is TRichEdit) then
      FDefaultsStream.WriteComponent(Components[i]);
end;

procedure TImagerForm.fcImager1Click(Sender: TObject);
begin
  ExecutePictureEditor(fcImager1.Picture.Graphic, fcImager1.Picture);
end;

procedure TImagerForm.CheckListBox1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var Index: Integer;
begin
  with Sender as TCheckListBox do
  begin
    Index := ItemAtPos(Point(x, y), True);
    if Index <> -1 then
      Hint := CheckListBoxHints.Lines[Index];
  end;
end;

procedure TImagerForm.FormCreate(Sender: TObject);
begin
  FDefaultsStream := TMemoryStream.Create;
end;

procedure TImagerForm.FormDestroy(Sender: TObject);
begin
  FDefaultsStream.Free;
end;

procedure TImagerForm.SpeedButton1Click(Sender: TObject);
var i: Integer;
begin
  FDefaultsStream.Position := 0;
  for i := 0 to ComponentCount - 1 do
    if not (Components[i] is TfcCustomButtonGroup)
       and not (Components[i] is TfcCustomColorCombo)
       and not (Components[i] is TRichEdit) then
      FDefaultsStream.ReadComponent(Components[i]);
  combo_Color.SelectedColor := clNone;
end;

procedure TImagerForm.Track_LightnessChange(Sender: TObject);
begin
  with Sender as TTrackBar do
    fcSetOrdProp(fcImager1.BitmapOptions, fcGetToken(Name, '_', 1), position);
end;

procedure TImagerForm.checkbox_AlphaBlend_TransparentClick(Sender: TObject);
begin
  with Sender as TCheckBox do
    fcSetOrdProp(fcImager1.BitmapOptions.AlphaBlend,
       fcGetToken(Name, '_', 2), ord(Checked));
end;

end.
