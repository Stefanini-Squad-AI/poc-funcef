unit ROrcadoXReal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCtrlRptOrcado, Db,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands, ppClass, ppCtrls, ppVar,
  ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, uCmSqlParams,
  DBClient, uCMClientDataSet, TXRB;

type
  TRptOrcadoXReal = class(TFrmCmReport)
    spOrcadoXReal: TCMSqlParams;
    cdsOrcadoXReal: TCMClientDataSet;
    rpOrcadoXReal: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLabel10: TppLabel;
    ppLine10: TppLine;
    pplblEmpresa: TppLabel;
    rpOrcxReaLabel1: TppLabel;
    rpOrcxReaLabel2: TppLabel;
    rpOrcxReaLabel3: TppLabel;
    rpOrcxReaLabel4: TppLabel;
    rpOrcxReaLabel5: TppLabel;
    rpOrcxReaLabel6: TppLabel;
    rpOrcxReaLine2: TppLine;
    rpOrcxReaLine3: TppLine;
    ppDetailBand8: TppDetailBand;
    rpOrcxReaDBText2: TppDBText;
    rpOrcxReaDBText3: TppDBText;
    rpOrcxReaDBText4: TppDBText;
    rpOrcxReaDBText5: TppDBText;
    rpOrcxReaDBText1: TppDBText;
    ppFooterBand8: TppFooterBand;
    ppLine11: TppLine;
    pplblSistema: TppLabel;
    ppCalc12: TppSystemVariable;
    ppCalc13: TppSystemVariable;
    rpOrcxReaSummaryBand1: TppSummaryBand;
    rpOrcxReaLabel8: TppLabel;
    rpOrcxReaDBCalc4: TppDBCalc;
    rpOrcxReaDBCalc5: TppDBCalc;
    rpOrcxReaDBCalc6: TppDBCalc;
    rpOrcxReaLine4: TppLine;
    rpOrcxReaLine5: TppLine;
    rpOrcxReaLabel12: TppLabel;
    rpOrcxReaDBCalc15: TppDBCalc;
    rpOrcxReaDBCalc14: TppDBCalc;
    rpOrcxReaGroup1: TppGroup;
    rpOrcxReaGroupHeaderBand1: TppGroupHeaderBand;
    rpOrcxReaLine7: TppLine;
    rpOrcxReaGroupFooterBand1: TppGroupFooterBand;
    rpOrcxReaLabel10: TppLabel;
    rpOrcxReaDBText8: TppDBText;
    rpOrcxReaLabel11: TppLabel;
    rpOrcxReaDBCalc7: TppDBCalc;
    rpOrcxReaDBCalc8: TppDBCalc;
    rpOrcxReaDBCalc9: TppDBCalc;
    rpOrcxReaDBCalc12: TppDBCalc;
    rpOrcxReaDBCalc13: TppDBCalc;
    rpOrcxReaGroup2: TppGroup;
    rpOrcxReaGroupHeaderBand2: TppGroupHeaderBand;
    rpOrcxReaDBText6: TppDBText;
    rpOrcxReaLine1: TppLine;
    rpOrcxReaGroupFooterBand2: TppGroupFooterBand;
    rpOrcxReaLine6: TppLine;
    rpOrcxReaLabel7: TppLabel;
    rpOrcxReaDBText7: TppDBText;
    rpOrcxReaDBCalc1: TppDBCalc;
    rpOrcxReaDBCalc2: TppDBCalc;
    rpOrcxReaDBCalc3: TppDBCalc;
    rpOrcxReaLabel9: TppLabel;
    rpOrcxReaDBCalc10: TppDBCalc;
    rpOrcxReaDBCalc11: TppDBCalc;
    pplOrcadoXReal: TppBDEPipeline;
    dsOrcadoXReal: TwwDataSource;

    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpOrcxReaLabel11Print(Sender: TObject);
    procedure rpOrcxReaLabel12Print(Sender: TObject);
    procedure rpOrcxReaLabel9Print(Sender: TObject);
    procedure ppDetailBand8BeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles; Index: Integer);


  private { Private declarations }

    aParamMasc    : TParamMasc;
    CtrlRptOrcado : TCtrlRptOrcado;
    sAtivProjeto  : String;
    sCentroRespon : String;
    sCentroCusto  : String;


  public  { Public declarations }


  end;



