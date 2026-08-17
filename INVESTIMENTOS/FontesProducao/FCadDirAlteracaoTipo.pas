//******************************************************************************
// Rotina     :
// SOL        : 179205
// Kintana    : 1653012
// Data       : 02/05/2012
// Responsável: Otacilio Aquino
// Descrição  : Implementado para permitir uma ação seja incorporada em duas ou
//              mais ações destinos. Utilizar data PREV para movimentar a Carteira
//******************************************************************************
// Data      : 19/07/2007
// Código    : AL_39
// Pendencia : 25194
// SOL       : 53035
// Desc      : Implementação de critica para NÃO gerar o recebimento para
//              Carteiras Gerenciais conforme parametrização
//******************************************************************************
// Data      : 01/06/2007
// Código    : AL_38
// Pendencia : 24388
// SOL       : 53035
// Desc      : Acerto na filtragem das Carteiras para não trazer Carteiras Gerenciais
//             quando Parâmetro de integração com Carteira Gerencial estiver desmarcado.
//             (QrySaldoOrigem, qryOrigem, qryDestino, qryCarteiraRec e qryCarteiraOrig)
//******************************************************************************
// Data      : 09/02/2007
// Código    : AL_37
// Pendencia : 24464
// Desc      : Passa a não gravar o ID do HistCartInv nas OperCustodia
//             Obs. No reprocessamento já não gravava.
//******************************************************************************
// Data      : 12/01/2007
// Código    : AL_36
// Desc      : Acerto na montagem da variavel de Variacao
//******************************************************************************
// Data      : 19/10/2006
// Código    : AL_35
// Pendencia : 23366
// Desc      : Ajuste para excluir os históricos do destino na exclusão da AGE
//******************************************************************************
// Data      : 09/10/2006
// Código    : AL_34
// Pendencia : 22974
// Desc      : Segregação de Planos
//******************************************************************************
// Data      : 24/07/2006
// Código    : AL_33
// Pendencia : 22860
// SOL       : 44822
// Desc      : Ajuste na marcação de investimentos pata reprocessamento
//******************************************************************************
// Data      : 17/07/2006
// Código    : AL_32
// Pendencia : 22860
// SOL       : 44822
// Desc      : Implementação de Percentual no form
//******************************************************************************
// Data      : 17/07/2006
// Código    : AL_31
// Pendencia : 22860
// SOL       : 44822
// Desc      : Melhoria da crítica de operação já existente
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_30
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_29
// Pendencia:
// SOL      :
// Desc     : Retirada do Saldo CCI de Custódia da BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_29
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
// Data     : 17/04/2006
// Código   : AL_28
// Pendencia: 22047
// SOL      : 42021
// Desc     : Acerto no Processo de gravação da Planilha na Boleta que estava causando duplicidade de
//            Geração de Planilha
//            Mudança do Historico contábil da Incorporação que passa a fazer somente na origem
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_27
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//*****************************************************************************
//Data	 : 21/02/2006
//Código : Al_26
//Pend.  :
//SOL    :
//Desc.  : Implementação da trava de fechamento de renda variavel
//********************************************************************************************************
//Data	 :  13/12/2005
//Codigo :  AL_25
//Pend.  :  21025
//Sol    :  39102
//Função :  O Valor de Custo e Variação tem que ser proporcional a quantidade CCI e NOrmal,
//            assim como à quantidade das carteiras gerenciais
//********************************************************************************************************
//Data	 :  30/11/2005
//Codigo :  AL_24
//Função :  Ajuste para permitir selecionar papel sem cotação processada, pegando o peso do
//            lote no cadastro de ações por bolsa (DFM)
//********************************************************************************************************
//Data	 :  29/11/2005
//Codigo :  AL_23
//Função :  Ajuste para permitir Incorporação em ação de outra empresa
//********************************************************************************************************
//Data	 :  09/11/2005
//Codigo :  AL_22
//Função :  Retirada do cartesiano das queries origem e destino
//********************************************************************************************************
//Data	 :  06/10/2005
//Codigo :  AL_21
//Função :  Retirada a opera;áo de Permuta
//********************************************************************************************************
//Data	 :  29/09/2005
//Codigo :  AL_20
//Função :  Acerto na gravação de custo e variação para DTI ser negativa qdo
//               for Origem pois a natureza é D
//********************************************************************************************************
//Data	 :  29/09/2005
//Codigo :  AL_19
//Função :  Implementação do valor da operação composto pela variação + o custo e gravação desses campos na
//          OPERACAOINVEST pelas qryOrigem, updOrigem, qryDestino, updDestino
//********************************************************************************************************
//Data	 :  21/09/2005
//Codigo :  AL_18
//Função :  Implementação do campo que trata o destino com a contabilização invertida
//********************************************************************************************************
//Data	 :  21/09/2005
//Codigo :  AL_17
//Função :  Implementação da valor com a soma do custo e variação no destino
//********************************************************************************************************
//Data	 :  15/09/2005
//Codigo :  AL_16
//Função :  Passagem da boleta no carimbo da boleta com o plncodigo
//********************************************************************************************************
//Data	 :  08/09/2005
//Codigo :  AL_15
//Função :  Implementação da baixa do Custo na origem
//********************************************************************************************************
//Data	 :  05/09/2005
//Codigo :  AL_14
//Função :  Ajuste na rotina de alteração de Investimentos
//********************************************************************************************************
//Data	 :  23/08/2005
//Codigo :  AL_13
//Função :  Implementação do aumento Custo no destino
//********************************************************************************************************
//Data	 :  07/07/2005
//Codigo :  AL_11
//Função :  Acerto na query de QrySaldoOrigem, só trazia gerencial ...
//********************************************************************************************************
//Data	 :  06/07/2005
//Codigo :  AL_10
//Função :  Não Testar o valor
//********************************************************************************************************
//Data	 :  05/07/2005
//Codigo :  AL_9
//Função :  Alterada a data Oper(Data Ex) para Ex(Data AGE) esse e o correto para buscar saldo
//********************************************************************************************************
//Data	 :  05/07/2005
//Codigo :  AL_8
//Função :  Alterada a data Ex(Data AGE) para Oper(Data Ex) esse e o correto
//********************************************************************************************************
//Data	 :  05/07/2005
//Codigo :  AL_7
//Função :  Implementação da marca investimentos para reprocessamento por operação de destino, quando for uma PERMULTA
//********************************************************************************************************
//Data	 :  05/07/2005
//Codigo :  AL_6
//Função :  Tratamento para selecionar o emissor e a data de cotação so para as operações de
//          Alteração de Tipo e Incorporação
//********************************************************************************************************
//Data	 :  05/07/2005
//Codigo :  AL_5
//Função :  Ajuste na query qryInvestimentoAcao, muito lenta
//********************************************************************************************************
//Data	 :  04/07/2005
//Codigo :  AL_4
//Função :  Implementação da seleção de todos os investimentos para a operação de Permulta
//********************************************************************************************************
//Data	 :  23/05/2005
//Codigo :  AL_3
//Função :  Implementação do teste de período contabil em 3 camadas
//          Substituição da rotina BeforeConfirma pela ApplyInsert
//          DFM Alterado
//********************************************************************************************************
//Data	 :  02/05/2005
//Codigo :  AL_2
//Função :  Não aparece o campo percentual quando o tipo de operação não exigir
//          Marca o investimento para reprocesso caso necessário
//          Ajuste no Histórico da Operação
//          Ajuste no layout do grid (DFM - Retirada e inclusão de colunas)
//********************************************************************************************************
//Data	 :  11/04/2005
//Codigo :  AL_1
//Função :  Ajustes - Gravação do Status na boleta
//                    Rotina de Exclusão Geral - AGE
//                    Abertura automática da query Origem/Destino (DFM)
//********************************************************************************************************
// Função   : Efetuar o lançamento de operações de Alteração de Tipo de Incorporação
//
// Operações: ---------------------------------------------------------------------
//            * Origem
//              Baixa o saldo de quantidade do investimento origem
//            * Destino
//              Aumenta o saldo de quantidade do investimento destino
//********************************************************************************************************
unit FCadDirAlteracaoTipo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMDetCSInv, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  fcLabel, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, DBCtrls, FCadastroRMDetCSInv, Mask,
  FCadMestreDetCSInv, faMensagem, dxCntner, dxEditor, dxExEdtr, dxEdLib,  
  dxDBELib, uCtrlInvContab, uCmMath,
  //AL_34
  uCtrlRendaVariavel, uCtrlPadroes, Provider, DBClient, uCMClientDataSet;

