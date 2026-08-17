// Alterações
{**********************************************************************
Analista.: Henrique Massão
Pendencia: SOL 109421 KINTANA 496332
Data.....: 26/02/2009
Descrição: Alteração de gravação de arquivos de log na raiz do disco C:
**********************************************************************}
{**********************************************************************
Analista....: Bruno Bastos
SOL_Kintana.: 109040_494608
Data........: 13/02/2009
Rotina......: CrmRptCMBeforePrint
Descrição...: Acerto na montagem da query.
**********************************************************************}
{**********************************************************************
Analista.: Bruno Bastos
Pendencia: 27159
Data.....: 21/12/2007
Rotina...: CrmRptCMBeforePrint
Descrição: Não filtrar nada pelo campo numdocumento da lancirrf.
**********************************************************************}
{**********************************************************************
Analista.: Bruno Bastos
Pendencia: 20594
Data.....: 16/12/2005
Rotina...: Geral
Descrição: Todas queries que filtravam por datalancamento, passa a ter o filtro
           por datapagamento.
**********************************************************************}
unit rRelatDirf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppBands,
  ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, Wwdatsrc, uCmRptManager, TXComp,
  CmParamReport, ppModule, raCodMod, TXRB, Usistema;

type
  TfrmRptConfDirf = class(TFrmCmReport)
    dsConfDIRF: TwwDataSource;
    pplConfDIRF: TppBDEPipeline;pplConfDIRFppField1: TppField;
    pplConfDIRFppField2: TppField;
    pplConfDIRFppField3: TppField;
    pplConfDIRFppField4: TppField;
    pplConfDIRFppField5: TppField;
    pplConfDIRFppField6: TppField;
    pplConfDIRFppField7: TppField;
    pplConfDIRFppField8: TppField;
    pplConfDIRFppField9: TppField;
    pplConfDIRFppField10: TppField;
    pplConfDIRFppField11: TppField;
    pplConfDIRFppField12: TppField;
    pplConfDIRFppField13: TppField;
    pplConfDIRFppField14: TppField;
    pplConfDIRFppField15: TppField;
    pplConfDIRFppField16: TppField;
    pplConfDIRFppField17: TppField;
    pplConfDIRFppField18: TppField;
    pplConfDIRFppField19: TppField;
    pplConfDIRFppField20: TppField;
    pplConfDIRFppField21: TppField;
    pplConfDIRFppField22: TppField;
    pplConfDIRFppField23: TppField;
    pplConfDIRFppField24: TppField;
    pplConfDIRFppField25: TppField;
    pplConfDIRFppField26: TppField;
    pplConfDIRFppField27: TppField;
    pplConfDIRFppField28: TppField;
    pplConfDIRFppField29: TppField;
    pplConfDIRFppField30: TppField;
    pplConfDIRFppField31: TppField;
    pplConfDIRFppField32: TppField;
    pplConfDIRFppField33: TppField;
    pplConfDIRFppField34: TppField;
    pplConfDIRFppField35: TppField;
    pplConfDIRFppField36: TppField;
    pplConfDIRFppField37: TppField;
    pplConfDIRFppField38: TppField;
    pplConfDIRFppField39: TppField;
    pplConfDIRFppField40: TppField;
    pplConfDIRFppField41: TppField;
    pplConfDIRFppField42: TppField;
    pplConfDIRFppField43: TppField;
    pplConfDIRFppField44: TppField;
    pplConfDIRFppField45: TppField;
    pplConfDIRFppField46: TppField;
    pplConfDIRFppField47: TppField;
    pplConfDIRFppField48: TppField;
    pplConfDIRFppField49: TppField;
    pplConfDIRFppField50: TppField;
    pplConfDIRFppField51: TppField;
    pplConfDIRFppField52: TppField;
    pplConfDIRFppField53: TppField;
    pplConfDIRFppField54: TppField;
    pplConfDIRFppField55: TppField;
    pplConfDIRFppField56: TppField;
    pplConfDIRFppField57: TppField;
    pplConfDIRFppField58: TppField;
    pplConfDIRFppField59: TppField;
    pplConfDIRFppField60: TppField;
    pplConfDIRFppField61: TppField;
    pplConfDIRFppField62: TppField;
    pplConfDIRFppField63: TppField;
    pplConfDIRFppField64: TppField;
    pplConfDIRFppField65: TppField;
    pplConfDIRFppField66: TppField;
    pplConfDIRFppField67: TppField;
    pplConfDIRFppField68: TppField;
    pplConfDIRFppField69: TppField;
    pplConfDIRFppField70: TppField;
    pplConfDIRFppField71: TppField;
    pplConfDIRFppField72: TppField;
    pplConfDIRFppField73: TppField;
    pplConfDIRFppField74: TppField;
    pplConfDIRFppField75: TppField;
    pplConfDIRFppField76: TppField;
    pplConfDIRFppField77: TppField;
    pplConfDIRFppField78: TppField;
    pplConfDIRFppField79: TppField;
    pplConfDIRFppField80: TppField;
    pplConfDIRFppField81: TppField;
    pplConfDIRFppField82: TppField;
    pplConfDIRFppField83: TppField;
    pplConfDIRFppField84: TppField;
    rpConfDIRF: TppReport;
    sqlConfDirf: TCMSqlParams;
    cdsConfDirf: TCMClientDataSet;
    cdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    ppHeaderBand3: TppHeaderBand;
    rpRelatDirfLabel151: TppLabel;
    ppLabel15: TppLabel;
    rpRelatDirfLabel152: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppDBText4: TppDBText;
    ppDBText7: TppDBText;
    rpConfDIRFDBText3: TppDBText;
    rpConfDIRFLabel6: TppLabel;
    rpConfDIRFLabel7: TppLabel;
    rpConfDIRFDBText6: TppDBText;
    rpConfDIRFDBText7: TppDBText;
    rpConfDIRFDBText8: TppDBText;
    rpConfDIRFLabel8: TppLabel;
    rpConfDIRFDBText9: TppDBText;
    rpConfDIRFDBText10: TppDBText;
    rpConfDIRFDBText11: TppDBText;
    rpConfDIRFLabel9: TppLabel;
    rpConfDIRFDBText12: TppDBText;
    rpConfDIRFDBText13: TppDBText;
    rpConfDIRFDBText14: TppDBText;
    rpConfDIRFLabel10: TppLabel;
    rpConfDIRFDBText15: TppDBText;
    rpConfDIRFDBText16: TppDBText;
    rpConfDIRFDBText17: TppDBText;
    rpConfDIRFLabel11: TppLabel;
    rpConfDIRFDBText18: TppDBText;
    rpConfDIRFDBText19: TppDBText;
    rpConfDIRFDBText20: TppDBText;
    rpConfDIRFLabel12: TppLabel;
    rpConfDIRFDBText21: TppDBText;
    rpConfDIRFDBText22: TppDBText;
    rpConfDIRFDBText23: TppDBText;
    rpConfDIRFLabel13: TppLabel;
    rpConfDIRFDBText24: TppDBText;
    rpConfDIRFDBText25: TppDBText;
    rpConfDIRFDBText26: TppDBText;
    rpConfDIRFLabel14: TppLabel;
    rpConfDIRFDBText27: TppDBText;
    rpConfDIRFDBText28: TppDBText;
    rpConfDIRFDBText29: TppDBText;
    rpConfDIRFLabel15: TppLabel;
    rpConfDIRFDBText30: TppDBText;
    rpConfDIRFDBText31: TppDBText;
    rpConfDIRFDBText32: TppDBText;
    rpConfDIRFLabel16: TppLabel;
    rpConfDIRFDBText33: TppDBText;
    rpConfDIRFDBText34: TppDBText;
    rpConfDIRFDBText35: TppDBText;
    rpConfDIRFLabel17: TppLabel;
    rpConfDIRFDBText36: TppDBText;
    rpConfDIRFDBText37: TppDBText;
    rpConfDIRFDBText38: TppDBText;
    rpConfDIRFLine2: TppLine;
    rpConfDIRFLine6: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppLabel6: TppLabel;
    ppLine1: TppLine;
    ppVariable1: TppVariable;
    ppVariable2: TppVariable;
    ppVariable3: TppVariable;
    ppLine3: TppLine;
    ppLabel8: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel26: TppLabel;
    ppLine8: TppLine;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    rpConfDIRFGroup1: TppGroup;
    rpConfDIRFGroupHeaderBand1: TppGroupHeaderBand;
    rpConfDIRFGroupFooterBand1: TppGroupFooterBand;
    rpConfDIRFGroup2: TppGroup;
    rpConfDIRFGroupHeaderBand2: TppGroupHeaderBand;
    rpConfDIRFLine1: TppLine;
    rpConfDIRFLabel2: TppLabel;
    rpConfDIRFDBText1: TppDBText;
    rpConfDIRFDBText2: TppDBText;
    rpConfDIRFLine5: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    rpConfDIRFDBText4: TppDBText;
    ppDBText1: TppDBText;
    rpConfDIRFGroupFooterBand2: TppGroupFooterBand;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppDBText4Print(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRptConfDirf: TfrmRptConfDirf;

implementation

{$R *.DFM}

procedure TfrmRptConfDirf.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
   SqlAux.Prepare;
   sqlAux.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
   SqlAux.Open;
   //
   rpRelatDirfLabel152.caption := CmpRptCM.ParamValues[0].AsString;
   //
   with sqlConfDirf do
     Begin
       sql.Append('SELECT P.TIPO, P.RAZAOSOCIAL AS NOMEBENEF, RTRIM(P.NUMDOCUMENTO) AS CGCBENEF, ');
       sql.Append('       E.NUMDOCUMENTO AS CGCEMPRE, E.RAZAOSOCIAL AS NOMEEMPRE, RTRIM(XB.CODNATUREZA) AS CODNATUREZA, ');
       sql.Append('       XB.JAN1 AS JAN1,XB.JAN2 AS JAN2,XB.JAN3 AS JAN3, ');
       sql.Append('       XB.FEV1 AS FEV1,XB.FEV2 AS FEV2,XB.FEV3 AS FEV3, ');
       sql.Append('       XB.MAR1 AS MAR1,XB.MAR2 AS MAR2,XB.MAR3 AS MAR3, ');
       sql.Append('       XB.ABR1 AS ABR1,XB.ABR2 AS ABR2,XB.ABR3 AS ABR3, ');
       sql.Append('       XB.MAI1 AS MAI1,XB.MAI2 AS MAI2,XB.MAI3 AS MAI3, ');
       sql.Append('       XB.JUN1 AS JUN1,XB.JUN2 AS JUN2,XB.JUN3 AS JUN3, ');
       sql.Append('       XB.JUL1 AS JUL1,XB.JUL2 AS JUL2,XB.JUL3 AS JUL3, ');
       sql.Append('       XB.AGO1 AS AGO1,XB.AGO2 AS AGO2,XB.AGO3 AS AGO3, ');
       sql.Append('       XB.SET1 AS SET1,XB.SET2 AS SET2,XB.SET3 AS SET3, ');
       sql.Append('       XB.OUT1 AS OUT1,XB.OUT2 AS OUT2,XB.OUT3 AS OUT3, ');
       sql.Append('       XB.NOV1 AS NOV1,XB.NOV2 AS NOV2,XB.NOV3 AS NOV3, ');
       sql.Append('       XB.DEZ1 AS DEZ1,XB.DEZ2 AS DEZ2,XB.DEZ3 AS DEZ3, ');
       sql.Append('       DECODE(SIGN(XB.VLR131),-1,0,XB.VLR131) AS VLR131, ');
       sql.Append('       DECODE(SIGN(XB.VLR132),-1,0,XB.VLR132) AS VLR132, ');
       sql.Append('       DECODE(SIGN(XB.VLR133),-1,0,XB.VLR133) AS VLR133, ');
       sql.Append('       XB.IDBENEFIRRF, '); 
       sql.Append('       XT.SUMJAN1 AS SUMJAN1,XT.SUMJAN2 AS SUMJAN2,XT.SUMJAN3 AS SUMJAN3, ');
       sql.Append('       XT.SUMFEV1 AS SUMFEV1,XT.SUMFEV2 AS SUMFEV2,XT.SUMFEV3 AS SUMFEV3, ');
       sql.Append('       XT.SUMMAR1 AS SUMMAR1,XT.SUMMAR2 AS SUMMAR2,XT.SUMMAR3 AS SUMMAR3, ');
       sql.Append('       XT.SUMABR1 AS SUMABR1,XT.SUMABR2 AS SUMABR2,XT.SUMABR3 AS SUMABR3, ');
       sql.Append('       XT.SUMMAI1 AS SUMMAI1,XT.SUMMAI2 AS SUMMAI2,XT.SUMMAI3 AS SUMMAI3, ');
       sql.Append('       XT.SUMJUN1 AS SUMJUN1,XT.SUMJUN2 AS SUMJUN2,XT.SUMJUN3 AS SUMJUN3, ');
       sql.Append('       XT.SUMJUL1 AS SUMJUL1,XT.SUMJUL2 AS SUMJUL2,XT.SUMJUL3 AS SUMJUL3, ');
       sql.Append('       XT.SUMAGO1 AS SUMAGO1,XT.SUMAGO2 AS SUMAGO2,XT.SUMAGO3 AS SUMAGO3, ');
       sql.Append('       XT.SUMSET1 AS SUMSET1,XT.SUMSET2 AS SUMSET2,XT.SUMSET3 AS SUMSET3, ');
       sql.Append('       XT.SUMOUT1 AS SUMOUT1,XT.SUMOUT2 AS SUMOUT2,XT.SUMOUT3 AS SUMOUT3, ');
       sql.Append('       XT.SUMNOV1 AS SUMNOV1,XT.SUMNOV2 AS SUMNOV2,XT.SUMNOV3 AS SUMNOV3, ');
       sql.Append('       XT.SUMDEZ1 AS SUMDEZ1,XT.SUMDEZ2 AS SUMDEZ2,XT.SUMDEZ3 AS SUMDEZ3, ');
       sql.Append('       XT.SUMVLR131 AS SUMVLR131,XT.SUMVLR132 AS SUMVLR132,XT.SUMVLR133 AS SUMVLR133 ');
       sql.Append(' FROM  PESSOA P,PESSOA E, ');
       sql.Append('       (SELECT U.IDBENEFIRRF, U.CODNATUREZA, ');
       sql.Append('               SUM(U.JAN1) AS JAN1, SUM(U.FEV1) AS FEV1, SUM(U.MAR1) AS MAR1, SUM(U.ABR1) AS ABR1, ');
       sql.Append('               SUM(U.MAI1) AS MAI1, SUM(U.JUN1) AS JUN1, SUM(U.JUL1) AS JUL1, SUM(U.AGO1) AS AGO1, ');
       sql.Append('               SUM(U.SET1) AS SET1, SUM(U.OUT1) AS OUT1, SUM(U.NOV1) AS NOV1, SUM(U.DEZ1) AS DEZ1, ');
       sql.Append('               SUM(U.JAN2) AS JAN2, SUM(U.FEV2) AS FEV2, SUM(U.MAR2) AS MAR2, SUM(U.ABR2) AS ABR2, ');
       sql.Append('               SUM(U.MAI2) AS MAI2, SUM(U.JUN2) AS JUN2, SUM(U.JUL2) AS JUL2, SUM(U.AGO2) AS AGO2, ');
       sql.Append('               SUM(U.SET2) AS SET2, SUM(U.OUT2) AS OUT2, SUM(U.NOV2) AS NOV2, SUM(U.DEZ2) AS DEZ2, ');
       sql.Append('               SUM(U.JAN3) AS JAN3, SUM(U.FEV3) AS FEV3, SUM(U.MAR3) AS MAR3, SUM(U.ABR3) AS ABR3, ');
       sql.Append('               SUM(U.MAI3) AS MAI3, SUM(U.JUN3) AS JUN3, SUM(U.JUL3) AS JUL3, SUM(U.AGO3) AS AGO3, ');
       sql.Append('               SUM(U.SET3) AS SET3, SUM(U.OUT3) AS OUT3, SUM(U.NOV3) AS NOV3, SUM(U.DEZ3) AS DEZ3, ');
       sql.Append('               SUM(U.VLR131) AS VLR131, SUM(U.VLR132) AS VLR132, SUM(U.VLR133) AS VLR133 ');
       sql.Append('         FROM  ((SELECT L.IDBENEFIRRF, L.CODNATUREZA, ');
       sql.Append('                        SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''2'',LI.VLRLANC,0),0)) AS JAN1, ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''2'',LI.VLRLANC,0),0)) AS FEV1,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''2'',LI.VLRLANC,0),0)) AS MAR1,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''2'',LI.VLRLANC,0),0)) AS ABR1,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''2'',LI.VLRLANC,0),0)) AS MAI1,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''2'',LI.VLRLANC,0),0)) AS JUN1,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''2'',LI.VLRLANC,0),0)) AS JUL1,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''2'',LI.VLRLANC,0),0)) AS AGO1,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''2'',LI.VLRLANC,0),0)) AS SET1,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''2'',LI.VLRLANC,0),0)) AS OUT1,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''2'',LI.VLRLANC,0),0)) AS NOV1,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''2'',LI.VLRLANC,0),0)) AS DEZ1,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS JAN2,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS FEV2,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS MAR2,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS ABR2,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS MAI2,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS JUN2,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS JUL2,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS AGO2,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS SET2,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS OUT2,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS NOV2,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS DEZ2,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0)) AS JAN3,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0)) AS FEV3,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0)) AS MAR3,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0)) AS ABR3,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0)) AS MAI3,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0)) AS JUN3,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0)) AS JUL3,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0)) AS AGO3,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0)) AS SET3,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0)) AS OUT3,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0)) AS NOV3,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0)) AS DEZ3,         ');
       sql.Append('                SUM(DECODE(I.CODDIRF,''5'',LI.VLRLANC,0)) AS VLR131,                                                         ');
       sql.Append('                SUM(DECODE(I.CODDIRF,''6'',LI.VLRLANC,0)) AS VLR132,                                                         ');
       sql.Append('                SUM(DECODE(I.CODDIRF,''7'',LI.VLRLANC,0)) AS VLR133                                                          ');
       sql.Append('         FROM INFORME I, LANCXINFORME LI, LANCIRRF L  ');
       sql.Append('         WHERE (I.IDINFORME = LI.IDINFORME) AND                                                                              ');
       sql.Append('               (LI.IDLANCIRRF = L.IDLANCIRRF) AND                                                                            ');
       sql.Append('               (L.datapagamento BETWEEN TO_DATE('+quotedstr('01/01/'+CmpRptCM.ParamValues[0].AsString)+',''DD/MM/YYYY'') AND TO_DATE('+quotedstr('31/12/'+CmpRptCM.ParamValues[0].AsString)+',''DD/MM/YYYY'')) AND        ');

       //CPREV - Pend. 27159 -        sql.Append('               (SUBSTR(L.NUMDOCUMENTO,1,8) = '+Copy(cdsAux.fieldByname('NUMDOCUMENTO').AsString,1,8)+')');

       case CmpRptCM.ParamValues[1].Asinteger of
       {Bruno Bastos - SOL 109019 - 494611 - Início comentário
         0: sql.Append(' AND (NVL(L.IDMODULORESPON, L.IDMODULO) = 21) ');
         1: sql.Append(' AND (NVL(L.IDMODULORESPON, L.IDMODULO) = 18) ');
         2: sql.Append(' AND (NVL(L.IDMODULORESPON, L.IDMODULO) =  3) ');
         3: sql.Append(' AND (NVL(L.IDMODULORESPON, L.IDMODULO) in (3, 18, 21)) ');
       }

         //Bruno Bastos - SOL 109019 - 494611 - Início
         0: sql.Append(' (NVL(L.IDMODULORESPON, L.IDMODULO) = 21) ');
         1: sql.Append(' (NVL(L.IDMODULORESPON, L.IDMODULO) = 18) ');
         2: sql.Append(' (NVL(L.IDMODULORESPON, L.IDMODULO) =  3) ');
         3: sql.Append(' (NVL(L.IDMODULORESPON, L.IDMODULO) in (3, 18, 21)) ');
         //Bruno Bastos - SOL 109019 - 494611 - Fim
       End;

       sql.Append('         GROUP BY L.IDBENEFIRRF, L.CODNATUREZA)                                                                              ');
       sql.Append('        UNION ALL                                                                                                            ');
       sql.Append('        (SELECT  L.IDBENEFIRRF, L.CODNATUREZA,                                                                               ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',L.VLRBASE,0)) AS JAN1,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',L.VLRBASE,0)) AS FEV1,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',L.VLRBASE,0)) AS MAR1,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',L.VLRBASE,0)) AS ABR1,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',L.VLRBASE,0)) AS MAI1,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',L.VLRBASE,0)) AS JUN1,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',L.VLRBASE,0)) AS JUL1,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',L.VLRBASE,0)) AS AGO1,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',L.VLRBASE,0)) AS SET1,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',L.VLRBASE,0)) AS OUT1,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',L.VLRBASE,0)) AS NOV1,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',L.VLRBASE,0)) AS DEZ1,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',L.VLRIRRF,0)) AS JAN2,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',L.VLRIRRF,0)) AS FEV2,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',L.VLRIRRF,0)) AS MAR2,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',L.VLRIRRF,0)) AS ABR2,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',L.VLRIRRF,0)) AS MAI2,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',L.VLRIRRF,0)) AS JUN2,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',L.VLRIRRF,0)) AS JUL2,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',L.VLRIRRF,0)) AS AGO2,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',L.VLRIRRF,0)) AS SET2,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',L.VLRIRRF,0)) AS OUT2,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',L.VLRIRRF,0)) AS NOV2,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',L.VLRIRRF,0)) AS DEZ2,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',L.VLRINSS,0)) AS JAN3,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',L.VLRINSS,0)) AS FEV3,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',L.VLRINSS,0)) AS MAR3,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',L.VLRINSS,0)) AS ABR3,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',L.VLRINSS,0)) AS MAI3,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',L.VLRINSS,0)) AS JUN3,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',L.VLRINSS,0)) AS JUL3,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',L.VLRINSS,0)) AS AGO3,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',L.VLRINSS,0)) AS SET3,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',L.VLRINSS,0)) AS OUT3,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',L.VLRINSS,0)) AS NOV3,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',L.VLRINSS,0)) AS DEZ3,                                    ');
       sql.Append('                0 AS VLR131,                                                                                                 ');
       sql.Append('                0 AS VLR132,                                                                                                 ');
       sql.Append('                0 AS VLR133                                                                                                  ');
       sql.Append('         FROM LANCIRRF L  ');
       sql.Append('         WHERE (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXINFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF)) AND                  ');
       sql.Append('               (L.datapagamento BETWEEN TO_DATE('+quotedstr('01/01/'+CmpRptCM.ParamValues[0].AsString)+',''DD/MM/YYYY'') AND TO_DATE('+quotedstr('31/12/'+CmpRptCM.ParamValues[0].AsString)+',''DD/MM/YYYY'')) AND        '); 