var
  RptOrcadoXReal: TRptOrcadoXReal;



implementation
{$R *.DFM}
uses
  uCtrlParamIntegra, uFuncaoGeral, dBaseDados, uSistema;



procedure TRptOrcadoXReal.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlRptOrcado:=TCtrlRptOrcado.Create;
   CtrlRptOrcado.Initialize(dtmBaseDados.dbBaseDados,True);
end;



procedure TRptOrcadoXReal.FormDestroy(Sender: TObject);
begin
   CtrlRptOrcado.Free;
   inherited;
end;



procedure TRptOrcadoXReal.CmpRptCMBeforeExecute(var CanExecute: Boolean);
var
   sMascaraCAR   : String;
   sMascaraCAP   : String;
   iNumMaxEleCAR : Integer;
   iNumMaxEleCAP : Integer;
begin
   inherited;
   CmpRptCM.ParamValues[0].TextDefault:=FormatDateTime('dd/mm/yyyy',Date);
   CmpRptCM.ParamValues[1].TextDefault:=FormatDateTime('dd/mm/yyyy',Date);

   CmpRptCM.ParamValues[6].LookupSettings.SQL.Text:='SELECT UNIDNEGOC,NOME '+
                                                    'FROM UNIDNEGOCIO '+
                                                    'WHERE (IDPESSOA = '+
                                                            FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

   CmpRptCM.ParamValues[7].LookupSettings.SQL.Text:='SELECT CODCENTRORESPON,NOME '+
                                                    'FROM CENTRESPON '+
                                                    'WHERE (IDPESSOA = '+
                                                            FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'AND (IDPLANCRESPON =  '+
                                                          InttoStr(ParamIntegra.PlanoCentroRespon)+') ' +
                                                    'ORDER BY NOME';

   CmpRptCM.ParamValues[8].LookupSettings.SQL.Text:='SELECT CODCENTROCUSTO,NOME '+
                                                    'FROM CENTCUST '+
                                                    'WHERE (IDEMPRESA = '+
                                                            FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'AND (IDPLANCENTCUST =  '+
                                                          InttoStr(ParamIntegra.PlanoCentroCusto)+') ' +
                                                    'ORDER BY NOME';

   ParamIntegra.GetParams(Trunc(CrmRptCM.IdEmpresa), 0, 'INTEGRACONTAB', 'PARAMFINANC', tiSistema);

   sMascaraCAR:=ParamIntegra.MascaraReceb;
   sMascaraCAP:=ParamIntegra.MascaraDesemb;

   CmpRptCM.ParamValues[4].SpinEditSettings.MaxValue:=FuncaoGeral.CalcGrauMax(sMascaraCAR);
   CmpRptCM.ParamValues[4].SpinEditSettings.Value:=FuncaoGeral.CalcGrauMax(sMascaraCAR);
   CmpRptCM.ParamValues[5].SpinEditSettings.MaxValue:=FuncaoGeral.CalcGrauMax(sMascaraCAP);
   CmpRptCM.ParamValues[5].SpinEditSettings.Value:=FuncaoGeral.CalcGrauMax(sMascaraCAP);

   iNumMaxEleCAR:=FuncaoGeral.CalcNumEleGrau(sMascaraCAR,FuncaoGeral.CalcGrauMax(sMascaraCAR));
   iNumMaxEleCAP:=FuncaoGeral.CalcNumEleGrau(sMascaraCAP,FuncaoGeral.CalcGrauMax(sMascaraCAP));

   aParamMasc.sMascaraCAR:=sMascaraCAR;
   aParamMasc.sMascaraCAP:=sMascaraCAP;
   aParamMasc.iNumMaxEleCAR:=iNumMaxEleCAR;
   aParamMasc.iNumMaxEleCAP:=iNumMaxEleCAP;
