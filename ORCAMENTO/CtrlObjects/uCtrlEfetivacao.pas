// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : .Reservas
Data      : 25/06/2004
Autor     : André Pontes
Pendencia : 16910 e 16723
Descrição : Incluído na query o campo IDCOMPROMISSO da tabela RESXCOMP + organização do código
---------------------------------------------------------------------------------------------------}

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
        freserva, fcompromisso, fcancela: boolean; bAgrupar : boolean = False) : OleVariant;

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



function TCtrlEfetivacao.Reservas(usuario, idpessoa : integer;
                                  dataini, datafim  : string;
                                  freserva, fcompromisso, fcancela: boolean; bAgrupar : boolean = False
                                 ): OleVariant;
var
   sSql, sSQLTot: string;
begin
// Modificada a query para traduzir o NUMCOMPROMISSO a partir do IDCOMPROMISSO
// na tabela RESXCOMP

  sSql :=
          'SELECT DISTINCT R.NUMRESERVA, '+#13+ // Incluído o DISTINCT
          '       CPR.NUMCOMPROMISSO,'    +#13+ // necessário devido a registros duplicados quando temos
                                                // relacionamentos 1xN na RESXCOMP

          '       R.IDOPERACAO,      '    +#13+

          '       R.DATAREFERENCIA,  '    +#13+
          '       R.VLRRESERVA AS VALOR, '    +#13+  //Renan Cristiano SOL 151941 Kintana 1121546 Inicio
          '       R.VLRCOMPROMISSO,  '    +#13+
          '       R.FLGRESERVA,      '    +#13+
          '       R.IDRESERVAORCAMEN,'    +#13+
          '       R.IDCONTAORCAMEN,  '    +#13+
          '       C.NOMECONTAORCAMEN,'    +#13+
          '       R.FLGRESCOMP,      '    +#13+
          '       R.VLRDEVOLVIDO,    '    +#13+
          '       R.IDPLANOORCAMEN,  '    +#13+
          '       R.EXERCICIO,       '    +#13+
          '       R.PERIODO,         '    +#13+
          '       C.CODCENTRORESPON, '    +#13+
          '  ''                                       '' AS STATUS,        '    +#13+
          //Renan Cristiano SOL 151941 Kintana 1121546 Inicio
          '  ''N'' AS VALIDAR        '    +#13+

          '  FROM RESERVAORCAMEN R,  '    +#13+
          '       RESXCOMP       RXC,'    +#13+
          '       CONTASORCAMEN  C,  '    +#13+
          '       PESSOAXCRESP   CR, '    +#13+

          '       (SELECT R1.NUMRESERVA,                  '                         +#13+
          '               R2.NUMRESERVA AS NUMCOMPROMISSO '                         +#13+
          '          FROM RESERVAORCAMEN R1,              '                         +#13+
          '               RESERVAORCAMEN R2,              '                         +#13+
          '               RESXCOMP RXC1                   '                         +#13+
          '         WHERE R1.DATAREFERENCIA BETWEEN                        '        +
          '               TO_DATE(''' + dataini + ''', ''DD/MM/YYYY'') AND '        +
          '               TO_DATE(''' + datafim + ''', ''DD/MM/YYYY'')     '        +#13+
          '           AND R1.IDRESERVAORCAMEN = RXC1.IDRESERVA                 '    +#13+
          '           AND R2.IDRESERVAORCAMEN = RXC1.IDCOMPROMISSO) CPR        '    +#13+

          ' WHERE CR.CODCENTRORESPON = C.CODCENTRORESPON '                  +#13+
          '   AND CR.IDPESSOA        = C.IDPESSOA        '                  +#13+
          '   AND CR.IDPESSOAACESSO  = ' + IntToStr(usuario)                +#13+
          '   AND R.IDPESSOA         = ' + IntToStr(idpessoa)               +#13+
          '   AND R.DATAREFERENCIA   BETWEEN                       '        +
          '       TO_DATE(''' + dataini + ''', ''DD/MM/YYYY'') AND '        +
          '       TO_DATE(''' + datafim + ''', ''DD/MM/YYYY'')     '        +#13;

  if freserva then
    sSql := sSql +
          '   AND R.FLGRESCOMP       <> ''R'' '                             +#13;

  if fcompromisso then
    sSql := sSql +
          '   AND R.FLGRESCOMP       <> ''C'' '                             +#13;

  if fcancela then
    sSql := sSql +
          '   AND R.FLGRESERVA       <> ''C'' '                             +#13;

  sSql := sSql +
          '   AND R.IDCONTAORCAMEN   = C.IDCONTAORCAMEN  '                  +#13+
          '   AND R.IDPLANOORCAMEN   = C.IDPLANOORCAMEN  '                  +#13+
          '   AND R.NUMRESERVA       = CPR.NUMRESERVA(+) '                  +#13+
          '   AND R.IDRESERVAORCAMEN = RXC.IDRESERVA(+)  '                  +#13+
          'ORDER BY '                                                       +#13+
          '   R.DATAREFERENCIA, R.NUMRESERVA';

   //Renan Cristiano Inicio
   if (bAgrupar) then
   begin
     sSQLTot := 'SELECT DATAREFERENCIA, STATUS, NOMECONTAORCAMEN, EXERCICIO, '+
                '       PERIODO, CODCENTRORESPON, FLGRESCOMP, IDOPERACAO, FLGRESERVA, ' +
                '       NVL(SUM(VALOR),0) AS VALOR, NVL(SUM(VLRCOMPROMISSO),0) AS VLRCOMPROMISSO, NVL(SUM(VLRDEVOLVIDO),0) AS VLRDEVOLVIDO '+
                'FROM ('+
                 sSql +
                ') GROUP BY DATAREFERENCIA, STATUS, NOMECONTAORCAMEN, EXERCICIO, '+
                '           PERIODO, CODCENTRORESPON, FLGRESCOMP, IDOPERACAO, FLGRESERVA ';
     Result := GetDataPacket(sSQLTot);
   end else
     Result := GetDataPacket(sSQL);
   //Renan Cristiano Fim     

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



function TCtrlEfetivacao.TestaDocxComp(coddocumento, idreservaorcamen: double) : OleVariant;
var
   sSql: string;
begin
  sSql := 'SELECT CODDOCUMENTO FROM DOCRECXCOMP ' +
          'WHERE (CODDOCUMENTO = ' + FloatToStr(coddocumento) +
          ') AND (IDRESERVAORCAMEN = ' + FloatToStr(idreservaorcamen) + ')';
  Result := GetDataPacket(sSql);
end;



end.
