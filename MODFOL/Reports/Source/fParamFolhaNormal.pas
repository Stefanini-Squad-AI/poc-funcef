// *****************************************************************************
// ********************** REGISTRO DE ALTERAÇÕES *******************************
//Rotina...........: CriaListaOpcoesIN
//Nº SIG...........: 72346
//Data da Alteração: 27/07/2018
//Responsável......: Taffarel Sevaybriker
//Descrição........: Erro na condição IN com mais de 1000 registros.
// *****************************************************************************
// Autor(a)    :  Marcelo Cardoso
// Data        :  30/06/2014
// DFM         :  Ordernar as rubricas por nome QueryRelatorio
// Pendência   :  SOL 256773 PPM 850577
// Descricao   :  Solicitamos verificar o erro na geração do relatório
//FOLHA DE PAGAMENTO NORMAL, pois não está ordenando as rubricas por nome,
//conforme parametrização no arquivo anexo.
//-----------------------------------------------------------------------------
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

unit fParamFolhaNormal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, checklst,
  Spin, wwdblook, Db, DBTables, ComCtrls, fSairAjuda, DBClient, uCMClientDataSet,
  fParamReports_Padrao, CmParamReport, uCtrlPessoaFilialPessoa, uCtrlGlobalRH,
  uCtrlPessoaFuncionario, uCtrlMotivo, uCtrlListTerceirosRH,
  ColorCheckListBox;

