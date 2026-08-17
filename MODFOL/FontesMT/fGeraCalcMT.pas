// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fGeraCalcMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables,
  Mask, StdCtrls, wwdblook, MAHlpBtn, Buttons, ComCtrls, Machklb, checklst, cmseldlg, Spin,
  TB97, Gauges, TB97Tlbr, IvDictio, IvMulti, IvEMulti, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid,
  TREdit, fcLabel, ExtCtrls, wwdbdatetimepicker, DBGrids, fSairAjuda, CMDateTimePicker,
  ColorListBox, IniFiles, FileCtrl, DBClient, uCMClientDataSet, BfDialogs, BrowseFolder,
  TB97Tlwn, uProcuraDir, uCtrlListTerceirosRH, uCtrlGlobalRH, uCtrlMotivo, uCtrlProvDesc,
  uCtrlPessoaSindicato, uCtrlPessoaFilialPessoa, uCtrlGeraFolPagNormal, uCtrlBancoPortFolha;

type
  TfrmGeraCalcMT = class(TfrmSairAjuda)
    pnlInformacoes: TPanel;
    pnlOpcoes: TPanel;
    SaveDlg: TSaveDialog;
    bbtnGeracao: TBitBtn;
    GroupBox3: TGroupBox;
    dblckMotivo: TwwDBLookupCombo;
    pgctrlDoc: TPageControl;
    tbshDatas: TTabSheet;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    gbxDtPagto: TGroupBox;
    dtDataPagFolha: TCMDateTimePicker;
    tbshCAP: TTabSheet;
    gbxTipoDoc: TGroupBox;
    dblckTipoDoc: TwwDBLookupCombo;
    rgProcesso: TRadioGroup;
    pgctrlOpcoes: TPageControl;
    tbsEmpresas: TTabSheet;
    tbsRubricas: TTabSheet;
    Label6: TLabel;
    chklstRubrica: TCheckListBox;
    pnlTituControles: TPanel;
    bbtnVerResultado: TBitBtn;
    Label10: TLabel;
    chklstFunc: TCheckListBox;
    gbxTipContr: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxAutonomos: TCheckBox;
    cbxPropDirSemVinc: TCheckBox;
    tbshRetroativo: TTabSheet;
    rgOpcRetro: TRadioGroup;
    gbxRetroSelec: TGroupBox;
    dbgrdRubEmpre: TwwDBGrid;
    Label12: TLabel;
    lstbxBase: TColorListBox;
    lstbxComplem: TColorListBox;
    lstbxResult: TColorListBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    dsRubrica: TwwDataSource;
    gbxRetroOpc: TGroupBox;
    bbtnNenhumaRubCompl: TBitBtn;
    speQtMeses: TSpinEdit;
    bbtnNenhumaBase: TBitBtn;
    Label16: TLabel;
    rePercRetro: TRealEdit;
    Label17: TLabel;
    lstbxTipoCalc: TColorListBox;
    cbxEspeciais: TCheckBox;
    fcLabel1: TfcLabel;
    bbtnSelTudo: TBitBtn;
    bbtnInverte: TBitBtn;
    bbtnSelPessoa: TBitBtn;
    bbtnInvPessoa: TBitBtn;
    pnlResult: TPanel;
    memResult: TMemo;
    Panel1: TPanel;
    bbtnSalvar: TBitBtn;
    bbtnVoltar: TBitBtn;
    pnlProgresso: TPanel;
    lblQtdeFunc: TLabel;
    lblMatrNome: TLabel;
    Bevel9: TBevel;
    gagTotal: TGauge;
    fcLabel3: TfcLabel;
    Bevel11: TBevel;
    lblProcesso: TLabel;
    lblTipoCalc: TLabel;
    cmbTipoCalc: TComboBox;
    BitBtn1: TBitBtn;
    sbtnAssociarTodosBase: TSpeedButton;
    sbtnAssociarBase: TSpeedButton;
    sbtnDesassociarBase: TSpeedButton;
    sbtnDesassociarTodosBase: TSpeedButton;
    sbtnAssociarComplem: TSpeedButton;
    sbtnAssociarTodosComplem: TSpeedButton;
    sbtnDesassociarComplem: TSpeedButton;
    sbtnDesassociarTodosComplem: TSpeedButton;
    sbtnAssociarResult: TSpeedButton;
    sbtnAssociarTodosResult: TSpeedButton;
    sbtnDesassociarResult: TSpeedButton;
    sbtnDesassociarTodosResult: TSpeedButton;
    lblHoraIni: TLabel;
    Label18: TLabel;
    lblTempoDecorr: TLabel;
    tbshSelecRetro: TTabSheet;
    rgSelecRetro: TRadioGroup;
    gbxFiltroCCusto: TGroupBox;
    chklstCCusto: TCheckListBox;
    bbtnSelTodosCCusto: TBitBtn;
    bbtnInverteSelCCusto: TBitBtn;
    gbxFunc: TGroupBox;
    pgctrlFuncRetro: TPageControl;
    tbshListaFunc: TTabSheet;
    chklstFuncRetro: TCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    tbshFiltroFunc: TTabSheet;
    gbxTipContr2: TGroupBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    gbxFiltroSindicato: TGroupBox;
    chklstSindicato: TCheckListBox;
    bbtnSelTodosSindicato: TBitBtn;
    bbtnInverteSelSindicato: TBitBtn;
    cbxEfetivos2: TCheckBox;
    cbxEspeciais2: TCheckBox;
    cbxTemporarios2: TCheckBox;
    cbxEstagiarios2: TCheckBox;
    cbxAutonomos2: TCheckBox;
    cbxPropDirSemVinc2: TCheckBox;
    cbxTerceiros2: TCheckBox;
    rgTipoFolha: TRadioGroup;
    gbxDtFerias: TGroupBox;
    dtFeriasIni: TCMDateTimePicker;
    dtFeriasFim: TCMDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    CdsMotivo: TCMClientDataSet;
    CdsRubrica: TCMClientDataSet;
    CdsPortadorForma: TCMClientDataSet;
    townCAP: TToolWindow97;
    ProcuraDirDlg: TProcuraDirDlg;
    CdsParamRH: TCMClientDataSet;
    CdsTipoDoc: TCMClientDataSet;
    Label5: TLabel;
    chklstEmpresa: TCheckListBox;
    bbtnSelEmpr: TBitBtn;
    bbtnInvEmpr: TBitBtn;
    rgOpcaoPrevia: TRadioGroup;
    Label1: TLabel;
    chklstEstab: TCheckListBox;
    bbtnSelEstab: TBitBtn;
    BitBtn5: TBitBtn;
    gbxDataPag: TGroupBox;
    dtDataPag: TCMDateTimePicker;
    gbxPortForma: TGroupBox;
    dblckPortadorForma: TwwDBLookupCombo;
    pnlPagEletronico: TPanel;
    pnlCAP: TPanel;
    pnlOpcoesCAP: TPanel;
    chkRateioCC: TCheckBox;
    chkCriaDocIndividual: TCheckBox;
    gbxTipoDesemb: TGroupBox;
    chklstTipoDesemb: TCheckListBox;
    bbtnSelTipo: TBitBtn;
    bbtnInvTipo: TBitBtn;
    btnOkCAP: TBitBtn;
    btnCancelarCAP: TBitBtn;
    chkPagEletronico: TCheckBox;
    chkCAP: TCheckBox;
    Label4: TLabel;
    edPastaArqPag: TEdit;
    bbtnSelPastaPag: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnVoltarClick(Sender: TObject);
    procedure bbtnGeracaoClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure bbtnVerResultadoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnSelTudoClick(Sender: TObject);
    procedure bbtnInverteClick(Sender: TObject);
    procedure bbtnSelEstabClick(Sender: TObject);
    procedure bbtnInvEstabClick(Sender: TObject);
    procedure chklstEmpresaClickCheck(Sender: TObject);
    procedure dblckTipoDocCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnCancelarCAPClick(Sender: TObject);
    procedure bbtnSelPastaPagClick(Sender: TObject);
    procedure chkPagEletronicoClick(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
    procedure bbtnSelPessoaClick(Sender: TObject);
    procedure bbtnInvPessoaClick(Sender: TObject);
    procedure rgOpcRetroClick(Sender: TObject);
    procedure sbtnDesassociarTodosResultClick(Sender: TObject);
    procedure sbtnDesassociarTodosComplemClick(Sender: TObject);
    procedure sbtnDesassociarTodosBaseClick(Sender: TObject);
    procedure sbtnAssociarComplemClick(Sender: TObject);
    procedure sbtnAssociarResultClick(Sender: TObject);
    procedure sbtnAssociarTodosBaseClick(Sender: TObject);
    procedure sbtnAssociarTodosComplemClick(Sender: TObject);
    procedure sbtnAssociarTodosResultClick(Sender: TObject);
    procedure bbtnNenhumaRubComplClick(Sender: TObject);
    procedure sbtnDesassociarBaseClick(Sender: TObject);
    procedure sbtnDesassociarComplemClick(Sender: TObject);
    procedure sbtnDesassociarResultClick(Sender: TObject);
    procedure dbgrdRubEmpreKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnNenhumaBaseClick(Sender: TObject);
    procedure chklstRubricaDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure rgSelecRetroClick(Sender: TObject);
    procedure chklstCCustoExit(Sender: TObject);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContr2Enter(Sender: TObject);
    procedure gbxTipContr2Exit(Sender: TObject);
    procedure chklstCCustoClickCheck(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure bbtnSelTodosCCustoClick(Sender: TObject);
    procedure bbtnInverteSelCCustoClick(Sender: TObject);
    procedure rgProcessoClick(Sender: TObject);
    procedure pgctrlOpcoesChange(Sender: TObject);
    procedure bbtnSelTodosSindicatoClick(Sender: TObject);
    procedure bbtnInverteSelSindicatoClick(Sender: TObject);
    procedure chklstSindicatoExit(Sender: TObject);
    procedure chklstSindicatoClickCheck(Sender: TObject);
    procedure bbtnSelTipoClick(Sender: TObject);
    procedure bbtnInvTipoClick(Sender: TObject);
    procedure sbtnAssociarBaseClick(Sender: TObject);
    procedure rgTipoFolhaClick(Sender: TObject);
    procedure btnOkCAPClick(Sender: TObject);
    procedure gbxTipContrEnter(Sender: TObject);
    procedure gbxTipContrExit(Sender: TObject);
    procedure bbtnSelEmprClick(Sender: TObject);
    procedure bbtnInvEmprClick(Sender: TObject);
    procedure chkCAPClick(Sender: TObject);
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlMotivo: TCtrlMotivo;
    CtrlPessoaSindicato: TCtrlPessoaSindicato;
    CtrlGeraFolPagNormal: TCtrlGeraFolPagNormal;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlProvDesc: TCtrlProvDesc;
    CtrlBancoPortFolha: TCtrlBancoPortFolha;

    ArqConfig: TIniFile;

    lstBase, lstComplem, lstResult, ListaCodCCusto, ListaIdFuncRetro, ListaIdEmpresa,
    ListaIdEstab, ListaIdRubrica, ListaIdFunc, ListaCheckCCusto, ListaIdSindicato,
    ListaCheckSindicato, ListaCodTipoDesemb: TStringList;

    bSitAtivo, bSitAfast, bTipContrEfet, bTipContrEspec, bTipContrTemp,
    bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;
    iIdMotivoPadrao: integer;
    sListaIdEmpresaSel, sListaIdRubricaSel, sListaSitFunc, sListaTipoContr,
    sListaIdEstabSel, sListaCodCCusto, sListaIdSindicatoSel, sListaTipoDesembSel: string;

    procedure LerAlteracoes;
    procedure GravarAlteracoes;

    procedure CriarListaEmpregados(AgrupaCCusto: boolean);
    procedure CriarListaEmpresas;
    procedure CriarListaEstab;
    procedure CriarListaRubricas;
    procedure CriarListaDesemb;
    procedure CriarListaCCusto;
    procedure CriarListaSindicatos;
    procedure GerarArquivosSERPROS;
    procedure Progresso(Args: array of variant);
  end;

var
  frmGeraCalcMT: TfrmGeraCalcMT;

implementation

uses uMensErro, uSistema, uCtrlParamIntegra, uModulo, uFuncoesUteisRH, dBaseDados, 
  uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmGeraCalcMT.FormCreate(Sender: TObject);
var
  iCodPortFormaPadrao: integer;
  wDia, wMes, wAno: word;
begin
  inherited;
  CtrlGeraFolPagNormal := TCtrlGeraFolPagNormal.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlGeraFolPagNormal.Initialize(dtmBaseDados.dbBaseDados, true);
  CtrlGeraFolPagNormal.Progresso := Progresso;

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.Initialize(dtmBaseDados.dbBaseDados, true);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.Initialize(dtmBaseDados.dbBaseDados, true);

  CtrlPessoaSindicato := TCtrlPessoaSindicato.Create;
  CtrlPessoaSindicato.Initialize(dtmBaseDados.dbBaseDados, true);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.Initialize(dtmBaseDados.dbBaseDados, true);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.Initialize(dtmBaseDados.dbBaseDados, true);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.Initialize(dtmBaseDados.dbBaseDados, true);

  CtrlBancoPortFolha := TCtrlBancoPortFolha.Create;
  CtrlBancoPortFolha.Initialize(dtmBaseDados.dbBaseDados, true);

  lstResult := TStringList.Create;
  lstComplem := TStringList.Create;
  lstBase := TStringList.Create;
  ListaIdEmpresa := TStringList.Create;
  ListaIdEstab := TStringList.Create;
  ListaIdFunc := TStringList.Create;
  ListaIdRubrica := TStringList.Create;
  ListaIdFuncRetro := TStringList.Create;
  ListaCodCCusto := TStringList.Create;
  ListaCheckCCusto := TStringList.Create;
  ListaIdSindicato := TStringList.Create;
  ListaCheckSindicato := TStringList.Create;
  ListaCodTipoDesemb := TStringList.Create;

  CdsParamRH.Data := CtrlGlobalRH.GetParamRH(
    'NORMALINI, NORMALFIM, LIMADM, FERIASINI, FERIASFIM, IDMOTIVO');
  if (CdsParamRH.FieldByName('NORMALINI').IsNull) or
     (CdsParamRH.FieldByName('NORMALFIM').IsNull) then
  begin
    MsgDlg('Não Há Período Aberto.' +CR_LF+ 'Verifique.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    Close;
    exit;
  end;

  CdsTipoDoc.Data := CtrlListTerceirosRH.ListTipoDocRecPag('P');
  CdsMotivo.Data := CtrlMotivo.ListGeral(0, 0, 'F');
  CdsPortadorForma.Data := CtrlBancoPortFolha.ListPortadorXConta;
  iCodPortFormaPadrao := CtrlBancoPortFolha.GetCodPortFormaPadrao;
  if (iCodPortFormaPadrao > 0) then
  begin
    dblckPortadorForma.LookupValue := IntToStr(iCodPortFormaPadrao);
    dblckPortadorForma.Update;
  end;

  // Preencher Lista dos Tipos de Desembolso
  CriarListaDesemb;
  // Preencher Lista das Empresas
  CriarListaEmpresas;
  // Preencher Lista dos Estabelecimentos
  CriarListaEstab;
  // Preencher Lista das Rubricas
  CriarListaRubricas;
  // Preencher Lista dos Empregados
  CriarListaEmpregados(false);

  tbsRubricas.PageIndex := 0;
  cmbTipoCalc.ItemIndex := 0;

  if (CdsParamRH.FieldByName('LIMADM').asInteger < 5) then
    rgOpcaoPrevia.ItemIndex := CdsParamRH.FieldByName('LIMADM').asInteger;

  dtFeriasIni.Date := CdsParamRH.FieldByName('FERIASINI').asDateTime;
  dtFeriasFim.Date := CdsParamRH.FieldByName('FERIASFIM').asDateTime;

  CdsMotivo.Locate('IDMOTIVO', CdsParamRH.FieldByName('IDMOTIVO').asInteger, []);
  dblckMotivo.LookupValue := CdsMotivo.FieldByName('IDMOTIVO').asString;
  dblckMotivo.Update;
  iIdMotivoPadrao := CdsMotivo.FieldByName('IDMOTIVO').asInteger;

  DecodeDate(CdsParamRH.FieldByName('NORMALINI').asDateTime, wAno, wMes, wDia);
  cmbMes.ItemIndex := wMes - 1;
  spnedAno.Value := wAno;

  dtDataPagFolha.Text := DateToStr(Date);

  pnlFundo.SendToBack;
  pnlOpcoes.BringToFront;
  pgctrlOpcoes.ActivePageIndex := 0;
  pgctrlDoc.ActivePageIndex := 0;
  pgctrlFuncRetro.ActivePageIndex := 0;

  chkPagEletronico.Checked := true;
  chkCAP.Checked := true;

  ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAP);

  LerAlteracoes;
end;

procedure TfrmGeraCalcMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravarAlteracoes;

  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaSindicato);
  FreeAndNil(CtrlGeraFolPagNormal);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlBancoPortFolha);

  FreeAndNil(lstResult);
  FreeAndNil(lstComplem);
  FreeAndNil(lstBase);
  FreeAndNil(ListaIdRubrica);
  FreeAndNil(ListaIdEstab);
  FreeAndNil(ListaIdFunc);
  FreeAndNil(ListaIdFuncRetro);
  FreeAndNil(ListaCodCCusto);
  FreeAndNil(ListaCheckCCusto);
  FreeAndNil(ListaIdSindicato);
  FreeAndNil(ListaCheckSindicato);
  FreeAndNil(ListaCodTipoDesemb);
  FreeAndNil(ListaIdEmpresa);
  inherited;
