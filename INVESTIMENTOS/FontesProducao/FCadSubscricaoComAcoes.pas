//******************************************************************************
// Data      : 16/06/2008
// Código    : AL_11
// Pendencia : 25729
// SOL       : 63283
// Desc      : Ajuste nos filtros para data limite de utilização das carteiras
//               gerenciais.
//             Ajuste no SQL da query de saldos de origem (DFM)
//******************************************************************************
// Data      : 07/05/2008
// Código    : AL_10
// Pendencia : 27452
// SOL       : 79614
// Desc      : Inclusão de filtro nas qrySaldoOrigem para não trazer registros
//             de CarteiraGerencial após a data do parametro DATAMOVCDBLIB
//******************************************************************************
// Data      : 04/03/2008
// Código    : AL_9
// Pendencia : 27452
// SOL       : 79614
// Desc      : Ajuste no SQL para buscar operações efetuadas com saldo CCI
//******************************************************************************
// Data      : 13/02/2007
// Código    : AL_8
// Pendencia : 24464
// Desc      : Passa a não gravar o ID do HistCartInv nas OperCustodia
//             Obs. No reprocessamento já não gravava.
//******************************************************************************
// Data      : 22/01/2007
// Código    : AL_7
// Pendencia : 22979
// Desc      : Implantação de Segragação de Planos
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_6
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_5
// Desc     : Retirada do Saldo CCI de Custódia da BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_4
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_3
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//*****************************************************************************
//Data	    : 06/03/2006
//Código    : Al_2
//Motivo(S) : Implementação da trava de fechamento de renda variavel
//******************************************************************************
// Data      : 20/12/2005
// Código    : AL_1
// Pendencia : 20781
// SOL       : 38597
//           : Implementação de Cancelamento de Subscrição com Ações
//******************************************************************************
// Data     : 27/10/2005
// Função   : Efetuar o cadastro das operações de Subscrição e Direito de Subscrição
//
// Operações: ---------------------------------------------------------------------
//            * Subscrição com Ações:
//              Baixa a posição do investimento origem e aumenta o destino
//*********************************************************************************
unit FCadSubscricaoComAcoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMDetCSInv, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  fcLabel, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, DBCtrls, FCadastroRMDetCSInv, Mask,
  FCadMestreDetCSInv, faMensagem, dxCntner, dxEditor, dxExEdtr, dxEdLib,
  //AL_7
  dxDBELib, uCtrlInvContab, uCtrlRendaVariavel, uCtrlPadroes;

type
  TfrmCadSubscricaoComAcoes = class(TfrmCadMestreDetalheCSInv)
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
    dbrVlrProv: TDBRealEdit;
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
    dbeDivPorAcao: TDBRealEdit;
    Label14: TLabel;
    dbePercentual: TDBRealEdit;
    Label25: TLabel;
    dbdPrazoBolsa: TCMDateTimePicker;
    LbBolsa: TLabel;
    LbEmpresa: TLabel;
    dbdPrazoEmpresa: TCMDateTimePicker;
    dbeIniPagto: TCMDateTimePicker;
    LbPagamento: TLabel;
    qryTipoOperacaoFLGDATAVENCIMENTO: TStringField;
    qryDATAVENCIMENTO: TDateTimeField;
    qryOrigemVLRCUSTOATUAL: TFloatField;
    qryOrigemVLRVARIACAOATUAL: TFloatField;
    QrySaldoOrigemVLRVARIACAOATUAL: TFloatField;
    qryCancelamento: TwwQuery;
    updCancelamento: TUpdateSQL;
    dsCancelamento: TwwDataSource;
    tbsCancelamento: TTabSheet;
    dbgCancelamento: TwwDBGrid;
    Panel1: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    dblCarteiraCanc: TwwDBLookupCombo;
    dbeBoletaCanc: TDBEdit;
    dblTipoOperCanc: TwwDBLookupCombo;
    dblCustodianteCanc: TwwDBLookupCombo;
    dblMotivoBloqueioCanc: TwwDBLookupCombo;
    dbrQtdCanc: TDBRealEdit;
    dbdDataOperacaoCanc: TCMDateTimePicker;
    qryTipoOperCancD: TwwQuery;
    qryCarteiraCanc: TwwQuery;
    qryCustodianteCanc: TwwQuery;
    qryMotBloqCanc: TwwQuery;
    Label32: TLabel;
    dbeCancelamento: TCMDateTimePicker;
    qryTipoOperCancDIDTIPOINVEST: TFloatField;
    qryTipoOperCancDIDTIPOOPERACAO: TFloatField;
    qryTipoOperCancDIDMERCADO: TFloatField;
    qryTipoOperCancDCODTIPDOC: TFloatField;
    qryTipoOperCancDDESCTIPOOPERACAO: TStringField;
    qryTipoOperCancDNATUREZAOPERACAO: TStringField;
    qryTipoOperCancDTIPOCUSTODIA: TStringField;
    qryTipoOperCancDVENCIMENTO: TFloatField;
    qryTipoOperCancDFLGGERACONTAB: TFloatField;
    qryTipoOperCancDFLGGERACAPCAR: TFloatField;
    qryTipoOperCancDRECPAG: TStringField;
    qryTipoOperCancDTIPCREDOR: TStringField;
    qryTipoOperCancDFLGGERACAF: TFloatField;
    qryTipoOperCancDFLGTRANSF: TStringField;
    qryTipoOperCancDTRGDTINCLUSAO: TDateTimeField;
    qryTipoOperCancDTRGUSERINCLUSAO: TStringField;
    qryTipoOperCancDFLGCORRET: TStringField;
    qryTipoOperCancDFLGORDMOVINV: TStringField;
    qryTipoOperCancDIDMOTIVOBLOQUEIO: TFloatField;
    qryTipoOperCancDFLGOPDIREITO: TStringField;
    qryTipoOperCancDFLGAGE: TStringField;
    qryTipoOperCancDFLGDATAEX: TStringField;
    qryTipoOperCancDFLGDATACOM: TStringField;
    qryTipoOperCancDFLGINVORIGEM: TStringField;
    qryTipoOperCancDFLGPERC: TStringField;
    qryTipoOperCancDFLGPARIDADE: TStringField;
    qryTipoOperCancDFLGPRZBOLSA: TStringField;
    qryTipoOperCancDFLGPRZEMP: TStringField;
    qryTipoOperCancDFLGATADEC: TStringField;
    qryTipoOperCancDFLGFORMAPAGREC: TStringField;
    qryTipoOperCancDFLGDIVACAO: TStringField;
    qryTipoOperCancDFLGINIPAG: TStringField;
    qryTipoOperCancDFLGJUROS: TStringField;
    qryTipoOperCancDMOTBLOQCARTORIG: TFloatField;
    qryTipoOperCancDMOTBLOQCARTDEST: TFloatField;
    qryTipoOperCancDTIPSALDOCARTORIG: TStringField;
    qryTipoOperCancDTIPSALDOCARTDEST: TStringField;
    qryTipoOperCancDFLGTRATAIR: TStringField;
    qryTipoOperCancDSIGLATIPOOPER: TStringField;
    qryTipoOperCancDFLGISENTOIR: TStringField;
    qryTipoOperCancDFLGGRAVAIRLITIGIO: TStringField;
    qryTipoOperCancDFLGOPGERENC: TStringField;
    qryTipoOperCancDTIPOMOVTO: TStringField;
    qryTipoOperCancDSTAATIVO: TStringField;
    qryTipoOperCancDFLGRENTABILIDADE: TStringField;
    qryTipoOperCancDFLGCONTAINVEST: TFloatField;
    qryTipoOperCancDFLGMOVCOTA: TStringField;
    qryTipoOperCancDFLGCOTARECDES: TStringField;
    qryTipoOperCancDFLGDATAVENCIMENTO: TStringField;
    qryTipoOperCancDFLGOBRIGAOBS: TStringField;
    qryCarteiraCancIDCARTEIRA: TStringField;
    qryCarteiraCancIDCARTEIRAINVEST: TFloatField;
    qryCarteiraCancIDCARTEIRAGERENC: TFloatField;
    qryCarteiraCancDESCCARTINVEST: TStringField;
    qryCustodianteCancIDCUSTODIANTE: TFloatField;
    qryCustodianteCancSGLCUSTODIANTE: TStringField;
    qryMotBloqCancIDMOTIVOBLOQUEIO: TFloatField;
    qryMotBloqCancSIGLAMOTBLOQ: TStringField;
    qryMotBloqCancDESCMOTBLOQ: TStringField;
    qryCancelamentoNUMDOCUMENTO: TStringField;
    qryCancelamentoDESCINVESTIMENTO: TStringField;
    qryCancelamentoDESCTIPOOPERACAO: TStringField;
    qryCancelamentoDESCCARTINVEST: TStringField;
    qryCancelamentoQTDEOPERACAO: TFloatField;
    qryCancelamentoVLROPERACAO: TFloatField;
    qryCancelamentoVLRIRREMUNER: TFloatField;
    qryCancelamentoVLRIR: TFloatField;
    qryCancelamentoVLRLIQUIDO: TFloatField;
    qryCancelamentoSGLCUSTODIANTE: TStringField;
    qryCancelamentoSIGLAMOTBLOQ: TStringField;
    qryCancelamentoDATABASE: TDateTimeField;
    qryCancelamentoIDOPERACAOINVEST: TFloatField;
    qryCancelamentoMOECODIGO: TFloatField;
    qryCancelamentoIDMODULO: TFloatField;
    qryCancelamentoORIGDEST: TStringField;
    qryCancelamentoEMPRESAPROP: TFloatField;
    qryCancelamentoIDINVESTIMENTO: TFloatField;
    qryCancelamentoIDCARTEIRAINVEST: TFloatField;
    qryCancelamentoIDTIPOINVEST: TFloatField;
    qryCancelamentoIDTIPOOPERACAO: TFloatField;
    qryCancelamentoDATAOPERACAO: TDateTimeField;
    qryCancelamentoNUMDOCUMENTO_1: TStringField;
    qryCancelamentoPRECOUNITOPERACAO: TFloatField;
    qryCancelamentoDATAVENCOPER: TDateTimeField;
    qryCancelamentoIDFORCLI: TFloatField;
    qryCancelamentoIDLOTE: TStringField;
    qryCancelamentoIDCUSTODIANTE: TFloatField;
    qryCancelamentoFLGSTATUSFECHBOL: TStringField;
    qryCancelamentoFLGSTATUSORDMOV: TStringField;
    qryCancelamentoIDOPERACAODIREITO: TFloatField;
    qryCancelamentoVLRREMUNERACAO: TFloatField;
    qryCancelamentoPERCENTUAL: TFloatField;
    qryCancelamentoIDCARTEIRAGERENC: TFloatField;
    qryCancelamentoIDPLANPREVCTBPATR: TFloatField;
    qryCancelamentoIDOPERCUSTODIA: TFloatField;
    qryCancelamentoIDCUSTORIG: TFloatField;
    qryCancelamentoIDMOTIVOBLOQUEIO: TFloatField;
    qryCancelamentoNATUREZAOPERACAO: TStringField;
    qryCancelamentoIDCARTEIRA: TStringField;
    qryCancelamentoIDOPERACAOORIGEM: TFloatField;
    qryCancelamentoALTERADO: TStringField;
    qryCancelamentoVLRCUSTOATUAL: TFloatField;
    qryCancelamentoVLRVARIACAOATUAL: TFloatField;
    qryTipoOperCancA: TwwQuery;
    qryTipoOperCancAIDTIPOINVEST: TFloatField;
    qryTipoOperCancAIDTIPOOPERACAO: TFloatField;
    qryTipoOperCancAIDMERCADO: TFloatField;
    qryTipoOperCancACODTIPDOC: TFloatField;
    qryTipoOperCancADESCTIPOOPERACAO: TStringField;
    qryTipoOperCancANATUREZAOPERACAO: TStringField;
    qryTipoOperCancATIPOCUSTODIA: TStringField;
    qryTipoOperCancAVENCIMENTO: TFloatField;
    qryTipoOperCancAFLGGERACONTAB: TFloatField;
    qryTipoOperCancAFLGGERACAPCAR: TFloatField;
    qryTipoOperCancARECPAG: TStringField;
    qryTipoOperCancATIPCREDOR: TStringField;
    qryTipoOperCancAFLGGERACAF: TFloatField;
    qryTipoOperCancAFLGTRANSF: TStringField;
    qryTipoOperCancATRGDTINCLUSAO: TDateTimeField;
    qryTipoOperCancATRGUSERINCLUSAO: TStringField;
    qryTipoOperCancAFLGCORRET: TStringField;
    qryTipoOperCancAFLGORDMOVINV: TStringField;
    qryTipoOperCancAIDMOTIVOBLOQUEIO: TFloatField;
    qryTipoOperCancAFLGOPDIREITO: TStringField;
    qryTipoOperCancAFLGAGE: TStringField;
    qryTipoOperCancAFLGDATAEX: TStringField;
    qryTipoOperCancAFLGDATACOM: TStringField;
    qryTipoOperCancAFLGINVORIGEM: TStringField;
    qryTipoOperCancAFLGPERC: TStringField;
    qryTipoOperCancAFLGPARIDADE: TStringField;
    qryTipoOperCancAFLGPRZBOLSA: TStringField;
    qryTipoOperCancAFLGPRZEMP: TStringField;
    qryTipoOperCancAFLGATADEC: TStringField;
    qryTipoOperCancAFLGFORMAPAGREC: TStringField;
    qryTipoOperCancAFLGDIVACAO: TStringField;
    qryTipoOperCancAFLGINIPAG: TStringField;
    qryTipoOperCancAFLGJUROS: TStringField;
    qryTipoOperCancAMOTBLOQCARTORIG: TFloatField;
    qryTipoOperCancAMOTBLOQCARTDEST: TFloatField;
    qryTipoOperCancATIPSALDOCARTORIG: TStringField;
    qryTipoOperCancATIPSALDOCARTDEST: TStringField;
    qryTipoOperCancAFLGTRATAIR: TStringField;
    qryTipoOperCancASIGLATIPOOPER: TStringField;
    qryTipoOperCancAFLGISENTOIR: TStringField;
    qryTipoOperCancAFLGGRAVAIRLITIGIO: TStringField;
    qryTipoOperCancAFLGOPGERENC: TStringField;
    qryTipoOperCancATIPOMOVTO: TStringField;
    qryTipoOperCancASTAATIVO: TStringField;
    qryTipoOperCancAFLGRENTABILIDADE: TStringField;
    qryTipoOperCancAFLGCONTAINVEST: TFloatField;
    qryTipoOperCancAFLGMOVCOTA: TStringField;
    qryTipoOperCancAFLGCOTARECDES: TStringField;
    qryTipoOperCancAFLGDATAVENCIMENTO: TStringField;
    qryTipoOperCancAFLGOBRIGAOBS: TStringField;
    qryDestinoVLRCUSTOATUAL: TFloatField;
    qryDestinoVLRVARIACAOATUAL: TFloatField;
    Label33: TLabel;
    dbrVlrCanc: TDBRealEdit;
    qryPlanPrevCtbPatr: TwwQuery;
    qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField;
    qryPlanPrevCtbPatrPLANOCONTABIL: TStringField;
    qryPlanPrevCtbPatrPATROCINADORA: TStringField;
    qryPlanPrevCtbPatrIDPLANPREVCTBPATR: TFloatField;
    qryPlanPrevCtbPatrIDPLANOPREV: TFloatField;
    qryPlanPrevCtbPatrIDPATRO: TFloatField;
    qryOrigemPLANPRVCONTABPATRO: TStringField;
    qryDestinoPLANPRVCONTABPATRO: TStringField;
    qryCancelamentoPLANPRVCONTABPATRO: TStringField;
    QrySaldoOrigemPLANPRVCONTABPATRO: TStringField;
    QrySaldoOrigemIDPLANPREVCTBPATR: TFloatField;
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
    procedure dblTipoOperacaoExit(Sender: TObject);
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
    procedure dbdCOMExit(Sender: TObject);
    procedure dblCarteiraCancExit(Sender: TObject);
  private
    sBoleRat: String;
    iCartRat, iOperRat, iMotBRat, iTpOpRat : Integer;
    fValorAnt, fQtdeAnt, fPercRatV, fPercRatQ, fQtdeRat, fVOpeRat, fPUOpRat : Double;

    { Private declarations }
    procedure Sel(iOper: Integer; bSelAGE: Boolean = True; bSelInv: Boolean = True);
    procedure SelDetInv(iOper: Integer);
    procedure SelDetOrig(iOper: Integer);
    procedure SelDetDest(iOper: Integer);
    procedure SelDetCanc(iOper: Integer);
    procedure HabDetOrig(bAcao:Boolean);
    procedure HabDetDest (bAcao: Boolean);
    procedure HabDetCanc (bAcao: Boolean);
    procedure FornecedorCli(wIdCustodiante, iInvestimento: Integer;
                            var wIdForCli: Integer);
    procedure CalculaVlrLiq(Origem: String = 'O');
    procedure HabilitaCamposDireito(bVisivel : Boolean);

    function  TestaOperacaoExitente: Boolean;
    function  GeraOrigem : Boolean;
    function  GeraDestino: Boolean;
    function  BuscaBoleta(dData: TDateTime; wIDForCli: Integer): String;
    function  CalcVenc(dDataOper: TDateTime; iPrazo: Integer): TDateTime;
    function  AchaOrigem(iPlanoPatro, iTipoOper, iCartInvest, iCartGerenc, iCustodiante, iMotBloq: Integer): Boolean;
    function  GeraOrigemCanc: Boolean;
    function  GeraDestinoCanc: Boolean;               
  public
    { Public declarations }
  end;

var
  frmCadSubscricaoComAcoes: TfrmCadSubscricaoComAcoes;
  wSdoQtdCPMF, wSaldoQtd, wSaldoVlr, wSaldoIRApu, wSaldoInutil, wSaldoAqui, wSaldoVar,
  wQtdOperAnt : Double;
  wOrigem, wDestino: Boolean;

implementation

uses UOperComum, uMensErro, DBaseDados, UDataBase, uDocumento, uSistema,
     UBibliotecaInvest, UImpostos, UDiasUteisInv, URendaVariavel,
     dRendaVariavel, UCotaComum, UProvisaoComum, ULancContab, UCaixaComum,
  URendaFixa, UOperacaoInvest, uDireitos;

{$R *.DFM}

