unit fParamCadFormaCalc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwdatsrc, Mask, wwdbedit,
  Wwdotdot, Wwdbcomb, Machklb, wwdblook, checklst, Spin, IvDictio, IvMulti, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, fParamReports_Padrao, CmParamReport, ColorCheckListBox, DBClient,
  uCMClientDataSet, IvEMulti, uCtrlCadRegra, uCtrlListTerceirosRH;

type
  TfrmParamCadFormaCalc = class(TfrmParamReports_Padrao)
    rgSituacaoRubSel: TRadioGroup;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    CdsFormaCalc: TCMClientDataSet;
    gbxProcExpressao: TGroupBox;
    edExpressao: TEdit;
    pgctrlPrincipal: TPageControl;
    tbshFormaCalc: TTabSheet;
    tbshTipoFormaCalc: TTabSheet;
    chklstFormaCalc: TColorCheckListBox;
    bbtnSelTodasFormaCalc: TBitBtn;
    bbtnInverteSelFormaCalc: TBitBtn;
    chklstTipoFormaCalc: TColorCheckListBox;
    bbtnSelTodasTipoFormaCalc: TBitBtn;
    bbtnInverteSelTipoFormaCalc: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstFormaCalcClickCheck(Sender: TObject);
    procedure bbtnSelTodasFormaCalcClick(Sender: TObject);
    procedure bbtnInverteSelFormaCalcClick(Sender: TObject);
    procedure rgSituacaoRubSelClick(Sender: TObject);
    procedure bbtnSelTodasTipoFormaCalcClick(Sender: TObject);
    procedure bbtnInverteSelTipoFormaCalcClick(Sender: TObject);
  private
    CtrlCadRegra: TCtrlCadRegra;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    ListaIdTipoFormaCalc, ListaIdFormaCalc: TStringList;

    sListaIdTipoFormaCalcSel, sListaIdFormaCalcSel: string;

    procedure HabilitaBtOk;
    procedure GerarListaRubricas(SituacaoRub: integer);
  end;

var
  frmParamCadFormaCalc: TfrmParamCadFormaCalc;

implementation

uses fAguarde, uCtrlPadroes, uCtrlFuncoesRH, dCds;

const
  PUBLICADA = 0;
  NAO_PUBLICADA = 1;
  AMBAS = 2;

{$R *.DFM}

procedure TfrmParamCadFormaCalc.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCadRegra := TCtrlCadRegra.Create;
  CtrlCadRegra.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create('','','');
  CtrlListTerceirosRH.InitializeAs(Padroes);

  ListaIdTipoFormaCalc := TStringList.Create;
  ListaIdFormaCalc := TStringList.Create;

  // Apagar o índice se este existir
  dmCds.Cds.IndexName := '';
  if (dmCds.Cds.IndexDefs.IndexOf('Index1') > 0) then
    dmCds.Cds.DeleteIndex('Index1');

  dmCds.Cds.Data := CtrlListTerceirosRH.ListGrupoRegra;
  ListaIdTipoFormaCalc.Clear;
  chklstTipoFormaCalc.Items.Clear;
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdTipoFormaCalc.Add(dmCds.Cds.FieldByName('IDTIPOREGRA').asString);
    chklstTipoFormaCalc.Items.Add(dmCds.Cds.FieldByName('DESCREGRA').asString);
    chklstTipoFormaCalc.Checked[chklstTipoFormaCalc.Items.Count-1] := true;
    dmCds.Cds.Next;
  end;

  CdsFormaCalc.Data := CtrlCadRegra.ListFormaCalc;
  GerarListaRubricas(AMBAS);

  cmbOrderBy.ItemIndex := 0;
  pgctrlPrincipal.ActivePageIndex := 0;
end;

