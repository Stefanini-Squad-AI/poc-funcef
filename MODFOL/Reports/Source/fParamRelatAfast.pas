// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .

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

//------------------------------------------------------------------------------
unit fParamRelatAfast;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, TB97,
  TB97Tlbr, StdCtrls, Buttons, ExtCtrls, Db, DBTables, wwdblook, Spin, checklst, IvDictio,
  IvMulti, IvEMulti, ComCtrls, wwdbdatetimepicker, CMDateTimePicker, fParamReports_Padrao,
  CmParamReport, DBClient, uCMClientDataSet, ColorCheckListBox, IniFileEx, uCtrlMotivo, 
  uCtrlPessoaFilialPessoa, uCtrlListTerceirosRH;

type
  TfrmParamRelatAfast = class(TfrmParamReports_Padrao)
    gbxIntervRef: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtedIni: TCMDateTimePicker;
    dtedFin: TCMDateTimePicker;
    gbxFunc: TGroupBox;
    pgctrlSelec: TPageControl;
    tbshRetorno: TTabSheet;
    chklstRetorno: TColorCheckListBox;
    tbshFiltroFunc: TTabSheet;
    gbxTipContra: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxEspeciais: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxPropDirSemVinc: TCheckBox;
    cbxAutonomos: TCheckBox;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    cbxDemitidos: TCheckBox;
    tbshCCusto: TTabSheet;
    chklstCCusto: TColorCheckListBox;
    tbshAfast: TTabSheet;
    chklstAfast: TColorCheckListBox;
    CdsEstab: TCMClientDataSet;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    tbshEstabelecimento: TTabSheet;
    chklstEstab: TColorCheckListBox;
    bbtnSelTodosEstab: TBitBtn;
    bbtnInverteSelEstab: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure chklstRetornoClickCheck(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure pgctrlSelecChange(Sender: TObject);
    procedure bbtnSelTodosEstabClick(Sender: TObject);
    procedure bbtnInverteSelEstabClick(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
  private
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlMotivo: TCtrlMotivo;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    ArqConfig: TIniFileEx;
    ListaIdMotivo: TStringList;
    ListaCodCCusto, ListaIdEstab: TStringList;

    sListaIdAfastSel, sListaIdRetornoSel, sListaIdEstabSel: string;
    bSitAtivo, bSitAfast, bSitDemit, bTipContrEfet, bTipContrEspec, bTipContrTemp,
    bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;

    procedure HabilitaBtOk;
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
  end;

var
  frmParamRelatAfast: TfrmParamRelatAfast;

implementation

uses uSistema, uMensErro, uCtrlPadroes, fAguarde, dCds, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamRelatAfast.FormCreate(Sender: TObject);
var
  c: byte;
begin
  inherited;
  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  ListaIdMotivo := TStringList.Create;
  ListaCodCCusto := TStringList.Create;
  ListaIdEstab := TStringList.Create;

  dtedIni.Date := StrToDate(FU.IncData(DateToStr(Date),0,-1,0));
  dtedFin.Date := Date;

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

  // Lista de Situações Funcionais
  dmCds.Cds.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('D');
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdMotivo.Add(dmCds.Cds.FieldByName('IDMOTIVO').asString);
    chklstAfast.Items.Add(dmCds.Cds.FieldByName('DESCRICAO').asString);
    chklstRetorno.Items.Add(dmCds.Cds.FieldByName('DESCRICAO').asString);
    dmCds.Cds.Next;
  end;

  // Lista dos C. Custo
  dmCds.Cds.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodCCusto.Add(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString);
    chklstCCusto.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;

  cmbOrderBy.ItemIndex := 0;
  pgctrlSelec.ActivePageIndex := 0;

  LeAlteracoes;
end;

procedure TfrmParamRelatAfast.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;
  FreeAndNil(ArqConfig);
  FreeAndNil(ListaIdMotivo);
  FreeAndNil(ListaCodCCusto);
  FreeAndNil(ListaIdEstab);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlPessoaFilialPessoa);
  inherited;
end;

procedure TfrmParamRelatAfast.pgctrlSelecChange(Sender: TObject);
begin
  bbtnSelTodos.Visible := (pgctrlSelec.ActivePageIndex in [0,1,3]);
  bbtnInverteSel.Visible := bbtnSelTodos.Visible;
end;

procedure TfrmParamRelatAfast.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmParamRelatAfast.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked) and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked) and not(cbxTerceiros.Checked) and
     not(cbxPropDirSemVinc.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Contrato deve ser selecionado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    cbxEfetivos.SetFocus;
  end;
end;

procedure TfrmParamRelatAfast.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := (cbxAtivos.Checked);
  bSitAfast := (cbxAfastados.Checked);
  bSitDemit := (cbxDemitidos.Checked);
end;

procedure TfrmParamRelatAfast.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Situação deve ser selecionado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end;
end;

procedure TfrmParamRelatAfast.chklstRetornoClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamRelatAfast.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := true;
  chklstCCusto.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamRelatAfast.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := not(chklstCCusto.Checked[c]);
  chklstCCusto.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamRelatAfast.bbtnConfirmarClick(Sender: TObject);
var
  sListaCodCCustoSel: string;
begin
  // Lista de Afastamentos selecionados
  FU.CriaListaOpcoes(chklstAfast, ListaIdMotivo, sListaIdAfastSel, ',', false);

  // Lista de Retornos selecionados
  FU.CriaListaOpcoes(chklstRetorno, ListaIdMotivo, sListaIdRetornoSel, ',', false);

  // Lista dos Centros de Custo selecionados
  FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', false);

  Cmp_Padrao.ParamByName('ListaIdEstab').asString := sListaIdEstabSel;
  Cmp_Padrao.ParamByName('DataInicial').asDateTime := dtedIni.Date;
  Cmp_Padrao.ParamByName('DataFinal').asDateTime := dtedFin.Date;
  Cmp_Padrao.ParamByName('ListaIdAfast').asString := sListaIdAfastSel;
  Cmp_Padrao.ParamByName('ListaIdRetorno').asString := sListaIdRetornoSel;
  Cmp_Padrao.ParamByName('ListaCodCCusto').asString := sListaCodCCustoSel;
  Cmp_Padrao.ParamByName('SitFunc').asString := FU.GerarListaSitFuncSel(cbxAtivos.Checked,
    cbxAfastados.Checked, cbxDemitidos.Checked);
  Cmp_Padrao.ParamByName('TipoContrato').asString := FU.GerarListaTipoContratoSel(
    cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
    cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked);
  Cmp_Padrao.ParamByName('Ordem').asInteger := cmbOrderBy.ItemIndex;

  frmAguarde.Mostra('Relatório de Afastamentos');
  frmAguarde.Pos := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamRelatAfast.HabilitaBtOk;
var
  c: integer;
  bSelAfast, bSelRetorno: boolean;
begin
  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  bSelAfast := false;
  for c:=0 to chklstAfast.Items.Count-1 do
    if (chklstAfast.Checked[c]) then
    begin
      bSelAfast := true;
      break;
    end;

  bSelRetorno := false;
  for c:=0 to chklstRetorno.Items.Count-1 do
    if (chklstRetorno.Checked[c]) then
    begin
      bSelRetorno := true;
      break;
    end;

  bbtnConfirmar.Enabled := (bSelAfast) and (bSelRetorno) and (Trim(dtedIni.Text) <> '') and
    (Trim(dtedFin.Text) <> '') and (sListaIdEstabSel <> '');
end;

procedure TfrmParamRelatAfast.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFileEx.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFileEx.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  sListaIdAfastSel := ArqConfig.ReadString('RELAT_AFAST', 'Afastamentos', '');
  sListaIdRetornoSel := ArqConfig.ReadString('RELAT_AFAST', 'Retornos', '');

  FU.VerificaOpcoes(chklstAfast, ListaIdMotivo, sListaIdAfastSel, ',');
  FU.VerificaOpcoes(chklstRetorno, ListaIdMotivo, sListaIdRetornoSel, ',');

  HabilitaBtOk;
end;

procedure TfrmParamRelatAfast.GravaAlteracoes;
var
  sGravaPadrao: string;
begin
  // Gravar as últimas alterações da Opção de Afastamentos
  FU.CriaListaOpcoes(chklstAfast, ListaIdMotivo, sGravaPadrao, ',', false);
  ArqConfig.WriteString('RELAT_AFAST', 'Afastamentos', sGravaPadrao);

  // Gravar as últimas alterações dos Retornos
  FU.CriaListaOpcoes(chklstRetorno, ListaIdMotivo, sGravaPadrao, ',', false);
  ArqConfig.WriteString('RELAT_AFAST', 'Retornos', sGravaPadrao);
end;

procedure TfrmParamRelatAfast.bbtnSelTodosEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  chklstEstab.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamRelatAfast.bbtnInverteSelEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  chklstEstab.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamRelatAfast.chklstEstabClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

end.
