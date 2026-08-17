//******************************************************************************
// Código    : AL_19
// Pendencia : 25943
// SOL       : 65074
// Desc      : Erro Constraint R_11070. Estava gravando QrySlddoLiq sem IdOperação
//             para liquidação do Contrato com Açoes
//******************************************************************************
// Data      : 08/03/2007
// Código    : AL_18
// Pendencia : 24676
// SOL       : 55162
// Desc      : Incluir Plano Patrocinadora no Relatório de Operações
//******************************************************************************
// Data      : 22/02/2007
// Código    : AL_17
// Pendencia : 24553
// SOL       : 53867
// Desc      : Inclui na LancaOperRV para utilizar o IdPlanPrevCtbPatro informado
//             e não o default
//******************************************************************************
// Data      : 16/01/2007
// Código    : AL_16
// Pendencia : 23891
// SOL       : 42459
// Desc      : Busca o Saldo do Custodiante proporcional a CC e CCI
//******************************************************************************
// Data      : 28/11/2006
// Código    : AL_15
// Pendencia : 23891
// SOL       : 42459
// Desc      : Implementação da Liquidação Com Ações
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_14
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 11/07/2006
// Código   : AL_13
// Pendencia: 22708
// Sol      : 44313
// Função   : Implementação de Não Exercício de Contrato
//******************************************************************************
// Data     : 03/07/2006
// Código   : AL_12
// Pendencia:
// Sol      : 44355
// Função   : Ajuste para contabilizar variações negativas
//******************************************************************************
// Data     : 11/05/2006
// Código   : AL_11
// Pendencia: 22317
// Sol      : 43013
// Função   : Implementação do Relatório de Operações
//            Criação de PopMenu para escolher o relatório (DFM)
//******************************************************************************
//Data	    : 08/05/2006
//Código    : Al_10
//Pendencia : 22135
//SOL       : 42459
//Motivo(S) : Implementação de Liquidação sem baixa de ações conforme espedificação
//              da Funcef
//******************************************************************************
//Data	    : 10/03/2006
//Código    : Al_9
//Pendencia : 21548
//SOL       : 40452
//Motivo(S) : Ajuste nos títulos doas campos PU a Pagar e a Receber nos grids
//******************************************************************************
//Data	    : 21/02/2006
//Código    : Al_8
//Pendencia :
//SOL       :
//Motivo(S) : Implementação da trava de fechamento de renda variavel
//******************************************************************************
// Data     : 11/01/2006
// Código   : AL_7
// Pendencia:
// Sol      :
// Descrição: Implementação de contabilizção diferenciada por investimento
//******************************************************************************
// Data     : 11/01/2006
// Código   : AL_6
// Pendencia:
// Sol      : (Roseli por email)
// Descrição: O saldo do contrato não pode ser negativo, caso o saldo a pagar seja maior que
//               o saldo a receber, então o saldo do contrato é 0(zero)
//******************************************************************************
// Data     : 10/01/2006
// Código   : AL_5
// Pendencia:
// Sol      : (Roseli por email)
// Descrição: Retirada da obrigatoriedade de informar a data de registro
//******************************************************************************
// Data     : 06/01/2006
// Código   : AL_4
// Pendencia:
// Sol      : (Roseli por email)
// Descrição: Alteração nas descrições das labels do form por solicitação da Funcef
//            Ajuste no tratamento dos lançamentos contabeis
//******************************************************************************
// Data     : 05/01/2006
// Código   : AL_3
// Pendencia:
// Sol      :
// Descrição: Retirada da obrigatoriedade de digitação da Ação Base
//            Alteração do nome da coluna Valor Movimentado no saldo liquido para Variação
//            Colocação de mascara nos campos de provisão de perda
//            Retirada dos campos de saldo de quantidade da grid de saldo liquido
//            Ajuste no reprocessamento para deletar saldos liquidos orfãos
//            Ajuste no reprocessamento de provisão de perda
//******************************************************************************
// Data     : 02/01/2006
// Código   : AL_2
// Pendencia:
// Sol      :
// Função   : Ajuste no OnConfirma (Botão OK), no cálculo do PU do contrato e no MontaSelect
//******************************************************************************
// Data     : 15/12/2005
// Código   : AL_1
// Pendencia:
// Sol      :
// Função   : Ajuste na exclusão
//******************************************************************************

unit FCadContAcoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCSInv, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, faMensagem, MAHlpBtn,
  TB97Tlbr, fcLabel, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls, FPreview,
  wwdbdatetimepicker, CMDateTimePicker, TREdit, wwdblook, Provider,
  DBClient, uCMClientDataSet, uCMMath, Menus,
  //AL_15
  uCtrlRendaVariavel, uCtrlPadroes;

