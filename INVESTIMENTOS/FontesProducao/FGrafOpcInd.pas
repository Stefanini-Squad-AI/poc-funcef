//******************************************************************************
// Data      : 29/12/2006
// Código    : AL_2
// Pendencia : 24066
// SOL       :
// Desc      : Acerto na impressão do relatório devido a alteração do objeto do componente
//******************************************************************************

unit FGrafOpcInd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, Db, DBTables, Wwquery, TeEngine, Series, TeeProcs, Chart,
  DBChart, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls,
  Wwdatsrc, wwdblook, TeeFunci, FPreview;

type
  TfrmGrafOpcInd = class(TfrmOkCancelarInv)
    Panel1: TPanel;
    pgcDados: TPageControl;
    tbsInvestimentos: TTabSheet;
    dbgHistRenFix: TwwDBGrid;
    tbsGrafico: TTabSheet;
    dbcGrafico: TDBChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    qryOpcoes: TwwQuery;
    qryOpcoesIDBOLETA: TStringField;
    qryOpcoesIDLOTE: TStringField;
    qryOpcoesDESCINVESTIMENTO: TStringField;
    dbgOpcoes: TwwDBGrid;
    dsOpcao: TwwDataSource;
    dblBoleta: TwwDBLookupCombo;
    Label1: TLabel;
    TeeFunction1: TAddTeeFunction;
    Series4: TBarSeries;
    qryBoletas: TwwQuery;
    chkMostraValores: TCheckBox;
    qryBoletasIDBOLETA: TStringField;
    qryBoletasIDLOTE: TStringField;
    qryBoletasDESCINVESTIMENTO: TStringField;
    chkMostraAjuste: TCheckBox;
    bbtnImprimir: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    procedure pgcDadosChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkMostraValoresClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure chkMostraAjusteClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblBoletaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    procedure Sel(sBoleta: String = '-1'; sLote: String = '-1');
  public
    { Public declarations }
  end;

var
  frmGrafOpcInd: TfrmGrafOpcInd;

implementation

uses UOperComum, FDmRelGrafOpcInd;

{$R *.DFM}

procedure TfrmGrafOpcInd.Sel(sBoleta: String = '-1'; sLote: String = '-1');
begin
   with DmRelGrafOpcInd do
   begin
      OperComum.LimpaParametros(qryHistOpcInd);
      OperComum.LimpaParametros(qryTravaAlta);
      OperComum.LimpaParametros(qryTravaBaixa);
      OperComum.LimpaParametros(qryCesta);
      OperComum.LimpaParametros(qryAjuste);
      OperComum.LimpaParametros(qryOpcoes);
      if Trim(sBoleta) <> '-1' then
      begin
         qryHistOpcInd.ParamByName('IDBOLETA').AsString := sBoleta;
         qryTravaAlta.ParamByName('IDBOLETA').AsString := sBoleta;
         qryTravaBaixa.ParamByName('IDBOLETA').AsString := sBoleta;
         qryCesta.ParamByName('IDBOLETA').AsString := sBoleta;
         qryAjuste.ParamByName('IDBOLETA').AsString := sBoleta;
         qryOpcoes.ParamByName('IDBOLETA').AsString := sBoleta;
      end;
      if Trim(sLote) <> '-1' then
      begin
         qryHistOpcInd.ParamByName('IDLOTE').AsString := sLote;
         qryTravaAlta.ParamByName('IDLOTE').AsString := sLote;
         qryTravaBaixa.ParamByName('IDLOTE').AsString := sLote;
         qryCesta.ParamByName('IDLOTE').AsString := sLote;
         qryAjuste.ParamByName('IDLOTE').AsString := sLote;
         qryOpcoes.ParamByName('IDLOTE').AsString := sLote;
      end;

      qryHistOpcInd.Open;
      qryTravaAlta.Open;
      qryTravaBaixa.Open;
      qryCesta.Open;
      qryAjuste.Open;
      qryOpcoes.Open;

      if qryHistOpcInd.IsEmpty then
         bbtnImprimir.Enabled := False
      else
         bbtnImprimir.Enabled := True;
   end;
