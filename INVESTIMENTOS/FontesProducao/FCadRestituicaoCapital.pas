//******************************************************************************
// Rotina     : GeraRecebimentos
// SOL        : 104359
// Kintana    : 467032
// Data       : 09/01/2008
// Responsável: Renan Cristiano
// Descrição  : Ajuste na data de recebimento da boleta, recebendo pelo campo DATACOM
//******************************************************************************
// Data      : 20/06/2008
// Código    : AL_22
// Pendencia : 27453
// SOL       : 79620
// Desc      : Ajuste na contabilização e no lançamento financeiro da operação
//******************************************************************************
// Data      : 19/07/2007
// Código    : AL_21
// Pendencia : 25194
// SOL       : 53035
// Desc      : Implementação de critica para NÃO gerar o recebimento para
//              Carteiras Gerenciais conforme parametrização
//******************************************************************************
// Data      : 01/06/2007
// Código    : AL_20
// Pendencia : 24388
// SOL       : 53035
// Desc      : Acerto na filtragem das Carteiras para não trazer Carteiras Gerenciais
//             quando Parâmetro de integração com Carteira Gerencial estiver desmarcado.
//             (QrySaldoOrigem, qryOrigem, qryDestino, qryCarteiraRec e qryCarteiraOrig)
//******************************************************************************
// Data      : 05/04/2007
// Código    : AL_19
// Pendencia : 22977
// SOL       :
// Desc      : Implmentação de segregação de plano na alimentacarteira
//******************************************************************************
// Data      : 22/03/2006
// Código    : AL_18
// Pendencia : 24841
// SOL       : 56265
// Desc      : Acerto na tipo de Boleta para DRS
//******************************************************************************
// Data      : 24/10/2006
// Código    : AL_17
// Pendencia : 22977
// SOL       :
// Desc      : Segregação de Planos
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_16
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_15
// Pendencia:
// SOL      :
// Desc     : Retirada do Saldo CCI de Custódia da BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_14
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_13
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//********************************************************************************************************
//Data      : 08/11/2005
//Codigo    : AL_12
//Descr.    : Acerto na duplicação do lançamento (Dois Inhiriteds)
//********************************************************************************************************
//Data      : 07/11/2005
//Codigo    : AL_11
//Descr.    : Acerto na crítica de PU que estava testando como > que 0
//********************************************************************************************************
//Data      : 20/10/2005
//Codigo    : AL_10
//Descr.    : Acerto no Saida de Componentes
//********************************************************************************************************
//Data      : 19/10/2005
//Codigo    : AL_9
//Descr.    : Acerto para utilizar a DATAEX(Data Base) e não a DATACOM(Data Prevista)
//********************************************************************************************************
//Data      : 18/10/2005
//Codigo    : AL_8
//Descr.    : Ajustes gerais de acordo com as solicitações da Funcef (PAS e DFM)
//*****************************************************************************
//Data	    : 13/10/2005
//Código    : Al_7
//Motivo(S) : Implementação do Recebimento Fracioando
//*****************************************************************************
//Data	    : 24/05/2005
//Código    : Al_6
//Motivo(S) : Implementação do teste de período contabil em 3 camadas
//            Substituição da rotina BeforeConfirma pela ApplyInsert
//            DFM alterado
//*****************************************************************************
//Data	    : 23/05/2005
//Código    : Al_05
//Motivo(S) : Implementada a rotina que marca a boleta para deleção e tratado a
//            alteração da data para criar uma nova boleta
//*****************************************************************************
//Data	    : 23/05/2005
//Código    : Al_04
//Motivo(S) : A data da operação é a DATACOM(data prevista do cadastro da AGE)
//*****************************************************************************
//Data	    : 23/05/2005
//Código    : Al_03
//Motivo(S) : Habilitado o botão Confirma, qdo e efetuado a exclusão de todos os recebimentos
//*****************************************************************************
//Data	    : 23/05/2005
//Código    : Al_02
//Motivo(S) : Testa se o idforcli e null, ocorre geralmente para Cart. Gerencial.
//*****************************************************************************
//Data	    : 23/05/2005
//Código    : Al_01
//Motivo(S) : Implementação da QryHistCustodia para a exclusão individual, antes ocorria o erro
//            no confirma onde ocorre o applyupdate na OPERACAOINVEST
//*************************************************************************************


unit FCadRestituicaoCapital;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMDetCSInv, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  fcLabel, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, DBCtrls, FCadastroRMDetCSInv, Mask,
  FCadMestreDetCSInv, faMensagem, dxCntner, dxEditor, dxExEdtr, dxEdLib,
  dxDBELib, uCtrlInvContab, Provider, DBClient, uCMClientDataSet,
   //AL_17
  uCtrlRendaVariavel, uCtrlPadroes;