type
  TTipoOper = set of (Li, La, NE);   // Li = Liq. de Acoes Sem Acoes , NE = Nenhum, La = Liq. Acoes Com Acoes

  TfrmCadContAcoes = class(TfrmCadMestreDetalheCSInv)
    dsSldPagar: TwwDataSource;
    updSldPagar: TUpdateSQL;
    qrySldPagar: TwwQuery;
    tbsSldPag: TTabSheet;
    pnlDetSldPagar: TPanel;
    dbgSldPagar: TwwDBGrid;
    Label6: TLabel;
    dbdDataSldRec: TCMDateTimePicker;
    Label9: TLabel;
    dbQtdSldRec: TDBRealEdit;
    Label10: TLabel;
    dbPUSldRec: TDBRealEdit;
    Label11: TLabel;
    dbVlrSldRec: TDBRealEdit;
    Label16: TLabel;
    Label8: TLabel;
    dbdDataSldPag: TCMDateTimePicker;
    Label13: TLabel;
    dbQtdSldPag: TDBRealEdit;
    Label15: TLabel;
    dbVlrSldPag: TDBRealEdit;
    dbPUSldPag: TDBRealEdit;
    PageControl1: TPageControl;
    tbsDadosPrinc: TTabSheet;
    Label28: TLabel;
    dblTipoOperacao: TwwDBLookupCombo;
    Label1: TLabel;
    dblInvestimentoBase: TwwDBLookupCombo;
    Label4: TLabel;
    dbdDtContrato: TCMDateTimePicker;
    dbdIniPeriodoExe: TCMDateTimePicker;
    Label5: TLabel;
    dbdFimPeriodoExe: TCMDateTimePicker;
    Label3: TLabel;
    dbrQtd: TDBRealEdit;
    dbrPU: TDBRealEdit;
    dbrVlr: TDBRealEdit;
    Label7: TLabel;
    Label43: TLabel;
    Label2: TLabel;
    dblContraParte: TwwDBLookupCombo;
    Label18: TLabel;
    tbsObservacao: TTabSheet;
    dbmObservacao: TDBMemo;
    Panel1: TPanel;
    dsSldLiq: TwwDataSource;
    updSldLiq: TUpdateSQL;
    qrySldLiq: TwwQuery;
    tbsSldLiq: TTabSheet;
    Panel6: TPanel;
    Label14: TLabel;
    Label19: TLabel;
    dbdDataSldLiquido: TCMDateTimePicker;
    dbrSldVlrSldLiq: TDBRealEdit;
    dbgSldLiq: TwwDBGrid;
    Label20: TLabel;
    dbdDtRegistro: TCMDateTimePicker;
    qrySldLiqIDHISTCONTACOES: TFloatField;
    qrySldLiqIDPLANPREVCTBPATR: TFloatField;
    qrySldLiqPLANO: TFloatField;
    qrySldLiqPLNCODIGO: TFloatField;
    qrySldLiqIDTIPOINVEST: TFloatField;
    qrySldLiqIDTIPOOPERACAO: TFloatField;
    qrySldLiqIDOPERCONTACOES: TFloatField;
    qrySldLiqDATAHISTCONTACOES: TDateTimeField;
    qrySldLiqVLRMOVCONTACOES: TFloatField;
    qrySldLiqSLDVLRCONTACOES: TFloatField;
    qrySldLiqQTDMOVCONTACOES: TFloatField;
    qrySldLiqSLDQTDCONTACOES: TFloatField;
    qrySldLiqHISTMOVCONTACOES: TStringField;
    dbrQtdMovSldLiq: TDBRealEdit;
    Label12: TLabel;
    dbrVlrMovSldLiq: TDBRealEdit;
    Label17: TLabel;
    dbrSldQtdSldLiq: TDBRealEdit;
    Label21: TLabel;
    dbrPercProvPerda: TDBRealEdit;
    Label22: TLabel;
    Label23: TLabel;
    qryDetalheDATASLDCONTACOES: TDateTimeField;
    qryDetalheQTDSLDCONTACOES: TFloatField;
    qryDetalheVLRSLDCONTACOES: TFloatField;
    qryDetalhePUSLDCONTACOES: TFloatField;
    qryDetalheTIPOSALDO: TStringField;
    qryDetalheOBSERVACAO: TMemoField;
    qryDetalheIDSALDOSCONTACOES: TFloatField;
    qryDetalheIDOPERCONTACOES: TFloatField;
    qrySldPagarDATASLDCONTACOES: TDateTimeField;
    qrySldPagarQTDSLDCONTACOES: TFloatField;
    qrySldPagarVLRSLDCONTACOES: TFloatField;
    qrySldPagarPUSLDCONTACOES: TFloatField;
    qrySldPagarTIPOSALDO: TStringField;
    qrySldPagarOBSERVACAO: TMemoField;
    qrySldPagarIDSALDOSCONTACOES: TFloatField;
    qrySldPagarIDOPERCONTACOES: TFloatField;
    QryEmissor: TwwQuery;
    QryEmissorSIGLAEMISSOR: TStringField;
    QryEmissorIDEMISSOR: TFloatField;
    qryTipoOperacao: TwwQuery;
    qryTipoOperacaoFLGAGE: TStringField;
    qryTipoOperacaoFLGDATAEX: TStringField;
    qryTipoOperacaoFLGDATACOM: TStringField;
    qryTipoOperacaoFLGPRZBOLSA: TStringField;
    qryTipoOperacaoFLGPRZEMP: TStringField;
    qryTipoOperacaoFLGATADEC: TStringField;
    qryTipoOperacaoFLGFORMAPAGREC: TStringField;
    qryTipoOperacaoFLGDIVACAO: TStringField;
    qryTipoOperacaoFLGINIPAG: TStringField;
    qryTipoOperacaoFLGJUROS: TStringField;
    qryTipoOperacaoFLGPARIDADE: TStringField;
    qryTipoOperacaoFLGINVORIGEM: TStringField;
    qryTipoOperacaoFLGPERC: TStringField;
    qryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    qryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    qryTipoOperacaoIDTIPOINVEST: TFloatField;
    qryTipoOperacaoFLGGRAVAIRLITIGIO: TStringField;
    qryTipoOperacaoFLGISENTOIR: TStringField;
    qryTipoOperacaoNATUREZAOPERACAO: TStringField;
    qryTipoOperacaoIDMERCADO: TFloatField;
    qryTipoOperacaoFLGTRATAIR: TStringField;
    qryTipoOperacaoTIPCREDOR: TStringField;
    qryTipoOperacaoRECPAG: TStringField;
    qryTipoOperacaoVENCIMENTO: TFloatField;
    qryTipoOperacaoFLGGERACONTAB: TFloatField;
    qryTipoOperacaoFLGGERACAPCAR: TFloatField;
    qryInvestimentoAcao: TwwQuery;
    qryInvestimentoAcaoDESCINVESTIMENTO: TStringField;
    qryInvestimentoAcaoQTDTITLOTE: TFloatField;
    qryInvestimentoAcaoIDINVESTIMENTO: TFloatField;
    qryInvestimentoAcaoIDTIPOINVEST: TFloatField;
    qryInvestimentoAcaoIDEMISSOR: TFloatField;
    qryInvestimentoAcaoIDMOEDACONTAB: TFloatField;
    qrySldLiqFLGREPROC: TStringField;
    qryDetalheIDPLANPREVCTBPATR: TFloatField;
    qrySldPagarIDPLANPREVCTBPATR: TFloatField;
    qryIDOPERCONTACOES: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryIDEMISSOR: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    qryIDBOLETA: TStringField;
    qryQUANTIDADE: TFloatField;
    qryPUOPERACAO: TFloatField;
    qryVLROPERACAO: TFloatField;
    qryDATAINIEXE: TDateTimeField;
    qryDATAFIMEXE: TDateTimeField;
    qryDATAOPERACAO: TDateTimeField;
    qryDATAREGISTRO: TDateTimeField;
    qryOBSERVACAO: TMemoField;
    qryCODDOCUMENTO: TFloatField;
    qryPLANO: TFloatField;
    qryPLNCODIGO: TFloatField;
    qryIDPLANPREVCTBPATR: TFloatField;
    qryPERCPROVPERDA: TFloatField;
    pnlObsSldRec: TPanel;
    Panel2: TPanel;
    dbmObsSldRec: TDBMemo;
    pnlObsSldPag: TPanel;
    Panel5: TPanel;
    dbmObsSldPag: TDBMemo;
    qrySldLiqIDINC: TFloatField;
    qrySldPagarIDINC: TFloatField;
    qryDetalheIDINC: TFloatField;
    qryDetalheFLGREPROC: TStringField;
    qrySldPagarFLGREPROC: TStringField;
    qrySldLiqVLRPROVPERDA: TFloatField;
    qrySldLiqSLDPROVPERDA: TFloatField;
    sbtnRelatorio: TToolbarButton97;
    dsLiqSemAcoes: TwwDataSource;
    updLiqSemAcoes: TUpdateSQL;
    qryLiqSemAcoes: TwwQuery;
    tbsLiqSemAcoes: TTabSheet;
    pnlObsLiqSemAcoes: TPanel;
    Panel4: TPanel;
    dbmObsLSA: TDBMemo;
    pnlDetLiquidacao: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    dbdtDataOperLSA: TCMDateTimePicker;
    dbrQuantidadeLSA: TDBRealEdit;
    dbrValorLSA: TDBRealEdit;
    grdLiqSemAcoes: TwwDBGrid;
    Label29: TLabel;
    dblTipoOperLSA: TwwDBLookupCombo;
    qryLiqSemAcoesIDBOLETA: TStringField;
    qryLiqSemAcoesDATAOPERACAO: TDateTimeField;
    qryLiqSemAcoesDATALIQUIDACAO: TDateTimeField;
    qryLiqSemAcoesDESCTIPOOPERACAO: TStringField;
    qryLiqSemAcoesQUANTIDADE: TFloatField;
    qryLiqSemAcoesVLROPERACAO: TFloatField;
    qryLiqSemAcoesCODDOCUMENTO: TFloatField;
    qryLiqSemAcoesPLANO: TFloatField;
    qryLiqSemAcoesPLNCODIGO: TFloatField;
    qryLiqSemAcoesIDTIPOOPERACAO: TFloatField;
    qryLiqSemAcoesIDTIPOINVEST: TFloatField;
    qryLiqSemAcoesIDOPERCONTACOES: TFloatField;
    qryLiqSemAcoesIDOPERCONTACOESAP: TFloatField;
    qryLiqSemAcoesIDPLANPREVCTBPATR: TFloatField;
    qryLiqSemAcoesOBSERVACAO: TMemoField;
    Label24: TLabel;
    dbdtDataLiqLSA: TCMDateTimePicker;
    qryTpOperLiqSemAcoes: TwwQuery;
    qryDetalheIDOPERCONTACOESAP: TFloatField;
    qrySldPagarIDOPERCONTACOESAP: TFloatField;
    qrySldLiqIDOPERCONTACOESAP: TFloatField;
    qryTpOperLiqSemAcoesFLGAGE: TStringField;
    qryTpOperLiqSemAcoesFLGDATAEX: TStringField;
    qryTpOperLiqSemAcoesFLGDATACOM: TStringField;
    qryTpOperLiqSemAcoesFLGPRZBOLSA: TStringField;
    qryTpOperLiqSemAcoesFLGPRZEMP: TStringField;
    qryTpOperLiqSemAcoesFLGATADEC: TStringField;
    qryTpOperLiqSemAcoesFLGFORMAPAGREC: TStringField;
    qryTpOperLiqSemAcoesFLGDIVACAO: TStringField;
    qryTpOperLiqSemAcoesFLGINIPAG: TStringField;
    qryTpOperLiqSemAcoesFLGJUROS: TStringField;
    qryTpOperLiqSemAcoesFLGPARIDADE: TStringField;
    qryTpOperLiqSemAcoesFLGINVORIGEM: TStringField;
    qryTpOperLiqSemAcoesFLGPERC: TStringField;
    qryTpOperLiqSemAcoesDESCTIPOOPERACAO: TStringField;
    qryTpOperLiqSemAcoesIDTIPOOPERACAO: TFloatField;
    qryTpOperLiqSemAcoesIDTIPOINVEST: TFloatField;
    qryTpOperLiqSemAcoesFLGGRAVAIRLITIGIO: TStringField;
    qryTpOperLiqSemAcoesFLGISENTOIR: TStringField;
    qryTpOperLiqSemAcoesNATUREZAOPERACAO: TStringField;
    qryTpOperLiqSemAcoesIDMERCADO: TFloatField;
    qryTpOperLiqSemAcoesFLGTRATAIR: TStringField;
    qryTpOperLiqSemAcoesTIPCREDOR: TStringField;
    qryTpOperLiqSemAcoesRECPAG: TStringField;
    qryTpOperLiqSemAcoesVENCIMENTO: TFloatField;
    qryTpOperLiqSemAcoesFLGGERACONTAB: TFloatField;
    qryTpOperLiqSemAcoesFLGGERACAPCAR: TFloatField;
    cdsSaldoAnt: TCMClientDataSet;
    dspSaldoAnt: TDataSetProvider;
    qryLiqSemAcoesVLRLUCPREJ: TFloatField;
    qryLiqSemAcoesIDEMISSOR: TFloatField;
    qryLiqSemAcoesIDINVESTIMENTO: TFloatField;
    qryLiqSemAcoesPUOPERACAO: TFloatField;
    ppmRelatorios: TPopupMenu;
    mnuSaldos: TMenuItem;
    mnuOperacoes: TMenuItem;
    tbsNaoExe: TTabSheet;
    pnlObsNaoExe: TPanel;
    Panel7: TPanel;
    dbmObsNaoExe: TDBMemo;
    pnlDetNaoExe: TPanel;
    Label30: TLabel;
    dbdtDataOperNaoExe: TCMDateTimePicker;
    grdNaoExe: TwwDBGrid;
    dsNaoExe: TwwDataSource;
    qryTpOperNaoExe: TwwQuery;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    FloatField17: TFloatField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    updNaoExe: TUpdateSQL;
    qryNaoExe: TwwQuery;
    qryNaoExeIDBOLETA: TStringField;
    qryNaoExeDATAOPERACAO: TDateTimeField;
    qryNaoExeDATALIQUIDACAO: TDateTimeField;
    qryNaoExeDESCTIPOOPERACAO: TStringField;
    qryNaoExeQUANTIDADE: TFloatField;
    qryNaoExeVLROPERACAO: TFloatField;
    qryNaoExeVLRLUCPREJ: TFloatField;
    qryNaoExeCODDOCUMENTO: TFloatField;
    qryNaoExePLANO: TFloatField;
    qryNaoExePLNCODIGO: TFloatField;
    qryNaoExeIDTIPOOPERACAO: TFloatField;
    qryNaoExeIDTIPOINVEST: TFloatField;
    qryNaoExeIDEMISSOR: TFloatField;
    qryNaoExeIDINVESTIMENTO: TFloatField;
    qryNaoExeIDOPERCONTACOES: TFloatField;
    qryNaoExeIDOPERCONTACOESAP: TFloatField;
    qryNaoExeIDPLANPREVCTBPATR: TFloatField;
    qryNaoExeOBSERVACAO: TMemoField;
    qryNaoExePUOPERACAO: TFloatField;
    tbsLiqComAcoes: TTabSheet;
    qryTpOperLiqComAcoes: TwwQuery;
    dsLiqComAcoes: TwwDataSource;
    updLiqComAcoes: TUpdateSQL;
    qryLiqComAcoes: TwwQuery;
    qryLiqComAcoesIDBOLETA: TStringField;
    qryLiqComAcoesDATAOPERACAO: TDateTimeField;
    qryLiqComAcoesDATALIQUIDACAO: TDateTimeField;
    qryLiqComAcoesDESCTIPOOPERACAO: TStringField;
    qryLiqComAcoesQUANTIDADE: TFloatField;
    qryLiqComAcoesVLROPERACAO: TFloatField;
    qryLiqComAcoesVLRLUCPREJ: TFloatField;
    qryLiqComAcoesCODDOCUMENTO: TFloatField;
    qryLiqComAcoesPLANO: TFloatField;
    qryLiqComAcoesPLNCODIGO: TFloatField;
    qryLiqComAcoesIDTIPOOPERACAO: TFloatField;
    qryLiqComAcoesIDTIPOINVEST: TFloatField;
    qryLiqComAcoesIDEMISSOR: TFloatField;
    qryLiqComAcoesIDINVESTIMENTO: TFloatField;
    qryLiqComAcoesIDOPERCONTACOES: TFloatField;
    qryLiqComAcoesIDOPERCONTACOESAP: TFloatField;
    qryLiqComAcoesIDPLANPREVCTBPATR: TFloatField;
    qryLiqComAcoesOBSERVACAO: TMemoField;
    qryLiqComAcoesPUOPERACAO: TFloatField;
    qryTpOperLiqComAcoesFLGAGE: TStringField;
    qryTpOperLiqComAcoesFLGDATAEX: TStringField;
    qryTpOperLiqComAcoesFLGDATACOM: TStringField;
    qryTpOperLiqComAcoesFLGPRZBOLSA: TStringField;
    qryTpOperLiqComAcoesFLGPRZEMP: TStringField;
    qryTpOperLiqComAcoesFLGATADEC: TStringField;
    qryTpOperLiqComAcoesFLGFORMAPAGREC: TStringField;
    qryTpOperLiqComAcoesFLGDIVACAO: TStringField;
    qryTpOperLiqComAcoesFLGINIPAG: TStringField;
    qryTpOperLiqComAcoesFLGJUROS: TStringField;
    qryTpOperLiqComAcoesFLGPARIDADE: TStringField;
    qryTpOperLiqComAcoesFLGINVORIGEM: TStringField;
    qryTpOperLiqComAcoesFLGPERC: TStringField;
    qryTpOperLiqComAcoesDESCTIPOOPERACAO: TStringField;
    qryTpOperLiqComAcoesIDTIPOOPERACAO: TFloatField;
    qryTpOperLiqComAcoesIDTIPOINVEST: TFloatField;
    qryTpOperLiqComAcoesFLGGRAVAIRLITIGIO: TStringField;
    qryTpOperLiqComAcoesFLGISENTOIR: TStringField;
    qryTpOperLiqComAcoesNATUREZAOPERACAO: TStringField;
    qryTpOperLiqComAcoesIDMERCADO: TFloatField;
    qryTpOperLiqComAcoesFLGTRATAIR: TStringField;
    qryTpOperLiqComAcoesTIPCREDOR: TStringField;
    qryTpOperLiqComAcoesRECPAG: TStringField;
    qryTpOperLiqComAcoesVENCIMENTO: TFloatField;
    qryTpOperLiqComAcoesFLGGERACONTAB: TFloatField;
    qryTpOperLiqComAcoesFLGGERACAPCAR: TFloatField;
    qryIDOPERCONTACOESAP: TFloatField;
    cdsCustodia: TCMClientDataSet;
    cdsCustodiaSGLCUSTODIANTE: TStringField;
    cdsCustodiaIDCUSTODIANTE: TFloatField;
    cdsCustodiaFLGCODATIVOCUST: TStringField;
    pgcLiqComAcoes: TPageControl;
    tbsOperacoes: TTabSheet;
    tbsAcoes: TTabSheet;
    grdLiqComAcoes: TwwDBGrid;
    pnlDetLiquidacaoComAcoes: TPanel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    dbdtDataOperLCA: TCMDateTimePicker;
    dbrQuantidadeLCA: TDBRealEdit;
    dbrValorLCA: TDBRealEdit;
    dblTipoOperLCA: TwwDBLookupCombo;
    dbdtDataLiqLCA: TCMDateTimePicker;
    dbgOperRV: TwwDBGrid;
    pnlOperRV: TPanel;
    Label37: TLabel;
    Label39: TLabel;
    dbreQtdOperRV: TDBRealEdit;
    dblkTipoOperRV: TwwDBLookupCombo;
    Panel3: TPanel;
    Panel8: TPanel;
    dbmObsLCA: TDBMemo;
    Dock975: TDock97;
    Toolbar972: TToolbar97;
    bbtnOkOperRV: TBitBtn;
    bbtnCancelarOperRV: TBitBtn;
    bbtnVoltarOperRV: TBitBtn;
    Dock976: TDock97;
    Toolbar973: TToolbar97;
    sbtnInsOperRV: TToolbarButton97;
    sbtnAltOperRV: TToolbarButton97;
    sbtnExcluiOperRV: TToolbarButton97;
    dsOperRV: TwwDataSource;
    updOperRV: TUpdateSQL;
    qryOperRV: TwwQuery;
    qryOperRVIDOPERACAOINVEST: TFloatField;
    qryOperRVIDCUSTODIANTE: TFloatField;
    qryOperRVIDCORRETVALORES: TFloatField;
    qryOperRVMOECODIGO: TFloatField;
    qryOperRVIDMODULO: TFloatField;
    qryOperRVEMPRESAPROP: TFloatField;
    qryOperRVIDCARTEIRAINVEST: TFloatField;
    qryOperRVIDINVESTIMENTO: TFloatField;
    qryOperRVIDTIPOINVEST: TFloatField;
    qryOperRVIDTIPOOPERACAO: TFloatField;
    qryOperRVDATAOPERACAO: TDateTimeField;
    qryOperRVNUMDOCUMENTO: TStringField;
    qryOperRVQTDEOPERACAO: TFloatField;
    qryOperRVPRECOUNITOPERACAO: TFloatField;
    qryOperRVVLROPERACAO: TFloatField;
    qryOperRVDATAVENCOPER: TDateTimeField;
    qryOperRVOBSERVACAO: TStringField;
    qryOperRVFLGSTATUSFECHBOL: TStringField;
    qryOperRVFLGSTATUSORDMOV: TStringField;
    qryOperRVIDPLANPREVCTBPATR: TFloatField;
    qryOperRVIDCARTEIRAGERENC: TFloatField;
    qryOperRVIDOPERCONTACOES: TFloatField;
    qryTipoOperRV: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    StringField33: TStringField;
    StringField34: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField35: TStringField;
    StringField36: TStringField;
    StringField37: TStringField;
    FloatField3: TFloatField;
    StringField38: TStringField;
    StringField39: TStringField;
    StringField40: TStringField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    dblkPlanoPatro: TwwDBLookupCombo;
    lblPlanPatro: TLabel;
    qryPlanoPatro: TwwQuery;
    qryPlanoPatroIDPLANPREVCTBPATR: TFloatField;
    qryPlanoPatroIDPLANOPREV: TFloatField;
    qryPlanoPatroIDPATRO: TFloatField;
    qryPlanoPatroPLANPRVCONTABPATRO: TStringField;
    qryOperRVDESCTIPOOPERACAO: TStringField;
    qryOperRVDESCINVESTIMENTO: TStringField;
    Label36: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    dblkCarteira: TwwDBLookupCombo;
    dblkCustodiante: TwwDBLookupCombo;
    qryCarteiraOperRV: TwwQuery;
    qryCustodiante: TwwQuery;
    qryCustodianteIDCUSTODIANTE: TFloatField;
    qryCustodianteSGLCUSTODIANTE: TStringField;
    qryCarteiraOperRVIDCARTEIRA: TStringField;
    qryCarteiraOperRVIDCARTEIRAINVEST: TFloatField;
    qryCarteiraOperRVIDCARTEIRAGERENC: TFloatField;
    qryCarteiraOperRVDESCCARTINVEST: TStringField;
    qryCarteiraOperRVIDTIPOINVEST: TFloatField;
    qryCarteiraOperRVIDMERCADO: TFloatField;
    qryCarteiras: TwwQuery;
    StringField41: TStringField;
    StringField42: TStringField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    qryOperRVSALDOQTDE: TFloatField;
    dbreSldQtdOperRV: TDBRealEdit;
    qryTipoOperRVFLGCONTAINVEST: TFloatField;
    qryMarcadoReproc: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbVlrSldRecExit(Sender: TObject);
    procedure dbVlrSldPagExit(Sender: TObject);
    //AL_13
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure dbrPUEnter(Sender: TObject);
    procedure dbrPUExit(Sender: TObject);
    procedure dbrVlrExit(Sender: TObject);
    procedure dbrVlrEnter(Sender: TObject);
    procedure dbdtDataOperLSAExit(Sender: TObject);
    procedure dblTipoOperLSAExit(Sender: TObject);
    procedure dbdtDataLiqLSAEnter(Sender: TObject);
    procedure dbdtDataLiqLSAExit(Sender: TObject);
    procedure dbrQuantidadeLSAEnter(Sender: TObject);
    procedure dbrQuantidadeLSAExit(Sender: TObject);
    procedure dbrValorLSAExit(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure mnuSaldosClick(Sender: TObject);
    procedure mnuOperacoesClick(Sender: TObject);
    procedure dbdtDataOperNaoExeExit(Sender: TObject);
    //AL_13
    procedure GridZebrado(Sender: TObject;
                          Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgrdDetTopRowChanged(Sender: TObject);
    procedure dbgSldPagarTopRowChanged(Sender: TObject);
    procedure dbgSldLiqTopRowChanged(Sender: TObject);
    procedure grdLiqSemAcoesTopRowChanged(Sender: TObject);
    procedure grdNaoExeTopRowChanged(Sender: TObject);
    //AL_15
    procedure grdLiqComAcoesTopRowChanged(Sender: TObject);
    procedure dbdtDataOperLCAExit(Sender: TObject);
    procedure dblTipoOperLCAExit(Sender: TObject);
    procedure dbdtDataLiqLCAExit(Sender: TObject);
    procedure dbdtDataLiqLCAEnter(Sender: TObject);
    procedure dbrQuantidadeLCAEnter(Sender: TObject);
    procedure dbrQuantidadeLCAExit(Sender: TObject);
    procedure dbrValorLCAExit(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure sbtnInsOperRVClick(Sender: TObject);
    procedure bbtnOkOperRVClick(Sender: TObject);
    procedure dblkTipoOperRVExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bbtnCancelarOperRVClick(Sender: TObject);
    procedure bbtnVoltarOperRVClick(Sender: TObject);
    procedure pgcLiqComAcoesChange(Sender: TObject);
    procedure sbtnAltOperRVClick(Sender: TObject);
    procedure sbtnExcluiOperRVClick(Sender: TObject);
    procedure dblkCarteiraExit(Sender: TObject);
    procedure dblkCustodianteExit(Sender: TObject);
  private
    { Private declarations }
    //AL_15
    CtrlRV: TCtrlRendaVariavel;

    procedure Sel(iCont: Integer; bSelCont: Boolean = True);
    procedure SelDet(iCont: Integer);
    procedure SelSldPagar(iCont: Integer);
    procedure SelSldLiq(iCont: Integer);
    procedure SelLiqSAcoes(iCont: Integer);
    procedure SelNaoExe(iCont: Integer);
    procedure SelOperRV(iCont: Integer);
    procedure BuscaSaldo(dData: TdateTime);
    function ConfirmaDetalhes: Boolean;
    function CalculaVenc: Boolean;
    function CalcValoresCont: Double;
    function CarregaCDS: Boolean;
    //AL_15
    function ReprocessaRV : boolean;
    procedure MontaSaldoRV;
    function LiquidaContrAcoes : boolean;
    function VerificaMarcadoReproc(dDataRef : TDateTime;
                                   iInvestimento, iCarteira : Integer) : boolean;

    //AL_15
    procedure SelLiqCAcoes(iCont: Integer);
    procedure AtualizaBotoesLiqComAcoes;
  public
    { Public declarations }
    function MarcaReproc(iContrato: Integer; dDate: TDateTime): Integer;
    function GeraRecPagOpe(iContrato, iOper: Integer; sTipoOper: TTipoOper): Boolean;
    function GeraHistorico(dDataLanc: TDateTime): Boolean;
    function Reprocessa(iContrato: Integer; bVeriOrfao: Boolean = True): Boolean;
  end;

const
  cCorZebra = $007373F9;

var
  frmCadContAcoes: TfrmCadContAcoes;
  fQtdAntes: Double;
  //AL_15
  fSaldoQtd, fQtdOperLancada : Double;
  sBoleta : string;

implementation

uses uMensErro, UOperComum, DBaseDados, UDataBase, UBibliotecaInvest,
     uSistema, uCtrlInvContab, FDMRelContSaldos, URendaVariavel,
     UDiasUteisInv, FDMRelContOpe, dOperComum, UOperacaoInvest,
     dRendaVariavel;

{$R *.DFM}

function TfrmCadContAcoes.MarcaReproc(iContrato: Integer; dDate: TDateTime): Integer;
var qryMarcaRep: TwwQuery;
begin
   try
      //AL_10
      Result := -1;
      qryMarcaRep := TwwQuery.Create(Self);
      qryMarcaRep.DatabaseName := 'BaseDados';
      qryMarcaRep.SQL.Add('UPDATE HISTCONTACOES');
      qryMarcaRep.SQL.Add('SET FLGREPROC = ''S''');
      qryMarcaRep.SQL.Add('WHERE IDOPERCONTACOESAP = ' + IntToStr(iContrato));
      qryMarcaRep.SQL.Add('  AND DATAHISTCONTACOES = ');
      qryMarcaRep.SQL.Add('            (SELECT MAX(H.DATAHISTCONTACOES)');
      qryMarcaRep.SQL.Add('             FROM HISTCONTACOES H');
      qryMarcaRep.SQL.Add('             WHERE H.IDOPERCONTACOESAP = ' + IntToStr(iContrato));
      qryMarcaRep.SQL.Add('               AND H.DATAHISTCONTACOES < TO_DATE(' + QuotedStr(DateToStr(dDate)) + ', ' + QuotedStr('dd/mm/yyyy') + '))');
      qryMarcaRep.Prepare;
      qryMarcaRep.ExecSQL;
      Result := qryMarcaRep.RowsAffected;
   finally
      FreeAndNil(qryMarcaRep);
   end;
end;

function TfrmCadContAcoes.GeraHistorico(dDataLanc: TDateTime): Boolean;
var fVlrSldPag, fQtdSldPag,
    fVlrSldRec, fQtdSldRec,
    fSldVlrHist, fSldQtdHist: Double;
    iIncRec, iIncPag, iOper, iOperAp: Integer;
begin
   try
      // Capta os valores de Saldo a Receber
      fVlrSldRec := qryDetalheVLRSLDCONTACOES.AsFloat;
      fQtdSldRec := qryDetalheQTDSLDCONTACOES.AsFloat;
      if not (qryDetalhe.State in [dsInsert, dsEdit]) then
      begin
         // Se não estiver editando ou inserirndo este saldo, procura o saldo da data
         if qryDetalhe.Locate('DATASLDCONTACOES', dDataLanc, []) then
         begin
            fVlrSldRec := qryDetalheVLRSLDCONTACOES.AsFloat;
            fQtdSldRec := qryDetalheQTDSLDCONTACOES.AsFloat;
            iIncRec := qryDetalheIDSALDOSCONTACOES.AsInteger;
         end
         else
         begin
            fVlrSldRec := 0;
            fQtdSldRec := 0;
            iIncRec := 0;
         end
      end
      else
         iIncRec := qryDetalheIDSALDOSCONTACOES.AsInteger;

      fVlrSldPag := qrySldPagarVLRSLDCONTACOES.AsFloat;
      fQtdSldPag := qrySldPagarQTDSLDCONTACOES.AsFloat;
      if not (qrySldPagar.State in [dsInsert, dsEdit]) then
      begin
         if qrySldPagar.Locate('DATASLDCONTACOES', dDataLanc, []) then
         begin
            fVlrSldPag := qrySldPagarVLRSLDCONTACOES.AsFloat;
            fQtdSldPag := qrySldPagarQTDSLDCONTACOES.AsFloat;
            iIncPag := qrySldPagarIDSALDOSCONTACOES.AsInteger;
         end
         else
         begin
            fVlrSldPag := 0;
            fQtdSldPag := 0;
            iIncPag := 0;
         end;
      end
      else
         iIncPag := qrySldPagarIDSALDOSCONTACOES.AsInteger;

      if qryDetalhe.State in [dsInsert, dsEdit] then
         qryDetalheIDINC.AsInteger := iIncPag
      else
      begin
         if qryDetalhe.Locate('DATASLDCONTACOES', dDataLanc, []) then
         begin
            qryDetalhe.Edit;
            qryDetalheIDINC.AsInteger := iIncPag;
            qryDetalhe.Post;
         end;
      end;

      if qrySldPagar.State in [dsInsert, dsEdit] then
         qrySldPagarIDINC.AsInteger := iIncPag
      else
      begin
         if qrySldPagar.Locate('DATASLDCONTACOES', dDataLanc, []) then
         begin
            qrySldPagar.Edit;
            qrySldPagarIDINC.AsInteger := iIncRec;
            qrySldPagar.Post;
         end;
      end;

      if not (qrySldLiq.State in [dsInsert, dsEdit]) then
      begin
         if qrySldLiq.Locate('DATAHISTCONTACOES', dDataLanc, []) then
            qrySldLiq.Edit
         else
         begin
            qrySldLiq.Insert;
            qrySldLiqIDHISTCONTACOES.Asinteger := LeUltRegistro(nil, 'HISTCONTACOES');
         end;

         qrySldLiqIDPLANPREVCTBPATR.AsInteger := qryIDPLANPREVCTBPATR.AsInteger;
         qrySldLiqIDTIPOINVEST.AsInteger := 2;
         // AL_10
         qrySldLiqIDOPERCONTACOES.AsInteger := qryDetalheIDOPERCONTACOES.AsInteger;
         qrySldLiqIDOPERCONTACOESAP.AsInteger := qryDetalheIDOPERCONTACOESAP.AsInteger;
         qrySldLiqDATAHISTCONTACOES.AsDateTime := dDataLanc;
         qrySldLiqVLRMOVCONTACOES.AsFloat := RoundCM(fVlrSldRec - fVlrSldPag, 2);
         qrySldLiqSLDVLRCONTACOES.AsFloat := RoundCM(fVlrSldRec - fVlrSldPag, 2);
         qrySldLiqQTDMOVCONTACOES.AsFloat := (fQtdSldRec - fQtdSldPag);
         qrySldLiqSLDQTDCONTACOES.AsFloat := (fQtdSldRec - fQtdSldPag);
         // Só calcula provisão de perda se o saldo for positivo
         qrySldLiqVLRPROVPERDA.AsFloat    := 0;
         qrySldLiqSLDPROVPERDA.AsFloat    := 0;
         if qrySldLiqSLDVLRCONTACOES.AsFloat > 0 then
         begin
            qrySldLiqVLRPROVPERDA.AsFloat    := RoundCM((fVlrSldRec - fVlrSldPag)*(qryPERCPROVPERDA.AsFloat/100),2)*-1;
            qrySldLiqSLDPROVPERDA.AsFloat    := RoundCM((fVlrSldRec - fVlrSldPag)*(qryPERCPROVPERDA.AsFloat/100),2)*-1;
         end;
         // AL_10
         if qrySldLiqIDOPERCONTACOES.AsInteger = qrySldLiqIDOPERCONTACOESAP.AsInteger then
         begin
            qrySldLiqHISTMOVCONTACOES.AsString := 'Atualização de ' + dblContraParte.Text + '-' + dbdDtContrato.Text;
            qrySldLiqIDTIPOOPERACAO.AsInteger := -132;
         end
         else
         begin
            if qryLiqSemAcoes.State in [dsInsert, dsEdit] then
            begin
               qrySldLiqHISTMOVCONTACOES.AsString := 'Liquidação Sem Ações de ' + dblContraParte.Text + '-' + dbdDtContrato.Text;
               qrySldLiqIDTIPOOPERACAO.AsInteger := qryLiqSemAcoesIDTIPOOPERACAO.AsInteger;
            end
            else
            if qryNaoExe.State in [dsInsert, dsEdit] then
            begin
               qrySldLiqHISTMOVCONTACOES.AsString := 'Não Exercício de ' + dblContraParte.Text + '-' + dbdDtContrato.Text;
               qrySldLiqIDTIPOOPERACAO.AsInteger := qryNaoExeIDTIPOOPERACAO.AsInteger;
            end
            //AL_15
            else if qryLiqComAcoes.State in [dsInsert, dsEdit] then
            begin
               qrySldLiqHISTMOVCONTACOES.AsString := 'Liquidação Com Ações de ' + dblContraParte.Text + '-' + dbdDtContrato.Text;
               //AL_19
               qrySldLiqIDTIPOOPERACAO.AsInteger := qryLiqComAcoesIDTIPOOPERACAO.AsInteger;
            end
            else
            begin
               if qryLiqSemAcoes.Locate('IDOPERCONTACOES', qrySldLiqIDOPERCONTACOES.AsInteger, []) then
               begin
                  qrySldLiqHISTMOVCONTACOES.AsString := 'Liquidação Sem Ações de ' + dblContraParte.Text + '-' + dbdDtContrato.Text;
                  qrySldLiqIDTIPOOPERACAO.AsInteger := qryLiqSemAcoesIDTIPOOPERACAO.AsInteger;
               end
               else
               if qryNaoExe.Locate('IDOPERCONTACOES', qrySldLiqIDOPERCONTACOES.AsInteger, []) then
               begin
                  qrySldLiqHISTMOVCONTACOES.AsString := 'Não Exercício de ' + dblContraParte.Text + '-' + dbdDtContrato.Text;
                  qrySldLiqIDTIPOOPERACAO.AsInteger := qryNaoExeIDTIPOOPERACAO.AsInteger;
               end
               //AL_15
               else if qryLiqComAcoes.Locate('IDOPERCONTACOES', qrySldLiqIDOPERCONTACOES.AsInteger, []) then
               begin
                  qrySldLiqHISTMOVCONTACOES.AsString := 'Liquidação Com Ações de ' + dblContraParte.Text + '-' + dbdDtContrato.Text;
                  qrySldLiqIDTIPOOPERACAO.AsInteger := qryLiqComAcoesIDTIPOOPERACAO.AsInteger;
               end;
            end;
         end;
         qrySldLiqFLGREPROC.AsString := 'S';
         if (iIncRec > 0) and (iIncPag > 0) then
            qrySldLiqIDINC.AsInteger := 1;
         qrySldLiq.Post;
      end;

      Result := True;
   except
      Result := False;
   end;
end;

function TfrmCadContAcoes.Reprocessa(iContrato: Integer; bVeriOrfao: Boolean): Boolean;
var dDataIni: TdateTime;
    fSldQtdAnt, fSldVlrAnt, fSldVlrPAnt, fSldVlrAntLiq : Double;
    wPlano, wPlanilha, wDocumCont, iCont, iContTemp, iTpOperVar, iTpOperPro, iTipoOperLP: Integer;
    //AL_13
    qryTemp, qryOperacao: TwwQuery;
    wTipoRecDesBol, wMensErro, sHist, sEmissor: String;
    bCriaLancto: Boolean;
begin
   //AL_13
   try
      qryTemp := TwwQuery.Create(Self);
      qryTemp.DatabaseName := 'BaseDados';
      try
         // ------------  Verifica se existem lançamentos de Saldos a Pagar ou a Receber orfãos
         if bVeriOrfao then
         begin
            fraMens.Mostra;
            fraMens.Max := qryDetalhe.RecordCount;
            qryDetalhe.First;
            while not qryDetalhe.Eof do
            begin
               fraMens.Mes := 'Verificando Saldos a Pagar';
               if not qrySldPagar.Locate('DATASLDCONTACOES', qryDetalheDATASLDCONTACOES.AsDateTime, []) then
                  Raise Exception.Create('Falta Saldo a Pagar em ' + qryDetalheDATASLDCONTACOES.AsString);
               fraMens.Incrementa;
               qryDetalhe.Next;
            end;
            fraMens.Mostra;
            fraMens.Max := qrySldPagar.RecordCount;
            qrySldPagar.First;
            while not qrySldPagar.Eof do
            begin
               fraMens.Mes := 'Verificando Saldos a Receber';
               if not qryDetalhe.Locate('DATASLDCONTACOES', qrySldPagarDATASLDCONTACOES.AsDateTime, []) then
                  Raise Exception.Create('Falta Saldo a Receber em ' + qrySldPagarDATASLDCONTACOES.AsString);
               fraMens.Incrementa;
               qrySldPagar.Next;
            end;
         end;

         // AL_3
         // ------------  Verifica se existem saldos liquidos sem saldos a pagar ou receber
         fraMens.Mostra;
         fraMens.Max := qrySldLiq.RecordCount;
         qrySldLiq.First;
         while not qrySldLiq.Eof do
         begin
            fraMens.Mes := 'Verificando Saldo Liquido';
            if not qryDetalhe.Locate('DATASLDCONTACOES', qrySldLiqDATAHISTCONTACOES.AsDateTime, []) then
            begin
               if not qrySldLiqPLNCODIGO.IsNull then
               begin
                  if not OperComum.ProcExclui(-1,
                                              OperComum.IIF(qrySldLiqPLNCODIGO.AsInteger = 0, -1, qrySldLiqPLNCODIGO.AsInteger),
                                              OperComum.IIF(qrySldLiqPLANO.AsInteger = 0, -1, qrySldLiqPLANO.AsInteger),
                                              -1, qrySldLiqDATAHISTCONTACOES.AsDateTime, False) then
                     Raise Exception.Create('Não foi possível limpar os lançamentos contabeis de ' + qrySldLiqDATAHISTCONTACOES.AsString);
               end;
               qrySldLiq.Delete;
            end
            else
               qrySldLiq.Next;
            fraMens.Incrementa;
         end;

         fraMens.Mostra;
         fraMens.Mes := 'Localizando data para inicio de reprocessamento...';

         // ------------  Procura primeiro saldo a receber marcado
         iContTemp := 0;
         iCont := qryDetalhe.RecordCount;
         qryDetalhe.Last;
         while not qryDetalhe.Bof do
         begin
            if qryDetalheFLGREPROC.AsString = 'S' then
            begin
               dDataIni := qryDetalheDATASLDCONTACOES.AsDateTime;
               Break;
            end;
            Inc(iContTemp);
            qryDetalhe.Prior;
         end;
         if iCont > iContTemp then
            iCont := iContTemp;

         // ------------  Verifica se existe um saldo a receber anterior marcado
         iContTemp := 0;
         qrySldPagar.Last;
         while not qrySldPagar.Bof do
         begin
            if qrySldPagarFLGREPROC.AsString = 'S' then
            begin
               if dDataIni > qrySldPagarDATASLDCONTACOES.AsDateTime then
               begin
                  dDataIni := qrySldPagarDATASLDCONTACOES.AsDateTime;
                  Break;
               end;
            end;
            Inc(iContTemp);
            qrySldPagar.Prior;
         end;
         if iCont > iContTemp then
            iCont := iContTemp;

         // ------------  Verifica se existe um saldo liquido anterior marcado
         iContTemp := 0;
         qrySldLiq.Last;
         while not qrySldLiq.Bof do
         begin
            if qrySldLiqFLGREPROC.AsString = 'S' then
            begin
               if (dDataIni > qrySldLiqDATAHISTCONTACOES.AsDateTime) or
                  (dDataIni = 0) then
               begin
                  dDataIni := qrySldLiqDATAHISTCONTACOES.AsDateTime;
                  Break;
               end;
            end;
            Inc(iContTemp);
            qrySldLiq.Prior;
         end;
         if iCont > iContTemp then
            iCont := iContTemp;

         // ------------  Gera Históricos
         // Localiza a primeira data a ser reprocessada
         fraMens.Mostra;
         if not qryDetalhe.Locate('DATASLDCONTACOES', dDataIni, []) then
            qryDetalhe.MoveBy(qryDetalhe.RecordCount * -1)
         else
            fraMens.Max := (qryDetalhe.RecordCount - iCont);

         while not qryDetalhe.Bof do
         begin
            fraMens.Mes := 'Recriando histórico de '+ qryDetalheDATASLDCONTACOES.AsString;
            if not GeraHistorico(qryDetalheDATASLDCONTACOES.AsDateTime) then
               Raise Exception.Create('Não foi possível gerar histórico em ' + qryDetalheDATASLDCONTACOES.AsString);

            qryDetalhe.Edit;
            qryDetalheFLGREPROC.Clear;
            qryDetalhe.Post;

            // Desmarca o reprocessamento
            if qrySldPagar.Locate('DATASLDCONTACOES', qryDetalheDATASLDCONTACOES.AsDateTime, []) then
            begin
               qrySldPagar.Edit;
               qrySldPagarFLGREPROC.Clear;
               qrySldPagar.Post;
            end;
            fraMens.Incrementa;
            qryDetalhe.Prior;
         end;

         // ------------  Capta os saldos anteriores
         qryDetalhe.Last;
         qrySldLiq.Last;

         //AL_17
         qryTemp.SQL.Clear;
         qryTemp.SQL.Add('SELECT E.SIGLAEMISSOR ');
         qryTemp.SQL.Add('FROM EMISSOR E');
         qryTemp.SQL.Add('WHERE E.IDEMISSOR = ' + qryIDEMISSOR.AsString);
         qryTemp.Open;
         sEmissor := qryTemp.FieldByName('SIGLAEMISSOR').AsString;

         while not qrySldLiq.Bof do
         begin
            if qrySldLiqFLGREPROC.AsString = 'S' then
            begin
               if qrySldLiqDATAHISTCONTACOES.AsDateTime = qryDetalheDATASLDCONTACOES.AsDateTime then
               begin
                  //Primeiro Saldo
                  fSldQtdAnt := 0;
                  fSldVlrAnt := 0;
                  fSldVlrPAnt := 0;
               end
               else
               begin
                  //Capta saldo anterior
                  qrySldLiq.Next;
                  fSldQtdAnt := qrySldLiqSLDQTDCONTACOES.AsFloat;
                  fSldVlrAnt := qrySldLiqSLDVLRCONTACOES.AsFloat;
                  fSldVlrPAnt := qrySldLiqSLDPROVPERDA.AsFloat;
                  qrySldLiq.Prior;
               end;
               Break;
            end;
            qrySldLiq.Prior;
         end;

         // ------------  Atualiza e gera contabil
         fraMens.Mostra;
         fraMens.Max := (qrySldLiq.RecordCount - iCont);
         while not qrySldLiq.Bof do
         begin
            if not qryDetalhe.Locate('DATASLDCONTACOES', qrySldLiqDATAHISTCONTACOES.AsDateTime, []) then
            begin
               fraMens.Mes := 'Excluindo o dia ' + qrySldLiqDATAHISTCONTACOES.AsString;

               if qrySldLiqPLNCODIGO.AsInteger > 0 then
                  if not OperComum.ProcExclui(-1, qrySldLiqPLNCODIGO.AsInteger, qrySldLiqPLANO.AsInteger, -1,
                                              qrySldLiqDATAHISTCONTACOES.AsDateTime, False) then
                     Raise Exception.Create('Não foi possível limpar os lançamentos contabeis de ' + qrySldLiqDATAHISTCONTACOES.AsString);
               // Deleta o Saldo Liquido
               qrySldLiq.Delete;
               Continue;
            end;

            fraMens.Mes := 'Atualizando o dia ' + qrySldLiqDATAHISTCONTACOES.AsString;
            qrySldLiq.Edit;
            // AL_6
            if qrySldLiqSLDVLRCONTACOES.AsFloat < 0 then
            begin
               qrySldLiqSLDVLRCONTACOES.AsFloat := 0;
               qrySldLiqSLDPROVPERDA.AsFloat := 0;
            end;
            qrySldLiqQTDMOVCONTACOES.AsFloat := OperComum.Trunca(qrySldLiqSLDQTDCONTACOES.AsFloat - fSldQtdAnt,0);
            qrySldLiqVLRMOVCONTACOES.AsFloat := RoundCM(qrySldLiqSLDVLRCONTACOES.AsFloat - fSldVlrAnt,2);
            qrySldLiqVLRPROVPERDA.AsFloat := RoundCM(qrySldLiqSLDPROVPERDA.AsFloat - fSldVlrPAnt,2);
            qrySldLiqFLGREPROC.Clear;
            qrySldLiq.Post;
            // Mantem o saldo anterior para calcular Lucro/Prejuízo na Liquidação
            fSldVlrAntLiq := fSldVlrAnt;
            // Capta novo saldo anterior
            fSldQtdAnt := qrySldLiqSLDQTDCONTACOES.AsFloat;
            fSldVlrAnt := qrySldLiqSLDVLRCONTACOES.AsFloat;
            fSldVlrPAnt := qrySldLiqSLDPROVPERDA.AsFloat;

            // Seleciona o Tipo de Operação para contabilizar
            iTpOperVar := OperComum.IIF((qrySldLiqVLRMOVCONTACOES.AsFloat >= 0), -132, -133);
            iTpOperPro := OperComum.IIF((qrySldLiqVLRPROVPERDA.AsFloat >= 0), -134, -135);

            // ------------  Inicia a Contabilização
            // Monta o Histórico
            //AL_17
            qryTemp.SQL.Clear;
            qryTemp.SQL.Add('SELECT T.DESCTIPOOPERACAO, T.RECPAG, T.IDTIPOOPERACAO');
            qryTemp.SQL.Add('FROM TIPOOPERACAO T ');
            qryTemp.SQL.Add('WHERE T.IDTIPOOPERACAO = ' + IntToStr(iTpOperVar));
            qryTemp.Open;
            sHist := qryTemp.FieldByName('DESCTIPOOPERACAO').AsString + ' - ' + sEmissor + ' - ' + qryDATAOPERACAO.AsString;

            bCriaLancto    := True;
            wTipoRecDesBol := '';
            wMensErro      := '';
            wPlano     := OperComum.IIF(qrySldLiqPLANO.AsInteger = 0, -1, qrySldLiqPLANO.AsInteger);
            wPlanilha  := OperComum.IIF(qrySldLiqPLNCODIGO.AsInteger = 0, -1, qrySldLiqPLNCODIGO.AsInteger);
            wDocumCont := -1;

            // Limpa a Contabilidade
            if not OperComum.ProcExclui(wDocumCont, wPlanilha, wPlano, -1, qrySldLiqDATAHISTCONTACOES.AsDateTime, False) then
               Raise Exception.Create('Não foi possível limpar os lançamentos contabeis de ' + qrySldLiqDATAHISTCONTACOES.AsString);

            // Contabiliza as Variações
            // AL_12 - Contabiliza valores negativos
            if ((qrySldLiqVLRMOVCONTACOES.AsFloat <> 0) or (qrySldLiqVLRPROVPERDA.AsFloat <> 0)) and
               (qrySldLiqIDOPERCONTACOES.AsInteger = qrySldLiqIDOPERCONTACOESAP.AsInteger)  then
            begin
               // AL_7
               // AL_17
               if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2, qryIDINVESTIMENTO.AsInteger,
                                          qryTemp.FieldByName('IDTIPOOPERACAO').AsInteger, -1,
                                          OperComum.BuscaForCli(qrySldLiqIDTIPOINVEST.AsInteger, QryEmissorIDEMISSOR.Asinteger, -132,0),
                                          -1, qryInvestimentoAcaoIDMOEDACONTAB.AsInteger,
                                          '', '', sHist,
                                          '', qryTemp.FieldByName('RECPAG').AsString
                                          wTipoRecDesBol, bCriaLancto,
                                          qrySldLiqVLRMOVCONTACOES.AsFloat,
                                          qrySldLiqVLRMOVCONTACOES.AsFloat,
                                          qrySldLiqDATAHISTCONTACOES.AsDateTime,
                                          qrySldLiqDATAHISTCONTACOES.AsDateTime,
                                          wPlano, wPlanilha, wDocumCont, wMensErro,
                                          'N'{sCapCar}, False,True{LancaFin},0{CodTipoDoc},
                                          True{direitoorig}, qryIDPLANPREVCTBPATR.AsInteger{PlanPrev}) <> 0 then
                  Raise Exception.Create('Não foi possível contabilizar o Saldo de ' + qrySldLiqDATAHISTCONTACOES.AsString);


               // ------------  Contabiliza a Provisao de Perda
               // Monta o Histórico
               //AL_17
               qryTemp.SQL.Clear;
               qryTemp.SQL.Add('SELECT T.DESCTIPOOPERACAO, T.RECPAG, T.IDTIPOOPERACAO');
               qryTemp.SQL.Add('FROM TIPOOPERACAO T ');
               qryTemp.SQL.Add('WHERE T.IDTIPOOPERACAO = ' + IntToStr(iTpOperPro));
               qryTemp.Open;
               sHist := qryTemp.FieldByName('DESCTIPOOPERACAO').AsString + ' - ' + sEmissor + ' - ' + qryDATAOPERACAO.AsString;

               bCriaLancto    := True;
               wTipoRecDesBol := '';
               wMensErro      := '';

               // Gera contabilidade
               //AL_17
               //AL_7
               if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2, qryIDINVESTIMENTO.AsInteger,
                                          qryTemp.FieldByName('IDTIPOOPERACAO').AsInteger, -1,
                                          OperComum.BuscaForCli(qrySldLiqIDTIPOINVEST.AsInteger, QryEmissorIDEMISSOR.Asinteger, -132,0),
                                          -1, qryInvestimentoAcaoIDMOEDACONTAB.AsInteger,
                                          '', '', sHist,
                                          '', qryTemp.FieldByName('RECPAG').AsString
                                          wTipoRecDesBol, bCriaLancto,
                                          qrySldLiqVLRPROVPERDA.AsFloat,
                                          qrySldLiqVLRPROVPERDA.AsFloat,
                                          qrySldLiqDATAHISTCONTACOES.AsDateTime,
                                          qrySldLiqDATAHISTCONTACOES.AsDateTime,
                                          wPlano, wPlanilha, wDocumCont, wMensErro,
                                          'N'{sCapCar}, False,True{LancaFin},0{CodTipoDoc},
                                          True{direitoorig}, qryIDPLANPREVCTBPATR.AsInteger{PlanPrev}) <> 0 then
                  Raise Exception.Create('Não foi possível contabilizar a Provisão de Perda em ' + qrySldLiqDATAHISTCONTACOES.AsString);
            end
            else
               wPlanilha := 0;

            // ------------  Atualiza a Planilha e o Tipo de Operação Utilizado
            qrySldLiq.Edit;
            if wPlanilha > 0 then
            begin
               qrySldLiqPLANO.AsInteger := wPlano;
               qrySldLiqPLNCODIGO.AsInteger := wPlanilha;
               qrySldLiqIDTIPOOPERACAO.AsInteger := iTpOperVar;
            end
            else
            begin
               qrySldLiqPLANO.Clear;
               qrySldLiqPLNCODIGO.Clear;
            end;
            qrySldLiq.Post;

            // ------------  Contabiliza a Operação de Resgate
            if qrySldLiqIDOPERCONTACOES.AsInteger <> qrySldLiqIDOPERCONTACOESAP.AsInteger  then
            begin
               // AL_13
               // Localiza a operação na tabela original e recalcula Lucro ou Prejuízo
               if qryLiqSemAcoes.Locate('IDOPERCONTACOES', qrySldLiqIDOPERCONTACOES.AsInteger, []) then
               begin
                  qryOperacao := qryLiqSemAcoes;
                  // Recalcula o valor
                  qryLiqSemAcoes.Edit;
                  qryLiqSemAcoesVLRLUCPREJ.AsFloat := qryLiqSemAcoesVLROPERACAO.AsFloat - fSldVlrAntLiq;
                  qryLiqSemAcoes.Post;
               end
               //AL_15
               else if qryLiqComAcoes.Locate('IDOPERCONTACOES', qrySldLiqIDOPERCONTACOES.AsInteger, []) then
               begin
                  qryOperacao := qryLiqComAcoes;
                  // Recalcula o valor
                  qryLiqComAcoes.Edit;
                  qryLiqComAcoesVLRLUCPREJ.AsFloat := qryLiqComAcoesVLROPERACAO.AsFloat - fSldVlrAntLiq;
                  qryLiqComAcoes.Post;
               end
               else
               if qryNaoExe.Locate('IDOPERCONTACOES', qrySldLiqIDOPERCONTACOES.AsInteger, []) then
               begin
                  qryOperacao := qryNaoExe;
                  // Recalcula o valor
                  qryNaoExe.Edit;
                  qryNaoExeVLRLUCPREJ.AsFloat := qryNaoExeVLROPERACAO.AsFloat - fSldVlrAntLiq;
                  qryNaoExe.Post;
               end
               else
                  Raise Exception.Create('Não foi possível localizar a operação código ' + qrySldLiqIDOPERCONTACOES.AsString);

               // Capta dados do tipo de operação e monta o histórico
               //AL_17
               qryTemp.SQL.Clear;
               qryTemp.SQL.Add('SELECT T.DESCTIPOOPERACAO, T.RECPAG, T.IDTIPOOPERACAO,DECODE(NVL(T.FLGGERACAPCAR,0),0, ''N'',''S'') AS FLGGERACAPCAR');
               qryTemp.SQL.Add('FROM TIPOOPERACAO T ');
               qryTemp.SQL.Add('WHERE T.IDTIPOOPERACAO = ' + qryOperacao.FieldByName('IDTIPOOPERACAO').AsString);
               qryTemp.Open;
               sHist := qryTemp.FieldByName('DESCTIPOOPERACAO').AsString + ' - ' + sEmissor + ' - ' + qryDATAOPERACAO.AsString;


               bCriaLancto    := True;
               wTipoRecDesBol := '';
               wMensErro      := '';
               wPlano     := OperComum.IIF(qryOperacao.FieldByName('PLANO').AsInteger = 0, -1, qryOperacao.FieldByName('PLANO').AsInteger);
               wPlanilha  := OperComum.IIF(qryOperacao.FieldByName('PLNCODIGO').AsInteger = 0, -1, qryOperacao.FieldByName('PLNCODIGO').AsInteger);
               wDocumCont := OperComum.IIF(qryOperacao.FieldByName('CODDOCUMENTO').AsInteger = 0, -1, qryOperacao.FieldByName('CODDOCUMENTO').AsInteger);

               // Limpa a Contabilidade
               if not OperComum.ProcExclui(-1, wPlanilha, wPlano, -1, qryOperacao.FieldByName('DATAOPERACAO').AsDateTime, False) then
                  Raise Exception.Create('Não foi possível limpar os lançamentos contabeis de ' + qryOperacao.FieldByName('DATAOPERACAO').AsString);

               // Se ainda não existe Documento Financeiro
               if qryOperacao.FieldByName('CODDOCUMENTO').IsNull then
               begin
                  // Gera o Financeiro (Somente na primeira Vez, quando efetuada a operação)
                  //   e o contabil da operação
                  //AL_17
                  if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2, qryIDINVESTIMENTO.AsInteger,
                                             qryTemp.FieldByName('IDTIPOOPERACAO').AsInteger, -1,
                                             OperComum.BuscaForCli(qryOperacao.FieldByName('IDTIPOINVEST').AsInteger,
                                             QryEmissorIDEMISSOR.Asinteger,
                                             qryOperacao.FieldByName('IDTIPOOPERACAO').AsInteger, 0),
                                             -1, qryInvestimentoAcaoIDMOEDACONTAB.AsInteger,
                                             '', '', sHist,
                                             '', qryTemp.FieldByName('RECPAG').AsString
                                             wTipoRecDesBol, bCriaLancto,
                                             qryOperacao.FieldByName('VLROPERACAO').AsFloat,
                                             qryOperacao.FieldByName('VLROPERACAO').AsFloat,
                                             qryOperacao.FieldByName('DATAOPERACAO').AsDateTime,
                                             qryOperacao.FieldByName('DATALIQUIDACAO').AsDateTime,
                                             wPlano, wPlanilha, wDocumCont, wMensErro,
                                             qryTemp.FieldByName('FLGGERACAPCAR').AsString, False,
                                             True{LancaFin},0{CodTipoDoc},True{direitoorig},
                                             qryIDPLANPREVCTBPATR.AsInteger{PlanPrev}) <> 0 then
                     Raise Exception.Create('Não foi possível efetuar o lançamento financeiro em ' + qryOperacao.FieldByName('DATAOPERACAO').AsString);
               end
               else
               begin
                  // Gera contabil da operação
                  //AL_17
                  if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2, qryIDINVESTIMENTO.AsInteger,
                                             qryTemp.FieldByName('IDTIPOOPERACAO').AsInteger, -1,
                                             OperComum.BuscaForCli(qryOperacao.FieldByName('IDTIPOINVEST').AsInteger,
                                             QryEmissorIDEMISSOR.Asinteger,
                                             qryOperacao.FieldByName('IDTIPOOPERACAO').AsInteger, 0),
                                             -1, qryInvestimentoAcaoIDMOEDACONTAB.AsInteger,
                                             '', '', sHist,
                                             '', qryTemp.FieldByName('RECPAG').AsString
                                             wTipoRecDesBol, bCriaLancto,
                                             0, qryOperacao.FieldByName('VLROPERACAO').AsFloat,
                                             qryOperacao.FieldByName('DATAOPERACAO').AsDateTime,
                                             qryOperacao.FieldByName('DATALIQUIDACAO').AsDateTime,
                                             wPlano, wPlanilha, wDocumCont, wMensErro,
                                             'N', False,True{LancaFin},0{CodTipoDoc},True{direitoorig},
                                             qryIDPLANPREVCTBPATR.AsInteger{PlanPrev}) <> 0 then
                     Raise Exception.Create('Não foi possível contabilizar a Provisão de Perda em ' + qryOperacao.FieldByName('DATAOPERACAO').AsString);
               end;

               // Contabiliza o Lucro / Prejuízo
               if qryOperacao.FieldByName('VLRLUCPREJ').AsFloat <> 0 then
               begin
                  if qryOperacao.FieldByName('VLRLUCPREJ').AsFloat > 0 then
                     iTipoOperLP := -155
                  else
                     iTipoOperLP := -156;

                  //AL_17
                  qryTemp.SQL.Clear;
                  qryTemp.SQL.Add('SELECT T.DESCTIPOOPERACAO, T.RECPAG, T.IDTIPOOPERACAO');
                  qryTemp.SQL.Add('FROM TIPOOPERACAO T ');
                  qryTemp.SQL.Add('WHERE T.IDTIPOOPERACAO = ' + IntToStr(iTipoOperLP));
                  qryTemp.Open;
                  sHist := qryTemp.FieldByName('DESCTIPOOPERACAO').AsString + ' - ' + sEmissor + ' - ' + qryDATAOPERACAO.AsString;
                    
                  bCriaLancto    := True;
                  wTipoRecDesBol := '';
                  wMensErro      := '';

                  // Gera contabilidade
                  //AL_17
                  if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2, qryIDINVESTIMENTO.AsInteger,
                                             qryTemp.FieldByName('IDTIPOOPERACAO').AsInteger, -1,
                                             OperComum.BuscaForCli(qryOperacao.FieldByName('IDTIPOINVEST').AsInteger, QryEmissorIDEMISSOR.Asinteger, -132,0),
                                             -1, qryInvestimentoAcaoIDMOEDACONTAB.AsInteger,
                                             '', '', sHist,
                                             '', qryTemp.FieldByName('RECPAG').AsString
                                             wTipoRecDesBol, bCriaLancto,
                                             0, qryOperacao.FieldByName('VLRLUCPREJ').AsFloat,
                                             qryOperacao.FieldByName('DATAOPERACAO').AsDateTime,
                                             qryOperacao.FieldByName('DATALIQUIDACAO').AsDateTime,
                                             wPlano, wPlanilha, wDocumCont, wMensErro,
                                             'N'{sCapCar}, False,True{LancaFin},0{CodTipoDoc},True{direitoorig},
                                             qryIDPLANPREVCTBPATR.AsInteger{PlanPrev}) <> 0 then
                     Raise Exception.Create('Não foi possível contabilizar o ' +
                                            OperComum.IIF(qryOperacao.FieldByName('VLRLUCPREJ').AsFloat > 0, 'Lucro', 'Prejuízo') +
                                            ' da liquidação ocorrida em ' + qryOperacao.FieldByName('DATAOPERACAO').AsString);
               end;

               // Contabiliza a Provisão de perda
               if qrySldLiqVLRPROVPERDA.AsFloat <> 0 then
               begin
                  //AL_17
                  qryTemp.SQL.Clear;
                  qryTemp.SQL.Add('SELECT T.DESCTIPOOPERACAO, T.RECPAG, T.IDTIPOOPERACAO');
                  qryTemp.SQL.Add('FROM TIPOOPERACAO T ');
                  qryTemp.SQL.Add('WHERE T.IDTIPOOPERACAO = ' + IntToStr(iTpOperPro));
                  qryTemp.Open;
                  sHist := qryTemp.FieldByName('DESCTIPOOPERACAO').AsString + ' - ' + sEmissor + ' - ' + qryDATAOPERACAO.AsString;

                  bCriaLancto    := True;
                  wTipoRecDesBol := '';
                  wMensErro      := '';

                  // Gera contabilidade
                  //AL_17
                  if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2, qryIDINVESTIMENTO.AsInteger,
                                             qryTemp.FieldByName('IDTIPOOPERACAO').AsInteger, -1,
                                             OperComum.BuscaForCli(qrySldLiqIDTIPOINVEST.AsInteger, QryEmissorIDEMISSOR.Asinteger, -132,0),
                                             -1, qryInvestimentoAcaoIDMOEDACONTAB.AsInteger,
                                             '', '', sHist,
                                             '', qryTemp.FieldByName('RECPAG').AsString
                                             wTipoRecDesBol, bCriaLancto,
                                             0, qrySldLiqVLRPROVPERDA.AsFloat,
                                             qrySldLiqDATAHISTCONTACOES.AsDateTime,
                                             qrySldLiqDATAHISTCONTACOES.AsDateTime,
                                             wPlano, wPlanilha, wDocumCont, wMensErro,
                                             'N'{sCapCar}, False,True{LancaFin},0{CodTipoDoc},True{direitoorig},
                                             qryIDPLANPREVCTBPATR.AsInteger{PlanPrev}) <> 0 then
                     Raise Exception.Create('Não foi possível contabilizar a Provisão de Perda em ' + qrySldLiqDATAHISTCONTACOES.AsString);
               end;

               // ------------  Atualiza a Planilha e o Tipo de Operação Utilizado
               // Identifica a operação na tabela original
               if qryLiqSemAcoes.Locate('IDOPERCONTACOES', qrySldLiqIDOPERCONTACOES.AsInteger, []) then
               begin
                  qryLiqSemAcoes.Edit;
                  if wPlanilha > 0 then
                  begin
                     qryLiqSemAcoesPLANO.AsInteger := wPlano;
                     qryLiqSemAcoesPLNCODIGO.AsInteger := wPlanilha;
                  end
                  else
                  begin
                     qryLiqSemAcoesPLANO.Clear;
                     qryLiqSemAcoesPLNCODIGO.Clear;
                  end;
                  if wDocumCont > 0 then
                     qryLiqSemAcoesCODDOCUMENTO.AsInteger := wDocumCont
                  else
                     qryLiqSemAcoesCODDOCUMENTO.Clear;
                  qryLiqSemAcoes.Post;
               end
               //AL_15
               else if qryLiqComAcoes.Locate('IDOPERCONTACOES', qrySldLiqIDOPERCONTACOES.AsInteger, []) then
               begin
                  qryLiqComAcoes.Edit;
                  if wPlanilha > 0 then
                  begin
                     qryLiqComAcoesPLANO.AsInteger := wPlano;
                     qryLiqComAcoesPLNCODIGO.AsInteger := wPlanilha;
                  end
                  else
                  begin
                     qryLiqComAcoesPLANO.Clear;
                     qryLiqComAcoesPLNCODIGO.Clear;
                  end;
                  if wDocumCont > 0 then
                     qryLiqComAcoesCODDOCUMENTO.AsInteger := wDocumCont
                  else
                     qryLiqComAcoesCODDOCUMENTO.Clear;
                  qryLiqComAcoes.Post;
               end
               else
               if qryNaoExe.Locate('IDOPERCONTACOES', qrySldLiqIDOPERCONTACOES.AsInteger, []) then
               begin
                  qryNaoExe.Edit;
                  if wPlanilha > 0 then
                  begin
                     qryNaoExePLANO.AsInteger := wPlano;
                     qryNaoExePLNCODIGO.AsInteger := wPlanilha;
                  end
                  else
                  begin
                     qryNaoExePLANO.Clear;
                     qryNaoExePLNCODIGO.Clear;
                  end;
                  if wDocumCont > 0 then
                     qryNaoExeCODDOCUMENTO.AsInteger := wDocumCont
                  else
                     qryNaoExeCODDOCUMENTO.Clear;
                  qryNaoExe.Post;
               end
               else
                  Raise Exception.Create('Não foi possível localizar a operação código ' + qrySldLiqIDOPERCONTACOES.AsString);
            end;

            // ------------  Próximo Dia
            fraMens.Incrementa;
            qrySldLiq.Prior;
         end;
         Result := True;
      except
         on E: Exception do
         begin
            MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
            Result := False;
         end;
      end;
   finally
      fraMens.Apaga;
      FreeAndNil(qryTemp);
      qryOperacao := nil;
   end;
