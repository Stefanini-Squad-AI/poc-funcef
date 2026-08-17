unit UCtrlHstContribPrev;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDBContribuicao, uDBHstContribPrev, uFuncoesPrevMT50,
     uCtrlContPrev, uCtrlReservaXPlano, uCtrlReservaxContrib,
     uCtrlReservaPart, uCtrlContribPrevPartP;

Type

  TCtrlHstContribPrev = class(TCmControlObject)
  private
    FCdsHstContribPrev: TCMClientDataSet;
    FDbHstContribPrev: TDbHstContribPrev;
    FIdMotivo: Integer;
    FSeqProposta: Integer;
    FIdPessoa: Integer;
    FIdContribuicao: Integer;
    FIdPlanoPrev: Integer;
    FIdPessjur: Integer;
    FNumRecebimento: Integer;
    FMesCobranca: String;
    FMesReferencia: String;
    FMesesAnteriores: Boolean;
    FAnoMesCobranca: String;
    FCtrlContPrev: TCtrlContPrev;
    FCtrlReservaPart: TCtrlReservaPart;
    FCtrlReservaXContrib: TCtrlReservaXContrib;
    FCtrlReservaXPlano: TCtrlReservaXPlano;
    FInContribuicoes: String;
    FCtrlContribPrevPartP: TCtrlContribPrevPartP;
    FFlgDescFolha: Integer;
    FVlrRecebido: Boolean;
    FDataInicio: String;
    FDataFim: String;
    FFlgCalcReserva: String;
    procedure SetCdsHstContribPrev(const Value: TCMClientDataSet);
    procedure SetDbHstContribPrev(const Value: TDbHstContribPrev);
    procedure SetIdContribuicao(const Value: Integer);
    procedure SetIdMotivo(const Value: Integer);
    procedure SetIdPessjur(const Value: Integer);
    procedure SetIdPessoa(const Value: Integer);
    procedure SetIdPlanoPrev(const Value: Integer);
    procedure SetMesCobranca(const Value: String);
    procedure SetMesReferencia(const Value: String);
    procedure SetNumRecebimento(const Value: Integer);
    procedure SetSeqProposta(const Value: Integer);
    procedure SetMesesAnteriores(const Value: Boolean);
    procedure SetAnoMesCobranca(const Value: String);
    procedure SetCtrlContPrev(const Value: TCtrlContPrev);
    procedure SetCtrlReservaPart(const Value: TCtrlReservaPart);
    procedure SetCtrlReservaXContrib(const Value: TCtrlReservaXContrib);
    procedure SetCtrlReservaXPlano(const Value: TCtrlReservaXPlano);
    procedure SetInContribuicoes(const Value: String);
    procedure SetCtrlContribPrevPartP(const Value: TCtrlContribPrevPartP);
    procedure SetFlgDescFolha(const Value: Integer);
    procedure SetVlrRecebido(const Value: Boolean);
    procedure SetDataFim(const Value: String);
    procedure SetDataInicio(const Value: String);
    procedure SetFlgCalcReserva(const Value: String);

  protected

    procedure DoChangeDataBase; Override;
    procedure AfterInitialize; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbHstContribPrev  : TDbHstContribPrev     read FDbHstContribPrev    write SetDbHstContribPrev;
    property CdsHstContribPrev : TCMClientDataSet      read FCdsHstContribPrev   write SetCdsHstContribPrev;

    function SelecionaHstContribPrev  : OleVariant;
    function ExisteHstContribPrev     : Boolean;

    function GravaHstContribPrev : Boolean;

    property IdPessoa        : Integer   read FIdPessoa        write SetIdPessoa;
    property IdPessjur       : Integer   read FIdPessjur       write SetIdPessjur;
    property IdPlanoPrev     : Integer   read FIdPlanoPrev     write SetIdPlanoPrev;
    property SeqProposta     : Integer   read FSeqProposta     write SetSeqProposta;
    property IdContribuicao  : Integer   read FIdContribuicao  write SetIdContribuicao;
    property IdMotivo        : Integer   read FIdMotivo        write SetIdMotivo;
    property NumRecebimento  : Integer   read FNumRecebimento  write SetNumRecebimento;
    property MesReferencia   : String    read FMesReferencia   write SetMesReferencia;
    property MesCobranca     : String    read FMesCobranca     write SetMesCobranca;
    property MesesAnteriores : Boolean   read FMesesAnteriores write SetMesesAnteriores;
    property AnoMesCobranca  : String    read FAnoMesCobranca  write SetAnoMesCobranca;
    property InContribuicoes : String    read FInContribuicoes write SetInContribuicoes;
    property FlgDescFolha    : Integer   read FFlgDescFolha    write SetFlgDescFolha;
    property VlrRecebido     : Boolean   read FVlrRecebido     write SetVlrRecebido;
    property DataInicio      : String    read FDataInicio      write SetDataInicio;
    property DataFim         : String    read FDataFim         write SetDataFim;
    Property FlgCalcReserva  : String    read FFlgCalcReserva  write SetFlgCalcReserva;


  published

    Property ReservaXPlano    : TCtrlReservaXPlano    read FCtrlReservaXPlano    write SetCtrlReservaXPlano;
    Property ReservaXContrib  : TCtrlReservaXContrib  read FCtrlReservaXContrib  write SetCtrlReservaXContrib;
    Property ReservaPart      : TCtrlReservaPart      read FCtrlReservaPart      write SetCtrlReservaPart;
    Property ContPrev         : TCtrlContPrev         read FCtrlContPrev         write SetCtrlContPrev;
    Property ContribPrevPartP : TCtrlContribPrevPartP read FCtrlContribPrevPartP write SetCtrlContribPrevPartP;
    // ---------------------------------------

