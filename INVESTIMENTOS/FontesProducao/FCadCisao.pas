//******************************************************************************
// Data      : 20/07/2007
// Código    : AL_13
// Pendencia : 25194
// SOL       : 53035
// Desc      : Implementação de critica para NÃO gerar o recebimento para
//              Carteiras Gerenciais conforme parametrização
//******************************************************************************
// Data      : 01/06/2007
// Código    : AL_12
// Pendencia : 24388
// SOL       : 53035
// Desc      : Acerto na filtragem das Carteiras para não trazer Carteiras Gerenciais
//             quando Parâmetro de integração com Carteira Gerencial estiver desmarcado.
//             (QrySaldoOrigem, qryOrigem, qryDestino, qryCarteiraRec e qryCarteiraOrig)
//******************************************************************************
// Data      : 13/02/2007
// Código    : AL_10
// Pendencia : 24464
// Desc      : Passa a não gravar o ID do HistCartInv nas OperCustodia
//             Obs. No reprocessamento já não gravava.
//******************************************************************************
// Data      : 27/10/2006
// Código    : AL_9
// Pendencia : 22981
// Desc      : Segregação de Planos
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_8
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_6
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//*****************************************************************************
//Data	    : 06/03/2006
//Código    : Al_4
//Motivo(S) : Implementação da trava de fechamento de renda variavel
//******************************************************************************
//Data      : 10/01/2006
//Código    : Al_3
//Motivo(S) : Ajuste para tratamento de operações que diminuam o saldo origem
//               quanto que não alteram o saldo do Origem assim como seus percentuais
//******************************************************************************
//Data      : 26/12/2005
//Código    : Al_2
//Motivo(S) : Ajustes gerais para funcionar para a operação de 01/11 especificamente
//******************************************************************************
//Data	     : 28/10/2005
//Código    : Al_1
//Motivo(S) : Atualiza a Boleta com Planilha e Documento
//******************************************************************************
// Data     : 14/10/2005
//******************************************************************************

unit FCadCisao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMDetCSInv, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  fcLabel, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, DBCtrls, FCadastroRMDetCSInv, Mask,
  FCadMestreDetCSInv, faMensagem, dxCntner, dxEditor, dxExEdtr, dxEdLib,
  dxDBELib, uCtrlInvContab,
  //AL_9
  uCtrlRendaVariavel, uCtrlPadroes, Provider, DBClient, uCMClientDataSet;

