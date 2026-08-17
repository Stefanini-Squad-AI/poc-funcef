unit rPosiFornxRespon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, uCmRptManager, TXComp, CmParamReport, DBClient,
  uCMClientDataSet, uCmSqlParams, TXRB;

type
  TRptPosiFornxRespon = class(TFrmCmReport)
    PpPosiFornxRespon: TppBDEPipeline;
    PpPosiFornxResponppField1: TppField;
    PpPosiFornxResponppField2: TppField;
    PpPosiFornxResponppField3: TppField;
    PpPosiFornxResponppField4: TppField;
    PpPosiFornxResponppField5: TppField;
    PpPosiFornxResponppField6: TppField;
    PpPosiFornxResponppField7: TppField;
    PpPosiFornxResponppField8: TppField;
    PpPosiFornxResponppField9: TppField;
    PpPosiFornxResponppField10: TppField;
    PpPosiFornxResponppField11: TppField;
    DsPosiFornxRespon: TwwDataSource;
    RptPosiFornxRespon: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    LblPosiForn: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine7: TppLine;
    ppLabel16: TppLabel;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel8: TppLabel;
    ppLine6: TppLine;
    LblTipoMov: TppLabel;
    DbTTipoMov: TppDBText;
    ppLine3: TppLine;
    ppLabel6: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    LblDataLancto: TppLabel;
    ppLabel15: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    LblTotAberto: TppLabel;
    ppDBCalc1: TppDBCalc;
    RptPosiFornxResponGroup1: TppGroup;
    RptPosiFornxResponGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText14: TppDBText;
    RptPosiFornxResponLine1: TppLine;
    RptPosiFornxResponGroupFooterBand1: TppGroupFooterBand;
    ppLabel20: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBCalc4: TppDBCalc;
    ppLabel18: TppLabel;
    SqlPosiFornxRespon: TCMSqlParams;
    CdsPosiFornxRespon: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptPosiFornxRespon: TRptPosiFornxRespon;

implementation

{$R *.DFM}

procedure TRptPosiFornxRespon.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  SqlPosiFornxRespon.Prepare;
  SqlPosiFornxRespon.ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
  SqlPosiFornxRespon.ParamByName('PDATAINI').AsDate := CmpRptCM.ParamValues[0].AsDateTime;
  SqlPosiFornxRespon.ParamByName('PDATAFIM').AsDate := CmpRptCM.ParamValues[1].AsDateTime;
  SqlPosiFornxRespon.open;
    if CmpRptCM.ParamValues[2].AsInteger = 0 then
  begin
    CdsPosiFornxRespon.Filtered := False;
    CdsPosiFornxRespon.Filter := '';
  end
  else
  begin
    CdsPosiFornxRespon.Filter := 'IDPESSOA = ' + IntToStr(CmpRptCM.ParamValues[2].AsInteger);
    CdsPosiFornxRespon.Filtered := True;
  end;
  LblPosiForn.Caption := 'Período do relatório: de ' + CmpRptCM.ParamValues[0].AsString + ' a ' +
    CmpRptCM.ParamValues[1].AsString;
end;

procedure TRptPosiFornxRespon.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamValues[0].TextDefault := DateToStr(Date);
  CmpRptCM.ParamValues[1].TextDefault := DateToStr(Date);
end;

end.

