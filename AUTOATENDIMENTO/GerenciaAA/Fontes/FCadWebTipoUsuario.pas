unit FCadWebTipoUsuario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, Mask, DBCtrls, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCtrlWebTipoUsuario, uCmTypes, dBaseDados, uSistema, wwdbedit;

type
  TfrmCadWebTipoUsuario = class(TFrmCadastroMT)
    lblDesc: TLabel;
    dbedtDescTipoUsuario: TDBEdit;
    CdsIDTIPOUSUARIO: TFloatField;
    CdsDESCTIPOUSUARIO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
  private
    WebTipoUsuario : TCtrlWebTipoUsuario;

    procedure MsgErro ( sMsg : String );
    function Salva : boolean;
  public
    { Public declarations }
  end;

var
  frmCadWebTipoUsuario: TfrmCadWebTipoUsuario;

implementation

{$R *.DFM}

procedure TfrmCadWebTipoUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  WebTipoUsuario := TCtrlWebTipoUsuario.Create;
  WebTipoUsuario.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  WebTipoUsuario.CdsWebTipoUsuario := Cds;
  Cds.CreateDataSet;
end;

procedure TfrmCadWebTipoUsuario.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmCadWebTipoUsuario.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
    Cds.Data := WebTipoUsuario.SelecionaWebTipoUsuario( StrToInt( MontaSelect.ValoresChave[0] ) );
end;

procedure TfrmCadWebTipoUsuario.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.Close;
  Cds.CreateDataSet;
end;

procedure TfrmCadWebTipoUsuario.FormDestroy(Sender: TObject);
begin
  WebTipoUsuario.Free;
  inherited;
end;

function TfrmCadWebTipoUsuario.Salva: boolean;
begin
  Result := WebTipoUsuario.GravaWebTipoUsuario;
end;

procedure TfrmCadWebTipoUsuario.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Salva;
end;

procedure TfrmCadWebTipoUsuario.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Salva;
end;

procedure TfrmCadWebTipoUsuario.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Salva;
end;

end.