procedure TfrmCadSubscricaoComAcoes.Sel(iOper: Integer;
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
   QryInvestimentoAcao.ParamByName('DATACOTACAO').AsString   := qryDATAEX.AsString;
   QryInvestimentoAcao.Open;

   if bSelInv then
      SelDetInv(iOper);

   SelDetOrig(iOper);

   SelDetDest(iOper);

   // AL_1
   SelDetCanc(iOper);

   // Habilita componentes do Cadastro Pai
   dblEmissor.Enabled      := True;
   dblTipoOperacao.Enabled := True;
   dbeDivPorAcao.Enabled   := True;
   dbePercentual.Enabled   := True;
   dbdAGE.Enabled          := True;
   dbdEX.Enabled           := True;
   dbdOper.Enabled         := True;
   dbdCOM.Enabled          := True;

end;

procedure TfrmCadSubscricaoComAcoes.SelDetInv(iOper: Integer);
begin
    OperComum.LimpaParametros(qryDetalhe);
    qryDetalhe.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryDetalhe.Open
end;

procedure TfrmCadSubscricaoComAcoes.SelDetOrig(iOper: Integer);
begin
    //AL_11 - Ini
    OperComum.LimpaParametros(qryCarteiraOrig);
    qryCarteiraOrig.ParamByName('DATALIMGER').AsString  := qryDATAEX.AsString;
    qryCarteiraOrig.Open;
    OperComum.LimpaParametros(qryOrigem);
    qryOrigem.ParamByName('DATAEX').AsString  := qryDATAEX.AsString;
    qryOrigem.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryOrigem.Open
    //AL_11 - Fim
end;

procedure TfrmCadSubscricaoComAcoes.SelDetDest(iOper: Integer);
begin
   //AL_11 - Ini
   OperComum.LimpaParametros(qryCarteiraRec);
   qryCarteiraRec.ParamByName('DATALIMGER').AsString  := qryDATAOPER.AsString;
   qryCarteiraRec.Open;
    OperComum.LimpaParametros(qryDestino);
    qryDestino.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
   qryDestino.ParamByName('DATAEX').AsString  := qryDATAEX.AsString;
    qryDestino.Open
   //AL_11 - Fim
end;

procedure TfrmCadSubscricaoComAcoes.HabDetOrig(bAcao:Boolean);
begin
   dbeBoletaProv.Enabled := bAcao;
   dblTipoOperProv.Enabled := bAcao;
   dblCarteiraProvisao.Enabled := bAcao;
   dblCustodianteProv.Enabled := bAcao;
   dblMotivoBloqueioProv.Enabled := bAcao;
end;

procedure TfrmCadSubscricaoComAcoes.HabDetDest(bAcao:Boolean);
begin
   dbeBoletaRec.Enabled := bAcao;
   dblTipoOperRec.Enabled := bAcao;
   dblCarteiraRec.Enabled := bAcao;
   dblCustodianteRec.Enabled := bAcao;
   dblMotivoBloqueioRec.Enabled := bAcao;
end;

//AL_1
procedure TfrmCadSubscricaoComAcoes.HabDetCanc(bAcao:Boolean);
begin
   dbeBoletaCanc.Enabled := bAcao;
   dbdDataOperacaoCanc.Enabled := bAcao;
   dblTipoOperCanc.Enabled := bAcao;
   dblCarteiraCanc.Enabled := bAcao;
   dblCustodianteCanc.Enabled := bAcao;
   dblMotivoBloqueioCanc.Enabled := bAcao;
end;

procedure TfrmCadSubscricaoComAcoes.FormShow(Sender: TObject);
begin
   inherited;
   qryTipoOperacao.Open;
   QryEmissor.Open;
   Sel(-1);
   pgcAge.ActivePage := TbsDireitos;
   pgctrlDetalhe.ActivePage := tbsDet;
end;

procedure TfrmCadSubscricaoComAcoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryTipoOperacao.Close;
   QryEmissor.Close;
   QryInvestimentoAcao.Close;
   qryTipoOperCancA.Close;
   qryTipoOperCancD.Close;   
end;

procedure TfrmCadSubscricaoComAcoes.sbtnInserirClick(Sender: TObject);
begin
   pgcAge.ActivePage := TbsDireitos;
   inherited;
   // AL_2 - Controle de travamento
   if qry.State = dsInsert then
   begin
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      qryIDOPERACAODIREITO.AsInteger := LeUltRegistro(nil,'OPERACAODIREITO');
      qryPARIDADE.AsFloat            := 1;
      qryPERCENTUAL.AsFloat          := 100;
      qryFLGTIPODIREITO.AsString     := 'P';
      Sel(qryIDOPERACAODIREITO.AsInteger, False);

      //AL_8
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

procedure TfrmCadSubscricaoComAcoes.CmeDetalheInsert(Sender: TObject);
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
   end
   else if pgctrlDetalhe.ActivePage = tbsCancelamento then
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
      HabDetCanc(True);
      if dblTipoOperCanc.CanFocus then
         dblTipoOperCanc.SetFocus;
   end;

   inherited;

   if pgctrlDetalhe.ActivePage = tbsDestino then
   begin
      if qryDestino.State = dsInsert then
         qryDestinoDATAOPERACAO.AsDateTime := qryDATACOM.AsDateTime;
   end;

end;

procedure TfrmCadSubscricaoComAcoes.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
   //AL_1
   if not qryCancelamento.IsEmpty then
      dbeCancelamento.Text := qryCancelamento.FieldByName('DATAOPERACAO').AsString;
   end;
   HabilitaCamposDireito(True);
end;

function TfrmCadSubscricaoComAcoes.TestaOperacaoExitente: Boolean;
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

procedure TfrmCadSubscricaoComAcoes.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   if (Qry.State = DsInsert) and (Direitos.ExisteOperDir(qryIDTIPOOPERACAO.AsInteger,
                                                         qryIDEMISSOR.AsInteger,
                                                         qryDATAAGE.AsDateTime,
                                                         qryDATAEX.AsDateTime,
                                                         qryDATACOM.AsDateTime,
                                                         qryDetalhe.Lookup('ORIGDEST', 'O', 'IDINVESTIMENTO'),
                                                         -1, qryIDOPERACAODIREITO.AsInteger) ) then
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
   if qryTipoOperacaoIDTIPOOPERACAO.AsInteger <> pRPI.IDTIPOOPERDIRDSA then
   begin
      if dbeDivPorAcao.Value = 0 then
      begin
         Accept := False;
         MsgDlg('Não foi informado um PU para esta AGE,'+#13+
                'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dbeDivPorAcao.CanFocus then
            dbeDivPorAcao.SetFocus;
         Exit;
      end;
   end
   else
   if dbePercentual.Value = 0 then
   begin
      Accept := False;
      MsgDlg('Não foi informado um Percentual para esta AGE,'+#13+
             'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbePercentual.CanFocus then
         dbePercentual.SetFocus;
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
   end
   else
   if ((dbdPrazoEmpresa.Enabled) And (Trim(dbdPrazoEmpresa.Text) = ''))  then
   begin
      Accept := False;
      MsgDlg('Não foi informada a Data de Limite Empresa para esta AGE,'+#13+
             'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbdPrazoEmpresa.CanFocus then
         dbdPrazoEmpresa.SetFocus;
      Exit;
   end
   else
   if ((dbdPrazoBolsa.Enabled) And (Trim(dbdPrazoBolsa.Text) = ''))  then
   begin
      Accept := False;
      MsgDlg('Não foi informada a Data de Limite Bolsa para esta AGE,'+#13+
             'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbdPrazoBolsa.CanFocus then
         dbdPrazoBolsa.SetFocus;
      Exit;
   end
   else
   if ((dbeIniPagto.Enabled) And (Trim(dbeIniPagto.Text) = ''))  then
   begin
      Accept := False;
      MsgDlg('Não foi informada a Data de Início Pagto para esta AGE,'+#13+
             'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbeIniPagto.CanFocus then
         dbeIniPagto.SetFocus;
      Exit;
   end;

   if ((qry.State = DsInsert) and (qry.FieldByName('PARIDADE').AsFloat = 0)) then
      qry.FieldByName('PARIDADE').AsFloat  := 1;

   if ((qry.State = DsInsert) and (qry.FieldByName('FLGTIPODIREITO').AsString = '')) then
      qry.FieldByName('FLGTIPODIREITO').AsString  := 'P';

   Accept := True;
end;

procedure TfrmCadSubscricaoComAcoes.bbtnOkDetClick(Sender: TObject);
var iUltOper: Integer;
    fTotQtd, fTotQtdAlt: Double;
begin
   CmeDetalhe.RepetirInsert := False;
   if pgctrlDetalhe.ActivePage = tbsDet then
   begin
      //AL_10
      if ((qryDetalheORIGDEST.AsString = 'O') and
          (qryIDEMISSOR.AsInteger <> qryInvestimentoAcaoIDEMISSOR.AsInteger)) then
      begin
          MsgDlg('O Emissor de Origem tem que ser o mesmo informado para a Empresa.',
                 'Mensagem do Sistema', MtWarning, [mbOk],0);
          exit;
      end;

      inherited;

   end
   else
   if pgctrlDetalhe.ActivePage = tbsOrigem then
   begin
      if qryOrigem.Modified then
      begin
         // Se foi alterada exclui o histórico
         if qryHistCartInv.Locate('IDOPERACAOINVEST', qryOrigemIDOPERACAOINVEST.AsInteger, []) then
            qryHistCartInv.Delete;

         qryOrigemPRECOUNITOPERACAO.AsFloat := OperComum.Round(((qryOrigemVLROPERACAO.AsFloat / qryOrigemQTDEOPERACAO.AsFloat) * qryInvestimentoAcaoQTDTITLOTE.AsInteger)-0.0000000049,8);
         qryOrigemALTERADO.AsString := 'S';
      end;

      inherited;

      // Capta quantidade alterada
      if qryOrigem.Locate('IDOPERACAOINVEST', iOperRat, []) then
         fTotQtd := qryOrigemQTDEOPERACAO.AsFloat;

      // Controle de Ajuste automático das carteiras gerencias
      qryOrigem.DisableControls;
      qryOrigem.First;
      while not qryOrigem.Eof do
      begin
         if   (qryOrigemIDOPERACAOINVEST.AsInteger <> iOperRat) and
              (qryOrigemIDCARTEIRAINVEST.AsInteger  = iCartRat) and
            (((qryOrigemIDCARTEIRAGERENC.IsNull)  and
              (qryOrigemIDTIPOOPERACAO.AsInteger    = iTpOpRat)  and
              (qryOrigemIDMOTIVOBLOQUEIO.AsInteger = iMotBRat)) or
          (not qryOrigemIDCARTEIRAGERENC.IsNull)) and
              (qryOrigemIDTIPOOPERACAO.AsInteger    = iTpOpRat)  and
              (qryOrigemNUMDOCUMENTO.AsString      = sBoleRat) then
         begin
            qryOrigem.Edit;
            qryOrigemQTDEOPERACAO.AsFloat      := Int(qryOrigemQTDEOPERACAO.AsFloat * fPercRatQ);
            qryOrigemVLROPERACAO.AsFloat       := qryOrigemVLROPERACAO.AsFloat * fPercRatV;
            qryOrigemPRECOUNITOPERACAO.AsFloat := fPUOpRat;

            iUltOper    := qryOrigemIDOPERACAOINVEST.AsInteger;
            fTotQtdAlt  := fTotQtdAlt + qryOrigemQTDEOPERACAO.AsFloat;

            CalculaVlrLiq('O');
            qryOrigem.Post;

            // Se foi alterada exclui o histórico
            if qryHistCartInv.Locate('IDOPERACAOINVEST', qryOrigemIDOPERACAOINVEST.AsInteger, []) then
               qryHistCartInv.Delete;

         end;

         qryOrigem.Next;
      end;

      // Se a quantidade alterada é diferente da quantidade original
      if Abs(fTotQtd - fTotQtdAlt) > 0 then
      begin
         // Localiza a última alterada
         if qryOrigem.Locate('IDOPERACAOINVEST', iUltOper, []) then
         begin
            qryOrigem.Edit;
            qryOrigemQTDEOPERACAO.AsFloat := qryOrigemQTDEOPERACAO.AsFloat + (fTotQtd - fTotQtdAlt);
            qryOrigem.Post;
         end;
      end;

      qryOrigem.EnableControls;

   end
   else
   if pgctrlDetalhe.ActivePage = tbsDestino then
   begin
      if qryDestino.Modified then
      begin
         // Se foi alterada exclui o histórico
         if qryHistCartInv.Locate('IDOPERACAOINVEST', qryDestinoIDOPERACAOINVEST.AsInteger, []) then
            qryHistCartInv.Delete;

         qryDestinoALTERADO.AsString := 'S';
      end;

      inherited;

      // Capta quantidade alterada
      if qryDestino.Locate('IDOPERACAOINVEST', iOperRat, []) then
         fTotQtd := qryDestinoQTDEOPERACAO.AsFloat;

      // Controle de Ajuste automático das carteiras gerencias
      qryDestino.DisableControls;
      qryDestino.First;
      while not qryDestino.Eof do
      begin
         if   (qryDestinoIDOPERACAOINVEST.AsInteger <> iOperRat) and
              (qryDestinoIDCARTEIRAINVEST.AsInteger  = iCartRat) and
            (((qryDestinoIDCARTEIRAGERENC.IsNull)  and
              (qryDestinoIDTIPOOPERACAO.AsInteger   = iTpOpRat)  and
              (qryDestinoIDMOTIVOBLOQUEIO.AsInteger = iMotBRat)) or
          (not qryDestinoIDCARTEIRAGERENC.IsNull)) and
              (qryDestinoIDTIPOOPERACAO.AsInteger   = iTpOpRat)  and
              (qryDestinoNUMDOCUMENTO.AsString      = sBoleRat) then
         begin
            qryDestino.Edit;
            qryDestinoQTDEOPERACAO.AsFloat      := Int(qryDestinoQTDEOPERACAO.AsFloat * fPercRatQ);
            qryDestinoVLROPERACAO.AsFloat       := qryDestinoVLROPERACAO.AsFloat * fPercRatV;
            qryDestinoPRECOUNITOPERACAO.AsFloat := fPUOpRat;

            iUltOper    := qryDestinoIDOPERACAOINVEST.AsInteger;
            fTotQtdAlt  := fTotQtdAlt + qryDestinoQTDEOPERACAO.AsFloat;

            CalculaVlrLiq('O');
            qryDestino.Post;

            // Se foi alterada exclui o histórico
            if qryHistCartInv.Locate('IDOPERACAOINVEST', qryDestinoIDOPERACAOINVEST.AsInteger, []) then
               qryHistCartInv.Delete;

         end;

         qryDestino.Next;
      end;

      // Se a quantidade alterada é diferente da quantidade original
      if Abs(fTotQtd - fTotQtdAlt) > 0 then
      begin
         // Localiza a última alterada
         if qryDestino.Locate('IDOPERACAOINVEST', iUltOper, []) then
         begin
            qryDestino.Edit;
            qryDestinoQTDEOPERACAO.AsFloat := qryDestinoQTDEOPERACAO.AsFloat + (fTotQtd - fTotQtdAlt);
            qryDestino.Post;
         end;
      end;

      qryDestino.EnableControls;

   end
   //AL_1 Ini
   else
   if pgctrlDetalhe.ActivePage = tbsCancelamento then
   begin
      if qryCancelamento.Modified then
      begin
         // Se foi alterada exclui o histórico
         if qryHistCartInv.Locate('IDOPERACAOINVEST', qryCancelamentoIDOPERACAOINVEST.AsInteger, []) then
            qryHistCartInv.Delete;

         qryCancelamentoALTERADO.AsString := 'S';
      end;

      inherited;

      // Capta quantidade alterada
      if qryCancelamento.Locate('IDOPERACAOINVEST', iOperRat, []) then
         fTotQtd := qryCancelamentoQTDEOPERACAO.AsFloat;

      // Controle de Ajuste automático das carteiras gerencias
      qryCancelamento.DisableControls;
      qryCancelamento.First;
      while not qryCancelamento.Eof do
      begin
         if   (qryCancelamentoIDOPERACAOINVEST.AsInteger <> iOperRat) and
              (qryCancelamentoIDCARTEIRAINVEST.AsInteger  = iCartRat) and
            (((qryCancelamentoIDCARTEIRAGERENC.IsNull)  and
              (qryCancelamentoIDTIPOOPERACAO.AsInteger   = iTpOpRat)  and
              (qryCancelamentoIDMOTIVOBLOQUEIO.AsInteger = iMotBRat)) or
          (not qryCancelamentoIDCARTEIRAGERENC.IsNull)) and
              (qryCancelamentoIDTIPOOPERACAO.AsInteger   = iTpOpRat)  and
              (qryCancelamentoNUMDOCUMENTO.AsString      = sBoleRat) then
         begin
            qryCancelamento.Edit;
            qryCancelamentoQTDEOPERACAO.AsFloat      := Int(qryCancelamentoQTDEOPERACAO.AsFloat * fPercRatQ);
            qryCancelamentoVLROPERACAO.AsFloat       := qryCancelamentoVLROPERACAO.AsFloat * fPercRatV;
            qryCancelamentoPRECOUNITOPERACAO.AsFloat := fPUOpRat;

            iUltOper    := qryCancelamentoIDOPERACAOINVEST.AsInteger;
            fTotQtdAlt  := fTotQtdAlt + qryCancelamentoQTDEOPERACAO.AsFloat;

            CalculaVlrLiq('O');
            qryCancelamento.Post;

            // Se foi alterada exclui o histórico
            if qryHistCartInv.Locate('IDOPERACAOINVEST', qryCancelamentoIDOPERACAOINVEST.AsInteger, []) then
               qryHistCartInv.Delete;

         end;

         qryCancelamento.Next;
      end;

      // Se a quantidade alterada é diferente da quantidade original
      if Abs(fTotQtd - fTotQtdAlt) > 0 then
      begin
         // Localiza a última alterada
         if qryCancelamento.Locate('IDOPERACAOINVEST', iUltOper, []) then
         begin
            qryCancelamento.Edit;
            qryCancelamentoQTDEOPERACAO.AsFloat := qryCancelamentoQTDEOPERACAO.AsFloat + (fTotQtd - fTotQtdAlt);
            qryCancelamento.Post;
         end;
      end;

      qryCancelamento.EnableControls;

   end;
   //AL_1 Fim
end;

{Incrementa fornecedor, bolsa de valores, boleta, data de vencimento}
procedure TfrmCadSubscricaoComAcoes.FornecedorCli(wIdCustodiante, iInvestimento  : Integer;
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

procedure TfrmCadSubscricaoComAcoes.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   // AL_2 - Controle de travamento
   if qry.State = dsEdit then
   begin
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      if dblTipoOperacao.CanFocus then
         dblTipoOperacao.SetFocus;
   end;
end;

procedure TfrmCadSubscricaoComAcoes.sbtnExcluiDetClick(Sender: TObject);
var sBol: String;
    iResp: Integer;
begin
   if pgctrlDetalhe.ActivePage = tbsDet then
   begin
      if MsgDlg('Exclui o Investimento e as Operações de Origem, Destino e Cancelamento ?','Mensagem do Sistema',mtConfirmation,[mbYes, mbNo],0) = mrYes then
      begin
         try
            // AL_1
            //Exclui as boletas de Cancelamento
            qryCancelamento.First;
            while not qryCancelamento.Eof do
            begin
               sBol := qryCancelamentoNUMDOCUMENTO.AsString;
               if not RendaVariavel.ExcluiBoleta(sBol, False, True, fraMens) then
                  Raise Exception.Create('Não foi possível excluir as operações de Cancelamento da boleta ' + sBol);
               while ((not qryCancelamento.Eof) and (sBol = qryCancelamentoNUMDOCUMENTO.AsString)) do
                  qryCancelamento.Next;
            end;
            // AL_1 - Fim

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
            // AL_1
            //Exclui as boletas de Vencimento
            qryCancelamento.First;
            while not qryCancelamento.Eof do
            begin
               sBol := qryCancelamentoNUMDOCUMENTO.AsString;
               if not RendaVariavel.ExcluiBoleta(sBol, False, True, fraMens) then
                  Raise Exception.Create('Não foi possível excluir as operações de Cancelamento da boleta ' + sBol);
               while ((not qryCancelamento.Eof) and (sBol = qryCancelamentoNUMDOCUMENTO.AsString)) do
                  qryCancelamento.Next;
            end;
            // AL_1 - Fim

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
         // AL_1
         //Exclui as boletas de Vencimento
         qryCancelamento.First;
         while not qryCancelamento.Eof do
         begin
            sBol := qryCancelamentoNUMDOCUMENTO.AsString;
            if not RendaVariavel.ExcluiBoleta(sBol, False, True, fraMens) then
               Raise Exception.Create('Não foi possível excluir as operações de Cancelamento da boleta ' + sBol);
            while ((not qryCancelamento.Eof) and (sBol = qryCancelamentoNUMDOCUMENTO.AsString)) do
               qryCancelamento.Next;
         end;
         // AL_1 - Fim
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
   end
   else
   // AL_1 - Inicio
   if pgctrlDetalhe.ActivePage = tbsCancelamento then
   begin
      if MsgDlg('Exclui as Operações de Cancelamento ?','Mensagem do Sistema',mtConfirmation,[mbYes, mbNo],0) = mrYes then
      begin
         //Exclui as boletas de Vencimento
         qryCancelamento.First;
         while not qryCancelamento.Eof do
         begin
            sBol := qryCancelamentoNUMDOCUMENTO.AsString;
            if not RendaVariavel.ExcluiBoleta(sBol, False, True, fraMens) then
               Raise Exception.Create('Não foi possível excluir as operações de Cancelamento da boleta ' + sBol);
            while ((not qryCancelamento.Eof) and (sBol = qryCancelamentoNUMDOCUMENTO.AsString)) do
               qryCancelamento.Next;
         end;

         inherited;
         Sel(qryIDOPERACAODIREITO.AsInteger, False, False);
      end;
   end;
   // AL_1 - Fim
end;

procedure TfrmCadSubscricaoComAcoes.dblTipoOperacaoExit(Sender: TObject);
begin
   inherited;
   HabilitaCamposDireito(True);
end;

procedure TfrmCadSubscricaoComAcoes.bbtnConfirmarClick(Sender: TObject);
var bCriaLancto, bConfirma, bAltOrig, bAltDest, bAltCanc, bReproc: Boolean;
    wTipoRecDesBol, wMensErro, sTipoCustodia, sBol: String;
    wPlano, wPlanilha, wDocumCont, wIdOperCust, iIdHistCustodia, iIdCarteiraXEvento: Integer;
    fSaldoCaixa : Currency;
    //AL_7
    wMovimAqui, wMovimVar : Double;
    CtrlRV: TCtrlRendaVariavel;
begin
   // Caso não confirmar, não pode fazer o finally
   CmeCadastroBeforeConfirma(Self, bConfirma);
   if not bConfirma then
      Exit;

   //AL_6
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
         //AL_7
         CtrlRV := TCtrlRendaVariavel.Create;
         CtrlRV.InitializeAs(Padroes);

         qryOrigem.DisableControls;
         qryDestino.DisableControls;
         //AL_1
         qryCancelamento.DisableControls;

         fraMens.Mostra;
         fraMens.Mes := 'Atualizando Histórico das Carteiras';
         qryHistCartInv.ApplyUpdates;
         fraMens.Mes := 'Atualizando AGE';
         qry.ApplyUpdates;
         fraMens.Mes := 'Atualizando Investimentos para a AGE';
         qryDetalhe.ApplyUpdates;
         fraMens.Mes := 'Atualizando operações de Origem';
         qryOrigem.ApplyUpdates;
         fraMens.Mes := 'Atualizando Operações de Destino';
         qryDestino.ApplyUpdates;
         //AL_1
         fraMens.Mes := 'Atualizando Cancelamentos';
         qryCancelamento.ApplyUpdates;


         // Zera o Buffer de memória do CachedUpdates
         qry.CommitUpdates;
         qryDetalhe.CommitUpdates;
         qryOrigem.CommitUpdates;
         qryDestino.CommitUpdates;
         qryHistCartInv.CommitUpdates;
         //AL_1
         qryCancelamento.CommitUpdates;

         fraMens.Pos := 0;
         fraMens.Max := (qryDestino.RecordCount * 2) + qryBoleta.RecordCount;

         bReproc := False;

         // Enquanto houverem Origem alterados, Limpa a Boleta correspondente
         qryOrigem.First;
         bAltOrig := False;
         while not qryOrigem.Eof do
         begin
            fraMens.Mes := 'Limpando Contábil das Operações de Origem';
            if qryOrigemALTERADO.AsString = 'S' then
            begin
               bAltDest := True;
               if qryBoleta.Locate('IDBOLETA', qryOrigemNUMDOCUMENTO.AsString, []) then
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
            qryOrigem.Next;
            fraMens.Incrementa;
         end;

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
         //AL_1 Ini
         // Enquanto houverem Cancelamentos alterados, Limpa a Boleta correspondente
         qryCancelamento.First;
         bAltCanc := False;
         while not qryCancelamento.Eof do
         begin
            fraMens.Mes := 'Limpando Contábil das Operações de Cancelamento';
            if qryCancelamentoALTERADO.AsString = 'S' then
            begin
               bAltCanc := True;
               if qryBoleta.Locate('IDBOLETA', qryCancelamentoNUMDOCUMENTO.AsString, []) then
               begin
                  // Se achou a boleta, Limpa
                  fraMens.Mes := 'Limpando Contábil das Operações de Cancelamento' + #13 +
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
            qryCancelamento.Next;
            fraMens.Incrementa;
         end;
         //AL_1 Fim

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

               // Se foi excluida um da Origem desta boleta, é necessário
               //    recontabilizar todas as Origens desta boleta
               qryOrigem.First;
               while not qryOrigem.Eof do
               begin
                  if qryOrigemNUMDOCUMENTO.AsString = qryBoletaIDBOLETA.AsString then
                  begin
                     qryOrigem.Edit;
                     qryOrigemALTERADO.AsString := 'S';
                     qryOrigem.Post;
                     bAltOrig := True;
                  end;
                  qryOrigem.Next;
               end;

               // Se foi excluida um dos Destinos desta boleta, é necessário
               //    recontabilizar todos os Destinos desta boleta
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
               //AL_1 Ini
               // Se foi excluida um dos Cancelamentos desta boleta, é necessário
               //    recontabilizar todos os Cancelamentos desta boleta
               qryCancelamento.First;
               while not qryCancelamento.Eof do
               begin
                  if qryCancelamentoNUMDOCUMENTO.AsString = qryBoletaIDBOLETA.AsString then
                  begin
                     qryCancelamento.Edit;
                     qryCancelamentoALTERADO.AsString := 'S';
                     qryCancelamento.Post;
                     bAltCanc := True;
                  end;
                  qryCancelamento.Next;
               end;
               //AL_1 Fim
               bReproc := True;
            end;
            qryBoleta.Next;
            fraMens.Incrementa;
         end;

         // Exclui as Custodias das operações Alteradas
         qryOrigem.First;
         while not qryOrigem.Eof do
         begin
            fraMens.Mes := 'Limpando Custodia da Boleta ' + qryOrigemNUMDOCUMENTO.AsString;
            if qryOrigemALTERADO.AsString = 'S' then
            begin
               if not OperacaoInvest.ExcluiCustodia('', -1, qryOrigemIDOPERACAOINVEST.AsInteger) then
                  Raise Exception.Create('Não foi possível excluir uma Custodia da boleta ' + qryOrigemNUMDOCUMENTO.AsString);

               bReproc := True;
            end;
            qryOrigem.Next;
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
               bReproc := True;
            end;
            qryDestino.Next;
            fraMens.Incrementa;
         end;
         //AL_1 Ini
         qryCancelamento.First;
         while not qryCancelamento.Eof do
         begin
            fraMens.Mes := 'Limpando Custodia da Boleta ' + qryCancelamentoNUMDOCUMENTO.AsString;
            if qryDestinoALTERADO.AsString = 'S' then
            begin
               if not OperacaoInvest.ExcluiCustodia('', -1, qryCancelamentoIDOPERACAOINVEST.AsInteger) then
                  Raise Exception.Create('Não foi possível excluir uma Custodia da boleta ' + qryDestinoNUMDOCUMENTO.AsString);
               bReproc := True;
            end;
            qryCancelamento.Next;
            fraMens.Incrementa;
         end;
         //AL_1 Fim

         qryBoleta.ApplyUpdates;
         qryBoleta.CommitUpdates;

         // Lança Origem
         fraMens.Mostra;
         fraMens.Max := qryOrigem.RecordCount;
         qryOrigem.First;
         while not qryOrigem.Eof do
         begin
            // Se não achar o histórico, relança
            if not qryHistCartInv.Locate('IDOPERACAOINVEST', qryOrigemIDOPERACAOINVEST.AsInteger, []) then
            begin
               fraMens.Mes := 'Lançando Históricos de R$ ' + FormatFloat('###,###,###,##0.00', qryOrigemVLROPERACAO.AsFloat) + #13 +
                              'Carteira: ' + qryOrigemDESCCARTINVEST.AsString;

               if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                                 qryOrigemIDINVESTIMENTO.AsInteger, 2,
                                                 qryOrigemIDOPERACAOINVEST.AsInteger, -1,
                                                 qryOrigemIDTIPOOPERACAO.AsInteger,
                                                 qryOrigemIDCARTEIRAINVEST.AsInteger,
                                                 qryOrigemIDCARTEIRAGERENC.AsInteger,
                                                 -1, -1, -1, -1, -1,
                                                 qryOrigemDATAOPERACAO.AsDateTime,
                                                 qryOrigemVLROPERACAO.AsFloat,
                                                 qryOrigemQTDEOPERACAO.AsFloat,
                                                 pRPI.VLRCOTAINICART,
                                                 0 {Variacao}, 0{Juros},
                                                 0 {wVlrIRProv} {Verificar se vai calcular o saldo},
                                                 0, 0, 0, 0, 0, 0,
                                                 'D'{Movimento},
                                                 'D' {Operacao},
                                                 qryOrigemIDLOTE.AsString,
                                                 Trim(qryOrigemDESCTIPOOPERACAO.AsString) + ' - Origem / ' +
                                                      Trim(qryOrigemDESCINVESTIMENTO.AsString),
                                                 'OPE', '1', '', True, -1,
                                                 //AL_7
                                                 qryOrigemIDPLANPREVCTBPATR.AsInteger, iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível inserir os Históricos das Operações de Origem.');

               if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                  Raise Exception.Create('Não foi possivel atualizar os saldos desta Carteira/Investimento');

               if not ExecutaQuery(qryAuxiliar,' UPDATE HISTCARTINV SET MOVIMAQUI     = '+
                                             TrocaVirgulaPonto(FloatToStr(qryOrigemVLRCUSTOATUAL.AsFloat * -1))+','+
                                             ' VLRVARIACAO   = '+
                                             TrocaVirgulaPonto(FloatToStr(qryOrigemVLRVARIACAOATUAL.AsFloat * -1))+
                                             ' WHERE IDHISTCARTINV = '+IntToStr(iIdHistCartInv)) then
                  Raise Exception.Create('Não foi possivel atualizar os saldos de custo e variação');

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

                  //AL_8
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
                                                             //AL_7
                                                             qryOrigemIDPLANPREVCTBPATR.AsInteger) Then
                     Raise Exception.Create('Não foi possível lançar a Custódia da boleta ' + qryOrigemNUMDOCUMENTO.AsString);

                  ExecutarQuery(qryAuxiliar,'UPDATE OPERACAOINVEST ' +
                                            'SET IDOPERCUSTODIA = ' + IntToStr(wIdOperCust) + ' ' +
                                            'WHERE IDOPERACAOINVEST = ' + qryOrigemIDOPERACAOINVEST.AsString);

                  if qryOrigemIDMOTIVOBLOQUEIO.AsInteger = -1 then
                     sTipoCustodia := 'V'
                  else
                     sTipoCustodia := 'Z';  //DIMINUI SALDO BLOQUEADO

                  if not OperacaoInvest.InsereCustodia(
                                        qryOrigemIDCARTEIRAINVEST.AsInteger,
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
                                        //AL_7
                                        qryOrigemIDPLANPREVCTBPATR.AsInteger) then
                     Raise Exception.Create('Não foi possível atualizar um histórico de custodia da boleta '+ qryOrigemNUMDOCUMENTO.AsString);

                  OperacaoInvest.AtualizaSaldosCustodia;

                  ExecutarQuery(qryAuxiliar,'UPDATE OPERACAOINVEST ' +
                                            'SET IDOPERCUSTODIA = ' + IntToStr(wIdOperCust) + ' ' +
                                            'WHERE IDOPERACAOINVEST = ' + qryOrigemIDOPERACAOINVEST.AsString);
                  bReproc := True;
               end;

               // Se houveram alterações nos Destinos e a Boleta foi limpa
               if (bAltOrig) and (qryBoleta.Lookup('IDBOLETA', qryOrigemNUMDOCUMENTO.AsString, 'EXCLUIBOLETA') = 'S') then
               begin
                  fraMens.Mes := 'Contabilizando R$ ' + FormatFloat('###,###,###,##0.00', qryOrigemVLROPERACAO.AsFloat) + #13 +
                                 'Carteira: ' + qryOrigemDESCCARTINVEST.AsString;

                  // Parametro para Contabilidade e CAP/CAR
                  bCriaLancto    := True;
                  wTipoRecDesBol := '';
                  wMensErro      := '';

                  // Lança o Contábil do Origem
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
                                                qryInvestimentoAcaoIDMOEDACONTAB.AsInteger,
                                                qryOrigemDESCTIPOOPERACAO.AsString + ' - Origem ' +
                                                          qryOrigemDESCINVESTIMENTO.AsString,
                                                qryOrigemIDLOTE.AsString,
                                                '', qryOrigemNUMDOCUMENTO.AsString,
                                                qryTipoOperOrig.Lookup('IDTIPOOPERACAO', qryOrigemIDTIPOOPERACAO.AsInteger, 'RECPAG'),
                                                wTipoRecDesBol, bCriaLancto,
                                                qryOrigemVLROPERACAO.AsFloat,
                                                qryOrigemVLROPERACAO.AsFloat,
                                                qryOrigemDATAOPERACAO.AsDateTime,
                                                qryOrigemDATAVENCOPER.AsDateTime,
                                                wPlano, wPlanilha, wDocumCont, wMensErro,
                                                ' '{sCapCar}, False,
                                                //AL_7
                                                False, 0, True, qryOrigemIDPLANPREVCTBPATR.AsInteger) <> 0 then
                        Raise Exception.Create('Não foi possível contabilizar uma Operação de Destino');

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

                  if (bReproc) and (qryDATAOPER.AsDateTime <= pRPI.DATAULTFECH) then
                     RendaVariavel.MarcarFlagReproc(qryOrigemIDINVESTIMENTO.AsInteger, -1,
                                                    qryOrigemIDPLANPREVCTBPATR.AsInteger,
                                                    qryDATAOPER.AsDateTime);
               end;
            end;
            fraMens.Incrementa;
            QryOrigem.Next;
         end;

         // Lança os Destinos
         fraMens.Mostra;
         fraMens.Max := qryDestino.RecordCount;
         qryDestino.First;
         while not qryDestino.Eof do
         begin
            // Se não achar o histórico, relança
            if not qryHistCartInv.Locate('IDOPERACAOINVEST', qryDestinoIDOPERACAOINVEST.AsInteger, []) then
            begin
               fraMens.Mes := 'Lançando Históricos de R$ ' + FormatFloat('###,###,###,##0.00', qryDestinoVLROPERACAO.AsFloat) + #13 +
                              'Carteira: ' + qryDestinoDESCCARTINVEST.AsString;

               if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                                 qryDestinoIDINVESTIMENTO.AsInteger, 2,
                                                 qryDestinoIDOPERACAOINVEST.AsInteger, -1,
                                                 qryDestinoIDTIPOOPERACAO.AsInteger,
                                                 qryDestinoIDCARTEIRAINVEST.AsInteger,
                                                 qryDestinoIDCARTEIRAGERENC.AsInteger,
                                                 -1, -1, -1, -1, -1,
                                                 qryDestinoDATAOPERACAO.AsDateTime,
                                                 qryDestinoVLROPERACAO.AsFloat,
                                                 qryDestinoQTDEOPERACAO.AsFloat,
                                                 pRPI.VLRCOTAINICART,
                                                 0 {Variacao}, 0{Juros},
                                                 0 {wVlrIRProv} {Verificar se vai calcular o saldo},
                                                 0, 0, 0, 0, 0, 0,
                                                 'A' {Movimento},
                                                 'A' {Operacao},
                                                 qryDestinoIDLOTE.AsString,
                                                 Trim(qryDestinoDESCTIPOOPERACAO.AsString) + ' - Destino / ' +
                                                      Trim(qryDestinoDESCINVESTIMENTO.AsString),
                                                 'OPE', '1', '', True, -1,
                                                 //AL_7
                                                 qryDestinoIDPLANPREVCTBPATR.AsInteger, iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível inserir os Históricos das Operações de Destino.');

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

                  //AL_8
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
                                                             //AL_7
                                                             qryDestinoIDPLANPREVCTBPATR.AsInteger) Then
                     Raise Exception.Create('Não foi possível lançar a Custódia da boleta ' + qryDestinoNUMDOCUMENTO.AsString);

                  ExecutarQuery(qryAuxiliar,'UPDATE OPERACAOINVEST ' +
                                            'SET IDOPERCUSTODIA = ' + IntToStr(wIdOperCust) + ' ' +
                                            'WHERE IDOPERACAOINVEST = ' + qryDestinoIDOPERACAOINVEST.AsString);

                  if qryDestinoIDMOTIVOBLOQUEIO.AsInteger = -1 then
                     sTipoCustodia := 'C'
                  else
                     sTipoCustodia := 'Y';  //AUMENTA SALDO BLOQUEADO

                  if not OperacaoInvest.InsereCustodia(
                                        qryDestinoIDCARTEIRAINVEST.AsInteger,
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
                                        //AL_7
                                        qryDestinoIDPLANPREVCTBPATR.AsInteger) then
                     Raise Exception.Create('Não foi possível atualizar um histórico de custodia da boleta '+ qryOrigemNUMDOCUMENTO.AsString);

                  OperacaoInvest.AtualizaSaldosCustodia;

                  ExecutarQuery(qryAuxiliar,'UPDATE OPERACAOINVEST ' +
                                            'SET IDOPERCUSTODIA = ' + IntToStr(wIdOperCust) + ' ' +
                                            'WHERE IDOPERACAOINVEST = ' + qryDestinoIDOPERACAOINVEST.AsString);
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
                                                qryDestinoDESCTIPOOPERACAO.AsString + ' - Destino ' +
                                                          qryDestinoDESCINVESTIMENTO.AsString,
                                                qryDestinoIDLOTE.AsString,
                                                '', qryDestinoNUMDOCUMENTO.AsString,
                                                qryTipoOperOrig.Lookup('IDTIPOOPERACAO', qryDestinoIDTIPOOPERACAO.AsInteger, 'RECPAG'),
                                                wTipoRecDesBol, bCriaLancto,
                                                qryDestinoVLROPERACAO.AsFloat,
                                                qryDestinoVLROPERACAO.AsFloat,
                                                qryDestinoDATAOPERACAO.AsDateTime,
                                                qryDestinoDATAVENCOPER.AsDateTime,
                                                wPlano, wPlanilha, wDocumCont, wMensErro,
                                                ' '{sCapCar}, False, False, 0, False,
                                                //AL_7
                                                qryDestinoIDPLANPREVCTBPATR.AsInteger) <> 0 then
                        Raise Exception.Create('Não foi possível contabilizar uma Operação de Destino');

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

                  if (bReproc) and (qryDATAOPER.AsDateTime <= pRPI.DATAULTFECH) then
                     RendaVariavel.MarcarFlagReproc(qryDestinoIDINVESTIMENTO.AsInteger, -1,
                                                    qryDestinoIDPLANPREVCTBPATR.AsInteger,
                                                    qryDATAOPER.AsDateTime);
               end;
            end
            else
            begin
               iIdCarteiraXEvento := CotaComum.BuscaEventoPorTpOper(
                                               qryDestinoIDCARTEIRAINVEST.AsInteger,
                                               qryDestinoIDCARTEIRAGERENC.AsInteger,
                                               qryDestinoIDTIPOOPERACAO.AsInteger);

               if iIdCarteiraXEvento <> 0 then
               begin
                  fSaldoCaixa := CaixaComum.BuscaSaldoCaixa(
                                            qryDestinoDATAOPERACAO.AsDateTime,
                                            qryDestinoIDCARTEIRAINVEST.AsInteger,
                                            qryDestinoIDCARTEIRAGERENC.AsInteger,
                                            //AL_7
                                            qryDestinoIDPLANPREVCTBPATR.AsInteger, 'OPE');

                  if not CaixaComum.GravaEventosCaixa(
                                    qryDestinoDATAOPERACAO.AsDateTime,
                                    //AL_7
                                    qryDestinoIDPLANPREVCTBPATR.AsInteger,
                                    qryDestinoIDTIPOOPERACAO.AsInteger, 0,
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

         //AL_1 Ini
         // Lança Cancelamentos
         fraMens.Mostra;
         fraMens.Max := qryCancelamento.RecordCount;
         qryCancelamento.First;
         while not qryCancelamento.Eof do
         begin
            //Lanca Cancelamento das Origens
            if qryCancelamento.FieldByName('ORIGDEST').AsString = 'O' then
            begin
               // Se não achar o histórico, relança
               if not qryHistCartInv.Locate('IDOPERACAOINVEST', qryCancelamentoIDOPERACAOINVEST.AsInteger, []) then
               begin
                  fraMens.Mes := 'Lançando Históricos de R$ ' + FormatFloat('###,###,###,##0.00', qryCancelamentoVLROPERACAO.AsFloat) + #13 +
                                 'Carteira: ' + qryCancelamentoDESCCARTINVEST.AsString;

                  if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                                    qryCancelamentoIDINVESTIMENTO.AsInteger, 2,
                                                    qryCancelamentoIDOPERACAOINVEST.AsInteger, -1,
                                                    qryCancelamentoIDTIPOOPERACAO.AsInteger,
                                                    qryCancelamentoIDCARTEIRAINVEST.AsInteger,
                                                    qryCancelamentoIDCARTEIRAGERENC.AsInteger,
                                                    -1, -1, -1, -1, -1,
                                                    qryCancelamentoDATAOPERACAO.AsDateTime,
                                                    qryCancelamentoVLROPERACAO.AsFloat,
                                                    qryCancelamentoQTDEOPERACAO.AsFloat,
                                                    pRPI.VLRCOTAINICART,
                                                    0 {Variacao}, 0{Juros},
                                                    0 {wVlrIRProv} {Verificar se vai calcular o saldo},
                                                    0, 0, 0, 0, 0, 0,
                                                    'A'{Movimento},
                                                    'A' {Operacao},
                                                    qryCancelamentoIDLOTE.AsString,
                                                    Trim(qryCancelamentoDESCTIPOOPERACAO.AsString) + ' - Origem / ' +
                                                         Trim(qryCancelamentoDESCINVESTIMENTO.AsString),
                                                    'OPE', '1', '', True, -1,
                                                    //AL_7
                                                    qryCancelamentoIDPLANPREVCTBPATR.AsInteger, iIdHistCartInv) then
                     Raise Exception.Create('Não foi possível inserir os Históricos das Operações de Cancelamento de Origem.');

                  if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                     Raise Exception.Create('Não foi possivel atualizar os saldos desta Carteira/Investimento');

                  wSaldoAqui  := 0;
                  wSaldoVar   := 0;
                  //AL_7 - Ini
                  //AL_3
                  //AL_4
                  //AL_5
                  CtrlRV.BuscaSaldoRV.Executa(qryCancelamento.FieldByName('DATAOPERACAO').AsDateTime,
                                              qryCancelamento.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                              qryCancelamento.FieldByName('IDINVESTIMENTO').AsInteger,
                                              qryCancelamento.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                              qryCancelamento.FieldByName('IDCARTEIRAGERENC').AsInteger, iIdHistCartInv,
                                              qryCancelamento.FieldByName('IDCUSTODIANTE').AsInteger,
                                              qryCancelamento.FieldByName('IDLOTE').AsString);

                  wSaldoAqui := CtrlRV.BuscaSaldoRV.SaldoCusto + qryCancelamentoVLRCUSTOATUAL.AsFloat;
                  wSaldoVar  := CtrlRV.BuscaSaldoRV.SaldoVariacao + qryCancelamentoVLRVARIACAOATUAL.AsFloat;
                  //AL_7 - Fim
                  if not ExecutaQuery(qryAuxiliar,' UPDATE HISTCARTINV SET MOVIMAQUI = '+ TrocaVirgulaPonto(FloatToStr(qryCancelamentoVLRCUSTOATUAL.AsFloat))+','+
                                                  ' SALDOAQUI     = '+ TrocaVirgulaPonto(FloatToStr(wSaldoAqui))+','+
                                                  ' VLRVARIACAO   = '+ TrocaVirgulaPonto(FloatToStr(qryCancelamentoVLRVARIACAOATUAL.AsFloat))+','+
                                                  ' SALDOVARIACAO = '+ TrocaVirgulaPonto(FloatToStr(wSaldoVar))+
                                                  ' WHERE IDHISTCARTINV = '+IntToStr(iIdHistCartInv)) then
                     Raise Exception.Create('Não foi possivel atualizar os saldos de custo e variação');

                  bReproc := True;
               end
               else
                  iIdHistCartInv := qryHistCartInvIDHISTCARTINV.AsInteger;

               // Se NÃO for Carteira Gerencial
               if qryCancelamentoIDCARTEIRAGERENC.IsNull then
               begin
                  // Se o Registro foi alterado
                  if qryCancelamentoALTERADO.AsString = 'S' then
                  begin
                     // Relança a Custódia
                     wIdOperCust := LeUltRegistro(Nil,'OPERCUSTODIA');

                     //AL_8
                     if not OperacaoInvest.AlimentaOperCustodia(wIdOperCust, -1, -1,
                                                             -1{iIdHistCartInv} {Origem},
                                                             -1{Destino},
                                                             qryCancelamentoIDCARTEIRAINVEST.AsInteger,
                                                             qryCancelamentoIDCARTEIRAINVEST.AsInteger,
                                                             qryCancelamentoIDINVESTIMENTO.AsInteger,
                                                             qryCancelamentoIDCUSTODIANTE.AsInteger,
                                                             qryCancelamentoIDCUSTODIANTE.AsInteger,
                                                             OperComum.IIF(qryCancelamentoIDMOTIVOBLOQUEIO.IsNull,-1,qryCancelamentoIDMOTIVOBLOQUEIO.AsInteger),
                                                             OperComum.IIF(qryCancelamentoIDMOTIVOBLOQUEIO.IsNull,-1,qryCancelamentoIDMOTIVOBLOQUEIO.AsInteger),
                                                             qryCancelamentoQTDEOPERACAO.AsFloat,
                                                             qryCancelamentoDATAOPERACAO.AsDateTime,
                                                             qryCancelamentoIDLOTE.AsString,
                                                             qryCancelamentoNUMDOCUMENTO.AsString,
                                                             //AL_7
                                                             qryCancelamentoIDPLANPREVCTBPATR.AsInteger) Then
                        Raise Exception.Create('Não foi possível lançar a Custódia da boleta ' + qryOrigemNUMDOCUMENTO.AsString);

                     ExecutarQuery(qryAuxiliar,'UPDATE OPERACAOINVEST ' +
                                               'SET IDOPERCUSTODIA = ' + IntToStr(wIdOperCust) + ' ' +
                                               'WHERE IDOPERACAOINVEST = ' + qryCancelamentoIDOPERACAOINVEST.AsString);

                     if qryCancelamentoIDMOTIVOBLOQUEIO.AsInteger = -1 then
                        sTipoCustodia := 'C'
                     else
                        sTipoCustodia := 'Y';  //AUMENTA SALDO BLOQUEADO

                     if not OperacaoInvest.InsereCustodia(
                                           qryCancelamentoIDCARTEIRAINVEST.AsInteger,
                                           qryCancelamentoIDINVESTIMENTO.AsInteger,
                                           qryCancelamentoIDCUSTODIANTE.AsInteger,
                                           OperComum.IIF(qryCancelamentoIDMOTIVOBLOQUEIO.IsNull,-1,
                                                         qryCancelamentoIDMOTIVOBLOQUEIO.AsInteger),
                                           qryCancelamentoIDOPERACAOINVEST.AsInteger,
                                           wIdOperCust, qryCancelamentoIDLOTE.AsString,
                                           sTipoCustodia,
                                           qryCancelamentoDATAOPERACAO.AsDateTime,
                                           qryCancelamentoQTDEOPERACAO.AsFloat,
                                           iIdHistCustodia,
                                           //AL_7
                                           qryCancelamentoIDPLANPREVCTBPATR.AsInteger) then
                        Raise Exception.Create('Não foi possível atualizar um histórico de custodia da boleta '+ qryOrigemNUMDOCUMENTO.AsString);

                     OperacaoInvest.AtualizaSaldosCustodia;

                     ExecutarQuery(qryAuxiliar,'UPDATE OPERACAOINVEST ' +
                                               'SET IDOPERCUSTODIA = ' + IntToStr(wIdOperCust) + ' ' +
                                               'WHERE IDOPERACAOINVEST = ' + qryCancelamentoIDOPERACAOINVEST.AsString);
                     bReproc := True;
                  end;

                  // Se houveram alterações nos Destinos e a Boleta foi limpa
                  if (bAltCanc) and (qryBoleta.Lookup('IDBOLETA', qryCancelamentoNUMDOCUMENTO.AsString, 'EXCLUIBOLETA') = 'S') then
                  begin
                     fraMens.Mes := 'Contabilizando R$ ' + FormatFloat('###,###,###,##0.00', qryCancelamentoVLROPERACAO.AsFloat) + #13 +
                                    'Carteira: ' + qryCancelamentoDESCCARTINVEST.AsString;

                     // Parametro para Contabilidade e CAP/CAR
                     bCriaLancto    := True;
                     wTipoRecDesBol := '';
                     wMensErro      := '';

                     // Lança o Contábil do Origem
                     if qryBoleta.Locate('IDBOLETA', qryCancelamentoNUMDOCUMENTO.AsString, []) then
                     begin
                        wPlano     := OperComum.IIF(qryBoletaPLANO.AsInteger = 0, -1, qryBoletaPLANO.AsInteger);
                        wPlanilha  := OperComum.IIF(qryBoletaPLNCODIGO.AsInteger = 0, -1, qryBoletaPLNCODIGO.AsInteger);
                        wDocumCont := OperComum.IIF(qryBoletaCODDOCUMENTO.AsInteger = 0, -1, qryBoletaCODDOCUMENTO.AsInteger);

                        if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                                   qryCancelamentoIDINVESTIMENTO.AsInteger,
                                                   qryCancelamentoIDTIPOOPERACAO.AsInteger,
                                                   qryCancelamentoIDOPERACAOINVEST.AsInteger,
                                                   qryCancelamentoIDFORCLI.AsInteger,
                                                   qryCancelamentoIDCARTEIRAINVEST.AsInteger,
                                                   qryInvestimentoAcaoIDMOEDACONTAB.AsInteger,
                                                   qryCancelamentoDESCTIPOOPERACAO.AsString + ' - Origem ' +
                                                             qryCancelamentoDESCINVESTIMENTO.AsString,
                                                   qryCancelamentoIDLOTE.AsString,
                                                   '', qryCancelamentoNUMDOCUMENTO.AsString,
                                                   qryTipoOperCancA.Lookup('IDTIPOOPERACAO', qryCancelamentoIDTIPOOPERACAO.AsInteger, 'RECPAG'),
                                                   wTipoRecDesBol, bCriaLancto,
                                                   qryCancelamentoVLROPERACAO.AsFloat,
                                                   qryCancelamentoVLROPERACAO.AsFloat,
                                                   qryCancelamentoDATAOPERACAO.AsDateTime,
                                                   qryCancelamentoDATAVENCOPER.AsDateTime,
                                                   wPlano, wPlanilha, wDocumCont, wMensErro,
                                                   ' '{sCapCar}, False, False,
                                                   //AL_7
                                                   0, True, qryCancelamentoIDPLANPREVCTBPATR.AsInteger) <> 0 then
                           Raise Exception.Create('Não foi possível contabilizar uma Operação de Destino');

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

                     if (bReproc) and (qryDATAOPER.AsDateTime <= pRPI.DATAULTFECH) then
                        RendaVariavel.MarcarFlagReproc(qryCancelamentoIDINVESTIMENTO.AsInteger, -1,
                                                       qryCancelamentoIDPLANPREVCTBPATR.AsInteger,
                                                       StrToDate(dbeCancelamento.Text));
                  end;
               end;
            end
            //Lanca Cancelamento dos Destinos
            else if qryCancelamento.FieldByName('ORIGDEST').AsString = 'D' then
            begin
               // Se não achar o histórico, relança
               if not qryHistCartInv.Locate('IDOPERACAOINVEST', qryCancelamentoIDOPERACAOINVEST.AsInteger, []) then
               begin
                  fraMens.Mes := 'Lançando Históricos de R$ ' + FormatFloat('###,###,###,##0.00', qryCancelamentoVLROPERACAO.AsFloat) + #13 +
                                 'Carteira: ' + qryCancelamentoDESCCARTINVEST.AsString;

                  if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                                    qryCancelamentoIDINVESTIMENTO.AsInteger, 2,
                                                    qryCancelamentoIDOPERACAOINVEST.AsInteger, -1,
                                                    qryCancelamentoIDTIPOOPERACAO.AsInteger,
                                                    qryCancelamentoIDCARTEIRAINVEST.AsInteger,
                                                    qryCancelamentoIDCARTEIRAGERENC.AsInteger,
                                                    -1, -1, -1, -1, -1,
                                                    qryCancelamentoDATAOPERACAO.AsDateTime,
                                                    qryCancelamentoVLROPERACAO.AsFloat,
                                                    qryCancelamentoQTDEOPERACAO.AsFloat,
                                                    pRPI.VLRCOTAINICART,
                                                    0 {Variacao}, 0{Juros},
                                                    0 {wVlrIRProv} {Verificar se vai calcular o saldo},
                                                    0, 0, 0, 0, 0, 0,
                                                    'D' {Movimento},
                                                    'D' {Operacao},
                                                    qryCancelamentoIDLOTE.AsString,
                                                    Trim(qryCancelamentoDESCTIPOOPERACAO.AsString) + ' - Destino / ' +
                                                         Trim(qryCancelamentoDESCINVESTIMENTO.AsString),
                                                    'OPE', '1', '', True, -1,
                                                    //AL_7
                                                    qryCancelamentoIDPLANPREVCTBPATR.AsInteger, iIdHistCartInv) then
                     Raise Exception.Create('Não foi possível inserir os Históricos das Operações de Cancelamento de Destino.');

                  if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                     Raise Exception.Create('Não foi possivel atualizar os saldos desta Carteira/Investimento');

                  wSaldoAqui  := 0;
                  wSaldoVar   := 0;
                  //AL_7 - Ini
                  //AL_3
                  //AL_4
                  //AL_5
                  CtrlRV.BuscaSaldoRV.Executa(qryCancelamento.FieldByName('DATAOPERACAO').AsDateTime,
                                              qryCancelamento.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                              qryCancelamento.FieldByName('IDINVESTIMENTO').AsInteger,
                                              qryCancelamento.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                              qryCancelamento.FieldByName('IDCARTEIRAGERENC').AsInteger, iIdHistCartInv,
                                              qryCancelamento.FieldByName('IDCUSTODIANTE').AsInteger,
                                              qryCancelamento.FieldByName('IDLOTE').AsString);

                  wSaldoAqui := CtrlRV.BuscaSaldoRV.SaldoCusto;
                  wSaldoVar  := CtrlRV.BuscaSaldoRV.SaldoVariacao;

                  if qryCancelamentoIDOPERACAOORIGEM.IsNull then
                  begin
                     qryAuxiliar.Close;
                     qryAuxiliar.SQL.Clear;
                     qryAuxiliar.SQL.Add('SELECT IDOPERACAOINVEST FROM OPERACAOINVEST ');
                     qryAuxiliar.SQL.Add(' WHERE IDOPERACAODIREITO = ' + IntToStr(qryCancelamentoIDOPERACAODIREITO.AsInteger) );
                     qryAuxiliar.SQL.Add(' AND IDINVESTIMENTO = ' + qryCancelamento.FieldByName('IDINVESTIMENTO').AsString );
                     qryAuxiliar.SQL.Add(' AND IDCARTEIRAINVEST = ' + qryCancelamento.FieldByName('IDCARTEIRAINVEST').AsString );
                     if not qryCancelamento.FieldByName('IDCARTEIRAGERENC').IsNull then
                     begin
                        // Carteira Gerencial
                        qryAuxiliar.SQL.Add(' AND IDCARTEIRAGERENC = ' + qryCancelamento.FieldByName('IDCARTEIRAGERENC').AsString );
                        qryAuxiliar.SQL.Add(' AND IDCUSTODIANTE IS NULL ');
                        qryAuxiliar.SQL.Add(' AND IDMOTIVOBLOQUEIO IS NULL');
                     end
                     else
                     begin
                        // Carteira Própria
                        qryAuxiliar.SQL.Add(' AND IDCARTEIRAGERENC IS NULL ');
                        qryAuxiliar.SQL.Add(' AND IDCUSTODIANTE = ' + qryCancelamento.FieldByName('IDCUSTODIANTE').AsString );
                        qryAuxiliar.SQL.Add(' AND IDMOTIVOBLOQUEIO = ' + qryCancelamento.FieldByName('IDMOTIVOBLOQUEIO').AsString );
                     end;
                     qryAuxiliar.SQL.Add(' AND IDPLANPREVCTBPATR = ' + qryCancelamento.FieldByName('IDPLANPREVCTBPATR').AsString );
                     qryAuxiliar.SQL.Add(' AND IDTIPOOPERACAO = ' + IntToStr(pRPI.IDTIPOOPERDIRDSA) );
                     qryAuxiliar.Open;

                     qryAuxiliar.Close;
                     qryAuxiliar.SQL.Clear;
                     qryAuxiliar.SQL.Add('SELECT MOVIMAQUI, SALDOAQUI, VLRVARIACAO, SALDOVARIACAO ');
                     qryAuxiliar.SQL.Add('FROM HISTCARTINV ');
                     qryAuxiliar.SQL.Add('WHERE IDOPERACAOINVEST = ' + IntToStr(qryAuxiliar.FieldByName('IDOPERACAOINVEST').AsInteger));
                     qryAuxiliar.Open;
                  end
                  else
                  begin
                     qryAuxiliar.Close;
                     qryAuxiliar.SQL.Clear;
                     qryAuxiliar.SQL.Add('SELECT MOVIMAQUI, SALDOAQUI, VLRVARIACAO, SALDOVARIACAO ');
                     qryAuxiliar.SQL.Add('FROM HISTCARTINV ');
                     qryAuxiliar.SQL.Add('WHERE IDOPERACAOINVEST = ' + IntToStr(qryCancelamentoIDOPERACAOORIGEM.AsInteger));
                     qryAuxiliar.Open;
                  end;
                  //AL_7 - Fim

                  wMovimAqui := qryAuxiliar.FieldByName('MOVIMAQUI').AsFloat * -1;
                  wSaldoAqui := wSaldoAqui + wMovimAqui;
                  wMovimVar  := qryAuxiliar.FieldByName('VLRVARIACAO').AsFloat * -1;
                  wSaldoVar  := wSaldoVar + wMovimVar;
                  qryAuxiliar.Close;

                  //if not
                  ExecutaQuery(qryAuxiliar,' UPDATE HISTCARTINV SET MOVIMAQUI = '+ TrocaVirgulaPonto(FloatToStr(wMovimAqui))+','+
                                                  ' SALDOAQUI     = '+ TrocaVirgulaPonto(FloatToStr(wSaldoAqui))+','+
                                                  ' VLRVARIACAO   = '+ TrocaVirgulaPonto(FloatToStr(wMovimVar))+','+
                                                  ' SALDOVARIACAO = '+ TrocaVirgulaPonto(FloatToStr(wSaldoVar))+
                                                  ' WHERE IDHISTCARTINV = '+IntToStr(iIdHistCartInv));

                  bReproc := True;
               end
               else
                  iIdHistCartInv := qryHistCartInvIDHISTCARTINV.AsInteger;

               // Se NÃO for Carteira Gerencial
               if qryCancelamentoIDCARTEIRAGERENC.IsNull then
               begin
                  // Se o Registro foi alterado
                  if qryCancelamentoALTERADO.AsString = 'S' then
                  begin
                     // Relança a Custódia
                     wIdOperCust := LeUltRegistro(Nil,'OPERCUSTODIA');

                     //AL_8
                     if not OperacaoInvest.AlimentaOperCustodia(wIdOperCust, -1, -1,
                                                                -1{iIdHistCartInv} {Origem},
                                                                -1{Destino},
                                                                qryCancelamentoIDCARTEIRAINVEST.AsInteger,
                                                                qryCancelamentoIDCARTEIRAINVEST.AsInteger,
                                                                qryCancelamentoIDINVESTIMENTO.AsInteger,
                                                                qryCancelamentoIDCUSTODIANTE.AsInteger,
                                                                qryCancelamentoIDCUSTODIANTE.AsInteger,
                                                                OperComum.IIF(qryCancelamentoIDMOTIVOBLOQUEIO.IsNull,-1,qryCancelamentoIDMOTIVOBLOQUEIO.AsInteger),
                                                                OperComum.IIF(qryCancelamentoIDMOTIVOBLOQUEIO.IsNull,-1,qryCancelamentoIDMOTIVOBLOQUEIO.AsInteger),
                                                                qryCancelamentoQTDEOPERACAO.AsFloat,
                                                                qryCancelamentoDATAOPERACAO.AsDateTime,
                                                                qryCancelamentoIDLOTE.AsString,
                                                                qryCancelamentoNUMDOCUMENTO.AsString,
                                                                //AL_7
                                                                qryCancelamentoIDPLANPREVCTBPATR.AsInteger) Then
                        Raise Exception.Create('Não foi possível lançar a Custódia da boleta ' + qryDestinoNUMDOCUMENTO.AsString);

                     ExecutarQuery(qryAuxiliar,'UPDATE OPERACAOINVEST ' +
                                               'SET IDOPERCUSTODIA = ' + IntToStr(wIdOperCust) + ' ' +
                                               'WHERE IDOPERACAOINVEST = ' + qryCancelamentoIDOPERACAOINVEST.AsString);

                     if qryCancelamentoIDMOTIVOBLOQUEIO.AsInteger = -1 then
                        sTipoCustodia := 'V'
                     else
                        sTipoCustodia := 'Z';  //DIMINUI SALDO BLOQUEADO

                     if not OperacaoInvest.InsereCustodia(
                                           qryCancelamentoIDCARTEIRAINVEST.AsInteger,
                                           qryCancelamentoIDINVESTIMENTO.AsInteger,
                                           qryCancelamentoIDCUSTODIANTE.AsInteger,
                                           OperComum.IIF(qryCancelamentoIDMOTIVOBLOQUEIO.IsNull,-1,
                                                         qryCancelamentoIDMOTIVOBLOQUEIO.AsInteger),
                                           qryCancelamentoIDOPERACAOINVEST.AsInteger,
                                           wIdOperCust, qryCancelamentoIDLOTE.AsString,
                                           sTipoCustodia,
                                           qryCancelamentoDATAOPERACAO.AsDateTime,
                                           qryCancelamentoQTDEOPERACAO.AsFloat,
                                           iIdHistCustodia,
                                           //AL_7
                                           qryCancelamentoIDPLANPREVCTBPATR.AsInteger) then
                        Raise Exception.Create('Não foi possível atualizar um histórico de custodia da boleta '+ qryOrigemNUMDOCUMENTO.AsString);

                     OperacaoInvest.AtualizaSaldosCustodia;

                     ExecutarQuery(qryAuxiliar,'UPDATE OPERACAOINVEST ' +
                                               'SET IDOPERCUSTODIA = ' + IntToStr(wIdOperCust) + ' ' +
                                               'WHERE IDOPERACAOINVEST = ' + qryCancelamentoIDOPERACAOINVEST.AsString);
                     bReproc := True;
                  end;

                  // Se houveram alterações nos Destinos e a Boleta foi limpa
                  if (bAltCanc) and (qryBoleta.Lookup('IDBOLETA', qryCancelamentoNUMDOCUMENTO.AsString, 'EXCLUIBOLETA') = 'S') then
                  begin
                     fraMens.Mes := 'Contabilizando R$ ' + FormatFloat('###,###,###,##0.00', qryCancelamentoVLROPERACAO.AsFloat) + #13 +
                                    'Carteira: ' + qryCancelamentoDESCCARTINVEST.AsString;

                     // Parametro para Contabilidade e CAP/CAR
                     bCriaLancto    := True;
                     wTipoRecDesBol := '';
                     wMensErro      := '';

                     // Lança o Contábil do Destino
                     if qryBoleta.Locate('IDBOLETA', qryCancelamentoNUMDOCUMENTO.AsString, []) then
                     begin
                        wPlano     := OperComum.IIF(qryBoletaPLANO.AsInteger = 0, -1, qryBoletaPLANO.AsInteger);
                        wPlanilha  := OperComum.IIF(qryBoletaPLNCODIGO.AsInteger = 0, -1, qryBoletaPLNCODIGO.AsInteger);
                        wDocumCont := OperComum.IIF(qryBoletaCODDOCUMENTO.AsInteger = 0, -1, qryBoletaCODDOCUMENTO.AsInteger);

                        if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                                   qryCancelamentoIDINVESTIMENTO.AsInteger,
                                                   qryCancelamentoIDTIPOOPERACAO.AsInteger,
                                                   qryCancelamentoIDOPERACAOINVEST.AsInteger,
                                                   qryCancelamentoIDFORCLI.AsInteger,
                                                   qryCancelamentoIDCARTEIRAINVEST.AsInteger,
                                                   QryInvestimentoAcaoIDMOEDACONTAB.AsInteger,
                                                   qryCancelamentoDESCTIPOOPERACAO.AsString + ' - Destino ' +
                                                             qryCancelamentoDESCINVESTIMENTO.AsString,
                                                   qryCancelamentoIDLOTE.AsString,
                                                   '', qryCancelamentoNUMDOCUMENTO.AsString,
                                                   qryTipoOperCancD.Lookup('IDTIPOOPERACAO', qryCancelamentoIDTIPOOPERACAO.AsInteger, 'RECPAG'),
                                                   wTipoRecDesBol, bCriaLancto,
                                                   qryCancelamentoVLROPERACAO.AsFloat,
                                                   qryCancelamentoVLROPERACAO.AsFloat,
                                                   qryCancelamentoDATAOPERACAO.AsDateTime,
                                                   qryCancelamentoDATAVENCOPER.AsDateTime,
                                                   wPlano, wPlanilha, wDocumCont, wMensErro,
                                                   ' '{sCapCar}, False, False, 0, False,
                                                   //AL_7
                                                   qryCancelamentoIDPLANPREVCTBPATR.AsInteger) <> 0 then
                           Raise Exception.Create('Não foi possível contabilizar uma Operação de Destino');

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

                     if (bReproc) and (qryDATAOPER.AsDateTime <= pRPI.DATAULTFECH) then
                        //AL_7
                        RendaVariavel.MarcarFlagReproc(qryCancelamentoIDINVESTIMENTO.AsInteger, -1,
                                                       qryCancelamentoIDPLANPREVCTBPATR.AsInteger, StrToDate(dbeCancelamento.Text));
                  end;
               end
               else
               begin
                  iIdCarteiraXEvento := CotaComum.BuscaEventoPorTpOper(
                                                  qryCancelamentoIDCARTEIRAINVEST.AsInteger,
                                                  qryCancelamentoIDCARTEIRAGERENC.AsInteger,
                                                  qryCancelamentoIDTIPOOPERACAO.AsInteger);

                  if iIdCarteiraXEvento <> 0 then
                  begin
                     fSaldoCaixa := CaixaComum.BuscaSaldoCaixa(
                                               qryDestinoDATAOPERACAO.AsDateTime,
                                               qryDestinoIDCARTEIRAINVEST.AsInteger,
                                               qryDestinoIDCARTEIRAGERENC.AsInteger,
                                               //AL_7
                                               qryCancelamentoIDPLANPREVCTBPATR.AsInteger, 'OPE');

                     if not CaixaComum.GravaEventosCaixa(
                                       qryCancelamentoDATAOPERACAO.AsDateTime,
                                       //AL_7
                                       qryCancelamentoIDPLANPREVCTBPATR.AsInteger,
                                       qryCancelamentoIDTIPOOPERACAO.AsInteger,
                                       0,
                                       qryCancelamentoIDCARTEIRAINVEST.AsInteger,
                                       qryCancelamentoIDCARTEIRAGERENC.AsInteger,
                                       qryCancelamentoIDOPERACAOINVEST.AsInteger,
                                       qryCancelamentoIDOPERACAODIREITO.AsInteger,
                                       qryCancelamentoDESCINVESTIMENTO.AsString,
                                       qryCancelamentoVLROPERACAO.AsFloat,
                                       fSaldoCaixa) Then
                        Raise Exception.Create('Não é possível Atualizar o Caixa da Carteira Gerencial. ');
                  end;
               end;
            end;
            fraMens.Incrementa;
            QryCancelamento.Next;
         end;
         //AL_1 Fim

         if dtmBaseDados.dbBaseDados.InTransaction then
         begin
            dtmBaseDados.dbBaseDados.Commit;
            MsgDlg('Processo concluído com Sucesso.', 'Mensagem do Sistema ',mtConfirmation,[mbOK],0);
         end
         else
            MsgDlg('Ocorreu um problema no controle de transação:' + #13 +
                   'Não há transação para comitar', 'Mensagem do Sistema ',mtWarning,[mbOK],0);

         // Refaz o Status do Form como Browse
         bbtnCancelar.Click;
