unit ROrcadoXRealCR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCtrlRptOrcado, Db,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands, ppClass, ppCtrls, ppVar,
  ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, uCmSqlParams,
  DBClient, uCMClientDataSet, TXRB;

type
  TRptOrcadoXRealCR = class(TFrmCmReport)
    spOrcadoXReal: TCMSqlParams;
    cdsOrcadoXReal: TCMClientDataSet;
    rpOrcadoXReal: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLabel25: TppLabel;
    ppLine15: TppLine;
    pplblEmpresa: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppDetailBand10: TppDetailBand;
    ppDBText4: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText23: TppDBText;
    ppFooterBand10: TppFooterBand;
    pplblSistema: TppLabel;
    ppLine18: TppLine;
    ppCalc16: TppSystemVariable;
    ppCalc17: TppSystemVariable;
    rpOrcxReaCRGroup1: TppGroup;
    rpOrcxReaCRGroupHeaderBand1: TppGroupHeaderBand;
    rpOrcxReaCRLabel1: TppLabel;
    rpOrcxReaCRDBText1: TppDBText;
    rpOrcxReaCRDBText2: TppDBText;
    rpOrcxReaCRLine1: TppLine;
    rpOrcxReaCRGroupFooterBand1: TppGroupFooterBand;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLabel51: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    rpOrcxReaCRDBCalc7: TppDBCalc;
    rpOrcxReaCRDBCalc8: TppDBCalc;
    rpOrcxReaCRDBCalc9: TppDBCalc;
    rpOrcxReaCRLabel12: TppLabel;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLine21: TppLine;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel53: TppLabel;
    ppDBText24: TppDBText;
    rpOrcxReaCRLabel11: TppLabel;
    rpOrcxReaCRDBCalc4: TppDBCalc;
    rpOrcxReaCRDBCalc5: TppDBCalc;
    rpOrcxReaCRDBCalc6: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText25: TppDBText;
    ppLine22: TppLine;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLine23: TppLine;
    ppLabel55: TppLabel;
    ppDBText27: TppDBText;
    rpOrcxReaCRDBCalc1: TppDBCalc;
    rpOrcxReaCRDBCalc2: TppDBCalc;
    rpOrcxReaCRDBCalc3: TppDBCalc;
    rpOrcxReaCRLabel9: TppLabel;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    dsOrcadoXReal: TwwDataSource;
    pplOrcadoXReal: TppBDEPipeline;
    pplOrcxReaCRppField1: TppField;
    pplOrcxReaCRppField2: TppField;
    pplOrcxReaCRppField3: TppField;
    pplOrcxReaCRppField4: TppField;
    pplOrcxReaCRppField5: TppField;
    pplOrcxReaCRppField6: TppField;
    pplOrcxReaCRppField7: TppField;
    pplOrcxReaCRppField8: TppField;
    pplOrcxReaCRppField9: TppField;
    pplOrcxReaCRppField10: TppField;
    pplOrcxReaCRppField11: TppField;
    pplOrcxReaCRppField12: TppField;
    pplOrcxReaCRppField13: TppField;
    pplOrcxReaCRppField14: TppField;
    pplOrcxReaCRppField15: TppField;
    pplOrcxReaCRppField16: TppField;
    pplOrcxReaCRppField17: TppField;
    pplOrcxReaCRppField18: TppField;

    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppDetailBand8BeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles; Index: Integer);
    procedure rpOrcxReaCRLabel9Print(Sender: TObject);
    procedure rpOrcxReaCRLabel11Print(Sender: TObject);
    procedure rpOrcxReaCRLabel12Print(Sender: TObject);


  private { Private declarations }

    aParamMasc    : TParamMasc;
    CtrlRptOrcado : TCtrlRptOrcado;
    sAtivProjeto  : String;
    sCentroRespon : String;
    sCentroCusto  : String;


  public  { Public declarations }


  end;



var
  RptOrcadoXRealCR: TRptOrcadoXRealCR;



implementation
{$R *.DFM}
uses
  uCtrlParamIntegra, uFuncaoGeral, dBaseDados, uSistema;



procedure TRptOrcadoXRealCR.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlRptOrcado:=TCtrlRptOrcado.Create;
   CtrlRptOrcado.Initialize(dtmBaseDados.dbBaseDados,True);
end;



procedure TRptOrcadoXRealCR.FormDestroy(Sender: TObject);
begin
   CtrlRptOrcado.Free;
   inherited;
end;



procedure TRptOrcadoXRealCR.CmpRptCMBeforeExecute(var CanExecute: Boolean);
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
                                                    'ORDER BY NOME';

   CmpRptCM.ParamValues[8].LookupSettings.SQL.Text:='SELECT CODCENTROCUSTO,NOME '+
                                                    'FROM CENTCUST '+
                                                    'WHERE (IDEMPRESA = '+
                                                            FloatToStr(CrmRptCM.IdEmpresa)+') '+
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

procedure TRptOrcadoXRealCR.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
   inherited;
   case Index of
      6: sAtivProjeto:=TPainelControles(Sender).CtrlLookup.Text;
      7: sCentroRespon:=TPainelControles(Sender).CtrlLookup.Text;
      8: sCentroCusto:=TPainelControles(Sender).CtrlLookup.Text;
   end;
end;



