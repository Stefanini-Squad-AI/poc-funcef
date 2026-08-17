//******************************************************************************
// Data     : 31/08/2006
// Código   : AL_29
// Pendencia: 22965
// Desc     : Segregação de Plano / Patrocinadora
//            Alteradas as queries:
//                qryAtualizaSaldoIL,
//                qryAtualizaSaldoILNull
//                qryUpdOperCustodia
//******************************************************************************
// Data     : 22/08/2006
// Código   : AL_22
// Pendencia: 22957
// Desc     : Implementação do Plano/Patro de Destino na OPERCUSTODIA
//******************************************************************************
// Data     : 09/08/2006
// Código   : AL_4
// Pendencia: 22960
// Desc     : Segregação Plano/Patrocinadora
//            Alteradas as queries:
//                qryFlgAtualSaldo2, qryFlgAtualSaldo13, qrySaldoCustodia
//            Utilização da BuscaSaldos em 3 camadas para buscar por plano
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_3
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//            qryHistCustodia,
//******************************************************************************
// Data     : 21/06/2005
// Código   : AL_2
// Motivo   : Inclusão do Campo IDTIPOOPERACAO na queries qryInsOperCustodia
//******************************************************************************
// Data     : 25/10/2004
// Código   : AL_1
// Motivo   : Inclusão do Campo FLGCONTAINVEST nas queries qryAtualizaSaldoIL
//            e qryAtualizaSaldoILNull
//******************************************************************************
unit dOperacaoInvest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, Wwdatsrc;

