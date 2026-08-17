//******************************************************************************
// Rotina     : sbtnExcluiDetClick
// SOL        : 187977
// Kintana    : 1770309
// Data       : 17/08/2012
// Responsável: Otacilio Aquino
// Descrição  : Alterado para Verifiar Boleta marcada e depois ExcluirBoleta
//******************************************************************************
// Rotina     : QryInvestmentoAcao
// SOL        : 122005
// Kintana    : 593652
// Data       : 14/07/2009 
// Responsável: Thiago Passos
// Descrição  : Alteração da query para sempre pegar a qtde do lote da tabela acoesxbolsa
//******************************************************************************
// Rotina     : bbtnConfirmarClick -> AlimentaOperCustodia e RendaVariavel.MarcarFlagReproc
// SOL        : 119072
// Kintana    : 566102
// Data       : 05/06/2008
// Responsável: Thiago Passos
// Descrição  : Correção do erro General SQL error - ora 00936 - missing expression
// O Plano de destino nao estava sendo passado para o insert da opercustodia.
//******************************************************************************

// Rotina     : bbtnOkDetClick(, tbcDetalheChange(, bbtnGeraOperacoesClick(, 
//              bbtnGeraOperacoesClick
// SOL        : 107933
// Kintana    : 486332
// Data       : 03/02/2008
// Responsável: Thiago Passos
// Descrição  : Implementação do botão alterar
//******************************************************************************
// Rotina     : GeraVencimento
// SOL        : 106500
// Kintana    : 477367
// Data       : 16/01/2009
// Responsável: Paulo Nobre
// Descrição  : Implementação para não permitir a checagem de datas para o
//              emissor TG(1056101)
//******************************************************************************
// Data      : 13/08/2008
// Código    : AL_26
// Kintana   : 394816
// SOL       : 92456
// Desc      : Alteração para permitir a exclusão de operações de não exercicios mesmo
//             com periodo contabil bloqueado.
//******************************************************************************
// Data      : 19/07/2007
// Código    : AL_25
// Pendencia : 25194
// SOL       : 53035
// Desc      : Implementação de critica para NÃO gerar o recebimento para
//              Carteiras Gerenciais conforme parametrização
//******************************************************************************
// Data      : 01/06/2007
// Código    : AL_24
// Pendencia : 24388
// SOL       : 53035
// Desc      : Acerto na filtragem das Carteiras para não trazer Carteiras Gerenciais
//             quando Parâmetro de integração com Carteira Gerencial estiver desmarcado.
//             (QrySaldoOrigem, qryOrigem, qryDestino, qryCarteiraRec e qryCarteiraOrig)
//******************************************************************************
// Data      : 12/04/2007
// Código    : AL_23
// Pendencia : 22978
// Desc      : Acerto na HabilitaValorExercido para Nao mostrar o Valor da OPeracao
//             após a inclusao do Plano/Patro
//******************************************************************************
// Data      : 13/02/2007
// Código    : AL_23
// Pendencia : 24464
// Desc      : Passa a não gravar o ID do HistCartInv nas OperCustodia
//             Obs. No reprocessamento já não gravava.
//******************************************************************************
// Data      : 19/01/2007
// Código    : AL_22
// Pendencia : 22978
// Desc      : Implementação de Segregação de Planos
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_21
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_20
// Desc     : Retirada do Saldo CCI de Custódia da BuscaTodosSaldosInvestLote
//*****************************************************************************
//Data	    : 23/03/2006
//Código    : Al_19
//Pendencia : 22458
//SOL       : 43557
//Motivo(S) : Retirado o campo Valor Exercido do Grid de Destino e Não Exercício
//            para operações de Vencimento de Subscrição
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_18
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//*****************************************************************************
//Data	    : 23/03/2006
//Código    : Al_17
//Pendencia : 22006
//SOL       : 41942
//Motivo(S) : Acerto na confirmação de operação de Direito de Subscrição para não exigir o
//            preenchimento da Data Ex.
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_16
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//*****************************************************************************
//Data	    : 23/03/2006
//Código    : Al_15
//Pendencia : 21880
//SOL       : 41435
//Motivo(S) : Alteração da descrição de DataEx para Data Operacao qudo for Dto de Subscriacao
//            e passa a gravar a data de liquidação financeira pela componente dbdCOM qdo Subscricao
//            Melhoria de Try Except da sbtnExcluiDet
//*****************************************************************************
//Data	    : 06/03/2006
//Código    : Al_14
//Motivo(S) : Implementação da trava de fechamento de renda variavel
//********************************************************************************************************
//Data	    : 13/01/2006
//Código    : AL_13
//Função    : Implementada uma boleta para cada registro de destino e origem, para serem contabilizados separados
//********************************************************************************************************
//Data	    : 12/01/2006
//Código    : AL_12
//Função    : Reitada de cartesiano com carteiras gerenciais
//********************************************************************************************************
//Data	    : 11/01/2006
//Código    : AL_11
//Sol       : 39752
//Função    : O prorata da quantidade sempre será feito(o problema foi identificado qdo
//            a mais de um custodiante com saldo)
//******************************************************************************
//Data      : 03/11/2005
//Código    : Al_10
//Motivo(S) : Implementação da exclusão da custodia antes da confirmação da operação
//********************************************************************************************************
//Data	    : 28/10/2005
//Código    : Al_9
//Motivo(S) : Atualiza a Boleta com Planilha e Documento
//******************************************************************************
// Data     : 20/10/2005
// Codigo   : AL_8
// Linha(s) : Ajuste na procura da provisão dos registros de carteira gerencial
//               por causa do motivo de bloqueio
//            Não gera valor para direito de subscrição
//******************************************************************************
// Data     : 20/10/2005
// Codigo   : AL_7
// Linha(s) : Alterado qryInvestimentoAcao para trazer o Investimento mesmo que
//            não tenha cotação cadastrada;
//            Acerto na rotina que testa operação já existente;
//*******************************************************************************
//Data      : 07/10/2005
//Codigo    : AL_6
//Descrição : Implementação de gravação na boleta origem
//******************************************************************************
// Data     : 05/09/2005
// Codigo   : AL_4
// Descrição: Ajuste na rotina de alteração de Investimentos
//******************************************************************************
// Data     : 02/08/2005
// Codigo   : AL_3
// Linha(s) : Incluida a "Orelha" de Vencimentos (DFM e todas as rotinas)
//            Ajuste na Data de Vencimento das operações de Origem e Destino (DFM)
//******************************************************************************
// Data     : 01/09/2005
// Codigo   : AL_2
// Linha(s) : Desabilitar o PU qdo for Dto de Subscrição e permitr o PU igual a Zéro
//            pois a operação não pode gerar custo;
//******************************************************************************
// Data     : 21/07/2005
// Codigo   : AL_1
// Linha(s) : Alterado a o sql da query "qryInvestimentoAcao" para buscar a cotação
//            na tabela COTACAOACAO
//******************************************************************************
// Data     : 15/07/2005
// Função   : Efetuar o cadastro das operações de Subscrição e Direito de Subscrição
// Operações: ---------------------------------------------------------------------
//            * Direito de Subscrição:
//              Não afeta a origem e cria nova posição no destino
//            * Não exercício de Direito de Subscrição
//              Baixa o investimento de destino
//            ---------------------------------------------------------------------
//            * Subscrição:
//              No momento, não está afetando a origem e esta criando posição no destino
//            * Não exercício de Subscrição
//              Verificar se é possível, se existe
//*********************************************************************************
unit FCadSubscricao;

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
  TfrmCadSubscricao = class(TfrmCadMestreDetalheCSInv)
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
    lblVlrExercicio: TLabel;
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
    lblDtEx: TLabel;
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
    LbVencimento: TLabel;
    DbdVencimento: TCMDateTimePicker;
    dbdPrazoBolsa: TCMDateTimePicker;
    LbBolsa: TLabel;
    LbEmpresa: TLabel;
    dbdPrazoEmpresa: TCMDateTimePicker;
    dbeIniPagto: TCMDateTimePicker;
    LbPagamento: TLabel;
    qryTipoOperacaoFLGDATAVENCIMENTO: TStringField;
    qryDATAVENCIMENTO: TDateTimeField;
    tbsVencimentos: TTabSheet;
    dbgVencimentos: TwwDBGrid;
    Panel1: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    dblCarteiraVenc: TwwDBLookupCombo;
    dbeBoletaVenc: TDBEdit;
    dblTipoOperVenc: TwwDBLookupCombo;
    dblCustodianteVenc: TwwDBLookupCombo;
    dblMotivoBloqueioVenc: TwwDBLookupCombo;
    dbrQtdVenc: TDBRealEdit;
    dbdDataOperacaoVenc: TCMDateTimePicker;
    qryTipoOperVenc: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
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
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    FloatField3: TFloatField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    FloatField4: TFloatField;
    qryCarteiraVenc: TwwQuery;
    StringField21: TStringField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    StringField22: TStringField;
    qryCustodianteVenc: TwwQuery;
    FloatField7: TFloatField;
    StringField23: TStringField;
    qryMotBloqVenc: TwwQuery;
    FloatField8: TFloatField;
    StringField24: TStringField;
    StringField25: TStringField;
    qryVencimento: TwwQuery;
    updVencimento: TUpdateSQL;
    dsVencimento: TwwDataSource;
    qryVencimentoNUMDOCUMENTO: TStringField;
    qryVencimentoDESCINVESTIMENTO: TStringField;
    qryVencimentoDESCTIPOOPERACAO: TStringField;
    qryVencimentoDESCCARTINVEST: TStringField;
    qryVencimentoQTDEOPERACAO: TFloatField;
    qryVencimentoVLROPERACAO: TFloatField;
    qryVencimentoVLRIRREMUNER: TFloatField;
    qryVencimentoVLRIR: TFloatField;
    qryVencimentoVLRLIQUIDO: TFloatField;
    qryVencimentoSGLCUSTODIANTE: TStringField;
    qryVencimentoSIGLAMOTBLOQ: TStringField;
    qryVencimentoDATABASE: TDateTimeField;
    qryVencimentoIDOPERACAOINVEST: TFloatField;
    qryVencimentoMOECODIGO: TFloatField;
    qryVencimentoIDMODULO: TFloatField;
    qryVencimentoORIGDEST: TStringField;
    qryVencimentoEMPRESAPROP: TFloatField;
    qryVencimentoIDINVESTIMENTO: TFloatField;
    qryVencimentoIDCARTEIRAINVEST: TFloatField;
    qryVencimentoIDTIPOINVEST: TFloatField;
    qryVencimentoIDTIPOOPERACAO: TFloatField;
    qryVencimentoDATAOPERACAO: TDateTimeField;
    qryVencimentoNUMDOCUMENTO_1: TStringField;
    qryVencimentoPRECOUNITOPERACAO: TFloatField;
    qryVencimentoDATAVENCOPER: TDateTimeField;
    qryVencimentoIDFORCLI: TFloatField;
    qryVencimentoIDLOTE: TStringField;
    qryVencimentoIDCUSTODIANTE: TFloatField;
    qryVencimentoFLGSTATUSFECHBOL: TStringField;
    qryVencimentoFLGSTATUSORDMOV: TStringField;
    qryVencimentoIDOPERACAODIREITO: TFloatField;
    qryVencimentoVLRREMUNERACAO: TFloatField;
    qryVencimentoPERCENTUAL: TFloatField;
    qryVencimentoIDCARTEIRAGERENC: TFloatField;
    qryVencimentoIDPLANPREVCTBPATR: TFloatField;
    qryVencimentoIDOPERCUSTODIA: TFloatField;
    qryVencimentoIDCUSTORIG: TFloatField;
    qryVencimentoIDMOTIVOBLOQUEIO: TFloatField;
    qryVencimentoNATUREZAOPERACAO: TStringField;
    qryVencimentoIDCARTEIRA: TStringField;
    qryVencimentoIDOPERACAOORIGEM: TFloatField;
    qryVencimentoALTERADO: TStringField;
    qryOrigemPLANPRVCONTABPATRO: TStringField;
    qryDestinoPLANPRVCONTABPATRO: TStringField;
    qryVencimentoPLANPRVCONTABPATRO: TStringField;
    //AL_24
    qryPlanPrevOrig: TwwQuery;
    qryPlanPrevOrigPLANPRVCONTABPATRO: TStringField;
    qryPlanPrevOrigPLANOCONTABIL: TStringField;
    qryPlanPrevOrigPATROCINADORA: TStringField;
    qryPlanPrevOrigIDPLANPREVCTBPATR: TFloatField;
    qryPlanPrevOrigIDPLANOPREV: TFloatField;
    qryPlanPrevOrigIDPATRO: TFloatField;
    QrySaldoOrigemPLANPRVCONTABPATRO: TStringField;
    QrySaldoOrigemIDPLANPREVCTBPATR: TFloatField;
    //AL_24
    qryPlanPrevDest: TwwQuery;
    dblPlanPatroProv: TwwDBLookupCombo;
    Label46: TLabel;
    Label16: TLabel;
    dblPlanPatroRec: TwwDBLookupCombo;
    qryPlanPrevDestPLANPRVCONTABPATRO: TStringField;
    qryPlanPrevDestPLANOCONTABIL: TStringField;
    qryPlanPrevDestPATROCINADORA: TStringField;
    qryPlanPrevDestIDPLANPREVCTBPATR: TFloatField;
    qryPlanPrevDestIDPLANOPREV: TFloatField;
    qryPlanPrevDestIDPATRO: TFloatField;
    Label24: TLabel;
    dblPlanPatroVenc: TwwDBLookupCombo;
    qryPlanPrevVenc: TwwQuery;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
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
  private
    { Private declarations }
    procedure Sel(iOper: Integer; bSelAGE: Boolean = True; bSelInv: Boolean = True);
    procedure SelDetInv(iOper: Integer);
    procedure SelDetOrig(iOper: Integer);
    procedure SelDetDest(iOper: Integer);
    procedure SelDetVenc(iOper: Integer);
    procedure HabDetOrig(bAcao:Boolean);
    procedure HabDetDest (bAcao: Boolean);
    procedure FornecedorCli(wIdCustodiante, iInvestimento: Integer;
                            var wIdForCli: Integer);
    procedure CalculaVlrLiq(Origem: String = 'O');
    procedure HabilitaCamposDireito(bVisivel : Boolean);

    function  GeraOrigem : Boolean;
    function  GeraDestino: Boolean;
    function  GeraVencimento: Boolean;
    function  BuscaBoleta(dData: TDateTime; wIDForCli: Integer): String;
    function  CalcVenc(dDataOper: TDateTime; iPrazo: Integer): TDateTime;
    function  AchaOrigem(iPlanPrev, iTipoOper, iCartInvest, iCartGerenc, iCustodiante, iMotBloq: Integer): Boolean;
    //AL_19
    procedure HabilitaValorExercido;
  public
    { Public declarations }
  end;