type
  TFrmCadRestituicaoCapital = class(TfrmCadMestreDetalheCSInv)
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
    tbsRecebimento: TTabSheet;
    dbgRecebimento: TwwDBGrid;
    pnlDetRecebimento: TPanel;
    Label18: TLabel;
    dblInvestimento: TwwDBLookupCombo;
    qryRecebimento: TwwQuery;
    updRecebimento: TUpdateSQL;
    dsRecebimento: TwwDataSource;
    qryDESCTIPOOPERACAO: TStringField;
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
    qryDetalheDESCINVESTIMENTO: TStringField;
    dblTipoOperacao: TwwDBLookupCombo;
    Label28: TLabel;
    QryBuscaOperDireito: TwwQuery;
    QryOrigemDivJur: TwwQuery;
    UpdOrigemDivJur: TUpdateSQL;
    qryTipoOperacaoIDMERCADO: TFloatField;
    qryTipoOperacaoFLGTRATAIR: TStringField;
    qryTipoOperacaoTIPCREDOR: TStringField;
    qryTipoOperacaoRECPAG: TStringField;
    QryBuscaBolsaValores: TwwQuery;
    qryAcoesxBolsa: TwwQuery;
    qryTipoOperacaoVENCIMENTO: TFloatField;
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
    qryBoletaIDFORCLI: TFloatField;
    qryBoletaPLANO: TFloatField;
    qryBoletaPLNCODIGO: TFloatField;
    qryBoletaCODDOCUMENTO: TFloatField;
    qryHistCartInv: TwwQuery;
    updHistCartInv: TUpdateSQL;
    qryHistCartInvIDHISTCARTINV: TFloatField;
    qryHistCartInvIDTIPOOPERACAO: TFloatField;
    qryHistCartInvDATAMOVCARTINV: TDateTimeField;
    qryHistCartInvHISTMOVCARTINV: TStringField;
    qryHistCartInvIDOPERACAOINVEST: TFloatField;
    qryInvestimentoAcaoIDMOEDACONTAB: TFloatField;
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
    qryRecebimentoIDCARTEIRA: TStringField;
    qryCarteiraRecIDCARTEIRA: TStringField;
    dblCarteiraRec: TwwDBLookupCombo;
    QryOrigemDivJurIDCARTEIRA: TStringField;
    QryOrigemDivJurORDEM: TStringField;
    qryRecebimentoIDOPERACAOORIGEM: TFloatField;
    qryRecebimentoALTERADO: TStringField;
    Label26: TLabel;
    dbeBoletaRec: TDBEdit;
    qryTipoOperRecFLGCONTAINVEST: TFloatField;
    lblTotalRec: TfcLabel;
    lblCapRec: TfcLabel;
    //Al_01
    QryHistCustodia: TwwQuery;
    UpdHistCustodia: TUpdateSQL;
    QryHistCustodiaIDCUSTODIA: TFloatField;
    QryHistCustodiaIDOPERACAOINVEST: TFloatField;
    QryHistCustodiaDATAMOVCUSTOD: TDateTimeField;
    cdsSelBoleta: TCMClientDataSet;
    dspSelBoleta: TDataSetProvider;
    QryOrigemDivJurPLANPRVCONTABPATRO: TStringField;
    QryOrigemDivJurIDPLANPREVCTBPATR: TFloatField;
    QryOrigemDivJurVLRVARIACAOATUAL: TFloatField;
    qryRecebimentoPLANPRVCONTABPATRO: TStringField;
    qryRecebimentoQTDEEXERCIDA: TFloatField;
    qryRecebimentoVLRCUSTOATUAL: TFloatField;
    n: TFloatField;
    qryRecebimentoFLGCONTAINVEST: TFloatField;
    qryRecebimentoNUMDOCUMENTO: TStringField;
    //AL_22
    qryBoletaVALOR: TFloatField;
    //Al_01 - Fim
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
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure dblTipoOperacaoExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure dbrQtdProvExit(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure bbtnGeraRecebimentoClick(Sender: TObject);
    procedure qryRecebimentoAfterScroll(DataSet: TDataSet);
    procedure dsStateChange(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure dblCarteiraRecExit(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure dbdDataOperacaoRecExit(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnConsDetClick(Sender: TObject);
    procedure CmeDetalheApplyInsert(sender: TObject; var Accept: Boolean);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }

    //AL_17
    CtrlRV: TCtrlRendaVariavel;    

    // AL_8 - ProRata da Gerencial
    sBoleRat: String;
    iCartRat, iOperRat, iMotBRat: Integer;
    dDataRat, dVencRat: TDateTime;
    fPercRat, fQtdeRat, fVRemRat, fVOpeRat, fPUOpRat: Double;

    procedure Sel(iOper: Integer; bSelAGE: Boolean = True; bSelInv: Boolean = True);
    procedure SelDetInv(iOper: Integer);
    procedure SelDetRec(iOper: Integer);
    procedure HabDetRec (bAcao: Boolean);
    procedure FornecedorCli(wIdCustodiante, iInvestimento: Integer;
                            var wIdForCli: Integer);
    procedure TotalRec;                            

    function  TestaOperacaoExitente: Boolean;
    function  GeraRecebimentos: Boolean;
    function  BuscaBoleta(dData: TDateTime;
                          iCarteira, iCartGer, iCustodiante, iMotBloq, iTipoOper: Integer): String;
    function CalcVenc(dDataOper: TDateTime; iPrazo: Integer): TDateTime;
    // AL_8
    function CarregaCDS: Boolean;
  public
    { Public declarations }
  end;

var
  FrmCadRestituicaoCapital: TFrmCadRestituicaoCapital;
  wSdoQtdCPMF, wSaldoQtd, wSaldoVlr, wSaldoIRApu, wSaldoInutil, wSaldoAqui,
  wQtdOperAnt : Double;

implementation

uses UOperComum, uMensErro, DBaseDados, UDataBase, uDocumento, uSistema,
     UBibliotecaInvest, UImpostos, UDiasUteisInv, URendaVariavel,
     dRendaVariavel, UCotaComum, UProvisaoComum, ULancContab, UCaixaComum,
  URendaFixa, UOperacaoInvest;

{$R *.DFM}

procedure TFrmCadRestituicaoCapital.Sel(iOper  : Integer;
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
   //Al_01
   OperComum.LimpaParametros(qryHistCustodia);
   qryHistCustodia.ParamByName('IDOPERACAODIREITO').AsInteger := qryIDOPERACAODIREITO.AsInteger;
   qryHistCustodia.Open;
   //Al_01 - Fim
   OperComum.LimpaParametros(qryHistCaixa);
   qryHistCaixa.ParamByName('IDOPERACAODIREITO').AsInteger    := qryIDOPERACAODIREITO.AsInteger;
   qryHistCaixa.Open;

   OperComum.LimpaParametros(QryInvestimentoAcao);
   QryInvestimentoAcao.ParamByName('IDEMISSOR').AsInteger     := qryIDEMISSOR.AsInteger;
   //AL_9
   QryInvestimentoAcao.ParamByName('DATACOTACAO').AsString    := qryDATAEX.AsString;
   QryInvestimentoAcao.Open;

   if bSelInv then
      SelDetInv(iOper);

   SelDetRec(iOper);

   TotalRec;

   // Habilita componentes do Cadastro Pai
   dblEmissor.Enabled      := True;
   dblTipoOperacao.Enabled := True;
   dbeDivPorAcao.Enabled   := True;
   dbdAGE.Enabled          := True;
   dbdEX.Enabled           := True;
   dbdOper.Enabled         := True;
   dbdCOM.Enabled          := True;

end;

procedure TFrmCadRestituicaoCapital.SelDetInv(iOper: Integer);
begin
    OperComum.LimpaParametros(qryDetalhe);
    qryDetalhe.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryDetalhe.Open
end;

procedure TFrmCadRestituicaoCapital.SelDetRec(iOper: Integer);
begin
    //AL_21
    OperComum.LimpaParametros(qryCarteiraRec);
    qryCarteiraRec.ParamByName('DATALIMGER').AsString  := qryDATAOPER.AsString;
    qryCarteiraRec.Open;
    //AL_20
    OperComum.LimpaParametros(qryRecebimento);
    qryRecebimento.ParamByName('DATAEX').AsString  := qryDATAEX.AsString;
    qryRecebimento.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryRecebimento.Open
end;

procedure TFrmCadRestituicaoCapital.HabDetRec(bAcao:Boolean);
begin
   dbeBoletaRec.Enabled          := bAcao;
   dblTipoOperRec.Enabled        := bAcao;
   dblCarteiraRec.Enabled        := bAcao;
   dblCustodianteRec.Enabled     := bAcao;
   dblMotivoBloqueioRec.Enabled  := bAcao;
end;

procedure TFrmCadRestituicaoCapital.FormShow(Sender: TObject);
begin
   inherited;
   lblTotalRec.Caption := 'R$ 0,00';
   qryTipoOperacao.Open;
   QryEmissor.Open;
   qryTipoDireito.Open;
   Sel(-1);
   pgctrlDetalhe.ActivePage := tbsDet;
end;

procedure TFrmCadRestituicaoCapital.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryTipoOperacao.Close;
   QryEmissor.Close;
   qryTipoDireito.Close;
   QryInvestimentoAcao.Close;
   //AL_7 Ini
   qryAcoesxBolsa.Close;
   QryBuscaOperDireito.Close;
   QryBuscaBolsaValores.Close;
   qryCarteiraRec.Close;
   qryMotBloqRec.Close;
   qryTipoOperRec.Close;
   qryCustodianteRec.Close;
   QryHistCustodia.Close;
   qryBoleta.Close;
   qryHistCaixa.Close;
   qryHistCartInv.Close;
   QryOrigemDivJur.Close;
   qry.Close;
   qryDetalhe.Close;
   qryRecebimento.Close;
   //AL_7 Fim
end;

procedure TFrmCadRestituicaoCapital.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   qryIDOPERACAODIREITO.AsInteger := LeUltRegistro(nil,'OPERACAODIREITO');
   qryPARIDADE.AsFloat            := 1;
   qryPERCENTUAL.AsFloat          := 100;
end;

procedure TFrmCadRestituicaoCapital.dblEmissorExit(Sender: TObject);
begin
   inherited;
   OperComum.LimpaParametros(QryInvestimentoAcao);
   QryInvestimentoAcao.ParamByName('IDEMISSOR').AsInteger := QryEmissorIDEMISSOR.AsInteger;
   QryInvestimentoAcao.Open;
end;

procedure TFrmCadRestituicaoCapital.sbtnInserirClick(Sender: TObject);
begin

   inherited;
   //AL_22
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

procedure TFrmCadRestituicaoCapital.CmeDetalheInsert(Sender: TObject);
var
   wNumDocNormal : String;
begin
   If dblEmissor.Text = '' then
   begin
      MsgDlg('Não foi informado a Empresa para esta AGE.',
             'Mensagem do Sistema',mtWarning,[mbOK],0);
      bbtnVoltarDet.Click;
      Exit;
   end;
   // Verificar esta crítica: Deve ser em local que permita cancelar a operação
   if pgctrlDetalhe.ActivePage = tbsRecebimento then
   begin
      if qryDetalhe.IsEmpty then
      begin
         MsgDlg('Não foi informado um Investimento para esta AGE.',
                'Mensagem do Sistema',mtWarning,[mbOK],0);
         bbtnVoltarDet.Click;
         Exit;
      end;

      If dblTipoOperacao.Text = '' then
      begin
         MsgDlg('Não foi informado o Tipo de Operação para esta AGE.',
                'Mensagem do Sistema',mtWarning,[mbOK],0);
         bbtnVoltarDet.Click;
         Exit;
      end;
      //AL_11
      If dbeDivPorAcao.Value = 0 then
      begin
         MsgDlg('Não foi informado o PU para esta AGE.',
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
           // Gera numero de Boleta para Saldo Normal
           wNumDocNormal := 'RV-' + Copy(qryRecebimentoDATAOPERACAO.AsString,9,2) + '/' +
                                     FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                                                 Copy(qryRecebimentoDATAOPERACAO.AsString,9,2)));

           qryRecebimentoNUMDOCUMENTO.AsString := wNumDocNormal;
         end;
      end;
   end;
end;

procedure TFrmCadRestituicaoCapital.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

function TFrmCadRestituicaoCapital.TestaOperacaoExitente: Boolean;
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

procedure TFrmCadRestituicaoCapital.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
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

   //AL_7 Ini
   if ((qryTipoOperacaoIDTIPOOPERACAO.AsInteger =  pRPI.IDTIPOOPERRFRAC) and
       (Trim(qryOBSERVACAO.AsString) = '')) then
   begin
      Accept := False;
      MsgDlg('Deve ser informado uma Observação para a Operação.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbmObservacao.CanFocus then
         dbmObservacao.SetFocus;
      Exit;
   end;
   //AL_7 Fim

   // AL_6
   //AL_16
   if not CtrlInvContab.TestaPeriodo(qryDATAOPER.AsString, 2) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Exit;
   end;

   if ((qry.State = DsInsert) and (qry.FieldByName('PARIDADE').AsFloat = 0)) then
      qry.FieldByName('PARIDADE').AsFloat  := 1;

   if ((qry.State = DsInsert) and (qry.FieldByName('FLGTIPODIREITO').AsString = '')) then
      qry.FieldByName('FLGTIPODIREITO').AsString  := 'P';

   Accept := True;
end;

procedure TFrmCadRestituicaoCapital.bbtnOkDetClick(Sender: TObject);
var
    wIdForCli : Integer;
    dDataVer  : TDateTime;
begin

   if pgctrlDetalhe.ActivePage = tbsRecebimento then
   begin

      If qryDATACOM.AsDateTime > pRPI.DATAULTFECH then
      begin
         dDataVer := pRPI.DATAULTFECH + 1;
         while not DiasUteisInv.DiaUtil(dDataVer,-1,1,'',True,False,False) do
             dDataVer := dDataVer + 1;   // Achar o dia útil anterior
         if qryDATACOM.AsDateTime > dDataVer then
         begin
            If (MsgDlg('A Data Prevista é maior que a Data Atual. Deseja Continuar?',
                       'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo)  Then
               Exit;
         end;
      end;

      CmeDetalhe.RepetirInsert   := False;

      if qryRecebimento.Modified then
      begin
         // EXclui o histórico
         if qryHistCartInv.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
            qryHistCartInv.Delete;
         // Exclui a Provisão Gerencial
         if qryHistCaixa.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
            qryHistCaixa.Delete;
         // Ajusta o PU pelo valor informado
         qryRecebimentoPRECOUNITOPERACAO.AsFloat := ((qryRecebimentoVLROPERACAO.AsFloat / qryRecebimentoQTDEOPERACAO.AsFloat)* qryInvestimentoAcaoQTDTITLOTE.AsInteger);
         qryRecebimentoALTERADO.AsString         := 'S';
         FornecedorCli(qryRecebimentoIDCUSTODIANTE.AsInteger,
                       qryRecebimentoIDINVESTIMENTO.AsInteger, wIdForCli);
         If wIdForCli > 0 then
            qryRecebimentoIDFORCLI.AsInteger := wIdForCli
         else
            qryRecebimentoIDFORCLI.Clear;

         //AL_8
         inherited;

         // AL_8 - Inicio
         // Controle de Ajuste automático das carteiras gerencias
         qryRecebimento.DisableControls;
         qryRecebimento.First;
         while not qryRecebimento.Eof do
         begin
            if (qryRecebimentoIDOPERACAOINVEST.AsInteger <> iOperRat) and
               (qryRecebimentoIDCARTEIRAINVEST.AsInteger = iCartRat) and
               (((qryRecebimentoIDCARTEIRAGERENC.IsNull) and
                 (qryRecebimentoIDMOTIVOBLOQUEIO.AsInteger = iMotBRat)) or
                (not qryRecebimentoIDCARTEIRAGERENC.IsNull)) and
               (qryRecebimentoNUMDOCUMENTO.AsString = sBoleRat) then
            begin
               qryRecebimento.Edit;
               qryRecebimentoDATAOPERACAO.AsDateTime   := dDataRat;
               qryRecebimentoDATAVENCOPER.AsDateTime   := dVencRat;
               qryRecebimentoVLROPERACAO.AsFloat       := qryRecebimentoVLROPERACAO.AsFloat * fPercRat;
               qryRecebimentoPRECOUNITOPERACAO.AsFloat := fPUOpRat;
               qryRecebimentoQTDEOPERACAO.AsFloat      := fQtdeRat;
               qryRecebimentoVLRREMUNERACAO.AsFloat    := fVRemRat * (qryRecebimentoVLROPERACAO.AsFloat/fVOpeRat);
               qryRecebimento.Post;
               // Se a Provisão foi alterada exclui o histórico
               if qryHistCartInv.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
                  qryHistCartInv.Delete;
               // Exclui a Provisão Gerencial
               if qryHistCaixa.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
                  qryHistCaixa.Delete;
            end;
            qryRecebimento.Next;
         end;
         qryRecebimento.EnableControls;
         // AL_8 - Fim

         if qryBoleta.Locate('IDBOLETA', qryRecebimentoNUMDOCUMENTO.AsString, []) then
         begin
            //Atualiza a boleta
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
            qryBoletaTIPMOVBOLETA.AsString := 'DRS';
            //Al_02
            if qryRecebimentoIDFORCLI.AsInteger > 0 then
               qryBoletaIDFORCLI.AsInteger    := qryRecebimentoIDFORCLI.AsInteger;
            //Al_02 - Fim
            qryBoletaEXCLUIBOLETA.AsString := 'N';
            qryBoleta.Post;
         end;
      end;

   end
   else
   begin
      CmeDetalhe.RepetirInsert   := False;
      inherited;
   end;

   if pgctrlDetalhe.ActivePage = tbsRecebimento then
      TotalRec;

   tbcDetalheChange(Sender);

end;

{Incrementa fornecedor, bolsa de valores, boleta, data de vencimento}
procedure TFrmCadRestituicaoCapital.FornecedorCli(wIdCustodiante, iInvestimento  : Integer;
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

procedure TFrmCadRestituicaoCapital.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   if dblTipoOperacao.CanFocus then
      dblTipoOperacao.SetFocus;

   tbcDetalheChange(Sender);      

end;

procedure TFrmCadRestituicaoCapital.sbtnExcluiDetClick(Sender: TObject);
var sBol: String;
    iResp: Integer;
begin
   //AL_16
   Try
   if pgctrlDetalhe.ActivePage = tbsRecebimento then
   begin
      //AL_8
      if not CarregaCDS then
      begin
         if pRPI.FLGCARTGERENC = 'S' then
         begin
            MsgDlg('Não foi possível clonar as informações para o '+ #13 +
                   'rateio automático das carteiras gerenciais',
                   'Mensagem do Sistema', mtWarning,[MbOk],0);
            bbtnCancelarDet.Click;
            Exit;
         end;
      end;
      // AL_6
         //AL_16
         if not CtrlInvContab.TestaPeriodo(qryRecebimentoDATAOPERACAO.AsString, 2) then
      begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         Exit;
      end;

      if qryRecebimento.IsEmpty then
         exit;

      iResp := OperComum.InvMsgBox('Exclui Esta Operação ou Todas',
                                   mtConfirmation, 'Mensagem do Sistema',
                                   [mbYes,mbNo,mbCancel],
                                   'Esta;Todas;Cancela');

      if iResp = mrYes then
      begin
         // Verificar o Tratamento nas operações
         if qryHistCartInv.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
            qryHistCartInv.Delete;
         //Al_01
         if QryHistCustodia.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
            QryHistCustodia.Delete;
         //Al_01 - Fim
         if not qryRecebimentoIDCARTEIRAGERENC.IsNull then
         begin
            if qryHistCaixa.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
               qryHistCaixa.Delete;
         end;

         if qryBoleta.Locate('IDBOLETA', qryRecebimentoNUMDOCUMENTO.AsString, []) then
         begin
            qryBoleta.Edit;
            qryBoletaEXCLUIBOLETA.AsString := 'S';
            qryBoleta.Post;
         end;

         if qryRecebimentoDATAOPERACAO.AsDateTime <= pRPI.DATAULTFECH then
            RendaVariavel.MarcarFlagReproc(qryRecebimentoIDINVESTIMENTO.AsInteger,
                                           -1, -1, qryRecebimentoDATAOPERACAO.AsDateTime);

         if (not qryRecebimentoIDCARTEIRAGERENC.IsNull) then
         begin
            // Se Lançou uma HistProvisao, exclui a HistCota
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

         TotalRec;

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
            if qryRecebimentoDATAOPERACAO.AsDateTime <= pRPI.DATAULTFECH then
               RendaVariavel.MarcarFlagReproc(qryRecebimentoIDINVESTIMENTO.AsInteger,
                                              -1, -1, qryRecebimentoDATAOPERACAO.AsDateTime);

            if not qryRecebimentoIDCARTEIRAGERENC.IsNull then
            begin
               // Exclui a baixa da Provisao
               if (qryHistCaixa.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, [])) then
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

      tbcDetalhe.TabIndex     := 1;
      pgctrlDetalhe.ActivePage:= tbsRecebimento;
      //Al_03 
      bbtnConfirmar.Enabled   := True;
      //Al_03 - Fim

   end
   else
   begin
      if qryDetalhe.IsEmpty then
         exit;
      if not qryRecebimento.IsEmpty then
         exit;
   end;
   except
      on E: Exception do
      begin
         MsgDlg(E.Message, 'Mensagem do Sistema ',mtWarning,[mbOK],0);
      end;
   end;
end;

procedure TFrmCadRestituicaoCapital.dblTipoOperacaoExit(Sender: TObject);
begin
   inherited;
   if Trim(dblTipoOperacao.Text) <> '' then
   begin
      if qryTipoOperacao.FieldbyName('NATUREZAOPERACAO').AsString = 'N' Then
      begin
         MsgDlg('O Tipo de Atualização da Carteira não está parametrizada no Cadastro de Tipos de Operação.',
                'Mensagem do Sistema ',mtWarning,[mbOK],0);
      end;
   end;
end;

procedure TFrmCadRestituicaoCapital.bbtnConfirmarClick(Sender: TObject);
var bCriaLancto, bConfirma, bAltProv, bAltRec: Boolean;
    wTipoRecDesBol, wMensErro : String;
    wPlano, wPlanilha, wDocumCont, wIdCarteiraXEvento, wTipoOper : Integer;
    fVlrDif, fSaldoCaixa, fSaldoRec : Currency;
begin
   // Caso não confirmar, não pode fazer o finally
   CmeCadastroBeforeConfirma(Self, bConfirma);
   if not bConfirma then
      Exit;

   //AL_16
   if not qryRecebimento.IsEmpty then
   begin
      if not CtrlInvContab.TestaPeriodo(qryRecebimentoDATAOPERACAO.AsString, 2) then
      begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', MtWarning, [mbOk],0);
         fraMens.Apaga;
         Exit;
      end;
   end;

   try  // Finally
      try  // Except
         qryRecebimento.DisableControls;

         fraMens.Mostra;
         fraMens.Mes := 'Atualizando Histórico das Carteiras';
         qryHistCartInv.ApplyUpdates;
         //Al_01
         fraMens.Mes := 'Atualizando Histórico das Custódias';
         qryHistCustodia.ApplyUpdates;
         //Al_01 - Fim
         fraMens.Mes := 'Atualizando Histórico de Caixa Gerenciais';
         qryHistCaixa.ApplyUpdates;

         fraMens.Mes := 'Atualizando AGE';
         qry.ApplyUpdates;

         fraMens.Mes := 'Atualizando Investimentos para a AGE';
         qryDetalhe.ApplyUpdates;

         fraMens.Mes := 'Atualizando Operações de Restituição de Capital';
         qryRecebimento.ApplyUpdates;

         // Zera o Buffer de memória do CachedUpdates
         qry.CommitUpdates;
         qryDetalhe.CommitUpdates;
         qryRecebimento.CommitUpdates;
         //Al_01
         qryHistCustodia.CommitUpdates;
         //Al_01 - Fim
         qryHistCartInv.CommitUpdates;
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
               if qryBoleta.Locate('IDBOLETA', qryRecebimentoNUMDOCUMENTO.AsString, []) then
               begin
                  // Se achou a boleta, Limpa
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

         // Se houverem Boleta Marcada para exclusão (exclusão recebimento)
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

         // Lança os Recebimentos
         fraMens.Mostra;
         fraMens.Max := qryRecebimento.RecordCount;
         qryRecebimento.First;
         while not qryRecebimento.Eof do
         begin
            // Se não achar o histórico, relança
            if not qryHistCartInv.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
            begin
               fraMens.Mes := 'Lançando Históricos de R$ ' + FormatFloat('###,###,###,##0.00', qryRecebimentoVLROPERACAO.AsFloat) + #13 +
                              'Carteira: ' + qryRecebimentoDESCCARTINVEST.AsString;
               //AL_19
               if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                                 qryRecebimentoIDINVESTIMENTO.AsInteger, 2,
                                                 qryRecebimentoIDOPERACAOINVEST.AsInteger, -1,
                                                 qryRecebimentoIDTIPOOPERACAO.AsInteger,
                                                 qryRecebimentoIDCARTEIRAINVEST.AsInteger,
                                                 qryRecebimentoIDCARTEIRAGERENC.AsInteger,
                                                 -1, -1, -1, -1, -1,
                                                 qryRecebimentoDATAOPERACAO.AsDateTime,
                                                 qryRecebimentoVLROPERACAO.AsFloat,
                                                 0,
                                                 pRPI.VLRCOTAINICART,
                                                 0, 0, 0 , 0, 0, 0, 0, 0, 0,
                                                 qryRecebimentoNATUREZAOPERACAO.AsString {Movimento},
                                                 qryRecebimentoNATUREZAOPERACAO.AsString {Operacao},
                                                 qryRecebimentoIDLOTE.AsString,
                                                 TRIM(qryRecebimentoDESCTIPOOPERACAO.AsString) + ' / ' +
                                                 TRIM(qryRecebimentoDESCINVESTIMENTO.AsString),
                                                 'OPE', '1', '', True, -1,
                                                 qryRecebimentoIDPLANPREVCTBPATR.AsInteger, iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível inserir os Históricos das Operações.');

               if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                  Raise Exception.Create('Não foi possivel atualizar os saldos desta Carteira/Investimento');

               // Se não for Carteira Gerencial
               if qryRecebimentoIDCARTEIRAGERENC.IsNull then
               begin
                  // Atualizar Custodia
                  if not OperacaoInvest.CadastraCustodia(qryRecebimentoIDOPERACAOINVEST.AsInteger) then
                     Raise Exception.Create('Não foi possivel Atualizar a Custódia');

                  if not OperacaoInvest.AtualizaSaldosCustodia then
                     Raise Exception.Create('Não foi possivel Atualizar a Custódia');
               end;
            end;

            // Se for Carteira Gerencial
            if not qryRecebimentoIDCARTEIRAGERENC.IsNull then
            begin
               // Compensação da provisao
               if Not ((qryHistCaixa.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, [])) Or
                      (qryHistCaixa.Locate('IDOPERACAODIREITO;IDCARTEIRAGERENC',
                      VarArrayOf([qryRecebimentoIDOPERACAODIREITO.AsInteger,
                      qryRecebimentoIDCARTEIRAGERENC.AsInteger]), []))) then
               begin

                  fraMens.Mes := 'Lançando no Caixa de R$ -' + FormatFloat('###,###,###,##0.00', qryRecebimentoVLROPERACAO.AsFloat) + #13 +
                                 'Carteira: ' + qryRecebimentoDESCCARTINVEST.AsString;

                  fSaldoCaixa        := CaixaComum.BuscaSaldoCaixa(qryDATACOM.AsDateTime,
                                                                   qryRecebimentoIDCARTEIRAGERENC.AsInteger,
                                                                   qryRecebimentoIDCARTEIRAGERENC.AsInteger,
                                                                   qryRecebimentoIDPLANPREVCTBPATR.AsInteger, 'OPE');

                  if not CaixaComum.GravaEventosCaixa(qryDATACOM.AsDateTime, -1{Plano},
                                                      qryRecebimentoIDTIPOOPERACAO.AsInteger,
                                                      0,
                                                      qryRecebimentoIDCARTEIRAINVEST.AsInteger,
                                                      qryRecebimentoIDCARTEIRAGERENC.AsInteger,
                                                      qryRecebimentoIDOPERACAOINVEST.AsInteger,
                                                      qryRecebimentoIDOPERACAODIREITO.AsInteger,
                                                      qryRecebimentoDESCINVESTIMENTO.AsString,
                                                      qryRecebimentoVLROPERACAO.AsFloat,
                                                      fSaldoCaixa) Then
                     Raise Exception.Create('Não é possível gravar a Restituição de Capital no Caixa!'#13+
                                            'Verificar o Cadastro de Caixa e Cota.');

                  //exclui a HistCota
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
            end
            else
            //AL_22 - Ini
            begin
               // Se for carteira Própria
               // Se houveram alterações nos Recebimentos e a Boleta foi limpa
               // Gava
               // Para essa implementação foi utilizada a mesma logica que o Turon
               // utilizou para a operação de recebimentos de dividendos, onde é
               // calculada em um campo virtual o valor liquido da boleta,
               // independente da carteira que ela esteja, fechando o documento pelo
               // valor total.

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
         qryBoleta.Next;
      end;
      //AL_22 - Fim

      fraMens.Incrementa;
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

      qryRecebimento.EnableControls;
      CmeDetalhe.AtualizaBotoes(Self);
      CmeCadastro.AtualizaBotoes(Self);

      //AL_7 Ini
      qryRecebimento.Close;
      qryDetalhe.Close;
      lblTotalRec.Caption := 'R$ 0,00';
      Sel(-1);
      //AL_7 Fim
   end;
end;

procedure TFrmCadRestituicaoCapital.FormResize(Sender: TObject);
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

procedure TFrmCadRestituicaoCapital.sbtnApagarClick(Sender: TObject);
var iOldOper: Integer;
    sBol: String;
begin
   if MsgDlg('Exclui a AGE, o Investimento e as Operações de Recebimento ?','Mensagem do Sistema',mtConfirmation,[mbYes, mbNo],0) = mrYes then
   begin
      try
         //Exclui Recebimentos Anteriores
         qryRecebimento.First;
         while not qryRecebimento.Eof do
         begin
            //AL_16
            if not CtrlInvContab.TestaPeriodo(qryRecebimentoDATAOPERACAO.AsString, 2) then
               Raise Exception.Create(CtrlInvContab.MessageInfo);

            if qryRecebimentoDATAOPERACAO.AsDateTime <= pRPI.DATAULTFECH then
               RendaVariavel.MarcarFlagReproc(qryRecebimentoIDINVESTIMENTO.AsInteger,
                                              -1, -1, qryRecebimentoDATAOPERACAO.AsDateTime);

            sBol := qryRecebimentoNUMDOCUMENTO.AsString;
            if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
               Raise Exception.Create('Erro ao excluir os Recebimentos da Boleta ' + sBol);
            while ((not qryRecebimento.Eof) and (sBol = qryRecebimentoNUMDOCUMENTO.AsString)) do
               qryRecebimento.Next;
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
         iOldOper := qryIDOPERACAODIREITO.AsInteger;
         qry.Delete;
         qry.ApplyUpdates;

         Sel(iOldOper);
         CmeCadastro.AtualizaBotoes(Self);

      except
         on E:Exception do
         begin
            MsgDlg('Não foi possível excluir esta AGE. '+ #13 +
                   E.Message, 'Mensagem do Sistema', MtError,[MbOk],0);
            bbtnCancelar.Click;
         end;
      end
   end;
end;

procedure TFrmCadRestituicaoCapital.CmeDetalheConfirma(Sender: TObject);
var wIdForCli: Integer;
    sNewBol: String;
begin
   try
      sNewBol := '';
      if pgctrlDetalhe.ActivePage = tbsDet then
      begin
         if qryDetalhe.State in [dsInsert, dsEdit] then
         begin
            qryDetalheDESCINVESTIMENTO.AsString      := QryInvestimentoAcaoDESCINVESTIMENTO.AsString;
            qryDetalheORIGDEST.AsString              := 'D';
            qryDetalheIDOPERACAODIREITO.AsInteger    := qryIDOPERACAODIREITO.AsInteger;
            if qryDetalhe.State = dsInsert then
               qryDetalheIDOPERDIREITOXINV.AsInteger := LeUltRegistro(nil,'OPERDIREITOXINV');
         end
      end
      else if pgctrlDetalhe.ActivePage = tbsRecebimento then
      begin
         if qryRecebimento.State = dsInsert then
         begin
            qryRecebimentoIDOPERACAOINVEST.AsInteger    := LeUltRegistro(nil,'OPERACAOINVEST');
            qryRecebimentoMOECODIGO.AsInteger           := pRPI.MOECODIGO;
            qryRecebimentoIDMODULO.AsInteger            := Sistema.IdModulo;
            qryRecebimentoEMPRESAPROP.AsInteger         := Sistema.IdEmpresa;
            qryRecebimentoIDINVESTIMENTO.AsInteger      := QryInvestimentoAcaoIDINVESTIMENTO.AsInteger;
            qryRecebimentoDESCINVESTIMENTO.AsString     := QryInvestimentoAcaoDESCINVESTIMENTO.AsString;
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
            If wIdForCli > 0 then
               qryRecebimentoIDFORCLI.AsInteger := wIdForCli
            else
               qryRecebimentoIDFORCLI.Clear;

            qryRecebimentoIDOPERACAODIREITO.AsInteger   := qryIDOPERACAODIREITO.AsInteger;
            //AL_19
            qryRecebimentoIDPLANPREVCTBPATR.AsInteger   := qryRecebimentoIDPLANPREVCTBPATR.AsInteger; //iPlanPrevCtbPatro;
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
            qryRecebimentoPRECOUNITOPERACAO.AsFloat     := ((OperComum.DivValorZero(qryRecebimentoVLROPERACAO.AsFloat, qryRecebimentoQTDEOPERACAO.AsFloat) * QryInvestimentoAcaoQTDTITLOTE.AsInteger));
            qryRecebimentoPERCENTUAL.AsFloat            := 0;
            qryRecebimentoORIGDEST.AsString             := 'D';
            if qryRecebimentoIDMOTIVOBLOQUEIO.IsNull then
               qryRecebimentoIDMOTIVOBLOQUEIO.AsInteger := -1;
            qryRecebimentoSIGLAMOTBLOQ.AsString      := qryMotBloqRecSIGLAMOTBLOQ.AsString;
            qryRecebimentoIDOPERCUSTODIA.Clear;
            qryRecebimentoALTERADO.AsString := 'S';
         end
         else
         begin
            if qryBoleta.Locate('IDBOLETA', qryRecebimentoNUMDOCUMENTO.AsString, []) then
            begin
               qryBoleta.Edit;
               qryBoletaEXCLUIBOLETA.AsString := 'S';
               qryBoleta.Post;
            end;

            // AL_8 - Inicio
            // Controle de Ajuste automático das carteiras gerencias
            if qryRecebimentoIDCARTEIRAGERENC.IsNull then
            begin
               iCartRat := qryRecebimentoIDCARTEIRAINVEST.AsInteger;
               sBoleRat := qryRecebimentoNUMDOCUMENTO.AsString;
               iOperRat := qryRecebimentoIDOPERACAOINVEST.AsInteger;
               iMotBRat := qryRecebimentoIDMOTIVOBLOQUEIO.AsInteger;
               dDataRat := qryRecebimentoDATAOPERACAO.AsDateTime;
               dVencRat := qryRecebimentoDATAVENCOPER.AsDateTime;
               fVRemRat := qryRecebimentoVLRREMUNERACAO.AsFloat;
               fVOpeRat := qryRecebimentoVLROPERACAO.AsFloat;
               fQtdeRat := qryRecebimentoQTDEOPERACAO.AsFloat;
               fPUOpRat := qryRecebimentoPRECOUNITOPERACAO.AsFloat;
               if cdsSelBoleta.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
                  fPercRat := qryRecebimentoVLROPERACAO.AsFloat / cdsSelBoleta.FieldByName('VLROPERACAO').AsFloat
               else
                  fPercRat := 1;
            end
            else
            begin
               iCartRat := 0;
               sBoleRat := '';
               iOperRat := 0;
               iMotBRat := 0;
               dDataRat := 0;
               dVencRat := 0;
               fPercRat := 0;
               fVRemRat := 0;
               fVOpeRat := 0;
            end;
            // AL_8 - Fim
         end;
      end;

     inherited;
   except
      if sNewBol <> '' then
      begin
         //Se foi incluida uma nova boleta, exclui
         if qryBoleta.Locate('IDBOLETA', sNewBol, []) then
            qryBoleta.Delete;
      end;
      bbtnCancelarDet.Click;
   end;
end;

procedure TFrmCadRestituicaoCapital.dbrQtdProvExit(Sender: TObject);
begin
   inherited;

    dbrVlrRec.Value := OperComum.DivValorZero((dbrQtdRec.Value * qryDIVPORACAO.AsFloat),
                                 QryInvestimentoAcaoQTDTITLOTE.AsInteger);

end;

procedure TFrmCadRestituicaoCapital.tbcDetalheChange(Sender: TObject);
begin
   inherited;

   sbtnInsDet.Enabled       := False;
   sbtnAltDet.Enabled       := False;
   sbtnExcluiDet.Enabled    := False;
   sbtnConsDet.Enabled      := False;

   bbtnGeraRecebimento.Enabled := False;

   bbtnGeraRecebimento.Visible := (pgctrlDetalhe.ActivePage <> tbsDet);
   bbtnGeraRecebimento.Hint    :=  'Gera Recebimentos';

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
      else
      begin
         if (qryRecebimento.IsEmpty) And (qryDetalhe.IsEmpty) then
            sbtnInsDet.Enabled    := True
         else if (qryRecebimento.IsEmpty) then
         begin
            sbtnAltDet.Enabled    := True;
            sbtnConsDet.Enabled   := True;
         end
         else
            sbtnConsDet.Enabled   := True;
      end;
   end;

end;

function TFrmCadRestituicaoCapital.GeraRecebimentos: Boolean;
var wIdNovaOperacao, wIdForCli, wIdForCliAnt, wIdPlanPrevAnt : Integer;
    wNumDocNormal, wNumDocCCI, wNumDoc, wNumDocAnt, sBol : String;
    wPuProporcinal, wQtdOper, wSaldoNormal, wSaldoCCI    : Double;
    wVlrOperacao : Currency;
    dDataVer     : TDateTime;
    I : Integer;
begin
   try
      try

         if QryDetalhe.IsEmpty then
         begin
            MsgDlg('Náo foi informado o Investimento para esta AGE.',
                   'Mensagem do Sistema',mtWarning,[mbOK],0);
            Exit;
         end;

         If dblTipoOperacao.Text = '' then
         begin
            MsgDlg('Não foi informado o Tipo de Operação para esta AGE.',
                   'Mensagem do Sistema',mtWarning,[mbOK],0);
            Exit;
         end;

         If dbeDivPorAcao.Value = 0 then
         begin
            MsgDlg('Não foi informado o PU para esta AGE.',
                   'Mensagem do Sistema',mtWarning,[mbOK],0);
            Exit;
         end;

         If qryDATACOM.AsDateTime > pRPI.DATAULTFECH then
         begin
            dDataVer     := pRPI.DATAULTFECH + 1;
            while not DiasUteisInv.DiaUtil(dDataVer,-1,1,'',True,False,False) do
                dDataVer := dDataVer + 1;   // Achar o dia útil anterior
            if qryDATACOM.AsDateTime > dDataVer then
            begin
               If (MsgDlg('A Data Prevista é maior que a Data Atual. Deseja Continuar?',
                          'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo)  Then
                  Exit;
            end;
         end;

         Result := False;
         qryRecebimento.DisableControls;

         // Exclui Recebimentos
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

         OperComum.LimpaParametros(qryBoleta);
         qryBoleta.ParamByName('IDOPERACAODIREITO').AsInteger := qryIDOPERACAODIREITO.AsInteger;
         qryBoleta.Open;

         OperComum.LimpaParametros(qryHistCaixa);
         qryHistCaixa.ParamByName('IDOPERACAODIREITO').AsInteger := qryIDOPERACAODIREITO.AsInteger;
         qryHistCaixa.Open;

         SelDetRec(qryIDOPERACAODIREITO.AsInteger);

         // Inicia a geração dos recebimentos
         fraMens.Mostra;
         fraMens.Mes := 'Buscando Saldos...';

         // Capta os Saldos do Investimentos na data
         OperComum.LimpaParametros(QryOrigemDivJur);
         QryOrigemDivJur.ParamByName('IDINVESTIMENTO').AsInteger := qryDetalheIDINVESTIMENTO.AsInteger;
         //AL_17
         QryOrigemDivJur.ParamByName('DATAEX').AsString          := qryDATAEX.AsString;
         QryOrigemDivJur.ParamByName('FORCLI').AsString          := qryTipoOperacaoTIPCREDOR.AsString;
         QryOrigemDivJur.Open;

         fraMens.Mostra;
         fraMens.Max := QryOrigemDivJur.RecordCount;

         wIdForCliAnt := 0;

         while not QryOrigemDivJur.Eof do
         begin
            // Verificar no FCadOperAgeNovo a partir da linha 1078 (loop)
            fraMens.Mes := 'Processando: ' + QryOrigemDivJurDESCCARTINVEST.AsString +  #13 +
                           OperComum.IIF(QryOrigemDivJurSGLCUSTODIANTE.IsNull, '', ' Custodia: ' + QryOrigemDivJurSGLCUSTODIANTE.AsString) +
                           OperComum.IIF(QryOrigemDivJurSIGLAMOTBLOQ.IsNull, '', ' Bloqueio: ' + QryOrigemDivJurSIGLAMOTBLOQ.AsString);
            //AL_21
            //Caso o parametro de carteria gerencial for N (Não) ou estiver Nulo e a data da operação for
            // maior que a data de encerramento da carteria gerencial, NÃO gera o recebimento
            if (((pRPI.FLGCARTGERENC = 'N') or (pRPI.FLGCARTGERENC = '')) and (qryDATACOM.AsDateTime > pRPI.DATAMOVCDBLIB)) and
               (not QryOrigemDivJurIDCARTEIRAGERENC.IsNull) then
            begin
               QryOrigemDivJur.Next;
               fraMens.Incrementa;
               Continue;
            end;

            QryOrigemDivJur.Edit;
            QryOrigemDivJurDATAREFERENCIA.AsDateTime  := qryDATAEX.AsDateTime;
            QryOrigemDivJurQTDEDIREITO.AsFloat := QryOrigemDivJurQTDE.AsFloat;
            QryOrigemDivJurVALOREXERCIDO.AsFloat := OperComum.Round((QryOrigemDivJurQTDEDIREITO.AsFloat *
                                                              OperComum.DivValorZero(qryDIVPORACAO.AsFloat,
                                                                        QryOrigemDivJurQTDTITLOTE.AsInteger))-0.0049,2);
            wSaldoIRApu    := 0;
            wSaldoQtd      := 0;
            wSaldoAqui     := 0;
            wSaldoVlr      := 0;
            wSdoQtdCPMF    := 0;
            //AL_17 - ini

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

            QryOrigemDivJur.FieldByName('VLRCUSTO').AsFloat         := wSaldoAqui;
            QryOrigemDivJur.FieldByName('VLRCUSTOATUAL').AsFloat    := wSaldoAqui;
            QryOrigemDivJur.FieldByName('VLRVARIACAOATUAL').AsFloat := wSaldoVar;

            QryOrigemDivJur.Post;

            if qryOrigemDivJur.FieldByName('QTDEDIREITO').AsFloat = 0 then
            begin
               QryOrigemDivJur.Next;
               Continue;
            end;

            // Inicia outros Dados
            wIdForCli := 0;
            if qryOrigemDivJur.FieldByName('IDCARTEIRAGERENC').IsNull then
               FornecedorCli(qryOrigemDivJur.FieldByName('IDCUSTODIANTE').AsInteger,
                             qryOrigemDivJur.FieldByName('IDINVESTIMENTO').AsInteger, wIdForCli);

            if  (wSaldoNormal > 0) and
               ((wIdForCli <> wIdForCliAnt) or
                (wIdPlanPrevAnt <> qryOrigemDivJur.FieldByName('IDPLANPREVCTBPATR').AsInteger) or (wNumDocNormal = '')) then
            begin
               // Gera numero de Boleta
               wNumDocNormal := 'RV-' + Copy(qryDATAOPER.AsString,9,2) + '/' +
                                             FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                                                                         Copy(qryDATAOPER.AsString,9,2)));
               qryBoleta.Insert;
               qryBoletaIDBOLETA.AsString     := wNumDocNormal;
               qryBoletaSTATUS.AsString       := 'F';
               //Renan Cristiano - 09/01/2009 - N. Sol 104359 -  N. Kintana 467032
               qryBoletaDATABOLETA.AsDateTime := qryDATACOM.AsDateTime;
               //AL_18
               qryBoletaTIPMOVBOLETA.AsString := 'DRS';
               if wIdForCli > 0 then
                  qryBoletaIDFORCLI.AsInteger := wIdForCli;
               qryBoletaEXCLUIBOLETA.AsString := 'N';
               qryBoleta.Post;
            end;
            if  (wSaldoCCI > 0) and
               ((wIdForCli <> wIdForCliAnt) or
                (wIdPlanPrevAnt <> qryOrigemDivJur.FieldByName('IDPLANPREVCTBPATR').AsInteger) or (wNumDocCCI = '')) then
            begin
               // Gera numero de Boleta
               wNumDocCCI := 'RV-' + Copy(qryDATAOPER.AsString,9,2) + '/' +
                                          FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                                                                         Copy(qryDATAOPER.AsString,9,2)));
               qryBoleta.Insert;
               qryBoletaIDBOLETA.AsString     := wNumDocCCI;
               qryBoletaSTATUS.AsString       := 'F';
               //Renan Cristiano - 09/01/2009 - N. Sol 104359 -  N. Kintana 467032
               qryBoletaDATABOLETA.AsDateTime := qryDATACOM.AsDateTime;
               //AL_18
               qryBoletaTIPMOVBOLETA.AsString := 'DRS';
               if wIdForCli > 0 then
                  qryBoletaIDFORCLI.AsInteger := wIdForCli;
               qryBoletaEXCLUIBOLETA.AsString := 'N';
               qryBoleta.Post;
            end;

            if wIdForCli <> wIdForCliAnt then
               wIdForCliAnt := wIdForCli;

            if wIdPlanPrevAnt <> qryOrigemDivJur.FieldByName('IDPLANPREVCTBPATR').AsInteger then
               wIdPlanPrevAnt := qryOrigemDivJur.FieldByName('IDPLANPREVCTBPATR').AsInteger;

            // Para I = 1 - Saldo Normal
            //      I = 2 - Saldo CCI
            for I := 1 to 2 do
            begin
               qryTipoOperRec.First;
               if I = 1 then
               begin
                  // Saldo Normal
                  qryTipoOperRec.Locate('IDTIPOOPERACAO', qryIDTIPOOPERACAO.AsInteger, []);
                  // ProRata saldo Normal
                  wQtdOper := OperComum.Round(qryOrigemDivJur.FieldByName('QTDEDIREITO').AsFloat * (OperComum.DivValorZero(wSaldoNormal,wSaldoQtd)),0);
                  wNumDoc  := wNumDocNormal;
               end
               else
               begin
                  // Saldo CCI
                  qryTipoOperRec.Locate('IDTIPOOPERACAO', qryIDTIPOOPERACAO.AsInteger+10000, []);
                  // ProRata saldo CCI
                  wQtdOper := OperComum.Round(qryOrigemDivJur.FieldByName('QTDEDIREITO').AsFloat * (OperComum.DivValorZero(wSaldoCCI,wSaldoQtd)),0);
                  wNumDoc     := wNumDocCCI;
               end;

               if wQtdOper > 0 then
               begin
                  qryBoleta.First;
                  if not qryBoleta.Locate('IDBOLETA', wNumDoc, []) then
                     Raise Exception.Create('Não foi possível localizar a boleta ' + wNumDoc);

                  // Gera Novo Id de Operacao
                  wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

                  if qryTipoOperRecIDTIPOOPERACAO.IsNull then
                     Raise Exception.Create('Tipo de Operação não encontrado.');

                  wPuProporcinal := OperComum.DivValorZero(QryOrigemDivJurVALOREXERCIDO.AsFloat,QryOrigemDivJurQTDEDIREITO.AsFloat);

                  wVlrOperacao   := OperComum.Round(wQtdOper*wPuProporcinal,2);

                  qryRecebimento.Insert;
                  qryRecebimentoIDOPERACAOINVEST.AsInteger    := wIdNovaOperacao;
                  qryRecebimentoMOECODIGO.AsInteger           := pRPI.MOECODIGO;
                  qryRecebimentoIDMODULO.AsInteger            := Sistema.IdModulo;
                  qryRecebimentoEMPRESAPROP.AsInteger         := Sistema.IdEmpresa;
                  qryRecebimentoIDINVESTIMENTO.AsInteger      := QryOrigemDivJurIDINVESTIMENTO.AsInteger;
                  qryRecebimentoDESCINVESTIMENTO.AsString     := QryOrigemDivJurDESCINVESTIMENTO.AsString;
                  qryRecebimentoIDCARTEIRA.AsString           := QryOrigemDivJurIDCARTEIRA.AsString;
                  qryRecebimentoIDCARTEIRAINVEST.AsInteger    := QryOrigemDivJurIDCARTEIRAINVEST.AsInteger;
                  if not QryOrigemDivJurIDCARTEIRAGERENC.IsNull then
                     qryRecebimentoIDCARTEIRAGERENC.AsInteger := QryOrigemDivJurIDCARTEIRAGERENC.AsInteger
                  else
                     qryRecebimentoIDCARTEIRAGERENC.Clear;
                  qryRecebimentoDESCCARTINVEST.AsString       := QryOrigemDivJurDESCCARTINVEST.AsString;
                  qryRecebimentoIDTIPOINVEST.AsInteger        := 2;
                  qryRecebimentoIDTIPOOPERACAO.AsInteger      := qryTipoOperRecIDTIPOOPERACAO.AsInteger;
                  qryRecebimentoDESCTIPOOPERACAO.AsString     := qryTipoOperRecDESCTIPOOPERACAO.AsString;
                  qryRecebimentoNATUREZAOPERACAO.AsString     := qryTipoOperRecNATUREZAOPERACAO.AsString;
                  If wIdForCli > 0 then
                     qryRecebimentoIDFORCLI.AsInteger := wIdForCli
                  else
                     qryRecebimentoIDFORCLI.Clear;

                  if not QryOrigemDivJurIDLOTE.IsNull then
                     qryRecebimentoIDLOTE.AsString            := QryOrigemDivJurIDLOTE.AsString
                  else
                     qryRecebimentoIDLOTE.Clear;

                  if not QryOrigemDivJurIDCUSTODIANTE.IsNull then
                     qryRecebimentoIDCUSTODIANTE.AsInteger    := QryOrigemDivJurIDCUSTODIANTE.AsInteger
                  else
                     qryRecebimentoIDCUSTODIANTE.Clear;

                  if not QryOrigemDivJurSGLCUSTODIANTE.IsNull then
                     qryRecebimentoSGLCUSTODIANTE.AsString    := QryOrigemDivJurSGLCUSTODIANTE.AsString
                  else
                     qryRecebimentoSGLCUSTODIANTE.Clear;

                  qryRecebimentoIDOPERACAODIREITO.AsInteger   := qryIDOPERACAODIREITO.AsInteger;
                  qryRecebimentoIDPLANPREVCTBPATR.AsInteger   := qryOrigemDivJurIDPLANPREVCTBPATR.AsInteger; //iPlanPrevCtbPatro;
                  qryRecebimentoPLANPRVCONTABPATRO.AsString   := qryOrigemDivJurPLANPRVCONTABPATRO.AsString;
                  //AL_17 - fim
                  //Al_04
                  qryRecebimentoDATAOPERACAO.AsDateTime       := qryDATACOM.AsDateTime;
                  qryRecebimentoDATAVENCOPER.AsDateTime       := CalcVenc(qryDATACOM.AsDateTime, qryTipoOperRecVENCIMENTO.AsInteger);
                  //Al_04 - Fim
                  qryRecebimentoDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
                  qryRecebimentoNUMDOCUMENTO.AsString         := wNumDoc;
                  qryRecebimentoFLGSTATUSFECHBOL.AsString     := 'F';
                  qryRecebimentoFLGSTATUSORDMOV.AsString      := 'L';
                  qryRecebimentoQTDEOPERACAO.AsFloat          := wQtdOper;
                  qryRecebimentoPRECOUNITOPERACAO.AsFloat     := wPuProporcinal;
                  qryRecebimentoVLROPERACAO.AsFloat           := wVlrOperacao;
                  qryRecebimentoVLRLIQUIDO.AsFloat            := wVlrOperacao;
                  qryRecebimentoORIGDEST.AsString             := 'D';
                  if not QryOrigemDivJurIDMOTIVOBLOQUEIO.IsNull then
                     qryRecebimentoIDMOTIVOBLOQUEIO.AsInteger := QryOrigemDivJurIDMOTIVOBLOQUEIO.AsInteger
                  else
                     qryRecebimentoIDMOTIVOBLOQUEIO.Clear;
                  if not QryOrigemDivJurSIGLAMOTBLOQ.IsNull then
                     qryRecebimentoSIGLAMOTBLOQ.AsString      := QryOrigemDivJurSIGLAMOTBLOQ.AsString
                  else
                     qryRecebimentoSIGLAMOTBLOQ.Clear;
                  qryRecebimentoIDOPERCUSTODIA.Clear;
                  qryRecebimentoALTERADO.AsString := 'S';
                  qryRecebimento.Post;
               end;
            end;
            // Contabiliza Provisão - No OK da AGE
            QryOrigemDivJur.Next;
            fraMens.Incrementa;
         end;

         TotalRec;

         Result := True;

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
      qryRecebimento.First;
      qryRecebimento.EnableControls;
      fraMens.Apaga;
      CmeDetalhe.AtualizaBotoes(Self);
   end;
end;


Function TFrmCadRestituicaoCapital.BuscaBoleta(dData: TDateTime;
                                       iCarteira, iCartGer, iCustodiante, iMotBloq, iTipoOper: Integer): String;
var qrySelBoleta: TwwQuery;
    wIdForCli: Integer;
    sTipoMov: String;
begin
   Result := '';
   // Se ainda não foi preenchido: Data, Carteira e Tipo de Operação
   if (dData = 0) or (iCarteira = 0) or (iTipoOper = 0) then
      Exit;
   // Se for Carteira Própria e ainda não foi preenchido: Custodiante ou Motivo de Bloqueio
   if (iCartGer <> 0) and ((iCustodiante = 0) or (iMotBloq = 0)) then
      Exit;
   // Todos os Dados Necessários Preenchidos
   try
      with qrySelBoleta, OperComum do
      begin
         qrySelBoleta := TwwQuery.Create(Self);
         DatabaseName := 'BaseDados';
         SQL.Add('SELECT DISTINCT NUMDOCUMENTO ');
         SQL.Add('FROM OPERACAOINVEST ');
         SQL.Add('WHERE IDOPERACAODIREITO = ' + qryIDOPERACAODIREITO.AsString + ' ');
         SQL.Add('  AND DATAOPERACAO = TO_DATE(' + QuotedStr(DateToStr(dData)) + ', ' + QuotedStr('dd/mm/yyyy') + ') ');
         SQL.Add('  AND IDCUSTODIANTE ' + IIF(iCustodiante = 0, ' IS NULL', ' = ' + IntToStr(iCustodiante)) + ' ');
         SQL.Add('  AND IDTIPOOPERACAO = ' + IntToStr(iTipoOper) + ' ');
         Open;
         if not IsEmpty then
            // Utiliza Boleta já existente
            Result := FieldByName('NUMDOCUMENTO').AsString
         else
         begin
            // Recebimento
            sTipoMov := 'DRS';
            FornecedorCli(iCustodiante, qryDetalheIDINVESTIMENTO.AsInteger, wIdForCli);

            Result := 'RV-' + Copy(DateToStr(dData),9,2) + '/' +
                                   FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                                                                      Copy(DateToStr(dData),9,2)));
            qryBoleta.Insert;
            qryBoletaIDBOLETA.AsString     := Result;
            qryBoletaSTATUS.AsString       := 'F';
            qryBoletaDATABOLETA.AsDateTime := dData;
            qryBoletaTIPMOVBOLETA.AsString := sTipoMov;
            If wIdForCli > 0 then
               qryBoletaIDFORCLI.AsInteger := wIdForCli
            else
               qryBoletaIDFORCLI.Clear;
            qryBoletaEXCLUIBOLETA.AsString := 'N';
            qryBoleta.Post;
         end;
      end;
   finally
      qrySelBoleta.Close;
      qrySelBoleta.Free;
   end;
end;

function TFrmCadRestituicaoCapital.CalcVenc(dDataOper: TDateTime; iPrazo: Integer): TDateTime;
begin
   Result := DiasUteisInv.SomaDiasUteis(dDataOper, iPrazo,-1,1,'',True,False,False)
end;

procedure TFrmCadRestituicaoCapital.bbtnGeraRecebimentoClick(Sender: TObject);
begin
   inherited;
   //AL_20
   SelectNext(ActiveControl,True,True);
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
      end;
   finally
      bbtnGeraRecebimento.Down := False;
   end;
end;

procedure TFrmCadRestituicaoCapital.qryRecebimentoAfterScroll(DataSet: TDataSet);
begin
   inherited;
   qryCarteiraRec.Locate('IDCARTEIRAINVEST;IDCARTEIRAGERENC',
                          VarArrayOf([qryRecebimentoIDCARTEIRAINVEST.AsVariant,
                                      qryRecebimentoIDCARTEIRAGERENC.AsVariant]),[])
end;

procedure TFrmCadRestituicaoCapital.dsStateChange(Sender: TObject);
begin
   inherited;
   bbtnGeraRecebimento.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                   (not qryDetalhe.IsEmpty));
