unit FDistrPont;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, Spin, MAHlpBtn, Buttons, ExtCtrls, Grids, Db,
  Wwdatsrc, DBTables, Wwtable, TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmDistrPont = class(TfrmOkCancelar)
    tblGrupo: TwwTable;
    tblCargo: TwwTable;
    ds: TwwDataSource;
    tblGraca: TwwTable;
    tblRelav: TwwTable;
    ds3: TwwDataSource;
    Label3: TLabel;
    spedMax: TSpinEdit;
    Label1: TLabel;
    spedEscala: TSpinEdit;
    Label2: TLabel;
    drgrdPontos: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure drgrdPontosDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDistrPont: TfrmDistrPont;
  NumLinhas, NumColunas : Integer;
  Ind, MaxVal, MinVal, StepVal, TotPontos, MaxCel : Integer;
  Maximos, Minimos, Celulas : Variant;

implementation

{$R *.DFM}

procedure TfrmDistrPont.FormCreate(Sender: TObject);
begin
  inherited;
  tblGrupo.Open;
  tblCargo.Open;
  tblGraca.Open;
  tblRelav.Open;

  bbtnConfirmarClick(Sender);
end;

procedure TfrmDistrPont.drgrdPontosDrawCell(Sender: TObject; Col,Row: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Rw, Cl: Integer;
  Retang: TRect;
begin
  inherited;
  State := [gdFixed];
  if (Col * Row = 0) then
  begin
    drgrdPontos.Canvas.Font.Color := clWhite;
    drgrdPontos.Canvas.FillRect(Rect);
    drgrdPontos.Canvas.TextOut(Rect.Left+5, Rect.Top+5, drgrdPontos.Cells[Col,Row]);
    exit;
  end;

  Rw := Row;
  Cl := Col;
  with (drgrdPontos) do
  begin
    if (Celulas[Cl,Rw] <> 0) then
    begin
      if (Frac(Cl / 3) = 0) then
        Canvas.Brush.Color := clGreen
      else
      begin
        if (Frac(Cl / 3) < 0.5) then
          Canvas.Brush.Color := clTeal
        else
        if (Frac(Cl / 3) > 0.5) then
          Canvas.Brush.Color := clBlue;
      end;
      Retang.Left   := Rect.Left;
      Retang.Top    := Rect.Top;
      Retang.Right  := Rect.Left + Round(Celulas[Cl,Rw] * (Rect.Right - Rect.Left) / MaxCel);
      Retang.Bottom := Rect.Bottom;
      Canvas.Font.Color := clWhite;
      Canvas.FillRect(Retang);
    end
    else
    begin
      Canvas.Brush.Color := clWhite;
      Canvas.Font.Color  := clBlack;
      Canvas.FillRect(Rect);
    end;
    Canvas.TextOut(Rect.Left+5, Rect.Top+5, Celulas[Cl,Rw]);
  end;
end;

procedure TfrmDistrPont.FormResize(Sender: TObject);
begin
  inherited;
  drgrdPontos.DefaultColWidth := round((drgrdPontos.Width - NumColunas-2) / (NumColunas + 1));
end;

procedure TfrmDistrPont.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  NumLinhas := round(100 / spedEscala.Value);
  if (frac(100 / spedEscala.Value) > 0) and (frac(100 / spedEscala.Value) <= 0.5) then
    NumLinhas := NumLinhas + 1;

  NumColunas := 0;
  tblGrupo.First;
  while not(tblGrupo.EOF) do
  begin
    NumColunas := NumColunas + 1;
    tblGrupo.Next;
  end;
  drgrdPontos.ColCount := NumColunas + 1;
  drgrdPontos.RowCount := NumLinhas  + 1;
  drgrdPontos.DefaultColWidth := round((drgrdPontos.Width - NumColunas-2) / (NumColunas + 1));

  NumColunas := 0;
  tblGrupo.First;
  while not(tblGrupo.EOF) do
  begin
    NumColunas := NumColunas + 1;
    drgrdPontos.Cells[NumColunas, 0] := tblGrupo.FieldByName('CODGRPFUNC').Value;
    tblGrupo.Next;
  end;

  Maximos := VarArrayCreate([1, NumLinhas], varInteger);
  Minimos := VarArrayCreate([1, NumLinhas], varInteger);
  Celulas := VarArrayCreate([1, NumColunas, 1, NumLinhas], varInteger);
  MaxVal  := spedMax.Value;
  StepVal := round(spedEscala.Value * spedMax.Value / 100);

  for Ind:=1 to NumLinhas do
  begin
    MinVal := MaxVal - StepVal + 1;
    if (MinVal < 0) or (MinVal = 1) then
      MinVal := 0;
    Maximos [Ind] := MaxVal;
    Minimos [Ind] := MinVal;
    drgrdPontos.Cells[0, Ind] := IntToStr(MinVal) + '-' + IntToStr(MaxVal);
    MaxVal := MinVal - 1;
  end;

  NumColunas := 0;
  tblGrupo.First;
  while not(tblGrupo.EOF) do
  begin
    NumColunas := NumColunas + 1;
    tblCargo.First;
    while not(tblCargo.EOF) do
    begin
      { Rotina para calcular os pontos do cargo }
      TotPontos := 0;
      tblGraca.First;
      while not(tblGraca.Eof) do
      begin
        if tblRelav.Findkey([tblCargo.FieldByName('CODGRPFUNC').Value,
                             tblGraca.FieldByName('IDFATORAVAL').Value]) then
          TotPontos := TotPontos +
                       tblRelav.FieldByName('PESO').Value *
                       tblGraca.FieldByName('GRAU').Value;
        tblGraca.Next;
      end;

      for Ind:=1 to NumLinhas do
      begin
        if (TotPontos >= Minimos [Ind]) and (TotPontos <= Maximos [Ind]) then
        begin
          Celulas [NumColunas, Ind] := Celulas [NumColunas, Ind] + 1;
          break;
        end;
      end;
      tblCargo.Next;
    end;
    for Ind:=1 to NumLinhas do
    begin
      drgrdPontos.Cells[NumColunas, Ind] := IntToStr(Celulas [NumColunas, Ind]);
      if (Celulas [NumColunas, Ind] > MaxCel) then
        MaxCel := Celulas [NumColunas, Ind];
    end;
    tblGrupo.Next;
  end;
  drgrdPontos.OnDrawCell := drgrdPontosDrawCell;
  drgrdPontos.Visible    := NumColunas > 0;
end;

end.
