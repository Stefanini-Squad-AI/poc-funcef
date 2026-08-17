//******************************************************************************
//Rotina      : qryProvisao
//SOL         : 160530
//Kintana     : 1348723
//Data        : 30/06/2011
//Responsável : Ricardo Cristiano
//Problema    : Não esta gerando posicao para mais de um custodiante
//Solução     : Implementação do IDCUSTODIANTE e tratamento da data da boleta, para
//               qualquer tipo de saldo
//******************************************************************************
// Data      : 26/10/2007
// Código    : AL_43
// Pendencia : 26721
// Desc      : Ajuste no SQL do MontaSelect para filtrar pelo tipo de
//               investimento Renda Variável
//******************************************************************************
// Data      : 26/01/2007 
// Código    : AL_42
// Pendencia : 21000
// Desc      : Somente será permitida a alteração da data de operação,
//             na primeira inclusão do recebimento. A data do Financeiro será a data
//             de operação alterada ....
//******************************************************************************
// Data      : 02/05/2007
// Código    : AL_41
// Desc      : Ajuste nos arredondamentos de valores para utilizar a RoundCM
//             Ajuste no zebrado da carteira gerencial para manter compatibilidade
//******************************************************************************
// Data      : 27/04/2007
// Código    : AL_40
// Pendencia : 24388
// SOL       : 53035
// Desc      : Acerto na filtragem das Carteiras para utiliza a View VWCARTEIRASRV
//              para não trazer Carteiras Gerenciais quando Parâmetro de integra
//              ção com Carteira Gerencial estives desmarcado e qryCarteiraProv,
//              qryCarteiraRec
//******************************************************************************
// Data      : 26/12/2006
// Código    : AL_39
// Pendencia : 24047
// Desc      : Ajuste na geração de boletas de Cancelamento
//******************************************************************************
// Data      : 14/12/2006
// Código    : AL_38
// Pendencia : 23999
// Desc      : Ajuste na geração de boletas de recebimentos
//******************************************************************************
// Data      : 03/11/2006
// Código    : AL_37
// Desc      : Ajuste na Segregação de Planos - Geração de Boletas de Cancelamento (DFM)
//******************************************************************************
// Data      : 31/10/2006
// Código    : AL_36
// Pendencia : 23659
// Desc      : Colocação de combos de Plano/Patro nas inclusões manuais
//             Substituição de todos os mtErross por mtWarnings
//******************************************************************************
// Data      : 05/10/2006
// Código    : AL_35
// Pendencia : 22962
// Desc      : Ajuste na busca das boletas no momento do recebimento
//******************************************************************************
// Data      : 26/09/2006
// Código    : AL_34
// Pendencia : 22962
// Desc      : Segregação de Planos
//******************************************************************************
// Data      : 07/08/2006
// Código    : AL_33
// Pendencia : 23009
// Desc      : Retirada dos relatórios (Só serão válidos os relatórios do
//               menu Consulta / Renda Variável / Direito
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_32
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 07/07/2006
// Código   : AL_31
// Pendencia:
// Desc     : Retirada do Saldo CCI de Custódia da BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 08/06/2006
// Código   : AL_30
// Pendencia: 20777
// SOL      : 35179
// Desc     : Implementação de Provisão de Perda por fluxo de percentual
//******************************************************************************
// Data     : 06/06/2006
// Código   : AL_29
// Pendencia: 22384
// SOL      : 43283
// Desc     : Contabilização da remuneração como ganho de capital
//******************************************************************************
// Data     : 24/05/2006
// Código   : AL_28
// Pendencia: 22375
// SOL      : 43236
// Desc     : Retirada do Relatório de Cancelamento de Anúncios
//*****************************************************************************
//Data	    : 11/05/2006
//Código    : Al_27
//Pendencia : 21397
//SOL       : 33207
//Motivo(S) : Acerto no STATUS das operações antigas no click do Alterar
//            Ajuste nas críticas das operações de cancelamento
//*****************************************************************************
//Data	    : 06/03/2006
//Código    : Al_26
//Motivo(S) : Ajuste na quebra da geração de boletas
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_25
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//*****************************************************************************
//Data	    : 06/03/2006
//Código    : Al_24
//Motivo(S) : Implementação da trava de fechamento de renda variavel
//            Ajuste para contabilização de Multa sobre Entrega de Ações
//******************************************************************************
// Data     : 17/01/2006
// Codigo   : AL_23
// SOL      : 37126
// Descr.   : Implementação de um Flg para definir se uma AGE está totalmente
//              recebida restando provisão a receber
//            Implementação de novos Tipos de Operações para Ganho e Perda de Capital
//              (Contabilização da Diferença entre Anúncio e Recebimento)
//            Implementação da gravação do valor do ajuste na operaçãoinvest para reprocessamento
//            Implementação para não gerar operações para papeis sem posição na carteira
//******************************************************************************
// Data     : 06/01/2006
// Codigo   : AL_22
// Pendencia: 21135
// SOL      : 39397
// Descr.   : Ajuste na query QryOrigemDivJur para captar dentro da custódia o maior
//            ID dentro da maior Data
//******************************************************************************
// Data   : 07/12/2005
// Codigo : AL_21
// SOL    : 37677
// Descr. : Alteração no título da tela para "Recebimentos" - DFM
//          Ajuste na crítica de saldo da provisão para o recebimento parcial
//             para permitir ajuste de um centavo
//******************************************************************************
// Data   : 31/10/2005
// Codigo : AL_20
// Descr. : Grava ORIGDEST = 'D' nas operações de recebimento
//          Verifica o parametro da operação para criticar o percentual
//******************************************************************************
// Data   : 20/10/2005
// Codigo : AL_19
// Descr. : Ajuste na procura da provisão dos registros de carteira gerencial
//             por causa do motivo de bloqueio
//********************************************************************************************************
//Data    : 20/10/2005
//Codigo  : AL_18
//Descr.  : Ajuste na comparação de valores para evitar o 1 <> 1
//********************************************************************************************************
//Data    : 18/10/2005
//Codigo  : AL_17
//Descr.  : Ajuste no controle do rateio das carteiras gerenciais pelos motivos de bloqueio
//********************************************************************************************************
//Data    : 13/10/2005
//Codigo  : AL_16
//Descr.  : Unificação dos relatórios em um data module e uma query só
//          Ajuste no rateio proporcional das carteiras gerenciais para prever o bloqueio
//********************************************************************************************************
//Data    : 05/10/2005
//Codigo  : AL_15
//Descr.  : Ajuste no controle de rateio proporcional
//********************************************************************************************************
//Data    : 04/10/2005
//Codigo  : AL_14
//Descr.  : Implementação da edição da quantidade do anúncio de proventos
//********************************************************************************************************
//Data    : 28/09/2005
//Codigo  : AL_13
//Descr.  : Ajustes gerais de acordo com as solicitações da Funcef (PAS e DFM)
//********************************************************************************************************
//Data    : 16/09/2005
//Codigo  : AL_12
//Descr.  : Implementação de Cancelamento de Recebimento
//          Alterada a crítica de Operação já existente, para somente acusar quando
//            o investimento Origem e Destino já existirem em uma nova unit uDireitos
//          Alterado o join con as carteiras para acerto de carteiras gerenciais
//          Ajustes no form e nas rotinas
//********************************************************************************************************
//Data	 :  16/08/2005
//Codigo :  AL_11
//Função :  Ajuste na query qryRecebimento para evitar cartesiano de carteira gerencial
//********************************************************************************************************
//Data	 :  06/06/2005
//Codigo :  AL_10
//Função :  Ajuste na critica das datas de boleta de recebimento para não atualizar as boletas de anúncio
//********************************************************************************************************
//Data	 :  02/06/2005
//Codigo :  AL_9
//Função :  Implementada a rotina(HabilitaCamposDireito) que habilita ou desabilita
//          os campos "Isento de IR" e "Gera IR Litígio", conforme a sua parametrização de Tipo de Operacação
//********************************************************************************************************
//Data	 :  16/05/2005
//Codigo :  AL_8
//Função :  Melhora a critica de erro no Ok da operação
//            Todo o evento BeforeConfirma passa para o ApplyInsert e ApplyEdit
//          Novo método de teste de datas contábeis em 3 camadas
//          Retirada de variaveis não utilizadas
//********************************************************************************************************
//Data	 :  12/05/2005
//Codigo :  AL_7
//Função :  Nova crítica para Verificar a Data dos recebimentos e a data da boleta
//********************************************************************************************************
//Data	 :  11/05/2005
//Codigo :  AL_6
//Função :  Ajuste na qryOrigemDivJur para pegar o maior ID dentro da maior DATA na custodia
//             (DFM)
//********************************************************************************************************
//Data	 :  06/05/2005
//Codigo :  AL_5
//Função :  Melhora a busca da provisãio para lançamentos da tela antiga
//          Ajusta a data da provisão como a data do vencimento - recebimento
//********************************************************************************************************
//Data	 :  04/05/2005
//Codigo :  AL_4
//Função :  A data Base é a DATAEX e não a DATAAGE
//          Não pode Gerar um Lançamento para cada rateio, é um para cada documento
//              Passa então a fazer só uma chamada da Lancaoperrfrv para cada boleta
//              (Criado o campo Valor na tabela Boleta) - DFM
//          Acerto ma mensagem de erro
//          Inclusão de cor diferenciada para carteiras gerenciais nos grids
//             Criação de uma rotina generica para pintar o fundo do grid de amarelo se
//             existir um campo IDCARTEIRAGERENC no dataset do grid
//          Retirada de variaveis não utilizadas
//          Ajuste na localização da provisão de um determinado recebimento
//          Ajuste na data de vencimento da provisão
//          Ajuste na data da Boleta de Recebimento
//********************************************************************************************************
//Data	 :  28/04/2005
//Codigo :  AL_3
//Função :  Permite AGEs com dados similares desde que o usuário confirme
//********************************************************************************************************
//Data	 :  26/04/2005
//Codigo :  AL_2
//Função :  Os parametros tipo Data devem sofrer formatação como dd/mm/yyyy para os casos
//            das datas gravadas com hora
//          Os valores liquidos das queries de Provisão e Recebimento estavam sendo calculados
//            errados no sql - DFM
//          Só testa o periodo contabil se a operação estiver flegada para fazer o contabil
//            ou o financeiro
//********************************************************************************************************
//Data	 :  13/04/2005
//Codigo :  AL_1
//Função :  Ajustes gerais de funcionamento no form inclusive DFM
//          Ajuste nas rotinas de geração de Provisão: Rateio das quantidades.
//          Nova Rotina de Exclusão
//          Retirada de comentários antigos
//          Acerto nas mensagens: Substituição de Provisão por Anúncio
//********************************************************************************************************
unit FCadDividendos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMDetCSInv, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  fcLabel, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, DBCtrls, FCadastroRMDetCSInv, Mask,
  FCadMestreDetCSInv, faMensagem, dxCntner, dxEditor, dxExEdtr, dxEdLib,
  dxDBELib,
  //AL_8
  Menus, uCtrlInvContab, DBClient, uCMClientDataSet, Provider, uCtrlRendaVariavel, uCtrlPadroes;

