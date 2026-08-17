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
unit fParamRelTransporte;

interface
           
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, Spin,
  DBTables, wwdblook, checklst, IniFiles, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
  fParamReports_Padrao, CmParamReport, DBClient, uCMClientDataSet, uCtrlPessoaFilialPessoa,
  uCtrlGlobalRH, uCtrlPessoaFuncionario, uCtrlProvDesc, ColorCheckListBox;

type
  TfrmParamRelTransporte = class(TfrmParamReports_Padrao)
    CdsEstab: TCMClientDataSet;
    CdsRubrica: TCMClientDataSet;
    gbxEstab: TGroupBox;
    dblkcbEstab: TwwDBLookupCombo;
    gbxIntervRef: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtedInicio: TCMDateTimePicker;
    dtedFim: TCMDateTimePicker;
    gbxDesconta: TGroupBox;
    pnlMesRef_Faltas: TPanel;
    spbtOk_Faltas: TSpeedButton;
    cmbMes_Faltas: TComboBox;
    speAno_Faltas: TSpinEdit;
    gbxRubIncid: TGroupBox;
    spbtExibirMesRef_GravaRub: TSpeedButton;
    chkbxGravaRub: TCheckBox;
    dblkpcmbRubrica: TwwDBLookupCombo;
    pnlMesRef_GravaRub: TPanel;
    spbtOk_GravaRub: TSpeedButton;
    cmbMes_GravaRub: TComboBox;
    speAno_GravaRub: TSpinEdit;
    rgImprimeNumFunc: TRadioGroup;
    gbxDiasMin: TGroupBox;
    spedDiasMin: TSpinEdit;
    gbxQuantDias: TGroupBox;
    spedQuantDias: TSpinEdit;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    GroupBox1: TGroupBox;
    cmbAgrupar: TComboBox;
    gbxFunc: TGroupBox;
    pgctrlEmpregados: TPageControl;
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
    chkbFerias: TCheckBox;
    chkbFeriados: TCheckBox;
    chkbFaltas: TCheckBox;
    spbtExibirMesRef_Faltas: TSpeedButton;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure dtedInicioChange(Sender: TObject);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContraEnter(Sender: TObject);
    procedure gbxTipContraExit(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure pnlMesRef_GravaRubExit(Sender: TObject);
    procedure spbtExibirMesRef_FaltasClick(Sender: TObject);
    procedure spbtExibirMesRef_GravaRubClick(Sender: TObject);
    procedure spbtOk_GravaRubClick(Sender: TObject);
    procedure spbtOk_FaltasClick(Sender: TObject);
  private
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlProvDesc: TCtrlProvDesc;

    ArqConfig: TIniFile;
    ListaIdFunc: TStringList;

    IdEstab: double;
    bRelatorioEmColunas,
    bSitAtivo, bSitAfast, bTipContrEfet, bTipContrEspec, bTipContrTemp,
    bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;

    procedure MontaListaFuncionarios;
    procedure HabilitaBtOk;
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    function  VerificaOpcoesOk: boolean;
  public
    constructor Create(AOwner: TComponent; TipoRelatorio: string); reintroduce;
  end;

var
  frmParamRelTransporte: TfrmParamRelTransporte;

implementation

uses uSistema, uMensErro, fAguarde, dCds, uCtrlPadroes, uCtrlFuncoesRH, uModulo,
  RRelTransporte, uCtrlUsoGeralRH;

{$R *.DFM}

constructor TfrmParamRelTransporte.Create(AOwner: TComponent; TipoRelatorio: string);
begin
  bRelatorioEmColunas := (TipoRelatorio = 'COLUNA');
  inherited Create(AOwner);
end;

procedure TfrmParamRelTransporte.FormCreate(Sender: TObject);
begin
  inherited;
  ListaIdFunc := TStringList.Create;

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));

  CdsRubrica.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  if (CdsRubrica.Locate('CODRUBCLT', '50446', [])) then
    dblkpcmbRubrica.LookUpValue := CdsRubrica.FieldByName('IDPROVENTO').asString;

  dtedInicio.Date := FU.ProxMes(CtrlGlobalRH.GetNormalIni);
  dtedFim.Date := FU.ProxMes(CtrlGlobalRH.GetNormalFim);

  cmbOrderBy.ItemIndex := 0;
  cmbAgrupar.ItemIndex := 0;
  pgctrlEmpregados.ActivePageIndex := 0;
  IdEstab := -1;

  // Mês e Ano de Referência para a procura das Faltas
  cmbMes_Faltas.ItemIndex := FU.ExtraiMes(StrToDate(FU.IncData(dtedInicio.Text,0,-2,0))) - 1;
  speAno_Faltas.Value := FU.ExtraiAno(StrToDate(FU.IncData(dtedInicio.Text,0,-2,0)));

  // Mês e Ano de Referência para a gravação da Rubrica
  cmbMes_GravaRub.ItemIndex := FU.ExtraiMes(dtedInicio.Date) - 1;
  speAno_GravaRub.Value := FU.ExtraiAno(dtedInicio.Date);

  if (bRelatorioEmColunas) then
    Caption := 'Relação de Transportes (Em Colunas)'
  else
    Caption := 'Relação de Transportes (Em Linha)';

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;
end;

