//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 27/06/2005
// Código   : AL_50
// Motivo   : Alterada a rotina para buscar o destino qdo o investimento destino for
//            diferente da origem.  
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 27/06/2005
// Código   : AL_49
// Motivo   : Retirado a variavel por nao esta sendo utilizada na rotina.
//******************************************************************************
// Autor    : Marco Turon
// Data     : 01/06/2005
// Código   : AL_48
// Motivo   : Implementação do teste de período contabil em 3 camadas
//            DFM alterado
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 25/05/2005
//Código    : Al_47
//Motivo(S) : Implementação do tratamento da msg para dar a opção de continuar e abortar a
//            operação.
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 25/05/2005
//Código    : Al_46
//Motivo(S) : Implementação da pesquisa do investimento conforme o seu destino,
//            antes baseavasse na origem, como pode ter mais de uma, ocasionava a duplicidade do mesmo
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 25/05/2005
//Código    : Al_45
//Motivo(S) : Implementação na query de origem(QryOrigemSub), pois essa não grupava o investimento,
//            não trazendo mais de um caso cadastrado.  
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 18/05/2005
//Código    : Al_44
//Motivo(S) : Implementação da gravação no caixa qdo a subscrição para a Gerencial
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 18/05/2005
//Código    : Al_43
//Motivo(S) : Implementação do PUFinanc conforme o valor a subscriver para a Gerencial
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 04/05/2005
//Código    : Al_42
//Motivo(S) : QryBuscaAnuncio busca o anúncio original para contabilização por diferença
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 04/05/2005
//Código    : Al_41
//Motivo(S) : Alterado para buscar o anuncio original e verificar se a diferença a
//            contabilizar
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 02/05/2005
//Código    : Al_40
//Motivo(S) : Retirado para trazer a quantidade certa mesmo essa ja sido recebida
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 28/04/2005
//Código    : Al_39
//Motivo(S) : Retirado a alteração do PU(P_DIVPORACAO) original do cadastro da AGE e da QryUpdOperacaoDireitoParc
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 26/04/2005
//Código    : Al_38
//Motivo(S) : Retirado o try e o finaly, para esses campos serem sempre habilitados para digitação
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 26/04/2005
//Código    : Al_37 
//Motivo(S) : Função implementada para atualizar o campo automaticamente.
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 26/04/2005
//Código    : Al_36 
//Motivo(S) : Linha retirada por não ter utiliade, pois logo abaixo e chamada a função que habilita a mesma 
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 26/04/2005
//Código    : Al_35 
//Motivo(S) : Linha retirada por estar comentada a mais de um ano
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 26/04/2005
//Código    : Al_34 
//Motivo(S) : Criada a rotina de verificação de atualização de IR
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 26/04/2005
//Código    : Al_33
//Motivo(S) : Implementação necessária para digitação dos campos 
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 19/04/2005
//Código    : Al_32
//Motivo(S) : Alteração da msg, devido a não interpretação da mesma pelo usuário
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 15/04/2005
//Código    : Al_31
//Motivo(S) : Acerto na rotina de verificação de recebimento parcial.
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 05/04/2005
//Código    : Al_30
//Motivo(S) : Implementação da rotina ProcRestCapCartGerenc
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 05/04/2005
//Código    : Al_29
//Motivo(S) : Implementação da atualização dos campos da qry
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 04/04/2005
//Código    : Al_28
//Motivo(S) : Alterado o local, pois essa rotina chama a função "buscasaldo" e atualizava o saldo de CPMF
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 04/04/2005
//Código    : Al_27
//Motivo(S) : Implementação da parametrização do tipo de operação para qdo há dif. do anúncio p/ o recebimento
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 17/03/2005
//Código    : Al_26
//Motivo(S) : Acerto na contabilização do Anúncio conforme a CCI
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 15/03/2005
//Código    : Al_25
//Motivo(S) : Implementado na subscrição o tratamento para os saldo de quantidades
//            que incide CPFM;
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 02/03/2005
//Código    : Al_24
//Motivo(S) : Alterada o prazo limite para 60 dias para zerar a cota do Cart. Gerencial
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 02/03/2005
//Código    : Al_23
//Motivo(S) : Implementação de zerar cota da carteira gerencial, para a situação de
//            um lançamento de Anuncio;
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	    : 01/02/2005
//Código    : Al_22
//Motivo(S) : Implementado no desdobramento o tratamento para os saldo de quantidades que
//            incide CPFM;
//            Implementado com isso o tratamento de tipo de operação;
//            E ajustado o saldo de Custodia;
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	     : 18/01/2005
//Código    : Al_22
//Motivo(S) : Muda o valor, qtd e pu conforme a carteira e o custodiante
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	     : 05/01/2005
//Código    : Al_21
//Motivo(S) : Zera a quantidade de operação para finalizar a Dividendos ou Juros
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	     : 05/01/2005
//Código    : QryOrigemDivJur
//Motivo(S) : Implementado a busca grupando por custodiante
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	     : 05/01/2005
//Código    : AL_20
//Motivo(S) : Implementado a busca do saldo filtrado pelo custodiante
//******************************************************************************
//Autor     : Marco Turon
//Data	     : 28/12/2004
//Código    : AL_19
//Motivo(S) : Incluído o GrupBy por Motivo de Bloqueio na query QryOrigemDivJur (DFM)
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	     : 23/12/2004
//Código    : AL_18
//Motivo(S) : Delimita para excluir apenas trinta dias antes do ultimo fechamento
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	     : 23/12/2004
//Código    : AL_17
//Motivo(S) : Testa se há saldo para o investimento nas carteiras gerencias
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	     : 22/12/2004
//Código    : AL_16
//Motivo(S) : Implementação do tratamento que verifica a passagem para mais de uma
//            Carteira e os Saldos CCI e CC
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	     : 20/12/2004
//Código    : AL_15
//Motivo(S) : Implementação da alteração da quantidade de saldo cpmf proporcional
//            para o grupamento - QryBuscaHistCPMF e QryUpdHistCPMF
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	     : 17/12/2004
//Código    : AL_14
//Motivo(S) : Implementação da abertura da transção
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	     : 13/12/2004
//Código    : AL_13
//Motivo(S) : Implementação para verificação da operação realizada
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	     : 08/12/2004
//Código    : AL_12
//Motivo(S) : Implementação do tratamento da quantidade de Direitos para Dividendos e Juros
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	     : 06/12/2004
//Código    : AL_11
//Motivo(S) : Implementação do tratamento do Direito de Subscrição
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	     : 01/12/2004
//Código    : AL_10
//Motivo(S) : Implementação do tratamento do Recebimento Parcial
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	     : 01/12/2004
//Código    : AL_9
//Motivo(S) : Implementação do tratamento do Anuncio de proventos na boleta
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	     : 26/10/2004
//Código    : AL_8
//Motivo(S) : Implmentação da CCI(ProcDivJurCap,)
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	     : 20/10/2004
//Código    : AL_7
//Motivo(S) : Tratamento para busca do investimento no momento da confirmação
//******************************************************************************
//Autor     : Ricardo Cristiano
//Data	     : 07/10/2004
//Código    : AL_6
//Motivo(S) : Implementação da Restituição de Capital
//******************************************************************************
//Autor     : Marco Turon
//Data      : 06/10/2004
//Código    : AL_5
//Motivo    : Alteração Legislação CPMF
//******************************************************************************
//Autor     :Ricardo Cristiano
//Data	     :09/09/2004
//Motivo(S) :Ajuste na contabilização e integração do financeiro no Recebimento de
//           Dividendo e Juros s/ Capital
//******************************************************************************
//Autor     :Ricardo Cristiano
//Data	     :21/07/2004
//Código    :AL_3
//Motivo(S) :Implementação do front paras as grid's em uso
//******************************************************************************
//Autor     :Marco Turon
//Data	     :15/07/2004
//Código    :AL_3
//Descrição :Implementação da Foreign Key IDOPERCUSTODIA na OperacaoInvest
//           Passa a Incluir uma OperCustodia para grupar por tipo de bloqueio
//******************************************************************************
//Autor     :Ricardo Cristiano
//Data	     :01/07/2004
//Código    :AL_2
//Motivo(S) :Implementação no Next nas linhas deletadas
//******************************************************************************
//Autor     :Fabio Fagundes
//Data	     :29/06/2004
//Query 	   :QryDestinoSub, QryInvestimento, QryCustodiante,
//           QryDestinoGrupamento, QryCarteiraInvest
//Motivo(S) :Passado o Active da qry para 'False'
//******************************************************************************
//Autor     :Fabio Fagundes
//Data      :22/06/2004
//Código    :AL_1
//Motivo    :Inclusão de variável na função BuscaTodosSaldosInvestLote
//******************************************************************************
//Autor     :Ricardo Cristiano
//Data	     :14/04/2004
//Origem    :FUNCEF
//Função    :BtIncDetClick,BtAltDetClick,BtDelDetClick,BtOkDetClick e BtCancDetClick
//LINHA(S)  :2349 e 3370
//Motivo(S) :Implementação da grid de destino conforme a operação
//******************************************************************************
//Autor     :Ricardo Cristiano
//Data	     :14/04/2004
//Origem    :FUNCEF
//Função    :ProcIncPerAlt e ProcIncPerAltCartGerenc
//LINHA(S)  :2349 e 3370
//Motivo(S) : Implementada
//******************************************************************************
//Autor     :Ricardo Cristiano
//Data	     :07/04/2004
//Origem    :FUNCEF
//Função    :ProcSubCartGerenc e ProcGrupamentoCartGerenc
//LINHA(S)  :3145 e 3261
//Motivo(S) :Na função AlimentaCarteira está sendo passado os parametros de
//            movimento e operação conforme a parametrização dessa operação no
//            Cadastro do Tipo de Operação
//            Na função ProcSubCartGerenc, foi implemetada a rotina de ajuste de
//            quantidade na regra de 3, pois estava dando diferença
//******************************************************************************
//Autor     :Ricardo Cristiano
//Data	     :06/04/2004
//Origem    :FUNCEF
//Função    :ProcDivJurCap
//LINHA(S)  :2050
//Motivo(S) :Retirardo upd da tabela OPERACAODIREITO com a tesouraria e o contabil
//           não há mais necessidade, pois agora e feita na BOLETA.
//******************************************************************************
//Autor     :Fabio Fagundes
//Data      :05/04/2004
//Origem    :CM
//Função    :ProcDivJurCap
//Linha(s)  :2050
//Motivo    :Acerto na gravação da planilha e coddocumento após contabilização
//            na tabela OPERACAODIREITO
//******************************************************************************
//Autor     :Ricardo Cristiano
//Data	     :05/04/2004
//Origem    :FUNCEF
//Função    :ProcDivJurCap
//LINHA(S)  :2033
//Motivo(S) :Erro de Duplicidade na integração do Financeiro. Não
//            estava sendo feito o update na tabela boleta com os
//            campos CODDOCUMENTO, PLANO, PLNCODIGO
//******************************************************************************

unit FCadOperAgeNovo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  wwdbdatetimepicker, CMDateTimePicker, UOperComum, UOperacaoInvest,
  wwdblook, uCtrlInvContab;