type
  TfrmCadDividendos = class(TfrmCadMestreDetalheCSInv)
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
    Label25: TLabel;
    dbrVlrRemRec: TDBRealEdit;
    Label26: TLabel;
    dbrVlrIRRec: TDBRealEdit;
    Label27: TLabel;
    dbrVlrLiqRec: TDBRealEdit;
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
    qryTipoOperacaoFLGGERACONTAB: TFloatField;
    qryTipoOperacaoFLGGERACAPCAR: TFloatField;
    //AL_4
    qryBoletaVALOR: TFloatField;
    // AL_8
    sbtnRelatorios: TToolbarButton97;
    popMnuRel: TPopupMenu;
    mnuAnuRec: TMenuItem;
    mnuExeDir: TMenuItem;
    tbsCancelamento: TTabSheet;
    qryCancelamento: TwwQuery;
    updCancelamento: TUpdateSQL;
    dsCancelamento: TwwDataSource;
    qryCarteiraCan: TwwQuery;
    qryTipoOperCan: TwwQuery;
    qryCustodianteCan: TwwQuery;
    qryMotBloqCan: TwwQuery;
    Panel1: TPanel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    dblCarteiraCan: TwwDBLookupCombo;
    dbrQtdCan: TDBRealEdit;
    dbrVlrCan: TDBRealEdit;
    dblCustodianteCan: TwwDBLookupCombo;
    dbrVlrIRCan: TDBRealEdit;
    dbrVlrRemCan: TDBRealEdit;
    dbrVlrLiqCan: TDBRealEdit;
    dbeBoletaCan: TDBEdit;
    dblMotivoBloqueioCan: TwwDBLookupCombo;
    dblTipoOperCan: TwwDBLookupCombo;
    dbgCancelamento: TwwDBGrid;
    qryCancelamentoNUMDOCUMENTO: TStringField;
    qryCancelamentoDESCINVESTIMENTO: TStringField;
    qryCancelamentoDESCTIPOOPERACAO: TStringField;
    qryCancelamentoDESCCARTINVEST: TStringField;
    qryCancelamentoQTDEOPERACAO: TFloatField;
    qryCancelamentoVLROPERACAO: TFloatField;
    qryCancelamentoVLRREMUNERACAO: TFloatField;
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
    qryCancelamentoPERCENTUAL: TFloatField;
    qryCancelamentoIDCARTEIRAGERENC: TFloatField;
    qryCancelamentoIDPLANPREVCTBPATR: TFloatField;
    qryCancelamentoIDOPERCUSTODIA: TFloatField;
    qryCancelamentoIDCUSTORIG: TFloatField;
    qryCancelamentoIDMOTIVOBLOQUEIO: TFloatField;
    qryCancelamentoNATUREZAOPERACAO: TStringField;
    qryCancelamentoIDCARTEIRA: TStringField;
    qryCancelamentoALTERADO: TStringField;
    qryCarteiraCanIDCARTEIRA: TStringField;
    qryCarteiraCanIDCARTEIRAINVEST: TFloatField;
    qryCarteiraCanIDCARTEIRAGERENC: TFloatField;
    qryCarteiraCanDESCCARTINVEST: TStringField;
    qryCustodianteCanIDCUSTODIANTE: TFloatField;
    qryCustodianteCanSGLCUSTODIANTE: TStringField;
    qryMotBloqCanIDMOTIVOBLOQUEIO: TFloatField;
    qryMotBloqCanSIGLAMOTBLOQ: TStringField;
    qryMotBloqCanDESCMOTBLOQ: TStringField;
    qryCancelamentoIDOPERACAOORIGEM: TFloatField;
    Label42: TLabel;
    dbdDataOperacaoCan: TCMDateTimePicker;
    cdsSelBoleta: TCMClientDataSet;
    qryProvisaoCARTGERENCIAL: TStringField;
    dspSelBoleta: TDataSetProvider;
    qryRecebimentoCARTGERENCIAL: TStringField;
    qryCancelamentoCARTGERENCIAL: TStringField;
    qryTipoOperRecFLGGERACONTAB: TFloatField;
    qryTipoOperRecFLGGERACAPCAR: TFloatField;
    qryTipoOperCanIDTIPOINVEST: TFloatField;
    qryTipoOperCanIDTIPOOPERACAO: TFloatField;
    qryTipoOperCanIDMERCADO: TFloatField;
    qryTipoOperCanCODTIPDOC: TFloatField;
    qryTipoOperCanDESCTIPOOPERACAO: TStringField;
    qryTipoOperCanNATUREZAOPERACAO: TStringField;
    qryTipoOperCanTIPOCUSTODIA: TStringField;
    qryTipoOperCanVENCIMENTO: TFloatField;
    qryTipoOperCanFLGGERACONTAB: TFloatField;
    qryTipoOperCanFLGGERACAPCAR: TFloatField;
    qryTipoOperCanRECPAG: TStringField;
    qryTipoOperCanTIPCREDOR: TStringField;
    qryTipoOperCanFLGGERACAF: TFloatField;
    qryTipoOperCanFLGTRANSF: TStringField;
    qryTipoOperCanTRGDTINCLUSAO: TDateTimeField;
    qryTipoOperCanTRGUSERINCLUSAO: TStringField;
    qryTipoOperCanFLGCORRET: TStringField;
    qryTipoOperCanFLGORDMOVINV: TStringField;
    qryTipoOperCanIDMOTIVOBLOQUEIO: TFloatField;
    qryTipoOperCanFLGOPDIREITO: TStringField;
    qryTipoOperCanFLGAGE: TStringField;
    qryTipoOperCanFLGDATAEX: TStringField;
    qryTipoOperCanFLGDATACOM: TStringField;
    qryTipoOperCanFLGINVORIGEM: TStringField;
    qryTipoOperCanFLGPERC: TStringField;
    qryTipoOperCanFLGPARIDADE: TStringField;
    qryTipoOperCanFLGPRZBOLSA: TStringField;
    qryTipoOperCanFLGPRZEMP: TStringField;
    qryTipoOperCanFLGATADEC: TStringField;
    qryTipoOperCanFLGFORMAPAGREC: TStringField;
    qryTipoOperCanFLGDIVACAO: TStringField;
    qryTipoOperCanFLGINIPAG: TStringField;
    qryTipoOperCanFLGJUROS: TStringField;
    qryTipoOperCanMOTBLOQCARTORIG: TFloatField;
    qryTipoOperCanMOTBLOQCARTDEST: TFloatField;
    qryTipoOperCanTIPSALDOCARTORIG: TStringField;
    qryTipoOperCanTIPSALDOCARTDEST: TStringField;
    qryTipoOperCanFLGTRATAIR: TStringField;
    qryTipoOperCanSIGLATIPOOPER: TStringField;
    qryTipoOperCanFLGISENTOIR: TStringField;
    qryTipoOperCanFLGGRAVAIRLITIGIO: TStringField;
    qryTipoOperCanFLGOPGERENC: TStringField;
    qryTipoOperCanTIPOMOVTO: TStringField;
    qryTipoOperCanSTAATIVO: TStringField;
    qryTipoOperCanFLGRENTABILIDADE: TStringField;
    qryTipoOperCanFLGCONTAINVEST: TFloatField;
    qryTipoOperCanFLGMOVCOTA: TStringField;
    qryTipoOperCanFLGCOTARECDES: TStringField;
    qryTipoOperCanFLGDATAVENCIMENTO: TStringField;
    Label43: TLabel;
    dbrPUProv: TDBRealEdit;
    dbrPURec: TDBRealEdit;
    Label44: TLabel;
    Label45: TLabel;
    dbrPUCan: TDBRealEdit;
    dbcRecTotal: TDBCheckBox;
    QryOrigemDivJurPLANPRVCONTABPATRO: TStringField;
    QryOrigemDivJurIDPLANPREVCTBPATR: TFloatField;
    qryProvisaoPLANPRVCONTABPATRO: TStringField;
    qryRecebimentoPLANPRVCONTABPATRO: TStringField;
    qryCancelamentoPLANPRVCONTABPATRO: TStringField;
    qryPlanPrevCtbPatr: TwwQuery;
    qryPlanPrevCtbPatrIDPLANPREVCTBPATR: TFloatField;
    qryPlanPrevCtbPatrIDPLANOPREV: TFloatField;
    qryPlanPrevCtbPatrIDPATRO: TFloatField;
    qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField;
    qryTipoOperRecFLGCONTAINVEST: TFloatField;
    dbtDescOperResgFundos: TDBText;
    Label46: TLabel;
    dblPlanPatroProv: TwwDBLookupCombo;
    Label47: TLabel;
    dblPlanPatroRec: TwwDBLookupCombo;
    dblPlanPatroCan: TwwDBLookupCombo;
    Label48: TLabel;
    qryPlanPrevProv: TwwQuery;
    qryPlanPrevProvIDPLANPREVCTBPATR: TFloatField;
    qryPlanPrevProvIDPLANOPREV: TFloatField;
    qryPlanPrevProvIDPATRO: TFloatField;
    qryPlanPrevProvPLANPRVCONTABPATRO: TStringField;
    qryPlanPrevRec: TwwQuery;
    qryPlanPrevRecIDPLANPREVCTBPATR: TFloatField;
    qryPlanPrevRecIDPLANOPREV: TFloatField;
    qryPlanPrevRecIDPATRO: TFloatField;
    qryPlanPrevRecPLANPRVCONTABPATRO: TStringField;
    qryPlanPrevCan: TwwQuery;
    qryPlanPrevCanIDPLANPREVCTBPATR: TFloatField;
    qryPlanPrevCanIDPLANOPREV: TFloatField;
    qryPlanPrevCanIDPATRO: TFloatField;
    qryPlanPrevCanPLANPRVCONTABPATRO: TStringField;
    //AL_42
    Label49: TLabel;
    CMDateTimePicker1: TCMDateTimePicker;
    //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611 - Início
    qryCancelamentoTIPOCANCELAMENTO: TStringField;
    tbsCancelamentoVenda: TTabSheet;
    Panel2: TPanel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    DBRealEdit1: TDBRealEdit;
    DBRealEdit2: TDBRealEdit;
    wwDBLookupCombo2: TwwDBLookupCombo;
    DBRealEdit3: TDBRealEdit;
    DBRealEdit4: TDBRealEdit;
    DBRealEdit5: TDBRealEdit;
    DBEdit1: TDBEdit;
    wwDBLookupCombo3: TwwDBLookupCombo;
    wwDBLookupCombo4: TwwDBLookupCombo;
    CMDateTimePicker2: TCMDateTimePicker;
    DBRealEdit6: TDBRealEdit;
    wwDBLookupCombo5: TwwDBLookupCombo;
    dbgCancelamentoVenda: TwwDBGrid;
    UpdCancelamentoVenda: TUpdateSQL;
    DsCancelamentoVenda: TwwDataSource;
    QryCancelamentoVenda: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    StringField8: TStringField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    StringField9: TStringField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    StringField10: TStringField;
    FloatField16: TFloatField;
    StringField11: TStringField;
    FloatField17: TFloatField;
    StringField12: TStringField;
    StringField13: TStringField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    FloatField25: TFloatField;
    StringField17: TStringField;
    //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611 - Fim
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure dblEmissorExit(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dbcIsentoIrClick(Sender: TObject);
    procedure dbcIRLitigioClick(Sender: TObject);
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
    procedure dbrVlrRecExit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure dblCarteiraRecExit(Sender: TObject);
    procedure dblCarteiraCanExit(Sender: TObject);
    procedure dblCarteiraProvisaoExit(Sender: TObject);
    procedure dbrVlrIRRecExit(Sender: TObject);
    procedure dbrVlrIRProvExit(Sender: TObject);
    procedure qryProvisaoAfterScroll(DataSet: TDataSet);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure dbdDataOperacaoRecExit(Sender: TObject);
    // AL_4
    procedure PintaGrig(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
    // AL_8
    procedure mnuAnuRecClick(Sender: TObject);
    procedure CmeDetalheApplyInsert(sender: TObject; var Accept: Boolean);
    procedure mnuExeDirClick(Sender: TObject);
    procedure dbrVlrCanExit(Sender: TObject);
    procedure dbrVlrIRCanExit(Sender: TObject);
    procedure dbdDataOperacaoCanExit(Sender: TObject);
    procedure dbrVlrRecEnter(Sender: TObject);
    procedure dbrVlrCanEnter(Sender: TObject);
    procedure dbrVlrProvExit(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dblCarteiraRecEnter(Sender: TObject);
    procedure dblCarteiraCanEnter(Sender: TObject);
    //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
    procedure bbtnVoltarDetClick(Sender: TObject);
  private
    { Private declarations }
    //AL_34
    CtrlRV: TCtrlRendaVariavel;
    // AL_8
    bAceitou, bExclusao: Boolean;
//    fVlrAntProv,
    fVlrAntRec, fVlrAntCan: Double;
    // AL_13 - ProRata da Gerencial
    sBoleRat: String;
    iCartRat, iOperRat, iMotBRat, iPlanoRat: Integer;
    dDataRat, dVencRat: TDateTime;
    fPercRat, fQtdeRat, fVRemRat, fVOpeRat, fPUOpRat{, fVIReRat, fVIRRRat}: Double;

    procedure Sel(iOper: Integer; bSelAGE: Boolean = True; bSelInv: Boolean = True);
    procedure SelDetInv(iOper: Integer);
    procedure SelDetPro(iOper: Integer);
    procedure SelDetRec(iOper: Integer);
    // AL_12
    procedure SelDetCan(iOper: Integer);
    procedure HabDetProv(bAcao:Boolean);
    procedure HabDetRec(bAcao: Boolean);
    procedure HabDetCan(bAcao: Boolean);
    procedure FornecedorCli(wIdCustodiante, iInvestimento: Integer; var wIdForCli: Integer);
    procedure CalculaVlrLiq(Origem: String = 'P');
    procedure VerDiferenca(bMostra: Boolean);
    procedure VerQtdExercida;
    //AL_9
    procedure HabilitaCamposDireito(bVisivel : Boolean);
    //AL_12
    function ProvisionaOper: Boolean;
    function GeraRecebimentos: Boolean;
    //AL_12
    function GeraCancelamento: Boolean;
    //AL_34
    function BuscaBoleta(dData: TDateTime; iPlanPrev, iCarteira, iCartGer, iCustodiante, iMotBloq, iTipoOper: Integer): String;
    function CalcVenc(dDataOper: TDateTime; iPrazo: Integer): TDateTime;
    //AL_34
    function AchaProvisao(iTipoOper, iPlanPrev, iCartInvest, iCartGerenc, iCustodiante, iMotBloq: Integer): Boolean;
    //AL_13
    //AL_34
    function CarregaCDS(tabOrig: TTabSheet = nil): Boolean;
  public
    { Public declarations }
    //AL_16
    sTipoRel: String;
  end;

const cCorZebra = $00C0FFFF;  // Amarelo Bebe

var
  frmCadDividendos: TfrmCadDividendos;
  wSdoQtdCPMF, wSaldoQtd, wSaldoVlr, wSaldoIRApu, wSaldoInutil, wSaldoAqui,
  wQtdOperAnt : Double;
  sStatusAnt: String;

implementation

uses UOperComum, uMensErro, DBaseDados, UDataBase, uDocumento, uSistema,
     UBibliotecaInvest, UImpostos, UDiasUteisInv, URendaVariavel,
     dRendaVariavel, UCotaComum, UProvisaoComum, ULancContab, UCaixaComum,
     URendaFixa,
     //AL_8
     //AL_16
     FTelaAut, FParamAnunciosAbt, uDireitos, uCMMath;

{$R *.DFM}

procedure TfrmCadDividendos.Sel(iOper: Integer;
                                bSelAGE: Boolean = True;
                                bSelInv: Boolean = True);
begin
   try
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
      QryInvestimentoAcao.ParamByName('IDEMISSOR').AsInteger := qryIDEMISSOR.AsInteger;
      // AL_2
      QryInvestimentoAcao.ParamByName('DATACOTACAO').AsString := FormatDateTime('dd/mm/yyyy', qryDATAEX.AsDateTime);
      QryInvestimentoAcao.Open;       

      //AL_40
      // Esta query pode ser aberta somente aqui por que o Anúncio não pode ter a data alterada
      OperComum.LimpaParametros(qryCarteiraProv);
      qryCarteiraProv.ParamByName('DATALIMGER').AsString  := qryDATAEX.AsString;
      qryCarteiraProv.Open;

      // Esta query deve ser reaberta na edição dos recebimentos pois estes podem acontecer em mais de uma data
      OperComum.LimpaParametros(qryCarteiraRec);
      qryCarteiraRec.ParamByName('DATALIMGER').AsString  := qryDATACOM.AsString;
      qryCarteiraRec.Open;

      // Esta query deve ser reaberta na edição dos recebimentos pois estes podem acontecer em mais de uma data
      OperComum.LimpaParametros(qryCarteiraCan);
      qryCarteiraCan.ParamByName('DATALIMGER').AsString  := qryDATACOM.AsString;
      qryCarteiraCan.Open;

      if bSelInv then
         SelDetInv(iOper);
      SelDetPro(iOper);
      SelDetRec(iOper);
      //AL_12
      SelDetCan(iOper);
      VerQtdExercida;
      VerDiferenca(False);
      //AL_40
      tbcDetalhe.TabIndex := 0;
      if Assigned(tbcDetalhe.OnChange) then
         tbcDetalhe.OnChange(tbcDetalhe);

      // Habilita componentes do Cadastro Pai
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
   except
      // AL_13
      if iOper <> -2 then
      begin
         MsgDlg('Não foi possível selecionar esta AGE',
                'Mensagem do Sistema', mtWarning, [mbOK], 0);
         // AL_12
         Sel(-2);
      end;
   end;
end;

procedure TfrmCadDividendos.SelDetInv(iOper: Integer);
begin
    OperComum.LimpaParametros(qryDetalhe);
    qryDetalhe.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryDetalhe.Open
end;

procedure TfrmCadDividendos.SelDetPro(iOper: Integer);
begin
    OperComum.LimpaParametros(qryProvisao);
    //AL_40
    qryProvisao.ParamByName('DATAEX').AsString  := qryDATAEX.AsString;
    qryProvisao.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryProvisao.Open
end;

procedure TfrmCadDividendos.SelDetRec(iOper: Integer);
begin
    OperComum.LimpaParametros(qryRecebimento);
    //AL_40
    qryRecebimento.ParamByName('DATACOM').AsString  := qryDATACOM.AsString;
    qryRecebimento.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryRecebimento.Open
end;

// AL_12
procedure TfrmCadDividendos.SelDetCan(iOper: Integer);
begin
    //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
    OperComum.LimpaParametros(qryCancelamentoVenda);
    qryCancelamentoVenda.ParamByName('DATACOM').AsString  := qryDATACOM.AsString;
    qryCancelamentoVenda.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryCancelamentoVenda.Open;

    OperComum.LimpaParametros(qryCancelamento);
    //AL_40
    qryCancelamento.ParamByName('DATACOM').AsString  := qryDATACOM.AsString;
    qryCancelamento.ParamByName('IDOPERACAODIREITO').AsInteger := iOper;
    qryCancelamento.Open;
end;

procedure TfrmCadDividendos.HabDetProv(bAcao:Boolean);
begin
   dbeBoletaProv.Enabled := bAcao;
   //AL_36
   dblPlanPatroProv.Enabled := bAcao;
   dblTipoOperProv.Enabled := bAcao;
   dblCarteiraProvisao.Enabled := bAcao;
   dblCustodianteProv.Enabled := bAcao;
   dblMotivoBloqueioProv.Enabled := bAcao;
end;

procedure TfrmCadDividendos.HabDetRec(bAcao:Boolean);
begin
   dbeBoletaRec.Enabled := bAcao;
   //AL_36
   dblPlanPatroRec.Enabled := bAcao;
   dblTipoOperRec.Enabled := bAcao;
   //AL_40
   dblCarteiraRec.Enabled := True;
   dblCustodianteRec.Enabled := bAcao;
   dblMotivoBloqueioRec.Enabled := bAcao;
end;

// AL_12
procedure TfrmCadDividendos.HabDetCan(bAcao:Boolean);
begin
   dbeBoletaCan.Enabled := bAcao;
   //AL_36
   dblPlanPatroCan.Enabled := bAcao;
   dblTipoOperCan.Enabled := bAcao;
   dblCarteiraCan.Enabled := bAcao;
   dblCustodianteCan.Enabled := bAcao;
   dblMotivoBloqueioCan.Enabled := bAcao;
end;

procedure TfrmCadDividendos.FormShow(Sender: TObject);
begin
   inherited;
   qryTipoOperacao.Open;
   QryEmissor.Open;
   qryTipoDireito.Open;
   //AL_34
   qryPlanPrevCtbPatr.Open;
   Sel(-1);
   tbcDetalhe.TabIndex := 0;
   pgctrlDetalhe.ActivePage := tbsDet;
   // AL_16
   sTipoRel := '';
   //AL_36
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

procedure TfrmCadDividendos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryTipoOperacao.Close;
   QryEmissor.Close;
   qryTipoDireito.Close;
   QryInvestimentoAcao.Close;
   //AL_34
   qryPlanPrevCtbPatr.Close;
end;

procedure TfrmCadDividendos.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   qryIDOPERACAODIREITO.AsInteger := LeUltRegistro(nil,'OPERACAODIREITO');
   qryPARIDADE.AsFloat            := 1;
   qryPERCENTUAL.AsFloat          := 100;
end;

procedure TfrmCadDividendos.dblEmissorExit(Sender: TObject);
begin
   inherited;
   OperComum.LimpaParametros(QryInvestimentoAcao);
   QryInvestimentoAcao.ParamByName('IDEMISSOR').AsInteger := QryEmissorIDEMISSOR.AsInteger;
   QryInvestimentoAcao.Open;
end;

procedure TfrmCadDividendos.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   // AL_24 - Controle de travamento
   if qry.State = dsInsert then
   begin
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      qryIDOPERACAODIREITO.AsInteger := LeUltRegistro(nil,'OPERACAODIREITO');
      qryPARIDADE.AsFloat            := 1;
      qryFLGTIPODIREITO.AsString     := 'P';
      Sel(qryIDOPERACAODIREITO.AsInteger, False);
      // AL_23
      qrySTATUS.AsString := 'P';
      dbcRecTotal.Checked := False;
      sStatusAnt := qrySTATUS.AsString;
      HabilitaCamposDireito(True);
      if dblTipoOperacao.CanFocus then
         dblTipoOperacao.SetFocus;
   end;
end;

procedure TfrmCadDividendos.CmeDetalheInsert(Sender: TObject);
begin
   // Verificar esta crítica: Deve ser em local que permita cancelar a operação
   if pgctrlDetalhe.ActivePage = tbsDet then
   begin
      if not qryDetalhe.IsEmpty then
      begin
         MsgDlg('Investimento já informado para esta AGE.',
                'Mensagem do Sistema',mtWarning,[mbOK],0);
         bbtnVoltarDet.Click;
         Exit;
      end;
      if dblInvestimento.CanFocus then
         dblInvestimento.SetFocus
   end
   else if pgctrlDetalhe.ActivePage = tbsProvisao then
   begin
      if qryDetalhe.IsEmpty then
      begin
         //AL_36
         MsgDlg('Não foi informado um Investimento para esta AGE.',
                'Mensagem do Sistema',mtWarning,[mbOK],0);
         bbtnVoltarDet.Click;
         Exit;
      end;
      HabDetProv(True);
      //AL_36
      if dblPlanPatroProv.CanFocus then
         dblPlanPatroProv.SetFocus;
   end
   else if pgctrlDetalhe.ActivePage = tbsRecebimento then
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
      //AL_36
      if dblPlanPatroRec.CanFocus then
         dblPlanPatroRec.SetFocus;
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
      if qryProvisao.IsEmpty then
      begin
         MsgDlg('Não foi informado um Anúncio para esta AGE.',
                'Mensagem do Sistema',mtWarning,[mbOK],0);
         bbtnVoltarDet.Click;
         Exit;
      end;
      HabDetCan(True);
      //AL_36
      if dblPlanPatroCan.CanFocus then
         dblPlanPatroCan.SetFocus;
   end;

   inherited;

   if pgctrlDetalhe.ActivePage = tbsRecebimento then
   begin
      if qryRecebimento.State = dsInsert then
         qryRecebimentoDATAOPERACAO.AsDateTime := qryDATACOM.AsDateTime;
   end;

end;

procedure TfrmCadDividendos.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
   //AL_9
   HabilitaCamposDireito(True);
end;

procedure TfrmCadDividendos.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   // Tem que testar na alteração também, pode ter sido alterado um investimento.
   // AL_13
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
      // AL_12 - Fim
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
   if dbeDivPorAcao.Value = 0 then
   begin
      Accept := False;
      MsgDlg('Não foi informado um PU para esta AGE,'+#13+
             'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
      if dbeDivPorAcao.CanFocus then
         dbeDivPorAcao.SetFocus;
      Exit;
   end
   else
   // AL_20
   if (qryTipoOperacaoFLGPERC.AsString = 'S') and (dbePercentual.Value = 0) then
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
   end;

   if ((qry.State = DsInsert) and (qry.FieldByName('PARIDADE').AsFloat = 0)) then
      qry.FieldByName('PARIDADE').AsFloat  := 1;

   if ((qry.State = DsInsert) and (qry.FieldByName('FLGTIPODIREITO').AsString = '')) then
      qry.FieldByName('FLGTIPODIREITO').AsString  := 'P';

   Accept := True;
end;

procedure TfrmCadDividendos.bbtnOkDetClick(Sender: TObject);
var iUltOper: Integer;
    fTotQtd, fTotQtdAlt: Double;
begin
   CmeDetalhe.RepetirInsert := False;
   if pgctrlDetalhe.ActivePage = tbsDet then
      inherited
   else
   if pgctrlDetalhe.ActivePage = tbsProvisao then
   begin
      //Ricardo Cristiano - 12/07/2010 - N. Sol 160530/5702 -  N. Kintana 1359917  - Início
      {if qryProvisao.Modified then
      begin
         // Se a Provisão foi alterada exclui o histórico
         if qryHistCartInv.Locate('IDOPERACAOINVEST', qryProvisaoIDOPERACAOINVEST.AsInteger, []) then
            qryHistCartInv.Delete;
         // Exclui a Provisão Gerencial
         if qryHistProv.Locate('IDOPERACAOINVEST', qryProvisaoIDOPERACAOINVEST.AsInteger, []) then
            qryHistProv.Delete;
         // Ajusta o PU pelo valor informado
         //AL_41
         qryProvisaoPRECOUNITOPERACAO.AsFloat := RoundCM((qryProvisaoVLROPERACAO.AsFloat / qryProvisaoQTDEOPERACAO.AsFloat) * qryInvestimentoAcaoQTDTITLOTE.AsInteger, 15);
         qryProvisaoALTERADO.AsString := 'S';
      end; }

      inherited;

      qryProvisao.next;
      if qryProvisao.eof then
      begin
         qryProvisao.Prior;
         qryProvisao.next;
      end
      else
         qryProvisao.Prior;

      //Ricardo Cristiano - 12/07/2010 - N. Sol 160530/5702 -  N. Kintana 1359917  - Início
      // AL_23 - Inicio - Ao não aceitar as alterações, NÃO PODE MOVER A QUERY, muda o status para Browse
{      if bAceitou then
      begin
         // Capta quantidade da provisão alterada
         if qryProvisao.Locate('IDOPERACAOINVEST', iOperRat, []) then
            fTotQtd := qryProvisaoQTDEOPERACAO.AsFloat;

         // AL_27 - Ini
         try
            // AL_13 - Inicio
            // Controle de Ajuste automático das carteiras gerencias
            qryProvisao.DisableControls;
            qryProvisao.First;
            while not qryProvisao.Eof do
            begin
               // AL_17
               if (qryProvisaoIDOPERACAOINVEST.AsInteger <> iOperRat) and
                  (qryProvisaoIDCARTEIRAINVEST.AsInteger = iCartRat) and
                  (qryProvisaoIDPLANPREVCTBPATR.AsInteger = iPlanoRat) and
                  (((qryProvisaoIDCARTEIRAGERENC.IsNull) and
                    (qryProvisaoIDMOTIVOBLOQUEIO.AsInteger = iMotBRat)) or
                   (not qryProvisaoIDCARTEIRAGERENC.IsNull)) and
                  (qryProvisaoNUMDOCUMENTO.AsString = sBoleRat) then
               begin
                  qryProvisao.Edit;
                  // AL_15
                  iUltOper := qryProvisaoIDOPERACAOINVEST.AsInteger;
                  qryProvisaoDATAOPERACAO.AsDateTime := dDataRat;
                  qryProvisaoDATAVENCOPER.AsDateTime := dVencRat;
                  // AL_14 - Inicio
                  qryProvisaoQTDEOPERACAO.AsFloat := Int(qryProvisaoQTDEOPERACAO.AsFloat * fPercRat);
                  // AL_15
                  fTotQtdAlt := fTotQtdAlt + qryProvisaoQTDEOPERACAO.AsFloat;
                  qryProvisaoVLROPERACAO.AsFloat := qryProvisaoVLROPERACAO.AsFloat * fPercRat;
                  qryProvisaoPRECOUNITOPERACAO.AsFloat := fPUOpRat;
                  qryProvisaoVLRREMUNERACAO.AsFloat := fVRemRat * (qryProvisaoVLROPERACAO.AsFloat/fVOpeRat);
                  // AL_14 - Fim
                  CalculaVlrLiq('P');
                  qryProvisao.Post;
                  // Se a Provisão foi alterada exclui o histórico
                  if qryHistCartInv.Locate('IDOPERACAOINVEST', qryProvisaoIDOPERACAOINVEST.AsInteger, []) then
                     qryHistCartInv.Delete;
                  // Exclui a Provisão Gerencial
                  if qryHistProv.Locate('IDOPERACAOINVEST', qryProvisaoIDOPERACAOINVEST.AsInteger, []) then
                     qryHistProv.Delete;
               end;
               qryProvisao.Next;
            end;

            // AL_15 - Inicio
            // Se a quantidade alterada é diferente da quantidade da provisão original
            if Abs(fTotQtd - fTotQtdAlt) > 0 then
            begin
               // Localiza a última provisão alterada
               if qryProvisao.Locate('IDOPERACAOINVEST', iUltOper, []) then
               begin
                  qryProvisao.Edit;
                  qryProvisaoQTDEOPERACAO.AsFloat := qryProvisaoQTDEOPERACAO.AsFloat + (fTotQtd - fTotQtdAlt);
                  qryProvisao.Post;
               end;
            end;
            // AL_15 - Fim
         finally
            qryProvisao.EnableControls;
         end;
         // AL_27 - Fim
         // AL_13 - Fim
      end;}
      // AL_23 - Fim
   end
   else
   if pgctrlDetalhe.ActivePage = tbsRecebimento then
   begin
      //Ricardo Cristiano - 12/07/2010 - N. Sol 160530/5702 -  N. Kintana 1359917  - Início
{      if qryRecebimento.Modified then
      begin
         // Verificar o Tratamento nas operações
         // Se a Provisão foi alterada exclui o histórico
         if qryHistCartInv.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
            qryHistCartInv.Delete;
         // Exclui a Provisão Gerencial
         if qryHistCaixa.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
            qryHistCaixa.Delete;
         // AL_13
         qryRecebimentoALTERADO.AsString := 'S';
         //AL_40
         if pRPI.FLGCARTGERENC <> 'S' then
         begin
            if qryRecebimento.State = dsEdit then
            begin
               qryRecebimentoIDCARTEIRAINVEST.AsInteger := qryCarteiraRec.FieldByName('IDCARTEIRAINVEST').AsInteger;
               qryRecebimentoDESCCARTINVEST.AsString    := qryCarteiraRec.FieldByName('DESCCARTINVEST').AsString;
            end;
         end;
      end;}

      // AL_8 Ini
      bAceitou := True;

      inherited;

      qryRecebimento.Next;
      if qryRecebimento.eof then
      begin
         qryRecebimento.Prior;
         qryRecebimento.next;
      end
      else
         qryRecebimento.Prior;

      //Ricardo Cristiano - 12/07/2010 - N. Sol 160530/5702 -  N. Kintana 1359917  - Início
{      if bAceitou then
      begin
         // AL_13 - Inicio
         // Controle de Ajuste automático das carteiras gerencias
         // AL_27 - Ini
         try
            qryRecebimento.DisableControls;
            qryRecebimento.First;
            while not qryRecebimento.Eof do
            begin
               // AL_17
               if (qryRecebimentoIDOPERACAOINVEST.AsInteger <> iOperRat) and
                  (qryRecebimentoIDCARTEIRAINVEST.AsInteger = iCartRat) and
                  (qryRecebimentoIDPLANPREVCTBPATR.AsInteger = iPlanoRat) and
                  (((qryRecebimentoIDCARTEIRAGERENC.IsNull) and
                    (qryRecebimentoIDMOTIVOBLOQUEIO.AsInteger = iMotBRat)) or
                   (not qryRecebimentoIDCARTEIRAGERENC.IsNull)) and
                  (qryRecebimentoNUMDOCUMENTO.AsString = sBoleRat) then
               begin
                  qryRecebimento.Edit;
                  qryRecebimentoDATAOPERACAO.AsDateTime := dDataRat;
                  qryRecebimentoDATAVENCOPER.AsDateTime := dVencRat;
                  qryRecebimentoVLROPERACAO.AsFloat := qryRecebimentoVLROPERACAO.AsFloat * fPercRat;
                  // AL_14
                  qryRecebimentoPRECOUNITOPERACAO.AsFloat := fPUOpRat;
                  qryRecebimentoVLRREMUNERACAO.AsFloat := fVRemRat * (qryRecebimentoVLROPERACAO.AsFloat/fVOpeRat);
                  CalculaVlrLiq('R');
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
            // AL_13 - Fim

            // Verifica se há divergencia e mostra na tela ou ajusta automáticamente
            VerDiferenca(True);
            // Verifica a quantidade exercida em cada provisão
            VerQtdExercida;
         finally
            // AL_13
            qryRecebimento.EnableControls;
         end;
         // AL_27 - Fim
      end;}
      // AL_8 - Fim
   end
   else
   // AL_12
   if pgctrlDetalhe.ActivePage = tbsCancelamento then
   begin
      //Ricardo Cristiano - 12/07/2010 - N. Sol 160530/5702 -  N. Kintana 1359917  - Início
{      if qryCancelamento.Modified then
      begin
         // Se a Provisão foi alterada exclui o histórico
         if qryHistCartInv.Locate('IDOPERACAOINVEST', qryCancelamentoIDOPERACAOINVEST.AsInteger, []) then
            qryHistCartInv.Delete;
         // Exclui a Provisão Gerencial
         if qryHistProv.Locate('IDOPERACAOINVEST', qryCancelamentoIDOPERACAOINVEST.AsInteger, []) then
            qryHistProv.Delete;
         // Ajusta o PU pelo valor informado
         //AL_12
         //AL_41
         qryCancelamentoPRECOUNITOPERACAO.AsFloat := RoundCM((qryCancelamentoVLROPERACAO.AsFloat / qryCancelamentoQTDEOPERACAO.AsFloat) * qryInvestimentoAcaoQTDTITLOTE.AsInteger, 15);
         qryCancelamentoALTERADO.AsString := 'S';
      end;          }

      // AL_27 - Ini
      // Verificação se as alterações foram aceitas
      bAceitou := True;

      inherited;

      qryCancelamento.next;
      if qryCancelamento.eof then
      begin
         qryCancelamento.Prior;
         qryCancelamento.next;
      end
      else
         qryCancelamento.Prior;
         
      //Ricardo Cristiano - 12/07/2010 - N. Sol 160530/5702 -  N. Kintana 1359917  - Início
{      if bAceitou then
      begin
         try
            // AL_13 - Inicio
            // Controle de Ajuste automático das carteiras gerencias
            qryCancelamento.DisableControls;
            qryCancelamento.First;
            while not qryCancelamento.Eof do
            begin
               // AL_17
               if (qryCancelamentoIDOPERACAOINVEST.AsInteger <> iOperRat) and
                  (qryCancelamentoIDCARTEIRAINVEST.AsInteger = iCartRat) and
                  (qryCancelamentoIDPLANPREVCTBPATR.AsInteger = iPlanoRat) and
                  (((qryCancelamentoIDCARTEIRAGERENC.IsNull) and
                    (qryCancelamentoIDMOTIVOBLOQUEIO.AsInteger = iMotBRat)) or
                   (not qryCancelamentoIDCARTEIRAGERENC.IsNull)) and
                  (qryCancelamentoNUMDOCUMENTO.AsString = sBoleRat) then
               begin
                  qryCancelamento.Edit;
                  qryCancelamentoDATAOPERACAO.AsDateTime := dDataRat;
                  qryCancelamentoDATAVENCOPER.AsDateTime := dVencRat;
                  qryCancelamentoVLROPERACAO.AsFloat := qryCancelamentoVLROPERACAO.AsFloat * fPercRat;
                  // AL_14
                  qryCancelamentoPRECOUNITOPERACAO.AsFloat := fPUOpRat;
                  qryCancelamentoVLRREMUNERACAO.AsFloat := fVRemRat * (qryCancelamentoVLROPERACAO.AsFloat/fVOpeRat);
                  CalculaVlrLiq('C');
                  qryCancelamento.Post;
                  // Se a Provisão foi alterada exclui o histórico
                  if qryHistCartInv.Locate('IDOPERACAOINVEST', qryCancelamentoIDOPERACAOINVEST.AsInteger, []) then
                     qryHistCartInv.Delete;
                  // Exclui a Provisão Gerencial
                  if qryHistProv.Locate('IDOPERACAOINVEST', qryCancelamentoIDOPERACAOINVEST.AsInteger, []) then
                     qryHistProv.Delete;
               end;
               qryCancelamento.Next;
            end;
         finally
            qryCancelamento.EnableControls;
            // AL_13 - Fim
         end;
      end;}
      // AL_27 - Fim
   end;

end;

procedure TfrmCadDividendos.dbcIsentoIrClick(Sender: TObject);
begin
  inherited;
  // AL_13
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

procedure TfrmCadDividendos.dbcIRLitigioClick(Sender: TObject);
begin
   inherited;
   // AL_13
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
procedure TfrmCadDividendos.FornecedorCli(wIdCustodiante, iInvestimento  : Integer;
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

procedure TfrmCadDividendos.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   //AL_24 - Controle de travamento
   if qry.State = dsEdit then
   begin
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      // AL_23
      // AL_27
      if (qrySTATUS.IsNull) or (qrySTATUS.AsString <> 'T') then
      begin
         qrySTATUS.AsString := 'P';
         dbcRecTotal.Checked := False;
      end;
      sStatusAnt := qrySTATUS.AsString;
      if dblTipoOperacao.CanFocus then
         dblTipoOperacao.SetFocus;
   end;

   //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
   if pgctrlDetalhe.ActivePage = tbsCancelamentoVenda then
   begin
      bbtnGeraRecebimento.Enabled := False;
      bbtnGeraRecebimento.Hint := '';
      sbtnExcluiDet.Enabled := False;
      sbtnAltDet.Enabled := False;
      sbtnInsDet.Enabled := False;
   end;
end;

procedure TfrmCadDividendos.sbtnExcluiDetClick(Sender: TObject);
var sBol: String;
    iResp: Integer;
begin
   // AL_13
   try
      //AL_23
      if dbcRecTotal.Checked then
      begin
         MsgDlg('Esta AGE está marcada como totalmente recebida. ' + #13 +
                'Não é possível alterá-la', 'Mensagem do Sistema', mtWarning, [mbOK], 0);
         bbtnCancelarDetClick(Self);
         Exit;
      end;

      if not CarregaCDS then
      begin
         if pRPI.FLGCARTGERENC = 'S' then
         begin
            MsgDlg('Não foi possível clonar as informações para o '+ #13 +
                   'rateio automático das carteiras gerenciais',
                   'Mensagem do Sistema', mtWarning,[MbOk],0);
            bbtnCancelarDetClick(Self);
            Exit;
         end;
      end;

      bExclusao := True;
      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled := False;
      bbtnSair.Enabled := False;
      bbtnAjuda.Enabled := False;

      if pgctrlDetalhe.ActivePage = tbsDet then
      begin
         if MsgDlg('Exclui o Investimento, Anúncios, Recebimentos e Cancelamentos?','Mensagem do Sistema',mtConfirmation,[mbYes, mbNo],0) = mrYes then
         begin
            try
               //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
               if not QryCancelamentoVenda.IsEmpty then
               begin
                  MsgDlg('Existem operações de Cancelamento por Venda para esta AGE.' + #13 +
                         'Não é possível excluir nenhum anúncio.' + #13 +
                         'Por favor excluir as boletas da venda referente a operação ou'+ #13 +
                         'excluir toda a operação '+TRIM(qryTipoOperacaoDESCTIPOOPERACAO.AsString)+'.',
                         'Mensagem do Sistema', mtInformation, [mbOk], 0);
                  bbtnCancelarDetClick(Self);
                  Exit;
               end;
               // AL_12
               //Exclui a boleta de Cancelamento
               qryCancelamento.First;
               while not qryCancelamento.Eof do
               begin
                  sBol := qryCancelamentoNUMDOCUMENTO.AsString;
                  if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
                     Raise Exception.Create('Erro ao excluir os Cancelamentos da Boleta ' + sBol);
                  while ((not qryCancelamento.Eof) and (sBol = qryCancelamentoNUMDOCUMENTO.AsString)) do
                     qryCancelamento.Next;
               end;

               //Exclui a boleta de Recebimento
               qryRecebimento.First;
               while not qryRecebimento.Eof do
               begin
                  sBol := qryRecebimentoNUMDOCUMENTO.AsString;
                  if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
                     Raise Exception.Create('Erro ao excluir os Recebimentos da Boleta ' + sBol);
                  while ((not qryRecebimento.Eof) and (sBol = qryRecebimentoNUMDOCUMENTO.AsString)) do
                     qryRecebimento.Next;
               end;

               //Exclui a boleta de provisão
               qryProvisao.First;
               while not qryProvisao.Eof do
               begin
                  sBol := qryProvisaoNUMDOCUMENTO.AsString;
                  if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
                     Raise Exception.Create('Erro ao excluir os Anúncios da Boleta ' + sBol);
                  while ((not qryProvisao.Eof) and (sBol = qryProvisaoNUMDOCUMENTO.AsString)) do
                     qryProvisao.Next;
               end;

               inherited;
               // AL_23
               qrySTATUS.AsString := 'P';
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
      if pgctrlDetalhe.ActivePage = tbsProvisao then
      begin
         // AL_12
         if (qryRecebimento.IsEmpty) and (qryCancelamento.IsEmpty) then
         begin
            iResp := OperComum.InvMsgBox('Exclui Este Anúncio ou Todos',
                                         mtConfirmation, 'Mensagem do Sistema',
                                         [mbYes,mbNo,mbCancel],
                                         'Esta;Todas;Cancela');

            if iResp = mrYes then
            begin
               try
                  if qryHistCartInv.Locate('IDOPERACAOINVEST', qryProvisaoIDOPERACAOINVEST.AsInteger, []) then
                     qryHistCartInv.Delete;
                  if qryHistProv.Locate('IDOPERACAOINVEST', qryProvisaoIDOPERACAOINVEST.AsInteger, []) then
                     qryHistProv.Delete;
                  if qryBoleta.Locate('IDBOLETA', qryProvisaoNUMDOCUMENTO.AsString, []) then
                  begin
                     qryBoleta.Edit;
                     qryBoletaEXCLUIBOLETA.AsString := 'S';
                     qryBoleta.Post;
                  end;
                  inherited;
                  VerDiferenca(False);
               except
                  on E:Exception do
                  begin
                     MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning,[MbOk],0);
                     bbtnCancelar.Click;
                  end;
               end;
            end
            else if iResp = mrNo then
            begin
               try
                  // Mata todas as Provisões anteriores
                  fraMens.Mes := 'Excluindo Operações Anteriores...';
                  fraMens.Max := qryProvisao.RecordCount;
                  fraMens.Pos := 0;
                  fraMens.Mostra;
                  qryProvisao.First;
                  while not qryProvisao.Eof do
                  begin
                     sBol := qryProvisaoNUMDOCUMENTO.AsString;
                     if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
                        Raise Exception.Create('Não é possível Excluir os Anúncios da Boleta ' + sBol);
                     while ((not qryProvisao.Eof) and (sBol = qryProvisaoNUMDOCUMENTO.AsString)) do
                     begin
                        qryProvisao.Next;
                        fraMens.Incrementa;
                     end;
                  end;
                  inherited;
                  Sel(qryIDOPERACAODIREITO.AsInteger, False);
               except
                  on E:Exception do
                  begin
                     MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning,[MbOk],0);
                     bbtnCancelar.Click;
                  end;
               end;
            end;
         end
         // AL_12
         // AL_13 - Inicio
         else if not qryCancelamento.IsEmpty then
            MsgDlg('Existem operações de Cancelamento para esta AGE.' + #13 +
                   'Não é possível excluir nenhum anúncio.' + #13 +
                   'Se for necessário exclua a Boleta de Cancelamento antes.', 'Mensagem do Sistema',
                   mtInformation, [mbOk], 0)
         //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
         else if not QryCancelamentoVenda.IsEmpty then
            MsgDlg('Existem operações de Cancelamento por Venda para esta AGE.' + #13 +
                   'Não é possível excluir nenhum anúncio.' + #13 +
                   'Por favor excluir as boletas da venda referente a operação ou'+ #13 +
                   'excluir toda a operação '+TRIM(qryTipoOperacaoDESCTIPOOPERACAO.AsString)+'.',
                   'Mensagem do Sistema', mtInformation, [mbOk], 0)
         else if not qryRecebimento.IsEmpty then
            MsgDlg('Existem operações de recebimento para esta AGE.' + #13 +
                   'Não é possível excluir nenhum anúncio.' + #13 +
                   'Se for necessário exclua a Boleta de Recebimento antes.', 'Mensagem do Sistema',
                   mtInformation, [mbOk], 0);
         // AL_13 - Fim
      end
      else
      if pgctrlDetalhe.ActivePage = tbsRecebimento then
      begin
         // AL_12
         // AL_13
         if qryCancelamento.IsEmpty then
         begin
            iResp := OperComum.InvMsgBox('Exclui Esta Operação ou Todas',
                                         mtConfirmation, 'Mensagem do Sistema',
                                         [mbYes,mbNo,mbCancel],
                                         'Esta;Todas;Cancela');
            if iResp = mrYes then
            begin
               // AL_12 - Inicio
               try
                  // Verificar o Tratamento nas operações
                  if qryHistCartInv.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
                     qryHistCartInv.Delete;
                  if qryHistCaixa.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
                     qryHistCaixa.Delete;
                  if qryBoleta.Locate('IDBOLETA', qryRecebimentoNUMDOCUMENTO.AsString, []) then
                  begin
                     qryBoleta.Edit;
                     qryBoletaEXCLUIBOLETA.AsString := 'S';
                     qryBoleta.Post;
                  end;

                  // Ajusta a quantidade recebida
                  if not qryProvisao.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOORIGEM.AsInteger, []) then
                     Raise Exception.Create('Não foi possível localizar o Anúncio deste Recebimento');
                  qryProvisao.Edit;
                  qryProvisaoQTDEEXERCIDA.AsFloat := qryProvisaoQTDEEXERCIDA.AsFloat - qryRecebimentoVLROPERACAO.AsFloat;
                  qryProvisao.Post;

                  // Desmarca o FLG de totalmente recebida
                  qrySTATUS.AsString := 'P';

                  inherited;
                  VerDiferenca(False);
               except
                  on E:Exception do
                  begin
                     MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning,[MbOk],0);
                     bbtnCancelar.Click;
                  end;
               end;
               // AL_12 - Fim
            end
            else if iResp = mrNo then
            begin
               // AL_12 - Inicio
               try
                  // Mata todas os Recebimentos anteriores
                  fraMens.Mes := 'Excluindo Operações Anteriores...';
                  fraMens.Max := qryRecebimento.RecordCount * 2;
                  fraMens.Pos := 0;
                  fraMens.Mostra;
                  // Atualiza quantidade recebida do Anuncio
                  qryRecebimento.First;
                  while not qryRecebimento.Eof do
                  begin
                     if not qryProvisao.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOORIGEM.AsInteger, []) then
                        Raise Exception.Create('Não foi possível localizar o Anúncio de um Recebimento');
                     qryProvisao.Edit;
                     qryProvisaoQTDEEXERCIDA.AsFloat := qryProvisaoQTDEEXERCIDA.AsFloat - qryRecebimentoVLROPERACAO.AsFloat;
                     qryProvisao.Post;
                     qryRecebimento.Next;
                     fraMens.Incrementa;
                  end;

                  // AL_23
                  // Desmarca o FLG de totalmente recebida
                  qrySTATUS.AsString := 'P';

                  qryRecebimento.First;
                  while not qryRecebimento.Eof do
                  begin
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
               except
                  on E:Exception do
                  begin
                     MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning,[MbOk],0);
                     bbtnCancelar.Click;
                  end;
               end;
            end;
         end
         else
            MsgDlg('Existem operações de Cancelamento para esta AGE.' + #13 +
                   'Não é possível excluir nenhum recebimento.' + #13 +
                   'Se for necessário exclua a Boleta de Cancelamento antes.', 'Mensagem do Sistema',
                   mtInformation, [mbOk], 0)
         // AL_12 - Fim
      end
      else
      // AL_12
      if pgctrlDetalhe.ActivePage = tbsCancelamento then
      begin
         try
            iResp := OperComum.InvMsgBox('Exclui Esta Operação ou Todas',
                                         mtConfirmation, 'Mensagem do Sistema',
                                         [mbYes,mbNo,mbCancel],
                                         'Esta;Todas;Cancela');

            if iResp = mrYes then
            begin
               // Verificar o Tratamento nas operações
               if qryHistCartInv.Locate('IDOPERACAOINVEST', qryCancelamentoIDOPERACAOINVEST.AsInteger, []) then
                  qryHistCartInv.Delete;
               if qryHistProv.Locate('IDOPERACAOINVEST', qryCancelamentoIDOPERACAOINVEST.AsInteger, []) then
                  qryHistProv.Delete;
               if qryBoleta.Locate('IDBOLETA', qryCancelamentoNUMDOCUMENTO.AsString, []) then
               begin
                  qryBoleta.Edit;
                  qryBoletaEXCLUIBOLETA.AsString := 'S';
                  qryBoleta.Post;
               end;
               // Ajusta a quantidade recebida
               if not qryProvisao.Locate('IDOPERACAOINVEST', qryCancelamentoIDOPERACAOORIGEM.AsInteger, []) then
                  Raise Exception.Create('Não foi possível localizar o Anúncio deste Cancelamento');
               qryProvisao.Edit;
               qryProvisaoQTDEEXERCIDA.AsFloat := qryProvisaoQTDEEXERCIDA.AsFloat - qryCancelamentoVLROPERACAO.AsFloat;
               qryProvisao.Post;
               // AL_23
               // Desmarca o FLG de totalmente recebida
               qrySTATUS.AsString := 'P';
               inherited;
               VerDiferenca(False);
            end
            else if iResp = mrNo then
            begin
               // Mata todos os Cancelamentos
               fraMens.Mes := 'Excluindo Cancelamentos...';
               fraMens.Max := qryCancelamento.RecordCount * 2;
               fraMens.Pos := 0;
               fraMens.Mostra;
               // Atualiza quantidade recebida do Anuncio
               qryCancelamento.First;
               while not qryCancelamento.Eof do
               begin
                  if not qryProvisao.Locate('IDOPERACAOINVEST', qryCancelamentoIDOPERACAOORIGEM.AsInteger, []) then
                     Raise Exception.Create('Não foi possível localizar o Anúncio de um Cancelamento');
                  qryProvisao.Edit;
                  qryProvisaoQTDEEXERCIDA.AsFloat := qryProvisaoQTDEEXERCIDA.AsFloat - qryCancelamentoVLROPERACAO.AsFloat;
                  qryProvisao.Post;
                  qryCancelamento.Next;
                  fraMens.Incrementa;
               end;
               // AL_23
               // Desmarca o FLG de totalmente recebida
               qrySTATUS.AsString := 'P';
               // Exclui todas as boletas de recebimento
               qryCancelamento.First;
               while not qryCancelamento.Eof do
               begin
                  sBol := qryCancelamentoNUMDOCUMENTO.AsString;
                  if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
                     Raise Exception.Create('Não é possível excluir os Recebimentos da Boleta ' + sBol);
                  while ((not qryCancelamento.Eof) and (sBol = qryCancelamentoNUMDOCUMENTO.AsString)) do
                  begin
                     qryCancelamento.Next;
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
      end;
   finally
      // AL_13
      bExclusao := False;
      CmeCadastro.AtualizaBotoes(Self);
      bbtnSair.Enabled := True;
      bbtnAjuda.Enabled := True;
   end;
