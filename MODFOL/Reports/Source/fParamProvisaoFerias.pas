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
unit fParamProvisaoFerias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwdblook, Spin, checklst,
  TREdit, IvDictio, IvMulti, ComCtrls, wwdbdatetimepicker, CMDateTimePicker, DBClient,
  uCMClientDataSet, fParamReports_Padrao, CmParamReport, ColorCheckListBox, 
  IniFileEx, uCtrlPessoaFilialPessoa, uCtrlGlobalRH, uCtrlPessoaFuncionario, uCtrlMotivo,
  uCtrlProvDesc, IvEMulti;

type
  TTipoRelatorio = (tprFerias, tprDecimoTerceiro);

  TfrmParamProvisaoFerias = class(TfrmParamReports_Padrao)
    gbxFunc: TGroupBox;
    pgctrlEmpregados: TPageControl;
    tbshListaFunc: TTabSheet;
    chklstFunc: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
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
    gbxRubricas: TGroupBox;
    gbxEncargo: TGroupBox;
    rePercent: TRealEdit;
    gbxDataBase: TGroupBox;
    dtedDataBase: TCMDateTimePicker;
    rgTipoCalc: TRadioGroup;
    rgSomaUmTercoFerias: TRadioGroup;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    tbshEstabelecimento: TTabSheet;
    chklstEstab: TColorCheckListBox;
    bbtnSelTodosEstab: TBitBtn;
    bbtnInverteSelEstab: TBitBtn;
    cbxDemitidos: TCheckBox;
    rgBuscaHist: TRadioGroup;
    CdsTipoFolha: TCMClientDataSet;
    chklstRubrica: TColorCheckListBox;
    stxtTipoFolha: TStaticText;
    dblkcbTipoFolha: TwwDBLookupCombo;
    Label1: TLabel;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure dtedDataBaseChange(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
    procedure bbtnSelTodosEstabClick(Sender: TObject);
    procedure bbtnInverteSelEstabClick(Sender: TObject);
    procedure chklstRubricaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chklstRubricaClick(Sender: TObject);
    procedure dblkcbTipoFolhaChange(Sender: TObject);
  private
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlMotivo: TCtrlMotivo;
    CtrlProvDesc: TCtrlProvDesc;

    ArqConfig: TIniFileEx; // Arquivo de Configuração
    ListaIdEstab, ListaIdRubrica, ListaIdFunc: TStringList;

    Tipo: TTipoRelatorio;
    sEntradaRelIni: string;
    sListaIdEstabSel: string;
    sListaIdRubricaSel: string;
    bSitAtivo, bSitAfast, bSitDemit, bTipContrEfet, bTipContrEspec, bTipContrTemp,
    bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;

    procedure MontaListaFuncionarios;
    procedure HabilitaBtOk;
    procedure LerAlteracoes;
    procedure GravarAlteracoes;

    // Habilitar o Combo de Tipos de Folha e Seleciona (caso já tenha sido feito
    // anteriormente) o registro correspondente
    procedure SelTipoFolha;
    // Atualizar uma lista de códigos das rubricas para incluir o correspondente
    // Tipo de Folha recuperado a partir do arquivo de configuração
    procedure SelTipoFolhaRub(Lista: TStringList; Valor: string);
    // Retornar uma lista de códigos das rubricas a partir de uma que é composta de
    // Código da Rubrica=Tipo de Folha. Usada na formatação das listas de Rubricas
    // selecionadas que foram recuperadas a partir do arquivo de configuração
    function  NormalizaLiRubrica(Valor: string): string;
  public
    constructor Create(AOwner: TComponent; TipoRelatorio: TTipoRelatorio); reintroduce;
  end;

var
  frmParamProvisaoFerias: TfrmParamProvisaoFerias;

implementation

uses uSistema, uMensErro, fAguarde, dCds, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

constructor TfrmParamProvisaoFerias.Create(AOwner: TComponent; TipoRelatorio: TTipoRelatorio);
begin
  Tipo := TipoRelatorio;
  inherited Create(AOwner);
end;

procedure TfrmParamProvisaoFerias.FormCreate(Sender: TObject);
begin
  inherited;

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

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  ListaIdRubrica := TStringList.Create;
  ListaIdFunc := TStringList.Create;
  ListaIdEstab := TStringList.Create;

  // Apagar o índice se este existir
  dmCds.Cds.IndexName := '';
  if (dmCds.Cds.IndexDefs.IndexOf('Index1') > 0) then
    dmCds.Cds.DeleteIndex('Index1');

  // Lista de Rubricas
  chklstRubrica.Items.Clear;
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdRubrica.Add(dmCds.Cds.FieldByName('CODPROVDESC').asString +'=');
    chklstRubrica.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    dmCds.Cds.Next;
  end;

  // Lista de Estabelecimentos
  dmCds.Cds.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdEstab.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
    chklstEstab.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    chklstEstab.Checked[chklstEstab.Items.Count-1] := true;
    dmCds.Cds.Next;
  end;

  CdsTipoFolha.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F,D');

  dtedDataBase.Date := CtrlGlobalRH.GetNormalIni - 1;

  cmbOrderBy.ItemIndex := 0;
  pgctrlEmpregados.ActivePageIndex := 0;

  rgSomaUmTercoFerias.Visible := (Tipo = tprFerias);
  if (Tipo = tprFerias) then
  begin
    sEntradaRelIni := 'PROVISAO_FERIAS';
    Caption := 'Relatório de Provisão de Férias (Vencidas e Proporcionais)';
    gbxOrdem.Left := 448;
    gbxOrdem.Width := 238;
    cmbOrderBy.Width := 220;
  end
  else
  begin
    sEntradaRelIni := 'PROVISAO_13_SAL';
    Caption := 'Relatório de Provisão de 13º Salário';
    gbxOrdem.Left := 335;
    gbxOrdem.Width := 351;
    cmbOrderBy.Width := 334;
  end;

  LerAlteracoes;
  MontaListaFuncionarios;
  chklstRubricaClick(Sender);
end;

procedure TfrmParamProvisaoFerias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravarAlteracoes;
  FreeAndNil(ListaIdRubrica);
  FreeAndNil(ListaIdFunc);
  FreeAndNil(ListaIdEstab);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlProvDesc);
  inherited;
