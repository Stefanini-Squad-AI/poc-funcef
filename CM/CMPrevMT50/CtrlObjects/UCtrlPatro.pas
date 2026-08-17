unit UCtrlPatro;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDbPatro;

Type

  TCtrlPatro = class(TCmControlObject)
  private
    FCdsPatro: TCMClientDataSet;
    FDbPatro: TDbPatro;
    procedure SetCdsPatro(const Value: TCMClientDataSet);
    procedure SetDbPatro(const Value: TDbPatro);

  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbPatro : TDbPatro     read FDbPatro  write SetDbPatro;
    property CdsPatro : TCMClientDataSet read FCdsPatro write SetCdsPatro;

    function ListaPatro : OleVariant;
    function SelecionaPatro( iIdPatro : Integer ) : OleVariant;
    function ExistePatro   ( iIdPatro : Integer ) : Boolean;
    function GravaPatro : Boolean;

  published

end;

implementation

{ TCtrlPatro }

constructor TCtrlPatro.Create;
begin
  inherited;
  FDbPatro  := TDbPatro.Create(Self);
  FCdsPatro := TCMClientDataSet.Create(Nil);
end;

destructor TCtrlPatro.Destroy;
begin
  FDbPatro.Free;
  FCdsPatro.Free;
  inherited;
end;

procedure TCtrlPatro.DoChangeDataBase;
begin
  inherited;
  FDbPatro.DataBaseName := Self.DataBaseName;
end;


function TCtrlPatro.GravaPatro: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarPatro( CdsPatro.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsPatro, DbPatro, [], [] );

      Msg := DbPatro.MessageInfo;

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


procedure TCtrlPatro.SetCdsPatro(const Value: TCMClientDataSet);
begin
  FCdsPatro := Value;
end;

procedure TCtrlPatro.SetDbPatro(const Value: TDbPatro);
begin
  FDbPatro := Value;
end;

function TCtrlPatro.SelecionaPatro( iIdPatro : Integer): OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.SelecionaPatro( iIdPatro );
  end else begin
    FDbPatro.IdPessoa.AsInteger := iIdPatro;
    Result := GetDataPacket( FDbPatro.SSqlSelect );
  end;
end;


function TCtrlPatro.ExistePatro(iIdPatro: Integer): Boolean;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.OutraSelecionaPadrao;
  end else begin
    FDbPatro.IdPessoa.AsInteger := iIdPatro;
    CdsPatro.Data := GetDataPacket( FDbPatro.SSqlSelect );
    Result := Not CdsPatro.IsEmpty;
  end;
end;

function TCtrlPatro.ListaPatro: OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ListaPatro;
  end else begin
    Result := GetDataPacket( 'SELECT PAT.IDPESSOA, PES.NOME '+
                             'FROM PESSOA PES, PATRO PAT '+
                             'WHERE PAT.IDPESSOA = PES.IDPESSOA '+
                             'ORDER BY PES.NOME ' );
  end;
end;

end.

