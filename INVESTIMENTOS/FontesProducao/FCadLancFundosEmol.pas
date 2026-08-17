//******************************************************************************
// Data      : 10/01/2008
// Código    : AL_17
// Pendencia : 26743
// SOL       :
// Desc      : Verificar se existem transferências entre Planos posteriores ao resgate
//******************************************************************************
// Data      : 13/03/2007
// Código    : AL_16
// Motivo    : Ajuste na mensagem de reprocessamento
//******************************************************************************
// Data      : 01/02/2007
// Código    : AL_15
// Pendencia : 24349
// SOL       : 52712
// Desc      : Ajuste no tratamento de erro da rotina AlimentaFundo
//             Criado um parametro novo dom variável para retorno da
//               mensagem de erro
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_14
// Pendencia : 20453
// SOL       : 33866
// Motivo    : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data      : 20/02/2005
// Código    : AL_13
// Motivo    : Implementação da verificação de processo de atualização em andamento
//******************************************************************************
// Data     : 15/06/2005
// Linha(s) : Al_12
// Motivo   : Implementado o parametro IDPEDIDOFUNDO na query "qryConfirmação"
//******************************************************************************
// Data     : 30/05/2005
// Código   : AL_11
// Descr.   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 03/06/2005
// Linha(s) : Al_10
// Motivo   : Implementação da busca do Saldo Sintetico para o resgate
//            Alteração do layout, passando a "Data da Operação" a frente do Fundo de Investimento,
//            devido a rotina da busca de saldo e de cota que está na combo do Fundo.
//******************************************************************************
// Data     : 01/06/2005
// Linha(s) : Al_9
// Motivo   : Implementação do tratamento da Conta Investimento para integração Financeira
//******************************************************************************
// Data     : 01/06/2005
// Linha(s) : Al_8
// Motivo   : Implementação do ActivePage para direcionar o detalhe em uso
//******************************************************************************
// Data     : 31/05/2005
// Linha(s) : Al_7
// Motivo   : Atualização de toda rotina de exclusão do Resgate
//******************************************************************************
// Data     : 31/05/2005
// Linha(s) : Al_6
// Motivo   : Atualização de toda rotina de exclusão da aplicação
//******************************************************************************
// Data     : 31/05/2005
// Linha(s) : Al_5
// Motivo   : Alteração da mensagem de erro para uma similar
//******************************************************************************
// Data     : 31/05/2005
// Linha(s) : Al_4
// Motivo   : Implementação do reprocessamento
//******************************************************************************
// Data     : 31/05/2005
// Linha(s) : Al_3
// Motivo   : Implementação da atualização da tabela operacaofundo com o contabil/financeiro
//******************************************************************************
// Data     : 29/04/2005
// Linha(s) : Al_2
// Motivo   : Alterado a descrição do histórico, para passar apenas o nome do fundo e o plano
//******************************************************************************
// Data     : 20/09/2004
// Linha(s) : Alt_1
// Motivo   : Inclusão da nova concepção para apuração de CPMF sobre as operações de
//            resgate
//******************************************************************************

unit FCadLancFundosEmol;

interface

uses

  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, wwdblook, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  Db, CmEventosCadastro, ImgList, Wwdatsrc, MontaSelect, DBTables, Buttons,
  Mask, DBCtrls, TREdit, Grids, Wwdbigrd, Wwdbgrid, IvDictio,
  IvMulti, IvEMulti, Wwquery, MAHlpBtn, TB97Tlbr, TB97Ctls, TB97, fcLabel,
  ExtCtrls, ComCtrls, FTelaAut, uCtrlInvContab;

type

//******************************************************************************
  TDadosCotas = Record
                 DataCota:TDate;
                 VlrCota :Double;
               End;