end;

procedure TfrmParamProvisaoFerias.dtedDataBaseChange(Sender: TObject);
begin
  MontaListaFuncionarios;
  HabilitaBtOk;
end;

procedure TfrmParamProvisaoFerias.dblkcbTipoFolhaChange(Sender: TObject);
begin
  if (Trim(dblkcbTipoFolha.Text) <> '') then
    ListaIdRubrica[chklstRubrica.ItemIndex] :=
      Copy(ListaIdRubrica[chklstRubrica.ItemIndex],0,
        Pos('=',ListaIdRubrica[chklstRubrica.ItemIndex]))+
      dblkcbTipoFolha.LookupValue
  else
    ListaIdRubrica[chklstRubrica.ItemIndex] :=
      Copy(ListaIdRubrica[chklstRubrica.ItemIndex],0,
        Pos('=',ListaIdRubrica[chklstRubrica.ItemIndex]));
end;

procedure TfrmParamProvisaoFerias.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmParamProvisaoFerias.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := cbxAtivos.Checked;
  bSitAfast := cbxAfastados.Checked;
  bSitDemit := cbxDemitidos.Checked;
end;

procedure TfrmParamProvisaoFerias.gbxTipContraExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked) and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked) and not(cbxTerceiros.Checked) and
     not(cbxPropDirSemVinc.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Contrato deve ser selecionado.',
      'Aviso', mtInformation, [mbOk,mbHelp], 0);
    cbxEfetivos.SetFocus;
  end
  else
  if (bTipContrEfet <> cbxEfetivos.Checked) or (bTipContrEspec <> cbxEspeciais.Checked) or
     (bTipContrTemp <> cbxTemporarios.Checked) or (bTipContrEst <> cbxEstagiarios.Checked) or
     (bTipContrTerc <> cbxTerceiros.Checked) or (bTipContrProp <> cbxPropDirSemVinc.Checked) or
     (bTipContrAut <> cbxAutonomos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamProvisaoFerias.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg ('Pelo menos um Tipo de Situação deve ser selecionado.',
      'Aviso', mtInformation, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) or
     (bSitDemit <> cbxDemitidos.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamProvisaoFerias.chklstRubricaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key in [VK_UP,VK_DOWN]) then
    SelTipoFolha;
end;

procedure TfrmParamProvisaoFerias.chklstFuncClickCheck(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamProvisaoFerias.chklstRubricaClickCheck(Sender: TObject);
begin
  HabilitaBtOk;
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false, true);
  edCodRubricas.Text := sListaIdRubricaSel;
  SelTipoFolha;
end;

procedure TfrmParamProvisaoFerias.chklstEstabClickCheck(Sender: TObject);
begin
  MontaListaFuncionarios;
end;

procedure TfrmParamProvisaoFerias.chklstRubricaClick(Sender: TObject);
begin
  SelTipoFolha;
end;

procedure TfrmParamProvisaoFerias.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  FU.VerificaOpcoes(chklstRubrica, ListaIdRubrica, edCodRubricas.Text, ',');
  HabilitaBtOk;
  chklstRubrica.Repaint;
end;

procedure TfrmParamProvisaoFerias.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamProvisaoFerias.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamProvisaoFerias.bbtnSelTodosEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  chklstEstab.Repaint;
  chklstEstabClickCheck(Sender);
end;

procedure TfrmParamProvisaoFerias.bbtnInverteSelEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  chklstEstab.Repaint;
  chklstEstabClickCheck(Sender);
end;

procedure TfrmParamProvisaoFerias.bbtnConfirmarClick(Sender: TObject);
var
  wFunc: word;
  sListaIdFuncSel: string;
begin
  // Funcionários escolhidos
  wFunc := FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);
  if (wFunc = ListaIdFunc.Count) then
    sListaIdFuncSel := '';

  // Rubricas escolhidos
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);

  Cmp_Padrao.ParamByName('ListaIdEstab').asString := sListaIdEstabSel;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFuncSel;
  Cmp_Padrao.ParamByName('ListaIdRubrica').asString := sListaIdRubricaSel;
  Cmp_Padrao.ParamByName('DataBase').asString := dtedDataBase.Text;
  Cmp_Padrao.ParamByName('TipoContrato').asString := FU.GerarListaTipoContratoSel(
    cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
    cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked, true);
  Cmp_Padrao.ParamByName('SitFunc').asString := FU.GerarListaSitFuncSel(cbxAtivos.Checked,
    cbxAfastados.Checked, cbxDemitidos.Checked, true);
  Cmp_Padrao.ParamByName('Percent').asFloat := rePercent.Value;
  Cmp_Padrao.ParamByName('TipoCalc').asInteger := rgTipoCalc.ItemIndex;
  Cmp_Padrao.ParamByName('Ordenacao').asInteger := cmbOrderBy.ItemIndex;
  Cmp_Padrao.ParamByName('BuscaHist').asBoolean := (rgBuscaHist.ItemIndex = 0); 

  if (Tipo = tprFerias) then
    Cmp_Padrao.ParamByName('SomaUmTercoFerias').asInteger := rgSomaUmTercoFerias.ItemIndex;

  if (Tipo = tprFerias) then
    frmAguarde.Mostra('Provisão de Férias')
  else
    frmAguarde.Mostra('Provisão de 13º Salário');

  frmAguarde.Pos := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamProvisaoFerias.MontaListaFuncionarios;
