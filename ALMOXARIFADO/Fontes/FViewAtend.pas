unit FViewAtend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables,
  Wwquery, Wwdatsrc;

type
  TFrmViewAtend = class(TfrmSairAjuda)
    plnTitulo: TPanel;
    GrdAtend: TwwDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmViewAtend: TFrmViewAtend;

implementation

uses FAcompReqCad;

{$R *.DFM}

end.
