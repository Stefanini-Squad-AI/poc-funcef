unit FDisponDiverg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery, Grids,
  Wwdbigrd, Wwdbgrid;

type
  TfrmDisponDiverg = class(TfrmOkCancelar)
    dbgDispDiverg: TwwDBGrid;
    qryDispDiverg: TwwQuery;
    dsDispDiverg: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure dbgDispDivergDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDisponDiverg: TfrmDisponDiverg;

implementation

{$R *.DFM}

procedure TfrmDisponDiverg.FormCreate(Sender: TObject);
begin
   inherited;
   Caption:='Disponibilidades Divergentes ('+FormatDateTime('mm/yyyy',now)+')';
end;

procedure TfrmDisponDiverg.dbgDispDivergDblClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Click;
end;

end.