begin
  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  ListaIdFunc.Clear;
  chklstFunc.Items.BeginUpdate;
  chklstFunc.Items.Clear;

  if (sListaIdEstabSel <> '') then
  begin
    dmCds.Cds.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
      '', sListaIdEstabSel, FU.GerarListaSitFuncSel(cbxAtivos.Checked,
      cbxAfastados.Checked, cbxDemitidos.Checked), FU.GerarListaTipoContratoSel(
      cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
      cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked),
      '', '', '', '', '', false, 0, 0, -1, -1, '', 0, 0, 0, 0, false, '', '', 0, 0, 0,
      (rgBuscaHist.ItemIndex = 1), dtedDataBase.Date);

    while not(dmCds.Cds.EOF) do
    begin
      ListaIdFunc.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
      chklstFunc.Checked[chklstFunc.Items.Count-1] := true;
      dmCds.Cds.Next;
    end;
  end;
  HabilitaBtOk;
  chklstFunc.Items.EndUpdate;
end;

procedure TfrmParamProvisaoFerias.HabilitaBtOk;
var
  c: integer;
  bSelRub, bSelFunc: boolean;
begin
  bSelRub := false;
  for c:=0 to chklstRubrica.Items.Count-1 do
    if (chklstRubrica.Checked[c]) then
    begin
      bSelRub := true;
      break;
    end;

  bSelFunc := false;
  for c:=0 to chklstFunc.Items.Count-1 do
    if (chklstFunc.Checked[c]) then
    begin
      bSelFunc := true;
      break;
    end;

  bbtnConfirmar.Enabled := (bSelRub) and (bSelFunc) and (dtedDataBase.Text <> '');
end;

