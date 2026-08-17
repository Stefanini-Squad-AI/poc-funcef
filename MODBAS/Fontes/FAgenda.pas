unit FAgenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid;

type
  TfrmAgenda = class(TfrmSairAjuda)
    ds2: TwwDataSource;
    qryEtapa: TwwQuery;
    dbGrd: TwwDBGrid;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgenda: TfrmAgenda;

implementation

uses USistema;

{$R *.DFM}

procedure TfrmAgenda.FormShow(Sender: TObject);
begin
  inherited;
  qryEtapa.Close;
  qryEtapa.ParamByName('IdUsuario').AsInteger := Sistema.idUsuario;
  qryEtapa.Open;
end;

end.