type
  TdtmOperacaoInvest = class(TDataModule)
    qryTipoOperacao: TwwQuery;
    qryLancaDocumento: TwwQuery;
    qryAuxiliar: TwwQuery;
    qryDespXTipoOper: TwwQuery;
    qryTipoOperacaoFLGGERACONTAB: TFloatField;
    qryTipoOperacaoFLGGERACAPCAR: TFloatField;
    qryDespXTipoOperFLGGERACONTAB: TFloatField;
    qryDespXTipoOperFLGGERACAPCAR: TFloatField;
    qryTipoOperacaoCODTIPDOC: TFloatField;
    qryDespXTipoOperCODTIPDOC: TFloatField;
    qryIntegraContab: TwwQuery;
    qryIntegraContabMASCARA: TStringField;
    updAtualizaSaldoC: TUpdateSQL;
    qryTipoOperacaoRECPAG: TStringField;
    qryDespXTipoOperRECPAG: TStringField;
    qryBuscaCli: TwwQuery;
    qryBuscaForn: TwwQuery;
    qryBuscaFornCODSUBCONTA: TFloatField;
    qryBuscaCliCODSUBCONTA: TFloatField;
    qryVerificaConta: TwwQuery;
    qryVerificaContaPLASUBCONTA: TStringField;
    qryVerificaContaPLACCUST: TStringField;
    qryPadraoDespFCTTCI: TwwQuery;
    qryPadraoOperFCTTCI: TwwQuery;
    qryPadraoOperFCTT: TwwQuery;
    qryPadraoOperFCCI: TwwQuery;
    qryPadraoOperTTCI: TwwQuery;
    qryPadraoOperFC: TwwQuery;
    qryPadraoOperTT: TwwQuery;
    qryPadraoOperCI: TwwQuery;
    qryPadraoOper: TwwQuery;
    qryPadraoOperIDPADRLANCCONT: TFloatField;
    qryPadraoOperIDTIPOINVEST: TFloatField;
    qryPadraoOperIDTIPOOPERACAO: TFloatField;
    qryPadraoOperCODTIPTITULO: TStringField;
    qryPadraoOperIDPESSOA: TFloatField;
    qryPadraoOperIDTIPODESPINVEST: TFloatField;
    qryPadraoOperRECPAG: TStringField;
    qryPadraoOperIDFORCLI: TFloatField;
    qryPadraoOperCODTIPRECDES: TStringField;
    qryPadraoOperIDCARTEIRAINVEST: TFloatField;
    qryPadraoOperCODSUBCONTAC: TFloatField;
    qryPadraoOperCODSUBCONTAD: TFloatField;
    qryPadraoOperFLGPAGRECNAO: TStringField;
    qryPadraoOperHISTLANCINVEST: TStringField;
    qryPadraoOperPLANO: TFloatField;
    qryPadraoOperCONTADOPERFIN: TStringField;
    qryPadraoOperCONTACOPERFIN: TStringField;
    qryPadraoOperCENCUSTCINVEST: TStringField;
    qryPadraoOperCENCUSTDINVEST: TStringField;
    qryPadraoOperCODCENTRORESPON: TStringField;
    qryPadraoOperUNIDNEGOC: TFloatField;
    qryPadraoOperTIPMOVCARTINV: TStringField;
    qryPadraoOperTIPLANCINVEST: TStringField;
    qryPadraoOperIDEMPRESA: TFloatField;
    qryPadraoOperCIIDPADRLANCCONT: TFloatField;
    qryPadraoOperCIIDTIPOINVEST: TFloatField;
    qryPadraoOperCIIDTIPOOPERACAO: TFloatField;
    qryPadraoOperCICODTIPTITULO: TStringField;
    qryPadraoOperCIIDPESSOA: TFloatField;
    qryPadraoOperCIIDTIPODESPINVEST: TFloatField;
    qryPadraoOperCIRECPAG: TStringField;
    qryPadraoOperCIIDFORCLI: TFloatField;
    qryPadraoOperCICODTIPRECDES: TStringField;
    qryPadraoOperCIIDCARTEIRAINVEST: TFloatField;
    qryPadraoOperCICODSUBCONTAC: TFloatField;
    qryPadraoOperCICODSUBCONTAD: TFloatField;
    qryPadraoOperCIFLGPAGRECNAO: TStringField;
    qryPadraoOperCIHISTLANCINVEST: TStringField;
    qryPadraoOperCIPLANO: TFloatField;
    qryPadraoOperCICONTADOPERFIN: TStringField;
    qryPadraoOperCICONTACOPERFIN: TStringField;
    qryPadraoOperCICENCUSTCINVEST: TStringField;
    qryPadraoOperCICENCUSTDINVEST: TStringField;
    qryPadraoOperCICODCENTRORESPON: TStringField;
    qryPadraoOperCIUNIDNEGOC: TFloatField;
    qryPadraoOperCITIPMOVCARTINV: TStringField;
    qryPadraoOperCITIPLANCINVEST: TStringField;
    qryPadraoOperCIIDEMPRESA: TFloatField;
    qryPadraoOperTTIDPADRLANCCONT: TFloatField;
    qryPadraoOperTTIDTIPOINVEST: TFloatField;
    qryPadraoOperTTIDTIPOOPERACAO: TFloatField;
    qryPadraoOperTTCODTIPTITULO: TStringField;
    qryPadraoOperTTIDPESSOA: TFloatField;
    qryPadraoOperTTIDTIPODESPINVEST: TFloatField;
    qryPadraoOperTTRECPAG: TStringField;
    qryPadraoOperTTIDFORCLI: TFloatField;
    qryPadraoOperTTCODTIPRECDES: TStringField;
    qryPadraoOperTTIDCARTEIRAINVEST: TFloatField;
    qryPadraoOperTTCODSUBCONTAC: TFloatField;
    qryPadraoOperTTCODSUBCONTAD: TFloatField;
    qryPadraoOperTTFLGPAGRECNAO: TStringField;
    qryPadraoOperTTHISTLANCINVEST: TStringField;
    qryPadraoOperTTPLANO: TFloatField;
    qryPadraoOperTTCONTADOPERFIN: TStringField;
    qryPadraoOperTTCONTACOPERFIN: TStringField;
    qryPadraoOperTTCENCUSTCINVEST: TStringField;
    qryPadraoOperTTCENCUSTDINVEST: TStringField;
    qryPadraoOperTTCODCENTRORESPON: TStringField;
    qryPadraoOperTTUNIDNEGOC: TFloatField;
    qryPadraoOperTTTIPMOVCARTINV: TStringField;
    qryPadraoOperTTTIPLANCINVEST: TStringField;
    qryPadraoOperTTIDEMPRESA: TFloatField;
    qryPadraoOperFCIDPADRLANCCONT: TFloatField;
    qryPadraoOperFCIDTIPOINVEST: TFloatField;
    qryPadraoOperFCIDTIPOOPERACAO: TFloatField;
    qryPadraoOperFCCODTIPTITULO: TStringField;
    qryPadraoOperFCIDPESSOA: TFloatField;
    qryPadraoOperFCIDTIPODESPINVEST: TFloatField;
    qryPadraoOperFCRECPAG: TStringField;
    qryPadraoOperFCIDFORCLI: TFloatField;
    qryPadraoOperFCCODTIPRECDES: TStringField;
    qryPadraoOperFCIDCARTEIRAINVEST: TFloatField;
    qryPadraoOperFCCODSUBCONTAC: TFloatField;
    qryPadraoOperFCCODSUBCONTAD: TFloatField;
    qryPadraoOperFCFLGPAGRECNAO: TStringField;
    qryPadraoOperFCHISTLANCINVEST: TStringField;
    qryPadraoOperFCPLANO: TFloatField;
    qryPadraoOperFCCONTADOPERFIN: TStringField;
    qryPadraoOperFCCONTACOPERFIN: TStringField;
    qryPadraoOperFCCENCUSTCINVEST: TStringField;
    qryPadraoOperFCCENCUSTDINVEST: TStringField;
    qryPadraoOperFCCODCENTRORESPON: TStringField;
    qryPadraoOperFCUNIDNEGOC: TFloatField;
    qryPadraoOperFCTIPMOVCARTINV: TStringField;
    qryPadraoOperFCTIPLANCINVEST: TStringField;
    qryPadraoOperFCIDEMPRESA: TFloatField;
    qryPadraoOperTTCIIDPADRLANCCONT: TFloatField;
    qryPadraoOperTTCIIDTIPOINVEST: TFloatField;
    qryPadraoOperTTCIIDTIPOOPERACAO: TFloatField;
    qryPadraoOperTTCICODTIPTITULO: TStringField;
    qryPadraoOperTTCIIDPESSOA: TFloatField;
    qryPadraoOperTTCIIDTIPODESPINVEST: TFloatField;
    qryPadraoOperTTCIRECPAG: TStringField;
    qryPadraoOperTTCIIDFORCLI: TFloatField;
    qryPadraoOperTTCICODTIPRECDES: TStringField;
    qryPadraoOperTTCIIDCARTEIRAINVEST: TFloatField;
    qryPadraoOperTTCICODSUBCONTAC: TFloatField;
    qryPadraoOperTTCICODSUBCONTAD: TFloatField;
    qryPadraoOperTTCIFLGPAGRECNAO: TStringField;
    qryPadraoOperTTCIHISTLANCINVEST: TStringField;
    qryPadraoOperTTCIPLANO: TFloatField;
    qryPadraoOperTTCICONTADOPERFIN: TStringField;
    qryPadraoOperTTCICONTACOPERFIN: TStringField;
    qryPadraoOperTTCICENCUSTCINVEST: TStringField;
    qryPadraoOperTTCICENCUSTDINVEST: TStringField;
    qryPadraoOperTTCICODCENTRORESPON: TStringField;
    qryPadraoOperTTCIUNIDNEGOC: TFloatField;
    qryPadraoOperTTCITIPMOVCARTINV: TStringField;
    qryPadraoOperTTCITIPLANCINVEST: TStringField;
    qryPadraoOperTTCIIDEMPRESA: TFloatField;
    qryPadraoOperFCCIIDPADRLANCCONT: TFloatField;
    qryPadraoOperFCCIIDTIPOINVEST: TFloatField;
    qryPadraoOperFCCIIDTIPOOPERACAO: TFloatField;
    qryPadraoOperFCCICODTIPTITULO: TStringField;
    qryPadraoOperFCCIIDPESSOA: TFloatField;
    qryPadraoOperFCCIIDTIPODESPINVEST: TFloatField;
    qryPadraoOperFCCIRECPAG: TStringField;
    qryPadraoOperFCCIIDFORCLI: TFloatField;
    qryPadraoOperFCCICODTIPRECDES: TStringField;
    qryPadraoOperFCCIIDCARTEIRAINVEST: TFloatField;
    qryPadraoOperFCCICODSUBCONTAC: TFloatField;
    qryPadraoOperFCCICODSUBCONTAD: TFloatField;
    qryPadraoOperFCCIFLGPAGRECNAO: TStringField;
    qryPadraoOperFCCIHISTLANCINVEST: TStringField;
    qryPadraoOperFCCIPLANO: TFloatField;
    qryPadraoOperFCCICONTADOPERFIN: TStringField;
    qryPadraoOperFCCICONTACOPERFIN: TStringField;
    qryPadraoOperFCCICENCUSTCINVEST: TStringField;
    qryPadraoOperFCCICENCUSTDINVEST: TStringField;
    qryPadraoOperFCCICODCENTRORESPON: TStringField;
    qryPadraoOperFCCIUNIDNEGOC: TFloatField;
    qryPadraoOperFCCITIPMOVCARTINV: TStringField;
    qryPadraoOperFCCITIPLANCINVEST: TStringField;
    qryPadraoOperFCCIIDEMPRESA: TFloatField;
    qryPadraoOperFCTTIDPADRLANCCONT: TFloatField;
    qryPadraoOperFCTTIDTIPOINVEST: TFloatField;
    qryPadraoOperFCTTIDTIPOOPERACAO: TFloatField;
    qryPadraoOperFCTTCODTIPTITULO: TStringField;
    qryPadraoOperFCTTIDPESSOA: TFloatField;
    qryPadraoOperFCTTIDTIPODESPINVEST: TFloatField;
    qryPadraoOperFCTTRECPAG: TStringField;
    qryPadraoOperFCTTIDFORCLI: TFloatField;
    qryPadraoOperFCTTCODTIPRECDES: TStringField;
    qryPadraoOperFCTTIDCARTEIRAINVEST: TFloatField;
    qryPadraoOperFCTTCODSUBCONTAC: TFloatField;
    qryPadraoOperFCTTCODSUBCONTAD: TFloatField;
    qryPadraoOperFCTTFLGPAGRECNAO: TStringField;
    qryPadraoOperFCTTHISTLANCINVEST: TStringField;
    qryPadraoOperFCTTPLANO: TFloatField;
    qryPadraoOperFCTTCONTADOPERFIN: TStringField;
    qryPadraoOperFCTTCONTACOPERFIN: TStringField;
    qryPadraoOperFCTTCENCUSTCINVEST: TStringField;
    qryPadraoOperFCTTCENCUSTDINVEST: TStringField;
    qryPadraoOperFCTTCODCENTRORESPON: TStringField;
    qryPadraoOperFCTTUNIDNEGOC: TFloatField;
    qryPadraoOperFCTTTIPMOVCARTINV: TStringField;
    qryPadraoOperFCTTTIPLANCINVEST: TStringField;
    qryPadraoOperFCTTIDEMPRESA: TFloatField;
    qryPadraoOperFCTTCIIDPADRLANCCONT: TFloatField;
    qryPadraoOperFCTTCIIDTIPOINVEST: TFloatField;
    qryPadraoOperFCTTCIIDTIPOOPERACAO: TFloatField;
    qryPadraoOperFCTTCICODTIPTITULO: TStringField;
    qryPadraoOperFCTTCIIDPESSOA: TFloatField;
    qryPadraoOperFCTTCIIDTIPODESPINVEST: TFloatField;
    qryPadraoOperFCTTCIRECPAG: TStringField;
    qryPadraoOperFCTTCIIDFORCLI: TFloatField;
    qryPadraoOperFCTTCICODTIPRECDES: TStringField;
    qryPadraoOperFCTTCIIDCARTEIRAINVEST: TFloatField;
    qryPadraoOperFCTTCICODSUBCONTAC: TFloatField;
    qryPadraoOperFCTTCICODSUBCONTAD: TFloatField;
    qryPadraoOperFCTTCIFLGPAGRECNAO: TStringField;
    qryPadraoOperFCTTCIHISTLANCINVEST: TStringField;
    qryPadraoOperFCTTCIPLANO: TFloatField;
    qryPadraoOperFCTTCICONTADOPERFIN: TStringField;
    qryPadraoOperFCTTCICONTACOPERFIN: TStringField;
    qryPadraoOperFCTTCICENCUSTCINVEST: TStringField;
    qryPadraoOperFCTTCICENCUSTDINVEST: TStringField;
    qryPadraoOperFCTTCICODCENTRORESPON: TStringField;
    qryPadraoOperFCTTCIUNIDNEGOC: TFloatField;
    qryPadraoOperFCTTCITIPMOVCARTINV: TStringField;
    qryPadraoOperFCTTCITIPLANCINVEST: TStringField;
    qryPadraoOperFCTTCIIDEMPRESA: TFloatField;
    qryPadraoDespFCTT: TwwQuery;
    qryPadraoDespFCCI: TwwQuery;
    qryPadraoDespTTCI: TwwQuery;
    qryPadraoDespFC: TwwQuery;
    qryPadraoDespTT: TwwQuery;
    qryPadraoDespCI: TwwQuery;
    qryPadraoDesp: TwwQuery;
    qryPadraoDespFCTTCIIDPADRLANCCONT: TFloatField;
    qryPadraoDespFCTTCIIDTIPOINVEST: TFloatField;
    qryPadraoDespFCTTCIIDTIPOOPERACAO: TFloatField;
    qryPadraoDespFCTTCICODTIPTITULO: TStringField;
    qryPadraoDespFCTTCIIDPESSOA: TFloatField;
    qryPadraoDespFCTTCIIDTIPODESPINVEST: TFloatField;
    qryPadraoDespFCTTCIRECPAG: TStringField;
    qryPadraoDespFCTTCIIDFORCLI: TFloatField;
    qryPadraoDespFCTTCICODTIPRECDES: TStringField;
    qryPadraoDespFCTTCIIDCARTEIRAINVEST: TFloatField;
    qryPadraoDespFCTTCICODSUBCONTAC: TFloatField;
    qryPadraoDespFCTTCICODSUBCONTAD: TFloatField;
    qryPadraoDespFCTTCIFLGPAGRECNAO: TStringField;
    qryPadraoDespFCTTCIHISTLANCINVEST: TStringField;
    qryPadraoDespFCTTCIPLANO: TFloatField;
    qryPadraoDespFCTTCICONTADOPERFIN: TStringField;
    qryPadraoDespFCTTCICONTACOPERFIN: TStringField;
    qryPadraoDespFCTTCICENCUSTCINVEST: TStringField;
    qryPadraoDespFCTTCICENCUSTDINVEST: TStringField;
    qryPadraoDespFCTTCICODCENTRORESPON: TStringField;
    qryPadraoDespFCTTCIUNIDNEGOC: TFloatField;
    qryPadraoDespFCTTCITIPMOVCARTINV: TStringField;
    qryPadraoDespFCTTCITIPLANCINVEST: TStringField;
    qryPadraoDespFCTTCIIDEMPRESA: TFloatField;
    qryPadraoDespFCTTIDPADRLANCCONT: TFloatField;
    qryPadraoDespFCTTIDTIPOINVEST: TFloatField;
    qryPadraoDespFCTTIDTIPOOPERACAO: TFloatField;
    qryPadraoDespFCTTCODTIPTITULO: TStringField;
    qryPadraoDespFCTTIDPESSOA: TFloatField;
    qryPadraoDespFCTTIDTIPODESPINVEST: TFloatField;
    qryPadraoDespFCTTRECPAG: TStringField;
    qryPadraoDespFCTTIDFORCLI: TFloatField;
    qryPadraoDespFCTTCODTIPRECDES: TStringField;
    qryPadraoDespFCTTIDCARTEIRAINVEST: TFloatField;
    qryPadraoDespFCTTCODSUBCONTAC: TFloatField;
    qryPadraoDespFCTTCODSUBCONTAD: TFloatField;
    qryPadraoDespFCTTFLGPAGRECNAO: TStringField;
    qryPadraoDespFCTTHISTLANCINVEST: TStringField;
    qryPadraoDespFCTTPLANO: TFloatField;
    qryPadraoDespFCTTCONTADOPERFIN: TStringField;
    qryPadraoDespFCTTCONTACOPERFIN: TStringField;
    qryPadraoDespFCTTCENCUSTCINVEST: TStringField;
    qryPadraoDespFCTTCENCUSTDINVEST: TStringField;
    qryPadraoDespFCTTCODCENTRORESPON: TStringField;
    qryPadraoDespFCTTUNIDNEGOC: TFloatField;
    qryPadraoDespFCTTTIPMOVCARTINV: TStringField;
    qryPadraoDespFCTTTIPLANCINVEST: TStringField;
    qryPadraoDespFCTTIDEMPRESA: TFloatField;
    qryPadraoDespFCCIIDPADRLANCCONT: TFloatField;
    qryPadraoDespFCCIIDTIPOINVEST: TFloatField;
    qryPadraoDespFCCIIDTIPOOPERACAO: TFloatField;
    qryPadraoDespFCCICODTIPTITULO: TStringField;
    qryPadraoDespFCCIIDPESSOA: TFloatField;
    qryPadraoDespFCCIIDTIPODESPINVEST: TFloatField;
    qryPadraoDespFCCIRECPAG: TStringField;
    qryPadraoDespFCCIIDFORCLI: TFloatField;
    qryPadraoDespFCCICODTIPRECDES: TStringField;
    qryPadraoDespFCCIIDCARTEIRAINVEST: TFloatField;
    qryPadraoDespFCCICODSUBCONTAC: TFloatField;
    qryPadraoDespFCCICODSUBCONTAD: TFloatField;
    qryPadraoDespFCCIFLGPAGRECNAO: TStringField;
    qryPadraoDespFCCIHISTLANCINVEST: TStringField;
    qryPadraoDespFCCIPLANO: TFloatField;
    qryPadraoDespFCCICONTADOPERFIN: TStringField;
    qryPadraoDespFCCICONTACOPERFIN: TStringField;
    qryPadraoDespFCCICENCUSTCINVEST: TStringField;
    qryPadraoDespFCCICENCUSTDINVEST: TStringField;
    qryPadraoDespFCCICODCENTRORESPON: TStringField;
    qryPadraoDespFCCIUNIDNEGOC: TFloatField;
    qryPadraoDespFCCITIPMOVCARTINV: TStringField;
    qryPadraoDespFCCITIPLANCINVEST: TStringField;
    qryPadraoDespFCCIIDEMPRESA: TFloatField;
    qryPadraoDespTTCIIDPADRLANCCONT: TFloatField;
    qryPadraoDespTTCIIDTIPOINVEST: TFloatField;
    qryPadraoDespTTCIIDTIPOOPERACAO: TFloatField;
    qryPadraoDespTTCICODTIPTITULO: TStringField;
    qryPadraoDespTTCIIDPESSOA: TFloatField;
    qryPadraoDespTTCIIDTIPODESPINVEST: TFloatField;
    qryPadraoDespTTCIRECPAG: TStringField;
    qryPadraoDespTTCIIDFORCLI: TFloatField;
    qryPadraoDespTTCICODTIPRECDES: TStringField;
    qryPadraoDespTTCIIDCARTEIRAINVEST: TFloatField;
    qryPadraoDespTTCICODSUBCONTAC: TFloatField;
    qryPadraoDespTTCICODSUBCONTAD: TFloatField;
    qryPadraoDespTTCIFLGPAGRECNAO: TStringField;
    qryPadraoDespTTCIHISTLANCINVEST: TStringField;
    qryPadraoDespTTCIPLANO: TFloatField;
    qryPadraoDespTTCICONTADOPERFIN: TStringField;
    qryPadraoDespTTCICONTACOPERFIN: TStringField;
    qryPadraoDespTTCICENCUSTCINVEST: TStringField;
    qryPadraoDespTTCICENCUSTDINVEST: TStringField;
    qryPadraoDespTTCICODCENTRORESPON: TStringField;
    qryPadraoDespTTCIUNIDNEGOC: TFloatField;
    qryPadraoDespTTCITIPMOVCARTINV: TStringField;
    qryPadraoDespTTCITIPLANCINVEST: TStringField;
    qryPadraoDespTTCIIDEMPRESA: TFloatField;
    qryPadraoDespTTIDPADRLANCCONT: TFloatField;
    qryPadraoDespTTIDTIPOINVEST: TFloatField;
    qryPadraoDespTTIDTIPOOPERACAO: TFloatField;
    qryPadraoDespTTCODTIPTITULO: TStringField;
    qryPadraoDespTTIDPESSOA: TFloatField;
    qryPadraoDespTTIDTIPODESPINVEST: TFloatField;
    qryPadraoDespTTRECPAG: TStringField;
    qryPadraoDespTTIDFORCLI: TFloatField;
    qryPadraoDespTTCODTIPRECDES: TStringField;
    qryPadraoDespTTIDCARTEIRAINVEST: TFloatField;
    qryPadraoDespTTCODSUBCONTAC: TFloatField;
    qryPadraoDespTTCODSUBCONTAD: TFloatField;
    qryPadraoDespTTFLGPAGRECNAO: TStringField;
    qryPadraoDespTTHISTLANCINVEST: TStringField;
    qryPadraoDespTTPLANO: TFloatField;
    qryPadraoDespTTCONTADOPERFIN: TStringField;
    qryPadraoDespTTCONTACOPERFIN: TStringField;
    qryPadraoDespTTCENCUSTCINVEST: TStringField;
    qryPadraoDespTTCENCUSTDINVEST: TStringField;
    qryPadraoDespTTCODCENTRORESPON: TStringField;
    qryPadraoDespTTUNIDNEGOC: TFloatField;
    qryPadraoDespTTTIPMOVCARTINV: TStringField;
    qryPadraoDespTTTIPLANCINVEST: TStringField;
    qryPadraoDespTTIDEMPRESA: TFloatField;
    qryPadraoDespCIIDPADRLANCCONT: TFloatField;
    qryPadraoDespCIIDTIPOINVEST: TFloatField;
    qryPadraoDespCIIDTIPOOPERACAO: TFloatField;
    qryPadraoDespCICODTIPTITULO: TStringField;
    qryPadraoDespCIIDPESSOA: TFloatField;
    qryPadraoDespCIIDTIPODESPINVEST: TFloatField;
    qryPadraoDespCIRECPAG: TStringField;
    qryPadraoDespCIIDFORCLI: TFloatField;
    qryPadraoDespCICODTIPRECDES: TStringField;
    qryPadraoDespCIIDCARTEIRAINVEST: TFloatField;
    qryPadraoDespCICODSUBCONTAC: TFloatField;
    qryPadraoDespCICODSUBCONTAD: TFloatField;
    qryPadraoDespCIFLGPAGRECNAO: TStringField;
    qryPadraoDespCIHISTLANCINVEST: TStringField;
    qryPadraoDespCIPLANO: TFloatField;
    qryPadraoDespCICONTADOPERFIN: TStringField;
    qryPadraoDespCICONTACOPERFIN: TStringField;
    qryPadraoDespCICENCUSTCINVEST: TStringField;
    qryPadraoDespCICENCUSTDINVEST: TStringField;
    qryPadraoDespCICODCENTRORESPON: TStringField;
    qryPadraoDespCIUNIDNEGOC: TFloatField;
    qryPadraoDespCITIPMOVCARTINV: TStringField;
    qryPadraoDespCITIPLANCINVEST: TStringField;
    qryPadraoDespCIIDEMPRESA: TFloatField;
    qryPadraoDespIDPADRLANCCONT: TFloatField;
    qryPadraoDespIDTIPOINVEST: TFloatField;
    qryPadraoDespIDTIPOOPERACAO: TFloatField;
    qryPadraoDespCODTIPTITULO: TStringField;
    qryPadraoDespIDPESSOA: TFloatField;
    qryPadraoDespIDTIPODESPINVEST: TFloatField;
    qryPadraoDespRECPAG: TStringField;
    qryPadraoDespIDFORCLI: TFloatField;
    qryPadraoDespCODTIPRECDES: TStringField;
    qryPadraoDespIDCARTEIRAINVEST: TFloatField;
    qryPadraoDespCODSUBCONTAC: TFloatField;
    qryPadraoDespCODSUBCONTAD: TFloatField;
    qryPadraoDespFLGPAGRECNAO: TStringField;
    qryPadraoDespHISTLANCINVEST: TStringField;
    qryPadraoDespPLANO: TFloatField;
    qryPadraoDespCONTADOPERFIN: TStringField;
    qryPadraoDespCONTACOPERFIN: TStringField;
    qryPadraoDespCENCUSTCINVEST: TStringField;
    qryPadraoDespCENCUSTDINVEST: TStringField;
    qryPadraoDespCODCENTRORESPON: TStringField;
    qryPadraoDespUNIDNEGOC: TFloatField;
    qryPadraoDespTIPMOVCARTINV: TStringField;
    qryPadraoDespTIPLANCINVEST: TStringField;
    qryPadraoDespIDEMPRESA: TFloatField;
    qryPadraoAtuTTCI: TwwQuery;
    qryPadraoAtuTT: TwwQuery;
    qryPadraoAtuTTIDPADRLANCCONT: TFloatField;
    qryPadraoAtuTTIDTIPOINVEST: TFloatField;
    qryPadraoAtuTTIDTIPOOPERACAO: TFloatField;
    qryPadraoAtuTTCODTIPTITULO: TStringField;
    qryPadraoAtuTTIDPESSOA: TFloatField;
    qryPadraoAtuTTIDTIPODESPINVEST: TFloatField;
    qryPadraoAtuTTRECPAG: TStringField;
    qryPadraoAtuTTIDFORCLI: TFloatField;
    qryPadraoAtuTTCODTIPRECDES: TStringField;
    qryPadraoAtuTTIDCARTEIRAINVEST: TFloatField;
    qryPadraoAtuTTCODSUBCONTAC: TFloatField;
    qryPadraoAtuTTCODSUBCONTAD: TFloatField;
    qryPadraoAtuTTFLGPAGRECNAO: TStringField;
    qryPadraoAtuTTHISTLANCINVEST: TStringField;
    qryPadraoAtuTTPLANO: TFloatField;
    qryPadraoAtuTTCONTADOPERFIN: TStringField;
    qryPadraoAtuTTCONTACOPERFIN: TStringField;
    qryPadraoAtuTTCENCUSTCINVEST: TStringField;
    qryPadraoAtuTTCENCUSTDINVEST: TStringField;
    qryPadraoAtuTTCODCENTRORESPON: TStringField;
    qryPadraoAtuTTUNIDNEGOC: TFloatField;
    qryPadraoAtuTTTIPMOVCARTINV: TStringField;
    qryPadraoAtuTTTIPLANCINVEST: TStringField;
    qryPadraoAtuTTIDEMPRESA: TFloatField;
    qryPadraoAtuTTCIIDPADRLANCCONT: TFloatField;
    qryPadraoAtuTTCIIDTIPOINVEST: TFloatField;
    qryPadraoAtuTTCIIDTIPOOPERACAO: TFloatField;
    qryPadraoAtuTTCICODTIPTITULO: TStringField;
    qryPadraoAtuTTCIIDPESSOA: TFloatField;
    qryPadraoAtuTTCIIDTIPODESPINVEST: TFloatField;
    qryPadraoAtuTTCIRECPAG: TStringField;
    qryPadraoAtuTTCIIDFORCLI: TFloatField;
    qryPadraoAtuTTCICODTIPRECDES: TStringField;
    qryPadraoAtuTTCIIDCARTEIRAINVEST: TFloatField;
    qryPadraoAtuTTCICODSUBCONTAC: TFloatField;
    qryPadraoAtuTTCICODSUBCONTAD: TFloatField;
    qryPadraoAtuTTCIFLGPAGRECNAO: TStringField;
    qryPadraoAtuTTCIHISTLANCINVEST: TStringField;
    qryPadraoAtuTTCIPLANO: TFloatField;
    qryPadraoAtuTTCICONTADOPERFIN: TStringField;
    qryPadraoAtuTTCICONTACOPERFIN: TStringField;
    qryPadraoAtuTTCICENCUSTCINVEST: TStringField;
    qryPadraoAtuTTCICENCUSTDINVEST: TStringField;
    qryPadraoAtuTTCICODCENTRORESPON: TStringField;
    qryPadraoAtuTTCIUNIDNEGOC: TFloatField;
    qryPadraoAtuTTCITIPMOVCARTINV: TStringField;
    qryPadraoAtuTTCITIPLANCINVEST: TStringField;
    qryPadraoAtuTTCIIDEMPRESA: TFloatField;
    updAtualizaSaldoIL: TUpdateSQL;
    qryMoeda: TwwQuery;
    qryMoedaMOEPERIODICIDADE: TStringField;
    qryMoedaFLGPERCVALOR: TStringField;
    qryHistoricoCarteira: TwwQuery;
    qryPadraoOperTIPCODIGO: TStringField;
    QrySaldoInvestimentoNova: TwwQuery;
    qrySaldoCustodia: TwwQuery;
    qrySaldoCustodiaIDCUSTODIA: TFloatField;
    qrySaldoCustodiaSALDOBLOQUEADO: TFloatField;
    qrySaldoCustodiaSALDOLIBERADO: TFloatField;    
    qryPadraoOperCITIPCODIGO: TStringField;
    QryLocal: TwwQuery;
    qryFlgAtualSaldo13: TwwQuery;
    qryFlgAtualSaldo13IDHISTCARTINV: TFloatField;
    qryFlgAtualSaldo13DATAMOVCARTINV: TDateTimeField;
    qryFlgAtualSaldo13IDCARTEIRAINVEST: TFloatField;
    qryFlgAtualSaldo13IDINVESTIMENTO: TFloatField;
    qryFlgAtualSaldo13FLGCALCSALDO: TStringField;
    qryFlgAtualSaldo13NATURMOVCARTINV: TStringField;
    qryFlgAtualSaldo13IDLOTE: TStringField;
    qryFlgAtualSaldo13IDTIPOINVEST: TFloatField;
    qryFlgAtualSaldo13IDDESPOPERINVEST: TFloatField;
    qryFlgAtualSaldo13IDCARTEIRAGERENC: TFloatField;
    qryFlgAtualSaldo2: TwwQuery;
    FloatField1: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField1: TStringField;
    qryFlgAtualSaldo2IDLOTE: TStringField;
    qryFlgAtualSaldo2IDDESPOPERINVEST: TFloatField;
    qryFlgAtualSaldo2IDCARTEIRAGERENC: TFloatField;
    qryAtualizaSaldoILNull: TwwQuery;
    qrySaldoCarteiraNull: TwwQuery;
    DateTimeField4: TDateTimeField;
    FloatField37: TFloatField;
    FloatField38: TFloatField;
    FloatField39: TFloatField;
    FloatField40: TFloatField;
    FloatField41: TFloatField;
    FloatField42: TFloatField;
    qryAtualizaSaldoCNull: TwwQuery;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    StringField3: TStringField;
    FloatField19: TFloatField;
    StringField4: TStringField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    StringField5: TStringField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    StringField6: TStringField;
    StringField7: TStringField;
    FloatField30: TFloatField;
    DateTimeField2: TDateTimeField;
    FloatField31: TFloatField;
    FloatField32: TFloatField;
    FloatField33: TFloatField;
    FloatField34: TFloatField;
    FloatField35: TFloatField;
    FloatField36: TFloatField;
    qryAtualizaSaldoC: TwwQuery;
    qryAtualizaSaldoCIDOPERACAOINVEST: TFloatField;
    qryAtualizaSaldoCSALDOCOTASCARTINV: TFloatField;
    qryAtualizaSaldoCSALDOVLRCARTINV: TFloatField;
    qryAtualizaSaldoCVLRMOVCARTINV: TFloatField;
    qryAtualizaSaldoCCOTASMOVCARTINV: TFloatField;
    qryAtualizaSaldoCIDHISTCARTINV: TFloatField;
    qryAtualizaSaldoCFLGCALCSALDO: TStringField;
    qryAtualizaSaldoCIDDESPOPERINVEST: TFloatField;
    qryAtualizaSaldoCIDINVESTIMENTO: TFloatField;
    qryAtualizaSaldoCNATURMOVCARTINV: TStringField;
    qryAtualizaSaldoCIDLOTE: TStringField;
    qryAtualizaSaldoCIDTIPOOPERACAO: TFloatField;
    qryAtualizaSaldoCFLGCALCDIARIO: TFloatField;
    qryAtualizaSaldoCNATURMOVOPER: TStringField;
    qryAtualizaSaldoCTIPMOVCARTINV: TStringField;
    qryAtualizaSaldoCQTDEMOVINVCART: TFloatField;
    qryAtualizaSaldoCDATAMOVCARTINV: TDateTimeField;
    qryAtualizaSaldoCIDCARTEIRAINVEST: TFloatField;
    qryAtualizaSaldoCIDTIPOINVEST: TFloatField;
    qryAtualizaSaldoCIDTIPODESPINVEST: TFloatField;
    qryAtualizaSaldoCMOVIMAQUI: TFloatField;
    qryAtualizaSaldoCIDTIPOOPERHIST: TFloatField;
    qryAtualizaSaldoCIDCARTEIRAGERENC: TFloatField;
    qryAtualizaSaldoIL: TwwQuery;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    StringField14: TStringField;
    StringField15: TStringField;
    qryAtualizaSaldoILDATAMOVCARTINV: TDateTimeField;
    qryAtualizaSaldoILTIPMOVCARTINV: TStringField;
    qryAtualizaSaldoILSALDOATU: TFloatField;
    qryAtualizaSaldoILMOVIMCAR: TFloatField;
    qryAtualizaSaldoILSALDOCAR: TFloatField;
    qryAtualizaSaldoILSALDOAQUI: TFloatField;
    qryAtualizaSaldoILSALDOREND: TFloatField;
    qryAtualizaSaldoILMOVIMAQUI: TFloatField;
    qryAtualizaSaldoILQTDEMOVINVCART: TFloatField;
    qryAtualizaSaldoILIDDESPOPERINVEST: TFloatField;
    qryAtualizaSaldoILIDTIPOOPERACAO: TFloatField;
    qryAtualizaSaldoILFLGCALCDIARIO: TFloatField;
    qryAtualizaSaldoILNATURMOVOPER: TStringField;
    qryAtualizaSaldoILMOVIMATU: TFloatField;
    qryAtualizaSaldoILIDCARTEIRAINVEST: TFloatField;
    qryAtualizaSaldoILIDINVESTIMENTO: TFloatField;
    qryAtualizaSaldoILIDLOTE: TStringField;
    qryAtualizaSaldoILVLRJUROS: TFloatField;
    qryAtualizaSaldoILVLRVARIACAO: TFloatField;
    qryAtualizaSaldoILVLRAGIO: TFloatField;
    qryAtualizaSaldoILVLRIRPROV: TFloatField;
    qryAtualizaSaldoILVLRIRAPU: TFloatField;
    qryAtualizaSaldoILVLRIOFPROV: TFloatField;
    qryAtualizaSaldoILVLRIOFAPU: TFloatField;
    qryAtualizaSaldoILTIPOOPERACAO: TFloatField;
    qryAtualizaSaldoILIDTIPOINVEST: TFloatField;
    qryAtualizaSaldoILIDTIPODESPINVEST: TFloatField;
    qryAtualizaSaldoILIDTIPOOPERHIST: TFloatField;
    qryAtualizaSaldoILIDCARTEIRAGERENC: TFloatField;
    qrySaldoCarteira: TwwQuery;
    qrySaldoCarteiraDATAMOVCARTINV: TDateTimeField;
    qrySaldoCarteiraIDCARTEIRAINVEST: TFloatField;
    qrySaldoCarteiraSALDOCOTASCARTINV: TFloatField;
    qrySaldoCarteiraSALDOVLRCARTINV: TFloatField;
    qrySaldoCarteiraSALDOQTDEINVCART: TFloatField;
    qrySaldoCarteiraSALDOVLRINVCART: TFloatField;
    qrySaldoCarteiraIDHISTCARTINV: TFloatField;
    QryBuscaSaldoNova: TwwQuery;
    QryBuscaSaldoNovaIDHISTCARTINV: TFloatField;
    QryBuscaSaldoNovaTIPMOVCARTINV: TStringField;
    QryBuscaSaldoNovaIDCARTEIRAINVEST: TFloatField;
    QryBuscaSaldoNovaDATAMOVCARTINV: TDateTimeField;
    QryBuscaSaldoNovaSALDOCOTASCARTINV: TFloatField;
    QryBuscaSaldoNovaSALDOVLRCARTINV: TFloatField;
    QryBuscaSaldoNovaSALDOQTDEINVCART: TFloatField;
    QryBuscaSaldoNovaSALDOVLRINVCART: TFloatField;
    QryBuscaSaldoNovaSALDOATU: TFloatField;
    QryBuscaSaldoNovaSALDOCAR: TFloatField;
    QryBuscaSaldoNovaSALDOAQUI: TFloatField;
    QryBuscaSaldoNovaSALDOREND: TFloatField;
    qryInsOperCustodia: TwwQuery;
    qryUpdOperCustodia: TwwQuery;
    qryBuscaAplicacaoRF: TwwQuery;
    qryBuscaAplicacaoRFIDOPERACAOINVEST: TFloatField;
    qryBuscaAplicacaoRFPUMERCADO: TFloatField;
    qryBuscaAplicacaoRFPRECOUNITOPERACAO: TFloatField;
    qryBuscaAplicacaoRFDATAOPERACAO: TDateTimeField;
    qryHistCustodia: TwwQuery;
    QryBuscaOperPendentes: TwwQuery;
    qryAtualizaSaldoILFLGCONTAINVEST: TFloatField;
    qryFlgAtualSaldo2IDPLANPREVCTBPATR: TFloatField;

    procedure dtmOperacaoInvestDestroy(Sender: TObject);


  private { Private declarations }

  public { Public declarations }

  end;



