//******************************************************************************
// Data      : 13/09/2007
// Código    : AL_13
// Pendencia : 26354
// SOL       : 69077
// Desc      : Implementação para permitir lançar mais de um grupamento para o mesmo
//             emissor, mas com investimento distinto(QryBuscaOperDireito).
//******************************************************************************
// Data      : 04/09/2007
// Código    : AL_12
// Pendencia : 26269
// SOL       : 68079
// Desc      : Implementação do tratamento de conta CC e CCI, para montar o histórico
//             corretamente
//******************************************************************************
// Data      : 19/07/2007
// Código    : AL_11
// Pendencia : 25194
// SOL       : 53035
// Desc      : Implementação de critica para NÃO gerar o recebimento para
//              Carteiras Gerenciais conforme parametrização
//******************************************************************************
// Data      : 01/06/2007
// Código    : AL_10
// Pendencia : 24388
// SOL       : 53035
// Desc      : Acerto na filtragem das Carteiras para não trazer Carteiras Gerenciais
//             quando Parâmetro de integração com Carteira Gerencial estiver desmarcado.
//             (QrySaldoOrigem, qryOrigem, qryDestino, qryCarteiraRec e qryCarteiraOrig)
//******************************************************************************
// Data      : 13/02/2007
// Código    : AL_9
// Pendencia : 24464
// Desc      : Passa a não gravar o ID do HistCartInv nas OperCustodia
//             Obs. No reprocessamento já não gravava.
//******************************************************************************
// Data      : 06/11/2006
// Código    : AL_8
// Pendencia : 22973
// Desc      : Segregação de Planos
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_7
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_6
// Desc     : Retirada do Saldo CCI de Custódia da BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_5
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_4
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//*****************************************************************************
//Data	    : 06/03/2006
//Código    : Al_3
//Motivo(S) : Implementação da trava de fechamento de renda variavel
//******************************************************************************
// Data     : 11/01/2006
// Codigo   : AL_2
// Descrição: Ajuste para retirar o cartesiano nas queries com carteira gerencial
//******************************************************************************
// Data     : 05/09/2005
// Codigo   : AL_1
// Descrição: Ajuste na rotina de alteração de Investimentos
//******************************************************************************
// Função   : Efetuar o lançamento de operações de Grupamento
//
// Operações: ---------------------------------------------------------------------
//            * Origem
//              Não afeta o saldo
//            * Destino
//              Diminui o saldo de quantidade
//********************************************************************************************************
unit FCadGrupamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMDetCSInv, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  fcLabel, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, DBCtrls, FCadastroRMDetCSInv, Mask,
  FCadMestreDetCSInv, faMensagem, dxCntner, dxEditor, dxExEdtr, dxEdLib,
  dxDBELib, uCtrlInvContab, uCtrlRendaVariavel, uCtrlPadroes;

