{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Rotina...........: (dfm) qryPatrimonioSegSintetico
Nº SIG...........: 126818
Data da Alteração: 29/07/2022
Responsável......: Luis Ferrari
Descrição........: Criado nova para atender nova query relatorio Sintetico
--------------------------------------------------------------------------------
Rotina...........: (dfm) qryPatrimonioSeg
Nº SIG...........: 122680
Data da Alteração: 01/04/2022
Responsável......: Luis Ferrari
Descrição........: Segregação por plano ajustado para trazer todos imoveis
--------------------------------------------------------------------------------
Rotina...........: (dfm) qryPatrimonioSeg
Nº SIG...........: 122680
Data da Alteração: 08/02/2022
Responsável......: Edilaine
Descrição........: Segregação por plano trata apenas um dos imóveis
--------------------------------------------------------------------------------
Nº SOL......: 212226
Nº KINTANA..: 2037651
Data........: 23/04/2014
Responsável.: Helio Lima Custódio
Descrição...: Ocultar taxa de depreciação ao ano dos relatórios
              'Relatório Patrimonial de Imóveis - Analítico' e
              'Relatório Patrimonial de Imóveis - Sintético'.
--------------------------------------------------------------------------------
Rotina...........: *.dfm
Nº SOL...........: 154328-5901
Nº KINTANA.......: 1373449
Data da Alteração: 04/12/2013
Responsável......: Vando Souza Amancio
Descrição........: Segregação por plano previdenciário de todas as movimentações
                   que são contabilizadas.
--------------------------------------------------------------------------------
N. Sol..........: 153958
N. Kintana......: 1167601
Data............: 20/06/2011
Responsável.....: Helen V. Bianchi
Descrição.......: qrySldCtbImoMestre    - Add (99)
                  qrySldCtbMestrePPatro - Add (99)
                  qrySldCtbImoveis      - Add (99)
--------------------------------------------------------------------------------
N. Sol..........: 129277
N. Kintana......: 709344
Data............: 17/05/2010
Responsável.....: Felipe de Oliveira
Descrição.......: Correção no relatório Patrimonial de Imóveis - Sintético
                  para imprimir corretamente o valor da depreciação mensal
                  alterando a query qrySldCtbImoMestre
--------------------------------------------------------------------------------
N. Sol..........: 135923
N. Kintana......: 810025
Data............: 14/05/2010
Responsável.....: Cássio Camargo
Descrição.......: Correção no relatório Patrimonial de Imóveis - Sintético, para
                  trazer corretamente o percenutal de segregação dos planos
                  previdenciários dos imóveis pertencentes a determinados imóveis
                  mestre.
--------------------------------------------------------------------------------
N. Sol..........: 135765
N. Kintana......: 808154
Data............: 12/05/2010
Responsável.....: Cássio Camargo
Descrição.......: Correção da query de Segregação para o relatório Patrimonial
                  de Imóveis - Sintético, e correção na exibição de segmento no
                  Resumo Geral
--------------------------------------------------------------------------------
Sol:131663
Ktn:753769
Responsável: Felipe de Oliveira
Data: 13/04/2010
Descrição: Modificada a query qryImoMestreSegregacao,qryTotGeral,qryTotalGeral,qrySegregacao
 acrescentando o filtro por data de vigência
-------------------------------------------------------------------------------------------------


N. Sol..........: 131484
N. Kintana......: 749048
Data............: 25/02/2010
Responsável.....: Cássio Camargo
Descrição.......: Correção da query de Segregação para o relatório Patrimonial
                  de Imóveis - Sintético, que não estava trazendo bens para o
                  segmento CONST
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.16 / 5.10.17 / 5.10.18
Pendência    : 27213
Responsável  : Daniel Simões
Data         : 28/02/2008
Descrição    : Ajuste na query 'qrySldCtbImoMestre' referente a pendência 27316.
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.16 / 5.10.17 / 5.10.18
Pendência    : 27496
Responsável  : Daniel Simões
Data         : 28/02/2008
Descrição    : Alteração do número de casas decimais do campo 'FATOR' na query
               'qrySldCtbMestrePPatro' de 4 casas decimais para 10 casas...
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.16 / 5.10.17 / 5.10.18
Pendência    : 27187
Responsável  : Daniel Simões
Data         : 10/01/2008
Descrição    : Parâmetro ':FLGOPERACAO' nas querys 'qrySldCtbImoveis' e
               'qrySldCtbImoMestre' passa a chamar "G" e "X" ...
--------------------------------------------------------------------------------
Pendência   : 26711
Responsável : Daniel Simões
Data        : 26/10/2007
Descrição   : Implementação de Opção de Ordenação por Nome do Imóvel ou Código
              do Imóvel para visualização dos dados no relatório...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------
}

unit dRelBalCaf;  

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppPrnabl, ppClass, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, ppStrtch,
  ppMemo, ExtCtrls, TeeProcs, TeEngine, Chart, ppChrt, ppModule,
  daDataModule, ppVar, ppRelatv, ppDBPipe, raCodMod, uCmSqlParams,
  DBClient, uCMClientDataSet, ppSubRpt, ppParameter, QExport3, QExport3XLS,
  StdCtrls;

