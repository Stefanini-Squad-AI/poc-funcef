unit FAgendaTrein;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid;

type
  TfrmAgendaTrein = class(TfrmSairAjuda)
    dsTrein: TwwDataSource;
    qryTrein: TwwQuery;
    dbGrd: TwwDBGrid;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgendaTrein: TfrmAgendaTrein;

implementation

{$R *.DFM}

procedure TfrmAgendaTrein.FormShow(Sender: TObject);
begin
  inherited;
  qryTrein.Close;
  qryTrein.Open;
end;

end.
