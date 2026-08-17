unit FConsApuraCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, uCmSqlParams, Db, DBClient, uCMClientDataSet, Grids,
  Wwdbigrd, Wwdbgrid, wwdblook, StdCtrls, wwdbdatetimepicker,
  CMDateTimePicker, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls,uCtrlCarteiraInvest, uCtrlPadroes,
  uCtrlInvestCotas, uCtrlHistCaixa, uCtrlCarteiraXEvento, uSistema, FPreview;

type
  TFrmConsApuraCaixa = class(TfrmOkCancelarRelInv)
    PnlFiltro: TPanel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    LblData: TLabel;
    Label1: TLabel;
    dDataInicial: TCMDateTimePicker;
    dDataFinal: TCMDateTimePicker;
    dblCarteira: TwwDBLookupCombo;
    PnlGrid: TPanel;
    dbGrd: TwwDBGrid;
    CdsCarteira: TCMClientDataSet;
    CdsConsulta: TCMClientDataSet;
    dsConsulta: TDataSource;
    CMSqlParams1: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlCarteiraInvest : TCtrlCarteiraInvest;
    CtrlInvestCotas : TCtrlInvestCotas;
    CtrlHistCaixa : TCtrlHistCaixa;    
  public
    { Public declarations }
  end;

var
  FrmConsApuraCaixa: TFrmConsApuraCaixa;

implementation

uses FDMRelApuraCaixa;

{$R *.DFM}

procedure TFrmConsApuraCaixa.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlCarteiraInvest := TCtrlCarteiraInvest.Create;
   CtrlCarteiraInvest.InitializeAs(Padroes);

   CtrlInvestCotas  := TCtrlInvestCotas.Create;
   CtrlInvestCotas.InitializeAs(Padroes);

   CtrlHistCaixa := TCtrlHistCaixa.Create;
   CtrlHistCaixa.InitializeAs(Padroes);
end;

procedure TFrmConsApuraCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlCarteiraInvest);
   FreeAndNil(CtrlInvestCotas);
   FreeAndNil(CtrlHistCaixa); 
end;

procedure TFrmConsApuraCaixa.FormShow(Sender: TObject);
begin
  inherited;
   CdsCarteira.Data := CtrlCarteiraInvest.ListCarteiraInvest;

   CdsConsulta.Data := CtrlHistCaixa.ListLanctoCaixa;

   TFloatField(CdsConsulta.Fields[CdsConsulta.FieldByName('VLRHISTCAIXA').Index]).DisplayFormat := '#,##0.00';
   TFloatField(CdsConsulta.Fields[CdsConsulta.FieldByName('SLDHISTCAIXA').Index]).DisplayFormat := '#,##0.00';

   if cdsConsulta.IsEmpty then
      bt_Imprime.Enabled  := False
   else
      bt_Imprime.Enabled  := True;
end;

procedure TFrmConsApuraCaixa.bbtnConfirmarClick(Sender: TObject);
var iCarteira : Integer;
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

   CdsConsulta.Data := CtrlHistCaixa.ListLanctoCaixa(dDataInicial.Date, dDataFinal.Date, iCarteira, 0);

   TFloatField(CdsConsulta.Fields[CdsConsulta.FieldByName('VLRHISTCAIXA').Index]).DisplayFormat := '#,##0.00';
   TFloatField(CdsConsulta.Fields[CdsConsulta.FieldByName('SLDHISTCAIXA').Index]).DisplayFormat := '#,##0.00';   

   if cdsConsulta.IsEmpty then
      bt_Imprime.Enabled  := False
   else
      bt_Imprime.Enabled  := True;
end;

procedure TFrmConsApuraCaixa.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
   RelApuraCaixa.cds.Data := CdsConsulta.Data;

   RelApuraCaixa.cdsLogoTipo.Data    := CtrlInvestCotas.ListLogoEmpresa;

   RelApuraCaixa.LblEmpresa.Caption  :=  Sistema.NomeEmpresa;

   RelApuraCaixa.lblPeriodo.Caption  := dDataInicial.Text + ' a ' + dDataFinal.Text;

   if not cdsConsulta.IsEmpty then
      TFrmPreview.CreateModalPreview(Application,
                                     RelApuraCaixa.rptReport,
                                     RelApuraCaixa.rptReport.PrinterSetup.DocumentName);
end;

procedure TFrmConsApuraCaixa.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   dDataInicial.Clear;
   dDataFinal.Clear;
   dblCarteira.Clear;
   CdsConsulta.Close;
   bt_Imprime.Enabled  := False;
end;

end.
