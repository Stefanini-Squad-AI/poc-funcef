//******************************************************************************
//Rotina..........:
//N. Sol..........: 174651
//N. Kintana......: 1607521
//Data............: 20/03/2012
//Responsável.....: Otacilio Aquino
//Descrição.......: Alteração do DATAMODULO "FDmRelFundosSaldo" p/ "FDmRelFundoDirCred"
//******************************************************************************
// Data      : 29/08/2007
// Código    : AL_25
// Pendencia : 25641
// SOL       : 62560
// Motivo    : Implementação para alterar o nome do título do form
//******************************************************************************
// Data      : 02/08/2007
// Código    : AL_24
// Pendencia : 25291
// SOL       : 59686
// Motivo    : Melhorar a Performance do relatorio de Saldo de Fundos
//******************************************************************************
// Data      : 13/03/2007
// Código    : AL_23
// Pendencia :
// SOL       :
// Motivo    : Ajuste na mensagem de reprocessamento
//******************************************************************************
// Data      : 16/02/2007 e 10/07/2007
// Codigo    : AL_22
// Pendência : 24475 / 25640
// Sol       :
// Motivo    : Implementação dos campos observação, data de vencimento e boleta
//             na pasta de Aplicação/Subscrição
//******************************************************************************
// Data      : 01/02/2007
// Código    : AL_21
// Pendencia : 24349
// SOL       : 52712
// Desc      : Ajuste no tratamento de erro da rotina AlimentaFundo
//             Criado um parametro novo dom variável para retorno da
//               mensagem de erro
//******************************************************************************
// Data      : 23/08/2006
// Código    : AL_20
// Pendencia : 23123
// SOL       : 45112
// Motivo    : Implementação para utilização do Fundo de Inv. em Participação
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_19
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data      : 20/02/2005
// Código    : AL_18
// Pendencia :
// SOL       :
// Motivo    : Implementação da verificação de processo de atualização em andamento
//******************************************************************************
// Data     : 05/09/2005
// Linha(s) : Al_17
// Motivo   : Criado o Botão e Menu para impressão do relatório de saldo
//******************************************************************************
// Data     : 30/06/2005
// Linha(s) : Al_16
// Motivo   : Colocado no lugar certo a royina que grava o plano, plncodigo e coddocumento
//******************************************************************************
// Data     : 15/06/2005
// Linha(s) : Al_15
// Motivo   : Implementado o parametro IDPEDIDOFUNDO na query "qryConfirmação"
//******************************************************************************
// Data     : 31/05/2005
// Código   : AL_14
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 30/05/2005
// Linha(s) : Al_13
// Motivo   : Retirado o Close e Open das querys referentes ao combo's da tela
//******************************************************************************
// Data     : 30/05/2005
// Linha(s) : Al_12
// Motivo   : Alterado a sequencia de query/variavel
//******************************************************************************
// Data     : 30/05/2005
// Linha(s) : Al_11
// Motivo   : Passado para uma query a exclusáo do histórico de fundos.
//******************************************************************************
// Data     : 30/05/2005
// Linha(s) : Al_10
// Motivo   : Retirado a QryVerDelAplicacao, e implementada na qryAplicacao o PLANO, PLNCODIGO e CODDOCUEMNTO,
//            para ser feita exclusão da operação
//******************************************************************************
// Data     : 30/05/2005
// Linha(s) : Al_9
// Motivo   : Implementação da variavel "dDataIniProc", para guardar a data de inicialização
//******************************************************************************
// Data     : 30/05/2005
// Linha(s) : Al_8
// Motivo   : Retirado o tratamento de "erro" das mensagens
//******************************************************************************
// Data     : 30/05/2005
// Linha(s) : Al_7
// Motivo   : Atualiza a operação com a integração contabil/financeira(QryUpdOperacaoApl).
//******************************************************************************
// Data     : 30/05/2005
// Linha(s) : Al_6
// Motivo   : Implementação da FLGCONTAINVEST na rotina de integralização contabil.
//******************************************************************************
// Data     : 29/04/2005
// Linha(s) : Al_5
// Motivo   : Alterado a descrição do histórico, para passar apenas o nome do fundo e o plano
//******************************************************************************
// Data     : 27/10/2004
// Linha(s) : Alt_4
// Motivo   : Implementada a critica do tipo de operação para Aplicação/Subscrição
//******************************************************************************
// Data     : 06/10/2004
// Linha(s) : Alt_3
// Motivo   : Inclusão do campo DTAINIPROC na qryFundoInvestResg , QryFundoInvestAplic
//            QryAplicacao, QryResgate, qryvenda, QryFundoInvestVenda e na funcao Reprocessamento
//******************************************************************************
// Data     : 20/09/2004
// Linha(s) : Alt_2
// Motivo   : Inclusão da nova concepção para apuração de CPMF sobre as operações de
//            resgate
//******************************************************************************
// Data     : 15/09/2004
// Função   :
// Linha(s) : AL_1
// Motivo   : Implementação do CommitUppdate e acerto no parametro da data na
//            contabilização
//******************************************************************************

unit FCadOperFundosDirCred;

interface

uses

  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, wwdblook, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  Db, CmEventosCadastro, ImgList, Wwdatsrc, MontaSelect, DBTables, Buttons,
  Mask, DBCtrls, TREdit, Grids, Wwdbigrd, Wwdbgrid, IvDictio,
  IvMulti, IvEMulti, Wwquery, MAHlpBtn, TB97Tlbr, TB97Ctls, TB97, fcLabel,
  ExtCtrls, ComCtrls, FTelaAut, uCtrlInvContab, Menus, FPreview, 
  //AL_22
  wwdbedit;

type

//******************************************************************************
  TDadosCotas = Record
                 DataCota:TDate;
                 VlrCota :Double;
               End;

//******************************************************************************

  TFrmCadOperFundosDirCred = class(TfrmCadastroCSInv)
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
    //AL_22
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
    DbLkcFundoSaldo: TwwDBLookupCombo;
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
    QryFundoInvestSld: TwwQuery;
    QryFundoInvestSldIDFUNDOINVEST: TFloatField;
    QryFundoInvestSldDESCFUNDOINVEST: TStringField;
    QryFundoInvestSldIDGESTORCARTEIRA: TFloatField;
    QryFundoInvestSldTRGDTINCLUSAO: TDateTimeField;
    QryFundoInvestSldTRGUSERINCLUSAO: TStringField;
    QryFundoInvestSldMOECODIGO: TFloatField;
    QryFundoInvestSldIDCARTEIRAINVEST: TFloatField;
    QryFundoInvestSldIDTIPOFUNDOINVEST: TFloatField;
    QryFundoInvestSldCNPJFUNDO: TStringField;
    QryFundoInvestSldSTAEXCLUSIVO: TStringField;
    QryFundoInvestSldPZOCARENCIA: TFloatField;
    QryFundoInvestSldPZOANIVERSARIO: TFloatField;
    QryFundoInvestSldPZOLIQAPLIC: TFloatField;
    QryFundoInvestSldPZOLIQRESG: TFloatField;
    QryFundoInvestSldQTDDECQTD: TFloatField;
    QryFundoInvestSldQTDDECVALOR: TFloatField;
    QryFundoInvestSldSTAFUNDO: TStringField;
    QryFundoInvestSldPZOAMORTIZACAO: TFloatField;
    QryFundoInvestSldPERCTXPERFORM: TFloatField;
    QryFundoInvestSldPERCTXADM: TFloatField;
    QryFundoInvestSldCODFUNCETIP: TStringField;
    QryFundoInvestSldSTAPROVISIONAIR: TStringField;
    QryFundoInvestSldSTAPROVISIONAIOF: TStringField;
    QryFundoInvestSldCONTRCETIP: TStringField;
    qryAux: TwwQuery;
    //AL_22
    Label32: TLabel;
    DbEdCotaNegResg: TDBRealEdit;
    DbEdTaxasEmolResg: TDBRealEdit;
    Label35: TLabel;
    DbEdCorretagemResg: TDBRealEdit;
    Label36: TLabel;
    DbEdValorTotalReg: TDBRealEdit;
    UpdResgate: TUpdateSQL;
    UpdAplicacao: TUpdateSQL;
    QryVerificaOperacao: TwwQuery;
    QryVerAtualizacao: TwwQuery;
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
    QryDelEspecificoApl: TwwQuery;
    QryResgateVLRCOTA: TFloatField;
    QryResgateVLRCOLOCACAO: TFloatField;
    QryResgateVLRTAXAS: TFloatField;
    QryResgateVLRCORRETAGEM: TFloatField;
    QryResgateVALORTOTAL: TFloatField;
    QryUpdPedido: TwwQuery;
    QryVerDelResgate: TwwQuery;
    sbtnMovimento: TToolbarButton97;
    QryTipoCotaSld: TwwQuery;
    //AL_22
    QryResgateIDTIPOCOTA: TFloatField;
    QryResgateDESCTIPOCOTA: TStringField;
    Label6: TLabel;
    DbLkcTipoCotaResg: TwwDBLookupCombo;
    QryTipoCotaApl: TwwQuery;
    QryTipoCotaResg: TwwQuery;
    DsTipoCotaResg: TwwDataSource;
    Label5: TLabel;
    DBLTipoCota: TwwDBLookupCombo;
    //AL_22
    QryTipoOperacao: TwwQuery;
    DbEdTaxaPerfor: TDBRealEdit;
    Label34: TLabel;
    Label37: TLabel;
    QrySaldoFundoDESCTIPOCOTA: TStringField;
    QryResgateVLRTAXAPERF: TFloatField;
    //AL_22
    tbsVenda: TTabSheet;
    Dock975: TDock97;
    Toolbar976: TToolbar97;
    btIncVenda: TSpeedButton;
    btAltVenda: TSpeedButton;
    btExcVenda: TSpeedButton;
    Panel1: TPanel;
    pnlVenda: TPanel;
    lblVlrOperVenda: TLabel;
    lblDtOperVenda: TLabel;
    lblDtLiqVenda: TLabel;
    lblFundoInvestVenda: TLabel;
    lblCotaFdoVenda: TLabel;
    lblCotaNegVenda: TLabel;
    Label46: TLabel;
    lblVlrLiqVenda: TLabel;
    lblTipoCotaVenda: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    dbeVlrOperVenda: TDBRealEdit;
    dtOperVenda: TCMDateTimePicker;
    dtLiqVenda: TCMDateTimePicker;
    dblkFundoInvestVenda: TwwDBLookupCombo;
    Dock976: TDock97;
    Toolbar977: TToolbar97;
    btOkVenda: TBitBtn;
    btCancVenda: TBitBtn;
    btVoltaVenda: TBitBtn;
    edCotaFdoVenda: TDBRealEdit;
    edCotaFdoNegVenda: TDBRealEdit;
    dbreTxEmolVenda: TDBRealEdit;
    dbreTxCorretVenda: TDBRealEdit;
    dbreVlrLiqVenda: TDBRealEdit;
    dblkTipoCotaVenda: TwwDBLookupCombo;
    dbreTxPerformVenda: TDBRealEdit;
    dbgGridVenda: TwwDBGrid;
    dtCotVenda: TCMDateTimePicker;
    lblDtCotVenda: TLabel;
    dblkContraParteVenda: TwwDBLookupCombo;
    lblContraParteVenda: TLabel;
    qryFundoInvestVenda: TwwQuery;
    qryTipoCotaVenda: TwwQuery;
    qryContraParteVenda: TwwQuery;
    qryContraParteVendaNOME: TStringField;
    qryContraParteVendaIDPESSOA: TFloatField;
    qryVenda: TwwQuery;
    dsVenda: TwwDataSource;
    updVenda: TUpdateSQL;
    qryVendaIDPEDIDOFUNDO: TFloatField;
    qryVendaIDTIPOINVEST: TFloatField;
    qryVendaIDTIPOOPERACAO: TFloatField;
    qryVendaIDFUNDOINVEST: TFloatField;
    qryVendaDATAPEDIDO: TDateTimeField;
    qryVendaDATALIQUIDACAO: TDateTimeField;
    qryVendaVLRPEDIDO: TFloatField;
    qryVendaDATACOTIZACAO: TDateTimeField;
    qryVendaVLRCOTA: TFloatField;
    qryVendaVLRCOLOCACAO: TFloatField;
    qryVendaVLRTAXAS: TFloatField;
    qryVendaVLRCORRETAGEM: TFloatField;
    qryVendaVALORTOTAL: TFloatField;
    qryVendaIDTIPOCOTA: TFloatField;
    qryVendaVLRTAXAPERF: TFloatField;
    qryVendaIDFUNDOINVEST_1: TFloatField;
    qryVendaDESCFUNDOINVEST: TStringField;
    qryVendaIDGESTORCARTEIRA: TFloatField;
    qryVendaTRGDTINCLUSAO: TDateTimeField;
    qryVendaTRGUSERINCLUSAO: TStringField;
    qryVendaMOECODIGO: TFloatField;
    qryVendaIDCARTEIRAINVEST: TFloatField;
    qryVendaIDTIPOFUNDOINVEST: TFloatField;
    qryVendaCNPJFUNDO: TStringField;
    qryVendaSTAEXCLUSIVO: TStringField;
    qryVendaPZOCARENCIA: TFloatField;
    qryVendaPZOANIVERSARIO: TFloatField;
    qryVendaPZOLIQAPLIC: TFloatField;
    qryVendaPZOLIQRESG: TFloatField;
    qryVendaQTDDECQTD: TFloatField;
    qryVendaQTDDECVALOR: TFloatField;
    qryVendaSTAFUNDO: TStringField;
    qryVendaPZOAMORTIZACAO: TFloatField;
    qryVendaPERCTXPERFORM: TFloatField;
    qryVendaPERCTXADM: TFloatField;
    qryVendaCODFUNCETIP: TStringField;
    qryVendaSTAPROVISIONAIR: TStringField;
    qryVendaSTAPROVISIONAIOF: TStringField;
    qryVendaCONTRCETIP: TStringField;
    qryVendaDESCTIPOCOTA: TStringField;
    qryVendaIDTIPOINVEST_1: TFloatField;
    qryVendaIDTIPOOPERACAO_1: TFloatField;
    qryVendaDESCTIPOOPERACAO: TStringField;
    qryVendaNATUREZAOPERACAO: TStringField;
    qryVendaIDPLANOPREV: TFloatField;
    qryVendaIDPATROCINADORA: TFloatField;
    qryVendaSTACONFIRMA: TStringField;
    qryVendaSTATUS: TStringField;
    qryVendaIDPLANPREVCTBPATR: TFloatField;
    QryAplicacao: TwwQuery;
    DsAplicacao: TwwDataSource;
    QryAplicacaoIDOPERACAOFUNDO: TFloatField;
    QryAplicacaoIDCARTEIRAINVEST: TFloatField;
    QryAplicacaoIDPEDIDOFUNDO: TFloatField;
    QryAplicacaoIDTIPOINVEST: TFloatField;
    QryAplicacaoIDTIPOOPERACAO: TFloatField;
    QryAplicacaoIDFUNDOINVEST: TFloatField;
    QryAplicacaoDATAOPERACAO: TDateTimeField;
    QryAplicacaoDATALIQUIDACAO: TDateTimeField;
    QryAplicacaoQTDOPERACAO: TFloatField;
    QryAplicacaoVLROPERACAO: TFloatField;
    QryAplicacaoVLRCOTA: TFloatField;
    QryAplicacaoVLRIR: TFloatField;
    QryAplicacaoVLRIOF: TFloatField;
    QryAplicacaoVLRRENDIMENTO: TFloatField;
    QryAplicacaoSTACONFIRMA: TStringField;
    QryAplicacaoIDPLANPREVCTBPATR: TFloatField;
    QryAplicacaoDATACOTIZACAO: TDateTimeField;
    QryAplicacaoVLRCOLOCACAO: TFloatField;
    QryAplicacaoVLRTAXAS: TFloatField;
    QryAplicacaoVLRCORRETAGEM: TFloatField;
    QryAplicacaoIDTIPOCOTA: TFloatField;
    QryAplicacaoVALORTOTAL: TFloatField;
    QryAplicacaoQTDMOSTRA: TStringField;
    QryAplicacaoIDFUNDOINVEST_1: TFloatField;
    QryAplicacaoDESCFUNDOINVEST: TStringField;
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
    QryAplicacaoCODFUNCETIP: TStringField;
    QryAplicacaoSTAPROVISIONAIR: TStringField;
    QryAplicacaoSTAPROVISIONAIOF: TStringField;
    QryAplicacaoCONTRCETIP: TStringField;
    QryAplicacaoPZOCOTAPLIC: TFloatField;
    QryAplicacaoDESCTIPOCOTA: TStringField;
    QryAplicacaoIDTIPOINVEST_1: TFloatField;
    QryAplicacaoIDTIPOOPERACAO_1: TFloatField;
    QryAplicacaoDESCTIPOOPERACAO: TStringField;
    QryAplicacaoNATUREZAOPERACAO: TStringField;
    QryAplicacaoIDPLANOPREV: TFloatField;
    QryAplicacaoIDPATROCINADORA: TFloatField;
    QryAplicacaoSTATUS: TStringField;
    qryTipoCotaVendaIDTIPOCOTA: TFloatField;
    qryTipoCotaVendaDESCTIPOCOTA: TStringField;
    qryFundoInvestVendaIDFUNDOINVEST: TFloatField;
    qryFundoInvestVendaDESCFUNDOINVEST: TStringField;
    qryFundoInvestVendaIDGESTORCARTEIRA: TFloatField;
    qryFundoInvestVendaTRGDTINCLUSAO: TDateTimeField;
    qryFundoInvestVendaTRGUSERINCLUSAO: TStringField;
    qryFundoInvestVendaMOECODIGO: TFloatField;
    qryFundoInvestVendaIDCARTEIRAINVEST: TFloatField;
    qryFundoInvestVendaIDTIPOFUNDOINVEST: TFloatField;
    qryFundoInvestVendaCNPJFUNDO: TStringField;
    qryFundoInvestVendaSTAEXCLUSIVO: TStringField;
    qryFundoInvestVendaPZOCARENCIA: TFloatField;
    qryFundoInvestVendaPZOANIVERSARIO: TFloatField;
    qryFundoInvestVendaPZOLIQAPLIC: TFloatField;
    qryFundoInvestVendaPZOLIQRESG: TFloatField;
    qryFundoInvestVendaQTDDECQTD: TFloatField;
    qryFundoInvestVendaQTDDECVALOR: TFloatField;
    qryFundoInvestVendaSTAFUNDO: TStringField;
    qryFundoInvestVendaPZOAMORTIZACAO: TFloatField;
    qryFundoInvestVendaPERCTXPERFORM: TFloatField;
    qryFundoInvestVendaPERCTXADM: TFloatField;
    qryFundoInvestVendaCODFUNCETIP: TStringField;
    qryFundoInvestVendaSTAPROVISIONAIR: TStringField;
    qryFundoInvestVendaSTAPROVISIONAIOF: TStringField;
    qryFundoInvestVendaCONTRCETIP: TStringField;
    qryFundoInvestVendaDATAINICIOFUNDO: TDateTimeField;
    qryFundoInvestVendaPZOCOTRESG: TFloatField;
    qryFundoInvestVendaIDTIPOINVEST: TFloatField;
    wwDBGrid1: TwwDBGrid;
    QryFundoInvestResgDTAINIPROC: TDateTimeField;
    QryFundoInvestAplicDTAINIPROC: TDateTimeField;
    QryAplicacaoDTAINIPROC: TDateTimeField;
    QryResgateDTAINIPROC: TDateTimeField;
    qryVendaDTAINIPROC: TDateTimeField;
    qryFundoInvestVendaDTAINIPROC: TDateTimeField;
    //Al_7
    QryUpdOperacaoApl: TwwQuery;
    QryAplicacaoPLANO: TFloatField;
    QryAplicacaoPLNCODIGO: TFloatField;
    QryAplicacaoCODDOCUMENTO: TFloatField;
    QryDelHistFundo: TwwQuery;
    PopMnuSaldo: TPopupMenu;
    MnuUmPlanoFechto: TMenuItem;
    MnuTodosPlanosFechto: TMenuItem;
    sbtnSaldos: TToolbarButton97;
    //AL_22
    QryAplicacaoDATAVENCIMENTO: TDateTimeField;
    QryAplicacaoOBSERVACAO: TMemoField;
    QryAplicacaoIDBOLETA: TStringField;
    pnlAplicacao: TPanel;
    pgcAplicacao: TPageControl;
    tbsDadosApl: TTabSheet;
    //AL_23
    tbsObsApl: TTabSheet;
    pnlObsAplic: TPanel;
    dbeObsApl: TDBMemo;
    Panel3: TPanel;
    Label29: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label15: TLabel;
    Label22: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label21: TLabel;
    Label27: TLabel;
    lblVariacao: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    DbEdCorretagemApl: TDBRealEdit;
    DbEdCotaNegApl: TDBRealEdit;
    DbLkcFundoInvest: TwwDBLookupCombo;
    DbEdValorApl: TDBRealEdit;
    DbEdCota: TDBRealEdit;
    DbEdQtdOper: TDBRealEdit;
    DbDtDataAplicacao: TCMDateTimePicker;
    DbDtDataLiquidacao: TCMDateTimePicker;
    DbDtDataCotizacaoAplic: TCMDateTimePicker;
    DbEdTaxasEmolApl: TDBRealEdit;
    DbEdValorTotalApl: TDBRealEdit;
    DbLkcTipoCotaApl: TwwDBLookupCombo;
    DbLkcTipoOperacao: TwwDBLookupCombo;
    dbreVariacao: TDBRealEdit;
    DbDtDataVencAplic: TCMDateTimePicker;
    dbeBoleta: TwwDBEdit;
    //Al_7 - fim

    procedure FormShow(Sender: TObject);
    procedure DtEdDataReferenciaGeralExit(Sender: TObject);
    procedure DblTipoFundoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblGestorCarteiraCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbLkcFundoSaldoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbDtRefSaldoExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtIncAplicClick(Sender: TObject);
    procedure BtIncResgClick(Sender: TObject);
    procedure BtCancResgClick(Sender: TObject);
    procedure BtCancAplicClick(Sender: TObject);
    procedure BtOkResgClick(Sender: TObject);
    procedure BtOkAplicClick(Sender: TObject);
    procedure BtExcAplicClick(Sender: TObject);
    procedure BtExcResgClick(Sender: TObject);
    procedure sbtnMovimentoClick(Sender: TObject);
    procedure DbEdTaxasEmolAplExit(Sender: TObject);
    procedure DbEdValorAplExit(Sender: TObject);
    procedure DbRValorLiquidoExit(Sender: TObject);
    procedure DBLTipoCotaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbLkcFundoSaldoExit(Sender: TObject);
    procedure DblTipoFundoExit(Sender: TObject);
    procedure DbEdCotaNegAplExit(Sender: TObject);
    procedure DbEdCorretagemAplExit(Sender: TObject);
    procedure DbLkcFundoInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbLkcFundoInvestExit(Sender: TObject);
    procedure DbLkcTipoCotaAplExit(Sender: TObject);
    procedure DbLkcTipoCotaAplCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbLkcFundoInvestResgCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbLkcFundoInvestResgExit(Sender: TObject);
    procedure DbLkcTipoCotaResgExit(Sender: TObject);
    procedure DbLkcTipoCotaResgCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btIncVendaClick(Sender: TObject);
    procedure btExcVendaClick(Sender: TObject);
    procedure btOkVendaClick(Sender: TObject);
    procedure btCancVendaClick(Sender: TObject);
    procedure dblkFundoInvestVendaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkFundoInvestVendaExit(Sender: TObject);
    procedure dblkTipoCotaVendaExit(Sender: TObject);
    procedure dblkTipoCotaVendaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkContraParteVendaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkContraParteVendaExit(Sender: TObject);
    procedure dbeVlrOperVendaExit(Sender: TObject);
    procedure MnuTodosPlanosFechtoClick(Sender: TObject);
    procedure MnuUmPlanoFechtoClick(Sender: TObject);
    //AL_23
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
     //AL_24
     MascaraDecQtdHist,MascaraDecVlrHist : String; //AL_24 Fim

     function  VerificaAplicacao : Boolean;
     function  VerificaResgate   : Boolean;
     function  VerificaVenda     : Boolean;

     function  VerificaOperacao(sTipoOperacao    : String;
                                iFundo,iTipoCota : Integer;
                                dData            : TDateTime) : Boolean;

     function  VerificaAtualizacao(iIdFundo, iTipoCota   : Integer;
                                   dDataIniFdo, dData    : TDateTime) : Boolean;

     function  ExcluiResgate(sPedido : String) : Boolean;

     procedure AbreQry;
     procedure AbreQrySaldo;
     procedure AcertaBotoesAplicacao;
     procedure AcertaBotoesResgate;
     Procedure AcertaBotoesVenda;
     procedure SelecionaPageControl;
     procedure ValidaFundoTipoCotaApl;
     procedure ValidaFundoTipoCotaResg;
     procedure ValidaFundoTipoCotaVenda;
     procedure SaldoFundos(TodosPlanos: Boolean; iAbert, iFechto: Integer);
     //AL_24
     Procedure MontaSqlSaldo(TodosPlanos : Boolean); // Fim AL_24

  public
    { Public declarations }
  end;

