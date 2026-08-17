unit RDBCExcesso;

{--------------------------------------------------------------------------------------------------
Rotina.........: *.dfm (sqlDemonstrativoDBCEX e rpDemonstrativoDBCEX - campo mesano), MontarDadosRelatorio, CrmRptCMBeforePrint
N. Sol..........: 217186-15443
N. Kintana......: 2053651
Data............: 12/01/2015
Responsável.....: Edilaine Ferraresi
Descrição.......: impressão do contra-cheque para mais de um mês
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 135037
Nº KINTANA..: 801484
Data........: 26/11/2010
Responsável.: Thaise Amaral Martins
Descrição...: Tela criada para impressão de novo relatório contendo as rubricas
              excesso de débito.
-------------------------------------------------------------------------------------------------- }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ppBands, ppClass, ppCtrls, ppPrnabl,
  ppCache, ppProd, ppReport, Wwdatsrc, ppDB, ppComm, ppRelatv, ppDBPipe,
  ppDBBDE, USistema;

type
  TRptDBCExcesso = class(TFrmCmReport)
    ppDemonstrativoDBCEX: TppBDEPipeline;
    ppDemonstrativoDBCppField1: TppField;
    ppDemonstrativoDBCppField2: TppField;
    ppDemonstrativoDBCppField3: TppField;
    ppDemonstrativoDBCppField4: TppField;
    ppDemonstrativoDBCppField5: TppField;
    ppDemonstrativoDBCppField6: TppField;
    ppDemonstrativoDBCppField7: TppField;
    ppDemonstrativoDBCppField8: TppField;
    ppDemonstrativoDBCppField9: TppField;
    ppDemonstrativoDBCppField10: TppField;
    ppDemonstrativoDBCppField11: TppField;
    ppDemonstrativoDBCppField12: TppField;
    ppDemonstrativoDBCppField13: TppField;
    ppDemonstrativoDBCppField14: TppField;
    ppDemonstrativoDBCppField15: TppField;
    ppDemonstrativoDBCppField16: TppField;
    ppDemonstrativoDBCppField17: TppField;
    ppDemonstrativoDBCppField18: TppField;
    ppDemonstrativoDBCppField19: TppField;
    ppDemonstrativoDBCppField20: TppField;
    ppDemonstrativoDBCppField21: TppField;
    ppDemonstrativoDBCppField22: TppField;
    ppDemonstrativoDBCppField23: TppField;
    ppDemonstrativoDBCppField24: TppField;
    ppDemonstrativoDBCppField25: TppField;
    ppDemonstrativoDBCppField26: TppField;
    ppDemonstrativoDBCppField27: TppField;
    ppDemonstrativoDBCppField28: TppField;
    ppDemonstrativoDBCppField29: TppField;
    ppDemonstrativoDBCppField30: TppField;
    ppDemonstrativoDBCppField31: TppField;
    ppDemonstrativoDBCppField32: TppField;
    ppDemonstrativoDBCppField33: TppField;
    ppDemonstrativoDBCppField34: TppField;
    ppDemonstrativoDBCppField35: TppField;
    ppDemonstrativoDBCppField36: TppField;
    ppDemonstrativoDBCppField37: TppField;
    ppDemonstrativoDBCppField38: TppField;
    ppDemonstrativoDBCppField39: TppField;
    ppDemonstrativoDBCppField40: TppField;
    ppDemonstrativoDBCppField41: TppField;
    ppDemonstrativoDBCppField42: TppField;
    ppDemonstrativoDBCppField43: TppField;
    ppDemonstrativoDBCppField44: TppField;
    ppDemonstrativoDBCppField45: TppField;
    ppDemonstrativoDBCppField46: TppField;
    ppDemonstrativoDBCppField47: TppField;
    ppDemonstrativoDBCppField48: TppField;
    ppDemonstrativoDBCppField49: TppField;
    ppDemonstrativoDBCppField50: TppField;
    ppDemonstrativoDBCppField51: TppField;
    ppDemonstrativoDBCppField52: TppField;
    ppDemonstrativoDBCppField53: TppField;
    ppDemonstrativoDBCppField54: TppField;
    ppDemonstrativoDBCppField55: TppField;
    ppDemonstrativoDBCppField56: TppField;
    ppDemonstrativoDBCppField57: TppField;
    ppDemonstrativoDBCppField58: TppField;
    ppDemonstrativoDBCppField59: TppField;
    ppDemonstrativoDBCppField60: TppField;
    ppDemonstrativoDBCppField61: TppField;
    ppDemonstrativoDBCppField62: TppField;
    ppDemonstrativoDBCppField63: TppField;
    ppDemonstrativoDBCppField64: TppField;
    ppDemonstrativoDBCppField65: TppField;
    ppDemonstrativoDBCppField66: TppField;
    ppDemonstrativoDBCppField67: TppField;
    ppDemonstrativoDBCppField68: TppField;
    ppDemonstrativoDBCppField69: TppField;
    ppDemonstrativoDBCppField70: TppField;
    ppDemonstrativoDBCppField71: TppField;
    ppDemonstrativoDBCppField72: TppField;
    ppDemonstrativoDBCppField73: TppField;
    ppDemonstrativoDBCppField74: TppField;
    ppDemonstrativoDBCppField75: TppField;
    ppDemonstrativoDBCppField76: TppField;
    ppDemonstrativoDBCppField77: TppField;
    ppDemonstrativoDBCppField78: TppField;
    ppDemonstrativoDBCppField79: TppField;
    ppDemonstrativoDBCppField80: TppField;
    ppDemonstrativoDBCppField81: TppField;
    ppDemonstrativoDBCppField82: TppField;
    ppDemonstrativoDBCppField83: TppField;
    ppDemonstrativoDBCppField84: TppField;
    ppDemonstrativoDBCppField85: TppField;
    ppDemonstrativoDBCppField86: TppField;
    ppDemonstrativoDBCppField87: TppField;
    ppDemonstrativoDBCppField88: TppField;
    ppDemonstrativoDBCppField89: TppField;
    ppDemonstrativoDBCppField90: TppField;
    ppDemonstrativoDBCppField91: TppField;
    ppDemonstrativoDBCppField92: TppField;
    ppDemonstrativoDBCppField93: TppField;
    ppDemonstrativoDBCppField94: TppField;
    ppDemonstrativoDBCppField95: TppField;
    ppDemonstrativoDBCppField96: TppField;
    ppDemonstrativoDBCppField97: TppField;
    ppDemonstrativoDBCppField98: TppField;
    ppDemonstrativoDBCppField99: TppField;
    ppDemonstrativoDBCppField100: TppField;
    ppDemonstrativoDBCppField101: TppField;
    ppDemonstrativoDBCppField102: TppField;
    ppDemonstrativoDBCppField103: TppField;
    ppDemonstrativoDBCppField104: TppField;
    ppDemonstrativoDBCppField105: TppField;
    ppDemonstrativoDBCppField106: TppField;
    ppDemonstrativoDBCppField107: TppField;
    ppDemonstrativoDBCppField108: TppField;
    ppDemonstrativoDBCppField109: TppField;
    ppDemonstrativoDBCppField110: TppField;
    ppDemonstrativoDBCppField111: TppField;
    ppDemonstrativoDBCppField112: TppField;
    ppDemonstrativoDBCppField113: TppField;
    ppDemonstrativoDBCppField114: TppField;
    ppDemonstrativoDBCppField115: TppField;
    ppDemonstrativoDBCppField116: TppField;
    ppDemonstrativoDBCppField117: TppField;
    ppDemonstrativoDBCppField118: TppField;
    ppDemonstrativoDBCppField119: TppField;
    ppDemonstrativoDBCppField120: TppField;
    ppDemonstrativoDBCppField121: TppField;
    ppDemonstrativoDBCppField122: TppField;
    ppDemonstrativoDBCppField123: TppField;
    ppDemonstrativoDBCppField124: TppField;
    ppDemonstrativoDBCppField125: TppField;
    ppDemonstrativoDBCppField126: TppField;
    ppDemonstrativoDBCppField127: TppField;
    ppDemonstrativoDBCppField128: TppField;
    ppDemonstrativoDBCppField129: TppField;
    ppDemonstrativoDBCppField130: TppField;
    ppDemonstrativoDBCppField131: TppField;
    ppDemonstrativoDBCppField132: TppField;
    ppDemonstrativoDBCppField133: TppField;
    ppDemonstrativoDBCppField134: TppField;
    ppDemonstrativoDBCppField135: TppField;
    ppDemonstrativoDBCppField136: TppField;
    ppDemonstrativoDBCppField137: TppField;
    ppDemonstrativoDBCppField138: TppField;
    ppDemonstrativoDBCppField139: TppField;
    ppDemonstrativoDBCppField140: TppField;
    ppDemonstrativoDBCppField141: TppField;
    ppDemonstrativoDBCppField142: TppField;
    ppDemonstrativoDBCppField143: TppField;
    ppDemonstrativoDBCppField144: TppField;
    ppDemonstrativoDBCppField145: TppField;
    ppDemonstrativoDBCppField146: TppField;
    ppDemonstrativoDBCppField147: TppField;
    ppDemonstrativoDBCppField148: TppField;
    ppDemonstrativoDBCppField149: TppField;
    ppDemonstrativoDBCppField150: TppField;
    ppDemonstrativoDBCppField151: TppField;
    ppDemonstrativoDBCppField152: TppField;
    ppDemonstrativoDBCppField153: TppField;
    ppDemonstrativoDBCppField154: TppField;
    ppDemonstrativoDBCppField155: TppField;
    ppDemonstrativoDBCppField156: TppField;
    ppDemonstrativoDBCppField157: TppField;
    ppDemonstrativoDBCppField158: TppField;
    ppDemonstrativoDBCppField159: TppField;
    ppDemonstrativoDBCppField160: TppField;
    ppDemonstrativoDBCppField161: TppField;
    ppDemonstrativoDBCppField162: TppField;
    ppDemonstrativoDBCppField163: TppField;
    ppDemonstrativoDBCppField164: TppField;
    ppDemonstrativoDBCppField165: TppField;
    ppDemonstrativoDBCppField166: TppField;
    ppDemonstrativoDBCppField167: TppField;
    ppDemonstrativoDBCppField168: TppField;
    ppDemonstrativoDBCppField169: TppField;
    ppDemonstrativoDBCppField170: TppField;
    ppDemonstrativoDBCppField171: TppField;
    ppDemonstrativoDBCppField172: TppField;
    ppDemonstrativoDBCppField173: TppField;
    ppDemonstrativoDBCppField174: TppField;
    ppDemonstrativoDBCppField175: TppField;
    ppDemonstrativoDBCppField176: TppField;
    ppDemonstrativoDBCppField177: TppField;
    ppDemonstrativoDBCppField178: TppField;
    ppDemonstrativoDBCppField179: TppField;
    ppDemonstrativoDBCppField180: TppField;
    ppDemonstrativoDBCppField181: TppField;
    ppDemonstrativoDBCppField182: TppField;
    ppDemonstrativoDBCppField183: TppField;
    ppDemonstrativoDBCppField184: TppField;
    ppDemonstrativoDBCppField185: TppField;
    ppDemonstrativoDBCppField186: TppField;
    ppDemonstrativoDBCppField187: TppField;
    ppDemonstrativoDBCppField188: TppField;
    ppDemonstrativoDBCppField189: TppField;
    ppDemonstrativoDBCppField190: TppField;
    ppDemonstrativoDBCppField191: TppField;
    ppDemonstrativoDBCppField192: TppField;
    ppDemonstrativoDBCppField193: TppField;
    ppDemonstrativoDBCppField194: TppField;
    ppDemonstrativoDBCppField195: TppField;
    ppDemonstrativoDBCppField196: TppField;
    ppDemonstrativoDBCppField197: TppField;
    ppDemonstrativoDBCppField198: TppField;
    ppDemonstrativoDBCppField199: TppField;
    ppDemonstrativoDBCppField200: TppField;
    ppDemonstrativoDBCppField201: TppField;
    ppDemonstrativoDBCppField202: TppField;
    ppDemonstrativoDBCppField203: TppField;
    ppDemonstrativoDBCppField204: TppField;
    ppDemonstrativoDBCppField205: TppField;
    ppDemonstrativoDBCppField206: TppField;
    ppDemonstrativoDBCppField207: TppField;
    ppDemonstrativoDBCppField208: TppField;
    ppDemonstrativoDBCppField209: TppField;
    ppDemonstrativoDBCppField210: TppField;
    ppDemonstrativoDBCppField211: TppField;
    ppDemonstrativoDBCppField212: TppField;
    ppDemonstrativoDBCppField213: TppField;
    ppDemonstrativoDBCppField214: TppField;
    ppDemonstrativoDBCppField215: TppField;
    ppDemonstrativoDBCppField216: TppField;
    ppDemonstrativoDBCppField217: TppField;
    ppDemonstrativoDBCppField218: TppField;
    ppDemonstrativoDBCppField219: TppField;
    ppDemonstrativoDBCppField220: TppField;
    ppDemonstrativoDBCppField221: TppField;
    ppDemonstrativoDBCppField222: TppField;
    ppDemonstrativoDBCppField223: TppField;
    ppDemonstrativoDBCppField224: TppField;
    ppDemonstrativoDBCppField225: TppField;
    ppDemonstrativoDBCppField226: TppField;
    ppDemonstrativoDBCppField227: TppField;
    ppDemonstrativoDBCppField228: TppField;
    ppDemonstrativoDBCppField229: TppField;
    ppDemonstrativoDBCppField230: TppField;
    ppDemonstrativoDBCppField231: TppField;
    ppDemonstrativoDBCppField232: TppField;
    ppDemonstrativoDBCppField233: TppField;
    ppDemonstrativoDBCppField234: TppField;
    ppDemonstrativoDBCppField235: TppField;
    ppDemonstrativoDBCppField236: TppField;
    ppDemonstrativoDBCppField237: TppField;
    ppDemonstrativoDBCppField238: TppField;
    ppDemonstrativoDBCppField239: TppField;
    ppDemonstrativoDBCppField240: TppField;
    ppDemonstrativoDBCppField241: TppField;
    ppDemonstrativoDBCppField242: TppField;
    ppDemonstrativoDBCppField243: TppField;
    ppDemonstrativoDBCppField244: TppField;
    ppDemonstrativoDBCppField245: TppField;
    ppDemonstrativoDBCppField246: TppField;
    ppDemonstrativoDBCppField247: TppField;
    ppDemonstrativoDBCppField248: TppField;
    ppDemonstrativoDBCppField249: TppField;
    ppDemonstrativoDBCppField250: TppField;
    ppDemonstrativoDBCppField251: TppField;
    ppDemonstrativoDBCppField252: TppField;
    ppDemonstrativoDBCppField253: TppField;
    ppDemonstrativoDBCppField254: TppField;
    ppDemonstrativoDBCppField255: TppField;
    ppDemonstrativoDBCppField256: TppField;
    ppDemonstrativoDBCppField257: TppField;
    ppDemonstrativoDBCppField258: TppField;
    ppDemonstrativoDBCppField259: TppField;
    ppDemonstrativoDBCppField260: TppField;
    ppDemonstrativoDBCppField261: TppField;
    ppDemonstrativoDBCppField262: TppField;
    ppDemonstrativoDBCppField263: TppField;
    ppDemonstrativoDBCppField264: TppField;
    ppDemonstrativoDBCppField265: TppField;
    ppDemonstrativoDBCppField266: TppField;
    ppDemonstrativoDBCppField267: TppField;
    ppDemonstrativoDBCppField268: TppField;
    ppDemonstrativoDBCppField269: TppField;
    ppDemonstrativoDBCppField270: TppField;
    ppDemonstrativoDBCppField271: TppField;
    ppDemonstrativoDBCppField272: TppField;
    ppDemonstrativoDBCppField273: TppField;
    ppDemonstrativoDBCppField274: TppField;
    ppDemonstrativoDBCppField275: TppField;
    ppDemonstrativoDBCppField276: TppField;
    ppDemonstrativoDBCppField277: TppField;
    ppDemonstrativoDBCppField278: TppField;
    ppDemonstrativoDBCppField279: TppField;
    ppDemonstrativoDBCppField280: TppField;
    ppDemonstrativoDBCppField281: TppField;
    ppDemonstrativoDBCppField282: TppField;
    ppDemonstrativoDBCppField283: TppField;
    ppDemonstrativoDBCppField284: TppField;
    ppDemonstrativoDBCppField285: TppField;
    ppDemonstrativoDBCppField286: TppField;
    ppDemonstrativoDBCppField287: TppField;
    ppDemonstrativoDBCppField288: TppField;
    ppDemonstrativoDBCppField289: TppField;
    ppDemonstrativoDBCppField290: TppField;
    ppDemonstrativoDBCppField291: TppField;
    ppDemonstrativoDBCppField292: TppField;
    ppDemonstrativoDBCppField293: TppField;
    ppDemonstrativoDBCppField294: TppField;
    ppDemonstrativoDBCppField295: TppField;
    ppDemonstrativoDBCppField296: TppField;
    ppDemonstrativoDBCppField297: TppField;
    ppDemonstrativoDBCppField298: TppField;
    ppDemonstrativoDBCppField299: TppField;
    ppDemonstrativoDBCppField300: TppField;
    ppDemonstrativoDBCppField301: TppField;
    ppDemonstrativoDBCppField302: TppField;
    ppDemonstrativoDBCppField303: TppField;
    ppDemonstrativoDBCppField304: TppField;
    ppDemonstrativoDBCppField305: TppField;
    ppDemonstrativoDBCppField306: TppField;
    ppDemonstrativoDBCppField307: TppField;
    ppDemonstrativoDBCppField308: TppField;
    ppDemonstrativoDBCppField309: TppField;
    ppDemonstrativoDBCppField310: TppField;
    ppDemonstrativoDBCppField311: TppField;
    ppDemonstrativoDBCppField312: TppField;
    ppDemonstrativoDBCppField313: TppField;
    ppDemonstrativoDBCppField314: TppField;
    dsDemonstrativoDBCEX: TwwDataSource;
    rpDemonstrativoDBCEX: TppReport;
    ppDetailBand2: TppDetailBand;
    ppShape3: TppShape;
    ppShape2: TppShape;
    ppShape1: TppShape;
    ppShape4: TppShape;
    ppLine11: TppLine;
    Figura3: TppImage;
    ppImage4: TppImage;
    ppLabel11: TppLabel;
    ppLabel1: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppShape9: TppShape;
    Figura1: TppImage;
    Figura2: TppImage;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppLine39: TppLine;
    Figura3_2: TppImage;
    ppImage7: TppImage;
    ppLabel39: TppLabel;
    lblReciboPagamentoC_CUSTO2_2: TppLabel;
    ppDBText148: TppDBText;
    ppDBText149: TppDBText;
    ppDBText150: TppDBText;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppShape22: TppShape;
    Figura1_2: TppImage;
    Figura2_2: TppImage;
    ppShape5: TppShape;
    ppLabel5: TppLabel;
    ppLine1: TppLine;
    ppShape6: TppShape;
    ppLabel14: TppLabel;
    ppLine2: TppLine;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape25: TppShape;
    ppShape12: TppShape;
    ppShape24: TppShape;
    ppLabel32: TppLabel;
    ppLabel31: TppLabel;
    ppLabel30: TppLabel;
    ppLabel26: TppLabel;
    ppShape15: TppShape;
    ppShape13: TppShape;
    ppShape10: TppShape;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLabel12: TppLabel;
    ppShape23: TppShape;
    ppLabel13: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel21: TppLabel;
    ppDBText16: TppDBText;
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
    ppDBText17: TppDBText;
    ppLabel22: TppLabel;
    dbtxtReciboPagamentoCODRUBRICA16: TppDBText;
    dbtxtReciboPagamentoRUBRICA16: TppDBText;
    dbtxtReciboPagamentoREFERENCIA16: TppDBText;
    dbtxtReciboPagamentoDESCONTO16: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA17: TppDBText;
    dbtxtReciboPagamentoRUBRICA17: TppDBText;
    dbtxtReciboPagamentoREFERENCIA17: TppDBText;
    dbtxtReciboPagamentoDESCONTO17: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA18: TppDBText;
    dbtxtReciboPagamentoRUBRICA18: TppDBText;
    dbtxtReciboPagamentoREFERENCIA18: TppDBText;
    dbtxtReciboPagamentoDESCONTO18: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA19: TppDBText;
    dbtxtReciboPagamentoRUBRICA24: TppDBText;
    dbtxtReciboPagamentoREFERENCIA19: TppDBText;
    dbtxtReciboPagamentoDESCONTO19: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA20: TppDBText;
    dbtxtReciboPagamentoRUBRICA19: TppDBText;
    dbtxtReciboPagamentoREFERENCIA20: TppDBText;
    dbtxtReciboPagamentoDESCONTO20: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA21: TppDBText;
    dbtxtReciboPagamentoRUBRICA20: TppDBText;
    dbtxtReciboPagamentoREFERENCIA21: TppDBText;
    dbtxtReciboPagamentoDESCONTO21: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA22: TppDBText;
    dbtxtReciboPagamentoRUBRICA21: TppDBText;
    dbtxtReciboPagamentoREFERENCIA22: TppDBText;
    dbtxtReciboPagamentoDESCONTO22: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA23: TppDBText;
    dbtxtReciboPagamentoRUBRICA22: TppDBText;
    dbtxtReciboPagamentoREFERENCIA23: TppDBText;
    dbtxtReciboPagamentoDESCONTO23: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA24: TppDBText;
    dbtxtReciboPagamentoRUBRICA23: TppDBText;
    dbtxtReciboPagamentoREFERENCIA24: TppDBText;
    dbtxtReciboPagamentoDESCONTO24: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA25: TppDBText;
    dbtxtReciboPagamentoRUBRICA25: TppDBText;
    dbtxtReciboPagamentoREFERENCIA25: TppDBText;
    dbtxtReciboPagamentoDESCONTO25: TppDBText;
    ppImage8: TppImage;
    ppLabel27: TppLabel;
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
    ppDBText146: TppDBText;
    ppDBText147: TppDBText;
    ppDBText151: TppDBText;
    ppDBText152: TppDBText;
    ppDBText153: TppDBText;
    ppDBText154: TppDBText;
    ppDBText155: TppDBText;
    ppDBText156: TppDBText;
    ppDBText157: TppDBText;
    ppDBText158: TppDBText;
    ppDBText159: TppDBText;
    ppDBText160: TppDBText;
    ppDBText161: TppDBText;
    ppDBText162: TppDBText;
    ppDBText163: TppDBText;
    ppDBText164: TppDBText;
    ppDBText165: TppDBText;
    ppDBText166: TppDBText;
    ppDBText167: TppDBText;
    ppDBText168: TppDBText;
    ppDBText169: TppDBText;
    ppDBText170: TppDBText;
    ppDBText171: TppDBText;
    ppDBText172: TppDBText;
    ppDBText173: TppDBText;
    ppDBText174: TppDBText;
    ppDBText175: TppDBText;
    ppDBText176: TppDBText;
    ppDBText177: TppDBText;
    ppDBText178: TppDBText;
    ppDBText179: TppDBText;
    ppDBText180: TppDBText;
    ppDBText181: TppDBText;
    ppDBText182: TppDBText;
    ppDBText183: TppDBText;
    ppDBText184: TppDBText;
    ppDBText185: TppDBText;
    ppDBText186: TppDBText;
    ppDBText187: TppDBText;
    ppDBText188: TppDBText;
    ppDBText189: TppDBText;
    ppDBText190: TppDBText;
    ppDBText191: TppDBText;
    ppDBText192: TppDBText;
    ppDBText193: TppDBText;
    ppDBText201: TppDBText;
    ppDBText202: TppDBText;
    ppDBText203: TppDBText;
    ppDBText205: TppDBText;
    ppDBText206: TppDBText;
    ppDBText207: TppDBText;
    ppDBText208: TppDBText;
    ppDBText210: TppDBText;
    ppDBText211: TppDBText;
    ppDBText212: TppDBText;
    ppDBText213: TppDBText;
    ppDBText215: TppDBText;
    ppDBText216: TppDBText;
    ppDBText217: TppDBText;
    ppDBText218: TppDBText;
    ppDBText220: TppDBText;
    ppDBText221: TppDBText;
    ppDBText222: TppDBText;
    ppDBText223: TppDBText;
    ppDBText225: TppDBText;
    ppDBText226: TppDBText;
    ppDBText227: TppDBText;
    ppDBText228: TppDBText;
    ppDBText230: TppDBText;
    ppDBText231: TppDBText;
    ppDBText232: TppDBText;
    ppDBText233: TppDBText;
    ppDBText235: TppDBText;
    ppDBText236: TppDBText;
    ppDBText237: TppDBText;
    ppDBText238: TppDBText;
    ppDBText240: TppDBText;
    ppDBText241: TppDBText;
    ppDBText242: TppDBText;
    ppDBText243: TppDBText;
    ppDBText245: TppDBText;
    ppDBText246: TppDBText;
    ppDBText247: TppDBText;
    ppDBText248: TppDBText;
    ppDBText250: TppDBText;
    ppImage9: TppImage;
    ppDBText132: TppDBText;
    ppLine14: TppLine;
    ppLabel25: TppLabel;
    ppLine20: TppLine;
    ppLabel33: TppLabel;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine17: TppLine;
    ppLine26: TppLine;
    ppLine19: TppLine;
    dbtxtReciboPagamentoCGC: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    sqlDemonstrativoDBCEX: TCMSqlParams;
    CdsDemonstrativoDBCEX: TCMClientDataSet;
    ppLine3: TppLine;
    ppShape7: TppShape;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLabel15: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLine4: TppLine;
    ppDBText6: TppDBText;
    ppMesAno1E: TppDBText;
    ppMesAno1D: TppDBText;
    ppMesAno2E: TppDBText;
    ppMesAno2D: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    iPagina : integer;                                                  // edilaine - SOL 217186-15443 / KTN 2053651
    procedure MontarDadosRelatorio(iVez : integer; sMesAno : string);   // edilaine - SOL 217186-15443 / KTN 2053651
    procedure MontarDados_Suprimido;

  public
    iNumMeses : integer;                            // edilaine - SOL 217186-15443 / KTN 2053651
    IdEmpresa, MesRef, AnoRef, Ordenacao: integer;
    ListaIdEstab, ListaIdFunc, TipoContrato, SitFunc, NomeTabela, TipoPagamento,
    sFigura1, sFigura2, sFigura3, ListaIdRubrica: string;

    { Public declarations }
  end;

