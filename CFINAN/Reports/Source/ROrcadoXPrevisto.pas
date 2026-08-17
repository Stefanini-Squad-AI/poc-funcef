unit ROrcadoXPrevisto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCtrlRptOrcado, Db,
  DBClient, uCMClientDataSet, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands,
  ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, TXRB;

type
  TRptOrcadoXPrevisto = class(TFrmCmReport)
    rpOrcxPrevisto: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLabelTituloRelatorio: TppLabel;
    ppLine24: TppLine;
    pplblEmpresa: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppDetailBand11: TppDetailBand;
    DBText2: TppDBText;
    DBText3: TppDBText;
    DBText4: TppDBText;
    DBText5: TppDBText;
    DBText1: TppDBText;
    ppFooterBand11: TppFooterBand;
    ppLine27: TppLine;
    pplblSistema: TppLabel;
    ppCalc18: TppSystemVariable;
    ppCalc19: TppSystemVariable;
    ppSummaryBand3: TppSummaryBand;
    ppLabel63: TppLabel;
    DBCalc4: TppDBCalc;
    DBCalc5: TppDBCalc;
    DBCalc6: TppDBCalc;
    ppLine28: TppLine;
    ppLine29: TppLine;
    rpOrcxPrevistoLabel12: TppLabel;
    rpOrcxPrevistoDBCalc15: TppDBCalc;
    rpOrcxPrevistoDBCalc14: TppDBCalc;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppLine30: TppLine;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLabel65: TppLabel;
    ppDBText29: TppDBText;
    rpOrcxPrevistoLabel11: TppLabel;
    DBCalc7: TppDBCalc;
    DBCalc8: TppDBCalc;
    DBCalc9: TppDBCalc;
    rpOrcxPrevistoDBCalc12: TppDBCalc;
    rpOrcxPrevistoDBCalc13: TppDBCalc;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    rpOrcxPrevistoDBText6: TppDBText;
    ppLine31: TppLine;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppLine32: TppLine;
    rpOrcxPrevistoLabel7: TppLabel;
    rpOrcxPrevistoDBText7: TppDBText;
    DBCalc1: TppDBCalc;
    DBCalc2: TppDBCalc;
    DBCalc3: TppDBCalc;
    rpOrcxPrevistoLabel9: TppLabel;
    rpOrcxPrevistoDBCalc10: TppDBCalc;
    rpOrcxPrevistoDBCalc11: TppDBCalc;
    ppOrcxPrevisto: TppBDEPipeline;
    ppOrcxPrevistoppField1: TppField;
    ppOrcxPrevistoppField2: TppField;
    ppOrcxPrevistoppField3: TppField;
    ppOrcxPrevistoppField4: TppField;
    ppOrcxPrevistoppField5: TppField;
    ppOrcxPrevistoppField6: TppField;
    ppOrcxPrevistoppField7: TppField;
    ppOrcxPrevistoppField8: TppField;
    ppOrcxPrevistoppField9: TppField;
    ppOrcxPrevistoppField10: TppField;
    ppOrcxPrevistoppField11: TppField;
    ppOrcxPrevistoppField12: TppField;
    ppOrcxPrevistoppField13: TppField;
    ppOrcxPrevistoppField14: TppField;
    ppOrcxPrevistoppField15: TppField;
    ppOrcxPrevistoppField16: TppField;
    dsOrcxPrevisto: TwwDataSource;
    cdsOrcxPrevisto: TCMClientDataSet;

    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rpOrcxPrevistoLabel9Print(Sender: TObject);
    procedure rpOrcxPrevistoLabel11Print(Sender: TObject);
    procedure rpOrcxPrevistoLabel12Print(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppDetailBand11BeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles; Index: Integer);


  private { Private declarations }

    aParamMasc    : TParamMasc;
    sAtivProjeto  : String;
    sCentroRespon : String;
    sCentroCusto  : String;
    CtrlRptOrcado : TCtrlRptOrcado;


  public  { Public declarations }


  end;



var
  RptOrcadoXPrevisto: TRptOrcadoXPrevisto;



implementation
{$R *.DFM}
uses
  uCtrlParamIntegra, uFuncaoGeral, dBaseDados, uSistema;



procedure TRptOrcadoXPrevisto.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlRptOrcado:=TCtrlRptOrcado.Create;
   CtrlRptOrcado.Initialize(dtmBaseDados.dbBaseDados,True);
end;

procedure TRptOrcadoXPrevisto.FormDestroy(Sender: TObject);
begin
   CtrlRptOrcado.Free;
   inherited;
end;



procedure TRptOrcadoXPrevisto.CmpRptCMBeforeExecute(var CanExecute: Boolean);
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



procedure TRptOrcadoXPrevisto.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
   inherited;
   case Index of
      6: sAtivProjeto:=TPainelControles(Sender).CtrlLookup.Text;
      7: sCentroRespon:=TPainelControles(Sender).CtrlLookup.Text;
      8: sCentroCusto:=TPainelControles(Sender).CtrlLookup.Text;
   end;
end;