var
  FrmCadOperFundosDirCred: TFrmCadOperFundosDirCred;
  dDtaCot, dDtaLiq : TDateTime;
  fQtdAplicado : Double;

implementation

uses UBibliotecaInvest, UDiasUteisInv, UFundoComum, UmensErro,
     UOperComum, dBaseDados, UDataBase, dFundoComum, FConsMovFundos,
     //AL_23
     // KTN: 1607521 SOL: 174651 OTACILIO
     //FDmRelFundosSaldo,
     FDmRelFundoDirCred,
     FPrincipal;

{$R *.DFM}

function TFrmCadOperFundosDirCred.VerificaAplicacao : Boolean;
Var
   sMessage : String;
Begin
// Testa Dados
  If Trim(DbLkcFundoInvest.Text) = '' Then Begin
    MsgDlg('Indique o Fundo de Investimento.','Atenção',mtWarning,[mbOk],0);
    if DbLkcFundoInvest.Canfocus then
       DbLkcFundoInvest.SetFocus;
    Result := False;
    Exit;
  End;

  If Trim(DbLkcTipoCotaApl.Text) = '' Then Begin
    MsgDlg('Indique o Tipo de Cota.','Atenção',mtWarning,[mbOk],0);
    if DbLkcTipoCotaApl.Canfocus then
       DbLkcTipoCotaApl.SetFocus;
    Result := False;
    Exit;
  End;

  //Alt_4
  If Trim(DbLkcTipoOperacao.Text) = '' Then Begin
    MsgDlg('Indique a Operação.','Atenção',mtWarning,[mbOk],0);
    if DbLkcTipoOperacao.Canfocus then
       DbLkcTipoOperacao.SetFocus;
    Result := False;
    Exit;
  End;

// Data da Aplicação
  If DbDtDataAplicacao.Date = 0 Then Begin
    MsgDlg('Data da Aplicação não está preenchida.','Atenção',mtWarning,[mbOk],0);
    if DbDtDataAplicacao.Canfocus then
       DbDtDataAplicacao.SetFocus;
    Result := False;
    Exit;
  End;

  //AL_14
  //AL_19
  if not CtrlInvContab.TestaPeriodo(DbDtDataAplicacao.Text, iTipoInvestUsu) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if DbDtDataAplicacao.Canfocus then
        DbDtDataAplicacao.SetFocus;
     Result := False;
     Exit;
  end;

  If DbDtDataLiquidacao.Date = 0 Then
  Begin
    MsgDlg('Data da Liquidação não está preenchida.','Atenção',mtWarning,[mbOk],0);
    if DbDtDataLiquidacao.Canfocus then
       DbDtDataLiquidacao.SetFocus;
    Result := False;
    Exit;
  End;

  If DbDtDataLiquidacao.Date < DbDtDataAplicacao.Date Then
  Begin
    MsgDlg('Data da Liquidação menor que a de Aplicação.','Atenção',mtWarning,[mbOk],0);
    QryAplicacaoDATALIQUIDACAO.AsDateTime := OperComum.DataPrazo(DbDtDataAplicacao.Date,
                                             QryFundoInvestAplic.FieldByName('PZOLIQAPLIC').AsInteger);
    if DbDtDataLiquidacao.Canfocus then
       DbDtDataLiquidacao.SetFocus;
    Result := False;
    Exit;
  End;

  If DbDtDataCotizacaoAplic.Date = 0 Then
  Begin
     MsgDlg('Data da Cotização não está preenchida.','Atenção',mtWarning,[mbOk],0);
     if DbDtDataCotizacaoAplic.Canfocus then
        DbDtDataCotizacaoAplic.SetFocus;
     Result := False;
     Exit;
  End;

  If DbDtDataCotizacaoAplic.Date < DbDtDataAplicacao.Date Then
  Begin
     MsgDlg('Data da Liquidação menor que a de Aplicação.','Atenção',mtWarning,[mbOk],0);
     QryAplicacaoDATACOTIZACAO.AsDateTime := OperComum.DataPrazo(DbDtDataAplicacao.Date,
                                             QryFundoInvestAplic.FieldByName('PZOCOTAPLIC').AsInteger);
    if DbDtDataLiquidacao.Canfocus then
       DbDtDataLiquidacao.SetFocus;
    Result := False;
    Exit;
  End;

  If DbEdValorApl.Value <= 0 Then
  Begin
    MsgDlg('Valor Aplicado não pode ser menor ou igual a zero.','Atenção',mtWarning,[mbOk],0);
    if DbEdValorApl.Canfocus then
       DbEdValorApl.SetFocus;
    Result := False;
    Exit;
  End;

  If (QryAplicacaoDATAOPERACAO.AsDateTime = QryAplicacaoDATACOTIZACAO.AsDateTime) Then
  Begin
    If DbEdQtdOper.Value <= 0 Then
    Begin
       MsgDlg('Quantidade Operada não pode ser menor que zero.','Atenção',mtWarning,[mbOk],0);
       if DbEdValorApl.Canfocus then
          DbEdValorApl.SetFocus;
       Result := False;
       Exit;
    End;
  End;

  If DbEdCotaNegApl.Value <= 0 Then
  begin
     MsgDlg('A cota negociada não pode ser igual ou menor que zero. '#13+
             'Operação não pode ser Realizada.','Atenção',mtWarning,[MbOk],0);
     If DbEdCotaNegApl.CanFocus Then
        DbEdCotaNegApl.SetFocus;
     Exit;
  end;

  If DbEdValorTotalApl.Value < 0 Then
  begin
     MsgDlg('O valor total líquido não pode ser negativo.','Atenção',mtWarning,[MbOk],0);
     If DbEdValorTotalApl.CanFocus Then
        DbEdValorTotalApl.SetFocus;
     Exit;
  end;

  If DbEdValorTotalApl.Value < (DbEdValorApl.Value + DbEdTaxasEmolApl.Value + DbEdCorretagemApl.Value) Then
  Begin
    MsgDlg('O valor total não pode ser menor que valor aplicado + taxas.','Atenção',mtWarning,[mbOk],0);
    DbEdValorTotalApl.Value := DbEdValorApl.Value + DbEdTaxasEmolApl.Value + DbEdCorretagemApl.Value;
    if DbEdValorTotalApl.Canfocus then
       DbEdValorTotalApl.SetFocus;
    Result := False;
    Exit;
  End;

  Result := True;
End;

function TFrmCadOperFundosDirCred.VerificaResgate : Boolean;
Var
   sMessage : String;
Begin
  // Testa Dados
  If Trim(DbLkcFundoInvestResg.Text) = '' Then Begin
    MsgDlg('Indique o Fundo de Investimento.','Atenção',mtWarning,[mbOk],0);
    if DbLkcFundoInvestResg.CanFocus then
       DbLkcFundoInvestResg.SetFocus;
    Result := False;
    Exit;
  End;

  If Trim(DbLkcTipoCotaResg.Text) = '' Then Begin
    MsgDlg('Indique o Tipo de Cota.','Atenção',mtWarning,[mbOk],0);
    if DbLkcTipoCotaResg.Canfocus then
       DbLkcTipoCotaResg.SetFocus;
    Result := False;
    Exit;
  End;

  If dbDDataOperacao.Date = 0 Then Begin
    MsgDlg('Data da Operação não está preenchida.','Atenção',mtWarning,[mbOk],0);
    if dbDDataOperacao.CanFocus then
       dbDDataOperacao.SetFocus;
    Result := False;
    Exit;
  End;

  //AL_14
  //AL_19
  if not CtrlInvContab.TestaPeriodo(dbDDataOperacao.Text, iTipoInvestUsu) then begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dbDDataOperacao.Canfocus then
        dbDDataOperacao.SetFocus;
     Result := False;
     Exit;
  end;

  If dbDDataLiquidacaoResg.Date = 0 Then Begin
    MsgDlg('Data da Liquidação não está preenchida.','Atenção',mtWarning,[mbOk],0);
    if dbDDataLiquidacaoResg.CanFocus then
       dbDDataLiquidacaoResg.SetFocus;
    Result := False;
    Exit;
  End;

  If DbDtDataCotizacaoResg.Date = 0 Then Begin
     MsgDlg('Data da Cotização não está preenchida.','Atenção',mtWarning,[mbOk],0);
     if DbDtDataCotizacaoResg.Canfocus then
        DbDtDataCotizacaoResg.SetFocus;
     Result := False;
     Exit;
  End;


  If dbDDataLiquidacaoResg.Date < DbDtDataAplicacao.Date Then Begin
    MsgDlg('Data da Liquidação menor que a de Operação.','Atenção',mtWarning,[mbOk],0);
    QryResgateDATALIQUIDACAO.AsDateTime := OperComum.DataPrazo(dbDDataOperacao.Date,
                                             QryFundoInvestSld.FieldByName('PZOLIQAPLIC').AsInteger);
    if dbDDataLiquidacaoResg.Canfocus then
       dbDDataLiquidacaoResg.SetFocus;
    Result := False;
    Exit;
  End;

  If DbRValorLiquido.Value <= 0 Then Begin
    MsgDlg('Valor Líquido não pode ser menor ou igual a zero.','Atenção',mtWarning,[mbOk],0);
    if DbRValorLiquido.CanFocus then
       DbRValorLiquido.SetFocus;
    Result := False;
    Exit;
  End;

  If DbRValorLiquido.Value > rVlrBruto.Value Then Begin
    MsgDlg('Valor da operação maior que o valor bruto do Fundo.','Atenção',mtWarning,[mbOk],0);
    if DbRValorLiquido.CanFocus then
       DbRValorLiquido.SetFocus;
    BtAltResg.Down := False;
    BtCancResg.Click;
    Result := False;
    Exit;
  End;

  If DbEdCotaNegResg.Value <= 0 Then begin
     MsgDlg('A cota negociada não pode ser igual ou menor que zero. '#13+
             'Operação não pode ser Realizada.','Atenção',mtWarning,[MbOk],0);
     If DbEdCotaNegResg.CanFocus Then
        DbEdCotaNegResg.SetFocus;
     Exit;
  end;

  If DbEdValorTotalReg.Value < 0 Then begin
     MsgDlg('O valor total líquido não pode ser negativo.','Atenção',mtWarning,[MbOk],0);
     If DbEdValorTotalReg.CanFocus Then
        DbEdValorTotalReg.SetFocus;
     Exit;
  end;

  If DbEdValorTotalReg.Value < (DbRValorLiquido.Value -
                               (DbEdTaxaPerfor.Value + DbEdTaxasEmolResg.Value + DbEdCorretagemResg.Value)) Then Begin
    MsgDlg('O valor total não pode ser menor que valor resgatado menos as taxas.','Atenção',mtWarning,[mbOk],0);
    DbEdValorTotalReg.Value := DbRValorLiquido.Value -
                              (DbEdTaxaPerfor.Value + DbEdTaxasEmolResg.Value + DbEdCorretagemResg.Value);
    if DbEdValorTotalReg.Canfocus then
       DbEdValorTotalReg.SetFocus;
    Result := False;
    Exit;
  End;

  Result := True;
