// Rotina     : rptMapaRenVar
// SOL        : 170868
// Kintana    : 1533922
// Data       : 03/01/2012
// Responsável: Otacilio Aquino
// Descrição  : Implementação de ajuste no relatório de Mapa de MOvimentação
//              na quebra do relatorio.
//              Alterada a propriedade PrintHeight p/ phStatic  
//******************************************************************************
// Rotina     : rptMapaPosicaoRenVarCon / rptMapaPosicaoRenVar
// SOL        : 129458
// Kintana    : 709966
// Data       : 11/01/2010
// Responsável: Ricardo Cristiano
// Descrição  : Implementação de ajuste no relatório de Mapa de Posição do módulo
//               no totalizadores de plano e carteira
//******************************************************************************
// Rotina     : BDEMapaRenVa / BDEMapaPosicaoRenVar / BDEMapaPosRVGroup /
//              qryMapaRenVar 
// SOL        : 129154
// Kintana    : 705703
// Data       : 05/01/2010
// Responsável: Ricardo Cristiano
// Descrição  : Fazer a ligação dos componentes(query, datasource e report) e
//              incluir campos na query(componente) criados no sql do corpo do
//              programa.
//******************************************************************************
// Rotina     : MontaQuery()
// SOL        : 125637
// Kintana    : 649764
// Data       : 13/10/2009
// Responsável: William M. Santos
// Descrição  : Na Query que traz os registros na grid, estava sendo feita uma
//              divisão desnecessária para os Saldos de CC e CCI,
//              o saldo CC/CCI correto é o resultado da conta (QTDECC * COTACAO)
//              e não (QTDECC * COTACAO)/LOTE, pois na propria query a cotação
//              ja estava sendo divida pelo lote mais abaixo no corpo da query.
//******************************************************************************
// Rotina     : cbxContaCorrenteChange(), CalculaRodape(), bt_ImprimeClick()
// SOL        : 125084
// Kintana    : 641687
// Data       : 30/09/2009
// Responsável: William M. Santos
// Descrição  : Recompilação para concertar erro de pacote. referente ao chamado 122648-605169.
//******************************************************************************
// Rotina     : MontaQuery()
// SOL        : 122648
// Kintana    : 605169
// Data       : 10/09/2009
// Responsável: William M. Santos
// Descrição  : Implementação da quantidade CC/CCI e saldo CC/CCI na grid e nos relatórios.
//******************************************************************************
// Data      : 27/05/2008
// Código    : AL_29
// Pendência : 27960
// SOL       : 85996
// Motivo    : Ajuste na implementação de Entradas e Saidas p/ Transf. Carteiras
//******************************************************************************
// Data      : 04/12/2007
// Código    : AL_28
// Pendência : 26796
// SOL       : 72526
// Motivo    : Ajuste para dispensar operações de Anúncio de Provento e
//               Cancelamento de Proventos
//******************************************************************************
// Data      : 03/08/2007
// Código    : AL_27
// Pendência : 24957
// SOL       : 56201
// Motivo    : Implementação de Saldo Consolidado por Investimento Agrupado ou não
//             pelas carteiras. Este AL foi acertado por mim, favor observar a
//             numeração até o início em caso de dúvida.
//******************************************************************************
// Data      : 14/10/2007
// Código    : AL_24
// Pendência : 
// SOL       :
// Motivo    : Implementação filtro de TipoInvest IsNull para as Carteiras
//******************************************************************************
// Data      : 11/10/2007
// Código    : AL_23
// Pendência : 26459
// SOL       : 70186
// Motivo    : Implementação de Entradas e Saidas para Transf. Carteira
//******************************************************************************
// Data      : 02/05/2007
// Código    : AL_22
// Pendência : 25197/25198/25199
// SOL       : 53035
// Motivo    : Implementação de ajuste na totalização do plano e carteira
//******************************************************************************
// Data      : 25/04/2007
// Código    : AL_21
// Pendência : 25197/25198/25199
// SOL       : 53035
// Motivo    : Implementação que permiti tirar o relatório agrupado pelas
//             carteiras(qryMapaRenVar,rptMapaPosicaoRenVar,BDEMapaPosicaoRenVar
//             rptMapaPosRVGroup, BDEMapaPosRVGroup, rptMapaMovRVGroup, DBEMapaMovRVGroup,
//             rptMapaCustoRVGroup e BDEMapaCustoRVGroup).
//******************************************************************************
// Data      : 17/04/2007
// Código    : AL_20
// Pendencia : 25090
// Cod.Cli.  : 58262
// Desc      : Ajuste na seleção dos valores de Direito de Subscrição
//******************************************************************************
// Data      : 10/04/2007
// Código    : AL_19
// Pendencia : 22977
// SOL       :
// Desc      : Ajuste na seleção dos valores de restituição de capital
//******************************************************************************
// Data     : 14/03/2007
// Código   : AL_18
// Pendencia: 23275
// SOL      : 46150
// Desc     : Implementação da coluna "Cód.BOVESPA" do papel
//******************************************************************************
// Data      : 18/10/2006
// Código    : AL_17
// Pendencia : 23558
// SOL       :
// Desc      : Ajuste no Mapa de Movimentação para mostrar a o valor e a quantidade
//               transferido entre planos corretamente. (SQL).
//******************************************************************************
// Data      : 10/10/2006
// Código    : AL_26
// Pendência : 22967
// SOL       :
// Motivo    : Implementação da transferência afetando o valor de saida e entrada
//******************************************************************************
// Data      : 10/10/2006
// Código    : AL_25
// Pendência : 22967
// SOL       :
// Motivo    : Implementação dos campos de quantidade(VLRTRPBAIXA, QTDTRPBAIXA, VLRTRPACRESC, QTDTRPACRESC)
//******************************************************************************
// Data      : 10/10/2006
// Código    : AL_24
// Pendência : 22967
// SOL       :
// Motivo    : Ajuste na rotina da qryMapaRenVar que trata as vendas e compras,
//             que não identificava o tipo de movimento, já que exite a transferencia "TRP".
//******************************************************************************
// Data      : 13/09/2006
// Código    : AL_23
// Pendência : 22967
// SOL       :
// Motivo    : Segregação de Planos
//******************************************************************************
// Data      : 26/05/2006
// Código    : AL_22
// Pendência : 22364
// SOL       : 43225
// Motivo    : Implementação da data e hora no rodapé do relatório mapa de mov.
//******************************************************************************
// Data      : 09/05/2006
// Código    : AL_21
// Pendencia : 21408
// SOL       : 40084
// Motivo    : Otimizada a qryMapaRenVar.
//******************************************************************************
// Data      : 09/03/2006
// Código    : AL_20
// Pendência : 21267
// SOL       : 42354
// Motivo    : Aumento em duas cadas decimais o PU de Custo - de 8 foi para 10
//******************************************************************************
// Data      : 09/03/2006
// Código    : AL_19
// Pendência : 21267
// SOL       : 39857
// Motivo    : Acerto na Paginação dos Relatório - a propriedade PassSettin deve estar
//             igual a psTwoPass
//******************************************************************************
// Data      : 18/01/2006
// Código    : AL_18
// Pendência : 233367
// SOL       : 21140
// Motivo    : Tratamento de divisão por zero (que não colocaram)
//******************************************************************************
// Data     : 09/12/2005
// Código   : AL_17
// Motivo   : Ajuste no lay-out do relatório Mapa de Custo
//******************************************************************************
// Data     : 04/11/2005
// Código   : AL_16
// Motivo   : Ajuste na qryMapaRenVar, do item de variação qdo a ação for de provisião para perda e
//            vendida
//******************************************************************************
// Data     : 03/11/2005
// Código   : AL_15
// Motivo   : Ajuste na qryMapaRenVar, para qdo o saldo de qtd. da ação for zero
//            näo trazer o saldo financeiro para ações que estáo provisionadas para perda.
//******************************************************************************
// Data     : 25/10/2005
// Código   : AL_14
// Motivo   : Ajuste na qry, para não tazer registros das operações de recebimento
//******************************************************************************
// Data     : 20/10/2005
// Código   : AL_13
// Motivo   : Alteração nas qrys para não trazer operacões de Recebimento Fracionado
//            IDTIPOOPERRFRAC
//******************************************************************************
// Data     : 19/10/2005
// Código   : AL_13
// Motivo   : Ajuste no SQL da query Round na Cotação com 8 casas decimais
//******************************************************************************
// Data     : 05/10/2005
// Código   : AL_12
// Motivo   : Alteração das clonas de compra e venda para entrada e saída
//******************************************************************************
// Data     : 04/10/2005
// Código   : AL_11
// Motivo   : Implementação da coluna com "*" para identificar a ocorrecia de ajuste
//******************************************************************************
// Data     : 16/09/2005
// Código   : AL_10
// Motivo   : Ajuste no campo VARIACAO, falta NVL() no campo VLRRESTITUICAO
//******************************************************************************
// Data     : 16/09/2005
// Código   : AL_9
// Motivo   : Implementado da coluna de Restituição de Capital e mudança do lay-out
//            do Relatório
//******************************************************************************
// Data     : 15/09/2005
// Código   : AL_8
// Motivo   : Implementado a redução da restituição de capital na variação
//******************************************************************************
// Data     : 05/09/2005
// Código   : AL_7
// Motivo   : Acerto no PU de Custo para tirar as subscrições
//******************************************************************************
// Data     : 01/09/2005
// Código   : AL_6
// Motivo   : Retirado o filtro de NATURMOVCARTINV <> 'R'
//******************************************************************************
// Data     : 30/08/2005
// Código   : AL_5
// Motivo   : Retirado os Vlr de Venda e SaldoAqui (=0) qdo o tipo de operação for
//            DIREITO DE SUBSCRICAO na qryMapaRenVar
//******************************************************************************
// Data     : 29/08/2005
// Código   : AL_4
// Motivo   : Retirado os Vlr de Compra e SaldoAqui (=0) qdo o tipo de operação for
//            DIREITO DE SUBSCRICAO na qryMapaRenVar
//******************************************************************************
// Data     : 16/08/2005
// Código   : AL_3
// Motivo   : Acerto no cálculo de Vendas e Variação e Round,2 no Custo
//******************************************************************************
// Data     : 05/08/2005
// Código   : AL_2
// Motivo   : Implementação do Relatório de Custo e Posição
//******************************************************************************
// Data     : 27/07/2005
// Código   : AL_1
// Motivo   : Ajuste na query e no layout do relatório (dfm e pas)
//******************************************************************************
// Data     : 25/07/2005
// Código   :
// Motivo   : Implementação da Consulta e Relatório Mapa de Variação de R.Variavel
//******************************************************************************

unit FDmRelMapaRenVar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, Db, ppCtrls, ppBands, ppClass, ppReport, ppStrtch,
  ppSubRpt, ppDB, ppVar, ppPrnabl, ppCache, ppProd, DBTables, Wwquery,
  Wwdatsrc, ppComm, ppRelatv, ppDBPipe, ppDBBDE, ppModule, daDataModule,
  ppMemo,
  //AL_18
  UOperComum, uCMFileUtils,
  //AL_21 
  ppParameter, ppRichTx, raCodMod;