procedure TfrmParamProvisaoFerias.LerAlteracoes;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFileEx.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFileEx.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  sListaIdRubricaSel := ArqConfig.ReadString(sEntradaRelIni, 'Rubricas', '');

  cbxEfetivos.Checked := (ArqConfig.ReadString(sEntradaRelIni, 'Efetivos', 'V') = 'V');
  cbxEspeciais.Checked := (ArqConfig.ReadString(sEntradaRelIni, 'Especiais', 'V') = 'V');
  cbxTemporarios.Checked := (ArqConfig.ReadString(sEntradaRelIni, 'Temporarios', 'V') = 'V');
  cbxTerceiros.Checked := (ArqConfig.ReadString(sEntradaRelIni, 'Terceiros', 'V') = 'V');
  cbxEstagiarios.Checked := (ArqConfig.ReadString(sEntradaRelIni, 'Estagiarios', 'V') = 'V');
  cbxPropDirSemVinc.Checked := (ArqConfig.ReadString(sEntradaRelIni, 'Proprietarios', 'V') = 'V');
  cbxAutonomos.Checked := (ArqConfig.ReadString(sEntradaRelIni, 'Autonomos', 'V') = 'V');

  cbxAtivos.Checked := (ArqConfig.ReadString(sEntradaRelIni, 'Ativos', 'V') = 'V');
  cbxAfastados.Checked := (ArqConfig.ReadString(sEntradaRelIni, 'Afastados', 'V') = 'V');
  cbxDemitidos.Checked := (ArqConfig.ReadString(sEntradaRelIni, 'Demitidos', 'V') = 'V');

  SelTipoFolhaRub(ListaIdRubrica, sListaIdRubricaSel);
  FU.VerificaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',');
  edCodRubricas.Text := NormalizaLiRubrica(sListaIdRubricaSel);
end;

procedure TfrmParamProvisaoFerias.GravarAlteracoes;
var
  sGravaPadrao: string;
begin
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString(sEntradaRelIni, 'Rubricas', sGravaPadrao);

  ArqConfig.WriteString(sEntradaRelIni, 'Efetivos', FU.IFF(cbxEfetivos.Checked,'V','F'));
  ArqConfig.WriteString(sEntradaRelIni, 'Especiais', FU.IFF(cbxEspeciais.Checked,'V','F'));
  ArqConfig.WriteString(sEntradaRelIni, 'Temporarios', FU.IFF(cbxTemporarios.Checked,'V','F'));
  ArqConfig.WriteString(sEntradaRelIni, 'Terceiros', FU.IFF(cbxTerceiros.Checked,'V','F'));
  ArqConfig.WriteString(sEntradaRelIni, 'Estagiarios', FU.IFF(cbxEstagiarios.Checked,'V','F'));
  ArqConfig.WriteString(sEntradaRelIni, 'Proprietarios', FU.IFF(cbxPropDirSemVinc.Checked,'V','F'));
  ArqConfig.WriteString(sEntradaRelIni, 'Autonomos', FU.IFF(cbxAutonomos.Checked,'V','F'));

  ArqConfig.WriteString(sEntradaRelIni, 'Ativos', FU.IFF(cbxAtivos.Checked, 'V', 'F'));
  ArqConfig.WriteString(sEntradaRelIni, 'Afastados', FU.IFF(cbxAfastados.Checked, 'V', 'F'));
  ArqConfig.WriteString(sEntradaRelIni, 'Demitidos', FU.IFF(cbxDemitidos.Checked, 'V', 'F'));

  FreeAndNil(ArqConfig);
end;

procedure TfrmParamProvisaoFerias.SelTipoFolha;
begin
  if (chklstRubrica.ItemIndex >= 0) then
  begin
    stxtTipoFolha.Visible := (chklstRubrica.Checked[chklstRubrica.ItemIndex]);
    dblkcbTipoFolha.Visible := stxtTipoFolha.Visible;

    dblkcbTipoFolha.OnChange := nil;
    if (stxtTipoFolha.Visible) then
      dblkcbTipoFolha.LookupValue :=
        Copy(ListaIdRubrica[chklstRubrica.ItemIndex],
          Pos('=',ListaIdRubrica[chklstRubrica.ItemIndex])+1,
          Length(ListaIdRubrica[chklstRubrica.ItemIndex]) -
          Pos('=',ListaIdRubrica[chklstRubrica.ItemIndex]))
    else
      dblkcbTipoFolha.LookupValue := '';
    dblkcbTipoFolha.OnChange := dblkcbTipoFolhaChange;
  end;
end;

procedure TfrmParamProvisaoFerias.SelTipoFolhaRub(Lista: TStringList; Valor: string);
var
  iPos: integer;
  ValorAtual: string;
begin
  while (Trim(Valor) <> '') do
  begin
    FU.ExtraiString(Valor, ValorAtual, ',');
    iPos := Lista.IndexOf(Copy(ValorAtual, 1, Pos('=', ValorAtual)));
    if (iPos > -1) then
      Lista[iPos] := ValorAtual;
  end;
end;

function TfrmParamProvisaoFerias.NormalizaLiRubrica(Valor: string): string;
var
  ValorAtual: string;
begin
  Result := '';
  while (Trim(Valor) <> '') do
  begin
    FU.ExtraiString(Valor, ValorAtual, ',');
    Result := Result + Copy(ValorAtual, 1, FU.IFF(Pos('=', ValorAtual) > 0,
      Pos('=', ValorAtual)-1, Length(ValorAtual))) + FU.IFF((Trim(Valor) = ''), '', ',');
  end;
end;

end.