end;

//AL_13

procedure TfrmCadContAcoes.FormShow(Sender: TObject);
begin
  inherited;
  qryTipoOperacao.Open;
  QryEmissor.Open;
  qryInvestimentoAcao.Open;
  qryTpOperLiqSemAcoes.Open;
  //AL_15
  qryTpOperLiqComAcoes.Open;
  qryTipoOperRV.Open;
  qryPlanoPatro.Open;
  Sel(-1);
  tbcDetalhe.TabIndex := 0;
  pgctrlDetalhe.ActivePage := tbsDet;
end;

procedure TfrmCadContAcoes.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  inherited;
  qryTipoOperacao.Close;
  QryEmissor.Close;
  qryInvestimentoAcao.Close;
  qryTpOperLiqSemAcoes.Close;
  //AL_15
  qryTpOperLiqComAcoes.Close;
  qryTipoOperRV.Close;
  qryPlanoPatro.Close;
  
  cdsSaldoAnt.Close;
end;

procedure TfrmCadContAcoes.Sel(iCont: Integer; bSelCont: Boolean = True);
begin
   try
      if bSelCont then
      begin
         OperComum.LimpaParametros(qry);
         qry.ParamByName('IDOPERCONTACOES').AsInteger := iCont;
         qry.Open;
      end;
      SelDet(iCont);
      SelSldPagar(iCont);
      SelSldLiq(iCont);
      SelLiqSAcoes(iCont);
      SelNaoExe(iCont);
      //AL_15
      SelLiqCAcoes(iCont);
      SelOperRV(qryLiqComAcoes.FieldByName('IDOPERCONTACOES').AsInteger);
   except
      if iCont <> -2 then
      begin
         MsgDlg('Não foi possível selecionar este Contrato',
                'Mensagem do Sistema', mtWarning, [mbOK], 0);
         Sel(-2);
      end;
   end;
