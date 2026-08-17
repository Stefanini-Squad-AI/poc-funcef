unit RRentabilidadeContabil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, Wwdatsrc, ppProd,
  ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE,
  uCmSqlParams, DBClient, uCMClientDataSet, ppBands, ppCache;

type
  TRptRentabilidadeContabil = class(TFrmCmReport)
    pplRentContabil: TppBDEPipeline;
    rptRentContabil: TppReport;
    dsRentContabil: TwwDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    cdsRentContabil: TCMClientDataSet;
    sqlRentContabil: TCMSqlParams;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptRentabilidadeContabil: TRptRentabilidadeContabil;

implementation

{$R *.DFM}

end.