end;

procedure TFrmCadRestituicaoCapital.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;

   Sel(qryIDOPERACAODIREITO.AsInteger, False);

   dbgrdDet.BringToFront;
end;

procedure TFrmCadRestituicaoCapital.dsDetStateChange(Sender: TObject);
begin
   inherited;
   HabDetRec((qryRecebimento.State = dsInsert));
   dbrQtdRec.Enabled    := (qryRecebimento.State in [dsInsert, dsEdit]);
   dbrVlrRec.Enabled    := (qryRecebimento.State in [dsInsert, dsEdit]);
   dbdDataOperacaoRec.Enabled := (qryRecebimento.State in [dsInsert, dsEdit]);
end;

procedure TFrmCadRestituicaoCapital.dblCarteiraRecExit(Sender: TObject);
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

procedure TFrmCadRestituicaoCapital.CmeDetalheEdit(Sender: TObject);
begin
   inherited;
   // Controle de Quantidade alterada no recebimento
   if pgctrlDetalhe.ActivePage = tbsRecebimento then
      wQtdOperAnt := qryRecebimentoQTDEOPERACAO.AsFloat;
end;


procedure TFrmCadRestituicaoCapital.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if qryDetalhe.IsEmpty then
     dblEmissor.Enabled := True
  else
     dblEmissor.Enabled := False;

  dblTipoOperacao.Enabled := False;
  dbeDivPorAcao.Enabled := False;
  dbdAGE.Enabled        := False;
  dbdEX.Enabled         := False;
  dbdOper.Enabled       := False;

  if qryRecebimento.IsEmpty then
     dbdCOM.Enabled := True
  else
     dbdCOM.Enabled := False;
