{Nome     : Henrique Massão
SOL       : 117141
Kintana   : 594895
Data:     : 20/08/2009
Rotina    : gbxTipContra
Descrição :  Alterar os tipos de contrato no módulo conforme segue: Efetivo - manter o mesmo
  Efetivo Especial - alterar para LEF
  Temporário - alterar para Terceirizado
  Estagiário - manter o mesmo
  Terceiro - alterar para Cessão
  Prop/Dir s/Vinc - manter o mesmo
  Autônomo - - manter o mesmo
  Não é necessário alterar a nomenclatura utilizada nas fórmulas de cálculo das rubricas,
  mas em todos os relatórios e telas em que a informação aparece.}

unit fParamResFol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Spin,
  Wwdatsrc, DBTables, wwdblook, checklst, ComCtrls, Grids, DBGrids, DBClient, CmParamReport,
  uCMClientDataSet, fParamReports_Padrao, uCtrlMotivo, uCtrlProvDesc, uCtrlListTerceirosRH,
  uCtrlPessoaFilialPessoa, uCtrlGlobalRH, ColorCheckListBox;

type
  TfrmParamResFol = class(TfrmParamReports_Padrao)
    Paginas: TPageControl;
    tbshTipoFolha: TTabSheet;
    chklstTipoFolha: TColorCheckListBox;
    tbsRubrica: TTabSheet;
    Label1: TLabel;
    chklstRubrica: TColorCheckListBox;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    tbshCCusto: TTabSheet;
    chklstCCusto: TColorCheckListBox;
    spbtSelTodos: TBitBtn;
    spbtInvSelecao: TBitBtn;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    rgProcesso: TRadioGroup;
    rgRubApoio: TRadioGroup;
    rgImprimeTipoProcesso: TRadioGroup;
    gbxAnoMesRef: TGroupBox;
    rgAutoriza: TRadioGroup;
    gbxAgruparPor: TGroupBox;
    cmbAgruparPor: TComboBox;
    CdsEstab: TCMClientDataSet;
    chkTipoIntervalo: TCheckBox;
    lblPerIni: TLabel;
    cmbMesIni: TComboBox;
    speAnoIni: TSpinEdit;
    lblPerFin: TLabel;
    cmbMesFin: TComboBox;
    speAnoFin: TSpinEdit;
    rgBuscaHist: TRadioGroup;
    tbshFiltroFunc: TTabSheet;
    gbxTipContra: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxEspeciais: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxPropDirSemVinc: TCheckBox;
    cbxAutonomos: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure chklstTipoFolhaClickCheck(Sender: TObject);
    procedure spbtSelTodosClick(Sender: TObject);
    procedure spbtInvSelecaoClick(Sender: TObject);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure chkTipoIntervaloClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
  private
    CtrlMotivo: TCtrlMotivo;
    CtrlProvDesc: TCtrlProvDesc;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;

    chklstAux: TColorCheckListBox;
    ListaIdTipoFolha, ListaIdRubrica, ListaCodCCusto: TStringList;

    sListaIdRubricaSel: string;

    procedure HabilitaBtOk;
  end;

var
  frmParamResFol: TfrmParamResFol;

implementation

uses uSistema, uMensErro, fAguarde, dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamResFol.FormCreate(Sender: TObject);
var
  NormalIni: TDate;