var
  RptDBCExcesso: TRptDBCExcesso;

implementation
Uses dCds, uCtrlFuncoesRH, fAguarde, uCtrlUsoGeralRH;
{$R *.DFM}

{ TRptDBCExcesso }

procedure TRptDBCExcesso.MontarDados_Suprimido;
var
  c: byte;
  CdsAux: TCMClientDataSet;
begin
  // Se for uma pessoa, não há motivo para suprimir os dados
  if (CdsDemonstrativoDBCEX.RecordCount = 1) then
    exit;

  CdsAux := TCMClientDataSet.Create(Self);
  try
    CdsAux.Data := CdsDemonstrativoDBCEX.Data;
    CdsAux.First;
    CdsDemonstrativoDBCEX.EmptyDataSet;
    repeat
      CdsDemonstrativoDBCEX.Append;
      for c:=0 to (CdsAux.FieldCount div 2)-1 do
        CdsDemonstrativoDBCEX.Fields[c].Value := CdsAux.Fields[c].Value;
      CdsDemonstrativoDBCEX.Post;

      CdsAux.Next; // Pegar a próxima pessoa/página do Recibo Auxiliar

      if not(CdsAux.EOF) then
      begin
        CdsDemonstrativoDBCEX.Edit;
        for c:=0 to (CdsAux.FieldCount div 2)-1 do
          CdsDemonstrativoDBCEX.FieldByName(CdsAux.Fields[c].FieldName+'_2').Value :=
            CdsAux.Fields[c].Value;
        CdsDemonstrativoDBCEX.Post;

        CdsAux.Next; // Pegar a próxima pessoa/página do Recibo Auxiliar
      end;
    until (CdsAux.EOF);
  finally
    CdsAux.Free;
  end;