type
  TfrmCadGrupamento = class(TfrmCadMestreDetalheCSInv)
    Label3: TLabel;
    dblEmissor: TwwDBLookupCombo;
    Label4: TLabel;
    dbdAGE: TCMDateTimePicker;
    Label5: TLabel;
    dbdEX: TCMDateTimePicker;
    Label16: TLabel;
    dbdOper: TCMDateTimePicker;
    Label6: TLabel;
    dbdCOM: TCMDateTimePicker;
    dbmObservacao: TDBMemo;
    Label14: TLabel;
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
    dblTipoOperacao: TwwDBLookupCombo;
    Label28: TLabel;
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
    qryInvestimentoAcaoQTDTITLOTE: TFloatField;
    dbeParidade: TDBRealEdit;
    lblProporcao: TLabel;
    QrySaldoOrigemPLANPRVCONTABPATRO: TStringField;
    qryDestinoPLANPRVCONTABPATRO: TStringField;
    qryOrigemPLANPRVCONTABPATRO: TStringField;
    qryPlanPrevOrig: TwwQuery;
    qryPlanPrevOrigIDPLANPREVCTBPATR: TFloatField;
    qryPlanPrevOrigIDPLANOPREV: TFloatField;
    qryPlanPrevOrigIDPATRO: TFloatField;
    qryPlanPrevOrigPLANPRVCONTABPATRO: TStringField;
    qryPlanPrevRec: TwwQuery;
    qryPlanPrevRecIDPLANPREVCTBPATR: TFloatField;
    qryPlanPrevRecIDPLANOPREV: TFloatField;
    qryPlanPrevRecIDPATRO: TFloatField;
    qryPlanPrevRecPLANPRVCONTABPATRO: TStringField;
    Label48: TLabel;
    dblPlanPatroRec: TwwDBLookupCombo;
    Label8: TLabel;
    dblPlanPatroProv: TwwDBLookupCombo;
    QrySaldoOrigemIDPLANPREVCTBPATR: TFloatField;
    //AL_12
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
    procedure dblTipoOperacaoExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure dsOrigemStateChange(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
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
  private
    { Private declarations }
    //AL_8
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
    // AL_3 - Se a rotina se tornar neccessária, aí sim incluíla no código
    function  TestaOperacaoExitente: Boolean;
    function  GeraOrigem : Boolean;
    function  GeraDestino: Boolean;
    function  BuscaBoleta(dData: TDateTime; wIDForCli: Integer): String;
    function  CalcVenc(dDataOper: TDateTime; iPrazo: Integer): TDateTime;
    function  AchaOrigem(iPlanPrev, iTipoOper, iCartInvest, iCartGerenc, iCustodiante, iMotBloq: Integer): Boolean;
  public
    { Public declarations }
  end;

var
  frmCadGrupamento: TfrmCadGrupamento;
  wSdoQtdCPMF, wSaldoQtd, wSaldoVlr, wSaldoIRApu, wSaldoInutil, wSaldoAqui,
  wQtdOperAnt : Double;
  wOrigem, wDestino: Boolean;

implementation

uses UOperComum, uMensErro, DBaseDados, UDataBase, uDocumento, uSistema,
     UBibliotecaInvest, UImpostos, UDiasUteisInv, URendaVariavel,
     dRendaVariavel, UCotaComum, UProvisaoComum, ULancContab, UCaixaComum,
     URendaFixa, UOperacaoInvest;

{$R *.DFM}

procedure TfrmCadGrupamento.Sel(iOper: Integer;
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
   if Trim(dblEmissor.Text) <> '' then
      QryInvestimentoAcao.ParamByName('IDEMISSOR').AsInteger := qryIDEMISSOR.AsInteger;
   QryInvestimentoAcao.ParamByName('DATACOTACAO').AsString := qryDATAEX.AsString;
   QryInvestimentoAcao.Open;

   if bSelInv then
      SelDetInv(iOper);
   SelDetOrig(iOper);
   SelDetDest(iOper);
   // Habilita componentes do Cadastro Pai
   dblEmissor.Enabled := True;
   dblTipoOperacao.Enabled := True;
   dbeParidade.Enabled := True;
   dbdAGE.Enabled := True;
   dbdEX.Enabled := True;
   dbdOper.Enabled := True;
   dbdCOM.Enabled := True;

end;

procedure TfrmCadGrupamento.SelDetInv(iOper: Integer);
begin
    OperComum.LimpaParametros(qryDetalhe);
    qryDetalhe.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryDetalhe.Open
end;

procedure TfrmCadGrupamento.SelDetOrig(iOper: Integer);
begin
    //AL_11
    OperComum.LimpaParametros(qryCarteiraOrig);
    qryCarteiraOrig.ParamByName('DATALIMGER').AsString  := qryDATAEX.AsString;
    qryCarteiraOrig.Open;
    //AL_10
    OperComum.LimpaParametros(qryOrigem);
    qryOrigem.ParamByName('DATAEX').AsString  := qryDATAEX.AsString;
    qryOrigem.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryOrigem.Open
end;

procedure TfrmCadGrupamento.SelDetDest(iOper: Integer);
begin
    //AL_11
    OperComum.LimpaParametros(qryCarteiraRec);
    qryCarteiraRec.ParamByName('DATALIMGER').AsString  := qryDATAOPER.AsString;
    qryCarteiraRec.Open;
    //AL_10
    OperComum.LimpaParametros(qryDestino);
    qryDestino.ParamByName('DATAEX').AsString  := qryDATAEX.AsString;    
    qryDestino.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryDestino.Open
end;

procedure TfrmCadGrupamento.HabDetOrig(bAcao:Boolean);
begin
   dbeBoletaProv.Enabled := bAcao;
   //AL_8
   dblPlanPatroProv.Enabled := bAcao;
   dblTipoOperProv.Enabled := bAcao;
   dblCarteiraProvisao.Enabled := bAcao;
   dblCustodianteProv.Enabled := bAcao;
   dblMotivoBloqueioProv.Enabled := bAcao;
end;

procedure TfrmCadGrupamento.HabDetDest(bAcao:Boolean);
begin
   dbeBoletaRec.Enabled := bAcao;
   //AL_8
   dblPlanPatroRec.Enabled := bAcao;
   dblTipoOperRec.Enabled := bAcao;
   dblCarteiraRec.Enabled := bAcao;
   dblCustodianteRec.Enabled := bAcao;
   dblMotivoBloqueioRec.Enabled := bAcao;
end;

procedure TfrmCadGrupamento.FormShow(Sender: TObject);
begin
   inherited;
   //AL_8
   if Trunc((fraMens.Width / 3) * 2) > 350 then
      fraMens.pnlProgressoMensagem.Width := Trunc((fraMens.Width / 3) * 2)
   else
   begin
      if fraMens.Width <= 350 then
         fraMens.pnlProgressoMensagem.Width := fraMens.Width - 70
      else
         fraMens.pnlProgressoMensagem.Width := 340;
   end;
   qryPlanPrevOrig.Open;
   qryPlanPrevRec.Open;
   qryTipoOperacao.Open;
   QryEmissor.Open;
   qryTipoDireito.Open;
   Sel(-1);
   pgctrlDetalhe.ActivePage := tbsDet;
end;

procedure TfrmCadGrupamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   //AL_8
   FreeAndNil(CtrlRV);
   qryPlanPrevOrig.Close;
   qryPlanPrevRec.Close;
   qryTipoOperacao.Close;
   QryEmissor.Close;
   qryTipoDireito.Close;
   QryInvestimentoAcao.Close;
end;

procedure TfrmCadGrupamento.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   // AL_3 - Controle de travamento
   if qry.State = dsInsert then
   begin
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      qryIDOPERACAODIREITO.AsInteger := LeUltRegistro(nil,'OPERACAODIREITO');
      qryPARIDADE.AsFloat            := 1;
      qryPERCENTUAL.AsFloat          := 100;
      qryFLGTIPODIREITO.AsString     := 'P';
      Sel(qryIDOPERACAODIREITO.AsInteger, False);
      //AL_9
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

procedure TfrmCadGrupamento.CmeDetalheInsert(Sender: TObject);
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

procedure TfrmCadGrupamento.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

function TfrmCadGrupamento.TestaOperacaoExitente: Boolean;
begin
   try
      QryBuscaOperDireito.Close;
      QryBuscaOperDireito.ParamByName('P_IDEMISSOR').AsInteger      := QryIDEMISSOR.AsInteger;
      QryBuscaOperDireito.ParamByName('P_DATAEX').AsString          := QryDATAEX.AsString;
      QryBuscaOperDireito.ParamByName('P_DATAAGE').AsString         := QryDATAAGE.AsString;
      QryBuscaOperDireito.ParamByName('P_DATACOM').AsString         := QryDATACOM.AsString;
      QryBuscaOperDireito.ParamByName('P_IDTIPOOPERACAO').AsInteger := QryIDTIPOOPERACAO.AsInteger;
      QryBuscaOperDireito.Open;
      if QryBuscaOperDireito.IsEmpty then
         Result := False
      else
      //AL_13
      begin
         if qryDetalhe.Locate('IDINVESTIMENTO', QryBuscaOperDireito.FieldByName('IDINVESTIMENTO').AsInteger,[]) then
            Result := True
         else
            Result := False;
      end;
   finally
      QryBuscaOperDireito.Close;
   end;
end;

procedure TfrmCadGrupamento.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
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
   if dbeParidade.Value = 0 then
   begin
      Accept := False;
      MsgDlg('Não foi informado uma Paridade para esta AGE,'+#13+
             'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbeParidade.CanFocus then
         dbeParidade.SetFocus;
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

procedure TfrmCadGrupamento.bbtnOkDetClick(Sender: TObject);
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
procedure TfrmCadGrupamento.FornecedorCli(wIdCustodiante, iInvestimento  : Integer;
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

procedure TfrmCadGrupamento.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   // AL_3 - Controle de travamento
   if qry.State = dsEdit then
   begin
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      if dblTipoOperacao.CanFocus then
         dblTipoOperacao.SetFocus;
   end;
end;

procedure TfrmCadGrupamento.sbtnExcluiDetClick(Sender: TObject);
var sBol: String;
    iResp: Integer;
begin
   //AL_7
   Try
   if pgctrlDetalhe.ActivePage = tbsDet then
   begin
      if MsgDlg('Exclui o Investimento e as Operações de Origem e Destino?','Mensagem do Sistema',mtConfirmation,[mbYes, mbNo],0) = mrYes then
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
   except
      on E: Exception do
      begin
         MsgDlg(E.Message, 'Mensagem do Sistema ',mtWarning,[mbOK],0);
      end;
   end;
end;

procedure TfrmCadGrupamento.dblTipoOperacaoExit(Sender: TObject);
begin
   inherited;
   if qryTipoOperacaoFLGPARIDADE.AsString = 'S' then
   begin
      dbeParidade.Visible  := True;
      lblProporcao.Visible := True;
   end
   else
   begin
      if frmCadGrupamento.ActiveControl = dbeParidade then
      begin
         if dbmObservacao.CanFocus then
            dbmObservacao.SetFocus;
      end;
      dbeParidade.Visible  := False;
      lblProporcao.Visible := False;
   end;
end;

procedure TfrmCadGrupamento.bbtnConfirmarClick(Sender: TObject);
var bCriaLancto, bConfirma, bAltOrig, bAltDest, bReproc: Boolean;
    wTipoRecDesBol, wMensErro, sTipoCustodia: String;
    wPlano, wPlanilha, wDocumCont, wIdOperCust, iIdHistCustodia: Integer;
begin
   // Caso não confirmar, não pode fazer o finally
   CmeCadastroBeforeConfirma(Self, bConfirma);
   if not bConfirma then
      Exit;

   //AL_7
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

         fraMens.Mostra;
         fraMens.Mes := 'Atualizando Histórico das Carteiras';
         qryHistCartInv.ApplyUpdates;
         fraMens.Mes := 'Atualizando AGE';
         qry.ApplyUpdates;
         fraMens.Mes := 'Atualizando Investimentos para a AGE';
         qryDetalhe.ApplyUpdates;
         fraMens.Mes := 'Atualizando operações de Anúncio';
         qryOrigem.ApplyUpdates;
         fraMens.Mes := 'Atualizando Operações de Recebimento';
         qryDestino.ApplyUpdates;

         // Zera o Buffer de memória do CachedUpdates
         qry.CommitUpdates;
         qryDetalhe.CommitUpdates;
         qryOrigem.CommitUpdates;
         qryDestino.CommitUpdates;
         qryHistCartInv.CommitUpdates;

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
               bReproc := True;
            end;
            qryDestino.Next;
            fraMens.Incrementa;
         end;

         qryBoleta.ApplyUpdates;
         qryBoleta.CommitUpdates;

         // Lança os Destinos
         fraMens.Mostra;
         fraMens.Max := qryDestino.RecordCount;
         qryDestino.First;
         while not qryDestino.Eof do
         begin
            // Se não achar o histórico, relança
            if not qryHistCartInv.Locate('IDOPERACAOINVEST', qryDestinoIDOPERACAOINVEST.AsInteger, []) then
            begin
               //AL_8
               fraMens.Mes := 'Lançando Históricos de ' + FormatFloat('###,###,###,##0', qryDestinoQTDEOPERACAO.AsFloat) + #13 +
                              'Carteira: ' + qryDestinoDESCCARTINVEST.AsString;

               //AL_8
               if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                                 qryDestinoIDINVESTIMENTO.AsInteger, 2,
                                                 qryDestinoIDOPERACAOINVEST.AsInteger, -1,
                                                 qryDestinoIDTIPOOPERACAO.AsInteger,
                                                 qryDestinoIDCARTEIRAINVEST.AsInteger,
                                                 qryDestinoIDCARTEIRAGERENC.AsInteger,
                                                 -1, -1, -1, -1, -1,
                                                 qryDestinoDATAOPERACAO.AsDateTime,
                                                 0 {wVlrOperacao},
                                                 qryDestinoQTDEOPERACAO.AsFloat,
                                                 pRPI.VLRCOTAINICART,
                                                 0 {Variacao}, 0{Juros},
                                                 0 {wVlrIRProv} {Verificar se vai calcular o saldo},
                                                 0, 0, 0, 0, 0, 0,
                                                 qryDestinoNATUREZAOPERACAO.AsString {Movimento},
                                                 'N' {Operacao},
                                                 qryDestinoIDLOTE.AsString,
                                                 Trim(qryDestinoDESCTIPOOPERACAO.AsString) + ' / ' +
                                                      Trim(qryDestinoDESCINVESTIMENTO.AsString),
                                                 'OPE', '1', '', True, -1,
                                                 qryDestinoIDPLANPREVCTBPATR.AsInteger, iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível inserir os Históricos das Operações de Destino.');

               if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                  Raise Exception.Create('Não foi possivel atualizar os saldos desta Carteira/Investimento');

               //AL_12   
               OperComum.LimpaParametros(DMRendaVariavel.QryBuscaHistCPMF);
               DMRendaVariavel.QryBuscaHistCPMF.ParamByName('IDHISTCARTINV').AsInteger := iIdHistCartInv;
               DMRendaVariavel.QryBuscaHistCPMF.Open;
               if Not DMRendaVariavel.QryBuscaHistCPMF.IsEmpty Then
               begin
                  OperComum.LimpaParametros(DMRendaVariavel.QryUpdHistCPMF);
                  if qryDestinoFLGCONTAINVEST.AsInteger = 1 then
                     DMRendaVariavel.QryUpdHistCPMF.ParamByName('SALDOQTDECPMF').AsFloat :=
                                     DMRendaVariavel.QryBuscaHistCPMF.FieldByName('SALDOQTDECPMF').AsFloat
                  else
                     DMRendaVariavel.QryUpdHistCPMF.ParamByName('SALDOQTDECPMF').AsFloat := qryDestinoQTDEOPERACAO.AsFloat;

                  DMRendaVariavel.QryUpdHistCPMF.ParamByName('IDHISTCARTINV').AsInteger   := iIdHistCartInv;
                  DMRendaVariavel.QryUpdHistCPMF.ExecSql;
                  OperComum.LimpaParametros(DMRendaVariavel.QryUpdHistCPMF);
               end;
               OperComum.LimpaParametros(DMRendaVariavel.QryBuscaHistCPMF);

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
                  //AL_8
                  fraMens.Mes := 'Lançando Custodia de ' + FormatFloat('###,###,###,##0', qryDestinoQTDEOPERACAO.AsFloat) + #13 +
                                 'Carteira: ' + qryDestinoDESCCARTINVEST.AsString;

                  // Relança a Custódia
                  wIdOperCust := LeUltRegistro(Nil,'OPERCUSTODIA');

                  //AL_8
                  //AL_9
                  if not OperacaoInvest.AlimentaOperCustodia(
                                                wIdOperCust, -1, -1,
                                                -1{Origem}, -1 {iIdHistCartInv} {Destino},
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

                  sTipoCustodia := 'I'; //Inicialização

                  //AL_8
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
                  fraMens.Mes := 'Contabilizando a operação ' + #13 +
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

                     //AL_8
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
                                                qryDestinoVLRLIQUIDO.AsCurrency {Financeiro},
                                                qryDestinoVLROPERACAO.AsFloat {fVlrDif {Contábil},
                                                qryDestinoDATAOPERACAO.AsDateTime,
                                                qryDestinoDATAVENCOPER.AsDateTime,
                                                wPlano, wPlanilha, wDocumCont, wMensErro,
                                                ' '{sCapCar}, False, True, 0, True,
                                                qryDestinoIDPLANPREVCTBPATR.AsInteger) <> 0 then
                        Raise Exception.Create('Não foi possível contabilizar uma Operação de Destino');

                     // Atualiza a Boleta com Planilha e Documento
                     if (wPlanilha > 0) or (wDocumCont > 0) then
                     begin
                        OperComum.LimpaParametros(DMRendaVariavel.qryUpdBoleta);
                        DMRendaVariavel.qryUpdBoleta.ParamByName('STATUS').AsString := 'F';
                        DMRendaVariavel.qryUpdBoleta.ParamByName('PLANO').AsInteger := wPlano;
                        if wPlanilha > 0 then
                           DMRendaVariavel.qryUpdBoleta.ParamByName('PLNCODIGO').AsInteger := wPlanilha;
                        if wDocumCont > 0 then
                           DMRendaVariavel.qryUpdBoleta.ParamByName('CODDOCUMENTO').AsInteger := wDocumCont;
                        DMRendaVariavel.qryUpdBoleta.ExecSQL;
                     end;
                  end
                  else
                    Raise Exception.Create('Não foi possível localizar a Boleta das Operações de Destino');

                  if (bReproc) and (qryDATAOPER.AsDateTime <= pRPI.DATAULTFECH) then
                     //AL_8
                     RendaVariavel.MarcarFlagReproc(qryDestinoIDINVESTIMENTO.AsInteger, -1,
                                                    qryDestinoIDPLANPREVCTBPATR.AsInteger, qryDATAOPER.AsDateTime);
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
      CmeDetalhe.AtualizaBotoes(Self);
      CmeCadastro.AtualizaBotoes(Self);
   end;
end;

procedure TfrmCadGrupamento.FormResize(Sender: TObject);
begin
  inherited;
  if Trunc((fraMens.Width / 3) * 2) > 350 then
     fraMens.pnlProgressoMensagem.Width := Trunc((fraMens.Width / 3) * 2)
  else
  begin
     if fraMens.Width <= 380 then
        fraMens.pnlProgressoMensagem.Width := fraMens.Width - 70
     else
        fraMens.pnlProgressoMensagem.Width := 370;
  end;
end;

procedure TfrmCadGrupamento.CalculaVlrLiq(Origem: String = 'O');
var
  // AL_3
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


procedure TfrmCadGrupamento.dsOrigemStateChange(Sender: TObject);
begin
   inherited;
   HabDetOrig((qryOrigem.State = dsInsert));
   dbrQtdProv.Enabled    := (qryOrigem.State in [dsInsert, dsEdit]);
end;

procedure TfrmCadGrupamento.CmeDetalheConfirma(Sender: TObject);
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
            //AL_8
            qryOrigemPLANPRVCONTABPATRO.AsString   := qryPlanPrevOrigPLANPRVCONTABPATRO.AsString;
            qryOrigemDATAOPERACAO.AsDateTime       := qryDATAOPER.AsDateTime;
            qryOrigemDATAVENCOPER.AsDateTime       := CalcVenc(qryDATAOPER.AsDateTime, qryTipoOperOrigVENCIMENTO.AsInteger);
            qryOrigemDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
            if qryOrigemNUMDOCUMENTO.IsNull then
               qryOrigemNUMDOCUMENTO.AsString      := BuscaBoleta(qryDATAOPER.AsDateTime, wIdForCli);
            qryOrigemFLGSTATUSFECHBOL.AsString     := 'F';
            qryOrigemFLGSTATUSORDMOV.AsString      := 'L';
            qryOrigemPRECOUNITOPERACAO.AsFloat     := 0;
            //AL_8
            qryOrigemVLROPERACAO.AsFloat           := 0;
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
            //AL_8
            qryOrigemPLANPRVCONTABPATRO.AsString    := qryPlanPrevRecPLANPRVCONTABPATRO.AsString;
            qryDestinoDATAVENCOPER.AsDateTime       := CalcVenc(dbdDataOperacaoRec.DateTime, qryTipoOperRecVENCIMENTO.AsInteger);
            qryDestinoDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
            if qryDestinoNUMDOCUMENTO.IsNull then
               qryDestinoNUMDOCUMENTO.AsString      := BuscaBoleta(dbdDataOperacaoRec.DateTime, wIdForCli);
            qryDestinoFLGSTATUSFECHBOL.AsString     := 'F';
            qryDestinoFLGSTATUSORDMOV.AsString      := 'L';
            qryDestinoPRECOUNITOPERACAO.AsFloat     := 0;
            //AL_8
            qryDestinoVLROPERACAO.AsFloat           := 0;
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

procedure TfrmCadGrupamento.tbcDetalheChange(Sender: TObject);
begin
   inherited;
   bbtnGeraOperacoes.Visible := (pgctrlDetalhe.ActivePage <> tbsDet);
   bbtnGeraOperacoes.Hint := OperComum.IIF(pgctrlDetalhe.ActivePage = tbsOrigem, 'Gera Origem', 'Gera Destino');

   if pgctrlDetalhe.ActivePage = tbsOrigem then
      bbtnGeraOperacoes.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty))
   else if pgctrlDetalhe.ActivePage = tbsDestino then
      bbtnGeraOperacoes.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty) and
                                      (not qryOrigem.IsEmpty));
end;

function TfrmCadGrupamento.GeraOrigem: Boolean;
var wQtdOper, wVlrOperacao,
    wPuProporcinal, wPUMedio: Double;
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

         //Ricardo Cristiano - 31/05/2011 - N. Sol 158890 -  N. Kintana 1297373 
//         QrySaldoOrigem.ParamByName('DATAAGE').AsString := qryDATAAGE.AsString;  
         QrySaldoOrigem.ParamByName('DATAAGE').AsString := qryDATAEX.AsString;
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
         qryBoletaTIPMOVBOLETA.AsString := 'DTG';
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

            //AL_8 - Ini
            CtrlRV.BuscaSaldoRV.Executa(qryDATAEX.AsDateTime,
                                        QrySaldoOrigem.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                        QrySaldoOrigem.FieldByName('IDINVESTIMENTO').AsInteger,
                                        QrySaldoOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                        QrySaldoOrigem.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                        High(Integer),
                                        QrySaldoOrigem.FieldByName('IDCUSTODIANTE').AsInteger,
                                        QrySaldoOrigem.FieldByName('IDLOTE').AsString);


            wSaldoQtd    := CtrlRV.BuscaSaldoRV.SaldoQtdTotal;
            wSaldoVlr    := CtrlRV.BuscaSaldoRV.SaldoVlrTotal;
            wSaldoNormal := CtrlRV.BuscaSaldoRV.SaldoQtdCC;
            wSaldoCCI    := CtrlRV.BuscaSaldoRV.SaldoQtdCCI;
            wPUMedio     := OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoVlrTotal, CtrlRV.BuscaSaldoRV.SaldoQtdTotal);
            wSaldoAqui   := CtrlRV.BuscaSaldoRV.SaldoCusto;
            wSaldoIRApu  := CtrlRV.BuscaSaldoRV.SaldoIRApurado;

            QrySaldoOrigemVALOREXERCIDO.AsFloat := OperComum.DivValorZero(QrySaldoOrigemQTDEDIREITO.AsFloat,
                                                                          QrySaldoOrigemQTDTITLOTE.AsInteger)*
                                                                          wPUMedio;
            QrySaldoOrigemVLRLIQ.AsFloat := QrySaldoOrigemVALOREXERCIDO.AsFloat;
            QrySaldoOrigemIR.AsFloat     := 0;
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
                  //AL_8
                  qryOrigemIDPLANPREVCTBPATR.AsInteger   := QrySaldoOrigemIDPLANPREVCTBPATR.AsInteger;
                  qryOrigemPLANPRVCONTABPATRO.AsString   := QrySaldoOrigemPLANPRVCONTABPATRO.AsString;

                  qryOrigemDATAOPERACAO.AsDateTime       := qryDATAOPER.AsDateTime;
                  qryOrigemDATAVENCOPER.AsDateTime       := CalcVenc(qryDATAOPER.AsDateTime, qryTipoOperOrigVENCIMENTO.AsInteger);
                  qryOrigemDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
                  qryOrigemNUMDOCUMENTO.AsString         := wNumDoc;
                  qryOrigemFLGSTATUSFECHBOL.AsString     := 'F';
                  qryOrigemFLGSTATUSORDMOV.AsString      := 'L';
                  qryOrigemQTDEOPERACAO.AsFloat          := wQtdOper;
                  //AL_8
                  qryOrigemPRECOUNITOPERACAO.AsFloat     := wPuProporcinal;
                  qryOrigemVLROPERACAO.AsFloat           := wVlrOperacao;
                  qryOrigemVLRIR.AsFloat                 := QrySaldoOrigemIR.AsFloat;
                  qryOrigemVLRREMUNERACAO.AsFloat        := QrySaldoOrigemVLRREMUNERACAO.AsFloat;
                  qryOrigemVLRIRREMUNER.AsFloat          := QrySaldoOrigemVLRIRREMUNERACAO.AsFloat;
                  qryOrigemVLRLIQUIDO.AsFloat            := wVlrOperacao;
                  qryOrigemPERCENTUAL.AsFloat            := 0;
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
                  qryOrigemALTERADO.AsString := 'S';
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