End;

function TFrmCadOperFundosDirCred.VerificaOperacao(sTipoOperacao    : String;
                                                   iFundo,iTipoCota : Integer;
                                                   dData            : TDateTime) : Boolean;
begin
   QryVerificaOperacao.Close;
   QryVerificaOperacao.ParamByName('IDFUNDOINVEST').AsInteger    := iFundo;
   QryVerificaOperacao.ParamByName('IDTIPOCOTA').AsInteger       := iTipoCota;
   QryVerificaOperacao.ParamByName('DATAOPERACAO').AsDateTime    := dData;
   QryVerificaOperacao.ParamByName('NATUREZAOPERACAO').AsString  := sTipoOperacao;
   QryVerificaOperacao.ParamByName('IDPLANPREVCTBPATR').AsInteger:= iPlanPrevCtbPatro;
   QryVerificaOperacao.Open;
   If QryVerificaOperacao.RecordCount = 0 Then
      Result := True
   Else
      Result := False;
end;

Function TFrmCadOperFundosDirCred.VerificaAtualizacao(iIdFundo, iTipoCota : Integer;
                                                   dDataIniFdo, dData  : TDateTime) : Boolean;
Begin
   Result    := True;
   if dData > dDataIniFdo then
   begin
      QryVerAtualizacao.Close;
      QryVerAtualizacao.ParamByName('DATAMOVFUNDO').AsString       := DateToStr(dData);
      QryVerAtualizacao.ParamByName('IDFUNDOINVEST').AsInteger     := iIdFundo;
      QryVerAtualizacao.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      QryVerAtualizacao.ParamByName('IDTIPOCOTA').AsInteger        := iTipoCota;
      QryVerAtualizacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      QryVerAtualizacao.Open;

      If QryVerAtualizacao.FieldByName('DATAMOVFUNDO').AsDateTime < dData Then
         Result := False;

      QryVerAtualizacao.Close;
   end;
End;

procedure TFrmCadOperFundosDirCred.AbreQry;
begin
   OperComum.LimpaParametros(QryFundoInvestSld);
   With QryFundoInvestSld Do
   Begin
      ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      If DblTipoFundo.Text = ''  Then
         ParamByName('IDTIPOFUNDOINVEST').Clear;
      ParamByName('IDGESTORCARTEIRA').AsInteger  := qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
      If dblGestorCarteira.Text = ''  Then
         ParamByName('IDGESTORCARTEIRA').Clear;
      ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      Open;
   End;

   // busca fundo que não tiveram aplicação neste dia.
   OperComum.LimpaParametros(QryFundoInvestAplic);
   With QryFundoInvestAplic Do
   Begin
      ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      If DblTipoFundo.Text = ''  Then
         ParamByName('IDTIPOFUNDOINVEST').Clear;
      ParamByName('IDGESTORCARTEIRA').AsInteger  := qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
      If dblGestorCarteira.Text = ''  Then
         ParamByName('IDGESTORCARTEIRA').Clear;
      ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      Open;
   End;

   // busca fundo que não tiveram aplicação neste dia.
   OperComum.LimpaParametros(QryFundoInvestResg);
   With QryFundoInvestResg Do
   Begin
      ParamByName('IDTIPOFUNDOINVEST').AsInteger  := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      If DblTipoFundo.Text = ''  Then
         ParamByName('IDTIPOFUNDOINVEST').Clear;
      ParamByName('IDGESTORCARTEIRA').AsInteger   := qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
      If dblGestorCarteira.Text = ''  Then
         ParamByName('IDGESTORCARTEIRA').Clear;
      ParamByName('IDTIPOINVEST').AsInteger       := iTipoInvestUsu;
      Open;
   End;

   // busca fundo que não tiveram aplicacao neste dia.
   OperComum.LimpaParametros(QryFundoInvestVenda);
   With QryFundoInvestVenda Do
   Begin
      ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      If DblTipoFundo.Text = ''  Then
         ParamByName('IDTIPOFUNDOINVEST').Clear;
      ParamByName('IDGESTORCARTEIRA').AsInteger  := qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
      If dblGestorCarteira.Text = ''  Then
         ParamByName('IDGESTORCARTEIRA').Clear;
      ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      Open;
   End;

   // Preenche os Paramentros e refaz a Consulta das Aplicacoes
   OperComum.LimpaParametros(QryAplicacao);
   With QryAplicacao Do
   Begin
       ParamByName('DATAOPERACAO').AsString:= DtEdDataReferenciaGeral.Text;
       ParamByName('IDTIPOFUNDOINVEST').AsInteger  := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
       If DblTipoFundo.Text = ''  Then
          ParamByName('IDTIPOFUNDOINVEST').Clear;
       ParamByName('IDGESTORCARTEIRA').AsInteger   := QryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
       If dblGestorCarteira.Text = ''  Then
          ParamByName('IDGESTORCARTEIRA').Clear;
       ParamByName('IDPLANPREVCTBPATR').AsInteger  := iPlanPrevCtbPatro;
       ParamByName('IDTIPOINVEST').AsInteger       := iTipoInvestUsu;
       Open;
   End;

   // Preenche os Paramentros e refaz a Consulta dos Resgates
   OperComum.LimpaParametros(QryResgate);
   With QryResgate Do Begin
      ParamByName('DATAOPERACAO').AsString       := DtEdDataReferenciaGeral.Text;
      ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      If DblTipoFundo.Text = ''  Then
         ParamByName('IDTIPOFUNDOINVEST').Clear;
      ParamByName('IDGESTORCARTEIRA').AsInteger :=  QryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
      If dblGestorCarteira.Text = ''  Then
         ParamByName('IDGESTORCARTEIRA').Clear;
      ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      Open;
   End;

   // Preenche os Paramentros e refaz a Consulta dos Resgates
   OperComum.LimpaParametros(QryVenda);
   With QryVenda Do Begin
      ParamByName('DATAOPERACAO').AsString          := DtEdDataReferenciaGeral.Text;
      If Trim(DblTipoFundo.Text) <> ''  Then
         ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      If Trim(dblGestorCarteira.Text) <> ''  Then
         ParamByName('IDGESTORCARTEIRA').AsInteger  := QryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
      ParamByName('IDPLANPREVCTBPATR').AsInteger    := iPlanPrevCtbPatro;
      ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;
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

  If QryVenda.Eof Then
     btExcVenda.Enabled := False
  Else
     btExcVenda.Enabled := True;

  SelecionaPageControl;

end;

procedure TFrmCadOperFundosDirCred.AbreQrySaldo;
begin
  If Trim(DbDtRefSaldo.Text) = '' Then Exit;

  If Trim(DbLkcFundoSaldo.Text) <> '' Then
  Begin
     QrySaldoFundoVLRCOTAATUAL.DisplayFormat :=
              MontaMascaraDecVlr(QryFundoInvestSldIDFUNDOINVEST.AsInteger);
     QrySaldoFundoSALDOQTDCOTAS.DisplayFormat :=
              MontaMascaraDecQtd(QryFundoInvestSldIDFUNDOINVEST.AsInteger);
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
    OperComum.LimpaParametros(QrySaldoFundo);

    if Trim(DbLkcFundoSaldo.Text) <> '' then
       ParamByName('IDFUNDOINVEST').AsString:= DbLkcFundoSaldo.LookupValue;

    if Trim(DbDtRefSaldo.Text) <> '' then
       ParamByName('DATAMOVFUNDO').AsString := DbDtRefSaldo.Text;

    if Trim(DblTipoFundo.Text) <> ''  then
       ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

    if Trim(dblGestorCarteira.Text) <> ''  then
       ParamByName('IDGESTORCARTEIRA').AsInteger := qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;

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

  with QrySaldoFundoTotal do
  begin

    OperComum.LimpaParametros(QrySaldoFundoTotal);

    if Trim(DbLkcFundoSaldo.Text) <> '' then
       ParamByName('IDFUNDOINVEST').AsString := DbLkcFundoSaldo.LookupValue;

    if Trim(DBLTipoCota.Text) <> ''  then
       ParamByName('IDTIPOCOTA').AsInteger := QryTipoCotaSld.FieldByName('IDTIPOCOTA').AsInteger;

    if Trim(DbDtRefSaldo.Text) <> '' then
       ParamByName('DATAMOVFUNDO').AsString := DbDtRefSaldo.Text;

    if Trim(DblTipoFundo.Text) <> ''  then
       ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

    if dblGestorCarteira.Text <> ''  then
       ParamByName('IDGESTORCARTEIRA').AsInteger := qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;

    ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
    ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
    Open;
  end;
end;

Procedure TFrmCadOperFundosDirCred.AcertaBotoesAplicacao;
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

Procedure TFrmCadOperFundosDirCred.AcertaBotoesResgate;
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

Procedure TFrmCadOperFundosDirCred.AcertaBotoesVenda;
Begin
// Desabilita Botoes
  BtIncVenda.Enabled := Not BtIncVenda.Enabled;
  BtExcVenda.Enabled := Not BtExcVenda.Enabled;

  BtIncVenda.Down := False;
  BtExcVenda.Down := False;

  BtOkVenda.Enabled    := Not BtOkVenda.Enabled;
  BtCancVenda.Enabled  := Not BtCancVenda.Enabled;
  btVoltaVenda.Enabled := Not btVoltaVenda.Enabled;
End;

procedure TFrmCadOperFundosDirCred.SelecionaPageControl;
begin
   If QryResgate.RecordCount > 0 Then
      PgcSaldos.ActivePage := TbsResgate
   Else If QryVenda.RecordCount > 0 Then
      PgcSaldos.ActivePage := TbsVenda
   Else If QryAplicacao.RecordCount > 0 Then
      PgcSaldos.ActivePage := TbsAplicacao
   Else
      PgcSaldos.ActivePage := TbsSaldo;
end;

procedure TFrmCadOperFundosDirCred.FormShow(Sender: TObject);
begin
  inherited;
  //AL_25
  lbNomItem.Caption := 'Operação em Fundos de Direitos Creditórios';
  if iTipoInvestUsu = 10 then
     lbNomItem.Caption := 'Lançamento de Fundos de Investimentos';  

  PnlResgate.SendToBack;
  PnlAplicacao.SendToBack;
  pnlVenda.SendToBack;

  QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger       := iTipoInvestUsu;
  QryTipoFundo.Open;

  QryTipoCotaSld.Open;
  QryTipoCotaApl.Open;
  QryTipoCotaResg.Open;
  qryContraParteVenda.Open;
  qryTipoCotaVenda.Open;

  If QryTipoFundo.RecordCount = 1 Then
     QryGestorCart.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
  QryGestorCart.Open;
  
  QryFundoInvestSld.Open;

  //Verifica a ultima data de fechamento
  QryUltDataFech.Close;
  QryUltDataFech.ParamByName('IDTIPOINVEST').AsInteger   := iTipoInvestUsu;
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

  MnuUmPlanoFechto.Caption := sPlanPrevCtbPatro;

  AbreQry;

  AbreQrySaldo;
end;

procedure TFrmCadOperFundosDirCred.DtEdDataReferenciaGeralExit(Sender: TObject);
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

procedure TFrmCadOperFundosDirCred.DblTipoFundoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  AbreQry;
  AbreQrySaldo;
end;

procedure TFrmCadOperFundosDirCred.dblGestorCarteiraCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  AbreQry;
  AbreQrySaldo;
end;

procedure TFrmCadOperFundosDirCred.DbLkcFundoSaldoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   AbreQrySaldo;
end;

procedure TFrmCadOperFundosDirCred.DbDtRefSaldoExit(Sender: TObject);
begin
  If Trim(DbDtRefSaldo.Text) = '' Then
     Exit;
  inherited;
  While not DiasUteisInv.DiaUtil(DbDtRefSaldo.DateTime,-1,1,'',True,False,False) Do
      DbDtRefSaldo.DateTime := DbDtRefSaldo.DateTime + 1;

  AbreQrySaldo;

end;

procedure TFrmCadOperFundosDirCred.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
   //AL_23
end;

procedure TFrmCadOperFundosDirCred.BtIncAplicClick(Sender: TObject);
begin
  inherited;

  If (QryAplicacao.Active = False) Then Begin
    //Al_8
    MsgDlg('A consulta não foi executada.','Mensagem do Sistema',mtInformation,[mbOk],0);
    BtIncAplic.Down := False;
    Exit;
  End;

  PnlSelecao.Enabled   := False;
  TbsResgate.Enabled   := False;
  tbsVenda.Enabled     := False;
  TbsSaldo.Enabled     := False;

  PgcSaldos.ActivePage := TbsAplicacao;

// Prepara Ambiente
  AcertaBotoesAplicacao;
  PnlAplicacao.BringToFront;

  OperComum.LimpaParametros(QryTipoOperacao);
  QryTipoOperacao.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  QryTipoOperacao.Open;

// Insere Registro
  QryAplicacao.Append;
  QryAplicacaoDATAOPERACAO.AsDateTime   := DtEdDataReferenciaGeral.Date;

  Dock978.Visible := True;
  Dock978.Enabled := True;  

  If DbDtDataAplicacao.CanFocus Then
     DbDtDataAplicacao.SetFocus;
end;

procedure TFrmCadOperFundosDirCred.BtIncResgClick(Sender: TObject);
begin

  rVlrBruto.Clear;
  DbEdCotaResg.Clear;

  inherited;

  Dock974.Visible :=True;

  If (QryResgate.Active = False) Then Begin
    //Al_8
    MsgDlg('A consulta não foi executada.','Mensagem do Sistema', mtInformation,[mbOk],0);
    BtIncResg.Down := False;
    Exit;
  End;

  PnlSelecao.Enabled   := False;
  TbsAplicacao.Enabled := False;
  tbsVenda.Enabled     := False;
  TbsSaldo.Enabled     := False;

  PgcSaldos.ActivePage := TbsResgate;

// Prepara Ambiente
  AcertaBotoesResgate;

  PnlResgate.BringToFront;

// Insere Registro
  QryResgate.Append;
  QryResgateDATAPEDIDO.AsDateTime       := DtEdDataReferenciaGeral.Date;
  QryResgateIDPLANPREVCTBPATR.AsInteger := iPlanPrevCtbPatro;

  If dbDDataOperacao.CanFocus then
     dbDDataOperacao.SetFocus;
end;

procedure TFrmCadOperFundosDirCred.BtCancResgClick(Sender: TObject);
begin
  inherited;

  PnlSelecao.Enabled   := True;
  TbsAplicacao.Enabled := True;
  TbsResgate.Enabled   := True;
  TbsVenda.Enabled     := True;
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

procedure TFrmCadOperFundosDirCred.BtCancAplicClick(Sender: TObject);
begin
  inherited;

  DbEdCota.Clear;

  PnlSelecao.Enabled   := True;
  TbsAplicacao.Enabled := True;
  TbsResgate.Enabled   := True;
  TbsVenda.Enabled     := True;
  TbsSaldo.Enabled     := True;

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