var
  frmCadSubscricao: TfrmCadSubscricao;
  wSdoQtdCPMF, wSaldoQtd, wSaldoVlr, wSaldoIRApu, wSaldoInutil, wSaldoAqui,
  wQtdOperAnt : Double;
  wOrigem, wDestino: Boolean;
  bVencimento : Boolean = False;

implementation

uses UOperComum, uMensErro, DBaseDados, UDataBase, uDocumento, uSistema,
     UBibliotecaInvest, UImpostos, UDiasUteisInv, URendaVariavel,
     dRendaVariavel, UCotaComum, UProvisaoComum, ULancContab, UCaixaComum,
     URendaFixa, UOperacaoInvest, uDireitos;

{$R *.DFM}

procedure TfrmCadSubscricao.Sel(iOper: Integer;
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
   QryInvestimentoAcao.ParamByName('DATACOTACAO').AsString   := qryDATAEX.AsString;
   QryInvestimentoAcao.Open;

   if bSelInv then
      SelDetInv(iOper);

   SelDetOrig(iOper);

   SelDetDest(iOper);

   // AL_3
   SelDetVenc(iOper);

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

procedure TfrmCadSubscricao.SelDetInv(iOper: Integer);
begin
    OperComum.LimpaParametros(qryDetalhe);
    qryDetalhe.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryDetalhe.Open;
end;

procedure TfrmCadSubscricao.SelDetOrig(iOper: Integer);
begin
    //AL_25
    OperComum.LimpaParametros(qryCarteiraOrig);
    qryCarteiraOrig.ParamByName('DATALIMGER').AsString  := qryDATAEX.AsString;
    qryCarteiraOrig.Open;
    //AL_24
    OperComum.LimpaParametros(qryOrigem);
    qryOrigem.ParamByName('DATAEX').AsString  := qryDATAEX.AsString;
    qryOrigem.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryOrigem.Open;
end;

procedure TfrmCadSubscricao.SelDetDest(iOper: Integer);
begin
    //AL_25
    OperComum.LimpaParametros(qryCarteiraRec);
    qryCarteiraRec.ParamByName('DATALIMGER').AsString  := qryDATAOPER.AsString;
    qryCarteiraRec.Open;
    //AL_24
    OperComum.LimpaParametros(qryDestino);
    qryDestino.ParamByName('DATAEX').AsString  := qryDATAEX.AsString;
    qryDestino.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryDestino.Open;
end;

procedure TfrmCadSubscricao.SelDetVenc(iOper: Integer);
begin
    OperComum.LimpaParametros(qryVencimento);
    //AL_24
    qryVencimento.ParamByName('DATAEX').AsString  := qryDATAEX.AsString;
    qryVencimento.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryVencimento.Open;
end;

procedure TfrmCadSubscricao.HabDetOrig(bAcao:Boolean);
begin
   dbeBoletaProv.Enabled := bAcao;
   dblTipoOperProv.Enabled := bAcao;
   dblCarteiraProvisao.Enabled := bAcao;
   dblCustodianteProv.Enabled := bAcao;
   dblMotivoBloqueioProv.Enabled := bAcao;
   dblPlanPatroProv.Enabled := bAcao;
end;

procedure TfrmCadSubscricao.HabDetDest(bAcao:Boolean);
begin
   dbeBoletaRec.Enabled := bAcao;
   dblTipoOperRec.Enabled := bAcao;
   dblCarteiraRec.Enabled := bAcao;
   dblCustodianteRec.Enabled := bAcao;
   dblMotivoBloqueioRec.Enabled := bAcao;
   dblPlanPatroRec.Enabled := bAcao;
end;

procedure TfrmCadSubscricao.FormShow(Sender: TObject);
begin
   inherited;
   qryTipoOperacao.Open;
   QryEmissor.Open;
   qryTipoDireito.Open;
   Sel(-1);
   pgcAge.ActivePage := TbsDireitos;
   pgctrlDetalhe.ActivePage := tbsDet;
end;

procedure TfrmCadSubscricao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryTipoOperacao.Close;
   QryEmissor.Close;
   qryTipoDireito.Close;
   QryInvestimentoAcao.Close;
end;

procedure TfrmCadSubscricao.sbtnInserirClick(Sender: TObject);
begin
   pgcAge.ActivePage := TbsDireitos;
   inherited;
   // AL_14 - Controle de travamento
   if qry.State = dsInsert then
   begin
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      qryIDOPERACAODIREITO.AsInteger := LeUltRegistro(nil,'OPERACAODIREITO');
      qryPARIDADE.AsFloat            := 1;
      qryPERCENTUAL.AsFloat          := 100;
      qryFLGTIPODIREITO.AsString     := 'P';
      Sel(qryIDOPERACAODIREITO.AsInteger, False);

      //AL_23
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

procedure TfrmCadSubscricao.CmeDetalheInsert(Sender: TObject);
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

procedure TfrmCadSubscricao.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
   //AL_19
   begin
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
      //AL_19
      HabilitaValorExercido;
   end;
   HabilitaCamposDireito(True);
end;

procedure TfrmCadSubscricao.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   //AL_7
   // AL_17
   if (Qry.State = DsInsert) and (not qryDetalhe.IsEmpty) and
      (Direitos.ExisteOperDir(qryIDTIPOOPERACAO.AsInteger,
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
   //AL_2
   if qryTipoOperacaoIDTIPOOPERACAO.AsInteger <> pRPI.IDTIPOOPERDIRDSU then
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
   //AL_17
   if qryTipoOperacaoIDTIPOOPERACAO.AsInteger <> pRPI.IDTIPOOPERDIRDSU then
   begin
      if Trim(dbdCOM.Text) = '' then
      begin
         Accept := False;
         MsgDlg('Não foi informada a Data Prevista para esta AGE,'+#13+
                'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dbdCOM.CanFocus then
            dbdCOM.SetFocus;
         Exit;
      end;
   end
   else
   if ((DbdVencimento.Enabled) And (Trim(DbdVencimento.Text) = ''))  then
   begin
      Accept := False;
      MsgDlg('Não foi informada a Data de Vencimento para esta AGE,'+#13+
             'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if DbdVencimento.CanFocus then
         DbdVencimento.SetFocus;
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

procedure TfrmCadSubscricao.bbtnOkDetClick(Sender: TObject);
begin
   CmeDetalhe.RepetirInsert := False;
   //Thiago Passo - 03/02/2009 - N. Sol 107933 -  N. Kintana 486332
   if pgctrlDetalhe.ActivePage  = tbsVencimentos then
     begin
       qryVencimento.ApplyUpdates;
       bbtnCancelarDetClick(Sender);

       inherited
     end;
   if pgctrlDetalhe.ActivePage = tbsDet  then
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
      bVencimento := False;      
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
      bVencimento := False;
   end

end;

{Incrementa fornecedor, bolsa de valores, boleta, data de vencimento}
procedure TfrmCadSubscricao.FornecedorCli(wIdCustodiante, iInvestimento  : Integer;
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

procedure TfrmCadSubscricao.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
    // AL_14 - Controle de travamento
   if qry.State = dsEdit then
   begin
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      if dblTipoOperacao.CanFocus then
         dblTipoOperacao.SetFocus;
   end;
end;

procedure TfrmCadSubscricao.sbtnExcluiDetClick(Sender: TObject);
var sBol: String;
    iResp: Integer;
begin
   if pgctrlDetalhe.ActivePage = tbsDet then
   begin
      if MsgDlg('Exclui o Investimento e as Operações de Origem, Destino e Não Exercício?','Mensagem do Sistema',mtConfirmation,[mbYes, mbNo],0) = mrYes then
      begin
         try
            //AL_26
            bVencimento := False;
            // AL_3
            //Exclui as boletas de Vencimento
            qryVencimento.First;
            while not qryVencimento.Eof do
            begin
               sBol := qryVencimentoNUMDOCUMENTO.AsString;
               if not RendaVariavel.ExcluiBoleta(sBol, False, True, fraMens) then
                  Raise Exception.Create('Não foi possível excluir as operações de Não Exercício da boleta ' + sBol);
               while ((not qryVencimento.Eof) and (sBol = qryVencimentoNUMDOCUMENTO.AsString)) do
                  qryVencimento.Next;
            end;
            // AL_3 - Fim

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

      //AL_15 Ini
      try
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
                  //AL_26
                  bVencimento := False;
               end;
               inherited;
            end
            else if iResp = mrNo then
            begin
               // AL_3
               //Exclui as boletas de Vencimento
               qryVencimento.First;
               while not qryVencimento.Eof do
               begin
                  sBol := qryVencimentoNUMDOCUMENTO.AsString;
                  if not RendaVariavel.ExcluiBoleta(sBol, False, True, fraMens) then
                     Raise Exception.Create('Não foi possível excluir as operações de Não Exercício da boleta ' + sBol);
                  while ((not qryVencimento.Eof) and (sBol = qryVencimentoNUMDOCUMENTO.AsString)) do
                     qryVencimento.Next;
               end;
               // AL_3 - Fim

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
               //AL_26 
               bVencimento := True;
               Sel(qryIDOPERACAODIREITO.AsInteger, False);
            end;
         end
         else
            MsgDlg('Existem operações de Destino para esta AGE.' + #13 +
                   'Não é possível excluir nenhuma Operação de Origem.' + #13 +
                   'Se for necessário exclua a Boleta de Destino primeiro.', 'Mensagem do Sistema',
                   mtInformation, [mbOk], 0);
      except
         on E:Exception do
         begin
            MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning,[MbOk],0);
            bbtnCancelar.Click;
         end;
      end;
      //AL_15 Fim
   end
   else
   if pgctrlDetalhe.ActivePage = tbsDestino then
   begin
      //AL_15 Ini
      try
         //AL_26 
         bVencimento := False;
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
            // AL_3
            //Exclui as boletas de Vencimento
            qryVencimento.First;
            while not qryVencimento.Eof do
            begin
               //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
               if RendaVariavel.VerificaMarcado(-1, -1, qryVencimentoIDINVESTIMENTO.AsInteger) then
                  Raise Exception.Create('O Investimento "' + Trim(qryVencimentoDESCINVESTIMENTO.AsString) +'"'+ #13 +
                                         'está marcado para reprocessamento.'+ #13 +
                                         'A operação será cancelada!'+ #13 +
                                         'Por favor execute o reprocessamento para esse Investimento.');

               sBol := qryVencimentoNUMDOCUMENTO.AsString;
               if not RendaVariavel.ExcluiBoleta(sBol, False, True, fraMens) then
                  Raise Exception.Create('Não foi possível excluir as operações de Não Exercício da boleta ' + sBol);
               while ((not qryVencimento.Eof) and (sBol = qryVencimentoNUMDOCUMENTO.AsString)) do
                  qryVencimento.Next;
            end;
            // AL_3 - Fim
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
      except
         on E:Exception do
         begin
            MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning,[MbOk],0);
            bbtnCancelar.Click;
         end;
      end;
      //AL_15 Fim
   end
   else
   // AL_3 - Inicio
   if pgctrlDetalhe.ActivePage = tbsVencimentos then
   begin
      if MsgDlg('Exclui as Operações de Não Exercício?','Mensagem do Sistema',mtConfirmation,[mbYes, mbNo],0) = mrYes then
      begin
         //AL_15 Ini  
         try

            // SOL 187977 KTN 1770309 Otacilio ** INICIO **
            //Verifica se existe boletas Marcadas.
            qryVencimento.First;
            qryVencimento.DisableControls;
            while not qryVencimento.Eof do
            begin

               //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
               if RendaVariavel.VerificaMarcado(-1, -1, qryVencimentoIDINVESTIMENTO.AsInteger) then
                  Raise Exception.Create('O Investimento "' + Trim(qryVencimentoDESCINVESTIMENTO.AsString) +'"'+ #13 +
                                         'está marcado para reprocessamento.'+ #13 +
                                         'A operação será cancelada!'+ #13 +
                                         'Por favor execute o reprocessamento para esse Investimento.');
                 qryVencimento.Next;
            end;
            qryVencimento.EnableControls;


            //Exclui as boletas de Vencimento
            qryVencimento.First;
            while not qryVencimento.Eof do
            begin

               //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
               {if RendaVariavel.VerificaMarcado(-1, -1, qryVencimentoIDINVESTIMENTO.AsInteger) then
                  Raise Exception.Create('O Investimento "' + Trim(qryVencimentoDESCINVESTIMENTO.AsString) +'"'+ #13 +
                                         'está marcado para reprocessamento.'+ #13 +
                                         'A operação será cancelada!'+ #13 +
                                         'Por favor execute o reprocessamento para esse Investimento.');}

               sBol := qryVencimentoNUMDOCUMENTO.AsString;
               if not RendaVariavel.ExcluiBoleta(sBol, False, True, fraMens) then
                  Raise Exception.Create('Não foi possível excluir as operações de Não Exercício da boleta ' + sBol);
               while ((not qryVencimento.Eof) and (sBol = qryVencimentoNUMDOCUMENTO.AsString)) do
                  qryVencimento.Next;
            end;
            // SOL 187977 KTN 1770309 Otacilio ** FIM **

            inherited;
            //AL_26
            bVencimento := True;
            Sel(qryIDOPERACAODIREITO.AsInteger, False, False);
         except
            on E:Exception do
            begin
               MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning,[MbOk],0);
               bbtnCancelar.Click;
            end;
         end;
         //AL_15 Fim
      end;
   end;
   // AL_3 - Fim
   //AL_19
   HabilitaValorExercido;  
end;

procedure TfrmCadSubscricao.dblTipoOperacaoExit(Sender: TObject);
begin
   inherited;
   HabilitaCamposDireito(True);
   //AL_19
   HabilitaValorExercido;
end;

procedure TfrmCadSubscricao.bbtnConfirmarClick(Sender: TObject);
var bCriaLancto, bConfirma, bAltOrig, bAltDest, bReproc: Boolean;
    wTipoRecDesBol, wMensErro, sTipoCustodia, sBol: String;
    wPlano, wPlanilha, wDocumCont, wIdOperCust, iIdHistCustodia, iIdCarteiraXEvento: Integer;
    fSaldoCaixa : Currency;
begin
   // Caso não confirmar, não pode fazer o finally
   CmeCadastroBeforeConfirma(Self, bConfirma);
   if not bConfirma then
      Exit;                                  

   //AL_26
   if not bVencimento then
   begin
     //AL_21
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
   end
   else
   if not qry.IsEmpty then
     begin
        if not CtrlInvContab.TestaPeriodo(qryDatavencimento.AsString, 2) then
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

         //Al_10
         bReproc := False;         

         fraMens.Pos := 0;
         fraMens.Max := (qryDestino.RecordCount * 2) + qryBoleta.RecordCount;

         qryDestino.First;
         while not qryDestino.Eof do
         begin
            fraMens.Mes := 'Limpando Custodia da Boleta ' + qryDestinoNUMDOCUMENTO.AsString;
            if qryDestinoALTERADO.AsString = 'S' then
            begin
               if not OperacaoInvest.ExcluiCustodia('', -1, qryDestinoIDOPERACAOINVEST.AsInteger) then
                  Raise Exception.Create('Não foi possível excluir uma Custodia da boleta ' + qryDestinoNUMDOCUMENTO.AsString);

               qryDestino.Edit;
               qryDestinoIDOPERCUSTODIA.Clear;
               qryDestino.Post;
                                 
               bReproc := True;
            end;
            qryDestino.Next;
            fraMens.Incrementa;
         end;

         fraMens.Mostra;
         fraMens.Mes := 'Atualizando Histórico das Carteiras';
         qryHistCartInv.ApplyUpdates;
         fraMens.Mes := 'Atualizando AGE';
         qry.ApplyUpdates;
         fraMens.Mes := 'Atualizando Investimentos para a AGE';
         qryDetalhe.ApplyUpdates;
         fraMens.Mes := 'Atualizando operações de Origem';
         qryOrigem.ApplyUpdates;
         fraMens.Mes := 'Atualizando operações de Destino';
         qryDestino.ApplyUpdates;

         // Zera o Buffer de memória do CachedUpdates
         qry.CommitUpdates;
         qryDetalhe.CommitUpdates;
         qryOrigem.CommitUpdates;
         qryDestino.CommitUpdates;
         qryHistCartInv.CommitUpdates;

         //Al_10

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

         //Al_10
 
         qryBoleta.ApplyUpdates;
         qryBoleta.CommitUpdates;

         // AL_3
         if bReproc then
         begin
            //Exclui as boletas de Vencimento
            qryVencimento.First;
            while not qryVencimento.Eof do
            begin
               sBol := qryVencimentoNUMDOCUMENTO.AsString;
               if not RendaVariavel.ExcluiBoleta(sBol, False, True, fraMens) then
                  Raise Exception.Create('Não foi possível excluir as operações de Não Exercício da boleta ' + sBol);
               while ((not qryVencimento.Eof) and (sBol = qryVencimentoNUMDOCUMENTO.AsString)) do
                  qryVencimento.Next;
            end;
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
               fraMens.Mes := 'Lançando Históricos de R$ ' + FormatFloat('###,###,###,##0.00', qryDestinoVLROPERACAO.AsFloat) + #13 +
                              'Carteira: ' + qryDestinoDESCCARTINVEST.AsString;

               //AL_22
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
                                                 qryDestinoNATUREZAOPERACAO.AsString {Movimento},
                                                 qryDestinoNATUREZAOPERACAO.AsString {Operacao},
                                                 qryDestinoIDLOTE.AsString,
                                                 Trim(qryDestinoDESCTIPOOPERACAO.AsString) + ' / ' +
                                                      Trim(qryDestinoDESCINVESTIMENTO.AsString),
                                                 'OPE', '1', '', True, -1,
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
                  //AL_23
                  //AL_22
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
                                                             qryDestinoIDPLANPREVCTBPATR.AsInteger,
                                                             -1,                                    // 05/06/2009 Thiago Passos SOL 119072  Kintana  566102
                                                             qryDestinoIDPLANPREVCTBPATR.AsInteger) Then  // 05/06/2009 Thiago Passos SOL 119072  Kintana  566102
                     Raise Exception.Create('Não foi possível lançar a Custódia da boleta ' + qryDestinoNUMDOCUMENTO.AsString);

                  ExecutarQuery(qryAuxiliar,'UPDATE OPERACAOINVEST ' +
                                            'SET IDOPERCUSTODIA = ' + IntToStr(wIdOperCust) + ' ' +
                                            'WHERE IDOPERACAOINVEST = ' + qryDestinoIDOPERACAOINVEST.AsString);

                  if qryDestinoIDMOTIVOBLOQUEIO.AsInteger = -1 then
                     sTipoCustodia := 'C'
                  else
                     sTipoCustodia := 'Y';  //AUMENTA SALDO BLOQUEADO
                  //AL_22
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
                     //AL_22
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
                                                //AL_15
                                                //qryDestinoDATAVENCOPER.AsDateTime,
                                                dbdCOM.Date,
                                                wPlano, wPlanilha, wDocumCont, wMensErro,
                                                ' '{sCapCar}, False, True, 0, True,
                                                qryDestinoIDPLANPREVCTBPATR.AsInteger) <> 0 then
                        Raise Exception.Create('Não foi possível contabilizar uma Operação de Destino');

                     // Al_9
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
                     RendaVariavel.MarcarFlagReproc(qryDestinoIDINVESTIMENTO.AsInteger,
                                                    -1,qryDestinoIDPLANPREVCTBpatr.AsInteger, qryDATAOPER.AsDateTime);  // 05/06/2009 Thiago Passos SOL 119072  Kintana  566102
               end;
            end
            else
            begin
               iIdCarteiraXEvento := CotaComum.BuscaEventoPorTpOper(
                                               qryDestinoIDCARTEIRAINVEST.AsInteger,
                                               qryDestinoIDCARTEIRAGERENC.AsInteger,
                                               qryDestinoIDTIPOOPERACAO.AsInteger);

               if iIdCarteiraXEvento = 0 then
                  Raise Exception.Create('Não foi cadastrado o evento de Caixa/Cota da operação '+#13+
                             'para a Carteira Gerencial.');

               if iIdCarteiraXEvento <> 0 then
               begin
                  //AL_22
                  fSaldoCaixa := CaixaComum.BuscaSaldoCaixa(
                                            qryDestinoDATAOPERACAO.AsDateTime,
                                            qryDestinoIDCARTEIRAINVEST.AsInteger,
                                            qryDestinoIDCARTEIRAGERENC.AsInteger,
                                            qryDestinoIDPLANPREVCTBPATR.AsInteger, 'OPE');
                  //AL_22
                  if not CaixaComum.GravaEventosCaixa(
                                    qryDestinoDATAOPERACAO.AsDateTime,
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
         //AL_7
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
      //AL_7
      Sel(qryIDOPERACAODIREITO.AsInteger);
      qryOrigem.EnableControls;
      qryDestino.EnableControls;
      CmeDetalhe.AtualizaBotoes(Self);
      CmeCadastro.AtualizaBotoes(Self);
      //AL_19
      HabilitaValorExercido;
   end;
end;

procedure TfrmCadSubscricao.FormResize(Sender: TObject);
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

procedure TfrmCadSubscricao.CalculaVlrLiq(Origem: String = 'O');
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


procedure TfrmCadSubscricao.dsOrigemStateChange(Sender: TObject);
begin
   inherited;
   HabDetOrig((qryOrigem.State = dsInsert));
   dbrQtdProv.Enabled    := (qryOrigem.State in [dsInsert, dsEdit]);
end;

procedure TfrmCadSubscricao.CmeDetalheConfirma(Sender: TObject);
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
            qryOrigemIDPLANPREVCTBPATR.AsInteger   := qryPlanPrevOrigIDPLANPREVCTBPATR.AsInteger;
            //AL_22
            qryOrigemPLANPRVCONTABPATRO.AsString   := qryPlanPrevOrigPLANPRVCONTABPATRO.AsString;
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
            qryDestinoIDPLANPREVCTBPATR.AsInteger   := qryPlanPrevDestIDPLANPREVCTBPATR.AsInteger;
            //al_22
            qryDestinoPLANPRVCONTABPATRO.AsString   := qryPlanPrevDestPLANPRVCONTABPATRO.AsString;
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

procedure TfrmCadSubscricao.dbrQtdProvExit(Sender: TObject);
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

procedure TfrmCadSubscricao.tbcDetalheChange(Sender: TObject);
begin
   inherited;
   bbtnGeraOperacoes.Visible := (pgctrlDetalhe.ActivePage <> tbsDet);
   // AL_3 - Inicio
   if pgctrlDetalhe.ActivePage = tbsOrigem then
      bbtnGeraOperacoes.Hint := 'Gera Origem'
   else if pgctrlDetalhe.ActivePage = tbsDestino then
      bbtnGeraOperacoes.Hint := 'Gera Destino'
   else if pgctrlDetalhe.ActivePage = tbsVencimentos then
      bbtnGeraOperacoes.Hint := 'Gera Vencimento'
   else
      bbtnGeraOperacoes.Hint := '';

   if pgctrlDetalhe.ActivePage = tbsOrigem then
      bbtnGeraOperacoes.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty))
   else if pgctrlDetalhe.ActivePage = tbsDestino then
      bbtnGeraOperacoes.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty) and
                                      (not qryOrigem.IsEmpty))
   else if pgctrlDetalhe.ActivePage = tbsVencimentos then
      bbtnGeraOperacoes.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty))
   //Thiago Passo - 03/02/2009 - N. Sol 107933 -  N. Kintana 486332
   else if pgctrlDetalhe.ActivePage = tbsVencimentos then
       Begin
        if ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty)) then
           begin
             sbtnAltDet.Visible := true;
             dbrQtdVenc.enabled := true;
           end;  
       end;

   if pgctrlDetalhe.ActivePage = tbsVencimentos then
   begin
      sbtnInsDet.Visible := False;