type
  TFrmCadCisao = class(TfrmCadMestreDetalheCSInv)
    tbsOrigem: TTabSheet;
    dbgProvisao: TwwDBGrid;
    pnlDetProvisao: TPanel;
    tbsDestino: TTabSheet;
    Label1: TLabel;
    dblCarteiraProvisao: TwwDBLookupCombo;
    Label2: TLabel;
    dbrQtdProv: TDBRealEdit;
    Label11: TLabel;
    dblCustodianteProv: TwwDBLookupCombo;
    Label12: TLabel;
    dbgRecebimento: TwwDBGrid;
    pnlDetRecebimento: TPanel;
    Label18: TLabel;
    dblInvestimento: TwwDBLookupCombo;
    qryOrigem: TwwQuery;
    updOrigem: TUpdateSQL;
    dsOrigem: TwwDataSource;
    qryDestino: TwwQuery;
    updDestino: TUpdateSQL;
    dsDestino: TwwDataSource;
    qryDESCTIPOOPERACAO: TStringField;
    qryDESCTIPOOPERACAORESG: TStringField;
    qryIDOPERACAODIREITO: TFloatField;
    qryINVORIGEM: TFloatField;
    qryDATAAGE: TDateTimeField;
    qryDATAEX: TDateTimeField;
    qryDATACOM: TDateTimeField;
    qryPERCENTUAL: TFloatField;
    qryPARIDADE: TFloatField;
    qryPRZBOLSA: TDateTimeField;
    qryPRZEMPRESA: TDateTimeField;
    qryATADECISAO: TDateTimeField;
    qryFORMAPAGREC: TStringField;
    qryDIVPORACAO: TFloatField;
    qryINIPAGTO: TDateTimeField;
    qryJUROSCAP: TStringField;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryIDEMISSOR: TFloatField;
    qryOBSERVACAO: TMemoField;
    qryISENCAOIR: TStringField;
    qryIRLITIGIO: TStringField;
    qrySTATUS: TStringField;
    qryPLANO: TFloatField;
    qryPLNCODIGO: TFloatField;
    qryCODDOCUMENTO: TFloatField;
    qryQTDEACOESDIRPROV: TFloatField;
    qryQTDERECDIRPARC: TFloatField;
    qryDATAOPER: TDateTimeField;
    qryFLGTIPODIREITO: TStringField;
    QryEmissor: TwwQuery;
    QryEmissorIDEMISSOR: TFloatField;
    QryEmissorSIGLAEMISSOR: TStringField;
    qryTipoDireito: TwwQuery;
    qryTipoDireitoFLGTIPODIREITO: TStringField;
    qryTipoDireitoDESCRICAO: TStringField;
    qryDetalheIDOPERDIREITOXINV: TFloatField;
    qryDetalheIDINVESTIMENTO: TFloatField;
    qryDetalheIDOPERACAODIREITO: TFloatField;
    qryDetalheORIGDEST: TStringField;
    qryInvestimentoAcao: TwwQuery;
    qryInvestimentoAcaoIDINVESTIMENTO: TFloatField;
    qryInvestimentoAcaoDESCINVESTIMENTO: TStringField;
    qryInvestimentoAcaoIDTIPOINVEST: TFloatField;
    qryInvestimentoAcaoIDEMISSOR: TFloatField;
    qryInvestimentoAcaoIDMOEDACONTAB: TFloatField;    
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
    qryDetalheDESCINVESTIMENTO: TStringField;
    QryBuscaOperDireito: TwwQuery;
    QrySaldoOrigem: TwwQuery;
    UpdSaldoOrigem: TUpdateSQL;
    qryTipoOperacaoIDMERCADO: TFloatField;
    qryTipoOperacaoFLGTRATAIR: TStringField;
    qryTipoOperacaoTIPCREDOR: TStringField;
    qryTipoOperacaoRECPAG: TStringField;
    QryBuscaBolsaValores: TwwQuery;
    qryAcoesxBolsa: TwwQuery;
    qryTipoOperacaoVENCIMENTO: TFloatField;
    qryOrigemNUMDOCUMENTO: TStringField;
    qryOrigemDESCINVESTIMENTO: TStringField;
    qryOrigemDESCCARTINVEST: TStringField;
    qryOrigemQTDEOPERACAO: TFloatField;
    qryOrigemVLROPERACAO: TFloatField;
    qryOrigemVLRIRREMUNER: TFloatField;
    qryOrigemVLRIR: TFloatField;
    qryOrigemVLRLIQUIDO: TFloatField;
    qryOrigemSGLCUSTODIANTE: TStringField;
    qryOrigemSIGLAMOTBLOQ: TStringField;
    qryOrigemDATABASE: TDateTimeField;
    qryOrigemIDOPERACAOINVEST: TFloatField;
    qryOrigemMOECODIGO: TFloatField;
    qryOrigemIDMODULO: TFloatField;
    qryOrigemORIGDEST: TStringField;
    qryOrigemEMPRESAPROP: TFloatField;
    qryOrigemIDINVESTIMENTO: TFloatField;
    qryOrigemIDCARTEIRAINVEST: TFloatField;
    qryOrigemIDTIPOINVEST: TFloatField;
    qryOrigemIDTIPOOPERACAO: TFloatField;
    qryOrigemDATAOPERACAO: TDateTimeField;
    qryOrigemNUMDOCUMENTO_1: TStringField;
    qryOrigemPRECOUNITOPERACAO: TFloatField;
    qryOrigemDATAVENCOPER: TDateTimeField;
    qryOrigemIDFORCLI: TFloatField;
    qryOrigemIDLOTE: TStringField;
    qryOrigemIDCUSTODIANTE: TFloatField;
    qryOrigemFLGSTATUSFECHBOL: TStringField;
    qryOrigemFLGSTATUSORDMOV: TStringField;
    qryOrigemIDOPERACAODIREITO: TFloatField;
    qryOrigemVLRREMUNERACAO: TFloatField;
    qryOrigemPERCENTUAL: TFloatField;
    qryOrigemIDCARTEIRAGERENC: TFloatField;
    qryOrigemIDPLANPREVCTBPATR: TFloatField;
    qryOrigemIDOPERCUSTODIA: TFloatField;
    qryOrigemIDCUSTORIG: TFloatField;
    Label39: TLabel;
    dbeBoletaProv: TDBEdit;
    qryIDPEDIDOFUNDO: TFloatField;
    qryQTDDIREITO: TFloatField;
    qryBoleta: TwwQuery;
    qryBoletaIDBOLETA: TStringField;
    qryBoletaSTATUS: TStringField;
    qryBoletaDATABOLETA: TDateTimeField;
    qryBoletaTIPMOVBOLETA: TStringField;
    updBoleta: TUpdateSQL;
    dblMotivoBloqueioProv: TwwDBLookupCombo;
    qryCarteiraOrig: TwwQuery;
    qryCarteiraOrigDESCCARTINVEST: TStringField;
    qryCarteiraOrigIDCARTEIRAINVEST: TFloatField;
    qryCarteiraOrigIDCARTEIRAGERENC: TFloatField;
    qryCustodianteOrig: TwwQuery;
    qryMotBloqOrig: TwwQuery;
    qryCustodianteOrigIDCUSTODIANTE: TFloatField;
    qryCustodianteOrigSGLCUSTODIANTE: TStringField;
    qryMotBloqOrigIDMOTIVOBLOQUEIO: TFloatField;
    qryMotBloqOrigSIGLAMOTBLOQ: TStringField;
    qryMotBloqOrigDESCMOTBLOQ: TStringField;
    dblTipoOperProv: TwwDBLookupCombo;
    Label17: TLabel;
    qryTipoOperOrig: TwwQuery;
    qryTipoOperOrigIDTIPOINVEST: TFloatField;
    qryTipoOperOrigIDTIPOOPERACAO: TFloatField;
    qryTipoOperOrigIDMERCADO: TFloatField;
    qryTipoOperOrigCODTIPDOC: TFloatField;
    qryTipoOperOrigDESCTIPOOPERACAO: TStringField;
    qryTipoOperOrigNATUREZAOPERACAO: TStringField;
    qryTipoOperOrigTIPOCUSTODIA: TStringField;
    qryTipoOperOrigVENCIMENTO: TFloatField;
    qryTipoOperOrigFLGGERACONTAB: TFloatField;
    qryTipoOperOrigFLGGERACAPCAR: TFloatField;
    qryTipoOperOrigRECPAG: TStringField;
    qryTipoOperOrigTIPCREDOR: TStringField;
    qryTipoOperOrigFLGGERACAF: TFloatField;
    qryTipoOperOrigFLGTRANSF: TStringField;
    qryTipoOperOrigTRGDTINCLUSAO: TDateTimeField;
    qryTipoOperOrigTRGUSERINCLUSAO: TStringField;
    qryTipoOperOrigFLGCORRET: TStringField;
    qryTipoOperOrigFLGORDMOVINV: TStringField;
    qryTipoOperOrigIDMOTIVOBLOQUEIO: TFloatField;
    qryTipoOperOrigFLGOPDIREITO: TStringField;
    qryTipoOperOrigFLGAGE: TStringField;
    qryTipoOperOrigFLGDATAEX: TStringField;
    qryTipoOperOrigFLGDATACOM: TStringField;
    qryTipoOperOrigFLGINVORIGEM: TStringField;
    qryTipoOperOrigFLGPERC: TStringField;
    qryTipoOperOrigFLGPARIDADE: TStringField;
    qryTipoOperOrigFLGPRZBOLSA: TStringField;
    qryTipoOperOrigFLGPRZEMP: TStringField;
    qryTipoOperOrigFLGATADEC: TStringField;
    qryTipoOperOrigFLGFORMAPAGREC: TStringField;
    qryTipoOperOrigFLGDIVACAO: TStringField;
    qryTipoOperOrigFLGINIPAG: TStringField;
    qryTipoOperOrigFLGJUROS: TStringField;
    qryTipoOperOrigMOTBLOQCARTORIG: TFloatField;
    qryTipoOperOrigMOTBLOQCARTDEST: TFloatField;
    qryTipoOperOrigTIPSALDOCARTORIG: TStringField;
    qryTipoOperOrigTIPSALDOCARTDEST: TStringField;
    qryTipoOperOrigFLGTRATAIR: TStringField;
    qryTipoOperOrigSIGLATIPOOPER: TStringField;
    qryTipoOperOrigFLGISENTOIR: TStringField;
    qryTipoOperOrigFLGGRAVAIRLITIGIO: TStringField;
    qryTipoOperOrigFLGOPGERENC: TStringField;
    qryTipoOperOrigTIPOMOVTO: TStringField;
    qryTipoOperOrigSTAATIVO: TStringField;
    qryTipoOperOrigFLGRENTABILIDADE: TStringField;
    qryTipoOperOrigFLGCONTAINVEST: TFloatField;
    qryTipoOperOrigFLGMOVCOTA: TStringField;
    qryTipoOperOrigFLGCOTARECDES: TStringField;
    qryTipoOperOrigFLGDATAVENCIMENTO: TStringField;
    qryOrigemDESCTIPOOPERACAO: TStringField;
    qryBoletaIDFORCLI: TFloatField;
    qryBoletaPLANO: TFloatField;
    qryBoletaPLNCODIGO: TFloatField;
    qryBoletaCODDOCUMENTO: TFloatField;
    qryOrigemIDMOTIVOBLOQUEIO: TFloatField;
    qryHistCartInv: TwwQuery;
    updHistCartInv: TUpdateSQL;
    qryHistCartInvIDHISTCARTINV: TFloatField;
    qryHistCartInvIDTIPOOPERACAO: TFloatField;
    qryHistCartInvDATAMOVCARTINV: TDateTimeField;
    qryHistCartInvHISTMOVCARTINV: TStringField;
    qryHistCartInvIDOPERACAOINVEST: TFloatField;
    qryOrigemNATUREZAOPERACAO: TStringField;
    qryDestinoNUMDOCUMENTO: TStringField;
    qryDestinoDESCINVESTIMENTO: TStringField;
    qryDestinoDESCTIPOOPERACAO: TStringField;
    qryDestinoDESCCARTINVEST: TStringField;
    qryDestinoQTDEOPERACAO: TFloatField;
    qryDestinoVLROPERACAO: TFloatField;
    qryDestinoVLRIRREMUNER: TFloatField;
    qryDestinoVLRIR: TFloatField;
    qryDestinoVLRLIQUIDO: TFloatField;
    qryDestinoSGLCUSTODIANTE: TStringField;
    qryDestinoSIGLAMOTBLOQ: TStringField;
    qryDestinoDATABASE: TDateTimeField;
    qryDestinoIDOPERACAOINVEST: TFloatField;
    qryDestinoMOECODIGO: TFloatField;
    qryDestinoIDMODULO: TFloatField;
    qryDestinoORIGDEST: TStringField;
    qryDestinoEMPRESAPROP: TFloatField;
    qryDestinoIDINVESTIMENTO: TFloatField;
    qryDestinoIDCARTEIRAINVEST: TFloatField;
    qryDestinoIDTIPOINVEST: TFloatField;
    qryDestinoIDTIPOOPERACAO: TFloatField;
    qryDestinoDATAOPERACAO: TDateTimeField;
    qryDestinoNUMDOCUMENTO_1: TStringField;
    qryDestinoPRECOUNITOPERACAO: TFloatField;
    qryDestinoDATAVENCOPER: TDateTimeField;
    qryDestinoIDFORCLI: TFloatField;
    qryDestinoIDLOTE: TStringField;
    qryDestinoIDCUSTODIANTE: TFloatField;
    qryDestinoFLGSTATUSFECHBOL: TStringField;
    qryDestinoFLGSTATUSORDMOV: TStringField;
    qryDestinoIDOPERACAODIREITO: TFloatField;
    qryDestinoVLRREMUNERACAO: TFloatField;
    qryDestinoPERCENTUAL: TFloatField;
    qryDestinoIDCARTEIRAGERENC: TFloatField;
    qryDestinoIDPLANPREVCTBPATR: TFloatField;
    qryDestinoIDOPERCUSTODIA: TFloatField;
    qryDestinoIDCUSTORIG: TFloatField;
    qryDestinoIDMOTIVOBLOQUEIO: TFloatField;
    qryDestinoNATUREZAOPERACAO: TStringField;
    qryBoletaEXCLUIBOLETA: TStringField;
    qryAuxiliar: TwwQuery;
    bbtnGeraOperacoes: TToolbarButton97;
    qryCarteiraRec: TwwQuery;
    qryCustodianteRec: TwwQuery;
    qryMotBloqRec: TwwQuery;
    qryTipoOperRec: TwwQuery;
    Label15: TLabel;
    dbeBoletaRec: TDBEdit;
    Label20: TLabel;
    dblTipoOperRec: TwwDBLookupCombo;
    Label19: TLabel;
    Label21: TLabel;
    dblCustodianteRec: TwwDBLookupCombo;
    dblMotivoBloqueioRec: TwwDBLookupCombo;
    Label22: TLabel;
    Label23: TLabel;
    dbrQtdRec: TDBRealEdit;
    qryTipoOperRecFLGAGE: TStringField;
    qryTipoOperRecFLGDATAEX: TStringField;
    qryTipoOperRecFLGDATACOM: TStringField;
    qryTipoOperRecFLGPRZBOLSA: TStringField;
    qryTipoOperRecFLGPRZEMP: TStringField;
    qryTipoOperRecFLGATADEC: TStringField;
    qryTipoOperRecFLGFORMAPAGREC: TStringField;
    qryTipoOperRecFLGDIVACAO: TStringField;
    qryTipoOperRecFLGINIPAG: TStringField;
    qryTipoOperRecFLGJUROS: TStringField;
    qryTipoOperRecFLGPARIDADE: TStringField;
    qryTipoOperRecFLGINVORIGEM: TStringField;
    qryTipoOperRecFLGPERC: TStringField;
    qryTipoOperRecDESCTIPOOPERACAO: TStringField;
    qryTipoOperRecIDTIPOOPERACAO: TFloatField;
    qryTipoOperRecIDTIPOINVEST: TFloatField;
    qryTipoOperRecFLGGRAVAIRLITIGIO: TStringField;
    qryTipoOperRecFLGISENTOIR: TStringField;
    qryTipoOperRecNATUREZAOPERACAO: TStringField;
    qryTipoOperRecIDMERCADO: TFloatField;
    qryTipoOperRecFLGTRATAIR: TStringField;
    qryTipoOperRecTIPCREDOR: TStringField;
    qryTipoOperRecRECPAG: TStringField;
    qryTipoOperRecVENCIMENTO: TFloatField;
    qryCarteiraRecIDCARTEIRAINVEST: TFloatField;
    qryCarteiraRecIDCARTEIRAGERENC: TFloatField;
    qryCarteiraRecDESCCARTINVEST: TStringField;
    qryCustodianteRecIDCUSTODIANTE: TFloatField;
    qryCustodianteRecSGLCUSTODIANTE: TStringField;
    qryMotBloqRecIDMOTIVOBLOQUEIO: TFloatField;
    qryMotBloqRecSIGLAMOTBLOQ: TStringField;
    qryMotBloqRecDESCMOTBLOQ: TStringField;
    dbdDataOperacaoRec: TCMDateTimePicker;
    Label29: TLabel;
    qryBoletaCONTACCI: TFloatField;
    qryOrigemIDCARTEIRA: TStringField;
    qryCarteiraOrigIDCARTEIRA: TStringField;
    qryDestinoIDCARTEIRA: TStringField;
    qryCarteiraRecIDCARTEIRA: TStringField;
    dblCarteiraRec: TwwDBLookupCombo;
    qryDestinoIDOPERACAOORIGEM: TFloatField;
    qryOrigemQTDEEXERCIDA: TFloatField;
    qryOrigemALTERADO: TStringField;
    qryDestinoALTERADO: TStringField;
    dblOrigDest: TwwDBLookupCombo;
    Label13: TLabel;
    qryOrigDestino: TwwQuery;
    qryOrigDestinoORIGDEST: TStringField;
    qryOrigDestinoDESCRICAO: TStringField;
    qryDetalheDESCRICAO: TStringField;
    QrySaldoOrigemDESCINVESTIMENTO: TStringField;
    QrySaldoOrigemDESCCARTINVEST: TStringField;
    QrySaldoOrigemSGLCUSTODIANTE: TStringField;
    QrySaldoOrigemSIGLAMOTBLOQ: TStringField;
    QrySaldoOrigemIDLOTE: TStringField;
    QrySaldoOrigemDATAREFERENCIA: TDateTimeField;
    QrySaldoOrigemQTDE: TFloatField;
    QrySaldoOrigemQTDEDIREITO: TFloatField;
    QrySaldoOrigemVALOREXERCIDO: TFloatField;
    QrySaldoOrigemVLRREMUNERACAO: TFloatField;
    QrySaldoOrigemIR: TFloatField;
    QrySaldoOrigemVLRLIQ: TFloatField;
    QrySaldoOrigemVLRIRREMUNERACAO: TFloatField;
    QrySaldoOrigemVLRCUSTOATUAL: TFloatField;
    QrySaldoOrigemVLRCUSTO: TFloatField;
    QrySaldoOrigemIDCARTEIRAINVEST: TFloatField;
    QrySaldoOrigemIDCARTEIRAGERENC: TFloatField;
    QrySaldoOrigemIDINVESTIMENTO: TFloatField;
    QrySaldoOrigemIDCUSTODIANTE: TFloatField;
    QrySaldoOrigemIDCARTEIRA: TStringField;
    QrySaldoOrigemIDMOTIVOBLOQUEIO: TFloatField;
    QrySaldoOrigemIDCUSTODIA: TFloatField;
    QrySaldoOrigemQTDTITLOTE: TFloatField;
    qryTipoOperacaoFLGGERACONTAB: TFloatField;
    qryTipoOperacaoFLGGERACAPCAR: TFloatField;
    dbrVlrRec: TDBRealEdit;
    Label24: TLabel;
    Label7: TLabel;
    qryInvestimentoAcaoQTDTITLOTE: TFloatField;
    pgcAge: TPageControl;
    tbsObservacao: TTabSheet;
    dbmObservacao: TDBMemo;
    TbsDireitos: TTabSheet;
    dbdCOM: TCMDateTimePicker;
    Label6: TLabel;
    dbdOper: TCMDateTimePicker;
    Label16: TLabel;
    dbdEX: TCMDateTimePicker;
    Label5: TLabel;
    dbdAGE: TCMDateTimePicker;
    Label4: TLabel;
    dblEmissor: TwwDBLookupCombo;
    Label3: TLabel;
    dblTipoOperacao: TwwDBLookupCombo;
    Label28: TLabel;
    qryTipoOperacaoFLGDATAVENCIMENTO: TStringField;
    qryDATAVENCIMENTO: TDateTimeField;
    qryDetalhePERCENTUALINV: TFloatField;
    DbrPercentual: TDBRealEdit;
    Label8: TLabel;
    qryOrigemVLRCUSTOATUAL: TFloatField;
    qryOrigemVLRVARIACAOATUAL: TFloatField;
    qryDestinoVLRCUSTOATUAL: TFloatField;
    qryDestinoVLRVARIACAOATUAL: TFloatField;
    dbrVlrVariacaoRec: TDBRealEdit;
    Label25: TLabel;
    dbrVlrCustoRec: TDBRealEdit;
    Label9: TLabel;
    Label10: TLabel;
    dbrVlrCustoProv: TDBRealEdit;
    dbrVlrVariacaoProv: TDBRealEdit;
    Label14: TLabel;
    dbrVlrProv: TDBRealEdit;
    QrySaldoOrigemVLRVARIACAOATUAL: TFloatField;
    QrySaldoOrigemPLANPRVCONTABPATRO: TStringField;
    QrySaldoOrigemIDPLANPREVCTBPATR: TFloatField;
    QrySaldoOrigemORDEM: TStringField;
    qryOrigemPLANPRVCONTABPATRO: TStringField;
    qryOrigemFLGCONTAINVEST: TFloatField;
    qryDestinoPLANPRVCONTABPATRO: TStringField;
    qryDestinoFLGCONTAINVEST: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure dsOrigemStateChange(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure dbrQtdProvExit(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure bbtnGeraOperacoesClick(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure dblCarteiraRecExit(Sender: TObject);
    procedure dblCarteiraProvisaoExit(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure dbdDataOperacaoRecExit(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeDetalheApplyInsert(sender: TObject; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure dbdCOMExit(Sender: TObject);
    procedure DbrPercentualExit(Sender: TObject);
    procedure dbrVlrVariacaoProvExit(Sender: TObject);
    procedure dbrVlrVariacaoRecExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    //AL_9
    CtrlRV: TCtrlRendaVariavel;    

    procedure Sel(iOper: Integer; bSelAGE: Boolean = True; bSelInv: Boolean = True);
    procedure SelDetInv(iOper: Integer);
    procedure SelDetOrig(iOper: Integer);
    procedure SelDetDest(iOper: Integer);
    procedure HabDetOrig(bAcao:Boolean);
    procedure HabDetDest (bAcao: Boolean);
    procedure FornecedorCli(wIdCustodiante, iInvestimento: Integer;
                            var wIdForCli: Integer);
    procedure CalculaVlrLiq(Origem: String = 'O');

    function  TestaOperacaoExitente: Boolean;
    function  GeraOrigem : Boolean;
    function  GeraDestino: Boolean;
    function  BuscaBoleta(dData: TDateTime; wIDForCli: Integer): String;
    function  CalcVenc(dDataOper: TDateTime; iPrazo: Integer): TDateTime;
    function  AchaOrigem(iInvest, iCartInvest, iCartGerenc, iCustodiante, iMotBloq: Integer): Boolean;
    function  VerificaInvestimentos : Boolean;    
  public
    { Public declarations }
  end;

var
  FrmCadCisao: TFrmCadCisao;
  wSdoQtdCPMF, wSaldoQtd, wSaldoVlr, wSaldoIRApu, wSaldoInutil, wSaldoAqui, wSaldoVar,
  wQtdOperAnt : Double;
  wOrigem, wDestino: Boolean;

implementation

uses UOperComum, uMensErro, DBaseDados, UDataBase, uDocumento, uSistema,
     UBibliotecaInvest, UImpostos, UDiasUteisInv, URendaVariavel,
     dRendaVariavel, UCotaComum, UProvisaoComum, ULancContab, UCaixaComum,
     UOperacaoInvest;

{$R *.DFM}

procedure TFrmCadCisao.Sel(iOper: Integer;
                                bSelAGE: Boolean = True;
                                bSelInv: Boolean = True);
begin
   if bSelAGE then
   begin
      OperComum.LimpaParametros(qry);
      qry.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
      qry.Open;
   end;

   OperComum.LimpaParametros(qryBoleta);
   qryBoleta.ParamByName('IDOPERACAODIREITO').AsInteger      := iOper;
   qryBoleta.Open;

   OperComum.LimpaParametros(qryHistCartInv);
   qryHistCartInv.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
   qryHistCartInv.Open;

   OperComum.LimpaParametros(QryInvestimentoAcao);
   QryInvestimentoAcao.Open;

   if bSelInv then
      SelDetInv(iOper);

   SelDetOrig(iOper);

   SelDetDest(iOper);

   // Habilita componentes do Cadastro Pai
   dblEmissor.Enabled      := True;
   dblTipoOperacao.Enabled := True;
   dbdAGE.Enabled          := True;
   dbdEX.Enabled           := True;
   dbdOper.Enabled         := True;
   dbdCOM.Enabled          := True;

end;

procedure TFrmCadCisao.SelDetInv(iOper: Integer);
begin
    OperComum.LimpaParametros(qryDetalhe);
    qryDetalhe.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryDetalhe.Open
end;

procedure TFrmCadCisao.SelDetOrig(iOper: Integer);
begin
    //AL_13
    OperComum.LimpaParametros(qryCarteiraOrig);
    qryCarteiraOrig.ParamByName('DATALIMGER').AsString  := qryDATAEX.AsString;
    qryCarteiraOrig.Open;
    //AL_12
    OperComum.LimpaParametros(qryOrigem);
    qryOrigem.ParamByName('DATAEX').AsString  := qryDATAEX.AsString;
    qryOrigem.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryOrigem.Open
end;

procedure TFrmCadCisao.SelDetDest(iOper: Integer);
begin
    //AL_13
    OperComum.LimpaParametros(qryCarteiraRec);
    qryCarteiraRec.ParamByName('DATALIMGER').AsString  := qryDATAOPER.AsString;
    qryCarteiraRec.Open;
    //AL_12
    OperComum.LimpaParametros(qryDestino);
    qryDestino.ParamByName('DATAEX').AsString  := qryDATAEX.AsString;    
    qryDestino.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryDestino.Open
end;

procedure TFrmCadCisao.HabDetOrig(bAcao:Boolean);
begin
   dbeBoletaProv.Enabled := bAcao;
   dblTipoOperProv.Enabled := bAcao;
   dblCarteiraProvisao.Enabled := bAcao;
   dblCustodianteProv.Enabled := bAcao;
   dblMotivoBloqueioProv.Enabled := bAcao;
end;

procedure TFrmCadCisao.HabDetDest(bAcao:Boolean);
begin
   dbeBoletaRec.Enabled := bAcao;
   dblTipoOperRec.Enabled := bAcao;
   dblCarteiraRec.Enabled := bAcao;
end;

procedure TFrmCadCisao.FormShow(Sender: TObject);
begin
   inherited;
   qryTipoOperacao.Open;
   QryEmissor.Open;
   qryTipoDireito.Open;
   Sel(-1);
   pgcAge.ActivePage := TbsDireitos;
   pgctrlDetalhe.ActivePage := tbsDet;
end;

procedure TFrmCadCisao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryTipoOperacao.Close;
   QryEmissor.Close;
   qryTipoDireito.Close;
   QryInvestimentoAcao.Close;
end;

procedure TFrmCadCisao.sbtnInserirClick(Sender: TObject);
begin
   pgcAge.ActivePage := TbsDireitos;
   inherited;
   // AL_4 - Controle de travamento
   if qry.State = dsInsert then
   begin
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      qryIDOPERACAODIREITO.AsInteger := LeUltRegistro(nil,'OPERACAODIREITO');
      qryPARIDADE.AsFloat            := 1;
      qryDIVPORACAO.AsFloat          := 0;
      qryPERCENTUAL.AsFloat          := 100;
      qryFLGTIPODIREITO.AsString     := 'P';
      Sel(qryIDOPERACAODIREITO.AsInteger, False);
      //AL_10
      //AL_3      
      if qryTipoOperacao.RecordCount = 1 then
      begin
         qryIDTIPOOPERACAO.AsInteger := qryTipoOperacao.FieldByName('IDTIPOOPERACAO').AsInteger;
         dblTipoOperacao.Text := qryTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString;
         dblTipoOperacao.PerformSearch;
      end;
      if dblTipoOperacao.CanFocus then
         dblTipoOperacao.SetFocus;
   end;
end;

procedure TFrmCadCisao.CmeDetalheInsert(Sender: TObject);
begin
   // Verificar esta crítica: Deve ser em local que permita cancelar a operação
   if pgctrlDetalhe.ActivePage = tbsDet then
   begin
      if dblInvestimento.CanFocus then
         dblInvestimento.SetFocus
   end
   else if pgctrlDetalhe.ActivePage = tbsOrigem then
   begin
      if qryDetalhe.IsEmpty then
      begin
         MsgDlg('Não foi informado um Investimento para esta AGE.',
                'Mensagem do Sistema',mtWarning,[mbOK],0);
         bbtnVoltarDet.Click;
         Exit;
      end;
      HabDetOrig(True);
      if dblTipoOperProv.CanFocus then
         dblTipoOperProv.SetFocus;
   end
   else if pgctrlDetalhe.ActivePage = tbsDestino then
   begin
      if qryDetalhe.IsEmpty then
      begin
         MsgDlg('Não foi informado um Investimento para esta AGE.',
                'Mensagem do Sistema',mtWarning,[mbOK],0);
         bbtnVoltarDet.Click;
         Exit;
      end;
      if qryOrigem.IsEmpty then
      begin
         MsgDlg('Não foi informado uma Origem para esta AGE.',
                'Mensagem do Sistema',mtWarning,[mbOK],0);
         bbtnVoltarDet.Click;
         Exit;
      end;
      HabDetDest(True);
      if dblTipoOperRec.CanFocus then
         dblTipoOperRec.SetFocus;
   end;

   inherited;

   if pgctrlDetalhe.ActivePage = tbsDestino then
   begin
      if qryDestino.State = dsInsert then
         qryDestinoDATAOPERACAO.AsDateTime := qryDATACOM.AsDateTime;
   end;

end;

procedure TFrmCadCisao.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

function TFrmCadCisao.TestaOperacaoExitente: Boolean;
begin
   try
      QryBuscaOperDireito.Close;
      QryBuscaOperDireito.ParamByName('P_IDEMISSOR').AsInteger      := QryIDEMISSOR.AsInteger;
      QryBuscaOperDireito.ParamByName('P_DATAEX').AsString          := QryDATAEX.AsString;
      QryBuscaOperDireito.ParamByName('P_DATAAGE').AsString         := QryDATAAGE.AsString;
      QryBuscaOperDireito.ParamByName('P_DATACOM').AsString         := QryDATACOM.AsString;
      QryBuscaOperDireito.ParamByName('P_IDTIPOOPERACAO').AsInteger := QryIDTIPOOPERACAO.AsInteger;
      QryBuscaOperDireito.Open;
      If QryBuscaOperDireito.IsEmpty Then
         Result := False
      Else
         Result := True;
   finally
      QryBuscaOperDireito.Close;
   end;
end;

procedure TFrmCadCisao.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;

   if (Qry.State = DsInsert) and (TestaOperacaoExitente) then
   begin
      Accept := False;
      MsgDlg('Já existe uma Operação com as mesmas Características.','Mensagem do Sistema',MtWarning,[mbOk],0);
      Exit;
   end;

   if Trim(dblTipoOperacao.Text) = '' then
   begin
      MsgDlg('Não foi selecionado um tipo de operação para esta AGE,'+#13+
             'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
      Accept := False;
      if dblTipoOperacao.CanFocus then
         dblTipoOperacao.SetFocus;
      Exit;
   end
   else
   if Trim(dblEmissor.Text) = '' then
   begin
      Accept := False;
      MsgDlg('Não foi selecionado uma Empresa para esta AGE,'+#13+
             'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dblEmissor.CanFocus then
         dblEmissor.SetFocus;
      Exit;
   end
   else
   if Trim(dbdAGE.Text) = '' then
   begin
      Accept := False;
      MsgDlg('Não foi informada a Data desta AGE,'+#13+
             'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbdAGE.CanFocus then
         dbdAGE.SetFocus;
      Exit;
   end
   else
   if Trim(dbdEX.Text) = '' then
   begin
      Accept := False;
      MsgDlg('Não foi informada a Data Base para esta AGE,'+#13+
             'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbdEX.CanFocus then
         dbdEX.SetFocus;
      Exit;
   end
   else
   if Trim(dbdOper.Text) = '' then
   begin
      Accept := False;
      MsgDlg('Não foi informada a Data EX para esta AGE,'+#13+
             'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbdOper.CanFocus then
         dbdOper.SetFocus;
      Exit;
   end
   else
   if Trim(dbdCOM.Text) = '' then
   begin
      Accept := False;
      MsgDlg('Não foi informada a Data Prevista para esta AGE,'+#13+
             'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbdCOM.CanFocus then
         dbdCOM.SetFocus;
      Exit;
   end;

   if ((qry.State = DsInsert) and (qry.FieldByName('PARIDADE').AsFloat = 0)) then
      qry.FieldByName('PARIDADE').AsFloat  := 1;

   if ((qry.State = DsInsert) and (qry.FieldByName('FLGTIPODIREITO').AsString = '')) then
      qry.FieldByName('FLGTIPODIREITO').AsString  := 'P';

   Accept := True;
end;

procedure TFrmCadCisao.bbtnOkDetClick(Sender: TObject);
begin
   CmeDetalhe.RepetirInsert := False;
   if pgctrlDetalhe.ActivePage = tbsDet then
      inherited
   else
   if pgctrlDetalhe.ActivePage = tbsOrigem then
   begin
      if qryOrigem.Modified then
      begin
         // Se a Provisão foi alterada exclui o histórico
         if qryHistCartInv.Locate('IDOPERACAOINVEST', qryOrigemIDOPERACAOINVEST.AsInteger, []) then
            qryHistCartInv.Delete;

         qryOrigemALTERADO.AsString := 'S';
      end;
      if not qryDetalhe.Locate('ORIGDEST', 'O', []) then
      begin
         if not qryDetalhe.Locate('ORIGDEST', 'B', []) then
            Raise Exception.Create('Não foi Possível localizar o Investimento de Origem ou Base');
      end;
      inherited
   end
   else
   if pgctrlDetalhe.ActivePage = tbsDestino then
   begin
      if qryDestino.Modified then
      begin
         // Verificar o Tratamento nas operações
         // Se a Provisão foi alterada exclui o histórico
         if qryHistCartInv.Locate('IDOPERACAOINVEST', qryDestinoIDOPERACAOINVEST.AsInteger, []) then
            qryHistCartInv.Delete;

         qryDestinoALTERADO.AsString := 'S';
      end;

      inherited;

   end

end;

{Incrementa fornecedor, bolsa de valores, boleta, data de vencimento}
procedure TFrmCadCisao.FornecedorCli(wIdCustodiante, iInvestimento  : Integer;
                                          Var wIdForCli: Integer);
begin
   // Se Tipo de Credor for CUSTODIANTE
   if (qryTipoOperacaoTIPCREDOR.AsString = 'CT') then
   begin
      // Transforma Custodiante em Fornecedor - Cliente
      try
         if qryTipoOperacaoRECPAG.AsString = 'R' then
            Documento.ForCli.Inserir(wIdCustodiante, Sistema.IdEmpresa, -1, 0,
                                     pRPI.IDTIPOCLIENTECOR, Sistema.IdEmpresa,
                                     '', '', '', '', 'C', False) // Cliente
         else if qryTipoOperacaoRECPAG.AsString = 'P' then
            Documento.ForCli.Inserir(wIdCustodiante, Sistema.IdEmpresa, -1, 0,
                                     pRPI.IDRAMOFORCOR, Sistema.IdEmpresa,
                                     '', '', '', '', 'F', False); // Fornecedor
      Except  // Função gerava um Abort quando o Fornecedor
      End;    // já estava cadastrado

      wIdForCli := wIdCustodiante;
   end
   else
   begin
      // Transforma Emissor em Fornecedor - Cliente
      try
         if qryTipoOperacaoRECPAG.AsString = 'R' then
            Documento.ForCli.Inserir(qryIDEMISSOR.AsInteger, Sistema.IdEmpresa,
                                     -1, 0, 12, Sistema.IdEmpresa,
                                     '','','','','C',False) // Cliente
         else if qryTipoOperacaoRECPAG.AsString = 'P' then
            Documento.ForCli.Inserir(qryIDEMISSOR.AsInteger, Sistema.IdEmpresa,
                                     0, 0, 12, Sistema.IdEmpresa,
                                     '','','','','F',False); // Fornecedor
      Except  // Função gerava um Abort quando o Fornecedor
      End;    // já estava cadastrado

      wIdForCli       := qryIDEMISSOR.AsInteger;

   end;
end;

procedure TFrmCadCisao.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   // AL_4 - Controle de travamento
   if qry.State = dsEdit then
   begin
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      if dblTipoOperacao.CanFocus then
         dblTipoOperacao.SetFocus;
   end;
end;

procedure TFrmCadCisao.sbtnExcluiDetClick(Sender: TObject);
var sBol: String;
    iResp: Integer;
begin
   if pgctrlDetalhe.ActivePage = tbsDet then
   begin
      if MsgDlg('Exclui o Investimento e as Operações de Origem, Destino e Não Exercício?','Mensagem do Sistema',mtConfirmation,[mbYes, mbNo],0) = mrYes then
      begin
         try
            //Exclui a boleta de Destino         
            qryDestino.First;
            while not qryDestino.Eof do
            begin
               sBol := qryDestinoNUMDOCUMENTO.AsString;
               if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
                  Raise Exception.Create('Não foi possível excluir as operações de Destino da AGE ' + sBol);
               while ((not qryDestino.Eof) and (sBol = qryDestinoNUMDOCUMENTO.AsString)) do
                  qryDestino.Next;
            end;

            //Exclui a boleta de Origem
            qryOrigem.First;
            while not qryOrigem.Eof do
            begin
               sBol := qryOrigemNUMDOCUMENTO.AsString;
               if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
                  Raise Exception.Create('Não foi possível excluir as operações de Origem da AGE ' + sBol);
               while ((not qryOrigem.Eof) and (sBol = qryOrigemNUMDOCUMENTO.AsString)) do
                  qryOrigem.Next;
            end;

            inherited;
            Sel(qryIDOPERACAODIREITO.AsInteger, False, False);

         except
            on E:Exception do
            begin
               MsgDlg('Não foi possível excluir este Investimento. '+ #13 +
                      E.Message, 'Mensagem do Sistema', mtWarning,[MbOk],0);
               bbtnCancelar.Click;
            end;
         end;
      end;
   end
   else
   if pgctrlDetalhe.ActivePage = tbsOrigem then
   begin
      if qryDestino.IsEmpty then
      begin
         iResp := OperComum.InvMsgBox('Exclui Esta Operação de Origem ou Todas',
                                      mtConfirmation, 'Mensagem do Sistema',
                                      [mbYes,mbNo,mbCancel],
                                      'Esta;Todas;Cancela');

         if iResp = mrYes then
         begin
            if qryHistCartInv.Locate('IDOPERACAOINVEST', qryOrigemIDOPERACAOINVEST.AsInteger, []) then
               qryHistCartInv.Delete;
            if qryBoleta.Locate('IDBOLETA', qryOrigemNUMDOCUMENTO.AsString, []) then
            begin
               qryBoleta.Edit;
               qryBoletaEXCLUIBOLETA.AsString := 'S';
               qryBoleta.Post;
            end;
            inherited;
         end
         else if iResp = mrNo then
         begin
            // Mata todas as Origens anteriores
            fraMens.Mes := 'Excluindo Operações de Origem...';
            fraMens.Max := qryOrigem.RecordCount;
            fraMens.Pos := 0;
            fraMens.Mostra;
            qryOrigem.First;
            while not qryOrigem.Eof do
            begin
               sBol := qryOrigemNUMDOCUMENTO.AsString;
               if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
                  Raise Exception.Create('Não é possível Excluir as Operações de Origem da Boleta ' + sBol);
               while ((not qryOrigem.Eof) and (sBol = qryOrigemNUMDOCUMENTO.AsString)) do
               begin
                  qryOrigem.Next;
                  fraMens.Incrementa;
               end;
            end;
            inherited;
            Sel(qryIDOPERACAODIREITO.AsInteger, False);
         end;
      end
      else
         MsgDlg('Existem operações de Destino para esta AGE.' + #13 +
                'Não é possível excluir nenhuma Operação de Origem.' + #13 +
                'Se for necessário exclua a Boleta de Destino primeiro.', 'Mensagem do Sistema',
                mtInformation, [mbOk], 0);
   end
   else
   if pgctrlDetalhe.ActivePage = tbsDestino then
   begin
      iResp := OperComum.InvMsgBox('Exclui Esta Operação de Destino ou Todas',
                                   mtConfirmation, 'Mensagem do Sistema',
                                   [mbYes,mbNo,mbCancel],
                                   'Esta;Todas;Cancela');

      if iResp = mrYes then
      begin
         // Verificar o Tratamento nas operações
         if qryHistCartInv.Locate('IDOPERACAOINVEST', qryDestinoIDOPERACAOINVEST.AsInteger, []) then
            qryHistCartInv.Delete;
         if qryBoleta.Locate('IDBOLETA', qryDestinoNUMDOCUMENTO.AsString, []) then
         begin
            qryBoleta.Edit;
            qryBoletaEXCLUIBOLETA.AsString := 'S';
            qryBoleta.Post;
         end;
         inherited;
      end
      else if iResp = mrNo then
      begin
         // Mata todas os Destinos anteriores
         fraMens.Mes := 'Excluindo Operações de Destino...';
         fraMens.Max := qryDestino.RecordCount;
         fraMens.Pos := 0;
         fraMens.Mostra;
         qryDestino.First;
         while not qryDestino.Eof do
         begin
            sBol := qryDestinoNUMDOCUMENTO.AsString;
            if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
               Raise Exception.Create('Não é possível excluir as operações de Destino da Boleta ' + sBol);
            while ((not qryDestino.Eof) and (sBol = qryDestinoNUMDOCUMENTO.AsString)) do
            begin
               qryDestino.Next;
               fraMens.Incrementa;
            end;
         end;
         inherited;
         Sel(qryIDOPERACAODIREITO.AsInteger, False);
      end;
   end;
end;

procedure TFrmCadCisao.bbtnConfirmarClick(Sender: TObject);
var bCriaLancto, bConfirma, bAltOrig, bAltDest, bReproc: Boolean;
    wTipoRecDesBol, wMensErro, sTipoCustodia, sBol: String;
    wPlano, wPlanilha, wDocumCont, wIdOperCust, iIdHistCustodia, iIdCarteiraXEvento: Integer;
    fSaldoCaixa : Currency;
begin
   // Caso não confirmar, não pode fazer o finally
   CmeCadastroBeforeConfirma(Self, bConfirma);
   if not bConfirma then
      Exit;

   //AL_8
   if not qryOrigem.IsEmpty then
   begin
      if not CtrlInvContab.TestaPeriodo(qryOrigemDATAOPERACAO.AsString, 2) then
      begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', MtWarning, [mbOk],0);
         fraMens.Apaga;
         Exit;
      end;
   end;
   if not qryDestino.IsEmpty then
   begin
      if not CtrlInvContab.TestaPeriodo(qryDestinoDATAOPERACAO.AsString, 2) then
      begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', MtWarning, [mbOk],0);
         fraMens.Apaga;
         Exit;
      end;
   end;

   try  // Finally
      try  // Except
         qryOrigem.DisableControls;
         qryDestino.DisableControls;

         // AL_2 - Ini
         fraMens.Mostra;
         fraMens.Mes := 'Atualizando AGE';
         qry.ApplyUpdates;
         fraMens.Mes := 'Atualizando Investimentos para a AGE';
         qryDetalhe.ApplyUpdates;
         fraMens.Mes := 'Atualizando operações de Origem';
         qryOrigem.ApplyUpdates;
         fraMens.Mes := 'Atualizando Operações de Destino';
         qryDestino.ApplyUpdates;

         // Zera o Buffer de memória do CachedUpdates
         qry.CommitUpdates;
         qryDetalhe.CommitUpdates;
         qryOrigem.CommitUpdates;
         qryDestino.CommitUpdates;
         // AL_2 - Fim

         fraMens.Pos := 0;
         fraMens.Max := (qryDestino.RecordCount * 2) + qryBoleta.RecordCount;

         bReproc := False;

         // Enquanto houverem Destinos alterados, Limpa a Boleta correspondente
         qryDestino.First;
         bAltDest := False;
         while not qryDestino.Eof do
         begin
            fraMens.Mes := 'Limpando Contábil das Operações de Destino';
            if qryDestinoALTERADO.AsString = 'S' then
            begin
               bAltDest := True;
               if qryBoleta.Locate('IDBOLETA', qryDestinoNUMDOCUMENTO.AsString, []) then
               begin
                  // Se achou a boleta, Limpa
                  fraMens.Mes := 'Limpando Contábil das Operações de Destino' + #13 +
                                 'Boleta ' + qryBoletaIDBOLETA.AsString + ', Planilha: ' + qryBoletaPLNCODIGO.AsString + ', Documento: ' + qryBoletaCODDOCUMENTO.AsString;
                  if not OperComum.ProcExclui(qryBoletaCODDOCUMENTO.AsInteger,
                                              qryBoletaPLNCODIGO.AsInteger,
                                              qryBoletaPLANO.AsInteger, -1,
                                              qryBoletaDATABOLETA.AsDateTime,
                                              False) then
                     Raise Exception.Create('Não foi possível limpar a planilha ' + qryBoletaPLNCODIGO.AsString);
                  qryBoleta.Edit;
                  qryBoletaCODDOCUMENTO.Clear;
                  qryBoletaPLANO.Clear;
                  qryBoletaPLNCODIGO.Clear;
                  qryBoletaEXCLUIBOLETA.AsString := 'S';
                  qryBoleta.Post;
                  bReproc := True;
               end;
            end;
            qryDestino.Next;
            fraMens.Incrementa;
         end;

         // Se houverem Boleta Marcada para exclusão (exclusão de Origem ou Destino)
         qryBoleta.First;
         while not qryBoleta.Eof do
         begin
            fraMens.Mes := 'Limpando Contábil das Boletas Alteradas';
            if qryBoletaEXCLUIBOLETA.AsString = 'S' then
            begin
               fraMens.Mes := 'Limpando Contábil' + #13 +
                              'Boleta ' + qryBoletaIDBOLETA.AsString + ', Planilha: ' + qryBoletaPLNCODIGO.AsString;
               if not OperComum.ProcExclui(qryBoletaCODDOCUMENTO.AsInteger,
                                           qryBoletaPLNCODIGO.AsInteger,
                                           qryBoletaPLANO.AsInteger, -1,
                                           qryBoletaDATABOLETA.AsDateTime,
                                           False) then
                  Raise Exception.Create('Não foi possível limpar a planilha ' + qryBoletaPLNCODIGO.AsString);
               qryBoleta.Edit;
               qryBoletaCODDOCUMENTO.Clear;
               qryBoletaPLANO.Clear;
               qryBoletaPLNCODIGO.Clear;
               qryBoleta.Post;

               // Se foi excluida um dos Destinos desta boleta, é necessário
               // Recontabilizar todos os Destinos desta boleta
               qryDestino.First;
               while not qryDestino.Eof do
               begin
                  if qryDestinoNUMDOCUMENTO.AsString = qryBoletaIDBOLETA.AsString then
                  begin
                     qryDestino.Edit;
                     qryDestinoALTERADO.AsString := 'S';
                     qryDestino.Post;
                     bAltDest := True;
                  end;
                  qryDestino.Next;
               end;
               bReproc := True;
            end;
            qryBoleta.Next;
            fraMens.Incrementa;
         end;

         qryDestino.First;
         while not qryDestino.Eof do
         begin
            fraMens.Mes := 'Limpando Custodia da Boleta ' + qryDestinoNUMDOCUMENTO.AsString;
            if qryDestinoALTERADO.AsString = 'S' then
            begin
               if not OperacaoInvest.ExcluiCustodia('', -1, qryDestinoIDOPERACAOINVEST.AsInteger) then
                  Raise Exception.Create('Não foi possível excluir uma Custodia da boleta ' + qryDestinoNUMDOCUMENTO.AsString);

               // AL_2
               // Mata todos os históricos da boleta, para não dar erro de constraint com
               //   a operação de custódia
               if qryHistCartInv.Locate('IDOPERACAOINVEST', qryDestinoIDOPERACAOINVEST.AsInteger, []) then
                  qryHistCartInv.Delete;

               bReproc := True;
            end;
            qryDestino.Next;
            fraMens.Incrementa;
         end;

         // AL_2 - Ini
         // Para comitar a alteração ou exclusão é preciso deletar a operação de custodia
         fraMens.Mes := 'Atualizando Histórico das Carteiras';
         qryHistCartInv.ApplyUpdates;
         qryHistCartInv.CommitUpdates;
         fraMens.Mes := 'Atualizando Boletas';
         qryBoleta.ApplyUpdates;
         qryBoleta.CommitUpdates;
         // AL_2 - Fim

         // AL_3 - Lança as origens
         fraMens.Mostra;
         fraMens.Max := qryOrigem.RecordCount;
         qryOrigem.First;
         while not qryOrigem.Eof do
         begin
            if qryOrigemORIGDEST.AsString = 'O' then
            begin
               // Se não achar o histórico, relança
               if not qryHistCartInv.Locate('IDOPERACAOINVEST', qryOrigemIDOPERACAOINVEST.AsInteger, []) then
               begin
                  fraMens.Mes := 'Lançando R$ ' + FormatFloat('###,###,###,##0.00', qryOrigemVLROPERACAO.AsFloat) + #13 +
                                 'Investimento : ' + qryOrigemDESCINVESTIMENTO.AsString;

                  if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                                    qryOrigemIDINVESTIMENTO.AsInteger,
                                                    qryOrigemIDTIPOINVEST.AsInteger,
                                                    qryOrigemIDOPERACAOINVEST.AsInteger, -1,
                                                    qryOrigemIDTIPOOPERACAO.AsInteger,
                                                    qryOrigemIDCARTEIRAINVEST.AsInteger,
                                                    qryOrigemIDCARTEIRAGERENC.AsInteger,
                                                    -1, -1, -1, -1, -1,
                                                    qryOrigemDATAOPERACAO.AsDateTime,
                                                    qryOrigemVLROPERACAO.AsFloat,
                                                    qryOrigemQTDEOPERACAO.AsFloat,
                                                    pRPI.VLRCOTAINICART,
                                                    0{Variação}, 0{Juros}, 0{wVlrIRProv} {Verificar se vai calcular o saldo},
                                                    0, 0, 0, 0, 0, 0,
                                                    'D' {qryOrigemNATUREZAOPERACAO.AsString} {Movimento},
                                                    qryOrigemNATUREZAOPERACAO.AsString {Operacao},
                                                    qryOrigemIDLOTE.AsString,
                                                    Trim(qryOrigemDESCTIPOOPERACAO.AsString) + ' / ' +
                                                       Trim(qryOrigemDESCINVESTIMENTO.AsString),
                                                    'OPE', '1', '', True, -1,
                                                    qryOrigemIDPLANPREVCTBPATR.AsInteger, iIdHistCartInv) then
                     Raise Exception.Create('Não foi possível inserir os Históricos das Operações de Origem.');

                  if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                     Raise Exception.Create('Não foi possivel atualizar os saldos desta Carteira/Investimento');

                  bReproc := True;
               end
               else
                  iIdHistCartInv := qryHistCartInvIDHISTCARTINV.AsInteger;

               // Se NÃO for Carteira Gerencial
               if qryOrigemIDCARTEIRAGERENC.IsNull then
               begin
                  // Se o Registro foi alterado
                  if qryOrigemALTERADO.AsString = 'S' then
                  begin
                     // Relança a Custódia
                     wIdOperCust := LeUltRegistro(Nil,'OPERCUSTODIA');

                  //AL_10
                  if not OperacaoInvest.AlimentaOperCustodia(wIdOperCust, -1, -1,
                                                             -1{iIdHistCartInv} {Origem},
                                                             -1{Destino},
                                                                qryOrigemIDCARTEIRAINVEST.AsInteger,
                                                                qryOrigemIDCARTEIRAINVEST.AsInteger,
                                                                qryOrigemIDINVESTIMENTO.AsInteger,
                                                                qryOrigemIDCUSTODIANTE.AsInteger,
                                                                qryOrigemIDCUSTODIANTE.AsInteger,
                                                                OperComum.IIF(qryOrigemIDMOTIVOBLOQUEIO.IsNull,-1,qryOrigemIDMOTIVOBLOQUEIO.AsInteger),
                                                                OperComum.IIF(qryOrigemIDMOTIVOBLOQUEIO.IsNull,-1,qryOrigemIDMOTIVOBLOQUEIO.AsInteger),
                                                                qryOrigemQTDEOPERACAO.AsFloat,
                                                                qryOrigemDATAOPERACAO.AsDateTime,
                                                                qryOrigemIDLOTE.AsString,
                                                                qryOrigemNUMDOCUMENTO.AsString,
                                                                qryOrigemIDPLANPREVCTBPATR.AsInteger) Then
                        Raise Exception.Create('Não foi possível lançar a Custódia da boleta ' + qryOrigemNUMDOCUMENTO.AsString);

                     ExecutarQuery(qryAuxiliar,'UPDATE OPERACAOINVEST ' +
                                               'SET IDOPERCUSTODIA = ' + IntToStr(wIdOperCust) + ' ' +
                                               'WHERE IDOPERACAOINVEST = ' + qryOrigemIDOPERACAOINVEST.AsString);

                     if (qryOrigemIDTIPOOPERACAO.AsInteger IN [pRPI.IDTIPOOPERDIRCIS,pRPI.IDTIPOOPERDIRCIS+10000]) then
                     begin
                        if qryOrigemIDMOTIVOBLOQUEIO.AsInteger = -1 then
                           sTipoCustodia := 'V'
                        else
                           sTipoCustodia := 'Z';  //DIMINUI SALDO BLOQUEADO
                     end
                     else
                     begin
                        if qryDestinoIDMOTIVOBLOQUEIO.AsInteger = -1 then
                           sTipoCustodia := 'C'
                        else
                           sTipoCustodia := 'Y';  //AMUMENTA SALDO BLOQUEADO
                     end;

                     if not OperacaoInvest.InsereCustodia(qryOrigemIDCARTEIRAINVEST.AsInteger,
                                                          qryOrigemIDINVESTIMENTO.AsInteger,
                                                          qryOrigemIDCUSTODIANTE.AsInteger,
                                                          OperComum.IIF(qryOrigemIDMOTIVOBLOQUEIO.IsNull,-1,
                                                                        qryOrigemIDMOTIVOBLOQUEIO.AsInteger),
                                                          qryOrigemIDOPERACAOINVEST.AsInteger,
                                                          wIdOperCust, qryOrigemIDLOTE.AsString,
                                                          sTipoCustodia,
                                                          qryOrigemDATAOPERACAO.AsDateTime,
                                                          qryOrigemQTDEOPERACAO.AsFloat,
                                                          iIdHistCustodia,
                                                          qryOrigemIDPLANPREVCTBPATR.AsInteger) then
                        Raise Exception.Create('Não foi possível atualizar um histórico de custodia da boleta '+ qryOrigemNUMDOCUMENTO.AsString);

                     OperacaoInvest.AtualizaSaldosCustodia;

                     bReproc := True;
                  end;

                  // Se houveram alterações nos Destinos e a Boleta foi limpa
                  if (bAltDest) and (qryBoleta.Lookup('IDBOLETA', qryOrigemNUMDOCUMENTO.AsString, 'EXCLUIBOLETA') = 'S') then
                  begin
                     fraMens.Mes := 'Contabilizando R$ ' + FormatFloat('###,###,###,##0.00', qryOrigemVLROPERACAO.AsFloat) + #13 +
                                    'Carteira: ' + qryOrigemDESCCARTINVEST.AsString;

                     // Parametro para Contabilidade e CAP/CAR
                     bCriaLancto    := True;
                     wTipoRecDesBol := '';
                     wMensErro      := '';

                     // Lança o Contábil do Destino
                     if qryBoleta.Locate('IDBOLETA', qryOrigemNUMDOCUMENTO.AsString, []) then
                     begin
                        wPlano     := OperComum.IIF(qryBoletaPLANO.AsInteger = 0, -1, qryBoletaPLANO.AsInteger);
                        wPlanilha  := OperComum.IIF(qryBoletaPLNCODIGO.AsInteger = 0, -1, qryBoletaPLNCODIGO.AsInteger);
                        wDocumCont := OperComum.IIF(qryBoletaCODDOCUMENTO.AsInteger = 0, -1, qryBoletaCODDOCUMENTO.AsInteger);

                        if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                                   qryOrigemIDINVESTIMENTO.AsInteger,
                                                   qryOrigemIDTIPOOPERACAO.AsInteger,
                                                   qryOrigemIDOPERACAOINVEST.AsInteger,
                                                   qryOrigemIDFORCLI.AsInteger,
                                                   qryOrigemIDCARTEIRAINVEST.AsInteger,
                                                   QryInvestimentoAcaoIDMOEDACONTAB.AsInteger,
                                                   qryOrigemDESCTIPOOPERACAO.AsString + ' - ' +
                                                             qryOrigemDESCINVESTIMENTO.AsString,
                                                   qryOrigemIDLOTE.AsString,
                                                   '', qryOrigemNUMDOCUMENTO.AsString,
                                                   qryTipoOperacaoRECPAG.AsString, wTipoRecDesBol, bCriaLancto,
                                                   qryOrigemVLROPERACAO.AsFloat,
                                                   qryOrigemVLROPERACAO.AsFloat,
                                                   qryOrigemDATAOPERACAO.AsDateTime,
                                                   qryOrigemDATAVENCOPER.AsDateTime,
                                                   wPlano, wPlanilha, wDocumCont, wMensErro,
                                                   ' '{sCapCar}, False, True, 0, True,
                                                   qryOrigemIDPLANPREVCTBPATR.AsInteger) <> 0 then
                           Raise Exception.Create('Não foi possível contabilizar uma Operação de Origem');

                        // Al_1
                        // Atualiza a Boleta com Planilha e Documento
                        if (wPlanilha > 0) or (wDocumCont > 0) then
                        begin
                           qryBoleta.Edit;
                           if wPlano > 0 then
                              qryBoletaPLANO.AsInteger := wPlano;
                           if wPlanilha > 0 then
                              qryBoletaPLNCODIGO.AsInteger := wPlanilha;
                           if wDocumCont > 0 then
                              qryBoletaCODDOCUMENTO.AsInteger := wDocumCont;
                           qryBoleta.Post;
                           qryBoleta.ApplyUpdates;
                           qryBoleta.CommitUpdates;
                        end;
                     end
                     else
                       Raise Exception.Create('Não foi possível localizar a Boleta das Operações de Origem');
                  end;

                  if (bReproc) and (qryDATAOPER.AsDateTime <= pRPI.DATAULTFECH) then
                      RendaVariavel.MarcarFlagReproc(qryOrigemIDINVESTIMENTO.AsInteger,
                                                     -1, -1, qryDATAOPER.AsDateTime);
               end
               else
               begin
                  iIdCarteiraXEvento := CotaComum.BuscaEventoPorTpOper(qryOrigemIDCARTEIRAINVEST.AsInteger,
                                                                       qryOrigemIDCARTEIRAGERENC.AsInteger,
                                                                       qryOrigemIDTIPOOPERACAO.AsInteger);

                  if iIdCarteiraXEvento <> 0 then
                  begin
                     fSaldoCaixa := CaixaComum.BuscaSaldoCaixa(qryOrigemDATAOPERACAO.AsDateTime,
                                                               qryOrigemIDCARTEIRAINVEST.AsInteger,
                                                               qryOrigemIDCARTEIRAGERENC.AsInteger,
                                                               qryOrigemIDPLANPREVCTBPATR.AsInteger, 'OPE');

                     if not CaixaComum.GravaEventosCaixa(qryOrigemDATAOPERACAO.AsDateTime,
                                                         qryOrigemIDPLANPREVCTBPATR.AsInteger,
                                                         qryOrigemIDTIPOOPERACAO.AsInteger,
                                                         0,
                                                         qryOrigemIDCARTEIRAINVEST.AsInteger,
                                                         qryOrigemIDCARTEIRAGERENC.AsInteger,
                                                         qryOrigemIDOPERACAOINVEST.AsInteger,
                                                         qryOrigemIDOPERACAODIREITO.AsInteger,
                                                         qryOrigemDESCINVESTIMENTO.AsString,
                                                         qryOrigemVLROPERACAO.AsFloat,
                                                         fSaldoCaixa) Then
                        Raise Exception.Create('Não é possível Atualizar o Caixa da Carteira Gerencial. ');
                  end;
               end;
            end;
            fraMens.Incrementa;
            qryOrigem.Next;
         end;

         // AL_3 - Fim

         // Lança os Destinos
         fraMens.Mostra;
         fraMens.Max := qryDestino.RecordCount;
         qryDestino.First;
         while not qryDestino.Eof do
         begin
            // Se não achar o histórico, relança
            if not qryHistCartInv.Locate('IDOPERACAOINVEST', qryDestinoIDOPERACAOINVEST.AsInteger, []) then
            begin
               fraMens.Mes := 'Lançando R$ ' + FormatFloat('###,###,###,##0.00', qryDestinoVLROPERACAO.AsFloat) + #13 +
                              'Investimento : ' + qryDestinoDESCINVESTIMENTO.AsString;

               if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                                 qryDestinoIDINVESTIMENTO.AsInteger,
                                                 qryDestinoIDTIPOINVEST.AsInteger,
                                                 qryDestinoIDOPERACAOINVEST.AsInteger, -1,
                                                 qryDestinoIDTIPOOPERACAO.AsInteger,
                                                 qryDestinoIDCARTEIRAINVEST.AsInteger,
                                                 qryDestinoIDCARTEIRAGERENC.AsInteger,
                                                 -1, -1, -1, -1, -1,
                                                 qryDestinoDATAOPERACAO.AsDateTime,
                                                 qryDestinoVLROPERACAO.AsFloat,
                                                 qryDestinoQTDEOPERACAO.AsFloat,
                                                 pRPI.VLRCOTAINICART,
                                                 0{Variação}, 0{Juros}, 0{wVlrIRProv} {Verificar se vai calcular o saldo},
                                                 0, 0, 0, 0, 0, 0,
                                                 qryDestinoNATUREZAOPERACAO.AsString {Movimento},
                                                 qryDestinoNATUREZAOPERACAO.AsString {Operacao},
                                                 qryDestinoIDLOTE.AsString,
                                                 Trim(qryDestinoDESCTIPOOPERACAO.AsString) + ' / ' +
                                                    Trim(qryDestinoDESCINVESTIMENTO.AsString),
                                                 'OPE', '1', '', True, -1,
                                                 qryDestinoIDPLANPREVCTBPATR.AsInteger, iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível inserir os Históricos das Operações de Destino.');

               // AL_2
               if (Not (qryDestinoIDTIPOOPERACAO.AsInteger IN [pRPI.IDTIPOOPERDIRCIS,pRPI.IDTIPOOPERDIRCIS+10000])) then
               begin
                  if not ExecutaQuery(qryAuxiliar,'UPDATE HISTCARTINV SET MOVIMAQUI = ' +
                                                   TrocaVirgulaPonto(FloatToStr(qryDestinoVLRCUSTOATUAL.AsFloat))+','+
                                                  'VLRVARIACAO = ' +
                                                   TrocaVirgulaPonto(FloatToStr(qryDestinoVLRVARIACAOATUAL.AsFloat))+
                                                  'WHERE IDHISTCARTINV = '+IntToStr(iIdHistCartInv)) then
                     Raise Exception.Create('Não foi possivel atualizar os saldos de custo e variação do destino');
               end;

               if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                  Raise Exception.Create('Não foi possivel atualizar os saldos desta Carteira/Investimento');

               bReproc := True;
            end
            else
               iIdHistCartInv := qryHistCartInvIDHISTCARTINV.AsInteger;

            // Se NÃO for Carteira Gerencial
            if qryDestinoIDCARTEIRAGERENC.IsNull then
            begin
               // Se o Registro foi alterado
               if qryDestinoALTERADO.AsString = 'S' then
               begin
                  // Relança a Custódia
                  wIdOperCust := LeUltRegistro(Nil,'OPERCUSTODIA');

                  //AL_10
                  if not OperacaoInvest.AlimentaOperCustodia(wIdOperCust, -1, -1,
                                                             -1{iIdHistCartInv} {Origem},
                                                             -1{Destino},
                                                             qryDestinoIDCARTEIRAINVEST.AsInteger,
                                                             qryDestinoIDCARTEIRAINVEST.AsInteger,
                                                             qryDestinoIDINVESTIMENTO.AsInteger,
                                                             qryDestinoIDCUSTODIANTE.AsInteger,
                                                             qryDestinoIDCUSTODIANTE.AsInteger,
                                                             OperComum.IIF(qryDestinoIDMOTIVOBLOQUEIO.IsNull,-1,qryDestinoIDMOTIVOBLOQUEIO.AsInteger),
                                                             OperComum.IIF(qryDestinoIDMOTIVOBLOQUEIO.IsNull,-1,qryDestinoIDMOTIVOBLOQUEIO.AsInteger),
                                                             qryDestinoQTDEOPERACAO.AsFloat,
                                                             qryDestinoDATAOPERACAO.AsDateTime,
                                                             qryDestinoIDLOTE.AsString,
                                                             qryDestinoNUMDOCUMENTO.AsString,
                                                             qryDestinoIDPLANPREVCTBPATR.AsInteger) Then
                     Raise Exception.Create('Não foi possível lançar a Custódia da boleta ' + qryDestinoNUMDOCUMENTO.AsString);

                  ExecutarQuery(qryAuxiliar,'UPDATE OPERACAOINVEST ' +
                                            'SET IDOPERCUSTODIA = ' + IntToStr(wIdOperCust) + ' ' +
                                            'WHERE IDOPERACAOINVEST = ' + qryDestinoIDOPERACAOINVEST.AsString);

                  if (qryDestinoIDTIPOOPERACAO.AsInteger IN [pRPI.IDTIPOOPERDIRCIS,pRPI.IDTIPOOPERDIRCIS+10000]) then
                  begin
                     if qryDestinoIDMOTIVOBLOQUEIO.AsInteger = -1 then
                        sTipoCustodia := 'V'
                     else
                        sTipoCustodia := 'Z';  //DIMINUI SALDO BLOQUEADO
                  end
                  else
                  begin
                     if qryDestinoIDMOTIVOBLOQUEIO.AsInteger = -1 then
                        sTipoCustodia := 'C'
                     else
                        sTipoCustodia := 'Y';  //AMUMENTA SALDO BLOQUEADO
                  end;

                  if not OperacaoInvest.InsereCustodia(qryDestinoIDCARTEIRAINVEST.AsInteger,
                                                       qryDestinoIDINVESTIMENTO.AsInteger,
                                                       qryDestinoIDCUSTODIANTE.AsInteger,
                                                       OperComum.IIF(qryDestinoIDMOTIVOBLOQUEIO.IsNull,-1,
                                                                     qryDestinoIDMOTIVOBLOQUEIO.AsInteger),
                                                       qryDestinoIDOPERACAOINVEST.AsInteger,
                                                       wIdOperCust, qryDestinoIDLOTE.AsString,
                                                       sTipoCustodia,
                                                       qryDestinoDATAOPERACAO.AsDateTime,
                                                       qryDestinoQTDEOPERACAO.AsFloat,
                                                       iIdHistCustodia,
                                                       qryDestinoIDPLANPREVCTBPATR.AsInteger) then
                     Raise Exception.Create('Não foi possível atualizar um histórico de custodia da boleta '+ qryOrigemNUMDOCUMENTO.AsString);

                  OperacaoInvest.AtualizaSaldosCustodia;

                  bReproc := True;
               end;

               // Se houveram alterações nos Destinos e a Boleta foi limpa
               if (bAltDest) and (qryBoleta.Lookup('IDBOLETA', qryDestinoNUMDOCUMENTO.AsString, 'EXCLUIBOLETA') = 'S') then
               begin
                  fraMens.Mes := 'Contabilizando R$ ' + FormatFloat('###,###,###,##0.00', qryDestinoVLROPERACAO.AsFloat) + #13 +
                                 'Carteira: ' + qryDestinoDESCCARTINVEST.AsString;

                  // Parametro para Contabilidade e CAP/CAR
                  bCriaLancto    := True;
                  wTipoRecDesBol := '';
                  wMensErro      := '';

                  // Lança o Contábil do Destino
                  if qryBoleta.Locate('IDBOLETA', qryDestinoNUMDOCUMENTO.AsString, []) then
                  begin
                     wPlano     := OperComum.IIF(qryBoletaPLANO.AsInteger = 0, -1, qryBoletaPLANO.AsInteger);
                     wPlanilha  := OperComum.IIF(qryBoletaPLNCODIGO.AsInteger = 0, -1, qryBoletaPLNCODIGO.AsInteger);
                     wDocumCont := OperComum.IIF(qryBoletaCODDOCUMENTO.AsInteger = 0, -1, qryBoletaCODDOCUMENTO.AsInteger);

                     if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                                qryDestinoIDINVESTIMENTO.AsInteger,
                                                qryDestinoIDTIPOOPERACAO.AsInteger,
                                                qryDestinoIDOPERACAOINVEST.AsInteger,
                                                qryDestinoIDFORCLI.AsInteger,
                                                qryDestinoIDCARTEIRAINVEST.AsInteger,
                                                QryInvestimentoAcaoIDMOEDACONTAB.AsInteger,
                                                qryDestinoDESCTIPOOPERACAO.AsString + ' - ' +
                                                          qryDestinoDESCINVESTIMENTO.AsString,
                                                qryDestinoIDLOTE.AsString,
                                                '', qryDestinoNUMDOCUMENTO.AsString,
                                                qryTipoOperacaoRECPAG.AsString, wTipoRecDesBol, bCriaLancto,
                                                qryDestinoVLROPERACAO.AsFloat,
                                                qryDestinoVLROPERACAO.AsFloat,
                                                qryDestinoDATAOPERACAO.AsDateTime,
                                                qryDestinoDATAVENCOPER.AsDateTime,
                                                wPlano, wPlanilha, wDocumCont, wMensErro,
                                                ' '{sCapCar}, False, True, 0, True,
                                                qryDestinoIDPLANPREVCTBPATR.AsInteger) <> 0 then
                        Raise Exception.Create('Não foi possível contabilizar uma Operação de Destino');

                     // Al_1
                     // Atualiza a Boleta com Planilha e Documento
                     if (wPlanilha > 0) or (wDocumCont > 0) then
                     begin
                        qryBoleta.Edit;
                        if wPlano > 0 then
                           qryBoletaPLANO.AsInteger := wPlano;
                        if wPlanilha > 0 then
                           qryBoletaPLNCODIGO.AsInteger := wPlanilha;
                        if wDocumCont > 0 then
                           qryBoletaCODDOCUMENTO.AsInteger := wDocumCont;
                        qryBoleta.Post;
                        qryBoleta.ApplyUpdates;
                        qryBoleta.CommitUpdates;                        
                     end;
                  end
                  else
                    Raise Exception.Create('Não foi possível localizar a Boleta das Operações de Destino');
               end;

               if (bReproc) and (qryDATAOPER.AsDateTime <= pRPI.DATAULTFECH) then
                   RendaVariavel.MarcarFlagReproc(qryDestinoIDINVESTIMENTO.AsInteger,
                                                  -1, -1, qryDATAOPER.AsDateTime);
            end
            else
            begin
               iIdCarteiraXEvento := CotaComum.BuscaEventoPorTpOper(qryDestinoIDCARTEIRAINVEST.AsInteger,
                                                                    qryDestinoIDCARTEIRAGERENC.AsInteger,
                                                                    qryDestinoIDTIPOOPERACAO.AsInteger);

               if iIdCarteiraXEvento <> 0 then
               begin
                  fSaldoCaixa := CaixaComum.BuscaSaldoCaixa(qryDestinoDATAOPERACAO.AsDateTime,
                                                            qryDestinoIDCARTEIRAINVEST.AsInteger,
                                                            qryDestinoIDCARTEIRAGERENC.AsInteger,
                                                            qryDestinoIDPLANPREVCTBPATR.AsInteger, 'OPE');

                  if not CaixaComum.GravaEventosCaixa(qryDestinoDATAOPERACAO.AsDateTime,
                                                      qryDestinoIDPLANPREVCTBPATR.AsInteger,
                                                      qryDestinoIDTIPOOPERACAO.AsInteger,
                                                      0,
                                                      qryDestinoIDCARTEIRAINVEST.AsInteger,
                                                      qryDestinoIDCARTEIRAGERENC.AsInteger,
                                                      qryDestinoIDOPERACAOINVEST.AsInteger,
                                                      qryDestinoIDOPERACAODIREITO.AsInteger,
                                                      qryDestinoDESCINVESTIMENTO.AsString,
                                                      qryDestinoVLROPERACAO.AsFloat,
                                                      fSaldoCaixa) Then
                     Raise Exception.Create('Não é possível Atualizar o Caixa da Carteira Gerencial. ');
               end;
            end;
            fraMens.Incrementa;
            qryDestino.Next;
         end;

         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit
         else
            MsgDlg('Ocorreu um problema no controle de transação:' + #13 +
                   'Não há transação para comitar', 'Mensagem do Sistema ',mtWarning,[mbOK],0);

         bbtnCancelar.Click;

      except
         on E: Exception do
         begin
            if dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;

            bbtnCancelar.Click;

            MsgDlg('Ocorreu um problema na movimentação desta AGE' + #13 +
                   'Mensagem: ' + E.Message, 'Mensagem do Sistema ',mtWarning,[mbOK],0);
         end;
      end;
   finally
      fraMens.Apaga;
      qryOrigem.EnableControls;
      qryDestino.EnableControls;
      CmeDetalhe.AtualizaBotoes(Self);
      CmeCadastro.AtualizaBotoes(Self);
   end;
end;

procedure TFrmCadCisao.FormResize(Sender: TObject);
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

procedure TFrmCadCisao.CalculaVlrLiq(Origem: String = 'O');
var
  qryOrigem: TwwQuery;
begin
   inherited;
   if Origem = 'O' then
      qryOrigem := qryOrigem
   else
      qryOrigem := qryDestino;

   if not (qryOrigem.State in [dsInsert, dsEdit]) then
      Exit;

   qryOrigem.FieldByName('VLRLIQUIDO').AsFloat := qryOrigem.FieldByName('VLROPERACAO').AsFloat;
end;


procedure TFrmCadCisao.dsOrigemStateChange(Sender: TObject);
begin
   inherited;
   HabDetOrig((qryOrigem.State = dsInsert));
   dbrQtdProv.Enabled    := (qryOrigem.State in [dsInsert, dsEdit]);
end;

procedure TFrmCadCisao.CmeDetalheConfirma(Sender: TObject);
var wIdForCli: Integer;
begin
   try
      if pgctrlDetalhe.ActivePage = tbsDet then
      begin
         if qryDetalhe.State in [dsInsert, dsEdit] then
         begin
            qryDetalheDESCINVESTIMENTO.AsString := QryInvestimentoAcaoDESCINVESTIMENTO.AsString;
            qryDetalheDESCRICAO.AsString := qryOrigDestinoDESCRICAO.AsString;
            qryDetalheIDOPERACAODIREITO.AsInteger := qryIDOPERACAODIREITO.AsInteger;
            if qryDetalhe.State = dsInsert then
               qryDetalheIDOPERDIREITOXINV.AsInteger := LeUltRegistro(nil,'OPERDIREITOXINV');
         end;
      end
      else if pgctrlDetalhe.ActivePage = tbsOrigem then
      begin
         if qryOrigem.State = dsInsert then
         begin
            qryOrigemIDOPERACAOINVEST.AsInteger    := LeUltRegistro(nil,'OPERACAOINVEST');
            qryOrigemMOECODIGO.AsInteger           := pRPI.MOECODIGO;
            qryOrigemIDMODULO.AsInteger            := Sistema.IdModulo;
            qryOrigemEMPRESAPROP.AsInteger         := Sistema.IdEmpresa;
            qryOrigemIDINVESTIMENTO.AsInteger      := QryInvestimentoAcaoIDINVESTIMENTO.AsInteger;
            qryOrigemDESCINVESTIMENTO.AsString     := QryInvestimentoAcaoDESCINVESTIMENTO.AsString;
            qryOrigemDESCCARTINVEST.AsString       := qryCarteiraOrigDESCCARTINVEST.AsString;
            qryOrigemIDCARTEIRA.AsString           := qryCarteiraOrigIDCARTEIRA.AsString;
            qryOrigemIDCARTEIRAINVEST.AsInteger    := qryCarteiraOrigIDCARTEIRAINVEST.AsInteger;
            if not qryCarteiraOrigIDCARTEIRAGERENC.IsNull then
               qryOrigemIDCARTEIRAGERENC.AsInteger := qryCarteiraOrigIDCARTEIRAGERENC.AsInteger
            else
               qryOrigemIDCARTEIRAGERENC.Clear;
            qryOrigemIDTIPOINVEST.AsInteger        := 2;
            qryOrigemDESCTIPOOPERACAO.AsString     := qryTipoOperOrigDESCTIPOOPERACAO.AsString;
            qryOrigemNATUREZAOPERACAO.AsString     := qryTipoOperOrigNATUREZAOPERACAO.AsString;
            qryOrigemIDLOTE.Clear;
            if not qryOrigemIDCUSTODIANTE.IsNull then
               qryOrigemSGLCUSTODIANTE.AsString    := qryCustodianteOrigSGLCUSTODIANTE.AsString
            else
               qryOrigemSGLCUSTODIANTE.Clear;
            FornecedorCli(qryOrigemIDCUSTODIANTE.AsInteger,
                          qryOrigemIDINVESTIMENTO.AsInteger, wIdForCli);
            qryOrigemIDFORCLI.AsInteger            := wIdForCli;
            qryOrigemIDOPERACAODIREITO.AsInteger   := qryIDOPERACAODIREITO.AsInteger;
            qryOrigemIDPLANPREVCTBPATR.AsInteger   := iPlanPrevCtbPatro;
            qryOrigemDATAOPERACAO.AsDateTime       := qryDATAOPER.AsDateTime;
            qryOrigemDATAVENCOPER.AsDateTime       := CalcVenc(qryDATAOPER.AsDateTime, qryTipoOperOrigVENCIMENTO.AsInteger);
            qryOrigemDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
            if qryOrigemNUMDOCUMENTO.IsNull then
               qryOrigemNUMDOCUMENTO.AsString      := BuscaBoleta(qryDATAOPER.AsDateTime, wIdForCli);
            qryOrigemFLGSTATUSFECHBOL.AsString     := 'F';
            qryOrigemFLGSTATUSORDMOV.AsString      := 'L';
            qryOrigemPRECOUNITOPERACAO.AsFloat     := 0;
            qryOrigemPERCENTUAL.AsFloat            := 0;
            // AL_3
            qryOrigemORIGDEST.AsString             := qryDetalheORIGDEST.AsString;
            if qryOrigemIDMOTIVOBLOQUEIO.IsNull then
               qryOrigemIDMOTIVOBLOQUEIO.AsInteger := -1;
            qryOrigemSIGLAMOTBLOQ.AsString      := qryMotBloqOrigSIGLAMOTBLOQ.AsString;
            qryOrigemIDOPERCUSTODIA.Clear;
            qryOrigemALTERADO.AsString := 'S';
         end
         else
         begin
            if qryBoleta.Locate('IDBOLETA', qryOrigemNUMDOCUMENTO.AsString, []) then
            begin
               qryBoleta.Edit;
               qryBoletaEXCLUIBOLETA.AsString := 'S';
               qryBoleta.Post;
            end;
         end;
      end
      else if pgctrlDetalhe.ActivePage = tbsDestino then
      begin
         if qryDestino.State = dsInsert then
         begin
            qryDestinoIDOPERACAOINVEST.AsInteger    := LeUltRegistro(nil,'OPERACAOINVEST');
            qryDestinoMOECODIGO.AsInteger           := pRPI.MOECODIGO;
            qryDestinoIDMODULO.AsInteger            := Sistema.IdModulo;
            qryDestinoEMPRESAPROP.AsInteger         := Sistema.IdEmpresa;
            qryDestinoIDINVESTIMENTO.AsInteger      := QryInvestimentoAcaoIDINVESTIMENTO.AsInteger;
            qryDestinoDESCINVESTIMENTO.AsString     := QryInvestimentoAcaoDESCINVESTIMENTO.AsString;
            qryDestinoDESCCARTINVEST.AsString       := qryCarteiraRecDESCCARTINVEST.AsString;
            qryDestinoIDCARTEIRA.AsString           := qryCarteiraRecIDCARTEIRA.AsString;
            qryDestinoIDCARTEIRAINVEST.AsInteger    := qryCarteiraRecIDCARTEIRAINVEST.AsInteger;
            if not qryCarteiraRecIDCARTEIRAGERENC.IsNull then
               qryDestinoIDCARTEIRAGERENC.AsInteger := qryCarteiraRecIDCARTEIRAGERENC.AsInteger
            else
               qryDestinoIDCARTEIRAGERENC.Clear;
            qryDestinoIDTIPOINVEST.AsInteger        := 2;
            qryDestinoDESCTIPOOPERACAO.AsString     := qryTipoOperRecDESCTIPOOPERACAO.AsString;
            qryDestinoNATUREZAOPERACAO.AsString     := qryTipoOperRecNATUREZAOPERACAO.AsString;
            qryDestinoIDLOTE.Clear;
            if not qryDestinoIDCUSTODIANTE.IsNull then
               qryDestinoSGLCUSTODIANTE.AsString    := qryCustodianteRecSGLCUSTODIANTE.AsString
            else
               qryDestinoSGLCUSTODIANTE.Clear;
            FornecedorCli(qryDestinoIDCUSTODIANTE.AsInteger,
                          qryDestinoIDINVESTIMENTO.AsInteger, wIdForCli);
            qryDestinoIDFORCLI.AsInteger            := wIdForCli;
            qryDestinoIDOPERACAODIREITO.AsInteger   := qryIDOPERACAODIREITO.AsInteger;
            qryDestinoIDPLANPREVCTBPATR.AsInteger   := iPlanPrevCtbPatro;
            qryDestinoDATAVENCOPER.AsDateTime       := CalcVenc(dbdDataOperacaoRec.DateTime, qryTipoOperRecVENCIMENTO.AsInteger);
            qryDestinoDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
            if qryDestinoNUMDOCUMENTO.IsNull then
               qryDestinoNUMDOCUMENTO.AsString      := BuscaBoleta(dbdDataOperacaoRec.DateTime, wIdForCli);
            qryDestinoFLGSTATUSFECHBOL.AsString     := 'F';
            qryDestinoFLGSTATUSORDMOV.AsString      := 'L';
            qryDestinoPRECOUNITOPERACAO.AsFloat     := 0;
            qryDestinoPERCENTUAL.AsFloat            := 0;
            qryDestinoORIGDEST.AsString             := 'D';
            if qryDestinoIDMOTIVOBLOQUEIO.IsNull then
               qryDestinoIDMOTIVOBLOQUEIO.AsInteger := -1;
            qryDestinoSIGLAMOTBLOQ.AsString      := qryMotBloqRecSIGLAMOTBLOQ.AsString;
            qryDestinoIDOPERCUSTODIA.Clear;
            qryDestinoALTERADO.AsString := 'S';
         end
         else
         begin
            if qryBoleta.Locate('IDBOLETA', qryDestinoNUMDOCUMENTO.AsString, []) then
            begin
               qryBoleta.Edit;
               qryBoletaEXCLUIBOLETA.AsString := 'S';
               qryBoleta.Post;
            end;
         end;
      end;
      inherited;
   except
      bbtnCancelarDet.Click;
   end;
end;

procedure TFrmCadCisao.dbrQtdProvExit(Sender: TObject);
begin
   inherited;
   if (Pos('Orig',TDBRealEdit(Sender).Name) > 0) then
   begin
      dbrVlrProv.Value := OperComum.DivValorZero((dbrQtdProv.Value * qryDIVPORACAO.AsFloat), QryInvestimentoAcaoQTDTITLOTE.AsInteger);
      CalculaVlrLiq('O')
   end
   else
   begin
      dbrVlrRec.Value := OperComum.DivValorZero((dbrQtdRec.Value * qryDIVPORACAO.AsFloat), QryInvestimentoAcaoQTDTITLOTE.AsInteger);
      CalculaVlrLiq('D');
   end;
end;

procedure TFrmCadCisao.tbcDetalheChange(Sender: TObject);
begin
   inherited;
   bbtnGeraOperacoes.Visible := (pgctrlDetalhe.ActivePage <> tbsDet);

   if pgctrlDetalhe.ActivePage = tbsOrigem then
      bbtnGeraOperacoes.Hint := 'Gera Origem'
   else if pgctrlDetalhe.ActivePage = tbsDestino then
      bbtnGeraOperacoes.Hint := 'Gera Destino'
   else
      bbtnGeraOperacoes.Hint := '';

   if pgctrlDetalhe.ActivePage = tbsOrigem then
      bbtnGeraOperacoes.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty))
   else if pgctrlDetalhe.ActivePage = tbsDestino then
      bbtnGeraOperacoes.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty) and
                                      (not qryOrigem.IsEmpty));
   sbtnInsDet.Visible := True;
   sbtnAltDet.Visible := True;
end;

function TFrmCadCisao.GeraOrigem: Boolean;
var wQtdOper, wVlrOperacao, wVlrCusto, wVlrVar,
    wPuProporcinal, wSdoQtdCPMF, wPUMedio: Double;
    wSaldoNormal, wSaldoCCI: Double;
    //AL_9    
    wIdNovaOperacao, wIdForCli, I, wIdForCliAnt, wIdPlanPrevAnt : Integer;
    DataAGECons: TDateTime;
    wNumDocCCI, wNumDocNormal, wNumDoc, sBol: String;
begin
   try
      try
         Result := False;
         qryOrigem.DisableControls;
         qryDestino.DisableControls;

         // Exclui as Operações de Destino Anteriores
         qryDestino.First;
         while not qryDestino.Eof do
         begin
            sBol := qryDestinoNUMDOCUMENTO.AsString;
            if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
               Raise Exception.Create('Não foi possível excluir as Operações de Destino da AGE ' + sBol);
            while ((not qryDestino.Eof) and (sBol = qryDestinoNUMDOCUMENTO.AsString)) do
               qryDestino.Next;
         end;

         // Exclui as operações de Origem Anteriores
         qryOrigem.First;
         while not qryOrigem.Eof do
         begin
            sBol := qryOrigemNUMDOCUMENTO.AsString;
            if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
               Raise Exception.Create('Não foi possível Excluir Operações de Origem da AGE ' + sBol);
            while ((not qryOrigem.Eof) and (sBol = qryOrigemNUMDOCUMENTO.AsString)) do
            begin
               qryOrigem.Next;
            end;
         end;

         SelDetOrig(qryIDOPERACAODIREITO.AsInteger);

         SelDetDest(qryIDOPERACAODIREITO.AsInteger);

         // AL_3
         if not qryDetalhe.Locate('ORIGDEST', 'O', []) then
         begin
            if not qryDetalhe.Locate('ORIGDEST', 'B', []) then
               Raise Exception.Create('Não foi Possível localizar o Investimento de Origem ou Base');
         end;

         fraMens.Mostra;
         fraMens.Mes := 'Buscando Saldos...';

         // Capta os Saldos do Investimentos na data
         OperComum.LimpaParametros(QrySaldoOrigem);
         QrySaldoOrigem.ParamByName('IDINVESTIMENTO').AsInteger := qryDetalheIDINVESTIMENTO.AsInteger;
         //AL_9 - Ini
         QrySaldoOrigem.ParamByName('DATAEX').AsString          := qryDATAEX.AsString;
         QrySaldoOrigem.ParamByName('FORCLI').AsString          := qryTipoOperacaoTIPCREDOR.AsString;
         QrySaldoOrigem.Open;

         fraMens.Mostra;
         fraMens.Max := QrySaldoOrigem.RecordCount;

         DataAGECons := qryDATAAGE.AsDateTime;
         if (Trim(qrySTATUS.AsString) <> '') then
         begin
            DataAGECons := DataAGECons - 1;
            while not DiasUteisInv.DiaUtil(DataAGECons,-1,1,'',True,False,False) do
                DataAGECons := DataAGECons - 1;   // Achar o dia útil anterior
         end;

         QrySaldoOrigem.First;
         while not QrySaldoOrigem.Eof do
         begin
            fraMens.Mes := 'Processando: ' + QrySaldoOrigemDESCCARTINVEST.AsString +  #13 +
                           OperComum.IIF(QrySaldoOrigemSGLCUSTODIANTE.IsNull, '', ' Custodia: ' + QrySaldoOrigemSGLCUSTODIANTE.AsString) +
                           OperComum.IIF(QrySaldoOrigemSIGLAMOTBLOQ.IsNull, '', ' Bloqueio: ' + QrySaldoOrigemSIGLAMOTBLOQ.AsString);

            QrySaldoOrigem.Edit;

            QrySaldoOrigemQTDEDIREITO.AsFloat       := OperComum.Round((QrySaldoOrigemQTDE.AsFloat * OperComum.DivValorZero(qryDetalhePERCENTUALINV.AsFloat,100)),0);
            QrySaldoOrigemDATAREFERENCIA.AsDateTime := qryDATAOPER.AsDateTime;

            wSaldoIRApu := 0;
            wSaldoQtd   := 0;
            wSaldoAqui  := 0;
            wSaldoVlr   := 0;
            wSdoQtdCPMF := 0;

            CtrlRV.BuscaSaldoRV.Executa(qryDATAEX.AsDateTime,
                                        QrySaldoOrigem.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                        QrySaldoOrigem.FieldByName('IDINVESTIMENTO').AsInteger,
                                        QrySaldoOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                        QrySaldoOrigem.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                        High(Integer),
                                        QrySaldoOrigem.FieldByName('IDCUSTODIANTE').AsInteger,
                                        QrySaldoOrigem.FieldByName('IDLOTE').AsString);  

            wSaldoQtd       := CtrlRV.BuscaSaldoRV.SaldoQtdTotal;
            wSaldoVlr       := CtrlRV.BuscaSaldoRV.SaldoVlrTotal;
            wSaldoAqui      := CtrlRV.BuscaSaldoRV.SaldoCusto;
            wSaldoIRApu     := CtrlRV.BuscaSaldoRV.SaldoIRApurado;
            wSaldoNormal    := CtrlRV.BuscaSaldoRV.SaldoQtdCC;
            wSaldoCCI       := CtrlRV.BuscaSaldoRV.SaldoQtdCCI;

            wPUMedio     := OperComum.DivValorZero(wSaldoVlr, wSaldoQtd);

            // AL_3 - Ini
            QrySaldoOrigemVALOREXERCIDO.AsFloat := QrySaldoOrigemQTDEDIREITO.AsFloat * wPUMedio;
            QrySaldoOrigemVLRLIQ.AsFloat := QrySaldoOrigemVALOREXERCIDO.AsFloat;
            QrySaldoOrigemIR.AsFloat     := 0;

            QrySaldoOrigem.FieldByName('VLRCUSTO').AsFloat         := OperComum.Round((wSaldoAqui * OperComum.DivValorZero(qryDetalhePERCENTUALINV.AsFloat,100)),2);
            QrySaldoOrigem.FieldByName('VLRCUSTOATUAL').AsFloat    := OperComum.Round((wSaldoAqui * OperComum.DivValorZero(qryDetalhePERCENTUALINV.AsFloat,100)),2);
            QrySaldoOrigem.FieldByName('VLRVARIACAOATUAL').AsFloat := OperComum.Round((wSaldoVar * OperComum.DivValorZero(qryDetalhePERCENTUALINV.AsFloat,100)),2);
            QrySaldoOrigem.Post;
            // AL_3 - Fim

            if QrySaldoOrigemQTDEDIREITO.AsFloat = 0 then
            begin
               QrySaldoOrigem.Next;
               Continue;
            end;

            // Inicia outros Dados
            wIdForCli := 0;
            if QrySaldoOrigemIDCARTEIRAGERENC.IsNull then
               FornecedorCli(QrySaldoOrigemIDCUSTODIANTE.AsInteger,
                             QrySaldoOrigemIDINVESTIMENTO.AsInteger, wIdForCli);

            if  (wSaldoNormal > 0) and
               ((wIdForCli <> wIdForCliAnt) or (wIdPlanPrevAnt <> QrySaldoOrigemIDPLANPREVCTBPATR.AsInteger) or (wNumDocNormal = '')) then
            begin
               // Gera numero de Boleta
               wNumDocNormal := 'RV-' + Copy(qryDATAOPER.AsString,9,2) + '/' +
                                             FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                                                                         Copy(qryDATAOPER.AsString,9,2)));
               qryBoleta.Insert;
               qryBoletaIDBOLETA.AsString     := wNumDocNormal;
               qryBoletaSTATUS.AsString       := 'F';
               qryBoletaDATABOLETA.AsDateTime := qryDATAOPER.AsDateTime;
               qryBoletaTIPMOVBOLETA.AsString := 'DCI';
               if wIdForCli > 0 then
                  qryBoletaIDFORCLI.AsInteger := wIdForCli;
               qryBoletaEXCLUIBOLETA.AsString := 'N';
               qryBoleta.Post;
            end;
            if  (wSaldoCCI > 0) and
               ((wIdForCli <> wIdForCliAnt) or (wIdPlanPrevAnt <> QrySaldoOrigemIDPLANPREVCTBPATR.AsInteger) or (wNumDocCCI = '')) then
            begin
               // Gera numero de Boleta
               wNumDocCCI := 'RV-' + Copy(qryDATAOPER.AsString,9,2) + '/' +
                                          FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                                                                         Copy(qryDATAOPER.AsString,9,2)));
               qryBoleta.Insert;
               qryBoletaIDBOLETA.AsString     := wNumDocCCI;
               qryBoletaSTATUS.AsString       := 'F';
               qryBoletaDATABOLETA.AsDateTime := qryDATAOPER.AsDateTime;
               qryBoletaTIPMOVBOLETA.AsString := 'DCI';
               if wIdForCli > 0 then
                  qryBoletaIDFORCLI.AsInteger := wIdForCli;
               qryBoletaEXCLUIBOLETA.AsString := 'N';
               qryBoleta.Post;
            end;

            if wIdForCli <> wIdForCliAnt then
               wIdForCliAnt := wIdForCli;

            if wIdPlanPrevAnt <> QrySaldoOrigemIDPLANPREVCTBPATR.AsInteger then
               wIdPlanPrevAnt := QrySaldoOrigemIDPLANPREVCTBPATR.AsInteger;

            // Para I = 1 - Saldo Normal
            //      I = 2 - Saldo CCI
            for I := 1 to 2 do
            begin
               qryTipoOperOrig.First;
               if I = 1 then
               begin
                  // Saldo Normal
                  qryTipoOperOrig.Locate('IDTIPOOPERACAO', qryIDTIPOOPERACAO.AsInteger, []);
                  // ProRata saldo Normal
                  //Al_10
                  wQtdOper := OperComum.Round(QrySaldoOrigemQTDEDIREITO.AsFloat * (OperComum.DivValorZero(wSaldoNormal,wSaldoQtd)),0);
                  wNumDoc  := wNumDocNormal;                  
               end
               else
               begin
                  // Saldo CCI
                  qryTipoOperOrig.Locate('IDTIPOOPERACAO', qryIDTIPOOPERACAO.AsInteger+10000, []);
                  // ProRata saldo CCI
                  //Al_10 
                  wQtdOper := OperComum.Round(QrySaldoOrigemQTDEDIREITO.AsFloat * (OperComum.DivValorZero(wSaldoCCI,wSaldoQtd)),0);
                  wNumDoc  := wNumDocCCI;
               end;

               if wQtdOper > 0 then
               begin
                  qryBoleta.First;               
                  if not qryBoleta.Locate('IDBOLETA', wNumDoc, []) then
                     Raise Exception.Create('Não foi possível localizar a boleta ' + wNumDoc);

                  // Gera Novo Id de Operacao
                  wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

                  if qryTipoOperOrigIDTIPOOPERACAO.IsNull then
                     Raise Exception.Create('Tipo de Operação não encontrado.');

                  wVlrCusto      := wSaldoAqui * OperComum.DivValorZero(wQtdOper, wSaldoQtd);
                  wVlrVar        := wSaldoVar * OperComum.DivValorZero(wQtdOper, wSaldoQtd);
                  wVlrOperacao   := wVlrCusto + wVlrVar;

                  wPuProporcinal := OperComum.DivValorZero(QrySaldoOrigemVLRLIQ.AsFloat,QrySaldoOrigemQTDEDIREITO.AsFloat);

                  wVlrOperacao   := OperComum.Round(wQtdOper*wPuProporcinal,2);

                  qryOrigem.Insert;
                  qryOrigemIDOPERACAOINVEST.AsInteger    := wIdNovaOperacao;
                  qryOrigemMOECODIGO.AsInteger           := pRPI.MOECODIGO;
                  qryOrigemIDMODULO.AsInteger            := Sistema.IdModulo;
                  qryOrigemEMPRESAPROP.AsInteger         := Sistema.IdEmpresa;
                  qryOrigemIDINVESTIMENTO.AsInteger      := QrySaldoOrigemIDINVESTIMENTO.AsInteger;
                  qryOrigemDESCINVESTIMENTO.AsString     := QrySaldoOrigemDESCINVESTIMENTO.AsString;
                  qryOrigemIDCARTEIRA.AsString           := QrySaldoOrigemIDCARTEIRA.AsString;
                  qryOrigemIDCARTEIRAINVEST.AsInteger    := QrySaldoOrigemIDCARTEIRAINVEST.AsInteger;
                  if not QrySaldoOrigemIDCARTEIRAGERENC.IsNull then
                     qryOrigemIDCARTEIRAGERENC.AsInteger := QrySaldoOrigemIDCARTEIRAGERENC.AsInteger
                  else
                     qryOrigemIDCARTEIRAGERENC.Clear;
                  qryOrigemDESCCARTINVEST.AsString       := QrySaldoOrigemDESCCARTINVEST.AsString;
                  qryOrigemIDTIPOINVEST.AsInteger        := 2;
                  qryOrigemIDTIPOOPERACAO.AsInteger      := qryTipoOperOrigIDTIPOOPERACAO.AsInteger;
                  qryOrigemDESCTIPOOPERACAO.AsString     := qryTipoOperOrigDESCTIPOOPERACAO.AsString;
                  qryOrigemNATUREZAOPERACAO.AsString     := qryTipoOperOrigNATUREZAOPERACAO.AsString;
                  if wIdForCli > 0 then
                     qryOrigemIDFORCLI.AsInteger         := wIdForCli;
                  if not QrySaldoOrigemIDLOTE.IsNull then
                     qryOrigemIDLOTE.AsString            := QrySaldoOrigemIDLOTE.AsString
                  else
                     qryOrigemIDLOTE.Clear;
                  if not QrySaldoOrigemIDCUSTODIANTE.IsNull then
                     qryOrigemIDCUSTODIANTE.AsInteger    := QrySaldoOrigemIDCUSTODIANTE.AsInteger
                  else
                     qryOrigemIDCUSTODIANTE.Clear;
                  if not QrySaldoOrigemSGLCUSTODIANTE.IsNull then
                     qryOrigemSGLCUSTODIANTE.AsString    := QrySaldoOrigemSGLCUSTODIANTE.AsString
                  else
                     qryOrigemSGLCUSTODIANTE.Clear;
                  qryOrigemIDOPERACAODIREITO.AsInteger   := qryIDOPERACAODIREITO.AsInteger;
                  qryOrigemIDPLANPREVCTBPATR.AsInteger   := QrySaldoOrigemIDPLANPREVCTBPATR.AsInteger; //iPlanPrevCtbPatro;
                  qryOrigemPLANPRVCONTABPATRO.AsString   := QrySaldoOrigemPLANPRVCONTABPATRO.AsString;
                  qryOrigemDATAOPERACAO.AsDateTime       := qryDATAOPER.AsDateTime;
                  qryOrigemDATAVENCOPER.AsDateTime       := CalcVenc(qryDATAOPER.AsDateTime, qryTipoOperOrigVENCIMENTO.AsInteger);
                  qryOrigemDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
                  qryOrigemNUMDOCUMENTO.AsString         := wNumDoc;
                  qryOrigemFLGSTATUSFECHBOL.AsString     := 'F';
                  qryOrigemFLGSTATUSORDMOV.AsString      := 'L';
                  qryOrigemQTDEOPERACAO.AsFloat          := wQtdOper;
                  qryOrigemPRECOUNITOPERACAO.AsFloat     := wPUMedio;
                  qryOrigemVLROPERACAO.AsFloat           := wVlrOperacao;
                  qryOrigemVLRIR.AsFloat                 := QrySaldoOrigemIR.AsFloat;
                  qryOrigemVLRREMUNERACAO.AsFloat        := QrySaldoOrigemVLRREMUNERACAO.AsFloat;
                  qryOrigemVLRIRREMUNER.AsFloat          := QrySaldoOrigemVLRIRREMUNERACAO.AsFloat;
                  qryOrigemVLRLIQUIDO.AsFloat            := wVlrOperacao;
                  qryOrigemPERCENTUAL.AsFloat            := qryDetalhePERCENTUALINV.AsFloat;
                  // AL_3
                  qryOrigemORIGDEST.AsString             := qryDetalheORIGDEST.AsString;
                  if not QrySaldoOrigemIDMOTIVOBLOQUEIO.IsNull then
                     qryOrigemIDMOTIVOBLOQUEIO.AsInteger := QrySaldoOrigemIDMOTIVOBLOQUEIO.AsInteger
                  else
                     qryOrigemIDMOTIVOBLOQUEIO.Clear;
                  if not QrySaldoOrigemSIGLAMOTBLOQ.IsNull then
                     qryOrigemSIGLAMOTBLOQ.AsString      := QrySaldoOrigemSIGLAMOTBLOQ.AsString
                  else
                     qryOrigemSIGLAMOTBLOQ.Clear;
                  qryOrigemIDOPERCUSTODIA.Clear;
                  qryOrigemALTERADO.AsString := 'S';
                  qryOrigemVLRCUSTOATUAL.AsFloat    := wVlrCusto;
                  qryOrigemVLRVARIACAOATUAL.AsFloat := wVlrVar;
                  qryOrigem.Post;
               end;
            end;
            // Contabiliza Origem no OK da AGE
            QrySaldoOrigem.Next;
            fraMens.Incrementa;
         end;
         //AL_9 - Fim         
         Result := True;
      except
         on E: Exception do
         begin
            MsgDlg('Houve um problema na geração das Operações de Origem desta AGE' + #13+
                   E.Message,'Mensagem do Sistema ', mtWarning, [mbOK], 0);
            bbtnCancelarDet.Click;
            bbtnCancelar.Click;
            Result := False;
         end;
      end;
   finally
      qryOrigem.EnableControls;
      qryDestino.EnableControls;
      QrySaldoOrigem.Close;
      fraMens.Apaga;
      CmeDetalhe.AtualizaBotoes(Self);
      sbtnConsDet.Enabled := not (qryOrigem.IsEmpty);
   end;
end;

function TFrmCadCisao.GeraDestino: Boolean;
//AL_9
var wIdOperXinv, wIdNovaOperacao, wIdForCli, wIdInvOrig, wIdForCliAnt, wIdPlanPrevAnt, iTipoOperAnt : Integer;
    wNumDoc, wNumDocAnt, sBol, sDataOperAnt: String;
begin
   try
      try
         Result := False;
         qryOrigem.DisableControls;
         qryDestino.DisableControls;

         // Exclui os Destinos Anteriores
         qryDestino.First;
         while not qryDestino.Eof do
         begin
            sBol := qryDestinoNUMDOCUMENTO.AsString;
            if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
               Raise Exception.Create('Não é possível Excluir as operações de Destino da Boleta ' + sBol);
            while ((not qryDestino.Eof) and (sBol = qryDestinoNUMDOCUMENTO.AsString)) do
            begin
               qryDestino.Next;
            end;
         end;

         SelDetDest(qryIDOPERACAODIREITO.AsInteger);

         // Inicia a geração dos Destinos a partir das Origens cadastradas
         //    Para cada Origem é gerado um Destino equivalente
         fraMens.Mostra;
         fraMens.Max := (qryOrigem.RecordCount * 3);
         qryOrigem.First;
         wNumDocAnt := '';

         if not qryDetalhe.Locate('ORIGDEST', 'D', []) then
            Raise Exception.Create('Não foi Possível localizar o Investimento de Destino');

         if not QryInvestimentoAcao.Locate('IDINVESTIMENTO', qryDetalheIDINVESTIMENTO.AsInteger, []) then
            Raise Exception.Create('Não foi Possível localizar o Investimento de Destino');

         // AL_3 - Ini
         // Verificar depois com ficaria um saldo CCI
         if not qryTipoOperRec.Locate('IDTIPOOPERACAO', -127, []) then
            Raise Exception.Create('Tipo de operação de Acréscimo por Cisão não encontrado.');

         // AL_2 - Ini
         wIdInvOrig := 0;
         if qryDetalhe.Locate('ORIGDEST','O',[]) then
            wIdInvOrig := qryDetalheIDINVESTIMENTO.AsInteger
         else
         begin
            if qryDetalhe.Locate('ORIGDEST','B',[]) then
               wIdInvOrig := qryDetalheIDINVESTIMENTO.AsInteger
            else
               Raise Exception.Create('Não foi Possível localizar o Investimento de Origem');
         end;
         // AL_2 - Fim

         //AL_9         

         qryDetalhe.First;
         while not qryDetalhe.Eof do
         begin
            if qryDetalhe.FieldByName('ORIGDEST').AsString = 'D' then
            begin
               qryOrigem.First;
               while not qryOrigem.Eof do
               begin
                  fraMens.Mes := 'Processando: ' + qryOrigemDESCCARTINVEST.AsString +  #13 +
                                 OperComum.IIF(qryOrigemSGLCUSTODIANTE.IsNull, '', ' Custodia: ' + qryOrigemSGLCUSTODIANTE.AsString) +
                                 OperComum.IIF(qryOrigemSIGLAMOTBLOQ.IsNull, '', ' Bloqueio: ' + qryOrigemSIGLAMOTBLOQ.AsString);
                  //AL_10
                  //Caso o parametro de carteria gerencial for N (Não) ou estiver Nulo e a data da operação for
                  // maior que a data de encerramento da carteria gerencial, NÃO gera o recebimento
                  if (((pRPI.FLGCARTGERENC = 'N') or (pRPI.FLGCARTGERENC = '')) and (qryDATACOM.AsDateTime > pRPI.DATAMOVCDBLIB)) and
                     (not qryOrigemIDCARTEIRAGERENC.IsNull) then
                  begin
                     qryOrigem.Next;
                     fraMens.Incrementa;
                     Continue;
                  end;

                  // AL_3
                  // Gera Novo Id de Operacao
                  wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

                  // Grava o Destino
                  qryDestino.Insert;
                  qryDestinoIDOPERACAOINVEST.AsInteger    := wIdNovaOperacao;
                  qryDestinoIDOPERACAOORIGEM.AsInteger    := qryOrigemIDOPERACAOINVEST.AsInteger;
                  qryDestinoMOECODIGO.AsInteger           := pRPI.MOECODIGO;
                  qryDestinoIDMODULO.AsInteger            := Sistema.IdModulo;
                  qryDestinoEMPRESAPROP.AsInteger         := Sistema.IdEmpresa;
                  qryDestinoIDINVESTIMENTO.AsInteger      := qryDetalheIDINVESTIMENTO.AsInteger;
                  qryDestinoDESCINVESTIMENTO.AsString     := qryDetalheDESCINVESTIMENTO.AsString;
                  qryDestinoIDCARTEIRA.AsString           := qryOrigemIDCARTEIRA.AsString;
                  qryDestinoIDCARTEIRAINVEST.AsInteger    := qryOrigemIDCARTEIRAINVEST.AsInteger;
                  if not qryOrigemIDCARTEIRAGERENC.IsNull then
                     qryDestinoIDCARTEIRAGERENC.AsInteger := qryOrigemIDCARTEIRAGERENC.AsInteger
                  else
                     qryDestinoIDCARTEIRAGERENC.Clear;
                  qryDestinoDESCCARTINVEST.AsString       := qryOrigemDESCCARTINVEST.AsString;
                  qryDestinoIDTIPOINVEST.AsInteger        := 2;
                  qryDestinoIDTIPOOPERACAO.AsInteger      := qryTipoOperRecIDTIPOOPERACAO.AsInteger;
                  qryDestinoDESCTIPOOPERACAO.AsString     := qryTipoOperRecDESCTIPOOPERACAO.AsString;
                  qryDestinoNATUREZAOPERACAO.AsString     := qryTipoOperRecNATUREZAOPERACAO.AsString;
                  if not qryOrigemIDLOTE.IsNull then
                     qryDestinoIDLOTE.AsString            := qryOrigemIDLOTE.AsString
                  else
                     qryDestinoIDLOTE.Clear;
                  if not qryOrigemIDCUSTODIANTE.IsNull then
                     qryDestinoIDCUSTODIANTE.AsInteger    := qryOrigemIDCUSTODIANTE.AsInteger
                  else
                     qryDestinoIDCUSTODIANTE.Clear;
                  if not qryOrigemSGLCUSTODIANTE.IsNull then
                     qryDestinoSGLCUSTODIANTE.AsString    := qryOrigemSGLCUSTODIANTE.AsString
                  else
                     qryDestinoSGLCUSTODIANTE.Clear;
                  qryDestinoIDOPERACAODIREITO.AsInteger   := qryIDOPERACAODIREITO.AsInteger;
                  //AL_9                  
                  if qryOrigemIDFORCLI.AsInteger > 0 then
                     qryDestinoIDFORCLI.AsInteger         := qryOrigemIDFORCLI.AsInteger;
                  qryDestinoIDPLANPREVCTBPATR.AsInteger   := qryOrigemIDPLANPREVCTBPATR.AsInteger;
                  qryDestinoPLANPRVCONTABPATRO.AsString   := qryOrigemPLANPRVCONTABPATRO.AsString;
                  qryDestinoDATAOPERACAO.AsDateTime       := qryDATAOPER.AsDateTime;
                  qryDestinoDATAVENCOPER.AsDateTime       := CalcVenc(qryDATAOPER.AsDateTime, qryTipoOperRecVENCIMENTO.AsInteger);
                  qryDestinoDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
                  qryDestinoFLGSTATUSFECHBOL.AsString     := 'F';
                  qryDestinoFLGSTATUSORDMOV.AsString      := 'L';
                  qryDestinoPERCENTUAL.AsFloat            := qryDetalhePERCENTUALINV.AsFloat;

                  if (qryDestinoIDTIPOOPERACAO.AsInteger IN [pRPI.IDTIPOOPERDIRCIS,pRPI.IDTIPOOPERDIRCIS+10000]) then
                      qryDestinoQTDEOPERACAO.AsFloat       := qryOrigemQTDEOPERACAO.AsFloat - OperComum.Round((qryOrigemQTDEOPERACAO.AsFloat * OperComum.DivValorZero(qryDetalhePERCENTUALINV.AsFloat,100)),0)
                  else
                      qryDestinoQTDEOPERACAO.AsFloat       := OperComum.Round((qryOrigemQTDEOPERACAO.AsFloat * OperComum.DivValorZero(qryDetalhePERCENTUALINV.AsFloat,100)),0);

                  qryDestinoORIGDEST.AsString             := 'D';
                  if not qryOrigemIDMOTIVOBLOQUEIO.IsNull then
                     qryDestinoIDMOTIVOBLOQUEIO.AsInteger := qryOrigemIDMOTIVOBLOQUEIO.AsInteger
                  else
                     qryDestinoIDMOTIVOBLOQUEIO.Clear;
                  if not qryOrigemSIGLAMOTBLOQ.IsNull then
                     qryDestinoSIGLAMOTBLOQ.AsString      := qryOrigemSIGLAMOTBLOQ.AsString
                  else
                     qryDestinoSIGLAMOTBLOQ.Clear;
                  qryDestinoIDOPERCUSTODIA.Clear;
                  qryDestinoALTERADO.AsString := 'S';

                  if (qryDestinoIDTIPOOPERACAO.AsInteger IN [pRPI.IDTIPOOPERDIRCIS,pRPI.IDTIPOOPERDIRCIS+10000]) then
                      qryDestinoVLRCUSTOATUAL.AsFloat    := qryOrigemVLRCUSTOATUAL.AsFloat - OperComum.Round((qryOrigemVLRCUSTOATUAL.AsFloat * OperComum.DivValorZero(qryDetalhePERCENTUALINV.AsFloat,100)),2)
                  else
                     qryDestinoVLRCUSTOATUAL.AsFloat    := OperComum.Round((qryOrigemVLRCUSTOATUAL.AsFloat * OperComum.DivValorZero(qryDetalhePERCENTUALINV.AsFloat,100)),2);

                  if (qryDestinoIDTIPOOPERACAO.AsInteger IN [pRPI.IDTIPOOPERDIRCIS,pRPI.IDTIPOOPERDIRCIS+10000]) then
                      qryDestinoVLRVARIACAOATUAL.AsFloat := qryOrigemVLRVARIACAOATUAL.AsFloat - OperComum.Round((qryOrigemVLRVARIACAOATUAL.AsFloat * OperComum.DivValorZero(qryDetalhePERCENTUALINV.AsFloat,100)),2)
                  else
                     qryDestinoVLRVARIACAOATUAL.AsFloat := OperComum.Round((qryOrigemVLRVARIACAOATUAL.AsFloat * OperComum.DivValorZero(qryDetalhePERCENTUALINV.AsFloat,100)),2);

                  qryDestinoVLROPERACAO.AsFloat          := qryDestinoVLRCUSTOATUAL.AsFloat + qryDestinoVLRVARIACAOATUAL.AsFloat;

                  qryDestinoPRECOUNITOPERACAO.AsFloat    := OperComum.DivValorZero(qryDestinoVLROPERACAO.AsFloat, qryDestinoQTDEOPERACAO.AsFloat);

                  qryDestino.Post;

                  qryOrigem.Next;
                  fraMens.Incrementa;
               end;
            end;
            qryDetalhe.Next;
         end;

         //AL_9
         wIdForCliAnt   := 0;
         wIdPlanPrevAnt := 0;
         sDataOperAnt   := '';
         iTipoOperAnt   := 0;

         fraMens.Mes := 'Gerando Boletas : ';

         qryDestino.First;
         while not qryDestino.Eof do
         begin
            // Se for parcial, o documento da operação anterior já esta preenchido
            if qryDestinoNUMDOCUMENTO.IsNull then
            begin
               if (wIdForCliAnt   <> qryDestino.FieldByName('IDFORCLI').AsInteger) or
                  (wIdPlanPrevAnt <> qryDestino.FieldByName('IDPLANPREVCTBPATR').AsInteger) or
                  (sDataOperAnt   <> qryDestino.FieldByName('DATAOPERACAO').AsString) or
                  (iTipoOperAnt   <> qryDestino.FieldByName('IDTIPOOPERACAO').AsInteger) then
               begin
                  // Gera numero de Boleta
                  wNumDoc := 'RV-' + Copy(qryDestinoDATAOPERACAO.AsString,9,2) + '/' +
                                          FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' + Copy(qryDestinoDATAOPERACAO.AsString,9,2)));
                  fraMens.Mes := 'Gerando Boletas : ' + #13 + wNumDoc;

                  // Capta o ForCli
                  wIdForCli := qryDestino.FieldByName('IDFORCLI').AsInteger;

                  // Grava a Boleta
                  qryBoleta.Insert;
                  qryBoletaIDBOLETA.AsString     := wNumDoc;
                  qryBoletaSTATUS.AsString       := 'F';
                  qryBoletaDATABOLETA.AsDateTime := qryDATACOM.AsDateTime;
                  qryBoletaTIPMOVBOLETA.AsString := 'DCI';
                  if wIdForCli > 0 then
                     qryBoletaIDFORCLI.AsInteger    := wIdForCli;
                  qryBoletaEXCLUIBOLETA.AsString := 'N';
                  qryBoleta.Post;

                  // Atualiza as variáveis de trabalho
                  wIdForCliAnt   := qryDestino.FieldByName('IDFORCLI').AsInteger;
                  wIdPlanPrevAnt := qryDestino.FieldByName('IDPLANPREVCTBPATR').AsInteger;
                  sDataOperAnt   := qryDestino.FieldByName('DATAOPERACAO').AsString;
                  iTipoOperAnt   := qryDestino.FieldByName('IDTIPOOPERACAO').AsInteger;
               end;

               // Atualiza o Recebimento
               qryDestino.Edit;
               qryDestinoNUMDOCUMENTO.AsString := wNumDoc;
               qryDestino.Post;
            end;
            qryDestino.Next;
            fraMens.Incrementa;
         end;

         Result := True;

      except
         on E: Exception do
         begin
            MsgDlg('Houve um problema na Geração das operações de Destino desta AGE' + #13+
                   E.Message,'Mensagem do Sistema ', mtWarning, [mbOK], 0);
            bbtnCancelarDet.Click;
            bbtnCancelar.Click;
            Result := False;
         end;
      end;
   finally
      qryOrigem.First;
      qryOrigem.EnableControls;
      qryDestino.First;
      qryDestino.EnableControls;
      fraMens.Apaga;
      CmeDetalhe.AtualizaBotoes(Self);
      sbtnConsDet.Enabled := not (qryDestino.IsEmpty);
   end;
end;

Function TFrmCadCisao.BuscaBoleta(dData: TDateTime; wIDForCli: Integer): String;
var qrySelBoleta: TwwQuery;
begin
   Result := '';
   try
      qrySelBoleta := TwwQuery.Create(Self);
      qrySelBoleta.DatabaseName := 'BaseDados';
      with qrySelBoleta, OperComum do
      begin
         SQL.Add('SELECT DISTINCT NUMDOCUMENTO ');
         SQL.Add('FROM OPERACAOINVEST ');
         SQL.Add('WHERE IDOPERACAODIREITO = ' + qryIDOPERACAODIREITO.AsString);
         Open;
         if not IsEmpty then
            // Utiliza Boleta já existente
            Result := FieldByName('NUMDOCUMENTO').AsString
         else
         begin
            Result := 'RV-' + Copy(DateToStr(dData),9,2) + '/' +
                                   FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                                                                      Copy(DateToStr(dData),9,2)));
            qryBoleta.Insert;
            qryBoletaIDBOLETA.AsString     := Result;
            qryBoletaSTATUS.AsString       := 'F';
            qryBoletaDATABOLETA.AsDateTime := dData;
            qryBoletaTIPMOVBOLETA.AsString := 'DCI';
            qryBoletaIDFORCLI.AsInteger    := wIDForCli;
            qryBoletaEXCLUIBOLETA.AsString := 'N';
            qryBoleta.Post;
         end;
      end;
   finally
      qrySelBoleta.Close;
      qrySelBoleta.Free;
   end;
