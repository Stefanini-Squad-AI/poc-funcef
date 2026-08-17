unit uCtrlSaldoorcado;

interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, uMidasUtil, sysutils, wwQuery, provider, uDbSaldoorcado, uCMTypes;

Type
  TCtrlSaldoorcado = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;Override;
  private
    _dbSaldoorcado: TdbSaldoorcado;
    FCdsSaldoorcado: TClientDataSet;
    procedure SetCdsSaldoorcado(const Value: TClientDataSet);
    function TrocaVPP(numero: string): string;
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;

      property CdsSaldoorcado: TClientDataSet
                               read FCdsSaldoorcado write SetCdsSaldoorcado;

      function AplicaOperacao : Boolean;
      function Procurar(idpessoa, idplanoorcamen:Double; idcontaorcamen: String;
        datareferencia: TDateTime): OleVariant;
      Procedure AtualizaSaldo(idplanoorcamen, idpessoa: integer; idcontaorcamen,
        datareferencia: string; valor: double);
      Procedure InsereSaldo(exercicio, periodo, idplanoorcamen,
        idpessoa: integer; idcontaorcamen, datareferencia: string; vlrorcado,
        vlrrealizado, vlrreservado, vlrcomprometido, vlrorcacum,
        vlrrealacum: double);
      Procedure TrocaSaldoReservadopCompromissado(valortotalreservas,
        valor: double; idpessoa, idplanoorcamen: integer; datareferencia,
        idcontaorcamen: string);
      Procedure RetiraValor(valorreserva: double; idpessoa,
        idplanoorcamen: integer; datareferencia, idcontaorcamen,
        flgvalor: string);
      Procedure AltSaldos(valor, valorreserva: double; idpessoa,
        idplanoorcamen: integer; datareferencia, idcontaorcamen, sfield,
        flgrescomp: string);
      Procedure EstornaSaldo(idpessoa, idplanoorcamen: integer; datareferencia,
        idcontaorcamen, sfield: string; valor: double);
      Procedure AltSaldos2(valorrealizado, valororcado: double; idpessoa,
        idplanoorcamen: integer; datareferencia, idcontaorcamen: string);
      Procedure InsereEspecial(idcriterioratorc, idplanoorcamen, exercicio,
        periodo, idpessoa: integer; idcontaorcamen, datareferencia: string;
        vlrrealizado, vlrorcado, vlrrateioori, vlrrealacum, vlrorcacum,
        percutilrateio: double);
      Procedure AltEspecial(idcriterioratorc, idplanoorcamen, idpessoa: integer;
        idcontaorcamen, datareferencia: string; vlrorcado, vlrrateioori, 
        vlrorcacum, percutilrateio: double);
      Procedure ZeraSaldo(idpessoa: integer; idcontaorcamen: string);
      Procedure AcertaValor(idpessoa, idplanoorcamen: integer; idcontaorcamen,
        datareferencia, campo: string; valor: double);
      Procedure InsereValor(idpessoa, idplanoorcamen, exercicio,
        periodo: integer; idcontaorcamen,datareferencia, campo: string;
        valor: double);
      Procedure AltSaldos3(idpessoa, exercicio, periodoini, periodofim: integer;
        vlrorcado, vlrorcacum: double);
      Procedure AltSaldos4(idpessoa, idplanoorcamen: integer; idcontaorcamen,
        datareferencia: string; vlrorcado, vlrorcacum: double);
      procedure AltVlrorcado(idpessoa, exercicio, periodoini,
        periodofim: integer; conteudo1, conteudo2, conteudo3, conteudo4: string;
        vlrorcado: double);
      Procedure AltSaldos5(idpessoa, idplanoorcamen: integer; idcontaorcamen,
        datareferencia: string; vlrorcado, vlrorcacum: double);
      procedure AltValoresGD(idplanoorcamen, exercicio, idpessoa: integer;
        dataini, datafim, conteudo1: string; vlrorcado, vlrorcacum: double);
      procedure AltValoresRealGD(idplanoorcamen, exercicio, idpessoa: integer;
        dataini, datafim, conteudo1: string; vlrrealizado, vlrrealacum: double);
      procedure AtualizaVlrReservado(idplanoorcamen, idpessoa: integer;
        idcontaorcamen, datareferencia: string; valor: double);
      procedure AltSaldos6(idpessoa, idplanoorcamen: integer; idcontaorcamen,
        datareferencia: string; vlrrealizado, vlrrealacum: double);
  end;