//Thiago Passo - 03/02/2009 - N. Sol 107933 -  N. Kintana 486332
//      sbtnAltDet.Visible := False;
   end
   else
   begin
      sbtnInsDet.Visible := True;
//Thiago Passo - 03/02/2009 - N. Sol 107933 -  N. Kintana 486332
  //    sbtnAltDet.Visible := True;
   end;

   // AL_3 - Fim
end;

function TfrmCadSubscricao.GeraOrigem: Boolean;
var wQtdOper, wVlrOperacao,
    wPuProporcinal, wSdoQtdCPMF, wPUMedio: Double;
    wSaldoNormal, wSaldoCCI: Double;
    wIdNovaOperacao, wIdForCli, I: Integer;
    DataAGECons: TDateTime;
    wNumDoc, sBol: String;
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

         //AL_13 

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
            //AL_16
            //AL_18
            //AL_20
            //AL_22 - Ini
            CtrlRV.BuscaSaldoRV.Executa(qryDATAEX.AsDateTime,
                                        QrySaldoOrigem.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                        QrySaldoOrigem.FieldByName('IDINVESTIMENTO').AsInteger,
                                        QrySaldoOrigem.FieldByName('IDCARTEIRAINVEST').Asinteger,
                                        QrySaldoOrigem.FieldByName('IDCARTEIRAGERENC').AsInteger, MaxInt,
                                        QrySaldoOrigem.FieldByName('IDCUSTODIANTE').AsInteger);

            wSaldoQtd    := CtrlRV.BuscaSaldoRV.SaldoQtdTotal;
            wSaldoNormal := CtrlRV.BuscaSaldoRV.SaldoQtdCC;
            wSaldoCCI    := CtrlRV.BuscaSaldoRV.SaldoQtdCCI;
            wSaldoVlr    := CtrlRV.BuscaSaldoRV.SaldoVlrTotal;
            wPUMedio     := OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoVlrTotal, CtrlRV.BuscaSaldoRV.SaldoQtdTotal);

            QrySaldoOrigemVALOREXERCIDO.AsFloat := OperComum.DivValorZero(QrySaldoOrigemQTDEDIREITO.AsFloat,
                                                                          QrySaldoOrigemQTDTITLOTE.AsInteger)*
                                                                          wPUMedio;
            QrySaldoOrigemVLRLIQ.AsFloat := QrySaldoOrigemVALOREXERCIDO.AsFloat;
            QrySaldoOrigemIR.AsFloat     := 0;
            QrySaldoOrigemVLRCUSTO.AsFloat       := OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoCusto, CtrlRV.BuscaSaldoRV.SaldoQtdTotal) * QrySaldoOrigemQTDEDIREITO.AsFloat;
            QrySaldoOrigemVLRCUSTOATUAL.AsFloat  := QrySaldoOrigemVLRCUSTO.AsFloat;
            //AL_22 - Fim

            QrySaldoOrigem.Post;

            if QrySaldoOrigemQTDEDIREITO.AsFloat = 0 then
            begin
               QrySaldoOrigem.Next;
               Continue;
            end;

            // Inicia outros Dados
            FornecedorCli(QrySaldoOrigemIDCUSTODIANTE.AsInteger,
                          QrySaldoOrigemIDINVESTIMENTO.AsInteger, wIdForCli);

            // Para I = 1 - Saldo Normal
            //      I = 2 - Saldo CCI
            for I := 1 to 2 do
            begin
               //Al_11
               if I = 1 then
               begin
                  // Saldo Normal
                  qryTipoOperOrig.Locate('IDTIPOOPERACAO', qryIDTIPOOPERACAO.AsInteger, []);
                  //AL_22
                  wQtdOper := OperComum.Round(QrySaldoOrigemQTDEDIREITO.AsFloat * (OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoQtdCC,CtrlRV.BuscaSaldoRV.SaldoQtdTotal)),0);
               end
               else
               begin
                  // Saldo CCI
                  qryTipoOperOrig.Locate('IDTIPOOPERACAO', qryIDTIPOOPERACAO.AsInteger+10000, []);
                  //AL_22
                  wQtdOper := OperComum.Round(QrySaldoOrigemQTDEDIREITO.AsFloat * (OperComum.DivValorZero(CtrlRV.BuscaSaldoRV.SaldoQtdCCI,CtrlRV.BuscaSaldoRV.SaldoQtdTotal)),0);
               end;

               //AL_13
               wNumDoc := 'RV-' + Copy(qryDATAOPER.AsString,9,2) + '/' +
                                             FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                                                                 Copy(qryDATAOPER.AsString,9,2)));
               qryBoleta.Insert;
               qryBoletaIDBOLETA.AsString     := wNumDoc;
               qryBoletaSTATUS.AsString       := 'F';
               qryBoletaDATABOLETA.AsDateTime := qryDATAOPER.AsDateTime;
               qryBoletaTIPMOVBOLETA.AsString := 'DTS';
               qryBoletaIDFORCLI.AsInteger    := wIdForCli;
               qryBoletaEXCLUIBOLETA.AsString := 'N';
               qryBoleta.Post;

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
                  //AL_22
                  qryOrigemIDPLANPREVCTBPATR.AsInteger   := QrySaldoOrigemIDPLANPREVCTBPATR.AsInteger;
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
      //AL_22
      FreeAndNil(CtrlRV);
   end;