//CPREV - Pend. 27159 - sql.Append('               (SUBSTR(L.NUMDOCUMENTO,1,8) = '+Copy(cdsAux.fieldByname('NUMDOCUMENTO').AsString,1,8)+')');

       case CmpRptCM.ParamValues[1].Asinteger of
         {Bruno Bastos - SOL 109019 - 494611 - Início comentário
         0: sql.Append(' AND (NVL(L.IDMODULORESPON, L.IDMODULO) = 21) ');
         1: sql.Append(' AND (NVL(L.IDMODULORESPON, L.IDMODULO) = 18) ');
         2: sql.Append(' AND (NVL(L.IDMODULORESPON, L.IDMODULO) =  3) ');
         3: sql.Append(' AND (NVL(L.IDMODULORESPON, L.IDMODULO) in (3, 18, 21)) ');
         }

         //Bruno Bastos - SOL 109019 - 494611 - Início
         0: sql.Append(' (NVL(L.IDMODULORESPON, L.IDMODULO) = 21) ');
         1: sql.Append(' (NVL(L.IDMODULORESPON, L.IDMODULO) = 18) ');
         2: sql.Append(' (NVL(L.IDMODULORESPON, L.IDMODULO) =  3) ');
         3: sql.Append(' (NVL(L.IDMODULORESPON, L.IDMODULO) in (3, 18, 21)) ');
         //Bruno Bastos - SOL 109019 - 494611 - Fim
       End;
       sql.Append('         GROUP BY L.IDBENEFIRRF, L.CODNATUREZA)) U                                                                           ');
       sql.Append('        GROUP BY U.IDBENEFIRRF, U.CODNATUREZA                                                                                ');
       sql.Append('          ) XB,                                                                                                              ');
       sql.Append('        (SELECT U.CODNATUREZA,                                                                                               ');
       sql.Append('               SUM(U.JAN1) AS SUMJAN1,                                                                                       ');
       sql.Append('               SUM(U.FEV1) AS SUMFEV1,                                                                                       ');
       sql.Append('               SUM(U.MAR1) AS SUMMAR1,                                                                                       ');
       sql.Append('               SUM(U.ABR1) AS SUMABR1,                                                                                       ');
       sql.Append('               SUM(U.MAI1) AS SUMMAI1,                                                                                       ');
       sql.Append('               SUM(U.JUN1) AS SUMJUN1,                                                                                       ');
       sql.Append('               SUM(U.JUL1) AS SUMJUL1,                                                                                       ');
       sql.Append('               SUM(U.AGO1) AS SUMAGO1,                                                                                       ');
       sql.Append('               SUM(U.SET1) AS SUMSET1,                                                                                       ');
       sql.Append('               SUM(U.OUT1) AS SUMOUT1,                                                                                       ');
       sql.Append('               SUM(U.NOV1) AS SUMNOV1,                                                                                       ');
       sql.Append('               SUM(U.DEZ1) AS SUMDEZ1,                                                                                       ');
       sql.Append('               SUM(U.JAN2) AS SUMJAN2,                                                                                       ');
       sql.Append('               SUM(U.FEV2) AS SUMFEV2,                                                                                       ');
       sql.Append('               SUM(U.MAR2) AS SUMMAR2,                                                                                       ');
       sql.Append('               SUM(U.ABR2) AS SUMABR2,                                                                                       ');
       sql.Append('               SUM(U.MAI2) AS SUMMAI2,                                                                                       ');
       sql.Append('               SUM(U.JUN2) AS SUMJUN2,                                                                                       ');
       sql.Append('               SUM(U.JUL2) AS SUMJUL2,                                                                                       ');
       sql.Append('               SUM(U.AGO2) AS SUMAGO2,                                                                                       ');
       sql.Append('               SUM(U.SET2) AS SUMSET2,                                                                                       ');
       sql.Append('               SUM(U.OUT2) AS SUMOUT2,                                                                                       ');
       sql.Append('               SUM(U.NOV2) AS SUMNOV2,                                                                                       ');
       sql.Append('               SUM(U.DEZ2) AS SUMDEZ2,                                                                                       ');
       sql.Append('               SUM(U.JAN3) AS SUMJAN3,                                                                                       ');
       sql.Append('               SUM(U.FEV3) AS SUMFEV3,                                                                                       ');
       sql.Append('               SUM(U.MAR3) AS SUMMAR3,                                                                                       ');
       sql.Append('               SUM(U.ABR3) AS SUMABR3,                                                                                       ');
       sql.Append('               SUM(U.MAI3) AS SUMMAI3,                                                                                       ');
       sql.Append('               SUM(U.JUN3) AS SUMJUN3,                                                                                       ');
       sql.Append('               SUM(U.JUL3) AS SUMJUL3,                                                                                       ');
       sql.Append('               SUM(U.AGO3) AS SUMAGO3,                                                                                       ');
       sql.Append('               SUM(U.SET3) AS SUMSET3,                                                                                       ');
       sql.Append('               SUM(U.OUT3) AS SUMOUT3,                                                                                       ');
       sql.Append('               SUM(U.NOV3) AS SUMNOV3,                                                                                       ');
       sql.Append('               SUM(U.DEZ3) AS SUMDEZ3,                                                                                       ');
       sql.Append('               SUM(U.VLR131) AS SUMVLR131,                                                                                   ');
       sql.Append('               SUM(U.VLR132) AS SUMVLR132,                                                                                   ');
       sql.Append('               SUM(U.VLR133) AS SUMVLR133                                                                                    ');
       sql.Append('         FROM                                                                                                                ');
       sql.Append('        ((SELECT L.CODNATUREZA,                                                                                              ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''2'',LI.VLRLANC,0),0)) AS JAN1,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''2'',LI.VLRLANC,0),0)) AS FEV1,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''2'',LI.VLRLANC,0),0)) AS MAR1,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''2'',LI.VLRLANC,0),0)) AS ABR1,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''2'',LI.VLRLANC,0),0)) AS MAI1,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''2'',LI.VLRLANC,0),0)) AS JUN1,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''2'',LI.VLRLANC,0),0)) AS JUL1,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''2'',LI.VLRLANC,0),0)) AS AGO1,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''2'',LI.VLRLANC,0),0)) AS SET1,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''2'',LI.VLRLANC,0),0)) AS OUT1,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''2'',LI.VLRLANC,0),0)) AS NOV1,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''2'',LI.VLRLANC,0),0)) AS DEZ1,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS JAN2,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS FEV2,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS MAR2,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS ABR2,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS MAI2,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS JUN2,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS JUL2,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS AGO2,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS SET2,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS OUT2,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS NOV2,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''3'',LI.VLRLANC,0),0)) AS DEZ2,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0)) AS JAN3,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0)) AS FEV3,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0)) AS MAR3,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0)) AS ABR3,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0)) AS MAI3,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0)) AS JUN3,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0)) AS JUL3,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0)) AS AGO3,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0)) AS SET3,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0)) AS OUT3,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0)) AS NOV3,         ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',DECODE(I.CODDIRF,''4'',LI.VLRLANC,0),0)) AS DEZ3,         ');
       sql.Append('                SUM(DECODE(I.CODDIRF,''5'',LI.VLRLANC,0)) AS VLR131,                                                         ');
       sql.Append('                SUM(DECODE(I.CODDIRF,''6'',LI.VLRLANC,0)) AS VLR132,                                                         ');
       sql.Append('                SUM(DECODE(I.CODDIRF,''7'',LI.VLRLANC,0)) AS VLR133                                                          ');
       sql.Append('         FROM INFORME I, LANCXINFORME LI, LANCIRRF L ');
       sql.Append('         WHERE (I.IDINFORME = LI.IDINFORME) AND                                                                              ');
       sql.Append('               (LI.IDLANCIRRF = L.IDLANCIRRF) AND                                                                            ');
       sql.Append('               (L.datapagamento BETWEEN TO_DATE('+quotedstr('01/01/'+CmpRptCM.ParamValues[0].AsString)+',''DD/MM/YYYY'') AND TO_DATE('+quotedstr('31/12/'+CmpRptCM.ParamValues[0].AsString)+',''DD/MM/YYYY'')) AND        '); 