implementation


procedure TCtrlSaldoorcado.DoChangeDataBase;
begin
  inherited;
  _dbSaldoorcado.DatabaseName := DataBaseName;
end;

procedure TCtrlSaldoorcado.OnCreateAppServer;
begin
  inherited;
  FCdsSaldoorcado := TClientDataSet.Create(nil);
end;

constructor TCtrlSaldoorcado.Create;
begin
  inherited;
  _dbSaldoorcado := TdbSaldoorcado.Create(Self);
end;

destructor TCtrlSaldoorcado.Destroy;
begin
  inherited;
  _dbSaldoorcado.Free;
  if isAppServer then begin
    FreeCds([FCdsSaldoorcado]);
  end;
end;

function TCtrlSaldoorcado.AplicaOperacao: Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result :=
           Connection.AppServer.AplicaOperacaoSaldoorcado(FCdsSaldoorcado.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         Result := ApplyCDS(FCdsSaldoorcado,_DbSaldoorcado,[],[]);
         If Not Result Then Begin
            MessageInfo := _DbSaldoorcado.MessageInfo;
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


function TCtrlSaldoorcado.Procurar(idpessoa, idplanoorcamen:Double;
  idcontaorcamen: String; datareferencia: TDateTime): OleVariant;
begin
   _DbSaldoorcado.Idpessoa.AsFloat := idpessoa;
   _DbSaldoorcado.Idplanoorcamen.AsFloat := idplanoorcamen;
   _DbSaldoorcado.Idcontaorcamen.AsString := idcontaorcamen;
   _DbSaldoorcado.Datareferencia.AsDateTime := datareferencia;
   Result := GetDataPacket(_DbSaldoorcado.SSqlSelect);
end;

procedure TCtrlSaldoorcado.SetCdsSaldoorcado(
  const Value: TClientDataSet);
begin
  FCdsSaldoorcado := Value;
end;

function TCtrlSaldoorcado.TrocaVPP(numero: string): string;
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

procedure TCtrlSaldoorcado.AtualizaSaldo(idplanoorcamen, idpessoa: integer;
  idcontaorcamen, datareferencia: string; valor: double);
var sSQl : String;
begin
   sSql := 'UPDATE ' +
           '   SALDOORCADO ' +
           'SET ' +
           '   VLRORCADO = NVL(VLRORCADO,0) + ' + TrocaVPP(FloatToStr(valor)) + 
           ' WHERE ' +
           '   (IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
           '   (IDPESSOA = ' + IntToStr(idpessoa) + ') AND ' +
           '   (IDCONTAORCAMEN = ''' + idcontaorcamen + ''') AND ' +
           '   (DATAREFERENCIA = TO_DATE(''' + datareferencia +
           ''', ''DD/MM/YYYY''))';
   ExecSQL(sSql);
end;

Procedure TCtrlSaldoorcado.InsereSaldo(exercicio, periodo, idplanoorcamen,
  idpessoa: integer; idcontaorcamen, datareferencia: string; vlrorcado,
  vlrrealizado, vlrreservado, vlrcomprometido, vlrorcacum, vlrrealacum: double);
var sSQl : String;
begin
   sSql := 'INSERT INTO ' +
           '   SALDOORCADO ' +
           '   (IDCONTAORCAMEN, IDPESSOA, IDPLANOORCAMEN, DATAREFERENCIA,' +
           '    EXERCICIO, PERIODO, VLRREALIZADO, VLRORCADO, VLRRESERVADO,' +
           '    VLRCOMPROMETIDO, VLRORCACUM, VLRREALACUM) ' +
           'VALUES ' +
           '   (' + idcontaorcamen + ', ' + IntToStr(idpessoa) + ', ' +
           IntToStr(idplanoorcamen) + ', TO_DATE(''' + datareferencia +
           ''', ''DD/MM/YYYY''), ' +
           IntToStr(exercicio) + ', ' + IntToStr(periodo) + ', ' +
           TrocaVPP(FloatToStr(vlrrealizado)) + ', ' +
           TrocaVPP(FloatToStr(vlrorcado)) + ', ' +
           TrocaVPP(FloatToStr(vlrreservado)) + ', ' + 
           TrocaVPP(FloatToStr(vlrcomprometido)) + ', ' +
           TrocaVPP(FloatToStr(vlrorcacum)) + ', ' +
           TrocaVPP(FloatToStr(vlrrealacum)) + ')';
   ExecSQL(sSql);
end;

Procedure TCtrlSaldoorcado.TrocaSaldoReservadopCompromissado(valortotalreservas,
  valor: double; idpessoa, idplanoorcamen: integer; datareferencia,
  idcontaorcamen: string);
var sSQl : String;
begin
  sSql := 'UPDATE SALDOORCADO SET ' +
          'VLRRESERVADO = (NVL(VLRRESERVADO,0) - ' +
          TrocaVPP(FloatToStr(valortotalreservas)) + '), ' +
          'VLRCOMPROMETIDO = (NVL(VLRCOMPROMETIDO,0) + ' +
          TrocaVPP(FloatToStr(valor)) + ') WHERE  ' +
          '(IDPESSOA = ' + IntToStr(idpessoa) + ') AND ' +
          '(DATAREFERENCIA = TO_DATE(''' + datareferencia +
          ''',''DD/MM/YYYY'')) AND ' +
          '(IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
          '(IDCONTAORCAMEN = ''' + idcontaorcamen + ''')';
  ExecSQL(sSql);
end;

Procedure TCtrlSaldoorcado.RetiraValor(valorreserva: double; idpessoa,
  idplanoorcamen: integer; datareferencia, idcontaorcamen, flgvalor: string);
var sSQl, vfield: String;
begin
  Case flgvalor[1] of
    'C' : vfield := 'VLRCOMPROMETIDO';
    'R' : vfield := 'VLRRESERVADO';
  end;
  sSql := 'UPDATE SALDOORCADO SET ' +
          vfield + ' = (NVL(' + vfield + ',0) - ' +
          TrocaVPP(FloatToStr(valorreserva)) + ') WHERE ' +
          '(IDPESSOA = ' + IntToStr(idpessoa) + ') AND ' +
          '(DATAREFERENCIA = TO_DATE(''' + datareferencia +
          ''',''DD/MM/YYYY'')) AND ' +
          '(IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
          '(IDCONTAORCAMEN = ''' + idcontaorcamen + ''')';
  ExecSQL(sSql);
end;

Procedure TCtrlSaldoorcado.AltSaldos(valor, valorreserva: double; idpessoa,
  idplanoorcamen: integer; datareferencia, idcontaorcamen, sfield,
  flgrescomp: string);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO SET ' + sfield + ' = ' +
          '(NVL(' + sfield + ',0) - '  + TrocaVPP(FloatToStr(valor)) + ') ';
  if flgrescomp = 'C' then begin
    sSql := sSql + ', VLRRESERVADO = (NVL(VLRRESERVADO,0) + ' +
            TrocaVPP(FloatToStr(valorreserva)) + ') ';
  end;
  sSql := sSql + 'WHERE (IDPESSOA = ' + IntToStr(idpessoa) + ') AND ' +
                 '(DATAREFERENCIA = TO_DATE(''' + datareferencia +
                 ''',''DD/MM/YYYY'')) AND ' +
                 '(IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
                 '(IDCONTAORCAMEN = ''' + idcontaorcamen + ''')';
  ExecSQL(sSql);
end;

Procedure TCtrlSaldoorcado.EstornaSaldo(idpessoa, idplanoorcamen: integer;
  datareferencia, idcontaorcamen, sfield: string; valor: double);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO SET ' + sfield + ' = ' +
          '(NVL(' + sfield + ',0) - ' + TrocaVPP(FloatToStr(valor)) + 
          ') WHERE (IDPESSOA = ' + IntToStr(idpessoa) + ') AND ' +
          '(DATAREFERENCIA = TO_DATE(''' + datareferencia +
          ''',''DD/MM/YYYY'')) AND ' +
          '(IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
          '(IDCONTAORCAMEN = ''' + idcontaorcamen + ''')';
  ExecSQL(sSql);
end;

Procedure TCtrlSaldoorcado.AltSaldos2(valorrealizado, valororcado: double;
  idpessoa, idplanoorcamen: integer; datareferencia, idcontaorcamen: string);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO SET VLRREALIZADO = ' +
          TrocaVPP(FloatToStr(valorrealizado)) + ', VLRORCADO = ' +
          TrocaVPP(FloatToStr(valororcado)) + ' WHERE (IDCONTAORCAMEN = ''' +
          idcontaorcamen + ''') AND (IDPESSOA = ' + IntToStr(idpessoa) +
          ') AND (IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) +
          ') AND (DATAREFERENCIA = TO_DATE(''' + datareferencia +
          ''',''DD/MM/YYYY''))';
  ExecSQL(sSql);
end;

Procedure TCtrlSaldoorcado.InsereEspecial(idcriterioratorc, idplanoorcamen, 
  exercicio, periodo, idpessoa: integer; idcontaorcamen, datareferencia: string;
  vlrrealizado, vlrorcado, vlrrateioori, vlrrealacum, vlrorcacum,
  percutilrateio: double);
var sSQl: String;
begin
  sSql := 'INSERT INTO SALDOORCADO (IDCRITERIORATORC, IDCONTAORCAMEN, ' +
          'IDPLANOORCAMEN, DATAREFERENCIA, EXERCICIO, PERIODO, IDPESSOA, ' +
          'VLRREALIZADO, VLRORCADO, VLRRATEIOORI, VLRREALACUM, VLRORCACUM, ' +
          'PERCUTILRATEIO) VALUES (' + IntToStr(idcriterioratorc) + ', ''' +
          Trim(idcontaorcamen) + ''', ' + IntToStr(idplanoorcamen) +
          ', TO_DATE(''' + datareferencia + ''',''DD/MM/YYYY''), ' +
          IntToStr(exercicio) + ', ' + IntToStr(periodo) + ', ' +
          IntToStr(idpessoa) + ', ' + TrocaVPP(FloatToStr(vlrrealizado)) +
          ', ' + TrocaVPP(FloatToStr(vlrorcado)) + ', ' +
          TrocaVPP(FloatToStr(vlrrateioori)) + ', ' +
          TrocaVPP(FloatToStr(vlrrealacum)) + ', ' +
          TrocaVPP(FloatToStr(vlrorcacum)) + ', ' +
          TrocaVPP(FloatToStr(percutilrateio)) + ')';
  ExecSQL(sSql);
end;

Procedure TCtrlSaldoorcado.AltEspecial(idcriterioratorc, idplanoorcamen,
  idpessoa: integer; idcontaorcamen, datareferencia: string; vlrorcado, 
  vlrrateioori, vlrorcacum, percutilrateio: double);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO SET VLRORCADO = ' +
          TrocaVPP(FloatToStr(vlrorcado)) + ', VLRRATEIOORI = ' +
          TrocaVPP(FloatToStr(vlrrateioori)) + ', VLRORCACUM = ' +
          TrocaVPP(FloatToStr(vlrorcacum)) + ', PERCUTILRATEIO = ' +
          TrocaVPP(FloatToStr(percutilrateio)) + ', IDCRITERIORATORC = ' +
          IntToStr(idcriterioratorc) + 'WHERE (IDPLANOORCAMEN = ' +
          IntToStr(idplanoorcamen) + ') AND (IDCONTAORCAMEN = ''' +
          Trim(idcontaorcamen) + ''') AND (DATAREFERENCIA = TO_DATE(''' +
          Trim(datareferencia) + ''',''DD/MM/YYYY'')) AND (IDPESSOA = ' +
          IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

Procedure TCtrlSaldoorcado.ZeraSaldo(idpessoa: integer; idcontaorcamen: string);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO SET VLRRESERVADO = 0, VLRCOMPROMETIDO = 0 ' +
          'WHERE (IDPESSOA = ' + IntToStr(idpessoa) + idcontaorcamen;
  ExecSQL(sSql);
end;

Procedure TCtrlSaldoorcado.AcertaValor(idpessoa, idplanoorcamen: integer;
  idcontaorcamen, datareferencia, campo: string; valor: double);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO SET ' + campo + ' = NVL(' + campo + ',0) + ' +
          TrocaVPP(FloatToStr(valor)) + ' WHERE (IDPESSOA = ' +
          IntToStr(idpessoa) +  ') AND (IDPLANOORCAMEN = ' +
          IntToStr(idplanoorcamen) + ') AND (IDCONTAORCAMEN = ''' +
          idcontaorcamen + ''') AND (DATAREFERENCIA = TO_DATE(''' +
          datareferencia + ''',''DD/MM/YYYY''))';
  ExecSQL(sSql);
end;

Procedure TCtrlSaldoorcado.InsereValor(idpessoa, idplanoorcamen, exercicio,
  periodo: integer; idcontaorcamen, datareferencia, campo: string;
  valor: double);
var sSQl: String;
begin
  sSql := 'INSERT INTO SALDOORCADO(' + campo + ', IDPESSOA, IDPLANOORCAMEN, ' +
          'IDCONTAORCAMEN, DATAREFERENCIA, EXERCICIO, PERIODO) VALUES(' +
          TrocaVPP(FloatToStr(valor)) + ', ' + IntToStr(idpessoa) +
          ', ' + IntToStr(idplanoorcamen) + ', ''' + idcontaorcamen +
          ''', TO_DATE(''' + datareferencia + ''',''DD/MM/YYYY''), ' +
          IntToStr(exercicio) + ', ' + IntToStr(periodo) + ')';
  ExecSQL(sSql);
end;

Procedure TCtrlSaldoorcado.AltSaldos3(idpessoa, exercicio, periodoini,
  periodofim: integer; vlrorcado, vlrorcacum: double);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO SET VLRORCADO = ' +
          TrocaVPP(FloatToStr(vlrorcado)) + ', VLRORCACUM = ' +
          TrocaVPP(FloatToStr(vlrorcacum)) + ' WHERE (EXERCICIO = ' +
          IntToStr(exercicio) + ') AND (PERIODO >= ' + IntToStr(periodoini) +
          ') AND (PERIODO <= ' + IntToStr(periodofim) + ') AND (IDPESSOA = ' +
          IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

Procedure TCtrlSaldoorcado.AltSaldos4(idpessoa, idplanoorcamen: integer;
  idcontaorcamen, datareferencia: string; vlrorcado, vlrorcacum: double);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO SET VLRORCADO = NVL(VLRORCADO,0) + ' +
          TrocaVPP(FloatToStr(vlrorcado)) +
          ', VLRORCACUM = NVL(VLRORCACUM,0) + ' +
          TrocaVPP(FloatToStr(vlrorcacum)) + ' WHERE (IDPLANOORCAMEN = ' +
          IntToStr(idplanoorcamen) + ') AND (IDCONTAORCAMEN = ''' +
          idcontaorcamen + ''') AND (DATAREFERENCIA = TO_DATE(''' +
          datareferencia + ''',''DD/MM/YYYY'')) AND (IDPESSOA = ' +
          IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlSaldoorcado.AltVlrorcado(idpessoa, exercicio, periodoini,
  periodofim: integer; conteudo1, conteudo2, conteudo3, conteudo4: string;
  vlrorcado: double);
var sSql: string;
begin
  sSql := 'UPDATE SALDOORCADO SET VLRORCADO = ' +
          TrocaVPP(FloatToStr(vlrorcado)) + ' WHERE (EXERCICIO = ' +
          IntToStr(exercicio) + ')' + conteudo1 + conteudo2 + conteudo3 +
          conteudo4 + ' AND (PERIODO >= ' + IntToStr(periodoini) +
          ') AND (PERIODO <= ' + IntToStr(periodofim) + ') AND (IDPESSOA = ' +
          IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

Procedure TCtrlSaldoorcado.AltSaldos5(idpessoa, idplanoorcamen: integer;
  idcontaorcamen, datareferencia: string; vlrorcado, vlrorcacum: double);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO SET VLRORCADO = ' +
          TrocaVPP(FloatToStr(vlrorcado)) + ', VLRORCACUM = ' +
          TrocaVPP(FloatToStr(vlrorcacum)) + ' WHERE (IDPLANOORCAMEN = ' +
          IntToStr(idplanoorcamen) + ') AND (IDCONTAORCAMEN = ''' +
          idcontaorcamen + ''') AND (DATAREFERENCIA = TO_DATE(''' +
          datareferencia + ''',''DD/MM/YYYY'')) AND (IDPESSOA = ' +
          IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlSaldoorcado.AltValoresGD(idplanoorcamen, exercicio,
  idpessoa: integer; dataini, datafim, conteudo1: string; vlrorcado,
  vlrorcacum: double);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO S SET S.VLRORCADO = ' +
          TrocaVPP(FloatToStr(vlrorcado)) + '0, VLRORCACUM = ' +
          TrocaVPP(FloatToStr(vlrorcacum)) + ' WHERE (EXISTS (SELECT ' +
          'C.IDCONTAORCAMEN FROM CONTASORCAMEN C WHERE ' +
          '(C.IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
          '(C.TIPOCALCORCADO <> ''V'') AND (C.TIPOCALCORCADO <> ''T'') AND ' +
          '(C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND ' +
          '(C.IDPLANOORCAMEN = S.IDPLANOORCAMEN))) AND ' +
          '(S.IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
          '(S.DATAREFERENCIA >= TO_DATE(''' + dataini +
          ''',''DD/MM/YYYY'')) AND (S.DATAREFERENCIA <= TO_DATE(''' + datafim +
          ''',''DD/MM/YYYY'')) AND ' + conteudo1 + '(S.IDPESSOA = ' +
          IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlSaldoorcado.AltValoresRealGD(idplanoorcamen, exercicio,
  idpessoa: integer; dataini, datafim, conteudo1: string; vlrrealizado,
  vlrrealacum: double);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO S SET S.VLRREALIZADO = ' +
          TrocaVPP(FloatToStr(vlrrealizado)) + ' , VLRREALACUM = ' +
          TrocaVPP(FloatToStr(vlrrealacum)) + ' WHERE (EXISTS (SELECT ' +
          'C.IDCONTAORCAMEN FROM CONTASORCAMEN C WHERE ' +
          '(C.IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
          '(C.TIPOCALCORCADO <> ''V'') AND (C.TIPOCALCORCADO <> ''T'') AND ' +
          '(C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND ' +
          '(C.IDPLANOORCAMEN = S.IDPLANOORCAMEN))) AND ' +
          '(S.IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
          '(S.DATAREFERENCIA >= TO_DATE(''' + dataini +
          ''',''DD/MM/YYYY'')) AND (S.DATAREFERENCIA <= TO_DATE(''' + datafim +
          ''',''DD/MM/YYYY'')) AND ' + conteudo1 + '(S.IDPESSOA = ' +
          IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlSaldoorcado.AtualizaVlrReservado(idplanoorcamen,
  idpessoa: integer; idcontaorcamen, datareferencia: string; valor: double);
var sSQl : String;
begin
   sSql := 'UPDATE ' +
           '   SALDOORCADO ' +
           'SET ' +
           '   VLRRESERVADO = NVL(VLRRESERVADO,0) + ' +
           TrocaVPP(FloatToStr(valor)) + ' ' +
           'WHERE ' +
           '   (IDPLANOORCAMEN = ' + IntToStr(idplanoorcamen) + ') AND ' +
           '   (IDPESSOA = ' + IntToStr(idpessoa) + ') AND ' +
           '   (IDCONTAORCAMEN = ''' + idcontaorcamen + ''') AND ' +
           '   (DATAREFERENCIA = TO_DATE(''' + datareferencia +
           ''', ''DD/MM/YYYY''))';
   ExecSQL(sSql);
end;

Procedure TCtrlSaldoorcado.AltSaldos6(idpessoa, idplanoorcamen: integer;
  idcontaorcamen, datareferencia: string; vlrrealizado, vlrrealacum: double);
var sSQl: String;
begin
  sSql := 'UPDATE SALDOORCADO SET VLRREALIZADO = ' +
          TrocaVPP(FloatToStr(vlrrealizado)) + ', VLRREALACUM = ' +
          TrocaVPP(FloatToStr(vlrrealacum)) + ' WHERE (IDPLANOORCAMEN = ' +
          IntToStr(idplanoorcamen) + ') AND (IDCONTAORCAMEN = ''' +
          idcontaorcamen + ''') AND (DATAREFERENCIA = TO_DATE(''' +
          datareferencia + ''',''DD/MM/YYYY'')) AND (IDPESSOA = ' +
          IntToStr(idpessoa) + ')';
  ExecSQL(sSql);
end;
//************************************************
end.
