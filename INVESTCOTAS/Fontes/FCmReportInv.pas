unit FCmReportInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppProd,
  ppReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, uCmRptManager, TXComp, TXRB, CmParamReport;

type
  TFrmCmReportInv = class(TFrmCmReport)
    pplReport: TppBDEPipeline;
    spl: TCMSqlParams;
    cds: TCMClientDataSet;
    ds: TDataSource;
    rptReport: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblNomeRelatorio: TppLabel;
    LblEmpresa: TppLabel;
    ppDBImage: TppDBImage;
    lblPeriodo: TppLabel;
    shpCabecalho: TppShape;
    ppDetailBand1: TppDetailBand;
    shpDetalhe: TppShape;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    LblSistema: TppLabel;
    ppLine2: TppLine;
    ppSystemVariable2: TppSystemVariable;
    cdsLogoTipo: TCMClientDataSet;
    ppLogoTipo: TppBDEPipeline;
    dsLogoTipo: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCmReportInv: TFrmCmReportInv;

implementation

{$R *.DFM}

end.