type
  TfrmCadOperAGENovo = class(TfrmCadastroCS)
    lblDataAGE: TLabel;
    lblTipoOperacao: TLabel;
    UpdOrigemDivJur: TUpdateSQL;
    QryOrigemDivJur: TwwQuery;
    DsOrigemDivJur: TwwDataSource;
    edtDataEfetiva: TCMDateTimePicker;
    lblDataEfetiva: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbDistribuido: TLabel;
    lbAdistribuir: TLabel;
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
    QryOrigemDivJurIDCARTEIRAINVEST: TFloatField;
    QryOrigemDivJurIDINVESTIMENTO: TFloatField;
    QryOrigemDivJurIDCUSTODIANTE: TFloatField;
    QryOrigemDivJurIDMOTIVOBLOQUEIO: TFloatField;
    QryOrigemDivJurPERCENTUALINV: TFloatField;
    QryOrigemDivJurVLRCUSTOATUAL: TFloatField;
    QryOrigemDivJurVLRCUSTO: TFloatField;
    QryLote: TwwQuery;
    QryOperacaoInvestDestino: TwwQuery;    
    lblSigla: TLabel;
    QryBuscaTipoOper: TwwQuery;
    QryBuscaInvestimento: TwwQuery;
    QryBuscaBolsaValores: TwwQuery;
    QryInsetOperacaoInvest: TwwQuery;
    QryInsertOprAcao: TwwQuery;
    QryInsertBoleta: TwwQuery;
    QryBoleta: TwwQuery;
    QryUpdOperacaoDireitoStatus: TwwQuery;
    QryBuscaValoresCtbFin: TwwQuery;
    QryUpdHistCartInv: TwwQuery;
    QryUpdIrLitigio: TwwQuery;
    LblBoleta: TLabel;
    QryCarteiraGerenc: TwwQuery;
    PnlOrigem: TPanel;
    dbgOrigemSub: TwwDBGrid;
    dbgOrigemDirJur: TwwDBGrid;
    Panel1: TPanel;
    QryDestinoSub: TwwQuery;
    QryDestinoSubACAO: TStringField;
    QryDestinoSubDESCCARTEIRA: TStringField;
    QryDestinoSubDESCCUSTODIANTE: TStringField;
    QryDestinoSubDESCBLOQUEIO: TStringField;
    QryDestinoSubIDLOTE: TStringField;
    QryDestinoSubQTDEDIREITO: TFloatField;
    QryDestinoSubQTDENOVA: TFloatField;
    QryDestinoSubVALOREXERCIDO: TFloatField;
    QryDestinoSubVLRCUSTO: TFloatField;
    QryDestinoSubPERCCUSTO: TFloatField;
    QryDestinoSubDESCINVESTIMENTO: TStringField;
    QryDestinoSubIDCARTEIRAINVEST: TFloatField;
    QryDestinoSubIDCUSTODIANTE: TFloatField;
    QryDestinoSubIDMOTIVOBLOQUEIO: TFloatField;
    QryDestinoSubIDINVESTIMENTO: TFloatField;
    QryDestinoSubPERCENTUALINV: TFloatField;
    QryDestinoSubIDOPERACAODIREITO: TFloatField;
    DsDestinoSub: TwwDataSource;
    UpdDestinoSub: TUpdateSQL;
    QryCarteiraInvest: TwwQuery;
    QryCarteiraInvestDESCCARTINVEST: TStringField;
    QryCarteiraInvestIDCARTEIRAINVEST: TFloatField;
    QryInvestimento: TwwQuery;
    QryInvestimentoDESCINVESTIMENTO: TStringField;
    QryInvestimentoIDINVESTIMENTO: TFloatField;
    pnlDestino: TPanel;
    pnlBotoesDestino: TPanel;
    Dock977: TDock97;
    Toolbar974: TToolbar97;
    BtIncDet: TSpeedButton;
    BtAltDet: TSpeedButton;
    BtDelDet: TSpeedButton;
    Toolbar975: TToolbar97;
    BtOkDet: TBitBtn;
    BtCancDet: TBitBtn;
    BtVoltaDet: TBitBtn;
    dbgDestinoSub: TwwDBGrid;
    Panel5: TPanel;
    dblCarteira: TwwDBLookupCombo;
    dblAcao: TwwDBLookupCombo;
    QryCustodiante: TwwQuery;
    QryCustodianteSGLCUSTODIANTE: TStringField;
    QryCustodianteIDCUSTODIANTE: TFloatField;
    QryDestinoSubIDOPERACAOINVEST: TFloatField;
    dblCustodiante: TwwDBLookupCombo;
    dblBloqueio: TwwDBLookupCombo;
    QryOrigemSub: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    DateTimeField1: TDateTimeField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    StringField5: TStringField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    UpdOrigemSub: TUpdateSQL;
    DsOrigemSub: TwwDataSource;
    QryOrigemIncPerAlt: TwwQuery;
    StringField7: TStringField;
    StringField8: TStringField;
    FloatField19: TFloatField;
    StringField9: TStringField;
    StringField10: TStringField;
    DateTimeField2: TDateTimeField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    StringField11: TStringField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    FloatField30: TFloatField;
    FloatField31: TFloatField;
    FloatField32: TFloatField;
    UpdOrigemIncPerAlt: TUpdateSQL;
    DsOrigemIncPerAlt: TwwDataSource;
    dbgOrigemIncPerAlt: TwwDBGrid;
    dbgDestinoIncPerAlt: TwwDBGrid;
    QryDestinoIncPerAlt: TwwQuery;
    QryDestinoIncPerAltACAO: TStringField;
    QryDestinoIncPerAltDESCCARTEIRA: TStringField;
    QryDestinoIncPerAltDESCCUSTODIANTE: TStringField;
    QryDestinoIncPerAltDESCBLOQUEIO: TStringField;
    QryDestinoIncPerAltIDLOTE: TStringField;
    QryDestinoIncPerAltVALOREXERCIDO: TFloatField;
    QryDestinoIncPerAltVLRCUSTO: TFloatField;
    QryDestinoIncPerAltDESCINVESTIMENTO: TStringField;
    QryDestinoIncPerAltPERCCUSTO: TFloatField;
    QryDestinoIncPerAltIDCARTEIRAINVEST: TFloatField;
    QryDestinoIncPerAltIDCUSTODIANTE: TFloatField;
    QryDestinoIncPerAltIDMOTIVOBLOQUEIO: TFloatField;
    QryDestinoIncPerAltIDINVESTIMENTO: TFloatField;
    QryDestinoIncPerAltPERCENTUALINV: TFloatField;
    QryDestinoIncPerAltIDOPERACAODIREITO: TFloatField;
    QryDestinoIncPerAltIDOPERACAOINVEST: TFloatField;
    UpdDestinoIncPerAlt: TUpdateSQL;
    DsDestinoIncPerAlt: TwwDataSource;
    QryDestinoIncPerAltQTDEDIREITO: TFloatField;
    QryDestinoIncPerAltQTDENOVA: TFloatField;
    QryUpdOperacaoDireitoParc: TwwQuery;
    QryBuscaFundo: TwwQuery;
    dbgOrigemDivJurAnu: TwwDBGrid;
    UpdOrigDivJurAnu: TUpdateSQL;
    QryOrigDivJurAnu: TwwQuery;
    StringField12: TStringField;
    StringField13: TStringField;
    QryOrigDivJurAnuDESCTIPOOPERACAO: TStringField;
    DateTimeField3: TDateTimeField;
    FloatField33: TFloatField;
    FloatField34: TFloatField;
    FloatField35: TFloatField;
    FloatField36: TFloatField;
    FloatField37: TFloatField;
    StringField14: TStringField;
    StringField15: TStringField;
    FloatField38: TFloatField;
    FloatField39: TFloatField;
    FloatField40: TFloatField;
    StringField16: TStringField;
    FloatField41: TFloatField;
    FloatField42: TFloatField;
    FloatField43: TFloatField;
    FloatField44: TFloatField;
    FloatField45: TFloatField;
    FloatField46: TFloatField;
    DsOrigDivJurAnu: TwwDataSource;
    QryOperacaoInvestOrigem: TwwQuery;
    QryOrigemGrupamento: TwwQuery;
    UpdOrigemGrupamento: TUpdateSQL;
    DsOrigemGrupamento: TwwDataSource;
    dbgOrigemGrupamento: TwwDBGrid;
    QryDestinoGrupamento: TwwQuery;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    QryDestinoGrupamentoQTDEDIREITO: TFloatField;
    FloatField62: TFloatField;
    FloatField63: TFloatField;
    StringField27: TStringField;
    FloatField64: TFloatField;
    FloatField65: TFloatField;
    FloatField66: TFloatField;
    FloatField67: TFloatField;
    FloatField68: TFloatField;
    FloatField69: TFloatField;
    FloatField70: TFloatField;
    FloatField72: TFloatField;
    UpdDestinoGrupamento: TUpdateSQL;
    DsDestinoGrupamento: TwwDataSource;
    dbgDestinoGrupamento: TwwDBGrid;
    QryDestinoGrupamentoIDOPERACAOINVEST: TFloatField;
    QryUpdOperDiretoXInv: TwwQuery;
    QryAux: TwwQuery;
    QryOrigemGrupamentoDESCINVESTIMENTO: TStringField;
    QryOrigemGrupamentoDESCCARTINVEST: TStringField;
    QryOrigemGrupamentoSGLCUSTODIANTE: TStringField;
    QryOrigemGrupamentoSIGLAMOTBLOQ: TStringField;
    QryOrigemGrupamentoIDLOTE: TStringField;
    QryOrigemGrupamentoDATAREFERENCIA: TDateTimeField;
    QryOrigemGrupamentoQTDE: TFloatField;
    QryOrigemGrupamentoQTDEDIREITO: TFloatField;
    QryOrigemGrupamentoVALOREXERCIDO: TFloatField;
    QryOrigemGrupamentoVLRREMUNERACAO: TFloatField;
    QryOrigemGrupamentoIR: TFloatField;
    QryOrigemGrupamentoVLRLIQ: TFloatField;
    QryOrigemGrupamentoVLRIRREMUNERACAO: TFloatField;
    QryOrigemGrupamentoIDCARTEIRAINVEST: TFloatField;
    QryOrigemGrupamentoIDINVESTIMENTO: TFloatField;
    QryOrigemGrupamentoIDCUSTODIANTE: TFloatField;
    QryOrigemGrupamentoIDMOTIVOBLOQUEIO: TFloatField;
    QryOrigemGrupamentoPERCENTUALINV: TFloatField;
    QryOrigemGrupamentoVLRCUSTOATUAL: TFloatField;
    QryOrigemGrupamentoVLRCUSTO: TFloatField;
    qryAuxiliar: TwwQuery;
    qryAtualizaBoleta: TwwQuery;
    qryUpdOperDirCtbFin: TwwQuery;
    QryDestinoGrupamentoORIGDEST: TStringField;
    dbgOrigemDesdobramento: TwwDBGrid;
    QryOrigemDesdobramento: TwwQuery;
    UpdOrigemDesdobramento: TUpdateSQL;
    DsOrigemDesdobramento: TwwDataSource;
    QryOrigemDesdobramentoDESCINVESTIMENTO: TStringField;
    QryOrigemDesdobramentoDESCCARTINVEST: TStringField;
    QryOrigemDesdobramentoSGLCUSTODIANTE: TStringField;
    QryOrigemDesdobramentoSIGLAMOTBLOQ: TStringField;
    QryOrigemDesdobramentoIDLOTE: TStringField;
    QryOrigemDesdobramentoDATAREFERENCIA: TDateTimeField;
    QryOrigemDesdobramentoQTDE: TFloatField;
    QryOrigemDesdobramentoQTDEDIREITO: TFloatField;
    QryOrigemDesdobramentoVALOREXERCIDO: TFloatField;
    QryOrigemDesdobramentoVLRREMUNERACAO: TFloatField;
    QryOrigemDesdobramentoIR: TFloatField;
    QryOrigemDesdobramentoVLRLIQ: TFloatField;
    QryOrigemDesdobramentoVLRIRREMUNERACAO: TFloatField;
    QryOrigemDesdobramentoIDCARTEIRAINVEST: TFloatField;
    QryOrigemDesdobramentoIDINVESTIMENTO: TFloatField;
    QryOrigemDesdobramentoIDCUSTODIANTE: TFloatField;
    QryOrigemDesdobramentoIDMOTIVOBLOQUEIO: TFloatField;
    QryOrigemDesdobramentoPERCENTUALINV: TFloatField;
    QryOrigemDesdobramentoVLRCUSTOATUAL: TFloatField;
    QryOrigemDesdobramentoVLRCUSTO: TFloatField;
    dbgDestinoDesdobramento: TwwDBGrid;
    QryDestinoDesdobramento: TwwQuery;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    FloatField47: TFloatField;
    FloatField48: TFloatField;
    StringField21: TStringField;
    FloatField49: TFloatField;
    StringField28: TStringField;
    FloatField50: TFloatField;
    FloatField51: TFloatField;
    FloatField52: TFloatField;
    FloatField53: TFloatField;
    FloatField54: TFloatField;
    FloatField55: TFloatField;
    FloatField56: TFloatField;
    FloatField57: TFloatField;
    FloatField58: TFloatField;
    UpdDestinoDesdobramento: TUpdateSQL;
    DsDestinoDesdobramento: TwwDataSource;
    dbgOrigemRestCap: TwwDBGrid;
    QryOrigemRestCap: TwwQuery;
    UpdOrigemRestCap: TUpdateSQL;
    DsOrigemRestCap: TwwDataSource;
    QryOrigemRestCapDESCINVESTIMENTO: TStringField;
    QryOrigemRestCapDESCCARTINVEST: TStringField;
    QryOrigemRestCapSGLCUSTODIANTE: TStringField;
    QryOrigemRestCapSIGLAMOTBLOQ: TStringField;
    QryOrigemRestCapIDLOTE: TStringField;
    QryOrigemRestCapDATAREFERENCIA: TDateTimeField;
    QryOrigemRestCapQTDE: TFloatField;
    QryOrigemRestCapQTDEDIREITO: TFloatField;
    QryOrigemRestCapVALOREXERCIDO: TFloatField;
    QryOrigemRestCapVLRREMUNERACAO: TFloatField;
    QryOrigemRestCapIR: TFloatField;
    QryOrigemRestCapVLRLIQ: TFloatField;
    QryOrigemRestCapVLRIRREMUNERACAO: TFloatField;
    QryOrigemRestCapIDCARTEIRAINVEST: TFloatField;
    QryOrigemRestCapIDINVESTIMENTO: TFloatField;
    QryOrigemRestCapIDCUSTODIANTE: TFloatField;
    QryOrigemRestCapIDMOTIVOBLOQUEIO: TFloatField;
    QryOrigemRestCapPERCENTUALINV: TFloatField;
    QryOrigemRestCapVLRCUSTOATUAL: TFloatField;
    QryOrigemRestCapVLRCUSTO: TFloatField;
    UpdDestinoRestCap: TUpdateSQL;
    DsDestinoRestCap: TwwDataSource;
    QryDestinoRestCap: TwwQuery;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    StringField33: TStringField;
    QryDestinoRestCapQTDEDIREITO: TFloatField;
    FloatField60: TFloatField;
    FloatField61: TFloatField;
    StringField34: TStringField;
    FloatField71: TFloatField;
    FloatField73: TFloatField;
    FloatField74: TFloatField;
    FloatField75: TFloatField;
    FloatField76: TFloatField;
    FloatField77: TFloatField;
    FloatField78: TFloatField;
    FloatField79: TFloatField;
    FloatField80: TFloatField;
    dbgDestinoRestCap: TwwDBGrid;
    qryAcoesxBolsa: TwwQuery;
    QryOperacaoDireito: TwwQuery;
    qryMotivoBloqueio: TwwQuery;
    qryMotivoBloqueioSIGLAMOTBLOQ: TStringField;
    qryMotivoBloqueioIDMOTIVOBLOQUEIO: TFloatField;
    QryBuscaHistCPMF: TwwQuery;
    QryUpdHistCPMF: TwwQuery;
    //Al_42 - Ricardo - 04/05/2005
    QryBuscaAnuncio: TwwQuery;
    //Al_42 - Fim    
    procedure FormActivate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure QryOrigemDivJurQTDEDIREITOSetText(Sender: TField;
                                                const Text: String);
    procedure QryOrigemDivJurVLRREMUNERACAOSetText(Sender: TField;
                                                   const Text: String);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure BtIncDetClick(Sender: TObject);
    procedure BtAltDetClick(Sender: TObject);
    procedure BtDelDetClick(Sender: TObject);
    procedure dbgDestinoSubKeyPress(Sender: TObject; var Key: Char);
    procedure dbgDestinoSubKeyDown(Sender: TObject; var Key: Word;
                                   Shift: TShiftState);
    procedure dbgDestinoSubEnter(Sender: TObject);
    procedure BtOkDetClick(Sender: TObject);
    procedure BtCancDetClick(Sender: TObject);
    procedure QryDestinoSubQTDEDIREITOSetText(Sender: TField;
                                              const Text: String);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DsDestinoSubStateChange(Sender: TObject);
    procedure DsDestinoIncPerAltStateChange(Sender: TObject);
    procedure QryDestinoSubBeforePost(DataSet: TDataSet);
    procedure QryDestinoIncPerAltBeforePost(DataSet: TDataSet);
    procedure QryDestinoIncPerAltQTDEDIREITOSetText(Sender: TField;
                                                    const Text: String);
    procedure FazerProcurarCadAGE(TipoOperacao, OperacaoDireito  : LongInt;
                                  DataEX : TDateTime;
                                  SiglaEmissor, DescTipoOperacao : String;
                                  bForm, bProv : Boolean);
    procedure QryOrigemDivJurVLRLIQSetText(Sender: TField;
                                           const Text: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryOrigemDivJurVALOREXERCIDOSetText(Sender: TField;
                                           const Text: String);
    procedure QryOrigemGrupamentoQTDEDIREITOSetText(Sender: TField;
      const Text: String);
    procedure QryOrigemGrupamentoVLRREMUNERACAOSetText(Sender: TField;
      const Text: String);
    procedure QryOrigemGrupamentoVALOREXERCIDOSetText(Sender: TField;
      const Text: String);
    procedure QryOrigemGrupamentoVLRLIQSetText(Sender: TField;
      const Text: String);
    procedure QryDestinoGrupamentoBeforePost(DataSet: TDataSet);
    procedure QryDestinoGrupamentoQTDEDIREITOSetText(Sender: TField; const Text: String);
    procedure QryDestinoRestCapQTDEDIREITOSetText(Sender: TField; const Text: String);
    procedure dbgDestinoIncPerAltKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    //Al_34 - Ricardo - 26/04/2005
    procedure QryOrigemDivJurIRSetText(Sender: TField; const Text: String);

  private
    { Private declarations }

    //Procedure's

    procedure BuscaSaldo(iIdCarteiraInvest, iIdCarteiraGerenc, iIdInvestimento : Integer;
                         sIdLote         : String;
                         Data            : TDateTime;
                         iIdCustodiante  : Integer = -1);

    procedure AbreQueryOrigem(QryTmpOrigem, QryTmpDestino  : TQuery;
                              DataAGE                      : TDateTime;
                              bCancelar, bRecalcula        : Boolean);

    Procedure AbreQueryDestino(QryTmpOrigem, QryTmpDestino : TQuery;
                               Acumulado                   : Extended;
                               DataAGE, DataAGECons        : TDateTime);

    procedure GravaOperacaoInvest(iIDOPERACAOINVEST, iMOECODIGO, iIDMODULO,
                                  iEMPRESAPROP, iIDINVESTIMENTO, iIDCARTEIRAINVEST,
                                  iIDTIPOINVEST, iIDTIPOOPERACAO, iIDFORCLI, iIDCUSTODIANTE,
                                  iIDOPERACAODIREITO, iIDCARTEIRAGERENC : Integer;
                                  dDATAOPERACAO, dDATAVENCOPER : TDateTime;
                                  sNUMDOCUMENTO, sFLGSTATUSFECHBOL, sFLGSTATUSORDMOV, sIDLOTE : String;
                                  fQTDEOPERACAO, fPRECOUNITOPERACAO, fVLROPERACAO, fVLRIR,
                                  fVLRREMUNERACAO, fVLRIRREMUNER, fPERCCUSTO : Double;
                                  sORIGDEST : String; iOperCustodia: Integer = -1);

//Incrementa fornecedor, bolsa de valores, boleta, data de vencimento
    procedure FornecedorCli(wIdCustodiante                 : Integer;
                            Var wIdForCli, wIdBolsaValores : Integer;
                            Var wDataVenc : TDateTime);

    procedure ProcQtdeDireitoDestino(Sender_1, Sender_2 : TField;
                                     const Text         : String;
                                     QryTmpDestino      : TQuery);

    procedure ZeraCotaGerencial(wDtMov : TDateTime; iIdInvestimento : Integer);                                     

    //Function's

    function  VerificaParamInvest       : boolean;

    function  ProcuraCampoPeloNome(Grid : TwwDbGrid; NomeCampo : String) : Integer;

    function  ProcDivJurCap  : boolean;

    function  ProcSubscricao : boolean;

    function  ProcIncPerAlt  : boolean;

    function  ProcGrupamento : boolean;

    function  ProcDesdobramento  : boolean;

    function  ProcRestituicaoCap : boolean;

    function  ProcDivJurCartGerenc(wNumDoc : String)      : boolean;

    function  ProcSubCartGerenc(wNumDoc    : String)      : boolean;

    function  ProcGrupamentoCartGerenc(wNumDoc : String)  : boolean;

    function  ProcIncPerAltCartGerenc(wNumDoc  : String)  : boolean;

    function  ProcDesdobramentoGerenc(wNumDoc  : String)  : boolean;
    
    function  ProcRestCapCartGerenc(wNumDoc    : String)  : boolean;

  published

  public
    { Public declarations }
       wQtdeDireitoCart, wQtdeAnteriorCart : Double;
       wVlrOperacaoCart, wVlrExercicioCart, wIRExercidoCart : Currency;
  end;

var
  Reg                : TRegTipoOperacao;
  frmCadOperAGENovo  : TfrmCadOperAGENovo;
  wVlrTotOperacaoAnt : Currency;
  dDataBase, dDataAGE, dDataAGEProv, dDataVencProv   : TDateTime;
  bProvisiona, bTrocaLine, bSair, bVerFormAge        : Boolean;

  wPlnProv, wDocProv, wPlanoProv, iTipoOperacao, iIdOperacaoDireito, iIdHistCustodia,
  iIdHistCartInv     : Integer;

  wSdoQtdCPMF, wSaldoQtd, wSaldoVlr, wSaldoIRApu, wSaldoInutil, wSaldoAqui,
  fPuAtual, wQtdModDivJur  : Double;

  QryTmpDestinoGrav  : TQuery;

implementation

uses dAGE, UDiasUteisInv, UImpostos, uMensErro, DBaseDados, uDataBase,
     uDocumento, uSistema, UBibliotecaInvest, FCadAGE, UCaixaComum, FTelaAut,
     FOperDireitoCartGer, UCotaComum, UProvisaoComum, URendaVariavel,
     DCotaComum;

{$R *.DFM}

procedure TfrmCadOperAGENovo.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  WindowState      := wsMaximized;
end;

procedure TfrmCadOperAGENovo.sbtnProcurarClick(Sender: TObject);
begin
  inherited;

  PnlFundo.Enabled := True;

  if MontaSelect.RetornouValor then
  begin
     pnlDestino.Visible              := False;

     dbgOrigemSub.Visible            := False;
     dbgDestinoSub.Visible           := False;
     dbgOrigemDirJur.Visible         := False;
     dbgOrigemIncPerAlt.Visible      := False;
     dbgDestinoIncPerAlt.Visible     := False;
     dbgOrigemGrupamento.Visible     := False;
     dbgDestinoGrupamento.Visible    := False;
     dbgOrigemDesdobramento.Visible  := False;
     dbgDestinoDesdobramento.Visible := False;
     dbgOrigemRestCap.Visible        := False;
     dbgDestinoRestCap.Visible       := False;


     LblBoleta.Caption  := MontaSelect.ValoresChave[6];
     LblBoleta.Repaint;
     iTipoOperacao      := StrToInt(MontaSelect.ValoresChave[2]);
     iIdOperacaoDireito := StrToInt(MontaSelect.ValoresChave[3]);
     if iTipoOperacao  In [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR, pRPI.IDTIPOOPERDIRMUL] then
     begin
        dbgOrigemDirJur.Visible := True;
        dbgOrigemDirJur.BringToFront;

        AbreQueryOrigem(QryOrigemDivJur, Qry, StrToDate(MontaSelect.ValoresChave[1]),
                        False, False);
     end
     //AL_11 - RICARDO - 08/12/2004
     else if iTipoOperacao  In [pRPI.IDTIPOOPERDIRSUB, pRPI.IDTIPOOPERDIRDSU] then
     begin
        pnlDestino.Visible          := True;
        dbgOrigemSub.Visible        := True;
        dbgDestinoSub.Visible       := True;

        dbgOrigemSub.BringToFront;
        dbgDestinoSub.BringToFront;

        dblAcao.DataSource          := DsDestinoSub;
        dblCarteira.DataSource      := DsDestinoSub;
        dblCustodiante.DataSource   := DsDestinoSub;
        dblBloqueio.DataSource      := DsDestinoSub;

        AbreQueryOrigem(QryOrigemSub, QryDestinoSub, StrToDate(MontaSelect.ValoresChave[1]),
                        False, False);

        dblAcao.Enabled             := False;
        dblCarteira.Enabled         := False;
        dblCustodiante.Enabled      := False;
        dblBloqueio.Enabled         := False;
     end
     else if iTipoOperacao In [pRPI.IDTIPOOPERDIRINC, pRPI.IDTIPOOPERDIRPER, pRPI.IDTIPOOPERDIRALT] then
     begin
        pnlDestino.Visible          := True;
        dbgOrigemIncPerAlt.Visible  := True;
        dbgDestinoIncPerAlt.Visible := True;

        dbgOrigemIncPerAlt.BringToFront;
        dbgDestinoIncPerAlt.BringToFront;

        dblAcao.DataSource          := DsDestinoIncPerAlt;
        dblCarteira.DataSource      := DsDestinoIncPerAlt;
        dblCustodiante.DataSource   := DsDestinoIncPerAlt;
        dblBloqueio.DataSource      := DsDestinoIncPerAlt;

        AbreQueryOrigem(QryOrigemIncPerAlt, QryDestinoIncPerAlt, StrToDate(MontaSelect.ValoresChave[1]),
                        False, False);

        dblAcao.Enabled             := False;
        dblCarteira.Enabled         := False;
        dblCustodiante.Enabled      := False;
        dblBloqueio.Enabled         := False;
     end
     else if iTipoOperacao = pRPI.IDTIPOOPERDIRGRU then
     begin
        pnlDestino.Visible          := True;
        dbgOrigemGrupamento.Visible := True;
        dbgDestinoGrupamento.Visible:= True;

        dbgOrigemGrupamento.BringToFront;
        dbgDestinoGrupamento.BringToFront;

        dblAcao.DataSource          := DsDestinoGrupamento;
        dblCarteira.DataSource      := DsDestinoGrupamento;
        dblCustodiante.DataSource   := DsDestinoGrupamento;
        dblBloqueio.DataSource      := DsDestinoGrupamento;

        AbreQueryOrigem(QryOrigemGrupamento, QryDestinoGrupamento, StrToDate(MontaSelect.ValoresChave[1]),
                        False, False);

        dblAcao.Enabled             := False;
        dblCarteira.Enabled         := False;
        dblCustodiante.Enabled      := False;
        dblBloqueio.Enabled         := False;
     end
     else if iTipoOperacao = pRPI.IDTIPOOPERDIRDES then
     begin
        pnlDestino.Visible          := True;
        dbgOrigemDesdobramento.Visible := True;
        dbgDestinoDesdobramento.Visible:= True;

        dbgOrigemDesdobramento.BringToFront;
        dbgDestinoDesdobramento.BringToFront;

        dblAcao.DataSource          := DsDestinoDesdobramento;
        dblCarteira.DataSource      := DsDestinoDesdobramento;
        dblCustodiante.DataSource   := DsDestinoDesdobramento;
        dblBloqueio.DataSource      := DsDestinoDesdobramento;

        AbreQueryOrigem(QryOrigemDesdobramento, QryDestinoDesdobramento, StrToDate(MontaSelect.ValoresChave[1]),
                        False, False);

        dblAcao.Enabled             := False;
        dblCarteira.Enabled         := False;
        dblCustodiante.Enabled      := False;
        dblBloqueio.Enabled         := False;
     end
     else if iTipoOperacao = pRPI.IDTIPOOPERDIRRES then
     begin
        pnlDestino.Visible          := True;
        dbgOrigemRestCap.Visible    := True;
        dbgDestinoRestCap.Visible   := True;

        dbgOrigemRestCap.BringToFront;
        dbgDestinoRestCap.BringToFront;

        dblAcao.DataSource          := DsDestinoRestCap;
        dblCarteira.DataSource      := DsDestinoRestCap;
        dblCustodiante.DataSource   := DsDestinoRestCap;
        dblBloqueio.DataSource      := DsDestinoRestCap;

        AbreQueryOrigem(QryOrigemRestCap, QryDestinoRestCap, StrToDate(MontaSelect.ValoresChave[1]),
                        False, False);

        dblAcao.Enabled             := False;
        dblCarteira.Enabled         := False;
        dblCustodiante.Enabled      := False;
        dblBloqueio.Enabled         := False;
     end;

     lblDataEfetiva.Visible         := True;
     edtDataEfetiva.Visible         := True;
     lblDataAGE.Visible             := True;
     lblSigla.Visible               := True;
     lblTipoOperacao.Visible        := True;
     lblDataAGE.Caption             := MontaSelect.ValoresChave[1];
     lblSigla.Caption               := MontaSelect.ValoresChave[4];
     lblTipoOperacao.Caption        := MontaSelect.ValoresChave[5];

  end
  else
  begin
     bbtnCancelar.Enabled := True;
     bbtnCancelarClick(Sender);
  end;
end;

procedure TfrmCadOperAGENovo.bbtnConfirmarClick(Sender: TObject);
Var
   dDataAnt : TDateTime;
begin
   // AL_48 - Inicio
   inherited;
   If  (edtDataEfetiva.Date < QryOperacaoDireito.FieldByName('DATAEX').AsDateTime) Then
   Begin
      MsgDlg('Data Prevista menor que a Data Base.','Mensagem do Sistema',mtWarning,[mbOk],0);
      if edtDataEfetiva.CanFocus then
         edtDataEfetiva.SetFocus;
      Exit;
   End;

   if edtDataEfetiva.Visible then
   begin
      if Trim(edtDataEfetiva.Text) = '' then
      begin
         MsgDlg('Data de Recebimento não preenchida.','Mensagem do Sistema',mtWarning,[mbOk],0);
         if edtDataEfetiva.CanFocus then
            edtDataEfetiva.SetFocus;
         Exit;
      end;
   end
   else
      Exit;

   // Testa o período contábil
   if not CtrlInvContab.TestaPeriodo(edtDataEfetiva.Text) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if edtDataEfetiva.CanFocus then
         edtDataEfetiva.SetFocus;
      Exit;
   end;
   // AL_48 - Fim

   // Dados do Tipo de Operação
   with QryBuscaTipoOper do
   begin
      Close;
      ParamByName('TIPOOPERACAO').asInteger := iTipoOperacao;   // Ana: Alimentado a partir do MontaSelect
      Open;
   end;

   //AL_14 - Ricardo - 17/12/2004
   if Not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   QryOrigemDivJur.DisableControls;
   // Tratamento de Dividendos e Juros de Capital
   if iTipoOperacao  In [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR, pRPI.IDTIPOOPERDIRMUL] then
   begin
      if not ProcDivJurCap then
      begin
         if dtmBaseDados.dbBaseDados.InTransaction then
            DtmBaseDados.dbBaseDados.Rollback;
         QryBuscaTipoOper.Close;
         QryBuscaInvestimento.Close;
         If (Not bVerFormAge) Then
             bbtnSairClick(Sender);
         Exit;
      end;

      ZeraCotaGerencial(edtDataEfetiva.Date,
                        QryOrigemDivJur.FieldByName('IDINVESTIMENTO').AsInteger);

   end
   // Tratamento da Subscrição e Direito de Subscrição
   //AL_11 - RICARDO - 08/12/2004
   else if iTipoOperacao  In [pRPI.IDTIPOOPERDIRSUB, pRPI.IDTIPOOPERDIRDSU] then
   begin
      if not ProcSubscricao then
      begin
         if dtmBaseDados.dbBaseDados.InTransaction then
            DtmBaseDados.dbBaseDados.Rollback;
         QryBuscaTipoOper.Close;
         QryBuscaInvestimento.Close;
         If (Not bVerFormAge) Then
             bbtnSairClick(Sender);
         Exit;
      end;

      if edtDataEfetiva.Date <= pRPI.DATAULTFECH then
         RendaVariavel.MarcarFlagReproc(QryDestinoSub.FieldByName('IDINVESTIMENTO').AsInteger,
                                        -1, -1, edtDataEfetiva.Date);

      QryDestinoSub.First;
      ZeraCotaGerencial(edtDataEfetiva.Date,
                        QryDestinoSub.FieldByName('IDINVESTIMENTO').AsInteger);

   end
   // Tratamento da Grupamento
   else if iTipoOperacao = pRPI.IDTIPOOPERDIRGRU then
   begin
      if not ProcGrupamento then
      begin
         if dtmBaseDados.dbBaseDados.InTransaction then
            DtmBaseDados.dbBaseDados.Rollback;
         QryBuscaTipoOper.Close;
         QryBuscaInvestimento.Close;
         If (Not bVerFormAge) Then
             bbtnSairClick(Sender);
         Exit;
      end;

      if edtDataEfetiva.Date <= pRPI.DATAULTFECH then
         RendaVariavel.MarcarFlagReproc(QryDestinoGrupamento.FieldByName('IDINVESTIMENTO').AsInteger,
                                        -1, -1, edtDataEfetiva.Date);

      QryDestinoGrupamento.First;
      ZeraCotaGerencial(edtDataEfetiva.Date,
                        QryDestinoGrupamento.FieldByName('IDINVESTIMENTO').AsInteger);

   end
   // Tratamento da Incorporação, Permulta, Alteração do tipo
   else if iTipoOperacao  In [pRPI.IDTIPOOPERDIRINC, pRPI.IDTIPOOPERDIRPER, pRPI.IDTIPOOPERDIRALT] then
   begin
      if not ProcIncPerAlt then
      begin
         If (Not bVerFormAge) Then
             bbtnSairClick(Sender);
         Exit;
      end;

      QryOrigemIncPerAlt.First;

      if edtDataEfetiva.Date <= pRPI.DATAULTFECH then
         RendaVariavel.MarcarFlagReproc(QryOrigemIncPerAlt.FieldByName('IDINVESTIMENTO').AsInteger,
                                        -1, -1, edtDataEfetiva.Date);

      QryDestinoIncPerAlt.First;
      ZeraCotaGerencial(edtDataEfetiva.Date,
                        QryDestinoIncPerAlt.FieldByName('IDINVESTIMENTO').AsInteger);

   end
   // Tratamento do Desdobramento
   else if iTipoOperacao = pRPI.IDTIPOOPERDIRDES then
   begin
      if not ProcDesdobramento then
      begin
         if dtmBaseDados.dbBaseDados.InTransaction then
            DtmBaseDados.dbBaseDados.Rollback;
         QryBuscaTipoOper.Close;
         QryBuscaInvestimento.Close;
         If (Not bVerFormAge) Then
             bbtnSairClick(Sender);
         Exit;
      end;

      if edtDataEfetiva.Date <= pRPI.DATAULTFECH then
         RendaVariavel.MarcarFlagReproc(QryDestinoDesdobramento.FieldByName('IDINVESTIMENTO').AsInteger,
                                        -1, -1, edtDataEfetiva.Date);

      QryDestinoDesdobramento.First;
      ZeraCotaGerencial(edtDataEfetiva.Date,
                        QryDestinoDesdobramento.FieldByName('IDINVESTIMENTO').AsInteger);

   end
   //AL_6
   // Tratamento da Restituição de Capital
   else if iTipoOperacao = pRPI.IDTIPOOPERDIRRES then
   begin
      if not ProcRestituicaoCap then
      begin
         if dtmBaseDados.dbBaseDados.InTransaction then
            DtmBaseDados.dbBaseDados.Rollback;
         QryBuscaTipoOper.Close;
         QryBuscaInvestimento.Close;
         If (Not bVerFormAge) Then
             bbtnSairClick(Sender);
         Exit;
      end;

      if edtDataEfetiva.Date <= pRPI.DATAULTFECH then
         RendaVariavel.MarcarFlagReproc(QryDestinoRestCap.FieldByName('IDINVESTIMENTO').AsInteger,
                                        -1, -1, edtDataEfetiva.Date);

      QryDestinoRestCap.First;
      ZeraCotaGerencial(edtDataEfetiva.Date,
                        QryDestinoRestCap.FieldByName('IDINVESTIMENTO').AsInteger);
   end;

   If Not bProvisiona Then //Operação
      dDataAnt := edtDataEfetiva.Date - 1
   else
      dDataAnt := dDataAGEProv - 1;

   While not DiasUteisInv.DiaUtil(dDataAnt,-1,1,'',True,False,False) Do
      dDataAnt  := dDataAnt - 1;   // Achar o dia útil anterior

   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;

   dbgOrigemDirJur.Color           := clSilver;
   dbgOrigemDirJur.Font.Color      := clGray;

   dbgOrigemSub.Color              := clSilver;
   dbgOrigemSub.Font.Color         := clGray;
   dbgDestinoSub.Color             := clSilver;
   dbgDestinoSub.Font.Color        := clGray;

   dbgOrigemIncPerAlt.Color        := clSilver;
   dbgOrigemIncPerAlt.Font.Color   := clGray;
   dbgDestinoIncPerAlt.Color       := clSilver;
   dbgDestinoIncPerAlt.Font.Color  := clGray;

   dbgOrigemGrupamento.Color       := clSilver;
   dbgOrigemGrupamento.Font.Color  := clGray;
   dbgDestinoGrupamento.Color      := clSilver;
   dbgDestinoGrupamento.Font.Color := clGray;

   dbgOrigemDesdobramento.Color       := clSilver;
   dbgOrigemDesdobramento.Font.Color  := clGray;
   dbgDestinoDesdobramento.Color      := clSilver;
   dbgDestinoDesdobramento.Font.Color := clGray;

   dbgOrigemRestCap.Color          := clSilver;
   dbgOrigemRestCap.Font.Color     := clGray;
   dbgDestinoRestCap.Color         := clSilver;
   dbgDestinoRestCap.Font.Color    := clGray;

   edtDataEfetiva.Color            := clSilver;
   edtDataEfetiva.Enabled          := False;

   If (bVerFormAge = True) Then
       frmCadAGE.sbtnOpercoesDireito.Down := False;

   QryBuscaTipoOper.Close;
   QryBuscaInvestimento.Close;

   If (Not bVerFormAge) Then
       bbtnSairClick(Sender);   

end;

//Al_20 - Ricardo - 05/01/2005
procedure TfrmCadOperAGENovo.BuscaSaldo(iIdCarteiraInvest, iIdCarteiraGerenc,
                                        iIdInvestimento : Integer;
                                        sIdLote         : String;
                                        Data            : TDateTime;
                                        iIdCustodiante  : Integer = -1);
begin
    wSaldoIRApu := 0;
    wSaldoQtd   := 0;
    wSaldoAqui  := 0;
    wSaldoVlr   := 0;
    wSdoQtdCPMF := 0;
    //AL_1
    //AL_5
    OperComum.BuscaTodosSaldosInvestLote(
       iIdCarteiraInvest, iIdCarteiraGerenc, iIdInvestimento, high(integer),-1,
       sIdLote, DateToStr(Data),
       iIdCustodiante,
       wSaldoQtd,    wSaldoVlr   , wSaldoInutil, wSaldoInutil, wSaldoAqui,
       wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
       wSaldoIRApu,  wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
       wSaldoInutil, wSaldoInutil, wSdoQtdCPMF);
end;

procedure TfrmCadOperAGENovo.AbreQueryOrigem(QryTmpOrigem, QryTmpDestino : TQuery;
                                             DataAGE                     : TDateTime;
                                             bCancelar, bRecalcula       : Boolean);
Var
  nCampo, I                          : Integer;
  DataAGECons                        : TDateTime;
  eAcumulado, eIRExercido            : Extended;
  dQtdDirProv                        : Double;
begin

   dQtdDirProv        := 0;
   eAcumulado         := 0;
   eIRExercido        := 0;
   wVlrTotOperacaoAnt := 0;

   QryOperacaoDireito.Close;
   QryOperacaoDireito.ParamByName('IDOPERACAODIREITO').AsInteger := iIdOperacaoDireito;
   QryOperacaoDireito.Open;

   wPlanoProv         := qryOperacaoDireito.FieldByName('PLANO').AsInteger;
   wPlnProv           := qryOperacaoDireito.FieldByName('PLNCODIGO').AsInteger;
   wDocProv           := qryOperacaoDireito.FieldByName('CODDOCUMENTO').AsInteger;

   dDataAGEProv       := qryOperacaoDireito.FieldByName('DATAOPER').AsDateTime;
   dDataVencProv      := qryOperacaoDireito.FieldByName('DATACOM').AsDateTime;

   If QryOperacaoDireito.FieldByName('DATACOM').AsDateTime <> 0 Then
      edtDataEfetiva.Date := QryOperacaoDireito.FieldByName('DATACOM').AsDateTime;

   DataAGECons := DataAGE;
   //al_40 - Ricardo - 02/05/2005
{   If (Trim(QryOperacaoDireito.FieldByName('STATUS').AsString) <> 'P') Then
   Begin
      DataAGECons := DataAGECons - 1;
      While not DiasUteisInv.DiaUtil(DataAGECons,-1,1,'',True,False,False) Do
          DataAGECons := DataAGECons - 1;   // Achar o dia útil anterior
   End;}

   OperacaoInvest.RetParamOperDireito(iIdOperacaoDireito, Reg, QryTmpOrigem.DatabaseName);

   Reg.DIVPORACAO := QryOperacaoDireito.FieldByName('DIVPORACAO').AsFloat;
   fPuAtual       := QryOperacaoDireito.FieldByName('DIVPORACAO').AsFloat;

   if not bRecalcula then
   begin
      QryTmpOrigem.Close;
      QryTmpOrigem.ParamByName('IDOPERACAODIREITO').AsInteger := iIdOperacaoDireito;
      QryTmpOrigem.ParamByName('DATAAGE').AsDate              := DataAGE;
      QryTmpOrigem.Open;
   End;

   QryTmpOrigem.DisableControls;

   while not QryTmpOrigem.EOF Do
   begin
      dtmAGE.qrySaldoCustodia.Close;
      dtmAGE.qrySaldoCustodia.ParamByName('IDCARTEIRA').AsInteger       := QryTmpOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger;
      dtmAGE.qrySaldoCustodia.ParamByName('IDINVESTIMENTO').AsInteger   := QryTmpOrigem.FieldByName('IDINVESTIMENTO').AsInteger;
      dtmAGE.qrySaldoCustodia.ParamByName('IDLOTE').Clear;
      dtmAGE.qrySaldoCustodia.ParamByName('DATAMOV').AsDateTime         := DataAGECons;
      dtmAGE.qrySaldoCustodia.ParamByName('IDCUSTODIANTE').AsInteger    := QryTmpOrigem.FieldByName('IDCUSTODIANTE').AsInteger;
      dtmAGE.qrySaldoCustodia.ParamByName('IDMOTIVOBLOQUEIO').AsInteger := QryTmpOrigem.FieldByName('IDMOTIVOBLOQUEIO').AsInteger;
      dtmAGE.qrySaldoCustodia.ParamByName('IDCUSTODIA').AsInteger       := high(integer);
      dtmAGE.qrySaldoCustodia.Open;

      QryTmpOrigem.Edit;

      QryTmpOrigem.FieldByName('IR').ReadOnly             := False;
      QryTmpOrigem.FieldByName('VLRLIQ').ReadOnly         := False;
      QryTmpOrigem.FieldByName('QTDE').ReadOnly           := False;
      QryTmpOrigem.FieldByName('QTDEDIREITO').ReadOnly    := False;
      QryTmpOrigem.FieldByName('DATAREFERENCIA').ReadOnly := False;
      QryTmpOrigem.FieldByName('VALOREXERCIDO').ReadOnly  := False;
      QryTmpOrigem.FieldByName('VLRREMUNERACAO').ReadOnly := False;

      // Verifica se está Bloqueado
      if (QryTmpOrigem.FieldByName('IDMOTIVOBLOQUEIO').AsInteger = -1) then
          QryTmpOrigem.FieldByName('QTDE').AsFloat := dtmAGE.qrySaldoCustodia.FieldByName('SALDOLIBERADO').AsFloat   // Não
      else
          QryTmpOrigem.FieldByName('QTDE').AsFloat := dtmAGE.qrySaldoCustodia.FieldByName('SALDOBLOQUEADO').AsFloat;  // Sim

      if QryOperacaoDireito.FieldByName('QTDEACOESDIRPROV').AsFloat = 0 Then
      begin
         //AL_10
         if ((QryTmpOrigem.FieldByName('QTDE').AsFloat > 0) And
             (iTipoOperacao In [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR,
                                pRPI.IDTIPOOPERDIRMUL]))  then
         begin
            if (not bProvisiona) Then
            begin
               if ((QryTmpOrigem.FieldByName('QTDE').AsFloat -
                     QryOperacaoDireito.FieldByName('QTDERECDIRPARC').AsFloat) = 0) Then
                  QryTmpOrigem.FieldByName('QTDE').AsFloat :=
                               QryOperacaoDireito.FieldByName('QTDERECDIRPARC').AsFloat
               Else
                  QryTmpOrigem.FieldByName('QTDE').AsFloat :=
                     QryTmpOrigem.FieldByName('QTDE').AsFloat -
                        QryOperacaoDireito.FieldByName('QTDERECDIRPARC').AsFloat;
            end;
         end;
      end
      else
      begin
         if (not bProvisiona) And
            (QryOperacaoDireito.FieldByName('QTDEACOESDIRPROV').AsFloat <> 0) then
         begin
            If QryTmpOrigem.FieldByName('QTDE').AsFloat <> 0 Then
            begin
               if (QryOperacaoDireito.FieldByName('QTDEACOESDIRPROV').AsFloat -
                   QryOperacaoDireito.FieldByName('QTDERECDIRPARC').AsFloat) > 0 Then
                   QryTmpOrigem.FieldByName('QTDE').AsFloat :=
                           (QryOperacaoDireito.FieldByName('QTDEACOESDIRPROV').AsFloat-
                            QryOperacaoDireito.FieldByName('QTDERECDIRPARC').AsFloat)
               else
                  QryTmpOrigem.FieldByName('QTDE').AsFloat  :=  QryOperacaoDireito.FieldByName('QTDEACOESDIRPROV').AsFloat;
            end;
         end;
      end;

      //Conforme parametrização obtem a quantidade de direitos
      if (Reg.FLGPERC) And (Reg.PERCENTUAL <> 0) then
          QryTmpOrigem.FieldByName('QTDEDIREITO').AsFloat :=
                OperComum.Round((QryTmpOrigem.FieldByName('QTDE').AsFloat * Reg.PERCENTUAL) / 100,0)
      else
      begin
         if (iTipoOperacao  in [pRPI.IDTIPOOPERDIRRES]) Then
             QryTmpOrigem.FieldByName('QTDEDIREITO').AsFloat := OperComum.Trunca((QryTmpOrigem.FieldByName('QTDE').AsFloat * Reg.PARIDADE),0)
         else
             QryTmpOrigem.FieldByName('QTDEDIREITO').AsFloat := QryTmpOrigem.FieldByName('QTDE').AsFloat;
      end;

      QryTmpOrigem.FieldByName('DATAREFERENCIA').AsDateTime  := QryOperacaoDireito.FieldByName('DATAEX').AsDateTime;

      //Busca o lote do ação
      QryLote.Close;
      QryLote.ParamByName('IDACAO').AsInteger := QryTmpOrigem.FieldByName('IDINVESTIMENTO').AsInteger;
      QryLote.Open;

      //Busca os parametros da operação de direitos
      OperComum.LimpaParametros(QryOperacaoInvestOrigem);
      QryOperacaoInvestOrigem.ParamByName('IDOPERACAODIREITO').Asinteger := iIdOperacaoDireito;
      QryOperacaoInvestOrigem.ParamByName('IDCARTEIRAINVEST').Asinteger  :=
                              QryTmpOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger;
      QryOperacaoInvestOrigem.Open;

      if (QryOperacaoDireito.FieldByName('QTDEACOESDIRPROV').AsFloat = 0) Then
      begin
         LblBoleta.Caption := QryOperacaoInvestOrigem.FieldByName('NUMDOCUMENTO').AsString;
         LblBoleta.Repaint;

         QryTmpOrigem.FieldByName('VLRREMUNERACAO').AsFloat  := QryOperacaoInvestOrigem.FieldByName('VLRREMUNERACAO').AsFloat;

         //AL_31 - Ricardo - 15/04/2005
         If (QryTmpOrigem.FieldByName('QTDE').AsFloat -
              ABS(qryOperacaoDireito.FieldByName('QTDERECDIRPARC').AsFloat)) > 0 Then
             QryTmpOrigem.FieldByName('QTDE').AsFloat         :=
                          QryTmpOrigem.FieldByName('QTDE').AsFloat - ABS(qryOperacaoDireito.FieldByName('QTDERECDIRPARC').AsFloat);
         //AL_31 - Fim                          

         If (QryTmpOrigem.FieldByName('QTDE').AsFloat <> 0)   And
            (QryOperacaoDireito.FieldByName('QTDERECDIRPARC').AsFloat <> 0)  Then
             QryTmpOrigem.FieldByName('QTDEDIREITO').AsFloat   :=
                                       QryTmpOrigem.FieldByName('QTDE').AsFloat;

         If (QryOperacaoInvestOrigem.FieldByName('QTDEOPERACAO').AsFloat = 0) Then
            QryTmpOrigem.FieldByName('QTDEDIREITO').AsFloat   :=
                                      QryTmpOrigem.FieldByName('QTDE').AsFloat;

         If QryTmpOrigem.FieldByName('QTDEDIREITO').AsFloat <
                         QryTmpOrigem.FieldByName('QTDE').AsFloat Then
            QryTmpOrigem.FieldByName('QTDEDIREITO').AsFloat   :=
                                      QryTmpOrigem.FieldByName('QTDE').AsFloat;

      end;

      //AL_11 - RICARDO - 08/12/2004
      if iTipoOperacao In [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR,
                           pRPI.IDTIPOOPERDIRSUB, pRPI.IDTIPOOPERDIRMUL,
                           pRPI.IDTIPOOPERDIRDSU] then
      begin
         If QryOperacaoDireito.FieldByName('QTDEACOESDIRPROV').AsFloat <> 0 Then
            QryTmpOrigem.FieldByName('VALOREXERCIDO').AsFloat  :=
                         OperComum.Round((QryTmpOrigem.FieldByName('QTDEDIREITO').AsFloat * Reg.DIVPORACAO)-0.0049,2)
         Else
            QryTmpOrigem.FieldByName('VALOREXERCIDO').AsFloat   := OperComum.Round(
                     (QryTmpOrigem.FieldByName('QTDEDIREITO').AsFloat *
                         OperComum.DivValorZero(Reg.DIVPORACAO,
                             QryLote.FieldByName('QTDELOTE').AsInteger))-0.0049,2)+
                             QryOperacaoInvestOrigem.FieldByName('VLRREMUNERACAO').AsFloat;

         fVlrRendimento := 0;
         if QryOperacaoDireito.FieldByName('ISENCAOIR').AsString = 'N' then
            eIRExercido := Impostos.CalculaIr(0,
                                  QryTmpOrigem.FieldByName('IDINVESTIMENTO').AsInteger,
                                  0{CARTEIRAGERENC},
                                  QryTmpOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                  QryOperacaoDireito.FieldByName('IDTIPOOPERACAO').AsInteger,
                                  Reg.IDMERCADO,
                                  QryTmpOrigem.FieldByName('IDLOTE').AsString,
                                  Date, Date,
                                  0,
                                  QryTmpOrigem.FieldByName('VALOREXERCIDO').AsFloat, 0, 'S',
                                  Reg.FLGTRATAIR,fVlrRendimento);
      end;

      eIRExercido   := eIRExercido + QryOperacaoInvestOrigem.FieldByName('VLRIRREMUNER').AsFloat;

      QryTmpOrigem.FieldByName('IR').AsFloat := eIRExercido;

      //Gera Ir Litigio
      if QryOperacaoDireito.FieldByName('IRLITIGIO').AsString = 'S' then
         QryTmpOrigem.FieldByName('VLRLIQ').AsFloat := QryTmpOrigem.FieldByName('VALOREXERCIDO').AsFloat
      else
         QryTmpOrigem.FieldByName('VLRLIQ').AsFloat := QryTmpOrigem.FieldByName('VALOREXERCIDO').AsFloat-eIRExercido;

      //Busca saldo atual
      If (Trim(QryOperacaoDireito.FieldByName('STATUS').AsString) <> '') Then
         BuscaSaldo(QryTmpOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger, 0{iIdCarteiraGerenc},
                    QryTmpOrigem.FieldByName('IDINVESTIMENTO').AsInteger,
                    QryTmpOrigem.FieldByName('IDLOTE').AsString,
                    DataAGECons)
      Else
         BuscaSaldo(QryTmpOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger, 0{iIdCarteiraGerenc},
                    QryTmpOrigem.FieldByName('IDINVESTIMENTO').AsInteger,
                    QryTmpOrigem.FieldByName('IDLOTE').AsString,
                    DataAGE);

      if ((iTipoOperacao In [pRPI.IDTIPOOPERDIRRES, pRPI.IDTIPOOPERDIRALT]) And
          (Reg.PARIDADE <> 0)) then
      begin
         QryTmpOrigem.FieldByName('VLRCUSTOATUAL').ReadOnly := False;
         QryTmpOrigem.FieldByName('QTDE').AsFloat           := wSaldoQtd;
         QryTmpOrigem.FieldByName('VALOREXERCIDO').AsFloat  := wSaldoVlr;
         QryTmpOrigem.FieldByName('VLRCUSTOATUAL').AsFloat  := wSaldoAqui;
      end;

      if QryTmpOrigem.FieldByName('PERCENTUALINV').AsFloat <> 0 Then
      begin
         QryTmpOrigem.FieldByName('VLRCUSTO').ReadOnly      := False;
         QryTmpOrigem.FieldByName('VLRCUSTOATUAL').ReadOnly := False;
         QryTmpOrigem.FieldByName('VLRCUSTO').AsFloat       := (wSaldoAqui*(QryTmpOrigem.FieldByName('PERCENTUALINV').AsFloat/100));
         QryTmpOrigem.FieldByName('VLRCUSTOATUAL').AsFloat  :=  wSaldoAqui;
      end;

      QryTmpOrigem.Post;

      if (iTipoOperacao  in [pRPI.IDTIPOOPERDIRRES]) Then
         eAcumulado := eAcumulado + QryTmpOrigem.FieldByName('QTDEDIREITO').AsFloat
      else if (iTipoOperacao  in [pRPI.IDTIPOOPERDIRGRU, pRPI.IDTIPOOPERDIRINC,
                                  pRPI.IDTIPOOPERDIRPER, pRPI.IDTIPOOPERDIRALT]) Then
         eAcumulado := eAcumulado + OperComum.Trunca((QryTmpOrigem.FieldByName('QTDEDIREITO').AsFloat * Reg.PARIDADE),0)
      else
         eAcumulado := eAcumulado + OperComum.Trunca((QryTmpOrigem.FieldByName('QTDEDIREITO').AsFloat *
                                    OperComum.DivValorZero(Reg.PERCENTUAL,100)),0);

      wVlrTotOperacaoAnt := wVlrTotOperacaoAnt + QryTmpOrigem.FieldByName('VLRLIQ').AsFloat;

      QryTmpOrigem.Next;
   end;

   if not (iTipoOperacao in [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR,
                             pRPI.IDTIPOOPERDIRMUL])then
      AbreQueryDestino(QryTmpOrigem, QryTmpDestino, eAcumulado, DataAGE, DataAGECons);

   for I := 0 to Pred(QryTmpOrigem.FieldCount) Do
      QryTmpOrigem.Fields[I].ReadOnly := False;

   QryTmpOrigem.First;   // O First é necessário para o funcionamento do recalculo.

   while not QryTmpOrigem.Eof do
   begin
      if QryTmpOrigem.FieldByName('QTDE').AsFloat > 0 then
         QryTmpOrigem.Next
      else
         QryTmpOrigem.Delete;
   end;

   //AL_13 - Ricardo - 08/12/2004
   If QryTmpOrigem.RecordCount <= 0 Then
   begin
      //Al_32 - Ricardo - 19/04/2005
      MsgDlg('Operação já Lançada ou Saldo zerado para esse Investimento,'#13+
             'com referência a DATA EX. Verificar o Saldo na Custódia!',
             'Mensagem do Sistema',MtWarning,[mbOk],0);
      bbtnSair.Click;
      Exit;
   end;
   //AL_13    

   if (Trim(QryOperacaoDireito.FieldByName('STATUS').AsString) <> '') And
          ((QryTmpOrigem.FieldByName('QTDE').AsFloat -
            QryOperacaoDireito.FieldByName('QTDERECDIRPARC').AsFloat) = 0) Or
      (Trim(QryOperacaoDireito.FieldByName('STATUS').AsString) <> '') And
          ((QryOperacaoDireito.FieldByName('QTDEACOESDIRPROV').AsFloat-
            QryOperacaoDireito.FieldByName('QTDERECDIRPARC').AsFloat) = 0) then // se operação já lançada
   begin
      edtDataEfetiva.Date := QryOperacaoInvestOrigem.FieldByName('DATAOPERACAO').AsDateTime;

      dbgOrigemDirJur.Color        := clSilver;
      dbgOrigemDirJur.Font.Color   := clGray;
      edtDataEfetiva.Color         := clSilver;
      edtDataEfetiva.Enabled       := False;
      bbtnConfirmar.Enabled        := False;
      bbtnCancelar.Enabled         := False;
      if not (iTipoOperacao in [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR,
                                pRPI.IDTIPOOPERDIRMUL])then
      begin
         BtIncDet.Enabled          := False;
         BtAltDet.Enabled          := False;
         BtDelDet.Enabled          := False;
         //AL_11 - RICARDO - 08/12/2004
         if iTipoOperacao  In [pRPI.IDTIPOOPERDIRSUB, pRPI.IDTIPOOPERDIRDSU] then
         begin
            dbgOrigemSub.Color       := clSilver;
            dbgOrigemSub.Font.Color  := clGray;
            dbgDestinoSub.Color      := clSilver;
            dbgDestinoSub.Font.Color := clGray;
         end
         else if iTipoOperacao  In [pRPI.IDTIPOOPERDIRINC, pRPI.IDTIPOOPERDIRPER,
                                    pRPI.IDTIPOOPERDIRALT] then
         begin
            dbgOrigemIncPerAlt.Color       := clSilver;
            dbgOrigemIncPerAlt.Font.Color  := clGray;
            dbgDestinoIncPerAlt.Color      := clSilver;
            dbgDestinoIncPerAlt.Font.Color := clGray;
         end
         else if iTipoOperacao  In [pRPI.IDTIPOOPERDIRGRU] then
         begin
            dbgOrigemGrupamento.Color       := clSilver;
            dbgOrigemGrupamento.Font.Color  := clGray;
            dbgDestinoGrupamento.Color      := clSilver;
            dbgDestinoGrupamento.Font.Color := clGray;
         end
         else if iTipoOperacao  In [pRPI.IDTIPOOPERDIRDES] then
         begin
            dbgOrigemDesdobramento.Color       := clSilver;
            dbgOrigemDesdobramento.Font.Color  := clGray;
            dbgDestinoDesdobramento.Color      := clSilver;
            dbgDestinoDesdobramento.Font.Color := clGray;
         end
         else if iTipoOperacao  In [pRPI.IDTIPOOPERDIRRES] then
         begin
            dbgOrigemRestCap.Color          := clSilver;
            dbgOrigemRestCap.Font.Color     := clGray;
            dbgDestinoRestCap.Color         := clSilver;
            dbgDestinoRestCap.Font.Color    := clGray;
         end;
      end;
   end
   else
   begin
      dbgOrigemDirJur.Color        := clWindow;
      dbgOrigemDirJur.Font.Color   := clWindowText;
      edtDataEfetiva.Color         := clWindow;
      edtDataEfetiva.Enabled       := True;
      bbtnConfirmar.Enabled        := True;
      bbtnCancelar.Enabled         := True;
      if not (iTipoOperacao in [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR,
                                pRPI.IDTIPOOPERDIRMUL])then
      begin
         BtIncDet.Enabled          := True;
         BtAltDet.Enabled          := True;
         BtDelDet.Enabled          := True;
         //AL_11 - RICARDO - 08/12/2004
         if iTipoOperacao  In [pRPI.IDTIPOOPERDIRSUB, pRPI.IDTIPOOPERDIRDSU] then
         begin
            dbgOrigemSub.Color              := clWindow;
            dbgOrigemSub.Font.Color         := clWindowText;
            dbgDestinoSub.Color             := clWindow;
            dbgDestinoSub.Font.Color        := clWindowText;
         end
         else if iTipoOperacao  In [pRPI.IDTIPOOPERDIRINC, pRPI.IDTIPOOPERDIRPER,
                                    pRPI.IDTIPOOPERDIRALT] then
         begin
            dbgOrigemIncPerAlt.Color        := clWindow;
            dbgOrigemIncPerAlt.Font.Color   := clWindowText;
            dbgDestinoIncPerAlt.Color       := clWindow;
            dbgDestinoIncPerAlt.Font.Color  := clWindowText;
         end
         else if iTipoOperacao  In [pRPI.IDTIPOOPERDIRGRU] then
         begin
            dbgOrigemGrupamento.Color       := clWindow;
            dbgOrigemGrupamento.Font.Color  := clWindowText;
            dbgDestinoGrupamento.Color      := clWindow;
            dbgDestinoGrupamento.Font.Color := clWindowText;
         end
         else if iTipoOperacao  In [pRPI.IDTIPOOPERDIRDES] then
         begin
            dbgOrigemDesdobramento.Color       := clWindow;
            dbgOrigemDesdobramento.Font.Color  := clWindowText;
            dbgDestinoDesdobramento.Color      := clWindow;
            dbgDestinoDesdobramento.Font.Color := clWindowText;
         end
         else if iTipoOperacao  In [pRPI.IDTIPOOPERDIRRES] then
         begin
            dbgOrigemRestCap.Color          := clWindow;
            dbgOrigemRestCap.Font.Color     := clWindowText;
            dbgDestinoRestCap.Color         := clWindow;
            dbgDestinoRestCap.Font.Color    := clWindowText;
         end;
      end;
   end;

   QryTmpOrigem.FindFirst;

   QryTmpOrigem.EnableControls;

   if (QryOperacaoDireito.FieldByName('QTDEACOESDIRPROV').AsFloat) > 0 Then
   begin
      QryOrigDivJurAnu.Close;
      QryOrigDivJurAnu.ParambyName('P_IDOPERACAODIREITO').Asinteger := iIdOperacaoDireito;
      QryOrigDivJurAnu.Open;

      if ((QryOperacaoDireito.FieldByName('QTDEACOESDIRPROV').AsFloat -
           QryOperacaoDireito.FieldByname('QTDERECDIRPARC').AsFloat) = 0) Then
      begin
         Panel1.Caption                := Copy(lblTipoOperacao.Caption, POS('/',lblTipoOperacao.Caption)+1,Length(lblTipoOperacao.Caption));
         lblSigla.Visible              := False;
         LblBoleta.Visible             := False;
         lblTipoOperacao.Visible       := False;
         dbgOrigemDirJur.Visible       := False;
         dbgOrigemDivJurAnu.Visible    := True;
         dbgOrigemDivJurAnu.Color      := clSilver;
         dbgOrigemDivJurAnu.Font.Color := clGray;
      end
      else
      begin
         Panel1.Caption                := 'Origem';
         lblSigla.Visible              := True;
         LblBoleta.Visible             := True;
         lblTipoOperacao.Visible       := True;
         dbgOrigemDirJur.Visible       := True;
         dbgOrigemDivJurAnu.Visible    := False;
      end;
   end;

end;

Procedure TfrmCadOperAGENovo.AbreQueryDestino(QryTmpOrigem, QryTmpDestino : TQuery;
                                              Acumulado                   : Extended;
                                              DataAGE, DataAGECons        : TDateTime);
Var
  I, nCampo : Integer;
  fCotacao, QTDE      : Double;
begin

  QryTmpOrigem.First;

  for I := 0 to Pred(QryTmpOrigem.FieldCount) Do
      QryTmpOrigem.Fields[I].ReadOnly := True;

  //Posiciona Investimento
  QryInvestimento.Close;
  QryInvestimento.ParamByName('IDOPERACAODIREITO').AsInteger := iIdOperacaoDireito;
  QryInvestimento.Open;

  //Abre query de destino da operação
  QryTmpDestino.Close;
  QryTmpDestino.ParamByName('IDOPERACAODIREITO').AsInteger   := iIdOperacaoDireito;
  QryTmpDestino.Open;

  QryTmpOrigem.First;
  //Caso não tenha confirmada a operação incrementa o investimento de destino
  if QryTmpDestino.IsEmpty then
  begin
     While Not QryTmpOrigem.Eof Do
     begin
        If QryTmpOrigem.FieldByName('QTDEDIREITO').AsFloat <> 0 Then
        begin
           //Al_46 - Ricardo - 25/05/2005
           QryInvestimento.First;
           if QryInvestimento.Locate('IDINVESTIMENTO', QryTmpOrigem.FieldByName('IDINVESTIMENTO').AsInteger, []) then
           begin
              QryTmpDestino.Append;
              QryTmpDestino.FieldByName('IDINVESTIMENTO').ReadOnly    := False;
              QryTmpDestino.FieldByName('IDCARTEIRAINVEST').ReadOnly  := False;
              QryTmpDestino.FieldByName('IDMOTIVOBLOQUEIO').ReadOnly  := False;
              QryTmpDestino.FieldByName('IDCUSTODIANTE').ReadOnly     := False;
              QryTmpDestino.FieldByName('QTDEDIREITO').ReadOnly       := False;
              QryTmpDestino.FieldByName('QTDENOVA').ReadOnly          := False;
              QryTmpDestino.FieldByName('VLRCUSTO').ReadOnly          := False;
   
              QryTmpDestino.FieldByName('IDCUSTODIANTE').AsInteger    :=
                            QryTmpOrigem.FieldByName('IDCUSTODIANTE').AsInteger;

              QryTmpDestino.FieldByName('IDMOTIVOBLOQUEIO').AsInteger :=
                            QryTmpOrigem.FieldByName('IDMOTIVOBLOQUEIO').AsInteger;
   
              QryTmpDestino.FieldByName('IDINVESTIMENTO').AsInteger   :=
                            QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
   
              QryTmpDestino.FieldByName('IDCARTEIRAINVEST').AsInteger :=
                            QryTmpOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger;
   
              QryTmpDestino.FieldByName('QTDEDIREITO').AsFloat   :=
                            OperComum.Round(QryTmpOrigem.FieldByName('QTDEDIREITO').AsFloat * Reg.PARIDADE,0);
   
              if iTipoOperacao  In [pRPI.IDTIPOOPERDIRINC, pRPI.IDTIPOOPERDIRRES,
                                    pRPI.IDTIPOOPERDIRPER, pRPI.IDTIPOOPERDIRALT] then
              begin
                 dtmAGE.qrySaldoCustodia.Close;
                 dtmAGE.qrySaldoCustodia.ParamByName('IDCARTEIRA').AsInteger      :=
                                         QryTmpDestino.FieldByName('IDCARTEIRAINVEST').AsInteger;
                 dtmAGE.qrySaldoCustodia.ParamByName('IDINVESTIMENTO').AsInteger  :=
                                         QryTmpDestino.FieldByName('IDINVESTIMENTO').AsInteger;
                 dtmAGE.qrySaldoCustodia.ParamByName('IDLOTE').AsString           := '';
                 dtmAGE.qrySaldoCustodia.ParamByName('DATAMOV').AsDateTime        := DataAGECons;
                 dtmAGE.qrySaldoCustodia.ParamByName('IDCUSTODIANTE').AsInteger   :=
                                         QryTmpDestino.FieldByName('IDCUSTODIANTE').AsInteger;
                 dtmAGE.qrySaldoCustodia.ParamByName('IDMOTIVOBLOQUEIO').AsInteger:=
                                         QryTmpDestino.FieldByName('IDMOTIVOBLOQUEIO').AsInteger;
                 dtmAGE.qrySaldoCustodia.ParamByName('IDCUSTODIA').AsInteger      := high(integer);
                 dtmAGE.qrySaldoCustodia.Open;
   
                 //Incrementa dados nas variáveis
                 if (QryTmpDestino.FieldByName('IDMOTIVOBLOQUEIO').AsInteger = -1) then  // Está Bloqueado ?
                     QTDE  := dtmAGE.qrySaldoCustodia.FieldByName('SALDOLIBERADO').AsFloat   // Não
                 else
                     QTDE  := dtmAGE.qrySaldoCustodia.FieldByName('SALDOBLOQUEADO').AsFloat;  // Sim
   
                 QryTmpDestino.FieldByName('QTDENOVA').AsFloat      := QTDE +
                                         QryTmpDestino.FieldByName('QTDEDIREITO').AsFloat;
   
                 QryTmpDestino.FieldByName('VLRCUSTO').AsFloat      :=
                               OperComum.Round(QryTmpOrigem.FieldByName('VLRCUSTOATUAL').AsFloat*Reg.PARIDADE,2);
              end;

              QryTmpDestino.Post;

           end;
           //Al_46 - Fim
        end;

        QryTmpOrigem.Next;
     end;
  end;
  //Al_50 - Ricardo - 27/06/2005 
  QryTmpOrigem.First;
  QryTmpDestino.First;
  if (QryTmpDestino.FieldByName('IDCARTEIRAINVEST').AsInteger = 0) Then
  begin
     While Not QryTmpOrigem.Eof Do
     begin
        If (QryTmpDestino.FieldByName('IDCARTEIRAINVEST').AsInteger <>
            QryTmpOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger) And
           (QryTmpOrigem.FieldByName('QTDEDIREITO').AsFloat <> 0)   Then
        begin
           If QryTmpDestino.Eof Then
           begin
              QryTmpDestino.Append;
              QryTmpDestino.FieldByName('IDINVESTIMENTO').ReadOnly    := False;
              QryTmpDestino.FieldByName('IDCARTEIRAINVEST').ReadOnly  := False;
              QryTmpDestino.FieldByName('IDMOTIVOBLOQUEIO').ReadOnly  := False;
              QryTmpDestino.FieldByName('IDCUSTODIANTE').ReadOnly     := False;
              QryTmpDestino.FieldByName('IDCUSTODIANTE').AsInteger    :=
                            QryTmpOrigem.FieldByName('IDCUSTODIANTE').AsInteger;
              QryTmpDestino.FieldByName('IDMOTIVOBLOQUEIO').AsInteger :=
                            QryTmpOrigem.FieldByName('IDMOTIVOBLOQUEIO').AsInteger;
              QryTmpDestino.FieldByName('IDINVESTIMENTO').AsInteger   :=
                            QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
              QryTmpDestino.FieldByName('IDCARTEIRAINVEST').AsInteger :=
                            QryTmpOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger;
              QryTmpDestino.Post;
           end;

           While Not QryTmpDestino.Eof Do
           begin
              QryTmpDestino.Edit;
              QryTmpDestino.FieldByName('IDINVESTIMENTO').ReadOnly    := False;
              QryTmpDestino.FieldByName('IDCARTEIRAINVEST').ReadOnly  := False;
              QryTmpDestino.FieldByName('IDMOTIVOBLOQUEIO').ReadOnly  := False;
              QryTmpDestino.FieldByName('IDCUSTODIANTE').ReadOnly     := False;
              QryTmpDestino.FieldByName('IDCUSTODIANTE').AsInteger    :=
                            QryTmpOrigem.FieldByName('IDCUSTODIANTE').AsInteger;
              QryTmpDestino.FieldByName('IDMOTIVOBLOQUEIO').AsInteger :=
                            QryTmpOrigem.FieldByName('IDMOTIVOBLOQUEIO').AsInteger;
              QryTmpDestino.FieldByName('IDINVESTIMENTO').AsInteger   :=
                            QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
              QryTmpDestino.FieldByName('IDCARTEIRAINVEST').AsInteger :=
                            QryTmpOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger;
              QryTmpDestino.Post;
              QryTmpDestino.Next;
           end;   
        end;
        QryTmpOrigem.Next;
     end;
  end;

  QryTmpDestino.First;
  QryBuscaInvestimento.Close;
  QryBuscaInvestimento.ParamByName('IDINVESTIMENTO').AsInteger :=
                               QryTmpDestino.FieldByName('IDINVESTIMENTO').AsInteger;
  QryBuscaInvestimento.Open;

  if Not (iTipoOperacao In [pRPI.IDTIPOOPERDIRINC,
                            pRPI.IDTIPOOPERDIRPER, pRPI.IDTIPOOPERDIRALT]) then
  begin
     QryTmpOrigem.First;
     QryTmpDestino.First;
     while not QryTmpOrigem.EOF Do
     begin
        if QryTmpOrigem.FieldByName('QTDEDIREITO').AsFloat <> 0 Then
        begin
           while not QryTmpDestino.EOF Do
           begin
              //Abre query's
              QryBuscaInvestimento.Close;
              QryBuscaInvestimento.ParamByName('IDINVESTIMENTO').AsInteger :=
                                           QryTmpDestino.FieldByName('IDINVESTIMENTO').AsInteger;
              QryBuscaInvestimento.Open;

              QryOperacaoInvestDestino.Close;
              QryOperacaoInvestDestino.ParamByName('IDOPERACAOINVEST').Asinteger :=
                                       QryTmpDestino.FieldByName('IDOPERACAOINVEST').AsInteger;
              QryOperacaoInvestDestino.Open;

              //Habilita qry para incrementar dados
              QryTmpDestino.Edit;

              //Habilita variáveis para incrementar dados
              QryTmpDestino.FieldByName('IDCARTEIRAINVEST').ReadOnly := False;
              QryTmpDestino.FieldByName('IDCUSTODIANTE').ReadOnly    := False;
              QryTmpDestino.FieldByName('IDMOTIVOBLOQUEIO').ReadOnly := False;
              QryTmpDestino.FieldByName('IDLOTE').ReadOnly           := False;
              QryTmpDestino.FieldByName('PERCCUSTO').ReadOnly        := False;
              QryTmpDestino.FieldByName('QTDEDIREITO').ReadOnly      := False;
              QryTmpDestino.FieldByName('QTDENOVA').ReadOnly         := False;
              QryTmpDestino.FieldByName('VALOREXERCIDO').ReadOnly    := False;

              dtmAGE.qrySaldoCustodia.Close;
              dtmAGE.qrySaldoCustodia.ParamByName('IDCARTEIRA').AsInteger      :=
                                      QryTmpDestino.FieldByName('IDCARTEIRAINVEST').AsInteger;
              dtmAGE.qrySaldoCustodia.ParamByName('IDINVESTIMENTO').AsInteger  :=
                                      QryTmpDestino.FieldByName('IDINVESTIMENTO').AsInteger;
              dtmAGE.qrySaldoCustodia.ParamByName('IDLOTE').AsString           := '';
              dtmAGE.qrySaldoCustodia.ParamByName('DATAMOV').AsDateTime        := DataAGECons;
              dtmAGE.qrySaldoCustodia.ParamByName('IDCUSTODIANTE').AsInteger   :=
                                      QryTmpDestino.FieldByName('IDCUSTODIANTE').AsInteger;
              dtmAGE.qrySaldoCustodia.ParamByName('IDMOTIVOBLOQUEIO').AsInteger:=
                                      QryTmpDestino.FieldByName('IDMOTIVOBLOQUEIO').AsInteger;
              dtmAGE.qrySaldoCustodia.ParamByName('IDCUSTODIA').AsInteger      := high(integer);
              dtmAGE.qrySaldoCustodia.Open;

              //Incrementa dados nas variáveis
              if (QryTmpDestino.FieldByName('IDMOTIVOBLOQUEIO').AsInteger = -1) then  // Está Bloqueado ?
                  QTDE  := dtmAGE.qrySaldoCustodia.FieldByName('SALDOLIBERADO').AsFloat   // Não
              else
                  QTDE  := dtmAGE.qrySaldoCustodia.FieldByName('SALDOBLOQUEADO').AsFloat;  // Sim
              //AL_11 - RICARDO - 08/12/2004
              if (iTipoOperacao  in [pRPI.IDTIPOOPERDIRBON, pRPI.IDTIPOOPERDIRRES,
                                     pRPI.IDTIPOOPERDIRSUB, pRPI.IDTIPOOPERDIRDSU]) then
                 QryTmpDestino.FieldByName('QTDEDIREITO').AsFloat    :=
                               OperComum.Round((Acumulado * Reg.PARIDADE),0)
              else if (iTipoOperacao = pRPI.IDTIPOOPERDIRGRU) Then
              begin
                 QTDE := OperComum.Round(QTDE * Reg.PARIDADE,0);
                 QryTmpDestino.FieldByName('QTDEDIREITO').AsFloat    := QTDE;
              end
              else if (iTipoOperacao = pRPI.IDTIPOOPERDIRDES) Then
                 QryTmpDestino.FieldByName('QTDEDIREITO').AsFloat    :=
                               OperComum.Round((QTDE * Reg.PERCENTUAL) / 100,0)
              else
                 QryTmpDestino.FieldByName('QTDEDIREITO').AsFloat    := Acumulado;

              QryTmpDestino.FieldByName('QTDENOVA').AsFloat       :=
                               QryTmpDestino.FieldByName('QTDEDIREITO').AsFloat;

              QryTmpDestino.FieldByName('IDLOTE').AsString            :=
                                         QryTmpOrigem.FieldByName('IDLOTE').AsString;

              QryTmpDestino.FieldByName('PERCCUSTO').AsFloat :=
                                         QryTmpOrigem.FieldByName('PERCENTUALINV').AsFloat;
              //Atualiza valor do custo
              If (iTipoOperacao = pRPI.IDTIPOOPERDIRRES) Then
                  QryTmpDestino.FieldByName('VLRCUSTO').AsFloat      :=
                            OperComum.Round(QryTmpOrigem.FieldByName('VLRCUSTOATUAL').AsFloat*Reg.PARIDADE,2)
              Else
                  QryTmpDestino.FieldByName('VLRCUSTO').AsFloat      := 0;

              //AL_11 - RICARDO - 08/12/2004                  
              if iTipoOperacao IN [pRPI.IDTIPOOPERDIRSUB, pRPI.IDTIPOOPERDIRRES,
                                   pRPI.IDTIPOOPERDIRDSU] then
              begin
                 QryTmpDestino.FieldByName('VALOREXERCIDO').AsFloat  :=
                               OperComum.DivValorZero(
                                         QryTmpDestino.FieldByName('QTDEDIREITO').AsFloat,
                                                 QryBuscaInvestimento.FieldByName('QTDELOTE').AsInteger)*
                                                (Reg.DIVPORACAO);

                 If QryTmpDestino.FieldByName('VALOREXERCIDO').AsFloat = 0 Then
                 begin
                    fCotacao  := OperComum.BuscaCotacaoAcao(QryTmpDestino.FieldByName('IDINVESTIMENTO').AsInteger,
                                                            StrToDate(edtDataEfetiva.Text), True);

                    QryTmpDestino.FieldByName('VALOREXERCIDO').AsFloat:=
                                   QryTmpDestino.FieldByName('QTDEDIREITO').AsFloat*fCotacao;
                 end;
              end
              Else
                 QryTmpDestino.FieldByName('VALOREXERCIDO').AsFloat  :=
                                            QryTmpOrigem.FieldByName('VALOREXERCIDO').AsFloat;

              QryTmpDestino.FieldByName('QTDENOVA').ReadOnly         := False;
              QryTmpDestino.FieldByName('QTDEDIREITO').ReadOnly      := False;
              QryTmpDestino.FieldByName('VALOREXERCIDO').ReadOnly    := False;

              If (Trim(QryOperacaoDireito.FieldByName('STATUS').AsString) <> '') Then
              Begin
                 QryTmpDestino.FieldByName('QTDENOVA').AsFloat           :=
                               QryOperacaoInvestDestino.FieldByName('QTDEOPERACAO').AsFloat;
                 QryTmpDestino.FieldByName('QTDEDIREITO').AsFloat        :=
                               QryOperacaoInvestDestino.FieldByName('QTDEOPERACAO').AsFloat;
                 QryTmpDestino.FieldByName('VALOREXERCIDO').AsFloat      :=
                               QryOperacaoInvestDestino.FieldByName('VLROPERACAO').AsFloat;
              End;

              QryTmpDestino.Post;
              //AL_2
              If (QryTmpDestino.FieldByName('QTDEDIREITO').AsFloat = 0) And
                 (Trim(QryOperacaoDireito.FieldByName('STATUS').AsString) = '') Then
              begin
                 QryTmpDestino.Delete;
                 QryTmpDestino.Next;
                 Continue;
              end;
              QryTmpDestino.Next;
           end;
        end;
        QryTmpOrigem.Next;
     end;
  end;

  dbgDestinoSub.Options := dbgDestinoSub.Options - [TwwDBgridOption(dgEditing)];

  lbDistribuido.Caption := FloatToStr(Acumulado);
  lbAdistribuir.Caption := FloatToStr(Acumulado);

end;

procedure TfrmCadOperAGENovo.GravaOperacaoInvest(iIDOPERACAOINVEST, iMOECODIGO, iIDMODULO,
                                                 iEMPRESAPROP, iIDINVESTIMENTO,
                                                 iIDCARTEIRAINVEST, iIDTIPOINVEST,
                                                 iIDTIPOOPERACAO, iIDFORCLI, iIDCUSTODIANTE,
                                                 iIDOPERACAODIREITO, iIDCARTEIRAGERENC : Integer;
                                                 dDATAOPERACAO, dDATAVENCOPER   : TDateTime;
                                                 sNUMDOCUMENTO, sFLGSTATUSFECHBOL,
                                                 sFLGSTATUSORDMOV, sIDLOTE      : String;
                                                 fQTDEOPERACAO, fPRECOUNITOPERACAO,
                                                 fVLROPERACAO, fVLRIR, fVLRREMUNERACAO,
                                                 fVLRIRREMUNER, fPERCCUSTO      : Double;
                                                 sORIGDEST : String;
                                                 iOperCustodia: Integer = -1);
begin
    OperComum.LimpaParametros(QryInsetOperacaoInvest);
    QryInsetOperacaoInvest.ParamByName('IDOPERACAOINVEST').AsInteger  := iIDOPERACAOINVEST;
    QryInsetOperacaoInvest.ParamByName('MOECODIGO').AsInteger         := iMOECODIGO;
    QryInsetOperacaoInvest.ParamByName('IDMODULO').AsInteger          := iIDMODULO;
    QryInsetOperacaoInvest.ParamByName('EMPRESAPROP').AsInteger       := iEMPRESAPROP;
    QryInsetOperacaoInvest.ParamByName('IDINVESTIMENTO').AsInteger    := iIDINVESTIMENTO;
    QryInsetOperacaoInvest.ParamByName('IDCARTEIRAINVEST').AsInteger  := iIDCARTEIRAINVEST;
    QryInsetOperacaoInvest.ParamByName('IDTIPOINVEST').AsInteger      := iIDTIPOINVEST;
    QryInsetOperacaoInvest.ParamByName('IDTIPOOPERACAO').AsInteger    := iIDTIPOOPERACAO;
    QryInsetOperacaoInvest.ParamByName('IDFORCLI').AsInteger          := iIDFORCLI;
    QryInsetOperacaoInvest.ParamByName('IDLOTE').AsString             := sIDLOTE;
    QryInsetOperacaoInvest.ParamByName('IDCUSTODIANTE').AsInteger     := iIDCUSTODIANTE;
    QryInsetOperacaoInvest.ParamByName('IDOPERACAODIREITO').AsInteger := iIDOPERACAODIREITO;

    If iIDCARTEIRAGERENC <> 0 Then
       QryInsetOperacaoInvest.ParamByName('IDCARTEIRAGERENC').AsInteger  := iIDCARTEIRAGERENC;

    QryInsetOperacaoInvest.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
    QryInsetOperacaoInvest.ParamByName('DATAOPERACAO').AsDateTime     := dDATAOPERACAO;
    QryInsetOperacaoInvest.ParamByName('DATAVENCOPER').AsDateTime     := dDATAVENCOPER;
    QryInsetOperacaoInvest.ParamByName('NUMDOCUMENTO').AsString       := sNUMDOCUMENTO;
    QryInsetOperacaoInvest.ParamByName('FLGSTATUSFECHBOL').AsString   := sFLGSTATUSFECHBOL;
    QryInsetOperacaoInvest.ParamByName('FLGSTATUSORDMOV').AsString    := sFLGSTATUSORDMOV;
    QryInsetOperacaoInvest.ParamByName('QTDEOPERACAO').AsFloat        := fQTDEOPERACAO;
    QryInsetOperacaoInvest.ParamByName('PRECOUNITOPERACAO').AsFloat   := fPRECOUNITOPERACAO;
    QryInsetOperacaoInvest.ParamByName('VLROPERACAO').AsFloat         := fVLROPERACAO;
    QryInsetOperacaoInvest.ParamByName('VLRIR').AsFloat               := fVLRIR;
    QryInsetOperacaoInvest.ParamByName('VLRREMUNERACAO').AsFloat      := fVLRREMUNERACAO;
    QryInsetOperacaoInvest.ParamByName('VLRIRREMUNER').AsFloat        := fVLRIRREMUNER;
    QryInsetOperacaoInvest.ParamByName('PERCENTUAL').AsFloat          := fPERCCUSTO;
    If Trim(sORIGDEST) <> '' Then
       QryInsetOperacaoInvest.ParamByName('ORIGDEST').AsString        := sORIGDEST;
    // AL_3 - 15/07/2004 - Turon
    if iOperCustodia <> -1 then
       QryInsetOperacaoInvest.ParamByName('IDOPERCUSTODIA').AsInteger := iOperCustodia;
    QryInsetOperacaoInvest.ExecSQL;
end;

Procedure TfrmCadOperAGENovo.FazerProcurarCadAGE(TipoOperacao, OperacaoDireito  : LongInt;
                                                 DataEX                         : TDateTime;
                                                 SiglaEmissor, DescTipoOperacao : String;
                                                 bForm, bProv                   : Boolean);
begin
   bProvisiona                 := bProv;
   bVerFormAge                 := bForm;

   sbtnProcurar.Enabled        := False;

   pnlDestino.Visible          := False;

   dbgOrigemSub.Visible            := False;
   dbgDestinoSub.Visible           := False;
   dbgOrigemDirJur.Visible         := False;
   dbgOrigemIncPerAlt.Visible      := False;
   dbgDestinoIncPerAlt.Visible     := False;
   dbgOrigemGrupamento.Visible     := False;
   dbgDestinoGrupamento.Visible    := False;
   dbgOrigemDesdobramento.Visible  := False;
   dbgDestinoDesdobramento.Visible := False;
   dbgOrigemRestCap.Visible        := False;
   dbgDestinoRestCap.Visible       := False;

   //AL_3
   iTipoOperacao      := TipoOperacao;
   iIdOperacaoDireito := OperacaoDireito;
   if iTipoOperacao  In [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR, pRPI.IDTIPOOPERDIRMUL] then
   begin
      dbgOrigemDirJur.Visible := True;

      dbgOrigemDirJur.BringToFront;

      AbreQueryOrigem(QryOrigemDivJur, Qry, DataEX, False, False);
   end
   //AL_11 - RICARDO - 08/12/2004
   else if iTipoOperacao  In [pRPI.IDTIPOOPERDIRSUB, pRPI.IDTIPOOPERDIRDSU] then   
   begin
      pnlDestino.Visible     := True;
      dbgOrigemSub.Visible   := True;
      dbgDestinoSub.Visible  := True;

      dbgOrigemSub.BringToFront;
      dbgDestinoSub.BringToFront;

      dblAcao.DataSource        := DsDestinoSub;
      dblCarteira.DataSource    := DsDestinoSub;
      dblCustodiante.DataSource := DsDestinoSub;
      dblBloqueio.DataSource    := DsDestinoSub;

      AbreQueryOrigem(QryOrigemSub, QryDestinoSub, DataEX, False, False);

      dblAcao.Enabled        := False;
      dblCarteira.Enabled    := False;
      dblCustodiante.Enabled := False;
      dblBloqueio.Enabled    := False;
   end
   else if iTipoOperacao In [pRPI.IDTIPOOPERDIRINC, pRPI.IDTIPOOPERDIRPER, pRPI.IDTIPOOPERDIRALT] then
   begin
      pnlDestino.Visible          := True;
      dbgOrigemIncPerAlt.Visible  := True;
      dbgDestinoIncPerAlt.Visible := True;

      dbgOrigemIncPerAlt.BringToFront;
      dbgDestinoIncPerAlt.BringToFront;

      dblAcao.DataSource          := DsDestinoIncPerAlt;
      dblCarteira.DataSource      := DsDestinoIncPerAlt;
      dblCustodiante.DataSource   := DsDestinoIncPerAlt;
      dblBloqueio.DataSource      := DsDestinoIncPerAlt;

      AbreQueryOrigem(QryOrigemIncPerAlt, QryDestinoIncPerAlt, DataEX, False, False);

      dblAcao.Enabled        := False;
      dblCarteira.Enabled    := False;
      dblCustodiante.Enabled := False;
      dblBloqueio.Enabled    := False;
   end
   else if iTipoOperacao = pRPI.IDTIPOOPERDIRGRU then
   begin
      pnlDestino.Visible          := True;
      dbgOrigemGrupamento.Visible := True;
      dbgDestinoGrupamento.Visible:= True;

      dbgOrigemGrupamento.BringToFront;
      dbgDestinoGrupamento.BringToFront;

      dblAcao.DataSource          := DsDestinoGrupamento;
      dblCarteira.DataSource      := DsDestinoGrupamento;
      dblCustodiante.DataSource   := DsDestinoGrupamento;
      dblBloqueio.DataSource      := DsDestinoGrupamento;

      AbreQueryOrigem(QryOrigemGrupamento, QryDestinoGrupamento, DataEX, False, False);

      dblAcao.Enabled             := False;
      dblCarteira.Enabled         := False;
      dblCustodiante.Enabled      := False;
      dblBloqueio.Enabled         := False;
   end
   else if iTipoOperacao = pRPI.IDTIPOOPERDIRDES then
   begin
      pnlDestino.Visible          := True;
      dbgOrigemDesdobramento.Visible  := True;
      dbgDestinoDesdobramento.Visible := True;

      dbgOrigemDesdobramento.BringToFront;
      dbgDestinoDesdobramento.BringToFront;

      dblAcao.DataSource          := DsDestinoDesdobramento;
      dblCarteira.DataSource      := DsDestinoDesdobramento;
      dblCustodiante.DataSource   := DsDestinoDesdobramento;
      dblBloqueio.DataSource      := DsDestinoDesdobramento;

      AbreQueryOrigem(QryOrigemDesdobramento, QryDestinoDesdobramento, DataEX,False, False);

      dblAcao.Enabled             := False;
      dblCarteira.Enabled         := False;
      dblCustodiante.Enabled      := False;
      dblBloqueio.Enabled         := False;
   end
   else if iTipoOperacao = pRPI.IDTIPOOPERDIRRES then
   begin
      pnlDestino.Visible          := True;
      dbgOrigemRestCap.Visible    := True;
      dbgDestinoRestCap.Visible   := True;

      dbgOrigemRestCap.BringToFront;
      dbgDestinoRestCap.BringToFront;

      dblAcao.DataSource          := DsDestinoRestCap;
      dblCarteira.DataSource      := DsDestinoRestCap;
      dblCustodiante.DataSource   := DsDestinoRestCap;
      dblBloqueio.DataSource      := DsDestinoRestCap;

      AbreQueryOrigem(QryOrigemRestCap, QryDestinoRestCap, DataEX, False, False);

      dblAcao.Enabled             := False;
      dblCarteira.Enabled         := False;
      dblCustodiante.Enabled      := False;
      dblBloqueio.Enabled         := False;
   end;

   lblDataEfetiva.Visible    := True;
   edtDataEfetiva.Visible    := True;
   lblDataAGE.Visible        := True;
   lblSigla.Visible          := True;
   lblTipoOperacao.Visible   := True;

   lblDataAGE.Caption        := DateToStr(DataEX);
   lblSigla.Caption          := SiglaEmissor;
   lblTipoOperacao.Caption   := DescTipoOperacao;

   If Not bForm Then
   Begin
      bbtnCancelar.Enabled := False;
      bbtnSair.Enabled     := False;
   End;

   bbtnSair.Enabled        := True;
end;

procedure TfrmCadOperAGENovo.QryOrigemDivJurQTDEDIREITOSetText(Sender: TField;
                                                               const Text: String);
var
   eIRExercido : Double;
   i           : Integer;
   sValor      : String;
begin
  inherited;

    eIRExercido := 0;

    For i := 1 To Length(Text) Do
    Begin
       If Copy(Text,i,1) <> '.' Then
          sValor := sValor + Copy(Text,i,1);
    End;

    QryOrigemDivJur.FieldByName('QTDEDIREITO').AsFloat    := StrToFloat(sValor);
    //Al_35 - Ricardo - 26/04/2005
    QryOrigemDivJur.FieldByName('VALOREXERCIDO').ReadOnly := False;
    QryOrigemDivJur.FieldByName('VALOREXERCIDO').AsFloat  := OperComum.Round(
      (QryOrigemDivJur.FieldByName('QTDEDIREITO').AsFloat *
          OperComum.DivValorZero(Reg.DIVPORACAO,
                      QryLote.FieldByName('QTDELOTE').AsInteger))-0.0049,2)+
                      QryOrigemDivJur.FieldByName('VLRREMUNERACAO').AsFloat;

    fVlrRendimento := 0;
    if QryOperacaoDireito.FieldByName('ISENCAOIR').AsString = 'N' then
       eIRExercido := Impostos.CalculaIr(0,
                                QryOrigemDivJur.FieldByName('IDINVESTIMENTO').AsInteger,
                                0{CARTEIRAGERENC},
                                QryOrigemDivJur.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                QryOperacaoDireito.FieldByName('IDTIPOOPERACAO').AsInteger,
                                Reg.IDMERCADO,
                                QryOrigemDivJur.FieldByName('IDLOTE').AsString,
                                Date, Date,
                                0,
                                QryOrigemDivJur.FieldByName('VALOREXERCIDO').AsFloat, 0, 'S',
                                Reg.FLGTRATAIR,fVlrRendimento);

    eIRExercido   := eIRExercido + QryOrigemDivJur.FieldByName('VLRREMUNERACAO').AsFloat;

    QryOperacaoInvestDestino.Close;

    //Al_33 - Ricardo - 26/04/2005    
    QryOrigemDivJur.FieldByName('IR').ReadOnly             := False;
    QryOrigemDivJur.FieldByName('IR').AsFloat              := eIRExercido;
    if QryOperacaoDireito.FieldByName('IRLITIGIO').AsString = 'S' then
       QryOrigemDivJur.FieldByName('VLRLIQ').AsFloat       :=
                       QryOrigemDivJur.FieldByName('VALOREXERCIDO').AsFloat
    else
       QryOrigemDivJur.FieldByName('VLRLIQ').AsFloat       :=
                       QryOrigemDivJur.FieldByName('VALOREXERCIDO').AsFloat-eIRExercido;    
    //Al_36 - Ricardo - 26/04/2005

    //Al_29 - Ricardo - 05/04/2005
    QryOrigemDivJurVALOREXERCIDOSetText(Sender,QryOrigemDivJur.FieldByName('VALOREXERCIDO').AsString);
    QryOrigemDivJurVLRREMUNERACAOSetText(Sender,QryOrigemDivJur.FieldByName('VLRREMUNERACAO').AsString);
    //Al_37 - Ricardo - 26/04/2005
    QryOrigemDivJurIRSetText(Sender,QryOrigemDivJur.FieldByName('IR').AsString);
    //Al_37 - Fim
    QryOrigemDivJurVLRLIQSetText(Sender, QryOrigemDivJur.FieldByName('VLRLIQ').AsString);

    //Al_33 - Ricardo - 26/04/2005
    QryOrigemDivJur.FieldByName('VALOREXERCIDO').ReadOnly  := False;
    QryOrigemDivJur.FieldByName('VLRREMUNERACAO').ReadOnly := False;
    QryOrigemDivJur.FieldByName('IR').ReadOnly             := False;    
    QryOrigemDivJur.FieldByName('VLRLIQ').ReadOnly         := False;
end;

procedure TfrmCadOperAGENovo.QryOrigemDivJurVLRREMUNERACAOSetText(Sender: TField;
                                                                  const Text: String);
Var
  eValorExercido, eRemuneracao, eIRRemuneracao, eIRExercido : Extended;
  sTrataIR : string;
begin
   if bbtnConfirmar.Enabled then
   begin
      eRemuneracao   := StrToFloat(OperComum.StripChar(Text, '.'));
      eValorExercido := QryOrigemDivJur.FieldByName('VALOREXERCIDO').AsFloat; 

      //Al_33 - Ricardo - 26/04/2005
      QryOrigemDivJur.FieldByName('IR').ReadOnly               := False;
      QryOrigemDivJur.FieldByName('VLRLIQ').ReadOnly           := False;
      QryOrigemDivJur.FieldByName('VALOREXERCIDO').ReadOnly    := False;
      QryOrigemDivJur.FieldByName('VLRREMUNERACAO').ReadOnly   := False;      

      QryOrigemDivJur.FieldByName('VLRREMUNERACAO').AsFloat    := eRemuneracao;
      
      eIRRemuneracao := 0;
      //Recalculo o IR em caso de valores alterados
      fVlrRendimento := 0;
      eIRExercido := Impostos.CalculaIr(0,
                         QryOrigemDivJur.FieldByName('IDINVESTIMENTO').AsInteger,
                         0{CARTEIRAGERENC},
                         QryOrigemDivJur.FieldByName('IDCARTEIRAINVEST').AsInteger,
                         QryOperacaoDireito.FieldByName('IDTIPOOPERACAO').AsInteger,
                         Reg.IDMERCADO,
                         QryOrigemDivJur.FieldByName('IDLOTE').AsString,
                         Date, Date,
                         0,
                         eValorExercido, 0, 'S',
                         Reg.FLGTRATAIR,fVlrRendimento);
      // Calculo do IR sobre Remuneração (Sempre)
      fVlrRendimento := 0;
      eIRRemuneracao :=  Impostos.CalculaIr(1,
                             QryOrigemDivJur.FieldByName('IDINVESTIMENTO').AsInteger,
                             0{CARTEIRAGERENC},
                             QryOrigemDivJur.FieldByName('IDCARTEIRAINVEST').AsInteger,
                             0,
                             0,
                             QryOrigemDivJur.FieldByName('IDLOTE').AsString,
                             Date, Date,
                             0,
                             eRemuneracao, 0, 'S',
                             Reg.FLGTRATAIR,fVlrRendimento);      

      //Al_38 - Ricardo - 26/04/2005
      QryOrigemDivJur.FieldByName('IR').AsFloat               := eIRExercido + eIRRemuneracao;
      if QryOperacaoDireito.FieldByName('IRLITIGIO').AsString  = 'S' then
      begin
         QryOrigemDivJur.FieldByName('VALOREXERCIDO').AsFloat := (eRemuneracao + eValorExercido);
         QryOrigemDivJur.FieldByName('VLRLIQ').AsFloat        := (eRemuneracao + eValorExercido);
      end
      else
      begin
         QryOrigemDivJur.FieldByName('VALOREXERCIDO').AsFloat := (eRemuneracao + eValorExercido);
         QryOrigemDivJur.FieldByName('VLRLIQ').AsFloat        := (eRemuneracao + eValorExercido) - QryOrigemDivJur.FieldByName('IR').AsFloat;
      end;
      QryOrigemDivJur.FieldByName('VLRIRREMUNERACAO').AsFloat := eIRRemuneracao;
      //Al_38 - Fim

      //Al_37 - Ricardo - 05/04/2005
      QryOrigemDivJurIRSetText(Sender, QryOrigemDivJur.FieldByName('IR').AsString);
      QryOrigemDivJurVLRLIQSetText(Sender, QryOrigemDivJur.FieldByName('VLRLIQ').AsString);
      //Al_37 - Fim

   end;
end;

procedure TfrmCadOperAGENovo.FormCreate(Sender: TObject);
begin
  inherited;
  lblSigla.Caption        := '';
  LblBoleta.Caption       := '';
  lblDataAGE.Caption      := '';
  lblTipoOperacao.Caption := '';
end;

procedure TfrmCadOperAGENovo.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

   if DtmBaseDados.dbBaseDados.InTransaction then
      DtmBaseDados.dbBaseDados.Rollback;

   bTrocaLine := True;      

   if Not bSair Then
   begin
     QryOrigemDivJur.Close;
     QryOrigemSub.Close;
     QryDestinoSub.Close;
     QryOrigemIncPerAlt.Close;
     QryDestinoIncPerAlt.Close;

     pnlDestino.Visible              := False;

     dbgOrigemSub.Visible            := False;
     dbgDestinoSub.Visible           := False;
     dbgOrigemDirJur.Visible         := False;
     dbgOrigemIncPerAlt.Visible      := False;
     dbgDestinoIncPerAlt.Visible     := False;
     dbgOrigemGrupamento.Visible     := False;
     dbgDestinoGrupamento.Visible    := False;
     dbgOrigemDesdobramento.Visible  := False;
     dbgDestinoDesdobramento.Visible := False;
     dbgOrigemRestCap.Visible        := False;
     dbgDestinoRestCap.Visible       := False;

     if iTipoOperacao  In [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR, pRPI.IDTIPOOPERDIRMUL] then
     begin
        dbgOrigemDirJur.Visible      := True;
        dbgOrigemDirJur.BringToFront;

        AbreQueryOrigem(QryOrigemDivJur, Qry, StrToDate(lblDataAGE.Caption), False, False);
     end
     //AL_11 - RICARDO - 08/12/2004     
     else if iTipoOperacao  In [pRPI.IDTIPOOPERDIRSUB, pRPI.IDTIPOOPERDIRDSU] then
     begin
        pnlDestino.Visible     := True;
        dbgOrigemSub.Visible   := True;
        dbgDestinoSub.Visible  := True;

        dbgOrigemSub.BringToFront;
        dbgDestinoSub.BringToFront;

        dblAcao.DataSource        := DsDestinoSub;
        dblCarteira.DataSource    := DsDestinoSub;
        dblCustodiante.DataSource := DsDestinoSub;
        dblBloqueio.DataSource    := DsDestinoSub;

        AbreQueryOrigem(QryOrigemSub, QryDestinoSub, StrToDate(lblDataAGE.Caption), False, False);

        BtOkDet.Enabled      := False;
        BtCancDet.Enabled    := False;
        BtVoltaDet.Enabled   := False;
     end
     else if iTipoOperacao In [pRPI.IDTIPOOPERDIRINC, pRPI.IDTIPOOPERDIRPER, pRPI.IDTIPOOPERDIRALT] then
     begin
        pnlDestino.Visible          := True;
        dbgOrigemIncPerAlt.Visible  := True;
        dbgDestinoIncPerAlt.Visible := True;

        dbgOrigemIncPerAlt.BringToFront;
        dbgDestinoIncPerAlt.BringToFront;

        dblAcao.DataSource          := DsDestinoIncPerAlt;
        dblCarteira.DataSource      := DsDestinoIncPerAlt;
        dblCustodiante.DataSource   := DsDestinoIncPerAlt;
        dblBloqueio.DataSource      := DsDestinoIncPerAlt;

        AbreQueryOrigem(QryOrigemIncPerAlt, QryDestinoIncPerAlt,
                        StrToDate(lblDataAGE.Caption), False, False);

        dblAcao.Enabled        := False;
        dblCarteira.Enabled    := False;
        dblCustodiante.Enabled := False;
        dblBloqueio.Enabled    := False;
     end
     else if iTipoOperacao = pRPI.IDTIPOOPERDIRGRU then
     begin
        pnlDestino.Visible           := True;
        dbgOrigemGrupamento.Visible  := True;
        dbgDestinoGrupamento.Visible := True;

        dbgOrigemGrupamento.BringToFront;
        dbgDestinoGrupamento.BringToFront;

        dblAcao.DataSource        := DsDestinoGrupamento;
        dblCarteira.DataSource    := DsDestinoGrupamento;
        dblCustodiante.DataSource := DsDestinoGrupamento;
        dblBloqueio.DataSource    := DsDestinoGrupamento;

        AbreQueryOrigem(QryOrigemGrupamento, QryDestinoGrupamento,
                        StrToDate(lblDataAGE.Caption), False, False);

        dblAcao.Enabled        := False;
        dblCarteira.Enabled    := False;
        dblCustodiante.Enabled := False;
        dblBloqueio.Enabled    := False;
     end
     else if iTipoOperacao = pRPI.IDTIPOOPERDIRDES then
     begin
        pnlDestino.Visible              := True;
        dbgOrigemDesdobramento.Visible  := True;
        dbgDestinoDesdobramento.Visible := True;

        dbgOrigemDesdobramento.BringToFront;
        dbgDestinoDesdobramento.BringToFront;

        dblAcao.DataSource          := DsDestinoDesdobramento;
        dblCarteira.DataSource      := DsDestinoDesdobramento;
        dblCustodiante.DataSource   := DsDestinoDesdobramento;
        dblBloqueio.DataSource      := DsDestinoDesdobramento;

        AbreQueryOrigem(QryOrigemDesdobramento, QryDestinoDesdobramento,
                        StrToDate(lblDataAGE.Caption), False, False);

        dblAcao.Enabled             := False;
        dblCarteira.Enabled         := False;
        dblCustodiante.Enabled      := False;
        dblBloqueio.Enabled         := False;
     end
     else if iTipoOperacao = pRPI.IDTIPOOPERDIRRES then
     begin
        pnlDestino.Visible          := True;
        dbgOrigemRestCap.Visible    := True;
        dbgDestinoRestCap.Visible   := True;

        dbgOrigemRestCap.BringToFront;
        dbgDestinoRestCap.BringToFront;

        dblAcao.DataSource          := DsDestinoRestCap;
        dblCarteira.DataSource      := DsDestinoRestCap;
        dblCustodiante.DataSource   := DsDestinoRestCap;
        dblBloqueio.DataSource      := DsDestinoRestCap;

        AbreQueryOrigem(QryOrigemRestCap, QryDestinoRestCap,
                        StrToDate(lblDataAGE.Caption), False, False);

        dblAcao.Enabled             := False;
        dblCarteira.Enabled         := False;
        dblCustodiante.Enabled      := False;
        dblBloqueio.Enabled         := False;
     end;
   end;

   bbtnCancelar.Enabled  := True;
   bbtnConfirmar.Enabled := True;

   PnlFundo.Enabled      := True;

end;

procedure TfrmCadOperAGENovo.FormShow(Sender: TObject);
begin
  inherited;
   bVerFormAge := False;
   bSair       := False;
   bTrocaLine  := True;
  // Seta teomporariamente a propriedade para False
  bProvisiona  := False;
end;

function TfrmCadOperAGENovo.VerificaParamInvest : boolean;
begin
   Result := true;
   if pRPI.IDTIPOOPERDIRDIV = 0 then
   begin
      MsgDlg('Parâmetro não definido '#13+'para Tipo de Operação de Direito ( Dividendos )!','Mensagem do Sistema',MtWarning,[mbOk],0);
      Result := False;
   end
   else if pRPI.IDTIPOOPERDIRJUR = 0 then
   begin
      MsgDlg('Parâmetro não definido '#13+'para Tipo de Operação de Direito ( Juros de Capital )!','Mensagem do Sistema',MtWarning,[mbOk],0);
      Result := False;
   end;
end;

Function TfrmCadOperAGENovo.ProcuraCampoPeloNome(Grid : TwwDbGrid; NomeCampo : String) : Integer;
Var
  I : Integer;
begin
  result := -1;
  For I := 0 To Pred(Grid.FieldCount) Do
    If Grid.Fields[I].FieldName = NomeCampo Then
    Begin
       result := I;
       Break;
    End;
end;

{Incrementa fornecedor, bolsa de valores, boleta, data de vencimento}
procedure TfrmCadOperAGENovo.FornecedorCli(wIdCustodiante                 : Integer;
                                           Var wIdForCli, wIdBolsaValores : Integer;
                                           Var wDataVenc : TDateTime);
begin
   // Se Tipo de Credor for CUSTODIANTE
   if (QryBuscaTipoOper.FieldByName('TIPCREDOR').AsString = 'CT') then
   begin
      // Transforma Custodiante em Fornecedor - Cliente
      try
         if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'R' then
            Documento.ForCli.Inserir(wIdCustodiante,  Sistema.IdEmpresa,-1, 0,
                                     pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                     '','','','','C',False) // Cliente
         else if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'P' then
            Documento.ForCli.Inserir(wIdCustodiante, Sistema.IdEmpresa, -1, 0,
                                     pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                     '','','','','F',False); // Fornecedor
      Except  // Função gerava um Abort quando o Fornecedor
      End;    // já estava cadastrado

      wIdForCli := wIdCustodiante;

      QryBuscaBolsaValores.Close;
      QryBuscaBolsaValores.ParamByName('IDCUSTODIANTE').AsInteger := wIdForCli;
      QryBuscaBolsaValores.Open;
      //AL_3 - Ricardo - 05/10/2004
      if QryBuscaBolsaValores.IsEmpty then
      begin
         qryAcoesxBolsa.Close;
         qryAcoesxBolsa.ParamByName('IDINVESTIMENTO').AsInteger :=
                        QryBuscaInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
         qryAcoesxBolsa.Open;
         If Not qryAcoesxBolsa.IsEmpty then
            wIdBolsaValores := qryAcoesxBolsa.FieldByName('IDBOLSAVALORES').AsInteger;
         qryAcoesxBolsa.Close;
      end
      else
         wIdBolsaValores    := QryBuscaBolsaValores.FieldByName('IDBOLSAVALORES').AsInteger;

      If wIdBolsaValores     = 0 then
         wIdBolsaValores    := pRPI.IDBVSP;

      QryBuscaBolsaValores.Close;

   // Se Tipo de Credor for EMISSOR
   end
   else
   begin
      // Transforma Emissor em Fornecedor - Cliente
      try
         if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'R' then
            Documento.ForCli.Inserir(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                     Sistema.IdEmpresa,-1,0,12,Sistema.IdEmpresa,
                                     '','','','','C',False) // Cliente
         else if QryBuscaTipoOper.FieldByName('RECPAG').AsString = 'P' then
            Documento.ForCli.Inserir(QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger,
                                     Sistema.IdEmpresa,0,0,12,Sistema.IdEmpresa,
                                     '','','','','F',False); // Fornecedor
      Except  // Função gerava um Abort quando o Fornecedor
      End;    // já estava cadastrado

      wIdForCli       := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;

      wIdBolsaValores := QryBuscaInvestimento.FieldByName('IDBOLSAVALORES').AsInteger;
   end;

   wDataVenc   :=  edtDataEfetiva.Date+QryBuscaTipoOper.FieldByName('VENCIMENTO').AsInteger;
   While not DiasUteisInv.DiaUtil(wDataVenc,-1,1,'',True,False,False) Do
      wDataVenc := wDataVenc+1;   // Achar o próximo dia útils

end;

//AL_8 - Ricardo - 25/10/2004
// Função que processa Dividendos e Juros de Capital
{ Dependendo da Propriedade Provisiona, efetua a operação ou não, fazendo somente a
  provisão contábil do dividendo. }
function TfrmCadOperAGENovo.ProcDivJurCap : boolean;
Var
   wDataAge, wDataVenc          : TDateTime;

   sHistorico, sCapCar, wNumDoc : String;

   wVlrUtilizar, wVlrProporcao, wVlrTotOperDif, wVlrIRProv, wVlrIR, wVlrOperacao,
   wVlrTotOperacao : Currency;

   wIdNovaOperacao, wIdForCli, wIdBolsaValores, wIdOperCust, wPlano, wPlanilha,
   iTipoOperacaoCtb, wDocumCont, wTipoOperUtilizar, wCarteira, wCustodiante  : Integer;
   wPuIrProv, wPuProporcinal, wPuProporcinalCTB, wQtdTotOperacao, wQtdDireito, wQtdOper : Double;
begin
   Result          := True;

   wDataAge        := StrToDate(lblDataAGE.Caption);

   wVlrIR          := 0;
   wVlrIRProv      := 0;
   wPuProporcinal  := 0;
   wPuIrProv       := 0;
   wQtdDireito     := 0;
   wVlrTotOperDif  := 0;
   wVlrTotOperacao := 0;
   wPuProporcinalCTB := 0;

   wIdNovaOperacao := 0;

   try
      LblBoleta.Caption := wNumDoc;
      LblBoleta.Repaint;

      QryOrigemDivJur.First;
      While Not QryOrigemDivJur.Eof Do
      begin
         //AL_2
         if QryOrigemDivJur.FieldByName('QTDEDIREITO').AsFloat = 0 then
         begin
            QryOrigemDivJur.Delete;
            QryOrigemDivJur.Next;
            Continue;
         end;

         wVlrTotOperacao := wVlrTotOperacao + QryOrigemDivJur.FieldByName('VLRLIQ').AsFloat;
         //AL_12 - Ricardo - 08/12/2004
         wQtdTotOperacao := wQtdTotOperacao + QryOrigemDivJur.FieldByName('QTDE').AsFloat;

         QryOrigemDivJur.Next;
      end;

      QryBuscaFundo.Close;
      QryBuscaFundo.ParamByName('IDPEDIDOFUNDO').AsInteger :=
                    QryOperacaoDireito.FieldByName('IDPEDIDOFUNDO').AsInteger;
      QryBuscaFundo.Open;

      QryOrigemDivJur.First;
      //Al_7 - RICARDO - 20/10/2004
      OperComum.LimpaParametros(QryBuscaInvestimento);
      QryBuscaInvestimento.ParamByName('IDINVESTIMENTO').AsInteger :=
                           QryOrigemDivJur.FieldByName('IDINVESTIMENTO').AsInteger;
      QryBuscaInvestimento.Open;

      wPuIrProv := OperComum.DivValorZero(wSaldoIRApu,wSaldoQtd);

      while not QryOrigemDivJur.EOF do   // Percorre query Origem - Para Dividendo pode ser mais de 1
      begin
         If iTipoOperacao <> QryBuscaTipoOper.fieldbyname('IDTIPOOPERACAO').AsInteger Then
            iTipoOperacao := QryBuscaTipoOper.fieldbyname('IDTIPOOPERACAO').AsInteger;
         wNumDoc   := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                         LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));

         // Gera Novo Id de Operacao
         wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

         // Inicia outros Dados
         FornecedorCli(QryOrigemDivJur.FieldByName('IDCUSTODIANTE').AsInteger,
                       wIdForCli, wIdBolsaValores, wDataVenc);

         If (wCarteira    <> QryOrigemDivJur.FieldByName('IDCARTEIRAINVEST').AsInteger) Or
            (wCustodiante <> QryOrigemDivJur.FieldByName('IDCUSTODIANTE').AsInteger) Then
            BuscaSaldo(QryOrigemDivJur.FieldByName('IDCARTEIRAINVEST').AsInteger,
                       0,
                       QryOrigemDivJur.FieldByName('IDINVESTIMENTO').AsInteger,
                       QryOrigemDivJur.FieldByName('IDLOTE').AsString,
                       wDataAGE,
                       QryOrigemDivJur.FieldByName('IDCUSTODIANTE').AsInteger);

         if not bProvisiona then
         begin
            wVlrIR       := QryOrigemDivJur.FieldByName('IR').AsFloat ;
            wVlrIRProv   := 0;

            dDataAGEProv := edtDataEfetiva.Date;
            sCapCar      := 'S';

            //AL_41 - Ricardo - 04/05/2005
            //ricardo verificar //25/10/2004 ATENCAO
            // Faz por diferença
{            If QryOrigemDivJur.FieldByName('VALOREXERCIDO').AsFloat = 0 Then
            begin
               wVlrTotOperDif   := wVlrTotOperacao;
               sHistorico       := 'RECEBIMENTO / ';
               iTipoOperacao    := -70;  //Anuncio de Proventos
            end
            Else If wVlrTotOperacao <> 0 Then
            begin
               wVlrTotOperDif   := wVlrTotOperacao-wVlrTotOperacaoAnt;
               if wVlrTotOperDif <> 0 then
               begin
                  sHistorico    := 'RECEBIMENTO / ';
                  iTipoOperacao := -70;  //Anuncio de Proventos
               end;
            end;}
            iTipoOperacaoCtb    := -70;
            If ABS(QryBuscaTipoOper.fieldbyname('IDTIPOOPERACAO').AsInteger) > 10000 Then
               iTipoOperacaoCtb := -10070;

            OperComum.LimpaParametros(QryBuscaAnuncio);
            QryBuscaAnuncio.ParamByName('IDTIPOOPERACAO').AsInteger    := iTipoOperacaoCtb;
            QryBuscaAnuncio.ParamByName('IDOPERACAODIREITO').AsInteger := iIdOperacaoDireito;
            QryBuscaAnuncio.ParamByName('IDCARTEIRAINVEST').AsInteger  :=
                            QryOrigemDivJur.FieldByName('IDCARTEIRAINVEST').AsInteger;
            QryBuscaAnuncio.ParamByName('DATAOPERACAO').AsString       :=
                            QryOperacaoDireito.FieldByName('DATAOPER').AsString;
            QryBuscaAnuncio.Open;

            wVlrTotOperDif := 0;
            If Not QryBuscaAnuncio.IsEmpty then
               wVlrTotOperDif := wVlrTotOperacao-
                       QryBuscaAnuncio.FieldByName('VLROPERACAO').AsFloat;
            QryBuscaAnuncio.Close;

            if wVlrTotOperDif <> 0 then
            begin
               sHistorico       := 'RECEBIMENTO / ';
               iTipoOperacao    := iTipoOperacaoCtb;  //Anuncio de Proventos
            end;
            //AL_41 - Fim
         end
         Else
         begin
            sHistorico        := 'ANUNCIO DE PROVENTOS / ';
            sCapCar           := 'N';
            wVlrTotOperDif    := QryOrigemDivJur.FieldByName('VLRLIQ').AsFloat;
            iTipoOperacao     := -70;
         end;

         //Al_22 - Ricardo - 18/01/2005
         //AL_16 - Ricardo - 22/12/2004
         If  (wQtdOper     = 0) Or
             (wCarteira    <> QryOrigemDivJur.FieldByName('IDCARTEIRAINVEST').AsInteger) Or
             (wCustodiante <> QryOrigemDivJur.FieldByName('IDCUSTODIANTE').AsInteger) Then
             wQtdOper     := QryOrigemDivJur.FieldByName('QTDEDIREITO').AsFloat;

         If  (wVlrOperacao = 0) Or
             (wCarteira    <> QryOrigemDivJur.FieldByName('IDCARTEIRAINVEST').AsInteger) Or
             (wCustodiante <> QryOrigemDivJur.FieldByName('IDCUSTODIANTE').AsInteger) Then
             wVlrOperacao := QryOrigemDivJur.FieldByName('VLRLIQ').AsFloat;

         //Proporciona o Pu
         If  (wPuProporcinal = 0) Or
             (wCarteira    <> QryOrigemDivJur.FieldByName('IDCARTEIRAINVEST').AsInteger) Or
             (wCustodiante <> QryOrigemDivJur.FieldByName('IDCUSTODIANTE').AsInteger) Then
             wPuProporcinal := OperComum.DivValorZero(wVlrOperacao,wQtdOper);

         //Al_26 - Ricardo -- 17/03/2005
         //Proporciona o valor a contabilizar
         If  (wPuProporcinalCTB = 0) Or
             (wCarteira    <> QryOrigemDivJur.FieldByName('IDCARTEIRAINVEST').AsInteger) Or
             (wCustodiante <> QryOrigemDivJur.FieldByName('IDCUSTODIANTE').AsInteger) Then
             wPuProporcinalCTB := OperComum.DivValorZero(wVlrTotOperDif,wQtdOper);
         //Al_26 - Fim
         //AL_16 - Fim
         //Al_22 - Fim

         If ((wDataAGE >= pRPI.DTMUDACPMF)  And
             ((wSaldoQtd - wSdoQtdCPMF) > 0) And
            ((QryOperacaoDireito.FieldByName('FLGTIPODIREITO').AsString = 'P') Or
             (QryOperacaoDireito.FieldByName('FLGTIPODIREITO').AsString = 'N'))) Then //Parcial
         begin
            wQtdDireito  := (wSaldoQtd - wSdoQtdCPMF) - wQtdOper;

            If wQtdDireito  < 0 Then
            begin
               wQtdDireito  := (wSaldoQtd - wSdoQtdCPMF);
               wSaldoQtd    :=  wSaldoQtd - wQtdDireito;
               wQtdOper     :=  wQtdOper  - wQtdDireito;
               //AL_26 - Ricardo - 15/03/2005
               If wSaldoQtd < wQtdOper Then
               begin
                  wQtdDireito := wQtdDireito + wSaldoQtd;
                  wQtdOper    := wQtdOper - wSaldoQtd;
                  wSaldoQtd   := 0;
               end;
            end
            Else
            begin
               //Al_21 - Ricardo - 05/01/2005
               wQtdDireito  := wQtdOper;
               wQtdOper     := 0;
               wSaldoQtd    := 0;
            end;

            //Tipo de operacao a se utilizado
            If iTipoOperacao < 0 Then
               wTipoOperUtilizar := iTipoOperacao - 10000
            Else
               wTipoOperUtilizar := iTipoOperacao + 10000;
         end
         else
         begin

            wTipoOperUtilizar := iTipoOperacao;

            wQtdDireito  := wQtdOper;
            wSdoQtdCPMF  := wSdoQtdCPMF - wQtdOper;
            wQtdOper     := 0;
            If wSdoQtdCPMF  < 0 Then
            begin
               MsgDlg('Não há Saldo para essa operação. Parametrize corretamente.',
                      'Mensagem do Sistema ',mtWarning,[mbOK],0);
               Result := False;
               Exit;
            end;
         end;

         wVlrUtilizar  := OperComum.Round((wQtdDireito*wPuProporcinal),2);

         //Al_26 - Ricardo - 17/03/2005
         if not bProvisiona then
         begin
            if (wVlrTotOperDif <> 0) And (wPuProporcinalCTB <> 0) then
                wVlrTotOperDif := OperComum.Round((wQtdDireito*wPuProporcinalCTB),2);

           //Al_27 - Ricardo - 04/04/2005
            if wVlrTotOperDif = 0 then
            begin
               if ABS(wTipoOperUtilizar) > 10000 then
                  wTipoOperUtilizar := QryBuscaTipoOper.fieldbyname('IDTIPOOPERACAO').AsInteger + 10000
               else
                  wTipoOperUtilizar := QryBuscaTipoOper.fieldbyname('IDTIPOOPERACAO').AsInteger;
            end;
         end
         Else
            wVlrTotOperDif    := wVlrUtilizar;
         //Al_26 - Fim

         // Verifica se existe provisionamento de IR
         if Impostos.BuscaProvisaoIR(2,QryBuscaInvestimento.FieldByName('IDINVESTIMENTO').AsInteger) then
            wVlrIRProv := OperComum.Round((wPuIrProv * wQtdDireito )* -1,2);

         GravaOperacaoInvest(wIdNovaOperacao,
                             QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                             Sistema.IdModulo, Sistema.IdEmpresa,
                             QryOrigemDivJur.FieldByName('IDINVESTIMENTO').AsInteger,
                             QryOrigemDivJur.FieldByName('IDCARTEIRAINVEST').AsInteger, 2,
                             wTipoOperUtilizar,
                             wIdForCli,
                             QryOrigemDivJur.FieldByName('IDCUSTODIANTE').AsInteger,
                             iIdOperacaoDireito,
                             0{IDCARTEIRAGERENC},
                             dDataAGEProv,
                             wDataVenc,
                             wNumDoc,'F','L',
                             QryOrigemDivJur.FieldByName('IDLOTE').AsString,
                             wQtdDireito,
                             Reg.DIVPORACAO,
                             wVlrUtilizar, wVlrIR,
                             QryOrigemDivJur.FieldByName('VLRREMUNERACAO').AsFloat,
                             QryOrigemDivJur.FieldByName('VLRIRREMUNERACAO').AsFloat,0,'');

         // Inclui Dados na Tabela de SubTipo, OPRACAO
         QryInsertOprAcao.Close;
         QryInsertOprAcao.ParamByName('IDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
         QryInsertOprAcao.ParamByName('IDBOLSAVALORES').AsInteger   := wIdBolsaValores;
         QryInsertOprAcao.ParamByName('IDACAO').AsInteger           := QryOrigemDivJur.FieldByName('IDINVESTIMENTO').AsInteger;
         QryInsertOprAcao.ParamByName('IDEMISSOR').AsInteger        := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;
         QryInsertOprAcao.ExecSQL;

         // Inclui dados na Tabela BOLETA
         QryBoleta.Close;
         QryBoleta.ParamByName('IDBOLETA').AsString := wNumDoc;
         QryBoleta.Open;
         if QryBoleta.IsEmpty then
         begin
            QryInsertBoleta.Close;
            QryInsertBoleta.ParamByName('IDBOLETA').AsString     := wNumDoc;
            QryInsertBoleta.ParamByName('STATUS').AsString       := 'F';
            if not bProvisiona then
               QryInsertBoleta.ParamByName('TIPMOVBOLETA').AsString := 'DTO'
            else
               //AL_9 - Ricardo - 01/12/2004
               QryInsertBoleta.ParamByName('TIPMOVBOLETA').AsString := 'DTA';
               //AL_9 - Fim
            QryInsertBoleta.ParamByName('DATABOLETA').AsDateTime := dDataAGEProv;
            QryInsertBoleta.ParamByName('IDFORCLI').AsInteger    := wIdForCli;
            QryInsertBoleta.ExecSQL;
         end;
         QryBoleta.Close;

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, Sistema.IdModulo,
                          QryOrigemDivJur.FieldByName('IDINVESTIMENTO').AsInteger,
                          2, wIdNovaOperacao, -1,
                          wTipoOperUtilizar,
                          QryOrigemDivJur.FieldByName('IDCARTEIRAINVEST').AsInteger,
                          0{IDCARTEIRAGERENC},
                          -1, -1, -1, -1, -1,
                          dDataAGEProv,
                          wVlrUtilizar,
                          wQtdDireito,
                          pRPI.VLRCOTAINICART,
                          0 {Variacao}, 0{Juros}, wVlrIRProv, wVlrIR, 0, 0, 0, 0, 0,
                          QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString {Movimento},
                          QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString{Operacao},
                          QryOrigemDivJur.FieldByName('IDLOTE').AsString,
                          sHistorico+
                          QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' - '+
                               QryOrigemDivJur.FieldByName('DESCINVESTIMENTO').AsString,
                          'OPE', '1', '', True, -1,
                          iPlanPrevCtbPatro, iIdHistCartInv) then
         begin
             MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                    'Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
         begin
             MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         // Parametro para Contabilidade e CAP/CAR
         bCriaLancto    := True;
         wTipoRecDesBol := '';
         wMensErro      := '';
         wPlano         := -1;
         wPlanilha      := -1;
         wDocumCont     := -1;         

         // Lança o valor contabil correto
         if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo, 2,
                                    QryOrigemDivJur.FieldByName('IDINVESTIMENTO').AsInteger,
                                    wTipoOperUtilizar,
                                    wIdNovaOperacao, wIdForCli,
                                    QryOrigemDivJur.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                    QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                                    sHistorico+
                                     QryBuscaFundo.FieldByName('DESCTIPOOPERACAO').AsString+' - '+
                                         QryBuscaFundo.FieldByName('DESCFUNDOINVEST').AsString+' '+
                                              QryOrigemDivJur.FieldByName('DESCINVESTIMENTO').AsString,
                                    QryOrigemDivJur.FieldByName('IDLOTE').AsString,
                                    '', wNumDoc,
                                    QryBuscaTipoOper.FieldByName('RECPAG').AsString,
                                    wTipoRecDesBol, bCriaLancto,
                                    wVlrUtilizar,
                                    wVlrTotOperDif,
                                    dDataAGEProv, wDataVenc,
                                    wPlano, wPlanilha, wDocumCont, wMensErro,
                                    sCapCar, False) <> 0 then
         begin
            MsgDlg('Operação cancelada : Ocorreu um problema no lançamento contábil',
                   'Mensagem do Sistema ',mtWarning,[mbOK],0);
            Result := False;
            Exit;
         end;

         // Update no Plano e PlnCodigo na IRLITIGIO
         QryUpdIrLitigio.Close;
         QryUpdIrLitigio.ParamByName('pIDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
         QryUpdIrLitigio.ParamByName('pPLANO').AsInteger            := wPlano;    If wPlano <= 0 Then QryUpdIrLitigio.ParamByName('pPLANO').Clear;
         QryUpdIrLitigio.ParamByName('pPLNCODIGO').AsInteger        := wPlanilha; If wPlanilha <= 0 Then QryUpdIrLitigio.ParamByName('pPLNCODIGO').Clear;
         QryUpdIrLitigio.ExecSQL;

         //Al_10
         if not bProvisiona Then
         begin
            OperComum.LimpaParametros(QryUpdOperacaoDireitoParc);
            //AL_39 - Ricardo - 28/04/2005
            //QryUpdOperacaoDireitoParc.ParamByName('P_DIVPORACAO').AsFloat       := fPuAtual;
            //AL_39 - Fim            
            QryUpdOperacaoDireitoParc.ParamByName('P_QTDERECDIRPARC').AsFloat   :=
                                     (QryOperacaoDireito.FieldByName('QTDERECDIRPARC').AsFloat+
                                      wQtdDireito);
            QryUpdOperacaoDireitoParc.ParamByName('P_IDOPERACAODIREITO').AsInteger :=
                                      QryOperacaoDireito.FieldByName('IDOPERACAODIREITO').AsInteger;
            QryUpdOperacaoDireitoParc.ExecSQL;

            //AL_12 - Ricardo - 08/12/2004
            QryOperacaoDireito.Close;
            QryOperacaoDireito.Open;

            // Update no Status de Lançamento
            QryUpdOperacaoDireitoStatus.Close;
            QryUpdOperacaoDireitoStatus.ParamByName('pIDOPERACAODIREITO').AsInteger := iIdOperacaoDireito;
            // AL_10 (Parcial e Lancto Final)
            If ((wQtdTotOperacao -
                 QryOperacaoDireito.FieldByName('QTDERECDIRPARC').AsFloat) = 0) Then
                QryUpdOperacaoDireitoStatus.ParamByName('pSTATUS').AsString := 'L'
            else
                QryUpdOperacaoDireitoStatus.ParamByName('pSTATUS').AsString := 'P';
            QryUpdOperacaoDireitoStatus.ExecSQL;
            //AL_12 - Fim
         end;

         // AL_10
         // Atualiza Status da Boleta e das Operações.
         with qryAtualizaBoleta do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' UPDATE BOLETA SET STATUS   = '+ QuotedStr('F') + ' ');

            if wPlano > 0 then
               SQL.Add(' ,PLANO     = ' + QuotedStr(IntToStr(wPlano)) + ' ');

            if wPlanilha > 0 then
               SQL.Add(' ,PLNCODIGO = ' + QuotedStr(IntToStr(wPlanilha)) + ' ');

            if wDocumCont > 0 then
               SQL.Add(' ,CODDOCUMENTO = ' + QuotedStr(IntToStr(wDocumCont)) + ' ');

            SQL.Add('WHERE IDBOLETA = ' + QuotedStr(wNumDoc) + ' ');
            ExecSQL;
         end;
         //AL_10 - FIM

         wCarteira      := QryOrigemDivJur.FieldByName('IDCARTEIRAINVEST').AsInteger;
         wCustodiante   := QryOrigemDivJur.FieldByName('IDCUSTODIANTE').AsInteger;
         //Al_26 - Ricardo - 17/03/2005
