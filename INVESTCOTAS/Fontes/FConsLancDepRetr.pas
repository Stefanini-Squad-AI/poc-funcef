unit FConsLancDepRetr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, uCtrlCarteiraInvest, uCtrlPadroes, uSistema,
  uCtrlInvestCotas, uCtrlHistCaixa, uCtrlEventoCaixaCota, FPreview;

type
  TFrmConsLancDepRetr = class(TfrmOkCancelarRelInv)
    CMSqlParams1: TCMSqlParams;
    dsConsulta: TDataSource;
    CdsConsulta: TCMClientDataSet;
    CdsEvento: TCMClientDataSet;
    CdsCarteira: TCMClientDataSet;
    PnlFiltro: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    LblData: TLabel;
    Label1: TLabel;
    dDataInicial: TCMDateTimePicker;
    dDataFinal: TCMDateTimePicker;
    dblCarteira: TwwDBLookupCombo;
    dblEveCxCota: TwwDBLookupCombo;
    PnlGrid: TPanel;
    dbGrd: TwwDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblCarteiraCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblEveCxCotaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
  private
    { Private declarations }
    CtrlEventoCaixaCota : TCtrlEventoCaixaCota;
    CtrlCarteiraInvest : TCtrlCarteiraInvest;
    CtrlInvestCotas : TCtrlInvestCotas;
    CtrlHistCaixa : TCtrlHistCaixa;
  public
    { Public declarations }
  end;

var
  FrmConsLancDepRetr: TFrmConsLancDepRetr;

implementation

uses FDMRelLancDepRetr;

{$R *.DFM}

procedure TFrmConsLancDepRetr.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlCarteiraInvest := TCtrlCarteiraInvest.Create;
   CtrlCarteiraInvest.InitializeAs(Padroes);

   CtrlInvestCotas  := TCtrlInvestCotas.Create;
   CtrlInvestCotas.InitializeAs(Padroes);

   CtrlHistCaixa := TCtrlHistCaixa.Create;
   CtrlHistCaixa.InitializeAs(Padroes);

   CtrlEventoCaixaCota := TCtrlEventoCaixaCota.Create;
   CtrlEventoCaixaCota.InitializeAs(Padroes);
end;

procedure TFrmConsLancDepRetr.FormShow(Sender: TObject);
begin
  inherited;
   CdsCarteira.Data := CtrlCarteiraInvest.ListCarteiraInvest;
   CdsEvento.Data   := CtrlEventoCaixaCota.ListEventoCaixaCota;
   CdsConsulta.Data := CtrlHistCaixa.ListLanctoCaixa;

   CdsEvento.Filter := '(IDEVENTOCAIXACOTA = -6 OR IDEVENTOCAIXACOTA = -7)';
   CdsEvento.Filtered := True;

   CdsConsulta.Filter := '(IDEVENTOCAIXACOTA = -6 OR IDEVENTOCAIXACOTA = -7)';
   CdsConsulta.Filtered := True;

   TFloatField(CdsConsulta.Fields[CdsConsulta.FieldByName('VLRHISTCAIXA').Index]).DisplayFormat := '#,##0';

   if cdsConsulta.IsEmpty then
      bt_Imprime.Enabled  := False
   else
      bt_Imprime.Enabled  := True;
end;

procedure TFrmConsLancDepRetr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlCarteiraInvest);
   FreeAndNil(CtrlInvestCotas);
   FreeAndNil(CtrlHistCaixa);
   FreeAndNil(CtrlEventoCaixaCota);
end;

procedure TFrmConsLancDepRetr.dblCarteiraCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   bt_Imprime.Enabled  := False;
end;

procedure TFrmConsLancDepRetr.dblEveCxCotaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   bt_Imprime.Enabled  := False;
end;

procedure TFrmConsLancDepRetr.bbtnConfirmarClick(Sender: TObject);
var iCarteira : Integer;
    iEvento : Integer;
begin
  inherited;
   if (Trim(dDataInicial.Text) = '') then
   begin
      dDataInicial.SetFocus;
      Exit;
   end;

   if (Trim(dDataFinal.Text) = '') then
   begin
      dDataFinal.SetFocus;
      Exit;
   end;

   if (dDataInicial.Date > dDataFinal.Date) then
   begin
      dDataInicial.SetFocus;
      Exit;
   end;

   iCarteira := -1;
   if (Trim(dblCarteira.Text) <> '') then
      iCarteira := CdsCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;

   iEvento := 0;
   if (Trim(dblEveCxCota.Text) <> '') then
      iEvento := CdsEvento.FieldByName('IDEVENTOCAIXACOTA').AsInteger;

   CdsConsulta.Data := CtrlHistCaixa.ListLanctoCaixa(dDataInicial.Date, dDataFinal.Date, iCarteira, iEvento);

   TFloatField(CdsConsulta.Fields[CdsConsulta.FieldByName('VLRHISTCAIXA').Index]).DisplayFormat := '#,##0.00';

   if cdsConsulta.IsEmpty then
      bt_Imprime.Enabled  := False
   else
      bt_Imprime.Enabled  := True;

end;

procedure TFrmConsLancDepRetr.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   dDataInicial.Clear;
   dDataFinal.Clear;
   dblCarteira.Clear;
   CdsConsulta.Close;  
   bt_Imprime.Enabled  := False;
end;

procedure TFrmConsLancDepRetr.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
   RelLancDepRetr.cds.Data := CdsConsulta.Data;

   RelLancDepRetr.cds.Filter := '(IDEVENTOCAIXACOTA = -6 OR IDEVENTOCAIXACOTA = -7)';
   RelLancDepRetr.cds.Filtered := True;

   RelLancDepRetr.cdsLogoTipo.Data    := CtrlInvestCotas.ListLogoEmpresa;

   RelLancDepRetr.LblEmpresa.Caption  :=  Sistema.NomeEmpresa;

   RelLancDepRetr.LblSistema.Caption  := Sistema.NomeModulo + ' ' + Sistema.Versao;

   RelLancDepRetr.LblPeriodo.Caption  := dDataInicial.Text + ' a ' + dDataFinal.Text;

   if not cdsConsulta.IsEmpty then
      TFrmPreview.CreateModalPreview(Application,
                                     RelLancDepRetr.rptReport,
                                     RelLancDepRetr.rptReport.PrinterSetup.DocumentName);
end;

end.
