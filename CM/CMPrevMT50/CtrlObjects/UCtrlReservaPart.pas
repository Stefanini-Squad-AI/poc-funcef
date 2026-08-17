unit UCtrlReservaPart;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDBReservaPart, uFuncoesPrevMT50;

Type

  TCtrlReservaPart = class(TCmControlObject)
  private
    FCdsReservaPart: TCMClientDataSet;
    FDbReservaPart: TDbReservaPart;
    FIdPlanoPrev: Integer;
    FIdPessjur: Integer;
    FIdTipoReserva: Integer;
    FIdPessoa: Integer;
    FSeqProposta: Integer;
    FIdParticipante: Integer;
    procedure SetCdsReservaPart(const Value: TCMClientDataSet);
    procedure SetDbReservaPart(const Value: TDbReservaPart);
    procedure SetIdPlanoPrev(const Value: Integer);
    procedure SetIdParticipante(const Value: Integer);
    procedure SetIdPessjur(const Value: Integer);
    procedure SetIdPessoa(const Value: Integer);
    procedure SetIdTiporeserva(const Value: Integer);
    procedure SetSeqProposta(const Value: Integer);

  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbReservaPart  : TDbReservaPart   read FDbReservaPart    write SetDbReservaPart;
    property CdsReservaPart : TCMClientDataSet read FCdsReservaPart   write SetCdsReservaPart;
    property IdPessoa       : Integer          read FIdPessoa         write SetIdPessoa;
    property IdPessjur      : Integer          read FIdPessjur        write SetIdPessjur;
    property IdPlanoPrev    : Integer          read FIdPlanoPrev      write SetIdPlanoPrev;
    property IdTipoReserva  : Integer          read FIdTipoReserva    write SetIdTiporeserva;
    property SeqProposta    : Integer          read FSeqProposta      write SetSeqProposta;
    property IdParticipante : Integer          read FIdParticipante   write SetIdParticipante;

    function SelecionaReservaPart : OleVariant;
    function ExisteReservaPart    : Boolean;

    function GravaReservaPart     : Boolean;

  published

end;

implementation

{ TCtrlReservaPart }

constructor TCtrlReservaPart.Create;
begin
  inherited;
  FDbReservaPart     := TDbReservaPart.Create(Self);
  FCdsReservaPart    := TCMClientDataSet.Create(Nil);

  FIdPessoa       := -1;
  FIdPessjur      := -1;
  FIdPlanoPrev    := -1;
  FIdTipoReserva  := -1;
  FSeqProposta    := -1;
  FIdParticipante := -1;
end;

destructor TCtrlReservaPart.Destroy;
begin
  FDbReservaPart.Free;
  FCdsReservaPart.Free;
  inherited;
end;

procedure TCtrlReservaPart.DoChangeDataBase;
begin
  inherited;
  FDbReservaPart.DataBaseName := Self.DataBaseName;
end;


function TCtrlReservaPart.GravaReservaPart: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarReservaPart( CdsReservaPart.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsReservaPart, DbReservaPart, [], [] );

      Msg := DbReservaPart.MessageInfo;

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


procedure TCtrlReservaPart.SetCdsReservaPart(const Value: TCMClientDataSet);
begin
  FCdsReservaPart := Value;
end;

procedure TCtrlReservaPart.SetDbReservaPart(const Value: TDbReservaPart);
begin
  FDbReservaPart := Value;
end;

procedure TCtrlReservaPart.SetIdPlanoPrev(const Value: Integer);
begin
  FIdPlanoPrev := Value;
end;

procedure TCtrlReservaPart.SetIdParticipante(const Value: Integer);
begin
  FIdParticipante := Value;
end;

procedure TCtrlReservaPart.SetIdPessjur(const Value: Integer);
begin
  FIdPessjur := Value;
end;

procedure TCtrlReservaPart.SetIdPessoa(const Value: Integer);
begin
  FIdPessoa := Value;