end;

procedure TFrmCadRestituicaoCapital.dbdDataOperacaoRecExit(Sender: TObject);
var
    wNumDocNormal : String;
begin
  inherited;

   if qryRecebimento.State in [dsEdit, dsInsert] then
   begin
      //AL_05
      if qryBoleta.Locate('IDBOLETA', qryRecebimentoNUMDOCUMENTO.AsString, []) then
      begin
         if (qryBoletaDATABOLETA.AsString <> dbdDataOperacaoRec.Text) then
         begin
            qryBoleta.Edit;
            qryBoletaEXCLUIBOLETA.AsString := 'S';
            qryBoleta.Post;

            qryRecebimentoDATAVENCOPER.AsDateTime := CalcVenc(dbdDataOperacaoRec.DateTime,
                                                              qryTipoOperRecVENCIMENTO.AsInteger);

            //Al_04
            // Gera numero de Boleta para Saldo Normal
            wNumDocNormal := 'RV-' + Copy(dbdDataOperacaoRec.Text,9,2) + '/' +
                                      FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                                                  Copy(dbdDataOperacaoRec.Text,9,2)));
            //Al_04 - Fim
            qryRecebimentoNUMDOCUMENTO.AsString := wNumDocNormal;
         end;
      end;
      //AL_05 - Fim
   end;