procedure TRptOrcadoXPrevisto.CrmRptCMBeforePrint(Sender: TObject);
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
   cdsOrcxPrevisto.Data:=CtrlRptOrcado.GeraDadosOrcXPrev(aFiltro,aParamMasc);

   //Configura Label
   if not(CmpRptCM.ParamValues[6].IsNull) then
       ppLabelTituloRelatorio.Caption := 'ORÇADO x PREVISTO DE '+
                              FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)+
                              ' À '+
                              FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime)+
                              ' - '+sAtivProjeto
   else
    if not(CmpRptCM.ParamValues[7].IsNull) then
       ppLabelTituloRelatorio.Caption := 'ORÇADO x PREVISTO DE '+
                              FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)+
                              ' À '+
                              FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime)+
                              ' - '+sCentroRespon
    else
     if not(CmpRptCM.ParamValues[8].IsNull) then
        ppLabelTituloRelatorio.Caption := 'ORÇADO x PREVISTO DE '+
                               FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)+
                               ' À '+
                               FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime)+
                               ' - '+sCentroCusto
     else
        ppLabelTituloRelatorio.Caption := 'ORÇADO x PREVISTO DE '+
                               FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)+
                               ' À '+
                               FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime);

   if CmpRptCM.ParamValues[9].AsBoolean then
    begin
       DBText3.DisplayFormat := '#,0.00;(#,0.00)';
       DBText2.DisplayFormat := '#,0.00;(#,0.00)';
       DBText4.DisplayFormat := '#,0.00;(#,0.00)';
       DBCalc1.DisplayFormat := '#,0.00;(#,0.00)';
       DBCalc2.DisplayFormat := '#,0.00;(#,0.00)';
       DBCalc3.DisplayFormat := '#,0.00;(#,0.00)';
       DBCalc4.DisplayFormat := '#,0.00;(#,0.00)';
       DBCalc5.DisplayFormat := '#,0.00;(#,0.00)';
       DBCalc6.DisplayFormat := '#,0.00;(#,0.00)';
       DBCalc7.DisplayFormat := '#,0.00;(#,0.00)';
       DBCalc8.DisplayFormat := '#,0.00;(#,0.00)';
       DBCalc9.DisplayFormat := '#,0.00;(#,0.00)';
    end
   else
    begin
       DBText3.DisplayFormat := '#,0;(#,0)';
       DBText2.DisplayFormat := '#,0;(#,0)';
       DBText4.DisplayFormat := '#,0;(#,0)';
       DBCalc1.DisplayFormat := '#,0;(#,0)';
       DBCalc2.DisplayFormat := '#,0;(#,0)';
       DBCalc3.DisplayFormat := '#,0;(#,0)';
       DBCalc4.DisplayFormat := '#,0;(#,0)';
       DBCalc5.DisplayFormat := '#,0;(#,0)';
       DBCalc6.DisplayFormat := '#,0;(#,0)';
       DBCalc7.DisplayFormat := '#,0;(#,0)';
       DBCalc8.DisplayFormat := '#,0;(#,0)';
       DBCalc9.DisplayFormat := '#,0;(#,0)';
    end;
end;



procedure TRptOrcadoXPrevisto.ppDetailBand11BeforePrint(Sender: TObject);
begin
   inherited;
   DBText1.Font.Style:=[];
   DBText2.Font.Style:=[];
   DBText3.Font.Style:=[];
   DBText4.Font.Style:=[];
   DBText5.Font.Style:=[];
   DBText1.Left:=11906;
   if (cdsOrcxPrevisto.FieldByName('ANASINT').AsString='S') then
    begin
       DBText1.Font.Style:=[fsbold];
       DBText2.Font.Style:=[fsbold];
       DBText3.Font.Style:=[fsbold];
       DBText4.Font.Style:=[fsbold];
       DBText5.Font.Style:=[fsbold];
       DBText1.Left:=1588;
    end;
end;



procedure TRptOrcadoXPrevisto.rpOrcxPrevistoLabel9Print(Sender: TObject);
begin
   inherited;
   rpOrcxPrevistoLabel9.Caption:= FormatFloat('#,##0.00',
                                        CtrlRptOrcado.DifPercentual(rpOrcxPrevistoDBCalc10.GetText,
                                                                    rpOrcxPrevistoDBCalc11.GetText));
end;



procedure TRptOrcadoXPrevisto.rpOrcxPrevistoLabel11Print(Sender: TObject);
begin
   inherited;
   rpOrcxPrevistoLabel11.Caption:= FormatFloat('#,##0.00',
                                         CtrlRptOrcado.DifPercentual(rpOrcxPrevistoDBCalc12.GetText,
                                                                    rpOrcxPrevistoDBCalc13.GetText));
end;



procedure TRptOrcadoXPrevisto.rpOrcxPrevistoLabel12Print(Sender: TObject);
begin
   inherited;
   rpOrcxPrevistoLabel12.Caption:= FormatFloat('#,##0.00',
                                         CtrlRptOrcado.DifPercentual(rpOrcxPrevistoDBCalc14.GetText,
                                                                     rpOrcxPrevistoDBCalc15.GetText));
end;



end.
