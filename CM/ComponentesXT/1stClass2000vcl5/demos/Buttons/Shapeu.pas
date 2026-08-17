unit Shapeu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, fcLabel, ComCtrls, StdCtrls, DBCtrls, Db, DBTables, fcButton,
  fcImgBtn, fcShapeBtn, fcText, Buttons, fcDemoRichEdit, fcImager;

type
  TShapeBtnDemoForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    Panel2: TPanel;
    ButtonArrowLeft: TfcShapeBtn;
    ButtonArrowRight: TfcShapeBtn;
    ButtonDiamond: TfcShapeBtn;
    ButtonRoundRect1: TfcShapeBtn;
    ButtonEllipse: TfcShapeBtn;
    ButtonRoundRect2: TfcShapeBtn;
    ButtonStar: TfcShapeBtn;
    ButtonRoundRect3: TfcShapeBtn;
    ButtonTriangle: TfcShapeBtn;
    ButtonTrapezoid: TfcShapeBtn;
    fcDemoRichEdit1: TfcDemoRichEdit;
    Panel3: TPanel;
    CustomButton1: TfcShapeBtn;
    CustomCrossButton: TfcShapeBtn;
    CustomArrowButton: TfcShapeBtn;
    RadioGroup1: TRadioGroup;
    CustomLButton1: TfcShapeBtn;
    CustomLButton2: TfcShapeBtn;
    CustomLButton3: TfcShapeBtn;
    CustomTriangleButton: TfcShapeBtn;
    CustomTrapezoidButton: TfcShapeBtn;
    fcDemoRichEdit2: TfcDemoRichEdit;
    Panel4: TPanel;
    ButtonMultiLine2: TfcShapeBtn;
    ButtonTextEffects1: TfcShapeBtn;
    ButtonMultiLine1: TfcShapeBtn;
    fcDemoRichEdit3: TfcDemoRichEdit;
    Panel5: TPanel;
    Label1: TLabel;
    ButtonSpeedStar: TfcShapeBtn;
    ButtonSpeedArrow: TfcShapeBtn;
    Label2: TLabel;
    Label3: TLabel;
    fcShapeBtn1: TfcShapeBtn;
    fcShapeBtn2: TfcShapeBtn;
    fcShapeBtn3: TfcShapeBtn;
    fcShapeBtn7: TfcShapeBtn;
    fcShapeBtn6: TfcShapeBtn;
    fcShapeBtn5: TfcShapeBtn;
    Edit1: TEdit;
    fcDemoRichEdit4: TfcDemoRichEdit;
    Panel6: TPanel;
    ButtonGlyphHotTrack: TfcShapeBtn;
    ButtonHotTrack: TfcShapeBtn;
    ButtonColored: TfcShapeBtn;
    fcDemoRichEdit5: TfcDemoRichEdit;
    Bevel1: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    fcShapeBtn8: TfcShapeBtn;
    fcShapeBtn9: TfcShapeBtn;
    fcShapeBtn10: TfcShapeBtn;
    fcLabel6: TfcLabel;
    fcLabel7: TfcLabel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    RightButton1: TfcShapeBtn;
    RightButton2: TfcShapeBtn;
    LeftButton1: TfcShapeBtn;
    RightButton3: TfcShapeBtn;
    LeftButton2: TfcShapeBtn;
    RightButton4: TfcShapeBtn;
    LeftButton3: TfcShapeBtn;
    LeftButton4: TfcShapeBtn;
    fcLabel8: TfcLabel;
    fcLabel5: TfcLabel;
    fcLabel3: TfcLabel;
    fcLabel4: TfcLabel;
    fcLabel9: TfcLabel;
    fcLabel2: TfcLabel;
    fcLabel1: TfcLabel;
    fcImager1: TfcImager;
    procedure LeftButton3Click(Sender: TObject);
    procedure RightButton1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure ButtonColoredMouseLeave(Sender: TObject);
    procedure ButtonHotTrackMouseLeave(Sender: TObject);
    procedure ButtonHotTrackMouseEnter(Sender: TObject);
    procedure ButtonGlyphHotTrackMouseEnter(Sender: TObject);
    procedure ButtonGlyphHotTrackMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ShapeBtnDemoForm: TShapeBtnDemoForm;