end;

function TFrmCadCisao.CalcVenc(dDataOper: TDateTime; iPrazo: Integer): TDateTime;
begin
   Result := DiasUteisInv.SomaDiasUteis(dDataOper, iPrazo,-1,1,'',True,False,False)
end;

function TFrmCadCisao.AchaOrigem(iInvest, iCartInvest, iCartGerenc,
                                 iCustodiante, iMotBloq: Integer): Boolean;
begin
   Result := True;
   with OperComum do
   begin
      // Procura uma Origem com os mesmos dados
      qryOrigem.First;
      while not qryOrigem.Eof do
      begin
         if (qryOrigemIDINVESTIMENTO.AsInteger   = iInvest) and
            (qryOrigemIDCARTEIRAINVEST.AsInteger = iCartInvest) and
            (qryOrigemIDCARTEIRAGERENC.AsInteger = iCartGerenc) and
            (qryOrigemIDCUSTODIANTE.AsInteger    = iCustodiante) and
            (qryOrigemIDMOTIVOBLOQUEIO.AsInteger = iMotBloq) then
            Break;
         qryOrigem.Next;
      end;
      // Se não achou, a query está em EOF (Não fez o Break)
      if qryOrigem.Eof then
         Result := False;
   end;
end;

procedure TFrmCadCisao.bbtnGeraOperacoesClick(Sender: TObject);
begin
   inherited;
   try
      if pgctrlDetalhe.ActivePage = tbsOrigem then
      begin
         with qryOrigem, OperComum do
         begin
            if not IsEmpty then
            begin
               if InvMsgBox('Para Regerar as Operações de Origem é Necessário Excluir as Operações Atuais',
                            mtConfirmation, 'Mensagem do Sistema',
                            [mbYes, mbCancel], 'Continua;Cancela') = mrCancel then
                  Exit;
            end;

            if not VerificaInvestimentos Then
               Exit;

            GeraOrigem;
         end;
      end
      else if pgctrlDetalhe.ActivePage = tbsDestino then
      begin
         with qryDestino, OperComum do
         begin
            if not IsEmpty then
            begin
               if InvMsgBox('Para Regerar as Operações de Destino é Necessário Excluir as Operações Atuais',
                            mtConfirmation, 'Mensagem do Sistema',
                            [mbYes, mbCancel], 'Continua;Cancela') = mrCancel then
                  Exit;
            end;
            
            if not VerificaInvestimentos Then
               Exit;

            GeraDestino;
         end;
      end;
   finally
      bbtnGeraOperacoes.Down := False;
   end;