//CPREV - Pend. 27159 - sql.Append('               (SUBSTR(L.NUMDOCUMENTO,1,8) = '+Copy(cdsAux.fieldByname('NUMDOCUMENTO').AsString,1,8)+')');

       case CmpRptCM.ParamValues[1].Asinteger of
       {Bruno Bastos - SOL 109019 - 494611 - Início comentário
         0: sql.Append(' AND (NVL(L.IDMODULORESPON, L.IDMODULO) = 21) ');
         1: sql.Append(' AND (NVL(L.IDMODULORESPON, L.IDMODULO) = 18) ');
         2: sql.Append(' AND (NVL(L.IDMODULORESPON, L.IDMODULO) =  3) ');
         3: sql.Append(' AND (NVL(L.IDMODULORESPON, L.IDMODULO) in (3, 18, 21)) ');
       }

         //Bruno Bastos - SOL 109019 - 494611 - Início
         0: sql.Append(' (NVL(L.IDMODULORESPON, L.IDMODULO) = 21) ');
         1: sql.Append(' (NVL(L.IDMODULORESPON, L.IDMODULO) = 18) ');
         2: sql.Append(' (NVL(L.IDMODULORESPON, L.IDMODULO) =  3) ');
         3: sql.Append(' (NVL(L.IDMODULORESPON, L.IDMODULO) in (3, 18, 21)) ');
         //Bruno Bastos - SOL 109019 - 494611 - Fim
       End;
       sql.Append('         GROUP BY L.CODNATUREZA)                                                                                             ');
       sql.Append('        UNION ALL                                                                                                            ');
       sql.Append('        (SELECT  L.CODNATUREZA,                                                                                              ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',L.VLRBASE,0)) AS JAN1,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',L.VLRBASE,0)) AS FEV1,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',L.VLRBASE,0)) AS MAR1,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',L.VLRBASE,0)) AS ABR1,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',L.VLRBASE,0)) AS MAI1,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',L.VLRBASE,0)) AS JUN1,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',L.VLRBASE,0)) AS JUL1,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',L.VLRBASE,0)) AS AGO1,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',L.VLRBASE,0)) AS SET1,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',L.VLRBASE,0)) AS OUT1,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',L.VLRBASE,0)) AS NOV1,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',L.VLRBASE,0)) AS DEZ1,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',L.VLRIRRF,0)) AS JAN2,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',L.VLRIRRF,0)) AS FEV2,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',L.VLRIRRF,0)) AS MAR2,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',L.VLRIRRF,0)) AS ABR2,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',L.VLRIRRF,0)) AS MAI2,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',L.VLRIRRF,0)) AS JUN2,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',L.VLRIRRF,0)) AS JUL2,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',L.VLRIRRF,0)) AS AGO2,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',L.VLRIRRF,0)) AS SET2,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',L.VLRIRRF,0)) AS OUT2,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',L.VLRIRRF,0)) AS NOV2,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',L.VLRIRRF,0)) AS DEZ2,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''01'',L.VLRINSS,0)) AS JAN3,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''02'',L.VLRINSS,0)) AS FEV3,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''03'',L.VLRINSS,0)) AS MAR3,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''04'',L.VLRINSS,0)) AS ABR3,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''05'',L.VLRINSS,0)) AS MAI3,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''06'',L.VLRINSS,0)) AS JUN3,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''07'',L.VLRINSS,0)) AS JUL3,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''08'',L.VLRINSS,0)) AS AGO3,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''09'',L.VLRINSS,0)) AS SET3,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''10'',L.VLRINSS,0)) AS OUT3,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''11'',L.VLRINSS,0)) AS NOV3,                                    ');
       sql.Append('                SUM(DECODE(TO_CHAR(L.datapagamento,''MM''),''12'',L.VLRINSS,0)) AS DEZ3,                                    ');
       sql.Append('                0 AS VLR131,                                                                                                 ');
       sql.Append('                0 AS VLR132,                                                                                                 ');
       sql.Append('                0 AS VLR133                                                                                                  ');
       sql.Append('         FROM LANCIRRF L  ');
       sql.Append('         WHERE (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXINFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF)) AND                  ');
       sql.Append('               (L.datapagamento BETWEEN TO_DATE('+quotedstr('01/01/'+CmpRptCM.ParamValues[0].AsString)+',''DD/MM/YYYY'') AND TO_DATE('+quotedstr('31/12/'+CmpRptCM.ParamValues[0].AsString)+',''DD/MM/YYYY'')) AND        '); 

