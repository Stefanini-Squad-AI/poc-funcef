unit fCadOutroDadoXTipoImovelMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMTImob, Db, MontaSelect, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, wwdblook,
  Mask, wwdbedit, uMensErro, dBaseDados, uSistema, FCadastroMT,
  uComunsImobiliario, uVerificaPreenchimento, uCtrlOutroDado, uCtrlTipoImovel;

type
  TfrmCadOutroDadoXTipoImovelMT = class(TfrmCadastroMtImob)
    CdsCODTIPIMOVEL: TStringField;
    CdsIDOUTRODADO: TFloatField;
    wwDBLookupCombo1: TwwDBLookupCombo;
    wwDBLookupCombo2: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    CdsTipoImovel: TCMClientDataSet;
    CdsOutroDado: TCMClientDataSet;
    CdsTipoImovelCODTIPIMOVEL: TStringField;
    CdsTipoImovelDESCTIPOIMOVEL: TStringField;
    CdsOutroDadoIDOUTRODADO: TFloatField;
    CdsOutroDadoODODESCRICAO: TStringField;
    wwDBEdit1: TwwDBEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
    CtrlOutroDado: TCtrlOutroDado;
    CtrlTipoImovel: tCtrlTipoImovel;

  public
    { Public declarations }
  end;

var
  frmCadOutroDadoXTipoImovelMT: TfrmCadOutroDadoXTipoImovelMT;

implementation

{$R *.DFM}

{ TfrmCadOutroDadoXTipoImovelMT }

procedure TfrmCadOutroDadoXTipoImovelMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlOutroDado := TCtrlOutroDado.Create;
  CtrlOutroDado.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  CtrlOutroDado.CdsOutroDadoXTipoImo := Cds;

  CdsOutroDado.Data  := CtrlOutroDado.LookupOutroDado;
  CtrlTipoImovel := tCtrlTipoImovel.Create;
  CtrlTipoImovel.InitializeAs (CtrlOutroDado);
  CdsTipoImovel.Data := CtrlTipoImovel.LookupTipoImovel;
end;

procedure TfrmCadOutroDadoXTipoImovelMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil( CtrlOutroDado );
  FreeAndNil( CtrlTipoImovel );
end;

procedure TfrmCadOutroDadoXTipoImovelMT.CmeCadastroFind(Sender: TObject);
var
  iIdOutroDado: integer;
  sCodTipoImovel: string;
begin
  inherited;
  if MontaSelect.RetornouValor then begin
    sCodTipoImovel := MontaSelect.ValoresChave[0];
    iIdOutroDado   := StrToInt(MontaSelect.ValoresChave[1]);
    Cds.Data := CtrlOutroDado.SelecionaOutroDadoXTipoImo(iIdOutroDado,sCodTipoImovel);
  end;
end;

procedure TfrmCadOutroDadoXTipoImovelMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlOutroDado.GravaOutroDadoXTipoImo;
end;

end.
