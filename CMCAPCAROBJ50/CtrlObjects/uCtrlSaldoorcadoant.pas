unit uCtrlSaldoOrcadoAnt;

interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, uMidasUtil, sysutils, wwQuery, provider,
  uDbSaldoOrcadoAnt, uCMTypes, uFuncoesOrcamento;

Type
  TCtrlSaldoOrcadoAnt = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;Override;
  private
    _dbSaldoOrcadoAnt: TdbSaldoOrcadoAnt;
    FCdsSaldoOrcadoAnt: TClientDataSet;
    procedure SetCdsSaldoOrcadoAnt(const Value: TClientDataSet);

  public
      Constructor Create; Override;
      Destructor  Destroy;Override;

      property CdsSaldoOrcadoAnt: TClientDataSet
                             read FCdsSaldoOrcadoAnt write SetCdsSaldoOrcadoAnt;

      function AplicaOperacaoSaldoOrcadoAnt : Boolean;
      function Procurar(idpessoa, idplanoorcamen, exercicio: Double; 
        idcontaorcamen: String): OleVariant;
      procedure ZeraValorOrcado(idpessoa, exercicio: integer);
      procedure InsereSaldoAnt(idplanoorcamen : Double; exercicio : Integer; idpessoa: Double;
        idcontaorcamen: string; vlrrealizado, vlrorcado: double);
      procedure AltSaldoAnt(idplanoorcamen : Double;exercicio : integer; idpessoa: Double;
        idcontaorcamen: string; vlrorcado: double);
      procedure AltVlrorcado(idpessoa, exercicio: integer; conteudo1, conteudo2,
        conteudo3, conteudo4: string; vlrorcado: double);
      Function  AltVlrorcado2(idplanoorcamen, exercicio, idpessoa: integer;
        idcontaorcamen: string; vlrorcado: double) : Boolean;
      Function  AltVlrorcadoSoma(idplanoorcamen, exercicio, idpessoa: integer;
        idcontaorcamen: string; vlrorcado: double) : Boolean;
      procedure AltVlrorcadoGD(idplanoorcamen, exercicio, idpessoa: integer;
        conteudo1: string; vlrorcado: double);
      procedure AltVlrrealizadoGD(idplanoorcamen, exercicio, idpessoa: integer;
        conteudo1: string; vlrrealizado: double);
      procedure AltVlrrealizado(idplanoorcamen, exercicio, idpessoa: integer;
        idcontaorcamen: string; vlrrealizado: double);
  end;

implementation


procedure TCtrlSaldoOrcadoAnt.DoChangeDataBase;
begin
  inherited;
  _dbSaldoOrcadoAnt.DatabaseName := DataBaseName;
end;

procedure TCtrlSaldoOrcadoAnt.OnCreateAppServer;
begin
  inherited;
  FCdsSaldoOrcadoAnt := TClientDataSet.Create(nil);
end;

constructor TCtrlSaldoOrcadoAnt.Create;
begin
  inherited;
  _dbSaldoOrcadoAnt := TdbSaldoOrcadoAnt.Create(Self);
end;

destructor TCtrlSaldoOrcadoAnt.Destroy;
begin
  inherited;
  _dbSaldoOrcadoAnt.Free;
  if isAppServer then begin
    FreeCds([FCdsSaldoOrcadoAnt]);
  end;
end;

function TCtrlSaldoOrcadoAnt.AplicaOperacaoSaldoOrcadoAnt: Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoSaldoOrcadoAnt ( FCdsSaldoOrcadoAnt.Data );
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         Result := ApplyCDS(FCdsSaldoOrcadoAnt,_DbSaldoOrcadoAnt,[],[]);
         If Not Result Then Begin
            MessageInfo := _DbSaldoOrcadoAnt.MessageInfo;
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


function TCtrlSaldoOrcadoAnt.Procurar(idpessoa, idplanoorcamen,
  exercicio: Double; idcontaorcamen: String): OleVariant;
begin
   _DbSaldoOrcadoAnt.Idpessoa.AsFloat := idpessoa;
   _DbSaldoOrcadoAnt.Idplanoorcamen.AsFloat := idplanoorcamen;
   _DbSaldoOrcadoAnt.Idcontaorcamen.AsString := idcontaorcamen;
   _DbSaldoOrcadoAnt.Exercicio.AsFloat := exercicio;
   Result := GetDataPacket(_DbSaldoOrcadoAnt.SSqlSelect);
end;

procedure TCtrlSaldoOrcadoAnt.SetCdsSaldoOrcadoAnt(
  const Value: TClientDataSet);
begin
  FCdsSaldoOrcadoAnt := Value;
end;


procedure TCtrlSaldoOrcadoAnt.ZeraValorOrcado(idpessoa, exercicio: integer);
var sSQl: String;
begin
  sSql := 'UPDATE SaldoOrcadoAnt SET VLRORCADO = 0 WHERE (EXERCICIO = ' +
          IntToStr(exercicio) + ') AND (IDPESSOA  = ' +
          IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcadoAnt.InsereSaldoAnt(idplanoorcamen : Double; exercicio :integer;
  idpessoa: Double; idcontaorcamen: string; vlrrealizado, vlrorcado: double);