//         inherited;

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
      Sel(qryIDOPERACAODIREITO.AsInteger);
      qryOrigem.EnableControls;
      qryDestino.EnableControls;
      qryCancelamento.EnableControls;
      CmeDetalhe.AtualizaBotoes(Self);
      CmeCadastro.AtualizaBotoes(Self);
      //AL_7
      FreeAndNil(CtrlRV);
   end;
end;

procedure TfrmCadSubscricaoComAcoes.FormResize(Sender: TObject);
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

procedure TfrmCadSubscricaoComAcoes.CalculaVlrLiq(Origem: String = 'O');
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


procedure TfrmCadSubscricaoComAcoes.dsOrigemStateChange(Sender: TObject);
begin
   inherited;
   HabDetOrig((qryOrigem.State = dsInsert));
   dbrQtdProv.Enabled    := (qryOrigem.State in [dsInsert, dsEdit]);
end;

procedure TfrmCadSubscricaoComAcoes.CmeDetalheConfirma(Sender: TObject);
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
            //AL_7
            qryOrigemPLANPRVCONTABPATRO.AsString   := qryPlanPrevCtbPatr.Lookup('IDPLANPREVCTBPATR', iPlanPrevCtbPatro, 'PLANPRVCONTABPATRO');
            qryOrigemDATAOPERACAO.AsDateTime       := qryDATAOPER.AsDateTime;
            qryOrigemDATAVENCOPER.AsDateTime       := CalcVenc(qryDATAOPER.AsDateTime, qryTipoOperOrigVENCIMENTO.AsInteger);
            qryOrigemDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
            if qryOrigemNUMDOCUMENTO.IsNull then
               qryOrigemNUMDOCUMENTO.AsString      := BuscaBoleta(qryDATAOPER.AsDateTime, wIdForCli);
            qryOrigemFLGSTATUSFECHBOL.AsString     := 'F';
            qryOrigemFLGSTATUSORDMOV.AsString      := 'L';
            qryOrigemPRECOUNITOPERACAO.AsFloat     := 0;
            qryOrigemPERCENTUAL.AsFloat            := 0;
            qryOrigemORIGDEST.AsString             := 'O';
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

            if qryOrigemIDCARTEIRAGERENC.IsNull then
            begin
               iCartRat := qryOrigemIDCARTEIRAINVEST.AsInteger;
               sBoleRat := qryOrigemNUMDOCUMENTO.AsString;
               iOperRat := qryOrigemIDOPERACAOINVEST.AsInteger;
               iMotBRat := qryOrigemIDMOTIVOBLOQUEIO.AsInteger;
               iTpOpRat := qryOrigemIDTIPOOPERACAO.AsInteger;
               fVOpeRat := qryOrigemVLROPERACAO.AsFloat;
               fQtdeRat := qryOrigemQTDEOPERACAO.AsFloat;
               fPUOpRat := qryOrigemPRECOUNITOPERACAO.AsFloat;
               if fValorAnt <> 0 then
                  fPercRatV := qryOrigemVLROPERACAO.AsFloat / fValorAnt
               else
                  fPercRatV := 1;

               if fQtdeAnt <> 0 then
                  fPercRatQ := qryOrigemQTDEOPERACAO.AsFloat / fQtdeAnt
               else
                  fPercRatQ := 1;
            end
            else
            begin
               iCartRat  := 0;
               sBoleRat  := '';
               iOperRat  := 0;
               iMotBRat  := 0;
               iTpOpRat  := 0;
               fPercRatQ := 0;
               fPercRatV := 0;
               fVOpeRat  := 0;
               fQtdeRat  := 0;
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
            //AL_7
            qryDestinoPLANPRVCONTABPATRO.AsString   := qryPlanPrevCtbPatr.Lookup('IDPLANPREVCTBPATR', iPlanPrevCtbPatro, 'PLANPRVCONTABPATRO');
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
            if qryDestinoIDCARTEIRAGERENC.IsNull then
            begin
               iCartRat := qryDestinoIDCARTEIRAINVEST.AsInteger;
               sBoleRat := qryDestinoNUMDOCUMENTO.AsString;
               iOperRat := qryDestinoIDOPERACAOINVEST.AsInteger;
               iMotBRat := qryDestinoIDMOTIVOBLOQUEIO.AsInteger;
               iTpOpRat := qryDestinoIDTIPOOPERACAO.AsInteger;
               fVOpeRat := qryDestinoVLROPERACAO.AsFloat;
               fQtdeRat := qryDestinoQTDEOPERACAO.AsFloat;
               fPUOpRat := qryDestinoPRECOUNITOPERACAO.AsFloat;
               if fValorAnt <> 0 then
                  fPercRatV := qryDestinoVLROPERACAO.AsFloat / fValorAnt
               else
                  fPercRatV := 1;

               if fQtdeAnt <> 0 then
                  fPercRatQ := qryDestinoQTDEOPERACAO.AsFloat / fQtdeAnt
               else
                  fPercRatQ := 1;
            end
            else
            begin
               iCartRat  := 0;
               sBoleRat  := '';
               iOperRat  := 0;
               iMotBRat  := 0;
               iTpOpRat  := 0;
               fVOpeRat  := 0;
               fQtdeAnt  := 0;
               fPercRatV := 0;
               fPercRatQ := 0;
            end;
         end;
      end;
      inherited;
   except
      bbtnCancelarDet.Click;
   end;