end;

function TfrmCadSubscricao.GeraDestino: Boolean;
var wIdNovaOperacao, wIdForCli : Integer;
    wNumDoc, sBol: String;
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

         if not qryDetalhe.Locate('ORIGDEST', 'D', []) then
            Raise Exception.Create('Não foi Possível localizar o Investimento de Destino');

         if not QryInvestimentoAcao.Locate('IDINVESTIMENTO', qryDetalheIDINVESTIMENTO.AsInteger, []) then
            Raise Exception.Create('Não foi Possível localizar o Investimento de Destino');

         //AL_13

         while not qryOrigem.Eof do
         begin
            fraMens.Mes := 'Processando: ' + qryOrigemDESCCARTINVEST.AsString +  #13 +
                           OperComum.IIF(qryOrigemSGLCUSTODIANTE.IsNull, '', ' Custodia: ' + qryOrigemSGLCUSTODIANTE.AsString) +
                           OperComum.IIF(qryOrigemSIGLAMOTBLOQ.IsNull, '', ' Bloqueio: ' + qryOrigemSIGLAMOTBLOQ.AsString);
            //AL_25
            //Caso o parametro de carteria gerencial for N (Não) ou estiver Nulo e a data da operação for
            // maior que a data de encerramento da carteria gerencial, NÃO gera o recebimento
            if (((pRPI.FLGCARTGERENC = 'N') or (pRPI.FLGCARTGERENC = '')) and
                ((OperComum.IIF(dbdCOM.Enabled = True, qryDATACOM.AsDateTime, qryDATAVENCIMENTO.AsDateTime)) > pRPI.DATAMOVCDBLIB)) and
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

            //AL_13
            // Inicializa o Cliente/Fornecedor e a data de vencimento
            FornecedorCli(qryDestinoIDCUSTODIANTE.AsInteger,
                          qryDestinoIDINVESTIMENTO.AsInteger, wIdForCli);

            wNumDoc := 'RV-' + Copy(qryDATAOPER.AsString,9,2) + '/' +
                                    FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' + Copy(qryDATAOPER.AsString,9,2)));
            qryBoleta.Insert;
            qryBoletaIDBOLETA.AsString     := wNumDoc;
            qryBoletaSTATUS.AsString       := 'F';
            qryBoletaDATABOLETA.AsDateTime := qryDATAOPER.AsDateTime;
            qryBoletaTIPMOVBOLETA.AsString := 'DTS';
            qryBoletaIDFORCLI.AsInteger    := wIdForCli;
            qryBoletaEXCLUIBOLETA.AsString := 'N';
            qryBoleta.Post;

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
            //AL_22
            qryDestinoIDPLANPREVCTBPATR.AsInteger   := qryOrigemIDPLANPREVCTBPATR.AsInteger;
            qryDestinoPLANPRVCONTABPATRO.AsString   := qryOrigemPLANPRVCONTABPATRO.AsString;

            // AL_3 - Ini
            qryDestinoDATAOPERACAO.AsDateTime       := qryDATAOPER.AsDateTime;
            qryDestinoDATAVENCOPER.AsDateTime       := CalcVenc(qryDATAOPER.AsDateTime, qryTipoOperRecVENCIMENTO.AsInteger);
            // AL_3 - Fim
            qryDestinoDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
            qryDestinoFLGSTATUSFECHBOL.AsString     := 'F';
            qryDestinoFLGSTATUSORDMOV.AsString      := 'L';
            qryDestinoPERCENTUAL.AsFloat            := qryPERCENTUAL.AsFloat;
            qryDestinoQTDEOPERACAO.AsFloat          := OperComum.Round((qryOrigemQTDEOPERACAO.AsFloat * OperComum.DivValorZero(qryPERCENTUAL.AsFloat,100)),0);
            qryDestinoPRECOUNITOPERACAO.AsFloat     := qryDIVPORACAO.AsFloat;
            qryDestinoNUMDOCUMENTO.AsString         := wNumDoc;
            qryDestinoIDFORCLI.AsInteger            := wIdForCli;
            qryDestinoORIGDEST.AsString             := 'D';
            // AL_8
            if qryTipoOperRecIDTIPOOPERACAO.AsInteger = pRPI.IDTIPOOPERDIRDSU then
               qryDestinoVLROPERACAO.AsFloat        := 0
            else
               qryDestinoVLROPERACAO.AsFloat        := OperComum.Round((qryDestinoQTDEOPERACAO.AsFloat*OperComum.DivValorZero(qryDIVPORACAO.AsFloat,QryInvestimentoAcaoQTDTITLOTE.AsInteger)),2);

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

