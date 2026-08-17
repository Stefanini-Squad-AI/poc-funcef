//******************************************************************************
// Rotina     : AbreQry
// SOL        : 189456
// Kintana    : 1809649
// Data       : 26/10/2012
// Responsável: Monica Gonzaga
// Descrição  : Mudança nas concatenações para formação do ID1 e ID.
//******************************************************************************
// Rotina     : AbreQry
// SOL        : 178236
// Kintana    : 1636025
// Data       : 13/04/2012
// Responsável: Otacilio aquino
// Descrição  : Implementado na consulta da qryMapaInvestFdoOutrosAn
//              tratamento para consulta Fundo Direito Creditorio valor
//              Amortização estava trazendo valor zero.
//              Alguns campos foram comentados na consulta
//******************************************************************************
// Rotina     : qryMapaInvestFdoOutrosAn, qryMapaInvestFdoOutros
// SOL        : 166338.6801
// Kintana    : 1451970
// Data       : 01/11/2011
// Responsável: Otacilio aquino
// Descrição  : Permitir mais de uma integralização para o mesmo fundo e na
//              mesma data
//******************************************************************************
// Rotina     : qryMapaInvFdoSintetico / qryMapaInvFdoAnalitico
// SOL        : 107258
// Kintana    : 482080
// Data       : 27/01/2009
// Responsável: Ricardo Cristiano
//  Implementação para agrupamento da operação de ajustes e atualização na variação//
//******************************************************************************
// Rotina     : qryMapaInvestFdoOutros / qryMapaInvestFdoOutrosAn /
//              qryMapaInvFdoSintetico / qryMapaInvFdoAnalitico
// SOL        : 100716
// Kintana    : 447117
// Data       : 08/12/2008
// Responsável: Ricardo Cristiano
// Motivo     : Implementação do identificador da operação de transferência para
//               a busca do valor de variação e de transferência
//******************************************************************************
// Rotina     : qryMapaInvFdoSintetico / qryMapaInvFdoAnalitico /
//              qryMapaInvestFdoOutros / qryMapaInvestFdoOutrosAn
// SOL        : 100716
// Kintana    : 447117       
// Data       : 04/12/2008
// Responsável: Ricardo Cristiano
// Motivo     : Implementação para otimizar a performance do relatório
//******************************************************************************
// Rotina     : qryMapaInvFdoSintetico / qryMapaInvFdoAnalitico /
//              qryMapaInvestFdoOutros / qryMapaInvestFdoOutrosAn
// SOL        : 100109
// Kintana    : 442729        
// Data       : 04/11/2008
// Responsável: Ricardo Cristiano
// Motivo     : Implementação para agrupar a variação por operação, isso fará
//               com que busque as atualizações(ATU) antes e depois da operação
//               de transferência entre planos(TRP).
//******************************************************************************
// Rotina     : qryMapaInvFdoSintetico/qryMapaInvFdoAnalitico
// SOL        : 91776\99490
// Kintana    : 389393\436953
// Data       : 29/07/2008 - 27/10/2008
// Responsável: Ricardo Cristiano
// Motivo     : Implementação de ajuste nas query´s para considerar apenas a provisão IOF, 
//               sem afetar o valor original do resgate.  
//******************************************************************************
// Rotina     : qryMapaInvFdoSintetico/qryMapaInvFdoAnalitico
// SOL        : 98279
// Kintana    : 428095
// Data       : 13/10/2008  
// Responsável: Ricardo Cristiano
// Descrição  : Implementação para trazer os registros apenas referentes a operação 
//               de transferências
//******************************************************************************
// Data      : 16/01/2008
// Código    : AL_48
// Pendencia : 26562
// SOL       : 70938
// Desc      : Implementação nas query´s qryMapaInvFdoSintetico, qryMapaInvFdoAnalitico,
//              qryMapaInvestFdoOutros e qryMapaInvestFdoOutrosAn para buscar a variação
//              referente a transferência entre plano por lote.
//******************************************************************************
// Data      : 14/01/2008
// Código    : AL_47
// Pendencia : 26562
// SOL       : 70938
// Desc      : Implementação nas query´s qryMapaInvFdoSintetico, qryMapaInvFdoAnalitico,
//              qryMapaInvestFdoOutros e qryMapaInvestFdoOutrosAn da distinção por
//              maior "id", da busca das operações TRP
//******************************************************************************
// Data      : 06/12/2007
// Código    : AL_46
// Pendencia :
// SOL       :
// Desc      : Implementação do "TRUNC" nas querys´s que fazem join com a tabela de
//             cadastro de fundo(HISTFUNDOINVEST). Essa inclusão trata a busca
//             independente da hora.
//******************************************************************************
// Data      : 17/09/2007
// Código    : AL_45
// Pendencia : 26366
// SOL       : 69287
// Desc      : Implementação de ajuste na consulta do fundo de Renda Fixa, apresentava
//             a informação duplicada, quando ocorria dois resgates distintos.
//******************************************************************************
// Data      : 09/08/2007
// Código    : AL_44
// Pendencia : 25761
// SOL       : 63520 / 63519
// Desc      : Retirado a implementação para buscar o IOF pago
//******************************************************************************
// Data      : 01/08/2007
// Código    : AL_43
// Pendencia : 25761
// SOL       : 63520 / 63519
// Desc      : Implementação para buscar o IOF pago
//******************************************************************************
// Data      : 16/07/2007
// Código    : AL_42
// Pendencia : 25594
// SOL       : 56257
// Motivo    : Implementação da taxa de despesa conforme especificação para as operações
//             de aplicação, resgate, amortização e integralização
//******************************************************************************
// Data      : 05/07/2007
// Código    : AL_41
// Pendencia : 25779
// SOL       : 63841
// Motivo    : Implementação de ajuste no Mapa de Movimentação de Fundos na busca
//             dos resgates para determinado período.
//******************************************************************************
// Data      : 13/06/2007
// Código    : AL_40
// Pendencia : 24600
// SOL       : 54576
// Motivo    : Implementação para trazer fundos que foram transferidos para outro
//             tipo de fundo
//******************************************************************************
// Data      : 11/06/2007
// Código    : AL_39
// Pendencia : 25594
// SOL       : 56257
// Motivo    : Implementação da taxa de despesa conforme especificação
//******************************************************************************
// Data      : 16/05/2007
// Código    : AL_38
// Pendencia : 25381
// SOL       : 60444
// Motivo    : Implementação para apurar a variação da operação de integralização
//             de cotas qryMapaInvestFdoOutros e qryMapaInvestFdoOutrosAn.
//******************************************************************************
// Data      : 23/03/2007
// Código    : AL_37
// Pendencia : 24839
// SOL       :
// Motivo    : Implementação da apuração de entrada e saída das transferências
//             (qryMapaInvFdoSintetico,qryMapaInvFdoAnalitico,
//              qryMapaInvestFdoOutros e qryMapaInvestFdoOutrosAn)
//******************************************************************************
// Data      : 15/03/2007
// Código    : AL_36
// Pendencia : 24008
// SOL       :
// Motivo    :Implementado o join do sub select do saldoatu do idtipofundoinvest
//            com o sub-select de historico do cadastro de Fundos,
//            devido a alteração do tipo de fundo do BRASIL PRIVATE.
//******************************************************************************
// Data      : 01/03/2007
// Código    : AL_35
// Pendencia : 24600
// SOL       :
// Motivo    :Retirado o join por tipo de fundo na query qryMapaInvestFdoOutros,
//            devido a alteração do tipo de fundo do BRASIL PRIVATE.
//******************************************************************************
// Data      : 10/01/2007
// Código    : AL_34
// Pendencia : 24173
// SOL       :
// Motivo    : Otimização das querys qryMapaInvFdoSintetico e qryMapaInvFdoAnalitico
//             atraves da implementação de join e between
//******************************************************************************
// Data      : 19/12/2006
// Código    : AL_33
//Pendencia  :
// SOL       :
// Motivo    : Implementações da alteração do grupo de IDTIPOFUNDOINVEST para DESCTIPOFUNDOINV
//******************************************************************************
// Data      : 18/12/2006
// Código    : AL_32
// Pendencia :
// SOL       :
// Motivo    : Otimização das querys qryMapaInvestFdoOutros e qryMapaInvestFdoOutrosAn
//             atraves da implementação de join e between
//******************************************************************************
// Data      : 15/12/2006
// Código    : AL_31
// Pendencia : 24008
// SOL       : 50435
// Motivo    : Alterado na query qryFundoInvestAcoes a HISTFUNDOINVEST para FUNDOINVEST,
//             devido estar duplicando fundos que mudaram de tipo de fundo
//******************************************************************************
// Data      : 13/12/2006
// Código    : AL_30
//Pendencia  : 23954
// SOL       :
// Motivo    : Implementações para o Fundo de Participações e
//             alterado o grupo de IDPLANPREVCTBPATR para PLANPRVCONTABPATRO
//******************************************************************************
// Data      : 23/11/2006
// Código    : AL_29
//Pendencia  : 23787
// SOL       :
// Motivo    : Ajuste na qryFundoInvestAcoes para busca qlq tipo de fundo, exclusivo FAC/FIF
//******************************************************************************
// Data      : 23/10/2006
// Código    : AL_28
// Pendencia : 22781
// SOL       :
// Motivo    : Ajuste da transferência entre planos por lote
//******************************************************************************
// Data      : 30/08/2006
// Código    : AL_27
// Pendencia : 22781
// SOL       :
// Motivo    : Implementação da transferência entre planos por lote
//******************************************************************************
// Data      : 28/08/2006
// Código    : AL_26
// Pendencia : 23122
// SOL       : 45112
// Motivo    : Implementação para utilização do Fundo de Inv. em Participação
//******************************************************************************
// Data      : 12/07/2006
// Código    : AL_25
// Pendencia :
// SOL       :
// Motivo    : Ajuste na busca dos registros de variação, para não buscar duplicidades
//******************************************************************************
// Data      : 11/07/2006
// Código    : AL_24
// Pendencia :
// SOL       :
// Motivo    : Ajuste na apuração do Saldo Anterior, esse não era encontrado qdo a
//             aplicação era totalmente resgatada no periodo.
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_23
// Pendencia : 22809
// SOL       :
// Motivo    : Ajuste na apuração do saldo líquido com a diminuição do iof e implementado o
//             iof negativo no relatório
//******************************************************************************
// Data      : 07/07/2006
// Código    : AL_22
// Pendencia :
// SOL       :
// Motivo    : Ajuste nas query's (qryMapaInvFdoSintetico e qryMapaInvFdoAnalitico),
//             foi retirado o grupor por natureza no busca pelas operações.
//******************************************************************************
// Data      : 28/06/2006
// Código    : AL_21
// Pendencia :
// SOL       :
// Motivo    : Ajuste no layout rptMapaInvestFdo retirada as colunas de transf. por plano
//             e introduzida apenas a coluna de Transferência.
//             E ajuste na qryMapaInvFdoSintetico e na qryMapaInvFdoAnalitico para
//             colocar a transf. em uma única coluna.
//******************************************************************************
// Data      : 12/06/2006
// Código    : AL_20
// Pendencia :
// SOL       :
// Motivo    : Ajuste no filtro das queries analíticas
//******************************************************************************
// Data      : 09/06/2006
// Código    : AL_19
// Pendencia : 22439
// SOL       : 43516
// Motivo    : Implementação da coluna de Transferëncia de Planos
//******************************************************************************
// Data      : 25/05/2006
// Código    : AL_18
// Pendencia :
// SOL       :
// Motivo    : Alterado o nome da query qryMapaInvestFdoOutrosAnal para
//             qryMapaInvestFdoOutrosAn
//******************************************************************************
// Data      : 06/05/2006
// Código    : AL_17
// Pendencia : 21579
// SOL       :
// Motivo    : Implementação da descrição do tipo de investimento no nome do relatório
//             de Fundos de Renda Fixa
//******************************************************************************
// Data      : 04/05/2006
// Código    : Al_16
// Pendencia :
// SOL       :
// Motivo    : Implementação do controle do totalizador de fundos para o mesmo
//             Plano
//******************************************************************************
// Data      : 26/04/2006
// Código    : Al_15
// Pendencia :
// SOL       :
// Motivo    : Melhora de performance das querys
//******************************************************************************
// Data      : 19/04/2006
// Código    : AL_14
// Pendencia :
// SOL       :
// Motivo    : Alterado a Query Sintética, Analítica e totais, buscando as operações
//            de ajuste.
//******************************************************************************
// Data      : 17/04/2006
// Código    : AL_13
// Pendencia : 21579
// SOL       : 38543
// Motivo    : Otimização das querys(qryMapaInvFdoSintetico,qryMapaInvFdoAnalitico,
//             qryMapaInvestFdoOutros e qryMapaInvestFdoOutrosAnal) para melhorar a
//             performance.
//******************************************************************************
// Data     : 14/02/2006
// Código   : AL_12
// Motivo   : Implementação do tipo de investimento no nome do relatório
//******************************************************************************
// Data     : 18/11/2005
// Código   : AL_12
// Motivo   : Retirada a critica de saldo de quantidade maior que zera, para mostrar a
//            movimentação no período, para os fundos que foram zerados no período.
//            (qryMapaInvFdoSintetico, qryMapaInvFdoAnalitico, qryMapaInvestFdoOutros,
//             qryMapaInvestFdoOutrosAnal)
//******************************************************************************
// Data     : 26/10/2005
// Código   : AL_11
// Motivo   : Implementação na busca da posição atual por data movimentada e maior id
//******************************************************************************
// Data     : 21/10/2005
// Código   : AL_10
// Motivo   : Implementação a coluna Amortização a Receber
//******************************************************************************
// Data     : 21/10/2005
// Código   : AL_9
// Motivo   : Implementação do tratamento para a operação -143(Amortização a Receber)
//******************************************************************************
// Data     : 08/09/2005
// Código   : AL_8
// Motivo   : Acerto na variação das query (qryMapaInvestFdoOutros e qryMapaInvestFdoOutrosAnal)
//******************************************************************************
// Data     : 06/09/2005
// Código   : AL_6
// Motivo   : Acerto no saldo anterior das query (qryMapaInvFdoSintetico,
//            qryMapaInvFdoAnalitico, qryMapaInvestFdoOutros e qryMapaInvestFdoOutrosAnal)
//******************************************************************************
// Data     : 02/09/2005
// Código   : AL_5
// Motivo   : Ajuste nas query e layout(qryMapaInvFdoSintetico,, qryMapaInvFdoAnalitico,
//            qryMapaInvestFdoOutros, qryMapaInvestFdoOutrosAnal, rptMapaInvestFdo e rptMapaInvestFdoOutros)
//******************************************************************************
// Data     : 11/07/2005
// Código   : AL_4
// Motivo   : Implementação de SaldoAtual liquido do IOF
//******************************************************************************
// Data     : 07/07/2005
// Código   : AL_3
// Motivo   : Acerto no qryMapaInvFdoAnalitico do campo ID que estava faltando o
//            IDPLANPREVCTBPATR
//******************************************************************************
// Data     : 30/06/2005
// Código   : AL_2
// Motivo   : Implementação de Somatório das Colunas
//******************************************************************************
// Data     : 15/05/2005
// Código   : AL_1
// Motivo   : Retirado a chamada indevida do frmParamMapaInvFdo
//******************************************************************************
// Data     : 26/05/2005
// Código   :
// Motivo   : Melhorias nas qryMapaInvFdoSintetico e qryMapaInvFdoAnalitico
//******************************************************************************
// Data     : 18/05/2005
// Código   :
// Motivo   : Acerto na qryMapaInvFdoSintetico que estava com o Group By errado.
//******************************************************************************
// Data     : 10/04/2005
// Código   :
// Motivo   : Implemetação da Consulta : Mapa de Investimentos em Fundos
//******************************************************************************

