unit FBrwPess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelPessoal, Db, DBTables, Wwtable, Wwdatsrc, MAHlpBtn, StdCtrls,
  Buttons, TEdNum, Spin, wwdblook, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  Wwquery, TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmBrwPess = class(TfrmSelPessoal)
    dbgrPessoal: TwwDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBrwPess: TfrmBrwPess;

implementation

{$R *.DFM}

end.
