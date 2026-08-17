unit uCtrlReservaOrcamen;

interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, uMidasUtil, sysutils, wwQuery, provider, uDbReservaorcamen, uCMTypes;

Type
  TCtrlReservaorcamen = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;Override;
  private
    _dbReservaorcamen: TdbReservaorcamen;
    FCdsReservaorcamen: TClientDataSet;
    procedure SetCdsReservaorcamen(const Value: TClientDataSet);
    function TrocaVPP(numero: string): string;
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;

      property CdsReservaorcamen: TClientDataSet
                             read FCdsReservaorcamen write SetCdsReservaorcamen;

      Function AplicaOperacaoReservaOrcamen : Boolean;
      Function Procurar(idreservaorcamen:Double): OleVariant;
      Function ProximaReserva(idpessoa: Double): OleVariant;
      Function LerUltimaSequencia : Integer;

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
  end;

implementation


procedure TCtrlReservaorcamen.DoChangeDataBase;
begin
  inherited;
  _dbReservaorcamen.DatabaseName := DataBaseName;
end;

procedure TCtrlReservaorcamen.OnCreateAppServer;
begin
  inherited;
  FCdsReservaorcamen := TClientDataSet.Create(nil);
end;

constructor TCtrlReservaorcamen.Create;
begin
  inherited;
  _dbReservaorcamen := TdbReservaorcamen.Create(Self);
end;

destructor TCtrlReservaorcamen.Destroy;
begin
  inherited;
  _dbReservaorcamen.Free;
  if isAppServer then begin
    FreeCds([FCdsReservaorcamen]);
  end;
end;

function TCtrlReservaorcamen.AplicaOperacaoReservaOrcamen: Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoReservaorcamen
                                                      (FCdsReservaorcamen.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         Result := ApplyCDS(FCdsReservaorcamen,_DbReservaorcamen,[],[]);
         If Not Result Then Begin
            MessageInfo := _DbReservaorcamen.MessageInfo;
            Abort;
         End Else
            Commit;
      Except
         On E:Exception Do Begin
            Result := False;
            Rollback;
            MessageInfo := MessageInfo + E.Message;
         End;
      End;
   End;
end;

function TCtrlReservaorcamen.TrocaVPP(numero: string): string;
var ilength, ipos: integer;
    novonumero, spos: string;
begin
  ilength := Length(numero);
  novonumero := '';
  ipos := 0;
  While ipos < ilength do begin
    ipos := ipos + 1;
    spos := copy(numero,ipos,1);
    if spos = ',' then
      novonumero := novonumero + '.'
    else
      novonumero := novonumero + spos;
  end;
  Result := novonumero
end;

function TCtrlReservaorcamen.Procurar(idreservaorcamen:Double): OleVariant;
begin
   _DbReservaorcamen.Idreservaorcamen.AsFloat := idreservaorcamen;
   Result := GetDataPacket(_DbReservaorcamen.SSqlSelect);
end;

procedure TCtrlReservaorcamen.SetCdsReservaorcamen(
  const Value: TClientDataSet);
begin
  FCdsReservaorcamen := Value;
end;

function TCtrlReservaorcamen.ProximaReserva(idpessoa: Double): OleVariant;
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

procedure TCtrlReservaorcamen.AtualizaFLGRESERVA(flgreserva: string;
  idpessoa, numreserva: integer);
var sSQl : String;
begin
  sSql := 'UPDATE RESERVAORCAMEN SET ' +
          'FLGRESERVA = ''' + flgreserva + ''' WHERE  ' +
          '(IDPESSOA = ' + IntToStr(idpessoa) + ') AND ' +
          '(NUMRESERVA = ' + IntToStr(numreserva) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlReservaorcamen.AtualizaValorCompromisso(valor: double;
  flgreserva: string; numreserva: integer);
var sSQl : String;
begin
  sSql := 'UPDATE RESERVAORCAMEN SET FLGRESERVA = ''' + flgreserva + ''', ' +
          'VLRCOMPROMISSO = VLRCOMPROMISSO + ' + TrocaVPP(FloatToStr(valor)) + 
          ' WHERE NUMRESERVA = ' + IntToStr(numreserva);
  ExecSQL(sSql);
end;

procedure TCtrlReservaorcamen.CompromissoAguardando(valor: double; numreserva,
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

procedure TCtrlReservaorcamen.CriaCompromisso( idcompromisso,
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

procedure TCtrlReservaorcamen.AtualizaId(idpessoa, id, novoid: integer);
var sSQl : String;
begin
  sSql := 'UPDATE RESERVAORCAMEN SET IDRESERVAORCAMEN = ' + IntToStr(novoid) +
          ' WHERE (IDPESSOA = ' + IntToStr(idpessoa) +
          ') AND (IDRESERVAORCAMEN = ' + IntToStr(id) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlReservaorcamen.AltReservas(idpessoa, idreservaorcamen: integer);
var sSQl : String;
begin
  sSql := 'UPDATE RESERVAORCAMEN SET FLGRESERVA = ''E'', ' +
          'VLRCOMPROMISSO = (VLRRESERVA - NVL(VLRDEVOLVIDO,0)) WHERE ' +
          '(IDPESSOA = ' + IntToStr(idpessoa) + ') AND (IDRESERVAORCAMEN = ' +
          IntToStr(idreservaorcamen) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlReservaorcamen.AltCompromisso(idpessoa, idcompromisso: integer);
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

procedure TCtrlReservaorcamen.DevSaldo(idpessoa, idreservaorcamen: integer;
  saldocomp: double);
var sSQl : String;
begin
  sSql := 'UPDATE RESERVAORCAMEN SET FLGRESERVA = ''E'', ' +
          'VLRDEVOLVIDO = ' + TrocaVPP(FloatToStr(saldocomp)) + ' WHERE ' +
          '(IDPESSOA = ' + IntToStr(idpessoa) + ') AND (IDRESERVAORCAMEN = ' +
          IntToStr(idreservaorcamen) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlReservaorcamen.DevComp(idpessoa, idreservaorcamen: integer;
  saldocomp: double);
var sSQl : String;
begin
  sSql := 'UPDATE RESERVAORCAMEN SET ' +
          'VLRDEVOLVIDO = VLRDEVOLVIDO + ' + TrocaVPP(FloatToStr(saldocomp)) +
          ', VLRCOMPROMISSO = VLRCOMPROMISSO - ' +
          TrocaVPP(FloatToStr(saldocomp)) +
          ' WHERE (IDPESSOA = ' + IntToStr(idpessoa) +
          ') AND (IDRESERVAORCAMEN = ' + IntToStr(idreservaorcamen) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlReservaorcamen.CancelaReserva(idpessoa,
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
End.