type
  TDmRelMapaRenVar = class(TDmRelatoriosInv)
    BDEMapaRenVar: TppBDEPipeline;
    rptMapaRenVar: TppReport;
    pphbRMov: TppHeaderBand;
    ppShape9: TppShape;
    lblVariacao: TppLabel;
    lblSaldoAnterior: TppLabel;
    lblVendas: TppLabel;
    lblCompras: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    lblPeriodo: TppLabel;
    ppDBImage4: TppDBImage;
    pplblDescInvest: TppLabel;
    ppDetailBand10: TppDetailBand;
    ppFooterBand9: TppFooterBand;
    ppSystemVariable17: TppSystemVariable;
    ppLabel82: TppLabel;
    ppLine28: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText1: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppdbSumSldAnterior: TppDBCalc;
    ppLabel10: TppLabel;
    ppdbSumVlrAplicado: TppDBCalc;
    ppdbSumVlrIOF: TppDBCalc;
    ppdbSumVlrResgate: TppDBCalc;
    ppdbSumSldFundo: TppDBCalc;
    ppLine4: TppLine;
    dsMapaRenVar: TwwDataSource;
    qryCarteira: TwwQuery;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    qryCarteiraDESCCARTINVEST: TStringField;
    lblQtdAnterior: TppLabel;
    lblVlrSaldoAnt: TppLabel;
    lblQtdCompras: TppLabel;
    lblVlrCompras: TppLabel;
    lblQtdVendas: TppLabel;
    lblVlrVendas: TppLabel;
    shpCarteira: TppShape;
    BDEMapaCustoRenVar: TppBDEPipeline;
    rptMapaCustoRenVar: TppReport;
    pphbRCusto: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    lblPeriodoCusto: TppLabel;
    ppDBImage1: TppDBImage;
    ppLabel8: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppShape2: TppShape;
    dbPUMedio: TppDBText;
    ppDBText8: TppDBText;
    ppdbSldQtd: TppDBText;
    ppdbSaldoAqui: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppLabel22: TppLabel;
    ppLine1: TppLine;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape3: TppShape;
    ppDBText14: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel23: TppLabel;
    dbSumSaldoAquiPlan: TppDBCalc;
    ppLine2: TppLine;
    rptMapaPosicaoRenVar: TppReport;
    pphbRPos: TppHeaderBand;
    ppShape4: TppShape;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    lblPeriodoPosicao: TppLabel;
    ppDBImage2: TppDBImage;
    ppLabel31: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel39: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape5: TppShape;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText22: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable3: TppSystemVariable;
    ppLabel43: TppLabel;
    ppLine3: TppLine;
    ppSystemVariable4: TppSystemVariable;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppShape6: TppShape;
    //Ricardo Cristiano - 11/01/2010 - N. Sol 129458 -  N. Kintana 709966
    ppdbDescCarteiraPos: TppDBText;
    ppgMPosPlanPrev: TppGroupFooterBand;
    ppLabel44: TppLabel;
    ppLine5: TppLine;
    BDEMapaPosicaoRenVar: TppBDEPipeline;
    ppShape1: TppShape;
    ppSystemVariable2: TppSystemVariable;
    lblRestCapital: TppLabel;
    ppDBCalc1: TppDBCalc;
    lblSaldoAtual: TppLabel;
    lblQtdAtu: TppLabel;
    lblVlrSaldoAtu: TppLabel;
    ppLine6: TppLine;
    ppDBText7: TppDBText;
    //AL_21
    ppSummaryBand1: TppSummaryBand;
    ppLine10: TppLine;
    ppLabel2: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppSummaryBand2: TppSummaryBand;
    ppLine12: TppLine;
    ppLabel3: TppLabel;
    dbSumSaldoAquiGeral: TppDBCalc;
    ppSummaryBand3: TppSummaryBand;
    ppLabel4: TppLabel;
    ppLine14: TppLine;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    lblPUMedPlan: TppLabel;
    dbTotQtdPlan: TppDBCalc;
    lblPUMedCartGeral: TppLabel;
    dbTotQtdGeral: TppDBCalc;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppgMPosCarteira: TppGroupFooterBand;
    lblPlanPatroRPos: TppDBText;
    qryPlanoPatro: TwwQuery;
    qryPlanoPatroIDPLANPREVCTBPATR: TFloatField;
    qryPlanoPatroIDPLANOPREV: TFloatField;
    qryPlanoPatroIDPATRO: TFloatField;
    qryPlanoPatroPLANPRVCONTABPATRO: TStringField;
    shpTotalCarteira: TppShape;
    ppShape7: TppShape;
    ppLabel7: TppLabel;
    ppLine7: TppLine;
    ppDBText6: TppDBText;
    ppDBText9: TppDBText;
    lblPlanPatroRCusto: TppDBText;
    lblPlanPatroRMov: TppDBText;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel12: TppLabel;
    ppLine8: TppLine;
    dbTotQtdCart: TppDBCalc;
    lblPUMedCart: TppLabel;
    dbSumSaldoAquiCart: TppDBCalc;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLabel14: TppLabel;
    ppLine9: TppLine;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBText4: TppDBText;
    ppLabel9: TppLabel;
    //AL_21
    rptMapaPosRVGroup: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    lblPeriodoPosGroup: TppLabel;
    ppDBImage3: TppDBImage;
    ppDBText5: TppDBText;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppSystemVariable5: TppSystemVariable;
    ppLabel27: TppLabel;
    ppLine11: TppLine;
    ppSystemVariable7: TppSystemVariable;
    ppSummaryBand4: TppSummaryBand;
    ppLine13: TppLine;
    ppLabel30: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppShape11: TppShape;
    ppLabel32: TppLabel;
    ppLine15: TppLine;
    ppDBText26: TppDBText;
    BDEMapaPosRVGroup: TppBDEPipeline;
    DBEMapaMovRVGroup: TppBDEPipeline;
    ppParameterList1: TppParameterList;
    ppShape15: TppShape;
    ppMemoPosGroup: TppMemo;
    ppLabel40: TppLabel;
    qryCarteiraFLGCARTPROP: TFloatField;
    rptMapaCustoRVGroup: TppReport;
    BDEMapaCustoRVGroup: TppBDEPipeline;
    //AL_27
    rptMapaPosicaoRenVarCon: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppShape18: TppShape;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppDBImage7: TppDBImage;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppShape20: TppShape;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppSystemVariable12: TppSystemVariable;
    ppLabel86: TppLabel;
    ppLine23: TppLine;
    ppSystemVariable13: TppSystemVariable;
    ppSummaryBand7: TppSummaryBand;
    ppLine24: TppLine;
    ppLabel87: TppLabel;
    ppDBCalc33: TppDBCalc;
    ppGroup11: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppShape22: TppShape;
    //Ricardo Cristiano - 11/01/2010 - N. Sol 129458 -  N. Kintana 709966
    ppdbDescCarteiraCons: TppDBText;
    //Ricardo Cristiano - 11/01/2010 - N. Sol 129458 -  N. Kintana 709966
    ppgMPosCarteiraCons: TppGroupFooterBand;
    ppShape23: TppShape;
    ppLine26: TppLine;
    ppLabel89: TppLabel;
    ppDBText56: TppDBText;
    pplMapaPosicaoRenVarCon: TppBDEPipeline;
    QryMapaRenVarCon: TwwQuery;
    StringField3: TStringField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    StringField4: TStringField;
    StringField5: TStringField;
    FloatField12: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField13: TFloatField;
    DtsMapaRenVarCon: TwwDataSource;
    pplMapaPosRVGroupCon: TppBDEPipeline;
    rptMapaPosRVGroupCon: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppShape24: TppShape;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppDBImage8: TppDBImage;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppShape25: TppShape;
    MemoMovGroupCon: TppMemo;
    ppLabel100: TppLabel;
    ppDetailBand7: TppDetailBand;
    ppShape26: TppShape;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppSystemVariable14: TppSystemVariable;
    ppLabel101: TppLabel;
    ppLine27: TppLine;
    ppSystemVariable15: TppSystemVariable;
    ppSummaryBand8: TppSummaryBand;
    ppLine29: TppLine;
    ppLabel102: TppLabel;
    ppDBCalc34: TppDBCalc;
    ppParameterList2: TppParameterList;
    ppLabel88: TppLabel;
    ppLabel103: TppLabel;
    QryMapaRenVarConSALDOQTDEINVCART_1: TFloatField;
    QryMapaRenVarConQTDECC: TFloatField;
    QryMapaRenVarConSALDOVLRCC: TFloatField;
    QryMapaRenVarConSALDOVLRCCI: TFloatField;
    QryMapaRenVarConQTDECCI: TFloatField;
    qrySegmentacao: TwwQuery;
    qrySegmentacaoDESCSEGMENTACAO: TStringField;
    qrySegmentacaoIDSEGMENTACAO: TFloatField;
    qryMapaRenVar: TwwQuery;
    qryMapaRenVarSTAAJUSTEQTD: TStringField;
    qryMapaRenVarPLANPRVCONTABPATRO: TStringField;
    qryMapaRenVarDESCINVESTIMENTO: TStringField;
    qryMapaRenVarSALDOQTDEINVCARTANT: TFloatField;
    D: TFloatField;
    qryMapaRenVarQTDECOMPRAS: TFloatField;
    qryMapaRenVarVLRCOMPRAS: TFloatField;
    qryMapaRenVarQTDEVENDAS: TFloatField;
    qryMapaRenVarVLRVENDAS: TFloatField;
    qryMapaRenVarVLRRESTCAPITAL: TFloatField;
    qryMapaRenVarSALDOQTDEINVCART: TFloatField;
    qryMapaRenVarSALDOVLRINVCART: TFloatField;
    qryMapaRenVarDESCCARTINVEST: TStringField;
    qryMapaRenVarPUCUSTO: TFloatField;
    qryMapaRenVarSALDOAQUI: TFloatField;
    qryMapaRenVarSIGLAACAOBOLSA: TStringField;
    qryMapaRenVarLOTE: TFloatField;
    qryMapaRenVarDATACOTACAO: TDateTimeField;
    qryMapaRenVarCOTACAO: TFloatField;
    qryMapaRenVarVARIACAO: TFloatField;
    qryMapaRenVarQTDAJUSTE: TFloatField;
    qryMapaRenVarVLRAJUSTE: TFloatField;
    qryMapaRenVarDIF: TFloatField;
    qryMapaRenVarCUSTOAJUSTE: TFloatField;
    qryMapaRenVarSTAAJUSTECUSTO: TStringField;
    qryMapaRenVarSALDOPLANO: TFloatField;
    qryMapaRenVarSALDOCART: TFloatField;
    qryMapaRenVarSALDOINV: TFloatField;
    qryMapaRenVarVLRTRPBAIXA: TFloatField;
    qryMapaRenVarQTDTRPBAIXA: TFloatField;
    qryMapaRenVarVLRTRPACRESC: TFloatField;
    qryMapaRenVarQTDTRPACRESC: TFloatField;
    qryMapaRenVarSALDOGERAL: TFloatField;
    qryMapaRenVarDESCSEGMENTACAO: TStringField;
    BDEMapaRenVarOutros: TppBDEPipeline;
    qryMapaRenVarOutros: TwwQuery;
    dsMapaRenVarOutros: TwwDataSource;
    qryMapaRenVarIDSEGMENTACAO: TFloatField;
    qryMapaRenVarOutrosIDSEGMENTACAO: TFloatField;
    qryMapaRenVarOutrosDESCSEGMENTACAO: TStringField;
    qryMapaRenVarOutrosSALDOVLRINVCART: TFloatField;
    qryMapaRenVarOutrosSALDOAQUI: TFloatField;
    qryMapaRenVarOutrosPUCUSTO: TFloatField;
    qryMapaRenVarOutrosVLRRESTCAPITAL: TFloatField;
    qryMapaRenVarOutrosSALDOQTDEINVCARTANT: TFloatField;
    qryMapaRenVarOutrosSALDOVLRINVCARTANT: TFloatField;
    qryMapaRenVarOutrosVARIACAO: TFloatField;
    qryMapaRenVarOutrosQTDECOMPRAS: TFloatField;
    qryMapaRenVarOutrosVLRCOMPRAS: TFloatField;
    qryMapaRenVarOutrosQTDEVENDAS: TFloatField;
    qryMapaRenVarOutrosVLRVENDAS: TFloatField;
    qryMapaRenVarOutrosDIF: TFloatField;
    qryMapaRenVarOutrosQTDAJUSTE: TFloatField;
    qryMapaRenVarOutrosVLRAJUSTE: TFloatField;
    qryMapaRenVarOutrosCUSTOAJUSTE: TFloatField;
    qryMapaRenVarOutrosVLRTRPBAIXA: TFloatField;
    qryMapaRenVarOutrosQTDTRPBAIXA: TFloatField;
    qryMapaRenVarOutrosPLANPRVCONTABPATRO: TStringField;
    qrySegmentacaoIDGRUPO: TFloatField;
    qryMapaRenVarOutrosDESCCARTINVEST: TStringField;
    ppGroup10: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppDBText2: TppDBText;
    ppShape28: TppShape;
    ppDBText3: TppDBText;
    ppDBText11: TppDBText;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppDBText71: TppDBText;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBCalc35: TppDBCalc;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppShape29: TppShape;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppLabel122: TppLabel;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    //Ricardo Cristiano - 05/01/2010 - N. Sol 129154 -  N. Kintana 705703
    qryMapaRenVarQTDECC: TFloatField;
    qryMapaRenVarSALDOVLRCC: TFloatField;
    qryMapaRenVarSALDOVLRCCI: TFloatField;
    qryMapaRenVarQTDECCI: TFloatField;
    qryMapaRenVarSALDOPLANOCC: TFloatField;
    qryMapaRenVarSALDOCARTCC: TFloatField;
    qryMapaRenVarSALDOINVCC: TFloatField;
    qryMapaRenVarSALDOGERALCC: TFloatField;
    qryMapaRenVarSALDOPLANOCCI: TFloatField;
    qryMapaRenVarSALDOCARTCCI: TFloatField;
    qryMapaRenVarSALDOINVCCI: TFloatField;
    qryMapaRenVarSALDOGERALCCI: TFloatField;
    ppDBText25: TppDBText;
    ppLabel126: TppLabel;
    ppShape30: TppShape;
    ppLabel127: TppLabel;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    ppLabel131: TppLabel;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand8: TppDetailBand;
    ppShape32: TppShape;
    ppSummaryBand9: TppSummaryBand;
    ppDBText10: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText18: TppDBText;
    ppDBText21: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppShape8: TppShape;
    ppLabel16: TppLabel;
    ppLabel26: TppLabel;
    ppLabel17: TppLabel;
    ppLabel21: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel18: TppLabel;
    ppLabel132: TppLabel;
    qryMapaRenVarOutrosLOTE: TFloatField;
    qryMapaRenVarOutrosCOTACAO: TFloatField;
    qryMapaRenVarOutrosSALDOQTDEINVCART: TFloatField;
    ppLabel128: TppLabel;
    ppLabel133: TppLabel;
    ppLabel134: TppLabel;
    ppLine25: TppLine;
    qryMapaRenVarOutrosSALDOPLANO: TFloatField;
    ppLabel135: TppLabel;
    ppDBText81: TppDBText;
    ppShape10: TppShape;
    ppParameterList3: TppParameterList;
    ppHeaderBand3: TppHeaderBand;
    ppShape16: TppShape;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    lblPeriodoCustoGroup: TppLabel;
    ppDBImage6: TppDBImage;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppDBText39: TppDBText;
    ppShape19: TppShape;
    ppMemoCustoGroup: TppMemo;
    ppLabel66: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppShape31: TppShape;
    ppLabel136: TppLabel;
    ppLabel137: TppLabel;
    ppLabel138: TppLabel;
    ppLabel139: TppLabel;
    ppDetailBand11: TppDetailBand;
    ppShape33: TppShape;
    ppDBText55: TppDBText;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppSummaryBand11: TppSummaryBand;
    ppShape34: TppShape;
    ppLabel143: TppLabel;
    ppDBText84: TppDBText;
    raCodeModule1: TraCodeModule;
    ppFooterBand5: TppFooterBand;
    ppLabel70: TppLabel;
    ppSystemVariable10: TppSystemVariable;
    ppLine20: TppLine;
    ppSystemVariable11: TppSystemVariable;
    ppSummaryBand6: TppSummaryBand;
    ppLine21: TppLine;
    ppLabel71: TppLabel;
    ppDBCalc29: TppDBCalc;
    ppLabel72: TppLabel;
    ppDBCalc30: TppDBCalc;
    ppGroup9: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppLabel73: TppLabel;
    ppDBCalc31: TppDBCalc;
    ppLine22: TppLine;
    ppLabel74: TppLabel;
    ppDBCalc32: TppDBCalc;
    raCodeModule2: TraCodeModule;
    ppDBText40: TppDBText;
    ppLabel140: TppLabel;
    ppDBText41: TppDBText;
    rptMapaMovRVGroup: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppShape12: TppShape;
    ppLabel15: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    lblPosicaoMovGroup: TppLabel;
    ppDBImage5: TppDBImage;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLine16: TppLine;
    ppDBText27: TppDBText;
    ppShape14: TppShape;
    ppMemoMovGroup: TppMemo;
    ppLabel48: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppShape13: TppShape;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppShape21: TppShape;
    ppLabel106: TppLabel;
    ppLabel114: TppLabel;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppLabel111: TppLabel;
    ppLabel113: TppLabel;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppLabel112: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppShape27: TppShape;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBCalc9: TppDBCalc;
    ppDBText38: TppDBText;
    ppDBText44: TppDBText;
    ppDBText33: TppDBText;
    ppSummaryBand10: TppSummaryBand;
    ppdbSegmentacao: TppDBText;
    ppDBText46: TppDBText;
    ppDBText54: TppDBText;
    ppDBText57: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppSystemVariable8: TppSystemVariable;
    ppLabel60: TppLabel;
    ppLine17: TppLine;
    ppSystemVariable9: TppSystemVariable;
    ppSummaryBand5: TppSummaryBand;
    ppLabel61: TppLabel;
    ppLine18: TppLine;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppLabel62: TppLabel;
    ppLine19: TppLine;
    ppDBCalc23: TppDBCalc;
    ppDBCalc24: TppDBCalc;
    ppDBCalc25: TppDBCalc;
    ppDBCalc26: TppDBCalc;
    ppDBCalc27: TppDBCalc;
    ppDBCalc28: TppDBCalc;
    QryMapaRenVarConIDSEGMENTACAO: TFloatField;
    QryMapaRenVarConDESCSEGMENTACAO: TStringField;
    ppGroup12: TppGroup;
    ppGroupHeaderBand12: TppGroupHeaderBand;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppShape17: TppShape;
    ppDBText42: TppDBText;
    //AL_21
    procedure shpDetalhePrint(Sender: TObject);
    procedure ppGroupFooterBand1AfterPrint(Sender: TObject);
    procedure rptMapaRenVarBeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure rptMapaPosicaoRenVarBeforePrint(Sender: TObject);
    procedure rptMapaCustoRenVarBeforePrint(Sender: TObject);
    procedure ppGroupFooterBand2AfterPrint(Sender: TObject);
    procedure ppgMPosPlanPrevAfterPrint(Sender: TObject);
    procedure lblPUMedPlanPrint(Sender: TObject);
    //AL_21
    procedure lblPUMedCartGeralPrint(Sender: TObject);
    procedure ppgMPosPlanPrevBeforePrint(Sender: TObject);
    procedure ppGroupFooterBand2BeforePrint(Sender: TObject);
    procedure lblPlanPatroRPosPrint(Sender: TObject);
    procedure pphbRPosBeforePrint(Sender: TObject);
    procedure lblCabPlanPatroRPosPrint(Sender: TObject);
    procedure ppgMPosCarteiraAfterPrint(Sender: TObject);
    procedure ppgMPosCarteiraBeforePrint(Sender: TObject);
    procedure lblPUMedCartPrint(Sender: TObject);
    procedure qryMapaRenVarOutrosAfterScroll(DataSet: TDataSet);
    procedure ppdbDescCarteiraPosPrint(Sender: TObject);
    //Ricardo Cristiano - 11/01/2010 - N. Sol 129458 -  N. Kintana 709966
    procedure ppdbDescCarteiraConsPrint(Sender: TObject);
    //Ricardo Cristiano - 11/01/2010 - N. Sol 129458 -  N. Kintana 709966
    procedure ppgMPosCarteiraConsAfterPrint(Sender: TObject);
    //Ricardo Cristiano - 11/01/2010 - N. Sol 129458 -  N. Kintana 709966
    procedure ppgMPosCarteiraConsBeforePrint(Sender: TObject);
    //AL_21
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
    //AL_21
    function MontaQuery(dDataAntGroup, dDataIniGroup, dDataFimGroup : TDateTime;
                        sPlanPrevGroup, sCartInvestGroup, sGroup, sCarteirasGroup, sSegmentacao : String) : Boolean;
  end;

var
  DmRelMapaRenVar : TDmRelMapaRenVar;
  //AL_21
  wCount          : Integer;
  //AL_23
  wCountPlan      : Integer;

  //Ricardo Cristiano - 11/01/2010 - N. Sol 129458 -  N. Kintana 709966
  sCarteira       : String;
  sPlanoPatr      : String;  

implementation

{$R *.DFM}