//CPREV - Pend. 27159 - sql.Append('               (SUBSTR(L.NUMDOCUMENTO,1,8) = '+Copy(cdsAux.fieldByname('NUMDOCUMENTO').AsString,1,8)+')');

       case CmpRptCM.ParamValues[1].Asinteger of
       {Bruno Bastos - SOL 109019 - 494611 - Início comentário
         0: sql.Append(' AND (NVL(L.IDMODULORESPON, L.IDMODULO) = 21) ');
         1: sql.Append(' AND (NVL(L.IDMODULORESPON, L.IDMODULO) = 18) ');
         2: sql.Append(' AND (NVL(L.IDMODULORESPON, L.IDMODULO) =  3) ');
         3: sql.Append(' AND (NVL(L.IDMODULORESPON, L.IDMODULO) in (3, 18, 21)) ');
       }

         //Bruno Bastos - SOL 109019 - 494611 - Início
         0: sql.Append(' (NVL(L.IDMODULORESPON, L.IDMODULO) = 21) ');
         1: sql.Append(' (NVL(L.IDMODULORESPON, L.IDMODULO) = 18) ');
         2: sql.Append(' (NVL(L.IDMODULORESPON, L.IDMODULO) =  3) ');
         3: sql.Append(' (NVL(L.IDMODULORESPON, L.IDMODULO) in (3, 18, 21)) ');
         //Bruno Bastos - SOL 109019 - 494611 - Fim
       End;
       sql.Append('         GROUP BY L.CODNATUREZA)) U                                                                                          ');
       sql.Append('        GROUP BY U.CODNATUREZA                                                                                               ');
       sql.Append('          ) XT                                                                                                               ');
       sql.Append('        WHERE  (XB.IDBENEFIRRF = P.IDPESSOA) AND                                                                             ');
       sql.Append('        (XB.CODNATUREZA = XT.CODNATUREZA) AND                                                                                ');
       sql.Append('        (E.IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '); 
       sql.Append('         ORDER BY NOMEBENEF, CODNATUREZA, CGCBENEF, IDBENEFIRRF ');
       //Henrique Massão
       //sql.SaveToFile('C:\Temp\Teste Query RelatDirf.txt');
       sql.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\TesteQueryRelatDirf.txt ');
       Open;
     end;
end;

procedure TfrmRptConfDirf.ppDBText4Print(Sender: TObject);
begin
   inherited;
   if TppDbText(Sender).DataField <> '' Then
     if cdsConfDirf.FieldByName(TppDbText(Sender).DataField).Value < 0 then
        TppDbText(Sender).Caption := '0.00';
end;

end.