end;

procedure TFrmCadCisao.dsStateChange(Sender: TObject);
begin
   inherited;
   if pgctrlDetalhe.ActivePage = tbsOrigem then
      bbtnGeraOperacoes.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty))
   else if pgctrlDetalhe.ActivePage = tbsDestino then
      bbtnGeraOperacoes.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty) and
                                      (not qryOrigem.IsEmpty));
end;

procedure TFrmCadCisao.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;
   Sel(qryIDOPERACAODIREITO.AsInteger);
end;

procedure TFrmCadCisao.dsDetStateChange(Sender: TObject);
begin
   inherited;
   HabDetDest((qryDestino.State = dsInsert));
   dbrQtdRec.Enabled    := (qryDestino.State in [dsInsert, dsEdit]);
end;

procedure TFrmCadCisao.dblCarteiraProvisaoExit(Sender: TObject);
begin
  inherited;
  // Para Carteiras Próprias, o defaul é saldo liberado
  if Trim(dblMotivoBloqueioProv.Text) = '' then
  begin
     if (qryCarteiraOrigIDCARTEIRAGERENC.IsNull) and (qryOrigem.State = dsInsert) then
        qryOrigemIDMOTIVOBLOQUEIO.AsInteger := -1;
  end;
  if Trim(dblCarteiraProvisao.Text) <> '' then
  begin
     qryOrigemIDCARTEIRAINVEST.AsInteger := qryCarteiraOrigIDCARTEIRAINVEST.AsInteger;
     if not qryCarteiraOrigIDCARTEIRAGERENC.IsNull then
        qryOrigemIDCARTEIRAGERENC.AsInteger := qryCarteiraOrigIDCARTEIRAGERENC.AsInteger
     else
        qryOrigemIDCARTEIRAGERENC.Clear;
  end;
