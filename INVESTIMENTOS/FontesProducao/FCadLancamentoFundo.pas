//******************************************************************************
//Rotina..........:
//N. Sol..........: 174651
//N. Kintana......: 1607521
//Data............: 20/03/2012
//Responsável.....: Otacilio Aquino
//Descrição.......: Alteração do DATAMODULO "FDmRelFundosSaldo" p/ "FDMRelLancFundo"
//******************************************************************************
//Rotina..........:
//N. Sol..........: 98664
//N. Kintana......: 430393
//Data............: 14/10/2008
//Responsável.....: Andre Santos
//Descrição.......: Alteração no foco da aplicação para acertar a aba de operações.
//
//******************************************************************************
//Rotina..........: RGAtualizaSaldoClick
//N. Sol..........: 95319
//N. Kintana......: 409226
//Data............: 09/09/2008
//Responsável.....: Marilza Colpani
//Descrição.......: Possibilita selecionar a forma de atualização do saldo. 
//                  O botao Atualizar executa a query QryDisponibilidadeCaixa uma vez.
//                  Esta opção é acionada sempre que o botao Atualizar for selecionado.
//                  Para Periódica, existem três opções de tempo (5 min, 10 min e 15 min). 
//                  Quando selecionado um destes, uma mensagem de confirmação é exibida
//                  na tela, se a resposta for "Yes", a query QryDisponibilidadeCaixa é executada no 
//                  intervalo selecionado. A opção mostrada no combo, é sempre a ultima
//                  opção que o usuário escolheu. Para interromper a atualização da opção Periódica,
//                  basta selecionar a opção Manual. O resultado da consulta é mostrado
//                  em Disponibilidade de Caixa. Com esta alteração o popup que permitia selecionar: 
//                   OnLine, OffLine e os Tempos (Lento, Normal e Rápido) foi retirado.
//                  O panel da Disponibilidade de Caixa é limpo a cada nova consulta.
//******************************************************************************
//Rotina..........: bbtnCalculaClick
//N. Sol..........: 95319
//N. Kintana......: 409226
//Data............: 09/09/2008
//Responsável.....: Marilza Colpani
//Descrição.......: Executa a consulta para a opção Manual e interrompe a consulta 
//                   Periódica, quando selecionado.
// *****************************************************************************
//Rotina..........: cboOpcaoClick
//N. Sol..........: 95319
//N. Kintana......: 409226
//Data............: 09/09/2008
//Responsável.....: Marilza Colpani
//Descrição.......: Disponibiliza as opções no combobox.
//******************************************************************************
// Data      : 10/01/2008
// Código    : AL_49
// Pendencia : 26743
// SOL       :
// Desc      : Verificar se existem transferências entre Planos posteriores ao resgate
//******************************************************************************
// Data      : 06/12/2007
// Código    : AL_48
// Pendencia :
// SOL       :                                 
// Desc      : Implementação do "TRUNC" nas querys´s que fazem join com a tabela de
//             cadastro de fundo(HISTFUNDOINVEST). Essa inclusão trata a busca
//             independente da hora.
//******************************************************************************
// Data      : 19/10/2007
// Código    : AL_47
// Pendencia : 26547
// SOL       :
// Desc      : Não iniciar a disponibilidade apenas se for a CBS
//******************************************************************************
// Data      : 23/08/2007
// Código    : AL_46
// Pendencia :
// SOL       :
// Desc      : Implementação na consulta da aplicação(QryAplicacao) para tratar
//             tipo de operação de desbloqueio.
//******************************************************************************
// Data      : 09/08/2007
// Código    : AL_45
// Pendencia : 25761
// SOL       : 63520 / 63519
// Desc      : Implementação da retirada do IOF pago para a operação de Resgate em Fundos de
//             Renda Fixa.
//             Implementação para lançar "n" operações de resgate em Fundo de Renda Fixa.
//******************************************************************************
// Data      : 01/08/2007
// Código    : AL_44
// Pendencia : 25761
// SOL       : 63520 / 63519
// Desc      : Implementação para apurar o iof do resgate e contabilizar.
//******************************************************************************
// Data      : 01/08/2007
// Código    : AL_43
// Pendencia : 25291
// SOL       : 59686
// Motivo    : Performance da Query Saldo Fundos
//******************************************************************************
// Data      : 05/06/2007
// Código    : AL_42
// Pendencia : 25594
// SOL       : 56257
// Motivo    : Implementação da taxa de ingresso e da taxa de saída conforme especificação
//******************************************************************************
// Data      : 15/05/2007
// Código    : AL_41
// Pendencia :
// SOL       :
// Motivo    : Implementação para buscar a cota de aplicação quando alterar a
//             data de cotização
//******************************************************************************
// Data      : 18/04/2007
// Código    : AL_40
// Pendencia :
// SOL       :
// Motivo    : Implementação para aplicação a cotizar
//******************************************************************************
// Data      : 10/04/2007
// Código    : AL_39
// Pendencia :
// SOL       :
// Motivo    : Implementação da rotina de "ResgateFACFIF" para calcular o valor
//             de custo e variação a ser contabilizado no resgate a cotizar
//******************************************************************************
// Data      : 01/02/2007
// Código    : AL_38
// Pendencia : 24349
// SOL       : 52712
// Desc      : Ajuste no tratamento de erro da rotina AlimentaFundo
//             Criado um parametro novo dom variável para retorno da
//               mensagem de erro
//******************************************************************************
// Data      : 12/12/2006
// Código    : AL_37
// Pendencia :
// SOL       :
// Motivo    : Alteração na ordem de execução de rotinas de verificação da operação
//             de Resgate(botão Ok)
//******************************************************************************
// Data      : 11/12/2006
// Código    : AL_36
// Pendencia : 23968
// SOL       : 50239
// Motivo    : Implementação do tratamento para a conta CCI.
//******************************************************************************
// Data      : 27/09/2006
// Código    : AL_35
// Pendencia :
// SOL       :
// Motivo    : Implementação da verificação de registros para a impressão
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_34
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data      : 20/06/2006
// Código    : AL_33
// Pendencia : 22601
// SOL       : 44102
// Motivo    : Implementação da busca da cotação quando alterada a data de cotização
//******************************************************************************
// Data      : 20/06/2006
// Código    : AL_32
// Pendencia : 22601
// SOL       : 44102
// Motivo    : Implementação da verificação da cota do dia conforme a data de cotização
//******************************************************************************
// Data      : 20/06/2006
// Código    : AL_31
// Pendencia : 22601
// SOL       : 44102
// Motivo    : Implementação para testar as variaveis de integralização, individualmente.
//******************************************************************************
// Data      : 20/06/2006
// Código    : AL_30
// Pendencia : 22601
// SOL       : 44102
// Motivo    : Implementação para efetuar os resgates com a data de cotização
//             menor que a data de operação
//******************************************************************************
// Data      : 01/06/2005
// Código    : AL_29
// Pendencia :
// SOL       :
// Motivo    : Implementação da verificação de processo de atualização em andamento
//******************************************************************************
// Data      : 23/05/2006
// Código    : AL_28
// Pendencia :
// SOL       :
// Motivo    : Implementação na quantidade de casas decimais conforme o cadastro do
//             Fundo(Consulta individual e resgate)
//******************************************************************************
// Data      : 23/05/2006
// Código    : AL_27
// Pendencia :
// SOL       :
// Motivo    : Implementação do totalizador do Saldo na propria Grid.
//******************************************************************************
// Data      : 23/05/2006
// Código    : AL_26
// Pendencia :
// SOL       :
// Motivo    : Otimização do funcionamento da tela e acionamento das querys
//******************************************************************************
// Data      : 26/01/2006
// Código    : AL_25
// Pendencia : 22437
// SOL       :
// Motivo    : Alteração do layout para o a pasta de Resgate, unificação do
//             Resgate CC e CCI
//******************************************************************************
// Data     : 24/10/2005
// Linha(s) : AL_24
// Linha(s) : Implementação da Quantidade de cotas Bloqueadas(SALDOS)
//******************************************************************************
// Data     : 13/07/2005
// Linha(s) : AL_23
// Linha(s) : Ajuste no layout do relatorio.
//******************************************************************************
// Data     : 11/07/2005
// Linha(s) : AL_22
// Linha(s) : Retirada  a coluna de variação do Saldo.
//******************************************************************************
// Data     : 01/07/2005
// Linha(s) : AL_21
// Linha(s) : Retiradao do tratamento de abertura e fechamento da QrySaldoTot e
//            QrySaldoDet e acerto nos IF de linhas
//******************************************************************************
// Data     : 15/06/2005
// Linha(s) : Al_20
// Motivo   : Implementado o parametro IDPEDIDOFUNDO na query "qryConfirmação"
//******************************************************************************
// Data     : 15/06/2005
// Linha(s) : Al_19
// Motivo   : Passa a ser obrigatório a identifica;áo de uma aplicação no momento do resgate novo,
//            devido a problemas no reprocessamento
//******************************************************************************
// Data     : 25/05/2005
// Linha(s) : Al_18
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 01/06/2005
// Código   : Al_17
// Motivo   : Implementação do teste de transação e do botão de cancelar
//******************************************************************************
// Data     : 01/06/2005
// Código   : Al_16
// Motivo   : Alteração da mensagem de erro para uma similar
//******************************************************************************
// Data     : 31/05/2005
// Linha(s) : Al_15
// Motivo   : Implementação da dDataIniProc para trazer a correta no momento do reprocessamento
//******************************************************************************
// Data     : 18/05/2005
// Linha(s) : Al_14
// Motivo   : Implementação para o cancelamento de uma operação
//******************************************************************************
// Data     : 29/04/2005
// Linha(s) : Al_13
// Motivo   : Alterado a descrição do histórico, para passar apenas o nome do fundo e o plano
//******************************************************************************
// Data     : 30/03/2005
// Linha(s) : AL_12
// Linha(s) : Implementação do saldo de abertura e fechamento
//******************************************************************************
// Data     : 23/02/2005
// Linha(s) : AL_11
// Motivo   : Alterada a Rotina de gravação de 2 aplicações no mesmo dia p/ gravar cota no histórico
//******************************************************************************
// Data     : 16/02/2005
// Linha(s) : AL_10
// Motivo   : Inclusão de rotina para excluir/gerar registro ATU, quando for exluir uma aplicação
//            que houver mais de uma para o mesmo dia. (QryPesqHistFundoDel,QyDelHistFundoATU,QryDelHistFundo)
//******************************************************************************
// Data     : 12/01/2005
// Linha(s) : QryResgate, QryAplicacao, QrySaldoFundoNovo, QrySaldoFundo,
//            QryFundoInvestOperacao, QryFundoInvestAplic, QryFundoInvestResg
// Motivo   : Ajuste na busca da DTAVIGENCIA da tabela FUNDOINVEST, não trazia o mais recente
//            registro
//******************************************************************************
// Data     : 03/01/2005
// Linha(s) : Alt_9
// Motivo   : Retirada a condição de data da aplicação, so é possível escolher uma
//            aplicação para resgatar
//******************************************************************************
// Data     : 21/12/2004
// Linha(s) : Alt_8
// Motivo   : Ajuste da data inicial no reprocessamento da aplicação
//******************************************************************************
// Data     : 10/10/2004
// Linha(s) : Alt_7
// Motivo   : Alteração na query QryVerAtualizacao para excluir Reg. tipo PIR
//******************************************************************************
// Data     : 28/10/2004
// Linha(s) : Alt_6
// Motivo   : Retirada da crítica de Dia Útil para o campo DtEdDataReferenciaGeral
//            Acerto na passagem de Parametros da função Reprocessamento
//******************************************************************************
// Data     : 27/10/2004
// Linha(s) : Alt_5
// Motivo   : Ajuste para buscar a ultima data de fechamento
//******************************************************************************
// Data     : 21/10/2004
// Linha(s) : Alt_4
// Motivo   : Otimização das rotinas de exclusão e acerto de parametrização para as
//            querys e para o reprocessamento.
//******************************************************************************
// Data     : 06/10/2004
// Linha(s) : Alt_3
// Motivo   : Inclusão do campo DTAINIPROC na QryFundoInvestAplic, QryAplicacao
//            QryFundoInvestResg, QryResgate e na funcao Reprocessamento
//******************************************************************************
// Data     : 20/09/2004
// Linha(s) : Alt_2
// Motivo   : Inclusão da nova concepção para apuração de CPMF sobre as operações de
//            resgate
//******************************************************************************
// Data     : 15/09/2004
// Código   : Alt_1
// Motivo   : Tratamento para cliente VALIA
//******************************************************************************

unit FCadLancamentoFundo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, wwdblook, StdCtrls, Mask, wwdbedit, MontaSelect, DBTables,
  Db, Wwdatsrc, Wwquery, TB97, MAHlpBtn, Buttons, ExtCtrls, TB97Ctls,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, ComCtrls, DBCtrls, uOperacaoInvest,
  Grids, DBGrids, Wwdbigrd, Wwdbgrid, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList, Menus, ppDB, ppDBPipe,
  ppDBBDE, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, FPreview, fcLabel, wwriched,
  dDisponibilidade, uCtrlInvContab, faMensagem;

