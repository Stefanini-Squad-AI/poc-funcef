unit fCadAlteradorXTipoImovelMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCadastroMtImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  wwdblook, Mask, wwdbedit,
  uCtrlTipoImovel, uCtrlTipoAlterador, uMensErro, dBaseDados, uSistema,
  Provider, DBTables, Wwquery, uComunsImobiliario, uVerificaPreenchimento, DBCtrls;

type
  TfrmCadAlteradorXTipoImovelMT = class(TfrmCadastroMtImob)
    CdsTipoImovel: TCMClientDataSet;
    CdsTipoImovelCODTIPIMOVEL: TStringField;
    CdsTipoImovelDESCTIPOIMOVEL: TStringField;
    Label3: TLabel;
    wwDBEdit1: TwwDBEdit;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    CdsAlterador: TCMClientDataSet;
    CdsAlteradorDESCRICAO: TStringField;
    CdsAlteradorCODALTERADOR: TFloatField;
    CdsAlteradorRECPAG: TStringField;
    CdsAlteradorACRESDECRES: TStringField;
    CdsAlteradorIDPESSOA: TFloatField;
    DBcboAlterador: TwwDBLookupCombo;
    wwQuery1: TwwQuery;
    DataSetProvider1: TDataSetProvider;
    CdsCODALTERADOR: TFloatField;
    CdsCODTIPIMOVEL: TStringField;
    DBRadioGroup1: TDBRadioGroup;
    CdsDESCRICAO: TStringField;
    CdsACRESDECRES: TStringField;
    CdsRECPAG: TStringField;
    dsAlterador: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
    CtrlTipoAlterador: TCtrlTipoalterador;
    CtrlTipoImovel: tCtrlTipoImovel;

  public
    { Public declarations }
  end;

var
  frmCadAlteradorXTipoImovelMT: TfrmCadAlteradorXTipoImovelMT;

implementation

{$R *.DFM}

{ TfrmCadAlteradorXTipoImovelMT }

procedure TfrmCadAlteradorXTipoImovelMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipoImovel := tCtrlTipoImovel.Create;
  CtrlTipoImovel.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  CtrlTipoImovel.CdsAlteradorXTipoImo := Cds;
  CdsTipoImovel.Data  := CtrlTipoImovel.LookupTipoImovel;

  CtrlTipoAlterador := TCtrlTipoalterador.Create;
  CtrlTipoAlterador.InitializeAs(CtrlTipoImovel);
  CdsAlterador.Data := CtrlTipoAlterador.ListTipoalterador(Sistema.IdEmpresa);
end;

procedure TfrmCadAlteradorXTipoImovelMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlTipoImovel);
  FreeAndNil(CtrlTipoAlterador);
end;

procedure TfrmCadAlteradorXTipoImovelMT.CmeCadastroFind(Sender: TObject);
var
  iCodAlterador: integer;
  sCodTipoImovel: string;
begin
  inherited;
  if MontaSelect.RetornouValor then begin
    sCodTipoImovel := MontaSelect.ValoresChave[0];
    iCodAlterador  := StrToInt(MontaSelect.ValoresChave[1]);
    Cds.Data := CtrlTipoImovel.LookupAlteradoXTipoImo (Sistema.IdEmpresa, iCodAlterador, sCodTipoImovel);
  end;
end;

procedure TfrmCadAlteradorXTipoImovelMT.CmeCadastroApplyInsert(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlTipoImovel.GravaAlteradorXTipoImo;
end;

end.