//         wVlrTotOperDif := 0;
//         wVlrTotOperacao:= 0;

         If (wQtdOper = 0) And (QryOrigemDivJur.RecordCount >= 1) Then
            QryOrigemDivJur.Next;

      end;

      QryBuscaFundo.Close;

      if Not ProcDivJurCartGerenc(wNumDoc) then
      begin
         MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                'na Especificação da Carteira.','Mensagem do Sistema ',mtWarning,[mbOK],0);
         Result := False;
         Exit;
      end;

      if bProvisiona then
      begin
         frmCadAGE.sbtnProvisiona.Down := False;
         frmCadAGE.sbtnProvisiona.Enabled := False;
         frmCadAGE.qry.Close;
         frmCadAGE.qry.Open;
      end;

   except  on E: Exception do
      begin
         QryOrigemDivJur.EnableControls;

         MsgDlg('Operação será cancelada - Ocorreu um problema'#13+
                'no lançamento da operação!'#13+
                E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
         Result := False;
         Exit;
      end;
   end;
end;

//AL_8 - RICARDO - 26/10/2004
function TfrmCadOperAGENovo.ProcSubscricao : boolean;
Var
   wDataAge, wDataVenc       : TDateTime;

   wTipoRecDesBol, wNumDoc   : String;

   wVlrIRProv, wVlrIR, wVlrOperacao, wVlrTotOperacao, wVlrUtilizar : Currency;

   wIdNovaOperacao, wIdForCli, wIdBolsaValores, wIdOperCust, wPlano, wPlanilha,
   wDocumCont, wTipoOperUtilizar, wCarteira, wInvestimento, wCustodiante : Integer;

   wPuIrProv, wPuProporcinal, wQtdDireito, wQtdOper : Double;

begin
   Result          := True;
   wDataAge        := StrToDate(lblDataAGE.Caption);
   //Al_49 - Ricardo - 27/06/2005

   try
      QryOrigemSub.First;
      QryDestinoSub.First;
      while not QryDestinoSub.EOF do
      begin
         wNumDoc   := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                         LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));

         LblBoleta.Caption := wNumDoc;
         LblBoleta.Repaint;

         //AL_7 - RICARDO - 20/10/2004
         OperComum.LimpaParametros(QryBuscaInvestimento);
         QryBuscaInvestimento.ParamByName('IDINVESTIMENTO').AsInteger :=
                              QryDestinoSub.FieldByName('IDINVESTIMENTO').AsInteger;
         QryBuscaInvestimento.Open;

         // Inicia outros Dados
         FornecedorCli(QryDestinoSub.FieldByName('IDCUSTODIANTE').AsInteger,
                       wIdForCli, wIdBolsaValores, wDataVenc);

         //AL_15 - Ricardo - 17/12/2004
         If ((wCarteira    <> QryDestinoSub.FieldByName('IDCARTEIRAINVEST').AsInteger) Or
             (wCustodiante <> QryDestinoSub.FieldByName('IDCUSTODIANTE').AsInteger))   Then
             BuscaSaldo(QryDestinoSub.FieldByName('IDCARTEIRAINVEST').AsInteger,
                        0,
                        QryDestinoSub.FieldByName('IDINVESTIMENTO').AsInteger,
                        QryDestinoSub.FieldByName('IDLOTE').AsString,
                        wDataAGE);
         //AL_15 - Fim

         If wSaldoQtd = 0 Then
            BuscaSaldo(QryOrigemSub.FieldByName('IDCARTEIRAINVEST').AsInteger,
                       0,
                       QryOrigemSub.FieldByName('IDINVESTIMENTO').AsInteger,
                       QryOrigemSub.FieldByName('IDLOTE').AsString,
                       wDataAGE);

         If wQtdOper      = 0 Then
            wQtdOper     := QryDestinoSub.FieldByName('QTDEDIREITO').AsFloat;

         If wVlrOperacao  = 0 Then
            wVlrOperacao := QryDestinoSub.FieldByName('VALOREXERCIDO').AsFloat;

         //Proporciona o valor a contabilizar
         If wPuProporcinal  = 0 Then
            wPuProporcinal := OperComum.DivValorZero(wVlrOperacao,wQtdOper);

         //AL_25 - Ricardo - 15/03/2005
         If ((wDataAGE >= pRPI.DTMUDACPMF)  And
             ((wSaldoQtd - wSdoQtdCPMF) > 0) And
            ((QryOperacaoDireito.FieldByName('FLGTIPODIREITO').AsString = 'P') Or
             (QryOperacaoDireito.FieldByName('FLGTIPODIREITO').AsString = 'N'))) Then //Parcial
         begin
            wQtdDireito  := (wSaldoQtd - wSdoQtdCPMF);

            wQtdDireito  := OperComum.Trunca((wQtdDireito *
                                      OperComum.DivValorZero(Reg.PERCENTUAL,100)),0);

            wQtdOper     := wQtdOper - wQtdDireito;

            wSaldoQtd    := -1;

            //Tipo de operacao a se utilizado
            If iTipoOperacao < 0 Then
               wTipoOperUtilizar := iTipoOperacao - 10000
            Else
               wTipoOperUtilizar := iTipoOperacao + 10000;
         end
         else
         begin

            wQtdOper          := 0;

            wTipoOperUtilizar := iTipoOperacao;

            wQtdDireito       := wSdoQtdCPMF;

            wQtdDireito       := OperComum.Trunca((wQtdDireito *
                                      OperComum.DivValorZero(Reg.PERCENTUAL,100)),0);

         end;

         wVlrUtilizar       := OperComum.Round(wQtdDireito*wPuProporcinal,2);

         // Gera Novo Id de Operacao
         wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

         GravaOperacaoInvest(wIdNovaOperacao,
                             QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                             Sistema.IdModulo, Sistema.IdEmpresa,
                             QryDestinoSub.FieldByName('IDINVESTIMENTO').AsInteger,
                             QryDestinoSub.FieldByName('IDCARTEIRAINVEST').AsInteger, 2,
                             wTipoOperUtilizar,
                             wIdForCli,
                             QryDestinoSub.FieldByName('IDCUSTODIANTE').AsInteger,
                             iIdOperacaoDireito,
                             0{IDCARTEIRAGERENC},
                             edtDataEfetiva.Date,
                             wDataVenc,
                             wNumDoc,'F','L',
                             QryDestinoSub.FieldByName('IDLOTE').AsString,
                             wQtdDireito,
                             Reg.DIVPORACAO,
                             wVlrUtilizar,0,0,0,0,'D');

         OperComum.LimpaParametros(QryUpdOperDiretoXInv);
         QryUpdOperDiretoXInv.ParamByName('IDOPERACAOINVEST').AsInteger  := wIdNovaOperacao;
         QryUpdOperDiretoXInv.ParamByName('IDOPERACAODIREITO').AsInteger := iIdOperacaoDireito;
         QryUpdOperDiretoXInv.ParamByName('ORIGDEST').AsString           := 'D';
         QryUpdOperDiretoXInv.ExecSQL;

         // Inclui Dados na Tabela de SubTipo, OPRACAO
         QryInsertOprAcao.Close;
         QryInsertOprAcao.ParamByName('IDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
         QryInsertOprAcao.ParamByName('IDBOLSAVALORES').AsInteger   := wIdBolsaValores;
         QryInsertOprAcao.ParamByName('IDACAO').AsInteger           := QryDestinoSub.FieldByName('IDINVESTIMENTO').AsInteger;
         QryInsertOprAcao.ParamByName('IDEMISSOR').AsInteger        := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;
         QryInsertOprAcao.ExecSQL;

         // Inclui dados na Tabela BOLETA
         QryBoleta.Close;
         QryBoleta.ParamByName('IDBOLETA').AsString := wNumDoc;
         QryBoleta.Open;
         If QryBoleta.IsEmpty then
         begin
            QryInsertBoleta.Close;
            QryInsertBoleta.ParamByName('IDBOLETA').AsString     := wNumDoc;
            QryInsertBoleta.ParamByName('STATUS').AsString       := 'F';
            QryInsertBoleta.ParamByName('TIPMOVBOLETA').AsString := 'DTS';
            QryInsertBoleta.ParamByName('DATABOLETA').AsDateTime := edtDataEfetiva.Date;
            QryInsertBoleta.ParamByName('IDFORCLI').AsInteger    := wIdForCli;
            QryInsertBoleta.ExecSQL;
         end;
         QryBoleta.Close;

         // Update no Status de Lançamento
         QryUpdOperacaoDireitoStatus.Close;
         QryUpdOperacaoDireitoStatus.ParamByName('pIDOPERACAODIREITO').AsInteger := iIdOperacaoDireito;
         QryUpdOperacaoDireitoStatus.ParamByName('pSTATUS').AsString := 'L';
         QryUpdOperacaoDireitoStatus.ExecSQL;

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                           QryDestinoSub.FieldByName('IDINVESTIMENTO').AsInteger, 2,
                                           wIdNovaOperacao, -1,
                                           wTipoOperUtilizar,
                                           QryDestinoSub.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                           0{IDCARTEIRAGERENC},
                                           -1, -1, -1, -1, -1,
                                           edtDataEfetiva.Date,
                                           wVlrUtilizar,
                                           wQtdDireito,
                                           pRPI.VLRCOTAINICART,
                                           0, 0, 0, 0, 0, 0, 0, 0, 0,
                                           QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString{Movimento},
                                           QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString{Operacao},
                                           QryDestinoSub.FieldByName('IDLOTE').AsString,
                                           QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                                              QryDestinoSub.FieldByName('ACAO').AsString,
                                           'OPE', '1', '', True, -1,
                                           iPlanPrevCtbPatro, iIdHistCartInv) then
         begin
             MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                    'Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
         begin
             MsgDlg('Erro ao Atualizar os Saldos Carteira/Investimentos, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         // Atualizar Custodia
         if QryBuscaTipoOper.FieldByName('TIPOCUSTODIA').AsString <> 'N' then
            wIdOperCust := wIdNovaOperacao
         else
            wIdOperCust := -1;

         if not OperacaoInvest.CadastraCustodia(wIdOperCust) then
         begin
            MsgDlg('Erro ao Atualizar Custodia, os dados desta operação serão perdidos. ',
                   'Mensagem do Sistema',MtError,[MbOk],0);
            Result := False;
            Exit;
         end;

         OperacaoInvest.AtualizaSaldosCustodia;

         // Parametro para Contabilidade e CAP/CAR
         // Parametro para Contabilidade e CAP/CAR
         wTipoRecDesBol := '';
         bCriaLancto    := True;
         wPlano         := -1;
         wPlanilha      := -1;
         wDocumCont     := -1;
         wMensErro      := '';

         if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,2,
                                    QryDestinoSub.FieldByName('IDINVESTIMENTO').AsInteger,
                                    wTipoOperUtilizar,
                                    wIdNovaOperacao, wIdForCli,
                                    QryDestinoSub.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                    QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                                    '', QryDestinoSub.FieldByName('IDLOTE').AsString,
                                    '', wNumDoc,
                                    QryBuscaTipoOper.FieldByName('RECPAG').AsString,
                                    wTipoRecDesBol, bCriaLancto,
                                    wVlrUtilizar, wVlrUtilizar,
                                    edtDataEfetiva.Date, wDataVenc,
                                    wPlano, wPlanilha, wDocumCont,
                                    wMensErro, '', False) <> 0 then
         begin
            MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                   'no lançamento contábil','Mensagem do Sistema ',mtWarning,[mbOK],0);
            Result := False;
            Exit;
         end;

         // Atualiza Status da Boleta e das Operações.
         with qryAtualizaBoleta do
         begin
            OperComum.LimpaParametros(qryAtualizaBoleta,True);
            ParamByName('BOLETA').asString            := wNumDoc;
            if wDocumCont > 0 then
               ParamByName('CODDOCUMENTO').asInteger  := wDocumCont;
            if wPlano > 0 then
               ParamByName('PLANO').asInteger         := wPlano;
            if wPlanilha > 0 then
               ParamByName('PLNCODIGO').asInteger     := wPlanilha;
            ExecSQL;
         end;

         wCarteira     := QryDestinoSub.FieldByName('IDCARTEIRAINVEST').AsInteger;
         wCustodiante  := QryDestinoSub.FieldByName('IDCUSTODIANTE').AsInteger;         
         wInvestimento := QryDestinoSub.FieldByName('IDINVESTIMENTO').AsInteger;

         If (wQtdOper = 0) And (QryDestinoSub.RecordCount >= 1) Then
            QryDestinoSub.Next;

      end;

      if Not ProcSubCartGerenc(wNumDoc) then
      begin
         MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                'na Especificação da Carteira.','Mensagem do Sistema ',mtWarning,[mbOK],0);
         Result := False;
         Exit;
      end;

   except
      Result := False;
   end;
