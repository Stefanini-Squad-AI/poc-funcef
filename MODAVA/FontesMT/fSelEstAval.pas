unit fSelEstAval;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  Db, DBTables, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls,
  OleCtrls, chartfx3, TB97, ComCtrls, IvDictio, IvMulti, IvEMulti, TB97Tlbr, DBClient,
  wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams, uCMClientDataSet, CmParamReport,
  TREdit, uCtrlTipAval, uCtrlSelEstAval;

type
  TfrmSelEstAval = class(TfrmSelPessoalMT)
    Chart1: TChartfx;
    tbshGrafico: TTabSheet;
    gbxFaixaData: TGroupBox;
    Label9: TLabel;
    edDataInicial: TCMDateTimePicker;
    edDataFinal: TCMDateTimePicker;
    gbxValores: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    ednMin1: TRealEdit;
    ednMax1: TRealEdit;
    ednMax2: TRealEdit;
    ednMin2: TRealEdit;
    ednMax3: TRealEdit;
    ednMin3: TRealEdit;
    ednMax4: TRealEdit;
    ednMin4: TRealEdit;
    ednMax5: TRealEdit;
    ednMin5: TRealEdit;
    ednMax6: TRealEdit;
    ednMin6: TRealEdit;
    ednMax7: TRealEdit;
    ednMin7: TRealEdit;
    ednMax8: TRealEdit;
    ednMin8: TRealEdit;
    CdsTipAval: TCMClientDataSet;
    gbxTipAval: TGroupBox;
    dblckTipoAval: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edDataInicialChange(Sender: TObject);
  private
    CtrlTipAval: TCtrlTipAval;
    CtrlSelEstAval: TCtrlSelEstAval;

    procedure HabilitarBtOk;
  end;

var
  frmSelEstAval: TfrmSelEstAval;

implementation

uses uCtrlPadroes, fAguarde, dCds;

{$R *.DFM}

procedure TfrmSelEstAval.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipAval := TCtrlTipAval.Create;
  CtrlTipAval.InitializeAs(Padroes);

  CtrlSelEstAval := TCtrlSelEstAval.Create;
  CtrlSelEstAval.InitializeAs(Padroes);

  CdsTipAval.Data := CtrlTipAval.ListTipoAval;
  dblckTipoAval.LookupValue := CdsTipAval.FieldByName('CODTIPOAVAL').asString;
  dblckTipoAval.Update;

  edDataInicial.Date := Date - 365;
  edDataFinal.Date := Date;

  IrPaginaResult := false;
  cbxCandidatos.Enabled := false;
  rgSequencia.Visible := false;
  HabilitarBtOk;
end;

procedure TfrmSelEstAval.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipAval);
  FreeAndNil(CtrlSelEstAval);
  inherited;
end;

procedure TfrmSelEstAval.edDataInicialChange(Sender: TObject);
begin
  HabilitarBtOk;
end;

procedure TfrmSelEstAval.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  rgSequencia.Visible := false;
end;

procedure TfrmSelEstAval.bbtnConfirmarClick(Sender: TObject);
var
  c, TotQtdAva: integer;
  YMax: double;
  iTamGrafico: integer;
  MinMax: array[1..8, 1..8] of integer;
  sListaIdFunc: string;
begin
  frmAguarde.Mostra('Selecionando Dados...');
  frmAguarde.Min := 0;
  frmAguarde.Pos := 0;
  inherited;
  sListaIdFunc := '';
  while not(CdsPrincipal.EOF) do
  begin
    if (sListaIdFunc = '') then
      sListaIdFunc := CdsPrincipal.FieldByName('IDPESSOA').asString
    else
      sListaIdFunc := sListaIdFunc +','+ CdsPrincipal.FieldByName('IDPESSOA').asString;

    CdsPrincipal.Next;
  end;
  dmCds.Cds.Data := CtrlSelEstAval.ListHistorico(sListaIdFunc,
    CdsTipAval.FieldByName('CODTIPOAVAL').asFloat, edDataInicial.Date, edDataFinal.Date);

  frmAguarde.Max := dmCds.Cds.Recordcount;
  frmAguarde.Update;

  iTamGrafico := 0;
  for c:=1 to 8 do
    if (TRealEdit(Self.FindComponent('ednMax'+IntToStr(c))).Value <> 0) then
    begin
      Inc(iTamGrafico);
      Chart1.Legend[c-1] :=
        TRealEdit(Self.FindComponent('ednMin'+IntToStr(c))).Text +' a '+
        TRealEdit(Self.FindComponent('ednMax'+IntToStr(c))).Text;

      MinMax[1,c] := Round(TRealEdit(Self.FindComponent('ednMin'+IntToStr(c))).Value);
      MinMax[2,c] := Round(TRealEdit(Self.FindComponent('ednMax'+IntToStr(c))).Value);
    end;

  frmAguarde.Mostra('Gerando Gráfico...');
  frmAguarde.Update;

  Chart1.OpenDataEx(1, 1, iTamGrafico);
  Chart1.ThisSerie := 0;
  Chart1.Decimals := 0;
  TotQtdAva := 0;
  Chart1.Title[2] := 'Estatística por Faixa de Pontuação';

  for c:=0 to iTamGrafico-1 do
    Chart1.Value[c] := 0;

  while not(dmCds.Cds.EOF) do
  begin
    for c:=0 to iTamGrafico-1 do
      if (dmCds.Cds.FieldByName('AVALIACAO').asInteger >= MinMax[1,c+1]) and
         (dmCds.Cds.FieldByName('AVALIACAO').asInteger <= MinMax[2,c+1]) then
        Chart1.Value[c] := Chart1.Value[c] + 1;

    dmCds.Cds.Next;
    frmAguarde.Pos := frmAguarde.Pos + 1;
    frmAguarde.Update;
  end;

  for c:=0 to iTamGrafico-1 do
    TotQtdAva := TotQtdAva + Round(Chart1.Value[c]);
  Chart1.Title[3] := 'Total de Avaliações: ' +IntToStr(TotQtdAva);

  YMax := 0;
  for c:=0 to iTamGrafico-1 do
    if (Chart1.Value[c] > YMax) then
      YMax := Chart1.Value[c];

  Chart1.Adm[1] := YMax;
  Chart1.CloseData(1);

  ExecutarIrPaginaResult;
  frmAguarde.Apaga;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmSelEstAval.HabilitarBtOk;
begin
  bbtnConfirmar.Enabled := (edDataInicial.Text <> '') and (edDataFinal.Text <> '') and
    (edDataInicial.Date <= edDataFinal.Date) and (ednMax1.Value <> 0);
end;

end.
