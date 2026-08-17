unit FConsAnunciosAbertos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, FPreview;

type
  TfrmConsAnunciosAbertos = class(TfrmOkCancelarRelInv)
    dbgAnuncRel: TwwDBGrid;
    pnlConsulta: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    dblkInvest: TwwDBLookupCombo;
    dblkTpOper: TwwDBLookupCombo;
    dtRef: TCMDateTimePicker;
    qryInvestimento: TwwQuery;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryTpOperacao: TwwQuery;
    qryTpOperacaoDESCTIPOOPERACAO: TStringField;
    qryTpOperacaoIDTIPOOPERACAO: TFloatField;
    procedure dtRefExit(Sender: TObject);
    procedure dtPrevistaExit(Sender: TObject);
    procedure dblkTpOperExit(Sender: TObject);
    procedure dblkInvestExit(Sender: TObject);
    procedure dblkTpOperCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AbreQuery;
  end;

var
  frmConsAnunciosAbertos: TfrmConsAnunciosAbertos;

implementation

uses FDmRelAnuncAbt, UOperComum;

{$R *.DFM}


procedure TfrmConsAnunciosAbertos.AbreQuery;
begin
   with DmRelAnuncAbt, DmRelAnuncAbt.qryAnunciosAbt, OperComum do
   begin
      LimpaParametros(qryAnunciosAbt);
      if Trim(dtRef.Text) <> '' then
         ParamByName('DATAREF').AsString := dtRef.Text;
      if Trim(dblkTpOper.Text) <> '' then
         ParamByName('IDTIPOOPERACAO').AsInteger := qryTpOperacaoIDTIPOOPERACAO.AsInteger;
      if Trim(dblkInvest.Text) <> '' then
         ParamByName('IDINVESTIMENTO').AsInteger := qryInvestimentoIDINVESTIMENTO.AsInteger;
      Open;
   end;
end;

procedure TfrmConsAnunciosAbertos.dtRefExit(Sender: TObject);
begin
   inherited;
   AbreQuery;
end;

procedure TfrmConsAnunciosAbertos.dtPrevistaExit(Sender: TObject);
begin
   inherited;
   AbreQuery;
end;

procedure TfrmConsAnunciosAbertos.dblkTpOperExit(Sender: TObject);
begin
   inherited;
   AbreQuery;
end;

procedure TfrmConsAnunciosAbertos.dblkInvestExit(Sender: TObject);
begin
   inherited;
   AbreQuery;
end;

procedure TfrmConsAnunciosAbertos.dblkTpOperCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if modified then
      AbreQuery;
end;

procedure TfrmConsAnunciosAbertos.dblkInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if modified then
      AbreQuery;
end;

procedure TfrmConsAnunciosAbertos.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   AbreQuery;
end;

procedure TfrmConsAnunciosAbertos.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   OperComum.LimpaParametros(DmRelAnuncAbt.qryAnunciosAbt);
end;

procedure TfrmConsAnunciosAbertos.bt_ImprimeClick(Sender: TObject);
begin
   inherited;

   // Força a saída do componente atual para acionar o OnExit deste componente
   //    no caso de teclar enter e o botão for default
   SelectNext(ActiveControl,True,True);

   with DmRelAnuncAbt do
   begin
      lblFiltros.Caption   := '';
      if Trim(dtRef.Text) <> '' then
         lblFiltros.Caption   := 'Data Referência: ' + dtRef.Text + ' ';
      if Trim(dblkTpOper.Text) <> '' then
         lblFiltros.Caption   := lblFiltros.Caption + 'Tipo de Operação: ' + dblkTpOper.Text + ' ';
      if Trim(dblkInvest.Text) <> '' then
         lblFiltros.Caption   := lblFiltros.Caption + 'Investimento: ' + dblkInvest.Text + ' ';

      qryAnunciosAbt.DisableControls;

      TFrmPreview.CreateModalPreview(Application,
                                     rptAnunciosAbt,
                                     rptAnunciosAbt.PrinterSetup.DocumentName);

      qryAnunciosAbt.EnableControls;

   end;
end;

end.