end;

procedure TfrmCadContAcoes.SelDet(iCont: Integer);
begin
   OperComum.LimpaParametros(qryDetalhe);
   qryDetalhe.ParamByName('IDOPERCONTACOES').AsInteger := iCont;
   qryDetalhe.Open;
end;

procedure TfrmCadContAcoes.SelSldPagar(iCont: Integer);
begin
   OperComum.LimpaParametros(qrySldPagar);
   qrySldPagar.ParamByName('IDOPERCONTACOES').AsInteger := iCont;
   qrySldPagar.Open;
end;

procedure TfrmCadContAcoes.SelSldLiq(iCont: Integer);
begin
   OperComum.LimpaParametros(qrySldLiq);
   qrySldLiq.ParamByName('IDOPERCONTACOES').AsInteger := iCont;
   qrySldLiq.Open;
end;

procedure TfrmCadContAcoes.SelLiqSAcoes(iCont: Integer);
begin
   OperComum.LimpaParametros(qryLiqSemAcoes);
   qryLiqSemAcoes.ParamByName('IDOPERCONTACOES').AsInteger := iCont;
   qryLiqSemAcoes.Open;
end;

//AL_15
procedure TfrmCadContAcoes.SelLiqCAcoes(iCont: Integer);
begin
   OperComum.LimpaParametros(qryLiqComAcoes);
   qryLiqComAcoes.ParamByName('IDOPERCONTACOES').AsInteger := iCont;
   qryLiqComAcoes.Open;
end;

//AL_15
procedure TfrmCadContAcoes.SelOperRV(iCont: Integer);
begin
   OperComum.LimpaParametros(qryOperRV);
   qryOperRV.ParamByName('IDOPERCONTACOES').AsInteger := iCont;
   qryOperRV.Open;
   if not qryOperRV.IsEmpty then
      sBoleta := qryOperRv.FieldByName('NUMDOCUMENTO').AsString;
end;

//AL_13
procedure TfrmCadContAcoes.SelNaoExe(iCont: Integer);
begin
   OperComum.LimpaParametros(qryNaoExe);
   qryNaoExe.ParamByName('IDOPERCONTACOES').AsInteger := iCont;
   qryNaoExe.Open;
end;

// AL_10
procedure TfrmCadContAcoes.BuscaSaldo(dData:TdateTime);
var fSldQtd, fSldVlr: Double;
begin
   if pgctrlDetalhe.ActivePage = tbsLiqSemAcoes then
   begin
      if (dData > 0) and (qryLiqSemAcoes.State in [dsInsert, dsEdit]) and
         ((qryLiqSemAcoes.FieldByName('QUANTIDADE').AsFloat = 0) or
          (qryLiqSemAcoes.FieldByName('VLROPERACAO').AsFloat = 0)) then
      begin
         try
            qrySldLiq.DisableControls;
            qrySldPagar.DisableControls;
            // Busca o Saldo Liquido na Data
            qrySldLiq.First;
            while not qrySldLiq.eof do
            begin
               if qrySldLiqDATAHISTCONTACOES.AsDateTime < qryLiqSemAcoesDATAOPERACAO.AsDateTime then
                  Break;
               qrySldLiq.Next;
            end;
            // Capta o saldo de quantidade e valor
            fSldQtd := qrySldLiqSLDQTDCONTACOES.AsFloat;
            fSldVlr := qrySldLiqSLDVLRCONTACOES.AsFloat;
            // Se o saldo de quantidade for zero, busca no saldo a pagar
            if fSldQtd = 0 then
            begin
               // Busca o Saldo a Pagar na Data
               qrySldPagar.First;
               while not qrySldPagar.eof do
               begin
                  if qrySldPagarDATASLDCONTACOES.AsDateTime < qryLiqSemAcoesDATAOPERACAO.AsDateTime then
                     Break;
                  qrySldPagar.Next;
               end;
               fSldQtd := qrySldPagarQTDSLDCONTACOES.AsFloat;
            end;

            if qryLiqSemAcoes.FieldByName('QUANTIDADE').AsFloat = 0 then
               qryLiqSemAcoes.FieldByName('QUANTIDADE').AsVariant := fSldQtd;

            if qryLiqSemAcoes.FieldByName('VLROPERACAO').AsFloat = 0 then
            begin
               // Se a quantidade foi alterada manualmente, calcula o valor proporcional
               if qryLiqSemAcoes.FieldByName('QUANTIDADE').AsVariant <> fSldQtd then
                  qryLiqSemAcoes.FieldByName('VLROPERACAO').AsFloat := fSldVlr * OperComum.DivValorZero(qryLiqSemAcoes.FieldByName('QUANTIDADE').AsFloat, fSldQtd)
               else
                  qryLiqSemAcoes.FieldByName('VLROPERACAO').AsFloat := fSldVlr;
            end;
            // Atualiza o PU da operação
            qryLiqSemAcoes.FieldByName('PUOPERACAO').AsVariant := OperComum.DivValorZero(qryLiqSemAcoes.FieldByName('VLROPERACAO').AsFloat, qryLiqSemAcoes.FieldByName('QUANTIDADE').AsFloat);
         finally
            qrySldLiq.EnableControls;
            qrySldPagar.EnableControls;
         end;
      end;
   end
   else
   if pgctrlDetalhe.ActivePage = tbsNaoExe then
   begin
      if (dData > 0) and (qryNaoExe.State in [dsInsert, dsEdit]) and
         ((qryNaoExe.FieldByName('QUANTIDADE').AsFloat = 0) or
          (qryNaoExe.FieldByName('VLROPERACAO').AsFloat = 0)) then
      begin
         try
            qrySldLiq.DisableControls;
            qrySldPagar.DisableControls;
            // Busca o Saldo Liquido na Data
            qrySldLiq.First;
            while not qrySldLiq.eof do
            begin
               if qrySldLiqDATAHISTCONTACOES.AsDateTime < qryNaoExeDATAOPERACAO.AsDateTime then
                  Break;
               qrySldLiq.Next;
            end;
            // Capta o saldo de quantidade e valor
            fSldQtd := qrySldLiqSLDQTDCONTACOES.AsFloat;
            fSldVlr := qrySldLiqSLDVLRCONTACOES.AsFloat;

            if fSldQtd = 0 then
            begin
               // Busca o Saldo a Pagar na Data
               qrySldPagar.First;
               while not qrySldPagar.eof do
               begin
                  if qrySldPagarDATASLDCONTACOES.AsDateTime < qryNaoExeDATAOPERACAO.AsDateTime then
                     Break;
                  qrySldPagar.Next;
               end;
               fSldQtd := qrySldPagarQTDSLDCONTACOES.AsFloat;
            end;

            if qryNaoExe.FieldByName('QUANTIDADE').AsFloat = 0 then
               qryNaoExe.FieldByName('QUANTIDADE').AsVariant := fSldQtd;

            if qryNaoExe.FieldByName('VLROPERACAO').AsFloat = 0 then
            begin
               // Se a quantidade foi alterada manualmente, calcula o valor proporcional
               if qryNaoExe.FieldByName('QUANTIDADE').AsVariant <> fSldQtd then
                  qryNaoExe.FieldByName('VLROPERACAO').AsFloat := fSldVlr * OperComum.DivValorZero(qryNaoExe.FieldByName('QUANTIDADE').AsFloat, fSldQtd)
               else
                  qryNaoExe.FieldByName('VLROPERACAO').AsFloat := fSldVlr;
            end;
            // Atualiza o PU da operação
            qryNaoExe.FieldByName('PUOPERACAO').AsVariant := OperComum.DivValorZero(qryNaoExe.FieldByName('VLROPERACAO').AsFloat, qryNaoExe.FieldByName('QUANTIDADE').AsFloat);
         finally
            qrySldLiq.EnableControls;
            qrySldPagar.EnableControls;
         end;
      end;
   end
   //AL_15
   else if pgctrlDetalhe.ActivePage = tbsLiqComAcoes then
   begin
      if (dData > 0) and (qryLiqComAcoes.State in [dsInsert, dsEdit]) and
         ((qryLiqComAcoes.FieldByName('QUANTIDADE').AsFloat = 0) or
          (qryLiqComAcoes.FieldByName('VLROPERACAO').AsFloat = 0)) then
      begin
         try
            qrySldLiq.DisableControls;
            qrySldPagar.DisableControls;
            // Busca o Saldo Liquido na Data
            qrySldLiq.First;
            while not qrySldLiq.eof do
            begin
               if qrySldLiqDATAHISTCONTACOES.AsDateTime < qryLiqComAcoesDATAOPERACAO.AsDateTime then
                  Break;
               qrySldLiq.Next;
            end;
            // Capta o saldo de quantidade e valor
            fSldQtd := qrySldLiqSLDQTDCONTACOES.AsFloat;
            fSldVlr := qrySldLiqSLDVLRCONTACOES.AsFloat;

            if fSldQtd = 0 then
            begin
               // Busca o Saldo a Pagar na Data
               qrySldPagar.First;
               while not qrySldPagar.eof do
               begin
                  if qrySldPagarDATASLDCONTACOES.AsDateTime < qryLiqComAcoesDATAOPERACAO.AsDateTime then
                     Break;
                  qrySldPagar.Next;
               end;
               fSldQtd := qrySldPagarQTDSLDCONTACOES.AsFloat;
            end;

            if qryLiqComAcoes.FieldByName('QUANTIDADE').AsFloat = 0 then
               qryLiqComAcoes.FieldByName('QUANTIDADE').AsVariant := fSldQtd;

            if qryLiqComAcoes.FieldByName('VLROPERACAO').AsFloat = 0 then
            begin
               // Se a quantidade foi alterada manualmente, calcula o valor proporcional
               if qryLiqComAcoes.FieldByName('QUANTIDADE').AsVariant <> fSldQtd then
                  qryLiqComAcoes.FieldByName('VLROPERACAO').AsFloat := fSldVlr * OperComum.DivValorZero(qryLiqComAcoes.FieldByName('QUANTIDADE').AsFloat, fSldQtd)
               else
                  qryLiqComAcoes.FieldByName('VLROPERACAO').AsFloat := fSldVlr;
            end;
            // Atualiza o PU da operação
            qryLiqComAcoes.FieldByName('PUOPERACAO').AsVariant := OperComum.DivValorZero(qryLiqComAcoes.FieldByName('VLROPERACAO').AsFloat, qryLiqComAcoes.FieldByName('QUANTIDADE').AsFloat);
         finally
            qrySldLiq.EnableControls;
            qrySldPagar.EnableControls;
         end;
      end;
   end;
end;

procedure TfrmCadContAcoes.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   // AL_8 - Controle de trava de fechamento RV
   if qry.State = dsInsert then
   begin
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      Sel(qryIDOPERCONTACOES.AsInteger, False);
      if dblTipoOperacao.CanFocus then
         dblTipoOperacao.SetFocus;
   end;
end;

procedure TfrmCadContAcoes.CmeDetalheInsert(Sender: TObject);
begin
   if pgctrlDetalhe.ActivePage = tbsDet then
   begin
      if dbdDataSldRec.CanFocus then
         dbdDataSldRec.SetFocus;
   end
   else
   if pgctrlDetalhe.ActivePage = tbsSldPag then
   begin
      if dbdDataSldPag.CanFocus then
         dbdDataSldPag.SetFocus;
   end
   else
   if pgctrlDetalhe.ActivePage = tbsSldLiq then
   begin
      if dbdDataSldLiquido.CanFocus then
         dbdDataSldLiquido.SetFocus;
   end
   else
   if pgctrlDetalhe.ActivePage = tbsLiqSemAcoes then
   begin
      if dblTipoOperLSA.CanFocus then
         dblTipoOperLSA.SetFocus;
   end
   else
   if pgctrlDetalhe.ActivePage = tbsNaoExe then
   begin
      if dbdtDataOperNaoExe.CanFocus then
         dbdtDataOperNaoExe.SetFocus;
   end
   else
   if pgctrlDetalhe.ActivePage = tbsLiqComAcoes then
   begin
      if dblTipoOperLCA.CanFocus then
         dblTipoOperLCA.SetFocus;
   end;

   inherited;

   //AL_15
   if (pgctrlDetalhe.ActivePage = tbsLiqSemAcoes) or
      (pgctrlDetalhe.ActivePage = tbsNaoExe) or
      (pgctrlDetalhe.ActivePage = tbsLiqComAcoes) then
   begin
      qryAtual.FieldByName('IDOPERCONTACOES').AsInteger := LeUltRegistro(nil,'OPERCONTACOES');
      qryAtual.FieldByName('IDEMISSOR').AsInteger := qryIDEMISSOR.AsInteger;
      qryAtual.FieldByName('IDINVESTIMENTO').AsInteger := qryIDINVESTIMENTO.AsInteger;
   end
   else
   begin
      qryAtual.FieldByName('IDSALDOSCONTACOES').AsInteger := LeUltRegistro(nil,'SALDOSCONTACOES');
      qryAtual.FieldByName('TIPOSALDO').AsString := OperComum.IIF(pgctrlDetalhe.ActivePage = tbsDet, 'R', 'P');
      qryAtual.FieldByName('IDOPERCONTACOES').AsInteger := qryIDOPERCONTACOES.AsInteger;
   end;
   qryAtual.FieldByName('IDOPERCONTACOESAP').AsInteger := qryIDOPERCONTACOES.AsInteger;
   qryAtual.FieldByName('IDPLANPREVCTBPATR').AsInteger := qryIDPLANPREVCTBPATR.AsInteger;
end;

