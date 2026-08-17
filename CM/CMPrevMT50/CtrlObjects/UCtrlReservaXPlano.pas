unit UCtrlReservaXPlano;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDBReservaXPlano, uFuncoesPrevMT50;

Type

  TCtrlReservaXPlano = class(TCmControlObject)
  private
    FCdsReservaXPlano: TCMClientDataSet;
    FDbReservaXPlano: TDbReservaXPlano;
    FIdPlanoPrev: Integer;
    FIdTipoReserva: Integer;
    FFlgModAtualizacao: Integer;
    FAnaliticoSinteti: String;
    procedure SetCdsReservaXPlano(const Value: TCMClientDataSet);
    procedure SetDbReservaXPlano(const Value: TDbReservaXPlano);
    procedure SetIdTipoReserva(const Value: Integer);
    procedure SetIdPlanoPrev(const Value: Integer);
    procedure SetFlgModAtualizacao(const Value: Integer);
    procedure SetAnaliticoSinteti(const Value: String);

  protected

    procedure DoChangeDataBase; Override;
    procedure AfterInitialize; Override;


  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbReservaXPlano   : TDbReservaXPlano read FDbReservaXPlano   write SetDbReservaXPlano;
    property CdsReservaXPlano  : TCMClientDataSet read FCdsReservaXPlano  write SetCdsReservaXPlano;
    property IdPlanoPrev       : Integer          read FIdPlanoPrev       write SetIdPlanoPrev;
    property IdTipoReserva     : Integer          read FIdTipoReserva     write SetIdTipoReserva;
    property FlgModAtualizacao : Integer          read FFlgModAtualizacao write SetFlgModAtualizacao;
    property AnaliticoSinteti  : String           read FAnaliticoSinteti  write SetAnaliticoSinteti;

    function ExisteReservaXPlano    : Boolean;
    function SelecionaReservaXPlano : OleVariant;
    function GravaReservaXPlano     : Boolean;

  published

end;

implementation

{ TCtrlReservaXPlano }

constructor TCtrlReservaXPlano.Create;
begin
  inherited;
  FDbReservaXPlano  := TDbReservaXPlano.Create(Self);
  FCdsReservaXPlano := TCMClientDataSet.Create(Nil);

  FIdTipoReserva    := -1;
  FIdPlanoPrev      := -1;
end;

destructor TCtrlReservaXPlano.Destroy;
begin
  FDbReservaXPlano.Free;
  FCdsReservaXPlano.Free;
  inherited;
end;

procedure TCtrlReservaXPlano.DoChangeDataBase;
begin
  inherited;
  FDbReservaXPlano.DataBaseName := Self.DataBaseName;
end;


function TCtrlReservaXPlano.GravaReservaXPlano: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarReservaXPlano( CdsReservaXPlano.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsReservaXPlano, DbReservaXPlano, [], [] );

      Msg := DbReservaXPlano.MessageInfo;

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


procedure TCtrlReservaXPlano.SetCdsReservaXPlano(const Value: TCMClientDataSet);
begin
  FCdsReservaXPlano := Value;
end;

procedure TCtrlReservaXPlano.SetDbReservaXPlano(const Value: TDbReservaXPlano);
begin
  FDbReservaXPlano := Value;
end;

procedure TCtrlReservaXPlano.SetIdTipoReserva(const Value: Integer);
begin
  FIdTipoReserva := Value;
end;

procedure TCtrlReservaXPlano.SetIdPlanoPrev(const Value: Integer);
begin
  FIdPlanoPrev := Value;
end;

procedure TCtrlReservaXPlano.SetFlgModAtualizacao(const Value: Integer);
begin
  FFlgModAtualizacao := Value;
end;

procedure TCtrlReservaXPlano.SetAnaliticoSinteti(const Value: String);
begin
  FAnaliticoSinteti := Value;
end;


function TCtrlReservaXPlano.SelecionaReservaXPlano: OleVariant;
Var
  sSql,
  sSql1 : String;
begin
  sSql := 'SELECT '+#13+
          '  UNIDNEGOC, TRGUSERINCLUSAO, TRGDTINCLUSAO, PLANO, PLACONTAPROVISD, PLACONTAPROVISC, PLACONTAJURD, '+#13+
          '  PLACONTAJURC, PLACONTAD, PLACONTAC, PLACONTAATUD, PLACONTAATUC, PERCJUROSRES, NOME, MESULTREAJUSTE, '+#13+
          '  INDICEREAJUSTE, INDICECORRECAO, IDTIPORESERVA, IDRESCONTROLEEXC, IDREGRAPAGTORESE, IDREGRACALCULORE, '+#13+
          '  IDPRODUTO, IDPLANOPREV, IDEMPRESAPROP, IDEMPRESA, IDBENEFICIO, FLGTRANSFERENCIA, FLGTITULARCOLET, '+#13+
          '  FLGTIPORESERVA, FLGREGRESSIVA, FLGREAJUSTEMENSAL, FLGMUDPERFIL, FLGMODATUALIZACAO, FLGDESCIRRF, '+#13+
          '  FLGCONTROLE, FLGCOLETIVA, CODSUBCONTA, CODHIERARQUIA, CODCENTRORESPON, CODCENTROCUSTOD, '+#13+
          '  CODCENTROCUSTOC, ANALITICOSINTETI '+#13+
          'FROM RESERVAXPLANO '+#13;

  sSql1 := '';

  If FIdPlanoPrev       >  0 Then sSql1 := sSql1 + ' IDPLANOPREV       = '+ IntToStr(FIdPlanoPrev)       +' AND';
  If FIdTipoReserva     >  0 Then sSql1 := sSql1 + ' IDTIPORESERVA     = '+ IntToStr(FIdTipoReserva)     +' AND';
  If FAnaliticoSinteti <> '' Then sSql1 := sSql1 + ' ANALITICOSINTETI  = '+ QuotedStr(FAnaliticoSinteti) +' AND';

  If Trim(sSql1) <> '' Then
  Begin
    sSql := sSql + 'WHERE' + Copy(sSql1, 1, Length(sSql1)-4)
  End;

  Result := GetDataPacket( sSql );
end;


function TCtrlReservaXPlano.ExisteReservaXPlano : Boolean;
begin
  If ConnectionSide = cnsclient Then Begin
    Result := Connection.AppServer.ExisteReservaXPlano;
  End
  Else
  Begin
    If FIdTipoReserva > 0 Then FDbReservaXPlano.IdTipoReserva.AsInteger := FIdTipoReserva;
    If FIdPlanoPrev   > 0 Then FDbReservaXPlano.Idplanoprev.AsInteger   := FIdPlanoPrev;

    CdsReservaXPlano.Data := GetDataPacket( FDbReservaXPlano.SSqlSelect );
    Result := Not CdsReservaXPlano.IsEmpty;
  End;
end;

procedure TCtrlReservaXPlano.AfterInitialize;
begin
  inherited;

end;

end.