end;

procedure TfrmCadSubscricaoComAcoes.dbrQtdProvExit(Sender: TObject);
begin
   inherited;
   if (Pos('Orig',TDBRealEdit(Sender).Name) > 0) then
   begin
      dbrVlrProv.Value := OperComum.DivValorZero((dbrQtdProv.Value * qryDIVPORACAO.AsFloat), QryInvestimentoAcaoQTDTITLOTE.AsInteger);
      CalculaVlrLiq('O')
   end
   //AL_1 Ini
   else if (Pos('Canc',TDBRealEdit(Sender).Name) > 0) then
   begin
      dbrVlrCanc.Value := OperComum.DivValorZero((dbrQtdCanc.Value * qryDIVPORACAO.AsFloat), QryInvestimentoAcaoQTDTITLOTE.AsInteger);
      CalculaVlrLiq('C')
   end
   //AL_1 Fim
   else
   begin
      dbrVlrRec.Value := OperComum.DivValorZero((dbrQtdRec.Value * qryDIVPORACAO.AsFloat), QryInvestimentoAcaoQTDTITLOTE.AsInteger);
      CalculaVlrLiq('D');
   end;
end;

procedure TfrmCadSubscricaoComAcoes.tbcDetalheChange(Sender: TObject);
begin
   inherited;
   bbtnGeraOperacoes.Visible := (pgctrlDetalhe.ActivePage <> tbsDet);
   if pgctrlDetalhe.ActivePage = tbsOrigem then
      bbtnGeraOperacoes.Hint := 'Gera Origem'
   else if pgctrlDetalhe.ActivePage = tbsDestino then
      bbtnGeraOperacoes.Hint := 'Gera Destino'
   //AL_1
   else if pgctrlDetalhe.ActivePage = tbsCancelamento then
      bbtnGeraOperacoes.Hint := 'Gera Cancelamento'
   else
      bbtnGeraOperacoes.Hint := '';

   if pgctrlDetalhe.ActivePage = tbsOrigem then
      bbtnGeraOperacoes.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty))
   else if pgctrlDetalhe.ActivePage = tbsDestino then
      bbtnGeraOperacoes.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty) and
                                      (not qryOrigem.IsEmpty))
   //AL_1
   else if pgctrlDetalhe.ActivePage = tbsCancelamento then
      bbtnGeraOperacoes.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty));

   sbtnInsDet.Visible := True;
   sbtnAltDet.Visible := True;
