unit FConsEventoCaixaCota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, Grids, Wwdbigrd, Wwdbgrid, uCtrlPadroes,
  uCtrlEventoCaixaCota, uCtrlInvestCotas, uMensErro, uSistema, FPreview,
  DBCtrls;

type
  TFrmConsEventoCaixaCota = class(TfrmOkCancelarRelInv)
    PnlGrid: TPanel;
    grdConsulta: TwwDBGrid;
    CMSqlParams1: TCMSqlParams;
    dsConsulta: TDataSource;
    CdsConsulta: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlEventoCaixaCota : TCtrlEventoCaixaCota;
    CtrlInvestCotas : TCtrlInvestCotas;
  public
    { Public declarations }
  end;

var
  FrmConsEventoCaixaCota: TFrmConsEventoCaixaCota;

implementation

uses FDMRelEventoCaixaCota;

{$R *.DFM}

procedure TFrmConsEventoCaixaCota.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlEventoCaixaCota := TCtrlEventoCaixaCota.Create;
   CtrlEventoCaixaCota.InitializeAs(Padroes);
   CtrlEventoCaixaCota.CdsEventoCaixaCota := CdsConsulta;

   CtrlInvestCotas := TCtrlInvestCotas.Create;
   CtrlInvestCotas.InitializeAs(Padroes);

end;

procedure TFrmConsEventoCaixaCota.FormShow(Sender: TObject);
begin
  inherited;
   CdsConsulta.Data := CtrlEventoCaixaCota.ListEventoCaixaCota;
   if cdsConsulta.IsEmpty then
      bt_Imprime.Enabled  := False
   else
      bt_Imprime.Enabled  := True;   
end;

procedure TFrmConsEventoCaixaCota.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
   RelEventoCaixaCota.cds.Data := CdsConsulta.Data;

   RelEventoCaixaCota.cdsLogoTipo.Data     := CtrlInvestCotas.ListLogoEmpresa;

   RelEventoCaixaCota.LblEmpresa.Caption   :=  Sistema.NomeEmpresa;

   RelEventoCaixaCota.LblSistema.Caption   := Sistema.NomeModulo + ' ' + Sistema.Versao;

   if not cdsConsulta.IsEmpty then
      TFrmPreview.CreateModalPreview(Application,
                                     RelEventoCaixaCota.rptReport,
                                     RelEventoCaixaCota.rptReport.PrinterSetup.DocumentName);
end;

procedure TFrmConsEventoCaixaCota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlEventoCaixaCota);
   FreeAndNil(CtrlInvestCotas);
end;

procedure TFrmConsEventoCaixaCota.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   CdsConsulta.Close;
   bt_Imprime.Enabled  := False   
end;

procedure TFrmConsEventoCaixaCota.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   CdsConsulta.Data := CtrlEventoCaixaCota.ListEventoCaixaCota;
   if cdsConsulta.IsEmpty then
      bt_Imprime.Enabled  := False
   else
      bt_Imprime.Enabled  := True;

end;

end.