end;

function TfrmCadOperAGENovo.ProcIncPerAlt : boolean;
Var
   wDataVenc               : TDateTime;

   sDescrInvest, sTipoCustodia, wTipoRecDesBol, wNumDoc : String;

   wVlrIRProv, wVlrIR, wVlrOperacao, wVlrTotOperacao : Currency;

   wIdNovaOperacao, wIdForCli, wIdBolsaValores, wIdOperCust, wPlano, wPlanilha,
   wDocumCont, idHistCartDest, idHistCartOrig : Integer;

begin
   Result          := True;
   wVlrTotOperacao := 0;
   wIdNovaOperacao := 0;

   QryOrigemIncPerAlt.EnableControls;

   try

      wNumDoc   := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                         LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));
      LblBoleta.Caption := wNumDoc;
      LblBoleta.Repaint;

      QryOrigemIncPerAlt.First;
      while not QryOrigemIncPerAlt.EOF do
      begin
         //AL_2
         if QryOrigemIncPerAlt.FieldByName('QTDEDIREITO').AsFloat = 0 then
         begin
            QryOrigemIncPerAlt.Delete;
            QryOrigemIncPerAlt.Next;
            Continue;
         end;

         //AL_7 - RICARDO - 20/10/2004
         OperComum.LimpaParametros(QryBuscaInvestimento);
         QryBuscaInvestimento.ParamByName('IDINVESTIMENTO').AsInteger :=
                              QryOrigemIncPerAlt.FieldByName('IDINVESTIMENTO').AsInteger;
         QryBuscaInvestimento.Open;

         // Gera Novo Id de Operacao
         wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

         // Inicia outros Dados
         FornecedorCli(QryOrigemIncPerAlt.FieldByName('IDCUSTODIANTE').AsInteger,
                       wIdForCli, wIdBolsaValores, wDataVenc);

         wVlrOperacao := OperComum.DivValorZero(QryOrigemIncPerAlt.FieldByName('QTDEDIREITO').AsFloat,
                                                QryBuscaInvestimento.FieldByName('QTDELOTE').AsInteger)*
                                               (wSaldoVlr / wSaldoQtd);
         wVlrIR       := 0;
         wVlrIRProv   := 0;

         GravaOperacaoInvest(wIdNovaOperacao,
                             QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                             Sistema.IdModulo,
                             Sistema.IdEmpresa,
                             QryOrigemIncPerAlt.FieldByName('IDINVESTIMENTO').AsInteger,
                             QryOrigemIncPerAlt.FieldByName('IDCARTEIRAINVEST').AsInteger, 2,
                             iTipoOperacao,
                             wIdForCli,
                             QryOrigemIncPerAlt.FieldByName('IDCUSTODIANTE').AsInteger,
                             iIdOperacaoDireito, 0{IDCARTEIRAGERENC},
                             edtDataEfetiva.Date,wDataVenc,wNumDoc,'F','L',
                             QryOrigemIncPerAlt.FieldByName('IDLOTE').AsString,
                             QryOrigemIncPerAlt.FieldByName('QTDEDIREITO').AsFloat,
                             wSaldoVlr/wSaldoQtd,
                             wVlrOperacao,
                             wVLRIR,0,0,0,'O');

         OperComum.LimpaParametros(QryUpdOperDiretoXInv);
         QryUpdOperDiretoXInv.ParamByName('IDOPERACAOINVEST').AsInteger  := wIdNovaOperacao;
         QryUpdOperDiretoXInv.ParamByName('IDOPERACAODIREITO').AsInteger := iIdOperacaoDireito;
         QryUpdOperDiretoXInv.ParamByName('ORIGDEST').AsString           := 'O';
         QryUpdOperDiretoXInv.ExecSQL;

         // Inclui Dados na Tabela de SubTipo, OPRACAO
         QryInsertOprAcao.Close;
         QryInsertOprAcao.ParamByName('IDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
         QryInsertOprAcao.ParamByName('IDBOLSAVALORES').AsInteger   := wIdBolsaValores;
         QryInsertOprAcao.ParamByName('IDACAO').AsInteger           := QryOrigemIncPerAlt.FieldByName('IDINVESTIMENTO').AsInteger;
         QryInsertOprAcao.ParamByName('IDEMISSOR').AsInteger        := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;
         QryInsertOprAcao.ExecSQL;

         // Inclui dados na Tabela BOLETA
         QryBoleta.Close;
         QryBoleta.ParamByName('IDBOLETA').AsString := wNumDoc;
         QryBoleta.Open;
         If QryBoleta.IsEmpty then
         begin
            QryInsertBoleta.Close;
            QryInsertBoleta.ParamByName('IDBOLETA').AsString     := wNumDoc;
            QryInsertBoleta.ParamByName('STATUS').AsString       := 'F';
            QryInsertBoleta.ParamByName('TIPMOVBOLETA').AsString := 'DTI';
            QryInsertBoleta.ParamByName('DATABOLETA').AsDateTime := edtDataEfetiva.Date;
            QryInsertBoleta.ParamByName('IDFORCLI').AsInteger    := wIdForCli;
            QryInsertBoleta.ExecSQL;
         end;
         QryBoleta.Close;         

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                           QryOrigemIncPerAlt.FieldByName('IDINVESTIMENTO').AsInteger, 2,
                                           wIdNovaOperacao, -1,
                                           iTipoOperacao,
                                           QryOrigemIncPerAlt.FieldByName('IDCARTEIRAINVEST').AsInteger, 0{IDCARTEIRAGERENC},
                                           -1, -1, -1, -1, -1,
                                           edtDataEfetiva.Date,
                                           wVlrOperacao,
                                           QryOrigemIncPerAlt.FieldByName('QTDEDIREITO').AsFloat,
                                           pRPI.VLRCOTAINICART,
                                           0, 0, wVlrIRProv, wVlrIR, 0, 0, 0, 0, 0,
                                           'D', 'D',
                                           QryOrigemIncPerAlt.FieldByName('IDLOTE').AsString,
                                           QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / Baixa de '+
                                           QryOrigemIncPerAlt.FieldByName('DESCINVESTIMENTO').AsString,
                                           'OPE', '1', '', True, -1, iPlanPrevCtbPatro,iIdHistCartInv) then
         begin
            MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                   'Mensagem do Sistema',MtError,[MbOk],0);
            Result := False;
            Exit;
         end;

         if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
         begin
            MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                   'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
            Result := False;
            Exit;
         end;

         idHistCartOrig := iIdHistCartInv;

         wIdOperCust    := LeUltRegistro(Nil,'OPERCUSTODIA');

         If Not OperacaoInvest.AlimentaOperCustodia(wIdOperCust, -1, -1,
                                             idHistCartOrig,
                                             idHistCartOrig,
                                             QryOrigemIncPerAlt.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             QryOrigemIncPerAlt.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             QryOrigemIncPerAlt.FieldByName('IDINVESTIMENTO').AsInteger,
                                             QryOrigemIncPerAlt.FieldByName('IDCUSTODIANTE').AsInteger,
                                             QryOrigemIncPerAlt.FieldByName('IDCUSTODIANTE').AsInteger,
                                             OperComum.IIF(QryOrigemIncPerAlt.FieldByName('IDMOTIVOBLOQUEIO').IsNull,-1,QryOrigemIncPerAlt.FieldByName('IDMOTIVOBLOQUEIO').AsInteger),
                                             OperComum.IIF(QryOrigemIncPerAlt.FieldByName('IDMOTIVOBLOQUEIO').IsNull,-1,QryOrigemIncPerAlt.FieldByName('IDMOTIVOBLOQUEIO').AsInteger),
                                             QryOrigemIncPerAlt.FieldByName('QTDEDIREITO').AsFloat,
                                             edtDataEfetiva.DateTime,
                                             QryOrigemIncPerAlt.FieldByName('IDLOTE').AsString,
                                             wNumDoc,
                                             iPlanPrevCtbPatro) Then
         begin
             MsgDlg('Erro ao Alimentar a Custódia, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         ExecutarQuery(QryAux,'Update Operacaoinvest Set '+
                              ' IDOPERCUSTODIA        = ' + IntToStr(wIdOperCust) + ' ' +
                              'Where IDOPERACAOINVEST = ' + IntToStr(wIdNovaOperacao));

         if QryOrigemIncPerAlt.FieldByName('IDMOTIVOBLOQUEIO').AsInteger = -1 then
            sTipoCustodia := 'V'
         else
            sTipoCustodia := 'Z';  //DIMINUI BLOQUEADA

         If Not OperacaoInvest.InsereCustodia(
                               QryOrigemIncPerAlt.FieldByName('IDCARTEIRAINVEST').AsInteger,
                               QryOrigemIncPerAlt.FieldByName('IDINVESTIMENTO').AsInteger,
                               QryOrigemIncPerAlt.FieldByName('IDCUSTODIANTE').AsInteger,
                               OperComum.IIF(QryOrigemIncPerAlt.FieldByName('IDMOTIVOBLOQUEIO').IsNull,-1,
                                                QryOrigemIncPerAlt.FieldByName('IDMOTIVOBLOQUEIO').AsInteger),
                               wIdNovaOperacao, wIdOperCust,
                               QryOrigemIncPerAlt.FieldByName('IDLOTE').AsString,
                               sTipoCustodia[1],
                               edtDataEfetiva.Date,
                               QryOrigemIncPerAlt.FieldByName('QTDEDIREITO').AsFloat,
                               iIdHistCustodia) Then
         begin
             MsgDlg('Erro ao Atualizar a Custódia, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         OperacaoInvest.AtualizaSaldosCustodia;

         QryOrigemIncPerAlt.Next;

      end;

      QryDestinoIncPerAlt.ControlsDisabled;
      QryDestinoIncPerAlt.First;
      While Not QryDestinoIncPerAlt.Eof Do
      Begin
         //AL_7 - RICARDO - 20/10/2004
         OperComum.LimpaParametros(QryBuscaInvestimento);
         QryBuscaInvestimento.ParamByName('IDINVESTIMENTO').AsInteger :=
                              QryDestinoIncPerAlt.FieldByName('IDINVESTIMENTO').AsInteger;
         QryBuscaInvestimento.Open;

         FornecedorCli(QryDestinoIncPerAlt.FieldByName('IDCUSTODIANTE').AsInteger, wIdForCli,
                       wIdBolsaValores, wDataVenc);

         wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

         GravaOperacaoInvest(wIdNovaOperacao,
                             QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                             Sistema.IdModulo,
                             Sistema.IdEmpresa,
                             QryDestinoIncPerAlt.FieldByName('IDINVESTIMENTO').AsInteger,
                             QryDestinoIncPerAlt.FieldByName('IDCARTEIRAINVEST').AsInteger, 2,
                             iTipoOperacao,
                             wIdForCli,
                             QryOrigemIncPerAlt.FieldByName('IDCUSTODIANTE').AsInteger,
                             iIdOperacaoDireito, 0{IDCARTEIRAGERENC},
                             edtDataEfetiva.Date, wDataVenc, wNumDoc,'F','L',
                             QryDestinoIncPerAlt.FieldByName('IDLOTE').AsString,
                             QryDestinoIncPerAlt.FieldByName('QTDEDIREITO').AsFloat,
                             Reg.DIVPORACAO,0,0,0,0,0,'D');

         OperComum.LimpaParametros(QryUpdOperDiretoXInv);
         QryUpdOperDiretoXInv.ParamByName('IDOPERACAOINVEST').AsInteger  := wIdNovaOperacao;
         QryUpdOperDiretoXInv.ParamByName('IDOPERACAODIREITO').AsInteger := iIdOperacaoDireito;
         QryUpdOperDiretoXInv.ParamByName('ORIGDEST').AsString           := 'D';
         QryUpdOperDiretoXInv.ExecSQL;

         // Inclui Dados na Tabela de SubTipo, OPRACAO
         QryInsertOprAcao.Close;
         QryInsertOprAcao.ParamByName('IDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
         QryInsertOprAcao.ParamByName('IDBOLSAVALORES').AsInteger   := wIdBolsaValores;
         QryInsertOprAcao.ParamByName('IDACAO').AsInteger           := QryDestinoIncPerAlt.FieldByname('IDINVESTIMENTO').AsInteger;
         QryInsertOprAcao.ParamByName('IDEMISSOR').AsInteger        := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;
         QryInsertOprAcao.ExecSQL;
         
         // Update no Status de Lançamento
         QryUpdOperacaoDireitoStatus.Close;
         QryUpdOperacaoDireitoStatus.ParamByName('pIDOPERACAODIREITO').AsInteger := iIdOperacaoDireito;
         QryUpdOperacaoDireitoStatus.ParamByName('pSTATUS').AsString := 'L';
         QryUpdOperacaoDireitoStatus.ExecSQL;

         If Trim(QryDestinoIncPerAlt.FieldByname('DESCINVESTIMENTO').AsString) = '' Then
            sDescrInvest := QryDestinoIncPerAlt.FieldByname('ACAO').AsString
         Else
            sDescrInvest := QryDestinoIncPerAlt.FieldByname('DESCINVESTIMENTO').AsString;

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                           QryDestinoIncPerAlt.FieldByname('IDINVESTIMENTO').AsInteger, 2,
                                           wIdNovaOperacao, -1,
                                           iTipoOperacao,
                                           QryDestinoIncPerAlt.FieldByname('IDCARTEIRAINVEST').AsInteger,
                                           0{IDCARTEIRAGERENC}, -1, -1, -1, -1, -1,
                                           edtDataEfetiva.Date,
                                           0{wVlrOperacao},
                                           QryDestinoIncPerAlt.FieldByname('QTDEDIREITO').AsFloat,
                                           pRPI.VLRCOTAINICART,
                                           0, 0, 0, 0, 0, 0, 0, 0, 0,
                                           QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString {Movimento},
                                           QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString{Operacao},
                                           QryDestinoIncPerAlt.FieldByname('IDLOTE').AsString,
                                           QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / Acréscimo de '+
                                           sDescrInvest,'OPE', '1', '', True, -1,
                                           iPlanPrevCtbPatro,iIdHistCartInv) then
         begin
             MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                    'Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
         begin
             MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         idHistCartDest := iIdHistCartInv;

         wIdOperCust    := LeUltRegistro(Nil,'OPERCUSTODIA');

         If Not OperacaoInvest.AlimentaOperCustodia(wIdOperCust, -1, -1,
                                             idHistCartOrig,
                                             idHistCartDest,
                                             QryDestinoIncPerAlt.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             QryDestinoIncPerAlt.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             QryDestinoIncPerAlt.FieldByName('IDINVESTIMENTO').AsInteger,
                                             QryDestinoIncPerAlt.FieldByName('IDCUSTODIANTE').AsInteger,
                                             QryDestinoIncPerAlt.FieldByName('IDCUSTODIANTE').AsInteger,
                                             OperComum.IIF(QryDestinoIncPerAlt.FieldByName('IDMOTIVOBLOQUEIO').IsNull,-1,QryDestinoIncPerAlt.FieldByName('IDMOTIVOBLOQUEIO').AsInteger),
                                             OperComum.IIF(QryDestinoIncPerAlt.FieldByName('IDMOTIVOBLOQUEIO').IsNull,-1,QryDestinoIncPerAlt.FieldByName('IDMOTIVOBLOQUEIO').AsInteger),
                                             QryOrigemIncPerAlt.FieldByName('QTDEDIREITO').AsFloat,
                                             edtDataEfetiva.DateTime,
                                             QryDestinoIncPerAlt.FieldByName('IDLOTE').AsString,
                                             wNumDoc,
                                             iPlanPrevCtbPatro) Then
         begin
             MsgDlg('Erro ao Alimentar a Custódia, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         ExecutarQuery(QryAux,'Update Operacaoinvest Set '+
                              ' IDOPERCUSTODIA        = ' + IntToStr(wIdOperCust) + ' ' +
                              'Where IDOPERACAOINVEST = ' + IntToStr(wIdNovaOperacao));

         if QryDestinoIncPerAlt.FieldByName('IDMOTIVOBLOQUEIO').AsInteger = -1 then
            sTipoCustodia := 'C'
         else
            sTipoCustodia := 'Y';  //AUMENTA SALDO BLOQUEADO 

         If Not OperacaoInvest.InsereCustodia(
                               QryDestinoIncPerAlt.FieldByName('IDCARTEIRAINVEST').AsInteger,
                               QryDestinoIncPerAlt.FieldByName('IDINVESTIMENTO').AsInteger,
                               QryDestinoIncPerAlt.FieldByName('IDCUSTODIANTE').AsInteger,
                               OperComum.IIF(QryDestinoIncPerAlt.FieldByName('IDMOTIVOBLOQUEIO').IsNull,-1,
                                                QryDestinoIncPerAlt.FieldByName('IDMOTIVOBLOQUEIO').AsInteger),
                               wIdNovaOperacao, wIdOperCust,
                               QryDestinoIncPerAlt.FieldByName('IDLOTE').AsString,
                               sTipoCustodia[1],
                               edtDataEfetiva.Date,
                               QryDestinoIncPerAlt.FieldByName('QTDEDIREITO').AsFloat,
                               iIdHistCustodia) Then
         begin
             MsgDlg('Erro ao Atualizar a Custódia, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         OperacaoInvest.AtualizaSaldosCustodia;

         QryDestinoIncPerAlt.Next;
      end;
      // Parametro para Contabilidade e CAP/CAR
      wTipoRecDesBol := '';
      bCriaLancto    := True;
      wPlano         := -1;
      wPlanilha      := -1;
      wDocumCont     := -1;
      wMensErro      := '';

      if OperComum.LancaOperRFRV(Sistema.IdEmpresa,
                                 Sistema.IdModulo,2,
                                 QryOrigemIncPerAlt.FieldByname('IDINVESTIMENTO').AsInteger,
                                 iTipoOperacao,
                                 wIdNovaOperacao, wIdForCli,
                                 QryOrigemIncPerAlt.FieldByname('IDCARTEIRAINVEST').AsInteger,
                                 QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                                 '',QryOrigemIncPerAlt.FieldByname('IDLOTE').AsString,
                                 '', wNumDoc,
                                 QryBuscaTipoOper.FieldByName('RECPAG').AsString,
                                 wTipoRecDesBol, bCriaLancto,
                                 wVlrTotOperacao, wVlrTotOperacao, edtDataEfetiva.Date,
                                 wDataVenc,wPlano,wPlanilha,wDocumCont,wMensErro,'',False) <> 0 then
      begin
         DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                'no lançamento contábil','Mensagem do Sistema ',mtWarning,[mbOK],0);
         Result := False;
         Exit;
      end;

      // Atualiza Status da Boleta e das Operações.
      with qryAtualizaBoleta do
      begin
         OperComum.LimpaParametros(qryAtualizaBoleta,True);
         ParamByName('BOLETA').asString            := wNumDoc;
         if wDocumCont > 0 then
            ParamByName('CODDOCUMENTO').asInteger  := wDocumCont;
         if wPlano > 0 then
            ParamByName('PLANO').asInteger         := wPlano;
         if wPlanilha > 0 then
            ParamByName('PLNCODIGO').asInteger     := wPlanilha;
         ExecSQL;
      end;

      if Not ProcIncPerAltCartGerenc(wNumDoc) then
      begin
         MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                'na Especificação da Carteira.','Mensagem do Sistema ',mtWarning,[mbOK],0);
         Result := False;
         Exit;
      end;

   except
      Result := False;
   end;

   QryDestinoIncPerAlt.DisableControls;