end;

procedure TfrmCadDividendos.dblTipoOperacaoExit(Sender: TObject);
begin
   inherited;
   if Trim(dblTipoOperacao.Text) <> '' then
   begin
      if qryTipoOperacao.FieldbyName('NATUREZAOPERACAO').AsString = 'N' Then
      begin
         MsgDlg('O Tipo de Atualização da Carteira não está parametrizada no Cadastro de Tipos de Operação.',
                'Mensagem do Sistema ',mtWarning,[mbOK],0);
      end;
      //AL_9
      HabilitaCamposDireito(True);
   end;
end;

procedure TfrmCadDividendos.bbtnConfirmarClick(Sender: TObject);
var bCriaLancto, bConfirma, bAltProv, bAltRec: Boolean;
    // AL_8 Retirada de variaveis
    wTipoRecDesBol, wMensErro: String;
    // AL_7
    dDataRec: TDateTime;
    // AL_4
    wPlano, wPlanilha, wDocumCont, wIdCarteiraXEvento: Integer;
    fVlrDif, fSaldoCaixa, fSaldoRec: Currency;
    // AL_5    // AL_12  // AL_23
    bAchaProv, bAltCanc, bPrimeira : Boolean;
begin
   // Caso não confirmar, não pode fazer o finally
   CmeCadastroBeforeConfirma(Self, bConfirma);
   if not bConfirma then
      Exit;

   // AL_13 - Inicio
   fraMens.Mostra;
   fraMens.Max := qryProvisao.RecordCount;
   fraMens.Mes := 'Verificando as datas dos Anúncios lançados';
   qryProvisao.First;
   while not qryProvisao.Eof do
   begin
      if qryProvisaoALTERADO.AsString = 'S' then
      begin
         if (qryTipoOperProvFLGGERACONTAB.AsInteger > 0) or (qryTipoOperProvFLGGERACAPCAR.AsInteger > 0) then
         begin
            //AL_32
            if not CtrlInvContab.TestaPeriodo(qryProvisaoDATAOPERACAO.AsString, 2) then
            begin
               MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', MtWarning, [mbOk],0);
               fraMens.Apaga;
               Exit;
            end;
         end;
      end;
      qryProvisao.Next;
      fraMens.Incrementa;
   end;

   fraMens.Mostra;
   fraMens.Max := qryRecebimento.RecordCount;
   fraMens.Mes := 'Verificando as datas dos Recebimentos lançados';
   qryRecebimento.First;
   while not qryRecebimento.Eof do
   begin
      if qryRecebimentoALTERADO.AsString = 'S' then
      begin
         if (qryTipoOperRecFLGGERACONTAB.AsInteger > 0) or (qryTipoOperRecFLGGERACAPCAR.AsInteger > 0) then
         begin
            //AL_32
            if not CtrlInvContab.TestaPeriodo(qryRecebimentoDATAOPERACAO.AsString, 2) then
            begin
               MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', MtWarning, [mbOk],0);
               fraMens.Apaga;
               Exit;
            end;
         end;
      end;
      qryRecebimento.Next;
      fraMens.Incrementa;
   end;

   fraMens.Mostra;
   fraMens.Max := qryCancelamento.RecordCount;
   fraMens.Mes := 'Verificando as datas dos Cancelamentos lançados';
   qryCancelamento.First;
   while not qryCancelamento.Eof do
   begin
      if qryCancelamentoALTERADO.AsString = 'S' then
      begin
         if (qryTipoOperCanFLGGERACONTAB.AsInteger > 0) or (qryTipoOperCanFLGGERACAPCAR.AsInteger > 0) then
         begin
            //AL_32
            if not CtrlInvContab.TestaPeriodo(qryCancelamentoDATAOPERACAO.AsString, 2) then
            begin
               MsgDlg(CtrlInvContab.MessageInfo + #13 + qryCancelamentoDATAOPERACAO.AsString, 'Mensagem do Sistema', MtWarning, [mbOk],0);
               fraMens.Apaga;
               Exit;
            end;
         end;
      end;
      qryCancelamento.Next;
      fraMens.Incrementa;
   end;

   // AL_12
   fraMens.Mostra;
   fraMens.Pos := 0;
   fraMens.Max := qryBoleta.RecordCount;

   // AL_7
   qryBoleta.First;
   while not qryBoleta.Eof do
   begin
      // AL_12
      fraMens.Mes := 'Verificando divergência de datas dos recebimento da boleta ' + qryBoletaIDBOLETA.AsString;
      qryRecebimento.First;
      // Limpa a Primeira data de Recebimento
      dDataRec := 0;
      while not qryRecebimento.Eof do
      begin
         if qryRecebimentoNUMDOCUMENTO.AsString = qryBoletaIDBOLETA.AsString then
         begin
            if dDataRec = 0 then
               dDataRec := qryRecebimentoDATAOPERACAO.AsDateTime;
            // Se existir Recebimentos em datas diferentes dentro da mesma boleta
            if dDataRec <> qryRecebimentoDATAOPERACAO.AsDateTime then
            begin
               //AL_36
               MsgDlg('Existem diferentes datas de recebimento para a boleta ' + qryBoletaIDBOLETA.AsString ,
                      'Mensagem do Sistema ',mtWarning,[mbOK],0);
               fraMens.Apaga;
               Exit;
            end;
         end;
         qryRecebimento.Next;
      end;

      // AL_10
      if (dDataRec <> 0) and (qryBoletaDATABOLETA.AsDateTime <> dDataRec) then
      begin
         qryBoleta.Edit;
         qryBoletaDATABOLETA.AsDateTime := dDataRec;
         qryBoletaEXCLUIBOLETA.AsString := 'S';
         qryBoleta.Post;
      end;

      // AL_12 - Ini
      fraMens.Mes := 'Verificando divergencia de datas dos cancelamento da boleta ' + qryBoletaIDBOLETA.AsString;
      qryCancelamento.First;
      // Limpa a Primeira data de Cancelamento
      dDataRec := 0;
      while not qryCancelamento.Eof do
      begin
         if qryCancelamentoNUMDOCUMENTO.AsString = qryBoletaIDBOLETA.AsString then
         begin
            if dDataRec = 0 then
               dDataRec := qryCancelamentoDATAOPERACAO.AsDateTime;
            // Se existir Recebimentos em datas diferentes dentro da mesma boleta
            if dDataRec <> qryCancelamentoDATAOPERACAO.AsDateTime then
            begin
               //AL_36
               MsgDlg('Existem diferentes datas de cancelamento para a boleta ' + qryBoletaIDBOLETA.AsString ,
                      'Mensagem do Sistema ',mtWarning,[mbOK],0);
               fraMens.Apaga;
               Exit;
            end;
         end;
         qryCancelamento.Next;
      end;

      if (dDataRec <> 0) and (qryBoletaDATABOLETA.AsDateTime <> dDataRec) then
      begin
         qryBoleta.Edit;
         qryBoletaDATABOLETA.AsDateTime := dDataRec;
         qryBoletaEXCLUIBOLETA.AsString := 'S';
         qryBoleta.Post;
      end;
      // AL_12 - Fim
      qryBoleta.Next;
      fraMens.Incrementa;
   end;
   // AL_7 - Fim
   // AL_13 - Fim

   try  // Finally
      // AL_12
      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled := False;
      bbtnSair.Enabled := False;
      bbtnAjuda.Enabled := False;
      try  // Except
         qryProvisao.DisableControls;
         qryRecebimento.DisableControls;
         qryCancelamento.DisableControls;

         fraMens.Mostra;
         fraMens.Mes := 'Atualizando Histórico das Carteiras';
         qryHistCartInv.ApplyUpdates;
         fraMens.Mes := 'Atualizando Histórico de Provisões Gerenciais';
         qryHistProv.ApplyUpdates;
         fraMens.Mes := 'Atualizando Histórico de Caixa';
         qryHistCaixa.ApplyUpdates;
         fraMens.Mes := 'Atualizando AGE';
         qry.ApplyUpdates;
         fraMens.Mes := 'Atualizando Investimentos para a AGE';
         qryDetalhe.ApplyUpdates;
         fraMens.Mes := 'Atualizando operações de Anúncio';
         qryProvisao.ApplyUpdates;
         fraMens.Mes := 'Atualizando Operações de Recebimento';
         qryRecebimento.ApplyUpdates;
         // AL_12
         fraMens.Mes := 'Atualizando Operações de Cancelamento';
         qryCancelamento.ApplyUpdates;

         // Zera o Buffer de memória do CachedUpdates
         qry.CommitUpdates;
         qryDetalhe.CommitUpdates;
         qryProvisao.CommitUpdates;
         qryRecebimento.CommitUpdates;
         // AL_12
         qryCancelamento.CommitUpdates;
         qryHistCartInv.CommitUpdates;
         qryHistProv.CommitUpdates;
         qryHistCaixa.CommitUpdates;

         fraMens.Pos := 0;
         fraMens.Max := qryProvisao.RecordCount + qryRecebimento.RecordCount + qryBoleta.RecordCount;

         // Se houverem Provisões alteradas, Limpa a Boleta correspondente
         qryProvisao.First;
         bAltProv := False;
         while not qryProvisao.Eof do
         begin
            fraMens.Mes := 'Verificando Contábil e Financeiro dos Anúncios';
            if qryProvisaoALTERADO.AsString = 'S' then
            begin
               bAltProv := True;
               if qryBoleta.Locate('IDBOLETA', qryProvisaoNUMDOCUMENTO.AsString, []) then
               begin
                  // Se achou a boleta, Limpa
                  fraMens.Mes := 'Limpando Contábil e Financeiro dos Anúncios' + #13 +
                                 'Boleta ' + qryBoletaIDBOLETA.AsString + ', Planilha: ' + qryBoletaPLNCODIGO.AsString + ', Documento: ' + qryBoletaCODDOCUMENTO.AsString;
                  if not OperComum.ProcExclui(qryBoletaCODDOCUMENTO.AsInteger,
                                              qryBoletaPLNCODIGO.AsInteger,
                                              qryBoletaPLANO.AsInteger, -1,
                                              qryBoletaDATABOLETA.AsDateTime,
                                              False) then
                     Raise Exception.Create('Não foi possível limpar a planilha ' + qryBoletaPLNCODIGO.AsString + #13 +
                                            'ou o Documento financeiro ' + qryBoletaCODDOCUMENTO.AsString);
                  qryBoleta.Edit;
                  qryBoletaCODDOCUMENTO.Clear;
                  qryBoletaPLANO.Clear;
                  qryBoletaPLNCODIGO.Clear;
                  qryBoletaEXCLUIBOLETA.AsString := 'S';
                  qryBoleta.Post;
               end;
            end;
            qryProvisao.Next;
            fraMens.Incrementa;
         end;

         // Enquanto houverem Recebimentos alterados, Limpa a Boleta correspondente
         qryRecebimento.First;
         bAltRec := False;
         while not qryRecebimento.Eof do
         begin
            fraMens.Mes := 'Verificando Contábil e Financeiro dos Recebimentos';
            if qryRecebimentoALTERADO.AsString = 'S' then
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
                     Raise Exception.Create('Não foi possível limpar a planilha ' + qryBoletaPLNCODIGO.AsString + #13 +
                                            'ou o Documento financeiro ' + qryBoletaCODDOCUMENTO.AsString);
                  qryBoleta.Edit;
                  qryBoletaCODDOCUMENTO.Clear;
                  qryBoletaPLANO.Clear;
                  qryBoletaPLNCODIGO.Clear;
                  qryBoletaEXCLUIBOLETA.AsString := 'S';
                  qryBoleta.Post;
               end;
            end;
            qryRecebimento.Next;
            fraMens.Incrementa;
         end;

         // AL_12
         // Se houverem Cancelamentos alteradas, Limpa a Boleta correspondente
         qryCancelamento.First;
         bAltCanc := False;
         while not qryCancelamento.Eof do
         begin
            fraMens.Mes := 'Verificando Contábil e Financeiro dos Cancelamentos de Anúncios';
            if qryCancelamentoALTERADO.AsString = 'S' then
            begin
               bAltCanc := True;
               if qryBoleta.Locate('IDBOLETA', qryCancelamentoNUMDOCUMENTO.AsString, []) then
               begin
                  // Se achou a boleta, Limpa
                  fraMens.Mes := 'Limpando Contábil e Financeiro dos Anúncios' + #13 +
                                 'Boleta ' + qryBoletaIDBOLETA.AsString + ', Planilha: ' + qryBoletaPLNCODIGO.AsString + ', Documento: ' + qryBoletaCODDOCUMENTO.AsString;
                  if not OperComum.ProcExclui(qryBoletaCODDOCUMENTO.AsInteger,
                                              qryBoletaPLNCODIGO.AsInteger,
                                              qryBoletaPLANO.AsInteger, -1,
                                              qryBoletaDATABOLETA.AsDateTime,
                                              False) then
                     Raise Exception.Create('Não foi possível limpar a planilha ' + qryBoletaPLNCODIGO.AsString + #13 +
                                            'ou o Documento financeiro ' + qryBoletaCODDOCUMENTO.AsString);
                  qryBoleta.Edit;
                  qryBoletaCODDOCUMENTO.Clear;
                  qryBoletaPLANO.Clear;
                  qryBoletaPLNCODIGO.Clear;
                  qryBoletaEXCLUIBOLETA.AsString := 'S';
                  qryBoleta.Post;
               end;
            end;
            qryCancelamento.Next;
            fraMens.Incrementa;
         end;

         // Se houverem Boleta Marcada para exclusão (exclusão de provisao ou recebimento)
         qryBoleta.First;
         while not qryBoleta.Eof do
         begin
            fraMens.Mes := 'Verificando Contábil e Financeiro das Boletas';
            if qryBoletaEXCLUIBOLETA.AsString = 'S' then
            begin
               fraMens.Mes := 'Limpando Contábil e Financeiro' + #13 +
                              'Boleta ' + qryBoletaIDBOLETA.AsString + ', Planilha: ' + qryBoletaPLNCODIGO.AsString;
               if not OperComum.ProcExclui(qryBoletaCODDOCUMENTO.AsInteger,
                                           qryBoletaPLNCODIGO.AsInteger,
                                           qryBoletaPLANO.AsInteger, -1,
                                           qryBoletaDATABOLETA.AsDateTime,
                                           False) then
                     Raise Exception.Create('Não foi possível limpar a planilha ' + qryBoletaPLNCODIGO.AsString + #13 +
                                            'ou o Documento financeiro ' + qryBoletaCODDOCUMENTO.AsString);
               qryBoleta.Edit;
               qryBoletaCODDOCUMENTO.Clear;
               qryBoletaPLANO.Clear;
               qryBoletaPLNCODIGO.Clear;
               qryBoleta.Post;
               // Se foi excluida uma das provisões desta boleta, é necessário
               //    recontabilizar todas as provisões desta boleta
               qryProvisao.First;
               while not qryProvisao.Eof do
               begin
                  if qryProvisaoNUMDOCUMENTO.AsString = qryBoletaIDBOLETA.AsString then
                  begin
                     qryProvisao.Edit;
                     qryProvisaoALTERADO.AsString := 'S';
                     qryProvisao.Post;
                     bAltProv := True;
                  end;
                  qryProvisao.Next;
               end;
               // Se foi excluida um dos Recebimentos desta boleta, é necessário
               //    recontabilizar todos os Recebimentos desta boleta
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
               // Se foi excluida uma dos Cancelamentos desta boleta, é necessário
               //    recontabilizar todas as provisões desta boleta
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
            end;
            qryBoleta.Next;
            fraMens.Incrementa;
         end;
         // Lança os Provisões
         fraMens.Mostra;
         fraMens.Max := qryProvisao.RecordCount;
         qryProvisao.First;
         while not qryProvisao.Eof do
         begin
            // Se Não achar o Histórico, Relança
            if not qryHistCartInv.Locate('IDOPERACAOINVEST', qryProvisaoIDOPERACAOINVEST.AsInteger, []) then
            begin
               fraMens.Mes := 'Lançando Históricos de R$ ' + FormatFloat('###,###,###,##0.00', qryProvisaoVLROPERACAO.AsFloat) + #13 +
                              'Carteira: ' + qryProvisaoDESCCARTINVEST.AsString;
               if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                                                 qryProvisaoIDINVESTIMENTO.AsInteger, 2,
                                                 qryProvisaoIDOPERACAOINVEST.AsInteger, -1,
                                                 qryProvisaoIDTIPOOPERACAO.AsInteger,
                                                 qryProvisaoIDCARTEIRAINVEST.AsInteger,
                                                 qryProvisaoIDCARTEIRAGERENC.AsInteger,
                                                 -1, -1, -1, -1, -1,
                                                 qryProvisaoDATAOPERACAO.AsDateTime,
                                                 qryProvisaoVLROPERACAO.AsFloat,
                                                 qryProvisaoQTDEOPERACAO.AsFloat,
                                                 pRPI.VLRCOTAINICART,
                                                 0 {Variacao}, 0{Juros},
                                                 0 {wVlrIRProv} {Verificar se vai calcular o saldo},
                                                 qryProvisaoVLRIR.AsFloat, 0, 0, 0, 0, 0,
                                                 qryProvisaoNATUREZAOPERACAO.AsString {Movimento},
                                                 qryProvisaoNATUREZAOPERACAO.AsString {Operacao},
                                                 qryProvisaoIDLOTE.AsString,
                                                 qryProvisaoDESCTIPOOPERACAO.AsString + ' / ' +
                                                      qryProvisaoDESCINVESTIMENTO.AsString,
                                                 'OPE', '1', '', True, -1,
                                                 qryProvisaoIDPLANPREVCTBPATR.Asinteger, iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível inserir os Históricos das Operações.');

               if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                  Raise Exception.Create('Não foi possivel atualizar os saldos desta Carteira/Investimento');
            end;

            // Se for Carteira Gerencial
            if not qryProvisaoIDCARTEIRAGERENC.IsNull then
            begin
               // AL_5
               bAchaProv := qryHistProv.Locate('IDOPERACAOINVEST', qryProvisaoIDOPERACAOINVEST.AsInteger, []);
               if not bAchaProv then
                  bAchaProv := qryHistProv.Locate('IDOPERACAODIREITO;IDCARTEIRAGERENC',
                                                  VarArrayOf([qryProvisaoIDOPERACAODIREITO.AsVariant,
                                                              qryProvisaoIDCARTEIRAGERENC.AsVariant]) , []);
               // Se não achar o HistProvisao desta operação, Relança
               if not bAchaProv then
               begin
                  fraMens.Mes := 'Lançando Provisão de Caixa de R$ ' + FormatFloat('###,###,###,##0.00', qryProvisaoVLROPERACAO.AsFloat) + #13 +
                                 'Carteira: ' + qryProvisaoDESCCARTINVEST.AsString;
                  wIdCarteiraXEvento := CotaComum.BuscaEventoPorTpOper(
                                                     qryProvisaoIDCARTEIRAINVEST.AsInteger,
                                                     qryProvisaoIDCARTEIRAGERENC.AsInteger,
                                                     qryProvisaoIDTIPOOPERACAO.AsInteger);
                  if wIdCarteiraXEvento = 0 then
                     Raise Exception.Create('Não foi encontrado o evento de Caixa/Cota para a Carteira Gerencial.');

                  // AL_5 - Lança na provisão no vencimento da operação
                  if not ProvisaoComum.GravaProvisao(qryProvisaoDATAOPERACAO.AsDateTime,
                                                     qryProvisaoDATAVENCOPER.AsDateTime,
                                                     qryProvisaoIDCARTEIRAINVEST.AsInteger,
                                                     qryProvisaoIDCARTEIRAGERENC.AsInteger,
                                                     wIdCarteiraXEvento,
                                                     qryProvisaoIDOPERACAOINVEST.AsInteger,
                                                     qryProvisaoIDOPERACAODIREITO.AsInteger,
                                                     qryProvisaoIDPLANPREVCTBPATR.AsInteger,
                                                     qryProvisaoVLRLIQUIDO.AsFloat) Then
                     Raise Exception.Create('Erro ao gravar o evento de Caixa.');

                  // Se Lançou uma HistProvisao, exclui a HistCota
                  with qryAuxiliar, OperComum do
                  begin
                     Close;
                     SQL.Clear;
                     SQL.Add('DELETE FROM HISTCOTA ');
                     SQL.Add('WHERE ');
                     SQL.Add('  DATAHISTCOTA >= TO_DATE(''' + IIF(qryProvisaoDATAOPERACAO.AsDateTime < (pRPI.DATAULTFECH-30), DateToStr(pRPI.DATAULTFECH-30), DateToStr(qryProvisaoDATAOPERACAO.AsDateTime)) + ''',''DD/MM/YYYY'') ');
                     ExecSQL;
                     Close;
                  end;
               end;
            end
            else
            begin
               // Se for carteira Própria
               // Se houveram alterações nas provisões e a boleta foi limpa
               // AL_24 - Não contabiliza o anúncio de Multa sobre recebimento
               if (bAltProv) and (qryBoleta.Lookup('IDBOLETA', qryProvisaoNUMDOCUMENTO.AsString, 'EXCLUIBOLETA') = 'S') and
                  (qryIDTIPOOPERACAO.AsInteger <> pRPI.IDTIPOOPERDIRMUL)then
               begin
                  fraMens.Mes := 'Contabilizando R$ ' + FormatFloat('###,###,###,##0.00', qryProvisaoVLROPERACAO.AsFloat) + #13 +
                                 'Carteira: ' + qryProvisaoDESCCARTINVEST.AsString;
                  // Parametro para Contabilidade e CAP/CAR
                  bCriaLancto    := True;
                  wTipoRecDesBol := '';
                  wMensErro      := '';

                  QryBuscaFundo.Close;
                  QryBuscaFundo.ParamByName('IDPEDIDOFUNDO').AsInteger := qryIDPEDIDOFUNDO.AsInteger;
                  QryBuscaFundo.Open;

                  // Contabiliza a Provisão
                  if qryBoleta.Locate('IDBOLETA', qryProvisaoNUMDOCUMENTO.AsString, []) then
                  begin
                     wPlano     := OperComum.IIF(qryBoletaPLANO.AsInteger = 0, -1, qryBoletaPLANO.AsInteger);
                     wPlanilha  := OperComum.IIF(qryBoletaPLNCODIGO.AsInteger = 0, -1, qryBoletaPLNCODIGO.AsInteger);
                     wDocumCont := OperComum.IIF(qryBoletaCODDOCUMENTO.AsInteger = 0, -1, qryBoletaCODDOCUMENTO.AsInteger);

                     //AL_34 - Contabiliza por Plano / Patrocinadora
                     if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                                qryProvisaoIDINVESTIMENTO.AsInteger,
                                                qryProvisaoIDTIPOOPERACAO.AsInteger,
                                                qryProvisaoIDOPERACAOINVEST.AsInteger,
                                                qryProvisaoIDFORCLI.AsInteger,
                                                qryProvisaoIDCARTEIRAINVEST.AsInteger,
                                                QryInvestimentoAcaoIDMOEDACONTAB.AsInteger,
                                                qryProvisaoDESCTIPOOPERACAO.AsString + ' - ' +
                                                     QryBuscaFundoDESCFUNDOINVEST.AsString+' '+
                                                          qryProvisaoDESCINVESTIMENTO.AsString,
                                                qryProvisaoIDLOTE.AsString,
                                                '', qryProvisaoNUMDOCUMENTO.AsString,
                                                qryTipoOperProv.Lookup('IDTIPOOPERACAO', qryProvisaoIDTIPOOPERACAO.AsInteger, 'RECPAG'),
                                                wTipoRecDesBol, bCriaLancto,
                                                qryProvisaoVLROPERACAO.AsFloat,
                                                qryProvisaoVLRLIQUIDO.AsFloat,
                                                //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
                                                OperComum.RetornaDtContabDivBonif(qryProvisaoDATAOPERACAO.AsDateTime,
                                                                                  qryProvisaoDATAOPERACAO.AsDateTime,
                                                                                  qryDATAAGE.AsDateTime),

                                                qryProvisaoDATAVENCOPER.AsDateTime,
                                                wPlano, wPlanilha, wDocumCont, wMensErro,
                                                'N'{sCapCar}, False, True, 0, True,
                                                qryProvisaoIDPLANPREVCTBPATR.Asinteger) <> 0 then
                        Raise Exception.Create('Não foi possível contabilizar o Anúncio');

                     // Atualiza a Boleta com Planilha
                     if wPlanilha > 0 then
                     begin
                        qryBoleta.Edit;
                        qryBoletaPLANO.AsInteger := wPlano;
                        qryBoletaPLNCODIGO.AsInteger := wPlanilha;
                        qryBoleta.Post;
                     end;
                  end
                  else
                    Raise Exception.Create('Não foi possível localizar a Boleta dos Anúncios');
               end;
            end;
            fraMens.Incrementa;
            qryProvisao.Next;
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
                                                 qryRecebimentoDESCTIPOOPERACAO.AsString + ' / ' +
                                                      qryRecebimentoDESCINVESTIMENTO.AsString,
                                                 'OPE', '1', '', True, -1,
                                                 qryRecebimentoIDPLANPREVCTBPATR.AsInteger, iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível inserir os Históricos das Operações.');

               if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                  Raise Exception.Create('Não foi possivel atualizar os saldos desta Carteira/Investimento');
            end;

            // Se for Carteira Gerencial
            if not qryRecebimentoIDCARTEIRAGERENC.IsNull then
            begin
               // Se não achar o HistCaixa desta operação, Relança
               if not qryHistCaixa.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
               begin
                  fraMens.Mes := 'Lançando Recebimento de Caixa de R$ ' + FormatFloat('###,###,###,##0.00', qryRecebimentoVLROPERACAO.AsFloat) + #13 +
                                 'Carteira: ' + qryRecebimentoDESCCARTINVEST.AsString;

                  wIdCarteiraXEvento := CotaComum.BuscaEventoPorTpOper(
                                                     qryRecebimentoIDCARTEIRAINVEST.AsInteger,
                                                     qryRecebimentoIDCARTEIRAGERENC.AsInteger,
                                                     qryRecebimentoIDTIPOOPERACAO.AsInteger);
                  if wIdCarteiraXEvento = 0 then
                     Raise Exception.Create('Não foi encontrado o evento de Caixa/Cota para a Carteira Gerencial.');

                  fSaldoCaixa := CaixaComum.BuscaSaldoCaixa(
                                               qryRecebimentoDATAOPERACAO.AsDateTime,
                                               qryRecebimentoIDCARTEIRAINVEST.AsInteger,
                                               qryRecebimentoIDCARTEIRAGERENC.AsInteger,
                                               qryRecebimentoIDPLANPREVCTBPATR.AsInteger, 'OPE');

                  if not CaixaComum.GravaEventosCaixa(qryRecebimentoDATAOPERACAO.AsDateTime,
                                                      qryRecebimentoIDPLANPREVCTBPATR.AsInteger,
                                                      qryRecebimentoIDTIPOOPERACAO.AsInteger,
                                                      0,
                                                      qryRecebimentoIDCARTEIRAINVEST.AsInteger,
                                                      qryRecebimentoIDCARTEIRAGERENC.AsInteger,
                                                      qryRecebimentoIDOPERACAOINVEST.AsInteger,
                                                      qryRecebimentoIDOPERACAODIREITO.AsInteger ,
                                                      qryInvestimentoAcaoDESCINVESTIMENTO.AsString,
                                                      qryRecebimentoVLRLIQUIDO.AsFloat,
                                                      fSaldoCaixa) Then
                     Raise Exception.Create('Erro ao gravar o Caixa da carteira ' + qryRecebimentoDESCCARTINVEST.AsString);
               end;
            end
            else
            begin
               // Se for carteira Própria
               // Se houveram alterações nos Recebimentos e a Boleta foi limpa
               if (bAltRec) and (qryBoleta.Lookup('IDBOLETA', qryRecebimentoNUMDOCUMENTO.AsString, 'EXCLUIBOLETA') = 'S') then
               begin
                  fraMens.Mes := 'Contabilizando R$ ' + FormatFloat('###,###,###,##0.00', qryRecebimentoVLROPERACAO.AsFloat) + #13 +
                                 'Carteira: ' + qryRecebimentoDESCCARTINVEST.AsString;

                  // AL_4 - Inicio da alteração no lançamento financeiro

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
                 // AL_4 - Fim
               end;
            end;
            fraMens.Incrementa;
            qryRecebimento.Next;
         end;

         // AL_4 - Inicio
         // Lança financeiro dos Recebimentos pela Boleta
         qryBoleta.First;
         fraMens.Pos := 0;
         fraMens.Max := qryBoleta.RecordCount;

         QryBuscaFundo.Close;
         QryBuscaFundo.ParamByName('IDPEDIDOFUNDO').AsInteger := qryIDPEDIDOFUNDO.AsInteger;
         QryBuscaFundo.Open;

         while not qryBoleta.Eof do
         begin
            fraMens.Mes := '';
            if qryBoletaVALOR.AsCurrency > 0 then
            begin
               if qryRecebimento.Locate('NUMDOCUMENTO', qryBoletaIDBOLETA.AsString, []) then
               begin

                  fraMens.Mes := 'Lançando Financeiro de Recebimento de R$ ' + FormatFloat('###,###,###,##0.00', qryBoletaVALOR.AsFloat);

                  wPlano     := OperComum.IIF(qryBoletaPLANO.AsInteger = 0, -1, qryBoletaPLANO.AsInteger);
                  wPlanilha  := OperComum.IIF(qryBoletaPLNCODIGO.AsInteger = 0, -1, qryBoletaPLNCODIGO.AsInteger);
                  wDocumCont := OperComum.IIF(qryBoletaCODDOCUMENTO.AsInteger = 0, -1, qryBoletaCODDOCUMENTO.AsInteger);

                  // Parametro para Contabilidade e CAP/CAR
                  wTipoRecDesBol := '';
                  wMensErro      := '';
                  bCriaLancto := True;
                  // AL_24
                  //AL_34 - Contabiliza por Plano / Patrocinadora
                  if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                             qryRecebimentoIDINVESTIMENTO.AsInteger,
                                             qryRecebimentoIDTIPOOPERACAO.AsInteger,
                                             qryRecebimentoIDOPERACAOINVEST.AsInteger,
                                             qryRecebimentoIDFORCLI.AsInteger,
                                             qryRecebimentoIDCARTEIRAINVEST.AsInteger,
                                             QryInvestimentoAcaoIDMOEDACONTAB.AsInteger,
                                             qryRecebimentoDESCTIPOOPERACAO.AsString + ' - ' +
                                                  QryBuscaFundoDESCFUNDOINVEST.AsString+' '+
                                                       qryRecebimentoDESCINVESTIMENTO.AsString,
                                             qryRecebimentoIDLOTE.AsString,
                                             '', qryRecebimentoNUMDOCUMENTO.AsString,
                                             qryTipoOperacaoRECPAG.AsString, wTipoRecDesBol, bCriaLancto,
                                             qryBoletaVALOR.AsCurrency, // Financeiro Total da Boleta
                                             // AL_24 - Se operação de Multa, lança contabil e financeiro
                                             OperComum.IIF((qryIDTIPOOPERACAO.AsFloat = pRPI.IDTIPOOPERDIRMUL), qryBoletaVALOR.AsFloat, 0) {fSaldoRec}, // Contábil
                                             //Ricardo Cristiano - 28/07/2011 - N. Sol  -  N. Kintana
                                             //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
                                             {OperComum.RetornaDtContabDivBonif(qryRecebimentoDATAOPERACAO.AsDateTime,
                                                                               qryRecebimentoDATAOPERACAO.AsDateTime,
                                                                               qryDATAAGE.AsDateTime),}
                                             qryRecebimentoDATAOPERACAO.AsDateTime,
                                             qryRecebimentoDATAVENCOPER.AsDateTime,
                                             wPlano, wPlanilha, wDocumCont, wMensErro,
                                             'S', False, True, 0, True,
                                             qryRecebimentoIDPLANPREVCTBPATR.AsInteger) <> 0 then
                     Raise Exception.Create('Não foi possível contabilizar um Recebimento');

                  // Atualiza a Boleta com Planilha e Documento
                  if (wPlanilha > 0) or (wDocumCont > 0) then
                  begin
                     qryBoleta.Edit;
                     if wPlanilha > 0 then
                     begin
                        qryBoletaPLANO.AsInteger := wPlano;
                        qryBoletaPLNCODIGO.AsInteger := wPlanilha;
                     end;
                     if wDocumCont > 0 then
                        qryBoletaCODDOCUMENTO.AsInteger := wDocumCont;
                     qryBoleta.Post;
                  end;
               end;
            end;
            fraMens.Incrementa;
            qryBoleta.Next;
         end;
         // AL_4 - Fim

         // AL_23 - Ini - Só faz contabilização de diferença se um Recebimento ou o Status da Boleta for alterado
         // AL_24
         //AL_34 - Se o Status for T (Total) tem que realcular de qualquer jeito 
         if ((bAltRec) or (sStatusAnt <> qrySTATUS.AsString) or (qrySTATUS.AsString = 'T')) and
            (qryIDTIPOOPERACAO.AsInteger <> pRPI.IDTIPOOPERDIRMUL) then
         begin
            // Contabilizando eventuais recebimentos maiores que a provisão
            fraMens.Pos := 0;
            fraMens.Max := qryProvisao.RecordCount;
            qryProvisao.First;
            // Só exclui o contabil da boleta, na primeira passagem (Pode haver divergencia em mais de uma operação)
            bPrimeira := True;
            while not qryProvisao.Eof do
            begin
               // Se for Carteira Própria
               if qryProvisaoIDCARTEIRAGERENC.IsNull then
               begin
                  fraMens.Mes := 'Procurando diferenças.';
                  fSaldoRec := 0;

                  if not qryRecebimento.IsEmpty then
                  begin
                     qryRecebimento.First;
                     // Soma todos os recebimentos desta provisão
                     while not qryRecebimento.Eof do
                     begin
                        // AL_29
                        if qryRecebimentoIDOPERACAOORIGEM.AsInteger = qryProvisaoIDOPERACAOINVEST.AsInteger then
                           fSaldoRec := fSaldoRec + (qryRecebimentoVLROPERACAO.AsFloat - qryRecebimentoVLRIR.AsFloat);
                        qryRecebimento.Next;
                     end;
                     // Soma todos os Cancelamentos desta provisão
                     qryCancelamento.First;
                     while not qryCancelamento.Eof do
                     begin
                        // AL_29
                        if qryCancelamentoIDOPERACAOORIGEM.AsInteger = qryProvisaoIDOPERACAOINVEST.AsInteger then
                           fSaldoRec := fSaldoRec + (qryCancelamentoVLROPERACAO.AsFloat - qryCancelamentoVLRIR.AsFloat);
                        qryCancelamento.Next;
                     end;
                     //AL_34
                     fVlrDif := fSaldoRec - (qryProvisaoVLROPERACAO.AsFloat - qryProvisaoVLRIR.AsFloat); //qryProvisaoVLRLIQUIDO.AsFloat;
                  end
                  else
                     fVlrDif := 0;

                     // Exclui todas as contabilizações dos Recebimentos desta Provisão
                     // Mesmo se a Dif for Zero, pode ter havido dif antes da alteração atual
                     qryRecebimento.First;
                     while not qryRecebimento.Eof do
                     begin
                        // Busca o Valor de Diferença contabilizado anteriormente
                        FazQuery(qryAuxiliar, 'SELECT VLROPERACAOOM FROM OPERACAOINVEST WHERE IDOPERACAOINVEST = ' + qryRecebimentoIDOPERACAOINVEST.AsString);
                        // Se é Recebimento desta Provisão e teve valor de diferença contabilizado
                        if (qryRecebimentoIDOPERACAOORIGEM.AsInteger = qryProvisaoIDOPERACAOINVEST.AsInteger) and
                           (qryAuxiliar.FieldByName('VLROPERACAOOM').AsFloat <> 0) then
                        begin
                           // Procura a Boleta
                           if qryBoleta.Locate('IDBOLETA', qryRecebimentoNUMDOCUMENTO.AsString, []) then
                           begin
                              //AL_34 - Verifica a data da operação
                              if not CtrlInvContab.TestaPeriodo(qryRecebimentoDATAOPERACAO.AsString, 2) then
                                 Raise Exception.Create(CtrlInvContab.MessageInfo);

                              // Exclui somente o Contabil
                              if not OperComum.ProcExclui(-1,
                                                          qryBoletaPLNCODIGO.AsInteger,
                                                          qryBoletaPLANO.AsInteger, -1,
                                                          qryBoletaDATABOLETA.AsDateTime,
                                                          False) then
                                 Raise Exception.Create('Não foi possível limpar a planilha ' + qryBoletaPLNCODIGO.AsString);
                           end;
                           //AL_34 - Marca como alterada para recontabilizar a remuneração
                           qryRecebimento.Edit;
                           qryRecebimentoALTERADO.AsString := 'S';
                           qryRecebimento.Post;

                           qryAuxiliar.Close;
                           qryAuxiliar.SQL.Clear;
                           qryAuxiliar.SQL.Add('UPDATE OPERACAOINVEST ');
                           qryAuxiliar.SQL.Add('SET VLROPERACAOOM = NULL');
                           qryAuxiliar.SQL.Add('WHERE IDOPERACAOINVEST = ' + qryRecebimentoIDOPERACAOINVEST.AsString);
                           qryAuxiliar.ExecSQL;
                           qryAuxiliar.SQL.Clear;

                        end;
                        qryRecebimento.Next;
                     end;

                  if (fVlrDif > 0) or ((fVlrDif < 0) and (qrySTATUS.AsString = 'T')) then
                  begin
                     fraMens.Mes := 'Contabilizando R$ ' + FormatFloat('###,###,###,##0.00', fVlrDif) + #13 +
                                    'Carteira: ' + qryRecebimentoDESCCARTINVEST.AsString;

                     // Volta até o Último Recebimento desta Provisão para contabilizar nesta operação
                     // Precisa que seja uma operação de carteira própria, para gravar e reprocessar o ajuste
                     qryRecebimento.Last;
                     while not qryRecebimento.Bof do
                     begin
                        if (qryRecebimentoIDOPERACAOORIGEM.AsInteger = qryProvisaoIDOPERACAOINVEST.AsInteger) and
                           (qryRecebimentoIDCARTEIRAGERENC.IsNull) then
                           Break;
                        qryRecebimento.Prior;
                     end;

                     //Ricardo Cristiano - 17/07/2009 - N. Sol 122100 -  N. Kintana 595036                      
                     // Contabiliza o Recebimento
                     if ((qryRecebimentoALTERADO.AsString = 'S') and (qryBoleta.Locate('IDBOLETA', qryRecebimentoNUMDOCUMENTO.AsString, []))) then
                     begin
                        // Parametro para Contabilidade e CAP/CAR
                        bCriaLancto    := True;
                        wTipoRecDesBol := '';
                        wMensErro      := '';

                        // Busca dados de Recebimentos oriundos de Resgate de Fundos
                        QryBuscaFundo.Close;
                        QryBuscaFundo.ParamByName('IDPEDIDOFUNDO').AsInteger := qryIDPEDIDOFUNDO.AsInteger;
                        QryBuscaFundo.Open;

                        // Retorna -1 para os parametros não encontrados
                        wPlano     := OperComum.IIF(qryBoletaPLANO.AsInteger = 0, -1, qryBoletaPLANO.AsInteger);
                        wPlanilha  := OperComum.IIF(qryBoletaPLNCODIGO.AsInteger = 0, -1, qryBoletaPLNCODIGO.AsInteger);
                        wDocumCont := OperComum.IIF(qryBoletaCODDOCUMENTO.AsInteger = 0, -1, qryBoletaCODDOCUMENTO.AsInteger);

                        //AL_34 - Verifica a data da operação
                        if not CtrlInvContab.TestaPeriodo(qryRecebimentoDATAOPERACAO.AsString, 2) then
                           Raise Exception.Create(CtrlInvContab.MessageInfo);

                        // Contabiliza sem o financeiro (Já efetuado)
                        //AL_34 - Contabiliza por Plano / Patrocinadora
                        if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                                   qryRecebimentoIDINVESTIMENTO.AsInteger,
                                                   OperComum.IIF(fVlrDif >= 0, -148, -147),
                                                   qryRecebimentoIDOPERACAOINVEST.AsInteger,
                                                   qryRecebimentoIDFORCLI.AsInteger,
                                                   qryRecebimentoIDCARTEIRAINVEST.AsInteger,
                                                   QryInvestimentoAcaoIDMOEDACONTAB.AsInteger,
                                                   qryRecebimentoDESCTIPOOPERACAO.AsString + ' - ' +
                                                        QryBuscaFundoDESCFUNDOINVEST.AsString+' '+
                                                             qryRecebimentoDESCINVESTIMENTO.AsString,
                                                   qryRecebimentoIDLOTE.AsString,
                                                   '', qryRecebimentoNUMDOCUMENTO.AsString,
                                                   qryTipoOperacaoRECPAG.AsString, wTipoRecDesBol, bCriaLancto,
                                                   0 {Financeiro},
                                                   fVlrDif {Contábil},
                                                   //Ricardo Cristiano - 28/07/2011 - N. Sol  -  N. Kintana
                                                   //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
{                                                   OperComum.RetornaDtContabDivBonif(qryRecebimentoDATAOPERACAO.AsDateTime,
                                                                                     qryRecebimentoDATAOPERACAO.AsDateTime,
                                                                                     qryDATAAGE.AsDateTime), }
                                                   qryRecebimentoDATAOPERACAO.AsDateTime,                                                                                     
                                                   qryRecebimentoDATAVENCOPER.AsDateTime,
                                                   wPlano, wPlanilha, wDocumCont, wMensErro,
                                                   'N'{sCapCar}, False, True, 0, True,
                                                   qryRecebimentoIDPLANPREVCTBPATR.AsInteger) <> 0 then
                           Raise Exception.Create('Não foi possível contabilizar um Recebimento');

                        // Atualiza a Boleta com Planilha e Documento
                        if (wPlanilha > 0) or (wDocumCont > 0) then
                        begin
                           qryBoleta.Edit;
                           if wPlanilha > 0 then
                           begin
                              qryBoletaPLANO.AsInteger := wPlano;
                              qryBoletaPLNCODIGO.AsInteger := wPlanilha;
                           end;
                           if wDocumCont > 0 then
                              qryBoletaCODDOCUMENTO.AsInteger := wDocumCont;
                           qryBoleta.Post;
                        end;
                        // Atualiza a Operação de Recebimento com o Valor do Ajuste (VLROPERACAOOM)
                        qryAuxiliar.SQL.Clear;
                        qryAuxiliar.SQL.Add('UPDATE OPERACAOINVEST ');
                        qryAuxiliar.SQL.Add('SET VLROPERACAOOM = ' + OperComum.OraNumero(fVlrDif) + '');
                        qryAuxiliar.SQL.Add('WHERE IDOPERACAOINVEST = ' + qryRecebimentoIDOPERACAOINVEST.AsString);
                        qryAuxiliar.ExecSQL;
                        qryAuxiliar.SQL.Clear;
                     end
                     //Ricardo Cristiano - 17/07/2009 - N. Sol 122100 -  N. Kintana 595036                     
                     else if (qryRecebimentoALTERADO.AsString = 'S') then
                       Raise Exception.Create('Não foi possível localizar a Boleta dos Anúncios para efetuar o Recebimento.');
                  end;
               end;
               qryProvisao.Next;
               fraMens.Incrementa;
            end;
         end;
         // AL_23 - Fim

         // AL_29 - Ini
         // Lança as Remunerações
         fraMens.Pos := 0;
         fraMens.Max := qryRecebimento.RecordCount;
         qryRecebimento.First;

         while not qryRecebimento.Eof do
         begin
            fraMens.Mes := 'Processando Remunerações';
            // Se for Carteira Própria
            if qryRecebimentoIDCARTEIRAGERENC.IsNull then
            begin
               // Mesmo havendo remunerações, só lança se o recebimento foi alterado (Evita lançamentos duplicados)
               if (qryRecebimentoVLRREMUNERACAO.AsFloat > 0) and
                  (qryRecebimentoALTERADO.AsString = 'S') then
               begin
                  fraMens.Mes := 'Contabilizando R$ ' + FormatFloat('###,###,###,##0.00', qryRecebimentoVLRREMUNERACAO.AsFloat) + #13 +
                                 'Carteira: ' + qryRecebimentoDESCCARTINVEST.AsString;

                  // Contabiliza o Remuneração
                  if qryBoleta.Locate('IDBOLETA', qryRecebimentoNUMDOCUMENTO.AsString, []) then
                  begin
                     // Parametro para Contabilidade e CAP/CAR
                     bCriaLancto    := True;
                     wTipoRecDesBol := '';
                     wMensErro      := '';

                     // Busca dados de Recebimentos oriundos de Resgate de Fundos
                     QryBuscaFundo.Close;
                     QryBuscaFundo.ParamByName('IDPEDIDOFUNDO').AsInteger := qryIDPEDIDOFUNDO.AsInteger;
                     QryBuscaFundo.Open;

                     // Retorna -1 para os parametros não encontrados
                     wPlano     := OperComum.IIF(qryBoletaPLANO.AsInteger = 0, -1, qryBoletaPLANO.AsInteger);
                     wPlanilha  := OperComum.IIF(qryBoletaPLNCODIGO.AsInteger = 0, -1, qryBoletaPLNCODIGO.AsInteger);
                     wDocumCont := OperComum.IIF(qryBoletaCODDOCUMENTO.AsInteger = 0, -1, qryBoletaCODDOCUMENTO.AsInteger);

                     // Contabiliza sem o financeiro (Já efetuado)
                     //AL_34 - Contabiliza por Plano / Patrocinadora
                     if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                                qryRecebimentoIDINVESTIMENTO.AsInteger,
                                                -148, // Sempre Genho de Capital
                                                qryRecebimentoIDOPERACAOINVEST.AsInteger,
                                                qryRecebimentoIDFORCLI.AsInteger,
                                                qryRecebimentoIDCARTEIRAINVEST.AsInteger,
                                                QryInvestimentoAcaoIDMOEDACONTAB.AsInteger,
                                                '',
                                                qryRecebimentoIDLOTE.AsString,
                                                qryRecebimentoDESCTIPOOPERACAO.AsString + ' - Remuneração - ' +
                                                     QryBuscaFundoDESCFUNDOINVEST.AsString+' '+
                                                          qryRecebimentoDESCINVESTIMENTO.AsString,
                                                qryRecebimentoNUMDOCUMENTO.AsString,
                                                qryTipoOperacaoRECPAG.AsString, wTipoRecDesBol, bCriaLancto,
                                                0 {Financeiro},
                                                qryRecebimentoVLRREMUNERACAO.AsFloat {Contábil},
                                                //Ricardo Cristiano - 28/07/2011 - N. Sol  -  N. Kintana
                                                //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
                                                {OperComum.RetornaDtContabDivBonif(qryRecebimentoDATAOPERACAO.AsDateTime,
                                                                                  qryRecebimentoDATAOPERACAO.AsDateTime,
                                                                                  qryDATAAGE.AsDateTime), }
                                                qryRecebimentoDATAOPERACAO.AsDateTime,
                                                qryRecebimentoDATAVENCOPER.AsDateTime,
                                                wPlano, wPlanilha, wDocumCont, wMensErro,
                                                'N'{sCapCar}, False, True, 0, True,
                                                qryRecebimentoIDPLANPREVCTBPATR.AsInteger) <> 0 then
                        Raise Exception.Create('Não foi possível contabilizar um Recebimento');

                     // Atualiza a Boleta com Planilha e Documento
                     if (wPlanilha > 0) or (wDocumCont > 0) then
                     begin
                        qryBoleta.Edit;
                        if wPlanilha > 0 then
                        begin
                           qryBoletaPLANO.AsInteger := wPlano;
                           qryBoletaPLNCODIGO.AsInteger := wPlanilha;
                        end;
                        if wDocumCont > 0 then
                           qryBoletaCODDOCUMENTO.AsInteger := wDocumCont;
                        qryBoleta.Post;
                     end;
                  end
                  else
                    Raise Exception.Create('Não foi possível localizar a Boleta de Recebimento ' + qryRecebimentoNUMDOCUMENTO.AsString);
               end;
            end;
            qryRecebimento.Next;
            fraMens.Incrementa;
         end;
         // AL_29 - Fim

         // Lança os Cancelamentos
         fraMens.Mostra;
         fraMens.Max := qryCancelamento.RecordCount;
         qryCancelamento.First;
         while not qryCancelamento.Eof do
         begin
            // Se Não achar o Histórico, Relança
            if not qryHistCartInv.Locate('IDOPERACAOINVEST', qryCancelamentoIDOPERACAOINVEST.AsInteger, []) then
            begin
               fraMens.Mes := 'Lançando Históricos de R$ ' + FormatFloat('###,###,###,##0.00', qryProvisaoVLROPERACAO.AsFloat) + #13 +
                              'Carteira: ' + qryProvisaoDESCCARTINVEST.AsString;
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
                                                 qryCancelamentoVLRIR.AsFloat, 0, 0, 0, 0, 0,
                                                 qryCancelamentoNATUREZAOPERACAO.AsString {Movimento},
                                                 qryCancelamentoNATUREZAOPERACAO.AsString {Operacao},
                                                 qryCancelamentoIDLOTE.AsString,
                                                 qryCancelamentoDESCTIPOOPERACAO.AsString + ' / ' +
                                                      qryCancelamentoDESCINVESTIMENTO.AsString,
                                                 'OPE', '1', '', True, -1,
                                                 qryCancelamentoIDPLANPREVCTBPATR.AsInteger, iIdHistCartInv) then
                  Raise Exception.Create('Não foi possível inserir os Históricos das Operações.');

               if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
                  Raise Exception.Create('Não foi possivel atualizar os saldos desta Carteira/Investimento');
            end;

            // Se for Carteira Gerencial
            if not qryCancelamentoIDCARTEIRAGERENC.IsNull then
            begin
               // AL_5
               bAchaProv := qryHistProv.Locate('IDOPERACAOINVEST', qryCancelamentoIDOPERACAOINVEST.AsInteger, []);
               // Se não achar o HistProvisao desta operação, Relança
               if not bAchaProv then
               begin
                  fraMens.Mes := 'Lançando Cancelamento de Provisão de Caixa de R$ ' + FormatFloat('###,###,###,##0.00', qryCancelamentoVLROPERACAO.AsFloat) + #13 +
                                 'Carteira: ' + qryCancelamentoDESCCARTINVEST.AsString;
                  wIdCarteiraXEvento := CotaComum.BuscaEventoPorTpOper(
                                                     qryCancelamentoIDCARTEIRAINVEST.AsInteger,
                                                     qryCancelamentoIDCARTEIRAGERENC.AsInteger,
                                                     qryCancelamentoIDTIPOOPERACAO.AsInteger);
                  if wIdCarteiraXEvento = 0 then
                     Raise Exception.Create('Não foi encontrado o evento de Caixa/Cota para a Carteira Gerencial.');

                  // AL_5 - Lança na provisão no vencimento da operação
                  if not ProvisaoComum.GravaProvisao(qryCancelamentoDATAOPERACAO.AsDateTime,
                                                     qryCancelamentoDATAVENCOPER.AsDateTime,
                                                     qryCancelamentoIDCARTEIRAINVEST.AsInteger,
                                                     qryCancelamentoIDCARTEIRAGERENC.AsInteger,
                                                     wIdCarteiraXEvento,
                                                     qryCancelamentoIDOPERACAOINVEST.AsInteger,
                                                     qryCancelamentoIDOPERACAODIREITO.AsInteger,
                                                     qryCancelamentoIDPLANPREVCTBPATR.AsInteger,
                                                     qryCancelamentoVLRLIQUIDO.AsFloat) Then
                     Raise Exception.Create('Erro ao gravar o evento de Caixa.');

                  // Se Lançou uma HistProvisao, exclui a HistCota
                  with qryAuxiliar, OperComum do
                  begin
                     Close;
                     SQL.Clear;
                     SQL.Add('DELETE FROM HISTCOTA ');
                     SQL.Add('WHERE ');
                     SQL.Add('  DATAHISTCOTA >= TO_DATE(''' + IIF(qryCancelamentoDATAOPERACAO.AsDateTime < (pRPI.DATAULTFECH-30), DateToStr(pRPI.DATAULTFECH-30), DateToStr(qryCancelamentoDATAOPERACAO.AsDateTime)) + ''',''DD/MM/YYYY'') ');
                     ExecSQL;
                     Close;
                  end;
               end;
            end
            else
            begin
               // Se for carteira Própria
               // Se houveram alterações nas provisões e a boleta foi limpa
               if (bAltCanc) and (qryBoleta.Lookup('IDBOLETA', qryCancelamentoNUMDOCUMENTO.AsString, 'EXCLUIBOLETA') = 'S') then
               begin
                  fraMens.Mes := 'Contabilizando R$ ' + FormatFloat('###,###,###,##0.00', qryCancelamentoVLROPERACAO.AsFloat) + #13 +
                                 'Carteira: ' + qryCancelamentoDESCCARTINVEST.AsString;
                  // Parametro para Contabilidade e CAP/CAR
                  bCriaLancto    := True;
                  wTipoRecDesBol := '';
                  wMensErro      := '';

                  QryBuscaFundo.Close;
                  QryBuscaFundo.ParamByName('IDPEDIDOFUNDO').AsInteger := qryIDPEDIDOFUNDO.AsInteger;
                  QryBuscaFundo.Open;

                  // Contabiliza a Provisão
                  if qryBoleta.Locate('IDBOLETA', qryCancelamentoNUMDOCUMENTO.AsString, []) then
                  begin
                     wPlano     := OperComum.IIF(qryBoletaPLANO.AsInteger = 0, -1, qryBoletaPLANO.AsInteger);
                     wPlanilha  := OperComum.IIF(qryBoletaPLNCODIGO.AsInteger = 0, -1, qryBoletaPLNCODIGO.AsInteger);
                     wDocumCont := OperComum.IIF(qryBoletaCODDOCUMENTO.AsInteger = 0, -1, qryBoletaCODDOCUMENTO.AsInteger);

                     //AL_34 - Contabiliza por Plano / Patrocinadora
                     if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                                qryCancelamentoIDINVESTIMENTO.AsInteger,
                                                qryCancelamentoIDTIPOOPERACAO.AsInteger,
                                                qryCancelamentoIDOPERACAOINVEST.AsInteger,
                                                qryCancelamentoIDFORCLI.AsInteger,
                                                qryCancelamentoIDCARTEIRAINVEST.AsInteger,
                                                QryInvestimentoAcaoIDMOEDACONTAB.AsInteger,
                                                qryCancelamentoDESCTIPOOPERACAO.AsString + ' - ' +
                                                     QryBuscaFundoDESCFUNDOINVEST.AsString+' '+
                                                          qryCancelamentoDESCINVESTIMENTO.AsString,
                                                qryCancelamentoIDLOTE.AsString,
                                                '', qryCancelamentoNUMDOCUMENTO.AsString,
                                                qryTipoOperCan.Lookup('IDTIPOOPERACAO', qryCancelamentoIDTIPOOPERACAO.AsInteger, 'RECPAG'),
                                                wTipoRecDesBol, bCriaLancto,
                                                qryCancelamentoVLROPERACAO.AsFloat,
                                                qryCancelamentoVLRLIQUIDO.AsFloat,
                                                //Ricardo Cristiano - 28/07/2011 - N. Sol  -  N. Kintana
                                                //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
                                                {OperComum.RetornaDtContabDivBonif(qryCancelamentoDATAOPERACAO.AsDateTime,
                                                                                  qryCancelamentoDATAOPERACAO.AsDateTime,
                                                                                  qryDATAAGE.AsDateTime),}
                                                qryCancelamentoDATAOPERACAO.AsDateTime,
                                                qryCancelamentoDATAVENCOPER.AsDateTime,
                                                wPlano, wPlanilha, wDocumCont, wMensErro,
                                                'N'{sCapCar}, False, True, 0, True,
                                                qryCancelamentoIDPLANPREVCTBPATR.AsInteger) <> 0 then
                        Raise Exception.Create('Não foi possível contabilizar o Anúncio');

                     // Atualiza a Boleta com Planilha
                     if wPlanilha > 0 then
                     begin
                        qryBoleta.Edit;
                        qryBoletaPLANO.AsInteger := wPlano;
                        qryBoletaPLNCODIGO.AsInteger := wPlanilha;
                        qryBoleta.Post;
                     end;
                  end
                  else
                    Raise Exception.Create('Não foi possível localizar a Boleta do Cancelamento dos Anúncios');
               end;
            end;
            fraMens.Incrementa;
            qryCancelamento.Next;
         end;

         fraMens.Pos := 0;
         fraMens.Max := qryBoleta.RecordCount;
         qryBoleta.First;
         while not qryBoleta.Eof do
         begin
            fraMens.Mes := 'Conferindo Boletas' + #13 +
                           'Boleta ' + qryBoletaIDBOLETA.AsString;
            Application.ProcessMessages;
            //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
            if (not qryProvisao.Locate('NUMDOCUMENTO', qryBoletaIDBOLETA.AsString, [])) and
               (not qryRecebimento.Locate('NUMDOCUMENTO', qryBoletaIDBOLETA.AsString, [])) and
               (not qryCancelamento.Locate('NUMDOCUMENTO', qryBoletaIDBOLETA.AsString, [])) and
               (not QryCancelamentoVenda.Locate('NUMDOCUMENTO', qryBoletaIDBOLETA.AsString, [])) then
               qryBoleta.Delete
            else
               qryBoleta.Next;
            fraMens.Incrementa;
         end;

         //AL_34
         fraMens.Mostra;
         fraMens.Mes := 'Concluindo a operação';

         qryBoleta.ApplyUpdates;
         qryBoleta.CommitUpdates;

         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit
         else
            //AL_36
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
            //AL_36
            MsgDlg('Ocorreu um problema na movimentação desta AGE' + #13 +
                   'Mensagem: ' + E.Message, 'Mensagem do Sistema ', mtWarning, [mbOK],0);
         end;
      end;
   finally
      // AL_12 - Ini
      fraMens.Mostra;
      fraMens.Mes := 'Finalizando a operação';
      // AL_4
      QryBuscaFundo.Close;
      Sel(qryIDOPERACAODIREITO.AsInteger);
      VerDiferenca(False);
      qryProvisao.EnableControls;
      qryRecebimento.EnableControls;
      qryCancelamento.EnableControls;
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled := True;
      bbtnSair.Enabled := True;
      bbtnAjuda.Enabled := True;
      CmeDetalhe.AtualizaBotoes(Self);
      CmeCadastro.AtualizaBotoes(Self);
      fraMens.Apaga;
      // AL_12 - Fim
   end;
end;

procedure TfrmCadDividendos.FormResize(Sender: TObject);
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

procedure TfrmCadDividendos.CalculaVlrLiq(Origem: String = 'P');
var
  eValorExercido, eRemuneracao, eIRRemuneracao, eIRExercido : Extended;
  qryOrigem: TwwQuery;
begin
   inherited;
   // AL_13 - Tudo
   try
      if Origem = 'P' then
         qryOrigem := qryProvisao
      else if Origem = 'R' then
         qryOrigem := qryRecebimento
      else if Origem = 'C' then
         qryOrigem := qryCancelamento;

      if not (qryOrigem.State in [dsInsert, dsEdit]) then
         Exit;

      eRemuneracao   := qryOrigem.FieldByName('VLRREMUNERACAO').AsFloat;
      eValorExercido := qryOrigem.FieldByName('VLROPERACAO').AsFloat;
      // AL_4
      //Recalculo o IR em caso de valores alterados
      fVlrRendimento := 0;
      eIRExercido := Impostos.CalculaIr(2,
                         qryOrigem.FieldByName('IDINVESTIMENTO').AsInteger,
                         0{CARTEIRAGERENC},
                         qryOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger,
                         qryOrigem.FieldByName('IDTIPOOPERACAO').AsInteger,
                         qryTipoOperacaoIDMERCADO.AsInteger,
                         qryOrigem.FieldByName('IDLOTE').AsString,
                         Date, Date,
                         0,
                         eValorExercido, 0, OperComum.IIF(qryISENCAOIR.AsString = 'N','S','N'),
                         qryTipoOperacaoFLGTRATAIR.AsString,
                         fVlrRendimento);

      // Calculo do IR sobre Remuneração (Sempre)
      fVlrRendimento := 0;
      eIRRemuneracao :=  Impostos.CalculaIr(2,
                             qryOrigem.FieldByName('IDINVESTIMENTO').AsInteger,
                             0{CARTEIRAGERENC},
                             qryOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger,
                             0,
                             0,
                             qryOrigem.FieldByName('IDLOTE').AsString,
                             Date, Date,
                             0,
                             eRemuneracao, 0, 'S' {qryISENCAOIR.AsString},
                             qryTipoOperacaoFLGTRATAIR.AsString,
                             fVlrRendimento);
      if qryOrigem.FieldByName('VLRIR').AsFloat = 0 then
         qryOrigem.FieldByName('VLRIR').AsFloat := eIRExercido + eIRRemuneracao;

      if qryIRLITIGIO.AsString  = 'S' then
         qryOrigem.FieldByName('VLRLIQUIDO').AsFloat := (eRemuneracao + eValorExercido)
      else
         qryOrigem.FieldByName('VLRLIQUIDO').AsFloat := (eRemuneracao + eValorExercido) - qryOrigem.FieldByName('VLRIR').AsFloat;
      qryOrigem.FieldByName('VLRIRREMUNER').AsFloat := eIRRemuneracao;
   finally
      qryOrigem := Nil;
   end;
end;

procedure TfrmCadDividendos.sbtnApagarClick(Sender: TObject);
var iOldOper: Integer;
    sBol: String;
begin
   // AL_24
   if RendaVariavel.VerEmAbertura then
   begin
      CmeCadastro.AtualizaBotoes(Self);
      Exit;
   end;

   // AL_12
   // AL_1 - 13/04/2005
   if MsgDlg('Exclui a AGE, o Investimento e as Operações de Anuncio, Recebimento e Cancelamento?','Mensagem do Sistema',mtConfirmation,[mbYes, mbNo],0) = mrYes then
   begin
      try
         // AL_12
         //Exclui Cancelamentos
         qryCancelamento.First;
         while not qryCancelamento.Eof do
         begin
            //AL_32
            if not CtrlInvContab.TestaPeriodo(qryCancelamentoDATAOPERACAO.AsString, 2) then
               Raise Exception.Create(CtrlInvContab.MessageInfo);

            sBol := qryCancelamentoNUMDOCUMENTO.AsString;
            if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
               Raise Exception.Create('Erro ao excluir o Cancelamento da Boleta ' + sBol);
            while ((not qryCancelamento.Eof) and (sBol = qryCancelamentoNUMDOCUMENTO.AsString)) do
               qryCancelamento.Next;
         end;

         //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
         QryCancelamentoVenda.First;
         while not QryCancelamentoVenda.Eof do
         begin
            //AL_32
            if not CtrlInvContab.TestaPeriodo(QryCancelamentoVenda.FieldByName('DATAOPERACAO').AsString, 2) then
               Raise Exception.Create(CtrlInvContab.MessageInfo);

            sBol := QryCancelamentoVenda.FieldByName('NUMDOCUMENTO').AsString;
            if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
               Raise Exception.Create('Erro ao excluir o Cancelamento por Venda da Boleta ' + sBol);
            while ((not QryCancelamentoVenda.Eof) and (sBol = QryCancelamentoVenda.FieldByName('NUMDOCUMENTO').AsString)) do
               QryCancelamentoVenda.Next;
         end;

         //Exclui Recebimentos Anteriores
         qryRecebimento.First;
         while not qryRecebimento.Eof do
         begin
            //AL_32
            if not CtrlInvContab.TestaPeriodo(qryRecebimentoDATAOPERACAO.AsString, 2) then
               Raise Exception.Create(CtrlInvContab.MessageInfo);

            sBol := qryRecebimentoNUMDOCUMENTO.AsString;
            if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
               Raise Exception.Create('Erro ao excluir os Recebimentos da Boleta ' + sBol);
            while ((not qryRecebimento.Eof) and (sBol = qryRecebimentoNUMDOCUMENTO.AsString)) do
               qryRecebimento.Next;
         end;

         // Exclui as Provisões Anteriores
         qryProvisao.First;
         while not qryProvisao.Eof do
         begin
            //AL_32
            if not CtrlInvContab.TestaPeriodo(qryProvisaoDATAOPERACAO.AsString, 2) then
               Raise Exception.Create(CtrlInvContab.MessageInfo);

            sBol := qryProvisaoNUMDOCUMENTO.AsString;
            if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
               Raise Exception.Create('Erro ao Excluir os Anúncios da boleta ' + sBol);
            while ((not qryProvisao.Eof) and (sBol = qryProvisaoNUMDOCUMENTO.AsString)) do
               qryProvisao.Next;
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
         iOldOper := qryIDOPERACAODIREITO.AsInteger;
         qry.Delete;
         qry.ApplyUpdates;

         Sel(iOldOper);
         CmeCadastro.AtualizaBotoes(Self);

      except
         on E:Exception do
         begin
            //AL_36
            MsgDlg('Não foi possível excluir esta AGE. '+ #13 +
                   E.Message, 'Mensagem do Sistema', MtWarning,[MbOk],0);
            bbtnCancelar.Click;
         end;
      end
   end;
   // AL_1 - Fim
end;

procedure TfrmCadDividendos.CmeDetalheConfirma(Sender: TObject);
var wIdForCli, iOperacao: Integer;
    sNewBol: String;
begin
   try
      sNewBol := '';
      if pgctrlDetalhe.ActivePage = tbsDet then
      begin
         if qryDetalhe.State in [dsInsert, dsEdit] then
         begin
            qryDetalheDESCINVESTIMENTO.AsString := QryInvestimentoAcaoDESCINVESTIMENTO.AsString;
            qryDetalheORIGDEST.AsString := 'O';
            qryDetalheIDOPERACAODIREITO.AsInteger := qryIDOPERACAODIREITO.AsInteger;
            if qryDetalhe.State = dsInsert then
               qryDetalheIDOPERDIREITOXINV.AsInteger := LeUltRegistro(nil,'OPERDIREITOXINV');
         end;
      end
      else if pgctrlDetalhe.ActivePage = tbsProvisao then
      begin
         if qryProvisao.State = dsInsert then
         begin
            iOperacao := LeUltRegistro(nil,'OPERACAOINVEST');
            qryProvisaoIDOPERACAOINVEST.AsInteger    := iOperacao;
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
            //AL_36
            qryProvisaoIDPLANPREVCTBPATR.AsInteger   := qryPlanPrevProvIDPLANPREVCTBPATR.AsInteger;
            qryProvisaoPLANPRVCONTABPATRO.AsString   := qryPlanPrevProvPLANPRVCONTABPATRO.AsString;

            qryProvisaoDATAOPERACAO.AsDateTime       := qryDATAOPER.AsDateTime;
            // AL_4
            qryProvisaoDATAVENCOPER.AsDateTime       := qryDATACOM.AsDateTime;
            qryProvisaoDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
            if qryProvisaoNUMDOCUMENTO.IsNull then
               //AL_34
               qryProvisaoNUMDOCUMENTO.AsString := BuscaBoleta(qryDATAOPER.AsDateTime,
                                                               qryProvisaoIDPLANPREVCTBPATR.AsInteger,
                                                               qryProvisaoIDCARTEIRAINVEST.AsInteger,
                                                               qryProvisaoIDCARTEIRAGERENC.AsInteger,
                                                               qryProvisaoIDCUSTODIANTE.AsInteger,
                                                               qryProvisaoIDMOTIVOBLOQUEIO.AsInteger,
                                                               qryProvisaoIDTIPOOPERACAO.AsInteger);
            qryProvisaoFLGSTATUSFECHBOL.AsString     := 'F';
            qryProvisaoFLGSTATUSORDMOV.AsString      := 'L';
            //AL_41
            qryProvisaoPRECOUNITOPERACAO.AsFloat     := RoundCM((qryProvisaoVLROPERACAO.AsFloat / qryProvisaoQTDEOPERACAO.AsFloat) * qryInvestimentoAcaoQTDTITLOTE.AsInteger, 15);
            qryProvisaoPERCENTUAL.AsFloat            := 0;
            qryProvisaoORIGDEST.AsString             := 'O';
            // AL_13 - Inicio
            if qryProvisaoIDCARTEIRAGERENC.IsNull then
            begin
               if qryProvisaoIDMOTIVOBLOQUEIO.IsNull then
                  qryProvisaoIDMOTIVOBLOQUEIO.AsInteger := -1;
               qryProvisaoSIGLAMOTBLOQ.AsString      := qryMotBloqProvSIGLAMOTBLOQ.AsString;
            end
            else
            begin
               qryProvisaoIDMOTIVOBLOQUEIO.Clear;
               qryProvisaoSIGLAMOTBLOQ.Clear;
            end;
            qryProvisaoIDOPERCUSTODIA.Clear;
            qryProvisaoALTERADO.AsString := 'S';
            qryProvisaoCARTGERENCIAL.AsString := OperComum.IIF(qryProvisaoIDCARTEIRAGERENC.IsNull, 'N', 'S');
            // AL_13 - Fim
         end
         else if qryProvisao.State = dsEdit then
         begin
            if qryBoleta.Locate('IDBOLETA', qryProvisaoNUMDOCUMENTO.AsString, []) then
            begin
               qryBoleta.Edit;
               qryBoletaEXCLUIBOLETA.AsString := 'S';
               qryBoleta.Post;

               // AL_13 - Inicio
               // Controle de Ajuste automático das carteiras gerencias
               if qryProvisaoIDCARTEIRAGERENC.IsNull then
               begin
                  //AL_34
                  iPlanoRat := qryProvisaoIDPLANPREVCTBPATR.AsInteger;
                  iCartRat := qryProvisaoIDCARTEIRAINVEST.AsInteger;
                  sBoleRat := qryProvisaoNUMDOCUMENTO.AsString;
                  iOperRat := qryProvisaoIDOPERACAOINVEST.AsInteger;
                  // AL_16
                  iMotBRat := qryProvisaoIDMOTIVOBLOQUEIO.AsInteger;
                  dDataRat := qryProvisaoDATAOPERACAO.AsDateTime;
                  dVencRat := qryProvisaoDATAVENCOPER.AsDateTime;
                  fVRemRat := qryProvisaoVLRREMUNERACAO.AsFloat;
                  fVOpeRat := qryProvisaoVLROPERACAO.AsFloat;
                  fPUOpRat := qryProvisaoPRECOUNITOPERACAO.AsFloat;
                  if cdsSelBoleta.Locate('IDOPERACAOINVEST', qryProvisaoIDOPERACAOINVEST.AsInteger, []) then
                     fPercRat := qryProvisaoVLROPERACAO.AsFloat / cdsSelBoleta.FieldByName('VLROPERACAO').AsFloat
                  else
                     fPercRat := 1;
               end
               else
               begin
                  //AL_34
                  iPlanoRat := 0;
                  iCartRat := 0;
                  sBoleRat := '';
                  iOperRat := 0;
                  // AL_16
                  iMotBRat := 0;
                  dDataRat := 0;
                  dVencRat := 0;
                  fPercRat := 0;
                  fVRemRat := 0;
                  fVOpeRat := 0;
               end;
               // AL_13 - Fim
             end;
         end;
      end
      else if pgctrlDetalhe.ActivePage = tbsRecebimento then
      begin
         if qryRecebimento.State = dsInsert then
         begin
            iOperacao := LeUltRegistro(nil,'OPERACAOINVEST');
            qryRecebimentoIDOPERACAOINVEST.AsInteger    := iOperacao;
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
            qryRecebimentoIDFORCLI.AsInteger            := wIdForCli;
            qryRecebimentoIDOPERACAODIREITO.AsInteger   := qryIDOPERACAODIREITO.AsInteger;
            //AL_36
            qryRecebimentoIDPLANPREVCTBPATR.AsInteger   := qryPlanPrevRecIDPLANPREVCTBPATR.AsInteger;
            qryRecebimentoPLANPRVCONTABPATRO.AsString   := qryPlanPrevRecPLANPRVCONTABPATRO.AsString;

            qryRecebimentoDATAVENCOPER.AsDateTime       := CalcVenc(dbdDataOperacaoRec.DateTime, qryTipoOperRecVENCIMENTO.AsInteger);
            qryRecebimentoDATABASE.AsDateTime           := qryDATAEX.AsdateTime;

            if qryRecebimentoNUMDOCUMENTO.IsNull then
               //AL_34
               qryRecebimentoNUMDOCUMENTO.AsString      := BuscaBoleta(dbdDataOperacaoRec.DateTime,
                                                                       qryRecebimentoIDPLANPREVCTBPATR.AsInteger,
                                                                       qryRecebimentoIDCARTEIRAINVEST.AsInteger,
                                                                       qryRecebimentoIDCARTEIRAGERENC.AsInteger,
                                                                       qryRecebimentoIDCUSTODIANTE.AsInteger,
                                                                       qryRecebimentoIDMOTIVOBLOQUEIO.AsInteger,
                                                                       qryRecebimentoIDTIPOOPERACAO.AsInteger);
            qryRecebimentoFLGSTATUSFECHBOL.AsString     := 'F';
            qryRecebimentoFLGSTATUSORDMOV.AsString      := 'L';
            //AL_41
            qryRecebimentoPRECOUNITOPERACAO.AsFloat     := RoundCM(OperComum.DivValorZero(qryRecebimentoVLROPERACAO.AsFloat, qryRecebimentoQTDEOPERACAO.AsFloat) * QryInvestimentoAcaoQTDTITLOTE.AsInteger,15);
            qryRecebimentoPERCENTUAL.AsFloat            := 0;
            qryRecebimentoORIGDEST.AsString             := 'O';
            // AL_13 - Inicio
            if qryRecebimentoIDCARTEIRAGERENC.IsNull then
            begin
               if qryRecebimentoIDMOTIVOBLOQUEIO.IsNull then
                  qryRecebimentoIDMOTIVOBLOQUEIO.AsInteger := -1;
               qryRecebimentoSIGLAMOTBLOQ.AsString      := qryMotBloqRecSIGLAMOTBLOQ.AsString;
            end
            else
            begin
               qryRecebimentoIDMOTIVOBLOQUEIO.Clear;
               qryRecebimentoSIGLAMOTBLOQ.Clear;
            end;
            qryRecebimentoIDOPERCUSTODIA.Clear;
            qryRecebimentoALTERADO.AsString := 'S';
            qryRecebimentoCARTGERENCIAL.AsString := OperComum.IIF(qryRecebimentoIDCARTEIRAGERENC.IsNull, 'N', 'S');
            // AL_13 - Fim
         end
         else if qryRecebimento.State = dsEdit then
         begin
            if qryBoleta.Locate('IDBOLETA', qryRecebimentoNUMDOCUMENTO.AsString, []) then
            begin
               qryBoleta.Edit;
               qryBoletaEXCLUIBOLETA.AsString := 'S';
               qryBoleta.Post;
            end;

            // AL_13 - Inicio
            // Controle de Ajuste automático das carteiras gerencias
            if qryRecebimentoIDCARTEIRAGERENC.IsNull then
            begin
               //AL_34
               iPlanoRat := qryRecebimentoIDPLANPREVCTBPATR.AsInteger;
               iCartRat := qryRecebimentoIDCARTEIRAINVEST.AsInteger;
               sBoleRat := qryRecebimentoNUMDOCUMENTO.AsString;
               iOperRat := qryRecebimentoIDOPERACAOINVEST.AsInteger;
               // AL_16
               iMotBRat := qryRecebimentoIDMOTIVOBLOQUEIO.AsInteger;
               dDataRat := qryRecebimentoDATAOPERACAO.AsDateTime;
               dVencRat := qryRecebimentoDATAVENCOPER.AsDateTime;
               fVRemRat := qryRecebimentoVLRREMUNERACAO.AsFloat;
               fVOpeRat := qryRecebimentoVLROPERACAO.AsFloat;
               fPUOpRat := qryRecebimentoPRECOUNITOPERACAO.AsFloat;
               if cdsSelBoleta.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
                  fPercRat := qryRecebimentoVLROPERACAO.AsFloat / cdsSelBoleta.FieldByName('VLROPERACAO').AsFloat
               else
                  fPercRat := 1;
            end
            else
            begin
               //AL_34
               iPlanoRat := 0;
               iCartRat := 0;
               sBoleRat := '';
               iOperRat := 0;
               // AL_16
               iMotBRat := 0;
               dDataRat := 0;
               dVencRat := 0;
               fPercRat := 0;
               fVRemRat := 0;
               fVOpeRat := 0;
            end;
            // AL_13 - Fim
         end;
      end
      else if pgctrlDetalhe.ActivePage = tbsCancelamento then
      begin
         if qryCancelamento.State = dsInsert then
         begin
            iOperacao := LeUltRegistro(nil,'OPERACAOINVEST');
            qryCancelamentoIDOPERACAOINVEST.AsInteger    := iOperacao;
            qryCancelamentoMOECODIGO.AsInteger           := pRPI.MOECODIGO;
            qryCancelamentoIDMODULO.AsInteger            := Sistema.IdModulo;
            qryCancelamentoEMPRESAPROP.AsInteger         := Sistema.IdEmpresa;
            qryCancelamentoIDINVESTIMENTO.AsInteger      := QryInvestimentoAcaoIDINVESTIMENTO.AsInteger;
            qryCancelamentoDESCINVESTIMENTO.AsString     := QryInvestimentoAcaoDESCINVESTIMENTO.AsString;
            qryCancelamentoDESCCARTINVEST.AsString       := qryCarteiraCanDESCCARTINVEST.AsString;
            qryCancelamentoIDCARTEIRA.AsString           := qryCarteiraCanIDCARTEIRA.AsString;
            qryCancelamentoIDCARTEIRAINVEST.AsInteger    := qryCarteiraCanIDCARTEIRAINVEST.AsInteger;
            if not qryCarteiraProvIDCARTEIRAGERENC.IsNull then
               qryCancelamentoIDCARTEIRAGERENC.AsInteger := qryCarteiraCanIDCARTEIRAGERENC.AsInteger
            else
               qryCancelamentoIDCARTEIRAGERENC.Clear;
            qryCancelamentoIDTIPOINVEST.AsInteger        := 2;
            qryCancelamentoDESCTIPOOPERACAO.AsString     := qryTipoOperCanDESCTIPOOPERACAO.AsString;
            qryCancelamentoNATUREZAOPERACAO.AsString     := qryTipoOperCanNATUREZAOPERACAO.AsString;
            qryCancelamentoIDLOTE.Clear;
            if not qryCancelamentoIDCUSTODIANTE.IsNull then
               qryCancelamentoSGLCUSTODIANTE.AsString    := QryCustodianteCanSGLCUSTODIANTE.AsString
            else
               qryCancelamentoSGLCUSTODIANTE.Clear;
            FornecedorCli(qryCancelamentoIDCUSTODIANTE.AsInteger,
                          qryCancelamentoIDINVESTIMENTO.AsInteger, wIdForCli);
            qryCancelamentoIDFORCLI.AsInteger            := wIdForCli;
            qryCancelamentoIDOPERACAODIREITO.AsInteger   := qryIDOPERACAODIREITO.AsInteger;
            //AL_36
            qryCancelamentoIDPLANPREVCTBPATR.AsInteger   := qryPlanPrevCanIDPLANPREVCTBPATR.AsInteger;
            qryCancelamentoPLANPRVCONTABPATRO.AsString   := qryPlanPrevCanPLANPRVCONTABPATRO.AsString;

            qryCancelamentoDATAVENCOPER.AsDateTime       := qryDATACOM.AsDateTime;
            qryCancelamentoDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
            if qryCancelamentoNUMDOCUMENTO.IsNull then
               // Procura uma boleta pelo IDFORCLI e Tipo de Bolata DTC (Cancelamento)
               //AL_34
               qryCancelamentoNUMDOCUMENTO.AsString      := BuscaBoleta(qryDATAOPER.AsDateTime,
                                                                        qryCancelamentoIDPLANPREVCTBPATR.AsInteger,
                                                                        qryCancelamentoIDCARTEIRAINVEST.AsInteger,
                                                                        qryCancelamentoIDCARTEIRAGERENC.AsInteger,
                                                                        qryCancelamentoIDCUSTODIANTE.AsInteger,
                                                                        qryCancelamentoIDMOTIVOBLOQUEIO.AsInteger,
                                                                        qryCancelamentoIDTIPOOPERACAO.AsInteger);
            qryCancelamentoFLGSTATUSFECHBOL.AsString     := 'F';
            qryCancelamentoFLGSTATUSORDMOV.AsString      := 'L';
            //AL_41
            qryCancelamentoPRECOUNITOPERACAO.AsFloat     := RoundCM((qryCancelamentoVLROPERACAO.AsFloat / qryCancelamentoQTDEOPERACAO.AsFloat) * qryInvestimentoAcaoQTDTITLOTE.AsInteger, 15);
            qryCancelamentoPERCENTUAL.AsFloat            := 0;
            qryCancelamentoORIGDEST.AsString             := 'O';
            // AL_13 - Inicio
            if qryCancelamentoIDCARTEIRAGERENC.IsNull then
            begin
               if qryCancelamentoIDMOTIVOBLOQUEIO.IsNull then
                  qryCancelamentoIDMOTIVOBLOQUEIO.AsInteger := -1;
               qryCancelamentoSIGLAMOTBLOQ.AsString      := qryMotBloqCanSIGLAMOTBLOQ.AsString;
            end
            else
            begin
               qryCancelamentoIDMOTIVOBLOQUEIO.Clear;
               qryCancelamentoSIGLAMOTBLOQ.Clear;
            end;
            qryCancelamentoIDOPERCUSTODIA.Clear;
            qryCancelamentoALTERADO.AsString := 'S';
            qryCancelamentoCARTGERENCIAL.AsString := OperComum.IIF(qryCancelamentoIDCARTEIRAGERENC.IsNull, 'N', 'S');
            // AL_13 - Fim
         end
         else if qryCancelamento.State = dsEdit then
         begin
            if qryBoleta.Locate('IDBOLETA', qryCancelamentoNUMDOCUMENTO.AsString, []) then
            begin
               qryBoleta.Edit;
               qryBoletaEXCLUIBOLETA.AsString := 'S';
               qryBoleta.Post;

               // AL_13 - Inicio
               // Controle de Ajuste automático das carteiras gerencias
               if qryCancelamentoIDCARTEIRAGERENC.IsNull then
               begin
                  //AL_34
                  iPlanoRat := qryCancelamentoIDPLANPREVCTBPATR.AsInteger;
                  iCartRat := qryCancelamentoIDCARTEIRAINVEST.AsInteger;
                  sBoleRat := qryCancelamentoNUMDOCUMENTO.AsString;
                  iOperRat := qryCancelamentoIDOPERACAOINVEST.AsInteger;
                  // AL_16
                  iMotBRat := qryCancelamentoIDMOTIVOBLOQUEIO.AsInteger;
                  dDataRat := qryCancelamentoDATAOPERACAO.AsDateTime;
                  dVencRat := qryCancelamentoDATAVENCOPER.AsDateTime;
                  fVRemRat := qryCancelamentoVLRREMUNERACAO.AsFloat;
                  fVOpeRat := qryCancelamentoVLROPERACAO.AsFloat;
                  fPUOpRat := qryCancelamentoPRECOUNITOPERACAO.AsFloat;
                  if cdsSelBoleta.Locate('IDOPERACAOINVEST', qryCancelamentoIDOPERACAOINVEST.AsInteger, []) then
                     fPercRat := qryCancelamentoVLROPERACAO.AsFloat / cdsSelBoleta.FieldByName('VLROPERACAO').AsFloat
                  else
                     fPercRat := 1;
               end
               else
               begin
                  //AL_34
                  iPlanoRat := 0;
                  iCartRat := 0;
                  sBoleRat := '';
                  iOperRat := 0;
                  // AL_16
                  iMotBRat := 0;
                  dDataRat := 0;
                  dVencRat := 0;
                  fPercRat := 0;
                  fVRemRat := 0;
                  fVOpeRat := 0;
               end;
               // AL_13 - Fim
            end;
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

procedure TfrmCadDividendos.dbrQtdProvExit(Sender: TObject);
begin
   inherited;

// Esta rotina deverá ser retirada assim que a versão for aprovada, a QTD não é mais informada

   if (Pos('Prov',TDBRealEdit(Sender).Name) > 0) then
   begin
      dbrVlrProv.Value := OperComum.Round(
                        OperComum.DivValorZero((dbrQtdProv.Value * qryDIVPORACAO.AsFloat),
                                  QryInvestimentoAcaoQTDTITLOTE.AsInteger),2);
      CalculaVlrLiq('P')
   end
   else if (Pos('Rec',TDBRealEdit(Sender).Name) > 0) then
   begin
      dbrVlrRec.Value  := OperComum.Round(
                        OperComum.DivValorZero((dbrQtdRec.Value * qryDIVPORACAO.AsFloat),
                                  QryInvestimentoAcaoQTDTITLOTE.AsInteger),2);
      CalculaVlrLiq('R');
   end
   else if (Pos('Can',TDBRealEdit(Sender).Name) > 0) then
   begin
      dbrVlrCan.Value  := OperComum.Round(
                          OperComum.DivValorZero((dbrQtdCan.Value * qryDIVPORACAO.AsFloat),
                                    QryInvestimentoAcaoQTDTITLOTE.AsInteger),2);
      CalculaVlrLiq('C');
   end;
end;

procedure TfrmCadDividendos.tbcDetalheChange(Sender: TObject);
begin
   inherited;
   bbtnGeraRecebimento.Visible := (pgctrlDetalhe.ActivePage <> tbsDet);
   // AL_12 - Inicio
   if pgctrlDetalhe.ActivePage = tbsProvisao then
   begin
      bbtnGeraRecebimento.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty));
      bbtnGeraRecebimento.Hint := 'Gera Anúncios';
   end
   else if pgctrlDetalhe.ActivePage = tbsRecebimento then
   begin
      bbtnGeraRecebimento.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty) and
                                      (not qryProvisao.IsEmpty));
      bbtnGeraRecebimento.Hint := 'Gera Recebimentos';
   end
   else if pgctrlDetalhe.ActivePage = tbsCancelamento then
   begin
      bbtnGeraRecebimento.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty) and
                                      (not qryProvisao.IsEmpty));
      bbtnGeraRecebimento.Hint := 'Gera Cancelamentos';
   end
   //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
   else if pgctrlDetalhe.ActivePage = tbsCancelamentoVenda then
   begin
      bbtnGeraRecebimento.Enabled := False;
      bbtnGeraRecebimento.Hint := '';
      sbtnExcluiDet.Enabled := False;
      sbtnAltDet.Enabled := False;
      sbtnInsDet.Enabled := False;
   end;
   // AL_12 - Fim

   if pgctrlDetalhe.ActivePage = tbsProvisao then
      qryProvisao.AfterScroll(qryProvisao)
   else
      VerDiferenca(False);
end;

function TfrmCadDividendos.ProvisionaOper: Boolean;
var fVlrRendimento, wQtdOper, wVlrOperacao,
    // AL_8 - Retirada de variáveis
    wPuProporcinal, wSdoQtdCPMF: Double;
    wSaldoNormal, wSaldoCCI: Double;
    //AL_34
    wIdNovaOperacao, wIdForCli, wIdForCliAnt, I, wIdPlanPrevAnt: Integer;
    // AL_4
    wNumDocNormal, wNumDocCCI, wNumDoc, sBol: String;
begin
   try
      try
         Result := False;
         qryProvisao.DisableControls;
         qryRecebimento.DisableControls;

         //AL_13
         if (not qryProvisao.IsEmpty) or (not qryRecebimento.IsEmpty) or (not qryCancelamento.IsEmpty)then
         begin
            if OperComum.InvMsgBox('Para Regerar os Anuncios é Necessário Excluir os Anúncios, os Recebimento e os Cancelamentos Atuais',
                         mtConfirmation, 'Mensagem do Sistema',
                         [mbYes, mbCancel], 'Continua;Cancela') = mrCancel then
            begin
               Result := True;
               Exit;
            end;
         end;

         //Exclui os Cancelamentos Anteriores
         qryCancelamento.First;
         while not qryCancelamento.Eof do
         begin
            sBol := qryCancelamentoNUMDOCUMENTO.AsString;
            if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
               Raise Exception.Create('Erro ao excluir os Cancelamentos da Boleta ' + sBol);
            while ((not qryCancelamento.Eof) and (sBol = qryCancelamentoNUMDOCUMENTO.AsString)) do
               qryCancelamento.Next;
         end;

         //Exclui Recebimentos Anteriores
         qryRecebimento.First;
         while not qryRecebimento.Eof do
         begin
            sBol := qryRecebimentoNUMDOCUMENTO.AsString;
            if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
               Raise Exception.Create('Erro ao excluir os Recebimentos da Boleta ' + sBol);
            while ((not qryRecebimento.Eof) and (sBol = qryRecebimentoNUMDOCUMENTO.AsString)) do
               qryRecebimento.Next;

         end;

         // Exclui as Provisões Anteriores
         qryProvisao.First;
         while not qryProvisao.Eof do
         begin
            sBol := qryProvisaoNUMDOCUMENTO.AsString;
            if not RendaVariavel.ExcluiBoleta(sBol, True, False, fraMens) then
               Raise Exception.Create('Erro ao Excluir os Anúncios da boleta ' + sBol);
            while ((not qryProvisao.Eof) and (sBol = qryProvisaoNUMDOCUMENTO.AsString)) do
            begin
               qryProvisao.Next;
            end;
         end;

         Sel(qryIDOPERACAODIREITO.AsInteger, False, False);
         tbcDetalhe.TabIndex := 1;
         pgctrlDetalhe.ActivePage := tbsProvisao;

         fraMens.Mostra;
         fraMens.Mes := 'Buscando Saldos...';

         // Capta os Saldos do Investimentos na data
         OperComum.LimpaParametros(QryOrigemDivJur);
         QryOrigemDivJur.ParamByName('IDINVESTIMENTO').AsInteger := qryDetalheIDINVESTIMENTO.AsInteger;
         // AL_2
         // AL_4
         QryOrigemDivJur.ParamByName('DATAEX').AsString := FormatDateTime('dd/mm/yyyy', qryDATAEX.AsDateTime);
         QryOrigemDivJur.ParamByName('FORCLI').AsString := qryTipoOperacaoTIPCREDOR.AsString;
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

            //Gera Ir Litigio
            if qryIRLITIGIO.AsString = 'S' then
               QryOrigemDivJurVLRLIQ.AsFloat := QryOrigemDivJurVALOREXERCIDO.AsFloat
            else
               QryOrigemDivJurVLRLIQ.AsFloat := QryOrigemDivJurVALOREXERCIDO.AsFloat - QryOrigemDivJurIR.AsFloat;

            wSaldoIRApu := 0;
            wSaldoQtd   := 0;
            wSaldoAqui  := 0;
            wSaldoVlr   := 0;
            wSdoQtdCPMF := 0;
            // AL_13 - Inicio
            // AL_4 
            //AL_25
            //AL_30
            //AL_31
            //AL_34 - ini
            CtrlRV.BuscaSaldoRV.Executa(qryDATAEX.AsDateTime,
                                        QryOrigemDivJur.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                        QryOrigemDivJur.FieldByName('IDINVESTIMENTO').AsInteger,
                                        QryOrigemDivJur.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                        QryOrigemDivJur.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                        High(Integer),
                                        QryOrigemDivJur.FieldByName('IDCUSTODIANTE').AsInteger,
                                        QryOrigemDivJur.FieldByName('IDLOTE').AsString);


            wSaldoQtd := CtrlRV.BuscaSaldoRV.SaldoQtdTotal;
            wSaldoVlr := CtrlRV.BuscaSaldoRV.SaldoVlrTotal;
            wSaldoAqui := CtrlRV.BuscaSaldoRV.SaldoCusto;
            wSaldoIRApu := CtrlRV.BuscaSaldoRV.SaldoIRApurado;
            wSaldoNormal := CtrlRV.BuscaSaldoRV.SaldoQtdCC;
            wSaldoCCI := CtrlRV.BuscaSaldoRV.SaldoQtdCCI;
            //AL_34 - Fim

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

            //AL_23
            if wSaldoQtd = 0 then
            begin
               QryOrigemDivJur.Next;
               Continue;
            end;

            // Inicia outros Dados
            FornecedorCli(QryOrigemDivJurIDCUSTODIANTE.AsInteger,
                          QryOrigemDivJurIDINVESTIMENTO.AsInteger, wIdForCli);

            //AL_34 - ini
            // AL_26 - Ini
            if (wSaldoNormal > 0) and
               ((wIdForCli <> wIdForCliAnt) or (wIdPlanPrevAnt <> QryOrigemDivJurIDPLANPREVCTBPATR.AsInteger) or (wNumDocNormal = '')) then
            begin
               // Gera numero de Boleta
               wNumDocNormal := 'RV-' + Copy(qryDATAOPER.AsString,9,2) + '/' +
                                             FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                                                                         Copy(qryDATAOPER.AsString,9,2)));
               qryBoleta.Insert;
               qryBoletaIDBOLETA.AsString     := wNumDocNormal;
               qryBoletaSTATUS.AsString       := 'F';

               //Ricardo Cristiano - 30/06/2011 - N. Sol 160530 -  N. Kintana 1348723
               qryBoletaDATABOLETA.AsDateTime := OperComum.RetornaDtContabDivBonif(qryDATAOPER.AsDateTime,
                                                                                   qryDATAOPER.AsDateTime,
                                                                                   qryDATAAGE.AsDateTime);
               qryBoletaTIPMOVBOLETA.AsString := 'DTA';
               qryBoletaIDFORCLI.AsInteger    := wIdForCli;
               qryBoletaEXCLUIBOLETA.AsString := 'N';
               qryBoleta.Post;
            end;
            if (wSaldoCCI > 0) and
               ((wIdForCli <> wIdForCliAnt) or (wIdPlanPrevAnt <> QryOrigemDivJurIDPLANPREVCTBPATR.AsInteger) or (wNumDocCCI = '')) then
            begin
               // Gera numero de Boleta
               wNumDocCCI := 'RV-' + Copy(qryDATAOPER.AsString,9,2) + '/' +
                                          FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                                                                         Copy(qryDATAOPER.AsString,9,2)));
               qryBoleta.Insert;
               qryBoletaIDBOLETA.AsString     := wNumDocCCI;
               qryBoletaSTATUS.AsString       := 'F';
               //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
               qryBoletaDATABOLETA.AsDateTime := OperComum.RetornaDtContabDivBonif(qryDATAOPER.AsDateTime,
                                                                                   qryDATAOPER.AsDateTime,
                                                                                   qryDATAAGE.AsDateTime);
               qryBoletaTIPMOVBOLETA.AsString := 'DTA';
               qryBoletaIDFORCLI.AsInteger    := wIdForCli;
               qryBoletaEXCLUIBOLETA.AsString := 'N';
               qryBoleta.Post;
            end;
            if wIdForCli <> wIdForCliAnt then
               wIdForCliAnt := wIdForCli;
            if wIdPlanPrevAnt <> QryOrigemDivJurIDPLANPREVCTBPATR.AsInteger then
               wIdPlanPrevAnt := QryOrigemDivJurIDPLANPREVCTBPATR.AsInteger;
            // AL_26 - Fim
            //AL_34 - Fim

            // Para I = 1 - Saldo Normal
            //      I = 2 - Saldo CCI
            for I := 1 to 2 do
            begin
               if I = 1 then
               begin
                  // Saldo Normal
                  qryTipoOperProv.Locate('IDTIPOOPERACAO', -70, []);
                  // AL_1 - 13/04/2005
                  // Pro-Rata Saldos Bloqueados, Liberados e Gerenciais
                  wQtdOper := OperComum.Round(QryOrigemDivJurQTDEDIREITO.AsFloat * (wSaldoNormal/wSaldoQtd),0);
                  wNumDoc     := wNumDocNormal;
               end
               else
               begin
                  // Saldo CCI
                  qryTipoOperProv.Locate('IDTIPOOPERACAO', -10070, []);
                  // AL_1 - 13/04/2005
                  // Pro-Rata Saldos Bloqueados, Liberados e Gerenciais
                  wQtdOper := OperComum.Round(QryOrigemDivJurQTDEDIREITO.AsFloat * (wSaldoCCI/wSaldoQtd),0);
                  wNumDoc     := wNumDocCCI;
               end;

               if wQtdOper > 0 then
               begin
                  if not qryBoleta.Locate('IDBOLETA', wNumDoc, []) then
                     Raise Exception.Create('Não foi possível localizar a boleta ' + wNumDoc);

                  // Gera Novo Id de Operacao
                  wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

                  if qryTipoOperProvIDTIPOOPERACAO.IsNull then
                     Raise Exception.Create('Tipo de Operação não encontrado.');

                  wPuProporcinal := OperComum.DivValorZero(QryOrigemDivJurVLRLIQ.AsFloat,QryOrigemDivJurQTDEDIREITO.AsFloat);
                  // AL_8 - Retirada de variáveis não utilizadas
                  wVlrOperacao   := OperComum.Round(wQtdOper*wPuProporcinal,2);

                  // AL_4 - Variavel não utilizada
                  // Verifica se existe provisionamento de IR
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
                  qryProvisaoIDFORCLI.AsInteger            := wIdForCli;
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
                  //AL_34
                  qryProvisaoIDPLANPREVCTBPATR.AsInteger   := QryOrigemDivJurIDPLANPREVCTBPATR.AsInteger; //iPlanPrevCtbPatro;
                  qryProvisaoPLANPRVCONTABPATRO.AsString   := qryPlanPrevCtbPatr.Lookup('IDPLANPREVCTBPATR', QryOrigemDivJurIDPLANPREVCTBPATR.AsInteger, 'PLANPRVCONTABPATRO');
                  //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
                  qryProvisaoDATAOPERACAO.AsDateTime       := OperComum.RetornaDtContabDivBonif(qryDATAOPER.AsDateTime,
                                                                                                qryDATAOPER.AsDateTime,
                                                                                                qryDATAAGE.AsDateTime);
                  // AL_4 - 02/05/2004
                  qryProvisaoDATAVENCOPER.AsDateTime       := qryDATACOM.AsDateTime;
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
                  qryProvisaoORIGDEST.AsString             := 'O';
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
                  // AL_13
                  qryProvisaoCARTGERENCIAL.AsString := OperComum.IIF(qryProvisaoIDCARTEIRAGERENC.IsNull, 'N', 'S');
                  qryProvisao.Post;
               end;
            end;
            // Contabiliza Provisão - No OK da AGE
            QryOrigemDivJur.Next;
            fraMens.Incrementa;
         end;
         Result := True;
      except
         on E: Exception do
         begin
            //AL_36
            MsgDlg('Não foi possível gerar os Anúncios desta AGE' + #13+
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

function TfrmCadDividendos.GeraRecebimentos: Boolean;
//AL_34
var wIdNovaOperacao, wIdForCli, wIdForCliAnt, iResp, wIdPlanPrevAnt, iTipoOperAnt: Integer;
    fProporcao: Double;
    wNumDocNormal, wNumDocCCI, wNumDoc, wNumDocAnt, sBol, sDataOperAnt: String;
begin
   try
      try
         Result := False;
         qryProvisao.DisableControls;
         qryRecebimento.DisableControls;

         // Inicia a geração dos recebimentos a partir das provisões
         //    Para cada provisão é gerado um recebimento equivalente
         fraMens.Mostra;
         fraMens.Max := qryProvisao.RecordCount * 3;
         qryProvisao.First;
         // AL_13
         qryRecebimento.Last;
         wNumDocAnt := '';

         while not qryProvisao.Eof do
         begin
            fraMens.Mes := 'Processando: ' + qryProvisaoDESCCARTINVEST.AsString +  #13 +
                           OperComum.IIF(qryProvisaoSGLCUSTODIANTE.IsNull, '', ' Custodia: ' + qryProvisaoSGLCUSTODIANTE.AsString) +
                           OperComum.IIF(qryProvisaoSIGLAMOTBLOQ.IsNull, '', ' Bloqueio: ' + qryProvisaoSIGLAMOTBLOQ.AsString);

            // AL_13 - Se parcial, só continua se houver qtd a ser recebida
            if qryProvisaoQTDEEXERCIDA.AsFloat = qryProvisaoVLROPERACAO.AsFloat then
            begin
               qryProvisao.Next;
               fraMens.Incrementa;
               Continue;
            end;

            //AL_40
            // Caso o parametro de carteria gerencial for N (Não) ou estiver Nulo e a data da operação for
            //   maior que a data de encerramento da carteria gerencial, NÃO gera o recebimento
            if (((pRPI.FLGCARTGERENC = 'N') or (pRPI.FLGCARTGERENC = '')) and (qryDATACOM.AsDateTime > pRPI.DATAMOVCDBLIB)) and
               (not qryProvisaoIDCARTEIRAGERENC.IsNull) then
            begin
               qryProvisao.Next;
               fraMens.Incrementa;
               Continue;
            end;

            if qryProvisaoIDTIPOOPERACAO.AsInteger = -70 then
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
            //AL_34
            qryRecebimentoIDPLANPREVCTBPATR.AsInteger   := qryProvisaoIDPLANPREVCTBPATR.AsInteger;
            qryRecebimentoPLANPRVCONTABPATRO.AsString   := qryProvisaoPLANPRVCONTABPATRO.AsString;
            //Ricardo Cristiano - 28/07/2011 - N. Sol  -  N. Kintana
            //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
{            qryRecebimentoDATAOPERACAO.AsDateTime       := OperComum.RetornaDtContabDivBonif(qryDATACOM.AsDateTime,
                                                                                             qryDATACOM.AsDateTime,
                                                                                             qryDATAAGE.AsDateTime);  }
            qryRecebimentoDATAOPERACAO.AsDateTime       := qryDATACOM.AsDateTime;                                                                                             
            qryRecebimentoDATAVENCOPER.AsDateTime       := CalcVenc(qryDATACOM.AsDateTime, qryTipoOperRecVENCIMENTO.AsInteger);
            qryRecebimentoDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
            qryRecebimentoFLGSTATUSFECHBOL.AsString     := 'F';
            qryRecebimentoFLGSTATUSORDMOV.AsString      := 'L';
            //AL_13 -
            // Faz parcial sempre
            fProporcao := (qryProvisaoVLROPERACAO.AsFloat - qryProvisaoQTDEEXERCIDA.AsFloat) / qryProvisaoVLROPERACAO.AsFloat;
            qryRecebimentoQTDEOPERACAO.AsFloat          := qryProvisaoQTDEOPERACAO.AsFloat;
            qryRecebimentoVLROPERACAO.AsFloat           := qryProvisaoVLROPERACAO.AsFloat * fProporcao;

            // AL_15
            //Ricardo Cristiano - 11/11/2010 - N. Sol 147412 -  N. Kintana 1019370
            qryRecebimentoPRECOUNITOPERACAO.AsFloat     := qryRecebimentoVLROPERACAO.AsFloat / qryRecebimentoQTDEOPERACAO.AsFloat;

            qryRecebimentoVLRIR.AsFloat                 := qryProvisaoVLRIR.AsFloat * fProporcao;
            qryRecebimentoVLRREMUNERACAO.AsFloat        := qryProvisaoVLRREMUNERACAO.AsFloat * fProporcao;
            qryRecebimentoVLRIRREMUNER.AsFloat          := qryProvisaoVLRIRREMUNER.AsFloat * fProporcao;
            qryRecebimentoVLRLIQUIDO.AsFloat            := qryProvisaoVLRLIQUIDO.AsFloat * fProporcao;
            //AL_13 - Fim

            qryRecebimentoPERCENTUAL.AsFloat            := 0;
            // AL_20 - É Destino e não Origem
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
            // AL_13
            qryRecebimentoCARTGERENCIAL.AsString := OperComum.IIF(qryRecebimentoIDCARTEIRAGERENC.IsNull, 'N', 'S');
            qryRecebimento.Post;

            qryProvisao.Next;
            fraMens.Incrementa;
         end;

         // Gera as Boletas para os Recebimentos
         // ------------------------------------

         // Clona a query de Provisões
         CarregaCDS(tbsRecebimento);

         // Preenche o ForCli e o Tipo de Conta (CC, CCI)
         fraMens.Mes := 'Gerando Boletas de Recebimento' + #13 +
                        'Buscando Fornecedor / Cliente';

         //AL_38
         cdsSelBoleta.IndexFieldNames := '';
         cdsSelBoleta.First;
         while not cdsSelBoleta.Eof do
         begin
            FornecedorCli(cdsSelBoleta.FieldByName('IDCUSTODIANTE').AsInteger,
                          cdsSelBoleta.FieldByName('IDINVESTIMENTO').AsInteger, wIdForCli);
            cdsSelBoleta.Edit;
            cdsSelBoleta.FieldByName('IDFORCLI').AsInteger := wIdForCli;
            //AL_35
            qryTipoOperRec.Locate('IDTIPOOPERACAO',cdsSelBoleta.FieldByName('IDTIPOOPERACAO').AsInteger,[]);
            cdsSelBoleta.FieldByName('IDTIPOOPERACAO').AsInteger := qryTipoOperRecIDTIPOOPERACAO.AsInteger;
            cdsSelBoleta.Post;
            cdsSelBoleta.Next;
            fraMens.Incrementa;
         end;

         // Ordena pela quebra de boletas
         cdsSelBoleta.IndexFieldNames := 'DATAOPERACAO;IDFORCLI;IDPLANPREVCTBPATR;IDTIPOOPERACAO';
         cdsSelBoleta.First;

         wIdForCliAnt := 0;
         wIdPlanPrevAnt := 0;
         sDataOperAnt := '';
         iTipoOperAnt := 0;

         fraMens.Mes := 'Gerando Boletas de Recebimento' + #13 +
                        'Gravando Boletas';
         while not cdsSelBoleta.Eof do
         begin
            // Localiza o Recebimento correspondente
            if not qryRecebimento.Locate('IDOPERACAOINVEST', cdsSelBoleta.FieldByName('IDOPERACAOINVEST').AsInteger, []) then
               Raise Exception.Create('Não foi possível localizar o recebimento original ao gerar boletas');

            // Se for parcial, o documento da operação anterior já esta preenchido
            if qryRecebimentoNUMDOCUMENTO.IsNull then
            begin
               if (wIdForCliAnt <> cdsSelBoleta.FieldByName('IDFORCLI').AsInteger) or
                  (wIdPlanPrevAnt <> cdsSelBoleta.FieldByName('IDPLANPREVCTBPATR').AsInteger) or
                  (sDataOperAnt <> cdsSelBoleta.FieldByName('DATAOPERACAO').AsString) or
                  (iTipoOperAnt <> cdsSelBoleta.FieldByName('IDTIPOOPERACAO').AsInteger) then
               begin
                  // Capta o ForCli
                  wIdForCli := cdsSelBoleta.FieldByName('IDFORCLI').AsInteger;

                  // Grava a Boleta
                  qryBoleta.Insert;
                  //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611 - Início
                  qryBoletaSTATUS.AsString       := 'F';
                  //Ricardo Cristiano - 28/07/2011 - N. Sol  -  N. Kintana
                  qryBoletaDATABOLETA.AsDateTime := qryDATACOM.AsDateTime;
                  {qryBoletaDATABOLETA.AsDateTime := OperComum.RetornaDtContabDivBonif(qryDATACOM.AsDateTime,
                                                                                      qryDATACOM.AsDateTime,
                                                                                      qryDATAAGE.AsDateTime);}
                  // Gera numero de Boleta
                  wNumDoc := 'RV-' + Copy(qryBoletaDATABOLETA.AsString,9,2) + '/' +
                                          FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' + Copy(qryBoletaDATABOLETA.AsString,9,2)));                                                                                      
                  //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611 - Fim
                  qryBoletaIDBOLETA.AsString     := wNumDoc;
                  qryBoletaTIPMOVBOLETA.AsString := 'DTO';
                  qryBoletaIDFORCLI.AsInteger    := wIdForCli;
                  qryBoletaEXCLUIBOLETA.AsString := 'N';
                  qryBoleta.Post;

                  // Atualiza as variáveis de trabalho
                  wIdForCliAnt := cdsSelBoleta.FieldByName('IDFORCLI').AsInteger;
                  wIdPlanPrevAnt := cdsSelBoleta.FieldByName('IDPLANPREVCTBPATR').AsInteger;
                  sDataOperAnt := cdsSelBoleta.FieldByName('DATAOPERACAO').AsString;
                  iTipoOperAnt := cdsSelBoleta.FieldByName('IDTIPOOPERACAO').AsInteger;
               end;

               // Atualiza o Recebimento
               qryRecebimento.Edit;
               qryRecebimentoNUMDOCUMENTO.AsString := wNumDoc;
               qryRecebimentoIDFORCLI.AsInteger := wIdForCli;
               qryRecebimento.Post;
            end;

            cdsSelBoleta.Next;
            fraMens.Incrementa;
         end;

         Result := True;

         // Verifica se exieste diferença entre:
         //    o total lançado para as carteiras Fisicas e
         //    o total lançado para as carteirass Gerenciais
         // Caso exista diferença, Solicita se vai corrigir automáticamente ou não
         fraMens.Mes := 'Verificando Diferenças nos Lançamentos';
         // AL_13
         VerQtdExercida;
         VerDiferenca(True);
      except
         on E: Exception do
         begin
            MsgDlg('Houve um problema ao gerar os Recebimentos desta AGE' + #13+
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

// AL_12
function TfrmCadDividendos.GeraCancelamento: Boolean;
var wIdNovaOperacao, wIdForCli, wIdForCliAnt, iResp, wIdPlanPrevAnt, iTipoOperAnt: Integer;
    wNumDocNormal, wNumDocCCI, wNumDoc, wNumDocAnt, sBol, sDataOperAnt: String;
    //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
    fVlrCancelado, fQtdCancelado, fVlrRec, fIRRec, fRemuneracaoRec, fIRRemuneracaoRec, fVlrLiqRec :Double;
begin
   try
      try
         Result := False;

         // AL_13
         VerQtdExercida;

         qryProvisao.DisableControls;
         qryRecebimento.DisableControls;
         qryCancelamento.DisableControls;

         // Inicia a geração dos recebimentos a partir das provisões
         //    Para cada provisão é gerado um recebimento equivalente
         fraMens.Mostra;
         fraMens.Max := qryProvisao.RecordCount * 2;
         qryProvisao.First;
         // AL_13
         qryCancelamento.Last;
         wNumDocAnt := '';

         while not qryProvisao.Eof do
         begin
            fraMens.Mes := 'Processando: ' + qryProvisaoDESCCARTINVEST.AsString +  #13 +
                           OperComum.IIF(qryProvisaoSGLCUSTODIANTE.IsNull, '', ' Custodia: ' + qryProvisaoSGLCUSTODIANTE.AsString) +
                           OperComum.IIF(qryProvisaoSIGLAMOTBLOQ.IsNull, '', ' Bloqueio: ' + qryProvisaoSIGLAMOTBLOQ.AsString);

            if not qryTipoOperCan.Locate('IDTIPOOPERACAO', (qryProvisaoIDTIPOOPERACAO.AsInteger - 100), []) then
               Raise Exception.Create('Tipo de Operação não encontrado.');

            //AL_40
            // Caso o parametro de carteria gerencial for N (Não) ou estiver Nulo e a data da operação for
            //   maior que a data de encerramento da carteria gerencial, NÃO gera o recebimento
            if (((pRPI.FLGCARTGERENC = 'N') or (pRPI.FLGCARTGERENC = '')) and (qryDATACOM.AsDateTime > pRPI.DATAMOVCDBLIB)) and
               (not qryProvisaoIDCARTEIRAGERENC.IsNull) then
            begin
               qryProvisao.Next;
               fraMens.Incrementa;
               Continue;
            end;

            // AL_13
            // AL_18
            if Opercomum.ComparaValores(qryProvisaoVLROPERACAO.AsFloat, qryProvisaoQTDEEXERCIDA.AsFloat, '=', 2) then
            begin
               qryProvisao.Next;
               fraMens.Incrementa;
               Continue;
            end
            else
            begin
               fVlrRec           := 0;
               fIRRec            := 0;
               fRemuneracaoRec   := 0;
               fIRRemuneracaoRec := 0;
               fVlrLiqRec        := 0;
               qryRecebimento.First;
               while not qryRecebimento.Eof do
               begin
                  if qryRecebimentoIDOPERACAOORIGEM.AsInteger = qryProvisaoIDOPERACAOINVEST.AsInteger then
                  begin
                     fVlrRec := fVlrRec + qryRecebimentoVLROPERACAO.AsFloat;
                     fIRRec  := fIRRec + qryRecebimentoVLRIR.AsFloat;
                     //AL_34 - Ini
                     // Se não houve provisão de remuneração, não cancela nenhuma remuneração
                     if qryProvisaoVLRREMUNERACAO.AsFloat > 0 then
                     begin
                        fRemuneracaoRec   := fRemuneracaoRec   + qryRecebimentoVLRREMUNERACAO.AsFloat;
                        fIRRemuneracaoRec := fIRRemuneracaoRec + qryRecebimentoVLRIRREMUNER.AsFloat;
                     end;
                     fVlrLiqRec := fVlrLiqRec + (qryRecebimentoVLROPERACAO.AsFloat - qryRecebimentoVLRIR.AsFloat)
                     //AL_34 - Fim
                  end;
                  qryRecebimento.Next;
               end;
            end;
            // AL_13 - fim
            //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611 - Início
            fVlrCancelado := 0;
            fQtdCancelado := 0;

            qryCancelamentoVenda.First;
            while not qryCancelamentoVenda.eof do
            begin
               if ((qryCancelamentoVenda.FieldByName('IDCARTEIRAINVEST').AsInteger  = qryProvisao.FieldByName('IDCARTEIRAINVEST').AsInteger) and
                   (qryCancelamentoVenda.FieldByName('IDPLANPREVCTBPATR').AsInteger = qryProvisao.FieldByName('IDPLANPREVCTBPATR').AsInteger) and
                   (qryCancelamentoVenda.FieldByName('IDCUSTODIANTE').AsInteger     = qryProvisao.FieldByName('IDCUSTODIANTE').AsInteger) and
                   (qryCancelamentoVenda.FieldByName('IDMOTIVOBLOQUEIO').AsInteger  = qryProvisao.FieldByName('IDMOTIVOBLOQUEIO').AsInteger)) Then
               begin
                  fVlrCancelado := fVlrCancelado + qryCancelamentoVenda.FieldByName('VLROPERACAO').AsFloat;
                  fQtdCancelado := fQtdCancelado + qryCancelamentoVenda.FieldByName('QTDEOPERACAO').AsFloat;
               end;
               qryCancelamentoVenda.Next;
            end;

            if (qryProvisaoQTDEOPERACAO.AsFloat - fQtdCancelado) <= 0 then
            begin
               qryProvisao.Next;
               fraMens.Incrementa;
               Continue;
            end;
            //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611 - Fim
            // Gera Novo Id de Operacao
            wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

            // Grava o Cancelamento
            qryCancelamento.Insert;
            qryCancelamentoIDOPERACAOINVEST.AsInteger    := wIdNovaOperacao;
            qryCancelamentoIDOPERACAOORIGEM.AsInteger    := qryProvisaoIDOPERACAOINVEST.AsInteger;
            qryCancelamentoMOECODIGO.AsInteger           := pRPI.MOECODIGO;
            qryCancelamentoIDMODULO.AsInteger            := Sistema.IdModulo;
            qryCancelamentoEMPRESAPROP.AsInteger         := Sistema.IdEmpresa;
            qryCancelamentoIDINVESTIMENTO.AsInteger      := qryProvisaoIDINVESTIMENTO.AsInteger;
            qryCancelamentoDESCINVESTIMENTO.AsString     := qryProvisaoDESCINVESTIMENTO.AsString;
            qryCancelamentoIDCARTEIRA.AsString           := qryProvisaoIDCARTEIRA.AsString;
            qryCancelamentoIDCARTEIRAINVEST.AsInteger    := qryProvisaoIDCARTEIRAINVEST.AsInteger;
            if not qryProvisaoIDCARTEIRAGERENC.IsNull then
               qryCancelamentoIDCARTEIRAGERENC.AsInteger := qryProvisaoIDCARTEIRAGERENC.AsInteger
            else
               qryCancelamentoIDCARTEIRAGERENC.Clear;
            qryCancelamentoDESCCARTINVEST.AsString       := qryProvisaoDESCCARTINVEST.AsString;
            qryCancelamentoIDTIPOINVEST.AsInteger        := 2;
            qryCancelamentoIDTIPOOPERACAO.AsInteger      := qryTipoOperCanIDTIPOOPERACAO.AsInteger;
            qryCancelamentoDESCTIPOOPERACAO.AsString     := qryTipoOperCanDESCTIPOOPERACAO.AsString;
            qryCancelamentoNATUREZAOPERACAO.AsString     := qryTipoOperCanNATUREZAOPERACAO.AsString;
            if not qryProvisaoIDLOTE.IsNull then
               qryCancelamentoIDLOTE.AsString            := qryProvisaoIDLOTE.AsString
            else
               qryCancelamentoIDLOTE.Clear;
            if not qryProvisaoIDCUSTODIANTE.IsNull then
               qryCancelamentoIDCUSTODIANTE.AsInteger    := qryProvisaoIDCUSTODIANTE.AsInteger
            else
               qryCancelamentoIDCUSTODIANTE.Clear;
            if not qryProvisaoSGLCUSTODIANTE.IsNull then
               qryCancelamentoSGLCUSTODIANTE.AsString    := qryProvisaoSGLCUSTODIANTE.AsString
            else
               qryCancelamentoSGLCUSTODIANTE.Clear;
            qryCancelamentoIDOPERACAODIREITO.AsInteger   := qryIDOPERACAODIREITO.AsInteger;
            qryCancelamentoIDPLANPREVCTBPATR.AsInteger   := qryProvisaoIDPLANPREVCTBPATR.AsInteger;
            //AL_37
            qryCancelamentoPLANPRVCONTABPATRO.AsString   := qryProvisaoPLANPRVCONTABPATRO.AsString;
            //Ricardo Cristiano - 28/07/2011 - N. Sol  -  N. Kintana
            //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
            {qryCancelamentoDATAOPERACAO.AsDateTime       := OperComum.RetornaDtContabDivBonif(qryDATACOM.AsDateTime,
                                                                                              qryDATACOM.AsDateTime,
                                                                                              qryDATAAGE.AsDateTime);}
            qryCancelamentoDATAOPERACAO.AsDateTime       := qryDATACOM.AsDateTime;
            qryCancelamentoDATAVENCOPER.AsDateTime       := qryDATACOM.AsDateTime;
            qryCancelamentoDATABASE.AsDateTime           := qryDATAEX.AsdateTime;
            qryCancelamentoFLGSTATUSFECHBOL.AsString     := 'F';
            qryCancelamentoFLGSTATUSORDMOV.AsString      := 'L';

            //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
            // Cancela o que ainda não foi recebido
            qryCancelamentoQTDEOPERACAO.AsFloat          := qryProvisaoQTDEOPERACAO.AsFloat - fQtdCancelado;
            qryCancelamentoVLROPERACAO.AsFloat           := qryProvisaoVLROPERACAO.AsFloat - fVlrRec - fVlrCancelado;
            //AL_41 - Precisa recalcular, pois pode ser cancelamento parcial
            qryCancelamentoPRECOUNITOPERACAO.AsFloat     := RoundCM(OperComum.DivValorZero(qryCancelamentoVLROPERACAO.AsFloat, qryCancelamentoQTDEOPERACAO.AsFloat) * QryInvestimentoAcaoQTDTITLOTE.AsInteger, 15);
            qryCancelamentoVLRIR.AsFloat                 := qryProvisaoVLRIR.AsFloat - fIRRec;
            qryCancelamentoVLRREMUNERACAO.AsFloat        := qryProvisaoVLRREMUNERACAO.AsFloat - fRemuneracaoRec;
            qryCancelamentoVLRIRREMUNER.AsFloat          := qryProvisaoVLRIRREMUNER.AsFloat - fIRRemuneracaoRec;
            //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
            qryCancelamentoVLRLIQUIDO.AsFloat            := qryProvisaoVLRLIQUIDO.AsFloat - fVlrLiqRec - fVlrCancelado;

            qryCancelamentoPERCENTUAL.AsFloat            := 0;
            qryCancelamentoORIGDEST.AsString             := 'D';
            if not qryProvisaoIDMOTIVOBLOQUEIO.IsNull then
               qryCancelamentoIDMOTIVOBLOQUEIO.AsInteger := qryProvisaoIDMOTIVOBLOQUEIO.AsInteger
            else
               qryCancelamentoIDMOTIVOBLOQUEIO.Clear;
            if not qryProvisaoSIGLAMOTBLOQ.IsNull then
               qryCancelamentoSIGLAMOTBLOQ.AsString      := qryProvisaoSIGLAMOTBLOQ.AsString
            else
               qryCancelamentoSIGLAMOTBLOQ.Clear;
            qryCancelamentoIDOPERCUSTODIA.Clear;
            qryCancelamentoALTERADO.AsString := 'S';
            // AL_13
            qryCancelamentoCARTGERENCIAL.AsString := OperComum.IIF(qryCancelamentoIDCARTEIRAGERENC.IsNull, 'N', 'S');
            qryCancelamento.Post;

            qryProvisao.Next;
            fraMens.Incrementa;
         end;

         //AL_37 - Ini
         // Gera as Boletas para os Recebimentos
         // ------------------------------------

         // Clona a query de Provisões
         CarregaCDS(tbsCancelamento);

         // Preenche o ForCli e o Tipo de Conta (CC, CCI)
         fraMens.Mes := 'Gerando Boletas de Cancelamento' + #13 +
                        'Buscando Fornecedor / Cliente';

         while not cdsSelBoleta.Eof do
         begin
            FornecedorCli(cdsSelBoleta.FieldByName('IDCUSTODIANTE').AsInteger,
                          cdsSelBoleta.FieldByName('IDINVESTIMENTO').AsInteger, wIdForCli);
            cdsSelBoleta.Edit;
            cdsSelBoleta.FieldByName('IDFORCLI').AsInteger := wIdForCli;
            qryTipoOperRec.Locate('IDTIPOOPERACAO',cdsSelBoleta.FieldByName('IDTIPOOPERACAO').AsInteger,[]);
            cdsSelBoleta.FieldByName('IDTIPOOPERACAO').AsInteger := qryTipoOperRecIDTIPOOPERACAO.AsInteger;
            cdsSelBoleta.Post;
            cdsSelBoleta.Next;
            fraMens.Incrementa;
         end;

         // Ordena pela quebra de boletas
         cdsSelBoleta.IndexFieldNames := 'DATAOPERACAO;IDFORCLI;IDPLANPREVCTBPATR;IDTIPOOPERACAO';
         cdsSelBoleta.First;

         wIdForCliAnt := 0;
         wIdPlanPrevAnt := 0;
         sDataOperAnt := '';
         iTipoOperAnt := 0;

         fraMens.Mes := 'Gerando Boletas de Cancelamento' + #13 +
                        'Gravando Boletas';
         while not cdsSelBoleta.Eof do
         begin
            // Localiza o Cancelamento correspondente
            if not qryCancelamento.Locate('IDOPERACAOINVEST', cdsSelBoleta.FieldByName('IDOPERACAOINVEST').AsInteger, []) then
               Raise Exception.Create('Não foi possível localizar o cancelamento original ao gerar boletas');

            // Se for parcial, o documento da operação anterior já esta preenchido
            if qryCancelamentoNUMDOCUMENTO.IsNull then
            begin
               if (wIdForCliAnt <> cdsSelBoleta.FieldByName('IDFORCLI').AsInteger) or
                  (wIdPlanPrevAnt <> cdsSelBoleta.FieldByName('IDPLANPREVCTBPATR').AsInteger) or
                  (sDataOperAnt <> cdsSelBoleta.FieldByName('DATAOPERACAO').AsString) or
                  (iTipoOperAnt <> cdsSelBoleta.FieldByName('IDTIPOOPERACAO').AsInteger) then
               begin
                  // Capta o ForCli
                  wIdForCli := cdsSelBoleta.FieldByName('IDFORCLI').AsInteger;

                  // Grava a Boleta
                  qryBoleta.Insert;
                  //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611 - Início
                  qryBoletaSTATUS.AsString       := 'F';
                  //Ricardo Cristiano - 28/07/2011 - N. Sol  -  N. Kintana
                  qryBoletaDATABOLETA.AsDateTime := qryDATACOM.AsDateTime;
                  {qryBoletaDATABOLETA.AsDateTime := OperComum.RetornaDtContabDivBonif(qryDATACOM.AsDateTime,
                                                                                      qryDATACOM.AsDateTime,
                                                                                      qryDATAAGE.AsDateTime);}
                  // Gera numero de Boleta
                  wNumDoc := 'RV-' + Copy(qryBoletaDATABOLETA.AsString,9,2) + '/' +
                                          FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' + Copy(qryBoletaDATABOLETA.AsString,9,2)));
                  //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611 - Fim
                  qryBoletaIDBOLETA.AsString     := wNumDoc;                                                                                      
                  //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
                  qryBoletaTIPMOVBOLETA.AsString := 'DTC';
                  qryBoletaIDFORCLI.AsInteger    := wIdForCli;
                  qryBoletaEXCLUIBOLETA.AsString := 'N';
                  qryBoleta.Post;

                  // Atualiza as variáveis de trabalho
                  wIdForCliAnt := cdsSelBoleta.FieldByName('IDFORCLI').AsInteger;
                  wIdPlanPrevAnt := cdsSelBoleta.FieldByName('IDPLANPREVCTBPATR').AsInteger;
                  sDataOperAnt := cdsSelBoleta.FieldByName('DATAOPERACAO').AsString;
                  iTipoOperAnt := cdsSelBoleta.FieldByName('IDTIPOOPERACAO').AsInteger;
               end;

               // Atualiza o Cancelamento
               qryCancelamento.Edit;
               qryCancelamentoNUMDOCUMENTO.AsString := wNumDoc;
               qryCancelamentoIDFORCLI.AsInteger := wIdForCli;
               qryCancelamento.Post;
            end;

            cdsSelBoleta.Next;
            fraMens.Incrementa;
         end;
         //AL_34 - Fim
         //AL_37 - Ini

         // AL_13
         VerQtdExercida;
         Result := True;

      except
         on E: Exception do
         begin
            MsgDlg('Houve um problema ao gerar os Cancelamentos desta AGE' + #13+
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
      qryCancelamento.First;
      qryCancelamento.EnableControls;
      fraMens.Apaga;
      CmeDetalhe.AtualizaBotoes(Self);
   end;
end;

//AL_34
Function TfrmCadDividendos.BuscaBoleta(dData: TDateTime;
                                       iPlanPrev, iCarteira, iCartGer, iCustodiante, iMotBloq, iTipoOper: Integer): String;
var
    wIdForCli: Integer;
    sTipoMov: String;
begin
   Result := '';
   // Se ainda não foi preenchido: Data, Carteira e Tipo de Operação
   if (dData = 0) or (iCarteira = 0) or (iTipoOper = 0) then
      Exit;
   // Se for Carteira Própria e ainda não foi preenchido: Custodiante ou Motivo de Bloqueio
   // AL_13 - Inicio
   if (iCartGer = 0) and ((iCustodiante = 0) or (iMotBloq = 0)) then
      Exit;
   // Todos os Dados Necessários Preenchidos
   try
      FornecedorCli(iCustodiante, qryDetalheIDINVESTIMENTO.AsInteger, wIdForCli);
      cdsSelBoleta.First;
      while not cdsSelBoleta.Eof do
      begin
         //AL_34
         if (cdsSelBoleta.FieldByName('IDFORCLI').AsInteger = wIdForCli) and
            (cdsSelBoleta.FieldByName('IDPLANPREVCTBPATR').AsInteger = iPlanPrev) then
         begin
            if (((Abs(iTipoOper) > 0) and (Abs(cdsSelBoleta.FieldByName('IDTIPOOPERACAO').AsInteger) > 0)) or
                ((Abs(iTipoOper) < 0) and (Abs(cdsSelBoleta.FieldByName('IDTIPOOPERACAO').AsInteger) < 0))) and
               (dData = cdsSelBoleta.FieldByName('DATAOPERACAO').AsDateTime) and
               (not cdsSelBoleta.FieldByName('NUMDOCUMENTO').IsNull)  then
            begin
               Result := cdsSelBoleta.FieldByName('NUMDOCUMENTO').AsString;
               Break;
            end;
         end;
         cdsSelBoleta.Next;
      end;

      if Result = '' then
      begin
         // Cria nova boleta
         // AL_13
         if (iTipoOper = -70) or (iTipoOper = -10070) then
            sTipoMov := 'DTA'   //Provisão
         else if (iTipoOper = -170) or (iTipoOper = -10170) then
            sTipoMov := 'DTC'   //Cancelamento
         else
            sTipoMov := 'DTO';  // Recebimento

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
   finally

   end;
   // AL_13 - Fim
end;

function TfrmCadDividendos.CalcVenc(dDataOper: TDateTime; iPrazo: Integer): TDateTime;
begin
   Result := DiasUteisInv.SomaDiasUteis(dDataOper, iPrazo,-1,1,'',True,False,False)
end;

//AL_34
function TfrmCadDividendos.AchaProvisao(iTipoOper, iPlanPrev, iCartInvest, iCartGerenc,
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
         //AL_34
         if (qryProvisaoIDTIPOOPERACAO.AsInteger   = iTipoOperacao) and
            (qryProvisaoIDPLANPREVCTBPATR.AsInteger = iPlanPrev) and
            (qryProvisaoIDCARTEIRAINVEST.AsInteger = iCartInvest) and
            (qryProvisaoIDCARTEIRAGERENC.AsInteger = iCartGerenc) and
            (qryProvisaoIDCUSTODIANTE.AsInteger    = iCustodiante) and
            // AL_19
            (((qryProvisaoIDCARTEIRAGERENC.IsNull) and
              (qryProvisaoIDMOTIVOBLOQUEIO.AsInteger = iMotBloq)) or
             (not qryProvisaoIDCARTEIRAGERENC.IsNull)) then
            Break;
         qryProvisao.Next;
      end;
      // Se não achou, a query está em EOF (Não fez o Break)
      if qryProvisao.Eof then
         Result := False;
   end;
end;

procedure TfrmCadDividendos.bbtnGeraRecebimentoClick(Sender: TObject);
begin
   inherited;
   try
      //AL_23
      if dbcRecTotal.Checked then
      begin
         MsgDlg('Esta AGE está marcada como totalmente recebida. ' + #13 +
                'Não é possível alterá-la', 'Mensagem do Sistema', mtWarning, [mbOK], 0);
         Exit;
      end;

      // AL_13 - Inicio
      if pgctrlDetalhe.ActivePage = tbsProvisao then
         ProvisionaOper
      else if pgctrlDetalhe.ActivePage = tbsRecebimento then
         GeraRecebimentos
      else if pgctrlDetalhe.ActivePage = tbsCancelamento then
         GeraCancelamento;
      // AL_13 - Fim
   finally
      bbtnGeraRecebimento.Down := False;
   end;
end;

procedure TfrmCadDividendos.qryRecebimentoAfterScroll(DataSet: TDataSet);
begin
   inherited;
   qryCarteiraRec.Locate('IDCARTEIRAINVEST;IDCARTEIRAGERENC',
                          VarArrayOf([qryRecebimentoIDCARTEIRAINVEST.AsVariant,
                                      qryRecebimentoIDCARTEIRAGERENC.AsVariant]),[])
end;

procedure TfrmCadDividendos.dsStateChange(Sender: TObject);
begin
   inherited;
   bbtnGeraRecebimento.Visible := (pgctrlDetalhe.ActivePage <> tbsDet);
   if pgctrlDetalhe.ActivePage = tbsProvisao then
   begin
      bbtnGeraRecebimento.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty));
      bbtnGeraRecebimento.Hint := 'Gera Anúncios';
   end
   else if pgctrlDetalhe.ActivePage = tbsRecebimento then
   begin
      bbtnGeraRecebimento.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty) and
                                      (not qryProvisao.IsEmpty));
      bbtnGeraRecebimento.Hint := 'Gera Recebimentos';
   end
   else if pgctrlDetalhe.ActivePage = tbsCancelamento then
   begin
      bbtnGeraRecebimento.Enabled := ((qry.State in [dsInsert, dsEdit]) and
                                      (not qryDetalhe.IsEmpty) and
                                      (not qryProvisao.IsEmpty));
      bbtnGeraRecebimento.Hint := 'Gera Cancelamentos';
   end;
end;

procedure TfrmCadDividendos.dbrVlrRecExit(Sender: TObject);
begin
   inherited;
   // AL_13
   if TComponent(Sender).Name = 'dbrVlrRec' then
   begin
      //AL_34
      if AchaProvisao(qryTipoOperRecIDTIPOOPERACAO.AsInteger,
                      qryRecebimentoIDPLANPREVCTBPATR.AsInteger,
                      qryRecebimentoIDCARTEIRAINVEST.AsInteger,
                      qryRecebimentoIDCARTEIRAGERENC.AsInteger,
                      qryRecebimentoIDCUSTODIANTE.AsInteger,
                      qryRecebimentoIDMOTIVOBLOQUEIO.AsInteger) then
      begin
         qryRecebimentoQTDEOPERACAO.AsFloat := qryProvisaoQTDEOPERACAO.AsFloat;
         if (qryRecebimentoQTDEOPERACAO.AsFloat <> 0) and
            ((qryRecebimentoPRECOUNITOPERACAO.AsFloat = 0) or
             (fVlrAntRec <> qryRecebimentoVLROPERACAO.AsFloat)) then
            qryRecebimentoPRECOUNITOPERACAO.AsFloat := OperComum.Round(((qryRecebimentoVLROPERACAO.AsFloat / qryRecebimentoQTDEOPERACAO.AsFloat) * qryInvestimentoAcaoQTDTITLOTE.AsInteger)-0.0000000049,8);
      end;
   end;
   CalculaVlrLiq('R');
end;

procedure TfrmCadDividendos.VerDiferenca(bMostra: Boolean);
var wVlrTotOperacao, wVlrTotOpeGer, wVlrDif: Double;
    iResp: Integer;
begin
   try
      lblCapCarteira.Visible := False;
      lblCapGerenc.Visible := False;
      lblCapDif.Visible := False;
      lblVlrCarteira.Visible := False;
      lblVlrGerenc.Visible := False;
      lblVlrDif.Visible := False;

      if pRPI.FLGCARTGERENC = 'S' then
      begin
         // AL_8 - Retirada de variáveis
         wVlrTotOperacao := 0;
         wVlrTotOpeGer := 0;

         qryRecebimento.DisableControls;
         qryRecebimento.First;
         while not qryRecebimento.Eof do
         begin
            if qryRecebimentoIDCARTEIRAGERENC.IsNull then
               // Total das Carteiras Próprias
               wVlrTotOperacao := wVlrTotOperacao + qryRecebimentoVLRLIQUIDO.AsFloat
            else
               // Total das Carteiras Gerenciais
               wVlrTotOpeGer := wVlrTotOpeGer + qryRecebimentoVLRLIQUIDO.AsFloat;

            qryRecebimento.Next;
         end;

         // Diferença no rateio
         wVlrDif := RendaFixa.DiminuiValores(wVlrTotOperacao, wVlrTotOpeGer);

         if (wVlrDif <> 0) and (wVlrTotOpeGer <> 0) then
         begin
            // AL_13
            if Abs(wVlrDif) > 1 then
               bMostra := False;

            if bMostra then
               iResp := MsgDlg('Existe uma diferença no rateio do recebimento pelas carteiras gerenciais' + #13 +
                               'Valor: R$ ' + FormatFloat('###,###,###,##0.00', wVlrDif) + #13 +
                               'Efetua ajuste automático?', 'Mensagem do Sistema ', mtConfirmation, [mbYes, mbNo], 0)
            else
               iResp := mrNo;

            if iResp = mrYes then
            begin
               qryRecebimento.Last;
               while qryRecebimentoIDCARTEIRAGERENC.IsNull do
                  qryRecebimento.Prior;
               if not qryRecebimento.Bof then
               begin
                  qryRecebimento.Edit;
                  qryRecebimentoVLROPERACAO.AsFloat := qryRecebimentoVLROPERACAO.AsFloat + wVlrDif;
                  qryRecebimentoVLRLIQUIDO.AsFloat := qryRecebimentoVLRLIQUIDO.AsFloat + wVlrDif;
                  qryRecebimentoPRECOUNITOPERACAO.AsFloat := OperComum.Round(((qryRecebimentoVLROPERACAO.AsFloat / qryRecebimentoQTDEOPERACAO.AsFloat)* qryInvestimentoAcaoQTDTITLOTE.AsInteger)-0.0000000049,8);
                  CalculaVlrLiq('R');
                  qryRecebimento.Post;
               end;
            end
            else
            begin
               if pgctrlDetalhe.ActivePage = tbsRecebimento then
               begin
                  lblVlrCarteira.Caption := 'R$ ' + FormatFloat('###,###,###,##0.00', wVlrTotOperacao);
                  lblVlrGerenc.Caption   := 'R$ ' + FormatFloat('###,###,###,##0.00', wVlrTotOpeGer);
                  lblVlrDif.Caption      := 'R$ ' + FormatFloat('###,###,###,##0.00', wVlrDif);
                  lblCapDif.Caption      := 'Diferença:';
                  lblCapCarteira.Visible := True;
                  lblCapGerenc.Visible   := True;
                  lblCapDif.Visible      := True;
                  lblVlrCarteira.Visible := True;
                  lblVlrGerenc.Visible   := True;
                  lblVlrDif.Visible      := True;
               end;
            end;
         end;
      end;
   finally
      //AL_34
      qryRecebimento.First;
      qryRecebimento.EnableControls;
      lblCapCarteira.Invalidate;
      lblCapGerenc.Invalidate;
      lblCapDif.Invalidate;
      lblVlrCarteira.Invalidate;
      lblVlrGerenc.Invalidate;
      lblVlrDif.Invalidate;
      Application.ProcessMessages;
   end;
end;

procedure TfrmCadDividendos.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;
   Sel(qryIDOPERACAODIREITO.AsInteger, False);
   //Al_9
   HabilitaCamposDireito(True);
   CmeCadastro.AtualizaBotoes(Self);
end;

procedure TfrmCadDividendos.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   lblCapCarteira.Visible := False;
   lblCapGerenc.Visible := False;
   lblCapDif.Visible := False;
   lblVlrCarteira.Visible := False;
   lblVlrGerenc.Visible := False;
   lblVlrDif.Visible := False;
end;

procedure TfrmCadDividendos.bbtnCancelarDetClick(Sender: TObject);
begin
   inherited;
   lblCapCarteira.Visible := False;
   lblCapGerenc.Visible := False;
   lblCapDif.Visible := False;
   lblVlrCarteira.Visible := False;
   lblVlrGerenc.Visible := False;
   lblVlrDif.Visible := False;
end;

procedure TfrmCadDividendos.dblCarteiraProvisaoExit(Sender: TObject);
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

procedure TfrmCadDividendos.dblCarteiraRecExit(Sender: TObject);
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

procedure TfrmCadDividendos.dblCarteiraCanExit(Sender: TObject);
begin
  inherited;
  // Para Carteiras Próprias, o defaul é saldo liberado
  if Trim(dblMotivoBloqueioCan.Text) = '' then
  begin
     if (qryCarteiraCanIDCARTEIRAGERENC.IsNull) and (qryCancelamento.State = dsInsert) then
        qryCancelamentoIDMOTIVOBLOQUEIO.AsInteger := -1;
  end;
  if Trim(dblCarteiraCan.Text) <> '' then
  begin
     qryCancelamentoIDCARTEIRAINVEST.AsInteger := qryCarteiraCanIDCARTEIRAINVEST.AsInteger;
     if not qryCarteiraCanIDCARTEIRAGERENC.IsNull then
        qryCancelamentoIDCARTEIRAGERENC.AsInteger := qryCarteiraCanIDCARTEIRAGERENC.AsInteger
     else
        qryCancelamentoIDCARTEIRAGERENC.Clear;
  end;
end;

procedure TfrmCadDividendos.dbrVlrIRRecExit(Sender: TObject);
begin
   inherited;
   if qryIRLITIGIO.AsString  = 'S' then
      qryRecebimentoVLRLIQUIDO.AsFloat := (dbrVlrRec.Value + dbrVlrRemRec.Value)
   else
      qryRecebimentoVLRLIQUIDO.AsFloat := (dbrVlrRec.Value + dbrVlrRemRec.Value) - dbrVlrIRRec.Value;
end;

procedure TfrmCadDividendos.dbrVlrIRProvExit(Sender: TObject);
begin
   inherited;
   if qryIRLITIGIO.AsString  = 'S' then
      qryProvisaoVLRLIQUIDO.AsFloat := (dbrVlrProv.Value + dbrVlrRemProv.Value)
   else
      qryProvisaoVLRLIQUIDO.AsFloat := (dbrVlrProv.Value + dbrVlrRemProv.Value) - dbrVlrIRProv.Value;
end;

procedure TfrmCadDividendos.VerQtdExercida;
var fQtdExerc: Double;
begin
   try
      qryProvisao.DisableControls;
      qryRecebimento.DisableControls;
      qryCancelamento.DisableControls;
      qryProvisao.First;
      while not qryProvisao.Eof do
      begin
         fQtdExerc := 0;
         qryRecebimento.First;
         while not qryRecebimento.Eof do
         begin
            //AL_34
            if ((((qryProvisaoIDTIPOOPERACAO.AsInteger > -10000) and (qryRecebimentoIDTIPOOPERACAO.AsInteger < 10000)) or
                 ((qryProvisaoIDTIPOOPERACAO.AsInteger < -10000) and (qryRecebimentoIDTIPOOPERACAO.AsInteger > 10000))) and
                (qryRecebimentoIDPLANPREVCTBPATR.AsInteger = qryProvisaoIDPLANPREVCTBPATR.AsInteger) and
                (qryRecebimentoIDCARTEIRAINVEST.AsInteger = qryProvisaoIDCARTEIRAINVEST.AsInteger) and
                (qryRecebimentoIDCARTEIRAGERENC.AsInteger = qryProvisaoIDCARTEIRAGERENC.AsInteger) and
                (qryRecebimentoIDCUSTODIANTE.AsInteger    = qryProvisaoIDCUSTODIANTE.AsInteger) and
                (qryRecebimentoIDMOTIVOBLOQUEIO.AsInteger = qryProvisaoIDMOTIVOBLOQUEIO.AsInteger)) or
                (qryRecebimentoIDOPERACAOORIGEM.AsInteger = qryProvisaoIDOPERACAOINVEST.AsInteger) then
            begin
               fQtdExerc := fQtdExerc + qryRecebimentoVLROPERACAO.AsFloat;
            end;
            qryRecebimento.Next;
         end;

         //AL_12
         if qryCancelamento.Locate('IDOPERACAOORIGEM', qryProvisaoIDOPERACAOINVEST.AsInteger, []) then
            fQtdExerc := fQtdExerc + qryCancelamentoVLROPERACAO.AsFloat;

         qryProvisao.Edit;
         qryProvisaoQTDEEXERCIDA.AsFloat := fQtdExerc;
         qryProvisao.Post;
         qryProvisao.Next;
      end;
   finally
      qryProvisao.First;
      qryRecebimento.First;
      qryCancelamento.First;
      qryProvisao.EnableControls;
      qryRecebimento.EnableControls;
      qryCancelamento.EnableControls;
   end;
end;

procedure TfrmCadDividendos.qryProvisaoAfterScroll(DataSet: TDataSet);
begin
   inherited;
   // Se a Orelha ativa for a de Provisão
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
         if (DataSet.FieldByName('VLROPERACAO').AsFloat - DataSet.FieldByName('QTDEEXERCIDA').AsFloat) > 0 then
         begin
            lblCapDif.Caption := 'Valor não exercido: ';
            lblVlrDif.Caption := FormatFloat('#,##0.00', (DataSet.FieldByName('VLROPERACAO').AsFloat - DataSet.FieldByName('QTDEEXERCIDA').AsFloat));
            lblCapDif.Visible := True;
            lblVlrDif.Visible := True;
         end
         else if (DataSet.FieldByName('VLROPERACAO').AsFloat - DataSet.FieldByName('QTDEEXERCIDA').AsFloat) < 0 then
         begin
            lblCapDif.Caption := 'Valor excedente: ';
            lblVlrDif.Caption := FormatFloat('#,##0.00', Abs(DataSet.FieldByName('VLROPERACAO').AsFloat - DataSet.FieldByName('QTDEEXERCIDA').AsFloat));
            lblCapDif.Visible := True;
            lblVlrDif.Visible := True;
         end
         else
         begin
            lblCapDif.Caption := 'Diferença:  ';
            lblVlrDif.Caption := FormatFloat('#,##0.00', 0);
            lblCapDif.Visible := False;
            lblVlrDif.Visible := False;
         end;
      end;
   end;
end;

procedure TfrmCadDividendos.CmeDetalheEdit(Sender: TObject);
begin
   inherited;
   //AL_40
   if pgctrlDetalhe.ActivePage = tbsRecebimento then
   begin
      // Controle de Quantidade alterada no recebimento
      wQtdOperAnt := qryRecebimentoQTDEOPERACAO.AsFloat;
      //AL_40
      if (qryCarteiraRec.ParamByName('DATALIMGER').AsString <> qryRecebimentoDATAOPERACAO.AsString) then
      begin
         // Esta query deve ser reaberta aqui pois os recebimentos podem acontecer em mais de uma data
         OperComum.LimpaParametros(qryCarteiraRec);
         qryCarteiraRec.ParamByName('DATALIMGER').AsString  := qryDATACOM.AsString;
         qryCarteiraRec.Open;
      end;
   end
   else
   if pgctrlDetalhe.ActivePage = tbsCancelamento then
   begin
      //AL_40
      if (qryCarteiraCan.ParamByName('DATALIMGER').AsString <> qryCancelamentoDATAOPERACAO.AsString) then
      begin
         // Esta query deve ser reaberta aqui pois os Cancelamentos podem acontecer em mais de uma data
          OperComum.LimpaParametros(qryCarteiraCan);
          qryCarteiraCan.ParamByName('DATALIMGER').AsString  := dbdDataOperacaoCan.Text;
          qryCarteiraCan.Open;
      end;
   end;
end;


procedure TfrmCadDividendos.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if qryDetalhe.IsEmpty then
     dblEmissor.Enabled := True
  else
     dblEmissor.Enabled := False;

  if qryProvisao.IsEmpty then
  begin
     dblTipoOperacao.Enabled := True;
     dbeDivPorAcao.Enabled   := True;
     dbePercentual.Enabled   := True;
     dbdAGE.Enabled          := True;
     dbdEX.Enabled           := True;
     dbdOper.Enabled         := True;
     dbcIsentoIr.Enabled     := True;
     dbcIRLitigio.Enabled    := True;
  end
  else
  begin
     dblTipoOperacao.Enabled := False;
     dbeDivPorAcao.Enabled   := False;
     dbePercentual.Enabled   := False;
     dbdAGE.Enabled          := False;
     dbdEX.Enabled           := False;
     dbdOper.Enabled         := False;
     dbcIsentoIr.Enabled     := False;
     dbcIRLitigio.Enabled    := False;
  end;

//Ricardo Cristiano - 17/07/2009 - N. Sol 122100 -  N. Kintana 595036  
{  if qryRecebimento.IsEmpty then
     dbdCOM.Enabled := True
  else
     dbdCOM.Enabled := False;}
end;

procedure TfrmCadDividendos.dbdDataOperacaoRecExit(Sender: TObject);
begin
  inherited;
  if qryRecebimento.State in [dsEdit, dsInsert] then
     qryRecebimentoDATAVENCOPER.AsDateTime := CalcVenc(dbdDataOperacaoRec.DateTime, qryTipoOperRecVENCIMENTO.AsInteger);

end;

// AL_4
procedure TfrmCadDividendos.PintaGrig(Sender: TObject;
          const Rect: TRect; Field: TField; State: TGridDrawState);
begin
   //AL_41
   If pRPI.FLGCARTGERENC = 'S' then
   begin
      if not ((gdSelected in State) or (gdFocused in State)) then
      begin
         if Field.DataSet.FindField('IDCARTEIRAGERENC') <> nil then
         begin
            if Field.DataSet.FindField('IDCARTEIRAGERENC').AsInteger <> 0 then
               TwwDBGrid(Sender).Canvas.Brush.Color := cCorZebra
            else
               TwwDBGrid(Sender).Canvas.Brush.Color := clwhite;
         end;
         TwwDBGrid(Sender).DefaultDrawDataCell(Rect, Field, State);
      end
      else if (gdSelected in State) or (gdFocused in State) then
      begin
         if Field.DataSet.FindField('IDCARTEIRAGERENC') <> nil then
         begin
            if Field.DataSet.FindField('IDCARTEIRAGERENC').AsInteger <> 0 then
               TwwDBGrid(Sender).Canvas.Font.Color := cCorZebra
            else
               TwwDBGrid(Sender).Canvas.Font.Color := clWhite;

            // AL_13
            TwwDBGrid(Sender).Canvas.Brush.Color := clNavy;
         end;
         TwwDBGrid(Sender).DefaultDrawDataCell(Rect, Field, State);
      end;
   end;
end;

// AL_8 - Novo Relatório
procedure TfrmCadDividendos.mnuAnuRecClick(Sender: TObject);
begin
   inherited;
   // AL_16
   sTipoRel := 'A';
   AbrirFormModal(frmParamAnunciosAbt, TfrmParamAnunciosAbt);
   frmCadDividendos.WindowState := wsMaximized;
   sTipoRel := ''
end;

// AL_12
procedure TfrmCadDividendos.mnuExeDirClick(Sender: TObject);
begin
   inherited;
   // AL_16
   sTipoRel := 'R';
   AbrirFormModal(frmParamAnunciosAbt, TfrmParamAnunciosAbt);
   frmCadDividendos.WindowState := wsMaximized;
   sTipoRel := ''
end;

// AL_8 - Nova Crítica
procedure TfrmCadDividendos.CmeDetalheApplyInsert(sender: TObject;  var Accept: Boolean);
var sDataLanc: String;
    fValorAntigo: Double;
begin
   Accept := True;
   sDataLanc := '';

   if pgctrlDetalhe.ActivePage = tbsDet then
   begin
      if Trim(dblInvestimento.Text) = '' then
      begin
         MsgDlg('Selecione um Investimento.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblInvestimento.CanFocus then
            dblInvestimento.SetFocus;
         Accept := False;
      end;
   end
   else if pgctrlDetalhe.ActivePage = tbsProvisao then
   begin
      // AL_13
      // Não pode alterar Provisão já recebida ou cancelada
      if qryRecebimento.Locate('IDOPERACAOORIGEM', qryProvisaoIDOPERACAOINVEST.AsInteger, []) then
      begin
         MsgDlg('Não é possível alterar um Anúncio já recebido',
                'Mensagem do Sistema', MtWarning, [mbOk],0);
         Accept := False;
      end
      else
      if qryCancelamento.Locate('IDOPERACAOORIGEM', qryProvisaoIDOPERACAOINVEST.AsInteger, []) then
      begin
         MsgDlg('Não é possível alterar um Anúncio já cancelado',
                'Mensagem do Sistema', MtWarning, [mbOk],0);
         Accept := False;
      end
      else
      // AL_13 - Fim
      //AL_36
      if Trim(dblPlanPatroProv.Text) = '' then
      begin
         MsgDlg('Não foi selecionado um Plano / Patrocinadora para este Anúncio,'+#13+
                'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblPlanPatroProv.CanFocus then
            dblPlanPatroProv.SetFocus;
         Accept := False;
      end
      else
      //AL_36
      if Trim(dblTipoOperProv.Text) = '' then
      begin
         MsgDlg('Não foi selecionado um tipo de operação para este Anúncio,'+#13+
                'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblTipoOperProv.CanFocus then
            dblTipoOperProv.SetFocus;
         Accept := False;
      end
      else
      if Trim(dblCarteiraProvisao.Text) = '' then
      begin
         MsgDlg('Não foi selecionada uma Carteira para este Anúncio,'+#13+
                'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblCarteiraProvisao.CanFocus then
            dblCarteiraProvisao.SetFocus;
         Accept := False;
      end
      else
      if (Trim(dblCustodianteProv.Text) = '') and (qryCarteiraProvIDCARTEIRAGERENC.IsNull) then
      begin
         MsgDlg('Não foi selecionado um Custodiante para este Anúncio,'+#13+
                'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblCustodianteProv.CanFocus then
            dblCustodianteProv.SetFocus;
         Accept := False;
      end
      else
      if dbrQtdProv.Value = 0 then
      begin
         MsgDlg('Não foi informado uma Quantidade para este Anúncio,'+#13+
                'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dbrQtdProv.CanFocus then
            dbrQtdProv.SetFocus;
         Accept := False;
      end
      else
      if dbrVlrProv.Value = 0 then
      begin
         MsgDlg('Não foi informado uma Valor para este Anúncio,'+#13+
                'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dbrVlrProv.CanFocus then
            dbrVlrProv.SetFocus;
         Accept := False;
      end
      else
      if dbrVlrLiqProv.Value = 0 then
      begin
         MsgDlg('Não foi calculado um Valor Líquido para este Anúncio,'+#13+
                'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dbrVlrLiqProv.CanFocus then
            dbrVlrLiqProv.SetFocus;
         Accept := False;
      end;
      // AL_13
      sDataLanc := qryProvisaoDATAOPERACAO.AsString;
   end
   else if pgctrlDetalhe.ActivePage = tbsRecebimento then
   begin
      //AL_36
      if Trim(dblPlanPatroRec.Text) = '' then
      begin
         MsgDlg('Não foi selecionado um Plano / Patrocinadora para esta Operação,'+#13+
                'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblPlanPatroRec.CanFocus then
            dblPlanPatroRec.SetFocus;
         Accept := False;
      end
      else
      //AL_36
      if Trim(dblTipoOperRec.Text) = '' then
      begin
         MsgDlg('Não foi selecionado um tipo de operação para esta Operação,'+#13+
                'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblTipoOperRec.CanFocus then
            dblTipoOperRec.SetFocus;
         Accept := False;
      end
      else
      if Trim(dblCarteiraRec.Text) = '' then
      begin
         MsgDlg('Não foi selecionada uma Carteira para esta Operação,'+#13+
                'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblCarteiraRec.CanFocus then
            dblCarteiraRec.SetFocus;
         Accept := False;
      end
      else
      if (Trim(dblCustodianteRec.Text) = '') and (qryCarteiraRecIDCARTEIRAGERENC.IsNull) then
      begin
         MsgDlg('Não foi selecionado um Custodiante para esta Operação,'+#13+
                'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblCustodianteRec.CanFocus then
            dblCustodianteRec.SetFocus;
         Accept := False;
      end
      else
      if dbrVlrRec.Value = 0 then
      begin
         MsgDlg('Não foi informado uma Valor para esta Operação,'+#13+
                'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dbrVlrRec.CanFocus then
            dbrVlrRec.SetFocus;
         Accept := False;
      end
      else
      if dbrVlrLiqRec.Value = 0 then
      begin
         MsgDlg('Não foi calculado um Valor Líquido para esta Operação,'+#13+
                'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dbrVlrLiqRec.CanFocus then
            dbrVlrLiqRec.SetFocus;
         Accept := False;
      end
      else
      begin
         // AL_4
         // AL_12 - ini
         if qryRecebimentoIDOPERACAOORIGEM.IsNull then
         begin
            //AL_34
            if not AchaProvisao(qryTipoOperRecIDTIPOOPERACAO.AsInteger,
                                qryRecebimentoIDPLANPREVCTBPATR.AsInteger,
                                qryRecebimentoIDCARTEIRAINVEST.AsInteger,
                                qryRecebimentoIDCARTEIRAGERENC.AsInteger,
                                qryRecebimentoIDCUSTODIANTE.AsInteger,
                                qryRecebimentoIDMOTIVOBLOQUEIO.AsInteger) then
            begin
               MsgDlg('Não foi possível encontrar um Anúncio pra este Recebimento.',
                      'Mensagem do Sistema', MtWarning, [mbOk],0);
               if dbeBoletaProv.CanFocus then
                  dbeBoletaProv.SetFocus;
               Accept := False;
            end;
         end
         else
         begin
            // AL_13 - Inicio
            if not qryProvisao.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOORIGEM.AsInteger, []) then
            begin
               MsgDlg('Não foi possível encontrar um Anúncio pra este Recebimento.',
                      'Mensagem do Sistema', MtWarning, [mbOk],0);
               if dbdDataOperacaoRec.CanFocus then
                  dbdDataOperacaoRec.SetFocus;
               Accept := False;
            end;
            // AL_13 - Fim

         end;
         //AL_12 - fim

         // AL_13 - Inicio
         // Se a operação é válida e achou a provisão, verifica o saldo
         if Accept then
         begin
            // AL_21 - Ini
            if (qryRecebimento.State = dsInsert) and
               (qryProvisaoVLROPERACAO.AsFloat = qryProvisaoQTDEEXERCIDA.AsFloat) then
            begin
               if MsgDlg('Não há saldo neste Anúncio para ser Recebido.' + #13 + 'Continua?',
                         'Mensagem do Sistema', mtConfirmation, [mbYes, mbNo],0) = mrNo then
               begin
                  if dbrVlrCan.CanFocus then
                     dbrVlrCan.SetFocus;
                  Accept := False;
               end;
            end
            else if qryRecebimento.State = dsEdit then
            begin
               if cdsSelBoleta.Locate('IDOPERACAOINVEST', qryRecebimentoIDOPERACAOINVEST.AsInteger, []) then
                  fValorAntigo := cdsSelBoleta.FieldByName('VLROPERACAO').AsFloat
               else
                  fValorAntigo := qryRecebimentoVLROPERACAO.OldValue;

               // AL_27
               if (RoundCM(qryProvisaoVLROPERACAO.AsFloat,2) < (RoundCM(qryProvisaoQTDEEXERCIDA.AsFloat,2) +
                                                               (RoundCM(qryRecebimentoVLROPERACAO.Value,2) - RoundCM(fValorAntigo,2) ))) then
               begin
                  if MsgDlg('O saldo deste Anúncio é menor que o total de Recebimentos.' + #13 + 'Continua?',
                            'Mensagem do Sistema', mtConfirmation, [mbYes, mbNo],0) = mrNo then
                  begin
                     if dbrVlrRec.CanFocus then
                        dbrVlrRec.SetFocus;
                     Accept := False;
                  end;
               end;
            end;
            // AL_21 - Fim
         end;

         // Verifica se existem outros lançamentos para a mesma carteira na mesma data
         if Accept then
         begin
            cdsSelBoleta.First;
            while not cdsSelBoleta.Eof do
            begin
               if cdsSelBoleta.FieldByName('IDOPERACAOINVEST').AsInteger <> qryRecebimentoIDOPERACAOINVEST.AsInteger then
               begin
                  // AL_16
                  //AL_34
                  if ((cdsSelBoleta.FieldByName('IDPLANPREVCTBPATR').AsInteger =
                       qryRecebimentoIDPLANPREVCTBPATR.AsInteger) and
                      (cdsSelBoleta.FieldByName('IDCARTEIRA').AsString =
                       qryRecebimentoIDCARTEIRA.AsString) and
                      (cdsSelBoleta.FieldByName('IDTIPOOPERACAO').AsInteger =
                       qryRecebimentoIDTIPOOPERACAO.AsInteger) and
                      (cdsSelBoleta.FieldByName('IDCARTEIRAGERENC').IsNull) and
                      (qryRecebimentoIDCARTEIRAGERENC.IsNull) and
                      (cdsSelBoleta.FieldByName('DATAOPERACAO').AsDateTime =
                       qryRecebimentoDATAOPERACAO.AsDateTime)) and
                      (((cdsSelBoleta.FieldByName('IDMOTIVOBLOQUEIO').IsNull) and
                        (qryRecebimentoIDMOTIVOBLOQUEIO.IsNull)) or
                       (cdsSelBoleta.FieldByName('IDMOTIVOBLOQUEIO').AsInteger =
                        qryRecebimentoIDMOTIVOBLOQUEIO.AsInteger)) and
                      (((cdsSelBoleta.FieldByName('IDCUSTODIANTE').IsNull) and
                        (qryRecebimentoIDCUSTODIANTE.IsNull)) or
                       (cdsSelBoleta.FieldByName('IDCUSTODIANTE').AsInteger =
                        qryRecebimentoIDCUSTODIANTE.AsInteger)) then
                  begin
                     MsgDlg('Não é Possivel incluir dois recebimentos da mesma carteira,' + #13 +
                            'na mesma conta de investimento na mesma data',
                            'Mensagem do Sistema', MtWarning, [mbOk],0);
                     if dbdDataOperacaoRec.CanFocus then
                        dbdDataOperacaoRec.SetFocus;
                     Accept := False;
                     Break;
                  end;
               end;
               cdsSelBoleta.Next;
            end;
         end;
         // AL_13 - Fim

         // Atualiza o ID da Operação de Provisão Original
         qryRecebimentoIDOPERACAOORIGEM.AsInteger := qryProvisaoIDOPERACAOINVEST.AsInteger;
      end;
      sDataLanc := qryRecebimentoDATAVENCOPER.AsString;
   end
   // AL_12
   else if pgctrlDetalhe.ActivePage = tbsCancelamento then
   begin
      //AL_36
      if Trim(dblPlanPatroCan.Text) = '' then
      begin
         MsgDlg('Não foi selecionado um Plano / Patrocinadora para esta Operação,'+#13+
                'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblPlanPatroCan.CanFocus then
            dblPlanPatroCan.SetFocus;
         Accept := False;
      end
      else
      //AL_36
      if Trim(dblTipoOperCan.Text) = '' then
      begin
         MsgDlg('Não foi selecionado um tipo de operação para este Cancelamento,'+#13+
                'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblTipoOperCan.CanFocus then
            dblTipoOperCan.SetFocus;
         Accept := False;
      end
      else
      if Trim(dblCarteiraCan.Text) = '' then
      begin
         MsgDlg('Não foi selecionada uma Carteira para este Cancelamento,'+#13+
                'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblCarteiraCan.CanFocus then
            dblCarteiraCan.SetFocus;
         Accept := False;
      end
      else
      if (Trim(dblCustodianteCan.Text) = '') and (qryCarteiraCanIDCARTEIRAGERENC.IsNull) then
      begin
         MsgDlg('Não foi selecionado um Custodiante para este Cancelamento,'+#13+
                'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dblCustodianteCan.CanFocus then
            dblCustodianteCan.SetFocus;
         Accept := False;
      end
      else
      if dbrQtdCan.Value = 0 then
      begin
         MsgDlg('Não foi informado uma Quantidade para este Cancelamento,'+#13+
                'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dbrQtdCan.CanFocus then
            dbrQtdCan.SetFocus;
         Accept := False;
      end
      else
      if dbrVlrCan.Value = 0 then
      begin
         MsgDlg('Não foi informado uma Valor para este Cancelamento,'+#13+
                'por favor informe um.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dbrVlrCan.CanFocus then
            dbrVlrCan.SetFocus;
         Accept := False;
      end
      else
      if dbrVlrLiqCan.Value = 0 then
      begin
         MsgDlg('Não foi calculado um Valor Líquido para este Cancelamento,'+#13+
                'por favor informe uma.','Mensagem do Sistema', MtWarning, [mbOk],0);
         if dbrVlrLiqCan.CanFocus then
            dbrVlrLiqCan.SetFocus;
         Accept := False;
      end
      else
      begin
         // AL_13 - Inicio
         // Operação nova, todas já possuem IDOPERACAOORIGEM preenchido
         // Não não possuem ainda quando vem da inclusão manual
         if qryCancelamentoIDOPERACAOORIGEM.IsNull then
         begin
            //AL_34
            if not AchaProvisao(qryTipoOperCanIDTIPOOPERACAO.AsInteger,
                                qryCancelamentoIDPLANPREVCTBPATR.AsInteger,
                                qryCancelamentoIDCARTEIRAINVEST.AsInteger,
                                qryCancelamentoIDCARTEIRAGERENC.AsInteger,
                                qryCancelamentoIDCUSTODIANTE.AsInteger,
                                qryCancelamentoIDMOTIVOBLOQUEIO.AsInteger) then
            begin
               MsgDlg('Não foi possível encontrar um Anúncio pra este Recebimento.',
                      'Mensagem do Sistema', MtWarning, [mbOk],0);
               if dbdDataOperacaoCan.CanFocus then
                  dbdDataOperacaoCan.SetFocus;
               Accept := False;
            end;
         end
         else
         if not qryProvisao.Locate('IDOPERACAOINVEST', qryCancelamentoIDOPERACAOORIGEM.AsInteger, []) then
         begin
            MsgDlg('Não foi possível encontrar um Anúncio pra este Cancelamento.',
                   'Mensagem do Sistema', MtWarning, [mbOk],0);
            if dbdDataOperacaoCan.CanFocus then
               dbdDataOperacaoCan.SetFocus;
            Accept := False;
         end;

         if Accept then
         begin
            if (qryProvisaoVLROPERACAO.AsFloat = qryProvisaoQTDEEXERCIDA.AsFloat) and
               (qryCancelamento.State = dsInsert) then
            begin
               MsgDlg('Não há saldo neste Anúncio para ser Cancelado.',
                      'Mensagem do Sistema', MtWarning, [mbOk],0);
               if dbrVlrCan.CanFocus then
                  dbrVlrCan.SetFocus;
               Accept := False;
            end
            else if (qryCancelamento.State = dsEdit) then
            begin
               if cdsSelBoleta.Locate('IDOPERACAOINVEST', qryCancelamentoIDOPERACAOINVEST.AsInteger, []) then
                  fValorAntigo := cdsSelBoleta.FieldByName('VLROPERACAO').AsFloat
               else
                  fValorAntigo := qryCancelamentoVLROPERACAO.OldValue;

               // AL_27
               if (RoundCM(qryProvisaoVLROPERACAO.AsFloat,2) < (RoundCM(qryProvisaoQTDEEXERCIDA.AsFloat,2) +
                                                               (RoundCM(qryCancelamentoVLROPERACAO.Value,2) - RoundCM(fValorAntigo,2) ))) then
               begin
                  MsgDlg('O saldo deste Anúncio é menor que o total de Recebimentos.',
                         'Mensagem do Sistema', MtWarning, [mbOk],0);
                  if dbrVlrCan.CanFocus then
                     dbrVlrCan.SetFocus;
                  Accept := False;
               end;
            end;
         end;
         // AL_13 - Fim

         // Atualiza o ID da Operação de Provisão Original
         qryCancelamentoIDOPERACAOORIGEM.AsInteger := qryProvisaoIDOPERACAOINVEST.AsInteger;
      end;
      sDataLanc := qryCancelamentoDATAVENCOPER.AsString;
   end;
   // AL_12 - Fim

   // AL_2
   if ((qryTipoOperacaoFLGGERACONTAB.AsInteger > 0) or (qryTipoOperacaoFLGGERACAPCAR.AsInteger > 0)) and
      (sDataLanc <> '')  then
   begin
      // AL_8
      //AL_32
      if not CtrlInvContab.TestaPeriodo(sDataLanc, 2) then
      begin
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', MtWarning, [mbOk],0);
         Accept := False;
      end;
   end;

   bAceitou := Accept;

   inherited;

end;

//AL_9
procedure TfrmCadDividendos.HabilitaCamposDireito(bVisivel : Boolean);
begin
   // AL_13 - Inicio
   If Trim(dblTipoOperacao.Text) <> '' then
   begin
      If (qryTipoOperacao.FieldbyName('FLGISENTOIR').AsString = 'S') And (bVisivel) Then
         dbcIsentoIr.Visible  := True
      Else
         dbcIsentoIr.Visible  := False;

      If (qryTipoOperacao.FieldbyName('FLGGRAVAIRLITIGIO').AsString = 'S') And (bVisivel) Then
         dbcIRLitigio.Visible := True
      Else
         dbcIRLitigio.Visible := False;
   end
   Else
   begin
      dbcIsentoIr.Visible  := True;
      dbcIRLitigio.Visible := True;
   end;
   // AL_13 - Fim
end;
//AL_9 - Fim

procedure TfrmCadDividendos.dbrVlrCanExit(Sender: TObject);
begin
   inherited;
   // AL_13
   if TComponent(Sender).Name = 'dbrVlrCan' then
   begin
      //AL_34
      if AchaProvisao(qryTipoOperCanIDTIPOOPERACAO.AsInteger,
                      qryCancelamentoIDPLANPREVCTBPATR.AsInteger,
                      qryCancelamentoIDCARTEIRAINVEST.AsInteger,
                      qryCancelamentoIDCARTEIRAGERENC.AsInteger,
                      qryCancelamentoIDCUSTODIANTE.AsInteger,
                      qryCancelamentoIDMOTIVOBLOQUEIO.AsInteger) then
      begin
         qryCancelamentoQTDEOPERACAO.AsFloat := qryProvisaoQTDEOPERACAO.AsFloat;
         if (qryCancelamentoQTDEOPERACAO.AsFloat <> 0) and
            ((qryCancelamentoPRECOUNITOPERACAO.AsFloat = 0) or
             (fVlrAntCan <> qryCancelamentoVLROPERACAO.AsFloat)) then
            qryCancelamentoPRECOUNITOPERACAO.AsFloat := OperComum.Round(((qryCancelamentoVLROPERACAO.AsFloat / qryCancelamentoQTDEOPERACAO.AsFloat) * qryInvestimentoAcaoQTDTITLOTE.AsInteger)-0.0000000049,8);
      end;
   end;
   CalculaVlrLiq('C');
end;

procedure TfrmCadDividendos.dbrVlrIRCanExit(Sender: TObject);
begin
   inherited;
   // AL_13
   if qryIRLITIGIO.AsString  = 'S' then
      qryCancelamentoVLRLIQUIDO.AsFloat := (dbrVlrCan.Value + dbrVlrRemCan.Value)
   else
      qryCancelamentoVLRLIQUIDO.AsFloat := (dbrVlrCan.Value + dbrVlrRemCan.Value) - dbrVlrIRCan.Value;
end;

// AL_13
procedure TfrmCadDividendos.dbdDataOperacaoCanExit(Sender: TObject);
begin
  inherited;
  // AL_13
  if qryCancelamento.State in [dsEdit, dsInsert] then
     qryCancelamentoDATAVENCOPER.AsDateTime := CalcVenc(dbdDataOperacaoCan.DateTime, qryTipoOperCanVENCIMENTO.AsInteger);
end;

procedure TfrmCadDividendos.dbrVlrRecEnter(Sender: TObject);
begin
  inherited;
  fVlrAntRec := dbrVlrRec.Value;
end;

procedure TfrmCadDividendos.dbrVlrCanEnter(Sender: TObject);
begin
  inherited;
  fVlrAntCan := dbrVlrCan.Value;
end;

procedure TfrmCadDividendos.dbrVlrProvExit(Sender: TObject);
begin
   inherited;
   // AL_13
   // Ajusta a quantidade pelo valor informado
   if TComponent(Sender).Name = 'dbrVlrProv' then
   begin
      if qryProvisaoQTDEOPERACAO.AsFloat = 0 then
         qryProvisaoQTDEOPERACAO.AsFloat := Int(qryProvisaoVLROPERACAO.AsFloat/qryDIVPORACAO.AsFloat);
      if (qryProvisaoPRECOUNITOPERACAO.AsFloat = 0) and (qryProvisaoQTDEOPERACAO.AsFloat <> 0) then
         qryProvisaoPRECOUNITOPERACAO.AsFloat := OperComum.Round(((qryProvisaoVLROPERACAO.AsFloat / qryProvisaoQTDEOPERACAO.AsFloat) * qryInvestimentoAcaoQTDTITLOTE.AsInteger)-0.0000000049,8);
   end;
   CalculaVlrLiq('P');
end;

// AL_13
procedure TfrmCadDividendos.sbtnInsDetClick(Sender: TObject);
begin
   //AL_23
   if dbcRecTotal.Checked then
   begin
      MsgDlg('Esta AGE está marcada como totalmente recebida. ' + #13 +
             'Não é possível alterá-la', 'Mensagem do Sistema', mtWarning, [mbOK], 0);
      bbtnCancelarDet.Click;
   end
   else
   begin
      if CarregaCDS then
         inherited
      else
         bbtnCancelarDet.Click;
   end;
end;

// AL_13
procedure TfrmCadDividendos.dsDetStateChange(Sender: TObject);
begin
   inherited;
   // Desabilita botões de OK e Cancelar do Pai quando o Filho estiver em edição
   if not bExclusao then
   begin
      bbtnConfirmar.Enabled := not (TwwDataSource(Sender).DataSet.State in [dsInsert, dsEdit]);
      bbtnCancelar.Enabled := not (TwwDataSource(Sender).DataSet.State in [dsInsert, dsEdit]);
   end;

   if TwwDataSource(Sender).Name = 'dsProvisao' then
   begin
      HabDetProv((qryProvisao.State = dsInsert));
      dbrVlrProv.Enabled    := (qryProvisao.State in [dsInsert, dsEdit]);
      dbrPUProv.Enabled     := (qryProvisao.State in [dsInsert, dsEdit]);
      // AL_14
      dbrQtdProv.Enabled    := (qryProvisao.State in [dsInsert, dsEdit]);
      dbrVlrRemProv.Enabled := (qryProvisao.State in [dsInsert, dsEdit]);
      dbrVlrIRProv.Enabled  := (qryProvisao.State in [dsInsert, dsEdit]);
      dbrVlrLiqProv.Enabled := (qryProvisao.State in [dsInsert, dsEdit]);

      //AL_40
      If qry.State = dsinsert then
         CMDateTimePicker1.enabled := (qryProvisao.State in [dsedit]);
               
   end
   else if TwwDataSource(Sender).Name = 'dsRecebimento' then
   begin
      HabDetRec((qryRecebimento.State = dsInsert));
      dbdDataOperacaoRec.Enabled := (qryRecebimento.State in [dsInsert, dsEdit]);
      dbrVlrRec.Enabled    := (qryRecebimento.State in [dsInsert, dsEdit]);
      dbrPURec.Enabled     := (qryRecebimento.State in [dsInsert, dsEdit]);
      dbrVlrRemRec.Enabled := (qryRecebimento.State in [dsInsert, dsEdit]);
      dbrVlrIRRec.Enabled  := (qryRecebimento.State in [dsInsert, dsEdit]);
      dbrVlrLiqRec.Enabled := (qryRecebimento.State in [dsInsert, dsEdit]);
   end
   else if TwwDataSource(Sender).Name = 'dsCancelamento' then
   begin
      HabDetCan((qryCancelamento.State = dsInsert));
      dbdDataOperacaoCan.Enabled := (qryCancelamento.State in [dsInsert, dsEdit]);
      dbrVlrCan.Enabled    := (qryCancelamento.State in [dsInsert, dsEdit]);
      dbrPUCan.Enabled     := (qryCancelamento.State in [dsInsert, dsEdit]);
      dbrVlrRemCan.Enabled := (qryCancelamento.State in [dsInsert, dsEdit]);
      dbrVlrIRCan.Enabled  := (qryCancelamento.State in [dsInsert, dsEdit]);
      dbrVlrLiqCan.Enabled := (qryCancelamento.State in [dsInsert, dsEdit]);
   end;
end;

procedure TfrmCadDividendos.sbtnAltDetClick(Sender: TObject);
begin
   //AL_23
   if dbcRecTotal.Checked then
   begin
      MsgDlg('Esta AGE está marcada como totalmente recebida. ' + #13 +
             'Não é possível alterá-la.', 'Mensagem do Sistema', mtWarning, [mbOK], 0);
      bbtnCancelarDet.Click;
   end
   else
   begin
      if CarregaCDS then
         inherited
      else
         bbtnCancelarDet.Click;
   end;
end;

//AL_34
function TfrmCadDividendos.CarregaCDS(tabOrig: TTabSheet = nil): Boolean;
var iRec, iCount, iOper: Integer;
begin
   if pgctrlDetalhe.ActivePage <> tbsDet then
   begin
      Result := False;
      iCount := 0;
      qryProvisao.DisableControls;
      qryRecebimento.DisableControls;
      qryCancelamento.DisableControls;
      repeat
         if (tabOrig = tbsProvisao) or (pgctrlDetalhe.ActivePage = tbsProvisao) then
         begin
            dspSelBoleta.DataSet := qryProvisao;
            iRec := qryProvisao.RecordCount;
            if iCount = 0 then
               iOper := qryProvisaoIDOPERACAOINVEST.AsInteger;
         end
         else if (tabOrig = tbsRecebimento) or (pgctrlDetalhe.ActivePage = tbsRecebimento) then
         begin
            dspSelBoleta.DataSet := qryRecebimento;
            iRec := qryRecebimento.RecordCount;
            if iCount = 0 then
               iOper := qryRecebimentoIDOPERACAOINVEST.AsInteger;
         end
         else if (tabOrig = tbsCancelamento) or (pgctrlDetalhe.ActivePage = tbsCancelamento) then
         begin
            dspSelBoleta.DataSet := qryCancelamento;
            iRec := qryCancelamento.RecordCount;
            if iCount = 0 then
               iOper := qryCancelamentoIDOPERACAOINVEST.AsInteger;
         end;

         Inc(iCount);

         if pgctrlDetalhe.ActivePage <> tbsDet then
            cdsSelBoleta.Data := dspSelBoleta.Data;

      until (cdsSelBoleta.RecordCount = iRec) or (iCount > 3);

      if (tabOrig = tbsProvisao) or (pgctrlDetalhe.ActivePage = tbsProvisao) then
         qryProvisao.Locate('IDOPERACAOINVEST', iOper, [])
      else if (tabOrig = tbsRecebimento) or (pgctrlDetalhe.ActivePage = tbsRecebimento) then
         qryRecebimento.Locate('IDOPERACAOINVEST', iOper, [])
      else if (tabOrig = tbsCancelamento) or (pgctrlDetalhe.ActivePage = tbsCancelamento) then
         qryCancelamento.Locate('IDOPERACAOINVEST', iOper, []);

      if cdsSelBoleta.RecordCount = iRec then
         Result := True;

      //AL_39 - Se não retirar o indice, o cds continua usando o indice antigo, mesmo tendo carregado outra tabela
      cdsSelBoleta.IndexFieldNames := '';
      cdsSelBoleta.First;

      qryProvisao.EnableControls;
      qryRecebimento.EnableControls;
      qryCancelamento.EnableControls;
   end
   else Result := True;

   inherited;
end;

procedure TfrmCadDividendos.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlRV := TCtrlRendaVariavel.Create;
   CtrlRV.InitializeAs(Padroes)
end;

procedure TfrmCadDividendos.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FreeAndNil(CtrlRV);
  inherited;
end;

procedure TfrmCadDividendos.dblCarteiraRecEnter(Sender: TObject);
begin
  inherited;
  //AL_40
  if (Trim(dbdDataOperacaoCan.Text) <> '') and
     (qryCarteiraCan.ParamByName('DATALIMGER').AsString <> dbdDataOperacaoCan.Text) then
  begin
     // Esta query deve ser reaberta aqui pois os Cancelamentos podem acontecer em mais de uma data
      OperComum.LimpaParametros(qryCarteiraCan);
      qryCarteiraCan.ParamByName('DATALIMGER').AsString  := dbdDataOperacaoCan.Text;
      qryCarteiraCan.Open;
  end;
end;

procedure TfrmCadDividendos.dblCarteiraCanEnter(Sender: TObject);
begin
  inherited;
  //AL_40
  if (Trim(dbdDataOperacaoRec.Text) <> '') and
     (qryCarteiraRec.ParamByName('DATALIMGER').AsString <> dbdDataOperacaoRec.Text) then
  begin
     // Esta query deve ser reaberta aqui pois os recebimentos podem acontecer em mais de uma data
      OperComum.LimpaParametros(qryCarteiraCan);
      qryCarteiraCan.ParamByName('DATALIMGER').AsString  := dbdDataOperacaoRec.Text;
      qryCarteiraCan.Open;
  end;
end;

//Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
procedure TfrmCadDividendos.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
   if pgctrlDetalhe.ActivePage = tbsCancelamentoVenda then
   begin
      bbtnGeraRecebimento.Enabled := False;
      bbtnGeraRecebimento.Hint := '';
      sbtnExcluiDet.Enabled := False;
      sbtnAltDet.Enabled := False;
      sbtnInsDet.Enabled := False;
   end;
end;

end.