//******************************************************************************

  TFrmCadLancFundosEmol = class(TfrmCadastroCSInv)
    QryUltDataFech: TwwQuery;
    QryVerSaldoFech: TwwQuery;
    QryTipoFundo: TwwQuery;
    qryGestorCart: TwwQuery;
    qryGestorCartNOME: TStringField;
    qryGestorCartIDGESTORCARTEIRA: TFloatField;
    qryGestorCartIDPESSOA: TFloatField;
    PnlSelecao: TPanel;
    Label2: TLabel;
    Label7: TLabel;
    Label33: TLabel;
    DtEdDataReferenciaGeral: TCMDateTimePicker;
    DblTipoFundo: TwwDBLookupCombo;
    dblGestorCarteira: TwwDBLookupCombo;
    PnlDetalhe: TPanel;
    PgcSaldos: TPageControl;
    TbsAplicacao: TTabSheet;
    PageControl2: TPageControl;
    TbSheet: TTabSheet;
    DbGrdAplicacao: TwwDBGrid;
    PnlAplicacao: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label15: TLabel;
    DbLkcFundoInvest: TwwDBLookupCombo;
    DbEdValorApl: TDBRealEdit;
    DbEdCota: TDBRealEdit;
    DbEdQtdOper: TDBRealEdit;
    DbDtDataAplicacao: TCMDateTimePicker;
    DbDtDataLiquidacao: TCMDateTimePicker;
    DbDtDataCotizacaoAplic: TCMDateTimePicker;
    Dock977: TDock97;
    Toolbar974: TToolbar97;
    BtIncAplic: TSpeedButton;
    BtAltAplic: TSpeedButton;
    BtExcAplic: TSpeedButton;
    Panel2: TPanel;
    Dock978: TDock97;
    Toolbar975: TToolbar97;
    BtOkAplic: TBitBtn;
    BtCancAplic: TBitBtn;
    BtVoltaAplic: TBitBtn;
    TbsResgate: TTabSheet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DbGrdrResgate: TwwDBGrid;
    pnlResgate: TPanel;
    Label13: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label12: TLabel;
    Label28: TLabel;
    Label4: TLabel;
    Label16: TLabel;
    DbRValorLiquido: TDBRealEdit;
    dbDDataOperacao: TCMDateTimePicker;
    dbDDataLiquidacaoResg: TCMDateTimePicker;
    DbLkcFundoInvestResg: TwwDBLookupCombo;
    Dock974: TDock97;
    Toolbar973: TToolbar97;
    BtOkResg: TBitBtn;
    BtCancResg: TBitBtn;
    BtVoltaResg: TBitBtn;
    rVlrBruto: TDBRealEdit;
    DbEdCotaResg: TDBRealEdit;
    DbDtDataCotizacaoResg: TCMDateTimePicker;
    Panel4: TPanel;
    Dock973: TDock97;
    Toolbar972: TToolbar97;
    BtIncResg: TSpeedButton;
    BtAltResg: TSpeedButton;
    BtExcResg: TSpeedButton;
    TbsSaldo: TTabSheet;
    Panel11: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    Label14: TLabel;
    DbLkcSaldo: TwwDBLookupCombo;
    DbDtRefSaldo: TCMDateTimePicker;
    pnlTotais: TPanel;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBReQtd: TDBRealEdit;
    DBReBruto: TDBRealEdit;
    DBReIRRF: TDBRealEdit;
    DBReIOF: TDBRealEdit;
    DBReLiq: TDBRealEdit;
    Panel10: TPanel;
    dbGrdSaldos: TwwDBGrid;
    QryFundoInvestAplic: TwwQuery;
    QryFundoInvestAplicIDFUNDOINVEST: TFloatField;
    QryFundoInvestAplicDESCFUNDOINVEST: TStringField;
    QryFundoInvestAplicIDGESTORCARTEIRA: TFloatField;
    QryFundoInvestAplicTRGDTINCLUSAO: TDateTimeField;
    QryFundoInvestAplicTRGUSERINCLUSAO: TStringField;
    QryFundoInvestAplicMOECODIGO: TFloatField;
    QryFundoInvestAplicIDTIPOFUNDOINVEST: TFloatField;
    QryFundoInvestAplicCNPJFUNDO: TStringField;
    QryFundoInvestAplicSTAEXCLUSIVO: TStringField;
    QryFundoInvestAplicPZOCARENCIA: TFloatField;
    QryFundoInvestAplicPZOANIVERSARIO: TFloatField;
    QryFundoInvestAplicPZOLIQAPLIC: TFloatField;
    QryFundoInvestAplicPZOLIQRESG: TFloatField;
    QryFundoInvestAplicQTDDECQTD: TFloatField;
    QryFundoInvestAplicQTDDECVALOR: TFloatField;
    QryFundoInvestAplicSTAFUNDO: TStringField;
    QryFundoInvestAplicPZOAMORTIZACAO: TFloatField;
    QryFundoInvestAplicPERCTXPERFORM: TFloatField;
    QryFundoInvestAplicPERCTXADM: TFloatField;
    QryFundoInvestAplicCODFUNCETIP: TStringField;
    QryFundoInvestAplicSTAPROVISIONAIR: TStringField;
    QryFundoInvestAplicSTAPROVISIONAIOF: TStringField;
    QryFundoInvestAplicCONTRCETIP: TStringField;
    QryFundoInvestAplicDATAINICIOFUNDO: TDateTimeField;
    QryFundoInvestAplicPZOCOTAPLIC: TFloatField;
    QryFundoInvestAplicIDCARTEIRAINVEST: TFloatField;
    QryFundoInvestAplicIDTIPOINVEST: TFloatField;
    QryFundoInvestResg: TwwQuery;
    QryFundoInvestResgIDFUNDOINVEST: TFloatField;
    QryFundoInvestResgDESCFUNDOINVEST: TStringField;
    QryFundoInvestResgIDGESTORCARTEIRA: TFloatField;
    QryFundoInvestResgTRGDTINCLUSAO: TDateTimeField;
    QryFundoInvestResgTRGUSERINCLUSAO: TStringField;
    QryFundoInvestResgMOECODIGO: TFloatField;
    QryFundoInvestResgIDCARTEIRAINVEST: TFloatField;
    QryFundoInvestResgIDTIPOFUNDOINVEST: TFloatField;
    QryFundoInvestResgCNPJFUNDO: TStringField;
    QryFundoInvestResgSTAEXCLUSIVO: TStringField;
    QryFundoInvestResgPZOCARENCIA: TFloatField;
    QryFundoInvestResgPZOANIVERSARIO: TFloatField;
    QryFundoInvestResgPZOLIQAPLIC: TFloatField;
    QryFundoInvestResgPZOLIQRESG: TFloatField;
    QryFundoInvestResgQTDDECQTD: TFloatField;
    QryFundoInvestResgQTDDECVALOR: TFloatField;
    QryFundoInvestResgSTAFUNDO: TStringField;
    QryFundoInvestResgPZOAMORTIZACAO: TFloatField;
    QryFundoInvestResgPERCTXPERFORM: TFloatField;
    QryFundoInvestResgPERCTXADM: TFloatField;
    QryFundoInvestResgCODFUNCETIP: TStringField;
    QryFundoInvestResgSTAPROVISIONAIR: TStringField;
    QryFundoInvestResgSTAPROVISIONAIOF: TStringField;
    QryFundoInvestResgCONTRCETIP: TStringField;
    QryFundoInvestResgDATAINICIOFUNDO: TDateTimeField;
    QryFundoInvestResgPZOCOTRESG: TFloatField;
    QryFundoInvestResgIDTIPOINVEST: TFloatField;
    QrySaldoFundoTotal: TwwQuery;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField18: TFloatField;
    QrySaldoFundo: TwwQuery;
    QrySaldoFundoDESCFUNDOINVEST: TStringField;
    QrySaldoFundoDATAAPLICACAO: TDateTimeField;
    QrySaldoFundoDATAMOVFUNDO: TDateTimeField;
    QrySaldoFundoSALDOQTDCOTAS: TFloatField;
    QrySaldoFundoVLRCOTAATUAL: TFloatField;
    QrySaldoFundoSALDOVLRFUNDO: TFloatField;
    QrySaldoFundoVLRIOFPROV: TFloatField;
    QrySaldoFundoVLRIRPROV: TFloatField;
    QrySaldoFundoSALDOLIQUIDO: TFloatField;
    QrySaldoFundoVLRCOTAAPLICACAO: TFloatField;
    QrySaldoFundoVLRAPLICADO: TFloatField;
    QrySaldoFundoIDHISTFUNDO: TFloatField;
    QrySaldoFundoCODDOCUMENTO: TFloatField;
    QrySaldoFundoPLNCODIGO: TFloatField;
    QrySaldoFundoPLANO: TFloatField;
    QrySaldoFundoIDTIPOINVEST: TFloatField;
    QrySaldoFundoIDTIPOOPERACAO: TFloatField;
    QrySaldoFundoIDCARTEIRAINVEST: TFloatField;
    QrySaldoFundoIDFUNDOINVEST: TFloatField;
    QrySaldoFundoHISTMOVFUNDO: TStringField;
    QrySaldoFundoNATURMOVFUNDO: TStringField;
    QrySaldoFundoTIPMOVFUNDO: TStringField;
    QrySaldoFundoVLRVARIACAO: TFloatField;
    QrySaldoFundoCOTASMOVFUNDO: TFloatField;
    QrySaldoFundoVLRMOVFUNDO: TFloatField;
    QrySaldoFundoFLGCALCSALDO: TStringField;
    dsSaldoFundoTotal: TwwDataSource;
    DsSaldoFundo: TwwDataSource;
    QryResgate: TwwQuery;
    QryResgateDESCFUNDOINVEST: TStringField;
    QryResgateCODFUNCETIP: TStringField;
    QryResgateIDPEDIDOFUNDO: TFloatField;
    QryResgateDATAPEDIDO: TDateTimeField;
    QryResgateDATACOTIZACAO: TDateTimeField;
    QryResgateDATALIQUIDACAO: TDateTimeField;
    QryResgateVLRPEDIDO: TFloatField;
    QryResgateSTACONFIRMA: TStringField;
    QryResgateSTATUS: TStringField;
    QryResgateIDTIPOINVEST: TFloatField;
    QryResgateIDTIPOOPERACAO: TFloatField;
    QryResgateIDFUNDOINVEST: TFloatField;
    QryResgateIDFUNDOINVEST_1: TFloatField;
    QryResgateIDGESTORCARTEIRA: TFloatField;
    QryResgateTRGDTINCLUSAO: TDateTimeField;
    QryResgateTRGUSERINCLUSAO: TStringField;
    QryResgateMOECODIGO: TFloatField;
    QryResgateIDCARTEIRAINVEST: TFloatField;
    QryResgateIDTIPOFUNDOINVEST: TFloatField;
    QryResgateCNPJFUNDO: TStringField;
    QryResgateSTAEXCLUSIVO: TStringField;
    QryResgatePZOCARENCIA: TFloatField;
    QryResgatePZOANIVERSARIO: TFloatField;
    QryResgatePZOLIQAPLIC: TFloatField;
    QryResgatePZOLIQRESG: TFloatField;
    QryResgateQTDDECQTD: TFloatField;
    QryResgateQTDDECVALOR: TFloatField;
    QryResgateSTAFUNDO: TStringField;
    QryResgatePZOAMORTIZACAO: TFloatField;
    QryResgatePERCTXPERFORM: TFloatField;
    QryResgatePERCTXADM: TFloatField;
    QryResgateSTAPROVISIONAIR: TStringField;
    QryResgateSTAPROVISIONAIOF: TStringField;
    QryResgateCONTRCETIP: TStringField;
    QryResgateIDTIPOINVEST_1: TFloatField;
    QryResgateIDTIPOOPERACAO_1: TFloatField;
    QryResgateDESCTIPOOPERACAO: TStringField;
    QryResgateNATUREZAOPERACAO: TStringField;
    QryResgateIDPLANOPREV: TFloatField;
    QryResgateIDPATROCINADORA: TFloatField;
    QryResgateIDPLANPREVCTBPATR: TFloatField;
    DsResgate: TwwDataSource;
    QryAplicacao: TwwQuery;
    QryAplicacaoDESCFUNDOINVEST: TStringField;
    QryAplicacaoCODFUNCETIP: TStringField;
    QryAplicacaoIDOPERACAOFUNDO: TFloatField;
    QryAplicacaoDATAOPERACAO: TDateTimeField;
    QryAplicacaoDATACOTIZACAO: TDateTimeField;
    QryAplicacaoDATALIQUIDACAO: TDateTimeField;
    QryAplicacaoVLROPERACAO: TFloatField;
    QryAplicacaoSTACONFIRMA: TStringField;
    QryAplicacaoQTDOPERACAO: TFloatField;
    QryAplicacaoVLRCOTA: TFloatField;
    QryAplicacaoIDFUNDOINVEST: TFloatField;
    QryAplicacaoIDCARTEIRAINVEST: TFloatField;
    QryAplicacaoIDPEDIDOFUNDO: TFloatField;
    QryAplicacaoIDTIPOINVEST: TFloatField;
    QryAplicacaoIDTIPOOPERACAO: TFloatField;
    QryAplicacaoVLRIR: TFloatField;
    QryAplicacaoVLRIOF: TFloatField;
    QryAplicacaoVLRRENDIMENTO: TFloatField;
    QryAplicacaoIDFUNDOINVEST_1: TFloatField;
    QryAplicacaoIDGESTORCARTEIRA: TFloatField;
    QryAplicacaoTRGDTINCLUSAO: TDateTimeField;
    QryAplicacaoTRGUSERINCLUSAO: TStringField;
    QryAplicacaoMOECODIGO: TFloatField;
    QryAplicacaoIDCARTEIRAINVEST_1: TFloatField;
    QryAplicacaoIDTIPOFUNDOINVEST: TFloatField;
    QryAplicacaoCNPJFUNDO: TStringField;
    QryAplicacaoSTAEXCLUSIVO: TStringField;
    QryAplicacaoPZOCARENCIA: TFloatField;
    QryAplicacaoPZOANIVERSARIO: TFloatField;
    QryAplicacaoPZOLIQAPLIC: TFloatField;
    QryAplicacaoPZOLIQRESG: TFloatField;
    QryAplicacaoQTDDECQTD: TFloatField;
    QryAplicacaoQTDDECVALOR: TFloatField;
    QryAplicacaoSTAFUNDO: TStringField;
    QryAplicacaoPZOAMORTIZACAO: TFloatField;
    QryAplicacaoPERCTXPERFORM: TFloatField;
    QryAplicacaoPERCTXADM: TFloatField;
    QryAplicacaoSTAPROVISIONAIR: TStringField;
    QryAplicacaoSTAPROVISIONAIOF: TStringField;
    QryAplicacaoCONTRCETIP: TStringField;
    QryAplicacaoIDTIPOINVEST_1: TFloatField;
    QryAplicacaoIDTIPOOPERACAO_1: TFloatField;
    QryAplicacaoDESCTIPOOPERACAO: TStringField;
    QryAplicacaoNATUREZAOPERACAO: TStringField;
    QryAplicacaoQTDMOSTRA: TStringField;
    QryAplicacaoSTATUS: TStringField;
    QryAplicacaoIDPLANOPREV: TFloatField;
    QryAplicacaoIDPATROCINADORA: TFloatField;
    QryAplicacaoIDPLANPREVCTBPATR: TFloatField;
    QryAplicacaoPZOCOTAPLIC: TFloatField;
    DsAplicacao: TwwDataSource;
    QryFundoInvestOperacao: TwwQuery;
    QryFundoInvestOperacaoIDFUNDOINVEST: TFloatField;
    QryFundoInvestOperacaoDESCFUNDOINVEST: TStringField;
    QryFundoInvestOperacaoIDGESTORCARTEIRA: TFloatField;
    QryFundoInvestOperacaoTRGDTINCLUSAO: TDateTimeField;
    QryFundoInvestOperacaoTRGUSERINCLUSAO: TStringField;
    QryFundoInvestOperacaoMOECODIGO: TFloatField;
    QryFundoInvestOperacaoIDCARTEIRAINVEST: TFloatField;
    QryFundoInvestOperacaoIDTIPOFUNDOINVEST: TFloatField;
    QryFundoInvestOperacaoCNPJFUNDO: TStringField;
    QryFundoInvestOperacaoSTAEXCLUSIVO: TStringField;
    QryFundoInvestOperacaoPZOCARENCIA: TFloatField;
    QryFundoInvestOperacaoPZOANIVERSARIO: TFloatField;
    QryFundoInvestOperacaoPZOLIQAPLIC: TFloatField;
    QryFundoInvestOperacaoPZOLIQRESG: TFloatField;
    QryFundoInvestOperacaoQTDDECQTD: TFloatField;
    QryFundoInvestOperacaoQTDDECVALOR: TFloatField;
    QryFundoInvestOperacaoSTAFUNDO: TStringField;
    QryFundoInvestOperacaoPZOAMORTIZACAO: TFloatField;
    QryFundoInvestOperacaoPERCTXPERFORM: TFloatField;
    QryFundoInvestOperacaoPERCTXADM: TFloatField;
    QryFundoInvestOperacaoCODFUNCETIP: TStringField;
    QryFundoInvestOperacaoSTAPROVISIONAIR: TStringField;
    QryFundoInvestOperacaoSTAPROVISIONAIOF: TStringField;
    QryFundoInvestOperacaoCONTRCETIP: TStringField;
    qryAux: TwwQuery;
    QryTipoOperacao: TwwQuery;
    QryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    QryTipoOperacaoIDTIPOINVEST: TFloatField;
    QryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    QryTipoOperacaoNATUREZAOPERACAO: TStringField;
    DbEdValorComissaoApl: TDBRealEdit;
    Label6: TLabel;
    DbEdTaxasEmolApl: TDBRealEdit;
    Label22: TLabel;
    DbEdCorretagemApl: TDBRealEdit;
    Label29: TLabel;
    DbEdCotaNegApl: TDBRealEdit;
    Label30: TLabel;
    DbEdValorTotalApl: TDBRealEdit;
    Label31: TLabel;
    Label32: TLabel;
    DbEdCotaNegResg: TDBRealEdit;
    Label5: TLabel;
    DbEdValorComissaoResg: TDBRealEdit;
    Label34: TLabel;
    DbEdTaxasEmolResg: TDBRealEdit;
    Label35: TLabel;
    DbEdCorretagemResg: TDBRealEdit;
    Label36: TLabel;
    DbEdValorTotalReg: TDBRealEdit;
    UpdResgate: TUpdateSQL;
    UpdAplicacao: TUpdateSQL;
    QryVerificaOperacao: TwwQuery;
    QryVerAtualizacao: TwwQuery;
    QryAplicacaoVLRCOLOCACAO: TFloatField;
    QryAplicacaoVLRTAXAS: TFloatField;
    QryAplicacaoVLRCORRETAGEM: TFloatField;
    QryParaminvest: TwwQuery;
    QryUpdParaminvest: TwwQuery;
    StringField1: TStringField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    DateTimeField1: TDateTimeField;
    StringField2: TStringField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    StringField5: TStringField;
    FloatField30: TFloatField;
    FloatField31: TFloatField;
    FloatField32: TFloatField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    QryUpdTipoFundoInvest: TwwQuery;
    QryTipoFundoInvest: TwwQuery;
    QryAplicacaoVALORTOTAL: TFloatField;
    QryVerDelAplicacao: TwwQuery;
    QryDelEspecificoApl: TwwQuery;
    QryResgateVLRCOTA: TFloatField;
    QryResgateVLRCOLOCACAO: TFloatField;
    QryResgateVLRTAXAS: TFloatField;
    QryResgateVLRCORRETAGEM: TFloatField;
    QryResgateVALORTOTAL: TFloatField;
    QryUpdPedido: TwwQuery;
    QryVerDelResgate: TwwQuery;
    sbtnMovimento: TToolbarButton97;
    //Al_3
    qryUpdOperacaoFundo: TQuery;
    QryAplicacaoPLANO: TFloatField;
    QryAplicacaoPLNCODIGO: TFloatField;
    QryAplicacaoCODDOCUMENTO: TFloatField;
    //Al_3 - Fim
    //Al_4
    QryFundoInvestAplicDTAINIPROC: TDateTimeField;
    QryFundoInvestResgDTAINIPROC: TDateTimeField;
    //Al_4 - Fim
    //Al_6
    QryPesqHistFundoDel: TwwQuery;
    QyDelHistFundoATU: TwwQuery;
    QryDelHistFundo: TwwQuery;
    QryAplicacaoDTAINIPROC: TDateTimeField;
    QryResgateDTAINIPROC: TDateTimeField;
    //Al_6 - Fim
    procedure FormShow(Sender: TObject);
    procedure DtEdDataReferenciaGeralExit(Sender: TObject);
    procedure DblTipoFundoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblGestorCarteiraCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbLkcSaldoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbDtRefSaldoExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtIncAplicClick(Sender: TObject);
    procedure BtIncResgClick(Sender: TObject);
    procedure BtCancResgClick(Sender: TObject);
    procedure BtCancAplicClick(Sender: TObject);
    procedure DbEdValorAplChange(Sender: TObject);
    procedure DbLkcFundoInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbLkcFundoInvestResgCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure BtOkResgClick(Sender: TObject);
    procedure BtOkAplicClick(Sender: TObject);
    procedure DbEdValorComissaoAplChange(Sender: TObject);
    procedure DbEdValorComissaoResgChange(Sender: TObject);
    procedure DbRValorLiquidoChange(Sender: TObject);
    procedure BtExcAplicClick(Sender: TObject);
    procedure BtExcResgClick(Sender: TObject);
    procedure sbtnMovimentoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
     function  VerificaAplicacao : Boolean;
     function  VerificaResgate   : Boolean;     
     function  VerificaOperacao(sTipoOperacao : String; iFundo : Integer;
                                dData : TDateTime): Boolean;
     function  VerificaAtualizacao(iIdFundo : Integer; dDataIniFdo,dData : TDateTime) : Boolean;
     function  ExcluiResgate(sPedido : String) : Boolean;
                                
     procedure AbreQry;
     procedure AbreQrySaldo;
     procedure AcertaBotoesAplicacao;
     procedure AcertaBotoesResgate;
     procedure SelecionaPageControl;
  public
    { Public declarations }
  end;