end;

function TfrmCadSubscricaoComAcoes.GeraOrigem: Boolean;
var wQtdOper, wVlrOperacao,
    wPuProporcinal, wSdoQtdCPMF, wPUMedio : Double;
    wSaldoNormal, wSaldoCCI: Double;
    wIdNovaOperacao, wIdForCli, I: Integer;
    DataAGECons: TDateTime;
    wNumDoc, sBol: String;
    //AL_7
    CtrlRV: TCtrlRendaVariavel;
begin
   try
      try
         Result := False;
         qryOrigem.DisableControls;
         qryDestino.DisableControls;

         CtrlRV := TCtrlRendaVariavel.Create;
         CtrlRV.InitializeAs(Padroes);

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

         if not qryDetalhe.Locate('ORIGDEST', 'O', []) then
            Raise Exception.Create('Não foi Possível localizar o Investimento de Origem');

         fraMens.Mostra;
         fraMens.Mes := 'Buscando Saldos...';

         // Capta os Saldos do Investimentos na data
         OperComum.LimpaParametros(QrySaldoOrigem);
         QrySaldoOrigem.ParamByName('IDINVESTIMENTO').AsInteger := qryDetalheIDINVESTIMENTO.AsInteger;
         QrySaldoOrigem.ParamByName('DATAAGE').AsString := qryDATAAGE.AsString;
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

         // Capta o IDForCli
         FornecedorCli(QrySaldoOrigemIDCUSTODIANTE.AsInteger,
                       QrySaldoOrigemIDINVESTIMENTO.AsInteger, wIdForCli);

         // Gera numero de Boleta
         wNumDoc := 'RV-' + Copy(qryDATAOPER.AsString,9,2) + '/' +
                                  FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                                                      Copy(qryDATAOPER.AsString,9,2)));
         qryBoleta.Insert;
         qryBoletaIDBOLETA.AsString     := wNumDoc;
         qryBoletaSTATUS.AsString       := 'F';
         qryBoletaDATABOLETA.AsDateTime := qryDATAOPER.AsDateTime;
         qryBoletaTIPMOVBOLETA.AsString := 'DSA';
         qryBoletaIDFORCLI.AsInteger    := wIdForCli;
         qryBoletaEXCLUIBOLETA.AsString := 'N';
         qryBoleta.Post;

         while not QrySaldoOrigem.Eof do
         begin
            fraMens.Mes := 'Processando: ' + QrySaldoOrigemDESCCARTINVEST.AsString +  #13 +
                           OperComum.IIF(QrySaldoOrigemSGLCUSTODIANTE.IsNull, '', ' Custodia: ' + QrySaldoOrigemSGLCUSTODIANTE.AsString) +
                           OperComum.IIF(QrySaldoOrigemSIGLAMOTBLOQ.IsNull, '', ' Bloqueio: ' + QrySaldoOrigemSIGLAMOTBLOQ.AsString);

            QrySaldoOrigem.Edit;

            QrySaldoOrigemQTDEDIREITO.AsFloat        := QrySaldoOrigemQTDE.AsFloat;

            QrySaldoOrigemDATAREFERENCIA.AsDateTime  := qryDATAOPER.AsDateTime;

            wSaldoIRApu := 0;
            wSaldoQtd   := 0;
            wSaldoAqui  := 0;
            wSaldoVlr   := 0;
            wSdoQtdCPMF := 0;
            //AL_7 - Ini
            //AL_3
            //AL_4
            //AL_5
            CtrlRV.BuscaSaldoRV.Executa(qryDATAEX.AsDateTime,
                                        QrySaldoOrigem.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                        QrySaldoOrigem.FieldByName('IDINVESTIMENTO').AsInteger,
                                        QrySaldoOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                        QrySaldoOrigem.FieldByName('IDCARTEIRAGERENC').AsInteger, MaxInt,
                                        QrySaldoOrigem.FieldByName('IDCUSTODIANTE').AsInteger,
                                        QrySaldoOrigem.FieldByName('IDLOTE').AsString);

            wSaldoNormal := CtrlRV.BuscaSaldoRV.SaldoQtdCC ;
            wSaldoCCI    := CtrlRV.BuscaSaldoRV.SaldoQtdCCI;
            wSaldoQtd    := CtrlRV.BuscaSaldoRV.SaldoQtdTotal;
            wSaldoVlr    := CtrlRV.BuscaSaldoRV.SaldoVlrTotal;
            wSaldoAqui   := CtrlRV.BuscaSaldoRV.SaldoCusto;
            wSaldoVar    := CtrlRV.BuscaSaldoRV.SaldoVariacao;

            wPUMedio     := OperComum.DivValorZero(wSaldoVlr, wSaldoQtd);

            QrySaldoOrigemIR.AsFloat     := 0;

            QrySaldoOrigemVALOREXERCIDO.AsFloat := OperComum.DivValorZero(QrySaldoOrigemQTDEDIREITO.AsFloat,
                                                                          QrySaldoOrigemQTDTITLOTE.AsInteger)*
                                                                          wPUMedio;

            QrySaldoOrigemVLRLIQ.AsFloat := QrySaldoOrigemVALOREXERCIDO.AsFloat;

            if ((dbePercentual.Visible) And (qryPERCENTUAL.AsFloat <> 0)) then
               QrySaldoOrigem.FieldByName('VLRCUSTO').AsFloat       := (wSaldoAqui*(qryPERCENTUAL.AsFloat/100))
            else
               QrySaldoOrigem.FieldByName('VLRCUSTO').AsFloat       := wSaldoAqui;

            QrySaldoOrigem.FieldByName('VLRCUSTOATUAL').AsFloat     := wSaldoAqui;

            if ((dbePercentual.Visible) And (qryPERCENTUAL.AsFloat  <> 0)) then
               QrySaldoOrigem.FieldByName('VLRVARIACAOATUAL').AsFloat := (wSaldoVar*(qryPERCENTUAL.AsFloat/100))
            else
               QrySaldoOrigem.FieldByName('VLRVARIACAOATUAL').AsFloat := wSaldoVar;

            QrySaldoOrigemVLRCUSTO.AsFloat       := wSaldoAqui;
            QrySaldoOrigemVLRCUSTOATUAL.AsFloat  := wSaldoAqui;

            QrySaldoOrigem.Post;

            if QrySaldoOrigemQTDEDIREITO.AsFloat = 0 then
            begin
               QrySaldoOrigem.Next;
               Continue;
            end;

            // Para I = 1 - Saldo Normal
            //      I = 2 - Saldo CCI
            for I := 1 to 2 do
            begin
               if I = 1 then
               begin
                  // Saldo Normal
                  qryTipoOperOrig.Locate('IDTIPOOPERACAO', qryIDTIPOOPERACAO.AsInteger, []);
                  // ProRata saldo Normal
                  if not QrySaldoOrigemIDCARTEIRAGERENC.IsNull then
                     wQtdOper := OperComum.Round(QrySaldoOrigemQTDEDIREITO.AsFloat * (OperComum.DivValorZero(wSaldoNormal,wSaldoQtd)),0)
                  else
                     wQtdOper := wSaldoNormal;
               end
               else
               begin
                  // Saldo CCI
                  qryTipoOperOrig.Locate('IDTIPOOPERACAO', qryIDTIPOOPERACAO.AsInteger+10000, []);
                  // ProRata saldo CCI
                  if not QrySaldoOrigemIDCARTEIRAGERENC.IsNull then
                     wQtdOper := OperComum.Round(QrySaldoOrigemQTDEDIREITO.AsFloat * (OperComum.DivValorZero(wSaldoCCI,wSaldoQtd)),0)
                  else
                     wQtdOper := wSaldoCCI;
               end;

               if wQtdOper > 0 then
               begin
                  if not qryBoleta.Locate('IDBOLETA', wNumDoc, []) then
                     Raise Exception.Create('Não foi possível localizar a boleta ' + wNumDoc);

                  // Gera Novo Id de Operacao
                  wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

                  if qryTipoOperOrigIDTIPOOPERACAO.IsNull then
                     Raise Exception.Create('Tipo de Operação não encontrado.');

                  wPuProporcinal := OperComum.DivValorZero(QrySaldoOrigemVLRLIQ.AsFloat,QrySaldoOrigemQTDEDIREITO.AsFloat);

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
                  qryOrigemIDFORCLI.AsInteger            := wIdForCli;
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
                  //AL_7
                  qryOrigemIDPLANPREVCTBPATR.AsInteger   := QrySaldoOrigem.FieldByName('IDPLANPREVCTBPATR').AsInteger;
                  qryOrigemPLANPRVCONTABPATRO.AsString   := qryPlanPrevCtbPatr.Lookup('IDPLANPREVCTBPATR', QrySaldoOrigem.FieldByName('IDPLANPREVCTBPATR').AsInteger, 'PLANPRVCONTABPATRO');
                  qryOrigemDATAOPERACAO.AsDateTime       := qryDATAOPER.AsDateTime;
                  qryOrigemDATAVENCOPER.AsDateTime       := CalcVenc(qryDATAOPER.AsDateTime, qryTipoOperOrigVENCIMENTO.AsInteger);
                  qryOrigemDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
                  qryOrigemNUMDOCUMENTO.AsString         := wNumDoc;
                  qryOrigemFLGSTATUSFECHBOL.AsString     := 'F';
                  qryOrigemFLGSTATUSORDMOV.AsString      := 'L';
                  qryOrigemQTDEOPERACAO.AsFloat          := OperComum.Round((wQtdOper * OperComum.DivValorZero(qryPERCENTUAL.AsFloat,100)),0);
                  qryOrigemPRECOUNITOPERACAO.AsFloat     := wPUMedio;
                  qryOrigemVLROPERACAO.AsFloat           := OperComum.Round(wQtdOper*wPuProporcinal,2);
                  qryOrigemVLRIR.AsFloat                 := OperComum.Round((QrySaldoOrigemIR.AsFloat * OperComum.DivValorZero(qryPERCENTUAL.AsFloat,100)),2);
                  qryOrigemVLRREMUNERACAO.AsFloat        := OperComum.Round((QrySaldoOrigemVLRREMUNERACAO.AsFloat * OperComum.DivValorZero(qryPERCENTUAL.AsFloat,100)),2);
                  qryOrigemVLRIRREMUNER.AsFloat          := OperComum.Round((QrySaldoOrigemVLRIRREMUNERACAO.AsFloat * OperComum.DivValorZero(qryPERCENTUAL.AsFloat,100)),2);
                  qryOrigemVLRLIQUIDO.AsFloat            := wVlrOperacao;
                  qryOrigemPERCENTUAL.AsFloat            := qryPERCENTUAL.AsFloat;
                  qryOrigemORIGDEST.AsString             := 'O';
                  if not QrySaldoOrigemIDMOTIVOBLOQUEIO.IsNull then
                     qryOrigemIDMOTIVOBLOQUEIO.AsInteger := QrySaldoOrigemIDMOTIVOBLOQUEIO.AsInteger
                  else
                     qryOrigemIDMOTIVOBLOQUEIO.Clear;
                  if not QrySaldoOrigemSIGLAMOTBLOQ.IsNull then
                     qryOrigemSIGLAMOTBLOQ.AsString      := QrySaldoOrigemSIGLAMOTBLOQ.AsString
                  else
                     qryOrigemSIGLAMOTBLOQ.Clear;
                  qryOrigemIDOPERCUSTODIA.Clear;
                  qryOrigemALTERADO.AsString        := 'S';

                  qryOrigemVLRCUSTOATUAL.AsFloat    := OperComum.Round(
                     ((QrySaldoOrigemVLRCUSTOATUAL.AsFloat*
                         OperComum.DivValorZero(wQtdOper,wSaldoQtd))*
                         OperComum.DivValorZero(qryPERCENTUAL.AsFloat,100)),2);

                  qryOrigemVLRVARIACAOATUAL.AsFloat := OperComum.Round(
                     ((QrySaldoOrigemVLRVARIACAOATUAL.AsFloat*
                         OperComum.DivValorZero(wQtdOper,wSaldoQtd))*
                         OperComum.DivValorZero(qryPERCENTUAL.AsFloat,100)),2);

                  qryOrigemVLROPERACAO.AsFloat      := qryOrigemVLRCUSTOATUAL.AsFloat+qryOrigemVLRVARIACAOATUAL.AsFloat;
                  qryOrigem.Post;
               end;
            end;
            // Contabiliza Origem no OK da AGE
            QrySaldoOrigem.Next;
            fraMens.Incrementa;
         end;
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

