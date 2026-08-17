unit fDistrFaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  StdCtrls, Spin, MAHlpBtn, Buttons, ExtCtrls, Grids, Db, Wwdatsrc, DBTables, Wwtable, TB97,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, DBClient, uCMClientDataSet, uCtrlDistrPontuacao;

type
  TfrmDistrFaixa = class(TfrmSairAjuda)
    drgrdPontos: TStringGrid;
    bbtnAtualizar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    dsGrupo: TwwDataSource;
    CdsGrupo: TCMClientDataSet;
    dsCargo: TwwDataSource;
    CdsCargo: TCMClientDataSet;
    CdsFaixa: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure drgrdPontosDrawCell(Sender: TObject; Col, Row: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure FormResize(Sender: TObject);
    procedure bbtnAtualizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Celulas: variant;
    iMaxCel, iNumColunas: integer;
    CtrlDistrPontuacao: TCtrlDistrPontuacao;
  end;

var
  frmDistrFaixa: TfrmDistrFaixa;

implementation

uses uCtrlPadroes;

{$R *.DFM}

procedure TfrmDistrFaixa.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlDistrPontuacao := TCtrlDistrPontuacao.Create;
  CtrlDistrPontuacao.InitializeAs(Padroes);

  CdsGrupo.Data := CtrlDistrPontuacao.ListGrupoFunc;
  CdsCargo.Data := CtrlDistrPontuacao.ListCargo;
  CdsFaixa.Data := CtrlDistrPontuacao.ListFaixa;

  bbtnAtualizarClick(Sender);
end;

procedure TfrmDistrFaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlDistrPontuacao);
  inherited;
end;

procedure TfrmDistrFaixa.FormResize(Sender: TObject);
begin
  inherited;
  bbtnAtualizarClick(Sender);
end;

procedure TfrmDistrFaixa.drgrdPontosDrawCell(Sender: TObject; Col,Row: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Rw, Cl: integer;
  Retang: TRect;
begin
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
      Retang.Left := Rect.Left;
      Retang.Top := Rect.Top;
      Retang.Right := Rect.Left + Round(Celulas[Cl,Rw] * (Rect.Right - Rect.Left) / iMaxCel);
      Retang.Bottom := Rect.Bottom;
      Canvas.Font.Color := clWhite;
      Canvas.FillRect(Retang);
    end
    else
    begin
      Canvas.Brush.Color := clWhite;
      Canvas.Font.Color := clBlack;
      Canvas.FillRect(Rect);
    end;
    Canvas.TextOut(Rect.Left+5, Rect.Top+5, Celulas[Cl,Rw]);
  end;
end;

procedure TfrmDistrFaixa.bbtnAtualizarClick(Sender: TObject);
var
  c: integer;
  iIdFaixa, iNumLinhas: integer;
begin
  // Calcular e atribuir as colunas
  iNumColunas := CdsGrupo.RecordCount;
  drgrdPontos.ColCount := iNumColunas + 1;
  drgrdPontos.DefaultColWidth := Round((drgrdPontos.Width - iNumColunas-2) / (iNumColunas+1));

  // Calcular e atribuir as linhas
  iNumLinhas := CdsFaixa.RecordCount;
  drgrdPontos.RowCount := iNumLinhas + 1;

  // Atribuir o título das colunas
  c := 1;
  CdsGrupo.First;
  while not(CdsGrupo.EOF) do
  begin
    drgrdPontos.Cells[c, 0] := CdsGrupo.FieldByName('CODGRPFUNC').asString;
    CdsGrupo.Next;
    Inc(c);
  end;

  // Atribuir o título das linhas
  c := 1;
  CdsFaixa.Last;
  while not(CdsFaixa.BOF) do
  begin
    drgrdPontos.Cells[0, c] := CdsFaixa.FieldByName('IDFAIXASALARIAL').asString;
    CdsFaixa.Prior;
    Inc(c);
  end;

  Celulas := VarArrayCreate([1, iNumColunas, 1, iNumLinhas], varInteger);

  // Atribuir os valores
  iNumColunas := 1;
  CdsGrupo.First;
  while not(CdsGrupo.EOF) do
  begin
    CdsCargo.First;
    while not(CdsCargo.EOF) do
    begin
      iIdFaixa := CdsCargo.FieldByName('IDFAIXASALARIAL').asInteger;
      c := 1;
      CdsFaixa.Last;
      while not(CdsFaixa.BOF) do
      begin
        if (CdsFaixa.FieldByName('IDFAIXASALARIAL').asInteger = iIdFaixa) then
        begin
          Celulas[iNumColunas, c] := Celulas[iNumColunas, c] + 1;
          break;
        end;
        CdsFaixa.Prior;
        Inc(c);
      end;
      CdsCargo.Next;
    end;

    for c:=1 to iNumLinhas do
    begin
      drgrdPontos.Cells[iNumColunas, c] := IntToStr(Celulas[iNumColunas, c]);
      if (Celulas[iNumColunas, c] > iMaxCel) then
        iMaxCel := Celulas[iNumColunas, c];
    end;

    CdsGrupo.Next;
    Inc(iNumColunas);
  end;
  drgrdPontos.OnDrawCell := drgrdPontosDrawCell;
  drgrdPontos.Visible := (iNumColunas > 0);
end;

end.
