unit FDMRelatoriosInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE;

type
  TDmRelatoriosInv = class(TdtmReports)
    ppLCarteiraEx: TppLabel;
    ppDbLogo: TppDBImage;
    ppLPeriodo: TppLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmRelatoriosInv: TDmRelatoriosInv;

implementation

{$R *.DFM}


{ TDmRelatoriosInv }

end.
