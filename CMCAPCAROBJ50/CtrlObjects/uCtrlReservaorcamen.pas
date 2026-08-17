Unit
  uCtrlReservaOrcamen;

Interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, uMidasUtil, sysutils, wwQuery, provider,
  uCtrlResxcomp, uCtrlSaldoorcado, uCtrlDocrecxcomp, uDbReservaorcamen, uCMTypes,
  uFuncoesOrcamento;

Type
  TCtrlReservaOrcamen = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase;  Override;
      procedure OnCreateAppServer; Override;
      Procedure AfterInitialize  ; Override;
  Private
    CtrlResxcomp       : TCtrlResxcomp;
    CtrlSaldoorcado    : TCtrlSaldoorcado;
    CtrlDocrecxcomp    : TCtrlDocrecxcomp;

    _dbReservaorcamen  : TdbReservaorcamen;
    FCdsReservaorcamen : TClientDataSet;
    FCdsAltReservas    : TClientDataSet;
    FCdsdocRec         : TClientDataSet;
    FCdsTestaDocxComp  : TClientDataSet;

    Procedure SetCdsReservaOrcamen(const Value: TClientDataSet);
    Procedure SetCdsAltReservas(const Value: TClientDataSet);
    Function TestaDocXComp( CodDocumento,
                            idReservaOrcamen : Double ) : OleVariant;
    procedure SetCdsDocRec(const Value: TClientDataSet);
    procedure SetCdsTestaDocxComp(const Value: TClientDataSet);
  Public
    Constructor Create; Override;
    Destructor  Destroy;Override;

    Procedure StartTransactionOrc;
    Procedure CommitOrc;
    Procedure RollBackOrc;

    Function AplicaOperacaoReservaOrcamen : Boolean;
    Function Procurar(idreservaorcamen:Double): OleVariant;
    Function ProximaReserva(idpessoa: Double): OleVariant;
    Function LerUltimaSequencia : Integer;
    Function EfetivaClick( pIDRESERVAORCAMEN,
                           pidEmpresa        : Integer ): Boolean;
    Function CancelaClick( pidEmpresa,
                           pIDRESERVAORCAMEN : Integer;
                           psFieldResOuComp  : String  ): Boolean;
    Function DevolveClick( pidEmpresa        : Integer;
                           psFieldResOuComp  : String)  : Boolean;
    Function DevCompClick( pIdEmpresa       : Integer;
                           psFieldResOuComp : String ) : Boolean;

    procedure AtualizaFLGRESERVA(flgreserva: string; idpessoa,
      numreserva: integer);
    procedure AtualizaValorCompromisso(valor: double; flgreserva: string;
      numreserva: integer);
    procedure CompromissoAguardando(valor: double; numreserva,
      idpessoa: integer; flgefetivacompromisso: boolean);
    procedure CriaCompromisso(idcompromisso, idpessoa, exercicio, periodo,
      idplanoorcamen, numreserva, idmodulo: integer; idcontaorcamen,
      datareferencia, obsreserva: string; vlrreserva: double);
    procedure AtualizaId(idpessoa, id, novoid: integer);
    procedure AltReservas(idpessoa, idreservaorcamen: integer);
    procedure AltCompromisso(idpessoa, idcompromisso: integer);
    procedure DevSaldo(idpessoa, idreservaorcamen: integer;
      saldocomp: double);
    procedure DevComp(idpessoa, idreservaorcamen: integer; saldocomp: double);
    procedure CancelaReserva(idpessoa, idreservaorcamen: integer);

    Property CdsReservaorcamen : TClientDataSet Read FCdsReservaorcamen Write SetCdsReservaorcamen;
    Property CdsAltReservas    : TClientDataSet Read FCdsAltReservas    Write SetCdsAltReservas;
    Property CdsdocRec         : TClientDataSet Read FCdsDocRec         Write SetCdsDocRec;
    Property CdsTestaDocxComp  : TClientDataSet Read FCdsTestaDocxComp  Write SetCdsTestaDocxComp;
  End;

Implementation


Procedure TCtrlReservaOrcamen.DoChangeDataBase;
Begin
  Inherited;
  _dbReservaorcamen.DatabaseName := DataBaseName;
End;
//***********************************************
Procedure TCtrlReservaOrcamen.OnCreateAppServer;
Begin
  Inherited;
  FCdsReservaorcamen := TClientDataSet.Create( Nil );
  FCdsAltReservas    := TClientDataSet.Create( Nil );
  FCdsDocRec         := TClientDataSet.Create( Nil );
