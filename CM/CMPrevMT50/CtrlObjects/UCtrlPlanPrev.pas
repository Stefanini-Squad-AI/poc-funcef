unit UCtrlPlanPrev;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDbPlanPrev;

Type

  TCtrlPlanPrev = class(TCmControlObject)
  private
    FCdsPlanPrev: TCMClientDataSet;
    FDbPlanPrev: TDbPlanPrev;
    procedure SetCdsPlanPrev(const Value: TCMClientDataSet);
    procedure SetDbPlanPrev(const Value: TDbPlanPrev);

  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbPlanPrev  : TDbPlanPrev      read FDbPlanPrev  write SetDbPlanPrev;
    property CdsPlanPrev : TCMClientDataSet read FCdsPlanPrev write SetCdsPlanPrev;

    function ListaPlanPrev : OleVariant;
    function SelecionaPlanPrev( iIdPlanPrev : Integer ) : OleVariant;
    function ExistePlanPrev   ( iIdPlanPrev : Integer ) : Boolean;
    function GravaPlanPrev : Boolean;

  published

end;

implementation

{ TCtrlPlanPrev }

constructor TCtrlPlanPrev.Create;
begin
  inherited;
  FDbPlanPrev  := TDbPlanPrev.Create(Self);
  FCdsPlanPrev := TCMClientDataSet.Create(Nil);
end;

destructor TCtrlPlanPrev.Destroy;
begin
  FDbPlanPrev.Free;
  FCdsPlanPrev.Free;
  inherited;
end;

procedure TCtrlPlanPrev.DoChangeDataBase;
begin
  inherited;
  FDbPlanPrev.DataBaseName := Self.DataBaseName;
end;


function TCtrlPlanPrev.GravaPlanPrev: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarPlanPrev( CdsPlanPrev.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsPlanPrev, DbPlanPrev, [], [] );

      Msg := DbPlanPrev.MessageInfo;

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


procedure TCtrlPlanPrev.SetCdsPlanPrev(const Value: TCMClientDataSet);
begin
  FCdsPlanPrev := Value;
end;

procedure TCtrlPlanPrev.SetDbPlanPrev(const Value: TDbPlanPrev);
begin
  FDbPlanPrev := Value;
end;

function TCtrlPlanPrev.SelecionaPlanPrev( iIdPlanPrev : Integer): OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.SelecionaPlanPrev( iIdPlanPrev );
  end else begin
    FDbPlanPrev.IdPlanoPrev.AsInteger := iIdPlanPrev;
    Result := GetDataPacket( FDbPlanPrev.SSqlSelect );
  end;
end;


function TCtrlPlanPrev.ExistePlanPrev(iIdPlanPrev: Integer): Boolean;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.OutraSelecionaPadrao;
  end else begin
    FDbPlanPrev.IdPlanoPrev.AsInteger := iIdPlanPrev;
    CdsPlanPrev.Data := GetDataPacket( FDbPlanPrev.SSqlSelect );
    Result := Not CdsPlanPrev.IsEmpty;
  end;
end;

function TCtrlPlanPrev.ListaPlanPrev: OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ListaPlanPrev;
  end else begin
    Result := GetDataPacket( 'SELECT IDPLANOPREV, NOME, FLGDTALIMRESERVA FROM PLANPREV ORDER BY NOME' );
  end;
end;

end.

