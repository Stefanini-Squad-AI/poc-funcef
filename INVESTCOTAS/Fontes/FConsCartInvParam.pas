unit FConsCartInvParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdblook, Db, DBClient,
  uCMClientDataSet, Grids, Wwdbigrd, Wwdbgrid, uCmSqlParams, uCtrlPadroes,
  uCtrlParamCotaInvest, uCtrlCarteiraInvest, uCtrlInvestCotas,
  uMensErro, uSistema, FPreview;

type
  TFrmConsCartInvParam = class(TfrmOkCancelarRelInv)
    CdsCarteira: TCMClientDataSet;
    PnlFiltro: TPanel;
    DbLcCarteira: TwwDBLookupCombo;
    LblCarteira: TLabel;
    PnlGrid: TPanel;
    CMSqlParams1: TCMSqlParams;
    dsConsulta: TDataSource;
    CdsConsulta: TCMClientDataSet;
    grdConsulta: TwwDBGrid;
    CdsConsultaIDPARAMCOTAINVEST: TFloatField;
    CdsConsultaIDCARTEIRAINVEST: TFloatField;
    CdsConsultaDATAULTFECH: TDateTimeField;
    CdsConsultaDATAINICIAL: TDateTimeField;
    CdsConsultaDATAENCERRAMENTO: TDateTimeField;
    CdsConsultaQTDDECQTD: TFloatField;
    CdsConsultaQTDDECVLR: TFloatField;
    CdsConsultaVLRCOTAINICIAL: TFloatField;
    CdsConsultaMOECODIGO: TFloatField;
    CdsConsultaPERCTXPERFORM: TFloatField;
    CdsConsultaPERCTXADM: TFloatField;
    CdsConsultaDESCCARTINVEST: TStringField;
    CdsConsultaMOEDESC: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlParamCotaInvest : TCtrlParamCotaInvest;
    CtrlCarteiraInvest : TCtrlCarteiraInvest;
    CtrlInvestCotas : TCtrlInvestCotas;
  public
    { Public declarations }
  end;

var
  FrmConsCartInvParam: TFrmConsCartInvParam;

implementation

uses FDMRelCarteiraParam;

{$R *.DFM}

procedure TFrmConsCartInvParam.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlParamCotaInvest := TCtrlParamCotaInvest.Create;
   CtrlParamCotaInvest.InitializeAs(Padroes);
   CtrlParamCotaInvest.cdsParamCotaInvest := CdsConsulta;

   CtrlCarteiraInvest  := TCtrlCarteiraInvest.Create;
   CtrlCarteiraInvest.InitializeAs(Padroes);
   CtrlCarteiraInvest.CdsCarteiraInvest := CdsCarteira;

   CtrlInvestCotas :=  TCtrlInvestCotas.Create;
   CtrlInvestCotas.InitializeAs(Padroes);

end;

procedure TFrmConsCartInvParam.FormShow(Sender: TObject);
begin
  inherited;
   CdsCarteira.Data := CtrlCarteiraInvest.ListCarteiraInvest;
   
   if cdsConsulta.IsEmpty then
      bt_Imprime.Enabled  := False
   else
      bt_Imprime.Enabled  := True;   
end;

procedure TFrmConsCartInvParam.bbtnConfirmarClick(Sender: TObject);
var iCarteira : Integer;
begin
  inherited;
   iCarteira     := -1;
   if Trim(DbLcCarteira.Text) <> '' then
     iCarteira := CdsCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;

   CdsConsulta.Data := CtrlParamCotaInvest.ListParamCotaInvest(-1, iCarteira);

   if cdsConsulta.IsEmpty then
      bt_Imprime.Enabled  := False
   else
      bt_Imprime.Enabled  := True;
end;

procedure TFrmConsCartInvParam.bt_ImprimeClick(Sender: TObject);
begin
  inherited;

   RelCarteiraParam.cds.Data := CdsConsulta.Data;

   RelCarteiraParam.cdsLogoTipo.Data   := CtrlInvestCotas.ListLogoEmpresa;

   RelCarteiraParam.LblEmpresa.Caption :=  Sistema.NomeEmpresa;

   RelCarteiraParam.LblSistema.Caption := Sistema.NomeModulo + ' ' + Sistema.Versao;

   if not cdsConsulta.IsEmpty then
      TFrmPreview.CreateModalPreview(Application,
                                     RelCarteiraParam.rptReport,
                                     RelCarteiraParam.rptReport.PrinterSetup.DocumentName);
end;

procedure TFrmConsCartInvParam.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlParamCotaInvest);
   FreeAndNil(CtrlCarteiraInvest);
   FreeAndNil(CtrlInvestCotas);
end;

procedure TFrmConsCartInvParam.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   DbLcCarteira.Clear;
   CdsConsulta.Close;
   bt_Imprime.Enabled  := False      
end;

end.
