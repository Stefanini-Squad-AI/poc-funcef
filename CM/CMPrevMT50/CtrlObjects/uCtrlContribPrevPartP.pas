unit UCtrlContribPrevPartP;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDBContribPrevPartP, uFuncoesPrevMT50;

Type

  TCtrlContribPrevPartP = class(TCmControlObject)
  private
    FCdsContribPrevPartP: TCMClientDataSet;
    FDbContribPrevPartP: TDbContribPrevPartP;
    FIdPessjur: Integer;
    FIdPlanoPrev: Integer;
    FIdPessoa: Integer;
    FSeqProposta: Integer;
    FIdContribuicao: Integer;
    procedure SetCdsContribPrevPartP(const Value: TCMClientDataSet);
    procedure SetDbContribPrevPartP(const Value: TDbContribPrevPartP);
    procedure SetIdPlanoPrev(const Value: Integer);
    procedure SetIdPessjur(const Value: Integer);
    procedure SetIdPessoa(const Value: Integer);
    procedure SetSeqProposta(const Value: Integer);
    procedure SetIdContribuicao(const Value: Integer);

  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbContribPrevPartP  : TDbContribPrevPartP read FDbContribPrevPartP  write SetDbContribPrevPartP;
    property CdsContribPrevPartP : TCMClientDataSet    read FCdsContribPrevPartP write SetCdsContribPrevPartP;

    property IdPessjur           : Integer             read FIdPessjur           write SetIdPessjur;
    property IdPlanoPrev         : Integer             read FIdPlanoPrev         write SetIdPlanoPrev;
    property IdPessoa            : Integer             read FIdPessoa            write SetIdPessoa;
    property SeqProposta         : Integer             read FSeqProposta         write SetSeqProposta;
    property IdContribuicao      : Integer             read FIdContribuicao      write SetIdContribuicao;

    function SelecionaContribPrevPartP : OleVariant;
    function ExisteContribPrevPartP    : Boolean;

    function GravaContribPrevPartP     : Boolean;

  published

end;

implementation

{ TCtrlContribPrevPartP }

constructor TCtrlContribPrevPartP.Create;
begin
  inherited;
  FDbContribPrevPartP     := TDbContribPrevPartP.Create(Self);
  FCdsContribPrevPartP    := TCMClientDataSet.Create(Nil);

  FIdPessoa       := -1;
  FIdPessjur      := -1;
  FIdPlanoPrev    := -1;
  FIdContribuicao := -1;
  FSeqProposta    := -1;
end;

destructor TCtrlContribPrevPartP.Destroy;
begin
  FDbContribPrevPartP.Free;
  FCdsContribPrevPartP.Free;
  inherited;
end;

procedure TCtrlContribPrevPartP.DoChangeDataBase;
begin
  inherited;
  FDbContribPrevPartP.DataBaseName := Self.DataBaseName;
end;


function TCtrlContribPrevPartP.GravaContribPrevPartP: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarContribPrevPartP( CdsContribPrevPartP.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsContribPrevPartP, DbContribPrevPartP, [], [] );

      Msg := DbContribPrevPartP.MessageInfo;

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

// -----------------------------------------------------------------
procedure TCtrlContribPrevPartP.SetCdsContribPrevPartP(const Value: TCMClientDataSet);
begin
  FCdsContribPrevPartP := Value;
end;

procedure TCtrlContribPrevPartP.SetDbContribPrevPartP(const Value: TDbContribPrevPartP);
begin
  FDbContribPrevPartP := Value;
end;

procedure TCtrlContribPrevPartP.SetIdPlanoPrev(const Value: Integer);
begin
  FIdPlanoPrev := Value;
end;

procedure TCtrlContribPrevPartP.SetIdPessjur(const Value: Integer);
begin
  FIdPessjur := Value;
end;

procedure TCtrlContribPrevPartP.SetIdPessoa(const Value: Integer);
begin
  FIdPessoa := Value;
end;

procedure TCtrlContribPrevPartP.SetSeqProposta(const Value: Integer);
begin
  FSeqProposta := Value;
end;

procedure TCtrlContribPrevPartP.SetIdContribuicao(const Value: Integer);
begin
  FIdContribuicao := Value;
end;
// -----------------------------------------------------------------

function TCtrlContribPrevPartP.SelecionaContribPrevPartP: OleVariant;
Var
  sSql,
  sSql1 : String;
