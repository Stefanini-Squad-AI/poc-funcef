//******************************************************************************
// Atualizado : 19/11/2003 - pendência 15644

unit uCtrlWebInterface;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbWebInterface;

Type
  TCtrlWebInterface = class(TCmControlObject)
  private
    FCdsWebInterface: TCMClientDataSet;
    FDbWebInterface: TDbWebInterface;
    procedure SetCdsWebInterface(const Value: TCMClientDataSet);
    procedure SetDbWebInterface(const Value: TDbWebInterface);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbWebInterface : TDbWebInterface read FDbWebInterface write SetDbWebInterface;
    property CdsWebInterface : TCMClientDataSet read FCdsWebInterface write SetCdsWebInterface;

    function SelecionaWebInterface( iIdWebInterface : integer ) : OleVariant;
    function GravaWebInterface : Boolean;
    function PegaRegistroUnico : integer;
    function SelecionaTodos : OleVariant;

  published

end;

implementation

{ TCtrlWebInterface }


function TCtrlWebInterface.PegaRegistroUnico : integer;
var
  cdsAux : TCmClientDataset;
begin
  cdsAux := TCmClientDataset.Create(nil);

  try
    cdsAux.Data := GetDataPacket(' select IDWEBINTERFACE ' +
                                 ' from   WEBINTERFACE   ' );

    if cdsAux.RecordCount <> 1 then
      Result := -1
    else
      Result := cdsAux.FieldByName('IDWEBINTERFACE').AsInteger;
  finally
    CdsAux.Free;
  end;
end;


procedure TCtrlWebInterface.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbWebInterface.DataBaseName    := DataBaseName
  else
    FDbWebInterface.DbAdoConnection := DbAdoConnection;
end;

constructor TCtrlWebInterface.Create;
begin
  inherited;
  FDbWebInterface  := TDbWebInterface.Create( self );
end;

destructor TCtrlWebInterface.Destroy;
begin
  FDbWebInterface.Free;
  if IsAppServer then FCdsWebInterface.Free;
  inherited;
end;

function TCtrlWebInterface.GravaWebInterface: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarWebInterface( CdsWebInterface.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsWebInterface, FDbWebInterface, [], [] );

      Msg := FDbWebInterface.MessageInfo;

      if not Result then raise Exception.Create( Msg );

      Commit;
   except
      On E : Exception Do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;


procedure TCtrlWebInterface.OnCreateAppServer;
begin
  inherited;
  FCdsWebInterface := TCMClientDataSet.Create( nil );
end;

function TCtrlWebInterface.SelecionaWebInterface( iIdWebInterface : integer ) : OleVariant;
begin
  FDbWebInterface.IdWebInterface.AsInteger := iIdWebInterface;
  Result := GetDataPacket( FDbWebInterface.SSqlSelect );
end;

procedure TCtrlWebInterface.SetCdsWebInterface(
  const Value: TCMClientDataSet);
begin
  FCdsWebInterface := Value;
end;

procedure TCtrlWebInterface.SetDbWebInterface(
  const Value: TDbWebInterface);
begin
  FDbWebInterface := Value;
end;

function TCtrlWebInterface.SelecionaTodos: OleVariant;
begin
  Result := GetDataPacket( ' select   IDWEBINTERFACE,  ' +
                           '          NOMEINTERFACE,   ' +
                           '          ENDLOGIN,        ' +
                           '          EMAIL,           ' +
                           '          TIMEOUT,         ' +
                           '          MENUALTURA,      ' +
                           '          MENULARGURA,     ' +
                           '          MENUTAMFONTE,    ' +
                           '          MENUPOSX,        ' +
                           '          MENUPOSY,        ' +
                           '          MENUDISTANCIA,   ' +
                           '          MENUNOMEFONTE,   ' +
                           '          MENUCORFONTE,    ' +
                           '          MENUCORFONTESEL, ' +
                           '          MENUCORFUNDO,    ' +
                           '          MENUCORFUNDOSEL, ' +
                           '          FLGUSAMENU,      ' +
                           '          FLGUSALAYERS,    ' +
                           '          FLGDEMO,         ' +
                           '          FLGJANELARELAT,  ' +
// 19/11/2003 - pendência 15644
                           '          DIRFISICO        ' +
// fim pendência 15644
                           '   from   WEBINTERFACE     ' +
                           ' order by IDWEBINTERFACE   ' );
end;

end.

