unit FDistrFaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, Spin, MAHlpBtn, Buttons, ExtCtrls, Grids, Db,
  Wwdatsrc, DBTables, Wwtable, TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmDistrFaixa = class(TfrmOkCancelar)
    tblGrupo: TwwTable;
    tblCargo: TwwTable;
    ds: TwwDataSource;
    tblGraca: TwwTable;
    tblRelav: TwwTable;
    ds3: TwwDataSource;
    tblFaixa: TwwTable;
    tblFaixaIDFAIXASALARIAL: TFloatField;
    tblFaixaSTEP1: TFloatField;
    tblFaixaSTEP2: TFloatField;
    tblFaixaSTEP3: TFloatField;
    tblFaixaSTEP4: TFloatField;
    tblFaixaSTEP5: TFloatField;
    tblFaixaSTEP6: TFloatField;
    tblFaixaSTEP7: TFloatField;
    tblFaixaSTEP8: TFloatField;
    tblFaixaSTEP9: TFloatField;
    tblFaixaDATAEFETIV: TDateTimeField;
    tblClasse2: TwwTable;
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
  frmDistrFaixa: TfrmDistrFaixa;
  NumLinhas, NumColunas : Integer;
  Ind, IdFaixa, TotPontos, MaxCel : Integer;
  Maximos, Minimos, Celulas : Variant;

implementation

{$R *.DFM}

procedure TfrmDistrFaixa.FormCreate(Sender: TObject);
begin
  inherited;
  tblFaixa.Open;
  tblGrupo.Open;
  tblCargo.Open;
  tblGraca.Open;
  tblRelav.Open;
  tblClasse2.Open;

  bbtnConfirmarClick(Sender);
end;

procedure TfrmDistrFaixa.drgrdPontosDrawCell(Sender: TObject; Col,Row: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Rw, Cl: integer;
  Retang: TRect;
begin
  inherited;
  State := [gdFixed];
  if (Col * Row = 0) then
  begin
    drgrdPontos.Canvas.Font.Color := clWhite;
    drgrdPontos.Canvas.FillRect(Rect);
    drgrdPontos.Canvas.TextOut(Rect.left+5, Rect.Top+5, drgrdPontos.Cells[Col,Row]);
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
      Retang.Right  := Rect.Left + round(Celulas[Cl,Rw] * (Rect.Right - Rect.Left) / MaxCel);
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

procedure TfrmDistrFaixa.FormResize(Sender: TObject);
begin
  inherited;
  drgrdPontos.DefaultColWidth := round((drgrdPontos.Width - NumColunas-2) / (NumColunas + 1));
end;

procedure TfrmDistrFaixa.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  NumLinhas := 0;
  tblFaixa.Last;
  while not(tblFaixa.BOF) do
  begin
    NumLinhas := NumLinhas + 1;
    tblFaixa.Prior;
  end;

  NumColunas := 0;
  tblGrupo.First;
  while not(tblGrupo.EOF) do
  begin
    NumColunas := NumColunas + 1;
    tblGrupo.Next;
  end;

  drgrdPontos.ColCount := NumColunas + 1;
  drgrdPontos.RowCount := NumLinhas + 1;
  drgrdPontos.DefaultColWidth := round((drgrdPontos.Width - NumColunas-2) / (NumColunas + 1));

  NumLinhas := 0;
  tblFaixa.Last;
  while not(tblFaixa.BOF) do
  begin
    NumLinhas := NumLinhas + 1;
    drgrdPontos.Cells[0, NumLinhas] := tblFaixa.FieldByName('IDFAIXASALARIAL').AsString;
    tblFaixa.Prior;
  end;

  NumColunas := 0;
  tblGrupo.First;
  while not(tblGrupo.EOF) do
  begin
    NumColunas := NumColunas + 1;
    drgrdPontos.Cells[NumColunas, 0] := tblGrupo.FieldByName('CODGRPFUNC').Value;
    tblGrupo.Next;
  end;

  Celulas    := VarArrayCreate([1, NumColunas, 1, NumLinhas], varInteger);
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
      while not(tblGraca.EOF) do
      begin
        if (tblRelav.Findkey([tblCargo.FieldByName('CODGRPFUNC').Value,
                              tblGraca.FieldByName('IDFATORAVAL').Value])) then
          TotPontos := TotPontos +
                       tblRelav.FieldByName('PESO').Value *
                       tblGraca.FieldByName('GRAU').Value;
        tblGraca.Next;
      end;
      IdFaixa := 0;
      tblClasse2.First;
      while not(tblClasse2.EOF) do
      begin
        if (TotPontos >= tblClasse2.FieldByName('MINIMO').Value) and
           (TotPontos <= tblClasse2.FieldByName('MAXIMO').Value) then
        begin
          IdFaixa := tblClasse2.FieldByName('IDFAIXASALARIAL').Value;
          break;
        end;
        tblClasse2.Next;
      end;
      Ind := 0;
      tblFaixa.Last;
      while not(tblFaixa.BOF) do
      begin
        Ind := Ind + 1;
        if (tblFaixa.FieldByName('IDFAIXASALARIAL').Value = IdFaixa) then
        begin
          Celulas [NumColunas, Ind] := Celulas [NumColunas, Ind] + 1;
          break;
        end;
        tblFaixa.Prior;
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
  drgrdPontos.Visible    := (NumColunas > 0);
end;

end.