function TfrmCadGrupamento.GeraDestino: Boolean;
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
         qryBoletaTIPMOVBOLETA.AsString := 'DTG';
         qryBoletaIDFORCLI.AsInteger    := wIdForCli;
         qryBoletaEXCLUIBOLETA.AsString := 'N';
         qryBoleta.Post;

         while not qryOrigem.Eof do
         begin
            fraMens.Mes := 'Processando: ' + qryOrigemDESCCARTINVEST.AsString +  #13 +
                           OperComum.IIF(qryOrigemSGLCUSTODIANTE.IsNull, '', ' Custodia: ' + qryOrigemSGLCUSTODIANTE.AsString) +
                           OperComum.IIF(qryOrigemSIGLAMOTBLOQ.IsNull, '', ' Bloqueio: ' + qryOrigemSIGLAMOTBLOQ.AsString);
            //AL_11
            //Caso o parametro de carteria gerencial for N (Não) ou estiver Nulo e a data da operação for
            // maior que a data de encerramento da carteria gerencial, NÃO gera o recebimento
            if (((pRPI.FLGCARTGERENC = 'N') or (pRPI.FLGCARTGERENC = '')) and (qryDATACOM.AsDateTime > pRPI.DATAMOVCDBLIB)) and
               (not qryOrigemIDCARTEIRAGERENC.IsNull) then
            begin
               qryOrigem.Next;
               fraMens.Incrementa;
               Continue;
            end;                           

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
            //AL_8
            qryDestinoIDPLANPREVCTBPATR.AsInteger   := qryOrigemIDPLANPREVCTBPATR.AsInteger;
            qryDestinoPLANPRVCONTABPATRO.AsString   := qryOrigemPLANPRVCONTABPATRO.AsString;

            qryDestinoDATAOPERACAO.AsDateTime       := qryDATACOM.AsDateTime;
            qryDestinoDATAVENCOPER.AsDateTime       := CalcVenc(qryDATACOM.AsDateTime, qryTipoOperRecVENCIMENTO.AsInteger);
            qryDestinoDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
            qryDestinoFLGSTATUSFECHBOL.AsString     := 'F';
            qryDestinoFLGSTATUSORDMOV.AsString      := 'L';

            if qryPARIDADE.AsFloat <> 0 then
               qryDestinoQTDEOPERACAO.AsFloat       := OperComum.Round((qryOrigemQTDEOPERACAO.AsFloat * qryPARIDADE.AsFloat),0)
            else
               qryDestinoQTDEOPERACAO.AsFloat       := qryOrigemQTDEOPERACAO.AsFloat;

            if qryPARIDADE.AsFloat <> 0 then
               qryDestinoPRECOUNITOPERACAO.AsFloat  := (qryOrigemPRECOUNITOPERACAO.AsFloat * qryPARIDADE.AsFloat)
            else
               qryDestinoPRECOUNITOPERACAO.AsFloat  := qryOrigemPRECOUNITOPERACAO.AsFloat;

            if qryPARIDADE.AsFloat <> 0 then
               qryDestinoVLROPERACAO.AsFloat        := OperComum.Round((qryOrigemVLROPERACAO.AsFloat * qryPARIDADE.AsFloat),2)
            else
               qryDestinoVLROPERACAO.AsFloat        := qryOrigemVLROPERACAO.AsFloat;

            if qryPARIDADE.AsFloat <> 0 then
               qryDestinoVLRIR.AsFloat              := OperComum.Round((qryOrigemVLRIR.AsFloat * qryPARIDADE.AsFloat),2)
            else
               qryDestinoVLRIR.AsFloat              := qryOrigemVLRIR.AsFloat;

            if qryPARIDADE.AsFloat <> 0 then
               qryDestinoVLRREMUNERACAO.AsFloat     := OperComum.Round((qryOrigemVLRREMUNERACAO.AsFloat * qryPARIDADE.AsFloat),2)
            else
               qryDestinoVLRREMUNERACAO.AsFloat     := qryOrigemVLRREMUNERACAO.AsFloat;

            if qryPARIDADE.AsFloat <> 0 then
               qryDestinoVLRIRREMUNER.AsFloat       := OperComum.Round((qryOrigemVLRIRREMUNER.AsFloat * qryPARIDADE.AsFloat),2)
            else
               qryDestinoVLRIRREMUNER.AsFloat       := qryOrigemVLRIRREMUNER.AsFloat;

            if qryPARIDADE.AsFloat <> 0 then
               qryDestinoVLRLIQUIDO.AsFloat         := OperComum.Round((qryOrigemVLRLIQUIDO.AsFloat * qryPARIDADE.AsFloat),2)
            else
               qryDestinoVLRLIQUIDO.AsFloat         := qryOrigemVLRLIQUIDO.AsFloat;

            qryDestinoPERCENTUAL.AsFloat            := 0;
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


