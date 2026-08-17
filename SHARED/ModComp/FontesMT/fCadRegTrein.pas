{ Alterações
****************************************************************************************************
Nº SOL......: 203837
Nº KINTANA..: 1969599
Data........: 04/06/2013
Responsável.: Thiago Melo
Descrição...: Retirar envio de mensagens, erro ao alterar partempresa ou partempregado quando
              pago parcialmente
****************************************************************************************************
Rotina......: Registro Individual de Treinamento
Nº SOL......: 177768
Nº KINTANA..: 1635450
Data........: 19/11/2012
Responsável.: Thiago Melo
Descrição...: Alteração na forma de Registro Individual de Treinamento.
****************************************************************************************************
Rotina......: Registro Individual de Treinamento
Nº SOL......: 137268
Nº KINTANA..: 829513
Data........: 24/11/2011
Responsável.: Eraldo Luis da Silva
Descrição...: Integração do Módulo de Treinamento com o Financeiro para a emissão de AP.
****************************************************************************************************
Rotina......: -
Nº SOL......: 116914
Nº KINTANA..: 55renata8952
Data........: 04/04/2011
Responsável.: Thaise Amaral Martins
Descrição...: Criação da geração do termo de compromisso.
****************************************************************************************************
Analista.: Bruno Bastos
Kintana..: 587021
SOL......: 121565
Data.....: 09/07/2009
Descrição: Alteração da propriedade Selected do componente dblckEntid.
****************************************************************************************************
Analista.: Cássio Rovaroto de Camargo
Kintana..: 558951
SOL......: 116905
Data.....: 19/06/2009
Descrição: Inclusão da aba e campo Observação para inclusão de registros.
****************************************************************************************************
Analista.: Bruno Bastos
Kintana..: 559705
SOL......: 116903
Data.....: 26/05/2009
Rotina...: TotalizaHoras
Descrição: Criação da rotina citada acima para calcular o total de horas de curso.
****************************************************************************************************
}

unit fCadRegTrein;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls,
  Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask,
  DBCtrls, CMProcura, wwdblook, ImgList, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, DBClient, uCMClientDataSet, FCadastroMestreDetMT, uCtrlRegTrein,
  uCtrlListTerceirosRH, uCtrlCurso, uCtrlPessoaFuncionario, uCtrlPessoaCandidato, uCtrlCargo,
  wwdbedit, uCtrlEscalaConceitos, uCtrlGlobalRH, uCmSqlParams,
  CMProcuraSubTipo, CMDBLookupCombo, Wwquery,uCtrlDocumento,uCtrlFuncoesRH,
  uCtrlEtapaProcesso, uCtrlPeriodo,uCtrlFinanc,uCtrlContab,uCtrlLancamento,uCtrlPlacontasCapCar, uDiasUteis,
  DBGrids, Math;

type
  TfrmCadRegTrein = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    dbedMatricula: TDBEdit;
    Label10: TLabel;
    dbedNome: TDBEdit;
    dbedSit: TDBEdit;
    dbedCargo: TDBEdit;
    tbshAval: TTabSheet;
    pnlAval: TPanel;
    dbgrdAval: TwwDBGrid;
    dsAval: TwwDataSource;
    sbtnProcurarCand: TToolbarButton97;
    pnlImprimeAval: TPanel;
    sbtnImprimirAval: TSpeedButton;
    CdsEntid: TCMClientDataSet;
    CdsInstrutor: TCMClientDataSet;
    CdsDet: TCMClientDataSet;
    CdsAval: TCMClientDataSet;
    Label18: TLabel;
    DBEdit2: TDBEdit;
    gbxAvalEscal: TGroupBox;
    Label19: TLabel;
    DBMemo1: TDBMemo;
    CdsCurso: TCMClientDataSet;
    dsCargo: TwwDataSource;
    CdsCargo: TCMClientDataSet;
    MontaSelectFunc: TMontaSelect;
    MontaSelectCand: TMontaSelect;
    MontaSelectCurso: TMontaSelect;
    dbredAvaliacao: TDBRealEdit;
    MontaSelectLocal: TMontaSelect;
    MontaSelectExterno: TMontaSelect;
    MontaSelectInterno: TMontaSelect;
    gbxAvalConceitual: TGroupBox;
    CdsEscala: TCMClientDataSet;
    cmbAvalConceitual: TComboBox;
    tbshAval2: TTabSheet;
    dbgrdAval2: TwwDBGrid;
    pnlAval2: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    gbxAvalEscal2: TGroupBox;
    DBRealEdit1: TDBRealEdit;
    DBMemo2: TDBMemo;
    gbxAvalConceitual2: TGroupBox;
    cmbAvalConceitual2: TComboBox;
    dsAval2: TwwDataSource;
    CdsAval2: TCMClientDataSet;
    CdsGeraTermo: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    MsCidades: TMontaSelect;
    dsEndereco: TwwDataSource;
    CdsEndereco: TCMClientDataSet;
    CdsEnderecoNOME: TStringField;
    CdsEnderecoLOGRADOURO: TStringField;
    CdsEnderecoTIPOEND_PADRAO: TStringField;
    CdsEnderecoNUMERO: TStringField;
    CdsEnderecoCOMPLEMENTO: TStringField;
    CdsEnderecoBAIRRO: TStringField;
    CdsEnderecoCEP: TStringField;
    CdsEnderecoNOMECIDADE: TStringField;
    CdsEnderecoNOMEESTADO: TStringField;
    CdsEnderecoNOMEPAIS: TStringField;
    CdsEnderecoIDPESSOA: TFloatField;
    CdsEnderecoIDENDERECO: TFloatField;
    CdsEnderecoIDCIDADES: TFloatField;
    CdsEnderecoCIDADE: TStringField;
    CdsCidade: TCMClientDataSet;
    PageControlDet: TPageControl;
    tbshDadosBasicos: TTabSheet;
    Label4: TLabel;
    Label2: TLabel;
    lblPdCidade: TLabel;
    Label34: TLabel;
    CMProcuraCurso: TCMProcura;
    dblckEntid: TwwDBLookupCombo;
    CmpCidades: TCMProcura;
    EdtSigla: TEdit;
    tbshObservacaoCurso: TTabSheet;
    qryUnidNegoc: TwwQuery;
    qryCentroResp: TwwQuery;
    qryTipoRD: TwwQuery;
    qryCentroCusto: TwwQuery;
    dsCentroCusto: TwwDataSource;
    dsTipoRD: TwwDataSource;
    dsCentroResp: TwwDataSource;
    dsUnidNegoc: TwwDataSource;
    qryProgramaPrev: TwwQuery;
    qryPatroPrev: TwwQuery;
    qryPlanoPrev: TwwQuery;
    dsPlanoPrev: TwwDataSource;
    dsPatroPrev: TwwDataSource;
    dsProgramaPrev: TwwDataSource;
    wwDataSource1: TwwDataSource;
    CMClientDataSet1: TCMClientDataSet;
    CMClientDataSet2: TCMClientDataSet;
    wwDataSource2: TwwDataSource;
    qryDocumento: TQuery;
    CdsEtapa: TCMClientDataSet;
    qryUnidNegocUNIDNEGOC: TFloatField;
    qryUnidNegocNOME: TStringField;
    qryUnidNegocUNECODIGO: TStringField;
    qryUnidNegocUNETIPO: TStringField;
    btnGeraAp: TBitBtn;
    btnExcluirAp: TBitBtn;
    tbshMensalidade: TTabSheet;
    CdsMensalidades: TCMClientDataSet;
    DsMensalidades: TwwDataSource;
    CdsMensalidadesAux: TCMClientDataSet;
    DsMensalidadesAux: TwwDataSource;
    PgCtrlDespesas: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    lblPartEmpresa: TLabel;
    lblPartEmpregado: TLabel;
    btnReplicar: TBitBtn;
    dbrgControle: TDBRadioGroup;
    EdtvlrPartEmpresa: TwwDBEdit;
    EdtVlrPartEmpregado: TwwDBEdit;
    GroupBox1: TGroupBox;
    grdDespesas: TwwDBGrid;
    EdtDtVencimento: TCMDateTimePicker;
    lblVencimentoParcela: TLabel;
    EdtVlrMensalidade: TDBRealEdit;
    lblVlrMensalidade: TLabel;
    GroupBox2: TGroupBox;
    lblVlrEmpresa: TLabel;
    lblVlrEmpregado: TLabel;
    EdtQtdParcela: TwwDBEdit;
    lblQtdParcReal: TLabel;
    EdtNParcela: TwwDBEdit;
    lblQtdParcPrevista: TLabel;
    EdtVlrCurso: TRealEdit;
    lblTotalCurso: TLabel;
    GroupBox3: TGroupBox;
    LblVlrPrevistoCurso: TLabel;
    Label37: TLabel;
    lblDataAtual: TLabel;
    lblValorDevolver: TLabel;
    Label26: TLabel;
    dbedValor: TDBRealEdit;
    GroupBox4: TGroupBox;
    EdtDataEntrega: TCMDateTimePicker;
    lblDataEntrega: TLabel;
    GroupBox5: TGroupBox;
    dbedDurTot: TDBRealEdit;
    Label25: TLabel;
    GroupBox6: TGroupBox;
    DtpFimdaFidelidade: TCMDateTimePicker;
    lblFimDaFidelidade: TLabel;
    mmObservacaoCurso: TDBMemo;
    cmDatReIni: TCMDateTimePicker;
    Label21: TLabel;
    cmDatReFim: TCMDateTimePicker;
    Label22: TLabel;
    btnDespOk: TBitBtn;
    btnDespCancel: TBitBtn;
    EdtValorEmpresa: TRealEdit;
    EdtValorEmpregado: TRealEdit;
    btnAtualizarMeta: TBitBtn;
    GroupBox7: TGroupBox;
    EdtVlrPrevistoCurso: TRealEdit;
    grpVlrDevolver: TGroupBox;
    grpDestacamento: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    dbedViagem: TDBRealEdit;
    dbedHosped: TDBRealEdit;
    dbedOutras: TDBRealEdit;
    CkbProjetoEntregue: TDBCheckBox;
    EdtVlrDevolverDtAtual: TDBRealEdit;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    //Eraldo Luis da Silva SOL 137268 Kintana 829513
    //procedure dbrgAvalTeorChange(Sender: TObject);
    //procedure dbrgAvalPratChange(Sender: TObject);
    procedure dbrgControleChange(Sender: TObject);
    procedure dbrgAvalCursChange(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CMProcuraCursoValidaDados(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure sbtnImprimirAvalClick(Sender: TObject);
    procedure tbcDetalheChanging(Sender: TObject; var AllowChange: Boolean);
    procedure dblckEntidChange(Sender: TObject);
    procedure dbedAvTeorChange(Sender: TObject);
    procedure dblckEntidEnter(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure CdsDetBeforeEdit(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CdsAvalAfterScroll(DataSet: TDataSet);
    procedure bbtnProcLocalClick(Sender: TObject);
    procedure bbtnAlimentaClick(Sender: TObject);
    procedure bbtnBuscaInstrutorExternoClick(Sender: TObject);
    procedure bbtnBuscaInstrutorInternoClick(Sender: TObject);
    procedure cmbAvalConceitualChange(Sender: TObject);
    procedure CdsAval2AfterScroll(DataSet: TDataSet);
    procedure cmbAvalConceitual2Change(Sender: TObject);
    procedure CdsDetAfterScroll(DataSet: TDataSet);
    procedure dbedDurTeorExit(Sender: TObject);
    procedure dbedDurPratExit(Sender: TObject);
    procedure rgGeraTermoClick(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CMProcuraCursoApertouBotao(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroOpenDataSet(Sender: TObject);
    procedure CmpCidadesValidaDados(Sender: TObject);
    procedure btnGeraApClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure PageControlDetChange(Sender: TObject);
    procedure btnExcluirApClick(Sender: TObject);
    function GravarDocumento(Rateio, UsaPlanoPatro: Boolean):boolean;
    function VerificaPreenchimento: boolean;
    function FinalDocumento(const CentroRespon,
             TipRecDes: string; const UnidNegoc, IdForCli: integer): boolean;
    Function BuscarContaBancaria(Const idPessoa: Integer): Integer;
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure PageControlDetExit(Sender: TObject);
    procedure tbsIntegracaoContasaPagarExit(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    //  Thiago Melo SOL 177768 Kintana 1635450 INI
    Function RetornaValorTotalMensalidade (Cds : TCMClientDataSet) : Double;
    Function RetornaValorTotalEmpresa     (Cds : TCMClientDataSet) : Double;
    Function RetornaValorTotalEmpregado   (Cds : TCmClientDataSet) : Double;
    Procedure RetornaValorDevolverDtAtual;
    Procedure ProporcionalizacaoValores;
    procedure ProporcionalizacaoValores_Parcialmente(PartEmpresa, PartEmpregado : SmallInt; Cds : TCmClientDataSet);
    procedure DsMensalidadesAuxDataChange(Sender: TObject; Field: TField);
    procedure CdsMensalidadesAuxAfterOpen(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure EdtvlrPartEmpresaChange(Sender: TObject);
    procedure EdtVlrPartEmpregadoChange(Sender: TObject);
    procedure btnDespOkClick(Sender: TObject);
    procedure btnDespCancelClick(Sender: TObject);
    procedure EdtvlrPartEmpresaExit(Sender: TObject);
    procedure EdtVlrPartEmpregadoExit(Sender: TObject);
    procedure EdtvlrPartEmpresaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtVlrPartEmpregadoKeyPress(Sender: TObject; var Key: Char);
    procedure btnAtualizarMetaClick(Sender: TObject);
    procedure dbrgControleClick(Sender: TObject);
    procedure CkbProjetoEntregueClick(Sender: TObject);
    procedure EdtDataEntregaExit(Sender: TObject);
    //  Thiago Melo SOL 177768 Kintana 1635450 FIM
  private
    CtrlRegTrein: TCtrlRegTrein; //  Thiago Melo SOL 177768 Kintana 1635450 INI
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlCurso: TCtrlCurso;
    CtrlCargo: TCtrlCargo;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlPessoaCandidato: TCtrlPessoaCandidato;
    CtrlEscalaConceitos: TCtrlEscalaConceitos;
    CtrlGlobalRH: TCtrlGlobalRH;
    ListaSiglaCadastrada: TStrings;
    // Eraldo Luis da Silva SOL 137268 Kintana 829513 Inicio
    CtrlFuncoesRH: TCtrlFuncoesRH;
    CtrlEtapaProcesso: TCtrlEtapaProcesso;
    CtrlPeriodo: TCtrlPeriodo;
    CtrlFinanc : TCtrlFinanc;
    CtrlContab : TCtrlContab;
    rPlaContas: TPlaContas;
    _CtrlLancamento: TCtrlLancamento;
    PlacontasCapCar : TCtrlPlacontasCapCar;
    IdPatro : integer;
    bFazCAP, bFazContab: boolean;
    FConsTipoDesemb: boolean;
    iCodDocumento :Integer;
    FCtrlDocumento: TCtrlDocumento;
    FCtrlListTerceirosRH: TCtrlListTerceirosRH;
    dOldIdCurso: double;
    iOldNumSeq, IdTipoProcesso, iTabIndex: integer;
    sDataFinalAntes, sDataFinalDepois, sDataIniAntes, sDataIniDepois: string;
    bAvalAluno, bFezAvalCurso, bFezAvalAluno: boolean;

    //  Thiago Melo SOL 177768 Kintana 1635450 INI
    ModoEdicao : Boolean;
    UltVlrValidoEmpresa, UltVlrValidoEmpregado : Integer;
    //  Thiago Melo SOL 177768 Kintana 1635450 FIM

    function  VerificaSigla: Boolean;
    procedure VerificaUltSeq(Sigla: String; Tamanho: Integer);
    procedure AtualizarAvaliacao;
    procedure GerarTermoCompromisso;
    Function VerificaPreenchimentoObrigatorio_Despesas : Boolean;
    //Eraldo Luis da Silva SOL 137268 Kintana 829513 Fim

    //  Thiago Melo SOL 177768 Kintana 1635450 INI
    Procedure ReorganizaQtd;
    Procedure CalcFimDaFidelidade;
    Procedure HabilitarParcialmente;
    Procedure CarregaValorPrevisto;
    Function  StrZero(Numero : String; Casas : Integer) : String;
    Procedure InsereAux (DtVencimento : TDateTime; ValorMensalidade : Double);
    Procedure ReorganizaNParcela;
    procedure ReorganizaNumSeq;
    function CalcMetaAtuarial (FatorMetaAtuarial : Double) : Boolean;
    procedure CarregaProjFinal;
    function  TotalizaHorasHSTTRN (xIdPessoa, xIdCurso, xNumSeq : Double): Double;
    //  Thiago Melo SOL 177768 Kintana 1635450 FIM

    // Thiago Melo SOL 203837 Kintana 1969599 Ini
    procedure proporcionalizaEmp (PartEmpresa, PartEmpregado : SmallInt);
    // Thiago Melo SOL 203837 Kintana 1969599 Fim

  public
    bEmpregado: boolean;
    IdPessoa: double;
    TermoExistente: String;
    IdCurso: Integer;
    //Eraldo Luis da Silva SOL 137268 Kintana 829513 Inicio
    CodCentroRespon : Integer;
    CodTipRecDes :Integer;
    CodCentroCusto :Integer;
    Idprograma : Integer;
    CpIdpessoa:Integer;
    IdPlanoPrev:Integer;
    LacHist : String;
    DataVencto: TDateTime;
    DataEmissao : TDateTime;
    DataLancto : TDateTime;
    fplncodigo: Double;
    idPlano : Double;
    sFormaRecPagCODSUBCONTA      : String;
    sFormaRecPagPLACONTACONTABCHQ  : String;
    iNumLanc : Integer;
    bUsaPlanoPatro  :  boolean;
    bExcluiPlanilha : boolean;
    NoDocumento: Integer;
    pidPlanilha : Integer;
    pidLancto : Integer;
    iPlanilha :Integer;
    liPlncodigo : Double;
    sSql : String;

    //Eraldo Luis da Silva SOL 137268 Kintana 829513 Fim
    procedure Sel(SelPrincipal: boolean);
    procedure TotalizaHoras;
  end;

var
  frmCadRegTrein: TfrmCadRegTrein;

implementation

uses uCMTypes, uSistema, uMensErro, uModulo,  fPreview, uCtrlPadroes,
     uCtrlUsoGeralRH, RAvalCurso, dCds,DBaseDados,uCtrlParamIntegra, fAguarde,
     fRegTreinMetaAtuarial;

{$R *.DFM}

procedure TfrmCadRegTrein.FormCreate(Sender: TObject);
begin
  PageControlDet.ActivePage := tbshDadosBasicos;
  btnExcluirAp.Visible := False;
  btnGeraAp.Visible := False;
  inherited;
  //Eraldo Luis da Silva SOL 137268 Kintana 829513
//  Thiago Melo SOL 177768 Kintana 1635450 INI
{  if CheckBox1.Checked = false then
  cmprocFonecedor.Visible := false;}
//  Thiago Melo SOL 177768 Kintana 1635450 FIM

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);
  CtrlFuncoesRH := TCtrlFuncoesRH.Create;
  CtrlFuncoesRH.InitializeAs(Padroes);
  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('FLGAVALALUNO');
  bAvalAluno := (dmCds.Cds.FieldByName('FLGAVALALUNO').asInteger = 1);
  ModoEdicao := False;


  if CdsMensalidades.IsEmpty then begin
    dbrgControle.ItemIndex := -1;
  end;


  if (bAvalAluno) then
  begin

    //Eraldo Luis da Silva SOL 137268 Kintana 829513 Inicio
    //dbrgAvalPrat.Visible := False;
    //dbrgAvalTeor.Caption := 'Avaliação do Aluno';
    //dbedAvTeor.Visible := False;
    //dbedAvPrat.Visible := False;
    //Eraldo Luis da Silva SOL 137268 Kintana 829513 Fim

    //lblAprov.Visible := false;
    //imgReprov.Visible := false;
    //imgAprov.Visible := false;
  end
  else
  begin
    tbcDetalhe.detdbGrids.Clear;
    tbcDetalhe.detdbGrids.Add('dbgrdDet');
    tbcDetalhe.detdbGrids.Add('dbgrdAval');

    tbcDetalhe.Tabs.Clear;
    tbcDetalhe.Tabs.Add('Cursos');
    tbcDetalhe.Tabs.Add('Avaliações dos Cursos');
  end;

  CtrlRegTrein := TCtrlRegTrein.Create(true, Sistema.UsaRAD, true, bAvalAluno, Sistema.IdEmpresa,
  Sistema.IdUsuario, Sistema.NomeUsuario, CtrlUsoGeralRH.UsuXFilial,
  CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlRegTrein.InitializeAs(Padroes);
  CtrlRegTrein.CdsHistTrein := CdsDet;
  CtrlRegTrein.CdsAvalCurso := CdsAval;
  CtrlRegTrein.CdsAvalAluno := CdsAval2;
//  Thiago Melo SOL 177768 Kintana 1635450 INI
  CtrlRegTrein.CdsMensal    := CdsMensalidades;
//  Thiago Melo SOL 177768 Kintana 1635450 FIM

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
  CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlCurso := TCtrlCurso.Create;
  CtrlCurso.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
  CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlPessoaCandidato := TCtrlPessoaCandidato.Create(CtrlUsoGeralRH.UsuXFilial,
  CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaCandidato.InitializeAs(Padroes);

  CdsEntid.Data := CtrlRegTrein.ListEntid;
  CdsInstrutor.Data := CtrlListTerceirosRH.ListPessoaTerceiro('F');
  CdsCurso.Data := CtrlCurso.ListGeral(-1);
  CdsAval.Data := CtrlRegTrein.ListAvaliacaoCurso(-1, -1, -1, -1);
  CdsAval2.Data := CtrlRegTrein.ListAvaliacaoCurso(-1, -1, -1, -1);

  CtrlEscalaConceitos := TCtrlEscalaConceitos.Create;
  CtrlEscalaConceitos.InitializeAs(Padroes);

 // if (Modulo.IdContraCheque = FUNCEF) then
 //   dbrgControle.Caption := 'Por Conta da Empresa?';

  with (MontaSelectFunc.Filtro) do
  begin
    Clear;
    // Estabelecimento(s) habilitados para o usuário
    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      Add('FUNCIONARIO.IDESTAB IN ' +CtrlUsoGeralRH.UsuXFilial);

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      Add('FUNCIONARIO.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto);

    // Usuário Individual
    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('FUNCIONARIO.IDPESSOA = ' + CtrlUsoGeralRH.IdUsuarioGeral);

    // Usuário RH
    if not(CtrlUsoGeralRH.UsuarioRH) then
      Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));

    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
  end;

  if (Sistema.UsaRAD) then
    IdTipoProcesso := CtrlListTerceirosRH.GetIdTipoProcesso(Sistema.IdUsuario, 20)
  else
    IdTipoProcesso := -1;

  if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
  begin
    bEmpregado := true;
    IdPessoa := StrToFloat(CtrlUsoGeralRH.IdUsuarioGeral);
    Sel(true);
    sbtnProcurarCand.Visible := false;
  end
  else
  begin
    IdPessoa := -1;
    Sel(true);
  end;

  if (Sistema.IdModulo = 417) then
    HelpContext := 4170012;

  CMProcuraCurso.DataSource := nil;
//  Thiago Melo SOL 177768 Kintana 1635450 INI
//  pgctrlDados.ActivePageIndex := 0;
//  Thiago Melo SOL 177768 Kintana 1635450 FIM
  ListaSiglaCadastrada:= TStringList.Create;

  // FHBS - Cria Control de Documento
  FCtrlDocumento := TCtrlDocumento.Create;
  FCtrlDocumento.InitializeAs(Padroes);
  FCtrlDocumento.IdEspAcesso  := Sistema.IdEspAcesso;
  FCtrlDocumento.IdUsuario    := Sistema.IdUsuario;
  FCtrlDocumento.IdModulo     := Sistema.IdModulo;
  FCtrlDocumento.UsaPlanoPatro := Sistema.UsaPlanoPatro;
  // FHBS
  FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
  CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral );
  FCtrlListTerceirosRH.InitializeAs(Padroes);
  CtrlFinanc := TCtrlFinanc.Create(sistema.IdEmpresa, sistema.IdModulo , sistema.IdUsuario, sistema.UsaPlanoPatro);
  CtrlFinanc.InitializeAs(Padroes);
  CtrlFinanc.OpenTransaction := False;
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(Padroes);
  _CtrlLancamento := TCtrlLancamento.Create;
  _CtrlLancamento.InitializeAs(Padroes);
  PlacontasCapCar := TCtrlPlacontasCapCar.Create;
  PlacontasCapCar.InitializeAs(Padroes);
end;

procedure TfrmCadRegTrein.FormShow(Sender: TObject);
begin
  inherited;
  if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
  begin
    sbtnProcurar.Visible := false;
    sbtnAlterar.Enabled := true;
  end;

   CtrlEtapaProcesso := TCtrlEtapaProcesso.Create(CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);

    CtrlEtapaProcesso.CdsEtapas := CdsEtapa;

    CtrlEtapaProcesso.InitializeAs(Padroes);

    CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
    CtrlListTerceirosRH.InitializeAs(Padroes);

    CtrlGlobalRH := TCtrlGlobalRH.Create;
    CtrlGlobalRH.InitializeAs(Padroes);

    CtrlPeriodo := TCtrlPeriodo.Create;
    CtrlPeriodo.InitializeAs(Padroes);

    // Integração com o CAP
    dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('FLGINTEGRACAP, FLGINTEGRACONT');
    bFazCAP := (dmCds.Cds.FieldByName('FLGINTEGRACAP').asInteger = 1);


    // Integração com a Contabilidade
    bFazContab := (dmCds.Cds.FieldByName('FLGINTEGRACONT').asInteger = 1) and
      (CtrlPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa, DateToStr(Date)));

    if (bFazContab) then
    begin
      // Pega o ID da Patrocinadora e do Plano Previdenciário
      if (Sistema.UsaPlanoPatro) then
      begin
        IdPatro := CtrlListTerceirosRH.GetIdPatro(Sistema.IdEmpresa);
        IdPlanoPrev := CtrlListTerceirosRH.GetIdPlanoPrev(Sistema.IdEmpresa);
      end
      else
      begin
        IdPatro := -1;
        IdPlanoPrev := -1;
      end;

    end;

    if (bFazContab) or (bFazCAP) then
    begin
      CtrlEtapaProcesso.IniciarIntegracao(Sistema.IdEmpresa, Sistema.IdModulo,
        Sistema.IdUsuario, Sistema.IdEspAcesso, Sistema.UsaPlanoPatro,
        ParamIntegra.ObrigaAbc, ParamIntegra.ObrigaCRespon,
        ParamIntegra.PlanoPrevGlobal, ParamIntegra.PatroGlobal);
    end;

end;

procedure TfrmCadRegTrein.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlRegTrein);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlCurso);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlPessoaCandidato);
  FreeAndNil(CtrlEscalaConceitos);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlFuncoesRH);
  FreeAndNil(CtrlFinanc);
  FreeAndNil(CtrlListTerceirosRH);
  ListaSiglaCadastrada.Free;
  FreeAndNil(CtrlContab);
  FreeAndNil(_CtrlLancamento);
  FCtrlDocumento.Free;
  PlacontasCapCar.free;
  inherited;
end;

procedure TfrmCadRegTrein.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    IdPessoa := StrToFloat(MontaSelect.ValoresChave[0]);
    Sel(true);
  end;
end;

procedure TfrmCadRegTrein.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnProcurarCand.Enabled := sbtnProcurar.Enabled;
end;

procedure TfrmCadRegTrein.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
{  if (bEmpregado) then
    CdsDet.FieldByName('FLGCONTROLE').asInteger := 1
  else
    CdsDet.FieldByName('FLGCONTROLE').asInteger := 0;}

  CdsDet.FieldByName('IDPESSOA').asFloat := Cds.FieldByName('IDPESSOA').asFloat;
  CdsDet.FieldByName('FLGAVALCURS').asInteger := 0;
  CdsDet.FieldByName('FLGAVALTEOR').asInteger := 0;
  CdsDet.FieldByName('FLGAVALPRAT').asInteger := 0;
  TermoExistente:= '';
//  Thiago Melo SOL 177768 Kintana 1635450 INI
//  rgGeraTermo.ItemIndex:= 1;
//  Thiago Melo SOL 177768 Kintana 1635450 FIM

  if CdsDet.FieldByName('CODDOCUMENTO').AsInteger = 0 then begin
//  Thiago Melo SOL 177768 Kintana 1635450 INI
//     dbeDataVenc.Enabled := true;
//     dblcUnidNegoc.Enabled := true;
//     dblcCentroRespon.Enabled := true;
//     dblcTipoRD.Enabled := true;
//     CmbCentCusto.Enabled := true;
//     Edit1.Enabled := true;
//     CmbPrograma.Enabled := true;
//     CmbPatro.Enabled := true;
//     CmbPlano.Enabled := true;
//     sOberv.Enabled := true;
//     cmprocFonecedor.Enabled := true;
//     CheckBox1.Enabled := true;
{     if CheckBox1.Checked = true then begin
        cmprocFonecedor.Enabled := true;
     end;}

    if CdsMensalidades.IsEmpty then begin
      dbrgControle.ItemIndex := 0;
      EdtvlrPartEmpresa.Text := '100';
      CdsDet.FieldByName('PARTEMPRESA').AsInteger := 100;
    end;
//  Thiago Melo SOL 177768 Kintana 1635450 FIM

     dbedValor.Enabled := true;
     CMProcuraCurso.Enabled := true;
     dblckEntid.Enabled := true;
  end
end;

procedure TfrmCadRegTrein.CmeDetalheDelete(Sender: TObject);
begin
   if (CdsDet.State in [dsInsert,dsEdit,dsBrowse]) then begin
     if CdsDet.FieldByName('CODDOCUMENTO').AsInteger <> 0 then  begin
        MsgDlg('Para este registro existem documentos financeiros Gerados.' +CR_LF+ 'Favor Verificar.',
                   'Informação', mtInformation, [mbOk,mbHelp], 0);
        exit;
   end;

     //  Thiago Melo SOL 177768 Kintana 1635450 INI
     if not CdsMensalidades.IsEmpty then begin
       ModoEdicao := True;
       CdsMensalidades.First;
       CdsMensalidades.Filtered := False;
       CdsMensalidades.Filter   := 'IDCURSO = ' + FloatToStr(CdsDet.FieldByName('IDCURSO').asFloat) + ' AND NUMSEQ = ' + FloatToStr(CdsDet.FieldByName('NUMSEQ').asFloat);
       CdsMensalidades.Filtered := True;

       while not (CdsMensalidades.Eof) do begin
         CdsMensalidades.Delete;
       end;

       CdsMensalidades.Filtered    := False;
       CdsMensalidadesAux.Filtered := False;
       CdsMensalidadesAux.Data := CdsMensalidades.Data;
     end;
     //  Thiago Melo SOL 177768 Kintana 1635450 FIM

     inherited;
     while not(CdsAval.EOF) do
        CdsAval.Delete;
     while not(CdsAval2.EOF) do
        CdsAval2.Delete;

   end;
end;

procedure TfrmCadRegTrein.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadRegTrein.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := (CtrlRegTrein.GravarHistoricoTreinamento(bEmpregado, dbedNome.Text,
    Cds.FieldByName('CODCENTROCUSTO').asString, IdTipoProcesso));

  if not(Accept) and (pos('duplicidade', CtrlRegTrein.MessageInfo) = 0) then
    raise Exception.Create(CtrlRegTrein.MessageInfo)
  else
  if (CtrlRegTrein.MessageInfo <> '') then
    MsgDlg(CtrlRegTrein.MessageInfo, 'Aviso', mtInformation, [mbOk,mbHelp], 0);
end;

procedure TfrmCadRegTrein.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert,dsEdit]) then
  begin