var
  dtmOperacaoInvest: TdtmOperacaoInvest;


implementation
{$R *.DFM}



procedure TdtmOperacaoInvest.dtmOperacaoInvestDestroy(Sender: TObject);
begin
    qryPadraoOperFCTTCI.Close;
    qryPadraoOperFCTTCI.UnPrepare;

    qryPadraoOperFCTT.Close;
    qryPadraoOperFCTT.UnPrepare;

    qryPadraoOperFCCI.Close;
    qryPadraoOperFCCI.UnPrepare;

    qryPadraoOperTTCI.Close;
    qryPadraoOperTTCI.UnPrepare;

    qryPadraoOperFC.Close;
    qryPadraoOperFC.UnPrepare;

    qryPadraoOperTT.Close;
    qryPadraoOperTT.UnPrepare;

    qryPadraoOperCI.Close;
    qryPadraoOperCI.UnPrepare;

    qryPadraoOper.Close;
    qryPadraoOper.UnPrepare;

    qryPadraoDespFCTTCI.Close;
    qryPadraoDespFCTTCI.UnPrepare;

    qryPadraoDespFCTT.Close;
    qryPadraoDespFCTT.UnPrepare;

    qryPadraoDespFCCI.Close;
    qryPadraoDespFCCI.UnPrepare;

    qryPadraoDespTTCI.Close;
    qryPadraoDespTTCI.UnPrepare;

    qryPadraoDespFC.Close;
    qryPadraoDespFC.UnPrepare;

    qryPadraoDespTT.Close;
    qryPadraoDespTT.UnPrepare;

    qryPadraoDespCI.Close;
    qryPadraoDespCI.UnPrepare;

    qryPadraoDesp.Close;
    qryPadraoDesp.UnPrepare;

    qryHistoricoCarteira.Close;
    qryHistoricoCarteira.UnPrepare;

    qrySaldoCarteira.Close;
    qrySaldoCarteira.UnPrepare;

    qryFlgAtualSaldo13.Close;
    qryFlgAtualSaldo13.UnPrepare;

    qryFlgAtualSaldo2.Close;
    qryFlgAtualSaldo2.UnPrepare;

    qryAtualizaSaldoC.Close;
    qryAtualizaSaldoC.UnPrepare;

    qryAtualizaSaldoIL.Close;
    qryAtualizaSaldoIL.UnPrepare;

    qryMoeda.Close;
    qryMoeda.UnPrepare;

    qrySaldoCustodia.Close;
    qrySaldoCustodia.UnPrepare;

    qryHistCustodia.Close;
    qryHistCustodia.UnPrepare;

    qryTipoOperacao.Close;
    qryTipoOperacao.UnPrepare;

    qryLancaDocumento.Close;
    qryLancaDocumento.UnPrepare;

    qryAuxiliar.Close;
    qryAuxiliar.UnPrepare;

    qryDespXTipoOper.Close;
    qryDespXTipoOper.UnPrepare;

    qryIntegraContab.Close;
    qryIntegraContab.UnPrepare;

    qryBuscaCli.Close;
    qryBuscaCli.UnPrepare;

    qryBuscaForn.Close;
    qryBuscaForn.UnPrepare;

    qryVerificaConta.Close;
    qryVerificaConta.UnPrepare;
end;

end.




