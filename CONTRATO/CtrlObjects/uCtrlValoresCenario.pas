{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
{                                                       }
{*******************************************************}
Unit uCtrlValorescenario;

interface

Uses
  DB,           uDataBase,        uCmControlObject, dbclient,          uMidasUtil, sysutils,
  Classes,      wwQuery,          provider,         uDbValorescenario, uCMTypes,   uDbLogCenario,
  uCtrlPadroes, uFuncoesOrcamento;

Type
  TCtrlValorescenario = class(TCmControlObject)

  Protected

    procedure DoChangeDataBase; Override;
    procedure OnCreateAppServer;Override;

  Private

    _dbValorescenario : TdbValorescenario;
    _DbLogCenario     : TDbLogCenario;

    FCdsValorescenario: TClientDataSet;
    FCdsLogCenario    : TClientDataSet;
    FCdsSaldo         : TClientDataSet;
    FCdsPeriodo       : TClientDataSet;
    FcdsContaSaldo    : TClientDataSet;

    Procedure SetCdsValorescenario( const Value: TClientDataSet );
    Procedure SetCdsLogCenario    ( const Value: TClientDataSet );
    Procedure SetCdsSaldo         ( const Value: TClientDataSet );
    Procedure SetCdsPeriodo       ( const Value: TClientDataSet );
    Procedure SetCdsContaSaldo    ( const Value: TClientDataSet );

    Procedure FazUpDateOuInsert   ( iPeriodo,
                                    iFator                    : Integer;
                                    pIDCENARIOORCAMEN,
                                    pidEmpresa                : Double;
                                    pdblcExercicioLookupValue : String );
  Public
      Constructor Create; Override;
      Destructor  Destroy;Override;

      Function ProcuraLogCenario(pIDLOGCENARIO : Double ): OleVariant;
      Function LerSequencia: Double;
      Function AplicaOperacaoValoresCenario : Boolean;
      Function AplicaOperacaoLogCenario     : Boolean;
      function Procurar(idValorescenario:Double): OleVariant;
      Function  InsereValor( idvalorescenario,
                             idcenarioorcamen,
                             idplanoorcamen   : Double;
                             exercicio,
                             periodo          : Integer;
                             idpessoa         : Double;
                             idcontaorcamen   : String;
                             vlrorccenario    : double) : Boolean;

      Procedure StartTransactionOrc;
      Procedure CommitOrc;
      Procedure RollBackOrc;
      procedure AltValor( idvalorescenario,
                          vlrorccenario : double);
      procedure DeleteValor(idcenarioorcamen : Double; exercicio, periodoini,
        periodofim : Integer; idpessoa: Double; periodo: string);
      procedure DeleteValor2(idcenarioorcamen : Double; exercicio, idpessoa: integer);
      procedure AltVlrorccenario(idpessoa : Double; exercicio, periodoini,
        periodofim: integer; conteudo1, conteudo2, conteudo3, conteudo4: string;
        vlrorccenario: double);
      procedure AltVlrorccenario2(idpessoa: Double; exercicio: integer; conteudo1,
        conteudo2, conteudo3, conteudo4: string; vlrorccenario: double);
      procedure AltValorSoma(idvalorescenario, vlrorccenario: double);
      procedure AltVlrorccenarioGD(idplanoorcamen, idcenarioorcamen, idpessoa : Double; 
        exercicio: integer; periodo, conteudo1: string;
        vlrorccenario: double);

      Procedure GravaLogCenario( pLOGCSALVO      : Double;
                                 pLOGCPERIODOINI,
                                 pLOGCPERIODOFIM : Integer;
                                 pLOGCEXERCICIO  : Double;
                                 pLOGCEFETIVADO  : Double;
                                 pIDPESSOA,
                                 pUsuario        : Integer;
                                 pLOGCANTERIOR   : String);

      Procedure AltEspecialCenario( pIDPLANOORCAMEN,
                                    pIDCENARIOORCAMEN,
                                    pIDPESSOA          : Double;
                                    pEXERCICIO,
                                    pPERIODO           : Integer;
                                    pIDCONTAORCAMEN    : String;
                                    pVLRORCCENARIO,
                                    pVLRRATEIOORI      : Double;
                                    pIDCRITERIORATORC  : Double );


      procedure InsereEspecialCenario( pIDPLANOORCAMEN,
                                       pIDCENARIOORCAMEN,
                                       pIDPESSOA          : Double;
                                       pEXERCICIO,
                                       pPERIODO           : Integer;
                                       pIDCONTAORCAMEN    : String;
                                       pVLRORCCENARIO,
                                       pVLRRATEIOORI,
                                       pIDCRITERIORATORC  : Double );

      Function  ValorescenarioProcedeGravacao( Var pMensagemLocal            : String;
                                                   pdblcPeriodoText          : String;
                                                   pdblcPeriodoLookupValue   : String;
                                                   pIDCENARIOORCAMEN         : Double;
                                                   pidEmpresa                : Integer;
                                                   pdblcExercicioLookupValue : String ) : Boolean;


      Property CdsValorescenario: TClientDataSet Read FCdsValorescenario Write SetCdsValorescenario;
      Property CdsLogCenario    : TClientDataSet Read FCdsLogCenario     Write SetCdsLogCenario;
      Property CdsSaldo         : TClientDataSet Read FCdsSaldo          Write SetCdsSaldo;
      Property CdsPeriodo       : TClientDataSet Read FCdsPeriodo        Write SetCdsPeriodo;
      Property cdsContaSaldo    : TClientDataSet Read FCdsContaSaldo     Write SetCdsContaSaldo;
  End;

implementation


Procedure TCtrlValorescenario.DoChangeDataBase;
Begin
  Inherited;
  _dbValorescenario.DatabaseName := DataBaseName;
  _DbLogCenario.DatabaseName     := DataBaseName;
End;

Procedure TCtrlValorescenario.OnCreateAppServer;
Begin
  Inherited;

  FCdsSaldo          := TClientDataSet.Create(nil);
  FCdsPeriodo        := TClientDataSet.Create(nil);
  FCdsContaSaldo     := TClientDataSet.Create(nil);
End;

Constructor TCtrlValorescenario.Create;
Begin
  Inherited;
  _dbValorescenario  := TdbValorescenario.Create( Self );
  _DbLogCenario      := TDbLogCenario.Create( Self );

  FCdsLogCenario     := TClientDataSet.Create( nil );
  FCdsValoresCenario := TClientDataSet.Create( nil );
End;

Destructor TCtrlValorescenario.Destroy;
Begin
  Inherited;
  _DbValorescenario.Free;
  _DbLogCenario.Free;

  FCdsLogCenario.Free;

  If isAppServer Then Begin

    FreeCds( [ FCdsValorescenario, FCdsSaldo, FCdsPeriodo, FCdsContaSaldo ] );
  End;
End;

function TCtrlValorescenario.AplicaOperacaoValoresCenario: Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoValoresCenario( FCdsValorescenario.Data );
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransactionOrc;
         Result := ApplyCDS(FCdsValorescenario,_DbValorescenario,[],[]);
         If Not Result Then Begin
            MessageInfo := _DbValorescenario.MessageInfo;
            Abort;
         End Else
            CommitOrc;
      Except
         On E:Exception Do Begin
            Result := False;
            RollBackOrc;
            MessageInfo := MessageInfo + E.Message;
         End;
      End;
   End;
end;


function TCtrlValorescenario.Procurar(idValorescenario:Double): OleVariant;
begin
   _DbValorescenario.IdValorescenario.AsFloat := idValorescenario;
   Result := GetDataPacket(_DbValorescenario.SSqlSelect);
end;
//************************************************
procedure TCtrlValorescenario.SetCdsValorescenario(
  const Value: TClientDataSet);
begin
  FCdsValorescenario := Value;
end;
//************************************************
Procedure TCtrlValoresCenario.SetCdsLogCenario( Const Value: TClientDataSet );
Begin

  FCdsLogCenario := Value;
End;
//************************************************
Procedure TCtrlValoresCenario.SetCdsSaldo( Const Value: TClientDataSet );
Begin

  FCdsSaldo := Value;
End;
//************************************************
Procedure TCtrlValoresCenario.SetCdsPeriodo( Const Value: TClientDataSet );
Begin

  FCdsPeriodo := Value;
End;
//************************************************
Procedure TCtrlValoresCenario.SetCdsContaSaldo( Const Value: TClientDataSet );
Begin

  FCdsContaSaldo := Value;
End;
//************************************************
Function TCtrlValorescenario.InsereValor( idvalorescenario,
                                          idcenarioorcamen,
                                          idplanoorcamen   : Double;
                                          exercicio,
                                          periodo          : Integer;
                                          idpessoa         : Double;
                                          idcontaorcamen   : String;
                                          vlrorccenario    : Double ) : Boolean;
Var
  sSql : String;

Begin

  Result := True;
  Try
    sSql := 'INSERT INTO VALORESCENARIO (IDVALORESCENARIO, IDCONTAORCAMEN, ' +
            'IDPLANOORCAMEN, EXERCICIO, PERIODO, IDPESSOA, VLRORCCENARIO, '  +
            'IDCENARIOORCAMEN) VALUES (' + FloatToStr(idvalorescenario) + ', ' +
            QuotedStr( Trim(idcontaorcamen ) ) + ', ' + FloatToStr(idplanoorcamen) + ', ' +
            IntToStr(exercicio) + ', ';

    If ( Periodo = 0 ) Then Begin

      sSql := sSql + 'NULL';
    End Else Begin

      sSql := sSql + IntToStr(periodo);
    End;

    sSql := sSql + ', ' + FloatToStr(idpessoa) + ', ' + TrocaVPP(FloatToStr(vlrorccenario)) +
                   ', ' + FloatToStr(idcenarioorcamen) + ')';
    ExecSQL(sSql);
  Except

    Result := False;
  End;
End;

procedure TCtrlValorescenario.AltValor(idvalorescenario: Double;
  vlrorccenario: double);
var sSql: string;
begin
  sSql := 'UPDATE VALORESCENARIO SET VLRORCCENARIO = ' +
          TrocaVPP(FloatToStr(vlrorccenario)) +
          ' WHERE IDVALORESCENARIO = ' + FloatToStr(idvalorescenario);
  ExecSQL(sSql);
end;

procedure  TCtrlValorescenario.DeleteValor(idcenarioorcamen : Double; exercicio,
  periodoini, periodofim : Integer; idpessoa: Double; periodo: string);
var sSql: string;
begin
  sSql := 'DELETE VALORESCENARIO WHERE (IDCENARIOORCAMEN = ' +
          FloatToStr(idcenarioorcamen) + ') AND (EXERCICIO = ' +
          IntToStr(exercicio) + ') AND (' + periodo + '(( PERIODO >= ' +
          IntToStr(periodoini) + ') AND (PERIODO <= ' +
          IntToStr(periodofim) + '))) AND (IDPESSOA = ' + FloatToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlValorescenario.DeleteValor2(idcenarioorcamen : Double; exercicio,
  idpessoa: integer);
var sSql: string;
begin
  sSql := 'DELETE VALORESCENARIO WHERE (IDCENARIOORCAMEN = ' +
          FloatToStr(idcenarioorcamen) + ') AND (EXERCICIO = ' +
          IntToStr(exercicio) + ') AND (IDPESSOA = ' + IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlValorescenario.AltVlrorccenario( idpessoa : Double; exercicio, periodoini,
  periodofim: integer; conteudo1, conteudo2, conteudo3, conteudo4: string;
  vlrorccenario: double);
var sSql: string;
begin
  sSql := 'UPDATE VALORESCENARIO SET VLRORCCENARIO = ' +
          TrocaVPP(FloatToStr(vlrorccenario)) + ' WHERE (EXERCICIO = ' +
          IntToStr(exercicio) + ')' + conteudo1 + conteudo2 + conteudo3 +
          conteudo4 + ' AND (PERIODO >= ' + IntToStr(periodoini) +
          ') AND (PERIODO <= ' + IntToStr(periodofim) + ') AND (IDPESSOA = ' +
          FloatToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlValorescenario.AltVlrorccenario2(idpessoa : Double; exercicio: integer;
  conteudo1, conteudo2, conteudo3, conteudo4: string; vlrorccenario: double);
var sSql: string;
begin
  sSql := 'UPDATE VALORESCENARIO SET VLRORCCENARIO = ' +
          TrocaVPP(FloatToStr(vlrorccenario)) + ' WHERE (EXERCICIO = ' +
          IntToStr(exercicio) + ') AND (PERIODO IS NULL)' + conteudo1 +
          conteudo2 + conteudo3 + conteudo4 + ' AND (IDPESSOA = ' +
          FloatToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlValorescenario.AltValorSoma( idvalorescenario,
                                            vlrorccenario    : double);
var sSql: string;
begin
  sSql := 'UPDATE VALORESCENARIO SET VLRORCCENARIO = VLRORCCENARIO + ' +
          TrocaVPP(FloatToStr(vlrorccenario)) +
          ' WHERE IDVALORESCENARIO = ' + FloatToStr(idvalorescenario);
  ExecSQL(sSql);
end;

procedure TCtrlValorescenario.AltVlrorccenarioGD(idplanoorcamen,
  idcenarioorcamen, idpessoa : Double; exercicio: integer; periodo, conteudo1: string;
  vlrorccenario: double);
var sSql: string;
begin
  sSql := 'UPDATE VALORESCENARIO S SET S.VLRORCCENARIO = ' +
          TrocaVPP(FloatToStr(vlrorccenario)) + ' WHERE ' +
          '(EXISTS (SELECT C.IDCONTAORCAMEN FROM CONTASORCAMEN C WHERE ' +
          '(C.IDPLANOORCAMEN = ' + FloatToStr(idplanoorcamen) + ') AND ' +
          '(C.TIPOCALCORCADO <> ''V'') AND (C.TIPOCALCORCADO <> ''T'') AND ' +
          '(C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND ' +
          '(C.IDPLANOORCAMEN = S.IDPLANOORCAMEN))) AND (S.IDPLANOORCAMEN = ' +
          FloatToStr(idplanoorcamen) + ') AND (S.IDCENARIOORCAMEN = ' +
          FloatToStr(idcenarioorcamen) + ') AND (S.EXERCICIO = ' +
          IntToStr(exercicio) + ') AND ' + periodo + conteudo1 +
          '(S.IDPESSOA = ' + FloatToStr(idpessoa) + ')';
   ExecSQL(sSql);
end;
//************************************************
Function TCtrlValoresCenario.ProcuraLogCenario( pIDLOGCENARIO : Double ) : OleVariant;
Begin

  _DbLogCenario.IDLOGCENARIO.AsFloat := pIDLOGCENARIO;
  Result := GetDataPacket( _DbLogCenario.SSqlSelect );
End;
//************************************************
Procedure TCtrlValoresCenario.GravaLogCenario( pLOGCSALVO      : Double;
                                               pLOGCPERIODOINI,
                                               pLOGCPERIODOFIM : Integer;
                                               pLOGCEXERCICIO  : Double;
                                               pLOGCEFETIVADO  : Double;
                                               pIDPESSOA,
                                               pUsuario        : Integer;
                                               pLOGCANTERIOR   : String);
Begin

  CdsLogCenario.Data := ProcuraLogCenario( -1 );

  If ( CdsLogCenario.IsEmpty ) Then Begin

    CdsLogCenario.Insert;
  End Else Begin

    CdsLogCenario.Edit;
  End;

  CdsLogCenario.FieldByName( 'IDLOGCENARIO' ).AsInteger   := -1;
  CdsLogCenario.FieldByName( 'LOGCSALVO' ).AsFloat        := pLOGCSALVO;
  CdsLogCenario.FieldByName( 'LOGCPERIODOINI' ).AsInteger := pLOGCPERIODOINI;
  CdsLogCenario.FieldByName( 'LOGCPERIODOFIM' ).AsInteger := pLOGCPERIODOFIM;
  CdsLogCenario.FieldByName( 'LOGCEXERCICIO' ).AsFloat    := pLOGCEXERCICIO;
  CdsLogCenario.FieldByName( 'LOGCEFETIVADO' ).AsFloat    := pLOGCEFETIVADO;
  CdsLogCenario.FieldByName( 'IDPESSOA' ).AsInteger       := pIDPESSOA;
  CdsLogCenario.FieldByName( 'LOGCANTERIOR' ).AsString    := pLOGCANTERIOR;
  CdsLogCenario.FieldByName( 'IDUSUARIO' ).AsInteger      := pUsuario;
  CdsLogCenario.Post;

  AplicaOperacaoLogCenario;

  CdsLogCenario.EmptyDataSet;
End;
//************************************************
Function TCtrlValorescenario.AplicaOperacaoLogCenario: Boolean;
Begin
  If ConnectionSide = cnsClient then begin

    Result := Connection.AppServer.AplicaOperacaoLogCenario( FCdsLogCenario.Data );

    If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;

  End Else Begin

    MessageInfo := '';
    Try

       Result := ApplyCDS( FCdsLogCenario, _DbLogCenario, [], [] );

       If Not Result Then Begin

         MessageInfo := _DbLogCenario.MessageInfo;
         Abort;
       End Else Begin

       End;
    Except
      On E : Exception Do Begin

        Result := False;
        MessageInfo := MessageInfo + E.Message;
      End;
    End;
  End;
End;
//************************************************
Function TCtrlValorescenario.LerSequencia : Double;
Begin

  Result := GetSequence( 'VALORESCENARIO' );
End;
//************************************************
Procedure TCtrlValorescenario.InsereEspecialCenario( pIDPLANOORCAMEN,
                                                     pIDCENARIOORCAMEN,
                                                     pIDPESSOA          : Double;
                                                     pEXERCICIO,
                                                     pPERIODO           : Integer;
                                                     pIDCONTAORCAMEN    : String;
                                                     pVLRORCCENARIO,
                                                     pVLRRATEIOORI,
                                                     pIDCRITERIORATORC  : Double );
Var
  sSQl : String;

Begin

  sSql := 'INSERT INTO'            + #13 + #10 +
          '  VALORESCENARIO'       + #13 + #10 +
          '  (  IDVALORESCENARIO,' + #13 + #10 +
          '     IDPLANOORCAMEN,'   + #13 + #10 +
          '     IDCONTAORCAMEN,'   + #13 + #10 +
          '     IDCENARIOORCAMEN,' + #13 + #10 +
          '     IDPESSOA,'         + #13 + #10 +
          '     EXERCICIO,'        + #13 + #10 +
          '     PERIODO,'          + #13 + #10 +
          '     VLRORCCENARIO,'    + #13 + #10 +
          '     IDCRITERIORATORC,' + #13 + #10 +
          '     VLRRATEIOORI )'    + #13 + #10 +
          '  VALUES ( '            + #13 + #10 +
                FloatToStr( LerSequencia )      + ', ' +
                FloatToStr( pIDPLANOORCAMEN )   + ', ' +
                QuotedStr( pIDCONTAORCAMEN )    + ', ' +
                FloatToStr( pIDCENARIOORCAMEN ) + ', ' +
                FloatToStr( pIDPESSOA )         + ', ' +
                IntToStr( pEXERCICIO )          + ', ' +
                IntToStr( pPERIODO )            + ', ' +
                TrocaVPP( FloatToStr( pVLRORCCENARIO ) ) + ', ';

                If ( pIDCRITERIORATORC = 0 ) Then Begin

                  sSql := sSql + 'NULL,';
                End Else Begin

                  sSql := sSql + FloatToStr( pIDCRITERIORATORC ) + ', ';
                End;

                sSql := sSql +TrocaVPP( FloatToStr( pVLRRATEIOORI ) ) + ' )';
  ExecSQL(sSql);
End;
//************************************************
Procedure TCtrlValorescenario.AltEspecialCenario( pIDPLANOORCAMEN,
                                                  pIDCENARIOORCAMEN,
                                                  pIDPESSOA          : Double;
                                                  pEXERCICIO,
                                                  pPERIODO           : Integer;
                                                  pIDCONTAORCAMEN    : String;
                                                  pVLRORCCENARIO,
                                                  pVLRRATEIOORI,
                                                  pIDCRITERIORATORC  : Double );
Var
  sSQl : String;
Begin

  sSql := 'UPDATE'                 + #13 + #10 +
          '  VALORESCENARIO'       + #13 + #10 +
          'SET'                    + #13 + #10 +
          '  IDCENARIOORCAMEN = ' + FloatToStr( pIDCENARIOORCAMEN ) + ', '           + #13 + #10 +
          '  VLRORCCENARIO    = ' + TrocaVPP( FloatToStr( pVLRORCCENARIO ) )+ ', ' + #13 + #10;

          If ( pIDCRITERIORATORC = 0 ) Then Begin

            sSql := sSql + '  IDCRITERIORATORC = NULL,' + #13 + #10;

          End Else Begin

            sSql := sSql + '  IDCRITERIORATORC = ' + FloatToStr( pIDCRITERIORATORC ) + ', ' + #13 + #10;
          End;

          sSql := sSql +
          '  VLRRATEIOORI     = ' + TrocaVPP( FloatToStr( pVLRRATEIOORI ) )        + #13 + #10 +
          'WHERE'                                                                  + #13 + #10 +
          '  IDPESSOA         = ' + FloatToStr( pIDPESSOA )+ ' AND '                 + #13 + #10 +
          '  IDPLANOORCAMEN   = ' + FloatToStr( pIDPLANOORCAMEN ) + ' AND '          + #13 + #10 +
          '  IDCENARIOORCAMEN = ' + FloatToStr( pIDCENARIOORCAMEN ) + ' AND '        + #13 + #10 +
          '  IDCONTAORCAMEN   = ' + QuotedStr( pIDCONTAORCAMEN ) + ' AND '         + #13 + #10 +
          '  EXERCICIO        = ' + IntToStr( pEXERCICIO )+ ' AND '                + #13 + #10 +
          '  PERIODO          = ' + IntToStr( pPERIODO );
  ExecSQL(sSql);
End;
//************************************************
Function TCtrlValorescenario.ValoresCenarioProcedeGravacao( Var pMensagemLocal        : String;
                                                            pdblcPeriodoText          : String;
                                                            pdblcPeriodoLookupValue   : String;
                                                            pIDCENARIOORCAMEN         : Double;
                                                            pidEmpresa                : Integer;
                                                            pdblcExercicioLookupValue : String ) : Boolean;
Var
  iFator : Integer;

Begin

  Result := False;

  Try
    StartTransactionOrc;

    cdsSaldo.DisableControls;
    cdsSaldo.First;

    While ( Not cdsSaldo.Eof ) Do Begin

      If ( Trim( pdblcPeriodoText ) = '' ) Or
         ( Trim( pdblcPeriodoText ) = 'Anual' ) Then Begin

        iFator := cdsPeriodo.RecordCount - 1;          // O registro 'anual' não pode ser considerado
        cdsPeriodo.First;

        While ( Not CdsPeriodo.Eof ) Do Begin

          If ( CdsPeriodo.FieldbyName( 'PERIODO' ).AsInteger <> 0 ) Then Begin

            FazUpDateOuInsert( CdsPeriodo.FieldByName('PERIODO').AsInteger,
                               iFator,
                               pIDCENARIOORCAMEN,
                               pidEmpresa,
                               pdblcExercicioLookupValue );
          End;

          cdsPeriodo.Next;
        End;
      End Else Begin

        FazUpDateOuInsert( StrToInt( pdblcPeriodoLookupValue ),
                           1,
                           pIDCENARIOORCAMEN,
                           pidEmpresa,
                           pdblcExercicioLookupValue );
      End;

      cdsSaldo.Next;
    End;

    CommitOrc;
    Result := True;
    pMensagemLocal := 'Gravação Efetuada com Sucesso';
  Except

    RollBackOrc;
    pMensagemLocal := 'Gravação Não Efetuada';
  End;

End;
//************************************************
Procedure TCtrlValorescenario.FazUpDateOuInsert( iPeriodo,
                                                 iFator                    : Integer;
                                                 pIDCENARIOORCAMEN,
                                                 pidEmpresa                : Double;
                                                 pdblcExercicioLookupValue : String );
Var
  sSQL : String;
Begin


  cdsContaSaldo.Close;

  sSQL := 'SELECT'             + #13 + #10 +
          '  IDVALORESCENARIO' + #13 + #10 +
          'FROM'               + #13 + #10 +
          '  VALORESCENARIO'   + #13 + #10 +
          'WHERE'              + #13 + #10 +
          '  ( IDPESSOA         = ' + FloatToStr( pidEmpresa )    + ' ) AND' + #13 + #10 +
          '  ( IDPLANOORCAMEN   = ' + cdsSaldo.FieldByName('IDPLANOORCAMEN').AsString + ' ) AND' + #13 + #10 +
          '  ( IDCONTAORCAMEN   = ' + cdsSaldo.FieldByName('IDCONTAORCAMEN').AsString + ' ) AND' + #13 + #10 +
          '  ( EXERCICIO        = ' + pdblcExercicioLookupValue + ' ) AND' + #13 + #10 +
          '  ( PERIODO          = ' + IntToStr( iPeriodo )      + ' ) AND' + #13 + #10 +
          '  ( IDCENARIOORCAMEN = ' + FloatToStr( pIDCENARIOORCAMEN ) + ' )';

  cdsContaSaldo.Data := GetDataPacket( sSQL );

  If ( cdsContaSaldo.IsEmpty ) Then Begin

    If ( cdsSaldo.FieldByName('VLRORCADO').AsFloat <> 0) Then Begin

      // Insere Saldo
      InsereEspecialCenario( CdsSaldo.FieldByName( 'IDPLANOORCAMEN' ).AsFloat,
                             pIDCENARIOORCAMEN,
                             pidEmpresa,
                             StrToInt( pdblcExercicioLookupValue),
                             iPeriodo,
                             cdsSaldo.FieldByName('IDCONTAORCAMEN').asString,
                             cdsSaldo.FieldByName('VLRORCADO').AsFloat / iFator,
                             cdsSaldo.FieldByName('VLRRATEIOORI').AsFloat / iFator,
                             cdsSaldo.FieldByName('IDCRITERIORATORC').AsFloat );
    End;
  End Else Begin
    // Atualiza Saldo
    AltEspecialCenario( CdsSaldo.FieldByName( 'IDPLANOORCAMEN' ).AsInteger,
                        pIDCENARIOORCAMEN,
                        pidEmpresa,
                        StrToInt( pdblcExercicioLookupValue),
                        iPeriodo,
                        cdsSaldo.FieldByName('IDCONTAORCAMEN').asString,
                        cdsSaldo.FieldByName('VLRORCADO').AsFloat / iFator,
                        cdsSaldo.FieldByName('VLRRATEIOORI').AsFloat / iFator,
                        cdsSaldo.FieldByName('IDCRITERIORATORC').AsInteger );
  End;
End;
//************************************************
Procedure TCtrlValorescenario.StartTransactionOrc;
Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Connection.AppServer.StartTransactionOrc;

  End Else Begin

    StartTransaction;
  End;
End;
//************************************************
Procedure TCtrlValorescenario.CommitOrc;
Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Connection.AppServer.CommitOrc;

  End Else Begin

    Commit;
  End;
End;
//************************************************
Procedure TCtrlValorescenario.RollBackOrc;
Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Connection.AppServer.RollBackOrc;

  End Else Begin

    RollBack;
  End;
End;
//************************************************
End.
