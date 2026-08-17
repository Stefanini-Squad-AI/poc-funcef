unit UCtrlReservaXContrib;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDBReservaXContrib, uFuncoesPrevMT50;

Type

  TCtrlReservaXContrib = class(TCmControlObject)
  private
    FCdsReservaXContrib: TCMClientDataSet;
    FDbReservaXContrib: TDbReservaXContrib;
    FIdPlanoPrev: Integer;
    FIdTipoReserva: Integer;
    FIdContribuicao: Integer;
    procedure SetCdsReservaXContrib(const Value: TCMClientDataSet);
    procedure SetDbReservaXContrib(const Value: TDbReservaXContrib);
    procedure SetIdTipoReserva(const Value: Integer);
    procedure SetIdPlanoPrev(const Value: Integer);
    procedure SetIdContribuicao(const Value: Integer);

  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbReservaXContrib  : TDbReservaXContrib read FDbReservaXContrib  write SetDbReservaXContrib;
    property CdsReservaXContrib : TCMClientDataSet   read FCdsReservaXContrib write SetCdsReservaXContrib;
    property IdPlanoPrev      : Integer              read FIdPlanoPrev        write SetIdPlanoPrev;
    property IdTipoReserva    : Integer              read FIdTipoReserva      write SetIdTipoReserva;
    property IdContribuicao   : Integer              read FIdContribuicao     write SetIdContribuicao;

    function ExisteReservaXContrib : Boolean;
    function SelecionaReservaXContrib: OleVariant;
    function GravaReservaXContrib : Boolean;

  published

end;

implementation

{ TCtrlReservaXContrib }

constructor TCtrlReservaXContrib.Create;
begin
  inherited;
  FDbReservaXContrib  := TDbReservaXContrib.Create(Self);
  FCdsReservaXContrib := TCMClientDataSet.Create(Nil);

  FIdTipoReserva    := -1;
  FIdPlanoPrev      := -1;
end;

destructor TCtrlReservaXContrib.Destroy;
begin
  FDbReservaXContrib.Free;
  FCdsReservaXContrib.Free;
  inherited;
end;

procedure TCtrlReservaXContrib.DoChangeDataBase;
begin
  inherited;
  FDbReservaXContrib.DataBaseName := Self.DataBaseName;
end;


function TCtrlReservaXContrib.GravaReservaXContrib: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarReservaXContrib( CdsReservaXContrib.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsReservaXContrib, DbReservaXContrib, [], [] );

      Msg := DbReservaXContrib.MessageInfo;

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


procedure TCtrlReservaXContrib.SetCdsReservaXContrib(const Value: TCMClientDataSet);
begin
  FCdsReservaXContrib := Value;
end;

procedure TCtrlReservaXContrib.SetDbReservaXContrib(const Value: TDbReservaXContrib);
begin
  FDbReservaXContrib := Value;
end;

procedure TCtrlReservaXContrib.SetIdTipoReserva(const Value: Integer);
begin
  FIdTipoReserva := Value;
end;

procedure TCtrlReservaXContrib.SetIdPlanoPrev(const Value: Integer);
begin
  FIdPlanoPrev := Value;
end;

procedure TCtrlReservaXContrib.SetIdContribuicao(const Value: Integer);
begin
  FIdContribuicao := Value;
end;


function TCtrlReservaXContrib.SelecionaReservaXContrib: OleVariant;
Var
  sSql,
  sSql1 : String;
begin
  sSql := 'SELECT '+#13+
          '  IDTIPORESERVA, IDPLANOPREV, IDCONTRIBUICAO, IDREGRACALCULORE, ' +#13+
          '  PERCENTUAL, IDRGVLRMAXRATEIO, VALORMAXIMORATEIO, ANOMESREFRATEIO, '+#13+
          '  TRGDTINCLUSAO, TRGUSERINCLUSAO '+#13+
          'FROM '+
          '  RESERVAXCONTRIB '+#13;

  sSql1 := '';

  If FIdPlanoPrev     >   0 Then sSql1 := sSql1 + ' IDPLANOPREV    = '+IntToStr(FIdPlanoPrev)     +' AND';
  If FIdTipoReserva   >   0 Then sSql1 := sSql1 + ' IDTIPORESERVA  = '+IntToStr(FIdTipoReserva)   +' AND';
  If FIdContribuicao  >   0 Then sSql1 := sSql1 + ' IDCONTRIBUICAO = '+IntToStr(FIdContribuicao)  +' AND';

  If Trim(sSql1) <> '' Then
  Begin
    sSql := sSql + 'WHERE' + Copy(sSql1, 1, Length(sSql1)-4)
  End;

  Result := GetDataPacket( sSql );
end;


function TCtrlReservaXContrib.ExisteReservaXContrib : Boolean;
begin
  If ConnectionSide = cnsclient Then Begin
    Result := Connection.AppServer.ExisteReservaXContrib;
  End
  Else
  Begin
    If FIdTipoReserva > 0 Then FDbReservaXContrib.IdTipoReserva.AsInteger := FIdTipoReserva;
    If FIdPlanoPrev   > 0 Then FDbReservaXContrib.Idplanoprev.AsInteger   := FIdPlanoPrev;

    CdsReservaXContrib.Data := GetDataPacket( FDbReservaXContrib.SSqlSelect );
    Result := Not CdsReservaXContrib.IsEmpty;
  End;
end;

end.