end;

implementation

{ TCtrlHstContribPrev }

constructor TCtrlHstContribPrev.Create;
begin
  inherited;
  FDbHstContribPrev     := TDbHstContribPrev.Create(Self);
  FCdsHstContribPrev    := TCMClientDataSet.Create(Nil);

  FCtrlReservaXPlano    := TCtrlReservaXPlano.Create;
  FCtrlReservaXContrib  := TCtrlReservaXContrib.Create;
  FCtrlReservaPart      := TCtrlReservaPart.Create;
  FCtrlContPrev         := TCtrlContPrev.Create;
  FCtrlContribPrevPartP := TCtrlContribPrevPartP.Create;

  FIdPessoa             := -1;
  FIdPessjur            := -1;
  FIdPlanoPrev          := -1;
  FSeqProposta          := -1;
  FIdContribuicao       := -1;
  FIdMotivo             := -1;
  FNumRecebimento       := -1;
  FMesReferencia        := '';
  FMesCobranca          := '';
  FMesesAnteriores      := False;
  FAnoMesCobranca       := '';
end;

destructor TCtrlHstContribPrev.Destroy;
begin
  FDbHstContribPrev.Free;
  FCdsHstContribPrev.Free;

  FreeAndNil(FCtrlReservaXPlano);
  FreeAndNil(FCtrlReservaXContrib);
  FreeAndNil(FCtrlReservaPart);
  FreeAndNil(FCtrlContPrev);
  FreeAndNil(FCtrlContribPrevPartP);

  inherited;
end;


procedure TCtrlHstContribPrev.SetIdContribuicao(const Value: Integer);
begin
  FIdContribuicao := Value;
end;

procedure TCtrlHstContribPrev.SetIdMotivo(const Value: Integer);
begin
  FIdMotivo := Value;
end;

procedure TCtrlHstContribPrev.SetIdPessjur(const Value: Integer);
begin
  FIdPessjur := Value;
end;

procedure TCtrlHstContribPrev.SetIdPessoa(const Value: Integer);
begin
  FIdPessoa := Value;
end;

procedure TCtrlHstContribPrev.SetIdPlanoPrev(const Value: Integer);
begin
  FIdPlanoPrev := Value;
end;

procedure TCtrlHstContribPrev.SetMesCobranca(const Value: String);
begin
  FMesCobranca := Value;
end;

procedure TCtrlHstContribPrev.SetMesReferencia(const Value: String);
begin
  FMesReferencia := Value;
end;

procedure TCtrlHstContribPrev.SetNumRecebimento(const Value: Integer);
begin
  FNumRecebimento := Value;
end;

procedure TCtrlHstContribPrev.SetSeqProposta(const Value: Integer);
begin
  FSeqProposta := Value;
end;

procedure TCtrlHstContribPrev.SetMesesAnteriores(const Value: Boolean);
begin
  FMesesAnteriores := Value;
end;

procedure TCtrlHstContribPrev.SetAnoMesCobranca(const Value: String);
begin
  FAnoMesCobranca := Value;
end;

procedure TCtrlHstContribPrev.SetCtrlContPrev(const Value: TCtrlContPrev);
begin
  FCtrlContPrev := Value;
end;

procedure TCtrlHstContribPrev.SetCtrlReservaPart(
  const Value: TCtrlReservaPart);
begin
  FCtrlReservaPart := Value;
end;

procedure TCtrlHstContribPrev.SetCtrlReservaXContrib(
  const Value: TCtrlReservaXContrib);