procedure TFrmCadOperFundosDirCred.ValidaFundoTipoCotaApl;
Var
   iPz              : Integer;
   DadosCota        : TDadosCota;
begin
  inherited;

   If Trim(DbLkcFundoInvest.Text) = '' Then
   begin
      If DbLkcFundoInvest.CanFocus Then
         DbLkcFundoInvest.SetFocus;
      DbLkcTipoCotaApl.Text      := '';
      Exit;
   end;

   If Trim(DbLkcTipoCotaApl.Text) = '' Then
   begin
      If DbLkcTipoCotaApl.CanFocus Then
         DbLkcTipoCotaApl.SetFocus;
      DbLkcTipoOperacao.Text     := '';
      Exit;
   end;

   If Not VerificaOperacao('A',
                           QryFundoInvestAplic.FieldByName('IDFUNDOINVEST').AsInteger,
                           QryTipoCotaApl.FieldByName('IDTIPOCOTA').AsInteger,
                           DbDtDataAplicacao.Date) Then
   Begin
      MsgDlg('Já há aplicação para esse Fundo nessa data.','Mensagem do Sistema',mtInformation,[mbOk],0);
      BtCancAplic.Click;
      Exit;
   End;

   // Preenche outros dados
   dDtaLiq := OperComum.DataPrazo(DbDtDataAplicacao.Date,
                                  QryFundoInvestAplic.FieldByName('PZOLIQAPLIC').AsInteger);

   DbDtDataLiquidacao.Date := dDtaLiq;

   dDtaCot := OperComum.DataPrazo(DbDtDataAplicacao.Date,
                                                  QryFundoInvestAplic.FieldByName('PZOCOTAPLIC').AsInteger);

   DbDtDataCotizacaoAplic.Date :=  dDtaCot;

   DbEdQtdOper.DecDigits   := QryFundoInvestAplic.FieldByName('QTDDECQTD').AsInteger;

   DbEdCota.DecDigits      := QryFundoInvestAplicQTDDECVALOR.AsInteger;
   DbEdCotaNegApl.DecDigits:= QryFundoInvestAplicQTDDECVALOR.AsInteger;

   DbEdQtdOper.DecDigits   := QryFundoInvestAplicQTDDECQTD.AsInteger;

   QryAplicacaoDATALIQUIDACAO.AsDateTime := dDtaLiq;

   QryAplicacaoVLRCOTA.DisplayFormat     :=
                 MontaMascaraDecVlr(QryFundoInvestAplicIDFUNDOINVEST.AsInteger);

   QryAplicacaoQTDOPERACAO.DisplayFormat :=
                 MontaMascaraDecQtd(QryFundoInvestAplicIDFUNDOINVEST.AsInteger);

   QryAplicacaoDATACOTIZACAO.AsDateTime := OperComum.DataPrazo(DbDtDataAplicacao.Date,
                        QryFundoInvestAplic.FieldByName('PZOCOTAPLIC').AsInteger);

   // Busca dados da Cota
   if  (Trim(DbLkcFundoInvest.LookupValue) <> '') and (Trim(DbLkcTipoCotaApl.LookupValue) <> '') then
   begin
      DadosCota := UFundoComum.BuscaCotaFundo(QryAux,
                                              StrToInt(DbLkcFundoInvest.LookupValue),
                                              QryAplicacaoDATACOTIZACAO.AsDateTime
                                              StrToInt(DbLkcTipoCotaApl.LookupValue));

      If (QryAplicacaoDATACOTIZACAO.AsDateTime =DbDtDataAplicacao.Date) And
         (DadosCota.DataCota = 0) Then
      Begin
          MsgDlg('Cota do Fundo não encontrada nesta data.','Mensagem do Sistema',mtInformation,[mbOk],0);
          DbLkcFundoInvest.Clear;
          DbLkcTipoCotaApl.Clear;
          Exit;
      End
      Else
      Begin
         DadosCota.DataCota  := QryAux.FieldByName('DATACOTA').AsDateTime;
         DadosCota.VlrCota   := QryAux.FieldByName('VLRCOTA').AsFloat;
         DbEdCota.Value      := DadosCota.VlrCota;
         DbEdCotaNegApl.Value:= DadosCota.VlrCota;
      End;
   end;
end;

procedure TFrmCadOperFundosDirCred.BtOkResgClick(Sender: TObject);
Var
  //AL_21
  sTipoOper, sNaturezaOper, sOperacao, sMens : String;
  iIdForCli, iPlanilha, iDocumento, iPlano : Integer;
  fValorOperacao, fValorIR, fVlrCustoAcoes, fVlrVarAcoes : Currency;
  dDataResgateIni, dDataResgateFim : TDateTime;
