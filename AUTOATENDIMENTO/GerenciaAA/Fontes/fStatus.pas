unit fStatus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBCtrls, Db, DBClient, uCMClientDataSet,
  uCtrlWebInterface, uCtrlWebSessao, uSistema, dBaseDados;

type
  TfrmStatus = class(TfrmOkCancelar)
    cdsInterface: TCMClientDataSet;
    cdsInterfaceIDWEBINTERFACE: TFloatField;
    cdsInterfaceNOMEINTERFACE: TStringField;
    cdsInterfaceENDLOGIN: TStringField;
    cdsInterfaceEMAIL: TStringField;
    cdsInterfaceTIMEOUT: TFloatField;
    cdsInterfaceMENUALTURA: TFloatField;
    cdsInterfaceMENULARGURA: TFloatField;
    cdsInterfaceMENUTAMFONTE: TFloatField;
    cdsInterfaceMENUPOSX: TFloatField;
    cdsInterfaceMENUPOSY: TFloatField;
    cdsInterfaceMENUDISTANCIA: TFloatField;
    cdsInterfaceMENUNOMEFONTE: TStringField;
    cdsInterfaceMENUCORFONTE: TStringField;
    cdsInterfaceMENUCORFONTESEL: TStringField;
    cdsInterfaceMENUCORFUNDO: TStringField;
    cdsInterfaceMENUCORFUNDOSEL: TStringField;
    cdsInterfaceFLGUSAMENU: TStringField;
    cdsInterfaceFLGUSALAYERS: TStringField;
    cdsInterfaceFLGDEMO: TStringField;
    cdsInterfaceFLGJANELARELAT: TStringField;
    lblInterface: TLabel;
    dblkpInterface: TDBLookupComboBox;
    Bevel1: TBevel;
    dtsInterface: TDataSource;
    lblTxQtde: TLabel;
    lblTxUltAcesso: TLabel;
    lblQtde: TLabel;
    lblUltAcesso: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dblkpInterfaceClick(Sender: TObject);
  private
    WebInterface : TCtrlWebInterface;
    WebSessao : TCtrlWebSessao;
  public
    procedure MsgErro ( sMsg : String );
  end;

var
  frmStatus: TfrmStatus;

implementation

{$R *.DFM}

procedure TfrmStatus.FormCreate(Sender: TObject);
begin
  inherited;
  WebInterface := TCtrlWebInterface.Create;
  WebInterface.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  WebSessao := TCtrlWebSessao.Create;
  WebSessao.InitializeAs( WebInterface );

  cdsInterface.Data := WebInterface.SelecionaTodos;
end;

procedure TfrmStatus.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmStatus.FormDestroy(Sender: TObject);
begin
  inherited;
  WebInterface.Free;
  WebSessao.Free;
end;

procedure TfrmStatus.dblkpInterfaceClick(Sender: TObject);
var
  iQtde : integer;
  dUltAcesso  : TDateTime;
begin
  inherited;
  WebSessao.StatusSistema( StrToInt( dblkpInterface.KeyValue ), iQtde, dUltAcesso );

  if iQtde > -1 then
    lblQtde.Caption := IntToStr( iQtde )
  else
    lblQtde.Caption := 'Impossível determinar.';

  if dUltAcesso > 0 then
    lblUltAcesso.Caption := FormatDateTime( 'dd/mm/yyyy hh:nn:ss', dUltAcesso )
  else
    lblUltAcesso.Caption := 'Não houve acesso.';
end;

end.