Function TfrmCadGrupamento.BuscaBoleta(dData: TDateTime; wIDForCli: Integer): String;
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
            qryBoletaTIPMOVBOLETA.AsString := 'DTG';
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

function TfrmCadGrupamento.CalcVenc(dDataOper: TDateTime; iPrazo: Integer): TDateTime;
begin
   Result := DiasUteisInv.SomaDiasUteis(dDataOper, iPrazo,-1,1,'',True,False,False)
end;

function TfrmCadGrupamento.AchaOrigem(iPlanPrev, iTipoOper, iCartInvest, iCartGerenc,
                                      iCustodiante, iMotBloq: Integer): Boolean;
begin
   Result := True;
   with OperComum do
   begin
      // Procura uma Origem com os mesmos dados
      qryOrigem.First;
      while not qryOrigem.Eof do
      begin
         if (qryOrigemIDPLANPREVCTBPATR.AsInteger = iPlanPrev) and
            (qryOrigemIDTIPOOPERACAO.AsInteger    = iTipoOper) and
            (qryOrigemIDCARTEIRAINVEST.AsInteger  = iCartInvest) and
            (qryOrigemIDCARTEIRAGERENC.AsInteger  = iCartGerenc) and
            (qryOrigemIDCUSTODIANTE.AsInteger     = iCustodiante) and
            (qryOrigemIDMOTIVOBLOQUEIO.AsInteger  = iMotBloq) then
            Break;
         qryOrigem.Next;
      end;
      // Se não achou, a query está em EOF (Não fez o Break)
      if qryOrigem.Eof then
         Result := False;
   end;
