unit UCtrlParticipante;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDBPartPrevPlan, uFuncoesPrevMT50, uDBHstContribPrev,
     uCtrlHstContribPrev;

Type

  TCtrlParticipante = class(TCmControlObject)
  private
    FCdsParticipante: TCMClientDataSet;
    FDBPartPrevPlan: TDBPartPrevPlan;
    FIdPessjur: Integer;
    FIdPlanoPrev: Integer;
    FIdPessoa: Integer;
    FSeqProposta: Integer;
    FFlgDesativado: Integer;
    FHstContribPrev: TCtrlHstContribPrev;
    procedure SetCdsParticipante(const Value: TCMClientDataSet);
    procedure SetDBPartPrevPlan(const Value: TDBPartPrevPlan);
    procedure SetFlgDesativado(const Value: Integer);
    procedure SetIdPessjur(const Value: Integer);
    procedure SetIdPessoa(const Value: Integer);
    procedure SetIdPlanoPrev(const Value: Integer);
    procedure SetSeqProposta(const Value: Integer);
    procedure SetHstContribPrev(const Value: TCtrlHstContribPrev);

  protected

    procedure DoChangeDataBase; Override;
    procedure AfterInitialize; override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DBPartPrevPlan  : TDBPartPrevPlan     read FDBPartPrevPlan  write SetDBPartPrevPlan;
    property CdsParticipante : TCMClientDataSet    read FCdsParticipante write SetCdsParticipante;

    property IdPessoa        : Integer             read FIdPessoa        write SetIdPessoa;
    property IdPessjur       : Integer             read FIdPessjur       write SetIdPessjur;
    property IdPlanoPrev     : Integer             read FIdPlanoPrev     write SetIdPlanoPrev;
    property SeqProposta     : Integer             read FSeqProposta     write SetSeqProposta;
    property FlgDesativado   : Integer             read FFlgDesativado   write SetFlgDesativado;

    function GravaParticipante : Boolean;
    function SelecionaParticipante : OleVariant;
    function ExisteParticipante    : Boolean;


  published

    Property HstContribPrev : TCtrlHstContribPrev read FHstContribPrev write SetHstContribPrev;

end;

implementation

{ TCtrlParticipante }

constructor TCtrlParticipante.Create;
begin
  inherited;
  FDBPartPrevPlan  := TDBPartPrevPlan.Create(Self);
  FCdsParticipante := TCMClientDataSet.Create(Nil);

  FHstContribPrev  := TCtrlHstContribPrev.Create;

  IdPessoa         := -1;
  IdPessJur        := -1;
  IdPlanoPrev      := -1;
  SeqProposta      := -1;
  FlgDesativado    := -1;
end;

destructor TCtrlParticipante.Destroy;
begin

  FCdsParticipante.Close;

  FDBPartPrevPlan.Free;
  FCdsParticipante.Free;

  FreeAndNil( FHstContribPrev );
  
  inherited;
end;

procedure TCtrlParticipante.DoChangeDataBase;
begin
  inherited;
  FDBPartPrevPlan.DataBaseName := Self.DataBaseName;
end;

procedure TCtrlParticipante.AfterInitialize;
begin
  inherited;
  FHstContribPrev.InitializeAs(Self);
end;

procedure TCtrlParticipante.SetCdsParticipante(const Value: TCMClientDataSet);
begin
  FCdsParticipante := Value;
end;

procedure TCtrlParticipante.SetDBPartPrevPlan(const Value: TDBPartPrevPlan);
begin
  FDBPartPrevPlan := Value;
end;

procedure TCtrlParticipante.SetFlgDesativado(const Value: Integer);
begin
  FFlgDesativado := Value;
end;

procedure TCtrlParticipante.SetIdPessjur(const Value: Integer);
begin
  FIdPessjur := Value;
end;

procedure TCtrlParticipante.SetIdPessoa(const Value: Integer);
begin
  FIdPessoa := Value;
end;

procedure TCtrlParticipante.SetIdPlanoPrev(const Value: Integer);
begin
  FIdPlanoPrev := Value;
end;

procedure TCtrlParticipante.SetSeqProposta(const Value: Integer);
begin
  FSeqProposta := Value;
end;