type
  TfrmParamFolhaNormal = class(TfrmParamReports_Padrao)
    CdsEstab: TCMClientDataSet;
    Paginas1: TPageControl;
    tbshTipoFolha: TTabSheet;
    chklstTipoFolha: TColorCheckListBox;
    tbshCCusto: TTabSheet;
    chklstCCusto: TColorCheckListBox;
    spbtSelTodosTipFol: TBitBtn;
    spbtInvSelecaoTipFol: TBitBtn;
    gbxMesAnoRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    rgProcesso: TRadioGroup;
    rgImprimeTipoProcesso: TRadioGroup;
    rgAgruparPorCCusto: TRadioGroup;
    gbxFunc: TGroupBox;
    Paginas2: TPageControl;
    tbshListaFunc: TTabSheet;
    chklstFunc: TColorCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    tbshFiltroFunc: TTabSheet;
    gbxTipContra: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxEspeciais: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxPropDirSemVinc: TCheckBox;
    cbxAutonomos: TCheckBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    cbxDemitidos: TCheckBox;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    rgOrdemRubrica: TRadioGroup;
    chkBuscaHist: TCheckBox;
    tbshEstabelecimento: TTabSheet;
    chklstEstab: TColorCheckListBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure chklstTipoFolhaClickCheck(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure spbtInvSelecaoTipFolClick(Sender: TObject);
    procedure spbtSelTodosTipFolClick(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
    procedure chklstCCustoClickCheck(Sender: TObject);
    procedure cmbOrderByChange(Sender: TObject);
  private
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlMotivo: TCtrlMotivo;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    chkListAux: TColorCheckListBox;
    ListaIdTipoFolha, ListaCodCCusto, ListaIdFunc, ListaIdEstab: TStringList;

    sListaIdEstabSel: string;
    bSitAtivo, bSitAfast, bSitDemit, bTipContrEfet, bTipContrEspec, bTipContrTemp,
    bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;
    FlgNivelIndiv: integer;
    sListaCodCCustoSel: string;

    procedure MontaListaFuncionarios;
    procedure HabilitaBtOk;
  end;

var
  frmParamFolhaNormal: TfrmParamFolhaNormal;

implementation

uses uSistema, uMensErro, fAguarde, dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamFolhaNormal.FormCreate(Sender: TObject);
var
  c: byte;
begin
  inherited;
  ListaIdEstab := TStringList.Create;
  ListaIdTipoFolha := TStringList.Create;
  ListaCodCCusto := TStringList.Create;
  ListaIdFunc := TStringList.Create;

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  // Montar a Lista de Tipos de Folha
  chklstTipoFolha.Items.Clear;
  dmCds.Cds.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F,D');
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdTipoFolha.Add(dmCds.Cds.FieldByName('IDMOTIVO').asString);
    chklstTipoFolha.Items.Add(dmCds.Cds.FieldByName('DESCRICAO').asString);
    dmCds.Cds.Next;
  end;

  // Montar a Lista de C. Custo
  chklstCCusto.Items.Clear;
  dmCds.Cds.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodCCusto.Add(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString);
    chklstCCusto.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;

  // Preenche ChkList de Estabelecimentos
  c := 0;
  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  while not(CdsEstab.EOF) do
  begin
    ListaIdEstab.Add(CdsEstab.FieldByName('IDPESSOA').asString);
    chklstEstab.Items.Add(CdsEstab.FieldByName('NOME').asString);
    chklstEstab.Checked[c] := true;
    CdsEstab.Next;
    Inc(c);
  end;

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('NORMALINI, FLGNIVELINDIV');
  FlgNivelIndiv := dmCds.Cds.FieldByName('FLGNIVELINDIV').asInteger;
  cmbMes.ItemIndex := FU.ExtraiMes(dmCds.Cds.FieldByName('NORMALINI').asDateTime) - 1;
  speAno.Value := FU.ExtraiAno(dmCds.Cds.FieldByName('NORMALINI').asDateTime);

  cmbOrderBy.ItemIndex := 0;
  Paginas1.ActivePageIndex := 0;
  Paginas2.ActivePageIndex := 0;
  MontaListaFuncionarios;
end;

procedure TfrmParamFolhaNormal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(ListaIdTipoFolha);
  FreeAndNil(ListaCodCCusto);
  FreeAndNil(ListaIdFunc);
  FreeAndNil(ListaIdEstab);
  inherited;
end;

procedure TfrmParamFolhaNormal.speAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamFolhaNormal.cmbOrderByChange(Sender: TObject);
begin
  rgAgruparPorCCusto.Enabled := (cmbOrderBy.ItemIndex > 1);
  if not(rgAgruparPorCCusto.Enabled) then
    rgAgruparPorCCusto.ItemIndex := 1;
end;

procedure TfrmParamFolhaNormal.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmParamFolhaNormal.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := (cbxAtivos.Checked);
  bSitAfast := (cbxAfastados.Checked);
  bSitDemit := (cbxDemitidos.Checked);
end;

procedure TfrmParamFolhaNormal.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked) and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked) and not(cbxTerceiros.Checked) and
     not(cbxPropDirSemVinc.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Contrato deve ser selecionado.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    cbxEfetivos.SetFocus;
  end
  else
  if (bTipContrEfet <> cbxEfetivos.Checked) or (bTipContrEspec <> cbxEspeciais.Checked) or
     (bTipContrTemp <> cbxTemporarios.Checked) or (bTipContrEst <> cbxEstagiarios.Checked) or
     (bTipContrTerc <> cbxTerceiros.Checked) or (bTipContrProp <> cbxPropDirSemVinc.Checked) or
     (bTipContrAut <> cbxAutonomos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamFolhaNormal.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Situação deve ser selecionado.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) or
     (bSitDemit <> cbxDemitidos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamFolhaNormal.chklstTipoFolhaClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamFolhaNormal.chklstCCustoClickCheck(Sender: TObject);
begin
  inherited;
  MontaListaFuncionarios;
end;

procedure TfrmParamFolhaNormal.spbtSelTodosTipFolClick(Sender: TObject);
var
  c: integer;
begin
  case (Paginas1.ActivePageIndex) of
    0 : chkListAux := chklstTipoFolha;
    1 : chkListAux := chklstCCusto;
    2 : chkListAux := chklstEstab;
  end;

  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := true;
  chkListAux.Repaint;

  if (Paginas1.ActivePageIndex > 0) then
    MontaListaFuncionarios;

  HabilitaBtOk;
end;

procedure TfrmParamFolhaNormal.spbtInvSelecaoTipFolClick(Sender: TObject);
var
  c: integer;
begin
  case (Paginas1.ActivePageIndex) of
    0 : chkListAux := chklstTipoFolha;
    1 : chkListAux := chklstCCusto;
    2 : chkListAux := chklstEstab;
  end;

  for c:=0 to chkListAux.Items.Count-1 do
    chkListAux.Checked[c] := not(chkListAux.Checked[c]);
  chkListAux.Repaint;

  if (Paginas1.ActivePageIndex > 0) then
    MontaListaFuncionarios;

  HabilitaBtOk;
end;

procedure TfrmParamFolhaNormal.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamFolhaNormal.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamFolhaNormal.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  sListaIdTipoFolhaSel, sListaIdFuncSel: string;


begin
  // Tipos de Folha selecionados
  wNum := FU.CriaListaOpcoes(chklstTipoFolha, ListaIdTipoFolha, sListaIdTipoFolhaSel, ',', false);
  if (wNum = ListaIdTipoFolha.Count) then
    sListaIdTipoFolhaSel := '';

  // C. de Custo selecionados
  wNum := FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', true);
  if (wNum = ListaCodCCusto.Count) then
    sListaCodCCustoSel := '';

  // Funcionários escolhidos
  //Taffarel - SIG72346 - início
  wNum := FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);
  if (wNum = ListaIdFunc.Count) then
      sListaIdFuncSel := ''
  else
      sListaIdFuncSel:= FU.CriaListaOpcoesIN(chklstFunc, ListaIdFunc, 'PF.IDPESSOA');
  //Taffarel - SIG72346 - fim

  Cmp_Padrao.ParamByName('IdEmpresa').asInteger := Sistema.IdEmpresa;
  Cmp_Padrao.ParamByName('ListaIdEstab').asString := sListaIdEstabSel;
  Cmp_Padrao.ParamByName('MesRef').asInteger := cmbMes.ItemIndex+1;
  Cmp_Padrao.ParamByName('AnoRef').asInteger := speAno.Value;
  Cmp_Padrao.ParamByName('ListaCodCCusto').asString := sListaCodCCustoSel;
  Cmp_Padrao.ParamByName('ListaTipoFolha').asString := sListaIdTipoFolhaSel;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFuncSel;
  Cmp_Padrao.ParamByName('AgruparPorCCusto').asBoolean := (rgAgruparPorCCusto.ItemIndex = 0);
  Cmp_Padrao.ParamByName('FlgNivelIndiv').asInteger := FlgNivelIndiv;
  Cmp_Padrao.ParamByName('TipoContrato').asString := FU.GerarListaTipoContratoSel(
    cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
    cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked, true);
  Cmp_Padrao.ParamByName('SitFunc').asString := FU.GerarListaSitFuncSel(cbxAtivos.Checked,
    cbxAfastados.Checked, cbxDemitidos.Checked, true);
  Cmp_Padrao.ParamByName('Ordenacao').asInteger := cmbOrderBy.ItemIndex;
  Cmp_Padrao.ParamByName('OrdemRubrica').asInteger := rgOrdemRubrica.ItemIndex;
  Cmp_Padrao.ParamByName('ImprimeTipoProcesso').asBoolean :=
    (rgImprimeTipoProcesso.ItemIndex = 0);
  Cmp_Padrao.ParamByName('BuscaHist').asBoolean := chkBuscaHist.Checked;

  if (rgProcesso.ItemIndex = 0) then
    Cmp_Padrao.ParamByName('NomeTabela').asString := 'PREVIAFOLPAG'
  else
    Cmp_Padrao.ParamByName('NomeTabela').asString := 'HISTRUBSAL';

  frmAguarde.Mostra('Folha de Pagamento Normal');
  frmAguarde.Pos := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamFolhaNormal.MontaListaFuncionarios;
begin
  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  ListaIdFunc.Clear;
  chklstFunc.Items.Clear;

  if (sListaIdEstabSel <> '') then
  begin
    FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', false);

    dmCds.Cds.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
      '', sListaIdEstabSel, FU.GerarListaSitFuncSel(cbxAtivos.Checked,
      cbxAfastados.Checked, cbxDemitidos.Checked), FU.GerarListaTipoContratoSel(
      cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
      cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked),
      '', sListaCodCCustoSel);

    while not(dmCds.Cds.EOF) do
    begin
      ListaIdFunc.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
      dmCds.Cds.Next;
    end;
  end;
  HabilitaBtOk;
end;

procedure TfrmParamFolhaNormal.HabilitaBtOk;
var
  c: integer;
  bSelTipFol: boolean;
begin
  bSelTipFol := false;
  for c:=0 to chklstTipoFolha.Items.Count-1 do
    if (chklstTipoFolha.Checked[c]) then
    begin
      bSelTipFol := true;
      break;
    end;

  bbtnConfirmar.Enabled := (sListaIdEstabSel <> '') and (Trim(speAno.Text) <> '') and
    (bSelTipFol) and (chklstFunc.Items.Count > 0);
end;

end.