begin
  FCtrlReservaXContrib := Value;
end;

procedure TCtrlHstContribPrev.SetCtrlReservaXPlano(
  const Value: TCtrlReservaXPlano);
begin
  FCtrlReservaXPlano := Value;
end;

procedure TCtrlHstContribPrev.SetInContribuicoes(const Value: String);
begin
  FInContribuicoes := Value;
end;

procedure TCtrlHstContribPrev.SetCtrlContribPrevPartP(
  const Value: TCtrlContribPrevPartP);
begin
  FCtrlContribPrevPartP := Value;
end;

procedure TCtrlHstContribPrev.SetFlgDescFolha(const Value: Integer);
begin
  FFlgDescFolha := Value;
end;

procedure TCtrlHstContribPrev.SetVlrRecebido(const Value: Boolean);
begin
  FVlrRecebido := Value;
end;

procedure TCtrlHstContribPrev.SetDataFim(const Value: String);
begin
  FDataFim := Value;
end;

procedure TCtrlHstContribPrev.SetDataInicio(const Value: String);
begin
  FDataInicio := Value;
end;

procedure TCtrlHstContribPrev.SetFlgCalcReserva(const Value: String);
begin
  FFlgCalcReserva := Value;
end;
// --------------------------------------------

procedure TCtrlHstContribPrev.DoChangeDataBase;
begin
  inherited;
  FDbHstContribPrev.DataBaseName := Self.DataBaseName;
end;


function TCtrlHstContribPrev.GravaHstContribPrev: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarHstContribPrev( CdsHstContribPrev.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsHstContribPrev, DbHstContribPrev, [], [] );

      Msg := DbHstContribPrev.MessageInfo;

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


procedure TCtrlHstContribPrev.SetCdsHstContribPrev(const Value: TCMClientDataSet);
begin
  FCdsHstContribPrev := Value;
end;

procedure TCtrlHstContribPrev.SetDbHstContribPrev(const Value: TDbHstContribPrev);
begin
  FDbHstContribPrev := Value;
end;

function TCtrlHstContribPrev.SelecionaHstContribPrev : OleVariant;
Var
  sSql,
  sSql1 : String;
