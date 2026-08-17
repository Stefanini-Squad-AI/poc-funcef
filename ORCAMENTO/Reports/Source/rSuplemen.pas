unit rSuplemen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, ppVar,
  ppBands, ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBClient, uCMClientDataSet, TXRB;

type
  TrptSuplemen = class(TFrmCmReport)
    cdsSuplemen: TCMClientDataSet;
    dsSuplemen: TwwDataSource;
    pplSuplemen: TppBDEPipeline;
    pplSuplemenppField1: TppField;
    pplSuplemenppField2: TppField;
    pplSuplemenppField3: TppField;
    pplSuplemenppField4: TppField;
    pplSuplemenppField5: TppField;
    pplSuplemenppField6: TppField;
    pplSuplemenppField7: TppField;
    pplSuplemenppField8: TppField;
    rpSuplemen: TppReport;
    ppHeaderBand19: TppHeaderBand;
    ppLabel171: TppLabel;
    ppLine48: TppLine;
    ppLabel176: TppLabel;
    ppDetailBand18: TppDetailBand;
    ppShape4: TppShape;
    ppLabel177: TppLabel;
    ppDBText69: TppDBText;
    ppLabel178: TppLabel;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppLabel181: TppLabel;
    ppDBText76: TppDBText;
    ppLabel182: TppLabel;
    ppLabel183: TppLabel;
    ppDBText77: TppDBText;
    ppLabel184: TppLabel;
    ppDBText78: TppDBText;
    ppLine49: TppLine;
    rptSuplemenLine1: TppLine;
    rptSuplemenLabel1: TppLabel;
    rptSuplemenLabel2: TppLabel;
    rptSuplemenLine2: TppLine;
    rptSuplemenLabel3: TppLabel;
    rptSuplemenLine3: TppLine;
    txtSaldoSuplemen: TppLabel;
    rptSuplemenLabel5: TppLabel;
    rptSuplemenDBMemo1: TppDBMemo;
    ppLabel247: TppLabel;
    txtSaldoAntSuplemen: TppLabel;
    ppFooterBand19: TppFooterBand;
    ppLine50: TppLine;
    ppLabel186: TppLabel;
    ppCalc36: TppSystemVariable;
    ppCalc37: TppSystemVariable;
    sqlSuplemen: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptSuplemen: TrptSuplemen;

implementation

{$R *.DFM}
//************************************************
Procedure TrptSuplemen.CrmRptCMBeforePrint(Sender: TObject);
Begin
  Inherited;
  sqlSuplemen.Prepare;
  sqlSuplemen.ParamByName('NUMALTERACAO').asInteger := CmpRptCM.ParamValues[0].AsInteger;
  sqlSuplemen.ParamByName('IDPESSOA').asInteger     := Trunc( CrmRptCM.IdEmpresa );
  sqlSuplemen.Open;

  txtSaldoSuplemen.caption    := FormatFloat('###,###,###,###,##0.00',
                                 CmpRptCM.ParamValues[1].AsFloat );
  txtSaldoAntSuplemen.caption := FormatFloat('###,###,###,###,##0.00',
                                 CmpRptCM.ParamValues[1].AsFloat - cdsSuplemen.FieldByName('VLRSOLICITADO').AsFloat);
End;
//************************************************
End.
