unit fCMReportMTImob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, Db,
  DBClient, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd, ppClass,
  ppReport, ppBands, ppCache, ppVar, ppCtrls, ppPrnabl, TXRB;

type
  TFrmCmReportImob = class(TFrmCmReport)
    cds: TClientDataSet;
    CMsp: TCMSqlParams;
    ds: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCmReportImob: TFrmCmReportImob;

implementation

{$R *.DFM}

end.