var
  FrmCadLancFundosEmol: TFrmCadLancFundosEmol;

implementation

uses UBibliotecaInvest, UDiasUteisInv, UFundoComum, UmensErro,
     UOperComum, dBaseDados, UDataBase, dFundoComum, FConsMovFundos,
  FPrincipal;

{$R *.DFM}

function TFrmCadLancFundosEmol.VerificaAplicacao : Boolean;
Var
   sMessage : String;
Begin
// Testa Dados
  If Trim(DbLkcFundoInvest.Text) = '' Then Begin
    //Al_5
    MsgDlg('Indique o Fundo de Investimento.','Mensagem do Sistema',mtInformation,[mbOk],0);
    if DbLkcFundoInvest.CanFocus Then
       DbLkcFundoInvest.SetFocus;
    // AL_5 - Fim
    Result := False;
    Exit;
  End;

// Data da Aplicação
  If DbDtDataAplicacao.Date = 0 Then Begin
    //Al_5
    MsgDlg('Data da Aplicação não está preenchida.','Mensagem do Sistema',mtInformation,[mbOk],0);
    If DbDtDataAplicacao.CanFocus then
       DbDtDataAplicacao.SetFocus;
    // AL_5 - Fim
    Result := False;
    Exit;
  End;
// Data da Liquidação
  If DbDtDataLiquidacao.Date = 0 Then Begin
    //Al_5
    MsgDlg('Data da Liquidação não está preenchida.','Mensagem do Sistema',mtInformation,[mbOk],0);
    If DbDtDataLiquidacao.CanFocus Then
       DbDtDataLiquidacao.SetFocus;
    // AL_5 - Fim
    Result := False;
    Exit;
  End;
// Valor Aplicado
  If DbEdValorApl.Value <= 0 Then Begin
    //Al_5
    MsgDlg('Valor Aplicado não pode ser menor ou igual a zero.','Mensagem do Sistema',mtInformation,[mbOk],0);
    If DbEdValorApl.CanFocus Then
       DbEdValorApl.SetFocus;
    // AL_5 - Fim
    Result := False;
    Exit;
  End;
// Quantidade Operada
  If (QryAplicacaoDATAOPERACAO.AsDateTime = QryAplicacaoDATACOTIZACAO.AsDateTime) Then
  Begin
    If DbEdQtdOper.Value <= 0 Then Begin
      //Al_5
       MsgDlg('Quantidade Operada não pode ser menor que zero.','Mensagem do Sistema',mtInformation,[mbOk],0);
       If DbEdValorApl.CanFocus then
          DbEdValorApl.SetFocus;
       // AL_5 - Fim
       Result := False;
       Exit;
    End;
  End;

  // AL_11
  //AL_14
  if not CtrlInvContab.TestaPeriodo(DbDtDataAplicacao.Text, iTipoInvestUsu) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if DbDtDataAplicacao.CanFocus then
        DbDtDataAplicacao.SetFocus;
     Result := False;
     Exit;
  end;

  Result := True;
End;

function TFrmCadLancFundosEmol.VerificaResgate : Boolean;
Var
   sMessage : String;
Begin
// Testa Dados
  If Trim(DbLkcFundoInvestResg.Text) = '' Then Begin
    //Al_5
    MsgDlg('Indique o Fundo de Investimento.','Mensagem do Sistema',mtInformation,[mbOk],0);
    if DbLkcFundoInvestResg.CanFocus then
       DbLkcFundoInvestResg.SetFocus;
    //Al_5 - Fim
    Result := False;
    Exit;
  End;

// Data da Operação
  If dbDDataOperacao.Date = 0 Then Begin
    //Al_5
    MsgDlg('Data da Operação não está preenchida.','Mensagem do Sistema',mtInformation,[mbOk],0);
    if dbDDataOperacao.CanFocus then
       dbDDataOperacao.SetFocus;
    //Al_5 - Fim
    Result := False;
    Exit;
  End;
// Data da Liquidação
  If dbDDataLiquidacaoResg.Date = 0 Then Begin
    //Al_5
    MsgDlg('Data da Liquidação não está preenchida.','Mensagem do Sistema',mtInformation,[mbOk],0);
    if dbDDataLiquidacaoResg.CanFocus then
       dbDDataLiquidacaoResg.SetFocus;
    //Al_5 - Fim
    Result := False;
    Exit;
  End;
// Valor Líquido
  If DbRValorLiquido.Value <= 0 Then Begin
    //Al_5
    MsgDlg('Valor Líquido não pode ser menor ou igual a zero.','Mensagem do Sistema',mtInformation,[mbOk],0);
    if DbRValorLiquido.CanFocus then
       DbRValorLiquido.SetFocus;
    //Al_5 - Fim
    Result := False;
    Exit;
  End;

  If DbRValorLiquido.Value > rVlrBruto.Value Then
  Begin
    //Al_5
    MsgDlg('Valor da operação maior que o valor bruto do Fundo.','Messagem do Sistema',mtInformation,[mbOk],0);
    BtAltResg.Down := False;
    BtCancResg.Click;
    Result := False;
    Exit;
  End;

  // AL_11
  //AL_14
  if not CtrlInvContab.TestaPeriodo(dbDDataOperacao.Text, iTipoInvestUsu) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dbDDataOperacao.CanFocus then
        dbDDataOperacao.SetFocus;
     Result := False;
     Exit;
  end;

  Result := True;
End;

function TFrmCadLancFundosEmol.VerificaOperacao(sTipoOperacao : String; iFundo : Integer;
                                dData : TDateTime): Boolean;
begin
   QryVerificaOperacao.Close;
   QryVerificaOperacao.ParamByName('IDFUNDOINVEST').AsInteger    := iFundo;
   QryVerificaOperacao.ParamByName('DATAOPERACAO').AsDateTime    := dData;
   QryVerificaOperacao.ParamByName('NATUREZAOPERACAO').AsString  := sTipoOperacao;
   QryVerificaOperacao.ParamByName('IDPLANPREVCTBPATR').AsInteger:= iPlanPrevCtbPatro;
   QryVerificaOperacao.Open;
   If QryVerificaOperacao.Eof Then
      Result := False
   Else
      Result := True;
end;

Function TFrmCadLancFundosEmol.VerificaAtualizacao(iIdFundo : Integer; dDataIniFdo, dData : TDateTime) : Boolean;
Begin
   Result    := True;
   if dData > dDataIniFdo then  // Não valida se data <= à data de inicio do Fundo
   begin
      QryVerAtualizacao.Close;
      QryVerAtualizacao.ParamByName('DATAMOVFUNDO').AsString       := DateToStr(dData);
      QryVerAtualizacao.ParamByName('IDFUNDOINVEST').AsInteger     := iIdFundo;
      QryVerAtualizacao.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      QryVerAtualizacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      QryVerAtualizacao.Open;

      If QryVerAtualizacao.FieldByName('DATAMOVFUNDO').AsDateTime < dData Then
         Result := False;

      QryVerAtualizacao.Close;
   end;
End;

procedure TFrmCadLancFundosEmol.AbreQry;
begin
// busca fundo que não tiveram aplicacao neste dia.
  With QryFundoInvestOperacao Do Begin
    Close;
    ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
        QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
    If DblTipoFundo.Text = ''  Then ParamByName('IDTIPOFUNDOINVEST').Clear;

    ParamByName('IDGESTORCARTEIRA').AsInteger :=
        qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
    If dblGestorCarteira.Text = ''  Then ParamByName('IDGESTORCARTEIRA').Clear;
    ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
    Open;
  End;

// busca fundo que não tiveram aplicacao neste dia.
  With QryFundoInvestAplic Do Begin
    Close;
    ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
        QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
    If DblTipoFundo.Text = ''  Then ParamByName('IDTIPOFUNDOINVEST').Clear;

    ParamByName('IDGESTORCARTEIRA').AsInteger :=
        qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
    If dblGestorCarteira.Text = ''  Then ParamByName('IDGESTORCARTEIRA').Clear;
    ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
    Open;
  End;

// busca fundo que não tiveram aplicacao neste dia.
  With QryFundoInvestResg Do Begin
    Close;
    ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
        QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
    If DblTipoFundo.Text = ''  Then ParamByName('IDTIPOFUNDOINVEST').Clear;

    ParamByName('IDGESTORCARTEIRA').AsInteger :=
        qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
    If dblGestorCarteira.Text = ''  Then ParamByName('IDGESTORCARTEIRA').Clear;
    ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
    Open;
  End;

// Preenche os Paramentros e refaz a Consulta das Aplicacoes
  With QryAplicacao Do Begin
    Close;
    ParamByName('DATAOPERACAO').AsString:= DtEdDataReferenciaGeral.Text;
    ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
        QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
    If DblTipoFundo.Text = ''  Then ParamByName('IDTIPOFUNDOINVEST').Clear;

    ParamByName('IDGESTORCARTEIRA').AsInteger :=
        QryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
    If dblGestorCarteira.Text = ''  Then ParamByName('IDGESTORCARTEIRA').Clear;

    ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
    ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;

    Open;
  End;

// Preenche os Paramentros e refaz a Consulta dos Resgates
  With QryResgate Do Begin
    Close;
    ParamByName('DATAOPERACAO').AsString:= DtEdDataReferenciaGeral.Text;
    ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
        QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
    If DblTipoFundo.Text = ''  Then
       ParamByName('IDTIPOFUNDOINVEST').Clear;

    ParamByName('IDGESTORCARTEIRA').AsInteger :=
        QryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
    If dblGestorCarteira.Text = ''  Then
       ParamByName('IDGESTORCARTEIRA').Clear;

    ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
    ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;

    Open;
  End;

  PgcSaldos.Enabled    := True;

  If QryAplicacao.Eof Then
     BtExcAplic.Enabled := False
  Else
     BtExcAplic.Enabled := True;

  If QryResgate.Eof Then
     BtExcResg.Enabled := False
  Else
     BtExcResg.Enabled := True;

  SelecionaPageControl;

end;

procedure TFrmCadLancFundosEmol.AbreQrySaldo;
begin
  If Trim(DbDtRefSaldo.Text) = '' Then Exit;

  If Trim(DbLkcSaldo.Text) <> '' Then
  Begin
     QrySaldoFundoVLRCOTAATUAL.DisplayFormat :=
              MontaMascaraDecVlr(QryFundoInvestOperacaoIDFUNDOINVEST.AsInteger);
     QrySaldoFundoSALDOQTDCOTAS.DisplayFormat :=
              MontaMascaraDecQtd(QryFundoInvestOperacaoIDFUNDOINVEST.AsInteger);
  End
  Else
  Begin
     QrySaldoFundoVLRCOTAATUAL.DisplayFormat  :='###,#0.000000000';
     QrySaldoFundoSALDOQTDCOTAS.DisplayFormat :='###,#0.000000000';
  End;