end;

procedure TFrmCadCisao.dblCarteiraRecExit(Sender: TObject);
begin
  inherited;
  // Para Carteiras Próprias, o defaul é saldo liberado
  if Trim(dblMotivoBloqueioRec.Text) = '' then
  begin
     if (qryCarteiraRecIDCARTEIRAGERENC.IsNull) and (qryDestino.State = dsInsert) then
        qryDestinoIDMOTIVOBLOQUEIO.AsInteger := -1;
  end;
  if Trim(dblCarteiraRec.Text) <> '' then
  begin
     qryDestinoIDCARTEIRAINVEST.AsInteger := qryCarteiraRecIDCARTEIRAINVEST.AsInteger;
     if not qryCarteiraRecIDCARTEIRAGERENC.IsNull then
        qryDestinoIDCARTEIRAGERENC.AsInteger := qryCarteiraRecIDCARTEIRAGERENC.AsInteger
     else
        qryDestinoIDCARTEIRAGERENC.Clear;
  end;
end;

procedure TFrmCadCisao.CmeDetalheEdit(Sender: TObject);
begin
   inherited;
   // Controle de Quantidade alterada no recebimento
   if pgctrlDetalhe.ActivePage = tbsDestino then
      wQtdOperAnt := qryDestinoQTDEOPERACAO.AsFloat;
