unit RCompRecPag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ppDB, ppDBPipe, ppDBBDE, Wwdatsrc, ppVar,
  ppBands, ppCtrls, Series, TeEngine, ExtCtrls, TeeProcs, Chart, DBChart,
  ppChrtDB, ppPrnabl, ppClass, ppChrt, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, TXRB;

type
  TRptCompRecPag = class(TFrmCmReport)
    spCompRecPag: TCMSqlParams;
    cdsCompRecPag: TCMClientDataSet;
    rpCompRecPag: TppReport;
    ppHeaderBand3: TppHeaderBand;
    rpCompRecPagDBTeeChart1: TppDBTeeChart;
    Series4: TPieSeries;
    Series5: TBarSeries;
    Series1: THorizBarSeries;
    ppLine5: TppLine;
    pplblEmpresa: TppLabel;
    rpBalanceteLabel1: TppLabel;
    lbDataComposicao: TppLabel;
    rpCompRecPagLabel1: TppLabel;
    lbCentroRespos: TppLabel;
    lbAtividade: TppLabel;
    rpCompRecPagLabel4: TppLabel;
    lbTitulo: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppLine7: TppLine;
    pplblSistema: TppLabel;
    ppCalc8: TppSystemVariable;
    dsCompRecPag: TwwDataSource;
    pplCompRecPag: TppBDEPipeline;

    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);


  private { Private declarations }

    sMascaraCAR : String;
    sMascaraCAP : String;


  public  { Public declarations }


  end;




var
  RptCompRecPag: TRptCompRecPag;




implementation
{$R *.DFM}
uses
  uCtrlParamIntegra, uSistema, uFuncaoGeral;



procedure TRptCompRecPag.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   CmpRptCM.ParamValues[0].TextDefault:=FormatDateTime('dd/mm/yyyy',Date);
   CmpRptCM.ParamValues[1].TextDefault:=FormatDateTime('dd/mm/yyyy',Date);

   CmpRptCM.ParamValues[2].LookupSettings.SQL.Text:='SELECT UNIDNEGOC,NOME '+
                                                    'FROM UNIDNEGOCIO '+
                                                    'WHERE (IDPESSOA = '+
                                                            FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

   CmpRptCM.ParamValues[3].LookupSettings.SQL.Text:='SELECT CODCENTRORESPON,NOME '+
                                                    'FROM CENTRESPON  '+
                                                    'WHERE (IDPESSOA = '+
                                                            FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'AND (IDPLANCRESPON =  '+
                                                          InttoStr(ParamIntegra.PlanoCentroRespon)+') ' +
                                                    'ORDER BY NOME';

   ParamIntegra.GetParams(Trunc(CrmRptCM.IdEmpresa), 0, 'INTEGRACONTAB', 'PARAMFINANC', tiSistema);

   sMascaraCAR:=ParamIntegra.MascaraReceb;
   sMascaraCAP:=ParamIntegra.MascaraDesemb;

   CmpRptCM.ParamValues[5].SpinEditSettings.MaxValue:=FuncaoGeral.CalcGrauMax(sMascaraCAR);
   CmpRptCM.ParamValues[6].SpinEditSettings.MaxValue:=FuncaoGeral.CalcGrauMax(sMascaraCAP);
end;



procedure TRptCompRecPag.CrmRptCMBeforePrint(Sender: TObject);
var
   iNumMaxEle : Integer;