procedure TRptOrcadoXRealCR.CrmRptCMBeforePrint(Sender: TObject);
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
   aFiltro.bAnalitico:=CmpRptCM.ParamValues[11].AsBoolean;

   //Carrega cds
   cdsOrcadoXReal.Data:=CtrlRptOrcado.GeraDadosOrcXReal(aFiltro,aParamMasc);

   //Configura Label
    if not(CmpRptCM.ParamValues[6].IsNull) then
       ppLabel25.Caption := 'ORÇADO x REALIZADO X C.RESPON. DE '+
                 FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)+
                 ' À '+
                 FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime)+
                 ' - '+sAtivProjeto
    else
     if not(CmpRptCM.ParamValues[7].IsNull) then
        ppLabel25.Caption := 'ORÇADO x REALIZADO X C.RESPON. DE '+
                  FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)+
                  ' À '+
                  FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime)+
                  ' - '+sCentroRespon
     else
      if not(CmpRptCM.ParamValues[8].IsNull) then
         ppLabel25.Caption := 'ORÇADO x REALIZADO X C.RESPON. DE '+
                   FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)+
                   ' À '+
                   FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime)+
                   ' - '+sCentroCusto
      else
          ppLabel25.Caption := 'ORÇADO x REALIZADO X C.RESPON. DE '+
                    FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)+
                    ' À '+
                    FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime);

   if CmpRptCM.ParamValues[9].AsBoolean then
    begin
       ppDBText3.DisplayFormat := '#,0.00;(#,0.00)';
       ppDBText4.DisplayFormat := '#,0.00;(#,0.00)';
       ppDBText5.DisplayFormat := '#,0.00;(#,0.00)';

       rpOrcxReaCRDBCalc1.DisplayFormat := '#,0.00;(#,0.00)';
       rpOrcxReaCRDBCalc2.DisplayFormat := '#,0.00;(#,0.00)';
       rpOrcxReaCRDBCalc3.DisplayFormat := '#,0.00;(#,0.00)';

       rpOrcxReaCRDBCalc4.DisplayFormat := '#,0.00;(#,0.00)';
       rpOrcxReaCRDBCalc5.DisplayFormat := '#,0.00;(#,0.00)';
       rpOrcxReaCRDBCalc6.DisplayFormat := '#,0.00;(#,0.00)';

       rpOrcxReaCRDBCalc7.DisplayFormat := '#,0.00;(#,0.00)';
       rpOrcxReaCRDBCalc8.DisplayFormat := '#,0.00;(#,0.00)';
       rpOrcxReaCRDBCalc9.DisplayFormat := '#,0.00;(#,0.00)';
   end
  else
   begin
      ppDBText3.DisplayFormat := '#,0;(#,0)';
      ppDBText4.DisplayFormat := '#,0;(#,0)';
      ppDBText5.DisplayFormat := '#,0;(#,0)';

      rpOrcxReaCRDBCalc1.DisplayFormat := '#,0;(#,0)';
      rpOrcxReaCRDBCalc2.DisplayFormat := '#,0;(#,0)';
      rpOrcxReaCRDBCalc3.DisplayFormat := '#,0;(#,0)';

      rpOrcxReaCRDBCalc4.DisplayFormat := '#,0;(#,0)';
      rpOrcxReaCRDBCalc5.DisplayFormat := '#,0;(#,0)';
      rpOrcxReaCRDBCalc6.DisplayFormat := '#,0;(#,0)';

      rpOrcxReaCRDBCalc7.DisplayFormat := '#,0;(#,0)';
      rpOrcxReaCRDBCalc8.DisplayFormat := '#,0;(#,0)';
      rpOrcxReaCRDBCalc9.DisplayFormat := '#,0;(#,0)';
   end;
end;



procedure TRptOrcadoXRealCR.ppDetailBand8BeforePrint(Sender: TObject);
begin
   inherited;
   ppDBText23.Font.Style:=[];
   ppDBText3.Font.Style:=[];
   ppDBText4.Font.Style:=[];
   ppDBText5.Font.Style:=[];
   ppDBText6.Font.Style:=[];
   ppDBText23.Left:=11906;
   if (cdsOrcadoXReal.FieldByName('ANASINT').AsString='S') then
    begin
       ppDBText23.Font.Style:=[fsbold];
       ppDBText3.Font.Style:=[fsbold];
       ppDBText4.Font.Style:=[fsbold];
       ppDBText5.Font.Style:=[fsbold];
       ppDBText6.Font.Style:=[fsbold];
       ppDBText23.Left:=1588;
    end;
end;



procedure TRptOrcadoXRealCR.rpOrcxReaCRLabel9Print(Sender: TObject);
begin
   inherited;
   rpOrcxReaCRLabel9.Caption:= FormatFloat('#,##0.00',
                                          CtrlRptOrcado.DifPercentual(ppDBCalc14.GetText,
                                                                      ppDBCalc15.GetText));
end;



procedure TRptOrcadoXRealCR.rpOrcxReaCRLabel11Print(Sender: TObject);
begin
   inherited;
   rpOrcxReaCRLabel11.Caption:= FormatFloat('#,##0.00',
                                          CtrlRptOrcado.DifPercentual(ppDBCalc9.GetText,
                                                                      ppDBCalc10.GetText));
end;



procedure TRptOrcadoXRealCR.rpOrcxReaCRLabel12Print(Sender: TObject);
begin
   inherited;
   rpOrcxReaCRLabel12.Caption:= FormatFloat('#,##0.00',
                                          CtrlRptOrcado.DifPercentual(ppDBCalc5.GetText,
                                                                      ppDBCalc4.GetText));
end;



end.
