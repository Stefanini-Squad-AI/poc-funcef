//******************************************************************************
// Data      : 24/01/2008
// Código    : AL_18
// Pendencia : 27296
// SOL       :
// Desc      : Acerto na qryGestorCart e QryCustodiante para trazer o CNPJ
//             pela Regra -1 (CNPJ) da TIPODOCPESSOA 
//******************************************************************************
// Autor     : Ricardo Cristiano
// Data      : 05/12/2007
// Código    : AL_17
// Pendencia : 27016
// SOL       :
// Desc      : Implementação do parâmetro de integração contábil e financeira
//             por fundo
//******************************************************************************
// Data      : 12/09/2007
// Código    : AL_16
// Pendencia : 26346
// SOL       : 68919
// Motivo    : Acerto na qryAdmFdoInvest para trazer o CNPJ pela Regra -1 (CGC)
//******************************************************************************
// Data      : 09/08/2007
// Código    : AL_15
// Pendencia :
// SOL       :
// Motivo    : Acerto na filtragem da qryTipoInvestimento quando o iTipoInvestUsu = 0 (Todos)
//             Obriga informar a Categoria do Fundo
//             Acerto na qryAdmFdoInvest para trazer o TipoDocPessoa = -1 (CNPJ) somente
//******************************************************************************
// Data      : 28/11/2006
// Código    : AL_14
// Pendencia : 23813
// SOL       :
// Motivo    : Retirada a critica que desabilita o Prazo de Cotização para o tipo
//             de Fundo com Ações
//******************************************************************************
// Data      : 20/11/2006
// Código    : AL_13
// Pendencia : 23349
// SOL       :
// Motivo    : Implementação da transferência entre Tipos de Fundo, modificação na
//             seleção do tipo de fundo para aceitar qualquer tipo.
//******************************************************************************
// Data      : 24/10/2006
// Código    : AL_12
// Pendencia :
// SOL       :
// Motivo    : Ajuste rotina GravaCotaIntegralizar, verifica se a cota é maior q zero,
//             grava o campo nova "IDCOTAINTEGRFUNDO" da tabela COTAINTEGRFUNDO
//******************************************************************************
// Data      : 24/10/2006
// Código    : AL_11
// Pendencia :
// SOL       :
// Motivo    : Implementação da verificação da carteira na confirmação do cadastro do fundo
//******************************************************************************
// Data      : 15/08/2006
// Código    : AL_10
// Pendencia :
// SOL       :
// Motivo    : Alteração do tipo do campo CODISIN de inteiro para string
//            (Qry,qryInsHistFundoInvest,qryInsFundoInvest e qryUpdFundoInvest)
//******************************************************************************
// Data      : 28/07/2006
// Código    : AL_9
// Pendencia :
// SOL       :
// Motivo    : Acerto no Alteraçao de ClassifAnbid, Custodiante e Nivel de Risco
//******************************************************************************
// Data      : 18/05/2006
// Código    : AL_8
// Pendencia :
// SOL       :
// Motivo    : Atualização no layout
//******************************************************************************
// Data      : 17/05/2006
// Código    : AL_7
// Pendencia :
// SOL       :
// Motivo    : Implementação da verificação do administrador e classificação ANBID,
//             esse são obrigatórios
//******************************************************************************
// Data      : 21/02/2006
// Código    : AL_6
// Motivo    : Implementação do Administrador de Fundos e Melhorias de LaY-oUT
//******************************************************************************
// Data      : 03/02/2006
// Código    : AL_5
// Motivo    : Implementação do código da Classificacao ANBID e Melhorias de LaY-oUT
//******************************************************************************
// Data      : 18/08/2005
// Codigo    : AL_4
// Descr.    : Implementação do Tipo de cota
//******************************************************************************
// Data      : 26/07/2005
// Codigo    : AL_3
// Descr.    : Implementação da troca de virgula por ponto
//******************************************************************************
// Data      : 22/11/2004
// Form      : Novo TDBRealEdit dbeQTDTOTINTEGRALIZA
// Descr.    : Acrescentado Novo TDBRealEdit dbeQTDTOTINTEGRALIZA no TPageControl pgcDetalhes
//******************************************************************************
// Data      : 22/11/2004
// Query     : Todas as Querys
// Descr.    : Acrescentado campo QTDTOTINTEGRALIZA em todas as querys
//******************************************************************************
// Data      : 15/09/2004
// Código    : AL_2
// Função    : Não permite gravar sem informar o Gestor pois o mesmo é necessário
//             nas qrys de Fundos.
//******************************************************************************
// Data      : 12/07/2004
// Código    : AL_1
// Função    : MontaSelect passa a forçar o cartesiano com as alterações no
//             cadastro de fundos e permitir procurar qualquer nome.
//******************************************************************************
// Data	     : 07/04/2004
// Origem    : FUNCEF
// Função    : AtualizaFundoInvest - Por estar ocorrendo um erro de Constraint, devido
//             a ordem dos parametros passados no "FOR". Foi implementado a passagem
//             normal por visualização de todos os parametros.
//******************************************************************************

unit FCadFundo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, wwdblook, StdCtrls, Mask, wwdbedit, MontaSelect, DBTables,
  Db, Wwdatsrc, Wwquery, TB97, MAHlpBtn, Buttons, ExtCtrls, TB97Ctls,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, ComCtrls, DBCtrls, TREdit,
  CmEventosCadastro, ImgList, wwdbdatetimepicker, CMDateTimePicker,
  CMDBLookupCombo, Grids, Wwdbigrd, Wwdbgrid, Menus, FCadastroCSInv,
  fcLabel, faMensagem, uCtrlPessoaAdmFdoInvest, uCmSqlParams, DBClient,
  uCMClientDataSet, uCtrlPadroes, Pessoa;

