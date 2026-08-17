unit UCtrlProvDesc;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDbProvDesc;

Type

  TCtrlProvDesc = class(TCmControlObject)
  private
    FCdsProvDesc: TCMClientDataSet;
    FDbProvDesc: TDbProvDesc;
    procedure SetCdsProvDesc(const Value: TCMClientDataSet);
    procedure SetDbProvDesc(const Value: TDbProvDesc);

  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbProvDesc : TDbProvDesc     read FDbProvDesc  write SetDbProvDesc;
    property CdsProvDesc : TCMClientDataSet read FCdsProvDesc write SetCdsProvDesc;

    function ListaProvDesc : OleVariant;
    function SelecionaProvDesc( iIdProvDesc : Integer ) : OleVariant;
    function ExisteProvDesc   ( iIdProvDesc : Integer ) : Boolean;
    function GravaProvDesc : Boolean;

  published

end;

implementation

{ TCtrlProvDesc }

constructor TCtrlProvDesc.Create;
begin
  inherited;
  FDbProvDesc  := TDbProvDesc.Create(Self);
  FCdsProvDesc := TCMClientDataSet.Create(Nil);
end;

destructor TCtrlProvDesc.Destroy;
begin
  FDbProvDesc.Free;
  FCdsProvDesc.Free;
  inherited;
end;

procedure TCtrlProvDesc.DoChangeDataBase;
begin
  inherited;
  FDbProvDesc.DataBaseName := Self.DataBaseName;
end;


function TCtrlProvDesc.GravaProvDesc: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarProvDesc( CdsProvDesc.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsProvDesc, DbProvDesc, [], [] );

      Msg := DbProvDesc.MessageInfo;

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


procedure TCtrlProvDesc.SetCdsProvDesc(const Value: TCMClientDataSet);
begin
  FCdsProvDesc := Value;
end;

procedure TCtrlProvDesc.SetDbProvDesc(const Value: TDbProvDesc);
begin
  FDbProvDesc := Value;
end;

function TCtrlProvDesc.SelecionaProvDesc( iIdProvDesc : Integer): OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.SelecionaProvDesc( iIdProvDesc );
  end else begin
    FDbProvDesc.IdProvento.AsInteger := iIdProvDesc;
    Result := GetDataPacket( FDbProvDesc.SSqlSelect );
  end;
end;


function TCtrlProvDesc.ExisteProvDesc(iIdProvDesc: Integer): Boolean;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.OutraSelecionaPadrao;
  end else begin
    FDbProvDesc.IdProvento.AsInteger := iIdProvDesc;
    CdsProvDesc.Data := GetDataPacket( FDbProvDesc.SSqlSelect );
    Result := Not CdsProvDesc.IsEmpty;
  end;
end;

function TCtrlProvDesc.ListaProvDesc: OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ListaProvDesc;
  end else begin
    Result := GetDataPacket( 'SELECT IDPROVENTO, DESCRICAO FROM PROVDESC ORDER BY DESCRICAO ' );
  end;
end;

end.