function TfrmCadSubscricaoComAcoes.GeraDestino: Boolean;
var wIdNovaOperacao, wIdForCli: Integer;
    wNumDoc, wNumDocAnt, sBol: String;

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
         fraMens.Max := qryOrigem.RecordCount * 2;
         qryOrigem.First;
         wNumDocAnt := '';

         if not qryDetalhe.Locate('ORIGDEST', 'D', []) then
            Raise Exception.Create('Não foi Possível localizar o Investimento de Destino');

         if not QryInvestimentoAcao.Locate('IDINVESTIMENTO', qryDetalheIDINVESTIMENTO.AsInteger, []) then
            Raise Exception.Create('Não foi Possível localizar o Investimento de Destino');

         // Gera numero de Boleta para Saldo Normal
         wNumDoc := 'RV-' + Copy(qryDATAOPER.AsString,9,2) + '/' +
                                 FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' + Copy(qryDATAOPER.AsString,9,2)));
            // Inicializa o Cliente/Fornecedor e a data de vencimento
         FornecedorCli(qryOrigemIDCUSTODIANTE.AsInteger,
                       qryDetalheIDINVESTIMENTO.AsInteger, wIdForCli);

         qryBoleta.Insert;
         qryBoletaIDBOLETA.AsString     := wNumDoc;
         qryBoletaSTATUS.AsString       := 'F';
         qryBoletaDATABOLETA.AsDateTime := qryDATAOPER.AsDateTime;
         qryBoletaTIPMOVBOLETA.AsString := 'DSA';
         qryBoletaIDFORCLI.AsInteger    := wIdForCli;
         qryBoletaEXCLUIBOLETA.AsString := 'N';
         qryBoleta.Post;

         while not qryOrigem.Eof do
         begin
            fraMens.Mes := 'Processando: ' + qryOrigemDESCCARTINVEST.AsString +  #13 +
                           OperComum.IIF(qryOrigemSGLCUSTODIANTE.IsNull, '', ' Custodia: ' + qryOrigemSGLCUSTODIANTE.AsString) +
                           OperComum.IIF(qryOrigemSIGLAMOTBLOQ.IsNull, '', ' Bloqueio: ' + qryOrigemSIGLAMOTBLOQ.AsString);

            if qryOrigemIDTIPOOPERACAO.AsInteger < 10000 then
               // Saldo Normal
               qryTipoOperRec.Locate('IDTIPOOPERACAO', qryTipoOperacaoIDTIPOOPERACAO.AsInteger, [])
            else
               // Saldo CCI
               qryTipoOperRec.Locate('IDTIPOOPERACAO', (qryTipoOperacaoIDTIPOOPERACAO.AsInteger + 10000), []);

            // Se não encontrou o tipo de operação correto...
            if qryTipoOperRecIDTIPOOPERACAO.IsNull then
               Raise Exception.Create('Tipo de Operação não encontrado.');

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
            qryDestinoNUMDOCUMENTO.AsString         := wNumDoc;
            qryDestinoIDFORCLI.AsInteger            := wIdForCli;
            //AL_7
            qryDestinoIDPLANPREVCTBPATR.AsInteger   := qryOrigemIDPLANPREVCTBPATR.AsInteger;
            qryDestinoPLANPRVCONTABPATRO.AsString   := qryOrigemPLANPRVCONTABPATRO.AsString;
            qryDestinoDATAOPERACAO.AsDateTime       := qryDATAOPER.AsDateTime;
            qryDestinoDATAVENCOPER.AsDateTime       := CalcVenc(qryDATAOPER.AsDateTime, qryTipoOperRecVENCIMENTO.AsInteger);
            qryDestinoDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
            qryDestinoFLGSTATUSFECHBOL.AsString     := 'F';
            qryDestinoFLGSTATUSORDMOV.AsString      := 'L';
            qryDestinoPERCENTUAL.AsFloat            := qryPERCENTUAL.AsFloat;
            qryDestinoQTDEOPERACAO.AsFloat          := qryOrigemQTDEOPERACAO.AsFloat;
            qryDestinoPRECOUNITOPERACAO.AsFloat     := qryDIVPORACAO.AsFloat;
            qryDestinoVLROPERACAO.AsFloat           := OperComum.Round((qryDestinoQTDEOPERACAO.AsFloat*OperComum.DivValorZero(qryDIVPORACAO.AsFloat,QryInvestimentoAcaoQTDTITLOTE.AsInteger)),2);
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
            qryDestino.Post;

            qryOrigem.Next;
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

