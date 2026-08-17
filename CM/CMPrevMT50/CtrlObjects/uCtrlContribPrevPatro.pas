unit uCtrlContribPrevPatro;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDbContribPrevPatro;

Type

  TCtrlContribPrevPatro = class(TCmControlObject)
  private
    DbContribPrevPatro    : TDbContribPrevPatro;
    fCdsContribPrevPatro  : TCMClientDataSet;
    fCdsCobraContribuicao : TCMClientDataSet;

    fIdPessoa    : Integer;
    fIdPlanoPrev : Integer;

    procedure SetCdsContribPrevPatro(const Value: TCMClientDataSet);
  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    function ListaMestre           : OleVariant;
    function ListaContribPrevPatro : OleVariant;
    function ListaContribuicao     : OleVariant;
    function ListaPortForma        : OleVariant;
    function ListaPeriodicidade    : OleVariant;
    
    function CobraContribuicao( piIdContribuicao : Integer) : Boolean;

    function Exclui_HstAtrasoContrib( piIdContribuicao : Integer) : Boolean;
    function Exclui_HstContribPrev( piIdContribuicao : Integer) : Boolean;

    function GravaContribPrevPatro : Boolean;

    property CdsContribPrevPatro : TCMClientDataSet read fCdsContribPrevPatro write SetCdsContribPrevPatro;
    property IdPessoa            : Integer          read fIdPessoa            write fIdPessoa;
    property IdPlanoPrev         : Integer          read fIdPlanoPrev         write fIdPlanoPrev;
  published

end;

implementation

{ TCtrlBenefBfciario }

constructor TCtrlContribPrevPatro.Create;
begin
  inherited;
  fCdsContribPrevPatro  := TCMClientDataSet.Create(Nil);
  fCdsCobraContribuicao := TCMClientDataSet.Create(Nil);

  DbContribPrevPatro    := TDbContribPrevPatro.Create(Self);
end;

destructor TCtrlContribPrevPatro.Destroy;
begin
  fCdsContribPrevPatro.Free;
  fCdsCobraContribuicao.Free;

  DbContribPrevPatro.Free;
  
  inherited;
end;

procedure TCtrlContribPrevPatro.DoChangeDataBase;
begin
  inherited;
  DbContribPrevPatro.DataBaseName := Self.DataBaseName;
end;

procedure TCtrlContribPrevPatro.SetCdsContribPrevPatro(const Value: TCMClientDataSet);
begin
  fCdsContribPrevPatro := Value;
end;

function TCtrlContribPrevPatro.GravaContribPrevPatro : Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarContribPrevPatro( CdsContribPrevPatro.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsContribPrevPatro, DbContribPrevPatro, [], [] );

      Msg := DbContribPrevPatro.MessageInfo;

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

Function TCtrlContribPrevPatro.ListaMestre: OleVariant;
Var sSQL : String;
Begin
  Result := 0;

  If ConnectionSide = cnsclient Then
  Begin
    Result := Connection.AppServer.ListaMestre;
  End
  Else
  Begin
    sSQL := ' SELECT ' + #13 +
            '    P.NOME  AS PATROCINADORA, ' + #13 +
            '    PL.IDPLANOPREV, PL.NOME ' + #13 +
            ' FROM ' + #13 +
            '    PESSOA P, ' + #13 +
            '    PATRO PA, ' + #13 +
            '    PLANPREV PL, ' + #13 +
            '    PLANPREVPATRO PP ' + #13 +
            ' WHERE ( P.IDPESSOA     = ' + IntToStr(fIdPessoa)    + ' ) ' + #13 +
            '   AND ( PL.IDPLANOPREV = ' + IntToStr(fIdPlanoPrev) + ' ) ' + #13 +
            '   AND ( P.IDPESSOA     = PA.IDPESSOA    ) ' + #13 +
            '   AND ( PP.IDPLANOPREV = PL.IDPLANOPREV ) ' + #13 +
            '   AND ( PP.IDPESSJUR   = PA.IDPESSOA    ) ';

    Result := GetDataPacket( sSQL );
  End;
End;