end;

procedure TCtrlReservaPart.SetIdTiporeserva(const Value: Integer);
begin
  FIdTipoReserva := Value;
end;

procedure TCtrlReservaPart.SetSeqProposta(const Value: Integer);
begin
  FSeqProposta := Value;
end;


function TCtrlReservaPart.SelecionaReservaPart: OleVariant;
Var
  sSql,
  sSql1 : String;
begin
  sSql := 'SELECT '+#13+
          '  IDTIPORESERVA, IDPLANOPREV, IDPESSOA, IDPESSJUR, DATAREFERENCIASA, '+#13+
          '  SEQPROPOSTA, CODDOCUMENTOPREV, VALORRESERVA, PLNCODIGOPREV, PERCENTUALSAQUE, '+#13+
          '  CODPORTFORMA, CODCENTRORESPON, IDEMPRESAPROP, CODSUBCONTA, UNIDNEGOC, CODCENTROCUSTOD, '+#13+
          '  IDEMPRESA, CODCENTROCUSTOC, PLACONTAD, PLANO, PLACONTAC, PLNCODIGOEFET, CODDOCUMENTOEFET, '+#13+
          '  FLGATIVO, DATADESATIV, FLGINCONSISTENCIA, TRGDTINCLUSAO, TRGUSERINCLUSAO, DATAULTALIM, '+#13+
          '  DATAULTATUALIZA, IDPARTICIPANTE '+#13+
          'FROM RESERVAPART '+#13;

  sSql1 := '';

  If FIdPessjur         >  0 Then sSql1 := sSql1 + ' IDPESSJUR         = '+ IntToStr(FIdPessjur)      +' AND';
  If FIdPessoa          >  0 Then sSql1 := sSql1 + ' IDPESSOA          = '+ IntToStr(FIdPessoa)       +' AND';
  If FIdPlanoPrev       >  0 Then sSql1 := sSql1 + ' IDPLANOPREV       = '+ IntToStr(FIdPlanoPrev)    +' AND';
  If FIdTipoReserva     >  0 Then sSql1 := sSql1 + ' IDTIPORESERVA     = '+ IntToStr(FIdTipoReserva)  +' AND';
  If FSeqProposta       >  0 Then sSql1 := sSql1 + ' SEQPROPOSTA       = '+ IntToStr(FSeqProposta)    +' AND';
  If FIdParticipante    >  0 Then sSql1 := sSql1 + ' IDPARTICIPANTE    = '+ IntToStr(FIdParticipante) +' AND';

  If Trim(sSql1) <> '' Then
  Begin
    sSql := sSql + 'WHERE' + Copy(sSql1, 1, Length(sSql1)-4)
  End;

  Result := GetDataPacket( sSql );
end;

function TCtrlReservaPart.ExisteReservaPart : Boolean;
begin
  If ConnectionSide = cnsclient Then Begin
    Result := Connection.AppServer.ExisteReservaPart;
  End
  Else
  Begin
    If FIdPessoa       > 0 Then FDbReservaPart.IdPessoa.AsInteger       := FIdPessoa;
    If FIdPessjur      > 0 Then FDbReservaPart.Idpessjur.AsInteger      := FIdPessjur;
    If FIdPlanoPrev    > 0 Then FDbReservaPart.Idplanoprev.AsInteger    := FIdPlanoPrev;
    If FIdTipoReserva  > 0 Then FDbReservaPart.Idtiporeserva.AsInteger  := FIdTipoReserva;
    If FSeqProposta    > 0 Then FDbReservaPart.Seqproposta.AsInteger    := FSeqProposta;
    If FIdParticipante > 0 Then FDbReservaPart.IdParticipante.AsInteger := FIdParticipante;

    CdsReservaPart.Data := GetDataPacket( FDbReservaPart.SSqlSelect );
    Result := Not CdsReservaPart.IsEmpty;
  End;
end;

end.