begin
  PnlSelecao.Enabled   := True;
  TbsAplicacao.Enabled := True;
  TbsResgate.Enabled   := True;
  TbsVenda.Enabled     := True;
  TbsSaldo.Enabled     := True;

  If Not VerificaResgate Then
     Exit;

  //AL_18
  if VerEmAbertura(QryFundoInvestResg.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
     Exit;

  Try

    //Ricardo Cristiano - 23/07/2010 - N. Sol 140426 -  N. Kintana 878689
    //Busca dados do Tipo de Operacao
    FazQuery(QryAux,'SELECT * FROM TIPOOPERACAO T WHERE T.IDTIPOINVEST = '+QryFundoInvestResg.FieldByName('IDTIPOINVEST').AsString+
                    ' AND  (T.RECPAG = ''R'') AND (T.FLGTRANSF        = ''N'')'+
                    ' AND  (T.CODTIPDOC IS NOT NULL)'+
                    ' AND  (T.IDTIPOOPERACAO > 0) AND (T.NATUREZAOPERACAO =  ''D'')');
    //Alt_4
    If QryAux.IsEmpty Then
    begin
       MsgDlg('Falta cadastrar a operação de Resgate!',
              'Mensagem do Sistema', MtInformation,[MbOk],0);
       Exit;
    end;

    sNaturezaOper := QryAux.FieldByName('NATUREZAOPERACAO').AsString;
    sOperacao     := QryAux.FieldByName('DESCTIPOOPERACAO').AsString;
    // Inicia Transação
    If not dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;

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
       //Alt_2
       If Not ResgateFACFIF(QryResgate.FieldByName('IDTIPOINVEST').AsInteger,
                            QryResgate.FieldByName('IDPEDIDOFUNDO').AsInteger,
                            QryResgate.FieldByName('IDTIPOOPERACAO').AsInteger,
                            QryResgate.FieldByName('IDCARTEIRAINVEST').AsInteger,
                            QryResgate.FieldByName('IDFUNDOINVEST').AsInteger, -1,
                            QryResgate.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                            QryResgate.FieldByName('DATACOTIZACAO').AsDateTime,
                            QryResgate.FieldByName('DATAPEDIDO').AsDateTime,
                            QryResgate.FieldByName('DATALIQUIDACAO').AsDateTime, 0,
                            QryResgate.FieldByName('VLRPEDIDO').AsFloat,
                            QryResgate.FieldByName('VLRCOTA').AsFloat,
                            fVlrCustoAcoes, fVlrVarAcoes,
                            QryTipoCotaResg.FieldByName('IDTIPOCOTA').AsInteger) Then
       Begin
          //Al_8
          MsgDlg('Náo foi possível efetuar o Regate, '+#13+
                 'Esta operação será Cancelada.', 'Mensagem do Sistema', mtInformation,[MbOk],0);
          dtmBaseDados.dbBaseDados.Rollback;
          DbGrdrResgate.BringToFront;
          BtIncResg.Enabled := False;
          BtExcResg.Enabled := False;
          Dock974.Visible   := False;
          AcertaBotoesResgate;
          Exit;
       End;

       With DmFundoComum Do
       Begin
          OperComum.LimpaParametros(QryConfirmacao);
          QryConfirmacao.ParamByName('IDFUNDOINVEST').AsInteger     :=
                                     QryResgate.FieldByName('IDFUNDOINVEST').AsInteger;
          QryConfirmacao.ParamByName('IDTIPOCOTA').AsInteger        :=
                                     QryTipoCotaResg.FieldByName('IDTIPOCOTA').AsInteger;
          QryConfirmacao.ParamByName('IDTIPOOPERACAO').AsInteger    :=
                                     QryResgate.FieldByName('IDTIPOOPERACAO').AsInteger;
          QryConfirmacao.ParamByName('DATAOPERACAO').AsString       := dbDDataOperacao.Text;
          QryConfirmacao.ParamByName('DATACOTIZACAO').AsString      :=
                                     QryResgate.FieldByName('DATACOTIZACAO').AsString;
          QryConfirmacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
          //Al_15
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

             //AL_21
             //Rotina de confirmação das operações             
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
                                  QryConfirmacaoQTDOPERACAO.AsFloat,
                                  QryConfirmacaoVLRCOTA.AsFloat,
                                  QryConfirmacaoVLRLIQUIDO.AsFloat,
                                  QryConfirmacaoVLRIR.AsFloat,
                                  QryConfirmacaoVLRIOF.AsFloat,
                                  sNaturezaOper,
                                  sOperacao+' / '+QryConfirmacaoDESCFUNDOINVEST.AsString,
                                  sTipoOper , True,
                                  iPlanPrevCtbPatro, -1, -1,
                                  QryConfirmacaoVLRRENDIMENTO.AsFloat, sMens,
                                  QryConfirmacaoIDTIPOCOTA.AsInteger) Then
             Begin
                //Al_8
                //AL_21
                if sMens <> '' then
                   MsgDlg('Não foi possível confirmar o Resgate' + #13 +
                          'Mensagem: ' + sMens,
                          'Mensagem do Sistema', mtInformation, [MbOk],0)
                else
                   MsgDlg('Não foi possível confirmar o Resgate' + #13 +
                          'Ocorreu um problema durante o processo de gravação' + #13 +
                          'Refaça a operação',
                          'Mensagem do Sistema', mtInformation,[MbOk],0);
                QryConfirmacao.Close;
                dtmBaseDados.dbBaseDados.Rollback;
                DbGrdrResgate.BringToFront;
                BtIncResg.Enabled := False;
                BtExcResg.Enabled := False;
                Dock974.Visible   := False;
                AcertaBotoesResgate;
                Exit;
             End;

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

          //Al_5
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
                                          QryResgate.FieldByName('IDTIPOCOTA').AsInteger,
                                          0,0,DbEdTaxaPerfor.Value) Then
           Begin
              QryConfirmacao.Close;
              dtmBaseDados.dbBaseDados.Rollback;
              DbGrdrResgate.BringToFront;
              BtIncResg.Enabled := False;
              BtExcResg.Enabled := False;
              Dock974.Visible   := False;
              AcertaBotoesResgate;
              Exit;
           End;

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

       //Al_5
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
               fVlrCustoAcoes, fVlrVarAcoes
               QryResgate.FieldByName('IDTIPOCOTA').AsInteger,
               0,0,DbEdTaxaPerfor.Value) Then
       Begin
          dtmBaseDados.dbBaseDados.Rollback;
          DbGrdrResgate.BringToFront;
          BtIncResg.Enabled := False;
          BtExcResg.Enabled := False;
          Dock974.Visible   := False;
          AcertaBotoesResgate;
          Exit;
       End;
    End;

    //Al_16
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

    // Confirma Transação
    If dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.Commit;

    QryTipoFundoInvest.Close;
    QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                                          QryFundoInvestResg.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
    QryTipoFundoInvest.Open;

    If StrToDate(dbDDataOperacao.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
    begin
       //Alt_3
       If Not Reprocessamento(iTipoInvestUsu,
                              QryFundoInvestResg.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                              QryFundoInvestResg.FieldByName('IDFUNDOINVEST').AsInteger,
                              iPlanPrevCtbPatro,
                              StrToDate(dbDDataOperacao.Text),
                              QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                              QryFundoInvestResg.FieldByName('DTAINIPROC').AsDateTime,
                              True,
                              QryTipoCotaResg.FieldByName('IDTIPOCOTA').AsInteger) Then
          //AL_23                              
          MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                 'Mensagem do Sistema', MtInformation,[MbOk],0);
    end;

  Except
    On E:Exception Do Begin
      //Al_8
      MsgDlg('Náo foi possível efetuar o Resgate:'#13+ E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
      dtmBaseDados.dbBaseDados.Rollback;
    End;
  End;

  If StrToDate(dbDDataOperacao.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
     DtEdDataReferenciaGeral.Text := QryTipoFundoInvest.FieldByName('DATAULTFECH').AsString
  else
     DtEdDataReferenciaGeral.Date := QryResgateDATAPEDIDO.AsDateTime;

  QryTipoFundoInvest.Close;

  // Volta Ambiente
  DbGrdrResgate.BringToFront;

  BtIncResg.Enabled := False;
  BtExcResg.Enabled := False;
  Dock974.Visible   := False;

  AcertaBotoesResgate;

  DtEdDataReferenciaGeralExit(Sender);

end;

procedure TFrmCadOperFundosDirCred.BtOkAplicClick(Sender: TObject);
Var
  //AL_21
  sTipoOper, sNaturezaOper, sOperacao, sMens : String;
  iIdForCli, iPlanilha, iDocumento, iPlano : Integer;
  fVlrCustoAcoes, fVlrVarAcoes : Currency;
begin

  PnlSelecao.Enabled   := True;
  TbsAplicacao.Enabled := True;
  TbsResgate.Enabled   := True;
  TbsVenda.Enabled     := True;
  TbsSaldo.Enabled     := True;

  fVlrCustoAcoes      := 0;
  fVlrVarAcoes        := 0;

  If Not VerificaAplicacao Then
     Exit;

  //AL_18
  if VerEmAbertura(QryFundoInvestAplic.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
     Exit;

  Try
    If not dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;

// Preenche outros dados
    QryAplicacao.FieldByName('IDOPERACAOFUNDO').AsInteger:= LeUltRegistro(Nil,'OPERACAOFUNDO');

    QryAplicacao.FieldByName('IDTIPOINVEST').AsInteger:=
                              QryFundoInvestAplic.FieldByName('IDTIPOINVEST').AsInteger;

    QryAplicacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger    :=
                              QryFundoInvestAplic.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

    if QryFundoInvestAplic.FieldByName('IDCARTEIRAINVEST').AsInteger = 0 then
       QryAplicacao.FieldByName('IDCARTEIRAINVEST').Clear
    else
       QryAplicacao.FieldByName('IDCARTEIRAINVEST').AsInteger :=
                                 QryFundoInvestAplic.FieldByName('IDCARTEIRAINVEST').AsInteger;

    QryAplicacao.FieldByName('QTDDECQTD').AsInteger           :=
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
                                       QryAplicacaoIDTIPOOPERACAO.AsInteger,
                                       pRPI.IDTIPOCLIENTEEMI);

    If (QryAplicacaoDATAOPERACAO.AsDateTime <> QryAplicacaoDATACOTIZACAO.AsDateTime) And
       (QryAplicacaoQTDOPERACAO.AsFloat = 0) Then
       sTipoOper := 'CTZ'
    Else
       sTipoOper := 'OPE';

    //AL_21       
    //Rotina de confirmação das operações
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
                         QryAplicacaoVLROPERACAO.AsFloat, 0, 0,
                         QryTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString,
                         Trim(QryTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                              QryFundoInvestAplicDESCFUNDOINVEST.AsString, sTipoOper, True,
                         iPlanPrevCtbPatro, -1, -1, 0, sMens,
                         QryTipoCotaApl.FieldByName('IDTIPOCOTA').AsInteger) Then
    Begin
      //Al_8
      //AL_21
      if sMens <> '' then
         MsgDlg('Não foi possível confirmar a Operação' + #13 +
                'Mensagem: ' + sMens,
                'Mensagem do Sistema', mtInformation, [MbOk],0)
      else
         MsgDlg('Não foi possível confirmar a Operação' + #13 +
                'Ocorreu um problema durante o processo de gravação' + #13 +
                'Refaça a operação',
                'Mensagem do Sistema', mtInformation,[MbOk],0);

      DtmBaseDados.dbBaseDados.Rollback;
      BtCancAplicClick(Sender);
      Exit;
    End;

    ExecutaQuery(QryAux,
          'UPDATE OPERACAOFUNDO SET STACONFIRMA = ''S'' WHERE '+
          '(IDOPERACAOFUNDO   = '''+IntToStr(QryAplicacaoIDOPERACAOFUNDO.AsInteger)  +''')');

    QryAux.Close;

    If (DbEdCota.Value <> DbEdCotaNegApl.Value) Then
       fVlrVarAcoes    := OperComum.Round((DbEdCotaNegApl.Value*DbEdQtdOper.Value)-
                                          (DbEdCota.Value*DbEdQtdOper.Value),2);

    fVlrVarAcoes       := 0;

    //Al_6
    //Al_5
    If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
            QryAplicacao.FieldByName('IDTIPOOPERACAO').AsInteger,
            QryAplicacao.FieldByName('IDTIPOINVEST').AsInteger,
            QryAplicacao.FieldByName('IDCARTEIRAINVEST').AsInteger,
            QryAplicacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
            iIdForCli,
            QryAplicacao.FieldByName('IDFUNDOINVEST').AsInteger,
            StrToDate(DbDtDataAplicacao.Text),
            StrToDate(DbDtDataLiquidacao.Text),
            'OPE', QryTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString,
            DbLkcFundoInvest.Text+' / '+sPlanPrevCtbPatro,
            True,
            QryAplicacao.FieldByName('VLROPERACAO').AsFloat,
            0,
            0,
            QryAplicacao.FieldByName('VLRTAXAS').AsFloat,
            QryAplicacao.FieldByName('VLRCORRETAGEM').AsFloat,
            fVlrCustoAcoes, fVlrVarAcoes, -1, 0, dbreVariacao.Value, 0
            QryTipoOperacao.FieldByName('FLGCONTAINVEST').AsInteger) Then
    Begin
      DtmBaseDados.dbBaseDados.Rollback;
      BtCancAplicClick(Sender);
      Exit;
    End;

    //Al_7
    With QryUpdOperacaoApl Do
    Begin
      Close;
      ParamByName('IDOPERACAOFUNDO').AsInteger      := QryAplicacao.FieldByName('IDOPERACAOFUNDO').AsInteger;
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

    dtmBaseDados.dbBaseDados.Commit;

    QryTipoFundoInvest.Close;
    QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                                          QryFundoInvestAplic.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
    QryTipoFundoInvest.Open;

    If StrToDate(DbDtDataAplicacao.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
    begin
       //Alt_3
       If Not Reprocessamento(iTipoInvestUsu,
                              QryFundoInvestAplic.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                              QryFundoInvestAplic.FieldByName('IDFUNDOINVEST').AsInteger,
                              iPlanPrevCtbPatro,
                              StrToDate(DbDtDataAplicacao.Text),
                              QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                              QryFundoInvestAplic.FieldByName('DTAINIPROC').AsDateTime
                              True,
                              QryTipoCotaApl.FieldByName('IDTIPOCOTA').AsInteger) Then
          //AL_23                    
          MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                 'Mensagem do Sistema', MtInformation,[MbOk],0);
    end;

  Except
    On E:Exception Do Begin
      //Al_8
      MsgDlg('Não foi possível efetuar a Operação:'#13+E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
      QryAux.Close;
      QryUpdParaminvest.Close;
      dtmBaseDados.dbBaseDados.Rollback;
    End;
  End;

  If StrToDate(DbDtDataAplicacao.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
     DtEdDataReferenciaGeral.Text := QryTipoFundoInvest.FieldByName('DATAULTFECH').AsString
  else
     DtEdDataReferenciaGeral.Date := QryAplicacaoDATAOPERACAO.AsDateTime;

// Volta Ambiente
  DbGrdAplicacao.BringToFront;

  BtIncAplic.Enabled := False;
  BtExcAplic.Enabled := False;
  Dock978.Visible    := False;

  AcertaBotoesAplicacao;

  With QryFundoInvestAplic Do
  Begin
     Close;
     Open;
  End;

  DtEdDataReferenciaGeralExit(Sender);  

end;

procedure TFrmCadOperFundosDirCred.BtExcAplicClick(Sender: TObject);
Var
  //Al_9
  dDataIniProc, dDataOper : TDateTime;
  iTipoFundoInvest, iFundoInvest : Integer;
begin
  // AL_14
  // Testa dados
  If (QryAplicacao.Active = False) Or (QryAplicacao.IsEmpty = True) Then 
  Begin
     //Al_8
     MsgDlg('A consulta não foi executada.','Mensagem do Sistema',mtInformation,[mbOk],0);
     BtExcAplic.Down := False;
     Exit;
  End;

  //AL_19
  if not CtrlInvContab.TestaPeriodo(QryAplicacaoDATAOPERACAO.AsString, iTipoInvestUsu) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     BtExcAplic.Down := False;
     Exit;
  end;

  //AL_18
  if VerEmAbertura(QryAplicacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
     Exit;

  If MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,
            [mbYes, mbNo],0) = mrYes  Then
  Begin

    Try
       inherited;

      If not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      // Al_10
      If Not ProcExcluiFundo(QryAplicacao.FieldByName('CODDOCUMENTO').AsInteger,
                             QryAplicacao.FieldByName('PLNCODIGO').AsInteger,
                             QryAplicacao.FieldByName('PLANO').AsInteger,
                             QryAplicacao.FieldByName('IDTIPOINVEST').AsInteger,
                             QryAplicacao.FieldByName('DATAOPERACAO').AsDateTime,
                             True) Then
      Begin
         BtExcAplic.Down := False;

         If dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Rollback;
         QryAplicacao.Close;
         QryAplicacao.Open;
         Exit;
      End;

      // Al_11
      QryDelHistFundo.Close;
      QryDelHistFundo.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      QryDelHistFundo.ParamByName('IDFUNDOINVEST').AsInteger     := QryAplicacao.FieldByName('IDFUNDOINVEST').AsInteger;
      QryDelHistFundo.ParamByName('IDTIPOCOTA').AsInteger        := QryAplicacao.FieldByName('IDTIPOCOTA').AsInteger;
      QryDelHistFundo.ParamByName('DATAAPLICACAO').AsString      := QryAplicacao.FieldByName('DATAOPERACAO').AsString;
      QryDelHistFundo.ExecSql;

      //Al_9
      dDataIniProc      := QryAplicacao.FieldByName('DTAINIPROC').AsDateTime;

      dDataOper         := QryAplicacao.FieldByName('DATAOPERACAO').AsDateTime;
      iTipoFundoInvest  := QryAplicacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      iFundoInvest      := QryAplicacao.FieldByName('IDFUNDOINVEST').AsInteger;

      // Exclui Operacao de Aplicacao
      QryAplicacao.Delete;
      QryAplicacao.CommitUpdates;

      If dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.Commit;

      // Al_12
      QryTipoFundoInvest.Close;
      QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                         QryAplicacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      QryTipoFundoInvest.Open;

      If (dDataOper <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime) Then
      begin
         //Al_9
         If Not Reprocessamento(iTipoInvestUsu, iTipoFundoInvest, iFundoInvest,
                                iPlanPrevCtbPatro,
                                dDataOper,
                                QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                dDataIniProc,
                                True,
                                QryTipoCotaApl.FieldByName('IDTIPOCOTA').AsInteger) Then
            //AL_23
            MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                   'Mensagem do Sistema', MtInformation,[MbOk],0);
      end;

      If dDataOper < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
         DtEdDataReferenciaGeral.Text := QryTipoFundoInvest.FieldByName('DATAULTFECH').AsString;

      QryTipoFundoInvest.Close;

    Except
      On E:Exception Do Begin
        //Al_8
        MsgDlg('Não foi possível excluir a Operação:'#13+
               E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
        BtExcAplic.Down := False;
        If dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.Rollback;
        QryAplicacao.Close;
        QryAplicacao.Open;
        Exit;
      End;
    End; // Except
  End; // If Exclui

  If QryAplicacao.Eof Then
  Begin
     BtIncAplic.Enabled := True;
     BtExcAplic.Enabled := False;
  End;

  BtExcAplic.Down := False;

  DtEdDataReferenciaGeralExit(Sender);

end;

procedure TFrmCadOperFundosDirCred.BtExcResgClick(Sender: TObject);
Var
  wStr      : String;
  iTipoFundoInvest, iFundoInvest : Integer;
  //Al_9
  dDataIniProc, dDataResgateIni, dDataResgateFim, dDataOper : TDateTime;
begin

  If (QryResgate.Active = False) Or (QryResgate.IsEmpty = True) Then Begin
    //Al_8
    MsgDlg('A consulta não foi executada.','Mensagem do Sistema',mtWarning,[mbOk],0);
    BtExcResg.Down := False;
    Exit;
  End;

  //AL_14
  //AL_19
  if not CtrlInvContab.TestaPeriodo(QryResgateDATAPEDIDO.AsString, iTipoInvestUsu) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     BtExcResg.Down := False;
     Exit;
  end;

  //AL_18
  if VerEmAbertura(QryResgate.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
     Exit;

  If MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,
            [mbYes, mbNo],0) = mrYes  Then
  Begin
    Try
      inherited;

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

      iTipoFundoInvest := QryResgate.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      iFundoInvest     := QryResgate.FieldByName('IDFUNDOINVEST').AsInteger;
      dDataOper        := QryResgate.FieldByName('DATAPEDIDO').AsDateTime;
      //Al_9
      dDataIniProc     := QryResgate.FieldByName('DTAINIPROC').AsDateTime;
      // Exclui o resgate da tabela PEDIDOFUNDO
      QryResgate.Delete;
      QryResgate.CommitUpdates;

      If dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.Commit;

      // Al_12
      QryTipoFundoInvest.Close;
      QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                         QryResgate.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      QryTipoFundoInvest.Open;

      If dDataOper <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
      begin
         //Al_9
         If Not Reprocessamento(iTipoInvestUsu, iTipoFundoInvest, iFundoInvest,
                                iPlanPrevCtbPatro, dDataOper,
                                QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                dDataIniProc,
                                True,
                                QryTipoCotaResg.FieldByName('IDTIPOCOTA').AsInteger) Then
            //AL_23
            MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                   'Mensagem do Sistema', MtInformation,[MbOk],0);
      end;

      If dDataOper < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
         DtEdDataReferenciaGeral.Text := QryTipoFundoInvest.FieldByName('DATAULTFECH').AsString;

      QryTipoFundoInvest.Close;
    Except
      On E:Exception Do Begin
        //Al_8
        MsgDlg('Não foi possível excluir o Resgate:'#13+
               E.Message,'Mensagem do Sistema', mtWarning, [mbOk],0);
        BtExcResg.Down       := False;               

        If dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.Rollback;
        QryResgate.Close;
        QryResgate.Open;
        Exit;
      End;
    End; // Except
  End; // If Exclui

  If QryResgate.Eof Then
  Begin
     BtIncResg.Enabled := True;
     BtExcResg.Enabled := False;
  End;

  BtExcResg.Down       := False;

  DtEdDataReferenciaGeralExit(Sender);

end;

function TFrmCadOperFundosDirCred.ExcluiResgate(sPedido : String) : Boolean;
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
      //Al_8
      MsgDlg('Não foi possível excluir o pedido.','Mensagem do Sistema',mtWarning,[mbOk],0);
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
         //Al_8
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
      //Al_8
      MsgDlg('Não foi possível excluir o IR Litigio.','Mensagem do Sistema',mtWarning,[mbOk],0);
      Result := False;
      Exit;
   End;
   QryAux.Close;

   wStr :=
    'DELETE FROM HISTFUNDO '+
    'WHERE IDTIPOOPERACAO NOT IN (-12,-13) AND IDOPERACAOFUNDO IN (SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO '+
    'WHERE IDPEDIDOFUNDO = '+sPedido+')';

   If Not ExecutaQuery(QryAux,wStr) Then
   Begin
      //Al_8
      MsgDlg('Não foi possível excluir o Histórico da operação.','Mensagem do Sistema',mtWarning,[mbOk],0);
      Result := False;
      Exit;
   End;
   QryAux.Close;

   wStr := 'DELETE FROM OPERACAOFUNDO WHERE IDPEDIDOFUNDO = '+sPedido;

   If Not ExecutaQuery(QryAux,wStr) Then
   Begin
      //Al_8
      MsgDlg('Não foi possível excluir a Operação.','Mensagem do Sistema',mtWarning,[mbOk],0);
      QryAux.Close;
      Result := False;
      Exit;
   End;
   QryAux.Close;
   Result := True;
end;

procedure TFrmCadOperFundosDirCred.sbtnMovimentoClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmConsMovFundos, TfrmConsMovFundos, False);
   sbtnMovimento.Down := False;
end;

procedure TFrmCadOperFundosDirCred.DbEdTaxasEmolAplExit(Sender: TObject);
begin
  inherited;
  DbEdValorTotalApl.value := DbEdValorApl.value +
                            (DbEdTaxasEmolApl.value + DbEdCorretagemApl.value);
end;

procedure TFrmCadOperFundosDirCred.DbEdValorAplExit(Sender: TObject);
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

   fQtdAplicado := StrToFloat(wStr);
   DbEdValorTotalApl.value := DbEdValorApl.value +
                             (DbEdTaxasEmolApl.value + DbEdCorretagemApl.value);

end;

procedure TFrmCadOperFundosDirCred.DbRValorLiquidoExit(Sender: TObject);
begin
  inherited;
  DbEdValorTotalReg.value := DbRValorLiquido.value -
                            (DbEdTaxaPerfor.Value  + DbEdTaxasEmolResg.Value +
                             DbEdCorretagemResg.Value);
end;

procedure TFrmCadOperFundosDirCred.DBLTipoCotaCloseUp(Sender: TObject; LookupTable,
                                                      FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   AbreQrySaldo;
end;

procedure TFrmCadOperFundosDirCred.DbLkcFundoSaldoExit(Sender: TObject);
begin
  inherited;
   AbreQrySaldo;
end;

procedure TFrmCadOperFundosDirCred.DblTipoFundoExit(Sender: TObject);
begin
  inherited;
  With qryGestorCart Do Begin
    Close;
    ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
        QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
    If DblTipoFundo.Text = ''  Then ParamByName('IDTIPOFUNDOINVEST').Clear;
    Open;
  End;
end;

procedure TFrmCadOperFundosDirCred.DbEdCotaNegAplExit(Sender: TObject);
var
   wStr : String;
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

  DbEdValorTotalApl.value := DbEdValorApl.value + DbEdTaxasEmolApl.value + DbEdCorretagemApl.value;

  dbreVariacao.Value := (DbEdCota.Value - DbEdCotaNegApl.Value) * fQtdAplicado;//QryAplicacao.FieldByName('QTDOPERACAO').AsFloat;

end;

procedure TFrmCadOperFundosDirCred.DbEdCorretagemAplExit(Sender: TObject);
begin
  inherited;
  DbEdValorTotalApl.value := DbEdValorApl.value +
                            (DbEdTaxasEmolApl.value + DbEdCorretagemApl.value);
end;

procedure TFrmCadOperFundosDirCred.DbLkcFundoInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   ValidaFundoTipoCotaApl;
end;

procedure TFrmCadOperFundosDirCred.DbLkcFundoInvestExit(Sender: TObject);
begin
  inherited;
   ValidaFundoTipoCotaApl;
end;

procedure TFrmCadOperFundosDirCred.DbLkcTipoCotaAplExit(Sender: TObject);
begin
  inherited;
   ValidaFundoTipoCotaApl;
end;

procedure TFrmCadOperFundosDirCred.DbLkcTipoCotaAplCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   ValidaFundoTipoCotaApl;
end;

procedure TFrmCadOperFundosDirCred.ValidaFundoTipoCotaResg;
Var
   iPz              : Integer;
  DadosCota         : TDadosCota;
begin
  inherited;

   If Trim(DbLkcFundoInvestResg.Text) = '' Then
   Begin
      DbLkcFundoInvestResg.SetFocus;
      Exit;
   End;

   If Trim(DbLkcTipoCotaResg.Text) = '' Then
   Begin
      DbLkcTipoCotaResg.SetFocus;
      Exit;
   End;

   If Not VerificaAtualizacao(QryFundoInvestResg.FieldByName('IDFUNDOINVEST').AsInteger,
                              QryTipoCotaResg.FieldByName('IDTIPOCOTA').AsInteger,
                              QryFundoInvestResg.FieldByName('DATAINICIOFUNDO').AsDateTime,
                              dbDDataOperacao.Date) Then
   Begin
      MsgDlg('Há uma aplicação que não foi atualizada para esse dia. Verifique!','Mensagem do Sistema',mtInformation,[mbOk],0);
      BtCancResg.Click;
      Exit;
   End;

   If Not VerificaOperacao('D',
                           QryFundoInvestResg.FieldByName('IDFUNDOINVEST').AsInteger,
                           QryTipoCotaResg.FieldByName('IDTIPOCOTA').AsInteger,
                           dbDDataOperacao.Date) Then
   Begin
      MsgDlg('Já há Resgate para esse Fundo nessa data.','Mensagem do Sistema',mtInformation,[mbOk],0);
      BtCancResg.Click;
      Exit;
   End;

   With QrySaldoFundoTotal Do Begin
     Close;
     ParamByName('IDFUNDOINVEST').AsString      := DbLkcFundoInvestResg.LookupValue;
     ParamByName('DATAMOVFUNDO').AsString       := dbDDataOperacao.Text;

     ParamByName('IDTIPOCOTA').AsInteger        :=
                      QryTipoCotaResg.FieldByName('IDTIPOCOTA').AsInteger;
     If DbLkcTipoCotaResg.Text = ''  Then ParamByName('IDTIPOCOTA').Clear;

     ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                      QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
     If DblTipoFundo.Text = ''  Then ParamByName('IDTIPOFUNDOINVEST').Clear;

     ParamByName('IDGESTORCARTEIRA').AsInteger  :=
                      QryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
     If dblGestorCarteira.Text = ''  Then ParamByName('IDGESTORCARTEIRA').Clear;

     ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
     ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
     Open;
   End;

   dDtaLiq := OperComum.DataPrazo(dbDDataOperacao.Date,
                                  QryFundoInvestResg.FieldByName('PZOLIQRESG').AsInteger);

   DbDtDataLiquidacao.Date := dDtaLiq;

   dDtaCot := OperComum.DataPrazo(DbDtDataAplicacao.Date,
                                                  QryFundoInvestAplic.FieldByName('PZOCOTAPLIC').AsInteger);

   DbDtDataCotizacaoAplic.Date :=  dDtaCot;


   QryResgateDATALIQUIDACAO.AsDateTime := dDtaLiq;

   DtEdDataReferenciaGeral.Date        := dDtaLiq;

   DbEdCotaResg.DecDigits              := QryFundoInvestResgQTDDECVALOR.AsInteger;

   QryResgateDATACOTIZACAO.AsDateTime  := OperComum.DataPrazo(dbDDataOperacao.Date,
                                                              QryFundoInvestResg.FieldByName('PZOCOTRESG').AsInteger);
// Busca dados da Cota
   DadosCota := BuscaCotaFundo(QryAux,
                              StrToInt(DbLkcFundoInvestResg.LookupValue),
                              QryResgateDATACOTIZACAO.AsDateTime,
                              StrToInt(DbLkcTipoCotaResg.LookupValue));

   DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
   DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;

   If (QryResgateDATACOTIZACAO.AsDateTime = dbDDataOperacao.Date) And
      (DadosCota.DataCota = 0) Then Begin
      MsgDlg('Cota do Fundo não encontrada nesta data.','Mensagem do Sistema',mtInformation,[mbOk],0);
      DbLkcFundoInvestResg.Clear;
      DbLkcTipoCotaResg.Clear;
      Exit;
   End Else Begin
      DadosCota.DataCota    := QryAux.FieldByName('DATACOTA').AsDateTime;
      DadosCota.VlrCota     := QryAux.FieldByName('VLRCOTA').AsFloat;
      DbEdCotaResg.Value    := DadosCota.VlrCota;
      DbEdCotaNegResg.Value := DadosCota.VlrCota;
   End;

end;


procedure TFrmCadOperFundosDirCred.DbLkcFundoInvestResgCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   ValidaFundoTipoCotaResg
end;

procedure TFrmCadOperFundosDirCred.DbLkcFundoInvestResgExit(
  Sender: TObject);
begin
  inherited;
   ValidaFundoTipoCotaResg;
end;

procedure TFrmCadOperFundosDirCred.DbLkcTipoCotaResgExit(Sender: TObject);
begin
  inherited;
   ValidaFundoTipoCotaResg;
end;

procedure TFrmCadOperFundosDirCred.DbLkcTipoCotaResgCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   ValidaFundoTipoCotaResg;
end;

procedure TFrmCadOperFundosDirCred.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   qryTipoCotaVenda.Close;
   QryTipoCotaSld.Close;
   QryTipoCotaApl.Close;
   QryTipoCotaResg.Close;
end;

procedure TFrmCadOperFundosDirCred.btIncVendaClick(Sender: TObject);
begin
  edCotaFdoVenda.Clear;

  inherited;

  Dock976.Visible := True;

  // Testa dados
  If (QryVenda.Active = False) Then
  Begin
    //Al_8
    MsgDlg('A consulta não foi executada.','Mensagem do Sistema',mtWarning,[mbOk],0);
    BtIncVenda.Down := False;
    Exit;
  End;

  PnlSelecao.Enabled   := False;
  TbsAplicacao.Enabled := False;
  TbsResgate.Enabled   := False;
  TbsSaldo.Enabled     := False;

  PgcSaldos.ActivePage := tbsVenda;

  // Prepara Ambiente
  AcertaBotoesVenda;

  PnlVenda.BringToFront;

  // Insere Registro
  QryVenda.Append;
  QryVendaDATAPEDIDO.AsDateTime       := DtEdDataReferenciaGeral.Date;
  QryVendaIDPLANPREVCTBPATR.AsInteger := iPlanPrevCtbPatro;

  if dtOperVenda.Canfocus then
     dtOperVenda.SetFocus;
end;

procedure TFrmCadOperFundosDirCred.btExcVendaClick(Sender: TObject);
Var
  wStr      : String;
  iTipoFundoInvest, iFundoInvest : Integer;
  //Al_9
  dDataIniProc, dDataVendaIni, dDataVendaFim, dDataOper : TDateTime;
begin
   If (QryVenda.Active = False) Or (QryVenda.IsEmpty = True) Then
   Begin
      //Al_8
      MsgDlg('A consulta não foi executada.','Mensagem do Sitema',mtWarning,[mbOk],0);
      BtExcVenda.Down := False;
      Exit;
   End;

   //AL_14
   //AL_19
   if not CtrlInvContab.TestaPeriodo(qryVendaDATAPEDIDO.AsString, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      BtExcVenda.Down := False;
      Exit;
   end;

   If MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,
             [mbYes, mbNo],0) = mrYes  Then
   Begin
      Try
         inherited;
         // Inicia Transação
         If not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         // Deleta o resgate do dia em todas as tabelas do Sistema(Fundo, Financeiro e Contabilidade)
         If Not ExcluiResgate(QryVenda.FieldByName('IDPEDIDOFUNDO').AsString) Then
         Begin
            BtExcVenda.Down      := False;
            If dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
            QryVenda.Close;
            QryVenda.Open;
            Exit;
         End;

         iTipoFundoInvest := QryVenda.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
         iFundoInvest     := QryVenda.FieldByName('IDFUNDOINVEST').AsInteger;
         dDataOper        := QryVenda.FieldByName('DATAPEDIDO').AsDateTime;
         //Al_9
         dDataIniProc     := QryVenda.FieldByName('DTAINIPROC').AsDateTime;
         // Exclui o resgate da tabela PEDIDOFUNDO
         QryVenda.Delete;
         QryVenda.CommitUpdates;

         If dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;
         // Al_12
         QryTipoFundoInvest.Close;
         QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger := QryResgate.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
         QryTipoFundoInvest.Open;

         If dDataOper <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
         begin
            //Al_9
            If Not Reprocessamento(iTipoInvestUsu, iTipoFundoInvest, iFundoInvest,
                                   iPlanPrevCtbPatro, dDataOper,
                                   QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                   dDataIniProc,
                                   True,
                                   QryTipoCotaVenda.FieldByName('IDTIPOCOTA').AsInteger) Then
               //AL_23                    
               MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                      'Mensagem do Sistema', MtInformation,[MbOk],0);
         end;

         If dDataOper < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
            DtEdDataReferenciaGeral.Text := QryTipoFundoInvest.FieldByName('DATAULTFECH').AsString;

         QryTipoFundoInvest.Close;
          //Al_13
      Except
         On E:Exception Do
         Begin
            //Al_8
            MsgDlg('Não foi possível excluir a Venda do Cadastro:'#13 +
                   E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            BtExcResg.Down      := False;

            If dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
            QryVenda.Close;
            QryVenda.Open;
            Exit;
         End;
      End;
   End;

   If QryVenda.Eof Then
   Begin
      BtIncVenda.Enabled := True;
      BtExcVenda.Enabled := False;
   End;

   BtExcVenda.Down       := False;

   DtEdDataReferenciaGeralExit(Sender);
end;

procedure TFrmCadOperFundosDirCred.btOkVendaClick(Sender: TObject);
Var
  //AL_21
  sTipoOper, sNaturezaOper, sOperacao, sMens : String;
  iIdForCli, iPlanilha, iDocumento, iPlano : Integer;
  fValorOperacao, fValorIR, fVlrCustoAcoes, fVlrVarAcoes : Currency;
  dDataResgateIni, dDataResgateFim : TDateTime;
begin
  PnlSelecao.Enabled   := True;
  TbsAplicacao.Enabled := True;
  TbsResgate.Enabled   := True;
  TbsVenda.Enabled     := True;
  TbsSaldo.Enabled     := True;

  If Not VerificaVenda Then
     Exit;

  Try
    If not dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;

    // Busca dados do Tipo de Operacao
    FazQuery(QryAux,'SELECT * FROM TIPOOPERACAO WHERE IDTIPOINVEST='+QryFundoInvestVenda.FieldByName('IDTIPOINVEST').AsString+
                       ' AND IDTIPOOPERACAO = -101');

    sNaturezaOper := QryAux.FieldByName('NATUREZAOPERACAO').AsString;
    sOperacao     := QryAux.FieldByName('DESCTIPOOPERACAO').AsString;

    // Caso Inserindo Gera sequencial
    If DsVenda.State In [DsInsert] Then
       QryVenda.FieldByName('IDPEDIDOFUNDO').AsInteger:= LeUltRegistro(Nil,'PEDIDOFUNDO');

    // Preenche outros dados
    QryVenda.FieldByName('IDTIPOINVEST').AsInteger    :=
                   QryFundoInvestVenda.FieldByName('IDTIPOINVEST').AsInteger;

    QryVenda.FieldByName('IDTIPOFUNDOINVEST').AsInteger    :=
                   QryFundoInvestVenda.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

    QryVenda.FieldByName('IDTIPOOPERACAO').AsInteger   :=
                           QryAux.FieldByName('IDTIPOOPERACAO').AsInteger;
    QryVenda.FieldByName('NATUREZAOPERACAO').AsString  := sNaturezaOper;

    if QryFundoInvestResg.FieldByName('IDCARTEIRAINVEST').AsInteger = 0 then
       QryVenda.FieldByName('IDCARTEIRAINVEST').Clear
    else
       QryVenda.FieldByName('IDCARTEIRAINVEST').AsInteger :=
                      QryFundoInvestVenda.FieldByName('IDCARTEIRAINVEST').AsInteger;

    QryVenda.FieldByName('IDPLANPREVCTBPATR').AsInteger:= iPlanPrevCtbPatro;

    QryVenda.FieldByName('DATAPEDIDO').AsDateTime      := dtOperVenda.Date;

    QryVenda.FieldByName('DATACOTIZACAO').AsDateTime   := dtCotVenda.Date;

    QryVenda.FieldByName('DATALIQUIDACAO').AsDateTime  := dtLiqVenda.Date;

    //AL_1
    // Confirma Operacao
    QryVenda.Post;
    QryVenda.CommitUpdates;

    QryAux.Close;

    iIdForCli := OperComum.BuscaForCli(QryVenda.FieldByName('IDTIPOINVEST').AsInteger,
                                       QryFundoInvestVenda.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                       QryVenda.FieldByName('IDTIPOOPERACAO').AsInteger,
                                       pRPI.IDTIPOCLIENTEEMI);
    iPlanilha  := -1;
    iDocumento := -1;
    iPlano     := -1;

    If (QryVendaDATAPEDIDO.AsDateTime = QryVendaDATACOTIZACAO.AsDateTime) Then
    Begin
       //Alt_2
       If Not ResgateFACFIF(QryVenda.FieldByName('IDTIPOINVEST').AsInteger,
                            QryVenda.FieldByName('IDPEDIDOFUNDO').AsInteger,
                            QryVenda.FieldByName('IDTIPOOPERACAO').AsInteger,
                            QryVenda.FieldByName('IDCARTEIRAINVEST').AsInteger,
                            QryVenda.FieldByName('IDFUNDOINVEST').AsInteger, -1,
                            QryVenda.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                            QryVenda.FieldByName('DATACOTIZACAO').AsDateTime,
                            QryVenda.FieldByName('DATAPEDIDO').AsDateTime,
                            QryVenda.FieldByName('DATALIQUIDACAO').AsDateTime, 0,
                            QryVenda.FieldByName('VLRPEDIDO').AsFloat,
                            QryVenda.FieldByName('VLRCOTA').AsFloat,
                            fVlrCustoAcoes, fVlrVarAcoes,
                            QryTipoCotaVenda.FieldByName('IDTIPOCOTA').AsInteger) Then
       Begin
          //Al_8
          MsgDlg('Não foi possível efetuar a Venda, '+#13+
                 'Esta operação será Cancelada.', 'Mensagem do Sistema', mtInformation,[MbOk],0);

          dtmBaseDados.dbBaseDados.Rollback;
          dbgGridVenda.BringToFront;
          BtIncVenda.Enabled := False;
          BtExcVenda.Enabled := False;
          Dock976.Visible   := False;
          AcertaBotoesVenda;
          Exit;
       End;

       With DmFundoComum Do
       Begin
          OperComum.LimpaParametros(QryConfirmacao);
          QryConfirmacao.ParamByName('IDFUNDOINVEST').AsInteger     :=
                                     QryVenda.FieldByName('IDFUNDOINVEST').AsInteger;
          QryConfirmacao.ParamByName('IDTIPOCOTA').AsInteger        :=
                                     QryTipoCotaVenda.FieldByName('IDTIPOCOTA').AsInteger;
          QryConfirmacao.ParamByName('IDTIPOOPERACAO').AsInteger    :=
                                     QryVenda.FieldByName('IDTIPOOPERACAO').AsInteger;
          QryConfirmacao.ParamByName('DATAOPERACAO').AsString       := dbDDataOperacao.Text;
          QryConfirmacao.ParamByName('DATACOTIZACAO').AsString      :=
                                     QryVenda.FieldByName('DATACOTIZACAO').AsString;
          QryConfirmacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
          //Al_15
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
                                  qryContraParteVenda.FieldByName('IDPESSOA').AsInteger,
                                  QryConfirmacaoDATAOPERACAO.AsDateTime,
                                  QryConfirmacaoDATACOTIZACAO.AsDateTime,
                                  QryConfirmacaoDATALIQUIDACAO.AsDateTime,
                                  QryConfirmacaoQTDOPERACAO.AsFloat,
                                  QryConfirmacaoVLRCOTA.AsFloat,
                                  QryConfirmacaoVLRLIQUIDO.AsFloat,
                                  QryConfirmacaoVLRIR.AsFloat,
                                  QryConfirmacaoVLRIOF.AsFloat,
                                  sNaturezaOper,
                                  sOperacao+' / '+QryConfirmacaoDESCFUNDOINVEST.AsString,
                                  sTipoOper , True,
                                  iPlanPrevCtbPatro, -1, -1,
                                  QryConfirmacaoVLRRENDIMENTO.AsFloat, sMens, 
                                  QryConfirmacaoIDTIPOCOTA.AsInteger) Then
             Begin
                //Al_8
                if sMens <> '' then
                   MsgDlg('Não foi possível confirmar a Venda' + #13 +
                          'Mensagem: ' + sMens,
                          'Mensagem do Sistema', mtInformation, [MbOk],0)
                else
                   //Al_16
                   MsgDlg('Não foi possível efetuar esta Venda' + #13 +
                          'Ocorreu um problema ao gravar a operação' + #13 +
                          'Tente mais tarde',
                          'Mensagem do Sistema', mtInformation,[MbOk],0);
                QryConfirmacao.Close;
                dtmBaseDados.dbBaseDados.Rollback;
                dbgGridVenda.BringToFront;
                BtIncVenda.Enabled := False;
                BtExcVenda.Enabled := False;
                Dock976.Visible   := False;
                AcertaBotoesVenda;
                Exit;
             End;

             fValorIR       := fValorIR + QryConfirmacaoVLRIR.AsFloat;

             ExecutaQuery(QryAux,
                          'UPDATE OPERACAOFUNDO SET STACONFIRMA = ''S'' WHERE '+
                          '(IDOPERACAOFUNDO   = '''+
                          IntToStr(QryConfirmacaoIDOPERACAOFUNDO.AsInteger)  +''')');
             QryAux.Close;
             QryConfirmacao.Next;

          End;

          QryConfirmacao.Close;

          fVlrCustoAcoes := 0;
          fVlrVarAcoes   := 0;

          //AL_1
          If sTipoOper    = '' Then
             sTipoOper   := 'OPE';

          //Al_5
          If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                          QryVenda.FieldByName('IDTIPOOPERACAO').AsInteger,
                                          QryVenda.FieldByName('IDTIPOINVEST').AsInteger,
                                          QryVenda.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                          QryVenda.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                          qryContraParteVenda.FieldByName('IDPESSOA').AsInteger,
                                          QryVenda.FieldByName('IDFUNDOINVEST').AsInteger,
                                          QryVenda.FieldByName('DATAPEDIDO').AsDateTime,
                                          QryVenda.FieldByName('DATALIQUIDACAO').AsDateTime,
                                          sTipoOper, sNaturezaOper,
                                          dblkFundoInvestVenda.Text+' / '+sPlanPrevCtbPatro,
                                          True,
                                          QryVenda.FieldByName('VLRPEDIDO').AsFloat,
                                          fValorIR,
                                          QryVenda.FieldByName('VLRCOLOCACAO').AsFloat,
                                          QryVenda.FieldByName('VLRTAXAS').AsFloat,
                                          QryVenda.FieldByName('VLRCORRETAGEM').AsFloat,
                                          fVlrCustoAcoes, fVlrVarAcoes,
                                          QryVenda.FieldByName('IDTIPOCOTA').AsInteger,
                                          0,0,dbreTxPerformVenda.Value) Then
           Begin
              QryConfirmacao.Close;
              dtmBaseDados.dbBaseDados.Rollback;
              dbgGridVenda.BringToFront;
              BtIncVenda.Enabled := False;
              BtExcVenda.Enabled := False;
              Dock976.Visible   := False;
              AcertaBotoesVenda;
              Exit;
           End;
           //AL_1 - FIM
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

       //Al_5
       If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
               QryVenda.FieldByName('IDTIPOOPERACAO').AsInteger,
               QryVenda.FieldByName('IDTIPOINVEST').AsInteger,
               QryVenda.FieldByName('IDCARTEIRAINVEST').AsInteger,
               QryVenda.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
               qryContraParteVenda.FieldByName('IDPESSOA').AsInteger,
               QryVenda.FieldByName('IDFUNDOINVEST').AsInteger,
               StrToDate(dtOperVenda.Text),
               QryVenda.FieldByName('DATALIQUIDACAO').AsDateTime,
               'OPE', sNaturezaOper,
               DbLkFundoInvestVenda.Text+' / '+sPlanPrevCtbPatro,
               False,
               QryVenda.FieldByName('VLRPEDIDO').AsFloat,
               0,
               QryVenda.FieldByName('VLRCOLOCACAO').AsFloat,
               QryVenda.FieldByName('VLRTAXAS').AsFloat,
               QryVenda.FieldByName('VLRCORRETAGEM').AsFloat,
               fVlrCustoAcoes, fVlrVarAcoes
               QryVenda.FieldByName('IDTIPOCOTA').AsInteger,
               0,0,dbreTxPerformVenda.Value) Then
       Begin
          dtmBaseDados.dbBaseDados.Rollback;
          dbgGridVenda.BringToFront;
          BtIncVenda.Enabled := False;
          BtExcVenda.Enabled := False;
          Dock976.Visible   := False;
          AcertaBotoesVenda;
          Exit;
       End;

       With QryUpdPedido Do
       Begin
         Close;
         ParamByName('IDPEDIDOFUNDO').AsInteger        := QryVenda.FieldByName('IDPEDIDOFUNDO').AsInteger;
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

    End;

    If dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.Commit;

    QryTipoFundoInvest.Close;
    QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger := QryFundoInvestVenda.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
    QryTipoFundoInvest.Open;

    If StrToDate(dtOperVenda.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
    begin
       If Not Reprocessamento(iTipoInvestUsu,
                              QryFundoInvestVenda.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                              QryFundoInvestVenda.FieldByName('IDFUNDOINVEST').AsInteger,
                              iPlanPrevCtbPatro,
                              StrToDate(dtOperVenda.Text),
                              QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                              QryFundoInvestVenda.FieldByName('DTAINIPROC').AsDateTime,
                              True,
                              QryTipoCotaVenda.FieldByName('IDTIPOCOTA').AsInteger) Then
          //AL_23                    
          MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                 'Mensagem do Sistema', MtInformation,[MbOk],0);
    end;

  Except
     On E:Exception Do 
     Begin
        //Al_8
        MsgDlg('Não foi possível efetuar a Venda:'#13+
               E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
        dtmBaseDados.dbBaseDados.Rollback;
     End;
  End;

  If StrToDate(dtOperVenda.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
     DtEdDataReferenciaGeral.Text := QryTipoFundoInvest.FieldByName('DATAULTFECH').AsString
  else
     DtEdDataReferenciaGeral.Date := QryVendaDATAPEDIDO.AsDateTime;

  QryTipoFundoInvest.Close;

  // Volta Ambiente
  dbgGridVenda.BringToFront;

  BtIncVenda.Enabled := False;
  BtExcVenda.Enabled := False;
  Dock976.Visible   := False;

  AcertaBotoesVenda;

  DtEdDataReferenciaGeralExit(Sender);

end;

function TFrmCadOperFundosDirCred.VerificaVenda : Boolean;
Var
   sMessage : String;
Begin
  // Testa Dados
  If Trim(DbLkFundoInvestVenda.Text) = '' Then Begin
    MsgDlg('Indique o Fundo de Investimento.','Atenção',mtWarning,[mbOk],0);
    if DbLkFundoInvestVenda.CanFocus then
       DbLkFundoInvestVenda.SetFocus;
    Result := False;
    Exit;
  End;

  If Trim(DbLkTipoCotaVenda.Text) = '' Then Begin
    MsgDlg('Indique o Tipo de Cota.','Atenção',mtWarning,[mbOk],0);
    if DbLkTipoCotaVenda.Canfocus then
       DbLkTipoCotaVenda.SetFocus;
    Result := False;
    Exit;
  End;

  If Trim(dblkContraParteVenda.Text) = '' Then Begin
    MsgDlg('Indique a Contraparte.','Atenção',mtWarning,[mbOk],0);
    if dblkContraParteVenda.Canfocus then
       dblkContraParteVenda.SetFocus;
    Result := False;
    Exit;
  End;

  If dtOperVenda.Date = 0 Then Begin
    MsgDlg('Data da Operação não está preenchida.','Atenção',mtWarning,[mbOk],0);
    if dtOperVenda.CanFocus then
       dtOperVenda.SetFocus;
    Result := False;
    Exit;
  End;

  //AL_14
  //AL_19
  if not CtrlInvContab.TestaPeriodo(dtOperVenda.Text, iTipoInvestUsu) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dtOperVenda.Canfocus then
        dtOperVenda.SetFocus;
     Result := False;
     Exit;
  end;

  If dtLiqVenda.Date = 0 Then Begin
    MsgDlg('Data da Liquidação não está preenchida.','Atenção',mtWarning,[mbOk],0);
    if dtLiqVenda.CanFocus then
       dtLiqVenda.SetFocus;
    Result := False;
    Exit;
  End;

  If dtCotVenda.Date = 0 Then Begin
     MsgDlg('Data da Cotização não está preenchida.','Atenção',mtWarning,[mbOk],0);
     if dtCotVenda.Canfocus then
        dtCotVenda.SetFocus;
     Result := False;
     Exit;
  End;

  If dtLiqVenda.Date < dtOperVenda.Date Then Begin
    MsgDlg('Data da Liquidação menor que a de Operação.','Atenção',mtWarning,[mbOk],0);
    QryVendaDATALIQUIDACAO.AsDateTime := OperComum.DataPrazo(dtOperVenda.Date,
                                                             QryFundoInvestSld.FieldByName('PZOLIQAPLIC').AsInteger);
    if dtLiqVenda.Canfocus then
       dtLiqVenda.SetFocus;
    Result := False;
    Exit;
  End;

  If dbreVlrLiqVenda.Value <= 0 Then Begin
    MsgDlg('Valor Líquido não pode ser menor ou igual a zero.','Atenção',mtWarning,[mbOk],0);
    if dbreVlrLiqVenda.CanFocus then
       dbreVlrLiqVenda.SetFocus;
    Result := False;
    Exit;
  End;

  If dbreVlrLiqVenda.Value > dbeVlrOperVenda.Value Then Begin
    MsgDlg('Valor da líquido operação maior que o valor da operação.','Atenção',mtWarning,[mbOk],0);
    if dbreVlrLiqVenda.CanFocus then
       dbreVlrLiqVenda.SetFocus;
    BtAltVenda.Down := False;
    BtCancVenda.Click;
    Result := False;
    Exit;
  End;

  If edCotaFdoNegVenda.Value <= 0 Then begin
     MsgDlg('A cota negociada não pode ser igual ou menor que zero. '#13+
             'Operação não pode ser Realizada.','Atenção',mtWarning,[MbOk],0);
     If edCotaFdoNegVenda.CanFocus Then
        edCotaFdoNegVenda.SetFocus;
     Exit;
  end;

  If dbeVlrOperVenda.Value < 0 Then begin
     MsgDlg('O valor da operação não pode ser negativo.','Atenção',mtWarning,[MbOk],0);
     If dbeVlrOperVenda.CanFocus Then
        dbeVlrOperVenda.SetFocus;
     Exit;
  end;

  If dbeVlrOperVenda.Value < (dbreVlrLiqVenda.Value + dbreTxPerformVenda.Value + dbreTxEmolVenda.Value + dbreTxCorretVenda.Value) Then Begin
     MsgDlg('O valor total não pode ser menor que valor aplicado + taxas.','Atenção',mtWarning,[mbOk],0);
     dbeVlrOperVenda.Value := dbreVlrLiqVenda.Value + dbreTxPerformVenda.Value + dbreTxEmolVenda.Value + dbreTxCorretVenda.Value;
     if dbeVlrOperVenda.Canfocus then
        dbeVlrOperVenda.SetFocus;
     Result := False;
     Exit;
  End;

  Result := True;
End;
procedure TFrmCadOperFundosDirCred.btCancVendaClick(Sender: TObject);
begin
  inherited;

  PnlSelecao.Enabled   := True;
  TbsAplicacao.Enabled := True;
  TbsResgate.Enabled   := True;
  TbsVenda.Enabled     := True;
  TbsSaldo.Enabled     := True;
  
  edCotaFdoVenda.Clear;

  dblkFundoInvestVenda.Enabled := True;
  // Cancela Operacao
  QryVenda.Cancel;
  QryVenda.CancelUpdates;

// Volta Ambiente
  dbgGridVenda.BringToFront;
  AcertaBotoesVenda;

// Botoes
  BtIncVenda.Enabled := True;
  BtExcVenda.Enabled := True;
  Dock976.Visible   := False;

// Refresh
  QryVenda.Close;
  QryVenda.Open;
end;

procedure TFrmCadOperFundosDirCred.ValidaFundoTipoCotaVenda;
Var
   iPz              : Integer;
  DadosCota         : TDadosCota;
begin
  inherited;

   If Trim(dblkFundoInvestVenda.Text) = '' Then
   Begin
      if dblkFundoInvestVenda.CanFocus then
         dblkFundoInvestVenda.SetFocus;
      Exit;
   End;

   If Trim(dblkTipoCotaVenda.Text) = '' Then
   Begin
      if dblkTipoCotaVenda.CanFocus then
         dblkTipoCotaVenda.SetFocus;
      Exit;
   End;

   If Not VerificaAtualizacao(QryFundoInvestVenda.FieldByName('IDFUNDOINVEST').AsInteger,
                              QryTipoCotaVenda.FieldByName('IDTIPOCOTA').AsInteger,
                              QryFundoInvestVenda.FieldByName('DATAINICIOFUNDO').AsDateTime,
                              dtOperVenda.Date) Then
   Begin
      MsgDlg('Há uma aplicação que não foi atualizada para esse dia. Verifique!','Mensagem do Sistema',mtInformation,[mbOk],0);
      BtCancResg.Click;
      Exit;
   End;

   If Not VerificaOperacao('D',
                           QryFundoInvestVenda.FieldByName('IDFUNDOINVEST').AsInteger,
                           QryTipoCotaVenda.FieldByName('IDTIPOCOTA').AsInteger,
                           dtOperVenda.Date) Then
   Begin
      MsgDlg('Já há Resgate para esse Fundo nessa data.','Mensagem do Sistema',mtInformation,[mbOk],0);
      BtCancResg.Click;
      Exit;
   End;

   OperComum.LimpaParametros(QrySaldoFundoTotal);
   with QrySaldoFundoTotal do
   begin
      ParamByName('IDFUNDOINVEST').AsString      := dblkFundoInvestVenda.LookupValue;
      ParamByName('DATAMOVFUNDO').AsString       := dtOperVenda.Text;
      ParamByName('IDTIPOCOTA').AsInteger        := QryTipoCotaVenda.FieldByName('IDTIPOCOTA').AsInteger;
      ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      ParamByName('IDGESTORCARTEIRA').AsInteger  := QryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
      ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      Open;
   end;

   dDtaLiq := OperComum.DataPrazo(dtOperVenda.Date, QryFundoInvestVenda.FieldByName('PZOLIQRESG').AsInteger);

   dtLiqVenda.Date := dDtaLiq;

   dDtaCot := OperComum.DataPrazo(DbDtDataAplicacao.Date, QryFundoInvestAplic.FieldByName('PZOCOTAPLIC').AsInteger);

   dtCotVenda.Date := dDtaCot;

   QryVendaDATALIQUIDACAO.AsDateTime := dDtaLiq;

   DtEdDataReferenciaGeral.Date      := dDtaLiq;

   edCotaFdoVenda.DecDigits          := qryFundoInvestVendaQTDDECQTD.AsInteger;

   QryVendaDATACOTIZACAO.AsDateTime  := OperComum.DataPrazo(dtOperVenda.Date,
                                                            QryFundoInvestVenda.FieldByName('PZOCOTRESG').AsInteger);
   // Busca dados da Cota
   DadosCota := BuscaCotaFundo(QryAux,
                               StrToInt(dblkFundoInvestVenda.LookupValue),
                               QryVendaDATACOTIZACAO.AsDateTime,
                               StrToInt(DbLkTipoCotaVenda.LookupValue));

   DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
   DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;

   if (QryVendaDATACOTIZACAO.AsDateTime = dtOperVenda.Date) And
      (DadosCota.DataCota = 0) Then
   begin
      MsgDlg('Cota do Fundo não encontrada nesta data.','Mensagem do Sistema',mtInformation,[mbOk],0);
      DbLkFundoInvestVenda.Clear;
      DbLkTipoCotaVenda.Clear;
      Exit;
   end
   else
   begin
      DadosCota.DataCota      := QryAux.FieldByName('DATACOTA').AsDateTime;
      DadosCota.VlrCota       := QryAux.FieldByName('VLRCOTA').AsFloat;
      edCotaFdoVenda.Value    := DadosCota.VlrCota;
      edCotaFdoNegVenda.Value := DadosCota.VlrCota;
   end;
end;

procedure TFrmCadOperFundosDirCred.dblkFundoInvestVendaCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   ValidaFundoTipoCotaVenda;
end;

procedure TFrmCadOperFundosDirCred.dblkFundoInvestVendaExit(
  Sender: TObject);
begin
  inherited;
   ValidaFundoTipoCotaVenda;
end;

procedure TFrmCadOperFundosDirCred.dblkTipoCotaVendaExit(Sender: TObject);
begin
  inherited;
   ValidaFundoTipoCotaVenda;
end;

procedure TFrmCadOperFundosDirCred.dblkTipoCotaVendaCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   ValidaFundoTipoCotaVenda;
end;

procedure TFrmCadOperFundosDirCred.dblkContraParteVendaCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   ValidaFundoTipoCotaVenda;
end;

procedure TFrmCadOperFundosDirCred.dblkContraParteVendaExit(
  Sender: TObject);
begin
  inherited;
   ValidaFundoTipoCotaVenda;
end;

procedure TFrmCadOperFundosDirCred.dbeVlrOperVendaExit(Sender: TObject);
begin
  inherited;
  dbreVlrLiqVenda.value := dbeVlrOperVenda.value -
                            (dbreTxPerformVenda.Value  + dbreTxEmolVenda.Value +
                             dbreTxCorretVenda.Value);

end;

// AL_17
procedure TFrmCadOperFundosDirCred.SaldoFundos(TodosPlanos : Boolean;
                                             iAbert, iFechto : Integer);
begin
   //AL_24
   MontaSqlSaldo(TodosPlanos);

   With DmRelFundoDirCred do
   begin
      pplblSaldoFundosDataRef.Caption := DtEdDataReferenciaGeral.Text;
      
      If TodosPlanos then
         LblPlano.Caption := 'TODOS OS PLANOS'
      else
         LblPlano.Caption := sPlanPrevCtbPatro;

      // Formatando as colunas do relatorio total
      ppDBSaldoFundosQTD.DisplayFormat := MascaraDecQtdHist; // QtdeCotas
      ppDBText2.DisplayFormat          := MascaraDecQtdHist; // QtdeBloqueada
      ppDBCalc1.DisplayFormat          := MascaraDecQtdHist; // Somatorio QtdeCotas
      ppDBCalc2.DisplayFormat          := MascaraDecQtdHist; // Somatorio QtdeBloqueada
      ppDBCalc3.DisplayFormat          := MascaraDecQtdHist; // Somatorio QtdeCotas
      ppDBCalc4.DisplayFormat          := MascaraDecQtdHist; // Somatorio QtdeBloqueada
      //Formatando as colunas do relatorio detalhe
      ppDBSSaldoFundosVlrCota.DisplayFormat := MascaraDecVlrHist;
      ppDBText1.DisplayFormat               := MascaraDecQtdHist;
      ppDBSSaldoFundosQTD.DisplayFormat     := MascaraDecQtdHist;

      //AL_20
      if not TodosPlanos then
      begin
         ghbCabecalhoPlano.Visible := False;
         gfbRodapePlano.Visible := False;
         //AL_24
      end
      else
      begin
         ghbCabecalhoPlano.Visible := True;
         gfbRodapePlano.Visible := True;
         //AL_24
      end;

      TfrmPreview.CreateModalPreview(Application,
                                     rptSaldoFundos,
                                     rptSaldoFundos.PrinterSetup.DocumentName);
      QrySaldoDet.Close;
      QrySaldoTot.Close;
   end;

   DmRelFundoDirCred.ImpTipoCota := False;
   pnlFundo.Enabled := True;
   sbtnSaldos.Down := False;
end;

// AL_17
procedure TFrmCadOperFundosDirCred.MnuTodosPlanosFechtoClick(Sender: TObject);
begin
   inherited;
   SaldoFundos(True,0,1);
end;

// AL_17
procedure TFrmCadOperFundosDirCred.MnuUmPlanoFechtoClick(Sender: TObject);
begin
   inherited;
   SaldoFundos(False,0,1);
end;

//AL_23
procedure TFrmCadOperFundosDirCred.FormCreate(Sender: TObject);
begin
  inherited;
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
end;

//AL_24
procedure TFrmCadOperFundosDirCred.MontaSqlSaldo(TodosPlanos: Boolean);
begin

   //Montando as Mascaras de Histfundo
   //Atenção as mascaras tem relacao com a data do saldo do fundo
   If Trim(DbLkcFundoSaldo.Text) <> '' Then
   Begin
      MascaraDecVlrHist := MontaMascaraDecVlrHist(QryFundoInvestAplicIDFUNDOINVEST.AsInteger,DtEdDataReferenciaGeral.text);
      MascaraDecQtdHist := MontaMascaraDecQtdHist(QryFundoInvestAplicIDFUNDOINVEST.AsInteger,DtEdDataReferenciaGeral.text);
   End
   Else
   Begin
      MascaraDecVlrHist := '###,#0.000000000000';
      MascaraDecQtdHist := '###,#0.000000000000';
   end;

   // Montando mascara de detalhe
   DmRelFundoDirCred.QrySaldoDetVLRCOTAAPLICACAO.DisplayFormat := MascaraDecVlrHist;
   DmRelFundoDirCred.QrySaldoDetVLRCOTAATUAL.DisplayFormat     := MascaraDecVlrHist;
   DmRelFundoDirCred.QrySaldoDetSALDOQTDCOTAS.DisplayFormat    := MascaraDecQtdHist;
   DmRelFundoDirCred.QrySaldoDetSALDOQTDCOTASBLQ.DisplayFormat := MascaraDecQtdHist;
   
   // Montando mascara de Rodape
   DmRelFundoDirCred.QrySaldoTotSALDOQTDCOTASG.DisplayFormat    := MascaraDecQtdHist;
   DmRelFundoDirCred.QrySaldoTotSALDOQTDCOTASBLQG.DisplayFormat := MascaraDecQtdHist;
   DmRelFundoDirCred.QrySaldoTotVLRIOFPROVG.DisplayFormat       := '#,###,###,##0.00';
   DmRelFundoDirCred.QrySaldoTotVLRIRPROVG.DisplayFormat        := '#,###,###,##0.00';
   DmRelFundoDirCred.QrySaldoTotSALDOLIQUIDOG.DisplayFormat     := '###,###,###,##0.00';
   DmRelFundoDirCred.QrySaldoTotSALDOVLRFUNDOG.DisplayFormat    := '###,###,###,##0.00';

   // Montando a Query Detalhe
   DmRelFundoDirCred.QrySaldoDet.DisableControls;
   DmRelFundoDirCred.QrySaldoTot.DisableControls;
   OperComum.LimpaParametros(DmRelFundoDirCred.QrySaldoDet);

   DmRelFundoDirCred.QrySaldoDet.SQL.Clear;
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('SELECT /*+INDEX (H1.XPKHISTFUNDO)*/' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('       FI.IDFUNDOINVEST, FI.DESCFUNDOINVEST, '+ #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('       FI.IDTIPOFUNDOINVEST,FI.DESCTIPOFUNDOINV,'+ #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('       H1.DATAAPLICACAO, H1.DATAMOVFUNDO,' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('       H1.SALDOQTDCOTAS, H1.SALDOQTDCOTASBLQ,' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('       NVL(CAT.VLRCOTA,0)       AS VLRCOTAATUAL,' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('       H1.SALDOVLRFUNDO,' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('       NVL(H1.VLRIRPROV,0)    AS VLRIRPROV,' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('       NVL(H1.VLRIOFPROV,0)   AS VLRIOFPROV,' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('       (NVL(H1.SALDOVLRFUNDO,0) - NVL(H1.VLRIOFPROV,0)) AS  SALDOLIQUIDO,' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('       NVL(H1.COTAAPLICACAO,0) AS VLRCOTAAPLICACAO,' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('       PLANO.PLANPRVCONTABPATRO,' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('       H1.IDPLANPREVCTBPATR,' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('       TC.DESCTIPOCOTA ' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('FROM' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('       HISTFUNDO H1,' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('       (SELECT /*+INDEX (HI.XIE1HISTFUNDO)*/  MAX(HI.IDHISTFUNDO) AS IDHISTFUNDO ' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('        FROM HISTFUNDO HI, ' + #13);

   DmRelFundoDirCred.QrySaldoDet.SQL.Add('             (SELECT IDTIPOINVEST, IDTIPOOPERACAO' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('              FROM   TIPOOPERACAO ' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('              WHERE (IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+')' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('                    AND   (NATUREZAOPERACAO <> ''R'')) TP,' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('             (SELECT HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST, HF1.DESCFUNDOINVEST ' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('              FROM HISTFUNDOINVEST HF1 ' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('              WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,''DD/MM/YYYY, HH24:MI:SS'') IN ' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('                         (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),''DD/MM/YYYY, HH24:MI:SS'')' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('                          FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('                          WHERE ' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('                              (TF.IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+')' + #13);
   if DblTipoFundo.Text <> '' then
      DmRelFundoDirCred.QrySaldoDet.SQL.Add('                              AND  (TF.IDTIPOFUNDOINVEST = '+QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString+')' + #13);
   if Trim(DbLkcFundoSaldo.Text) <> '' then
      DmRelFundoDirCred.QrySaldoDet.SQL.Add('                              AND  (HF.IDFUNDOINVEST     = '+DbLkcFundoSaldo.LookupValue+')' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('                              AND (HF.DTAVIGENCIA       < TO_DATE('+QuotedStr(DtEdDataReferenciaGeral.Text)+',''DD/MM/YYYY'')+1) ' + #13);
   if dblGestorCarteira.Text <> ''  then
      DmRelFundoDirCred.QrySaldoDet.SQL.Add('                              AND  (HF.IDGESTORCARTEIRA  = '+qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsString+')' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('                              AND (HF.IDTIPOFUNDOINVEST  = TF.IDTIPOFUNDOINVEST) ' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('                              GROUP BY HF.IDFUNDOINVEST))' + #13);
   if DblTipoFundo.Text <> '' then
      DmRelFundoDirCred.QrySaldoDet.SQL.Add('                    AND  (HF1.IDTIPOFUNDOINVEST = '+QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString+')'+ #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('                                                                                                              ) FI ' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('        WHERE ' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('             (HI.IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+')' + #13);
   if not TodosPlanos then
      DmRelFundoDirCred.QrySaldoDet.SQL.Add('             AND  (HI.IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+')' + #13)
   else
      DmRelFundoDirCred.QrySaldoDet.Sql.add('             AND (HI.IDPLANPREVCTBPATR > 0)');
   if Trim(DbLkcFundoSaldo.Text) <> '' then
      DmRelFundoDirCred.QrySaldoDet.SQL.Add('             AND (HI.IDFUNDOINVEST = '+DbLkcFundoSaldo.LookupValue+')' + #13)
   else
      DmRelFundoDirCred.QrySaldoDet.Sql.add('             AND (HI.IDFUNDOINVEST > 0)');

   DmRelFundoDirCred.QrySaldoDet.SQL.Add('             AND (HI.DATAMOVFUNDO      = TO_DATE('+QuotedStr(DtEdDataReferenciaGeral.Text)+', ''DD/MM/YYYY'')) ' + #13);
   if ((dblTipoCota.Visible) And (dblTipoCota.Text <> '')) then
      DmRelFundoDirCred.QrySaldoDet.SQL.Add('             AND (HI.IDTIPOCOTA = '+QryTipoCotaSld.FieldByName('IDTIPOCOTA').AsString+') ' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('             AND (HI.TIPMOVFUNDO      <> ''PIR'') ' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('             AND (FI.IDFUNDOINVEST     = HI.IDFUNDOINVEST) ' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('             AND (TP.IDTIPOINVEST      = HI.IDTIPOINVEST) ' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('             AND (TP.IDTIPOOPERACAO    = HI.IDTIPOOPERACAO) ' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('             GROUP BY HI.IDTIPOINVEST,  HI.IDPLANPREVCTBPATR, HI.IDFUNDOINVEST, HI.DATAAPLICACAO,' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('                      HI.DATAMOVFUNDO,  HI.IDTIPOCOTA) HM,' + #13);

   DmRelFundoDirCred.QrySaldoDet.SQL.Add('       COTAFUNDO CAT, TIPOCOTA TC, ' + #13);

   DmRelFundoDirCred.QrySaldoDet.SQL.Add('       (SELECT HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST, HF1.DESCFUNDOINVEST,TF1.DESCTIPOFUNDOINV' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('        FROM HISTFUNDOINVEST HF1,TIPOFUNDOINVEST TF1' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('        WHERE' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('           (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,''DD/MM/YYYY, HH24:MI:SS'') IN' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('                 (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),''DD/MM/YYYY, HH24:MI:SS'')' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('                  FROM   HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF ' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('                  WHERE ' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('                      (TF.IDTIPOINVEST       = '+IntToStr(iTipoInvestUsu)+')' + #13);
   if DblTipoFundo.Text <> '' then
      DmRelFundoDirCred.QrySaldoDet.SQL.Add('                       AND (TF.IDTIPOFUNDOINVEST = '+ QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString+')' + #13);
   if DbLkcFundoSaldo.Text <> '' then
      DmRelFundoDirCred.QrySaldoDet.SQL.Add('                       AND (HF.IDFUNDOINVEST     = '+ DbLkcFundoSaldo.LookupValue +')' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('                       AND (HF.DTAVIGENCIA       < TO_DATE('+QuotedStr(DtEdDataReferenciaGeral.Text)+',''DD/MM/YYYY'')+1)' + #13);
   If dblGestorCarteira.Text <> ''  then
      DmRelFundoDirCred.QrySaldoDet.SQL.Add('                       AND (HF.IDGESTORCARTEIRA  = '+qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsString+')' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('                       AND (HF.IDTIPOFUNDOINVEST  = TF.IDTIPOFUNDOINVEST)' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('                       GROUP BY HF.IDFUNDOINVEST))' + #13);
   if DblTipoFundo.Text <> '' then
      DmRelFundoDirCred.QrySaldoDet.SQL.Add('           AND (HF1.IDTIPOFUNDOINVEST = '+ QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString+')' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('           AND (HF1.IDTIPOFUNDOINVEST = TF1.IDTIPOFUNDOINVEST) ) FI,' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('       VWPLANPREVCTBPATR PLANO' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('WHERE ' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('     (H1.IDHISTFUNDO       = HM.IDHISTFUNDO) ' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('     AND (H1.SALDOQTDCOTAS > 0)' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('     AND (H1.IDPLANPREVCTBPATR = PLANO.IDPLANPREVCTBPATR)' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('     AND (H1.IDFUNDOINVEST     = FI.IDFUNDOINVEST)' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('     AND (H1.DATAMOVFUNDO      = CAT.DATACOTA(+))' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('     AND (H1.IDFUNDOINVEST     = CAT.IDFUNDOINVEST(+))' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('     AND (NVL(H1.IDTIPOCOTA,0) = NVL(CAT.IDTIPOCOTA(+),0))' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('     AND (H1.IDTIPOCOTA        =  TC.IDTIPOCOTA(+)) ' + #13);
   DmRelFundoDirCred.QrySaldoDet.SQL.Add('ORDER BY PLANPRVCONTABPATRO, IDPLANPREVCTBPATR, DESCFUNDOINVEST, DATAAPLICACAO, DESCTIPOCOTA' + #13);

   // Montando a Query Tot da Query Detalhe
   // Preparando a QrySaldoTot
   DmRelFundoDirCred.QrySaldoTot.Filter := '';
   DmRelFundoDirCred.QrySaldoTot.Filtered  := False;
   OperComum.LimpaParametros(DmRelFundoDirCred.QrySaldoTot);
   DmRelFundoDirCred.QrySaldoTot.Sql.Clear;
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('SELECT '+ #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('DET.DESCTIPOFUNDOINV, DET.PLANPRVCONTABPATRO, DET.DESCFUNDOINVEST,'+ #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('DET.IDTIPOFUNDOINVEST, DET.IDPLANPREVCTBPATR, DET.IDFUNDOINVEST,'+ #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('DET.SALDOQTDCOTAS, '+ #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('DET.SALDOQTDCOTASBLQ, '+ #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('DET.SALDOVLRFUNDO,'+ #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('DET.VLRIOFPROV,' + #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('DET.VLRIRPROV,' + #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('DET.SALDOLIQUIDO,' + #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('GERAL.SALDOQTDCOTASG, '+ #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('GERAL.SALDOQTDCOTASBLQG, '+ #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('GERAL.SALDOVLRFUNDOG,'+ #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('GERAL.VLRIOFPROVG,' + #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('GERAL.VLRIRPROVG,' + #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('GERAL.SALDOLIQUIDOG FROM ( ' + #13);
   // Detalhe
   DmRelFundoDirCred.QrySaldoTot.Sql.Add( '' + #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('SELECT '+ #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('DESCTIPOFUNDOINV, PLANPRVCONTABPATRO, DESCFUNDOINVEST,'+ #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('IDTIPOFUNDOINVEST, IDPLANPREVCTBPATR, IDFUNDOINVEST,'+ #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('SUM(SALDOQTDCOTAS) AS SALDOQTDCOTAS, '+ #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('SUM(SALDOQTDCOTASBLQ) AS SALDOQTDCOTASBLQ, '+ #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('SUM(SALDOVLRFUNDO) AS SALDOVLRFUNDO,'+ #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('SUM(VLRIOFPROV) AS VLRIOFPROV,' + #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('SUM(VLRIRPROV) AS VLRIRPROV,' + #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('SUM(SALDOLIQUIDO) AS SALDOLIQUIDO FROM( ' + #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add(DmRelFundoDirCred.QrySaldoDet.Sql.GetText);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add( ')' + #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add( 'GROUP BY DESCTIPOFUNDOINV, PLANPRVCONTABPATRO, DESCFUNDOINVEST,' + #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add( '         IDTIPOFUNDOINVEST, IDPLANPREVCTBPATR, IDFUNDOINVEST' + #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add( 'ORDER BY DESCTIPOFUNDOINV, PLANPRVCONTABPATRO, DESCFUNDOINVEST,' + #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add( '         IDTIPOFUNDOINVEST, IDPLANPREVCTBPATR, IDFUNDOINVEST ' + #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add( '' + #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add( ' ) DET, ' + #13);
   // Fim Detalhe
   // Geral
   DmRelFundoDirCred.QrySaldoTot.Sql.Add( '' + #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('( SELECT '+ #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('         SUM(SALDOQTDCOTAS) AS SALDOQTDCOTASG,'+ #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('         SUM(SALDOQTDCOTASBLQ) AS SALDOQTDCOTASBLQG,'+ #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('         SUM(SALDOVLRFUNDO) AS SALDOVLRFUNDOG, '+ #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('         SUM(VLRIOFPROV) AS VLRIOFPROVG,'+ #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('         SUM(VLRIRPROV) AS VLRIRPROVG,' + #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add('         SUM(SALDOLIQUIDO) AS SALDOLIQUIDOG FROM( ' + #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add(                      DmRelFundoDirCred.QrySaldoDet.Sql.GetText);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add( '                                               )' + #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add( '' + #13);
   DmRelFundoDirCred.QrySaldoTot.Sql.Add( ' ) GERAL ' + #13);
   // Fim Geral

   DmRelFundoDirCred.QrySaldoTot.Open;

   if DmRelFundoDirCred.QrySaldoTot.IsEmpty then
   begin
      if DtEdDataReferenciaGeral.CanFocus then
         DtEdDataReferenciaGeral.SetFocus;
         Exit;
   end;

   DmRelFundoDirCred.QrySaldoDet.Filter := '';
   DmRelFundoDirCred.QrySaldoDet.Filtered  := False;
   DmRelFundoDirCred.QrySaldoDet.Open;

   DmRelFundoDirCred.QrySaldoDet.EnableControls;
   DmRelFundoDirCred.QrySaldoTot.EnableControls;

   // No caso de ser Fundo de Dir Cred ou Part
   DmRelFundoDirCred.QrySaldoDetDESCTIPOCOTA.Visible := iTipoInvestUsu in [9,10];
   DmRelFundoDirCred.ImpTipoCota := dblTipoCota.Visible;

   pnlFundo.Enabled := True;

   sbtnSaldos.Down  := False;

end;

end.
