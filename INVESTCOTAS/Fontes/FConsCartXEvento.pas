unit FConsCartXEvento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdblook, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, Grids, Wwdbigrd, Wwdbgrid, uMensErro, uSistema,
  FPreview, uCtrlEventoCaixaCota, uCtrlCarteiraXEvento, uCtrlCarteiraInvest,
  uCtrlPadroes, uCtrlInvestCotas;

type
  TFrmConsCartXEvento = class(TfrmOkCancelarRelInv)
    PnlFiltro: TPanel;
    CdsCarteira: TCMClientDataSet;
    CdsEvento: TCMClientDataSet;
    CdsConsulta: TCMClientDataSet;
    dsConsulta: TDataSource;
    CMSqlParams1: TCMSqlParams;
    Label1: TLabel;
    dblCarteira: TwwDBLookupCombo;
    Label3: TLabel;
    dblEveCxCota: TwwDBLookupCombo;
    dbGrd: TwwDBGrid;
    rgItens: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
  private
    { Private declarations }
    CtrlCarteiraXEvento : TCtrlCarteiraXEvento;
    CtrlCarteiraInvest : TCtrlCarteiraInvest;
    CtrlEventoCaixaCota : TCtrlEventoCaixaCota;
    CtrlInvestCotas : TCtrlInvestCotas;
  public
    { Public declarations }
  end;

var
  FrmConsCartXEvento: TFrmConsCartXEvento;

implementation

uses FDMRelCartXEvento;

{$R *.DFM}

procedure TFrmConsCartXEvento.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlCarteiraXEvento := TCtrlCarteiraXEvento.Create;
   CtrlCarteiraXEvento.InitializeAs(Padroes);

   CtrlCarteiraInvest := TCtrlCarteiraInvest.Create;
   CtrlCarteiraInvest.InitializeAs(Padroes);
   CtrlCarteiraInvest.CdsCarteiraInvest := CdsCarteira;

   CtrlEventoCaixaCota := TCtrlEventoCaixaCota.Create;
   CtrlEventoCaixaCota.InitializeAs(Padroes);
   CtrlEventoCaixaCota.CdsEventoCaixaCota := CdsEvento;

   CtrlInvestCotas  := TCtrlInvestCotas.Create;
   CtrlInvestCotas.InitializeAs(Padroes);

end;

procedure TFrmConsCartXEvento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlCarteiraXEvento);
   FreeAndNil(CtrlCarteiraInvest);
   FreeAndNil(CtrlEventoCaixaCota);
   FreeAndNil(CtrlInvestCotas);
end;

procedure TFrmConsCartXEvento.FormShow(Sender: TObject);
begin
  inherited;
   CdsCarteira.Data := CtrlCarteiraInvest.ListCarteiraInvest;
   CdsEvento.Data   := CtrlEventoCaixaCota.ListEventoCaixaCota;
   CdsConsulta.Data := CtrlCarteiraXEvento.ListCarteiraXEvento;
   if cdsConsulta.IsEmpty then
      bt_Imprime.Enabled  := False
   else
      bt_Imprime.Enabled  := True;
end;

procedure TFrmConsCartXEvento.bbtnConfirmarClick(Sender: TObject);
var iCarteira, iEvento : Integer;
begin
  inherited;
   iCarteira := -1;
   if Trim(dblCarteira.Text) <> '' then
      iCarteira := CdsCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;

   iEvento := 0;
   if Trim(dblEveCxCota.Text) <> '' then
      iEvento := CdsEvento.FieldByName('IDEVENTOCAIXACOTA').AsInteger;

   CdsConsulta.Data := CtrlCarteiraXEvento.ListCarteiraXEvento(0, iCarteira, iEvento,
                                                               CtrlInvestCotas.IIF(rgItens.ItemIndex = 0,'S',''),
                                                               CtrlInvestCotas.IIF(rgItens.ItemIndex = 1,'S',''));
   if cdsConsulta.IsEmpty then
      bt_Imprime.Enabled  := False
   else
      bt_Imprime.Enabled  := True;
end;

procedure TFrmConsCartXEvento.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   dblCarteira.Clear;
   dblEveCxCota.Clear;
   rgItens.ItemIndex := -1;
   CdsConsulta.Close;
   bt_Imprime.Enabled  := False   
end;

procedure TFrmConsCartXEvento.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
   RelCartXEvento.cds.Data := CdsConsulta.Data;

   RelCartXEvento.cdsLogoTipo.Data    := CtrlInvestCotas.ListLogoEmpresa;

   RelCartXEvento.LblEmpresa.Caption  :=  Sistema.NomeEmpresa;

   RelCartXEvento.LblSistema.Caption  := Sistema.NomeModulo + ' ' + Sistema.Versao;

   if not cdsConsulta.IsEmpty then
      TFrmPreview.CreateModalPreview(Application,
                                     RelCartXEvento.rptReport,
                                     RelCartXEvento.rptReport.PrinterSetup.DocumentName);
end;

end.
