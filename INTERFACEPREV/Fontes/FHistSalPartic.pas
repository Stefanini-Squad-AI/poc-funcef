unit FHistSalPartic;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, mxstore, mxDB, Db, DBTables, mxtables, mxpivsrc, Grids,
  mxgrid, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls;

type
  TFrmHistSalPartic = class(TfrmOkCancelar)
    grid: TDecisionGrid;
    DecisionPivot1: TDecisionPivot;
    DecisionSource1: TDecisionSource;
    DecisionQuery1: TDecisionQuery;
    DecisionCube1: TDecisionCube;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHistSalPartic: TFrmHistSalPartic;

implementation

{$R *.DFM}

procedure TFrmHistSalPartic.FormCreate(Sender: TObject);
begin
  inherited;
  DecisionQuery1.Open;
end;

end.
