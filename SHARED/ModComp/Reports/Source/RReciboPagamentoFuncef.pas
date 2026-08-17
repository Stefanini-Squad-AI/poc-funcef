{-------------------------------------------------------------------------------
------------------------ REGISTRO DE ALTERAÇÕES --------------------------------
--------------------------------------------------------------------------------

 Pendência....: 128495
 Data.........: 26/08/2022
 Responsável..: Everson Cunha
 Descrição....: Ajuste nos campos TipoContrato e SitFunc
-------------------------------------------------------------------------------- 
 Pendência....: 128334 / 128733
 Data.........: 23/08/2022
 Responsável..: Everson Cunha
 Descrição....: Alterada descrição da margem. De 30% para 35%
--------------------------------------------------------------------------------
Nº SIG...........: 122148
Data da Alteração: 10/01/2022
Responsável......: Ewerton Beltramini
Descrição........: Alterada descrição da margem. De 35%, para 30%.
--------------------------------------------------------------------------------
Rotina.........: *.dfm (sqlReciboPagamento e rpReciboPagamento - campo mesano),
                 MontarDadosRelatorio, CrmRptCMBeforePrint
N. Sol.........: 217186-15443
N. Kintana.....: 2053651
Data...........: 12/01/2015
Responsável....: Edilaine Ferraresi
Descrição......: impressão do contra-cheque para mais de um mês
--------------------------------------------------------------------------------
Rotina..........: TRptReciboPagamentoFuncef.CrmRptCMBeforePrint,
                  TRptReciboPagamentoFuncef.ppGroupHeaderBand10BeforePrint,
                  TRptReciboPagamentoFuncef.rpReciboPagamentoSmryBndAfterPrint
Nº SOL..........: 155155
Nº KINTANA......: 1200776
Data............: 12/08/2011
Responsável.....: Otacilio Aquino
Descrição.......: Incluir campo Data de admissão e Número Banco no Relatorio
                  Demonstrativo de pagamento
--------------------------------------------------------------------------------
Rotina..........: MontarDadosRelatorio
N. Sol..........: 136608
N. Kintana......: 818305
Data............: 27/05/2010
Responsável.....: Arnaldo V. Scarin
Descrição.......: Correção da Mensagem do Recibo

Rotina.......: MontarDadosRelatorio
N. Sol.......: 135471
N. Kintana...: 806005
Data.........: 14/05/2010
Responsável..: Marcos Luiz de Jesus
Descrição....: Inclusão do campo SALÁRIO BASE+CARGO ESTRATÉGICO (RUBRICA 08200);
               EMPRÉSTIMO FUNCEF PARCELA SUSPENSA (RUBRICA 39800);
               EXCESSO DE DÉBITO (RUBRICA 39884);
               *Exclusão do campo MARGEM EMPR FUNCEF
               *Incluir a mensagem: * Consulte na Intranet / Espaço do empregado
                  o relatório contendo as rubricas que compõe o campo excesso de
                  débito.
                                        
 Autor(a)    :  Ádler Teodoro de Souza
 Data        :  27/02/2009
 Pendência   : SOL 109421 KINTANA 496332
 Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
--------------------------------------------------------------------------------}

unit RReciboPagamentoFuncef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, DBClient,
  uCMClientDataSet, uCmSqlParams, ppStrtch, ppSubRpt, ppRegion, TXRB, USistema,
  ppRichTx;