// Preenche os Paramentros e refaz a Consulta dos Saldos
  With QrySaldoFundo Do Begin
    Filtered := False;
    Filter   := '';
    Close;
    If Trim(DbLkcSaldo.Text) = '' Then
      ParamByName('IDFUNDOINVEST').Clear
    Else
      ParamByName('IDFUNDOINVEST').AsString:= DbLkcSaldo.LookupValue;

    If Trim(DbDtRefSaldo.Text) = '' Then
      ParamByName('DATAMOVFUNDO').Clear
    Else
      ParamByName('DATAMOVFUNDO').AsString := DbDtRefSaldo.Text;

    ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                   QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
    If DblTipoFundo.Text = ''  Then ParamByName('IDTIPOFUNDOINVEST').Clear;

    ParamByName('IDGESTORCARTEIRA').AsInteger :=
                   qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
    If dblGestorCarteira.Text = ''  Then ParamByName('IDGESTORCARTEIRA').Clear;

    ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
    ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
    Open;

     // Busca dados do Tipo de Operacao - Fdo Imobiliário, recebto de dividendo, não influência no saldo
    FazQuery(QryAux,'SELECT * FROM TIPOOPERACAO WHERE IDTIPOINVEST='+IntToStr(iTipoInvestUsu)+
                    ' AND NATUREZAOPERACAO =  ''R''');
    If Not QryAux.FieldByName('IDTIPOOPERACAO').IsNull Then
    Begin
       Filter   := 'IDTIPOOPERACAO <> '+QryAux.FieldByName('IDTIPOOPERACAO').AsString;
       Filtered := True;
    End;
    QryAux.Close;
  End;

  With QrySaldoFundoTotal Do Begin
    Close;
    If Trim(DbLkcSaldo.Text) = '' Then
       ParamByName('IDFUNDOINVEST').Clear
    Else
       ParamByName('IDFUNDOINVEST').AsString:= DbLkcSaldo.LookupValue;

    If Trim(DbDtRefSaldo.Text) = '' Then
       ParamByName('DATAMOVFUNDO').Clear
    Else
       ParamByName('DATAMOVFUNDO').AsString := DbDtRefSaldo.Text;

    ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
        QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
    If DblTipoFundo.Text = ''  Then ParamByName('IDTIPOFUNDOINVEST').Clear;

    ParamByName('IDGESTORCARTEIRA').AsInteger :=
                     qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
    If dblGestorCarteira.Text = ''  Then ParamByName('IDGESTORCARTEIRA').Clear;

    ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
    ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
    Open;
  End;
end;

Procedure TFrmCadLancFundosEmol.AcertaBotoesAplicacao;
Begin
// Desabilita Botoes
  BtIncAplic.Enabled := Not BtIncAplic.Enabled;
  BtExcAplic.Enabled := Not BtExcAplic.Enabled;

  BtIncAplic.Down := False;
  BtExcAplic.Down := False;

  BtOkAplic.Enabled    := Not BtOkAplic.Enabled;
  BtCancAplic.Enabled  := Not BtCancAplic.Enabled;
  BtVoltaAplic.Enabled := Not BtVoltaAplic.Enabled;
End;

Procedure TFrmCadLancFundosEmol.AcertaBotoesResgate;
Begin
// Desabilita Botoes
  BtIncResg.Enabled := Not BtIncResg.Enabled;
  BtExcResg.Enabled := Not BtExcResg.Enabled;

  BtIncResg.Down := False;
  BtExcResg.Down := False;

  BtOkResg.Enabled    := Not BtOkResg.Enabled;
  BtCancResg.Enabled  := Not BtCancResg.Enabled;
  BtVoltaResg.Enabled := Not BtVoltaResg.Enabled;
End;

procedure TFrmCadLancFundosEmol.SelecionaPageControl;
begin
   If QryResgate.RecordCount > 0 Then
      PgcSaldos.ActivePage := TbsResgate
   Else If QryAplicacao.RecordCount > 0 Then
      PgcSaldos.ActivePage := TbsAplicacao
   Else
      PgcSaldos.ActivePage := TbsSaldo;
end;

procedure TFrmCadLancFundosEmol.FormShow(Sender: TObject);
begin
  inherited;
  
  PnlResgate.SendToBack;
  PnlAplicacao.SendToBack;

  QryTipoOperacao.Open;
  QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  QryTipoFundo.Open;
  QryGestorCart.Open;
  QryFundoInvestOperacao.Open;

  //Verifica a ultima data de fechamento
  QryUltDataFech.Close;
  QryUltDataFech.ParamByName('IDTIPOINVEST').AsInteger          := iTipoInvestUsu;
  QryUltDataFech.ParamByName('IDTIPOFUNDOINVEST').Clear;
  QryUltDataFech.Open;
  While Not QryUltDataFech.Eof Do
  Begin
     DtEdDataReferenciaGeral.Text := QryUltDataFech.FieldByName('DATAULTFECH').AsString;
     DtEdDataReferenciaGeral.Repaint;

     //Verifica se há saldo
     QryVerSaldoFech.Close;
     QryVerSaldoFech.ParamByName('IDFUNDOINVEST').Clear;
     QryVerSaldoFech.ParamByName('DATAMOVFUNDO').AsString       := DtEdDataReferenciaGeral.Text;
     QryVerSaldoFech.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
     QryVerSaldoFech.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
     QryVerSaldoFech.Open;
     If Not QryVerSaldoFech.IsEmpty Then
        QryUltDataFech.Last;
     QryUltDataFech.Next;
  End;

  QryVerSaldoFech.Close;
  QryUltDataFech.Close;

  DbDtRefSaldo.Text := DtEdDataReferenciaGeral.Text;

  AbreQry;

  AbreQrySaldo;
end;

procedure TFrmCadLancFundosEmol.DtEdDataReferenciaGeralExit(Sender: TObject);
begin
  If Trim(DtEdDataReferenciaGeral.Text) = '' Then
     Exit;
  inherited;
  While not DiasUteisInv.DiaUtil(DtEdDataReferenciaGeral.DateTime,-1,1,'',True,False,False) Do
      DtEdDataReferenciaGeral.DateTime := DtEdDataReferenciaGeral.DateTime + 1;   // Achar o dia útil anterior

  DbDtRefSaldo.Text := DtEdDataReferenciaGeral.Text;

  AbreQry;

  AbreQrySaldo;  

end;

procedure TFrmCadLancFundosEmol.DblTipoFundoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  AbreQry;
  AbreQrySaldo;
end;

procedure TFrmCadLancFundosEmol.dblGestorCarteiraCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  AbreQry;
  AbreQrySaldo;
end;

procedure TFrmCadLancFundosEmol.DbLkcSaldoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   AbreQrySaldo;
end;

procedure TFrmCadLancFundosEmol.DbDtRefSaldoExit(Sender: TObject);
begin
  If Trim(DbDtRefSaldo.Text) = '' Then
     Exit;
  inherited;
  While not DiasUteisInv.DiaUtil(DbDtRefSaldo.DateTime,-1,1,'',True,False,False) Do
      DbDtRefSaldo.DateTime := DbDtRefSaldo.DateTime + 1;   // Achar o dia útil anterior

  AbreQrySaldo;

end;

procedure TFrmCadLancFundosEmol.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
end;

procedure TFrmCadLancFundosEmol.BtIncAplicClick(Sender: TObject);
begin
  inherited;
  Dock978.Visible := True;
// Testa dados
  If (QryAplicacao.Active = False) Then Begin
    //Al_5
    MsgDlg('Consulta não foi executada.','Mensagem do Sistema',mtInformation,[mbOk],0);
    BtIncAplic.Down := False;
    Exit;
  End;

  PnlSelecao.Enabled   := False;
  TbsResgate.Enabled   := False;
  TbsSaldo.Enabled     := False;
  //Al_8
  PgcSaldos.ActivePage := TbsAplicacao;

// Prepara Ambiente
  AcertaBotoesAplicacao;
  PnlAplicacao.BringToFront;

// Insere Registro
  QryAplicacao.Append;
  QryAplicacaoDATAOPERACAO.AsDateTime   := DtEdDataReferenciaGeral.Date;

  //Al_8
  if DbLkcFundoInvest.CanFocus then
     DbLkcFundoInvest.SetFocus;
end;

procedure TFrmCadLancFundosEmol.BtIncResgClick(Sender: TObject);
begin

  rVlrBruto.Clear;
  DbEdCotaResg.Clear;

  inherited;

  Dock974.Visible :=True;

// Testa dados
  If (QryResgate.Active = False) Then Begin
    //Al_5
    MsgDlg('Consulta não foi executada.','Mensagem do Sistema',mtInformation,[mbOk],0);
    BtIncAplic.Down := False;
    Exit;
  End;

  PnlSelecao.Enabled   := False;
  TbsAplicacao.Enabled := False;
  TbsSaldo.Enabled     := False;
  //Al_8
  PgcSaldos.ActivePage := TbsResgate;  
// Prepara Ambiente
  AcertaBotoesResgate;

  PnlResgate.BringToFront;

// Insere Registro
  QryResgate.Append;
  QryResgateDATAPEDIDO.AsDateTime       := DtEdDataReferenciaGeral.Date;
  QryResgateIDPLANPREVCTBPATR.AsInteger := iPlanPrevCtbPatro;

  //Al_8
  if DbLkcFundoInvestResg.CanFocus Then  
     DbLkcFundoInvestResg.SetFocus;
end;

procedure TFrmCadLancFundosEmol.BtCancResgClick(Sender: TObject);
begin
  inherited;
  PnlSelecao.Enabled   := True;
  TbsAplicacao.Enabled := True;
  TbsSaldo.Enabled     := True;

  DbEdCotaResg.Clear;  

  DbLkcFundoInvestResg.Enabled := True;
// Cancela Operacao
  QryResgate.Cancel;
  QryResgate.CancelUpdates;

// Volta Ambiente
  DbGrdrResgate.BringToFront;
  AcertaBotoesResgate;

// Botoes
  BtIncResg.Enabled := True;
  BtExcResg.Enabled := True;
  Dock974.Visible   := False;

// Refresh
  QryResgate.Close;
  QryResgate.Open;

end;

procedure TFrmCadLancFundosEmol.BtCancAplicClick(Sender: TObject);
begin
  inherited;

  DbEdCota.Clear;

  PnlSelecao.Enabled  := True;
  TbsResgate.Enabled  := True;
  TbsSaldo.Enabled    := True;

  DbLkcFundoInvest.Enabled := True;
// Cancela Operacao
  QryAplicacao.Cancel;
  QryAplicacao.CancelUpdates;

// Volta Ambiente
  DbGrdAplicacao.BringToFront;
  AcertaBotoesAplicacao;

// Botoes
  BtIncAplic.Enabled := True;
  BtExcAplic.Enabled := True;
  Dock978.Visible    := False;

// Refresh
  QryAplicacao.Close;
  QryAplicacao.Open;
end;

procedure TFrmCadLancFundosEmol.DbEdValorAplChange(Sender: TObject);
Var
  wStr:String;
begin
  inherited;
  If DbEdCotaNegApl.Value <> 0 Then Begin
    wStr := FloatToStrF((DbEdValorApl.Value / DbEdCotaNegApl.Value),ffFixed,17,
                         QryFundoInvestAplic.FieldByName('QTDDECQTD').AsInteger);
    If QryAplicacao.State In [DsInsert, DsEdit] Then
      QryAplicacao.FieldByName('QTDOPERACAO').AsString:= wStr;
  End
  Else
  Begin
     If DbEdCota.Value <> 0 Then Begin
        wStr := FloatToStrF((DbEdValorApl.Value / DbEdCota.Value),ffFixed,17,
                         QryFundoInvestAplic.FieldByName('QTDDECQTD').AsInteger);
        If QryAplicacao.State In [DsInsert, DsEdit] Then
           QryAplicacao.FieldByName('QTDOPERACAO').AsString:= wStr;
     End;
  End;

  DbEdValorTotalApl.value := DbEdValorApl.value - (DbEdValorComissaoApl.value+
                             DbEdTaxasEmolApl.value+DbEdCorretagemApl.value);  

end;

procedure TFrmCadLancFundosEmol.DbLkcFundoInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
Var
   dDtaCot, dDtaLiq : TDateTime;
   iPz              : Integer;
   DadosCota        : TDadosCota;
begin
  inherited;

   If Trim(DbLkcFundoInvest.Text) = '' Then
      Exit;

   If VerificaOperacao('A', QryFundoInvestAplic.FieldByName('IDFUNDOINVEST').AsInteger,
                        DbDtDataAplicacao.Date) Then
   Begin
      MsgDlg('Já há aplicação para esse Fundo nessa data.','Informação',mtInformation,[mbOk],0);
      BtCancAplic.Click;
      Exit;
   End;

// Preenche Decimais da Quantidade
   DbEdQtdOper.DecDigits   := QryFundoInvestAplic.FieldByName('QTDDECQTD').AsInteger;

   dDtaLiq := OperComum.DataPrazo(DbDtDataAplicacao.Date,
                        QryFundoInvestAplic.FieldByName('PZOLIQAPLIC').AsInteger);
   QryAplicacaoDATALIQUIDACAO.AsDateTime := dDtaLiq;

   QryAplicacaoVLRCOTA.DisplayFormat     :=
                 MontaMascaraDecVlr(QryFundoInvestAplicIDFUNDOINVEST.AsInteger);

   QryAplicacaoQTDOPERACAO.DisplayFormat :=
                 MontaMascaraDecQtd(QryFundoInvestAplicIDFUNDOINVEST.AsInteger);

   DbEdCota.DecDigits    := QryFundoInvestAplicQTDDECVALOR.AsInteger;

   DbEdQtdOper.DecDigits := QryFundoInvestAplicQTDDECQTD.AsInteger;

   QryAplicacaoDATACOTIZACAO.AsDateTime := OperComum.DataPrazo(DbDtDataAplicacao.Date,
                        QryFundoInvestAplic.FieldByName('PZOCOTAPLIC').AsInteger);
