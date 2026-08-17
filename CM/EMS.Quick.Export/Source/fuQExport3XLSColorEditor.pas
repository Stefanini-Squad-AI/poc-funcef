unit fuQExport3XLSColorEditor;

interface

uses
  Windows, Classes, Graphics, Controls, Forms, 
  StdCtrls, ExtCtrls, QExport3XLS;

type
  TfmQExport3XLSColorEditor = class(TForm)
    pbColors: TPaintBox;
    bOk: TButton;
    bCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure pbColorsPaint(Sender: TObject);
    procedure pbColorsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pbColorsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    FColorIndex: TxlsColor;
    FColorIndex1: TxlsColor;
    procedure DrawColors;
    function ColorIndexToRect: TRect;
    procedure ColorsPaintOver;
    procedure SetColorIndex1(Value: TxlsColor);
  public
    { Public declarations }
  end;

function RunXLSColorEditor(AColorIndex: TxlsColor): TxlsColor;

implementation

uses {$IFDEF WIN32}QExport3StrIDs{$ENDIF}
     {$IFDEF LINUX}QExport3Consts{$ENDIF}, QExport3XLSCommon;

{$R *.DFM}

function RunXLSColorEditor(AColorIndex: TxlsColor): TxlsColor;
begin
  with TfmQExport3XLSColorEditor.Create(Application) do
  try
    FColorIndex := AColorIndex;
    Result := AColorIndex;
    if ShowModal = mrOk then Result := FColorIndex;
  finally
    Free;
  end;
end;

{ TVExcelColorEditor }

function TfmQExport3XLSColorEditor.ColorIndexToRect: TRect;
begin
  Result.Left := (Integer(FColorIndex) mod 8) * 22;
  Result.Top := (Integer(FColorIndex) div 8) * 22;
  Result.Right := Result.Left + 22;
  Result.Bottom := Result.Top + 22;
end;

procedure TfmQExport3XLSColorEditor.DrawColors;
var
  x, y, i, j: integer;
begin
  y := 3;
  pbColors.Canvas.Pen.Color := clBlack;
  for j := 0 to 4 do begin
    x := 3;
    for i := 0 to 7 do begin
      pbColors.Canvas.Brush.Color := XLS_STANDARD_PALETTE[i + j * 8];
      pbColors.Canvas.Rectangle(x, y, x + 16, y + 16);
      Inc(x, 22);
    end;
    Inc(y, 22);
  end;
end;

procedure TfmQExport3XLSColorEditor.FormShow(Sender: TObject);
begin
  DrawColors;
end;

procedure TfmQExport3XLSColorEditor.pbColorsPaint(Sender: TObject);
var
  R: TRect;
begin
  DrawColors;
  if Integer(FColorIndex) >= 0 then begin
    R := ColorIndexToRect;
    DrawEdge(pbColors.Canvas.Handle, R, BDR_SUNKENINNER, BF_TOPLEFT);
    DrawEdge(pbColors.Canvas.Handle, R, BDR_SUNKENOUTER, BF_BOTTOMRIGHT);
  end;
end;

procedure TfmQExport3XLSColorEditor.pbColorsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  R: TRect;
begin
  ColorsPaintOver;
  FColorIndex := TxlsColor((X div 22) + (Y div 22) * 8);
  if Integer(FColorIndex) < 0 then
    FColorIndex := TxlsColor(0);
  if Integer(FColorIndex) > High(XLS_STANDARD_PALETTE) then
    FColorIndex := TxlsColor(High(XLS_STANDARD_PALETTE));
  R := ColorIndexToRect;
  DrawEdge(pbColors.Canvas.Handle,R,BDR_SUNKENINNER,BF_TOPLEFT);
  DrawEdge(pbColors.Canvas.Handle,R,BDR_SUNKENOUTER,BF_BOTTOMRIGHT);
  if ssDouble in Shift then
    ModalResult := mrOk;
end;

procedure TfmQExport3XLSColorEditor.ColorsPaintOver;
var
  R: TRect;
begin
  if Integer(FColorIndex) >= 0 then begin
    R := ColorIndexToRect;
    pbColors.Canvas.Pen.Color := clBtnFace;
    pbColors.Canvas.Brush.Color := clBtnFace;
    pbColors.Canvas.Rectangle(R.Left, R.Top, R.Right, R.Bottom);
    pbColors.Canvas.Pen.Color := clBlack;
    pbColors.Canvas.Brush.Color := XLS_STANDARD_PALETTE[Integer(FColorIndex)];
    pbColors.Canvas.Rectangle(R.Left + 3, R.Top + 3, R.Right - 3, R.Bottom - 3);
  end;
end;

procedure TfmQExport3XLSColorEditor.pbColorsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  N: TxlsColor;
begin
  N := TxlsColor((X div 22) + (Y div 22) * 8);
  if Integer(FColorIndex1) < 0 then
    N := TxlsColor(0);
  if Integer(FColorIndex1) > High(XLS_STANDARD_PALETTE) then
    N := TxlsColor(High(XLS_STANDARD_PALETTE));

  SetColorIndex1(N);
end;

procedure TfmQExport3XLSColorEditor.SetColorIndex1(Value: TxlsColor);
const
  xlsColorNames: array[0..39] of string = (
    'Black',
    'Brown',
    'Olive Green',
    'Dark Green',
    'Dark Teal',
    'Dark Blue',
    'Indigo',
    'Gray-80%',
    'Dark Red',
    'Orange',
    'Dark Yellow',
    'Green',
    'Teal',
    'Blue',
    'Blue-Gray',
    'Gray-50%',
    'Red',
    'Light Orange',
    'Lime',
    'Sea Green',
    'Aqua',
    'Light Blue',
    'Violet',
    'Gray-40%',
    'Pink',
    'Gold',
    'Yellow',
    'Bright Green',
    'Turquoise',
    'Sky Blue',
    'Plum',
    'Gray-25%',
    'Rose',
    'Tan',
    'Light Yellow',
    'Liht Green',
    'Light Turquoise',
    'Pale Blue',
    'Lavender',
    'White');

begin
  if FColorIndex1 <> Value then begin
    FColorIndex1 := Value;
    pbColors.Hint := xlsColorNames[Integer(FColorIndex1)];
    Application.CancelHint;
  end;
end;

end.