procedure TfrmParamRelTransporte.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlProvDesc);
  GravaAlteracoes;
  FreeAndNil(ListaIdFunc);
  inherited;
end;

procedure TfrmParamRelTransporte.dtedInicioChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamRelTransporte.dblkcbEstabChange(Sender: TObject);
begin
  if (CdsEstab.FieldByName('IDPESSOA').asFloat <> IdEstab) then
  begin
    MontaListaFuncionarios;
    IdEstab := CdsEstab.FieldByName('IDPESSOA').asFloat;
    if (pgctrlEmpregados.ActivePageIndex = 0) then
      chklstFunc.Repaint;
  end;
end;

procedure TfrmParamRelTransporte.gbxTipContraEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmParamRelTransporte.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := cbxAtivos.Checked;
  bSitAfast := cbxAfastados.Checked;
end;

procedure TfrmParamRelTransporte.gbxTipContraExit(Sender: TObject);
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

procedure TfrmParamRelTransporte.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Situação deve ser selecionado.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    cbxAtivos.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) then
    MontaListaFuncionarios;
end;

procedure TfrmParamRelTransporte.pnlMesRef_GravaRubExit(Sender: TObject);
begin
  pnlMesRef_Faltas.Visible := false;
  pnlMesRef_GravaRub.Visible := false;
  gbxRubIncid.Repaint;
  rgImprimeNumFunc.Repaint;
  gbxOrdem.Repaint;
end;

procedure TfrmParamRelTransporte.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
end;

procedure TfrmParamRelTransporte.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);   
  chklstFunc.Repaint;
end;

procedure TfrmParamRelTransporte.spbtExibirMesRef_FaltasClick(Sender: TObject);
begin
  pnlMesRef_Faltas.Visible := true;
  pnlMesRef_Faltas.Left := 221;
  pnlMesRef_Faltas.Top := 93;
end;

procedure TfrmParamRelTransporte.spbtExibirMesRef_GravaRubClick(Sender: TObject);
begin
  pnlMesRef_GravaRub.Visible := true;
  pnlMesRef_GravaRub.Left := 221;
  pnlMesRef_GravaRub.Top := 142;
end;

procedure TfrmParamRelTransporte.spbtOk_FaltasClick(Sender: TObject);
begin
  pnlMesRef_Faltas.Visible := false;
end;

procedure TfrmParamRelTransporte.spbtOk_GravaRubClick(Sender: TObject);
begin
  pnlMesRef_GravaRub.Visible := false;
end;

procedure TfrmParamRelTransporte.bbtnConfirmarClick(Sender: TObject);
var
  wNum: word;
  sListaIdFuncSel: string;