end;

procedure TRptDBCExcesso.MontarDadosRelatorio(iVez : integer; sMesAno : string);   // edilaine - SOL 217186-15443 / KTN 2053651
var
  sMatricula: string;
  rSalBase, rBaseINSS, rBaseFGTS, rFGTSMes, rBaseIRRF, rProventos, rDescontos,
  rMargem1, rMargem2, rSalPart, rSalBaseCargoEstr, rEmprestimoFuncef, rExcessoDebito: real;
  {iPagina,} iRubrica : integer;   // edilaine - SOL 217186-15443 / KTN 2053651
  Marca: TBookmark;
  iTotal: Real;
  bTemDesconto: boolean;
  sDtExtenso : string;    // edilaine - SOL 217186-15443 / KTN 2053651
begin

  sDtExtenso := FU.MesExtensoAno( fu.RetornaAnoMes( StrToDate(sMesAno) ) );   // edilaine - SOL 217186-15443 / KTN 2053651

  if iVez = 0 then               // edilaine - SOL 217186-15443 / KTN 2053651
     sqlDemonstrativoDBCEX.Open;

  if not(dmCds.Cds.IsEmpty) then
  begin
    CdsDemonstrativoDBCEX.IndexName := '';
    //iPagina := 1;                  // edilaine - SOL 217186-15443 / KTN 2053651
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
        CdsDemonstrativoDBCEX.Append;
        //if iPagina mod 2 > 0 then
        //  CdsDemonstrativoDBCEX.FieldByName('MATRICULA_2').asString := dmCds.Cds.FieldByName('MATRICULA').asString;

        CdsDemonstrativoDBCEX.FieldByName('MESANO').asString := sDtExtenso; // edilaine - SOL 217186-15443 / KTN 2053651

        CdsDemonstrativoDBCEX.FieldByName('MATRICULA').asString := dmCds.Cds.FieldByName('MATRICULA').asString;
        CdsDemonstrativoDBCEX.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('EMPREGADO').asString;
        CdsDemonstrativoDBCEX.FieldByName('PAGINA').asInteger := iPagina;
        CdsDemonstrativoDBCEX.FieldByName('CODCENTROCUSTO').asString := dmCds.Cds.FieldByName('CODCENTROCUSTO').asString;
        CdsDemonstrativoDBCEX.FieldByName('NUMAGENCIA').asString := dmCds.Cds.FieldByName('NUMAGENCIA').asString;
        CdsDemonstrativoDBCEX.FieldByName('NUMCONTASALARIO').asString := dmCds.Cds.FieldByName('NUMCONTASALARIO').asString;
        CdsDemonstrativoDBCEX.FieldByName('TIPOCONTRATO').asString := dmCds.Cds.FieldByName('TIPOCONTRATO').asString;
        CdsDemonstrativoDBCEX.FieldByName('NUMDEPSALF').asInteger := dmCds.Cds.FieldByName('NUMDEPSALF').asInteger;
        CdsDemonstrativoDBCEX.FieldByName('NUMDEPIRRF').asInteger := dmCds.Cds.FieldByName('NUMDEPIRRF').asInteger;
        CdsDemonstrativoDBCEX.FieldByName('EMPRESA').asString := dmCds.Cds.FieldByName('EMPRESA').asString;
        CdsDemonstrativoDBCEX.FieldByName('CGC').asString := dmCds.Cds.FieldByName('CGC').asString;

        if (dmCds.Cds.FieldByName('TIPOCONTRATO').asString <> 'A') then
        begin
          CdsDemonstrativoDBCEX.FieldByName('C_CUSTO').asString := dmCds.Cds.FieldByName('NOMECENTROCUSTO').asString;
          CdsDemonstrativoDBCEX.FieldByName('CARGO').asString := trim(dmCds.Cds.FieldByName('TITULO').asString) +
            trim(dmCds.Cds.FieldByName('FUNCAO').asString);
          CdsDemonstrativoDBCEX.FieldByName('NUMAGENCIA').asString := dmCds.Cds.FieldByName('NUMAGENCIA').asString;
        end
        else
        begin
          CdsDemonstrativoDBCEX.FieldByName('C_CUSTO').asString := dmCds.Cds.FieldByName('TITULO').asString;
          CdsDemonstrativoDBCEX.FieldByName('CARGO').asString :=
            dmCds.Cds.FieldByName('PIS').asString +
            FU.Replicate(' ', 32)+
            dmCds.Cds.FieldByName('CPF').asString;
          CdsDemonstrativoDBCEX.FieldByName('NUMAGENCIA').asString :=
            dmCds.Cds.FieldByName('NUMBANCO').asString + ' / ' +
            dmCds.Cds.FieldByName('NUMAGENCIA').asString;
        end;

        rSalBase := dmCds.Cds.FieldByName('SALBASE').asFloat;

        // Preencho cada Linha da Página do Funcionário com suas Rubricas
        iRubrica := 1;
        iTotal:= 0;
        repeat
          CdsDemonstrativoDBCEX.FieldByName('CODRUBRICA'+IntToStr(iRubrica)).asString  := dmCds.Cds.FieldByName('CODRUBRICACLIENTE').asString;
          CdsDemonstrativoDBCEX.FieldByName('RUBRICA'+IntToStr(iRubrica)).asString     := dmCds.Cds.FieldByName('RUBRICA').asString;
          CdsDemonstrativoDBCEX.FieldByName('REFERENCIA'+IntToStr(iRubrica)).asString  := dmCds.Cds.FieldByName('REFERENCIA').asString;
          CdsDemonstrativoDBCEX.FieldByName('VALOR'+IntToStr(iRubrica)).AsFloat        := dmCds.Cds.FieldByName('VALOR').AsFloat;

          iTotal:= iTotal + dmCds.Cds.FieldByName('VALOR').AsFloat;

          CdsDemonstrativoDBCEX.FieldByName('TOT_GERAL').AsFloat:= iTotal;
          Inc(iRubrica);
          sMatricula := dmCds.Cds.FieldByName('MATRICULA').asString;


          dmCds.Cds.Next;
          until (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
                 (dmCds.Cds.EOF) or
                 ((sMatricula = dmCds.Cds.FieldByName('MATRICULA').asString) and
                 (dmCds.Cds.FieldByName('TIPORUBRICA').asInteger < 2) and
                  (iRubrica = 26));
          CdsDemonstrativoDBCEX.Post;

          Inc(iPagina);
          until (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
               (dmCds.Cds.EOF);
    end;
  {  MontarDados_Suprimido;             // edilaine - SOL 217186-15443 / KTN 2053651 - comentario inicio
  end
  else
  begin
    CdsDemonstrativoDBCEX.Insert;
    CdsDemonstrativoDBCEX.Post;
  } // edilaine - SOL 217186-15443 / KTN 2053651 - comentario fim
  end;
end;

procedure TRptDBCExcesso.CrmRptCMBeforePrint(Sender: TObject);
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
      Add('  DECODE(SALCONTRA.SALARIOCONTRATUAL,');
      Add('    NULL, F.SALARIOATUAL * (CASE');
      Add('                              WHEN F.TIPOPAGAMENTO = ''M'' THEN 1');
      Add('                              WHEN F.TIPOPAGAMENTO = ''D'' THEN 30');
      Add('                              WHEN F.TIPOPAGAMENTO = ''T'' THEN 1');
      Add('                              ELSE HT.JORNADAMENSAL');
      Add('                            END),');
      Add('    SALCONTRA.SALARIOCONTRATUAL) AS SALBASE');
      Add('FROM');
      Add('  ' +NomeTabela+ ' H, PESSOA PJ, PESSOA PF, PESSOAFISICA PFIS, ');

      //Thaise: Trazendo somente as rubricas com excesso de débito
      Add('  ( ');
      Add('select * ');
      Add('  from provdesc ');
      Add(' where idprovento in (select idproventoexcessodeb ');
      Add('                       from provdesc ');
      Add('                      where flgexcessodeb = 1 )');
      Add('   ) P, ');

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
        Add(FU.MontaLinhaSelSQL('  (F.IDPESSOA',ListaIdFunc,8));

      if (ListaIdRubrica <> '') then
        Add(FU.MontaLinhaSelSQL('  (RP.CODPROVDESC',ListaIdRubrica,8));

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
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');
    end;
    dmCds.sql.Open;

    // edilaine - SOL 217186-15443 / KTN 2053651 - comentado inicio
    {ppAnoMesRef1_Cab.Caption := FU.MesExtensoAno(IntToStr(AnoRef) +'/'+ FU.PoeZero(MesRef));
    ppAnoMesRef2_Cab.Caption := FU.MesExtensoAno(IntToStr(AnoRef) +'/'+ FU.PoeZero(MesRef));
    ppAnoMesRef1_Det.Caption := FU.MesExtensoAno(IntToStr(AnoRef) +'/'+ FU.PoeZero(MesRef));
    ppAnoMesRef2_Det.Caption := FU.MesExtensoAno(IntToStr(AnoRef) +'/'+ FU.PoeZero(MesRef));
    } // edilaine - SOL 217186-15443 / KTN 2053651 - comentado fim

    // Monta Query Principal
    MontarDadosRelatorio(iNumVezes, sMesAtual);

  end;
  MontarDados_Suprimido;
  // edilaine - SOL 217186-15443 / KTN 2053651 - fim

  CdsDemonstrativoDBCEX.First;
  frmAguarde.Apaga;
end;

end.
