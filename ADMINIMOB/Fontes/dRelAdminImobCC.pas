{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina      : qryCCMestreCalcFields 
Pendências  : SIG101433
Responsável : Edilaine
Data        : 23/10/2020
Descrição   : coluna nao aparece na exportação de dados da conta corrente
-------------------------------------------------------------------------------
Pendências  : SOL 264999.17959 PPM 1181696
Responsável : Michelle Suellyn Mota
Data        : 27/11/2015
Descrição   : Inclusão da coluna DATAPROGRAMADA no relatório de
              Folha de Alguel por Contrato.
-------------------------------------------------------------------------------
Rotina.............:
N. Sol.............: 147289
N. Kintana.........: 1017104
Data...............: 14/04/2011
Responsável........: Felipe de Oliveira
Descrição..........: Quando relatórios de inadimplencia não possuirem
                     inadinplencia, imprimir mensagem no relatório
--------------------------------------------------------------------------------
Rotina.............: MontaQuerySegregacaoFolhaAluguel
N. Sol.............: 131924
N. Kintana.........: 762445
Data...............: 12/05/2010
Responsável........: Felipe de Oliveira
Descrição..........: Alterado Relatório  de Folha de Alugueis por Contrato para
                     contemplar o período de vigência
--------------------------------------------------------------------------------
Rotina.............: MontaQuerySegregacaoPorImovel
N. Sol.............: 131922
N. Kintana.........: 756226
Data...............: 19/04/2010
Responsável........: Felipe de Oliveira
Descrição..........: Alterado Relatório  de Conta Corrente por Imóvel
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Rotina.............: ppSubReport7Print, ppSubReport6Print, MontaQuerySegregacao
N. Sol.............: 131919
N. Kintana.........: 760816
Data...............: 10/05/2010
Responsável........: Cássio Camargo
Descrição..........: Alterado relatório de Inadimplência por Imóvel, para
                     contemplar a vigência de segregação.
--------------------------------------------------------------------------------
Rotina.............: MontaQuerySegregacao
N. Sol.............: 131923
N. Kintana.........: 758691
Data...............: 27/04/2010
Responsável........: Felipe de Oliveira
Descrição..........: Alteração da Query para pegar a porcentagem de acordo com a
                      data de vigência mais próxima da data selecionada.
--------------------------------------------------------------------------------
Rotina.............: MontaQuerySegregacao, IResAluguelSegregPrint
N. Sol.............: 126318
N. Kintana.........: 660563
Data...............: 24/02/2010
Responsável........: Cássio Camargo
Descrição..........: Alterado relatório de Folha de Aluguel por Contrato.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Rotina.............: Várias
N. Sol.............: 126315
N. Kintana.........: 660053
Data...............: 08/01/2010
Responsável........: Ricardo Alves
Descrição..........: Alterado relatório de Conta Corrente por Imóvel.
--------------------------------------------------------------------------------
Rotina.............:
N. Sol.............: 126316
N. Kintana.........: 660057
Data...............: 06/01/2010
Responsável........: Ricardo Alves
Descrição..........: Alterado relatório de Inadimplência por Contrato.
--------------------------------------------------------------------------------
Pendências  : 24412
Responsável : Daniel Simões
Data        : 22/05/2007
Descrição   : Implementação de Quebra por Segmento no relatório de Inadimplência
              de Contratos Analíticos...
--------------------------------------------------------------------------------
Pendências  : 24411
Responsável : Daniel Simões
Data        : 05/04/2007
Descrição   : Implementação dos Reajustes da Folha de Aluguel no relatório de
              Folha de Alguel por Contrato...
--------------------------------------------------------------------------------
Pendências  : 19142
Responsável : Daniel Simões
Data        : 16/05/2006
Descrição   : Alteração dos relatórios de Inadimplência para no caso de
              operação 5, buscar a RECBTOPAGTO.DATABAIXA, se esta não existir,
              usar a LANCTODOCUM.DATALANCTO.
--------------------------------------------------------------------------------
Pendências  : 21502
Responsável : Daniel Simões
Data        : 15/03/2006
Descrição   : Adicionado no relatório e no formulário dos relatórios analítico
              e sintético a "data da última atualização" ...
--------------------------------------------------------------------------------
Pendências  : 21503
Responsável : Daniel Simões
Data        : 10/03/2006
Descrição   : A query do relatório "Inadimplência por Imóvel" foi "atualizada"
              baseada nas querys dos relatórios "Inadimplência por contratos
              analítico e sintético" ...
--------------------------------------------------------------------------------
Pendências  : 21494 e 21495
Responsável : Daniel Simões
Data        : 10/03/2006
Descrição   : Adicionado filtro por responsável nos relatórios de inadimplência
              por contratos analítico e sintético...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit dRelAdminImobCC;

interface                               

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppClass, ppStrtch, ppMemo, Db, ppPrnabl,
  ppProd, ppReport, DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB,
  ppDBBDE, ppVar, ppRelatv, ppDBPipe, Grids, DBGrids, ppModule,
  daDataModule, raCodMod, ppRegion, ppSubRpt, ppParameter, DBClient,
  uCmSqlParams, uCmControlObject, Provider, uCMMath,UCMClientDataSet;

type
  TdtmRelAdminImobCC = class(TdtmReports)
    qryCCImovel: TwwQuery;
    dsCCImovel: TwwDataSource;
    pplCCImovel: TppBDEPipeline;
    qryCCContrato: TwwQuery;
    qryCCContratoCONTRATOEXTENSO: TStringField;
    qryCCContratoDESCALC: TStringField;
    qryCCContratoIDCONTRATOIMOVEL: TFloatField;
    qryCCContratoCONNUMERO: TStringField;
    qryCCContratoCONNOME: TStringField;
    qryCCContratoLOCATARIO: TStringField;
    qryCCContratoIDIMOVEL: TFloatField;
    qryCCContratoIDIMOVELMESTRE: TFloatField;
    qryCCContratoIDMESTRE: TFloatField;
    qryCCContratoNOME_MESTRE: TStringField;
    qryCCContratoDESCCUSTORECIMO: TStringField;
    qryCCContratoDATALANCAMENTO: TDateTimeField;
    qryCCContratoDATAVENCIMENTO: TDateTimeField;
    qryCCContratoMESCOMPETENCIA: TFloatField;
    qryCCContratoANOCOMPETENCIA: TFloatField;
    qryCCContratoDESCRICAO: TStringField;
    qryCCContratoRECPAG: TStringField;
    qryCCContratoSTATUS: TStringField;
    qryCCContratoNODOCUMENTO: TFloatField;
    qryCCContratoCODDOCUMENTO: TFloatField;
    qryCCContratoCODALTERADOR: TFloatField;
    qryCCContratoOPERACAO: TStringField;
    qryCCContratoVALOR: TFloatField;
    qryCCContratoDEBCRE: TStringField;
    qryCCContratoHISTORICOCOMPL: TStringField;
    qryCCContratoDATALANCTO: TDateTimeField;
    qryCCContratoNF_FORCLI: TStringField;
    qryCCContratoRS_FORCLI: TStringField;
    qryCCContratoDATA: TDateTimeField;
    qryCCContratoTOT_RECEBER: TFloatField;
    qryCCContratoTOT_RECEBIDO: TFloatField;
    qryCCContratoTOT_PAGAR: TFloatField;
    qryCCContratoTOT_PAGO: TFloatField;
    qryCCContratoSALDO_RECEB: TFloatField;
    qryCCContratoSALDO_PAGAR: TFloatField;
    qryCCContratoIMOVEL_EXTENSO: TStringField;
    dsCCContrato: TwwDataSource;
    pplCCContrato: TppBDEPipeline;
    rptCCContrato: TppReport;
    rptCCContrato_CabecalhoRelat: TppHeaderBand;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    rptCCContratoLabel10: TppLabel;
    rptCCContratoLabel11: TppLabel;
    rptCCContrato_lblCompetencia: TppLabel;
    rptCCContrato_lblDatas: TppLabel;
    rptCCContratoLabel12: TppLabel;
    rptCCContrato_lblAdministradora: TppLabel;
    rptCCContratoLabel7: TppLabel;
    rptCCContrato_lblTipoRecDes: TppLabel;
    rptCCContrato_lblRecPag: TppLabel;
    rptCCContrato_lblPrevEfetivo: TppLabel;
    rptCCContrato_lblContratosVigentes: TppLabel;
    rptCCContrato_lblEmAberto: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBMemo1: TppDBMemo;
    rptCCContratoDBMemo1: TppDBMemo;
    rptCCContrato_Separador: TppLine;
    rptCCContratoDBText5: TppDBText;
    rptCCContratoDBText6: TppDBText;
    rptCCContratoLabel13: TppLabel;
    rptCCContratoDBText4: TppDBText;
    rptCCContratoDBText7: TppDBText;
    rptCCContratoDBMemo2: TppDBMemo;
    rptCCContratoDBText2: TppDBText;
    rptCCContratoDBText8: TppDBText;
    rptCCContratoDBText9: TppDBText;
    rptCCContratoDBMemo3: TppDBMemo;
    rptCCContratoDBText10: TppDBText;
    ppFooterBand4: TppFooterBand;
    CCContratoLinha4: TppLine;
    ppLabel21: TppLabel;
    ppGroup3: TppGroup;
    rptCCContrato_CabecalhoGrupo: TppGroupHeaderBand;
    CCContratoLinha1: TppLine;
    ppLabel22: TppLabel;
    CCContratoLinha2: TppLine;
    ppLabel23: TppLabel;
    rptCCContratoDBText1: TppDBText;
    rptCCContratoLabel2: TppLabel;
    rptCCContratoDBText3: TppDBText;
    rptCCContratoLabel3: TppLabel;
    rptCCContratoLabel5: TppLabel;
    rptCCContratoLabel9: TppLabel;
    rptCCContratoLabel1: TppLabel;
    rptCCContratoLabel15: TppLabel;
    rptCCContratoLabel4: TppLabel;
    rptCCContratoLabel14: TppLabel;
    rptCCContratoLabel16: TppLabel;
    rptCCContratoLabel8: TppLabel;
    rptCCContratoLabel18: TppLabel;
    rptCCContrato_RodapeRelat: TppGroupFooterBand;
    rptCCContratoShape1: TppShape;
    CCContratoLinha3: TppLine;
    rptCCContratoDBCalc1: TppDBCalc;
    rptCCContratoDBCalc2: TppDBCalc;
    rptCCContratoDBCalc3: TppDBCalc;
    rptCCContratoDBCalc4: TppDBCalc;
    rptCCContratoLabel6: TppLabel;
    rptCCContratoShape2: TppShape;
    rptCCContratoLabel17: TppLabel;
    rptCCContratoDBCalc5: TppDBCalc;
    rptCCContratoDBCalc6: TppDBCalc;
    qryCCMestre: TwwQuery;
    qryCCMestreDESCALC: TStringField;
    qryCCMestreIDIMOVEL: TFloatField;
    qryCCMestreIDIMOVELMESTRE: TFloatField;
    qryCCMestreNOME_MESTRE: TStringField;
    qryCCMestreDESCCUSTORECIMO: TStringField;
    qryCCMestreDATALANCAMENTO: TDateTimeField;
    qryCCMestreDATAVENCIMENTO: TDateTimeField;
    qryCCMestreMESCOMPETENCIA: TFloatField;
    qryCCMestreANOCOMPETENCIA: TFloatField;
    qryCCMestreDESCRICAO: TStringField;
    qryCCMestreRECPAG: TStringField;
    qryCCMestreSTATUS: TStringField;
    qryCCMestreNODOCUMENTO: TFloatField;
    qryCCMestreCODDOCUMENTO: TFloatField;
    qryCCMestreCODALTERADOR: TFloatField;
    qryCCMestreOPERACAO: TStringField;
    qryCCMestreVALOR: TFloatField;
    qryCCMestreDEBCRE: TStringField;
    qryCCMestreHISTORICOCOMPL: TStringField;
    qryCCMestreDATALANCTO: TDateTimeField;
    qryCCMestreNF_FORCLI: TStringField;
    qryCCMestreRS_FORCLI: TStringField;
    qryCCMestreDATA: TDateTimeField;
    qryCCMestreTOT_RECEBER: TFloatField;
    qryCCMestreTOT_RECEBIDO: TFloatField;
    qryCCMestreTOT_PAGAR: TFloatField;
    qryCCMestreTOT_PAGO: TFloatField;
    qryCCMestreSALDO_RECEB: TFloatField;
    qryCCMestreSALDO_PAGAR: TFloatField;
    qryCCMestreIMONOME: TStringField;
    dsCCMestre: TwwDataSource;
    pplCCMestre: TppBDEPipeline;
    rptCCImovel: TppReport;
    rptCCImovel_CabecalhoRelat: TppHeaderBand;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    rptCCImovelLabel1: TppLabel;
    rptCCImovelLabel2: TppLabel;
    rptCCImovel_lblCompetencia: TppLabel;
    rptCCImovel_lblDatas: TppLabel;
    rptCCImovelLabel13: TppLabel;
    rptCCImovel_lblTipoRecDes: TppLabel;
    rptCCImovel_lblRecPag: TppLabel;
    rptCCImovel_lblPrevEfetivo: TppLabel;
    rptCCImovel_lblEmAberto: TppLabel;
    ppDetailBand6: TppDetailBand;
    rptCCImovel_Separador: TppLine;
    rptCCImovelDBText1: TppDBText;
    rptCCImovelDBText2: TppDBText;
    rptCCImovelLabel3: TppLabel;
    rptCCImovelDBText3: TppDBText;
    rptCCImovelDBText4: TppDBText;
    rptCCImovelDBText5: TppDBText;
    rptCCImovelDBText6: TppDBText;
    rptCCImovelDBText7: TppDBText;
    rptCCImovelDBMemo2: TppDBMemo;
    rptCCImovelDBMemo3: TppDBMemo;
    rptCCImovelDBMemo4: TppDBMemo;
    rptCCImovelDBText9: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLine11: TppLine;
    ppLabel28: TppLabel;
    ppGroup8: TppGroup;
    rptCCImovel_CabecalhoGrupo: TppGroupHeaderBand;
    rptCCImovelLine1: TppLine;
    rptCCImovelLabel4: TppLabel;
    rptCCImovelLabel7: TppLabel;
    rptCCImovelLabel8: TppLabel;
    rptCCImovelLabel9: TppLabel;
    rptCCImovelLabel10: TppLabel;
    rptCCImovelLabel11: TppLabel;
    rptCCImovelLabel12: TppLabel;
    rptCCImovelLabel14: TppLabel;
    rptCCImovelLabel17: TppLabel;
    rptCCImovelLabel18: TppLabel;
    rptCCImovelLine2: TppLine;
    rptCCImovelDBText8: TppDBText;
    rptCCImovelLabel5: TppLabel;
    rptCCImovel_RodapeGrupo: TppGroupFooterBand;
    rptCCImovelShape1: TppShape;
    ppLine28: TppLine;
    rptCCImovelDBCalc1: TppDBCalc;
    rptCCImovelDBCalc2: TppDBCalc;
    rptCCImovelDBCalc3: TppDBCalc;
    rptCCImovelDBCalc4: TppDBCalc;
    rptCCImovelShape2: TppShape;
    rptCCImovelLabel15: TppLabel;
    rptCCImovelDBCalc5: TppDBCalc;
    rptCCImovelDBCalc6: TppDBCalc;
    rptCCImovelLabel16: TppLabel;
    qryCCLocatario: TwwQuery;
    StringField66: TStringField;
    StringField67: TStringField;
    qryCCLocatarioIDCONTRATOIMOVEL: TFloatField;
    qryCCLocatarioCONNUMERO: TStringField;
    qryCCLocatarioCONNOME: TStringField;
    qryCCLocatarioLOCATARIO: TStringField;
    qryCCLocatarioIDIMOVEL: TFloatField;
    qryCCLocatarioIDIMOVELMESTRE: TFloatField;
    qryCCLocatarioIDMESTRE: TFloatField;
    qryCCLocatarioNOME_MESTRE: TStringField;
    qryCCLocatarioIMOVEL_EXTENSO: TStringField;
    qryCCLocatarioDESCCUSTORECIMO: TStringField;
    qryCCLocatarioDATALANCAMENTO: TDateTimeField;
    qryCCLocatarioDATAVENCIMENTO: TDateTimeField;
    qryCCLocatarioMESCOMPETENCIA: TFloatField;
    qryCCLocatarioANOCOMPETENCIA: TFloatField;
    qryCCLocatarioDESCRICAO: TStringField;
    qryCCLocatarioRECPAG: TStringField;
    qryCCLocatarioSTATUS: TStringField;
    qryCCLocatarioNODOCUMENTO: TFloatField;
    qryCCLocatarioCODDOCUMENTO: TFloatField;
    qryCCLocatarioCODALTERADOR: TFloatField;
    qryCCLocatarioOPERACAO: TStringField;
    qryCCLocatarioVALOR: TFloatField;
    qryCCLocatarioDEBCRE: TStringField;
    qryCCLocatarioHISTORICOCOMPL: TStringField;
    qryCCLocatarioDATALANCTO: TDateTimeField;
    qryCCLocatarioNF_FORCLI: TStringField;
    qryCCLocatarioRS_FORCLI: TStringField;
    qryCCLocatarioDATA: TDateTimeField;
    qryCCLocatarioTOT_RECEBER: TFloatField;
    qryCCLocatarioTOT_RECEBIDO: TFloatField;
    qryCCLocatarioTOT_PAGAR: TFloatField;
    qryCCLocatarioTOT_PAGO: TFloatField;
    qryCCLocatarioSALDO_RECEB: TFloatField;
    qryCCLocatarioSALDO_PAGAR: TFloatField;
    dsCCLocatario: TwwDataSource;
    pplCCLocatario: TppBDEPipeline;
    rptCCMestre: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppLabel6: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel32: TppLabel;
    rptCCMestre_lblCompetencia: TppLabel;
    rptCCMestre_lblDatas: TppLabel;
    ppLabel50: TppLabel;
    rptCCMestre_lblTipoRecDes: TppLabel;
    rptCCMestre_lblRecPag: TppLabel;
    rptCCMestre_lblPrevEfetivo: TppLabel;
    rptCCMestre_lblEmAberto: TppLabel;
    ppDetailBand8: TppDetailBand;
    ppDBMemo6: TppDBMemo;
    ppDBMemo7: TppDBMemo;
    rptCCMestre_Separador: TppLine;
    ppDBText4: TppDBText;
    ppDBText9: TppDBText;
    ppLabel70: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBMemo8: TppDBMemo;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText45: TppDBText;
    ppDBMemo9: TppDBMemo;
    ppDBText46: TppDBText;
    ppFooterBand8: TppFooterBand;
    ppLine8: TppLine;
    ppLabel99: TppLabel;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppLine9: TppLine;
    ppLabel100: TppLabel;
    ppLine10: TppLine;
    ppLabel101: TppLabel;
    ppDBText49: TppDBText;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppLabel108: TppLabel;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppLabel111: TppLabel;
    ppLabel113: TppLabel;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppLabel117: TppLabel;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppShape1: TppShape;
    ppLine13: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel118: TppLabel;
    ppShape2: TppShape;
    ppLabel119: TppLabel;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    rptCCLocatario: TppReport;
    ppHeaderBand16: TppHeaderBand;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel61: TppLabel;
    ppLabel102: TppLabel;
    rptCCLocatario_lblCompetencia: TppLabel;
    rptCCLocatario_lblDatas: TppLabel;
    ppLabel134: TppLabel;
    rptCCLocatario_lblTipoRecDes: TppLabel;
    rptCCLocatario_lblRecPag: TppLabel;
    rptCCLocatario_lblPrevEfetivo: TppLabel;
    rptCCLocatario_lblContratosVigentes: TppLabel;
    rptCCLocatario_lblEmAberto: TppLabel;
    ppDetailBand13: TppDetailBand;
    ppDBMemo10: TppDBMemo;
    ppDBMemo17: TppDBMemo;
    rptCCLocatario_Separador: TppLine;
    ppDBText27: TppDBText;
    ppDBText51: TppDBText;
    ppLabel145: TppLabel;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBMemo20: TppDBMemo;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBMemo22: TppDBMemo;
    ppDBText57: TppDBText;
    ppFooterBand16: TppFooterBand;
    ppLine16: TppLine;
    ppLabel146: TppLabel;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLabel151: TppLabel;
    ppLabel156: TppLabel;
    ppDBText65: TppDBText;
    ppLabel159: TppLabel;
    ppLabel160: TppLabel;
    ppLabel161: TppLabel;
    ppLabel163: TppLabel;
    ppLabel164: TppLabel;
    ppLabel165: TppLabel;
    ppLabel168: TppLabel;
    ppLabel169: TppLabel;
    ppLabel170: TppLabel;
    ppLabel171: TppLabel;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppShape5: TppShape;
    ppLine20: TppLine;
    ppDBCalc26: TppDBCalc;
    ppDBCalc27: TppDBCalc;
    ppDBCalc28: TppDBCalc;
    ppDBCalc29: TppDBCalc;
    ppLabel172: TppLabel;
    ppShape6: TppShape;
    ppLabel173: TppLabel;
    ppDBCalc30: TppDBCalc;
    ppDBCalc31: TppDBCalc;
    dsInadimplenciaContrato: TwwDataSource;
    pplInadimplenciaContrato: TppBDEPipeline;
    rptInadimplenciaContrato: TppReport;
    ppHeaderBand23: TppHeaderBand;
    ppLabel187: TppLabel;
    ppLabel239: TppLabel;
    ppLine82: TppLine;
    ppLabel242: TppLabel;
    ppLabel243: TppLabel;
    ppLabel244: TppLabel;
    ppLabel251: TppLabel;
    ppLabel256: TppLabel;
    rptInadimplenciaContratoLabel1: TppLabel;
    rptInadimplenciaContratoLabel3: TppLabel;
    rptInadimplenciaContratolblMesCompetencia: TppLabel;
    rptInadimplenciaContratolblDataLimite: TppLabel;
    ppDetailBand23: TppDetailBand;
    ppDBText102: TppDBText;
    ppDBMemo28: TppDBMemo;
    ppLine86: TppLine;
    ppDBText103: TppDBText;
    ppLabel269: TppLabel;
    ppDBMemo29: TppDBMemo;
    ppDBMemo30: TppDBMemo;
    rptInadimplenciaContratoDBText1: TppDBText;
    ppFooterBand23: TppFooterBand;
    ppLine87: TppLine;
    ppLabel270: TppLabel;
    rptInadimplenciaContratoSummaryBand1: TppSummaryBand;
    rptInadimplenciaContratoShape1: TppShape;
    rptInadimplenciaContratoLabel2: TppLabel;
    rptInadimplenciaContratoDBCalc1: TppDBCalc;
    rptInadimplenciaContratoLine1: TppLine;
    qryInadimplenciaContrato: TwwQuery;
    qryInadimplenciaContratoIDCONTRATOIMOVEL: TFloatField;
    qryInadimplenciaContratoNUMERO_CONTRATO: TStringField;
    qryInadimplenciaContratoNOME_CONTRATO: TStringField;
    qryInadimplenciaContratoCONDATAINICIO: TDateTimeField;
    qryInadimplenciaContratoCONDATAFIM: TDateTimeField;
    qryInadimplenciaContratoIDLOCATARIO: TFloatField;
    qryInadimplenciaContratoNF_LOCATARIO: TStringField;
    qryInadimplenciaContratoRS_LOCATARIO: TStringField;
    qryInadimplenciaContratoIDADMINIMOVEL: TFloatField;
    qryInadimplenciaContratoNF_ADMINISTRADORA: TStringField;
    qryInadimplenciaContratoRS_ADMINISTRADORA: TStringField;
    qryInadimplenciaContratoTOT_RECEBER: TFloatField;
    dsInadimplenciaMestre: TwwDataSource;
    pplInadimplenciaMestre: TppBDEPipeline;
    rptInadimplenciaMestre: TppReport;
    ppHeaderBand25: TppHeaderBand;
    ppLabel246: TppLabel;
    ppLabel253: TppLabel;
    ppLine89: TppLine;
    ppLabel255: TppLabel;
    ppLabel259: TppLabel;
    ppLabel260: TppLabel;
    ppLabel261: TppLabel;
    ppLabel262: TppLabel;
    rptInadimplenciaMestrelblMesCompetencia: TppLabel;
    rptInadimplenciaMestrelblDataLimite: TppLabel;
    ppDetailBand25: TppDetailBand;
    ppDBMemo31: TppDBMemo;
    ppDBText104: TppDBText;
    ppFooterBand25: TppFooterBand;
    ppLine91: TppLine;
    ppLabel265: TppLabel;
    ppSummaryBand4: TppSummaryBand;
    ppShape15: TppShape;
    ppLabel266: TppLabel;
    ppDBCalc50: TppDBCalc;
    ppLine92: TppLine;
    qryInadimplenciaMestre: TwwQuery;
    qryInadimplenciaMestreIDIMOVEL: TFloatField;
    qryInadimplenciaMestreNOME_MESTRE: TStringField;
    qryInadimplenciaMestreTOT_RECEBER: TFloatField;
    dsInadimplenciaLocatario: TwwDataSource;
    pplInadimplenciaLocatario: TppBDEPipeline;
    rptInadimplenciaLocatario: TppReport;
    ppHeaderBand26: TppHeaderBand;
    ppLabel263: TppLabel;
    ppLabel264: TppLabel;
    ppLine93: TppLine;
    ppLabel267: TppLabel;
    ppLabel271: TppLabel;
    ppLabel273: TppLabel;
    ppLabel274: TppLabel;
    ppLabel275: TppLabel;
    rptInadimplenciaLocatariolblMesCompetencia: TppLabel;
    rptInadimplenciaLocatariolblDataLimite: TppLabel;
    ppDetailBand26: TppDetailBand;
    ppDBMemo33: TppDBMemo;
    ppLine94: TppLine;
    ppDBText110: TppDBText;
    rptInadimplenciaLocatarioDBMemo1: TppDBMemo;
    ppFooterBand26: TppFooterBand;
    ppLine95: TppLine;
    ppLabel279: TppLabel;
    ppSummaryBand5: TppSummaryBand;
    ppShape16: TppShape;
    ppLabel280: TppLabel;
    ppDBCalc51: TppDBCalc;
    ppLine96: TppLine;
    qryInadimplenciaLocatario: TwwQuery;
    qryInadimplenciaLocatarioNF_LOCATARIO: TStringField;
    qryInadimplenciaLocatarioRS_LOCATARIO: TStringField;
    qryInadimplenciaLocatarioTOT_RECEBER: TFloatField;
    qryDivergenciaLanc: TwwQuery;
    rptDivergenciaLanc: TppReport;
    ppHeaderBand17: TppHeaderBand;
    ppLabel9: TppLabel;
    ppLabel40: TppLabel;
    ppLabel11: TppLabel;
    ppLabel34: TppLabel;
    rptDivergenciaLanc_lblCompetencia: TppLabel;
    rptDivergenciaLanc_lblDatas: TppLabel;
    ppLabel39: TppLabel;
    rptDivergenciaLanc_lblTipoRecDes: TppLabel;
    ppDetailBand16: TppDetailBand;
    rptLancImovel_Separador: TppLine;
    ppDBText64: TppDBText;
    ppLabel38: TppLabel;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBMemo23: TppDBMemo;
    ppDBMemo26: TppDBMemo;
    ppDBMemo27: TppDBMemo;
    rptLancImovelDBText1: TppDBText;
    rptLancImovelDBText2: TppDBText;
    ppDBText1: TppDBText;
    rptLancImovelDBText3: TppDBText;
    ppFooterBand17: TppFooterBand;
    ppLine26: TppLine;
    ppLabel41: TppLabel;
    ppLine27: TppLine;
    ppLabel58: TppLabel;
    ppLabel121: TppLabel;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    rptLancImovelLabel1: TppLabel;
    rptLancImovelLabel2: TppLabel;
    ppLabel2: TppLabel;
    rptLancImovelLabel3: TppLabel;
    rptLancImovelLabel4: TppLabel;
    rptLancImovelLabel5: TppLabel;
    dsDivergenciaLanc: TwwDataSource;
    pplDivergenciaLanc: TppBDEPipeline;
    rptDivergenciaLancSummaryBand1: TppSummaryBand;
    ppLine39: TppLine;
    rptLancImovelShape1: TppShape;
    rptLancImovelDBCalc1: TppDBCalc;
    rptLancImovelDBCalc2: TppDBCalc;
    rptLancImovelLabel6: TppLabel;
    rptFolhaAluguel: TppReport;
    qryFolhaAluguel: TwwQuery;
    dsFolhaAluguel: TwwDataSource;
    pplFolhaAluguel: TppBDEPipeline;
    qryFolhaAluguelIDCONTRATOIMOVEL: TFloatField;
    qryFolhaAluguelDATAVENCIMENTO: TDateTimeField;
    qryFolhaAluguelTOT_CONTRATO: TFloatField;
    qryFolhaAluguelCONNUMERO: TStringField;
    qryFolhaAluguelCONNOME: TStringField;
    qryFolhaAluguelFORMA_PAGAMENTO: TStringField;
    qryFolhaAluguelTIPO_RECDES: TStringField;
    qryFolhaAluguelCONTRATO_EXTENSO: TStringField;
    rptCCContrato_FundoBandaDetalhe: TppShape;
    rptCCImovel_FundoBandaDetalhe: TppShape;
    rptCCMestre_FundoBandaDetalhe: TppShape;
    rptCCLocatario_FundoBandaDetalhe: TppShape;
    rptDivergenciaLancShape1: TppShape;
    rptInadimplenciaLocatarioShape1: TppShape;
    rptInadimplenciaMestreLine1: TppLine;
    rptInadimplenciaMestreShape1: TppShape;
    rptInadimplenciaMestreDBText1: TppDBText;
    rptInadimplenciaContratoShape2: TppShape;
    qryCC: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    StringField7: TStringField;
    FloatField8: TFloatField;
    StringField8: TStringField;
    StringField9: TStringField;
    DateTimeField3: TDateTimeField;
    StringField10: TStringField;
    StringField11: TStringField;
    DateTimeField4: TDateTimeField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    StringField12: TStringField;
    dsCC: TwwDataSource;
    pplCC: TppBDEPipeline;
    rptCC: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    rptCC_lblCompetencia: TppLabel;
    rptCC_lblDatas: TppLabel;
    ppLabel13: TppLabel;
    rptCC_lblTipoRecDes: TppLabel;
    rptCC_lblRecPag: TppLabel;
    rptCC_lblPrevEfetivo: TppLabel;
    rptCC_lblEmAberto: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape3: TppShape;
    ppDBMemo2: TppDBMemo;
    ppDBMemo4: TppDBMemo;
    ppLine1: TppLine;
    ppDBText2: TppDBText;
    ppDBText5: TppDBText;
    ppLabel20: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBMemo5: TppDBMemo;
    ppDBText8: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBMemo11: TppDBMemo;
    ppDBText15: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine3: TppLine;
    ppLabel24: TppLabel;
    qryCCNOME_EXTENSO: TStringField;
    rptCCLine2: TppLine;
    rptCCLabel1: TppLabel;
    rptCCLabel2: TppLabel;
    rptCCLabel3: TppLabel;
    rptCCLabel4: TppLabel;
    rptCCLabel5: TppLabel;
    rptCCLabel6: TppLabel;
    rptCCLabel7: TppLabel;
    rptCCLabel8: TppLabel;
    rptCCLabel9: TppLabel;
    rptCCLabel10: TppLabel;
    rptCCLabel11: TppLabel;
    qryDivergenciaLancIMOVEL_EXTENSO: TStringField;
    qryDivergenciaLancCONTRATO_EXTENSO: TStringField;
    qryDivergenciaLancDESCCUSTORECIMO: TStringField;
    qryDivergenciaLancDATALANCAMENTO: TDateTimeField;
    qryDivergenciaLancDATAVENCIMENTO: TDateTimeField;
    qryDivergenciaLancTRGDTINCLUSAO: TDateTimeField;
    qryDivergenciaLancDATA_BAIXA: TDateTimeField;
    qryDivergenciaLancMESCOMPETENCIA: TFloatField;
    qryDivergenciaLancANOCOMPETENCIA: TFloatField;
    qryDivergenciaLancFLGORIGEMLANC: TStringField;
    qryDivergenciaLancFLGESTORNADO: TFloatField;
    qryDivergenciaLancRECPAG: TStringField;
    qryDivergenciaLancVALOR_OM_LANC: TFloatField;
    qryDivergenciaLancVALOR_LANC: TFloatField;
    qryDivergenciaLancVLRLANCOMRECEB: TFloatField;
    qryDivergenciaLancVLRLANCOMPAGAR: TFloatField;
    qryDivergenciaLancVLRLANCRECEB: TFloatField;
    qryDivergenciaLancVLRLANCPAGAR: TFloatField;
    qryDivergenciaLancVLRJUROS: TFloatField;
    qryDivergenciaLancVLRMULTA: TFloatField;
    qryDivergenciaLancVLRCORRECAOMON: TFloatField;
    qryDivergenciaLancDATACORRECAO: TDateTimeField;
    qryDivergenciaLancTOT_PAGAR: TFloatField;
    qryDivergenciaLancTOT_PAGO: TFloatField;
    qryDivergenciaLancTOT_RECEBER: TFloatField;
    qryDivergenciaLancTOT_RECEBIDO: TFloatField;
    qryDivergenciaLancPREVISTO: TFloatField;
    qryDivergenciaLancEFETIVO: TFloatField;
    qryDivergenciaLancLOGIN_USUARIO: TStringField;
    qryDivergenciaLancNF_USUARIO: TStringField;
    qryDivergenciaLancNF_FORCLI: TStringField;
    qryDivergenciaLancRS_FORCLI: TStringField;
    qryDivergenciaLancIDDOCUMENTO: TFloatField;
    qryDivergenciaLancNODOCUMENTO: TFloatField;
    qryDivergenciaLancPORTADOR_FORMA: TStringField;
    qryDivergenciaLancIMOCODIGO: TStringField;
    qryDivergenciaLancCODTIPIMOVEL: TStringField;
    qryDivergenciaLancFLGATIVO: TFloatField;
    qryDivergenciaLancSTATUS_IMOVEL: TStringField;
    rptCCContrato_lblTipoData: TppLabel;
    rptCCImovel_lblSitImovel: TppLabel;
    rptCCMestre_lblTipoData: TppLabel;
    rptCCLocatario_lblTipoData: TppLabel;
    rptCC_lblTipoData: TppLabel;
    rptCCContrato_lblTipoImovel: TppLabel;
    rptCCImovel_lblTipoImovel: TppLabel;
    rptCCMestre_lblTipoImovel: TppLabel;
    rptCCLocatario_lblTipoImovel: TppLabel;
    rptCC_lblTipoImovel: TppLabel;
    rptCCContratoDBText11: TppDBText;
    rptCCContratoLabel19: TppLabel;
    qryCCContratoNUMAPGR: TFloatField;
    rptCCImovelDBText10: TppDBText;
    rptCCImovelLabel6: TppLabel;
    rptCCMestreDBText1: TppDBText;
    rptCCMestreLabel1: TppLabel;
    rptCCLocatarioDBText1: TppDBText;
    rptCCLocatarioLabel1: TppLabel;
    rptCCDBText1: TppDBText;
    rptCCLabel12: TppLabel;
    qryCCMestreNUMAPGR: TFloatField;
    qryCCLocatarioNUMAPGR: TFloatField;
    qryCCNUMAPGR: TFloatField;
    qryFolhaAluguelNOSSONUMERO: TStringField;
    ppCalc26: TppSystemVariable;
    ppCalc31: TppSystemVariable;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    ppCalc50: TppSystemVariable;
    ppCalc51: TppSystemVariable;
    ppCalc48: TppSystemVariable;
    ppCalc49: TppSystemVariable;
    ppCalc44: TppSystemVariable;
    ppCalc45: TppSystemVariable;
    ppCalc17: TppSystemVariable;
    ppCalc18: TppSystemVariable;
    ppCalc15: TppSystemVariable;
    ppCalc16: TppSystemVariable;
    ppCalc11: TppSystemVariable;
    ppCalc12: TppSystemVariable;
    ppCalc7: TppSystemVariable;
    ppCalc8: TppSystemVariable;
    ppLiberaLanc: TppBDEPipeline;
    dsLiberaLanc: TwwDataSource;
    qryLiberaLanc: TwwQuery;
    rptLiberaLanc: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel10: TppLabel;
    ppLine4: TppLine;
    ppLabel12: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppLine5: TppLine;
    ppLabel16: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLine6: TppLine;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppLabel31: TppLabel;
    ppLabel33: TppLabel;
    ppLabel35: TppLabel;
    ppDBText21: TppDBText;
    ppDBMemo12: TppDBMemo;
    ppDBMemo13: TppDBMemo;
    qryFolhaComparativa: TwwQuery;
    qryFolhaComparativaIDCONTRATOIMOVEL: TFloatField;
    qryFolhaComparativaCONTRATO_EXTENSO: TStringField;
    qryFolhaComparativaVALOR_ANT: TFloatField;
    qryFolhaComparativaVALOR_ATU: TFloatField;
    qryFolhaComparativaSITUACAO: TStringField;
    qryFolhaComparativaFLGSTATUS: TStringField;
    rptFolhaComparativa: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel36: TppLabel;
    ppLine7: TppLine;
    ppLabel37: TppLabel;
    ppLabel42: TppLabel;
    ppLabel44: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBText19: TppDBText;
    ppDBText22: TppDBText;
    ppFooterBand5: TppFooterBand;
    dsFolhaComparativa: TwwDataSource;
    ppFolhaComparativa: TppBDEPipeline;
    qryFolhaComparativaCONNUMERO: TStringField;
    qryFolhaComparativaCONNOME: TStringField;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    rptFolhaComparativa_lblPeriodoFim: TppLabel;
    rptFolhaComparativa_lblPeriodoIni: TppLabel;
    ppLabel43: TppLabel;
    ppLabel45: TppLabel;
    rptFolhaComparativa_responsavel: TppLabel;
    rptFolhaComparativa_contrato: TppLabel;
    ppShape4: TppShape;
    ppLine15: TppLine;
    ppLine12: TppLine;
    ppLine14: TppLine;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel51: TppLabel;
    qryFolhaComparativaCONDATAINICIO: TDateTimeField;
    qryFolhaComparativaCONDATAFIM: TDateTimeField;
    ppDBText20: TppDBText;
    ppDBText28: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppShape7: TppShape;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppLabel52: TppLabel;
    ppShape8: TppShape;
    ppLabel53: TppLabel;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppLabel54: TppLabel;
    ppDBText29: TppDBText;
    qryCCPlanoPatro: TwwQuery;
    StringField13: TStringField;
    FloatField16: TFloatField;
    StringField14: TStringField;
    StringField16: TStringField;
    DateTimeField5: TDateTimeField;
    DateTimeField6: TDateTimeField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    StringField20: TStringField;
    FloatField22: TFloatField;
    StringField21: TStringField;
    StringField22: TStringField;
    DateTimeField7: TDateTimeField;
    StringField23: TStringField;
    StringField24: TStringField;
    DateTimeField8: TDateTimeField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    dsCCPlanoPatro: TwwDataSource;
    pplCCPlanoPatro: TppBDEPipeline;
    rptCCPlanoPatro: TppReport;
    qryCCPlanoPatroNOME_PLANO: TStringField;
    qryCCPlanoPatroNOME_PATRO: TStringField;
    ppSummaryBand6: TppSummaryBand;
    ppRegion4: TppRegion;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppDBCalc38: TppDBCalc;
    ppDBCalc39: TppDBCalc;
    ppDBCalc40: TppDBCalc;
    ppDBCalc41: TppDBCalc;
    ppLabel69: TppLabel;
    ppDBCalc42: TppDBCalc;
    ppDBCalc43: TppDBCalc;
    ppLabel71: TppLabel;
    dsInadimplContrAnalitico: TwwDataSource;
    pplInadimplContrAnalitico: TppBDEPipeline;
    rptInadimplContrAnalitico: TppReport;
    qryInadimplContrAnalitico: TwwQuery;
    qryInadimplContrAnaliticoIDCONTRATOIMOVEL: TFloatField;
    qryInadimplContrAnaliticoNUMERO_CONTRATO: TStringField;
    qryInadimplContrAnaliticoNOME_CONTRATO: TStringField;
    qryInadimplContrAnaliticoCODDOCUMENTO: TFloatField;
    qryInadimplContrAnaliticoTOT_RECEBER: TFloatField;
    qryInadimplContrAnaliticoRECEBIDO: TFloatField;
    qryInadimplContrAnaliticoCOMPETENCIA: TStringField;
    qryInadimplContrAnaliticoCONDATAINICIO: TDateTimeField;
    qryInadimplContrAnaliticoCONDATAFIM: TDateTimeField;
    qryInadimplContrAnaliticoIDLOCATARIO: TFloatField;
    qryInadimplContrAnaliticoNF_LOCATARIO: TStringField;
    qryInadimplContrAnaliticoRS_LOCATARIO: TStringField;
    qryInadimplContrAnaliticoIDADMINIMOVEL: TFloatField;
    qryInadimplContrAnaliticoDATAVENCIMENTO: TDateTimeField;
    qryInadimplContrAnaliticoCORRECAO: TFloatField;
    qryInadimplContrAnaliticoJUROS: TFloatField;
    qryInadimplContrAnaliticoMULTA: TFloatField;
    qryInadimplContrAnaliticoTOTAL: TFloatField;
    ppLogoCCContrato: TppImage;
    ppLogoCCImovel: TppImage;
    ppLogoCCImovelMestre: TppImage;
    ppLogoCCLocatario: TppImage;
    ppLogoContaCorrente: TppImage;
    ppLogoLctoDivergencias: TppImage;
    ppLogoInadimplContrato: TppImage;
    ppLogoInadimplImovelM: TppImage;
    ppLogoInadimplLocatario: TppImage;
    ppLogoLancLiberados: TppImage;
    ppLogoComparaAluguel: TppImage;
    ppHeaderBand5: TppHeaderBand;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    rptCCPlanoPatro_lblCompetencia: TppLabel;
    rptCCPlanoPatro_lblDatas: TppLabel;
    ppLabel64: TppLabel;
    rptCCPlanoPatro_lblTipoRecDes: TppLabel;
    rptCCPlanoPatro_lblRecPag: TppLabel;
    rptCCPlanoPatro_lblPrevEfetivo: TppLabel;
    rptCCPlanoPatro_lblEmAberto: TppLabel;
    rptCCPlanoPatro_lblTipoData: TppLabel;
    rptCCPlanoPatro_lblTipoImovel: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLine25: TppLine;
    ppLine29: TppLine;
    ppLogoCCPlanoPatro: TppImage;
    ppDBText41: TppDBText;
    ppLabel126: TppLabel;
    ppLabel127: TppLabel;
    ppDBText40: TppDBText;
    ppDetailBand7: TppDetailBand;
    ppLine22: TppLine;
    ppShape9: TppShape;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppLabel72: TppLabel;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBMemo14: TppDBMemo;
    ppDBMemo15: TppDBMemo;
    ppDBMemo16: TppDBMemo;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppLine23: TppLine;
    ppLabel73: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppSummaryBand8: TppSummaryBand;
    ppRegion7: TppRegion;
    ppShape22: TppShape;
    ppShape23: TppShape;
    ppDBCalc57: TppDBCalc;
    ppDBCalc58: TppDBCalc;
    ppDBCalc59: TppDBCalc;
    ppDBCalc60: TppDBCalc;
    ppLabel74: TppLabel;
    ppDBCalc61: TppDBCalc;
    ppDBCalc62: TppDBCalc;
    ppLabel128: TppLabel;
    ppGroup7: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppRegion2: TppRegion;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppDBCalc20: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    ppDBCalc23: TppDBCalc;
    ppLabel65: TppLabel;
    ppDBCalc24: TppDBCalc;
    ppDBCalc25: TppDBCalc;
    ppLabel66: TppLabel;
    ppGroup6: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppRegion3: TppRegion;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppLabel62: TppLabel;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppLabel63: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText42: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel67: TppLabel;
    rptCCImovel_lblVago: TppLabel;
    qryFolhaAluguelTOT_DESC: TFloatField;
    qryFolhaAluguelIDDOCUMENTO: TFloatField;
    qryFolhaAluguelDESCORIGEMLANC: TStringField;
    qryCCConsolidado: TwwQuery;
    StringField15: TStringField;
    StringField25: TStringField;
    FloatField15: TFloatField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    FloatField31: TFloatField;
    FloatField32: TFloatField;
    StringField29: TStringField;
    StringField30: TStringField;
    DateTimeField9: TDateTimeField;
    DateTimeField10: TDateTimeField;
    FloatField33: TFloatField;
    FloatField34: TFloatField;
    StringField31: TStringField;
    StringField32: TStringField;
    StringField33: TStringField;
    FloatField35: TFloatField;
    FloatField36: TFloatField;
    FloatField37: TFloatField;
    StringField34: TStringField;
    FloatField38: TFloatField;
    StringField35: TStringField;
    StringField36: TStringField;
    DateTimeField11: TDateTimeField;
    StringField37: TStringField;
    StringField38: TStringField;
    DateTimeField12: TDateTimeField;
    FloatField39: TFloatField;
    FloatField40: TFloatField;
    FloatField41: TFloatField;
    FloatField42: TFloatField;
    FloatField43: TFloatField;
    FloatField44: TFloatField;
    FloatField45: TFloatField;
    dsCCConsolidado: TwwDataSource;
    pplCCConsolidado: TppBDEPipeline;
    rptCCConsolidado: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLabel138: TppLabel;
    ppLabel139: TppLabel;
    ppLabel140: TppLabel;
    ppLabel141: TppLabel;
    rptCCConsolidado_lblCompetencia: TppLabel;
    rptCCConsolidado_lblDatas: TppLabel;
    ppLabel144: TppLabel;
    rptCCConsolidado_lblAdministradora: TppLabel;
    ppLabel148: TppLabel;
    rptCCConsolidado_lblTipoRecDes: TppLabel;
    rptCCConsolidado_lblRecPag: TppLabel;
    rptCCConsolidado_lblPrevEfetivo: TppLabel;
    rptCCConsolidado_lblContratosVigentes: TppLabel;
    rptCCConsolidado_lblEmAberto: TppLabel;
    rptCCConsolidado_lblTipoData: TppLabel;
    rptCCConsolidado_lblTipoImovel: TppLabel;
    ppImage1: TppImage;
    ppDetailBand10: TppDetailBand;
    ppShape17: TppShape;
    ppLine36: TppLine;
    ppDBMemo25: TppDBMemo;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppLabel158: TppLabel;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppDBMemo34: TppDBMemo;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppFooterBand10: TppFooterBand;
    ppLine37: TppLine;
    ppLabel162: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable10: TppSystemVariable;
    ppGroup9: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppLine38: TppLine;
    ppLabel166: TppLabel;
    ppLine40: TppLine;
    ppDBText82: TppDBText;
    ppLabel174: TppLabel;
    ppDBText83: TppDBText;
    ppLabel175: TppLabel;
    ppLabel176: TppLabel;
    ppLabel177: TppLabel;
    ppLabel178: TppLabel;
    ppLabel179: TppLabel;
    ppLabel180: TppLabel;
    ppLabel181: TppLabel;
    ppLabel182: TppLabel;
    ppLabel184: TppLabel;
    ppLabel185: TppLabel;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppShape18: TppShape;
    ppDBCalc34: TppDBCalc;
    ppDBCalc35: TppDBCalc;
    ppDBCalc36: TppDBCalc;
    ppDBCalc37: TppDBCalc;
    ppLabel186: TppLabel;
    ppShape24: TppShape;
    ppLabel188: TppLabel;
    ppDBCalc63: TppDBCalc;
    ppDBCalc64: TppDBCalc;
    ppGroup11: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppLabel142: TppLabel;
    ppDBText84: TppDBText;
    ppLine42: TppLine;
    ppLine41: TppLine;
    ppShape25: TppShape;
    ppDBCalc65: TppDBCalc;
    ppDBCalc66: TppDBCalc;
    ppDBCalc67: TppDBCalc;
    ppDBCalc68: TppDBCalc;
    ppLabel143: TppLabel;
    ppShape26: TppShape;
    ppLabel147: TppLabel;
    ppDBCalc69: TppDBCalc;
    ppDBCalc70: TppDBCalc;
    qryCCConsolidadoCODTIPIMOVEL: TStringField;
    qryCCConsolidadoDESCTIPOIMOVEL: TStringField;
    ppGroup12: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppLabel149: TppLabel;
    ppDBText86: TppDBText;
    ppShape27: TppShape;
    ppDBCalc71: TppDBCalc;
    ppDBCalc72: TppDBCalc;
    ppDBCalc73: TppDBCalc;
    ppDBCalc74: TppDBCalc;
    ppLabel150: TppLabel;
    ppShape28: TppShape;
    ppLabel152: TppLabel;
    ppDBCalc75: TppDBCalc;
    ppDBCalc76: TppDBCalc;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLine45: TppLine;
    qryInadimplContrAnaliticoDIAS: TFloatField;
    ppHeaderBand6: TppHeaderBand;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLine30: TppLine;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    rptInadimplContrAnaliticolblMesCompetencia: TppLabel;
    rptInadimplContrAnaliticolblDataLimite: TppLabel;
    ppLabel96: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLabel112: TppLabel;
    ppLabel116: TppLabel;
    ppLabel120: TppLabel;
    ppLabel122: TppLabel;
    ppLine35: TppLine;
    ppLogoInadimplContrAnalitico: TppImage;
    ppLabel133: TppLabel;
    rptInadimplContrAnaliticolblSegmento: TppLabel;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    rptInadimplContrAnaliticolblReceita: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppShape21: TppShape;
    ppLine31: TppLine;
    ppDBText47: TppDBText;
    ppDBText50: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText72: TppDBText;
    ppFooterBand9: TppFooterBand;
    ppLine32: TppLine;
    ppLabel98: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppSummaryBand7: TppSummaryBand;
    ppLine33: TppLine;
    ppRegion6: TppRegion;
    ppDBCalc44: TppDBCalc;
    ppLabel105: TppLabel;
    ppDBCalc53: TppDBCalc;
    ppDBCalc54: TppDBCalc;
    ppDBCalc55: TppDBCalc;
    ppDBCalc56: TppDBCalc;
    ppDBCalc33: TppDBCalc;
    ppPageStyle1: TppPageStyle;
    ppGrpInadimpContrAnaliticoSeg: TppGroup;
    ppGrpInadimpContrAnaliticoSegHeader: TppGroupHeaderBand;
    ppDBText48: TppDBText;
    ppLabel91: TppLabel;
    ppDBMemo18: TppDBMemo;
    ppLabel88: TppLabel;
    ppDBMemo19: TppDBMemo;
    ppLabel90: TppLabel;
    ppLabel89: TppLabel;
    ppDBText43: TppDBText;
    ppLabel97: TppLabel;
    ppDBText44: TppDBText;
    ppGrpInadimpContrAnaliticoSegFooter: TppGroupFooterBand;
    ppRegion5: TppRegion;
    ppDBCalc45: TppDBCalc;
    ppLabel95: TppLabel;
    ppDBCalc46: TppDBCalc;
    ppDBCalc47: TppDBCalc;
    ppDBCalc48: TppDBCalc;
    ppDbCalcTotal: TppDBCalc;
    ppDBCalc32: TppDBCalc;
    ppLine34: TppLine;
    ppVarDias: TppVariable;
    ppRegion8: TppRegion;
    ppLabel153: TppLabel;
    ppVarPerPerdas: TppVariable;
    ppVarVlrPerdas: TppVariable;
    ppLabel154: TppLabel;
    rptInadimplContrAnaliticolblResponsabilidade: TppLabel;
    ppLabel155: TppLabel;
    rptInadimplenciaContratolblResponsavel1: TppLabel;
    ppLabel157: TppLabel;
    rptInadimplContrAnaliticolblDataAtualiza1: TppLabel;
    ppLabel183: TppLabel;
    rptInadimplContratolblDataAtualiza1: TppLabel;
    ppLabel190: TppLabel;
    rptInadimplenciaLocatariolblDataAtualiza1: TppLabel;
    ppLabel192: TppLabel;
    rptInadimplenciaMestrelblDataAtualiza1: TppLabel;
    qryResumoFolha: TwwQuery;
    dsResumoFolha: TwwDataSource;
    pplResumoFolha: TppBDEPipeline;
    ppParameterList1: TppParameterList;
    qryResumoFolhaCODTIPIMOVEL: TStringField;
    qryResumoFolhaDESCTIPOIMOVEL: TStringField;
    qryResumoFolhaTOT_CONTRATO: TFloatField;
    qryResumoFolhaTOT_DESC: TFloatField;
    qryResumoFolhaTIPO_RECDES: TStringField;
    qryResumoFolhaTOTAL: TFloatField;
    qryFolhaAluguelVLR_TOTAL: TFloatField;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    rptContratoLabel1: TppLabel;
    rptContratoLabel4: TppLabel;
    rptContratoLabel6: TppLabel;
    rptContratoLabel7: TppLabel;
    rptContratoLine1: TppLine;
    rptFolhaAluguelLabel1: TppLabel;
    rptFolhaAluguelLabel2: TppLabel;
    rptFolhaAluguel_lblCompetencia: TppLabel;
    rptFolhaAluguel_lblAdministradora: TppLabel;
    rptFolhaAluguelLabel5: TppLabel;
    rptFolhaAluguelLabel3: TppLabel;
    rptFolhaAluguel_lblResponsavel: TppLabel;
    ppLogoFolhaAluguel: TppImage;
    ppLabel68: TppLabel;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    ppLabel131: TppLabel;
    ppLabel132: TppLabel;
    ppLine24: TppLine;
    ppLabel137: TppLabel;
    ppDetailBand1: TppDetailBand;
    rptFolhaAluguel_Separador: TppLine;
    rptFolhaAluguel_FundoBandaDetalhe: TppShape;
    ppDBMemo3: TppDBMemo;
    ppDBText3: TppDBText;
    ppDBText12: TppDBText;
    rptContratoDBMemo1: TppDBMemo;
    rptFolhaAluguelDBMemo1: TppDBMemo;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppDBText71: TppDBText;
    ppTotal: TppVariable;
    ppDBMemo21: TppDBMemo;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel25: TppLabel;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    rptFolhaAluguelSummaryBand1: TppSummaryBand;
    rptFolhaAluguelLine1: TppLine;
    rptFolhaAluguelLabel4: TppLabel;
    ppDBCalc79: TppDBCalc;
    raCodeModule1: TraCodeModule;
    ppRegion1: TppRegion;
    ppDBCalc83: TppDBCalc;
    ppDBCalc84: TppDBCalc;
    ppDBCalc85: TppDBCalc;
    ppLabel198: TppLabel;
    qryInadimplContrAnaliticoDESCTIPOIMOVEL: TStringField;
    ppGroup14: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppGroupFooterBand11: TppGroupFooterBand;
    ppLabel199: TppLabel;
    ppDBText91: TppDBText;
    ppLine50: TppLine;
    ppLine51: TppLine;
    ppRegion10: TppRegion;
    ppDBCalc86: TppDBCalc;
    ppLabel200: TppLabel;
    ppDBCalc87: TppDBCalc;
    ppDBCalc88: TppDBCalc;
    ppDBCalc89: TppDBCalc;
    ppDBCalc90: TppDBCalc;
    ppDBCalc91: TppDBCalc;
    ppDBText93: TppDBText;
    strngfldInadimplenciaContratoDESCR_SITCONTR: TStringField;
    plbl1: TppLabel;
    pfldInadimplenciaContratoppField7: TppField;
    pfldInadimplenciaContratoppField8: TppField;
    strngfldInadimplContrAnaliticoDESCR_SITCONTR: TStringField;
    pfldInadimplContrAnaliticoppField21: TppField;
    plbl2: TppLabel;
    pdbtxtsITcONTR1: TppDBText;
    pfldInadimplenciaMestreppField6: TppField;
    pdbtxtsITcONTR3: TppDBText;
    plbl5: TppLabel;
    strngfldInadimplenciaLocatarioDESCR_SITCONTR: TStringField;
    pfldInadimplenciaLocatarioppField4: TppField;
    pdbtxtsITcONTR2: TppDBText;
    plbl4: TppLabel;
    sqlGrupoSeg: TCMSqlParams;
    cdsGrupoSeg: TClientDataSet;
    cdsGrupoSegIDPATRO: TFloatField;
    cdsGrupoSegIDPLANOPREV: TFloatField;
    cdsGrupoSegVALOR: TFloatField;
    cdsGrupoSegPERCENT: TFloatField;
    cdsGrupoSegPATROCINADORA: TStringField;
    cdsGrupoSegPLANOPREV: TStringField;
    dsGrupoSeg: TDataSource;
    pplGrupoSeg: TppBDEPipeline;
    pplTotalImovel: TppBDEPipeline;
    dsTotalImovel: TDataSource;
    cdsTotalImovel: TClientDataSet;
    sqlTotalImovel: TCMSqlParams;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand14: TppDetailBand;
    ppSummaryBand10: TppSummaryBand;
    ppLabel201: TppLabel;
    ppLabel202: TppLabel;
    ppLabel203: TppLabel;
    ppLabel204: TppLabel;
    ppLabel205: TppLabel;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppDBText100: TppDBText;
    ppDBText101: TppDBText;
    ppLabel206: TppLabel;
    ppLabel207: TppLabel;
    ppLabel208: TppLabel;
    ppDBText105: TppDBText;
    ppDBText107: TppDBText;
    ppDBText108: TppDBText;
    cdsTotalGeral: TClientDataSet;
    dsTotalGeral: TDataSource;
    pplTotalGeral: TppBDEPipeline;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    pplSaldoImovel: TppBDEPipeline;
    dsSaldoImovel: TDataSource;
    cdsSaldoImovel: TClientDataSet;
    pplSaldoGeral: TppBDEPipeline;
    dsSaldoGeral: TDataSource;
    cdsSaldoGeral: TClientDataSet;
    ppSubReport4: TppSubReport;
    ppChildReport4: TppChildReport;
    ppSubReport5: TppSubReport;
    ppChildReport5: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppDetailBand15: TppDetailBand;
    ppSummaryBand11: TppSummaryBand;
    ppTitleBand5: TppTitleBand;
    ppDetailBand17: TppDetailBand;
    ppSummaryBand12: TppSummaryBand;
    ppLabel209: TppLabel;
    ppLabel210: TppLabel;
    ppLabel211: TppLabel;
    ppLabel212: TppLabel;
    ppLabel213: TppLabel;
    ppLabel214: TppLabel;
    ppLabel215: TppLabel;
    ppLabel216: TppLabel;
    ppDBText109: TppDBText;
    ppDBText111: TppDBText;
    ppDBText112: TppDBText;
    ppDBText113: TppDBText;
    ppDBText114: TppDBText;
    ppDBText115: TppDBText;
    ppDBText116: TppDBText;
    ppLabel217: TppLabel;
    ppLabel218: TppLabel;
    ppLabel219: TppLabel;
    ppLabel220: TppLabel;
    ppLabel221: TppLabel;
    ppLabel223: TppLabel;
    ppDBText117: TppDBText;
    ppDBText118: TppDBText;
    ppDBText119: TppDBText;
    ppDBText120: TppDBText;
    ppDBText122: TppDBText;
    ppTitleBand6: TppTitleBand;
    ppDetailBand18: TppDetailBand;
    ppSummaryBand13: TppSummaryBand;
    ppLabel222: TppLabel;
    ppLabel224: TppLabel;
    ppLabel225: TppLabel;
    ppLabel226: TppLabel;
    ppLabel227: TppLabel;
    ppLabel228: TppLabel;
    ppDBText121: TppDBText;
    ppDBText123: TppDBText;
    ppDBText124: TppDBText;
    ppDBText125: TppDBText;
    ppDBText126: TppDBText;
    qryCCImovelIDIMOVEL: TFloatField;
    qryCCImovelIDIMOVELMESTRE: TFloatField;
    qryCCImovelNOME_MESTRE: TStringField;
    qryCCImovelIMOVEL_EXTENSO: TStringField;
    qryCCImovelDESCCUSTORECIMO: TStringField;
    qryCCImovelDATALANCAMENTO: TDateTimeField;
    qryCCImovelDATAVENCIMENTO: TDateTimeField;
    qryCCImovelMESCOMPETENCIA: TFloatField;
    qryCCImovelANOCOMPETENCIA: TFloatField;
    qryCCImovelDESCRICAO: TStringField;
    qryCCImovelRECPAG: TStringField;
    qryCCImovelSTATUS: TStringField;
    qryCCImovelNODOCUMENTO: TFloatField;
    qryCCImovelNUMAPGR: TFloatField;
    qryCCImovelCODDOCUMENTO: TFloatField;
    qryCCImovelCODALTERADOR: TFloatField;
    qryCCImovelOPERACAO: TStringField;
    qryCCImovelVALOR: TFloatField;
    qryCCImovelDEBCRE: TStringField;
    qryCCImovelHISTORICOCOMPL: TStringField;
    qryCCImovelDATALANCTO: TDateTimeField;
    qryCCImovelNF_FORCLI: TStringField;
    qryCCImovelRS_FORCLI: TStringField;
    qryCCImovelDATA: TDateTimeField;
    qryCCImovelTOT_RECEBER: TFloatField;
    qryCCImovelTOT_RECEBIDO: TFloatField;
    qryCCImovelTOT_PAGAR: TFloatField;
    qryCCImovelTOT_PAGO: TFloatField;
    qryCCImovelSALDO_RECEB: TFloatField;
    qryCCImovelSALDO_PAGAR: TFloatField;
    dsInadimplenciaImovel: TwwDataSource;
    pplInadimplenciaImovel: TppBDEPipeline;
    pplInadimplenciaImovelppField1: TppField;
    pplInadimplenciaImovelppField2: TppField;
    pplInadimplenciaImovelppField3: TppField;
    pplInadimplenciaImovelppField4: TppField;
    pplInadimplenciaImovelppField5: TppField;
    pplInadimplenciaImovelppField6: TppField;
    pplInadimplenciaImovelppField7: TppField;
    pplInadimplenciaImovelppField8: TppField;
    pplInadimplenciaImovelppField9: TppField;
    pplInadimplenciaImovelppField10: TppField;
    rptInadimplenciaImovel: TppReport;
    ppHeaderBand24: TppHeaderBand;
    ppLabel240: TppLabel;
    ppLabel241: TppLabel;
    ppLine83: TppLine;
    ppLabel245: TppLabel;
    ppLabel247: TppLabel;
    ppLabel248: TppLabel;
    ppLabel249: TppLabel;
    ppLabel250: TppLabel;
    ppLabel252: TppLabel;
    rptInadimplenciaImovellblMesCompetencia: TppLabel;
    rptInadimplenciaImovellblDataLimite: TppLabel;
    ppLogoInadimplImovel: TppImage;
    ppLabel167: TppLabel;
    rptInadimplenciaImovellblDataAtualiza1: TppLabel;
    plbl3: TppLabel;
    ppDetailBand24: TppDetailBand;
    rptInadimplenciaImovelShape1: TppShape;
    ppLine84: TppLine;
    ppDBMemo32: TppDBMemo;
    ppDBText106: TppDBText;
    rptInadimplenciaImovelDBText2: TppDBText;
    rptInadimplenciaImovelDBText1: TppDBText;
    ppDBText92: TppDBText;
    ppFooterBand24: TppFooterBand;
    ppLine85: TppLine;
    ppLabel257: TppLabel;
    ppCalc46: TppSystemVariable;
    ppCalc47: TppSystemVariable;
    ppSummaryBand3: TppSummaryBand;
    ppShape14: TppShape;
    ppLabel258: TppLabel;
    ppDBCalc49: TppDBCalc;
    ppLine88: TppLine;
    ppGroup1: TppGroup;
    ppGrpSegmentoCab: TppGroupHeaderBand;
    ppDBText130: TppDBText;
    ppLine17: TppLine;
    ppGrpSegmentoRod: TppGroupFooterBand;
    ppLabel232: TppLabel;
    ppLine21: TppLine;
    ppDBCalc13: TppDBCalc;
    ppParameterList2: TppParameterList;
    qryInadimplenciaImovel: TwwQuery;
    qryInadimplenciaImovelIDIMOVEL: TFloatField;
    qryInadimplenciaImovelCODTIPIMOVEL: TStringField;
    qryInadimplenciaImovelNOME_IMOVEL: TStringField;
    qryInadimplenciaImovelIMOMATRICULA: TStringField;
    qryInadimplenciaImovelIMOCODIGO: TStringField;
    qryInadimplenciaImovelDESCTIPOIMOVEL: TStringField;
    qryInadimplenciaImovelNOME_MESTRE: TStringField;
    qryInadimplenciaImovelIMOVEL_COMPOSTO: TStringField;
    qryInadimplenciaImovelDESCR_SITCONTR: TStringField;
    qryInadimplenciaImovelTOT_RECEBER: TFloatField;
    pplInadimplencia: TppBDEPipeline;
    pplTotal: TppBDEPipeline;
    dsInadimplencia: TwwDataSource;
    dsTotal: TDataSource;
    sqlTotal: TCMSqlParams;
    cdsTotal: TClientDataSet;
    sqlInadimplencia: TCMSqlParams;
    cdsInadimplencia: TClientDataSet;
    qryResAluguelSegreg: TwwQuery;
    dsResAluguelSegreg: TwwDataSource;
    pplResAluguelSegreg: TppBDEPipeline;
    pplResAluguelSegregppField1: TppField;
    pplResAluguelSegregppField2: TppField;
    pplResAluguelSegregppField3: TppField;
    pplResAluguelSegregppField4: TppField;
    pplResAluguelSegregppField5: TppField;
    updResAluguelSegreg: TUpdateSQL;
    IResAluguelSegreg: TppSubReport;
    ppChildReport8: TppChildReport;
    ppTitleBand7: TppTitleBand;
    ppDetailBand21: TppDetailBand;
    ppSummaryBand14: TppSummaryBand;
    ppLTopResumoAlug: TppLine;
    ppLblSegFolhaAluguel: TppLabel;
    pplblPlanoPrev: TppLabel;
    ppLAlugSegreg: TppLine;
    pplblPatroSegAluguel: TppLabel;
    ppLblPercSegAluguel: TppLabel;
    ppLblVlrSegAluguel: TppLabel;
    ppdbPlanoAlug: TppDBText;
    ppdbPatroAlug: TppDBText;
    ppdbPercAlug: TppDBText;
    ppdbVlrAlugSegreg: TppDBText;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand2: TppTitleBand;
    lblTituloGrupoSqg: TppLabel;
    lbl1: TppLabel;
    lbl2: TppLabel;
    lbl3: TppLabel;
    lbl4: TppLabel;
    ppDetailBand12: TppDetailBand;
    ppDBText94: TppDBText;
    ppDBText95: TppDBText;
    ppDBText96: TppDBText;
    ppDBText97: TppDBText;
    ppSummaryBand9: TppSummaryBand;
    ppRegion9: TppRegion;
    ppSubReport7: TppSubReport;
    ppChildReport7: TppChildReport;
    ppHeaderBand9: TppHeaderBand;
    ppDetailBand20: TppDetailBand;
    ppDBText131: TppDBText;
    ppDBText132: TppDBText;
    ppDBText133: TppDBText;
    ppDBText134: TppDBText;
    ppFooterBand11: TppFooterBand;
    ppLabel189: TppLabel;
    ppLabel191: TppLabel;
    ppLabel193: TppLabel;
    ppLabel194: TppLabel;
    ppLine46: TppLine;
    ppLabel195: TppLabel;
    ppRegion11: TppRegion;
    ppSubReport6: TppSubReport;
    ppChildReport6: TppChildReport;
    ppHeaderBand10: TppHeaderBand;
    ppDetailBand19: TppDetailBand;
    ppDBText30: TppDBText;
    ppDBText127: TppDBText;
    ppDBText128: TppDBText;
    ppDBText129: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppLine47: TppLine;
    ppLabel55: TppLabel;
    ppLabel196: TppLabel;
    ppLabel197: TppLabel;
    ppLabel229: TppLabel;
    ppLabel230: TppLabel;
    cdsInadimplenciaPATRO: TStringField;
    cdsInadimplenciaPLANOPREV: TStringField;
    cdsInadimplenciaPERCENTRATEIO: TFloatField;
    cdsInadimplenciaVALOR: TFloatField;
    cdsInadimplenciaDESCTIPOIMOVEL: TStringField;
    cdsTotalPATRO: TStringField;
    cdsTotalPLANOPREV: TStringField;
    cdsTotalPERCENTRATEIO: TFloatField;
    cdsTotalVALOR: TFloatField;
    cdsTotalGeralPATROCINADORA: TStringField;
    cdsTotalGeralPLANOPREV: TStringField;
    cdsTotalGeralPPIPERCENTRATEIO: TFloatField;
    cdsTotalGeralPERCENTRATEIO: TFloatField;
    cdsTotalGeralTOT_APAGAR: TFloatField;
    cdsTotalGeralTOT_PAGO: TFloatField;
    cdsTotalGeralTOT_ARECEBER: TFloatField;
    cdsTotalGeralTOT_RECEBIDO: TFloatField;
    cdsTotalGeralSALDO_PAGAR: TFloatField;
    cdsTotalGeralSALDO_RECEB: TFloatField;
    cdsTotalImovelPATROCINADORA: TStringField;
    cdsTotalImovelPLANOPREV: TStringField;
    cdsTotalImovelPERCENTRATEIO: TFloatField;
    cdsTotalImovelTOT_APAGAR: TFloatField;
    cdsTotalImovelTOT_PAGO: TFloatField;
    cdsTotalImovelTOT_ARECEBER: TFloatField;
    cdsTotalImovelTOT_RECEBIDO: TFloatField;
    cdsSaldoImovelPATROCINADORA: TStringField;
    cdsSaldoImovelPLANOPREV: TStringField;
    cdsSaldoImovelPERCENTRATEIO: TFloatField;
    cdsSaldoImovelTOT_APAGAR: TFloatField;
    cdsSaldoImovelTOT_PAGO: TFloatField;
    cdsSaldoImovelTOT_ARECEBER: TFloatField;
    cdsSaldoImovelTOT_RECEBIDO: TFloatField;
    cdsSaldoGeralPATROCINADORA: TStringField;
    cdsSaldoGeralPLANOPREV: TStringField;
    cdsSaldoGeralPPIPERCENTRATEIO: TFloatField;
    cdsSaldoGeralPERCENTRATEIO: TFloatField;
    cdsSaldoGeralTOT_APAGAR: TFloatField;
    cdsSaldoGeralTOT_PAGO: TFloatField;
    cdsSaldoGeralTOT_ARECEBER: TFloatField;
    cdsSaldoGeralTOT_RECEBIDO: TFloatField;
    cdsSaldoGeralSALDO_PAGAR: TFloatField;
    cdsSaldoGeralSALDO_RECEB: TFloatField;
    LblInadimplencia: TppLabel;
    ppLabel231: TppLabel;
    ppLabel233: TppLabel;
    ppLabel234: TppLabel;
    ppLabel235: TppLabel;
    // Início - Michelle Mota - SOL: 264999.17959 - PPM: 1181696
	pdbtxtDATAPROGRAMADA: TppDBText;
    plblDATAPROGRAMADA: TppLabel;
    pfldFolhaAluguelDATAPROGRAMADA: TppField;
    dtmfldFolhaAluguelDATAPROGRAMADA: TDateTimeField;
	// Término - Michelle Mota - SOL: 264999.17959 - PPM: 1181696

    // procedimentos definidos

    // outros procedimentos
    procedure qryCCContratoCalcFields(DataSet: TDataSet);
    procedure qryCCImovelCalcFields(DataSet: TDataSet);
    procedure qryCCMestreCalcFields(DataSet: TDataSet);
    procedure qryCCLocatarioCalcFields(DataSet: TDataSet);
    procedure rptCCContrato_SeparadorPrint(Sender: TObject);
    procedure qryFolhaAluguelCalcFields(DataSet: TDataSet);
    procedure rptFolhaAluguel_FundoBandaDetalhePrint(Sender: TObject);
    procedure rptCCContrato_CabecalhoRelatBeforePrint(Sender: TObject);
    procedure qryCCPlanoPatroCalcFields(DataSet: TDataSet);
    procedure qryCCConsolidadoCalcFields(DataSet: TDataSet);
    procedure ppSubReport4Print(Sender: TObject);
    procedure ppSubReport5Print(Sender: TObject);
    procedure ppSubReport2Print(Sender: TObject);
    procedure ppSubReport3Print(Sender: TObject);

    //Marilza Colpani SOL 126317/KTN 660060 - Início
    procedure ppSubReport7Print(Sender: TObject);
    procedure ppSubReport6Print(Sender: TObject);
    //Marilza Colpani SOL 126317/KTN 660060 - Fim

    //Cássio - SOL Nº 126318 KINTANA Nº 660563
    procedure IResAluguelSegregPrint(Sender: TObject);

  private { Private declarations }
    function MostraParam(Form: string): boolean; override;

    // Felipe de Oliveira SOL 131922 - KTN 756226 - Início
    procedure MontaQuerySegregacaoPorImovel( var ADataSet : TClientDataSet; iTipoSubRelatorio : Integer);
    procedure MontaQuerySegregacaoPorImovelTotal( var ADataSet : TClientDataSet;
                          dTotalPagar, dTotalPago,dTotalReceber,dTotalRecebido : Currency; iTipoSubRelatorio : Integer);
    procedure MontaValor(var DatasetCDS,DataSetTemp : TClientDataSet;
                          dTotalPagar, dTotalPago,dTotalReceber,dTotalRecebido : Currency);
    procedure MontaPorcentagem(var DatasetCDS : TClientDataSet; dTotalPagar,dTotalPago,dTotalReceber,dTotalRecebido : Currency ;
                                                              sCampo1,sCampo2,sCampo3,sCampo4 : String);
    procedure MontaPorcentagemSaldo(var DatasetSaldo : TClientDataSet;  DatasetImovel: TClientDataSet; dTotalPagar,dTotalPago,dTotalReceber,dTotalRecebido : Currency ;
                                                               sCampo1,sCampo2,sCampo3,sCampo4 : String);

//    procedure MontaQuerySegregacaoImovelTotal( var ADataSet : TClientDataSet);
    // Felipe de Oliveira SOL 131922 - KTN 756226 - Fim

    //Marilza Colpani SOL 126317/KTN 660060
    procedure MontaQuerySegregacao(sCodTipImovel: string; iIdPatro, iIdPlanoPrev, iIDImovel: integer); 
    //Cássio - SOL Nº 126318 KINTANA Nº 660563
    //Método sobrecarregado, para fazer uma outra segregação
    procedure MontaQuerySegregacaoFolhaAluguel(ADataSet : TClientDataSet);

//    Cores:
//    ColorA = FFFFFF   ( branco, clWhite )
//    ColorC = 00C0FFFF ( amarelo - pastel )
//    ColorD = 00C6F9CC ( verde - pastel )
//    ColorE = 00F3E6CD ( azul - pastel )
//    ColorF = 00A0A0A0
//    ColorG = 00BEBEBE
//    ColorH = 00D2D2D2
//    ColorI = 00E3E3E3

  public { Public declarations }
   bSeparador, bCorLinha   : boolean;
   CorLinha, CorAtual      : TColor;
   sPlano, sPatro, iIdImovel : Integer;
   // Felipe de Oliveira SOL 131922 - KTN 756226 - Início
   dDataFinal : TDateTime;
   totalPagar,totalPago, totalReceber, totalRecebido : Double;
   // Felipe de Oliveira SOL 131922 - KTN 756226 - Fim
  end;



var
  dtmRelAdminImobCC: TdtmRelAdminImobCC;



implementation
{$R *.DFM}
uses
   uSistema, uDiasInUteis, uIntegraBack,
   cRelCCImovel, cRelCCMestre, cRelCCContrato, cRelCCLocatario,
   cRelInadimplenciaImovel, cRelInadimplenciaMestre, cRelInadimplenciaContrato,
   cRelInadimplenciaLocatario, cRelFolhaAluguel, cRelDivergenciaLanc,
   cRelLiberaLanc, cRelFolhaComparativa, cRelCCPlanoPatro,
   cRelInadimplContrAnalitico,CRelCCConsolidado, UComunsImobiliario, DBaseDados;

function TdtmRelAdminImobCC.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Conta-Corrente -----------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelcccontrato') then begin
      frm := TcfgRelCCContrato.Create(Application);
   end else if (LowerCase(Form) = 'cfgrelccconsolidado') then begin
      frm := TcfgRelCCConsolidado.Create(Application);
   end else if (LowerCase(Form) = 'cfgrelccimovel') then begin
      frm := TcfgRelCCImovel.Create(Application);
   end else if (LowerCase(Form) = 'cfgrelccmestre') then begin
      frm := TcfgRelCCMestre.Create(Application);
   end else if (LowerCase(Form) = 'cfgrelcclocatario') then begin
      frm := TcfgRelCCLocatario.Create(Application);
   end else if (LowerCase(Form) = 'cfgrelccplanopatro') then begin // Marcio Motta - 02/06/2004 - 16860
      frm := TcfgRelCCPlanoPatro.Create(Application);

   // Folha de aluguéis --------------------------------------------------------------------------------
   end else if (LowerCase(Form) = 'cfgrelfolhaaluguel') then begin
      frm := TCfgRelFolhaAluguel.Create(Application);

   // Inadimplência ------------------------------------------------------------------------------------
   end else if (LowerCase(Form) = 'cfgrelinadimplenciacontrato') then begin
      frm := TcfgRelInadimplenciaContrato.Create(Application);
   end else if (LowerCase(Form) = 'cfgrelinadimplenciaimovel') then begin
      frm := TcfgRelInadimplenciaImovel.Create(Application);
   end else if (LowerCase(Form) = 'cfgrelinadimplenciamestre') then begin
      frm := TcfgRelInadimplenciaMestre.Create(Application);
   end else if (LowerCase(Form) = 'cfgrelinadimplencialocatario') then begin
      frm := TcfgRelInadimplenciaLocatario.Create(Application);
   end else if (LowerCase(Form) = 'cfgrelinadimplcontranalitico') then begin // Marcio Motta - 08/06/2004 - 16860
      frm := TcfgRelInadimplContrAnalitico.Create(Application);

   // Divergência --------------------------------------------------------------------------------------
   end else if (LowerCase(Form) = 'cfgreldivergencialanc') then begin
      frm := TcfgRelDivergenciaLanc.Create(Application);

   // Lançamentos Contábeis liberados-------------------------------------------------------------------
   end else if (LowerCase(Form) = 'cfgrelliberalanc') then begin
      frm := TcfgRelLiberaLanc.Create(Application);

   // Comparativo de folha de aluguel -------------------------------------------------------------------
   end else if (LowerCase(Form) = 'cfgrelfolhacomparativa') then begin
      frm := TcfgRelFolhaComparativa.Create(Application);
      
   end else begin
      frm := nil;
   end;

   if frm = nil then begin
      Result := False;
      Exit;
   end;

   with frm do begin
      Result := (ShowModal = mrOk);
      Free;
   end;
end;




procedure TdtmRelAdminImobCC.qryCCContratoCalcFields(DataSet: TDataSet);
var
   sContratoExtenso: string;
begin
   inherited;

   with qryCCContrato do begin

      // Contrato Extenso
      sContratoExtenso := '';
      if not(FieldByName('CONNUMERO').isNULL)   then sContratoExtenso := sContratoExtenso + FieldByName('CONNUMERO').asString;
      if ( (not(FieldByName('CONNOME').isNULL)) and (not(FieldByName('CONNUMERO').isNULL)) ) then sContratoExtenso := sContratoExtenso + ' - ';
      if not(FieldByName('CONNOME').isNULL)     then sContratoExtenso := sContratoExtenso + FieldByName('CONNOME').asString;
      FieldByName('CONTRATOEXTENSO').asString   := sContratoExtenso;

      // Operação
      if ( (FieldByName('OPERACAO').asString = '1') or (FieldByName('OPERACAO').asString = '2') ) then begin
         if FieldByName('RECPAG').asString = 'R' then begin
             FieldByName('DESCALC').asString := ''; //'A Receber'
         end else begin
             if FieldByName('RECPAG').asString = 'P' then begin
                FieldByName('DESCALC').asString := ''; // 'A Pagar';
             end;
         end;
      end else begin
         if FieldByName('OPERACAO').asString = '5' then begin
            if FieldByName('RECPAG').asString ='R' then begin
               FieldByName('DESCALC').asString := ''; // Recebimento'
            end else begin
               if FieldByName('RECPAG').asString = 'P' then begin
                  FieldByName('DESCALC').asString := ''; //Pagamento';
               end;
            end;
         end else begin
            if FieldByName('OPERACAO').asString = '4' then begin
               FieldByName('DESCALC').asString  := FieldByName('DESCRICAO').asString + ' - ' +
                                                   FieldByName('HISTORICOCOMPL').asString;
            end;
         end;
      end;

   end;
end;



procedure TdtmRelAdminImobCC.qryCCImovelCalcFields(DataSet: TDataSet);
begin
   inherited;

   with qryCCImovel do begin

      // Operação
      if ( (FieldByName('OPERACAO').asString = '1') or (FieldByName('OPERACAO').asString = '2') ) then begin
         if FieldByName('RECPAG').asString = 'R' then begin
             FieldByName('DESCALC').asString := ''; //'A Receber'
         end else begin
             if FieldByName('RECPAG').asString = 'P' then begin
                FieldByName('DESCALC').asString := ''; // 'A Pagar';
             end;
         end;
      end else begin
         if FieldByName('OPERACAO').asString = '5' then begin
            if FieldByName('RECPAG').asString ='R' then begin
               FieldByName('DESCALC').asString := ''; // 'Recebimento'
            end else begin
               if FieldByName('RECPAG').asString = 'P' then begin
                  FieldByName('DESCALC').asString := ''; // 'Pagamento';
               end;
            end;
         end else begin
            if FieldByName('OPERACAO').asString = '4' then begin        
               FieldByName('DESCALC').asString  := FieldByName('DESCRICAO').asString + ' - ' +
                                                   FieldByName('HISTORICOCOMPL').asString;
            end;
         end;
      end;

   end;
end;



procedure TdtmRelAdminImobCC.qryCCMestreCalcFields(DataSet: TDataSet);
begin
   inherited;
   //Edilaine - SIG101433 : inicio
   //with qryCCMestre do begin

      // Operação
      if ( (Trim(qryCCMestre.FieldByName('OPERACAO').asString) = '1') or (Trim(qryCCMestre.FieldByName('OPERACAO').asString) = '2') ) then begin
         if qryCCMestre.FieldByName('RECPAG').asString = 'R' then begin
             qryCCMestre.FieldByName('DESCALC').asString := ''; //'A Receber'
         end else begin
             if qryCCMestre.FieldByName('RECPAG').asString = 'P' then begin
                qryCCMestre.FieldByName('DESCALC').asString := ''; // 'A Pagar';
             end;
         end;
      end else begin
         if Trim(qryCCMestre.FieldByName('OPERACAO').asString) = '5' then begin
            if qryCCMestre.FieldByName('RECPAG').asString ='R' then begin
               qryCCMestre.FieldByName('DESCALC').asString := ''; // 'Recebimento'
            end else begin
               if qryCCMestre.FieldByName('RECPAG').asString = 'P' then begin
                  qryCCMestre.FieldByName('DESCALC').asString := ''; // 'Pagamento';
               end;
            end;
         end else begin
            if Trim(qryCCMestre.FieldByName('OPERACAO').asString) = '4' then begin
               qryCCMestre.FieldByName('DESCALC').asString  := qryCCMestre.FieldByName('DESCRICAO').asString + ' - ' +
                                                               qryCCMestre.FieldByName('HISTORICOCOMPL').asString;
            end;
         end;
      end;

   //end;
   //Edilaine - SIG101433 : fim

end;



procedure TdtmRelAdminImobCC.qryCCLocatarioCalcFields(DataSet: TDataSet);
begin
   inherited;

   with qryCCLocatario do begin

      // Operação
      if ( (FieldByName('OPERACAO').asString = '1') or (FieldByName('OPERACAO').asString = '2') ) then begin
         if FieldByName('RECPAG').asString = 'R' then begin
             FieldByName('DESCALC').asString := ''; //'A Receber'
         end else begin
             if FieldByName('RECPAG').asString = 'P' then begin
                FieldByName('DESCALC').asString := ''; // 'A Pagar';
             end;
         end;
      end else begin
         if FieldByName('OPERACAO').asString = '5' then begin
            if FieldByName('RECPAG').asString ='R' then begin
               FieldByName('DESCALC').asString := ''; // Recebimento'
            end else begin
               if FieldByName('RECPAG').asString = 'P' then begin
                  FieldByName('DESCALC').asString := ''; //Pagamento';
               end;
            end;
         end else begin
            if FieldByName('OPERACAO').asString = '4' then begin
               FieldByName('DESCALC').asString  := FieldByName('DESCRICAO').asString + ' - ' +
                                                   FieldByName('HISTORICOCOMPL').asString;
            end;
         end;
      end;

   end;
end;



procedure TdtmRelAdminImobCC.rptCCContrato_SeparadorPrint(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelAdminImobCC.qryFolhaAluguelCalcFields(DataSet: TDataSet);
var
   sContratoExtenso: string;
begin
   with qryFolhaAluguel do begin

      // Contrato Extenso
      sContratoExtenso := '';
      if not(FieldByName('CONNUMERO').isNULL)   then sContratoExtenso := sContratoExtenso + FieldByName('CONNUMERO').asString;
      if ( (not(FieldByName('CONNOME').isNULL)) and (not(FieldByName('CONNUMERO').isNULL)) ) then sContratoExtenso := sContratoExtenso + ' - ';
      if not(FieldByName('CONNOME').isNULL)     then sContratoExtenso := sContratoExtenso + FieldByName('CONNOME').asString;

      FieldByName('CONTRATO_EXTENSO').asString   := sContratoExtenso;

   end;
end;



procedure TdtmRelAdminImobCC.rptFolhaAluguel_FundoBandaDetalhePrint(Sender: TObject);
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



procedure TdtmRelAdminImobCC.rptCCContrato_CabecalhoRelatBeforePrint(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



procedure TdtmRelAdminImobCC.qryCCPlanoPatroCalcFields(DataSet: TDataSet);
begin
  inherited;
   with qryCCPlanoPatro do begin

      // Operação
      if ( (FieldByName('OPERACAO').asString = '1') or (FieldByName('OPERACAO').asString = '2') ) then begin
         if FieldByName('RECPAG').asString = 'R' then begin
             FieldByName('DESCALC').asString := ''; //'A Receber'
         end else begin
             if FieldByName('RECPAG').asString = 'P' then begin
                FieldByName('DESCALC').asString := ''; // 'A Pagar';
             end;
         end;
      end else begin
         if FieldByName('OPERACAO').asString = '5' then begin
            if FieldByName('RECPAG').asString ='R' then begin
               FieldByName('DESCALC').asString := ''; // 'Recebimento'
            end else begin
               if FieldByName('RECPAG').asString = 'P' then begin
                  FieldByName('DESCALC').asString := ''; // 'Pagamento';
               end;
            end;
         end else begin
            if FieldByName('OPERACAO').asString = '4' then begin
               FieldByName('DESCALC').asString  := FieldByName('DESCRICAO').asString + ' - ' +
                                                   FieldByName('HISTORICOCOMPL').asString;
            end;
         end;
      end;

   end;

end;

procedure TdtmRelAdminImobCC.qryCCConsolidadoCalcFields(DataSet: TDataSet);
var
   sContratoExtenso: string;
begin
   inherited;

   with qryCCConsolidado do begin

      // Contrato Extenso
      sContratoExtenso := '';
      if not(FieldByName('CONNUMERO').isNULL)  then sContratoExtenso := sContratoExtenso + FieldByName('CONNUMERO').asString;
      if ((not(FieldByName('CONNOME').isNULL)) and (not(FieldByName('CONNUMERO').isNULL)) ) then sContratoExtenso := sContratoExtenso + ' - ';
      if not(FieldByName('CONNOME').isNULL)    then sContratoExtenso := sContratoExtenso + FieldByName('CONNOME').asString;
      FieldByName('CONTRATOEXTENSO').asString := sContratoExtenso;

      // Operação
      if ( (FieldByName('OPERACAO').asString = '1') or (FieldByName('OPERACAO').asString = '2') ) then begin
         if FieldByName('RECPAG').asString = 'R' then begin
             FieldByName('DESCALC').asString := ''; //'A Receber'
         end else begin
             if FieldByName('RECPAG').asString = 'P' then begin
                FieldByName('DESCALC').asString := ''; // 'A Pagar';
             end;
         end;
      end else begin
         if FieldByName('OPERACAO').asString = '5' then begin
            if FieldByName('RECPAG').asString ='R' then begin
               FieldByName('DESCALC').asString := ''; // Recebimento'
            end else begin
               if FieldByName('RECPAG').asString = 'P' then begin
                  FieldByName('DESCALC').asString := ''; //Pagamento';
               end;
            end;
         end else begin
            if FieldByName('OPERACAO').asString = '4' then begin
               FieldByName('DESCALC').asString  := FieldByName('DESCRICAO').asString + ' - ' +
                                                   FieldByName('HISTORICOCOMPL').asString;
            end;
         end;
      end;

   end;

end;

// Felipe de Oliveira SOL 131922 - KTN 756226
// Monta a query e passa os valores como parâmetros para executar o calvulo dos totais e das porcentagens
procedure TdtmRelAdminImobCC.MontaQuerySegregacaoPorImovel( var ADataSet : TClientDataSet;iTipoSubRelatorio : Integer);
var
  //client data set criado em tempo de execução para trazer os dados a serem manipulados
  cdsTemp : TClientDataSet;
  Ctrl: TCmControlObject;
  iNumImov : integer;
  sSql : String;
begin
  cdsTemp := TClientDataSet.Create(nil);
  Ctrl := TCmControlObject.Create;
  try
     Ctrl.Initialize(dtmBaseDados.dbBaseDados,True,
       Sistema.ConnectionType,Sistema.ConnectionSide,
       Sistema.AppRemoteServer,True,ComunsImobiliario.MensErroMT);

     ADataSet.Data := Ctrl.GetDataPacket('SELECT '+
      '           ''                                                                    '' AS PATROCINADORA,'+
      '           ''                                                              ''AS PLANOPREV,'+
      '           0.00000 AS PERCENTRATEIO,'+
      '           0.00000 AS TOT_APAGAR,'+
      '           0.00000 AS TOT_PAGO,'+
      '           0.00000 AS TOT_ARECEBER,'+
      '           0.00000 AS TOT_RECEBIDO  '+
      '   FROM '+
      '           DUAL '+
      '   WHERE   1=2');

     sSql :=  'SELECT ' +
      '           PATRO.NOME AS PATROCINADORA, '+
      '           PLANO.NOME AS PLANOPREV, ' +
      '           PPI.PERCENTRATEIO, ' +
      '           0.00000 AS TOT_APAGAR,' +
      '           0.00000 AS TOT_PAGO,' +
      '           0.00000 AS TOT_ARECEBER,' +
      '           0.00000 AS TOT_RECEBIDO' +
      '   FROM' +
      '           PLANOPATROXVIGENCIAIMOB PPI, PESSOA PATRO, PLANPREVCONTABIL PLANO, IMOVEL I' +
      '   WHERE' +
      '           PLANO.IDPLANOPREV          = PPI.IDPLANOPREV' +
      '           AND PPI.DATAVIGENCIA       = (SELECT MAX (PPV.DATAVIGENCIA) FROM PLANOPATROXVIGENCIAIMOB PPV ';
      if dDataFinal <> 0 then
         sSql := sSql + '                                         WHERE PPV.DATAVIGENCIA <= '+ QuotedStr(DateToStr(dDataFinal))
      else
         sSql := sSql + '                                         WHERE PPV.DATAVIGENCIA <= '+ QuotedStr(DateToStr(qryCCImovelDATAVENCIMENTO.AsDateTime));
      sSql:= sSql + '                                           AND PPV.IDIMOVEL = '+ qryCCImovelIDIMOVEL.AsString + ')' +
      '           AND PATRO.IDPESSOA         = PPI.IDPATRO' +
      '           AND PPI.IDIMOVEL           = I.IDIMOVEL' +
      '           AND I.IDIMOVEL             = ' + qryCCImovelIDIMOVEL.AsString +
      '   ORDER BY PATROCINADORA, PLANOPREV';

     cdsTemp.Data := Ctrl.GetDataPacket(sSql);
     // verifica o número do subrelatório para assim passar os parâmetros
     //para se calcular totais, porcentagens e saldos
     case iTipoSubRelatorio of
        4: //total do imóvel
        begin
           MontaValor(ADataSet,cdsTemp, rptCCImovelDBCalc3.Value, rptCCImovelDBCalc4.Value,rptCCImovelDBCalc1.Value, rptCCImovelDBCalc2.Value);
           MontaPorcentagem(ADataSet,rptCCImovelDBCalc3.Value, rptCCImovelDBCalc4.Value,rptCCImovelDBCalc1.Value, rptCCImovelDBCalc2.Value,
                                       'TOT_APAGAR','TOT_PAGO','TOT_ARECEBER','TOT_RECEBIDO');
           //passa os valores dos totais para calcular a porcentagem do saldo caso o saldo seja 0
           totalPagar := rptCCImovelDBCalc3.Value;
           totalPago :=  rptCCImovelDBCalc4.Value;
           totalReceber := rptCCImovelDBCalc1.Value;
           totalRecebido := rptCCImovelDBCalc2.Value;
        end;
{        2: // total geral dos imóveis
        begin
           MontaValor(ADataSet,cdsTemp,ppDBCalc40.Value,ppDBCalc41.Value,ppDBCalc38.Value,ppDBCalc39.Value);
           if ppDBCalc40.Value <> 0 then
              MontaPorcentagem(ADataSet,ppDBCalc40.Value,'TOT_APAGAR')
           else
              MontaPorcentagem(ADataSet,ppDBCalc38.Value,'TOT_ARECEBER');
        end;
        3:// saldo geral por imóvel
        begin
           MontaValor(ADataSet,cdsTemp,ppDBCalc43.Value,0,ppDBCalc42.Value,0);
           if (ppDBCalc43.Value <> 0) then
              MontaPorcentagem(ADataSet,ppDBCalc43.Value,'TOT_APAGAR')
           else
              MontaPorcentagem(ADataSet,ppDBCalc42.Value,'TOT_ARECEBER');
        end;}
        5:// Saldo Imóvel
        begin
           MontaValor(ADataSet,cdsTemp,rptCCImovelDBCalc6.Value,0,rptCCImovelDBCalc5.Value,0);
           if ((rptCCImovelDBCalc6.Value > 0)and (ADataSet.FieldByName('TOT_APAGAR').AsFloat > 0))
              or ((rptCCImovelDBCalc5.Value > 0)and (ADataSet.FieldByName('TOT_ARECEBER').AsFloat > 0)) then
              MontaPorcentagem(ADataSet,rptCCImovelDBCalc6.Value,0,rptCCImovelDBCalc5.Value,0,
                                        'TOT_APAGAR','TOT_PAGO','TOT_ARECEBER','TOT_RECEBIDO')
           else
              MontaPorcentagemSaldo(ADataset,cdsTotalImovel,totalPagar,totalPago,totalReceber,totalRecebido,
                                         'TOT_APAGAR','TOT_PAGO','TOT_ARECEBER','TOT_RECEBIDO');
        end;// end case 5
     end;

  finally
    FreeAndNil(cdsTemp);
    Ctrl.Free;
  end;
end;

procedure TdtmRelAdminImobcc.MontaQuerySegregacaoPorImovelTotal( var ADataSet : TClientDataSet;
                          dTotalPagar, dTotalPago,dTotalReceber,dTotalRecebido : Currency; iTipoSubRelatorio : Integer);
var
  //client data set criado em tempo de execução para trazer os dados a serem manipulados
  cdsTemp : TClientDataSet;
  Ctrl : TCmControlObject;
  iNumImov : integer;
  sSql : String;
  dPercent : Double;
  // variáveis que irão receber o total de cada campo
  dPagar, dPago, dReceber, dRecebido: Currency;
  fvalor : double;
begin
  cdsTemp := TClientDataSet.Create(nil);
  Ctrl := TCmControlObject.Create;
  try
     iNumImov:= 1;
     Ctrl.Initialize(dtmBaseDados.dbBaseDados,True, Sistema.ConnectionType,Sistema.ConnectionSide,
                     Sistema.AppRemoteServer,True,ComunsImobiliario.MensErroMT);

     ADataSet.Data := Ctrl.GetDataPacket('SELECT '+
      '           ''                                                                    '' AS PATROCINADORA,'+
      '           ''                                                              ''AS PLANOPREV,'+
      '           0.00000 AS PPIPERCENTRATEIO,'+
      '           0.00000 AS PERCENTRATEIO,'+
      '           0.00000 AS TOT_APAGAR,'+
      '           0.00000 AS TOT_PAGO,'+
      '           0.00000 AS TOT_ARECEBER,'+
      '           0.00000 AS TOT_RECEBIDO,  '+
      '           0.00000 AS SALDO_PAGAR,' +
      '           0.00000 AS SALDO_RECEB  ' +
      '   FROM '+
      '           DUAL '+
      '   WHERE   1=2');

     qryCCImovel.First;
//     iNumImov := qryCCImovel.RecordCount;
     while not qryCCImovel.Eof do
     begin
         dPagar := 0;
         dPago := 0;
         dReceber := 0;
         dRecebido := 0;
         sSql :=  'SELECT ' +
          '           PATRO.NOME AS PATROCINADORA, '+
          '           PLANO.NOME AS PLANOPREV, ' +
          '           PPI.PERCENTRATEIO AS PPIPERCENTRATEIO, ' +
          '           0.00000 AS PERCENTRATEIO, ' +
          '           0.00000 AS TOT_APAGAR,' +
          '           0.00000 AS TOT_PAGO,' +
          '           0.00000 AS TOT_ARECEBER,' +
          '           0.00000 AS TOT_RECEBIDO,' +
          '           0.00000 AS SALDO_PAGAR,' +
          '           0.00000 AS SALDO_RECEB  ' +
          '   FROM' +
          '           PLANOPATROXVIGENCIAIMOB PPI, PESSOA PATRO, PLANPREVCONTABIL PLANO, IMOVEL I' +
          '   WHERE' +
          '           PLANO.IDPLANOPREV          = PPI.IDPLANOPREV' +
          '           AND PPI.DATAVIGENCIA       = (SELECT MAX (PPV.DATAVIGENCIA) FROM PLANOPATROXVIGENCIAIMOB PPV ';
          if dDataFinal <> 0 then
             sSql := sSql + '                                         WHERE PPV.DATAVIGENCIA <= '+ QuotedStr(DateToStr(dDataFinal))
          else
             sSql := sSql + '                                         WHERE PPV.DATAVIGENCIA <= '+ QuotedStr(DateToStr(qryCCImovelDATAVENCIMENTO.AsDateTime));
          sSql:= sSql + '                                           AND PPV.IDIMOVEL = '+ qryCCImovelIDIMOVEL.AsString + ')' +
          '           AND PATRO.IDPESSOA         = PPI.IDPATRO' +
          '           AND PPI.IDIMOVEL           = I.IDIMOVEL' +
          '           AND I.IDIMOVEL             = ' + qryCCImovelIDIMOVEL.AsString +
          '   ORDER BY PATROCINADORA, PLANOPREV';

      cdsTemp.Data := Ctrl.GetDataPacket(sSql);
        while not cdsTemp.Eof do
        begin
           if not ADataSet.Locate( 'PATROCINADORA;PLANOPREV', VarArrayOf( [
            cdsTemp.FieldByName( 'PATROCINADORA' ).Value,
            cdsTemp.FieldByName( 'PLANOPREV' ).Value
            ] ), [] ) then
           begin
              ADataSet.Append;
              ADataSet.FieldByName('PATROCINADORA').AsString :=cdsTemp.FieldByName('PATROCINADORA').AsString;
              ADataSet.FieldByName('PLANOPREV').AsString     :=cdsTemp.FieldByName('PLANOPREV').AsString;
              ADataSet.FieldByName('PERCENTRATEIO').AsFloat  := 0;
              ADataSet.FieldByName('PPIPERCENTRATEIO').AsFloat  := cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat;

              case iTipoSubRelatorio of
              2:
              begin
                  if cdsTemp.RecNo = cdsTemp.RecordCount then
                  begin
                    ADataSet.FieldByName('TOT_APAGAR').AsFloat  := qryCCImovel.FieldByName('TOT_PAGAR').AsFloat - dPagar;
                    ADataSet.FieldByName('TOT_PAGO').AsFloat  := qryCCImovel.FieldByName('TOT_PAGO').AsFloat - dPago;
                    ADataSet.FieldByName('TOT_ARECEBER').AsFloat  := qryCCImovel.FieldByName('TOT_RECEBER').AsFloat - dReceber;
                    ADataSet.FieldByName('TOT_RECEBIDO').AsFloat  := qryCCImovel.FieldByName('TOT_RECEBIDO').AsFloat - dRecebido;
                  end
                  else
                  begin
                    ADataSet.FieldByName('TOT_APAGAR').AsFloat  := (qryCCImovel.FieldByName('TOT_PAGAR').AsFloat *
                                                                  cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat)/100;
                    dPagar := dPagar + ADataSet.FieldByName('TOT_APAGAR').AsFloat;

                    ADataSet.FieldByName('TOT_PAGO').AsFloat  := (qryCCImovel.FieldByName('TOT_PAGO').AsFloat *
                                                                  cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat)/100;
                    dPago := dPago + ADataSet.FieldByName('TOT_PAGO').AsFloat;

                    ADataSet.FieldByName('TOT_ARECEBER').AsFloat  := (qryCCImovel.FieldByName('TOT_RECEBER').AsFloat *
                                                                  cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat)/100;
                    dReceber := dReceber + ADataSet.FieldByName('TOT_ARECEBER').AsFloat;

                    ADataSet.FieldByName('TOT_RECEBIDO').AsFloat  := (qryCCImovel.FieldByName('TOT_RECEBIDO').AsFloat *
                                                                  cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat)/100;
                    dRecebido := dRecebido + ADataSet.FieldByName('TOT_RECEBIDO').AsFloat;
                  end;
              end;// end case 2

              3:
              begin
                  if cdsTemp.RecNo = cdsTemp.RecordCount then
                  begin
                    ADataSet.FieldByName('SALDO_PAGAR').AsFloat  := qryCCImovel.FieldByName('SALDO_PAGAR').AsFloat - dPagar;
                    ADataSet.FieldByName('SALDO_RECEB').AsFloat  := qryCCImovel.FieldByName('SALDO_RECEB').AsFloat - dRecebido;
                  end
                  else
                  begin
                    ADataSet.FieldByName('SALDO_PAGAR').AsFloat  := (qryCCImovel.FieldByName('SALDO_PAGAR').AsFloat *
                                                                  cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat)/100;
                    dPagar := dPagar + ADataSet.FieldByName('SALDO_PAGAR').AsFloat;

                    ADataSet.FieldByName('SALDO_RECEB').AsFloat  := (qryCCImovel.FieldByName('SALDO_RECEB').AsFloat *
                                                                  cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat)/100;
                    dRecebido := dRecebido + ADataSet.FieldByName('SALDO_RECEB').AsFloat;
                  end;
              end;// end case 3

             end; // end case geral
           end// end locate
           else
           begin
              ADataSet.Edit;
              ADataSet.FieldByName('PPIPERCENTRATEIO').AsFloat := ADataSet.FieldByName('PPIPERCENTRATEIO').AsFloat +
                                                                (cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat);
              case iTipoSubRelatorio of
              2:
              begin
                  if cdsTemp.RecNo = cdsTemp.RecordCount then
                  begin
                    ADataSet.FieldByName('TOT_APAGAR').AsFloat  := ADataSet.FieldByName('TOT_APAGAR').AsFloat + (qryCCImovel.FieldByName('TOT_PAGAR').AsFloat - dPagar);
                    ADataSet.FieldByName('TOT_PAGO').AsFloat  := ADataSet.FieldByName('TOT_PAGO').AsFloat + (qryCCImovel.FieldByName('TOT_PAGO').AsFloat - dPago);
                    ADataSet.FieldByName('TOT_ARECEBER').AsFloat  := ADataSet.FieldByName('TOT_ARECEBER').AsFloat + (qryCCImovel.FieldByName('TOT_RECEBER').AsFloat - dReceber);
                    ADataSet.FieldByName('TOT_RECEBIDO').AsFloat  := ADataSet.FieldByName('TOT_RECEBIDO').AsFloat + (qryCCImovel.FieldByName('TOT_RECEBIDO').AsFloat - dRecebido);
                  end
                  else
                  begin
                    ADataSet.FieldByName('TOT_APAGAR').AsFloat  := ADataSet.FieldByName('TOT_APAGAR').AsFloat + (qryCCImovel.FieldByName('TOT_PAGAR').AsFloat *
                                                                  cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat)/100;
                    dPagar := dPagar + (qryCCImovel.FieldByName('TOT_PAGAR').AsFloat *
                                                                  cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat)/100;

                    ADataSet.FieldByName('TOT_PAGO').AsFloat  := ADataSet.FieldByName('TOT_PAGO').AsFloat + (qryCCImovel.FieldByName('TOT_PAGO').AsFloat *
                                                                  cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat)/100;
                    dPago := dPago + (qryCCImovel.FieldByName('TOT_PAGO').AsFloat *
                                                                  cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat)/100;

                    ADataSet.FieldByName('TOT_ARECEBER').AsFloat  := ADataSet.FieldByName('TOT_ARECEBER').AsFloat + (qryCCImovel.FieldByName('TOT_RECEBER').AsFloat *
                                                                  cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat)/100;
                    dReceber := dReceber + (qryCCImovel.FieldByName('TOT_RECEBER').AsFloat *
                                                                  cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat)/100;

                    ADataSet.FieldByName('TOT_RECEBIDO').AsFloat  := ADataSet.FieldByName('TOT_RECEBIDO').AsFloat + (qryCCImovel.FieldByName('TOT_RECEBIDO').AsFloat *
                                                                  cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat)/100;
                    dRecebido := dRecebido + (qryCCImovel.FieldByName('TOT_RECEBIDO').AsFloat *
                                                                  cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat)/100;
                  end;
              end;// end case 2

              3:
              begin
                  if cdsTemp.RecNo = cdsTemp.RecordCount then
                  begin
                    ADataSet.FieldByName('SALDO_PAGAR').AsFloat:= ADataSet.FieldByName('SALDO_PAGAR').AsFloat + (qryCCImovel.FieldByName('SALDO_PAGAR').AsFloat - dPagar);
//                    if (Abs(RoundCM(ADataSet.FieldByName('SALDO_PAGAR').AsFloat,3)) <= 0.006)  and (iNumImov = qryCCImovel.RecordCount  )  then
//                       ADataSet.FieldByName('SALDO_PAGAR').AsFloat  := 0.00;

                       ADataSet.FieldByName('SALDO_RECEB').AsFloat  := ADataSet.FieldByName('SALDO_RECEB').AsFloat + (qryCCImovel.FieldByName('SALDO_RECEB').AsFloat - dReceber);
                  end
                  else
                  begin
                    ADataSet.FieldByName('SALDO_PAGAR').AsFloat  := ADataSet.FieldByName('SALDO_PAGAR').AsFloat + (qryCCImovel.FieldByName('SALDO_PAGAR').AsFloat *
                                                                  cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat)/100;
                    dPagar := dPagar + (qryCCImovel.FieldByName('SALDO_PAGAR').AsFloat *
                                                                  cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat)/100;

                    ADataSet.FieldByName('SALDO_RECEB').AsFloat  := ADataSet.FieldByName('SALDO_RECEB').AsFloat + (qryCCImovel.FieldByName('SALDO_RECEB').AsFloat *
                                                                  cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat)/100;
                    dReceber := dReceber + (qryCCImovel.FieldByName('SALDO_RECEB').AsFloat *
                                                                  cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat)/100;
                 end;
              end;// end case 3
            end; // end case geral
          end;
          totalPagar := ppDBCalc40.Value;
          totalReceber := ppDBCalc38.Value;
          ADataSet.Post;
          cdsTemp.Next;
        end; // end while  not cdsTemp.Eof do
     Inc(iNumImov);
     qryCCImovel.Next;
     end;// end while

    case iTipoSubRelatorio of
      2:
      begin
        MontaPorcentagem(ADataSet,dTotalPagar,dTotalPago,dTotalReceber,dTotalRecebido,
                                  'TOT_APAGAR','TOT_PAGO','TOT_ARECEBER','TOT_RECEBIDO');
      end;// end case 2
      3:
      begin
        if ((dTotalPagar > 0) and (ADataSet.FieldByName('SALDO_PAGAR').AsFloat > 0))
           or ((dTotalReceber > 0)and (ADataSet.FieldByName('SALDO_RECEB').AsFloat > 0)) then
           MontaPorcentagem(ADataSet,dTotalPagar,0,dTotalReceber,0,
                                    'SALDO_PAGAR','TOT_APAGAR','SALDO_RECEB','TOT_APAGAR')
        else
           MontaPorcentagemSaldo(ADataset,cdsTotalGeral,totalPagar,totalPago,totalReceber,totalRecebido,
                                                        'TOT_APAGAR','TOT_PAGO','TOT_ARECEBER','TOT_RECEBIDO');
      end;// end case 3
    end; // end case geral


    {ADataSet.First;
    while not ADataSet.Eof do
    begin
      ADataSet.Edit;
      ADataSet.FieldByName('PPIPERCENTRATEIO').asFloat := RoundCM(ADataSet.FieldByName('PPIPERCENTRATEIO').asFloat/iNumImov,2);
      ADataSet.Post;
      ADataSet.Next;
    end;}


    {ADataSet.First;
    while not ADataSet.Eof do
    begin
      ADataSet.Edit;
      if ADataSet.RecNo = ADataSet.RecordCount then
      begin
        // caso for o ultimo registro atribui a diferença ao campo
        ADataSet.FieldByName('TOT_APAGAR').asFloat := dTotalPagar - dPagar;
        ADataSet.FieldByName('TOT_PAGO').AsFloat  := dTotalPago - dPago;
        ADataSet.FieldByName('TOT_ARECEBER').AsFloat  := dTotalReceber - dReceber;
        ADataSet.FieldByName('TOT_RECEBIDO').AsFloat  := dTotalRecebido - dRecebido;}

{        if dPercent <= 0 then
          ADataSet.FieldByName('PERCENTRATEIO').AsFloat := 0
        else
          ADataSet.FieldByName('PERCENTRATEIO').AsFloat := 100 - dPercent;}
      {end
      else
      begin
        // calcula o valor dos totais
        ADataSet.FieldByName('TOT_APAGAR').AsFloat := RoundCM((dTotalPagar *
                            ADataSet.FieldByName('PPIPERCENTRATEIO').AsFloat)/100,2);
        ADataSet.FieldByName('TOT_PAGO').AsFloat := RoundCM((dTotalPago *
                            ADataSet.FieldByName('PPIPERCENTRATEIO').AsFloat)/100,2);
        ADataSet.FieldByName('TOT_ARECEBER').AsFloat := RoundCM((dTotalReceber *
                            ADataSet.FieldByName('PPIPERCENTRATEIO').AsFloat)/100,2);
        ADataSet.FieldByName('TOT_RECEBIDO').AsFloat := RoundCM((dTotalRecebido *
                            ADataSet.FieldByName('PPIPERCENTRATEIO').AsFloat)/100,2);
        // somando os valores dos totais
        dPagar := dPagar + ADataSet.FieldByName('TOT_APAGAR').AsFloat;
        dPago := dPago + ADataSet.FieldByName('TOT_PAGO').AsFloat;
        dReceber := dReceber + ADataSet.FieldByName('TOT_ARECEBER').AsFloat;
        dRecebido := dRecebido + ADataSet.FieldByName('TOT_RECEBIDO').AsFloat;
       //calculando a porcentagem
        ADataSet.FieldByName('PERCENTRATEIO').AsFloat := RoundCM((ADataSet.FieldByName('TOT_APAGAR').AsFloat * 100)/
                                                       dTotalPagar, 2);
        end;

        dPercent := dPercent + ADataSet.FieldByName('PERCENTRATEIO').AsFloat;
      end;
      ADataSet.Post;
      ADataSet.Next;
    end; }


  finally
    FreeAndNil(cdsTemp);
    Ctrl.Free;
  end;
end;

procedure TdtmRelAdminImobCC.MontaValor(var DatasetCDS,DataSetTemp : TClientDataSet;
                          dTotalPagar, dTotalPago,dTotalReceber,dTotalRecebido : Currency);
var
  // variáveis que irão receber o total de cada campo
  dPagar, dPago, dReceber, dRecebido: Double;
begin
      // zerando as variáveis toda vez que se passar para a próxima linha da query
      dPagar := 0;
      dPago := 0;
      dReceber := 0;
      dRecebido := 0;

      while not DataSetTemp.Eof do
      begin
         if not DatasetCDS.Locate( 'PATROCINADORA;PLANOPREV', VarArrayOf( [
          DataSetTemp.FieldByName( 'PATROCINADORA' ).Value,
          DataSetTemp.FieldByName( 'PLANOPREV' ).Value
          ] ), [] ) then
         begin
            DatasetCDS.Append;
            if DataSetTemp.RecNo = DataSetTemp.RecordCount then
            begin
               DatasetCDS.FieldByName('TOT_APAGAR').AsFloat   := dTotalPagar - dPagar;
               DatasetCDS.FieldByName('TOT_PAGO').AsFloat     := dTotalPago - dPago;
               DatasetCDS.FieldByName('TOT_ARECEBER').AsFloat := dTotalReceber - dReceber;
               DatasetCDS.FieldByName('TOT_RECEBIDO').AsFloat := dTotalRecebido - dRecebido;
            end
            else
            begin
               DatasetCDS.FieldByName('TOT_APAGAR').AsFloat   := (DataSetTemp.FieldByName('PERCENTRATEIO').AsFloat * dTotalPagar) / 100;
               DatasetCDS.FieldByName('TOT_PAGO').AsFloat     := (DataSetTemp.FieldByName('PERCENTRATEIO').AsFloat * dTotalPago) / 100;
               DatasetCDS.FieldByName('TOT_ARECEBER').AsFloat := (DataSetTemp.FieldByName('PERCENTRATEIO').AsFloat  * dTotalReceber)/ 100;
               DatasetCDS.FieldByName('TOT_RECEBIDO').AsFloat := (DataSetTemp.FieldByName('PERCENTRATEIO').AsFloat * dTotalRecebido)/ 100 ;
            end;

            DatasetCDS.FieldByName('PATROCINADORA').AsString :=DataSetTemp.FieldByName('PATROCINADORA').AsString;
            DatasetCDS.FieldByName('PLANOPREV').AsString     :=DataSetTemp.FieldByName('PLANOPREV').AsString;
            DatasetCDS.FieldByName('PERCENTRATEIO').AsFloat  := DataSetTemp.FieldByName('PERCENTRATEIO').AsFloat;

            dPagar := dPagar + DatasetCDS.FieldByName('TOT_APAGAR').AsFloat;
            dPago := dPago + DatasetCDS.FieldByName('TOT_PAGO').AsFloat;
            dReceber := dReceber + DatasetCDS.FieldByName('TOT_ARECEBER').AsFloat;
            dRecebido := dRecebido + DatasetCDS.FieldByName('TOT_RECEBIDO').AsFloat;
         end // end locate
         else
         begin
           DatasetCDS.Edit;
           if DataSetTemp.RecNo = DataSetTemp.RecordCount then
           begin
              DatasetCDS.FieldByName('TOT_APAGAR').AsFloat := DatasetCDS.FieldByName('TOT_APAGAR').asFloat +
                                   (dTotalPagar - dPagar);
              DatasetCDS.FieldByName('TOT_PAGO').asFloat := DatasetCDS.FieldByName('TOT_PAGO').asFloat+
                                    (dTotalPago - dPago);
              DatasetCDS.FieldByName('TOT_ARECEBER').asFloat := DatasetCDS.FieldByName('TOT_ARECEBER').asFloat+
                                    (dTotalReceber - dReceber);
              DatasetCDS.FieldByName('TOT_RECEBIDO').asFloat := DatasetCDS.FieldByName('TOT_RECEBIDO').asFloat+
                                    (dTotalRecebido - dRecebido);
           end
           else
           begin
              DatasetCDS.FieldByName('TOT_APAGAR').asFloat := DatasetCDS.FieldByName('TOT_APAGAR').asFloat +
                                   (dTotalPagar * DataSetTemp.FieldByName('PERCENTRATEIO').Asfloat / 100) ;
              DatasetCDS.FieldByName('TOT_PAGO').asFloat := DatasetCDS.FieldByName('TOT_PAGO').asFloat+
                                    (dTotalPago * DataSetTemp.FieldByName('PERCENTRATEIO').Asfloat / 100) ;
              DatasetCDS.FieldByName('TOT_ARECEBER').asFloat := DatasetCDS.FieldByName('TOT_ARECEBER').asFloat+
                                    (dTotalReceber * DataSetTemp.FieldByName('PERCENTRATEIO').Asfloat / 100) ;
              DatasetCDS.FieldByName('TOT_RECEBIDO').asFloat := DatasetCDS.FieldByName('TOT_RECEBIDO').asFloat+
                                    (dTotalRecebido * DataSetTemp.FieldByName('PERCENTRATEIO').Asfloat / 100) ;
           end;

           dPagar := dPagar + dTotalPagar * DataSetTemp.FieldByName('PERCENTRATEIO').Asfloat / 100;
           dPago := dPago + dTotalPago * DataSetTemp.FieldByName('PERCENTRATEIO').Asfloat / 100;
           dReceber := dReceber + dTotalReceber * DataSetTemp.FieldByName('PERCENTRATEIO').Asfloat / 100;
           dRecebido := dRecebido + dTotalRecebido * DataSetTemp.FieldByName('PERCENTRATEIO').Asfloat / 100;
         end;
         DatasetCDS.Post;
         DataSetTemp.Next;
      end;// end while cdsTemp
end;

procedure TdtmRelAdminImobCC.MontaPorcentagem(var DatasetCDS : TClientDataSet; dTotalPagar,dTotalPago,dTotalReceber,dTotalRecebido : Currency ;
                                                              sCampo1,sCampo2,sCampo3,sCampo4 : String);
var
  dPercent, fValor : Double;
begin
    dPercent:= 0;
    DatasetCDS.First;
    fvalor := dTotalPagar + dTotalPago + dTotalReceber + dTotalRecebido;
    while not DatasetCDS.Eof do
    begin
       DatasetCDS.Edit;
       if DatasetCDS.RecNo = DatasetCDS.RecordCount then
       begin
          if dPercent <= 0 then
             DatasetCDS.FieldByName('PERCENTRATEIO').AsFloat := 0
          else
             DatasetCDS.FieldByName('PERCENTRATEIO').AsFloat := 100 - dPercent;
       end
       else
       begin
          if fValor = 0 then
             fValor := 1;
          DatasetCDS.FieldByName('PERCENTRATEIO').AsFloat := (((DatasetCDS.FieldByName(sCampo1).asFloat + DatasetCDS.FieldByName(sCampo2).asFloat+
                                           DatasetCDS.FieldByName(sCampo3).asFloat + DatasetCDS.FieldByName(sCampo4).asFloat) * 100) / fValor);
          dPercent := dPercent + DatasetCDS.FieldByName('PERCENTRATEIO').AsFloat;
       end;
       DatasetCDS.Post;
       DatasetCDS.Next;
    end;
end;

procedure TdtmRelAdminImobCC.MontaPorcentagemSaldo(var DatasetSaldo : TClientDataSet;  DatasetImovel: TClientDataSet; dTotalPagar,dTotalPago,dTotalReceber,dTotalRecebido : Currency ;
                                                               sCampo1,sCampo2,sCampo3,sCampo4 : String);
var
  dPercent, fValor : Double;

begin
    dPercent:= 0;
    fvalor := dTotalPagar + dTotalPago + dTotalReceber + dTotalRecebido;
    DatasetSaldo.First;
    DatasetImovel.First;
    while not DatasetSaldo.Eof do
    begin
       DatasetSaldo.Edit;
       if DatasetSaldo.RecNo = DatasetSaldo.RecordCount then
       begin
          if dPercent <= 0 then
             DatasetSaldo.FieldByName('PERCENTRATEIO').AsFloat := 0
          else
             DatasetSaldo.FieldByName('PERCENTRATEIO').AsFloat := 100 - dPercent;
       end
       else
       begin
          DatasetSaldo.FieldByName('PERCENTRATEIO').AsFloat :=(((DatasetImovel.FieldByName(sCampo1).asFloat + DatasetImovel.FieldByName(sCampo2).asFloat+
                                           DatasetImovel.FieldByName(sCampo3).asFloat + DatasetImovel.FieldByName(sCampo4).asFloat) * 100) / fValor);
          dPercent := dPercent + DatasetSaldo.FieldByName('PERCENTRATEIO').AsFloat;
       end;
       DatasetSaldo.Post;
       DatasetSaldo.Next;
       DatasetImovel.Next;
    end;
end;

// Felipe de Oliveira SOL 131922 - KTN 756226
{procedure TdtmRelAdminImobCC.MontaQuerySegregacaoImovelTotal;
var
  cdsTemp : TClientDataSet;
  Ctrl: TCmControlObject;
begin
  cdsTemp := TClientDataSet.Create(nil);
  Ctrl := TCmControlObject.Create;
  try
    Ctrl.Initialize(
          dtmBaseDados.dbBaseDados,
          True,
          Sistema.ConnectionType,
          Sistema.ConnectionSide,
          Sistema.AppRemoteServer,
          True
          );
    cdsTemp.Data := Ctrl.GetDataPacket( 'SELECT ' +
      '           PATRO.NOME AS PATROCINADORA, '+
      '           PLANO.NOME AS PLANOPREV, ' +
      '           PPI.PERCENTRATEIO,' +
      '           0.00000 AS TOT_APAGAR,' +
      '           0.00000 AS TOT_PAGO,' +
      '           0.00000 AS TOT_ARECEBER,' +
      '           0.00000 AS TOT_RECEBIDO' +
      '   FROM' +
      '           PLANOPATROXVIGENCIAIMOB PPI, PESSOA PATRO, PLANPREVCONTABIL PLANO, IMOVEL I' +
      '   WHERE' +
      '           PLANO.IDPLANOPREV          = PPI.IDPLANOPREV' +
      '           AND PATRO.IDPESSOA         = PPI.IDPATRO' +
      '           AND PPI.IDIMOVEL           = I.IDIMOVEL' +
      '   ORDER BY PATROCINADORA, PLANOPREV');
  finally
    Ctrl.Free;
  end;
  // FIM SOL 126315 KTN 660053 Ricardo A.
end;}

procedure TdtmRelAdminImobCC.ppSubReport4Print(Sender: TObject);
begin
  inherited;
  MontaQuerySegregacaoPorImovel(cdsTotalImovel,4);
end;

procedure TdtmRelAdminImobCC.ppSubReport5Print(Sender: TObject);
var
  curAPagar, curAReceber: Currency;
begin
  inherited;
  MontaQuerySegregacaoPorImovel(cdsSaldoImovel,5);
{  curAPagar := 0;
  curAReceber := 0;
  cdsSaldoImovel.First;
  while not cdsSaldoImovel.Eof do
  begin
    cdsSaldoImovel.Edit;
    if cdsSaldoImovel.RecNo = cdsSaldoImovel.RecordCount then
    begin
      cdsSaldoImovelTOT_APAGAR.AsFloat := rptCCImovelDBCalc6.AsFloat - curAPagar;
      cdsSaldoImovelTOT_ARECEBER.AsFloat := rptCCImovelDBCalc5.AsFloat - curAReceber;
    end
    else
    begin
      cdsSaldoImovelTOT_APAGAR.AsFloat := ComunsImobiliario.Arredonda(
        cdsSaldoImovelPERCENTRATEIO.AsFloat / 100 * rptCCImovelDBCalc6.AsFloat, 2 );
      cdsSaldoImovelTOT_ARECEBER.AsFloat := ComunsImobiliario.Arredonda(
        cdsSaldoImovelPERCENTRATEIO.AsFloat / 100 * rptCCImovelDBCalc5.AsFloat, 2 );
    end;
    cdsSaldoImovel.Post;

    curAPagar := curAPagar + cdsSaldoImovelTOT_APAGAR.AsFloat;
    curAReceber := curAReceber + cdsSaldoImovelTOT_ARECEBER.AsFloat;

    cdsSaldoImovel.Next;
  end;}
end;

procedure TdtmRelAdminImobCC.ppSubReport2Print(Sender: TObject);
begin
  inherited;
  MontaQuerySegregacaoPorImovelTotal(cdsTotalGeral,ppDBCalc40.Value,ppDBCalc41.Value,ppDBCalc38.Value,ppDBCalc39.Value,2);
end;

procedure TdtmRelAdminImobCC.ppSubReport3Print(Sender: TObject);
begin
  inherited;
  MontaQuerySegregacaoPorImovelTotal(cdsSaldoGeral,ppDBCalc43.Value,0,ppDBCalc42.Value,0,3);
end;


procedure TdtmRelAdminImobCC.MontaQuerySegregacao(sCodTipImovel:string; iIdPatro,
  iIdPlanoPrev, iIDImovel: integer);
var
  sSQL, sParam, sParam2 : string;
  Ctrl : TCmControlObject;
  cdsTemp, cdsTemp2 : TCMClientDataSet;
  fValorPlano : double;
  iNumImovel :  integer;
begin
  sParam := '';
  sParam2 := '';
  Ctrl := TCmControlObject.Create;
  Ctrl.Initialize(dtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                   Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  cdsTemp := TCMClientDataSet.Create(nil);
  cdsTemp2 := TCMClientDataSet.Create(nil);

  try
    if (iIdPatro <> -1) or (iIdPlanoPrev <> -1) then
    begin
      sParam := '  AND EXISTS (SELECT 1 ' + #13 +
                            '               FROM PLANOPATROXVIGENCIAIMOB PPI, ' + #13 +
                            '                    IMOVEL IM   ' + #13 +
                            '              WHERE IM.IDIMOVEL = PPI.IDIMOVEL ';
      if iIdPatro <> -1 then
      sParam := sParam + ' AND PPI.IDPATRO = ' + IntToStr(iIdPatro)   +#13;

      if (iIdPlanoPrev <> -1) then
        sParam := sParam +  'AND PPI.IDPLANOPREV = '+ IntToStr(iIdPlanoPrev);
      sParam := sParam + ')';
    end;

    if iIDImovel > 0 then
      sParam2 := ' AND IM.IDIMOVEL = ' + IntToStr(iIDImovel);

    cdsInadimplencia.Data := Ctrl.GetDataPacket('SELECT ''                         '' AS PATRO, ' +
                                                '       ''                                                              '' AS PLANOPREV, ' +
                                                '       0.00 AS PERCENTRATEIO, '  +
                                                '       0.00 AS VALOR, ' +
                                                '       ''        '' AS DESCTIPOIMOVEL ' +
                                                '  FROM DUAL ' +
                                                ' WHERE 1 = 2 ');

    sSQL := qryInadimplenciaImovel.SQL.GetText;
    cdsTemp2.Data := Ctrl.GetDataPacket(sSQL);
    cdsTemp2.Filtered := True;
    cdsTemp2.Filter := 'CODTIPIMOVEL = ' + QuotedStr(sCodTipImovel);

    {sSQL := 'SELECT COUNT(IM.IDIMOVEL) AS TOTIMOVEL FROM IMOVEL IM WHERE IM.CODTIPIMOVEL = ' + QuotedStr(sCodTipImovel) + sParam2;
    cdsTemp.Data := Ctrl.GetDataPacket(sSQL);}
    iNumImovel := cdsTemp2.RecordCount;
    while not cdsTemp2.Eof do
    begin
      fValorPlano := 0;
      sSQL := 'SELECT IM.IDIMOVEL, ' +#13+
              '       PES.NOME AS PATRO, '  + #13 +
              '       PPC.NOME AS PLANOPREV, ' + #13 +
              '       PPI.PERCENTRATEIO AS PPIPERCENTRATEIO, ' + #13 +
              '       T.DESCTIPOIMOVEL, ' + #13 +
              '       0 AS VALOR, ' + #13 +
              '       0 AS PERCENTRATEIO ' + #13 +
              '  FROM PLANOPATROXVIGENCIAIMOB PPI, ' + #13 +
              '       PESSOA            PES, ' + #13 +
              '       PLANPREVCONTABIL  PPC, ' + #13 +
              '       IMOVEL            IM, ' + #13 +
              '       TIPOIMOVEL        T ' + #13 +
              //' WHERE T.CODTIPIMOVEL = ' + QuotedStr(sCodTipImovel) + #13 +
              ' WHERE IM.IDIMOVEL = ' + cdsTemp2.FieldByName('IDIMOVEL').asString +#13+
              '   AND PPI.IDIMOVEL = IM.IDIMOVEL ' + #13 +
              '   AND PPI.IDPATRO = PES.IDPESSOA ' + #13 +
              '   AND PPI.IDPLANOPREV = PPC.IDPLANOPREV ' + #13 +
              '   AND IM.CODTIPIMOVEL = T.CODTIPIMOVEL ' + #13 +
              '   AND PPI.DATAVIGENCIA = (SELECT MAX(DATAVIGENCIA) AS DATAVIGENCIA ' + #13 +
              '                            FROM PLANOPATROXVIGENCIAIMOB ' + #13 +
              '                           WHERE IDIMOVEL = IM.IDIMOVEL '  + #13 +
              '                             AND DATAVIGENCIA <= ' + QuotedStr(rptInadimplenciaImovellblDataAtualiza1.Caption)+')' + #13 +
              sParam +
              sParam2 +
              ' ORDER BY IM.IDIMOVEL, PPI.IDPLANOPREV '; 

      cdsTemp.Data := Ctrl.GetDataPacket(sSQL);
      
      while not cdsTemp.Eof do
      begin
        if not cdsInadimplencia.Locate('PLANOPREV', VarArrayOf([
                                        cdsTemp.FieldByName('PLANOPREV').Value]), []) then
        begin
          cdsInadimplencia.Append;
          cdsInadimplencia.FieldByName('DESCTIPOIMOVEL').Value := cdsTemp.FieldByName('DESCTIPOIMOVEL').Value;
          cdsInadimplencia.FieldByName('PATRO').Value := cdsTemp.FieldByName('PATRO').Value;
          cdsInadimplencia.FieldByName('PLANOPREV').Value := cdsTemp.FieldByName('PLANOPREV').Value;
          cdsInadimplencia.FieldByName('PERCENTRATEIO').Value := 0;

          if cdsTemp.RecNo = cdsTemp.RecordCount then
            cdsInadimplencia.FieldByName('VALOR').asFloat := cdsTemp2.FieldByName('TOT_RECEBER').Value - fValorPlano
          else
          begin
            cdsInadimplencia.FieldByName('VALOR').asFloat := RoundCM((cdsTemp2.FieldByName('TOT_RECEBER').Value *
                    cdsTemp.FieldByName('PPIPERCENTRATEIO').Value)/100, 2);
            fValorPlano := fValorPlano + cdsInadimplencia.FieldByName('VALOR').asFloat;
          end;
        end
        else
        begin
          cdsInadimplencia.Edit;
          if cdsTemp.RecNo = cdsTemp.RecordCount then
            cdsInadimplencia.FieldByName('VALOR').asFloat := cdsInadimplencia.FieldByName('VALOR').asFloat + (cdsTemp2.FieldByName('TOT_RECEBER').Value - fValorPlano)
          else
          begin
            cdsInadimplencia.FieldByName('VALOR').asFloat := cdsInadimplencia.FieldByName('VALOR').asFloat + RoundCM((cdsTemp2.FieldByName('TOT_RECEBER').Value *
                    cdsTemp.FieldByName('PPIPERCENTRATEIO').Value)/100, 2);
            fValorPlano := fValorPlano + RoundCM((cdsTemp2.FieldByName('TOT_RECEBER').Value *
                    cdsTemp.FieldByName('PPIPERCENTRATEIO').Value)/100, 2);
          end;
        end;
        cdsInadimplencia.Post;
        cdsTemp.Next;
      end;
      cdsTemp2.Next;
    end;

    {cdsInadimplencia.First;
    while not cdsInadimplencia.Eof do
    begin
      cdsInadimplencia.Edit;
      cdsInadimplencia.FieldByName('PPIPERCENTRATEIO').asFloat := RoundCM(cdsInadimplencia.FieldByName('PPIPERCENTRATEIO').asFloat / iNumImovel, 2);
      cdsInadimplencia.Post;
      cdsInadimplencia.Next;
    end; }
  finally
    FreeAndNil(Ctrl);
    FreeANdNil(cdsTemp);
    FreeANdNil(cdsTemp2);
  end;
end;


procedure TdtmRelAdminImobCC.ppSubReport7Print(Sender: TObject);
var
  fValorPlano, fPercent : Currency;
begin
  inherited;
  fValorPlano := 0;
  fPercent := 0;

  MontaQuerySegregacao(qryInadimplenciaImovel.FieldByName( 'CODTIPIMOVEL' ).AsString, sPatro, sPlano, iIdImovel);

  cdsInadimplencia.First;
  while not cdsInadimplencia.Eof do
  begin
    cdsInadimplencia.Edit;
    if cdsInadimplencia.RecNo = cdsInadimplencia.RecordCount then
    begin
      //cdsInadimplencia.FieldByName('VALOR').asFloat := ppDBCalc13.Value - fValorPlano;

      if fPercent <= 0 then
        cdsInadimplenciaPERCENTRATEIO.Value := 0
      else
        cdsInadimplenciaPERCENTRATEIO.Value := 100 - fPercent;
    end
    else
    begin
      //cdsInadimplencia.FieldByName('VALOR').asFloat := RoundCM((ppDBCalc13.Value *
      //              cdsInadimplencia.FieldByName('PPIPERCENTRATEIO').Value)/100, 2);

      //fValorPlano := fValorPlano + cdsInadimplencia.FieldByName('VALOR').asFloat;

      cdsInadimplenciaPERCENTRATEIO.asFloat := RoundCM((cdsInadimplenciaVALOR.AsFloat * 100) /
                                                        ppDBCalc13.Value, 2);
      fPercent := fPercent + cdsInadimplenciaPERCENTRATEIO.asFloat;
    end;
    cdsInadimplencia.Post;
    cdsInadimplencia.Next;
  end;

  {cdsInadimplencia.First;
  while not cdsInadimplencia.Eof do
  begin
    cdsInadimplencia.Edit;
    if cdsInadimplencia.RecNo = cdsInadimplencia.RecordCount then
    begin
      if fPercent <= 0 then
        cdsInadimplenciaPERCENTRATEIO.Value := 0
      else
        cdsInadimplenciaPERCENTRATEIO.Value := 100 - fPercent;
    end
    else
    begin
      cdsInadimplenciaPERCENTRATEIO.asFloat := RoundCM((cdsInadimplenciaVALOR.AsFloat * 100) /
                                                        ppDBCalc13.Value, 2);
      fPercent := fPercent + cdsInadimplenciaPERCENTRATEIO.asFloat;
    end;
    cdsInadimplencia.Post;
    cdsInadimplencia.Next;
  end; }
end;

procedure TdtmRelAdminImobCC.ppSubReport6Print(Sender: TObject);
var
  sSQL, sParam : string;
  Ctrl : TCmControlObject;
  cdsTemp : TCMClientDataSet;
  fValorPlano, dPercent : double;
  iNumImov : integer;
begin
  inherited;
  iNumImov := 0;
  Ctrl := TCmControlObject.Create;
  Ctrl.Initialize(dtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                   Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  cdsTemp := TCMClientDataSet.Create(nil);
  dPercent := 0;

  try
    cdsTotal.Data := Ctrl.GetDataPacket('SELECT ''                                               ''  AS PATRO, ' +
                                       '       ''                                                                      '' AS PLANOPREV, ' +
                                       '       0.00  AS PERCENTRATEIO, ' +
                                       '       0.00  AS VALOR ' +
                                       '  FROM DUAL ' +
                                       ' WHERE 1 = 2 ');
    qryInadimplenciaImovel.First;
    iNumImov := qryInadimplenciaImovel.RecordCount;
    
    while not qryInadimplenciaImovel.Eof do
    begin
      fValorPlano := 0;
      sSQL := 'SELECT IM.IDIMOVEL, ' +#13+
              '       PES.NOME AS PATRO, ' +#13+
              '       PPC.NOME AS PLANOPREV, ' +#13+
              '       PPI.PERCENTRATEIO AS PPIPERCENTRATEIO, ' +#13+
              '       0 AS VALOR, ' +#13+
              '       0 AS PERCENTRATEIO ' +#13+
              '  FROM PLANOPATROXVIGENCIAIMOB PPI, ' +#13+
              '       PESSOA            PES, ' +#13+
              '       PLANPREVCONTABIL  PPC, ' +#13+
              '       IMOVEL            IM ' +#13+
              ' WHERE im.idimovel = ' + qryInadimplenciaImovelIDIMOVEL.asString +#13+
              '   AND PPI.IDIMOVEL = IM.IDIMOVEL ' +#13+
              '   AND PPI.IDPATRO = PES.IDPESSOA ' +#13+
              '   AND PPI.IDPLANOPREV = PPC.IDPLANOPREV ' +#13+
              '   AND PPI.DATAVIGENCIA = (SELECT MAX(DATAVIGENCIA) AS DATAVIGENCIA ' +#13+
              '                             FROM PLANOPATROXVIGENCIAIMOB ' +#13+
              '                            WHERE IDIMOVEL = IM.IDIMOVEL ' +#13+
              '                              AND DATAVIGENCIA <= '+ QuotedStr(rptInadimplenciaImovellblDataAtualiza1.Caption)+')' +#13+
              ' ORDER BY PPI.IDPLANOPREV  ';
      cdsTemp.Data := Ctrl.GetDataPacket(sSQL);
      while not cdsTemp.Eof do
      begin
        if not cdsTotal.Locate('PLANOPREV', VarArrayOf([
                              cdsTemp.FieldByName('PLANOPREV').Value]), []) then
        begin
          cdsTotal.Append;
          cdsTotal.FieldByName('PATRO').Value := cdsTemp.FieldByName('PATRO').Value;
          cdsTotal.FieldByName('PLANOPREV').Value := cdsTemp.FieldByName('PLANOPREV').Value;
          cdsTotal.FieldByName('PERCENTRATEIO').Value := 0;
          if cdsTemp.RecNo = cdsTemp.RecordCount then
            cdsTotal.FieldByName('VALOR').asFloat := qryInadimplenciaImovel.FieldByName('TOT_RECEBER').Value - fValorPlano
          else
          begin
            cdsTotal.FieldByName('VALOR').asFloat := RoundCM((qryInadimplenciaImovel.FieldByName('TOT_RECEBER').Value *
                    cdsTemp.FieldByName('PPIPERCENTRATEIO').Value)/100, 2);
            fValorPlano := fValorPlano + cdsTotal.FieldByName('VALOR').asFloat;
          end;
        end
        else
        begin
          cdsTotal.Edit;
          if cdsTemp.RecNo = cdsTemp.RecordCount then
            cdsTotal.FieldByName('VALOR').asFloat := cdsTotal.FieldByName('VALOR').asFloat + (qryInadimplenciaImovel.FieldByName('TOT_RECEBER').Value - fValorPlano)
          else
          begin
            cdsTotal.FieldByName('VALOR').asFloat := cdsTotal.FieldByName('VALOR').asFloat + RoundCM((qryInadimplenciaImovel.FieldByName('TOT_RECEBER').Value *
                    cdsTemp.FieldByName('PPIPERCENTRATEIO').Value)/100, 2);
            fValorPlano := fValorPlano + RoundCM((qryInadimplenciaImovel.FieldByName('TOT_RECEBER').Value *
                    cdsTemp.FieldByName('PPIPERCENTRATEIO').Value)/100, 2);
          end;
        end;
        cdsTotal.Post;
        cdsTemp.Next;
      end;
      qryInadimplenciaImovel.Next;
    end;

    {cdsTotal.First;
    while not cdsTotal.Eof do
    begin
      cdsTotal.Edit;
      cdsTotal.FieldByName('PPIPERCENTRATEIO').asFloat := RoundCM(cdsTotal.FieldByName('PPIPERCENTRATEIO').asFloat/iNumImov,2);
      cdsTotal.Post;
      cdsTotal.Next;
    end;}

    cdsTotal.First;
    while not cdsTotal.Eof do
    begin
      cdsTotal.Edit;
      if cdsTotal.RecNo = cdsTotal.RecordCount then
      begin
        //cdsTotal.FieldByName('VALOR').asFloat := ppDBCalc49.Value - fValorPlano;
        if dPercent <= 0 then
          cdsTotal.FieldByName('PERCENTRATEIO').Value := 0
        else
          cdsTotal.FieldByName('PERCENTRATEIO').Value := 100 - dPercent;
      end
      else
      begin
        //cdsTotal.FieldByName('VALOR').Value := RoundCM((ppDBCalc49.Value *
        //                    cdsTotal.FieldByName('PPIPERCENTRATEIO').Value)/100,2);
        //fValorPlano := fValorPlano + cdsTotal.FieldByName('VALOR').Value;

        cdsTotal.FieldByName('PERCENTRATEIO').Value := RoundCM((cdsTotal.FieldByName('VALOR').Value * 100)/
                                                       ppDBCalc49.Value, 2);
        dPercent := dPercent + cdsTotal.FieldByName('PERCENTRATEIO').Value;
      end;
      cdsTotal.Post;
      cdsTotal.Next;
    end;
  finally
    FreeAndNil(Ctrl);
    FreeAndNil(cdsTemp);
  end;

  {fValorPlano := 0;
  i := 1;
  isomaRateio := 0;
  sqlTotal.Open;
  while not cdsTotal.Eof do
  begin
    cdsTotal.Edit;
    if i = cdsTotal.RecordCount then
    begin
      cdsTotalVALOR.Value :=  ppDBCalc49.Value - fValorPlano;
      cdsTotalPPIPERCENTRATEIO.Value := 100 - isomaRateio;
    end
    else
    begin
      cdsTotalVALOR.Value := ComunsImobiliario.Arredonda(
        ppDBCalc49.Value * cdsTotalPPIPERCENTRATEIO.Value/100, 2 );
      fValorPlano := fValorPlano + cdsTotalVALOR.Value;
      isomaRateio := isomaRateio +
        ComunsImobiliario.Arredonda( cdsTotalPPIPERCENTRATEIO.Value, 2 );
    end;
    cdsTotal.Post;
    cdsTotal.Next;
    Inc(i);
  end;}
end;

// Felipe Oliveira - SOL 131924 Kintana 762445 - Início
procedure TdtmRelAdminImobCC.IResAluguelSegregPrint(Sender: TObject);
begin
  inherited;
    MontaQuerySegregacaoFolhaAluguel(cdsTotal);
end;
// Felipe Oliveira - SOL 131924 Kintana 762445 - Fim

//Cássio - SOL Nº 126318 KINTANA Nº 660563 - Início
// Felipe Oliveira - SOL 131924 Kintana 762445
procedure TdtmRelAdminImobCC.MontaQuerySegregacaoFolhaAluguel(ADataSet : TClientDataSet);
var
  sSQL : string;
  cdsTemp : TClientDataSet;
  ctrl : TCmControlObject;
  fValorTotal : Double;
  dPercent : Double;
begin
  cdsTemp := TClientDataSet.Create(nil);
  Ctrl := TCMControlObject.Create;
  try
    Ctrl.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
          Sistema.AppRemoteServer,True,ComunsImobiliario.MensErroMT);

  ADataSet.Data := ctrl.GetDataPacket('SELECT  ' +
  '     ''                                                                '' AS PATRO,' +
  '     ''                                                               '' AS PLANOPREV, ' +
  '     0.00   AS PERCENTRATEIO,' +
  '     0.0000 AS VALOR'+
  '      FROM DUAL'+
  '       WHERE 1=2 '    );

  qryFolhaAluguel.First;
  while not qryFolhaAluguel.Eof do
  begin
    sSQL :=        'SELECT  DISTINCT PES.NOME AS PATRO, '+
                   '         PPC.NOME AS PLANOPREV,'+
                   '         PPI.PERCENTRATEIO AS PPIPERCENTRATEIO,         '+
                   '         0.00   AS PERCENTRATEIO,'+
                   '         0.0000 AS VALOR'+
                   '   FROM PLANOPATROXVIGENCIAIMOB PPI,'+
                   '         CONTRATOXIMOVEL CXI,'+
                   '         PESSOA PES,'+
                   '         PLANPREVCONTABIL PPC,'+
                   '         CONTRATOIMOVEL CTI'+
                   '  WHERE CTI.IDCONTRATOIMOVEL = '+ qryFolhaAluguelIDCONTRATOIMOVEL.AsString +
                   '    AND PPI.DATAVIGENCIA = (SELECT MAX(PPV.DATAVIGENCIA) FROM PLANOPATROXVIGENCIAIMOB PPV,'+
                   '                            CONTRATOXIMOVEL CXI'+
                   '                            WHERE CXI.IDCONTRATOIMOVEL = ' +qryFolhaAluguelIDCONTRATOIMOVEL.AsString +
                   '                              AND PPV.IDIMOVEL = CXI.IDIMOVEL' +
                   '                              AND PPV.DATAVIGENCIA <= '+QuotedStr(DateToStr(dDataFinal))+')'+
                   '   AND CXI.IDCONTRATOIMOVEL = '+qryFolhaAluguelIDCONTRATOIMOVEL.AsString +
                   '   AND PPI.IDIMOVEL = CXI.IDIMOVEL'+
                   '   AND PPI.IDPATRO = PES.IDPESSOA'+
                   '   AND PPI.IDPLANOPREV = PPC.IDPLANOPREV'+
                   '  ORDER BY PPC.NOME, PES.NOME';
    cdsTemp.Data := ctrl.GetDataPacket(sSQL);

    fValorTotal := 0;
    // realiza o calculo do valor no while da query principal do relatório
    while not cdsTemp.Eof do
    begin
       if not ADataSet.Locate( 'PATRO;PLANOPREV;', VarArrayOf( [
        cdsTemp.FieldByName( 'PATRO' ).AsString,
        cdsTemp.FieldByName( 'PLANOPREV' ).AsString
        ] ), [] ) then
       begin
          ADataSet.Append;
          ADataSet.FieldByName('PATRO').AsString :=cdsTemp.FieldByName('PATRO').AsString;
          ADataSet.FieldByName('PLANOPREV').AsString :=cdsTemp.FieldByName('PLANOPREV').AsString;
          ADataSet.FieldByName('PERCENTRATEIO').AsFloat :=0;
          if cdsTemp.RecNo = cdsTemp.RecordCount then
          begin
             ADataSet.FieldByName('VALOR').AsFloat := qryFolhaAluguel.FieldByName('VLR_TOTAL').AsFloat  - fValorTotal;
          end
          else
          begin
             ADataSet.FieldByName('VALOR').AsFloat := RoundCM((cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat / 100) * qryFolhaAluguel.FieldByName('VLR_TOTAL').AsFloat, 2 );
             fValorTotal := fValorTotal + ADataSet.FieldByName('VALOR').AsFloat;
          end;
       end// end if locate
       else
       begin
          ADataSet.Edit;
          if cdsTemp.RecNo = cdsTemp.RecordCount then
             ADataSet.FieldByName('VALOR').AsFloat :=ADataSet.FieldByName('VALOR').AsFloat + (qryFolhaAluguel.FieldByName('VLR_TOTAL').AsFloat - fValorTotal)
          else
          begin
             ADataSet.FieldByName('VALOR').AsFloat :=ADataSet.FieldByName('VALOR').AsFloat + RoundCM((qryFolhaAluguel.FieldByName('VLR_TOTAL').AsFloat *
                                                              cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat)/100,2 );
             fValorTotal := fValorTotal + RoundCM((qryFolhaAluguel.FieldByName('VLR_TOTAL').AsFloat *
                                                              cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat)/100,2 );
          end;
       end;// end else locate
       ADataSet.Post;
       cdsTemp.Next;
    end; // end while cds Temp

    qryFolhaAluguel.Next;
  end; // edn while qryfolhaAluguel


  dPercent:= 0;
  ADataSet.First;
  while not ADataSet.Eof do
  begin
     ADataSet.Edit;
     if ADataSet.RecNo = ADataSet.RecordCount then
     begin
        if dPercent <= 0 then
           ADataSet.FieldByName('PERCENTRATEIO').AsFloat := 0
        else
           ADataSet.FieldByName('PERCENTRATEIO').AsFloat := 100 - dPercent;
     end
     else
     begin
        if ppDBCalc85.Value <> 0 then
           ADataSet.FieldByName('PERCENTRATEIO').AsFloat := RoundCM(((ADataSet.FieldByName('VALOR').AsFloat * 100) / ppDBCalc85.Value) ,2)
        else
           ADataSet.FieldByName('PERCENTRATEIO').AsFloat := RoundCM(((ADataSet.FieldByName('VALOR').AsFloat * 100) / 1) ,2);
        dPercent := dPercent + ADataSet.FieldByName('PERCENTRATEIO').AsFloat;
     end;
     ADataSet.Post;
     ADataSet.Next;
  end;

  finally
  cdsTemp.Free;
  ctrl.Free;
  end;
end;
end.
