unit FConsLanctoCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, uCmSqlParams, Db, DBClient,
  uCMClientDataSet, Grids, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, uCtrlCarteiraInvest, uCtrlPadroes, uSistema,
  uCtrlInvestCotas, uCtrlHistCaixa, uCtrlCarteiraXEvento, FPreview;

type
  TFrmConsLanctoCaixa = class(TfrmOkCancelarRelInv)
    PnlFiltro: TPanel;
    PnlGrid: TPanel;
    CdsCarteira: TCMClientDataSet;
    CdsConsulta: TCMClientDataSet;
    dsConsulta: TDataSource;
    CMSqlParams1: TCMSqlParams;
    dbGrd: TwwDBGrid;
    GroupBox1: TGroupBox;
    LblData: TLabel;
    dDataInicial: TCMDateTimePicker;
    dDataFinal: TCMDateTimePicker;
    Label1: TLabel;
    dblCarteira: TwwDBLookupCombo;
    Label2: TLabel;
    CdsEvento: TCMClientDataSet;
    Label3: TLabel;
    dblEveCxCota: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblCarteiraCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblCarteiraExit(Sender: TObject);
    procedure dblCarteiraEnter(Sender: TObject);
  private
    { Private declarations }
    CtrlCarteiraXEvento : TCtrlCarteiraXEvento;
    CtrlCarteiraInvest : TCtrlCarteiraInvest;
    CtrlInvestCotas : TCtrlInvestCotas;
    CtrlHistCaixa : TCtrlHistCaixa;

    bModif  : Boolean;
    sVarAnt : String;
  public
    { Public declarations }
  end;

var
  FrmConsLanctoCaixa: TFrmConsLanctoCaixa;

implementation

uses FDMRelLanctoCaixa;

{$R *.DFM}

procedure TFrmConsLanctoCaixa.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlCarteiraInvest := TCtrlCarteiraInvest.Create;
   CtrlCarteiraInvest.InitializeAs(Padroes);

   CtrlInvestCotas  := TCtrlInvestCotas.Create;
   CtrlInvestCotas.InitializeAs(Padroes);

   CtrlHistCaixa := TCtrlHistCaixa.Create;
   CtrlHistCaixa.InitializeAs(Padroes);

   CtrlCarteiraXEvento := TCtrlCarteiraXEvento.Create;
   CtrlCarteiraXEvento.InitializeAs(Padroes);
end;

procedure TFrmConsLanctoCaixa.FormShow(Sender: TObject);
begin
  inherited;
   CdsCarteira.Data := CtrlCarteiraInvest.ListCarteiraInvest;
   CdsEvento.Data   := CtrlCarteiraXEvento.ListCarteiraXEvento(0,0,0,'S');
   CdsConsulta.Data := CtrlHistCaixa.ListLanctoCaixa;

   CdsEvento.Filter := '(IDEVENTOCAIXACOTA <> -1 AND IDEVENTOCAIXACOTA <> -2)';
   CdsEvento.Filtered := True;

   CdsConsulta.Filter := '(IDEVENTOCAIXACOTA <> -1 AND IDEVENTOCAIXACOTA <> -2)';
   CdsConsulta.Filtered := True;

   TFloatField(CdsConsulta.Fields[CdsConsulta.FieldByName('VLRHISTCAIXA').Index]).DisplayFormat := '#,##0';

   if cdsConsulta.IsEmpty then
      bt_Imprime.Enabled  := False
   else
      bt_Imprime.Enabled  := True;
end;

procedure TFrmConsLanctoCaixa.bbtnConfirmarClick(Sender: TObject);
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

procedure TFrmConsLanctoCaixa.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
   RelLanctoCaixa.cds.Data := CdsConsulta.Data;

   RelLanctoCaixa.cds.Filter := '(IDEVENTOCAIXACOTA <> -1 AND IDEVENTOCAIXACOTA <> -2)';
   RelLanctoCaixa.cds.Filtered := True;

   RelLanctoCaixa.cdsLogoTipo.Data    := CtrlInvestCotas.ListLogoEmpresa;

   RelLanctoCaixa.LblEmpresa.Caption  :=  Sistema.NomeEmpresa;

   RelLanctoCaixa.LblSistema.Caption  := Sistema.NomeModulo + ' ' + Sistema.Versao;

   RelLanctoCaixa.LblPeriodo.Caption  := dDataInicial.Text + ' a ' + dDataFinal.Text;

   if not cdsConsulta.IsEmpty then
      TFrmPreview.CreateModalPreview(Application,
                                     RelLanctoCaixa.rptReport,
                                     RelLanctoCaixa.rptReport.PrinterSetup.DocumentName);
end;

procedure TFrmConsLanctoCaixa.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   dDataInicial.Clear;
   dDataFinal.Clear;
   dblCarteira.Clear;
   dblEveCxCota.Clear;
   CdsConsulta.Close;
   bt_Imprime.Enabled  := False;   
end;

procedure TFrmConsLanctoCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlCarteiraInvest);
   FreeAndNil(CtrlInvestCotas);
   FreeAndNil(CtrlHistCaixa);
   FreeAndNil(CtrlCarteiraXEvento);
end;

procedure TFrmConsLanctoCaixa.dblCarteiraCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   bModif := modified;

   if ((modified) and (Trim(dblCarteira.Text) <> '')) then
      CdsEvento.Data   := CtrlCarteiraXEvento.ListCarteiraXEvento(0, CdsCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger);
end;

procedure TFrmConsLanctoCaixa.dblCarteiraExit(Sender: TObject);
begin
  inherited;
   if ((Not bModif) and (Trim(dblCarteira.Text) <> '') and (sVarAnt <> dblCarteira.LookupValue)) then
      CdsEvento.Data   := CtrlCarteiraXEvento.ListCarteiraXEvento(0, CdsCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger);
   bModif := False;
end;

procedure TFrmConsLanctoCaixa.dblCarteiraEnter(Sender: TObject);
begin
  inherited;
   sVarAnt := dblCarteira.LookupValue;
end;

end.