begin
   inherited;
   if (CmpRptCM.ParamValues[4].AsString='R') then
      iNumMaxEle:=FuncaoGeral.CalcNumEleGrau(sMascaraCAR,CmpRptCM.ParamValues[5].AsInteger)
   else
      iNumMaxEle:=FuncaoGeral.CalcNumEleGrau(sMascaraCAR,CmpRptCM.ParamValues[6].AsInteger);

   spCompRecPag.SQL.Clear;
   spCompRecPag.SQL.Add(' SELECT ');
   spCompRecPag.SQL.Add('    T.DESCRICAO, ');
   spCompRecPag.SQL.Add('    F.RECPAG, ');
   spCompRecPag.SQL.Add('    SUBSTR(F.CODTIPRECDES,1,'+IntToStr(iNumMaxEle)+') AS CODTIPRECDES, ');
   spCompRecPag.SQL.Add('    SUM(F.VALOR*CV.COTVALOR) AS VALORC ');
   spCompRecPag.SQL.Add(' FROM ');
   spCompRecPag.SQL.Add('    FLUXOREAL F, ');
   spCompRecPag.SQL.Add('    TIPORECEBDESEMB T, ');
   spCompRecPag.SQL.Add('    (SELECT C.MOECODIGO,C.COTDATA,C.COTVALOR ');
   spCompRecPag.SQL.Add('     FROM ');
   spCompRecPag.SQL.Add('        COTACAOMOEDA C, ');
   spCompRecPag.SQL.Add('       (SELECT MOECODIGO,MAX(COTDATA) AS DATA ');
   spCompRecPag.SQL.Add('        FROM COTACAOMOEDA GROUP BY MOECODIGO) CD ');
   spCompRecPag.SQL.Add('     WHERE ');
   spCompRecPag.SQL.Add('        (C.MOECODIGO = CD.MOECODIGO) AND');
   spCompRecPag.SQL.Add('        (C.COTDATA = CD.DATA)) CV ');
   spCompRecPag.SQL.Add(' WHERE ');
   spCompRecPag.SQL.Add('    (F.DATACFLOAT >= TO_DATE('''+
     FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)+''',''DD/MM/YYYY'')) AND ');
   spCompRecPag.SQL.Add('    (F.DATACFLOAT <= TO_DATE('''+
     FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime)+''',''DD/MM/YYYY''))');

   if not(CmpRptCM.ParamValues[2].IsNull) then
      spCompRecPag.SQL.Add('     AND (F.UNIDNEGOC = '+FloatToStr(CmpRptCM.ParamValues[2].AsFloat)+') ');

   if not(CmpRptCM.ParamValues[3].IsNull) then
      spCompRecPag.SQL.Add('     AND (RTRIM(F.CODCENTRORESPON) = '''+
                            Trim(CmpRptCM.ParamValues[2].AsString)+''') ');

   spCompRecPag.SQL.Add('     AND (F.RECPAG = '''+CmpRptCM.ParamValues[4].AsString+''') ');

   spCompRecPag.SQL.Add('     AND (F.IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') ');
   spCompRecPag.SQL.Add('     AND (CV.MOECODIGO = F.MOECODIGO) ');
   spCompRecPag.SQL.Add('     AND (SUBSTR(F.CODTIPRECDES,1,'+IntToStr(iNumMaxEle)+
                                   ') = RTRIM(T.CODTIPRECDES)) ');
   spCompRecPag.SQL.Add('     AND (F.RECPAG = T.RECPAG) ');
   spCompRecPag.SQL.Add('     AND (F.IDPESSOA = T.IDPESSOA) ');
   spCompRecPag.SQL.Add(' GROUP BY ');
   spCompRecPag.SQL.Add('   T.DESCRICAO, ');
   spCompRecPag.SQL.Add('   F.RECPAG, ');
   spCompRecPag.SQL.Add('   SUBSTR(F.CODTIPRECDES,1,'+IntToStr(iNumMaxEle)+')');
   spCompRecPag.SQL.Add(' ORDER BY ');
   spCompRecPag.SQL.Add('   VALORC ');

   if (CmpRptCM.ParamValues[4].AsString='R') then
      lbTitulo.caption:='Composição dos Recebimentos'
   else
      lbTitulo.caption:='Composição dos Pagamentos';

   lbDataComposicao.caption:=FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)+ ' à ' +
                             FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime);

   if not(CmpRptCM.ParamValues[3].IsNull) then
      lbCentroRespos.caption:=CmpRptCM.ParamValues[3].AsString
   else
      lbCentroRespos.caption:='Todos';

   if not(CmpRptCM.ParamValues[2].IsNull) then
      lbAtividade.caption:=FloatToStr(CmpRptCM.ParamValues[2].AsFloat)
   else
      lbAtividade.caption:='Todos';

   spCompRecPag.Open;

   case CmpRptCM.ParamValues[7].AsInteger of
      0: begin
            rpCompRecPagDBTeeChart1.Chart.Series[0].Active:=True;
            rpCompRecPagDBTeeChart1.Chart.Series[1].Active:=False;
            rpCompRecPagDBTeeChart1.Chart.Series[2].Active:=False;
            rpCompRecPagDBTeeChart1.Chart.View3D:=True;
            rpCompRecPagDBTeeChart1.Chart.Chart3DPercent:=5;
         end;
      1: begin
            rpCompRecPagDBTeeChart1.Chart.Series[0].Active:=False;
            rpCompRecPagDBTeeChart1.Chart.Series[1].Active:=True;
            rpCompRecPagDBTeeChart1.Chart.Series[2].Active:=False;
            rpCompRecPagDBTeeChart1.Chart.View3D:=True;
            rpCompRecPagDBTeeChart1.Chart.Chart3DPercent:=25;
         end;
      2: begin
            rpCompRecPagDBTeeChart1.Chart.Series[0].Active:=False;
            rpCompRecPagDBTeeChart1.Chart.Series[1].Active:=False;
            rpCompRecPagDBTeeChart1.Chart.Series[2].Active:=True;
            rpCompRecPagDBTeeChart1.Chart.View3D:=True;
            rpCompRecPagDBTeeChart1.Chart.Chart3DPercent:=25;
         end;
   end;
end;



end.