type
  TfrmCadFundo = class(TfrmCadastroCSInv)
    qryAux: TwwQuery;
    qryIDFUNDOINVEST: TFloatField;
    qryDESCFUNDOINVEST: TStringField;
    qryIDGESTORCARTEIRA: TFloatField;
    qryMOECODIGO: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryIDTIPOFUNDOINVEST: TFloatField;
    qryCNPJFUNDO: TStringField;
    qrySTAEXCLUSIVO: TStringField;
    qryPZOCARENCIA: TFloatField;
    qryPZOANIVERSARIO: TFloatField;
    qryPZOLIQAPLIC: TFloatField;
    qryPZOLIQRESG: TFloatField;
    qryQTDDECQTD: TFloatField;
    qryQTDDECVALOR: TFloatField;
    qrySTAFUNDO: TStringField;
    qryPZOAMORTIZACAO: TFloatField;
    qryPERCTXPERFORM: TFloatField;
    qryPERCTXADM: TFloatField;
    qryCODFUNCETIP: TStringField;
    qrySTAPROVISIONAIR: TStringField;
    qrySTAPROVISIONAIOF: TStringField;
    qryCONTRCETIP: TStringField;
    qryIDCATEGORIAFUNDO: TFloatField;
    qryDATAINICIOFUNDO: TDateTimeField;
    qryPZOCOTAPLIC: TFloatField;
    qryPZOCOTRESG: TFloatField;
    qryDATACOTIZACAO: TDateTimeField;
    qryVLRCOTAINICIAL: TFloatField;
    qryIDREGRA: TFloatField;
    qryMOECORCOTA: TFloatField;
    qryGestorCart: TwwQuery;
    qryGestorCartIDGESTORCARTEIRA: TFloatField;
    qryGestorCartIDPESSOA: TFloatField;
    qryGestorCartNOME: TStringField;
    qryTipoFundo: TwwQuery;
    qryTipoFundoIDTIPOFUNDOINVEST: TFloatField;
    qryTipoFundoIDTIPOINVEST: TFloatField;
    qryTipoFundoDESCTIPOFUNDOINV: TStringField;
    qryCarteiraInvest: TwwQuery;
    qryCarteiraInvestIDCARTEIRAINVEST: TFloatField;
    qryCarteiraInvestDESCCARTINVEST: TStringField;
    qryCarteiraInvestIDGESTORCARTEIRA: TFloatField;
    qryCarteiraInvestFLGCARTPROP: TFloatField;
    qryCarteiraInvestFLGCALCDIARIO: TStringField;
    qryCarteiraInvestDATAINICIO: TDateTimeField;
    qryCarteiraInvestFLGTRATALOTE: TStringField;
    qryCarteiraInvestTRGDTINCLUSAO: TDateTimeField;
    qryCarteiraInvestTRGUSERINCLUSAO: TStringField;
    qryCarteiraInvestIDPLANOPREV: TFloatField;
    qryCarteiraInvestIDPATROCINADORA: TFloatField;
    qryCarteiraInvestIDTIPOINVEST: TFloatField;
    qryCarteiraInvestIDMERCADO: TFloatField;
    qryCarteiraInvestFLGORDMOVINV: TStringField;
    qryINDICE: TwwQuery;
    qryINDICEMOECODIGO: TFloatField;
    qryINDICEIDUSUARIOINCLUSAO: TFloatField;
    qryINDICEMOEDESC: TStringField;
    qryINDICEMOESIGLA: TStringField;
    qryINDICEMOEPERIODICIDADE: TStringField;
    qryINDICEMOEINATIVO: TStringField;
    qryINDICEFLGPERCVALOR: TStringField;
    qryINDICEFATORCONVERSAO: TFloatField;
    qryINDICEDATAINICIO: TDateTimeField;
    qryINDICEDATAFIM: TDateTimeField;
    qryINDICEMOEDAREFERENCIA: TFloatField;
    qryINDICETRGDTINCLUSAO: TDateTimeField;
    qryINDICETRGUSERINCLUSAO: TStringField;
    qryINDICEFLGTIPOPRAZO: TStringField;
    qryINDICEFLGPERIODO: TStringField;
    qryCategFundo: TwwQuery;
    qryCategFundoIDCATEGORIAFUNDO: TFloatField;
    qryCategFundoNOMECATEGFUNDO: TStringField;
    qryRegraInvest: TwwQuery;
    qryRegraInvestIDREGRA: TFloatField;
    qryRegraInvestNOMEREGRA: TStringField;
    qryMoeCorCot: TwwQuery;
    qryMoeCorCotMOECODIGO: TFloatField;
    qryMoeCorCotMOEDESC: TStringField;
    qryMoeCorCotMOESIGLA: TStringField;
    qryUpdFundoInvest: TwwQuery;

    pgcDetalhes: TPageControl;
    tbsHistorico: TTabSheet;
    tbsCaracteristicas: TTabSheet;

    dbgHistoricoFundo: TwwDBGrid;
    Label6: TLabel;
    Label12: TLabel;
    Label4: TLabel;
    qryDTAVIGENCIA: TDateTimeField;
    qryNomeGestor: TStringField;
    qryInsFundoInvest: TwwQuery;
    qryInsHistFundoInvest: TwwQuery;
    pmnExcluir: TPopupMenu;
    mnuHistorico: TMenuItem;
    mnuFundo: TMenuItem;
    fraMensagem: TfraMensagem;
    qryCarteiraSPC: TwwQuery;
    qryCarteiraSPCIDCARTEIRASPC: TFloatField;
    qryCarteiraSPCDESCARTEIRASPC: TStringField;
    qryIDCARTEIRASPC: TFloatField;
    qryQTDTOTINTEGRALIZA: TFloatField;
    //Al_4
    QryTipoCota: TwwQuery;
    qryClassAnbid: TwwQuery;
    qryIDCLASSIFANBID: TFloatField;
    qryIDADMFDOINVEST: TFloatField;
    qryAdmFdoInvest: TwwQuery;
    qryAdmFdoInvestIDADMFDOINVEST: TFloatField;
    qryAdmFdoInvestDESADMFDOINVEST: TStringField;
    qryGestorCartNUMDOCUMENTO: TStringField;
    qryGestorCartMASCARA: TStringField;
    dsGestorCart: TwwDataSource;
    Pessoa: TPessoa;
    dsAdmFdoInvest: TwwDataSource;
    qryAdmFdoInvestIDPESSOA: TFloatField;
    qryAdmFdoInvestNUMDOCUMENTO: TStringField;
    qryAdmFdoInvestMASCARA: TStringField;
    qryAdmFdoInvestFISICAJURIDICA: TStringField;
    QryCustodiante: TwwQuery;
    dsCustodiante: TwwDataSource;
    QryCustodianteIDCUSTODIANTE: TFloatField;
    QryCustodianteSGLCUSTODIANTE: TStringField;
    QryCustodianteIDPESSOA: TFloatField;
    QryCustodianteNUMDOCUMENTO: TStringField;
    QryCustodianteMASCARA: TStringField;
    qryGestorCartFISICAJURIDICA: TStringField;
    QryCustodianteFISICAJURIDICA: TStringField;
    pnlCadFundo: TPanel;
    pgcFundo: TPageControl;
    tbsPrincipal: TTabSheet;
    tbsParametros: TTabSheet;
    pnlParametros: TPanel;
    pnlDetalhesGeral: TPanel;
    pnlPrazoCot: TPanel;
    sttPrzCot: TStaticText;
    pnlPrazoCotDet: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    dbePzCotAplicacao: TDBEdit;
    dbePzCotResgate: TDBEdit;
    pnlPrazo: TPanel;
    sttPrazo: TStaticText;
    pnlPrazoDet: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dbePzCarencia: TDBEdit;
    dbePzAniversario: TDBEdit;
    pnlPrazoLiq: TPanel;
    sttPrzLiq: TStaticText;
    pnlPrazoLiqDet: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    dbePzLiqAplicacao: TDBEdit;
    dbePzLiqResgate: TDBEdit;
    pnlQuantidadeDec: TPanel;
    sttQtdDec: TStaticText;
    pnlQuantidadeDecDet: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    dbeQtdDec: TDBEdit;
    dbeValorCota: TDBEdit;
    pnlParametrosDet: TPanel;
    pgcParametrosDet: TPageControl;
    tbsCarteiras: TTabSheet;
    pnlCarteiras: TPanel;
    Label7: TLabel;
    lblCarteira: TLabel;
    dblCarteiraSPC: TwwDBLookupCombo;
    dblCarteiraInvest: TwwDBLookupCombo;
    tbsAtualizacao: TTabSheet;
    pnlAtualizacao: TPanel;
    Label23: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    dtpInicioAtualizacao: TCMDateTimePicker;
    DbEdValorCota: TDBRealEdit;
    dblRegraAtuCota: TCMDBLookupCombo;
    dblMoeCorCota: TCMDBLookupCombo;
    tbsPerformance: TTabSheet;
    pnlTaxas: TPanel;
    Label19: TLabel;
    Label21: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    dblMoeCodigo: TwwDBLookupCombo;
    dbeTaxaPerformace: TDBRealEdit;
    dbeTaxaAdministracao: TDBRealEdit;
    tbsImpostos: TTabSheet;
    pnlImpostos: TPanel;
    GroupBox1: TGroupBox;
    dbcProvisionaIR: TDBCheckBox;
    dbcProvisionaIOF: TDBCheckBox;
    tbsOutros: TTabSheet;
    pnloutros: TPanel;
    Label13: TLabel;
    lblTipoCota: TLabel;
    Label16: TLabel;
    lb1: TLabel;
    dblCategFundo: TwwDBLookupCombo;
    dblTipoCota: TwwDBLookupCombo;
    dbrgFUNDO: TDBRadioGroup;
    dbePZOAMORTIZACAO: TDBEdit;
    dbeQTDTOTINTEGRALIZA: TDBRealEdit;
    tbsAnbid: TTabSheet;
    pnlAnbid: TPanel;
    lblClassAnbid: TLabel;
    Label22: TLabel;
    dblkClassAnbid: TCMDBLookupCombo;
    dbeCodAnbid: TwwDBEdit;
    tbsCetip: TTabSheet;
    pnlCetip: TPanel;
    Label11: TLabel;
    Label8: TLabel;
    dbeContrCetip: TDBEdit;
    dbeCodFdoCetip: TDBEdit;
    pnlPrincipal: TPanel;
    pgcPrincipal: TPageControl;
    tbsGeral: TTabSheet;
    pnlGeral: TPanel;
    lblVigencia: TLabel;
    lblTipoFundo: TLabel;
    lblCNPJ: TLabel;
    lblNome: TLabel;
    Label14: TLabel;
    Label24: TLabel;
    dbckExclusivo: TDBCheckBox;
    dtpDtaVigencia: TCMDateTimePicker;
    dbeCNPJ: TwwDBEdit;
    dblTipoFundo: TwwDBLookupCombo;
    DBENomeCarteira: TwwDBEdit;
    dbeCodIsin: TwwDBEdit;
    dblcNivelRisco: TwwDBLookupCombo;
    tbsresponsaveis: TTabSheet;
    pnlResponsaveis: TPanel;
    lblGestor: TLabel;
    lblAdmFdo: TLabel;
    Label15: TLabel;
    dblGestor: TwwDBLookupCombo;
    dbeCNPJGestor: TwwDBEdit;
    dblkAdmFdo: TwwDBLookupCombo;
    dbeCNPJAdm: TwwDBEdit;
    dblkCustodiante: TwwDBLookupCombo;
    dbeCustodiante: TwwDBEdit;
    qryIDCUSTODIANTE: TFloatField;
    qryCODANBID: TFloatField;
    qryCODISIN: TStringField;
    qryNivelRisco: TwwQuery;
    qryNivelRiscoIDRISCOFUNDOINVES: TFloatField;
    qryNivelRiscoSIGLARISCOFUNDO: TStringField;
    qryNivelRiscoNOMERISCOFUNDO: TStringField;
    //AL_17
    tbsIntegra: TTabSheet;
    pnlIntegracao: TPanel;
    pnlBloqInt: TPanel;
    pnlMensBloqInt: TPanel;
    Panel37: TPanel;
    chkFlgContabFinan: TDBCheckBox;
    qryFLGCONTABFINAN: TStringField;
    //Al_4 - Fim
    Procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure dbrgFUNDOClick(Sender: TObject);
    procedure qryTipoFundoAfterPost(DataSet: TDataSet);
    procedure qryTipoFundoAfterOpen(DataSet: TDataSet);
    procedure qryTipoFundoBeforePost(DataSet: TDataSet);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure mnuHistoricoClick(Sender: TObject);
    procedure mnuFundoClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeQtdDecExit(Sender: TObject);
    procedure dbgHistoricoFundoCellChanged(Sender: TObject);
    procedure dbeCNPJExit(Sender: TObject);
    procedure pgcDetalhesChange(Sender: TObject);
    procedure dblkAdmFdoChange(Sender: TObject);
    procedure dblkCustodianteChange(Sender: TObject);
    procedure dblkAdmFdoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkCustodianteCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblGestorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblGestorChange(Sender: TObject);
    //Al_14
    procedure dblTipoFundoExit(Sender: TObject);
    //AL_17
    procedure chkFlgContabFinanClick(Sender: TObject);

  private
    { Private declarations }
    procedure TrataCkeckd;
    procedure HabilitaTabs(bStatus: Boolean; Tab: TTabSheet = nil);
    procedure GravaCotaIntegralizar(iFundo :Integer;DataProc :TDateTime;fValorDaCota :Currency);
    procedure MontaMascaCPFCNPJ;
    procedure ParametroPessoa(sFisicaJuridica : String);
    procedure ControleEnabled;

    function  AtualizaFundoInvest(bInsHist: Boolean = True): Boolean;
    function  Sel(idFundo: Integer; sDtaVigencia: String = ''): Boolean;
    function  VerificaExclusao(iFundo: Integer): Boolean;
  public
    { Public declarations }
  end;
