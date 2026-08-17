unit DmRelAugusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppPrnabl, ppClass, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, ppVar,
  ppRelatv, ppDBPipe;

type
  TDtMRelAugusto = class(TdtmReports)
    PpSPC: TppBDEPipeline;
    DsSPC: TwwDataSource;
    QrySPC: TwwQuery;
    RpSPC: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    CODIGO: TppLabel;
    RpSPCLabel1: TppLabel;
    RpSPCLabel2: TppLabel;
    RpSPCLabel3: TppLabel;
    RpSPCLabel4: TppLabel;
    RpSPCLabel5: TppLabel;
    RpSPCLine1: TppLine;
    RpSPCDBText2: TppDBText;
    RpSPCDBText3: TppDBText;
    RpSPCDBText4: TppDBText;
    RpSPCDBText5: TppDBText;
    RpSPCDBText6: TppDBText;
    UpdSPC: TUpdateSQL;
    LbMes: TppLabel;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtMRelAugusto: TDtMRelAugusto;

implementation

{$R *.DFM}

end.