type
  TRptReciboPagamentoFuncef = class(TFrmCmReport)
    rpReciboPagamento: TppReport;
    ppDetailBand10: TppDetailBand;
    ppGroup10: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    shpReciboPagamento12: TppShape;
    shpReciboPagamento2: TppShape;
    lblReciboPagamentoNOME: TppLabel;
    lblReciboPagamentoCARGO: TppLabel;
    lblReciboPagamentoC_CUSTO: TppLabel;
    dbtxtReciboPagamentoCGC: TppDBText;
    dbtxtReciboPagamentoMATRICULA: TppDBText;
    dbtxtReciboPagamentoEMPREGADO: TppDBText;
    dbtxtReciboPagamentoCARGO: TppDBText;
    dbtxtReciboPagamentoC_CUSTO: TppDBText;
    lblReciboPagamentoMES_REF: TppLabel;
    lblReciboPagamentoCOD: TppLabel;
    shpReciboPagamento4: TppShape;
    shpReciboPagamento6: TppShape;
    shpReciboPagamento5: TppShape;
    lblReciboPagamentoCODIGO: TppLabel;
    lblReciboPagamentoDESCRICAO: TppLabel;
    lblReciboPagamentoREF: TppLabel;
    lblReciboPagamentoPROV: TppLabel;
    lblReciboPagamentoDESC: TppLabel;
    lnReciboPagamento3: TppLine;
    lnReciboPagamento1: TppLine;
    lnReciboPagamento2: TppLine;
    shpReciboPagamento7: TppShape;
    shpReciboPagamento8: TppShape;
    shpReciboPagamento10: TppShape;
    lblReciboPagamentoTOT_LIQ: TppLabel;
    lblReciboPagamentoBASE_IRRF: TppLabel;
    lblReciboPagamentoFGTS_MES: TppLabel;
    lblReciboPagamentoMARGEM1: TppLabel;
    lblReciboPagamentoBASE_INSS: TppLabel;
    lblReciboPagamentoSAL_BASE: TppLabel;
    dbtxtReciboPagamentoDESCONTO1: TppDBText;
    dbtxtReciboPagamentoDESCONTO2: TppDBText;
    dbtxtReciboPagamentoDESCONTO3: TppDBText;
    dbtxtReciboPagamentoDESCONTO4: TppDBText;
    dbtxtReciboPagamentoDESCONTO5: TppDBText;
    dbtxtReciboPagamentoDESCONTO6: TppDBText;
    dbtxtReciboPagamentoDESCONTO7: TppDBText;
    dbtxtReciboPagamentoDESCONTO8: TppDBText;
    dbtxtReciboPagamentoDESCONTO9: TppDBText;
    dbtxtReciboPagamentoDESCONTO10: TppDBText;
    dbtxtReciboPagamentoDESCONTO11: TppDBText;
    dbtxtReciboPagamentoDESCONTO12: TppDBText;
    dbtxtReciboPagamentoDESCONTO13: TppDBText;
    dbtxtReciboPagamentoDESCONTO14: TppDBText;
    dbtxtReciboPagamentoDESCONTO15: TppDBText;
    dbtxtReciboPagamentoPROVENTO1: TppDBText;
    dbtxtReciboPagamentoPROVENTO2: TppDBText;
    dbtxtReciboPagamentoPROVENTO3: TppDBText;
    dbtxtReciboPagamentoPROVENTO4: TppDBText;
    dbtxtReciboPagamentoPROVENTO5: TppDBText;
    dbtxtReciboPagamentoPROVENTO6: TppDBText;
    dbtxtReciboPagamentoPROVENTO7: TppDBText;
    dbtxtReciboPagamentoPROVENTO8: TppDBText;
    dbtxtReciboPagamentoPROVENTO9: TppDBText;
    dbtxtReciboPagamentoPROVENTO10: TppDBText;
    dbtxtReciboPagamentoPROVENTO11: TppDBText;
    dbtxtReciboPagamentoPROVENTO12: TppDBText;
    dbtxtReciboPagamentoPROVENTO13: TppDBText;
    dbtxtReciboPagamentoPROVENTO14: TppDBText;
    dbtxtReciboPagamentoPROVENTO15: TppDBText;
    dbtxtReciboPagamentoREFERENCIA1: TppDBText;
    dbtxtReciboPagamentoREFERENCIA2: TppDBText;
    dbtxtReciboPagamentoREFERENCIA3: TppDBText;
    dbtxtReciboPagamentoREFERENCIA4: TppDBText;
    dbtxtReciboPagamentoREFERENCIA5: TppDBText;
    dbtxtReciboPagamentoREFERENCIA6: TppDBText;
    dbtxtReciboPagamentoREFERENCIA7: TppDBText;
    dbtxtReciboPagamentoREFERENCIA8: TppDBText;
    dbtxtReciboPagamentoREFERENCIA9: TppDBText;
    dbtxtReciboPagamentoREFERENCIA10: TppDBText;
    dbtxtReciboPagamentoREFERENCIA11: TppDBText;
    dbtxtReciboPagamentoREFERENCIA12: TppDBText;
    dbtxtReciboPagamentoREFERENCIA13: TppDBText;
    dbtxtReciboPagamentoREFERENCIA14: TppDBText;
    dbtxtReciboPagamentoREFERENCIA15: TppDBText;
    dbtxtReciboPagamentoRUBRICA1: TppDBText;
    dbtxtReciboPagamentoRUBRICA2: TppDBText;
    dbtxtReciboPagamentoRUBRICA3: TppDBText;
    dbtxtReciboPagamentoRUBRICA4: TppDBText;
    dbtxtReciboPagamentoRUBRICA5: TppDBText;
    dbtxtReciboPagamentoRUBRICA6: TppDBText;
    dbtxtReciboPagamentoRUBRICA7: TppDBText;
    dbtxtReciboPagamentoRUBRICA8: TppDBText;
    dbtxtReciboPagamentoRUBRICA9: TppDBText;
    dbtxtReciboPagamentoRUBRICA10: TppDBText;
    dbtxtReciboPagamentoRUBRICA11: TppDBText;
    dbtxtReciboPagamentoRUBRICA12: TppDBText;
    dbtxtReciboPagamentoRUBRICA13: TppDBText;
    dbtxtReciboPagamentoRUBRICA14: TppDBText;
    dbtxtReciboPagamentoRUBRICA15: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA1: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA2: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA3: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA4: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA5: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA6: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA7: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA8: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA9: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA10: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA11: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA12: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA13: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA14: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA15: TppDBText;
    dbtxtReciboPagamentoFOLHA: TppDBText;
    dbtxtReciboPagamentoSAL_BASE: TppDBText;
    dbtxtReciboPagamentoBASE_INSS: TppDBText;
    dbtxtReciboPagamentoMARGEM1: TppDBText;
    dbtxtReciboPagamentoFGTS_MES: TppDBText;
    dbtxtReciboPagamentoBASE_IRRF: TppDBText;
    dbtxtReciboPagamentoTOT_PROVENTOS: TppDBText;
    dbtxtReciboPagamentoTOT_DESCONTOS: TppDBText;
    dbtxtReciboPagamentoTOT_GERAL: TppDBText;
    ppGroupFooterBand10: TppGroupFooterBand;
    ppReciboPagamento: TppBDEPipeline;
    dsReciboPagamento: TwwDataSource;
    sqlReciboPagamento: TCMSqlParams;
    CdsReciboPagamento: TCMClientDataSet;
    Figura1: TppImage;
    Figura2: TppImage;
    Figura3: TppImage;
    ppShape1: TppShape;
    ppLabel7: TppLabel;
    ppLine1: TppLine;
    dbtxtReciboPagamentoCODRUBRICA16: TppDBText;
    dbtxtReciboPagamentoRUBRICA16: TppDBText;
    dbtxtReciboPagamentoREFERENCIA16: TppDBText;
    dbtxtReciboPagamentoPROVENTO16: TppDBText;
    dbtxtReciboPagamentoDESCONTO16: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA17: TppDBText;
    dbtxtReciboPagamentoRUBRICA17: TppDBText;
    dbtxtReciboPagamentoREFERENCIA17: TppDBText;
    dbtxtReciboPagamentoPROVENTO17: TppDBText;
    dbtxtReciboPagamentoDESCONTO17: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA18: TppDBText;
    dbtxtReciboPagamentoRUBRICA18: TppDBText;
    dbtxtReciboPagamentoREFERENCIA18: TppDBText;
    dbtxtReciboPagamentoPROVENTO18: TppDBText;
    dbtxtReciboPagamentoDESCONTO18: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA19: TppDBText;
    dbtxtReciboPagamentoRUBRICA24: TppDBText;
    dbtxtReciboPagamentoREFERENCIA19: TppDBText;
    dbtxtReciboPagamentoPROVENTO19: TppDBText;
    dbtxtReciboPagamentoDESCONTO19: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA20: TppDBText;
    dbtxtReciboPagamentoRUBRICA19: TppDBText;
    dbtxtReciboPagamentoREFERENCIA20: TppDBText;
    dbtxtReciboPagamentoPROVENTO20: TppDBText;
    dbtxtReciboPagamentoDESCONTO20: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA21: TppDBText;
    dbtxtReciboPagamentoRUBRICA20: TppDBText;
    dbtxtReciboPagamentoREFERENCIA21: TppDBText;
    dbtxtReciboPagamentoPROVENTO21: TppDBText;
    dbtxtReciboPagamentoDESCONTO21: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA22: TppDBText;
    dbtxtReciboPagamentoRUBRICA21: TppDBText;
    dbtxtReciboPagamentoREFERENCIA22: TppDBText;
    dbtxtReciboPagamentoPROVENTO22: TppDBText;
    dbtxtReciboPagamentoDESCONTO22: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA23: TppDBText;
    dbtxtReciboPagamentoRUBRICA22: TppDBText;
    dbtxtReciboPagamentoREFERENCIA23: TppDBText;
    dbtxtReciboPagamentoPROVENTO23: TppDBText;
    dbtxtReciboPagamentoDESCONTO23: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA24: TppDBText;
    dbtxtReciboPagamentoRUBRICA23: TppDBText;
    dbtxtReciboPagamentoREFERENCIA24: TppDBText;
    dbtxtReciboPagamentoPROVENTO24: TppDBText;
    dbtxtReciboPagamentoDESCONTO24: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA25: TppDBText;
    dbtxtReciboPagamentoRUBRICA25: TppDBText;
    dbtxtReciboPagamentoREFERENCIA25: TppDBText;
    dbtxtReciboPagamentoPROVENTO25: TppDBText;
    dbtxtReciboPagamentoDESCONTO25: TppDBText;
    lblReciboPagamentoAgencia: TppLabel;
    ppLabel8: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    lblReciboPagamentoSFAM: TppLabel;
    ppLabel10: TppLabel;
    ppImage1: TppImage;
    ppImage2: TppImage;
    ppShape2: TppShape;
    ppLabel11: TppLabel;
    lblReciboPagamentoC_CUSTO2: TppLabel;
    dbtxtReciboPagamentoMATR2: TppDBText;
    dbtxtReciboPagamentoNOME2: TppDBText;
    dbtxtReciboPagamentoC_CUSTO2: TppDBText;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine10: TppLine;
    ppLine9: TppLine;
    dbtxtReciboPagamentoAGENCIA: TppDBText;
    dbtxtReciboPagamentoCONTA: TppDBText;
    dbtxtReciboPagamentoSFAM: TppDBText;
    dbtxtReciboPagamentoDEPIR: TppDBText;
    lblReciboPagamentoSAL_PART1: TppLabel;
    dbtxtReciboPagamentoSALPART: TppDBText;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLabel3: TppLabel;
    lblReciboPagamentoSAL_PART2: TppLabel;
    lblReciboPagamentoBASE_IRRF2: TppLabel;
    lblReciboPagamentoSAL_BASE2: TppLabel;
    lblReciboPagamentoFGTS_MES2: TppLabel;
    lblReciboPagamentoMARGEM12: TppLabel;
    ppLabel1: TppLabel;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppShape3: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppLabel2: TppLabel;
    ppShape13: TppShape;
    ppLabel4: TppLabel;
    lblReciboPagamentoCARGO_2: TppLabel;
    lblReciboPagamentoC_CUSTO_2: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel9: TppLabel;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppShape17: TppShape;
    ppLabel19: TppLabel;
    lblReciboPagamentoBASE_IRRF_2: TppLabel;
    lblReciboPagamentoFGTS_MES_2: TppLabel;
    lblReciboPagamentoMARGEM1_2: TppLabel;
    ppLabel23: TppLabel;
    lblReciboPagamentoSAL_BASE_2: TppLabel;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
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
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
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
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppDBText71: TppDBText;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText83: TppDBText;
    ppDBText84: TppDBText;
    dbtxtReciboPagamentoMARGEM1_2: TppDBText;
    dbtxtReciboPagamentoFGTS_MES_2: TppDBText;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppLabel25: TppLabel;
    ppLine23: TppLine;
    ppDBText92: TppDBText;
    ppDBText93: TppDBText;
    ppDBText94: TppDBText;
    ppDBText95: TppDBText;
    ppDBText96: TppDBText;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppDBText100: TppDBText;
    ppDBText101: TppDBText;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppDBText104: TppDBText;
    ppDBText105: TppDBText;
    ppDBText106: TppDBText;
    ppDBText107: TppDBText;
    ppDBText108: TppDBText;
    ppDBText109: TppDBText;
    ppDBText110: TppDBText;
    ppDBText111: TppDBText;
    ppDBText112: TppDBText;
    ppDBText113: TppDBText;
    ppDBText114: TppDBText;
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
    ppDBText125: TppDBText;
    ppDBText126: TppDBText;
    ppDBText127: TppDBText;
    ppDBText128: TppDBText;
    ppDBText129: TppDBText;
    ppDBText130: TppDBText;
    ppDBText131: TppDBText;
    ppDBText132: TppDBText;
    ppDBText133: TppDBText;
    ppDBText134: TppDBText;
    ppDBText135: TppDBText;
    ppDBText136: TppDBText;
    ppDBText137: TppDBText;
    ppDBText138: TppDBText;
    ppDBText139: TppDBText;
    ppDBText140: TppDBText;
    ppDBText141: TppDBText;
    lblReciboPagamentoAgencia_2: TppLabel;
    ppLabel27: TppLabel;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    lblReciboPagamentoSFAM_2: TppLabel;
    ppLabel29: TppLabel;
    ppImage3: TppImage;
    ppLine29: TppLine;
    ppDBText142: TppDBText;
    ppDBText143: TppDBText;
    dbtxtReciboPagamentoSFAM_2: TppDBText;
    ppDBText145: TppDBText;
    lblReciboPagamentoSAL_PART1_2: TppLabel;
    ppDBText146: TppDBText;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLabel32: TppLabel;
    lblReciboPagamentoSAL_PART2_2: TppLabel;
    lblReciboPagamentoBASE_IRRF2_2: TppLabel;
    lblReciboPagamentoMARGEM12_2: TppLabel;
    lblReciboPagamentoSAL_BASE2_2: TppLabel;
    lblReciboPagamentoFGTS_MES2_2: TppLabel;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppLine39: TppLine;
    Figura3_2: TppImage;
    ppImage5: TppImage;
    ppShape21: TppShape;
    ppLabel39: TppLabel;
    lblReciboPagamentoC_CUSTO2_2: TppLabel;
    ppDBText148: TppDBText;
    ppDBText149: TppDBText;
    ppDBText150: TppDBText;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLabel43: TppLabel;
    ppShape22: TppShape;
    Figura1_2: TppImage;
    Figura2_2: TppImage;
    ppRichText1: TppRichText;
    lblReciboPagamentoSalBaseCargoEstrat_2: TppLabel;
    lblReciboPagamentoEstrategico_2: TppLabel;
    dbtxtReciboPagamentoSalBase_Cargo_2: TppDBText;
    ppShape23: TppShape;
    ppLine42: TppLine;
    lblReciboPagamentoSalBaseCargoEstrat: TppLabel;
    lblReciboPagamentoEstrategico: TppLabel;
    dbtxtReciboPagamentoSalBase_Cargo: TppDBText;
    ppShape24: TppShape;
    ppRichText2: TppRichText;
    ppLine43: TppLine;
    lblReciboPagamentoEmprestimo: TppLabel;
    lblReciboPagamentoFuncefParcela: TppLabel;
    lblReciboPagamentoSuspensa: TppLabel;
    lblReciboPagamentoExcesso: TppLabel;
    lblReciboPagamentoDebito: TppLabel;
    lblReciboPagamentoEmprestimo_2: TppLabel;
    lblReciboPagamentoFuncefParcela_2: TppLabel;
    lblReciboPagamentoSuspensa_2: TppLabel;
    lblReciboPagamentoDebito_2: TppLabel;
    lblReciboPagamentoExcesso_2: TppLabel;
    dbtxtReciboPagamentoEmprestimo: TppDBText;
    dbtxtReciboPagamentoEmprestimo_2: TppDBText;
    dbtxtReciboPagamentoExcessoDebito: TppDBText;
    dbtxtReciboPagamentoExcessoDebito_2: TppDBText;
    ppLine44: TppLine;
    ppLine45: TppLine;
    dbtxtReciboPagamentoDATAEFETIVACAO: TppDBText;
    lblAdmissao: TppLabel;
    lblAdmissao_2: TppLabel;
    dbtxtReciboPagamentoDATAEFETIVACAO_2: TppDBText;
    lblBanco: TppLabel;
    dbtxtReciboPagamentoNUMBANCO: TppDBText;
    lblBanco2: TppLabel;
    dbtxtReciboPagamentoNUMBANCO_2: TppDBText;
    ppLine46: TppLine;
    ppLine47: TppLine;
    ppMesAno1E: TppDBText;
    ppMesAno1D: TppDBText;
    ppMesAno2D: TppDBText;
    ppMesAno2E: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsReciboPagamentoAfterOpen(DataSet: TDataSet);
    procedure CdsReciboPagamentoAfterScroll(DataSet: TDataSet);
    procedure rpReciboPagamentoSmryBndAfterPrint(Sender: TObject);
    procedure ppGroupHeaderBand10BeforePrint(Sender: TObject);
  private
    iPagina : integer;                                                  // edilaine - SOL 217186-15443 / KTN 2053651
    procedure MontarDadosRelatorio(iVez : integer; sMesAno : string);   // edilaine - SOL 217186-15443 / KTN 2053651
    procedure MontarDados_Suprimido;
  public
    iNumMeses : integer;                            // edilaine - SOL 217186-15443 / KTN 2053651
    IdEmpresa, MesRef, AnoRef, Ordenacao: integer;
    ListaIdEstab, ListaIdFunc, TipoContrato, SitFunc, NomeTabela, TipoPagamento,
    sFigura1, sFigura2, sFigura3: string;

  end;