// AL_3 - Nova rotina
function TfrmCadSubscricao.GeraVencimento: Boolean;
begin
   //Paulo Nobre - 16/01/2009 - N. Sol 106500 -  N. Kintana 477367
   // Rotina inclusa para não permitir a checagem de datas para o emissor abaixo
   If QryInvestimentoAcao.ParamByName('IDEMISSOR').AsInteger = 1056101 Then // Emissor = TG
   Begin
      RendaVariavel.AtualizaSubscricaoVencida(DbdVencimento.DateTime, qryIDOPERACAODIREITO.AsInteger, fraMens);
      qryVencimento.Close;
      qryVencimento.Open;
   End
   Else
   Begin
      //Ricardo Cristiano - 16/06/2009 - N. Sol 119534 -  N. Kintana 568940
      //************************************************** Rotina Anterior
      If ((DbdVencimento.DateTime <= pRPI.DATAULTFECH) or
          (DbdVencimento.DateTime = DiasUteisInv.PrimeiroDiaUtilPosterior(pRPI.DATAULTFECH,-1,1,'',True,False,False))) Then
         Begin
            RendaVariavel.AtualizaSubscricaoVencida(DbdVencimento.DateTime, qryIDOPERACAODIREITO.AsInteger, fraMens);
            qryVencimento.Close;
            qryVencimento.Open;
         End
      Else
         MsgDlg('Faltam ' + IntToStr(DiasUteisInv.IntervaloDias(pRPI.DATAULTFECH, DbdVencimento.DateTime)) + ' para o vencimento da operação',
                'Mensagem do Sistema', mtInformation, [mbOk],0);
      //**************************************************
   End;