end;

function TfrmCadOperAGENovo.ProcDesdobramento : boolean;
var
   wDataAge, wDataVenc          : TDateTime;
   idHistCartOrig, idHistCartDest, wIdNovaOperacao, wIdForCli, wIdBolsaValores,
   wIdOperCust  : Integer;   
   sTipoCustodia, wNumDoc, sDescrInvest : String;
   wPu          : Double;
   wVlrIR, wVlrIRProv, wVlrOperacao : Currency;
   wTipoOperUtilizar, wCarteira, wCustodiante  : Integer;   
   wQtdDireito, wQtdOper    : Double;
begin
   Result      := True;

   wDataAge        := StrToDate(lblDataAGE.Caption);

   try

      QryDestinoDesdobramento.EnableControls;
      QryDestinoDesdobramento.First;

      FornecedorCli(QryDestinoDesdobramento.FieldByName('IDCUSTODIANTE').AsInteger,
                    wIdForCli, wIdBolsaValores,
                    wDataVenc);

      wNumDoc  := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                        LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));

      // Inclui dados na Tabela BOLETA
      QryBoleta.Close;
      QryBoleta.ParamByName('IDBOLETA').AsString := wNumDoc;
      QryBoleta.Open;
      If QryBoleta.IsEmpty then
      begin
         QryInsertBoleta.Close;
         QryInsertBoleta.ParamByName('IDBOLETA').AsString     := wNumDoc;
         QryInsertBoleta.ParamByName('STATUS').AsString       := 'F';
         QryInsertBoleta.ParamByName('TIPMOVBOLETA').AsString := 'DTD';
         QryInsertBoleta.ParamByName('DATABOLETA').AsDateTime := edtDataEfetiva.Date;
         QryInsertBoleta.ParamByName('IDFORCLI').AsInteger    := wIdForCli;
         QryInsertBoleta.ExecSQL;
      end;
      QryBoleta.Close;

      While Not QryDestinoDesdobramento.Eof Do
      Begin
         // Inicia outros Dados
         //AL_7 - RICARDO - 20/10/2004
         OperComum.LimpaParametros(QryBuscaInvestimento);
         QryBuscaInvestimento.ParamByName('IDINVESTIMENTO').AsInteger :=
                              QryDestinoDesdobramento.FieldByName('IDINVESTIMENTO').AsInteger;
         QryBuscaInvestimento.Open;

         //AL_22 - Ricardo - 01/02/2005
         If (wCarteira    <> QryDestinoDesdobramento.FieldByName('IDCARTEIRAINVEST').AsInteger) Or
            (wCustodiante <> QryDestinoDesdobramento.FieldByName('IDCUSTODIANTE').AsInteger) Then
            BuscaSaldo(QryDestinoDesdobramento.FieldByName('IDCARTEIRAINVEST').AsInteger,
                       0,
                       QryDestinoDesdobramento.FieldByName('IDINVESTIMENTO').AsInteger,
                       QryDestinoDesdobramento.FieldByName('IDLOTE').AsString,
                       wDataAGE,
                       QryDestinoDesdobramento.FieldByName('IDCUSTODIANTE').AsInteger);

         wQtdOper      := QryDestinoDesdobramento.FieldByName('QTDEDIREITO').AsFloat;

         If ((wDataAGE >= pRPI.DTMUDACPMF)  And
            ((wSaldoQtd - wSdoQtdCPMF) > 0) And
            ((QryOperacaoDireito.FieldByName('FLGTIPODIREITO').AsString = 'P') Or
             (QryOperacaoDireito.FieldByName('FLGTIPODIREITO').AsString = 'N'))) Then //Parcial
         begin

            wQtdDireito := OperComum.Round(((wSaldoQtd - wSdoQtdCPMF) * Reg.PERCENTUAL) / 100,0);
            wSaldoQtd   := 0;

            //Tipo de operacao a se utilizado
            If iTipoOperacao < 0 Then
               wTipoOperUtilizar := iTipoOperacao - 10000
            Else
               wTipoOperUtilizar := iTipoOperacao + 10000;
         end
         else
         begin

            wTipoOperUtilizar := iTipoOperacao;

            wQtdDireito       := OperComum.Round((wSdoQtdCPMF * Reg.PERCENTUAL) / 100,0);

            wQtdOper          := 0;

         end;

         wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

         GravaOperacaoInvest(wIdNovaOperacao,
                             QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                             Sistema.IdModulo, Sistema.IdEmpresa,
                             QryDestinoDesdobramento.FieldByName('IDINVESTIMENTO').AsInteger,
                             QryDestinoDesdobramento.FieldByName('IDCARTEIRAINVEST').AsInteger,
                             2, wTipoOperUtilizar, wIdForCli,
                             QryDestinoDesdobramento.FieldByName('IDCUSTODIANTE').AsInteger,
                             iIdOperacaoDireito, 0{IDCARTEIRAGERENC},
                             edtDataEfetiva.Date,wDataVenc,wNumDoc,'F','L',
                             QryDestinoDesdobramento.FieldByName('IDLOTE').AsString,
                             wQtdDireito,
                             0,0,0,0,0,0,'D');

         OperComum.LimpaParametros(QryUpdOperDiretoXInv);
         QryUpdOperDiretoXInv.ParamByName('IDOPERACAOINVEST').AsInteger  := wIdNovaOperacao;
         QryUpdOperDiretoXInv.ParamByName('IDOPERACAODIREITO').AsInteger := iIdOperacaoDireito;
         QryUpdOperDiretoXInv.ParamByName('ORIGDEST').AsString           := 'D';
         QryUpdOperDiretoXInv.ExecSQL;

         // Inclui Dados na Tabela de SubTipo, OPRACAO
         QryInsertOprAcao.Close;
         QryInsertOprAcao.ParamByName('IDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
         QryInsertOprAcao.ParamByName('IDBOLSAVALORES').AsInteger   := wIdBolsaValores;
         QryInsertOprAcao.ParamByName('IDACAO').AsInteger           :=
                          QryDestinoDesdobramento.FieldByName('IDINVESTIMENTO').AsInteger;
         QryInsertOprAcao.ParamByName('IDEMISSOR').AsInteger        :=
                          QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;
         QryInsertOprAcao.ExecSQL;

         If Trim(QryDestinoDesdobramento.FieldByName('DESCINVESTIMENTO').AsString) = '' Then
            sDescrInvest := QryDestinoDesdobramento.FieldByName('ACAO').AsString
         Else
            sDescrInvest := QryDestinoDesdobramento.FieldByName('DESCINVESTIMENTO').AsString;

         // Update no Status de Lançamento
         QryUpdOperacaoDireitoStatus.Close;
         QryUpdOperacaoDireitoStatus.ParamByName('pIDOPERACAODIREITO').AsInteger := iIdOperacaoDireito;
         QryUpdOperacaoDireitoStatus.ParamByName('pSTATUS').AsString             := 'L';
         QryUpdOperacaoDireitoStatus.ExecSQL;

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                           QryDestinoDesdobramento.FieldByName('IDINVESTIMENTO').AsInteger,
                                           2, wIdNovaOperacao, -1, wTipoOperUtilizar,
                                           QryDestinoDesdobramento.FieldByName('IDCARTEIRAINVEST').AsInteger, 0{IDCARTEIRAGERENC},
                                           -1, -1, -1, -1, -1,
                                           edtDataEfetiva.Date,
                                           0{wVlrOperacao},
                                           wQtdDireito,
                                           pRPI.VLRCOTAINICART,
                                           0 {Variacao}, 0{Juros}, 0, 0, 0, 0, 0, 0, 0,
                                           QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString{Movimento},
                                           'N',
                                           QryDestinoDesdobramento.FieldByName('IDLOTE').AsString,
                                           QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                                           sDescrInvest,'OPE', '1', '', True, -1,
                                           iPlanPrevCtbPatro, iIdHistCartInv) then
         begin
             MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                    'Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
         begin
             MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         idHistCartDest := iIdHistCartInv;

         wIdOperCust    := LeUltRegistro(Nil,'OPERCUSTODIA');

         If Not OperacaoInvest.AlimentaOperCustodia(wIdOperCust,
                                -1,
                                -1,
                                idHistCartDest,
                                idHistCartDest,
                                QryDestinoDesdobramento.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                QryDestinoDesdobramento.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                QryDestinoDesdobramento.FieldByName('IDINVESTIMENTO').AsInteger,
                                QryDestinoDesdobramento.FieldByName('IDCUSTODIANTE').AsInteger,
                                QryDestinoDesdobramento.FieldByName('IDCUSTODIANTE').AsInteger,
                                OperComum.IIF(QryDestinoDesdobramento.FieldByName('IDMOTIVOBLOQUEIO').IsNull,-1,QryDestinoDesdobramento.FieldByName('IDMOTIVOBLOQUEIO').AsInteger),
                                OperComum.IIF(QryDestinoDesdobramento.FieldByName('IDMOTIVOBLOQUEIO').IsNull,-1,QryDestinoDesdobramento.FieldByName('IDMOTIVOBLOQUEIO').AsInteger),
                                wQtdDireito,
                                edtDataEfetiva.DateTime,
                                QryDestinoDesdobramento.FieldByName('IDLOTE').AsString,
                                wNumDoc,
                                iPlanPrevCtbPatro) Then
         begin
             MsgDlg('Erro ao Alimentar a Custódia, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         // AL_3 - 15/07/2004 - Turon - Novo Relacionamento
         ExecutarQuery(QryAux,'Update Operacaoinvest '+
                              'Set IDOPERCUSTODIA = ' + IntToStr(wIdOperCust) + ' ' +
                              'Where IDOPERACAOINVEST = ' + IntToStr(wIdNovaOperacao));

         if QryDestinoDesdobramento.FieldByName('IDMOTIVOBLOQUEIO').AsInteger = -1 then
            sTipoCustodia := 'C'
         else
            sTipoCustodia := 'Y';  //BLOQUEADA

         If Not OperacaoInvest.InsereCustodia(QryDestinoDesdobramento.FieldByName('IDCARTEIRAINVEST').AsInteger,
                               QryDestinoDesdobramento.FieldByName('IDINVESTIMENTO').AsInteger,
                               QryDestinoDesdobramento.FieldByName('IDCUSTODIANTE').AsInteger,
                               OperComum.IIF(QryDestinoDesdobramento.FieldByName('IDMOTIVOBLOQUEIO').IsNull,-1,
                                                QryDestinoDesdobramento.FieldByName('IDMOTIVOBLOQUEIO').AsInteger),
                               wIdNovaOperacao, wIdOperCust,
                               QryDestinoDesdobramento.FieldByName('IDLOTE').AsString,
                               sTipoCustodia[1],
                               edtDataEfetiva.Date,
                               wQtdDireito,
                               iIdHistCustodia) Then
         begin
             MsgDlg('Erro ao Atualizar a Custódia, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         OperacaoInvest.AtualizaSaldosCustodia;

         ExecutarQuery(QryAux,'Update HistCartInv Set      '+
                              'FlgCustodia         = NULL '+
                              'Where IdHistCartInv = '+IntToStr(iIdHistCartInv));

         wCarteira      := QryDestinoDesdobramento.FieldByName('IDCARTEIRAINVEST').AsInteger;
         wCustodiante   := QryDestinoDesdobramento.FieldByName('IDCUSTODIANTE').AsInteger;

         If (wQtdOper = 0) And (QryDestinoDesdobramento.RecordCount >= 1) Then
            QryDestinoDesdobramento.Next;
         //AL_22 - Fim            
      end;

      if Not ProcDesdobramentoGerenc(wNumDoc) then
      begin
         MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                'na Especificação da Carteira.','Mensagem do Sistema ',mtWarning,[mbOK],0);
         Result := False;
         Exit;
      end;

   except
      Result := False;
   end;

   QryDestinoDesdobramento.DisableControls;

end;

function  TfrmCadOperAGENovo.ProcGrupamento : boolean;
Var
   wIdNovaOperacao, wIdForCli, wIdBolsaValores, wIdOperCust,
   wPlano, wPlanilha, wDocumCont, idHistCartOrig, idHistCartDest : Integer;
   wVlrIRProv, wVlrIR, wVlrOperacao, wVlrTotOperacao             : Currency;
   sDescrInvest, sTipoCustodia, wTipoRecDesBol, wNumDoc          : String;
   wDataVenc                                                     : TDateTime;
   wPu : Double;
begin
   try
      wNumDoc   := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                         LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));
      LblBoleta.Caption := wNumDoc;
      LblBoleta.Repaint;

      QryOrigemGrupamento.ControlsDisabled;
      QryOrigemGrupamento.First;
      while not QryOrigemGrupamento.EOF do
      begin
         //AL_2
         if QryOrigemGrupamento.FieldByName('QTDEDIREITO').AsFloat = 0 then
         begin
            QryOrigemGrupamento.Delete;
            QryOrigemGrupamento.Next;
            Continue;
         end;
         
         //AL_7 - RICARDO - 20/10/2004
         OperComum.LimpaParametros(QryBuscaInvestimento);
         QryBuscaInvestimento.ParamByName('IDINVESTIMENTO').AsInteger :=
                              QryOrigemGrupamento.FieldByName('IDINVESTIMENTO').AsInteger;
         QryBuscaInvestimento.Open;

         // Gera Novo Id de Operacao
         wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

         // Inicia outros Dados
         FornecedorCli(QryOrigemGrupamento.FieldByName('IDCUSTODIANTE').AsInteger,
                       wIdForCli, wIdBolsaValores, wDataVenc);

         wPu    := OperComum.DivValorZero(wSaldoVlr, wSaldoQtd);
         If wPu  = 0 Then
            wPu := 1;

         wVlrOperacao := OperComum.DivValorZero(QryOrigemGrupamento.FieldByName('QTDEDIREITO').AsFloat,
                                                QryBuscaInvestimento.FieldByName('QTDELOTE').AsInteger)*
                                                wPu;
         wVlrIR       := 0;
         wVlrIRProv   := 0;

         GravaOperacaoInvest(wIdNovaOperacao,
                             QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                             Sistema.IdModulo,
                             Sistema.IdEmpresa,
                             QryOrigemGrupamento.FieldByName('IDINVESTIMENTO').AsInteger,
                             QryOrigemGrupamento.FieldByName('IDCARTEIRAINVEST').AsInteger, 2,
                             iTipoOperacao,
                             wIdForCli,
                             QryOrigemGrupamento.FieldByName('IDCUSTODIANTE').AsInteger,
                             iIdOperacaoDireito, 0{IDCARTEIRAGERENC},
                             edtDataEfetiva.Date,wDataVenc,wNumDoc,'F','L',
                             QryOrigemGrupamento.FieldByName('IDLOTE').AsString,
                             QryOrigemGrupamento.FieldByName('QTDEDIREITO').AsFloat,
                             wPu,
                             wVlrOperacao,
                             wVLRIR,0,0,0,'O');

         OperComum.LimpaParametros(QryUpdOperDiretoXInv);
         QryUpdOperDiretoXInv.ParamByName('IDOPERACAOINVEST').AsInteger  := wIdNovaOperacao;
         QryUpdOperDiretoXInv.ParamByName('IDOPERACAODIREITO').AsInteger := iIdOperacaoDireito;
         QryUpdOperDiretoXInv.ParamByName('ORIGDEST').AsString           := 'O';
         QryUpdOperDiretoXInv.ExecSQL;

         // Inclui Dados na Tabela de SubTipo, OPRACAO
         QryInsertOprAcao.Close;
         QryInsertOprAcao.ParamByName('IDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
         QryInsertOprAcao.ParamByName('IDBOLSAVALORES').AsInteger   := wIdBolsaValores;
         QryInsertOprAcao.ParamByName('IDACAO').AsInteger           := QryOrigemGrupamento.FieldByName('IDINVESTIMENTO').AsInteger;
         QryInsertOprAcao.ParamByName('IDEMISSOR').AsInteger        := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;
         QryInsertOprAcao.ExecSQL;

         // Inclui dados na Tabela BOLETA
         QryBoleta.Close;
         QryBoleta.ParamByName('IDBOLETA').AsString := wNumDoc;
         QryBoleta.Open;
         If QryBoleta.IsEmpty then
         begin
            QryInsertBoleta.Close;
            QryInsertBoleta.ParamByName('IDBOLETA').AsString     := wNumDoc;
            QryInsertBoleta.ParamByName('STATUS').AsString       := 'F';
            QryInsertBoleta.ParamByName('TIPMOVBOLETA').AsString := 'DTG';
            QryInsertBoleta.ParamByName('DATABOLETA').AsDateTime := edtDataEfetiva.Date;
            QryInsertBoleta.ParamByName('IDFORCLI').AsInteger    := wIdForCli;
            QryInsertBoleta.ExecSQL;
         end;
         QryBoleta.Close;
         // Update no Status de Lançamento
         QryUpdOperacaoDireitoStatus.Close;
         QryUpdOperacaoDireitoStatus.ParamByName('pIDOPERACAODIREITO').AsInteger := iIdOperacaoDireito;
         QryUpdOperacaoDireitoStatus.ParamByName('pSTATUS').AsString := 'L';
         QryUpdOperacaoDireitoStatus.ExecSQL;

         If Trim(QryOrigemGrupamento.FieldByname('DESCINVESTIMENTO').AsString) = '' Then
            sDescrInvest := QryOrigemGrupamento.FieldByname('ACAO').AsString
         Else
            sDescrInvest := QryOrigemGrupamento.FieldByname('DESCINVESTIMENTO').AsString;

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                           QryOrigemGrupamento.FieldByname('IDINVESTIMENTO').AsInteger, 2,
                                           wIdNovaOperacao, -1,
                                           iTipoOperacao,
                                           QryOrigemGrupamento.FieldByname('IDCARTEIRAINVEST').AsInteger,
                                           0{IDCARTEIRAGERENC}, -1, -1, -1, -1, -1,
                                           edtDataEfetiva.Date,
                                           0{wVlrOperacao},
                                           QryOrigemGrupamento.FieldByname('QTDEDIREITO').AsFloat,
                                           pRPI.VLRCOTAINICART,
                                           0, 0, 0, 0, 0, 0, 0, 0, 0,
                                           QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString{Movimento},
                                           'N'{Operacao},
                                           QryOrigemGrupamento.FieldByname('IDLOTE').AsString,
                                           QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                                           sDescrInvest,'OPE', '1', '', True, -1,
                                           iPlanPrevCtbPatro,iIdHistCartInv) then
         begin
             MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                    'Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         idHistCartOrig := iIdHistCartInv;

         if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
         begin
             MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         QryOrigemGrupamento.Next;
      end;
      QryOrigemGrupamento.DisableControls;

      QryDestinoGrupamento.ControlsDisabled;
      QryDestinoGrupamento.First;
      While Not QryDestinoGrupamento.Eof Do
      Begin

         wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

         GravaOperacaoInvest(wIdNovaOperacao,
                             QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                             Sistema.IdModulo, Sistema.IdEmpresa,
                             QryDestinoGrupamento.FieldByName('IDINVESTIMENTO').AsInteger,
                             QryDestinoGrupamento.FieldByName('IDCARTEIRAINVEST').AsInteger,
                             2, iTipoOperacao, wIdForCli,
                             QryDestinoGrupamento.FieldByName('IDCUSTODIANTE').AsInteger,
                             iIdOperacaoDireito, 0{IDCARTEIRAGERENC},
                             edtDataEfetiva.Date,wDataVenc,wNumDoc,'F','L',
                             QryDestinoGrupamento.FieldByName('IDLOTE').AsString,
                             QryDestinoGrupamento.FieldByName('QTDEDIREITO').AsFloat,
                             0,0,0,0,0,0, 'D');

         OperComum.LimpaParametros(QryUpdOperDiretoXInv);
         QryUpdOperDiretoXInv.ParamByName('IDOPERACAOINVEST').AsInteger  := wIdNovaOperacao;
         QryUpdOperDiretoXInv.ParamByName('IDOPERACAODIREITO').AsInteger := iIdOperacaoDireito;
         QryUpdOperDiretoXInv.ParamByName('ORIGDEST').AsString           := 'D';
         QryUpdOperDiretoXInv.ExecSQL;

         // Inclui Dados na Tabela de SubTipo, OPRACAO
         QryInsertOprAcao.Close;
         QryInsertOprAcao.ParamByName('IDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
         QryInsertOprAcao.ParamByName('IDBOLSAVALORES').AsInteger   := wIdBolsaValores;
         QryInsertOprAcao.ParamByName('IDACAO').AsInteger           := QryDestinoGrupamento.FieldByName('IDINVESTIMENTO').AsInteger;
         QryInsertOprAcao.ParamByName('IDEMISSOR').AsInteger        := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;
         QryInsertOprAcao.ExecSQL;

         If Trim(QryDestinoGrupamento.FieldByName('DESCINVESTIMENTO').AsString) = '' Then
            sDescrInvest := QryDestinoGrupamento.FieldByName('ACAO').AsString
         Else
            sDescrInvest := QryDestinoGrupamento.FieldByName('DESCINVESTIMENTO').AsString;

         // Update no Status de Lançamento
         QryUpdOperacaoDireitoStatus.Close;
         QryUpdOperacaoDireitoStatus.ParamByName('pIDOPERACAODIREITO').AsInteger := iIdOperacaoDireito;
         QryUpdOperacaoDireitoStatus.ParamByName('pSTATUS').AsString := 'L';
         QryUpdOperacaoDireitoStatus.ExecSQL;

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                           QryDestinoGrupamento.FieldByName('IDINVESTIMENTO').AsInteger,
                                           2, wIdNovaOperacao, -1, iTipoOperacao,
                                           QryDestinoGrupamento.FieldByName('IDCARTEIRAINVEST').AsInteger, 0{IDCARTEIRAGERENC},
                                           -1, -1, -1, -1, -1,
                                           edtDataEfetiva.Date,
                                           0{wVlrOperacao},
                                           QryDestinoGrupamento.FieldByName('QTDEDIREITO').AsFloat,
                                           pRPI.VLRCOTAINICART,
                                           0 {Variacao}, 0{Juros}, 0, 0, 0, 0, 0, 0, 0,
                                          'F', 'N', QryDestinoGrupamento.FieldByName('IDLOTE').AsString,
                                          QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                                          sDescrInvest,'OPE', '1', '', True, -1,
                                          iPlanPrevCtbPatro, iIdHistCartInv) then
         begin
             MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                    'Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         idHistCartDest := iIdHistCartInv;

         if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
         begin
            MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                   'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
            Result := False;
            Exit;
         end;

         //AL_15 - Ricardo - 20/12/2004
         OperComum.LimpaParametros(QryBuscaHistCPMF);
         QryBuscaHistCPMF.ParamByName('IDHISTCARTINV').AsInteger := idHistCartDest;
         QryBuscaHistCPMF.Open;
         If Not QryBuscaHistCPMF.IsEmpty Then
         begin
            OperComum.LimpaParametros(QryUpdHistCPMF);
            QryUpdHistCPMF.ParamByName('SALDOQTDECPMF').AsFloat :=
                      OperComum.Trunca((QryBuscaHistCPMF.FieldByName('SALDOQTDECPMF').AsFloat *
                                        Reg.PARIDADE),0);
            QryUpdHistCPMF.ParamByName('IDHISTCARTINV').AsInteger := idHistCartDest;
            QryUpdHistCPMF.ExecSql;
         end;
         QryBuscaHistCPMF.Close;
         //Al_15 - Fim

         // AL_3 - 15/07/2004 - Turon - Inclui Operação de Custódia para grupar por tipo de bloqueio
         wIdOperCust := LeUltRegistro(Nil,'OPERCUSTODIA');

         OperacaoInvest.AlimentaOperCustodia(wIdOperCust,
                                             -1,
                                             -1,
                                             idHistCartOrig,
                                             idHistCartDest,
                                             QryDestinoGrupamento.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             QryDestinoGrupamento.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             QryDestinoGrupamento.FieldByName('IDINVESTIMENTO').AsInteger,
                                             QryDestinoGrupamento.FieldByName('IDCUSTODIANTE').AsInteger,
                                             QryDestinoGrupamento.FieldByName('IDCUSTODIANTE').AsInteger,
                                             OperComum.IIF(QryDestinoGrupamento.FieldByName('IDMOTIVOBLOQUEIO').IsNull,-1,QryDestinoGrupamento.FieldByName('IDMOTIVOBLOQUEIO').AsInteger),
                                             OperComum.IIF(QryDestinoGrupamento.FieldByName('IDMOTIVOBLOQUEIO').IsNull,-1,QryDestinoGrupamento.FieldByName('IDMOTIVOBLOQUEIO').AsInteger),
                                             QryDestinoGrupamento.FieldByName('QTDEDIREITO').AsFloat,
                                             edtDataEfetiva.DateTime,
                                             QryDestinoGrupamento.FieldByName('IDLOTE').AsString,
                                             wNumDoc,
                                             iPlanPrevCtbPatro);

         // AL_3 - 15/07/2004 - Turon - Novo Relacionamento
         ExecutarQuery(QryAux,'Update Operacaoinvest '+
                              'Set IDOPERCUSTODIA = ' + IntToStr(wIdOperCust) + ' ' +
                              'Where IDOPERACAOINVEST = ' + IntToStr(wIdNovaOperacao));

         sTipoCustodia := 'I'; //Inicialização

         OperacaoInvest.InsereCustodia(QryDestinoGrupamento.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                       QryDestinoGrupamento.FieldByName('IDINVESTIMENTO').AsInteger,
                                       QryDestinoGrupamento.FieldByName('IDCUSTODIANTE').AsInteger,
                                       OperComum.IIF(QryDestinoGrupamento.FieldByName('IDMOTIVOBLOQUEIO').IsNull,-1,QryDestinoGrupamento.FieldByName('IDMOTIVOBLOQUEIO').AsInteger),
                                       wIdNovaOperacao, wIdOperCust,
                                       QryDestinoGrupamento.FieldByName('IDLOTE').AsString,
                                       sTipoCustodia[1],
                                       QryOrigemGrupamento.FieldByName('DATAREFERENCIA').AsDateTime,
                                       QryDestinoGrupamento.FieldByName('QTDEDIREITO').AsFloat,
                                       iIdHistCustodia);

         OperacaoInvest.AtualizaSaldosCustodia;

         ExecutarQuery(QryAux,'Update HistCartInv Set      '+
                              'FlgCustodia         = NULL '+
                              'Where IdHistCartInv = '+IntToStr(iIdHistCartInv));

         QryDestinoGrupamento.Next;
      end;

      if Not ProcGrupamentoCartGerenc(wNumDoc) then
      begin
         MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                'na Especificação da Carteira.','Mensagem do Sistema ',mtWarning,[mbOK],0);
         Result := False;
         Exit;
      end;

   except on E: Exception do
      begin
         MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                'no lançamento da operação!'#13+
                E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
         Result := False;
         Exit;
      end;
   end;
   Result := True;
   QryDestinoGrupamento.DisableControls;
