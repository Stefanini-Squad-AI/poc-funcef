//******************************************************************************
// Autor     : Marco Turon
// Data      : 01/02/2007
// Código    : AL_38
// Pendencia : 24349
// SOL       : 52712
// Desc      : Ajuste no tratamento de erro da rotina AlimentaFundo
//             Criado um parametro novo dom variável para retorno da
//               mensagem de erro

//******************************************************************************
// Autor     : Ricardo Cristiano
// Data      : 27/09/2006
// Código    : AL_35
// Pendencia :
// SOL       :
// Motivo    : Implementação da verificação de registros para a impressão
//******************************************************************************
// Autor     : Fabio Fagundes
// Data      : 10/07/2006
// Código    : AL_34
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Autor     : Ricardo Cristiano
// Data      : 20/06/2006
// Código    : AL_33
// Pendencia : 22601
// SOL       : 44102
// Motivo    : Implementação da busca da cotação quando alterada a data de cotização
//******************************************************************************
// Autor     : Ricardo Cristiano
// Data      : 20/06/2006
// Código    : AL_32
// Pendencia : 22601
// SOL       : 44102
// Motivo    : Implementação da verificação da cota do dia conforme a data de cotização
//******************************************************************************
// Autor     : Ricardo Cristiano
// Data      : 20/06/2006
// Código    : AL_31
// Pendencia : 22601
// SOL       : 44102
// Motivo    : Implementação para testar as variaveis de integralização, individualmente.
//******************************************************************************
// Autor     : Ricardo Cristiano
// Data      : 20/06/2006
// Código    : AL_30
// Pendencia : 22601
// SOL       : 44102
// Motivo    : Implementação para efetuar os resgates com a data de cotização
//             menor que a data de operação
//******************************************************************************
// Autor     : Ricardo Cristiano
// Data      : 01/06/2005
// Código    : AL_29
// Pendencia :
// SOL       :
// Motivo    : Implementação da verificação de processo de atualização em andamento
//******************************************************************************
// Autor     : Ricardo Cristiano
// Data      : 23/05/2006
// Código    : AL_28
// Pendencia :
// SOL       :
// Motivo    : Implementação na quantidade de casas decimais conforme o cadastro do
//             Fundo(Consulta individual e resgate)
//******************************************************************************
// Autor     : Ricardo Cristiano
// Data      : 23/05/2006
// Código    : AL_27
// Pendencia :
// SOL       :
// Motivo    : Implementação do totalizador do Saldo na propria Grid.
//******************************************************************************
// Autor     : Ricardo Cristiano
// Data      : 23/05/2006
// Código    : AL_26
// Pendencia :
// SOL       :
// Motivo    : Otimização do funcionamento da tela e acionamento das querys
//******************************************************************************
// Autor     : Ricardo Cristiano
// Data      : 26/01/2006
// Código    : AL_25
// Pendencia : 22437
// SOL       :
// Motivo    : Alteração do layout para o a pasta de Resgate, unificação do
//             Resgate CC e CCI
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 24/10/2005
// Linha(s) : AL_24
// Linha(s) : Implementação da Quantidade de cotas Bloqueadas(SALDOS)
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 13/07/2005
// Linha(s) : AL_23
// Linha(s) : Ajuste no layout do relatorio.
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 11/07/2005
// Linha(s) : AL_22                                       
// Linha(s) : Retirada  a coluna de variação do Saldo.
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 01/07/2005
// Linha(s) : AL_21
// Linha(s) : Retiradao do tratamento de abertura e fechamento da QrySaldoTot e
//            QrySaldoDet e acerto nos IF de linhas
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 15/06/2005
// Linha(s) : Al_20
// Motivo   : Implementado o parametro IDPEDIDOFUNDO na query "qryConfirmação"
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 15/06/2005
// Linha(s) : Al_19
// Motivo   : Passa a ser obrigatório a identifica;áo de uma aplicação no momento do resgate novo,
//            devido a problemas no reprocessamento 
//******************************************************************************
// Autor    : Marco Turon
// Data     : 25/05/2005
// Linha(s) : Al_18
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 01/06/2005
// Código   : Al_17
// Motivo   : Implementação do teste de transação e do botão de cancelar
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 01/06/2005
// Código   : Al_16
// Motivo   : Alteração da mensagem de erro para uma similar
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 31/05/2005
// Linha(s) : Al_15
// Motivo   : Implementação da dDataIniProc para trazer a correta no momento do reprocessamento
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 18/05/2005
// Linha(s) : Al_14
// Motivo   : Implementação para o cancelamento de uma operação
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 29/04/2005
// Linha(s) : Al_13
// Motivo   : Alterado a descrição do histórico, para passar apenas o nome do fundo e o plano
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 30/03/2005
// Linha(s) : AL_12
// Linha(s) : Implementação do saldo de abertura e fechamento
//******************************************************************************
// Autor    : Lucas Barth Pacini
// Data     : 23/02/2005
// Linha(s) : AL_11
// Motivo   : Alterada a Rotina de gravação de 2 aplicações no mesmo dia p/ gravar cota no histórico
//******************************************************************************
// Autor    : Lucas Barth Pacini
// Data     : 16/02/2005
// Linha(s) : AL_10
// Motivo   : Inclusão de rotina para excluir/gerar registro ATU, quando for exluir uma aplicação
//            que houver mais de uma para o mesmo dia. (QryPesqHistFundoDel,QyDelHistFundoATU,QryDelHistFundo)
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 12/01/2005
// Linha(s) : QryResgate, QryAplicacao, QrySaldoFundoNovo, QrySaldoFundo,
//            QryFundoInvestOperacao, QryFundoInvestAplic, QryFundoInvestResg
// Motivo   : Ajuste na busca da DTAVIGENCIA da tabela FUNDOINVEST, não trazia o mais recente
//            registro
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 03/01/2005
// Linha(s) : Alt_9
// Motivo   : Retirada a condição de data da aplicação, so é possível escolher uma
//            aplicação para resgatar  
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 21/12/2004
// Linha(s) : Alt_8
// Motivo   : Ajuste da data inicial no reprocessamento da aplicação
//******************************************************************************
// Autor    : Marco Turon
// Data     : 10/10/2004
// Linha(s) : Alt_7
// Motivo   : Alteração na query QryVerAtualizacao para excluir Reg. tipo PIR
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 28/10/2004
// Linha(s) : Alt_6
// Motivo   : Retirada da crítica de Dia Útil para o campo DtEdDataReferenciaGeral
//            Acerto na passagem de Parametros da função Reprocessamento
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 27/10/2004
// Linha(s) : Alt_5
// Motivo   : Ajuste para buscar a ultima data de fechamento
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 21/10/2004
// Linha(s) : Alt_4
// Motivo   : Otimização das rotinas de exclusão e acerto de parametrização para as
//            querys e para o reprocessamento.
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 06/10/2004
// Linha(s) : Alt_3
// Motivo   : Inclusão do campo DTAINIPROC na QryFundoInvestAplic, QryAplicacao
//            QryFundoInvestResg, QryResgate e na funcao Reprocessamento
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 20/09/2004
// Linha(s) : Alt_2
// Motivo   : Inclusão da nova concepção para apuração de CPMF sobre as operações de
//            resgate
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 15/09/2004
// Código   : Alt_1
// Motivo   : Tratamento para cliente VALIA
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 12/07/2004
// Código   :
// Motivo   : Acerto nas query's QryFundoInvestOperacao, QryFundoInvestAplic,
//            QryFundoInvestResg. Devido a maximização da hora da datavigencia  
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
  uCtrlInvContab, faMensagem;

type

//******************************************************************************
//  TDadosCotas = Record
//                 DataCota:TDate;
//                 VlrCota :Double
//                End;

//******************************************************************************

