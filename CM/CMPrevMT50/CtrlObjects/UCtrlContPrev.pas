unit UCtrlContPrev;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDBContPrev, uFuncoesPrevMT50;

Type

  TCtrlContPrev = class(TCmControlObject)
  private
    FCdsContPrev: TCMClientDataSet;
    FDbContPrev: TDbContPrev;
    FIdPlanoPrev: Integer;
    FIdContribuicao: Integer;
    procedure SetCdsContPrev(const Value: TCMClientDataSet);
    procedure SetDbContPrev(const Value: TDbContPrev);
    procedure SetIdContribuicao(const Value: Integer);
    procedure SetIdPlanoPrev(const Value: Integer);

  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbContPrev  : TDbContPrev      read FDbContPrev     write SetDbContPrev;
    property CdsContPrev : TCMClientDataSet read FCdsContPrev    write SetCdsContPrev;
    property IdPlanoPrev : Integer          read FIdPlanoPrev    write SetIdPlanoPrev;
    property IdContribuicao : Integer       read FIdContribuicao write SetIdContribuicao;

    function ExisteContPrev : Boolean;
    function SelecionaContPrev: OleVariant;
    function GravaContPrev : Boolean;

  published

end;

implementation

{ TCtrlContPrev }

constructor TCtrlContPrev.Create;
begin
  inherited;
  FDbContPrev     := TDbContPrev.Create(Self);
  FCdsContPrev    := TCMClientDataSet.Create(Nil);

  FIdContribuicao := -1;
  FIdPlanoPrev    := -1;
end;

destructor TCtrlContPrev.Destroy;
begin
  FDbContPrev.Free;
  FCdsContPrev.Free;
  inherited;
end;

procedure TCtrlContPrev.DoChangeDataBase;
begin
  inherited;
  FDbContPrev.DataBaseName := Self.DataBaseName;
end;


function TCtrlContPrev.GravaContPrev: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarContPrev( CdsContPrev.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsContPrev, DbContPrev, [], [] );

      Msg := DbContPrev.MessageInfo;

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
procedure TCtrlContPrev.SetCdsContPrev(const Value: TCMClientDataSet);
begin
  FCdsContPrev := Value;
end;

procedure TCtrlContPrev.SetDbContPrev(const Value: TDbContPrev);
begin
  FDbContPrev := Value;
end;

procedure TCtrlContPrev.SetIdContribuicao(const Value: Integer);
begin
  FIdContribuicao := Value;
end;

procedure TCtrlContPrev.SetIdPlanoPrev(const Value: Integer);
begin
  FIdPlanoPrev := Value;
end;
// -----------------------------------------------------------------

function TCtrlContPrev.SelecionaContPrev: OleVariant;
Var
  sSql,
  sSql1 : String;
