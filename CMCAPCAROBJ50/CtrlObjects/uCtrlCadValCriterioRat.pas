{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
{                                                       }
{*******************************************************}
Unit uCtrlCadValCriterioRat;

Interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, Classes, sysutils, wwQuery, provider, uMidasUtil,
  uDbValorCriRatOrc, uCMTypes;

Type
  TCtrlCadValCriterioRat = class(TCmControlObject)

  Protected

    Procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;

  Private
    _dbValorCriRatOrc  : TdbValorCriRatOrc;

    FIdEmpresa         : Integer;
    FCdsValorCriRatOrc : TClientDataSet;
    FUltimoRegistro    : LongInt;

    Procedure SetCdsValorCriRatOrc(const Value: TClientDataSet);
  Public

    Constructor Create; Override;
    Destructor  Destroy;Override;

    Function ListaCriterio : OleVariant;
    Function ListaExercicio( pIdPessoa,
                             pIdCriterio : Integer ) : OleVariant;
    Function ListaPeriodo( pIdPessoa,
                           pIdCriterio,
                           pExercicio   : Integer ) : OleVariant;

    Function ListaCentroDeCusto: OleVariant;
//    Function AbrePeriodo( pExercicio: integer ): Boolean;
    Function Procurar( pIdValorCriRatOrc : Double ) : OleVariant;
    Function AplicaOperacaoValorCriRatOrc : Boolean;
    Function GravarValCriterio( pIdValorCriRatOrc         : Double;
                                pSistemaIdEmpresa         : Integer;
                                pdblcExercicioLookUpValue,
                                pdblcPeriodoLookUpValue   : String;
                                pSistemaIdPessoa          : Integer;
                                pdblcCentCustLookUpValue,
                                pdblcCriterioLookUpValue  : String;
                                pdbrValorBaseValue        : Double ) : Boolean;

    Procedure VerificaDados( Var pMensagem                 : String;
                                 pdblcExercicioLookUpValue,
                                 pdblcPeriodoLookUpValue   : Integer;
                                 pdblcCentCustLookUpValue  : String;
                                 pdblcCriterioLookUpValue,
                                 pdbrValorBaseValue        : Double );


    Property IdEmpresa         : Integer        Read FIdEmpresa         Write FIdEmpresa;
    Property UltimoRegistro    : LongInt        Read FUltimoRegistro    Write FUltimoRegistro;
    Property CdsValorCriRatOrc : TClientDataSet Read FCdsValorCriRatOrc Write SetCdsValorCriRatOrc;
  End;

implementation

{ TCtrlCadValCriterioRat }
//************************************************
procedure TCtrlCadValCriterioRat.DoChangeDataBase;
begin
  inherited;

  _dbValorCriRatOrc.DatabaseName := DataBaseName;
end;
//************************************************
procedure TCtrlCadValCriterioRat.OnCreateAppServer;
begin
  inherited;

  FCdsValorCriRatOrc := TClientDataSet.Create( Nil );
end;
//************************************************
constructor TCtrlCadValCriterioRat.Create;
begin
  inherited;

  _DbValorCriRatOrc := TDbValorCriRatOrc.Create( Self );
end;
//************************************************
destructor TCtrlCadValCriterioRat.Destroy;
begin
  inherited;

  _DbValorCriRatOrc.Free;

  If ( isAppServer ) Then Begin

    FreeCds( [ FCdsValorCriRatOrc ] );
  End;
end;
//************************************************
procedure TCtrlCadValCriterioRat.SetCdsValorCriRatOrc(
  const Value: TClientDataSet);
begin

  FCdsValorCriRatOrc := Value;
end;
//************************************************
Function TCtrlCadValCriterioRat.ListaCriterio : OleVariant;
Var
  SqlLocal : TStringList;

Begin

  SqlLocal := TStringList.Create;

  Try
    SqlLocal.Add( 'SELECT DISTINCT' );
    SqlLocal.Add( '  IDCRITERIORATORC,' );
    SqlLocal.Add( '  DESCRICAO' );
    SqlLocal.Add( 'FROM' );
    SqlLocal.Add( '  CRITERIORATORC' );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( '  ( IDPESSOA   = ' + IntToStr( IdEmpresa ) + ' ) AND' );
    SqlLocal.Add( '  ( TIPORATEIO = ''M'')' );
    SqlLocal.Add( 'ORDER BY' );
    SqlLocal.Add( '  DESCRICAO' );

    Result := GetDataPacket( SqlLocal.Text );

  Finally

    SqlLocal.Free;
  End;
End;
//************************************************
Function TCtrlCadValCriterioRat.ListaExercicio( pIdPessoa,
                                                pIdCriterio : Integer ) : OleVariant;
Var
  SqlLocal : TStringList;

Begin

  SqlLocal := TStringList.Create;

  Try
    {
    SqlLocal.Add( 'SELECT DISTINCT' );
    SqlLocal.Add( '  EXERCICIO' );
    SqlLocal.Add( 'FROM' );
    SqlLocal.Add( '  CRITERIORATORC CO,' );
    SqlLocal.Add( '  PERIODOORCAMEN PO' );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( '  ( CO.IDPESSOA         = ' + IntToStr( pIdPessoa ) + ' ) AND' );
    SqlLocal.Add( '  ( CO.IDCRITERIORATORC = ' + IntToStr( pIdCriterio ) + ' ) AND' );
    SqlLocal.Add( '  ( PO.IDPESSOA         = PO.IDPESSOA )     AND' );
    SqlLocal.Add( '  ( PO.EXERCICIO        = CO.PEREXERCICIO ) AND' );
    SqlLocal.Add( '  ( ( PO.FLGBLOQUEADO = ''N'' ) OR ( PO.FLGBLOQUEADO IS NULL ) )' );
    SqlLocal.Add( 'ORDER BY' );
    SqlLocal.Add( '  EXERCICIO' );
    }
    SqlLocal.Add( 'SELECT DISTINCT' );
    SqlLocal.Add( '  EXERCICIO' );
    SqlLocal.Add( 'FROM' );
    SqlLocal.Add( '  PERIODOORCAMEN PO' );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( '  ( PO.IDPESSOA       = ' + IntToStr( pIdPessoa ) + ' ) AND' );
    SqlLocal.Add( '  ( ( PO.FLGBLOQUEADO = ''N'' ) OR ( PO.FLGBLOQUEADO IS NULL ) )' );
    SqlLocal.Add( 'ORDER BY' );
    SqlLocal.Add( '  EXERCICIO' );

    Result := GetDataPacket( SqlLocal.Text );

  Finally

    SqlLocal.Free;
  End;
End;
//************************************************
Function TCtrlCadValCriterioRat.ListaPeriodo( pIdPessoa,
                                              pIdCriterio,
                                              pExercicio   : Integer ) : OleVariant;

Var
  SqlLocal : TStringList;

Begin

  SqlLocal := TStringList.Create;

  Try
    {
    SqlLocal.Add( 'SELECT DISTINCT' );
    SqlLocal.Add( '  PO.PERIODO,' );
    SqlLocal.Add( '  PO.DATAINIPERIODO,' );
    SqlLocal.Add( '  PO.DATAFIMPERIODO,' );
    SqlLocal.Add( '  PO.NOMEPERIODO' );
    SqlLocal.Add( 'FROM' );
    SqlLocal.Add( '  CRITERIORATORC CO,' );
    SqlLocal.Add( '  PERIODOORCAMEN PO' );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( '  ( CO.IDPESSOA         = ' + IntToStr( pIdPessoa ) + ' )  AND' );
    SqlLocal.Add( '  ( CO.IDCRITERIORATORC = ' + IntToStr( pIdCriterio ) + ' ) AND' );
    SqlLocal.Add( '  ( CO.PEREXERCICIO     = ' + IntToStr( pExercicio ) + ' ) AND' );
    SqlLocal.Add( '  ( PO.IDPESSOA         = CO.IDPESSOA )     AND' );
    SqlLocal.Add( '  ( PO.EXERCICIO        = CO.PEREXERCICIO ) AND' );
    SqlLocal.Add( '  ( PO.PERIODO         =  CO.PERNUMERO )    AND' );
    SqlLocal.Add( '  ( (PO.FLGBLOQUEADO = ''N'') OR ( PO.FLGBLOQUEADO IS NULL ) )' );
    SqlLocal.Add( 'ORDER BY' );
    SqlLocal.Add( '  PO.PERIODO' );
    }
    SqlLocal.Add( 'SELECT DISTINCT' );
    SqlLocal.Add( '  PO.PERIODO,' );
    SqlLocal.Add( '  PO.DATAINIPERIODO,' );
    SqlLocal.Add( '  PO.DATAFIMPERIODO,' );
    SqlLocal.Add( '  PO.NOMEPERIODO' );
    SqlLocal.Add( 'FROM' );
    SqlLocal.Add( '  PERIODOORCAMEN PO' );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( '  ( PO.IDPESSOA      = ' + IntToStr( pIdPessoa ) + ' )  AND' );
    SqlLocal.Add( '  ( PO.EXERCICIO     = ' + IntToStr( pExercicio ) + ' ) AND' );
    SqlLocal.Add( '  ( (PO.FLGBLOQUEADO = ''N'') OR ( PO.FLGBLOQUEADO IS NULL ) )' );
    SqlLocal.Add( 'ORDER BY' );
    SqlLocal.Add( '  PO.PERIODO' );
    Result := GetDataPacket( SqlLocal.Text );

  Finally

    SqlLocal.Free;
  End;
End;
//************************************************
Function TCtrlCadValCriterioRat.ListaCentroDeCusto : OleVariant;
Var
  SqlLocal : TStringList;

Begin

  SqlLocal := TStringList.Create;

  Try
    SqlLocal.Add( 'SELECT' );
    SqlLocal.Add( '  CODCENTROCUSTO,' );
    SqlLocal.Add( '  NOME,' );
    SqlLocal.Add( '  IDEMPRESA' );
    SqlLocal.Add( 'FROM' );
    SqlLocal.Add( '  CENTCUST' );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( '  ( IDEMPRESA = ' + IntToStr( IdEmpresa ) + ' ) AND' );
    SqlLocal.Add( '  ( ATIVO     = ''S'') ' );
    SqlLocal.Add( 'ORDER BY' );
    SqlLocal.Add( '  NOME' );

    Result := GetDataPacket( SqlLocal.Text );

  Finally

    SqlLocal.Free;
  End;
End;
//************************************************
{
Function TCtrlCadValCriterioRat.AbrePeriodo( pExercicio : integer ) : Boolean;
Var
  SqlLocal : TStringList;

Begin

  SqlLocal := TStringList.Create;

  Try
    SqlLocal.Add( 'SELECT' );
    SqlLocal.Add( '  PERIODO,' );
    SqlLocal.Add( '  DATAINIPERIODO,' );
    SqlLocal.Add( '  DATAFIMPERIODO,' );
    SqlLocal.Add( '  FLGBLOQUEADO' );
    SqlLocal.Add( 'FROM' );
    SqlLocal.Add( '  PERIODOORCAMEN' );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( '  EXERCICIO = ' + IntToStr( pExercicio ) + ' ) AND' );
    SqlLocal.Add( '  IDPESSOA  = ' + IntToStr( IdEmpresa ) + ' )' );
    SqlLocal.Add( 'ORDER BY' );
    SqlLocal.Add( '  PERIODO' );

    Result := GetDataPacket( SqlLocal.Text );

  Finally

    SqlLocal.Free;
  End;
End;
}
//************************************************
Function TCtrlCadValCriterioRat.Procurar( pIdValorCriRatOrc : Double ) : OleVariant;
Begin

  _dbValorCriRatOrc.IdValorCriRatOrc.AsFloat := pIdValorCriRatOrc;
  Result := GetDataPacket( _dbValorCriRatOrc.SSqlSelect );
End;
//************************************************
Function TCtrlCadValCriterioRat.AplicaOperacaoValorCriRatOrc : Boolean;
Begin
  If ( ConnectionSide = cnsClient ) Then Begin

    Result := Connection.AppServer.AplicaOperacaoValorCriRatOrc( FCdsValorCriRatOrc.Data );

    If ( Not Result ) Then MessageInfo := Connection.AppServer.MessageInfo;

  End Else Begin
    MessageInfo := '';
    Try
      StartTransaction;
      Result := ApplyCDS(FCdsValorCriRatOrc,_DbValorCriRatOrc,[],[]);

      If ( Not Result ) Then Begin
        MessageInfo := _DbValorCriRatOrc.MessageInfo;
        Abort;
      End Else
        Commit;

        UltimoRegistro := _DbValorCriRatOrc.Idvalorcriratorc.AsInteger;
    Except
      On E:Exception Do Begin
        Result := False;
        Rollback;
        MessageInfo := MessageInfo + E.Message;
      End;
    End;
  End;
End;
//************************************************
Procedure TCtrlCadValCriterioRat.VerificaDados( Var pMensagem                 : String;
                                                    pdblcExercicioLookUpValue,
                                                    pdblcPeriodoLookUpValue   : Integer;
                                                    pdblcCentCustLookUpValue  : String;
                                                    pdblcCriterioLookUpValue,
                                                    pdbrValorBaseValue        : Double );
Begin

  With CdsValorCriRatOrc Do Begin

    If      ( pdblcExercicioLookUpValue = 0 )         Then pMensagem := 'Selecione algum EXERCÍCIO'
    Else If ( pdblcPeriodoLookUpValue = 0 )           Then pMensagem := 'Selecione algum PERÍODO'
    Else If ( Trim( pdblcCentCustLookUpValue ) = '' ) Then pMensagem := 'Selecione algum CENTRO DE CUSTO'
    Else If ( pdblcCriterioLookUpValue = 0 )          Then pMensagem := 'Selecione algum CRITÉRIO'
    Else If ( pdbrValorBaseValue < 0.01 )             Then pMensagem := 'Informe algum VALOR BASE';
  End;
End;
//************************************************
Function  TCtrlCadValCriterioRat.GravarValCriterio( pIdValorCriRatOrc         : Double;
                                                    pSistemaIdEmpresa         : Integer;
                                                    pdblcExercicioLookUpValue,
                                                    pdblcPeriodoLookUpValue   : String;
                                                    pSistemaIdPessoa          : Integer;
                                                    pdblcCentCustLookUpValue,
                                                    pdblcCriterioLookUpValue  : String;
                                                    pdbrValorBaseValue        : Double ) : Boolean;
Var
  SqlLocal : TStringList;

Begin

  Result := False;

  If ( ConnectionSide = cnsClient ) Then Begin

    Result := Connection.AppServer.GravarValCriterio( pIdValorCriRatOrc,
                                                      pSistemaIdEmpresa,
                                                      pdblcExercicioLookUpValue,
                                                      pdblcPeriodoLookUpValue,
                                                      pSistemaIdPessoa,
                                                      pdblcCentCustLookUpValue,
                                                      pdblcCriterioLookUpValue,
                                                      pdbrValorBaseValue );
    MessageInfo := Connection.AppServer.MessageInfo;

  End Else Begin
    MessageInfo := '';
    SqlLocal := TStringList.Create;
    Try
      StartTransaction;

      SqlLocal.Add( 'UPDATE VALORCRIRATORC' );
      SqlLocal.Add( 'SET' );
      SqlLocal.Add( '  VLRCRIRATORC      = ' + FloatToStr( pdbrValorBaseValue ) + ',' );
      SqlLocal.Add( '  IDEMPRESA         = ' + IntToStr(   pSistemaIdEmpresa  ) + ',' );
      SqlLocal.Add( '  CODCENTROCUSTO    = ' + QuotedStr( pdblcCentCustLookUpValue )  );
      SqlLocal.Add( 'WHERE' );
      SqlLocal.Add( '  IDPESSOA          = ' + IntToStr(   pSistemaIdPessoa   ) + ' AND' );
      SqlLocal.Add( '  IDCRITERIORATORC  = ' + pdblcCriterioLookUpValue         + ' AND' );
      SqlLocal.Add( '  EXERCICIO         = ' + pdblcExercicioLookUpValue        + ' AND' );
      SqlLocal.Add( '  PERIODO           = ' + pdblcPeriodoLookUpValue );

      Result := ExecSql( SqlLocal.Text, True );

      If ( Not Result ) Then Begin
        // Não existe o registro vamos incluir
        SqlLocal.Clear;
        SqlLocal.Add( 'INSERT INTO' );
        SqlLocal.Add( '  VALORCRIRATORC' );
        SqlLocal.Add( '  ( VLRCRIRATORC, IDEMPRESA,        CODCENTROCUSTO,' );
        SqlLocal.Add( '    IDPESSOA,     IDCRITERIORATORC, EXERCICIO,' );
        SqlLocal.Add( '    PERIODO,      IDVALORCRIRATORC )' );
        SqlLocal.Add( '  VALUES' );
        SqlLocal.Add( '  ( ' + FloatToStr( pdbrValorBaseValue ) + ',' );
        SqlLocal.Add( '    ' + IntToStr(   pSistemaIdEmpresa  ) + ',' );
        SqlLocal.Add( '    ' + QuotedStr( pdblcCentCustLookUpValue ) + ',' );
        SqlLocal.Add( '    ' + IntToStr(   pSistemaIdPessoa   ) + ',' );
        SqlLocal.Add( '    ' + pdblcCriterioLookUpValue         + ',' );
        SqlLocal.Add( '    ' + pdblcExercicioLookUpValue        + ',' );
        SqlLocal.Add( '    ' + pdblcPeriodoLookUpValue          + ',' );
        SqlLocal.Add( '    ' + FloatToStr( GetSequence( 'VALORCRIRATORC' ) ) + ' )');
        Result := ExecSql( SqlLocal.Text, True );
      End;
      Commit;
      MessageInfo := 'Dados gravados';
    Except
      On E : Exception Do Begin
        RollBack;
        MessageInfo := E.Message;
      End;
    End;
    SqlLocal.Free;
  End;
End;
//************************************************
End.