procedure TfrmCadContAcoes.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadContAcoes.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   if Trim(dblTipoOperacao.Text) = '' then
   begin
      MsgDlg('Não foi selecionado um tipo de operação para este Contrato,'+#13+
             'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
      Accept := False;
      if dblTipoOperacao.CanFocus then
         dblTipoOperacao.SetFocus;
      Exit;
   end
   else
   if Trim(dblContraParte.Text) = '' then
   begin
      Accept := False;
      MsgDlg('Não foi selecionado uma Contra Parte para este Contrato,'+#13+
             'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dblContraParte.CanFocus then
         dblContraParte.SetFocus;
      Exit;
   end
   else
   if dbrQtd.Value = 0 then
   begin
      Accept := False;
      MsgDlg('Não foi informada uma quantidade para este Contrato,'+#13+
             'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbrQtd.CanFocus then
         dbrQtd.SetFocus;
      Exit;
   end
   else
   if dbrPU.Value = 0 then
   begin
      Accept := False;
      MsgDlg('Não foi informado um PU para este Contrato,'+#13+
             'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbrPU.CanFocus then
         dbrPU.SetFocus;
      Exit;
   end
   else
   if dbrVlr.Value = 0 then
   begin
      Accept := False;
      MsgDlg('Não foi informado um Valor para este Contrato,'+#13+
             'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbrVlr.CanFocus then
         dbrVlr.SetFocus;
      Exit;
   end
   else
   if Trim(dbdDtContrato.Text) = '' then
   begin
      Accept := False;
      MsgDlg('Não foi informada a Data deste Contrato,'+#13+
             'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbdDtContrato.CanFocus then
         dbdDtContrato.SetFocus;
      Exit;
   end
   else
   if Trim(dbdIniPeriodoExe.Text) = '' then
   begin
      Accept := False;
      MsgDlg('Não foi informada a data inicial do período de exercício deste Contrato,'+#13+
             'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbdIniPeriodoExe.CanFocus then
         dbdIniPeriodoExe.SetFocus;
      Exit;
   end
   else
   if Trim(dbdFimPeriodoExe.Text) = '' then
   begin
      Accept := False;
      MsgDlg('Não foi informada a data final do período de exercício deste Contrato,'+#13+
             'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbdFimPeriodoExe.CanFocus then
         dbdFimPeriodoExe.SetFocus;
      Exit;
   end;

   Accept := True;

end;

procedure TfrmCadContAcoes.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   // AL_8 - Controle de trava de fechamento RV
   if qry.State = dsEdit then
   begin
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      if dblTipoOperacao.CanFocus then
         dblTipoOperacao.SetFocus;
      pgcLiqComAcoes.ActivePage := tbsOperacoes;
   end;
end;

procedure TfrmCadContAcoes.bbtnConfirmarClick(Sender: TObject);
// AL_2
var bConfirma, bMens: Boolean;

begin
   // AL_13
   // Força a saída do componente atual para acionar o OnExit deste componente
   //    no caso de teclar enter e o botão for default
   SelectNext(ActiveControl,True,True);

   // AL_2
   // Caso não confirmar, não pode fazer o finally
   CmeCadastroBeforeConfirma(Self, bConfirma);
   if not bConfirma then
      Exit;

   try
      try
         bMens := True;
         qryDetalhe.DisableControls;
         qrySldPagar.DisableControls;
         qrySldLiq.DisableControls;
         // AL_10
         qryLiqSemAcoes.DisableControls;
         // AL_13
         qryNaoExe.DisableControls;
         // AL_15
         qryLiqComAcoes.DisableControls;
         qryOperRV.DisableControls;

         if qryIDTIPOINVEST.IsNull then
            qryIDTIPOINVEST.Asinteger := 2;

         if not Reprocessa(qryIDOPERCONTACOES.AsInteger) then
         begin
            bMens := False;
            Abort;
         end;

         // Baixa as alterações para o banco
         // AL_10 - Primeiro baixa as operações, depois os históricos
         qry.ApplyUpdates;
         qry.CommitUpdates;
         qryLiqSemAcoes.ApplyUpdates;
         qryLiqSemAcoes.CommitUpdates;
         //AL_13
         //AL_15
         qryLiqComAcoes.ApplyUpdates;
         qryLiqComAcoes.CommitUpdates;

         qryNaoExe.ApplyUpdates;
         qryNaoExe.CommitUpdates;

         qryDetalhe.ApplyUpdates;
         qryDetalhe.CommitUpdates;
         qrySldPagar.ApplyUpdates;
         qrySldPagar.CommitUpdates;
         qrySldLiq.ApplyUpdates;
         qrySldLiq.CommitUpdates;

         //AL_15
         if not ReprocessaRV then
         begin
            bMens := False;
            Abort;
         end;

         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;
      except
         on E: Exception do
         begin
            if bMens then
               MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         end;
      end;
   finally
      qryDetalhe.EnableControls;
      qrySldPagar.EnableControls;
      qrySldLiq.EnableControls;
      // AL_10
      qryLiqSemAcoes.EnableControls;
      // AL_13
      qryNaoExe.EnableControls;
      // AL_15
      qryLiqComAcoes.EnableControls;
      qryOperRV.EnableControls;
      SelOperRV(qryLiqComAcoes.FieldByName('IDOPERCONTACOES').AsInteger);

      bbtnCancelarClick(Self);
   end;
   //AL_15

end;

procedure TfrmCadContAcoes.FormResize(Sender: TObject);
begin
  inherited;
  if Trunc((fraMens.Width / 3) * 2) > 350 then
     fraMens.pnlProgressoMensagem.Width := Trunc((fraMens.Width / 3) * 2)
  else
  begin
     if fraMens.Width <= 350 then
        fraMens.pnlProgressoMensagem.Width := fraMens.Width - 70
     else
        fraMens.pnlProgressoMensagem.Width := 340;
  end;
end;

procedure TfrmCadContAcoes.sbtnApagarClick(Sender: TObject);
var iOldOper: Integer;
begin
   // AL_8 - Controle de trava de fechamento RV
   if RendaVariavel.VerEmAbertura then
   begin
      CmeCadastro.AtualizaBotoes(Self);
      Exit;
   end;

   // AL_13
   try
      // AL_1
      if MsgDlg('Exclui o Contrato e todos os saldos?', 'Mensagem do Sistema', mtConfirmation,[mbYes, mbNo],0) = mrYes then
      begin
         try
            // AL_1
            if not dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.StartTransaction;

            fraMens.Mostra;
            fraMens.Max := qrySldLiq.RecordCount + qrySldPagar.RecordCount + qryDetalhe.RecordCount + 1;
            fraMens.Pos := 0;

            //Exclui Saldos Liquido
            qrySldLiq.First;
            while not qrySldLiq.Eof do
            begin
               fraMens.Mes := 'Excluindo saldo Liquido do dia ' + qrySldLiqDATAHISTCONTACOES.AsString;
               // Limpa a Contabilidade
               if not OperComum.ProcExclui(-1,
                                           OperComum.IIF(qrySldLiqPLNCODIGO.AsInteger = 0, -1, qrySldLiqPLNCODIGO.AsInteger),
                                           OperComum.IIF(qrySldLiqPLANO.AsInteger = 0, -1, qrySldLiqPLANO.AsInteger),
                                           -1, qrySldLiqDATAHISTCONTACOES.AsDateTime, False) then
                  Raise Exception.Create('Não foi possível limpar os lançamentos contabeis de ' + qrySldLiqDATAHISTCONTACOES.AsString);

               qrySldLiq.Delete;
               fraMens.Incrementa;
            end;
            qrySldLiq.ApplyUpdates;

            //Exclui Saldos a Pagar
            qrySldPagar.First;
            while not qrySldPagar.Eof do
            begin
               fraMens.Mes := 'Excluindo saldo a Pagar do dia ' + qrySldPagarDATASLDCONTACOES.AsString;
               qrySldPagar.Delete;
               fraMens.Incrementa;
            end;
            qrySldPagar.ApplyUpdates;

            //Exclui Saldos a Receber
            qryDetalhe.First;
            while not qryDetalhe.Eof do
            begin
               fraMens.Mes := 'Excluindo saldo a Receber do dia ' + qryDetalheDATASLDCONTACOES.AsString;
               qryDetalhe.Delete;
               fraMens.Incrementa;
            end;
            qryDetalhe.ApplyUpdates;

            // AL_10
            //Exclui as Liquidações em Ações
            qryLiqSemAcoes.First;
            while not qryLiqSemAcoes.Eof do
            begin
               fraMens.Mes := 'Excluindo as Liquidações sem Ações do dia ' + qryLiqSemAcoesDATAOPERACAO.AsString;
               // Limpa a Contabilidade
               if not OperComum.ProcExclui(OperComum.IIF(qryLiqSemAcoesCODDOCUMENTO.AsInteger = 0, -1, qryLiqSemAcoesCODDOCUMENTO.AsInteger),
                                           OperComum.IIF(qryLiqSemAcoesPLNCODIGO.AsInteger = 0, -1, qryLiqSemAcoesPLNCODIGO.AsInteger),
                                           OperComum.IIF(qryLiqSemAcoesPLANO.AsInteger = 0, -1, qryLiqSemAcoesPLANO.AsInteger),
                                           -1, qryLiqSemAcoesDATAOPERACAO.AsDateTime, False) then
                  Raise Exception.Create('Não foi possível limpar os lançamentos contabeis e financeiros de ' + qryLiqSemAcoesDATAOPERACAO.AsString);
               qryLiqSemAcoes.Delete;
               fraMens.Incrementa;
            end;
            qryLiqSemAcoes.ApplyUpdates;

            // AL_13
            //Exclui os Não Exercícios
            qryNaoExe.First;
            while not qryNaoExe.Eof do
            begin
               fraMens.Mes := 'Excluindo as Liquidações sem Ações do dia ' + qryNaoExeDATAOPERACAO.AsString;
               // Limpa a Contabilidade
               if not OperComum.ProcExclui(OperComum.IIF(qryNaoExeCODDOCUMENTO.AsInteger = 0, -1, qryNaoExeCODDOCUMENTO.AsInteger),
                                           OperComum.IIF(qryNaoExePLNCODIGO.AsInteger = 0, -1, qryNaoExePLNCODIGO.AsInteger),
                                           OperComum.IIF(qryNaoExePLANO.AsInteger = 0, -1, qryNaoExePLANO.AsInteger),
                                           -1, qryNaoExeDATAOPERACAO.AsDateTime, False) then
                  Raise Exception.Create('Não foi possível limpar os lançamentos contabeis e financeiros de ' + qryNaoExeDATAOPERACAO.AsString);
               qryNaoExe.Delete;
               fraMens.Incrementa;
            end;
            qryNaoExe.ApplyUpdates;

            // AL_15
            //Exclui as Liquidações Com Ações
            qryOperRv.First; 
            while not qryOperRv.Eof do
            begin
               fraMens.Mes := 'Excluindo as Operações de Renda Variável. ' + qryLiqComAcoesDATAOPERACAO.AsString;
               if not RendaVariavel.ExcluiBoleta(qryOperRv.FieldByName('NUMDOCUMENTO').AsString, true, false) then
                  Raise Exception.Create('Não foi possível excluir a Operção.');

               qryOperRv.Delete;
               fraMens.Incrementa;
            end;

            qryLiqComAcoes.First;
            while not qryLiqComAcoes.Eof do
            begin
               fraMens.Mes := 'Excluindo as Liquidações com Ações do dia ' + qryLiqComAcoesDATAOPERACAO.AsString;
               // Limpa a Contabilidade
               if not OperComum.ProcExclui(OperComum.IIF(qryLiqComAcoesCODDOCUMENTO.AsInteger = 0, -1, qryLiqComAcoesCODDOCUMENTO.AsInteger),
                                           OperComum.IIF(qryLiqComAcoesPLNCODIGO.AsInteger = 0, -1, qryLiqComAcoesPLNCODIGO.AsInteger),
                                           OperComum.IIF(qryLiqComAcoesPLANO.AsInteger = 0, -1, qryLiqComAcoesPLANO.AsInteger),
                                           -1, qryLiqComAcoesDATAOPERACAO.AsDateTime, False) then
                  Raise Exception.Create('Não foi possível limpar os lançamentos contabeis e financeiros de ' + qryLiqComAcoesDATAOPERACAO.AsString);
               qryLiqComAcoes.Delete;
               fraMens.Incrementa;
            end;
            qryLiqComAcoes.ApplyUpdates;

            // Exclui o Contrato
            iOldOper := qryIDOPERCONTACOES.AsInteger;
            qry.Delete;
            qry.ApplyUpdates;

            // Al_1
            if dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Commit;

            Sel(iOldOper);
            CmeCadastro.AtualizaBotoes(Self);

         except
            on E:Exception do
            begin
               MsgDlg('Não foi possível excluir este Contrato. '+ #13 +
                      E.Message, 'Mensagem do Sistema', MtError,[MbOk],0);
               // AL_1
               bbtnCancelarClick(Self);
            end;
         end
      end;
   finally
      fraMens.Apaga;
      CmeCadastro.AtualizaBotoes(Self);
   end;
end;

procedure TfrmCadContAcoes.CmeDetalheConfirma(Sender: TObject);
begin
   //AL_13
   if (pgctrlDetalhe.ActivePage = tbsLiqSemAcoes) and
      (qryLiqSemAcoes.State in [dsEdit, dsInsert]) then
   begin
      qryAtual.FieldByName('DESCTIPOOPERACAO').AsString := qryTpOperLiqSemAcoes.FieldByName('DESCTIPOOPERACAO').AsString;
      qryAtual.FieldByName('IDTIPOINVEST').AsInteger    := qryTpOperLiqSemAcoes.FieldByName('IDTIPOINVEST').AsInteger;
   end
   else
   if (pgctrlDetalhe.ActivePage = tbsNaoExe) and
      (qryNaoExe.State in [dsEdit, dsInsert]) then
   begin
      qryAtual.FieldByName('IDTIPOOPERACAO').AsInteger  := qryTpOperNaoExe.FieldByName('IDTIPOOPERACAO').AsInteger;
      qryAtual.FieldByName('DESCTIPOOPERACAO').AsString := qryTpOperNaoExe.FieldByName('DESCTIPOOPERACAO').AsString;
      qryAtual.FieldByName('IDTIPOINVEST').AsInteger    := qryTpOperNaoExe.FieldByName('IDTIPOINVEST').AsInteger;
   end
   //AL_15
   else if (pgctrlDetalhe.ActivePage = tbsLiqComAcoes) and
           (qryLiqComAcoes.State in [dsEdit, dsInsert]) then
   begin
      qryAtual.FieldByName('DESCTIPOOPERACAO').AsString := qryTpOperLiqComAcoes.FieldByName('DESCTIPOOPERACAO').AsString;
      qryAtual.FieldByName('IDTIPOINVEST').AsInteger    := qryTpOperLiqComAcoes.FieldByName('IDTIPOINVEST').AsInteger;
   end;
   inherited;
end;

procedure TfrmCadContAcoes.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;
   //AL_15
   CmeCadastro.AtualizaBotoes(Self);
end;

procedure TfrmCadContAcoes.dbVlrSldRecExit(Sender: TObject);
begin
   inherited;
   if qryDetalhePUSLDCONTACOES.AsFloat = 0 then
   begin
      qryDetalhePUSLDCONTACOES.AsFloat := OperComum.DivValorZero(dbVlrSldRec.Value, dbQtdSldRec.Value);
      dbPUSldRec.Text := FormatFloat('###,###,##0.0000000000', qryDetalhePUSLDCONTACOES.AsFloat);
   end;
end;

procedure TfrmCadContAcoes.dbVlrSldPagExit(Sender: TObject);
begin
   inherited;
   if qrySldPagarPUSLDCONTACOES.AsFloat = 0 then
   begin
      qrySldPagarPUSLDCONTACOES.AsFloat := OperComum.DivValorZero(dbVlrSldPag.Value, dbQtdSldPag.Value);
      dbPUSldPag.Text := FormatFloat('###,###,##0.0000000000', qrySldPagarPUSLDCONTACOES.AsFloat);
   end;
end;

function TfrmCadContAcoes.ConfirmaDetalhes: Boolean;
begin
   //AL_13
   AplicaAlteracoes([qryDetalhe, qryNaoExe, qryLiqSemAcoes, qrySldPagar, qrySldLiq]);
end;

procedure TfrmCadContAcoes.bbtnOkDetClick(Sender: TObject);
var dDataMarcar: TDateTime;
    sDataLanc: String;
    iRegDet, iRegPag, iRegHist, iResp: Integer;
    fVlrPGP, fVlrPRP: Double;
    qryTemp: TwwQuery;
begin
   try
      // AL_13
      // Força a saída do componente atual para acionar o OnExit deste componente
      //    no caso de teclar enter e o botão for default
      SelectNext(ActiveControl,True,True);

      qryTemp := nil;
      CmeDetalhe.RepetirInsert := False;
      if pgctrlDetalhe.ActivePage = tbsDet then
      begin
         sDataLanc := dbdDataSldRec.Text;
         qryDetalheFLGREPROC.AsString := 'S';
         if qryDetalhe.State = dsInsert then
         begin
            if cdsSaldoAnt.Locate('DATASLDCONTACOES', sDataLanc, []) then
            begin
               MsgDlg('Não é possível efetuar a operação, esta data já possui um saldo.', 'Mensagem do Sistema', MtWarning, [mbOk],0);
               Exit;
            end;
         end;
      end
      else if pgctrlDetalhe.ActivePage = tbsSldPag then
      begin
         sDataLanc := dbdDataSldPag.Text;
         qrySldPagarFLGREPROC.AsString := 'S';
         if qrySldPagar.State = dsInsert then
         begin
            if cdsSaldoAnt.Locate('DATASLDCONTACOES', sDataLanc, []) then
            begin
               MsgDlg('Não é possível efetuar a operação, esta data já possui um saldo.', 'Mensagem do Sistema', MtWarning, [mbOk],0);
               Exit;
            end;
         end;
      end
      else if pgctrlDetalhe.ActivePage = tbsSldLiq then
      begin
         sDataLanc := dbdDataSldLiquido.Text;
         qrySldLiqFLGREPROC.AsString := 'S';
         if qrySldLiq.State = dsInsert then
         begin
            if cdsSaldoAnt.Locate('DATAHISTCONTACOES', sDataLanc, []) then
            begin
               MsgDlg('Não é possível efetuar a operação, esta data já possui um saldo.', 'Mensagem do Sistema', MtWarning, [mbOk],0);
               Exit;
            end;
         end;
      end
      else if (pgctrlDetalhe.ActivePage = tbsLiqSemAcoes) and (qryLiqSemAcoes.State = dsInsert) then
      begin
         if cdsSaldoAnt.Locate('DATAOPERACAO', dbdtDataOperLSA.DateTime, []) then
         begin
            MsgDlg('Não é possível efetuar a operação, esta data já possui uma liquidação.', 'Mensagem do Sistema', MtWarning, [mbOk],0);
            Exit;
         end;
      end
      //AL_15
      else if (pgctrlDetalhe.ActivePage = tbsLiqComAcoes) and (qryLiqComAcoes.State = dsInsert) then
      begin
         if cdsSaldoAnt.Locate('DATAOPERACAO', dbdtDataOperLCA.DateTime, []) then
         begin
            MsgDlg('Não é possível efetuar a operação, esta data já possui uma liquidação.', 'Mensagem do Sistema', MtWarning, [mbOk],0);
            Exit;
         end;
      end
      //AL_13
      else if (pgctrlDetalhe.ActivePage = tbsNaoExe) and (qryNaoExe.State = dsInsert) then
      begin
         if qryLiqSemAcoes.Locate('DATAOPERACAO', dbdtDataOperNaoExe.DateTime, []) then
         begin
            MsgDlg('Não é possível efetuar a operação, esta data já possui uma liquidação.', 'Mensagem do Sistema', MtWarning, [mbOk],0);
            Exit;
         end;
         if cdsSaldoAnt.Locate('DATAOPERACAO', dbdtDataOperNaoExe.DateTime, []) then
         begin
            MsgDlg('Não é possível efetuar a operação, esta data já possui um Não Exercício', 'Mensagem do Sistema', MtWarning, [mbOk],0);
            Exit;
         end;
         qrySldLiq.First;
         if qrySldLiqDATAHISTCONTACOES.AsDateTime >= dbdtDataOperNaoExe.DateTime then
         begin
            MsgDlg('Não é possível efetuar a operação, existe pelo menos um saldo em data posterior', 'Mensagem do Sistema', MtWarning, [mbOk],0);
            Exit;
         end;
      end;

      if pgctrlDetalhe.ActivePage = tbsLiqSemAcoes then
      begin
         sDataLanc := dbdtDataLiqLSA.Text;
         //AL_14
         if not CtrlInvContab.TestaPeriodo(sDataLanc, 2, 6) then
         begin
            MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', MtWarning, [mbOk],0);
            Exit;
         end;

         if Trim(dblTipoOperLSA.Text) = '' then
         begin
            MsgDlg('Informe o Tipo de Operação', 'Mensagem do Sistema', MtWarning, [mbOk],0);
            if dblTipoOperLSA.CanFocus then
               dblTipoOperLSA.SetFocus;
            Exit;
         end
         else
         if Trim(dbdtDataOperLSA.Text) = '' then
         begin
            MsgDlg('Informe a data da operação', 'Mensagem do Sistema', MtWarning, [mbOk],0);
            if dbdtDataOperLSA.CanFocus then
               dbdtDataOperLSA.SetFocus;
            Exit;
         end
         else
         if Trim(dbdtDataLiqLSA.Text) = '' then
         begin
            MsgDlg('Informe a data da liquidação financeira da operação', 'Mensagem do Sistema', MtWarning, [mbOk],0);
            if dbdtDataLiqLSA.CanFocus then
               dbdtDataLiqLSA.SetFocus;
            Exit;
         end
         else
         if dbrQuantidadeLSA.Value = 0 then
         begin
            MsgDlg('Informe a quantidade da operação', 'Mensagem do Sistema', MtWarning, [mbOk],0);
            if dbrQuantidadeLSA.CanFocus then
               dbrQuantidadeLSA.SetFocus;
            Exit;
         end
         else
         if dbrValorLSA.Value = 0 then
         begin
            MsgDlg('Informe o valor da operação', 'Mensagem do Sistema', MtWarning, [mbOk],0);
            if dbrValorLSA.CanFocus then
               dbrValorLSA.SetFocus;
            Exit;
         end
         else
         if ((dbdtDataOperLSA.DateTime <= dbdIniPeriodoExe.DateTime) or
             (dbdtDataOperLSA.DateTime >= dbdFimPeriodoExe.DateTime)) and
            (qryLiqSemAcoes.State = dsInsert) then
         begin
            iResp := OperComum.InvMsgBox('A data informada não está no período de exercício do contrato.',
                                         mtConfirmation, 'Mensagem do Sistema',
                                         [mbYes,mbNo],
                                         'Continua;Cancela');
            if iResp = mrNo then
            begin
               if dbdtDataOperLSA.CanFocus then
                  dbdtDataOperLSA.SetFocus;
               Exit;
            end;
         end;
         if qryLiqSemAcoes.State = dsInsert then
         begin
            if qrySldLiq.Locate('DATAHISTCONTACOES', qryLiqSemAcoesDATAOPERACAO.AsDateTime, []) then
            begin
               MsgDlg('Não é possível efetuar a operação, esta data já possui um saldo.', 'Mensagem do Sistema', MtWarning, [mbOk],0);
               Exit;
            end;
         end;

         // ----------- Gera valor de Lucro / Prejuízo
         // Busca Saldo proporcional Anterior a Pagar
         qrySldPagar.First;
         while not qrySldPagar.Eof do
         begin
            if qrySldPagarDATASLDCONTACOES.AsDateTime < qryLiqSemAcoesDATAOPERACAO.AsDateTime then
               Break;
            qrySldPagar.Next;
         end;
         // Calcula Saldo proporcional a Pagar
         fVlrPGP := qryLiqSemAcoesQUANTIDADE.AsFloat * qrySldPagarPUSLDCONTACOES.AsFloat;
         // Busca Saldo proporcional Anterior a Receber
         qryDetalhe.First;
         while not qryDetalhe.Eof do
         begin
            if qryDetalheDATASLDCONTACOES.AsDateTime < qryLiqSemAcoesDATAOPERACAO.AsDateTime then
               Break;
            qryDetalhe.Next;
         end;
         // Calcula Saldo Liquido Proporcional
         fVlrPRP := RoundCM(qryLiqSemAcoesQUANTIDADE.AsFloat * qryDetalhePUSLDCONTACOES.AsFloat,2);

         // Calcula o Lucro/Prejuízo
         qryLiqSemAcoesVLRLUCPREJ.AsFloat := qryLiqSemAcoesVLROPERACAO.AsFloat - (fVlrPRP - fVlrPGP);

         // ----------- Gera Saldos a Pagar e a Receber
         //AL_13
         if not GeraRecPagOpe(qryLiqSemAcoesIDOPERCONTACOESAP.AsInteger, qryLiqSemAcoesIDOPERCONTACOES.AsInteger, [Li]) then
         begin
            MsgDlg('Não foi possível gerar os saldos a receber e a pagar para esta liquidação.', 'Mensagem do Sistema', MtWarning, [mbOk],0);
            Exit;
         end;

         // ----------- Gera Saldo Líquido
         if not GeraHistorico(qryLiqSemAcoesDATAOPERACAO.AsDateTime) then
         begin
            MsgDlg('Não foi possível gerar o histórico desta Liquidação.', 'Mensagem do Sistema', MtWarning, [mbOk],0);
            Exit;
         end;

         inherited;

      end
      else
      //AL_13
      if pgctrlDetalhe.ActivePage = tbsNaoExe then
      begin
         sDataLanc := dbdtDataOperNaoExe.Text;
         //AL_4
         if not CtrlInvContab.TestaPeriodo(sDataLanc, 2, 6) then
         begin
            MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', MtWarning, [mbOk],0);
            Exit;
         end;

         if Trim(dbdtDataOperNaoExe.Text) = '' then
         begin
            MsgDlg('Informe a data da operação', 'Mensagem do Sistema', MtWarning, [mbOk],0);
            if dbdtDataOperNaoExe.CanFocus then
               dbdtDataOperNaoExe.SetFocus;
            Exit;
         end;

         if qryNaoExe.State = dsInsert then
         begin
            if qrySldLiq.Locate('DATAHISTCONTACOES', qryNaoExeDATAOPERACAO.AsDateTime, []) then
            begin
               MsgDlg('Não é possível efetuar a operação, esta data já possui um saldo.', 'Mensagem do Sistema', MtWarning, [mbOk],0);
               Exit;
            end;
         end;

         // ----------- Gera valor de Lucro / Prejuízo
         // Busca Saldo proporcional Anterior a Pagar
         qrySldPagar.First;
         while not qrySldPagar.Eof do
         begin
            if qrySldPagarDATASLDCONTACOES.AsDateTime < qryNaoExeDATAOPERACAO.AsDateTime then
               Break;
            qrySldPagar.Next;
         end;
         // Calcula Saldo proporcional a Pagar
         fVlrPGP := qryNaoExeQUANTIDADE.AsFloat * qrySldPagarPUSLDCONTACOES.AsFloat;
         // Busca Saldo proporcional Anterior a Receber
         qryDetalhe.First;
         while not qryDetalhe.Eof do
         begin
            if qryDetalheDATASLDCONTACOES.AsDateTime < qryNaoExeDATAOPERACAO.AsDateTime then
               Break;
            qryDetalhe.Next;
         end;
         // Calcula Saldo Liquido Proporcional
         fVlrPRP := RoundCM(qryNaoExeQUANTIDADE.AsFloat * qryDetalhePUSLDCONTACOES.AsFloat,2);

         // Calcula o Lucro/Prejuízo
         qryNaoExeVLRLUCPREJ.AsFloat := qryNaoExeVLROPERACAO.AsFloat - (fVlrPRP - fVlrPGP);

         // ----------- Gera Saldos a Pagar e a Receber
         //AL_13
         if not GeraRecPagOpe(qryNaoExeIDOPERCONTACOESAP.AsInteger, qryNaoExeIDOPERCONTACOES.AsInteger, [NE]) then
         begin
            MsgDlg('Não foi possível gerar os saldos a receber e a pagar para este Não Exercício.', 'Mensagem do Sistema', MtWarning, [mbOk],0);
            Exit;
         end;

         // ----------- Gera Saldo Líquido
         if not GeraHistorico(qryNaoExeDATAOPERACAO.AsDateTime) then
         begin
            MsgDlg('Não foi possível gerar o histórico deste Não Exercício.', 'Mensagem do Sistema', MtWarning, [mbOk],0);
            Exit;
         end;

         inherited;

      end
      //AL_15
      else if pgctrlDetalhe.ActivePage = tbsLiqComAcoes then
      begin
         sDataLanc := dbdtDataLiqLCA.Text;
         //AL_14
         if not CtrlInvContab.TestaPeriodo(sDataLanc, 2, 6) then
         begin
            MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', MtWarning, [mbOk],0);
            Exit;
         end;
         // Verifica os campos informados
         if Trim(dblTipoOperLCA.Text) = '' then
         begin
            MsgDlg('Informe o Tipo de Operação', 'Mensagem do Sistema', MtWarning, [mbOk],0);
            if dblTipoOperLCA.CanFocus then
               dblTipoOperLCA.SetFocus;
            Exit;
         end
         else
         if Trim(dbdtDataOperLCA.Text) = '' then
         begin
            MsgDlg('Informe a data da operação', 'Mensagem do Sistema', MtWarning, [mbOk],0);
            if dbdtDataOperLCA.CanFocus then
               dbdtDataOperLCA.SetFocus;
            Exit;
         end
         else
         if Trim(dbdtDataLiqLCA.Text) = '' then
         begin
            MsgDlg('Informe a data da liquidação financeira da operação', 'Mensagem do Sistema', MtWarning, [mbOk],0);
            if dbdtDataLiqLCA.CanFocus then
               dbdtDataLiqLCA.SetFocus;
            Exit;
         end
         else
         if dbrQuantidadeLCA.Value = 0 then
         begin
            MsgDlg('Informe a quantidade da operação', 'Mensagem do Sistema', MtWarning, [mbOk],0);
            if dbrQuantidadeLCA.CanFocus then
               dbrQuantidadeLCA.SetFocus;
            Exit;
         end
         else
         if dbrValorLCA.Value = 0 then
         begin
            MsgDlg('Informe o valor da operação', 'Mensagem do Sistema', MtWarning, [mbOk],0);
            if dbrValorLCA.CanFocus then
               dbrValorLCA.SetFocus;
            Exit;
         end
         else
         if ((dbdtDataOperLCA.DateTime <= dbdIniPeriodoExe.DateTime) or
             (dbdtDataOperLCA.DateTime >= dbdFimPeriodoExe.DateTime)) and
            (qryLiqComAcoes.State = dsInsert) then
         begin
            iResp := OperComum.InvMsgBox('A data informada não está no período de exercício do contrato.',
                                         mtConfirmation, 'Mensagem do Sistema',
                                         [mbYes,mbNo],
                                         'Continua;Cancela');
            if iResp = mrNo then
            begin
               if dbdtDataOperLCA.CanFocus then
                  dbdtDataOperLCA.SetFocus;
               Exit;
            end;
         end;
         if qryLiqComAcoes.State = dsInsert then
         begin
            if qrySldLiq.Locate('DATAHISTCONTACOES', qryLiqComAcoesDATAOPERACAO.AsDateTime, []) then
            begin
               MsgDlg('Não é possível efetuar a operação, esta data já possui um saldo.', 'Mensagem do Sistema', MtWarning, [mbOk],0);
               Exit;
            end;
         end;
         // ----------- Gera valor de Lucro / Prejuízo
         // Busca Saldo proporcional Anterior a Pagar
         qrySldPagar.First;
         while not qrySldPagar.Eof do
         begin
            if qrySldPagarDATASLDCONTACOES.AsDateTime < qryLiqComAcoesDATAOPERACAO.AsDateTime then
               Break;
            qrySldPagar.Next;
         end;
         // Calcula Saldo proporcional a Pagar
         fVlrPGP := qryLiqComAcoesQUANTIDADE.AsFloat * qrySldPagarPUSLDCONTACOES.AsFloat;
         // Busca Saldo proporcional Anterior a Receber
         qryDetalhe.First;
         while not qryDetalhe.Eof do
         begin
            if qryDetalheDATASLDCONTACOES.AsDateTime < qryLiqComAcoesDATAOPERACAO.AsDateTime then
               Break;
            qryDetalhe.Next;
         end;
         // Calcula Saldo Liquido Proporcional
         fVlrPRP := RoundCM(qryLiqComAcoesQUANTIDADE.AsFloat * qryDetalhePUSLDCONTACOES.AsFloat,2);

         // Calcula o Lucro/Prejuízo
         qryLiqComAcoesVLRLUCPREJ.AsFloat := qryLiqComAcoesVLROPERACAO.AsFloat - (fVlrPRP - fVlrPGP);

         // ----------- Gera Saldos a Pagar e a Receber
         //AL_13
         if not GeraRecPagOpe(qryLiqComAcoesIDOPERCONTACOESAP.AsInteger, qryLiqComAcoesIDOPERCONTACOES.AsInteger, [La]) then
         begin
            MsgDlg('Não foi possível gerar os saldos a receber e a pagar para esta liquidação.', 'Mensagem do Sistema', MtWarning, [mbOk],0);
            Exit;
         end;

         // ----------- Gera Saldo Líquido
         if not GeraHistorico(qryLiqComAcoesDATAOPERACAO.AsDateTime) then
         begin
            MsgDlg('Não foi possível gerar o histórico desta Liquidação.', 'Mensagem do Sistema', MtWarning, [mbOk],0);
            Exit;
         end;

         inherited;

      end
      else
      begin
         qryTemp := TwwQuery.Create(Self);
         qryTemp.DatabaseName := 'BaseDados';
         // Monta o Histórico
         qryTemp.SQL.Clear;
         qryTemp.SQL.Add('SELECT FLGGERACONTAB, FLGGERACAPCAR');
         qryTemp.SQL.Add('FROM TIPOOPERACAO');
         qryTemp.SQL.Add('WHERE IDTIPOOPERACAO = -132');
         qryTemp.Open;

         //AL_14
         if (((qryTemp.FieldByName('FLGGERACONTAB').AsInteger > 0) or
              (qryTemp.FieldByName('FLGGERACAPCAR').AsInteger > 0)) and
             (not CtrlInvContab.TestaPeriodo(sDataLanc, 2, 6))) then
         begin
            MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', MtWarning, [mbOk],0);
            Exit;
         end
         else
         if not GeraHistorico(StrToDate(sDataLanc)) then
         begin
            MsgDlg('Não foi possível gerar o histórico do dia ' + sDataLanc, 'Mensagem do Sistema', MtWarning, [mbOk],0);
            Exit;
         end
         else
           inherited;
      end;
   finally
      if qryTemp <> nil then
         FreeAndNil(qryTemp);
   end;

end;

procedure TfrmCadContAcoes.CmeDetalheAtualizaBotoes(Sender: TObject);
begin
   inherited;
   // AL_13
   if qryNaoExe.IsEmpty then
   begin
      if pgctrlDetalhe.ActivePage = tbsSldLiq then
      begin
        sbtnInsDet.Enabled := False;
        sbtnAltDet.Enabled := False;
        sbtnExcluiDet.Enabled := False;
      end
      else
      if pgctrlDetalhe.ActivePage = tbsNaoExe then
        sbtnAltDet.Enabled := False;

      if qryAtual.State in [dsInsert, dsEdit] then
      begin
         bbtnOkDet.Default := True;
         bbtnCancelarDet.Cancel := True;
      end
      else
      begin
         bbtnConfirmar.Default := True;
         bbtnCancelar.Cancel := True;
      end;
      tbsDadosPrinc.Enabled := True;
      tbsObservacao.Enabled := True;
   end
   else
   begin
      sbtnInsDet.Enabled := False;
      sbtnAltDet.Enabled := False;
      if pgctrlDetalhe.ActivePage <> tbsNaoExe then
         sbtnExcluiDet.Enabled := False;
      //AL_15
      sbtnInsOperRV.Enabled := False;
      sbtnAltOperRV.Enabled := False;
      sbtnExcluiOperRV.Enabled := False;

      if qryAtual.State in [dsInsert, dsEdit] then
      begin
         bbtnOkDet.Default := True;
         bbtnCancelarDet.Cancel := True;
      end
      else
      begin
         bbtnConfirmar.Default := True;
         bbtnCancelar.Cancel := True;
      end;

      tbsDadosPrinc.Enabled := False;
      tbsObservacao.Enabled := False;
   end;
end;

procedure TfrmCadContAcoes.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   qryIDOPERCONTACOES.AsInteger := LeUltRegistro(nil,'OPERCONTACOES');
   //al_15
   qryIDOPERCONTACOESAP.AsInteger := qryIDOPERCONTACOES.AsInteger;
end;

// AL_2
function TfrmCadContAcoes.CalcValoresCont: Double;
begin
   if qryQUANTIDADE.AsFloat <> 0 then
   begin
      if qryVLROPERACAO.AsFloat = 0 then
      begin
         qryVLROPERACAO.AsFloat := dbrQtd.Value * dbrPU.Value;
         dbrVlr.Text := FormatFloat('###,###,###,###,##0.00', qryVLROPERACAO.AsFloat);
      end;
      if qryPUOPERACAO.AsFloat = 0 then
      begin
         qryPUOPERACAO.AsFloat := Opercomum.DivValorZero(dbrVlr.Value, dbrQtd.Value);
         dbrPU.Text := FormatFloat('###,###,##0.0########', qryPUOPERACAO.AsFloat);
      end;
   end;
end;

procedure TfrmCadContAcoes.dbrPUEnter(Sender: TObject);
begin
   inherited;
   // AL_2
   CalcValoresCont;
end;

procedure TfrmCadContAcoes.dbrPUExit(Sender: TObject);
begin
   inherited;
   // AL_2
   CalcValoresCont;
end;

procedure TfrmCadContAcoes.dbrVlrEnter(Sender: TObject);
begin
  inherited;
   // AL_2
   CalcValoresCont;
end;

procedure TfrmCadContAcoes.dbrVlrExit(Sender: TObject);
begin
   inherited;
   // AL_2
   CalcValoresCont;
end;

// AL_10
function TfrmCadContAcoes.CalculaVenc: Boolean;
begin
   if qryLiqSemAcoes.State in [dsInsert, dsEdit] then
   begin
      // Se a data da operação e o tipo de operação estiverem preenchidos, calcula o vencimento pelo tipo de operação
      if (Trim(dbdtDataOperLSA.Text) <> '') and (Trim(dblTipoOperLSA.Text) <> '') then
         qryLiqSemAcoesDATALIQUIDACAO.AsDateTime := DiasUteisInv.SomaDiasUteis(dbdtDataOperLSA.DateTime,
                                                               qryTpOperLiqSemAcoesVENCIMENTO.AsInteger,-1,1,'',True,False,False)
      else
         qryLiqSemAcoesDATALIQUIDACAO.AsDateTime := qryLiqSemAcoesDATAOPERACAO.AsDateTime;

      // Aplica o valor do Text no DateTime e no TField
      dbdtDataLiqLSA.RefreshText;
   end
   // AL_13
   else
   if qryNaoExe.State in [dsInsert, dsEdit] then
   begin
      // Se a data da operação e o tipo de operação estiverem preenchidos, calcula o vencimento pelo tipo de operação
      if (Trim(dbdtDataOperNaoExe.Text) <> '') then
         qryNaoExeDATALIQUIDACAO.AsDateTime := DiasUteisInv.SomaDiasUteis(dbdtDataOperNaoExe.DateTime,
                                                               qryTpOperNaoExe.FieldByName('VENCIMENTO').AsInteger,-1,1,'',True,False,False)
      else
         qryNaoExeDATALIQUIDACAO.AsDateTime := qryNaoExeDATAOPERACAO.AsDateTime;
   end
   //AL_15
   else if qryLiqComAcoes.State in [dsInsert, dsEdit] then
   begin
      // Se a data da operação e o tipo de operação estiverem preenchidos, calcula o vencimento pelo tipo de operação
      if (Trim(dbdtDataOperLCA.Text) <> '') and (Trim(dblTipoOperLCA.Text) <> '') then
         qryLiqComAcoesDATALIQUIDACAO.AsDateTime := DiasUteisInv.SomaDiasUteis(dbdtDataOperLCA.DateTime,
                                                                               qryTpOperLiqComAcoesVENCIMENTO.AsInteger,-1,1,'',True,False,False)
      else
         qryLiqComAcoesDATALIQUIDACAO.AsDateTime := qryLiqComAcoesDATAOPERACAO.AsDateTime;

      // Aplica o valor do Text no DateTime e no TField
      dbdtDataLiqLSA.RefreshText;
   end;

end;

// AL_10
procedure TfrmCadContAcoes.dbdtDataOperLSAExit(Sender: TObject);
begin
  inherited;
  CalculaVenc;
  BuscaSaldo(dbdtDataOperLSA.DateTime);
end;

// AL_10
procedure TfrmCadContAcoes.dblTipoOperLSAExit(Sender: TObject);
begin
  inherited;
  CalculaVenc;
  BuscaSaldo(dbdtDataOperLSA.DateTime);
end;

// AL_10
procedure TfrmCadContAcoes.dbdtDataLiqLSAEnter(Sender: TObject);
begin
   inherited;
   if Trim(dbdtDataLiqLSA.Text) = '' then
      CalculaVenc;
end;

// AL_10
procedure TfrmCadContAcoes.dbdtDataLiqLSAExit(Sender: TObject);
begin
   inherited;
   if Trim(dbdtDataLiqLSA.Text) = '' then
      CalculaVenc;
   BuscaSaldo(dbdtDataOperLSA.DateTime);
end;

// AL_10
procedure TfrmCadContAcoes.dbrQuantidadeLSAEnter(Sender: TObject);
begin
  inherited;
  fQtdAntes := dbrQuantidadeLSA.Value;
end;

// AL_10
procedure TfrmCadContAcoes.dbrQuantidadeLSAExit(Sender: TObject);
begin
  inherited;
  if dbrQuantidadeLSA.Value <> fQtdAntes then
     qryLiqSemAcoes.FieldByName('VLROPERACAO').AsFloat := qryLiqSemAcoes.FieldByName('VLROPERACAO').AsFloat * OperComum.DivValorZero(dbrQuantidadeLSA.Value, fQtdAntes);
  BuscaSaldo(dbdtDataOperLSA.DateTime);
end;

// AL_10
procedure TfrmCadContAcoes.dbrValorLSAExit(Sender: TObject);
begin
   inherited;
   BuscaSaldo(dbdtDataOperLSA.DateTime);
end;

// AL_10
function TfrmCadContAcoes.GeraRecPagOpe(iContrato, iOper: Integer; sTipoOper: TTipoOper): Boolean;
var fPuAnt, fQtdAnt: Double;
begin
   // AL_13
   try
      qryDetalhe.DisableControls;
      qrySldPagar.DisableControls;
      try
         if sTipoOper = [Li] then  // Li = Liq. de Acoes Sem Acoes
         begin
            // Se não for Inclusão nem Alteração, procura a operação de liquidação
            if not (qryLiqSemAcoes.State in [dsInsert, dsEdit]) then
               qryLiqSemAcoes.Locate('IDOPERCONTACOESAP;IDOPERCONTACOES', VarArrayOf([iContrato, iOper]) , []);

            // Inclui o Saldo a Receber
            qryDetalhe.First;
            while not qryDetalhe.Eof do
            begin
               if qryDetalheDATASLDCONTACOES.AsDateTime < qryLiqSemAcoesDATAOPERACAO.AsDateTime then
                  Break;
               qryDetalhe.Next;
            end;
            fPuAnt := qryDetalhePUSLDCONTACOES.AsFloat;
            fQtdAnt := qryDetalheQTDSLDCONTACOES.AsFloat;
            if qryDetalhe.Locate('IDOPERCONTACOES', qryLiqSemAcoesIDOPERCONTACOES.AsInteger, []) then
               qryDetalhe.Edit
            else
               qryDetalhe.Insert;
            qryDetalheIDSALDOSCONTACOES.AsInteger := LeUltRegistro(nil,'SALDOSCONTACOES');
            qryDetalheIDOPERCONTACOES.AsInteger := qryLiqSemAcoesIDOPERCONTACOES.AsInteger;
            qryDetalheIDOPERCONTACOESAP.AsInteger := qryLiqSemAcoesIDOPERCONTACOESAP.AsInteger;
            qryDetalheTIPOSALDO.AsString := 'R';
            qryDetalheDATASLDCONTACOES.AsDateTime := qryLiqSemAcoesDATAOPERACAO.AsDateTime;
            qryDetalheQTDSLDCONTACOES.AsFloat := fQtdAnt - qryLiqSemAcoesQUANTIDADE.AsFloat;
            qryDetalheVLRSLDCONTACOES.AsFloat := RoundCM(qryDetalheQTDSLDCONTACOES.AsFloat * fPuAnt,2);
            qryDetalhePUSLDCONTACOES.AsFloat := fPuAnt;
            qryDetalheOBSERVACAO.AsString := 'Liquidação de ' + dblContraParte.Text + '-' + dbdDtContrato.Text;
            qryDetalheIDPLANPREVCTBPATR.AsInteger := qryLiqSemAcoesIDPLANPREVCTBPATR.AsInteger;
            qryDetalheFLGREPROC.AsString := 'S';
            qryDetalhe.Post;

            // Inclui o Saldo a Pagar
            qrySldPagar.First;
            while not qrySldPagar.Eof do
            begin
               if qrySldPagarDATASLDCONTACOES.AsDateTime < qryLiqSemAcoesDATAOPERACAO.AsDateTime then
                  Break;
               qrySldPagar.Next;
            end;
            fPuAnt := qrySldPagarPUSLDCONTACOES.AsFloat;
            fQtdAnt := qrySldPagarQTDSLDCONTACOES.AsFloat;
            if qrySldPagar.Locate('IDOPERCONTACOES', qryLiqSemAcoesIDOPERCONTACOES.AsInteger, []) then
               qrySldPagar.Edit
            else
               qrySldPagar.Insert;
            qrySldPagarIDSALDOSCONTACOES.AsInteger := LeUltRegistro(nil,'SALDOSCONTACOES');
            qrySldPagarIDOPERCONTACOES.AsInteger := qryLiqSemAcoesIDOPERCONTACOES.AsInteger;
            qrySldPagarIDOPERCONTACOESAP.AsInteger := qryLiqSemAcoesIDOPERCONTACOESAP.AsInteger;
            qrySldPagarTIPOSALDO.AsString := 'P';
            qrySldPagarDATASLDCONTACOES.AsDateTime := qryLiqSemAcoesDATAOPERACAO.AsDateTime;
            qrySldPagarQTDSLDCONTACOES.AsFloat := fQtdAnt - qryLiqSemAcoesQUANTIDADE.AsFloat;
            qrySldPagarVLRSLDCONTACOES.AsFloat := RoundCM(qryDetalheQTDSLDCONTACOES.AsFloat * fPuAnt,2);
            qrySldPagarPUSLDCONTACOES.AsFloat := fPuAnt;
            qrySldPagarOBSERVACAO.AsString := 'Liquidação de ' + dblContraParte.Text + '-' + dbdDtContrato.Text;
            qrySldPagarIDPLANPREVCTBPATR.AsInteger := qryLiqSemAcoesIDPLANPREVCTBPATR.AsInteger;
            qrySldPagarFLGREPROC.AsString := 'S';
            qrySldPagar.Post;

            Result := True;
         end
         //AL_15
         else if sTipoOper = [La] then  // La = Liq. Acoes Com Acoes
         begin
            // Se não for Inclusão nem Alteração, procura a operação de liquidação
            if not (qryLiqComAcoes.State in [dsInsert, dsEdit]) then
               qryLiqComAcoes.Locate('IDOPERCONTACOESAP;IDOPERCONTACOES', VarArrayOf([iContrato, iOper]) , []);

            // Inclui o Saldo a Receber
            qryDetalhe.First;
            while not qryDetalhe.Eof do
            begin
               if qryDetalheDATASLDCONTACOES.AsDateTime < qryLiqComAcoesDATAOPERACAO.AsDateTime then
                  Break;
               qryDetalhe.Next;
            end;
            fPuAnt := qryDetalhePUSLDCONTACOES.AsFloat;
            fQtdAnt := qryDetalheQTDSLDCONTACOES.AsFloat;
            if qryDetalhe.Locate('IDOPERCONTACOES', qryLiqComAcoesIDOPERCONTACOES.AsInteger, []) then
               qryDetalhe.Edit
            else
               qryDetalhe.Insert;
            qryDetalheIDSALDOSCONTACOES.AsInteger := LeUltRegistro(nil,'SALDOSCONTACOES');
            qryDetalheIDOPERCONTACOES.AsInteger := qryLiqComAcoesIDOPERCONTACOES.AsInteger;
            qryDetalheIDOPERCONTACOESAP.AsInteger := qryLiqComAcoesIDOPERCONTACOESAP.AsInteger;
            qryDetalheTIPOSALDO.AsString := 'R';
            qryDetalheDATASLDCONTACOES.AsDateTime := qryLiqComAcoesDATAOPERACAO.AsDateTime;
            qryDetalheQTDSLDCONTACOES.AsFloat := fQtdAnt - qryLiqComAcoesQUANTIDADE.AsFloat;
            qryDetalheVLRSLDCONTACOES.AsFloat := RoundCM(qryDetalheQTDSLDCONTACOES.AsFloat * fPuAnt,2);
            qryDetalhePUSLDCONTACOES.AsFloat := fPuAnt;
            qryDetalheOBSERVACAO.AsString := 'Liquidação de ' + dblContraParte.Text + '-' + dbdDtContrato.Text;
            qryDetalheIDPLANPREVCTBPATR.AsInteger := qryLiqComAcoesIDPLANPREVCTBPATR.AsInteger;
            qryDetalheFLGREPROC.AsString := 'S';
            qryDetalhe.Post;

            // Inclui o Saldo a Pagar
            qrySldPagar.First;
            while not qrySldPagar.Eof do
            begin
               if qrySldPagarDATASLDCONTACOES.AsDateTime < qryLiqComAcoesDATAOPERACAO.AsDateTime then
                  Break;
               qrySldPagar.Next;
            end;
            fPuAnt := qrySldPagarPUSLDCONTACOES.AsFloat;
            fQtdAnt := qrySldPagarQTDSLDCONTACOES.AsFloat;
            if qrySldPagar.Locate('IDOPERCONTACOES', qryLiqComAcoesIDOPERCONTACOES.AsInteger, []) then
               qrySldPagar.Edit
            else
               qrySldPagar.Insert;
            qrySldPagarIDSALDOSCONTACOES.AsInteger := LeUltRegistro(nil,'SALDOSCONTACOES');
            qrySldPagarIDOPERCONTACOES.AsInteger := qryLiqComAcoesIDOPERCONTACOES.AsInteger;
            qrySldPagarIDOPERCONTACOESAP.AsInteger := qryLiqComAcoesIDOPERCONTACOESAP.AsInteger;
            qrySldPagarTIPOSALDO.AsString := 'P';
            qrySldPagarDATASLDCONTACOES.AsDateTime := qryLiqComAcoesDATAOPERACAO.AsDateTime;
            qrySldPagarQTDSLDCONTACOES.AsFloat := fQtdAnt - qryLiqComAcoesQUANTIDADE.AsFloat;
            qrySldPagarVLRSLDCONTACOES.AsFloat := RoundCM(qryDetalheQTDSLDCONTACOES.AsFloat * fPuAnt,2);
            qrySldPagarPUSLDCONTACOES.AsFloat := fPuAnt;
            qrySldPagarOBSERVACAO.AsString := 'Liquidação de ' + dblContraParte.Text + '-' + dbdDtContrato.Text;
            qrySldPagarIDPLANPREVCTBPATR.AsInteger := qryLiqComAcoesIDPLANPREVCTBPATR.AsInteger;
            qrySldPagarFLGREPROC.AsString := 'S';
            qrySldPagar.Post;

            Result := True;
         end
         else
         if sTipoOper = [NE] then   // NE = Nenhum,
         begin
            // Se não for Inclusão nem Alteração, procura a operação de liquidação
            if not (qryNaoExe.State in [dsInsert, dsEdit]) then
               qryNaoExe.Locate('IDOPERCONTACOESAP;IDOPERCONTACOES', VarArrayOf([iContrato, iOper]) , []);

            // Inclui o Saldo a Receber
            qryDetalhe.First;
            while not qryDetalhe.Eof do
            begin
               if qryDetalheDATASLDCONTACOES.AsDateTime < qryNaoExeDATAOPERACAO.AsDateTime then
                  Break;
               qryDetalhe.Next;
            end;
            fPuAnt := qryDetalhePUSLDCONTACOES.AsFloat;
            fQtdAnt := qryDetalheQTDSLDCONTACOES.AsFloat;
            if qryDetalhe.Locate('IDOPERCONTACOES', qryNaoExeIDOPERCONTACOES.AsInteger, []) then
               qryDetalhe.Edit
            else
               qryDetalhe.Insert;
            qryDetalheIDSALDOSCONTACOES.AsInteger := LeUltRegistro(nil,'SALDOSCONTACOES');
            qryDetalheIDOPERCONTACOES.AsInteger := qryNaoExeIDOPERCONTACOES.AsInteger;
            qryDetalheIDOPERCONTACOESAP.AsInteger := qryNaoExeIDOPERCONTACOESAP.AsInteger;
            qryDetalheTIPOSALDO.AsString := 'R';
            qryDetalheDATASLDCONTACOES.AsDateTime := qryNaoExeDATAOPERACAO.AsDateTime;
            qryDetalheQTDSLDCONTACOES.AsFloat := fQtdAnt - qryNaoExeQUANTIDADE.AsFloat;
            qryDetalheVLRSLDCONTACOES.AsFloat := RoundCM(qryDetalheQTDSLDCONTACOES.AsFloat * fPuAnt,2);
            qryDetalhePUSLDCONTACOES.AsFloat := fPuAnt;
            qryDetalheOBSERVACAO.AsString := 'Não Exercício de ' + dblContraParte.Text + '-' + dbdDtContrato.Text;
            qryDetalheIDPLANPREVCTBPATR.AsInteger := qryNaoExeIDPLANPREVCTBPATR.AsInteger;
            qryDetalheFLGREPROC.AsString := 'S';
            qryDetalhe.Post;

            // Inclui o Saldo a Pagar
            qrySldPagar.First;
            while not qrySldPagar.Eof do
            begin
               if qrySldPagarDATASLDCONTACOES.AsDateTime < qryNaoExeDATAOPERACAO.AsDateTime then
                  Break;
               qrySldPagar.Next;
            end;
            fPuAnt := qrySldPagarPUSLDCONTACOES.AsFloat;
            fQtdAnt := qrySldPagarQTDSLDCONTACOES.AsFloat;
            if qrySldPagar.Locate('IDOPERCONTACOES', qryNaoExeIDOPERCONTACOES.AsInteger, []) then
               qrySldPagar.Edit
            else
               qrySldPagar.Insert;
            qrySldPagarIDSALDOSCONTACOES.AsInteger := LeUltRegistro(nil,'SALDOSCONTACOES');
            qrySldPagarIDOPERCONTACOES.AsInteger := qryNaoExeIDOPERCONTACOES.AsInteger;
            qrySldPagarIDOPERCONTACOESAP.AsInteger := qryNaoExeIDOPERCONTACOESAP.AsInteger;
            qrySldPagarTIPOSALDO.AsString := 'P';
            qrySldPagarDATASLDCONTACOES.AsDateTime := qryNaoExeDATAOPERACAO.AsDateTime;
            qrySldPagarQTDSLDCONTACOES.AsFloat := fQtdAnt - qryNaoExeQUANTIDADE.AsFloat;
            qrySldPagarVLRSLDCONTACOES.AsFloat := RoundCM(qryDetalheQTDSLDCONTACOES.AsFloat * fPuAnt,2);
            qrySldPagarPUSLDCONTACOES.AsFloat := fPuAnt;
            qrySldPagarOBSERVACAO.AsString := 'Não Exercício de ' + dblContraParte.Text + '-' + dbdDtContrato.Text;
            qrySldPagarIDPLANPREVCTBPATR.AsInteger := qryNaoExeIDPLANPREVCTBPATR.AsInteger;
            qrySldPagarFLGREPROC.AsString := 'S';
            qrySldPagar.Post;

            Result := True;
         end;
      except
         Result := False;
      end;
   finally
      qryDetalhe.EnableControls;
      qrySldPagar.EnableControls;
   end;
end;

procedure TfrmCadContAcoes.sbtnExcluiDetClick(Sender: TObject);
var iPlano, iPlanilha, iDocumento: Integer;
    dDataOper: TDateTime;
begin
   //AL_10
   //AL_13
   if pgctrlDetalhe.ActivePage = tbsLiqSemAcoes then
   begin
      try
         //AL_14
         if not CtrlInvContab.TestaPeriodo(DateToStr(qrySldLiqDATAHISTCONTACOES.AsDateTime), 2, 6) then
            Raise Exception.Create(CtrlInvContab.MessageInfo);

         if qryDetalhe.Locate('IDOPERCONTACOES', qryLiqSemAcoesIDOPERCONTACOES.AsInteger, []) then
            qryDetalhe.Delete;
         if qrySldPagar.Locate('IDOPERCONTACOES', qryLiqSemAcoesIDOPERCONTACOES.AsInteger, []) then
            qrySldPagar.Delete;
         if qrySldLiq.Locate('IDOPERCONTACOES', qryLiqSemAcoesIDOPERCONTACOES.AsInteger, []) then
         begin
            if not qrySldLiqPLNCODIGO.IsNull then
            begin
               if not OperComum.ProcExclui(-1,
                                           OperComum.IIF(qrySldLiqPLNCODIGO.AsInteger = 0, -1, qrySldLiqPLNCODIGO.AsInteger),
                                           OperComum.IIF(qrySldLiqPLANO.AsInteger = 0, -1, qrySldLiqPLANO.AsInteger),
                                           -1, qrySldLiqDATAHISTCONTACOES.AsDateTime, False) then
                  Raise Exception.Create('Não foi possível limpar os lançamentos contabeis de saldo liquido de ' + qrySldLiqDATAHISTCONTACOES.AsString);
            end;
            qrySldLiq.Delete;
         end;

         iPlano     := -1;
         iPlanilha  := -1;
         iDocumento := -1;
         if (not qryLiqSemAcoesCODDOCUMENTO.IsNull) or (not qryLiqSemAcoesPLNCODIGO.IsNull) then
         begin
            iPlano     := qryLiqSemAcoesPLANO.AsInteger;
            iPlanilha  := qryLiqSemAcoesPLNCODIGO.AsInteger;
            iDocumento := qryLiqSemAcoesCODDOCUMENTO.AsInteger;
            dDataOper  := qryLiqSemAcoesDATAOPERACAO.AsDateTime;
         end;

         inherited;

         // Baixa as alterações para o Banco, pois a ordem de exclusão é
         //     diferente da ordem da inclusão ou alteração
         qrySldLiq.ApplyUpdates;
         qryDetalhe.ApplyUpdates;
         qrySldPagar.ApplyUpdates;
         qryLiqSemAcoes.ApplyUpdates;

         if not OperComum.ProcExclui(iDocumento, iPlanilha, iPlano, -1, dDataOper, False) then
            Raise Exception.Create('Não foi possível limpar os lançamentos contabeis da liquidação');

         qrySldLiq.CommitUpdates;
         qryDetalhe.CommitUpdates;
         qrySldPagar.CommitUpdates;
         qryLiqSemAcoes.CommitUpdates;
         
      except
         on E: Exception do
         begin
            MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
            bbtnCancelarClick(Self);
         end;
      end;
   end
   else
   if pgctrlDetalhe.ActivePage = tbsNaoExe then
   begin
      try
         //AL_14
         if not CtrlInvContab.TestaPeriodo(DateToStr(qrySldLiqDATAHISTCONTACOES.AsDateTime), 2, 6) then
            Raise Exception.Create(CtrlInvContab.MessageInfo);

         if qryDetalhe.Locate('IDOPERCONTACOES', qryNaoExeIDOPERCONTACOES.AsInteger, []) then
            qryDetalhe.Delete;
         if qrySldPagar.Locate('IDOPERCONTACOES', qryNaoExeIDOPERCONTACOES.AsInteger, []) then
            qrySldPagar.Delete;
         if qrySldLiq.Locate('IDOPERCONTACOES', qryNaoExeIDOPERCONTACOES.AsInteger, []) then
         begin
            if not qrySldLiqPLNCODIGO.IsNull then
            begin
               if not OperComum.ProcExclui(-1,
                                           OperComum.IIF(qrySldLiqPLNCODIGO.AsInteger = 0, -1, qrySldLiqPLNCODIGO.AsInteger),
                                           OperComum.IIF(qrySldLiqPLANO.AsInteger = 0, -1, qrySldLiqPLANO.AsInteger),
                                           -1, qrySldLiqDATAHISTCONTACOES.AsDateTime, False) then
                  Raise Exception.Create('Não foi possível limpar os lançamentos contabeis de saldo liquido de ' + qrySldLiqDATAHISTCONTACOES.AsString);
            end;
            qrySldLiq.Delete;
         end;

         iPlano     := -1;
         iPlanilha  := -1;
         iDocumento := -1;
         if (not qryNaoExeCODDOCUMENTO.IsNull) or (not qryNaoExePLNCODIGO.IsNull) then
         begin
            iPlano     := qryNaoExePLANO.AsInteger;
            iPlanilha  := qryNaoExePLNCODIGO.AsInteger;
            iDocumento := qryNaoExeCODDOCUMENTO.AsInteger;
            dDataOper  := qryNaoExeDATAOPERACAO.AsDateTime;
         end;

         inherited;

         // Baixa as alterações para o Banco, pois a ordem de exclusão é
         //     diferente da ordem da inclusão ou alteração
         qrySldLiq.ApplyUpdates;
         qryDetalhe.ApplyUpdates;
         qrySldPagar.ApplyUpdates;
         qryNaoExe.ApplyUpdates;

         if not OperComum.ProcExclui(iDocumento, iPlanilha, iPlano, -1, dDataOper, False) then
            Raise Exception.Create('Não foi possível limpar os lançamentos contabeis da liquidação');

         qrySldLiq.CommitUpdates;
         qryDetalhe.CommitUpdates;
         qrySldPagar.CommitUpdates;
         qryNaoExe.CommitUpdates;

      except
         on E: Exception do
         begin
            MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
            bbtnCancelarClick(Self);
         end;
      end;
   end
   //AL_15
   else if pgctrlDetalhe.ActivePage = tbsLiqComAcoes then
   begin
      try
         //AL_14
         if not CtrlInvContab.TestaPeriodo(DateToStr(qrySldLiqDATAHISTCONTACOES.AsDateTime), 2, 6) then
            Raise Exception.Create(CtrlInvContab.MessageInfo);

         if qryDetalhe.Locate('IDOPERCONTACOES', qryLiqComAcoesIDOPERCONTACOES.AsInteger, []) then
            qryDetalhe.Delete;
         if qrySldPagar.Locate('IDOPERCONTACOES', qryLiqComAcoesIDOPERCONTACOES.AsInteger, []) then
            qrySldPagar.Delete;
         if qrySldLiq.Locate('IDOPERCONTACOES', qryLiqComAcoesIDOPERCONTACOES.AsInteger, []) then
         begin
            if not qrySldLiqPLNCODIGO.IsNull then
            begin
               if not OperComum.ProcExclui(-1,
                                           OperComum.IIF(qrySldLiqPLNCODIGO.AsInteger = 0, -1, qrySldLiqPLNCODIGO.AsInteger),
                                           OperComum.IIF(qrySldLiqPLANO.AsInteger = 0, -1, qrySldLiqPLANO.AsInteger),
                                           -1, qrySldLiqDATAHISTCONTACOES.AsDateTime, False) then
                  Raise Exception.Create('Não foi possível limpar os lançamentos contabeis de saldo liquido de ' + qrySldLiqDATAHISTCONTACOES.AsString);
            end;
            qrySldLiq.Delete;
         end;

         iPlano     := -1;
         iPlanilha  := -1;
         iDocumento := -1;
         if (not qryLiqComAcoesCODDOCUMENTO.IsNull) or (not qryLiqComAcoesPLNCODIGO.IsNull) then
         begin
            iPlano     := qryLiqComAcoesPLANO.AsInteger;
            iPlanilha  := qryLiqComAcoesPLNCODIGO.AsInteger;
            iDocumento := qryLiqComAcoesCODDOCUMENTO.AsInteger;
            dDataOper  := qryLiqComAcoesDATAOPERACAO.AsDateTime;
         end;

         inherited;

         // Baixa as alterações para o Banco, pois a ordem de exclusão é
         //     diferente da ordem da inclusão ou alteração
         qrySldLiq.ApplyUpdates;
         qryDetalhe.ApplyUpdates;
         qrySldPagar.ApplyUpdates;
         qryLiqComAcoes.ApplyUpdates;

         if not OperComum.ProcExclui(iDocumento, iPlanilha, iPlano, -1, dDataOper, False) then
            Raise Exception.Create('Não foi possível limpar os lançamentos contabeis da liquidação');

         qrySldLiq.CommitUpdates;
         qryDetalhe.CommitUpdates;
         qrySldPagar.CommitUpdates;
         qryLiqComAcoes.CommitUpdates;
      except
         on E: Exception do
         begin
            MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
            bbtnCancelarClick(Self);
         end;
      end;
   end
   else
      inherited;

end;

// AL_10
function TfrmCadContAcoes.CarregaCDS: Boolean;
var iRec, iCount, iHist: Integer;
begin
   //AL_13
   try
      Result := False;
      iCount := 0;
      qryDetalhe.DisableControls;
      qrySldPagar.DisableControls;
      qrySldLiq.DisableControls;
      qryLiqSemAcoes.DisableControls;
      qryNaoExe.DisableControls;
      //AL_15
      qryLiqComAcoes.DisableControls;
      repeat
         if pgctrlDetalhe.ActivePage = tbsDet then
         begin
            dspSaldoAnt.DataSet := qryDetalhe;
            iRec := qryDetalhe.RecordCount;
            if iCount = 0 then
               iHist := qryDetalheIDSALDOSCONTACOES.AsInteger;
         end
         else if pgctrlDetalhe.ActivePage = tbsSldPag then
         begin
            dspSaldoAnt.DataSet := qrySldPagar;
            iRec := qrySldPagar.RecordCount;
            if iCount = 0 then
               iHist := qrySldPagarIDSALDOSCONTACOES.AsInteger;
         end
         else if pgctrlDetalhe.ActivePage = tbsSldLiq then
         begin
            dspSaldoAnt.DataSet := qrySldLiq;
            iRec := qrySldLiq.RecordCount;
            if iCount = 0 then
               iHist := qrySldLiqIDHISTCONTACOES.AsInteger;
         end
         else if pgctrlDetalhe.ActivePage = tbsLiqSemAcoes then
         begin
            dspSaldoAnt.DataSet := qryLiqSemAcoes;
            iRec := qryLiqSemAcoes.RecordCount;
            if iCount = 0 then
               iHist := qryLiqSemAcoesIDOPERCONTACOES.AsInteger;
         end
         //AL_15
         else if pgctrlDetalhe.ActivePage = tbsLiqComAcoes then
         begin
            dspSaldoAnt.DataSet := qryLiqComAcoes;
            iRec := qryLiqComAcoes.RecordCount;
            if iCount = 0 then
               iHist := qryLiqComAcoesIDOPERCONTACOES.AsInteger;
         end
         else if pgctrlDetalhe.ActivePage = tbsNaoExe then
         begin
            dspSaldoAnt.DataSet := qryNaoExe;
            iRec := qryNaoExe.RecordCount;
            if iCount = 0 then
               iHist := qryNaoExeIDOPERCONTACOES.AsInteger;
         end;

         Inc(iCount);

         cdsSaldoAnt.Data := dspSaldoAnt.Data;

      until (cdsSaldoAnt.RecordCount = iRec) or (iCount > 3);

      if pgctrlDetalhe.ActivePage = tbsDet then
         qryDetalhe.Locate('IDSALDOSCONTACOES', iHist, [])
      else if pgctrlDetalhe.ActivePage = tbsSldPag then
         qrySldPagar.Locate('IDSALDOSCONTACOES', iHist, [])
      else if pgctrlDetalhe.ActivePage = tbsSldLiq then
         qrySldLiq.Locate('IDHISTCONTACOES', iHist, [])
      else if pgctrlDetalhe.ActivePage = tbsLiqSemAcoes then
         qryLiqSemAcoes.Locate('IDOPERCONTACOES', iHist, [])
      //AL_15
      else if pgctrlDetalhe.ActivePage = tbsLiqComAcoes then
         qryLiqComAcoes.Locate('IDOPERCONTACOES', iHist, [])
      else if pgctrlDetalhe.ActivePage = tbsNaoExe then
         qryNaoExe.Locate('IDOPERCONTACOES', iHist, []);

      if cdsSaldoAnt.RecordCount = iRec then
         Result := True;

   finally
      qryDetalhe.EnableControls;
      qrySldPagar.EnableControls;
      qrySldLiq.EnableControls;
      qryLiqSemAcoes.EnableControls;
      //AL_15
      qryLiqComAcoes.EnableControls;
      qryNaoExe.EnableControls;
   end;
end;

procedure TfrmCadContAcoes.sbtnInsDetClick(Sender: TObject);
begin
   // AL_10
   if CarregaCDS then
      inherited
   else
      bbtnCancelarDet.Click;
   //AL_15
   pgcLiqComAcoes.ActivePage := tbsOperacoes;
end;

procedure TfrmCadContAcoes.sbtnAltDetClick(Sender: TObject);
begin
   // AL_10
   if CarregaCDS then
      inherited
   else
      bbtnCancelarDet.Click;
end;

// AL_11
procedure TfrmCadContAcoes.mnuSaldosClick(Sender: TObject);
begin
   inherited;
   try
      OperComum.LimpaParametros(DMRelContSaldos.qry);
      if not qry.IsEmpty then
         DMRelContSaldos.qry.ParamByName('IDOPERCONTACOES').Asinteger := qryIDOPERCONTACOES.AsInteger;
      DMRelContSaldos.qry.Open;
      OperComum.LimpaParametros(DMRelContSaldos.qryGraf);
      if not qry.IsEmpty then
         DMRelContSaldos.qryGraf.ParamByName('IDOPERCONTACOES').Asinteger := qryIDOPERCONTACOES.AsInteger;
      DMRelContSaldos.qryGraf.Open;
      if not DMRelContSaldos.qry.IsEmpty then
      begin
         DMRelContSaldos.lblPeriodo.Visible := False;
         DMRelContSaldos.lblContrato.Visible := False;
         TFrmPreview.CreateModalPreview(Application,
                                        DMRelContSaldos.rpt,
                                        DMRelContSaldos.rpt.PrinterSetup.DocumentName);
      end;
   finally
      OperComum.LimpaParametros(DMRelContSaldos.qry);
      if TForm(Self).WindowState = wsMinimized then
         Resize;
      sbtnRelatorio.Down := False;
   end;
end;

// AL_11
procedure TfrmCadContAcoes.mnuOperacoesClick(Sender: TObject);
begin
   inherited;
   try
      OperComum.LimpaParametros(DMRelContOpe.qry);
      if not qry.IsEmpty then
         DMRelContOpe.qry.ParamByName('IDOPERCONTACOES').Asinteger := qryIDOPERCONTACOES.AsInteger;
      DMRelContOpe.qry.Open;
      if not DMRelContOpe.qry.IsEmpty then
      begin
         //AL_18
         DMRelContOpe.lblContrato.Visible := False;
         TFrmPreview.CreateModalPreview(Application,
                                        DMRelContOpe.rpt,
                                        DMRelContOpe.rpt.PrinterSetup.DocumentName);
      end;
   finally
      OperComum.LimpaParametros(DMRelContOpe.qry);
      if TForm(Self).WindowState = wsMinimized then
         Resize;
      sbtnRelatorio.Down := False;
   end;

end;


procedure TfrmCadContAcoes.dbdtDataOperNaoExeExit(Sender: TObject);
begin
  inherited;
  CalculaVenc;
  BuscaSaldo(dbdtDataOperNaoExe.DateTime);
end;

// AL_13
procedure TfrmCadContAcoes.GridZebrado(Sender: TObject;
                           Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
const clYellowBaby = $00C0FFFF; 
begin
  // Se a celula pintada não pertencer a uma coluna Fixada
  if not (gdFixed in State) then
  begin
     // Se a celula pintada for a linha ativa
     if TwwDBGrid(Sender).CalcCellRow = TwwDBGrid(Sender).GetActiveRow then
     begin
        // Se a celula pintada não estiver selecionada nem focada
        if not ((gdSelected in State) or (gdFocused in State)) then
        begin
           // Se o DataSet não estiver vazio e existir o campo IDINC
           if (not TwwDBGrid(Sender).DataSource.DataSet.IsEmpty) and
              (Field.DataSet.FindField('IDINC') <> nil) then
           begin
              // Se o campo tiver vazio (Saldo incompleto)
              if Field.DataSet.FindField('IDINC').AsInteger = 0 then
                 AFont.Color := cCorZebra
              else
              begin
                 // Zebrado normal
                 if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
                    AFont.Color := clYellowBaby
                 else
                    AFont.Color := clHighLightText;
              end;
           end
           else
           begin
              // Zebrado normal
              if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
                 AFont.Color := clYellowBaby
              else
                 AFont.Color := clHighLightText;
           end;
        end
        else
           AFont.Color := clMaroon;
        ABrush.Color := clHighLight;
     end
     // Se a celula pintada não for da linha ativa
     else
     // Se a celula pintada não estiver selecionada nem focada
     if not ((gdSelected in State) or (gdFocused in State)) then
     begin
        // Se o DataSet não estiver vazio e existir o campo IDINC
        if (not TwwDBGrid(Sender).DataSource.DataSet.IsEmpty) and
           (Field.DataSet.FindField('IDINC') <> nil) then
        begin
           // Se o campo tiver vazio (Saldo incompleto)
           if Field.DataSet.FindField('IDINC').AsInteger = 0 then
           begin
              // Fundo Cereja e Fonte Branca
              ABrush.Color := cCorZebra;
              AFont.Color := clWhite;
           end
           else
           begin
              // Zebrado normal
              if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
                 ABrush.Color := clYellowBaby
              else
                 ABrush.Color := clWhite;
           end;
        end
        else
        begin
           // Zebrado normal
           if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
              ABrush.Color := clYellowBaby
           else
              ABrush.Color := clWhite;
        end;
     end
     else
     begin
        ABrush.Color := clHighLight;
        AFont.Color  := clHighLightText;
     end;
  end;
end;

// AL_13
procedure TfrmCadContAcoes.dbgrdDetTopRowChanged(Sender: TObject);
begin
  inherited;
   // Acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;

// AL_13
procedure TfrmCadContAcoes.dbgSldPagarTopRowChanged(Sender: TObject);
begin
  inherited;
   // Acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;

// AL_13
procedure TfrmCadContAcoes.dbgSldLiqTopRowChanged(Sender: TObject);
begin
  inherited;
   // Acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;

// AL_13
procedure TfrmCadContAcoes.grdLiqSemAcoesTopRowChanged(Sender: TObject);
begin
  inherited;
   // Acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;

// AL_13
procedure TfrmCadContAcoes.grdNaoExeTopRowChanged(Sender: TObject);
begin
  inherited;
   // Acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmCadContAcoes.grdLiqComAcoesTopRowChanged(Sender: TObject);
begin
  inherited;
   // Acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;

//AL_15
procedure TfrmCadContAcoes.dbdtDataOperLCAExit(Sender: TObject);
begin
  inherited;
  CalculaVenc;
  BuscaSaldo(dbdtDataOperLCA.DateTime);
end;

//AL_15
procedure TfrmCadContAcoes.dblTipoOperLCAExit(Sender: TObject);
begin
  inherited;
  CalculaVenc;
  BuscaSaldo(dbdtDataOperLSA.DateTime);
end;

//AL_15
procedure TfrmCadContAcoes.dbdtDataLiqLCAExit(Sender: TObject);
begin
  inherited;
   if Trim(dbdtDataLiqLCA.Text) = '' then
      CalculaVenc;
   BuscaSaldo(dbdtDataOperLCA.DateTime);
end;

//AL_15
procedure TfrmCadContAcoes.dbdtDataLiqLCAEnter(Sender: TObject);
begin
  inherited;
   if Trim(dbdtDataLiqLCA.Text) = '' then
      CalculaVenc;
end;

//AL_15
procedure TfrmCadContAcoes.dbrQuantidadeLCAEnter(Sender: TObject);
begin
  inherited;
  fQtdAntes := dbrQuantidadeLSA.Value;
end;

//AL_15
procedure TfrmCadContAcoes.dbrQuantidadeLCAExit(Sender: TObject);
begin
  inherited;
  if dbrQuantidadeLSA.Value <> fQtdAntes then
     qryLiqSemAcoes.FieldByName('VLROPERACAO').AsFloat := qryLiqSemAcoes.FieldByName('VLROPERACAO').AsFloat * OperComum.DivValorZero(dbrQuantidadeLSA.Value, fQtdAntes);
  BuscaSaldo(dbdtDataOperLSA.DateTime);
end;

//AL_15
procedure TfrmCadContAcoes.dbrValorLCAExit(Sender: TObject);
begin
  inherited;
   BuscaSaldo(dbdtDataOperLSA.DateTime);
end;

//AL_15
procedure TfrmCadContAcoes.tbcDetalheChange(Sender: TObject);
begin
  inherited;
   if pgctrlDetalhe.ActivePage.Name = 'tbsLiqComAcoes' then
   begin
      pgcLiqComAcoes.ActivePage := tbsOperacoes;
      pnlOperRV.SendToBack;
   end;
end;

//AL_15
procedure TfrmCadContAcoes.sbtnInsOperRVClick(Sender: TObject);
begin
  inherited;
   pnlOperRV.BringToFront;
   qryOperRv.Insert;
   dblkTipoOperRV.Text := '';
   dblkCarteira.Text := '';
   dblkCustodiante.Text := '';
   dbreSldQtdOperRV.Value := 0;
end;

//AL_15
procedure TfrmCadContAcoes.bbtnOkOperRVClick(Sender: TObject);
begin
  inherited;
   if VerificaMarcadoReproc(StrToDate(dbdtDataOperLCA.Text),
                            qryInvestimentoAcao.FieldByName('IDINVESTIMENTO').AsInteger,
                            qryCarteiraOperRV.FieldByName('IDCARTEIRAINVEST').AsInteger) then
   begin
      MsgDlg('A operação não pode ser realizada pois a ação está '+#13 +
             'marcada para Reprocessaemento.', 'Mensagem do Sistema', mtWarning, [mbOK], 0);
      Exit;
   end
   else if dbreQtdOperRV.Value = 0 then
   begin
      MsgDlg('A quantidade não pode ser igual a 0 (zéro).', 'Mensagem do Sistema', mtWarning, [mbOK], 0);
      if dbreQtdOperRV.CanFocus then
         dbreQtdOperRV.SetFocus;
      Exit;
   end
   else if dbreQtdOperRV.Value > fSaldoQtd then
   begin
      MsgDlg('A quantidade não pode ser maior que o saldo disponível.', 'Mensagem do Sistema', mtWarning, [mbOK], 0);
      if dbreQtdOperRV.CanFocus then
         dbreQtdOperRV.SetFocus;
      Exit;
   end
   else if dbreQtdOperRV.Value > dbrQtd.Value then
   begin
      MsgDlg('A quantidade não pode ser maior que o saldo disponível.', 'Mensagem do Sistema', mtWarning, [mbOK], 0);
      if dbreQtdOperRV.CanFocus then
         dbreQtdOperRV.SetFocus;
      Exit;
   end
   else if (dbreQtdOperRV.Value + fQtdOperLancada) > dbrQtd.Value then
   begin
      MsgDlg('A quantidade não pode ser maior que o saldo disponível.', 'Mensagem do Sistema', mtWarning, [mbOK], 0);
      if dbreQtdOperRV.CanFocus then
         dbreQtdOperRV.SetFocus;
      Exit;
   end
   else if Trim(dblkTipoOperRV.Text) = '' then
   begin
      MsgDlg('O tipo de operação não foi informado.', 'Mensagem do Sistema', mtWarning, [mbOK], 0);
      if dblkTipoOperRV.CanFocus then
         dblkTipoOperRV.SetFocus;
      Exit;
   end
   else if Trim(dblkCarteira.Text) = '' then
   begin
       MsgDlg('Informe a Carteira.', 'Mensagem do Sistema', mtWarning, [mbOK], 0);
       if dblkCarteira.CanFocus then
          dblkCarteira.SetFocus;
       Exit;
   end
   else if Trim(dblkCustodiante.Text) = '' then
   begin
       MsgDlg('Informe o Custodiante.', 'Mensagem do Sistema', mtWarning, [mbOK], 0);
       if dblkCustodiante.CanFocus then
          dblkCustodiante.SetFocus;
       Exit;
   end
   else
   begin
      if not (qryDetalhe.State in [dsInsert, dsEdit]) then
      begin
         qryOperRV.Insert;
         qryOperRV.FieldByName('IDOPERACAOINVEST').AsInteger  := LeUltRegistro(nil, 'OPERACAOINVEST');
         qryOperRV.FieldByName('IDCUSTODIANTE').AsInteger     := qryCustodiante.FieldByName('IDCUSTODIANTE').AsInteger;;
         qryOperRV.FieldByName('IDCORRETVALORES').Clear;
         qryOperRV.FieldByName('MOECODIGO').Clear;
         qryOperRV.FieldByName('IDMODULO').AsInteger          := 79;
         qryOperRV.FieldByName('EMPRESAPROP').AsInteger       := Sistema.IdEmpresa;
         qryOperRV.FieldByName('IDCARTEIRAINVEST').AsInteger  := qryCarteiraOperRV.FieldByName('IDCARTEIRAINVEST').AsInteger;
         qryOperRV.FieldByName('IDINVESTIMENTO').AsInteger    := qry.FieldByName('IDINVESTIMENTO').AsInteger;
         qryOperRV.FieldByName('IDTIPOINVEST').AsInteger      := 2;
         qryOperRV.FieldByName('IDTIPOOPERACAO').AsInteger    := qryTipoOperRV.FieldByName('IDTIPOOPERACAO').AsInteger;
         qryOperRV.FieldByName('DATAOPERACAO').AsDateTime     := StrToDate(dbdtDataOperLCA.Text);
         qryOperRV.FieldByName('NUMDOCUMENTO').AsString       := '';
         qryOperRV.FieldByName('QTDEOPERACAO').AsFloat        := dbreQtdOperRV.Value;
         qryOperRV.FieldByName('VLROPERACAO').AsFloat         := RoundCM(dbreQtdOperRV.Value * OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoVlrTotal, CtrlRV.BuscaSaldoRV.SaldoQtdTotal),2);
         qryOperRV.FieldByName('PRECOUNITOPERACAO').AsFloat   := RoundCM(OperComum.DivValorZero(qryOperRV.FieldByName('VLROPERACAO').AsFloat,qryOperRV.FieldByName('QTDEOPERACAO').AsFloat),2);
         qryOperRV.FieldByName('DATAVENCOPER').AsDateTime     := StrToDate(dbdtDataLiqLCA.Text);
         qryOperRV.FieldByName('OBSERVACAO').AsString         := '';
         qryOperRV.FieldByName('FLGSTATUSFECHBOL').AsString   := 'F';
         qryOperRV.FieldByName('FLGSTATUSORDMOV').AsString    := 'F';
         qryOperRV.FieldByName('IDPLANPREVCTBPATR').AsInteger := qry.FieldByName('IDPLANPREVCTBPATR').AsInteger;
         qryOperRV.FieldByName('IDCARTEIRAGERENC').Clear;
         qryOperRV.FieldByName('IDOPERCONTACOES').AsInteger   := qryLiqComAcoes.FieldByName('IDOPERCONTACOES').AsInteger;
         qryOperRV.FieldByName('DESCTIPOOPERACAO').AsString   := qryTipoOperRV.FieldByName('DESCTIPOOPERACAO').AsString;
         qryOperRV.FieldByName('DESCINVESTIMENTO').AsString   := qryInvestimentoAcao.FieldByName('DESCINVESTIMENTO').AsString;
         qryOperRV.FieldByName('SALDOQTDE').AsFloat           := dbreSldQtdOperRV.Value;
         qryOperRV.Post;
      end;

   end;
   pnlOperRV.SendToBack;
   AtualizaBotoesLiqComAcoes;
end;

//AL_15
procedure TfrmCadContAcoes.dblkTipoOperRVExit(Sender: TObject);
begin
    MontaSaldoRV;
end;

//AL_15
procedure TfrmCadContAcoes.MontaSaldoRV;
var
   iCarteiraGerenc : Integer;
begin
  inherited;
   //Monta o saldo de quantidade lançada para testar com o total do Contrado
   dbreQtdOperRV.Value := 0;
   fQtdOperLancada := 0;
   QryOperRv.First;
   while not QryOperRv.Eof do
   begin
      fQtdOperLancada := fQtdOperLancada + QryOperRv.FieldByName('QTDEOPERACAO').AsFloat;
      QryOperRv.Next;
   end;
   dbreQtdOperRV.Value :=  dbrQtd.Value - fQtdOperLancada;
   if (Trim(dblkTipoOperRV.Text) <> '') and
      (Trim(dblkCarteira.Text) <> '') and
      (Trim(dblkCustodiante.Text) <> '') then
   begin
      iCarteiraGerenc := -1;
      if not qryCarteiraOperRV.FieldByName('IDCARTEIRAGERENC').Isnull then
         iCarteiraGerenc := qryCarteiraOperRV.FieldByName('IDCARTEIRAGERENC').AsInteger;

      //Busca o Saldo da Ação
      CtrlRV.BuscaSaldoRV.Executa(dbdtDataOperLCA.Date,
                                  qry.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                  qry.FieldByName('IDINVESTIMENTO').AsInteger,
                                  qryCarteiraOperRV.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                  iCarteiraGerenc,
                                  9999999,
                                  qryCustodiante.FieldByName('IDCUSTODIANTE').AsInteger);

      dblkTipoOperRV.Text  := qryTipoOperRV.FieldByName('DESCTIPOOPERACAO').AsString;
      dblkCarteira.Text    := qryCarteiraOperRV.FieldByName('DESCCARTINVEST').AsString;
      dblkCustodiante.Text := qryCustodiante.FieldByName('SGLCUSTODIANTE').AsString;

      //Liquidação de Contrato de Ações com Ações CC
      //AL_16
      if qryTipoOperRV.FieldByName('IDTIPOOPERACAO').AsInteger = -164 then
      begin
         fSaldoQtd := OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoQtdCC, CtrlRV.BuscaSaldoRV.SaldoQtdTotal) * CtrlRV.BuscaSaldoRV.SldQtdLibCustodia;
         dbreSldQtdOperRV.Value := fSaldoQtd;
      end
      //Liquidação de Contrato de Ações com Ações CCI
      else if qryTipoOperRV.FieldByName('IDTIPOOPERACAO').AsInteger = -10164 then
      begin
         fSaldoQtd := OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoQtdCCI, CtrlRV.BuscaSaldoRV.SaldoQtdTotal) * CtrlRV.BuscaSaldoRV.SldQtdLibCustodia;
         dbreSldQtdOperRV.Value := fSaldoQtd;
      end;
  end;
end;

//AL_15
procedure TfrmCadContAcoes.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlRV := TCtrlRendaVariavel.Create;
   CtrlRV.InitializeAs(Padroes);
end;

//AL_15
procedure TfrmCadContAcoes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
   FreeAndNil(CtrlRV);
end;

//AL_15
procedure TfrmCadContAcoes.bbtnCancelarOperRVClick(Sender: TObject);
begin
  inherited;
   pnlOperRV.SendToBack;
   dblkTipoOperRV.Text := '';
   dblkCarteira.Text := '';
   dblkCustodiante.Text := '';
   dbreQtdOperRV.Value := 0;
   dbreSldQtdOperRV.Value := 0;
   qryOperRV.First;
end;

//AL_15
procedure TfrmCadContAcoes.bbtnVoltarOperRVClick(Sender: TObject);
begin
  inherited;
   pnlOperRV.SendToBack;
end;

//AL_15
procedure TfrmCadContAcoes.pgcLiqComAcoesChange(Sender: TObject);
begin
  inherited;
   AtualizaBotoesLiqComAcoes;
end;

//AL_15
procedure TfrmCadContAcoes.AtualizaBotoesLiqComAcoes;
begin
   sbtnInsOperRV.Enabled := False;
   sbtnAltOperRV.Enabled := False;
   sbtnExcluiOperRV.Enabled := False;

   if pgcLiqComAcoes.ActivePage = tbsAcoes then
   begin
      if dblkTipoOperRV.CanFocus then
         dblkTipoOperRV.SetFocus;
      bbtnOkDet.Enabled := False;
      bbtnCancelarDet.Enabled := False;
      bbtnVoltarDet.Enabled := False;
      if qryLiqComAcoes.IsEmpty then
      begin
         sbtnInsOperRV.Enabled := False;
         sbtnAltOperRV.Enabled := False;
         sbtnExcluiOperRV.Enabled := False;
      end
      else
      begin
         if qry.State in [dsInsert, dsEdit] then
         begin
            sbtnInsOperRV.Enabled    := True;
            sbtnAltOperRV.Enabled    := True;
            sbtnExcluiOperRV.Enabled := True;
            if qryOperRV.IsEmpty then
            begin
               sbtnAltOperRV.Enabled    := False;
               sbtnExcluiOperRV.Enabled := False;
            end;
         end;
      end;
   end
   else
   begin
      bbtnOkDet.Enabled := True;
      bbtnCancelarDet.Enabled := True;
      bbtnVoltarDet.Enabled := True;
   end;
end;

procedure TfrmCadContAcoes.sbtnAltOperRVClick(Sender: TObject);
begin
  inherited;
   pnlOperRV.BringToFront;
   qryOperRv.Edit;

   MontaSaldoRV;
end;

//AL_15
procedure TfrmCadContAcoes.sbtnExcluiOperRVClick(Sender: TObject);
begin
  inherited;
   if not qryOperRv.IsEmpty then
   begin
      Try
         if not RendaVariavel.ExcluiBoleta(qryOperRv.FieldByName('NUMDOCUMENTO').AsString, true, false) then
            Raise Exception.Create('Não foi possível excluir a Operção.');

         qryOperRv.First;
         while not qryOperRv.Eof do
            qryOperRv.Delete;

      except on E: Exception do
         begin
            MsgDlg('Ocorreu um Problema :'+ #13 + E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
         end;
      end;
   end;
end;

//AL_15
function TfrmCadContAcoes.ReprocessaRV : boolean;
begin
   Result := True;
   if not qryOperRv.IsEmpty then
   begin
      Try
         // Excluir Primeiro os Registros Anteriores

         if not RendaVariavel.ExcluiBoleta(qryOperRv.FieldByName('NUMDOCUMENTO').AsString, true, false) then
            Raise Exception.Create('Não foi possível excluir a Operção.');

         // Relançar
         if not LiquidaContrAcoes then
            Raise Exception.Create('Não foi possível efetuar a Baixa das Ações.');

      except on E: Exception do
         begin
            Result := false;
            MsgDlg('Ocorreu um Problema :'+ #13 +
                    E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
         end;
      end;
   end;
end;

//AL_15
function TfrmCadContAcoes.LiquidaContrAcoes : boolean;
var
   fQtdTotal, fQtdCar, fValorOper, fSaldoAquiPro, fSaldoVariacaoPro, fSaldoIrApuPro, fQtdOper : Double;
   iIdOperCustodia, iIdHistCartInv, iDocumento, iPlano, iPlanilha, iIdHistCustodia : integer;
   wTipoRecDesBol, wMensErro : String;
   bCriaLancto : boolean;
   CdsOperacaoInvest : TClientDataSet;
begin
   Result := True;
   Try
      iDocumento:= -1;
      iPlano    := -1;
      iPlanilha := -1;
      CdsOperacaoInvest        := TClientDataSet.Create(nil);
      CtrlRV.CdsOperacaoInvest := CdsOperacaoInvest;
      CdsOperacaoInvest.Data   := CtrlRV.ListOperacaoInvest(0);

      Try
         // Busca os Saldos na Carteira
         qryOperRV.First;
         while not qryOperRV.EOF do
         begin
            qryCarteiras.Close;
            qryCarteiras.Open;
            while not qryCarteiras.Eof do
            begin
               CtrlRV.BuscaSaldoRV.Executa(qryOperRV.FieldByName('DATAOPERACAO').AsDateTime,
                                           qryOperRV.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                           qryOperRV.FieldByName('IDINVESTIMENTO').AsInteger,
                                           qryCarteiras.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                           qryCarteiras.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                           9999999,
                                           qryOperRV.FieldByName('IDCUSTODIANTE').AsInteger);

               if CtrlRV.BuscaSaldoRV.SaldoQtdTotal > 0 then
               begin
                  fQtdTotal := CtrlRV.BuscaSaldoRV.SaldoQtdTotal;  // Saldo da Carteira

                  fQtdOper := qryOperRV.FieldByName('QTDEOPERACAO').AsFloat;

                  fSaldoAquiPro     := RoundCM((CtrlRV.BuscaSaldoRV.SaldoCusto /
                                                CtrlRV.BuscaSaldoRV.SaldoQtdTotal) * fQtdOper, 2);
                  fSaldoVariacaoPro := RoundCM((CtrlRV.BuscaSaldoRV.SaldoVariacao /
                                               CtrlRV.BuscaSaldoRV.SaldoQtdTotal) * fQtdOper, 2);
                  fSaldoIrApuPro :=    RoundCM((CtrlRV.BuscaSaldoRV.SaldoIRApurado /
                                                CtrlRV.BuscaSaldoRV.SaldoQtdTotal) * fQtdOper, 2);

                  // Verifica se possui saldo para transferir.
                  if CtrlRV.BuscaSaldoRV.SaldoQtdTotal < fQtdOper then
                     Raise Exception.Create('A Quantidade é superior ao saldo para transferência.');

                  // Pesquisa se Boleta ja tem Registro na Tabela de Boletas
                  OperComum.LimpaParametros(dtmOperComum.QryBoleta);
                  dtmOperComum.QryBoleta.ParamByName('IDBOLETA').AsString := sBoleta;
                  dtmOperComum.QryBoleta.Open;

                  // Caso não tenha, cria um registro
                  if dtmOperComum.QryBoleta.IsEmpty Then
                  begin
                     sBoleta :=  'CA-'+Copy(dbdtDataOperLCA.Text,9,2)+'/'+FormatFloat('0000',
                                  LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(dbdtDataOperLCA.Text,9,2)));

                     // Não leva o IDFORCLI em função do LOTE da Boleta
                     ExecutaQuery(dtmOperComum.QryAuxiliar,'INSERT INTO BOLETA (IDBOLETA, DATABOLETA, STATUS, TIPMOVBOLETA) VALUES ('+
                                            QuotedStr(sBoleta)+', TO_DATE('+
                                            QuotedStr(DateToStr(qryOperRV.FieldByName('DATAOPERACAO').AsDateTime))+',''DD/MM/YYYY''), '+
                                            ' ''F'''+',''OPE'')');
                  end;

                  //Grava OperacaoInvest Origem
                  fValorOper :=  RoundCM(fQtdOper * OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoVlrTotal, CtrlRV.BuscaSaldoRV.SaldoQtdTotal),2);

                  if not CtrlRV.AplicaAtualOperacaoInvest(qryOperRV.FieldByName('DATAOPERACAO').AsDateTime,
                                                          0, 0, 0, 0, 0, 0,
                                                          qryTipoOperRV.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                          2,
                                                          qryOperRV.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                          iIdOperCustodia,
                                                          -1,
                                                          Sistema.IdModulo,
                                                          qryOperRV.FieldByName('IDINVESTIMENTO').AsInteger,
                                                          QryEmissor.FieldByName('IDEMISSOR').AsInteger,
                                                          qryOperRV.FieldByName('IDCUSTODIANTE').AsInteger,
                                                          -1,
                                                          qryCarteiras.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                          qryCarteiras.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                          -1, -1, -1, -1, -1, -1, -1,
                                                          Sistema.IdEmpresa,
                                                          -1,
                                                          fValorOper,
                                                          OperComum.DivValorZero(fValorOper,fQtdOper),
                                                          fQtdOper,
                                                          0, 0,
                                                          0, 0, 0, 0, 0, '', '',
                                                          sBoleta,
                                                          '', '', '', '', 0, 0, 0, -1, -1, -1, -1, -1, -1, 0, 0, 0, '', '',
                                                          qryOperRV.FieldByName('IDOPERCONTACOES').AsInteger) then
                      Raise Exception.Create('Não foi possível gravar a operação.');

                  if qryCarteiras.FieldByName('IDCARTEIRAGERENC').IsNull then
                  begin
                     // Grava a Custódia
                     iIdOperCustodia := LeUltRegistro(Nil,'OPERCUSTODIA');
                     if not OperacaoInvest.AlimentaOperCustodia(iIdOperCustodia,
                                                                -1,-1,-1,-1,
                                                                qryOperRV.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                                qryCarteiras.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                                qryOperRV.FieldByName('IDINVESTIMENTO').AsInteger,
                                                                qryOperRV.FieldByName('IDCUSTODIANTE').AsInteger,
                                                                qryOperRV.FieldByName('IDCUSTODIANTE').AsInteger,
                                                                -1,
                                                                -1,
                                                                fQtdOper,
                                                                qryOperRV.FieldByName('DATAOPERACAO').AsDateTime,
                                                                '',
                                                                sBoleta,
                                                                qryOperRV.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                                -1,
                                                                qryOperRV.FieldByName('IDPLANPREVCTBPATR').AsInteger) then
                        Raise Exception.Create('Não é possível alimentar a custódia com essa operação!');

                     // Grava HistCustodia
                     OperComum.AlteraHistCustodiaOrigem(iIdOperCustodia,
                                                        -1,
                                                        qryCarteiras.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                        qryOperRV.FieldByName('IDINVESTIMENTO').AsInteger,
                                                        qryOperRV.FieldByName('IDCUSTODIANTE').AsInteger,
                                                        '',
                                                        qryOperRV.FieldByName('DATAOPERACAO').AsDateTime,
                                                        fQtdOper,
                                                        iIdHistCustodia,
                                                        qryOperRV.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                        qryTipoOperRV.FieldByName('FLGCONTAINVEST').AsInteger);

                     OperacaoInvest.AtualizaSaldosCustodia;

                     ExecutarQuery(dtmOperComum.QryLocal,'UPDATE HISTCUSTODIA SET IDOPERACAOINVEST = '+ IntToStr(CtrlRV.IdOperacaoInvest) + ' WHERE IDCUSTODIA = '+ IntToStr(iIdHistCustodia));
                  end;

                  // Venda
                  if Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                                    qryOperRV.FieldByName('IDINVESTIMENTO').AsInteger,
                                                    2,
                                                    CtrlRV.IdOperacaoInvest,
                                                    -1,
                                                    qryOperRV.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                    qryCarteiras.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                    qryCarteiras.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                    -1,-1,-1,-1,-1,
                                                    qryOperRV.FieldByName('DATAOPERACAO').AsDateTime,
                                                    fValorOper,
                                                    fQtdOper,
                                                    1,0,0,0,0,0,0,0,0,0,
                                                    'D','D','',
                                                    qryTipoOperRV.FieldByName('DESCTIPOOPERACAO').AsString + ' : ' + qryOperRV.FieldByName('DESCINVESTIMENTO').AsString,
                                                    'OPE', '', '', True, -1,
                                                    qryOperRV.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                    iIdHistCartInv) Then
                              Raise Exception.Create('Não foi possível alimentar a carteira com essa operação!');

                  ExecutaQuery(dtmOperComum.QryLocal,'UPDATE HISTCARTINV SET MOVIMAQUI = '+ TrocaVirgulaPonto(FloatToStr(fSaldoAquiPro))+','+
                                                     ' VLRVARIACAO = '+TrocaVirgulaPonto(FloatToStr(fSaldoVariacaoPro))+','+
                                                     ' VLRIRAPU = '+TrocaVirgulaPonto(FloatToStr(fSaldoIrApuPro))+' '+
                                                     ' WHERE IDHISTCARTINV = '+IntToStr(iIdHistCartInv));

                  if not OperComum.AtualizaSaldos(1,-1) Then
                     Raise Exception.Create('Não foi possível atualizar o saldo ' + #13 +
                                            'Data ' + DateToStr(qryOperRV.FieldByName('DATAOPERACAO').AsDateTime) + #13 +
                                            'Operação' + qryTipoOperRV.FieldByName('DESCTIPOOPERACAO').AsString + #13 +
                                            'Investimento ' + qryOperRV.FieldByName('DESCINVESTIMENTO').AsString);

                  if qryCarteiras.FieldByName('IDCARTEIRAGERENC').IsNull then
                  begin
                     bCriaLancto := False;
                     wTipoRecDesBol := '';
                     if qryOperRV.FieldByName('IDCARTEIRAGERENC').IsNull then
                     begin
                        OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                                qryOperRV.FieldByName('IDINVESTIMENTO').AsInteger,
                                                qryOperRV.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                CtrlRV.IdOperacaoInvest,
                                                QryEmissor.FieldByName('IDEMISSOR').AsInteger,
                                                qryCarteiras.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                pRPI.MOECODIGO, '','','','','',
                                                wTipoRecDesBol,
                                                bCriaLancto,
                                                0,
                                                fValorOper,
                                                qryOperRV.FieldByName('DATAOPERACAO').AsDateTime,
                                                qryOperRV.FieldByName('DATAOPERACAO').AsDateTime,
                                                iPlano, iPlanilha, iDocumento, wMensErro,'N',False,False, 0, True,
                                                qryOperRV.FieldByName('IDPLANPREVCTBPATR').AsInteger);
                        if Trim(wMensErro) <> '' then
                           Abort;
                     end;

                     ExecutarQuery(dtmOperComum.QryLocal,'UPDATE BOLETA SET PLNCODIGO = ' + IntToStr(iPlanilha) + 'WHERE IDBOLETA = '+ QuotedStr(sBoleta));
                     
                  end;

                  ExecutarQuery(dtmOperComum.QryLocal,'UPDATE HISTCARTINV SET FLGCUSTODIA = NULL WHERE IDHISTCARTINV = '+IntToStr(iIdHistCartInv));

                  if qryCarteiras.FieldByName('IDCARTEIRAGERENC').IsNull then
                  begin
                     if qryOperRV.FieldByName('DATAOPERACAO').AsDateTime < pRPI.DATAULTFECH then
                     begin
                        if not RendaVariavel.MarcarFlagReproc(qryOperRV.FieldByName('IDINVESTIMENTO').AsInteger,
                                                              qryCarteiras.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                              qryOperRV.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                              qryOperRV.FieldByName('DATAOPERACAO').AsDateTime) then
                           Raise Exception.Create('Não foi possível marcar ' + qryOperRV.FieldByName('DESCINVESTIMENTO').AsString + 'para Reprocessamento no Plano de Origem.');

                     end;
                  end;
               end;
               qryCarteiras.Next;
            end;
            qryOperRV.Next;
         end;
      Except
         On E:Exception Do
         Begin
            MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            Result := False;
         End;
      End;
  Finally
      FreeAndNil(CdsOperacaoInvest);
      qryCarteiras.Close;
  end;
end;

procedure TfrmCadContAcoes.dblkCarteiraExit(Sender: TObject);
begin
  inherited;
   MontaSaldoRV;
end;

procedure TfrmCadContAcoes.dblkCustodianteExit(Sender: TObject);
begin
  inherited;
   MontaSaldoRV;
end;

function TfrmCadContAcoes.VerificaMarcadoReproc(dDataRef : TDateTime;
                                                iInvestimento, iCarteira : Integer) : boolean;
begin
   Result := False;
   try
      OperComum.LimpaParametros(qryMarcadoReproc);
      qryMarcadoReproc.ParamByName('DDATAREF').AsString          := DateToStr(dDataRef);
      qryMarcadoReproc.ParamByName('IDINVESTIMENTO').AsInteger   := iInvestimento;
      qryMarcadoReproc.ParamByName('IDCARTEIRAINVEST').AsInteger := iCarteira;
      qryMarcadoReproc.Open;
      if not qryMarcadoReproc.IsEmpty then
         Result := True;
   finally
      qryMarcadoReproc.Close;
   end;
end;

end.

