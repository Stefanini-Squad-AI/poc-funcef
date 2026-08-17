unit fCadIndicadorXTipoImovelMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCadastroMtImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask,
  wwdbedit, wwdblook,
  uCtrlIndicadorImovel, uCtrlTipoImovel, uMensErro, dBaseDados, uSistema,
  uComunsImobiliario, uVerificaPreenchimento;

type
  TfrmCadIndicadorXTipoImovelMT = class(TfrmCadastroMtImob)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CdsTipoImovel: TCMClientDataSet;
    CdsTipoImovelCODTIPIMOVEL: TStringField;
    CdsTipoImovelDESCTIPOIMOVEL: TStringField;
    CdsIndicador: TCMClientDataSet;
    wwDBLookupCombo1: TwwDBLookupCombo;
    wwDBEdit1: TwwDBEdit;
    wwDBLookupCombo2: TwwDBLookupCombo;
    CdsIndicadorIDINDICADORIMOVEL: TFloatField;
    CdsIndicadorINMDESCRICAO: TStringField;
    CdsCODTIPIMOVEL: TStringField;
    CdsIDINDICADORIMOVEL: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
    CtrlIndicadorImovel: TCtrlIndicadorImovel;
    CtrlTipoImovel: tCtrlTipoImovel;

  public
    { Public declarations }
  end;

var
  frmCadIndicadorXTipoImovelMT: TfrmCadIndicadorXTipoImovelMT;

implementation

{$R *.DFM}

procedure TfrmCadIndicadorXTipoImovelMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlIndicadorImovel := TCtrlIndicadorImovel.Create( Sistema.IdEmpresa,
                                                      Sistema.IdModulo,
                                                      Sistema.IdUsuario,
                                                      Sistema.IdEspAcesso,
                                                      Sistema.UsaPlanoPatro );
  CtrlIndicadorImovel.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);
  CtrlIndicadorImovel.CdsIndicadorXTipoImo := Cds;

  CdsIndicador.Data  := CtrlIndicadorImovel.LookupIndicadorImovel;
  CtrlTipoImovel := tCtrlTipoImovel.Create;
  CtrlTipoImovel.InitializeAs (CtrlIndicadorImovel);
  CdsTipoImovel.Data := CtrlTipoImovel.LookupTipoImovel;
end;

procedure TfrmCadIndicadorXTipoImovelMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlIndicadorImovel);
  FreeAndNil(CtrlTipoImovel);
end;

procedure TfrmCadIndicadorXTipoImovelMT.CmeCadastroFind(Sender: TObject);
var
  iIdIndicadorImovel: integer;
  sCodTipoImovel: string;
begin
  inherited;
  if MontaSelect.RetornouValor then begin
    sCodTipoImovel     := MontaSelect.ValoresChave[0];
    iIdIndicadorImovel := StrToInt(MontaSelect.ValoresChave[1]);
    Cds.Data := CtrlIndicadorImovel.SelecionaIndicadorXTipoImovel(iIdIndicadorImovel,sCodTipoImovel);
  end;
end;

procedure TfrmCadIndicadorXTipoImovelMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlIndicadorImovel.GravaIndicadorXTipoimo;
end;

end.
