Unit uCtrlEfetivacao;

interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, sysutils, wwQuery, provider, uCMTypes;

Type
  TCtrlEfetivacao = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
  private
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;
      function Reservas(usuario, idpessoa: integer; dataini, datafim: string;
        freserva, fcompromisso, fcancela: boolean) : OleVariant;
      function AltReservas(idpessoa, idcompromisso: integer) : OleVariant;
      function DocRec : OleVariant;
      Function FiltraDocRec( dataini,
                             datafim: string;
                             Cliente,
                             pValorIni,
                             pValorFim   : Double;
                             pOrdenarPor : Integer ) : OleVariant;

      function TestaDocxComp(coddocumento,
        idreservaorcamen: double) : OleVariant;
  end;

implementation


procedure TCtrlEfetivacao.DoChangeDataBase;
begin
  inherited;
  //
end;

constructor TCtrlEfetivacao.Create;
begin
  inherited;
  //
end;

destructor TCtrlEfetivacao.Destroy;
begin
  inherited;
  //
end;

function TCtrlEfetivacao.Reservas(usuario, idpessoa: integer; dataini,
  datafim: string; freserva, fcompromisso, fcancela: boolean) : OleVariant;
var sSql: string;
begin
  sSql := 'SELECT R.NUMRESERVA, R.DATAREFERENCIA, R.VLRRESERVA, ' +
          'R.VLRCOMPROMISSO, R.FLGRESERVA, R.IDRESERVAORCAMEN, ' +
          'R.IDCONTAORCAMEN, C.NOMECONTAORCAMEN, R.FLGRESCOMP, ' +
          'R.VLRDEVOLVIDO, R.IDPLANOORCAMEN, R.EXERCICIO, R.PERIODO, ' +
          'C.CODCENTRORESPON, ''                         '' AS STATUS ' +
          'FROM RESERVAORCAMEN R, CONTASORCAMEN C, PESSOAXCRESP CR ' +
          'WHERE  ' +
          '(CR.CODCENTRORESPON = C.CODCENTRORESPON) AND ' +
          '(CR.IDPESSOA = C.IDPESSOA) AND ' +
          '(CR.IDPESSOAACESSO = ' + IntToStr(usuario) + ') AND ' +
          '(R.IDPESSOA = ' + IntToStr(idpessoa) + ') AND ' +
          '(R.DATAREFERENCIA BETWEEN TO_DATE(''' + dataini +
          ''',''DD/MM/YYYY'') AND TO_DATE(''' + datafim +
          ''',''DD/MM/YYYY'')) AND ' ;
  if freserva then begin
    sSql := sSql + '(R.FLGRESCOMP <> ''R'') AND ';
  end;
  if fcompromisso then begin
    sSql := sSql + '(R.FLGRESCOMP <> ''C'') AND ';
  end;
  if fcancela then begin
    sSql := sSql + '(R.FLGRESERVA <> ''C'') AND ';
  end;
  sSql := sSql + '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) ' +
                 'ORDER BY R.DATAREFERENCIA, R.NUMRESERVA ';
  Result := GetDataPacket(sSql);
end;

function TCtrlEfetivacao.AltReservas(idpessoa,
  idcompromisso: integer) : OleVariant;
var sSql: string;
begin
  sSql := 'SELECT SUM(R.VLRRESERVA) AS TOTALRESERVA ' +
          'FROM RESERVAORCAMEN R, RESXCOMP RC ' +
          'WHERE    (RC.IDPESSOA = R.IDPESSOA) ' +
          'AND  (RC.IDRESERVA = R.IDRESERVAORCAMEN) ' +
          'AND  (RC.IDCOMPROMISSO = ' + IntToStr(idcompromisso) +
          ') AND  (RC.IDPESSOA = ' + IntToStr(idpessoa) + ')';
  Result := GetDataPacket(sSql);
end;

function TCtrlEfetivacao.DocRec : OleVariant;
var sSql: string;
begin
  sSql := 'SELECT ' +
          ''' '' AS MARCA, ' +
          'D.CODDOCUMENTO, ' +
          'D.NODOCUMENTO, ' +
          'D.COMPLDOCUMENTO, ' +
          'P.RAZAOSOCIAL, ' +
          'SUM(DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))-' +
          'DECODE(DC.VLRREEMBOLSO,NULL,0,DC.VLRREEMBOLSO) AS VALOR ' +
          'FROM DOCUMENTO D, ' +
          'LANCTODOCUM L, ' +
          'PESSOA P, ' +
          '(SELECT CODDOCUMENTO, SUM(VLRREEMBOLSO) AS VLRREEMBOLSO ' +
          'FROM DOCRECXCOMP ' +
          'GROUP BY CODDOCUMENTO) DC ' +
          'WHERE (1 = 2) ' +
          'GROUP BY D.CODDOCUMENTO, D.NODOCUMENTO, D.COMPLDOCUMENTO, ' +
          'P.RAZAOSOCIAL, DC.VLRREEMBOLSO ' +
          'HAVING (SUM(DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))-' +
          'DECODE(DC.VLRREEMBOLSO,NULL,0,DC.VLRREEMBOLSO)) > 0';
  Result := GetDataPacket(sSql);
