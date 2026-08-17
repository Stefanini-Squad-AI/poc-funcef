{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27513
Responsável : Daniel Simões
Data        : 03/03/2008
Descrição   : Correção na hora de "ponteirar" o cdsOutroDadoXImovel...
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Pendência   : 26461
Responsável : Daniel Simões
Data        : 22/11/2007
Descrição   : Passa a calcular os valores de Juros, Multa e Correção pela
             'CtrlParamMulta' iserida no Cadastro de Contratos de Locação...
--------------------------------------------------------------------------------
Pendência   : 26104
Responsável : Daniel Simões
Data        : 14/08/2007
Descrição   : Métodos relacionados a Parametrização de Multas e Juros passa a
              trazer da CtrlParamMulta no lugar da CtrlContratoImovel...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fExecConfissaoDivida;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, mLocatario, TB97Ctls, ImgList,
  Grids, Wwdbigrd, Wwdbgrid, wwriched, Wwdotdot, Wwdbcomb, DBCtrls,
  DBCtrls2, mImovelAtivo, mResponsavel, mAdministradora, Mask, wwdbedit, uSistema,
  Wwdbspin, wwdblook, TREdit, uCtrlPadroes, uCtrlConfissaoDivida, uCtrlConcilia, uModuloAdminImob,
  Db, uCmSqlParams, DBClient, uCMClientDataSet, uCtrlParamIntegra, uCtrlOutroDado,
  uCtrlMoeda, uCtrlPais, uCtrlEstado, uCtrlTipoCustoRecImov, uCtrlPortadorForma, uCtrlCidade,
  uCtrlMsgBoleto, uCtrlSitContImob,  uCtrlContratoImovel, uCtrlEventoImovel, {uCtrlDocumento,} CMDBLookupCombo,
  uCtrlTipoImovel, uCtrlFormaCalcImob, uModuloImobiliario, uDiasUteis,
  uCtrlParamMulta, uCtrlImobDocumento;

type
  TfrmExecConfissaoDivida = class(TfrmWizardMT)
    TabSheet2: TTabSheet;
    fcLabel2: TfcLabel;
    molLocatario1: TmolLocatario;
    gbPeriodo: TGroupBox;
    edtPeriodoIni: TCMDateTimePicker;
    edtPeriodoFim: TCMDateTimePicker;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel1: TPanel;
    pnlControlesDet: TPanel;
    Dock974: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInsDet: TToolbarButton97;
    sbtnAltDet: TToolbarButton97;
    sbtnExcluiDet: TToolbarButton97;
    ImlPadrao: TImageList;
    dbgrdDet: TwwDBGrid;
    dbgDebitos: TwwDBGrid;
    pgctrlDetalhe: TPageControl;
    tbsGeral: TTabSheet;
    Label19: TLabel;
    Label20: TLabel;
    Label55: TLabel;
    Label58: TLabel;
    Bevel2: TBevel;
    Label57: TLabel;
    lblPerc: TLabel;
    DBedtValorContrato: TDBRealEdit;
    DBcboMoedaContrato: TwwDBLookupCombo;
    DBchkCobrancaAuto: TDBCheckBox;
    molLocatario2: TmolLocatario;
    DBspnDiasRepasse: TwwDBSpinEdit;
    dblcSitContratual: TwwDBLookupCombo;
    dbEdtTaxaAdmin: TDBRealEdit;
    molAdministradora1: TmolAdministradora;
    MolResponsavel1: TmolResponsavel;
    tbsDet: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    tbsCobranca: TTabSheet;
    Label22: TLabel;
    Label53: TLabel;
    DBcboPortadorForma: TwwDBLookupCombo;
    DBcboMsgBoleto: TwwDBLookupCombo;
    tbsObs: TTabSheet;
    Panel6: TPanel;
    Panel7: TPanel;
    DBmemContrato: TwwDBRichEdit;
    TabSheet3: TTabSheet;
    gbObservacao: TGroupBox;
    Panel8: TPanel;
    memObs: TMemo;
    edtDataConfissao: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    cdsConcilia: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    cdsContratos: TCMClientDataSet;
    cdsDocumentos: TCMClientDataSet;
    dsDocumentos: TDataSource;
    cdsDocumentosFLGESCOLHA: TFloatField;
    cdsDocumentosCODDOCUMENTO: TFloatField;
    cdsDocumentosCOMPETENCIA: TStringField;
    cdsDocumentosDATAVENCTO: TDateTimeField;
    cdsDocumentosDATALIMITE: TDateTimeField;
    cdsDocumentosDATABAIXA: TDateTimeField;
    cdsDocumentosTOT_RECEBIDO: TFloatField;
    cdsDocumentosTOT_RECEBER: TFloatField;
    cdsDocumentosDIFERENCA: TFloatField;
    cdsDocumentosCORRECAO: TFloatField;
    cdsDocumentosJUROS: TFloatField;
    cdsDocumentosMULTA: TFloatField;
    cdsDocumentosIDCONTRATOIMOVEL: TFloatField;
    cdsDocumentosNOME_EXTENSO: TStringField;
    cdsConfDividaImob: TCMClientDataSet;
    cdsConfDividaImobXContr: TCMClientDataSet;
    cdsConfDividaImobXDoc: TCMClientDataSet;
    cdsConfDividaImobXOper: TCMClientDataSet;
    dsConfissaoOper: TDataSource;
    CMSqlParams2: TCMSqlParams;
    cdsConfDividaImobXOperDESCCUSTORECIMO: TStringField;
    cdsConfDividaImobXOperFLGTIPO: TStringField;
    cdsConfDividaImobXOperDESCTIPO: TStringField;
    cdsConfDividaImobXOperVLROPERACAO: TFloatField;
    cdsConfDividaImobXOperOBSERVACAO: TMemoField;
    cdsConfDividaImobXOperFLGDESCCONDIC: TFloatField;
    cdsConfDividaImobXOperDESCCOND: TStringField;
    cdsConfDividaImobXOperIDCONFDIVIDAIMOB: TFloatField;
    cdsConfDividaImobXOperIDTIPOCUSTORECIMO: TFloatField;
    Label5: TLabel;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label36: TLabel;
    DBMemo1: TDBMemo;
    chkDescCondicional: TDBCheckBox;
    DBRadioGroup1: TDBRadioGroup;
    cdsTipoOper: TCMClientDataSet;
    cboTipoOper: TwwDBLookupCombo;
    GroupBox14: TGroupBox;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    DBcboPais: TwwDBLookupCombo;
    DBcboEstado: TwwDBLookupCombo;
    DBcboCidade: TwwDBLookupCombo;
    btnInverteSelecao: TBitBtn;
    btnMarcaTodos: TBitBtn;
    cdsContratoImovel: TCMClientDataSet;
    dsContrato: TDataSource;
    CMSqlParams3: TCMSqlParams;
    cdsContratoXImovel: TCMClientDataSet;
    CMSqlParams4: TCMSqlParams;
    dscontratoXImovel: TDataSource;
    cdsAux: TCMClientDataSet;
    CdsEventoImovel: TCMClientDataSet;
    CdsContratoXVlrAno: TCMClientDataSet;
    CdsContratoXDesc: TCMClientDataSet;
    CdsCondPagImovel: TCMClientDataSet;
    CdsAvalistaXContrato: TCMClientDataSet;
    dsCondPagImovel: TDataSource;
    CMSqlParams5: TCMSqlParams;
    Label11: TLabel;
    cboTipoImovel: TwwDBLookupCombo;
    Label14: TLabel;
    Panel5: TPanel;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    btnOkCond: TBitBtn;
    btnCancelCond: TBitBtn;
    btnVoltarCOnd: TBitBtn;
    Dock975: TDock97;
    Toolbar972: TToolbar97;
    btnInsCond: TToolbarButton97;
    btnAltCond: TToolbarButton97;
    btnDelCond: TToolbarButton97;
    Panel9: TPanel;
    DBedtNumeroContrato: TDBEdit2;
    Label35: TLabel;
    DBedtNomeContrato: TDBEdit2;
    Label37: TLabel;
    cdsMoeda: TCMClientDataSet;
    cdsSitContImob: TCMClientDataSet;
    cdsSitContImobDESCRICAO: TStringField;
    cdsSitContImobIDSITCONTIMOB: TFloatField;
    cdsFormaCalcImob: TCMClientDataSet;
    cdsTipoCustoRec: TCMClientDataSet;
    cdsTipoCustoRecDESCCUSTORECIMO: TStringField;
    cdsTipoCustoRecIDTIPOCUSTORECIMO: TFloatField;
    cdsTipoCustoRecRECCUSTO: TStringField;
    cdsPortadorForma: TCMClientDataSet;
    cdsPortadorFormaCODPORTFORMA: TFloatField;
    cdsPortadorFormaDESCRICAO: TStringField;
    cdsMsgBoleto: TCMClientDataSet;
    cdsMsgBoletoMSGDESCRICAO: TStringField;
    cdsMsgBoletoIDMSGBOLETO: TFloatField;
    cdsPais: TCMClientDataSet;
    cdsPaisNOMEPAIS: TStringField;
    cdsPaisIDPAIS: TFloatField;
    cdsEstado: TCMClientDataSet;
    cdsEstadoCODESTADO: TStringField;
    cdsEstadoIDPAIS: TFloatField;
    cdsEstadoNOMEESTADO: TStringField;
    cdsEstadoIDESTADO: TFloatField;
    cdsCidade: TCMClientDataSet;
    cdsCidadeIDCIDADES: TFloatField;
    cdsCidadeCODESTADO: TStringField;
    cdsCidadeIDPAIS: TFloatField;
    cdsCidadeNOME: TStringField;
    cdsCidadeCODMUNICIPIO: TStringField;
    cdsCidadeIDESTADO: TFloatField;
    CMSqlParams6: TCMSqlParams;
    CdsCondPagImovelIDCONDPAGIMOVEL: TFloatField;
    CdsCondPagImovelINDCORRECAO: TFloatField;
    CdsCondPagImovelIDCONTRATOIMOVEL: TFloatField;
    CdsCondPagImovelVLRFINANC: TFloatField;
    CdsCondPagImovelFLGSINAL: TStringField;
    CdsCondPagImovelDATAINI: TDateTimeField;
    CdsCondPagImovelPRAZO: TStringField;
    CdsCondPagImovelPERIODO: TFloatField;
    CdsCondPagImovelTAXAJUROS: TFloatField;
    CdsCondPagImovelPERIODOTAXA: TStringField;
    CdsCondPagImovelNUMPARCELAS: TFloatField;
    CdsCondPagImovelATRASOINDCORREC: TFloatField;
    CdsCondPagImovelATRASOMULTA: TFloatField;
    CdsCondPagImovelATRASOTXJUROS: TFloatField;
    CdsCondPagImovelFLGREAJMENSAL: TStringField;
    CdsCondPagImovelIDINDCORRPROJ: TFloatField;
    CdsCondPagImovelDATAFIM: TDateTimeField;
    CdsCondPagImovelDATAVENCIMENTO: TDateTimeField;
    CdsCondPagImovelTIPOCONDPAG: TStringField;
    CdsCondPagImovelIDCONDINICIAL: TFloatField;
    CdsCondPagImovelIDREPACTUA: TFloatField;
    CdsCondPagImovelFLGCMMENSAL: TStringField;
    CdsCondPagImovelMESREFREAJUSTE: TFloatField;
    CdsCondPagImovelDATACARENCIA: TDateTimeField;
    CdsCondPagImovelFORMACALCULO: TFloatField;
    CdsCondPagImovelPERINDPROJ: TFloatField;
    CdsCondPagImovelFLGJURCARENCIA: TStringField;
    CdsCondPagImovelDATAINIAMORTIZ: TDateTimeField;
    CdsCondPagImovelPERIODOREAJUSTE: TFloatField;
    CdsCondPagImovelIDFORMACALCIMOB: TFloatField;
    CdsCondPagImovelNOME: TStringField;
    CdsCondPagImovelcal_tipo: TStringField;
    cdsTipoImovel: TCMClientDataSet;
    edtAlteradorConfissao: TDBEdit;
    CMSqlParams7: TCMSqlParams;
    dsTipoImovel: TDataSource;
    cdsImovelAluguel: TCMClientDataSet;
    cdsOutroDadoXImovel: TCMClientDataSet;
    GroupBox2: TGroupBox;
    DBedtDataAssinatura: TCMDateTimePicker;
    Label6: TLabel;
    DBedtDataInicio: TCMDateTimePicker;
    Label7: TLabel;
    DBedtDataFim: TCMDateTimePicker;
    Label8: TLabel;
    DBedtDataRenegoc: TCMDateTimePicker;
    Label44: TLabel;
    DBedtDataAvRenegoc: TCMDateTimePicker;
    Label45: TLabel;
    pnlCondicao: TPanel;
    GroupBox1: TGroupBox;
    cboFormaCalculo: TwwDBLookupCombo;
    lblJurCarencia: TLabel;
    dbcbJurosCarencia: TDBCheckBox;
    gbPeriodoReajuste: TGroupBox;
    Label72: TLabel;
    wwDBSpinEdit1: TwwDBSpinEdit;
    dbcbPerJur: TwwDBComboBox;
    lblPeriod: TLabel;
    Label32: TLabel;
    edtJuros: TDBRealEdit;
    lblJuros: TLabel;
    gbIntervalo: TGroupBox;
    dbspnPeriodo: TwwDBSpinEdit;
    dbcbPerParc: TwwDBComboBox;
    edtNumParc: TDBRealEdit;
    lblNumParc: TLabel;
    Label64: TLabel;
    edtDataAmortiz: TCMDateTimePicker;
    edDataIniParc: TCMDateTimePicker;
    Label34: TLabel;
    edDataCarencia: TCMDateTimePicker;
    Label23: TLabel;
    edtPerProj: TDBRealEdit;
    lblPerProj2: TLabel;
    lblPerProj: TLabel;
    dbedtMesRefReajuste: TwwDBSpinEdit;
    Label33: TLabel;
    Label46: TLabel;
    dblcIndCorrec: TCMDBLookupCombo;
    lblIndCorrec: TLabel;
    edValParc: TDBRealEdit;
    Label15: TLabel;
    dbrgTipoCond: TDBRadioGroup;
    cdsConfDividaImobXOperIDCONFDIVIDAXOPER: TFloatField;
    cdsConfDividaImobXOperIDCONDPAGIMOVEL: TFloatField;
    Panel10: TPanel;
    grdCondPag: TwwDBGrid;
    Panel11: TPanel;
    dbgDescCondic: TwwDBGrid;
    cdsConfDividaImobXOperFLGESCOLHA: TFloatField;
    dsOperXCond: TDataSource;
    Panel12: TPanel;
    Panel13: TPanel;
    cdsContratoxMulta: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnContinuarClick(Sender: TObject);
    procedure dsConfissaoOperStateChange(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure cboTipoOperCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure molLocatario1btnBuscaLocatarioClick(Sender: TObject);
    procedure dbgDebitosUpdateFooter(Sender: TObject);
    procedure dbgDebitosDblClick(Sender: TObject);
    procedure btnInverteSelecaoClick(Sender: TObject);
    procedure btnMarcaTodosClick(Sender: TObject);
    procedure dbgDebitosCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgDebitosTopRowChanged(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure dsCondPagImovelStateChange(Sender: TObject);
    procedure btnInsCondClick(Sender: TObject);
    procedure btnAltCondClick(Sender: TObject);
    procedure btnDelCondClick(Sender: TObject);
    procedure btnCancelCondClick(Sender: TObject);
    procedure btnVoltarCOndClick(Sender: TObject);
    procedure CdsCondPagImovelCalcFields(DataSet: TDataSet);
    procedure DBcboPaisCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBcboEstadoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbrgTipoCondChange(Sender: TObject);
    procedure CdsCondPagImovelBeforePost(DataSet: TDataSet);
    procedure PagControleChange(Sender: TObject);
    procedure CdsCondPagImovelBeforeDelete(DataSet: TDataSet);
    procedure dbgDescCondicDblClick(Sender: TObject);
    procedure pgctrlDetalheChange(Sender: TObject);
    procedure btnOkCondClick(Sender: TObject);
    procedure cdsConfDividaImobXOperAfterScroll(DataSet: TDataSet);
    procedure CdsCondPagImovelAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    sFiltro             : String;
    fTotal              : Extended;

    CtrlConfissaoDivida : TCtrlConfissaoDivida;
    CtrlConcilia        : TCtrlConcilia;
    CtrlContratoImovel  : TCtrlContratoImovel;
    CtrlEventoImovel    : TCtrlEventoImovel;
    //CtrlDocumento       : TCtrlDocumento;
    CtrlImobDocumento   : TCtrlImobDocumento;
    CtrlParamIntegra    : TCtrlParamIntegra;

    CtrlFormaCalcImob   : TCtrlFormaCalcImob;
    CtrlMoeda           : TCtrlMoeda;
    CtrlPais            : TCtrlPais;
    CtrlEstado          : TCtrlEstado;
    CtrlCidade          : TCtrlCidade;
    CtrlTipoCustoRec    : TCtrlTipoCustoRecImov;
    CtrlPortadorForma   : TCtrlPortadorForma;
    CtrlMsgBoleto       : TCtrlMsgBoleto;
    CtrlSitContImob     : TCtrlSitContImob;
    CtrlTipoImovel      : TCtrlTipoImovel;
    CtrlOutroDado       : TCtrlOutroDado;

    CtrlParamMulta      : TCtrlParamMulta;

    function VerificaPreenchimentoSelecao : Boolean;
    function VerificaPreenchimentoContrato : Boolean;
    function VerificaPreenchimentoCondicao : Boolean;
    function TotalizaCondicoes : Boolean;
    procedure HabilitaBotoes;
    procedure HabilitaBotoesCond;
    procedure MontaDadosContrato;
    procedure InicializaDados;
    procedure AjustaValorAluguelImovel;
    procedure AjustaTerminoContrato;
    procedure FiltraDescontos;

  public
    { Public declarations }
  end;

var
  frmExecConfissaoDivida: TfrmExecConfissaoDivida;

implementation

uses uDataBase, uVerificaPreenchimento, uMensErro, fAguarde, dMS;

{$R *.DFM}

procedure TfrmExecConfissaoDivida.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlConfissaoDivida := TCtrlConfissaoDivida.Create;
   CtrlConcilia        := TCtrlConcilia.Create(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario, Sistema.IdEspAcesso, Sistema.UsaPlanoPatro);
   CtrlContratoImovel  := TCtrlContratoImovel.Create(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario, Sistema.IdEspAcesso, Sistema.UsaPlanoPatro);
   CtrlEventoImovel    := TCtrlEventoImovel.Create;
   //CtrlDocumento       := TCtrlDocumento.Create;
   CtrlImobDocumento       := TCtrlImobDocumento.Create;
   CtrlParamIntegra    := TCtrlParamIntegra.Create;
   CtrlFormaCalcImob   := TCtrlFormaCalcImob.Create;
   CtrlMoeda           := TCtrlMoeda.Create;
   CtrlPais            := TCtrlPais.Create;
   CtrlEstado          := TCtrlEstado.Create;
   CtrlCidade          := TCtrlCidade.Create;
   CtrlTipoCustoRec    := TCtrlTipoCustoRecImov.Create;
   CtrlPortadorForma   := TCtrlPortadorForma.Create;
   CtrlMsgBoleto       := TCtrlMsgBoleto.Create;
   CtrlSitContImob     := TCtrlSitContImob.Create;
   CtrlTipoImovel      := TCtrlTipoImovel.Create;
   CtrlOutroDado       := TCtrlOutroDado.Create;

   // Daniel - 26104
   CtrlParamMulta      := TCtrlParamMulta.Create( Sistema.IdEmpresa,
                                                  Sistema.IdModulo,
                                                  Sistema.IdUsuario,
                                                  Sistema.IdEspAcesso,
                                                  Sistema.UsaPlanoPatro );
   // Fim.

   CtrlConfissaoDivida.InitializeAs(Padroes);
   CtrlConcilia.InitializeAs(Padroes);
   CtrlContratoImovel.InitializeAs(Padroes);
   CtrlEventoImovel.InitializeAs(Padroes);
   //CtrlDocumento.InitializeAs(Padroes);
   CtrlImobDocumento.InitializeAs(Padroes);
   CtrlParamIntegra.InitializeAs(Padroes);
   CtrlFormaCalcImob.InitializeAs(Padroes);
   CtrlMoeda.InitializeAs( Padroes );
   CtrlPais.InitializeAs( Padroes );
   CtrlEstado.InitializeAs( Padroes );
   CtrlCidade.InitializeAs( Padroes );
   CtrlTipoCustoRec.InitializeAs( Padroes );
   CtrlPortadorForma.InitializeAs( Padroes );
   CtrlMsgBoleto.InitializeAs( Padroes );
   CtrlSitContImob.InitializeAs( Padroes );
   CtrlTipoImovel.InitializeAs( Padroes );
   CtrlOutroDado.InitializeAs( Padroes );

   CtrlParamMulta.InitializeAs( Padroes ); 

   CtrlParamIntegra.GetParams(Sistema.idEmpresa,0,'','', tiSistema);

   CtrlContratoImovel.CdsContratoImovel    := cdsContratoImovel;
   CtrlContratoImovel.CdsContratoXImovel   := cdsContratoXImovel;
   CtrlContratoImovel.CdsContratoXVlrAno   := CdsContratoXVlrAno;
   CtrlContratoImovel.CdsAvalistaXContrato := CdsAvalistaXContrato;
   CtrlContratoImovel.CdsEventoImovel      := CdsEventoImovel;
   CtrlContratoImovel.CdsContratoXDesc     := CdsContratoXDesc;
   CtrlContratoImovel.CdsCondPagImovel     := CdsCondPagImovel;
   CtrlContratoImovel.CdsOutroDadoXImovel  := CdsOutroDadoXImovel;
   CtrlContratoImovel.CdsContratoXMulta    := cdsContratoxMulta; // Daniel - 27513
   CtrlContratoImovel.CdsDescCondicional   := cdsConfDividaImobXOper;

   CtrlConfissaoDivida.CdsConfDividaImob        := CdsConfDividaImob;
   CtrlConfissaoDivida.CdsConfDividaImobXContr  := CdsConfDividaImobXContr;
   CtrlConfissaoDivida.CdsConfDividaImobXDoc    := CdsConfDividaImobXDoc;
   CtrlConfissaoDivida.CdsConfDividaImobXOper   := CdsConfDividaImobXOper;

   cdsMoeda.Data                := CtrlMoeda.ListaMoeda;
   cdsPais.Data                 := CtrlPais.ListaPais;
   cdsTipoCustoRec.Data         := CtrlTipoCustoRec.LookupTipoCustoRecImov(Sistema.IdModulo, 'R');
   cdsPortadorForma.Data        := CtrlPortadorForma.ListPortadorforma('R');
   cdsMsgBoleto.Data            := CtrlMsgBoleto.LookupMsgBoleto(-1,Sistema.IdModulo);
   cdsSitContImob.Data          := CtrlSitContImob.LookupSitContImob;
   cdsFormaCalcImob.Data        := CtrlFormaCalcImob.LookupFormaCalcImob(Sistema.IdModulo);
   cdsTipoOper.Data             := CtrlConfissaoDivida.LookupTipoOperacao(Sistema.IdModulo);
   cdsTipoImovel.Data           := CtrlTipoImovel.LookupTipoImovel;
   cdsOutroDadoXImovel.Data     := CtrlOutroDado.LookupOutroDadoXImovel(-2,-2);
   cdsContratoxMulta.Data       := CtrlParamMulta.LookupMultaJuros(-2);

   sFiltro := dtmMS.MS_Locatario.Filtro.Text;
   dtmMS.MS_Locatario.Filtro.Add('L.IDLOCATARIO IN (SELECT C.IDLOCATARIO FROM CONTRATOIMOVEL C WHERE C.FLGSTATUS IN (''V'',''S'') AND C.IDLOCATARIO = L.IDLOCATARIO)');

   InicializaDados;

   if not ModuloImobiliario.AdminImob.bFlgSugereContrato then begin
       DBedtNumeroContrato.Enabled := True;
       DBedtNumeroContrato.Color   := clWindow;
   end else begin
       DBedtNumeroContrato.Enabled := False;
       DBedtNumeroContrato.Color   := $00C0FFFF;
   end;
end;



procedure TfrmExecConfissaoDivida.FormClose(Sender: TObject;var Action: TCloseAction);
begin
   FreeAndNil( CtrlConfissaoDivida );
   FreeAndNil( CtrlConcilia );
   FreeAndNil( CtrlContratoImovel );
   FreeAndNil( CtrlEventoImovel );
   //FreeAndNil( CtrlDocumento );
   FreeAndNil( CtrlImobDocumento );
   FreeAndNil( CtrlParamIntegra );
   FreeAndNil( CtrlFormaCalcImob );
   FreeAndNil( CtrlMoeda );
   FreeAndNil( CtrlPais );
   FreeAndNil( CtrlEstado );
   FreeAndNil( CtrlCidade );
   FreeAndNil( CtrlTipoCustoRec );
   FreeAndNil( CtrlPortadorForma );
   FreeAndNil( CtrlMsgBoleto );
   FreeAndNil( CtrlSitContImob );
   FreeAndNil( CtrlTipoImovel );
   FreeAndNil( CtrlOutroDado );

   FreeAndNil( CtrlParamMulta ); 

   dtmMS.MS_Locatario.Filtro.Text := sFiltro;
   inherited;
end;



function TfrmExecConfissaoDivida.VerificaPreenchimentoSelecao: Boolean;
begin
   Result := True;
   try
      if molLocatario1.iLocatario <= 0 then
         raise EValidacao.CreateVal('Selecione o Locatário', molLocatario1.btnBuscaLocatario);

      if edtPeriodoIni.Text = '' then
         raise EValidacao.CreateVal('Período inicial não informado', edtPeriodoIni);

      if edtPeriodoFim.Text = '' then
         raise EValidacao.CreateVal('Período final não informado', edtPeriodoFim);

      if edtPeriodoIni.Date > edtPeriodoFim.Date then
         raise EValidacao.CreateVal('Período inicial não pode ser superior ao período final', edtPeriodoIni);

      if edtDataConfissao.Text = '' then
         raise EValidacao.CreateVal('Data da confissão não informada', edtDataConfissao);

      if cboTipoImovel.Text = '' then
         raise EValidacao.CreateVal('Favor informar o Tipo de Imóvel', cboTipoImovel);

      if edtAlteradorConfissao.Text = '' then
         raise EValidacao.CreateVal('Tipo de Imóvel não possui alterador parametrizado', cboTipoImovel);

      if memObs.Lines.Count = 0 then
         raise EValidacao.CreateVal('Favor informar a observação para o Evento', edtDataConfissao);

   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Result := False;
      end;
   end;
end;



function TfrmExecConfissaoDivida.VerificaPreenchimentoContrato: Boolean;
var
   bExisteErro : Boolean;
begin
   bExisteErro := False;
   Result      := True;
   try
      if DBcboMoedaContrato.Text = '' then
         raise EValidacao.CreateVal('Moeda do contrato deve ser informada', DBcboMoedaContrato);

      if DBcboPortadorForma.Text = '' then
         raise EValidacao.CreateVal('Forma de cobrança deve ser informada', DBcboPortadorForma);

      if DBcboPais.Text = '' then
         raise EValidacao.CreateVal('País deve ser informado', DBcboPais);

      if DBcboEstado.Text = '' then
         raise EValidacao.CreateVal('Estado deve ser informado', DBcboEstado);

      if DBcboCidade.Text = '' then
         raise EValidacao.CreateVal('Cidade deve ser informada', DBcboCidade);

      if not TotalizaCondicoes then
         raise EValidacao.CreateVal('O somatório dos valores financiados nas condições de pagamento difere do valor confessado', edValParc);

      cdsConfDividaImobXOper.DisableControls;
      cdsConfDividaImobXOper.First;
      while not cdsConfDividaImobXOper.eof do
      begin
         if (cdsConfDividaImobXOper.FieldByName('FLGDESCCONDIC').AsInteger = 1) and
            (cdsConfDividaImobXOper.FieldByName('IDCONDPAGIMOVEL').IsNull) then
            bExisteErro := True;
         cdsConfDividaImobXOper.Next;
      end;
      cdsConfDividaImobXOper.First;
      cdsConfDividaImobXOper.EnableControls;

      if bExisteErro then
         raise EValidacao.CreateVal('Existe desconto condicional não associado a nenhuma condição de pagamento', dbgDescCondic);

   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Result := False;
      end;
   end;
end;



procedure TfrmExecConfissaoDivida.btnContinuarClick(Sender: TObject);
var
   bOk             : Boolean;
   oResultConcilia : OLEVariant; // Daniel - 26461
begin

  bOk := False;
  if PagControle.ActivePage = tabSelecao then
  begin
     bOk := VerificaPreenchimentoSelecao;
     if bOk then
     begin
        bOk := not cdsContratos.IsEmpty;
        if bOk then
        begin
           cdsDocumentos.Data := CtrlConfissaoDivida.LookupDocumentos;
           cdsContratos.First;
           while not cdsContratos.Eof do
           begin

              frmAguarde.Mostra('Conciliando os Recebimentos do Contrato ' + cdsContratos.FieldByName('CONNUMERO').AsString);
              CtrlConcilia.Concilia(oResultConcilia, // Daniel - 26461
                                    edtDataConfissao.Date,
                                    cdsContratos.FieldByName('IDCONTRATOIMOVEL').AsInteger);
              frmAguarde.Apaga;

// Daniel - 26461 - Início -----------------------------------------------------
              if (ModuloImobiliario.AdminImob.iTipoOperAtualMulta <= 0) or
                 (ModuloImobiliario.AdminImob.iTipoOperAtualJuros <= 0) or
                 (ModuloImobiliario.AdminImob.iTipoOperAtualCM    <= 0) then
              begin
                cdsConcilia.Data := oResultConcilia;
              end else begin
// Daniel - 26461 - Fim --------------------------------------------------------
                 frmAguarde.Mostra('Verificando Débitos do Contrato ' + cdsContratos.FieldByName('CONNUMERO').AsString);
                 cdsConcilia.Data := CtrlConcilia.LookupConciliacao(cdsContratos.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                                                    -1,
                                                                    -1,
                                                                    -1,
                                                                    -1,
                                                                    -1,
                                                                    -1,
                                                                    -1,
                                                                    -1,
                                                                    edtPeriodoIni.Date,
                                                                    edtPeriodoFim.Date,
                                                                    edtDataConfissao.Date,
                                                                    '',
                                                                    False);
                 frmAguarde.Apaga;
              end; // Fim - 26461

              while not cdsConcilia.eof do
              begin
                 if cdsConcilia.FieldByName('CODTIPIMOVEL').AsString = cboTipoImovel.LookupValue then
                 begin
                    cdsDocumentos.Append;
                    cdsDocumentos.FieldByName('FLGESCOLHA').AsInteger          := 1;
                    cdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger        := cdsConcilia.FieldByName('CODDOCUMENTO').AsInteger;
                    cdsDocumentos.FieldByName('COMPETENCIA').AsString          := FormatFloat('00',cdsConcilia.FieldByName('MESCOMPETENCIA').AsFloat) + '/' + FormatFloat('00',cdsConcilia.FieldByName('ANOCOMPETENCIA').AsFloat);
                    cdsDocumentos.FieldByName('DATAVENCTO').AsDateTime         := cdsConcilia.FieldByName('DATAVENCIMENTO').AsDateTime;
                    cdsDocumentos.FieldByName('DATALIMITE').AsDateTime         := cdsConcilia.FieldByName('DATALIMITE').AsDateTime;

                    if cdsConcilia.FieldByName('DATA_BAIXA').IsNull then
                       cdsDocumentos.FieldByName('DATABAIXA').Clear
                    else
                       cdsDocumentos.FieldByName('DATABAIXA').AsDateTime       := cdsConcilia.FieldByName('DATA_BAIXA').AsDateTime;

                    cdsDocumentos.FieldByName('TOT_RECEBIDO').AsCurrency       := cdsConcilia.FieldByName('TOT_RECEBIDO').AsCurrency;
                    cdsDocumentos.FieldByName('TOT_RECEBER').AsCurrency        := cdsConcilia.FieldByName('TOT_RECEBER').AsCurrency;
                    cdsDocumentos.FieldByName('DIFERENCA').AsCurrency          := cdsConcilia.FieldByName('DIFERENCA').AsCurrency;
                    cdsDocumentos.FieldByName('CORRECAO').AsCurrency           := cdsConcilia.FieldByName('CORRECAO').AsCurrency;
                    cdsDocumentos.FieldByName('JUROS').AsCurrency              := cdsConcilia.FieldByName('JUROS').AsCurrency;
                    cdsDocumentos.FieldByName('MULTA').AsCurrency              := cdsConcilia.FieldByName('MULTA').AsCurrency;
                    cdsDocumentos.FieldByName('IDCONTRATOIMOVEL').AsInteger    := cdsConcilia.FieldByName('IDCONTRATOIMOVEL').AsInteger;
                    cdsDocumentos.FieldByName('NOME_EXTENSO').AsString         := cdsConcilia.FieldByName('CONTRATO_EXTENSO').AsString;
                    cdsDocumentos.Post;
                 end;
                 cdsConcilia.Next;
              end;
              cdsContratos.Next;
           end;

           bOk := not cdsDocumentos.IsEmpty;
           if cdsDocumentos.IsEmpty then MsgDlg('Locatário não possui débito para o tipo de imóvel selecionado.',Sistema.NomeModulo,mtInformation,[mbOk],0);
           frmAguarde.Apaga;

        end;
     end;

     if bOk then inherited;
  end
  else
     if PagControle.ActivePage = TabSheet1 then
     begin
        MontaDadosContrato;
        inherited;
     end;

end;



procedure TfrmExecConfissaoDivida.HabilitaBotoes;
begin
   sbtnInsDet.Enabled      := cdsConfDividaImobXOper.State = dsBrowse;
   sbtnAltDet.Enabled      := (cdsConfDividaImobXOper.State = dsBrowse) and (not cdsConfDividaImobXOper.IsEmpty);
   sbtnExcluiDet.Enabled   := (cdsConfDividaImobXOper.State = dsBrowse) and (not cdsConfDividaImobXOper.IsEmpty);
   bbtnOkDet.Enabled       := cdsConfDividaImobXOper.State in dsEditModes;
   bbtnCancelarDet.Enabled := cdsConfDividaImobXOper.State in dsEditModes;
   bbtnVoltarDet.Enabled   := cdsConfDividaImobXOper.State in dsEditModes;

   if bbtnOkDet.Enabled then
   begin
      dbgrdDet.Visible := False;
      dbgrdDet.SendToBack;
   end
   else
   begin
      dbgrdDet.Visible := True;
      dbgrdDet.BringToFront;
   end;
end;



procedure TfrmExecConfissaoDivida.HabilitaBotoesCond;
begin
   btnInsCond.Enabled    := CdsCondPagImovel.State = dsBrowse;
   btnAltCond.Enabled    := (CdsCondPagImovel.State = dsBrowse) and (not CdsCondPagImovel.IsEmpty);
   btnDelCond.Enabled    := (CdsCondPagImovel.State = dsBrowse) and (not CdsCondPagImovel.IsEmpty);
   btnOkCond.Enabled     := CdsCondPagImovel.State in dsEditModes;
   btnCancelCond.Enabled := CdsCondPagImovel.State in dsEditModes;
   btnVoltarCond.Enabled := CdsCondPagImovel.State in dsEditModes;
end;



procedure TfrmExecConfissaoDivida.dsConfissaoOperStateChange(Sender: TObject);
begin
   inherited;
   HabilitaBotoes;
end;



procedure TfrmExecConfissaoDivida.sbtnInsDetClick(Sender: TObject);
begin
   inherited;
   cdsConfDividaImobXOper.Append;
   cdsConfDividaImobXOper.FieldByName('IDCONFDIVIDAIMOB').AsInteger := 1;
   cdsConfDividaImobXOper.FieldByName('FLGDESCCONDIC').AsInteger    := 0;
end;



procedure TfrmExecConfissaoDivida.sbtnAltDetClick(Sender: TObject);
begin
   inherited;
   cdsConfDividaImobXOper.Edit;
end;



procedure TfrmExecConfissaoDivida.sbtnExcluiDetClick(Sender: TObject);
begin
   inherited;
   if MsgDlg('Confirma excluir essa operação?',Sistema.NomeModulo,mtConfirmation,[mbYes,mbNo],0) = mrYes then
      cdsConfDividaImobXOper.Delete;
end;



procedure TfrmExecConfissaoDivida.bbtnOkDetClick(Sender: TObject);
begin
   inherited;
   if cdsConfDividaImobXOper.FieldByName('VLROPERACAO').AsCurrency <> 0 then
      begin
      if cdsConfDividaImobXOper.FieldByName('FLGTIPO').AsString = 'D' then
      begin
         if cdsConfDividaImobXOper.FieldByName('FLGDESCCONDIC').AsInteger = 1 then
            cdsConfDividaImobXOper.FieldByName('DESCCOND').AsString := 'Sim'
         else
            cdsConfDividaImobXOper.FieldByName('DESCCOND').AsString := 'Não'
      end;
      cdsConfDividaImobXOper.Post;
   end;
end;



procedure TfrmExecConfissaoDivida.bbtnCancelarDetClick(Sender: TObject);
begin
   inherited;
   cdsConfDividaImobXOper.Cancel;
end;



procedure TfrmExecConfissaoDivida.bbtnVoltarDetClick(Sender: TObject);
begin
   inherited;
   cdsConfDividaImobXOper.Cancel;
end;



procedure TfrmExecConfissaoDivida.cboTipoOperCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   cdsConfDividaImobXOper.FieldByName('FLGTIPO').AsString  := cdsTipoOper.FieldByName('FLGTIPOOPER').AsString;
   if cdsConfDividaImobXOper.FieldByName('FLGTIPO').AsString = 'A' then
      cdsConfDividaImobXOper.FieldByName('DESCTIPO').AsString := 'Acréscimo'
   else
      cdsConfDividaImobXOper.FieldByName('DESCTIPO').AsString := 'Desconto';

   cdsConfDividaImobXOper.FieldByName('DESCCUSTORECIMO').AsString := cdsTipoOper.FieldByName('DESCCUSTORECIMO').AsString;
   chkDescCondicional.Enabled := cdsConfDividaImobXOper.FieldByName('FLGTIPO').AsString <> 'A';
end;



procedure TfrmExecConfissaoDivida.molLocatario1btnBuscaLocatarioClick(Sender: TObject);
begin
   inherited;
   molLocatario1.btnBuscaLocatarioClick(Sender);
   cdsContratos.Data  := CtrlConfissaoDivida.LookupContratos(molLocatario1.iLocatario);
   edtPeriodoIni.Date := cdsContratos.FieldByName('CONDATAINICIO').AsDateTime;
end;



procedure TfrmExecConfissaoDivida.dbgDebitosUpdateFooter(Sender: TObject);
var
    cdsTemp : TCMClientDataSet;
begin
   inherited;
   fTotal := 0;
   try
     try
        cdsTemp := TCMClientDataSet.Create( nil );
        cdsTemp.Data := cdsDocumentos.Data;
        cdsTemp.First;
        while not cdsTemp.Eof do begin
           if cdsTemp.FieldByName('FLGESCOLHA').AsInteger = 1 then
              fTotal := fTotal + cdsTemp.FieldByName('DIFERENCA').AsFloat;
           cdsTemp.Next
        end;
        dbgDebitos.ColumnByName('DIFERENCA').FooterValue := FormatFloat('###,###0.00', fTotal);
     except

     end;
   finally
     FreeAndNil( cdsTemp );
   end;
end;



procedure TfrmExecConfissaoDivida.dbgDebitosDblClick(Sender: TObject);
begin
   inherited;
   cdsDocumentos.Edit;
   if cdsDocumentos.FieldByName('FLGESCOLHA').AsInteger = 0 then
      cdsDocumentos.FieldByName('FLGESCOLHA').AsInteger := 1
   else
      cdsDocumentos.FieldByName('FLGESCOLHA').AsInteger := 0;
   cdsDocumentos.Post;

   dbgDebitosUpdateFooter(Self);   
end;



procedure TfrmExecConfissaoDivida.btnInverteSelecaoClick(Sender: TObject);
begin
   inherited;
   cdsDocumentos.DisableControls;
   cdsDocumentos.First;
   while not cdsDocumentos.Eof do
   begin
      dbgDebitosDblClick(Self);
      cdsDocumentos.Next;
   end;
   cdsDocumentos.First;
   cdsDocumentos.EnableControls;
   dbgDebitosUpdateFooter(Self);
end;



procedure TfrmExecConfissaoDivida.btnMarcaTodosClick(Sender: TObject);
begin
   inherited;
   cdsDocumentos.DisableControls;
   cdsDocumentos.First;
   while not cdsDocumentos.Eof do
   begin
      cdsDocumentos.Edit;
      cdsDocumentos.FieldByName('FLGESCOLHA').AsInteger := 1;
      cdsDocumentos.Post;
      cdsDocumentos.Next;
   end;
   cdsDocumentos.First;
   cdsDocumentos.EnableControls;
   dbgDebitosUpdateFooter(Self);
end;



procedure TfrmExecConfissaoDivida.dbgDebitosCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   inherited;
   if State <> [gdSelected] then begin
      if not Highlight then begin
         (* linhas ímpares = amarelo, linhas pares = branco *)
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; (* amarelo bebê *)
         end else begin
            ABrush.Color := clWhite;
         end;
      end;

   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecConfissaoDivida.dbgDebitosTopRowChanged(Sender: TObject);
begin
   inherited;
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecConfissaoDivida.btnVoltarClick(Sender: TObject);
begin
   inherited;
   if PagControle.ActivePage = tabSelecao then
   begin
      molLocatario1.btnLimpaLocatario.Click;
      edtPeriodoIni.Clear;
   end;
   if PagControle.ActivePage = TabSheet1 then
   begin
   
   end;
end;



procedure TfrmExecConfissaoDivida.MontaDadosContrato;
begin
   pgctrlDetalhe.ActivePageIndex   := 0;
   molLocatario2.edtLocatario.Text := molLocatario1.edtLocatario.Text;
   molLocatario2.iLocatario        := molLocatario1.iLocatario;
   molLocatario2.sLocatario        := molLocatario1.sLocatario;

   dbgDebitosUpdateFooter(Self);

   cdsConfDividaImobXOper.DisableControls;
   cdsConfDividaImobXOper.First;
   while not cdsConfDividaImobXOper.eof do
   begin
      if cdsConfDividaImobXOper.FieldByName('FLGDESCCONDIC').AsInteger = 0 then
      begin
         if cdsConfDividaImobXOper.FieldByName('FLGTIPO').AsString = 'A' then
            fTotal := fTotal + cdsConfDividaImobXOper.FieldByName('VLROPERACAO').ASCurrency
         else
            fTotal := fTotal - cdsConfDividaImobXOper.FieldByName('VLROPERACAO').ASCurrency;
      end;
      cdsConfDividaImobXOper.Next;
   end;
   cdsConfDividaImobXOper.First;
   cdsConfDividaImobXOper.EnableControls;

   if cdsContratoImovel.IsEmpty then
      cdsContratoImovel.Append
   else
      cdsContratoImovel.Edit;

   cdsContratoImovel.FieldByName('IDLOCATARIO').AsInteger        := molLocatario2.iLocatario;
   cdsContratoImovel.FieldByName('CONVLRAJUSTADO').AsCurrency    := fTotal;
   cdsContratoImovel.FieldByName('CONDATAASSINATURA').AsDateTime := edtDataConfissao.Date;
   cdsContratoImovel.FieldByName('CONDATAINICIO').AsDateTime     := edtDataConfissao.Date;
   cdsContratoImovel.FieldByName('CONDATACARENCIA').AsDateTime   := edtDataConfissao.Date;
   cdsContratoImovel.FieldByName('FLGTIPOCONTRATO').AsString     := 'D';
   cdsContratoImovel.FieldByName('FLGTIPOALUGUEL').AsString      := 'F';
   cdsContratoImovel.FieldByName('FLGSTATUS').AsString           := 'V';
   cdsContratoImovel.FieldByName('IDPESSOA').AsInteger           := Sistema.IdEmpresa;
   cdsContratoImovel.FieldByName('FLGCOBRANCAAUTO').AsInteger    := 1;
   cdsContratoImovel.FieldByName('MOECODIGO').AsInteger          := Modulo.iMoedaCorrente;
   cdsContratoImovel.Post;

   cdsDocumentos.First;
   while not cdsDocumentos.eof do
   begin
      if cdsDocumentos.FieldByName('FLGESCOLHA').AsInteger = 1 then
      begin
         cdsAux.Data := CtrlContratoImovel.LookupContratoXImovel(cdsDocumentos.FieldByName('IDCONTRATOIMOVEL').AsInteger);
         while not cdsAux.eof do
         begin
            if not cdsContratoXImovel.Locate('IDIMOVEL',cdsAux.FieldByName('IDIMOVEL').AsInteger,[]) then
            begin
               cdsContratoXImovel.Append;
               cdsContratoXImovel.FieldByName('IDIMOVEL').AsInteger         := cdsAux.FieldByName('IDIMOVEL').AsInteger;
               cdsContratoXImovel.FieldByName('CIMVLRALUGUEL').AsCurrency   := cdsAux.FieldByName('CIMVLRALUGUEL').AsCurrency;
               cdsContratoXImovel.FieldByName('CIMVLRAJUSTADO').AsCurrency  := 0;
               cdsContratoXImovel.FieldByName('FLGRATEIO').AsFloat          := cdsAux.FieldByName('FLGRATEIO').AsFloat;
               cdsContratoXImovel.FieldByName('CIMPERCENTRATEIO').AsFloat   := cdsAux.FieldByName('CIMPERCENTRATEIO').AsFloat;
               cdsContratoXImovel.FieldByName('CIMDESCRICAO').AsString      := cdsAux.FieldByName('CIMDESCRICAO').AsString;
               cdsContratoXImovel.FieldByName('CODTIPIMOVEL').AsString      := cdsAux.FieldByName('CODTIPIMOVEL').AsString;
               cdsContratoXImovel.FieldByName('IMOCODIGO').AsString         := cdsAux.FieldByName('IMOCODIGO').AsString;
               cdsContratoXImovel.FieldByName('DSC_IMOVEL').AsString        := cdsAux.FieldByName('DSC_IMOVEL').AsString;
               cdsContratoXImovel.FieldByName('DSC_MESTRE').AsString        := cdsAux.FieldByName('DSC_MESTRE').AsString;
               cdsContratoXImovel.Post;
            end;
            cdsAux.Next;
         end;
      end;
      cdsDocumentos.Next;
   end;

end;



procedure TfrmExecConfissaoDivida.btnConfirmarClick(Sender: TObject);
var
   fValorConfissao : Currency;
   liNumLancto     : Integer;
begin
   inherited;
   fValorConfissao := cdsContratoImovel.FieldByName('CONVLRAJUSTADO').AsCurrency;
   
   cdsConfDividaImobXOper.Filter   := '';
   cdsConfDividaImobXOper.Filtered := False;

   cdsContratoImovel.Edit;
   if molAdministradora1.iAdministradora > 0 then cdsContratoImovel.FieldByName('IDADMINIMOVEL').AsInteger := molAdministradora1.iAdministradora;
   if molResponsavel1.iResponsavel > 0       then cdsContratoImovel.FieldByName('IDRESPONSAVEL').AsInteger := molResponsavel1.iResponsavel;
   AjustaTerminoContrato;
   cdsContratoImovel.Post;

   AjustaValorAluguelImovel;

   if VerificaPreenchimentoContrato then
   begin
      if cdsContratoImovel.State    in dsEditModes then cdsContratoImovel.Post;
      if cdsContratoXImovel.State   in dsEditModes then cdsContratoXImovel.Post;
      if CdsContratoXVlrAno.State   in dsEditModes then CdsContratoXVlrAno.Post;
      if CdsAvalistaXContrato.State in dsEditModes then CdsAvalistaXContrato.Post;
      if CdsEventoImovel.State      in dsEditModes then CdsEventoImovel.Post;
      if CdsContratoXDesc.State     in dsEditModes then CdsContratoXDesc.Post;
      if CdsCondPagImovel.State     in dsEditModes then CdsCondPagImovel.Post;

      try
         frmAguarde.Mostra('Gerando contrato de confissão de dívidas.');
         CtrlContratoImovel.OpenTransaction := False;
         StartTransacao;

         if not CtrlContratoImovel.GravaContratoImovel then raise exception.Create( CtrlContratoImovel.MessageInfo )
         else
         begin
            CtrlConfissaoDivida.IdContratoResult := CtrlContratoImovel.IDContratoImovel;

            cdsConfDividaImob.Append;
            cdsConfDividaImob.FieldByName('CDIDATA').AsDateTime         := edtDataConfissao.Date;
            cdsConfDividaImob.FieldByName('IDUSUARIO').AsInteger        := Sistema.IdUsuario;
            cdsConfDividaImob.FieldByName('CDIVALOR').AsCurrency        := fValorConfissao;
            cdsConfDividaImob.Post;

            cdsDocumentos.First;
            while not cdsDocumentos.eof do
            begin
               if cdsDocumentos.FieldByName('FLGESCOLHA').AsInteger = 1 then
               begin
                  if not cdsConfDividaImobXContr.Locate('IDCONTRATOIMOVEL',cdsDocumentos.FieldByName('IDCONTRATOIMOVEL').AsInteger, []) then
                  begin
                     cdsConfDividaImobXContr.Append;
                     cdsConfDividaImobXContr.FieldByName('IDCONTRATOIMOVEL').AsInteger := cdsDocumentos.FieldByName('IDCONTRATOIMOVEL').AsInteger;
                     cdsConfDividaImobXContr.Post;

                     CtrlEventoImovel.RegistraEvento(-1,
                                                     cdsDocumentos.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                                     -1,-1,Sistema.IdUsuario,'CD','Confissão de Dívidas',
                                                     memObs.Lines.Text,
                                                     edtDataConfissao.Date,-1,-1,-1,-1,-1,False);
                  end;

                  if not cdsConfDividaImobXDoc.Locate('CODDOCUMENTO',cdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger, []) then
                  begin

                     {CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
                     CtrlDocumento.PartidaDobrada  := CtrlParamIntegra.PartidaDobrada;
                     CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
                     CtrlDocumento.IdUsuario       := Sistema.idUsuario;
                     CtrlDocumento.IdModulo        := Sistema.idModulo;
                     CtrlDocumento.CodDocumento    := cdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger;
                     CtrlDocumento.OpenTransaction := False;}
                     CtrlImobDocumento.Prepare(OpLanctoDocumImob, odlAlteradorImob);
                     CtrlImobDocumento.PartidaDobrada  := CtrlParamIntegra.PartidaDobrada;
                     CtrlImobDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
                     CtrlImobDocumento.IdUsuario       := Sistema.idUsuario;
                     CtrlImobDocumento.IdModulo        := Sistema.idModulo;
                     CtrlImobDocumento.CodDocumento    := cdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger;
                     CtrlImobDocumento.OpenTransaction := False;

                     liNumLancto := 0;
                     //CtrlDocumento.Lanctodocum.SetValues( edtDataConfissao.Date,
                     CtrlImobDocumento.Lanctodocum.SetValues( edtDataConfissao.Date,
                                                          cdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                                          liNumLancto,
                                                          cdsDocumentos.FieldByName('DIFERENCA').AsFloat,
                                                          0,
                                                          cdsDocumentos.FieldByName('DIFERENCA').AsFloat,
                                                          0,
                                                          0, 0,
                                                          Sistema.idUsuario,
                                                          Sistema.idEmpresa,
                                                          0, 0, 0, 0,
                                                          cdsTipoImovel.FieldByName('CODALTCONFISSAO').AsInteger,
                                                          '4',
                                                          '', '', '',
                                                          'Confissão de Dívida',
                                                          '', '', '',
                                                          'C',
                                                          Sistema.idModulo,
                                                          CtrlParamIntegra.Plano,
                                                          Sistema.UsaPlanoPatro,
                                                          cdsTipoImovel.FieldByName('FLGCTBCONFISSAO').AsInteger = 1);

                     //if not CtrlDocumento.Insert then raise exception.Create( CtrlDocumento.MessageInfo )
                     if not CtrlImobDocumento.Insert then raise exception.Create( CtrlImobDocumento.MessageInfo )
                     else
                     begin
                        //liNumLancto := CtrlDocumento.Lanctodocum.NumLancto;
                        liNumLancto := CtrlImobDocumento.Lanctodocum.NumLancto;
                        cdsConfDividaImobXDoc.Append;
                        cdsConfDividaImobXDoc.FieldByName('IDCONTRATOIMOVEL').AsInteger := cdsDocumentos.FieldByName('IDCONTRATOIMOVEL').AsInteger;
                        cdsConfDividaImobXDoc.FieldByName('CODDOCUMENTO').AsInteger     := cdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger;
                        cdsConfDividaImobXDoc.FieldByName('IDLANCTODOCUMLIQ').Asinteger := liNumLancto;
                        cdsConfDividaImobXDoc.Post;

                        CtrlEventoImovel.RegistraEvento(-1,
                                                        -1,
                                                        -1,
                                                        cdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                                        Sistema.IdUsuario,'CD','Confissão de Dívidas',
                                                        memObs.Lines.Text,
                                                        edtDataConfissao.Date,-1,-1,-1,-1,-1,False);

                     end;
                  end;
               end;
               cdsDocumentos.Next;
            end;

            frmAguarde.Apaga;
            CtrlConfissaoDivida.OpenTransaction := False;
            if not CtrlConfissaoDivida.GravaConfissao then raise exception.Create( CtrlConfissaoDivida.MessageInfo )
            else inherited;
         end;
         frmAguarde.Apaga;
         CommitTransacao;

         MsgDlg('Contrato de Confissão de Dívidas gerado com sucesso','Aviso',mtInformation,[mbOK],0);

         IrParaPagina(0,'');
         InicializaDados;
      except
         on ev : Exception do
         begin
            RollBackTransacao;
            frmAguarde.Apaga;
            MsgDlg(ev.Message, Sistema.NomeModulo, mtError, [mbOk], 0);
         end;
      end;
   end;
end;



procedure TfrmExecConfissaoDivida.dsCondPagImovelStateChange(Sender: TObject);
begin
   inherited;
   HabilitaBotoesCond;
end;



procedure TfrmExecConfissaoDivida.btnInsCondClick(Sender: TObject);
begin
   inherited;
   CdsCondPagImovel.Append;
   cdsCondPagImovel.FieldByName('TIPOCONDPAG').AsString := 'P';
   CdsCondPagImovel.FieldByName('IDCONDPAGIMOVEL').AsInteger := CtrlContratoImovel.GetNextID;
   pnlCondicao.Enabled := True;
end;



procedure TfrmExecConfissaoDivida.btnAltCondClick(Sender: TObject);
begin
   inherited;
   CdsCondPagImovel.Edit;
   pnlCondicao.Enabled := True;
end;



procedure TfrmExecConfissaoDivida.btnDelCondClick(Sender: TObject);
begin
   inherited;
   if MsgDlg('Confirma excluir essa condição?',Sistema.NomeModulo,mtConfirmation,[mbYes,mbNo],0) = mrYes then
      CdsCondPagImovel.Delete;
end;



procedure TfrmExecConfissaoDivida.btnCancelCondClick(Sender: TObject);
begin
   inherited;
   CdsCondPagImovel.Cancel;
   pnlCondicao.Enabled := False;
end;



procedure TfrmExecConfissaoDivida.btnVoltarCOndClick(Sender: TObject);
begin
   inherited;
   CdsCondPagImovel.Cancel;
   pnlCondicao.Enabled := False;
end;



procedure TfrmExecConfissaoDivida.CdsCondPagImovelCalcFields(DataSet: TDataSet);
begin
   inherited;
   if cdsCondPagImovel.FieldByName('TIPOCONDPAG').AsString = 'S' then cdsCondPagImovel.FieldByName('cal_Tipo').AsString := 'Sinal';
   if cdsCondPagImovel.FieldByName('TIPOCONDPAG').AsString = 'V' then cdsCondPagImovel.FieldByName('cal_Tipo').AsString := 'A Vista';
   if cdsCondPagImovel.FieldByName('TIPOCONDPAG').AsString = 'C' then cdsCondPagImovel.FieldByName('cal_Tipo').AsString := 'Caução';
   if cdsCondPagImovel.FieldByName('TIPOCONDPAG').AsString = 'P' then cdsCondPagImovel.FieldByName('cal_Tipo').AsString := 'Parc.';
   if cdsCondPagImovel.FieldByName('TIPOCONDPAG').AsString = 'R' then cdsCondPagImovel.FieldByName('cal_Tipo').AsString := 'Repac.';
end;



procedure TfrmExecConfissaoDivida.InicializaDados;
begin
   molLocatario1.btnLimpaLocatario.Click;
   edtPeriodoIni.Clear;
   edtPeriodoFim.Date    := Date;
   edtDataConfissao.Date := Date;
   memObs.Lines.Clear;
   
   cdsConfDividaImob.Data       := CtrlConfissaoDivida.LookupConfissao(-1);
   cdsConfDividaImobXContr.Data := CtrlConfissaoDivida.LookupConfissaoContratos(-1);
   cdsConfDividaImobXDoc.Data   := CtrlConfissaoDivida.LookupConfissaoDocumentos(-1);
   cdsConfDividaImobXOper.Data  := CtrlConfissaoDivida.LookupConfissaoOperacoes(-1);

   cdsContratoImovel.Data    := CtrlContratoImovel.LookupContratoImovel( -2 );
   cdsContratoXImovel.Data   := CtrlContratoImovel.LookupContratoXImovel(-2);
   CdsContratoXVlrAno.Data   := CtrlContratoImovel.LookupContratoXVlrAno(-2);
   CdsAvalistaXContrato.Data := CtrlContratoImovel.LookupContratoXFiador(-2);
   CdsEventoImovel.Data      := CtrlEventoImovel.LookupEventoImovel( -1, -1, -2, -1, -1, True );
   CdsContratoXDesc.Data     := CtrlContratoImovel.LookupContratoXDesc(-2);
   CdsCondPagImovel.Data     := CtrlContratoImovel.LookupContratoXCondPag(-2);
end;



procedure TfrmExecConfissaoDivida.AjustaValorAluguelImovel;
var
   fValorConfissao : Currency;
   fValorAjustado  : Currency;
   fPercentual     : Real;
begin

   fValorConfissao := cdsContratoImovel.FieldByName('CONVLRAJUSTADO').AsCurrency;

   dbgDebitosUpdateFooter(self);

   cdsDocumentos.First;
   while not cdsDocumentos.eof do
   begin
      if cdsDocumentos.FieldByName('FLGESCOLHA').AsInteger = 1 then
      begin
         cdsAux.Data := CtrlConfissaoDivida.LookupImovelDocumento(cdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger);

         cdsContratoXImovel.First;

         while not cdsAux.eof do
         begin

            cdsImovelAluguel.Data := CtrlConfissaoDivida.LookupImovelDocumento(cdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                                                               cdsAux.FieldByName('IDIMOVEL').AsInteger
                                                                              );

            fValorAjustado := (fValorConfissao * (cdsDocumentos.FieldByName('DIFERENCA').AsCurrency / fTotal) * 100) / 100;

            cdsContratoXImovel.First;

            if cdsContratoXImovel.Locate('IDIMOVEL',cdsAux.FieldByName('IDIMOVEL').AsInteger,[]) then
            begin
               cdsContratoXImovel.Edit;
               cdsContratoXImovel.FieldByName('CIMDTINI').AsDateTime        := cdsContratoImovel.FieldByName('CONDATAINICIO').AsDateTime;
               cdsContratoXImovel.FieldByName('CIMDTFIM').AsDateTime        := cdsContratoImovel.FieldByName('CONDATAFIM').AsDateTime;
               cdsContratoXImovel.FieldByName('CIMVLRAJUSTADO').AsCurrency  := cdsContratoXImovel.FieldByName('CIMVLRAJUSTADO').AsCurrency + fValorAjustado;
               cdsContratoXImovel.FieldByName('CIMVLRALUGUEL').AsCurrency   := cdsContratoXImovel.FieldByName('CIMVLRAJUSTADO').AsCurrency;
               cdsContratoXImovel.Post;
            end;

            cdsAux.Next;
         end;

      end;
      cdsDocumentos.Next;
   end;
   cdsDocumentos.First;

end;



procedure TfrmExecConfissaoDivida.DBcboPaisCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if DBcboPais.Text <> '' then cdsEstado.Data := CtrlEstado.ListaEstado(StrToInt(DBcboPais.LookupValue));
end;



procedure TfrmExecConfissaoDivida.DBcboEstadoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if DBcboEstado.Text <> '' then cdsCidade.Data := CtrlCidade.ListaCidade( cdsEstadoIDPAIS.AsInteger, cdsEstadoIDESTADO.AsInteger );
end;



function TfrmExecConfissaoDivida.TotalizaCondicoes: Boolean;
var
   iTotal : Currency;
begin
   Result := True;
   CdsCondPagImovel.DisableControls;
   CdsCondPagImovel.First;
   iTotal := 0;
   while not CdsCondPagImovel.eof do
   begin
      iTotal := iTotal + CdsCondPagImovel.FieldByName('VLRFINANC').AsCurrency;
      CdsCondPagImovel.Next;
   end;
   CdsCondPagImovel.First;
   CdsCondPagImovel.EnableControls;
   Result := (iTotal = cdsContratoImovel.FieldByName('CONVLRAJUSTADO').AsCurrency);
end;


procedure TfrmExecConfissaoDivida.AjustaTerminoContrato;
var
   dDataFinal   : TDateTime;
   iNumParcelas : Integer;
begin
   iNumParcelas := 0;
   cdsCondPagImovel.First;
   while not cdsCondPagImovel.eof do
   begin
      if cdsCondPagImovel.FieldByName('NUMPARCELAS').AsInteger > iNumParcelas then
         iNumParcelas := cdsCondPagImovel.FieldByName('NUMPARCELAS').AsInteger;

      cdsCondPagImovel.Next;
   end;
   cdsCondPagImovel.First;

   dDataFinal := DiasUteis.SomaMeses(cdsContratoImovel.FieldByName('CONDATAINICIO').AsDateTime,iNumParcelas-1);

   cdsContratoImovel.FieldByName('CONDATAFIM').AsDateTime := dDataFinal;

   cdsCondPagImovel.First;
   while not cdsCondPagImovel.eof do
   begin
      cdsCondPagImovel.Edit;
      cdsCondPagImovel.FieldByName('DATAINI').AsDateTime := cdsContratoImovel.FieldByName('CONDATAINICIO').AsDateTime;

      if cdsCondPagImovel.FieldByName('NUMPARCELAS').AsInteger = 1 then
         cdsCondPagImovel.FieldByName('DATAFIM').AsDateTime := cdsCondPagImovel.FieldByName('DATAVENCIMENTO').AsDateTime
      else
      begin
         cdsCondPagImovel.FieldByName('DATAFIM').AsDateTime := DiasUteis.SomaMeses(cdsContratoImovel.FieldByName('CONDATAINICIO').AsDateTime,cdsCondPagImovel.FieldByName('NUMPARCELAS').AsInteger-1);
      end;
      cdsCondPagImovel.Post;
      cdsCondPagImovel.Next;
   end;
   cdsCondPagImovel.First;
end;



function TfrmExecConfissaoDivida.VerificaPreenchimentoCondicao: Boolean;
begin
   Result := True;
   try

   if cdsCondPagImovel.FieldByName('TIPOCONDPAG').IsNull then
      raise EValidacao.CreateVal('Favor informar o tipo de pagamento', dbrgTipoCond);

   if cdsCondPagImovel.FieldByName('VLRFINANC').IsNull then
      raise EValidacao.CreateVal('Favor informar o valor financiado', edValParc);

   if cdsCondPagImovel.FieldByName('DATAVENCIMENTO').IsNull then
      raise EValidacao.CreateVal('Favor informar a data de vencimento', edDataIniParc);

   if cdsCondPagImovel.FieldByName('NUMPARCELAS').IsNull then
      raise EValidacao.CreateVal('Favor informar o número de parcelas', edtNumParc);

   if cdsCondPagImovel.FieldByName('PERIODO').IsNull then
      raise EValidacao.CreateVal('Favor informar a periodicidade', dbspnPeriodo);

   if cdsCondPagImovel.FieldByName('PRAZO').IsNull then
      raise EValidacao.CreateVal('Favor informar a periodicidade', dbcbPerParc);

   if cdsCondPagImovel.FieldByName('DATAINIAMORTIZ').IsNull then
      raise EValidacao.CreateVal('Favor informar a data de amortização', edtDataAmortiz);

   if cdsCondPagImovel.FieldByName('IDFORMACALCIMOB').IsNull then
      raise EValidacao.CreateVal('Favor informar a forma de cálculo', cboFormaCalculo);

   if dbrgTipoCond.ItemIndex = 1 then
   begin
      if cdsCondPagImovel.FieldByName('TAXAJUROS').IsNull then
         raise EValidacao.CreateVal('Favor informar a taxa de juros', edtJuros);

      if cdsCondPagImovel.FieldByName('PERIODOTAXA').IsNull then
         raise EValidacao.CreateVal('Favor informar a periodicidade da taxa ', dbcbPerJur);
   end;

   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Result := False;
      end;
   end;
end;



procedure TfrmExecConfissaoDivida.dbrgTipoCondChange(Sender: TObject);
begin
  inherited;
   // Desabilita a entrada de juros e correção para A vista, Sinal e Caução
   if dbrgTipoCond.ItemIndex = 0 then
   begin
      lblNumParc.Enabled    := False;
      edtNumParc.Enabled    := False;
      gbIntervalo.Enabled   := False;
      dblcIndCorrec.Enabled := False;
      lblIndCorrec.Enabled  := False;
      lblJuros.Enabled      := False;
      lblPeriod.Enabled     := False;
      lblPerc.Enabled       := False;
      lblPerProj.Enabled    := False;
      lblPerProj2.Enabled   := False;
      edtJuros.Enabled      := False;
      edtPerProj.Enabled    := False;
      dbcbPerJur.Enabled    := False;
      dbspnPeriodo.Enabled  := False;
      dbcbPerParc.Enabled   := False;
      dbedtMesRefReajuste.Enabled := False;

      if cdsCondPagImovel.State in [dsInsert, dsEdit] then
      begin
         cdsCondPagImovel.FieldByName('NUMPARCELAS').AsInteger    := 1;
         cdsCondPagImovel.FieldByName('PERIODO').AsInteger        := 1;
         cdsCondPagImovel.FieldByName('PRAZO').AsString           := 'M';

         cdsCondPagImovel.FieldByName('MESREFREAJUSTE').AsInteger := 0;
         cdsCondPagImovel.FieldByName('TAXAJUROS').AsInteger      := 0;
         cdsCondPagImovel.FieldByName('INDCORRECAO').Clear;
         cdsCondPagImovel.FieldByName('IDINDCORRPROJ').Clear;
      end;
   end
   else
   begin
      lblNumParc.Enabled    := True;
      edtNumParc.Enabled    := True;
      gbIntervalo.Enabled   := True;
      dblcIndCorrec.Enabled := True;
      lblIndCorrec.Enabled  := True;
      lblJuros.Enabled      := True;
      lblPerc.Enabled       := True;
      lblPerProj.Enabled    := True;
      lblPerProj2.Enabled   := True;
      lblPeriod.Enabled     := True;
      edtJuros.Enabled      := True;
      edtPerProj.Enabled    := True;
      dbcbPerJur.Enabled    := True;
      dbspnPeriodo.Enabled  := True;
      dbcbPerParc.Enabled   := True;
      dbedtMesRefReajuste.Enabled := True;
      if cdsCondPagImovel.State in [dsInsert, dsEdit] then
      begin
         cdsCondPagImovel.FieldByName('NUMPARCELAS').AsInteger    := 0;
         cdsCondPagImovel.FieldByName('PERIODO').AsInteger        := 1;
         cdsCondPagImovel.FieldByName('PRAZO').AsString           := 'M';

         cdsCondPagImovel.FieldByName('MESREFREAJUSTE').AsInteger := 0;
         cdsCondPagImovel.FieldByName('TAXAJUROS').AsInteger      := 0;
      end;
   end;
end;



procedure TfrmExecConfissaoDivida.CdsCondPagImovelBeforePost(DataSet: TDataSet);
begin
   inherited;
   if not VerificaPreenchimentoCondicao then Abort;
end;



procedure TfrmExecConfissaoDivida.PagControleChange(Sender: TObject);
begin
   inherited;
   btnConfirmar.Enabled := (PagControle.ActivePage = TabSheet2);
end;



procedure TfrmExecConfissaoDivida.CdsCondPagImovelBeforeDelete(DataSet: TDataSet);
begin
   inherited;
   cdsConfDividaImobXOper.First;
   while not cdsConfDividaImobXOper.eof do
   begin
      if cdsConfDividaImobXOper.FieldByName('IDCONDPAGIMOVEL').AsInteger = CdsCondPagImovel.FieldByName('IDCONDPAGIMOVEL').AsInteger then
      begin
         cdsConfDividaImobXOper.Edit;
         cdsConfDividaImobXOper.FieldByName('IDCONDPAGIMOVEL').Clear;
         cdsConfDividaImobXOper.Post;
      end;
      cdsConfDividaImobXOper.Next;
   end;
   cdsConfDividaImobXOper.First;
end;



procedure TfrmExecConfissaoDivida.dbgDescCondicDblClick(Sender: TObject);
begin
   inherited;
   if not CdsCondPagImovel.IsEmpty then
   begin
      cdsConfDividaImobXOper.Edit;

      if cdsConfDividaImobXOper.FieldByName('FLGESCOLHA').AsInteger = 0 then
         cdsConfDividaImobXOper.FieldByName('FLGESCOLHA').AsInteger := 1
      else
         cdsConfDividaImobXOper.FieldByName('FLGESCOLHA').AsInteger := 0;

      if cdsConfDividaImobXOper.FieldByName('FLGESCOLHA').AsInteger = 1 then
         cdsConfDividaImobXOper.FieldByName('IDCONDPAGIMOVEL').AsInteger := CdsCondPagImovel.FieldByName('IDCONDPAGIMOVEL').AsInteger
      else
         cdsConfDividaImobXOper.FieldByName('IDCONDPAGIMOVEL').Clear;
      cdsConfDividaImobXOper.Post;
   end;
end;



procedure TfrmExecConfissaoDivida.pgctrlDetalheChange(Sender: TObject);
begin
   inherited;
   FiltraDescontos;
end;



procedure TfrmExecConfissaoDivida.btnOkCondClick(Sender: TObject);
begin
   inherited;
   cdsCondPagImovel.Post;
   pnlCondicao.Enabled := False;
end;



procedure TfrmExecConfissaoDivida.cdsConfDividaImobXOperAfterScroll(DataSet: TDataSet);
begin
   inherited;
   HabilitaBotoes;
end;



procedure TfrmExecConfissaoDivida.CdsCondPagImovelAfterScroll(DataSet: TDataSet);
begin
   inherited;
   HabilitaBotoesCond;
   FiltraDescontos;
end;



procedure TfrmExecConfissaoDivida.FiltraDescontos;
begin
   cdsConfDividaImobXOper.Filtered := False;
   cdsConfDividaImobXOper.Filter   := '';

   if pgctrlDetalhe.ActivePage = TabSheet3 then
   begin
      if (not CdsCondPagImovel.IsEmpty) and (not CdsCondPagImovel.FieldByName('IDCONDPAGIMOVEL').IsNUll) then
         cdsConfDividaImobXOper.Filter   := 'FLGDESCCONDIC = 1 AND (IDCONDPAGIMOVEL IS NULL OR IDCONDPAGIMOVEL = ' + CdsCondPagImovel.FieldByName('IDCONDPAGIMOVEL').AsString + ')'
      else
         cdsConfDividaImobXOper.Filter   := 'FLGDESCCONDIC = 1 AND IDCONDPAGIMOVEL IS NULL';

      cdsConfDividaImobXOper.Filtered := True;
   end;
end;



end.