function TCtrlParticipante.GravaParticipante: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarParticipante( CdsParticipante.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsParticipante, DBPartPrevPlan, [], [] );

      Msg := DBPartPrevPlan.MessageInfo;

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

function TCtrlParticipante.SelecionaParticipante: OleVariant;
Var
  sSql,
  sSql1 : String;
begin
  If ConnectionSide = cnsclient Then Begin
    Result := Connection.AppServer.SelecionaParticipante;
  End
  Else
  begin
    sSql := 'SELECT AGENCIAPAGTO, BANCOPAGTO, CARENCIACONTRIB, CCORRENTEPAGTO, DATAAPURAEXCED, DATACANCELAMENTO, '+#13+
            '       DATACARENCIA, DATACONFIRMACAO, DATACONTRIBINSS, DATAFIMASSIST, DATAFIMSITTEMP, DATAINICIOASSIST, '+#13+
            '       DATAINICIOMANUT, DATAINICIOSITTEMP, DATALIBERAEXCED, DATAOPCAOIR, DATAULTPAGTO, DTINICIOINSC, '+#13+
            '       DTULTREAJUSTECONT, FLGDESATIVADO, FLGDEVEASSISTENC, FLGDEVEEMPRESTIMO, FLGDEVEPREVIDENC, '+#13+
            '       FLGFITESPECIAL, FLGSALVIRTBENEF, FLGUSATETO, IDADEBASE, IDPAGADOR, IDPESSJUR, IDPESSOA, '+#13+
            '       IDPLANOCOM, IDPLANOCOMISSAO, IDPLANOPREV, IDSEQPAG, IDSITPART, IDSITPLANOPREV, '+#13+
            '       INSCRICAODATA, INSCRICAONUMERO, INSCRICAOTIPO, MESULTREAJSAL, NUMCHEQUE, NUMPROCINSS, '+#13+
            '       PRAZOACUMULACAO, REQUERIMENTODATA, SALAUXDOENCA, SALINSCRICAO, SALMANTIDO, SALPARTICIPACAO, '+#13+
            '       SALPARTIC13, SALVINCULADO, SEQPROPOSTA, TEMPOAFASTADO, TIPOOPCAOIR, ULTREMTOTAL, ULTSALAUXREAJ, '+#13+
            '       ULTSALMANTREAJ, ULTSALMANUT, ULTSALMANUTPARC, ULTSALPART, ULTSALREAJUSTE, VALORCALCINSS, VALORINFINSS, '+#13+
            '       TRGDTINCLUSAO, TRGUSERINCLUSAO '+#13+
            'FROM PARTPREVPLAN '+#13;

    sSql1 := '';

    If IdPessoa      >0 Then sSql1 := sSql1 + ' IDPESSOA      = '+IntToStr(IdPessoa)     +' AND';
    If IdPessjur     >0 Then sSql1 := sSql1 + ' IDPESSJUR     = '+IntToStr(IdPessjur)    +' AND';
    If IdPlanoPrev   >0 Then sSql1 := sSql1 + ' IDPLANOPREV   = '+IntToStr(IdPlanoPrev)  +' AND';
    If SeqProposta   >0 Then sSql1 := sSql1 + ' SEQPROPOSTA   = '+IntToStr(SeqProposta)  +' AND';
    If FlgDesativado >0 Then sSql1 := sSql1 + ' FLGDESATIVADO = '+IntToStr(FlgDesativado)+' AND';

    If Trim(sSql1) <> '' Then
    Begin
      sSql := sSql + 'WHERE' + Copy(sSql1, 1, Length(sSql1)-4)
    End;

    HstContribPrev.Idpessoa    := IdPessoa;
    HstContribPrev.IdPessjur   := IdPessjur;
    HstContribPrev.IdPlanoPrev := IdPlanoPrev;

    Result := GetDataPacket(sSql);


  End;
end;

function TCtrlParticipante.ExisteParticipante: Boolean;
begin
  If ConnectionSide = cnsclient Then Begin
    Result := Connection.AppServer.ExisteParticipante;
  End
  Else
  Begin
    CdsParticipante.Data := SelecionaParticipante;
    Result := Not CdsParticipante.IsEmpty;
  End;
end;

procedure TCtrlParticipante.SetHstContribPrev(
  const Value: TCtrlHstContribPrev);
begin
  FHstContribPrev := Value;
end;

end.

