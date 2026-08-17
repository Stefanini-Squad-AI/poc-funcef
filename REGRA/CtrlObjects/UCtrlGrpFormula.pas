unit UCtrlGrpFormula;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDbGrpFormula;

Type
  TCtrlGrpFormula = class(TCmControlObject)
  private
    FCdsGrpFormula: TCMClientDataSet;
    FDbGrpFormula: TDbGrpFormula;
    procedure SetCdsGrpFormula(const Value: TCMClientDataSet);
    procedure SetDbGrpFormula(const Value: TDbGrpFormula);

  protected
    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbGrpFormula : TDbGrpFormula     read FDbGrpFormula  write SetDbGrpFormula;
    property CdsGrpFormula : TCMClientDataSet read FCdsGrpFormula write SetCdsGrpFormula;

    function SelecionaGrpFormula( sCodGrpFormula : String ) : OleVariant;
    function ExisteGrpFormula( sCodGrpFormula : String ) : Boolean;
    function ListaGrpFormula : OleVariant;
    function GravaGrpFormula : Boolean;

  published

end;

implementation

{ TCtrlGrpFormula }

constructor TCtrlGrpFormula.Create;
begin
  inherited;
  FDbGrpFormula  := TDbGrpFormula.Create(Self);
  FCdsGrpFormula := TCMClientDataSet.Create(Nil);
end;

destructor TCtrlGrpFormula.Destroy;
begin
  FDbGrpFormula.Free;
  FCdsGrpFormula.Free;
  inherited;
end;

procedure TCtrlGrpFormula.DoChangeDataBase;
begin
  inherited;
  FDbGrpFormula.DataBaseName := Self.DataBaseName;
end;


function TCtrlGrpFormula.GravaGrpFormula: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarGrpFormula( CdsGrpFormula.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsGrpFormula, DbGrpFormula, [], [] );

      Msg := DbGrpFormula.MessageInfo;

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


procedure TCtrlGrpFormula.SetCdsGrpFormula(const Value: TCMClientDataSet);
begin
  FCdsGrpFormula := Value;
end;

procedure TCtrlGrpFormula.SetDbGrpFormula(const Value: TDbGrpFormula);
begin
  FDbGrpFormula := Value;
end;

function TCtrlGrpFormula.SelecionaGrpFormula( sCodGrpFormula : String): OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.SelecionaGrpFormula( sCodGrpFormula );
  end else begin
    FDbGrpFormula.Codgrupoformula.AsString := sCodGrpFormula;
    Result := GetDataPacket( FDbGrpFormula.SSqlSelect );
  end;
end;

function TCtrlGrpFormula.ExisteGrpFormula( sCodGrpFormula : String ) : Boolean;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ExisteGrpFormula( sCodGrpFormula );
  end else begin
    FDbGrpFormula.Codgrupoformula.AsString := sCodGrpFormula;
    CdsGrpFormula.Data := GetDataPacket( FDbGrpFormula.SSqlSelect );
    Result := Not CdsGrpFormula.IsEmpty;
  end;
end;

function TCtrlGrpFormula.ListaGrpFormula: OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ListaGrupoRegra;
  end else begin
    Result := GetDataPacket( 'SELECT CODGRUPOFORMULA, DESCGRUPOFORMULA  '+
                             'FROM GRPFORMULA ORDER BY DESCGRUPOFORMULA ' );
  end;
end;

end.