//  TTab = (tbsHistorico, tbsCaracteristicas, tbsDetalhes);
//  TTabs = set of TTab;

var
  frmCadFundo: TfrmCadFundo;

implementation

Uses
  UmensErro,UDataBase,dBaseDados, FPrincipal, UBibliotecaInvest, dFundoComum,
  UOperComum;
{$R *.DFM}

function TfrmCadFundo.Sel(idFundo: Integer; sDtaVigencia: String = ''): Boolean;
begin
   OperComum.LimpaParametros(qry);
   qry.ParamByName('IDFUNDOINVEST').AsInteger := idFundo;
   if sDtaVigencia <> '' then
      qry.ParamByName('DTAVIGENCIA').AsString := sDtaVigencia;
   qry.Open;
   qry.First;
  //AL_5
  OperComum.LimpaParametros(qryClassAnbid);
  qryClassAnbid.ParamByName('DTAVIGENCIA').AsString := datetostr(qry.FieldByName('DTAVIGENCIA').AsDatetime);
  qryClassAnbid.Open;
  //AL_6
  OperComum.LimpaParametros(qryAdmFdoInvest);
  qryAdmFdoInvest.Open;
end;

procedure TfrmCadFundo.ParametroPessoa(sFisicaJuridica : String);
begin
   if sFisicaJuridica    = 'F' Then
      Pessoa.EJuridica := false
   else
      Pessoa.EJuridica := true;
end;

procedure TfrmCadFundo.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
   pgcDetalhes.ActivePage := tbsHistorico;

   MontaMascaCPFCNPJ;
   
end;

procedure TfrmCadFundo.FormShow(Sender: TObject);
begin
  inherited;
  fraMensagem.Apaga;
  Qry.Open;
  //Al_4
  QryTipoCota.Open;
  qryTipoFundo.Close;
  //Al_13  
  qryTipoFundo.Open;
  qryGestorCart.Open;
  QryCustodiante.Open;
  qryCarteiraInvest.Open;
  qryCarteiraSPC.Open;
  qryIndice.Open;
  qryCategFundo.Open;
  qryMoeCorCot.Open;
  qryRegraInvest.Close;
  qryRegraInvest.ParamByName('IDTIPOREGRA').AsInteger := pRPI.IDTIPOREGRAFND;
  qryRegraInvest.Open;
  pgcDetalhes.ActivePage := tbsHistorico;
  HabilitaTabs(False, tbsHistorico);
  //AL_5
  OperComum.LimpaParametros(qryClassAnbid);
  qryClassAnbid.ParamByName('DTAVIGENCIA').AsString := datetostr(qry.FieldByName('DTAVIGENCIA').AsDatetime);
  qryClassAnbid.Open;
  //AL_6
  OperComum.LimpaParametros(qryAdmFdoInvest);
  qryAdmFdoInvest.Open;

  dbeCNPJGestor.Clear;
  dbeCNPJAdm.Clear;
  dbeCustodiante.Clear;
  //AL_9
  qryNivelRisco.Open;