{  TDispThread = Class(TThread)
    Protected
      I : Integer;
    Private
      Constructor Create;
    Public
      Procedure Execute; OverRide;
  End; }

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
    //AL_25 - Ricardo - 26/01/2006
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
    //AL_25 - Ricardo - 26/01/2006
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
    //AL_25 - Ricardo - 26/01/2006
    Dock973: TDock97;
    Toolbar972: TToolbar97;
    BtIncResg: TSpeedButton;
    BtAltResg: TSpeedButton;
    BtExcResg: TSpeedButton;
    TbsSaldo: TTabSheet;
    //AL_25 - Ricardo - 26/01/2006
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
    //AL_25 - Ricardo - 26/01/2006
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
    //AL_25 - Ricardo - 26/01/2006
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
    pmnuDisp: TPopupMenu;
    mnuOnLine: TMenuItem;
    mnuOffLine: TMenuItem;
    N2: TMenuItem;
    mnuTempo: TMenuItem;
    mnuLento: TMenuItem;
    mnuNormal: TMenuItem;
    mnuRapido: TMenuItem;
    qryVerGrupoDisp: TwwQuery;
    Label5: TLabel;
    DbDtRefAplc: TCMDateTimePicker;
    QryResgateIDTIPORESGATE: TFloatField;
    //AL_25 - Ricardo - 26/01/2006
    QrySaldoFundoSTAMARCAAPL: TStringField;
    CbxAplic: TComboBox;
    dbGrdSaldos: TwwDBGrid;
    Label30: TLabel;
    QryResgateDATAAPLICACAO: TDateTimeField;
    //AL_25 - Ricardo - 26/01/2006
    QryFundoInvestAplicDTAINIPROC: TDateTimeField;
    QryAplicacaoDTAINIPROC: TDateTimeField;
    QryFundoInvestResgDTAINIPROC: TDateTimeField;
    QryAplicacaoPLANO: TFloatField;
    QryAplicacaoPLNCODIGO: TFloatField;
    QryAplicacaoCODDOCUMENTO: TFloatField;
    QryResgateDTAINIPROC: TDateTimeField;
    //AL_25 - Ricardo - 26/01/2006
    QryDelHistFundo: TwwQuery;
    MnuUmPlanoFechto: TMenuItem;
    MnuTodosPlanosFechto: TMenuItem;
    QrySaldoFundoSALDOQTDCOTASBLQ: TFloatField;
    //AL_25 - Ricardo - 26/01/2006    
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
    //AL_25 - Ricardo - 26/01/2006      
    procedure BtCancResgClick(Sender: TObject);
    procedure DbLkcFundoInvestResgExit(Sender: TObject);
    procedure BtIncResgClick(Sender: TObject);
    procedure BtExcResgClick(Sender: TObject);    
    //AL_25 - Ricardo - 26/01/2006    
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
    procedure MnuTodosPlanosAbertClick(Sender: TObject);
    //AL_25 - Ricardo - 26/01/2006
    procedure BtAltResgClick(Sender: TObject);
    procedure DbLkcSaldoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbLkcSaldoExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnConfirmarClick(Sender: TObject);
    //AL_25 - Ricardo - 26/01/2006    
    procedure DbDtDataAplicacaoExit(Sender: TObject);
    procedure dbDDataOperacaoExit(Sender: TObject);
    procedure DbDtRefSaldoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuOnLineClick(Sender: TObject);
    procedure mnuOffLineClick(Sender: TObject);
    procedure mnuLentoClick(Sender: TObject);
    procedure mnuNormalClick(Sender: TObject);
    procedure mnuRapidoClick(Sender: TObject);
    //AL_25 - Ricardo - 26/01/2006    
    procedure CbxAplicExit(Sender: TObject);
    //AL_25 - Ricardo - 26/01/2006    
    procedure MnuUmPlanoFechtoClick(Sender: TObject);
    procedure MnuTodosPlanosFechtoClick(Sender: TObject);
    //AL_25 - Ricardo - 26/01/2006    
    procedure BtVoltaAplicClick(Sender: TObject);
    procedure BtVoltaResgClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    //AL_26 - Ricardo - 23/05/2006
    procedure DblTipoFundoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    //AL_26 - Ricardo - 23/05/2006
    procedure DblTipoFundoExit(Sender: TObject);
    //AL_26 - Ricardo - 23/05/2006
    procedure dblGestorCarteiraCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    //AL_26 - Ricardo - 23/05/2006      
    procedure dblGestorCarteiraExit(Sender: TObject);
    //AL_27 - Ricardo - 23/05/2006    
    procedure dbGrdSaldosUpdateFooter(Sender: TObject);
    //AL_33 - Ricardo - 20/06/2006
    procedure DbDtDataCotizacaoResgExit(Sender: TObject);

  private
    { Private declarations }
    //AL_26 - Ricardo - 23/05/2006
    wDataRef: TDateTime;
    wTipoFundoInvest : Integer;
    wGestor : Integer;
    //Al_26 - Fim    
    wValAnt : String;
    bTodos  : Boolean;
    Procedure AcertaBotoesAplicacao;
    procedure AcertaBotoesConsAplic;
    Procedure AcertaBotoesResgate;
    procedure AcertaBotoesConsResg;
    //AL_25 - Ricardo - 26/01/2006    
    Procedure SaldoFundos(TodosPlanos : Boolean;      //False - apenas 1 plano; True - todos os planos
                          iAbert, iFechto : Integer); //Possibilita o saldo na abertura ou no fechamento
    Procedure PreencheAplicacao;
    Procedure PreencheResgate;
    Procedure ProcuraAplResg;
    Procedure BuscaSaldos;
    Procedure AbreQryFundoInvestOperacao;
    Procedure AbreQryFundoInvestAplic;
    Procedure AbreQryFundoInvestResg;

    //AL_25 - Ricardo - 26/01/2006    
    Function  VerificaOperacao(sTipoOperacao : String;
                               iFundo        : Integer;
                               dData         : TDateTime;
                               iTipoOperacao : Integer = 0): Boolean;
    Function  VerificaAplicacao   : Boolean;
    Function  VerificaResgate     : Boolean;
    //AL_25 - Ricardo - 26/01/2006    
    Function  VerificaAtualizacao(iIdFundo : Integer; dDataIniFdo,dData : TDateTime)  : Boolean;
    Function  ProcExcluiFundoFilhasApl(iFundo,iOperacao : Integer; dData : TDateTime) : Boolean;
    Function  ProcExcluiFundoFilhasRes(iFundo,iOperacao : Integer; dData : TDateTime) : Boolean;

  public
    { Public declarations }

  end;

var
  frmCadLancamentoFundo : TfrmCadLancamentoFundo;
  bCheked , bDelete     : Boolean;

implementation

Uses
  UmensErro,UDataBase, uBibliotecaInvest, uSistema, UDiasUteisInv,
  dBaseDados, UFundoComum, dFundoComum, FConsMovFundos, FTelaAut,
  FProcResgates, FGrafPatrimonial, FGrafRentabilidadeCotas, UOperComum,
  FAguarde, FCadEspLancamento, FDmRelFundosSaldo, FDmRelatoriosFundos,
  FPrincipal;
{$R *.DFM}

//Constructor TDispThread.Create;
//Begin
//   { Executa Heranca Criando a Thread Suspença }
//   Inherited Create(True);
//   FreeOnTerminate := True;
//   Priority := tpLower;
//   Suspended := False;
//End;

//Procedure TDispThread.Execute;
//Begin
//   Synchronize(dmDisponibilidade.AbreQry);
//   Application.ProcessMessages;
//   while not Terminated do
//   begin
//      Inc(I);
//      if I = 90000000 then
//      begin
//         I := 1;
//         Synchronize(dmDisponibilidade.AbreQry);
//      end;
//      Application.ProcessMessages;
//   end;
//End;


