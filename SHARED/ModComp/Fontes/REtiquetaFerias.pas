unit REtiquetaFerias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppEndUsr;

type
  TrptEtiquetaFerias = class(TdtmReports)
    rpEtiquetas: TppReport;
    rpEtiquetasColHdrBnd: TppColumnHeaderBand;
    rpEtiquetasDtlBnd: TppDetailBand;
    rpEtiquetasDBText1: TppDBText;
    rpEtiquetasDBText2: TppDBText;
    rpEtiquetasColFootBnd: TppColumnFooterBand;
    rpEtiquetasSmryBnd: TppSummaryBand;
    ppEtiquetas: TppBDEPipeline;
    dsEtiquetas: TwwDataSource;
    qryEtiquetas: TwwQuery;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    dsgnRelatorios: TppDesigner;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptEtiquetaFerias: TrptEtiquetaFerias;

implementation

{$R *.DFM}

end.
