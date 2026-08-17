//******************************************************************************
// Data      : 20/06/2008
// Código    : AL_24
// Pendencia : 27453
// SOL       : 79620
// Desc      : Ajuste na contabilização e no lançamento financeiro da operação
//******************************************************************************
// Data      : 19/07/2007
// Código    : AL_23
// Pendencia : 25194 
// SOL       : 53035
// Desc      : Implementação de critica para NÃO gerar o recebimento para
//              Carteiras Gerenciais conforme parametrização
//******************************************************************************
// Data      : 01/06/2007
// Código    : AL_22
// Pendencia : 24388
// SOL       : 53035
// Desc      : Acerto na filtragem das Carteiras para não trazer Carteiras Gerenciais
//             quando Parâmetro de integração com Carteira Gerencial estiver desmarcado.
//             (QrySaldoOrigem, qryOrigem, qryDestino, qryCarteiraRec e qryCarteiraOrig)
//******************************************************************************
// Data      : 04/01/2007
// Código    : AL_21
// Pendencia : 24122
// SOL       :
// Desc      : Ajuste na visualização das labels de informação
//******************************************************************************
// Data      : 25/10/2006
// Código    : AL_20
// Pendencia : 22976
// SOL       :
// Desc      : Segregação de Planos
//******************************************************************************
// Data      : 04/08/2006
// Código    : AL_19
// Pendencia :
// SOL       :
// Desc      : Não exclui o registro Pai pois a operação de Origem é um Dividendo, Juros ou Multa que nesta
//             operação está recebendo ações ao invés de dinheiro.
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_18
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_16
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
//Data	    : 06/03/2006
//Código    : Al_14
//Pendencia :
//SOL       :
//Motivo(S) : Implementação da trava de fechamento de renda variavel
//******************************************************************************
//Data	    :  11/01/2006
//Codigo    :  AL_13
//Motivo(s) :  Retirada de cartesiano nas queries que envolvem carteira gerencial
//******************************************************************************
//Data	    :  02/06/2005
//Codigo    :  AL_12
//Motivo(s) :  Implementada a rotina(HabilitaCamposDireito) que habilita ou desabilita
//                os campos "Isento de IR" e "Gera IR Litígio", conforme a sua parametrização de Tipo de Operacação
//******************************************************************************
//Data	    : 23/05/2005
//Código    : Al_11
//Motivo(S) : Implementação do teste de período contabil em 3 camadas
//            Substituição da Rotina BeforeConfirma pela ApplyInsert (Erro do Padrão)
//            DFM Alterado
//******************************************************************************
//Data	    : 13/05/2005
//Código    : Al_10
//Motivo(S) : Implementação do comando first, para posicionar as querys
//******************************************************************************
//Data	    : 13/05/2005
//Código    : Al_9
//Motivo(S) : Retirado a provisao e implementado a entrada direta no caixa da Gerencial.
//******************************************************************************
//Data	    : 27/04/2005
//Código    : Al_8
//Motivo(S) : Acerto na query de seleção para o investimento de recebimento
//******************************************************************************
//Data	    : 27/04/2005
//Código    : Al_7
//Motivo(S) : Implementado mais um teste para localizar a provisão do anúncio da Cart. Gerencial.
//******************************************************************************
//Data	    : 27/04/2005
//Código    : Al_6
//Motivo(S) : Só excluir HistProvisao qdo houver Carteira Gerencial
//******************************************************************************
//Data	    : 27/04/2005
//Código    : Al_5
//Motivo(S) : Inclusão da rotina de reprocessamneto para as Carteiras Gerenciais, no momento
//            da exclusão individual
//******************************************************************************
//Data	    : 27/04/2005
//Código    : Al_4
//Motivo(S) : Incluisão da rotina de marca flag para reprocessamento, qdo excluido individualmente e qdo
//            confimado a inclusão
//******************************************************************************
//Data	    : 27/04/2005
//Código    : Al_3
//Motivo(S) : Comementado o processo de marcação de exclusao da Boleta, esse é feito no botão de exclusão
//******************************************************************************
//Data	    : 25/04/2005
//Código    : Al_2
//Motivo(S) : Alterado o "ORIGDEST" para receber "D" de destino
//******************************************************************************
//Data	    : 02/03/2005
//Código    : Al_1
//Motivo(S) : Alterada o prazo limite para 60 dias para zerar a cota do Cart. Gerencial
//******************************************************************************

unit FCadAnuncioSubscricao;

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
  //AL_20
  uCtrlRendaVariavel, uCtrlPadroes, Provider, DBClient, uCMClientDataSet;