// Busca dados da Cota
   DadosCota := UFundoComum.BuscaCotaFundo(QryAux,
                               StrToInt(DbLkcFundoInvest.LookupValue),
                               QryAplicacaoDATACOTIZACAO.AsDateTime);
   If (QryAplicacaoDATACOTIZACAO.AsDateTime =DbDtDataAplicacao.Date) And
      (DadosCota.DataCota = 0) Then Begin
     //Al_5
     MsgDlg('Cota do Fundo não encontrada nesta data.','Mensagem do Sistema',mtInformation,[mbOk],0);
     DbLkcFundoInvest.Clear;
     Exit;
   End Else Begin
     DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
     DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;
     DbEdCota.Value     := DadosCota.VlrCota;
   End;

   DbEdValorApl.SetFocus;

end;

procedure TFrmCadLancFundosEmol.DbLkcFundoInvestResgCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Var
   dDtaCot, dDtaLiq : TDateTime;
   iPz              : Integer;
  DadosCota         : TDadosCota;
begin
  inherited;

   If Trim(DbLkcFundoInvestResg.Text) = '' Then
   Begin
      //Al_8
      If DbLkcFundoInvestResg.CanFocus then
         DbLkcFundoInvestResg.SetFocus;
      Exit;
   End;

   If Not VerificaAtualizacao(QryFundoInvestResg.FieldByName('IDFUNDOINVEST').AsInteger,
                              QryFundoInvestResg.FieldByName('DATAINICIOFUNDO').AsDateTime,
                              dbDDataOperacao.Date) Then
   Begin
      MsgDlg('Há uma aplicação que não foi atualizada para esse dia. Verifique!','Informação',mtInformation,[mbOk],0);
      BtCancResg.Click;
      Exit;
   End;

   If VerificaOperacao('D',QryFundoInvestResg.FieldByName('IDFUNDOINVEST').AsInteger ,
                           dbDDataOperacao.Date) Then
   Begin
      MsgDlg('Já há Resgate para esse Fundo nessa data.','Informação',mtInformation,[mbOk],0);
      BtCancResg.Click;
      Exit;
   End;

   dDtaLiq := OperComum.DataPrazo(dbDDataOperacao.Date, QryResgatePZOLIQRESG.AsInteger);

   QryResgateDATALIQUIDACAO.AsDateTime := dDtaLiq;

   DtEdDataReferenciaGeral.Date        := dDtaLiq;

   DbEdCotaResg.DecDigits    := QryFundoInvestResgQTDDECVALOR.AsInteger;

   QryResgateDATACOTIZACAO.AsDateTime := OperComum.DataPrazo(dbDDataOperacao.Date,
                        QryFundoInvestResg.FieldByName('PZOCOTRESG').AsInteger);

// Busca dados da Cota
   DadosCota := BuscaCotaFundo(QryAux,
                              StrToInt(DbLkcFundoInvestResg.LookupValue),
                              QryResgateDATACOTIZACAO.AsDateTime);

   DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
   DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;

   If (QryResgateDATACOTIZACAO.AsDateTime = dbDDataOperacao.Date) And
      (DadosCota.DataCota = 0) Then Begin
      //Al_5
      MsgDlg('Cota do Fundo não encontrada nesta data.','mensagem do Sistema',mtInformation,[mbOk],0);
      DbLkcFundoInvestResg.Clear;
      Exit;
   End Else Begin
      DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
      DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;
      DbEdCotaResg.Value := DadosCota.VlrCota;
   End;

   //AL_10
   With QrySaldoFundoTotal Do
   Begin
      Close;
      If Trim(DbLkcFundoInvestResg.Text) = '' Then
         ParamByName('IDFUNDOINVEST').Clear
      Else
         ParamByName('IDFUNDOINVEST').AsString:= DbLkcFundoInvestResg.LookupValue;

      If Trim(dbDDataOperacao.Text) = '' Then
         ParamByName('DATAMOVFUNDO').Clear
      Else
         ParamByName('DATAMOVFUNDO').AsString := dbDDataOperacao.Text;

      ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
          QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      If DblTipoFundo.Text = ''  Then ParamByName('IDTIPOFUNDOINVEST').Clear;

      ParamByName('IDGESTORCARTEIRA').AsInteger :=
                       qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
      If dblGestorCarteira.Text = ''  Then ParamByName('IDGESTORCARTEIRA').Clear;

      ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      Open;
   End;

   if DbRValorLiquido.CanFocus Then
      DbRValorLiquido.SetFocus;
   //AL_10 - Fim   
end;

procedure TFrmCadLancFundosEmol.BtOkResgClick(Sender: TObject);
Var
  //AL_15
  sTipoOper, sNaturezaOper, sOperacao, sMens : String;
  //AL_9
  iFlgContaInvest, iIdForCli, iPlanilha, iDocumento, iPlano : Integer;
  fValorOperacao, fValorIR, fVlrCustoAcoes, fVlrVarAcoes : Currency;
  dDataResgateIni, dDataResgateFim : TDateTime;