end;

procedure TfrmCadGrupamento.bbtnGeraOperacoesClick(Sender: TObject);
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
            GeraOrigem;
         end;
      end
      else
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
      end;
   finally
      bbtnGeraOperacoes.Down := False;
   end;
end;

procedure TfrmCadGrupamento.dsStateChange(Sender: TObject);
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

procedure TfrmCadGrupamento.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;
   Sel(qryIDOPERACAODIREITO.AsInteger, False);
end;

procedure TfrmCadGrupamento.dsDetStateChange(Sender: TObject);
begin
   inherited;
   HabDetDest((qryDestino.State = dsInsert));
   dbrQtdRec.Enabled    := (qryDestino.State in [dsInsert, dsEdit]);
end;

procedure TfrmCadGrupamento.dblCarteiraProvisaoExit(Sender: TObject);
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

procedure TfrmCadGrupamento.dblCarteiraRecExit(Sender: TObject);
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

procedure TfrmCadGrupamento.CmeDetalheEdit(Sender: TObject);
begin
   inherited;
   // Controle de Quantidade alterada no recebimento
   if pgctrlDetalhe.ActivePage = tbsDestino then
      wQtdOperAnt := qryDestinoQTDEOPERACAO.AsFloat;
end;


procedure TfrmCadGrupamento.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if qryDetalhe.IsEmpty then
     dblEmissor.Enabled := True
  else
     dblEmissor.Enabled := False;

  if qryOrigem.IsEmpty then
  begin
     dblTipoOperacao.Enabled := True;
     dbeParidade.Enabled := True;
     dbdAGE.Enabled := True;
     dbdEX.Enabled := True;
     dbdOper.Enabled := True;
  end
  else
  begin
     dblTipoOperacao.Enabled := False;
     dbeParidade.Enabled := False;
     dbdAGE.Enabled := False;
     dbdEX.Enabled := False;
     dbdOper.Enabled := False;
  end;

  if qryDestino.IsEmpty then
     dbdCOM.Enabled := True
  else
     dbdCOM.Enabled := False;