type
  TfrmCadDirAlteracaoTipo = class(TfrmCadMestreDetalheCSInv)
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
    Label7: TLabel;
    dbrVlrProv: TDBRealEdit;
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
    qryInvestimentoAcaoIDMOEDACONTAB: TFloatField;
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
    qryInvestimentoAcaoQTDTITLOTE: TFloatField;
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
    //Al_13
    qryOrigemVLRCUSTOATUAL: TFloatField;
    qryDestinoVLRCUSTOATUAL: TFloatField;
    qryOrigemVLRVARIACAOATUAL: TFloatField;
    qryDestinoVLRVARIACAOATUAL: TFloatField;
    QrySaldoOrigemVLRVARIACAOATUAL: TFloatField;
    qryOrigemFLGCONTAINVEST: TFloatField;
    qryDestinoFLGCONTAINVEST: TFloatField;
    dbePercentual: TDBRealEdit;
    lblPercentual: TLabel;
    //AL_34
    QrySaldoOrigemPLANPRVCONTABPATRO: TStringField;
    QrySaldoOrigemIDPLANPREVCTBPATR: TFloatField;
    QrySaldoOrigemORDEM: TStringField;
    cdsSelBoleta: TCMClientDataSet;
    dspSelBoleta: TDataSetProvider;
    qryDestinoPLANPRVCONTABPATRO: TStringField;
    qryOrigemPLANPRVCONTABPATRO: TStringField;
    //Al_13 - Fim
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
    procedure dbrVlrRemProvExit(Sender: TObject);
    procedure dsOrigemStateChange(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure bbtnGeraOperacoesClick(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure dbrVlrRecExit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure dblCarteiraRecExit(Sender: TObject);
    procedure dblCarteiraProvisaoExit(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure dbdDataOperacaoRecExit(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeDetalheApplyInsert(sender: TObject; var Accept: Boolean);
    procedure dbdCOMExit(Sender: TObject);
    procedure dblTipoOperacaoExit(Sender: TObject);
    //AL_34
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    //William M. Santos - Sol nº 119978 - Kintana nº 622260
    procedure CmeCadastroCancel(Sender: TObject);
  private
    { Private declarations }
    //AL_34
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
    function  GeraOrigem: Boolean;
    function  GeraDestino: Boolean;
    function  BuscaBoleta(dData: TDateTime; wIDForCli: Integer): String;
    function  CalcVenc(dDataOper: TDateTime; iPrazo: Integer): TDateTime;
    function  AchaOrigem(iTipoOper, iCartInvest, iCartGerenc, iCustodiante, iMotBloq: Integer): Boolean;
    //William M. Santos
    function VerificaPreenchimento:Boolean; //William M. Santos - Sol nº 119978 - Kintana nº 622260

  public
    { Public declarations }
  end;

var
  frmCadDirAlteracaoTipo: TfrmCadDirAlteracaoTipo;
  wSdoQtdCPMF, wSaldoQtd, wSaldoVlr, wSaldoIRApu, wSaldoInutil, wSaldoAqui,
  wQtdOperAnt : Double;
  wOrigem, wDestino: Boolean;

implementation

uses UOperComum, uMensErro, DBaseDados, UDataBase, uDocumento, uSistema,
     UBibliotecaInvest, UImpostos, UDiasUteisInv, URendaVariavel,
     dRendaVariavel, UCotaComum, UProvisaoComum, ULancContab, UCaixaComum,
     UOperacaoInvest,
     //AL_31
     uDireitos;

{$R *.DFM}

procedure TfrmCadDirAlteracaoTipo.Sel(iOper: Integer;
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

   OperComum.LimpaParametros(QryInvestimentoAcao);
   //Al_6
   if trim(dblTipoOperacao.Text) <> '' then
   begin
      //Al_21
      //AL_23
      if qryTipoOperacaoIDTIPOOPERACAO.AsInteger = pRPI.IDTIPOOPERDIRALT then
         QryInvestimentoAcao.ParamByName('IDEMISSOR').AsInteger  := qryIDEMISSOR.AsInteger;

      QryInvestimentoAcao.ParamByName('DATACOTACAO').AsString := qryDATAEX.AsString;
   end;
   QryInvestimentoAcao.Open;

   if bSelInv then
      SelDetInv(iOper);
   SelDetOrig(iOper);
   SelDetDest(iOper);
   // Habilita componentes do Cadastro Pai
   dblEmissor.Enabled := True;
   dblTipoOperacao.Enabled := True;
   // AL_21   
   dbdAGE.Enabled := True;
   dbdEX.Enabled := True;
   dbdOper.Enabled := True;
   dbdCOM.Enabled := True;

end;

procedure TfrmCadDirAlteracaoTipo.SelDetInv(iOper: Integer);
begin
    OperComum.LimpaParametros(qryDetalhe);
    qryDetalhe.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryDetalhe.Open
end;

procedure TfrmCadDirAlteracaoTipo.SelDetOrig(iOper: Integer);
begin
    //AL_39
    OperComum.LimpaParametros(qryCarteiraOrig);
    qryCarteiraOrig.ParamByName('DATALIMGER').AsString  := qryDATAEX.AsString;
    qryCarteiraOrig.Open;
    //AL_38
    OperComum.LimpaParametros(qryOrigem);
    qryOrigem.ParamByName('DATAEX').AsString  := qryDATAEX.AsString;
    qryOrigem.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryOrigem.Open
end;

procedure TfrmCadDirAlteracaoTipo.SelDetDest(iOper: Integer);
begin
    //AL_39
    OperComum.LimpaParametros(qryCarteiraRec);
    qryCarteiraRec.ParamByName('DATALIMGER').AsString  := qryDATAOPER.AsString;
    qryCarteiraRec.Open;
    //AL_38
    OperComum.LimpaParametros(qryDestino);
    qryDestino.ParamByName('DATAEX').AsString  := qryDATAEX.AsString;
    qryDestino.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryDestino.Open
end;

procedure TfrmCadDirAlteracaoTipo.HabDetOrig(bAcao:Boolean);
begin
   dbeBoletaProv.Enabled := bAcao;
   dblTipoOperProv.Enabled := bAcao;
   dblCarteiraProvisao.Enabled := bAcao;
   dblCustodianteProv.Enabled := bAcao;
   dblMotivoBloqueioProv.Enabled := bAcao;
end;

procedure TfrmCadDirAlteracaoTipo.HabDetDest(bAcao:Boolean);
begin
   dbeBoletaRec.Enabled := bAcao;
   dblTipoOperRec.Enabled := bAcao;
   dblCarteiraRec.Enabled := bAcao;
   dblCustodianteRec.Enabled := bAcao;
   dblMotivoBloqueioRec.Enabled := bAcao;
end;

procedure TfrmCadDirAlteracaoTipo.FormShow(Sender: TObject);
begin
   inherited;
   qryTipoOperacao.Open;
   QryEmissor.Open;
   qryTipoDireito.Open;
   Sel(-1);
   pgctrlDetalhe.ActivePage := tbsDet;
end;

procedure TfrmCadDirAlteracaoTipo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryTipoOperacao.Close;
   QryEmissor.Close;
   qryTipoDireito.Close;
   QryInvestimentoAcao.Close;
end;

procedure TfrmCadDirAlteracaoTipo.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   // AL_26 - Controle de travamento
   if qry.State = dsInsert then
   begin
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      qryIDOPERACAODIREITO.AsInteger := LeUltRegistro(nil,'OPERACAODIREITO');
      qryPARIDADE.AsFloat            := 1;
      qryPERCENTUAL.AsFloat          := 100;
      qryFLGTIPODIREITO.AsString     := 'P';
      Sel(qryIDOPERACAODIREITO.AsInteger, False);
      //AL_37
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

procedure TfrmCadDirAlteracaoTipo.CmeDetalheInsert(Sender: TObject);
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

procedure TfrmCadDirAlteracaoTipo.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      Sel(StrToInt(MontaSelect.ValoresChave[0]));

   //William M. Santos
   if (qryTipoOperacaoIDTIPOOPERACAO.AsInteger = 15) and (dbePercentual.Visible = False) then
   begin
     dbePercentual.Visible := False;
     lblPercentual.Visible := False;
   end
   else
   begin
     dbePercentual.Visible := True;
     lblPercentual.Visible := True;
   end;

end;

function TfrmCadDirAlteracaoTipo.TestaOperacaoExitente: Boolean;
begin
   try
      QryBuscaOperDireito.Close;
      QryBuscaOperDireito.ParamByName('P_IDEMISSOR').AsInteger      := QryIDEMISSOR.AsInteger;
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

procedure TfrmCadDirAlteracaoTipo.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   if not qryDetalhe.IsEmpty then
   begin
      if Direitos.ExisteOperDir(qryIDTIPOOPERACAO.AsInteger,
                                qryIDEMISSOR.AsInteger,
                                qryDATAAGE.AsDateTime,
                                qryDATAEX.AsDateTime,
                                qryDATACOM.AsDateTime,
                                qryDetalhe.Lookup('ORIGDEST', 'O', 'IDINVESTIMENTO'),
                                -1, qryIDOPERACAODIREITO.AsInteger) then
      begin
         if MsgDlg('Já existe uma Operação com as mesmas Características.' + #13 +
                   'Continua? ','Mensagem do Sistema', MtWarning,[mbYes, mbNo],0) = mrNo then
         begin
            Accept := False;
            Exit;
         end;
      end;
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
   //AL_32
   else if dbePercentual.Value = 0 then
   begin
      Accept := False;
      MsgDlg('Não foi informado um Percentual para esta AGE,'+#13+
             'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbePercentual.CanFocus then
         dbePercentual.SetFocus;
      Exit;
   end
   else
   // AL_21
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

procedure TfrmCadDirAlteracaoTipo.bbtnOkDetClick(Sender: TObject);
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
         // Ajusta o PU pelo valor informado
         qryOrigemPRECOUNITOPERACAO.AsFloat := OperComum.Round(((qryOrigemVLROPERACAO.AsFloat / qryOrigemQTDEOPERACAO.AsFloat) * qryInvestimentoAcaoQTDTITLOTE.AsInteger)-0.0049,2);
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
         // Ajusta o PU pelo valor informado
         qryDestinoPRECOUNITOPERACAO.AsFloat := OperComum.Round(((qryDestinoVLROPERACAO.AsFloat / qryDestinoQTDEOPERACAO.AsFloat)* qryInvestimentoAcaoQTDTITLOTE.AsInteger)-0.0049,2);
         qryDestinoALTERADO.AsString := 'S';
      end;

      inherited;
   end

end;

{Incrementa fornecedor, bolsa de valores, boleta, data de vencimento}
procedure TfrmCadDirAlteracaoTipo.FornecedorCli(wIdCustodiante, iInvestimento  : Integer;
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

procedure TfrmCadDirAlteracaoTipo.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   // AL_26 - Controle de travamento
   if qry.State = dsEdit then
   begin
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      if dblTipoOperacao.CanFocus then
         dblTipoOperacao.SetFocus;
   end;
end;

procedure TfrmCadDirAlteracaoTipo.sbtnExcluiDetClick(Sender: TObject);
var sBol: String;
    iResp: Integer;
begin
   //AL_30
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
               //AL_35 - Precisa excluir o Histórico
               if not RendaVariavel.ExcluiBoleta(sBol, True, True, fraMens) then
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
            //AL_35 - Precisa excluir o Histórico
            if not RendaVariavel.ExcluiBoleta(sBol, True, True, fraMens) then
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

procedure TfrmCadDirAlteracaoTipo.bbtnConfirmarClick(Sender: TObject);
var bCriaLancto, bConfirma, bAltOrig, bAltDest, bReproc: Boolean;
    wTipoRecDesBol, wMensErro, sTipoCustodia: String;
    wPlano, wPlanilha, wDocumCont, wIdOperCust, iIdHistCustodia: Integer;
    //AL_28
    sHistorico : String;
    iTipoOperacao : Integer;
    fVlrOperacao : double;
begin
   // Caso não confirmar, não pode fazer o finally
   CmeCadastroBeforeConfirma(Self, bConfirma);
   if not bConfirma then
      Exit;

   //William M. Santos - Sol nº 119978 Kintana nº 622260 - INI
   if not VerificaPreenchimento then
     Exit;
   //William M. Santos - Sol nº 119978 Kintana nº 622260 - FIM
   
   //AL_30
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
         fraMens.Max := (qryOrigem.RecordCount * 2) + (qryDestino.RecordCount * 2) + qryBoleta.RecordCount;
         // AL_2
         bReproc := False;

         // Se houverem Origens alteradas, Limpa a Boleta correspondente
         qryOrigem.First;
         bAltOrig := False;
         while not qryOrigem.Eof do
         begin
            fraMens.Mes := 'Limpando Contábil das Operações de Origem';
            if qryOrigemALTERADO.AsString = 'S' then
            begin
               bAltOrig := True;
               if qryBoleta.Locate('IDBOLETA', qryOrigemNUMDOCUMENTO.AsString, []) then
               begin
                  // Se achou a boleta, Limpa
                  fraMens.Mes := 'Limpando Contábil das Operações de Origem' + #13 +
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
                  // Al_2
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
                  // Al_2
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
               // Se foi excluida uma das Origens desta boleta, é necessário
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
               // Al_2
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
               // Al_2
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
               // Al_2
               bReproc := True;
            end;
            qryDestino.Next;
            fraMens.Incrementa;
         end;

         qryBoleta.ApplyUpdates;
         qryBoleta.CommitUpdates;

         // Lança as Origens
         fraMens.Mostra;
         fraMens.Max := qryOrigem.RecordCount;
         qryOrigem.First;
         while not qryOrigem.Eof do
         begin
            //SOL 179205 KTN 1653012 - Otacilio Aquino ** INICIO **
            //Verifica saldo
            CtrlRV.BuscaSaldoRV.Executa(qryOrigemDATAOPERACAO.AsDateTime,
                                        qryOrigemIDPLANPREVCTBPATR.AsInteger,
                                        qryOrigemIDINVESTIMENTO.AsInteger,
                                        qryOrigemIDCARTEIRAINVEST.AsInteger,
                                        qryOrigemIDCARTEIRAGERENC.AsInteger,
                                        high(integer), -1, '');

            if CtrlRV.BuscaSaldoRV.SaldoQtdTotal > 0 then
            begin
              //SOL 179205 KTN 1653012 - Otacilio Aquino ** FIM **
              // Se Não achar o Histórico, Relança
              if not qryHistCartInv.Locate('IDOPERACAOINVEST', qryOrigemIDOPERACAOINVEST.AsInteger, []) then
              begin

                fraMens.Mes := 'Lançando Históricos de R$ ' + FormatFloat('###,###,###,##0.00', qryOrigemVLROPERACAO.AsFloat) + #13 +
                              'Carteira: ' + qryOrigemDESCCARTINVEST.AsString;
                //AL_34
                // AL_2
                if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                                  qryOrigemIDINVESTIMENTO.AsInteger, 2,
                                                  qryOrigemIDOPERACAOINVEST.AsInteger, -1,
                                                  qryOrigemIDTIPOOPERACAO.AsInteger,
                                                  qryOrigemIDCARTEIRAINVEST.AsInteger,
                                                  qryOrigemIDCARTEIRAGERENC.AsInteger,
                                                  -1, -1, -1, -1, -1,
                                                  qryOrigemDATAOPERACAO.AsDateTime,
                                                  // AL_25
                                                  (qryOrigemVLRCUSTOATUAL.AsFloat), //+ qryOrigemVLRVARIACAOATUAL.AsFloat),
                                                  qryOrigemQTDEOPERACAO.AsFloat,
                                                  pRPI.VLRCOTAINICART,
                                                  0 {Variacao}, 0{Juros},
                                                  0 {wVlrIRProv} {Verificar se vai calcular o saldo},
                                                  qryOrigemVLRIR.AsFloat, 0, 0, 0, 0, 0,
                                                  'D' {Movimento},
                                                  'D' {Operacao},
                                                  qryOrigemIDLOTE.AsString,
                                                  Trim(qryOrigemDESCTIPOOPERACAO.AsString) + ' - Origem / ' +
                                                  qryOrigemDESCINVESTIMENTO.AsString,
                                                  'OPE', '1', '', True, -1,
                                                  qryOrigemIDPLANPREVCTBPATR.AsInteger, iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível inserir os Históricos das Operações.');

                  //Ricardo Cristiano - 22/10/2009 - N. Sol 125777 -  N. Kintana 652392
                  //Renan Cristiano - 16/07/2010 - N. Sol 139731 -  N. Kintana 865507
                  {if ((pRPI.IDTIPOOPERDIRALT = qryOrigemIDTIPOOPERACAO.AsInteger) or
                  (pRPI.IDTIPOOPERDIRALT + 10000 = qryOrigemIDTIPOOPERACAO.AsInteger)) then
                  begin}
                  if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                     Raise Exception.Create('Não foi possivel atualizar os saldos desta Carteira/Investimento');
                  //Renan Cristiano - 16/07/2010 - N. Sol 139731 -  N. Kintana 865507
{                 end
                  else
                    ExecutaQuery(qryAuxiliar,'UPDATE HISTCARTINV SET MOVIMAQUI = '+ TrocaVirgulaPonto(qryOrigemVLRCUSTOATUAL.AsString)+','+
                                             ' VLRVARIACAO = '+TrocaVirgulaPonto(qryOrigemVLRVARIACAOATUAL.AsString)+
                                             ' WHERE IDHISTCARTINV = '+IntToStr(iIdHistCartInv));}
                  // AL_21
                  // Al_2
                  bReproc := True;
              end
              else
                iIdHistCartInv :=  qryHistCartInvIDHISTCARTINV.AsInteger;

              // Se NÃO for Carteira Gerencial
              if qryOrigemIDCARTEIRAGERENC.IsNull then
              begin
                // Se o Registro foi alterado
                if qryOrigemALTERADO.AsString = 'S' then
                begin
                  // Relança a Custódia
                  wIdOperCust := LeUltRegistro(Nil,'OPERCUSTODIA');
                  //AL_34
                  //AL_37
                  if not OperacaoInvest.AlimentaOperCustodia(wIdOperCust, -1, -1,
                                                             -1 {iIdHistCartInv} {Origem},
                                                             -1 {Destino},
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

                  if qryOrigemIDMOTIVOBLOQUEIO.AsInteger = -1 then
                     sTipoCustodia := 'V'
                  else
                     sTipoCustodia := 'Z';  //DIMINUI BLOQUEADA
                  //AL_34
                  //AL_27
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
                  // Al_2
                  bReproc := True;
                end;
               //SOL 179205 KTN 1653012 - Otacilio Aquino ** INICIO **
              end;
            end;

            // Se NÃO for Carteira Gerencial
            if qryOrigemIDCARTEIRAGERENC.IsNull then
            begin
               //SOL 179205 KTN 1653012 - Otacilio Aquino ** FIM **
               
               // Se houveram alterações nas provisões e a boleta foi limpa
               if (bAltOrig) and (qryBoleta.Lookup('IDBOLETA', qryOrigemNUMDOCUMENTO.AsString, 'EXCLUIBOLETA') = 'S') then
               begin
                  fraMens.Mes := 'Contabilizando R$ ' + FormatFloat('###,###,###,##0.00', qryOrigemVLROPERACAO.AsFloat) + #13 +
                                 'Carteira: ' + qryOrigemDESCCARTINVEST.AsString;
                  // Parametro para Contabilidade e CAP/CAR
                  bCriaLancto    := True;
                  wTipoRecDesBol := '';
                  wMensErro      := '';

                  // Contabiliza a Provisão
                  if qryBoleta.Locate('IDBOLETA', qryOrigemNUMDOCUMENTO.AsString, []) then
                  begin
                     wPlano     := OperComum.IIF(qryBoletaPLANO.AsInteger = 0, -1, qryBoletaPLANO.AsInteger);
                     wPlanilha  := OperComum.IIF(qryBoletaPLNCODIGO.AsInteger = 0, -1, qryBoletaPLNCODIGO.AsInteger);
                     wDocumCont := OperComum.IIF(qryBoletaCODDOCUMENTO.AsInteger = 0, -1, qryBoletaCODDOCUMENTO.AsInteger);
                     //AL_34
                     //AL_28
                     sHistorico := ' de ' + qryOrigemDESCINVESTIMENTO.AsString + ' para ' + qryDestinoDESCINVESTIMENTO.AsString;
                     if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                                qryOrigemIDINVESTIMENTO.AsInteger,
                                                qryOrigemIDTIPOOPERACAO.AsInteger,
                                                qryOrigemIDOPERACAOINVEST.AsInteger,
                                                qryOrigemIDFORCLI.AsInteger,
                                                qryOrigemIDCARTEIRAINVEST.AsInteger,
                                                QryInvestimentoAcaoIDMOEDACONTAB.AsInteger,
                                                '',
                                                qryOrigemIDLOTE.AsString,
                                                sHistorico,
                                                qryOrigemNUMDOCUMENTO.AsString,
                                                qryTipoOperOrig.Lookup('IDTIPOOPERACAO', qryOrigemIDTIPOOPERACAO.AsInteger, 'RECPAG'),
                                                wTipoRecDesBol, bCriaLancto,
                                                qryOrigemVLROPERACAO.AsFloat,
                                                qryOrigemVLRLIQUIDO.AsFloat,
                                                qryOrigemDATAOPERACAO.AsDateTime,
                                                qryOrigemDATAVENCOPER.AsDateTime,
                                                wPlano, wPlanilha, wDocumCont, wMensErro,
                                                ' '{sCapCar}, False, True, 0, True,
                                                qryOrigemIDPLANPREVCTBPATR.AsInteger) <> 0 then
                        Raise Exception.Create('Não foi possível contabilizar as operações de Origem');

                     // Atualiza a Boleta com Planilha
                     if (wPlanilha > 0) or (wDocumCont > 0) then
                     begin
                        // AL_1 - 11/04/2005
                        OperComum.LimpaParametros(DMRendaVariavel.qryUpdBoleta);
                        DMRendaVariavel.qryUpdBoleta.ParamByName('STATUS').AsString := 'F';
                        DMRendaVariavel.qryUpdBoleta.ParamByName('PLANO').AsInteger := wPlano;
                        if wPlanilha > 0 then
                           DMRendaVariavel.qryUpdBoleta.ParamByName('PLNCODIGO').AsInteger := wPlanilha;
                        if wDocumCont > 0 then
                           DMRendaVariavel.qryUpdBoleta.ParamByName('CODDOCUMENTO').AsInteger := wDocumCont;
                        DMRendaVariavel.qryUpdBoleta.ParamByName('IDBOLETA').AsString := qryBoletaIDBOLETA.AsString;
                        DMRendaVariavel.qryUpdBoleta.ExecSQL;
                        // AL_1 - Fim

                        //AL_28 Ini
                        qryBoleta.Edit;
                        if wPlanilha > 0 then
                        begin
                           qryBoletaPLANO.AsInteger := wPlano;
                           qryBoletaPLNCODIGO.AsInteger := wPlanilha;
                        end;
                        if wDocumCont > 0 then
                           qryBoletaCODDOCUMENTO.AsInteger := wDocumCont;
                        qryBoleta.Post;
                        //AL_28 Fim
                     end;
                  end
                  else
                    Raise Exception.Create('Não foi possível localizar a Boleta das Operações de Origem');
               end;
            end;
            fraMens.Incrementa;
            qryOrigem.Next;
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

               //Ricardo Cristiano - 17/12/2009 - N. Sol 128205 -  N. Kintana 684349
               //Ricardo Cristiano - 22/10/2009 - N. Sol 125777 -  N. Kintana 652392
{               fVlrOperacao := (qryDestinoVLRCUSTOATUAL.AsFloat + qryDestinoVLRVARIACAOATUAL.AsFloat);
               if ((pRPI.IDTIPOOPERDIRINC = qryOrigemIDTIPOOPERACAO.AsInteger) or
                   (pRPI.IDTIPOOPERDIRINC + 10000 = qryOrigemIDTIPOOPERACAO.AsInteger)) then
                  fVlrOperacao := qryDestinoVLRCUSTOATUAL.AsFloat;}

               //Ricardo Cristiano - 17/12/2009 - N. Sol 128205 -  N. Kintana 684349
               if ((pRPI.IDTIPOOPERDIRINC = qryOrigemIDTIPOOPERACAO.AsInteger) or
                   (pRPI.IDTIPOOPERDIRINC + 10000 = qryOrigemIDTIPOOPERACAO.AsInteger)) then
               begin

                  //Renan Cristiano - 16/07/2010 - N. Sol 139731 -  N. Kintana 865507 INI.
                  // Custo + Variação proporcional (Normal e CCI)
                  fVlrOperacao := (qryDestinoVLRCUSTOATUAL.AsFloat);// + qryDestinoVLRVARIACAOATUAL.AsFloat);

                  if fVlrOperacao = 0 then
                  //Busca Cotacao do Investimento
                  fVlrOperacao  :=  OperComum.Trunca(qryDestinoQTDEOPERACAO.AsFloat*
                                       OperComum.BuscaCotacaoInvest(qryDestinoIDINVESTIMENTO.AsInteger,
                                                                    qryDestinoDATAOPERACAO.AsDateTime, True),2);
                  //Renan Cristiano - 16/07/2010 - N. Sol 139731 -  N. Kintana 865507 FIM.

               end
               else
                  // Custo + Variação proporcional (Normal e CCI)
                  fVlrOperacao := (qryDestinoVLRCUSTOATUAL.AsFloat + qryDestinoVLRVARIACAOATUAL.AsFloat);
                              

               //AL_34
               if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                                 qryDestinoIDINVESTIMENTO.AsInteger, 2,
                                                 qryDestinoIDOPERACAOINVEST.AsInteger, -1,
                                                 qryDestinoIDTIPOOPERACAO.AsInteger,
                                                 qryDestinoIDCARTEIRAINVEST.AsInteger,
                                                 qryDestinoIDCARTEIRAGERENC.AsInteger,
                                                 -1, -1, -1, -1, -1,
                                                 qryDestinoDATAOPERACAO.AsDateTime,
                                                 fVlrOperacao,
                                                 qryDestinoQTDEOPERACAO.AsFloat,
                                                 pRPI.VLRCOTAINICART,
                                                 0 {Variacao}, 0{Juros},
                                                 0 {wVlrIRProv} {Verificar se vai calcular o saldo},
                                                 qryDestinoVLRIR.AsFloat, 0, 0, 0, 0, 0,
                                                 'A' {Movimento},
                                                 'A' {Operacao},
                                                 qryDestinoIDLOTE.AsString,
                                                 Trim(qryDestinoDESCTIPOOPERACAO.AsString) + ' - Destino / ' +
                                                      qryDestinoDESCINVESTIMENTO.AsString,
                                                 'OPE', '1', '', True, -1,
                                                 qryDestinoIDPLANPREVCTBPATR.AsInteger, iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível inserir os Históricos das Operações de Destino.');

               //Ricardo Cristiano - 22/10/2009 - N. Sol 125777 -  N. Kintana 652392
               //Renan Cristiano - 16/07/2010 - N. Sol 139731 -  N. Kintana 865507
{               if ((pRPI.IDTIPOOPERDIRALT = qryDestinoIDTIPOOPERACAO.AsInteger) or
                   (pRPI.IDTIPOOPERDIRALT + 10000 = qryDestinoIDTIPOOPERACAO.AsInteger)) then
               begin                                                          }
                  if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                     Raise Exception.Create('Não foi possivel atualizar os saldos desta Carteira/Investimento');
               //Renan Cristiano - 16/07/2010 - N. Sol 139731 -  N. Kintana 865507
{               end
               else
                  //Ricardo Cristiano - 17/12/2009 - N. Sol 128205 -  N. Kintana 684349               
                  ExecutaQuery(qryAuxiliar,'UPDATE HISTCARTINV SET MOVIMAQUI = '+ TrocaVirgulaPonto(qryDestinoVLRCUSTOATUAL.AsString)+','+
                                           ' SALDOAQUI  = '+TrocaVirgulaPonto(qryDestinoVLRCUSTOATUAL.AsString)+','+
                                           ' SALDOVLRINVCART  = '+TrocaVirgulaPonto(FloatToStr(fVlrOperacao))+','+
                                           ' SALDOQTDEINVCART = '+TrocaVirgulaPonto(qryDestinoQTDEOPERACAO.AsString)+','+
                                           ' VLRVARIACAO = 0 '+
                                           ' WHERE IDHISTCARTINV = '+IntToStr(iIdHistCartInv));}
               // AL_21
               // Al_2
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
                  //AL_34
                  //AL_37
                  if not OperacaoInvest.AlimentaOperCustodia(wIdOperCust, -1, -1,
                                                             -1{Origem},
                                                             -1 {iIdHistCartInv} {Destino},
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

                  if qryDestinoIDMOTIVOBLOQUEIO.AsInteger = -1 then
                     sTipoCustodia := 'C'
                  else
                     sTipoCustodia := 'Y';  //AUMENTA SALDO BLOQUEADO
                  //AL_34
                  //AL_27
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
                  // Al_2
                  bReproc := True;

                  //Ricardo Cristiano - 22/10/2009 - N. Sol 125777 -  N. Kintana 652392
               end;
            end;
            fraMens.Incrementa;
            qryDestino.Next;
         end;

         // Al_2 - 03/05/2004
         // Se algo foi alterado e a data é igual ou anterior ao fechamento - Reprocessa
         //Al_7
         //Al_21
         //AL_33 - Ini
         if (bReproc) then
         begin
            // Prepara Verificação
            fraMens.Mostra;
            fraMens.Max := qryOrigem.RecordCount + qryDestino.RecordCount;
            // Verifica Origem
            qryOrigem.First;
            while not qryOrigem.Eof do
            begin
               fraMens.Mes := 'Verificando operações retroativas.' + #13 +
                              'Origem de ' + qryOrigemDESCINVESTIMENTO.AsString;
               if qryOrigemDATAOPERACAO.AsDateTime <= pRPI.DATAULTFECH then
                  RendaVariavel.MarcarFlagReproc(qryOrigemIDINVESTIMENTO.AsInteger,
                                                 -1, -1, qryOrigemDATAOPERACAO.AsDateTime);
               qryOrigem.Next;
               fraMens.Incrementa;
            end;
            qryOrigem.First;
            // Verifica Destino
            qryDestino.First;
            while not qryDestino.Eof do
            begin
               fraMens.Mes := 'Verificando Operações Retroativas.' + #13 +
                              'Destino de ' + qryDestinoDESCINVESTIMENTO.AsString;
               if qryDestinoDATAOPERACAO.AsDateTime <= pRPI.DATAULTFECH then
                  RendaVariavel.MarcarFlagReproc(qryDestinoIDINVESTIMENTO.AsInteger,
                                                 -1, -1, qryDestinoDATAOPERACAO.AsDateTime);
               qryDestino.Next;
               fraMens.Incrementa;
            end;
            qryDestino.First;
         end;
         //AL_33 - Fim

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

procedure TfrmCadDirAlteracaoTipo.FormResize(Sender: TObject);
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

procedure TfrmCadDirAlteracaoTipo.dbrVlrRemProvExit(Sender: TObject);
begin
   inherited;
   CalculaVlrLiq;
end;

procedure TfrmCadDirAlteracaoTipo.CalculaVlrLiq(Origem: String = 'O');
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

procedure TfrmCadDirAlteracaoTipo.dsOrigemStateChange(Sender: TObject);
begin
   inherited;
   HabDetOrig((qryOrigem.State = dsInsert));
   dbrQtdProv.Enabled    := (qryOrigem.State in [dsInsert, dsEdit]);
   dbrVlrProv.Enabled    := (qryOrigem.State in [dsInsert, dsEdit]);
end;

procedure TfrmCadDirAlteracaoTipo.CmeDetalheConfirma(Sender: TObject);
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
            qryOrigemPRECOUNITOPERACAO.AsFloat     := OperComum.Round(((qryOrigemVLROPERACAO.AsFloat / qryOrigemQTDEOPERACAO.AsFloat) * qryInvestimentoAcaoQTDTITLOTE.AsInteger)-0.0049,2);
            qryOrigemPERCENTUAL.AsFloat            := qryPERCENTUAL.AsFloat;
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
            qryDestinoIDPLANPREVCTBPATR.AsInteger   := iPlanPrevCtbPatro;
            qryDestinoDATAVENCOPER.AsDateTime       := CalcVenc(dbdDataOperacaoRec.DateTime, qryTipoOperRecVENCIMENTO.AsInteger);
            qryDestinoDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
            if qryDestinoNUMDOCUMENTO.IsNull then
               qryDestinoNUMDOCUMENTO.AsString      := BuscaBoleta(dbdDataOperacaoRec.DateTime, wIdForCli);
            qryDestinoFLGSTATUSFECHBOL.AsString     := 'F';
            qryDestinoFLGSTATUSORDMOV.AsString      := 'L';
            qryDestinoPRECOUNITOPERACAO.AsFloat     := OperComum.Round(((OperComum.DivValorZero(qryDestinoVLROPERACAO.AsFloat, qryDestinoQTDEOPERACAO.AsFloat) * QryInvestimentoAcaoQTDTITLOTE.AsInteger))-0.0049,2);
            qryDestinoPERCENTUAL.AsFloat            := qryPERCENTUAL.AsFloat;
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

procedure TfrmCadDirAlteracaoTipo.tbcDetalheChange(Sender: TObject);
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

function TfrmCadDirAlteracaoTipo.GeraOrigem: Boolean;
// AL_3
var wQtdOper, wVlrOperacao, wPuProporcinal, wSdoQtdCPMF, wPUMedio: Double;
    wSaldoNormal, wSaldoCCI, wSaldoVar, wVlrOperacao2 : Double;
    //AL_34
    wIdNovaOperacao, wIdForCli, I, wIdForCliAnt, wIdPlanPrevAnt : Integer;
    DataAGECons: TDateTime;
    wNumDocCCI, wNumDocNormal, wNumDoc, sBol: String;
    //AL_27
    //AL_29
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

         Sel(qryIDOPERACAODIREITO.AsInteger, False, False);

         if not qryDetalhe.Locate('ORIGDEST', 'O', []) then
            Raise Exception.Create('Não foi Possível localizar o Investimento de Origem');

         fraMens.Mostra;
         fraMens.Mes := 'Buscando Saldos...';

         // Capta os Saldos do Investimentos na data
         OperComum.LimpaParametros(QrySaldoOrigem);
         QrySaldoOrigem.ParamByName('IDINVESTIMENTO').AsInteger := qryDetalheIDINVESTIMENTO.AsInteger;
         //AL_34
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

         //AL_34 - Ini
         QrySaldoOrigem.First;
         while not QrySaldoOrigem.Eof do
         begin
            fraMens.Mes := 'Processando: ' + QrySaldoOrigemDESCCARTINVEST.AsString +  #13 +
                           OperComum.IIF(QrySaldoOrigemSGLCUSTODIANTE.IsNull, '', ' Custodia: ' + QrySaldoOrigemSGLCUSTODIANTE.AsString) +
                           OperComum.IIF(QrySaldoOrigemSIGLAMOTBLOQ.IsNull, '', ' Bloqueio: ' + QrySaldoOrigemSIGLAMOTBLOQ.AsString);

            QrySaldoOrigem.Edit;

            if (qryTipoOperacaoFLGPERC.AsString = 'S') and (qryPERCENTUAL.AsFloat <> 0) then
                QrySaldoOrigemQTDEDIREITO.AsFloat  :=
                      OperComum.Round((QrySaldoOrigemQTDE.AsFloat * qryPERCENTUAL.AsFloat) / 100,0)
            else
                QrySaldoOrigemQTDEDIREITO.AsFloat  := QrySaldoOrigemQTDE.AsFloat;

            //Al_8
            QrySaldoOrigemDATAREFERENCIA.AsDateTime:= qryDATAOPER.AsDateTime;

            wSaldoIRApu := 0;
            wSaldoQtd   := 0;
            wSaldoAqui  := 0;
            wSaldoVlr   := 0;
            wSdoQtdCPMF := 0;
            wSaldoVar   := 0;
            //AL_27 Ini
            //AL_29
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
            //AL_36
            wSaldoVar       := CtrlRV.BuscaSaldoRV.SaldoVariacao;
            //AL_27 Fim

            wPUMedio     := OperComum.DivValorZero(wSaldoVlr, wSaldoQtd);

            // AL_25
            QrySaldoOrigemVALOREXERCIDO.AsFloat := QrySaldoOrigemQTDEDIREITO.AsFloat * wPUMedio;
            QrySaldoOrigemVLRLIQ.AsFloat := QrySaldoOrigemVALOREXERCIDO.AsFloat;
            QrySaldoOrigemIR.AsFloat := 0;

            // AL_21 - Inicio
            //AL_32
            QrySaldoOrigem.FieldByName('VLRCUSTO').AsFloat         := wSaldoAqui;
            QrySaldoOrigem.FieldByName('VLRCUSTOATUAL').AsFloat    := wSaldoAqui;
            QrySaldoOrigem.FieldByName('VLRVARIACAOATUAL').AsFloat := wSaldoVar;

            QrySaldoOrigem.Post;
            // AL_21 - Fim

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
               qryBoletaTIPMOVBOLETA.AsString := 'DTI';
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
               qryBoletaTIPMOVBOLETA.AsString := 'DTI';
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

                  wPuProporcinal := OperComum.DivValorZero(QrySaldoOrigemVLRLIQ.AsFloat,QrySaldoOrigemQTDEDIREITO.AsFloat);
                  // AL_3
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
                  qryOrigemDATAOPERACAO.AsDateTime       := qryDATACOM.AsDateTime;
                  qryOrigemDATAVENCOPER.AsDateTime       := CalcVenc(qryDATACOM.AsDateTime, qryTipoOperOrigVENCIMENTO.AsInteger);
                  qryOrigemDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
                  qryOrigemNUMDOCUMENTO.AsString         := wNumDoc;
                  qryOrigemFLGSTATUSFECHBOL.AsString     := 'F';
                  qryOrigemFLGSTATUSORDMOV.AsString      := 'L';
                  //AL_32 Ini
                  qryOrigemQTDEOPERACAO.AsFloat          := wQtdOper;
                  qryOrigemPRECOUNITOPERACAO.AsFloat     := wPUMedio;
                  qryOrigemVLROPERACAO.AsFloat           := wVlrOperacao;
                  qryOrigemVLRIR.AsFloat                 := OperComum.Round((QrySaldoOrigemIR.AsFloat * OperComum.DivValorZero(qryPERCENTUAL.AsFloat,100)),0);
                  qryOrigemVLRREMUNERACAO.AsFloat        := OperComum.Round((QrySaldoOrigemVLRREMUNERACAO.AsFloat * OperComum.DivValorZero(qryPERCENTUAL.AsFloat,100)),0);
                  qryOrigemVLRIRREMUNER.AsFloat          := OperComum.Round((QrySaldoOrigemVLRIRREMUNERACAO.AsFloat * OperComum.DivValorZero(qryPERCENTUAL.AsFloat,100)),0);
                  qryOrigemVLRLIQUIDO.AsFloat            := wVlrOperacao;
                  qryOrigemPERCENTUAL.AsFloat            := qryPERCENTUAL.AsFloat;;
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
                  //AL_25
                  //Al_13
                  qryOrigemVLRCUSTOATUAL.AsFloat    := (QrySaldoOrigem.FieldByName('VLRCUSTOATUAL').AsFloat / wSaldoQtd) * wQtdOper;
                  //Al_17
                  qryOrigemVLRVARIACAOATUAL.AsFloat := (QrySaldoOrigem.FieldByName('VLRVARIACAOATUAL').AsFloat / wSaldoQtd) * wQtdOper;
                  qryOrigemVLROPERACAO.AsFloat      := qryOrigemVLRCUSTOATUAL.AsFloat + qryOrigemVLRVARIACAOATUAL.AsFloat;
                  //AL_32 Fim
                  //AL_19
                  //Al_21
                  //AL_25
                  qryOrigem.Post;
               end;
            end;
            // Contabiliza Origem no OK da AGE
            QrySaldoOrigem.Next;
            fraMens.Incrementa;
         end;
         //AL_34 - Fim
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

function TfrmCadDirAlteracaoTipo.GeraDestino: Boolean;
//AL_34
// AL_3
var wIdNovaOperacao, wIdForCli, wIdForCliAnt, wIdPlanPrevAnt, iTipoOperAnt : Integer;
    sDataOperAnt, wNumDoc, wNumDocAnt, sBol: String;
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
         wNumDocAnt  := '';
         
         if not qryDetalhe.Locate('ORIGDEST', 'D', []) then
            Raise Exception.Create('Não foi Possível localizar o Investimento de Destino');

         //AL_34 - Ini
         qryOrigem.First;
         while not qryOrigem.Eof do
         begin
            fraMens.Mes := 'Processando: ' + qryOrigemDESCCARTINVEST.AsString +  #13 +
                           OperComum.IIF(qryOrigemSGLCUSTODIANTE.IsNull, '', ' Custodia: ' + qryOrigemSGLCUSTODIANTE.AsString) +
                           OperComum.IIF(qryOrigemSIGLAMOTBLOQ.IsNull, '', ' Bloqueio: ' + qryOrigemSIGLAMOTBLOQ.AsString);
            //AL_39
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
            if qryOrigemIDFORCLI.AsInteger > 0 then
               qryDestinoIDFORCLI.AsInteger         := qryOrigemIDFORCLI.AsInteger;
            qryDestinoIDPLANPREVCTBPATR.AsInteger   := qryOrigemIDPLANPREVCTBPATR.AsInteger;
            qryDestinoPLANPRVCONTABPATRO.AsString   := qryOrigemPLANPRVCONTABPATRO.AsString;
            qryDestinoDATAOPERACAO.AsDateTime       := qryDATACOM.AsDateTime;
            qryDestinoDATAVENCOPER.AsDateTime       := CalcVenc(qryDATACOM.AsDateTime, qryTipoOperRecVENCIMENTO.AsInteger);
            qryDestinoDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
            qryDestinoFLGSTATUSFECHBOL.AsString     := 'F';
            qryDestinoFLGSTATUSORDMOV.AsString      := 'L';

            //William M. Santos - Sol nº 119978 - Kintana nº 622260 - INI
            //qryDestinoQTDEOPERACAO.AsFloat          := qryOrigemQTDEOPERACAO.AsFloat;
            qryDestinoQTDEOPERACAO.AsFloat          := OperComum.Round((qryOrigemQTDEOPERACAO.AsFloat * qryPARIDADE.AsFloat),0);

            //qryDestinoPRECOUNITOPERACAO.AsFloat     := qryOrigemPRECOUNITOPERACAO.AsFloat;
            qryDestinoPRECOUNITOPERACAO.AsFloat     := qryOrigemPRECOUNITOPERACAO.AsFloat * qryPARIDADE.AsFloat;

            //qryDestinoVLROPERACAO.AsFloat           := qryOrigemVLROPERACAO.AsFloat;
            qryDestinoVLROPERACAO.AsFloat           := OperComum.Round((qryOrigemVLROPERACAO.AsFloat * qryPARIDADE.AsFloat),2);

            //qryDestinoVLRIR.AsFloat                 := qryOrigemVLRIR.AsFloat;
            qryDestinoVLRIR.AsFloat                 := OperComum.Round((qryOrigemVLRIR.AsFloat * qryPARIDADE.AsFloat),2);

            //qryDestinoVLRREMUNERACAO.AsFloat        := qryOrigemVLRREMUNERACAO.AsFloat;
            qryDestinoVLRREMUNERACAO.AsFloat        := OperComum.Round((qryOrigemVLRREMUNERACAO.AsFloat * qryPARIDADE.AsFloat),2);

            //qryDestinoVLRIRREMUNER.AsFloat          := qryOrigemVLRIRREMUNER.AsFloat;
            qryDestinoVLRIRREMUNER.AsFloat          := OperComum.Round((qryOrigemVLRIRREMUNER.AsFloat * qryPARIDADE.AsFloat),2);

            //qryDestinoVLRLIQUIDO.AsFloat            := qryOrigemVLRLIQUIDO.AsFloat;
            qryDestinoVLRLIQUIDO.AsFloat            := OperComum.Round((qryOrigemVLRLIQUIDO.AsFloat * qryPARIDADE.AsFloat),2);

            qryDestinoPERCENTUAL.AsFloat            := qryPERCENTUAL.AsFloat;
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

            qryDestinoALTERADO.AsString        := 'S';

            //William M. Santos - Sol nº 119978 - Kintana nº 622260
            //Al_13
            //qryDestinoVLRCUSTOATUAL.AsFloat    := qryOrigemVLRCUSTOATUAL.AsFloat ;
            qryDestinoVLRCUSTOATUAL.AsFloat    := OperComum.Round((qryOrigemVLRCUSTOATUAL.AsFloat * qryPARIDADE.AsFloat),2);
            //Al_17
            //qryDestinoVLRVARIACAOATUAL.AsFloat := qryOrigemVLRVARIACAOATUAL.AsFloat;
            qryDestinoVLRVARIACAOATUAL.AsFloat := OperComum.Round((qryOrigemVLRVARIACAOATUAL.AsFloat * qryPARIDADE.AsFloat),2);

            //William M. Santos - Sol nº 119978 - Kintana nº 622260 - FIM
            //AL_19
            //Al_21
            qryDestino.Post;

            qryOrigem.Next;
            fraMens.Incrementa;
         end;

         wIdForCliAnt   := 0;
         wIdPlanPrevAnt := 0;
         sDataOperAnt   := '';
         iTipoOperAnt   := 0;

         fraMens.Mes := 'Gerando Boletas de Recebimento' + #13 +
                        'Gravando Boletas';

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

                  // Capta o ForCli
                  wIdForCli := qryDestino.FieldByName('IDFORCLI').AsInteger;

                  // Grava a Boleta
                  qryBoleta.Insert;
                  qryBoletaIDBOLETA.AsString     := wNumDoc;
                  qryBoletaSTATUS.AsString       := 'F';
                  qryBoletaDATABOLETA.AsDateTime := qryDATACOM.AsDateTime;
                  qryBoletaTIPMOVBOLETA.AsString := 'DTI';
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
         //AL_34 - Fim

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


Function TfrmCadDirAlteracaoTipo.BuscaBoleta(dData: TDateTime; wIDForCli: Integer): String;
var qrySelBoleta: TwwQuery;
begin
   Result := '';
   try
      // AL_3
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
            qryBoletaTIPMOVBOLETA.AsString := 'DTI';
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

function TfrmCadDirAlteracaoTipo.CalcVenc(dDataOper: TDateTime; iPrazo: Integer): TDateTime;
begin
   Result := DiasUteisInv.SomaDiasUteis(dDataOper, iPrazo,-1,1,'',True,False,False)
end;

function TfrmCadDirAlteracaoTipo.AchaOrigem(iTipoOper, iCartInvest, iCartGerenc,
                                            iCustodiante, iMotBloq: Integer): Boolean;
// AL_3
begin
   Result := True;
   with OperComum do
   begin
      // Procura uma Origem com os mesmos dados
      qryOrigem.First;
      while not qryOrigem.Eof do
      begin
         if (qryOrigemIDTIPOOPERACAO.AsInteger   = iTipoOper) and
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

procedure TfrmCadDirAlteracaoTipo.bbtnGeraOperacoesClick(Sender: TObject);
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

procedure TfrmCadDirAlteracaoTipo.dsStateChange(Sender: TObject);
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

procedure TfrmCadDirAlteracaoTipo.dbrVlrRecExit(Sender: TObject);
begin
  inherited;
  CalculaVlrLiq('D');
end;

procedure TfrmCadDirAlteracaoTipo.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;
   Sel(qryIDOPERACAODIREITO.AsInteger, False);
end;

procedure TfrmCadDirAlteracaoTipo.dsDetStateChange(Sender: TObject);
begin
   inherited;
   HabDetDest((qryDestino.State = dsInsert));
   dbrQtdRec.Enabled    := (qryDestino.State in [dsInsert, dsEdit]);
   dbrVlrRec.Enabled    := (qryDestino.State in [dsInsert, dsEdit]);
end;

procedure TfrmCadDirAlteracaoTipo.dblCarteiraProvisaoExit(Sender: TObject);
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

procedure TfrmCadDirAlteracaoTipo.dblCarteiraRecExit(Sender: TObject);
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

procedure TfrmCadDirAlteracaoTipo.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if qryDetalhe.IsEmpty then
     dblEmissor.Enabled := True
  else
     dblEmissor.Enabled := False;

  if qryOrigem.IsEmpty then
  begin
     dblTipoOperacao.Enabled := True;
     // AL_21
     dbdAGE.Enabled := True;
     dbdEX.Enabled := True;
     dbdOper.Enabled := True;
  end
  else
  begin
     dblTipoOperacao.Enabled := False;
     // AL_21
     dbdAGE.Enabled := False;
     dbdEX.Enabled := False;
     dbdOper.Enabled := False;
  end;

  if qryDestino.IsEmpty then
     dbdCOM.Enabled := True
  else
     dbdCOM.Enabled := False;
end;

procedure TfrmCadDirAlteracaoTipo.dbdDataOperacaoRecExit(Sender: TObject);
begin
  inherited;
  if qryDestino.State in [dsEdit, dsInsert] then
     qryDestinoDATAVENCOPER.AsDateTime := CalcVenc(dbdDataOperacaoRec.DateTime, qryTipoOperRecVENCIMENTO.AsInteger);

end;

procedure TfrmCadDirAlteracaoTipo.sbtnInsDetClick(Sender: TObject);
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

procedure TfrmCadDirAlteracaoTipo.sbtnAltDetClick(Sender: TObject);
// AL_14
var iOper: Integer;
begin
   if pgctrlDetalhe.ActivePage = tbsDet then
   begin
      wOrigem := False;
      wDestino := False;
      // AL_14
      iOper := qryDetalheIDOPERDIREITOXINV.AsInteger;
      if qryDetalhe.Locate('ORIGDEST', 'O', []) then
         wOrigem := True;
      if qryDetalhe.Locate('ORIGDEST', 'D', []) then
         wDestino := True;
      // AL_14
      qryDetalhe.Locate('IDOPERDIREITOXINV', iOper, []);
   end;

   inherited;

end;

procedure TfrmCadDirAlteracaoTipo.sbtnApagarClick(Sender: TObject);
var sBol: String;
begin
   // AL_26
   if RendaVariavel.VerEmAbertura then
   begin
      CmeCadastro.AtualizaBotoes(Self);
      Exit;
   end;

   // AL_1 - 11/04/2005
   if MsgDlg('Exclui a AGE, o Investimento e as Operações de Origem e Destino?','Mensagem do Sistema',mtConfirmation,[mbYes, mbNo],0) = mrYes then
   begin
      try
         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;
      
         // Exclui as Operações de Destino Anteriores
         qryDestino.First;
         while not qryDestino.Eof do
         begin
            //AL_30
            if not CtrlInvContab.TestaPeriodo(qryDestinoDATAOPERACAO.AsString, 2) then
               Raise Exception.Create(CtrlInvContab.MessageInfo);

            sBol := qryDestinoNUMDOCUMENTO.AsString;
            //AL_35 - Precisa excluir o Histórico
            if not RendaVariavel.ExcluiBoleta(sBol, True, True, fraMens) then
               Raise Exception.Create('Não foi possível excluir as Operações de Destino da Boleta ' + sBol);
            while ((not qryDestino.Eof) and (sBol = qryDestinoNUMDOCUMENTO.AsString)) do
               qryDestino.Next;
         end;

         // Exclui as operações de Origem Anteriores
         qryOrigem.First;
         while not qryOrigem.Eof do
         begin
            //AL_30
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
         qry.Delete;
         qry.ApplyUpdates;

         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;

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
   // AL_1 - Fim
end;

// AL_3 - Ini
procedure TfrmCadDirAlteracaoTipo.CmeDetalheApplyInsert(sender: TObject; var Accept: Boolean);
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
      end
      else
      if ((dbrVlrProv.Visible) And (dbrVlrProv.Value = 0)) then
      begin
         MsgDlg('Não foi informado um Valor,'+#13+
                'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dbrVlrProv.CanFocus then
            dbrVlrProv.SetFocus;
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
      //Al_10
      //Al_21
      else
      begin
         if not AchaOrigem(qryTipoOperRecIDTIPOOPERACAO.AsInteger,
                             qryDestinoIDCARTEIRAINVEST.AsInteger,
                             qryDestinoIDCARTEIRAGERENC.AsInteger,
                             qryDestinoIDCUSTODIANTE.AsInteger,
                             OperComum.IIF(Trim(dblMotivoBloqueioRec.Text) = '',OperComum.IIF(qryDestinoIDCUSTODIANTE.AsInteger = 0, 0, -1), qryDestinoIDMOTIVOBLOQUEIO.AsInteger)) then
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
      //AL_30
      if not CtrlInvContab.TestaPeriodo(sDataLanc, 2) then
      begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         Exit;
      end;
   end;

   Accept := True;
   inherited;

end;
// AL_3 - Fim

//Al_4
procedure TfrmCadDirAlteracaoTipo.dbdCOMExit(Sender: TObject);
begin
  inherited;
   OperComum.LimpaParametros(QryInvestimentoAcao);
   if trim(dblTipoOperacao.Text) <> '' then
   begin
      //Al_21
      //AL_23
      if qryTipoOperacaoIDTIPOOPERACAO.AsInteger = pRPI.IDTIPOOPERDIRALT then
         QryInvestimentoAcao.ParamByName('IDEMISSOR').AsInteger  := qryIDEMISSOR.AsInteger;
      QryInvestimentoAcao.ParamByName('DATACOTACAO').AsString := qryDATAEX.AsString;
   end;
   QryInvestimentoAcao.Open;
end;

//AL_32
procedure TfrmCadDirAlteracaoTipo.dblTipoOperacaoExit(Sender: TObject);
begin
  inherited;
   //William M. Santos - Sol nº 119978 - Kintana nº 622260
   //if qryTipoOperacaoFLGPERC.AsString = 'S' then
   if qryTipoOperacaoFLGPARIDADE.AsString = 'S' then
   begin
      dbePercentual.Visible := True;
      lblPercentual.Visible := True;
   end
   else
   begin
      if frmCadDirAlteracaoTipo.ActiveControl = dbePercentual then
      begin
         if dbmObservacao.CanFocus then
            dbmObservacao.SetFocus;
      end;
      dbePercentual.Visible := False;
      lblPercentual.Visible := False;
   end;

//Ricardo Cristiano - 11/08/2011 SOL 163042 - KINTANA 1388966
//William M. Santos - Sol nº 119978 Kintana nº 622260 - INI
//   if qryTipoOperacaoIDTIPOOPERACAO.AsInteger = 15 then
//   begin
//     dbePercentual.Visible := False;
//     lblPercentual.Visible := False;
//   end;
   //William M. Santos - Sol nº 119978 Kintana nº 622260 - FIM
end;

//AL_34
procedure TfrmCadDirAlteracaoTipo.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlRV := TCtrlRendaVariavel.Create;
   CtrlRV.InitializeAs(Padroes);
end;

//AL_34
procedure TfrmCadDirAlteracaoTipo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  FreeAndNil(CtrlRV);
end;

//William M. Santos - Sol nº 119978 - Kintana nº 622260
function TfrmCadDirAlteracaoTipo.VerificaPreenchimento: Boolean;
begin
  Result := True;
  if (dbePercentual.Value = 0)then
  begin
    MsgDlg('Não é permitido proporção igual a 0.','Mensagem do Sistema', MtWarning, [mbOk],0);
    dbePercentual.SetFocus;
    Result := False;
  end;
  if (dbePercentual.Value > 1 )then
  begin
    if MsgDlg('Confirma Proporção superior a 1?','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes then
    begin
      Result := True;
    end
    else
    begin
      dbePercentual.SetFocus;
      Result := False;
    end;
  end;
  //William M. Santos - Sol nº 119978 Kintana nº 622260 - FIM
end;

procedure TfrmCadDirAlteracaoTipo.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
//William M. Santos
  if dbePercentual.Visible = False then
  begin
    dbePercentual.Visible := True;
    lblPercentual.Visible := True;
  end;
end;

end.
