Unit rContrValRecPag;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppCtrls, ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwdatsrc, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, uCmRptManager, TXComp, CmParamReport, DBClient,
  uCMClientDataSet, uCmSqlParams, uCtrlParamIntegra;

Type
  TRptContrValRecPag = Class(TFrmCmReport)
    PpContrValRecPag: TppBDEPipeline;
    PpContrValRecPagppField1: TppField;
    PpContrValRecPagppField2: TppField;
    PpContrValRecPagppField3: TppField;
    DsContrValRecPag: TwwDataSource;
    RptContrValRecPag: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel17: TppLabel;
    ppLine12: TppLine;
    ppLabel19: TppLabel;
    RptContrValRecPagLabel1: TppLabel;
    RptContrValRecPagLabel2: TppLabel;
    RptContrValRecPagLabel3: TppLabel;
    RptContrValRecPagLine1: TppLine;
    RptContrValRecPagLine2: TppLine;
    LblPisoJuridica: TppLabel;
    LblPisoFisica: TppLabel;
    ppDetailBand3: TppDetailBand;
    RptContrValRecPagDBText1: TppDBText;
    RptContrValRecPagDBText2: TppDBText;
    RptContrValRecPagDBText3: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLine13: TppLine;
    ppLabel21: TppLabel;
    ppCalc7: TppSystemVariable;
    ppCalc8: TppSystemVariable;
    RptContrValRecPagSummaryBand1: TppSummaryBand;
    RptContrValRecPagDBCalc1: TppDBCalc;
    RptContrValRecPagLabel4: TppLabel;
    SqlContrValRecPag: TCMSqlParams;
    CdsContrValRecPag: TCMClientDataSet;
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  RptContrValRecPag: TRptContrValRecPag;

Implementation

{$R *.DFM}

Procedure TRptContrValRecPag.CrmRptCMBeforePrint(Sender: TObject);
Begin
  Inherited;
  SqlContrValRecPag.Prepare;
  SqlContrValRecPag.ParamByname('RECPAG').AsString := ParamIntegra.RecPag;
  SqlContrValRecPag.ParamByname('IDPESSOA').AsFloat := CrmRptCm.IdEmpresa;
  SqlContrValRecPag.ParamByname('DATAINI').AsDateTime := CmpRptCM.ParamValues[2].AsDateTime;
  SqlContrValRecPag.ParamByname('DATAFIM').AsDateTime := CmpRptCM.ParamValues[3].AsDateTime;
  SqlContrValRecPag.ParamByname('VALORPF').AsFloat := CmpRptCM.ParamValues[0].AsFloat;
  SqlContrValRecPag.ParamByname('VALORPJ').AsFloat := CmpRptCM.ParamValues[1].AsFloat;
  SqlContrValRecPag.Open;
  LblPisoFisica.Caption := CmpRptCM.ParamValues[0].Caption + ' '+ CmpRptCM.ParamValues[0].AsString;
  LblPisoJuridica.Caption := CmpRptCM.ParamValues[1].Caption + ' '+ CmpRptCM.ParamValues[1].AsString;
End;

procedure TRptContrValRecPag.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamValues[2].TextDefault := DateToStr(date);
  CmpRptCM.ParamValues[3].TextDefault := DateToStr(date);
end;

End.