Function TfrmCadSubscricaoComAcoes.BuscaBoleta(dData: TDateTime; wIDForCli: Integer): String;
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
            qryBoletaTIPMOVBOLETA.AsString := 'DSA';
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

function TfrmCadSubscricaoComAcoes.CalcVenc(dDataOper: TDateTime; iPrazo: Integer): TDateTime;
begin
   Result := DiasUteisInv.SomaDiasUteis(dDataOper, iPrazo,-1,1,'',True,False,False)
end;

function TfrmCadSubscricaoComAcoes.AchaOrigem(iPlanoPatro, iTipoOper, iCartInvest, iCartGerenc, iCustodiante, iMotBloq: Integer): Boolean;
begin
   Result := True;
   with OperComum do
   begin
      // Procura uma Origem com os mesmos dados
      qryOrigem.First;
      while not qryOrigem.Eof do
      begin
         if (qryOrigemIDPLANPREVCTBPATR.AsInteger = iPlanoPatro) and
            (qryOrigemIDTIPOOPERACAO.AsInteger    = iTipoOper) and
            (qryOrigemIDCARTEIRAINVEST.AsInteger  = iCartInvest) and
            (qryOrigemIDCARTEIRAGERENC.AsInteger  = iCartGerenc) and
            (qryOrigemIDCUSTODIANTE.AsInteger     = iCustodiante) and
            (((qryOrigemIDCARTEIRAGERENC.IsNull) and
              (qryOrigemIDMOTIVOBLOQUEIO.AsInteger = iMotBloq)) or
             (not qryOrigemIDCARTEIRAGERENC.IsNull)) then
            Break;
         qryOrigem.Next;
      end;
      // Se não achou, a query está em EOF (Não fez o Break)
      if qryOrigem.Eof then
         Result := False;
   end;
end;

procedure TfrmCadSubscricaoComAcoes.bbtnGeraOperacoesClick(Sender: TObject);
begin
   inherited;
   SelectNext(ActiveControl,True,True);
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
            GeraDestino;
         end;
      end
      //AL_1
      else
      if pgctrlDetalhe.ActivePage = tbsCancelamento then
      begin
         if Trim(dbeCancelamento.Text) = '' then
         begin
            MsgDlg('Não foi informada a Data de Cancelamento,'+#13+
                   'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
            if dbeCancelamento.CanFocus then
               dbeCancelamento.SetFocus;
            Exit;
         end;
         with qryCancelamento, OperComum do
         begin
            if not IsEmpty then
            begin
               if InvMsgBox('Para Regerar as Operações de Cancelamento é Necessário Excluir as Operações Atuais',
                            mtConfirmation, 'Mensagem do Sistema',
                            [mbYes, mbCancel], 'Continua;Cancela') = mrCancel then
                  Exit;
            end;
            if not GeraOrigemCanc then
               Exit;
            if not GeraDestinoCanc then
               Exit;
         end;
      end;
      //AL_1 Fim
   finally
      bbtnGeraOperacoes.Down := False;
   end;
end;

procedure TfrmCadSubscricaoComAcoes.dsStateChange(Sender: TObject);
begin
   inherited;
   if pgctrlDetalhe.ActivePage = tbsOrigem then
      bbtnGeraOperacoes.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty))
   else if pgctrlDetalhe.ActivePage = tbsDestino then
      bbtnGeraOperacoes.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty) and
                                      (not qryOrigem.IsEmpty))
   // AL_1
   else if pgctrlDetalhe.ActivePage = tbsCancelamento then
      bbtnGeraOperacoes.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty));
end;

procedure TfrmCadSubscricaoComAcoes.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;
   Sel(qryIDOPERACAODIREITO.AsInteger, False);
   HabilitaCamposDireito(True);
end;

procedure TfrmCadSubscricaoComAcoes.dsDetStateChange(Sender: TObject);
begin
   inherited;
   HabDetDest((qryDestino.State = dsInsert));
   dbrQtdRec.Enabled    := (qryDestino.State in [dsInsert, dsEdit]);
end;

procedure TfrmCadSubscricaoComAcoes.dblCarteiraProvisaoExit(Sender: TObject);
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

procedure TfrmCadSubscricaoComAcoes.dblCarteiraRecExit(Sender: TObject);
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

procedure TfrmCadSubscricaoComAcoes.CmeDetalheEdit(Sender: TObject);
begin
   inherited;
   // Controle de Quantidade alterada no recebimento
   if pgctrlDetalhe.ActivePage = tbsDestino then
      wQtdOperAnt := qryDestinoQTDEOPERACAO.AsFloat;
end;

procedure TfrmCadSubscricaoComAcoes.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if qryDetalhe.IsEmpty then
     dblEmissor.Enabled := True
  else
     dblEmissor.Enabled := False;

  if qryOrigem.IsEmpty then
  begin
     dblTipoOperacao.Enabled := True;
     dbeDivPorAcao.Enabled   := True;
     dbePercentual.Enabled   := True;
     dbdAGE.Enabled  := True;
     dbdEX.Enabled   := True;
     dbdOper.Enabled := True;
  end
  else
  begin
     dblTipoOperacao.Enabled := False;
     dbeDivPorAcao.Enabled   := False;
     dbePercentual.Enabled   := False;
     dbdAGE.Enabled  := False;
     dbdEX.Enabled   := False;
     dbdOper.Enabled := False;
  end;

  if qryDestino.IsEmpty then
     dbdCOM.Enabled := True
  else
     dbdCOM.Enabled := False;
end;

procedure TfrmCadSubscricaoComAcoes.dbdDataOperacaoRecExit(Sender: TObject);
begin
  inherited;
  if qryDestino.State in [dsEdit, dsInsert] then
     qryDestinoDATAVENCOPER.AsDateTime := CalcVenc(dbdDataOperacaoRec.DateTime, qryTipoOperRecVENCIMENTO.AsInteger);

end;

procedure TfrmCadSubscricaoComAcoes.sbtnInsDetClick(Sender: TObject);
begin
   if pgctrlDetalhe.ActivePage = tbsDet then
   begin
      wOrigem := False;
      wDestino := False;
      if qryDetalhe.Locate('ORIGDEST', 'O', []) then
         wOrigem := True;
      if qryDetalhe.Locate('ORIGDEST', 'D', []) then
         wDestino := True;
      if (wOrigem) and (wDestino) then
      begin
         MsgDlg('Já existe uma Origem e um Destino para esta AGE','Mensagem do Sistema ', mtWarning, [mbOK], 0);
         sbtnInsDet.Down := False;
         Exit;
      end;
   end;
   inherited;
end;

procedure TfrmCadSubscricaoComAcoes.sbtnAltDetClick(Sender: TObject);
var iOper: Integer;
begin
   fValorAnt := 0;
   fQtdeAnt  := 0;
   if pgctrlDetalhe.ActivePage = tbsDet then
   begin
      wOrigem := False;
      wDestino := False;
      iOper := qryDetalheIDOPERDIREITOXINV.AsInteger;
      if qryDetalhe.Locate('ORIGDEST', 'O', []) then
         wOrigem := True;
      if qryDetalhe.Locate('ORIGDEST', 'D', []) then
         wDestino := True;
      qryDetalhe.Locate('IDOPERDIREITOXINV', iOper, []);
   end
   else  if (pgctrlDetalhe.ActivePage = tbsOrigem) then
   begin
      fValorAnt := qryOrigemVLROPERACAO.AsFloat;
      fQtdeAnt  := qryOrigemQTDEOPERACAO.AsFloat;
   end
   else  if (pgctrlDetalhe.ActivePage = tbsDestino) then
   begin
      fValorAnt := qryDestinoVLROPERACAO.AsFloat;
      fQtdeAnt  := qryDestinoQTDEOPERACAO.AsFloat;
   end;

   inherited;

end;

procedure TfrmCadSubscricaoComAcoes.sbtnApagarClick(Sender: TObject);
var sBol: String;
begin
   // AL_2
   if RendaVariavel.VerEmAbertura then
   begin
      CmeCadastro.AtualizaBotoes(Self);
      Exit;
   end;

   if MsgDlg('Exclui a AGE, o Investimento e as Operações de Origem e Destino?','Mensagem do Sistema',mtConfirmation,[mbYes, mbNo],0) = mrYes then
   begin
      try
         //AL_1 Ini
         // Exclui as Operações de Cancelamento Anteriores
         qryCancelamento.First;
         while not qryCancelamento.Eof do
         begin
            //AL_6
            if not CtrlInvContab.TestaPeriodo(qryCancelamentoDATAOPERACAO.AsString, 2) then
               Raise Exception.Create(CtrlInvContab.MessageInfo);

            sBol := qryCancelamentoNUMDOCUMENTO.AsString;
            if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
               Raise Exception.Create('Não foi possível excluir as Operações de Destino da Boleta ' + sBol);
            while ((not qryCancelamento.Eof) and (sBol = qryCancelamentoNUMDOCUMENTO.AsString)) do
               qryCancelamento.Next;
         end;
         //AL_1 Fim

         // Exclui as Operações de Destino Anteriores
         qryDestino.First;
         while not qryDestino.Eof do
         begin
            //AL_6
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
            //AL_6
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

procedure TfrmCadSubscricaoComAcoes.CmeDetalheApplyInsert(sender: TObject; var Accept: Boolean);
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
      end;
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
      end
      else
      begin
         if not AchaOrigem(qryDestinoIDPLANPREVCTBPATR.AsInteger,
                           qryTipoOperRecIDTIPOOPERACAO.AsInteger,
                           qryDestinoIDCARTEIRAINVEST.AsInteger,
                           qryDestinoIDCARTEIRAGERENC.AsInteger,
                           qryDestinoIDCUSTODIANTE.AsInteger,
                           OperComum.IIF(Trim(dblMotivoBloqueioRec.Text) = '', -1, qryDestinoIDMOTIVOBLOQUEIO.AsInteger)) then
         begin
            MsgDlg('Não foi possível encontrar uma Origem pra este Destino.',
                   'Mensagem do Sistema', MtWarning, [mbOk],0);
            if dbeBoletaProv.CanFocus then
               dbeBoletaProv.SetFocus;
            Exit;
         end;

         // Atualiza o ID da Operação de Provisão Original
         qryDestinoIDOPERACAOORIGEM.AsInteger := qryOrigemIDOPERACAOINVEST.AsInteger;

      end;
      sDataLanc := qryDestinoDATAOPERACAO.AsString;
   end;

   if ((qryTipoOperacaoFLGGERACONTAB.AsInteger > 0) or (qryTipoOperacaoFLGGERACAPCAR.AsInteger > 0)) and
      (sDataLanc <> '')  then
   begin
      //AL_6
      if not CtrlInvContab.TestaPeriodo(sDataLanc, 2) then
      begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         Exit;
      end;
   end;

   Accept := True;
   inherited;

end;

procedure TfrmCadSubscricaoComAcoes.dbdCOMExit(Sender: TObject);
begin
  inherited;
   if (QryInvestimentoAcao.ParamByName('DATACOTACAO').AsString <> qryDATAEX.AsString)  then
   begin
      OperComum.LimpaParametros(QryInvestimentoAcao);
      QryInvestimentoAcao.ParamByName('DATACOTACAO').AsString   := qryDATAEX.AsString;
      QryInvestimentoAcao.Open;
   end;
end;

procedure TfrmCadSubscricaoComAcoes.HabilitaCamposDireito(bVisivel : Boolean);
begin
   If Trim(dblTipoOperacao.Text) <> '' then
   begin
      If (qryTipoOperacao.FieldbyName('FLGPRZEMP').AsString = 'S') And (bVisivel) Then
      begin
         LbEmpresa.Enabled      := True;
         dbdPrazoEmpresa.Enabled:= True;
      end
      Else
      begin
         LbEmpresa.Enabled      := False;
         dbdPrazoEmpresa.Enabled:= False;
      end;

      If (qryTipoOperacao.FieldbyName('FLGPRZBOLSA').AsString = 'S') And (bVisivel) Then
      begin
         LbBolsa.Enabled        := True;
         dbdPrazoBolsa.Enabled  := True;
      end
      Else
      begin
         LbBolsa.Enabled        := False;
         dbdPrazoBolsa.Enabled  := False;
      end;

      If (qryTipoOperacao.FieldbyName('FLGINIPAG').AsString = 'S') And (bVisivel) Then
      begin
         LbPagamento.Enabled    := True;
         dbeIniPagto.Enabled    := True;
      end
      Else
      begin
         LbPagamento.Enabled    := False;
         dbeIniPagto.Enabled    := False;
      end;
   end;
end;

//AL_1
procedure TfrmCadSubscricaoComAcoes.SelDetCanc(iOper: Integer);
begin
    OperComum.LimpaParametros(qryCancelamento);
    qryCancelamento.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    //AL_11
    qryCancelamento.ParamByName('DATAEX').AsString  := qryDATAEX.AsString;
    qryCancelamento.Open
end;

//AL_1
function TfrmCadSubscricaoComAcoes.GeraOrigemCanc: Boolean;
var wQtdOper, wVlrOperacao,
    wPuProporcinal, wSdoQtdCPMF, wPUMedio : Double;
    wSaldoNormal, wSaldoCCI: Double;
    wIdNovaOperacao, wIdForCli, I: Integer;
    DataAGECons: TDateTime;
    wNumDoc, sBol: String;
