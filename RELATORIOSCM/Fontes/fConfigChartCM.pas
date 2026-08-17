unit fConfigChartCM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TeeProcs, TeEngine, Chart, DBChart, Db,
  DBTables, Wwquery, fMostraGraf;


type

  TfrmConfigChartCM = class(TfrmOkCancelar)
    Grafico: TDBChart;
    SqlGrafico: TwwQuery;
    BitBtn1: TBitBtn;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigChartCM: TfrmConfigChartCM;

implementation


Uses teestore,                     { <-- to load / save Charts }
     EditChar, DBEditCh,           { <-- to access the Editor Dialog }
                                   { <-- to support the Pro Series }
     TeePrevi,                     { <-- to print preview Charts }
     TeeAbout, uSistema;

{$R *.DFM}

procedure TfrmConfigChartCM.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  SaveChartToFile(Grafico,Sistema.TempDir + GRAFTEMP);
end;

procedure TfrmConfigChartCM.FormShow(Sender: TObject);
var
  tmpChart :TDbChart;
  x :Integer;
begin
  inherited;
  Grafico.RefreshData;
    
  If FileExists(Sistema.TempDir + GRAFTEMP) Then
  Begin
     Grafico.Free;
     tmpChart:=TDbChart.Create(Self);
     LoadChartFromFile(TCustomChart(tmpChart), Sistema.TempDir + GRAFTEMP);
     Grafico:=tmpChart;
     Grafico.Align:=alClient;
     Grafico.Parent:=Self;
  End;

  For X:=0 To Grafico.seriesCount - 1 Do
     Grafico.RefreshDataSet(SqlGrafico,Grafico.series[X]);
end;

end.