begin
  sSql := 'SELECT '+#13+
          '  VALORASSOCIADO3, CODTIPDESEMBDEVOL, TRGDTINCLUSAO, TRGUSERINCLUSAO, CODCCUSTODEVOL, '+#13+
          '  PLACONTADEVOL, CODTIPDESEMB13, ULTANO13, PLACONTADEVOLPAT, CODCCUSTODEVOLPAT, '+#13+
          '  CODCCUSTOCPROVIS, CODCCUSTODPROVIS, PLACONTACPROVIS, PLACONTADPROVIS, IDPLANPREVCONTAB, '+#13+
          '  PLACONTADBANCO13, PLACONTADBANCO, CODCCUSTDPROVIS13, CODCCUSTCPROVIS13, PLACONTADPROVIS13, '+#13+
          '  PLACONTACPROVIS13, PLANOPROVIS, PLACONTAOUTROMES, PLACTAOUTROMES13, CODTIPRECADT13, '+#13+
          '  CODDESEMBPROV13, CODDESEMBDEV13, PLACONTADEVOL13, PLACTDEVOLPAT13, PLACTCPROVADT13, '+#13+
          '  PLACTAACJUD, PLACTDPROVADT13, RECPAGDESEMB, IDEMPRESADESEMB, PLACTAACJUD13, '+#13+
          '  PLACONTACPROVADT, PLACONTADPROVADT, RECPAGADT, CODTIPRECDESADT, RECPAGDESEMBPROV, '+#13+
          '  CODTIPDESEMBPROV, PLACONTACADT13, IDPESSJUR, IDTPPERIODICIDADE, IDPESSOA, IDPLANOPREV, '+#13+
          '  SEQPROPOSTA, IDEMPRESAPROP, IDEMPRESAPROP13, RECPAG, RECPAGDEVOL, CODTIPRECDES, '+#13+
          '  CODTIPDESEMBCAR, CODCENTROCUSTOD13, IDCONTRIBUICAO, RECPAG13, PLACONTAD, TIPCODIGO, '+#13+
          '  CODCENTROCUSTOC13, CODCENTRORESPON, PLACONTAD13, PLACONTAC13, PLANO, PLACONTAC, '+#13+
          '  CODALTERADORJUROS, DIAVENCIMENTO, CODTIPDOC, INDICEREAJCONTRIB, CODSUBCONTA, '+#13+
          '  IDSITCOBERTURA, CODCENTROCUSTOD, CODCENTROCUSTOC, IDPLANOBENEF, IDBENEFICIO, '+#13+
          '  UNIDNEGOC, IDEMPRESA, CODPORTFORMA, FLGDESCFOLHA, VALORBASE1, VALORBASE2, '+#13+
          '  VALORBASE3, FLGCOBRA, TEMPOCONTRIB, VLRCONTDIGITADO, VLRCONTCALCULADO, QTDEPARCELAS, '+#13+
          '  FLGRECALCULA, FLGRETROATIVO, DATAINICIO, DATAFINAL, VLCONTREAL, VLBENEFREAL, '+#13+
          '  PRAZODIFERIMENTO, TMPPAGTORENDA, FLGFORMACALC, IDADEINGRESSO, DTPRIMPAGAMENTO, '+#13+
          '  IDADEINGCOMERCIAL, MESREAJCONTRIB, IDADEINGREAL, CODALTERADORCORR, IDHISTPROPOSTA, '+#13+
          '  ULTMESPREPARO, PLANO13, IDEMPRESA13, UNIDNEGOC13, CODSUBCONTA13, CODALTERAJUROS13, '+#13+
          '  CODALTERACORR13, CODTIPRECDES13, TIPCODIGO13, CODTIPDOC13, CODPORTFORMA13, '+#13+
          '  CODCENTRORESPON13, ASSOC1OP1, ASSOC1OP2, ASSOC1OP3, ASSOC2OP1, ASSOC2OP2, ASSOC2OP3, '+#13+
          '  ASSOC3OP1, ASSOC3OP2, ASSOC3OP3, VALORASSOCIADO, VALORASSOCIADO2 '+#13+
          'FROM CONTRIBPREVPARTP '+#13;

  sSql1 := '';

  If FIdPessjur       >   0 Then sSql1 := sSql1 + ' IDPESSJUR      = '+IntToStr(FIdPessjur)       +' AND';
  If FIdPlanoPrev     >   0 Then sSql1 := sSql1 + ' IDPLANOPREV    = '+IntToStr(FIdPlanoPrev)     +' AND';
  If FIdPessoa        >   0 Then sSql1 := sSql1 + ' IDPESSOA       = '+IntToStr(FIdPessoa)        +' AND';
  If FSeqProposta     >   0 Then sSql1 := sSql1 + ' SEQPROPOSTA    = '+IntToStr(FSeqProposta)     +' AND';
  If FIdContribuicao  >   0 Then sSql1 := sSql1 + ' IDCONTRIBUICAO = '+IntToStr(FIdContribuicao)  +' AND';

  If Trim(sSql1) <> '' Then
  Begin
    sSql := sSql + 'WHERE' + Copy(sSql1, 1, Length(sSql1)-4)
  End;

  Result := GetDataPacket( sSql );
end;


function TCtrlContribPrevPartP.ExisteContribPrevPartP : Boolean;
begin
  If ConnectionSide = cnsclient Then Begin
    Result := Connection.AppServer.ExisteContribPrevPartP;
  End
  Else
  Begin
    If FIdPessjur      > 0 Then FDbContribPrevPartP.Idpessjur.AsInteger       := FIdPessjur;
    If FIdPlanoPrev    > 0 Then FDbContribPrevPartP.Idplanoprev.AsInteger     := FIdPlanoPrev;
    If FIdPessoa       > 0 Then FDbContribPrevPartP.IdPessoa.AsInteger        := FIdPessoa;
    If FSeqProposta    > 0 Then FDbContribPrevPartP.Seqproposta.AsInteger     := FSeqProposta;
    If FIdContribuicao > 0 Then FDbContribPrevPartP.Idcontribuicao.AsInteger  := FIdContribuicao;

    CdsContribPrevPartP.Data := GetDataPacket( FDbContribPrevPartP.SSqlSelect );
    Result := Not CdsContribPrevPartP.IsEmpty;
  End;
end;

end.