begin
  inherited;
  ListaIdTipoFolha := TStringList.Create;
  ListaIdRubrica := TStringList.Create;
  ListaCodCCusto := TStringList.Create;

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  // Apagar o índice se este existir
  dmCds.Cds.IndexName := '';
  if (dmCds.Cds.IndexDefs.IndexOf('Index1') > 0) then
    dmCds.Cds.DeleteIndex('Index1');

  // Montar Lista de Tipos de Folha
  chklstTipoFolha.Items.Clear;
  dmCds.Cds.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F,D');
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdTipoFolha.Add(dmCds.Cds.FieldByName('IDMOTIVO').asString);
    chklstTipoFolha.Items.Add(dmCds.Cds.FieldByName('DESCRICAO').asString);
    dmCds.Cds.Next;
  end;

  // Montar Lista de Rubricas
  chklstRubrica.Items.Clear;
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdRubrica.Add(dmCds.Cds.FieldByName('CODPROVDESC').asString);
    chklstRubrica.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    dmCds.Cds.Next;
  end;

  // Montar Lista de C. Custo
  chklstCCusto.Items.Clear;
  dmCds.Cds.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodCCusto.Add(Trim(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString));
    chklstCCusto.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;

  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));

  NormalIni := CtrlGlobalRH.GetNormalIni;
  cmbMesIni.ItemIndex := FU.ExtraiMes(NormalIni) - 1;
  cmbMesFin.ItemIndex := cmbMesIni.ItemIndex;
  speAnoIni.Value := FU.ExtraiAno(NormalIni);
  speAnoFin.Value := speAnoIni.Value;

  cmbAgruparPor.ItemIndex := 0;
  Paginas.ActivePageIndex := 0;
  chkTipoIntervaloClick(Sender);
  PaginasChange(Sender);

  HabilitaBtOk;
end;

procedure TfrmParamResFol.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(ListaIdTipoFolha);
  FreeAndNil(ListaIdRubrica);
  FreeAndNil(ListaCodCCusto);

  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlGlobalRH);
  inherited;
end;

procedure TfrmParamResFol.dblkcbEstabChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamResFol.PaginasChange(Sender: TObject);
begin
  case (Paginas.ActivePageIndex) of
    0 : chklstAux := chklstTipoFolha;
    1 : chklstAux := chklstRubrica;
    2 : chklstAux := chklstCCusto;
  end;
end;

procedure TfrmParamResFol.chklstTipoFolhaClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamResFol.chklstRubricaClickCheck(Sender: TObject);
begin
  inherited;
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
  edCodRubricas.Text := sListaIdRubricaSel;
end;

procedure TfrmParamResFol.spbtSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  if (Paginas.ActivePageIndex < 3) then
  begin
    for c:=0 to chklstAux.Items.Count-1 do
      chklstAux.Checked[c] := true;
    chklstAux.Repaint;

    case (Paginas.ActivePageIndex) of
      0 : HabilitaBtOk;
      1 :
      begin
        FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
        edCodRubricas.Text := sListaIdRubricaSel;
      end;
    end;
  end
  else
  begin
    cbxEfetivos.Checked := true;
    cbxEspeciais.Checked := true;
    cbxTemporarios.Checked := true;
    cbxEstagiarios.Checked := true;
    cbxTerceiros.Checked := true;
    cbxPropDirSemVinc.Checked := true;
    cbxAutonomos.Checked := true;
  end;
end;

procedure TfrmParamResFol.spbtInvSelecaoClick(Sender: TObject);
var
  c: integer;
begin
  if (Paginas.ActivePageIndex < 3) then
  begin
    for c:=0 to chklstAux.Items.Count-1 do
      chklstAux.Checked[c] := not(chklstAux.Checked[c]);
    chklstAux.Repaint;

    case (Paginas.ActivePageIndex) of
      0 : HabilitaBtOk;
      1 :
      begin
        FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
        edCodRubricas.Text := sListaIdRubricaSel;
      end;
    end;
  end
  else
  begin
    cbxEfetivos.Checked := not cbxEfetivos.Checked;
    cbxEspeciais.Checked := not cbxEspeciais.Checked;
    cbxTemporarios.Checked := not cbxTemporarios.Checked;
    cbxEstagiarios.Checked := not cbxEstagiarios.Checked;
    cbxTerceiros.Checked := not cbxTerceiros.Checked;
    cbxPropDirSemVinc.Checked := not cbxPropDirSemVinc.Checked;
    cbxAutonomos.Checked := not cbxAutonomos.Checked;
  end;
end;

procedure TfrmParamResFol.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  FU.VerificaOpcoes(chklstRubrica, ListaIdRubrica, edCodRubricas.Text, ',');
  HabilitaBtOk;
  chklstRubrica.Repaint;
end;

