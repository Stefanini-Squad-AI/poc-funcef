unit fAgendaTrein;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, DBClient;

type
  TfrmAgendaTrein = class(TfrmSairAjuda)
    dsHstTrn: TwwDataSource;
    dbGrd: TwwDBGrid;
  end;

var
  frmAgendaTrein: TfrmAgendaTrein;

implementation

{$R *.DFM}

end.