end;

procedure TFrmCadCisao.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if qryDetalhe.IsEmpty then
     dblEmissor.Enabled := True
  else
     dblEmissor.Enabled := False;

  if qryOrigem.IsEmpty then
  begin
     dblTipoOperacao.Enabled := True;
     dbdAGE.Enabled  := True;
     dbdEX.Enabled   := True;
     dbdOper.Enabled := True;
  end
  else
  begin
     dblTipoOperacao.Enabled := False;
     dbdAGE.Enabled  := False;
     dbdEX.Enabled   := False;
     dbdOper.Enabled := False;
  end;

  if qryDestino.IsEmpty then
     dbdCOM.Enabled := True
  else
     dbdCOM.Enabled := False;

end;

procedure TFrmCadCisao.dbdDataOperacaoRecExit(Sender: TObject);
begin
  inherited;
  if qryDestino.State in [dsEdit, dsInsert] then
     qryDestinoDATAVENCOPER.AsDateTime := CalcVenc(dbdDataOperacaoRec.DateTime, qryTipoOperRecVENCIMENTO.AsInteger);

end;

procedure TFrmCadCisao.sbtnInsDetClick(Sender: TObject);
begin
   if pgctrlDetalhe.ActivePage <> tbsDet then
   begin
      if not VerificaInvestimentos Then
         Exit;
   end;      
   inherited;
