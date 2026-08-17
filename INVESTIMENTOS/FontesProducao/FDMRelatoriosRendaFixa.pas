unit FDMRelatoriosRendaFixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE;

type
  TDmRelatoriosRendaFixa = class(TdtmReports)
    ppLCarteira: TppLabel;
    ppLPeriodo: TppLabel;
    ppDbLogo: TppDBImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmRelatoriosRendaFixa: TDmRelatoriosRendaFixa;

implementation

{$R *.DFM}

end.