end;

procedure TFrmCadRestituicaoCapital.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
   tbcDetalheChange(Sender);
end;

procedure TFrmCadRestituicaoCapital.sbtnAltDetClick(Sender: TObject);
begin
   if pgctrlDetalhe.ActivePage = tbsRecebimento then
   begin
      if qryRecebimento.IsEmpty then
         exit
      else
      //AL_8
      if CarregaCDS then
         inherited
      else
         bbtnCancelarDet.Click;
   end
   else
   begin
      if qryDetalhe.IsEmpty then
         exit;
   end;

  inherited;
   //Posiciona boleta
   qryBoleta.Locate('IDBOLETA', qryRecebimentoNUMDOCUMENTO.AsString, []);
end;

procedure TFrmCadRestituicaoCapital.TotalRec;
var
   cTotalRec : Currency;
begin
   cTotalRec := 0;
   lblTotalRec.Caption := 'R$ 0,00';
   QryRecebimento.First;
   While Not QryRecebimento.Eof do
   begin
      If QryRecebimento.FieldByName('IDCARTEIRAGERENC').IsNull then
         cTotalRec := cTotalRec + QryRecebimento.FieldByName('VLROPERACAO').AsFloat;
      QryRecebimento.Next;
   end;
   QryRecebimento.First;
   lblTotalRec.Caption := 'R$ '+FormatFloat('###,###,###,##0.00', cTotalRec);