function TCtrlContribPrevPatro.ListaContribPrevPatro: OleVariant;
Var sSQL : String;
Begin
  Result := 0;

  If ConnectionSide = cnsclient Then
  Begin
    Result := Connection.AppServer.ListaContribPrevPatro;
  End
  Else
  Begin
    sSQL := ' SELECT C.NOME                , CPP.IDPESSOA          , ' + #13 +
            '        CPP.IDPLANOPREV       , CPP.IDCONTRIBUICAO    , ' + #13 +
            '        CPP.IDEMPRESAPROP13   , CPP.IDPLANPREVCONTAB  , ' + #13 +
            '        CPP.CODCCUSTODEVOL    , CPP.IDEMPRESAPROP     , ' + #13 +
            '        CPP.PLACONTADEVOL     , CPP.RECPAG            , ' + #13 +
            '        CPP.UNIDNEGOC         , CPP.IDTPPERIODICIDADE , ' + #13 +
            '        CPP.CODTIPRECDES      , CPP.CODTIPDOC13       , ' + #13 +
            '        CPP.TIPCODIGO         , ' + #13 +
            '        CPP.CODCENTRORESPON   , CPP.CODTIPRECDES13    , ' + #13 +
            '        CPP.RECPAG13          , CPP.IDEMPRESA         , ' + #13 +
            '        CPP.CODCENTROCUSTOD13 , CPP.PLANO             , ' + #13 +
            '        CPP.CODCENTROCUSTOC13 , CPP.CODSUBCONTA       , ' + #13 +
            '        CPP.PLACONTAD13       , CPP.PLACONTAC         , ' + #13 +
            '        CPP.PLACONTAC13       , CPP.CODPORTFORMA      , ' + #13 +
            '        CPP.PLACONTAD         , CPP.CODCENTROCUSTOC   , ' + #13 +
            '        CPP.CODCENTROCUSTOD   , CPP.DIAVENCIMENTO     , ' + #13 +
            '        CPP.VALORBASE1        , CPP.VALORBASE2        , ' + #13 +
            '        CPP.VALORBASE3        , CPP.DATAINICIO        , ' + #13 +
            '        CPP.IDEMPRESA13       , CPP.DATAFINAL         , ' + #13 +
            '        CPP.FLGCOBRA          , CPP.QTDEPARCELAS      , ' + #13 +
            '        CPP.ULTMESPREPARO     , CPP.PLANO13           , ' + #13 +
            '        CPP.TIPCODIGO13       , CPP.CODPORTFORMA13    , ' + #13 +
            '        CPP.UNIDNEGOC13       , ' + #13 +
            '        CPP.CODSUBCONTA13     , CPP.CODCENTRORESPON13 , ' + #13 +
            '        CPP.CODTIPDOC         , TP.NOME AS PERIODPADRAO , ' + #13 +
            '        TP.QTDEMESES          , CP.FLGPAGADOR  , ' + #13 +
            '        CP.NUMOPCOES          , CP.FLGACEITAOPCAO, ' + #13 +
            '        TP2.NOME AS PERIODICIDADE ' + #13 +
            ' FROM CONTRIBPREVPATRO CPP,CONTPREV CP, CONTRIBUICAO C, ' + #13 +
            '      TPPERIODICIDADE TP, TPPERIODICIDADE TP2 ' + #13 +
            ' WHERE ( CPP.IDPESSOA          = ' + IntToStr(fIdPessoa)    + ' ) ' + #13 +
            '   AND ( CPP.IDPLANOPREV       = ' + IntToStr(fIdPlanoPrev) + ' ) ' + #13 +
            '   AND ( CP.IDPLANOPREV        = CPP.IDPLANOPREV ) ' + #13 +
            '   AND ( CP.IDCONTRIBUICAO     = CPP.IDCONTRIBUICAO ) ' + #13 +
            '   AND ( CP.IDCONTRIBUICAO     = C.IDCONTRIBUICAO ) ' + #13 +
            '   AND ( CPP.IDTPPERIODICIDADE = TP2.IDTPPERIODICIDADE(+) ) ' + #13 +
            '   AND ( C.IDTPPERIODICIDADE   = TP.IDTPPERIODICIDADE(+) ) ';

    Result := GetDataPacket( sSQL );
  End;
end;

function TCtrlContribPrevPatro.ListaContribuicao: OleVariant;
Var sSQL : String;
Begin
  Result := 0;

  If ConnectionSide = cnsclient Then
  Begin
    Result := Connection.AppServer.ListaContribuicao;
  End
  Else
  Begin
    sSQL := ' SELECT   C.IDCONTRIBUICAO , C.IDTPPERIODICIDADE, ' + #13 +
            '          C.NOME           , C.QTDEPARCELAS, ' + #13 +
            '          C.FLGOBRIGATORIA , ' + #13 +
            '          C.NOMERESUM, ' + #13 +
            '          C.FLGRISCO, ' + #13 +
            '          CP.FLGACEITAOPCAO, CP.NUMOPCOES, ' + #13 +
            '          CP.IDREGRAVALIDAOP1 ,CP.IDREGRAVALIDAOP2, ' + #13 +
            '          CP.IDREGRAVALIDAOP3 ' + #13 +
            ' FROM CONTRIBUICAO C, CONTPREV CP ' + #13 +
            ' WHERE ( CP.IDPLANOPREV    = ' + IntToStr(fIdPlanoPrev) + ' ) ' + #13 +
            '   AND ( CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO ) ' + #13 +
            '   AND ( CP.FLGPAGADOR     = ''E'' ) ' + #13 +
            ' ORDER BY C.NOME ';

    Result := GetDataPacket( sSQL );
  End;