procedure TfrmParamCadFormaCalc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(ListaIdFormaCalc);
  FreeAndNil(ListaIdTipoFormaCalc);

  FreeAndNil(CtrlCadRegra);
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TfrmParamCadFormaCalc.chklstFormaCalcClickCheck(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamCadFormaCalc.bbtnSelTodasFormaCalcClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFormaCalc.Items.Count-1 do
    chklstFormaCalc.Checked[c] := true;
  chklstFormaCalc.Repaint;
  chklstFormaCalcClickCheck(Sender);
end;

procedure TfrmParamCadFormaCalc.bbtnInverteSelFormaCalcClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFormaCalc.Items.Count-1 do
    chklstFormaCalc.Checked[c] := not(chklstFormaCalc.Checked[c]);
  chklstFormaCalc.Repaint;
  chklstFormaCalcClickCheck(Sender);
end;

procedure TfrmParamCadFormaCalc.bbtnSelTodasTipoFormaCalcClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoFormaCalc.Items.Count-1 do
    chklstTipoFormaCalc.Checked[c] := true;
  chklstTipoFormaCalc.Repaint;
  rgSituacaoRubSelClick(Sender);
end;

procedure TfrmParamCadFormaCalc.bbtnInverteSelTipoFormaCalcClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoFormaCalc.Items.Count-1 do
    chklstTipoFormaCalc.Checked[c] := not(chklstTipoFormaCalc.Checked[c]);
  chklstTipoFormaCalc.Repaint;
  rgSituacaoRubSelClick(Sender);
end;

procedure TfrmParamCadFormaCalc.rgSituacaoRubSelClick(Sender: TObject);
begin
  GerarListaRubricas(rgSituacaoRubSel.ItemIndex);
end;

procedure TfrmParamCadFormaCalc.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
begin
  // Forma(s) de Cálculo selecionada(s)
  wNum := FU.CriaListaOpcoes(chklstFormaCalc, ListaIdFormaCalc, sListaIdFormaCalcSel, ',', true);
  if (wNum = ListaIdFormaCalc.Count) then
    sListaIdFormaCalcSel := '';

  Cmp_Padrao.ParamByName('ListaIdFormaCalc').asString := sListaIdFormaCalcSel;
  Cmp_Padrao.ParamByName('ListaIdTipoFormaCalc').asString := sListaIdTipoFormaCalcSel;
  Cmp_Padrao.ParamByName('SituacaoRubSel').asInteger := rgSituacaoRubSel.ItemIndex;
  Cmp_Padrao.ParamByName('Expressao').asString := edExpressao.Text;
  Cmp_Padrao.ParamByName('Ordenacao').asInteger := cmbOrderBy.ItemIndex;

  frmAguarde.Mostra('Cadastro de Formas de Cálculo');
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamCadFormaCalc.HabilitaBtOk;
begin
  FU.CriaListaOpcoes(chklstFormaCalc, ListaIdFormaCalc, sListaIdFormaCalcSel, ',', true);

  bbtnConfirmar.Enabled := (sListaIdFormaCalcSel <> '');
end;

procedure TfrmParamCadFormaCalc.GerarListaRubricas(SituacaoRub: integer);
begin
  FU.CriaListaOpcoes(chklstTipoFormaCalc, ListaIdTipoFormaCalc, sListaIdTipoFormaCalcSel, ',', false);

  edExpressao.Text := Trim(edExpressao.Text);
  ListaIdFormaCalc.Clear;
  chklstFormaCalc.Items.BeginUpdate;
  chklstFormaCalc.Items.Clear;
  CdsFormaCalc.First;
  while not(CdsFormaCalc.EOF) do
  begin
    if ((SituacaoRub = AMBAS) or
        ((SituacaoRub = PUBLICADA) and (CdsFormaCalc.FieldByName('PUBLICADA').asInteger = 1)) or
        ((SituacaoRub = NAO_PUBLICADA) and (CdsFormaCalc.FieldByName('PUBLICADA').asInteger <> 1))) and
       ((edExpressao.Text = '') or
        ((edExpressao.Text <> '') and
         (Pos(edExpressao.Text, CdsFormaCalc.FieldByName('DESCRICAOREGRA').asString) > 0))) and
       (FU.VerificaCodigoEm(sListaIdTipoFormaCalcSel, CdsFormaCalc.FieldByName('IDTIPOREGRA').asString,',') > 0) then
    begin
      ListaIdFormaCalc.Add(CdsFormaCalc.FieldByName('IDREGRA').asString);
      chklstFormaCalc.Items.Add(CdsFormaCalc.FieldByName('NOMEREGRA').asString);
      chklstFormaCalc.Checked[chklstFormaCalc.Items.Count-1] := true;
    end;
    CdsFormaCalc.Next;
  end;
  chklstFormaCalc.Items.EndUpdate;
  HabilitaBtOk;
end;

end.