var
  RptReciboPagamentoFuncef: TRptReciboPagamentoFuncef;

implementation

uses uCtrlFuncoesRH, dCds, fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptReciboPagamentoFuncef.CrmRptCMBeforePrint(Sender: TObject);
var
  DocID: array[1..2] of integer;
  iMes, iAno: integer;
  iNumVezes : integer;          // edilaine - SOL 217186-15443 / KTN 2053651
  sMesAtual : string;           // edilaine - SOL 217186-15443 / KTN 2053651
  sMesBase  : string;           // edilaine - SOL 217186-15443 / KTN 2053651
begin
  inherited;
  Figura1.Picture.LoadFromFile(sFigura1);
  Figura1_2.Picture.LoadFromFile(sFigura1);

  Figura2.Picture.LoadFromFile(sFigura2);
  Figura2_2.Picture.LoadFromFile(sFigura2);

  Figura3.Picture.LoadFromFile(sFigura3);
  Figura3_2.Picture.LoadFromFile(sFigura3);

  DocID[1] := 0;
  DocID[2] := 0;

  iMes := MesRef;
  iAno := AnoRef;

  // edilaine - SOL 217186-15443 / KTN 2053651 - inicio
  sMesBase := '01/' + fu.UltimosCaracteres('00'+IntToStr(iMes), 2) + '/'+IntToStr(iAno);
  iPagina  := 1;
  // edilaine - SOL 217186-15443 / KTN 2053651 - fim

  for iNumVezes := 0 to iNumMeses-1 do   // edilaine - SOL 217186-15443 / KTN 2053651
  begin

    // edilaine - SOL 217186-15443 / KTN 2053651 - inicio
    sMesAtual := fu.IncData(sMesBase, 0, iNumVezes, 0);

    MesRef := fu.ExtraiMes( StrToDate(sMesAtual) );
    AnoRef := fu.ExtraiAno( StrToDate(sMesAtual) );

    iMes := MesRef;
    iAno := AnoRef;
    // edilaine - SOL 217186-15443 / KTN 2053651 = fim;

    with (dmCds.sql.SQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
      Add('  PF.NOME AS EMPREGADO,');
      Add('  P.FLGDESCONTO AS TIPORUBRICA,');
      Add('  RTRIM(DECODE(RTRIM(H.REFERENCIA),''***'','''',''Ferias'','''',''Férias'','''',');
      Add('    ''Rescisao'','''',''Rescisão'','''',''13.o Salar'','''',H.REFERENCIA)) AS REFERENCIA,');
      Add('  F.MATRICULA,');
      Add('  F.TIPOCONTRATO,');
      Add('  F.NUMCONTASALARIO,');
      Add('  AG.NUMAGENCIA,');
      Add('  BA.NUMBANCO,');
      // SOL 155155 Kintana 1200776 Otacilio Aquino
      Add('  F.DATAADMISSAO AS DATAEFETIVACAO,');
      Add('  CC.CODCENTROCUSTO,');
      Add('  CC.NOME AS NOMECENTROCUSTO,');
      Add('  PFIS.NUMDEPIRRF,');
      Add('  PFIS.NUMDEPSALF,');
      Add('  C.TITULO, DECODE(C2.TITULO,NULL,'''','' / '' || C2.TITULO) AS FUNCAO,');
      Add('  P.CODRUBCLT AS CODRUBRICA,');
      Add('  RP.CODPROVDESC AS CODRUBRICACLIENTE,');
      Add('  RP.DESCRPROVDESC AS RUBRICA,');
      Add('  (''CNPJ: '' || PJ.NUMDOCUMENTO) AS CGC,');
      Add('  PF.NUMDOCUMENTO AS CPF,');
      Add('  PIS.NUM AS PIS,');
      Add('  H.VALORPROVENTO AS VALOR,');
      Add('  MARGEM1.VALORMARGEM AS VALORMARGEM1,');
      Add('  MARGEM2.VALORMARGEM AS VALORMARGEM2,');
      Add('  DECODE(SALCONTRA.SALARIOCONTRATUAL,');
      Add('    NULL, F.SALARIOATUAL * (CASE');
      Add('                              WHEN F.TIPOPAGAMENTO = ''M'' THEN 1');
      Add('                              WHEN F.TIPOPAGAMENTO = ''D'' THEN 30');
      Add('                              WHEN F.TIPOPAGAMENTO = ''T'' THEN 1');
      Add('                              ELSE HT.JORNADAMENSAL');
      Add('                            END),');
      Add('    SALCONTRA.SALARIOCONTRATUAL) AS SALBASE');
      Add('FROM');
      Add('  ' +NomeTabela+ ' H, PESSOA PJ, PESSOA PF, PESSOAFISICA PFIS, PROVDESC P,');
      Add('  RUBRICAXPESS RP, FUNCIONARIO F, CARGO C,  CARGO C2, HORATRAB HT,');
      Add('  CENTCUST CC, SITFUNC ST, AGENCIABANCARIA AG, BANCO BA, FILIALPESSOA FP,');
      // -------------------------------------------------------------------------- //
      // Última evolução Funcional do Funcionário
      // -------------------------------------------------------------------------- //
      Add('  (SELECT');
      Add('     EVOL.IDCARGO, EVOL.IDFUNCAO, EVOL.IDPESSOA, EVOL.IDEMPRESA, EVOL.CODCENTROCUSTO');
      Add('   FROM');
      Add('     EVOLFUNC EVOL,');
      Add('     (SELECT');
      Add('        MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
      Add('      FROM');
      Add('        EVOLFUNC');
      Add('      WHERE');
      Add('        (DATAALTERFUNC <= TO_DATE(' +
        QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes, iAno)) +'/'+ FU.PoeZero(iMes) +'/'+
        IntToStr(iAno))+ ',''DD/MM/YYYY''))');
      Add('      GROUP BY');
      Add('        IDPESSOA) HST2,');
      Add('     (SELECT');
      Add('        MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
      Add('      FROM');
      Add('        EVOLFUNC');
      Add('      WHERE');
      Add('        (DATAALTERFUNC <= TO_DATE(' +
        QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes, iAno)) +'/'+ FU.PoeZero(iMes) +'/'+
        IntToStr(iAno))+ ',''DD/MM/YYYY''))');
      Add('      GROUP BY');
      Add('        IDPESSOA) HST3');
      Add('   WHERE');
      Add('     (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
      Add('     (EVOL.IDPESSOA      = HST2.IDPESSOA) AND');
      Add('     (EVOL.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
      Add('     (EVOL.IDPESSOA      = HST3.IDPESSOA)) HST,');
      // -------------------------------------------------------------------------- //
      // Margem 1 (CLT = 90010)
      // -------------------------------------------------------------------------- //
      Add('  (SELECT DISTINCT');
      Add('     H.IDPESSOA, H.VALORPROVENTO AS VALORMARGEM');
      Add('   FROM');
      Add('     ' +NomeTabela+ ' H, PROVDESC P');
      Add('   WHERE');
      Add('     (H.MES        = ' +
        QuotedStr(IntToStr(AnoRef) +'/'+ FU.PoeZero(MesRef))+ ') AND');
      Add(FU.MontaLinhaSelSQL('     (H.IDMOTIVO',TipoPagamento,2));
      Add('     (P.CODRUBCLT  = ''90010'') AND');
      Add('     (P.IDPROVENTO = H.IDRUBRICA)) MARGEM1,');
      // -------------------------------------------------------------------------- //
      // Margem 2 (CLT = 90012)
      // -------------------------------------------------------------------------- //
      Add('  (SELECT DISTINCT');
      Add('     H.IDPESSOA, H.VALORPROVENTO AS VALORMARGEM');
      Add('   FROM');
      Add('     ' +NomeTabela+ ' H, PROVDESC P');
      Add('   WHERE');
      Add('     (H.MES        = ' +
        QuotedStr(IntToStr(AnoRef) +'/'+ FU.PoeZero(MesRef))+ ') AND');
      Add(FU.MontaLinhaSelSQL('     (H.IDMOTIVO',TipoPagamento,2));
      Add('     (P.CODRUBCLT  = ''90012'') AND');
      Add('     (P.IDPROVENTO = H.IDRUBRICA)) MARGEM2,');
      // -------------------------------------------------------------------------- //
      // Salario Contratual (CLT = 60052)
      // -------------------------------------------------------------------------- //
      Add('  (SELECT DISTINCT');
      Add('     H.IDPESSOA, H.VALORPROVENTO AS SALARIOCONTRATUAL');
      Add('   FROM');
      Add('     ' +NomeTabela+ ' H, PROVDESC P');
      Add('   WHERE');
      Add('     (H.MES        = ' +
        QuotedStr(IntToStr(AnoRef) +'/'+ FU.PoeZero(MesRef))+ ') AND');
      Add(FU.MontaLinhaSelSQL('     (H.IDMOTIVO',TipoPagamento,2));
      Add('     (P.CODRUBCLT  = ''60052'') AND');
      Add('     (P.IDPROVENTO = H.IDRUBRICA)) SALCONTRA,');
      // -------------------------------------------------------------------------- //
      // PIS do Funcionário
      // -------------------------------------------------------------------------- //
      Add('  (SELECT F.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
      Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO');
      Add('   WHERE ((TDO.SIGLADOCUMENTO = ''PIS:'') OR');
      Add('          (TDO.SIGLADOCUMENTO = ''PIS/PASEP:'')) AND');
      Add('         (TDO.IDDOCUMENTO     = DP.IDDOCUMENTO) AND');
      Add('         (DP.IDPESSOA         = F.IDPESSOA)) PIS');
      // -------------------------------------------------------------------------- //
      Add('WHERE');
      Add(FU.MontaLinhaSelSQL('  (FP.IDFILIALPESSOA',ListaIdEstab,1));

      // Funcionário(s) selecionado(s)
      if (ListaIdFunc <> '') then
        Add(FU.MontaLinhaSelSQL('  (F.IDPESSOA',ListaIdFunc,8))
      else
      begin
        // C. de Custo(s) habilitados para o usuário
        if (CtrlUsoGeralRH.UsuXCCusto <> '') then
          Add(FU.MontaLinhaSelSQL(
            '  (TRIM(DECODE(HST.CODCENTROCUSTO,' +CR_LF+
            '     NULL,F.CODCENTROCUSTO,' +CR_LF+
            '     HST.CODCENTROCUSTO))',CtrlUsoGeralRH.UsuXCCusto,1));

        //Everson Cunha - SIG128495 - Ini
        //Add(FU.MontaLinhaSelSQL('  (ST.TIPOSIT',SitFunc,8));
        //Add(FU.MontaLinhaSelSQL('  (F.TIPOCONTRATO',SitFunc,4));
        Add(FU.MontaLinhaSelSQL('  (ST.TIPOSIT',SitFunc,4));
        Add(FU.MontaLinhaSelSQL('  (F.TIPOCONTRATO',TipoContrato,8));
        //Everson Cunha - SIG128495 - Fim
      end;

      Add('  (H.MES              = ' +QuotedStr(IntToStr(AnoRef) +'/'+ FU.PoeZero(MesRef))+ ') AND');
      Add(FU.MontaLinhaSelSQL('  (H.IDMOTIVO',TipoPagamento,7));
      Add('  (H.IDPESSJUR        = ' +IntToStr(IdEmpresa)+ ') AND');
      Add('  (F.IDSITFUNC        = ST.IDSITFUNC) AND');
      Add('  (F.IDHORARIO        = HT.IDHORARIO) AND');
      Add('  (FP.IDFILIALPESSOA  = F.IDESTAB) AND');
      Add('  (F.IDESTAB          = PJ.IDPESSOA) AND');
      Add('  (F.IDPESSOA         = PFIS.IDPESSOA) AND');
      Add('  (F.IDPESSOA         = PF.IDPESSOA) AND');
      Add('  (F.IDPESSOA         = H.IDPESSOA) AND');
      Add('  (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) = C.IDCARGO) AND');
      Add('  (H.IDRUBRICA        = RP.IDRUBRICA) AND');
      Add('  (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = CC.IDEMPRESA) AND');
      Add('  (DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO) = CC.CODCENTROCUSTO) AND');
      Add('  (H.IDRUBRICA        = P.IDPROVENTO) AND');
      Add('  (RP.IDPESSOA        = DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA)) AND');
      Add('  (F.IDPESSOA         = SALCONTRA.IDPESSOA(+)) AND');
      Add('  (F.IDPESSOA         = PIS.IDPESSOA(+)) AND');
      Add('  (F.IDAGENCIASALARIO = AG.IDPESSOA(+)) AND');
      Add('  (AG.IDBANCO         = BA.IDPESSOA(+)) AND');
      Add('  (F.IDPESSOA         = MARGEM1.IDPESSOA(+)) AND');
      Add('  (F.IDPESSOA         = MARGEM2.IDPESSOA(+)) AND');
      Add('  (F.IDPESSOA         = HST.IDPESSOA(+)) AND');
      Add('  (HST.IDFUNCAO       = C2.IDCARGO(+))');
      Add('ORDER BY');
      case (Ordenacao) of
        0 : Add('  EMPRESA, EMPREGADO, TIPORUBRICA, CODRUBRICACLIENTE');
        1 : Add('  EMPRESA, NOMECENTROCUSTO, EMPREGADO, TIPORUBRICA, CODRUBRICACLIENTE');
        2 : Add('  EMPRESA, NOMECENTROCUSTO, MATRICULA, TIPORUBRICA, CODRUBRICACLIENTE');
        3 : Add('  EMPRESA, MATRICULA, TIPORUBRICA, CODRUBRICACLIENTE');
      end;
      //SaveToFile('c:\qry.txt');
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    end;
    dmCds.sql.Open;

    // edilaine - SOL 217186-15443 / KTN 2053651 - comentado inicio
    {LblMesRef.Caption := FU.MesExtensoAno(IntToStr(AnoRef) +'/'+ FU.PoeZero(MesRef));
    LblMesRef2.Caption := LblMesRef.Caption;
    LblMesRef3.Caption := LblMesRef.Caption;
    LblMesRef4.Caption := LblMesRef.Caption;
    } // edilaine - SOL 217186-15443 / KTN 2053651 - comentado fim

    // Monta Query Principal
    MontarDadosRelatorio(iNumVezes, sMesAtual);

  end;
  MontarDados_Suprimido;
  // edilaine - SOL 217186-15443 / KTN 2053651 - fim

  CdsReciboPagamento.First;
  frmAguarde.Apaga;
end;

procedure TRptReciboPagamentoFuncef.CdsReciboPagamentoAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptReciboPagamentoFuncef.CdsReciboPagamentoAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptReciboPagamentoFuncef.ppGroupHeaderBand10BeforePrint(Sender: TObject);
begin
  if (CdsReciboPagamento.FieldByName('TIPOCONTRATO').asString <> 'A') then
  begin
    lblReciboPagamentoC_CUSTO.Caption := 'Unidade da Lotação';
    lblReciboPagamentoC_CUSTO_2.Caption := 'Unidade da Lotação';
    lblReciboPagamentoC_CUSTO2.Caption := 'Unidade da Lotação';
    lblReciboPagamentoC_CUSTO2_2.Caption := 'Unidade da Lotação';
    lblReciboPagamentoAgencia.Caption := 'Cod. Agência';
    lblReciboPagamentoAgencia_2.Caption := 'Cod. Agência';
    lblReciboPagamentoCARGO.Caption := 'Cargo/Função';
    lblReciboPagamentoCARGO_2.Caption := 'Cargo/Função';
    lblReciboPagamentoSFAM.Visible := true;
    lblReciboPagamentoSFAM_2.Visible := true;
    dbtxtReciboPagamentoSFAM.Visible := true;
    dbtxtReciboPagamentoSFAM_2.Visible := true;
    lblReciboPagamentoSAL_BASE.Caption := 'Salário';
    lblReciboPagamentoSAL_BASE_2.Caption := 'Salário';
    lblReciboPagamentoSAL_BASE2.Caption := 'Base';
    lblReciboPagamentoSAL_BASE2_2.Caption := 'Base';
    lblReciboPagamentoSAL_PART1.Caption := 'Sal. Contr.';
    lblReciboPagamentoSAL_PART1_2.Caption := 'Sal. Contr.';
    lblReciboPagamentoSAL_PART2.Caption := 'Prev. Privada';
    lblReciboPagamentoSAL_PART2_2.Caption := 'Prev. Privada';
    lblReciboPagamentoBASE_IRRF.Caption := 'Sal. Base';
    lblReciboPagamentoBASE_IRRF_2.Caption := 'Sal. Base';
    lblReciboPagamentoFGTS_MES.Visible := true;
    lblReciboPagamentoFGTS_MES_2.Visible := true;
    lblReciboPagamentoFGTS_MES2.Visible := true;
    lblReciboPagamentoFGTS_MES2_2.Visible := true;
    dbtxtReciboPagamentoFGTS_MES.Visible := true;
    dbtxtReciboPagamentoFGTS_MES_2.Visible := true;
    lblReciboPagamentoMARGEM1.Visible := true;
    lblReciboPagamentoMARGEM1_2.Visible := true;
    lblReciboPagamentoMARGEM12.Visible := true;
    lblReciboPagamentoMARGEM12_2.Visible := true;
//    lblReciboPagamentoMARGEM2.Visible := true;
//    lblReciboPagamentoMARGEM2_2.Visible := true;
//    lblReciboPagamentoMARGEM22.Visible := true;
//    lblReciboPagamentoMARGEM22_2.Visible := true;
    dbtxtReciboPagamentoMARGEM1.Visible := true;
    dbtxtReciboPagamentoMARGEM1_2.Visible := true;
//    dbtxtReciboPagamentoMARGEM2.Visible := true;
//    dbtxtReciboPagamentoMARGEM2_2.Visible := true;

    lblReciboPagamentoEmprestimo.Visible := true;
    lblReciboPagamentoFuncefParcela.Visible := true;
    lblReciboPagamentoSuspensa.Visible := true;
    dbtxtReciboPagamentoEmprestimo.Visible := true;

    lblReciboPagamentoExcesso.Visible := true;
    lblReciboPagamentoDebito.Visible := true;
    dbtxtReciboPagamentoExcessoDebito.Visible := true;

    lblReciboPagamentoSalBaseCargoEstrat.Visible := true;
    lblReciboPagamentoEstrategico.Visible := true;
    dbtxtReciboPagamentoSalBase_Cargo.Visible := true;

    // SOL 155155 Kintana 1200776 Otacilio Aquino Inicio
    lblBanco.Visible      := True;
    lblBanco2.Visible     := True;
    lblAdmissao.Visible   := True;
    lblAdmissao_2.Visible := True;

    dbtxtReciboPagamentoNUMBANCO.Visible         := True;
    dbtxtReciboPagamentoNUMBANCO_2.Visible       := True;
    dbtxtReciboPagamentoDATAEFETIVACAO.Visible   := True;
    dbtxtReciboPagamentoDATAEFETIVACAO_2.Visible := True;

    ppLine46.Visible := True;
    // SOL 155155 Kintana 1200776 Otacilio Aquino Fim


  end
  else
  begin
    lblReciboPagamentoC_CUSTO.Caption := 'Natureza do Serviço';
    lblReciboPagamentoC_CUSTO_2.Caption := 'Natureza do Serviço';
    lblReciboPagamentoC_CUSTO2.Caption := 'Natureza do Serviço';
    lblReciboPagamentoC_CUSTO2_2.Caption := 'Natureza do Serviço';
    lblReciboPagamentoAgencia.Caption := 'Banco/Agência';
    lblReciboPagamentoAgencia_2.Caption := 'Banco/Agência';
    lblReciboPagamentoCARGO.Caption := 'Nº de Inscrição no INSS                 CPF';
    lblReciboPagamentoCARGO_2.Caption := 'Nº de Inscrição no INSS                 CPF';
    lblReciboPagamentoSFAM.Visible := false;
    lblReciboPagamentoSFAM_2.Visible := false;
    dbtxtReciboPagamentoSFAM.Visible := false;
    dbtxtReciboPagamentoSFAM_2.Visible := false;
    lblReciboPagamentoSAL_BASE.Caption := 'Remun.';
    lblReciboPagamentoSAL_BASE_2.Caption := 'Remun.';
    lblReciboPagamentoSAL_BASE2.Caption := '';
    lblReciboPagamentoSAL_BASE2_2.Caption := '';
    lblReciboPagamentoSAL_PART1.Caption := 'Base Calc.';
    lblReciboPagamentoSAL_PART1_2.Caption := 'Base Calc.';
    lblReciboPagamentoSAL_PART2.Caption := 'do ISS';
    lblReciboPagamentoSAL_PART2_2.Caption := 'do ISS';
    lblReciboPagamentoBASE_IRRF.Caption := 'Base Calc.';
    lblReciboPagamentoBASE_IRRF_2.Caption := 'Base Calc.';
    lblReciboPagamentoFGTS_MES.Visible := false;
    lblReciboPagamentoFGTS_MES_2.Visible := false;
    lblReciboPagamentoFGTS_MES2.Visible := false;
    lblReciboPagamentoFGTS_MES2_2.Visible := false;
    dbtxtReciboPagamentoFGTS_MES.Visible := false;
    dbtxtReciboPagamentoFGTS_MES_2.Visible := false;
    lblReciboPagamentoMARGEM1.Visible := false;
    lblReciboPagamentoMARGEM1_2.Visible := false;
    lblReciboPagamentoMARGEM12.Visible := false;
    lblReciboPagamentoMARGEM12_2.Visible := false;
//    lblReciboPagamentoMARGEM2.Visible := false;
//    lblReciboPagamentoMARGEM2_2.Visible := false;
//    lblReciboPagamentoMARGEM22.Visible := false;
//    lblReciboPagamentoMARGEM22_2.Visible := false;
    dbtxtReciboPagamentoMARGEM1.Visible := false;
    dbtxtReciboPagamentoMARGEM1_2.Visible := false;
//    dbtxtReciboPagamentoMARGEM2.Visible := false;
//    dbtxtReciboPagamentoMARGEM2_2.Visible := false;


    lblReciboPagamentoEmprestimo_2.Visible := false;
    lblReciboPagamentoFuncefParcela_2.Visible := false;
    lblReciboPagamentoSuspensa_2.Visible := false;
    dbtxtReciboPagamentoEmprestimo_2.Visible := false;

    lblReciboPagamentoExcesso_2.Visible := false;
    lblReciboPagamentoDebito_2.Visible := false;
    dbtxtReciboPagamentoExcessoDebito_2.Visible := false;

    lblReciboPagamentoSalBaseCargoEstrat_2.Visible := false;
    lblReciboPagamentoEstrategico_2.Visible := false;
    dbtxtReciboPagamentoSalBase_Cargo_2.Visible := false;

    // SOL 155155 Kintana 1200776 Otacilio Aquino Inicio
    lblBanco.Visible      := False;
    lblBanco2.Visible     := False;
    lblAdmissao.Visible   := False;
    lblAdmissao_2.Visible := False;

    dbtxtReciboPagamentoNUMBANCO.Visible         := False;
    dbtxtReciboPagamentoNUMBANCO_2.Visible       := False;
    dbtxtReciboPagamentoDATAEFETIVACAO.Visible   := False;
    dbtxtReciboPagamentoDATAEFETIVACAO_2.Visible := False;

    ppLine46.Visible := False;
    // SOL 155155 Kintana 1200776 Otacilio Aquino Fim
  end;
end;

procedure TRptReciboPagamentoFuncef.rpReciboPagamentoSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptReciboPagamentoFuncef.MontarDadosRelatorio(iVez : integer; sMesAno : string);   // edilaine - SOL 217186-15443 / KTN 2053651
var
  sMatricula: string;
  rSalBase, rBaseINSS, rBaseFGTS, rFGTSMes, rBaseIRRF, rProventos, rDescontos,
  rMargem1, rMargem2, rSalPart, rSalBaseCargoEstr, rEmprestimoFuncef, rExcessoDebito: real;
  {iPagina,} iRubrica: integer;     // edilaine - SOL 217186-15443 / KTN 2053651
  Marca: TBookmark;
  bTemDesconto: boolean;
  sDtExtenso : string;    // edilaine - SOL 217186-15443 / KTN 2053651
begin

  sDtExtenso := FU.MesExtensoAno( fu.RetornaAnoMes( StrToDate(sMesAno) ) );   // edilaine - SOL 217186-15443 / KTN 2053651

  if iVez = 0 then               // edilaine - SOL 217186-15443 / KTN 2053651
     sqlReciboPagamento.Open;

  if not(dmCds.Cds.IsEmpty) then
  begin
    CdsReciboPagamento.IndexName := '';
    //iPagina := 1;                    // edilaine - SOL 217186-15443 / KTN 2053651
    while not(dmCds.Cds.EOF) do
    begin
      sMatricula := dmCds.Cds.FieldByName('MATRICULA').asString;
      Marca := dmCds.Cds.GetBookMark;
      bTemDesconto := false;

      // Calculo todas as páginas do Funcionário
      repeat
        if (dmCds.Cds.FieldByName('TIPORUBRICA').asInteger = 1) then
          bTemDesconto := true;
        dmCds.Cds.Next;
      until (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
            (dmCds.Cds.EOF);

      dmCds.Cds.GotoBookmark(Marca);
      dmCds.Cds.FreeBookmark(Marca);

      rBaseINSS:=0; rSalPart:=0; rBaseFGTS:=0; rFGTSMes:=0; rBaseIRRF:=0;
      rProventos:=0; rDescontos:=0; rSalBaseCargoEstr:=0; rEmprestimoFuncef:=0; rExcessoDebito:=0;

      // Monto as informações em Páginas por Funcionário
      repeat
        CdsReciboPagamento.Append;

        CdsReciboPagamento.FieldByName('MESANO').asString := sDtExtenso; // edilaine - SOL 217186-15443 / KTN 2053651

        CdsReciboPagamento.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('EMPREGADO').asString;
        CdsReciboPagamento.FieldByName('PAGINA').asInteger := iPagina;
        CdsReciboPagamento.FieldByName('MATRICULA').asString := dmCds.Cds.FieldByName('MATRICULA').asString;
        CdsReciboPagamento.FieldByName('CODCENTROCUSTO').asString := dmCds.Cds.FieldByName('CODCENTROCUSTO').asString;
        CdsReciboPagamento.FieldByName('NUMAGENCIA').asString := dmCds.Cds.FieldByName('NUMAGENCIA').asString;
        CdsReciboPagamento.FieldByName('NUMCONTASALARIO').asString := dmCds.Cds.FieldByName('NUMCONTASALARIO').asString;
        CdsReciboPagamento.FieldByName('TIPOCONTRATO').asString := dmCds.Cds.FieldByName('TIPOCONTRATO').asString;
        CdsReciboPagamento.FieldByName('NUMDEPSALF').asInteger := dmCds.Cds.FieldByName('NUMDEPSALF').asInteger;
        CdsReciboPagamento.FieldByName('NUMDEPIRRF').asInteger := dmCds.Cds.FieldByName('NUMDEPIRRF').asInteger;
        CdsReciboPagamento.FieldByName('EMPRESA').asString := dmCds.Cds.FieldByName('EMPRESA').asString;
        CdsReciboPagamento.FieldByName('CGC').asString := dmCds.Cds.FieldByName('CGC').asString;

        if (dmCds.Cds.FieldByName('TIPOCONTRATO').asString <> 'A') then
        begin
          CdsReciboPagamento.FieldByName('C_CUSTO').asString := dmCds.Cds.FieldByName('NOMECENTROCUSTO').asString;
          CdsReciboPagamento.FieldByName('CARGO').asString := trim(dmCds.Cds.FieldByName('TITULO').asString) +
            trim(dmCds.Cds.FieldByName('FUNCAO').asString);
          CdsReciboPagamento.FieldByName('NUMAGENCIA').asString := dmCds.Cds.FieldByName('NUMAGENCIA').asString;
        end
        else
        begin
          CdsReciboPagamento.FieldByName('C_CUSTO').asString := dmCds.Cds.FieldByName('TITULO').asString;
          CdsReciboPagamento.FieldByName('CARGO').asString :=
            dmCds.Cds.FieldByName('PIS').asString +
            FU.Replicate(' ', 32)+
            dmCds.Cds.FieldByName('CPF').asString;
          CdsReciboPagamento.FieldByName('NUMAGENCIA').asString :=
            dmCds.Cds.FieldByName('NUMBANCO').asString + ' / ' +
            dmCds.Cds.FieldByName('NUMAGENCIA').asString;
        end;

        // SOL 155155 Kintana 1200776 Otacilio Aquino
        CdsReciboPagamento.FieldByName('DATAEFETIVACAO').asString := dmCds.Cds.FieldByName('DATAEFETIVACAO').AsString;
        CdsReciboPagamento.FieldByName('NUMBANCO').asString       := dmCds.Cds.FieldByName('NUMBANCO').AsString;

        rSalBase := dmCds.Cds.FieldByName('SALBASE').asFloat;
        rMargem1 := dmCds.Cds.FieldByName('VALORMARGEM1').asFloat;
        rMargem2 := dmCds.Cds.FieldByName('VALORMARGEM2').asFloat;

        // Preencho cada Linha da Página do Funcionário com suas Rubricas
        iRubrica := 1;
        repeat
          if (dmCds.Cds.FieldByName('TIPORUBRICA').asInteger < 2) then
          begin
            if (bTemDesconto) and (dmCds.Cds.FieldByName('TIPORUBRICA').asInteger = 1) then
            begin
              Inc(iRubrica);
              bTemDesconto := false;
            end;

            CdsReciboPagamento.FieldByName('CODRUBRICA'+IntToStr(iRubrica)).asString := dmCds.Cds.FieldByName('CODRUBRICACLIENTE').asString;
            CdsReciboPagamento.FieldByName('RUBRICA'+IntToStr(iRubrica)).asString := dmCds.Cds.FieldByName('RUBRICA').asString;
            CdsReciboPagamento.FieldByName('REFERENCIA'+IntToStr(iRubrica)).asString := dmCds.Cds.FieldByName('REFERENCIA').asString;

            if (dmCds.Cds.FieldByName('TIPORUBRICA').asInteger = 0) then
            begin
              CdsReciboPagamento.FieldByName('PROVENTO'+IntToStr(iRubrica)).asFloat := dmCds.Cds.FieldByName('VALOR').asFloat;
              rProventos := rProventos + dmCds.Cds.FieldByName('VALOR').asFloat;
            end
            else
            begin
              CdsReciboPagamento.FieldByName('DESCONTO'+IntToStr(iRubrica)).asFloat := dmCds.Cds.FieldByName('VALOR').asFloat;
              rDescontos := rDescontos + dmCds.Cds.FieldByName('VALOR').asFloat;
            end;
            Inc(iRubrica);
          end
          else
          begin
            // Base do INSS
            if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '60056') then
              rBaseINSS := rBaseINSS + dmCds.Cds.FieldByName('VALOR').asFloat
            else
            // Base Prev. Priv.
            if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '90011') then
              rSalPart := rSalPart + dmCds.Cds.FieldByName('VALOR').asFloat
            else
            // FGTS do Mês
            if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '40695') or
               (dmCds.Cds.FieldByName('CODRUBRICA').asString = '43696') or
               (dmCds.Cds.FieldByName('CODRUBRICA').asString = '43700') then
              rFGTSMes := rFGTSMes + dmCds.Cds.FieldByName('VALOR').asFloat
            else
            // Remuneração para Autônomo
            if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '60052') and
               (dmCds.Cds.FieldByName('TIPOCONTRATO').asString = 'A') then
              rSalBase := rSalBase + dmCds.Cds.FieldByName('VALOR').asFloat
            else
            // Base do FGTS
            if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '60695') or
               (dmCds.Cds.FieldByName('CODRUBRICA').asString = '62022') then
              rBaseFGTS := rBaseFGTS + dmCds.Cds.FieldByName('VALOR').asFloat
            else
            // Base do IRRF
            if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '60026') or
               (dmCds.Cds.FieldByName('CODRUBRICA').asString = '60028') or
               (dmCds.Cds.FieldByName('CODRUBRICA').asString = '62026') then
              rBaseIRRF := rBaseIRRF + dmCds.Cds.FieldByName('VALOR').asFloat
            else
              {
              N. Sol..........: 135471
              N. Kintana......: 806005
              Data............: 14/05/2010
              Responsável.....: Marcos Luiz de Jesus
              }
            // Salario Base + Cargo Estratégico
            if (dmCds.Cds.FieldByName('CODRUBRICACLIENTE').asString = '08200') Then
               rSalBaseCargoEstr := rSalBaseCargoEstr + dmCds.Cds.FieldByName('VALOR').asFloat
            else
            // Empréstimo Funcef Parcela Suspensa
            if (dmCds.Cds.FieldByName('CODRUBRICACLIENTE').asString = '39800') Then
               rEmprestimoFuncef := rEmprestimoFuncef + dmCds.Cds.FieldByName('VALOR').asFloat
            else            
            // Excesso de Débito
            if (dmCds.Cds.FieldByName('CODRUBRICACLIENTE').asString = '39884') Then
               rExcessoDebito :=  rExcessoDebito + dmCds.Cds.FieldByName('VALOR').asFloat;
            {N. Sol..........: 135471 FIM}
          end;
          sMatricula := dmCds.Cds.FieldByName('MATRICULA').asString;

          dmCds.Cds.Next;
        until (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
              (dmCds.Cds.EOF) or
              ((sMatricula = dmCds.Cds.FieldByName('MATRICULA').asString) and
               (dmCds.Cds.FieldByName('TIPORUBRICA').asInteger < 2) and
               (iRubrica = 26));

        if (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
           (dmCds.Cds.EOF) then
        begin
          CdsReciboPagamento.FieldByName('SALBASE').asFloat := rSalBase;
          CdsReciboPagamento.FieldByName('VALORMARGEM1').asFloat := rMargem1;
          CdsReciboPagamento.FieldByName('VALORMARGEM2').asFloat := rMargem2;
          CdsReciboPagamento.FieldByName('BASEINSS').asFloat := rBaseINSS;
          CdsReciboPagamento.FieldByName('SALPART').asFloat := rSalPart;
          CdsReciboPagamento.FieldByName('BASEFGTS').asFloat := rBaseFGTS;
          CdsReciboPagamento.FieldByName('FGTSMES').asFloat := rFGTSMes;
          CdsReciboPagamento.FieldByName('BASEIRRF').asFloat := rBaseIRRF;
          CdsReciboPagamento.FieldByName('TOT_PROVENTOS').asFloat := rProventos;
          CdsReciboPagamento.FieldByName('TOT_DESCONTOS').asFloat := rDescontos;
          CdsReciboPagamento.FieldByName('TOT_GERAL').asString :=
            FU.ValStr(rProventos - rDescontos, 12, 2, true, ',');

          CdsReciboPagamento.FieldbyName('SALBASE_CARGOESTR').asFloat   := rSalBaseCargoEstr;
          CdsReciboPagamento.FieldbyName('EMPRESTIMOFUNCEF').asFloat    := rEmprestimoFuncef;
          CdsReciboPagamento.FieldbyName('EXCESSODEBITO').asFloat       := rExcessoDebito;

        end
        else
          CdsReciboPagamento.FieldByName('TOT_GERAL').asString := 'CONTINUA';

        CdsReciboPagamento.Post;

        Inc(iPagina);
      until (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
            (dmCds.Cds.EOF);
    end;
  {  MontarDados_Suprimido;              // edilaine - SOL 217186-15443 / KTN 2053651 - comentario inicio
  end
  else
  begin
    CdsReciboPagamento.Insert;
    CdsReciboPagamento.Post;
  }  // edilaine - SOL 217186-15443 / KTN 2053651 - comentario fim
  end;
end;

procedure TRptReciboPagamentoFuncef.MontarDados_Suprimido;
var
  c: byte;
  CdsAux: TCMClientDataSet;
begin
  // Se for uma pessoa, não há motivo para suprimir os dados
  if (CdsReciboPagamento.RecordCount = 1) then
    exit;

  CdsAux := TCMClientDataSet.Create(Self);
  try
    CdsAux.Data := CdsReciboPagamento.Data;
    CdsAux.First;
    CdsReciboPagamento.EmptyDataSet;
    repeat
      CdsReciboPagamento.Append;
      for c:=0 to (CdsAux.FieldCount div 2)-1 do
        CdsReciboPagamento.Fields[c].Value := CdsAux.Fields[c].Value;
      CdsReciboPagamento.Post;

      CdsAux.Next; // Pegar a próxima pessoa/página do Recibo Auxiliar

      if not(CdsAux.EOF) then
      begin
        CdsReciboPagamento.Edit;
        for c:=0 to (CdsAux.FieldCount div 2)-1 do
          CdsReciboPagamento.FieldByName(CdsAux.Fields[c].FieldName+'_2').Value :=
            CdsAux.Fields[c].Value;
        CdsReciboPagamento.Post;

        CdsAux.Next; // Pegar a próxima pessoa/página do Recibo Auxiliar
      end;
    until (CdsAux.EOF);
  finally
    CdsAux.Free;
  end;  
end;

end.
