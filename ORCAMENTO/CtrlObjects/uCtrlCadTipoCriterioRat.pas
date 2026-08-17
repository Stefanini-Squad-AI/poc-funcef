{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
{                                                       }
{*******************************************************}
Unit uCtrlCadTipoCriterioRat;

Interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, sysutils, wwQuery, provider,
  uMidasUtil, Classes, uDbCriterioRatOrc, uDbDataView, uCMTypes;

Type
  TCtrlCadTipoCriterioRat = class( TCmControlObject )

  Protected

    Procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;

  Private
    _dBCriterioRatOrc      : TDbCriterioRatOrc;
    _dBDataView            : TDbDataView;

    FIdEmpresa             : Integer;
    
    FCdsCadTipoCriterioRat : TClientDataSet;
    FCdsDataView           : TClientDataSet;

    Procedure SetCdsCadTipoCriterioRat( Const Value : TClientDataSet );
    Procedure SetCdsDataView( Const Value : TClientDataSet );
  Public
    constructor Create; Override;
    destructor Destroy; override;

    Function Exemplo( pExemplo : String ) : String;
    Function Procura( pIdCriterioRatOrc : Double) : OleVariant;
    Function ProcuraDataView( pIdDataView : Double ) : OleVariant;
    Function ListaExercicio : OleVariant;
    Function ListaPeriodo( pExercicio : Integer ) : OleVariant;
    Function AplicaOperacaoCadTipoCriterioRatGravar : Boolean;
    Function AplicaOperacaoCadTipoCriterioRatDeleta : Boolean;
    Function AtualizaDataView : Boolean;
    Function DeletaDataView : Boolean;
    Function UltimaSequence: Integer;

    property IdEmpresa             : Integer        Read FIdEmpresa       Write FIdEmpresa;
    Property CdsCadTipoCriterioRat : TClientDataSet Read FCdsCadTipoCriterioRat Write SetCdsCadTipoCriterioRat;
    Property CdsDataView           : TClientDataSet Read FCdsDataView           Write SetCdsDataView;
  End;

Implementation
//************************************************
Procedure TCtrlCadTipoCriterioRat.OnCreateAppServer;
Begin
  Inherited;

  FCdsCadTipoCriterioRat := TClientDataSet.Create( Nil );
  FCdsDataView           := TClientDataSet.Create( Nil );

End;
//************************************************
Procedure TCtrlCadTipoCriterioRat.DoChangeDataBase;
Begin
  Inherited;

  _dbCriterioRatOrc.DatabaseName := DataBaseName;
  _dbDataView.DatabaseName       := DataBaseName;
End;
//************************************************
Constructor TCtrlCadTipoCriterioRat.Create;
Begin
  Inherited;

  _DbCriterioRatOrc := TDbCriterioRatOrc.Create( Self );
  _DbDataView       := TDbDataView.Create( Self );
End;
//************************************************
Destructor TCtrlCadTipoCriterioRat.Destroy;
Begin
  Inherited;

  _DbCriterioRatOrc.Free;
  _DbDataView.Free;

  If ( isAppServer ) Then Begin

    FreeCds( [ FCdsCadTipoCriterioRat, FCdsDataView ] );
  End;
End;
//************************************************
Function TCtrlCadTipoCriterioRat.Exemplo( pExemplo : String ) : String;
Begin

  If ( pExemplo = '0' ) Then Begin

    Result := 'Exemplo 1)' + #13 +
              '    SELECT' + #13 +
              '        COUNT(*) AS VALOR ' + #13 +
              '    FROM' + #13 +
              '        FUNCIONARIO ' + #13 +
              '    WHERE' + #13 +
              '      ( CODCENTROCUSTO = :CODCENTROCUSTO ) AND' + #13 +
              '      ( IDEMPRESA      = :IDEMPRESA)' + #13 +
              ' ' + #13 +
              'Exemplo 2)' + #13 +
              '    SELECT' + #13 +
              '        SUM(R.VALOR) AS VALOR ' + #13 +
              '    FROM' + #13 +
              '        DOCUMENTO D,' + #13 +
              '        RATEIODOCUM R '+#13+
              '    WHERE' + #13 +
              '        ( D.CODDOCUMENTO   = R.CODDOCUMENTO ) AND' + #13 +
              '        ( D.RECPAG         = ''P'') AND ' + #13 +
              '        ( TO_CHAR(D.DATAPROGRAMADA,''YYYYMM'') = :ANOMES) AND ' + #13 +
              '        ( R.CODCENTROCUSTO = :CODCENTROCUSTO) AND ' + #13 +
              '        ( R.IDEMPRESA      = :IDEMPRESA)';

  End Else If ( pExemplo = '1' ) Then Begin

    Result := 'SELECT' + #13 +
              '    COUNT(*) AS VALOR ' + #13 +
              'FROM' + #13 +
              '    FUNCIONARIO ' + #13 +
              'WHERE' + #13 +
              '  ( CODCENTROCUSTO = :CODCENTROCUSTO ) AND' + #13 +
              '  ( IDEMPRESA      = :IDEMPRESA)';

  End Else If ( pExemplo = '2' ) Then Begin

    Result := 'SELECT' + #13 +
              '    SUM(R.VALOR) AS VALOR ' + #13 +
              'FROM' + #13 +
              '    DOCUMENTO D,' + #13 +
              '    RATEIODOCUM R '+#13+
              'WHERE' + #13 +
              '    ( D.CODDOCUMENTO   = R.CODDOCUMENTO ) AND' + #13 +
              '    ( D.RECPAG         = ''P'') AND ' + #13 +
              '    ( TO_CHAR(D.DATAPROGRAMADA,''YYYYMM'') = :ANOMES) AND ' + #13 +
              '    ( R.CODCENTROCUSTO = :CODCENTROCUSTO) AND ' + #13 +
              '    ( R.IDEMPRESA      = :IDEMPRESA)';
  End;
End;
//************************************************
Procedure TCtrlCadTipoCriterioRat.SetCdsCadTipoCriterioRat( Const Value: TClientDataSet );
Begin

  FCdsCadTipoCriterioRat := Value;
End;
//************************************************
Procedure TCtrlCadTipoCriterioRat.SetCdsDataView( Const Value: TClientDataSet );
begin

  FCdsDataView := Value;
End;
//************************************************
Function TCtrlCadTipoCriterioRat.Procura( pIdCriterioRatOrc : Double ) : OleVariant;
Begin

  _dbCriterioRatOrc.IdCriterioRatOrc.AsFloat := pIdCriterioRatOrc;
  Result := GetDataPacket( _dbCriterioRatOrc.SSqlSelect );
End;
//************************************************
Function TCtrlCadTipoCriterioRat.ProcuraDataView( pIdDataView : Double ) : OleVariant;
Begin

  _dBDataView.Iddataview.AsInteger := Trunc( pIdDataView );
  _dBDataView.Origemcmdv.AsInteger := 0;

  Result := GetDataPacket( _dbdataview.SSqlSelect );
End;
//************************************************
Function TCtrlCadTipoCriterioRat.ListaExercicio : OleVariant;
Var
  SqlLocal : TStringList;

Begin

  SqlLocal := TStringList.Create;

  Try
    SqlLocal.Add( 'SELECT DISTINCT' );
    SqlLocal.Add( '  PEREXERCICIO' );
    SqlLocal.Add( 'FROM' );
    SqlLocal.Add( '  PERIODO' );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( '  ( IDPESSOA     = ' + IntToStr( IdEmpresa ) + ' ) ' );
    SqlLocal.Add( 'ORDER BY' );
    SqlLocal.Add( '  PEREXERCICIO' );

    Result := GetDataPacket( SqlLocal.Text );

  Finally

    SqlLocal.Free;
  End;
End;
//************************************************
Function TCtrlCadTipoCriterioRat.ListaPeriodo( pExercicio : Integer ) : OleVariant;
Var
  SqlLocal : TStringList;

Begin

  SqlLocal := TStringList.Create;

  Try
    SqlLocal.Add( 'SELECT' );
    SqlLocal.Add( '  PEREXERCICIO,' );
    SqlLocal.Add( '  PERNUMERO,' );
    SqlLocal.Add( '  PERNOME,' );
    SqlLocal.Add( '  PERNOME AS NOMEPERIODO' );
    SqlLocal.Add( 'FROM' );
    SqlLocal.Add( '  PERIODO' );
    SqlLocal.Add( 'WHERE' );
    SqlLocal.Add( '  ( IDPESSOA     = ' + IntToStr( IdEmpresa ) + ' ) AND ' );
    SqlLocal.Add( '  ( PEREXERCICIO = ' + IntToStr( pExercicio ) + ' ) ' );
    SqlLocal.Add( 'ORDER BY' );
    SqlLocal.Add( '  PERNUMERO' );

    Result := GetDataPacket( SqlLocal.Text );

  Finally

    SqlLocal.Free;
  End;
End;
//************************************************
Function TCtrlCadTipoCriterioRat.AplicaOperacaoCadTipoCriterioRatGravar : Boolean;
Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Result := Connection.AppServer.AplicaOperacaoCadTipoCriterioRatGravar( FCdsCadTipoCriterioRat.Data,
                                                                  FCdsDataView.Data );

    If ( Not Result ) Then Begin

      MessageInfo := Connection.AppServer.MessageInfo;
    End;
  End Else Begin

    MessageInfo := '';
    Try
      StartTransaction;

      Result := ApplyCDS( FCdsDataView, _DbDataView, [], []);

      If ( Not Result ) Then Begin

        MessageInfo := _DbDataView.MessageInfo;
        Abort;

      End Else Begin

        CdsCadTipoCriterioRat.Edit;
        CdsCadTipoCriterioRat.FieldByName( 'IDDATAVIEW' ).AsInteger := _DbDataView.IdDataView.AsInteger;
        CdsCadTipoCriterioRat.FieldByName( 'ORIGEMCMDV' ).AsInteger := 0;
        CdsCadTipoCriterioRat.Post;

        Result := ApplyCDS( FCdsCadTipoCriterioRat, _DbCriterioRatOrc, [], [] );

        If ( Not Result ) Then Begin

          MessageInfo := _DbCriterioRatOrc.MessageInfo;
          Abort;
        End;

        Commit;
      End;
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
Function TCtrlCadTipoCriterioRat.AplicaOperacaoCadTipoCriterioRatDeleta: Boolean;
Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Result := Connection.AppServer.AplicaOperacaoCadTipoCriterioRatDeleta( FCdsCadTipoCriterioRat.Data,
                                                                           FCdsDataView.Data );
    If ( Not Result ) Then Begin

      MessageInfo := Connection.AppServer.MessageInfo;
    End;
  End Else Begin

    MessageInfo := '';
    Try
      StartTransaction;

      Result := ApplyCDS( FCdsCadTipoCriterioRat, _DbCriterioRatOrc, [], [] );

      If ( Not Result ) Then Begin

        MessageInfo := _DbDataView.MessageInfo;
        Abort;

      End Else Begin

        Result := ApplyCDS( CdsDataView , _DbDataView, [], []);

        If ( Not Result ) Then Begin

          MessageInfo := _DbCriterioRatOrc.MessageInfo;
          Abort;
        End;

        Commit;
      End;
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
Function TCtrlCadTipoCriterioRat.AtualizaDataView : Boolean;
Begin

  Try
    CdsDataView.Edit;
    CdsDataView.FieldByName( 'ORIGEMCMDV' ).AsInteger := 0;
    CdsDataView.FieldByName( 'NAME' ).asString        := CdsCadTipoCriterioRat.FieldByName( 'DESCRICAO' ).AsString;
    CdsDataView.FieldByName( 'CLASSNAME' ).asString   := 'Orçamento';
    CdsDataView.FieldByName( 'DESCRIPTION' ).asString := 'Pesquisa para Critérios de Rateio do Orçamento - ' +
                                                         CdsDataView.FieldByName('TEMPLATE').asString;

    If ( CdsDataView.FieldByName( 'TEMPLATE' ).asString = '' ) Then Begin

      CdsDataView.FieldByName( 'TEMPLATE' ).asString := ' ';
    End;

    CdsDataView.Post;

    Result := True;
  Except

    Result := False;
  End;
End;
//************************************************
Function TCtrlCadTipoCriterioRat.DeletaDataView : Boolean;
Begin
  Try
    If ( Not CdsDataView.EOF ) Then Begin

      CdsDataView.Delete;
    End;

    Result := True;
  Except

    Result := False;
  End;
End;
//************************************************
Function TCtrlCadTipoCriterioRat.UltimaSequence : Integer;
Begin
  Result := GetSequence( 'DATAVIEW' );
End;
//************************************************
End.