end;

Function TfrmCadSubscricao.BuscaBoleta(dData: TDateTime; wIDForCli: Integer): String;
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
            qryBoletaTIPMOVBOLETA.AsString := 'DTS';
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

function TfrmCadSubscricao.CalcVenc(dDataOper: TDateTime; iPrazo: Integer): TDateTime;
begin
   Result := DiasUteisInv.SomaDiasUteis(dDataOper, iPrazo,-1,1,'',True,False,False)
end;

//AL_22
function TfrmCadSubscricao.AchaOrigem(iPlanPrev, iTipoOper, iCartInvest, iCartGerenc, iCustodiante, iMotBloq: Integer): Boolean;
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
            //AL_22
            (qryOrigemIDPLANPREVCTBPATR.AsInteger= iPlanPrev) and
            // AL_8
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

procedure TfrmCadSubscricao.bbtnGeraOperacoesClick(Sender: TObject);
//Ricardo Cristiano - 16/06/2009 - N. Sol 119534 -  N. Kintana 568940
var sBol : string;
begin
   inherited;
   //AL_7
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
            bVencimento := False;            
         end;
      end
      // AL_3 - Inicio
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
            bVencimento := False;
         end;
      end
      else
      if pgctrlDetalhe.ActivePage = tbsVencimentos then
      begin
         with qryVencimento, OperComum do
         begin
            if not IsEmpty then
            begin
               //Ricardo Cristiano - 16/06/2009 - N. Sol 119534 -  N. Kintana 568940
               if InvMsgBox('Para Regerar as Operações de Não Exercício é Necessário Excluir as Operações Atuais',
                            mtConfirmation, 'Mensagem do Sistema',
                            [mbYes, mbCancel], 'Continua;Cancela') = mrCancel then
                  Exit
               else
               begin
                  try
                     //Exclui as boletas de Vencimento
                     qryVencimento.First;
                     while not qryVencimento.Eof do
                     begin
                        sBol := qryVencimentoNUMDOCUMENTO.AsString;
                        if not RendaVariavel.ExcluiBoleta(sBol, False, True, fraMens) then
                           Raise Exception.Create('Não foi possível excluir as operações de Não Exercício da boleta ' + sBol);
                        while ((not qryVencimento.Eof) and (sBol = qryVencimentoNUMDOCUMENTO.AsString)) do
                           qryVencimento.Next;
                     end;

                     inherited;

                     bVencimento := True;

                     Sel(qryIDOPERACAODIREITO.AsInteger, False, False);

                  except
                     on E:Exception do
                     begin
                        MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning,[MbOk],0);
                        bbtnCancelar.Click;
                        exit;
                     end;
                  end;
               end;
            end;
            GeraVencimento;
            bVencimento := True;
            //Thiago Passo - 03/02/2009 - N. Sol 107933 -  N. Kintana 486332
            sbtnAltDet.Enabled    := (not qryVencimento.IsEmpty);
            sbtnExcluiDet.Enabled := (not qryVencimento.IsEmpty);
            Label30.Enabled       := (not qryVencimento.IsEmpty);
            dbrQtdVenc.Enabled    := (not qryVencimento.IsEmpty);
         end;
      end;
      // AL_3 - Fim
   finally
      bbtnGeraOperacoes.Down := False;
      //AL_19
      HabilitaValorExercido;
   end;