end;

procedure TFrmCadCisao.sbtnAltDetClick(Sender: TObject);
var iOper: Integer;
begin
   if pgctrlDetalhe.ActivePage = tbsDet then
   begin
      wOrigem := False;
      wDestino := False;
      iOper := qryDetalheIDOPERDIREITOXINV.AsInteger;
      // AL_3
      if qryDetalhe.Locate('ORIGDEST', 'O', []) then
         wOrigem := True
      else if qryDetalhe.Locate('ORIGDEST', 'B', []) then
         wOrigem := True;
      if qryDetalhe.Locate('ORIGDEST', 'D', []) then
         wDestino := True;
      qryDetalhe.Locate('IDOPERDIREITOXINV', iOper, []);
   end;

   inherited;

end;

procedure TFrmCadCisao.sbtnApagarClick(Sender: TObject);
var sBol: String;
begin
   // AL_4
   if RendaVariavel.VerEmAbertura then
   begin
      CmeCadastro.AtualizaBotoes(Self);
      Exit;
   end;

   if MsgDlg('Exclui a AGE, o Investimento e as Operações de Origem e Destino?','Mensagem do Sistema',mtConfirmation,[mbYes, mbNo],0) = mrYes then
   begin
      try
         // Exclui as Operações de Destino Anteriores
         qryDestino.First;
         while not qryDestino.Eof do
         begin
            //AL_8
            if not CtrlInvContab.TestaPeriodo(qryDestinoDATAOPERACAO.AsString, 2) then
               Raise Exception.Create(CtrlInvContab.MessageInfo);

            sBol := qryDestinoNUMDOCUMENTO.AsString;
            if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
               Raise Exception.Create('Não foi possível excluir as Operações de Destino da Boleta ' + sBol);
            while ((not qryDestino.Eof) and (sBol = qryDestinoNUMDOCUMENTO.AsString)) do
               qryDestino.Next;
         end;

         // Exclui as operações de Origem Anteriores
         qryOrigem.First;
         while not qryOrigem.Eof do
         begin
            //AL_8
            if not CtrlInvContab.TestaPeriodo(qryOrigemDATAOPERACAO.AsString, 2) then
               Raise Exception.Create(CtrlInvContab.MessageInfo);

            sBol := qryOrigemNUMDOCUMENTO.AsString;
            if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
               Raise Exception.Create('Não foi possível Excluir Operações de Origem da boleta ' + sBol);
            while ((not qryOrigem.Eof) and (sBol = qryOrigemNUMDOCUMENTO.AsString)) do
               qryOrigem.Next;
         end;

         // Exclui os Investimentos - Origem e Destino
         fraMens.Mostra;
         fraMens.Max := qryDetalhe.RecordCount;
         fraMens.Pos := 0;
         fraMens.Mes := 'Excluindo os Investimentos da AGE';
         qryDetalhe.First;
         while not qryDetalhe.Eof do
         begin
            qryDetalhe.Delete;
            fraMens.Incrementa;
         end;
         qryDetalhe.ApplyUpdates;
         fraMens.Apaga;

         // Exclui a AGE
         // inherited;
         qry.Delete;
         qry.ApplyUpdates;

         Sel(-1);
         CmeCadastro.AtualizaBotoes(Self);

      except
         on E:Exception do
         begin
            MsgDlg('Não foi possível excluir esta AGE. '+ #13 +
                   E.Message, 'Mensagem do Sistema', mtWarning,[MbOk],0);
            bbtnCancelar.Click;
         end;
      end
   end;