begin
  sSql := 'SELECT '+#13+
          '  VLRTOTRETROATIVO, VLRDIFRETROATIVO, VALORRECEBIDO, VALORPARARESERVA, '+#13+
          '  VALOROP3, VALOROP2, VALOROP1, VALORESPERADO, VALORCALCULADO, '+#13+
          '  TRGUSERINCLUSAO, TRGDTINCLUSAO, TIPO, SITRECEBIMENTO, SEQPROPOSTA, '+#13+
          '  QUANTCOTAS, PERCCALCULO, PARCELA, OPTRATDIVERG, NUMRECPARCELA2, '+#13+
          '  NUMRECPARCELA1, NUMRECEBIMENTO, MOTIVOCANCEL, MESREFERENCIA, '+#13+
          '  MESCOBRANCA, IDRETROATIVO, IDREGRACALCULO, IDREGRAALIMRESER, '+#13+
          '  IDPLANOPREV, IDPESSOA, IDPESSJUR, IDPARCELAMENTO, IDMOVBENEF, '+#13+
          '  IDMOTIVO, IDLOTE, IDLANCIRRF, IDHISTPROPOSTA, IDCONTRIBUICAO, '+#13+
          '  FONTEPAGADORA, FOLHAORIGEM, FLGSITFUNDACAO, FLGMANUAL, '+#13+
          '  FLGINTEVENTO, FLGEVENTO, FLGDIVERGENTE, FLGDEVOLUCAO, '+#13+
          '  FLGDESCFOLHA, FLGDATAINDRESERV, FLGCONCESSAO, FLGCALCRESERVA, '+#13+
          '  FLGAPORTE, FATOR, DTCOBRANCA, DATAULTALIM, DATARECEBIMENTO, '+#13+
          '  DATAPREVISAORECE, DATAINICIO, DATAFINAL, DATAEMISSCOB, '+#13+
          '  DATACANCELAMENTO, CODREFERENCIA, CODPORTFORMA, CODDOCUMENTOPREV, '+#13+
          '  VALORBASE1, VALORBASE2 '+#13+
          'FROM '+
          '  HSTCONTRIBPREV '+#13;

  sSql1 := '';

  If FIdPessoa        >   0 Then sSql1 := sSql1 + ' IDPESSOA         = '+IntToStr(FIdPessoa)        +' AND';
  If FIdPessjur       >   0 Then sSql1 := sSql1 + ' IDPESSJUR        = '+IntToStr(FIdPessjur)       +' AND';
  If FIdPlanoPrev     >   0 Then sSql1 := sSql1 + ' IDPLANOPREV      = '+IntToStr(FIdPlanoPrev)     +' AND';
  If FSeqProposta     >   0 Then sSql1 := sSql1 + ' SEQPROPOSTA      = '+IntToStr(FSeqProposta)     +' AND';
  If FIdContribuicao  >   0 Then sSql1 := sSql1 + ' IDCONTRIBUICAO   = '+IntToStr(FIdContribuicao)  +' AND';
  If FIdMotivo        >   0 Then sSql1 := sSql1 + ' IDMOTIVO         = '+IntToStr(FIdMotivo)        +' AND';
  If FNumRecebimento  >   0 Then sSql1 := sSql1 + ' NUMRECEBIMENTO   = '+IntToStr(FNumRecebimento)  +' AND';
  If FMesReferencia   <> '' Then sSql1 := sSql1 + ' MESREFERENCIA    = '+QuotedStr(FMesReferencia)  +' AND';
  If FMesCobranca     <> '' Then sSql1 := sSql1 + ' MESCOBRANCA      = '+QuotedStr(FMesCobranca)    +' AND';
  If FFlgDescFolha    >  -1 Then sSql1 := sSql1 + ' FLGDESCFOLHA     = '+IntToStr(FFlgDescFolha)    +' AND';
  If FDataInicio      <> '' Then sSql1 := sSql1 + ' DATARECEBIMENTO >= '+ QuotedStr(FDataFim)       +' AND';
  If FDataFim         <> '' Then sSql1 := sSql1 + ' DATARECEBIMENTO <= '+ QuotedStr(FDataInicio)    +' AND';
  If FInContribuicoes <> '' Then sSql1 := sSql1 + ' IDCONTRIBUICAO  IN ('+FInContribuicoes        +') AND';
  If FVlrRecebido           Then sSql1 := sSql1 + ' VALORRECEBIDO  > 0 AND';

  If Trim(sSql1) <> '' Then
  Begin
    sSql := sSql + 'WHERE' + Copy(sSql1, 1, Length(sSql1)-4)
  End;

  // -----------------------------------------------
  ContPrev.IdPlanoPrev            := FIdPlanoPrev;
  ContPrev.IdContribuicao         := FIdContribuicao;
  // -----------------------------------------------
  ReservaPart.IdPessoa            := FIdPessoa;
  ReservaPart.IdPessjur           := FIdPessjur;
  ReservaPart.IdPlanoPrev         := FIdPlanoPrev;
  ReservaPart.SeqProposta         := FSeqProposta;
  // -----------------------------------------------
  ReservaXContrib.IdPlanoPrev     := FIdPlanoPrev;
  // -----------------------------------------------
  ReservaXPlano.IdPlanoPrev       := FIdPlanoPrev;
  // -----------------------------------------------
  ContribPrevPartP.IdPessjur      := FIdPessjur;
  ContribPrevPartP.IdPlanoPrev    := FIdPlanoPrev;
  ContribPrevPartP.IdPessoa       := FIdPessoa;
  ContribPrevPartP.SeqProposta    := FSeqProposta;
  ContribPrevPartP.IdContribuicao := FIdContribuicao;
  // -----------------------------------------------

  If FMesesAnteriores Then
    Result := GetDataPacket( sSql + ' AND (MESCOBRANCA   <= ' + QuotedStr(AnoMesCobranca)  + ') ')
  Else
    Result := GetDataPacket( sSql );
end;


function TCtrlHstContribPrev.ExisteHstContribPrev : Boolean;
Var
  sSql,
  sSql1 : String;