end;



procedure TRptOrcadoXReal.CmpRptCMParamControlExit(Sender: TPainelControles; Index: Integer);
begin
   inherited;
   case Index of
      6: sAtivProjeto:=TPainelControles(Sender).CtrlLookup.Text;
      7: sCentroRespon:=TPainelControles(Sender).CtrlLookup.Text;
      8: sCentroCusto:=TPainelControles(Sender).CtrlLookup.Text;
   end;
end;



procedure TRptOrcadoXReal.CrmRptCMBeforePrint(Sender: TObject);
var
   aFiltro : TFiltro;
begin
   inherited;

   //Carrega dados do Filtro
   aFiltro.rIDPessoa:=CrmRptCM.IdEmpresa;
   aFiltro.dDataInicial:=CmpRptCM.ParamValues[0].AsDateTime;
   aFiltro.dDataFinal:=CmpRptCM.ParamValues[1].AsDateTime;
   aFiltro.sPrazo:=CmpRptCM.ParamValues[3].AsString;

   //Recarrega parâmetros da máscara
   aParamMasc.iNumMaxEleCAR:=FuncaoGeral.CalcNumEleGrau(aParamMasc.sMascaraCAR,
                                                        CmpRptCM.ParamValues[4].AsInteger);
   aParamMasc.iNumMaxEleCAP:=FuncaoGeral.CalcNumEleGrau(aParamMasc.sMascaraCAP,
                                                        CmpRptCM.ParamValues[5].AsInteger);
   aFiltro.rUnidNegoc:=CmpRptCM.ParamValues[6].AsFloat;

   if not(CmpRptCM.ParamValues[7].IsNull) then
      aFiltro.sCodCRespon:=CmpRptCM.ParamValues[7].AsString;

   if not(CmpRptCM.ParamValues[8].IsNull) then
      aFiltro.sCodCCusto:=CmpRptCM.ParamValues[8].AsString;

   aFiltro.bCtasZeradas:=CmpRptCM.ParamValues[10].AsBoolean;

   //Carrega cds
   cdsOrcadoXReal.Data:=CtrlRptOrcado.GeraDadosOrcXReal(aFiltro,aParamMasc);

   //Configura Label
    if not(CmpRptCM.ParamValues[6].IsNull) then
       ppLabel10.Caption := 'ORÇADO x REALIZADO DE '+
                            FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)+
                            ' À '+
                            FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime)+
                            ' - '+sAtivProjeto
    else
     if not(CmpRptCM.ParamValues[7].IsNull) then
        ppLabel10.Caption := 'ORÇADO x REALIZADO DE '+
                             FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)+
                             ' À '+
                             FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime)+
                             ' - '+sCentroRespon
     else
      if not(CmpRptCM.ParamValues[8].IsNull) then
         ppLabel10.Caption := 'ORÇADO x REALIZADO DE '+
                              FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)+
                              ' À '+
                              FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime)+
                              ' - '+sCentroCusto
      else
          ppLabel10.Caption := 'ORÇADO x REALIZADO DE '+
                               FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)+
                               ' À '+
                               FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime);

   if CmpRptCM.ParamValues[9].AsBoolean then
    begin
       rpOrcxReaDBText3.DisplayFormat := '#,0.00;(#,0.00)';
       rpOrcxReaDBText2.DisplayFormat := '#,0.00;(#,0.00)';
       rpOrcxReaDBText4.DisplayFormat := '#,0.00;(#,0.00)';

       rpOrcxReaDBCalc1.DisplayFormat := '#,0.00;(#,0.00)';
       rpOrcxReaDBCalc2.DisplayFormat := '#,0.00;(#,0.00)';
       rpOrcxReaDBCalc3.DisplayFormat := '#,0.00;(#,0.00)';

       rpOrcxReaDBCalc4.DisplayFormat := '#,0.00;(#,0.00)';
       rpOrcxReaDBCalc5.DisplayFormat := '#,0.00;(#,0.00)';
       rpOrcxReaDBCalc6.DisplayFormat := '#,0.00;(#,0.00)';

       rpOrcxReaDBCalc7.DisplayFormat := '#,0.00;(#,0.00)';
       rpOrcxReaDBCalc8.DisplayFormat := '#,0.00;(#,0.00)';
       rpOrcxReaDBCalc9.DisplayFormat := '#,0.00;(#,0.00)';
    end
   else
    begin
       rpOrcxReaDBText3.DisplayFormat := '#,0;(#,0)';
       rpOrcxReaDBText2.DisplayFormat := '#,0;(#,0)';
       rpOrcxReaDBText4.DisplayFormat := '#,0;(#,0)';

       rpOrcxReaDBCalc1.DisplayFormat := '#,0;(#,0)';
       rpOrcxReaDBCalc2.DisplayFormat := '#,0;(#,0)';
       rpOrcxReaDBCalc3.DisplayFormat := '#,0;(#,0)';

       rpOrcxReaDBCalc4.DisplayFormat := '#,0;(#,0)';
       rpOrcxReaDBCalc5.DisplayFormat := '#,0;(#,0)';
       rpOrcxReaDBCalc6.DisplayFormat := '#,0;(#,0)';

       rpOrcxReaDBCalc7.DisplayFormat := '#,0;(#,0)';
       rpOrcxReaDBCalc8.DisplayFormat := '#,0;(#,0)';
       rpOrcxReaDBCalc9.DisplayFormat := '#,0;(#,0)';
    end;
