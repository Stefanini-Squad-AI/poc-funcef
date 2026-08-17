unit FConsultaContrOrigMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid,
  TREdit, Mask, wwdbedit, DBCtrls, ComCtrls, MontaSelect,
  uCtrlContratos, uCtrlServProdxItemContr, uCtrlAditamento, DBClient,
  uCMClientDataSet, uCmSqlParams;

type
  TfrmConsultaContrOrigMT = class(TfrmSairAjuda)
    Panel1: TPanel;
    Splitter1: TSplitter;
    pgcDetContratos: TPageControl;
    tsServProd: TTabSheet;
    dbgObjxItem: TwwDBGrid;
    tsRateio: TTabSheet;
    dbgRateio: TwwDBGrid;
    tsAditamento: TTabSheet;
    dbgAditamento: TwwDBGrid;
    dsContratoOrig: TwwDataSource;
    dsServProdXItemr: TwwDataSource;
    dsRateioXCC: TwwDataSource;
    dsAditamento: TwwDataSource;
    pgcContratos: TPageControl;
    tsDescricao: TTabSheet;
    dbmDescricaoContrato: TDBMemo;
    tsDadosContr: TTabSheet;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label22: TLabel;
    dbDataAssinatura: TwwDBEdit;
    dbDataBase: TwwDBEdit;
    dbDataPrevista: TwwDBEdit;
    dbDataEncerramento: TwwDBEdit;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    dbMoeda: TwwDBEdit;
    DBValorBaseContrato: TDBRealEdit;
    GroupBox3: TGroupBox;
    Label12: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    dbPrazoDen: TwwDBEdit;
    dbAviso: TwwDBEdit;
    GroupBox5: TGroupBox;
    dbReservOrc: TwwDBEdit;
    tsContraparte: TTabSheet;
    Label3: TLabel;
    lblCodForCli: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbContraparte: TwwDBEdit;
    dbCodNoForCli: TwwDBEdit;
    dbContato: TwwDBEdit;
    dbTelContato: TwwDBEdit;
    tsEnderecos: TTabSheet;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    dbCorrespondencia: TwwDBEdit;
    dbEntrega: TwwDBEdit;
    dbCobranca: TwwDBEdit;
    tsIntegracao: TTabSheet;
    Label28: TLabel;
    Label14: TLabel;
    Label26: TLabel;
    Label24: TLabel;
    dbAtivProj: TwwDBEdit;
    dbRespons: TwwDBEdit;
    dbCentroRespon: TwwDBEdit;
    dbTipoDoc: TwwDBEdit;
    tbObservacao: TTabSheet;
    dbmObservacao: TDBMemo;
    tsRenovacao: TTabSheet;
    dbmRenovacao: TDBMemo;
    MSContrato: TMontaSelect;
    cdsAditamento: TCMClientDataSet;
    cdsRateioXCC: TCMClientDataSet;
    cdsServProdXItem: TCMClientDataSet;
    cdsContratoOrig: TCMClientDataSet;
    BtnConsulta: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    spTeste: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure BtnConsultaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsServProdXItemAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    CtrlContratos           : TCtrlContratos;
    CtrlServProdxItemContr  : TCtrlServProdxItemContr;
    CtrlAditamentos         : TCtrlAditamento;
  public
    { Public declarations }
  end;

var
  frmConsultaContrOrigMT: TfrmConsultaContrOrigMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TfrmConsultaContrOrigMT.FormCreate(Sender: TObject);
begin
   inherited;
   MSContrato.Filtro.Add('IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
                         'WHERE (IDUSUARIO = '+FloatToStr(Sistema.IDUsuario)+')) ');

   //Inicializa Controls
   CtrlContratos:=TCtrlContratos.Create(Sistema.IdEmpresa,Sistema.IdUsuario);
   CtrlContratos.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlServProdxItemContr:=TCtrlServProdxItemContr.Create;
   CtrlServProdxItemContr.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlAditamentos:=TCtrlAditamento.Create;
   CtrlAditamentos.Initialize(dtmBaseDados.dbBaseDados,True);

   //Carrega cds's
   cdsContratoOrig.Data:=CtrlContratos.ListContratoOrig(-1); //vazio
   cdsServProdXItem.Data:=CtrlServProdxItemContr.ListProdServXItemContrOrig(-1); //vazio
   cdsRateioXCC.Data:=CtrlServProdxItemContr.ListRateio(-1,-1,-1,-1,False); //vazio
   cdsAditamento.Data:=CtrlAditamentos.ListAditamento(-1,-1); //vazio

   pgcContratos.ActivePageIndex:=0;
   pgcDetContratos.ActivePageIndex:=0;
end;

procedure TfrmConsultaContrOrigMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CtrlContratos.Free;
   CtrlServProdxItemContr.Free;
   CtrlAditamentos.Free;
   inherited;
end;

procedure TfrmConsultaContrOrigMT.BtnConsultaClick(Sender: TObject);
begin
   inherited;
   MSContrato.Executar;
   if (MSContrato.RetornouValor) then
    begin
       //Carrega cds's
       cdsContratoOrig.Close;
       cdsContratoOrig.Data:=CtrlContratos.ListContratoOrig(StrToFloat(MSContrato.ValoresChave[0]));

       cdsServProdXItem.Close;
       cdsServProdXItem.Data:=CtrlServProdxItemContr.ListProdServXItemContrOrig(
                                  StrToFloat(MSContrato.ValoresChave[0]));
       cdsRateioXCC.Close;
       cdsRateioXCC.Data:=CtrlServProdxItemContr.ListRateio(
                               StrToFloat(MSContrato.ValoresChave[0]),0,0,Sistema.IdEmpresa,False);
       cdsAditamento.Close;
       cdsAditamento.Data:=CtrlAditamentos.ListAditamento(0,StrToFloat(MSContrato.ValoresChave[0]));
    end;
end;

procedure TfrmConsultaContrOrigMT.cdsServProdXItemAfterScroll(
  DataSet: TDataSet);
begin
   inherited;
   if not(cdsRateioXCC.Active) then Exit;

   cdsRateioXCC.Filtered:=False;
   cdsRateioXCC.Filter:='IDOBJETO = '+ FloatToStr(cdsServProdXItem.FieldByName('IDOBJETO').AsFloat)+
                        ' AND '+
                        'IDITEM = '+ FloatToStr(cdsServProdXItem.FieldByName('IDITEM').AsFloat);
   cdsRateioXCC.Filtered:=True;
end;

end.