procedure TfrmParamResFol.chkTipoIntervaloClick(Sender: TObject);
begin
  cmbMesFin.Visible := (chkTipoIntervalo.Checked);
  speAnoFin.Visible := (chkTipoIntervalo.Checked);
  lblPerIni.Visible := (chkTipoIntervalo.Checked);
  lblPerFin.Visible := (chkTipoIntervalo.Checked);
end;

procedure TfrmParamResFol.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  c: integer;
  sListaIdTipoFolhaSel, sListaCodCCustoSel, sListaNomeTipoFolha: string;
begin
  // Tipos de Folha selecionados
  FU.CriaListaOpcoes(chklstTipoFolha, ListaIdTipoFolha, sListaIdTipoFolhaSel, ',', false);

  sListaNomeTipoFolha := '';
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    if (chklstTipoFolha.Checked[c]) then
    begin
      if (sListaNomeTipoFolha = '') then
        sListaNomeTipoFolha := sListaNomeTipoFolha + chklstTipoFolha.Items[c]
      else
        sListaNomeTipoFolha := sListaNomeTipoFolha +' - '+ chklstTipoFolha.Items[c];
    end;

  // Rubrica(s) selecionada(s)
  wNum := FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', true);
  if (wNum = ListaIdRubrica.Count) then
    sListaIdRubricaSel := '';

  // C. de Custo selecionados
  FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', true);

  Cmp_Padrao.ParamByName('IdEmpresa').asInteger := Sistema.IdEmpresa;
  Cmp_Padrao.ParamByName('IdEstab').asFloat := CdsEstab.FieldByName('IDPESSOA').asFloat;
  Cmp_Padrao.ParamByName('SelIntervalo').asBoolean := chkTipoIntervalo.Checked;
  Cmp_Padrao.ParamByName('MesInicial').asInteger := cmbMesIni.ItemIndex+1;
  Cmp_Padrao.ParamByName('AnoInicial').asInteger := speAnoIni.Value;
  Cmp_Padrao.ParamByName('MesFinal').asInteger := cmbMesFin.ItemIndex+1;
  Cmp_Padrao.ParamByName('AnoFinal').asInteger := speAnoFin.Value;
  Cmp_Padrao.ParamByName('BuscaHist').asBoolean := (rgBuscaHist.ItemIndex = 0);
  Cmp_Padrao.ParamByName('ListaCodCCusto').asString := sListaCodCCustoSel;
  Cmp_Padrao.ParamByName('ListaIdRubrica').asString := sListaIdRubricaSel;
  Cmp_Padrao.ParamByName('ListaIdTipoFolha').asString := sListaIdTipoFolhaSel;
  Cmp_Padrao.ParamByName('ListaNomeTipoFolha').asString := sListaNomeTipoFolha;
  Cmp_Padrao.ParamByName('SelRubricaApoio').asBoolean := (rgRubApoio.ItemIndex = 1);
  Cmp_Padrao.ParamByName('ImprimeRodape').asBoolean := (rgAutoriza.ItemIndex = 0);
  Cmp_Padrao.ParamByName('AgruparPor').asInteger := cmbAgruparPor.ItemIndex;
  Cmp_Padrao.ParamByName('ImprimeTipoProcesso').asBoolean :=
    (rgImprimeTipoProcesso.ItemIndex = 0);
  Cmp_Padrao.ParamByName('TipoContrato').asString := FU.GerarListaTipoContratoSel(
    cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
    cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked, true);

  if (rgProcesso.ItemIndex = 0) then
    Cmp_Padrao.ParamByName('NomeTabela').asString := 'PREVIAFOLPAG'
  else
    Cmp_Padrao.ParamByName('NomeTabela').asString := 'HISTRUBSAL';

  frmAguarde.Mostra('Resumo da Folha de Pagamento');
  frmAguarde.Pos := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamResFol.HabilitaBtOk;
var
  c: integer;
  bSelecionado: boolean;
begin
  // Verifica se algum Tipo de Folha foi selecionado
  bSelecionado := false;
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    if (chklstTipoFolha.Checked[c]) then
    begin
      bSelecionado := true;
      break;
    end;

  bbtnConfirmar.Enabled := (Trim(dblkcbEstab.Text) <> '') and (bSelecionado);
end;

end.