end;

procedure TFrmCadRestituicaoCapital.sbtnConsDetClick(Sender: TObject);
begin
   if pgctrlDetalhe.ActivePage = tbsRecebimento then
   begin

      if qryRecebimento.IsEmpty then
         exit;
   end;

  inherited;

end;

// AL_6 - Inicio
procedure TFrmCadRestituicaoCapital.CmeDetalheApplyInsert(sender: TObject; var Accept: Boolean);
begin
   Accept     := False;

   //AL_16
   if not CtrlInvContab.TestaPeriodo(qryDATAOPER.AsString, 2) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Exit;
   end;

   if trim(qryDATAOPER.AsString) = '' then
   begin
      MsgDlg('Preencha uma Data.', 'Mensagem do Sistema', MtWarning, [MbOk], 0);
      Exit;
   end;

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
      end;
   end;

   Accept := True;
   inherited;

end;
// AL_6 - Fim

//AL_8
function TFrmCadRestituicaoCapital.CarregaCDS: Boolean;
var iRec, iCount, iOper: Integer;
begin
   if pgctrlDetalhe.ActivePage <> tbsDet then
   begin
      Result := False;
      iCount := 0;
      qryRecebimento.DisableControls;
      repeat
         if pgctrlDetalhe.ActivePage = tbsRecebimento then
         begin
            dspSelBoleta.DataSet := qryRecebimento;
            iRec := qryRecebimento.RecordCount;
            if iCount = 0 then
               iOper := qryRecebimentoIDOPERACAOINVEST.AsInteger;
         end;

         Inc(iCount);

         if pgctrlDetalhe.ActivePage <> tbsDet then
            cdsSelBoleta.Data := dspSelBoleta.Data;

      until (cdsSelBoleta.RecordCount = iRec) or (iCount > 3);

      if pgctrlDetalhe.ActivePage = tbsRecebimento then
         qryRecebimento.Locate('IDOPERACAOINVEST', iOper, []);

      if cdsSelBoleta.RecordCount = iRec then
         Result := True;

      qryRecebimento.EnableControls;
   end
   else Result := True;

   inherited;
end;

procedure TFrmCadRestituicaoCapital.sbtnInsDetClick(Sender: TObject);
begin
   // AL_12
   if CarregaCDS then
      inherited
   else
      bbtnCancelarDet.Click;
end;

//AL_17
procedure TFrmCadRestituicaoCapital.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlRV := TCtrlRendaVariavel.Create;
   CtrlRV.InitializeAs(Padroes);
end;

//AL_17
procedure TFrmCadRestituicaoCapital.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
   FreeAndNil(CtrlRV);
end;

end.