type

  TfrmCadLancamentoFundo = class(TfrmCadastroCS)
    Label6: TLabel;
    QryAplicacao: TwwQuery;
    DsAplicacao: TwwDataSource;
    UpdAplicacao: TUpdateSQL;
    QryFundoInvestOperacao: TwwQuery;
    QryAplicacaoIDOPERACAOFUNDO: TFloatField;
    QryAplicacaoIDCARTEIRAINVEST: TFloatField;
    QryAplicacaoIDPEDIDOFUNDO: TFloatField;
    QryAplicacaoIDTIPOINVEST: TFloatField;
    QryAplicacaoIDTIPOOPERACAO: TFloatField;
    QryAplicacaoIDFUNDOINVEST: TFloatField;
    QryAplicacaoDATAOPERACAO: TDateTimeField;
    QryAplicacaoDATALIQUIDACAO: TDateTimeField;
    QryAplicacaoQTDOPERACAO: TFloatField;
    QryAplicacaoVLROPERACAO: TFloatField;
    QryAplicacaoVLRCOTA: TFloatField;
    QryAplicacaoVLRIR: TFloatField;
    QryAplicacaoVLRIOF: TFloatField;
    QryAplicacaoVLRRENDIMENTO: TFloatField;
    QryAplicacaoSTACONFIRMA: TStringField;
    QryAplicacaoDESCFUNDOINVEST: TStringField;
    QryAplicacaoIDGESTORCARTEIRA: TFloatField;
    QryAplicacaoTRGDTINCLUSAO: TDateTimeField;
    QryAplicacaoTRGUSERINCLUSAO: TStringField;
    QryAplicacaoMOECODIGO: TFloatField;
    QryAplicacaoIDTIPOFUNDOINVEST: TFloatField;
    QryAplicacaoCNPJFUNDO: TStringField;
    QryAplicacaoSTAEXCLUSIVO: TStringField;
    QryAplicacaoPZOCARENCIA: TFloatField;
    QryAplicacaoPZOANIVERSARIO: TFloatField;
    QryAplicacaoPZOLIQAPLIC: TFloatField;
    QryAplicacaoPZOLIQRESG: TFloatField;
    QryAplicacaoQTDDECQTD: TFloatField;
    QryAplicacaoQTDDECVALOR: TFloatField;
    QryAplicacaoSTAFUNDO: TStringField;
    QryAplicacaoPZOAMORTIZACAO: TFloatField;
    QryAplicacaoPERCTXPERFORM: TFloatField;
    QryAplicacaoPERCTXADM: TFloatField;
    QryAplicacaoCODFUNCETIP: TStringField;
    QryAplicacaoSTAPROVISIONAIR: TStringField;
    QryAplicacaoSTAPROVISIONAIOF: TStringField;
    QryAplicacaoCONTRCETIP: TStringField;
    QryTipoOperacao: TwwQuery;
    //AL_25
    QrySaldoFundo: TwwQuery;
    DsSaldoFundo: TwwDataSource;
    QryAplicacaoDESCTIPOOPERACAO: TStringField;
    QryAplicacaoNATUREZAOPERACAO: TStringField;
    QryFundoInvestAplic: TwwQuery;
    QrySaldoFundoIDHISTFUNDO: TFloatField;
    QrySaldoFundoCODDOCUMENTO: TFloatField;
    QrySaldoFundoPLNCODIGO: TFloatField;
    QrySaldoFundoPLANO: TFloatField;
    QrySaldoFundoIDTIPOINVEST: TFloatField;
    QrySaldoFundoIDTIPOOPERACAO: TFloatField;
    QrySaldoFundoIDCARTEIRAINVEST: TFloatField;
    QrySaldoFundoIDFUNDOINVEST: TFloatField;
    QrySaldoFundoDATAAPLICACAO: TDateTimeField;
    QrySaldoFundoDATAMOVFUNDO: TDateTimeField;
    QrySaldoFundoHISTMOVFUNDO: TStringField;
    QrySaldoFundoNATURMOVFUNDO: TStringField;
    QrySaldoFundoTIPMOVFUNDO: TStringField;
    QrySaldoFundoVLRAPLICADO: TFloatField;
    QrySaldoFundoVLRIRPROV: TFloatField;
    QrySaldoFundoVLRIOFPROV: TFloatField;
    QrySaldoFundoVLRVARIACAO: TFloatField;
    QrySaldoFundoCOTASMOVFUNDO: TFloatField;
    QrySaldoFundoVLRMOVFUNDO: TFloatField;
    QrySaldoFundoFLGCALCSALDO: TStringField;
    QrySaldoFundoSALDOQTDCOTAS: TFloatField;
    QrySaldoFundoSALDOVLRFUNDO: TFloatField;
    QrySaldoFundoDESCFUNDOINVEST: TStringField;
    QrySaldoFundoVLRCOTAAPLICACAO: TFloatField;
    QrySaldoFundoSALDOLIQUIDO: TFloatField;
    QryAplicacaoQTDMOSTRA: TStringField;
    QrySaldoFundoTotal: TwwQuery;
    dsSaldoFundoTotal: TwwDataSource;
    QryFundoInvestOperacaoIDFUNDOINVEST: TFloatField;
    QryFundoInvestOperacaoDESCFUNDOINVEST: TStringField;
    QryFundoInvestOperacaoIDGESTORCARTEIRA: TFloatField;
    QryFundoInvestOperacaoTRGDTINCLUSAO: TDateTimeField;
    QryFundoInvestOperacaoTRGUSERINCLUSAO: TStringField;
    QryFundoInvestOperacaoMOECODIGO: TFloatField;
    QryFundoInvestOperacaoIDCARTEIRAINVEST: TFloatField;
    QryFundoInvestOperacaoIDTIPOFUNDOINVEST: TFloatField;
    QryFundoInvestOperacaoCNPJFUNDO: TStringField;
    QryFundoInvestOperacaoSTAEXCLUSIVO: TStringField;
    QryFundoInvestOperacaoPZOCARENCIA: TFloatField;
    QryFundoInvestOperacaoPZOANIVERSARIO: TFloatField;
    QryFundoInvestOperacaoPZOLIQAPLIC: TFloatField;
    QryFundoInvestOperacaoPZOLIQRESG: TFloatField;
    QryFundoInvestOperacaoQTDDECQTD: TFloatField;
    QryFundoInvestOperacaoQTDDECVALOR: TFloatField;
    QryFundoInvestOperacaoSTAFUNDO: TStringField;
    QryFundoInvestOperacaoPZOAMORTIZACAO: TFloatField;
    QryFundoInvestOperacaoPERCTXPERFORM: TFloatField;
    QryFundoInvestOperacaoPERCTXADM: TFloatField;
    QryFundoInvestOperacaoCODFUNCETIP: TStringField;
    QryFundoInvestOperacaoSTAPROVISIONAIR: TStringField;
    QryFundoInvestOperacaoSTAPROVISIONAIOF: TStringField;
    QryFundoInvestOperacaoCONTRCETIP: TStringField;
    QryAplicacaoSTATUS: TStringField;
    DsResgate: TwwDataSource;
    UpdResgate: TUpdateSQL;
    QryFundoInvestResg: TwwQuery;
    sbtnMovimento: TToolbarButton97;
    QryAux: TwwQuery;
    QryVerificaOperacao: TwwQuery;
    QryVerDelResgate: TwwQuery;
    QryFundoInvestResgIDFUNDOINVEST: TFloatField;
    QryFundoInvestResgDESCFUNDOINVEST: TStringField;
    QryFundoInvestResgIDGESTORCARTEIRA: TFloatField;
    QryFundoInvestResgTRGDTINCLUSAO: TDateTimeField;
    QryFundoInvestResgTRGUSERINCLUSAO: TStringField;
    QryFundoInvestResgMOECODIGO: TFloatField;
    QryFundoInvestResgIDCARTEIRAINVEST: TFloatField;
    QryFundoInvestResgIDTIPOFUNDOINVEST: TFloatField;
    QryFundoInvestResgCNPJFUNDO: TStringField;
    QryFundoInvestResgSTAEXCLUSIVO: TStringField;
    QryFundoInvestResgPZOCARENCIA: TFloatField;
    QryFundoInvestResgPZOANIVERSARIO: TFloatField;
    QryFundoInvestResgPZOLIQAPLIC: TFloatField;
    QryFundoInvestResgPZOLIQRESG: TFloatField;
    QryFundoInvestResgQTDDECQTD: TFloatField;
    QryFundoInvestResgQTDDECVALOR: TFloatField;
    QryFundoInvestResgSTAFUNDO: TStringField;
    QryFundoInvestResgPZOAMORTIZACAO: TFloatField;
    QryFundoInvestResgPERCTXPERFORM: TFloatField;
    QryFundoInvestResgPERCTXADM: TFloatField;
    QryFundoInvestResgCODFUNCETIP: TStringField;
    QryFundoInvestResgSTAPROVISIONAIR: TStringField;
    QryFundoInvestResgSTAPROVISIONAIOF: TStringField;
    QryFundoInvestResgCONTRCETIP: TStringField;
    pnlDadosBase: TPanel;
    Label2: TLabel;
    DtEdDataReferenciaGeral: TCMDateTimePicker;
    Panel1: TPanel;
    PgcSaldos: TPageControl;
    TbsAplicacao: TTabSheet;
    pgcAplicacaoGeral: TPageControl;
    TbSheet: TTabSheet;
    Dock977: TDock97;
    Toolbar974: TToolbar97;
    BtIncAplic: TSpeedButton;
    BtAltAplic: TSpeedButton;
    BtExcAplic: TSpeedButton;
    //AL_25
    Dock978: TDock97;
    Toolbar975: TToolbar97;
    BtOkAplic: TBitBtn;
    BtCancAplic: TBitBtn;
    BtVoltaAplic: TBitBtn;
    TbsResgate: TTabSheet;
    pgcResgateGeral: TPageControl;
    TabSheet1: TTabSheet;
    DbGrdrResgate: TwwDBGrid;
    pnlResgate: TPanel;
    Dock974: TDock97;
    Toolbar973: TToolbar97;
    BtOkResg: TBitBtn;
    BtCancResg: TBitBtn;
    BtVoltaResg: TBitBtn;
    //AL_25
    Dock973: TDock97;
    Toolbar972: TToolbar97;
    BtIncResg: TSpeedButton;
    BtAltResg: TSpeedButton;
    BtExcResg: TSpeedButton;
    TbsSaldo: TTabSheet;
    //AL_25
    Panel5: TPanel;
    Label3: TLabel;
    Label14: TLabel;
    BtProduraSaldo: TSpeedButton;
    DbLkcSaldo: TwwDBLookupCombo;
    DbDtRefSaldo: TCMDateTimePicker;
    Panel10: TPanel;
    PnlAplicacao: TPanel;
    DbGrdAplicacao: TwwDBGrid;
    QrySaldoFundoVLRCOTAATUAL: TFloatField;
    DblTipoFundo: TwwDBLookupCombo;
    Label7: TLabel;
    QryTipoFundo: TwwQuery;
    Label33: TLabel;
    dblGestorCarteira: TwwDBLookupCombo;
    qryGestorCart: TwwQuery;
    qryGestorCartNOME: TStringField;
    qryGestorCartIDGESTORCARTEIRA: TFloatField;
    qryGestorCartIDPESSOA: TFloatField;
    QryFundoInvestAplicIDFUNDOINVEST: TFloatField;
    QryFundoInvestAplicDESCFUNDOINVEST: TStringField;
    QryFundoInvestAplicIDGESTORCARTEIRA: TFloatField;
    QryFundoInvestAplicTRGDTINCLUSAO: TDateTimeField;
    QryFundoInvestAplicTRGUSERINCLUSAO: TStringField;
    QryFundoInvestAplicMOECODIGO: TFloatField;
    QryFundoInvestAplicIDTIPOFUNDOINVEST: TFloatField;
    QryFundoInvestAplicCNPJFUNDO: TStringField;
    QryFundoInvestAplicSTAEXCLUSIVO: TStringField;
    QryFundoInvestAplicPZOCARENCIA: TFloatField;
    QryFundoInvestAplicPZOANIVERSARIO: TFloatField;
    QryFundoInvestAplicPZOLIQAPLIC: TFloatField;
    QryFundoInvestAplicPZOLIQRESG: TFloatField;
    QryFundoInvestAplicQTDDECQTD: TFloatField;
    QryFundoInvestAplicQTDDECVALOR: TFloatField;
    QryFundoInvestAplicSTAFUNDO: TStringField;
    QryFundoInvestAplicPZOAMORTIZACAO: TFloatField;
    QryFundoInvestAplicPERCTXPERFORM: TFloatField;
    QryFundoInvestAplicPERCTXADM: TFloatField;
    QryFundoInvestAplicCODFUNCETIP: TStringField;
    QryFundoInvestAplicSTAPROVISIONAIR: TStringField;
    QryFundoInvestAplicSTAPROVISIONAIOF: TStringField;
    QryFundoInvestAplicCONTRCETIP: TStringField;
    QryAplicacaoIDPLANOPREV: TFloatField;
    QryAplicacaoIDPATROCINADORA: TFloatField;
    pnlAguardar: TPanel;
    //AL_25
    QryVerSaldosFundos: TwwQuery;
    sbtnGraficos: TToolbarButton97;
    PopMnuGrafico: TPopupMenu;
    MnuPatrimonio: TMenuItem;
    MnuRentCotas: TMenuItem;
    QryVerAtualizacao: TwwQuery;
    QryAplicacaoIDPLANPREVCTBPATR: TFloatField;
    QryTipoFundoInvest: TwwQuery;
    sbtnSaldos: TToolbarButton97;
    QryFundoInvestAplicDATAINICIOFUNDO: TDateTimeField;
    QryFundoInvestResgDATAINICIOFUNDO: TDateTimeField;
    pmnuConsSaldoFundos: TPopupMenu;
    FixarColuna1: TMenuItem;
    LiberarColuna1: TMenuItem;
    N1: TMenuItem;
    LiberaTodasasColunas1: TMenuItem;
    mnuImprimeGrid: TMenuItem;
    QryFundoInvestAplicPZOCOTAPLIC: TFloatField;
    QryAplicacaoDATACOTIZACAO: TDateTimeField;
    QryAplicacaoPZOCOTAPLIC: TFloatField;
    QryFundoInvestResgPZOCOTRESG: TFloatField;
    //AL_25
    QryFundoInvestAplicIDCARTEIRAINVEST: TFloatField;
    QryResgate: TwwQuery;
    QryResgateDESCFUNDOINVEST: TStringField;
    QryResgateCODFUNCETIP: TStringField;
    QryResgateIDPEDIDOFUNDO: TFloatField;
    QryResgateDATAPEDIDO: TDateTimeField;
    QryResgateDATALIQUIDACAO: TDateTimeField;
    QryResgateVLRPEDIDO: TFloatField;
    QryResgateSTACONFIRMA: TStringField;
    QryResgateSTATUS: TStringField;
    QryResgateIDTIPOINVEST: TFloatField;
    QryResgateIDTIPOOPERACAO: TFloatField;
    QryResgateIDFUNDOINVEST: TFloatField;
    QryResgateIDGESTORCARTEIRA: TFloatField;
    QryResgateTRGDTINCLUSAO: TDateTimeField;
    QryResgateTRGUSERINCLUSAO: TStringField;
    QryResgateMOECODIGO: TFloatField;
    QryResgateIDCARTEIRAINVEST: TFloatField;
    QryResgateIDTIPOFUNDOINVEST: TFloatField;
    QryResgateCNPJFUNDO: TStringField;
    QryResgateSTAEXCLUSIVO: TStringField;
    QryResgatePZOCARENCIA: TFloatField;
    QryResgatePZOANIVERSARIO: TFloatField;
    QryResgatePZOLIQAPLIC: TFloatField;
    QryResgatePZOLIQRESG: TFloatField;
    QryResgateQTDDECQTD: TFloatField;
    QryResgateQTDDECVALOR: TFloatField;
    QryResgateSTAFUNDO: TStringField;
    QryResgatePZOAMORTIZACAO: TFloatField;
    QryResgatePERCTXPERFORM: TFloatField;
    QryResgatePERCTXADM: TFloatField;
    QryResgateSTAPROVISIONAIR: TStringField;
    QryResgateSTAPROVISIONAIOF: TStringField;
    QryResgateCONTRCETIP: TStringField;
    QryResgateDESCTIPOOPERACAO: TStringField;
    QryResgateNATUREZAOPERACAO: TStringField;
    QryResgateIDPLANOPREV: TFloatField;
    QryResgateIDPATROCINADORA: TFloatField;
    QryResgateIDPLANPREVCTBPATR: TFloatField;
    QryResgateDATACOTIZACAO: TDateTimeField;
    QryFundoInvestAplicIDTIPOINVEST: TFloatField;
    QryFundoInvestResgIDTIPOINVEST: TFloatField;
    QryUpdPedido: TwwQuery;
    QryUltDataFech: TwwQuery;
    QryVerSaldoFech: TwwQuery;
    QryDelEspecificoApl: TwwQuery;
    QryDelEspecificoRes: TwwQuery;
    PopMnuSaldo: TPopupMenu;
    pnlSaldos: TPanel;
    pnlSaldosDetalhes: TPanel;
    QryUpdOperacaoApl: TwwQuery;
    sbtnEspecificoFdo: TToolbarButton97;
    QryBuscaUsuario: TwwQuery;
    QryResgateUSUARIO: TStringField;
    QryAplicacaoUSUARIO: TStringField;
    pgcAplicacao: TPageControl;
    tbsDadosApl: TTabSheet;
    Label25: TLabel;
    Label17: TLabel;
    Label26: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label15: TLabel;
    Label27: TLabel;
    DbDtDataAplicacao: TCMDateTimePicker;
    DbLkcFundoInvest: TwwDBLookupCombo;
    DbDtDataLiquidacao: TCMDateTimePicker;
    DbEdValorAplic: TDBRealEdit;
    DbEdCota: TDBRealEdit;
    DbEdQtdOper: TDBRealEdit;
    DbDtDataCotizacaoAplic: TCMDateTimePicker;
    DBeCETIPApl: TDBEdit;
    tbsObsApl: TTabSheet;
    pgcResgate: TPageControl;
    tbsDadosResg: TTabSheet;
    Label23: TLabel;
    Label12: TLabel;
    Label24: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label21: TLabel;
    Label4: TLabel;
    dbDDataOperacao: TCMDateTimePicker;
    DbLkcFundoInvestResg: TwwDBLookupCombo;
    dbDDataLiquidacaoResg: TCMDateTimePicker;
    DbRValorLiquido: TDBRealEdit;
    DbDtDataCotizacaoResg: TCMDateTimePicker;
    DBeCETIPResg: TDBEdit;
    DbEdCotaResg: TDBRealEdit;
    tbsObsResg: TTabSheet;
    QryResgateOBSERVACAO: TMemoField;
    QryAplicacaoOBSERVACAO: TMemoField;
    pnlObsResg: TPanel;
    pnlObsAplic: TPanel;
    dbeObsApl: TDBMemo;
    dbeObsResg: TDBMemo;
    Label1: TLabel;
    PnlDisp: TPanel;
    pmnuDisp: TPopupMenu;
    mnuOnLine: TMenuItem;
    mnuOffLine: TMenuItem;
    N2: TMenuItem;
    // Marilza 09/09/2008 - N.Sol 95319  - N.Kintana 409226
    qryVerGrupoDisp: TwwQuery;
    Label5: TLabel;
    DbDtRefAplc: TCMDateTimePicker;
    QryResgateIDTIPORESGATE: TFloatField;
    //AL_25
    QrySaldoFundoSTAMARCAAPL: TStringField;
    CbxAplic: TComboBox;
    dbGrdSaldos: TwwDBGrid;
    Label30: TLabel;
    QryResgateDATAAPLICACAO: TDateTimeField;
    //AL_25
    QryFundoInvestAplicDTAINIPROC: TDateTimeField;
    QryAplicacaoDTAINIPROC: TDateTimeField;
    QryFundoInvestResgDTAINIPROC: TDateTimeField;
    QryAplicacaoPLANO: TFloatField;
    QryAplicacaoPLNCODIGO: TFloatField;
    QryAplicacaoCODDOCUMENTO: TFloatField;
    QryResgateDTAINIPROC: TDateTimeField;
    //AL_25
    QryDelHistFundo: TwwQuery;
    MnuUmPlanoFechto: TMenuItem;
    MnuTodosPlanosFechto: TMenuItem;
    QrySaldoFundoSALDOQTDCOTASBLQ: TFloatField;
    //AL_25
    QryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    QryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    QryTipoOperacaoNATUREZAOPERACAO: TStringField;
    QryTipoOperacaoFLGCONTAINVEST: TFloatField;
    QyDelHistFundoATU: TwwQuery;
    fraMens: TfraMensagem;
    pnlTitulo: TPanel;
    Label31: TLabel;
    lbNomItem: TfcLabel;
    DbLkcTipoOperacaoResg: TwwDBLookupCombo;
    pnlSaldoSintetico: TPanel;
    QrySaldoFundoTotalVLRAPLICADO: TFloatField;
    QrySaldoFundoTotalVLRIRPROV: TFloatField;
    QrySaldoFundoTotalVLRIOFPROV: TFloatField;
    QrySaldoFundoTotalVLRVARIACAO: TFloatField;
    QrySaldoFundoTotalCOTASMOVFUNDO: TFloatField;
    QrySaldoFundoTotalVLRMOVFUNDO: TFloatField;
    QrySaldoFundoTotalSALDOQTDCOTAS: TFloatField;
    QrySaldoFundoTotalSALDOVLRFUNDO: TFloatField;
    QrySaldoFundoTotalSALDOLIQUIDO: TFloatField;
    QrySaldoFundoTotalSALDOQTDCOTASBLQ: TFloatField;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel12: TPanel;
    Panel16: TPanel;
    DBReLiq: TDBRealEdit;
    DBReIRRF: TDBRealEdit;
    DBReIOF: TDBRealEdit;
    DBReBruto: TDBRealEdit;
    DBReQtd: TDBRealEdit;
    Panel7: TPanel;
    DBReQtdBloq: TDBRealEdit;
    //AL_42
    tbsDadosResgTx: TTabSheet;
    Label8: TLabel;
    DBEVlrTxSaida: TDBRealEdit;
    Label9: TLabel;
    dbeTipoOperResgTx: TDBEdit;
    tbsDadosAplTx: TTabSheet;
    Label11: TLabel;
    dbeTipoOperAplTx: TDBEdit;
    DBEVlrTxIngresso: TDBRealEdit;
    Label10: TLabel;
    qryTipoOperAplTx: TwwQuery;
    dsTipoOperAplTx: TwwDataSource;
    dsTipoOperResgTx: TwwDataSource;
    qryTipoOperResgTx: TwwQuery;
    QryAplicacaoIDOPERACAOORIGEM: TFloatField;
    QryResgateVLRIOF: TFloatField;
    // Marilza 09/09/2008 - N.Sol 95319  - N.Kintana 409226
    RGAtualizaSaldo: TRadioGroup;
    cboOpcao: TComboBox;
    lblTempo: TLabel;
    bbtnCalcula: TBitBtn;
    lblMsg: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure BtOkAplicClick(Sender: TObject);
    procedure BtCancAplicClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtAltAplicClick(Sender: TObject);
    procedure BtExcAplicClick(Sender: TObject);
    procedure DbEdValorAplicChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtProduraSaldoClick(Sender: TObject);
    procedure PgcSaldosChange(Sender: TObject);
    procedure DbLkcFundoInvestExit(Sender: TObject);
    procedure BtOkResgClick(Sender: TObject);
    //AL_25
    procedure BtCancResgClick(Sender: TObject);
    procedure DbLkcFundoInvestResgExit(Sender: TObject);
    procedure BtIncResgClick(Sender: TObject);
    procedure BtExcResgClick(Sender: TObject);
    //AL_25
    procedure sbtnExecResgateClick(Sender: TObject);
    procedure DtEdDataReferenciaGeralExit(Sender: TObject);
    procedure BtIncAplicClick(Sender: TObject);
    procedure MnuPatrimonioClick(Sender: TObject);
    procedure MnuRentCotasClick(Sender: TObject);
    procedure dblGestorCarteiraEnter(Sender: TObject);
    procedure DbLkcSaldoEnter(Sender: TObject);
    procedure FixarColuna1Click(Sender: TObject);
    procedure LiberarColuna1Click(Sender: TObject);
    procedure LiberaTodasasColunas1Click(Sender: TObject);
    procedure pmnuConsSaldoFundosPopup(Sender: TObject);
    procedure mnuImprimeGridClick(Sender: TObject);
    procedure sbtnDisponibilidadeClick(Sender: TObject);
    procedure sbtnMovimentoClick(Sender: TObject);
    //AL_25
    procedure BtAltResgClick(Sender: TObject);
    procedure DbLkcSaldoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbLkcSaldoExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnConfirmarClick(Sender: TObject);
    //AL_25
    procedure DbDtDataAplicacaoExit(Sender: TObject);
    procedure dbDDataOperacaoExit(Sender: TObject);
    procedure DbDtRefSaldoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuOnLineClick(Sender: TObject);
    procedure mnuOffLineClick(Sender: TObject);
    // Marilza 09/09/2008 - N.Sol 95319  - N.Kintana 409226
    //AL_25
    procedure CbxAplicExit(Sender: TObject);
    //AL_25
    procedure MnuUmPlanoFechtoClick(Sender: TObject);
    procedure MnuTodosPlanosFechtoClick(Sender: TObject);
    //AL_25
    procedure BtVoltaAplicClick(Sender: TObject);
    procedure BtVoltaResgClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    //AL_26
    procedure DblTipoFundoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    //AL_26
    procedure DblTipoFundoExit(Sender: TObject);
    //AL_26
    procedure dblGestorCarteiraCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    //AL_26
    procedure dblGestorCarteiraExit(Sender: TObject);
    //AL_27
    procedure dbGrdSaldosUpdateFooter(Sender: TObject);
    //AL_33
    procedure DbDtDataCotizacaoResgExit(Sender: TObject);
    //AL_41
    procedure DbDtDataCotizacaoAplicExit(Sender: TObject);
    // Marilza 09/09/2008 - N.Sol 95319  - N.Kintana 409226
    procedure RGAtualizaSaldoClick(Sender: TObject);
    procedure cboOpcaoClick(Sender: TObject);
    procedure bbtnCalculaClick(Sender: TObject);

   private
    { Private declarations }
    //AL_26
    wDataRef: TDateTime;
    wTipoFundoInvest : Integer;
    wGestor : Integer;
    wValAnt,
    //AL_43
    MascaraDecQtdHist,MascaraDecVlrHist : String;
    bTodos  : Boolean;
    Procedure AcertaBotoesAplicacao;
    procedure AcertaBotoesConsAplic;
    Procedure AcertaBotoesResgate;
    procedure AcertaBotoesConsResg;
    //AL_25
    Procedure SaldoFundos(TodosPlanos : Boolean;      //False - apenas 1 plano; True - todos os planos
                          iAbert, iFechto : Integer); //Possibilita o saldo na abertura ou no fechamento
    Procedure PreencheAplicacao;
    Procedure PreencheResgate;
    Procedure ProcuraAplResg;
    Procedure BuscaSaldos;
    Procedure AbreQryFundoInvestOperacao;
    Procedure AbreQryFundoInvestAplic;
    Procedure AbreQryFundoInvestResg;
    // Marilza 09/09/2008 - N.Sol 95319  - N.Kintana 409226
    Procedure Online;

    //AL_43
    Procedure MontaSqlSaldo(TodosPlanos : Boolean);

    //AL_25
    Function  VerificaOperacao(sTipoOperacao : String;
                               iFundo        : Integer;
                               dData         : TDateTime;
                               iTipoOperacao : Integer = 0): Boolean;
    Function  VerificaAplicacao   : Boolean;
    Function  VerificaResgate     : Boolean;
    //AL_25
    Function  VerificaAtualizacao(iIdFundo : Integer; dDataIniFdo,dData : TDateTime)  : Boolean;
    Function  ProcExcluiFundoFilhasApl(iFundo,iOperacao : Integer; dData : TDateTime) : Boolean;
    Function  ProcExcluiFundoFilhasRes(iFundo,iOperacao : Integer; dData : TDateTime) : Boolean;

  public
    { Public declarations }

  end;                          

var
  frmCadLancamentoFundo       : TfrmCadLancamentoFundo;
  TDisp                       : TDispThread;
  // Marilza 09/09/2008 - N.Sol 95319  - N.Kintana 409226
  bCheked , bDelete , bOk     : Boolean;
  iOpcaoExecutada             : integer;

implementation

Uses
  UmensErro,UDataBase, uBibliotecaInvest, uSistema, UDiasUteisInv,
  dBaseDados, UFundoComum, dFundoComum, FConsMovFundos, FTelaAut,
  FProcResgates, FGrafPatrimonial, FGrafRentabilidadeCotas, UOperComum,
  FAguarde, FCadEspLancamento,
  {FDmRelFundosSaldo} FDMRelLancFundo { KTN 1608210 SOL 174651 Otacilio Aquino },
  FDmRelatoriosFundos, FPrincipal;
{$R *.DFM}

procedure TfrmCadLancamentoFundo.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  //AL_25
end;

procedure TfrmCadLancamentoFundo.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
end;

procedure TfrmCadLancamentoFundo.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   PnlFundo.Enabled := True;
end;

procedure TfrmCadLancamentoFundo.PreencheAplicacao;
var
   iIdUsuario : Integer;
begin
// Preenche os Paramentros e refaz a Consulta das Aplicacoes
  With QryAplicacao Do Begin
    DisableControls;
    Close;
    ParamByName('DATAOPERACAO').AsString:= DtEdDataReferenciaGeral.Text;
    ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
        QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
    If DblTipoFundo.Text = ''  Then ParamByName('IDTIPOFUNDOINVEST').Clear;

    ParamByName('IDGESTORCARTEIRA').AsInteger :=
        QryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
    If dblGestorCarteira.Text = ''  Then ParamByName('IDGESTORCARTEIRA').Clear;

    ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
    ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;

    Open;

    First;
    While Not Eof Do
    begin
       //Alt_1
       if Sistema.NumDocEmpresa <> '42271429000163' then // VALIA
       begin
          If Copy(Trim(FieldByName('TRGUSERINCLUSAO').AsString),3,
                             Length(Trim(FieldByName('TRGUSERINCLUSAO').AsString))) <> '' Then
             iIdUsuario := StrToInt(Copy(Trim(FieldByName('TRGUSERINCLUSAO').AsString),3,
                             Length(Trim(FieldByName('TRGUSERINCLUSAO').AsString))))
          else
             iIdUsuario := 0;
       end;

       QryBuscaUsuario.Close;
       QryBuscaUsuario.ParamByName('IDUSUARIO').AsInteger := iIdUsuario;
       QryBuscaUsuario.Open;
       Edit;
       FieldByName('USUARIO').AsString := QryBuscaUsuario.FieldByName('NOMEUSUARIO').AsString;
       Post;
       QryBuscaUsuario.Close;
       next;
    end;
    First;
    EnableControls;
  End;
end;

procedure TfrmCadLancamentoFundo.PreencheResgate;
var
   iIdUsuario : Integer;
begin
  //AL_25
  OperComum.LimpaParametros(QryTipoOperacao);
  QryTipoOperacao.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  QryTipoOperacao.Open;

  //Preenche os Paramentros e refaz a Consulta dos Resgates
  With QryResgate Do
  Begin
    //AL_25
    DisableControls;
    Close;
    ParamByName('DATAOPERACAO').AsString:= DtEdDataReferenciaGeral.Text;
    ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
        QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
    If DblTipoFundo.Text = ''  Then
       ParamByName('IDTIPOFUNDOINVEST').Clear;

    ParamByName('IDGESTORCARTEIRA').AsInteger :=
        QryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
    If dblGestorCarteira.Text = ''  Then
       ParamByName('IDGESTORCARTEIRA').Clear;

    ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
    ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;

    Open;

    First;
    While Not Eof Do
    begin
       //Alt_1
       if Sistema.NumDocEmpresa <> '42271429000163' then // VALIA
       begin
          If Copy(Trim(FieldByName('TRGUSERINCLUSAO').AsString),3,
                             Length(Trim(FieldByName('TRGUSERINCLUSAO').AsString))) <> '' Then
             iIdUsuario := StrToInt(Copy(Trim(FieldByName('TRGUSERINCLUSAO').AsString),3,
                             Length(Trim(FieldByName('TRGUSERINCLUSAO').AsString))))
          else
             iIdUsuario := 0;
       end;

       QryBuscaUsuario.Close;
       QryBuscaUsuario.ParamByName('IDUSUARIO').AsInteger := iIdUsuario;
       QryBuscaUsuario.Open;
       Edit;
       FieldByName('USUARIO').AsString := QryBuscaUsuario.FieldByName('NOMEUSUARIO').AsString;
       Post;
       QryBuscaUsuario.Close;
       next;
    end;
    First;
    EnableControls;
  End;
end;

procedure TfrmCadLancamentoFundo.ProcuraAplResg;
begin
  //AL_25
  If Trim(DtEdDataReferenciaGeral.Text) = '' Then
     Exit;

  DbDtRefSaldo.Text     := DtEdDataReferenciaGeral.Text;

  PreencheAplicacao;

  PreencheResgate;

  //AL_42
  BtExcAplic.Enabled := (QryAplicacao.RecordCount > 0);
  BtExcResg.Enabled  := (QryResgate.RecordCount > 0);

end;

procedure TfrmCadLancamentoFundo.BtOkAplicClick(Sender: TObject);
Var
  //AL_38
  //AL_42
  sNaturezaOper, sOperacao, sMens : String;
  dDataOper, dDataLiq : TDateTime;
  iOperAplTx, iIdForCli, iPlanilha, iDocumento, iPlano, iFlgContaInvest : Integer;
  fVlrTaxas, fVlrCustoAcoes, fVlrVarAcoes : Currency;
  bConfirma : Boolean;