end;

procedure TfrmCadGrupamento.dbdDataOperacaoRecExit(Sender: TObject);
begin
  inherited;
  if qryDestino.State in [dsEdit, dsInsert] then
     qryDestinoDATAVENCOPER.AsDateTime := CalcVenc(dbdDataOperacaoRec.DateTime, qryTipoOperRecVENCIMENTO.AsInteger);

end;

procedure TfrmCadGrupamento.sbtnInsDetClick(Sender: TObject);
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

procedure TfrmCadGrupamento.sbtnAltDetClick(Sender: TObject);
// AL_1
var iOper: Integer;
begin
   if pgctrlDetalhe.ActivePage = tbsDet then
   begin
      wOrigem := False;
      wDestino := False;
      // AL_1
      iOper := qryDetalheIDOPERDIREITOXINV.AsInteger;
      if qryDetalhe.Locate('ORIGDEST', 'O', []) then
         wOrigem := True;
      if qryDetalhe.Locate('ORIGDEST', 'D', []) then
         wDestino := True;
      // AL_1
      qryDetalhe.Locate('IDOPERDIREITOXINV', iOper, []);
   end;

   inherited;

end;

procedure TfrmCadGrupamento.sbtnApagarClick(Sender: TObject);
var sBol: String;
begin
   // AL_3
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
            //AL_7
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
            //AL_7
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