end;

procedure TfrmGeraCalcMT.chklstRubricaDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with (TCheckListBox(Control).Canvas) do
  begin
    if (TCheckListBox(Control).Checked[Index]) then
      if (odSelected in State) then
      begin
        Brush.Color := clTeal;
        Font.Color := clWhite;
      end
      else
      begin
        Brush.Color := CL_AMARELO_CLARO;
        Font.Color := clBlack;
      end;

    FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, TCheckListBox(Control).Items[Index]);
  end;
end;

procedure TfrmGeraCalcMT.pgctrlOpcoesChange(Sender: TObject);
begin
  if (pgctrlOpcoes.ActivePage = tbshSelecRetro) and (chklstFuncRetro.Items.Count = 0) then
  begin
    // Preenche Lista dos Centros de Custo
    CriarListaCCusto;
    // Preenche Lista dos Sindicatos
    CriarListaSindicatos;
    // Preenche Lista dos Empregados
    CriarListaEmpregados(true);
  end;
end;

procedure TfrmGeraCalcMT.dblckTipoDocCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (Trim(dblckTipoDoc.Text) <> '') then
  begin
    if (dtDataPag.Text = '') then
      dtDataPag.Date := dtDataPagFolha.Date;

    townCAP.Top := Self.Top + 80;
    townCAP.Left := Self.Left + 184;
    townCAP.BringToFront;
    townCAP.Visible := true;
    Self.Enabled := false;
  end;
