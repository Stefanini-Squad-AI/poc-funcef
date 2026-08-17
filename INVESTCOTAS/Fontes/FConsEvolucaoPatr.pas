unit FConsEvolucaoPatr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, wwdblook, StdCtrls, wwdbdatetimepicker,
  CMDateTimePicker, Db, DBClient, uCMClientDataSet, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls,
  uCtrlCarteiraInvest, uCtrlPadroes, uSistema, uCtrlInvestCotas,
  uCtrlHistCota, FPreview, Grids,
  Wwdbigrd, Wwdbgrid, uCmSqlParams, uCtrlEventoCaixaCota;

type
  TFrmConsEvolucaoPatr = class(TfrmOkCancelarRelInv)
    CdsCarteira: TCMClientDataSet;
    PnlFiltro: TPanel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    LblData: TLabel;
    Label1: TLabel;
    dDataInicial: TCMDateTimePicker;
    dDataFinal: TCMDateTimePicker;
    dblCarteira: TwwDBLookupCombo;
    CdsEvento: TCMClientDataSet;
    dblEveCxCota: TwwDBLookupCombo;
    Label3: TLabel;
    PnlGrid: TPanel;
    dbGrd: TwwDBGrid;
    CMSqlParams1: TCMSqlParams;
    dsConsulta: TDataSource;
    CdsConsulta: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblEveCxCotaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dblCarteiraCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    CtrlEventoCaixaCota : TCtrlEventoCaixaCota;
    CtrlCarteiraInvest : TCtrlCarteiraInvest;
    CtrlInvestCotas : TCtrlInvestCotas;
    CtrlHistCota : TCtrlHistCota;

  public
    { Public declarations }
  end;

var
  FrmConsEvolucaoPatr: TFrmConsEvolucaoPatr;

implementation

uses FDMRelEvolucaoPatr;

{$R *.DFM}

procedure TFrmConsEvolucaoPatr.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlCarteiraInvest := TCtrlCarteiraInvest.Create;
   CtrlCarteiraInvest.InitializeAs(Padroes);

   CtrlInvestCotas  := TCtrlInvestCotas.Create;
   CtrlInvestCotas.InitializeAs(Padroes);

   CtrlHistCota := TCtrlHistCota.Create;
   CtrlHistCota.InitializeAs(Padroes);

   CtrlEventoCaixaCota := TCtrlEventoCaixaCota.Create;
   CtrlEventoCaixaCota.InitializeAs(Padroes);
end;

procedure TFrmConsEvolucaoPatr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlEventoCaixaCota);
   FreeAndNil(CtrlCarteiraInvest);
   FreeAndNil(CtrlInvestCotas);
   FreeAndNil(CtrlHistCota);
end;

procedure TFrmConsEvolucaoPatr.FormShow(Sender: TObject);
begin
  inherited;
   CdsCarteira.Data := CtrlCarteiraInvest.ListCarteiraInvest;

   CdsEvento.Data := CtrlEventoCaixaCota.ListEventoCaixaCota;

   CdsEvento.Filter := '(IDEVENTOCAIXACOTA = -3 OR IDEVENTOCAIXACOTA = -4 OR IDEVENTOCAIXACOTA = -5)';
   CdsEvento.Filtered := True;

   CdsConsulta.Data := CtrlHistCota.ListLanctoHistCota;

   CdsConsulta.Filter := '(IDEVENTOCAIXACOTA = -3 OR IDEVENTOCAIXACOTA = -4 OR IDEVENTOCAIXACOTA = -5)';
   CdsConsulta.Filtered := True; 
end;

procedure TFrmConsEvolucaoPatr.bt_ImprimeClick(Sender: TObject);
var iCarteira, iEvento : Integer;
begin
  inherited;
   iCarteira := -1;
   if (Trim(dblCarteira.Text) <> '') then
      iCarteira := CdsCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;

   iEvento := 0;
   if (Trim(dblEveCxCota.Text) <> '') then
      iEvento := CdsEvento.FieldByName('IDEVENTOCAIXACOTA').AsInteger;

   if iEvento = 0 then
   begin
      RelEvolucaoPatr.cdsLogoTipo.Data    := CtrlInvestCotas.ListLogoEmpresa;

      RelEvolucaoPatr.CdsPL.Data := CtrlHistCota.ListLanctoHistCota(dDataInicial.Date, dDataFinal.Date, iCarteira, -3);

      RelEvolucaoPatr.CdsQtd.Data := CtrlHistCota.ListLanctoHistCota(dDataInicial.Date, dDataFinal.Date, iCarteira, -4);

      RelEvolucaoPatr.CdsCotas.Data := CtrlHistCota.ListLanctoHistCota(dDataInicial.Date, dDataFinal.Date, iCarteira, -5);

      RelEvolucaoPatr.cds.Data := CtrlHistCota.ListGuiaRelLanctoCota(dDataInicial.Date, dDataFinal.Date, iCarteira);

      RelEvolucaoPatr.LblEmpresa.Caption  :=  Sistema.NomeEmpresa;

      RelEvolucaoPatr.LblSistema.Caption  := Sistema.NomeModulo + ' ' + Sistema.Versao;

      RelEvolucaoPatr.LblPeriodo.Caption  := dDataInicial.Text + ' a ' + dDataFinal.Text;

      if not RelEvolucaoPatr.cds.IsEmpty then
         TFrmPreview.CreateModalPreview(Application,
                                        RelEvolucaoPatr.rptReport,
                                        RelEvolucaoPatr.rptReport.PrinterSetup.DocumentName);
   end
   else
   begin
      RelEvolucaoPatr.cdsLTEvento.Data := CtrlInvestCotas.ListLogoEmpresa;

      RelEvolucaoPatr.cdsEvento.Data := CtrlHistCota.ListLanctoHistCota(dDataInicial.Date, dDataFinal.Date, iCarteira, iEvento);

      RelEvolucaoPatr.LblEmpEvento.Caption  :=  Sistema.NomeEmpresa;

      RelEvolucaoPatr.LblSisEvento.Caption  := Sistema.NomeModulo + ' ' + Sistema.Versao;

      RelEvolucaoPatr.LblPerEvento.Caption  := dDataInicial.Text + ' a ' + dDataFinal.Text;

      if not RelEvolucaoPatr.cdsEvento.IsEmpty then
         TFrmPreview.CreateModalPreview(Application,
                                        RelEvolucaoPatr.rptEvento,
                                        RelEvolucaoPatr.rptEvento.PrinterSetup.DocumentName);
   end;                                        
end;

procedure TFrmConsEvolucaoPatr.bbtnConfirmarClick(Sender: TObject);
var iCarteira, iEvento : Integer;
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

   CdsConsulta.Data := CtrlHistCota.ListLanctoHistCota(dDataInicial.Date, dDataFinal.Date, iCarteira, iEvento);

   if cdsConsulta.IsEmpty then
      bt_Imprime.Enabled  := False
   else
      bt_Imprime.Enabled  := True;

end;

procedure TFrmConsEvolucaoPatr.dblEveCxCotaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   bt_Imprime.Enabled  := False;
end;

procedure TFrmConsEvolucaoPatr.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   dDataInicial.Clear;
   dDataFinal.Clear;
   dblCarteira.Clear;
   dblEveCxCota.Clear;
   CdsConsulta.Close;
   bt_Imprime.Enabled  := False;   
end;

procedure TFrmConsEvolucaoPatr.dblCarteiraCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   bt_Imprime.Enabled  := False;
end;

end.
