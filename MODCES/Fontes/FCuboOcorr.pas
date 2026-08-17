unit fCuboOcorr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  TeEngine, Series, TeeProcs, Chart, mxgraph, Grids, mxgrid, mxpivsrc, mxDB, Db, DBTables,
  mxtables, mxstore, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, TB97, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti;

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
    Series11: TBarSeries;
    Series4: TBarSeries;
    Series5: TBarSeries;
    Series6: TBarSeries;
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