procedure TfrmCadLancamentoFundo.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  //AL_25 - Ricardo - 26/01/2006    
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
  //AL_25 - Ricardo - 26/01/2006
  OperComum.LimpaParametros(QryTipoOperacao);
  QryTipoOperacao.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  QryTipoOperacao.Open;

  //Preenche os Paramentros e refaz a Consulta dos Resgates
  With QryResgate Do
  Begin
    //AL_25 - Ricardo - 26/01/2006
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
  //AL_25 - Ricardo - 26/01/2006
  If Trim(DtEdDataReferenciaGeral.Text) = '' Then
     Exit;

  DbDtRefSaldo.Text     := DtEdDataReferenciaGeral.Text;

  PreencheAplicacao;

  PreencheResgate;

  If QryAplicacao.Eof Then
     BtExcAplic.Enabled := False
  Else
     BtExcAplic.Enabled := True;

  If QryResgate.Eof Then
     BtExcResg.Enabled      := False
  Else
     BtExcResg.Enabled      := True;

  //AL_25 - fIM
end;

procedure TfrmCadLancamentoFundo.BtOkAplicClick(Sender: TObject);
Var
  sTipoOper, sNaturezaOper, sOperacao, sMens : String;
  iIdForCli, iPlanilha, iDocumento, iPlano, iFlgContaInvest : Integer;
  fVlrCustoAcoes, fVlrVarAcoes : Currency;
  bConfirma : Boolean;
