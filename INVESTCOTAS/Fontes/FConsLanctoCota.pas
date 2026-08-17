unit FConsLanctoCota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, uCtrlCarteiraInvest, uCtrlPadroes, uSistema,
  uCtrlInvestCotas, uCtrlHistCota, uCtrlCarteiraXEvento, FPreview;

type
  TFrmConsLanctoCota = class(TfrmOkCancelarRelInv)
    CdsCarteira: TCMClientDataSet;
    CdsEvento: TCMClientDataSet;
    CdsConsulta: TCMClientDataSet;
    dsConsulta: TDataSource;
    CMSqlParams1: TCMSqlParams;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dblCarteiraCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblCarteiraExit(Sender: TObject);
    procedure dblCarteiraEnter(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
  private
    { Private declarations }
    CtrlCarteiraXEvento : TCtrlCarteiraXEvento;
    CtrlCarteiraInvest : TCtrlCarteiraInvest;
    CtrlInvestCotas : TCtrlInvestCotas;
    CtrlHistCota : TCtrlHistCota;

    bModif  : Boolean;
    sVarAnt : String;
  public
    { Public declarations }
  end;

var
  FrmConsLanctoCota: TFrmConsLanctoCota;

implementation

uses FDMRelLanctoCota;

{$R *.DFM}

procedure TFrmConsLanctoCota.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlCarteiraInvest := TCtrlCarteiraInvest.Create;
   CtrlCarteiraInvest.InitializeAs(Padroes);

   CtrlInvestCotas  := TCtrlInvestCotas.Create;
   CtrlInvestCotas.InitializeAs(Padroes);

   CtrlHistCota := TCtrlHistCota.Create;
   CtrlHistCota.InitializeAs(Padroes);

   CtrlCarteiraXEvento := TCtrlCarteiraXEvento.Create;
   CtrlCarteiraXEvento.InitializeAs(Padroes); 
end;

procedure TFrmConsLanctoCota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlCarteiraInvest);
   FreeAndNil(CtrlInvestCotas);
   FreeAndNil(CtrlHistCota);
   FreeAndNil(CtrlCarteiraXEvento);
end;

procedure TFrmConsLanctoCota.FormShow(Sender: TObject);
begin
  inherited;
   CdsCarteira.Data := CtrlCarteiraInvest.ListCarteiraInvest;
   
   CdsEvento.Data   := CtrlCarteiraXEvento.ListCarteiraXEvento;

   CdsEvento.Filter := '(IDEVENTOCAIXACOTA <> -3 AND IDEVENTOCAIXACOTA <> -4 AND IDEVENTOCAIXACOTA <> -5'+
                       ' AND IDEVENTOCAIXACOTA <> -16 AND IDEVENTOCAIXACOTA <> -17 AND IDEVENTOCAIXACOTA <> -18)';
   CdsEvento.Filtered := True;

   CdsConsulta.Data := CtrlHistCota.ListLanctoHistCota;

   CdsConsulta.Filter := '(IDEVENTOCAIXACOTA <> -3 AND IDEVENTOCAIXACOTA <> -4 AND IDEVENTOCAIXACOTA <> -5'+
                         ' AND IDEVENTOCAIXACOTA <> -16 AND IDEVENTOCAIXACOTA <> -17 AND IDEVENTOCAIXACOTA <> -18)';
   CdsConsulta.Filtered := True;

   TFloatField(CdsConsulta.Fields[CdsConsulta.FieldByName('VLRHISTCOTA').Index]).DisplayFormat := '#,##0';

   if cdsConsulta.IsEmpty then
      bt_Imprime.Enabled  := False
   else
      bt_Imprime.Enabled  := True;
end;

procedure TFrmConsLanctoCota.dblCarteiraCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   bModif := modified;

   if ((modified) and (Trim(dblCarteira.Text) <> '')) then
      CdsEvento.Data   := CtrlCarteiraXEvento.ListCarteiraXEvento(0, CdsCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger);
end;

procedure TFrmConsLanctoCota.dblCarteiraExit(Sender: TObject);
begin
  inherited;
   if ((Not bModif) and (Trim(dblCarteira.Text) <> '') and (sVarAnt <> dblCarteira.LookupValue)) then
      CdsEvento.Data   := CtrlCarteiraXEvento.ListCarteiraXEvento(0, CdsCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger);
   bModif := False;
end;

procedure TFrmConsLanctoCota.dblCarteiraEnter(Sender: TObject);
begin
  inherited;
   sVarAnt := dblCarteira.LookupValue;
end;

procedure TFrmConsLanctoCota.bbtnConfirmarClick(Sender: TObject);
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

   CdsConsulta.Data := CtrlHistCota.ListLanctoHistCota(dDataInicial.Date, dDataFinal.Date, iCarteira, iEvento);

   TFloatField(CdsConsulta.Fields[CdsConsulta.FieldByName('VLRHISTCOTA').Index]).DisplayFormat := '#,##0.00';

   if cdsConsulta.IsEmpty then
      bt_Imprime.Enabled  := False
   else
      bt_Imprime.Enabled  := True;
end;

procedure TFrmConsLanctoCota.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   dDataInicial.Clear;
   dDataFinal.Clear;
   dblCarteira.Clear;
   dblEveCxCota.Clear;   
   CdsConsulta.Close;
   bt_Imprime.Enabled  := False;   
end;

procedure TFrmConsLanctoCota.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
   RelLanctoCota.cds.Data := CdsConsulta.Data;

   RelLanctoCota.cds.Filter := '(IDEVENTOCAIXACOTA <> -3 AND IDEVENTOCAIXACOTA <> -4 AND IDEVENTOCAIXACOTA <> -5'+
                               ' AND IDEVENTOCAIXACOTA <> -16 AND IDEVENTOCAIXACOTA <> -17 AND IDEVENTOCAIXACOTA <> -18)';
   RelLanctoCota.cds.Filtered := True;

   RelLanctoCota.cdsLogoTipo.Data    := CtrlInvestCotas.ListLogoEmpresa;

   RelLanctoCota.LblEmpresa.Caption  :=  Sistema.NomeEmpresa;

   RelLanctoCota.LblSistema.Caption  := Sistema.NomeModulo + ' ' + Sistema.Versao;

   RelLanctoCota.LblPeriodo.Caption  := dDataInicial.Text + ' a ' + dDataFinal.Text;

   if not cdsConsulta.IsEmpty then
      TFrmPreview.CreateModalPreview(Application,
                                     RelLanctoCota.rptReport,
                                     RelLanctoCota.rptReport.PrinterSetup.DocumentName);
end;

end.