end;

procedure TfrmGeraCalcMT.dbgrdRubEmpreKeyPress(Sender: TObject; var Key: Char);
begin
  CdsRubrica.Locate('DESCRICAO', Key, [loCaseInsensitive,loPartialKey]);
end;

procedure TfrmGeraCalcMT.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := cbxAtivos.Checked;
  bSitAfast := cbxAfastados.Checked;
end;

procedure TfrmGeraCalcMT.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Situação deve ser selecionado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    gbxSituacao.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) then
    CriarListaEmpregados(true);
end;

procedure TfrmGeraCalcMT.gbxTipContrEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmGeraCalcMT.gbxTipContrExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked) and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked) and not(cbxTerceiros.Checked) and
     not(cbxPropDirSemVinc.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Contrato deve ser selecionado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    cbxEfetivos.SetFocus;
  end
  else
  if (bTipContrEfet <> cbxEfetivos2.Checked) or (bTipContrEspec <> cbxEspeciais2.Checked) or
     (bTipContrTemp <> cbxTemporarios2.Checked) or (bTipContrEst <> cbxEstagiarios2.Checked) or
     (bTipContrTerc <> cbxTerceiros2.Checked) or (bTipContrProp <> cbxPropDirSemVinc2.Checked) or
     (bTipContrAut <> cbxAutonomos2.Checked) then
    CriarListaEmpregados(false);
end;

procedure TfrmGeraCalcMT.gbxTipContr2Enter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos2.Checked;
  bTipContrEspec := cbxEspeciais2.Checked;
  bTipContrTemp := cbxTemporarios2.Checked;
  bTipContrEst := cbxEstagiarios2.Checked;
  bTipContrTerc := cbxTerceiros2.Checked;
  bTipContrProp := cbxPropDirSemVinc2.Checked;
  bTipContrAut := cbxAutonomos2.Checked;
end;

procedure TfrmGeraCalcMT.gbxTipContr2Exit(Sender: TObject);
begin
  if not(cbxEfetivos2.Checked) and not(cbxEspeciais2.Checked) and
     not(cbxTemporarios2.Checked) and not(cbxTerceiros2.Checked) and
     not(cbxPropDirSemVinc2.Checked) and not(cbxAutonomos2.Checked) and
     not(cbxEstagiarios2.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Contrato deve ser selecionado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    cbxEfetivos2.SetFocus;
  end
  else
  if (bTipContrEfet <> cbxEfetivos2.Checked) or (bTipContrEspec <> cbxEspeciais2.Checked) or
     (bTipContrTemp <> cbxTemporarios2.Checked) or (bTipContrEst <> cbxEstagiarios2.Checked) or
     (bTipContrTerc <> cbxTerceiros2.Checked) or (bTipContrProp <> cbxPropDirSemVinc2.Checked) or
     (bTipContrAut <> cbxAutonomos2.Checked) then
    CriarListaEmpregados(true);
end;

procedure TfrmGeraCalcMT.chklstCCustoExit(Sender: TObject);
var
  c: integer;
  MudouCCusto: boolean;
begin
  // Verifico se alguma seleção de Centros de Custo foi alterada
  MudouCCusto := false;
  for c:=0 to chklstCCusto.Items.Count-1 do
    if (Boolean(StrToInt(ListaCheckCCusto[c])) <> chklstCCusto.Checked[c]) then
    begin
      MudouCCusto := true;
      break;
    end;
  // Atualizo a nova posição da Lista de c. Custo
  for c:=0 to chklstCCusto.Items.Count-1 do
    ListaCheckCCusto[c] := IntToStr(Integer(chklstCCusto.Checked[c]));

  if (MudouCCusto) then
  begin
    CriarListaEmpregados(true);
    if (pgctrlFuncRetro.ActivePageIndex = 0) then
      chklstFuncRetro.Repaint;
  end;
end;

procedure TfrmGeraCalcMT.chklstSindicatoExit(Sender: TObject);
var
  c: integer;
  MudouSindicato: boolean;
begin
  // Verifico se alguma seleção de Sindicato foi alterada
  MudouSindicato := false;
  for c:=0 to chklstSindicato.Items.Count-1 do
    if (Boolean(StrToInt(ListaCheckSindicato[c])) <> chklstSindicato.Checked[c]) then
    begin
      MudouSindicato := true;
      break;
    end;
  // Atualizo a nova posição da Lista de Sindicato
  for c:=0 to chklstSindicato.Items.Count-1 do
    ListaCheckSindicato[c] := IntToStr(Integer(chklstSindicato.Checked[c]));

  if (MudouSindicato) then
  begin
    CriarListaEmpregados(true);
    if (pgctrlFuncRetro.ActivePageIndex = 0) then
      chklstFuncRetro.Repaint;
  end;
end;

procedure TfrmGeraCalcMT.chklstCCustoClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
  chklstCCustoExit(Sender);
end;

procedure TfrmGeraCalcMT.chklstSindicatoClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
  chklstSindicatoExit(Sender);
end;

procedure TfrmGeraCalcMT.chklstEstabClickCheck(Sender: TObject);
var
  c: integer;
  bAchouChecked: boolean;
begin
  bAchouChecked := false;
  for c:=0 to chklstEstab.Items.Count-1 do
    if (chklstEstab.Checked[c]) then
    begin
      bAchouChecked := true;
      break;
    end;

  if not(bAchouChecked) then
  begin
    chklstEstab.Checked[chklstEstab.ItemIndex] := true;
    exit;
  end;

  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
  CriarListaEmpregados(false);
end;

procedure TfrmGeraCalcMT.chklstRubricaClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmGeraCalcMT.chklstEmpresaClickCheck(Sender: TObject);
var
  c: integer;
  bAchouChecked: boolean;
begin
  bAchouChecked := false;
  for c:=0 to chklstEmpresa.Items.Count-1 do
    if (chklstEmpresa.Checked[c]) then
    begin
      bAchouChecked := true;
      break;
    end;

  if not(bAchouChecked) then
  begin
    chklstEmpresa.Checked[chklstEmpresa.ItemIndex] := true;
    exit;
  end;

  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
  CriaListaOpcoes(chklstEmpresa, ListaIdEmpresa, sListaIdEmpresaSel, ',', false);

  // Preenche Lista dos Estabelecimentos
  CriarListaEstab;
  // Preenche Lista das Rubricas
  CriarListaRubricas;
  // Preenche Lista dos Empregados
  CriarListaEmpregados(false);

  if (pgctrlOpcoes.ActivePage = tbsEmpresas) then
    chklstFunc.Repaint;
end;

procedure TfrmGeraCalcMT.btnOkCAPClick(Sender: TObject);
begin
  Self.Enabled := true;
  townCAP.Visible := false;
end;

procedure TfrmGeraCalcMT.btnCancelarCAPClick(Sender: TObject);
begin
  Self.Enabled := true;
  townCAP.Visible := false;
  dblckTipoDoc.Text := '';
  dblckTipoDoc.SetFocus;
end;

procedure TfrmGeraCalcMT.bbtnSelPastaPagClick(Sender: TObject);
begin
  ProcuraDirDlg.Directory := edPastaArqPag.Text;
  if (ProcuraDirDlg.Execute) then
    edPastaArqPag.Text := ProcuraDirDlg.Directory;
end;

procedure TfrmGeraCalcMT.chkPagEletronicoClick(Sender: TObject);
begin
  edPastaArqPag.Enabled := chkPagEletronico.Checked;
  bbtnSelPastaPag.Enabled := chkPagEletronico.Checked;
end;

procedure TfrmGeraCalcMT.chkCAPClick(Sender: TObject);
begin
  chkRateioCC.Enabled := chkCAP.Checked;
  chkCriaDocIndividual.Enabled := chkCAP.Checked;
  chklstTipoDesemb.Enabled := chkCAP.Checked;
  bbtnSelTipo.Enabled := chkCAP.Checked;
  bbtnInvTipo.Enabled := chkCAP.Checked;
end;

procedure TfrmGeraCalcMT.bbtnVoltarClick(Sender: TObject);
begin
  pnlFundo.SendToBack;
  pnlOpcoes.BringToFront;
end;

procedure TfrmGeraCalcMT.bbtnVerResultadoClick(Sender: TObject);
begin
  pnlFundo.BringToFront;
  pnlOpcoes.SendToBack;
end;

procedure TfrmGeraCalcMT.bbtnSalvarClick(Sender: TObject);
begin
  SaveDlg.Title := 'Salvar Resultado da Geração';
  if (SaveDlg.Execute) then
    memResult.Lines.SaveToFile(SaveDlg.FileName);
end;

procedure TfrmGeraCalcMT.bbtnSelEmprClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEmpresa.Items.Count-1 do
    chklstEmpresa.Checked[c] := true;
  chklstEmpresa.Repaint;
  chklstEmpresaClickCheck(bbtnSelEmpr);
end;

procedure TfrmGeraCalcMT.bbtnInvEmprClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEmpresa.Items.Count-1 do
    chklstEmpresa.Checked[c] := not(chklstEmpresa.Checked[c]);
  chklstEmpresa.Repaint;
  chklstEmpresaClickCheck(bbtnInvEmpr);
end;

procedure TfrmGeraCalcMT.bbtnSelTudoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := true;
  chklstRubrica.Repaint;
end;

procedure TfrmGeraCalcMT.bbtnInverteClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := not(chklstRubrica.Checked[c]);
  chklstRubrica.Repaint;
end;

procedure TfrmGeraCalcMT.bbtnSelEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  chklstEstab.Repaint;
end;

procedure TfrmGeraCalcMT.bbtnInvEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  chklstEstab.Repaint;
end;

procedure TfrmGeraCalcMT.bbtnSelPessoaClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
end;

procedure TfrmGeraCalcMT.bbtnInvPessoaClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
end;

procedure TfrmGeraCalcMT.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFuncRetro.Items.Count-1 do
    chklstFuncRetro.checked[c] := true;
  chklstFuncRetro.Repaint;
end;

procedure TfrmGeraCalcMT.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFuncRetro.Items.Count-1 do
    chklstFuncRetro.Checked[c] := not(chklstFuncRetro.Checked[c]);
  chklstFuncRetro.Repaint;
end;

procedure TfrmGeraCalcMT.bbtnSelTodosCCustoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := true;
  chklstCCusto.Repaint;

  if (pgctrlFuncRetro.ActivePageIndex = 0) then
  begin
    CriarListaEmpregados(true);
    chklstFuncRetro.Repaint;
  end;
end;

procedure TfrmGeraCalcMT.bbtnInverteSelCCustoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := not(chklstCCusto.Checked[c]);
  chklstCCusto.Repaint;

  if (pgctrlFuncRetro.ActivePageIndex = 0) then
  begin
    CriarListaEmpregados(true);
    chklstFuncRetro.Repaint;
  end;
end;

procedure TfrmGeraCalcMT.bbtnSelTodosSindicatoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstSindicato.Items.Count-1 do
    chklstSindicato.Checked[c] := true;
  chklstSindicato.Repaint;

  if (pgctrlFuncRetro.ActivePageIndex = 0) then
  begin
    CriarListaEmpregados(true);
    chklstFuncRetro.Repaint;
  end;
end;

procedure TfrmGeraCalcMT.bbtnInverteSelSindicatoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstSindicato.Items.Count-1 do
    chklstSindicato.Checked[c] := not(chklstSindicato.Checked[c]);
  chklstSindicato.Repaint;

  if (pgctrlFuncRetro.ActivePageIndex = 0) then
  begin
    CriarListaEmpregados(true);
    chklstFuncRetro.Repaint;
  end;
end;

procedure TfrmGeraCalcMT.bbtnSelTipoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoDesemb.Items.Count-1 do
    chklstTipoDesemb.Checked[c] := true;
  chklstTipoDesemb.Repaint;
end;

procedure TfrmGeraCalcMT.bbtnInvTipoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoDesemb.Items.Count-1 do
    chklstTipoDesemb.Checked[c] := not(chklstTipoDesemb.Checked[c]);
  chklstTipoDesemb.Repaint;
end;

procedure TfrmGeraCalcMT.rgOpcRetroClick(Sender: TObject);
begin
  gbxRetroSelec.Visible := (rgOpcRetro.ItemIndex = 0);
  gbxRetroOpc.Visible := (rgOpcRetro.ItemIndex = 0);
  rgSelecRetro.Enabled := (rgOpcRetro.ItemIndex = 0);
  if (rgOpcRetro.ItemIndex = 1) then
  begin
    rgSelecRetro.ItemIndex := 0;
    rgSelecRetroClick(Self);
  end;
end;

procedure TfrmGeraCalcMT.sbtnAssociarBaseClick(Sender: TObject);
begin
  lstBase.Add(CdsRubrica.FieldByName('IDPROVENTO').asString);
  lstbxBase.Items.Add(Alinha(IntToStr(lstbxBase.Items.Count+1),3,'D','0') +#9+
    fValidaDados('*',CdsRubrica.FieldByName('DESCRICAO').asString,40)     +#9+
    fValidaDados('*',CdsRubrica.FieldByName('IDPROVENTO').asString,10));
end;

procedure TfrmGeraCalcMT.sbtnAssociarComplemClick(Sender: TObject);
begin
  lstComplem.Add(CdsRubrica.FieldByName('IDPROVENTO').asString);
  lstbxComplem.Items.Add(Alinha(IntToStr(lstbxComplem.Items.Count+1),3,'D','0') +#9+
    fValidaDados('*',CdsRubrica.FieldByName('DESCRICAO').asString,40)           +#9+
    fValidaDados('*',CdsRubrica.FieldByName('IDPROVENTO').asString,10));
end;

procedure TfrmGeraCalcMT.sbtnAssociarResultClick(Sender: TObject);
begin
  lstResult.Add(CdsRubrica.FieldByName('IDPROVENTO').asString);
  lstbxResult.Items.Add(Alinha(IntToStr(lstbxResult.Items.Count+1),3,'D','0') +#9+
    fValidaDados('*',CdsRubrica.FieldByName('DESCRICAO').asString,40)         +#9+
    fValidaDados('*',CdsRubrica.FieldByName('IDPROVENTO').asString,10)        +#9+
    fValidaDados('*',CdsRubrica.FieldByName('IDREGRA').asString,10));

  if not(CdsRubrica.FieldByName('IDREGRA').IsNull) then
    lstbxTipoCalc.Items.Add('3')
  else
  if (cmbTipoCalc.ItemIndex < 2) then
    if (lstbxBase.Items.Count > lstbxTipoCalc.Items.Count) and
       (Trim(lstbxBase.GetFieldItem(lstbxTipoCalc.Items.Count,2)) <> 'XXXXXXXXXX') then
      lstbxTipoCalc.Items.Add(IntToStr(cmbTipoCalc.ItemIndex + 1))
    else
      lstbxTipoCalc.Items.Add('2');
end;

procedure TfrmGeraCalcMT.sbtnAssociarTodosBaseClick(Sender: TObject);
begin
  lstbxBase.Items.BeginUpdate;
  sbtnDesassociarTodosBaseClick(Sender);
  CdsRubrica.First;
  while not(CdsRubrica.EOF) do
  begin
    sbtnAssociarBaseClick(Sender);
    CdsRubrica.Next;
  end;
  CdsRubrica.First;
  lstbxBase.Items.EndUpdate;
end;

procedure TfrmGeraCalcMT.sbtnAssociarTodosComplemClick(Sender: TObject);
begin
  lstbxComplem.Items.BeginUpdate;
  sbtnDesassociarTodosComplemClick(Sender);
  CdsRubrica.First;
  while not(CdsRubrica.EOF) do
  begin
    sbtnAssociarComplemClick(Sender);
    CdsRubrica.Next;
  end;
  CdsRubrica.First;
  lstbxComplem.Items.EndUpdate;
end;

procedure TfrmGeraCalcMT.sbtnAssociarTodosResultClick(Sender: TObject);
begin
  lstbxTipoCalc.Items.BeginUpdate;
  lstbxResult.Items.BeginUpdate;
  sbtnDesassociarTodosResultClick(Sender);
  CdsRubrica.First;
  while not(CdsRubrica.EOF) do
  begin
    sbtnAssociarResultClick(Sender);
    CdsRubrica.Next;
  end;
  CdsRubrica.First;
  lstbxResult.Items.EndUpdate;
  lstbxTipoCalc.Items.EndUpdate;
end;

procedure TfrmGeraCalcMT.bbtnNenhumaBaseClick(Sender: TObject);
begin
  lstBase.Add('XXXXXXXXXX');
  lstbxBase.Items.Add(Alinha(IntToStr(lstbxBase.Items.Count+1),3,'D','0') +#9+
    'Nenhuma' +#9+ 'XXXXXXXXXX');
end;

procedure TfrmGeraCalcMT.bbtnNenhumaRubComplClick(Sender: TObject);
begin
  lstComplem.Add('XXXXXXXXXX');
  lstbxComplem.Items.Add(Alinha(IntToStr(lstbxComplem.Items.Count+1),3,'D','0') +#9+
    'Nenhuma' +#9+ 'XXXXXXXXXX');
end;

procedure TfrmGeraCalcMT.sbtnDesassociarBaseClick(Sender: TObject);
begin
  if (lstbxBase.ItemIndex > -1) then
  begin
    lstBase.Delete(lstbxBase.ItemIndex);
    lstbxBase.Items.Delete(lstbxBase.ItemIndex);
  end;
end;

procedure TfrmGeraCalcMT.sbtnDesassociarComplemClick(Sender: TObject);
begin
  if (lstbxComplem.ItemIndex > -1) then
  begin
    lstComplem.Delete(lstbxComplem.ItemIndex);
    lstbxComplem.Items.Delete(lstbxComplem.ItemIndex);
  end;
end;

procedure TfrmGeraCalcMT.sbtnDesassociarResultClick(Sender: TObject);
begin
  if (lstbxResult.ItemIndex > -1) then
  begin
    lstResult.Delete(lstbxResult.ItemIndex);
    lstbxTipoCalc.Items.Delete(lstbxResult.ItemIndex);
    lstbxResult.Items.Delete(lstbxResult.ItemIndex);
  end;
end;

procedure TfrmGeraCalcMT.sbtnDesassociarTodosBaseClick(Sender: TObject);
begin
  lstBase.Clear;
  lstbxBase.Clear;
end;

procedure TfrmGeraCalcMT.sbtnDesassociarTodosComplemClick(Sender: TObject);
begin
  lstComplem.Clear;
  lstbxComplem.Clear;
end;

procedure TfrmGeraCalcMT.sbtnDesassociarTodosResultClick(Sender: TObject);
begin
  lstResult.Clear;
  lstbxResult.Clear;
  lstbxTipoCalc.Clear;
end;

procedure TfrmGeraCalcMT.rgProcessoClick(Sender: TObject);
begin
  rgOpcaoPrevia.Visible := (rgProcesso.ItemIndex = 0);
end;

procedure TfrmGeraCalcMT.rgTipoFolhaClick(Sender: TObject);
begin
  gbxDtFerias.Visible := (rgTipoFolha.ItemIndex = 1);
end;

procedure TfrmGeraCalcMT.rgSelecRetroClick(Sender: TObject);
begin
  gbxFunc.Visible := (rgSelecRetro.ItemIndex = 1);
  gbxFiltroCCusto.Visible := (rgSelecRetro.ItemIndex = 1);
  gbxFiltroSindicato.Visible := (rgSelecRetro.ItemIndex = 1);
end;

procedure TfrmGeraCalcMT.bbtnGeracaoClick(Sender: TObject);
var
  wNum: word;
  bOk, bSelFunc: boolean;
  c, iIdMotivo: integer;
  bRetroApenas, bForcarGeracao13: boolean;
  sListaEmpregadoSel, sListaEmpregadoRetroSel: string;
begin
  bSelFunc := false;
  for c:=0 to chklstFunc.Items.Count-1 do
    if (chklstFunc.Checked[c]) then
    begin
      bSelFunc := true;
      break;
    end;

  if not(bSelFunc) then
  begin
    MsgDlg('Pelo menos um Empregado deve ser selecionado.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    chklstFunc.SetFocus;
    exit;
  end;

  if (rgTipoFolha.ItemIndex = 1) and ((dtFeriasIni.Text = '') or (dtFeriasFim.Text = '')) then
  begin
    MsgDlg('Período de Gozo: Datas Não Podem Ficar em Branco.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dtFeriasIni.SetFocus;
    exit;
  end;

  if (rgTipoFolha.ItemIndex = 1) and (dtFeriasIni.Date > dtFeriasFim.Date) then
  begin
    MsgDlg('Período de Gozo: Data Início Não Pode Ser Posterior à Final.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dtFeriasIni.SetFocus;
    exit;
  end;

  if (rgOpcRetro.ItemIndex = 0) then
  begin
    if (lstbxBase.Items.Count = 0) then
    begin
      MsgDlg('Informe ao Menos uma Rubrica Base para o Retroativo.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      pgctrlOpcoes.ActivePage := tbshRetroativo;
      exit;
    end;

    if (lstbxBase.Items.Count  <> lstbxResult.Items.Count) or
       ((lstbxBase.Items.Count <> lstbxComplem.Items.Count) and
        (lstbxComplem.Items.Count > 0)) then
    begin
      MsgDlg('Incompatibilidade na relação Rubricas'+CR_LF+
             'Base/Complementares/Resultantes para o Retroativo.',
             'Aviso', mtInformation, [mbOk,mbHelp], 0);
      pgctrlOpcoes.ActivePage := tbshRetroativo;
      exit;
    end;

     for c:=0 to lstbxTipoCalc.Items.Count-1 do
       if (lstbxTipoCalc.Items[c] = '2') and (rePercRetro.Value = 0) then
       begin
         MsgDlg('Informe a Base Perecentual para o Retroativo.', 'Aviso',
           mtInformation, [mbOk,mbHelp], 0);
         pgctrlOpcoes.ActivePage := tbshRetroativo;
         rePercRetro.SetFocus;
         exit;
       end;
  end;

  if (Trim(dblckMotivo.Text) = '') then
  begin
    MsgDlg('Informe um Tipo de Folha a ser processado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    dblckMotivo.SetFocus;
    exit;
  end;

  bForcarGeracao13 := false;
  if (rgTipoFolha.ItemIndex = 2) and
     (MsgDlg('Se este processo de 13º é para todos, responda Sim.'+CR_LF+
             'Se for só para quem solicitou adiantamento, responda Não.',
             'Confirmação', mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrYes) then
  begin
    bForcarGeracao13 := true;
  end;

  if (Trim(dblckTipoDoc.Text) = '') and (rgProcesso.ItemIndex = 1) then
    if (MsgDlg('Integração com Contas a Pagar não será feita.' +CR_LF+ 'Confirma?',
               'Confirmação', mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrNo) then
    begin
      dblckTipoDoc.SetFocus;
      exit;
    end;

  if (rgProcesso.ItemIndex = 0) then
    if ((rgOpcaoPrevia.ItemIndex = 0) and
        (MsgDlg('Qualquer Prévia Anterior Será Destruída.' +CR_LF+
                'Confirma a Execução?', 'Confirmação',
                mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrNo)) or
       ((rgOpcaoPrevia.ItemIndex = 1) and
        (MsgDlg('Prévia Desse(s) Tipo(s) de Folha Será Destruída.' +CR_LF+
                'Confirma a Execução?', 'Confirmação',
                mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrNo)) or
       ((rgOpcaoPrevia.ItemIndex = 2) and
        (MsgDlg('Prévia da(s) Pessoa(s) Selecionada(s) Será Destruída.' +CR_LF+
                'Confirma a Execução?', 'Confirmação',
                mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrNo)) or
       ((rgOpcaoPrevia.ItemIndex = 3) and
        (MsgDlg('Prévia Desse(s) Tipo(s) de Folha e da(s) Pessoa(s) Selecionada(s) Será Destruída.' +CR_LF+
                'Confirma a Execução?', 'Confirmação',
                mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrNo)) or
       ((rgOpcaoPrevia.ItemIndex = 4) and
        (MsgDlg('Nenhuma Prévia Será Destruída.' +CR_LF+
                'Confirma a Execução?', 'Confirmação',
                mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrNo)) then
    begin
      rgProcesso.SetFocus;
      exit;
    end;

  // Testar mês e ano de referência
  if (Trim(cmbMes.Text) = '') then
  begin
    MsgDlg('Preencha o Mês de Referência.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    cmbMes.SetFocus;
    exit;
  end;

  if (Trim(spnedAno.Text) = '') then
  begin
    MsgDlg('Preencha o Ano de Referência.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    spnedAno.SetFocus;
    exit;
  end;

  // Testar a data da Folha
  if (Trim(dtDataPagFolha.Text) = '') then
  begin
    MsgDlg('Preencha a Data da Folha.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dtDataPagFolha.SetFocus;
    exit;
  end;

  iIdMotivo := StrToIntDef(dblckMotivo.LookupValue, 0);
  // Tipo de Retroativo
  if (rgOpcRetro.ItemIndex = 0) and (iIdMotivo <> iIdMotivoPadrao) and (iIdMotivo > 0) then
  begin
    bRetroApenas := true;

    for c:=0 to lstbxBase.Items.Count-1 do
      if (Trim(lstbxBase.GetFieldItem(c,2)) <> 'XXXXXXXXXX') then
      begin
        bRetroApenas := false;
        break;
      end;

      if (bRetroApenas) and
         (MsgDlg('Confirma Folha apenas para cálculo Retroativo?', 'Confirmação',
                 mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrNo) then
        begin
          pgctrlOpcoes.ActivePage := tbshRetroativo;
          exit;
        end;
  end;

  // Empregados escolhidos
  wNum := CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaEmpregadoSel, ',', false);
  if (wNum = ListaIdFunc.Count) then
    sListaEmpregadoSel := ''
  else
  if (sListaEmpregadoSel = '') and (rgOpcaoPrevia.ItemIndex in [2,3]) then
  begin
    MsgDlg('Opção da Prévia requer a seleção de Pessoa(s)', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  pnlFundo.SendToBack;
  pnlOpcoes.BringToFront;

  memResult.Lines.Clear;
  memResult.Lines.Add('Geração da ' +Trim(dblckMotivo.Text));
  memResult.Lines.Add('Data do Processamento: ' +dtDataPagFolha.Text);
  memResult.Lines.Add('');
  memResult.Lines.Add('Mês de Referência: '+ PoeZero(cmbMes.ItemIndex+1) +'/'+ IntToStr(spnedAno.Value));
  memResult.Lines.Add('--------------------------------------------------');
  memResult.Lines.Add('');

  lblHoraIni.Caption := 'Hora de Início: ' +TimeToStr(Time);
  lblQtdeFunc.Caption := 'Qtde: 0';
  lblTempoDecorr.Caption := '00:00:00';
  lblProcesso.Caption := 'Preparando Dados Iniciais do Processo. Aguarde...';
  lblMatrNome.Caption := '';

  gagTotal.Progress := 0;
  Dock971.Enabled := false;
  pnlFundo.Enabled := false;
  pnlProgresso.Top := 143;
  pnlProgresso.BringToFront;
  pnlProgresso.Visible := true;

  // Empregados escolhidos para o Retroativo
  wNum := CriaListaOpcoes(chklstFuncRetro, ListaIdFunc, sListaEmpregadoRetroSel, ',', false);
  if (wNum = ListaIdFunc.Count) then
    sListaEmpregadoRetroSel := '';

  // Demais itens escolhidos nas listas
  CriaListaOpcoes(chklstEmpresa, ListaIdEmpresa, sListaIdEmpresaSel, ',', false);
  CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);
  CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);
  CriaListaOpcoes(chklstTipoDesemb, ListaCodTipoDesemb, sListaTipoDesembSel, ',', false);

  // Processo de Geração da Rescisão
  CtrlGeraFolPagNormal.CreateThreadProgresso;
  bOk := CtrlGeraFolPagNormal.Processar(cmbMes.ItemIndex+1, spnedAno.Value,
    Modulo.IdContraCheque, Sistema.IdEmpresa, Sistema.TipoEmpresa, rgProcesso.ItemIndex,
    dtDataPagFolha.Date, rgTipoFolha.ItemIndex, iIdMotivo, iIdMotivoPadrao,
    rgOpcaoPrevia.ItemIndex, dtFeriasIni.Date, dtFeriasFim.Date, sListaIdEmpresaSel,
    sListaIdEstabSel, sListaEmpregadoSel, sListaIdRubricaSel,
    GerarListaTipoContratoSel(cbxEfetivos.Checked, cbxEspeciais.Checked,
      cbxTemporarios.Checked, cbxTerceiros.Checked, cbxPropDirSemVinc.Checked,
      cbxAutonomos.Checked, cbxEstagiarios.Checked),
    // Retroativo
    rgOpcRetro.ItemIndex = 0, speQtMeses.Value, rePercRetro.Value, lstbxBase.Items.Text,
    lstbxComplem.Items.Text, lstbxResult.Items.Text, lstbxTipoCalc.Items.Text,
    rgSelecRetro.ItemIndex = 0, sListaEmpregadoRetroSel,
    // Contas a Pagar / Pagamento Eletrônico
    (chkPagEletronico.Checked) and (Trim(dblckTipoDoc.Text)<>''),
    (chkCAP.Checked) and (Trim(dblckTipoDoc.Text)<>''), dtDataPag.Date, Date,
    chkRateioCC.Checked, chkCriaDocIndividual.Checked, Sistema.IdUsuario,
    IFF(Trim(dblckTipoDoc.Text)<>'', CdsTipoDoc.FieldByName('CODTIPDOC').asInteger, -1),
    IFF(Trim(dblckPortadorForma.Text)<>'', CdsPortadorForma.FieldByName('CODPORTFORMA').asInteger, -1),
    edPastaArqPag.Text, Sistema.UsaPlanoPatro, ParamIntegra.ObrigaAbc,
    ParamIntegra.ObrigaCrespon, ParamIntegra.PlanoPrevGlobal, ParamIntegra.PatroGlobal,
    sListaTipoDesembSel, Sistema.UsaRAD, bForcarGeracao13);
  CtrlGeraFolPagNormal.FreeThreadProgresso;

  Dock971.Enabled := true;
  pnlFundo.Enabled := true;

  if (bOk) then
  begin
    memResult.Lines.Add('Registros Processados : ' +IntToStr(CtrlGeraFolPagNormal.NumRegProcessados));
    memResult.Lines.Add('Tempo de Processamento: ' +CtrlGeraFolPagNormal.TempoDecorridoTotal);
    MsgDlg(CtrlGeraFolPagNormal.MessageInfo, 'Aviso', mtWarning, [mbOk,mbHelp], 0);
  end
  else
  begin
    memResult.Lines.Add(CtrlGeraFolPagNormal.MessageInfo);
    MsgDlg(CtrlGeraFolPagNormal.MessageInfo, 'Erro', mtWarning, [mbOk,mbHelp], 0);
  end;

  gagTotal.Progress := 0;
  pnlProgresso.Visible := false;
  pnlFundo.BringToFront;

  if (bOk) and (Modulo.IdContraCheque = SERPROS) and (iIdMotivo = iIdMotivoPadrao) and
     (rgProcesso.ItemIndex = 1) then
    GerarArquivosSERPROS;
end;

procedure TfrmGeraCalcMT.CriarListaEmpregados(AgrupaCCusto: boolean);
begin
  CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);
  CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCusto, ',', false);
  CriaListaOpcoes(chklstSindicato, ListaIdSindicato, sListaIdSindicatoSel, ',', false);
  CriaListaOpcoes(chklstEmpresa, ListaIdEmpresa, sListaIdEmpresaSel, ',', false);

  if (AgrupaCCusto) then
  begin
    sListaSitFunc := GerarListaSitFuncSel(cbxAtivos.Checked, cbxAfastados.Checked, false);
    sListaTipoContr := GerarListaTipoContratoSel(cbxEfetivos2.Checked, cbxEspeciais2.Checked,
      cbxTemporarios2.Checked, cbxTerceiros2.Checked, cbxPropDirSemVinc2.Checked,
      cbxAutonomos2.Checked, cbxEstagiarios2.Checked);
  end
  else
  begin
    sListaSitFunc := '';
    sListaTipoContr := GerarListaTipoContratoSel(cbxEfetivos.Checked, cbxEspeciais.Checked,
      cbxTemporarios.Checked, cbxTerceiros.Checked, cbxPropDirSemVinc.Checked,
      cbxAutonomos.Checked, cbxEstagiarios.Checked);
  end;

  dtmBaseDados.Cds.Data := CtrlGeraFolPagNormal.ListFuncionarios(sListaIdEmpresaSel,
    AgrupaCCusto, sListaIdEstabSel, sListaCodCCusto, sListaIdSindicatoSel,
    sListaSitFunc, sListaTipoContr);

  if (AgrupaCCusto) then
  begin
    ListaIdFuncRetro.Clear;
    chklstFuncRetro.Items.Clear;
    while not(dtmBaseDados.Cds.EOF) do
    begin
      ListaIdFuncRetro.Add(dtmBaseDados.Cds.FieldByName('IDPESSOA').asString);
      chklstFuncRetro.Items.Add(dtmBaseDados.Cds.FieldByName('NOME').asString);
      chklstFuncRetro.Checked[chklstFuncRetro.Items.Count-1] := true;
      dtmBaseDados.Cds.Next;
    end;
  end
  else
  begin
    ListaIdFunc.Clear;
    chklstFunc.Items.Clear;
    while not(dtmBaseDados.Cds.EOF) do
    begin
      ListaIdFunc.Add(dtmBaseDados.Cds.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(dtmBaseDados.Cds.FieldByName('NOME').asString);
      chklstFunc.Checked[chklstFunc.Items.Count-1] := true;
      dtmBaseDados.Cds.Next;
    end;
  end;
end;

procedure TfrmGeraCalcMT.LerAlteracoes;
var
  sRubAtual, sGravaPadrao: string;
{->}procedure SelOpcoes(Lista: TStrings; ListBox: TColorListBox);
    begin
      Lista.Clear;
      ListBox.Clear;
      while (sGravaPadrao <> '') do
      begin
        sRubAtual := Copy(sGravaPadrao,1,Pos(',',sGravaPadrao)-1);

        // Quando está na última Rubrica
        if (sRubAtual = '') then
          sRubAtual := sGravaPadrao;

        Delete(sGravaPadrao, 1, Length(sRubAtual)+1);
        Lista.Add(sRubAtual);

        if (ListBox.Name <> 'lstbxTipoCalc') then
        begin
          if (sRubAtual = 'XXXXXXXXXX') then
            ListBox.Items.Add(Alinha(IntToStr(ListBox.Items.Count+1),3,'D','0') +#9+
                              'Nenhuma' +#9+ 'XXXXXXXXXX')
          else
          if (CdsRubrica.Locate('IDPROVENTO', sRubAtual, [])) then
            ListBox.Items.Add(Alinha(IntToStr(ListBox.Items.Count+1),3,'D','0') +#9+
              fValidaDados('*',CdsRubrica.FieldByName('DESCRICAO').asString,40) +#9+
              fValidaDados('*',CdsRubrica.FieldByName('IDPROVENTO').asString,10)+#9+
              fValidaDados('*',CdsRubrica.FieldByName('IDREGRA').asString,10));
        end;
      end;
{->}end;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('c:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  sGravaPadrao := ArqConfig.ReadString('GERACAO_FOLHA', 'RubricasBase', '');
  SelOpcoes(lstBase, lstbxBase);

  sGravaPadrao := ArqConfig.ReadString('GERACAO_FOLHA', 'RubricasComplem', '');
  SelOpcoes(lstComplem, lstbxComplem);

  sGravaPadrao := ArqConfig.ReadString('GERACAO_FOLHA', 'RubricasResult', '');
  SelOpcoes(lstResult, lstbxResult);

  sGravaPadrao := ArqConfig.ReadString('GERACAO_FOLHA', 'RubricasTipoCalc', '');
  SelOpcoes(lstbxTipoCalc.Items, lstbxTipoCalc);
end;

procedure TfrmGeraCalcMT.GravarAlteracoes;
var
  sGravaPadrao: string;
{->}procedure CriaLiOp(Lista: TStrings);
    var
      c: integer;
    begin
      sGravaPadrao := '';
      for c:=0 to Lista.Count-1 do
        if (sGravaPadrao = '') then
          sGravaPadrao := sGravaPadrao + Lista[c]
        else
          sGravaPadrao := sGravaPadrao +','+ Lista[c];
{->}end;
begin
  CriaLiOp(lstBase);
  ArqConfig.WriteString('GERACAO_FOLHA', 'RubricasBase', sGravaPadrao);

  CriaLiOp(lstComplem);
  ArqConfig.WriteString('GERACAO_FOLHA', 'RubricasComplem', sGravaPadrao);

  CriaLiOp(lstResult);
  ArqConfig.WriteString('GERACAO_FOLHA', 'RubricasResult', sGravaPadrao);

  CriaLiOp(lstbxTipoCalc.Items);
  ArqConfig.WriteString('GERACAO_FOLHA', 'RubricasTipoCalc', sGravaPadrao);
end;

procedure TfrmGeraCalcMT.CriarListaEmpresas;
begin
  dtmBaseDados.Cds.Data := CtrlListTerceirosRH.ListEmpresaProp(Sistema.IdEmpresa);
  chklstEmpresa.Items.Clear;
  ListaIdEmpresa.Clear;
  while not(dtmBaseDados.Cds.EOF) do
  begin
    chklstEmpresa.Items.Add(dtmBaseDados.Cds.FieldByName('NOME').asString);
    chklstEmpresa.Checked[chklstEmpresa.Items.Count-1] := true;
    ListaIdEmpresa.Add(dtmBaseDados.Cds.FieldByName('IDPESSOA').asString);
    dtmBaseDados.Cds.Next;
  end;
  CriaListaOpcoes(chklstEmpresa, ListaIdEmpresa, sListaIdEmpresaSel, ',', false);
end;

procedure TfrmGeraCalcMT.CriarListaEstab;
begin
  dtmBaseDados.Cds.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(sListaIdEmpresaSel);
  chklstEstab.Items.Clear;
  ListaIdEstab.Clear;
  while not(dtmBaseDados.Cds.EOF) do
  begin
    chklstEstab.Items.Add(dtmBaseDados.Cds.FieldByName('NOME').asString);
    chklstEstab.Checked[chklstEstab.Items.Count-1] := true;
    ListaIdEstab.Add(dtmBaseDados.Cds.FieldByName('IDPESSOA').asString);
    dtmBaseDados.Cds.Next;
  end;
end;

procedure TfrmGeraCalcMT.CriarListaRubricas;
begin
  CdsRubrica.Data := CtrlProvDesc.ListRubricaEmpresa(sListaIdEmpresaSel);
  chklstRubrica.Items.Clear;
  ListaIdRubrica.Clear;
  while not(CdsRubrica.EOF) do
  begin
    chklstRubrica.Items.Add(CdsRubrica.FieldByName('DESCRPROVDESC').asString);
    ListaIdRubrica.Add(CdsRubrica.FieldByName('IDPROVENTO').asString);
    CdsRubrica.Next;
  end;
  CdsRubrica.First;
end;

procedure TfrmGeraCalcMT.CriarListaDesemb;
var
  c: integer;
begin
  c := 0;
  dtmBaseDados.Cds.Data := CtrlListTerceirosRH.ListTipoDocRecebDesembXContabFolha;
  chklstTipoDesemb.Items.Clear;
  ListaCodTipoDesemb.Clear;
  while not(dtmBaseDados.Cds.EOF) do
  begin
    chklstTipoDesemb.Items.Add(dtmBaseDados.Cds.FieldByName('DESCRICAO').asString);
    chklstTipoDesemb.Checked[c] := true;
    ListaCodTipoDesemb.Add(dtmBaseDados.Cds.FieldByName('CODTIPRECDES').asString);
    dtmBaseDados.Cds.Next;
    Inc(c);
  end;
end;

procedure TfrmGeraCalcMT.CriarListaCCusto;
begin
  dtmBaseDados.Cds.Data := CtrlListTerceirosRH.ListCCusto(sListaIdEmpresaSel);
  chklstCCusto.Items.Clear;
  ListaCodCCusto.Clear;
  ListaCheckCCusto.Clear;
  while not(dtmBaseDados.Cds.EOF) do
  begin
    chklstCCusto.Items.Add(dtmBaseDados.Cds.FieldByName('NOME').asString);
    ListaCodCCusto.Add(dtmBaseDados.Cds.FieldByName('CODCENTROCUSTO').asString);
    ListaCheckCCusto.Add(IntToStr(Integer(false)));
    dtmBaseDados.Cds.Next;
  end;
end;

procedure TfrmGeraCalcMT.CriarListaSindicatos;
begin
  dtmBaseDados.Cds.Data := CtrlPessoaSindicato.ListSindicatoComFuncionarios;
  chklstSindicato.Items.Clear;
  ListaIdSindicato.Clear;
  ListaCheckSindicato.Clear;
  while not(dtmBaseDados.Cds.EOF) do
  begin
    chklstSindicato.Items.Add(dtmBaseDados.Cds.FieldByName('NOME').asString);
    ListaIdSindicato.Add(dtmBaseDados.Cds.FieldByName('IDPESSOA').asString);
    ListaCheckSindicato.Add(IntToStr(Integer(false)));
    dtmBaseDados.Cds.Next;
  end;
end;

procedure TfrmGeraCalcMT.GerarArquivosSERPROS;
var
  sMesRef, svDir: string;
  LinhasArq: TStringList;
begin
  LinhasArq := TStringList.Create;

  sMesRef := IntToStr(spnedAno.Value) +'/'+ PoeZero(cmbMes.ItemIndex+1);

  SaveDlg.Title := 'Local para salvar o Arquivo Texto Assistencial';
  SaveDlg.FileName := 'Assistencial' +TiraBarra(sMesRef);
  if (SaveDlg.Execute) then
  begin
    LinhasArq.Text := CtrlGeraFolPagNormal.GetLinhasArquivo_SERPROS(false);
    LinhasArq.SaveToFile(SaveDlg.FileName);
    svDir := ExtractFilePath(SaveDlg.FileName);
  end
  else
    svDir := '';

  SaveDlg.Title := 'Local para salvar o Arquivo Texto Empréstimos';
  SaveDlg.FileName := 'Emprestimos' +TiraBarra(sMesRef);
  if (svDir = '') then
    SaveDlg.InitialDir := ''
  else
    SaveDlg.InitialDir := svDir;

  if (SaveDlg.Execute) then
  begin
    LinhasArq.Text := CtrlGeraFolPagNormal.GetLinhasArquivo_SERPROS(true);
    LinhasArq.SaveToFile(SaveDlg.FileName);
    svDir := ExtractFilePath(SaveDlg.FileName);
  end;
  LinhasArq.Free;
end;

procedure TfrmGeraCalcMT.Progresso(Args: array of variant);
var
  iNumArgs: integer;
begin
  iNumArgs := High(Args);
  if (iNumArgs >= 0) then
    if (Args[0] <> '') then
      lblProcesso.Caption := Args[0];

  if (iNumArgs >= 1) then
    if (Args[1] <> '') then
      lblTempoDecorr.Caption := Args[1];

  if (iNumArgs >= 2) then
    if (Args[2] > 0) then
      lblQtdeFunc.Caption := 'Qtde: ' + IntToStr(Args[2]);

  if (iNumArgs >= 3) then
    if (Args[3] <> '') then
      lblMatrNome.Caption := Args[3];

  if (iNumArgs >= 4) then
    if (Args[4] > 0) then
      gagTotal.MaxValue := Args[4];

  if (iNumArgs >= 5) then
    if (Args[5] > 0) then
      gagTotal.AddProgress(1);

  if (iNumArgs >= 6) then
    if (Args[6] <> '') then
      memResult.Lines.Add(Args[6]);

  Self.Update;
end;

end.