//  Thiago Melo SOL 177768 Kintana 1635450
//    pgctrlDados.ActivePageIndex := 0;
//  Thiago Melo SOL 177768 Kintana 1635450

    PageControlDet.ActivePageIndex := 0;
    CdsCurso.Data := CtrlCurso.ListGeral(CdsDet.FieldByName('IDCURSO').asFloat);

//  Thiago Melo SOL 177768 Kintana 1635450 INI

    ModoEdicao := True;
    CdsMensalidades.First;
    CdsMensalidades.Filtered := False;
    CdsMensalidades.Filter   := 'IDCURSO = ' + FloatToStr(CdsDet.FieldByName('IDCURSO').asFloat) + ' AND NUMSEQ = ' + FloatToStr(CdsDet.FieldByName('NUMSEQ').asFloat);
    CdsMensalidades.Filtered := True;

    CdsMensalidadesAux.First;
    CdsMensalidadesAux.Filtered := False;
    CdsMensalidadesAux.Filter   := 'IDCURSO = ' + FloatToStr(CdsDet.FieldByName('IDCURSO').asFloat) + ' AND NUMSEQ = ' + FloatToStr(CdsDet.FieldByName('NUMSEQ').asFloat);
    CdsMensalidadesAux.Filtered := True;

    EdtVlrCurso.Value       := RetornaValorTotalMensalidade(CdsMensalidadesAux);
    EdtValorEmpregado.Value := RetornaValorTotalEmpregado(CdsMensalidades);
    EdtValorEmpresa.Value   := RetornaValorTotalEmpresa(CdsMensalidadesAux);

    CarregaValorPrevisto;
    CarregaProjFinal;
    EdtDataEntregaExit(Sender);
    RetornaValorDevolverDtAtual;
    TotalizaHoras;

    if CdsDet.FieldByName('IDCURSO').asFloat > 0 then begin
      if sbtnAltDet.Down then begin
        if not VerificaSigla then
        begin
          MsgDlg('Sigla não vinculada ao curso', 'Aviso', mtWarning, [mbOk], 0);
          tbcDetalhe.SetFocus;
        end;
      end;
    end;
    HabilitarParcialmente;
    ProporcionalizacaoValores;

//  Thiago Melo SOL 177768 Kintana 1635450 FIM

    //Eraldo Luis da Silva SOL 137268 Kintana 829513 Inicio
    if (not bAvalAluno) then
      AtualizarAvaliacao;
    //Eraldo Luis da Silva SOL 137268 Kintana 829513 Fim

    CMProcuraCurso.DataSource := dsDet;

    if not CMProcuraCurso.Enabled = false then begin
      CMProcuraCurso.SetFocus;
    end;
  end
  else
    if (CdsDet.State = dsBrowse) then
      CMProcuraCurso.DataSource := nil;
end;

procedure TfrmCadRegTrein.CdsAvalAfterScroll(DataSet: TDataSet);
var
  c: integer;
begin
  gbxAvalEscal.Visible := (CdsAval.FieldByName('FLGAVALCURSO').asInteger = 0);
  gbxAvalConceitual.Visible := (CdsAval.FieldByName('FLGAVALCURSO').asInteger > 0);
  if (CdsAval.FieldByName('FLGAVALCURSO').asInteger > 0) then
  begin
    CdsEscala.Data := CtrlEscalaConceitos.ListGeral(CdsAval.FieldByName('IdEscalaConceitos').asFloat);
    cmbAvalConceitual.Items.Clear;

    if CdsEscala.FieldByName('QTDECONCEITOS').asInteger > 0 then
      for c := 1 to CdsEscala.FieldByName('QTDECONCEITOS').asInteger do
        cmbAvalConceitual.Items.Add(CdsEscala.FieldByName('CONCEITO'+IntToStr(c)).asString);

    cmbAvalConceitual.ItemIndex := CdsAval.FieldByName('AVALCURSO').asInteger - 1;
  end;
end;

procedure TfrmCadRegTrein.CdsDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  iOldNumSeq := -1;
  dOldIdCurso := -1;
  bFezAvalCurso := false;
  bFezAvalAluno := false;
  PageControlDetChange(PageControlDet); // FHBS - SOL 137268
end;

procedure TfrmCadRegTrein.CdsDetBeforeEdit(DataSet: TDataSet);
begin
  sDataFinalAntes := cmDatReFim.Text;
  sDataIniAntes := cmDatReIni.Text;
end;

procedure TfrmCadRegTrein.dblckEntidEnter(Sender: TObject);
begin
  if (CMProcuraCurso.Text <> '') and (CdsDet.State in [dsEdit,dsInsert]) then
    CdsEntid.Data := CtrlRegTrein.ListEntid(CdsDet.FieldByName('IDCURSO').asFloat);
end;

procedure TfrmCadRegTrein.dblckEntidChange(Sender: TObject);
begin
  if (dblckEntid.Text <> '') and (CdsDet.State in [dsEdit,dsInsert]) then
    CdsInstrutor.Data := CtrlListTerceirosRH.ListPessoaTerceiro('F',
      CdsEntid.FieldByName('IDPESSOA').asFloat);
end;

procedure TfrmCadRegTrein.dbedAvTeorChange(Sender: TObject);
begin
  if (CdsDet.State in [dsEdit,dsInsert]) and  (not bAvalAluno) then
    AtualizarAvaliacao;   //Eraldo Luis da Silva SOL 137268 Kintana 829513
end;

//Eraldo Luis da Silva SOL 137268 Kintana 829513 Inicio
{procedure TfrmCadRegTrein.dbrgAvalTeorChange(Sender: TObject);
begin
  if (CdsDet.State in [dsEdit,dsInsert]) then
  begin
    dbedAvTeor.Visible := (not bAvalAluno) and (dbrgAvalTeor.ItemIndex = 0);
    if (not bAvalAluno) then
      AtualizarAvaliacao;
  end;
end;

procedure TfrmCadRegTrein.dbrgAvalPratChange(Sender: TObject);
begin
  if (CdsDet.State in [dsEdit,dsInsert]) then
  begin
    dbedAvPrat.Visible := (dbrgAvalPrat.ItemIndex = 0);
    if (not bAvalAluno) then
      AtualizarAvaliacao;
  end;
end;  }
//Eraldo Luis da Silva SOL 137268 Kintana 829513 Fim

procedure TfrmCadRegTrein.dbrgAvalCursChange(Sender: TObject);
begin
//  Thiago Melo SOL 177768 Kintana 1635450
//  dbedAvCurs.Visible := (dbrgAvalCurs.ItemIndex = 0);
end;

procedure TfrmCadRegTrein.dbrgControleChange(Sender: TObject);
begin
{  Thiago Melo SOL 177768 Kintana 1635450 INI
  if (CdsDet.State in [dsEdit,dsInsert]) then
  begin
    tbshDespesas.Enabled := (dbrgControle.ItemIndex = 0);
    dbrgAvalCurs.Visible := (dbrgControle.ItemIndex = 0);
    dbedAvCurs.Visible := (dbrgControle.ItemIndex = 0);
    tbshDespesas.TabVisible := (dbrgControle.ItemIndex = 0);
   if (CdsDet.State = dsInsert) then
      dbrgAvalCurs.ItemIndex := dbrgControle.ItemIndex;
  end;
  Thiago Melo SOL 177768 Kintana 1635450 FIM}
end;

procedure TfrmCadRegTrein.tbcDetalheChange(Sender: TObject);
begin
//  Thiago Melo SOL 177768 Kintana 1635450 INI
{  if (tbcDetalhe.TabIndex = 1) and
     ((cmDatReFim.Text = '') or (CdsDet.FieldByName('FLGAVALCURS').asInteger <> 1)) then
  begin

  //  btnExcluirAp.Enabled := False;
  //  btnGeraAp.Enabled := False;
    //Eraldo Luis da Silva SOL 137268 Kintana 829513
    //AllowChange := false;

    MsgDlg('Curso selecionado não tem avaliação pelo aluno e/ou não foi concluído.',
      'Informação', mtInformation, [mbOk,mbHelp], 0);
    tbcDetalhe.TabIndex := iTabIndex;
    pgctrlDetalhe.ActivePageIndex := iTabIndex;
    exit;
  end;
  }