end;

procedure TfrmCadFundo.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  HabilitaTabs(True, tbsHistorico);
  pgcDetalhes.ActivePage    := tbsCaracteristicas;
  dbckExclusivo.Checked     := False;
  dbcProvisionaIR.Checked   := False;
  dbcProvisionaIOF.Checked  := False;
  qryDTAVIGENCIA.AsDateTime := Now;

  //Al_13
  //AL_15
  if iTipoInvestUsu <> 0 then
     qryTipoFundo.Filter   := 'IDTIPOINVEST = '+IntToStr(iTipoInvestUsu);
  qryTipoFundo.Filtered := True;

  //AL_5
  OperComum.LimpaParametros(qryClassAnbid);
  qryClassAnbid.ParamByName('DTAVIGENCIA').AsString := datetostr(qry.FieldByName('DTAVIGENCIA').AsDatetime);
  qryClassAnbid.Open;

  dbeCNPJGestor.Clear;
  dbeCNPJAdm.Clear;
  dbeCustodiante.Clear;
  //Al_13
  if DBENomeCarteira.CanFocus then
     DBENomeCarteira.SetFocus;  
end;

procedure TfrmCadFundo.dbrgFUNDOClick(Sender: TObject);
begin
  inherited;
  if dbrgFUNDO.Items[dbrgFUNDO.ItemIndex] = 'Fechado' then
  begin
     dbePZOAMORTIZACAO.Enabled := True ;
     dbePZOAMORTIZACAO.Color := clWindow;
  end
  else
  Begin
     dbePZOAMORTIZACAO.Enabled := False;
     dbePZOAMORTIZACAO.Color := clSilver;
  end;
end;

procedure TfrmCadFundo.qryTipoFundoAfterPost(DataSet: TDataSet);
begin
  inherited;
   ControleEnabled;
end;

procedure TfrmCadFundo.qryTipoFundoAfterOpen(DataSet: TDataSet);
begin
  inherited;
   ControleEnabled;
end;

procedure TfrmCadFundo.qryTipoFundoBeforePost(DataSet: TDataSet);
begin
  inherited;
   ControleEnabled;
end;

procedure TfrmCadFundo.TrataCkeckd;
begin
  dbckExclusivo.Checked    := (qry.FieldByName('STAEXCLUSIVO').AsString     = 'S');
  dbcProvisionaIR.Checked  := (qry.FieldByName('STAPROVISIONAIR').AsString  = 'S');
  dbcProvisionaIOF.Checked := (qry.FieldByName('STAPROVISIONAIOF').AsString = 'S');
  //AL_17
  chkFlgContabFinan.Checked:= (qry.FieldByName('FLGCONTABFINAN').AsString   = 'N');
end;

procedure TfrmCadFundo.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   HabilitaTabs(True, tbsHistorico);
   pgcDetalhes.ActivePage := tbsCaracteristicas;

   //Al_13
   qryTipoFundo.Filter   := '';
   qryTipoFundo.Filtered := False;

   TrataCkeckd;
   // Seleciona a maior Vigencia do Fundo
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT MAX(DTAVIGENCIA) AS DATA FROM HISTFUNDOINVEST WHERE IDFUNDOINVEST = ' + qryIDFUNDOINVEST.AsString);
   qryAux.Open;
   // Se o registro atual for a maior vigencia
   if qryAux.FieldByName('DATA').AsDateTime = qryDTAVIGENCIA.AsDateTime then
      qryDTAVIGENCIA.AsDateTime := Now;
  //AL_5
  OperComum.LimpaParametros(qryClassAnbid);
  qryClassAnbid.ParamByName('DTAVIGENCIA').AsString := datetostr(qry.FieldByName('DTAVIGENCIA').AsDatetime);
  qryClassAnbid.Open;
   //Al_13
   if DBENomeCarteira.CanFocus then
      DBENomeCarteira.SetFocus;

end;

procedure TfrmCadFundo.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  HabilitaTabs(False, tbsHistorico);
  TrataCkeckd;

  if dblkAdmFdo.Text = '' then
     dbeCNPJAdm.Clear;

  if dblkCustodiante.Text = '' then
     dbeCustodiante.Clear;
end;

procedure TfrmCadFundo.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  TrataCkeckd;
  pgcDetalhes.ActivePage := tbsHistorico;
  HabilitaTabs(False, tbsHistorico);
end;

procedure TfrmCadFundo.FormCreate(Sender: TObject);
begin
  inherited;
  
  if iTipoInvestUsu <> 0 then
     MontaSelect.Filtro.Add('TIPOFUNDOINVEST.IDTIPOINVEST = ' + IntToStr(iTipoInvestUsu));

end;

procedure TfrmCadFundo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Qry.Close;
  //Al_4
  QryTipoCota.Close;
  qryTipoFundo.Close;
  qryGestorCart.Close;
  QryCustodiante.Close;
  qryCarteiraInvest.Close;
  qryCarteiraSPC.Close;
  qryIndice.Close;
  qryCategFundo.Close;
  qryMoeCorCot.Close;
  qryRegraInvest.Close;
  //AL_6
  qryAdmFdoInvest.Close;
  //AL_9
  qryNivelRisco.Close;
end;

procedure TfrmCadFundo.HabilitaTabs(bStatus: Boolean; Tab: TTabSheet = nil);
var I: Word;
begin
   //AL_8
   pnlFundo.Enabled           := True;
   pgcDetalhes.Enabled:= True;
   for I := 0 to pgcDetalhes.ControlCount -1 do
      if pgcDetalhes.Controls[I] is TTabSheet then
      begin
         if pgcDetalhes.Controls[I] <> Tab then
            TTabSheet(pgcDetalhes.Controls[I]).Enabled := bStatus
         else
            TTabSheet(pgcDetalhes.Controls[I]).Enabled := (not bStatus);
      end;

   pnlCadFundo.Enabled        := True;
   tbsCaracteristicas.Enabled := True;
   pgcFundo.Enabled   := True;
   for I := 0 to pgcFundo.ControlCount -1 do
      if pgcFundo.Controls[I] is TTabSheet then
      begin
         if pgcFundo.Controls[I] <> Tab then
            TTabSheet(pgcFundo.Controls[I]).Enabled := bStatus
         else
            TTabSheet(pgcFundo.Controls[I]).Enabled := (not bStatus);
      end;

   tbsPrincipal.Enabled   := True;
   pnlPrincipal.Enabled   := True;
   pgcPrincipal.Enabled   := True;
   for I := 0 to pgcPrincipal.ControlCount -1 do
      if pgcPrincipal.Controls[I] is TTabSheet then
      begin
         if pgcPrincipal.Controls[I] <> Tab then
            TTabSheet(pgcPrincipal.Controls[I]).Enabled := bStatus
         else
            TTabSheet(pgcPrincipal.Controls[I]).Enabled := (not bStatus);
      end;


   tbsParametros.Enabled   := True;
   pnlParametros.Enabled   := True;
   pnlParametrosDet.Enabled:= True;
   pgcParametrosDet.Enabled:= True;
   for I := 0 to pgcParametrosDet.ControlCount -1 do
      if pgcParametrosDet.Controls[I] is TTabSheet then
      begin
         if pgcParametrosDet.Controls[I] <> Tab then
            TTabSheet(pgcParametrosDet.Controls[I]).Enabled := bStatus
         else
            TTabSheet(pgcParametrosDet.Controls[I]).Enabled := (not bStatus);
      end;