end;

function TCtrlContribPrevPatro.ListaPortForma: OleVariant;
Var sSQL : String;
Begin
  Result := 0;

  If ConnectionSide = cnsclient Then
  Begin
    Result := Connection.AppServer.ListaPortForma;
  End
  Else
  Begin
    sSQL := ' SELECT CODPORTFORMA, DESCRICAO, RECPAG ' + #13 +
            ' FROM PORTADORFORMA ' + #13 +
            ' WHERE RECPAG = ''R'' ' + #13 +
            ' ORDER BY DESCRICAO ';

    Result := GetDataPacket( sSQL );
  End;
end;

function TCtrlContribPrevPatro.ListaPeriodicidade: OleVariant;
Var sSQL : String;
Begin
  Result := 0;

  If ConnectionSide = cnsclient Then
  Begin
    Result := Connection.AppServer.ListaPeriodicidade;
  End
  Else
  Begin
    sSQL := ' SELECT IDTPPERIODICIDADE,NOME,QTDEMESES ' + #13 +
            ' FROM TPPERIODICIDADE ' + #13 +
            ' ORDER BY NOME ';

    Result := GetDataPacket( sSQL );
  End;
end;

function TCtrlContribPrevPatro.CobraContribuicao( piIdContribuicao : Integer): Boolean;
Var sSQL : String;
Begin
  If ConnectionSide = cnsclient Then
  Begin
    Result := Connection.AppServer.ListaCobraContribuicao( piIdContribuicao );
  End
  Else
  Begin
    sSQL := ' SELECT NUMRECEBIMENTO ' + #13 +
            ' FROM  HSTCONTRIBPREV ' + #13 +
            ' WHERE ( IDPLANOPREV    = ' + IntToStr(fIdPlanoPrev)     + ' ) ' + #13 +
            '   AND ( IDPESSOA       = ' + IntToStr(fIdPessoa)        + ' ) ' + #13 +
            '   AND ( IDCONTRIBUICAO = ' + IntToStr(piIdContribuicao) + ' ) ' + #13 +
            '   AND ( SITRECEBIMENTO = ''0'' ) ';

    fCdsCobraContribuicao.Data := GetDataPacket( sSQL );

    Result := fCdsCobraContribuicao.IsEmpty;
  End;
end;

function TCtrlContribPrevPatro.Exclui_HstAtrasoContrib(piIdContribuicao: Integer): Boolean;
Var sSQL : String;
Begin
  Result := True;

  If ConnectionSide = cnsclient Then
  Begin
    Result := Connection.AppServer.Exclui_HstAtrasoContrib( piIdContribuicao );
  End
  Else
  Begin
    sSQL := ' DELETE FROM HSTATRASOCONTRIB ' + #13 +
            ' WHERE NUMRECEBIMENTO IN  ' + #13 +
            '       ( SELECT NUMRECEBIMENTO ' + #13 +
            '         FROM   HSTCONTRIBPREV ' + #13 +
            '         WHERE ( IDPLANOPREV    = ' + IntToStr(fIdPlanoPrev)     + ' ) ' + #13 +
            '           AND ( IDPESSOA       = ' + IntToStr(fIdPessoa)        + ' ) ' + #13 +
            '           AND ( IDCONTRIBUICAO = ' + IntToStr(piIdContribuicao) + ' ) ' + #13 +
            '           AND ( SITRECEBIMENTO = ''0'' ) ) ';

    Try
      ExecSQL( sSQL );
    Except
      Result := False;
    End;
  End;
end;

function TCtrlContribPrevPatro.Exclui_HstContribPrev(piIdContribuicao: Integer): Boolean;
Var sSQL : String;
Begin
  Result := True;

  If ConnectionSide = cnsclient Then
  Begin
    Result := Connection.AppServer.Exclui_HstContribPrev( piIdContribuicao );
  End
  Else
  Begin
    sSQL := ' DELETE FROM HSTCONTRIBPREV ' +  #13 +
            ' WHERE ( IDPLANOPREV    = ' + IntToStr(fIdPlanoPrev)     + ' ) ' + #13 +
            '   AND ( IDPESSOA       = ' + IntToStr(fIdPessoa)        + ' ) ' + #13 +
            '   AND ( IDCONTRIBUICAO = ' + IntToStr(piIdContribuicao) + ' ) ' + #13 +
            '   AND ( SITRECEBIMENTO = ''0'' ) ' ;

    Try
      ExecSQL( sSQL );
    Except
      Result := False;
    End;
  End;
end;

end.

