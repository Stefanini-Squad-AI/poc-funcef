unit rDocEstornados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppProd, ppClass,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBClient, uCMClientDataSet, uCmSqlParams, ppPrnabl, ppCtrls, ppBands,
  ppCache, ppVar, ppParameter;

type
  TrptDocEstornados = class(TFrmCmReport)
    SqlDocEstorno: TCMSqlParams;
    CdsDocEstorno: TCMClientDataSet;
    DsDocEstorno: TwwDataSource;
    ppDocEstorno: TppBDEPipeline;
    rptDocEstorno: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppCalc12: TppSystemVariable;
    RptBordPagtoLabel12: TppLabel;
    RptBordPagtoDBCalc1: TppDBCalc;
    ppLine1: TppLine;
    ppDBText7: TppDBText;
    ppLabel8: TppLabel;
    ppCalc3: TppSystemVariable;
    pnlDetalhe: TppShape;
    ppLabel9: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptDocEstornados: TrptDocEstornados;

implementation

{$R *.DFM}

procedure TrptDocEstornados.CrmRptCMBeforePrint(Sender: TObject);
var
  DtIniLanc, DtFimLanc, DtIniProg, DtFimProg, DtIniVenc, DtFimVenc: String;
begin
  inherited;
  DtIniLanc:= CmpRptCM.ParamValues[0].AsString;
  DtFimLanc:= CmpRptCM.ParamValues[1].AsString;
  DtIniProg:= CmpRptCM.ParamValues[2].AsString;
  DtFimProg:= CmpRptCM.ParamValues[3].AsString;
  DtIniVenc:= CmpRptCM.ParamValues[4].AsString;
  DtFimVenc:= CmpRptCM.ParamValues[5].AsString;

  with SqlDocEstorno, SqlDocEstorno.sql do
  begin
    clear;
    Add(' SELECT D.CODDOCUMENTO, D.IDFORCLI, L.VALOR AS SALDO, D.IDPESSOA,D.NODOCUMENTO, L.datalancto, D.DATAPROGRAMADA, ');
    Add('        D.DATAVENCTO,D.RECPAG,P.RAZAOSOCIAL AS NOME,  TD.DESCRICAO AS TIPODOC ');
    Add(' FROM DOCUMENTO D, PESSOA P,  TIPODOCRECPAG TD, LANCTODOCUM L ');
    Add(' WHERE (P.IDPESSOA = D.IDFORCLI) AND ');
    Add('       (TD.CODTIPDOC = D.CODTIPDOC) AND ');
    Add('       (L.CODDOCUMENTO = D.CODDOCUMENTO) AND ');
    Add('       (L.OPERACAO = ''5'' ) AND ');
    Add('  (L.NUMLANCTO = (SELECT MAX(NUMLANCTO) AS NUMLANCTO FROM LANCTODOCUM ');
    Add('                  WHERE OPERACAO = ''5'' AND ');
    Add('                  CODDOCUMENTO = L.CODDOCUMENTO) )  ');

    if length(DtIniLanc)>0 then
    begin
      Add('  AND (L.DATALANCTO >= TO_DATE('''+DtIniLanc+''',''DD/MM/YYYY'')) ');
      Add('  AND (L.DATALANCTO <= TO_DATE('''+DtFimLanc+''',''DD/MM/YYYY'')) ');
    end;

    if length(DtIniProg)>0 then
    begin
       Add(' AND (D.dataprogramada >= TO_DATE('''+DtIniProg+''',''DD/MM/YYYY'')) ');
       Add(' AND (D.dataprogramada <= TO_DATE('''+DtFimProg+''',''DD/MM/YYYY'')) ');
    end;

    if length(DtIniVenc)>0 then
    begin
       Add(' AND ( D.datavencto >= TO_DATE('''+DtIniVenc+''',''DD/MM/YYYY'')) ');
       Add(' AND ( D.datavencto <= TO_DATE('''+DtFimVenc+''',''DD/MM/YYYY'')) ');
    end;

    Add('  AND L.ESTORNO IS NOT NULL ');
    Add(' ORDER BY D.NODOCUMENTO ');

    Prepare;
    open;
  end;

end;

procedure TrptDocEstornados.ppDetailBand1BeforePrint(Sender: TObject);
begin
  inherited;
  if pnlDetalhe.Brush.Color = clWhite then
       pnlDetalhe.Brush.Color:= clInfoBk
  else
     pnlDetalhe.Brush.Color:= clWhite;
end;

end.