end;
//************************************************
Function TCtrlEfetivacao.FiltraDocRec( DataIni,
                                       DataFim   : string;
                                       Cliente,
                                       pValorIni,
                                       pValorFim : Double;
                                       pOrdenarPor : Integer ) : OleVariant;
Var
  sSql : String;
Begin
  sSql := 'SELECT '' '' AS MARCA, D.CODDOCUMENTO, D.NODOCUMENTO, D.COMPLDOCUMENTO, ' +
          '  P.RAZAOSOCIAL, SUM(DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1)) - ' +
          '  DECODE(DC.VLRREEMBOLSO,NULL,0,DC.VLRREEMBOLSO) AS VALOR ' + #13 + #10 +
          'FROM DOCUMENTO D, LANCTODOCUM L, PESSOA P, ' + #13 + #10 +
          '  ( SELECT CODDOCUMENTO, SUM(VLRREEMBOLSO) AS VLRREEMBOLSO ' +
          '    FROM DOCRECXCOMP GROUP BY CODDOCUMENTO ) DC ' + #13 + #10 +
          'WHERE (L.OPERACAO = ''5 '') AND (D.RECPAG = ''R'') AND ';
      if trim(dataini) <> '' then
        sSql := sSql + '(L.DATALANCTO >= TO_DATE(''' + trim(dataini) +
                       ''',''DD/MM/YYYY'')) AND ';
      if trim(datafim) <> '' then
        sSql := sSql + '(L.DATALANCTO <= TO_DATE(''' + trim(datafim) +
                       ''',''DD/MM/YYYY'')) AND ';

      if cliente <> 0 then
        sSql := sSql + '(D.IDFORCLI = ' + FloatToStr(cliente) + ') AND ';

      sSql := sSql + '(D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
                     '(P.IDPESSOA = D.IDFORCLI) AND ' +
                     '(DC.CODDOCUMENTO(+) = D.CODDOCUMENTO) ' + #13 + #10 +
                     'GROUP BY D.CODDOCUMENTO, D.NODOCUMENTO, ' +
                     'D.COMPLDOCUMENTO, P.RAZAOSOCIAL, DC.VLRREEMBOLSO ' + #13 + #10;

      If ( pValorIni = 0 ) And ( pValorFim = 0 ) Then

        sSql := sSql + 'HAVING (SUM(DECODE(L.DEBCRE,''C'',L.VALOR,' +
                       'L.VALOR*-1)) - DECODE(DC.VLRREEMBOLSO,NULL,0,' +
                       'DC.VLRREEMBOLSO)) > 0'

      Else If ( pValorIni > 0 ) And ( pValorFim > 0 ) Then

        sSql := sSql + 'HAVING (SUM(DECODE(L.DEBCRE,''C'',L.VALOR,' +
                       'L.VALOR*-1)) - DECODE(DC.VLRREEMBOLSO,NULL,0,' +
                       'DC.VLRREEMBOLSO)) BETWEEN ' + FloatToStr( pValorIni ) + ' AND ' + FloatToStr( pValorFim )

      Else If ( pValorIni > 0 ) Then

        sSql := sSql + 'HAVING (SUM(DECODE(L.DEBCRE,''C'',L.VALOR,' +
                       'L.VALOR*-1)) - DECODE(DC.VLRREEMBOLSO,NULL,0,' +
                       'DC.VLRREEMBOLSO)) >= ' + FloatToStr( pValorIni )

      Else If ( pValorFim > 0 ) Then Begin

        sSql := sSql + 'HAVING (SUM(DECODE(L.DEBCRE,''C'',L.VALOR,' +
                       'L.VALOR*-1)) - DECODE(DC.VLRREEMBOLSO,NULL,0,' +
                       'DC.VLRREEMBOLSO)) <= ' + FloatToStr( pValorFim );
      End;

      sSql := sSql + ' ORDER BY ';

      If ( pOrdenarPor = 0 ) Then sSql := sSql + 'P.RAZAOSOCIAL' Else
      If ( pOrdenarPor = 1 ) Then sSql := sSql + 'D.NODOCUMENTO' Else
      If ( pOrdenarPor = 2 ) Then sSql := sSql + 'VALOR';

  Result := GetDataPacket(sSql);
End;

function TCtrlEfetivacao.TestaDocxComp(coddocumento,
  idreservaorcamen: double) : OleVariant;
var sSql: string;
begin
  sSql := 'SELECT CODDOCUMENTO FROM DOCRECXCOMP ' +
          'WHERE (CODDOCUMENTO = ' + FloatToStr(coddocumento) +
          ') AND (IDRESERVAORCAMEN = ' + FloatToStr(idreservaorcamen) + ')';
  Result := GetDataPacket(sSql);
end;

end.


