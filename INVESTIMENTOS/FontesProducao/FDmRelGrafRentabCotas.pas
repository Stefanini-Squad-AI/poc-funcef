unit FDmRelGrafRentabCotas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, ExtCtrls, TeeProcs, TeEngine, Chart, ppChrtDP,
  ppChrt, Series;

type
  TDmRelatoriosInv1 = class(TDmRelatoriosInv)
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBImage1: TppDBImage;
    ppLabel4: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    wwDataSource1: TwwDataSource;
    ppBDEPipeline1: TppBDEPipeline;
    ppDPTeeChart1: TppDPTeeChart;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmRelatoriosInv1 : TDmRelatoriosInv1;

implementation

uses FGrafRentabilidadeCotas;

{$R *.DFM}

end.