end;

//AL_6
function TfrmCadOperAGENovo.ProcRestituicaoCap : boolean;
Var
   wDataAge, wDataVenc       : TDateTime;

   wTipoRecDesBol, wNumDoc         : String;

   wVlrUtilizar, wVlrIRProv, wVlrIR, wVlrOperacao, wVlrTotOperacao : Currency;

   wIdNovaOperacao, wIdForCli, wIdBolsaValores, wIdOperCust, wPlano, wPlanilha,
   wDocumCont, wTipoOperUtilizar, wCarteira         : Integer;

   wQtdOper, wQtdDireito, wPuProporcinal : Double;

begin
   Result          := True;
   wDataAge        := StrToDate(lblDataAGE.Caption);

   try

      QryDestinoRestCap.First;
      while not QryDestinoRestCap.EOF do
      begin

         wNumDoc   := 'RV-'+Copy(edtDataEfetiva.Text,9,2)+'/'+FormatFloat('0000',
                       LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(edtDataEfetiva.Text,9,2)));

         LblBoleta.Caption := wNumDoc;
         LblBoleta.Repaint;
         
         //AL_7 - RICARDO - 20/10/2004
         OperComum.LimpaParametros(QryBuscaInvestimento);
         QryBuscaInvestimento.ParamByName('IDINVESTIMENTO').AsInteger :=
                              QryDestinoRestCap.FieldByName('IDINVESTIMENTO').AsInteger;
         QryBuscaInvestimento.Open;

         // Inicia outros Dados
         FornecedorCli(QryDestinoRestCap.FieldByName('IDCUSTODIANTE').AsInteger,
                       wIdForCli, wIdBolsaValores, wDataVenc);

         If wCarteira <> QryDestinoRestCap.FieldByName('IDCARTEIRAINVEST').AsInteger Then
            BuscaSaldo(QryDestinoRestCap.FieldByName('IDCARTEIRAINVEST').AsInteger,
                       0,
                       QryDestinoRestCap.FieldByName('IDINVESTIMENTO').AsInteger,
                       QryDestinoRestCap.FieldByName('IDLOTE').AsString,
                       wDataAGE);

         // Gera Novo Id de Operacao
         wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

         If wQtdOper      = 0 Then
            wQtdOper     := QryDestinoRestCap.FieldByName('QTDEDIREITO').AsFloat;

         If wVlrOperacao  = 0 Then
            wVlrOperacao := QryDestinoRestCap.FieldByName('VALOREXERCIDO').AsFloat;

         //Proporciona o valor a contabilizar
         If wPuProporcinal  = 0 Then
            wPuProporcinal := OperComum.DivValorZero(wVlrOperacao,wQtdOper);

         If ((wDataAGE >= pRPI.DTMUDACPMF)  And
             ((wSaldoQtd - wSdoQtdCPMF) > 0) And
            ((QryOperacaoDireito.FieldByName('FLGTIPODIREITO').AsString = 'P') Or
             (QryOperacaoDireito.FieldByName('FLGTIPODIREITO').AsString = 'N'))) Then //Parcial
         begin
            wQtdDireito  := (wSaldoQtd - wSdoQtdCPMF) - wQtdOper;

            If wQtdDireito  < 0 Then
            begin
               wQtdDireito  := (wSaldoQtd - wSdoQtdCPMF);
               wSaldoQtd    :=  wSaldoQtd - wQtdDireito;
               wQtdOper     :=  wQtdOper  - wQtdDireito;
               //AL_26 - Ricardo - 15/03/2005
               If wSaldoQtd < wQtdOper Then
               begin
                  wQtdDireito := wQtdDireito + wSaldoQtd;
                  wQtdOper    := wQtdOper - wSaldoQtd;
                  wSaldoQtd   := 0;
               end;
            end
            Else
            begin
               wQtdDireito  := wQtdOper;
               wQtdOper     := 0;
               wSaldoQtd    := 0;
            end;

            //Tipo de operacao a se utilizado
            If iTipoOperacao < 0 Then
               wTipoOperUtilizar := iTipoOperacao - 10000
            Else
               wTipoOperUtilizar := iTipoOperacao + 10000;
         end
         else
         begin

            wTipoOperUtilizar := iTipoOperacao;

            wQtdDireito  := wQtdOper;
            wSdoQtdCPMF  := wSdoQtdCPMF - wQtdOper;
            wQtdOper     := 0;
            If wSdoQtdCPMF  < 0 Then
            begin
               MsgDlg('Não há Saldo para essa operação. Parametrize corretamente.',
                      'Mensagem do Sistema ',mtWarning,[mbOK],0);
               Exit;
            end;
         end;

         wVlrUtilizar       := OperComum.Round(wQtdDireito*wPuProporcinal,2);

         GravaOperacaoInvest(wIdNovaOperacao,
                             QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                             Sistema.IdModulo, Sistema.IdEmpresa,
                             QryDestinoRestCap.FieldByName('IDINVESTIMENTO').AsInteger,
                             QryDestinoRestCap.FieldByName('IDCARTEIRAINVEST').AsInteger, 2,
                             wTipoOperUtilizar,
                             wIdForCli,
                             QryOrigemRestCap.FieldByName('IDCUSTODIANTE').AsInteger,
                             iIdOperacaoDireito,
                             0{IDCARTEIRAGERENC},
                             edtDataEfetiva.Date,
                             wDataVenc,
                             wNumDoc,'F','L',
                             QryDestinoRestCap.FieldByName('IDLOTE').AsString,
                             wQtdDireito,
                             Reg.DIVPORACAO,
                             wVlrUtilizar,0,0,0,0,'D');

         OperComum.LimpaParametros(QryUpdOperDiretoXInv);
         QryUpdOperDiretoXInv.ParamByName('IDOPERACAOINVEST').AsInteger  := wIdNovaOperacao;
         QryUpdOperDiretoXInv.ParamByName('IDOPERACAODIREITO').AsInteger := iIdOperacaoDireito;
         QryUpdOperDiretoXInv.ParamByName('ORIGDEST').AsString           := 'D';
         QryUpdOperDiretoXInv.ExecSQL;

         // Inclui Dados na Tabela de SubTipo, OPRACAO
         QryInsertOprAcao.Close;
         QryInsertOprAcao.ParamByName('IDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
         QryInsertOprAcao.ParamByName('IDBOLSAVALORES').AsInteger   := wIdBolsaValores;
         QryInsertOprAcao.ParamByName('IDACAO').AsInteger           := QryDestinoRestCap.FieldByName('IDINVESTIMENTO').AsInteger;
         QryInsertOprAcao.ParamByName('IDEMISSOR').AsInteger        := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;
         QryInsertOprAcao.ExecSQL;

         // Inclui dados na Tabela BOLETA
         QryBoleta.Close;
         QryBoleta.ParamByName('IDBOLETA').AsString := wNumDoc;
         QryBoleta.Open;
         If QryBoleta.IsEmpty then
         begin
            QryInsertBoleta.Close;
            QryInsertBoleta.ParamByName('IDBOLETA').AsString     := wNumDoc;
            QryInsertBoleta.ParamByName('STATUS').AsString       := 'F';
            QryInsertBoleta.ParamByName('TIPMOVBOLETA').AsString := 'DRS';
            QryInsertBoleta.ParamByName('DATABOLETA').AsDateTime := edtDataEfetiva.Date;
            QryInsertBoleta.ParamByName('IDFORCLI').AsInteger    := wIdForCli;
            QryInsertBoleta.ExecSQL;
         end;
         QryBoleta.Close;

         // Update no Status de Lançamento
         QryUpdOperacaoDireitoStatus.Close;
         QryUpdOperacaoDireitoStatus.ParamByName('pIDOPERACAODIREITO').AsInteger := iIdOperacaoDireito;
         QryUpdOperacaoDireitoStatus.ParamByName('pSTATUS').AsString := 'L';
         QryUpdOperacaoDireitoStatus.ExecSQL;

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                           QryDestinoRestCap.FieldByName('IDINVESTIMENTO').AsInteger, 2,
                                           wIdNovaOperacao, -1,
                                           wTipoOperUtilizar,
                                           QryDestinoRestCap.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                           0{IDCARTEIRAGERENC},
                                           -1, -1, -1, -1, -1,
                                           edtDataEfetiva.Date,
                                           wVlrUtilizar,
                                           0,
                                           pRPI.VLRCOTAINICART,
                                           0, 0, 0, 0, 0, 0, 0, 0, 0,
                                           QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString{Movimento},
                                           QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString{Operacao},
                                           QryDestinoRestCap.FieldByName('IDLOTE').AsString,
                                           QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                                           QryDestinoRestCap.FieldByName('ACAO').AsString,
                                           'OPE', '1', '', True, -1, iPlanPrevCtbPatro,iIdHistCartInv) then
         begin
             MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                    'Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
         begin
             MsgDlg('Erro ao Atualizar os Saldos Carteira/Investimentos, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         // Atualizar Custodia
         if QryBuscaTipoOper.FieldByName('TIPOCUSTODIA').AsString <> 'N' then
            wIdOperCust := wIdNovaOperacao
         else
            wIdOperCust := -1;

         if not OperacaoInvest.CadastraCustodia(wIdOperCust) then
         begin
            MsgDlg('Erro ao Atualizar Custodia, os dados desta operação serão perdidos. ',
                   'Mensagem do Sistema',MtError,[MbOk],0);
            Result := False;
            Exit;
         end;

         OperacaoInvest.AtualizaSaldosCustodia;

         // Parametro para Contabilidade e CAP/CAR
         // Parametro para Contabilidade e CAP/CAR
         wTipoRecDesBol := '';
         bCriaLancto    := True;
         wPlano         := -1;
         wPlanilha      := -1;
         wDocumCont     := -1;
         wMensErro      := '';

         if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,2,
                                    QryDestinoRestCap.FieldByName('IDINVESTIMENTO').AsInteger,
                                    wTipoOperUtilizar,
                                    wIdNovaOperacao, wIdForCli,
                                    QryDestinoRestCap.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                    QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                                    '', QryOrigemRestCap.FieldByName('IDLOTE').AsString,
                                    '', wNumDoc,
                                    QryBuscaTipoOper.FieldByName('RECPAG').AsString,
                                    wTipoRecDesBol, bCriaLancto,
                                    wVlrUtilizar, wVlrUtilizar,
                                    edtDataEfetiva.Date, wDataVenc,
                                    wPlano, wPlanilha, wDocumCont,
                                    wMensErro, '', False) <> 0 then
         begin
            MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                   'no lançamento contábil','Mensagem do Sistema ',mtWarning,[mbOK],0);
            Result := False;
            Exit;
         end;

         // Atualiza Status da Boleta e das Operações.
         with qryAtualizaBoleta do
         begin
            OperComum.LimpaParametros(qryAtualizaBoleta,True);
            ParamByName('BOLETA').asString            := wNumDoc;
            if wDocumCont > 0 then
               ParamByName('CODDOCUMENTO').asInteger  := wDocumCont;
            if wPlano > 0 then
               ParamByName('PLANO').asInteger         := wPlano;
            if wPlanilha > 0 then
               ParamByName('PLNCODIGO').asInteger     := wPlanilha;
            ExecSQL;
         end;

         wCarteira := QryDestinoRestCap.FieldByName('IDCARTEIRAINVEST').AsInteger;

         If (wQtdOper = 0) And (QryDestinoRestCap.RecordCount >= 1) Then
             QryDestinoRestCap.Next;
      end;

      if Not ProcRestCapCartGerenc(wNumDoc) then
      begin
         MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                'na Especificação da Carteira.','Mensagem do Sistema ',mtWarning,[mbOK],0);
         Result := False;
         Exit;
      end;

   except
      Result := False;
   end;                      
end;

function TfrmCadOperAGENovo.ProcDivJurCartGerenc(wNumDoc : String)  : boolean;
var
   wIdCarteiraXEvento, wIdBolsaValores,
   wIdForCli, wIdNovaOperacao                            : Integer;
   wDataVenc, wDataAge, wDataAgeCons                     : TDateTime;
   wPU                                                   : Double;
   wQtdeSaldoOficial, fSaldoCaixa, fSomaVlrCart          : Currency;