type
  TdtmRelBalCaf = class(TdtmReports)
    qryBalPatBem: TwwQuery;
    dsBalPatBem: TwwDataSource;
    ppBalPatBem: TppBDEPipeline;
    rpBalPatBem: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLabel60: TppLabel;
    ppLine13: TppLine;
    ppLabel61: TppLabel;
    ppDetailBand7: TppDetailBand;
    ppFooterBand7: TppFooterBand;
    ppLine14: TppLine;
    ppLabel62: TppLabel;
    rpBemResumLabel2: TppLabel;
    rpBemResumLabel3: TppLabel;
    rpBemResumLabel4: TppLabel;
    rpBemResumLabel5: TppLabel;
    rpBemResumLabel6: TppLabel;
    rpBemResumLabel7: TppLabel;
    rpBemResumLabel8: TppLabel;
    rpBemResumLabel9: TppLabel;
    rpBemResumLabel10: TppLabel;
    rpBemResumLabel11: TppLabel;
    rpBemResumLabel12: TppLabel;
    rpBemResumDBText2: TppDBText;
    rpBemResumDBText3: TppDBText;
    rpBemResumDBText4: TppDBText;
    rpBemResumDBText5: TppDBText;
    rpBemResumDBText6: TppDBText;
    rpBemResumDBText7: TppDBText;
    rpBemResumDBText8: TppDBText;
    rpBemResumDBText9: TppDBText;
    rpBemResumDBText10: TppDBText;
    rpBemResumDBText11: TppDBText;
    rpBemResumDBText12: TppDBText;
    rpBemResumLine1: TppLine;
    rpBemResumLabel13: TppLabel;
    rpBemResumDBText13: TppDBText;
    rpBemResumLabel1: TppLabel;
    rpBemResumDBText1: TppDBText;
    rpBemResumLine2: TppLine;
    rpBemResumDBCalc1: TppDBCalc;
    rpBemResumDBCalc2: TppDBCalc;
    rpBemResumDBCalc3: TppDBCalc;
    rpBemResumDBCalc4: TppDBCalc;
    rpBemResumDBCalc5: TppDBCalc;
    rpBemResumDBCalc6: TppDBCalc;
    rpBemResumLabel14: TppLabel;
    rpBemResumLabel15: TppLabel;
    rpBemResumLabel16: TppLabel;
    rpBemResumLabel17: TppLabel;
    rpBemResumLabel18: TppLabel;
    rpBemResumLabel19: TppLabel;
    rpBemResumLine3: TppLine;
    rpBemResumSummaryBand1: TppSummaryBand;
    rpBemResumLabel20: TppLabel;
    rpBemResumLabel21: TppLabel;
    rpBemResumLabel22: TppLabel;
    rpBemResumLabel23: TppLabel;
    rpBemResumDBCalc7: TppDBCalc;
    rpBemResumDBCalc8: TppDBCalc;
    rpBemResumDBCalc9: TppDBCalc;
    rpBemResumLabel24: TppLabel;
    rpBemResumLabel25: TppLabel;
    rpBemResumLabel26: TppLabel;
    rpBemResumDBCalc10: TppDBCalc;
    rpBemResumDBCalc11: TppDBCalc;
    rpBemResumDBCalc12: TppDBCalc;
    rpBemResumLine4: TppLine;
    rpBemResumLabel27: TppLabel;
    rpBemResumDBText14: TppDBText;
    rpBemResumLabel28: TppLabel;
    qryBalPatGrp: TwwQuery;
    dsBalPatGrp: TwwDataSource;
    ppBalPatGrp: TppBDEPipeline;
    rpBalPatGrp: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLabel66: TppLabel;
    ppLine17: TppLine;
    ppLabel67: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppFooterBand9: TppFooterBand;
    ppLine18: TppLine;
    ppLabel68: TppLabel;
    updBalPatGrp: TUpdateSQL;
    rpBalPatGrpLabel1: TppLabel;
    rpBalPatGrpLabel2: TppLabel;
    rpBalPatGrpLabel3: TppLabel;
    rpBalPatGrpLabel4: TppLabel;
    rpBalPatGrpLabel5: TppLabel;
    rpBalPatGrpLabel6: TppLabel;
    rpBalPatGrpLabel7: TppLabel;
    rpBalPatGrpLabel8: TppLabel;
    rpBalPatGrpDBText1: TppDBText;
    rpBalPatGrpDBText2: TppDBText;
    rpBalPatGrpDBText3: TppDBText;
    rpBalPatGrpDBText4: TppDBText;
    rpBalPatGrpDBText5: TppDBText;
    rpBalPatGrpDBText6: TppDBText;
    rpBalPatGrpDBText7: TppDBText;
    rpBalPatGrpDBText8: TppDBText;
    rpBalPatGrpLabel9: TppLabel;
    rpBalPatGrpLabel10: TppLabel;
    updBalPatClas: TUpdateSQL;
    qryBalPatClas: TwwQuery;
    dsBalPatClas: TwwDataSource;
    ppBalPatClas: TppBDEPipeline;
    rpBalPatClas: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    ppLabel5: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel19: TppLabel;
    ppLabel78: TppLabel;
    ppLabel80: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    rpBalPatClasLabelData: TppLabel;
    ppDetailBand2: TppDetailBand;
    rpBalPatClasDBText1: TppDBText;
    rpBalPatClasDBText2: TppDBText;
    rpBalPatClasDBText6: TppDBText;
    rpBalPatClasDBText7: TppDBText;
    rpBalPatClasDBText8: TppDBText;
    rpBalPatClasDBText9: TppDBText;
    rpBalPatClasDBText3: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine4: TppLine;
    ppLabel86: TppLabel;
    rpBalPatClasLabel1: TppLabel;
    rpBalPatClasDBText4: TppDBText;
    qryBalPatGrpIDGRUPO: TFloatField;
    qryBalPatGrpCLASSE: TStringField;
    qryBalPatGrpDESCGRUPO: TStringField;
    qryBalPatGrpS_A: TStringField;
    qryBalPatGrpVALORG: TFloatField;
    qryBalPatGrpCMBEM: TFloatField;
    qryBalPatGrpDEPLANC: TFloatField;
    qryBalPatGrpCMDEP: TFloatField;
    qryBalPatGrpVALCTB: TFloatField;
    qryBalPatClasCODHIERARQ: TStringField;
    qryBalPatClasDESCRICAO: TStringField;
    qryBalPatClasS_A: TStringField;
    qryBalPatClasQUANT: TFloatField;
    qryBalPatClasVALORG: TFloatField;
    qryBalPatClasCMBEM: TFloatField;
    qryBalPatClasDEPLANC: TFloatField;
    qryBalPatClasCMDEP: TFloatField;
    qryBalPatClasVALCTB: TFloatField;
    rpBalPatBemLabel1: TppLabel;
    rpBalPatBemDBText1: TppDBText;
    rpBalPatBemLabel2: TppLabel;
    rpBalPatBemLabel3: TppLabel;
    rpBalPatBemLabel4: TppLabel;
    rpBalPatBemDBText2: TppDBText;
    rpBalPatBemLabel5: TppLabel;
    rpBalPatBemDBText3: TppDBText;
    rpBalPatBemDBText4: TppDBText;
    updBalPatCC: TUpdateSQL;
    qryBalPatCC: TwwQuery;
    dsBalPatCC: TwwDataSource;
    ppBalPatCC: TppBDEPipeline;
    rpBalPatCC: TppReport;
    ppHeaderBand12: TppHeaderBand;
    ppLabel17: TppLabel;
    ppLine9: TppLine;
    ppLabel18: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppDetailBand12: TppDetailBand;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppLine10: TppLine;
    ppLabel31: TppLabel;
    qryBalPatCCCODCENTROCUSTO: TStringField;
    qryBalPatCCDESCCCUSTO: TStringField;
    qryBalPatCCS_A: TStringField;
    qryBalPatCCVALORG: TFloatField;
    qryBalPatCCCMBEM: TFloatField;
    qryBalPatCCDEPLANC: TFloatField;
    qryBalPatCCCMDEP: TFloatField;
    qryBalPatCCVALCTB: TFloatField;
    rpBemImovel2: TppReport;
    ppHeaderBand13: TppHeaderBand;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppDetailBand13: TppDetailBand;
    ppLabel47: TppLabel;
    ppDBText1: TppDBText;
    ppDBText8: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppLabel48: TppLabel;
    ppLine24: TppLine;
    ppDBMemo1: TppDBMemo;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppFooterBand13: TppFooterBand;
    ppLine25: TppLine;
    ppLabel49: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLine26: TppLine;
    ppLabel50: TppLabel;
    ppDBText32: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine27: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLabel51: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLine28: TppLine;
    ppDBText33: TppDBText;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel85: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLine29: TppLine;
    ppLabel93: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine30: TppLine;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppLabel94: TppLabel;
    ppBemImovel2: TppBDEPipeline;
    dsBemImovel2: TwwDataSource;
    qryBemImovel2: TwwQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    StringField1: TStringField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    qryBemImovel2IDOPCIONAL: TStringField;
    rpBemImovel2Label1: TppLabel;
    rpBemImovel2DBText1: TppDBText;
    rpBemImovel2Line1: TppLine;
    rpBemImovel2Label2: TppLabel;
    rpBemImovel2DBCalc1: TppDBCalc;
    rpBemImovel2DBCalc2: TppDBCalc;
    rpBemImovel2DBCalc3: TppDBCalc;
    rpBemImovel2DBCalc4: TppDBCalc;
    rpBemImovel2DBCalc5: TppDBCalc;
    rpBemImovel2DBCalc6: TppDBCalc;
    rpBemImovel2DBCalc7: TppDBCalc;
    rpBemImovel2DBCalc8: TppDBCalc;
    rpBemImovel2Line2: TppLine;
    qryBalPatGrpDEPMES: TFloatField;
    rpBalPatGrpDBText9: TppDBText;
    rpBalPatGrpLabel11: TppLabel;
    qryBalPatCCDEPMES: TFloatField;
    ppDBText13: TppDBText;
    rpBalPatCCDBText1: TppDBText;
    rpBalPatCCLabel1: TppLabel;
    qrySldCtbImoveis: TwwQuery;
    dsSldCtbImoveis: TwwDataSource;
    ppSldCtbImoveis: TppBDEPipeline;
    rpSldCtbImoveis: TppReport;
    ppHeaderBand15: TppHeaderBand;
    ppLabel98: TppLabel;
    ppLine37: TppLine;
    ppLabel99: TppLabel;
    ppDetailBand15: TppDetailBand;
    ppFooterBand15: TppFooterBand;
    ppLine38: TppLine;
    ppLabel100: TppLabel;
    rpSldCtbImoveisLabel1: TppLabel;
    rpSldCtbImoveisLabel2: TppLabel;
    rpSldCtbImoveisLabel3: TppLabel;
    rpSldCtbImoveisLabel5: TppLabel;
    rpSldCtbImoveisLabel6: TppLabel;
    rpSldCtbImoveisLabel8: TppLabel;
    rpSldCtbImoveisLabel9: TppLabel;
    rpSldCtbImoveisLabel10: TppLabel;
    rpSldCtbImoveisLine1: TppLine;
    rpSldCtbImoveisDBText1: TppDBText;
    rpSldCtbImoveisDBText2: TppDBText;
    rpSldCtbImoveisLine3: TppLine;
    rpSldCtbImoveisDBText3: TppDBText;
    rpSldCtbImoveisDBText4: TppDBText;
    rpSldCtbImoveisDBText5: TppDBText;
    rpSldCtbImoveisDBText7: TppDBText;
    rpSldCtbImoveisDBText8: TppDBText;
    rpSldCtbImoveisDBText9: TppDBText;
    rpSldCtbImoveisDBCalc1: TppDBCalc;
    rpSldCtbImoveisDBCalc2: TppDBCalc;
    rpSldCtbImoveisDBCalc3: TppDBCalc;
    rpSldCtbImoveisDBCalc4: TppDBCalc;
    rpSldCtbImoveisDBCalc5: TppDBCalc;
    rpSldCtbImoveisDBCalc6: TppDBCalc;
    rpSldCtbImoveisDBCalc7: TppDBCalc;
    rpSldCtbImoveisDBCalc8: TppDBCalc;
    rpSldCtbImoveisDBCalc9: TppDBCalc;
    rpSldCtbImoveisDBCalc10: TppDBCalc;
    rpSldCtbImoveisLine4: TppLine;
    rpSldCtbImoveisLine5: TppLine;
    rpSldCtbImoveisLine6: TppLine;
    rpSldCtbImoveisLabel7: TppLabel;
    rpSldCtbImoveisLabel11: TppLabel;
    rpBalPatGrpLabel12: TppLabel;
    rpSldCtbImoveisLabel12: TppLabel;
    rpSldCtbImoveisDBText6: TppDBText;
    rpSldCtbImoveisDBCalc11: TppDBCalc;
    rpSldCtbImoveisDBCalc12: TppDBCalc;
    rpSldCtbImoveisLabel13: TppLabel;
    rpSldCtbImoveisDBText10: TppDBText;
    rpSldCtbImoveisDBCalc13: TppDBCalc;
    rpSldCtbImoveisDBCalc14: TppDBCalc;
    rpSldCtbImoveisLabel14: TppLabel;
    rpSldCtbImoveisLabel15: TppLabel;
    rpSldCtbImoveisLabel16: TppLabel;
    ppCalc29: TppSystemVariable;
    ppCalc30: TppSystemVariable;
    ppCalc25: TppSystemVariable;
    ppCalc26: TppSystemVariable;
    ppCalc7: TppSystemVariable;
    ppCalc24: TppSystemVariable;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    ppCalc17: TppSystemVariable;
    ppCalc18: TppSystemVariable;
    ppCalc13: TppSystemVariable;
    ppCalc14: TppSystemVariable;
    rpSldCtbImoMestre: TppReport;
    ppSldCtbImoMestre: TppBDEPipeline;
    dsSldCtbImoMestre: TwwDataSource;
    qrySldCtbImoMestre: TwwQuery;
    rpBemImovel: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    rptCustoContabilLabel2: TppLabel;
    lblDataMov: TppLabel;
    ppDetailBand8: TppDetailBand;
    rptCustoContabilLabel34: TppLabel;
    rptCustoContabilDBText4: TppDBText;
    rptCustoContabilDBText5: TppDBText;
    rptCustoContabilDBText8: TppDBText;
    rptCustoContabilDBText10: TppDBText;
    rptCustoContabilDBText12: TppDBText;
    rptCustoContabilDBText13: TppDBText;
    rptCustoContabilDBText14: TppDBText;
    rptCustoContabilDBText16: TppDBText;
    rptCustoContabilDBText17: TppDBText;
    rptCustoContabilDBText18: TppDBText;
    rptCustoContabilDBText19: TppDBText;
    rptCustoContabilLabel6: TppLabel;
    ppLine15: TppLine;
    rptCustoContabilDBMemo1: TppDBMemo;
    rptCustoContabilDBText7: TppDBText;
    rptCustoContabilDBText9: TppDBText;
    rptCustoContabilDBText11: TppDBText;
    rptCustoContabilDBText3: TppDBText;
    rpBemImovelDBText1: TppDBText;
    ppFooterBand8: TppFooterBand;
    ppLine16: TppLine;
    ppLabel65: TppLabel;
    ppCalc15: TppSystemVariable;
    ppCalc16: TppSystemVariable;
    rptCustoContabilGroup2: TppGroup;
    rptCustoContabilGroupHeaderBand2: TppGroupHeaderBand;
    rptCustoContabilLine2: TppLine;
    rptCustoContabilLabel7: TppLabel;
    rptCustoContabilDBText1: TppDBText;
    rptCustoContabilGroupFooterBand2: TppGroupFooterBand;
    rptCustoContabilLine4: TppLine;
    rptCustoContabilDBCalc2: TppDBCalc;
    rptCustoContabilDBCalc3: TppDBCalc;
    rptCustoContabilDBCalc5: TppDBCalc;
    rptCustoContabilDBCalc6: TppDBCalc;
    rptCustoContabilDBCalc12: TppDBCalc;
    rptCustoContabilDBCalc13: TppDBCalc;
    rptCustoContabilDBCalc14: TppDBCalc;
    rptCustoContabilDBCalc16: TppDBCalc;
    rpBemImovelLabel3: TppLabel;
    rptCustoContabilGroup3: TppGroup;
    rptCustoContabilGroupHeaderBand3: TppGroupHeaderBand;
    rptCustoContabilLine3: TppLine;
    rptCustoContabilDBText2: TppDBText;
    rptCustoContabilLabel1: TppLabel;
    rptCustoContabilLabel3: TppLabel;
    rptCustoContabilLabel4: TppLabel;
    rptCustoContabilLabel5: TppLabel;
    rptCustoContabilLabel9: TppLabel;
    rptCustoContabilLabel10: TppLabel;
    rptCustoContabilLabel11: TppLabel;
    rptCustoContabilLabel12: TppLabel;
    rptCustoContabilLabel21: TppLabel;
    rptCustoContabilLabel22: TppLabel;
    rptCustoContabilLabel23: TppLabel;
    rptCustoContabilLabel24: TppLabel;
    rptCustoContabilLabel25: TppLabel;
    rptCustoContabilLabel26: TppLabel;
    rptCustoContabilLabel27: TppLabel;
    rptCustoContabilLine1: TppLine;
    rpBemImovelLabel1: TppLabel;
    rptCustoContabilGroupFooterBand3: TppGroupFooterBand;
    rptCustoContabilLine5: TppLine;
    rptCustoContabilDBCalc1: TppDBCalc;
    rptCustoContabilDBCalc4: TppDBCalc;
    rptCustoContabilDBCalc7: TppDBCalc;
    rptCustoContabilDBCalc8: TppDBCalc;
    rptCustoContabilDBCalc9: TppDBCalc;
    rptCustoContabilDBCalc10: TppDBCalc;
    rptCustoContabilDBCalc11: TppDBCalc;
    rptCustoContabilDBCalc15: TppDBCalc;
    rpBemImovelLabel2: TppLabel;
    ppBemImovel: TppBDEPipeline;
    dsBemImovel: TwwDataSource;
    qryBemImovel: TwwQuery;
    qryBalPatBemIDBEM: TFloatField;
    qryBalPatBemPLACA: TFloatField;
    qryBalPatBemNOME: TStringField;
    qryBalPatBemDESBEM: TStringField;
    qryBalPatBemDTAINCLUSAO: TDateTimeField;
    qryBalPatBemTAXADEP: TFloatField;
    qryBalPatBemDATAULTDEP: TDateTimeField;
    qryBalPatBemVALHISTORICO: TFloatField;
    qryBalPatBemFLGDEPREC: TFloatField;
    qryBalPatBemDESCCONJUNTO: TStringField;
    qryBalPatBemIDNOTA: TStringField;
    qryBalPatBemCOMPLNOTA: TStringField;
    qryBalPatBemNOMEFORN: TStringField;
    qryBalPatBemCODGRUPO: TStringField;
    qryBalPatBemIDGRUPO: TFloatField;
    qryBalPatBemVALORG0: TFloatField;
    qryBalPatBemCMBEM0: TFloatField;
    qryBalPatBemDEPLANCATU0: TFloatField;
    qryBalPatBemDEPLANC0: TFloatField;
    qryBalPatBemCMDEP0: TFloatField;
    qryBalPatBemVALCTB0: TFloatField;
    qryBemImovelIDBEM: TFloatField;
    qryBemImovelTAXADEP: TFloatField;
    qryBemImovelDATAULTDEP: TDateTimeField;
    qryBemImovelPLACA: TFloatField;
    qryBemImovelVALORG0: TFloatField;
    qryBemImovelVALREAVACUM0: TFloatField;
    qryBemImovelCMBEMATU0: TFloatField;
    qryBemImovelCMBEMACUM0: TFloatField;
    qryBemImovelDEPLANCATU0: TFloatField;
    qryBemImovelDEPLANCACUM0: TFloatField;
    qryBemImovelCMDEPLANCACUM0: TFloatField;
    qryBemImovelVALCTB0: TFloatField;
    qryBemImovelVALULTREAVACUM1: TFloatField;
    qryBemImovelVALULTCMREAVATU: TFloatField;
    qryBemImovelVALULTCMREAVACUM1: TFloatField;
    qryBemImovelVALULTDEPREAVATU: TFloatField;
    qryBemImovelVALULTDEPREAVACUM1: TFloatField;
    qryBemImovelVALULTCMDEPREAVACUM1: TFloatField;
    qryBemImovelVALCTB1: TFloatField;
    qryBemImovelSUMPARCREAV: TFloatField;
    qryBemImovelSUMCMBEMATU: TFloatField;
    qryBemImovelSUMCMBEMACUM: TFloatField;
    qryBemImovelSUMDEPATU: TFloatField;
    qryBemImovelSUMDEPACUM: TFloatField;
    qryBemImovelSUMCMDEPACUM: TFloatField;
    qryBemImovelSUMVALCTB: TFloatField;
    qryBemImovelDESBEM: TStringField;
    qryBemImovelDESCCONJUNTO: TStringField;
    qryBemImovelDESCGRUPO: TStringField;
    qryBemImovelIDGRUPO: TFloatField;
    qryBemImovelIDCONJUNTO: TFloatField;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText46: TppDBText;
    qrySldCtbImoMestreNOME: TStringField;
    qrySldCtbImoMestreDESCGRUPO: TStringField;
    qrySldCtbImoMestreCUSTOCORR0: TFloatField;
    qrySldCtbImoMestreDEPBEMACUM0: TFloatField;
    qrySldCtbImoMestreDEPBEMATU0: TFloatField;
    qrySldCtbImoMestreTAXADEP: TFloatField;
    qrySldCtbImoMestreCUSTOREAV0: TFloatField;
    qrySldCtbImoMestreDEPREAVACUM0: TFloatField;
    qrySldCtbImoMestreDEPREAVATU0: TFloatField;
    qrySldCtbImoMestreTAXADEPREAV: TFloatField;
    qrySldCtbImoMestreVALCTB0: TFloatField;
    updBalPatGrpbx: TUpdateSQL;
    qryBalPatGrpBx: TwwQuery;
    FloatField29: TFloatField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField30: TFloatField;
    FloatField31: TFloatField;
    FloatField32: TFloatField;
    FloatField33: TFloatField;
    FloatField34: TFloatField;
    dsBalPatGrpBx: TwwDataSource;
    ppBalPatGrpBx: TppBDEPipeline;
    rpBalPatGrpBx: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel37: TppLabel;
    ppLine6: TppLine;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel77: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText45: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine7: TppLine;
    ppLabel79: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLine8: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppSoma1: TppVariable;
    ppLabel75: TppLabel;
    ppLine19: TppLine;
    ppSoma2: TppVariable;
    ppSoma3: TppVariable;
    ppSoma4: TppVariable;
    ppSoma5: TppVariable;
    ppSoma6: TppVariable;
    rpBalPatClasDBText5: TppDBText;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLabel76: TppLabel;
    ppDBText3: TppDBText;
    ppLabel81: TppLabel;
    dsGrpBem: TwwDataSource;
    ppGrpBem: TppBDEPipeline;
    qrySldCtbImoMestreIDGRUPO: TFloatField;
    cdsGrpBem: TCMClientDataSet;
    spGrpBem: TCMSqlParams;
    cdsGrpBemDSC_GRUPO: TStringField;
    cdsGrpBemIDGRUPO: TFloatField;
    cdsGrpBemVLR_CUSTO: TFloatField;
    cdsGrpBemVLR_CUSTOACU: TFloatField;
    cdsGrpBemVLR_CUSTOMES: TFloatField;
    cdsGrpBemVLR_REAV: TFloatField;
    cdsGrpBemVLR_REAVACU: TFloatField;
    cdsGrpBemVLR_REAVMES: TFloatField;
    cdsGrpBemVLR_SLDCTB: TFloatField;
    ppShape4: TppShape;
    ppLine40: TppLine;
    qrySldCtbMestrePPatro: TwwQuery;
    dsSldCtbMestrePPatro: TwwDataSource;
    ppSldCtbMestrePPatro: TppBDEPipeline;
    rpSldCtbMestrePPatro: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLabel108: TppLabel;
    ppLabel111: TppLabel;
    ppLine43: TppLine;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppLine44: TppLine;
    ppLabel122: TppLabel;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppShape5: TppShape;
    ppLine45: TppLine;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLine46: TppLine;
    ppLabel126: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppSummaryBand4: TppSummaryBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLabel127: TppLabel;
    ppLabel128: TppLabel;
    ppLine47: TppLine;
    ppLine48: TppLine;
    ppLine49: TppLine;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    ppLabel131: TppLabel;
    ppLabel132: TppLabel;
    ppLabel133: TppLabel;
    ppLabel134: TppLabel;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppLabel137: TppLabel;
    ppLine50: TppLine;
    ppDetailBand6: TppDetailBand;
    ppShape6: TppShape;
    ppLine51: TppLine;
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppDBText71: TppDBText;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppSummaryBand5: TppSummaryBand;
    ppLine52: TppLine;
    ppDBCalc31: TppDBCalc;
    ppDBCalc32: TppDBCalc;
    ppDBCalc33: TppDBCalc;
    ppDBCalc34: TppDBCalc;
    ppDBCalc35: TppDBCalc;
    ppDBCalc36: TppDBCalc;
    ppDBCalc37: TppDBCalc;
    ppLine53: TppLine;
    ppLabel138: TppLabel;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBText77: TppDBText;
    ppLine54: TppLine;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBCalc38: TppDBCalc;
    ppDBCalc39: TppDBCalc;
    ppDBCalc40: TppDBCalc;
    ppDBCalc41: TppDBCalc;
    ppDBCalc42: TppDBCalc;
    ppLabel139: TppLabel;
    ppDBCalc43: TppDBCalc;
    ppDBCalc44: TppDBCalc;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppDBText78: TppDBText;
    qrySldCtbMestrePPatroNOME: TStringField;
    qrySldCtbMestrePPatroIDGRUPO: TFloatField;
    qrySldCtbMestrePPatroDESCGRUPO: TStringField;
    qrySldCtbMestrePPatroCUSTOCORR0: TFloatField;
    qrySldCtbMestrePPatroDEPBEMACUM0: TFloatField;
    qrySldCtbMestrePPatroDEPBEMATU0: TFloatField;
    qrySldCtbMestrePPatroTAXADEP: TFloatField;
    qrySldCtbMestrePPatroCUSTOREAV0: TFloatField;
    qrySldCtbMestrePPatroDEPREAVACUM0: TFloatField;
    qrySldCtbMestrePPatroDEPREAVATU0: TFloatField;
    qrySldCtbMestrePPatroTAXADEPREAV: TFloatField;
    qrySldCtbMestrePPatroVALCTB0: TFloatField;
    qrySldCtbMestrePPatroNOME_PLANO: TStringField;
    qrySldCtbMestrePPatroNOME_PATRO: TStringField;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppDBText79: TppDBText;
    ppLabel140: TppLabel;
    ppDBCalc45: TppDBCalc;
    ppDBCalc46: TppDBCalc;
    ppDBCalc47: TppDBCalc;
    ppDBCalc48: TppDBCalc;
    ppDBCalc49: TppDBCalc;
    ppDBCalc50: TppDBCalc;
    ppDBCalc51: TppDBCalc;
    ppLabel141: TppLabel;
    ppDBCalc52: TppDBCalc;
    ppDBCalc53: TppDBCalc;
    ppDBCalc54: TppDBCalc;
    ppDBCalc55: TppDBCalc;
    ppDBCalc56: TppDBCalc;
    ppDBCalc57: TppDBCalc;
    ppDBCalc58: TppDBCalc;
    ppLine55: TppLine;
    ppLine56: TppLine;
    ppShape7: TppShape;
    ppLine57: TppLine;
    ppLabel142: TppLabel;
    ppLabel143: TppLabel;
    qryParamCAFxContab: TwwQuery;
    qryParamCAFxContabIDGRUPO: TFloatField;
    qryParamCAFxContabDESCGRUPO: TStringField;
    qryParamCAFxContabCLASSE: TStringField;
    qryParamCAFxContabIDTIPOMOVIMENTACAO: TFloatField;
    qryParamCAFxContabDESCTIPOMOVIMENTACAO: TStringField;
    qryParamCAFxContabPLANO: TFloatField;
    qryParamCAFxContabPLACONTA: TStringField;
    qryParamCAFxContabPLANOME: TStringField;
    qryParamCAFxContabDEBCRED: TStringField;
    qryParamCAFxContabCODCENTROCUSTO: TStringField;
    qryParamCAFxContabNOMECCUSTO: TStringField;
    dsParamCAFxContab: TwwDataSource;
    ppParamCAFxContab: TppBDEPipeline;
    rpParamCAFxContab: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel144: TppLabel;
    ppLabel145: TppLabel;
    rpCtaMovGrpPlanoConta: TppLabel;
    ppDetailBand10: TppDetailBand;
    rpCtaMovGrpDBText4: TppDBText;
    rpCtaMovGrpDBText5: TppDBText;
    rpCtaMovGrpDBText6: TppDBText;
    rpCtaMovGrpDBText7: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppLine58: TppLine;
    ppLabel146: TppLabel;
    ppCalc23: TppSystemVariable;
    ppSystemVariable7: TppSystemVariable;
    rpCtaMovGrpGroup2: TppGroup;
    rpCtaMovGrpGroupHeaderBand2: TppGroupHeaderBand;
    rpCtaMovGrpLabel1: TppLabel;
    rpCtaMovGrpDBText2: TppDBText;
    rpCtaMovGrpDBText1: TppDBText;
    rpCtaMovGrpLine2: TppLine;
    rpCtaMovGrpLine1: TppLine;
    rpCtaMovGrpGroupFooterBand2: TppGroupFooterBand;
    rpCtaMovGrpGroup1: TppGroup;
    rpCtaMovGrpGroupHeaderBand1: TppGroupHeaderBand;
    rpCtaMovGrpLabel2: TppLabel;
    rpCtaMovGrpDBText3: TppDBText;
    rpCtaMovGrpLabel3: TppLabel;
    rpCtaMovGrpLabel5: TppLabel;
    rpCtaMovGrpLabel4: TppLabel;
    ppLabel147: TppLabel;
    rpCtaMovGrpGroupFooterBand1: TppGroupFooterBand;
    ppLogoParam: TppImage;
    ppLogoBalAnalitico: TppImage;
    ppImgLogotipo: TppImage;
    qryParamCAFxContabNOME_GRUPO: TStringField;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppDBText80: TppDBText;
    ppLine59: TppLine;
    qrySldCtbImoveis2Camadas: TwwQuery;
    FloatField35: TFloatField;
    FloatField36: TFloatField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    FloatField37: TFloatField;
    FloatField38: TFloatField;
    FloatField39: TFloatField;
    FloatField40: TFloatField;
    FloatField41: TFloatField;
    FloatField42: TFloatField;
    FloatField43: TFloatField;
    FloatField44: TFloatField;
    FloatField45: TFloatField;
    StringField10: TStringField;
    DateTimeField2: TDateTimeField;
    qrySldCtbImoMestre2: TwwQuery;
    rpSldCtbImoveisLblSegmento: TppLabel;
    qrySldCtbImoveisIDIMOVELMESTRE: TFloatField;
    qrySldCtbImoveisIDGRUPO: TFloatField;
    qrySldCtbImoveisDESCGRUPO: TStringField;
    qrySldCtbImoveisNOME: TStringField;
    qrySldCtbImoveisIMONOME: TStringField;
    qrySldCtbImoveisIMOCODIGO: TStringField;
    qrySldCtbImoveisIMODATACOMPRA: TDateTimeField;
    qrySldCtbImoveisCUSTOCORR0: TFloatField;
    qrySldCtbImoveisCMBEM0: TFloatField;
    qrySldCtbImoveisDEPBEMACUM0: TFloatField;
    qrySldCtbImoveisDEPBEMATU0: TFloatField;
    qrySldCtbImoveisTAXADEP: TFloatField;
    qrySldCtbImoveisCUSTOREAV0: TFloatField;
    qrySldCtbImoveisDEPREAVACUM0: TFloatField;
    qrySldCtbImoveisDEPREAVATU0: TFloatField;
    qrySldCtbImoveisTAXADEPREAV: TFloatField;
    qrySldCtbImoveisVALCTB0: TFloatField;
    ppLabel149: TppLabel;
    ppDBText4: TppDBText;
    ppLine60: TppLine;
    ppLabel150: TppLabel;
    ppDBCalc59: TppDBCalc;
    ppDBCalc60: TppDBCalc;
    qrySldCtbImoMestreCMBEM0: TFloatField;
    cdsGrpBemVLR_CM: TFloatField;
    ppSummaryBand6: TppSummaryBand;
    ppLabel101: TppLabel;
    ppDBCalc63: TppDBCalc;
    ppDBCalc64: TppDBCalc;
    ppDBCalc65: TppDBCalc;
    ppDBCalc66: TppDBCalc;
    ppDBCalc67: TppDBCalc;
    ppDBCalc68: TppDBCalc;
    ppDBCalc69: TppDBCalc;
    ppDBCalc70: TppDBCalc;
    ppLine63: TppLine;
    ppLine64: TppLine;
    dsGrpSegregacao: TwwDataSource;
    ppGrpSegregacao: TppBDEPipeline;
    qrySegregacao: TwwQuery;
    dsTotalGeral: TwwDataSource;
    ppTotalGeral: TppBDEPipeline;
    qryTotalGeral: TwwQuery;
    ppImoMestreSegregacao: TppBDEPipeline;
    dsImoMestreSegregacao: TwwDataSource;
    qryImoMestreSegregacao: TwwQuery;
    ppSubReport5: TppSubReport;
    ppChildReport5: TppChildReport;
    ppTitleBand5: TppTitleBand;
    ppDetailBand16: TppDetailBand;
    ppSummaryBand9: TppSummaryBand;
    ppLabel169: TppLabel;
    ppDBText96: TppDBText;
    ppLabel170: TppLabel;
    ppLabel171: TppLabel;
    ppLabel172: TppLabel;
    ppLabel173: TppLabel;
    ppLabel183: TppLabel;
    ppLabel184: TppLabel;
    ppLabel185: TppLabel;
    ppLabel186: TppLabel;
    ppLabel187: TppLabel;
    ppLabel188: TppLabel;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppDBText108: TppDBText;
    ppDBText109: TppDBText;
    ppDBText110: TppDBText;
    ppDBText111: TppDBText;
    ppDBText112: TppDBText;
    ppDBText113: TppDBText;
    ppDBText114: TppDBText;
    ppGroup9: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppGroupFooterBand9: TppGroupFooterBand;
    dsTotGeral: TwwDataSource;
    ppTotGeral: TppBDEPipeline;
    qryTotGeral: TwwQuery;
    ppSubReport6: TppSubReport;
    ppChildReport6: TppChildReport;
    ppTitleBand6: TppTitleBand;
    ppDetailBand17: TppDetailBand;
    ppSummaryBand10: TppSummaryBand;
    ppLabel189: TppLabel;
    ppLabel190: TppLabel;
    ppLabel191: TppLabel;
    ppLabel192: TppLabel;
    ppLabel193: TppLabel;
    ppLabel194: TppLabel;
    ppLabel195: TppLabel;
    ppLabel196: TppLabel;
    ppLabel197: TppLabel;
    ppLabel198: TppLabel;
    ppLabel199: TppLabel;
    ppDBText115: TppDBText;
    ppDBText116: TppDBText;
    ppDBText117: TppDBText;
    ppDBText118: TppDBText;
    ppDBText119: TppDBText;
    ppDBText120: TppDBText;
    ppDBText121: TppDBText;
    ppDBText122: TppDBText;
    ppDBText123: TppDBText;
    ppDBText124: TppDBText;
    ppLabel200: TppLabel;
    ppLabel201: TppLabel;
    cdsImoMestreSegregacao: TCMClientDataSet;
    cdsTotGeral: TCMClientDataSet;
    spPatrimonialAnal: TCMSqlParams;
    cdsTotGeralPLANOPREV: TStringField;
    cdsTotGeralPATRO: TStringField;
    cdsTotGeralPERCENTRATEIO: TFloatField;
    cdsTotGeralCUSTOCORR0: TFloatField;
    cdsTotGeralDEPBEMACUM0: TFloatField;
    cdsTotGeralDEPBEMATU0: TFloatField;
    cdsTotGeralCUSTOREAV0: TFloatField;
    cdsTotGeralDEPREAVACUM0: TFloatField;
    cdsTotGeralDEPREAVATU0: TFloatField;
    cdsTotGeralVALCTB0: TFloatField;
    spPatrimonialCons: TCMSqlParams;
    cdsSegregacao: TCMClientDataSet;
    cdsTotalGeral: TCMClientDataSet;
    cdsTotalGeralPLANOPREV: TStringField;
    cdsTotalGeralPATRO: TStringField;
    cdsTotalGeralPERCENTRATEIO: TFloatField;
    cdsTotalGeralCUSTOCORR0: TFloatField;
    cdsTotalGeralDEPBEMACUM0: TFloatField;
    cdsTotalGeralDEPBEMATU0: TFloatField;
    cdsTotalGeralCUSTOREAV0: TFloatField;
    cdsTotalGeralDEPREAVACUM0: TFloatField;
    cdsTotalGeralDEPREAVATU0: TFloatField;
    cdsTotalGeralVALCTB0: TFloatField;
    cdsImoMestreSegregacaoIDIMOVELMESTRE: TFloatField;
    cdsImoMestreSegregacaoIDIMOVEL: TFloatField;
    cdsImoMestreSegregacaoNOME: TStringField;
    cdsImoMestreSegregacaoPLANOPREV: TStringField;
    cdsImoMestreSegregacaoPATRO: TStringField;
    cdsImoMestreSegregacaoPERCENTRATEIO: TFloatField;
    cdsImoMestreSegregacaoCUSTOCORR0: TFloatField;
    cdsImoMestreSegregacaoDEPBEMACUM0: TFloatField;
    cdsImoMestreSegregacaoDEPBEMATU0: TFloatField;
    cdsImoMestreSegregacaoCUSTOREAV0: TFloatField;
    cdsImoMestreSegregacaoDEPREAVACUM0: TFloatField;
    cdsImoMestreSegregacaoDEPREAVATU0: TFloatField;
    cdsImoMestreSegregacaoVALCTB0: TFloatField;
    qrySldCtbImoMestreCODTIPIMOVEL: TStringField;
    qrySldCtbImoveisIDIMOVEL: TFloatField;
    cdsSegregacaoPLANOPREV: TStringField;
    cdsSegregacaoPATRO: TStringField;
    cdsSegregacaoPERCENTRATEIO: TFloatField;
    cdsSegregacaoCUSTOCORR0: TFloatField;
    cdsSegregacaoDEPBEMACUM0: TFloatField;
    cdsSegregacaoDEPBEMATU0: TFloatField;
    cdsSegregacaoCUSTOREAV0: TFloatField;
    cdsSegregacaoDEPREAVACUM0: TFloatField;
    cdsSegregacaoDEPREAVATU0: TFloatField;
    cdsSegregacaoVALCTB0: TFloatField;
    cdsSegregacaoDESCGRUPO: TStringField;
    qrySldCtbImoMestre2NOME: TStringField;
    qrySldCtbImoMestre2IDGRUPO: TFloatField;
    qrySldCtbImoMestre2DESCGRUPO: TStringField;
    qrySldCtbImoMestre2CUSTOCORR0: TFloatField;
    qrySldCtbImoMestre2CMBEM0: TFloatField;
    qrySldCtbImoMestre2DEPBEMACUM0: TFloatField;
    qrySldCtbImoMestre2DEPBEMATU0: TFloatField;
    qrySldCtbImoMestre2TAXADEP: TFloatField;
    qrySldCtbImoMestre2CUSTOREAV0: TFloatField;
    qrySldCtbImoMestre2DEPREAVACUM0: TFloatField;
    qrySldCtbImoMestre2DEPREAVATU0: TFloatField;
    qrySldCtbImoMestre2TAXADEPREAV: TFloatField;
    qrySldCtbImoMestre2VALCTB0: TFloatField;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppLine21: TppLine;
    ppLine20: TppLine;
    ppLabel34: TppLabel;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLine2: TppLine;
    ppLabel24: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel35: TppLabel;
    ppLogoBalSintetico: TppImage;
    ppLabel148: TppLabel;
    ppLabel151: TppLabel;
    ppLine61: TppLine;
    ppLabel152: TppLabel;
    lblPlanoContabil: TppLabel;
    lblPatro: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppsCor: TppShape;
    pplnSeparador: TppLine;
    ppDBText2: TppDBText;
    ppDBText9: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText44: TppDBText;
    ppDBText81: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine5: TppLine;
    ppLabel36: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLine62: TppLine;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLabel97: TppLabel;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppLine36: TppLine;
    ppLabel153: TppLabel;
    ppLabel154: TppLabel;
    ppLabel155: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppShape3: TppShape;
    ppLine39: TppLine;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText47: TppDBText;
    ppDBText53: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText82: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppLine34: TppLine;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    ppDBCalc23: TppDBCalc;
    ppLine35: TppLine;
    ppLabel107: TppLabel;
    ppDBCalc62: TppDBCalc;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppLabel156: TppLabel;
    ppDetailBand11: TppDetailBand;
    ppDBText84: TppDBText;
    ppDBText85: TppDBText;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppDBText91: TppDBText;
    ppDBText92: TppDBText;
    ppDBText93: TppDBText;
    ppSummaryBand7: TppSummaryBand;
    ppSubReport4: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppLabel174: TppLabel;
    ppLabel175: TppLabel;
    ppLabel176: TppLabel;
    ppLabel177: TppLabel;
    ppLabel178: TppLabel;
    ppLabel179: TppLabel;
    ppLabel180: TppLabel;
    ppLabel181: TppLabel;
    ppLabel182: TppLabel;
    ppLabel167: TppLabel;
    ppLabel168: TppLabel;
    ppDetailBand14: TppDetailBand;
    ppDBText100: TppDBText;
    ppDBText101: TppDBText;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppDBText104: TppDBText;
    ppDBText105: TppDBText;
    ppDBText106: TppDBText;
    ppDBText107: TppDBText;
    ppDBText94: TppDBText;
    ppDBText95: TppDBText;
    ppSummaryBand8: TppSummaryBand;
    raCodeModule1: TraCodeModule;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppDBText83: TppDBText;
    ppLabel157: TppLabel;
    ppLabel158: TppLabel;
    ppLabel159: TppLabel;
    ppLabel160: TppLabel;
    ppLabel161: TppLabel;
    ppLabel162: TppLabel;
    ppLabel164: TppLabel;
    ppLabel165: TppLabel;
    ppLabel163: TppLabel;
    ppLabel166: TppLabel;
    ppGroupFooterBand8: TppGroupFooterBand;
    raCodeModule2: TraCodeModule;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppShape2: TppShape;
    ppDBText41: TppDBText;
    ppLine11: TppLine;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppShape1: TppShape;
    ppDBCalc24: TppDBCalc;
    ppDBCalc25: TppDBCalc;
    ppDBCalc26: TppDBCalc;
    ppDBCalc27: TppDBCalc;
    ppDBCalc28: TppDBCalc;
    ppLine12: TppLine;
    ppLabel38: TppLabel;
    ppDBCalc29: TppDBCalc;
    ppDBCalc30: TppDBCalc;
    ppDBCalc61: TppDBCalc;
    ppLabel202: TppLabel;
    qryTotGeraNova: TwwQuery;
    FloatField46: TFloatField;
    FloatField47: TFloatField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    DateTimeField3: TDateTimeField;
    FloatField48: TFloatField;
    FloatField49: TFloatField;
    FloatField50: TFloatField;
    FloatField51: TFloatField;
    FloatField52: TFloatField;
    FloatField53: TFloatField;
    FloatField54: TFloatField;
    FloatField55: TFloatField;
    FloatField56: TFloatField;
    FloatField57: TFloatField;
    FloatField58: TFloatField;
    qrySegregacaoNova: TwwQuery;
    StringField15: TStringField;
    StringField16: TStringField;
    FloatField59: TFloatField;
    FloatField60: TFloatField;
    FloatField61: TFloatField;
    FloatField62: TFloatField;
    FloatField63: TFloatField;
    FloatField64: TFloatField;
    FloatField65: TFloatField;
    FloatField66: TFloatField;
    FloatField67: TFloatField;
    FloatField68: TFloatField;
    FloatField69: TFloatField;
    StringField17: TStringField;
    qryTotalGeralNova: TwwQuery;
    queryData: TwwQuery;
    qrySldCtbImoveisNova: TwwQuery;
    FloatField70: TFloatField;
    FloatField71: TFloatField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    DateTimeField4: TDateTimeField;
    FloatField72: TFloatField;
    FloatField73: TFloatField;
    FloatField74: TFloatField;
    FloatField75: TFloatField;
    FloatField76: TFloatField;
    FloatField77: TFloatField;
    FloatField78: TFloatField;
    FloatField79: TFloatField;
    FloatField80: TFloatField;
    FloatField81: TFloatField;
    FloatField82: TFloatField;
    qrySldCtbImoveisNovaIDPLANOPREV: TCurrencyField;
    qrySldCtbImoMestreSegregado: TwwQuery;
    qrySldCtbImoMestreSegregadoNOME: TStringField;
    qrySldCtbImoMestreSegregadoDESCGRUPO: TStringField;
    qrySldCtbImoMestreSegregadoCUSTOCORR0: TFloatField;
    qrySldCtbImoMestreSegregadoDEPBEMACUM0: TFloatField;
    qrySldCtbImoMestreSegregadoDEPBEMATU0: TFloatField;
    qrySldCtbImoMestreSegregadoTAXADEP: TFloatField;
    qrySldCtbImoMestreSegregadoCUSTOREAV0: TFloatField;
    qrySldCtbImoMestreSegregadoDEPREAVACUM0: TFloatField;
    qrySldCtbImoMestreSegregadoDEPREAVATU0: TFloatField;
    qrySldCtbImoMestreSegregadoTAXADEPREAV: TFloatField;
    qrySldCtbImoMestreSegregadoVALCTB0: TFloatField;
    qrySldCtbImoMestreSegregadoIDGRUPO: TFloatField;
    qrySldCtbImoMestreSegregadoCMBEM0: TFloatField;
    qrySldCtbImoMestreSegregadoCODTIPIMOVEL: TStringField;
    sqlPatrimonioSeg: TCMSqlParams;
    cdsPatrimonioSeg: TCMClientDataSet;
    qrySldCtbImoveisCODTIPIMOVEL: TStringField;
    qryPatrimonioSeg: TwwQuery;
    qryPatrimonioSegSintetico: TwwQuery;
    procedure lblDataMovPrint(Sender: TObject);
    procedure LblSistemaPrint(Sender: TObject);
    procedure rpBalPatGrpDBText1Print(Sender: TObject);
    procedure ppDBText10Print(Sender: TObject);
    procedure rpBalPatClasBeforePrint(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure pplnSeparadorPrint(Sender: TObject);
    procedure ppsCorPrint (Sender: TObject);
    procedure ppDBText118GetText(Sender: TObject; var Text: String);
    procedure ppDBText118Print(Sender: TObject);
  private
    { Private declarations }
    procedure LblEmpresaPrint(Sender: TObject);
  public
    { Public declarations }
    bSeparador, bCorLinha : boolean;
    CorLinha, CorAtual    : TColor;

    function MostraParam(Form: string): boolean; Override;
    function strmasktofloat(sNum : String) : Extended;
  end;

var
  dtmRelBalCaf: TdtmRelBalCaf;

implementation

{$R *.DFM}

uses uMensErro, dBaseDados,  uSistema, uAtivoFixo, fParamCtaMovGrp,
     fParamSldCtbImovel,fParamSldCtbImoMestre,fParamSldCtbMestrePPatro;

function TdtmRelBalCaf.MostraParam(Form: string) : boolean;
var
   frm       : TForm;
   bTemParam : Boolean;

begin
   bTemParam := True;

   if (UPPERCASE(Form) = 'FRMPARAMSLDCTBIMOVEL') then
      frm := TfrmParamSldCtbImovel.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMSLDCTBIMOMESTRE') then
      frm := TfrmParamSldCtbImoMestre.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMSLDCTBMESTREPPATRO') then
      frm := TfrmParamSldCtbMestrePPatro.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMCTAMOVGRP') then
      frm := TfrmParamCtaMovGrp.Create(Application)
   else
      frm := nil;
   //-------------------------------------------------------------------------------------
   if frm = nil then
   begin
      Result := not bTemParam;
      Exit;
   end;
   //-------------------------------------------------------------------------------------
   with frm do
   begin
      Result := (ShowModal = mrOk);
      free;
   end;
end;

procedure TdtmRelBalCaf.LblSistemaPrint(Sender: TObject);
begin
  //Impressão do Nome do Módulo + Versão no Rodapé do Relatório
 (Sender as TppLabel).Caption := Sistema.NomeModulo + ' - ' + Sistema.Versao;
end;

procedure TdtmRelBalCaf.LblEmpresaPrint(Sender: TObject);
begin
  inherited;
  //Impressão do Nome da Empresa No Cabeçalho do Relatório
 (Sender as TppLabel).Caption := Sistema.NomeEmpresa;
end;

procedure TdtmRelBalCaf.lblDataMovPrint(Sender: TObject);
begin
   inherited;
   lblDataMov.Text := datetostr(qryBemImovel.ParamByName('PDATASLD').AsDateTime);
end;

procedure TdtmRelBalCaf.rpBalPatGrpDBText1Print(Sender: TObject);
begin
   inherited;
   if qryBalPatGrpS_A.AsString = 'S' then
   begin
      rpBalPatGrpDBText1.Font.Style := [fsBold];
      rpBalPatGrpDBText2.Font.Style := [fsBold];
      rpBalPatGrpDBText3.Font.Style := [fsBold];
      rpBalPatGrpDBText4.Font.Style := [fsBold];
      rpBalPatGrpDBText5.Font.Style := [fsBold];
      rpBalPatGrpDBText6.Font.Style := [fsBold];
      rpBalPatGrpDBText7.Font.Style := [fsBold];
      rpBalPatGrpDBText8.Font.Style := [fsBold];
   end else
   begin
      rpBalPatGrpDBText1.Font.Style := [];
      rpBalPatGrpDBText2.Font.Style := [];
      rpBalPatGrpDBText3.Font.Style := [];
      rpBalPatGrpDBText4.Font.Style := [];
      rpBalPatGrpDBText5.Font.Style := [];
      rpBalPatGrpDBText6.Font.Style := [];
      rpBalPatGrpDBText7.Font.Style := [];
      rpBalPatGrpDBText8.Font.Style := [];
   end;
end;
//========================================================================================
procedure TdtmRelBalCaf.ppDBText10Print(Sender: TObject);
begin
   inherited;
   if (qryBalPatCCS_A.AsString = 'S') then
   begin
      ppDBText10.Font.Style := [fsBold];
      ppDBText11.Font.Style := [fsBold];
      ppDBText12.Font.Style := [fsBold];
      ppDBText13.Font.Style := [fsBold];
      ppDBText14.Font.Style := [fsBold];
      ppDBText15.Font.Style := [fsBold];
      ppDBText16.Font.Style := [fsBold];
      ppDBText17.Font.Style := [fsBold];
   end else
   begin
      ppDBText10.Font.Style := [];
      ppDBText11.Font.Style := [];
      ppDBText12.Font.Style := [];
      ppDBText13.Font.Style := [];
      ppDBText14.Font.Style := [];
      ppDBText15.Font.Style := [];
      ppDBText16.Font.Style := [];
      ppDBText17.Font.Style := [];
   end;
end;

function TdtmRelBalCaf.StrMaskToFloat(sNum : String) : Extended;
var
   iPos    : Integer;
   sAux, sResult : String;
begin
   sAux := sNum;
   if sAux = '' then sAux := '0';
   //-------------------------------------------------------------------------------------
   try
      sResult := '';
      iPos := 1;
      while iPos <= length(sAux) do
      begin
         if (sAux[iPos] = '0') or (sAux[iPos] = '1') or (sAux[iPos] = '2') or
            (sAux[iPos] = '3') or (sAux[iPos] = '4') or (sAux[iPos] = '5') or
            (sAux[iPos] = '6') or (sAux[iPos] = '7') or (sAux[iPos] = '8') or
            (sAux[iPos] = '9') or (sAux[iPos] = ',') then
            sResult := sResult + sAux[iPos];
         iPos := iPos + 1;
      end;
      result := strtofloat(sResult);
   except
      showmessage(sNum + ',' + sAux + ',' + sResult);
      result := 0.00;
   end;
end;

procedure TdtmRelBalCaf.rpBalPatClasBeforePrint(Sender: TObject);
begin
   inherited;
   ppSoma1.Value := 0;
   ppSoma2.Value := 0;
   ppSoma3.Value := 0;
   ppSoma4.Value := 0;
   ppSoma5.Value := 0;
   ppSoma6.Value := 0;
end;

procedure TdtmRelBalCaf.ppDetailBand2BeforePrint(Sender: TObject);
begin
   inherited;
   if qryBalPatClas.FieldByName('S_A').AsString = 'S' then
   begin
      rpBalPatClasDBText1.Font.Style := [fsBold];
      rpBalPatClasDBText2.Font.Style := [fsBold];
      rpBalPatClasDBText3.Font.Style := [fsBold];
      rpBalPatClasDBText4.Font.Style := [fsBold];
      rpBalPatClasDBText5.Font.Style := [fsBold];
      rpBalPatClasDBText6.Font.Style := [fsBold];
      rpBalPatClasDBText7.Font.Style := [fsBold];
      rpBalPatClasDBText8.Font.Style := [fsBold];
      rpBalPatClasDBText9.Font.Style := [fsBold];
   end else
   begin
      rpBalPatClasDBText1.Font.Style := [];
      rpBalPatClasDBText2.Font.Style := [];
      rpBalPatClasDBText3.Font.Style := [];
      rpBalPatClasDBText4.Font.Style := [];
      rpBalPatClasDBText5.Font.Style := [];
      rpBalPatClasDBText6.Font.Style := [];
      rpBalPatClasDBText7.Font.Style := [];
      rpBalPatClasDBText8.Font.Style := [];
      rpBalPatClasDBText9.Font.Style := [];
   end;
end;


procedure TdtmRelBalCaf.pplnSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

procedure TdtmRelBalCaf.ppsCorPrint(Sender: TObject);
begin
   inherited;
   if bCorLinha then begin
      if CorAtual = clWhite then begin
         CorAtual := CorLinha;
      end else begin
         CorAtual := clWhite;
      end;
   end else begin
      CorAtual := clWhite;
   end;
   (Sender as TppShape).Brush.Color := CorAtual;
end;

procedure TdtmRelBalCaf.ppDBText118GetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  Application.ProcessMessages;
end;

procedure TdtmRelBalCaf.ppDBText118Print(Sender: TObject);
begin
  inherited;
  Application.ProcessMessages;
end;

end.