implementation

{$R *.DFM}

procedure TShapeBtnDemoForm.LeftButton3Click(Sender: TObject);
begin
  with PageControl1 do ActivePage := FindNextPage(ActivePage,False,False);
end;

procedure TShapeBtnDemoForm.RightButton1Click(Sender: TObject);
begin
  with PageControl1 do ActivePage := FindNextPage(ActivePage,True,False);
end;

procedure TShapeBtnDemoForm.RadioGroup1Click(Sender: TObject);
begin
   case RadioGroup1.ItemIndex of
      0: begin
           CustomLButton1.Orientation := soDown;
           CustomLButton2.Orientation := soDown;
           CustomLButton3.Orientation := soDown;
           CustomArrowButton.Orientation := soDown;
           CustomLButton2.Top := CustomLButton3.Top;
           CustomLButton1.Top := CustomLButton3.Top;
           CustomLButton2.Left := CustomLButton3.Left;
           CustomLButton1.Left := CustomLButton3.Left;
         end;
      1: begin
           CustomLButton1.Orientation := soUp;
           CustomLButton2.Orientation := soUp;
           CustomLButton3.Orientation := soUp;
           CustomArrowButton.Orientation := soUp;
           CustomLButton2.Top := CustomLButton3.Top+15;
           CustomLButton1.Top := CustomLButton2.Top+15;
           CustomLButton2.Left := CustomLButton3.Left+15;
           CustomLButton1.Left := CustomLButton2.Left+15;
         end;
      2: begin
           CustomLButton1.Orientation := soLeft;
           CustomLButton2.Orientation := soLeft;
           CustomLButton3.Orientation := soLeft;
           CustomArrowButton.Orientation := soLeft;
           CustomLButton2.Top := CustomLButton3.Top;
           CustomLButton1.Top := CustomLButton3.Top;
           CustomLButton2.Left := CustomLButton3.Left+15;
           CustomLButton1.Left := CustomLButton2.Left+15;
         end;
      3: begin
           CustomLButton1.Orientation := soRight;
           CustomLButton2.Orientation := soRight;
           CustomLButton3.Orientation := soRight;
           CustomArrowButton.Orientation := soRight;
           CustomLButton2.Top := CustomLButton3.Top+15;
           CustomLButton1.Top := CustomLButton2.Top+15;
           CustomLButton2.Left := CustomLButton3.Left;
           CustomLButton1.Left := CustomLButton3.Left;
         end;
   end;
end;

procedure TShapeBtnDemoForm.ButtonColoredMouseLeave(Sender: TObject);
begin
  (Sender as TfcShapeBtn).Font.Color := clWhite;
end;

procedure TShapeBtnDemoForm.ButtonHotTrackMouseLeave(Sender: TObject);
begin
  with (Sender as TfcShapeBtn) do begin
    Color := clBtnFace;
    UpdateShadeColors(Color);
    Font.Color := clBlack;
    TextOptions.ShadeColor := clBtnShadow;
    TextOptions.HighlightColor := clBtnHighlight;
    ShadeColors.Btn3DLight := cl3DLight;
  end;
end;

procedure TShapeBtnDemoForm.ButtonHotTrackMouseEnter(Sender: TObject);
begin
  with (Sender as TfcShapeBtn) do begin
     Color := clRed;
     UpdateShadeColors(clRed);
     Font.Color := clWhite;
     TextOptions.HighlightColor := $00A0A0FF;
     TextOptions.ShadeColor := clMaroon;
  end;
end;

procedure TShapeBtnDemoForm.ButtonGlyphHotTrackMouseEnter(Sender: TObject);
begin
  (Sender as TfcShapeBtn).Font.Color := clRed;
end;

procedure TShapeBtnDemoForm.ButtonGlyphHotTrackMouseLeave(Sender: TObject);
begin
 (Sender as TfcShapeBtn).Font.Color := clBlack;
end;

end.