type
  TfrmCadAnuncioSubscricao = class(TfrmCadMestreDetalheCSInv)
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
    Label13: TLabel;
    dbeDivPorAcao: TDBRealEdit;
    dbmObservacao: TDBMemo;
    Label14: TLabel;
    tbsProvisao: TTabSheet;
    dbgProvisao: TwwDBGrid;
    pnlDetProvisao: TPanel;
    tbsRecebimento: TTabSheet;
    Label1: TLabel;
    dblCarteiraProvisao: TwwDBLookupCombo;
    Label2: TLabel;
    dbrQtdProv: TDBRealEdit;
    Label7: TLabel;
    dbrVlrProv: TDBRealEdit;
    Label11: TLabel;
    dblCustodianteProv: TwwDBLookupCombo;
    Label9: TLabel;
    dbrVlrIRProv: TDBRealEdit;
    Label8: TLabel;
    dbrVlrRemProv: TDBRealEdit;
    Label10: TLabel;
    dbrVlrLiqProv: TDBRealEdit;
    Label12: TLabel;
    dbgRecebimento: TwwDBGrid;
    pnlDetRecebimento: TPanel;
    Label18: TLabel;
    dblInvestimento: TwwDBLookupCombo;
    qryProvisao: TwwQuery;
    updProvisao: TUpdateSQL;
    dsProvisao: TwwDataSource;
    qryRecebimento: TwwQuery;
    updRecebimento: TUpdateSQL;
    dsRecebimento: TwwDataSource;
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
    dbtDescOperResgFundos: TDBText;
    qryDetalheDESCINVESTIMENTO: TStringField;
    dblTipoOperacao: TwwDBLookupCombo;
    Label28: TLabel;
    QryBuscaOperDireito: TwwQuery;
    QryOrigemDivJur: TwwQuery;
    dbcIsentoIr: TDBCheckBox;
    dbcIRLitigio: TDBCheckBox;
    dbePercentual: TDBRealEdit;
    Label38: TLabel;
    UpdOrigemDivJur: TUpdateSQL;
    qryTipoOperacaoIDMERCADO: TFloatField;
    qryTipoOperacaoFLGTRATAIR: TStringField;
    qryTipoOperacaoTIPCREDOR: TStringField;
    qryTipoOperacaoRECPAG: TStringField;
    QryBuscaBolsaValores: TwwQuery;
    qryAcoesxBolsa: TwwQuery;
    qryTipoOperacaoVENCIMENTO: TFloatField;
    qryProvisaoNUMDOCUMENTO: TStringField;
    qryProvisaoDESCINVESTIMENTO: TStringField;
    qryProvisaoDESCCARTINVEST: TStringField;
    qryProvisaoQTDEOPERACAO: TFloatField;
    qryProvisaoVLROPERACAO: TFloatField;
    qryProvisaoVLRIRREMUNER: TFloatField;
    qryProvisaoVLRIR: TFloatField;
    qryProvisaoVLRLIQUIDO: TFloatField;
    qryProvisaoSGLCUSTODIANTE: TStringField;
    qryProvisaoSIGLAMOTBLOQ: TStringField;
    qryProvisaoDATABASE: TDateTimeField;
    qryProvisaoIDOPERACAOINVEST: TFloatField;
    qryProvisaoMOECODIGO: TFloatField;
    qryProvisaoIDMODULO: TFloatField;
    qryProvisaoORIGDEST: TStringField;
    qryProvisaoEMPRESAPROP: TFloatField;
    qryProvisaoIDINVESTIMENTO: TFloatField;
    qryProvisaoIDCARTEIRAINVEST: TFloatField;
    qryProvisaoIDTIPOINVEST: TFloatField;
    qryProvisaoIDTIPOOPERACAO: TFloatField;
    qryProvisaoDATAOPERACAO: TDateTimeField;
    qryProvisaoNUMDOCUMENTO_1: TStringField;
    qryProvisaoPRECOUNITOPERACAO: TFloatField;
    qryProvisaoDATAVENCOPER: TDateTimeField;
    qryProvisaoIDFORCLI: TFloatField;
    qryProvisaoIDLOTE: TStringField;
    qryProvisaoIDCUSTODIANTE: TFloatField;
    qryProvisaoFLGSTATUSFECHBOL: TStringField;
    qryProvisaoFLGSTATUSORDMOV: TStringField;
    qryProvisaoIDOPERACAODIREITO: TFloatField;
    qryProvisaoVLRREMUNERACAO: TFloatField;
    qryProvisaoPERCENTUAL: TFloatField;
    qryProvisaoIDCARTEIRAGERENC: TFloatField;
    qryProvisaoIDPLANPREVCTBPATR: TFloatField;
    qryProvisaoIDOPERCUSTODIA: TFloatField;
    qryProvisaoIDCUSTORIG: TFloatField;
    Label39: TLabel;
    dbeBoletaProv: TDBEdit;
    qryIDPEDIDOFUNDO: TFloatField;
    qryQTDDIREITO: TFloatField;
    QryOrigemDivJurDESCINVESTIMENTO: TStringField;
    QryOrigemDivJurDESCCARTINVEST: TStringField;
    QryOrigemDivJurSGLCUSTODIANTE: TStringField;
    QryOrigemDivJurSIGLAMOTBLOQ: TStringField;
    QryOrigemDivJurIDLOTE: TStringField;
    QryOrigemDivJurDATAREFERENCIA: TDateTimeField;
    QryOrigemDivJurQTDE: TFloatField;
    QryOrigemDivJurQTDEDIREITO: TFloatField;
    QryOrigemDivJurVALOREXERCIDO: TFloatField;
    QryOrigemDivJurVLRREMUNERACAO: TFloatField;
    QryOrigemDivJurIR: TFloatField;
    QryOrigemDivJurVLRLIQ: TFloatField;
    QryOrigemDivJurVLRIRREMUNERACAO: TFloatField;
    QryOrigemDivJurVLRCUSTOATUAL: TFloatField;
    QryOrigemDivJurVLRCUSTO: TFloatField;
    QryOrigemDivJurIDCARTEIRAINVEST: TFloatField;
    QryOrigemDivJurIDCARTEIRAGERENC: TFloatField;
    QryOrigemDivJurIDINVESTIMENTO: TFloatField;
    QryOrigemDivJurIDCUSTODIANTE: TFloatField;
    QryOrigemDivJurIDMOTIVOBLOQUEIO: TFloatField;
    QryOrigemDivJurIDCUSTODIA: TFloatField;
    QryOrigemDivJurQTDTITLOTE: TFloatField;
    qryBoleta: TwwQuery;
    qryBoletaIDBOLETA: TStringField;
    qryBoletaSTATUS: TStringField;
    qryBoletaDATABOLETA: TDateTimeField;
    qryBoletaTIPMOVBOLETA: TStringField;
    updBoleta: TUpdateSQL;
    dblMotivoBloqueioProv: TwwDBLookupCombo;
    qryCarteiraProv: TwwQuery;
    qryCarteiraProvDESCCARTINVEST: TStringField;
    qryCarteiraProvIDCARTEIRAINVEST: TFloatField;
    qryCarteiraProvIDCARTEIRAGERENC: TFloatField;
    qryCustodianteProv: TwwQuery;
    qryMotBloqProv: TwwQuery;
    qryCustodianteProvIDCUSTODIANTE: TFloatField;
    qryCustodianteProvSGLCUSTODIANTE: TStringField;
    qryMotBloqProvIDMOTIVOBLOQUEIO: TFloatField;
    qryMotBloqProvSIGLAMOTBLOQ: TStringField;
    qryMotBloqProvDESCMOTBLOQ: TStringField;
    dblTipoOperProv: TwwDBLookupCombo;
    Label17: TLabel;
    qryTipoOperProv: TwwQuery;
    qryTipoOperProvIDTIPOINVEST: TFloatField;
    qryTipoOperProvIDTIPOOPERACAO: TFloatField;
    qryTipoOperProvIDMERCADO: TFloatField;
    qryTipoOperProvCODTIPDOC: TFloatField;
    qryTipoOperProvDESCTIPOOPERACAO: TStringField;
    qryTipoOperProvNATUREZAOPERACAO: TStringField;
    qryTipoOperProvTIPOCUSTODIA: TStringField;
    qryTipoOperProvVENCIMENTO: TFloatField;
    qryTipoOperProvFLGGERACONTAB: TFloatField;
    qryTipoOperProvFLGGERACAPCAR: TFloatField;
    qryTipoOperProvRECPAG: TStringField;
    qryTipoOperProvTIPCREDOR: TStringField;
    qryTipoOperProvFLGGERACAF: TFloatField;
    qryTipoOperProvFLGTRANSF: TStringField;
    qryTipoOperProvTRGDTINCLUSAO: TDateTimeField;
    qryTipoOperProvTRGUSERINCLUSAO: TStringField;
    qryTipoOperProvFLGCORRET: TStringField;
    qryTipoOperProvFLGORDMOVINV: TStringField;
    qryTipoOperProvIDMOTIVOBLOQUEIO: TFloatField;
    qryTipoOperProvFLGOPDIREITO: TStringField;
    qryTipoOperProvFLGAGE: TStringField;
    qryTipoOperProvFLGDATAEX: TStringField;
    qryTipoOperProvFLGDATACOM: TStringField;
    qryTipoOperProvFLGINVORIGEM: TStringField;
    qryTipoOperProvFLGPERC: TStringField;
    qryTipoOperProvFLGPARIDADE: TStringField;
    qryTipoOperProvFLGPRZBOLSA: TStringField;
    qryTipoOperProvFLGPRZEMP: TStringField;
    qryTipoOperProvFLGATADEC: TStringField;
    qryTipoOperProvFLGFORMAPAGREC: TStringField;
    qryTipoOperProvFLGDIVACAO: TStringField;
    qryTipoOperProvFLGINIPAG: TStringField;
    qryTipoOperProvFLGJUROS: TStringField;
    qryTipoOperProvMOTBLOQCARTORIG: TFloatField;
    qryTipoOperProvMOTBLOQCARTDEST: TFloatField;
    qryTipoOperProvTIPSALDOCARTORIG: TStringField;
    qryTipoOperProvTIPSALDOCARTDEST: TStringField;
    qryTipoOperProvFLGTRATAIR: TStringField;
    qryTipoOperProvSIGLATIPOOPER: TStringField;
    qryTipoOperProvFLGISENTOIR: TStringField;
    qryTipoOperProvFLGGRAVAIRLITIGIO: TStringField;
    qryTipoOperProvFLGOPGERENC: TStringField;
    qryTipoOperProvTIPOMOVTO: TStringField;
    qryTipoOperProvSTAATIVO: TStringField;
    qryTipoOperProvFLGRENTABILIDADE: TStringField;
    qryTipoOperProvFLGCONTAINVEST: TFloatField;
    qryTipoOperProvFLGMOVCOTA: TStringField;
    qryTipoOperProvFLGCOTARECDES: TStringField;
    qryTipoOperProvFLGDATAVENCIMENTO: TStringField;
    qryProvisaoDESCTIPOOPERACAO: TStringField;
    qryBoletaIDFORCLI: TFloatField;
    qryBoletaPLANO: TFloatField;
    qryBoletaPLNCODIGO: TFloatField;
    qryBoletaCODDOCUMENTO: TFloatField;
    qryProvisaoIDMOTIVOBLOQUEIO: TFloatField;
    qryHistCartInv: TwwQuery;
    updHistCartInv: TUpdateSQL;
    qryHistCartInvIDHISTCARTINV: TFloatField;
    qryHistCartInvIDTIPOOPERACAO: TFloatField;
    qryHistCartInvDATAMOVCARTINV: TDateTimeField;
    qryHistCartInvHISTMOVCARTINV: TStringField;
    qryHistCartInvIDOPERACAOINVEST: TFloatField;
    qryProvisaoNATUREZAOPERACAO: TStringField;
    qryInvestimentoAcaoIDMOEDACONTAB: TFloatField;
    QryBuscaFundo: TwwQuery;
    QryBuscaFundoDESCFUNDOINVEST: TStringField;
    QryBuscaFundoDESCTIPOOPERACAO: TStringField;
    QryUpdIrLitigio: TwwQuery;
    qryHistProv: TwwQuery;
    updHistProvProv: TUpdateSQL;
    qryHistProvIDHISTPROVISAO: TFloatField;
    qryHistProvIDOPERACAODIREITO: TFloatField;
    qryHistProvIDCARTEIRAINVEST: TFloatField;
    qryHistProvIDCARTEIRAGERENC: TFloatField;
    qryHistProvIDOPERACAOINVEST: TFloatField;
    qryHistProvIDCARTEIRAXEVENTO: TFloatField;
    qryHistProvVLRHISTPROVISAO: TFloatField;
    qryHistProvSLDHISTPROVISAO: TFloatField;
    qryHistProvDATAORIGEM: TDateTimeField;
    qryRecebimentoNUMDOCUMENTO: TStringField;
    qryRecebimentoDESCINVESTIMENTO: TStringField;
    qryRecebimentoDESCTIPOOPERACAO: TStringField;
    qryRecebimentoDESCCARTINVEST: TStringField;
    qryRecebimentoQTDEOPERACAO: TFloatField;
    qryRecebimentoVLROPERACAO: TFloatField;
    qryRecebimentoVLRIRREMUNER: TFloatField;
    qryRecebimentoVLRIR: TFloatField;
    qryRecebimentoVLRLIQUIDO: TFloatField;
    qryRecebimentoSGLCUSTODIANTE: TStringField;
    qryRecebimentoSIGLAMOTBLOQ: TStringField;
    qryRecebimentoDATABASE: TDateTimeField;
    qryRecebimentoIDOPERACAOINVEST: TFloatField;
    qryRecebimentoMOECODIGO: TFloatField;
    qryRecebimentoIDMODULO: TFloatField;
    qryRecebimentoORIGDEST: TStringField;
    qryRecebimentoEMPRESAPROP: TFloatField;
    qryRecebimentoIDINVESTIMENTO: TFloatField;
    qryRecebimentoIDCARTEIRAINVEST: TFloatField;
    qryRecebimentoIDTIPOINVEST: TFloatField;
    qryRecebimentoIDTIPOOPERACAO: TFloatField;
    qryRecebimentoDATAOPERACAO: TDateTimeField;
    qryRecebimentoNUMDOCUMENTO_1: TStringField;
    qryRecebimentoPRECOUNITOPERACAO: TFloatField;
    qryRecebimentoDATAVENCOPER: TDateTimeField;
    qryRecebimentoIDFORCLI: TFloatField;
    qryRecebimentoIDLOTE: TStringField;
    qryRecebimentoIDCUSTODIANTE: TFloatField;
    qryRecebimentoFLGSTATUSFECHBOL: TStringField;
    qryRecebimentoFLGSTATUSORDMOV: TStringField;
    qryRecebimentoIDOPERACAODIREITO: TFloatField;
    qryRecebimentoVLRREMUNERACAO: TFloatField;
    qryRecebimentoPERCENTUAL: TFloatField;
    qryRecebimentoIDCARTEIRAGERENC: TFloatField;
    qryRecebimentoIDPLANPREVCTBPATR: TFloatField;
    qryRecebimentoIDOPERCUSTODIA: TFloatField;
    qryRecebimentoIDCUSTORIG: TFloatField;
    qryRecebimentoIDMOTIVOBLOQUEIO: TFloatField;
    qryRecebimentoNATUREZAOPERACAO: TStringField;
    qryBoletaEXCLUIBOLETA: TStringField;
    qryAuxiliar: TwwQuery;
    bbtnGeraRecebimento: TToolbarButton97;
    qryInvestimentoAcaoQTDTITLOTE: TFloatField;
    qryCarteiraRec: TwwQuery;
    qryCustodianteRec: TwwQuery;
    qryMotBloqRec: TwwQuery;
    qryTipoOperRec: TwwQuery;
    Label20: TLabel;
    dblTipoOperRec: TwwDBLookupCombo;
    Label19: TLabel;
    Label21: TLabel;
    dblCustodianteRec: TwwDBLookupCombo;
    dblMotivoBloqueioRec: TwwDBLookupCombo;
    Label22: TLabel;
    Label23: TLabel;
    dbrQtdRec: TDBRealEdit;
    Label24: TLabel;
    dbrVlrRec: TDBRealEdit;
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
    lblCapCarteira: TfcLabel;
    lblVlrCarteira: TfcLabel;
    lblCapGerenc: TfcLabel;
    lblVlrGerenc: TfcLabel;
    lblCapDif: TfcLabel;
    lblVlrDif: TfcLabel;
    qryHistCaixa: TwwQuery;
    updHistCaixa: TUpdateSQL;
    qryHistCaixaIDHISTCAIXA: TFloatField;
    qryHistCaixaIDCARTEIRAXEVENTO: TFloatField;
    qryHistCaixaIDPLANPREVCTBPATR: TFloatField;
    qryHistCaixaDATAHISTCAIXA: TDateTimeField;
    qryHistCaixaVLRHISTCAIXA: TFloatField;
    qryHistCaixaSLDHISTCAIXA: TFloatField;
    qryHistCaixaIDOPERACAOINVEST: TFloatField;
    qryHistCaixaIDCARTEIRAINVEST: TFloatField;
    qryHistCaixaIDCARTEIRAGERENC: TFloatField;
    qryHistCaixaIDOPERACAODIREITO: TFloatField;
    qryHistCaixaDESCINVESTIMENTO: TStringField;
    qryHistCaixaTIPMOVCAIXA: TStringField;
    dbdDataOperacaoRec: TCMDateTimePicker;
    Label29: TLabel;
    qryBoletaCONTACCI: TFloatField;
    qryProvisaoIDCARTEIRA: TStringField;
    qryCarteiraProvIDCARTEIRA: TStringField;
    qryRecebimentoIDCARTEIRA: TStringField;
    qryCarteiraRecIDCARTEIRA: TStringField;
    dblCarteiraRec: TwwDBLookupCombo;
    QryOrigemDivJurIDCARTEIRA: TStringField;
    QryOrigemDivJurORDEM: TStringField;
    qryRecebimentoIDOPERACAOORIGEM: TFloatField;
    qryProvisaoQTDEEXERCIDA: TFloatField;
    qryProvisaoALTERADO: TStringField;
    qryRecebimentoALTERADO: TStringField;
    dblInvestimentoRec: TwwDBLookupCombo;
    Label25: TLabel;
    qryInvestimentoAcaoRec: TwwQuery;
    dbrPU: TDBRealEdit;
    Label15: TLabel;
    qryRecebimentoRECPAG: TStringField;
    qryInvestimentoAcaoRecIDINVESTIMENTO: TFloatField;
    qryInvestimentoAcaoRecDESCINVESTIMENTO: TStringField;
    qryInvestimentoAcaoRecQTDTITLOTE: TFloatField;
    qryInvestimentoAcaoRecIDTIPOINVEST: TFloatField;
    qryInvestimentoAcaoRecIDEMISSOR: TFloatField;
    qryInvestimentoAcaoRecIDMOEDACONTAB: TFloatField;
    Label26: TLabel;
    dbeBoletaRec: TDBEdit;
    qryTipoOperRecFLGCONTAINVEST: TFloatField;
    qryProvisaoFLGCONTAINVEST: TFloatField;
    qryHistProvDATAHISTPROVISAO: TDateTimeField;
    qryTipoOperacaoFLGGERACONTAB: TFloatField;
    qryTipoOperacaoFLGGERACAPCAR: TFloatField;
    qryProvisaoPLANPRVCONTABPATRO: TStringField;
    qryRecebimentoPLANPRVCONTABPATRO: TStringField;
    QryOrigemDivJurPLANPRVCONTABPATRO: TStringField;
    QryOrigemDivJurIDPLANPREVCTBPATR: TFloatField;
    //AL_24
    qryBoletaVALOR: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure dblEmissorExit(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dbcIsentoIrClick(Sender: TObject);
    procedure dbcIRLitigioClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure dblTipoOperacaoExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure dsProvisaoStateChange(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure dbrQtdProvExit(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure bbtnGeraRecebimentoClick(Sender: TObject);
    procedure qryRecebimentoAfterScroll(DataSet: TDataSet);
    procedure dsStateChange(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure dblCarteiraRecExit(Sender: TObject);
    procedure dblCarteiraProvisaoExit(Sender: TObject);
    procedure dbrVlrIRProvExit(Sender: TObject);
    procedure qryProvisaoAfterScroll(DataSet: TDataSet);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure dbdDataOperacaoRecExit(Sender: TObject);
    procedure qryDetalheAfterPost(DataSet: TDataSet);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure CmeDetalheApplyInsert(sender: TObject; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }

    //AL_20
    CtrlRV: TCtrlRendaVariavel;    

    procedure Sel(iOper: Integer; bSelAGE: Boolean = True; bSelInv: Boolean = True);
    procedure SelDetInv(iOper: Integer);
    procedure SelDetPro(iOper: Integer);
    procedure SelDetRec(iOper: Integer);
    procedure HabDetProv(bAcao:Boolean);
    procedure HabDetRec (bAcao: Boolean);
    procedure FornecedorCli(wIdCustodiante, iInvestimento: Integer;
                            var wIdForCli: Integer);
    //Al_12
    procedure HabilitaCamposDireito(bVisivel : Boolean);

    function  TestaOperacaoExitente: Boolean;
    function  ProvisionaOper: Boolean;
    function  GeraRecebimentos: Boolean;
    function  BuscaBoleta(dData: TDateTime;
                          iCarteira, iCartGer, iCustodiante, iMotBloq, iTipoOper: Integer): String;
    function CalcVenc(dDataOper: TDateTime; iPrazo: Integer): TDateTime;
    function AchaProvisao(iTipoOper, iCartInvest, iCartGerenc, iCustodiante, iMotBloq: Integer): Boolean;
  public
    { Public declarations }
  end;

var
  frmCadAnuncioSubscricao: TfrmCadAnuncioSubscricao;
  wSdoQtdCPMF, wSaldoQtd, wSaldoVlr, wSaldoIRApu, wSaldoInutil, wSaldoAqui,
  wQtdOperAnt : Double;

implementation

uses UOperComum, uMensErro, DBaseDados, UDataBase, uDocumento, uSistema,
     UBibliotecaInvest, UImpostos, UDiasUteisInv, URendaVariavel,
     dRendaVariavel, UCotaComum, UProvisaoComum, ULancContab, UCaixaComum,
     URendaFixa, UOperacaoInvest;

{$R *.DFM}

procedure TfrmCadAnuncioSubscricao.Sel(iOper  : Integer;
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
   qryBoleta.ParamByName('IDOPERACAODIREITO').AsInteger := qryIDOPERACAODIREITO.AsInteger;
   qryBoleta.Open;

   OperComum.LimpaParametros(qryHistCartInv);
   qryHistCartInv.ParamByName('IDOPERACAODIREITO').AsInteger := qryIDOPERACAODIREITO.AsInteger;
   qryHistCartInv.Open;

   OperComum.LimpaParametros(qryHistProv);
   qryHistProv.ParamByName('IDOPERACAODIREITO').AsInteger := qryIDOPERACAODIREITO.AsInteger;
   qryHistProv.Open;

   OperComum.LimpaParametros(qryHistCaixa);
   qryHistCaixa.ParamByName('IDOPERACAODIREITO').AsInteger := qryIDOPERACAODIREITO.AsInteger;
   qryHistCaixa.Open;

   OperComum.LimpaParametros(QryInvestimentoAcao);
   QryInvestimentoAcao.ParamByName('IDEMISSOR').AsInteger  := qryIDEMISSOR.AsInteger;
   QryInvestimentoAcao.ParamByName('DATACOTACAO').AsString := qryDATACOM.AsString;
   QryInvestimentoAcao.Open;

   OperComum.LimpaParametros(QryInvestimentoAcaoRec);
   QryInvestimentoAcaoRec.ParamByName('IDEMISSOR').AsInteger  := qryIDEMISSOR.AsInteger;
   QryInvestimentoAcaoRec.ParamByName('DATACOTACAO').AsString := qryDATACOM.AsString;
   QryInvestimentoAcaoRec.Open;

   if bSelInv then
      SelDetInv(iOper);

   SelDetPro(iOper);
   SelDetRec(iOper);

   dblEmissor.Enabled := True;
   dblTipoOperacao.Enabled := True;
   dbeDivPorAcao.Enabled := True;
   dbePercentual.Enabled := True;
   dbdAGE.Enabled := True;
   dbdEX.Enabled := True;
   dbdOper.Enabled := True;
   dbcIsentoIr.Enabled := True;
   dbcIRLitigio.Enabled := True;
   dbdCOM.Enabled := True;

end;

procedure TfrmCadAnuncioSubscricao.SelDetInv(iOper: Integer);
begin
    OperComum.LimpaParametros(qryDetalhe);
    qryDetalhe.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryDetalhe.Open
end;

procedure TfrmCadAnuncioSubscricao.SelDetPro(iOper: Integer);
begin
    //AL_23
    OperComum.LimpaParametros(qryCarteiraProv);
    qryCarteiraProv.ParamByName('DATALIMGER').AsString  := qryDATAEX.AsString;
    qryCarteiraProv.Open;
    //AL_22
    OperComum.LimpaParametros(qryProvisao);
    qryProvisao.ParamByName('DATAEX').AsString  := qryDATAEX.AsString;
    qryProvisao.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryProvisao.Open
end;

procedure TfrmCadAnuncioSubscricao.SelDetRec(iOper: Integer);
begin
    //AL_23
    OperComum.LimpaParametros(qryCarteiraRec);
    qryCarteiraRec.ParamByName('DATALIMGER').AsString  := qryDATAOPER.AsString;
    qryCarteiraRec.Open;
    //AL_22
    OperComum.LimpaParametros(qryRecebimento);
    qryRecebimento.ParamByName('DATAEX').AsString  := qryDATAEX.AsString;
    qryRecebimento.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryRecebimento.Open
end;

procedure TfrmCadAnuncioSubscricao.HabDetProv(bAcao:Boolean);
begin
   dbeBoletaProv.Enabled         := bAcao;
   dblTipoOperProv.Enabled       := bAcao;
   dblCarteiraProvisao.Enabled   := bAcao;
   dblCustodianteProv.Enabled    := bAcao;
   dblMotivoBloqueioProv.Enabled := bAcao;
end;

procedure TfrmCadAnuncioSubscricao.HabDetRec(bAcao:Boolean);
begin
   dbeBoletaRec.Enabled          := bAcao;
   dblTipoOperRec.Enabled        := bAcao;
   dblInvestimentoRec.Enabled    := bAcao;
   dblCarteiraRec.Enabled        := bAcao;
   dblCustodianteRec.Enabled     := bAcao;
   dblMotivoBloqueioRec.Enabled  := bAcao;
end;

procedure TfrmCadAnuncioSubscricao.FormShow(Sender: TObject);
begin
   inherited;
   qryTipoOperacao.Open;
   QryEmissor.Open;
   qryTipoDireito.Open;
   Sel(-1);
   pgctrlDetalhe.ActivePage := tbsDet;
end;

procedure TfrmCadAnuncioSubscricao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryTipoOperacao.Close;
   QryEmissor.Close;
   qryTipoDireito.Close;
   QryInvestimentoAcao.Close;
end;

procedure TfrmCadAnuncioSubscricao.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   qryIDOPERACAODIREITO.AsInteger := LeUltRegistro(nil,'OPERACAODIREITO');
   qryPARIDADE.AsFloat            := 1;
   qryPERCENTUAL.AsFloat          := 100;
end;

procedure TfrmCadAnuncioSubscricao.dblEmissorExit(Sender: TObject);
begin
   inherited;
   OperComum.LimpaParametros(QryInvestimentoAcao);
   QryInvestimentoAcao.ParamByName('IDEMISSOR').AsInteger := QryEmissorIDEMISSOR.AsInteger;
   QryInvestimentoAcao.Open;
end;

procedure TfrmCadAnuncioSubscricao.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   // AL_14
   if qry.State = dsInsert then
   begin
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      qryIDOPERACAODIREITO.AsInteger := LeUltRegistro(nil,'OPERACAODIREITO');
      qryPARIDADE.AsFloat            := 1;
      qryFLGTIPODIREITO.AsString     := 'P';
      Sel(qryIDOPERACAODIREITO.AsInteger, False);
      if dblTipoOperacao.CanFocus then
         dblTipoOperacao.SetFocus;
   end;
end;

procedure TfrmCadAnuncioSubscricao.CmeDetalheInsert(Sender: TObject);
var
   wNumDocNormal : String;
begin
   if pgctrlDetalhe.ActivePage = tbsRecebimento then
   begin
      if qryDetalhe.IsEmpty then
      begin
         MsgDlg('Não foi informado um Investimento para esta AGE.',
                'Mensagem do Sistema',mtWarning,[mbOK],0);
         bbtnVoltarDet.Click;
         Exit;
      end;
      if qryProvisao.IsEmpty then
      begin
         MsgDlg('Não foi informado um Anúncio para esta AGE.',
                'Mensagem do Sistema',mtWarning,[mbOK],0);
         bbtnVoltarDet.Click;
         Exit;
      end;
      HabDetRec(True);
      if dblTipoOperRec.CanFocus then
         dblTipoOperRec.SetFocus;
   end;

   inherited;

   if pgctrlDetalhe.ActivePage = tbsRecebimento then
   begin
      if qryRecebimento.State = dsInsert then
         qryRecebimentoDATAOPERACAO.AsDateTime := qryDATACOM.AsDateTime;

      if qryRecebimento.State in [dsEdit, dsInsert] then
      begin
         qryRecebimentoDATAVENCOPER.AsDateTime := CalcVenc(dbdDataOperacaoRec.DateTime, qryTipoOperRecVENCIMENTO.AsInteger);

         if qryRecebimentoNUMDOCUMENTO.IsNull then
         begin
            wNumDocNormal := 'RV-' + Copy(qryRecebimentoDATAOPERACAO.AsString,9,2) + '/' +
                                      FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                                                  Copy(qryRecebimentoDATAOPERACAO.AsString,9,2)));

            qryRecebimentoNUMDOCUMENTO.AsString := wNumDocNormal;
         end;
      end;
   end;

end;

procedure TfrmCadAnuncioSubscricao.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
   //Al_12
   HabilitaCamposDireito(True);
end;

function TfrmCadAnuncioSubscricao.TestaOperacaoExitente: Boolean;
begin
   try
      QryBuscaOperDireito.Close;
      QryBuscaOperDireito.ParamByName('P_IDEMISSOR').AsInteger    := QryIDEMISSOR.AsInteger;
      QryBuscaOperDireito.ParamByName('P_DATAEX').AsString        := QryDATAEX.AsString;
      QryBuscaOperDireito.ParamByName('P_DATAAGE').AsString       := QryDATAAGE.AsString;
      QryBuscaOperDireito.ParamByName('P_DATACOM').AsString       := QryDATACOM.AsString;
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

procedure TfrmCadAnuncioSubscricao.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
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
   if ((qryTipoOperacaoFLGDIVACAO.AsString = 'S') And (dbeDivPorAcao.Value = 0)) then
   begin
      Accept := False;
      MsgDlg('Não foi informado um PU para esta AGE,'+#13+
             'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbeDivPorAcao.CanFocus then
         dbeDivPorAcao.SetFocus;
      Exit;
   end
   else
   if ((qryTipoOperacaoFLGPERC.AsString = 'S') And (dbePercentual.Value = 0)) then
   begin
      Accept := False;
      MsgDlg('Não foi informado um Percentual para esta AGE,'+#13+
             'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbePercentual.CanFocus then
         dbePercentual.SetFocus;
      Exit;
   end
   else
   if ((qryTipoOperacaoFLGAGE.AsString = 'S') And (Trim(dbdAGE.Text) = '')) then
   begin
      Accept := False;
      MsgDlg('Não foi informada a Data desta AGE,'+#13+
             'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbdAGE.CanFocus then
         dbdAGE.SetFocus;
      Exit;
   end
   else
   if ((qryTipoOperacaoFLGDATAEX.AsString = 'S') And (Trim(dbdEX.Text) = '')) then
   begin
      Accept := False;
      MsgDlg('Não foi informada a Data Base para esta AGE,'+#13+
             'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbdEX.CanFocus then
         dbdEX.SetFocus;
      Exit;
   end
   else
   if ((qryTipoOperacaoFLGDATACOM.AsString = 'S') And (Trim(dbdCOM.Text) = '')) then
   begin
      Accept := False;
      MsgDlg('Não foi informada a Data Prevista para esta AGE,'+#13+
             'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbdCOM.CanFocus then
         dbdCOM.SetFocus;
      Exit;
   end
   else
   if (Trim(dbdOper.Text) = '') then
   begin
      Accept := False;
      MsgDlg('Não foi informada a Data da Operação para esta AGE,'+#13+
             'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbdOper.CanFocus then
         dbdOper.SetFocus;
      Exit;
   end;

   if ((qry.State = DsInsert) and (qry.FieldByName('PARIDADE').AsFloat = 0)) then
      qry.FieldByName('PARIDADE').AsFloat  := 1;

   if ((qry.State = DsInsert) and (qry.FieldByName('FLGTIPODIREITO').AsString = '')) then
      qry.FieldByName('FLGTIPODIREITO').AsString  := 'P';

   Accept := True;
end;

procedure TfrmCadAnuncioSubscricao.bbtnOkDetClick(Sender: TObject);
var
    wIdForCli : Integer;
begin
   CmeDetalhe.RepetirInsert := False;
   if pgctrlDetalhe.ActivePage = tbsRecebimento then
   begin
      if qryRecebimento.Modified then
      begin
         //Al_10
         //Se a Provisão foi alterada exclui o histórico
         qryHistCartInv.First;
         if qryHistCartInv.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
            qryHistCartInv.Delete;

         //Al_6
         if not qryRecebimentoIDCARTEIRAGERENC.IsNull then
         begin
            //Al_10
            qryHistProv.First;
            if qryHistProv.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
               qryHistProv.Delete;

            //Al_10
            qryHistCaixa.First;
            if qryHistCaixa.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
               qryHistCaixa.Delete;
         end;

         //Al_8
         //Ajusta o PU pelo valor informado
         qryRecebimentoPRECOUNITOPERACAO.AsFloat := OperComum.Round(((qryRecebimentoVLROPERACAO.AsFloat / qryRecebimentoQTDEOPERACAO.AsFloat)* qryInvestimentoAcaoRecQTDTITLOTE.AsInteger)-0.0049,2);

         qryRecebimentoALTERADO.AsString         := 'S';
         FornecedorCli(qryRecebimentoIDCUSTODIANTE.AsInteger,
                          qryRecebimentoIDINVESTIMENTO.AsInteger, wIdForCli);
         qryRecebimentoIDFORCLI.AsInteger := wIdForCli;

         //Al_10
         qryBoleta.First;
         if qryBoleta.Locate('IDBOLETA', qryRecebimentoNUMDOCUMENTO.AsString, []) then
         begin
            qryBoleta.Edit;
            qryBoletaIDBOLETA.AsString     := qryRecebimentoNUMDOCUMENTO.AsString;
            qryBoletaDATABOLETA.AsDateTime := qryRecebimentoDATAOPERACAO.AsDateTime;
            qryBoleta.Post;
         end
         else
         begin
            qryBoleta.Insert;
            qryBoletaIDBOLETA.AsString     := qryRecebimentoNUMDOCUMENTO.AsString;
            qryBoletaSTATUS.AsString       := 'F';
            qryBoletaDATABOLETA.AsDateTime := qryRecebimentoDATAOPERACAO.AsDateTime;
            qryBoletaTIPMOVBOLETA.AsString := 'DTS';
            qryBoletaIDFORCLI.AsInteger    := qryRecebimentoIDFORCLI.AsInteger;
            qryBoletaEXCLUIBOLETA.AsString := 'N';
            qryBoleta.Post;
         end;
      end;

      inherited;

   end

end;

procedure TfrmCadAnuncioSubscricao.dbcIsentoIrClick(Sender: TObject);
begin
  inherited;
  dbcIRLitigio.Visible := not (dbcIsentoIr.Checked);

  if (qry.State in [dsInsert, dsEdit]) then
  begin
     if dbcIsentoIr.Checked then
     begin
        dbcIRLitigio.Checked := false;
        qryIRLITIGIO.AsString := 'N';
     end
     else
        qryIRLITIGIO.AsString := 'S';
  end;
end;

procedure TfrmCadAnuncioSubscricao.dbcIRLitigioClick(Sender: TObject);
begin
   inherited;

   dbcIsentoIr.Visible := not (dbcIRLitigio.Checked);

   if (qry.State in [dsInsert, dsEdit]) then
   begin
      if dbcIRLitigio.Checked then
      begin
        dbcIsentoIr.Checked   := false;
        qryISENCAOIR.AsString := 'N';
      end;
   end;

end;

{Incrementa fornecedor, bolsa de valores, boleta, data de vencimento}
procedure TfrmCadAnuncioSubscricao.FornecedorCli(wIdCustodiante, iInvestimento  : Integer;
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

   // Se Tipo de Credor for EMISSOR
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

procedure TfrmCadAnuncioSubscricao.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   // AL_14
   if qry.State = dsEdit then
   begin
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

      if dblTipoOperacao.CanFocus then
         dblTipoOperacao.SetFocus;

      tbcDetalheChange(Sender);
   end;
end;

procedure TfrmCadAnuncioSubscricao.sbtnExcluiDetClick(Sender: TObject);
var sBol: String;
    iResp: Integer;
begin
   if pgctrlDetalhe.ActivePage = tbsRecebimento then
   begin
      iResp := OperComum.InvMsgBox('Exclui Esta Operação ou Todas',
                                   mtConfirmation, 'Mensagem do Sistema',
                                   [mbYes,mbNo,mbCancel],
                                   'Esta;Todas;Cancela');
      if iResp = mrYes then
      begin
         qryHistCartInv.First;
         if qryHistCartInv.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
            qryHistCartInv.Delete;

         //Al_6
         if not qryRecebimentoIDCARTEIRAGERENC.IsNull then
         begin
            //Al_10
            qryHistProv.First;
            if qryHistProv.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
               qryHistProv.Delete;

            //Al_10
            qryHistCaixa.First;
            if qryHistCaixa.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
               qryHistCaixa.Delete;
         end;

         //Al_10
         qryBoleta.First;
         if qryBoleta.Locate('IDBOLETA', qryRecebimentoNUMDOCUMENTO.AsString, []) then
         begin
            qryBoleta.Edit;
            qryBoletaEXCLUIBOLETA.AsString := 'S';
            qryBoleta.Post;
         end;

         //Al_4
         if qryRecebimentoDATAOPERACAO.AsDateTime <= pRPI.DATAULTFECH then
            RendaVariavel.MarcarFlagReproc(qryRecebimentoIDINVESTIMENTO.AsInteger,
                                           -1, -1, qryRecebimentoDATAOPERACAO.AsDateTime);
         //Al_5
         if (not qryRecebimentoIDCARTEIRAGERENC.IsNull) then
         begin
            with qryAuxiliar, OperComum do
            begin
               Close;
               SQL.Clear;
               SQL.Add('DELETE FROM HISTCOTA ');
               SQL.Add('WHERE ');
               SQL.Add('  DATAHISTCOTA >= TO_DATE(''' + IIF(qryRecebimentoDATAOPERACAO.AsDateTime < (pRPI.DATAULTFECH-60), DateToStr(pRPI.DATAULTFECH-60), DateToStr(qryRecebimentoDATAOPERACAO.AsDateTime)) + ''',''DD/MM/YYYY'') ');
               ExecSQL;
               Close;
            end;
         end;
         
         inherited;

      end
      else if iResp = mrNo then
      begin
         // Mata todas os Recebimentos anteriores
         fraMens.Mes := 'Excluindo Operações Anteriores...';
         fraMens.Max := qryRecebimento.RecordCount;
         fraMens.Pos := 0;
         fraMens.Mostra;
         qryRecebimento.First;
         while not qryRecebimento.Eof do
         begin

            if not qryRecebimentoIDCARTEIRAGERENC.IsNull then
            begin
               //Al_10
               qryHistProv.First;
               if qryHistProv.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
                  qryHistProv.Delete;

               //Al_10
               qryHistCaixa.First;
               if qryHistCaixa.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
                  qryHistCaixa.Delete;
            end;

            sBol := qryRecebimentoNUMDOCUMENTO.AsString;

            if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
               Raise Exception.Create('Não é possível excluir os Recebimentos da Boleta ' + sBol);

            while ((not qryRecebimento.Eof) and (sBol = qryRecebimentoNUMDOCUMENTO.AsString)) do
            begin
               qryRecebimento.Next;
               fraMens.Incrementa;
            end;
         end;
         inherited;
         Sel(qryIDOPERACAODIREITO.AsInteger, False);
      end;
   end;
end;

procedure TfrmCadAnuncioSubscricao.dblTipoOperacaoExit(Sender: TObject);
begin
   inherited;
   if Trim(dblTipoOperacao.Text) <> '' then
   begin
      if qryTipoOperacao.FieldbyName('NATUREZAOPERACAO').AsString = 'N' Then
      begin
         MsgDlg('O Tipo de Atualização da Carteira não está parametrizada no Cadastro de Tipos de Operação.',
                'Mensagem do Sistema ',mtWarning,[mbOK],0);
      end;
      //Al_12
      HabilitaCamposDireito(True);
   end;
end;

procedure TfrmCadAnuncioSubscricao.bbtnConfirmarClick(Sender: TObject);
// AL_11
var bCriaLancto, bAltRec: Boolean;
    wTipoRecDesBol, wMensErro: String;
    wPlano, wPlanilha, wDocumCont, wIdCarteiraXEvento : Integer;
    fSaldoCaixa: Currency;
begin
   //AL_18
   if not qryRecebimento.IsEmpty then
   begin
      if not CtrlInvContab.TestaPeriodo(qryRecebimentoDATAOPERACAO.AsString, 2) then
      begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', MtWarning, [mbOk],0);
         fraMens.Apaga;
         Exit;
      end;
   end;

   // Caso não confirmar, não pode fazer o finally
   // AL_11
   try  // Finally
      try  // Except
         qryRecebimento.DisableControls;

         fraMens.Mostra;
         fraMens.Mes := 'Atualizando Histórico das Carteiras';
         qryHistCartInv.ApplyUpdates;

         fraMens.Mes := 'Atualizando Histórico de Provisões Gerenciais';
         qryHistProv.ApplyUpdates;

         fraMens.Mes := 'Atualizando Histórico de Caixa Gerenciais';
         qryHistCaixa.ApplyUpdates;

         fraMens.Mes := 'Atualizando Operações de Subscrição';
         qryRecebimento.ApplyUpdates;

         fraMens.Mes := 'Atualizando AGE';
         qry.ApplyUpdates;

         //Zera o Buffer de memória do CachedUpdates
         qry.CommitUpdates;
         qryRecebimento.CommitUpdates;
         qryHistCartInv.CommitUpdates;
         qryHistProv.CommitUpdates;
         qryHistCaixa.CommitUpdates;

         fraMens.Pos := 0;
         fraMens.Max := qryRecebimento.RecordCount + qryBoleta.RecordCount;

         bAltRec := False;
         
         //Enquanto houverem Recebimentos alterados, Limpa a Boleta correspondente
         qryRecebimento.First;
         while not qryRecebimento.Eof do
         begin
            fraMens.Mes := 'Limpando Contábil e Financeiro dos Recebimentos';
            if ((qryRecebimentoIDCARTEIRAGERENC.IsNull) and
                (qryRecebimentoALTERADO.AsString = 'S')) then
            begin
               bAltRec := True;
               //Al_10
               qryBoleta.First;
               if qryBoleta.Locate('IDBOLETA', qryRecebimentoNUMDOCUMENTO.AsString, []) then
               begin
                  fraMens.Mes := 'Limpando Contábil e Financeiro dos Recebimentos' + #13 +
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
                  qryBoletaEXCLUIBOLETA.AsString  := 'S';
                  qryBoleta.Post;
               end;
            end;
            qryRecebimento.Next;
            fraMens.Incrementa;
         end;

         // Se houverem Boleta Marcada para exclusão (exclusão de provisao ou recebimento)
         qryBoleta.First;
         while not qryBoleta.Eof do
         begin
            fraMens.Mes := 'Limpando Contábil e Financeiro';
            if qryBoletaEXCLUIBOLETA.AsString = 'S' then
            begin
               fraMens.Mes := 'Limpando Contábil e Financeiro' + #13 +
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

               // Se foi excluida um dos Recebimentos desta boleta, é necessário
               // recontabilizar todos os Recebimentos desta boleta
               qryRecebimento.First;
               while not qryRecebimento.Eof do
               begin
                  if qryRecebimentoNUMDOCUMENTO.AsString = qryBoletaIDBOLETA.AsString then
                  begin
                     qryRecebimento.Edit;
                     qryRecebimentoALTERADO.AsString := 'S';
                     qryRecebimento.Post;
                     bAltRec := True;
                  end;
                  qryRecebimento.Next;
               end;
            end;
            qryBoleta.Next;
            fraMens.Incrementa;
         end;

         //Lança os Recebimentos
         fraMens.Mostra;
         fraMens.Max := qryRecebimento.RecordCount;
         qryRecebimento.First;
         while not qryRecebimento.Eof do
         begin
            // Se não achar o histórico, relança
            //Al_10
            qryHistCartInv.First;
            if not qryHistCartInv.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
            begin

               //AL_20
               fraMens.Mes := 'R$ ' + FormatFloat('###,###,###,##0.00', qryRecebimentoVLROPERACAO.AsFloat) + #13 +
                               qryRecebimentoDESCCARTINVEST.AsString;

               if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                                 qryRecebimentoIDINVESTIMENTO.AsInteger, 2,
                                                 qryRecebimentoIDOPERACAOINVEST.AsInteger, -1,
                                                 qryRecebimentoIDTIPOOPERACAO.AsInteger,
                                                 qryRecebimentoIDCARTEIRAINVEST.AsInteger,
                                                 qryRecebimentoIDCARTEIRAGERENC.AsInteger,
                                                 -1, -1, -1, -1, -1,
                                                 qryRecebimentoDATAOPERACAO.AsDateTime,
                                                 qryRecebimentoVLROPERACAO.AsFloat,
                                                 qryRecebimentoQTDEOPERACAO.AsFloat,
                                                 pRPI.VLRCOTAINICART,
                                                 0 {Variacao}, 0{Juros},
                                                 0 {wVlrIRProv} {Verificar se vai calcular o saldo},
                                                 qryRecebimentoVLRIR.AsFloat, 0, 0, 0, 0, 0,
                                                 qryRecebimentoNATUREZAOPERACAO.AsString {Movimento},
                                                 qryRecebimentoNATUREZAOPERACAO.AsString {Operacao},
                                                 qryRecebimentoIDLOTE.AsString,
                                                 TRIM(qryRecebimentoDESCTIPOOPERACAO.AsString) + ' / ' +
                                                      TRIM(qryRecebimentoDESCINVESTIMENTO.AsString),
                                                 'OPE', '1', '', True, -1,
                                                 //AL_20
                                                 qryRecebimentoIDPLANPREVCTBPATR.AsInteger, iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível inserir os Históricos das Operações.');

               if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                  Raise Exception.Create('Não foi possivel atualizar os saldos desta Carteira/Investimento');

               // Se não for Carteira Gerencial
               if qryRecebimentoIDCARTEIRAGERENC.IsNull then
               begin
                  //Atualizar Custodia
                  if not OperacaoInvest.CadastraCustodia(qryRecebimentoIDOPERACAOINVEST.AsInteger) then
                     Raise Exception.Create('Não foi possivel Atualizar a Custódia');

                  if not OperacaoInvest.AtualizaSaldosCustodia then
                     Raise Exception.Create('Não foi possivel Atualizar a Custódia');
               end;

            end;

            // Se for Carteira Gerencial
            if not qryRecebimentoIDCARTEIRAGERENC.IsNull then
            begin
               //AL_20
               //Al_10
               //Compensação da provisao do anúncio de direitos no caixa
               qryHistCaixa.First;
               if Not ((qryHistCaixa.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, [])) Or
                       (qryHistCaixa.Locate('IDOPERACAODIREITO;IDCARTEIRAGERENC;IDPLANPREVCTBPATR',
                                     VarArrayOf([qryRecebimentoIDOPERACAODIREITO.AsInteger,
                                                 qryRecebimentoIDCARTEIRAGERENC.AsInteger,
                                                 qryRecebimentoIDPLANPREVCTBPATR.AsInteger]), []))) then
               begin
                  wIdCarteiraXEvento := CotaComum.BuscaEventoPorTpOper(qryRecebimentoIDCARTEIRAINVEST.AsInteger,
                                                                       qryRecebimentoIDCARTEIRAGERENC.AsInteger,
                                                                       qryRecebimentoIDTIPOOPERACAO.AsInteger);
                  if wIdCarteiraXEvento = 0 then
                     Raise Exception.Create('Não foi encontrado o evento de Caixa/Cota para a Carteira Gerencial.');

                  //Al_9
                  fSaldoCaixa := CaixaComum.BuscaSaldoCaixa(qryRecebimentoDATAOPERACAO.AsDateTime,
                                                            qryRecebimentoIDCARTEIRAINVEST.AsInteger,
                                                            qryRecebimentoIDCARTEIRAGERENC.AsInteger,
                                                            qryRecebimentoIDPLANPREVCTBPATR.AsInteger, 'OPE');

                  //AL_20                                                            
                  if not CaixaComum.GravaEventosCaixa(qryRecebimentoDATAOPERACAO.AsDateTime,
                                                      qryRecebimentoIDPLANPREVCTBPATR.AsInteger,
                                                      qryRecebimentoIDTIPOOPERACAO.AsInteger,
                                                      0,
                                                      qryRecebimentoIDCARTEIRAINVEST.AsInteger,
                                                      qryRecebimentoIDCARTEIRAGERENC.AsInteger,
                                                      qryRecebimentoIDOPERACAOINVEST.AsInteger,
                                                      qryRecebimentoIDOPERACAODIREITO.AsInteger,
                                                      qryRecebimentoDESCINVESTIMENTO.AsString,
                                                      qryRecebimentoVLROPERACAO.AsFloat,
                                                      fSaldoCaixa) Then
                     Raise Exception.Create('Não foi possível gravar o evento de Caixa.');

                  //Al_01
                  with qryAuxiliar, OperComum do
                  begin
                     Close;
                     SQL.Clear;
                     SQL.Add('DELETE FROM HISTCOTA WHERE ');
                     SQL.Add('DATAHISTCOTA >= TO_DATE(''' + IIF(qryRecebimentoDATAOPERACAO.AsDateTime < (pRPI.DATAULTFECH-60), DateToStr(pRPI.DATAULTFECH-60), DateToStr(qryRecebimentoDATAOPERACAO.AsDateTime)) + ''',''DD/MM/YYYY'') ');
                     ExecSQL;
                     Close;
                  end;
               end;
            end
            else
            //AL_24 - Ini
            begin
               // Se for carteira Própria
               // Se houveram alterações nos Recebimentos e a Boleta foi limpa
               // Utilizando a mesma logica que foi aplicada na operação de
               // restituição de capital / recebimento fracionado
               // Veja unit FCarRestituicaoCapital.pas -> linha 1401
               if (bAltRec) and (qryBoleta.Lookup('IDBOLETA', qryRecebimentoNUMDOCUMENTO.AsString, 'EXCLUIBOLETA') = 'S') then
               begin
                  fraMens.Mes := 'Contabilizando R$ ' + FormatFloat('###,###,###,##0.00', qryRecebimentoVLROPERACAO.AsFloat) + #13 +
                                 'Carteira: ' + qryRecebimentoDESCCARTINVEST.AsString;

                  // Calcula o valor a ser lançado no financeiro (Totalizado por boleta)
                  if qryBoleta.Locate('IDBOLETA', qryRecebimentoNUMDOCUMENTO.AsString, []) then
                  begin
                     // Capta o Valor a ser lançado no financeiro para a Boleta
                     qryBoleta.Edit;
                     qryBoletaVALOR.AsFloat := qryBoletaVALOR.AsFloat + qryRecebimentoVLRLIQUIDO.AsCurrency;
                     qryBoleta.Post;
                  end
                  else
                     Raise Exception.Create('Não foi possível localizar a Boleta dos Recebimentos');
               end;
            end;
            if qryRecebimentoDATAOPERACAO.AsDateTime <= pRPI.DATAULTFECH then
               RendaVariavel.MarcarFlagReproc(qryRecebimentoIDINVESTIMENTO.AsInteger,
                                              -1, -1, qryRecebimentoDATAOPERACAO.AsDateTime);
            fraMens.Incrementa;
            qryRecebimento.Next;
         end;
         qryBoleta.First;
         fraMens.Pos := 0;
         fraMens.Max := qryBoleta.RecordCount;
         while not qryBoleta.Eof do
         begin
            fraMens.Mes := '';
            // Parametro para Contabilidade e CAP/CAR
            bCriaLancto    := True;
            wTipoRecDesBol := '';
            wMensErro      := '';
            // Lança o Financeiro do Recebimento sem lançar o contábil
            if qryBoletaVALOR.AsCurrency > 0 then
            begin
               if qryRecebimento.Locate('NUMDOCUMENTO', qryBoletaIDBOLETA.AsString, []) then
               begin
                  wPlano     := OperComum.IIF(qryBoletaPLANO.AsInteger = 0, -1, qryBoletaPLANO.AsInteger);
                  wPlanilha  := OperComum.IIF(qryBoletaPLNCODIGO.AsInteger = 0, -1, qryBoletaPLNCODIGO.AsInteger);
                  wDocumCont := OperComum.IIF(qryBoletaCODDOCUMENTO.AsInteger = 0, -1, qryBoletaCODDOCUMENTO.AsInteger);
                  //AL_19
                  if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                             qryRecebimentoIDINVESTIMENTO.AsInteger,
                                             qryRecebimentoIDTIPOOPERACAO.AsInteger,
                                             qryRecebimentoIDOPERACAOINVEST.AsInteger,
                                             qryRecebimentoIDFORCLI.AsInteger,
                                             qryRecebimentoIDCARTEIRAINVEST.AsInteger,
                                             QryInvestimentoAcaoIDMOEDACONTAB.AsInteger,
                                             TRIM(qryRecebimentoDESCTIPOOPERACAO.AsString) + ' - ' +
                                             TRIM(qryRecebimentoDESCINVESTIMENTO.AsString),
                                             qryRecebimentoIDLOTE.AsString, '',
                                             qryRecebimentoNUMDOCUMENTO.AsString,
                                             qryTipoOperRecRECPAG.AsString,
                                             wTipoRecDesBol, bCriaLancto,
                                             qryRecebimentoVLROPERACAO.AsCurrency {Financeiro},
                                             qryRecebimentoVLROPERACAO.AsCurrency {Contábil},
                                             qryRecebimentoDATAOPERACAO.AsDateTime,
                                             qryRecebimentoDATAVENCOPER.AsDateTime,
                                             wPlano, wPlanilha, wDocumCont, wMensErro,
                                             ''{sCapCar}, False, True, 0, True,
                                             qryRecebimentoIDPLANPREVCTBPATR.AsInteger) <> 0 then
                     Raise Exception.Create('Não foi possível contabilizar a Subscrição.');
                  // Atualiza a Boleta com Planilha e Documento
                  if (wPlanilha > 0) or (wDocumCont > 0) then
                  begin
                     qryBoleta.Edit;
                     if wPlanilha > 0 then
                     begin
                        qryBoletaPLANO.AsInteger       := wPlano;
                        qryBoletaPLNCODIGO.AsInteger   := wPlanilha;
                     end;
                     if wDocumCont > 0 then
                        qryBoletaCODDOCUMENTO.AsInteger := wDocumCont;
                     qryBoleta.Post;
                  end;
               end
               else
                  Raise Exception.Create('Não foi possível localizar a Boleta de Recebimento');
            end;
            //AL_24 - Não vai fazer outra boleta não? Só a Primeira?
            qryBoleta.Next;
         end;
         //AL_24 - Fim

         fraMens.Incrementa;
         qryRecebimento.Next;
         fraMens.Pos := 0;
         fraMens.Max := qryBoleta.RecordCount;
         qryBoleta.First;
         while not qryBoleta.Eof do
         begin
            fraMens.Mes := 'Conferindo Boletas' + #13 +
                           'Boleta ' + qryBoletaIDBOLETA.AsString;
            if (not qryRecebimento.Locate('NUMDOCUMENTO', qryBoletaIDBOLETA.AsString, [])) then
               qryBoleta.Delete
            else
               qryBoleta.Next;
            fraMens.Incrementa;
         end;

         qryBoleta.ApplyUpdates;
         qryBoleta.CommitUpdates;

         if dtmBaseDados.dbBaseDados.InTransaction then
         begin
            dtmBaseDados.dbBaseDados.Commit;
            //AL_7
            MsgDlg('Processo concluído com Sucesso.', 'Mensagem do Sistema ',mtConfirmation,[mbOK],0);
         end
         else
            MsgDlg('Ocorreu um problema no controle de transação:' + #13 +
                   'Não há transação para comitar', 'Mensagem do Sistema ',mtError,[mbOK],0);

         // Refaz o Status do Form como Browse
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
      Sel(qryIDOPERACAODIREITO.AsInteger);
      qryProvisao.EnableControls;
      qryRecebimento.EnableControls;
      CmeDetalhe.AtualizaBotoes(Self);
      CmeCadastro.AtualizaBotoes(Self);
   end;
   // Gava
   // Modo antigo de operação
   {if (bAltRec) and (qryBoleta.Lookup('IDBOLETA', qryRecebimentoNUMDOCUMENTO.AsString, 'EXCLUIBOLETA') = 'S') then
    begin
                  // Parametro para Contabilidade e CAP/CAR
                  bCriaLancto    := True;
                  wTipoRecDesBol := '';
                  wMensErro      := '';

                  QryBuscaFundo.Close;
                  QryBuscaFundo.ParamByName('IDPEDIDOFUNDO').AsInteger := qryIDPEDIDOFUNDO.AsInteger;
                  QryBuscaFundo.Open;

                  // Lança o Financeiro do Recebimento sem lançar o contábil
                  //Al_10
                  qryBoleta.First;
                  if qryBoleta.Locate('IDBOLETA', qryRecebimentoNUMDOCUMENTO.AsString, []) then
                  begin
                     wPlano     := OperComum.IIF(qryBoletaPLANO.AsInteger = 0, -1, qryBoletaPLANO.AsInteger);
                     wPlanilha  := OperComum.IIF(qryBoletaPLNCODIGO.AsInteger = 0, -1, qryBoletaPLNCODIGO.AsInteger);
                     wDocumCont := OperComum.IIF(qryBoletaCODDOCUMENTO.AsInteger = 0, -1, qryBoletaCODDOCUMENTO.AsInteger);

                     if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                                qryRecebimentoIDINVESTIMENTO.AsInteger,
                                                qryRecebimentoIDTIPOOPERACAO.AsInteger,
                                                qryRecebimentoIDOPERACAOINVEST.AsInteger,
                                                qryRecebimentoIDFORCLI.AsInteger,
                                                qryRecebimentoIDCARTEIRAINVEST.AsInteger,
                                                QryInvestimentoAcaoRecIDMOEDACONTAB.AsInteger,
                                                TRIM(qryRecebimentoDESCTIPOOPERACAO.AsString) + ' - ' +
                                                     TRIM(QryBuscaFundoDESCFUNDOINVEST.AsString)+' '+
                                                          TRIM(qryRecebimentoDESCINVESTIMENTO.AsString),
                                                qryRecebimentoIDLOTE.AsString, '',
                                                qryRecebimentoNUMDOCUMENTO.AsString,
                                                qryTipoOperRecRECPAG.AsString,
                                                wTipoRecDesBol, bCriaLancto,
                                    qryRecebimentoVLROPERACAO.AsCurrency //Financeiro,
                                    qryRecebimentoVLROPERACAO.AsCurrency //Contábil,
                                                qryRecebimentoDATAOPERACAO.AsDateTime,
                                                qryRecebimentoDATAVENCOPER.AsDateTime,
                                                wPlano, wPlanilha, wDocumCont, wMensErro,
                                                //AL_20
                                    'N' //sCapCar, False, True, 0, True,
                                                qryRecebimentoIDPLANPREVCTBPATR.AsInteger) <> 0 then
                        Raise Exception.Create('Não foi possível contabilizar a Subscrição.');

                     if (wPlanilha > 0) or (wDocumCont > 0) then
                     begin
                        qryBoleta.Edit;
                        if wPlanilha > 0 then
                        begin
                           qryBoletaPLANO.AsInteger       := wPlano;
                           qryBoletaPLNCODIGO.AsInteger   := wPlanilha;
                        end;
                        if wDocumCont > 0 then
                           qryBoletaCODDOCUMENTO.AsInteger := wDocumCont;
                        qryBoleta.Post;
                     end;
                  end
                  else
                    Raise Exception.Create('Não foi possível localizar a Boleta das Provisões');
               end;
            end;

            //Al_4
            if qryRecebimentoDATAOPERACAO.AsDateTime <= pRPI.DATAULTFECH then
               RendaVariavel.MarcarFlagReproc(qryRecebimentoIDINVESTIMENTO.AsInteger,
                                              -1, -1, qryRecebimentoDATAOPERACAO.AsDateTime);
            fraMens.Incrementa;
            qryRecebimento.Next;
         end;

         fraMens.Pos := 0;
         fraMens.Max := qryBoleta.RecordCount;
         qryBoleta.First;
         while not qryBoleta.Eof do
         begin
            fraMens.Mes := 'Conferindo Boletas' + #13 +
                           'Boleta ' + qryBoletaIDBOLETA.AsString;
            if (not qryRecebimento.Locate('NUMDOCUMENTO', qryBoletaIDBOLETA.AsString, [])) then
               qryBoleta.Delete
            else
               qryBoleta.Next;
            fraMens.Incrementa;
         end;

         qryBoleta.ApplyUpdates;
         qryBoleta.CommitUpdates;

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
      
      Sel(qryIDOPERACAODIREITO.AsInteger);

      qryProvisao.EnableControls;
      qryRecebimento.EnableControls;
      CmeDetalhe.AtualizaBotoes(Self);
      CmeCadastro.AtualizaBotoes(Self);
   end;}
end;

procedure TfrmCadAnuncioSubscricao.FormResize(Sender: TObject);
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

procedure TfrmCadAnuncioSubscricao.dsProvisaoStateChange(Sender: TObject);
begin
   inherited;
   HabDetProv((qryProvisao.State = dsInsert));
   dbrQtdProv.Enabled    := (qryProvisao.State in [dsInsert, dsEdit]);
   dbrVlrProv.Enabled    := (qryProvisao.State in [dsInsert, dsEdit]);
   dbrVlrRemProv.Enabled := (qryProvisao.State in [dsInsert, dsEdit]);
   dbrVlrIRProv.Enabled  := (qryProvisao.State in [dsInsert, dsEdit]);
   dbrVlrLiqProv.Enabled := (qryProvisao.State in [dsInsert, dsEdit]);
end;

//AL_19
procedure TfrmCadAnuncioSubscricao.sbtnApagarClick(Sender: TObject);
begin
   //AL_19
end;

procedure TfrmCadAnuncioSubscricao.CmeDetalheConfirma(Sender: TObject);
var wIdForCli: Integer;
    sNewBol: String;
begin
   try
      sNewBol := '';
      if pgctrlDetalhe.ActivePage = tbsDet then
      begin
         if qryDetalhe.State in [dsInsert, dsEdit] then
         begin
            qryDetalheDESCINVESTIMENTO.AsString := QryInvestimentoAcaoDESCINVESTIMENTO.AsString;
            //Al_2
            qryDetalheORIGDEST.AsString := 'D';
            qryDetalheIDOPERACAODIREITO.AsInteger := qryIDOPERACAODIREITO.AsInteger;
            if qryDetalhe.State = dsInsert then
               qryDetalheIDOPERDIREITOXINV.AsInteger := LeUltRegistro(nil,'OPERDIREITOXINV');
         end;
      end
      else if pgctrlDetalhe.ActivePage = tbsProvisao then
      begin
         if qryProvisao.State = dsInsert then
         begin
            qryProvisaoIDOPERACAOINVEST.AsInteger    := LeUltRegistro(nil,'OPERACAOINVEST');
            qryProvisaoMOECODIGO.AsInteger           := pRPI.MOECODIGO;
            qryProvisaoIDMODULO.AsInteger            := Sistema.IdModulo;
            qryProvisaoEMPRESAPROP.AsInteger         := Sistema.IdEmpresa;
            qryProvisaoIDINVESTIMENTO.AsInteger      := QryInvestimentoAcaoIDINVESTIMENTO.AsInteger;
            qryProvisaoDESCINVESTIMENTO.AsString     := QryInvestimentoAcaoDESCINVESTIMENTO.AsString;
            qryProvisaoDESCCARTINVEST.AsString       := qryCarteiraProvDESCCARTINVEST.AsString;
            qryProvisaoIDCARTEIRA.AsString           := qryCarteiraProvIDCARTEIRA.AsString;
            qryProvisaoIDCARTEIRAINVEST.AsInteger    := qryCarteiraProvIDCARTEIRAINVEST.AsInteger;
            if not qryCarteiraProvIDCARTEIRAGERENC.IsNull then
               qryProvisaoIDCARTEIRAGERENC.AsInteger := qryCarteiraProvIDCARTEIRAGERENC.AsInteger
            else
               qryProvisaoIDCARTEIRAGERENC.Clear;
            qryProvisaoIDTIPOINVEST.AsInteger        := 2;
            qryProvisaoDESCTIPOOPERACAO.AsString     := qryTipoOperProvDESCTIPOOPERACAO.AsString;
            qryProvisaoNATUREZAOPERACAO.AsString     := qryTipoOperProvNATUREZAOPERACAO.AsString;
            qryProvisaoIDLOTE.Clear;
            if not qryProvisaoIDCUSTODIANTE.IsNull then
               qryProvisaoSGLCUSTODIANTE.AsString    := QryCustodianteProvSGLCUSTODIANTE.AsString
            else
               qryProvisaoSGLCUSTODIANTE.Clear;
            FornecedorCli(qryProvisaoIDCUSTODIANTE.AsInteger,
                          qryProvisaoIDINVESTIMENTO.AsInteger, wIdForCli);
            qryProvisaoIDFORCLI.AsInteger            := wIdForCli;
            qryProvisaoIDOPERACAODIREITO.AsInteger   := qryIDOPERACAODIREITO.AsInteger;
            qryProvisaoIDPLANPREVCTBPATR.AsInteger   := iPlanPrevCtbPatro;
            qryProvisaoDATAOPERACAO.AsDateTime       := qryDATAOPER.AsDateTime;
            qryProvisaoDATAVENCOPER.AsDateTime       := CalcVenc(qryDATAOPER.AsDateTime, qryTipoOperProvVENCIMENTO.AsInteger);
            qryProvisaoDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
            if qryProvisaoNUMDOCUMENTO.IsNull then
               qryProvisaoNUMDOCUMENTO.AsString      := BuscaBoleta(qryDATAOPER.AsDateTime,
                                                                    qryProvisaoIDCARTEIRAINVEST.AsInteger,
                                                                    qryProvisaoIDCARTEIRAGERENC.AsInteger,
                                                                    qryProvisaoIDCUSTODIANTE.AsInteger,
                                                                    qryProvisaoIDMOTIVOBLOQUEIO.AsInteger,
                                                                    qryProvisaoIDTIPOOPERACAO.AsInteger);
            qryProvisaoFLGSTATUSFECHBOL.AsString     := 'F';
            qryProvisaoFLGSTATUSORDMOV.AsString      := 'L';
            qryProvisaoPRECOUNITOPERACAO.AsFloat     := OperComum.Round(((qryProvisaoVLROPERACAO.AsFloat / qryProvisaoQTDEOPERACAO.AsFloat) * qryInvestimentoAcaoQTDTITLOTE.AsInteger)-0.0049,2);
            qryProvisaoPERCENTUAL.AsFloat            := 0;
            //Al_2
            qryProvisaoORIGDEST.AsString             := 'D';
            if qryProvisaoIDMOTIVOBLOQUEIO.IsNull then
               qryProvisaoIDMOTIVOBLOQUEIO.AsInteger := -1;
            qryProvisaoSIGLAMOTBLOQ.AsString      := qryMotBloqProvSIGLAMOTBLOQ.AsString;
            qryProvisaoIDOPERCUSTODIA.Clear;
            qryProvisaoALTERADO.AsString := 'S';
         end
         else
         begin
            //Al_10
            qryBoleta.First;
            if qryBoleta.Locate('IDBOLETA', qryProvisaoNUMDOCUMENTO.AsString, []) then
            begin
               qryBoleta.Edit;
               qryBoletaEXCLUIBOLETA.AsString := 'S';
               qryBoleta.Post;
            end;
         end;
      end
      else if pgctrlDetalhe.ActivePage = tbsRecebimento then
      begin
         if qryRecebimento.State = dsInsert then
         begin
            qryRecebimentoIDOPERACAOINVEST.AsInteger    := LeUltRegistro(nil,'OPERACAOINVEST');
            qryRecebimentoMOECODIGO.AsInteger           := pRPI.MOECODIGO;
            qryRecebimentoIDMODULO.AsInteger            := Sistema.IdModulo;
            qryRecebimentoEMPRESAPROP.AsInteger         := Sistema.IdEmpresa;
            //Al_8
            qryRecebimentoIDINVESTIMENTO.AsInteger      := QryInvestimentoAcaoRecIDINVESTIMENTO.AsInteger;
            qryRecebimentoDESCINVESTIMENTO.AsString     := QryInvestimentoAcaoRecDESCINVESTIMENTO.AsString;

            qryRecebimentoDESCCARTINVEST.AsString       := qryCarteiraRecDESCCARTINVEST.AsString;
            qryRecebimentoIDCARTEIRA.AsString           := qryCarteiraRecIDCARTEIRA.AsString;
            qryRecebimentoIDCARTEIRAINVEST.AsInteger    := qryCarteiraRecIDCARTEIRAINVEST.AsInteger;
            if not qryCarteiraRecIDCARTEIRAGERENC.IsNull then
               qryRecebimentoIDCARTEIRAGERENC.AsInteger := qryCarteiraRecIDCARTEIRAGERENC.AsInteger
            else
               qryRecebimentoIDCARTEIRAGERENC.Clear;
            qryRecebimentoIDTIPOINVEST.AsInteger        := 2;
            qryRecebimentoDESCTIPOOPERACAO.AsString     := qryTipoOperRecDESCTIPOOPERACAO.AsString;
            qryRecebimentoNATUREZAOPERACAO.AsString     := qryTipoOperRecNATUREZAOPERACAO.AsString;
            qryRecebimentoIDLOTE.Clear;
            if not qryRecebimentoIDCUSTODIANTE.IsNull then
               qryRecebimentoSGLCUSTODIANTE.AsString    := qryCustodianteRecSGLCUSTODIANTE.AsString
            else
               qryRecebimentoSGLCUSTODIANTE.Clear;
            FornecedorCli(qryRecebimentoIDCUSTODIANTE.AsInteger,
                          qryRecebimentoIDINVESTIMENTO.AsInteger, wIdForCli);
            qryRecebimentoIDFORCLI.AsInteger            := wIdForCli;
            qryRecebimentoIDOPERACAODIREITO.AsInteger   := qryIDOPERACAODIREITO.AsInteger;
            qryRecebimentoIDPLANPREVCTBPATR.AsInteger   := iPlanPrevCtbPatro;
            qryRecebimentoDATAVENCOPER.AsDateTime       := CalcVenc(dbdDataOperacaoRec.DateTime, qryTipoOperRecVENCIMENTO.AsInteger);
            qryRecebimentoDATABASE.AsDateTime           := qryDATAEX.AsdateTime;

            if qryRecebimentoNUMDOCUMENTO.IsNull then
               qryRecebimentoNUMDOCUMENTO.AsString      := BuscaBoleta(dbdDataOperacaoRec.DateTime,
                                                                       qryRecebimentoIDCARTEIRAINVEST.AsInteger,
                                                                       qryRecebimentoIDCARTEIRAGERENC.AsInteger,
                                                                       qryRecebimentoIDCUSTODIANTE.AsInteger,
                                                                       qryRecebimentoIDMOTIVOBLOQUEIO.AsInteger,
                                                                       qryRecebimentoIDTIPOOPERACAO.AsInteger);

            qryRecebimentoFLGSTATUSFECHBOL.AsString     := 'F';
            qryRecebimentoFLGSTATUSORDMOV.AsString      := 'L';
            //Al_8
            qryRecebimentoPRECOUNITOPERACAO.AsFloat     := OperComum.Round(((OperComum.DivValorZero(qryRecebimentoVLROPERACAO.AsFloat, qryRecebimentoQTDEOPERACAO.AsFloat) * QryInvestimentoAcaoRecQTDTITLOTE.AsInteger))-0.0049,2);

            qryRecebimentoPERCENTUAL.AsFloat            := 0;
            //Al_2
            qryRecebimentoORIGDEST.AsString             := 'D';
            if qryRecebimentoIDMOTIVOBLOQUEIO.IsNull then
               qryRecebimentoIDMOTIVOBLOQUEIO.AsInteger := -1;
            qryRecebimentoSIGLAMOTBLOQ.AsString      := qryMotBloqRecSIGLAMOTBLOQ.AsString;
            qryRecebimentoIDOPERCUSTODIA.Clear;
            qryRecebimentoALTERADO.AsString := 'S';
         end;
         //Al_3
      end;

      inherited;
   except
      if sNewBol <> '' then
      begin
         //Al_10
         qryBoleta.First;
         if qryBoleta.Locate('IDBOLETA', sNewBol, []) then
            qryBoleta.Delete;
      end;
      bbtnCancelarDet.Click;
   end;
end;

procedure TfrmCadAnuncioSubscricao.dbrQtdProvExit(Sender: TObject);
begin
   inherited;
   if (Pos('Prov',TDBRealEdit(Sender).Name) > 0) then
      dbrVlrProv.Value := OperComum.DivValorZero((dbrQtdProv.Value * qryDIVPORACAO.AsFloat), QryInvestimentoAcaoQTDTITLOTE.AsInteger)
   else
      dbrVlrRec.Value := OperComum.DivValorZero((dbrQtdRec.Value * dbrPU.Value), QryInvestimentoAcaoQTDTITLOTE.AsInteger);

end;

procedure TfrmCadAnuncioSubscricao.tbcDetalheChange(Sender: TObject);
begin
   inherited;

   sbtnInsDet.Enabled       := False;
   sbtnAltDet.Enabled       := False;
   sbtnExcluiDet.Enabled    := False;
   sbtnConsDet.Enabled      := False;

   bbtnGeraRecebimento.Enabled := False;

   bbtnGeraRecebimento.Visible := (pgctrlDetalhe.ActivePage <> tbsDet);
   bbtnGeraRecebimento.Hint    := OperComum.IIF(pgctrlDetalhe.ActivePage = tbsProvisao,
                                                'Gera Anúncios', 'Gera Recebimentos');
   //AL_21
   if pgctrlDetalhe.ActivePage <> tbsProvisao then
   begin
      lblCapCarteira.Visible := False;
      lblCapGerenc.Visible := False;
      lblCapDif.Visible := False;
      lblVlrCarteira.Visible := False;
      lblVlrGerenc.Visible := False;
      lblVlrDif.Visible := False;
   end
   else
   begin
      lblCapCarteira.Visible := False;
      lblCapGerenc.Visible := False;
      lblCapDif.Visible := False;
      lblVlrCarteira.Visible := False;
      lblVlrGerenc.Visible := False;
      lblVlrDif.Visible := False;
   end;

   If (qry.State in [dsInsert, dsEdit]) Then
   begin
      if pgctrlDetalhe.ActivePage = tbsRecebimento then
      begin
         sbtnInsDet.Enabled    := True;
         sbtnAltDet.Enabled    := True;
         sbtnExcluiDet.Enabled := True;
         sbtnConsDet.Enabled   := True;
         bbtnGeraRecebimento.Enabled := True;
      end
      else if pgctrlDetalhe.ActivePage = tbsProvisao then
         sbtnConsDet.Enabled         := True;
   end;

end;

function TfrmCadAnuncioSubscricao.ProvisionaOper: Boolean;
// AL_11
var fVlrRendimento, wQtdOper, wVlrOperacao,
    wPuProporcinal, wSdoQtdCPMF: Double;
    wSaldoNormal, wSaldoCCI: Double;
    //AL_20
    wIdNovaOperacao, wIdForCli, wIdForCliAnt, I, wIdPlanPrevAnt : Integer;
    DataAGECons: TDateTime;
    wNumDocNormal, wNumDocCCI, wNumDoc, sBol: String;
begin
   try
      try
         Result := False;
         qryProvisao.DisableControls;
         qryRecebimento.DisableControls;

         qryRecebimento.First;
         while not qryRecebimento.Eof do
         begin
            sBol := qryRecebimentoNUMDOCUMENTO.AsString;
            if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
               Raise Exception.Create('Não foi possível excluir os Recebimentos da Boleta ' + sBol);
            while ((not qryRecebimento.Eof) and (sBol = qryRecebimentoNUMDOCUMENTO.AsString)) do
               qryRecebimento.Next;

         end;

         qryProvisao.First;
         while not qryProvisao.Eof do
         begin
            sBol := qryProvisaoNUMDOCUMENTO.AsString;
            if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
               Raise Exception.Create('Não foi possível Excluir as Provisões da boleta ' + sBol);
            while ((not qryProvisao.Eof) and (sBol = qryProvisaoNUMDOCUMENTO.AsString)) do
            begin
               qryProvisao.Next;
            end;
         end;

         Sel(qryIDOPERACAODIREITO.AsInteger, False, False);

         fraMens.Mostra;
         fraMens.Mes := 'Buscando Saldos...';

         OperComum.LimpaParametros(QryOrigemDivJur);
         QryOrigemDivJur.ParamByName('IDINVESTIMENTO').AsInteger := qryDetalheIDINVESTIMENTO.AsInteger;
         //AL_20
         QryOrigemDivJur.ParamByName('DATAEX').AsString := qryDATAAGE.AsString;
         QryOrigemDivJur.ParamByName('FORCLI').AsString := qryTipoOperacaoTIPCREDOR.AsString;
         QryOrigemDivJur.Open;

         fraMens.Mostra;
         fraMens.Max := QryOrigemDivJur.RecordCount;

         DataAGECons := qryDATAAGE.AsDateTime;
         if (Trim(qrySTATUS.AsString) <> '') then
         begin
            DataAGECons := DataAGECons - 1;
            while not DiasUteisInv.DiaUtil(DataAGECons,-1,1,'',True,False,False) do
                DataAGECons := DataAGECons - 1;   // Achar o dia útil anterior
         end;

         wIdForCliAnt := 0;

         QryOrigemDivJur.First;
         while not QryOrigemDivJur.Eof do
         begin
            fraMens.Mes := 'Processando: ' + QryOrigemDivJurDESCCARTINVEST.AsString +  #13 +
                           OperComum.IIF(QryOrigemDivJurSGLCUSTODIANTE.IsNull, '', ' Custodia: ' + QryOrigemDivJurSGLCUSTODIANTE.AsString) +
                           OperComum.IIF(QryOrigemDivJurSIGLAMOTBLOQ.IsNull, '', ' Bloqueio: ' + QryOrigemDivJurSIGLAMOTBLOQ.AsString);

            QryOrigemDivJur.Edit;
            if (qryTipoOperacaoFLGPERC.AsString = 'S') and (qryPERCENTUAL.AsFloat <> 0) then
                QryOrigemDivJurQTDEDIREITO.AsFloat :=
                      OperComum.Round((QryOrigemDivJurQTDE.AsFloat * qryPERCENTUAL.AsFloat) / 100,0)
            else
                QryOrigemDivJurQTDEDIREITO.AsFloat := QryOrigemDivJurQTDE.AsFloat;

            QryOrigemDivJurDATAREFERENCIA.AsDateTime  := qryDATAEX.AsDateTime;

            QryOrigemDivJurVALOREXERCIDO.AsFloat := OperComum.Round((QryOrigemDivJurQTDEDIREITO.AsFloat *
                                                                     OperComum.DivValorZero(qryDIVPORACAO.AsFloat,
                                                                                            QryOrigemDivJurQTDTITLOTE.AsInteger))-0.0049,2);
            fVlrRendimento := 0;

            if qryISENCAOIR.AsString = 'N' then
               QryOrigemDivJurIR.AsFloat := Impostos.CalculaIr(0,
                                                     QryOrigemDivJurIDINVESTIMENTO.AsInteger,
                                                     QryOrigemDivJurIDCARTEIRAGERENC.AsInteger,
                                                     QryOrigemDivJurIDCARTEIRAINVEST.AsInteger,
                                                     qryIDTIPOOPERACAO.AsInteger,
                                                     qryTipoOperacaoIDMERCADO.AsInteger,
                                                     QryOrigemDivJur.FieldByName('IDLOTE').AsString,
                                                     Date, Date,
                                                     0,
                                                     QryOrigemDivJurVALOREXERCIDO.AsFloat, 0, 'S',
                                                     qryTipoOperacaoFLGTRATAIR.AsString,
                                                     fVlrRendimento);
            if qryIRLITIGIO.AsString = 'S' then
               QryOrigemDivJurVLRLIQ.AsFloat := QryOrigemDivJurVALOREXERCIDO.AsFloat
            else
               QryOrigemDivJurVLRLIQ.AsFloat := QryOrigemDivJurVALOREXERCIDO.AsFloat - QryOrigemDivJurIR.AsFloat;

            wSaldoIRApu := 0;
            wSaldoQtd   := 0;
            wSaldoAqui  := 0;
            wSaldoVlr   := 0;
            wSdoQtdCPMF := 0;
            //AL_20
            CtrlRV.BuscaSaldoRV.Executa(qryDATAEX.AsDateTime,
                                        QryOrigemDivJur.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                        QryOrigemDivJur.FieldByName('IDINVESTIMENTO').AsInteger,
                                        QryOrigemDivJur.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                        QryOrigemDivJur.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                        High(Integer),
                                        QryOrigemDivJur.FieldByName('IDCUSTODIANTE').AsInteger,
                                        QryOrigemDivJur.FieldByName('IDLOTE').AsString);

            wSaldoQtd       := CtrlRV.BuscaSaldoRV.SaldoQtdTotal;
            wSaldoVlr       := CtrlRV.BuscaSaldoRV.SaldoVlrTotal;
            wSaldoAqui      := CtrlRV.BuscaSaldoRV.SaldoCusto;
            wSaldoIRApu     := CtrlRV.BuscaSaldoRV.SaldoIRApurado;
            wSaldoNormal    := CtrlRV.BuscaSaldoRV.SaldoQtdCC;
            wSaldoCCI       := CtrlRV.BuscaSaldoRV.SaldoQtdCCI;

            if qryPERCENTUAL.AsFloat <> 0 then
            begin
               QryOrigemDivJur.FieldByName('VLRCUSTO').AsFloat       := (wSaldoAqui*(qryPERCENTUAL.AsFloat/100));
               QryOrigemDivJur.FieldByName('VLRCUSTOATUAL').AsFloat  :=  wSaldoAqui;
            end;

            QryOrigemDivJur.Post;

            if qryOrigemDivJurQTDEDIREITO.AsFloat = 0 then
            begin
               QryOrigemDivJur.Next;
               Continue;
            end;

            wIdForCli := 0;
            if QryOrigemDivJurIDCARTEIRAGERENC.IsNull then
               FornecedorCli(QryOrigemDivJurIDCUSTODIANTE.AsInteger,
                             QryOrigemDivJurIDINVESTIMENTO.AsInteger, wIdForCli);

            if  (wSaldoNormal > 0) and
               ((wIdForCli <> wIdForCliAnt) or (wIdPlanPrevAnt <> QryOrigemDivJurIDPLANPREVCTBPATR.AsInteger) or (wNumDocNormal = '')) then
            begin
               wNumDocNormal := 'RV-' + Copy(qryDATAOPER.AsString,9,2) + '/' +
                                             FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                                                                         Copy(qryDATAOPER.AsString,9,2)));
               qryBoleta.Insert;
               qryBoletaIDBOLETA.AsString     := wNumDocNormal;
               qryBoletaSTATUS.AsString       := 'F';
               qryBoletaDATABOLETA.AsDateTime := qryDATAOPER.AsDateTime;
               qryBoletaTIPMOVBOLETA.AsString := 'DTS';
               if wIdForCli > 0 then
                  qryBoletaIDFORCLI.AsInteger := wIdForCli;
               qryBoletaEXCLUIBOLETA.AsString := 'N';
               qryBoleta.Post;
            end;
            if  (wSaldoCCI > 0) and
               ((wIdForCli <> wIdForCliAnt) or (wIdPlanPrevAnt <> QryOrigemDivJurIDPLANPREVCTBPATR.AsInteger) or (wNumDocCCI = '')) then
            begin
               wNumDocCCI := 'RV-' + Copy(qryDATAOPER.AsString,9,2) + '/' +
                                          FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                                                                         Copy(qryDATAOPER.AsString,9,2)));
               qryBoleta.Insert;
               qryBoletaIDBOLETA.AsString     := wNumDocCCI;
               qryBoletaSTATUS.AsString       := 'F';
               qryBoletaDATABOLETA.AsDateTime := qryDATAOPER.AsDateTime;
               qryBoletaTIPMOVBOLETA.AsString := 'DTS';
               if wIdForCli > 0 then
                  qryBoletaIDFORCLI.AsInteger := wIdForCli;
               qryBoletaEXCLUIBOLETA.AsString := 'N';
               qryBoleta.Post;
            end;

            if wIdForCli <> wIdForCliAnt then
               wIdForCliAnt := wIdForCli;

            if wIdPlanPrevAnt <> QryOrigemDivJurIDPLANPREVCTBPATR.AsInteger then
               wIdPlanPrevAnt := QryOrigemDivJurIDPLANPREVCTBPATR.AsInteger;

            // Para I = 1 - Saldo Normal
            //      I = 2 - Saldo CCI
            for I := 1 to 2 do
            begin
               if I = 1 then
               begin
                  // Saldo Normal
                  qryTipoOperProv.Locate('IDTIPOOPERACAO', -70, []);
                  // ProRata saldo Normal
                  wQtdOper := OperComum.Round(QryOrigemDivJurQTDEDIREITO.AsFloat * (OperComum.DivValorZero(wSaldoNormal,wSaldoQtd)),0);
                  wNumDoc  := wNumDocNormal;
               end
               else
               begin
                  // Saldo CCI
                  qryTipoOperProv.Locate('IDTIPOOPERACAO', -10070, []);
                  // ProRata saldo Normal
                  wQtdOper := OperComum.Round(QryOrigemDivJurQTDEDIREITO.AsFloat * (OperComum.DivValorZero(wSaldoCCI,wSaldoQtd)),0);
                  wNumDoc     := wNumDocCCI;
               end;

               if wQtdOper > 0 then
               begin
                  //Al_10
                  qryBoleta.First;
                  if not qryBoleta.Locate('IDBOLETA', wNumDoc, []) then
                     Raise Exception.Create('Não foi possível localizar a boleta ' + wNumDoc);

                  wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

                  if qryTipoOperProvIDTIPOOPERACAO.IsNull then
                     Raise Exception.Create('Tipo de Operação não encontrado.');

                  wPuProporcinal := OperComum.DivValorZero(QryOrigemDivJurVLRLIQ.AsFloat,QryOrigemDivJurQTDEDIREITO.AsFloat);
                  //AL_11
                  wVlrOperacao   := OperComum.Round(wQtdOper*wPuProporcinal,2);

                  qryProvisao.Insert;
                  qryProvisaoIDOPERACAOINVEST.AsInteger    := wIdNovaOperacao;
                  qryProvisaoMOECODIGO.AsInteger           := pRPI.MOECODIGO;
                  qryProvisaoIDMODULO.AsInteger            := Sistema.IdModulo;
                  qryProvisaoEMPRESAPROP.AsInteger         := Sistema.IdEmpresa;
                  qryProvisaoIDINVESTIMENTO.AsInteger      := QryOrigemDivJurIDINVESTIMENTO.AsInteger;
                  qryProvisaoDESCINVESTIMENTO.AsString     := QryOrigemDivJurDESCINVESTIMENTO.AsString;
                  qryProvisaoIDCARTEIRA.AsString           := QryOrigemDivJurIDCARTEIRA.AsString;
                  qryProvisaoIDCARTEIRAINVEST.AsInteger    := QryOrigemDivJurIDCARTEIRAINVEST.AsInteger;
                  if not QryOrigemDivJurIDCARTEIRAGERENC.IsNull then
                     qryProvisaoIDCARTEIRAGERENC.AsInteger := QryOrigemDivJurIDCARTEIRAGERENC.AsInteger
                  else
                     qryProvisaoIDCARTEIRAGERENC.Clear;
                  qryProvisaoDESCCARTINVEST.AsString       := QryOrigemDivJurDESCCARTINVEST.AsString;
                  qryProvisaoIDTIPOINVEST.AsInteger        := 2;
                  qryProvisaoIDTIPOOPERACAO.AsInteger      := qryTipoOperProvIDTIPOOPERACAO.AsInteger;
                  qryProvisaoDESCTIPOOPERACAO.AsString     := qryTipoOperProvDESCTIPOOPERACAO.AsString;
                  qryProvisaoNATUREZAOPERACAO.AsString     := qryTipoOperProvNATUREZAOPERACAO.AsString;
                  if wIdForCli > 0 then
                     qryProvisaoIDFORCLI.AsInteger         := wIdForCli;
                  if not QryOrigemDivJurIDLOTE.IsNull then
                     qryProvisaoIDLOTE.AsString            := QryOrigemDivJurIDLOTE.AsString
                  else
                     qryProvisaoIDLOTE.Clear;
                  if not QryOrigemDivJurIDCUSTODIANTE.IsNull then
                     qryProvisaoIDCUSTODIANTE.AsInteger    := QryOrigemDivJurIDCUSTODIANTE.AsInteger
                  else
                     qryProvisaoIDCUSTODIANTE.Clear;
                  if not QryOrigemDivJurSGLCUSTODIANTE.IsNull then
                     qryProvisaoSGLCUSTODIANTE.AsString    := QryOrigemDivJurSGLCUSTODIANTE.AsString
                  else
                     qryProvisaoSGLCUSTODIANTE.Clear;
                  qryProvisaoIDOPERACAODIREITO.AsInteger   := qryIDOPERACAODIREITO.AsInteger;
                  //AL_20
                  qryProvisaoIDPLANPREVCTBPATR.AsInteger   := QryOrigemDivJurIDPLANPREVCTBPATR.AsInteger;
                  qryProvisaoDATAOPERACAO.AsDateTime       := qryDATAOPER.AsDateTime;
                  qryProvisaoDATAVENCOPER.AsDateTime       := CalcVenc(qryDATAOPER.AsDateTime, qryTipoOperProvVENCIMENTO.AsInteger);
                  qryProvisaoDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
                  qryProvisaoNUMDOCUMENTO.AsString         := wNumDoc;
                  qryProvisaoFLGSTATUSFECHBOL.AsString     := 'F';
                  qryProvisaoFLGSTATUSORDMOV.AsString      := 'L';
                  qryProvisaoQTDEOPERACAO.AsFloat          := wQtdOper;
                  qryProvisaoPRECOUNITOPERACAO.AsFloat     := qryDIVPORACAO.AsFloat;
                  qryProvisaoVLROPERACAO.AsFloat           := wVlrOperacao;
                  qryProvisaoVLRIR.AsFloat                 := QryOrigemDivJurIR.AsFloat;
                  qryProvisaoVLRREMUNERACAO.AsFloat        := QryOrigemDivJurVLRREMUNERACAO.AsFloat;
                  qryProvisaoVLRIRREMUNER.AsFloat          := QryOrigemDivJurVLRIRREMUNERACAO.AsFloat;
                  qryProvisaoVLRLIQUIDO.AsFloat            := wVlrOperacao;
                  qryProvisaoPERCENTUAL.AsFloat            := 0;
                  //Al_2
                  qryProvisaoORIGDEST.AsString             := 'D';
                  if not QryOrigemDivJurIDMOTIVOBLOQUEIO.IsNull then
                     qryProvisaoIDMOTIVOBLOQUEIO.AsInteger := QryOrigemDivJurIDMOTIVOBLOQUEIO.AsInteger
                  else
                     qryProvisaoIDMOTIVOBLOQUEIO.Clear;
                  if not QryOrigemDivJurSIGLAMOTBLOQ.IsNull then
                     qryProvisaoSIGLAMOTBLOQ.AsString      := QryOrigemDivJurSIGLAMOTBLOQ.AsString
                  else
                     qryProvisaoSIGLAMOTBLOQ.Clear;
                  qryProvisaoIDOPERCUSTODIA.Clear;
                  qryProvisaoALTERADO.AsString := 'S';
                  qryProvisao.Post;
               end;
            end;
            QryOrigemDivJur.Next;
            fraMens.Incrementa;
         end;
         Result := True;
      except
         on E: Exception do
         begin
            MsgDlg('Houve um problema no Provisionamento desta AGE' + #13+
                   E.Message,'Mensagem do Sistema ', mtWarning, [mbOK], 0);
            bbtnCancelarDet.Click;
            bbtnCancelar.Click;
            Result := False;
         end;
      end;
   finally
      qryProvisao.EnableControls;
      qryRecebimento.EnableControls;
      QryOrigemDivJur.Close;
      fraMens.Apaga;
      CmeDetalhe.AtualizaBotoes(Self);
   end;
end;

function TfrmCadAnuncioSubscricao.GeraRecebimentos: Boolean;
var wIdNovaOperacao, wIdForCli, wIdForCliAnt, wIdPlanPrevAnt, iTipoOperAnt : Integer;
    wNumDocNormal, wNumDocCCI, wNumDoc, wNumDocAnt, sBol, sDataOperAnt: String;
begin
   try
      try
         Result := False;
         qryProvisao.DisableControls;
         qryRecebimento.DisableControls;

         // Exclui as Provisões Anteriores
         qryRecebimento.First;
         while not qryRecebimento.Eof do
         begin
            sBol := qryRecebimentoNUMDOCUMENTO.AsString;
            if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
               Raise Exception.Create('Não é possível Excluir os Recebimentos da Boleta ' + sBol);
            while ((not qryRecebimento.Eof) and (sBol = qryRecebimentoNUMDOCUMENTO.AsString)) do
            begin
               qryRecebimento.Next;
            end;
         end;
         SelDetRec(qryIDOPERACAODIREITO.AsInteger);

         // Inicia a geração dos recebimentos a partir das provisões
         // Para cada provisão é gerado um recebimento equivalente
         fraMens.Mostra;
         fraMens.Max := qryProvisao.RecordCount * 2;
         qryProvisao.First;
         wNumDocAnt := '';

         while not qryProvisao.Eof do
         begin
            fraMens.Mes := 'Processando: ' + qryProvisaoDESCCARTINVEST.AsString +  #13 +
                           OperComum.IIF(qryProvisaoSGLCUSTODIANTE.IsNull, '', ' Custodia: ' + qryProvisaoSGLCUSTODIANTE.AsString) +
                           OperComum.IIF(qryProvisaoSIGLAMOTBLOQ.IsNull, '', ' Bloqueio: ' + qryProvisaoSIGLAMOTBLOQ.AsString);

            //AL_23
            //Caso o parametro de carteria gerencial for N (Não) ou estiver Nulo e a data da operação for
            // maior que a data de encerramento da carteria gerencial, NÃO gera o recebimento
            if (((pRPI.FLGCARTGERENC = 'N') or (pRPI.FLGCARTGERENC = '')) and (qryDATACOM.AsDateTime > pRPI.DATAMOVCDBLIB)) and
               (not qryProvisaoIDCARTEIRAGERENC.IsNull) then
            begin
               qryProvisao.Next;
               fraMens.Incrementa;
               Continue;
            end;

            qryTipoOperRec.First;
            if qryProvisaoIDTIPOOPERACAO.AsInteger = -70 then
               // Saldo Normal
               qryTipoOperRec.Locate('IDTIPOOPERACAO', qryTipoOperacaoIDTIPOOPERACAO.AsInteger, [])
            else
               // Saldo CCI
               qryTipoOperRec.Locate('IDTIPOOPERACAO', (qryTipoOperacaoIDTIPOOPERACAO.AsInteger + 10000), []);

            // Se não encontrou o tipo de operação correto...
            if qryTipoOperRecIDTIPOOPERACAO.IsNull then
               Raise Exception.Create('Tipo de Operação não encontrado.');

            wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

            // Grava o Recebimento
            qryRecebimento.Insert;
            qryRecebimentoIDOPERACAOINVEST.AsInteger    := wIdNovaOperacao;
            qryRecebimentoIDOPERACAOORIGEM.AsInteger    := qryProvisaoIDOPERACAOINVEST.AsInteger;
            qryRecebimentoMOECODIGO.AsInteger           := pRPI.MOECODIGO;
            qryRecebimentoIDMODULO.AsInteger            := Sistema.IdModulo;
            qryRecebimentoEMPRESAPROP.AsInteger         := Sistema.IdEmpresa;
            qryRecebimentoIDINVESTIMENTO.AsInteger      := qryProvisaoIDINVESTIMENTO.AsInteger;
            qryRecebimentoDESCINVESTIMENTO.AsString     := qryProvisaoDESCINVESTIMENTO.AsString;
            qryRecebimentoIDCARTEIRA.AsString           := qryProvisaoIDCARTEIRA.AsString;
            qryRecebimentoIDCARTEIRAINVEST.AsInteger    := qryProvisaoIDCARTEIRAINVEST.AsInteger;
            if not qryProvisaoIDCARTEIRAGERENC.IsNull then
               qryRecebimentoIDCARTEIRAGERENC.AsInteger := qryProvisaoIDCARTEIRAGERENC.AsInteger
            else
               qryRecebimentoIDCARTEIRAGERENC.Clear;
            qryRecebimentoDESCCARTINVEST.AsString       := qryProvisaoDESCCARTINVEST.AsString;
            qryRecebimentoIDTIPOINVEST.AsInteger        := 2;

            If Not qryTipoOperRec.Locate('FLGCONTAINVEST', qryProvisaoFLGCONTAINVEST.AsInteger, []) then
            begin
               If (MsgDlg('Não foi encontrado o Tipo de Operação correto para essa operação.'#13+
                          'Continua?', 'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo)  Then
                  Raise Exception.Create('Verificar a parametrização do Tipo de Operação');
            end;

            qryRecebimentoIDTIPOOPERACAO.AsInteger      := qryTipoOperRecIDTIPOOPERACAO.AsInteger;

            qryRecebimentoDESCTIPOOPERACAO.AsString     := qryTipoOperRecDESCTIPOOPERACAO.AsString;
            qryRecebimentoNATUREZAOPERACAO.AsString     := qryTipoOperRecNATUREZAOPERACAO.AsString;
            if not qryProvisaoIDLOTE.IsNull then
               qryRecebimentoIDLOTE.AsString            := qryProvisaoIDLOTE.AsString
            else
               qryRecebimentoIDLOTE.Clear;
            if not qryProvisaoIDCUSTODIANTE.IsNull then
               qryRecebimentoIDCUSTODIANTE.AsInteger    := qryProvisaoIDCUSTODIANTE.AsInteger
            else
               qryRecebimentoIDCUSTODIANTE.Clear;
            if not qryProvisaoSGLCUSTODIANTE.IsNull then
               qryRecebimentoSGLCUSTODIANTE.AsString    := qryProvisaoSGLCUSTODIANTE.AsString
            else
               qryRecebimentoSGLCUSTODIANTE.Clear;
            qryRecebimentoIDOPERACAODIREITO.AsInteger   := qryIDOPERACAODIREITO.AsInteger;
            //AL_20
            if qryProvisaoIDFORCLI.AsInteger > 0 then
               qryRecebimentoIDFORCLI.AsInteger         := qryProvisaoIDFORCLI.AsInteger;
            qryRecebimentoIDPLANPREVCTBPATR.AsInteger   := qryProvisaoIDPLANPREVCTBPATR.AsInteger;
            qryRecebimentoPLANPRVCONTABPATRO.AsString   := qryProvisaoPLANPRVCONTABPATRO.AsString;
            qryRecebimentoDATAOPERACAO.AsDateTime       := qryDATACOM.AsDateTime;
            qryRecebimentoDATAVENCOPER.AsDateTime       := CalcVenc(qryDATACOM.AsDateTime, qryTipoOperRecVENCIMENTO.AsInteger);
            qryRecebimentoDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
            qryRecebimentoFLGSTATUSFECHBOL.AsString     := 'F';
            qryRecebimentoFLGSTATUSORDMOV.AsString      := 'L';
            qryRecebimentoQTDEOPERACAO.AsFloat          := qryProvisaoQTDEOPERACAO.AsFloat;
            qryRecebimentoPRECOUNITOPERACAO.AsFloat     := qryProvisaoPRECOUNITOPERACAO.AsFloat;
            qryRecebimentoVLROPERACAO.AsFloat           := qryProvisaoVLROPERACAO.AsFloat;
            qryRecebimentoVLRIR.AsFloat                 := qryProvisaoVLRIR.AsFloat;
            qryRecebimentoVLRREMUNERACAO.AsFloat        := qryProvisaoVLRREMUNERACAO.AsFloat;
            qryRecebimentoVLRIRREMUNER.AsFloat          := qryProvisaoVLRIRREMUNER.AsFloat;
            qryRecebimentoVLRLIQUIDO.AsFloat            := qryProvisaoVLRLIQUIDO.AsFloat;
            qryRecebimentoPERCENTUAL.AsFloat            := 0;
            //Al_2
            qryRecebimentoORIGDEST.AsString             := 'D';
            if not qryProvisaoIDMOTIVOBLOQUEIO.IsNull then
               qryRecebimentoIDMOTIVOBLOQUEIO.AsInteger := qryProvisaoIDMOTIVOBLOQUEIO.AsInteger
            else
               qryRecebimentoIDMOTIVOBLOQUEIO.Clear;
            if not qryProvisaoSIGLAMOTBLOQ.IsNull then
               qryRecebimentoSIGLAMOTBLOQ.AsString      := qryProvisaoSIGLAMOTBLOQ.AsString
            else
               qryRecebimentoSIGLAMOTBLOQ.Clear;
            qryRecebimentoIDOPERCUSTODIA.Clear;
            qryRecebimentoALTERADO.AsString := 'S';
            qryRecebimento.Post;

            qryProvisao.Next;
            fraMens.Incrementa;
         end;

         fraMens.Mes := 'Gerando Boletas de Recebimento' + #13 +
                        'Gravando Boletas';

         //AL_20
         qryRecebimento.First;
         while not qryRecebimento.Eof do
         begin
            // Se for parcial, o documento da operação anterior já esta preenchido
            if qryRecebimentoNUMDOCUMENTO.IsNull then
            begin
               if (wIdForCliAnt   <> qryRecebimento.FieldByName('IDFORCLI').AsInteger) or
                  (wIdPlanPrevAnt <> qryRecebimento.FieldByName('IDPLANPREVCTBPATR').AsInteger) or
                  (sDataOperAnt   <> qryRecebimento.FieldByName('DATAOPERACAO').AsString) or
                  (iTipoOperAnt   <> qryRecebimento.FieldByName('IDTIPOOPERACAO').AsInteger) then
               begin
                  wNumDoc := 'RV-' + Copy(qryRecebimentoDATAOPERACAO.AsString,9,2) + '/' +
                                          FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' + Copy(qryRecebimentoDATAOPERACAO.AsString,9,2)));

                  wIdForCli := qryRecebimento.FieldByName('IDFORCLI').AsInteger;

                  qryBoleta.Insert;
                  qryBoletaIDBOLETA.AsString     := wNumDoc;
                  qryBoletaSTATUS.AsString       := 'F';
                  qryBoletaDATABOLETA.AsDateTime := qryDATACOM.AsDateTime;
                  qryBoletaTIPMOVBOLETA.AsString := 'DTS';
                  if wIdForCli > 0 then
                     qryBoletaIDFORCLI.AsInteger := wIdForCli;
                  qryBoletaEXCLUIBOLETA.AsString := 'N';
                  qryBoleta.Post;

                  // Atualiza as variáveis de trabalho
                  wIdForCliAnt   := qryRecebimento.FieldByName('IDFORCLI').AsInteger;
                  wIdPlanPrevAnt := qryRecebimento.FieldByName('IDPLANPREVCTBPATR').AsInteger;
                  sDataOperAnt   := qryRecebimento.FieldByName('DATAOPERACAO').AsString;
                  iTipoOperAnt   := qryRecebimento.FieldByName('IDTIPOOPERACAO').AsInteger;
               end;

               qryRecebimento.Edit;
               qryRecebimentoNUMDOCUMENTO.AsString := wNumDoc;
               qryRecebimento.Post;
            end;
            qryRecebimento.Next;
            fraMens.Incrementa;
         end;

         Result := True;
         //AL_24
         fraMens.Mes := 'Processo concluído com sucesso';

      except
         on E: Exception do
         begin
            MsgDlg('Houve um problema na Geração dos Recebimentos desta AGE' + #13+
                   E.Message,'Mensagem do Sistema ', mtWarning, [mbOK], 0);
            bbtnCancelarDet.Click;
            bbtnCancelar.Click;
            Result := False;
         end;
      end;
   finally
      qryProvisao.First;
      qryProvisao.EnableControls;
      qryRecebimento.First;
      qryRecebimento.EnableControls;
      fraMens.Apaga;
      CmeDetalhe.AtualizaBotoes(Self);
   end;
end;


Function TfrmCadAnuncioSubscricao.BuscaBoleta(dData: TDateTime;
                                       iCarteira, iCartGer, iCustodiante, iMotBloq, iTipoOper: Integer): String;
var qrySelBoleta: TwwQuery;
    wIdForCli: Integer;
    sTipoMov: String;
begin
   Result := '';
   if (dData = 0) or (iCarteira = 0) or (iTipoOper = 0) then
      Exit;
   if (iCartGer <> 0) and ((iCustodiante = 0) or (iMotBloq = 0)) then
      Exit;
   try
      // AL_11
      qrySelBoleta := TwwQuery.Create(Self);
      qrySelBoleta.DatabaseName := 'BaseDados';
      with qrySelBoleta, OperComum do
      begin
         SQL.Add('SELECT DISTINCT NUMDOCUMENTO ');
         SQL.Add('FROM OPERACAOINVEST ');
         SQL.Add('WHERE IDOPERACAODIREITO = ' + qryIDOPERACAODIREITO.AsString + ' ');
         SQL.Add('  AND DATAOPERACAO = TO_DATE(' + QuotedStr(DateToStr(dData)) + ', ' + QuotedStr('dd/mm/yyyy') + ') ');
         SQL.Add('  AND IDCUSTODIANTE ' + IIF(iCustodiante = 0, ' IS NULL', ' = ' + IntToStr(iCustodiante)) + ' ');
         SQL.Add('  AND IDTIPOOPERACAO = ' + IntToStr(iTipoOper) + ' ');
         Open;
         if not IsEmpty then
            Result := FieldByName('NUMDOCUMENTO').AsString
         else
         begin
            // Cria nova boleta
            if iTipoOper < 0 then
            begin
               //Provisão
               sTipoMov := 'DTS';
               FornecedorCli(iCustodiante, qryDetalheIDINVESTIMENTO.AsInteger, wIdForCli);
            end
            else
            begin
               // Recebimento
               sTipoMov := 'DTS';
               FornecedorCli(iCustodiante, qryDetalheIDINVESTIMENTO.AsInteger, wIdForCli);
            end;

            Result := 'RV-' + Copy(DateToStr(dData),9,2) + '/' +
                                   FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                                                                      Copy(DateToStr(dData),9,2)));
            qryBoleta.Insert;
            qryBoletaIDBOLETA.AsString     := Result;
            qryBoletaSTATUS.AsString       := 'F';
            qryBoletaDATABOLETA.AsDateTime := dData;
            qryBoletaTIPMOVBOLETA.AsString := sTipoMov;
            qryBoletaIDFORCLI.AsInteger    := wIdForCli;
            qryBoletaEXCLUIBOLETA.AsString := 'N';
            qryBoleta.Post;
         end;
      end;
   finally
      qrySelBoleta.Close;
      qrySelBoleta.Free;
   end;
end;

function TfrmCadAnuncioSubscricao.CalcVenc(dDataOper: TDateTime; iPrazo: Integer): TDateTime;
begin
   Result := DiasUteisInv.SomaDiasUteis(dDataOper, iPrazo,-1,1,'',True,False,False)
end;

function TfrmCadAnuncioSubscricao.AchaProvisao(iTipoOper, iCartInvest, iCartGerenc,
                                        iCustodiante, iMotBloq: Integer): Boolean;
var iTipoOperacao: Integer;
begin
   Result := True;
   with OperComum do
   begin
      // Procura uma Provisão com os mesmos dados
      iTipoOperacao := OperComum.IIF(iTipoOper > 10000, -10070, -70);
      qryProvisao.First;
      while not qryProvisao.Eof do
      begin
         if (qryProvisaoIDTIPOOPERACAO.AsInteger   = iTipoOperacao) and
            (qryProvisaoIDCARTEIRAINVEST.AsInteger = iCartInvest) and
            (qryProvisaoIDCARTEIRAGERENC.AsInteger = iCartGerenc) and
            (qryProvisaoIDCUSTODIANTE.AsInteger    = iCustodiante) and
            (qryProvisaoIDMOTIVOBLOQUEIO.AsInteger = iMotBloq) then
            Break;

         //Al_7
         if iMotBloq = -1 then
         begin
            if (qryProvisaoIDTIPOOPERACAO.AsInteger   = iTipoOperacao) and
               (qryProvisaoIDCARTEIRAINVEST.AsInteger = iCartInvest)   and
               (qryProvisaoIDCARTEIRAGERENC.AsInteger = iCartGerenc)   and
               (qryProvisaoIDCUSTODIANTE.AsInteger    = iCustodiante)  then
               Break;
         end;

         qryProvisao.Next;
      end;
      // Se não achou, a query está em EOF (Não fez o Break)
      if qryProvisao.Eof then
         Result := False;
   end;
end;

procedure TfrmCadAnuncioSubscricao.bbtnGeraRecebimentoClick(Sender: TObject);
begin
   inherited;
   try
      if pgctrlDetalhe.ActivePage = tbsRecebimento then
      begin
         with qryRecebimento, OperComum do
         begin
            if not IsEmpty then
            begin
               if InvMsgBox('Para Regerar os Recebimentos é Necessário Excluir as Operações Atuais',
                            mtConfirmation, 'Mensagem do Sistema',
                            [mbYes, mbCancel], 'Continua;Cancela') = mrCancel then
                  Exit;
            end;
            GeraRecebimentos;
         end;
      end
      else
      begin
         with qryProvisao, OperComum do
         begin
            if not IsEmpty then
            begin
               if InvMsgBox('Para Regerar os Anuncios é Necessário Excluir as Operações Atuais',
                            mtConfirmation, 'Mensagem do Sistema',
                            [mbYes, mbCancel], 'Continua;Cancela') = mrCancel then
                  Exit;
            end;
            ProvisionaOper;
         end;
      end;
   finally
      bbtnGeraRecebimento.Down := False;
   end;
end;

procedure TfrmCadAnuncioSubscricao.qryRecebimentoAfterScroll(DataSet: TDataSet);
begin
   inherited;
   qryCarteiraRec.Locate('IDCARTEIRAINVEST;IDCARTEIRAGERENC',
                          VarArrayOf([qryRecebimentoIDCARTEIRAINVEST.AsVariant,
                                      qryRecebimentoIDCARTEIRAGERENC.AsVariant]),[])
end;

procedure TfrmCadAnuncioSubscricao.dsStateChange(Sender: TObject);
begin
   inherited;
   bbtnGeraRecebimento.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                   (not qryDetalhe.IsEmpty) and
                                   (not qryProvisao.IsEmpty));
end;

procedure TfrmCadAnuncioSubscricao.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;
   Sel(qryIDOPERACAODIREITO.AsInteger, False);
   //Al_12
   HabilitaCamposDireito(True);
end;

procedure TfrmCadAnuncioSubscricao.dsDetStateChange(Sender: TObject);
begin
   inherited;
   HabDetRec((qryRecebimento.State = dsInsert));
   dbrQtdRec.Enabled    := (qryRecebimento.State in [dsInsert, dsEdit]);
   dbrVlrRec.Enabled    := (qryRecebimento.State in [dsInsert, dsEdit]);
   dbrPU.Enabled        := (qryRecebimento.State in [dsInsert, dsEdit]);
   dbdDataOperacaoRec.Enabled := (qryRecebimento.State in [dsInsert, dsEdit]);
end;

procedure TfrmCadAnuncioSubscricao.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   lblCapCarteira.Visible := False;
   lblCapGerenc.Visible := False;
   lblCapDif.Visible := False;
   lblVlrCarteira.Visible := False;
   lblVlrGerenc.Visible := False;
   lblVlrDif.Visible := False;
end;

procedure TfrmCadAnuncioSubscricao.bbtnCancelarDetClick(Sender: TObject);
begin
   inherited;
   lblCapCarteira.Visible := False;
   lblCapGerenc.Visible := False;
   lblCapDif.Visible := False;
   lblVlrCarteira.Visible := False;
   lblVlrGerenc.Visible := False;
   lblVlrDif.Visible := False;
end;

procedure TfrmCadAnuncioSubscricao.dblCarteiraProvisaoExit(Sender: TObject);
begin
  inherited;
  // Para Carteiras Próprias, o defaul é saldo liberado
  if Trim(dblMotivoBloqueioProv.Text) = '' then
  begin
     if (qryCarteiraProvIDCARTEIRAGERENC.IsNull) and (qryProvisao.State = dsInsert) then
        qryProvisaoIDMOTIVOBLOQUEIO.AsInteger := -1;
  end;
  if Trim(dblCarteiraProvisao.Text) <> '' then
  begin
     qryProvisaoIDCARTEIRAINVEST.AsInteger := qryCarteiraProvIDCARTEIRAINVEST.AsInteger;
     if not qryCarteiraProvIDCARTEIRAGERENC.IsNull then
        qryProvisaoIDCARTEIRAGERENC.AsInteger := qryCarteiraProvIDCARTEIRAGERENC.AsInteger
     else
        qryProvisaoIDCARTEIRAGERENC.Clear;
  end;
end;

procedure TfrmCadAnuncioSubscricao.dblCarteiraRecExit(Sender: TObject);
begin
  inherited;
  // Para Carteiras Próprias, o defaul é saldo liberado
  if Trim(dblMotivoBloqueioRec.Text) = '' then
  begin
     if (qryCarteiraRecIDCARTEIRAGERENC.IsNull) and (qryRecebimento.State = dsInsert) then
        qryRecebimentoIDMOTIVOBLOQUEIO.AsInteger := -1;
  end;
  if Trim(dblCarteiraRec.Text) <> '' then
  begin
     qryRecebimentoIDCARTEIRAINVEST.AsInteger := qryCarteiraRecIDCARTEIRAINVEST.AsInteger;
     if not qryCarteiraRecIDCARTEIRAGERENC.IsNull then
        qryRecebimentoIDCARTEIRAGERENC.AsInteger := qryCarteiraRecIDCARTEIRAGERENC.AsInteger
     else
        qryRecebimentoIDCARTEIRAGERENC.Clear;
  end;
end;

procedure TfrmCadAnuncioSubscricao.dbrVlrIRProvExit(Sender: TObject);
begin
   inherited;
   if qryIRLITIGIO.AsString  = 'S' then
      qryProvisaoVLRLIQUIDO.AsFloat := (dbrVlrProv.Value + dbrVlrRemProv.Value)
   else
      qryProvisaoVLRLIQUIDO.AsFloat := (dbrVlrProv.Value + dbrVlrRemProv.Value) - dbrVlrIRProv.Value;
end;

procedure TfrmCadAnuncioSubscricao.qryProvisaoAfterScroll(DataSet: TDataSet);
begin
   inherited;
   if pgctrlDetalhe.ActivePage = tbsProvisao then
   begin
      lblCapCarteira.Visible := False;
      lblVlrCarteira.Visible := False;
      lblCapGerenc.Visible := False;
      lblVlrGerenc.Visible := False;
      // Se os controles da query estiverem habilitados
      if not DataSet.ControlsDisabled then
      begin
         // Mostra no Frame a diferença entre Quantidade Provisionada e a Quantidade Exercida
         if (DataSet.FieldByName('QTDEOPERACAO').AsFloat - DataSet.FieldByName('QTDEEXERCIDA').AsFloat) > 0 then
         begin
            lblCapDif.Caption := 'Quantidade não exercida: ';
            lblVlrDif.Caption := FormatFloat('#,##0', (DataSet.FieldByName('QTDEOPERACAO').AsFloat - DataSet.FieldByName('QTDEEXERCIDA').AsFloat));
            lblCapDif.Visible := True;
            lblVlrDif.Visible := True;
         end
         else if (DataSet.FieldByName('QTDEOPERACAO').AsFloat - DataSet.FieldByName('QTDEEXERCIDA').AsFloat) < 0 then
         begin
            lblCapDif.Caption := 'Quantidade excedente: ';
            lblVlrDif.Caption := FormatFloat('#,##0', Abs(DataSet.FieldByName('QTDEOPERACAO').AsFloat - DataSet.FieldByName('QTDEEXERCIDA').AsFloat));
            lblCapDif.Visible := True;
            lblVlrDif.Visible := True;
         end
         else
         begin
            lblCapDif.Caption := 'Diferença:  ';
            lblVlrDif.Caption := FormatFloat('#,##0', 0);
            lblCapDif.Visible := False;
            lblVlrDif.Visible := False;
         end;
      end;
   end;
end;

procedure TfrmCadAnuncioSubscricao.CmeDetalheEdit(Sender: TObject);
begin
   inherited;
   // Controle de Quantidade alterada no recebimento
   if pgctrlDetalhe.ActivePage = tbsRecebimento then
      wQtdOperAnt := qryRecebimentoQTDEOPERACAO.AsFloat;
end;


procedure TfrmCadAnuncioSubscricao.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if qryDetalhe.IsEmpty then
     dblEmissor.Enabled := True
  else
     dblEmissor.Enabled := False;

  if qryProvisao.IsEmpty then
  begin
     dblTipoOperacao.Enabled := True;
     dbeDivPorAcao.Enabled := True;
     dbePercentual.Enabled := True;
     dbdAGE.Enabled := True;
     dbdEX.Enabled := True;
     dbdOper.Enabled := True;
     dbcIsentoIr.Enabled := True;
     dbcIRLitigio.Enabled := True;
  end
  else
  begin
     dblTipoOperacao.Enabled := False;
     dbeDivPorAcao.Enabled := False;
     dbePercentual.Enabled := False;
     dbdAGE.Enabled := False;
     dbdEX.Enabled := False;
     dbdOper.Enabled := False;
     dbcIsentoIr.Enabled := False;
     dbcIRLitigio.Enabled := False;
  end;

  if qryRecebimento.IsEmpty then
     dbdCOM.Enabled := True
  else
     dbdCOM.Enabled := False;
end;

procedure TfrmCadAnuncioSubscricao.dbdDataOperacaoRecExit(Sender: TObject);
var
    wNumDocNormal : String;
begin
  inherited;

   if qryRecebimento.State in [dsEdit, dsInsert] then
   begin
      qryRecebimentoDATAVENCOPER.AsDateTime := CalcVenc(dbdDataOperacaoRec.DateTime, qryTipoOperRecVENCIMENTO.AsInteger);

      wNumDocNormal := 'RV-' + Copy(qryRecebimentoDATAOPERACAO.AsString,9,2) + '/' +
                                FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                                            Copy(qryRecebimentoDATAOPERACAO.AsString,9,2)));

      qryRecebimentoNUMDOCUMENTO.AsString := wNumDocNormal;
   end;
end;

procedure TfrmCadAnuncioSubscricao.qryDetalheAfterPost(DataSet: TDataSet);
begin
  inherited;
   // Como o evento AfterConfirma do cadastro detalhe não esta programado no padrão
   // uso o evento AfterPost da query de inclusão do Investimento
end;

procedure TfrmCadAnuncioSubscricao.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
   tbcDetalheChange(Sender);
end;

procedure TfrmCadAnuncioSubscricao.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
   //Al_10
   qryBoleta.First;
   qryBoleta.Locate('IDBOLETA', qryRecebimentoNUMDOCUMENTO.AsString, []);
end;

// AL_11
procedure TfrmCadAnuncioSubscricao.CmeDetalheApplyInsert(sender: TObject; var Accept: Boolean);
var sDataLanc: String;
begin
   Accept     := False;
   sDataLanc := '';

   if pgctrlDetalhe.ActivePage = tbsDet then
   begin
      if Trim(dblInvestimento.Text) = '' then
      begin
         MsgDlg('Selecione um Investimento.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblInvestimento.CanFocus then
            dblInvestimento.SetFocus;
         Exit;
      end;
   end
   else if pgctrlDetalhe.ActivePage = tbsProvisao then
   begin
      if Trim(dblTipoOperProv.Text) = '' then
      begin
         MsgDlg('Não foi selecionado um tipo de operação para este Anúncio,'+#13+
                'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblTipoOperProv.CanFocus then
            dblTipoOperProv.SetFocus;
         Exit;
      end
      else
      if Trim(dblCarteiraProvisao.Text) = '' then
      begin
         MsgDlg('Não foi selecionada uma Carteira para este Anúncio,'+#13+
                'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblCarteiraProvisao.CanFocus then
            dblCarteiraProvisao.SetFocus;
         Exit;
      end
      else
      if (Trim(dblCustodianteProv.Text) = '') and (qryCarteiraProvIDCARTEIRAGERENC.IsNull) then
      begin
         MsgDlg('Não foi selecionado um Custodiante para este Anúncio,'+#13+
                'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblCustodianteProv.CanFocus then
            dblCustodianteProv.SetFocus;
         Exit;
      end
      else
      if dbrQtdProv.Value = 0 then
      begin
         MsgDlg('Não foi informado uma Quantidade para este Anúncio,'+#13+
                'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dbrQtdProv.CanFocus then
            dbrQtdProv.SetFocus;
         Exit;
      end
      else
      if dbrVlrProv.Value = 0 then
      begin
         MsgDlg('Não foi informado uma Valor para este Anúncio,'+#13+
                'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dbrVlrProv.CanFocus then
            dbrVlrProv.SetFocus;
         Exit;
      end
      else
      if dbrVlrLiqProv.Value = 0 then
      begin
         MsgDlg('Não foi calculado um Valor Líquido para este Anúncio,'+#13+
                'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dbrVlrLiqProv.CanFocus then
            dbrVlrLiqProv.SetFocus;
         Exit;
      end;
   end
   else if pgctrlDetalhe.ActivePage = tbsRecebimento then
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
      if dbrVlrRec.Value = 0 then
      begin
         MsgDlg('Não foi informado uma Valor para esta Operação,'+#13+
                'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dbrVlrRec.CanFocus then
            dbrVlrRec.SetFocus;
         Exit;
      end
      else
      begin
         if not AchaProvisao(qryTipoOperRecIDTIPOOPERACAO.AsInteger,
                             qryRecebimentoIDCARTEIRAINVEST.AsInteger,
                             qryRecebimentoIDCARTEIRAGERENC.AsInteger,
                             qryRecebimentoIDCUSTODIANTE.AsInteger,
                             OperComum.IIF(Trim(dblMotivoBloqueioRec.Text) = '', -1, qryRecebimentoIDMOTIVOBLOQUEIO.AsInteger)) then
         begin
            If (MsgDlg('Não foi possível encontrar um Anúncio pra este Recebimento.'#13+
                       'Continua?', 'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo)  Then
               Exit;
         end;

         // Atualiza o ID da Operação de Provisão Original
         qryRecebimentoIDOPERACAOORIGEM.AsInteger := qryProvisaoIDOPERACAOINVEST.AsInteger;

      end;
      sDataLanc := qryRecebimentoDATAOPERACAO.AsString;
   end;

   if ((qryTipoOperacaoFLGGERACONTAB.AsInteger > 0) or (qryTipoOperacaoFLGGERACAPCAR.AsInteger > 0)) and
      (sDataLanc <> '')  then
   begin
      //AL_18
      if not CtrlInvContab.TestaPeriodo(sDataLanc, 2) then
      begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         Exit;
      end;
   end;
   Accept := True;
   inherited;
end;

//Al_12
procedure TfrmCadAnuncioSubscricao.HabilitaCamposDireito(bVisivel : Boolean);
begin
   If Trim(dblTipoOperacao.Text) <> '' then
   begin
      If (qryTipoOperacao.FieldbyName('FLGISENTOIR').AsString = 'S') And (bVisivel) Then
         dbcIsentoIr.Enabled  := True
      Else
         dbcIsentoIr.Enabled  := False;

      If (qryTipoOperacao.FieldbyName('FLGGRAVAIRLITIGIO').AsString = 'S') And (bVisivel) Then
         dbcIRLitigio.Enabled := True
      Else
         dbcIRLitigio.Enabled := False;
   end
   Else
   begin
      dbcIsentoIr.Enabled     := True;
      dbcIRLitigio.Enabled    := True;
   end;
end;

//AL_20
procedure TfrmCadAnuncioSubscricao.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlRV := TCtrlRendaVariavel.Create;
   CtrlRV.InitializeAs(Padroes);
end;

//AL_20
procedure TfrmCadAnuncioSubscricao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
   FreeAndNil(CtrlRV);
end;

end.
