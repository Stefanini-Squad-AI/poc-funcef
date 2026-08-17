unit FConsApuraCota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, Grids, Wwdbigrd, Wwdbgrid, wwdblook, StdCtrls,
  wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams, Db, DBClient,
  uCMClientDataSet, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, uCtrlCarteiraInvest, uCtrlPadroes, uSistema,
  uCtrlInvestCotas, uCtrlHistCota, FPreview;

type
  TFrmConsApuraCota = class(TfrmOkCancelarRelInv)
    CdsConsulta: TCMClientDataSet;
    dsConsulta: TDataSource;
    CMSqlParams1: TCMSqlParams;
    CdsCarteira: TCMClientDataSet;
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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
  private
    { Private declarations }
    CtrlCarteiraInvest : TCtrlCarteiraInvest;
    CtrlInvestCotas : TCtrlInvestCotas;
    CtrlHistCota : TCtrlHistCota;
  public
    { Public declarations }
  end;

var
  FrmConsApuraCota: TFrmConsApuraCota;

implementation

uses FDMRelApuraCota;

{$R *.DFM}

procedure TFrmConsApuraCota.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlCarteiraInvest := TCtrlCarteiraInvest.Create;
   CtrlCarteiraInvest.InitializeAs(Padroes);

   CtrlInvestCotas  := TCtrlInvestCotas.Create;
   CtrlInvestCotas.InitializeAs(Padroes);

   CtrlHistCota := TCtrlHistCota.Create;
   CtrlHistCota.InitializeAs(Padroes);
end;

procedure TFrmConsApuraCota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlCarteiraInvest);
   FreeAndNil(CtrlInvestCotas);
   FreeAndNil(CtrlHistCota);
end;

procedure TFrmConsApuraCota.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   dDataInicial.Clear;
   dDataFinal.Clear;
   dblCarteira.Clear;
   CdsConsulta.Close;
end;

procedure TFrmConsApuraCota.FormShow(Sender: TObject);
begin
  inherited;
   CdsCarteira.Data := CtrlCarteiraInvest.ListCarteiraInvest;
   CdsConsulta.Data := CtrlHistCota.ListLanctoHistCota;

   CdsConsulta.Filter := '(STACOTIZA = ''S'')';
   CdsConsulta.Filtered := True;

   if cdsConsulta.IsEmpty then
      bt_Imprime.Enabled  := False
   else
      bt_Imprime.Enabled  := True;
end;

procedure TFrmConsApuraCota.bbtnConfirmarClick(Sender: TObject);
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

   CdsConsulta.Data := CtrlHistCota.ListLanctoHistCota(dDataInicial.Date, dDataFinal.Date, iCarteira);

   TFloatField(CdsConsulta.Fields[CdsConsulta.FieldByName('VLRHISTCOTA').Index]).DisplayFormat := '#,##0.00';   

   if cdsConsulta.IsEmpty then
      bt_Imprime.Enabled  := False
   else
      bt_Imprime.Enabled  := True;
end;

procedure TFrmConsApuraCota.bt_ImprimeClick(Sender: TObject);
var iCarteira : Integer;
begin
  inherited;
   if not cdsConsulta.IsEmpty then
   begin
      iCarteira := -1;
      if (Trim(dblCarteira.Text) <> '') then
         iCarteira := CdsCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;

      RelApuraCota.LblEmpresa.Caption :=  Sistema.NomeEmpresa;
      
      RelApuraCota.LblSistema.Caption := Sistema.NomeModulo + ' ' + Sistema.Versao;

      try
         RelApuraCota.cdsLogoTipo.Data    := CtrlInvestCotas.ListLogoEmpresa;

         RelApuraCota.cds.Data      := CtrlHistCota.ListGuiaRelLanctoCota(dDataInicial.Date, dDataFinal.Date, iCarteira);

         RelApuraCota.CdsAtivo.Data := CtrlHistCota.ListLanctoHistCota(dDataInicial.Date, dDataFinal.Date, iCarteira, 0, 'A');
         RelApuraCota.CdsAtivo.Filter := '(STACOTIZA = ''S'')';
         RelApuraCota.CdsAtivo.Filtered := True;

         RelApuraCota.CdsPassivo.Data := CtrlHistCota.ListLanctoHistCota(dDataInicial.Date, dDataFinal.Date, iCarteira, 0, 'P');
         RelApuraCota.CdsPassivo.Filter := '(STACOTIZA = ''S'')';
         RelApuraCota.CdsPassivo.Filtered := True;

         RelApuraCota.CdsPLF.Data    := CtrlHistCota.ListHistApuracao(dDataInicial.Date, dDataFinal.Date, -3, iCarteira);

         RelApuraCota.CdsQtd.Data   := CtrlHistCota.ListHistApuracao(dDataInicial.Date, dDataFinal.Date, -4, iCarteira);

         RelApuraCota.CdsCota.Data  := CtrlHistCota.ListHistApuracao(dDataInicial.Date, dDataFinal.Date, -5, iCarteira);

         RelApuraCota.CdsCTE.Data  := CtrlHistCota.ListHistApuracao(dDataInicial.Date, dDataFinal.Date, -16, iCarteira);

         RelApuraCota.CdsCTR.Data  := CtrlHistCota.ListHistApuracao(dDataInicial.Date, dDataFinal.Date, -17, iCarteira);

         RelApuraCota.CdsPL.Data  := CtrlHistCota.ListHistApuracao(dDataInicial.Date, dDataFinal.Date, -18, iCarteira);

         TFrmPreview.CreateModalPreview(Application,
                                        RelApuraCota.rptReport,
                                        RelApuraCota.rptReport.PrinterSetup.DocumentName);
      finally
         RelApuraCota.cdsLogoTipo.Close;
         RelApuraCota.cds.Close;
         RelApuraCota.CdsAtivo.Close;
         RelApuraCota.CdsPassivo.Close;
         RelApuraCota.CdsPL.Close;
         RelApuraCota.CdsQtd.Close;
         RelApuraCota.CdsCota.Close;
         RelApuraCota.CdsAux.Close;
      end;
   end;
end;

end.