procedure TfrmCadGrupamento.CmeDetalheApplyInsert(sender: TObject; var Accept: Boolean);
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
      //AL_8
      if Trim(dblPlanPatroProv.Text) = '' then
      begin
         MsgDlg('Não foi selecionado um Plano / Patrocinadora,'+#13+
                'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblPlanPatroProv.CanFocus then
            dblPlanPatroProv.SetFocus;
         Exit;
      end
      else
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
      //AL_8
      if Trim(dblPlanPatroRec.Text) = '' then
      begin
         MsgDlg('Não foi selecionado um Plano / Patrocinadora,'+#13+
                'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblPlanPatroRec.CanFocus then
            dblPlanPatroRec.SetFocus;
         Exit;
      end
      else
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
         //AL_8
         if not AchaOrigem(qryDestinoIDPLANPREVCTBPATR.AsInteger,
                           qryTipoOperRecIDTIPOOPERACAO.AsInteger,
                           qryDestinoIDCARTEIRAINVEST.AsInteger,
                           qryDestinoIDCARTEIRAGERENC.AsInteger,
                           qryDestinoIDCUSTODIANTE.AsInteger,
                           OperComum.IIF(Trim(dblMotivoBloqueioRec.Text) = '', -1, qryDestinoIDMOTIVOBLOQUEIO.AsInteger)) then
         begin
            MsgDlg('Não foi possível encontrar uma Origem para este Destino.',
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
      //AL_7
      if not CtrlInvContab.TestaPeriodo(sDataLanc, 2) then
      begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         Exit;
      end;
   end;

   Accept := True;
   inherited;

end;

procedure TfrmCadGrupamento.FormCreate(Sender: TObject);
begin
   inherited;
   //AL_8
   CtrlRV := TCtrlRendaVariavel.Create;
   CtrlRV.InitializeAs(Padroes);
end;

procedure TfrmCadGrupamento.dbdCOMExit(Sender: TObject);
begin
  inherited;
   if ((QryInvestimentoAcao.ParamByName('DATACOTACAO').AsString <> qryDATAEX.AsString) Or
       (QryInvestimentoAcao.ParamByName('IDEMISSOR').AsInteger  <> qryIDEMISSOR.AsInteger)) then
   begin
      OperComum.LimpaParametros(QryInvestimentoAcao);
      if Trim(dblEmissor.Text) <> '' then
         QryInvestimentoAcao.ParamByName('IDEMISSOR').AsInteger := qryIDEMISSOR.AsInteger;
      QryInvestimentoAcao.ParamByName('DATACOTACAO').AsString   := qryDATAEX.AsString;
      QryInvestimentoAcao.Open;
   end;
end;

end.
