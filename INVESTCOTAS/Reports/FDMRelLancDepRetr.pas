unit FDMRelLancDepRetr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReportInv, ppCtrls, ppVar, ppBands, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, uCmRptManager, TXComp, TXRB,
  CmParamReport;

type
  TRelLancDepRetr = class(TFrmCmReportInv)
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelLancDepRetr: TRelLancDepRetr;

implementation

{$R *.DFM}

end.