end;

procedure TfrmCadSubscricao.dsStateChange(Sender: TObject);
begin
   inherited;
   if pgctrlDetalhe.ActivePage = tbsOrigem then
      bbtnGeraOperacoes.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty))
   else if pgctrlDetalhe.ActivePage = tbsDestino then
      bbtnGeraOperacoes.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty) and
                                      (not qryOrigem.IsEmpty))
   // AL_3
   else if pgctrlDetalhe.ActivePage = tbsVencimentos then
      bbtnGeraOperacoes.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty));
end;

procedure TfrmCadSubscricao.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;
   Sel(qryIDOPERACAODIREITO.AsInteger, False);
   HabilitaCamposDireito(True);
   //AL_19
   HabilitaValorExercido;
end;

procedure TfrmCadSubscricao.dsDetStateChange(Sender: TObject);
begin
   inherited;
   HabDetDest((qryDestino.State = dsInsert));
   dbrQtdRec.Enabled    := (qryDestino.State in [dsInsert, dsEdit]);
end;

procedure TfrmCadSubscricao.dblCarteiraProvisaoExit(Sender: TObject);
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

procedure TfrmCadSubscricao.dblCarteiraRecExit(Sender: TObject);
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

procedure TfrmCadSubscricao.CmeDetalheEdit(Sender: TObject);
begin
   inherited;
   // Controle de Quantidade alterada no recebimento
   if pgctrlDetalhe.ActivePage = tbsDestino then
      wQtdOperAnt := qryDestinoQTDEOPERACAO.AsFloat;