begin
//  inherited;
  PnlSelecao.Enabled   := True;
  TbsAplicacao.Enabled := True;
  TbsSaldo.Enabled     := True;

  If Not VerificaResgate Then
     Exit;

  //AL_13
  if VerEmAbertura(QryFundoInvestResg.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
     Exit;

  DbEdCotaResg.Clear;     

  // AL_17
  // Verifica se existem Transferência entre planos posterior a data a ser transferida
  If ufundocomum.VerificaTranferenciaPlanos( iTipoInvestUsu,
                                             QryFundoInvestResg.FieldByName('IDFUNDOINVEST').AsInteger,
                                             iPlanPrevCtbPatro,
                                             dbDDataOperacao.Date) then
  Begin
     MsgDlg('Já há Lançamentos de Transferências entre planos para o Fundo com data superior a data de operação'+'.'#13+
            'A operação não será efetuada!','Mensagem do Sistema',mtWarning,[mbOk],0);
     BtCancResgClick(Sender);
     Exit;
  End; // Fim AL_17


  Try
// Inicia Transação
    If not dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;

// Busca dados do Tipo de Operacao
    FazQuery(QryAux,'SELECT * FROM TIPOOPERACAO WHERE IDTIPOINVEST='+QryFundoInvestResg.FieldByName('IDTIPOINVEST').AsString+
                    ' AND IDTIPOOPERACAO = -56');

    sNaturezaOper  := QryAux.FieldByName('NATUREZAOPERACAO').AsString;
    sOperacao      := QryAux.FieldByName('DESCTIPOOPERACAO').AsString;
    //AL_9
    iFlgContaInvest:= QryAux.FieldByName('FLGCONTAINVEST').AsInteger;
// Caso Inserindo Gera sequencial
    If DsResgate.State In [DsInsert] Then
       QryResgate.FieldByName('IDPEDIDOFUNDO').AsInteger:= LeUltRegistro(Nil,'PEDIDOFUNDO');

// Preenche outros dados
    QryResgate.FieldByName('IDTIPOINVEST').AsInteger    :=
                   QryFundoInvestResg.FieldByName('IDTIPOINVEST').AsInteger;

    QryResgate.FieldByName('IDTIPOFUNDOINVEST').AsInteger    :=
                   QryFundoInvestResg.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

    QryResgate.FieldByName('IDTIPOOPERACAO').AsInteger   :=
                           QryAux.FieldByName('IDTIPOOPERACAO').AsInteger;
    QryResgate.FieldByName('NATUREZAOPERACAO').AsString  := sNaturezaOper;

    if QryFundoInvestResg.FieldByName('IDCARTEIRAINVEST').AsInteger = 0 then
       QryResgate.FieldByName('IDCARTEIRAINVEST').Clear
    else
       QryResgate.FieldByName('IDCARTEIRAINVEST').AsInteger :=
                      QryFundoInvestResg.FieldByName('IDCARTEIRAINVEST').AsInteger;

    QryResgate.FieldByName('IDPLANPREVCTBPATR').AsInteger:= iPlanPrevCtbPatro;

    QryResgate.FieldByName('DATAPEDIDO').AsDateTime      := dbDDataOperacao.Date;

    QryResgate.FieldByName('DATACOTIZACAO').AsDateTime   := DbDtDataCotizacaoResg.Date;

    QryResgate.FieldByName('DATALIQUIDACAO').AsDateTime  := dbDDataLiquidacaoResg.Date;

// Confirma Operacao
    QryResgate.Post;
    QryResgate.CommitUpdates;

    QryAux.Close;

    iIdForCli := OperComum.BuscaForCli(QryResgate.FieldByName('IDTIPOINVEST').AsInteger,
                           QryFundoInvestResg.FieldByName('IDGESTORCARTEIRA').AsInteger,
                           QryResgate.FieldByName('IDTIPOOPERACAO').AsInteger,
                           pRPI.IDTIPOCLIENTEEMI);

    iPlanilha  := -1;
    iDocumento := -1;
    iPlano     := -1;    
    If (QryResgateDATAPEDIDO.AsDateTime = QryResgateDATACOTIZACAO.AsDateTime) Then
    Begin
       //Alt_1
       If Not ResgateFACFIF(QryResgate.FieldByName('IDTIPOINVEST').AsInteger,
                            QryResgate.FieldByName('IDPEDIDOFUNDO').AsInteger,
                            QryResgate.FieldByName('IDTIPOOPERACAO').AsInteger,
                            QryResgate.FieldByName('IDCARTEIRAINVEST').AsInteger,
                            QryResgate.FieldByName('IDFUNDOINVEST').AsInteger, -1,
                            QryResgate.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                            QryResgate.FieldByName('DATACOTIZACAO').AsDateTime,
                            QryResgate.FieldByName('DATAPEDIDO').AsDateTime,
                            QryResgate.FieldByName('DATALIQUIDACAO').AsDateTime,0,
                            QryResgate.FieldByName('VLRPEDIDO').AsFloat,
                            QryResgate.FieldByName('VLRCOTA').AsFloat,
                            fVlrCustoAcoes, fVlrVarAcoes) Then
          //Al_5
          Raise Exception.Create('Não foi possível efetuar o Resgate, '+#13+
                                 'Esta operação será Cancelada.');
       With DmFundoComum Do
       Begin
          QryConfirmacao.Close;

          QryConfirmacao.ParamByName('IDFUNDOINVEST').AsInteger     :=
                                     QryResgate.FieldByName('IDFUNDOINVEST').AsInteger;
          QryConfirmacao.ParamByName('IDTIPOOPERACAO').AsInteger    :=
                                               QryResgateIDTIPOOPERACAO.AsInteger;
          QryConfirmacao.ParamByName('DATAOPERACAO').AsString       := dbDDataOperacao.Text;
          QryConfirmacao.ParamByName('DATACOTIZACAO').AsString      :=
                                         QryResgate.FieldByName('DATACOTIZACAO').AsString;
          QryConfirmacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
          //Al_12
          QryConfirmacao.ParamByName('IDPEDIDOFUNDO').AsInteger     :=
                                         QryResgate.FieldByName('IDPEDIDOFUNDO').AsInteger;
          QryConfirmacao.Open;

          fValorIR  := 0;

          While Not QryConfirmacao.Eof Do
          Begin

             If (QryConfirmacaoDATAOPERACAO.AsDateTime <> QryConfirmacaoDATACOTIZACAO.AsDateTime) And
                (QryConfirmacaoQTDOPERACAO.AsFloat = 0) Then
                 sTipoOper := 'CTZ'
             Else
                 sTipoOper := 'OPE';

             //Rotina de confirmação das operações
             //AL_15
             If Not AlimentaFundo(QryConfirmacaoIDTIPOINVEST.AsInteger,
                    QryConfirmacaoIDTIPOOPERACAO.AsInteger,
                    QryConfirmacaoIDCARTEIRAINVEST.AsInteger,
                    QryConfirmacaoIDFUNDOINVEST.AsInteger,
                    iPlanoPrevContab,
                    iPatrocinadora,
                    QryConfirmacaoIDOPERACAOFUNDO.AsInteger,
                    QryConfirmacaoIDOPERACAOORIGEM.AsInteger,
                    QryConfirmacaoQTDDECQTD.AsInteger,
                    QryConfirmacaoIDTIPOFUNDOINVEST.AsInteger,
                    iIdForCli,
                    QryConfirmacaoDATAOPERACAO.AsDateTime,
                    QryConfirmacaoDATACOTIZACAO.AsDateTime,
                    QryConfirmacaoDATALIQUIDACAO.AsDateTime,
                    QryConfirmacaoQTDOPERACAO.AsFloat,  QryConfirmacaoVLRCOTA.AsFloat,
                    QryConfirmacaoVLRLIQUIDO.AsFloat, QryConfirmacaoVLRIR.AsFloat,
                    QryConfirmacaoVLRIOF.AsFloat,
                    sNaturezaOper,
                    sOperacao+' / '+QryConfirmacaoDESCFUNDOINVEST.AsString, sTipoOper , True,
                    iPlanPrevCtbPatro,-1,-1,
                    QryConfirmacaoVLRRENDIMENTO.AsFloat, sMens) Then
                begin
                   //Al_5
                   //AL_15
                   if sMens <> '' then
                      Raise Exception.Create('Não foi possível confirmar o Resgate' + #13 +
                                             'Mensagem: ' + sMens)
                   else
                      Raise Exception.Create('Não foi possível efetuar este Resgate' + #13 +
                                             'Ocorreu um problema durante o processo de gravação' + #13 +
                                             'Refaça a operação');
                end;


             fValorIR       := fValorIR + QryConfirmacaoVLRIR.AsFloat;

             ExecutaQuery(QryAux,
                   'UPDATE OPERACAOFUNDO SET STACONFIRMA = ''S'' WHERE '+
                   '(IDOPERACAOFUNDO   = '''+
                        IntToStr(QryConfirmacaoIDOPERACAOFUNDO.AsInteger)  +''')');
             QryAux.Close;
             QryConfirmacao.Next;

          End;

          QryConfirmacao.Close;

          If iTipoInvestUsu <> 6 Then
          begin
             fVlrCustoAcoes := 0;
             fVlrVarAcoes   := 0;
          end;

          //AL_9
          //Al_2
          If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                  QryResgate.FieldByName('IDTIPOOPERACAO').AsInteger,
                  QryResgate.FieldByName('IDTIPOINVEST').AsInteger,
                  QryResgate.FieldByName('IDCARTEIRAINVEST').AsInteger,
                  QryResgate.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                  iIdForCli,
                  QryResgate.FieldByName('IDFUNDOINVEST').AsInteger,
                  StrToDate(dbDDataOperacao.Text),
                  QryResgate.FieldByName('DATALIQUIDACAO').AsDateTime,
                  sTipoOper, sNaturezaOper,
                  DbLkcFundoInvestResg.Text+' / '+sPlanPrevCtbPatro,
                  True,
                  QryResgate.FieldByName('VLRPEDIDO').AsFloat,
                  fValorIR,
                  QryResgate.FieldByName('VLRCOLOCACAO').AsFloat,
                  QryResgate.FieldByName('VLRTAXAS').AsFloat,
                  QryResgate.FieldByName('VLRCORRETAGEM').AsFloat,
                  fVlrCustoAcoes, fVlrVarAcoes,
                   -1, 0, 0, 0, iFlgContaInvest) Then
          //Al_5
          begin
             dtmBaseDados.dbBaseDados.Rollback;
             BtCancResgClick(Sender);
             Exit;
          end;
          //Al_5 - Fim
          QryAux.Close;
       End;

    End
    Else
    Begin

       If iTipoInvestUsu <> 6 Then
       begin
          fVlrCustoAcoes := 0;
          fVlrVarAcoes   := 0;
       end;

       //AL_9
       //Al_2
       If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
               QryResgate.FieldByName('IDTIPOOPERACAO').AsInteger,
               QryResgate.FieldByName('IDTIPOINVEST').AsInteger,
               QryResgate.FieldByName('IDCARTEIRAINVEST').AsInteger,
               QryResgate.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
               iIdForCli,
               QryResgate.FieldByName('IDFUNDOINVEST').AsInteger,
               StrToDate(dbDDataOperacao.Text),
               QryResgate.FieldByName('DATALIQUIDACAO').AsDateTime,
               'OPE', sNaturezaOper,
               DbLkcFundoInvestResg.Text+' / '+sPlanPrevCtbPatro,
               False,
               QryResgate.FieldByName('VLRPEDIDO').AsFloat,
               0,
               QryResgate.FieldByName('VLRCOLOCACAO').AsFloat,
               QryResgate.FieldByName('VLRTAXAS').AsFloat,
               QryResgate.FieldByName('VLRCORRETAGEM').AsFloat,
               fVlrCustoAcoes, fVlrVarAcoes -1,
               0, 0, 0, iFlgContaInvest) Then
       //Al_5
       begin
          dtmBaseDados.dbBaseDados.Rollback;
          BtCancResgClick(Sender);
          Exit;
       end;
       //Al_5 - fim
    End;

    // Update no Plano,CodDocumento e PlnCodigo na PEDIDOFUNDO
    With QryUpdPedido Do
    Begin
      Close;
      ParamByName('IDPEDIDOFUNDO').AsInteger        := QryResgate.FieldByName('IDPEDIDOFUNDO').AsInteger;
      If iPlanilha <> -1 then
      Begin
         ParamByName('PLANO').AsInteger             := iPlano;
         ParamByName('PLNCODIGO').AsInteger         := iPlanilha;
      End
      Else
      Begin
         ParamByName('PLANO').Clear;
         ParamByName('PLNCODIGO').Clear;
      End;

      If iDocumento <> -1 then
         ParamByName('CODDOCUMENTO').AsInteger      := iDocumento
      Else
         ParamByName('CODDOCUMENTO').Clear;

      ExecSQL;
      Close;
    End;

    QryTipoFundoInvest.Close;
    QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                                          QryFundoInvestResg.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
    QryTipoFundoInvest.Open;

    //Al_4
    If StrToDate(dbDDataOperacao.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
    begin
       If Not Reprocessamento(iTipoInvestUsu,
                              QryFundoInvestResg.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                              QryFundoInvestResg.FieldByName('IDFUNDOINVEST').AsInteger,
                              iPlanPrevCtbPatro,
                              StrToDate(dbDDataOperacao.Text),
                              QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                              QryFundoInvestResg.FieldByName('DTAINIPROC').AsDateTime,
                              True) Then
          //AL_16                    
          MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                 'Mensagem do Sistema', MtInformation,[MbOk],0);
    end;
    //Al_4 - Fim

    QryTipoFundoInvest.Close;

// Confirma Transação
    If dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.Commit;

  Except
    On E:Exception Do Begin
      //Al_5
      MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);

      QryAux.Close;

      QryUpdParaminvest.Close;

      QryUpdTipoFundoInvest.Close;

// Cancela Transação
      dtmBaseDados.dbBaseDados.Rollback;
    End;
  End;

  If QryResgateDATAPEDIDO.AsDateTime > 0 Then
     DtEdDataReferenciaGeral.Date := QryResgateDATAPEDIDO.AsDateTime;

  // Volta Ambiente
  DbGrdrResgate.BringToFront;
  BtIncResg.Enabled := False;
  BtExcResg.Enabled := False;
  Dock974.Visible   := False;
  AcertaBotoesResgate;
  QryResgate.Close;
  QryResgate.Open;
  QrySaldoFundo.Close;
  QrySaldoFundo.Open;
end;

procedure TFrmCadLancFundosEmol.BtOkAplicClick(Sender: TObject);
Var
  //AL_15
  sTipoOper, sNaturezaOper, sOperacao, sMens : String;
  //AL_9
  iFlgContaInvest, iIdForCli, iPlanilha, iDocumento, iPlano : Integer;
  fVlrCustoAcoes, fVlrVarAcoes : Currency;
begin
//  inherited;
   // AL_11 - Inicio
  PnlSelecao.Enabled  := True;
  TbsResgate.Enabled  := True;
  TbsSaldo.Enabled    := True;

  fVlrCustoAcoes      := 0;
  fVlrVarAcoes        := 0;

  If Not VerificaAplicacao Then
     Exit;

  //AL_13
  if VerEmAbertura(QryFundoInvestAplic.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
     Exit;

  DbEdCota.Clear;     

   try // Finally
      Try // Except
         // Inicia Transação
         If not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         // Preenche outros dados
         QryAplicacao.FieldByName('IDOPERACAOFUNDO').AsInteger:= LeUltRegistro(Nil,'OPERACAOFUNDO');

         QryAplicacao.FieldByName('IDTIPOINVEST').AsInteger:=
                                   QryFundoInvestAplic.FieldByName('IDTIPOINVEST').AsInteger;

         QryAplicacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger    :=
                                   QryFundoInvestAplic.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

         // Busca dados do Tipo de Operacao
         FazQuery(QryAux,'SELECT * FROM TIPOOPERACAO WHERE IDTIPOINVEST='+QryFundoInvestAplic.FieldByName('IDTIPOINVEST').AsString+
                         ' AND IDTIPOOPERACAO = -55');

         sNaturezaOper  := QryAux.FieldByName('NATUREZAOPERACAO').AsString;
         sOperacao      := QryAux.FieldByName('DESCTIPOOPERACAO').AsString;
         //AL_9
         iFlgContaInvest:= QryAux.FieldByName('FLGCONTAINVEST').AsInteger;

         QryAplicacao.FieldByName('IDTIPOOPERACAO').AsInteger   :=
                                   QryAux.FieldByName('IDTIPOOPERACAO').AsInteger;

         QryAplicacao.FieldByName('NATUREZAOPERACAO').AsString  := sNaturezaOper;

         if QryFundoInvestAplic.FieldByName('IDCARTEIRAINVEST').AsInteger = 0 then
            QryAplicacao.FieldByName('IDCARTEIRAINVEST').Clear
         else
            QryAplicacao.FieldByName('IDCARTEIRAINVEST').AsInteger :=
                                      QryFundoInvestAplic.FieldByName('IDCARTEIRAINVEST').AsInteger;

         QryAplicacao.FieldByName('QTDDECQTD').AsInteger        :=
                                   QryFundoInvestAplic.FieldByName('QTDDECQTD').AsInteger;

         QryAplicacao.FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

         QryAux.Close;

         // Confirma Operacao
         QryAplicacao.Post;
         QryAplicacao.CommitUpdates;

         iPlanilha  := -1;
         iDocumento := -1;
         iPlano     := -1;

         iIdForCli := OperComum.BuscaForCli(QryAplicacaoIDTIPOINVEST.AsInteger,
                          QryFundoInvestAplicIDGESTORCARTEIRA.AsInteger,
                          QryAplicacaoIDTIPOOPERACAO.AsInteger, pRPI.IDTIPOCLIENTEEMI);

         If (QryAplicacaoDATAOPERACAO.AsDateTime <> QryAplicacaoDATACOTIZACAO.AsDateTime) And
            (QryAplicacaoQTDOPERACAO.AsFloat = 0) Then
            sTipoOper := 'CTZ'
         Else
            sTipoOper := 'OPE';

         //Rotina de confirmação das operações
         //AL_15
         If Not AlimentaFundo(QryAplicacaoIDTIPOINVEST.AsInteger,
                QryAplicacaoIDTIPOOPERACAO.AsInteger,
                QryAplicacaoIDCARTEIRAINVEST.AsInteger,
                QryAplicacaoIDFUNDOINVEST.AsInteger,
                iPlanoPrevContab,
                iPatrocinadora,
                QryAplicacaoIDOPERACAOFUNDO.AsInteger,
                QryAplicacaoIDOPERACAOFUNDO.AsInteger,
                QryAplicacaoQTDDECQTD.AsInteger,
                QryFundoInvestAplicIDTIPOFUNDOINVEST.AsInteger,
                iIdForCli,
                QryAplicacaoDATAOPERACAO.AsDateTime,
                QryAplicacaoDATACOTIZACAO.AsDateTime,
                QryAplicacaoDATALIQUIDACAO.AsDateTime,
                QryAplicacaoQTDOPERACAO.AsFloat, QryAplicacaoVLRCOTA.AsFloat,
                QryAplicacaoVLROPERACAO.AsFloat, 0{IRRF},  0{IOF}, sNaturezaOper,
                Trim(sOperacao)+' / '+QryFundoInvestAplicDESCFUNDOINVEST.AsString, sTipoOper, True,
                iPlanPrevCtbPatro, -1, -1,
                0 {Rendimento}, sMens) Then
         begin
            //Al_5
            //AL_15
            if sMens <> '' then
               Raise Exception.Create('Não foi possível confirmar o Aplicação' + #13 +
                                      'Mensagem: ' + sMens)
            else
               Raise Exception.Create('Não foi possível efetuar este Aplicação' + #13 +
                                      'Ocorreu um problema durante o processo de gravação' + #13 +
                                      'Refaça a operação');
         end;

         //AL_9
         //Al_2
         If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                QryAplicacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                QryAplicacao.FieldByName('IDTIPOINVEST').AsInteger,
                QryAplicacao.FieldByName('IDCARTEIRAINVEST').AsInteger,
                QryAplicacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                iIdForCli,
                QryAplicacao.FieldByName('IDFUNDOINVEST').AsInteger,
                StrToDate(DbDtDataAplicacao.Text),
                StrToDate(DbDtDataLiquidacao.Text),
                'OPE', sNaturezaOper,
                DbLkcFundoInvest.Text+' / '+sPlanPrevCtbPatro,
                True,
                QryAplicacao.FieldByName('VLROPERACAO').AsFloat,
                0,
                QryAplicacao.FieldByName('VLRCOLOCACAO').AsFloat,
                QryAplicacao.FieldByName('VLRTAXAS').AsFloat,
                QryAplicacao.FieldByName('VLRCORRETAGEM').AsFloat,
                fVlrCustoAcoes, fVlrVarAcoes, -1,
                0, 0, 0, iFlgContaInvest) Then
         //Al_5
         begin
            dtmBaseDados.dbBaseDados.Rollback;
            BtCancAplicClick(Sender);
            Exit;
         end;
         //Al_5 - Fim

         //Al_3
         With qryUpdOperacaoFundo Do
         Begin
            Close;
            ParamByName('IDOPERACAOFUNDO').AsInteger      := QryAplicacaoIDOPERACAOFUNDO.AsInteger;
            If iPlanilha <> -1 then
            Begin
               ParamByName('PLANO').AsInteger             := iPlano;
               ParamByName('PLNCODIGO').AsInteger         := iPlanilha;
            End
            Else
            Begin
               ParamByName('PLANO').Clear;
               ParamByName('PLNCODIGO').Clear;
            End;

            If iDocumento <> -1 then
               ParamByName('CODDOCUMENTO').AsInteger      := iDocumento
            Else
               ParamByName('CODDOCUMENTO').Clear;

            ExecSQL;
            Close;
         End;
         //Al_3 - Fim

         // Confirma Transação
         dtmBaseDados.dbBaseDados.Commit;

         QryTipoFundoInvest.Close;
         QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                            QryFundoInvestAplic.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
         QryTipoFundoInvest.Open;

         //Al_4
         If StrToDate(DbDtDataAplicacao.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
         begin
            If Not Reprocessamento(iTipoInvestUsu,
                                   QryFundoInvestAplic.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                   QryFundoInvestAplic.FieldByName('IDFUNDOINVEST').AsInteger,
                                   iPlanPrevCtbPatro,
                                   StrToDate(DbDtDataAplicacao.Text),
                                   QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                   QryFundoInvestAplic.FieldByName('DTAINIPROC').AsDateTime,
                                   True) Then
               //AL_16
               MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                      'Mensagem do Sistema', MtInformation,[MbOk],0);
         end;
         //Al_4 - Fim

      Except
         On E:Exception Do
         Begin
           //Al_5
           MsgDlg('Não foi possível efetuar a Operação:'#13+
                  E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
           dtmBaseDados.dbBaseDados.Rollback;
           QryAux.Close;
           //Al_5
         End;
      End;
   finally
      if QryAplicacaoDATAOPERACAO.AsDateTime > 0 then
         DtEdDataReferenciaGeral.Date := QryAplicacaoDATAOPERACAO.AsDateTime;

      QryAplicacao.Close;
      QryAplicacao.Open;
      QrySaldoFundo.Close;
      QrySaldoFundo.Open;

      // Volta Ambiente
      DbGrdAplicacao.BringToFront;

      BtIncAplic.Enabled := False;
      BtExcAplic.Enabled := False;
      Dock978.Visible    := False;

      AcertaBotoesAplicacao;

      // Busca fundo que não tiveram aplicacao neste dia.
      With QryFundoInvestAplic Do Begin
        Close;
        Open;
      End;
   end;
   // AL_11 - fim
end;

procedure TFrmCadLancFundosEmol.DbEdValorComissaoAplChange(
  Sender: TObject);
begin
  inherited;
  DbEdValorTotalApl.value := DbEdValorApl.value - (DbEdValorComissaoApl.value+
                             DbEdTaxasEmolApl.value+DbEdCorretagemApl.value);
end;

procedure TFrmCadLancFundosEmol.DbEdValorComissaoResgChange(
  Sender: TObject);
begin
  inherited;
  DbEdValorTotalReg.value := DbRValorLiquido.value - (DbEdValorComissaoResg.value+
                             DbEdTaxasEmolResg.value+DbEdCorretagemResg.value);
end;

procedure TFrmCadLancFundosEmol.DbRValorLiquidoChange(Sender: TObject);
Var
   wStr : String;
begin
  inherited;

  DbEdValorTotalReg.value := DbRValorLiquido.value - (DbEdValorComissaoResg.value+
                             DbEdTaxasEmolResg.value+DbEdCorretagemResg.value);
end;

//Al_6
procedure TFrmCadLancFundosEmol.BtExcAplicClick(Sender: TObject);
Var
   dDataIniProc, dDataOper : TDateTime;
   iTipoFundoInvest, iFundoInvest : Integer;

   ftotvlraplicado,
   ftotcotasmovfundo,
   ftotvlrmovfundo,
   ftotsaldoqtdcotas,
   ftotsaldovlrfundo,
   ftotvlrcustoatual     : Extended;

   iIdTipoInvestAtu      : Integer;
   iIdTipoOperacaoAtu    : Integer;
   iIdCarteiraInvestAtu  : Integer;
   iIdFundoInvestAtu     : Integer;
   dDataAplicacaoAtu     : TDateTime;
   dDataMovFundoAtu      : TDateTime;
   sNaturMovFundoAtu     : String;
   sTipMovFundoAtu       : String;
   iIdPlanPrevCtbPatrAtu : Integer;

begin
   inherited;
   // AL_11 - Inicio
   // Testa dados
   //AL_5
   If (QryAplicacao.Active = False) Or (QryAplicacao.IsEmpty = True) Then Begin
      MsgDlg('Não foi executada a Consulta.','Mensagem de Sistema',mtInformation,[mbOk],0);
      BtExcAplic.Down := False;
      Exit;
   End;
   //AL_5 - Fim

   //AL_14
   if not CtrlInvContab.TestaPeriodo(QryAplicacaoDATAOPERACAO.AsString, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      BtExcAplic.Down := False;
      Exit;
   end;

   //AL_13
   if VerEmAbertura(QryAplicacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
      Exit;

   try // Finally
      If MsgDlg('Confirma Exclusão ?','Mensagem do Sistema', mtInformation, [mbYes, mbNo],0) = mrYes  Then
      Begin
         Try // Except
            QryTipoFundoInvest.Close;
            QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                               QryAplicacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
            QryTipoFundoInvest.Open;

            iTipoFundoInvest := QryAplicacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
            iFundoInvest     := QryAplicacao.FieldByName('IDFUNDOINVEST').AsInteger;
            dDataOper        := QryAplicacao.FieldByName('DATAOPERACAO').AsDateTime;
            dDataIniProc     := QryAplicacao.FieldByName('DTAINIPROC').AsDateTime;

            // Inicia Transação
            If not dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.StartTransaction;

            // Exclui Dados do Historico
            If Not ProcExcluiFundo(QryAplicacao.FieldByName('CODDOCUMENTO').AsInteger,
                                   QryAplicacao.FieldByName('PLNCODIGO').AsInteger,
                                   QryAplicacao.FieldByName('PLANO').AsInteger,
                                   QryAplicacao.FieldByName('IDTIPOINVEST').AsInteger,
                                   QryAplicacao.FieldByName('DATAOPERACAO').AsDateTime, True) Then
            Begin
               dtmBaseDados.dbBaseDados.Rollback;
               Exit;
            End;

            If Not ExecutaQuery(QryAux,'DELETE FROM HISTFUNDO WHERE IDOPERACAOFUNDO = '+
                                       QryAplicacao.FieldByName('IDOPERACAOFUNDO').AsString) Then
            begin
              dtmBaseDados.dbBaseDados.Rollback;
              Exit;
            end;

            If dDataOper <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
            begin
               // Exclui Operacao de Aplicacao
               QryAplicacao.Delete;
               QryAplicacao.CommitUpdates;

               //Confirma Transação
               dtmBaseDados.dbBaseDados.Commit;

               If Not Reprocessamento(iTipoInvestUsu, iTipoFundoInvest, iFundoInvest,
                                      iPlanPrevCtbPatro, dDataOper,
                                      QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                      dDataIniProc,
                                      True) Then
                  //AL_16
                  MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                         'Mensagem do Sistema', MtInformation,[MbOk],0);
            end
            else
            begin
               //AL_10
               {*** EXLUI HISTORICO DA OPERAÇÃP/ATU ***}
               QryPesqHistFundoDel.ParamByName('IDOPERACAOFUNDO').AsInteger := QryAplicacao.FieldByName('IDOPERACAOFUNDO').AsInteger;
               QryPesqHistFundoDel.Open;

               iIdTipoInvestAtu      := QryPesqHistFundoDel.FieldByName('IDTIPOINVEST').AsInteger;
               iIdTipoOperacaoAtu    := QryPesqHistFundoDel.FieldByName('IDTIPOOPERACAO').AsInteger;
               iIdCarteiraInvestAtu  := QryPesqHistFundoDel.FieldByName('IDCARTEIRAINVEST').AsInteger;
               iIdFundoInvestAtu     := QryPesqHistFundoDel.FieldByName('IDFUNDOINVEST').AsInteger;
               dDataAplicacaoAtu     := QryPesqHistFundoDel.FieldByName('DATAAPLICACAO').AsDateTime;
               dDataMovFundoAtu      := QryPesqHistFundoDel.FieldByName('DATAMOVFUNDO').AsDateTime;
               sNaturMovFundoAtu     := QryPesqHistFundoDel.FieldByName('NATURMOVFUNDO').AsString;
               sTipMovFundoAtu       := QryPesqHistFundoDel.FieldByName('TIPMOVFUNDO').AsString;
               iIdPlanPrevCtbPatrAtu := QryPesqHistFundoDel.FieldByName('IDPLANPREVCTBPATR').AsInteger;

               QyDelHistFundoATU.ParamByName('IDTIPOINVEST').AsInteger      := iIdTipoInvestAtu;
               QyDelHistFundoATU.ParamByName('IDTIPOOPERACAO').AsInteger    := iIdTipoOperacaoAtu;
               QyDelHistFundoATU.ParamByName('IDCARTEIRAINVEST').AsInteger  := iIdCarteiraInvestAtu;
               QyDelHistFundoATU.ParamByName('IDFUNDOINVEST').AsInteger     := iIdFundoInvestAtu;
               QyDelHistFundoATU.ParamByName('DATAAPLICACAO').AsDateTime    := dDataAplicacaoAtu;
               QyDelHistFundoATU.ParamByName('DATAMOVFUNDO').AsDateTime     := dDataMovFundoAtu;
               QyDelHistFundoATU.ParamByName('NATURMOVFUNDO').AsString      := sNaturMovFundoAtu;
               QyDelHistFundoATU.ParamByName('IDPLANPREVCTBPATR').AsInteger := iIdPlanPrevCtbPatrAtu;
               QyDelHistFundoATU.ExecSQL;

               QryDelHistFundo.ParamByName('IDHISTFUNDO').AsInteger := QryPesqHistFundoDel.FieldByName('IDHISTFUNDO').AsInteger;
               QryDelHistFundo.ExecSQL;

               QryPesqHistFundoDel.Close;

               {*** INSERE REGISTRO ATU ***}
               DmFundoComum.QryPesqAplicMesmoDia.Close;
               DmFundoComum.QryPesqAplicMesmoDia.ParamByName('IDTIPOINVEST').AsInteger      := iIdTipoInvestAtu;
               DmFundoComum.QryPesqAplicMesmoDia.ParamByName('IDCARTEIRAINVEST').AsInteger  := iIdCarteiraInvestAtu;
               DmFundoComum.QryPesqAplicMesmoDia.ParamByName('IDFUNDOINVEST').AsInteger     := iIdFundoInvestAtu;
               DmFundoComum.QryPesqAplicMesmoDia.ParamByName('DATAAPLICACAO').AsDateTime    := dDataAplicacaoAtu;
               DmFundoComum.QryPesqAplicMesmoDia.ParamByName('DATAMOVFUNDO').AsDateTime     := dDataMovFundoAtu;
               DmFundoComum.QryPesqAplicMesmoDia.ParamByName('NATURMOVFUNDO').AsString      := sNaturMovFundoAtu;
               DmFundoComum.QryPesqAplicMesmoDia.ParamByName('TIPMOVFUNDO').AsString        := sTipMovFundoAtu;
               DmFundoComum.QryPesqAplicMesmoDia.ParamByName('IDPLANPREVCTBPATR').AsInteger := iIdPlanPrevCtbPatrAtu;
               DmFundoComum.QryPesqAplicMesmoDia.Open;
               DmFundoComum.QryPesqAplicMesmoDia.First;

               if DmFundoComum.QryPesqAplicMesmoDia.RecordCount > 1 then
               begin
                  fTotVlrAplicado   := 0;
                  fTotCotasMovFundo := 0;
                  fTotVlrMovFundo   := 0;
                  fTotSaldoQtdCotas := 0;
                  fTotSaldoVlrFundo := 0;
                  fTotVlrCustoAtual := 0;

                  while not (DmFundoComum.QryPesqAplicMesmoDia.Eof) do
                  begin
                     fTotVlrAplicado   := fTotVlrAplicado   + DmFundoComum.QryPesqAplicMesmoDia.FieldByName('VLRAPLICADO').AsFloat;
                     fTotCotasMovFundo := fTotCotasMovFundo + DmFundoComum.QryPesqAplicMesmoDia.FieldByName('COTASMOVFUNDO').AsFloat;
                     fTotVlrMovFundo   := fTotVlrMovFundo   + DmFundoComum.QryPesqAplicMesmoDia.FieldByName('VLRMOVFUNDO').AsFloat;
                     fTotSaldoQtdCotas := fTotSaldoQtdCotas + DmFundoComum.QryPesqAplicMesmoDia.FieldByName('SALDOQTDCOTAS').AsFloat;
                     fTotSaldoVlrFundo := fTotSaldoVlrFundo + DmFundoComum.QryPesqAplicMesmoDia.FieldByName('SALDOVLRFUNDO').AsFloat;
                     fTotVlrCustoAtual := fTotVlrCustoAtual + DmFundoComum.QryPesqAplicMesmoDia.FieldByName('VLRCUSTOATUAL').AsFloat;

                     DmFundoComum.QryPesqAplicMesmoDia.Next;
                  end;

                  // CASO EXISTA MAIS DE UM REGISTRO, FAZ A SOMA DOS DEMAIS E GRAVA NA HISTFUNDO.
                  if not UFundoComum.GravaAplicacaoResgate(DmFundoComum.QryPesqAplicMesmoDia.FieldByName('IDTIPOINVEST').AsInteger,
                                                           DmFundoComum.QryPesqAplicMesmoDia.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                           DmFundoComum.QryPesqAplicMesmoDia.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                           DmFundoComum.QryPesqAplicMesmoDia.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                                           DmFundoComum.QryPesqAplicMesmoDia.FieldByName('IDFUNDOINVEST').AsInteger,
                                                           DmFundoComum.QryPesqAplicMesmoDia.FieldByName('DATAAPLICACAO').AsDateTime,
                                                           DmFundoComum.QryPesqAplicMesmoDia.FieldByName('DATAMOVFUNDO').AsDateTime,
                                                           DmFundoComum.QryPesqAplicMesmoDia.FieldByName('DATAULTPGTOIR').AsDateTime,
                                                           DmFundoComum.QryPesqAplicMesmoDia.FieldByName('HISTMOVFUNDO').AsString,
                                                           DmFundoComum.QryPesqAplicMesmoDia.FieldByName('NATURMOVFUNDO').AsString,
                                                           'ATU',
                                                           fTotVlrAplicado,
                                                           fTotVlrMovFundo,
                                                           0,
                                                           0,
                                                           0,
                                                           fTotCotasMovFundo,
                                                           fTotSaldoQtdCotas,
                                                           fTotSaldoVlrFundo,
                                                           (fTotSaldoVlrFundo / fTotSaldoQtdCotas), // AL_11
                                                           fTotVlrCustoAtual,
                                                           DmFundoComum.QryPesqAplicMesmoDia.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                           -1,
                                                           DmFundoComum.QryPesqAplicMesmoDia.FieldByName('IDCOMPOSICAOFUNDO').AsInteger,
                                                           DmFundoComum.QryPesqAplicMesmoDia.FieldByName('IDTIPOCOTA').AsInteger) then
                  begin
                     //Cancela Transação
                     dtmBaseDados.dbBaseDados.Rollback;
                     Exit;
                  end;
               end;

               DmFundoComum.QryPesqAplicMesmoDia.Close;

               // Exclui Operacao de Aplicacao
               QryAplicacao.Delete;
               QryAplicacao.CommitUpdates;
               //Confirma Transação
               dtmBaseDados.dbBaseDados.Commit;
               MsgDlg('Processo Concluído.','Mensagem do Sistema',mtInformation ,[mbOk],0);
            end;
            QryTipoFundoInvest.Close;
         Except
            On E:Exception Do
            Begin
               //AL_5
               MsgDlg('Não foi possível excluir a Operação:'#13+
                      E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
               //AL_5 - Fim
               dtmBaseDados.dbBaseDados.Rollback;
            End;
         End; // Except
      End; // If Exclui
   finally
      QryFundoInvestAplic.Close;
      QryFundoInvestAplic.Open;
      If QryAplicacao.Eof Then
      Begin
         BtIncAplic.Enabled := True;
         BtExcAplic.Enabled := False;
      End;
      BtExcAplic.Down := False;
   end;
   // AL_11 - Fim
end;
//Al_6 - Fim

//Al_7
procedure TFrmCadLancFundosEmol.BtExcResgClick(Sender: TObject);
Var
  wStr      : String;
  iFundo, iTipFdoInvest    : Integer;
  dDataIniProc, dDataResgateIni, dDataResgateFim, dDataOper : TDateTime;
begin
   inherited;
   // AL_11 - Inicio
   // Testa dados
   If (QryResgate.Active = False) Or (QryResgate.IsEmpty = True) Then 
   Begin
      //Al_5
      MsgDlg('Não foi executada a Consulta.','Mensagem do Sitema',mtInformation,[mbOk],0);
      BtExcAplic.Down := False;
      Exit;
   End;

   //AL_14
   if not CtrlInvContab.TestaPeriodo(QryResgateDATAPEDIDO.AsString, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      BtExcAplic.Down := False;
      Exit;
   end;

   //AL_13
   if VerEmAbertura(QryResgate.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
      Exit;

   try // Finally

      If MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation, [mbYes, mbNo],0) = mrYes Then
      Begin
         Try
            QryTipoFundoInvest.Close;
            QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                               QryResgate.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
            QryTipoFundoInvest.Open;

            iTipFdoInvest := QryResgate.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
            iFundo        := QryResgate.FieldByName('IDFUNDOINVEST').AsInteger;
            dDataOper     := QryResgate.FieldByName('DATAPEDIDO').AsDateTime;
            dDataIniProc  := QryResgate.FieldByName('DTAINIPROC').AsDateTime;

            // Inicia Transação
            If not dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.StartTransaction;

            // Deleta o resgate do dia em todas as tabelas do Sistema(Fundo, Financeiro e Contabilidade)
            If Not ExcluiResgate(QryResgate.FieldByName('IDPEDIDOFUNDO').AsString) Then
            Begin
               BtExcResg.Down      := False;
               If dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.Rollback;
               QryResgate.Close;
               QryResgate.Open;
               Exit;
            End;

            // Exclui o resgate da tabela PEDIDOFUNDO
            QryResgate.Delete;
            QryResgate.CommitUpdates;

            // Confirma Transação
            If dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Commit;

            If dDataOper <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
            begin
               If Not Reprocessamento(iTipoInvestUsu, iTipFdoInvest, iFundo, iPlanPrevCtbPatro,
                                      dDataOper,
                                      QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                      dDataIniProc,
                                      True) Then
                  //AL_16
                  MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                         'Mensagem do Sistema', MtInformation,[MbOk],0);
            end;

            QryTipoFundoInvest.Close;

         Except
            On E:Exception Do
            Begin
               //Al_5
               MsgDlg('Não foi possível excluir a Operação:'+#13+
                      E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
               BtExcResg.Down      := False;
               // Cancela Transação
               If dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.Rollback;
               QryResgate.Close;
               QryResgate.Open;
               Exit;
            End;
         End; // Except
      End; // If Exclui
   finally
      If QryResgate.Eof Then
      Begin
        BtIncResg.Enabled := True;
        BtExcResg.Enabled := False;
      End;
      BtExcResg.Down       := False;
      MsgDlg('Processo Concluído.','Mensagem do Sistema',mtInformation ,[mbOk],0);
   end;
   // AL_11 - Fim
end;
//Al_7 - Fim

function TFrmCadLancFundosEmol.ExcluiResgate(sPedido : String) : Boolean;
Var
   wStr : String;
begin
   QryVerDelResgate.Close;
   QryVerDelResgate.ParamByName('IDPEDIDOFUNDO').AsInteger := StrToInt(sPedido);
   QryVerDelResgate.Open;

   wStr :=
    'UPDATE PEDIDOFUNDO SET PLANO = NULL, PLNCODIGO = NULL, CODDOCUMENTO = NULL '+
    'WHERE IDPEDIDOFUNDO = '+sPedido;

   If Not ExecutaQuery(QryAux,wStr) Then
   Begin
      //Al_5
      MsgDlg('Não foi possível excluir o Pedido de Resgate.','Mensagem do Sistema',mtWarning,[mbOk],0);
      Result := False;
      Exit;
   End;
   QryAux.Close;

   While Not QryVerDelResgate.Eof Do
   Begin
      If Not ProcExcluiFundo(QryVerDelResgate.FieldByName('CODDOCUMENTO').AsInteger,
                             QryVerDelResgate.FieldByName('PLNCODIGO').AsInteger,
                             QryVerDelResgate.FieldByName('PLANO').AsInteger,
                             QryVerDelResgate.FieldByName('IDTIPOINVEST').AsInteger,
                             QryVerDelResgate.FieldByName('DATAMOVFUNDO').AsDateTime, True) Then
      Begin
         //Al_5
         MsgDlg('Não foi possível excluir a integração Contábil e Financeira.','Mensagem do Sistema',mtWarning,[mbOk],0);
         Result := False;
         QryVerDelResgate.Close;
         Exit;
      End;

      QryVerDelResgate.Next;

   End;

   QryVerDelResgate.Close;

   wStr := 'DELETE FROM IRLITIGIO '+
           'WHERE IDOPERACAOFUNDO IN (SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO '+
           'WHERE IDPEDIDOFUNDO = '+sPedido+')';

   If Not ExecutaQuery(QryAux,wStr) Then
   Begin
      //Al_5
      MsgDlg('Não foi possível excluir o IR Litigio.','Mensagem do Sistema',mtInformation,[mbOk],0);
      Result := False;
      Exit;
   End;
   QryAux.Close;

   wStr := 'DELETE FROM HISTFUNDO '+
           'WHERE IDTIPOOPERACAO NOT IN (-12,-13) AND IDOPERACAOFUNDO IN (SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO '+
           'WHERE IDPEDIDOFUNDO = '+sPedido+')';

   If Not ExecutaQuery(QryAux,wStr) Then
   Begin
      //Al_5
      MsgDlg('Não foi possível excluir o Histórico da operação.','Mensagem do Sistema',mtWarning,[mbOk],0);
      Result := False;
      Exit;
   End;
   QryAux.Close;

   wStr :='DELETE FROM OPERACAOFUNDO WHERE IDPEDIDOFUNDO = '+sPedido;

   If Not ExecutaQuery(QryAux,wStr) Then
   Begin
      //Al_5
      MsgDlg('Não foi possível excluir a Operação.','Mensagem do Sistema',mtWarning,[mbOk],0);
      QryAux.Close;
      Result := False;
      Exit;
   End;
   QryAux.Close;
   Result := True;
end;

procedure TFrmCadLancFundosEmol.sbtnMovimentoClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmConsMovFundos, TfrmConsMovFundos, False);
   sbtnMovimento.Down := False;
end;

procedure TFrmCadLancFundosEmol.FormCreate(Sender: TObject);
begin
  inherited;
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;

end;

end.
