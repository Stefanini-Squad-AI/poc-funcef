unit fDistrPont;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda, TB97,
  TB97Tlbr, StdCtrls, Spin, MAHlpBtn, Buttons, ExtCtrls, Grids, Db, Wwdatsrc, DBTables,
  Wwtable, IvDictio, IvMulti, IvEMulti, DBClient, uCMClientDataSet, uCtrlDistrPontuacao;

type
  TfrmDistrPont = class(TfrmSairAjuda)
    dsGrupo: TwwDataSource;
    dsCargo: TwwDataSource;
    drgrdPontos: TStringGrid;
    bbtnAtualizar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    Panel1: TPanel;
    Label3: TLabel;
    spedMax: TSpinEdit;
    Label1: TLabel;
    spedEscala: TSpinEdit;
    Label2: TLabel;
    CdsGrupo: TCMClientDataSet;
    CdsCargo: TCMClientDataSet;
    CdsPesoGrupo: TCMClientDataSet;
    CdsGrauCargo: TCMClientDataSet;
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
  frmDistrPont: TfrmDistrPont;

implementation

uses uCtrlPadroes;

{$R *.DFM}

procedure TfrmDistrPont.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlDistrPontuacao := TCtrlDistrPontuacao.Create;
  CtrlDistrPontuacao.InitializeAs(Padroes);

  CdsGrupo.Data := CtrlDistrPontuacao.ListGrupoFunc;
  CdsCargo.Data := CtrlDistrPontuacao.ListCargo;
  CdsPesoGrupo.Data := CtrlDistrPontuacao.ListPesoGrupo;
  CdsGrauCargo.Data := CtrlDistrPontuacao.ListGrauCargo;

  bbtnAtualizarClick(Sender);
end;

procedure TfrmDistrPont.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlDistrPontuacao);
  inherited;
end;

procedure TfrmDistrPont.FormResize(Sender: TObject);
begin
  inherited;
  bbtnAtualizarClick(Sender);
end;

procedure TfrmDistrPont.drgrdPontosDrawCell(Sender: TObject; Col,Row: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Rw, Cl: Integer;
  Retang: TRect;
begin
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

procedure TfrmDistrPont.bbtnAtualizarClick(Sender: TObject);
var
  c: integer;
  Maximos, Minimos: array of integer;
  iMaxVal, iMinVal, iStepVal, iTotPontos, iNumLinhas: integer;
begin
  // Calcular e atribuir as colunas
  iNumColunas := CdsGrupo.RecordCount;
  drgrdPontos.ColCount := iNumColunas + 1;
  drgrdPontos.DefaultColWidth := Round((drgrdPontos.Width - iNumColunas-2) / (iNumColunas+1));

  // Calcular e atribuir as linhas
  iNumLinhas := Round(100 / spedEscala.Value);
  if (Frac(100 / spedEscala.Value) > 0) and (Frac(100 / spedEscala.Value) <= 0.5) then
    Inc(iNumLinhas);
  drgrdPontos.RowCount := iNumLinhas + 1;

  // Atribuir o título das colunas
  c:=1;
  CdsGrupo.First;
  while not(CdsGrupo.EOF) do
  begin
    drgrdPontos.Cells[c, 0] := CdsGrupo.FieldByName('CODGRPFUNC').asString;
    CdsGrupo.Next;
    Inc(c);
  end;  
  CdsGrupo.First;

  SetLength(Minimos, iNumLinhas);    
  SetLength(Maximos, iNumLinhas);
  Celulas := VarArrayCreate([1, iNumColunas, 1, iNumLinhas], varInteger);

  // Atribuir o título das linhas  
  iMaxVal := spedMax.Value;
  iStepVal := Round(spedEscala.Value * spedMax.Value / 100);
  for c:=1 to iNumLinhas do
  begin
    iMinVal := iMaxVal - iStepVal + 1;
    if (iMinVal < 0) or (iMinVal = 1) then
      iMinVal := 0;
    Maximos[c-1] := iMaxVal;
    Minimos[c-1] := iMinVal;
    drgrdPontos.Cells[0, c] := IntToStr(iMinVal) + '-' + IntToStr(iMaxVal);
    iMaxVal := iMinVal - 1;
  end;

  // Atribuir os valores  
  iNumColunas := 1;
  CdsGrupo.First;
  while not(CdsGrupo.EOF) do
  begin
    CdsCargo.First;
    while not(CdsCargo.EOF) do
    begin
      // Calcular os pontos do cargo
      iTotPontos := 0;
      CdsGrauCargo.First;
      while not(CdsGrauCargo.EOF) do
      begin
        if (CdsPesoGrupo.Locate('CODGRPFUNC;IDFATORAVAL', VarArrayOf([
                                CdsGrupo.FieldByName('CODGRPFUNC').asString,
                                CdsGrauCargo.FieldByName('IDFATORAVAL').asInteger]), [])) then
          iTotPontos := iTotPontos + CdsPesoGrupo.FieldByName('PESO').asInteger *
                                     CdsGrauCargo.FieldByName('GRAU').asInteger;
        CdsGrauCargo.Next;
      end;

      for c:=1 to iNumLinhas do
      begin
        if (iTotPontos >= Minimos[c-1]) and (iTotPontos <= Maximos[c-1]) then
        begin
          Celulas[iNumColunas, c] := Celulas[iNumColunas, c] + 1;
          break;
        end;
      end;
      CdsCargo.Next;
    end;

    // Atribuir os valores da coluna atual
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
