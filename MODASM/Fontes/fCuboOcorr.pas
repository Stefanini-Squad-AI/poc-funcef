unit fCuboOcorr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, TeEngine, Series,
  TeeProcs, Chart, mxgraph, Grids, mxgrid, mxpivsrc, mxDB, Db, DBTables, mxtables, mxstore,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, TB97, IvDictio, IvMulti, IvEMulti, TB97Tlbr,
  fSairAjuda;

type
  TfrmCuboOcorr = class(TfrmSairAjuda)
    dcubOcorr: TDecisionCube;
    dqryOcorr: TDecisionQuery;
    dsCubo: TDecisionSource;
    dpivOcorr: TDecisionPivot;
    dgrafOcorr: TDecisionGraph;
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series7: TBarSeries;
    Series4: TBarSeries;
    Series5: TBarSeries;
    Series6: TBarSeries;
    Series8: TBarSeries;
    dgrdOcorr: TDecisionGrid;
    procedure FormCreate(Sender: TObject);
  end;

var
  frmCuboOcorr: TfrmCuboOcorr;

implementation

{$R *.DFM}

procedure TfrmCuboOcorr.FormCreate(Sender: TObject);
begin
  inherited;
  dqryOcorr.Open;  
end;

end.