end;

procedure TfrmCadFundo.GravaCotaIntegralizar(iFundo :Integer;DataProc :TDateTime;fValorDaCota :Currency);
Var
   wSql :String;
Begin

   If (DataProc)<> 0 Then
   Begin
      Try
         qryAux.Close;
         qryAux.SQL.Clear;

         //Al_4
         wSql := 'SELECT VLRCOTA FROM COTAINTEGRFUNDO ' +
                 'WHERE IDFUNDOINVEST = ' + IntToStr(iFundo) + ' AND ' +
                 '      DATACOTA = TO_DATE(' + QuotedStr(DateToStr(DataProc)) + ',' + QuotedStr('dd/mm/yyyy') + ') ';

         If ((iTipoInvestUsu = 9) And (Trim(dblTipoCota.Text) <> '')) then
             wSql := wSql + 'AND IDTIPOCOTA = ' + dblTipoCota.LookupValue;

         FazQuery(qryAux,wSql);

         //AL_12 
         //AL_3 
         if qryAux.IsEmpty then
         begin
            if fValorDaCota > 0 then
            begin
               wSql := 'INSERT INTO COTAINTEGRFUNDO (IDCOTAINTEGRFUNDO, IDFUNDOINVEST, DATACOTA, VLRCOTA';
               If ((iTipoInvestUsu = 9) And (Trim(dblTipoCota.Text) <> '')) then
                   wSql := wSql + ', IDTIPOCOTA) '
               else
                   wSql := wSql + ') ';

               wSql := wSql + 'VALUES ('+IntToStr(LeUltRegistro(Nil,'COTAINTEGRFUNDO'))  + ', ' +
                       IntToStr(iFundo) + ', ' +
                       'TO_DATE(' + QuotedStr(DateToStr(DataProc)) + ',' + QuotedStr('dd/mm/yyyy') + ')' + ', ' +
                       TrocaVirgulaPonto(FloatToStr(fValorDaCota));

               If ((iTipoInvestUsu = 9) And (Trim(dblTipoCota.Text) <> '')) then
                   wSql := wSql + ', ' + dblTipoCota.LookupValue + ') '
               else
                   wSql := wSql + ') ';
            end;                   
         end
         else
         begin
            wSql := 'UPDATE COTAINTEGRFUNDO ' +
                    'SET VLRCOTA = ' + TrocaVirgulaPonto(FloatToStr(fValorDaCota))+' ';

            If ((iTipoInvestUsu = 9) And (Trim(dblTipoCota.Text) <> '')) then
                wSql := wSql + ', IDTIPOCOTA = ' + dblTipoCota.LookupValue;

            wSql := wSql + ' WHERE IDFUNDOINVEST = ' + IntToStr(iFundo) + ' AND ' +
                    ' DATACOTA = TO_DATE(' + QuotedStr(DateToStr(DataProc)) + ',' + QuotedStr('dd/mm/yyyy') + ')';

            If ((iTipoInvestUsu = 9) And (Trim(dblTipoCota.Text) <> '')) then
                wSql := wSql + ' AND IDTIPOCOTA = ' + dblTipoCota.LookupValue;
         end;

         ExecutaQuery(qryAux, wSql);
         
      except
      on E:Exception do
         begin
            MsgDlg('Erro ao gravar cota a integralizar do Fundo: ' + #13 +
                  DmFundoComum.qryCotaIntegrFundoDESCFUNDOINVEST.AsString + #13 +
                  'Com a Mensagem:' + #13 + #13 +
                  E.Message, 'Mensagem do Sistema', MtError,[MbOk],0);
            Exit;
         end;
      end;
   End;
End;

procedure TfrmCadFundo.bbtnConfirmarClick(Sender: TObject);
var
    sCNPJ, intDisplay : String;
    j, i     : Integer;
begin
  sCNPJ  := qry.FieldByName('CNPJFUNDO').AsString;

  If qry.State In [DsInsert,DsEdit] Then
     qry.FieldByName('CNPJFUNDO').AsString := sCNPJ;

  // Força uma saida do controle ativo para gravar as alterações
  SelectNext(ActiveControl,True,True);

  CmeCadastro.RepetirInsert := False;
  inherited;
  HabilitaTabs(False, tbsHistorico);
  pgcDetalhes.ActivePage := tbsHistorico;
end;