end;

procedure TfrmGrafOpcInd.pgcDadosChange(Sender: TObject);
begin
   inherited;
   chkMostraValores.Visible := (pgcDados.ActivePage = tbsGrafico);
   chkMostraAjuste.Visible := (pgcDados.ActivePage = tbsGrafico);
end;

procedure TfrmGrafOpcInd.FormShow(Sender: TObject);
begin
   inherited;
   chkMostraValores.Visible := False;
   chkMostraAjuste.Visible := False;
   pgcDados.ActivePage := tbsInvestimentos;
   qryBoletas.Open;
   Sel;
end;

procedure TfrmGrafOpcInd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   with DmRelGrafOpcInd do
   begin
      OperComum.LimpaParametros(qryOpcoes);
      OperComum.LimpaParametros(qryHistOpcInd);
      OperComum.LimpaParametros(qryTravaAlta);
      OperComum.LimpaParametros(qryTravaBaixa);
      OperComum.LimpaParametros(qryCesta);
      OperComum.LimpaParametros(qryAjuste);
      OperComum.LimpaParametros(qryOpcoes);
   end;
   inherited;
end;

procedure TfrmGrafOpcInd.chkMostraValoresClick(Sender: TObject);
var i: Integer;
begin
   inherited;
   for i := 0 to dbcGrafico.SeriesCount -1 do
      dbcGrafico.Series[i].Marks.Visible := chkMostraValores.Checked;
end;

procedure TfrmGrafOpcInd.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   Sel;
end;

procedure TfrmGrafOpcInd.chkMostraAjusteClick(Sender: TObject);
begin
   inherited;
   dbcGrafico.Series[3].Active := chkMostraAjuste.Checked;
end;

procedure TfrmGrafOpcInd.bbtnImprimirClick(Sender: TObject);
begin
   inherited;
   with DmRelGrafOpcInd do
   begin
      qryHistOpcInd.DisableControls;
      //AL_2 Ini
      ppgGrafico.Chart.Series[3].Active := chkMostraAjuste.Checked;
      ppgGrafico.Chart.Series[0].Marks.Visible := chkMostraValores.Checked;
      ppgGrafico.Chart.Series[1].Marks.Visible := chkMostraValores.Checked;
      ppgGrafico.Chart.Series[2].Marks.Visible := chkMostraValores.Checked;
      ppgGrafico.Chart.Series[3].Marks.Visible := chkMostraValores.Checked;
      //AL_2 Fim

      qryHistOpcInd.First;
      lblPeriodo.Caption := 'De ' + qryHistOpcIndDATA.AsString + ' até ';
      qryHistOpcInd.Last;
      lblPeriodo.Caption := lblPeriodo.Caption + qryHistOpcIndDATA.AsString;
      qryHistOpcInd.First;


      TFrmPreview.CreateModalPreview(Application,
                                     rptGraficoEvolucao,
                                     rptGraficoEvolucao.PrinterSetup.DocumentName);

      qryHistOpcInd.EnableControls;
   end;
end;

procedure TfrmGrafOpcInd.FormCreate(Sender: TObject);
begin
  WindowState := wsMaximized;
  inherited;
end;

procedure TfrmGrafOpcInd.dblBoletaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   if Trim(dblBoleta.Text) <> '' then
      Sel(qryBoletasIDBOLETA.AsString, qryBoletasIDLOTE.AsString)
   else
   begin
      with DmRelGrafOpcInd do
      begin
         OperComum.LimpaParametros(qryHistOpcInd);
         OperComum.LimpaParametros(qryTravaAlta);
         OperComum.LimpaParametros(qryTravaBaixa);
         OperComum.LimpaParametros(qryCesta);
         OperComum.LimpaParametros(qryAjuste);
         OperComum.LimpaParametros(qryOpcoes);
      end;
   end;
end;

end.