begin
   Result       := True;
   wDataAge     := StrToDate(lblDataAGE.Caption);
   wDataAGECons := wDataAGE;
   If (Trim(QryOperacaoDireito.FieldByName('STATUS').AsString) <> '') Then
   Begin
      wDataAGECons := wDataAGECons - 1;
      While not DiasUteisInv.DiaUtil(wDataAGECons,-1,1,'',True,False,False) Do
          wDataAGECons := wDataAGECons - 1;   // Achar o dia útil anterior
   End;

   wPU := 0;
   fSomaVlrCart := 0;

   try
      QryOrigemDivJur.First;
      while not QryOrigemDivJur.EOF do   // Percorre query Origem - Para Dividendo pode ser mais de 1
      begin
         wQtdeSaldoOficial := wQtdeSaldoOficial + QryOrigemDivJur.FieldByName('QTDEDIREITO').AsFloat;
         wVlrExercicioCart := wVlrExercicioCart +  QryOrigemDivJur.FieldByName('VLRLIQ').AsFloat;
         QryOrigemDivJur.Next;
      End;
      QryOrigemDivJur.First;      

      //Calcula o PU referente a quantidade a ser utilizada desse investimento nas carteiras
      wPU  := (wVlrExercicioCart/wQtdeSaldoOficial);

      QryCarteiraGerenc.Close;
      QryCarteiraGerenc.Open;
      while not QryCarteiraGerenc.Eof do
      begin

         //Busca fornecedor
         FornecedorCli(QryOrigemDivJur.FieldByName('IDCUSTODIANTE').AsInteger,
                       wIdForCli, wIdBolsaValores, wDataVenc);

         //Busca o saldo atual
         if (Trim(QryOperacaoDireito.FieldByName('STATUS').AsString) <> '') Then
             BuscaSaldo(QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                        QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                        QryOrigemDivJur.FieldByName('IDINVESTIMENTO').AsInteger,
                        QryOrigemDivJur.FieldByName('IDLOTE').AsString,
                        wDataAGECons)
         else
             BuscaSaldo(QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                        QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                        QryOrigemDivJur.FieldByName('IDINVESTIMENTO').AsInteger,
                        QryOrigemDivJur.FieldByName('IDLOTE').AsString,
                        wDataAGE);

         if wSaldoQtd = 0 then
         begin
            QryCarteiraGerenc.Next;
            Continue; //Vai para o próximo
         end;

         wVlrOperacaoCart  := OperComum.Round((wSaldoQtd * wPU)-0.0049,2);
         wQtdeDireitoCart  := wSaldoQtd;

         If wVlrExercicioCart = 0 Then
         begin
            QryCarteiraGerenc.Next;
            Continue; //Vai para o próximo
         end;

         fSomaVlrCart        := fSomaVlrCart + wVlrOperacaoCart;

         If ABS(wVlrExercicioCart - fSomaVlrCart) < 10 Then
             wVlrOperacaoCart := wVlrOperacaoCart + (wVlrExercicioCart - fSomaVlrCart);

         if not bProvisiona then
         begin
            // Gera Novo Id de Operacao
            wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

            GravaOperacaoInvest(wIdNovaOperacao,
                                QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                                Sistema.IdModulo, Sistema.IdEmpresa,
                                QryOrigemDivJur.FieldByName('IDINVESTIMENTO').AsInteger,
                                QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger, 2,
                                QryBuscaTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger,
                                wIdForCli,
                                QryOrigemDivJur.FieldByName('IDCUSTODIANTE').AsInteger,
                                iIdOperacaoDireito,
                                QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                edtDataEfetiva.Date,
                                wDataVenc,
                                wNumDoc,'F','L',
                                QryOrigemDivJur.FieldByName('IDLOTE').AsString,
                                wQtdeDireitoCart,
                                OperComum.Trunca(wPU,8), wVlrOperacaoCart, wIRExercidoCart,
                                0,0,0,'');

            if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                             QryOrigemDivJur.FieldByName('IDINVESTIMENTO').AsInteger,
                             2, wIdNovaOperacao, -1,
                             QryBuscaTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger,
                             QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                             QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                             -1, -1, -1, -1, -1,
                             edtDataEfetiva.Date,
                             wVlrOperacaoCart,
                             wQtdeDireitoCart,
                             pRPI.VLRCOTAINICART,
                             0 {Variacao}, 0{Juros}, 0{Prov IR}, wIRExercidoCart, 0, 0, 0, 0, 0,
                             QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString {Movimento},
                             QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString{Operacao},
                             QryOrigemDivJur.FieldByName('IDLOTE').AsString,
                             QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                             QryOrigemDivJur.FieldByName('DESCINVESTIMENTO').AsString,'OPE', '1', '', True,
                             -1,
                             iPlanPrevCtbPatro,iIdHistCartInv) then
            begin
               MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                      'Mensagem do Sistema',MtError,[MbOk],0);
               Result := False;
               Exit;
            end;

            if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
            begin
                MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                       'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
                Result := False;
                Exit;
            end;

            wIdCarteiraXEvento := CotaComum.BuscaEventoPorTpOper(
                                         QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                         QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                         QryBuscaTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger);

            fSaldoCaixa        := CaixaComum.BuscaSaldoCaixa(edtDataEfetiva.Date,
                                         QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                         QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                         -1, 'OPE');

            if not CaixaComum.GravaEventosCaixa(edtDataEfetiva.Date, -1{Plano},
                                                QryBuscaTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                0,
                                                QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                wIdNovaOperacao,
                                                iIdOperacaoDireito,
                                                QryOrigemDivJur.FieldByName('DESCINVESTIMENTO').AsString,
                                                wVlrOperacaoCart, fSaldoCaixa) Then
            begin
               MsgDlg('Erro ao Alimentar o Caixa da Carteira Gerencial. Vincular o Evento ao Tipo de Operação. ',
                      'Mensagem do Sistema',MtError,[MbOk],0);
               Result := False;
               Exit;
            end;

         end
         else
         begin
            wIdCarteiraXEvento  := CotaComum.BuscaEventoPorTpOper(
                                               QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                               QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                               -70{Anuncio de Proventos});
            If wIdCarteiraXEvento = 0 Then
            begin
               MsgDlg('Não foi encontrado o evento de Caixa/Cota para a Carteira Gerencial. ',
                      'Mensagem do Sistema',MtError,[MbOk],0);
               Result := False;
               Exit;
            end;

            If Not ProvisaoComum.GravaProvisao(edtDataEfetiva.Date,
                                               edtDataEfetiva.Date,
                                               QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                               QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                               wIdCarteiraXEvento,
                                               0,
                                               iIdOperacaoDireito,
                                               0{Plano},
                                               wVlrOperacaoCart) Then
            begin
               MsgDlg('Atenção: Não foi possível gravar o evento de Caixa.',
                      'Mensagem do Sistema', MtWarning, [MbOk], 0);
               Result := False;
               Exit;
            end;

         end;

         QryCarteiraGerenc.Next;
      End;

      //Al_27 - Ricardo - 04/04/2005
      //AL_23 - Ricardo - 02/03/2005
      ZeraCotaGerencial(wDataAge,
                        QryOrigemDivJur.FieldByName('IDINVESTIMENTO').AsInteger);
   except
      Result := False;
   end;
end;

function TfrmCadOperAGENovo.ProcSubCartGerenc(wNumDoc : String) : boolean;
var
   wIdCarteiraXEvento, wIdBolsaValores, wIdForCli, wIdNovaOperacao : Integer;
   wDataVenc, wDataAge, wDataAgeCons                               : TDateTime;
   //Al_43 - Ricardo - 18/05/2005
   wPuFinanc, wPU, wQtdTotalCart, wQtdTotalCartDest, fSomaQTDCart  : Double;
   wVlrExercicio, fSaldoCaixa, fSomaVlrCart                        : Currency;
begin
   Result       := True;
   wDataAge     := StrToDate(lblDataAGE.Caption);
   wDataAGECons := wDataAGE;
   If (Trim(QryOperacaoDireito.FieldByName('STATUS').AsString) <> '') Then
   Begin
      wDataAGECons := wDataAGECons - 1;
      While not DiasUteisInv.DiaUtil(wDataAGECons,-1,1,'',True,False,False) Do
          wDataAGECons := wDataAGECons - 1;   // Achar o dia útil anterior
   End;

   wPU          := 0;
   //Al_43 - Ricardo - 18/05/2005
   wPuFinanc     := 0;
   fSomaQTDCart := 0;

   QryOrigemSub.First;
   While Not QryOrigemSub.Eof Do
   begin
      wQtdTotalCart := wQtdTotalCart + QryOrigemSub.FieldByName('QTDE').AsFloat;
      QryOrigemSub.Next;
   end;
   QryOrigemSub.First;

   QryDestinoSub.First;
   While Not QryDestinoSub.Eof Do
   begin
      wVlrExercicio     := wVlrExercicio + QryDestinoSub.FieldByName('VALOREXERCIDO').AsFloat;
      wQtdTotalCartDest := wQtdTotalCartDest + QryDestinoSub.FieldByName('QTDEDIREITO').AsFloat;
      QryDestinoSub.Next;
   end;
   QryDestinoSub.First;

   //Calcula o PU referente a quantidade a ser utilizada desse investimento nas carteiras
   wPU      := (wQtdTotalCartDest/wQtdTotalCart);
   //Al_43 - Ricardo - 18/05/2005
   if wVlrExercicio <> 0 then
      wPuFinanc :=  (wVlrExercicio/wQtdTotalCartDest);

   try
      QryCarteiraGerenc.Close;
      QryCarteiraGerenc.Open;
      while not QryCarteiraGerenc.Eof do
      begin

         //Busca fornecedor
         FornecedorCli(QryDestinoSub.FieldByName('IDCUSTODIANTE').AsInteger,
                       wIdForCli, wIdBolsaValores, wDataVenc);

         //Busca o saldo atual
         if (Trim(QryOperacaoDireito.FieldByName('STATUS').AsString) <> '') Then
             BuscaSaldo(QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                        QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                        QryOrigemSub.FieldByName('IDINVESTIMENTO').AsInteger,
                        QryOrigemSub.FieldByName('IDLOTE').AsString,
                        wDataAGECons)
         else
             BuscaSaldo(QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                        QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                        QryOrigemSub.FieldByName('IDINVESTIMENTO').AsInteger,
                        QryOrigemSub.FieldByName('IDLOTE').AsString,
                        wDataAGE);

         if wSaldoQtd = 0 then
         begin
            QryCarteiraGerenc.Next;
            Continue; //Vai para o próximo
         end;

         wQtdeDireitoCart  := OperComum.Trunca((wSaldoQtd * wPU),0);

         wVlrOperacaoCart  := 0;

         //Al_43 - Ricardo - 18/05/2005
         If wPuFinanc <> 0 then
            wVlrOperacaoCart  := OperComum.Round((wQtdeDireitoCart*wPuFinanc)-0.0049,2)
         Else If wVlrExercicio <> 0 Then
            wVlrOperacaoCart  := OperComum.Round((wQtdeDireitoCart*
                                        OperComum.BuscaCotacaoAcao(
                                                  QryDestinoSub.FieldByName('IDINVESTIMENTO').AsInteger,
                                                  StrToDate(edtDataEfetiva.Text), True))-0.0049,2);

         fSomaQTDCart        := fSomaQTDCart + wQtdeDireitoCart;

         If ABS(wQtdTotalCartDest - fSomaQTDCart) < 10 Then
         Begin
            wQtdeDireitoCart := wQtdeDireitoCart + (wQtdTotalCartDest - fSomaQTDCart);
            //Al_43 - Ricardo - 18/05/2005            
            If wPuFinanc <> 0 then
               wVlrOperacaoCart := OperComum.Round((wQtdeDireitoCart*wPuFinanc)-0.0049,2)
            Else If wVlrExercicio <> 0 Then
               wVlrOperacaoCart := OperComum.Round((wQtdeDireitoCart*
                                        OperComum.BuscaCotacaoAcao(
                                                  QryDestinoSub.FieldByName('IDINVESTIMENTO').AsInteger,
                                                  StrToDate(edtDataEfetiva.Text), True))-0.0049,2);
         end;

         // Gera Novo Id de Operacao
         wIdNovaOperacao   := LeUltRegistro(Nil,'OPERACAOINVEST');
         //Al_43 - Ricardo - 18/05/2005
         GravaOperacaoInvest(wIdNovaOperacao,
                             QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                             Sistema.IdModulo, Sistema.IdEmpresa,
                             QryDestinoSub.FieldByName('IDINVESTIMENTO').AsInteger,
                             QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger, 2,
                             QryBuscaTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger,
                             wIdForCli,
                             QryDestinoSub.FieldByName('IDCUSTODIANTE').AsInteger,
                             iIdOperacaoDireito,
                             QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                             edtDataEfetiva.Date,
                             wDataVenc,
                             wNumDoc,'F','L',
                             QryDestinoSub.FieldByName('IDLOTE').AsString,
                             wQtdeDireitoCart,
                             OperComum.Trunca(wPUFinanc,8), wVlrOperacaoCart, wIRExercidoCart,
                             0,0,0,'D');

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                           QryDestinoSub.FieldByName('IDINVESTIMENTO').AsInteger,
                                           2, wIdNovaOperacao, -1,
                                           QryBuscaTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger,
                                           QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                           QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                           -1, -1, -1, -1, -1,
                                           edtDataEfetiva.Date,
                                           wVlrOperacaoCart,
                                           wQtdeDireitoCart,
                                           pRPI.VLRCOTAINICART,
                                           0 {Variacao}, 0{Juros}, 0{Prov IR},
                                           wIRExercidoCart, 0, 0, 0, 0, 0,
                                           QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString {Movimento},
                                           QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString{Operacao},
                                           QryDestinoSub.FieldByName('IDLOTE').AsString,
                                           QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                                           QryDestinoSub.FieldByName('ACAO').AsString,
                                           'OPE', '1', '', True, -1,
                                           iPlanPrevCtbPatro,iIdHistCartInv) then
         begin
            MsgDlg('Não é possível Alimentar a Carteira, os dados desta operação serão perdidos. ',
                   'Mensagem do Sistema', MtWarning, [MbOk],0);
            Result := False;
            Exit;
         end;

         if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
         begin
             MsgDlg('Não é possível Atualizar os Saldos desta Carteira/Investimentos, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtWarning,[MbOk],0);
             Result := False;
             Exit;
         end;

         //Al_44 - Ricardo - 18/05/2005
         //busca a operação original(anúncio)
         wIdCarteiraXEvento := CotaComum.BuscaEventoPorTpOper(
                                         QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                         QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                         QryBuscaTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger);
         //Al_47 - Ricardo - 25/05/2005
         if wIdCarteiraXEvento = 0 then
         begin
            If (MsgDlg('Não foi cadastrado o evento de Caixa/Cota da operação '+#13+
                       'para a Carteira Gerencial. Deseja continuar?',
                       'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo)  Then
            begin
               Result := False;
               Exit;
            end;
         end;

         if wIdCarteiraXEvento <> 0 then
         begin
            fSaldoCaixa := CaixaComum.BuscaSaldoCaixa(edtDataEfetiva.Date,
                                                      QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                      QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                      -1, 'OPE');
   
            if not CaixaComum.GravaEventosCaixa(edtDataEfetiva.Date,
                                                -1,
                                                QryBuscaTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                0,
                                                QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                wIdNovaOperacao,
                                                iIdOperacaoDireito,
                                                QryDestinoSub.FieldByName('ACAO').AsString,
                                                wVlrOperacaoCart,
                                                fSaldoCaixa) Then
            begin
                MsgDlg('Não é possível Atualizar o Caixa da Carteira Gerencial. ',
                       'Mensagem do Sistema', MtWarning, [MbOk],0);
                Result := False;
                Exit;
            end;
            //Al_44 - Fim
            //Al_47 - Fim            
         end;
         QryCarteiraGerenc.Next;
         End;
   except
      Result := False;
   end;
end;

function TfrmCadOperAGENovo.ProcGrupamentoCartGerenc(wNumDoc : String)  : boolean;
var
   wIdCarteiraXEvento, wIdBolsaValores,
   wIdForCli, wIdNovaOperacao                            : Integer;
   wDataVenc, wDataAge, wDataAgeCons                     : TDateTime;
   wPU                                                   : Double;
   wQtdeSaldoOficial,fSaldoCaixa                         : Currency;
begin
   Result       := True;
   wDataAge     := StrToDate(lblDataAGE.Caption);
   wDataAGECons := wDataAGE;
   If (Trim(QryOperacaoDireito.FieldByName('STATUS').AsString) <> '') Then
   Begin
      wDataAGECons := wDataAGECons - 1;
      While not DiasUteisInv.DiaUtil(wDataAGECons,-1,1,'',True,False,False) Do
          wDataAGECons := wDataAGECons - 1;   // Achar o dia útil anterior
   End;

   wPU := 0;

   try
      QryCarteiraGerenc.Close;
      QryCarteiraGerenc.Open;
      while not QryCarteiraGerenc.Eof do
      begin

         //Busca fornecedor
         FornecedorCli(QryDestinoGrupamento.FieldByName('IDCUSTODIANTE').AsInteger,
                       wIdForCli, wIdBolsaValores, wDataVenc);

         //Busca o saldo atual
         if (Trim(QryOperacaoDireito.FieldByName('STATUS').AsString) <> '') Then
             BuscaSaldo(QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                        QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                        QryDestinoGrupamento.FieldByName('IDINVESTIMENTO').AsInteger,
                        QryDestinoGrupamento.FieldByName('IDLOTE').AsString,
                        wDataAGECons)
         else
             BuscaSaldo(QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                        QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                        QryDestinoGrupamento.FieldByName('IDINVESTIMENTO').AsInteger,
                        QryDestinoGrupamento.FieldByName('IDLOTE').AsString,
                        wDataAGE);

         if wSaldoQtd = 0 then
         begin
            QryCarteiraGerenc.Next;
            Continue; //Vai para o próximo
         end;

         wVlrOperacaoCart  := 0;
         wQtdeDireitoCart  := OperComum.Trunca((wSaldoQtd * Reg.PARIDADE),0);

         If ABS(wQtdeDireitoCart-QryDestinoGrupamento.FieldByName('QTDEDIREITO').AsFloat) < 5 Then
            wQtdeDireitoCart :=  QryDestinoGrupamento.FieldByName('QTDEDIREITO').AsFloat;

         // Gera Novo Id de Operacao
         wIdNovaOperacao   := LeUltRegistro(Nil,'OPERACAOINVEST');

         // AL_3 - 15/07/2004 - Turon - Grava a operação como Destino
         GravaOperacaoInvest(wIdNovaOperacao,
                             QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                             Sistema.IdModulo, Sistema.IdEmpresa,
                             QryDestinoGrupamento.FieldByName('IDINVESTIMENTO').AsInteger,
                             QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger, 2,
                             QryBuscaTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger,
                             wIdForCli,
                             QryDestinoGrupamento.FieldByName('IDCUSTODIANTE').AsInteger,
                             iIdOperacaoDireito,
                             QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                             edtDataEfetiva.Date,
                             wDataVenc,
                             wNumDoc,'F','L',
                             QryDestinoGrupamento.FieldByName('IDLOTE').AsString,
                             wQtdeDireitoCart,
                             OperComum.Trunca(wPU,8), wVlrOperacaoCart, wIRExercidoCart,
                             0,0,0,'D');

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                           QryDestinoGrupamento.FieldByName('IDINVESTIMENTO').AsInteger,
                                           2, wIdNovaOperacao, -1,
                                           QryBuscaTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger,
                                           QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                           QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                           -1, -1, -1, -1, -1,
                                           edtDataEfetiva.Date,
                                           wVlrOperacaoCart,
                                           wQtdeDireitoCart,
                                           pRPI.VLRCOTAINICART,
                                           0 {Variacao}, 0{Juros}, 0{Prov IR},
                                           wIRExercidoCart, 0, 0, 0, 0, 0,
                                           QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString{Movimento},
                                           'N'{Operacao},
                                           QryDestinoGrupamento.FieldByName('IDLOTE').AsString,
                                           QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                                           QryDestinoGrupamento.FieldByName('ACAO').AsString,
                                           'OPE', '1', '', True, -1,
                                           iPlanPrevCtbPatro,iIdHistCartInv) then
         begin
            MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                   'Mensagem do Sistema',MtError,[MbOk],0);
            Result := False;
            Exit;
         end;

         if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
         begin
             MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         QryCarteiraGerenc.Next;
      End;
   except
      Result := False;
   end;
end;

function TfrmCadOperAGENovo.ProcIncPerAltCartGerenc(wNumDoc : String)  : boolean;
var
   sDescrInvest : String;
   wDataVenc, wDataAge, wDataAGECons : TDateTime;
   wVlrIR, wVlrIRProv, wVlrOperacao  : Currency;
   wIdNovaOperacao, wIdBolsaValores, wIdForCli : Integer;
begin
   Result       := True;

   wDataAge     := StrToDate(lblDataAGE.Caption);
   wDataAGECons := wDataAGE;

   If (Trim(QryOperacaoDireito.FieldByName('STATUS').AsString) <> '') Then
   Begin
      wDataAGECons := wDataAGECons - 1;
      While not DiasUteisInv.DiaUtil(wDataAGECons,-1,1,'',True,False,False) Do
          wDataAGECons := wDataAGECons - 1;   // Achar o dia útil anterior
   End;

   try
      QryCarteiraGerenc.Close;
      QryCarteiraGerenc.Open;
      while not QryCarteiraGerenc.Eof do
      begin
         //Busca o saldo atual
         if (Trim(QryOperacaoDireito.FieldByName('STATUS').AsString) <> '') Then
             BuscaSaldo(QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                        QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                        QryOrigemIncPerAlt.FieldByName('IDINVESTIMENTO').AsInteger,
                        QryOrigemIncPerAlt.FieldByName('IDLOTE').AsString,
                        wDataAGECons)
         else
             BuscaSaldo(QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                        QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                        QryOrigemIncPerAlt.FieldByName('IDINVESTIMENTO').AsInteger,
                        QryOrigemIncPerAlt.FieldByName('IDLOTE').AsString,
                        wDataAGE);

         if wSaldoQtd = 0 then
         begin
            QryCarteiraGerenc.Next;
            Continue; //Vai para o próximo
         end;

         with QryBuscaInvestimento do
         begin
            Close;
            ParamByName('IDINVESTIMENTO').AsInteger :=
                QryOrigemIncPerAlt.FieldByName('IDINVESTIMENTO').AsInteger;
            Open;
         end;

         wVlrOperacao := OperComum.DivValorZero(wSaldoQtd,
                                                QryBuscaInvestimento.FieldByName('QTDELOTE').AsInteger)*
                                               (wSaldoVlr / wSaldoQtd);
         wVlrIR       := 0;
         wVlrIRProv   := 0;

         //Busca fornecedor
         FornecedorCli(QryOrigemIncPerAlt.FieldByName('IDCUSTODIANTE').AsInteger,
                       wIdForCli, wIdBolsaValores, wDataVenc);

         // Gera Novo Id de Operacao
         wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

         GravaOperacaoInvest(wIdNovaOperacao,
                             QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                             Sistema.IdModulo,
                             Sistema.IdEmpresa,
                             QryOrigemIncPerAlt.FieldByName('IDINVESTIMENTO').AsInteger,
                             QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger, 2,
                             iTipoOperacao,
                             wIdForCli,
                             QryOrigemIncPerAlt.FieldByName('IDCUSTODIANTE').AsInteger,
                             iIdOperacaoDireito,
                             QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                             edtDataEfetiva.Date, wDataVenc, wNumDoc,
                             QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString,'L',
                             QryOrigemIncPerAlt.FieldByName('IDLOTE').AsString,
                             wSaldoQtd,
                             wSaldoVlr/wSaldoQtd,
                             wVlrOperacao,
                             wVLRIR,0,0,0,'O');

         // Inclui Dados na Tabela de SubTipo, OPRACAO
         QryInsertOprAcao.Close;
         QryInsertOprAcao.ParamByName('IDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
         QryInsertOprAcao.ParamByName('IDBOLSAVALORES').AsInteger   := wIdBolsaValores;
         QryInsertOprAcao.ParamByName('IDACAO').AsInteger           := QryOrigemIncPerAlt.FieldByName('IDINVESTIMENTO').AsInteger;
         QryInsertOprAcao.ParamByName('IDEMISSOR').AsInteger        := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;
         QryInsertOprAcao.ExecSQL;

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                           QryOrigemIncPerAlt.FieldByName('IDINVESTIMENTO').AsInteger, 2,
                                           wIdNovaOperacao, -1,
                                           iTipoOperacao,
                                           QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                           QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                           -1, -1, -1, -1, -1,
                                           edtDataEfetiva.Date,
                                           wVlrOperacao,
                                           wSaldoQtd,
                                           pRPI.VLRCOTAINICART,
                                           0, 0, wVlrIRProv, wVlrIR, 0, 0, 0, 0, 0,
                                           'D', 'D',
                                           QryOrigemIncPerAlt.FieldByName('IDLOTE').AsString,
                                           QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / Baixa de '+
                                           QryOrigemIncPerAlt.FieldByName('DESCINVESTIMENTO').AsString,
                                           'OPE', '1', '', True, -1, iPlanPrevCtbPatro,iIdHistCartInv) then
         begin
            MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                   'Mensagem do Sistema',MtError,[MbOk],0);
            Result := False;
            Exit;
         end;

         if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
         begin
            MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                   'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
            Result := False;
            Exit;
         end;

         QryDestinoIncPerAlt.First;
         While Not QryDestinoIncPerAlt.Eof Do
         Begin
            with QryBuscaInvestimento do
            begin
               Close;
               ParamByName('IDINVESTIMENTO').AsInteger :=
                                   QryDestinoIncPerAlt.FieldByName('IDINVESTIMENTO').AsInteger;
               Open;
            end;

            FornecedorCli(QryDestinoIncPerAlt.FieldByName('IDCUSTODIANTE').AsInteger,
                          wIdForCli, wIdBolsaValores, wDataVenc);

            wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

            GravaOperacaoInvest(wIdNovaOperacao,
                                QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                                Sistema.IdModulo,
                                Sistema.IdEmpresa,
                                QryDestinoIncPerAlt.FieldByName('IDINVESTIMENTO').AsInteger,
                                QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger, 2,
                                iTipoOperacao,
                                wIdForCli,
                                QryOrigemIncPerAlt.FieldByName('IDCUSTODIANTE').AsInteger,
                                iIdOperacaoDireito,
                                QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                edtDataEfetiva.Date, wDataVenc, wNumDoc,
                                QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString,'L',
                                QryDestinoIncPerAlt.FieldByName('IDLOTE').AsString,
                                wSaldoQtd,
                                Reg.DIVPORACAO,0,0,0,0,0,'D');

            // Inclui Dados na Tabela de SubTipo, OPRACAO
            QryInsertOprAcao.Close;
            QryInsertOprAcao.ParamByName('IDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
            QryInsertOprAcao.ParamByName('IDBOLSAVALORES').AsInteger   := wIdBolsaValores;
            QryInsertOprAcao.ParamByName('IDACAO').AsInteger           := QryDestinoIncPerAlt.FieldByname('IDINVESTIMENTO').AsInteger;
            QryInsertOprAcao.ParamByName('IDEMISSOR').AsInteger        := QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;
            QryInsertOprAcao.ExecSQL;

            If Trim(QryDestinoIncPerAlt.FieldByname('DESCINVESTIMENTO').AsString) = '' Then
               sDescrInvest := QryDestinoIncPerAlt.FieldByname('ACAO').AsString
            Else
               sDescrInvest := QryDestinoIncPerAlt.FieldByname('DESCINVESTIMENTO').AsString;

            if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                              QryDestinoIncPerAlt.FieldByname('IDINVESTIMENTO').AsInteger, 2,
                                              wIdNovaOperacao, -1,
                                              iTipoOperacao,
                                              QryCarteiraGerenc.FieldByname('IDCARTEIRAINVEST').AsInteger,
                                              QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                              -1, -1, -1, -1, -1,
                                              edtDataEfetiva.Date,
                                              0{wVlrOperacao},
                                              wSaldoQtd,
                                              pRPI.VLRCOTAINICART,
                                              0, 0, 0, 0, 0, 0, 0, 0, 0,
                                              QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString {Movimento},
                                              QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString{Operacao},
                                              QryDestinoIncPerAlt.FieldByname('IDLOTE').AsString,
                                              QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / Acréscimo de '+
                                              sDescrInvest,'OPE', '1', '', True, -1,
                                              iPlanPrevCtbPatro,
                                              iIdHistCartInv) then
            begin
                MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                       'Mensagem do Sistema',MtError,[MbOk],0);
                Result := False;
                Exit;
            end;

            if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
            begin
                MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                       'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
                Result := False;
                Exit;
            end;

            QryDestinoIncPerAlt.Next;
         end;
      end;
   except
      Result := False;
   end;
end;

function TfrmCadOperAGENovo.ProcDesdobramentoGerenc(wNumDoc : String)  : boolean;
var
   wIdCarteiraXEvento, wIdBolsaValores, wIdForCli,
   wIdNovaOperacao, wTipoOperUtilizar                    : Integer;
   wDataVenc, wDataAge, wDataAgeCons                     : TDateTime;
   wQtdeSaldoOficial,fSaldoCaixa                         : Currency;
begin
   Result       := True;
   wDataAge     := StrToDate(lblDataAGE.Caption);

   try
      QryCarteiraGerenc.Close;
      QryCarteiraGerenc.Open;
      while not QryCarteiraGerenc.Eof do
      begin

         //Busca fornecedor
         FornecedorCli(QryDestinoDesdobramento.FieldByName('IDCUSTODIANTE').AsInteger,
                       wIdForCli, wIdBolsaValores, wDataVenc);

         //Busca o saldo atual
         BuscaSaldo(QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                    QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                    QryDestinoDesdobramento.FieldByName('IDINVESTIMENTO').AsInteger,
                    QryDestinoDesdobramento.FieldByName('IDLOTE').AsString,
                    wDataAGE);

         if wSaldoQtd = 0 then
         begin
            QryCarteiraGerenc.Next;
            Continue; //Vai para o próximo
         end;

         wVlrOperacaoCart  := 0;

         If  (wSaldoQtd - wSdoQtdCPMF) > 0 Then
         begin
            wQtdeDireitoCart  := OperComum.Round(((wSaldoQtd - wSdoQtdCPMF) * Reg.PERCENTUAL) / 100,0);

            //Tipo de operacao a se utilizado
            If iTipoOperacao < 0 Then
               wTipoOperUtilizar := iTipoOperacao - 10000
            Else
               wTipoOperUtilizar := iTipoOperacao + 10000;
         end
         else
         begin

            wTipoOperUtilizar := iTipoOperacao;
            wQtdeDireitoCart  := OperComum.Round((wSaldoQtd * Reg.PERCENTUAL) / 100,0);

         end;

         // Gera Novo Id de Operacao
         wIdNovaOperacao   := LeUltRegistro(Nil,'OPERACAOINVEST');

         // AL_3 - 15/07/2004 - Turon - Grava a operação como Destino
         GravaOperacaoInvest(wIdNovaOperacao,
                             QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                             Sistema.IdModulo, Sistema.IdEmpresa,
                             QryDestinoDesdobramento.FieldByName('IDINVESTIMENTO').AsInteger,
                             QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger, 2,
                             wTipoOperUtilizar,
                             wIdForCli,
                             QryDestinoDesdobramento.FieldByName('IDCUSTODIANTE').AsInteger,
                             iIdOperacaoDireito,
                             QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                             edtDataEfetiva.Date,
                             wDataVenc,
                             wNumDoc,'F','L',
                             QryDestinoDesdobramento.FieldByName('IDLOTE').AsString,
                             wQtdeDireitoCart,
                             Reg.PERCENTUAL, wVlrOperacaoCart, wIRExercidoCart,
                             0,0,0,'D');

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                           QryDestinoDesdobramento.FieldByName('IDINVESTIMENTO').AsInteger,
                                           2, wIdNovaOperacao, -1,
                                           wTipoOperUtilizar,
                                           QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                           QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                           -1, -1, -1, -1, -1,
                                           edtDataEfetiva.Date,
                                           wVlrOperacaoCart,
                                           wQtdeDireitoCart,
                                           pRPI.VLRCOTAINICART,
                                           0 {Variacao}, 0{Juros}, 0{Prov IR},
                                           wIRExercidoCart, 0, 0, 0, 0, 0,
                                           QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString{Movimento},
                                           'N'{Operacao},
                                           QryDestinoDesdobramento.FieldByName('IDLOTE').AsString,
                                           QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                                           QryDestinoDesdobramento.FieldByName('ACAO').AsString,
                                           'OPE', '1', '', True, -1,
                                           iPlanPrevCtbPatro,iIdHistCartInv) then
         begin
            MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                   'Mensagem do Sistema',MtError,[MbOk],0);
            Result := False;
            Exit;
         end;

         if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
         begin
             MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         QryCarteiraGerenc.Next;
      End;
   except
      Result := False;
   end;
end;

//AL_30 - Ricardo - 13/04/2005
function TfrmCadOperAGENovo.ProcRestCapCartGerenc(wNumDoc : String)  : boolean;
var
   wIdCarteiraXEvento, wIdBolsaValores,
   wIdForCli, wIdNovaOperacao                            : Integer;
   wDataVenc, wDataAge, wDataAgeCons                     : TDateTime;
   wPU, wCotacao, wQtdTotalCart, wQtdTotalCartDest, fSomaQTDCart   : Double;
   wVlrExercicio, fSaldoCaixa, fSomaVlrCart              : Currency;
