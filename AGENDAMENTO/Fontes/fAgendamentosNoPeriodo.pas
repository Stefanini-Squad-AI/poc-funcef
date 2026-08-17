unit fAgendamentosNoPeriodo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, DBGrids, Db, DBClient, uCMClientDataSet,
  Wwdbigrd, Wwdbgrid;

type
  TfrmAgendamentosNoPeriodo = class(TfrmOkCancelar)
    Label1: TLabel;
    cdsAgendamentos: TCMClientDataSet;
    dtsAgendamentos: TDataSource;
    Label2: TLabel;
    wwDBGrid1: TwwDBGrid;
    cdsAgendamentosSOLICITANTE: TStringField;
    cdsAgendamentosDATA: TDateTimeField;
    cdsAgendamentosHORA: TStringField;
    cdsAgendamentosASSUNTO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgendamentosNoPeriodo: TfrmAgendamentosNoPeriodo;

implementation

{$R *.DFM}

end.