//  Thiago Melo SOL 177768 Kintana 1635450 FIM

  if (tbcDetalhe.TabIndex = 2) and
     ((cmDatReFim.Text = '') or (CdsDet.FieldByName('FLGAVALTEOR').asInteger <> 1)) then
  begin
    //Eraldo Luis da Silva SOL 137268 Kintana 829513
    //AllowChange := false;

    MsgDlg('Curso selecionado não tem avaliação do aluno e/ou não foi concluído.',
      'Informação', mtInformation, [mbOk,mbHelp], 0);
    tbcDetalhe.TabIndex := iTabIndex;
    pgctrlDetalhe.ActivePageIndex := iTabIndex;
    exit;
  end;

  if ((iOldNumSeq <> CdsDet.FieldByName('NUMSEQ').asInteger) or
      (dOldIdCurso <> CdsDet.FieldByName('IDCURSO').asFloat) or
      (not bFezAvalCurso) or
      (not bFezAvalAluno)) then
  begin
    if (tbcDetalhe.TabIndex = 1) and (not bFezAvalCurso) then
    begin
      bFezAvalCurso := True;
      CdsAval.Data := CtrlRegTrein.ListAvaliacaoCurso(CdsDet.FieldByName('IDPESSOA').asFloat,
        CdsDet.FieldByName('IDCURSO').asFloat, CdsDet.FieldByName('NUMSEQ').asInteger, 0);

      if (CdsAval.IsEmpty) then
      begin
        if not(CtrlRegTrein.GerarAvaliacoes_Dos_Cursos) then
        begin
          //Eraldo Luis da Silva SOL 137268 Kintana 829513
          //AllowChange := false;

          MsgDlg(CtrlRegTrein.MessageInfo, 'Informação', mtInformation, [mbOk,mbHelp], 0);
          tbcDetalhe.TabIndex := iTabIndex;
          pgctrlDetalhe.ActivePageIndex := iTabIndex;
          exit;
        end;
      end;

      //  Thiago Melo SOL 177768 Kintana 1635450 INI
      CtrlRegTrein.CdsMensal := CdsMensalidades;
      if not CdsMensalidades.IsEmpty then begin
        if (not CtrlRegTrein.GravarMensalidades(idPessoa, CdsDet.FieldByName('IDCURSO').asFloat, CdsDet.FieldByName('NUMSEQ').asFloat)) then begin
          MsgDlg(CtrlRegTrein.MessageInfo, 'Informação', mtInformation, [mbOk,mbHelp], 0);
          tbcDetalhe.TabIndex := iTabIndex;
          pgctrlDetalhe.ActivePageIndex := iTabIndex;
          exit;
        end;
      end;
    end;
    //  Thiago Melo SOL 177768 Kintana 1635450 FIM

    if (tbcDetalhe.TabIndex = 2) and (bAvalAluno) and (not bFezAvalAluno) then
    begin
      bFezAvalAluno := True;
      CdsAval2.Data := CtrlRegTrein.ListAvaliacaoCurso(CdsDet.FieldByName('IDPESSOA').asFloat,
        CdsDet.FieldByName('IDCURSO').asFloat, CdsDet.FieldByName('NUMSEQ').asInteger, 1);

      if (CdsAval2.IsEmpty) then
      begin
        if not(CtrlRegTrein.GerarAvaliacoes_Dos_Alunos) then
        begin
          //Eraldo Luis da Silva SOL 137268 Kintana 829513
          //AllowChange := false;

          MsgDlg(CtrlRegTrein.MessageInfo, 'Informação', mtInformation, [mbOk,mbHelp], 0);
          tbcDetalhe.TabIndex := iTabIndex;
          pgctrlDetalhe.ActivePageIndex := iTabIndex;
          exit;
        end;
      end;
    end;

  end;

  sbtnImprimirAval.Enabled := (tbcDetalhe.TabIndex = 1) and not(CdsAval.IsEmpty);

  if (tbcDetalhe.TabIndex > 0) then
  begin
    //Eraldo Luis da Silva SOL 137268 Kintana 829513
    //AllowChange := true;

    iOldNumSeq := CdsDet.FieldByName('NUMSEQ').asInteger;
    dOldIdCurso := CdsDet.FieldByName('IDCURSO').asFloat;
  end;

  inherited;
  sbtnInsDet.Visible := (tbcDetalhe.TabIndex = 0);
  sbtnExcluiDet.Visible := (tbcDetalhe.TabIndex = 0);
  pnlImprimeAval.Visible := (tbcDetalhe.TabIndex = 1);
end;

procedure TfrmCadRegTrein.cmbAvalConceitualChange(Sender: TObject);
begin
  inherited;
  if (cmbAvalConceitual.ItemIndex <> CdsAval.FieldByName('AVALCURSO').asInteger - 1) and
     (CdsAval.State in [dsInsert, dsEdit]) then
    CdsAval.FieldByName('AVALCURSO').asInteger := cmbAvalConceitual.ItemIndex + 1;
end;

procedure TfrmCadRegTrein.CdsAval2AfterScroll(DataSet: TDataSet);
var
  c: integer;
begin
  inherited;
  gbxAvalEscal2.Visible := (CdsAval2.FieldByName('FLGAVALCURSO').asInteger = 0);
  gbxAvalConceitual2.Visible := (CdsAval2.FieldByName('FLGAVALCURSO').asInteger > 0);
  if (CdsAval2.FieldByName('FLGAVALCURSO').asInteger > 0) then
  begin
    CdsEscala.Data := CtrlEscalaConceitos.ListGeral(CdsAval2.FieldByName('IdEscalaConceitos').asFloat);
    cmbAvalConceitual2.Items.Clear;

    if CdsEscala.FieldByName('QTDECONCEITOS').asInteger > 0 then
      for c := 1 to CdsEscala.FieldByName('QTDECONCEITOS').asInteger do
        cmbAvalConceitual2.Items.Add(CdsEscala.FieldByName('CONCEITO'+IntToStr(c)).asString);

    cmbAvalConceitual2.ItemIndex := CdsAval2.FieldByName('AVALCURSO').asInteger - 1;
  end;

end;

procedure TfrmCadRegTrein.cmbAvalConceitual2Change(Sender: TObject);
begin
  inherited;
  if (cmbAvalConceitual2.ItemIndex <> CdsAval2.FieldByName('AVALCURSO').asInteger - 1) and
     (CdsAval2.State in [dsInsert, dsEdit]) then
    CdsAval2.FieldByName('AVALCURSO').asInteger := cmbAvalConceitual2.ItemIndex + 1;
end;

procedure TfrmCadRegTrein.tbcDetalheChanging(Sender: TObject; var AllowChange: Boolean);
begin
  inherited;
  iTabIndex := tbcDetalhe.TabIndex;
end;

procedure TfrmCadRegTrein.sbtnProcurarClick(Sender: TObject);
begin
  bEmpregado := (Sender = sbtnProcurar);
  if (bEmpregado) then
    MontaSelect := MontaSelectFunc
  else
  begin
    sbtnProcurarCand.Down := false;
    MontaSelect := MontaSelectCand;
  end;
  inherited;
end;

procedure TfrmCadRegTrein.sbtnImprimirAvalClick(Sender: TObject);
var
  Rpt: TRptAvalCurso;
begin
  if (Trim(cmDatReFim.Text) <> '') then
  begin
    Rpt := TRptAvalCurso.Create(Application);

    Rpt.IdPessoa := CdsDet.FieldByName('IDPESSOA').asFloat;
    Rpt.IdCurso := CdsDet.FieldByName('IDCURSO').asFloat;
    Rpt.NumSeq := CdsDet.FieldByName('NUMSEQ').asInteger;
    Rpt.Matricula := dbedMatricula.Text;
    Rpt.NomeEmpregado := dbedNome.Text;
    Rpt.NomeCargo := dbedCargo.Text;
    Rpt.NomeCurso := CdsDet.FieldByName('DESCRICAO').asString;
    Rpt.NomeEntidade := dblckEntid.Text;
//  Thiago Melo SOL 177768 Kintana 1635450 INI
//    Rpt.LocalCurso := dbedLocalCurso.Text;
//  Thiago Melo SOL 177768 Kintana 1635450 FIM
    Rpt.DataInicioEfetivo := cmDatReIni.Date;
    Rpt.DataFinalEfetivo := cmDatReFim.Date;

    Rpt.CrmRptCMBeforePrint(Sender);
    TFrmPreview.CreateModalPreview(Application, Rpt.rpAvalCurso, Rpt.rpAvalCurso.Caption);

    Rpt.Free;
  end;
end;

procedure TfrmCadRegTrein.bbtnProcLocalClick(Sender: TObject);
begin
  inherited;
  MontaSelectLocal.Executar;
//  Thiago Melo SOL 177768 Kintana 1635450 INI
{  if (MontaSelectLocal.RetornouValor) then
    dbedLocalCurso.Text := MontaSelectLocal.ValoresChave[2];}
//  Thiago Melo SOL 177768 Kintana 1635450 FIM
end;

procedure TfrmCadRegTrein.bbtnAlimentaClick(Sender: TObject);
{var
  sDataIni, sDataFim, sDataRef: string;
  i, j: integer;}
