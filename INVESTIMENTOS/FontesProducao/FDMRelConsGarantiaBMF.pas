unit FDmRelConsGarantiaBMF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE,ppViewr;

type
  TDmRelConsGarantiaBMF = class(TdtmReports)
    pplConsGarantiaBMF: TppBDEPipeline;
    rptConsGarantiaBMF: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    pplPeriodo: TppLabel;
    dbiLogoEmpresa: TppDBImage;
    procedure rptConsGarantiaBMFStartPage(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelConsGarantiaBMF: TDmRelConsGarantiaBMF;

implementation

uses FConsOperGarantiaBMF;


{$R *.DFM}

procedure TDmRelConsGarantiaBMF.rptConsGarantiaBMFStartPage(
  Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
end;

end.
