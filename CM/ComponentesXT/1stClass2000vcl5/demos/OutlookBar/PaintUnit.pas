unit PaintUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, fcClearPanel, fcOutlookBar, StdCtrls, fcCombo,
  fcColorCombo, fcOutlookList, fcLabel,
  {$ifndef VER100}
  ImgList,
  {$endif}
  fcButtonGroup, fcButton, fcImgBtn, fcShapeBtn;

type
  TDrawingTool = (dtLine, dtRectangle, dtEllipse, dtRoundRect);

  TPaintForm = class(TForm)
    PaintBox: TImage;
    BrushImages: TImageList;
    PenImages: TImageList;
    ToolImages: TImageList;
    fcControlBar1: TfcOutlookBar;
    fcControlBar1fcShapeBtn1: TfcShapeBtn;
    fcControlBar1fcShapeBtn2: TfcShapeBtn;
    fcControlBar1fcShapeBtn3: TfcShapeBtn;
    fcControlBar1fcShapeBtn4: TfcShapeBtn;
    ToolsOutlookList: TfcOutlookList;
    BrushesOutlookList: TfcOutlookList;
    PensOutlookList: TfcOutlookList;
    BrushColorCombo: TfcColorCombo;
    fcLabel1: TfcLabel;
    fcLabel2: TfcLabel;
    PenColorCombo: TfcColorCombo;
    procedure PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBoxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    Drawing: Boolean;
    Origin, MovePt: TPoint;
    InfoShown: Boolean;
    procedure DrawShape(TopLeft, BottomRight: TPoint; AMode: TPenMode);
  public
    { Public declarations }
  end;

var
  PaintForm: TPaintForm;

implementation

uses InfoUnit;

{$R *.DFM}

procedure TPaintForm.PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Drawing := True;
  PaintBox.Canvas.MoveTo(X, Y);
  Origin := Point(X, Y);
  MovePt := Origin;
end;

procedure TPaintForm.PaintBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if Drawing then
  begin
    DrawShape(Origin, MovePt, pmNotXor);
    MovePt := Point(X, Y);
    DrawShape(Origin, MovePt, pmNotXor);
  end;
end;

procedure TPaintForm.PaintBoxMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Drawing then
  begin
    DrawShape(Origin, Point(X, Y), pmCopy);
    Drawing := False;
  end;
end;

procedure TPaintForm.DrawShape(TopLeft, BottomRight: TPoint; AMode: TPenMode);
begin
  with PaintBox.Canvas do
  begin
    Brush.Color := BrushColorCombo.SelectedColor;
    Pen.Color := PenColorCombo.SelectedColor;
    Pen.Mode := AMode;
    if BrushesOutlookList.Selected <> nil then Brush.Style := TBrushStyle(BrushesOutlookList.Selected.Index);
    if PensOutlookList.Selected <> nil then Pen.Style := TPenStyle(PensOutlookList.Selected.Index);
    if ToolsOutlookList.Selected <> nil then
      case TDrawingTool(ToolsOutlookList.Selected.Index) of
        dtLine: begin
          MoveTo(TopLeft.X, TopLeft.Y);
          LineTo(BottomRight.X, BottomRight.Y);
        end;
        dtRectangle: Rectangle(TopLeft.X, TopLeft.Y, BottomRight.X,
          BottomRight.Y);
        dtEllipse: Ellipse(Topleft.X, TopLeft.Y, BottomRight.X,
          BottomRight.Y);
        dtRoundRect: RoundRect(TopLeft.X, TopLeft.Y, BottomRight.X,
          BottomRight.Y, (TopLeft.X - BottomRight.X) div 2,
          (TopLeft.Y - BottomRight.Y) div 2);
      end;
  end;
end;

procedure TPaintForm.FormShow(Sender: TObject);
begin
  PaintBox.Canvas.Brush.Color := clWhite;
  PaintBox.Canvas.FillRect(PaintBox.ClientRect);
end;

procedure TPaintForm.FormCreate(Sender: TObject);
begin
  InfoForm := TInfoForm.Create(self);
end;

procedure TPaintForm.FormActivate(Sender: TObject);
begin
  if not InfoShown then begin
    InfoForm.Show;
    InfoShown := True;
  end;  
end;

end.