procedure TDmRelMapaRenVar.shpDetalhePrint(Sender: TObject);
begin
  inherited;
  if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelMapaRenVar.ppGroupFooterBand1AfterPrint(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3
end;

procedure TDmRelMapaRenVar.rptMapaRenVarBeforePrint(Sender: TObject);
begin
   inherited;
   //AL_21
   cCorZebra := $00E3E3E3;
   wCount := 0;
   //AL_23
   wCountPlan := 0;

   //Ricardo Cristiano - 11/01/2010 - N. Sol 129458 -  N. Kintana 709966
   sCarteira  := '';
   sPlanoPatr := '';    
end;

procedure TDmRelMapaRenVar.ppGroupFooterBand1BeforePrint(Sender: TObject);
begin
  inherited;
  //AL_21
  if wCount > 1 then
     ppGroupFooterBand1.Visible := True
  else
     ppGroupFooterBand1.Visible := False;
  wCount := 0;
end;

procedure TDmRelMapaRenVar.rptMapaPosicaoRenVarBeforePrint(Sender: TObject);
begin
  inherited;
   //AL_21
   cCorZebra := $00E3E3E3;
   wCount := 0;
   //AL_23
   wCountPlan := 0;
end;

procedure TDmRelMapaRenVar.rptMapaCustoRenVarBeforePrint(Sender: TObject);
begin
  inherited;
   //AL_21
   cCorZebra := $00E3E3E3;
   wCount := 0;
   //AL_23
   wCountPlan := 0;
end;

procedure TDmRelMapaRenVar.ppGroupFooterBand2AfterPrint(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3
end;

procedure TDmRelMapaRenVar.ppgMPosPlanPrevAfterPrint(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3
end;

procedure TDmRelMapaRenVar.lblPUMedPlanPrint(Sender: TObject);
begin
  //AL_23
  lblPUMedPlan.Caption := FormatFloat(dbPUMedio.DisplayFormat, (OperComum.DivValorZero(dbSumSaldoAquiPlan.Value,dbTotQtdPlan.Value)));
  inherited;
end;

//AL_21
procedure TDmRelMapaRenVar.lblPUMedCartGeralPrint(Sender: TObject);
begin
  inherited;
  lblPUMedCartGeral.Caption := FormatFloat(dbPUMedio.DisplayFormat, (OperComum.DivValorZero(dbSumSaldoAquiGeral.Value,dbTotQtdGeral.Value)));
end;

//AL_21
procedure TDmRelMapaRenVar.ppgMPosPlanPrevBeforePrint(Sender: TObject);
begin
  inherited;
  if wCountPlan > 1 then
     ppgMPosPlanPrev.Visible := True
  else
     ppgMPosPlanPrev.Visible := False;
end;

procedure TDmRelMapaRenVar.ppGroupFooterBand2BeforePrint(Sender: TObject);
begin
  inherited;
  if wCount > 1 then
     ppGroupFooterBand2.Visible := True
  else
     ppGroupFooterBand2.Visible := False;

  wCount := 0;
end;

procedure TDmRelMapaRenVar.lblPlanPatroRPosPrint(Sender: TObject);
begin
   inherited;
   //Ricardo Cristiano - 11/01/2010 - N. Sol 129458 -  N. Kintana 709966
   if Trim(sPlanoPatr) <> Trim(qryMapaRenVar.FieldByName('PLANPRVCONTABPATRO').AsString) then
      wCountPlan := wCountPlan + 1;

   sPlanoPatr := qryMapaRenVar.FieldByName('PLANPRVCONTABPATRO').AsString;
end;

//AL_23
procedure TDmRelMapaRenVar.pphbRPosBeforePrint(Sender: TObject);
begin
   inherited;
   
end;

//AL_23
procedure TDmRelMapaRenVar.lblCabPlanPatroRPosPrint(Sender: TObject);
begin
   inherited;
   
end;

//AL_23
procedure TDmRelMapaRenVar.ppgMPosCarteiraAfterPrint(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3
end;

//AL_23
procedure TDmRelMapaRenVar.ppgMPosCarteiraBeforePrint(Sender: TObject);
begin
  inherited;
  if wCount > 1 then
     ppgMPosCarteira.Visible := True
  else
     ppgMPosCarteira.Visible := False;
end;

procedure TDmRelMapaRenVar.lblPUMedCartPrint(Sender: TObject);
begin
  //AL_18
  lblPUMedCart.Caption := FormatFloat(dbPUMedio.DisplayFormat, (OperComum.DivValorZero(dbSumSaldoAquiCart.Value,dbTotQtdCart.Value)));
  inherited;
end;

//AL_21
function TDmRelMapaRenVar.MontaQuery(dDataAntGroup, dDataIniGroup, dDataFimGroup : TDateTime;
                                     sPlanPrevGroup, sCartInvestGroup, sGroup, sCarteirasGroup, sSegmentacao : String) : Boolean;
//AL_22
var QryAuxiliar : TwwQuery ;

begin
   try
     try
        QryAuxiliar :=TwwQuery.Create(Self);
        QryAuxiliar.DataBaseName:='BASEDADOS';
        QryAuxiliar.SQL.Add('SELECT IDCARTEIRAINVEST FROM CARTEIRAINVEST WHERE IDCARTEIRAINVEST IN ('+sCarteirasGroup+')');
        QryAuxiliar.Open;

        qryMapaRenVarOutros.DisableControls;
        qryMapaRenVarOutros.Filter := '';
        qryMapaRenVarOutros.Filtered := False;

        OperComum.LimpaParametros(qryMapaRenVarOutros);
        qryMapaRenVarOutros.sql.Clear;

        qryMapaRenVarOutros.SQL.Add('SELECT TOT.PLANPRVCONTABPATRO, TOT.IDSEGMENTACAO, TOT.DESCSEGMENTACAO, TOT.DESCCARTINVEST,');
        qryMapaRenVarOutros.SQL.Add('SUM(TOT.SALDOVLRINVCART) AS SALDOVLRINVCART, SUM(TOT.SALDOAQUI) AS SALDOAQUI, SUM(TOT.PUCUSTO) AS PUCUSTO,');
        qryMapaRenVarOutros.SQL.Add('SUM(TOT.VLRRESTCAPITAL) AS VLRRESTCAPITAL, SUM(TOT.SALDOQTDEINVCARTANT) AS SALDOQTDEINVCARTANT,');
        qryMapaRenVarOutros.SQL.Add('SUM(TOT.SALDOVLRINVCARTANT) AS SALDOVLRINVCARTANT, SUM(TOT.VARIACAO) AS VARIACAO, SUM(TOT.QTDECOMPRAS) AS QTDECOMPRAS,');
        qryMapaRenVarOutros.SQL.Add('SUM(TOT.VLRCOMPRAS) AS VLRCOMPRAS, SUM(TOT.QTDEVENDAS) AS QTDEVENDAS, SUM(TOT.VLRVENDAS) AS VLRVENDAS,');
        qryMapaRenVarOutros.SQL.Add('SUM(TOT.DIF) AS DIF, SUM(TOT.QTDAJUSTE) AS QTDAJUSTE, SUM(TOT.VLRAJUSTE) AS VLRAJUSTE, SUM(TOT.CUSTOAJUSTE) AS CUSTOAJUSTE,');
        qryMapaRenVarOutros.SQL.Add('SUM(TOT.VLRTRPBAIXA) AS VLRTRPBAIXA, SUM(TOT.QTDTRPBAIXA) AS QTDTRPBAIXA, SUM(TOT.LOTE) AS LOTE, SUM(TOT.COTACAO) AS COTACAO,');
        qryMapaRenVarOutros.SQL.Add('SUM(TOT.SALDOQTDEINVCART) AS SALDOQTDEINVCART, TOT.SALDOPLANO AS SALDOPLANO FROM');
        qryMapaRenVarOutros.SQL.Add(' (SELECT');
        qryMapaRenVarOutros.SQL.Add('   PLANPRVCONTABPATRO, DESCCARTINVEST, SIGLAACAOBOLSA, DESCINVESTIMENTO,');
        qryMapaRenVarOutros.SQL.Add('   DATACOTACAO, COTACAO, LOTE, STAAJUSTEQTD, STAAJUSTECUSTO, DESCSEGMENTACAO, IDSEGMENTACAO, ');
        // William M. Santos - Sol 122648 Kintana 605169 - INI
        //qryMapaRenVar.SQL.Add('   SUM(SALDOQTDEINVCART) AS SALDOQTDEINVCART,');
        // William M. Santos - SOL 125637 Kintana 649764 - INI
        qryMapaRenVarOutros.SQL.Add('   SUM(SALDOQTDEINVCART) AS SALDOQTDEINVCART, SUM(QTDECC) AS QTDECC, TRUNC(SUM(QTDECC * COTACAO),2) AS SALDOVLRCC, TRUNC(SUM (QTDECCI * COTACAO),2) AS SALDOVLRCCI, SUM(QTDECCI) AS QTDECCI,  ');
        // William M. Santos - SOL 125637 Kintana 649764 - FIM
        // William M. Santos - Sol 122648 Kintana 605169 - FIM
        qryMapaRenVarOutros.SQL.Add('   SUM(SALDOVLRINVCART) AS SALDOVLRINVCART, SUM(SALDOAQUI) AS SALDOAQUI,'); //SUM(PUCUSTO) AS PUCUSTO,');
        //Renan Cristiano Sol 140550 Kintana 880191 INI
        qryMapaRenVarOutros.SQL.Add('   DECODE(SUM(SALDOQTDEINVCART),0,0,(ROUND((SUM(SALDOAQUI) / SUM(SALDOQTDEINVCART)),10))) AS PUCUSTO,');
        //Renan Cristiano Sol 140550 Kintana 880191 FIM
        qryMapaRenVarOutros.SQL.Add('   SUM(VLRRESTCAPITAL) AS VLRRESTCAPITAL, SUM(SALDOQTDEINVCARTANT) AS SALDOQTDEINVCARTANT,');
        qryMapaRenVarOutros.SQL.Add('   SUM(SALDOVLRINVCARTANT) AS SALDOVLRINVCARTANT, SUM(VARIACAO) AS VARIACAO, SUM(QTDECOMPRAS) AS QTDECOMPRAS,');
        qryMapaRenVarOutros.SQL.Add('   SUM(VLRCOMPRAS) AS VLRCOMPRAS, SUM(QTDEVENDAS) AS QTDEVENDAS, SUM(VLRVENDAS) AS VLRVENDAS,');
        qryMapaRenVarOutros.SQL.Add('   SUM(DIF) AS DIF, SUM(QTDAJUSTE) AS QTDAJUSTE, SUM(VLRAJUSTE) AS VLRAJUSTE, SUM(CUSTOAJUSTE) AS CUSTOAJUSTE,');
        qryMapaRenVarOutros.SQL.Add('   SUM(VLRTRPBAIXA) AS VLRTRPBAIXA, SUM(QTDTRPBAIXA) AS QTDTRPBAIXA,');
        qryMapaRenVarOutros.SQL.Add('   SUM(VLRTRPACRESC) AS VLRTRPACRESC, SUM(QTDTRPACRESC) AS QTDTRPACRESC,');
        //AL_22
        qryMapaRenVarOutros.SQL.Add('   SUM(DECODE(SUM(SALDOQTDEINVCART), 0, 0, SUM(SALDOVLRINVCART) )) OVER (PARTITION BY PLANPRVCONTABPATRO) AS SALDOPLANO,');
        qryMapaRenVarOutros.SQL.Add('   SUM(DECODE(SUM(SALDOQTDEINVCART), 0, 0, SUM(SALDOVLRINVCART) )) OVER (PARTITION BY PLANPRVCONTABPATRO, DESCCARTINVEST) AS SALDOCART,');
        qryMapaRenVarOutros.SQL.Add('   SUM(DECODE(SUM(SALDOQTDEINVCART), 0, 0, SUM(SALDOVLRINVCART) )) OVER (PARTITION BY PLANPRVCONTABPATRO, DESCCARTINVEST, DESCINVESTIMENTO) AS SALDOINV,');
        qryMapaRenVarOutros.SQL.Add('   SUM(DECODE(SUM(SALDOQTDEINVCART), 0, 0, SUM(SALDOVLRINVCART) )) OVER (PARTITION BY DESCCARTINVEST) AS SALDOGERAL,');

        // William M. Santos - Sol 122648 Kintana 605169 - INI
        // William M. Santos - SOL 125637 Kintana 649764 - INI
        qryMapaRenVarOutros.SQL.Add('   SUM(DECODE(SUM(QTDECC),0,0, ROUND(SUM (QTDECC * COTACAO),2) )) OVER (PARTITION BY PLANPRVCONTABPATRO) AS SALDOPLANOCC,');
        qryMapaRenVarOutros.SQL.Add('   SUM(DECODE(SUM(QTDECC),0,0, ROUND(SUM (QTDECC * COTACAO),2) )) OVER (PARTITION BY PLANPRVCONTABPATRO, DESCCARTINVEST) AS SALDOCARTCC,');
        qryMapaRenVarOutros.SQL.Add('   SUM(DECODE(SUM(QTDECC),0,0, ROUND(SUM (QTDECC * COTACAO),2) )) OVER (PARTITION BY PLANPRVCONTABPATRO, DESCCARTINVEST, DESCINVESTIMENTO) AS SALDOINVCC,');
        qryMapaRenVarOutros.SQL.Add('   SUM(DECODE(SUM(QTDECC),0,0, ROUND(SUM (QTDECC * COTACAO),2) )) OVER (PARTITION BY DESCCARTINVEST) AS SALDOGERALCC,');

        qryMapaRenVarOutros.SQL.Add('   SUM(DECODE(SUM(QTDECCI),0,0, ROUND(SUM(QTDECCI * COTACAO),2) )) OVER (PARTITION BY PLANPRVCONTABPATRO) AS SALDOPLANOCCI,');
        qryMapaRenVarOutros.SQL.Add('   SUM(DECODE(SUM(QTDECCI),0,0, ROUND(SUM(QTDECCI * COTACAO),2) )) OVER (PARTITION BY PLANPRVCONTABPATRO, DESCCARTINVEST) AS SALDOCARTCCI,');
        qryMapaRenVarOutros.SQL.Add('   SUM(DECODE(SUM(QTDECCI),0,0, ROUND(SUM(QTDECCI * COTACAO),2) )) OVER (PARTITION BY PLANPRVCONTABPATRO, DESCCARTINVEST, DESCINVESTIMENTO) AS SALDOINVCCI,');
        qryMapaRenVarOutros.SQL.Add('   SUM(DECODE(SUM(QTDECCI),0,0, ROUND(SUM(QTDECCI * COTACAO),2) )) OVER (PARTITION BY DESCCARTINVEST) AS SALDOGERALCCI');
        // William M. Santos - SOL 125637 Kintana 649764 - FIM
        // William M. Santos - Sol 122648 Kintana 605169 - FIM

        qryMapaRenVarOutros.SQL.Add('FROM (');
        //AL_22
        qryMapaRenVarOutros.SQL.Add('         SELECT ');
        qryMapaRenVarOutros.SQL.Add('                AB2.SIGLAACAOBOLSA, PP.PLANPRVCONTABPATRO,');
        qryMapaRenVarOutros.SQL.Add('                '+OperComum.IIF(sGroup = 'A','CA.DESCCARTINVEST',QuotedStr(' '))+' AS DESCCARTINVEST,');
        qryMapaRenVarOutros.SQL.Add('                IV.DESCINVESTIMENTO,');

        qryMapaRenVarOutros.SQL.Add('                NVL(H1.SALDOQTDEINVCART,0) AS SALDOQTDEINVCART,');

        qryMapaRenVarOutros.SQL.Add('                DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0, (NVL(H1.SALDOVLRINVCART,0))) AS SALDOVLRINVCART,');
        qryMapaRenVarOutros.SQL.Add('                ROUND(NVL(H1.SALDOAQUI,0),2) AS SALDOAQUI,');
        //Renan Cristiano Sol 140550 Kintana 880191 INI
//        qryMapaRenVarOutros.SQL.Add('                DECODE(H1.SALDOQTDEINVCART,0,0,(ROUND((H1.SALDOAQUI / H1.SALDOQTDEINVCART),10))) AS PUCUSTO,');
        //Renan Cristiano Sol 140550 Kintana 880191 FIM
        qryMapaRenVarOutros.SQL.Add('                NVL(OPER.VLRRESTITUICAO * -1,0) AS VLRRESTCAPITAL,');
        qryMapaRenVarOutros.SQL.Add('                NVL(SALDOANTERIOR.SALDOQTDEINVCART,0) AS SALDOQTDEINVCARTANT,');
        qryMapaRenVarOutros.SQL.Add('                NVL(SALDOANTERIOR.SALDOVLRINVCART,0) AS SALDOVLRINVCARTANT,');
        qryMapaRenVarOutros.SQL.Add('                DECODE(((NVL(SALDOANTERIOR.SALDOVLRINVCART,0)');
        qryMapaRenVarOutros.SQL.Add('                           + NVL(OPER.VLRCOMPRAS,0)');
        qryMapaRenVarOutros.SQL.Add('                           - NVL(OPER.VLRCOMPRASDIRSUB,0)');
        qryMapaRenVarOutros.SQL.Add('                           + NVL(OPER.DESPESASCP,0)');
        qryMapaRenVarOutros.SQL.Add('                           - NVL(OPER.VLRVENDAS,0)');
        qryMapaRenVarOutros.SQL.Add('                           + NVL(OPER.DESPESASVD,0)');
        qryMapaRenVarOutros.SQL.Add('                           + NVL(OPER.VLRTRPBAIXA,0)');
        qryMapaRenVarOutros.SQL.Add('                           + NVL(OPER.VLRTRPACRESC,0)');
        qryMapaRenVarOutros.SQL.Add('                           - DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0, (NVL(H1.SALDOVLRINVCART,0))) )* - 1), 0, 0,');
        qryMapaRenVarOutros.SQL.Add('                          ((NVL(SALDOANTERIOR.SALDOVLRINVCART,0)');
        qryMapaRenVarOutros.SQL.Add('                           + NVL(OPER.VLRCOMPRAS,0)');
        qryMapaRenVarOutros.SQL.Add('                           - NVL(OPER.VLRCOMPRASDIRSUB,0)');
        qryMapaRenVarOutros.SQL.Add('                           + NVL(OPER.DESPESASCP,0)');
        qryMapaRenVarOutros.SQL.Add('                           - NVL(OPER.VLRVENDAS,0)');
        qryMapaRenVarOutros.SQL.Add('                           + NVL(OPER.DESPESASVD,0)');
        qryMapaRenVarOutros.SQL.Add('                           + NVL(OPER.VLRTRPBAIXA,0)');
        qryMapaRenVarOutros.SQL.Add('                           + NVL(OPER.VLRTRPACRESC,0)');
        qryMapaRenVarOutros.SQL.Add('                           - DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0, (NVL(H1.SALDOVLRINVCART,0))) )* - 1) + NVL(OPER.VLRRESTITUICAO,0)) AS VARIACAO,');
        qryMapaRenVarOutros.SQL.Add('                (NVL(OPER.QTDECOMPRAS,0) + NVL(OPER.QTDTRPACRESC,0)) AS QTDECOMPRAS,');
        qryMapaRenVarOutros.SQL.Add('                (NVL(OPER.VLRCOMPRAS,0)  + NVL(OPER.DESPESASCP,0) - NVL(OPER.VLRCOMPRASDIRSUB,0) + NVL(OPER.VLRTRPACRESC,0) ) AS VLRCOMPRAS,');
        qryMapaRenVarOutros.SQL.Add('                (NVL(OPER.QTDEVENDAS,0)  + NVL(OPER.QTDTRPBAIXA,0)) AS QTDEVENDAS,');
        qryMapaRenVarOutros.SQL.Add('                (NVL(OPER.VLRVENDAS,0) - NVL(OPER.DESPESASVD,0) + ABS(NVL(OPER.VLRTRPBAIXA,0)) ) AS VLRVENDAS,');
        qryMapaRenVarOutros.SQL.Add('                ROUND((COT.VLRCONTABIL/COT.QTDTITLOTE),8) AS COTACAO,');
        qryMapaRenVarOutros.SQL.Add('                (COT.DATACOTACAO) AS DATACOTACAO,');
        qryMapaRenVarOutros.SQL.Add('                (COT.QTDTITLOTE) AS LOTE,');
        qryMapaRenVarOutros.SQL.Add('                ROUND((H1.SALDOVLRINVCART - (H1.SALDOQTDEINVCART * (COT.VLRCONTABIL/COT.QTDTITLOTE))),2) AS DIF,');
        qryMapaRenVarOutros.SQL.Add('                NVL(AJQ.QTDEOPERACAO,0) AS QTDAJUSTE,');
        qryMapaRenVarOutros.SQL.Add('                NVL(AJQ.VLROPERACAO,0)  AS VLRAJUSTE,');
        qryMapaRenVarOutros.SQL.Add('                DECODE(NVL(AJQ.QTDEOPERACAO,0),0,'''',''*'') AS STAAJUSTEQTD,');
        qryMapaRenVarOutros.SQL.Add('                NVL(AJC.VLROPERACAO,0)  AS CUSTOAJUSTE,');
        qryMapaRenVarOutros.SQL.Add('                DECODE(NVL(AJC.VLROPERACAO,0),0,'''',''*'') AS STAAJUSTECUSTO,');
        qryMapaRenVarOutros.SQL.Add('                ABS(NVL(OPER.VLRTRPBAIXA,0))  AS VLRTRPBAIXA,');
        qryMapaRenVarOutros.SQL.Add('                NVL(OPER.QTDTRPBAIXA,0)  AS QTDTRPBAIXA,');
        qryMapaRenVarOutros.SQL.Add('                NVL(OPER.VLRTRPACRESC,0) AS VLRTRPACRESC,');
        qryMapaRenVarOutros.SQL.Add('                NVL(OPER.QTDTRPACRESC,0) AS QTDTRPACRESC,');
  //AL_22
  //      qryMapaRenVar.SQL.Add('                SUM(DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0, (NVL(H1.SALDOVLRINVCART,0)))) OVER (PARTITION BY H1.IDPLANPREVCTBPATR) AS SALDOPLANO,');
  //      qryMapaRenVar.SQL.Add('                SUM(DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0, (NVL(H1.SALDOVLRINVCART,0)))) OVER (PARTITION BY H1.IDPLANPREVCTBPATR, H1.IDCARTEIRAINVEST) AS SALDOCART,');
  //      qryMapaRenVar.SQL.Add('                SUM(DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0, (NVL(H1.SALDOVLRINVCART,0)))) OVER (PARTITION BY H1.IDPLANPREVCTBPATR, H1.IDINVESTIMENTO) AS SALDOINV,');
        qryMapaRenVarOutros.SQL.Add('                '+OperComum.IIF(sGroup = 'A','H1.IDCARTEIRAINVEST','1')+' AS IDCARTEIRAINVEST,');

        // William M. Santos - Sol 122648 Kintana 605169 - INI
        qryMapaRenVarOutros.SQL.Add('               NVL(H1.SALDOQTDECPMF,0) AS QTDECC,');
        qryMapaRenVarOutros.SQL.Add('              (NVL(H1.SALDOQTDEINVCART,0) - NVL(H1.SALDOQTDECPMF,0)) AS QTDECCI ');
        // William M. Santos - Sol 122648 Kintana 605169 - FIM
        qryMapaRenVarOutros.SQL.Add('               , SM.DESCSEGMENTACAO, SM.IDSEGMENTACAO');

        qryMapaRenVarOutros.SQL.Add('         FROM HISTCARTINV H1, INVESTIMENTO IV, CARTEIRAINVEST CA, TIPOOPERACAO TP, VWPLANPREVCTBPATR PP, EMISSOR EM, SEGMENTACAOMERCADO SM,');
        qryMapaRenVarOutros.SQL.Add('            (SELECT IDINVESTIMENTO, DATACOTACAO, VLRCONTABIL, QTDTITLOTE');
        qryMapaRenVarOutros.SQL.Add('             FROM COTACAOINVEST');
        qryMapaRenVarOutros.SQL.Add('             WHERE DATACOTACAO||IDINVESTIMENTO IN (SELECT MAX(DATACOTACAO)||IDINVESTIMENTO');
        qryMapaRenVarOutros.SQL.Add('                                                   FROM COTACAOINVEST');
        qryMapaRenVarOutros.SQL.Add('                                                   WHERE DATACOTACAO <= TO_DATE('+QuotedStr(DateToStr(dDataFimGroup))+',''DD/MM/YYYY'')');
        qryMapaRenVarOutros.SQL.Add('                                                   GROUP BY IDINVESTIMENTO) ) COT,');
        qryMapaRenVarOutros.SQL.Add('            (SELECT HA.IDPLANPREVCTBPATR, HA.IDCARTEIRAINVEST,HA.IDINVESTIMENTO, HA.SALDOQTDEINVCART, HA.SALDOVLRINVCART, HA.SALDOVARIACAO');
        qryMapaRenVarOutros.SQL.Add('             FROM HISTCARTINV HA');
        qryMapaRenVarOutros.SQL.Add('             WHERE (HA.IDHISTCARTINV IN');
        qryMapaRenVarOutros.SQL.Add('                    (SELECT MAX(HA2.IDHISTCARTINV)');
        qryMapaRenVarOutros.SQL.Add('                     FROM HISTCARTINV HA2');
        qryMapaRenVarOutros.SQL.Add('                     WHERE (HA2.IDTIPOINVEST = 2)');
        if trim(sPlanPrevGroup) = '' then
           qryMapaRenVarOutros.SQL.Add('                       AND (HA2.IDPLANPREVCTBPATR > 0)')
        else
           qryMapaRenVarOutros.SQL.Add('                       AND (HA2.IDPLANPREVCTBPATR = '+sPlanPrevGroup+')');
        if trim(sCartInvestGroup) = '' then
           qryMapaRenVarOutros.SQL.Add('                       AND (HA2.IDCARTEIRAINVEST > 0)')
        else
           qryMapaRenVarOutros.SQL.Add('                       AND (HA2.IDCARTEIRAINVEST = '+sCartInvestGroup+')');
        qryMapaRenVarOutros.SQL.Add('                       AND (HA2.IDCARTEIRAGERENC IS NULL)');
        qryMapaRenVarOutros.SQL.Add('                       AND (HA2.DATAMOVCARTINV = TO_DATE('+QuotedStr(DateToStr(dDataAntGroup))+',''DD/MM/YYYY''))');
        qryMapaRenVarOutros.SQL.Add('                     GROUP BY HA2.IDTIPOINVEST, HA2.IDPLANPREVCTBPATR, HA2.IDCARTEIRAINVEST, HA2.IDCARTEIRAGERENC,');
        qryMapaRenVarOutros.SQL.Add('                              HA2.IDINVESTIMENTO, HA2.DATAMOVCARTINV) )');
        qryMapaRenVarOutros.SQL.Add('               AND (HA.SALDOVLRINVCART IS NOT NULL )) SALDOANTERIOR,');
        //AL_23
        qryMapaRenVarOutros.SQL.Add('            (SELECT SUM(DECODE(HC.NATURMOVCARTINV,''A'',DECODE(HC.TIPMOVCARTINV,''OPE'',NVL(HC.QTDEMOVINVCART,0),''TRC'',NVL(HC.QTDEMOVINVCART,0),0),0)) AS QTDECOMPRAS,');
        qryMapaRenVarOutros.SQL.Add('                    SUM(DECODE(HC.NATURMOVCARTINV,''A'',DECODE(HC.TIPMOVCARTINV,''OPE'',NVL(ABS(HC.VLRMOVCARTINV),0),''TRC'',NVL(ABS(HC.VLRMOVCARTINV),0),0),0)) AS VLRCOMPRAS,');

        qryMapaRenVarOutros.SQL.Add('                    SUM(DECODE(TP.IDTIPOOPERACAO,PR.IDTIPOOPERDIRDSU,         NVL(ABS(HC.VLRMOVCARTINV),0),');
        qryMapaRenVarOutros.SQL.Add('                                                 PR.IDTIPOOPERDIRDSU + 10000, NVL(ABS(HC.VLRMOVCARTINV),0), 0)) AS VLRCOMPRASDIRSUB,');
        qryMapaRenVarOutros.SQL.Add('                    SUM(DECODE(TP.IDTIPOOPERACAO,  -114,NVL(ABS(HC.VLRMOVCARTINV),0),');
        qryMapaRenVarOutros.SQL.Add('                                                 -10114,NVL(ABS(HC.VLRMOVCARTINV),0), 0 ) ) AS VLRVENDASDIRSUB,');
        //AL_23
        qryMapaRenVarOutros.SQL.Add('                    SUM(DECODE(HC.NATURMOVCARTINV,''D'',DECODE(HC.TIPMOVCARTINV,''OPE'',NVL(HC.QTDEMOVINVCART,0),''TRC'',NVL(HC.QTDEMOVINVCART,0),0),0)) AS QTDEVENDAS,');
        qryMapaRenVarOutros.SQL.Add('                    SUM(DECODE(HC.NATURMOVCARTINV,''D'',DECODE(HC.TIPMOVCARTINV,''OPE'',NVL(ABS(HC.VLRMOVCARTINV),0),''TRC'',NVL(ABS(HC.VLRMOVCARTINV),0),0),0)) AS VLRVENDAS,');

        qryMapaRenVarOutros.SQL.Add('                    SUM(DECODE(HC.NATURMOVCARTINV,''D'',NVL(ABS(OPER.DESPESAS),0),0)) AS DESPESASVD,');
        qryMapaRenVarOutros.SQL.Add('                    SUM(DECODE(HC.NATURMOVCARTINV,''D'',NVL(OPER.LUCPREJ,0),0)) AS LUCPREJ,');
        qryMapaRenVarOutros.SQL.Add('                    SUM(DECODE(HC.NATURMOVCARTINV,''A'',NVL(ABS(OPER.DESPESAS),0),0)) AS DESPESASCP,');
        qryMapaRenVarOutros.SQL.Add('                    SUM(DECODE(HC.IDTIPOOPERACAO,  PR.IDTIPOOPERDIRRES ,      NVL(ABS(HC.VLRMOVCARTINV),0),');
        qryMapaRenVarOutros.SQL.Add('                                                   PR.IDTIPOOPERDIRRES+10000, NVL(ABS(HC.VLRMOVCARTINV),0),0)) AS VLRRESTITUICAO,');
        qryMapaRenVarOutros.SQL.Add('                    SUM(DECODE(HC.NATURMOVCARTINV,''D'',NVL(OPER.VLRTRPBAIXA,0),0)) AS VLRTRPBAIXA,');
        qryMapaRenVarOutros.SQL.Add('                    SUM(DECODE(HC.NATURMOVCARTINV,''D'',NVL(OPER.QTDTRPBAIXA,0),0)) AS QTDTRPBAIXA,');
        //Ricardo Cristiano - 23/11/2010 - N. Sol 148219 -  N. Kintana  1037536
        qryMapaRenVarOutros.SQL.Add('                    SUM(DECODE(HC.NATURMOVCARTINV,''A'',ABS(NVL(OPER.VLRTRPACRESC,0)),0)) AS VLRTRPACRESC,');
        qryMapaRenVarOutros.SQL.Add('                    SUM(DECODE(HC.NATURMOVCARTINV,''A'',NVL(OPER.QTDTRPACRESC,0),0)) AS QTDTRPACRESC,');
        qryMapaRenVarOutros.SQL.Add('                    HC.IDPLANPREVCTBPATR,');
        qryMapaRenVarOutros.SQL.Add('                    HC.IDCARTEIRAINVEST,');
        qryMapaRenVarOutros.SQL.Add('                    HC.IDINVESTIMENTO');
        qryMapaRenVarOutros.SQL.Add('             FROM HISTCARTINV HC, INVESTIMENTO IV, TIPOOPERACAO TP, OPERACAOINVEST OP, CORRETVALORES CV,');
        qryMapaRenVarOutros.SQL.Add('                  CARTEIRAINVEST CI, PARAMINVEST PR,');
        qryMapaRenVarOutros.SQL.Add('                  (SELECT HI.IDOPERACAOINVEST,');
        qryMapaRenVarOutros.SQL.Add('                          SUM(DECODE(HI.TIPMOVCARTINV,''DOP'',DECODE(NATURMOVOPER,''D'',(VLRMOVCARTINV*-1),VLRMOVCARTINV),0)) AS DESPESAS,');
        qryMapaRenVarOutros.SQL.Add('                          SUM(DECODE(HI.TIPMOVCARTINV,''LUC'',VLRMOVCARTINV,0)) AS LUCPREJ,');
        qryMapaRenVarOutros.SQL.Add('                          SUM(DECODE(HI.TIPMOVCARTINV,''TRP'',DECODE(NATURMOVOPER,''D'',VLRMOVCARTINV,0)))  AS VLRTRPBAIXA,');
        qryMapaRenVarOutros.SQL.Add('                          SUM(DECODE(HI.TIPMOVCARTINV,''TRP'',DECODE(NATURMOVOPER,''D'',QTDEMOVINVCART,0))) AS QTDTRPBAIXA,');
        //Ricardo Cristiano - 23/11/2010 - N. Sol 148219 -  N. Kintana  1037536        
        qryMapaRenVarOutros.SQL.Add('                          SUM(DECODE(HI.TIPMOVCARTINV,''TRP'',DECODE(NATURMOVOPER,''A'',ABS(VLRMOVCARTINV),0)))  AS VLRTRPACRESC,');
        qryMapaRenVarOutros.SQL.Add('                          SUM(DECODE(HI.TIPMOVCARTINV,''TRP'',DECODE(NATURMOVOPER,''A'',QTDEMOVINVCART,0)))  AS QTDTRPACRESC');
        qryMapaRenVarOutros.SQL.Add('                   FROM HISTCARTINV HI');
        qryMapaRenVarOutros.SQL.Add('                   WHERE (HI.IDTIPOINVEST = 2)');
        if trim(sPlanPrevGroup) = '' then
           qryMapaRenVarOutros.SQL.Add('                     AND (HI.IDPLANPREVCTBPATR > 0)')
        else
           qryMapaRenVarOutros.SQL.Add('                     AND (HI.IDPLANPREVCTBPATR = '+sPlanPrevGroup+')');
        if trim(sCartInvestGroup) = '' then
           qryMapaRenVarOutros.SQL.Add('                     AND (HI.IDCARTEIRAINVEST > 0)')
        else
           qryMapaRenVarOutros.SQL.Add('                     AND (HI.IDCARTEIRAINVEST = '+sCartInvestGroup+')');
        qryMapaRenVarOutros.SQL.Add('                     AND (HI.IDCARTEIRAGERENC IS NULL)');
        qryMapaRenVarOutros.SQL.Add('                     AND (HI.DATAMOVCARTINV BETWEEN TO_DATE('+QuotedStr(DateToStr(dDataIniGroup))+',''DD/MM/YYYY'') AND');
        qryMapaRenVarOutros.SQL.Add('                                                    TO_DATE('+QuotedStr(DateToStr(dDataFimGroup))+',''DD/MM/YYYY''))');
        qryMapaRenVarOutros.SQL.Add('                     AND ( (HI.TIPMOVCARTINV = ''DOP'') OR');
        qryMapaRenVarOutros.SQL.Add('                           (HI.TIPMOVCARTINV = ''LUC'') OR');
        qryMapaRenVarOutros.SQL.Add('                           (HI.TIPMOVCARTINV = ''TRP'') )');
        qryMapaRenVarOutros.SQL.Add('                   GROUP BY HI.IDOPERACAOINVEST) OPER');
        qryMapaRenVarOutros.SQL.Add('             WHERE (HC.IDTIPOINVEST = 2)');
        if trim(sPlanPrevGroup) = '' then
           qryMapaRenVarOutros.SQL.Add('               AND (HC.IDPLANPREVCTBPATR > 0)')
        else
           qryMapaRenVarOutros.SQL.Add('               AND (HC.IDPLANPREVCTBPATR = '+sPlanPrevGroup+')');
        if trim(sCartInvestGroup) = '' then
           qryMapaRenVarOutros.SQL.Add('               AND (HC.IDCARTEIRAINVEST > 0)')
        else
           qryMapaRenVarOutros.SQL.Add('               AND (HC.IDCARTEIRAINVEST = '+sCartInvestGroup+')');
        qryMapaRenVarOutros.SQL.Add('               AND (HC.IDCARTEIRAGERENC IS NULL)');
        qryMapaRenVarOutros.SQL.Add('               AND (HC.DATAMOVCARTINV BETWEEN TO_DATE('+QuotedStr(DateToStr(dDataIniGroup))+',''DD/MM/YYYY'') AND');
        qryMapaRenVarOutros.SQL.Add('                                              TO_DATE('+QuotedStr(DateToStr(dDataFimGroup))+',''DD/MM/YYYY''))');
        //AL_23
        qryMapaRenVarOutros.SQL.Add('               AND ((HC.TIPMOVCARTINV = ''OPE'') OR (HC.TIPMOVCARTINV = ''TRP'') OR (HC.TIPMOVCARTINV = ''TRC''))');

        qryMapaRenVarOutros.SQL.Add('               AND (HC.IDTIPOINVEST     = IV.IDTIPOINVEST)');
        qryMapaRenVarOutros.SQL.Add('               AND (HC.IDINVESTIMENTO   = IV.IDINVESTIMENTO)');
        qryMapaRenVarOutros.SQL.Add('               AND (HC.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST)');
        qryMapaRenVarOutros.SQL.Add('               AND (HC.IDTIPOINVEST     = TP.IDTIPOINVEST(+))');
        qryMapaRenVarOutros.SQL.Add('               AND (HC.IDTIPOOPERACAO   = TP.IDTIPOOPERACAO(+))');
        qryMapaRenVarOutros.SQL.Add('               AND (HC.IDOPERACAOINVEST = OP.IDOPERACAOINVEST(+))');
        qryMapaRenVarOutros.SQL.Add('               AND (OP.IDCORRETVALORES  = CV.IDCORRETVALORES(+))');
        qryMapaRenVarOutros.SQL.Add('               AND (HC.IDOPERACAOINVEST = OPER.IDOPERACAOINVEST(+))');
        qryMapaRenVarOutros.SQL.Add('             GROUP BY HC.IDTIPOINVEST, HC.IDPLANPREVCTBPATR, HC.IDCARTEIRAINVEST, HC.IDCARTEIRAGERENC,');
        qryMapaRenVarOutros.SQL.Add('                      HC.IDINVESTIMENTO) OPER,');
        qryMapaRenVarOutros.SQL.Add('            (SELECT SUM(NVL(O.QTDEOPERACAO,0)) AS QTDEOPERACAO, SUM(NVL(O.VLROPERACAO,0)) AS VLROPERACAO,');
        qryMapaRenVarOutros.SQL.Add('                    O.IDINVESTIMENTO, O.IDCARTEIRAINVEST, O.IDPLANPREVCTBPATR');
        qryMapaRenVarOutros.SQL.Add('             FROM OPERACAOINVEST O, BOLETA B');
        qryMapaRenVarOutros.SQL.Add('             WHERE (O.IDTIPOINVEST = 2)');
        if trim(sPlanPrevGroup) = '' then
           qryMapaRenVarOutros.SQL.Add('               AND (O.IDPLANPREVCTBPATR > 0)')
        else
           qryMapaRenVarOutros.SQL.Add('               AND (O.IDPLANPREVCTBPATR = '+sPlanPrevGroup+')');
        if trim(sCartInvestGroup) = '' then
           qryMapaRenVarOutros.SQL.Add('               AND (O.IDCARTEIRAINVEST > 0)')
        else
           qryMapaRenVarOutros.SQL.Add('               AND (O.IDCARTEIRAINVEST = '+sCartInvestGroup+')');
        qryMapaRenVarOutros.SQL.Add('               AND (O.IDCARTEIRAGERENC IS NULL)');
        qryMapaRenVarOutros.SQL.Add('               AND (O.DATAOPERACAO BETWEEN TO_DATE('+QuotedStr(DateToStr(dDataIniGroup))+',''DD/MM/YYYY'') AND');
        qryMapaRenVarOutros.SQL.Add('                                           TO_DATE('+QuotedStr(DateToStr(dDataFimGroup))+',''DD/MM/YYYY''))');
        qryMapaRenVarOutros.SQL.Add('               AND (B.IDBOLETA     = O.NUMDOCUMENTO)');
        qryMapaRenVarOutros.SQL.Add('               AND (B.TIPMOVBOLETA = ''AJQ'')');
        qryMapaRenVarOutros.SQL.Add('             GROUP BY O.IDTIPOINVEST, O.IDPLANPREVCTBPATR, O.IDCARTEIRAINVEST, O.IDINVESTIMENTO) AJQ,');
        qryMapaRenVarOutros.SQL.Add('            (SELECT SUM(NVL(O.VLROPERACAO,0)) AS VLROPERACAO, O.IDINVESTIMENTO, O.IDCARTEIRAINVEST, O.IDPLANPREVCTBPATR');
        qryMapaRenVarOutros.SQL.Add('             FROM OPERACAOINVEST O, BOLETA B');
        qryMapaRenVarOutros.SQL.Add('             WHERE (O.IDTIPOINVEST = 2)');
        if trim(sPlanPrevGroup) = '' then
           qryMapaRenVarOutros.SQL.Add('               AND (O.IDPLANPREVCTBPATR > 0)')
        else
           qryMapaRenVarOutros.SQL.Add('               AND (O.IDPLANPREVCTBPATR = '+sPlanPrevGroup+')');
        if trim(sCartInvestGroup) = '' then
           qryMapaRenVarOutros.SQL.Add('               AND (O.IDCARTEIRAINVEST  > 0)')
        else
           qryMapaRenVarOutros.SQL.Add('               AND (O.IDCARTEIRAINVEST = '+sCartInvestGroup+')');
        qryMapaRenVarOutros.SQL.Add('               AND (O.IDCARTEIRAGERENC IS NULL)');
        qryMapaRenVarOutros.SQL.Add('               AND (O.DATAOPERACAO BETWEEN TO_DATE('+QuotedStr(DateToStr(dDataIniGroup))+',''DD/MM/YYYY'') AND');
        qryMapaRenVarOutros.SQL.Add('                                           TO_DATE('+QuotedStr(DateToStr(dDataFimGroup))+',''DD/MM/YYYY''))');
        qryMapaRenVarOutros.SQL.Add('               AND (B.IDBOLETA     = O.NUMDOCUMENTO)');
        qryMapaRenVarOutros.SQL.Add('               AND (B.TIPMOVBOLETA = ''AJC'')');
        qryMapaRenVarOutros.SQL.Add('             GROUP BY O.IDTIPOINVEST, O.IDPLANPREVCTBPATR, O.IDCARTEIRAINVEST, O.IDINVESTIMENTO) AJC,');
        qryMapaRenVarOutros.SQL.Add('            (SELECT IDACAO, SIGLAACAOBOLSA');
        qryMapaRenVarOutros.SQL.Add('             FROM ACOESXBOLSA A, PARAMINVEST P');
        qryMapaRenVarOutros.SQL.Add('             WHERE A.IDBOLSAVALORES = P.IDBVSP) AB2');
        qryMapaRenVarOutros.SQL.Add('         WHERE (H1.IDHISTCARTINV  IN');
        qryMapaRenVarOutros.SQL.Add('                (SELECT MAX(H2.IDHISTCARTINV)');
        qryMapaRenVarOutros.SQL.Add('                 FROM HISTCARTINV H2, PARAMINVEST P2');
        qryMapaRenVarOutros.SQL.Add('                 WHERE (H2.IDTIPOINVEST = 2)');
        if trim(sPlanPrevGroup) = '' then
           qryMapaRenVarOutros.SQL.Add('                   AND (H2.IDPLANPREVCTBPATR > 0)')
        else
           qryMapaRenVarOutros.SQL.Add('                   AND (H2.IDPLANPREVCTBPATR = '+sPlanPrevGroup+')');
        if trim(sCartInvestGroup) = '' then
           qryMapaRenVarOutros.SQL.Add('                   AND (H2.IDCARTEIRAINVEST > 0)')
        else
           qryMapaRenVarOutros.SQL.Add('                   AND (H2.IDCARTEIRAINVEST = '+sCartInvestGroup+')');
        qryMapaRenVarOutros.SQL.Add('                   AND (H2.IDCARTEIRAGERENC IS NULL)');
        qryMapaRenVarOutros.SQL.Add('                   AND (H2.DATAMOVCARTINV  BETWEEN TO_DATE('+QuotedStr(DateToStr(dDataIniGroup))+',''DD/MM/YYYY'') AND');
        qryMapaRenVarOutros.SQL.Add('                                                   TO_DATE('+QuotedStr(DateToStr(dDataFimGroup))+',''DD/MM/YYYY''))');
        //AL_28
        qryMapaRenVarOutros.SQL.Add('                   AND (H2.IDTIPOOPERACAO <> -70) AND (H2.IDTIPOOPERACAO <> -10070)');  // Anúncio de proventos
        qryMapaRenVarOutros.SQL.Add('                   AND (H2.IDTIPOOPERACAO <> -170) AND (H2.IDTIPOOPERACAO <> -10170)'); // Cancelamento de Anúncio
        qryMapaRenVarOutros.SQL.Add('                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDIRDSU,0))');
        qryMapaRenVarOutros.SQL.Add('                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDIRDSU,0) + 10000 )');
        qryMapaRenVarOutros.SQL.Add('                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDIRJUR,0))');
        qryMapaRenVarOutros.SQL.Add('                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDIRJUR,0) + 10000 )');
        qryMapaRenVarOutros.SQL.Add('                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDIRMUL,0))');
        qryMapaRenVarOutros.SQL.Add('                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDIRMUL,0) + 10000 )');
        qryMapaRenVarOutros.SQL.Add('                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDIRDIV,0))');
        qryMapaRenVarOutros.SQL.Add('                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDIRDIV,0) + 10000 )');
        qryMapaRenVarOutros.SQL.Add('                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERRFRAC,0))');
        qryMapaRenVarOutros.SQL.Add('                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERRFRAC,0) + 10000 )');
        qryMapaRenVarOutros.SQL.Add('                 GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR, H2.IDCARTEIRAINVEST, H2.IDCARTEIRAGERENC,');
        qryMapaRenVarOutros.SQL.Add('                          H2.IDINVESTIMENTO))');
        if trim(sSegmentacao) = '' then
           qryMapaRenVarOutros.SQL.Add('                   AND (SM.IDSEGMENTACAO > 0)')
        else
           qryMapaRenVarOutros.SQL.Add('                   AND (SM.IDSEGMENTACAO = ' + sSegmentacao + ')');
        qryMapaRenVarOutros.SQL.Add('           AND (IV.IDINVESTIMENTO(+)               = H1.IDINVESTIMENTO)');
        qryMapaRenVarOutros.SQL.Add('           AND (CA.IDCARTEIRAINVEST(+)             = H1.IDCARTEIRAINVEST)');
        qryMapaRenVarOutros.SQL.Add('           AND (COT.IDINVESTIMENTO(+)              = H1.IDINVESTIMENTO)');
        qryMapaRenVarOutros.SQL.Add('           AND (TP.IDTIPOINVEST(+)                 = H1.IDTIPOINVEST)');
        qryMapaRenVarOutros.SQL.Add('           AND (TP.IDTIPOOPERACAO(+)               = H1.IDTIPOOPERACAO)');
        qryMapaRenVarOutros.SQL.Add('           AND (PP.IDPLANPREVCTBPATR(+)            = H1.IDPLANPREVCTBPATR)');
        qryMapaRenVarOutros.SQL.Add('           AND (SALDOANTERIOR.IDPLANPREVCTBPATR(+) = H1.IDPLANPREVCTBPATR)');
        qryMapaRenVarOutros.SQL.Add('           AND (SALDOANTERIOR.IDCARTEIRAINVEST(+)  = H1.IDCARTEIRAINVEST)');
        qryMapaRenVarOutros.SQL.Add('           AND (SALDOANTERIOR.IDINVESTIMENTO(+)    = H1.IDINVESTIMENTO)');
        qryMapaRenVarOutros.SQL.Add('           AND (OPER.IDPLANPREVCTBPATR(+)          = H1.IDPLANPREVCTBPATR)');
        qryMapaRenVarOutros.SQL.Add('           AND (OPER.IDCARTEIRAINVEST(+)           = H1.IDCARTEIRAINVEST)');
        qryMapaRenVarOutros.SQL.Add('           AND (OPER.IDINVESTIMENTO(+)             = H1.IDINVESTIMENTO)');
        qryMapaRenVarOutros.SQL.Add('           AND (AJQ.IDPLANPREVCTBPATR(+)           = H1.IDPLANPREVCTBPATR)');
        qryMapaRenVarOutros.SQL.Add('           AND (AJQ.IDCARTEIRAINVEST(+)            = H1.IDCARTEIRAINVEST)');
        qryMapaRenVarOutros.SQL.Add('           AND (AJQ.IDINVESTIMENTO(+)              = H1.IDINVESTIMENTO)');
        qryMapaRenVarOutros.SQL.Add('           AND (AJC.IDPLANPREVCTBPATR(+)           = H1.IDPLANPREVCTBPATR)');
        qryMapaRenVarOutros.SQL.Add('           AND (AJC.IDCARTEIRAINVEST(+)            = H1.IDCARTEIRAINVEST)');
        qryMapaRenVarOutros.SQL.Add('           AND (AJC.IDINVESTIMENTO(+)              = H1.IDINVESTIMENTO)');
        qryMapaRenVarOutros.SQL.Add('           AND (AB2.IDACAO(+)                      = H1.IDINVESTIMENTO)');
        qryMapaRenVarOutros.SQL.Add('           AND (IV.IDEMISSOR                       = EM.IDEMISSOR)');
        qryMapaRenVarOutros.SQL.Add('           AND (SM.IDSEGMENTACAO                   = EM.IDSEGMENTACAO)');
        //AL_22
        if not QryAuxiliar.IsEmpty then
        begin
           qryMapaRenVarOutros.SQL.Add('           AND (');
           while not QryAuxiliar.Eof do
           begin
              qryMapaRenVarOutros.SQL.Add('           (H1.IDCARTEIRAINVEST = '+QryAuxiliar.FieldByName('IDCARTEIRAINVEST').AsString+' )');
              QryAuxiliar.Next;
              if not QryAuxiliar.Eof then
                 qryMapaRenVarOutros.SQL.Add('          OR');
           end;
           qryMapaRenVarOutros.SQL.Add('               )');
        end;
        qryMapaRenVarOutros.SQL.Add('         ORDER BY PLANPRVCONTABPATRO, DESCCARTINVEST, DESCINVESTIMENTO');
        qryMapaRenVarOutros.SQL.Add('    )');
        qryMapaRenVarOutros.SQL.Add('   GROUP BY PLANPRVCONTABPATRO, DESCINVESTIMENTO, SIGLAACAOBOLSA, DESCCARTINVEST, COTACAO, DATACOTACAO, LOTE,');
        qryMapaRenVarOutros.SQL.Add('         STAAJUSTEQTD, STAAJUSTECUSTO, DESCSEGMENTACAO, IDSEGMENTACAO');
        qryMapaRenVarOutros.SQL.Add('  ORDER BY PLANPRVCONTABPATRO, DESCCARTINVEST, DESCINVESTIMENTO ) TOT' );
        qryMapaRenVarOutros.SQL.Add('GROUP BY TOT.PLANPRVCONTABPATRO, TOT.DESCSEGMENTACAO, TOT.IDSEGMENTACAO, TOT.DESCCARTINVEST, TOT.SALDOPLANO');
        qryMapaRenVarOutros.SQL.Add('ORDER BY TOT.PLANPRVCONTABPATRO, TOT.DESCSEGMENTACAO, TOT.IDSEGMENTACAO, TOT.DESCCARTINVEST');

        qryMapaRenVarOutros.Open;


        qryMapaRenVarOutros.EnableControls;

   /////////////////////////////////////////////////////////////
   //SUB REL =>  qryMapaRenVar
   /////////////////////////////////////////////////////////////

        QryAuxiliar.First;

        qryMapaRenVar.DisableControls;
        qryMapaRenVar.Filter := '';
        qryMapaRenVar.Filtered := False;

        OperComum.LimpaParametros(qryMapaRenVar);
        qryMapaRenVar.SQL.Clear;
        qryMapaRenVar.SQL.Add('SELECT');
        qryMapaRenVar.SQL.Add('   PLANPRVCONTABPATRO, DESCCARTINVEST, SIGLAACAOBOLSA, DESCINVESTIMENTO,');
        qryMapaRenVar.SQL.Add('   DATACOTACAO, COTACAO, LOTE, STAAJUSTEQTD, STAAJUSTECUSTO, DESCSEGMENTACAO, IDSEGMENTACAO, ');
        // William M. Santos - Sol 122648 Kintana 605169 - INI
        //qryMapaRenVar.SQL.Add('   SUM(SALDOQTDEINVCART) AS SALDOQTDEINVCART,');
        // William M. Santos - SOL 125637 Kintana 649764 - INI
        qryMapaRenVar.SQL.Add('   SUM(SALDOQTDEINVCART) AS SALDOQTDEINVCART, SUM(QTDECC) AS QTDECC, TRUNC(SUM(QTDECC * COTACAO),2) AS SALDOVLRCC, TRUNC(SUM (QTDECCI * COTACAO),2) AS SALDOVLRCCI, SUM(QTDECCI) AS QTDECCI,  ');
        // William M. Santos - SOL 125637 Kintana 649764 - FIM
        // William M. Santos - Sol 122648 Kintana 605169 - FIM
        qryMapaRenVar.SQL.Add('   SUM(SALDOVLRINVCART) AS SALDOVLRINVCART, SUM(SALDOAQUI) AS SALDOAQUI, ');//SUM(PUCUSTO) AS PUCUSTO,');
        //Renan Cristiano Sol 140550 Kintana 880191 INI
        qryMapaRenVar.SQL.Add('   DECODE(SUM(SALDOQTDEINVCART),0,0,(ROUND((SUM(SALDOAQUI) / SUM(SALDOQTDEINVCART)),10))) AS PUCUSTO,');
        //Renan Cristiano Sol 140550 Kintana 880191 FIM
        qryMapaRenVar.SQL.Add('   SUM(VLRRESTCAPITAL) AS VLRRESTCAPITAL, SUM(SALDOQTDEINVCARTANT) AS SALDOQTDEINVCARTANT,');
        qryMapaRenVar.SQL.Add('   SUM(SALDOVLRINVCARTANT) AS SALDOVLRINVCARTANT, SUM(VARIACAO) AS VARIACAO, SUM(QTDECOMPRAS) AS QTDECOMPRAS,');
        qryMapaRenVar.SQL.Add('   SUM(VLRCOMPRAS) AS VLRCOMPRAS, SUM(QTDEVENDAS) AS QTDEVENDAS, SUM(VLRVENDAS) AS VLRVENDAS,');
        qryMapaRenVar.SQL.Add('   SUM(DIF) AS DIF, SUM(QTDAJUSTE) AS QTDAJUSTE, SUM(VLRAJUSTE) AS VLRAJUSTE, SUM(CUSTOAJUSTE) AS CUSTOAJUSTE,');
        qryMapaRenVar.SQL.Add('   SUM(VLRTRPBAIXA) AS VLRTRPBAIXA, SUM(QTDTRPBAIXA) AS QTDTRPBAIXA,');
        qryMapaRenVar.SQL.Add('   SUM(VLRTRPACRESC) AS VLRTRPACRESC, SUM(QTDTRPACRESC) AS QTDTRPACRESC,');
        //AL_22
        qryMapaRenVar.SQL.Add('   SUM(DECODE(SUM(SALDOQTDEINVCART), 0, 0, SUM(SALDOVLRINVCART) )) OVER (PARTITION BY PLANPRVCONTABPATRO) AS SALDOPLANO,');
        qryMapaRenVar.SQL.Add('   SUM(DECODE(SUM(SALDOQTDEINVCART), 0, 0, SUM(SALDOVLRINVCART) )) OVER (PARTITION BY PLANPRVCONTABPATRO, DESCCARTINVEST) AS SALDOCART,');
        qryMapaRenVar.SQL.Add('   SUM(DECODE(SUM(SALDOQTDEINVCART), 0, 0, SUM(SALDOVLRINVCART) )) OVER (PARTITION BY PLANPRVCONTABPATRO, DESCCARTINVEST, DESCINVESTIMENTO) AS SALDOINV,');
        qryMapaRenVar.SQL.Add('   SUM(DECODE(SUM(SALDOQTDEINVCART), 0, 0, SUM(SALDOVLRINVCART) )) OVER (PARTITION BY DESCCARTINVEST) AS SALDOGERAL,');

        // William M. Santos - Sol 122648 Kintana 605169 - INI
        // William M. Santos - SOL 125637 Kintana 649764 - INI
        qryMapaRenVar.SQL.Add('   SUM(DECODE(SUM(QTDECC),0,0, ROUND(SUM (QTDECC * COTACAO),2) )) OVER (PARTITION BY PLANPRVCONTABPATRO) AS SALDOPLANOCC,');
        qryMapaRenVar.SQL.Add('   SUM(DECODE(SUM(QTDECC),0,0, ROUND(SUM (QTDECC * COTACAO),2) )) OVER (PARTITION BY PLANPRVCONTABPATRO, DESCCARTINVEST) AS SALDOCARTCC,');
        qryMapaRenVar.SQL.Add('   SUM(DECODE(SUM(QTDECC),0,0, ROUND(SUM (QTDECC * COTACAO),2) )) OVER (PARTITION BY PLANPRVCONTABPATRO, DESCCARTINVEST, DESCINVESTIMENTO) AS SALDOINVCC,');
        qryMapaRenVar.SQL.Add('   SUM(DECODE(SUM(QTDECC),0,0, ROUND(SUM (QTDECC * COTACAO),2) )) OVER (PARTITION BY DESCCARTINVEST) AS SALDOGERALCC,');

        qryMapaRenVar.SQL.Add('   SUM(DECODE(SUM(QTDECCI),0,0, ROUND(SUM(QTDECCI * COTACAO),2) )) OVER (PARTITION BY PLANPRVCONTABPATRO) AS SALDOPLANOCCI,');
        qryMapaRenVar.SQL.Add('   SUM(DECODE(SUM(QTDECCI),0,0, ROUND(SUM(QTDECCI * COTACAO),2) )) OVER (PARTITION BY PLANPRVCONTABPATRO, DESCCARTINVEST) AS SALDOCARTCCI,');
        qryMapaRenVar.SQL.Add('   SUM(DECODE(SUM(QTDECCI),0,0, ROUND(SUM(QTDECCI * COTACAO),2) )) OVER (PARTITION BY PLANPRVCONTABPATRO, DESCCARTINVEST, DESCINVESTIMENTO) AS SALDOINVCCI,');
        qryMapaRenVar.SQL.Add('   SUM(DECODE(SUM(QTDECCI),0,0, ROUND(SUM(QTDECCI * COTACAO),2) )) OVER (PARTITION BY DESCCARTINVEST) AS SALDOGERALCCI');
        // William M. Santos - SOL 125637 Kintana 649764 - FIM
        // William M. Santos - Sol 122648 Kintana 605169 - FIM

        qryMapaRenVar.SQL.Add('FROM (');
        //AL_22
        qryMapaRenVar.SQL.Add('         SELECT ');
        qryMapaRenVar.SQL.Add('                AB2.SIGLAACAOBOLSA, PP.PLANPRVCONTABPATRO,');
        qryMapaRenVar.SQL.Add('                '+OperComum.IIF(sGroup = 'A','CA.DESCCARTINVEST',QuotedStr(' '))+' AS DESCCARTINVEST,');
        qryMapaRenVar.SQL.Add('                IV.DESCINVESTIMENTO,');

        qryMapaRenVar.SQL.Add('                NVL(H1.SALDOQTDEINVCART,0) AS SALDOQTDEINVCART,');
        
        qryMapaRenVar.SQL.Add('                DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0, (NVL(H1.SALDOVLRINVCART,0))) AS SALDOVLRINVCART,');
        qryMapaRenVar.SQL.Add('                ROUND(NVL(H1.SALDOAQUI,0),2) AS SALDOAQUI,');
        //Renan Cristiano Sol 140550 Kintana 880191 INI
//        qryMapaRenVar.SQL.Add('                DECODE(H1.SALDOQTDEINVCART,0,0,(ROUND((H1.SALDOAQUI / H1.SALDOQTDEINVCART),10))) AS PUCUSTO,');
        //Renan Cristiano Sol 140550 Kintana 880191 FIM
        qryMapaRenVar.SQL.Add('                NVL(OPER.VLRRESTITUICAO * -1,0) AS VLRRESTCAPITAL,');
        qryMapaRenVar.SQL.Add('                NVL(SALDOANTERIOR.SALDOQTDEINVCART,0) AS SALDOQTDEINVCARTANT,');
        qryMapaRenVar.SQL.Add('                NVL(SALDOANTERIOR.SALDOVLRINVCART,0) AS SALDOVLRINVCARTANT,');
        qryMapaRenVar.SQL.Add('                DECODE(((NVL(SALDOANTERIOR.SALDOVLRINVCART,0)');
        qryMapaRenVar.SQL.Add('                           + NVL(OPER.VLRCOMPRAS,0)');
        qryMapaRenVar.SQL.Add('                           - NVL(OPER.VLRCOMPRASDIRSUB,0)');
        qryMapaRenVar.SQL.Add('                           + NVL(OPER.DESPESASCP,0)');
        qryMapaRenVar.SQL.Add('                           - NVL(OPER.VLRVENDAS,0)');
        qryMapaRenVar.SQL.Add('                           + NVL(OPER.DESPESASVD,0)');
        qryMapaRenVar.SQL.Add('                           + NVL(OPER.VLRTRPBAIXA,0)');
        qryMapaRenVar.SQL.Add('                           + NVL(OPER.VLRTRPACRESC,0)');
        qryMapaRenVar.SQL.Add('                           - DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0, (NVL(H1.SALDOVLRINVCART,0))) )* - 1), 0, 0,');
        qryMapaRenVar.SQL.Add('                          ((NVL(SALDOANTERIOR.SALDOVLRINVCART,0)');
        qryMapaRenVar.SQL.Add('                           + NVL(OPER.VLRCOMPRAS,0)');
        qryMapaRenVar.SQL.Add('                           - NVL(OPER.VLRCOMPRASDIRSUB,0)');
        qryMapaRenVar.SQL.Add('                           + NVL(OPER.DESPESASCP,0)');
        qryMapaRenVar.SQL.Add('                           - NVL(OPER.VLRVENDAS,0)');
        qryMapaRenVar.SQL.Add('                           + NVL(OPER.DESPESASVD,0)');
        qryMapaRenVar.SQL.Add('                           + NVL(OPER.VLRTRPBAIXA,0)');
        qryMapaRenVar.SQL.Add('                           + NVL(OPER.VLRTRPACRESC,0)');
        qryMapaRenVar.SQL.Add('                           - DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0, (NVL(H1.SALDOVLRINVCART,0))) )* - 1) + NVL(OPER.VLRRESTITUICAO,0)) AS VARIACAO,');
        qryMapaRenVar.SQL.Add('                (NVL(OPER.QTDECOMPRAS,0) + NVL(OPER.QTDTRPACRESC,0)) AS QTDECOMPRAS,');
        qryMapaRenVar.SQL.Add('                (NVL(OPER.VLRCOMPRAS,0)  + NVL(OPER.DESPESASCP,0) - NVL(OPER.VLRCOMPRASDIRSUB,0) + NVL(OPER.VLRTRPACRESC,0) ) AS VLRCOMPRAS,');
        qryMapaRenVar.SQL.Add('                (NVL(OPER.QTDEVENDAS,0)  + NVL(OPER.QTDTRPBAIXA,0)) AS QTDEVENDAS,');
        qryMapaRenVar.SQL.Add('                (NVL(OPER.VLRVENDAS,0) - NVL(OPER.DESPESASVD,0) + ABS(NVL(OPER.VLRTRPBAIXA,0)) ) AS VLRVENDAS,');
        qryMapaRenVar.SQL.Add('                ROUND((COT.VLRCONTABIL/COT.QTDTITLOTE),8) AS COTACAO,');
        qryMapaRenVar.SQL.Add('                (COT.DATACOTACAO) AS DATACOTACAO,');
        qryMapaRenVar.SQL.Add('                (COT.QTDTITLOTE) AS LOTE,');
        qryMapaRenVar.SQL.Add('                ROUND((H1.SALDOVLRINVCART - (H1.SALDOQTDEINVCART * (COT.VLRCONTABIL/COT.QTDTITLOTE))),2) AS DIF,');
        qryMapaRenVar.SQL.Add('                NVL(AJQ.QTDEOPERACAO,0) AS QTDAJUSTE,');
        qryMapaRenVar.SQL.Add('                NVL(AJQ.VLROPERACAO,0)  AS VLRAJUSTE,');
        qryMapaRenVar.SQL.Add('                DECODE(NVL(AJQ.QTDEOPERACAO,0),0,'''',''*'') AS STAAJUSTEQTD,');
        qryMapaRenVar.SQL.Add('                NVL(AJC.VLROPERACAO,0)  AS CUSTOAJUSTE,');
        qryMapaRenVar.SQL.Add('                DECODE(NVL(AJC.VLROPERACAO,0),0,'''',''*'') AS STAAJUSTECUSTO,');
        qryMapaRenVar.SQL.Add('                ABS(NVL(OPER.VLRTRPBAIXA,0))  AS VLRTRPBAIXA,');
        qryMapaRenVar.SQL.Add('                NVL(OPER.QTDTRPBAIXA,0)  AS QTDTRPBAIXA,');
        //Ricardo Cristiano - 23/11/2010 - N. Sol 148219 -  N. Kintana  1037536        
        qryMapaRenVar.SQL.Add('                ABS(NVL(OPER.VLRTRPACRESC,0)) AS VLRTRPACRESC,');
        qryMapaRenVar.SQL.Add('                NVL(OPER.QTDTRPACRESC,0) AS QTDTRPACRESC,');
  //AL_22
  //      qryMapaRenVar.SQL.Add('                SUM(DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0, (NVL(H1.SALDOVLRINVCART,0)))) OVER (PARTITION BY H1.IDPLANPREVCTBPATR) AS SALDOPLANO,');
  //      qryMapaRenVar.SQL.Add('                SUM(DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0, (NVL(H1.SALDOVLRINVCART,0)))) OVER (PARTITION BY H1.IDPLANPREVCTBPATR, H1.IDCARTEIRAINVEST) AS SALDOCART,');
  //      qryMapaRenVar.SQL.Add('                SUM(DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0, (NVL(H1.SALDOVLRINVCART,0)))) OVER (PARTITION BY H1.IDPLANPREVCTBPATR, H1.IDINVESTIMENTO) AS SALDOINV,');
        qryMapaRenVar.SQL.Add('                '+OperComum.IIF(sGroup = 'A','H1.IDCARTEIRAINVEST','1')+' AS IDCARTEIRAINVEST,');

        // William M. Santos - Sol 122648 Kintana 605169 - INI
        qryMapaRenVar.SQL.Add('               NVL(H1.SALDOQTDECPMF,0) AS QTDECC,');
        qryMapaRenVar.SQL.Add('              (NVL(H1.SALDOQTDEINVCART,0) - NVL(H1.SALDOQTDECPMF,0)) AS QTDECCI ');
        // William M. Santos - Sol 122648 Kintana 605169 - FIM
        qryMapaRenVar.SQL.Add('               , SM.DESCSEGMENTACAO, SM.IDSEGMENTACAO');

        qryMapaRenVar.SQL.Add('         FROM HISTCARTINV H1, INVESTIMENTO IV, CARTEIRAINVEST CA, TIPOOPERACAO TP, VWPLANPREVCTBPATR PP, EMISSOR EM, SEGMENTACAOMERCADO SM,');
        qryMapaRenVar.SQL.Add('            (SELECT IDINVESTIMENTO, DATACOTACAO, VLRCONTABIL, QTDTITLOTE');
        qryMapaRenVar.SQL.Add('             FROM COTACAOINVEST');
        qryMapaRenVar.SQL.Add('             WHERE DATACOTACAO||IDINVESTIMENTO IN (SELECT MAX(DATACOTACAO)||IDINVESTIMENTO');
        qryMapaRenVar.SQL.Add('                                                   FROM COTACAOINVEST');
        qryMapaRenVar.SQL.Add('                                                   WHERE DATACOTACAO <= TO_DATE('+QuotedStr(DateToStr(dDataFimGroup))+',''DD/MM/YYYY'')');
        qryMapaRenVar.SQL.Add('                                                   GROUP BY IDINVESTIMENTO) ) COT,');
        qryMapaRenVar.SQL.Add('            (SELECT HA.IDPLANPREVCTBPATR, HA.IDCARTEIRAINVEST,HA.IDINVESTIMENTO, HA.SALDOQTDEINVCART, HA.SALDOVLRINVCART, HA.SALDOVARIACAO');
        qryMapaRenVar.SQL.Add('             FROM HISTCARTINV HA');
        qryMapaRenVar.SQL.Add('             WHERE (HA.IDHISTCARTINV IN');
        qryMapaRenVar.SQL.Add('                    (SELECT MAX(HA2.IDHISTCARTINV)');
        qryMapaRenVar.SQL.Add('                     FROM HISTCARTINV HA2');
        qryMapaRenVar.SQL.Add('                     WHERE (HA2.IDTIPOINVEST = 2)');
        if trim(sPlanPrevGroup) = '' then
           qryMapaRenVar.SQL.Add('                       AND (HA2.IDPLANPREVCTBPATR > 0)')
        else
           qryMapaRenVar.SQL.Add('                       AND (HA2.IDPLANPREVCTBPATR = '+sPlanPrevGroup+')');
        if trim(sCartInvestGroup) = '' then
           qryMapaRenVar.SQL.Add('                       AND (HA2.IDCARTEIRAINVEST > 0)')
        else
           qryMapaRenVar.SQL.Add('                       AND (HA2.IDCARTEIRAINVEST = '+sCartInvestGroup+')');
        qryMapaRenVar.SQL.Add('                       AND (HA2.IDCARTEIRAGERENC IS NULL)');
        qryMapaRenVar.SQL.Add('                       AND (HA2.DATAMOVCARTINV = TO_DATE('+QuotedStr(DateToStr(dDataAntGroup))+',''DD/MM/YYYY''))');
        qryMapaRenVar.SQL.Add('                     GROUP BY HA2.IDTIPOINVEST, HA2.IDPLANPREVCTBPATR, HA2.IDCARTEIRAINVEST, HA2.IDCARTEIRAGERENC,');
        qryMapaRenVar.SQL.Add('                              HA2.IDINVESTIMENTO, HA2.DATAMOVCARTINV) )');
        qryMapaRenVar.SQL.Add('               AND (HA.SALDOVLRINVCART IS NOT NULL )) SALDOANTERIOR,');
        //AL_23
        qryMapaRenVar.SQL.Add('            (SELECT SUM(DECODE(HC.NATURMOVCARTINV,''A'',DECODE(HC.TIPMOVCARTINV,''OPE'',NVL(HC.QTDEMOVINVCART,0),''TRC'',NVL(HC.QTDEMOVINVCART,0),0),0)) AS QTDECOMPRAS,');
        qryMapaRenVar.SQL.Add('                    SUM(DECODE(HC.NATURMOVCARTINV,''A'',DECODE(HC.TIPMOVCARTINV,''OPE'',NVL(ABS(HC.VLRMOVCARTINV),0),''TRC'',NVL(ABS(HC.VLRMOVCARTINV),0),0),0)) AS VLRCOMPRAS,');

        qryMapaRenVar.SQL.Add('                    SUM(DECODE(TP.IDTIPOOPERACAO,PR.IDTIPOOPERDIRDSU,         NVL(ABS(HC.VLRMOVCARTINV),0),');
        qryMapaRenVar.SQL.Add('                                                 PR.IDTIPOOPERDIRDSU + 10000, NVL(ABS(HC.VLRMOVCARTINV),0), 0)) AS VLRCOMPRASDIRSUB,');
        qryMapaRenVar.SQL.Add('                    SUM(DECODE(TP.IDTIPOOPERACAO,  -114,NVL(ABS(HC.VLRMOVCARTINV),0),');
        qryMapaRenVar.SQL.Add('                                                 -10114,NVL(ABS(HC.VLRMOVCARTINV),0), 0 ) ) AS VLRVENDASDIRSUB,');
        //AL_23
        qryMapaRenVar.SQL.Add('                    SUM(DECODE(HC.NATURMOVCARTINV,''D'',DECODE(HC.TIPMOVCARTINV,''OPE'',NVL(HC.QTDEMOVINVCART,0),''TRC'',NVL(HC.QTDEMOVINVCART,0),0),0)) AS QTDEVENDAS,');
        qryMapaRenVar.SQL.Add('                    SUM(DECODE(HC.NATURMOVCARTINV,''D'',DECODE(HC.TIPMOVCARTINV,''OPE'',NVL(ABS(HC.VLRMOVCARTINV),0),''TRC'',NVL(ABS(HC.VLRMOVCARTINV),0),0),0)) AS VLRVENDAS,');

        qryMapaRenVar.SQL.Add('                    SUM(DECODE(HC.NATURMOVCARTINV,''D'',NVL(ABS(OPER.DESPESAS),0),0)) AS DESPESASVD,');
        qryMapaRenVar.SQL.Add('                    SUM(DECODE(HC.NATURMOVCARTINV,''D'',NVL(OPER.LUCPREJ,0),0)) AS LUCPREJ,');
        qryMapaRenVar.SQL.Add('                    SUM(DECODE(HC.NATURMOVCARTINV,''A'',NVL(ABS(OPER.DESPESAS),0),0)) AS DESPESASCP,');
        qryMapaRenVar.SQL.Add('                    SUM(DECODE(HC.IDTIPOOPERACAO,  PR.IDTIPOOPERDIRRES ,      NVL(ABS(HC.VLRMOVCARTINV),0),');
        qryMapaRenVar.SQL.Add('                                                   PR.IDTIPOOPERDIRRES+10000, NVL(ABS(HC.VLRMOVCARTINV),0),0)) AS VLRRESTITUICAO,');
        qryMapaRenVar.SQL.Add('                    SUM(DECODE(HC.NATURMOVCARTINV,''D'',NVL(OPER.VLRTRPBAIXA,0),0)) AS VLRTRPBAIXA,');
        qryMapaRenVar.SQL.Add('                    SUM(DECODE(HC.NATURMOVCARTINV,''D'',NVL(OPER.QTDTRPBAIXA,0),0)) AS QTDTRPBAIXA,');
        //Ricardo Cristiano - 23/11/2010 - N. Sol 148219 -  N. Kintana  1037536
        qryMapaRenVar.SQL.Add('                    SUM(DECODE(HC.NATURMOVCARTINV,''A'',ABS(NVL(OPER.VLRTRPACRESC,0)),0)) AS VLRTRPACRESC,');
        qryMapaRenVar.SQL.Add('                    SUM(DECODE(HC.NATURMOVCARTINV,''A'',NVL(OPER.QTDTRPACRESC,0),0)) AS QTDTRPACRESC,');
        qryMapaRenVar.SQL.Add('                    HC.IDPLANPREVCTBPATR,');
        qryMapaRenVar.SQL.Add('                    HC.IDCARTEIRAINVEST,');
        qryMapaRenVar.SQL.Add('                    HC.IDINVESTIMENTO');
        qryMapaRenVar.SQL.Add('             FROM HISTCARTINV HC, INVESTIMENTO IV, TIPOOPERACAO TP, OPERACAOINVEST OP, CORRETVALORES CV,');
        qryMapaRenVar.SQL.Add('                  CARTEIRAINVEST CI, PARAMINVEST PR,');
        qryMapaRenVar.SQL.Add('                  (SELECT HI.IDOPERACAOINVEST,');
        qryMapaRenVar.SQL.Add('                          SUM(DECODE(HI.TIPMOVCARTINV,''DOP'',DECODE(NATURMOVOPER,''D'',(VLRMOVCARTINV*-1),VLRMOVCARTINV),0)) AS DESPESAS,');
        qryMapaRenVar.SQL.Add('                          SUM(DECODE(HI.TIPMOVCARTINV,''LUC'',VLRMOVCARTINV,0)) AS LUCPREJ,');
        qryMapaRenVar.SQL.Add('                          SUM(DECODE(HI.TIPMOVCARTINV,''TRP'',DECODE(NATURMOVOPER,''D'',VLRMOVCARTINV,0)))  AS VLRTRPBAIXA,');
        qryMapaRenVar.SQL.Add('                          SUM(DECODE(HI.TIPMOVCARTINV,''TRP'',DECODE(NATURMOVOPER,''D'',QTDEMOVINVCART,0))) AS QTDTRPBAIXA,');
        //Ricardo Cristiano - 23/11/2010 - N. Sol 148219 -  N. Kintana  1037536        
        qryMapaRenVar.SQL.Add('                          SUM(DECODE(HI.TIPMOVCARTINV,''TRP'',DECODE(NATURMOVOPER,''A'',ABS(VLRMOVCARTINV),0)))  AS VLRTRPACRESC,');
        qryMapaRenVar.SQL.Add('                          SUM(DECODE(HI.TIPMOVCARTINV,''TRP'',DECODE(NATURMOVOPER,''A'',QTDEMOVINVCART,0)))  AS QTDTRPACRESC');
        qryMapaRenVar.SQL.Add('                   FROM HISTCARTINV HI');
        qryMapaRenVar.SQL.Add('                   WHERE (HI.IDTIPOINVEST = 2)');
        if trim(sPlanPrevGroup) = '' then
           qryMapaRenVar.SQL.Add('                     AND (HI.IDPLANPREVCTBPATR > 0)')
        else
           qryMapaRenVar.SQL.Add('                     AND (HI.IDPLANPREVCTBPATR = '+sPlanPrevGroup+')');
        if trim(sCartInvestGroup) = '' then
           qryMapaRenVar.SQL.Add('                     AND (HI.IDCARTEIRAINVEST > 0)')
        else
           qryMapaRenVar.SQL.Add('                     AND (HI.IDCARTEIRAINVEST = '+sCartInvestGroup+')');
        qryMapaRenVar.SQL.Add('                     AND (HI.IDCARTEIRAGERENC IS NULL)');
        qryMapaRenVar.SQL.Add('                     AND (HI.DATAMOVCARTINV BETWEEN TO_DATE('+QuotedStr(DateToStr(dDataIniGroup))+',''DD/MM/YYYY'') AND');
        qryMapaRenVar.SQL.Add('                                                    TO_DATE('+QuotedStr(DateToStr(dDataFimGroup))+',''DD/MM/YYYY''))');
        qryMapaRenVar.SQL.Add('                     AND ( (HI.TIPMOVCARTINV = ''DOP'') OR');
        qryMapaRenVar.SQL.Add('                           (HI.TIPMOVCARTINV = ''LUC'') OR');
        qryMapaRenVar.SQL.Add('                           (HI.TIPMOVCARTINV = ''TRP'') )');
        qryMapaRenVar.SQL.Add('                   GROUP BY HI.IDOPERACAOINVEST) OPER');
        qryMapaRenVar.SQL.Add('             WHERE (HC.IDTIPOINVEST = 2)');
        if trim(sPlanPrevGroup) = '' then
           qryMapaRenVar.SQL.Add('               AND (HC.IDPLANPREVCTBPATR > 0)')
        else
           qryMapaRenVar.SQL.Add('               AND (HC.IDPLANPREVCTBPATR = '+sPlanPrevGroup+')');
        if trim(sCartInvestGroup) = '' then
           qryMapaRenVar.SQL.Add('               AND (HC.IDCARTEIRAINVEST > 0)')
        else
           qryMapaRenVar.SQL.Add('               AND (HC.IDCARTEIRAINVEST = '+sCartInvestGroup+')');
        qryMapaRenVar.SQL.Add('               AND (HC.IDCARTEIRAGERENC IS NULL)');
        qryMapaRenVar.SQL.Add('               AND (HC.DATAMOVCARTINV BETWEEN TO_DATE('+QuotedStr(DateToStr(dDataIniGroup))+',''DD/MM/YYYY'') AND');
        qryMapaRenVar.SQL.Add('                                              TO_DATE('+QuotedStr(DateToStr(dDataFimGroup))+',''DD/MM/YYYY''))');
        //AL_23
        qryMapaRenVar.SQL.Add('               AND ((HC.TIPMOVCARTINV = ''OPE'') OR (HC.TIPMOVCARTINV = ''TRP'') OR (HC.TIPMOVCARTINV = ''TRC''))');

        qryMapaRenVar.SQL.Add('               AND (HC.IDTIPOINVEST     = IV.IDTIPOINVEST)');
        qryMapaRenVar.SQL.Add('               AND (HC.IDINVESTIMENTO   = IV.IDINVESTIMENTO)');
        qryMapaRenVar.SQL.Add('               AND (HC.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST)');
        qryMapaRenVar.SQL.Add('               AND (HC.IDTIPOINVEST     = TP.IDTIPOINVEST(+))');
        qryMapaRenVar.SQL.Add('               AND (HC.IDTIPOOPERACAO   = TP.IDTIPOOPERACAO(+))');
        qryMapaRenVar.SQL.Add('               AND (HC.IDOPERACAOINVEST = OP.IDOPERACAOINVEST(+))');
        qryMapaRenVar.SQL.Add('               AND (OP.IDCORRETVALORES  = CV.IDCORRETVALORES(+))');
        qryMapaRenVar.SQL.Add('               AND (HC.IDOPERACAOINVEST = OPER.IDOPERACAOINVEST(+))');
        qryMapaRenVar.SQL.Add('             GROUP BY HC.IDTIPOINVEST, HC.IDPLANPREVCTBPATR, HC.IDCARTEIRAINVEST, HC.IDCARTEIRAGERENC,');
        qryMapaRenVar.SQL.Add('                      HC.IDINVESTIMENTO) OPER,');
        qryMapaRenVar.SQL.Add('            (SELECT SUM(NVL(O.QTDEOPERACAO,0)) AS QTDEOPERACAO, SUM(NVL(O.VLROPERACAO,0)) AS VLROPERACAO,');
        qryMapaRenVar.SQL.Add('                    O.IDINVESTIMENTO, O.IDCARTEIRAINVEST, O.IDPLANPREVCTBPATR');
        qryMapaRenVar.SQL.Add('             FROM OPERACAOINVEST O, BOLETA B');
        qryMapaRenVar.SQL.Add('             WHERE (O.IDTIPOINVEST = 2)');
        if trim(sPlanPrevGroup) = '' then
           qryMapaRenVar.SQL.Add('               AND (O.IDPLANPREVCTBPATR > 0)')
        else
           qryMapaRenVar.SQL.Add('               AND (O.IDPLANPREVCTBPATR = '+sPlanPrevGroup+')');
        if trim(sCartInvestGroup) = '' then
           qryMapaRenVar.SQL.Add('               AND (O.IDCARTEIRAINVEST > 0)')
        else
           qryMapaRenVar.SQL.Add('               AND (O.IDCARTEIRAINVEST = '+sCartInvestGroup+')');
        qryMapaRenVar.SQL.Add('               AND (O.IDCARTEIRAGERENC IS NULL)');
        qryMapaRenVar.SQL.Add('               AND (O.DATAOPERACAO BETWEEN TO_DATE('+QuotedStr(DateToStr(dDataIniGroup))+',''DD/MM/YYYY'') AND');
        qryMapaRenVar.SQL.Add('                                           TO_DATE('+QuotedStr(DateToStr(dDataFimGroup))+',''DD/MM/YYYY''))');
        qryMapaRenVar.SQL.Add('               AND (B.IDBOLETA     = O.NUMDOCUMENTO)');
        qryMapaRenVar.SQL.Add('               AND (B.TIPMOVBOLETA = ''AJQ'')');
        qryMapaRenVar.SQL.Add('             GROUP BY O.IDTIPOINVEST, O.IDPLANPREVCTBPATR, O.IDCARTEIRAINVEST, O.IDINVESTIMENTO) AJQ,');
        qryMapaRenVar.SQL.Add('            (SELECT SUM(NVL(O.VLROPERACAO,0)) AS VLROPERACAO, O.IDINVESTIMENTO, O.IDCARTEIRAINVEST, O.IDPLANPREVCTBPATR');
        qryMapaRenVar.SQL.Add('             FROM OPERACAOINVEST O, BOLETA B');
        qryMapaRenVar.SQL.Add('             WHERE (O.IDTIPOINVEST = 2)');
        if trim(sPlanPrevGroup) = '' then
           qryMapaRenVar.SQL.Add('               AND (O.IDPLANPREVCTBPATR > 0)')
        else
           qryMapaRenVar.SQL.Add('               AND (O.IDPLANPREVCTBPATR = '+sPlanPrevGroup+')');
        if trim(sCartInvestGroup) = '' then
           qryMapaRenVar.SQL.Add('               AND (O.IDCARTEIRAINVEST  > 0)')
        else
           qryMapaRenVar.SQL.Add('               AND (O.IDCARTEIRAINVEST = '+sCartInvestGroup+')');
        qryMapaRenVar.SQL.Add('               AND (O.IDCARTEIRAGERENC IS NULL)');
        qryMapaRenVar.SQL.Add('               AND (O.DATAOPERACAO BETWEEN TO_DATE('+QuotedStr(DateToStr(dDataIniGroup))+',''DD/MM/YYYY'') AND');
        qryMapaRenVar.SQL.Add('                                           TO_DATE('+QuotedStr(DateToStr(dDataFimGroup))+',''DD/MM/YYYY''))');
        qryMapaRenVar.SQL.Add('               AND (B.IDBOLETA     = O.NUMDOCUMENTO)');
        qryMapaRenVar.SQL.Add('               AND (B.TIPMOVBOLETA = ''AJC'')');
        qryMapaRenVar.SQL.Add('             GROUP BY O.IDTIPOINVEST, O.IDPLANPREVCTBPATR, O.IDCARTEIRAINVEST, O.IDINVESTIMENTO) AJC,');
        qryMapaRenVar.SQL.Add('            (SELECT IDACAO, SIGLAACAOBOLSA');
        qryMapaRenVar.SQL.Add('             FROM ACOESXBOLSA A, PARAMINVEST P');
        qryMapaRenVar.SQL.Add('             WHERE A.IDBOLSAVALORES = P.IDBVSP) AB2');
        qryMapaRenVar.SQL.Add('         WHERE (H1.IDHISTCARTINV  IN');
        qryMapaRenVar.SQL.Add('                (SELECT MAX(H2.IDHISTCARTINV)');
        qryMapaRenVar.SQL.Add('                 FROM HISTCARTINV H2, PARAMINVEST P2');
        qryMapaRenVar.SQL.Add('                 WHERE (H2.IDTIPOINVEST = 2)');
        if trim(sPlanPrevGroup) = '' then
           qryMapaRenVar.SQL.Add('                   AND (H2.IDPLANPREVCTBPATR > 0)')
        else
           qryMapaRenVar.SQL.Add('                   AND (H2.IDPLANPREVCTBPATR = '+sPlanPrevGroup+')');
        if trim(sCartInvestGroup) = '' then
           qryMapaRenVar.SQL.Add('                   AND (H2.IDCARTEIRAINVEST > 0)')
        else
           qryMapaRenVar.SQL.Add('                   AND (H2.IDCARTEIRAINVEST = '+sCartInvestGroup+')');
        qryMapaRenVar.SQL.Add('                   AND (H2.IDCARTEIRAGERENC IS NULL)');
        qryMapaRenVar.SQL.Add('                   AND (H2.DATAMOVCARTINV  BETWEEN TO_DATE('+QuotedStr(DateToStr(dDataIniGroup))+',''DD/MM/YYYY'') AND');
        qryMapaRenVar.SQL.Add('                                                   TO_DATE('+QuotedStr(DateToStr(dDataFimGroup))+',''DD/MM/YYYY''))');
        //AL_28
        qryMapaRenVar.SQL.Add('                   AND (H2.IDTIPOOPERACAO <> -70) AND (H2.IDTIPOOPERACAO <> -10070)');  // Anúncio de proventos
        qryMapaRenVar.SQL.Add('                   AND (H2.IDTIPOOPERACAO <> -170) AND (H2.IDTIPOOPERACAO <> -10170)'); // Cancelamento de Anúncio
        qryMapaRenVar.SQL.Add('                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDIRDSU,0))');
        qryMapaRenVar.SQL.Add('                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDIRDSU,0) + 10000 )');
        qryMapaRenVar.SQL.Add('                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDIRJUR,0))');
        qryMapaRenVar.SQL.Add('                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDIRJUR,0) + 10000 )');
        qryMapaRenVar.SQL.Add('                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDIRMUL,0))');
        qryMapaRenVar.SQL.Add('                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDIRMUL,0) + 10000 )');
        qryMapaRenVar.SQL.Add('                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDIRDIV,0))');
        qryMapaRenVar.SQL.Add('                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDIRDIV,0) + 10000 )');
        qryMapaRenVar.SQL.Add('                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERRFRAC,0))');
        qryMapaRenVar.SQL.Add('                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERRFRAC,0) + 10000 )');
        qryMapaRenVar.SQL.Add('                 GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR, H2.IDCARTEIRAINVEST, H2.IDCARTEIRAGERENC,');
        qryMapaRenVar.SQL.Add('                          H2.IDINVESTIMENTO))');
        if trim(sSegmentacao) = '' then
           qryMapaRenVar.SQL.Add('                   AND (SM.IDSEGMENTACAO > 0)')
        else
           qryMapaRenVar.SQL.Add('                   AND (SM.IDSEGMENTACAO = ' + sSegmentacao + ')');
        qryMapaRenVar.SQL.Add('           AND (IV.IDINVESTIMENTO(+)               = H1.IDINVESTIMENTO)');
        qryMapaRenVar.SQL.Add('           AND (CA.IDCARTEIRAINVEST(+)             = H1.IDCARTEIRAINVEST)');
        qryMapaRenVar.SQL.Add('           AND (COT.IDINVESTIMENTO(+)              = H1.IDINVESTIMENTO)');
        qryMapaRenVar.SQL.Add('           AND (TP.IDTIPOINVEST(+)                 = H1.IDTIPOINVEST)');
        qryMapaRenVar.SQL.Add('           AND (TP.IDTIPOOPERACAO(+)               = H1.IDTIPOOPERACAO)');
        qryMapaRenVar.SQL.Add('           AND (PP.IDPLANPREVCTBPATR(+)            = H1.IDPLANPREVCTBPATR)');
        qryMapaRenVar.SQL.Add('           AND (SALDOANTERIOR.IDPLANPREVCTBPATR(+) = H1.IDPLANPREVCTBPATR)');
        qryMapaRenVar.SQL.Add('           AND (SALDOANTERIOR.IDCARTEIRAINVEST(+)  = H1.IDCARTEIRAINVEST)');
        qryMapaRenVar.SQL.Add('           AND (SALDOANTERIOR.IDINVESTIMENTO(+)    = H1.IDINVESTIMENTO)');
        qryMapaRenVar.SQL.Add('           AND (OPER.IDPLANPREVCTBPATR(+)          = H1.IDPLANPREVCTBPATR)');
        qryMapaRenVar.SQL.Add('           AND (OPER.IDCARTEIRAINVEST(+)           = H1.IDCARTEIRAINVEST)');
        qryMapaRenVar.SQL.Add('           AND (OPER.IDINVESTIMENTO(+)             = H1.IDINVESTIMENTO)');
        qryMapaRenVar.SQL.Add('           AND (AJQ.IDPLANPREVCTBPATR(+)           = H1.IDPLANPREVCTBPATR)');
        qryMapaRenVar.SQL.Add('           AND (AJQ.IDCARTEIRAINVEST(+)            = H1.IDCARTEIRAINVEST)');
        qryMapaRenVar.SQL.Add('           AND (AJQ.IDINVESTIMENTO(+)              = H1.IDINVESTIMENTO)');
        qryMapaRenVar.SQL.Add('           AND (AJC.IDPLANPREVCTBPATR(+)           = H1.IDPLANPREVCTBPATR)');
        qryMapaRenVar.SQL.Add('           AND (AJC.IDCARTEIRAINVEST(+)            = H1.IDCARTEIRAINVEST)');
        qryMapaRenVar.SQL.Add('           AND (AJC.IDINVESTIMENTO(+)              = H1.IDINVESTIMENTO)');
        qryMapaRenVar.SQL.Add('           AND (AB2.IDACAO(+)                      = H1.IDINVESTIMENTO)');
        qryMapaRenVar.SQL.Add('           AND (IV.IDEMISSOR                       = EM.IDEMISSOR)');
        qryMapaRenVar.SQL.Add('           AND (SM.IDSEGMENTACAO                   = EM.IDSEGMENTACAO)');
        //AL_22
        if not QryAuxiliar.IsEmpty then
        begin
           qryMapaRenVar.SQL.Add('           AND (');
           while not QryAuxiliar.Eof do
           begin
              qryMapaRenVar.SQL.Add('           (H1.IDCARTEIRAINVEST = '+QryAuxiliar.FieldByName('IDCARTEIRAINVEST').AsString+' )');
              QryAuxiliar.Next;
              if not QryAuxiliar.Eof then
                 qryMapaRenVar.SQL.Add('          OR');
           end;
           qryMapaRenVar.SQL.Add('               )');
        end;
        qryMapaRenVar.SQL.Add('         ORDER BY PLANPRVCONTABPATRO, DESCCARTINVEST, DESCINVESTIMENTO');
        qryMapaRenVar.SQL.Add('    )');
        qryMapaRenVar.SQL.Add('GROUP BY PLANPRVCONTABPATRO, DESCINVESTIMENTO, SIGLAACAOBOLSA, DESCCARTINVEST, COTACAO, DATACOTACAO, LOTE,');
        qryMapaRenVar.SQL.Add('         STAAJUSTEQTD, STAAJUSTECUSTO, DESCSEGMENTACAO, IDSEGMENTACAO');
        qryMapaRenVar.SQL.Add('ORDER BY PLANPRVCONTABPATRO, DESCCARTINVEST, DESCINVESTIMENTO');
        qryMapaRenVar.Open;

        qryMapaRenVar.EnableControls;

        Result := True;
     except
        Result := False;
     end;
   finally
     OperComum.LimpaParametros(QryAuxiliar);
     QryAuxiliar.Free;
   end;
end;

procedure TDmRelMapaRenVar.qryMapaRenVarOutrosAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if not QryMapaRenVar.IsEmpty then
    begin
      QryMapaRenVar.DisableControls;
      if not qryMapaRenVarOutrosIDSEGMENTACAO.IsNull then
         QryMapaRenVar.Filter := 'IDSEGMENTACAO = ' + qryMapaRenVarOutrosIDSEGMENTACAO.AsString +
                                 'AND PLANPRVCONTABPATRO = ' + QuotedStr(qryMapaRenVarOutrosPLANPRVCONTABPATRO.AsString) +
                                 'AND DESCCARTINVEST = ' + QuotedStr(qryMapaRenVarOutrosDESCCARTINVEST.AsString)
      else
         QryMapaRenVar.Filter := 'IDSEGMENTACAO = ' + QuotedStr('0');
      QryMapaRenVar.Filtered := True;
      QryMapaRenVar.EnableControls;
   end;
end;

//Ricardo Cristiano - 11/01/2010 - N. Sol 129458 -  N. Kintana 709966
procedure TDmRelMapaRenVar.ppdbDescCarteiraPosPrint(Sender: TObject);
begin
  inherited;

   if Trim(sCarteira) <> Trim(qryMapaRenVar.FieldByName('DESCCARTINVEST').AsString) then
      wCount := wCount + 1;

   sCarteira := qryMapaRenVar.FieldByName('DESCCARTINVEST').AsString;
end;

//Ricardo Cristiano - 11/01/2010 - N. Sol 129458 -  N. Kintana 709966
procedure TDmRelMapaRenVar.ppdbDescCarteiraConsPrint(Sender: TObject);
begin
  inherited;
   if Trim(sCarteira) <> Trim(qryMapaRenVar.FieldByName('DESCCARTINVEST').AsString) then
      wCount := wCount + 1;

   sCarteira := qryMapaRenVar.FieldByName('DESCCARTINVEST').AsString;
end;

//Ricardo Cristiano - 11/01/2010 - N. Sol 129458 -  N. Kintana 709966
procedure TDmRelMapaRenVar.ppgMPosCarteiraConsAfterPrint(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
end;

//Ricardo Cristiano - 11/01/2010 - N. Sol 129458 -  N. Kintana 709966
procedure TDmRelMapaRenVar.ppgMPosCarteiraConsBeforePrint(Sender: TObject);
begin
  inherited;
  if wCount > 1 then
     ppgMPosCarteiraCons.Visible := True
  else
     ppgMPosCarteiraCons.Visible := False;
end;

end.
