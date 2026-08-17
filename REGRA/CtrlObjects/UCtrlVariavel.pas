unit UCtrlVariavel;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDbCMPBD;

Type

  TCtrlVariavel = class(TCmControlObject)
  private
    FCdsVariavel: TCMClientDataSet;
    FDbVariavel: TDbCMPBD;
    procedure SetCdsVariavel(const Value: TCMClientDataSet);
    procedure SetDbVariavel(const Value: TDbCMPBD);

  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbVariavel : TDbCMPBD     read FDbVariavel  write SetDbVariavel;
    property CdsVariavel : TCMClientDataSet read FCdsVariavel write SetCdsVariavel;

    function SelecionaVariavel( sCodVariavel : String ) : OleVariant;
    function ExisteVariavel   ( sCodVariavel : String ) : Boolean;
    function ListaVariavel : OleVariant;
    function GravaVariavel : Boolean;

  published

end;

implementation

{ TCtrlVariavel }

constructor TCtrlVariavel.Create;
begin
  inherited;
  FDbVariavel  := TDbCMPBD.Create(Self);
  FCdsVariavel := TCMClientDataSet.Create(Nil);
end;

destructor TCtrlVariavel.Destroy;
begin
  FDbVariavel.Free;
  FCdsVariavel.Free;
  inherited;
end;

procedure TCtrlVariavel.DoChangeDataBase;
begin
  inherited;
  FDbVariavel.DataBaseName := Self.DataBaseName;
end;


function TCtrlVariavel.GravaVariavel: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarVariavel( CdsVariavel.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsVariavel, DbVariavel, [], [] );

      Msg := DbVariavel.MessageInfo;

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


procedure TCtrlVariavel.SetCdsVariavel(const Value: TCMClientDataSet);
begin
  FCdsVariavel := Value;
end;

procedure TCtrlVariavel.SetDbVariavel(const Value: TDbCMPBD);
begin
  FDbVariavel := Value;
end;

function TCtrlVariavel.SelecionaVariavel( sCodVariavel : String): OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.SelecionaVariavel( sCodVariavel );
  end else begin
    FDbVariavel.IdCampo.AsString := sCodVariavel;
    Result := GetDataPacket( FDbVariavel.SSqlSelect );
  end;
end;


function TCtrlVariavel.ExisteVariavel(sCodVariavel: String): Boolean;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ExisteVariavel( sCodVariavel )
  end else begin
    FDbVariavel.IdCampo.AsString := sCodVariavel;
    CdsVariavel.Data := GetDataPacket( FDbVariavel.SSqlSelect );
    Result := Not CdsVariavel.IsEmpty;
  end;
end;

function TCtrlVariavel.ListaVariavel: OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ListaVariavel;
  end else begin
    Result := GetDataPacket( 'SELECT IDCAMPO, DESCRICAODOCAMPO '+
                             'FROM CMPBD '+
                             'WHERE CAMPODOBANCO = 0 '+
                             'ORDER BY IDCAMPO' );
  end;

end;

end.

