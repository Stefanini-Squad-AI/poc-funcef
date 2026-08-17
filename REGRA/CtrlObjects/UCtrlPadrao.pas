unit UCtrlPadrao;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbXXXX;

Type

  TCtrlXXXX = class(TCmControlObject)
  private
    FCdsXXXX: TCMClientDataSet;
    FDbXXXX: TDbXXXX;
    procedure SetCdsXXXX(const Value: TCMClientDataSet);
    procedure SetDbXXXX(const Value: TDbXXXX);

  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbXXXX : TDbXXXX     read FDbXXXX  write SetDbXXXX;
    property CdsXXXX : TCMClientDataSet read FCdsXXXX write SetCdsXXXX;

    function SelecionaXXXX( iIdXXXX : Integer ) : OleVariant;
    function ExisteXXXX   ( iIdXXXX : Integer ) : Boolean;
    function GravaXXXX : Boolean;
    function ListaXXXX : OleVariant;

  published

end;

implementation

{ TCtrlXXXX }

constructor TCtrlXXXX.Create;
begin
  inherited;
  FDbXXXX  := TDbXXXX.Create(Self);
  FCdsXXXX := TCMClientDataSet.Create(Nil);
end;

destructor TCtrlXXXX.Destroy;
begin
  FDbXXXX.Free;
  FCdsXXXX.Free;
  inherited;
end;

procedure TCtrlXXXX.DoChangeDataBase;
begin
  inherited;
  FDbXXXX.DataBaseName := Self.DataBaseName;
end;


function TCtrlXXXX.GravaXXXX: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarXXXX( CdsXXXX.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsXXXX, DbXXXX, [], [] );

      Msg := DbXXXX.MessageInfo;

      if not Result then raise Exception.Create( Msg );

      Commit;
   except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;


procedure TCtrlXXXX.SetCdsXXXX(const Value: TCMClientDataSet);
begin
  FCdsXXXX := Value;
end;

procedure TCtrlXXXX.SetDbXXXX(const Value: TDbXXXX);
begin
  FDbXXXX := Value;
end;

function TCtrlXXXX.SelecionaXXXX( iIdXXXX : Integer): OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.SelecionaXXXX( iIdXXXX );
  end else begin
    FDbXXXX.IdXXXX.AsInteger := iIdXXXX;
    Result := GetDataPacket( FDbXXXX.SSqlSelect );
  end;
end;


function TCtrlXXXX.ExisteXXXX(iIdXXXX: Integer): Boolean;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.OutraSelecionaPadrao;
  end else begin
    FDbXXXX.IdXXXX.AsInteger := iIdXXXX;
    CdsXXXX.Data := GetDataPacket( FDbXXXX.SSqlSelect );
    Result := Not CdsXXXX.IsEmpty;
  end;
end;

function TCtrlXXXX.ListaXXXX: OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ListaXXXX;
  end else begin
    Result := GetDataPacket( 'SELECT * FROM XXXX ORDER BY DESCRICAO' );
  end;
end;

end.

