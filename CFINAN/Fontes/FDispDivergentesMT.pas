unit FDispDivergentesMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, DBClient,
  uCMClientDataSet, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, FOkCancelar;

type
  TfrmDispDivergentesMT = class(TfrmOkCancelar)
    cdsDispDivergentes: TCMClientDataSet;
    dbgDispDiverg: TwwDBGrid;
    dsDispDivergentes: TwwDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDispDivergentesMT: TfrmDispDivergentesMT;

implementation

{$R *.DFM}

end.