begin
  // Verifica se as opções estão corretamente selecionadas
  if not(VerificaOpcoesOk) then
    exit;

  // Funcionários escolhidos
  wNum := FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);
  if (wNum = ListaIdFunc.Count) then
    sListaIdFuncSel := '';

  Cmp_Padrao.ParamByName('IdEmpresa').asInteger := Sistema.IdEmpresa;
  Cmp_Padrao.ParamByName('IdEstab').asFloat := CdsEstab.FieldByName('IDPESSOA').asFloat;
  Cmp_Padrao.ParamByName('DataInicial').asDateTime := dtedInicio.Date;
  Cmp_Padrao.ParamByName('DataFinal').asDateTime := dtedFim.Date;
  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFuncSel;
  Cmp_Padrao.ParamByName('TipoContrato').asString := FU.GerarListaTipoContratoSel(
    cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
    cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked, true);
  Cmp_Padrao.ParamByName('SitFunc').asString := FU.GerarListaSitFuncSel(cbxAtivos.Checked,
    cbxAfastados.Checked, false, true);
  Cmp_Padrao.ParamByName('DescontaFerias').asBoolean := chkbFerias.Checked;
  Cmp_Padrao.ParamByName('DescontaFaltas').asBoolean := chkbFaltas.Checked;
  Cmp_Padrao.ParamByName('DescontaFeriados').asBoolean := chkbFeriados.Checked;
  Cmp_Padrao.ParamByName('GravarRubricaIncid').asBoolean := chkbxGravaRub.Checked;
  Cmp_Padrao.ParamByName('MesRef').asInteger := cmbMes_GravaRub.ItemIndex + 1;
  Cmp_Padrao.ParamByName('AnoRef').asInteger := speAno_GravaRub.Value;
  Cmp_Padrao.ParamByName('MesRef_Faltas').asInteger := cmbMes_Faltas.ItemIndex + 1;
  Cmp_Padrao.ParamByName('AnoRef_Faltas').asInteger := speAno_Faltas.Value;
  Cmp_Padrao.ParamByName('IdRubricaIncid').asFloat := CdsRubrica.FieldByName('IDRUBRICA').asFloat;
  Cmp_Padrao.ParamByName('IdRegraRubricaIncid').asFloat := CdsRubrica.FieldByName('IDREGRA').asFloat;
  Cmp_Padrao.ParamByName('ImprimirNumEmpregados').asBoolean := (rgImprimeNumFunc.ItemIndex = 0);
  Cmp_Padrao.ParamByName('QuantDias').asInteger := spedQuantDias.Value;
  Cmp_Padrao.ParamByName('QuantDiasMinimo').asInteger := spedDiasMin.Value;
  Cmp_Padrao.ParamByName('IdContraCheque').asInteger := Modulo.IdContraCheque; 
  Cmp_Padrao.ParamByName('Ordenacao').asInteger := cmbOrderBy.ItemIndex;
  Cmp_Padrao.ParamByName('Agrupar').asInteger := cmbAgrupar.ItemIndex;

  if (bRelatorioEmColunas) then
    frmAguarde.Mostra('Relação de Transportes (Em Colunas)')
  else
    frmAguarde.Mostra('Relação de Transportes (Em Linha)');

  frmAguarde.Pos := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamRelTransporte.MontaListaFuncionarios;
begin
  if (Trim(dblkcbEstab.Text) <> '') then
  begin
    ListaIdFunc.Clear;
    chklstFunc.Items.Clear;

    dmCds.Cds.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa,
      '', CdsEstab.FieldByName('IDPESSOA').asString, FU.GerarListaSitFuncSel(cbxAtivos.Checked,
      cbxAfastados.Checked, false), FU.GerarListaTipoContratoSel(
      cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
      cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked), '', '',
      '', '', '', false, 0, 0, -1, -1, '', 0, 0, 0, 0, true);

    while not(dmCds.Cds.EOF) do
    begin
      ListaIdFunc.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
      dmCds.Cds.Next;
    end;
  end;
  HabilitaBtOk;