begin
  sSql := 'SELECT '+#13+
          '  PLACONTADEVOL, FLGRECALCCONTFOL, VALORBASETAXA, CODCCUSTODEVOLPAT, PLACONTADEVOLPAT, '+#13+
          '  CODCCUSTOCPROVIS, CODCCUSTODPROVIS, PLACONTACPROVIS, PLACONTADPROVIS, CRITVALORBASE2, '+#13+
          '  CRITSALARIO, CRITVALORBASE1, CRITVALORBASE3, IDPLANPREVCONTAB, PERCCALCULO, FLGDESCFOLHAULT, '+#13+
          '  PLACONTADBANCO13, PLACONTADBANCO, IDREGRAVLRRESERVA, CODCCUSTDPROVIS13, CODCCUSTCPROVIS13, '+#13+
          '  PLACONTADPROVIS13, PLACONTACPROVIS13, PLANOPROVIS, IDRUBADIANT, IDRUBDEVOLADIANT, '+#13+
          '  IDRUBDEVADIANT13, IDRUBADIANT13, PLACONTAOUTROMES, RECPAGADT, CODTIPRECDESADT, '+#13+
          '  PLACONTACPROVADT, PLACONTADPROVADT, PLANOADT, PLACTAOUTROMES13, CODCCUSTOCPROVAD, '+#13+
          '  CODCCUSTODPROVAD, RECPAGDESEMBPROV, CODTIPDESEMBPROV, FLGPARCELAMENTO, IDRUBACJUD, '+#13+
          '  IDRUBATRACJUD, IDRUBDEVACJUD, IDRUBDADACJUD, IDRUBDEVADTACJUD, IDRUB13ACJUD, IDRUB13ATRACJUD, '+#13+
          '  IDRUB13DEVACJUD, IDRUB13DESCACJUD, IDRUB13DVADTACJUD, FLGACERTACONTRIB13, PLACTAACJUD, '+#13+
          '  PLACTAACJUD13, FLGCARENCIA, IDRUBFERIASDEVOL, IDRUBFERIASATRASO, IDRUBFERIASNORM, CODTIPRECADT13, '+#13+
          '  CODDESEMBPROV13, CODDESEMBDEV13, PLACONTADEVOL13, PLACTDEVOLPAT13, PLACTCPROVADT13, '+#13+
          '  PLACTDPROVADT13, RECPAGDESEMB, IDEMPRESADESEMB, PLACONTACADT13, IDEMPRESAALT, CODALTACRESCIMO, '+#13+
          '  CODTIPRECEBDEV13, CODTIPRECEBDEV, IDCONTRIBUICAO, IDPLANOPREV, IDEMPRESAPROP13, IDEMPRESAPROP, '+#13+
          '  RECPAGDEVOL, IDRUBRICA, CODTIPDESEMB13, CODTIPDESEMBCAR, INDICEREAJCONTRIB, PLACONTADRETRO, '+#13+
          '  PLACONTACRETRO, PLACONTAD13, CODCENTROCUSTODR, CODPORTFORMA, CODCENTROCUSTOCR, PLACONTAC13, '+#13+
          '  IDREGRACOBRANCA, TIPCODIGO, CODCENTROCUSTOD13, IDPESSOA, CODCENTROCUSTOC13, RECPAG13, '+#13+
          '  CODALTERADORJUROS, CODTIPDOC, CODSUBCONTA, TIPCODIGO13, CODTIPRECDES, IDREGRACALCULO, '+#13+
          '  CODCENTRORESPON, FLGPAGADOR, UNIDNEGOC, CODCENTROCUSTOD, RECPAG, IDEMPRESA, IDREGRACONVCOTAS, '+#13+
          '  FLGCOBRANCAPARCI, CODCENTROCUSTOC, NUMPRIORIDADE, PLACONTAD, IDEMPRESARETRO, IDEMPRESA13, '+#13+
          '  IDREGRAVALIDAOP1, PLANO, FLGACEITAOPCAO, PLANORETRO, PLACONTAC, IDREGRAVALIDAOP2, '+#13+
          '  IDREGRAVALIDAOP3, NUMOPCOES, IDRUBRICAATRASO, IDREGRACOBATRASO, IDRUBRICADEVOLUC, '+#13+
          '  FLGTOTAL, FLGJUROSATRASO, FLGCORRECAOATRASO, FLGJUROSDEVOL, FLGCORRECAODEVOL, '+#13+
          '  IDPLANOPAI, IDCONTRIBPAI, MESREFOPCAO, TEMPOOPCAO, IDREGRAPRIMPAGTO, IDREGRAULTPAGTO, '+#13+
          '  FLGOPCPC, NOMEVALORBASE1, NOMEVALORBASE2, NOMEVALORBASE3, CODALTERADORCORR, IDREGRACALCOP1, '+#13+
          '  IDREGRACALCOP2, IDREGRACALCOP3, ORDEMCALCULO, FLGDESCFOLHA, IDCONTRIBPAI2, IDCONTRIBPAI3, '+#13+
          '  FLGCOBRADECTERC, FLGINCIDEIR, IDRUBDECTERC, IDRUBDECTERCDEVOL, IDRUBDECTERCATRA, CODTIPRECDES13, '+#13+
          '  CODCENTRORESPON13, CODTIPDOC13, PLANO13, UNIDNEGOC13, CODSUBCONTA13, CODALTERAJUROS13, '+#13+
          '  CODALTERACORR13, CODPORTFORMA13, FLGINTERNO, FLGOBRIGAOP1, FLGOBRIGAOP2, FLGOBRIGAOP3, '+#13+
          '  FLGEDITAOP1, FLGEDITAOP2, FLGEDITAOP3, VLRACEITADIVERG, RECPAGRETRO, CODSUBCONTACRETRO, '+#13+
          '  CODSUBCONTADRETRO, FLGNORMAL, FLGNAOEXIGEREC, FLGCOBRA13DTFIM, IDREGRACALCULO13, CODTIPDESEMBDEVOL, '+#13+
          '  IDREGRAPRIMPGTO13, IDREGRAULTPGTO13, FLGDESCPRIM13, IDRUBACERTO, IDRUBACERTODECT, FLGSALPRORATA1PG, '+#13+
          '  TRGDTINCLUSAO, TRGUSERINCLUSAO, FLGCONTINGENCIA, CODCCUSTODEVOL '+#13+
          'FROM CONTPREV '+#13;

  sSql1 := '';

  If FIdPlanoPrev     >   0 Then sSql1 := sSql1 + ' IDPLANOPREV    = '+IntToStr(FIdPlanoPrev)     +' AND';
  If FIdContribuicao  >   0 Then sSql1 := sSql1 + ' IDCONTRIBUICAO = '+IntToStr(FIdContribuicao)  +' AND';

  If Trim(sSql1) <> '' Then
  Begin
    sSql := sSql + 'WHERE' + Copy(sSql1, 1, Length(sSql1)-4)
  End;

  Result := GetDataPacket( sSql );
end;


function TCtrlContPrev.ExisteContPrev : Boolean;
begin
  If ConnectionSide = cnsclient Then Begin
    Result := Connection.AppServer.ExisteContPrev;
  End
  Else
  Begin
    If FIdContribuicao > 0 Then FDbContPrev.Idcontribuicao.AsInteger := FIdContribuicao;
    If FIdPlanoPrev    > 0 Then FDbContPrev.Idplanoprev.AsInteger    := FIdPlanoPrev;

    CdsContPrev.Data := GetDataPacket( FDbContPrev.SSqlSelect );
    Result := Not CdsContPrev.IsEmpty;
  End;
end;

end.

