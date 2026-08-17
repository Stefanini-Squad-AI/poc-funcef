unit fAjustaSCI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid;

type
  TfrmAjustaSCI = class(TfrmSairAjuda)
    qryOc: TwwQuery;
    qrySCI: TwwQuery;
    dsSCI: TwwDataSource;
    dsOC: TwwDataSource;
    wwDBGrid1: TwwDBGrid;
    wwDBGrid2: TwwDBGrid;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAjustaSCI: TfrmAjustaSCI;

implementation

{$R *.DFM}

procedure TfrmAjustaSCI.FormCreate(Sender: TObject);
begin
  inherited;
  qryOc.Open;
  qrySCI.Open;  
end;

end.