end;

procedure TfrmParamRelTransporte.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (Trim(dblkcbEstab.Text) <> '') and
    (Trim(dtedInicio.Text) <> '') and (Trim(dtedFim.Text) <> '');
end;

function TfrmParamRelTransporte.VerificaOpcoesOk: boolean;
begin
  Result := false;

  // Testa se Data Final é MENOR do que a Data Inicial
  if (dtedFim.Date < dtedInicio.Date) then
  begin
    MsgDlg('Data Final menor que a Inicial.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dtedInicio.SetFocus;
    exit;
  end;

  if (chkbxGravaRub.Checked) and (Trim(dblkpcmbRubrica.Value) = '') then
  begin
    MsgDlg('Deve ser escolhida alguma Rubrica.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblkpcmbRubrica.SetFocus;
    exit;
  end;

  Result := true;
end;

procedure TfrmParamRelTransporte.LeAlteracoes;
var
  sIdEstab: string;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  spedDiasMin.Text := ArqConfig.ReadString('REL_TRANSCOLUNA', 'DiasMin' , '1');
  spedQuantDias.Text := ArqConfig.ReadString('REL_TRANSCOLUNA', 'QtdeDias', '0');

  chkbFerias.Checked := (ArqConfig.ReadString('REL_TRANSCOLUNA', 'DescFerias', 'V') = 'V');
  chkbFaltas.Checked := (ArqConfig.ReadString('REL_TRANSCOLUNA', 'DescFaltas', 'V') = 'V');
  chkbFeriados.Checked := (ArqConfig.ReadString('REL_TRANSCOLUNA', 'DescFeriados', 'V') = 'V');

  rgImprimeNumFunc.ItemIndex := StrToInt(ArqConfig.ReadString('REL_TRANSCOLUNA', 'ImprimeNumFunc', '1'));
  cmbOrderBy.ItemIndex := StrToInt(ArqConfig.ReadString('REL_TRANSCOLUNA','OrdemRel', '0'));

  sIdEstab := ArqConfig.ReadString('REL_TRANSCOLUNA', 'Estabelec', '');
  if (sIdEstab = '') then
  begin
    CdsEstab.First;
    sIdEstab := CdsEstab.FieldByName('IDPESSOA').asString;
  end;
  dblkcbEstab.LookUpValue := sIdEstab;
  dblkcbEstab.UpDate;
end;

procedure TfrmParamRelTransporte.GravaAlteracoes;
var
  sGravaPadrao: string;
begin
  ArqConfig.WriteString('REL_TRANSCOLUNA', 'DiasMin', spedDiasMin.Text);
  ArqConfig.WriteString('REL_TRANSCOLUNA', 'QtdeDias', spedQuantDias.Text);

  sGravaPadrao := FU.IFF(chkbFerias.Checked, 'V', 'F');
  ArqConfig.WriteString('REL_TRANSCOLUNA', 'DescFerias', sGravaPadrao);

  sGravaPadrao := FU.IFF(chkbFaltas.Checked, 'V', 'F');
  ArqConfig.WriteString('REL_TRANSCOLUNA', 'DescFaltas', sGravaPadrao);

  sGravaPadrao := FU.IFF(chkbFeriados.Checked, 'V', 'F');
  ArqConfig.WriteString('REL_TRANSCOLUNA', 'DescFeriados', sGravaPadrao);

  sGravaPadrao := IntToStr(cmbOrderBy.ItemIndex);
  ArqConfig.WriteString('REL_TRANSCOLUNA', 'OrdemRel', sGravaPadrao);

  sGravaPadrao := IntToStr(rgImprimeNumFunc.ItemIndex);
  ArqConfig.WriteString('REL_TRANSCOLUNA', 'ImprimeNumFunc', sGravaPadrao);

  if (Trim(dblkcbEstab.Text) <> '') then
    ArqConfig.WriteString('REL_TRANSCOLUNA', 'Estabelec', CdsEstab.FieldByName('IDPESSOA').asString);
end;

end.
