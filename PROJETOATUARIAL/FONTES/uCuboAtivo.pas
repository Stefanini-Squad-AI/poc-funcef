unit uCuboAtivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, TeEngine, Series, TeeProcs, Chart, mxgraph,
  Grids, mxgrid, ComCtrls, mxpivsrc, mxDB, mxstore, Db, DBTables, mxtables,
  Menus, ImgList;

type
  TfrmCuboAtivo = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BtBtnCopyClipboard: TBitBtn;
    BtBtnCopyExcel: TBitBtn;
    DecisionCube1: TDecisionCube;
    DecisionSource1: TDecisionSource;
    DecisionQuery1: TDecisionQuery;
    Panel2: TPanel;
    DecisionPivot1: TDecisionPivot;
    BtBtnAjuda: TBitBtn;
    DcsnGrdEstatistica: TDecisionGrid;
    DcsnGrphBarras: TDecisionGraph;
    PopupMenu1: TPopupMenu;
    ImageList1: TImageList;
    Barras1: TMenuItem;
    Linha1: TMenuItem;
    Torta1: TMenuItem;
    Series1: TBarSeries;
    DcsnGrphLinhas: TDecisionGraph;
    DcsnGrphTorta: TDecisionGraph;
    BarSeries1: TFastLineSeries;
    BarSeries2: TFastLineSeries;
    BarSeries3: TFastLineSeries;
    BarSeries5: TPieSeries;
    BarSeries6: TPieSeries;
    BarSeries7: TPieSeries;
    bbtnSair: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtBtnCopyExcelClick(Sender: TObject);
    procedure BtBtnImprimirClick(Sender: TObject);
    procedure BtBtnCopyClipboardClick(Sender: TObject);
    procedure BtBtnVisualizarClick(Sender: TObject);
    procedure BtBtnSairClick(Sender: TObject);
    procedure Barras1Click(Sender: TObject);
    procedure Linha1Click(Sender: TObject);
    procedure Torta1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCuboAtivo: TfrmCuboAtivo;

implementation

Uses UOLE, URltDecisionCube;
{$R *.DFM}

procedure TfrmCuboAtivo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     //DecisionQuery1.Close;
     Action := caFree;
end;

procedure TfrmCuboAtivo.BtBtnCopyExcelClick(Sender: TObject);
var
  Planilha : TOLEObject;
begin
     Try
       Try
         //Planilha..Create(DecisionQuery1);
         Planilha := TOLEObject.Create(DecisionQuery1);
         Planilha.CallExcel;
       Except
         Application.MessageBox('Não foi possível inicializar o EXCEL.' + #13#10 + #13#10 +
            'Verifique se o o EXCEL está corretamente instalado.', 'Aviso',
            MB_OK + MB_ICONWARNING); 
       End;
     Finally
       Planilha.Free;
     End;
end;

procedure TfrmCuboAtivo.BtBtnImprimirClick(Sender: TObject);
begin
     //DecisionGraph1.PrintLandscape;
end;

procedure TfrmCuboAtivo.BtBtnCopyClipboardClick(Sender: TObject);
begin
     //DecisionGraph1.CopyToClipboardBitmap;
end;

procedure TfrmCuboAtivo.BtBtnVisualizarClick(Sender: TObject);
begin

  Application.CreateForm(TRltDecisionCube, RltDecisionCube);

  Try
  with RltDecisionCube do
  begin
    // Create the labels for the report.  Dynamicly creating the labels
    // allows us to redefine the report when the orientation is changed
    // by the user

    DecisionGrid1 := DcsnGrdEstatistica;
    PivotSummary := DcsnGrdEstatistica.Cells[-1,DcsnGrdEstatistica.RowCount-DcsnGrdEstatistica.FixedRows-1];

    TituloRelatorio := frmCuboAtivo.Caption;

    CreateLabels;

    // Call the preview
    If (Sender As TBitBtn).Caption = 'Visualizar Relatório' Then
       RltDecisionCube.preview
    Else
       RltDecisionCube.print;

    // Free the labels on the report
    FreeLabels;
  end;
  Finally
  RltDecisionCube.free;
  End;
end;

procedure TfrmCuboAtivo.BtBtnSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmCuboAtivo.Barras1Click(Sender: TObject);
begin
     DcsnGrphBarras.DecisionSource := DecisionSource1;
     DcsnGrphLinhas.DecisionSource := Nil;
     DcsnGrphTorta.DecisionSource := Nil;

     DcsnGrphBarras.Show;
     DcsnGrphLinhas.Hide;
     DcsnGrphTorta.Hide;
end;

procedure TfrmCuboAtivo.Linha1Click(Sender: TObject);
begin
     DcsnGrphBarras.DecisionSource := Nil;
     DcsnGrphLinhas.DecisionSource := DecisionSource1;
     DcsnGrphTorta.DecisionSource := Nil;

     DcsnGrphBarras.Hide;
     DcsnGrphLinhas.Show;
     DcsnGrphTorta.Hide;
end;

procedure TfrmCuboAtivo.Torta1Click(Sender: TObject);
begin
     DcsnGrphBarras.DecisionSource := Nil;
     DcsnGrphLinhas.DecisionSource := Nil;
     DcsnGrphTorta.DecisionSource := DecisionSource1;

     DcsnGrphBarras.Hide;
     DcsnGrphLinhas.Hide;
     DcsnGrphTorta.Show;
end;

procedure TfrmCuboAtivo.FormCreate(Sender: TObject);
begin
     DcsnGrphBarras.Show;
     DcsnGrphLinhas.Hide;
     DcsnGrphTorta.Hide;
end;

procedure TfrmCuboAtivo.bbtnSairClick(Sender: TObject);
begin
 close;
end;

end.
