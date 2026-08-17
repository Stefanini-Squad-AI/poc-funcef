unit rRelatCompAnualRetIRPJCSLLPISCOFINS;  
// Alterações:
{ --------------------------------------------------------------------------------------------------
 N. Chamado....: WO34233
 Dt Alteração..: 18/03/2026
 Responsável...: Paulo Nobre
 Descrição.....: PROJETO CNPJ ALFANUMÉRICO
                 .Ajustando o padrão da mascara atual do CNPJ para
                  a alfanumérica: 'AA.AAA.AAA/AAAA-99'.
----------------------------------------------------------------------------------------------------
Rotina    : CrmRptCMBeforePrint
Data      : 13/12/2007
Autor     : Bruno Bastos
Pendência : 27082
Descrição : Não trazer na query o campo NUMDOCUMENTO da LancIRRF.
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ppCtrls, ppBands, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE,
  Wwdatsrc, TXRB;

type
  TfrmRelatCompAnualRetIRPJCSLLPI = class(TFrmCmReport)
    dsComRenJuridica: TwwDataSource;
    pplComRenJuridica: TppBDEPipeline;
    rpComRenJuridica: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    rpComRenJuridicaImage1: TppImage;
    rpComRenJuridicaLabel22: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppShape7: TppShape;
    ppDBText2: TppDBText;
    ppLabel9: TppLabel;
    ppShape9: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppLabel6: TppLabel;
    ppLine2: TppLine;
    ppLabel13: TppLabel;
    ppLine9: TppLine;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLine21: TppLine;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLine22: TppLine;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    rpComRenJuridicaLabel1: TppLabel;
    rpComRenJuridicaLine2: TppLine;
    rpComRenJuridicaLabel2: TppLabel;
    rpComRenJuridicaDBText1: TppDBText;
    rpComRenJuridicaShape1: TppShape;
    rpComRenJuridicaLine4: TppLine;
    rpComRenJuridicaLine5: TppLine;
    rpComRenJuridicaLine6: TppLine;
    rpComRenJuridicaLine8: TppLine;
    rpComRenJuridicaLine10: TppLine;
    rpComRenJuridicaLine12: TppLine;
    rpComRenJuridicaLine14: TppLine;
    rpComRenJuridicaLine3: TppLine;
    rpComRenJuridicaLine9: TppLine;
    rpComRenJuridicaLine13: TppLine;
    rpComRenJuridicaLine16: TppLine;
    rpComRenJuridicaLine18: TppLine;
    rpComRenJuridicaLine20: TppLine;
    rpComRenJuridicaLabel3: TppLabel;
    rpComRenJuridicaLabel4: TppLabel;
    rpComRenJuridicaLabel6: TppLabel;
    rpComRenJuridicaLabel7: TppLabel;
    rpComRenJuridicaLabel8: TppLabel;
    rpComRenJuridicaLabel9: TppLabel;
    rpComRenJuridicaLabel10: TppLabel;
    rpComRenJuridicaLabel11: TppLabel;
    rpComRenJuridicaLabel12: TppLabel;
    rpComRenJuridicaLabel13: TppLabel;
    rpComRenJuridicaLabel14: TppLabel;
    rpComRenJuridicaLabel15: TppLabel;
    rpComRenJuridicaLabel16: TppLabel;
    rpComRenJuridicaLabel17: TppLabel;
    rpComRenJuridicaLabel18: TppLabel;
    rpComRenJuridicaLabel19: TppLabel;
    rpComRenJuridicaLine11: TppLine;
    rpComRenJuridicaLine17: TppLine;
    rpComRenJuridicaLine21: TppLine;
    rpComRenJuridicaLine7: TppLine;
    rpComRenJuridicaLine19: TppLine;
    rpComRenJuridicaLine22: TppLine;
    rpComRenJuridicaDBText2: TppDBText;
    rpComRenJuridicaDBText3: TppDBText;
    rpComRenJuridicaDBText4: TppDBText;
    rpComRenJuridicaDBText5: TppDBText;
    rpComRenJuridicaDBText6: TppDBText;
    rpComRenJuridicaDBText7: TppDBText;
    rpComRenJuridicaDBText8: TppDBText;
    rpComRenJuridicaDBText9: TppDBText;
    rpComRenJuridicaDBText10: TppDBText;
    rpComRenJuridicaDBText11: TppDBText;
    rpComRenJuridicaDBText12: TppDBText;
    rpComRenJuridicaDBText13: TppDBText;
    rpComRenJuridicaDBText26: TppDBText;
    rpComRenJuridicaDBText27: TppDBText;
    rpComRenJuridicaDBText28: TppDBText;
    rpComRenJuridicaDBText29: TppDBText;
    rpComRenJuridicaDBText30: TppDBText;
    rpComRenJuridicaDBText31: TppDBText;
    rpComRenJuridicaDBText32: TppDBText;
    rpComRenJuridicaDBText33: TppDBText;
    rpComRenJuridicaDBText34: TppDBText;
    rpComRenJuridicaDBText35: TppDBText;
    rpComRenJuridicaDBText36: TppDBText;
    rpComRenJuridicaDBText37: TppDBText;
    rpComRenJuridicaDBText38: TppDBText;
    rpComRenJuridicaDBText39: TppDBText;
    rpComRenJuridicaDBText40: TppDBText;
    rpComRenJuridicaDBText41: TppDBText;
    rpComRenJuridicaDBText42: TppDBText;
    rpComRenJuridicaDBText43: TppDBText;
    rpComRenJuridicaDBText44: TppDBText;
    rpComRenJuridicaDBText45: TppDBText;
    rpComRenJuridicaDBText46: TppDBText;
    rpComRenJuridicaDBText47: TppDBText;
    rpComRenJuridicaDBText48: TppDBText;
    rpComRenJuridicaDBText49: TppDBText;
    rpComRenJuridicaLabel20: TppLabel;
    rpComRenJuridicaLabel21: TppLabel;
    sqlComRenJuridica: TCMSqlParams;
    cdsComRenJuridica: TCMClientDataSet;
    ppLine3: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatCompAnualRetIRPJCSLLPI: TfrmRelatCompAnualRetIRPJCSLLPI;

implementation

{$R *.DFM}

procedure TfrmRelatCompAnualRetIRPJCSLLPI.CrmRptCMBeforePrint(
  Sender: TObject);
var
  Data, Ano : string;

begin
   inherited;
   Ano := CmpRptCM.ParamValues[0].Asstring;

   sqlComRenJuridica.SQL.Clear;
   sqlComRenJuridica.sql.Append(' SELECT ');
   sqlComRenJuridica.sql.Append(' LAN.TIPO, LAN.NOMEBENEF, LAN.CGCBENEF, LAN.IDBENEFIRRF, ');
   sqlComRenJuridica.sql.Append(' E.NUMDOCUMENTO AS CGCFONTE, E.RAZAOSOCIAL AS NOMEFONTE, ');
   sqlComRenJuridica.sql.Append(' ((EN.LOGRADOURO)||'', Nº''||(EN.NUMERO)||'', ''||(EN.COMPLEMENTO)||'', ''||(EN.BAIRRO)) AS ENDERECO, ');
   sqlComRenJuridica.sql.Append(' C.NOME, ES.CODESTADO AS UF, LAN.CODNATUREZA, LAN.DESCRICAO, ');
   sqlComRenJuridica.sql.Append(' (''-'') AS TELEFONE, SUM(LAN.JANTOTALREND) as jantotalrend, SUM(LAN.FEVTOTALREND) as fevtotalrend, ');
   sqlComRenJuridica.sql.Append(' SUM(LAN.MARTOTALREND) as martotalrend, SUM(LAN.ABRTOTALREND) as abrtotalrend, SUM(LAN.MAITOTALREND) as maitotalrend, ');
   sqlComRenJuridica.sql.Append(' SUM(LAN.JUNTOTALREND) as juntotalrend, SUM(LAN.JULTOTALREND) as jultotalrend, SUM(LAN.AGOTOTALREND) as agototalrend, ');
   sqlComRenJuridica.sql.Append(' SUM(LAN.SETTOTALREND) as settotalrend, SUM(LAN.OUTTOTALREND) as outtotalrend, SUM(LAN.NOVTOTALREND) as novtotalrend, ');
   sqlComRenJuridica.sql.Append(' SUM(LAN.DEZTOTALREND) as deztotalrend, ');
   sqlComRenJuridica.sql.Append(' SUM(LAN.JANRETIDOFON + LAN.JANRETIDOCSCOFPIS + LAN.JANRETIDOPIS + LAN.JANRETIDOCOFINS + LAN.JANRETIDOCSLL) as JANRETIDOFON, ');
   sqlComRenJuridica.sql.Append(' SUM(LAN.fevRETIDOFON + LAN.fevRETIDOCSCOFPIS + LAN.fevRETIDOPIS + LAN.fevRETIDOCOFINS + LAN.fevRETIDOCSLL) as fevRETIDOFON, ');
   sqlComRenJuridica.sql.Append(' SUM(LAN.marRETIDOFON + LAN.marRETIDOCSCOFPIS + LAN.marRETIDOPIS + LAN.marRETIDOCOFINS + LAN.marRETIDOCSLL) as marRETIDOFON, ');
   sqlComRenJuridica.sql.Append(' SUM(LAN.abrRETIDOFON + LAN.abrRETIDOCSCOFPIS + LAN.abrRETIDOPIS + LAN.abrRETIDOCOFINS + LAN.abrRETIDOCSLL) as abrRETIDOFON, ');
   sqlComRenJuridica.sql.Append(' SUM(LAN.maiRETIDOFON + LAN.maiRETIDOCSCOFPIS + LAN.maiRETIDOPIS + LAN.maiRETIDOCOFINS + LAN.maiRETIDOCSLL) as maiRETIDOFON, ');
   sqlComRenJuridica.sql.Append(' SUM(LAN.junRETIDOFON + LAN.junRETIDOCSCOFPIS + LAN.junRETIDOPIS + LAN.junRETIDOCOFINS + LAN.junRETIDOCSLL) as junRETIDOFON, ');
   sqlComRenJuridica.sql.Append(' SUM(LAN.julRETIDOFON + LAN.julRETIDOCSCOFPIS + LAN.julRETIDOPIS + LAN.julRETIDOCOFINS + LAN.julRETIDOCSLL) as julRETIDOFON, ');
   sqlComRenJuridica.sql.Append(' SUM(LAN.agoRETIDOFON + LAN.agoRETIDOCSCOFPIS + LAN.agoRETIDOPIS + LAN.agoRETIDOCOFINS + LAN.agoRETIDOCSLL) as agoRETIDOFON, ');
   sqlComRenJuridica.sql.Append(' SUM(LAN.setRETIDOFON + LAN.setRETIDOCSCOFPIS + LAN.setRETIDOPIS + LAN.setRETIDOCOFINS + LAN.setRETIDOCSLL) as setRETIDOFON, ');
   sqlComRenJuridica.sql.Append(' SUM(LAN.outRETIDOFON + LAN.outRETIDOCSCOFPIS + LAN.outRETIDOPIS + LAN.outRETIDOCOFINS + LAN.outRETIDOCSLL) as outRETIDOFON, ');
   sqlComRenJuridica.sql.Append(' SUM(LAN.novRETIDOFON + LAN.novRETIDOCSCOFPIS + LAN.novRETIDOPIS + LAN.novRETIDOCOFINS + LAN.novRETIDOCSLL) as novRETIDOFON, ');
   sqlComRenJuridica.sql.Append(' SUM(LAN.dezRETIDOFON + LAN.dezRETIDOCSCOFPIS + LAN.dezRETIDOPIS + LAN.dezRETIDOCOFINS + LAN.dezRETIDOCSLL) as dezRETIDOFON ');
   sqlComRenJuridica.sql.Append(' FROM (SELECT ');
   sqlComRenJuridica.sql.Append(' P.TIPO, ');
   sqlComRenJuridica.sql.Append(' P.RAZAOSOCIAL AS NOMEBENEF, ');
   sqlComRenJuridica.sql.Append(' P.NUMDOCUMENTO AS CGCBENEF, ');
   sqlComRenJuridica.sql.Append(' L.IDBENEFIRRF, ');
   sqlComRenJuridica.sql.Append(' NAT.CODNATUREZA, ');
   sqlComRenJuridica.sql.Append(' NAT.DESCRICAO, ');
   //CPREV - Pend. 27082 - sqlComRenJuridica.sql.Append(' SUBSTR(L.NUMDOCUMENTO, 1, 8) AS RAIZDOCUMENTO, ');
   sqlComRenJuridica.sql.Append(' L.CODDOCUMENTO, ');
   sqlComRenJuridica.sql.Append(' DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''01'', L.VLRBASE, 0) AS JANTOTALREND, ');
   sqlComRenJuridica.sql.Append(' DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''02'', L.VLRBASE, 0) AS FEVTOTALREND, ');
   sqlComRenJuridica.sql.Append(' DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''03'', L.VLRBASE, 0) AS MARTOTALREND, ');
   sqlComRenJuridica.sql.Append(' DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''04'', L.VLRBASE, 0) AS ABRTOTALREND, ');
   sqlComRenJuridica.sql.Append(' DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''05'', L.VLRBASE, 0) AS MAITOTALREND, ');
   sqlComRenJuridica.sql.Append(' DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''06'', L.VLRBASE, 0) AS JUNTOTALREND, ');
   sqlComRenJuridica.sql.Append(' DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''07'', L.VLRBASE, 0) AS JULTOTALREND, ');
   sqlComRenJuridica.sql.Append(' DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''08'', L.VLRBASE, 0) AS AGOTOTALREND, ');
   sqlComRenJuridica.sql.Append(' DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''09'', L.VLRBASE, 0) AS SETTOTALREND, ');
   sqlComRenJuridica.sql.Append(' DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''10'', L.VLRBASE, 0) AS OUTTOTALREND, ');
   sqlComRenJuridica.sql.Append(' DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''11'', L.VLRBASE, 0) AS NOVTOTALREND, ');
   sqlComRenJuridica.sql.Append(' DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''12'', L.VLRBASE, 0) AS DEZTOTALREND, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''01'', L.VLRIRRF, 0)) AS JANRETIDOFON, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''02'', L.VLRIRRF, 0)) AS FEVRETIDOFON, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''03'', L.VLRIRRF, 0)) AS MARRETIDOFON, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''04'', L.VLRIRRF, 0)) AS ABRRETIDOFON, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''05'', L.VLRIRRF, 0)) AS MAIRETIDOFON, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''06'', L.VLRIRRF, 0)) AS JUNRETIDOFON, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''07'', L.VLRIRRF, 0)) AS JULRETIDOFON, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''08'', L.VLRIRRF, 0)) AS AGORETIDOFON, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''09'', L.VLRIRRF, 0)) AS SETRETIDOFON, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''10'', L.VLRIRRF, 0)) AS OUTRETIDOFON, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''11'', L.VLRIRRF, 0)) AS NOVRETIDOFON, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''12'', L.VLRIRRF, 0)) AS DEZRETIDOFON, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''01'', L.VLRCOFINS, 0)) AS JANRETIDOCOFINS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''02'', L.VLRCOFINS, 0)) AS FEVRETIDOCOFINS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''03'', L.VLRCOFINS, 0)) AS MARRETIDOCOFINS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''04'', L.VLRCOFINS, 0)) AS ABRRETIDOCOFINS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''05'', L.VLRCOFINS, 0)) AS MAIRETIDOCOFINS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''06'', L.VLRCOFINS, 0)) AS JUNRETIDOCOFINS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''07'', L.VLRCOFINS, 0)) AS JULRETIDOCOFINS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''08'', L.VLRCOFINS, 0)) AS AGORETIDOCOFINS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''09'', L.VLRCOFINS, 0)) AS SETRETIDOCOFINS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''10'', L.VLRCOFINS, 0)) AS OUTRETIDOCOFINS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''11'', L.VLRCOFINS, 0)) AS NOVRETIDOCOFINS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''12'', L.VLRCOFINS, 0)) AS DEZRETIDOCOFINS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''01'', L.VLRCSLL, 0)) AS JANRETIDOCSLL, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''02'', L.VLRCSLL, 0)) AS FEVRETIDOCSLL, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''03'', L.VLRCSLL, 0)) AS MARRETIDOCSLL, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''04'', L.VLRCSLL, 0)) AS ABRRETIDOCSLL, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''05'', L.VLRCSLL, 0)) AS MAIRETIDOCSLL, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''06'', L.VLRCSLL, 0)) AS JUNRETIDOCSLL, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''07'', L.VLRCSLL, 0)) AS JULRETIDOCSLL, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''08'', L.VLRCSLL, 0)) AS AGORETIDOCSLL, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''09'', L.VLRCSLL, 0)) AS SETRETIDOCSLL, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''10'', L.VLRCSLL, 0)) AS OUTRETIDOCSLL, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''11'', L.VLRCSLL, 0)) AS NOVRETIDOCSLL, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''12'', L.VLRCSLL, 0)) AS DEZRETIDOCSLL, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''01'', L.VLRCSCOFPIS, 0)) AS JANRETIDOCSCOFPIS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''02'', L.VLRCSCOFPIS, 0)) AS FEVRETIDOCSCOFPIS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''03'', L.VLRCSCOFPIS, 0)) AS MARRETIDOCSCOFPIS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''04'', L.VLRCSCOFPIS, 0)) AS ABRRETIDOCSCOFPIS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''05'', L.VLRCSCOFPIS, 0)) AS MAIRETIDOCSCOFPIS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''06'', L.VLRCSCOFPIS, 0)) AS JUNRETIDOCSCOFPIS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''07'', L.VLRCSCOFPIS, 0)) AS JULRETIDOCSCOFPIS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''08'', L.VLRCSCOFPIS, 0)) AS AGORETIDOCSCOFPIS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''09'', L.VLRCSCOFPIS, 0)) AS SETRETIDOCSCOFPIS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''10'', L.VLRCSCOFPIS, 0)) AS OUTRETIDOCSCOFPIS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''11'', L.VLRCSCOFPIS, 0)) AS NOVRETIDOCSCOFPIS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''12'', L.VLRCSCOFPIS, 0)) AS DEZRETIDOCSCOFPIS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''01'', L.VLRPIS, 0)) AS JANRETIDOPIS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''02'', L.VLRPIS, 0)) AS FEVRETIDOPIS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''03'', L.VLRPIS, 0)) AS MARRETIDOPIS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''04'', L.VLRPIS, 0)) AS ABRRETIDOPIS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''05'', L.VLRPIS, 0)) AS MAIRETIDOPIS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''06'', L.VLRPIS, 0)) AS JUNRETIDOPIS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''07'', L.VLRPIS, 0)) AS JULRETIDOPIS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''08'', L.VLRPIS, 0)) AS AGORETIDOPIS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''09'', L.VLRPIS, 0)) AS SETRETIDOPIS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''10'', L.VLRPIS, 0)) AS OUTRETIDOPIS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''11'', L.VLRPIS, 0)) AS NOVRETIDOPIS, ');
   sqlComRenJuridica.sql.Append(' SUM(DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''12'', L.VLRPIS, 0)) AS DEZRETIDOPIS ');
   sqlComRenJuridica.sql.Append('FROM ');
   sqlComRenJuridica.sql.Append('  LANCIRRF L, ');
   sqlComRenJuridica.sql.Append('  PESSOA P, ');
   sqlComRenJuridica.sql.Append('  NATURENDIMENTO NAT ');
   sqlComRenJuridica.sql.Append('WHERE ');

   if Trim(CmpRptCM.ParamValues[5].Asstring) <> '' then
      sqlComRenJuridica.sql.Append(' (P.NUMDOCUMENTO = '+quotedStr(CmpRptCM.ParamValues[5].Asstring)+') AND ');

   if Trim(CmpRptCM.ParamValues[6].Asstring) <> '' then
      sqlComRenJuridica.sql.Append(' (L.CODNATUREZA IN ('+CmpRptCM.ParamValues[6].Asstring+')) AND ');

   sqlComRenJuridica.sql.Append('  (P.TIPO = :sTipo) ');
   sqlComRenJuridica.sql.Append('  AND (P.IDPESSOA = L.IDBENEFIRRF) ');
   sqlComRenJuridica.sql.Append('  AND (L.IDMODULO NOT IN (18,21)) ');
   sqlComRenJuridica.sql.Append('    AND (L.DATAPAGAMENTO BETWEEN TO_DATE(:sDataIni,''DD/MM/YYYY'') AND ');
   sqlComRenJuridica.sql.Append('                                TO_DATE(:sDataFim,''DD/MM/YYYY'')) ');

  sqlComRenJuridica.sql.Append('  AND (NAT.CODNATUREZA = L.CODNATUREZA) ');
  sqlComRenJuridica.sql.Append('GROUP BY ');
  sqlComRenJuridica.sql.Append('  P.TIPO, ');
  sqlComRenJuridica.sql.Append('  P.RAZAOSOCIAL, ');
  sqlComRenJuridica.sql.Append('  P.NUMDOCUMENTO, ');
  sqlComRenJuridica.sql.Append('  L.IDBENEFIRRF, ');
  //CPREV - Pend. 27082 - sqlComRenJuridica.sql.Append('  SUBSTR(L.NUMDOCUMENTO, 1, 8), ');
  sqlComRenJuridica.sql.Append('  NAT.CODNATUREZA, ');
  sqlComRenJuridica.sql.Append('  NAT.DESCRICAO, ');
  sqlComRenJuridica.sql.Append('  L.CODDOCUMENTO, ');
  sqlComRenJuridica.sql.Append('  DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''01'', L.VLRBASE, 0), ');
  sqlComRenJuridica.sql.Append('  DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''02'', L.VLRBASE, 0), ');
  sqlComRenJuridica.sql.Append('  DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''03'', L.VLRBASE, 0), ');
  sqlComRenJuridica.sql.Append('  DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''04'', L.VLRBASE, 0), ');
  sqlComRenJuridica.sql.Append('  DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''05'', L.VLRBASE, 0), ');
  sqlComRenJuridica.sql.Append('  DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''06'', L.VLRBASE, 0), ');
  sqlComRenJuridica.sql.Append('  DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''07'', L.VLRBASE, 0), ');
  sqlComRenJuridica.sql.Append('  DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''08'', L.VLRBASE, 0), ');
  sqlComRenJuridica.sql.Append('  DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''09'', L.VLRBASE, 0), ');
  sqlComRenJuridica.sql.Append('  DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''10'', L.VLRBASE, 0), ');
  sqlComRenJuridica.sql.Append('  DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''11'', L.VLRBASE, 0), ');
  sqlComRenJuridica.sql.Append('  DECODE(TO_CHAR(L.DATAPAGAMENTO, ''MM''), ''12'', L.VLRBASE, 0)) LAN, ');
  sqlComRenJuridica.sql.Append('PESSOA E, ');
  sqlComRenJuridica.sql.Append('ENDPESS EN, ');
  sqlComRenJuridica.sql.Append('CIDADES C, ');
  sqlComRenJuridica.sql.Append('ESTADO ES, ');
  sqlComRenJuridica.sql.Append('EMPRESAPROP EP ');

   sqlComRenJuridica.sql.Append('WHERE (EP.IDPESSOA      = E.IDPESSOA) ');
   sqlComRenJuridica.sql.Append('  AND (EN.IDENDERECO(+) = E.IDENDCOMERCIAL) ');
   sqlComRenJuridica.sql.Append('  AND (EN.IDCIDADES     = C.IDCIDADES(+)) ');
   sqlComRenJuridica.sql.Append('  AND (ES.IDESTADO(+)   = C.IDESTADO) ');
   sqlComRenJuridica.sql.Append('  AND (EN.IDPESSOA(+)   = E.IDPESSOA) ');

   sqlComRenJuridica.sql.Append(' GROUP BY ');
   sqlComRenJuridica.sql.Append('   LAN.TIPO, ');
   sqlComRenJuridica.sql.Append('   LAN.NOMEBENEF, ');
   sqlComRenJuridica.sql.Append('   LAN.CGCBENEF, ');
   sqlComRenJuridica.sql.Append('   LAN.IDBENEFIRRF, ');
   sqlComRenJuridica.sql.Append('   E.NUMDOCUMENTO , ');
   sqlComRenJuridica.sql.Append('   E.RAZAOSOCIAL, ');
   sqlComRenJuridica.sql.Append('   (EN.LOGRADOURO), ');
   sqlComRenJuridica.sql.Append('   (EN.NUMERO), ');
   sqlComRenJuridica.sql.Append('   (EN.COMPLEMENTO), ');
   sqlComRenJuridica.sql.Append('   (EN.BAIRRO), ');
   sqlComRenJuridica.sql.Append('   C.NOME, ');
   sqlComRenJuridica.sql.Append('   ES.CODESTADO , ');
   sqlComRenJuridica.sql.Append('   LAN.CODNATUREZA, ');
   sqlComRenJuridica.sql.Append('   LAN.DESCRICAO, ');
   sqlComRenJuridica.sql.Append('   (''-'') ');

   sqlComRenJuridica.sql.Append(' ORDER BY ');
   sqlComRenJuridica.sql.Append('   LAN.NOMEBENEF, ');
   sqlComRenJuridica.sql.Append('   LAN.IDBENEFIRRF, ');
   sqlComRenJuridica.sql.Append('   LAN.CODNATUREZA ');

   sqlComRenJuridica.Prepare;
   sqlComRenJuridica.ParamByName('sDataIni').AsString   := '01/01/'+Ano;
   sqlComRenJuridica.ParamByName('sDataFim').AsString   := '31/12/'+Ano;
   if CmpRptCM.ParamValues[4].AsInteger = 0 then
     Begin
       sqlComRenJuridica.ParamByName('sTipo').AsString := 'J';
       ppDBText5.DisplayFormat                         := 'AA.AAA.AAA/AAAA-99;0;_';       // Paulo Nobre - WO34233
       ppLabel13.Caption                               := '2. PESSOA JURÍDICA FORNECEDORA DO BEM OU PRESTADORA DE SERVIÇO';
       ppLabel16.Caption                               := 'CNPJ';
       ppLabel17.Caption                               := 'NOME COMPLETO';
     end
   else
     Begin
       SqlComRenJuridica.ParamByName('sTipo').AsString := 'F';
       ppDBText5.DisplayFormat                         := '999.999.999-99;0;_';
       ppLabel13.Caption                               := '2. PESSOA FÍSICA BENEFICIÁRIA DOS RENDIMENTOS';
       ppLabel16.Caption                               := 'CPF';
       ppLabel17.Caption                               := 'NOME';
     end;
   Data := DateTimeToStr(Date);
   rpComRenJuridicaLabel22.Text := 'Ano - calendário: '+ ano;
   ppLabel39.caption := CmpRptCM.ParamValues[2].AsString;
   ppLabel41.caption := CmpRptCM.ParamValues[3].AsString;
   sqlComRenJuridica.Open;
end;

end.