End;
//***********************************************
Constructor TCtrlReservaOrcamen.Create;
Begin
  Inherited;
  CtrlResxcomp      := TCtrlResxcomp.Create;
  CtrlSaldoorcado   := TCtrlSaldoorcado.Create;
  CtrlDocrecxcomp   := TCtrlDocrecxcomp.Create;
  _dbReservaorcamen := TdbReservaorcamen.Create(Self);

  CdsTestaDocxComp := TClientDataSet.Create( Nil );
End;
//***********************************************
Destructor TCtrlReservaOrcamen.Destroy;
Begin
  Inherited;
  _dbReservaorcamen.Free;
  CdsTestaDocxComp.Free;
  If isAppServer Then Begin
    FreeCds( [ FCdsReservaorcamen, FCdsAltReservas, FCdsDocRec ] );
  End;
  CtrlResxcomp.Free;
  CtrlSaldoorcado.Free;
  CtrlDocrecxcomp.Free;
End;
//***********************************************
Procedure TCtrlReservaOrcamen.AfterInitialize;
Begin

  CtrlResxcomp.InitializeAs( Self );
  CtrlSaldoOrcado.InitializeAs( Self );
  CtrlDocrecxcomp.InitializeAs( Self );
End;


function TCtrlReservaOrcamen.AplicaOperacaoReservaOrcamen: Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoReservaorcamen
                                                      (FCdsReservaorcamen.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransactionOrc;
         Result := ApplyCDS(FCdsReservaorcamen,_DbReservaorcamen,[],[]);
         If Not Result Then Begin
            MessageInfo := _DbReservaorcamen.MessageInfo;
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

function TCtrlReservaOrcamen.Procurar(idreservaorcamen:Double): OleVariant;
begin
   _DbReservaorcamen.Idreservaorcamen.AsFloat := idreservaorcamen;
   Result := GetDataPacket(_DbReservaorcamen.SSqlSelect);
end;
//************************************************
Procedure TCtrlReservaOrcamen.SetCdsReservaorcamen( Const Value: TClientDataSet);
Begin
  FCdsReservaorcamen := Value;
End;
//************************************************
Procedure TCtrlReservaOrcamen.SetCdsAltReservas( Const Value: TClientDataSet);
Begin
  FCdsAltReservas := Value;
End;
//************************************************
Procedure TCtrlReservaOrcamen.SetCdsDocRec( Const Value: TClientDataSet);
Begin
  FCdsDocRec := Value;
End;
//************************************************
Procedure TCtrlReservaOrcamen.SetCdsTestaDocxComp( Const Value: TClientDataSet);
Begin
  FCdsTestaDocxComp := Value;
End;



function TCtrlReservaOrcamen.ProximaReserva(idpessoa: Double): OleVariant;
var sSQl : String;
begin
   sSql := 'SELECT                                        ' +
           '   MAX(NUMRESERVA) AS PROXIMA                 ' +
           'FROM                                          ' +
           '   RESERVAORCAMEN                             ' +
           'WHERE                                         ' +
           '   IDPESSOA = ' + TrocaVPP(FloatToStr(idpessoa));
   Result := GetDataPacket(sSql);
end;

procedure TCtrlReservaOrcamen.AtualizaFLGRESERVA(flgreserva: string;
  idpessoa, numreserva: integer);
var sSQl : String;
begin
  sSql := 'UPDATE RESERVAORCAMEN SET ' +
          'FLGRESERVA = ''' + flgreserva + ''' WHERE  ' +
          '(IDPESSOA = ' + IntToStr(idpessoa) + ') AND ' +
          '(NUMRESERVA = ' + IntToStr(numreserva) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlReservaOrcamen.AtualizaValorCompromisso(valor: double;
  flgreserva: string; numreserva: integer);
var sSQl : String;
begin
  sSql := 'UPDATE RESERVAORCAMEN SET FLGRESERVA = ''' + flgreserva + ''', ' +
          'VLRCOMPROMISSO = VLRCOMPROMISSO + ' + TrocaVPP(FloatToStr(valor)) + 
          ' WHERE NUMRESERVA = ' + IntToStr(numreserva);
  ExecSQL(sSql);
end;

procedure TCtrlReservaOrcamen.CompromissoAguardando(valor: double; numreserva,
  idpessoa: integer; flgefetivacompromisso: boolean);
var sSQl : String;
begin
  sSql := 'UPDATE RESERVAORCAMEN SET  ' +
          'VLRCOMPROMISSO = VLRCOMPROMISSO + ' + TrocaVPP(FloatToStr(valor)) +
          ' ';
  if flgefetivacompromisso then begin
    sSql := sSql + ',FLGRESERVA = ''E'' ';
  end;
  sSql := sSql + 'WHERE (NUMRESERVA = ' + IntToStr(numreserva) + ') AND ' +
                 '(IDPESSOA = ' + IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlReservaOrcamen.CriaCompromisso( idcompromisso,
                                               idpessoa,
                                               exercicio,
                                               periodo,
                                               idplanoorcamen,
                                               numreserva,
                                               idmodulo       : integer;
                                               idcontaorcamen,
                                               datareferencia,
                                               obsreserva     : string;
                                               vlrreserva     : double);
Var
  sSQl : String;

begin
  sSql := 'INSERT INTO RESERVAORCAMEN ' +
          '(IDRESERVAORCAMEN, IDPESSOA, EXERCICIO, PERIODO, IDPLANOORCAMEN, ' +
          'IDCONTAORCAMEN, DATAREFERENCIA, VLRRESERVA, FLGRESERVA, ' +
          'OBSRESERVA, NUMRESERVA, FLGRESCOMP, IDMODULO, ' +
          'VLRCOMPROMISSO) VALUES ' +
          '(' + IntToStr(idcompromisso) + ', ' + IntToStr(idpessoa) +
          ', ' + IntToStr(exercicio) + ', ' + IntToStr(periodo) +
          ', ' + IntToStr(idplanoorcamen) + ', ''' + idcontaorcamen +
          ''', TO_DATE(''' + datareferencia + ''',''DD/MM/YYYY''), ' +
          TrocaVPP(FloatToStr(vlrreserva)) +
          ', ''A'', ''' + obsreserva + ''', ' + IntToStr(numreserva) +
          ', ''C'', ' + IntToStr(idmodulo) + ', 0)';
  ExecSQL(sSql);
end;

procedure TCtrlReservaOrcamen.AtualizaId(idpessoa, id, novoid: integer);
var sSQl : String;
begin
  sSql := 'UPDATE RESERVAORCAMEN SET IDRESERVAORCAMEN = ' + IntToStr(novoid) +
          ' WHERE (IDPESSOA = ' + IntToStr(idpessoa) +
          ') AND (IDRESERVAORCAMEN = ' + IntToStr(id) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlReservaOrcamen.AltReservas(idpessoa, idreservaorcamen: integer);
var sSQl : String;
begin
  sSql := 'UPDATE RESERVAORCAMEN SET FLGRESERVA = ''E'', ' +
          'VLRCOMPROMISSO = (VLRRESERVA - NVL(VLRDEVOLVIDO,0)) WHERE ' +
          '(IDPESSOA = ' + IntToStr(idpessoa) + ') AND (IDRESERVAORCAMEN = ' +
          IntToStr(idreservaorcamen) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlReservaOrcamen.AltCompromisso(idpessoa, idcompromisso: integer);
var sSQl : String;
begin
  sSql := 'UPDATE RESERVAORCAMEN  SET FLGRESERVA = ''A'' ' +
          'WHERE  IDRESERVAORCAMEN IN (SELECT RC.IDRESERVA ' +
          'FROM RESXCOMP RC  WHERE ' +
          '(RC.IDCOMPROMISSO = ' + IntToStr(idcompromisso) + ') ' +
          'AND  (RC.IDPESSOA = ' + IntToStr(idpessoa) + ')) ' +
          'AND  (IDPESSOA = ' + IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlReservaOrcamen.DevSaldo(idpessoa, idreservaorcamen: integer;
  saldocomp: double);
var sSQl : String;
begin
  sSql := 'UPDATE RESERVAORCAMEN SET FLGRESERVA = ''E'', ' +
          'VLRDEVOLVIDO = ' + TrocaVPP(FloatToStr(saldocomp)) + ' WHERE ' +
          '(IDPESSOA = ' + IntToStr(idpessoa) + ') AND (IDRESERVAORCAMEN = ' +
          IntToStr(idreservaorcamen) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlReservaOrcamen.DevComp(idpessoa, idreservaorcamen: integer;
  saldocomp: double);
var sSQl : String;
begin
  sSql := 'UPDATE' + #13 + #10 +
          '  RESERVAORCAMEN' + #13 + #10 +
          'SET' + #13 + #10 +
          '  VLRDEVOLVIDO   = VLRDEVOLVIDO   + ' + TrocaVPP(FloatToStr(saldocomp)) + ',' + #13 + #10 +
          '  VLRCOMPROMISSO = VLRCOMPROMISSO - ' + TrocaVPP(FloatToStr(saldocomp))       + #13 + #10 +
          'WHERE' + #13 + #10 +
          '  ( IDPESSOA         = ' + IntToStr(idpessoa) + ') AND' + #13 + #10 +
          '  ( IDRESERVAORCAMEN = ' + IntToStr(idreservaorcamen) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlReservaOrcamen.CancelaReserva(idpessoa,
  idreservaorcamen: integer);
var sSQl : String;
begin
  sSql := 'UPDATE RESERVAORCAMEN SET FLGRESERVA = ''C'' WHERE ' +
          '(IDPESSOA = ' + IntToStr(idpessoa) + ') AND (IDRESERVAORCAMEN = ' +
          IntToStr(idreservaorcamen) + ')';
  ExecSQL(sSql);
end;
//************************************************
Function TCtrlReservaOrcamen.LerUltimaSequencia : Integer;
Begin

  Result := GetSequence( 'RESERVAORCAMEN' );
End;
//************************************************
Procedure TCtrlReservaOrcamen.StartTransactionOrc;
Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Connection.AppServer.StartTransactionOrc;

  End Else Begin

    StartTransaction;
  End;
End;
//************************************************
Procedure TCtrlReservaOrcamen.CommitOrc;
Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Connection.AppServer.CommitOrc;

  End Else Begin

    Commit;
  End;
End;
//************************************************
Procedure TCtrlReservaOrcamen.RollBackOrc;
Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Connection.AppServer.RollBackOrc;

  End Else Begin

    RollBack;
  End;
End;
//************************************************
Function TCtrlReservaOrcamen.EfetivaClick( pIDRESERVAORCAMEN,
                                           pidEmpresa         : Integer ) : Boolean;
Begin

  Try
    StartTransactionOrc;
    AltReservas( pidEmpresa,
                 pIDRESERVAORCAMEN );
    CommitOrc;

    Result := True;
  Except
    Result := False;
    RollBackOrc;
  End;
End;
//************************************************
Function TCtrlReservaOrcamen.CancelaClick( pidEmpresa,
                                           pIDRESERVAORCAMEN : Integer;
                                           psFieldResOuComp  : String ) : Boolean;
Var
  rValorReservas : Double;

Begin

  StartTransactionOrc;
  Try
    //Muda a flag da reserva/compromisso
    CancelaReserva( pidEmpresa, pIDRESERVAORCAMEN );

    //Ir na tabela de RESXCOMP
    rValorReservas := cdsAltReservas.FieldByName('TOTALRESERVA').AsFloat;


    AltCompromisso( pidEmpresa, pIDRESERVAORCAMEN );
    CtrlResxcomp.AltReservas(pidEmpresa, pIDRESERVAORCAMEN );
    //Estorna o Valor no Saldo Orçamentário
    CtrlSaldoorcado.AltSaldos( CdsReservaOrcamen.FieldByName('VLRRESERVA').asFloat,rValorReservas,
                               pidEmpresa,
                               CdsReservaOrcamen.FieldByName('IDPLANOORCAMEN').asInteger,
                               CdsReservaOrcamen.FieldByName('DATAREFERENCIA').asString,
                               CdsReservaOrcamen.FieldByName('IDCONTAORCAMEN').asString,
                               psFieldResOuComp,
                               CdsReservaOrcamen.FieldByName('FLGRESCOMP').asString );
    CommitOrc;
    Result := True;
  Except
    Result := False;
    RollBackOrc;
  End;
End;
//************************************************
Function TCtrlReservaOrcamen.DevolveClick( pidEmpresa       : Integer;
                                           psFieldResOuComp : String ) : Boolean;
Begin
  Try
    StartTransactionOrc;
    //Muda a flag da reserva/compromisso
    DevSaldo( pidEmpresa,
              CdsReservaOrcamen.FieldByName('IDRESERVAORCAMEN').asInteger,
              ( CdsReservaOrcamen.FieldByName('VLRRESERVA').AsFloat - CdsReservaOrcamen.FieldByName('VLRCOMPROMISSO').AsFloat) );

    //Estorna o Valor no Saldo Orçamentário
    CtrlSaldoorcado.EstornaSaldo( pidEmpresa,
                                  CdsReservaOrcamen.FieldByName('IDPLANOORCAMEN').asInteger,
                                  CdsReservaOrcamen.FieldByName('DATAREFERENCIA').asString,
                                  CdsReservaOrcamen.FieldByName('IDCONTAORCAMEN').asString,
                                  psFieldResOuComp,
                                  (CdsReservaOrcamen.FieldByName('VLRRESERVA').AsFloat - CdsReservaOrcamen.FieldByName('VLRCOMPROMISSO').AsFloat));
    CommitOrc;
    Result := True;
  Except
    Result := False;
    RollBackOrc;
  End;
End;
//************************************************
Function TCtrlReservaOrcamen.DevCompClick( pIdEmpresa       : Integer;
                                           psFieldResOuComp : String ) : Boolean;
Var
  rValorRec,
  rValorInd,
  rValorDev : Double;
Begin
  Try
    StartTransactionOrc;
    rValorRec := 0;
    cdsDocRec.First;
    While ( Not cdsDocRec.EOF ) Do Begin
      If ( cdsDocRec.FieldByName('MARCA').AsString = 'S') and
         ( rValorRec < CdsReservaOrcamen.FieldByName('VLRCOMPROMISSO').AsFloat ) Then Begin

        rValorRec := rValorRec + cdsDocRec.FieldByName('VALOR').AsFloat;

        If rValorRec > CdsReservaOrcamen.FieldByName('VLRCOMPROMISSO').AsFloat Then Begin

          rValorInd := cdsDocRec.FieldByName('VALOR').AsFloat -
                       ( rValorRec - CdsReservaOrcamen.FieldByName('VLRCOMPROMISSO').AsFloat );
        End Else Begin
          rValorInd := cdsDocRec.FieldByName('VALOR').AsFloat;
        End;

        cdsTestaDocxComp.Data := TestaDocxComp( cdsDocRec.FieldByName('CODDOCUMENTO').AsFloat,
                                                CdsReservaOrcamen.FieldByName('IDRESERVAORCAMEN').AsFloat );
        If cdsTestaDocXComp.IsEmpty Then Begin

          CtrlDocRecXComp.InsDocumentos( CdsReservaOrcamen.FieldByName('IDRESERVAORCAMEN').AsFloat,
                                         cdsDocRec.FieldByName('CODDOCUMENTO').AsFloat,rValorInd );
        End Else Begin
          CtrlDocRecXComp.AltDocumentos( CdsReservaOrcamen.FieldByName('IDRESERVAORCAMEN').AsFloat,
                                         cdsDocRec.FieldByName('CODDOCUMENTO').AsFloat,rValorInd );
        End;
      End;
      cdsDocRec.Next;
    End;
    If rValorRec > CdsReservaOrcamen.FieldByName('VLRCOMPROMISSO').AsFloat Then
      rValorDev := CdsReservaOrcamen.FieldByName('VLRCOMPROMISSO').AsFloat
    Else
      rValorDev := rValorRec;

    //Muda a flag da reserva/compromisso
    DevComp( pidEmpresa,
             CdsReservaOrcamen.FieldByName('IDRESERVAORCAMEN').asInteger,
             rValorDev );
    //Estorna o Valor no Saldo Orçamentário
    CtrlSaldoorcado.EstornaSaldo( pidEmpresa,
                                  CdsReservaOrcamen.FieldByName('IDPLANOORCAMEN').asInteger,
                                  CdsReservaOrcamen.FieldByName('DATAREFERENCIA').asString,
                                  CdsReservaOrcamen.FieldByName('IDCONTAORCAMEN').asString,
                                  psFieldResOuComp,
                                  rValorDev );
    CommitOrc;
    Result := True;
  Except
    Result := False;
    RollBackOrc;
  End;
End;
//************************************************
Function TCtrlReservaOrcamen.TestaDocXComp( CodDocumento,
                                            idReservaOrcamen: Double) : OleVariant;
Var
  sSql: string;
Begin
  sSql := 'SELECT CODDOCUMENTO FROM DOCRECXCOMP ' +
          'WHERE (CODDOCUMENTO     = ' + FloatToStr(coddocumento) +
          ') AND (IDRESERVAORCAMEN = ' + FloatToStr(idreservaorcamen) + ')';
  Result := GetDataPacket(sSql);
End;
//************************************************

End.
