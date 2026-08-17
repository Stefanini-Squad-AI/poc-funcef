unit fConfigChartMT;
//=============================================================
// Autor     : Rodolpho da Silva
// PendÊncia : 5998
// Data      : 15/09/2005
// Descrição : Fazer funcionar o botão Editar
//=============================================================

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TeeProcs, TeEngine, Chart, DBChart, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBClient,  fCadRelatorioMT, TeCanvas, uMensErro, Menus, dbTables,
   EditChar, teestore, DBEditCh, TeePrevi, TeeAbout, Series, FOkCancelar,TeeFunci;


type
  TfrmConfigChart = class(TFrmOkCancelar)
    Grafico: TDBChart;
    btEditar: TBitBtn;
    _DadosGrafico: TClientDataSet;
    pmnEditar: TPopupMenu;
    mnuEditarGrafico: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure mnuEditarGraficoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigChart: TfrmConfigChart;

implementation



{$R *.DFM}

procedure TfrmConfigChart.FormShow(Sender: TObject);
var
  ChartStream: TStream;

begin
  inherited;
  try
     ChartStream := FrmCadRelatorio.Cds.CreateBlobStream(FrmCadRelatorio.Cds.FieldByName('TEMPLATE'),bmRead);
     Grafico.RefreshData;
     if (not TBlobField(FrmCadRelatorio.Cds.FieldByName('TEMPLATE')).IsNull) then
     begin
        LoadChartFromStream(TCustomChart(Grafico),ChartStream);
        Grafico.Align  := alClient;
        Grafico.Parent := Self;
     end;

  finally
     FreeAndNil(ChartStream);
   end;
end;




procedure TfrmConfigChart.btEditarClick(Sender: TObject);
var
  Pizza: TPieSeries;

begin
  inherited;
  try
     if Grafico.SeriesList.CountActive = 0 then
     begin
        Pizza             := TPieSeries.Create(Grafico);
        Pizza.Title       := 'Gráfico modelo';
        Pizza.ParentChart := Grafico;
        Pizza.DataSource  := _DadosGrafico;
     end;
     EditChart(Self,Grafico);

  finally

  end;
end;




procedure TfrmConfigChart.mnuEditarGraficoClick(Sender: TObject);
begin
  inherited;
   btEditar.Click;
end;




procedure TfrmConfigChart.bbtnConfirmarClick(Sender: TObject);
var
   ChartStream: TMemoryStream;
begin
  inherited;
  try
    ChartStream := TMemoryStream.Create;
    SaveChartToStream(Grafico,ChartStream);
    TBlobField(FrmCadRelatorio.Cds.FieldByName('TEMPLATE')).LoadFromStream(ChartStream);

  except
    FreeAndNil(ChartStream);
  end;

end;

end.