begin
  inherited;

  try

     fVlrCustoAcoes := 0;
     fVlrVarAcoes   := 0;

     If Not VerificaAplicacao Then
        Exit;

     //AL_25 - Ricardo - 26/01/2006
     If VerificaOperacao('A', QryFundoInvestAplic.FieldByName('IDFUNDOINVEST').AsInteger,
                          DbDtDataAplicacao.Date) Then
     Begin
        MsgDlg('Já há lançamento de Aplicação para o Fundo no dia '+dbDDataOperacao.Text+'.'#13+
               'A operação será Cancelada!','Informação',mtInformation,[mbOk],0);
        BtCancAplicClick(Sender);
        Exit;
     End;

     // Busca dados do Tipo de Operacao
     FazQuery(QryAux,'SELECT * FROM TIPOOPERACAO WHERE IDTIPOINVEST='+QryFundoInvestAplic.FieldByName('IDTIPOINVEST').AsString+
                     ' AND (CODTIPDOC IS NOT NULL) AND RECPAG = ''P'''+
                     ' AND IDTIPOOPERACAO > 0 AND NATUREZAOPERACAO =  ''A''');

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

     //AL_29 - Ricardo - 01/06/2006
     if VerEmAbertura(QryFundoInvestAplic.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
     begin
        QryAux.Close;
        BtCancAplicClick(Sender);        
        Exit;
     end;

     Try
       // Inicia Transação
       If not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

       // Caso Inserindo Gera sequencial
       If DsAplicacao.State In [DsInsert] Then
         QryAplicacao.FieldByName('IDOPERACAOFUNDO').AsInteger:= LeUltRegistro(Nil,'OPERACAOFUNDO');

       // Preenche outros dados
       QryAplicacao.FieldByName('IDTIPOINVEST').AsInteger:=
                                 QryFundoInvestAplic.FieldByName('IDTIPOINVEST').AsInteger;

       QryAplicacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger    :=
                                 QryFundoInvestAplic.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

       QryAplicacao.FieldByName('IDTIPOOPERACAO').AsInteger   :=
                                 QryAux.FieldByName('IDTIPOOPERACAO').AsInteger;

       QryAplicacao.FieldByName('NATUREZAOPERACAO').AsString  := sNaturezaOper;

       //AL_25 - Ricardo - 26/01/2006    
       if not QryFundoInvestAplic.FieldByName('IDCARTEIRAINVEST').IsNull then
          QryAplicacao.FieldByName('IDCARTEIRAINVEST').AsInteger :=
                                 QryFundoInvestAplic.FieldByName('IDCARTEIRAINVEST').AsInteger;

       QryAplicacao.FieldByName('QTDDECQTD').AsInteger        :=
                                 QryFundoInvestAplic.FieldByName('QTDDECQTD').AsInteger;

       QryAplicacao.FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

       QryAux.Close;

       // Confirma Operacao
       QryAplicacao.Post;
       QryAplicacao.CommitUpdates;

       iPlanilha  := -1;
       iDocumento := -1;
       iPlano     := -1;

       //AL_25 - Ricardo - 26/01/2006    
       iIdForCli := OperComum.BuscaForCli(QryAplicacaoIDTIPOINVEST.AsInteger,
                        QryFundoInvestAplicIDGESTORCARTEIRA.AsInteger,
                        QryAplicacaoIDTIPOOPERACAO.AsInteger, pRPI.IDTIPOCLIENTEEMI);

       If (QryAplicacaoDATAOPERACAO.AsDateTime <> QryAplicacaoDATACOTIZACAO.AsDateTime) And
          (QryAplicacaoQTDOPERACAO.AsFloat = 0) Then
          sTipoOper := 'CTZ'
       Else
          sTipoOper := 'OPE';

       //Rotina de confirmação das operações
       //AL_38
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
                            sTipoOper, True, iPlanPrevCtbPatro, -1, -1, 0{Rendimento}, sMens) Then
       Begin
          //Al_16/Al_17 - Ricardo - 01/06/2005
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
          //Al_16/Al_17 - Fim
          //AL_25 - Ricardo - 26/01/2006
          BtCancAplicClick(Sender);
          Exit;
       End;

       ExecutaQuery(QryAux,'UPDATE OPERACAOFUNDO SET STACONFIRMA = ''S'' WHERE '+
                           '(IDOPERACAOFUNDO   = '''+
                            IntToStr(QryAplicacaoIDOPERACAOFUNDO.AsInteger)  +''')');

       QryAux.Close;                            

       //Al_3 - Ricardo - 29/04/2005
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
       //Al_16/Al_17 - Ricardo - 01/06/2005
       begin
          If dtmBaseDados.dbBaseDados.InTransaction then
             DtmBaseDados.dbBaseDados.Rollback;
          //AL_25 - Ricardo - 26/01/2006    
          BtCancAplicClick(Sender);
          Exit;
       end;
       //Al_16/Al_17 - Fim

       // Update no Plano,CodDocumento e PlnCodigo na OPERACAOFUNDO
       With QryUpdOperacaoApl Do
       Begin
         Close;
         ParamByName('IDOPERACAOFUNDO').AsInteger      := QryAplicacao.FieldByName('IDOPERACAOFUNDO').AsInteger;
         //AL_31 - Ricardo - 20/06/2006
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

       //AL_25 - Ricardo - 26/01/2006
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
          //AL_25 - Ricardo - 26/01/2006
       end;

     Except
       On E:Exception Do Begin
         //Al_16 - Ricardo - 01/06/2005
         MsgDlg('Não foi possivel confirmar a Operação:'+#13+
                E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
         //Cancela Transação
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

     //AL_25 - Fim
   finally
   end;
end;

procedure TfrmCadLancamentoFundo.BtCancAplicClick(Sender: TObject);
begin
  inherited;
  try
     //Al_14 - Ricardo - 18/05/2005
     If dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Rollback;

     //AL_25 - Ricardo - 26/01/2006
     //Al_14 - Ricardo - 18/05/2005

     DbLkcFundoInvest.Enabled := True;

   // Volta Ambiente
     DbGrdAplicacao.BringToFront;
     pnlDadosBase.Enabled := True;
     if BtAltAplic.Tag = 1 then
     begin
        BtAltAplic.Tag := 0;
        AcertaBotoesConsAplic;
     end else
        AcertaBotoesAplicacao;

     Dock978.Visible    := False;

     // Refresh
     PreencheAplicacao;
   finally
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

//AL_25 - Ricardo - 26/01/2006    

procedure TfrmCadLancamentoFundo.FormShow(Sender: TObject);
begin

  inherited;

  //AL_38
  fraMens.Apaga;

  bDelete  := False;

  DbGrdAplicacao.BringToFront;
  //AL_25 - Ricardo - 26/01/2006
  QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  QryTipoFundo.Open;
  QryGestorCart.Open;

  If iTipoInvestUsu = 7 Then
     sbtnEspecificoFdo.Enabled := False
  Else
     sbtnEspecificoFdo.Enabled := True;

  PnlAplicacao.SendToBack;
  PnlResgate.SendToBack;
  //AL_25 - Ricardo - 26/01/2006
  DBReQtd.Clear;
  //AL_24 - Ricardo - 24/10/2005
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

     //Alt_5 - RICARDO - 27/10/2004
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

  //AL_26 - Ricardo - 23/05/2006
  wDataRef   := StrToDate(DtEdDataReferenciaGeral.Text);
  wTipoFundoInvest := 0;
  wGestor    := 0;
  //AL_26 - Fim

  //AL_25 - Ricardo - 26/01/2006
  QryUltDataFech.Close;

  OperComum.LimpaParametros(qryVerGrupoDisp);
  qryVerGrupoDisp.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
  qryVerGrupoDisp.Open;


  if qryVerGrupoDisp.IsEmpty then
  begin
     mnuOnLine.Enabled  := True;
     mnuOffLine.Enabled := False;
  end;

  qryVerGrupoDisp.Close;

  //AL_12 - Ricardo - 30/03/2005
  MnuUmPlanoFechto.Caption := sPlanPrevCtbPatro;
  //AL_12 - Fim

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
//AL_26 - Ricardo - 23/05/2006
//  SelectNext(ActiveControl,True,True);
  //AL_25 - Fim
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

  // Prepara Ambiente
  Dock978.Visible  := True;
  BtAltAplic.Tag   := 1;
  AcertaBotoesConsAplic;
  PnlAplicacao.BringToFront;
  tbsDadosApl.Enabled     := False;
  tbsObsApl.Enabled       := False;
  pgcAplicacao.ActivePage := tbsDadosApl;

  DbLkcFundoInvest.Text  := QryAplicacaoDESCFUNDOINVEST.AsString;
  DBeCETIPApl.Text       := QryFundoInvestAplic.FieldByName('CODFUNCETIP').AsString;
  DbDtDataAplicacao.Text := QryAplicacao.FieldByName('DATAOPERACAO').AsString;
  // Preenche Decimais da Quantidade
  DbEdQtdOper.DecDigits  := QryFundoInvestAplic.FieldByName('QTDDECQTD').AsInteger;

end;

procedure TfrmCadLancamentoFundo.BtExcAplicClick(Sender: TObject);
Var
  //Al_15 - Ricardo - 31/05/2005
  dDataIniProc, dDataOper : TDateTime;
  iTipoFundoInvest, iFundoInvest : Integer;

   //AL_10 -  Lucas Barth Pacini - 16/02/2005
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
  If (QryAplicacao.Active = False) Or (QryAplicacao.IsEmpty = True) Then Begin
    MsgDlg('Consulta não foi executada.','Mensagem do Sistema',mtWarning,[mbOk],0);
    BtExcAplic.Down := False;
    Exit;
  End;

  // AL_18 - Turon
  //AL_34
  if not CtrlInvContab.TestaPeriodo(QryAplicacao.FieldByName('DATAOPERACAO').AsString, iTipoInvestUsu) then
  begin
    MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', mtWarning,[mbOk],0);
    BtExcAplic.Down := False;
    Exit;
  End;

  //AL_29 - Ricardo - 01/06/2006
  if VerEmAbertura(QryAplicacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
  begin
    BtExcAplic.Down := False;
    Exit;
  end;

  //AL_38
  try //Finally
    If MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,
              [mbYes, mbNo],0) = mrYes
    Then Begin

      Try
        // Inicia Transação
        If not dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.StartTransaction;

        //Alt_4 - RICARDO - 21/10/2004
        QryTipoFundoInvest.Close;
        QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                           QryAplicacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
        QryTipoFundoInvest.Open;

        iTipoFundoInvest := QryAplicacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
        iFundoInvest     := QryAplicacao.FieldByName('IDFUNDOINVEST').AsInteger;
        dDataOper        := QryAplicacao.FieldByName('DATAOPERACAO').AsDateTime;
        //Al_15 - Ricardo - 31/05/2005
        dDataIniProc     := QryAplicacao.FieldByName('DTAINIPROC').AsDateTime;

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
           //Al_17 - Ricardo - 01/06/2005
           If dtmBaseDados.dbBaseDados.InTransaction then
              dtmBaseDados.dbBaseDados.Rollback;
           BtCancAplicClick(Sender);
           //Al_17 - Fim
           Exit;
        end;

        If ((QryAplicacao.FieldByName('CODDOCUMENTO').AsInteger <= 0)  And
            (QryAplicacao.FieldByName('PLNCODIGO').AsInteger    <= 0)) Then
        begin
           If Not ExecutaQuery(QryAux,'DELETE FROM HISTFUNDO WHERE IDOPERACAOFUNDO = '+
                                      QryAplicacao.FieldByName('IDOPERACAOFUNDO').AsString) Then
           begin
             //Al_17 - Ricardo - 01/06/2005
             If dtmBaseDados.dbBaseDados.InTransaction then
                dtmBaseDados.dbBaseDados.Rollback;
             BtCancAplicClick(Sender);
             //Al_17 - Fim
             Exit;
           end;
        end;

        //AL_25 - Ricardo - 26/01/2006
        //Exclui Operacao de Aplicacao
        QryAplicacao.Delete;
        QryAplicacao.CommitUpdates;

        //Confirma Transação
        If dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.Commit;

        bConfirma := True;

        If dDataOper <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
        begin
           //Al_15 - Ricardo - 31/05/2005
           //Alt_8 - Ricardo - 21/12/2004
           //Alt_4 - Ricardo - 21/10/2004
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
        //Retirado o reprocessamento faz a unificação das n aplicações no dia para um fundo
             //AL_10 -  Lucas Barth Pacini - 16/02/2005
             //*** EXLUI HISTORICO DA OPERAÇÃP/ATU ***
        PreencheAplicacao;
        BuscaSaldos;
        //AL_25 - Fim

      Except
         On E:Exception Do
         Begin
            //Al_16/Al_17 - Ricardo - 01/06/2005
            MsgDlg('Não foi possível excluir a Operação:'+#13+
                   E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            // Cancela Transação
            If dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
            //AL_25 - Ricardo - 26/01/2006
            QryTipoFundoInvest.Close;
            BtCancAplicClick(Sender);
            //Al_16/Al_17 - Fim
            bConfirma := False;
         End;
      End; // Except
    End; // If Exclui
  finally
    //AL_25 - Ricardo - 26/01/2006
    BtIncAplic.Enabled := True;
    BtExcAplic.Enabled := True;
    BtExcAplic.Down    := False;
    If QryAplicacao.RecordCount <= 0 Then
       BtExcAplic.Enabled := False;
    //AL_25 - Fim
    bDelete := False;

    if bConfirma then
       MsgDlg('Processo Concluído.','Mensagem do Sistema',mtInformation ,[mbOk],0);
  end;
  //AL_38 - Fim

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

//**************
// OK Pedido
procedure TfrmCadLancamentoFundo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //AL_25 - Ricardo - 26/01/2006
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
  //AL_25 - Fim

  inherited;
end;

procedure TfrmCadLancamentoFundo.BuscaSaldos;
begin
  //AL_25 - Ricardo - 26/01/2006
  If Trim(DtEdDataReferenciaGeral.Text) = '' Then
     DbDtRefSaldo.Text := '';

   If Trim(DbDtRefSaldo.Text) = '' Then
      Exit;

   //AL_27 - Ricardo - 23/05/2006   
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

   //AL_28 - Ricardo - 23/05/2006
   QrySaldoFundoVLRCOTAATUAL.DisplayFormat      := '###,#0.000000000';
   QrySaldoFundoVLRCOTAAPLICACAO.DisplayFormat  := '###,#0.000000000';
   QrySaldoFundoSALDOQTDCOTAS.DisplayFormat     := '###,#0.000000000';
   QrySaldoFundoSALDOQTDCOTASBLQ.DisplayFormat  := '###,#0.000000000';
   if Trim(DbLkcSaldo.Text) <> '' then
   begin
      //AL_25 - Ricardo - 26/01/2006
      QrySaldoFundoVLRCOTAATUAL.DisplayFormat  :=
                   MontaMascaraDecVlr(QryFundoInvestOperacaoIDFUNDOINVEST.AsInteger);
      QrySaldoFundoSALDOQTDCOTAS.DisplayFormat :=
                   MontaMascaraDecQtd(QryFundoInvestOperacaoIDFUNDOINVEST.AsInteger);
      QrySaldoFundoSALDOQTDCOTASBLQ.DisplayFormat := QrySaldoFundoSALDOQTDCOTAS.DisplayFormat;
      //AL_25 - Fim
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
     //AL_25 - Ricardo - 26/01/2006
     Exit;
  end;

  if dsAplicacao.State = dsInsert then
  begin
     MsgDlg('Não foi finalizada a operação de Aplicação. Confirme ou cancele a Operação.','Informação',mtInformation,[mbOk],0);
     PgcSaldos.ActivePage := TbsAplicacao;
     Exit;
  end;

  //AL_25 - Ricardo - 26/01/2006
  // Em consulta de Aplicação e/ou resgate
  if BtAltAplic.Tag = 1 then
     BtCancAplicClick(Sender);

  if BtAltResg.Tag = 1 then
     BtCancResgClick(Sender);
   //AL_25 - Fim

  inherited;

  //AL_25 - Ricardo - 26/01/2006
  If (PgcSaldos.ActivePage      = TbsAplicacao) Then    //Aplicação
  Begin
     //AL_26 - Ricardo - 23/05/2006
     if DbGrdAplicacao.CanFocus then
        DbGrdAplicacao.SetFocus;
     PgcSaldos.ActivePage := TbsAplicacao;
     pnlSaldos.Visible    := False;
  End
  Else If PgcSaldos.ActivePage  = TbsResgate Then      //Resgate
  Begin
     //AL_26 - Ricardo - 23/05/2006
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
     //AL_26 - Ricardo - 23/05/2006
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
     //AL_26 - Ricardo - 23/05/2006
     if dbGrdSaldos.CanFocus then
        dbGrdSaldos.SetFocus;
     PgcSaldos.ActivePage      := TbsSaldo;
     pnlSaldos.Height          := 39;
     pnlSaldos.Visible         := False;
     pnlSaldoSintetico.Visible := False;
     pnlSaldosDetalhes.Visible := True;
  end;
  //AL_25 - Fim

  //AL_25 - Ricardo - 26/01/2006
  If PgcSaldos.ActivePage      = TbsResgate Then
  begin
     If QryResgate.Eof Then
        BtExcResg.Enabled      := False
     Else
        BtExcResg.Enabled      := True;
  end;
  //AL_25 - Fim
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

   //AL_25 - Ricardo - 26/01/2006
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
//AL_25 - Ricardo - 26/01/2006
  //AL_38
  sTipoOper, sMens : String;
  iIdForCli, iPlanilha, iDocumento, iPlano, iFlgContaInvest, iTipoResgate : Integer;
  fVlrCustoAcoes, fVlrVarAcoes, fValorOperacao, fValorIR : Currency;
  dDataResgateIni, dDataResgateFim : TDateTime;
  bConfirma : Boolean;
begin

  try

     fraMens.Mostra;
     fraMens.Max := 7;
     fraMens.Pos := 0;
     fraMens.Mes := 'Verificando o Resgate.';
     fraMens.Incrementa;

     If bDelete Then
     Begin
        If Not VerificaResgate Then
           Exit;
     End;

     fraMens.Mes := 'Verificando período Contábil.';
     fraMens.Incrementa;

     // AL_18 - Turon
     //AL_34
     if not CtrlInvContab.TestaPeriodo(dbDDataOperacao.Text, iTipoInvestUsu) then
     begin
        MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
        Exit;
     end;     

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

     fraMens.Mes := 'Verificando os lançamentos do dia.';
     fraMens.Incrementa;

     If VerificaOperacao('D',QryFundoInvestResg.FieldByName('IDFUNDOINVEST').AsInteger,
                         dbDDataOperacao.Date,
                         StrToInt(DbLkcTipoOperacaoResg.LookupValue)) Then
     Begin
        MsgDlg('Já há lançamento de Resgate para o Fundo no dia '+dbDDataOperacao.Text+'.'#13+
               'A operação será Cancelada!','Informação',mtInformation,[mbOk],0);
        BtCancResgClick(Sender);
        Exit;
     End;

     //AL_29 - Ricardo - 01/06/2006
     if VerEmAbertura(QryFundoInvestResg.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
     begin
        BtCancResgClick(Sender);
        Exit;
     end;

     fraMens.Mes := 'Verificando período Contábil.';
     fraMens.Incrementa;

     // AL_18 - Turon
     //AL_34
     if not CtrlInvContab.TestaPeriodo(dbDDataOperacao.Text, iTipoInvestUsu) then
     begin
        MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
        Exit;
     end;

     fraMens.Mes := 'Efetuando o lançamento de Resgate.';
     fraMens.Incrementa;

     inherited;

     Try
       // Inicia Transação
       If not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

       DbLkcFundoInvestResg.Enabled := True;
       pnlAguardar.Visible          := True;

       if QryTipoOperacao.FieldByName('FLGCONTAINVEST').AsInteger = 0 then
          iTipoResgate := 1
       else
          iTipoResgate := 2;

       If bDelete Then
       Begin
   // Caso Inserindo Gera sequencial
          If DsResgate.State In [DsInsert] Then
             QryResgate.FieldByName('IDPEDIDOFUNDO').AsInteger:= LeUltRegistro(Nil,'PEDIDOFUNDO');

   // Preenche outros dados
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

       //AL_30 - Ricardo - 20/06/2006
       If (QryResgateDATAPEDIDO.AsDateTime >= QryResgateDATACOTIZACAO.AsDateTime) Then
       Begin
          fraMens.Incrementa;

          //Alt_1 - RICARDO - 20/09/2004
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
             //Al_16 - Ricardo - 01/06/2005
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
             //Al_20 - Ricardo - 15/06/2005
             QryConfirmacao.ParamByName('IDPEDIDOFUNDO').AsInteger     :=
                                        QryResgate.FieldByName('IDPEDIDOFUNDO').AsInteger;
             QryConfirmacao.Open;

             fraMens.Max := QryConfirmacao.RecordCount+3;
             fraMens.Incrementa;

             fValorIR  := 0;

             While Not QryConfirmacao.Eof Do
             Begin
                If (QryConfirmacaoDATAOPERACAO.AsDateTime <> QryConfirmacaoDATACOTIZACAO.AsDateTime) And
                   (QryConfirmacaoQTDOPERACAO.AsFloat = 0) Then
                    sTipoOper := 'CTZ'
                Else
                    sTipoOper := 'OPE';

             //Rotina de confirmação das operações
                //AL_38
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
                                     sTipoOper , False {True}, iPlanPrevCtbPatro,-1,-1,
                                     QryConfirmacaoVLRRENDIMENTO.AsFloat, sMens) Then

                begin
                   //Al_16 - Ricardo - 01/06/2005
                   //AL_38
                   if sMens <> '' then
                      Raise Exception.Create('Não foi possível confirmar o Resgate' + #13 +
                                             'Mensagem: ' + sMens)
                   else
                      Raise Exception.Create('Não foi possível confirmar o Resgate' + #13 +
                                             'Ocorreu um problema durante o processo de gravação' + #13 +
                                             'Refaça a operação');
                end;

                fValorIR       := fValorIR + QryConfirmacaoVLRIR.AsFloat;

                ExecutaQuery(QryAux,'UPDATE OPERACAOFUNDO SET STACONFIRMA = ''S'' WHERE '+
                                    '(IDOPERACAOFUNDO   = '''+
                                      IntToStr(QryConfirmacaoIDOPERACAOFUNDO.AsInteger)  +''')');
                QryAux.Close;

                QryConfirmacao.Next;

                fraMens.Incrementa;

             End;

             QryConfirmacao.Close;

             fraMens.Mes := 'Integração Contábil e Financeira.';

             If iTipoInvestUsu <> 6 Then
             Begin
                fVlrCustoAcoes := 0;
                fVlrVarAcoes   := 0;
             End;

             fraMens.Incrementa;

             //Al_3 - Ricardo - 29/04/2005
             If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                             QryResgate.FieldByName('IDTIPOOPERACAO').AsInteger,
                                             QryResgate.FieldByName('IDTIPOINVEST').AsInteger,
                                             QryResgate.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             QryResgate.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                             iIdForCli,
                                             QryResgate.FieldByName('IDFUNDOINVEST').AsInteger,
                                             StrToDate(dbDDataOperacao.Text),
                                             QryResgate.FieldByName('DATALIQUIDACAO').AsDateTime,
                                             sTipoOper,
                                             QryTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString,
                                             DbLkcFundoInvestResg.Text+' / '+sPlanPrevCtbPatro,
                                             True,
                                             QryResgate.FieldByName('VLRPEDIDO').AsFloat,
                                             fValorIR, 0, 0, 0,
                                             fVlrCustoAcoes, fVlrVarAcoes, -1, 0, 0, 0,
                                             QryTipoOperacao.FieldByName('FLGCONTAINVEST').AsInteger) Then
             begin
                //Al_17 - Ricardo - 01/06/2005
                If dtmBaseDados.dbBaseDados.InTransaction then
                   dtmBaseDados.dbBaseDados.Rollback;
                BtCancResgClick(Sender);
                //Al_17 - Fim
                Exit;
             end;
          End;
       End
       Else
       Begin

          fraMens.Mes := 'Integração Contábil e Financeira.';
          fraMens.Incrementa;

          //Al_3 - Ricardo - 29/04/2005
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
                                          False,
                                          QryResgate.FieldByName('VLRPEDIDO').AsFloat,
                                          0, 0, 0, 0,
                                          fVlrCustoAcoes, fVlrVarAcoes, -1, 0, 0, 0,
                                          QryTipoOperacao.FieldByName('FLGCONTAINVEST').AsInteger) Then

          begin
             //Al_17 - Ricardo - 01/06/2005
             If dtmBaseDados.dbBaseDados.InTransaction then
                dtmBaseDados.dbBaseDados.Rollback;
             BtCancResgClick(Sender);
             //Al_17 - Fim
             Exit;
          end;

          fraMens.Incrementa;

       End;

       // Update no Plano,CodDocumento e PlnCodigo na PEDIDOFUNDO
       With QryUpdPedido Do
       Begin
         Close;
         ParamByName('IDPEDIDOFUNDO').AsInteger        := QryResgate.FieldByName('IDPEDIDOFUNDO').AsInteger;
         //AL_31 - Ricardo - 20/06/2006
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

       fraMens.Incrementa;

       //Confirma Transação
       If bDelete Then  Begin
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
         //Al_16/Al_17 - Ricardo - 01/06/2005
         MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
         // Cancela Transação
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

        PreencheResgate;

        BuscaSaldos;

        // Volta Ambiente
        pnlDadosBase.Enabled := True;
        DbGrdrResgate.BringToFront;

        BtIncResg.Enabled := False;
        BtExcResg.Enabled := False;
        Dock974.Visible   := False;

        AcertaBotoesResgate;
//AL_25 - Fim
        pnlAguardar.Visible := False;

        if bConfirma then
           MsgDlg('Processo Concluído!','Mensagem do Sistema',mtInformation ,[mbOk],0);

     End;

     bDelete := False;

   finally
   end;
end;

procedure TfrmCadLancamentoFundo.BtCancResgClick(Sender: TObject);
begin
  inherited;
  try
     //Al_14 - Ricardo - 18/05/2005
     If dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Rollback;
//AL_25 - Ricardo - 26/01/2006
     //Al_14 - Ricardo - 18/05/2005

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
//AL_25 - Fim
   finally
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
//AL_25 - Ricardo - 26/01/2006
      dDtaLiq := OperComum.DataPrazo(dbDDataOperacao.Date, QryFundoInvestResg.FieldByName('PZOLIQRESG').AsInteger);

      QryResgateDATALIQUIDACAO.AsDateTime := dDtaLiq;

      dbDDataLiquidacaoResg.Date          := dDtaLiq;

      DBeCETIPResg.Text       := QryFundoInvestResg.FieldByName('CODFUNCETIP').AsString;

      DbEdCotaResg.DecDigits  := QryFundoInvestResgQTDDECVALOR.AsInteger;

      //AL_28 - Ricardo - 23/05/2006
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
//AL_25 - Fim
   end;
end;

procedure TfrmCadLancamentoFundo.BtIncResgClick(Sender: TObject);
begin
  if ActiveControl = DtEdDataReferenciaGeral then
     SelectNext(ActiveControl,True,True);

  bDelete  := True;

  QrySaldoFundoTotal.Close;

//AL_25 - Ricardo - 26/01/2006
  //AL_24 - Ricardo - 24/10/2005
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
//AL_25 - Ricardo - 26/01/2006
// Testa dados
  If (QryResgate.Active = False) Then Begin
    MsgDlg('Consulta não foi executada.', 'Mensagem de Sistema', mtWarning,[mbOk],0);
    BtIncAplic.Down := False;
    Exit;
  End;

  Dock974.Visible :=True;

  PnlResgate.BringToFront;

  AcertaBotoesResgate;

  pnlDadosBase.Enabled  := False;

  pgcResgate.ActivePage := tbsDadosResg;
//AL_25 - Fim
  tbsDadosResg.Enabled  := True;
  tbsObsResg.Enabled    := True;

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
//AL_25 - Ricardo - 26/01/2006
  If (QryResgate.Active = False) Or (QryResgate.IsEmpty = True) Then Begin
    MsgDlg('Consulta não foi executada.', 'Mensagem de Sistema', mtWarning, [mbOk],0);
    BtExcResg.Down := False;
    Exit;
  End;

  // AL_18 - Turon
  //AL_34
  if not CtrlInvContab.TestaPeriodo(QryResgate.FieldByName('DATAPEDIDO').AsString, iTipoInvestUsu) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem de Sistema', mtWarning,[mbOk],0);
     BtExcResg.Down := False;
     Exit;
  End;

  //AL_29 - Ricardo - 01/06/2006
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
        //Alt_4 - Ricardo - 21/10/2004
        dDataIniProc     := QryResgate.FieldByName('DTAINIPROC').AsDateTime;

        fraMens.Incrementa;

         // Deleta o resgate do dia em todas as tabelas do Sistema(Fundo, Financeiro e Contabilidade)
         //AL_38
         If Not ExcluiResgate(QryResgate.FieldByName('IDPEDIDOFUNDO').AsInteger, False) Then
            Raise Exception.Create('Ocorreu um problema ao excluir a operação');

        fraMens.Incrementa;

        // Exclui Filhas
        If Not ProcExcluiFundoFilhasRes(QryResgate.FieldByName('IDFUNDOINVEST').AsInteger,
                                        QryResgate.FieldByName('IDTIPOOPERACAO').AsInteger,
                                        QryResgate.FieldByName('DATAPEDIDO').AsDateTime) Then
        begin
          // Cancela Transação
          //Al_17 - Ricardo - 01/06/2005
          If dtmBaseDados.dbBaseDados.InTransaction then
             dtmBaseDados.dbBaseDados.Rollback;
          BtCancResgClick(Sender);
          //Al_17 - Fim
          Exit;
        end;

        fraMens.Incrementa;

        //Confirma Transação
        If dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.Commit;

        bConfirma := True;

        PreencheResgate;

        fraMens.Incrementa;

        fraMens.Apaga;

        If dDataOper <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
        begin
           //Alt_4 - Ricardo - 21/10/2004
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

        if bConfirma then
           MsgDlg('Processo Concluído.','Mensagem do Sistema',mtInformation ,[mbOk],0);

      Except
        On E:Exception Do Begin
           //Al_16 - Ricardo - 01/06/2005
           MsgDlg('Não foi possível excluir a Operação:'+#13+
                  E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);

           BtExcResg.Down      := False;
           pnlAguardar.Visible := False;

           // Cancela Transação
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
    BtExcResg.Enabled    := True;
    BtExcResg.Down       := False;
    If QryResgate.RecordCount <= 0 Then
       BtExcResg.Enabled := False;
    end;
    //AL_38 - Fim
  //AL_25 - Fim
end;

procedure TfrmCadLancamentoFundo.sbtnExecResgateClick(Sender: TObject);
begin
  inherited;
   WindowState := wsMinimized;
   AbrirForm(frmProcResgates, TfrmProcResgates, False);
end;

//AL_25 - Ricardo - 26/01/2006
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
//AL_25 - Fim

procedure TfrmCadLancamentoFundo.DtEdDataReferenciaGeralExit(Sender: TObject);
begin
  inherited;
   //AL_26 - Ricardo - 23/05/2006
   if wDataRef  <> StrToDate(DtEdDataReferenciaGeral.Text) then
   begin
      wDataRef  := StrToDate(DtEdDataReferenciaGeral.Text);

   //AL_25 - Ricardo - 26/01/2006
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

   //AL_25 - Fim
   end;
   //AL_26 - Fim   
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

// Data da Aplicação
  If DbDtDataAplicacao.Date = 0 Then Begin
    MsgDlg('Data da Aplicação não está preenchida.', 'Mensagem do Sistema', mtWarning,[mbOk],0);
    if DbDtDataAplicacao.CanFocus then
       DbDtDataAplicacao.SetFocus;
    Result := False;
    Exit;
  End;

  // AL_18 - Turon
  //AL_34
  if not CtrlInvContab.TestaPeriodo(DbDtDataAplicacao.Text, iTipoInvestUsu) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', mtWarning,[mbOk],0);
     if DbDtDataAplicacao.CanFocus then
        DbDtDataAplicacao.SetFocus;
     Result := False;
     Exit;
  End;

// Data da Liquidação
  If DbDtDataLiquidacao.Date = 0 Then Begin
    MsgDlg('Data da Liquidação não está preenchida.', 'Mensagem do Sistema', mtWarning,[mbOk],0);
    if DbDtDataLiquidacao.CanFocus then
       DbDtDataLiquidacao.SetFocus;
    Result := False;
    Exit;
  End;
// Valor Aplicado
  If DbEdValorAplic.Value <= 0 Then Begin
    MsgDlg('Valor Aplicado não pode ser menor ou igual a zero.', 'Mensagem do Sistema', mtWarning,[mbOk],0);
    if DbEdValorAplic.CanFocus then
       DbEdValorAplic.SetFocus;
    Result := False;
    Exit;
  End;
// Quantidade Operada
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
//AL_25 - Ricardo - 26/01/2006
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

  //AL_32 - Ricardo -20/06/2006
  If DbEdCotaResg.Value = 0 Then Begin
    MsgDlg('Valor da Cota não pode igual a zero.','Messagem do Sistema',mtWarning,[mbOk],0);
    if DbEdCotaResg.CanFocus then
       DbEdCotaResg.SetFocus;
    Result := False;
    Exit;
  End;

  Result := True;
End;

//AL_25 - Ricardo - 26/01/2006
procedure TfrmCadLancamentoFundo.BtIncAplicClick(Sender: TObject);
begin
  if ActiveControl = DtEdDataReferenciaGeral then
     SelectNext(ActiveControl,True,True);

  inherited;
  // Testa dados
  If (QryAplicacao.Active = False) Then Begin
    MsgDlg('Consulta não foi executada.','Mensagem do Sistema',mtWarning,[mbOk],0);
    BtIncAplic.Down := False;
    Exit;
  End;

  // Al_18 - Ajusta o posicionamento dos Tabs
  // Prepara Ambiente
  Dock978.Visible     := True;
//AL_25 - Ricardo - 26/01/2006
  PnlAplicacao.BringToFront;

  AcertaBotoesAplicacao;

  pnlDadosBase.Enabled := False;

  pgcAplicacao.ActivePage := tbsDadosApl;

  tbsDadosApl.Enabled := True;
  tbsObsApl.Enabled   := True;
//AL_25 - Fim
  // Insere Registro
  QryAplicacao.Append;
  QryAplicacaoDATAOPERACAO.AsDateTime   := DtEdDataReferenciaGeral.Date;

  if DbDtDataAplicacao.CanFocus then
     DbDtDataAplicacao.SetFocus;

  // AL_18 - Fim
end;

procedure TfrmCadLancamentoFundo.MnuPatrimonioClick(Sender: TObject);
begin
   inherited;
   // Preenche os parametros pelos componentes de tela e abre a qryFundoInvestOperacao
   AbreQryFundoInvestoperacao;

   // busca fundo que não tiveram aplicacao neste dia.
   With QryVerSaldosFundos Do Begin
     Close;
//AL_25 - Ricardo - 26/01/2006
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
   if dData > dDataIniFdo then  // Não valida se data <= à data de inicio do Fundo
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
//AL_25 - Ricardo - 26/01/2006
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
//AL_25 - Ricardo - 26/01/2006
   Except
      Result := False;
   End;
//AL_25 - Ricardo - 26/01/2006
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
//AL_25 - Ricardo - 26/01/2006
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
//AL_25 - Ricardo - 26/01/2006
   Except
      Result := False;
   End;
//AL_25 - Ricardo - 26/01/2006
   QryAux.Close;
   QryDelEspecificoRes.Close;
End;

procedure TfrmCadLancamentoFundo.sbtnDisponibilidadeClick(Sender: TObject);
begin
   // Verificar esta rotina, Não exeste mais o botão sbtnDisponibilidade
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

//AL_12 - Ricardo - 30/03/2005
procedure TfrmCadLancamentoFundo.MnuUmPlanoFechtoClick(Sender: TObject);
begin
  inherited;
   SaldoFundos(False,0,1);
end;

procedure TfrmCadLancamentoFundo.MnuTodosPlanosAbertClick(Sender: TObject);
begin
  inherited;

end;
//AL_12 - Fim

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
   with DmRelFundosSaldo, DmRelFundosSaldo.QrySaldoTot do
   begin
      OperComum.LimpaParametros(QrySaldoTot);
      if not TodosPlanos then
         ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

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

      ParamByName('DATAMOVFUNDO').AsString          := DtEdDataReferenciaGeral.Text;
      ParamByName('IDTIPOINVEST').AsInteger         := iTipoInvestUsu;
      if Trim(DbLkcSaldo.Text) <> '' then
         ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(DbLkcSaldo.LookupValue);
      if DblTipoFundo.Text <> '' then
         ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      if dblGestorCarteira.Text <> ''  then
         ParamByName('IDGESTORCARTEIRA').AsInteger  := qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
      Open;

      //AL_35      
      if IsEmpty then
      begin
         OperComum.LimpaParametros(DmRelFundosSaldo.QrySaldoDet);
         if DtEdDataReferenciaGeral.CanFocus then
            DtEdDataReferenciaGeral.SetFocus;
         Exit;
      end;

   end;

   with DmRelFundosSaldo, DmRelFundosSaldo.QrySaldoDet do
   begin
      OperComum.LimpaParametros(QrySaldoDet);
      if not TodosPlanos then
         ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

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

      ParamByName('DATAMOVFUNDO').AsString      := DtEdDataReferenciaGeral.Text;
      ParamByName('IDTIPOINVEST').AsInteger     := iTipoInvestUsu;
      if Trim(DbLkcSaldo.Text) <> '' then
         ParamByName('IDFUNDOINVEST').AsInteger := StrToInt(DbLkcSaldo.LookupValue);
      if DblTipoFundo.Text <> '' then
         ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      if dblGestorCarteira.Text <> ''  then
         ParamByName('IDGESTORCARTEIRA').AsInteger := qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
      if QrySaldoTot.RecordCount > 0 Then
         Filter := 'IDFUNDOINVEST = ' + QrySaldoTot.FieldByName('IDFUNDOINVEST').AsString;
      Open;

      pplblSaldoFundosDataRef.Caption := DtEdDataReferenciaGeral.Text;
                                   
      if not TodosPlanos then
      begin
         ghbCabecalhoPlano.Visible := False;
         gfbRodapePlano.Visible := False;
         LblPlano.Visible := True;
      end
      else
      begin
         ghbCabecalhoPlano.Visible := True;
         gfbRodapePlano.Visible := True;
         LblPlano.Visible := False;
      end;
      //Al_23 - RICARDO - 13/07/2005
      TfrmPreview.CreateModalPreview(Application,
                                     rptSaldoFundos,
                                     rptSaldoFundos.PrinterSetup.DocumentName);
      QrySaldoDet.Close;
      QrySaldoTot.Close;
   end;

   pnlFundo.Enabled := True;
   sbtnSaldos.Down := False;
end;

//AL_25 - Ricardo - 26/01/2006

procedure TfrmCadLancamentoFundo.BtAltResgClick(Sender: TObject);
begin
   // Testa dados
   If (QryResgate.Active = False) Or (QryResgate.IsEmpty = True) Then Begin
      MsgDlg('Consulta não pode ser executada.','Mensagem do Sistema',mtWarning,[mbOk],0);
      BtAltResg.Down := False;
      Exit;
   End;

//AL_25 - Ricardo - 26/01/2006

//   inherited;  // Não pode botar a query em edição

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

   // Preenche os dados
   DbLkcFundoInvestResg.Text := QryResgateDESCFUNDOINVEST.AsString;
//AL_25 - Ricardo - 26/01/2006
   DbLkcTipoOperacaoResg.Text:= QryResgateDESCTIPOOPERACAO.AsString;
   DBeCETIPResg.Text         := QryFundoInvestResgCODFUNCETIP.AsString;
   dbDDataOperacao.Text      := QryResgateDATAPEDIDO.AsString;

end;

//AL_25 - Ricardo - 26/01/2006

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
   //Enter - Troca de Campo
   if Key = VK_Return then
      SelectNext(ActiveControl,True,True)
end;

procedure TfrmCadLancamentoFundo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
end;

//AL_25 - Ricardo - 26/01/2006    

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
//AL_25 - Ricardo - 26/01/2006    
  if (DbDtDataAplicacao.Text <> DtEdDataReferenciaGeral.Text) then
     AbreQryFundoInvestAplic;
end;

procedure TfrmCadLancamentoFundo.dbDDataOperacaoExit(Sender: TObject);
begin
  inherited;
//AL_25 - Ricardo - 26/01/2006    
  if (dbDDataOperacao.Text <> DtEdDataReferenciaGeral.Text) then
     AbreQryFundoInvestResg;
end;

procedure TfrmCadLancamentoFundo.DbDtRefSaldoExit(Sender: TObject);
begin
  inherited;
//AL_25 - Ricardo - 26/01/2006    
  if (DbDtRefSaldo.Text <> DtEdDataReferenciaGeral.Text) then
     AbreQryFundoInvestOperacao;
end;

procedure TfrmCadLancamentoFundo.FormCreate(Sender: TObject);
begin
//AL_25 - Ricardo - 26/01/2006    
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;

  inherited;
end;

procedure TfrmCadLancamentoFundo.mnuOnLineClick(Sender: TObject);
begin
  inherited;

  mnuOnLine.Enabled := False;
  mnuOffLine.Enabled := True;
end;

procedure TfrmCadLancamentoFundo.mnuOffLineClick(Sender: TObject);
begin
  inherited;
  mnuOnLine.Enabled := True;
  mnuOffLine.Enabled := False;
end;

procedure TfrmCadLancamentoFundo.mnuLentoClick(Sender: TObject);
begin
  inherited;
  mnuLento.Checked := True;
  mnuNormal.Checked := False;
  mnuRapido.Checked := False;
end;

procedure TfrmCadLancamentoFundo.mnuNormalClick(Sender: TObject);
begin
  inherited;
  mnuLento.Checked := False;
  mnuNormal.Checked := True;
  mnuRapido.Checked := False;
end;

procedure TfrmCadLancamentoFundo.mnuRapidoClick(Sender: TObject);
begin
  inherited;
  mnuLento.Checked := False;
  mnuNormal.Checked := False;
  mnuRapido.Checked := True;
end;

//AL_25 - Ricardo - 26/01/2006    
procedure TfrmCadLancamentoFundo.CbxAplicExit(Sender: TObject);
begin
  inherited;
   If CbxAplic.ItemIndex = 0 then
      DbDtRefAplc.Clear;

   If (DbDtRefAplc.Text  = '') And (CbxAplic.ItemIndex > 0) then
      DbDtRefAplc.Text  := DateToStr(pRPI.DTMUDACPMF);
end;
//AL_25 - Fim

//AL_25 - Ricardo - 26/01/2006    
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
   end;
end;
//AL_25 - Fim

//AL_25 - Ricardo - 26/01/2006    
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
   end;
end;
//AL_25 - Fim

//AL_25 - Ricardo - 26/01/2006    
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
//AL_25 - Fim

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
        //AL_25 - Ricardo - 26/01/2006
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
        //AL_25 - Fim
     end;
  end;
end;

//AL_26 - Ricardo - 23/05/2006
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
     //AL_25 - Ricardo - 26/01/2006
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
     //AL_25 - Fim
  end;
end;

//AL_26 - Ricardo - 23/05/2006
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
        //AL_25 - Ricardo - 26/01/2006
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
        //AL_25 - Fim
     end;
  end;
end;

//AL_26 - Ricardo - 23/05/2006
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
     //AL_25 - Ricardo - 26/01/2006
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
     //AL_25 - Fim
  end;
end;

//AL_27 - Ricardo - 23/05/2006
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

//AL_33 - Ricardo - 20/06/2006
procedure TfrmCadLancamentoFundo.DbDtDataCotizacaoResgExit(
  Sender: TObject);
Var
  DadosCota  : TDadosCota;
begin
  inherited;
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
end;

end.