end;



procedure TRptOrcadoXReal.ppDetailBand8BeforePrint(Sender: TObject);
begin
   inherited;

   rpOrcxReaDBText1.Font.Style:=[];
   rpOrcxReaDBText2.Font.Style:=[];
   rpOrcxReaDBText3.Font.Style:=[];
   rpOrcxReaDBText4.Font.Style:=[];
   rpOrcxReaDBText5.Font.Style:=[];
   rpOrcxReaDBText1.Left:=11906;

   if (cdsOrcadoXReal.FieldByName('ANASINT').AsString='S') then
    begin
       rpOrcxReaDBText1.Font.Style:=[fsbold];
       rpOrcxReaDBText2.Font.Style:=[fsbold];
       rpOrcxReaDBText3.Font.Style:=[fsbold];
       rpOrcxReaDBText4.Font.Style:=[fsbold];
       rpOrcxReaDBText5.Font.Style:=[fsbold];
       rpOrcxReaDBText1.Left:=1588;
    end;
end;



procedure TRptOrcadoXReal.rpOrcxReaLabel9Print(Sender: TObject);
begin
  inherited;
  rpOrcxReaLabel9.Caption:= FormatFloat('#,##0.00',
                                         CtrlRptOrcado.DifPercentual(rpOrcxReaDBCalc10.GetText,
                                                                     rpOrcxReaDBCalc11.GetText));
end;



procedure TRptOrcadoXReal.rpOrcxReaLabel11Print(Sender: TObject);
begin
  inherited;
  rpOrcxReaLabel11.Caption:= FormatFloat('#,##0.00',
                                         CtrlRptOrcado.DifPercentual(rpOrcxReaDBCalc12.GetText,
                                                                     rpOrcxReaDBCalc13.GetText));
end;



procedure TRptOrcadoXReal.rpOrcxReaLabel12Print(Sender: TObject);
begin
  inherited;
  rpOrcxReaLabel12.Caption:= FormatFloat('#,##0.00',
                                          CtrlRptOrcado.DifPercentual(rpOrcxReaDBCalc14.GetText,
                                                                      rpOrcxReaDBCalc15.GetText));
end;



end.