var sSQl: String;
begin
  sSql := 'INSERT INTO SaldoOrcadoAnt (IDCONTAORCAMEN, IDPLANOORCAMEN, ' +
          'EXERCICIO, IDPESSOA, VLRREALIZADO, VLRORCADO) VALUES (''' +
          idcontaorcamen + ''', ' + FloatToStr(idplanoorcamen) + ', ' +
          IntToStr(exercicio) + ', ' + FloatToStr(idpessoa) + ', ' +
          TrocaVPP(FloatToStr(vlrrealizado)) + ', ' +
          TrocaVPP(FloatToStr(vlrorcado)) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcadoAnt.AltSaldoAnt(idplanoorcamen : Double; exercicio : integer;
  idpessoa : Double; idcontaorcamen: string; vlrorcado: double);
var sSQl: String;
begin
  sSql := 'UPDATE SaldoOrcadoAnt SET VLRORCADO  = NVL(VLRORCADO,0)  + ' +
          TrocaVPP(FloatToStr(vlrorcado)) + ' WHERE (IDPLANOORCAMEN = ' +
          FloatToStr(idplanoorcamen) + ') AND (IDCONTAORCAMEN = ''' +
          idcontaorcamen + ''')  AND (EXERCICIO = ' + IntToStr(exercicio) +
          ') AND (IDPESSOA = ' + FloatToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcadoAnt.AltVlrorcado(idpessoa, exercicio: integer;
  conteudo1, conteudo2, conteudo3, conteudo4: string; vlrorcado: double);
var sSql: string;
begin
  sSql := 'UPDATE SaldoOrcadoAnt SET VLRORCADO = ' +
          TrocaVPP(FloatToStr(vlrorcado)) + ' WHERE (EXERCICIO = ' +
          IntToStr(exercicio) + ')' + conteudo1 + conteudo2 + conteudo3 +
          conteudo4 + ' AND (IDPESSOA = ' + IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

Function  TCtrlSaldoOrcadoAnt.AltVlrorcado2(idplanoorcamen, exercicio,
  idpessoa: integer; idcontaorcamen: string; vlrorcado: double) : Boolean;
var sSql: string;
begin
  sSql := 'UPDATE SaldoOrcadoAnt SET VLRORCADO = ' +
          TrocaVPP(FloatToStr(vlrorcado) + 'WHERE (IDPLANOORCAMEN = ' +
          IntToStr(idplanoorcamen) + ') AND (IDCONTAORCAMEN = ''') +
          idcontaorcamen + ''') AND (EXERCICIO = ' + IntToStr(exercicio) +
          ') AND (IDPESSOA = ' + IntToStr(idpessoa) + ')';
  Result := ExecSQL(sSql, True);
end;

Function  TCtrlSaldoOrcadoAnt.AltVlrorcadoSoma(idplanoorcamen, exercicio,
  idpessoa: integer; idcontaorcamen: string; vlrorcado: double) : Boolean;
var sSql: string;
begin
  sSql := 'UPDATE SaldoOrcadoAnt SET VLRORCADO = NVL(VLRORCADO,0) + ' +
          TrocaVPP(FloatToStr(vlrorcado) + 'WHERE (IDPLANOORCAMEN = ' +
          IntToStr(idplanoorcamen) + ') AND (IDCONTAORCAMEN = ''') +
          idcontaorcamen + ''') AND (EXERCICIO = ' + IntToStr(exercicio) +
          ') AND (IDPESSOA = ' + IntToStr(idpessoa) + ')';
  Result := ExecSQL(sSql, True);
end;

procedure TCtrlSaldoOrcadoAnt.AltVlrorcadoGD(idplanoorcamen, exercicio,
  idpessoa: integer; conteudo1: string; vlrorcado: double);
var sSql: string;
begin
  sSql := 'UPDATE SaldoOrcadoAnt S SET S.VLRORCADO = ' +
          TrocaVPP(FloatToStr(vlrorcado)) + ' WHERE ' +
          '(EXISTS (SELECT C.IDCONTAORCAMEN FROM CONTASORCAMEN C WHERE ' +
          '(C.IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
          '(C.TIPOCALCORCADO <> ''V'') AND (C.TIPOCALCORCADO <> ''T'') AND ' +
          '(C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND ' +
          '(C.IDPLANOORCAMEN = S.IDPLANOORCAMEN))) AND ' +
          '(S.IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
          '(S.EXERCICIO = ' + IntToStr(exercicio) + ') AND ' + conteudo1 +
          '(S.IDPESSOA = ' + IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcadoAnt.AltVlrrealizadoGD(idplanoorcamen, exercicio,
  idpessoa: integer; conteudo1: string; vlrrealizado: double);
var sSql: string;
begin
  sSql := 'UPDATE SaldoOrcadoAnt S SET S.VLRREALIZADO = ' +
          TrocaVPP(FloatToStr(vlrrealizado)) + ' WHERE ' +
          '(EXISTS (SELECT C.IDCONTAORCAMEN FROM CONTASORCAMEN C WHERE ' +
          '(C.IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
          '(C.TIPOCALCORCADO <> ''V'') AND (C.TIPOCALCORCADO <> ''T'') AND ' +
          '(C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND ' +
          '(C.IDPLANOORCAMEN = S.IDPLANOORCAMEN))) AND ' +
          '(S.IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
          '(S.EXERCICIO = ' + IntToStr(exercicio) + ') AND ' + conteudo1 +
          '(S.IDPESSOA = ' + IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlSaldoOrcadoAnt.AltVlrrealizado(idplanoorcamen, exercicio,
  idpessoa: integer; idcontaorcamen: string; vlrrealizado: double);
var sSql: string;
begin
  sSql := 'UPDATE SaldoOrcadoAnt SET VLRREALIZADO = ' +
          TrocaVPP(FloatToStr(vlrrealizado) + 'WHERE (IDPLANOORCAMEN = ' +
          IntToStr(idplanoorcamen) + ') AND (IDCONTAORCAMEN = ''') +
          idcontaorcamen + ''') AND (EXERCICIO = ' + IntToStr(exercicio) +
          ') AND (IDPESSOA = ' + IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

end.