begin
  inherited;

  try

     fVlrCustoAcoes := 0;
     fVlrVarAcoes   := 0;

     If Not VerificaAplicacao Then
        Exit;

     //AL_25
     //Ricardo Cristiano - 29/03/2010 - N. Sol 132943 -  N. Kintana 770596
     If VerificaOperacao('D', QryFundoInvestAplic.FieldByName('IDFUNDOINVEST').AsInteger,
                         DbDtDataAplicacao.Date) Then
     Begin
        MsgDlg('Já há lançamento de Resgate para o Fundo no dia '+dbDDataOperacao.Text+'.'#13+
               'A operação será Cancelada!','Informação',mtInformation,[mbOk],0);
        BtCancAplicClick(Sender);
        Exit;
     End;

     //AL_42
     //Busca dados do Tipo de Operacao
     FazQuery(QryAux,'SELECT * FROM TIPOOPERACAO WHERE IDTIPOINVEST = '+QryFundoInvestAplic.FieldByName('IDTIPOINVEST').AsString+
                     ' AND (IDTIPOOPERACAO > 0) AND (CODTIPDOC IS NOT NULL) AND (RECPAG = ''P'')'+
                     ' AND (NATUREZAOPERACAO =  ''A'')');

     If QryAux.IsEmpty Then
     begin
        MsgDlg('Verificar a parametrização para a operação de Aplicação!',
               'Mensagem do Sistema', MtInformation,[MbOk],0);
        QryAux.Close;
        Exit;
     End;

     sNaturezaOper   := QryAux.FieldByName('NATUREZAOPERACAO').AsString;
     sOperacao       := QryAux.FieldByName('DESCTIPOOPERACAO').AsString;
     iFlgContaInvest := QryAux.FieldByName('FLGCONTAINVEST').AsInteger;

     DbLkcFundoInvest.Enabled := True;

     //AL_29
     if VerEmAbertura(QryFundoInvestAplic.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
     begin
        QryAux.Close;
        BtCancAplicClick(Sender);        
        Exit;
     end;

     Try
       If not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

       If DsAplicacao.State In [DsInsert] Then
         QryAplicacao.FieldByName('IDOPERACAOFUNDO').AsInteger := LeUltRegistro(Nil,'OPERACAOFUNDO');

       QryAplicacao.FieldByName('IDTIPOINVEST').AsInteger:=
                                 QryFundoInvestAplic.FieldByName('IDTIPOINVEST').AsInteger;

       QryAplicacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger :=
                                 QryFundoInvestAplic.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

       QryAplicacao.FieldByName('IDTIPOOPERACAO').AsInteger    :=
                                 QryAux.FieldByName('IDTIPOOPERACAO').AsInteger;

       QryAplicacao.FieldByName('NATUREZAOPERACAO').AsString   := sNaturezaOper;

       //AL_25
       if not QryFundoInvestAplic.FieldByName('IDCARTEIRAINVEST').IsNull then
          QryAplicacao.FieldByName('IDCARTEIRAINVEST').AsInteger :=
                                 QryFundoInvestAplic.FieldByName('IDCARTEIRAINVEST').AsInteger;

       QryAplicacao.FieldByName('QTDDECQTD').AsInteger         :=
                                 QryFundoInvestAplic.FieldByName('QTDDECQTD').AsInteger;

       QryAplicacao.FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

       QryAux.Close;

       //AL_42
       dDataOper   := QryAplicacao.FieldByName('DATAOPERACAO').AsDateTime;
       dDataLiq    := QryAplicacao.FieldByName('DATALIQUIDACAO').AsDateTime;
       iOperAplTx  := QryAplicacao.FieldByName('IDOPERACAOFUNDO').AsInteger;
       fVlrTaxas   := QryAplicacao.FieldByName('VLRTAXAS').AsFloat;
       QryAplicacao.FieldByName('VLRTAXAS').Clear;

       // Confirma Operacao
       QryAplicacao.Post;
       QryAplicacao.CommitUpdates;

       iPlano     := -1;       
       iPlanilha  := -1;
       iDocumento := -1;

       //AL_25
       iIdForCli := OperComum.BuscaForCli(QryAplicacaoIDTIPOINVEST.AsInteger,
                                          QryFundoInvestAplicIDGESTORCARTEIRA.AsInteger,
                                          QryAplicacaoIDTIPOOPERACAO.AsInteger, pRPI.IDTIPOCLIENTEEMI);
       //Al_40
       If not ((QryAplicacaoDATAOPERACAO.AsDateTime <> QryAplicacaoDATACOTIZACAO.AsDateTime) And
               (QryAplicacaoQTDOPERACAO.AsFloat = 0)) Then
       begin
          //AL_42
          //AL_38          
          //Rotina de confirmação das operações
          If Not AlimentaFundo(QryAplicacaoIDTIPOINVEST.AsInteger,
                               QryAplicacaoIDTIPOOPERACAO.AsInteger,
                               QryAplicacaoIDCARTEIRAINVEST.AsInteger,
                               QryAplicacaoIDFUNDOINVEST.AsInteger,
                               iPlanoPrevContab,
                               iPatrocinadora,
                               QryAplicacaoIDOPERACAOFUNDO.AsInteger,
                               QryAplicacaoIDOPERACAOFUNDO.AsInteger,
                               QryAplicacaoQTDDECQTD.AsInteger,
                               QryFundoInvestAplicIDTIPOFUNDOINVEST.AsInteger,
                               iIdForCli,
                               QryAplicacaoDATAOPERACAO.AsDateTime,
                               QryAplicacaoDATACOTIZACAO.AsDateTime,
                               QryAplicacaoDATALIQUIDACAO.AsDateTime,
                               QryAplicacaoQTDOPERACAO.AsFloat, QryAplicacaoVLRCOTA.AsFloat,
                               QryAplicacaoVLROPERACAO.AsFloat, 0{IRRF},  0{IOF},
                               sNaturezaOper,
                               Trim(sOperacao)+' / '+QryFundoInvestAplicDESCFUNDOINVEST.AsString,
                               'OPE', True, iPlanPrevCtbPatro, -1, -1, 0{Rendimento}, sMens) Then
          Begin
             //Al_16/Al_17
             //AL_38
             if sMens <> '' then
                MsgDlg('Não foi possível confirmar a Aplicação' + #13 +
                       'Mensagem: ' + sMens,
                       'Mensagem do Sistema', mtInformation, [MbOk],0)
             else
                MsgDlg('Não foi possível efetuar esta Aplicação' + #13 +
                       'Ocorreu um problema durante o processo de gravação' + #13 +
                       'Refaça a Operação',
                       'Mensagem do Sistema', mtInformation,[MbOk],0);
          
             If dtmBaseDados.dbBaseDados.InTransaction then
                DtmBaseDados.dbBaseDados.Rollback;

             //AL_25
             BtCancAplicClick(Sender);
             Exit;
          End;

          ExecutaQuery(QryAux,'UPDATE OPERACAOFUNDO SET STACONFIRMA = ''S'' WHERE '+
                              '(IDOPERACAOFUNDO   = '''+IntToStr(QryAplicacaoIDOPERACAOFUNDO.AsInteger)  +''')');
          QryAux.Close;                               
       end;
       //AL_40

       //Al_3
       If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                       QryAplicacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                                       QryAplicacao.FieldByName('IDTIPOINVEST').AsInteger,
                                       QryAplicacao.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                       QryAplicacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                       iIdForCli,
                                       QryAplicacao.FieldByName('IDFUNDOINVEST').AsInteger,
                                       StrToDate(DbDtDataAplicacao.Text),
                                       StrToDate(DbDtDataLiquidacao.Text),
                                       'OPE', sNaturezaOper,
                                       DbLkcFundoInvest.Text+' / '+sPlanPrevCtbPatro,
                                       True, QryAplicacao.FieldByName('VLROPERACAO').AsFloat,
                                       0, 0, 0, 0, fVlrCustoAcoes, fVlrVarAcoes,
                                      -1, 0, 0, 0, iFlgContaInvest) Then
       //Al_16/Al_17
       begin
          If dtmBaseDados.dbBaseDados.InTransaction then
             DtmBaseDados.dbBaseDados.Rollback;
          //AL_25    
          BtCancAplicClick(Sender);
          Exit;
       end;
       //Al_16/Al_17

       With QryUpdOperacaoApl Do
       Begin
          //AL_42
          OperComum.LimpaParametros(QryUpdOperacaoApl);
          ParamByName('IDOPERACAOFUNDO').AsInteger      := QryAplicacao.FieldByName('IDOPERACAOFUNDO').AsInteger;
          //AL_31
          If iPlano > 0 then
             ParamByName('PLANO').AsInteger             := iPlano
          Else
             ParamByName('PLANO').Clear;

          If iPlanilha > 0 then
             ParamByName('PLNCODIGO').AsInteger         := iPlanilha
          Else
             ParamByName('PLNCODIGO').Clear;

          If iDocumento > 0 then
             ParamByName('CODDOCUMENTO').AsInteger      := iDocumento
          Else
             ParamByName('CODDOCUMENTO').Clear;
          ExecSQL;
          Close;
       End;

       //AL_42
       if fVlrTaxas <> 0 then
       begin
          QryAplicacao.Insert;
          QryAplicacao.FieldByName('IDOPERACAOFUNDO').AsInteger  := LeUltRegistro(Nil,'OPERACAOFUNDO');

          QryAplicacao.FieldByName('IDTIPOINVEST').AsInteger     := iTipoInvestUsu;
          QryAplicacao.FieldByName('IDPLANPREVCTBPATR').AsInteger:= iPlanPrevCtbPatro;

          QryAplicacao.FieldByName('IDTIPOOPERACAO').AsInteger   := qryTipoOperAplTx.FieldByName('IDTIPOOPERACAO').AsInteger;

          if not QryFundoInvestAplic.FieldByName('IDCARTEIRAINVEST').IsNull then
             QryAplicacao.FieldByName('IDCARTEIRAINVEST').AsInteger :=
                                    QryFundoInvestAplic.FieldByName('IDCARTEIRAINVEST').AsInteger;

          QryAplicacao.FieldByName('IDFUNDOINVEST').AsInteger    := QryFundoInvestAplic.FieldByName('IDFUNDOINVEST').AsInteger;

          QryAplicacao.FieldByName('DATAOPERACAO').AsDateTime    := dDataOper;
          QryAplicacao.FieldByName('DATALIQUIDACAO').AsDateTime  := dDataLiq;
          QryAplicacao.FieldByName('IDOPERACAOORIGEM').AsInteger := iOperAplTx;
          QryAplicacao.FieldByName('VLRTAXAS').AsFloat           := fVlrTaxas;

          DBEVlrTxIngresso.Value := fVlrTaxas;

          iPlano     := -1;          
          iPlanilha  := -1;
          iDocumento := -1;

          iIdForCli := OperComum.BuscaForCli(iTipoInvestUsu,
                                             QryFundoInvestAplicIDGESTORCARTEIRA.AsInteger,
                                             qryTipoOperAplTx.FieldByName('IDTIPOOPERACAO').AsInteger,
                                             pRPI.IDTIPOCLIENTEEMI);

          if Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                          QryAplicacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                                          QryAplicacao.FieldByName('IDTIPOINVEST').AsInteger,
                                          QryFundoInvestAplic.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                          QryFundoInvestAplic.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                          iIdForCli,
                                          QryAplicacao.FieldByName('IDFUNDOINVEST').AsInteger,
                                          QryAplicacao.FieldByName('DATAOPERACAO').AsDateTime,
                                          QryAplicacao.FieldByName('DATALIQUIDACAO').AsDateTime,
                                          qryTipoOperAplTx.FieldByName('TIPOMOVTO').AsString,
                                          qryTipoOperAplTx.FieldByName('NATUREZAOPERACAO').AsString,
                                          QryFundoInvestAplic.FieldByName('DESCFUNDOINVEST').AsString+' / '+sPlanPrevCtbPatro,
                                          True,
                                          QryAplicacao.FieldByName('VLRTAXAS').AsFloat, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0,
                                          qryTipoOperAplTx.FieldByName('FLGCONTAINVEST').AsInteger) Then
          begin
             If dtmBaseDados.dbBaseDados.InTransaction then
                DtmBaseDados.dbBaseDados.Rollback;
             BtCancAplicClick(Sender);
             Exit;
          end;

          // Confirma Operacao
          QryAplicacao.Post;
          QryAplicacao.CommitUpdates;

          With QryUpdOperacaoApl Do
          Begin
             OperComum.LimpaParametros(QryUpdOperacaoApl);
             ParamByName('IDOPERACAOFUNDO').AsInteger      := QryAplicacao.FieldByName('IDOPERACAOFUNDO').AsInteger;
             If iPlano > 0 then
                ParamByName('PLANO').AsInteger             := iPlano
             Else
                ParamByName('PLANO').Clear;

             If iPlanilha > 0 then
                ParamByName('PLNCODIGO').AsInteger         := iPlanilha
             Else
                ParamByName('PLNCODIGO').Clear;

             If iDocumento > 0 then
                ParamByName('CODDOCUMENTO').AsInteger      := iDocumento
             Else
                ParamByName('CODDOCUMENTO').Clear;
             ExecSQL;
             Close;
          End;
       end;

       //AL_25
       // Confirma Transação
       If dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Commit;

       bConfirma := True;   

       QryTipoFundoInvest.Close;
       QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                                             QryFundoInvestAplicIDTIPOFUNDOINVEST.AsInteger;
       QryTipoFundoInvest.Open;

       If StrToDate(DbDtDataAplicacao.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
       begin
          //Alt_3
          If Not Reprocessamento(iTipoInvestUsu,
                                 QryFundoInvestAplic.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                 QryFundoInvestAplic.FieldByName('IDFUNDOINVEST').AsInteger,
                                 iPlanPrevCtbPatro,
                                 StrToDate(DbDtDataAplicacao.Text),
                                 QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                 QryFundoInvestAplic.FieldByName('DTAINIPROC').AsDateTime,
                                 True) Then
          begin
              MsgDlg('Atenção : A Operação foi concluída com sucesso!'+#13+
                     'Mas o Reprocessamento foi cancelado!'+#13+
                     'Faça o Reprocessamento para esse Fundo, a partir desse dia!',
                     'Mensagem do Sistema', MtInformation,[MbOk],0);
              bConfirma := False;       
          end;
          //AL_25
       end;

     Except
       On E:Exception Do
       Begin
         //Al_16
         MsgDlg('Não foi possivel confirmar a Operação:'+#13+
                E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);

         If dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Rollback;

         bConfirma := False;
       End;
     End;

     QryAux.Close;
     QryTipoFundoInvest.Close;
     DtEdDataReferenciaGeral.Date := QryAplicacaoDATAOPERACAO.AsDateTime;
     PreencheAplicacao;
     BuscaSaldos;
     bDelete := False;
     // Volta Ambiente
     PgcSaldos.Enabled    := True;
     DbGrdAplicacao.BringToFront;
     pnlDadosBase.Enabled := True;
     BtIncAplic.Enabled := False;
     BtExcAplic.Enabled := False;
     Dock978.Visible    := False;
     AcertaBotoesAplicacao;
     DBeCETIPApl.Text:='';

     if bConfirma then
        MsgDlg('Processo Concluído!','Mensagem do Sistema',mtInformation ,[mbOk],0);

   finally
      if TDisp <> nil then
         TDisp.Continuar;
   end;
end;

procedure TfrmCadLancamentoFundo.BtCancAplicClick(Sender: TObject);
begin
  inherited;
  try
     //Al_14
     If dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Rollback;

     //AL_25
     //Al_14

     DbLkcFundoInvest.Enabled := True;

     //Volta Ambiente
     DbGrdAplicacao.BringToFront;
     pnlDadosBase.Enabled := True;

     if BtAltAplic.Tag = 1 then
     begin
        BtAltAplic.Tag := 0;
        AcertaBotoesConsAplic;
     end else
        AcertaBotoesAplicacao;

     Dock978.Visible    := False;

     //Refresh
     PreencheAplicacao;

     //AL_42
     BtExcAplic.Enabled := (QryAplicacao.RecordCount > 0);     

   finally
      if TDisp <> nil then
         TDisp.Continuar;
   end;
end;

Procedure TfrmCadLancamentoFundo.AcertaBotoesAplicacao;
Begin
// Desabilita Botoes
  BtIncAplic.Enabled := Not BtIncAplic.Enabled;
  BtExcAplic.Enabled := Not BtExcAplic.Enabled;
  BtAltAplic.Enabled := Not BtAltAplic.Enabled;

  BtIncAplic.Down := False;
  BtAltAplic.Down := False;
  BtExcAplic.Down := False;

  BtOkAplic.Enabled    := Not BtOkAplic.Enabled;
  BtCancAplic.Enabled  := Not BtCancAplic.Enabled;
  BtVoltaAplic.Enabled := Not BtVoltaAplic.Enabled;
End;

Procedure TfrmCadLancamentoFundo.AcertaBotoesConsAplic;
Begin
// Desabilita Botoes
  BtIncAplic.Enabled := Not BtIncAplic.Enabled;
  BtAltAplic.Enabled := Not BtAltAplic.Enabled;
  BtExcAplic.Enabled := Not BtExcAplic.Enabled;

  BtIncAplic.Down := False;
  BtExcAplic.Down := False;
  if BtAltAplic.Tag = 1 then
  begin
     BtAltAplic.Down := True;
     BtOkAplic.Visible   := False;
     BtCancAplic.Visible := False;
  end else
  begin
     BtAltAplic.Down := False;
     BtOkAplic.Visible   := True;
     BtCancAplic.Visible := True;
  end;
  BtVoltaAplic.Enabled := Not BtVoltaAplic.Enabled;
End;

Procedure TfrmCadLancamentoFundo.AcertaBotoesResgate;
Begin
// Desabilita Botoes
  BtIncResg.Enabled := Not BtIncResg.Enabled;
  BtExcResg.Enabled := Not BtExcResg.Enabled;
  BtAltResg.Enabled := Not BtAltResg.Enabled;

  BtIncResg.Down := False;
  BtExcResg.Down := False;

  BtOkResg.Enabled    := Not BtOkResg.Enabled;
  BtCancResg.Enabled  := Not BtCancResg.Enabled;
  BtVoltaResg.Enabled := Not BtVoltaResg.Enabled;
End;

Procedure TfrmCadLancamentoFundo.AcertaBotoesConsResg;
Begin
// Desabilita Botoes
  BtIncResg.Enabled := Not BtIncResg.Enabled;
  BtAltResg.Enabled := Not BtAltResg.Enabled;
  BtExcResg.Enabled := Not BtExcResg.Enabled;

  BtIncResg.Down := False;
  BtExcResg.Down := False;
  if BtAltResg.Tag = 1 then
  begin
     BtAltResg.Down     := True;
     BtOkResg.Visible   := False;
     BtCancResg.Visible := False;
  end else
  begin
     BtAltResg.Down     := False;
     BtOkResg.Visible   := True;
     BtCancResg.Visible := True;
  end;
  BtVoltaResg.Enabled := Not BtVoltaResg.Enabled;
End;

//AL_25

procedure TfrmCadLancamentoFundo.FormShow(Sender: TObject);
begin

  inherited;
  // Marilza 09/09/2008 - N.Sol 95319  - N.Kintana 409226
  bOk := False;
  lblTempo.Visible  := False;
  lblMsg.Visible := False;
  //AL_42
  tbsDadosAplTx.Visible  := (iTipoInvestUsu = 6);
  tbsDadosResgTx.Visible := (iTipoInvestUsu = 6);

  qryTipoOperAplTx.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  qryTipoOperAplTx.Open;

  qryTipoOperResgTx.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  qryTipoOperResgTx.Open;

  //AL_38
  fraMens.Apaga;

  bDelete  := False;

  DbGrdAplicacao.BringToFront;
  //AL_25
  QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  QryTipoFundo.Open;

  QryGestorCart.Open;

  If iTipoInvestUsu = 7 Then
     sbtnEspecificoFdo.Enabled := False
  Else
     sbtnEspecificoFdo.Enabled := True;

  PnlAplicacao.SendToBack;
  PnlResgate.SendToBack;
  //AL_25
  DBReQtd.Clear;
  //AL_24
  DBReQtdBloq.Clear;
  DBReBruto.Clear;
  DBReIRRF.Clear;
  DBReIOF.Clear;
  DBReLiq.Clear;
  CbxAplic.Text := '';

  //Verifica a ultima data de fechamento
  QryUltDataFech.Close;
  QryUltDataFech.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
  QryUltDataFech.ParamByName('IDTIPOFUNDOINVEST').Clear;
  QryUltDataFech.Open;
  While Not QryUltDataFech.Eof Do
  Begin
     DtEdDataReferenciaGeral.Text     := QryUltDataFech.FieldByName('DATAULTFECH').AsString;
     DtEdDataReferenciaGeral.DateTime := QryUltDataFech.FieldByName('DATAULTFECH').AsDateTime;
     DtEdDataReferenciaGeral.Update;

     //Alt_5
     If QryUltDataFech.FieldByName('DATAULTFECH').AsDateTime < pRPI.DATAULTFECHFDO Then
     begin
        //Verifica se há saldo
        QryVerSaldoFech.Close;
        QryVerSaldoFech.ParamByName('IDFUNDOINVEST').Clear;
        QryVerSaldoFech.ParamByName('DATAMOVFUNDO').AsString       := DtEdDataReferenciaGeral.Text;
        QryVerSaldoFech.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
        QryVerSaldoFech.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
        QryVerSaldoFech.Open;

        If (Not QryVerSaldoFech.IsEmpty) Then
           QryUltDataFech.Last;

        QryVerSaldoFech.Close;

        QryUltDataFech.Next;
     end
     else
        QryUltDataFech.Last;
  End;

  If DtEdDataReferenciaGeral.Text = '' Then
  Begin
     DtEdDataReferenciaGeral.Text := DateToStr(Date);
     DtEdDataReferenciaGeral.DateTime := Date;
     DtEdDataReferenciaGeral.Update;
  End;

  //AL_26
  wDataRef   := StrToDate(DtEdDataReferenciaGeral.Text);
  wTipoFundoInvest := 0;
  wGestor    := 0;

  //AL_25
  QryUltDataFech.Close;

  //AL_25
  // Disponibilidade -------------
  PnlDisp.Caption := FormatFloat('###,###,###,###,##0.00 ', 0);

  OperComum.LimpaParametros(qryVerGrupoDisp);
  qryVerGrupoDisp.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
  qryVerGrupoDisp.Open;

  //AL_47
  If Sistema.TipoCliente <> 19981 then
     TDisp := TDispThread.CreateT(PnlDisp)
  else
     TDisp := TDispThread.CreateT(PnlDisp,False);

  if qryVerGrupoDisp.IsEmpty then
  begin
     TDisp.OnLine       := False;
     // Marilza 09/09/2008 - N.Sol 95319  - N.Kintana 409226
  end;

  qryVerGrupoDisp.Close;

  try
     if DtEdDataReferenciaGeral.DateTime <> 0 then
        dmDisponibilidade.DataRef := DtEdDataReferenciaGeral.DateTime
     else if Trim(DtEdDataReferenciaGeral.Text) <> '' then
        dmDisponibilidade.DataRef := StrToDate(DtEdDataReferenciaGeral.Text)
     else
        dmDisponibilidade.DataRef := Date;
  except
     dmDisponibilidade.DataRef    := Date;
  end;

  //AL_25
  if TDisp <> nil then
     TDisp.Continuar;

  //AL_12
  MnuUmPlanoFechto.Caption := sPlanPrevCtbPatro;

  AbreQryFundoInvestOperacao;

  AbreQryFundoInvestAplic;

  AbreQryFundoInvestResg;

  ProcuraAplResg;

  BuscaSaldos;

  If (QryResgate.RecordCount > 0) Then
     PgcSaldos.ActivePage := TbsResgate
  Else If QryAplicacao.RecordCount > 0 Then
     PgcSaldos.ActivePage := TbsAplicacao
  Else
     PgcSaldos.ActivePage := TbsSaldo;
//AL_26 
end;

procedure TfrmCadLancamentoFundo.BtAltAplicClick(Sender: TObject);
begin
  // Testa dados
  If (QryAplicacao.Active = False) Or (QryAplicacao.IsEmpty = True) Then Begin
     MsgDlg('Consulta não pode ser executada.','Mensagem do Sistema',mtWarning,[mbOk],0);
     BtAltAplic.Down := False;
     Exit;
  End;

  inherited;
           
  //AL_25
  if TDisp <> nil then
     TDisp.Suspender;

  // Prepara Ambiente
  Dock978.Visible  := True;
  BtAltAplic.Tag   := 1;
  AcertaBotoesConsAplic;
  PnlAplicacao.BringToFront;
  //AL_42
  pgcAplicacao.ActivePage := tbsDadosApl;  
  tbsDadosAplTx.Enabled   := False;  
  tbsDadosApl.Enabled     := False;
  tbsObsApl.Enabled       := False;

  DbLkcFundoInvest.Text  := QryAplicacaoDESCFUNDOINVEST.AsString;
  DBeCETIPApl.Text       := QryFundoInvestAplic.FieldByName('CODFUNCETIP').AsString;
  DbDtDataAplicacao.Text := QryAplicacao.FieldByName('DATAOPERACAO').AsString;
  // Preenche Decimais da Quantidade
  DbEdQtdOper.DecDigits  := QryFundoInvestAplic.FieldByName('QTDDECQTD').AsInteger;

end;

procedure TfrmCadLancamentoFundo.BtExcAplicClick(Sender: TObject);
Var
   //Al_15
   dDataIniProc, dDataOper : TDateTime;
   iTipoFundoInvest, iFundoInvest : Integer;
   //AL_10
   ftotvlraplicado,
   ftotcotasmovfundo,
   ftotvlrmovfundo,
   ftotsaldoqtdcotas,
   ftotsaldovlrfundo,
   ftotvlrcustoatual  : Extended;

   iIdTipoInvestAtu      : Integer;
   iIdTipoOperacaoAtu    : Integer;
   iIdCarteiraInvestAtu  : Integer;
   iIdFundoInvestAtu     : Integer;
   dDataAplicacaoAtu     : TDateTime;
   dDataMovFundoAtu      : TDateTime;
   sNaturMovFundoAtu     : String;
   sTipMovFundoAtu       : String;
   iIdPlanPrevCtbPatrAtu : Integer;

   bConfirma : Boolean;

begin
  inherited;
// Testa dados
  If (QryAplicacao.Active = False) Or (QryAplicacao.IsEmpty = True) Then
  Begin
     MsgDlg('Consulta não foi executada.','Mensagem do Sistema',mtWarning,[mbOk],0);
     BtExcAplic.Down := False;
     Exit;
  End;

  //AL_18
  //AL_34
  if not CtrlInvContab.TestaPeriodo(QryAplicacao.FieldByName('DATAOPERACAO').AsString, iTipoInvestUsu) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', mtWarning,[mbOk],0);
     BtExcAplic.Down := False;
     Exit;
  End;

  //AL_29
  if VerEmAbertura(QryAplicacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
  begin
     BtExcAplic.Down := False;
     Exit;
  end;

  //AL_38
  try //Finally

     If MsgDlg('Confirma Exclusão?','Mensagem ',mtInformation,
               [mbYes, mbNo],0) = mrYes
     Then Begin

        Try
           If not dtmBaseDados.dbBaseDados.InTransaction then
              dtmBaseDados.dbBaseDados.StartTransaction;

           //Alt_4
           QryTipoFundoInvest.Close;
           QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                              QryAplicacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
           QryTipoFundoInvest.Open;

           iTipoFundoInvest := QryAplicacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
           iFundoInvest     := QryAplicacao.FieldByName('IDFUNDOINVEST').AsInteger;
           dDataOper        := QryAplicacao.FieldByName('DATAOPERACAO').AsDateTime;
           //Al_15
           dDataIniProc     := QryAplicacao.FieldByName('DTAINIPROC').AsDateTime;
           //AL_38
           // Exclui Dados do Historico (Contábil e Financeiro)
           If Not ProcExcluiFundo(QryAplicacao.FieldByName('CODDOCUMENTO').AsInteger,
                                  QryAplicacao.FieldByName('PLNCODIGO').AsInteger,
                                  QryAplicacao.FieldByName('PLANO').AsInteger,
                                  QryAplicacao.FieldByName('IDTIPOINVEST').AsInteger,
                                  QryAplicacao.FieldByName('DATAOPERACAO').AsDateTime, False) Then
              Raise Exception.Create('Ocorreu um problema ao excluir os lançamentos contábeis e financeiro');

           If Not ProcExcluiFundoFilhasApl(QryAplicacao.FieldByName('IDFUNDOINVEST').AsInteger,
                                           QryAplicacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                                           QryAplicacao.FieldByName('DATAOPERACAO').AsDateTime) Then
           begin
              //Al_17
              If dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.Rollback;
                 
              BtCancAplicClick(Sender);

              Exit;
           end;

           If ((QryAplicacao.FieldByName('CODDOCUMENTO').AsInteger <= 0)  And
               (QryAplicacao.FieldByName('PLNCODIGO').AsInteger    <= 0)) Then
           begin
              If Not ExecutaQuery(QryAux,'DELETE FROM HISTFUNDO WHERE IDOPERACAOFUNDO = '+
                                         QryAplicacao.FieldByName('IDOPERACAOFUNDO').AsString) Then
              begin
                //Al_17
                If dtmBaseDados.dbBaseDados.InTransaction then
                   dtmBaseDados.dbBaseDados.Rollback;
                   
                BtCancAplicClick(Sender);

                Exit;
              end;
           end;

           //AL_25
           //Exclui Operacao de Aplicacao
           QryAplicacao.Delete;
           QryAplicacao.CommitUpdates;

           If dtmBaseDados.dbBaseDados.InTransaction then
              dtmBaseDados.dbBaseDados.Commit;

           bConfirma := True;

           If dDataOper <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
           begin
              //Al_15
              //Alt_8
              //Alt_4
              //Alt_3
              If Not Reprocessamento(iTipoInvestUsu, iTipoFundoInvest, iFundoInvest,
                                     iPlanPrevCtbPatro, dDataOper,
                                     QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                     dDataIniProc,
                                     True) Then
              begin
                 MsgDlg('Atenção : A Operação foi concluída com sucesso!'+#13+
                        'Mas o Reprocessamento foi cancelado!'+#13+
                        'Faça o Reprocessamento para esse Fundo, a partir desse dia!',
                        'Mensagem do Sistema', MtInformation,[MbOk],0);
                 bConfirma := False;
              end;
           end;
           QryTipoFundoInvest.Close;

           //AL_10

           PreencheAplicacao;
           BuscaSaldos;

        Except
           On E:Exception Do
           Begin
              //Al_16/Al_17
              MsgDlg('Não foi possível excluir a Operação:'+#13+
                     E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);

              If dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.Rollback;
              //AL_25
              QryTipoFundoInvest.Close;
              BtCancAplicClick(Sender);
              //Al_16/Al_17
              bConfirma := False;
           End;
        End; // Except
     End; // If Exclui
  finally
     //AL_25
     BtIncAplic.Enabled := True;
     BtExcAplic.Down    := False;
     //AL_42
     BtExcAplic.Enabled := (QryAplicacao.RecordCount > 0);

     bDelete := False;

     if bConfirma then
        MsgDlg('Processo Concluído.','Mensagem do Sistema',mtInformation ,[mbOk],0);
  end;
  //AL_38

end;

procedure TfrmCadLancamentoFundo.DbEdValorAplicChange(Sender: TObject);
Var
  wStr : String;
begin
  inherited;

  If DbEdCota.Value <> 0 Then
  Begin
     wStr := FloatToStrF((DbEdValorAplic.Value / DbEdCota.Value),ffFixed,17,
                          QryFundoInvestAplic.FieldByName('QTDDECQTD').AsInteger);
     If QryAplicacao.State In [DsInsert, DsEdit] Then
        QryAplicacao.FieldByName('QTDOPERACAO').AsString:= wStr;
  End;
end;

procedure TfrmCadLancamentoFundo.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   TDisp.Terminate;

  //AL_25
  QrySaldoFundoTotal.Close;
  QrySaldoFundo.Close;
  QryResgate.Close;
  QryAplicacao.Close;
  QryTipoFundo.Close;
  QryTipoOperacao.Close;
  QryTipoFundoInvest.Close;
  QryAux.Close;
  QryBuscaUsuario.Close;
  QryVerSaldosFundos.Close;
  QryVerificaOperacao.Close;
  QryVerSaldoFech.Close;
  QryVerAtualizacao.Close;
  QryVerDelResgate.Close;
  qryGestorCart.Close;
  QryUltDataFech.Close;
  QryFundoInvestResg.Close;
  QryFundoInvestOperacao.Close;
  QryFundoInvestAplic.Close;

  dmDisponibilidade.Free;

  inherited;
end;

procedure TfrmCadLancamentoFundo.BuscaSaldos;
begin
  //AL_25
  If Trim(DtEdDataReferenciaGeral.Text) = '' Then
     DbDtRefSaldo.Text := '';

   If Trim(DbDtRefSaldo.Text) = '' Then
      Exit;

   //AL_27   
   with QrySaldoFundoTotal do
   begin
      OperComum.LimpaParametros(QrySaldoFundoTotal);

      if Trim(DbLkcSaldo.Text) <> '' then
         ParamByName('IDFUNDOINVEST').AsString := DbLkcSaldo.LookupValue;

      if Trim(DbDtRefSaldo.Text) <> '' then
         ParamByName('DATAMOVFUNDO').AsString  := DbDtRefSaldo.Text;

      if Trim(DbDtRefAplc.Text) <> '' then
      begin
         If CbxAplic.ItemIndex = 1 Then
         begin
            ParamByName('DATAAPLICACAO').AsString := DbDtRefAplc.Text;
            ParamByName('TIPOMENOR').AsInteger    := CbxAplic.ItemIndex;
         end
         Else If CbxAplic.ItemIndex = 2 Then
         begin
            ParamByName('DATAAPLICACAO').AsString := DbDtRefAplc.Text;
            ParamByName('TIPOMAIOR').AsInteger    := CbxAplic.ItemIndex;
         end;
      end;

      if DblTipoFundo.Text <> ''  then
         ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

      if dblGestorCarteira.Text <> '' then
         ParamByName('IDGESTORCARTEIRA').AsInteger  := qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;

      ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      Open;
   End;

   //AL_28
   QrySaldoFundoVLRCOTAATUAL.DisplayFormat      := '###,#0.000000000';
   QrySaldoFundoVLRCOTAAPLICACAO.DisplayFormat  := '###,#0.000000000';
   QrySaldoFundoSALDOQTDCOTAS.DisplayFormat     := '###,#0.000000000';
   QrySaldoFundoSALDOQTDCOTASBLQ.DisplayFormat  := '###,#0.000000000';
   if Trim(DbLkcSaldo.Text) <> '' then
   begin
      //AL_25
      QrySaldoFundoVLRCOTAATUAL.DisplayFormat  :=
                   MontaMascaraDecVlr(QryFundoInvestOperacaoIDFUNDOINVEST.AsInteger);
      QrySaldoFundoSALDOQTDCOTAS.DisplayFormat :=
                   MontaMascaraDecQtd(QryFundoInvestOperacaoIDFUNDOINVEST.AsInteger);
      QrySaldoFundoSALDOQTDCOTASBLQ.DisplayFormat := QrySaldoFundoSALDOQTDCOTAS.DisplayFormat;
   end;

   // Preenche os Paramentros e refaz a Consulta dos Saldos
   with QrySaldoFundo do
   begin
      Filtered := False;
      Filter   := '';
      OperComum.LimpaParametros(QrySaldoFundo);
      if Trim(DbLkcSaldo.Text) <> '' then
         ParamByName('IDFUNDOINVEST').AsString := DbLkcSaldo.LookupValue;

      if Trim(DbDtRefAplc.Text) <> '' then
      begin
         If CbxAplic.ItemIndex = 1 Then
         begin
            ParamByName('DATAAPLICACAO').AsString := DbDtRefAplc.Text;
            ParamByName('TIPOMENOR').AsInteger    := CbxAplic.ItemIndex;
         end
         Else If CbxAplic.ItemIndex = 2 Then
         begin
            ParamByName('DATAAPLICACAO').AsString := DbDtRefAplc.Text;
            ParamByName('TIPOMAIOR').AsInteger    := CbxAplic.ItemIndex;
         end;
      end;

      if Trim(DbDtRefSaldo.Text) <> '' then
         ParamByName('DATAMOVFUNDO').AsString  := DbDtRefSaldo.Text;

      if DblTipoFundo.Text <> ''  then
         ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

      if dblGestorCarteira.Text <> ''  then
         ParamByName('IDGESTORCARTEIRA').AsInteger := qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;

      ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;

      Open;

      // Busca dados do Tipo de Operacao - Fdo Imobiliário, recebto de dividendo, não influência no saldo
      FazQuery(QryAux,'SELECT * FROM TIPOOPERACAO WHERE IDTIPOINVEST='+IntToStr(iTipoInvestUsu)+
                      ' AND NATUREZAOPERACAO =  ''R''');
      if not QryAux.FieldByName('IDTIPOOPERACAO').IsNull then
      begin
         Filter   := 'IDTIPOOPERACAO <> '+QryAux.FieldByName('IDTIPOOPERACAO').AsString;
         Filtered := True;
      end;

      QryAux.Close;
   end;
end;

procedure TfrmCadLancamentoFundo.BtProduraSaldoClick(Sender: TObject);
begin
  inherited;
   If CbxAplic.ItemIndex = 0 then
      DbDtRefAplc.Clear;

   If (DbDtRefAplc.Text  = '') And (CbxAplic.ItemIndex > 0) then
      DbDtRefAplc.Text  := DateToStr(pRPI.DTMUDACPMF);

   BuscaSaldos;
end;

procedure TfrmCadLancamentoFundo.PgcSaldosChange(Sender: TObject);
begin
  If Trim(DtEdDataReferenciaGeral.Text) = '' Then
  Begin
     PgcSaldos.Enabled := False;
     Exit;
  End;

  if dsResgate.State = dsInsert then
  begin
     MsgDlg('Não foi finalizada a operação de Resgate. Confirme ou cancele a Operação.','Informação',mtInformation,[mbOk],0);
     //AL_25
     Exit;
  end;

  if dsAplicacao.State = dsInsert then
  begin
     MsgDlg('Não foi finalizada a operação de Aplicação. Confirme ou cancele a Operação.','Informação',mtInformation,[mbOk],0);
     PgcSaldos.ActivePage := TbsAplicacao;
     Exit;
  end;

  //AL_25
  // Em consulta de Aplicação e/ou resgate
  if BtAltAplic.Tag = 1 then
     BtCancAplicClick(Sender);

  if BtAltResg.Tag = 1 then
     BtCancResgClick(Sender);

  inherited;

  //AL_25
  If (PgcSaldos.ActivePage      = TbsAplicacao) Then    //Aplicação
  Begin
     //AL_26
     if DbGrdAplicacao.CanFocus then
        DbGrdAplicacao.SetFocus;
     PgcSaldos.ActivePage := TbsAplicacao;
     pnlSaldos.Visible    := False;
  End
  Else If PgcSaldos.ActivePage  = TbsResgate Then      //Resgate
  Begin
     //AL_26
     if DbGrdrResgate.CanFocus then
        DbGrdrResgate.SetFocus;
     PgcSaldos.ActivePage := TbsResgate;
     pnlSaldos.Visible    := False;
  End
  Else If ((PgcSaldos.ActivePage = TbsSaldo) And
           (QrySaldoFundo.ParamByName('DATAMOVFUNDO').AsDateTime <> 0) And
           (DtEdDataReferenciaGeral.DateTime <>
            QrySaldoFundo.ParamByName('DATAMOVFUNDO').AsDateTime))Then        //Saldo
  Begin
     //AL_26
     if dbGrdSaldos.CanFocus then
        dbGrdSaldos.SetFocus;
     PgcSaldos.ActivePage      := TbsSaldo;
     pnlSaldos.Height          := 39;
     pnlSaldos.Visible         := False;
     pnlSaldoSintetico.Visible := False;
     pnlSaldosDetalhes.Visible := True;
  End
  Else If (PgcSaldos.ActivePage = TbsSaldo) Then        //Saldo
  Begin
     //AL_26
     if dbGrdSaldos.CanFocus then
        dbGrdSaldos.SetFocus;
     PgcSaldos.ActivePage      := TbsSaldo;
     pnlSaldos.Height          := 39;
     pnlSaldos.Visible         := False;
     pnlSaldoSintetico.Visible := False;
     pnlSaldosDetalhes.Visible := True;
  end;

  //AL_25
  //AL_42
  If PgcSaldos.ActivePage = TbsResgate Then
     BtExcResg.Enabled := (QryResgate.RecordCount > 0);

end;

procedure TfrmCadLancamentoFundo.DbLkcFundoInvestExit(Sender: TObject);
Var
   dDtaLiq : TDateTime;
   iPz              : Integer;
   DadosCota        : TDadosCota;
begin
  inherited;

   If Trim(DbLkcFundoInvest.Text) = '' Then
      Exit;

   //AL_25
   // Preenche Decimais da Quantidade
   DbEdQtdOper.DecDigits   := QryFundoInvestAplic.FieldByName('QTDDECQTD').AsInteger;

   dDtaLiq := OperComum.DataPrazo(DbDtDataAplicacao.Date,
                        QryFundoInvestAplic.FieldByName('PZOLIQAPLIC').AsInteger);
   QryAplicacaoDATALIQUIDACAO.AsDateTime := dDtaLiq;

   QryAplicacaoVLRCOTA.DisplayFormat     :=
                 MontaMascaraDecVlr(QryFundoInvestAplicIDFUNDOINVEST.AsInteger);

   QryAplicacaoQTDOPERACAO.DisplayFormat :=
                 MontaMascaraDecQtd(QryFundoInvestAplicIDFUNDOINVEST.AsInteger);

   DbEdCota.DecDigits    := QryFundoInvestAplicQTDDECVALOR.AsInteger;

   DbEdQtdOper.DecDigits := QryFundoInvestAplicQTDDECQTD.AsInteger;

   DBeCETIPApl.Text      := QryFundoInvestAplic.FieldByName('CODFUNCETIP').AsString;

   QryAplicacaoDATACOTIZACAO.AsDateTime := OperComum.DataPrazo(DbDtDataAplicacao.Date,
                                                               QryFundoInvestAplic.FieldByName('PZOCOTAPLIC').AsInteger);
   // Busca dados da Cota
   DadosCota := UFundoComum.BuscaCotaFundo(QryAux,
                                           StrToInt(DbLkcFundoInvest.LookupValue),
                                           QryAplicacaoDATACOTIZACAO.AsDateTime);

   If (QryAplicacaoDATACOTIZACAO.AsDateTime =DbDtDataAplicacao.Date) And
      (DadosCota.DataCota = 0) Then
   Begin
      MsgDlg('Cota do Fundo não encontrada nesta data.','Mensagem de Sistema',mtWarning,[mbOk],0);
      DbLkcFundoInvest.Clear;
      Exit;
   End
   Else
   Begin
      DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
      DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;
      DbEdCota.Value     := DadosCota.VlrCota;
   End;
end;

procedure TfrmCadLancamentoFundo.BtOkResgClick(Sender: TObject);
Var
  //AL_25
  //AL_38
  sTipoOper, sMens : String;
  //AL_42
  iPedResgTx, iIdForCli, iPlanilha, iDocumento, iPlano, iFlgContaInvest, iTipoResgate : Integer;
  //AL_44
  fVlrTaxas, fVlrCustoAcoes, fVlrVarAcoes, fValorOperacao, fValorIR, fValorIOF : Currency;
  dDataOper, dDataLiq  : TDateTime;
  bConfirma : Boolean;
begin

  try

     //AL_42

     If bDelete Then
     Begin
        If Not VerificaResgate Then
           Exit;
     End;

     //AL_42
     fraMens.Mostra;
     fraMens.Max := 6;
     fraMens.Pos := 0;
     fraMens.Mes := 'Verificando período Contábil.';
     fraMens.Incrementa;

     //AL_18
     //AL_34
     if not CtrlInvContab.TestaPeriodo(dbDDataOperacao.Text, iTipoInvestUsu) then
     begin
        MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
        fraMens.Apaga;        
        Exit;
     end;

     //AL_37
     fraMens.Mes := 'Verificando os lançamentos do dia.';
     fraMens.Incrementa;

     // AL_49
     // Verifica se existem Transferência entre planos posterior a data a ser transferida
     If ufundocomum.VerificaTranferenciaPlanos( iTipoInvestUsu,
                                                QryFundoInvestResg.FieldByName('IDFUNDOINVEST').AsInteger,
                                                iPlanPrevCtbPatro,
                                                dbDDataOperacao.Date) then
     Begin
        MsgDlg('Já há Lançamentos de Transferências entre planos para o Fundo com data superior a data de operação'+'.'#13+
               'A operação não será efetuada!','Mensagem do Sistema',mtWarning,[mbOk],0);
        BtCancResgClick(Sender);
        Exit;
     End; // Fim AL_49

     If VerificaOperacao('D',QryFundoInvestResg.FieldByName('IDFUNDOINVEST').AsInteger,
                         dbDDataOperacao.Date,
                         StrToInt(DbLkcTipoOperacaoResg.LookupValue)) Then
     Begin
        MsgDlg('Já há lançamento de Resgate para o Fundo no dia '+dbDDataOperacao.Text+'.'#13+
               'A operação não será efetuada!','Informação',mtInformation,[mbOk],0);
        BtCancResgClick(Sender);
        Exit;
     End;

     //Ricardo Cristiano - 29/03/2010 - N. Sol 132943 -  N. Kintana 770596
     If VerificaOperacao('A',QryFundoInvestResg.FieldByName('IDFUNDOINVEST').AsInteger,
                         dbDDataOperacao.Date, 0) Then
     Begin
        MsgDlg('Já há lançamento de Aplicação para o Fundo no dia '+dbDDataOperacao.Text+'.'#13+
               'A operação não será efetuada!','Informação',mtInformation,[mbOk],0);
        BtCancResgClick(Sender);
        Exit;
     End;

     //AL_29
     if VerEmAbertura(QryFundoInvestResg.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
     begin
        BtCancResgClick(Sender);
        Exit;
     end;

     //AL_37
     fraMens.Mes := 'Verificando as aplicações atualizadas para Resgate .';
     fraMens.Incrementa;

     If Not VerificaAtualizacao(QryFundoInvestResg.FieldByName('IDFUNDOINVEST').AsInteger,
                                QryFundoInvestResg.FieldByName('DATAINICIOFUNDO').AsDateTime,
                                dbDDataOperacao.Date) Then
     Begin
        MsgDlg('O Saldo do Fundo contém uma aplicação não atualizada no dia '+dbDDataOperacao.Text+'.'#13+
               'Atualize o Saldo. A operação será Cancelada!','Informação',mtInformation,[mbOk],0);
        BtCancResgClick(Sender);
        Exit;
     End;

     fraMens.Mes := 'Efetuando o lançamento de Resgate.';
     fraMens.Incrementa;

     inherited;

     Try
       If not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

       DbLkcFundoInvestResg.Enabled := True;
       pnlAguardar.Visible          := True;

       //AL_45
       //AL_36
       iTipoResgate := 0;

       If bDelete Then
       Begin
          If DsResgate.State In [DsInsert] Then
             QryResgate.FieldByName('IDPEDIDOFUNDO').AsInteger:= LeUltRegistro(Nil,'PEDIDOFUNDO');

          QryResgate.FieldByName('IDTIPOINVEST').AsInteger      :=
                         QryFundoInvestResg.FieldByName('IDTIPOINVEST').AsInteger;

          QryResgate.FieldByName('IDTIPOFUNDOINVEST').AsInteger :=
                         QryFundoInvestResg.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

          QryResgate.FieldByName('IDTIPOOPERACAO').AsInteger    :=
                         QryTipoOperacao.FieldByName('IDTIPOOPERACAO').AsInteger;
          QryResgate.FieldByName('NATUREZAOPERACAO').AsString   :=
                         QryTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString;

          QryResgate.FieldByName('IDCARTEIRAINVEST').AsInteger  :=
                         QryFundoInvestResg.FieldByName('IDCARTEIRAINVEST').AsInteger;

          QryResgate.FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

          QryResgate.FieldByName('IDTIPORESGATE').AsInteger     := iTipoResgate;

          QryResgate.FieldByName('DATAAPLICACAO').Clear;

          //AL_42
          dDataOper   := QryResgate.FieldByName('DATAPEDIDO').AsDateTime;
          dDataLiq    := QryResgate.FieldByName('DATALIQUIDACAO').AsDateTime;
          iPedResgTx  := QryResgate.FieldByName('IDPEDIDOFUNDO').AsInteger;
          fVlrTaxas   := QryResgate.FieldByName('VLRTAXAS').AsFloat;
          QryResgate.FieldByName('VLRTAXAS').Clear;

          // Confirma Operacao
          QryResgate.Post;
          QryResgate.CommitUpdates;
       End;

       fraMens.Incrementa;

       iIdForCli   := OperComum.BuscaForCli(QryResgate.FieldByName('IDTIPOINVEST').AsInteger,
                                            QryFundoInvestResg.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                            QryResgate.FieldByName('IDTIPOOPERACAO').AsInteger,
                                            pRPI.IDTIPOCLIENTEEMI);
       iPlanilha    := -1;
       iDocumento   := -1;
       iPlano       := -1;

       //AL_44
       fValorIR  := 0;
       fValorIOF := 0;      

       //AL_30
       If (QryResgateDATAPEDIDO.AsDateTime >= QryResgateDATACOTIZACAO.AsDateTime) Then
       Begin
          fraMens.Incrementa;
          //Alt_1
          If Not ResgateFACFIF(QryResgate.FieldByName('IDTIPOINVEST').AsInteger,
                               QryResgate.FieldByName('IDPEDIDOFUNDO').AsInteger,
                               QryResgate.FieldByName('IDTIPOOPERACAO').AsInteger,
                               QryResgate.FieldByName('IDCARTEIRAINVEST').AsInteger,
                               QryResgate.FieldByName('IDFUNDOINVEST').AsInteger, -1,
                               QryResgate.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                               QryResgate.FieldByName('DATACOTIZACAO').AsDateTime,
                               QryResgate.FieldByName('DATAPEDIDO').AsDateTime,
                               QryResgate.FieldByName('DATALIQUIDACAO').AsDateTime,
                               0,
                               QryResgate.FieldByName('VLRPEDIDO').AsFloat,
                               0, fVlrCustoAcoes, fVlrVarAcoes, -1, iTipoResgate) Then
             //Al_16
             Raise Exception.Create('Não foi possível efetuar o Resgate, '+#13+
                                    'Esta operação será Cancelada.');
          fraMens.Incrementa;

          With DmFundoComum Do
          Begin
             fraMens.Mostra;
             fraMens.Mes := 'Confirmando a operação de Resgate.';
             fraMens.Pos := 0;

             OperComum.LimpaParametros(QryConfirmacao);
             QryConfirmacao.ParamByName('IDFUNDOINVEST').AsInteger     :=
                                        QryResgate.FieldByName('IDFUNDOINVEST').AsInteger;
             QryConfirmacao.ParamByName('IDTIPOOPERACAO').AsInteger    :=
                                        QryResgate.FieldByName('IDTIPOOPERACAO').AsInteger;
             QryConfirmacao.ParamByName('DATAOPERACAO').AsString       :=
                                        QryResgate.FieldByName('DATAPEDIDO').AsString;
             QryConfirmacao.ParamByName('DATACOTIZACAO').AsString      :=
                                        QryResgate.FieldByName('DATACOTIZACAO').AsString;
             QryConfirmacao.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                                        QryResgate.FieldByName('IDPLANPREVCTBPATR').AsInteger;
             //Al_20
             QryConfirmacao.ParamByName('IDPEDIDOFUNDO').AsInteger     :=
                                        QryResgate.FieldByName('IDPEDIDOFUNDO').AsInteger;
             QryConfirmacao.Open;

             fraMens.Max := QryConfirmacao.RecordCount+3;
             fraMens.Incrementa;

             //AL_42

             While Not QryConfirmacao.Eof Do
             Begin
                //AL_42
                //AL_38
                //Rotina de confirmação das operações                
                If Not AlimentaFundo(QryConfirmacaoIDTIPOINVEST.AsInteger,
                                     QryConfirmacaoIDTIPOOPERACAO.AsInteger,
                                     QryConfirmacaoIDCARTEIRAINVEST.AsInteger,
                                     QryConfirmacaoIDFUNDOINVEST.AsInteger,
                                     iPlanoPrevContab,
                                     iPatrocinadora,
                                     QryConfirmacaoIDOPERACAOFUNDO.AsInteger,
                                     QryConfirmacaoIDOPERACAOORIGEM.AsInteger,
                                     QryConfirmacaoQTDDECQTD.AsInteger,
                                     QryConfirmacaoIDTIPOFUNDOINVEST.AsInteger,
                                     iIdForCli,
                                     QryConfirmacaoDATAOPERACAO.AsDateTime,
                                     QryConfirmacaoDATACOTIZACAO.AsDateTime,
                                     QryConfirmacaoDATALIQUIDACAO.AsDateTime,
                                     QryConfirmacaoQTDOPERACAO.AsFloat,
                                     QryConfirmacaoVLRCOTA.AsFloat,
                                     QryConfirmacaoVLRLIQUIDO.AsFloat,
                                     QryConfirmacaoVLRIR.AsFloat,
                                     QryConfirmacaoVLRIOF.AsFloat,
                                     QryTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString,
                                     QryTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                                        QryConfirmacaoDESCFUNDOINVEST.AsString,
                                     'OPE' , False {True}, iPlanPrevCtbPatro,-1,-1,
                                     QryConfirmacaoVLRRENDIMENTO.AsFloat, sMens) Then
                begin
                   //AL_38
                   //Al_16                   
                   if sMens <> '' then
                      Raise Exception.Create('Não foi possível confirmar o Resgate' + #13 +'Mensagem: ' + sMens)
                   else
                      Raise Exception.Create('Não foi possível confirmar o Resgate' + #13 +
                                             'Ocorreu um problema durante o processo de gravação' + #13 + 'Refaça a operação');
                end;

                fValorIR       := fValorIR + QryConfirmacaoVLRIR.AsFloat;
                //AL_44
                fValorIOF      := fValorIOF + QryConfirmacaoVLRIOF.AsFloat;

                ExecutaQuery(QryAux,'UPDATE OPERACAOFUNDO SET STACONFIRMA = ''S'' WHERE '+
                                    '(IDOPERACAOFUNDO   = '''+
                                      IntToStr(QryConfirmacaoIDOPERACAOFUNDO.AsInteger)  +''')');
                QryAux.Close;

                QryConfirmacao.Next;

                fraMens.Incrementa;

             End;

             QryConfirmacao.Close;

             //AL_42

             If iTipoInvestUsu <> 6 Then
             Begin
                fVlrCustoAcoes := 0;
                fVlrVarAcoes   := 0;
             End;

             //AL_42

          End;
       End
       Else
       Begin
          //AL_39
          If Not ResgateFACFIF(QryResgate.FieldByName('IDTIPOINVEST').AsInteger,
                               QryResgate.FieldByName('IDPEDIDOFUNDO').AsInteger,
                               QryResgate.FieldByName('IDTIPOOPERACAO').AsInteger,
                               QryResgate.FieldByName('IDCARTEIRAINVEST').AsInteger,
                               QryResgate.FieldByName('IDFUNDOINVEST').AsInteger, -1,
                               QryResgate.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                               QryResgate.FieldByName('DATACOTIZACAO').AsDateTime,
                               QryResgate.FieldByName('DATAPEDIDO').AsDateTime,
                               QryResgate.FieldByName('DATALIQUIDACAO').AsDateTime,
                               0,
                               QryResgate.FieldByName('VLRPEDIDO').AsFloat,
                               0, fVlrCustoAcoes, fVlrVarAcoes, -1, iTipoResgate) Then
             Raise Exception.Create('Não foi possível efetuar o Resgate, '+#13+ 'Esta operação será Cancelada.');
       End;
       //AL_42

       fraMens.Mes := 'Integração Contábil e Financeira.';
       fraMens.Incrementa;

       //AL_42
       //Al_3       
       If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                       QryResgate.FieldByName('IDTIPOOPERACAO').AsInteger,
                                       QryResgate.FieldByName('IDTIPOINVEST').AsInteger,
                                       QryResgate.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                       QryResgate.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                       iIdForCli,
                                       QryResgate.FieldByName('IDFUNDOINVEST').AsInteger,
                                       StrToDate(dbDDataOperacao.Text),
                                       QryResgate.FieldByName('DATALIQUIDACAO').AsDateTime,
                                       'OPE',
                                       QryTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString,
                                       DbLkcFundoInvestResg.Text+' / '+sPlanPrevCtbPatro,
                                       True,
                                       QryResgate.FieldByName('VLRPEDIDO').AsFloat,
                                       fValorIR, 0, 0, 0,
                                       fVlrCustoAcoes, fVlrVarAcoes, -1, 0, 0, 0,
                                       QryTipoOperacao.FieldByName('FLGCONTAINVEST').AsInteger,
                                       0, 0, fValorIOF) Then
       begin
          //Al_17
          If dtmBaseDados.dbBaseDados.InTransaction then
             dtmBaseDados.dbBaseDados.Rollback;
          BtCancResgClick(Sender);
          Exit;
       end;

       fraMens.Incrementa;

       With QryUpdPedido Do
       Begin
          //AL_42
          OperComum.LimpaParametros(QryUpdPedido);
          ParamByName('IDPEDIDOFUNDO').AsInteger        := QryResgate.FieldByName('IDPEDIDOFUNDO').AsInteger;
          //AL_31
          If iPlano <> -1 then
             ParamByName('PLANO').AsInteger             := iPlano
          Else
             ParamByName('PLANO').Clear;

          If iPlanilha <> -1 then
             ParamByName('PLNCODIGO').AsInteger         := iPlanilha
          Else
             ParamByName('PLNCODIGO').Clear;

          If iDocumento <> -1 then
             ParamByName('CODDOCUMENTO').AsInteger      := iDocumento
          Else
             ParamByName('CODDOCUMENTO').Clear;

          ExecSQL;
          Close;
       End;       

       //AL_42
       if fVlrTaxas <> 0 then
       begin
          QryAplicacao.Insert;
          QryAplicacao.FieldByName('IDOPERACAOFUNDO').AsInteger  := LeUltRegistro(Nil,'OPERACAOFUNDO');

          QryAplicacao.FieldByName('IDTIPOINVEST').AsInteger     := iTipoInvestUsu;
          QryAplicacao.FieldByName('IDPLANPREVCTBPATR').AsInteger:= iPlanPrevCtbPatro;

          QryAplicacao.FieldByName('IDTIPOOPERACAO').AsInteger   := qryTipoOperResgTx.FieldByName('IDTIPOOPERACAO').AsInteger;

          if not QryFundoInvestResg.FieldByName('IDCARTEIRAINVEST').IsNull then
             QryAplicacao.FieldByName('IDCARTEIRAINVEST').AsInteger :=
                                    QryFundoInvestResg.FieldByName('IDCARTEIRAINVEST').AsInteger;

          QryAplicacao.FieldByName('IDFUNDOINVEST').AsInteger    := QryFundoInvestResg.FieldByName('IDFUNDOINVEST').AsInteger;

          QryAplicacao.FieldByName('DATAOPERACAO').AsDateTime    := dDataOper;
          QryAplicacao.FieldByName('DATALIQUIDACAO').AsDateTime  := dDataLiq;
          QryAplicacao.FieldByName('IDPEDIDOFUNDO').AsInteger    := iPedResgTx;
          QryAplicacao.FieldByName('VLRTAXAS').AsFloat           := fVlrTaxas;

          DBEVlrTxSaida.Value := fVlrTaxas;

          iIdForCli   := OperComum.BuscaForCli(iTipoInvestUsu,
                                               QryFundoInvestResg.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                               qryTipoOperResgTx.FieldByName('IDTIPOOPERACAO').AsInteger,
                                               pRPI.IDTIPOCLIENTEEMI);
          iPlanilha   := -1;
          iDocumento  := -1;
          iPlano      := -1;

          if Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                          QryAplicacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                                          QryAplicacao.FieldByName('IDTIPOINVEST').AsInteger,
                                          QryFundoInvestResg.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                          QryFundoInvestResg.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                          iIdForCli,
                                          QryAplicacao.FieldByName('IDFUNDOINVEST').AsInteger,
                                          QryAplicacao.FieldByName('DATAOPERACAO').AsDateTime,
                                          QryAplicacao.FieldByName('DATALIQUIDACAO').AsDateTime,
                                          qryTipoOperResgTx.FieldByName('TIPOMOVTO').AsString,
                                          qryTipoOperResgTx.FieldByName('NATUREZAOPERACAO').AsString,
                                          QryFundoInvestAplic.FieldByName('DESCFUNDOINVEST').AsString+' / '+sPlanPrevCtbPatro,
                                          True, DBEVlrTxSaida.Value,
                                          0, 0, 0, 0, 0, 0, -1, 0, 0, 0,
                                          qryTipoOperResgTx.FieldByName('FLGCONTAINVEST').AsInteger) Then
          begin
             If dtmBaseDados.dbBaseDados.InTransaction then
                DtmBaseDados.dbBaseDados.Rollback;
             BtCancResgClick(Sender);
             Exit;
          end;
          // Confirma Operacao
          QryAplicacao.Post;
          QryAplicacao.CommitUpdates;

          With QryUpdOperacaoApl Do
          Begin
             OperComum.LimpaParametros(QryUpdOperacaoApl);
             ParamByName('IDOPERACAOFUNDO').AsInteger      := QryAplicacao.FieldByName('IDOPERACAOFUNDO').AsInteger;
             If iPlano > 0 then
                ParamByName('PLANO').AsInteger             := iPlano
             Else
                ParamByName('PLANO').Clear;

             If iPlanilha > 0 then
                ParamByName('PLNCODIGO').AsInteger         := iPlanilha
             Else
                ParamByName('PLNCODIGO').Clear;

             If iDocumento > 0 then
                ParamByName('CODDOCUMENTO').AsInteger      := iDocumento
             Else
                ParamByName('CODDOCUMENTO').Clear;
             ExecSQL;
             Close;
          End;         

       end;

       fraMens.Incrementa;

       //Confirma Transação
       If bDelete Then Begin
          If dtmBaseDados.dbBaseDados.InTransaction then
             dtmBaseDados.dbBaseDados.Commit;
       End;

       bConfirma := True;       

       QryTipoFundoInvest.Close;
       QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                                             QryFundoInvestResg.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
       QryTipoFundoInvest.Open;

       fraMens.Apaga;

       If StrToDate(dbDDataOperacao.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
       begin
          //Alt_3
          If Not Reprocessamento(iTipoInvestUsu,
                                 QryFundoInvestResg.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                 QryFundoInvestResg.FieldByName('IDFUNDOINVEST').AsInteger,
                                 iPlanPrevCtbPatro,
                                 StrToDate(dbDDataOperacao.Text),
                                 QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                 QryFundoInvestResg.FieldByName('DTAINIPROC').AsDateTime,
                                 True) Then
           begin
              MsgDlg('Atenção : A Operação foi concluída com sucesso!'+#13+
                     'Mas o Reprocessamento foi cancelado!'+#13+
                     'Faça o Reprocessamento para esse Fundo, a partir desse dia!',
                     'Mensagem do Sistema', MtInformation,[MbOk],0);
              bConfirma := False;
           end;
       end;

     Except
       On E:Exception Do Begin
         //Al_16/Al_17
         MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);

         If dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Rollback;
         bConfirma := False;
       End;
     End;

     QryTipoFundoInvest.Close;

     fraMens.Apaga;

     pnlSaldos.Visible := False;

     If bDelete Then
     Begin
        If QryResgateDATAPEDIDO.AsDateTime > 0 Then
           DtEdDataReferenciaGeral.Date := QryResgateDATAPEDIDO.AsDateTime;

        //AL_42
        if fVlrTaxas <> 0 then
           PreencheAplicacao;

        PreencheResgate;

        BuscaSaldos;

        // Volta Ambiente
        pnlDadosBase.Enabled := True;
        DbGrdrResgate.BringToFront;

        BtIncResg.Enabled := False;
        BtExcResg.Enabled := False;
        Dock974.Visible   := False;

        AcertaBotoesResgate;

        pnlAguardar.Visible := False;

        if bConfirma then
           MsgDlg('Processo Concluído!','Mensagem do Sistema',mtInformation ,[mbOk],0);

     End;

     bDelete := False;

   finally
      if TDisp <> nil then
        TDisp.Continuar;
   end;
end;

procedure TfrmCadLancamentoFundo.BtCancResgClick(Sender: TObject);
begin
  inherited;
  try
     //Al_14
     If dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Rollback;
     //AL_25
     //Al_14

     fraMens.Apaga;

     bDelete           := False;

     pnlSaldos.Visible := False;

     DbLkcFundoInvestResg.Enabled := True;

     // Volta Ambiente
     DbGrdrResgate.BringToFront;
     pnlDadosBase.Enabled := True;

     if BtAltResg.Tag = 1 then
     begin
        BtAltResg.Tag := 0;
        AcertaBotoesConsResg;
     end else
        AcertaBotoesResgate;

     Dock974.Visible   := False;

     // Refresh
     PreencheResgate;

     //AL_42
     BtExcResg.Enabled   := (QryResgate.RecordCount > 0);

     with QrySaldoFundoTotal do
     begin
        OperComum.LimpaParametros(QrySaldoFundoTotal);

        if Trim(DbLkcSaldo.Text) <> '' then
           ParamByName('IDFUNDOINVEST').AsString := DbLkcSaldo.LookupValue;

        if Trim(DbDtRefSaldo.Text) <> '' then
           ParamByName('DATAMOVFUNDO').AsString  := DbDtRefSaldo.Text;

        if Trim(DbDtRefAplc.Text) <> '' then
        begin
           If CbxAplic.ItemIndex = 1 Then
           begin
              ParamByName('DATAAPLICACAO').AsString := DbDtRefAplc.Text;
              ParamByName('TIPOMENOR').AsInteger    := CbxAplic.ItemIndex;
           end
           Else If CbxAplic.ItemIndex = 2 Then
           begin
              ParamByName('DATAAPLICACAO').AsString := DbDtRefAplc.Text;
              ParamByName('TIPOMAIOR').AsInteger    := CbxAplic.ItemIndex;
           end;
        end;

        if DblTipoFundo.Text <> ''  then
           ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

        if dblGestorCarteira.Text <> '' then
           ParamByName('IDGESTORCARTEIRA').AsInteger  := qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;

        ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
        ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
        Open;
     End;
   finally
      if TDisp <> nil then
         TDisp.Continuar;
   end;
end;

procedure TfrmCadLancamentoFundo.DbLkcFundoInvestResgExit(Sender: TObject);
Var
  dDtaLiq    : TDateTime;
  DadosCota  : TDadosCota;
begin
   OperComum.LimpaParametros(QrySaldoFundoTotal);

   DBReQtdBloq.Clear;
   DBReQtd.Clear;
   DBReBruto.Clear;
   DBReIOF.Clear;
   DBReIRRF.Clear;
   DBReLiq.Clear;

   inherited;

   If Trim(DbLkcFundoInvestResg.Text) <> '' Then
   Begin
      //AL_25
      dDtaLiq := OperComum.DataPrazo(dbDDataOperacao.Date, QryFundoInvestResg.FieldByName('PZOLIQRESG').AsInteger);

      QryResgateDATALIQUIDACAO.AsDateTime := dDtaLiq;

      dbDDataLiquidacaoResg.Date          := dDtaLiq;

      DBeCETIPResg.Text       := QryFundoInvestResg.FieldByName('CODFUNCETIP').AsString;

      DbEdCotaResg.DecDigits  := QryFundoInvestResgQTDDECVALOR.AsInteger;

      //AL_28
      DBReQtd.DecDigits       := QryFundoInvestResgQTDDECQTD.AsInteger;      
      DBReQtdBloq.DecDigits   := QryFundoInvestResgQTDDECQTD.AsInteger;      

      With QrySaldoFundoTotal Do
      Begin
        Close;
        ParamByName('IDTIPOINVEST').AsInteger       := iTipoInvestUsu;
        ParamByName('IDPLANPREVCTBPATR').AsInteger  := iPlanPrevCtbPatro;
        ParamByName('IDFUNDOINVEST').AsString       := DbLkcFundoInvestResg.LookupValue;
        ParamByName('DATAMOVFUNDO').AsString        := dbDDataOperacao.Text;

        ParamByName('IDTIPOFUNDOINVEST').AsInteger  :=
                     QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
        If DblTipoFundo.Text = ''  Then
           ParamByName('IDTIPOFUNDOINVEST').Clear;

        ParamByName('IDGESTORCARTEIRA').AsInteger  :=
                     qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
        If dblGestorCarteira.Text = ''  Then
           ParamByName('IDGESTORCARTEIRA').Clear;

        Open;
      End;

      QryResgateDATACOTIZACAO.AsDateTime := OperComum.DataPrazo(dbDDataOperacao.Date,
                           QryFundoInvestResg.FieldByName('PZOCOTRESG').AsInteger);

      DadosCota := BuscaCotaFundo(QryAux,
                                  StrToInt(DbLkcFundoInvestResg.LookupValue),
                                  QryResgateDATACOTIZACAO.AsDateTime);

      DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
      DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;

      If (QryResgateDATACOTIZACAO.AsDateTime = dbDDataOperacao.Date) And
         (DadosCota.DataCota = 0) Then
      Begin
         MsgDlg('Cota do Fundo não encontrada nesta data.', 'Mensagem de Sistema', mtWarning, [mbOk],0);
         DbLkcFundoInvestResg.Clear;
         if DbLkcFundoInvestResg.CanFocus Then
            DbLkcFundoInvestResg.SetFocus;
      End
      Else
      Begin
         DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
         DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;
         DbEdCotaResg.Value := DadosCota.VlrCota;
      End;

      if DBReQtd.Value <= 0 Then
      begin
         MsgDlg('Não há saldo para realizar o Resgate. Verifique!',
                'Informação',mtInformation,[mbOk],0);

         DbLkcFundoInvestResg.Clear;

         if DbLkcFundoInvestResg.CanFocus Then
            DbLkcFundoInvestResg.SetFocus;
      end;
   end;
end;

procedure TfrmCadLancamentoFundo.BtIncResgClick(Sender: TObject);
begin
  if ActiveControl = DtEdDataReferenciaGeral then
     SelectNext(ActiveControl,True,True);

  if TDisp <> nil then
     TDisp.Suspender;

  bDelete  := True;

  QrySaldoFundoTotal.Close;

//AL_25
  //AL_24
  DbLkcFundoInvestResg.Clear;
  DbLkcTipoOperacaoResg.Clear;
  DbEdCotaResg.Clear;
  DBeCETIPResg.Clear;
  DBReQtdBloq.Clear;
  DBReQtd.Clear;
  DBReBruto.Clear;
  DBReIOF.Clear;
  DBReIRRF.Clear;
  DBReLiq.Clear;

  inherited;
//AL_25
// Testa dados
  If (QryResgate.Active = False) Then
  Begin
    MsgDlg('Consulta não foi executada.', 'Mensagem de Sistema', mtWarning,[mbOk],0);
    BtIncAplic.Down := False;
    Exit;
  End;

  Dock974.Visible :=True;

  PnlResgate.BringToFront;

  AcertaBotoesResgate;

  pnlDadosBase.Enabled  := False;

  //Ricardo Cristiano - 29/03/2010 - N. Sol 132943 -  N. Kintana 770596

  tbsDadosResg.Enabled  := True;
  tbsObsResg.Enabled    := True;
  //AL_42
  tbsDadosResgTx.Enabled:= (iTipoInvestUsu = 6);
  BtExcResg.Enabled     := False;

  //Ricardo Cristiano - 29/03/2010 - N. Sol 132943 -  N. Kintana 770596
  pgcResgate.ActivePage := tbsDadosResg;  

// Insere Registro
  QryResgate.Append;
  QryResgateDATAPEDIDO.AsDateTime       := DtEdDataReferenciaGeral.Date;
  QryResgateIDPLANPREVCTBPATR.AsInteger := iPlanPrevCtbPatro;

  if dbDDataOperacao.Canfocus then
     dbDDataOperacao.SetFocus;

  pnlSaldos.Height  := 62;
  pnlSaldos.Visible := True;
  pnlSaldoSintetico.Visible := True;
  pnlSaldosDetalhes.Visible := True;

end;

procedure TfrmCadLancamentoFundo.BtExcResgClick(Sender: TObject);
Var
  iTipoFundoInvest, iFundoInvest : Integer;
  dDataIniProc, dDataOper : TDateTime;
  bConfirma : Boolean;
begin
  inherited;
  bDelete := False;
// Testa dados
//AL_25
  If (QryResgate.Active = False) Or (QryResgate.IsEmpty = True) Then Begin
    MsgDlg('Consulta não foi executada.', 'Mensagem de Sistema', mtWarning, [mbOk],0);
    BtExcResg.Down := False;
    Exit;
  End;

  //AL_18
  //AL_34
  if not CtrlInvContab.TestaPeriodo(QryResgate.FieldByName('DATAPEDIDO').AsString, iTipoInvestUsu) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem de Sistema', mtWarning,[mbOk],0);
     BtExcResg.Down := False;
     Exit;
  End;

  //AL_29
  if VerEmAbertura(QryResgate.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
  begin
     BtExcResg.Down := False;
     Exit;
  end;

  //AL_38
  try // Finally - Controle do Status do Form (Botoes e etc...)

     If MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,
               [mbYes, mbNo],0) = mrYes
     Then Begin

        pnlAguardar.Visible := True;

        Try
           // Inicia Transação
           If not dtmBaseDados.dbBaseDados.InTransaction then
              dtmBaseDados.dbBaseDados.StartTransaction;

           fraMens.Mostra;
           fraMens.Max := 5;
           fraMens.Pos := 0;
           fraMens.Mes := ' Excluíndo o lançamento de $ '+
                          FloatToStrF(QryResgate.FieldByName('VLRPEDIDO').AsFloat,ffNumber,18,2);
           fraMens.Incrementa;

           QryTipoFundoInvest.Close;
           QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                              QryResgate.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
           QryTipoFundoInvest.Open;
           iTipoFundoInvest := QryResgate.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
           iFundoInvest     := QryResgate.FieldByName('IDFUNDOINVEST').AsInteger;
           dDataOper        := QryResgate.FieldByName('DATAPEDIDO').AsDateTime;
           //Alt_4
           dDataIniProc     := QryResgate.FieldByName('DTAINIPROC').AsDateTime;

           fraMens.Incrementa;

           //AL_38
           If Not ExcluiResgate(QryResgate.FieldByName('IDPEDIDOFUNDO').AsInteger, False) Then
              Raise Exception.Create('Ocorreu um problema ao excluir a operação');

           fraMens.Incrementa;

           If Not ProcExcluiFundoFilhasRes(QryResgate.FieldByName('IDFUNDOINVEST').AsInteger,
                                           QryResgate.FieldByName('IDTIPOOPERACAO').AsInteger,
                                           QryResgate.FieldByName('DATAPEDIDO').AsDateTime) Then
           begin
              //Al_17
              If dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.Rollback;
              BtCancResgClick(Sender);
              Exit;
           end;

           fraMens.Incrementa;

           If dtmBaseDados.dbBaseDados.InTransaction then
              dtmBaseDados.dbBaseDados.Commit;

           bConfirma := True;

           PreencheResgate;

           fraMens.Incrementa;

           fraMens.Apaga;

           If dDataOper <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
           begin
              //Alt_4
              //Alt_3
              If Not Reprocessamento(iTipoInvestUsu, iTipoFundoInvest, iFundoInvest, iPlanPrevCtbPatro,
                                     dDataOper,
                                     QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                     dDataIniProc,
                                     True) Then
               begin
                  MsgDlg('Atenção : A Operação foi concluída com sucesso!'+#13+
                         'Mas o Reprocessamento foi cancelado!'+#13+
                         'Faça o Reprocessamento para esse Fundo, a partir desse dia!',
                         'Mensagem do Sistema', MtInformation,[MbOk],0);
                  bConfirma := False;
               end;
           end;

           QryTipoFundoInvest.Close;

           BuscaSaldos;
           //AL_38
           if bConfirma then
              MsgDlg('Processo Concluído.','Mensagem do Sistema',mtInformation ,[mbOk],0);

        Except
           On E:Exception Do Begin
              //Al_16
              MsgDlg('Não foi possível excluir a Operação:'+#13+
                     E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);

              BtExcResg.Down      := False;
              pnlAguardar.Visible := False;

              If dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.Rollback;

              QryTipoFundoInvest.Close;

              BtCancResgClick(Sender);

              bConfirma := False;
           End;

       End; // Except

     End; // If Exclui
  finally
     pnlAguardar.Visible  := False;
     BtIncResg.Enabled    := True;
     BtExcResg.Down       := False;
     //AL_42
     BtExcResg.Enabled    := (QryResgate.RecordCount > 0);
  end;
end;

procedure TfrmCadLancamentoFundo.sbtnExecResgateClick(Sender: TObject);
begin
  inherited;
   WindowState := wsMinimized;
   AbrirForm(frmProcResgates, TfrmProcResgates, False);
end;

//AL_25
function TfrmCadLancamentoFundo.VerificaOperacao(sTipoOperacao : String;
                                                 iFundo        : Integer;
                                                 dData         : TDateTime;
                                                 iTipoOperacao : Integer = 0) : Boolean;
begin
   OperComum.LimpaParametros(QryVerificaOperacao);
   QryVerificaOperacao.ParamByName('IDTIPOINVEST').AsInteger     := iTipoInvestUsu;
   QryVerificaOperacao.ParamByName('IDFUNDOINVEST').AsInteger    := iFundo;
   QryVerificaOperacao.ParamByName('DATAOPERACAO').AsString      := DateToStr(dData);
   QryVerificaOperacao.ParamByName('NATUREZAOPERACAO').AsString  := sTipoOperacao;
   if iTipoOperacao <> 0 then
      QryVerificaOperacao.ParamByName('IDTIPOOPERACAO').AsInteger:= iTipoOperacao;
   QryVerificaOperacao.ParamByName('IDPLANPREVCTBPATR').AsInteger:= iPlanPrevCtbPatro;
   QryVerificaOperacao.Open;
   If QryVerificaOperacao.Eof Then
      Result := False
   Else
      Result := True;
end;
//AL_25

procedure TfrmCadLancamentoFundo.DtEdDataReferenciaGeralExit(Sender: TObject);
begin
  inherited;
   //AL_26
   if wDataRef  <> StrToDate(DtEdDataReferenciaGeral.Text) then
   begin
      wDataRef  := StrToDate(DtEdDataReferenciaGeral.Text);

      //AL_25
      AbreQryFundoInvestOperacao;

      AbreQryFundoInvestAplic;

      AbreQryFundoInvestResg;

      ProcuraAplResg;

      BuscaSaldos;

      pnlSaldos.Visible := False;
      If (QryResgate.RecordCount > 0) Then
         PgcSaldos.ActivePage := TbsResgate
      Else If QryAplicacao.RecordCount > 0 Then
         PgcSaldos.ActivePage := TbsAplicacao
      Else
         PgcSaldos.ActivePage := TbsSaldo;

      try
         if DtEdDataReferenciaGeral.DateTime <> 0 then
            dmDisponibilidade.DataRef := DtEdDataReferenciaGeral.DateTime
         else if Trim(DtEdDataReferenciaGeral.Text) <> '' then
            dmDisponibilidade.DataRef := StrToDate(DtEdDataReferenciaGeral.Text)
         else
            dmDisponibilidade.DataRef := Date;
      except
         dmDisponibilidade.DataRef    := Date;
      end;

      if TDisp <> nil then
         TDisp.Continuar;
   end;
end;

function TfrmCadLancamentoFundo.VerificaAplicacao : Boolean;
Begin
// Testa Dados
  If Trim(DbLkcFundoInvest.Text) = '' Then Begin
    MsgDlg('Indique o Fundo de Investimento.', 'Mensagem de Sistema', mtWarning,[mbOk],0);
    if DbLkcFundoInvest.CanFocus then
       DbLkcFundoInvest.SetFocus;
    Result := False;
    Exit;
  End;

  If DbDtDataAplicacao.Date = 0 Then Begin
    MsgDlg('Data da Aplicação não está preenchida.', 'Mensagem do Sistema', mtWarning,[mbOk],0);
    if DbDtDataAplicacao.CanFocus then
       DbDtDataAplicacao.SetFocus;
    Result := False;
    Exit;
  End;

  //AL_34
  //AL_18
  if not CtrlInvContab.TestaPeriodo(DbDtDataAplicacao.Text, iTipoInvestUsu) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', mtWarning,[mbOk],0);
     if DbDtDataAplicacao.CanFocus then
        DbDtDataAplicacao.SetFocus;
     Result := False;
     Exit;
  End;

  If DbDtDataLiquidacao.Date = 0 Then Begin
    MsgDlg('Data da Liquidação não está preenchida.', 'Mensagem do Sistema', mtWarning,[mbOk],0);
    if DbDtDataLiquidacao.CanFocus then
       DbDtDataLiquidacao.SetFocus;
    Result := False;
    Exit;
  End;

  If DbEdValorAplic.Value <= 0 Then Begin
    MsgDlg('Valor Aplicado não pode ser menor ou igual a zero.', 'Mensagem do Sistema', mtWarning,[mbOk],0);
    if DbEdValorAplic.CanFocus then
       DbEdValorAplic.SetFocus;
    Result := False;
    Exit;
  End;

  If (QryAplicacaoDATAOPERACAO.AsDateTime = QryAplicacaoDATACOTIZACAO.AsDateTime) Then
  Begin
    If DbEdQtdOper.Value <= 0 Then Begin
       MsgDlg('Quantidade Operada não pode ser menor que zero.', 'Mensagem do Sistema', mtWarning,[mbOk],0);
       if DbEdValorAplic.CanFocus then
          DbEdValorAplic.SetFocus;
       Result := False;
       Exit;
    End;
  End;

  if Length(QryAplicacaoOBSERVACAO.AsString) > 300 then
  begin
     MsgDlg('A texto da observação é maior do que o tamanho máximo de armazenamento','Aviso', mtWarning, [mbOk], 0);
     if dbeObsApl.CanFocus then
        dbeObsApl.SetFocus;
     Result := False;
     Exit;
  end;

  if Length(QryResgateOBSERVACAO.AsString) > 300 then
  begin
     MsgDlg('A texto da observação é maior do que o tamanho máximo de armazenamento','Aviso', mtWarning, [mbOk], 0);
     if dbeObsResg.CanFocus then
        dbeObsResg.SetFocus;
     Result := False;
     Exit;
  end;

  //AL_42
  if DBEVlrTxIngresso.Value <> 0 then
  begin
     if qryTipoOperAplTx.IsEmpty then
     begin
        MsgDlg('Não foi cadastrado o tipo de operação -176 da Taxa de Ingresso.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
        if DBEVlrTxIngresso.CanFocus then
           DBEVlrTxIngresso.SetFocus;
        Result := False;
        Exit;
     end;
  end;

  Result := True;
End;

function TfrmCadLancamentoFundo.VerificaResgate : Boolean;
Begin
// Testa Dados
  If Trim(DbLkcFundoInvestResg.Text) = '' Then Begin
    MsgDlg('Indique o Fundo de Investimento.','Messagem do Sistema',mtWarning,[mbOk],0);
    if DbLkcFundoInvestResg.CanFocus then
       DbLkcFundoInvestResg.SetFocus;
    Result := False;
    Exit;
  End;
//AL_25
  If Trim(DbLkcTipoOperacaoResg.Text) = '' Then Begin
    MsgDlg('Indique o Tipo de Operação.','Messagem do Sistema',mtWarning,[mbOk],0);
    if DbLkcTipoOperacaoResg.CanFocus then
       DbLkcTipoOperacaoResg.SetFocus;
    Result := False;
    Exit;
  End;

  If dbDDataOperacao.Date = 0 Then Begin
    MsgDlg('Data da Operação não está preenchida.','Messagem do Sistema',mtWarning,[mbOk],0);
    if dbDDataOperacao.CanFocus then
       dbDDataOperacao.SetFocus;
    Result := False;
    Exit;
  End;

  If dbDDataLiquidacaoResg.Date = 0 Then Begin
    MsgDlg('Data da Liquidação não está preenchida.','Messagem do Sistema',mtWarning,[mbOk],0);
    if dbDDataLiquidacaoResg.CanFocus then
       dbDDataLiquidacaoResg.SetFocus;
    Result := False;
    Exit;
  End;

  If DbRValorLiquido.Value <= 0 Then Begin
    MsgDlg('Valor Líquido não pode ser menor ou igual a zero.','Messagem do Sistema',mtWarning,[mbOk],0);
    if DbRValorLiquido.CanFocus then
       DbRValorLiquido.SetFocus;
    Result := False;
    Exit;
  End;

  //AL_32
  If DbEdCotaResg.Value = 0 Then Begin
    MsgDlg('Valor da Cota não pode igual a zero.','Messagem do Sistema',mtWarning,[mbOk],0);
    if DbEdCotaResg.CanFocus then
       DbEdCotaResg.SetFocus;
    Result := False;
    Exit;
  End;

  //AL_42
  if DBEVlrTxSaida.Value <> 0 then
  begin
     if qryTipoOperResgTx.IsEmpty then
     begin
        MsgDlg('Não foi cadastrado o tipo de operação -177 da Taxa de Saída.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
        if DBEVlrTxSaida.CanFocus then
           DBEVlrTxSaida.SetFocus;
        Result := False;           
        Exit;
     end;
  end;

  Result := True;
End;

//AL_25
procedure TfrmCadLancamentoFundo.BtIncAplicClick(Sender: TObject);
begin
  inherited;
  if ActiveControl = DtEdDataReferenciaGeral then
     SelectNext(ActiveControl,True,True);

  if TDisp <> nil then
     TDisp.Suspender;

  // Testa dados
  If (QryAplicacao.Active = False) Then Begin
    MsgDlg('Consulta não foi executada.','Mensagem do Sistema',mtWarning,[mbOk],0);
    BtIncAplic.Down := False;
    Exit;
  End;

  // Al_18
  // Prepara Ambiente
  Dock978.Visible     := True;
//AL_25
  PnlAplicacao.BringToFront;

  AcertaBotoesAplicacao;

   //Ricardo Cristiano - 29/03/2010 - N. Sol 132943 -  N. Kintana 770596

  //AL_42
  tbsDadosAplTx.Enabled:= (iTipoInvestUsu = 6);

  tbsObsApl.Enabled    := True;

  tbsDadosApl.Enabled  := True;

  //Ricardo Cristiano - 29/03/2010 - N. Sol 132943 -  N. Kintana 770596

  pgcAplicacao.ActivePage := tbsDadosApl;

  pnlDadosBase.Enabled := False;

  BtExcAplic.Enabled   := False;  

  // Insere Registro
  QryAplicacao.Append;
  QryAplicacaoDATAOPERACAO.AsDateTime   := DtEdDataReferenciaGeral.Date;

  if DbDtDataAplicacao.CanFocus then
     DbDtDataAplicacao.SetFocus;


end;

procedure TfrmCadLancamentoFundo.MnuPatrimonioClick(Sender: TObject);
begin
   inherited;

   AbreQryFundoInvestoperacao;

   // busca fundo que não tiveram aplicacao neste dia.
   With QryVerSaldosFundos Do
   Begin
     Close;
//AL_25
     ParamByName('DATAMOVFUNDO').AsString       := DtEdDataReferenciaGeral.Text;
     ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
     ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;

     ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
     If DblTipoFundo.Text = ''  Then
        ParamByName('IDTIPOFUNDOINVEST').Clear;

     ParamByName('IDGESTORCARTEIRA').AsInteger  := qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
     If dblGestorCarteira.Text = ''  Then
        ParamByName('IDGESTORCARTEIRA').Clear;
     Open;
   End;

   If (QryFundoInvestOperacao.RecordCount > 1) And (QryVerSaldosFundos.Recordcount > 1) Then
      AbrirForm(frmGraficoPatrimonial, TfrmGraficoPatrimonial, False)
   Else If (QryFundoInvestOperacao.RecordCount = 1) Or
           (QryVerSaldosFundos.Recordcount     = 1)    Then
      MsgDlg('Não será formado o gráfico, só há um Fundo para essa consulta.','Mensagem do Sistema',mtInformation,[mbOk],0)
   Else
      MsgDlg('Não há Fundos nessa consulta para formar o gráfico.','Mensagem do Sistema',mtInformation,[mbOk],0);
end;

procedure TfrmCadLancamentoFundo.MnuRentCotasClick(Sender: TObject);
begin
  inherited;
    AbrirForm(frmGrafRentabilidadeCotas, TfrmGrafRentabilidadeCotas, False)
end;

Function TfrmCadLancamentoFundo.VerificaAtualizacao(iIdFundo : Integer; dDataIniFdo, dData : TDateTime) : Boolean;
Begin
   Result    := True;
   if dData > dDataIniFdo then
   begin
      QryVerAtualizacao.Close;
      QryVerAtualizacao.ParamByName('DATAMOVFUNDO').AsString       := DateToStr(dData);
      QryVerAtualizacao.ParamByName('IDFUNDOINVEST').AsInteger     := iIdFundo;
      QryVerAtualizacao.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      QryVerAtualizacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      QryVerAtualizacao.Open;

      If QryVerAtualizacao.FieldByName('DATAMOVFUNDO').AsDateTime < dData Then
         Result := False;

      QryVerAtualizacao.Close;
   end;
End;

procedure TfrmCadLancamentoFundo.dblGestorCarteiraEnter(Sender: TObject);
begin
  inherited;
  wValAnt := dblGestorCarteira.LookupValue;
end;

procedure TfrmCadLancamentoFundo.FixarColuna1Click(Sender: TObject);
begin
  inherited;
  dbGrdSaldos.FixedCols := dbGrdSaldos.FixedCols + 1;
end;

procedure TfrmCadLancamentoFundo.LiberarColuna1Click(Sender: TObject);
begin
  inherited;
  dbGrdSaldos.FixedCols := dbGrdSaldos.FixedCols - 1;
end;

procedure TfrmCadLancamentoFundo.LiberaTodasasColunas1Click(
  Sender: TObject);
begin
  inherited;
  dbGrdSaldos.FixedCols := 0;
end;

procedure TfrmCadLancamentoFundo.pmnuConsSaldoFundosPopup(Sender: TObject);
begin
  inherited;
  if dbGrdSaldos.DataSource.DataSet.Active then
  begin
     if dbGrdSaldos.FixedCols = 0 then begin
        LiberarColuna1.Enabled := False;
        LiberaTodasasColunas1.Enabled := False;
        end
     else begin
        LiberarColuna1.Enabled := True;
        LiberaTodasasColunas1.Enabled := True;
     end;

     if dbGrdSaldos.FixedCols = dbGrdSaldos.GetColCount then
        FixarColuna1.Enabled := False
     else
        FixarColuna1.Enabled := True;
     if dbGrdSaldos.DataSource.DataSet.RecordCount > 0 then
        mnuImprimeGrid.Enabled := True
     else mnuImprimeGrid.Enabled := False;
  end
  else
  begin
     LiberarColuna1.Enabled := False;
     LiberaTodasasColunas1.Enabled := False;
     FixarColuna1.Enabled   := False;
     mnuImprimeGrid.Enabled := False;
  end;
end;

procedure TfrmCadLancamentoFundo.mnuImprimeGridClick(Sender: TObject);
begin
  inherited;
  DmRelatoriosFundo.lblSaldosFNDDtRef.Text := DbDtRefSaldo.Text;
  QrySaldoFundo.DisableControls;
  DmRelatoriosFundo.rptSaldoFundo.Print;
  QrySaldoFundo.EnableControls;
end;

function TfrmCadLancamentoFundo.ProcExcluiFundoFilhasApl(iFundo, iOperacao : Integer;
                                 dData : TDateTime) : Boolean;
Var
   sSQL : String;
Begin
   Result := True;
   Try
      QryDelEspecificoApl.Close;
      QryDelEspecificoApl.ParamByName('IDFUNDOINVEST').AsInteger     := iFundo;
      QryDelEspecificoApl.ParamByName('IDTIPOOPERACAO').AsInteger    := iOperacao;
      QryDelEspecificoApl.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      QryDelEspecificoApl.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
//AL_25
      QryDelEspecificoApl.ParamByName('DATAOPERACAO').AsString       := DateToStr(dData);
      QryDelEspecificoApl.Open;

      While Not QryDelEspecificoApl.Eof Do
      Begin

         sSQL := ' DELETE FROM HISTFUNDO WHERE IDFUNDOINVEST   = '+
                         QryDelEspecificoApl.FieldByName('IDFUNDOINVEST').AsString+' AND '+
                 ' IDTIPOOPERACAO    = '+IntToStr(iOperacao)+'         AND '+
                 ' IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+' AND '+
                 ' IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+'    AND '+
                 ' DATAMOVFUNDO      = '+'TO_DATE('+
                       QuotedStr(QryDelEspecificoApl.FieldByName('DATAOPERACAO').AsString)+',''DD/MM/YYYY'')';

         ExecutaQuery(QryAux, sSQL);

         sSQL := 'DELETE FROM OPERACAOFUNDO WHERE (IDOPERACAOFUNDO   = '''+
                    IntToStr(QryDelEspecificoApl.FieldByName('IDOPERACAOFUNDO').AsInteger)  +''')';

         ExecutaQuery(QryAux, sSQL);

         QryAux.Close;

         QryDelEspecificoApl.Next;
      End;
//AL_25
   Except
      Result := False;
   End;
//AL_25
   QryAux.Close;
   QryDelEspecificoApl.Close;
End;

function TfrmCadLancamentoFundo.ProcExcluiFundoFilhasRes(iFundo, iOperacao : Integer;
                                                         dData : TDateTime) : Boolean;
Var
   sSQL : String;
Begin
   Result := True;
   Try
      QryDelEspecificoRes.Close;
      QryDelEspecificoRes.ParamByName('IDFUNDOINVEST').AsInteger     := iFundo;
      QryDelEspecificoRes.ParamByName('IDTIPOOPERACAO').AsInteger    := iOperacao;
      QryDelEspecificoRes.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      QryDelEspecificoRes.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
//AL_25
      QryDelEspecificoRes.ParamByName('DATAOPERACAO').AsString       := DateToStr(dData);
      QryDelEspecificoRes.Open;

      While Not QryDelEspecificoRes.Eof Do
      Begin

         sSQL := 'DELETE FROM IRLITIGIO WHERE IDOPERACAOFUNDO IN (SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO WHERE '+
                 'IDPEDIDOFUNDO  = '+IntToStr(QryDelEspecificoRes.FieldByName('IDPEDIDOFUNDO').AsInteger)+') AND  '+
                 'DATAFATOGERADOR = '+'TO_DATE('+
                       QuotedStr(QryDelEspecificoRes.FieldByName('DATAPEDIDO').AsString)+',''DD/MM/YYYY'')';
         ExecutaQuery(QryAux, sSQL);

         sSQL := ' DELETE FROM HISTFUNDO WHERE IDFUNDOINVEST   = '+
                         QryDelEspecificoRes.FieldByName('IDFUNDOINVEST').AsString+' AND '+
                 ' IDTIPOOPERACAO    = '+IntToStr(iOperacao)+'         AND '+
                 ' IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+' AND '+
                 ' IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+'    AND '+
                 ' DATAMOVFUNDO = '+'TO_DATE('+
                       QuotedStr(QryDelEspecificoRes.FieldByName('DATAPEDIDO').AsString)+',''DD/MM/YYYY'')';
         ExecutaQuery(QryAux, sSQL);

         sSQL := 'DELETE FROM OPERACAOFUNDO WHERE IDOPERACAOFUNDO IN (SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO WHERE '+
                 'IDPEDIDOFUNDO  = '+IntToStr(QryDelEspecificoRes.FieldByName('IDPEDIDOFUNDO').AsInteger)+') ';
         ExecutaQuery(QryAux, sSQL);

         sSQL := 'DELETE FROM PEDIDOFUNDO WHERE IDPEDIDOFUNDO  = '+
                       QryDelEspecificoRes.FieldByName('IDPEDIDOFUNDO').AsString;
         ExecutaQuery(QryAux, sSQL);

         QryAux.Close;

         QryDelEspecificoRes.Next;
      End;
//AL_25
   Except
      Result := False;
   End;
//AL_25
   QryAux.Close;
   QryDelEspecificoRes.Close;
End;

procedure TfrmCadLancamentoFundo.sbtnDisponibilidadeClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmEspLancamento,TfrmEspLancamento,False);
   frmEspLancamento.dbDtaOperacao.Text        := DtEdDataReferenciaGeral.Text;
   frmEspLancamento.DblTipoFundo.LookupValue  := '2';
   If PgcSaldos.ActivePage  = TbsAplicacao Then
   Begin
      FazQuery(QryAux,'SELECT * FROM TIPOOPERACAO WHERE IDTIPOINVEST='+IntToStr(iTipoInvestUsu)+
                      ' AND (CODTIPDOC IS NOT NULL)'+
                      ' AND IDTIPOOPERACAO > 0 AND NATUREZAOPERACAO =  ''A''');
      frmEspLancamento.DblTipoOperacao.LookupValue := QryAux.FieldByName('IDTIPOOPERACAO').AsString;
   End
   Else
   Begin
      FazQuery(QryAux,'SELECT * FROM TIPOOPERACAO WHERE IDTIPOINVEST='+IntToStr(iTipoInvestUsu)+
                      ' AND (CODTIPDOC IS NOT NULL)'+
                      ' AND IDTIPOOPERACAO > 0 AND NATUREZAOPERACAO =  ''D''');
      frmEspLancamento.DblTipoOperacao.LookupValue := QryAux.FieldByName('IDTIPOOPERACAO').AsString;
   End;
   frmEspLancamento.AbreTodasQry;
end;

//AL_12
procedure TfrmCadLancamentoFundo.MnuUmPlanoFechtoClick(Sender: TObject);
begin
  inherited;
  SaldoFundos(False,0,1);
end;

procedure TfrmCadLancamentoFundo.MnuTodosPlanosFechtoClick(
  Sender: TObject);
begin
  inherited;
   SaldoFundos(True,0,1);
end;

procedure TfrmCadLancamentoFundo.sbtnMovimentoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmConsMovFundos, TfrmConsMovFundos, False);
   sbtnMovimento.Down := False;
   PnlFundo.Enabled   := True;
end;

procedure TfrmCadLancamentoFundo.SaldoFundos(TodosPlanos : Boolean;
                                             iAbert, iFechto : Integer);
begin
   With DmRelLancFundo do
   begin

      MontaSqlSaldo(TodosPlanos);

      If TodosPlanos then
         LblPlano.Caption := 'TODOS OS PLANOS'
      else
         LblPlano.Caption := sPlanPrevCtbPatro;

      // Formatando as colunas do relatorio total
      ppDBSaldoFundosQTD.DisplayFormat := MascaraDecQtdHist; // QtdeCotas
      ppDBText2.DisplayFormat          := MascaraDecQtdHist; // QtdeBloqueada
      ppDBCalc1.DisplayFormat          := MascaraDecQtdHist; // Somatorio QtdeCotas
      ppDBCalc2.DisplayFormat          := MascaraDecQtdHist; // Somatorio QtdeBloqueada
      ppDBCalc3.DisplayFormat          := MascaraDecQtdHist; // Somatorio QtdeCotas
      ppDBCalc4.DisplayFormat          := MascaraDecQtdHist; // Somatorio QtdeBloqueada
      //Formatando as colunas do relatorio detalhe
      ppDBSSaldoFundosVlrCota.DisplayFormat := MascaraDecVlrHist;
      ppDBText1.DisplayFormat               := MascaraDecQtdHist;
      ppDBSSaldoFundosQTD.DisplayFormat     := MascaraDecQtdHist;

      pplblSaldoFundosDataRef.Caption := DtEdDataReferenciaGeral.Text;

      if not TodosPlanos then
      begin
         ghbCabecalhoPlano.Visible := False;
         gfbRodapePlano.Visible := False;
         //AL_43
      end
      else
      begin
         ghbCabecalhoPlano.Visible := True;
         gfbRodapePlano.Visible := True;
         //AL_43
      end;
      //Al_23
      TfrmPreview.CreateModalPreview(Application,
                                     rptSaldoFundos,
                                     rptSaldoFundos.PrinterSetup.DocumentName);
      QrySaldoDet.Close;
      QrySaldoTot.Close;
   end;

   pnlFundo.Enabled := True;
   sbtnSaldos.Down := False;
end;

//AL_25

procedure TfrmCadLancamentoFundo.BtAltResgClick(Sender: TObject);
begin
   // Testa dados
   If (QryResgate.Active = False) Or (QryResgate.IsEmpty = True) Then Begin
      MsgDlg('Consulta não pode ser executada.','Mensagem do Sistema',mtWarning,[mbOk],0);
      BtAltResg.Down := False;
      Exit;
   End;

   //AL_25
   if TDisp <> nil then
      TDisp.Suspender;

   // Prepara Ambiente
   Dock974.Visible   :=True;
   BtAltResg.Tag     := 1;
   AcertaBotoesConsResg;
   PnlResgate.BringToFront;
   pnlSaldos.Height  := 62;
   pnlSaldos.Visible := True;
   pnlSaldoSintetico.Visible := True;
   pnlSaldosDetalhes.Visible := True;
   pgcResgate.ActivePage     := tbsDadosResg;
   tbsDadosResg.Enabled      := False;
   tbsObsResg.Enabled        := False;
   //AL_42
   tbsDadosResgTx.Enabled    := False;

   // Preenche os dados
   DbLkcFundoInvestResg.Text := QryResgateDESCFUNDOINVEST.AsString;
//AL_25
   DbLkcTipoOperacaoResg.Text:= QryResgateDESCTIPOOPERACAO.AsString;
   DBeCETIPResg.Text         := QryFundoInvestResgCODFUNCETIP.AsString;
   dbDDataOperacao.Text      := QryResgateDATAPEDIDO.AsString;

end;

//AL_25

procedure TfrmCadLancamentoFundo.DbLkcSaldoEnter(Sender: TObject);
begin
  inherited;
  if Trim(DbLkcSaldo.Text) = '' then
     wValAnt := ''
  else
     wValAnt := DbLkcSaldo.LookupValue;
end;

procedure TfrmCadLancamentoFundo.DbLkcSaldoCloseUp(Sender: TObject; LookupTable,
                                                   FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  begin
     BuscaSaldos;
     if DbLkcSaldo.LookupValue = '' then
        bTodos := True
     else
        bTodos := False;
     wValAnt := DbLkcSaldo.LookupValue;
  end;
end;

procedure TfrmCadLancamentoFundo.DbLkcSaldoExit(Sender: TObject);
begin
  inherited;
  if (wValAnt <> DbLkcSaldo.LookupValue) or
     ((wValAnt = '') and (not bTodos)) then
  begin
     if DbLkcSaldo.LookupValue = '' then
        bTodos := True
     else
        bTodos := False;
     BuscaSaldos;
  end;
end;

procedure TfrmCadLancamentoFundo.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   inherited;
   if Key = VK_Return then
      SelectNext(ActiveControl,True,True)
end;

procedure TfrmCadLancamentoFundo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
end;

//AL_25   

procedure TfrmCadLancamentoFundo.AbreQryFundoInvestoperacao;
begin
   with QryFundoInvestOperacao do
   begin
     OperComum.LimpaParametros(QryFundoInvestOperacao);
     if Trim(DblTipoFundo.Text) <> ''  then
        ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
            QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
     if Trim(dblGestorCarteira.Text) <> ''  then
        ParamByName('IDGESTORCARTEIRA').AsInteger :=
            qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
     ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
     if Trim(DbDtRefSaldo.Text) = '' then
        ParamByName('DATAMOVFUNDO').AsString := DtEdDataReferenciaGeral.Text
     else
        ParamByName('DATAMOVFUNDO').AsString := DbDtRefSaldo.Text;

     Open;
   end;
end;

procedure TfrmCadLancamentoFundo.AbreQryFundoInvestAplic;
begin
   with QryFundoInvestAplic do
   begin
     OperComum.LimpaParametros(QryFundoInvestAplic);
     if Trim(DblTipoFundo.Text) <> ''  then
        ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
            QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
     if Trim(dblGestorCarteira.Text) <> ''  then
        ParamByName('IDGESTORCARTEIRA').AsInteger :=
            qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
     ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
     if Trim(DbDtDataAplicacao.Text) = '' then
        ParamByName('DATAMOVFUNDO').AsString := DtEdDataReferenciaGeral.Text
     else
        ParamByName('DATAMOVFUNDO').AsString := DbDtDataAplicacao.Text;
     Open;
   end;
end;

procedure TfrmCadLancamentoFundo.AbreQryFundoInvestResg;
begin
   with QryFundoInvestResg do
   begin
     OperComum.LimpaParametros(QryFundoInvestResg);
     if Trim(DblTipoFundo.Text) <> ''  then
        ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
            QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
     if Trim(dblGestorCarteira.Text) <> ''  then
        ParamByName('IDGESTORCARTEIRA').AsInteger :=
            qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
     ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
     if Trim(dbDDataOperacao.Text) = '' then
        ParamByName('DATAMOVFUNDO').AsString := DtEdDataReferenciaGeral.Text
     else
        ParamByName('DATAMOVFUNDO').AsString := dbDDataOperacao.Text;
     Open;
   end;
end;

procedure TfrmCadLancamentoFundo.DbDtDataAplicacaoExit(Sender: TObject);
begin
  inherited;
//AL_25    
  if (DbDtDataAplicacao.Text <> DtEdDataReferenciaGeral.Text) then
     AbreQryFundoInvestAplic;
end;

procedure TfrmCadLancamentoFundo.dbDDataOperacaoExit(Sender: TObject);
begin
  inherited;
//AL_25    
  if (dbDDataOperacao.Text <> DtEdDataReferenciaGeral.Text) then
     AbreQryFundoInvestResg;
end;

procedure TfrmCadLancamentoFundo.DbDtRefSaldoExit(Sender: TObject);
begin
  inherited;
//AL_25    
  if (DbDtRefSaldo.Text <> DtEdDataReferenciaGeral.Text) then
     AbreQryFundoInvestOperacao;
end;

procedure TfrmCadLancamentoFundo.FormCreate(Sender: TObject);
begin
//AL_25
   // Marilza 09/09/2008 - N.Sol 95319  - N.Kintana 409226
   iOpcaoExecutada := -1;

   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;

   if Sistema.NumDocEmpresa <> '42271429000163' then // VALIA
      Application.CreateForm(TdmDisponibilidade, dmDisponibilidade);
  inherited;
end;

procedure TfrmCadLancamentoFundo.mnuOnLineClick(Sender: TObject);
begin
  inherited;
  // Marilza 09/09/2008 - N.Sol 95319  - N.Kintana 409226
  if bOk = True then
  begin
    if not TDisp.OnLine then
       TDisp.OnLine := True;

    if TDisp <> nil then
       TDisp.Continuar;
  end;

end;

procedure TfrmCadLancamentoFundo.mnuOffLineClick(Sender: TObject);
begin
  inherited;
  if TDisp <> nil then
     TDisp.Suspender;
   
  // Marilza 09/09/2008 - N.Sol 95319  - N.Kintana 409226
  bOk                := False;
  PnlDisp.Caption    := '0,00';
  PnlDisp.Repaint;

end;

//AL_25
procedure TfrmCadLancamentoFundo.CbxAplicExit(Sender: TObject);
begin
  inherited;
   If CbxAplic.ItemIndex = 0 then
      DbDtRefAplc.Clear;

   If (DbDtRefAplc.Text  = '') And (CbxAplic.ItemIndex > 0) then
      DbDtRefAplc.Text  := DateToStr(pRPI.DTMUDACPMF);
end;

//AL_25    
procedure TfrmCadLancamentoFundo.BtVoltaAplicClick(Sender: TObject);
var
   iIdUsuario : Integer;
begin
  inherited;
  try
     If dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Rollback;

     With QryAplicacao Do
     Begin
       if State In [DsInsert] then
       begin
          Cancel;
          CancelUpdates;
          DisableControls;
          First;
          While Not Eof Do
          begin
             if Sistema.NumDocEmpresa <> '42271429000163' then // VALIA
             begin
                If Copy(Trim(FieldByName('TRGUSERINCLUSAO').AsString),3,
                                   Length(Trim(FieldByName('TRGUSERINCLUSAO').AsString))) <> '' Then
                   iIdUsuario := StrToInt(Copy(Trim(FieldByName('TRGUSERINCLUSAO').AsString),3,
                                   Length(Trim(FieldByName('TRGUSERINCLUSAO').AsString))))
                else
                   iIdUsuario := 0;
             end;

             QryBuscaUsuario.Close;
             QryBuscaUsuario.ParamByName('IDUSUARIO').AsInteger := iIdUsuario;
             QryBuscaUsuario.Open;
             Edit;
             FieldByName('USUARIO').AsString := QryBuscaUsuario.FieldByName('NOMEUSUARIO').AsString;
             Post;
             QryBuscaUsuario.Close;
             next;
          end;
          First;
          EnableControls;
       end;          
     End;

     // Volta Ambiente
     DbGrdAplicacao.BringToFront;

     pnlDadosBase.Enabled := True;
     tbsDadosApl.Enabled  := True;
     tbsObsApl.Enabled    := True;

     if BtAltAplic.Tag = 1 then
     begin
        BtAltAplic.Tag := 0;
        AcertaBotoesConsAplic;
     end else
        AcertaBotoesAplicacao;

     Dock978.Visible    := False;

   finally
      if TDisp <> nil then
         TDisp.Continuar;
   end;
end;

//AL_25    
procedure TfrmCadLancamentoFundo.BtVoltaResgClick(Sender: TObject);
var
   iIdUsuario : Integer;
begin
  inherited;
  try
     If dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Rollback;

     With QryResgate Do
     Begin
       if State In [DsInsert] then
       begin
          Cancel;
          CancelUpdates;
          DisableControls;
          First;
          While Not Eof Do
          begin
             if Sistema.NumDocEmpresa <> '42271429000163' then // VALIA
             begin
                If Copy(Trim(FieldByName('TRGUSERINCLUSAO').AsString),3,
                                   Length(Trim(FieldByName('TRGUSERINCLUSAO').AsString))) <> '' Then
                   iIdUsuario := StrToInt(Copy(Trim(FieldByName('TRGUSERINCLUSAO').AsString),3,
                                   Length(Trim(FieldByName('TRGUSERINCLUSAO').AsString))))
                else
                   iIdUsuario := 0;
             end;

             QryBuscaUsuario.Close;
             QryBuscaUsuario.ParamByName('IDUSUARIO').AsInteger := iIdUsuario;
             QryBuscaUsuario.Open;
             Edit;
             FieldByName('USUARIO').AsString := QryBuscaUsuario.FieldByName('NOMEUSUARIO').AsString;
             Post;
             QryBuscaUsuario.Close;
             Next;
          end;
          First;

          OperComum.LimpaParametros(QrySaldoFundoTotal);
          if Trim(DbLkcSaldo.Text) <> '' then
             QrySaldoFundoTotal.ParamByName('IDFUNDOINVEST').AsString := DbLkcSaldo.LookupValue;

          if Trim(DbDtRefSaldo.Text) <> '' then
             QrySaldoFundoTotal.ParamByName('DATAMOVFUNDO').AsString  := DbDtRefSaldo.Text;

          if Trim(DbDtRefAplc.Text) <> '' then
          begin
             If CbxAplic.ItemIndex = 1 Then
             begin
                QrySaldoFundoTotal.ParamByName('DATAAPLICACAO').AsString := DbDtRefAplc.Text;
                QrySaldoFundoTotal.ParamByName('TIPOMENOR').AsInteger    := CbxAplic.ItemIndex;
             end
             Else If CbxAplic.ItemIndex = 2 Then
             begin
                QrySaldoFundoTotal.ParamByName('DATAAPLICACAO').AsString := DbDtRefAplc.Text;
                QrySaldoFundoTotal.ParamByName('TIPOMAIOR').AsInteger    := CbxAplic.ItemIndex;
             end;
          end;

          if DblTipoFundo.Text <> ''  then
             QrySaldoFundoTotal.ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

          if dblGestorCarteira.Text <> '' then
             QrySaldoFundoTotal.ParamByName('IDGESTORCARTEIRA').AsInteger  := qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;

          QrySaldoFundoTotal.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
          QrySaldoFundoTotal.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
          QrySaldoFundoTotal.Open;

          EnableControls;
       end;
     End;

     bDelete           := False;

     pnlSaldos.Visible := False;

     // Volta Ambiente
     DbGrdrResgate.BringToFront;
     pnlDadosBase.Enabled := True;

     if BtAltResg.Tag = 1 then
     begin
        BtAltResg.Tag := 0;
        AcertaBotoesConsResg;
     end else
        AcertaBotoesResgate;

     Dock974.Visible   := False;

     fraMens.Apaga;     

   finally
      if TDisp <> nil then
         TDisp.Continuar;
   end;
end;

//AL_25    
procedure TfrmCadLancamentoFundo.FormResize(Sender: TObject);
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

procedure TfrmCadLancamentoFundo.DblTipoFundoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
var iLocalTipoFundo : Integer;
begin
  inherited;
  iLocalTipoFundo := 0;
  if (Trim(DblTipoFundo.LookupValue) <> '') Then
      iLocalTipoFundo := StrToInt(DblTipoFundo.LookupValue);

  if ((modified) And (Trim(DblTipoFundo.LookupValue) <> '')) Then
  begin
     if (wTipoFundoInvest <> iLocalTipoFundo) then
     begin
        wTipoFundoInvest := iLocalTipoFundo;
        //AL_25
        AbreQryFundoInvestOperacao;

        AbreQryFundoInvestAplic;

        AbreQryFundoInvestResg;

        ProcuraAplResg;

        BuscaSaldos;

        pnlSaldos.Visible := False;
        If (QryResgate.RecordCount > 0) Then
           PgcSaldos.ActivePage := TbsResgate
        Else If QryAplicacao.RecordCount > 0 Then
           PgcSaldos.ActivePage := TbsAplicacao
        Else
           PgcSaldos.ActivePage := TbsSaldo;
        //AL_25
     end;
  end;
end;

//AL_26
procedure TfrmCadLancamentoFundo.DblTipoFundoExit(Sender: TObject);
var iLocalTipoFundo : Integer;
begin
  inherited;
  iLocalTipoFundo := 0;
  if (Trim(DblTipoFundo.LookupValue) <> '') Then
      iLocalTipoFundo := StrToInt(DblTipoFundo.LookupValue);

  if (wTipoFundoInvest <> iLocalTipoFundo) then
  begin
     wTipoFundoInvest :=  iLocalTipoFundo;
     //AL_25
     AbreQryFundoInvestOperacao;

     AbreQryFundoInvestAplic;

     AbreQryFundoInvestResg;

     ProcuraAplResg;

     BuscaSaldos;

     pnlSaldos.Visible := False;
     If (QryResgate.RecordCount > 0) Then
        PgcSaldos.ActivePage := TbsResgate
     Else If QryAplicacao.RecordCount > 0 Then
        PgcSaldos.ActivePage := TbsAplicacao
     Else
        PgcSaldos.ActivePage := TbsSaldo;
  end;
end;

//AL_26
procedure TfrmCadLancamentoFundo.dblGestorCarteiraCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
var iLocalGestor : Integer;
begin
  inherited;
  iLocalGestor := 0;
  if (Trim(dblGestorCarteira.LookupValue) <> '') Then
      iLocalGestor := StrToInt(dblGestorCarteira.LookupValue);

  if ((modified) And (Trim(dblGestorCarteira.LookupValue) <> '')) Then
  begin
     if (wGestor <> iLocalGestor) then
     begin
        wGestor :=  iLocalGestor;
        //AL_25
        AbreQryFundoInvestOperacao;

        AbreQryFundoInvestAplic;

        AbreQryFundoInvestResg;

        ProcuraAplResg;

        BuscaSaldos;

        pnlSaldos.Visible := False;
        If (QryResgate.RecordCount > 0) Then
           PgcSaldos.ActivePage := TbsResgate
        Else If QryAplicacao.RecordCount > 0 Then
           PgcSaldos.ActivePage := TbsAplicacao
        Else
           PgcSaldos.ActivePage := TbsSaldo;
     end;
  end;
end;

//AL_26
procedure TfrmCadLancamentoFundo.dblGestorCarteiraExit(Sender: TObject);
var iLocalGestor : Integer;
begin
  inherited;
  iLocalGestor := 0;
  if (Trim(DblTipoFundo.LookupValue) <> '') Then
      iLocalGestor := StrToInt(DblTipoFundo.LookupValue);

  if (wGestor <> iLocalGestor) then
  begin
     wGestor :=  iLocalGestor;
     //AL_25
     AbreQryFundoInvestOperacao;

     AbreQryFundoInvestAplic;

     AbreQryFundoInvestResg;

     ProcuraAplResg;

     BuscaSaldos;

     pnlSaldos.Visible := False;
     If (QryResgate.RecordCount > 0) Then
        PgcSaldos.ActivePage := TbsResgate
     Else If QryAplicacao.RecordCount > 0 Then
        PgcSaldos.ActivePage := TbsAplicacao
     Else
        PgcSaldos.ActivePage := TbsSaldo;
  end;
end;

//AL_27
procedure TfrmCadLancamentoFundo.dbGrdSaldosUpdateFooter(Sender: TObject);
var QtdDec : Integer;
begin
   QtdDec  := 10;
   if Trim(DbLkcSaldo.Text) <> '' then
     QtdDec   := QryFundoInvestOperacaoQTDDECQTD.AsInteger;

  inherited;
   dbGrdSaldos.Columns[0].FooterValue  := 'SALDO TOTAL';
   dbGrdSaldos.Columns[3].FooterValue  := FloatToStrF(QrySaldoFundoTotalSALDOQTDCOTAS.AsFloat,ffNumber,18,QtdDec);
   dbGrdSaldos.Columns[5].FooterValue  := FloatToStrF(QrySaldoFundoTotalSALDOVLRFUNDO.AsFloat,ffNumber,16,2);
   dbGrdSaldos.Columns[6].FooterValue  := FloatToStrF(QrySaldoFundoTotalSALDOQTDCOTASBLQ.AsFloat,ffNumber,18,QtdDec);
   dbGrdSaldos.Columns[7].FooterValue  := FloatToStrF(QrySaldoFundoTotalVLRIOFPROV.AsFloat,ffNumber,12,2);
   dbGrdSaldos.Columns[8].FooterValue  := FloatToStrF(QrySaldoFundoTotalVLRIRPROV.AsFloat,ffNumber,12,2);
   dbGrdSaldos.Columns[9].FooterValue  := FloatToStrF(QrySaldoFundoTotalSALDOLIQUIDO.AsFloat,ffNumber,16,2);
end;

//AL_33
procedure TfrmCadLancamentoFundo.DbDtDataCotizacaoResgExit(
  Sender: TObject);
Var
  DadosCota  : TDadosCota;
begin
  inherited;
   //AL_42
   if Trim(DbLkcFundoInvestResg.Text) <> '' then
   begin
      DadosCota := BuscaCotaFundo(QryAux,
                                  StrToInt(DbLkcFundoInvestResg.LookupValue),
                                  QryResgateDATACOTIZACAO.AsDateTime);

      DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
      DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;

      If (QryResgateDATACOTIZACAO.AsDateTime = dbDDataOperacao.Date) And
         (DadosCota.DataCota = 0) Then
      Begin
         MsgDlg('Cota do Fundo não encontrada nesta data.', 'Mensagem de Sistema', mtWarning, [mbOk],0);
         DbLkcFundoInvestResg.Clear;
         if DbLkcFundoInvestResg.CanFocus Then
            DbLkcFundoInvestResg.SetFocus;
      End
      Else
      Begin
         DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
         DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;
         DbEdCotaResg.Value := DadosCota.VlrCota;
      End;
   End;
end;

//AL_41
procedure TfrmCadLancamentoFundo.DbDtDataCotizacaoAplicExit(
  Sender: TObject);
Var
  DadosCota  : TDadosCota;  
begin
  inherited;
   //AL_42
   if Trim(DbLkcFundoInvest.Text) <> '' then
   begin
      // Busca dados da Cota
      DadosCota := UFundoComum.BuscaCotaFundo(QryAux,
                                              StrToInt(DbLkcFundoInvest.LookupValue),
                                              QryAplicacaoDATACOTIZACAO.AsDateTime);

      DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
      DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;

      If (QryAplicacaoDATACOTIZACAO.AsDateTime =DbDtDataAplicacao.Date) And
         (DadosCota.DataCota = 0) Then
      Begin
         MsgDlg('Cota do Fundo não encontrada nesta data.','Mensagem de Sistema',mtWarning,[mbOk],0);
         DbLkcFundoInvest.Clear;
         Exit;
      End
      Else
      Begin
         DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
         DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;
         DbEdCota.Value     := DadosCota.VlrCota;
      End;
   End;
end;

procedure TfrmCadLancamentoFundo.MontaSqlSaldo(TodosPlanos : Boolean);
begin
   //Montando as Mascaras de Histfundo
   //Atenção as mascaras tem relacao com a data do saldo do fundo
   If Trim(DbLkcSaldo.Text) <> '' Then
   Begin
      MascaraDecVlrHist := MontaMascaraDecVlrHist(QryFundoInvestOperacaoIDFUNDOINVEST.AsInteger,DtEdDataReferenciaGeral.text);
      MascaraDecQtdHist := MontaMascaraDecQtdHist(QryFundoInvestOperacaoIDFUNDOINVEST.AsInteger,DtEdDataReferenciaGeral.text);
   End
   Else
   Begin
      MascaraDecVlrHist := '###,#0.000000000000';
      MascaraDecQtdHist := '###,#0.000000000000';
   end;
   // Montando mascara de detalhe
   DmRelLancFundo.QrySaldoDetVLRCOTAAPLICACAO.DisplayFormat := MascaraDecVlrHist;
   DmRelLancFundo.QrySaldoDetVLRCOTAATUAL.DisplayFormat     := MascaraDecVlrHist;
   DmRelLancFundo.QrySaldoDetSALDOQTDCOTAS.DisplayFormat    := MascaraDecQtdHist;
   DmRelLancFundo.QrySaldoDetSALDOQTDCOTASBLQ.DisplayFormat := MascaraDecQtdHist;
   // Montando mascara de Rodape
   DmRelLancFundo.QrySaldoTotSALDOQTDCOTASG.DisplayFormat    := MascaraDecQtdHist;
   DmRelLancFundo.QrySaldoTotSALDOQTDCOTASBLQG.DisplayFormat := MascaraDecQtdHist;
   DmRelLancFundo.QrySaldoTotVLRIOFPROVG.DisplayFormat       := '#,###,###,##0.00';
   DmRelLancFundo.QrySaldoTotVLRIRPROVG.DisplayFormat        := '#,###,###,##0.00';
   DmRelLancFundo.QrySaldoTotSALDOLIQUIDOG.DisplayFormat     := '###,###,###,##0.00';
   DmRelLancFundo.QrySaldoTotSALDOVLRFUNDOG.DisplayFormat    := '###,###,###,##0.00';

   // Montando a Query Detalhe
   DmRelLancFundo.QrySaldoDet.DisableControls;
   DmRelLancFundo.QrySaldoTot.DisableControls;
   OperComum.LimpaParametros(DmRelLancFundo.QrySaldoDet);
   DmRelLancFundo.QrySaldoDet.SQL.Clear;
   DmRelLancFundo.QrySaldoDet.SQL.Add('SELECT /*+INDEX (H1.XPKHISTFUNDO)*/' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('       FI.IDFUNDOINVEST, FI.DESCFUNDOINVEST, '+ #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('       FI.IDTIPOFUNDOINVEST,FI.DESCTIPOFUNDOINV,'+ #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('       H1.DATAAPLICACAO, H1.DATAMOVFUNDO,' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('       H1.SALDOQTDCOTAS, H1.SALDOQTDCOTASBLQ,' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('       NVL(CAT.VLRCOTA,0)       AS VLRCOTAATUAL,' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('       H1.SALDOVLRFUNDO,' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('       NVL(H1.VLRIRPROV,0)    AS VLRIRPROV,' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('       NVL(H1.VLRIOFPROV,0)   AS VLRIOFPROV,' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('       (NVL(H1.SALDOVLRFUNDO,0) - NVL(H1.VLRIOFPROV,0)) AS  SALDOLIQUIDO,' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('       NVL(H1.COTAAPLICACAO,0) AS VLRCOTAAPLICACAO,' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('       PLANO.PLANPRVCONTABPATRO,' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('       H1.IDPLANPREVCTBPATR,' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('       TC.DESCTIPOCOTA ' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('FROM' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('       HISTFUNDO H1,' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('       (SELECT /*+INDEX (HI.XIE1HISTFUNDO)*/  MAX(HI.IDHISTFUNDO) AS IDHISTFUNDO ' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('        FROM HISTFUNDO HI, ' + #13);
   //Ricardo Cristiano - 26/09/2011 - N. Sol 165409 -  N. Kintana 1432653   
   DmRelLancFundo.QrySaldoDet.SQL.Add('             (SELECT T.IDTIPOINVEST, T.IDTIPOOPERACAO' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('              FROM   TIPOOPERACAO T' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('              WHERE (T.IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+')' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                AND (T.NATUREZAOPERACAO <> ''R'')) TP,' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('             (SELECT HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST, HF1.DESCFUNDOINVEST ' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('              FROM HISTFUNDOINVEST HF1 ' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('              WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,''DD/MM/YYYY, HH24:MI:SS'') IN ' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                         (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),''DD/MM/YYYY, HH24:MI:SS'')' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                          FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                          WHERE ' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                              (TF.IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+')' + #13);
   if DblTipoFundo.Text <> '' then
      DmRelLancFundo.QrySaldoDet.SQL.Add('                              AND  (TF.IDTIPOFUNDOINVEST = '+QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString+')' + #13);
   if DbLkcSaldo.Text <> '' then
      DmRelLancFundo.QrySaldoDet.SQL.Add('                              AND  (HF.IDFUNDOINVEST     = '+DbLkcSaldo.LookupValue+')' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                              AND (HF.DTAVIGENCIA       < TO_DATE('+QuotedStr(DtEdDataReferenciaGeral.Text)+',''DD/MM/YYYY'')+1) ' + #13);
   if dblGestorCarteira.Text <> ''  then
      DmRelLancFundo.QrySaldoDet.SQL.Add('                              AND  (HF.IDGESTORCARTEIRA  = '+qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsString+')' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                              AND (HF.IDTIPOFUNDOINVEST  = TF.IDTIPOFUNDOINVEST) ' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                              GROUP BY HF.IDFUNDOINVEST))' + #13);
   if DblTipoFundo.Text <> '' then
      DmRelLancFundo.QrySaldoDet.SQL.Add('                    AND  (HF1.IDTIPOFUNDOINVEST = '+QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString+')'+ #13);
   //Ricardo Cristiano - 26/09/2011 - N. Sol 165409 -  N. Kintana 1432653  INI
   DmRelLancFundo.QrySaldoDet.SQL.Add('                    AND NOT EXISTS' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                            (SELECT 1' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                             FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                             WHERE' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                                   TF.IDTIPOINVEST = '+IntToStr(iTipoInvestUsu) + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                               AND HF.IDFUNDOINVEST = HF1.IDFUNDOINVEST' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                               AND HF.DTAVIGENCIA   > HF1.DTAVIGENCIA' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                               AND (HF.DTAVIGENCIA  < TO_DATE('+QuotedStr(DtEdDataReferenciaGeral.Text)+',''DD/MM/YYYY'')+1)' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                               AND HF.IDTIPOFUNDOINVEST <> HF1.IDTIPOFUNDOINVEST' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                               AND HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                             GROUP BY HF.IDFUNDOINVEST)    ) FI ' + #13);
   //Ricardo Cristiano - 26/09/2011 - N. Sol 165409 -  N. Kintana 1432653 FIM   
   DmRelLancFundo.QrySaldoDet.SQL.Add('        WHERE ' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('             (HI.IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+')' + #13);
   if not TodosPlanos then
      DmRelLancFundo.QrySaldoDet.SQL.Add('             AND (HI.IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+')' + #13)
   else
      DmRelLancFundo.QrySaldoDet.Sql.add('             AND (HI.IDPLANPREVCTBPATR > 0)');
   if DbLkcSaldo.Text <> '' then
      DmRelLancFundo.QrySaldoDet.SQL.Add('             AND (HI.IDFUNDOINVEST = '+DbLkcSaldo.LookupValue+')' + #13)
   else
      DmRelLancFundo.QrySaldoDet.Sql.add('             AND (HI.IDFUNDOINVEST > 0)');
   if Trim(DbDtRefAplc.Text) <> '' then
   begin
      if CbxAplic.ItemIndex = 1 Then
         DmRelLancFundo.QrySaldoDet.Sql.add('             AND (HI.DATAAPLICACAO < TO_DATE('+QuotedStr(DbDtRefAplc.Text)+',''DD/MM/YYYY''))')
      else if CbxAplic.ItemIndex = 2 Then
         DmRelLancFundo.QrySaldoDet.Sql.add('             AND (HI.DATAAPLICACAO >= TO_DATE('+QuotedStr(DbDtRefAplc.Text)+',''DD/MM/YYYY''))')
      else
         DmRelLancFundo.QrySaldoDet.Sql.add('             AND (HI.DATAAPLICACAO <= TO_DATE('+QuotedStr(DtEdDataReferenciaGeral.Text)+',''DD/MM/YYYY''))');
   end;
   DmRelLancFundo.QrySaldoDet.SQL.Add('             AND (HI.DATAMOVFUNDO      = TO_DATE('+QuotedStr(DtEdDataReferenciaGeral.Text)+', ''DD/MM/YYYY'')) ' + #13);

   DmRelLancFundo.QrySaldoDet.SQL.Add('             AND (HI.TIPMOVFUNDO      <> ''PIR'') ' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('             AND (FI.IDFUNDOINVEST     = HI.IDFUNDOINVEST) ' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('             AND (TP.IDTIPOINVEST      = HI.IDTIPOINVEST) ' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('             AND (TP.IDTIPOOPERACAO    = HI.IDTIPOOPERACAO) ' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('             GROUP BY HI.IDTIPOINVEST,  HI.IDPLANPREVCTBPATR, HI.IDFUNDOINVEST, HI.DATAAPLICACAO,' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                      HI.DATAMOVFUNDO,  HI.IDTIPOCOTA) HM,' + #13);

   DmRelLancFundo.QrySaldoDet.SQL.Add('       COTAFUNDO CAT, TIPOCOTA TC, ' + #13);

   DmRelLancFundo.QrySaldoDet.SQL.Add('       (SELECT HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST, HF1.DESCFUNDOINVEST,TF1.DESCTIPOFUNDOINV' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('        FROM HISTFUNDOINVEST HF1,TIPOFUNDOINVEST TF1' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('        WHERE' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('           (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,''DD/MM/YYYY, HH24:MI:SS'') IN' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                 (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),''DD/MM/YYYY, HH24:MI:SS'')' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                  FROM   HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF ' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                  WHERE ' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                        (TF.IDTIPOINVEST       = '+IntToStr(iTipoInvestUsu)+')' + #13);
   if DblTipoFundo.Text <> '' then
      DmRelLancFundo.QrySaldoDet.SQL.Add('                       AND (TF.IDTIPOFUNDOINVEST = '+ QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString+')' + #13);
   if DbLkcSaldo.Text <> '' then
      DmRelLancFundo.QrySaldoDet.SQL.Add('                       AND (HF.IDFUNDOINVEST     = '+ DbLkcSaldo.LookupValue +')' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                    AND (HF.DTAVIGENCIA       < TO_DATE('+QuotedStr(DtEdDataReferenciaGeral.Text)+',''DD/MM/YYYY'')+1)' + #13);
   If dblGestorCarteira.Text <> ''  then
      DmRelLancFundo.QrySaldoDet.SQL.Add('                       AND (HF.IDGESTORCARTEIRA  = '+qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsString+')' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                    AND (HF.IDTIPOFUNDOINVEST  = TF.IDTIPOFUNDOINVEST)' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                  GROUP BY HF.IDFUNDOINVEST))' + #13);
   if DblTipoFundo.Text <> '' then
      DmRelLancFundo.QrySaldoDet.SQL.Add('           AND (HF1.IDTIPOFUNDOINVEST = '+ QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString+')' + #13);
   //Ricardo Cristiano - 26/09/2011 - N. Sol 165409 -  N. Kintana 1432653 INI
   DmRelLancFundo.QrySaldoDet.SQL.Add('           AND (HF1.IDTIPOFUNDOINVEST = TF1.IDTIPOFUNDOINVEST) ' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('           AND NOT EXISTS' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                   (SELECT 1' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                    FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                    WHERE' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                          TF.IDTIPOINVEST  = '+IntToStr(iTipoInvestUsu) + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                      AND HF.IDFUNDOINVEST = HF1.IDFUNDOINVEST' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                      AND HF.DTAVIGENCIA   > HF1.DTAVIGENCIA' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                      AND (HF.DTAVIGENCIA  < TO_DATE('+QuotedStr(DtEdDataReferenciaGeral.Text)+',''DD/MM/YYYY'')+1)' + #13);   
   DmRelLancFundo.QrySaldoDet.SQL.Add('                      AND HF.IDTIPOFUNDOINVEST <> HF1.IDTIPOFUNDOINVEST' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                      AND HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('                    GROUP BY HF.IDFUNDOINVEST)    ) FI, ' + #13);
   //Ricardo Cristiano - 26/09/2011 - N. Sol 165409 -  N. Kintana 1432653 FIM   
   DmRelLancFundo.QrySaldoDet.SQL.Add('       VWPLANPREVCTBPATR PLANO' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('WHERE ' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('     (H1.IDHISTFUNDO       = HM.IDHISTFUNDO) ' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('     AND (H1.SALDOQTDCOTAS > 0)' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('     AND (H1.IDPLANPREVCTBPATR = PLANO.IDPLANPREVCTBPATR)' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('     AND (H1.IDFUNDOINVEST     = FI.IDFUNDOINVEST)' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('     AND (H1.DATAMOVFUNDO      = CAT.DATACOTA(+))' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('     AND (H1.IDFUNDOINVEST     = CAT.IDFUNDOINVEST(+))' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('     AND (NVL(H1.IDTIPOCOTA,0) = NVL(CAT.IDTIPOCOTA(+),0))' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('     AND (H1.IDTIPOCOTA        =  TC.IDTIPOCOTA(+)) ' + #13);
   DmRelLancFundo.QrySaldoDet.SQL.Add('ORDER BY PLANPRVCONTABPATRO, IDPLANPREVCTBPATR, DESCFUNDOINVEST, DATAAPLICACAO, DESCTIPOCOTA' + #13);

   // Montando a Query Tot da Query Detalhe
   // Preparando a QrySaldoTot
   DmRelLancFundo.QrySaldoTot.Filter := '';
   DmRelLancFundo.QrySaldoTot.Filtered  := False;
   OperComum.LimpaParametros(DmRelLancFundo.QrySaldoTot);
   DmRelLancFundo.QrySaldoTot.Sql.Clear;
   DmRelLancFundo.QrySaldoTot.Sql.Add('SELECT '+ #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('DET.DESCTIPOFUNDOINV, DET.PLANPRVCONTABPATRO, DET.DESCFUNDOINVEST,'+ #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('DET.IDTIPOFUNDOINVEST, DET.IDPLANPREVCTBPATR, DET.IDFUNDOINVEST,'+ #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('DET.SALDOQTDCOTAS, '+ #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('DET.SALDOQTDCOTASBLQ, '+ #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('DET.SALDOVLRFUNDO,'+ #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('DET.VLRIOFPROV,' + #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('DET.VLRIRPROV,' + #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('DET.SALDOLIQUIDO,' + #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('GERAL.SALDOQTDCOTASG, '+ #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('GERAL.SALDOQTDCOTASBLQG, '+ #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('GERAL.SALDOVLRFUNDOG,'+ #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('GERAL.VLRIOFPROVG,' + #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('GERAL.VLRIRPROVG,' + #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('GERAL.SALDOLIQUIDOG FROM ( ' + #13);
   // Detalhe
   DmRelLancFundo.QrySaldoTot.Sql.Add( '' + #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('SELECT '+ #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('DESCTIPOFUNDOINV, PLANPRVCONTABPATRO, DESCFUNDOINVEST,'+ #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('IDTIPOFUNDOINVEST, IDPLANPREVCTBPATR, IDFUNDOINVEST,'+ #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('SUM(SALDOQTDCOTAS) AS SALDOQTDCOTAS, '+ #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('SUM(SALDOQTDCOTASBLQ) AS SALDOQTDCOTASBLQ, '+ #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('SUM(SALDOVLRFUNDO) AS SALDOVLRFUNDO,'+ #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('SUM(VLRIOFPROV) AS VLRIOFPROV,' + #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('SUM(VLRIRPROV) AS VLRIRPROV,' + #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('SUM(SALDOLIQUIDO) AS SALDOLIQUIDO FROM( ' + #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add(DmRelLancFundo.QrySaldoDet.Sql.GetText);
   DmRelLancFundo.QrySaldoTot.Sql.Add( ')' + #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add( 'GROUP BY DESCTIPOFUNDOINV, PLANPRVCONTABPATRO, DESCFUNDOINVEST,' + #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add( '         IDTIPOFUNDOINVEST, IDPLANPREVCTBPATR, IDFUNDOINVEST' + #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add( 'ORDER BY DESCTIPOFUNDOINV, PLANPRVCONTABPATRO, DESCFUNDOINVEST,' + #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add( '         IDTIPOFUNDOINVEST, IDPLANPREVCTBPATR, IDFUNDOINVEST ' + #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add( '' + #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add( ' ) DET, ' + #13);
   // Fim Detalhe
   // Geral
   DmRelLancFundo.QrySaldoTot.Sql.Add( '' + #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('( SELECT '+ #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('         SUM(SALDOQTDCOTAS) AS SALDOQTDCOTASG,'+ #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('         SUM(SALDOQTDCOTASBLQ) AS SALDOQTDCOTASBLQG,'+ #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('         SUM(SALDOVLRFUNDO) AS SALDOVLRFUNDOG, '+ #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('         SUM(VLRIOFPROV) AS VLRIOFPROVG,'+ #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('         SUM(VLRIRPROV) AS VLRIRPROVG,' + #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add('         SUM(SALDOLIQUIDO) AS SALDOLIQUIDOG FROM( ' + #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add(                      DmRelLancFundo.QrySaldoDet.Sql.GetText);
   DmRelLancFundo.QrySaldoTot.Sql.Add( '                                               )' + #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add( '' + #13);
   DmRelLancFundo.QrySaldoTot.Sql.Add( ' ) GERAL ' + #13);
   // Fim Geral
   DmRelLancFundo.QrySaldoTot.Open;

   if DmRelLancFundo.QrySaldoTot.IsEmpty then
   begin
      if DtEdDataReferenciaGeral.CanFocus then
         DtEdDataReferenciaGeral.SetFocus;
         Exit;
   end;

   DmRelLancFundo.QrySaldoDet.Filter := '';
   DmRelLancFundo.QrySaldoDet.Filtered  := False;
   DmRelLancFundo.QrySaldoDet.Open;

   DmRelLancFundo.QrySaldoDet.EnableControls;
   DmRelLancFundo.QrySaldoTot.EnableControls;

   pnlFundo.Enabled := True;

   sbtnSaldos.Down  := False;

   dbGrdSaldosUpdateFooter(Self);

end;

// Marilza 09/09/2008 - N.Sol 95319  - N.Kintana 409226
procedure TfrmCadLancamentoFundo.RGAtualizaSaldoClick(Sender: TObject);
begin
  inherited;

  if RGAtualizaSaldo.ItemIndex = 0 then
  begin
    cboOpcao.Visible    := False;
    bbtnCalcula.Visible := True;
    TDisp.OnLine        := False;
    lblTempo.Visible    := False;
  end
  else
  begin
    cboOpcao.Visible    := True;
    bbtnCalcula.Visible := False;
    cboOpcao.ItemIndex  := -1;
    lblTempo.Visible    := True;
    iOpcaoExecutada     := cboOpcao.itemindex;
  end;

end;

procedure TfrmCadLancamentoFundo.cboOpcaoClick(Sender: TObject);

begin
  inherited;

// Marilza 09/09/2008 - N.Sol 95319  - N.Kintana 409226

  if MsgDlg ('Confirma Atualização da Disponibilidade?','Atenção', mtConfirmation, [mbYes, mbNo],0)= mrYes then
    begin
    dmDisponibilidade.TmDisp.Enabled  := false;
    TDisp.OnLine                      := True;
    dmDisponibilidade.Tmdisp.Interval := 500;
    dmDisponibilidade.Tmdisp.Enabled  := true;
    iOpcaoExecutada                   := cboOpcao.itemindex;
  end
  else
    cboOpcao.itemindex := iOpcaoExecutada;
  end;

procedure TfrmCadLancamentoFundo.Online;
begin

  if bOk = True then
  begin
    if not TDisp.OnLine then
       TDisp.OnLine := True;

    if TDisp <> nil then
       TDisp.Continuar;
  end;

end;


procedure TfrmCadLancamentoFundo.bbtnCalculaClick(Sender: TObject);
begin
  inherited;

// Marilza 09/09/2008 - N.Sol 95319  - N.Kintana 409226
 if RGAtualizaSaldo.ItemIndex = 0 then
 begin
   dmDisponibilidade.TmDisp.Enabled := false;
   TDisp.OnLine := True;
   dmDisponibilidade.Tmdisp.Interval := 500;
   dmDisponibilidade.Tmdisp.Enabled := true;
 end;

end;

end.
