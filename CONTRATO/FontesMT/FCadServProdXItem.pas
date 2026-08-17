unit FCadServProdXItem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  wwdblook, CMProcuraMask,uCtrlServProdxItemContr, uCtrlListTercContratos,
  uCtrlServProd, uCtrlItemContratual, uCtrlParamIntegra;

type
  TfrmCadServProdXItem = class(TFrmCadastroMT)
    dbeContaContabil: TCMProcuraMaskContabil;
    Label1: TLabel;
    dblcServProd: TwwDBLookupCombo;
    dbrgRegimePagamento: TDBRadioGroup;
    Label2: TLabel;
    dblcItemContratual: TwwDBLookupCombo;
    Label3: TLabel;
    dblcTipoRecDes: TwwDBLookupCombo;
    lblSubConta: TLabel;
    dblcSubConta: TwwDBLookupCombo;
    cdsTipoRecDes: TCMClientDataSet;
    cdsSubConta: TCMClientDataSet;
    cdsItemContratual: TCMClientDataSet;
    cdsServProd: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlServProdXItemContr : TCtrlServProdxItemContr;
    CtrlProdServ           : TCtrlProdServ.Create;
    CtrlItemContratual     : TCtrlItemContratual;
    CtrlListTerc           : TCtrlListTercContratos;
  public
    { Public declarations }
  end;

var
  frmCadServProdXItem: TfrmCadServProdXItem;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TfrmCadServProdXItem.FormCreate(Sender: TObject);
begin
   inherited;
   //Inicializa Controls
   CtrlServProdXItemContr:=TCtrlServProdxItemContr.Create;
   CtrlServProdXItemContr.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlProdServ:=TCtrlProdServ.Create;
   CtrlProdServ.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlItemContratual:=TCtrlItemContratual.Create;
   CtrlItemContratual.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlListTerc:=TCtrlListTercContratos.Create;
   CtrlListTerc.Initialize(dtmBaseDados.dbBaseDados,True);

   //Carrega Combos
   cdsServProd.Data:=CtrlProdServ.ListProdServ(Sistema.IdEmpresa,0);
   cdsItemContratual.Data:=CtrlItemContratual.ListItemContratual(Sistema.IdEmpresa,0);
   cdsTipoRecDes.Data:=CtrlListTerc.ListTipoRD(Sistema.IdEmpresa,'','A');
   cdsSubConta.Data:=CtrlListTerc.ListSubConta(Sistema.IdEmpresa,0,'');

   dbeContaContabil.Enabled:=ParamIntegra.IntegraContab;
   lblSubConta.Enabled:=ParamIntegra.IntegraContab;
   dblcSubConta.Enabled:=ParamIntegra.IntegraContab;

   if ParamIntegra.IntegraContab then
    begin
       dbeContaContabil.Plano:=ParamIntegra.Plano;
       dbeContaContabil.Mascara:=ParamIntegra.MascaraPlano;
    end;
end;

procedure TfrmCadServProdXItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   CtrlServProdXItemContr.Free;
   CtrlProdServ.Free;
   CtrlItemContratual.Free;
   CtrlListTerc.Free;
end;

end.