procedure TfrmCadFundo.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   try
      if Trim(dbeNomeCarteira.Text) = '' then
      begin
         if dbeNomeCarteira.CanFocus then
            dbeNomeCarteira.SetFocus;
         Raise Exception.Create('Nome do Fundo deve ser informado.');
      end;
      //AL_2
      if Trim(dblGestor.Text) = '' then
      begin
         if dblGestor.CanFocus then
            dblGestor.SetFocus;
         Raise Exception.Create('Nome do Gestor não informado.');
      end;

      //AL_11      
      if Trim(dblCarteiraInvest.Text) = '' then
      begin
         if dblCarteiraInvest.CanFocus then
            dblCarteiraInvest.SetFocus;
         Raise Exception.Create('A Carteira de Investimento deve ser informado.');
      end;

      //AL_15
      if Trim(dblCategFundo.Text) = '' then
      begin
         if dblCategFundo.CanFocus then
            dblCategFundo.SetFocus;
         Raise Exception.Create('A Categoria do Fundo deve ser informada.');
      end;
      //AL_15
      if Trim(dblTipoFundo.Text) = '' then
      begin
         if dblTipoFundo.CanFocus then
            dblTipoFundo.SetFocus;
         Raise Exception.Create('O Tipo de Fundo deve ser informado.');
      end;

      //AL_7      
      if Trim(dblkAdmFdo.Text) = '' then
      begin
         if dblkAdmFdo.CanFocus then
            dblkAdmFdo.SetFocus;
         Raise Exception.Create('O Administrador deve ser informado.');
      end;

      if ds.DataSet.State in [dsInsert] then
      begin
         if qry.FieldByName('IDFUNDOINVEST').AsInteger <= 0 then
            qry.FieldByName('IDFUNDOINVEST').AsInteger := LeUltRegistro(nil,'FUNDOINVEST');
      end;

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT IDFUNDOINVEST ' +
                     'FROM HISTFUNDOINVEST ' +
                     'WHERE IDFUNDOINVEST = ' + IntToStr(qryIDFUNDOINVEST.AsInteger) + ' ' +
                     '  AND DTAVIGENCIA = TO_DATE(''' + dtpDtaVigencia.Text + ''',''DD/MM/YYYY, HH24:MI:SS'')');
      qryAux.Open;
      if not qryAux.IsEmpty then
      begin
         if not dtpDtaVigencia.CanFocus then
            pgcDetalhes.ActivePage := tbsCaracteristicas;
         if dtpDtaVigencia.CanFocus then
            dtpDtaVigencia.SetFocus;
         Raise Exception.Create('Data / hora de vigência já existente, favor alterar.');
      end;
      qryAux.Close;
      qryAux.SQL.Clear;

      Accept := True;
   except
      on E:Exception do
      begin
         Accept := False;
         MsgDlg(E.Message, 'Mensagem do Sistema', MtWarning,[MbOk],0);
         Exit;
      end;
   end;
end;

procedure TfrmCadFundo.CmeCadastroConfirma(Sender: TObject);
begin
  if (ds.State in [dsInsert, dsEdit]) then
  begin
     if AtualizaFundoInvest then
     begin
        inherited;
        GravaCotaIntegralizar(qry.FieldByName('IDFUNDOINVEST').AsInteger,qry.FieldByName('DATAINICIOFUNDO').AsDateTime,
                              qry.FieldByName('VLRCOTAINICIAL').AsFloat);
        TrataCkeckd;
        HabilitaTabs(False, tbsHistorico);
        pgcDetalhes.ActivePage := tbsHistorico;
     end else
        bbtnCancelar.Click;
  end;
end;

function TfrmCadFundo.AtualizaFundoInvest(bInsHist: Boolean = True): Boolean;
var i, j, iFundo: Integer;
    sVigencia, sCNPJ : String;
begin
   Result := True;
   try
      try
         iFundo := qryIDFUNDOINVEST.AsInteger;
         sVigencia := qryDTAVIGENCIA.AsString;
         fraMensagem.Mostra;
         fraMensagem.Max := 3;

         if bInsHist then
         begin
            fraMensagem.Mes := 'Incluindo novo histórico com a vigência ' + sVigencia;
            // Inclui nova linha no histórico
            OperComum.LimpaParametros(qryInsHistFundoInvest, True);
            for i := 0 to qry.FieldCount -1 do
            begin
               if qry.Fields[i].Tag < 90 then
                  qryInsHistFundoInvest.Params[qry.Fields[i].Tag].Value := qry.Fields[i].Value;
            end;
            qryInsHistFundoInvest.ExecSQL;
            // Cancela a Alteração do Histórico
            CmeCadastro.Cancel(Self);
            // Seleciona o novo Histórico incluído
            Sel(iFundo, sVigencia);
         end;
         fraMensagem.Incrementa;

         // Testa se o registro é o de maior vigência e atualiza a FUNDOINVEST
         fraMensagem.Mes := 'Verificando a vigência atual';
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('SELECT MAX(DTAVIGENCIA) AS DATA FROM HISTFUNDOINVEST WHERE IDFUNDOINVEST = ' +
                         IntToStr(iFundo));//qryIDFUNDOINVEST.AsString
         qryAux.Open;
         fraMensagem.Incrementa;
         // Se for a maior vigencia
         if qryAux.FieldByName('DATA').AsDateTime <= qryDTAVIGENCIA.AsDateTime then
         begin
            if not dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.StartTransaction;

            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT IDFUNDOINVEST ' +
                           'FROM FUNDOINVEST '     +
                           'WHERE IDFUNDOINVEST = ' + IntToStr(iFundo));
            qryAux.Open;
            if qryAux.IsEmpty then
            begin
               // Insere o histórico na Fundoinvest
               fraMensagem.Mes := 'Incluindo novo Fundo no Cadastro';
               try
                  OperComum.LimpaParametros(qryInsFundoInvest, True);
                  for i := 0 to qry.FieldCount -1 do
                  begin
                     if qry.Fields[i].Tag < 90 then
                        qryInsFundoInvest.Params[qry.Fields[i].Tag].Value := qry.Fields[i].Value;
                  end;
                  qryInsFundoInvest.ExecSQL;
               except
                  Raise Exception.Create('Incluir o Fundo');
               end;
            end else
            begin
               // Atualiza o registro da Fundoinvest
               fraMensagem.Mes := 'Atualizando Fundo no Cadastro';
               try
                  OperComum.LimpaParametros(qryUpdFundoInvest, True);
                  OperComum.LimpaParametros(qryUpdFundoInvest);
                  qryUpdFundoInvest.ParamByName('DESCFUNDOINVEST').AsString   :=
                  qry.FieldByName('DESCFUNDOINVEST').AsString;
                  qryUpdFundoInvest.ParamByName('IDGESTORCARTEIRA').AsInteger :=
                  qry.FieldByName('IDGESTORCARTEIRA').AsInteger; If qry.FieldByName('IDGESTORCARTEIRA').IsNull Then qryUpdFundoInvest.ParamByName('IDGESTORCARTEIRA').Clear;
                  qryUpdFundoInvest.ParamByName('MOECODIGO').AsInteger        :=
                  qry.FieldByName('MOECODIGO').AsInteger; If qry.FieldByName('MOECODIGO').IsNull Then qryUpdFundoInvest.ParamByName('MOECODIGO').Clear;
                  qryUpdFundoInvest.ParamByName('IDCARTEIRAINVEST').AsInteger :=
                  qry.FieldByName('IDCARTEIRAINVEST').AsInteger; If qry.FieldByName('IDCARTEIRAINVEST').IsNull Then qryUpdFundoInvest.ParamByName('IDCARTEIRAINVEST').Clear;
                  qryUpdFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger:=
                  qry.FieldByName('IDTIPOFUNDOINVEST').AsInteger; If qry.FieldByName('IDTIPOFUNDOINVEST').IsNull Then qryUpdFundoInvest.ParamByName('IDTIPOFUNDOINVEST').Clear;
                  qryUpdFundoInvest.ParamByName('CNPJFUNDO').AsString         :=
                  qry.FieldByName('CNPJFUNDO').AsString;
                  qryUpdFundoInvest.ParamByName('STAEXCLUSIVO').AsString      :=
                  qry.FieldByName('STAEXCLUSIVO').AsString;
                  qryUpdFundoInvest.ParamByName('PZOCARENCIA').AsInteger      :=
                  qry.FieldByName('PZOCARENCIA').AsInteger;
                  qryUpdFundoInvest.ParamByName('PZOANIVERSARIO').AsInteger   :=
                  qry.FieldByName('PZOANIVERSARIO').AsInteger;
                  qryUpdFundoInvest.ParamByName('PZOLIQAPLIC').AsInteger      :=
                  qry.FieldByName('PZOLIQAPLIC').AsInteger;
                  qryUpdFundoInvest.ParamByName('PZOLIQRESG').AsInteger       :=
                  qry.FieldByName('PZOLIQRESG').AsInteger;
                  qryUpdFundoInvest.ParamByName('QTDDECQTD').AsInteger        :=
                  qry.FieldByName('QTDDECQTD').AsInteger;
                  qryUpdFundoInvest.ParamByName('QTDDECVALOR').AsInteger      :=
                  qry.FieldByName('QTDDECVALOR').AsInteger;
                  qryUpdFundoInvest.ParamByName('QTDTOTINTEGRALIZA').AsFloat  :=
                  qry.FieldByName('QTDTOTINTEGRALIZA').AsFloat;
                  qryUpdFundoInvest.ParamByName('STAFUNDO').AsString          :=
                  qry.FieldByName('STAFUNDO').AsString;
                  qryUpdFundoInvest.ParamByName('PZOAMORTIZACAO').AsInteger   :=
                  qry.FieldByName('PZOAMORTIZACAO').AsInteger;
                  qryUpdFundoInvest.ParamByName('PERCTXPERFORM').AsFloat      :=
                  qry.FieldByName('PERCTXPERFORM').AsFloat;
                  qryUpdFundoInvest.ParamByName('PERCTXADM').AsFloat          :=
                  qry.FieldByName('PERCTXADM').AsFloat;
                  qryUpdFundoInvest.ParamByName('CODFUNCETIP').AsString       :=
                  qry.FieldByName('CODFUNCETIP').AsString;
                  qryUpdFundoInvest.ParamByName('STAPROVISIONAIR').AsString   :=
                  qry.FieldByName('STAPROVISIONAIR').AsString;
                  qryUpdFundoInvest.ParamByName('STAPROVISIONAIOF').AsString  :=
                  qry.FieldByName('STAPROVISIONAIOF').AsString;
                  qryUpdFundoInvest.ParamByName('CONTRCETIP').AsString        :=
                  qry.FieldByName('CONTRCETIP').AsString;
                  qryUpdFundoInvest.ParamByName('IDCATEGORIAFUNDO').AsInteger :=
                  qry.FieldByName('IDCATEGORIAFUNDO').AsInteger; If qry.FieldByName('IDCATEGORIAFUNDO').IsNull Then qryUpdFundoInvest.ParamByName('IDCATEGORIAFUNDO').Clear;
                  qryUpdFundoInvest.ParamByName('DATAINICIOFUNDO').AsString   :=
                  qry.FieldByName('DATAINICIOFUNDO').AsString;
                  qryUpdFundoInvest.ParamByName('PZOCOTAPLIC').AsInteger      :=
                  qry.FieldByName('PZOCOTAPLIC').AsInteger;
                  qryUpdFundoInvest.ParamByName('PZOCOTRESG').AsInteger       :=
                  qry.FieldByName('PZOCOTRESG').AsInteger;
                  qryUpdFundoInvest.ParamByName('DATACOTIZACAO').AsString     :=
                  qry.FieldByName('DATACOTIZACAO').AsString;
                  qryUpdFundoInvest.ParamByName('IDREGRA').AsInteger          :=
                  qry.FieldByName('IDREGRA').AsInteger; If qry.FieldByName('IDREGRA').IsNull Then qryUpdFundoInvest.ParamByName('IDREGRA').Clear;
                  qryUpdFundoInvest.ParamByName('VLRCOTAINICIAL').AsFloat     :=
                  qry.FieldByName('VLRCOTAINICIAL').AsFloat;
                  qryUpdFundoInvest.ParamByName('MOECORCOTA').AsInteger       :=
                  qry.FieldByName('MOECORCOTA').AsInteger; If qry.FieldByName('MOECORCOTA').IsNull Then qryUpdFundoInvest.ParamByName('MOECORCOTA').Clear;
                  qryUpdFundoInvest.ParamByName('DTAVIGENCIA').AsString       :=
                  qry.FieldByName('DTAVIGENCIA').AsString;
                  qryUpdFundoInvest.ParamByName('IDCARTEIRASPC').AsInteger    :=
                  qry.FieldByName('IDCARTEIRASPC').AsInteger; If qry.FieldByName('IDCARTEIRASPC').IsNull Then qryUpdFundoInvest.ParamByName('IDCARTEIRASPC').Clear;
                  qryUpdFundoInvest.ParamByName('IDFUNDOINVEST').AsInteger    :=
                  qry.FieldByName('IDFUNDOINVEST').AsInteger;
                  //AL_5
                  qryUpdFundoInvest.ParamByName('IDCLASSIFANBID').AsInteger    :=
                  qry.FieldByName('IDCLASSIFANBID').AsInteger;
                  //AL_9
                  If qry.FieldByName('IDCLASSIFANBID').IsNull Then qryUpdFundoInvest.ParamByName('IDCLASSIFANBID').Clear;
                  //AL_6
                  qryUpdFundoInvest.ParamByName('IDADMFDOINVEST').AsInteger    :=
                  qry.FieldByName('IDADMFDOINVEST').AsInteger;
                  //AL_9
                  If qry.FieldByName('IDADMFDOINVEST').IsNull Then qryUpdFundoInvest.ParamByName('IDADMFDOINVEST').Clear;

                  //AL_7
                  qryUpdFundoInvest.ParamByName('IDCUSTODIANTE').AsInteger     :=
                  qry.FieldByName('IDCUSTODIANTE').AsInteger;
                  //AL_9
                  If qry.FieldByName('IDCUSTODIANTE').IsNull Then qryUpdFundoInvest.ParamByName('IDCUSTODIANTE').Clear;

                  //AL_10
                  qryUpdFundoInvest.ParamByName('CODISIN').AsString            :=
                  qry.FieldByName('CODISIN').AsString;
                  
                  qryUpdFundoInvest.ParamByName('CODANBID').AsInteger          :=
                  qry.FieldByName('CODANBID').AsInteger;

                  //AL_17
                  qryUpdFundoInvest.ParamByName('FLGCONTABFINAN').AsString     :=
                  qry.FieldByName('FLGCONTABFINAN').AsString;

                  qryUpdFundoInvest.ExecSQL;
               except
                  Raise Exception.Create('Atualizar o Fundo');
               end;
            end;
            if dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.Commit;
            fraMensagem.Incrementa;
            // Reposiciona o Fundo
            Sel(iFundo);
         end;
      except
         on E: Exception do
         begin
            Result := False;
            MsgDlg('Não foi Possível ' + E.Message,
                   'Mensagem do Sistema', MtError,[MbOk],0);

            if dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.Rollback;
         end;
      end;
   finally
      qryAux.Close;
      qryAux.SQL.Clear;
      fraMensagem.Apaga(True);
   end;
end;

procedure TfrmCadFundo.mnuHistoricoClick(Sender: TObject);
var iFundo: Integer;
begin
   inherited;
   if qry.RecordCount = 1 then
   begin
      MsgDlg('Não é Possível excluir o único histórico do Fundo, Exclua o Fundo.',
             'Mensagem do Sistema', MtInformation, [MbOk], 0);
      Exit;
   end;
   fraMensagem.Mostra;
   fraMensagem.Mes := 'Excluindo o Histórico do Fundo';

   iFundo := qryIDFUNDOINVEST.AsInteger;
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('DELETE FROM HISTFUNDOINVEST ');
   qryAux.SQL.Add('WHERE IDFUNDOINVEST = ' + qryIDFUNDOINVEST.AsString + ' AND ');
   qryAux.SQL.Add('      DTAVIGENCIA = TO_DATE(''' + qryDTAVIGENCIA.AsString + ''',''DD/MM/YYYY, HH24:MI:SS'')');
   qryAux.ExecSQL;
   Sel(iFundo);
   AtualizaFundoInvest(False);
   fraMensagem.Apaga;
end;

function TfrmCadFundo.VerificaExclusao(iFundo: Integer): Boolean;
begin
   try     // finally
      try  // except
         Result := True;
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('SELECT IDFUNDOINVEST FROM PEDIDOFUNDO WHERE IDFUNDOINVEST = ' + IntToStr(iFundo));
         qryAux.Open;
         if not qryAux.IsEmpty then
            Raise Exception.Create('Este Fundo possui Pedidos Cadastrados.');

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('SELECT IDFUNDOINVEST FROM OPERACAOFUNDO WHERE IDFUNDOINVEST = ' + IntToStr(iFundo));
         qryAux.Open;
         if not qryAux.IsEmpty then
            Raise Exception.Create('Este Fundo possui Operações Cadastradas.');

      except
         on E:Exception do
         begin
            Result := False;
            MsgDlg('Não é possível excluir, ' + #13 +
                   E.Message, LerMensagem(2), MtError,[MbOk],0);
            Exit;
         end;
      end;
   finally
      qryAux.SQL.Clear;
      qryAux.Close;
   end;
end;

procedure TfrmCadFundo.mnuFundoClick(Sender: TObject);
begin
   inherited;
   if not VerificaExclusao(qryIDFUNDOINVEST.AsInteger) then
      Exit;

   if (MsgDlg('Deseja realmente excluir este Fundo?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
   begin
      try
         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         fraMensagem.Mostra;
         fraMensagem.Max := 3;

         fraMensagem.Mes := 'Excluindo Cotas de Integralização';
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('DELETE FROM COTAINTEGRFUNDO WHERE IDFUNDOINVEST = ' + qryIDFUNDOINVEST.AsString);
         qryAux.ExecSQL;
         fraMensagem.Incrementa;

         fraMensagem.Mes := 'Excluindo Cotas de Integralização';
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('DELETE FROM FUNDOINVEST WHERE IDFUNDOINVEST = ' + qryIDFUNDOINVEST.AsString);
         qryAux.ExecSQL;
         fraMensagem.Incrementa;

         fraMensagem.Mes := 'Excluindo Cotas de Integralização';
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('DELETE FROM HISTFUNDOINVEST WHERE IDFUNDOINVEST = ' + qryIDFUNDOINVEST.AsString);
         qryAux.ExecSQL;
         fraMensagem.Incrementa;

         dtmBaseDados.dbBaseDados.Commit;
         fraMensagem.Apaga;
         Sel(-1);
      except
         MsgDlg('Não foi possível excluir esse Fundo. ','Erro',mtError,[mbOK],0);
         fraMensagem.Apaga;
         dtmBaseDados.dbBaseDados.Rollback;
      end;
   end;
end;

procedure TfrmCadFundo.sbtnApagarClick(Sender: TObject);
begin
   // Para não executar os eventos do padrão
   Exit;
   inherited;
end;

procedure TfrmCadFundo.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_Return then   
     SelectNext(ActiveControl,True,True)
end;

procedure TfrmCadFundo.dbeQtdDecExit(Sender: TObject);
var i: Integer;
    intDisplay: String;
begin
  inherited;
  dbeQTDTOTINTEGRALIZA.DecDigits:=qry.FieldByName('QTDDECQTD').AsInteger;
  intDisplay := '#,##0.';
  for i := 1 to dbeQTDTOTINTEGRALIZA.DecDigits do
      intDisplay := intDisplay + '0';
  qryQTDTOTINTEGRALIZA.DisplayFormat:=intDisplay;
end;

procedure TfrmCadFundo.dbgHistoricoFundoCellChanged(Sender: TObject);
var i: Integer;
    intDisplay: String;
begin
  inherited;
  if dbeQTDTOTINTEGRALIZA.DecDigits <> qry.FieldByName('QTDDECQTD').AsInteger then
  begin
     dbeQTDTOTINTEGRALIZA.DecDigits:=qry.FieldByName('QTDDECQTD').AsInteger;
     intDisplay := '#,##0.';
     for i := 1 to dbeQTDTOTINTEGRALIZA.DecDigits do
         intDisplay := intDisplay + '0';
     qryQTDTOTINTEGRALIZA.DisplayFormat:=intDisplay;
  end;

end;

procedure TfrmCadFundo.MontaMascaCPFCNPJ;
begin

   ParametroPessoa(qryGestorCart.FieldByName('FISICAJURIDICA').AsString);
   qryGestorCart.FieldByName('NUMDOCUMENTO').EditMask := Pessoa.MaskField(qryGestorCart.FieldByName('MASCARA').AsString);

   if qryGestorCart.FieldByName('FISICAJURIDICA').AsString <> QryCustodiante.FieldByName('FISICAJURIDICA').AsString then
      ParametroPessoa(QryCustodiante.FieldByName('FISICAJURIDICA').AsString);
   QryCustodiante.FieldByName('NUMDOCUMENTO').EditMask := Pessoa.MaskField(qryGestorCart.FieldByName('MASCARA').AsString);

   if QryCustodiante.FieldByName('FISICAJURIDICA').AsString <> qryAdmFdoInvest.FieldByName('FISICAJURIDICA').AsString then
      ParametroPessoa(qryAdmFdoInvest.FieldByName('FISICAJURIDICA').AsString);
   qryAdmFdoInvest.FieldByName('NUMDOCUMENTO').EditMask := Pessoa.MaskField(qryGestorCart.FieldByName('MASCARA').AsString);
end;

procedure TfrmCadFundo.dbeCNPJExit(Sender: TObject);
begin
   if (dbeCNPJ.modified) and (dbeCNPJ.text <> '') then
   begin
       if Not Pessoa.DocumValido(dbeCNPJ.text) then
       begin
          MsgDlg('Preencha o campo CNPJ corretamente', Caption, mtError , [mbOk,mbHelp], 0);
          qryCNPJFUNDO.clear ;
          if dbeCNPJ.CanFocus then
             dbeCNPJ.SetFocus;
       end;
   end;

  inherited;

end;

procedure TfrmCadFundo.pgcDetalhesChange(Sender: TObject);
begin
  inherited;
  
   MontaMascaCPFCNPJ;

  if dblkAdmFdo.Text = '' then
     dbeCNPJAdm.Clear;

  if dblkCustodiante.Text = '' then
     dbeCustodiante.Clear;
end;

procedure TfrmCadFundo.dblkAdmFdoChange(Sender: TObject);
begin
  inherited;
  if dblkAdmFdo.Text = '' then
     dbeCNPJAdm.Clear;
end;

procedure TfrmCadFundo.dblkCustodianteChange(Sender: TObject);
begin
  inherited;
  if dblkCustodiante.Text = '' then
     dbeCustodiante.Clear;
end;

procedure TfrmCadFundo.dblkAdmFdoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkAdmFdo.Text = '' then
     dbeCNPJAdm.Clear;
end;

procedure TfrmCadFundo.dblkCustodianteCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkCustodiante.Text = '' then
     dbeCustodiante.Clear;
end;

procedure TfrmCadFundo.dblGestorCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblTipoFundo.Text = '' then
     dbeCNPJGestor.Clear;
end;

procedure TfrmCadFundo.dblGestorChange(Sender: TObject);
begin
  inherited;
  if dblTipoFundo.Text = '' then
     dbeCNPJGestor.Clear;
end;

procedure TfrmCadFundo.ControleEnabled;
begin
  dbrgFUNDO.Enabled      := (qryTipoFundoIDTIPOINVEST.Value = 6);

//  dblTipoCota.Enabled    := (qryTipoFundoIDTIPOINVEST.Value = 9);     //Renan Cgpc28

  dbrgFUNDO.Enabled      := (qryTipoFundoIDTIPOINVEST.Value = 6);

//Al_14
end;

//Al_14
procedure TfrmCadFundo.dblTipoFundoExit(Sender: TObject);
begin
  inherited;
   ControleEnabled;
end;

//AL_17
procedure TfrmCadFundo.chkFlgContabFinanClick(Sender: TObject);
begin
  inherited;
   if chkFlgContabFinan.Checked then
   begin
      pnlMensBloqInt.Color := $007575FF;
      pnlMensBloqInt.Caption := 'Não Integra';
   end
   else
   begin
      pnlMensBloqInt.Color := $0097E18A;
      pnlMensBloqInt.Caption := 'Integra';
   end;
end;

end.