end;

procedure TfrmCadSubscricao.CmeCadastroEdit(Sender: TObject);
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

  // AL_3
  if qryVencimento.IsEmpty then
     DbdVencimento.Enabled := True
  else
     DbdVencimento.Enabled := False;

end;

procedure TfrmCadSubscricao.dbdDataOperacaoRecExit(Sender: TObject);
begin
  inherited;
  if qryDestino.State in [dsEdit, dsInsert] then
     qryDestinoDATAVENCOPER.AsDateTime := CalcVenc(dbdDataOperacaoRec.DateTime, qryTipoOperRecVENCIMENTO.AsInteger);

end;

procedure TfrmCadSubscricao.sbtnInsDetClick(Sender: TObject);
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
   //AL_19
   HabilitaValorExercido;
end;

procedure TfrmCadSubscricao.sbtnAltDetClick(Sender: TObject);
// AL_4
var iOper: Integer;
begin
   if pgctrlDetalhe.ActivePage = tbsDet then
   begin
      wOrigem := False;
      wDestino := False;
      // AL_4
      iOper := qryDetalheIDOPERDIREITOXINV.AsInteger;
      if qryDetalhe.Locate('ORIGDEST', 'O', []) then
         wOrigem := True;
      if qryDetalhe.Locate('ORIGDEST', 'D', []) then
         wDestino := True;
      // AL_4
      qryDetalhe.Locate('IDOPERDIREITOXINV', iOper, []);
   end;

   inherited;
   //AL_19
   HabilitaValorExercido;
end;

procedure TfrmCadSubscricao.sbtnApagarClick(Sender: TObject);
var sBol: String;
begin
   // AL_14
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
            //AL_21
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
            //AL_21
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

procedure TfrmCadSubscricao.CmeDetalheApplyInsert(sender: TObject; var Accept: Boolean);
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
      //AL_24
      if Trim(dblPlanPatroProv.Text) = '' then
      begin
         MsgDlg('Não foi selecionado o Plano / Patrocinadora,'+#13+
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
      //AL_24
      if Trim(dblPlanPatroRec.Text) = '' then
      begin
         MsgDlg('Não foi selecionado o Plano / Patrocinadora para esta Operação,'+#13+
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
      //AL_21
      if not CtrlInvContab.TestaPeriodo(sDataLanc, 2) then
      begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         Exit;
      end;
   end;

   Accept := True;
   inherited;

end;

procedure TfrmCadSubscricao.dbdCOMExit(Sender: TObject);
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

procedure TfrmCadSubscricao.HabilitaCamposDireito(bVisivel : Boolean);
begin
   If Trim(dblTipoOperacao.Text) <> '' then
   begin
      //AL_2 Ini
      // Se Dto de Subscrição o PU deve ficar zero para não gerar custo na operação
      if qryTipoOperacaoIDTIPOOPERACAO.AsInteger = pRPI.IDTIPOOPERDIRDSU then
      begin
         dbeDivPorAcao.Enabled := False;
         //AL_2 Fim
         //AL_15 Ini
         lblDtEx.Caption := 'Data EX';
         dbdCOM.Enabled := False;
         //AL_17
         //AL_23
         qryOrigem.FieldByName('DATAOPERACAO').DisplayLabel     := ' Data Ex. ';
         qryDestino.FieldByName('DATAOPERACAO').DisplayLabel    := ' Data Ex. ';
         qryVencimento.FieldByName('DATAOPERACAO').DisplayLabel := ' Data Ex. ';
      end
      else
      begin
         dbeDivPorAcao.Enabled := True;
         lblDtEx.Caption := 'Data Operação';
         dbdCOM.Enabled := True;
         //AL_17
         //AL_23
         qryOrigem.FieldByName('DATAOPERACAO').DisplayLabel     := ' Data Operação ';
         qryDestino.FieldByName('DATAOPERACAO').DisplayLabel    := ' Data Operação ';
         qryVencimento.FieldByName('DATAOPERACAO').DisplayLabel := ' Data Operação ';
      end;
      //AL_15    Fim

      If (qryTipoOperacao.FieldbyName('FLGDATAVENCIMENTO').AsString = 'S') And (bVisivel) Then
      begin
         LbVencimento.Enabled   := True;
         DbdVencimento.Enabled  := True;
      end
      Else
      begin
         LbVencimento.Enabled   := False;
         DbdVencimento.Enabled  := False;
      end;

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

//AL_19
procedure TfrmCadSubscricao.HabilitaValorExercido;
var
   i : integer;
begin
   if qryTipoOperacaoIDTIPOOPERACAO.AsInteger = pRPI.IDTIPOOPERDIRDSU then
   begin
      //AL_23
      qryDestino.FieldByName('VLROPERACAO').Visible := False;
      qryVencimento.FieldByName('VLROPERACAO').Visible := False;
      lblVlrExercicio.Visible         := False;
      dbrVlrRec.Visible               := False;
   end
   else
   begin
      //AL_23
      qryDestino.FieldByName('VLROPERACAO').Visible := True;
      qryVencimento.FieldByName('VLROPERACAO').Visible := True;
      lblVlrExercicio.Visible         := True;
      dbrVlrRec.Visible               := True;
   end;
end;

end.