end;

procedure TFrmCadCisao.CmeDetalheApplyInsert(sender: TObject; var Accept: Boolean);
var sDataLanc: String;
begin
   Accept := False;
   sDataLanc := '';

   if pgctrlDetalhe.ActivePage = tbsDet then
   begin
      if Trim(dblInvestimento.Text) = '' then
      begin
         MsgDlg('Selecione um Investimento.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblInvestimento.CanFocus then
            dblInvestimento.SetFocus;
         Exit;
      end
      else
      if Trim(dblOrigDest.Text) = '' then
      begin
         MsgDlg('Selecione Origem ou Destino para o Investimento.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblOrigDest.CanFocus then
            dblOrigDest.SetFocus;
         Exit;
      end
      //al_3 - Ini
      else
      if DbrPercentual.Value = 0 then
      begin
         MsgDlg('Preencha um percentual para o Investimento.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if DbrPercentual.CanFocus then
            DbrPercentual.SetFocus;
         Exit;
      end;
      // AL_3 - Fim
   end
   else if pgctrlDetalhe.ActivePage = tbsOrigem then
   begin
      if Trim(dblTipoOperProv.Text) = '' then
      begin
         MsgDlg('Não foi selecionado um tipo de operação,'+#13+
                'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblTipoOperProv.CanFocus then
            dblTipoOperProv.SetFocus;
         Exit;
      end
      else
      if Trim(dblCarteiraProvisao.Text) = '' then
      begin
         MsgDlg('Não foi selecionada uma Carteira,'+#13+
                'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblCarteiraProvisao.CanFocus then
            dblCarteiraProvisao.SetFocus;
         Exit;
      end
      else
      if (Trim(dblCustodianteProv.Text) = '') and (qryCarteiraOrigIDCARTEIRAGERENC.IsNull) then
      begin
         MsgDlg('Não foi selecionado um Custodiante,'+#13+
                'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblCustodianteProv.CanFocus then
            dblCustodianteProv.SetFocus;
         Exit;
      end
      else
      if dbrQtdProv.Value = 0 then
      begin
         MsgDlg('Não foi informada uma Quantidade,'+#13+
                'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dbrQtdProv.CanFocus then
            dbrQtdProv.SetFocus;
         Exit;
      end;

      sDataLanc := qryOrigemDATAOPERACAO.AsString;
   end
   else if pgctrlDetalhe.ActivePage = tbsDestino then
   begin
      if Trim(dblTipoOperRec.Text) = '' then
      begin
         MsgDlg('Não foi selecionado um tipo de operação para esta Operação,'+#13+
                'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblTipoOperRec.CanFocus then
            dblTipoOperRec.SetFocus;
         Exit;
      end
      else
      if Trim(dblCarteiraRec.Text) = '' then
      begin
         MsgDlg('Não foi selecionada uma Carteira para esta Operação,'+#13+
                'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblCarteiraRec.CanFocus then
            dblCarteiraRec.SetFocus;
         Exit;
      end
      else
      if (Trim(dblCustodianteRec.Text) = '') and (qryCarteiraRecIDCARTEIRAGERENC.IsNull) then
      begin
         MsgDlg('Não foi selecionado um Custodiante para esta Operação,'+#13+
                'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblCustodianteRec.CanFocus then
            dblCustodianteRec.SetFocus;
         Exit;
      end
      else
      if dbrQtdRec.Value = 0 then
      begin
         MsgDlg('Não foi informado uma Quantidade para esta Operação,'+#13+
                'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dbrQtdRec.CanFocus then
            dbrQtdRec.SetFocus;
         Exit;
      end;
      sDataLanc := qryDestinoDATAOPERACAO.AsString;
   end;

   if ((qryTipoOperacaoFLGGERACONTAB.AsInteger > 0) or (qryTipoOperacaoFLGGERACAPCAR.AsInteger > 0)) and
      (sDataLanc <> '')  then
   begin
      //AL_8
      if not CtrlInvContab.TestaPeriodo(sDataLanc, 2) then
      begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         Exit;
      end;
   end;

   Accept := True;
   inherited;

end;

procedure TFrmCadCisao.FormCreate(Sender: TObject);
begin
  inherited;
   //AL_9
   CtrlRV := TCtrlRendaVariavel.Create;
   CtrlRV.InitializeAs(Padroes);
end;

procedure TFrmCadCisao.dbdCOMExit(Sender: TObject);
begin
  inherited;
   OperComum.LimpaParametros(QryInvestimentoAcao);
   QryInvestimentoAcao.Open;
end;

function TFrmCadCisao.VerificaInvestimentos : Boolean;
var
   fPercOrig, fPercDest : double;
   iOrig, iDest : Integer;
begin
  inherited;
   fPercOrig := 0;
   fPercDest := 0;
   iOrig := 0;
   iDest := 0;

   qryDetalhe.First;
   while not qryDetalhe.Eof do
   begin
      // AL_3
      If (qryDetalhe.FieldByName('ORIGDEST').AsString = 'O') or
         (qryDetalhe.FieldByName('ORIGDEST').AsString = 'B') then
      begin
         iOrig     := iOrig + 1;
         fPercOrig := fPercOrig + qryDetalhe.FieldByName('PERCENTUALINV').AsFloat;
      end
      else
      begin
         iDest     := iDest + 1;
         fPercDest := fPercDest + qryDetalhe.FieldByName('PERCENTUALINV').AsFloat;
      end;
      qryDetalhe.Next;
   end;

   qryDetalhe.First;

   if iOrig > 1 then
   begin
      MsgDlg('Foi encontrado mais de uma Origem, não será possível efetuar a operação', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   end;

   if iOrig < 1 then
   begin
      MsgDlg('Não foi encontrado nenhuma Origem, não será possível efetuar a operação', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   end;

   // AL_3 - Inicio
   if fPercDest <> 100 then
   begin
      if MsgDlg('O somatório do percentual dos investimentos destino deve ser 100.' + #13 +
                'existe uma divergência de ' + FloatToStrF(100-fPercDest,ffNumber,16,9) + #13 +
                'Continua?', 'Mensagem do Sistema', mtWarning, [mbYes, mbNo], 0) = mrNo then
      begin
         Result := False;
         Exit;
      end;
   end;
   // AL_3 - Fim

   Result := True;
end;

procedure TFrmCadCisao.DbrPercentualExit(Sender: TObject);
begin
  inherited;
   if bbtnOkDet.CanFocus then
      bbtnOkDet.SetFocus;
end;

procedure TFrmCadCisao.dbrVlrVariacaoProvExit(Sender: TObject);
begin
  inherited;
   dbrVlrProv.Value := dbrVlrCustoProv.Value + dbrVlrVariacaoProv.Value;
end;

procedure TFrmCadCisao.dbrVlrVariacaoRecExit(Sender: TObject);
begin
  inherited;
   dbrVlrRec.Value := dbrVlrCustoRec.Value + dbrVlrVariacaoRec.Value;
end;

//AL_9
procedure TFrmCadCisao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
   FreeAndNil(CtrlRV);
end;

end.