begin
  //  Thiago Melo SOL 177768 Kintana 1635450 INI
{  inherited;

  sDataIni := FU.iff(cmDatReIni.Text = '', cmDatPlIni.Text, cmDatReIni.Text);
  sDataFim := FU.iff(cmDatReFim.Text = '', cmDatPlFim.Text, cmDatReFim.Text);
  if (sDataIni = '') or (sDataFim = '') then
  begin
    MsgDlg('Datas Insuficientes para Esta Função.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  if (edDataHora.Text <> '') and (MsgDlg('Este Procedimento Limpa o Texto Existente. Confirma?',
      'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes) then
    exit;

  CdsDet.FieldByName('DATAHORA').asString := '';
  j := 0;
  for i:=1 to Round(StrToDate(sDataFim) - StrToDate(sDataIni) + 1) do
  begin
    if ((DayOfWeek((StrToDate(sDataIni) + i - 1)) in [2,3,4,5,6]) or
        (MsgDlg('Haverá aula no '+
         FU.iff(DayOfWeek(StrToDate(sDataIni)+i-1)=1,'domingo','sábado')+
         ' dia '+DateToStr(StrToDate(sDataIni)+i-1)+' ?',
         'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes)) then
    begin
      inc(j);
      if j > 1 then
         CdsDet.FieldByName('DATAHORA').asString :=
           CdsDet.FieldByName('DATAHORA').asString + CR_LF;
      sDataRef := DateToStr(StrToDate(sDataIni) + i - 1);
      CdsDet.FieldByName('DATAHORA').asString :=
        CdsDet.FieldByName('DATAHORA').asString + sDataRef +
                         ':   das __:__ às __:__ hs.    ';
    end;
  end;

  if length(CdsDet.FieldByName('DATAHORA').asString) > 1000 then
    CdsDet.FieldByName('DATAHORA').asString :=
      copy(CdsDet.FieldByName('DATAHORA').asString, 1, 1000);}
//  Thiago Melo SOL 177768 Kintana 1635450 FIM
end;

procedure TfrmCadRegTrein.bbtnBuscaInstrutorExternoClick(Sender: TObject);
begin
  inherited;
  if dblckEntid.Text = '' then
  begin
    MsgDlg('Dados Insuficientes para Esta Função.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  MontaSelectExterno.Filtro.Clear;
  MontaSelectExterno.Filtro.Add('IDGRUPO = ' + CdsEntid.FieldByName('IDPESSOA').asString);
  MontaSelectExterno.Executar;
  if (MontaSelectExterno.RetornouValor) then
  begin
    if CdsDet.FieldByName('INSTRUTORES').asString <> '' then
      CdsDet.FieldByName('INSTRUTORES').asString :=
        CdsDet.FieldByName('INSTRUTORES').asString + ', ' + CR_LF;
    CdsDet.FieldByName('INSTRUTORES').asString :=
      CdsDet.FieldByName('INSTRUTORES').asString + MontaSelectExterno.ValoresChave[1];
  end;

  if length(CdsDet.FieldByName('INSTRUTORES').asString) > 1000 then
    CdsDet.FieldByName('INSTRUTORES').asString :=
      copy(CdsDet.FieldByName('INSTRUTORES').asString, 1, 1000);
end;

procedure TfrmCadRegTrein.bbtnBuscaInstrutorInternoClick(Sender: TObject);
begin
  inherited;
  MontaSelectInterno.Filtro.Clear;
  MontaSelectInterno.Filtro.Add('IE.IDPESSOA = F.IDPESSOA');
  MontaSelectInterno.Filtro.Add('IE.IDPESSOA = P.IDPESSOA');
  MontaSelectInterno.Filtro.Add('IE.IDCURSO  = ' + CdsCurso.FieldByName('IDCURSO').asString);
  MontaSelectInterno.Executar;
  if (MontaSelectInterno.RetornouValor) then
  begin
    if CdsDet.FieldByName('INSTRUTORES').asString <> '' then
      CdsDet.FieldByName('INSTRUTORES').asString :=
        CdsDet.FieldByName('INSTRUTORES').asString + ', ' + CR_LF;
    CdsDet.FieldByName('INSTRUTORES').asString :=
      CdsDet.FieldByName('INSTRUTORES').asString + MontaSelectInterno.ValoresChave[1];
  end;

  if length(CdsDet.FieldByName('INSTRUTORES').asString) > 1000 then
    CdsDet.FieldByName('INSTRUTORES').asString :=
      copy(CdsDet.FieldByName('INSTRUTORES').asString, 1, 1000);
end;

procedure TfrmCadRegTrein.bbtnOkDetClick(Sender: TObject);
var
  sFlgOk: string;
  QtdAva, TotAva : integer;
begin

  //  Thiago Melo SOL 177768 Kintana 1635450 INI
{   if CheckBox1.Checked = true then
      cdsDet.FieldByname('IDFORCLI').AsInteger := cmprocFonecedor.ForCliReg.Id
   else
      cdsDet.FieldByname('IDFORCLI').AsInteger := CdsEntid.FieldByName('IDPESSOA').AsInteger;}
  //  Thiago Melo SOL 177768 Kintana 1635450 FIM


  //  Thiago Melo SOL 177768 Kintana 1635450 ini
//  if cmprocFonecedor.visible = false then begin

    if (CMProcuraCurso.Text = '') then begin
      MsgDlg('Informe o Curso (não pode ficar em branco).',
             'Informação', mtInformation, [mbOk,mbHelp], 0);
      exit;
    end;
    if (pgctrlDetalhe.ActivePageIndex = 0) then begin
      sDataFinalDepois := cmDatReFim.Text;
      sDataIniDepois := cmDatReIni.Text;
      if (sDataIniAntes = '') and (sDataIniDepois <> '') and
         (CdsDet.FieldByName('IDPROCESSO').asInteger > 0) then begin
        sFlgOk := CtrlListTerceirosRH.GetFlgOk_RAD(CdsDet.FieldByName('IDPROCESSO').asFloat);
        if (Trim(sFlgOk) = '') then
          sFlgOk := 'S';

        if (sFlgOk <> 'S') then begin
          MsgDlg('Processo não está concluído.' +CR_LF+ 'O curso não pode ser iniciado.',
                 'Informação', mtInformation, [mbOk,mbHelp], 0);
          exit;
        end;
      end;

      //  Thiago Melo SOL 177768 Kintana 1635450 INI
{      // Cálculo da Avaliação do Curso
      if (pgctrlDetalhe.ActivePage = tbsDet) and (dbrgAvalCurs.ItemIndex = 0) and
         (CdsAval.Active) and (CdsAval.RecordCount > 0) and
         (MsgDlg('Deseja alterar a avaliação do curso com média das avaliações dos fatores?',
                 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes) then begin
        CdsAval.First;
        QtdAva := 0;
        TotAva := 0;
        while not(CdsAval.EOF) do begin
          Inc(QtdAva);
          TotAva := TotAva + CdsAval.FieldByName('AVALCURSO').asInteger *
          FU.IFF(CdsAval.FieldByName('FLGAVALCURSO').asInteger=0,1,25);
          CdsAval.Next;
        end;
        CdsAval.First;
        CdsDet.FieldByName('AVALCURSO').asInteger := Round(TotAva / QtdAva);
      end;}
      //  Thiago Melo SOL 177768 Kintana 1635450 FIM



      // Cálculo do Número de Sequência
      if (CdsDet.State = dsInsert) then begin
        //  Thiago Melo SOL 177768 Kintana 1635450 INI
//        CtrlRegTrein.CdsHistTrein.FieldByName('IDCURSO').AsFloat := CdsDet.FieldByName('IDCURSO').AsFloat;
        //  Thiago Melo SOL 177768 Kintana 1635450 FIM
        CdsDet.FieldByName('NUMSEQ').asInteger := CtrlRegTrein.GetProxNumSeq;
        ReorganizaNumSeq;

        if (CdsDet.FieldByName('NUMSEQ').asInteger > 1) and
           (MsgDlg('Já consta esse curso para essa pessoa.' +CR_LF+
                   'Deseja registrar nova ocorrência?', 'Confirmação', mtConfirmation,
                   mbYesNoCancel, 0) <> mrYes) then

{MessageDlg(AStr, mtConfirmation, mbYesNoCancel, 0);
                   [mbYes, mbNo, mbHelp], 0) <> mrYes) then}
          exit;
      end;

      //  Thiago Melo SOL 177768 Kintana 1635450 INI
      if CdsMensalidades.State in [dsEdit, dsInsert] then begin
        CdsMensalidades.Post;
      end;
      ModoEdicao := True;
      CtrlRegTrein.GravarMensalidades(idPessoa, CdsDet.FieldByName('IDCURSO').asFloat, CdsDet.FieldByName('NUMSEQ').asFloat);

      //  Thiago Melo SOL 177768 Kintana 1635450 FIM

      CdsDet.FieldByName('DESCRICAO').asString := CMProcuraCurso.Text;


      // Thiago Melo SOL 203837 Kintana 1969599 Ini

{      if (sDataFinalAntes = '') and (sDataFinalDepois <> '') and (dbrgControle.ItemIndex = 0) then


    //  Thiago Melo SOL 177768 Kintana 1635450 - INI
    //     (dbrgAvalCurs.ItemIndex = 0) and (dbedAvCurs.Text = '') and
    //  Thiago Melo SOL 177768 Kintana 1635450 - FIM


        CdsDet.FieldByName('CONCLUIDO').asInteger := 1
      else
        CdsDet.FieldByName('CONCLUIDO').asInteger := 0;}


      CdsDet.FieldByName('CONCLUIDO').asInteger := 0;
      // Não enviar mensagens a partir do registro individual de treinamento.

      // Thiago Melo SOL 203837 Kintana 1969599 Fim

      if (CdsDet.FieldByName('DUR_TEOR').IsNull) then
        CdsDet.FieldByName('DUR_TEOR').asInteger := 0;

      if (CdsDet.FieldByName('DUR_PRAT').IsNull) then
        CdsDet.FieldByName('DUR_PRAT').asInteger := 0;

      CdsDet.FieldByName('DUR_TOT').asFloat := CdsDet.FieldByName('DUR_TEOR').asFloat +
        CdsDet.FieldByName('DUR_PRAT').asFloat;

      // Thiago Melo SOL 177768 INI
      CdsDet.FieldByName('VALOR').asFloat := EdtVlrPrevistoCurso.Value;

      if CkbProjetoEntregue.Visible = False then begin
        CdsDet.FieldByName('ENTREGUE').AsInteger := 0;
      end;

      if (not CkbProjetoEntregue.Checked) or (CkbProjetoEntregue.Visible = False) then begin
        if not (CdsDet.FieldByName('DTENTREGA').IsNull) then begin
          CdsDet.FieldByName('DTENTREGA').Clear;
        end;
      end;
      // Thiago Melo SOL 177768 FIM

    end
    else
    if (pgctrlDetalhe.ActivePageIndex = 1) and (cmbAvalConceitual.ItemIndex = -1) and (gbxAvalConceitual.Visible) then begin
      MsgDlg('Avaliação Conceitual do curso não indicada.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      cmbAvalConceitual.SetFocus;
      exit;
    end
    else
    if (pgctrlDetalhe.ActivePageIndex = 2) and (cmbAvalConceitual2.ItemIndex = -1) and (gbxAvalConceitual2.Visible) then begin
      MsgDlg('Avaliação Conceitual do aluno não indicada.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      cmbAvalConceitual2.SetFocus;
      exit;
    end;
//  end;
//  Thiago Melo SOL 177768 Kintana 1635450 FIM

  inherited;
  //  Thiago Melo SOL 177768 Kintana 1635450 INI
  EdtVlrCurso.Value       := RetornaValorTotalMensalidade(CdsMensalidadesAux);
  EdtValorEmpregado.Value := RetornaValorTotalEmpregado(CdsMensalidades);
  EdtValorEmpresa.Value   := RetornaValorTotalEmpresa(CdsMensalidadesAux);
  PageControlDet.ActivePage := tbshDadosBasicos;
  //  Thiago Melo SOL 177768 Kintana 1635450 FIM

  btnExcluirAp.Visible := false;
  btnGeraAp.Visible    := false;
end;

procedure TfrmCadRegTrein.bbtnConfirmarClick(Sender: TObject);
begin
  if (CdsDet.State <> dsBrowse) then
    exit;
  inherited;
  Sel(false);
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

//Eraldo Luis da Silva SOL 137268 Kintana 829513 Inicio
procedure TfrmCadRegTrein.AtualizarAvaliacao;
begin
  //lblAprov.Visible := false;

  if (CdsCurso.Active) and
     ((CdsCurso.FieldByName('TEMAVAL').asInteger = 1)  or
      ((CdsCurso.FieldByName('TEMAVPR').asInteger = 1) )) then
  begin
    if ((CdsCurso.FieldByName('TEMAVAL').asInteger = 1)) or
       ((CdsCurso.FieldByName('TEMAVPR').asInteger = 1))  then
    begin
      //lblAprov.Caption := 'REPROVADO';
      //lblAprov.Font.Color := clRed;
    end
    else
    begin
      //lblAprov.Caption := 'APROVADO';
      //lblAprov.Font.Color := clBlue;
    end;
    //lblAprov.Visible := true;
  end;

//  tbshDespesas.Enabled    := (dbrgControle.ItemIndex = 0);

//  Thiago Melo SOL 177768 Kintana 1635450 INI
//  dbrgAvalCurs.Visible    := (dbrgControle.ItemIndex = 0);
//  dbedAvCurs.Visible      := (dbrgAvalCurs.ItemIndex = 0);
//  Thiago Melo SOL 177768 Kintana 1635450 FIM

//  tbshDespesas.TabVisible := (dbrgControle.ItemIndex = 0);
end;
//Eraldo Luis da Silva SOL 137268 Kintana 829513 Fim

procedure TfrmCadRegTrein.Sel(SelPrincipal: boolean);
begin
  if (SelPrincipal) then
  begin
    if (bEmpregado) then
      Cds.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(IdPessoa,
        '  F.IDPESSOA, F.MATRICULA, F.IDCARGO, (''  '' || P.NOME) AS NOME,'+CR_LF+
        '  ST.DESCRICAO AS SITUACAO, F.CODCENTROCUSTO, F.IDEMPRESA')
    else
      Cds.Data := CtrlPessoaCandidato.ListCandidatoPessoa(IdPessoa,
        '  CA.IDPESSOA, CA.IDPESSOA AS MATRICULA, CA.IDCARGO, (''  '' || P.NOME) AS NOME,'+CR_LF+
        '  ''Candidato'' AS SITUACAO, ('' '') AS CODCENTROCUSTO, ' +
        FloatToStr(Sistema.IdEmpresa)+ ' AS IDEMPRESA');

    CdsCargo.Data := CtrlCargo.ListCargo(FU.IFF(Cds.FieldByName('IDCARGO').asFloat > 0,
      Cds.FieldByName('IDCARGO').asFloat, -1));
  end;

  iOldNumSeq    := -1;
  dOldIdCurso   := -1;
  bFezAvalCurso := False;
  bFezAvalAluno := False;
  CdsDet.Data   := CtrlRegTrein.ListHistoricoTreinamentoPorPessoa(IdPessoa);

//  Thiago Melo SOL 177768 Kintana 1635450 INI
  ModoEdicao := True;
  CdsMensalidades.Data := CtrlRegTrein.ListaMensalidades(IdPessoa, CdsDet.FieldByName('IDCURSO').asFloat, CdsDet.FieldByName('NUMSEQ').AsFloat, 0);
  CdsMensalidadesAux.Data := CdsMensalidades.Data;

  EdtVlrCurso.Value       := RetornaValorTotalMensalidade(CdsMensalidadesAux);
  EdtValorEmpregado.Value := RetornaValorTotalEmpregado(CdsMensalidades);
  EdtValorEmpresa.Value   := RetornaValorTotalEmpresa(CdsMensalidadesAux);
  CarregaValorPrevisto;
//  Thiago Melo SOL 177768 Kintana 1635450 FIM
end;

procedure TfrmCadRegTrein.dbedDurTeorExit(Sender: TObject);
begin
  inherited;
  {Bruno Bastos - SOL 116903 - Kintana - 559705}
  TotalizaHoras;
end;

procedure TfrmCadRegTrein.TotalizaHoras;
begin
//  Thiago Melo SOL 177768 Kintana 1635450 INI
  {Bruno Bastos - SOL 116903 - Kintana - 559705}
//  dbedDurTot.Value :=  dbedDurTeor.Value + dbedDurPrat.Value;
//  dbedDurTot.Value := CdsDet.FieldByName('DUR_PRAT').Value + CdsDet.FieldByName('DUR_TEOR').Value;

  if (CdsDet.State = dsInsert) then begin
    if (not CdsDet.FieldByName('DUR_PRAT').IsNull) and (not CdsDet.FieldByName('DUR_TEOR').IsNull) then begin
      dbedDurTot.Value := CdsDet.FieldByName('DUR_PRAT').Value + CdsDet.FieldByName('DUR_TEOR').Value;
    end;
  end
  else begin
    dbedDurTot.Value := TotalizaHorasHSTTRN(IdPessoa, IdCurso, CdsDet.FieldByName('NUMSEQ').AsFloat);
  end;
// Thiago Melo SOL 177768 Kintana 1635450 FIM
end;

procedure TfrmCadRegTrein.dbedDurPratExit(Sender: TObject);
begin
  inherited;
  {Bruno Bastos - SOL 116903 - Kintana - 559705}
  TotalizaHoras;
end;

function TfrmCadRegTrein.VerificaSigla: boolean;
begin
   CdsGeraTermo.Data:= CtrlRegTrein.ObterSigla(CdsDet.FieldByName('IDCURSO').AsFloat);

   Result:= not CdsGeraTermo.IsEmpty;
end;

procedure TfrmCadRegTrein.GerarTermoCompromisso;
var idSigla, Sigla, AnoCorrente, Ano, TermoFinal: String;
    Seq, x: Integer;
    SeqFind, SeqMemoria: Integer;
    xItemIndex: Integer;
begin
//  Thiago Melo SOL 177768 Kintana 1635450 INI

{  if rgGeraTermo.ItemIndex = 0 then
  begin
    pnCtrlNumTermo.Visible:= True;
    //Thaise SOL  116914 - Primeiro passo é verificar se o curso foi escolhido.
    //O Curso sempre DEVE ser escolhido
    if Trim(CdsDet.FieldByName('IDCURSO').AsString) = '' then
    begin
      MsgDlg('Escolha um curso!', 'Aviso', mtWarning, [mbOk, mbHelp], 0);

      if not CMProcuraCurso.Enabled = false then begin
      CMProcuraCurso.SetFocus;
      end;

      rgGeraTermo.ItemIndex:= 1;
      rgGeraTermo.Refresh;
      Abort;
    end;

    //Thaise SOL 116914 - Por garantia, se já houver um termo, não permitir que seja gerado duas vezes
    if CdsDet.FieldByName('TERMOCURSO').AsString <> '' then
      Abort;

    if Trim(TermoExistente) <> '' then
      CdsDet.FieldByName('TERMOCURSO').AsString:= TermoExistente
    else
    begin
      //Thaise SOL 116914 - Se não existir sigla cadastrada para o curso,
      //o termo não poderá ser gerado
      if not VerificaSigla then
      begin
        MsgDlg('Não existe sigla cadastrada para este curso!', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
        rgGeraTermo.ItemIndex:= 1;
        tbcDetalhe.SetFocus;
      end else
      begin
        //Thaise SOL 116914 - Pegando a Sigla e o seu ID referente ao curso em questão
        idSigla := CdsGeraTermo.FieldByName('IDSIGLACURSO').AsString;
        Sigla   := CdsGeraTermo.FieldByName('SIGLA').AsString;

        //Thaise SOL 116914 - O Ano sempre deverá ser atual, e será trazido do banco
        AnoCorrente:= CtrlRegTrein.ObtemAnoCorrente;

        //Thaise SOL 116914 - Verificando qual a ultima sequencia cadastrada para o curso
        VerificaUltSeq(Sigla, Length(Sigla));
        if Trim(CdsGeraTermo.FieldByName('SEQ').AsString) = '' then
          //Se não houver sequencia, ainda, esta deverá ser 1
          Seq:= 1
        else
        begin
          //Thaise SOL 116914 - Verificando se o ultimo ano é o ano corrente
          if CdsGeraTermo.FieldByName('ANO').AsString <> AnoCorrente then
            //Se não for, a sequencia começará novamente com 1
            Seq:= 1
          else
            //Thaise SOL 116914 - Se sim, a sequencia deverá somar com a ultima
            Seq:= CdsGeraTermo.FieldByName('SEQ').AsInteger + 1;
        end;
        TermoFinal:= Sigla + '/' + FormatFloat('00000', Seq) + '/' + AnoCorrente;

        //TRN_2010
        if ListaSiglaCadastrada.IndexOfName(Sigla+'_'+AnoCorrente) = -1 then
          ListaSiglaCadastrada.Add(Sigla+'_'+AnoCorrente+'='+IntToStr(Seq))
        else
        begin
          SeqMemoria := StrToIntDef(ListaSiglaCadastrada.Values[Sigla+'_'+AnoCorrente],0) + 1;
          ListaSiglaCadastrada.Values[Sigla+'_'+AnoCorrente] := IntToStr(SeqMemoria);

          TermoFinal:= Sigla + '/' + FormatFloat('00000', SeqMemoria) + '/' + AnoCorrente;
        end;

        CdsDet.FieldByName('TERMOCURSO').AsString:= TermoFinal;

        TermoExistente:= '';
      end;
    end;

  end
  else
  begin
    TermoExistente:= CdsDet.FieldByName('TERMOCURSO').AsString;
    CdsDet.FieldByName('TERMOCURSO').AsString:= '';
    pnCtrlNumTermo.Visible:= False;
  end;
}
//  Thiago Melo SOL 177768 Kintana 1635450 FIM
end;

procedure TfrmCadRegTrein.rgGeraTermoClick(Sender: TObject);
begin
  inherited;
  GerarTermoCompromisso;
end;

procedure TfrmCadRegTrein.VerificaUltSeq(Sigla: String; Tamanho: Integer);
begin
   //  Thiago Melo SOL 177768 Kintana 1635450 INI
   //  CdsGeraTermo.Data:= CtrlRegTrein.ObtemSeqAno(Sigla, Tamanho);
   //  Thiago Melo SOL 177768 Kintana 1635450 Fim
end;

procedure TfrmCadRegTrein.CmeDetalheEdit(Sender: TObject);
begin
    if (CdsDet.State in [dsInsert,dsEdit,dsBrowse]) then begin
       if CdsDet.FieldByName('CODDOCUMENTO').AsInteger <> 0 then begin
          MsgDlg('Para este registro existem documentos financeiros Gerados.' +CR_LF+ 'Favor Verificar.',
                 'Informação', mtInformation, [mbOk,mbHelp], 0);
       //bbtnCancelar.OnClick(Self);

//  Thiago Melo SOL 177768 Kintana 1635450 INI
//       dbeDataVenc.Enabled := false;
//       dblcUnidNegoc.Enabled := false;
//       dblcCentroRespon.Enabled := false;
//       dblcTipoRD.Enabled := false;
//       CmbCentCusto.Enabled := false;
//       Edit1.Enabled := false;
//       CmbPrograma.Enabled := false;
//       CmbPatro.Enabled := false;
//       CmbPlano.Enabled := false;
//       sOberv.Enabled := false;
       dbedValor.Enabled := false;
       CMProcuraCurso.Enabled := false;
       dblckEntid.Enabled := false;
//       cmprocFonecedor.Enabled := false;
//       CheckBox1.Enabled := false;
{       if CheckBox1.Checked = true then begin
         cmprocFonecedor.Enabled := false;
       end;}
//  Thiago Melo SOL 177768 Kintana 1635450 FIM
       end;
    end;
//  Thiago Melo SOL 177768 Kintana 1635450 INI
{  if Trim(CdsDet.FieldByName('TERMOCURSO').AsString) <> '' then
    rgGeraTermo.ItemIndex:= 0;        }
//  Thiago Melo SOL 177768 Kintana 1635450 FIM

  if CdsDet.FieldByName('CODDOCUMENTO').AsInteger = 0 then begin
//  Thiago Melo SOL 177768 Kintana 1635450 INI
//     dbeDataVenc.Enabled := true;
//     dblcUnidNegoc.Enabled := true;
//     dblcCentroRespon.Enabled := true;
//     dblcTipoRD.Enabled := true;
//     CmbCentCusto.Enabled := true;
//     Edit1.Enabled := true;
//     CmbPrograma.Enabled := true;
//     CmbPatro.Enabled := true;
//     CmbPlano.Enabled := true;
//     sOberv.Enabled := true;
//     cmprocFonecedor.Enabled := true;
//     CheckBox1.Enabled := true;
{     if CheckBox1.Checked = true then begin
        cmprocFonecedor.Enabled := true;
     end;        }
//  Thiago Melo SOL 177768 Kintana 1635450 FIM
     dbedValor.Enabled := true;
     CMProcuraCurso.Enabled := true;
     dblckEntid.Enabled := true;
//  Thiago Melo SOL 177768 Kintana 1635450 INI
{  end
  else begin
    rgGeraTermo.ItemIndex:= 1;
    pnCtrlNumTermo.Visible:= False;
  end;}
  end;
//  Thiago Melo SOL 177768 Kintana 1635450 FIM
  inherited;
  TermoExistente:= '';
end;

procedure TfrmCadRegTrein.CMProcuraCursoApertouBotao(Sender: TObject);
begin
  IdCurso:= CdsDet.FieldByName('IDCURSO').AsInteger;
  inherited;
end;

procedure TfrmCadRegTrein.CmeDetalheConfirma(Sender: TObject);
begin
  inherited;
  if Trim(CdsDet.FieldByName('TERMOCURSO').AsString) <> '' then
    ListaSiglaCadastrada.Add(CdsDet.FieldByName('TERMOCURSO').AsString);
end;

procedure TfrmCadRegTrein.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  ListaSiglaCadastrada.Clear;
end;

procedure TfrmCadRegTrein.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  ListaSiglaCadastrada.Clear;
end;

procedure TfrmCadRegTrein.CmeCadastroOpenDataSet(Sender: TObject);
begin
  inherited;
  ListaSiglaCadastrada.Clear;
end;

procedure TfrmCadRegTrein.CmpCidadesValidaDados(Sender: TObject);
begin
  inherited;
   if MsCidades.RetornouValor then
   EdtSigla.Text := MsCidades.ValoresChave[1];
end;

//Eraldo Luis da Silva SOL 137268 Kintana 829513 Inicio
procedure TfrmCadRegTrein.btnGeraApClick(Sender: TObject);
Var
   Hoje : TDateTime;
   sSQL: string;   //ERALDO
   MaxNumDoc : Integer;
   MaxRatDoc : Integer;
   QryNumDoc : TwwQuery;
   QryRatDoc : TwwQuery;
   DataEmis :  TDateTime;
   DataLancto : TDateTime;
   DataRemessa : TDateTime;
   DataLim : TDateTime;
   DataDisp : TDateTime;
   DataProg : TDateTime;
   iRecPag: String;
   bOk : Boolean;
   sTipCodigo: string;
   iCodTipDoc: integer;
begin
  inherited;
  if not VerificaPreenchimento then
  exit;

  if not GravarDocumento(false,false) then

end;

procedure TfrmCadRegTrein.CheckBox1Click(Sender: TObject);
begin
  inherited;
//  Thiago Melo SOL 177768 Kintana 1635450 INI
{  if CheckBox1.Checked = true then
  cmprocFonecedor.Visible := true;
  if CheckBox1.Checked = false then
  cmprocFonecedor.Visible := false;}
//  Thiago Melo SOL 177768 Kintana 1635450 FIM  
end;

procedure TfrmCadRegTrein.PageControlDetChange(Sender: TObject);
var  Hoje : TDateTime;
begin
//  Thiago Melo SOL 177768 Kintana 1635450 INI
{  if (PageControlDet.ActivePage = tbsIntegracaoContasaPagar) then
  begin
     btnExcluirAp.Visible := False;
     btnGeraAp.Visible    := True;
     btnExcluirAp.Enabled := False;
     btnGeraAp.Enabled    := True;
  end
  else
  begin
     btnExcluirAp.Visible := False;
     btnGeraAp.Visible := False;
     btnExcluirAp.Enabled := False;
     btnGeraAp.Enabled := False;
  end;

  if (PageControlDet.ActivePage = tbsIntegracaoContasaPagar) and
     (CdsDet.State in [dsBrowse,dsEdit]) and
     (CmeDetalhe.Operacao in [opInserir, opAlterar])  then begin

     btnExcluirAp.Enabled := (CdsDet.FieldByName('CODDOCUMENTO').AsInteger <> 0);
     btnExcluirAp.Visible := (CdsDet.FieldByName('CODDOCUMENTO').AsInteger <> 0);
     btnGeraAp.Visible := (CdsDet.FieldByName('CODDOCUMENTO').AsInteger = 0);
     btnGeraAp.Enabled := (CdsDet.FieldByName('CODDOCUMENTO').AsInteger = 0);
  end;
}
//  Thiago Melo SOL 177768 Kintana 1635450 FIM
  inherited;
end;
//Eraldo Luis da Silva SOL 137268 Kintana 829513 Inicio Fim


procedure TfrmCadRegTrein.btnExcluirApClick(Sender: TObject);
Var sSql,sMens:String;
    bResult : Boolean;
    iDestac, iCampo : Integer;
begin
//  Thiago Melo SOL 177768 Kintana 1635450 INI
(*  TRY
     TRY
        bResult := true;

     if CdsDet.FieldByName('CODDOCUMENTO').AsInteger <> 0 then begin
        btnExcluirAp.Visible := True;


        sSql:=              ('SELECT STATUS, DATAVENCTO '+CR_LF+
                             'FROM  DOCUMENTO '+CR_LF+
                             'WHERE  (CODDOCUMENTO = '+CdsDet.FieldByName('CODDOCUMENTO').AsString+ ')');
        QryDocumento.Close;
        QryDocumento.SQL.Clear;
        QryDocumento.SQL.Text := sSql;
        QryDocumento.Open;
        if not qryDocumento.IsEmpty then begin
          if QryDocumento.FieldByName('STATUS').AsInteger = 2 then begin
             MsgDlg('Documento baixado. Não é permitido Excluir AP.  ','Aviso',mtWarning,[mbOk],0);
             bResult := false;
          end;
        end;

          if bResult then begin
             bResult := CtrlFinanc.TestaDispFinanc(Sistema.IdEmpresa, Trunc(sistema.IdUsuario), QryDocumento.FieldByName('DATAVENCTO').AsDateTime);
                    if not BResult then begin
                       MsgDlg('O Documento não pode ser Alterado, Excluído ou Inserido Motivo: A disponibilidade está Bloqueada e o Usuário não possui Autorização para executar lançamentos.  ','Aviso',mtWarning,[mbOk],0);
                    end;
          end;

          {if bResult then begin
             bResult :=CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,DatetoStr(DataVencto));
                     if not BResult then begin
                         MsgDlg('Período bloqueado para Lançamento.', 'Aviso', mtWarning, [mbOk], 0);
                     exit;
                     end;
          end;}

          if bResult then
          begin

        //Incializa transação
        if not dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.StartTransaction;

            sSql:=              ('DELETE FROM LANCAMENTO '+CR_LF+
                                 ' WHERE IDMODULO = 72 '+CR_LF+
                                 ' AND (PLNCODIGO = ' +CdsDet.FieldByName('PLNCODIGO').AsString+ ')');

            QryDocumento.Close;
            QryDocumento.SQL.Clear;
            QryDocumento.SQL.Text := sSql;
            QryDocumento.ExecSQL;

            sSql:=              ('DELETE FROM LANCTODOCUM '+CR_LF+
                                 'WHERE  (CODDOCUMENTO = ' +CdsDet.FieldByName('CODDOCUMENTO').AsString+ ')');
            QryDocumento.Close;
            QryDocumento.SQL.Clear;
            QryDocumento.SQL.Text := sSql;
            QryDocumento.ExecSQL;

            sSql:=              ('DELETE FROM RATEIODOCUM '+CR_LF+
                                 'WHERE  (CODDOCUMENTO = ' +CdsDet.FieldByName('CODDOCUMENTO').AsString+ ')');
            QryDocumento.Close;
            QryDocumento.SQL.Clear;
            QryDocumento.SQL.Text := sSql;
            QryDocumento.ExecSQL;

            sSql:=              ('DELETE FROM PLANILHA '+CR_LF+
                                 ' WHERE IDMODULO = 72 '+CR_LF+
                                  ' AND (PLNCODIGO = ' +CdsDet.FieldByName('PLNCODIGO').AsString+ ')');
            QryDocumento.Close;
            QryDocumento.SQL.Clear;
            QryDocumento.SQL.Text := sSql;
            QryDocumento.ExecSQL;


            sSql:=              ('DELETE FROM DOCUMENTO '+CR_LF+
                                 'WHERE  (CODDOCUMENTO = ' +CdsDet.FieldByName('CODDOCUMENTO').AsString+ ')');
            QryDocumento.Close;
            QryDocumento.SQL.Clear;
            QryDocumento.SQL.Text := sSql;
            QryDocumento.ExecSQL;

            sSql:=              ('UPDATE HSTTRN SET CODDOCUMENTO = NULL, PLNCODIGO = NULL '+CR_LF+
                                 ' WHERE IDCURSO = '+CdsDet.FieldByname('IDCURSO').AsString+CR_LF+
                                 ' AND  (CODDOCUMENTO = ' +CdsDet.FieldByName('CODDOCUMENTO').AsString+ ')');
            QryDocumento.Close;
            QryDocumento.SQL.Clear;
            QryDocumento.SQL.Text := sSql;
            QryDocumento.ExecSQL;

            CdsDet.FieldByName('CODDOCUMENTO').AsInteger := 0;
            CdsDet.FieldByName('PLNCODIGO').AsInteger := 0;

            dtmBaseDados.dbBaseDados.Commit;

            MsgDlg('Documento Excluido Com Sucesso.  ','Aviso',mtInformation,[mbOk],0);

            btnExcluirAp.Visible :=false;
            btnGeraAp.Visible    :=true;

       dbeDataVenc.Enabled := true;
       dblcUnidNegoc.Enabled := true;
       dblcCentroRespon.Enabled := true;
       dblcTipoRD.Enabled := true;
       CmbCentCusto.Enabled := true;
       Edit1.Enabled := true;
       CmbPrograma.Enabled := true;
       CmbPatro.Enabled := true;
       CmbPlano.Enabled := true;
       sOberv.Enabled := true;
       cmprocFonecedor.Enabled := true;
       CheckBox1.Enabled := true;
       if CheckBox1.Checked = true then begin
       cmprocFonecedor.Enabled := true;
       end;                       }
       dbedValor.Enabled := true;
       CMProcuraCurso.Enabled := true;
       dblckEntid.Enabled := true;

          end;
     end;

     EXCEPT
           on E:Exception Do
           begin
                //Cancela Transação
                dtmBaseDados.dbBaseDados.Rollback;
                Application.MessageBox(pchar('Houve uma falha na integração dos módulos, favor verificar os dados enviados.' + #13 + E.Message),'Atenção',48);
           end;
     END;
  FINALLY
end;*)
//  Thiago Melo SOL 177768 Kintana 1635450 FIN
end;

function TfrmCadRegTrein.GravarDocumento(Rateio, UsaPlanoPatro: Boolean): boolean;
var
  Cod_Documento,sObservacao, sCodCentroCusto,ContaPadrao,sSQL,
  PlaConta,sDebCred,sCentroRespon,CodCentroRespon :String;
  FIdPatro, FIdPlanoPrev: Integer;
  iIdPrograma,iCodForma,FNumDocGerados,IdFavorecido,PlanoPadrao,FIdUsuario,
  CodPortForma,FIdModulo,FIdContaBanco,FCodTipDoc,FIdEmpresa,iIdSegregaCriter,
  Plano,iUnidNegoc,IdForCli: Integer;
  DataRecebimento : TDateTime;
  dCodTipDoc,rValor : Double;
  Hoje : TDateTime;
  iNumOrdem: Integer;
  rNumDocumento: real;
  sTipRecDes: string;
  sPlaContaAnt: String;
  ObervDocum: String;
  iDestacado,iContaBancaria : Integer;
begin
//  Thiago Melo SOL 177768 Kintana 1635450 INI
(*
  Hoje := Date;
  TRY
     TRY
        Result := false;
        //Carrega Variaveis
        sCodCentroCusto := qryCentroCusto.FieldByName('CODCENTROCUSTO').AsString;
        FIdUsuario := Sistema.IdUsuario;
        FIdModulo := Sistema.IdModulo;
        sObservacao := Edit1.Text;
        iIdPrograma := qryProgramaPrev.FieldByName('IDPROGRAMA').AsInteger;
        CodTipRecDes := qryTipoRD.FieldByName('CODTIPRECDES').AsInteger;
        FIdEmpresa :=  Sistema.IdEmpresa;
        DataRecebimento := dbeDataVenc.Date;
        DataEmissao := Hoje;
        rValor := dbedValor.Value;
        iUnidNegoc := qryUnidNegoc.FieldByName('UNIDNEGOC').AsInteger;
        sCentroRespon := qryCentroResp.FieldByName('CODCENTRORESPON').AsString;
        FIdPlanoPrev := qryPlanoPrev.FieldByName('IDPLANOPREV').AsInteger;
        FIdPatro :=  qryPatroPrev.FieldByName('IDPESSOA').AsInteger;
        sDebCred := 'C' ;
        FCodTipDoc := 51;
        ObervDocum := sOberv.Text;
        FIdContaBanco := 0 ;
        //Cria SQL
        QryDocumento.SQL.Clear;
        sSQL :='';

        if CheckBox1.Checked = true then
        iDestacado := cmprocFonecedor.ForCliReg.Id
        else
        iDestacado := CdsEntid.FieldByName('IDPESSOA').AsInteger;

        FCtrlDocumento.Prepare(OpDocumento, odlEfetivo);

        //Código do Documento
        iCodDocumento := FCtrlDocumento.GetSequenceDocumento;

        if CheckBox1.Checked = true then
        IdFavorecido := cmprocFonecedor.ForCliReg.Id
        else
        IdFavorecido :=  CdsEntid.FieldByName('IDPESSOA').AsInteger;

        // Gerar o Número do Documento sequencial
        iNumOrdem := 1;
        rNumDocumento := StrToFloat(IntToStr(IdFavorecido) + IntToStr(iNumOrdem));
        while (FCtrlDocumento.ExisteNumDoc('P', IdFavorecido, FIdEmpresa, rNumDocumento, '')) do
        begin
          Inc(iNumOrdem);
          rNumDocumento := StrToFloat(IntToStr(IdFavorecido) + IntToStr(iNumOrdem));
        end;

        //Incializa transação

        if not dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.StartTransaction;

        frmAguarde.Mostra('Aguarde Enviando Dados ao Financeiro e Contábil ');

         iContaBancaria := buscarContaBancaria(iDestacado);
         FIdContaBanco := iContaBancaria;

         // Carrega "rPlaContas"
         PlacontasCapCar.GetPlacontas(-1, // codPortForma (iPortadorForma)
         iDestacado, // idforcli
         Sistema.IdEmpresa, // idEmpresa
         iIdPrograma, // idProg
         FIdPatro, // idPatro
         sCodCentroCusto, // codCentroCusto
         InttoStr(CodTipRecDes), // codtiporecdes
         'P', // recpag
         opldEfetivo, // operLanctoDocCapCar
         False, // bLanceBaixa
         rPlaContas, // PlaContas [var]
         True, // bIntegraContab
         FIdPlanoPrev); // plano

         frmaguarde.apaga;

         If (rPlaContas.sPlaconta = '') Or (rPlaContas.iPlano <= 0) Then
         Raise exception.Create('Conta Contábil de Crédito não encontrada.');

         frmAguarde.Mostra('Aguarde Enviando Dados ao Financeiro e Contábil ');

         // Efetivar Parte Contábil
        If not _CtrlLancamento.InsereLancaContab( '2',
                                                 sistema.IdEmpresa,
                                                 Sistema.IdModulo ,
                                                 Sistema.idUsuario,
                                                 idPlano,
                                                 qryUnidNegoc.FieldByName('UNIDNEGOC').AsInteger,
                                                 rPlaContas.iSubConta,// placontas.iSubContaPass,
                                                 rPlaContas.iSubContaPass,// placontas.iSubConta,
                                                 FIdPlanoPrev,
                                                 FIdPlanoPrev,
                                                 iPlanilha,
                                                 0,
                                                 DateToStr(DataEmissao),
                                                 intToStr(icodDocumento),
                                                 'Geração AP - RH TREINAMENTO',
                                                 'Geração AP - RH TREINAMENTO',
                                                 'Geração AP - RH TREINAMENTO',
                                                 'Geração AP - RH TREINAMENTO',//Hist 4
                                                 'Geração AP - RH TREINAMENTO',//Hist 5
                                                 '03',//StipOper
                                                 sCodCentroCusto,//cCCustd  - debito
                                                 rPlaContas.sPlaconta,//cContad  *******************
                                                 sCodCentroCusto,//cCCustc
                                                 rPlaContas.sPlacontaPass,//cContac  - CREDITO
                                                 '',//sCodHist
                                                 (rValor),
                                                 false,
                                                 UsaPlanoPatro,
                                                 -1,
                                                 -1,
                                                 -1,
                                                 true,
                                                 icodDocumento) Then
                                                 Raise EdataBaseError.Create(_CtrlLancamento.MessageInfo);
        liPlncodigo := _CtrlLancamento.RetornoPlnCodigo;
        frmaguarde.apaga;

        frmAguarde.Mostra('Aguarde Enviando Dados ao Financeiro e Contábil ');

        // Inserir Documento
        FCtrlDocumento.SetValues(iCodDocumento,
           rNumDocumento, '', '0','P', '2',
          '', '',
          rPlaContas.sPlacontaPass,
          sCodCentroCusto, '', '', '', '', '', '', '', ObervDocum,
          DataRecebimento, DataEmissao, DataRecebimento, 0, 0, 0, 0, 0, 0, 0, 0,
          FCodTipDoc, FIdEmpresa, FIdModulo, IdFavorecido, 0, FIdContaBanco, // Id da Conta Bancária,
          0, CtrlFuncoesRH.IFF(Plano=0,PlanoPadrao,Plano),
          0, 0, 0, 0, 0, FIdUsuario, 0, 0, 0,
          rPlacontas.iSubConta,
          CodPortForma, // Portador Forma
          0, 0, iCodForma, iIdSegregaCriter);

        //Gravar LanctoDocum
        FCtrlDocumento.LanctoDocum.SetValues(DataEmissao, iCodDocumento, 0, 0, 0, rValor, iUnidNegoc,
          Trunc(liPlncodigo), 0, FIdUsuario, FIdEmpresa, 0, 0, FCodTipDoc, 0, 0, '2', '', '', '', sObservacao, '',
          '', '', sDebCred, FIdModulo, 0, UsaPlanoPatro, (Sistema.IdModulo = 72), // Contabiliza só no ModAuto
          0);

        // Lançar as linhas de rateio para o Documento atual
          sCodCentroCusto := qryCentroCusto.FieldByName('CODCENTROCUSTO').asString;
          iUnidNegoc := qryUnidNegoc.FieldByName('UNIDNEGOC').asInteger;
          sCentroRespon := CtrlFuncoesRH.IFF(CodCentroRespon<>'',CodCentroRespon,qryCentroResp.FieldByName('CODCENTRORESPON').asString);
          sTipRecDes := qryTipoRD.FieldByName('CODTIPRECDES').asString;
          IdForCli := cmprocFonecedor.ForCliReg.Id;
          rValor := dbedValor.Value;
          FIdPatro := CtrlFuncoesRH.IFF(qryPlanoPrev.FieldByName('IDPLANOPREV').asInteger=0,
          FCtrlListTerceirosRH.GetIdPatro(1), qryPatroPrev.FieldByName('IDPESSOA').asInteger);
          FIdPlanoPrev := CtrlFuncoesRH.IFF(qryPlanoPrev.FieldByName('IDPLANOPREV').asInteger=0,
          FCtrlListTerceirosRH.GetIdPlanoPrev(1), qryPlanoPrev.FieldByName('IDPLANOPREV').asInteger);

          if (Rateio) and (UsaPlanoPatro) then begin
            if CmbPrograma.Value = '' then
              iIdPrograma := FCtrlListTerceirosRH.GetIdProgramaCCusto(sCodCentroCusto, FIdEmpresa);
            if (CmbPrograma.Value  = '') then
              iIdPrograma := -1;
          end
          else
            iIdPrograma := -1;

            //Gravar RateioDocum
           FCtrlDocumento.RateioDocum.SetValues(rValor, 0, 0, 0, FIdEmpresa, iCodDocumento,
            CtrlFuncoesRH.IFF(iUnidNegoc=0, -1, iUnidNegoc), 0, FIdUsuario, 0,
            CtrlFuncoesRH.IFF(Plano=0,PlanoPadrao,Plano),
            FIdPlanoPrev,
            FIdPatro,
            qryProgramaPrev.FieldByName('IDPROGRAMA').AsInteger,
            0, FIdEmpresa, sTipRecDes, 'P',
            sCentroRespon,
            sCodCentroCusto,
            '', true);

        // Efetivar inserção do Documento
        if Not (FCtrlDocumento.Insert) then
          raise Exception.Create(FCtrlDocumento.MessageInfo);

        FCtrlDocumento.Prepare(OpLanctoDocum, odlEfetivo);
        FCtrlDocumento.OPeracaoLancto := olsoContabiliza;
        FCtrlDocumento.PartidaDobrada := True;

        //FCtrlDocumento.Update;

        Result := true;

        frmAguarde.Mostra('Aguarde Enviando Dados ao Financeiro e Contábil ');

        frmaguarde.apaga;

        if (MsgDlg(' Gerar Evento Financeiro (Contas a Pagar) ' +CR_LF+
                   '      no Valor Total de ' +(dbedValor.Text)+ ' ?',
        'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes) then
        begin
          dtmBaseDados.dbBaseDados.Rollback;
          exit;
        end;

        sSql:=              (' SELECT NODOCUMENTO '+CR_LF+
                             ' FROM DOCUMENTO '+CR_LF+
                             ' WHERE CODDOCUMENTO = ' +IntToStr(iCodDocumento)+ '');


        QryDocumento.Close;
        QryDocumento.SQL.Clear;
        QryDocumento.SQL.Text := sSql;
        QryDocumento.Open;
        NoDocumento :=  QryDocumento.Fieldbyname('NODOCUMENTO').AsInteger;

        CdsDet.FieldByName('CODDOCUMENTO').AsInteger := iCodDocumento;
        CdsDet.FieldByName('PLNCODIGO').AsFloat := liPlncodigo;

        if cmprocFonecedor.ForCliReg.Id <> 0 then
        cdsDet.FieldByname('IDFORCLI').AsInteger := cmprocFonecedor.ForCliReg.Id
        else
        cdsDet.FieldByname('IDFORCLI').AsInteger :=  CdsEntid.FieldByName('IDPESSOA').AsInteger;

        sSql:=              ('UPDATE HSTTRN SET CODDOCUMENTO = ' +CdsDet.FieldByName('CODDOCUMENTO').AsString+CR_LF+
                             ' WHERE IDCURSO = '+CdsDet.FieldByname('IDCURSO').AsString+CR_LF+
                             ' AND IDFORCLI = ' +cdsDet.FieldByname('IDFORCLI').AsString+CR_LF+
                             ' AND  (CODDOCUMENTO = ' +CdsDet.FieldByName('CODDOCUMENTO').AsString+ ')');
        QryDocumento.Close;
        QryDocumento.SQL.Clear;
        QryDocumento.SQL.Text := sSql;
        QryDocumento.ExecSQL;

        dtmBaseDados.dbBaseDados.Commit;

        MsgDlg('Contas a Pagar Gerada Com Sucesso' +CR_LF+
               ' Documento nº ' + IntToStr(NoDocumento)+ ' .',
                  'Aviso', mtInformation, [mbOk,mbHelp], 0);

         btnExcluirAp.enabled := true;
         btnExcluirAp.Visible := true;
         btnGeraAp.Visible    := false;
     EXCEPT
           on E:Exception Do
           begin
                //Cancela Transação
                dtmBaseDados.dbBaseDados.Rollback;
                btnExcluirAp.enabled := false;
             //   btnGeraAp.Enabled    := true;
                Application.MessageBox(pchar('Houve uma falha na integração dos módulos, favor verificar os dados enviados.' + #13 + E.Message),'Atenção',48);
           end;
     END;
  FINALLY
    if QryDocumento.Active   then QryDocumento.Close();

  end;
  *)
//  Thiago Melo SOL 177768 Kintana 1635450 FIM
end;


function  TfrmCadRegTrein.VerificaPreenchimento: Boolean;
begin
//  Thiago Melo SOL 177768 Kintana 1635450 INI

(*
  Result := False;
  try
    // ---------------------------------------------------------------------------------------------
   if Trim(dbeDataVenc.text) = '' then begin
       MsgDlg('Obrigatório preencher o ' + Label12.Caption,'Erro',mtError,[mbOk],0);
    if dbeDataVenc.CanFocus then dbeDataVenc.SetFocus;
       exit;
    end;

    if (Trim(dblcUnidNegoc.Text) = '') then begin
          MsgDlg('Obrigatório preencher a Atividade','Erro',mtError,[mbOk],0);
          Repaint;
    if dblcUnidNegoc.CanFocus then dblcUnidNegoc.SetFocus;
          exit
    end;

    if (Trim(dblcCentroRespon.Text) = '') then begin
       MsgDlg('O vínculo do Usuário ao Centro de Responsabilidade é obrigatório','Erro',mtError,[mbOk],0);
       Repaint;
    if dblcCentroRespon.CanFocus then dblcCentroRespon.SetFocus;
       exit
    end;

    if Trim(dblcTipoRD.Text) = '' then begin
       MsgDlg('Obrigatório preencher o Tipo de Recebimento/Desembolso','Erro',mtError,[mbOk],0);
       Repaint;
    if dblcTipoRD.CanFocus then dblcTipoRD.SetFocus;
       exit;
    end;

    if Trim(CmbCentCusto.Text) = '' then begin
       MsgDlg('Obrigatório preencher o Centro de Custo','Erro',mtError,[mbOk],0);
       Repaint;
    if CmbCentCusto.CanFocus then CmbCentCusto.SetFocus;
       exit;
    end;

    if Trim(CmbPrograma.Text) = '' then begin
       MsgDlg('Obrigatório preencher o PROGRAMA','Erro',mtError,[mbOk],0);
       Repaint;
    if CmbPrograma.CanFocus then CmbPrograma.SetFocus;
       exit;
    end;

    if (Trim(CmbPlano.Text) = '') or (Trim(CmbPatro.Text) = '' ) then begin
       MsgDlg('Obrigatório preencher o Plano Previdenciário e a Patrocinadora na ''Pasta'' Previdência','Erro',mtError,[mbOk],0);
       Repaint;
    if cmbPlano.CanFocus then cmbPlano.SetFocus;
    exit;
    end;

    // ---------------------------------------------------------------------------------------------

  except
    on E:Exception Do
    begin
      Screen.Cursor := crDefault;
      Exit;
    end;
  end;

  Result := True;  *)
//  Thiago Melo SOL 177768 Kintana 1635450 FIM
end;

function TfrmCadRegTrein.FinalDocumento(const CentroRespon,
  TipRecDes: string; const UnidNegoc, IdForCli: integer): boolean;
begin
//  Thiago Melo SOL 177768 Kintana 1635450 INI
{  if (FConsTipoDesemb) then
  begin
    Result :=
      (cmprocFonecedor.ForCliReg.Id <> IdForCli)
  end
  else
  begin
    Result :=
      (qryUnidNegoc.FieldByName('UNIDNEGOC').asInteger <> UnidNegoc) or
      (qryCentroResp.FieldByName('CODCENTRORESPON').asString <> CentroRespon) or
      (qryTipoRD.FieldByName('CODTIPRECDES').asString <> TipRecDes) or
      (cmprocFonecedor.ForCliReg.Id <> IdForCli);
  end;
}
//  Thiago Melo SOL 177768 Kintana 1635450 FIM
end;

procedure TfrmCadRegTrein.CMProcuraCursoValidaDados(Sender: TObject);
begin
  if (CdsDet.State in [dsEdit,dsInsert]) then begin
    CdsCurso.Data := CtrlCurso.ListGeral(CdsDet.FieldByName('IDCURSO').asFloat);
    CdsDet.FieldByName('IDENTIDINSTR').asFloat := CdsCurso.FieldByName('IDENTIDINSTR').asFloat;
    CdsDet.FieldByName('FLGAVALTEOR').asInteger := CdsCurso.FieldByName('TEMAVAL').asInteger;
    CdsDet.FieldByName('FLGAVALPRAT').asInteger := CdsCurso.FieldByName('TEMAVPR').asInteger;
    CdsDet.FieldByName('DUR_PRAT').asFloat := CdsCurso.FieldByName('DUR_PRAT').asFloat;
    CdsDet.FieldByName('DUR_TEOR').asFloat := CdsCurso.FieldByName('DUR_TEOR').asFloat;
    CdsDet.FieldByName('VALOR').asFloat := CdsCurso.FieldByName('VALOR').asFloat;

//    CdsMensalidades.First;

    ModoEdicao := True;
    CdsMensalidades.Filtered := False;
    CdsMensalidades.Filter   := 'IDCURSO = ' + FloatToStr(CdsDet.FieldByName('IDCURSO').asFloat) + ' AND NUMSEQ = ' + FloatToStr(CdsDet.FieldByName('NUMSEQ').asFloat);
    CdsMensalidades.Filtered := True;

    CdsMensalidadesAux.First;
    CdsMensalidadesAux.Filtered := False;
    CdsMensalidadesAux.Filter   := 'IDCURSO = ' + FloatToStr(CdsDet.FieldByName('IDCURSO').asFloat) + ' AND NUMSEQ = ' + FloatToStr(CdsDet.FieldByName('NUMSEQ').asFloat);
    CdsMensalidadesAux.Filtered := True;
//    ModoEdicao := False;

    CarregaProjFinal;
    CalcFimDaFidelidade;
    TotalizaHoras;
    CarregaValorPrevisto;
    HabilitarParcialmente;
  end;
end;

procedure TfrmCadRegTrein.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  PageControlDet.ActivePage := tbshDadosBasicos; // FHBS - SOL 137268
  PageControlDetChange(PageControlDet); // FHBS - SOL 137268

//  Thiago Melo SOL 177768 Kintana 1635450 INI
  CdsMensalidades.Data := CtrlRegTrein.ListaMensalidades(IdPessoa, CdsDet.FieldByName('IDCURSO').asFloat, CdsDet.FieldByName('NUMSEQ').AsFloat, 0);
  CdsMensalidadesAux.Data := CdsMensalidades.Data;
//  Thiago Melo SOL 177768 Kintana 1635450 FIM
end;

function TfrmCadRegTrein.BuscarContaBancaria(
         const idPessoa: Integer): Integer;
Var cdsTemp: TCMClientDataSet;
    sSql : String;
    IdFavorecido :Integer;
Begin
//  Thiago Melo SOL 177768 Kintana 1635450 INI
{   Try
     Result := 0;
     if CheckBox1.Checked = true then
       IdFavorecido := cmprocFonecedor.ForCliReg.Id
     else
       IdFavorecido :=  CdsEntid.FieldByName('IDPESSOA').AsInteger;

       sSql:= ('SELECT IDCBANCARIA '+CR_LF+
               'FROM CONTABANCARIA '+CR_LF+
               'WHERE FLGCONTAPREF = 1 '+CR_LF+
               'AND IDPESSOA = ' +InttoStr(IdFavorecido)+ ' ');
       QryDocumento.Close;
       QryDocumento.SQL.Clear;
       QryDocumento.SQL.Text := sSql;
       QryDocumento.Open;

       if not QryDocumento.IsEmpty then
         Result := qryDocumento.FieldByName('IDCBANCARIA').AsInteger;
   Finally
   end; }
//  Thiago Melo SOL 177768 Kintana 1635450 FIM
end;

procedure TfrmCadRegTrein.CmeDetalheAtualizaBotoes(Sender: TObject);
begin
  inherited;
  PageControlDetChange(PageControlDet); // FHBS - SOL 137268
end;

procedure TfrmCadRegTrein.PageControlDetExit(Sender: TObject);
begin
 { if (PageControlDet.ActivePage = tbsIntegracaoContasaPagar) and
     (CdsDet.State in [dsBrowse,dsEdit]) and
     (CmeDetalhe.Operacao in [opInserir, opAlterar])  then begin

     btnExcluirAp.Enabled := (CdsDet.FieldByName('CODDOCUMENTO').AsInteger <> 0);
     btnExcluirAp.Visible := (CdsDet.FieldByName('CODDOCUMENTO').AsInteger <> 0);
     btnGeraAp.Visible := (CdsDet.FieldByName('CODDOCUMENTO').AsInteger = 0);
     btnGeraAp.Enabled := (CdsDet.FieldByName('CODDOCUMENTO').AsInteger = 0);
   end;}
  inherited;
end;

procedure TfrmCadRegTrein.tbsIntegracaoContasaPagarExit(Sender: TObject);
begin
  {if (PageControlDet.ActivePage = tbsIntegracaoContasaPagar) and
     (CdsDet.State in [dsBrowse,dsEdit]) and
     (CmeDetalhe.Operacao in [opInserir, opAlterar])  then begin

     btnExcluirAp.Enabled := (CdsDet.FieldByName('CODDOCUMENTO').AsInteger <> 0);
     btnExcluirAp.Visible := (CdsDet.FieldByName('CODDOCUMENTO').AsInteger <> 0);
     btnGeraAp.Visible := (CdsDet.FieldByName('CODDOCUMENTO').AsInteger = 0);
     btnGeraAp.Enabled := (CdsDet.FieldByName('CODDOCUMENTO').AsInteger = 0);
   end; }
   inherited;
end;

procedure TfrmCadRegTrein.bbtnVoltarDetClick(Sender: TObject);
begin
  PageControlDet.ActivePage := tbshDadosBasicos;
  inherited;
end;

//  Thiago Melo SOL 177768 Kintana 1635450 INI

function TfrmCadRegTrein.RetornaValorTotalMensalidade(
  Cds: TCMClientDataSet): Double;
var
  TotalValorMensalidade : Double;
begin
  TotalValorMensalidade := 0;
  if (not Cds.IsEmpty) then begin
    Cds.First;

    while not Cds.Eof do begin
      TotalValorMensalidade := TotalValorMensalidade + Cds.FieldByName('VALORMENSALIDADE').AsFloat;
      Cds.Next;
    end;
  end
  else begin
    TotalValorMensalidade := 0;
  end;
  Result := TotalValorMensalidade;
end;

procedure TfrmCadRegTrein.DsMensalidadesAuxDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if CdsMensalidadesAux.FieldByName('IDMENSALIDADES').AsFloat > 0 then begin
    CdsMensalidades.Locate('IDMENSALIDADES', CdsMensalidadesAux.FieldByName('IDMENSALIDADES').AsFloat, [] );
  end
  else begin
    CdsMensalidades.Locate('NPARCELA', CdsMensalidadesAux.FieldByName('NPARCELA').AsInteger, [] );
  end;
end;

procedure TfrmCadRegTrein.CdsMensalidadesAuxAfterOpen(DataSet: TDataSet);
begin
  inherited;
  CdsMensalidadesAux.Fields[3].DisplayLabel := 'Nº Parcela';
  CdsMensalidadesAux.Fields[4].DisplayLabel := 'Data Vencimento';
  CdsMensalidadesAux.Fields[5].DisplayLabel := 'Valor Mensalidade';
  CdsMensalidadesAux.Fields[6].DisplayLabel := 'Valor Empresa';
  CdsMensalidadesAux.Fields[7].DisplayLabel := 'Valor Empregado';
  CdsMensalidadesAux.Fields[8].DisplayLabel := 'Vlr. Empresa Atual';

  TNumericField(CdsMensalidadesAux.FieldByName('VALORMENSALIDADE')).DisplayFormat := ',0.00;-,0.00';
  TNumericField(CdsMensalidadesAux.FieldByName('VALOREMPRESA')).DisplayFormat     := ',0.00;-,0.00';
  TNumericField(CdsMensalidadesAux.FieldByName('VALOREMPREGADO')).DisplayFormat   := ',0.00;-,0.00';
  TNumericField(CdsMensalidadesAux.FieldByName('VALOREMPRESA_AT')).DisplayFormat  := ',0.00;-,0.00';

  grdDespesas.Fields[12].Visible := False;
  grdDespesas.Fields[11].Visible := False;
  grdDespesas.Fields[10].Visible := False;
  grdDespesas.Fields[9].Visible  := False;
  grdDespesas.Fields[2].Visible  := False;
  grdDespesas.Fields[1].Visible  := False;
  grdDespesas.Fields[0].Visible  := False;
end;

Function TfrmCadRegTrein.VerificaPreenchimentoObrigatorio_Despesas : Boolean;
begin
  if (CdsMensalidades.FieldByName('DTVENCIMENTOPARC').IsNull) or (CdsMensalidades.FieldByName('VALORMENSALIDADE').AsFloat < 1) then begin
    MsgDlg('Favor preencher Data Vencimento e Valor Mensalidade para inclusão do registro', 'Informação', mtInformation, [mbOk], 0);
    Result := False;
    Exit;
  end;

  Result := True;
end;

procedure TfrmCadRegTrein.bbtnCancelarClick(Sender: TObject);
begin
  ModoEdicao := True;
  inherited;
  CdsMensalidades.CancelUpdates;
  CdsMensalidadesAux.CancelUpdates;

  CdsMensalidades.Data := CtrlRegTrein.ListaMensalidades(IdPessoa, CdsDet.FieldByName('IDCURSO').asFloat, CdsDet.FieldByName('NUMSEQ').AsFloat, 0);
  CdsMensalidadesAux.Data := CdsMensalidades.Data;
end;

procedure TfrmCadRegTrein.ReorganizaQtd;
var
  qtd : Integer;
begin
  if not CdsMensalidades.IsEmpty then begin
    Qtd := CdsMensalidades.RecordCount;

    if CdsDet.State in [DsInsert, DsEdit] then begin
      CdsDet.FieldByName('QTDPARCELA').AsInteger := Qtd;
    end
    else begin
      CdsDet.Edit;
      CdsDet.FieldByName('QTDPARCELA').AsInteger := Qtd;
      CdsDet.Post;
    end;
  end;
end;

Function TfrmCadRegTrein.StrZero(Numero : String; Casas : Integer) : String;
var
  zeros : String;
Begin
  zeros := '00000000000000000000000000000000000000000';
  result := copy(zeros,1,casas) + numero;
  result := copy(result, length(result) - (casas - 1), casas);
end;

procedure TfrmCadRegTrein.CalcFimDaFidelidade;
var
  qry : TwwQuery;
  Dt  : TDate;

  Function AddMeses (Dia, AnoMes : String; QtdeMes : Integer) : TDate;
  var
    Mes, Ano, x : Integer;
    DtResult : String;
    DtTratada : TDate;
  begin
    AnoMes := FormatDateTime('yyyy/mm',StrToDate(AnoMes));

    Ano := StrToInt(Copy(AnoMes,1,4));
    Mes := StrToInt(Copy(AnoMes,6,2));

    for x := 1 to QtdeMes do begin
      if Mes = 12 then begin
        Mes := 1;
        Inc(Ano);
      end
      else begin
        Inc(Mes);
      end;  
    end;
    if (Mes = 2) or (StrToInt(Dia) > 30) then begin
      DtTratada := DiasUteis.UltDiaMes(Ano, Mes);
      Result := DtTratada;
      Exit;
{      LastDayOfMonth := EndOfTheMonth(StrToDate(DtResult));
      Result := LastDayOfMonth;}
    end;
    DtResult := Dia + '/' + StrZero(IntToStr(Mes), 2) + '/' + IntToStr(Ano);
    Result := StrToDate(DtResult);
  end;

begin
  qry := TwwQuery.Create(Self);
  qry.DataBaseName := 'BaseDados';

  try
    qry.Close;
    qry.Sql.Clear;
    qry.Sql.Add('SELECT S.TEMPO, S.FLGFIDELIZA, S.SIGLA, S.IDSIGLACURSO ');
    qry.Sql.Add('  FROM CURSO C, SIGLACURSO S ');
    qry.Sql.Add(' WHERE C.IDSIGLACURSO = S.IDSIGLACURSO ');
    qry.Sql.Add('   AND C.IDCURSO = ' + FloatToStr(CdsDet.FieldByName('IDCURSO').AsFloat));
    qry.Open;

    if not qry.IsEmpty then begin
      if (qry.FieldByName('FLGFIDELIZA').AsInteger = 1) then
      begin
        if (CdsDet.FieldByName('DTENTREGA').AsString <> '') and (qry.FieldByName('TEMPO').AsInteger > 0) and (CkbProjetoEntregue.Checked) then begin
          Dt := AddMeses(Copy(CdsDet.FieldByName('DTENTREGA').AsString,1,2), CdsDet.FieldByName('DTENTREGA').AsString, qry.FieldByName('TEMPO').AsInteger);
          DtpFimdaFidelidade.Date := Dt;
        end;

        if (CdsDet.FieldByName('DTENTREGA').AsString <> '') and  (CkbProjetoEntregue.Checked) then begin
          lblFimDaFidelidade.Visible := True;
          DtpFimdaFidelidade.Visible := True;
        end
        else begin
          DtpFimdaFidelidade.Clear;
          lblFimDaFidelidade.Visible := False;
          DtpFimdaFidelidade.Visible := False;
        end;
      end
      else begin
        DtpFimdaFidelidade.Clear;
        lblFimDaFidelidade.Visible := False;
        DtpFimdaFidelidade.Visible := False;
      end;
    end
    else begin
      DtpFimdaFidelidade.Clear;
      lblFimDaFidelidade.Visible := False;
      DtpFimdaFidelidade.Visible := False;
    end;
  finally
    qry.Close;
    FreeAndNil(qry);
  end;
end;

procedure TfrmCadRegTrein.HabilitarParcialmente;
var
  qry : TwwQuery;
begin
  qry := TwwQuery.Create(Self);
  qry.DataBaseName := 'BaseDados';

  try
    qry.Close;
    qry.Sql.Clear;
    qry.Sql.Add('SELECT S.FLGPROPORCIONALIZA');
    qry.Sql.Add( 'FROM CURSO C, SIGLACURSO S ');
    qry.Sql.Add('WHERE C.IDSIGLACURSO = S.IDSIGLACURSO ');
    qry.Sql.Add('  AND C.IDCURSO = ' + FloatToStr(CdsDet.FieldByName('IDCURSO').AsFloat));
    qry.Open;

    if (not qry.IsEmpty) then begin
      if qry.FieldByName('FLGPROPORCIONALIZA').AsString = '0' then begin
        dbrgControle.Controls[2].Enabled := False;
      end
      else begin
        dbrgControle.Controls[2].Enabled := True;
      end;
    end
    else begin
      dbrgControle.Controls[2].Enabled := False;
    end;
  finally
    qry.Close;
    FreeAndNil(qry);
  end;
end;

procedure TfrmCadRegTrein.CarregaValorPrevisto;
var
  qry : TwwQuery;
  ValorPrevisto : Double;
begin
  qry := TwwQuery.Create(Self);
  qry.DataBaseName := 'BaseDados';

  try
    if (CdsDet.State = DsEdit) then begin
      qry.Close;
      qry.Sql.Clear;
      qry.Sql.Add('SELECT valor FROM HSTTRN');
      qry.Sql.Add(' WHERE');
      qry.Sql.Add('IDPESSOA = ' + FloatToStr(IdPessoa));
      qry.Sql.Add('   AND IDCURSO  = ' + FloatToStr(CdsDet.FieldByName('IDCURSO').asFloat));
      qry.Sql.Add('   AND NUMSEQ   = ' + FloatToStr(CdsDet.FieldByName('NUMSEQ').AsInteger));
      qry.Open;

      if qry.IsEmpty then begin
        qry.Close;
        qry.Sql.Clear;
        qry.Sql.Add('SELECT valor FROM curso');
        qry.Sql.Add(' WHERE');
        qry.Sql.Add('IDCURSO = ' + FloatToStr(CdsDet.FieldByName('IDCURSO').asFloat));
        qry.Open;
      end;

      ValorPrevisto := qry.FieldByName('valor').AsFloat;
    end
    else begin
      qry.Close;
      qry.Sql.Clear;
      qry.Sql.Add('SELECT valor FROM curso');
      qry.Sql.Add(' WHERE');
      qry.Sql.Add('IDCURSO = ' + FloatToStr(CdsDet.FieldByName('IDCURSO').asFloat));
      qry.Open;

      ValorPrevisto := qry.FieldByName('valor').AsFloat;
    end;

    EdtVlrPrevistoCurso.Value := ValorPrevisto;
  finally
    qry.Close;
    FreeAndNil(qry);
  end;
end;

function TfrmCadRegTrein.RetornaValorTotalEmpregado(
  Cds: TCmClientDataSet): Double;
var
  TotalValorEmpregado : Double;
begin
  TotalValorEmpregado := 0;

  if (not Cds.IsEmpty) then begin
    Cds.First;

    while not Cds.Eof do begin
      TotalValorEmpregado := TotalValorEmpregado + Cds.FieldByName('valorempregado').AsFloat;
      Cds.Next;
    end;
  end
  else begin
    TotalValorEmpregado := 0;
  end;

  Result := TotalValorEmpregado;
end;

function TfrmCadRegTrein.RetornaValorTotalEmpresa(
  Cds: TCMClientDataSet): Double;
var
  TotalValorEmpresa : Double;
begin
  TotalValorEmpresa := 0;
  if (not Cds.IsEmpty) then begin
    Cds.First;

    while not Cds.Eof do begin
      if (not Cds.FieldByName('valorempresa_at').IsNull) and (Cds.FieldByName('valorempresa_at').AsFloat > 0) then begin
        TotalValorEmpresa := TotalValorEmpresa + Cds.FieldByName('valorempresa_at').AsFloat;
      end
      else begin
        TotalValorEmpresa := TotalValorEmpresa + Cds.FieldByName('valorempresa').AsFloat;
      end;
      Cds.Next;
    end;
  end
  else begin
    TotalValorEmpresa := 0;
  end;

  Result := TotalValorEmpresa;
end;

procedure TfrmCadRegTrein.RetornaValorDevolverDtAtual;
var
  qry : TwwQuery;
  ValorEmpresa : Double;
  Tempo, MesesFaltantes : Integer;

  Procedure habilitarGrupoValor (Habilitar : Boolean);
  begin
    if Habilitar then begin
      lblValorDevolver.Visible      := True;
      lblDataAtual.Visible          := True;
      EdtVlrDevolverDtAtual.Visible := True;
      btnAtualizarMeta.Visible      := True;
      grpVlrDevolver.Visible        := True;
    end else begin
      lblValorDevolver.Visible      := False;
      lblDataAtual.Visible          := False;
      EdtVlrDevolverDtAtual.Visible := False;
      btnAtualizarMeta.Visible      := False;
      grpVlrDevolver.Visible        := False;
    end;
  end;

begin
  if (CdsDet.FieldByName('DATREFIM').IsNull) then begin
    if CkbProjetoEntregue.Visible then begin
      EdtVlrDevolverDtAtual.Value   := EdtValorEmpresa.Value;
      habilitarGrupoValor(True);
    end
    else begin
      EdtVlrDevolverDtAtual.Value   := 0;
      habilitarGrupoValor(False);
    end;
  end
  else begin
    if (CkbProjetoEntregue.Visible) then begin
      if (not CdsDet.FieldByName('DATREFIM').IsNull) then begin
        qry := TwwQuery.Create(Self);
        qry.DataBaseName := 'BaseDados';

        try
          qry.Close;
          qry.Sql.Clear;
          qry.Sql.Add('SELECT S.FLGFIDELIZA, S.TEMPO');
          qry.Sql.Add( 'FROM CURSO C, SIGLACURSO S ');
          qry.Sql.Add('WHERE C.IDSIGLACURSO = S.IDSIGLACURSO ');
          qry.Sql.Add('  AND C.IDCURSO = ' + FloatToStr(CdsDet.FieldByName('IDCURSO').AsFloat));
          qry.Open;

          if not qry.IsEmpty then begin
            if (DtpFimdaFidelidade.Date > Date) and (qry.FieldByName('flgfideliza').AsInteger = 1)  then begin
              if (EdtValorEmpresa.Value > 0) then begin
                ValorEmpresa   := EdtValorEmpresa.Value;
                Tempo          := qry.FieldByName('TEMPO').AsInteger;
                MesesFaltantes := DiasUteis.IntervaloMeses(Date, DtpFimdaFidelidade.Date);
                if Tempo > 0 then begin
                  try
                    EdtVlrDevolverDtAtual.Value := (ValorEmpresa / Tempo) * MesesFaltantes;
                  except
                    MsgDlg('Não foi possível realizar cálculo do campo valor a devolver na data atual', 'Informação', mtError, [mbok], 0);
                    EdtVlrDevolverDtAtual.Value := 0;
                    Exit;
                  end;
                  habilitarGrupoValor(True);
                end
                else begin
                  EdtVlrDevolverDtAtual.Value := 0;
                  habilitarGrupoValor(False);
                end;
              end
              else begin
                EdtVlrDevolverDtAtual.Value   := 0;
                habilitarGrupoValor(True);
              end;
            end
            else begin
              EdtVlrDevolverDtAtual.Value := 0;
              habilitarGrupoValor(False);
            end;
          end
          else begin
            EdtVlrDevolverDtAtual.Value := 0;
            habilitarGrupoValor(False);
          end;
        finally
          qry.Close;
          FreeAndNil(qry);
        end;
      end;
    end
    else begin
      EdtVlrDevolverDtAtual.Value := 0;
      habilitarGrupoValor(False);
    end;
  end;
end;

procedure TfrmCadRegTrein.ProporcionalizacaoValores;
var
  PartEmpregado, PartEmpresa : SmallInt;
begin
  if dbrgControle.ItemIndex = 0 then begin
    // Sim
    lblPartEmpresa.Visible      := True;
    EdtvlrPartEmpresa.Visible   := True;

    EdtVlrPartEmpregado.Visible := False;
    lblPartEmpregado.Visible    := False;

    EdtvlrPartEmpresa.Enabled   := False;
    EdtVlrPartEmpregado.Enabled := False;

    PartEmpresa   := 100;
    PartEmpregado := 0;


    if ((CdsDet.State = dsInsert) and (CdsMensalidades.IsEmpty)) then begin
      // No caso de inclusões, o "por conta da empresa" deve vir preenchido como 100% - (parte empresa)
      cdsDet.FieldByName('FLGCONTROLE').AsInteger := 0;

      ModoEdicao := True;
      EdtvlrPartEmpresa.Text   := IntToStr(PartEmpresa);
      EdtvlrPartEmpregado.Text := IntToStr(PartEmpregado);
    end
    else begin
      EdtvlrPartEmpresa.Text   := IntToStr(PartEmpresa);
      EdtvlrPartEmpregado.Text := IntToStr(PartEmpregado);

      EdtvlrPartEmpresaChange(Self);
    end;

    if CdsMensalidades.IsEmpty then begin
      Exit;
    end;
  end
  else begin
    // Não
    if dbrgControle.ItemIndex = 1 then begin
      lblPartEmpresa.Visible      := False;
      EdtvlrPartEmpresa.Visible   := False;

      EdtVlrPartEmpregado.Visible := True;
      lblPartEmpregado.Visible    := True;

      EdtvlrPartEmpresa.Enabled   := False;
      EdtVlrPartEmpregado.Enabled := False;

      PartEmpresa   := 0;
      PartEmpregado := 100;

      EdtvlrPartEmpregado.Text := IntToStr(PartEmpregado);
      EdtvlrPartEmpresa.Text   := IntToStr(PartEmpresa);

      EdtvlrPartEmpregadoChange(Self);

      if CdsMensalidades.IsEmpty then begin
        Exit;
      end;
    end
    else begin
      // Parcialmente
      lblPartEmpresa.Visible      := True;
      EdtvlrPartEmpresa.Visible   := True;

      EdtVlrPartEmpregado.Visible := True;
      lblPartEmpregado.Visible    := True;

      EdtvlrPartEmpresa.Enabled   := True;
      EdtVlrPartEmpregado.Enabled := True;

      Exit;

      if CdsMensalidades.IsEmpty then begin
        Exit;
      end;
    end;
  end;
end;

procedure TfrmCadRegTrein.EdtvlrPartEmpresaChange(Sender: TObject);
var
  Valor : Variant;
begin
  inherited;
  // Thiago Melo SOL 203837 Kintana 1969599
  if (not ModoEdicao) and (EdtVlrPartEmpresa.Text <> '') then begin
    if (EdtVlrMensalidade.Value > 0) then begin
  // Thiago Melo SOL 203837 Kintana 1969599
      try
        StrToInt(EdtVlrPartEmpresa.Text);
      except
        Valor := CdsDet.FieldByName('partempresa').OldValue;
        EdtVlrPartEmpresa.Text := Valor;
        Exit;
      end;

      ProporcionalizacaoValores_Parcialmente ( StrToIntDef(EdtVlrPartEmpresa.Text,0), (100 - StrToIntDef(EdtVlrPartEmpresa.Text,0)), CdsMensalidades);
      EdtvlrPartEmpresa.SelStart := Length(EdtvlrPartEmpresa.Text);

      if EdtVlrPartEmpresa.Focused then begin
        ModoEdicao := False;

        EdtValorEmpresa.Value   := RetornaValorTotalEmpresa(CdsMensalidades);
        EdtVlrCurso.Value       := RetornaValorTotalMensalidade(CdsMensalidadesAux);
        EdtValorEmpregado.Value := RetornaValorTotalEmpregado(CdsMensalidades);
        RetornaValorDevolverDtAtual;
      end;
    // Thiago Melo SOL 203837 Kintana 1969599 Ini
    end else begin
      proporcionalizaEmp(StrToIntDef(EdtVlrPartEmpresa.Text,0), (100 - StrToIntDef(EdtVlrPartEmpresa.Text,0)));
    end;
    // Thiago Melo SOL 203837 Kintana 1969599
  end;
end;

procedure TfrmCadRegTrein.EdtVlrPartEmpregadoChange(Sender: TObject);
var
  Valor : Variant;
begin
  inherited;
  // Thiago Melo SOL 203837 Kintana 1969599 Ini
  if (not ModoEdicao) and (EdtVlrPartEmpregado.Text <> '') then begin
    if (EdtVlrMensalidade.Value > 0) then begin
  // Thiago Melo SOL 203837 Kintana 1969599
      try
        StrToInt(EdtVlrPartEmpregado.Text);
      except
        Valor := CdsDet.FieldByName('partempregado').OldValue;
        EdtVlrPartEmpregado.Text := Valor;
        Exit;
      end;

      ProporcionalizacaoValores_Parcialmente ( (100 - StrToIntDef(EdtVlrPartEmpregado.Text,0)),  StrToIntDef(EdtVlrPartEmpregado.Text,0), CdsMensalidades);
      EdtVlrPartEmpregado.SelStart := Length(EdtVlrPartEmpregado.Text);

      if EdtVlrPartEmpregado.Focused then begin
        ModoEdicao := False;

        EdtValorEmpresa.Value   := RetornaValorTotalEmpresa(CdsMensalidades);
        EdtVlrCurso.Value       := RetornaValorTotalMensalidade(CdsMensalidadesAux);
        EdtValorEmpregado.Value := RetornaValorTotalEmpregado(CdsMensalidades);
        RetornaValorDevolverDtAtual;
      end;
    // Thiago Melo SOL 203837 Kintana 1969599 Ini
    end else begin
      proporcionalizaEmp((100 - StrToIntDef(EdtVlrPartEmpregado.Text,0)),  StrToIntDef(EdtVlrPartEmpregado.Text,0));
    end;
    // Thiago Melo SOL 203837 Kintana 1969599 
  end
end;

procedure TfrmCadRegTrein.ProporcionalizacaoValores_Parcialmente(PartEmpresa, PartEmpregado : SmallInt; Cds : TCmClientDataSet);
var
  ValorEmpresa, ValorEmpregado : Double;

  vlrMensalidade : Double;
  DtVencimento   : TDateTime;
begin
  ModoEdicao := True;
  vlrMensalidade := 0;

  if Cds.RecordCount = 0 then begin
    if (not Cds.FieldByName('VALORMENSALIDADE').IsNull) then begin
      vlrMensalidade := Cds.FieldByName('VALORMENSALIDADE').AsFloat;
    end;

    if (not Cds.FieldByName('DTVENCIMENTOPARC').IsNull) then begin
      DtVencimento   := Cds.FieldByName('DTVENCIMENTOPARC').AsDateTime;
    end;

    Cds.Insert;
    ValorEmpresa   := (vlrMensalidade * PartEmpresa / 100);
    ValorEmpregado := (vlrMensalidade * PartEmpregado / 100);

    Cds.FieldByName('IDPESSOA').AsFloat        := idPessoa;
    Cds.FieldByName('IDCURSO').AsFloat         := CdsDet.FieldByName('idcurso').asFloat;
    Cds.FieldByName('NUMSEQ').AsFloat          := CdsDet.FieldByName('numseq').asFloat;

    Cds.FieldByName('VALOREMPRESA').AsFloat    := ValorEmpresa;
    Cds.FieldByName('VALOREMPREGADO').AsFloat  := ValorEmpregado;

    if vlrMensalidade > 0 then begin
      Cds.FieldByName('VALORMENSALIDADE').AsFloat := vlrMensalidade;
    end;

    if DtVencimento > 0 then begin
      Cds.FieldByName('DTVENCIMENTOPARC').AsDateTime := DtVencimento;
    end;

    Cds.Post;
  end
  else begin
    Cds.First;

    while not Cds.Eof do begin
      try
        Cds.Edit;
        ValorEmpresa   := (Cds.FieldByName('VALORMENSALIDADE').AsFloat * PartEmpresa / 100);
        ValorEmpregado := (Cds.FieldByName('VALORMENSALIDADE').AsFloat * PartEmpregado / 100);

        Cds.FieldByName('IDPESSOA').AsFloat        := idPessoa;
        Cds.FieldByName('IDCURSO').AsFloat         := CdsDet.FieldByName('idcurso').asFloat;
        Cds.FieldByName('NUMSEQ').AsFloat          := CdsDet.FieldByName('numseq').asFloat;

        Cds.FieldByName('VALOREMPRESA').AsFloat   := ValorEmpresa;
        Cds.FieldByName('VALOREMPREGADO').AsFloat := ValorEmpregado;

        Cds.Post;
      except
        MsgDlg('Ocorreram erros no processo de proporcionalização de valores', 'Informação', mtError, [mbOk], 0);
      end;
      Cds.Next;
    end;
  end;

  if CdsDet.State in [dsInsert, dsEdit] then begin
    CdsDet.FieldByName('PARTEMPRESA').AsInteger   := PartEmpresa;
    CdsDet.FieldByName('PARTEMPREGADO').AsInteger := PartEmpregado;
  end
  else begin
    CdsDet.Edit;
    CdsDet.FieldByName('PARTEMPRESA').AsInteger   := PartEmpresa;
    CdsDet.FieldByName('PARTEMPREGADO').AsInteger := PartEmpregado;
    CdsDet.Post;
  end;

  CdsMensalidades.Data    := Cds.Data;
  if not CdsMensalidadesAux.IsEmpty then begin
    CdsMensalidadesAux.Data := CdsMensalidades.Data;
  end;
  CdsMensalidades.Edit;
end;

procedure TfrmCadRegTrein.btnDespOkClick(Sender: TObject);
begin
  inherited;
  if dbrgControle.ItemIndex = -1 then begin
    Exit;
  end;
  
  if not VerificaPreenchimentoObrigatorio_Despesas then begin
    Exit;
  end
  else begin
    InsereAux (EdtDtVencimento.DateTime, EdtVlrMensalidade.Value);
    EdtValorEmpresa.Value   := RetornaValorTotalEmpresa(CdsMensalidades);
    EdtVlrCurso.Value       := RetornaValorTotalMensalidade(CdsMensalidadesAux);
    EdtValorEmpregado.Value := RetornaValorTotalEmpregado(CdsMensalidades);
    RetornaValorDevolverDtAtual;
  end;

  EdtVlrMensalidade.SetFocus;
end;

procedure TfrmCadRegTrein.btnDespCancelClick(Sender: TObject);
var
  x : Integer;
begin
  inherited;
  if not CdsMensalidadesAux.IsEmpty then begin
    if (MsgDlg('Deseja excluir mensalidade (Parcela Nº ' + CdsMensalidadesAux.FieldByName('nparcela').AsString + ') ?' ,
        'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin

      CdsMensalidades.Delete;
      CdsMensalidades.First;

      x := 0;

      while not CdsMensalidades.Eof do begin
        Inc(x);

        CdsMensalidades.Edit;
        CdsMensalidades.FieldByName('NPARCELA').AsInteger := x;
        CdsMensalidades.Post;

        CdsMensalidades.Next;
      end;

      CdsMensalidadesAux.Data := CdsMensalidades.Data;
      ReorganizaQtd;
      EdtVlrCurso.Value       := RetornaValorTotalMensalidade(CdsMensalidadesAux);
      EdtValorEmpregado.Value := RetornaValorTotalEmpregado(CdsMensalidades);
      EdtValorEmpresa.Value   := RetornaValorTotalEmpresa(CdsMensalidadesAux);
      RetornaValorDevolverDtAtual;
    end;
  end;
end;

procedure TfrmCadRegTrein.InsereAux (DtVencimento : TDateTime; ValorMensalidade : Double);
begin
  try
    // Inserindo no arquivo auxiliar (Grid)
    CdsMensalidadesAux.Insert;
    CdsMensalidadesAux.FieldByName('IDPESSOA').AsFloat              := idPessoa;
    CdsMensalidadesAux.FieldByName('IDCURSO').AsFloat               := CdsDet.FieldByName('idcurso').asFloat;
    CdsMensalidadesAux.FieldByName('QTDPARCPREV').AsInteger         := CdsMensalidades.FieldByName('QTDPARCPREV').AsInteger;
    if (CdsMensalidades.IsEmpty) and (CdsDet.FieldByName('NUMSEQ').AsInteger > 0) then begin
    
      CdsMensalidadesAux.FieldByName('NUMSEQ').AsInteger            := CdsDet.FieldByName('NUMSEQ').AsInteger;
      CdsMensalidadesAux.FieldByName('DTVENCIMENTOPARC').AsDateTime := DtVencimento;
      CdsMensalidadesAux.FieldByName('VALORMENSALIDADE').AsFloat    := ValorMensalidade;

      if (CdsDet.FieldByName('PARTEMPRESA').AsInteger > 0) and ((CdsMensalidades.FieldByName('VALOREMPRESA').AsFloat = 0) or (CdsMensalidades.FieldByName('VALOREMPRESA').IsNull)) then begin
        CdsMensalidadesAux.FieldByName('VALOREMPRESA').AsFloat      := (ValorMensalidade * CdsDet.FieldByName('PARTEMPRESA').AsInteger / 100);
      end
      else begin
        CdsMensalidadesAux.FieldByName('VALOREMPRESA').AsFloat      := CdsMensalidades.FieldByName('VALOREMPRESA').AsFloat;
      end;

      if (CdsDet.FieldByName('PARTEMPREGADO').AsInteger > 0) and ((CdsMensalidades.FieldByName('VALOREMPREGADO').AsFloat = 0) or (CdsMensalidades.FieldByName('VALOREMPREGADO').IsNull)) then begin
        CdsMensalidadesAux.FieldByName('VALOREMPREGADO').AsFloat    := (ValorMensalidade * CdsDet.FieldByName('PARTEMPREGADO').AsInteger / 100);
      end
      else begin
        CdsMensalidadesAux.FieldByName('VALOREMPREGADO').AsFloat    := CdsMensalidades.FieldByName('VALOREMPREGADO').AsFloat;
      end;
    end
    else begin
      CdsMensalidadesAux.FieldByName('NUMSEQ').AsInteger            := CdsMensalidades.FieldByName('NUMSEQ').AsInteger;
      CdsMensalidadesAux.FieldByName('DTVENCIMENTOPARC').AsDateTime := DtVencimento;
      CdsMensalidadesAux.FieldByName('VALORMENSALIDADE').AsFloat    := ValorMensalidade;

      if (CdsDet.FieldByName('PARTEMPRESA').AsInteger > 0) and ((CdsMensalidades.FieldByName('VALOREMPRESA').AsFloat = 0) or (CdsMensalidades.FieldByName('VALOREMPRESA').IsNull)) then begin
        CdsMensalidadesAux.FieldByName('VALOREMPRESA').AsFloat      := (ValorMensalidade * CdsDet.FieldByName('PARTEMPRESA').AsInteger / 100);
      end
      else begin
        // Verificando se não houve calculo
        if ((CdsDet.FieldByName('PARTEMPRESA').IsNull) or (CdsDet.FieldByName('PARTEMPRESA').AsInteger <= 0)) and (StrToIntDef(EdtvlrPartEmpresa.Text,0) > 0) then begin
          CdsMensalidadesAux.FieldByName('VALOREMPRESA').AsFloat    := (ValorMensalidade * StrToInt(EdtvlrPartEmpresa.Text) / 100);
        end
        else begin
          CdsMensalidadesAux.FieldByName('VALOREMPRESA').AsFloat    := CdsMensalidades.FieldByName('VALOREMPRESA').AsFloat;
        end;
      end;

      if (CdsDet.FieldByName('PARTEMPREGADO').AsInteger > 0) and ((CdsMensalidades.FieldByName('VALOREMPREGADO').AsFloat = 0) or (CdsMensalidades.FieldByName('VALOREMPREGADO').IsNull)) then begin
        CdsMensalidadesAux.FieldByName('VALOREMPREGADO').AsFloat    := (ValorMensalidade * CdsDet.FieldByName('PARTEMPREGADO').AsInteger / 100);
      end
      else begin
        // Verificando se não houve calculo
        if ((CdsDet.FieldByName('PARTEMPREGADO').IsNull) or (CdsDet.FieldByName('PARTEMPREGADO').AsInteger <= 0)) and (StrToIntDef(EdtVlrPartEmpregado.Text,0) > 0) then begin
          CdsMensalidadesAux.FieldByName('VALOREMPREGADO').AsFloat  := (ValorMensalidade * StrToInt(EdtVlrPartEmpregado.Text) / 100);
        end
        else begin
          CdsMensalidadesAux.FieldByName('VALOREMPREGADO').AsFloat  := CdsMensalidades.FieldByName('VALOREMPREGADO').AsFloat;
        end;
      end;
    end;
    CdsMensalidadesAux.FieldByName('NPARCELA').AsInteger            := CdsMensalidades.FieldByName('NPARCELA').AsInteger;

    CdsMensalidadesAux.Post;
    CdsMensalidades.Data := CdsMensalidadesAux.Data;
  except
    MsgDlg('Não foi possível realizar inclusão', 'Inclusão', mtError, [mbok], 0);
    Exit;
  end;

  try
    ReorganizaNParcela;
  except
    MsgDlg('Não foi possível organizar número de parcelas', 'Inclusão', mtError, [mbok], 0);
    Exit;
  end;
end;

procedure TfrmCadRegTrein.ReorganizaNParcela;
var
  Incrementa : Integer;
begin
  if not CdsMensalidades.IsEmpty then begin
    if CdsMensalidades.State in [dsInsert, dsEdit] then begin
      CdsMensalidades.Post;
    end;

    ModoEdicao := True;
    CdsMensalidades.Filtered := False;
    CdsMensalidades.Filter   := 'IDCURSO = ' + FloatToStr(CdsDet.FieldByName('IDCURSO').asFloat) + ' AND NUMSEQ = ' + FloatToStr(CdsDet.FieldByName('NUMSEQ').asFloat);
    CdsMensalidades.IndexFieldNames := 'DTVENCIMENTOPARC';
    CdsMensalidades.Filtered := True;
    ModoEdicao := False;

    CdsMensalidades.First;
    Incrementa := 0;

    while not CdsMensalidades.Eof do begin
      Inc(Incrementa);

      CdsMensalidades.Edit;
      CdsMensalidades.FieldByName('NPARCELA').AsInteger   := Incrementa;
      CdsMensalidades.Post;

      CdsMensalidades.Next;
    end;

    if CdsDet.State in [DsInsert, dsEdit] then begin
      CdsDet.FieldByName('QTDPARCELA').AsInteger := CdsMensalidades.RecordCount;
    end
    else begin
      CdsDet.Edit;
      CdsDet.FieldByName('QTDPARCELA').AsInteger := CdsMensalidades.RecordCount;
      CdsDet.Post;
    end;

    CdsMensalidadesAux.Data := CdsMensalidades.Data;
  end;
end;

procedure TfrmCadRegTrein.EdtvlrPartEmpresaExit(Sender: TObject);
begin
  inherited;
  if (not CdsDet.FieldByName('partempresa').IsNull) then begin
    if (StrToInt(EdtvlrPartEmpresa.Text) < 0) or (StrToInt(EdtvlrPartEmpresa.Text) > 100) then begin
      MsgDlg('Favor preencher um valor entre 0 e 100', 'Informação', mtError, [mbok], 0);
      EdtvlrPartEmpresa.Text := IntToStr(UltVlrValidoEmpresa);

      EdtValorEmpregado.Value := RetornaValorTotalEmpregado(CdsMensalidades);
      EdtValorEmpresa.Value   := RetornaValorTotalEmpresa(CdsMensalidadesAux);

      ModoEdicao := False;
    end;
  end;
end;

procedure TfrmCadRegTrein.EdtVlrPartEmpregadoExit(Sender: TObject);
begin
  inherited;
  if (not CdsDet.FieldByName('partempregado').IsNull) then begin
    if (StrToInt(EdtVlrPartEmpregado.Text) < 0) or (StrToInt(EdtVlrPartEmpregado.Text) > 100) then begin
      MsgDlg('Favor preencher um valor entre 0 e 100', 'Informação', mtError, [mbok], 0);

      EdtvlrPartEmpregado.Text := IntToStr(UltVlrValidoEmpregado);

      EdtValorEmpregado.Value := RetornaValorTotalEmpregado(CdsMensalidades);
      EdtValorEmpresa.Value   := RetornaValorTotalEmpresa(CdsMensalidadesAux);
      
      ModoEdicao := False;
    end;
  end;
end;

procedure TfrmCadRegTrein.EdtvlrPartEmpresaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not ModoEdicao then begin
     try
      StrToInt(EdtVlrPartEmpresa.Text);
    except
      Exit;
    end;

    if (StrToInt(EdtVlrPartEmpresa.Text) > -1) and (StrToInt(EdtVlrPartEmpresa.Text) < 101) then begin
      UltVlrValidoEmpresa := StrToInt(EdtVlrPartEmpresa.Text);
    end;
  end;
end;

procedure TfrmCadRegTrein.EdtVlrPartEmpregadoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not ModoEdicao then begin
    try
      StrToInt(EdtVlrPartEmpregado.Text);
    except
      Exit;
    end;

    if (StrToInt(EdtVlrPartEmpregado.Text) > -1) and (StrToInt(EdtVlrPartEmpregado.Text) < 101) then begin
      UltVlrValidoEmpregado := StrToInt(EdtVlrPartEmpregado.Text);
    end;
  end;
end;

procedure TfrmCadRegTrein.btnAtualizarMetaClick(Sender: TObject);
var
  tela : TfrmRegTreinMetaAtuarial;
begin
  if (not CdsMensalidades.FieldByName('VALOREMPRESA_AT').IsNull) then begin
    if (MsgDlg('Já existe existe atualização do Valor a Devolver na Data Atual.' + CR_LF +
               'Deseja recalcular ?', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes) then
    begin
      Exit;
    end;
  end;

  tela := TfrmRegTreinMetaAtuarial.Create(Self);

  try
    tela.ShowModal;
    if tela.Result = MB_OK then begin
      CalcMetaAtuarial(tela.MAtuarial);
    end;
  finally
    tela.Release;
  end;
end;

function TfrmCadRegTrein.CalcMetaAtuarial (FatorMetaAtuarial : Double) : Boolean;
var
  ValorEmpresaAT,
  CalcINPC, INPC, FatorINPC,
  Juros, JurosComposto, DiasDoAnoCorrente,
  DiasAnoAnteriores, resultCalcAnos : Double;

  CotacaoINPC : array of Double;

  DiasAnoCorrente, QtdTotalDiasAnoCorrente,
  QtdeTotalDeDiasDosAnosAnteriores, DiasDoAnoAnterior,
  Periodo, x, i, y, t: Integer;

  dtFinalINPC : TDateTime;

  wAnoF, wMesF, wDiaF,
  AnoVcto, MesVcto, DiaVcto :Word;

  qryCotacao : TwwQuery;
  BookMark : TBookmark;

  Function DecMeses (Dia, AnoMes : String; QtdeMes : Integer) : TDateTime;
  var
    Mes, Ano, x : Integer;
    DtResult : String;
    DtTratada : TDate;
  begin
    AnoMes := FormatDateTime('yyyy/mm',StrToDate(AnoMes));

    Ano := StrToInt(Copy(AnoMes,1,4));
    Mes := StrToInt(Copy(AnoMes,6,2));

    for x := 1 to QtdeMes do begin
      if Mes = 1 then begin
        Mes := 12;
        Dec(Ano);
      end
      else begin
        Dec(Mes);
      end;  
    end;
    if (Mes = 2) or (StrToInt(Dia) > 30) then begin
      DtTratada := DiasUteis.UltDiaMes(Ano, Mes);
      Result := DtTratada;
      Exit;
    end;
    DtResult := Dia + '/' + StrZero(IntToStr(Mes), 2) + '/' + IntToStr(Ano);
    Result := StrToDate(DtResult);
  end;

begin
  DecodeDate(Date,wAnoF,wMesF,wDiaF);
  BookMark := CdsMensalidadesAux.GetBookMark;
  CdsMensalidades.First;

  while not CdsMensalidades.Eof do begin
    ValorEmpresaAT := 0;
    CalcINPC := 0;
    INPC := 0;
    FatorINPC := 0;
    Juros := 0;
    JurosComposto := 0;
    DiasDoAnoCorrente := 0;
    DiasAnoAnteriores := 0;
    resultCalcAnos := 0;

    CotacaoINPC := nil;

    DiasAnoCorrente := 0;
    QtdTotalDiasAnoCorrente := 0;
    QtdeTotalDeDiasDosAnosAnteriores := 0;
    DiasDoAnoAnterior := 0;
    Periodo := 0;
    x := 0;
    i := 0;
    y := 0;
    t := 0;

    CotacaoINPC := Nil;
    DecodeDate(CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime ,AnoVcto, MesVcto, DiaVcto);

    if CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime > Date then begin
      Periodo := DiasUteis.IntervaloMeses(Date, CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime);

      if Periodo > 0 then begin

        dtFinalINPC := DecMeses(Copy(CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsString,1,2), CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsString, 1);
        if dtFinalINPC > CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime then begin
          Periodo := DiasUteis.IntervaloMeses(CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime, dtFinalINPC);
        end
        else begin
          Periodo := DiasUteis.IntervaloMeses(dtFinalINPC, CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime);
        end;

        if Periodo > 0 then begin
          qryCotacao := TwwQuery.Create(Self);
          qryCotacao.DataBaseName := 'BaseDados';

          try
            with qryCotacao do begin
              Close;
              Sql.Clear;
              Sql.Add('SELECT cotvalor ');
              Sql.Add('  FROM cotacaomoeda');
              Sql.Add(' WHERE moecodigo = 7');
              Sql.Add('   AND cotdata >= TO_DATE(' + Chr(39) + '01/' + FormatDateTime('mm/yyyy',Date) + Chr(39) + ', ' + Chr(39) + 'dd/mm/yyyy' + Chr(39) + ')');
              Sql.Add('   AND cotdata <= TO_DATE(' + Chr(39) + '01/' + FormatDateTime('mm/yyyy',CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime) + Chr(39) + ', ' + Chr(39) + 'dd/mm/yyyy' + Chr(39) + ')');
              Open;
            end;

            if not qryCotacao.IsEmpty then begin
              x := 0;

              y := qryCotacao.RecordCount;
              SetLength(CotacaoINPC, y+1);

              while not qryCotacao.Eof do begin
                CotacaoINPC[x] := qryCotacao.FieldByName('cotvalor').AsFloat;

                Inc(x);
                qryCotacao.Next;
              end;
            end;
          finally
            qryCotacao.Close;
            FreeAndNil(qryCotacao);
          end;
        end;
      end;
    end
    else begin
      // Data do Dia maior que a data do vencimento da parcela ?
      Periodo := DiasUteis.IntervaloMeses(CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime, Date);

      if Periodo > 0 then begin

        // Retirando um mes da data atual (é necessário desconsiderar o mês atual)
        dtFinalINPC := DecMeses(StrZero(IntToStr(wDiaF), 2), DateToStr(Date), 1);

        // Verificando se a nova data (depois de retirado um mês) é maior que a data do vencimento da parcela
        if dtFinalINPC > CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime then begin
          Periodo := DiasUteis.IntervaloMeses(CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime, dtFinalINPC);
        end
        else begin
          Periodo := DiasUteis.IntervaloMeses(dtFinalINPC, CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime);
        end;

        if Periodo > 0 then begin

          qryCotacao := TwwQuery.Create(Self);
          qryCotacao.DataBaseName := 'BaseDados';

          try
            with qryCotacao do begin
              Close;
              Sql.Clear;
              Sql.Add('SELECT cotvalor ');
              Sql.Add('  FROM cotacaomoeda');
              Sql.Add(' WHERE moecodigo = 7');
              Sql.Add('   AND cotdata >= TO_DATE(' + Chr(39) + '01/' + FormatDateTime('mm/yyyy',CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime) + Chr(39) + ', ' + Chr(39) + 'dd/mm/yyyy' + Chr(39) + ')');
              Sql.Add('   AND cotdata <= TO_DATE(' + Chr(39) + '01/' + FormatDateTime('mm/yyyy',dtFinalINPC) + Chr(39) + ', ' + Chr(39) + 'dd/mm/yyyy' + Chr(39) + ')');
              Open;
            end;

            if not qryCotacao.IsEmpty then begin
              x := 0;

              y := qryCotacao.RecordCount;
              SetLength(CotacaoINPC, y+1);

              while not qryCotacao.Eof do begin
                CotacaoINPC[x] := qryCotacao.FieldByName('cotvalor').AsFloat;

                Inc(x);
                qryCotacao.Next;
              end;
            end;
          finally
            qryCotacao.Close;
            FreeAndNil(qryCotacao);
          end;
        end;
      end;
    end;

    try
      // Realizando calculo
      
{      // MetaAtuarial (Calc)
      MetaAtuarial := (1 + (FatorMetaAtuarial/100));
      MetaAtuarial := Sqr(MetaAtuarial);
      MetaAtuarial := StrToFloat(FormatFloat('#,##0.0000', MetaAtuarial));    }

      // INPC (Calc)
      for i := Low(CotacaoINPC) to High(CotacaoINPC) do begin
        CalcINPC := StrToFloat(FormatFloat('#,##0.0000', CotacaoINPC[i]));
        INPC := INPC + (CalcINPC / 100);
      end;
      INPC := (1 + (INPC));
      FatorINPC := CdsMensalidades.FieldByName('valorempresa').AsFloat * INPC;

      //Juros (Calc)
      DiasAnoCorrente := DiasUteis.IntervaloDias(StrToDate('01/01/' + IntToStr(wAnoF)), Date);
      if DiasUteis.AnoBissexto(wAnoF) then begin
        QtdTotalDiasAnoCorrente := 366;
      end
      else begin
        QtdTotalDiasAnoCorrente := 365;
      end;

      DiasDoAnoCorrente := DiasAnoCorrente / QtdTotalDiasAnoCorrente;
      DiasDoAnoCorrente := CtrlFuncoesRH.Truncar(DiasDoAnoCorrente, 4);

//      for t := AnoVcto to wAnoF do begin
        if CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime > StrToDate('01/01/' + IntToStr(wAnoF)) then begin
          DiasDoAnoAnterior := DiasUteis.IntervaloDias(StrToDate('01/01/' + IntToStr(wAnoF)), CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime);
        end
        else begin
          DiasDoAnoAnterior := DiasUteis.IntervaloDias(CdsMensalidades.FieldByName('DTVENCIMENTOPARC').AsDateTime, StrToDate('01/01/' + IntToStr(wAnoF)));
        end;

//        if DiasUteis.AnoBissexto(t) then begin
        if DiasUteis.AnoBissexto(AnoVcto) then begin
          QtdeTotalDeDiasDosAnosAnteriores := 366;
        end
        else begin
          QtdeTotalDeDiasDosAnosAnteriores := 365;
        end;
        DiasAnoAnteriores := DiasAnoAnteriores + (DiasDoAnoAnterior / QtdeTotalDeDiasDosAnosAnteriores);
        DiasAnoAnteriores := CtrlFuncoesRH.Truncar(DiasAnoAnteriores, 4);
//      end;
      resultCalcAnos := DiasDoAnoCorrente + DiasAnoAnteriores;

      JurosComposto := (1+ FatorMetaAtuarial/100);
      JurosComposto := Power(JurosComposto, resultCalcAnos) - 1;
      JurosComposto := CtrlFuncoesRH.Truncar(JurosComposto, 4);

      Juros := FatorINPC * JurosComposto;
      Juros := CtrlFuncoesRH.Truncar(Juros, 4);

      // Valor Empresa Atualizado
      ValorEmpresaAT := FatorINPC + Juros;
    except
      Result := False;
      Exit;
    end;

    try
      if not (CdsMensalidades.State in [DsEdit, DsInsert]) then begin
        CdsMensalidades.Edit;
      end;
      CdsMensalidades.FieldByName('VALOREMPRESA_AT').AsFloat := StrToFloat(FormatFloat('#########0.00', ValorEmpresaAT));
      CdsMensalidades.FieldByName('DTATUALIZACAO').AsString  := DateToStr(Date);
      CdsMensalidades.FieldByName('METAATUARIAL').AsFloat    := FatorMetaAtuarial;
      CdsMensalidades.Post;
    except
      Result := False;
      Exit;
    end;
    CdsMensalidades.Next;
  end;
  CdsMensalidadesAux.Data := CdsMensalidades.Data;

  CdsMensalidadesAux.GotoBookMark(BookMark);
  CdsMensalidadesAux.FreeBookMark(BookMark);

  EdtValorEmpresa.Value   := RetornaValorTotalEmpresa(CdsMensalidades);
  RetornaValorDevolverDtAtual;
  Result := True;
end;

procedure TfrmCadRegTrein.CarregaProjFinal;
var
  qry : TwwQuery;
begin
  qry := TwwQuery.Create(Self);
  qry.DataBaseName := 'BaseDados';

  try
    qry.Close;
    qry.Sql.Clear;
    qry.Sql.Add('SELECT S.flgprojfinal');
    qry.Sql.Add( 'FROM CURSO C, SIGLACURSO S ');
    qry.Sql.Add('WHERE C.IDSIGLACURSO = S.IDSIGLACURSO ');
    qry.Sql.Add('  AND C.IDCURSO = ' + FloatToStr(CdsDet.FieldByName('IDCURSO').AsFloat));
    qry.Open;

    if not qry.IsEmpty then begin
      if qry.FieldByName('flgprojfinal').AsInteger = 1 then begin
        CkbProjetoEntregue.Visible := True;
        CkbProjetoEntregue.Checked := True;
      end
      else begin
        CkbProjetoEntregue.Visible := False;
        CkbProjetoEntregue.Checked := False;
      end;
    end
    else begin
      CkbProjetoEntregue.Visible := False;
      CkbProjetoEntregue.Checked := False;
    end;
  finally
    qry.Close;
    FreeAndNil(qry);
  end;
end;

Function TfrmCadRegTrein.TotalizaHorasHSTTRN (xIdPessoa, xIdCurso, xNumSeq : Double): Double;
var
  qry : TwwQuery;
begin
  qry := TwwQuery.Create(Self);
  qry.DataBaseName := 'BaseDados';

  try
    qry.Close;
    qry.Sql.Clear;
    qry.Sql.Add('SELECT DUR_TOT AS TOTCURSO');
    qry.Sql.Add('  FROM HSTTRN');
    qry.Sql.Add(' WHERE IDPESSOA = ' + FloatToStr(xIdPessoa));
    qry.Sql.Add('   AND IDCURSO  = ' + FloatToStr(CdsDet.FieldByName('IDCURSO').asFloat));
    qry.Sql.Add('   AND NUMSEQ   = ' + FloatToStr(CdsDet.FieldByName('NUMSEQ').asFloat));    
    qry.Open;

    if not qry.IsEmpty then begin
      Result := qry.FieldByName('TOTCURSO').AsFloat;
    end
    else begin
      Result := 0;
    end;
  finally
    qry.Close;
    FreeAndNil(qry);
  end;
end;

procedure TfrmCadRegTrein.dbrgControleClick(Sender: TObject);
begin
  inherited;
  ModoEdicao := False;

  ProporcionalizacaoValores;
  if not CdsMensalidadesAux.IsEmpty then begin
    EdtValorEmpregado.Value := RetornaValorTotalEmpregado(CdsMensalidades);
    EdtValorEmpresa.Value   := RetornaValorTotalEmpresa(CdsMensalidadesAux);
  end;
end;

procedure TfrmCadRegTrein.ReorganizaNumSeq;
begin
  if not CdsMensalidades.IsEmpty then begin
    if CdsMensalidades.State in [dsInsert, dsEdit] then begin
      CdsMensalidades.Post;
    end;

    ModoEdicao := True;
    CdsMensalidades.First;
    ModoEdicao := False;

    while not CdsMensalidades.Eof do begin
      CdsMensalidades.Edit;
      CdsMensalidades.FieldByName('NUMSEQ').AsFloat := CdsDet.FieldByName('NUMSEQ').AsFloat;
      CdsMensalidades.Post;
    end;

    ModoEdicao := True;
    CdsMensalidades.Filtered := False;
    ModoEdicao := False;
  end;

  CdsMensalidadesAux.Data := CdsMensalidades.Data;

end;

procedure TfrmCadRegTrein.CkbProjetoEntregueClick(Sender: TObject);
begin
  inherited;
  if CkbProjetoEntregue.Checked then begin
    EdtDataEntrega.Visible     := True;
    lblDataEntrega.Visible     := True;
    RetornaValorDevolverDtAtual;
    CalcFimDaFidelidade;
  end
  else begin
    EdtDataEntrega.Visible     := False;
    lblDataEntrega.Visible     := False;
    RetornaValorDevolverDtAtual;
    CalcFimDaFidelidade;
  end;
end;

procedure TfrmCadRegTrein.EdtDataEntregaExit(Sender: TObject);
begin
  inherited;
  CalcFimDaFidelidade;
  RetornaValorDevolverDtAtual;
  if CdsDet.State in [DsInsert, DsEdit] then begin
    if CdsMensalidades.FieldByName('METAATUARIAL').AsFloat > 0 then begin
      CalcMetaAtuarial (CdsMensalidades.FieldByName('METAATUARIAL').AsFloat);
    end;
  end;
end;

// Thiago Melo SOL 203837 Kintana 1969599 Ini
procedure TfrmCadRegTrein.proporcionalizaEmp(PartEmpresa,
  PartEmpregado: SmallInt);
begin
  if CdsDet.State in [dsInsert, dsEdit] then begin
    CdsDet.FieldByName('PARTEMPRESA').AsInteger   := PartEmpresa;
    CdsDet.FieldByName('PARTEMPREGADO').AsInteger := PartEmpregado;
  end
  else begin
    CdsDet.Edit;
    CdsDet.FieldByName('PARTEMPRESA').AsInteger   := PartEmpresa;
    CdsDet.FieldByName('PARTEMPREGADO').AsInteger := PartEmpregado;
    CdsDet.Post;
  end;
end;
// Thiago Melo SOL 203837 Kintana 1969599 Fim

end.