unit FDmRelMapaInvFdo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppDB, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl,
  ppCache, ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, ppModule, raCodMod,
  ppParameter;

type
  TDmRelMapaInvFdo = class(TDmRelatoriosInv)
    rptMapaInvestFdo: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppShape9: TppShape;
    pplblVariacao: TppLabel;
    pplblVlrAplicado: TppLabel;
    pplblIOF: TppLabel;
    pplblAplicacao: TppLabel;
    pplblResgates: TppLabel;
    pplblSldAnterior: TppLabel;
    ppLabel80: TppLabel;
    lblTitleFdoRF: TppLabel;
    ppLabel38: TppLabel;
    lblPeriodo: TppLabel;
    ppDBImage4: TppDBImage;
    ppDetailBand10: TppDetailBand;
    ppdbVlrVariacao: TppDBText;
    ppdbVlrAplicacao: TppDBText;
    ppdbSldAnterior: TppDBText;
    ppdbVlrIOF: TppDBText;
    ppdbVlrResgate: TppDBText;
    ppdbSldQuantidade: TppDBText;
    ppFooterBand9: TppFooterBand;
    ppSystemVariable17: TppSystemVariable;
    ppLabel82: TppLabel;
    ppLine28: TppLine;
    ppSystemVariable18: TppSystemVariable;
    BDEMapaInvestFdo: TppBDEPipeline;
    qryMapaInvFdoSintetico: TwwQuery;
    dsMapaInvFdoSintetico: TwwDataSource;
    qryFundoInvest: TwwQuery;
    qryCarteiraSPC: TwwQuery;
    qryCarteiraInvest: TwwQuery;
    qryPlanPrevCtbPatr: TwwQuery;
    qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField;
    qryPlanPrevCtbPatrIDPLANPREVCTBPATR: TFloatField;
    qryTipoInvest: TwwQuery;
    pplblDescFundo: TppLabel;
    ppdbDescFundo: TppDBText;
    pplblSaldo: TppLabel;
    ppdbSldFundo: TppDBText;
    ppdbVlrAplicado: TppDBText;
    qryMapaInvFdoSinteticoVLRAPLICADO: TFloatField;
    qryMapaInvFdoSinteticoSALDOANTERIOR: TFloatField;
    qryMapaInvFdoSinteticoVLRVARIACAO: TFloatField;
    qryMapaInvFdoSinteticoVLRAPLICACAO: TFloatField;
    qryMapaInvFdoSinteticoVLRRESGATE: TFloatField;
    qryMapaInvFdoSinteticoVLRIRPROV: TFloatField;
    qryMapaInvFdoSinteticoVLRIOFPROV: TFloatField;
    qryMapaInvFdoSinteticoSALDOVLRFUNDO: TFloatField;
    qryMapaInvFdoSinteticoSALDOQTDCOTAS: TFloatField;
    qryMapaInvFdoSinteticoIDFUNDOINVEST: TFloatField;
    qryMapaInvFdoSinteticoIDPLANPREVCTBPATR: TFloatField;
    qryMapaInvFdoSinteticoDESCFUNDOINVEST: TStringField;
    qryMapaInvFdoAnalitico: TwwQuery;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    qryMapaInvFdoSinteticoPLANPRVCONTABPATRO: TStringField;
    ppLine1: TppLine;
    ppLine2: TppLine;
    BDEMapaInvestFdoAn: TppBDEPipeline;
    dsMapaInvFdoAnalitico: TwwDataSource;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    shpDetalhe: TppShape;
    shpDetalheFilho: TppShape;
    ppdbSumSldAnterior: TppDBCalc;
    ppLabel10: TppLabel;
    ppdbSumVlrAplicado: TppDBCalc;
    ppdbSumVlrVariacao: TppDBCalc;
    ppdbSumVlrAplicacao: TppDBCalc;
    ppdbSumVlrIOF: TppDBCalc;
    ppdbSumVlrResgate: TppDBCalc;
    ppdbSumSldFundo: TppDBCalc;
    ppLine4: TppLine;
    qryMapaInvFdoAnaliticoID: TStringField;
    qryMapaInvFdoAnaliticoSALDOLIQUIDO: TFloatField;
    qryMapaInvFdoSinteticoID: TStringField;
    qryMapaInvFdoSinteticoSALDOLIQUIDO: TFloatField;
    qryMapaInvFdoSinteticoIDTIPOINVEST: TFloatField;
    qryMapaInvFdoSinteticoDIF: TFloatField;
    qryMapaInvFdoAnaliticoID1: TStringField;
    qryFundoInvestAcoes: TwwQuery;
    BDEMapaInvestFdoOutros: TppBDEPipeline;
    qryMapaInvestFdoOutros: TwwQuery;
    dsMapaInvestFdoOutros: TwwDataSource;
    qryMapaInvestFdoOutrosAn: TwwQuery;
    BDEMapaInvestFdoOutrosAn: TppBDEPipeline;
    dsMapaInvestFdoOutrosAn: TwwDataSource;
    qryMapaInvestFdoOutrosID: TStringField;
    qryMapaInvestFdoOutrosSALDOANTERIOR: TFloatField;
    qryMapaInvestFdoOutrosVLRAPLICADO: TFloatField;
    qryMapaInvestFdoOutrosVLRIRPROV: TFloatField;
    qryMapaInvestFdoOutrosVLRIOFPROV: TFloatField;
    qryMapaInvestFdoOutrosVLRRESGATE: TFloatField;
    qryMapaInvestFdoOutrosVLRAPLICACAO: TFloatField;
    qryMapaInvestFdoOutrosVLRINTEGRALIZ: TFloatField;
    qryMapaInvestFdoOutrosVLRVARIACAO: TFloatField;
    qryMapaInvestFdoOutrosVLRAMORTIZ: TFloatField;
    qryMapaInvestFdoOutrosVLRDIVIDENDO: TFloatField;
    qryMapaInvestFdoOutrosSALDOQTDCOTAS: TFloatField;
    qryMapaInvestFdoOutrosSALDOVLRFUNDO: TFloatField;
    qryMapaInvestFdoOutrosSALDOLIQUIDO: TFloatField;
    qryMapaInvestFdoOutrosIDTIPOINVEST: TFloatField;
    qryMapaInvestFdoOutrosIDFUNDOINVEST: TFloatField;
    qryMapaInvestFdoOutrosIDPLANPREVCTBPATR: TFloatField;
    qryMapaInvestFdoOutrosDESCFUNDOINVEST: TStringField;
    qryMapaInvestFdoOutrosPLANPRVCONTABPATRO: TStringField;
    qryMapaInvestFdoOutrosDIF: TFloatField;
    qryMapaInvestFdoOutrosAnID: TStringField;
    qryMapaInvestFdoOutrosAnID1: TStringField;
    qryMapaInvestFdoOutrosAnDATAAPLICACAO: TDateTimeField;
    qryMapaInvestFdoOutrosAnDATAMOVFUNDO: TDateTimeField;
    qryMapaInvestFdoOutrosAnSALDOANTERIOR: TFloatField;
    qryMapaInvestFdoOutrosAnVLRAPLICADO: TFloatField;
    qryMapaInvestFdoOutrosAnVLRIRPROV: TFloatField;
    qryMapaInvestFdoOutrosAnVLRIOFPROV: TFloatField;
    qryMapaInvestFdoOutrosAnVLRRESGATE: TFloatField;
    qryMapaInvestFdoOutrosAnVLRAPLICACAO: TFloatField;
    qryMapaInvestFdoOutrosAnVLRINTEGRALIZ: TFloatField;
    qryMapaInvestFdoOutrosAnVLRVARIACAO: TFloatField;
    qryMapaInvestFdoOutrosAnSALDOQTDCOTAS: TFloatField;
    qryMapaInvestFdoOutrosAnSALDOVLRFUNDO: TFloatField;
    qryMapaInvestFdoOutrosAnSALDOLIQUIDO: TFloatField;
    qryMapaInvestFdoOutrosAnIDTIPOINVEST: TFloatField;
    qryMapaInvestFdoOutrosAnIDFUNDOINVEST: TFloatField;
    qryMapaInvestFdoOutrosAnIDPLANPREVCTBPATR: TFloatField;
    qryFundoInvestAcoesIDFUNDOINVEST: TFloatField;
    qryFundoInvestAcoesDESCFUNDOINVEST: TStringField;
    //AL_40
    qryMapaInvestFdoOutrosAnVLRAMORTIZ: TFloatField;
    qryMapaInvestFdoOutrosAnVLRDIVIDENDO: TFloatField;
    qryMapaInvestFdoOutrosVLRAMORTIZREC: TFloatField;
    qryMapaInvestFdoOutrosAnVLRAMORTIZREC: TFloatField;
    qryTipoInvestIDTIPOINVEST: TFloatField;
    qryTipoInvestDESCTIPOINVEST: TStringField;
    ppSummaryBand1: TppSummaryBand;
    ppLine3: TppLine;
    ppLabel12: TppLabel;
    ppDBCalc13: TppDBCalc;
    ppLabel14: TppLabel;
    ppDBText26: TppDBText;
    ppDBText24: TppDBText;
    //AL_27
    qryMapaInvFdoSinteticoVLRTRANSF: TFloatField;
    qryMapaInvFdoAnaliticoVLRTRANSF: TFloatField;
    qryMapaInvestFdoOutrosVLRTRANSF: TFloatField;
    qryMapaInvestFdoOutrosAnVLRTRANSF: TFloatField;
    QryTipoCota: TwwQuery;
    QryTipoFundo: TwwQuery;
    qryMapaInvestFdoOutrosAnIDTIPOCOTA: TFloatField;
    qryMapaInvestFdoOutrosAnDESCTIPOCOTA: TStringField;
    ppDBCalc15: TppDBCalc;
    qryMapaInvestFdoOutrosIDTIPOFUNDOINVEST: TFloatField;
    qryMapaInvestFdoOutrosDESCTIPOFUNDOINV: TStringField;
    qryMapaInvestFdoOutrosVLRTAXAS: TFloatField;
    qryMapaInvestFdoOutrosAnVLRTAXAS: TFloatField;
    qryMapaInvestFdoOutrosAnIDTIPOFUNDOINVEST: TFloatField;
    qryMapaInvFdoSinteticoVLRIOF: TFloatField;
    qryMapaInvFdoAnaliticoVLRIOF: TFloatField;
    qryMapaInvestFdoOutrosIDSEGMENTACAO: TFloatField;
    qryMapaInvestFdoOutrosDESCSEGMENTACAO: TStringField;
    qrySegmentacao: TwwQuery;
    qrySegmentacaoIDSEGMENTACAO: TFloatField;
    qrySegmentacaoDESCSEGMENTACAO: TStringField;
    rptMapaInvestFdoOutros: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppShape4: TppShape;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    lblPeriodoFdoAcoes: TppLabel;
    ppDBImage2: TppDBImage;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel33: TppLabel;
    ppLabel37: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppDBText29: TppDBText;
    ppLabel44: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppShape5: TppShape;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppShape6: TppShape;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
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
    ppDetailBand5: TppDetailBand;
    ppShape7: TppShape;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppTipoCota: TppDBText;
    ppDBText58: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppLine5: TppLine;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable3: TppSystemVariable;
    ppLabel60: TppLabel;
    ppLine7: TppLine;
    ppSystemVariable4: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText65: TppDBText;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppLabel61: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppLine10: TppLine;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppLine11: TppLine;
    ppDBCalc12: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppParameterList2: TppParameterList;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppDBText66: TppDBText;
    ppLine12: TppLine;
    ppLine13: TppLine;
    qryMapaInvFdoSinteticoDESCSEGMENTACAO: TStringField;
    qryMapaInvFdoSinteticoIDSEGMENTACAO: TFloatField;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBText11: TppDBText;
    ppLine6: TppLine;
    ppLine14: TppLine;
    procedure rptMapaInvestFdoStartPage(Sender: TObject);
    procedure shpDetalhePrint(Sender: TObject);
    procedure qryMapaInvFdoSinteticoAfterScroll(DataSet: TDataSet);
    procedure shpDetalheFilhoPrint(Sender: TObject);
    procedure qryMapaInvestFdoOutrosAfterScroll(DataSet: TDataSet);
    procedure ppGroupFooterBand1AfterGenerate(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure ppDetailBand10BeforePrint(Sender: TObject);
    //AL_26
    procedure ppGroupFooterBand2AfterGenerate(Sender: TObject);
    procedure ppGroupFooterBand2BeforePrint(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
  private
    { Private declarations }
    //Al_16
    wCount    : Integer;    
    cCorZebra : TColor;
  public
    { Public declarations }
    function MostraParam(Form: String): boolean; OverRide;
  end;

var
  DmRelMapaInvFdo: TDmRelMapaInvFdo;

implementation

uses FParamMapaInvFdo, FTelaAut;

{$R *.DFM}

function TDmRelMapaInvFdo.MostraParam(Form: String): boolean;
begin
   try
      AbrirForm(frmParamMapaInvFdo,TfrmParamMapaInvFdo, false);
      frmParamMapaInvFdo.fModal := True;
      frmParamMapaInvFdo.WindowState := wsNormal;
      Result := True
   except
      Result := False;
   end;
end;

procedure TDmRelMapaInvFdo.rptMapaInvestFdoStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   shpDetalhe.Brush.Color := clWhite;
   shpDetalheFilho.Brush.Color := clWhite;
end;

procedure TDmRelMapaInvFdo.shpDetalhePrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelMapaInvFdo.qryMapaInvFdoSinteticoAfterScroll(DataSet: TDataSet);
begin
   inherited;
   //AL_20
   if not qryMapaInvFdoAnalitico.IsEmpty then
   begin
       qryMapaInvFdoAnalitico.DisableControls;
      if not qryMapaInvFdoSinteticoID.IsNull then
         qryMapaInvFdoAnalitico.Filter   := 'ID1 = ' + qryMapaInvFdoSinteticoID.AsString
      else
         qryMapaInvFdoAnalitico.Filter   := 'ID1 = ' + QuotedStr('0');
      qryMapaInvFdoAnalitico.Filtered := True;
      qryMapaInvFdoAnalitico.EnableControls;
   end;
end;

procedure TDmRelMapaInvFdo.shpDetalheFilhoPrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelMapaInvFdo.qryMapaInvestFdoOutrosAfterScroll(DataSet: TDataSet);
begin
   inherited;
   //AL_20
   if not qryMapaInvestFdoOutrosAn.IsEmpty then
   begin
      qryMapaInvestFdoOutrosAn.DisableControls;
      if not qryMapaInvestFdoOutrosID.IsNull then
         qryMapaInvestFdoOutrosAn.Filter   := 'ID1 = ' + qryMapaInvestFdoOutrosID.AsString
      else
         qryMapaInvestFdoOutrosAn.Filter   := 'ID1 = ' + QuotedStr('0');
      qryMapaInvestFdoOutrosAn.Filtered    := True;
      qryMapaInvestFdoOutrosAn.EnableControls;
   end;
end;

//Al_16
procedure TDmRelMapaInvFdo.ppGroupFooterBand1AfterGenerate(
  Sender: TObject);
begin
  inherited;
   wCount    := 0;
end;

//Al_16
procedure TDmRelMapaInvFdo.ppGroupFooterBand1BeforePrint(Sender: TObject);
begin
  inherited;
   ppGroupFooterBand1.Visible := (wCount > 1);
   wCount   := 0;
end; 

//Al_16 
procedure TDmRelMapaInvFdo.ppDetailBand10BeforePrint(Sender: TObject);
begin                                                                         
  inherited;
   wCount   := wCount + 1;
end;

//AL_26
procedure TDmRelMapaInvFdo.ppGroupFooterBand2AfterGenerate(
  Sender: TObject);
begin
  inherited;
   wCount    := 0;
end;

//AL_26
procedure TDmRelMapaInvFdo.ppGroupFooterBand2BeforePrint(Sender: TObject);
begin
  inherited;
   ppGroupFooterBand2.Visible := (wCount > 1);
   wCount   := 0;
end;

//AL_26
procedure TDmRelMapaInvFdo.ppDetailBand2BeforePrint(Sender: TObject);
begin
  inherited;
   wCount   := wCount + 1;
end;

end.