begin
   try
      try
         Result := False;
         qryOrigem.DisableControls;
         qryDestino.DisableControls;
         qryCancelamento.DisableControls;

         // Exclui os Cancelamentos Anteriores
         qryCancelamento.First;
         while not qryCancelamento.Eof do
         begin
            sBol := qryCancelamentoNUMDOCUMENTO.AsString;
            if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
               Raise Exception.Create('Não é possível Excluir as operações de Cancelamento da Boleta ' + sBol);
            while ((not qryCancelamento.Eof) and (sBol = qryCancelamentoNUMDOCUMENTO.AsString)) do
            begin
               qryCancelamento.Next;
            end;
         end;

         SelDetOrig(qryIDOPERACAODIREITO.AsInteger);

         SelDetDest(qryIDOPERACAODIREITO.AsInteger);

         SelDetCanc(qryIDOPERACAODIREITO.AsInteger);

         if not qryDetalhe.Locate('ORIGDEST', 'O', []) then
            Raise Exception.Create('Não foi Possível localizar o Investimento de Origem');

         fraMens.Mostra;
         fraMens.Mes := 'Buscando Saldos...';

         QryOrigem.First;

         fraMens.Mostra;
         fraMens.Max := QryOrigem.RecordCount;

         // Capta o IDForCli
         FornecedorCli(QryOrigemIDCUSTODIANTE.AsInteger,
                       QryOrigemIDINVESTIMENTO.AsInteger, wIdForCli);

         // Gera numero de Boleta
         wNumDoc := 'RV-' + Copy(dbeCancelamento.Text,9,2) + '/' +
                                  FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                                                      Copy(dbeCancelamento.Text,9,2)));
         qryBoleta.Insert;
         qryBoletaIDBOLETA.AsString     := wNumDoc;
         qryBoletaSTATUS.AsString       := 'F';
         qryBoletaDATABOLETA.AsDateTime := StrToDate(dbeCancelamento.Text);
         qryBoletaTIPMOVBOLETA.AsString := 'CSA';
         qryBoletaIDFORCLI.AsInteger    := wIdForCli;
         qryBoletaEXCLUIBOLETA.AsString := 'N';
         qryBoleta.Post;

         while not QryOrigem.Eof do
         begin
            fraMens.Mes := 'Processando: ' + QryOrigemDESCCARTINVEST.AsString +  #13 +
                           OperComum.IIF(QryOrigemSGLCUSTODIANTE.IsNull, '', ' Custodia: ' + QryOrigemSGLCUSTODIANTE.AsString) +
                           OperComum.IIF(QryOrigemSIGLAMOTBLOQ.IsNull, '', ' Bloqueio: ' + QryOrigemSIGLAMOTBLOQ.AsString);

            if not qryBoleta.Locate('IDBOLETA', wNumDoc, []) then
               Raise Exception.Create('Não foi possível localizar a boleta ' + wNumDoc);

            if qryOrigemIDTIPOOPERACAO.AsInteger < 10000 then
               // Saldo Normal
               qryTipoOperCancA.Locate('IDTIPOOPERACAO', -146, [])
            else
               // Saldo CCI
               qryTipoOperCancA.Locate('IDTIPOOPERACAO', -10146, []);

            // Se não encontrou o tipo de operação correto...
            if qryTipoOperCancAIDTIPOOPERACAO.IsNull then
               Raise Exception.Create('Tipo de Operação não encontrado.');

            // Gera Novo Id de Operacao
            wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

            qryCancelamento.Insert;
            qryCancelamentoIDOPERACAOINVEST.AsInteger    := wIdNovaOperacao;
            //AL_7
            qryCancelamentoIDOPERACAOORIGEM.AsInteger    := qryOrigemIDOPERACAOINVEST.AsInteger;
            qryCancelamentoMOECODIGO.AsInteger           := pRPI.MOECODIGO;
            qryCancelamentoIDMODULO.AsInteger            := Sistema.IdModulo;
            qryCancelamentoEMPRESAPROP.AsInteger         := Sistema.IdEmpresa;
            qryCancelamentoIDINVESTIMENTO.AsInteger      := QryOrigemIDINVESTIMENTO.AsInteger;
            qryCancelamentoDESCINVESTIMENTO.AsString     := QryOrigemDESCINVESTIMENTO.AsString;
            qryCancelamentoIDCARTEIRA.AsString           := QryOrigemIDCARTEIRA.AsString;
            qryCancelamentoIDCARTEIRAINVEST.AsInteger    := QryOrigemIDCARTEIRAINVEST.AsInteger;
            if not QryOrigemIDCARTEIRAGERENC.IsNull then
               qryCancelamentoIDCARTEIRAGERENC.AsInteger := QryOrigemIDCARTEIRAGERENC.AsInteger
            else
               qryCancelamentoIDCARTEIRAGERENC.Clear;
            qryCancelamentoDESCCARTINVEST.AsString       := QryOrigemDESCCARTINVEST.AsString;
            qryCancelamentoIDTIPOINVEST.AsInteger        := 2;
            qryCancelamentoIDTIPOOPERACAO.AsInteger      := qryTipoOperCancAIDTIPOOPERACAO.AsInteger;
            qryCancelamentoDESCTIPOOPERACAO.AsString     := qryTipoOperCancADESCTIPOOPERACAO.AsString;
            //Ver Isto Aqui
            qryCancelamentoNATUREZAOPERACAO.AsString     := qryTipoOperCancANATUREZAOPERACAO.AsString;
            qryCancelamentoIDFORCLI.AsInteger            := wIdForCli;
            if not QryOrigemIDLOTE.IsNull then
               qryCancelamentoIDLOTE.AsString            := QryOrigemIDLOTE.AsString
            else
               qryCancelamentoIDLOTE.Clear;
            if not QryOrigemIDCUSTODIANTE.IsNull then
               qryCancelamentoIDCUSTODIANTE.AsInteger    := QryOrigemIDCUSTODIANTE.AsInteger
            else
               qryCancelamentoIDCUSTODIANTE.Clear;
            if not QryOrigemSGLCUSTODIANTE.IsNull then
               qryCancelamentoSGLCUSTODIANTE.AsString    := QryOrigemSGLCUSTODIANTE.AsString
            else
               qryCancelamentoSGLCUSTODIANTE.Clear;
            qryCancelamentoIDOPERACAODIREITO.AsInteger   := qryIDOPERACAODIREITO.AsInteger;
            //AL_7
            qryCancelamentoIDPLANPREVCTBPATR.AsInteger   := qryOrigemIDPLANPREVCTBPATR.AsInteger;
            qryCancelamentoPLANPRVCONTABPATRO.AsString   := qryOrigemPLANPRVCONTABPATRO.AsString;
            qryCancelamentoDATAOPERACAO.AsDateTime       := StrToDate(dbeCancelamento.Text);
            qryCancelamentoDATAVENCOPER.AsDateTime       := CalcVenc(StrToDate(dbeCancelamento.Text), qryTipoOperCancAVENCIMENTO.AsInteger);
            //Ver isto aqui
            // Os saldos tem que ser a qtd da oper orig X cotacao da data e saldo da desta ?
            qryCancelamentoDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
            qryCancelamentoNUMDOCUMENTO.AsString         := wNumDoc;
            qryCancelamentoFLGSTATUSFECHBOL.AsString     := 'F';
            qryCancelamentoFLGSTATUSORDMOV.AsString      := 'L';
            qryCancelamentoQTDEOPERACAO.AsFloat          := QryOrigemQTDEOPERACAO.AsFloat;
            qryCancelamentoPRECOUNITOPERACAO.AsFloat     := QryOrigemPRECOUNITOPERACAO.AsFloat;
            qryCancelamentoVLROPERACAO.AsFloat           := QryOrigemVLROPERACAO.AsFloat;
            qryCancelamentoVLRIR.AsFloat                 := QryOrigemVLRIR.AsFloat;
            qryCancelamentoVLRREMUNERACAO.AsFloat        := QryOrigemVLRREMUNERACAO.AsFloat;
            qryCancelamentoVLRIRREMUNER.AsFloat          := QryOrigemVLRIRREMUNER.AsFloat;
            qryCancelamentoVLRLIQUIDO.AsFloat            := QryOrigemVLRLIQUIDO.AsFloat;
            qryCancelamentoPERCENTUAL.AsFloat            := qryPERCENTUAL.AsFloat;
            qryCancelamentoORIGDEST.AsString             := 'O';
            if not QryOrigemIDMOTIVOBLOQUEIO.IsNull then
               qryCancelamentoIDMOTIVOBLOQUEIO.AsInteger := QryOrigemIDMOTIVOBLOQUEIO.AsInteger
            else
               qryCancelamentoIDMOTIVOBLOQUEIO.Clear;
            if not QryOrigemSIGLAMOTBLOQ.IsNull then
               qryCancelamentoSIGLAMOTBLOQ.AsString      := QryOrigemSIGLAMOTBLOQ.AsString
            else
               qryCancelamentoSIGLAMOTBLOQ.Clear;
            qryCancelamentoIDOPERCUSTODIA.Clear;
            qryCancelamentoALTERADO.AsString        := 'S';

            qryCancelamentoVLRCUSTOATUAL.AsFloat    := QryOrigemVLRCUSTOATUAL.AsFloat;

            qryCancelamentoVLRVARIACAOATUAL.AsFloat := QryOrigemVLRVARIACAOATUAL.AsFloat;

            qryCancelamentoVLROPERACAO.AsFloat      := qryCancelamentoVLRCUSTOATUAL.AsFloat + qryCancelamentoVLRVARIACAOATUAL.AsFloat;
            qryCancelamento.Post;
            // Contabiliza Origem no OK da AGE
            QryOrigem.Next;
            fraMens.Incrementa;
         end;
         Result := True;
      except
         on E: Exception do
         begin
            MsgDlg('Houve um problema na geração das Operações de Cancelamento da Origem desta AGE' + #13+
                   E.Message,'Mensagem do Sistema ', mtWarning, [mbOK], 0);
            bbtnCancelarDet.Click;
            bbtnCancelar.Click;
            Result := False;
         end;
      end;
   finally
      qryOrigem.EnableControls;
      qryDestino.EnableControls;
      qryCancelamento.EnableControls;
      fraMens.Apaga;
      CmeDetalhe.AtualizaBotoes(Self);
      sbtnConsDet.Enabled := not (qryCancelamento.IsEmpty);
   end;
end;

//AL_1
function TfrmCadSubscricaoComAcoes.GeraDestinoCanc: Boolean;
var wQtdOper, wVlrOperacao,
    wPuProporcinal, wSdoQtdCPMF, wPUMedio : Double;
    wSaldoNormal, wSaldoCCI: Double;
    wIdNovaOperacao, wIdForCli, I: Integer;
    DataAGECons: TDateTime;
    wNumDoc, sBol: String;
begin
   try
      try
         Result := False;
         qryOrigem.DisableControls;
         qryDestino.DisableControls;
         qryCancelamento.DisableControls;

         if not qryDetalhe.Locate('ORIGDEST', 'D', []) then
            Raise Exception.Create('Não foi Possível localizar o Investimento de Origem');

         fraMens.Mostra;
         fraMens.Max := QryDestino.RecordCount;

         // Capta o IDForCli
         FornecedorCli(QryDestinoIDCUSTODIANTE.AsInteger,
                       QryDestinoIDINVESTIMENTO.AsInteger, wIdForCli);

         // Gera numero de Boleta
         wNumDoc := 'RV-' + Copy(dbeCancelamento.Text,9,2) + '/' +
                                  FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                                                      Copy(dbeCancelamento.Text,9,2)));
         qryBoleta.Insert;
         qryBoletaIDBOLETA.AsString     := wNumDoc;
         qryBoletaSTATUS.AsString       := 'F';
         qryBoletaDATABOLETA.AsDateTime := StrToDate(dbeCancelamento.Text);
         qryBoletaTIPMOVBOLETA.AsString := 'CSA';
         qryBoletaIDFORCLI.AsInteger    := wIdForCli;
         qryBoletaEXCLUIBOLETA.AsString := 'N';
         qryBoleta.Post;

              while not QryDestino.EOF do
              begin

                  if not qryBoleta.Locate('IDBOLETA', wNumDoc, []) then
                     Raise Exception.Create('Não foi possível localizar a boleta ' + wNumDoc);

                  // Gera Novo Id de Operacao
                  wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

                  if qryTipoOperCancDIDTIPOOPERACAO.IsNull then
                     Raise Exception.Create('Tipo de Operação não encontrado.');

                  //wPuProporcinal := OperComum.DivValorZero(QryDestinoVLRLIQUIDO.AsFloat,QryDestinoQTDEDIREITO.AsFloat);

                  qryCancelamento.Insert;
                  qryCancelamentoIDOPERACAOINVEST.AsInteger    := wIdNovaOperacao;
                  //AL_7
                  qryCancelamentoIDOPERACAOORIGEM.AsInteger    := QryDestinoIDOPERACAOINVEST.AsInteger;
                  qryCancelamentoMOECODIGO.AsInteger           := pRPI.MOECODIGO;
                  qryCancelamentoIDMODULO.AsInteger            := Sistema.IdModulo;
                  qryCancelamentoEMPRESAPROP.AsInteger         := Sistema.IdEmpresa;
                  qryCancelamentoIDINVESTIMENTO.AsInteger      := QryDestinoIDINVESTIMENTO.AsInteger;
                  qryCancelamentoDESCINVESTIMENTO.AsString     := QryDestinoDESCINVESTIMENTO.AsString;
                  qryCancelamentoIDCARTEIRA.AsString           := QryDestinoIDCARTEIRA.AsString;
                  qryCancelamentoIDCARTEIRAINVEST.AsInteger    := QryDestinoIDCARTEIRAINVEST.AsInteger;
                  if not QryDestinoIDCARTEIRAGERENC.IsNull then
                     qryCancelamentoIDCARTEIRAGERENC.AsInteger := QryDestinoIDCARTEIRAGERENC.AsInteger
                  else
                     qryCancelamentoIDCARTEIRAGERENC.Clear;
                  qryCancelamentoDESCCARTINVEST.AsString       := QryDestinoDESCCARTINVEST.AsString;
                  qryCancelamentoIDTIPOINVEST.AsInteger        := 2;
                  qryCancelamentoIDTIPOOPERACAO.AsInteger      := qryTipoOperCancDIDTIPOOPERACAO.AsInteger;
                  qryCancelamentoDESCTIPOOPERACAO.AsString     := qryTipoOperCancDDESCTIPOOPERACAO.AsString;
                  qryCancelamentoNATUREZAOPERACAO.AsString     := qryTipoOperCancDNATUREZAOPERACAO.AsString;
                  qryCancelamentoIDFORCLI.AsInteger            := wIdForCli;
                  if not QryDestinoIDLOTE.IsNull then
                     qryCancelamentoIDLOTE.AsString            := QryDestinoIDLOTE.AsString
                  else
                     qryCancelamentoIDLOTE.Clear;
                  if not QryDestinoIDCUSTODIANTE.IsNull then
                     qryCancelamentoIDCUSTODIANTE.AsInteger    := QryDestinoIDCUSTODIANTE.AsInteger
                  else
                     qryCancelamentoIDCUSTODIANTE.Clear;
                  if not QryDestinoSGLCUSTODIANTE.IsNull then
                     qryCancelamentoSGLCUSTODIANTE.AsString    := QryDestinoSGLCUSTODIANTE.AsString
                  else
                     qryCancelamentoSGLCUSTODIANTE.Clear;
                  qryCancelamentoIDOPERACAODIREITO.AsInteger   := qryIDOPERACAODIREITO.AsInteger;
                  //AL_7
                  qryCancelamentoIDPLANPREVCTBPATR.AsInteger   := qryDestinoIDPLANPREVCTBPATR.AsInteger;
                  qryCancelamentoPLANPRVCONTABPATRO.AsString   := qryDestinoPLANPRVCONTABPATRO.AsString;
                  qryCancelamentoDATAOPERACAO.AsDateTime       := StrToDate(dbeCancelamento.Text);
                  qryCancelamentoDATAVENCOPER.AsDateTime       := CalcVenc(StrToDate(dbeCancelamento.Text), qryTipoOperCancDVENCIMENTO.AsInteger);
                  qryCancelamentoDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
                  qryCancelamentoNUMDOCUMENTO.AsString         := wNumDoc;
                  qryCancelamentoFLGSTATUSFECHBOL.AsString     := 'F';
                  qryCancelamentoFLGSTATUSORDMOV.AsString      := 'L';
                  qryCancelamentoQTDEOPERACAO.AsFloat          := qryDestinoQTDEOPERACAO.AsFloat;
                  qryCancelamentoPRECOUNITOPERACAO.AsFloat     := qryDestinoPRECOUNITOPERACAO.AsFloat;
                  qryCancelamentoVLROPERACAO.AsFloat           := qryDestinoVLROPERACAO.AsFloat;
                  qryCancelamentoVLRIR.AsFloat                 := qryDestinoVLRREMUNERACAO.AsFloat;
                  qryCancelamentoVLRREMUNERACAO.AsFloat        := qryDestinoVLRREMUNERACAO.AsFloat;
                  qryCancelamentoVLRIRREMUNER.AsFloat          := qryDestinoVLRIRREMUNER.AsFloat;
                  qryCancelamentoVLRLIQUIDO.AsFloat            := qryDestinoVLRLIQUIDO.AsFloat;
                  qryCancelamentoPERCENTUAL.AsFloat            := qryPERCENTUAL.AsFloat;
                  qryCancelamentoORIGDEST.AsString             := 'D';
                  if not QryDestinoIDMOTIVOBLOQUEIO.IsNull then
                     qryCancelamentoIDMOTIVOBLOQUEIO.AsInteger := QryDestinoIDMOTIVOBLOQUEIO.AsInteger
                  else
                     qryCancelamentoIDMOTIVOBLOQUEIO.Clear;
                  if not QryDestinoSIGLAMOTBLOQ.IsNull then
                     qryCancelamentoSIGLAMOTBLOQ.AsString      := QryDestinoSIGLAMOTBLOQ.AsString
                  else
                     qryCancelamentoSIGLAMOTBLOQ.Clear;
                  qryCancelamentoIDOPERCUSTODIA.Clear;
                  qryCancelamentoALTERADO.AsString        := 'S';

                  qryCancelamentoVLRCUSTOATUAL.AsFloat    := qryDestinoVLRCUSTOATUAL.AsFloat;

                  qryCancelamentoVLRVARIACAOATUAL.AsFloat := qryDestinoVLRVARIACAOATUAL.AsFloat;

                  qryCancelamentoVLROPERACAO.AsFloat      := qryDestinoVLROPERACAO.AsFloat;//qryCancelamentoVLRCUSTOATUAL.AsFloat + qryCancelamentoVLRVARIACAOATUAL.AsFloat;
                  qryCancelamento.Post;

               // Contabiliza Origem no OK da AGE
               QryDestino.Next;
            end;
            fraMens.Incrementa;
         Result := True;
      except
         on E: Exception do
         begin
            MsgDlg('Houve um problema na geração das Operações de Cancelamento do Destino desta AGE' + #13+
                   E.Message,'Mensagem do Sistema ', mtWarning, [mbOK], 0);
            bbtnCancelarDet.Click;
            bbtnCancelar.Click;
            Result := False;
         end;
      end;
   finally
      qryOrigem.EnableControls;
      qryDestino.EnableControls;
      qryCancelamento.EnableControls;
      fraMens.Apaga;
      CmeDetalhe.AtualizaBotoes(Self);
      sbtnConsDet.Enabled := not (qryCancelamento.IsEmpty);
   end;
end;

//AL_1
procedure TfrmCadSubscricaoComAcoes.dblCarteiraCancExit(Sender: TObject);
begin
  inherited;
  // Para Carteiras Próprias, o defaul é saldo liberado
  if Trim(dblMotivoBloqueioCanc.Text) = '' then
  begin
     if (qryCarteiraCancIDCARTEIRAGERENC.IsNull) and (qryCancelamento.State = dsInsert) then
        qryCancelamentoIDMOTIVOBLOQUEIO.AsInteger := -1;
  end;
  if Trim(dblCarteiraCanc.Text) <> '' then
  begin
     qryCancelamentoIDCARTEIRAINVEST.AsInteger := qryCarteiraCancIDCARTEIRAINVEST.AsInteger;
     if not qryCarteiraCancIDCARTEIRAGERENC.IsNull then
        qryCancelamentoIDCARTEIRAGERENC.AsInteger := qryCarteiraCancIDCARTEIRAGERENC.AsInteger
     else
        qryCancelamentoIDCARTEIRAGERENC.Clear;
  end;
end;

end.