begin
  sSql := 'SELECT '+#13+
          '  VLRTOTRETROATIVO, VLRDIFRETROATIVO, VALORRECEBIDO, VALORPARARESERVA, '+#13+
          '  VALOROP3, VALOROP2, VALOROP1, VALORESPERADO, VALORCALCULADO, '+#13+
          '  TRGUSERINCLUSAO, TRGDTINCLUSAO, TIPO, SITRECEBIMENTO, SEQPROPOSTA, '+#13+
          '  QUANTCOTAS, PERCCALCULO, PARCELA, OPTRATDIVERG, NUMRECPARCELA2, '+#13+
          '  NUMRECPARCELA1, NUMRECEBIMENTO, MOTIVOCANCEL, MESREFERENCIA, '+#13+
          '  MESCOBRANCA, IDRETROATIVO, IDREGRACALCULO, IDREGRAALIMRESER, '+#13+
          '  IDPLANOPREV, IDPESSOA, IDPESSJUR, IDPARCELAMENTO, IDMOVBENEF, '+#13+
          '  IDMOTIVO, IDLOTE, IDLANCIRRF, IDHISTPROPOSTA, IDCONTRIBUICAO, '+#13+
          '  FONTEPAGADORA, FOLHAORIGEM, FLGSITFUNDACAO, FLGMANUAL, '+#13+
          '  FLGINTEVENTO, FLGEVENTO, FLGDIVERGENTE, FLGDEVOLUCAO, '+#13+
          '  FLGDESCFOLHA, FLGDATAINDRESERV, FLGCONCESSAO, FLGCALCRESERVA, '+#13+
          '  FLGAPORTE, FATOR, DTCOBRANCA, DATAULTALIM, DATARECEBIMENTO, '+#13+
          '  DATAPREVISAORECE, DATAINICIO, DATAFINAL, DATAEMISSCOB, '+#13+
          '  DATACANCELAMENTO, CODREFERENCIA, CODPORTFORMA, CODDOCUMENTOPREV, '+#13+
          '  VALORBASE1, VALORBASE2 '+#13+
          'FROM '+
          '  HSTCONTRIBPREV '+#13;

  sSql1 := '';

  If FIdPessoa        >   0 Then sSql1 := sSql1 + ' IDPESSOA         = '+IntToStr(FIdPessoa)        +' AND';
  If FIdPessjur       >   0 Then sSql1 := sSql1 + ' IDPESSJUR        = '+IntToStr(FIdPessjur)       +' AND';
  If FIdPlanoPrev     >   0 Then sSql1 := sSql1 + ' IDPLANOPREV      = '+IntToStr(FIdPlanoPrev)     +' AND';
  If FSeqProposta     >   0 Then sSql1 := sSql1 + ' SEQPROPOSTA      = '+IntToStr(FSeqProposta)     +' AND';
  If FIdContribuicao  >   0 Then sSql1 := sSql1 + ' IDCONTRIBUICAO   = '+IntToStr(FIdContribuicao)  +' AND';
  If FIdMotivo        >   0 Then sSql1 := sSql1 + ' IDMOTIVO         = '+IntToStr(FIdMotivo)        +' AND';
  If FNumRecebimento  >   0 Then sSql1 := sSql1 + ' NUMRECEBIMENTO   = '+IntToStr(FNumRecebimento)  +' AND';
  If FMesReferencia   <> '' Then sSql1 := sSql1 + ' MESREFERENCIA    = '+QuotedStr(FMesReferencia)  +' AND';
  If FMesCobranca     <> '' Then sSql1 := sSql1 + ' MESCOBRANCA      = '+QuotedStr(FMesCobranca)    +' AND';
  If FFlgDescFolha    >  -1 Then sSql1 := sSql1 + ' FLGDESCFOLHA     = '+IntToStr(FFlgDescFolha)    +' AND';
  If FFlgCalcReserva  <> '' Then sSql1 := sSql1 + ' FLGCALCRESERVA   = '+ FFlgCalcReserva           +' AND';
  If FDataInicio      <> '' Then sSql1 := sSql1 + ' DATARECEBIMENTO <= '+ QuotedStr(FDataFim)       +' AND';
  If FDataFim         <> '' Then sSql1 := sSql1 + ' DATARECEBIMENTO >= '+ QuotedStr(FDataInicio)    +' AND';
  If FInContribuicoes <> '' Then sSql1 := sSql1 + ' IDCONTRIBUICAO   IN ('+FInContribuicoes        +') AND';
  If FVlrRecebido           Then sSql1 := sSql1 + ' VALORRECEBIDO  > 0 AND';

  If Trim(sSql1) <> '' Then
  Begin
    sSql := sSql + 'WHERE' + Copy(sSql1, 1, Length(sSql1)-4)
  End;

  If FMesesAnteriores Then
    FCdsHstContribPrev.Data := GetDataPacket( sSql + ' AND (MESCOBRANCA   <= ' + QuotedStr(AnoMesCobranca)  + ') ')
  Else
    FCdsHstContribPrev.Data := GetDataPacket( sSql );

  Result := Not FCdsHstContribPrev.IsEmpty;
end;

procedure TCtrlHstContribPrev.AfterInitialize;
begin
  inherited;
  ReservaXPlano.InitializeAs(Self);
  ReservaXContrib.InitializeAs(Self);
  ReservaPart.InitializeAs(Self);
  ContPrev.InitializeAs(Self);
  ContribPrevPartp.InitializeAs(Self);
end;

end.