begin
   Result       := True;
   wDataAge     := StrToDate(lblDataAGE.Caption);
   wDataAGECons := wDataAGE;
   If (Trim(QryOperacaoDireito.FieldByName('STATUS').AsString) <> '') Then
   Begin
      wDataAGECons := wDataAGECons - 1;
      While not DiasUteisInv.DiaUtil(wDataAGECons,-1,1,'',True,False,False) Do
          wDataAGECons := wDataAGECons - 1;   // Achar o dia útil anterior
   End;

   wPU          := 0;
   fSaldoCaixa  := 0;
   fSomaQTDCart := 0;


   QryOrigemRestCap.First;
   While Not QryOrigemRestCap.Eof Do
   begin
      wQtdTotalCart := wQtdTotalCart + QryOrigemRestCap.FieldByName('QTDE').AsFloat;
      QryOrigemRestCap.Next;
   end;
   QryOrigemRestCap.First;

   QryDestinoRestCap.First;
   While Not QryDestinoRestCap.Eof Do
   begin
      wVlrExercicio     := wVlrExercicio + QryDestinoRestCap.FieldByName('VALOREXERCIDO').AsFloat;
      wQtdTotalCartDest := wQtdTotalCartDest + QryDestinoRestCap.FieldByName('QTDEDIREITO').AsFloat;
      QryDestinoRestCap.Next;
   end;
   QryDestinoRestCap.First;

   //Calcula o PU referente a quantidade a ser utilizada desse investimento nas carteiras
   wPU      := opercomum.DivValorZero(wQtdTotalCartDest,wQtdTotalCart);

   wCotacao := opercomum.DivValorZero(wVlrExercicio,wQtdTotalCartDest);

   try
      QryCarteiraGerenc.Close;
      QryCarteiraGerenc.Open;
      while not QryCarteiraGerenc.Eof do
      begin

         //Busca fornecedor
         FornecedorCli(QryDestinoRestCap.FieldByName('IDCUSTODIANTE').AsInteger,
                       wIdForCli, wIdBolsaValores, wDataVenc);

         //Busca o saldo atual
         if (Trim(QryOperacaoDireito.FieldByName('STATUS').AsString) <> '') Then
             BuscaSaldo(QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                        QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                        QryOrigemRestCap.FieldByName('IDINVESTIMENTO').AsInteger,
                        QryOrigemRestCap.FieldByName('IDLOTE').AsString,
                        wDataAGECons)
         else
             BuscaSaldo(QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                        QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                        QryOrigemRestCap.FieldByName('IDINVESTIMENTO').AsInteger,
                        QryOrigemRestCap.FieldByName('IDLOTE').AsString,
                        wDataAGE);

         if wSaldoQtd = 0 then
         begin
            QryCarteiraGerenc.Next;
            Continue; //Vai para o próximo
         end;

         wQtdeDireitoCart  := OperComum.Trunca((wSaldoQtd * wPU),0);

         wVlrOperacaoCart  := 0;

         If wVlrExercicio <> 0 Then
            wVlrOperacaoCart  := OperComum.Round((wQtdeDireitoCart*wCotacao)-0.0049,2);

         fSomaQTDCart        := fSomaQTDCart + wQtdeDireitoCart;

         If ABS(wQtdTotalCartDest - fSomaQTDCart) < 10 Then
         Begin
            wQtdeDireitoCart := wQtdeDireitoCart + (wQtdTotalCartDest - fSomaQTDCart);
            If wVlrExercicio <> 0 Then
               wVlrOperacaoCart := OperComum.Round((wQtdeDireitoCart*wCotacao)-0.0049,2);
         end;

         // Gera Novo Id de Operacao
         wIdNovaOperacao   := LeUltRegistro(Nil,'OPERACAOINVEST');

         GravaOperacaoInvest(wIdNovaOperacao,
                             QryBuscaInvestimento.FieldByName('MOECODIGO').AsInteger,
                             Sistema.IdModulo, Sistema.IdEmpresa,
                             QryDestinoRestCap.FieldByName('IDINVESTIMENTO').AsInteger,
                             QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger, 2,
                             QryBuscaTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger,
                             wIdForCli,
                             QryDestinoRestCap.FieldByName('IDCUSTODIANTE').AsInteger,
                             iIdOperacaoDireito,
                             QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                             edtDataEfetiva.Date,
                             wDataVenc,
                             wNumDoc,'F','L',
                             QryDestinoRestCap.FieldByName('IDLOTE').AsString,
                             wQtdeDireitoCart,
                             OperComum.Trunca(wPU,8),wVlrOperacaoCart,0,0,0,0,'D');

         if not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                                           QryDestinoRestCap.FieldByName('IDINVESTIMENTO').AsInteger, 2,
                                           wIdNovaOperacao, -1,
                                           QryBuscaTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger,
                                           QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                           QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                           -1, -1, -1, -1, -1,
                                           edtDataEfetiva.Date,
                                           wVlrOperacaoCart,
                                           0,
                                           pRPI.VLRCOTAINICART,
                                           0, 0, 0, 0, 0, 0, 0, 0, 0,
                                           QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString {Movimento},
                                           QryBuscaTipoOper.FieldByName('NATUREZAOPERACAO').AsString{Operacao},
                                           QryDestinoRestCap.FieldByName('IDLOTE').AsString,
                                           QryBuscaTipoOper.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                                           QryDestinoRestCap.FieldByName('ACAO').AsString,
                                           'OPE', '1', '', True, -1,
                                           iPlanPrevCtbPatro, iIdHistCartInv) then
         begin
            MsgDlg('Erro ao Alimentar Carteira, os dados desta operação serão perdidos. ',
                   'Mensagem do Sistema',MtError,[MbOk],0);
            Result := False;
            Exit;
         end;

         if not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
         begin
             MsgDlg('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                    'esta Operação não poderá ser confirmada ','Mensagem do Sistema',MtError,[MbOk],0);
             Result := False;
             Exit;
         end;

         wIdCarteiraXEvento := CotaComum.BuscaEventoPorTpOper(
                                         QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                         QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                         QryBuscaTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger);

         if ABS(wIdCarteiraXEvento) > 0 then
         begin
            fSaldoCaixa        := CaixaComum.BuscaSaldoCaixa(edtDataEfetiva.Date,
                                             QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                             -1, 'OPE');

            if not CaixaComum.GravaEventosCaixa(edtDataEfetiva.Date, -1{Plano},
                                                QryBuscaTipoOper.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                0,
                                                QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                wIdNovaOperacao,
                                                iIdOperacaoDireito,
                                                QryDestinoRestCap.FieldByName('ACAO').AsString,
                                                wVlrOperacaoCart, fSaldoCaixa) Then
            begin
               MsgDlg('Erro ao Alimentar o Caixa da Carteira Gerencial. Vincular o Evento ao Tipo de Operação. ',
                      'Mensagem do Sistema',MtError,[MbOk],0);
               Result := False;
               Exit;
            end;
         end;

         QryCarteiraGerenc.Next;
      End;
   except
      Result := False;
   end;
end;
//AL_30 - Fim

procedure TfrmCadOperAGENovo.bbtnSairClick(Sender: TObject);
begin
   bSair       := True;
   bVerFormAge := True;

   Qry.Close;
   QryOrigemSub.Close;
   QryOrigemDivJur.Close;
   QryOrigDivJurAnu.Close;
   QryOrigemIncPerAlt.Close;
   QryDestinoSub.Close;
   QryDestinoIncPerAlt.Close;

  inherited;

   if DtmBaseDados.dbBaseDados.InTransaction then
      DtmBaseDados.dbBaseDados.Rollback;
  

end;

procedure TfrmCadOperAGENovo.BtIncDetClick(Sender: TObject);
Var
  Investimento, Carteira, Custodiante, Bloqueio : Longint;
  Lote           : String;
begin
  if iTipoOperacao  In [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR, pRPI.IDTIPOOPERDIRMUL] then
     QryTmpDestinoGrav := Qry
  //AL_11 - RICARDO - 08/12/2004     
  else if iTipoOperacao  In [pRPI.IDTIPOOPERDIRSUB, pRPI.IDTIPOOPERDIRDSU] then
     QryTmpDestinoGrav := QryDestinoSub
  else if iTipoOperacao In [pRPI.IDTIPOOPERDIRINC, pRPI.IDTIPOOPERDIRPER, pRPI.IDTIPOOPERDIRALT] then
     QryTmpDestinoGrav := QryDestinoIncPerAlt
  else if iTipoOperacao = pRPI.IDTIPOOPERDIRGRU then
     QryTmpDestinoGrav := QryDestinoGrupamento;

  if (BtIncDet.Down) and (Not QryTmpDestinoGrav.IsEmpty) Then
  begin
     dblAcao.Enabled        := True;
     dblCarteira.Enabled    := True;
     dblCustodiante.Enabled := True;
     dblBloqueio.Enabled    := True;

     Investimento := QryTmpDestinoGrav.FieldByName('IDINVESTIMENTO').AsInteger;
     Carteira     := QryTmpDestinoGrav.FieldByName('IDCARTEIRAINVEST').AsInteger;
     Custodiante  := QryTmpDestinoGrav.FieldByName('IDCUSTODIANTE').AsInteger;
     Bloqueio     := QryTmpDestinoGrav.FieldByName('IDMOTIVOBLOQUEIO').AsInteger;
     Lote         := QryTmpDestinoGrav.FieldByName('IDLOTE').AsString;

     QryTmpDestinoGrav.Append;

     QryTmpDestinoGrav.FieldByName('IDINVESTIMENTO').ReadOnly    := False;
     QryTmpDestinoGrav.FieldByName('IDCARTEIRAINVEST').ReadOnly  := False;
     QryTmpDestinoGrav.FieldByName('IDCUSTODIANTE').ReadOnly     := False;
     QryTmpDestinoGrav.FieldByName('IDMOTIVOBLOQUEIO').ReadOnly  := False;
     QryTmpDestinoGrav.FieldByName('IDLOTE').ReadOnly            := False;
     QryTmpDestinoGrav.FieldByName('PERCCUSTO').ReadOnly         := False;
     QryTmpDestinoGrav.FieldByName('QTDEDIREITO').ReadOnly       := False;
     QryTmpDestinoGrav.FieldByName('QTDENOVA').ReadOnly          := False;
     QryTmpDestinoGrav.FieldByName('VALOREXERCIDO').ReadOnly     := False;
     QryTmpDestinoGrav.FieldByName('VLRCUSTO').ReadOnly          := False;

     QryTmpDestinoGrav.FieldByName('IDINVESTIMENTO').AsInteger   := Investimento;
     QryTmpDestinoGrav.FieldByName('IDCARTEIRAINVEST').AsInteger := Carteira;
     QryTmpDestinoGrav.FieldByName('IDCUSTODIANTE').AsInteger    := Custodiante;
     QryTmpDestinoGrav.FieldByName('IDMOTIVOBLOQUEIO').AsInteger := Bloqueio;
     QryTmpDestinoGrav.FieldByName('IDLOTE').AsString            := Lote;
     QryTmpDestinoGrav.FieldByName('QTDEDIREITO').AsFloat        := 0;
     QryTmpDestinoGrav.FieldByName('VLRCUSTO').AsFloat           := 0;
     QryTmpDestinoGrav.FieldByName('VALOREXERCIDO').AsFloat      := 0;

     BtOkDet.Enabled    := True;
     BtCancDet.Enabled  := True;
     BtVoltaDet.Enabled := True;
  end;

   bTrocaLine := False;

end;

procedure TfrmCadOperAGENovo.BtAltDetClick(Sender: TObject);
begin
  if iTipoOperacao  In [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR, pRPI.IDTIPOOPERDIRMUL] then
     QryTmpDestinoGrav := Qry
  //AL_11 - RICARDO - 08/12/2004
  else if iTipoOperacao  In [pRPI.IDTIPOOPERDIRSUB, pRPI.IDTIPOOPERDIRDSU] then  
     QryTmpDestinoGrav := QryDestinoSub
  else if iTipoOperacao In [pRPI.IDTIPOOPERDIRINC, pRPI.IDTIPOOPERDIRPER, pRPI.IDTIPOOPERDIRALT] then
     QryTmpDestinoGrav := QryDestinoIncPerAlt
  else if iTipoOperacao = pRPI.IDTIPOOPERDIRGRU then
     QryTmpDestinoGrav := QryDestinoGrupamento;

   dblAcao.Enabled        := True;
   dblCarteira.Enabled    := True;
   dblCustodiante.Enabled := True;
   dblBloqueio.Enabled    := True;

   QryTmpDestinoGrav.Edit;

   QryTmpDestinoGrav.FieldByName('IDCARTEIRAINVEST').ReadOnly := False;
   QryTmpDestinoGrav.FieldByName('IDCUSTODIANTE').ReadOnly    := False;
   QryTmpDestinoGrav.FieldByName('IDMOTIVOBLOQUEIO').ReadOnly := False;
   QryTmpDestinoGrav.FieldByName('IDLOTE').ReadOnly           := False;
   QryTmpDestinoGrav.FieldByName('PERCCUSTO').ReadOnly        := False;
   QryTmpDestinoGrav.FieldByName('QTDEDIREITO').ReadOnly      := False;
   QryTmpDestinoGrav.FieldByName('QTDENOVA').ReadOnly         := False;
   QryTmpDestinoGrav.FieldByName('VALOREXERCIDO').ReadOnly    := False;
   QryTmpDestinoGrav.FieldByName('VLRCUSTO').ReadOnly         := False;

   BtOkDet.Enabled    := True;
   BtCancDet.Enabled  := True;
   BtVoltaDet.Enabled := True;

   bTrocaLine         := False;

end;

procedure TfrmCadOperAGENovo.BtDelDetClick(Sender: TObject);
var
  QryTmpDestino  : TQuery;
begin
  if iTipoOperacao  In [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR, pRPI.IDTIPOOPERDIRMUL] then
     QryTmpDestinoGrav := Qry
  //AL_11 - RICARDO - 08/12/2004     
  else if iTipoOperacao  In [pRPI.IDTIPOOPERDIRSUB, pRPI.IDTIPOOPERDIRDSU] then
     QryTmpDestinoGrav := QryDestinoSub
  else if iTipoOperacao In [pRPI.IDTIPOOPERDIRINC, pRPI.IDTIPOOPERDIRPER, pRPI.IDTIPOOPERDIRALT] then
     QryTmpDestinoGrav := QryDestinoIncPerAlt
  else if iTipoOperacao = pRPI.IDTIPOOPERDIRGRU then
     QryTmpDestinoGrav := QryDestinoGrupamento;

  if Application.MessageBox('Deseja Realmente excluir esse destino ?', 'Confirmação', Mb_YesNo) = IdYes Then
  begin
     lbDistribuido.Caption := FloatToStr(StrToFloat(OperComum.StripChar(lbDistribuido.Caption, '.'))  - QryTmpDestinoGrav.FieldByName('QTDEDIREITO').AsFloat);
     QryTmpDestinoGrav.Delete;
  end;

  BtDelDet.Down := False;
end;

procedure TfrmCadOperAGENovo.dbgDestinoSubKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = Chr(VK_TAB) Then
  Begin
     Key := #00;
     BtOkDet.SetFocus;
  End;
end;

procedure TfrmCadOperAGENovo.dbgDestinoSubKeyDown(Sender: TObject;
                                                  var Key: Word; Shift: TShiftState);
begin
  Case Key Of
    VK_TAB: Key := 0;
    38, 40:
      If (TwwDBgridOption(dgEditing) in dbgDestinoSub.Options) and
         (QryDestinoSub.State In [dsInsert, dsEdit]) Then
          Key := 0;
  End;
end;

procedure TfrmCadOperAGENovo.dbgDestinoSubEnter(Sender: TObject);
begin
   If iTipoOperacao = 0 Then
      Exit;
end;

procedure TfrmCadOperAGENovo.BtOkDetClick(Sender: TObject);
begin

//  inherited;

  BtIncDet.Down := False;
  BtAltDet.Down := False;

  dblAcao.Enabled        := False;
  dblCarteira.Enabled    := False;
  dblCustodiante.Enabled := False;
  dblBloqueio.Enabled    := False;

  bTrocaLine := True;

  QryTmpDestinoGrav.Post;

end;

procedure TfrmCadOperAGENovo.BtCancDetClick(Sender: TObject);
begin

  BtIncDet.Down := False;
  BtAltDet.Down := False;

  dblAcao.Enabled        := False;
  dblCarteira.Enabled    := False;
  dblCustodiante.Enabled := False;
  dblBloqueio.Enabled    := False;

  bTrocaLine             := True;

  QryTmpDestinoGrav.Cancel;

end;

procedure TfrmCadOperAGENovo.QryDestinoSubQTDEDIREITOSetText(Sender: TField;
                                                             const Text: String);
begin
  ProcQtdeDireitoDestino(Sender, QryDestinoSubQTDEDIREITO, Text, QryDestinoSub);

  //AL_11 - RICARDO - 08/12/2004  
  if iTipoOperacao  In [pRPI.IDTIPOOPERDIRSUB, pRPI.IDTIPOOPERDIRDSU] then
  begin
     QryDestinoSub.FieldByName('VALOREXERCIDO').AsFloat  :=
                   OperComum.DivValorZero(
                             QryDestinoSub.FieldByName('QTDEDIREITO').AsFloat,
                                     QryBuscaInvestimento.FieldByName('QTDELOTE').AsInteger)*
                                    (Reg.DIVPORACAO);

     If QryDestinoSub.FieldByName('VALOREXERCIDO').AsFloat = 0 Then
        QryDestinoSub.FieldByName('VALOREXERCIDO').AsFloat:=
                       QryDestinoSub.FieldByName('QTDEDIREITO').AsFloat*
                                     OperComum.BuscaCotacaoAcao(
                                               QryDestinoSub.FieldByName('IDINVESTIMENTO').AsInteger,
                                               StrToDate(edtDataEfetiva.Text), True);
  end;

end;

procedure TfrmCadOperAGENovo.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  QryBoleta.Close;
  QryOrigemSub.Close;
  QryDestinoSub.Close;
  QryCustodiante.Close;
  QryOrigemDivJur.Close;
  QryInvestimento.Close;
  QryBuscaTipoOper.Close;
  QryOrigemRestCap.Close;
  QryDestinoRestCap.Close;
  QryCarteiraGerenc.Close;
  QryCarteiraInvest.Close;
  QryBuscaBolsaValores.Close;
  QryBuscaInvestimento.Close;
  QryBuscaValoresCtbFin.Close;
  QryOperacaoInvestOrigem.Close;
  QryOperacaoInvestDestino.Close;
end;

procedure TfrmCadOperAGENovo.DsDestinoSubStateChange(Sender: TObject);
begin
  inherited;
  if QryDestinoSub.State in [dsInsert, dsEdit] Then
     dbgDestinoSub.Options := dbgDestinoSub.Options + [TwwDBgridOption(dgEditing)]
  else
     dbgDestinoSub.Options := dbgDestinoSub.Options - [TwwDBgridOption(dgEditing)];
end;

procedure TfrmCadOperAGENovo.DsDestinoIncPerAltStateChange(Sender: TObject);
begin
  inherited;
  if QryDestinoIncPerAlt.State in [dsInsert, dsEdit] Then
     dbgDestinoIncPerAlt.Options := dbgDestinoIncPerAlt.Options + [TwwDBgridOption(dgEditing)]
  else
     dbgDestinoIncPerAlt.Options := dbgDestinoIncPerAlt.Options - [TwwDBgridOption(dgEditing)];
end;

procedure TfrmCadOperAGENovo.QryDestinoSubBeforePost(DataSet: TDataSet);
begin
  inherited;
  If Not bTrocaLine Then
  Begin
     MsgDlg('Não é permitido alterar o outro registro.',
            'Mensagem do Sistema', MtError,[MbOk],0);
     BtCancDet.Click;
     SysUtils.Abort;
  End;
end;

procedure TfrmCadOperAGENovo.QryDestinoIncPerAltBeforePost(DataSet: TDataSet);
begin
  inherited;
  If Not bTrocaLine Then
  Begin
     MsgDlg('Não é permitido alterar o outro registro.',
            'Mensagem do Sistema', MtError,[MbOk],0);
     BtCancDet.Click;
     SysUtils.Abort;
  End;
end;

procedure TfrmCadOperAGENovo.QryDestinoIncPerAltQTDEDIREITOSetText(Sender: TField;
                                                                   const Text: String);
begin
   ProcQtdeDireitoDestino(Sender, QryDestinoIncPerAltQTDEDIREITO, Text, QryDestinoIncPerAlt);
end;

procedure TfrmCadOperAGENovo.ProcQtdeDireitoDestino(Sender_1, Sender_2 : TField;
                                                    const Text         : String;
                                                    QryTmpDestino      : TQuery);
Var
  eValorAntigo : Extended;
begin
  if Sender_1 = Sender_2 then
  begin
     if QryTmpDestino.State = dsInsert then
        QryTmpDestino.FieldByName('QTDEDIREITO').AsFloat := StrToFloat(Text)
     else if QryTmpDestino.FieldByName('QTDEDIREITO').NewValue <> Text then
     begin
        eValorAntigo      := QryTmpDestino.FieldByName('QTDEDIREITO').NewValue;
        QryTmpDestino.FieldByName('QTDEDIREITO').AsFloat := StrToFloat(Text);
        QryTmpDestino.FieldByName('QTDENOVA').ReadOnly   := False;
        QryTmpDestino.FieldByName('QTDENOVA').AsFloat    :=
                             QryTmpDestino.FieldByName('QTDENOVA').AsFloat+
                                                      (StrToFloat(Text)-eValorAntigo);
        QryTmpDestino.FieldByName('QTDENOVA').ReadOnly   := True;
     end;
  end;
end;

procedure TfrmCadOperAGENovo.QryOrigemDivJurVLRLIQSetText(Sender: TField; const Text: String);
begin
  inherited;
   If ((iTipoOperacao In [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR, pRPI.IDTIPOOPERDIRMUL])) Then
   Begin
      If (QryOrigemDivJur.FieldByName('VLRLIQ').OldValue <> QryOrigemDivJur.FieldByName('VLRLIQ').Value) Then
      Begin
         fPuAtual := OperComum.DivValorZero(
                       OperComum.DivValorZero(QryOrigemDivJur.FieldByName('VLRLIQ').Value,
                                              QryOrigemDivJur.FieldByName('QTDEDIREITO').AsFloat),
                                              QryLote.FieldByName('QTDELOTE').AsInteger);
      End;
   End;
end;

procedure TfrmCadOperAGENovo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   If Not bVerFormAge Then
   begin
      Action := caNone;
      Exit;
   end;

  inherited;

end;

procedure TfrmCadOperAGENovo.QryOrigemDivJurVALOREXERCIDOSetText(Sender: TField;
                                                                 const Text: String);
var
   eIRExercido : Double;
   i           : Integer;
   sValor      : String;
begin
  inherited;

    eIRExercido := 0;

    For i := 1 To Length(Text) Do
    Begin
       If Copy(Text,i,1) <> '.' Then
          sValor := sValor + Copy(Text,i,1);
    End;

    QryOrigemDivJur.FieldByName('VALOREXERCIDO').AsFloat := StrToFloat(sValor);

    if QryOperacaoDireito.FieldByName('ISENCAOIR').AsString = 'N' then
       eIRExercido := Impostos.CalculaIr(0,
                               QryOrigemDivJur.FieldByName('IDINVESTIMENTO').AsInteger,
                               0{IDCARTEIRAGERENC},
                               QryOrigemDivJur.FieldByName('IDCARTEIRAINVEST').AsInteger,
                               QryOperacaoDireito.FieldByName('IDTIPOOPERACAO').AsInteger,
                               Reg.IDMERCADO,
                               QryOrigemDivJur.FieldByName('IDLOTE').AsString,
                               Date, Date,
                               0,
                               QryOrigemDivJur.FieldByName('VALOREXERCIDO').AsFloat, 0, 'S',
                               Reg.FLGTRATAIR,fVlrRendimento);

    eIRExercido   := eIRExercido + QryOrigemDivJur.FieldByName('VLRREMUNERACAO').AsFloat;

    QryOrigemDivJur.FieldByName('IR').AsFloat              := eIRExercido;
    if QryOperacaoDireito.FieldByName('IRLITIGIO').AsString = 'S' then
       QryOrigemDivJur.FieldByName('VLRLIQ').AsFloat       :=
                       QryOrigemDivJur.FieldByName('VALOREXERCIDO').AsFloat
    else
       QryOrigemDivJur.FieldByName('VLRLIQ').AsFloat       :=
                       QryOrigemDivJur.FieldByName('VALOREXERCIDO').AsFloat-eIRExercido;

    //Al_29 - Ricardo - 05/04/2005                   
    QryOrigemDivJurVLRREMUNERACAOSetText(Sender,QryOrigemDivJur.FieldByName('VLRREMUNERACAO').AsString);
    QryOrigemDivJurVLRLIQSetText(Sender, QryOrigemDivJur.FieldByName('VLRLIQ').AsString);
    //Al_33 - Ricardo - 26/04/2005
    QryOrigemDivJur.FieldByName('VLRREMUNERACAO').ReadOnly := False;
    QryOrigemDivJur.FieldByName('VLRLIQ').ReadOnly         := False;
end;

procedure TfrmCadOperAGENovo.QryOrigemGrupamentoQTDEDIREITOSetText(Sender: TField;
                                                                   const Text: String);
var
   eIRExercido : Double;
   i           : Integer;
   sValor      : String;
begin
  inherited;

    eIRExercido := 0;

    For i := 1 To Length(Text) Do
    Begin
       If Copy(Text,i,1) <> '.' Then
          sValor := sValor + Copy(Text,i,1);
    End;

    QryOrigemGrupamento.FieldByName('QTDEDIREITO').AsFloat    := StrToFloat(sValor);
    QryOrigemGrupamento.FieldByName('QTDE').ReadOnly          := False;
    QryOrigemGrupamento.FieldByName('QTDE').AsFloat           := StrToFloat(sValor);
    QryOrigemGrupamento.FieldByName('QTDE').ReadOnly          := True;
    QryOrigemGrupamento.FieldByName('VALOREXERCIDO').ReadOnly := False;
    QryOrigemGrupamento.FieldByName('VALOREXERCIDO').AsFloat  := OperComum.Round(
      (QryOrigemGrupamento.FieldByName('QTDEDIREITO').AsFloat *
          OperComum.DivValorZero(Reg.DIVPORACAO,
                                 QryLote.FieldByName('QTDELOTE').AsInteger))-0.0049,2)+
                                 QryOrigemGrupamento.FieldByName('VLRREMUNERACAO').AsFloat;

    if QryOperacaoDireito.FieldByName('ISENCAOIR').AsString = 'N' then
       eIRExercido := Impostos.CalculaIr(0,
                               QryOrigemGrupamento.FieldByName('IDINVESTIMENTO').AsInteger,
                               0{IDCARTEIRAGERENC},
                               QryOrigemGrupamento.FieldByName('IDCARTEIRAINVEST').AsInteger,
                               QryOperacaoDireito.FieldByName('IDTIPOOPERACAO').AsInteger,
                               Reg.IDMERCADO,
                               QryOrigemGrupamento.FieldByName('IDLOTE').AsString,
                               Date, Date,
                               0,
                               QryOrigemGrupamento.FieldByName('VALOREXERCIDO').AsFloat,
                               0, 'S', Reg.FLGTRATAIR, fVlrRendimento);

    eIRExercido   := eIRExercido + QryOrigemGrupamento.FieldByName('VLRREMUNERACAO').AsFloat;

    QryOrigemGrupamento.FieldByName('IR').AsFloat              := eIRExercido;
    if QryOperacaoDireito.FieldByName('IRLITIGIO').AsString = 'S' then
       QryOrigemGrupamento.FieldByName('VLRLIQ').AsFloat       :=
                  QryOrigemGrupamento.FieldByName('VALOREXERCIDO').AsFloat
    else
       QryOrigemGrupamento.FieldByName('VLRLIQ').AsFloat   :=
                  QryOrigemGrupamento.FieldByName('VALOREXERCIDO').AsFloat-eIRExercido;

    QryDestinoGrupamento.Edit;
    QryDestinoGrupamento.FieldByName('QTDEDIREITO').ReadOnly      := False;
    QryDestinoGrupamento.FieldByName('QTDEDIREITO').AsFloat       :=
                  OperComum.Trunca((QryOrigemGrupamento.FieldByName('QTDEDIREITO').AsFloat *
                                    Reg.PARIDADE),0);

    QryDestinoGrupamento.FieldByName('QTDENOVA').ReadOnly         := False;
    QryDestinoGrupamento.FieldByName('QTDENOVA').AsFloat          :=
                  QryOrigemGrupamento.FieldByName('QTDEDIREITO').AsFloat;
    QryDestinoGrupamento.Post;

end;

procedure TfrmCadOperAGENovo.QryOrigemGrupamentoVLRREMUNERACAOSetText(Sender: TField;
                                                                      const Text: String);
Var
  eValorExercido, eRemuneracao, eIRRemuneracao, eIRExercido : Extended;
  sTrataIR : string;
begin
   if bbtnConfirmar.Enabled then
   begin
      OperacaoInvest.RetParamOperDireito(QryOperacaoDireito.FieldByName('IDOPERACAODIREITO').AsInteger, Reg, qry.DatabaseName);

      eRemuneracao   := StrToFloat(OperComum.StripChar(Text, '.'));
      eValorExercido := OperComum.Round(
               (QryOrigemGrupamento.FieldByName('QTDEDIREITO').AsFloat *
                OperComum.DivValorZero(Reg.DIVPORACAO,
                                      QryLote.FieldByName('QTDELOTE').AsInteger))-0.0049,2);
      QryOrigemGrupamento.FieldByName('VLRREMUNERACAO').AsFloat := eRemuneracao;
      eIRRemuneracao := 0;
      //Recalculo o IR em caso de valores alterados
      fVlrRendimento := 0;
      eIRExercido := Impostos.CalculaIr(0,
                                        QryOrigemGrupamento.FieldByName('IDINVESTIMENTO').AsInteger,
                                        0{CARTEIRAGERENC},
                                        QryOrigemGrupamento.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                        QryOperacaoDireito.FieldByName('IDTIPOOPERACAO').AsInteger,
                                        Reg.IDMERCADO,
                                        QryOrigemGrupamento.FieldByName('IDLOTE').AsString,
                                        Date, Date, 0, eValorExercido, 0, 'S',
                                        Reg.FLGTRATAIR,fVlrRendimento);
      // Calculo do IR sobre Remuneração (Sempre)
      fVlrRendimento := 0;
      eIRRemuneracao :=  Impostos.CalculaIr(1,
                                            QryOrigemGrupamento.FieldByName('IDINVESTIMENTO').AsInteger,
                                            0{CARTEIRAGERENC},
                                            QryOrigemGrupamento.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                            0, 0,
                                            QryOrigemGrupamento.FieldByName('IDLOTE').AsString,
                                            Date, Date, 0, eRemuneracao, 0, 'S',
                                            Reg.FLGTRATAIR, fVlrRendimento);
      Try
        QryOrigemGrupamento.FieldByName('IR').ReadOnly              := False;
        QryOrigemGrupamento.FieldByName('VLRLIQ').ReadOnly          := False;
        QryOrigemGrupamento.FieldByName('VALOREXERCIDO').ReadOnly   := False;
        QryOrigemGrupamento.FieldByName('IR').AsFloat               := eIRExercido + eIRRemuneracao;
        if QryOperacaoDireito.FieldByName('IRLITIGIO').AsString  = 'S' then
        begin
           QryOrigemGrupamento.FieldByName('VALOREXERCIDO').AsFloat := (eRemuneracao + eValorExercido);
           QryOrigemGrupamento.FieldByName('VLRLIQ').AsFloat        := (eRemuneracao + eValorExercido);
        end
        else
        begin
           QryOrigemGrupamento.FieldByName('VALOREXERCIDO').AsFloat := (eRemuneracao + eValorExercido);
           QryOrigemGrupamento.FieldByName('VLRLIQ').AsFloat        := (eRemuneracao + eValorExercido) - QryOrigemDivJur.FieldByName('IR').AsFloat;
        end;
        QryOrigemGrupamento.FieldByName('VLRIRREMUNERACAO').AsFloat := eIRRemuneracao;
      Finally
        QryOrigemGrupamento.FieldByName('IR').ReadOnly              := True;
        QryOrigemGrupamento.FieldByName('VLRLIQ').ReadOnly          := True;
        QryOrigemGrupamento.FieldByName('VALOREXERCIDO').ReadOnly   := True;
      end;
   end;
end;

procedure TfrmCadOperAGENovo.QryOrigemGrupamentoVALOREXERCIDOSetText(
                              Sender: TField; const Text: String);
var
   eIRExercido : Double;
   i           : Integer;
   sValor      : String;
begin
  inherited;

    eIRExercido := 0;

    For i := 1 To Length(Text) Do
    Begin
       If Copy(Text,i,1) <> '.' Then
          sValor := sValor + Copy(Text,i,1);
    End;

    QryOrigemGrupamento.FieldByName('VALOREXERCIDO').AsFloat := StrToFloat(sValor);

    if QryOperacaoDireito.FieldByName('ISENCAOIR').AsString = 'N' then
       eIRExercido := Impostos.CalculaIr(0,
                                         QryOrigemGrupamento.FieldByName('IDINVESTIMENTO').AsInteger,
                                         0{IDCARTEIRAGERENC},
                                         QryOrigemGrupamento.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                         QryOperacaoDireito.FieldByName('IDTIPOOPERACAO').AsInteger,
                                         Reg.IDMERCADO,
                                         QryOrigemGrupamento.FieldByName('IDLOTE').AsString,
                                         Date, Date, 0,
                                         QryOrigemGrupamento.FieldByName('VALOREXERCIDO').AsFloat, 0, 'S',
                                         Reg.FLGTRATAIR, fVlrRendimento);

    eIRExercido   := eIRExercido + QryOrigemGrupamento.FieldByName('VLRREMUNERACAO').AsFloat;

    QryOrigemGrupamento.FieldByName('IR').AsFloat              := eIRExercido;
    if QryOperacaoDireito.FieldByName('IRLITIGIO').AsString = 'S' then
       QryOrigemGrupamento.FieldByName('VLRLIQ').AsFloat       :=
                       QryOrigemGrupamento.FieldByName('VALOREXERCIDO').AsFloat
    else
       QryOrigemGrupamento.FieldByName('VLRLIQ').AsFloat       :=
                       QryOrigemGrupamento.FieldByName('VALOREXERCIDO').AsFloat-eIRExercido;
end;

procedure TfrmCadOperAGENovo.QryOrigemGrupamentoVLRLIQSetText(
  Sender: TField; const Text: String);
begin
  inherited;
   If ((iTipoOperacao In [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR, pRPI.IDTIPOOPERDIRMUL])) Then
   Begin
      If (QryOrigemGrupamento.FieldByName('VLRLIQ').OldValue <>
          QryOrigemGrupamento.FieldByName('VLRLIQ').Value) Then
      Begin
         fPuAtual := OperComum.DivValorZero(
                       OperComum.DivValorZero(QryOrigemGrupamento.FieldByName('VLRLIQ').Value,
                                              QryOrigemGrupamento.FieldByName('QTDEDIREITO').AsFloat),
                                              QryLote.FieldByName('QTDELOTE').AsInteger);
      End;
   End;
end;

procedure TfrmCadOperAGENovo.QryDestinoGrupamentoBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  If Not bTrocaLine Then
  Begin
     MsgDlg('Não é permitido alterar o outro registro.',
            'Mensagem do Sistema', MtError,[MbOk],0);
     BtCancDet.Click;
     SysUtils.Abort;
  End;
end;

procedure TfrmCadOperAGENovo.ZeraCotaGerencial(wDtMov : TDateTime; iIdInvestimento : Integer);
begin
   QryCarteiraGerenc.Close;
   QryCarteiraGerenc.Open;
   While Not QryCarteiraGerenc.Eof Do
   begin
       BuscaSaldo(QryCarteiraGerenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                  QryCarteiraGerenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                  iIdInvestimento,
                  '',
                  wDtMov);
       if wSaldoQtd <> 0 then
          QryCarteiraGerenc.Last;

       QryCarteiraGerenc.Next;
   end;

   QryCarteiraGerenc.Close;

   //AL_17 - Ricardo - 23/12/2004
   if wSaldoQtd = 0 then
      Exit;
   //AL_17 - Fim

   // HistCota
   if wSaldoQtd > 0 then
   begin
   
     //AL_23 - Ricardo - 02/03/2005
     //AL_18 - Ricardo - 23/12/2004
     if wDtMov <= (pRPI.DATAULTFECH-60) then
        wDtMov := (pRPI.DATAULTFECH-60)+1;
     //AL_18 - Fim
     //AL_23 - Fim

     with qryAuxiliar do
     begin
        Close;
        SQL.Clear;
        SQL.Text := 'DELETE FROM HISTCOTA WHERE ' +
                    '(DATAHISTCOTA >= TO_DATE('''+DateToStr(wDtMov)+''',''DD/MM/YYYY'')) ';
        ExecSQL;
        Close;
     end;
  end;

  wSaldoQtd := 0;

end;

procedure TfrmCadOperAGENovo.QryDestinoGrupamentoQTDEDIREITOSetText(Sender: TField;
  const Text: String);
begin
  inherited;
   ProcQtdeDireitoDestino(Sender, QryDestinoGrupamentoQTDEDIREITO, Text, QryDestinoGrupamento);
end;

procedure TfrmCadOperAGENovo.QryDestinoRestCapQTDEDIREITOSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  ProcQtdeDireitoDestino(Sender, QryDestinoRestCapQTDEDIREITO, Text, QryDestinoRestCap);

  if iTipoOperacao = pRPI.IDTIPOOPERDIRRES Then
  begin
     QryDestinoRestCap.FieldByName('VALOREXERCIDO').AsFloat  :=
                   OperComum.DivValorZero(
                             QryDestinoRestCap.FieldByName('QTDEDIREITO').AsFloat,
                                     QryBuscaInvestimento.FieldByName('QTDELOTE').AsInteger)*
                                    (Reg.DIVPORACAO);

     If QryDestinoRestCap.FieldByName('VALOREXERCIDO').AsFloat = 0 Then
        QryDestinoRestCap.FieldByName('VALOREXERCIDO').AsFloat:=
                       QryDestinoRestCap.FieldByName('QTDEDIREITO').AsFloat*
                                     OperComum.BuscaCotacaoAcao(
                                               QryDestinoRestCap.FieldByName('IDINVESTIMENTO').AsInteger,
                                               StrToDate(edtDataEfetiva.Text), True);
  end;
end;

procedure TfrmCadOperAGENovo.dbgDestinoIncPerAltKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  Case Key Of
    VK_TAB: Key := 0;
    38, 40:
      If (TwwDBgridOption(dgEditing) in dbgDestinoSub.Options) and
         (QryDestinoIncPerAlt.State In [dsInsert, dsEdit]) Then
          Key := 0;
  End;
end;

//Al_34 - Ricardo - 26/04/2005 
procedure TfrmCadOperAGENovo.QryOrigemDivJurIRSetText(Sender: TField;
  const Text: String);
var eIr : Extended;
begin

   eIr   := StrToFloat(OperComum.StripChar(Text, '.'));

   QryOrigemDivJur.FieldByName('IR').ReadOnly := False;
   QryOrigemDivJur.FieldByName('IR').AsFloat  := eIr;

   if QryOperacaoDireito.FieldByName('IRLITIGIO').AsString <> 'S' then
      QryOrigemDivJur.FieldByName('VLRLIQ').AsFloat       :=
                      QryOrigemDivJur.FieldByName('VALOREXERCIDO').AsFloat-
                      QryOrigemDivJur.FieldByName('IR').AsFloat;   
   
   QryOrigemDivJurVLRLIQSetText(Sender, QryOrigemDivJur.FieldByName('VLRLIQ').AsString);
   
   QryOrigemDivJur.FieldByName('VLRLIQ').ReadOnly           := False;
end;
//Al_34 - Fim

end.

