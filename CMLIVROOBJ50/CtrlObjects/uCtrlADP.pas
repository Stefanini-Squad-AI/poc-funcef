unit uCtrlADP;

interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     uCMClientDataSet, classes;

Type
    TCtrlADP = Class(TCmControlObject)

    private
      cds : TCMClientDataSet;
    protected

      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      //Lista o número que identifica a filial
      function PegaNumFilial(IdPessoa : longInt) : string;
      //Lista notas de Entrada do Almoxarifado
      function ListNotasRecebimento(IdPessoa : LongInt; Data : string) : OleVariant;
      //Lista os produtos
      function ListProdutos(PrimeiraVez : Boolean; Data : string) : OleVariant;
      //lista os clientes
      function ListClientes(PrimeiraVez : Boolean; Data : string; IdPessoa : LongInt) : OleVariant;
      //lista os fornecedores
      function ListFornecedores(PrimeiraVez : Boolean; Data : string; IdPessoa : LongInt) : OleVariant;
      //Lista os Lançamentos
      function ListLancamentos(IdEmpresa : longInt; Data : string) : OleVariant;
      //Lista os Notas do PDV
      function ListaNotasPDV(Data : string) : OleVariant;
      //Lista os Centros de custo
      function ListCentroCusto(PrimeiraVez : Boolean; Data : string; IdPessoa : LongInt) : OleVariant;
      //Lista as contas
      function ListContas(PrimeiraVez : Boolean; Data : string; IdPessoa : LongInt) : OleVariant;
      //Lista as SubContas
      function ListSubContas(PrimeiraVez : Boolean; Data : string; IdPessoa : LongInt) : OleVariant;


    protected

    End;

implementation

{ TCtrlADP }



constructor TCtrlADP.Create;
begin
  inherited;
  cds := TCMClientDataSet.Create(nil);
end;

destructor TCtrlADP.Destroy;
begin
  inherited;
  cds.free;
end;


procedure TCtrlADP.DoChangeDataBase;
begin
  inherited;

end;






function TCtrlADP.ListNotasRecebimento(IdPessoa: Integer;
                                       Data: string): OleVariant;
Var
 Ssql : string;
begin
  Ssql := 'SELECT NF.NUMNF, NF.COMPLNF, P.NUMDOCUMENTO, TO_CHAR(NF.DATAENTDEVOL, ''DDMMYYYY'') AS DATAENTDEVOL, TO_CHAR(NF.DATAEMISNF, ''DDMMYYYY'') AS DATAEMISNF, '+
          '       REPLACE(REPLACE(IT.CODFISCAL, ''.''), ''-'') AS  CODFISCAL, (A.ALIQUOTA * 100) AS ALIQUOTA, (A.BASECALCULO * 100) AS BASECALCULO, A.VLRRECUPERADO,  '+
          '       ((IT.QTDERECEBDEVOL*IT.VLRUNITARIO) * 100) AS VALORCONTABIL, PROD.ISENTOOUTROS, (IT.QTDERECEBDEVOL * 100) AS QTDERECEBDEVOL, '+
          '       IT.CODARTIGO, (IT.VLRUNITARIO * 100) AS VLRUNITARIO, T.CODTIPOCUSTAGREG, PROD.SITUACAOTRIB, '+
          '       DECODE(IMP.CODIMPOSTO, 12, (A.VLRAGREGADO * 100), 0) AS VLRICMSSUBST, '+
          '       DECODE(IMP.CODIMPOSTO, 13, (A.VLRAGREGADO * 100), 0) AS VLRIPI, '+
          '       DECODE(A.VLRRECUPERADO, 0, 0, (A.VLRAGREGADO * 100)) AS VALORIMPOSTO '+
          '  FROM TIPOAGRE T, PRODUTO PROD, NFRECEBDEVOL NF, ITENSRECEBDEVOL IT, '+
          '       AGRITENSRECDEV A, PESSOA P, ALTXIMPOSTO IMP, ARTIGO AR '+
          ' WHERE NF.IDPESSOA = '+ intTostr(IdPessoa) +
          '   AND NF.DATAEMISNF = TO_DATE('+ quotedStr(Data) + ', ''DD/MM/YYYY'') '+
          '   AND NF.IDFORCLI = P.IDPESSOA(+) '+
          '   AND NF.IDNFRECEBDEVOL = IT.IDNFRECEBDEVOL '+
          '   AND IT.CODARTIGO = AR.CODARTIGO '+
          '   AND AR.CODARTIGO = PROD.CODPRODUTO '+
          '   AND IT.IDITENSRECDEV = A.IDITENSRECDEV '+
          '   AND A.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG(+) '+
          '   AND A.CODTIPOCUSTAGREG = IMP.CODTIPOCUSTAGREG(+) ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlADP.PegaNumFilial(IdPessoa: Integer): string;
Var
  Ssql : string;
begin
  Ssql := 'SELECT SUBSTR(P.NUMDOCUMENTO, 9, 4) AS NUMFILIAL'+
          '  FROM PESSOA P '+
          ' WHERE P.IDPESSOA = '+intTostr(IdPessoa);
  cds.data := GetDataPacket(Ssql);
  if not cds.IsEmpty then
    Result := '0' + cds.fieldByname('NUMFILIAL').Asstring
  else
    Result := '00000';
end;

procedure TCtrlADP.OnCreateAppServer;
begin
  inherited;

end;

function TCtrlADP.ListProdutos(PrimeiraVez: Boolean;
                               Data: string): OleVariant;
Var
 Ssql : string;
begin
  Ssql := 'SELECT P.DESCPROD, A.CODARTIGO, P.CODMEDANALISE, '+
          '       DECODE(P.ISENTOOUTROS, NULL, ''00001'', DECODE(P.ISENTOOUTROS, ''I'', ''00002'', '+
          '       DECODE(P.ISENTOOUTROS, ''O'', ''00003'', ''00001''))) AS SITUACAOTRIBFED '+
          '  FROM PRODUTO P, ARTIGO A '+
          ' WHERE A.CODPRODUTO = P.CODPRODUTO ';
  if not PrimeiraVez then
     Ssql := Ssql + ' AND P.TRGDTINCLUSAO = TO_DATE('+quotedStr(Data) + ', ''DD/MM/YYYY'') ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlADP.ListClientes(PrimeiraVez: Boolean;
                               Data: string; IdPessoa : LongInt): OleVariant;
Var
 Ssql : string;
begin
  Ssql := 'SELECT P.NUMDOCUMENTO, P.RAZAOSOCIAL, D.NUMDOCUMENTO AS INSCEST, ES.CODESTADO AS ESTADOCOMERCIAL, '+
          '       EST.CODESTADO AS ESTADOCOBRANCA, C.NOME, E.CEP, E.LOGRADOURO '+
          '  FROM ENDPESS E, ESTADO ES, ESTADO EST, CIDADES C, PESSOA P, EMPRESACLIENTE CLI, '+
          '       ENDPESS EPES, CIDADES CID, DOCPESSOA D, '+
          '       (SELECT IDINSCEST FROM PARAMLIVRO WHERE IDPESSOA = '+intTostr(IdPessoa)+') ID '+
          ' WHERE CLI.IDFORCLI = P.IDPESSOA '+
          '   AND D.IDPESSOA(+) = P.IDPESSOA '+
          '   AND D.IDDOCUMENTO = ID.IDINSCEST(+) '+
          '   AND P.IDENDCOMERCIAL = E.IDENDERECO(+) '+
          '   AND E.IDCIDADES = C.IDCIDADES(+) '+
          '   AND C.IDESTADO = ES.IDESTADO(+) '+
          '   AND P.IDENDCOBRANCA = EPES.IDENDERECO(+) '+
          '   AND EPES.IDCIDADES = CID.IDCIDADES(+) '+
          '   AND CID.IDESTADO = EST.IDESTADO(+) ';
  if not PrimeiraVez then
     Ssql := Ssql + ' AND CLI.TRGDTINCLUSAO = TO_DATE('+quotedStr(Data) + ', ''DD/MM/YYYY'') ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlADP.ListFornecedores(PrimeiraVez: Boolean; Data: string;
                                   IdPessoa: Integer): OleVariant;
Var
 Ssql : string;
begin
  Ssql := 'SELECT P.NUMDOCUMENTO, P.RAZAOSOCIAL, D.NUMDOCUMENTO AS INSCEST, ES.CODESTADO AS ESTADOCOMERCIAL, '+
          '       EST.CODESTADO AS ESTADOCOBRANCA, C.NOME, E.CEP, E.LOGRADOURO '+
          '  FROM ENDPESS E, ESTADO ES, ESTADO EST, CIDADES C, PESSOA P, EMPRESAFORN FORN, '+
          '       ENDPESS EPES, CIDADES CID, DOCPESSOA D, '+
          '       (SELECT IDINSCEST FROM PARAMLIVRO WHERE IDPESSOA = '+intTostr(IdPessoa)+') ID '+
          ' WHERE FORN.IDFORCLI = P.IDPESSOA '+
          '   AND D.IDPESSOA(+) = P.IDPESSOA '+
          '   AND D.IDDOCUMENTO = ID.IDINSCEST(+) '+
          '   AND P.IDENDCOMERCIAL = E.IDENDERECO(+) '+
          '   AND E.IDCIDADES = C.IDCIDADES(+) '+
          '   AND C.IDESTADO = ES.IDESTADO(+) '+
          '   AND P.IDENDCOBRANCA = EPES.IDENDERECO(+) '+
          '   AND EPES.IDCIDADES = CID.IDCIDADES(+) '+
          '   AND CID.IDESTADO = EST.IDESTADO(+) ';
  if not PrimeiraVez then
     Ssql := Ssql + ' AND FORN.TRGDTINCLUSAO = TO_DATE('+quotedStr(Data) + ', ''DD/MM/YYYY'') ';
  Result := GetDataPacket(Ssql);
end;


function TCtrlADP.ListLancamentos(IdEmpresa: Integer;
                                  Data: string): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT TO_CHAR(U.PLNDATDIA, ''YYYYMMDD'') AS PLNDATDIA, U.ORDEM, U.PLNCODIGO, U.LACDEBCRE, U.PLAREDUZ, '+
          '       U.CODCENTROCUSTO, U.CODSUBCONTA, TO_CHAR(U.VALOR, ''99999999.99'') AS VALOR, U.HIST, U.NUMDOC '+
          '  FROM (SELECT P.PLNDATDIA, 1 AS ORDEM, P.PLNCODIGO, L.LACDEBCRE, PL.PLAREDUZ, '+
          '               '''' AS CODCENTROCUSTO, 0 AS CODSUBCONTA, SUM(L.LACVALOR) AS VALOR, '+
          '               MAX(L.LACNUMDOC) AS NUMDOC, MAX(L.LACHIST1||'' ''||L.LACHIST2||'' ''||L.LACHIST3||'' ''||L.LACHIST4||'' '' ||L.LACHIST5) AS HIST '+
          '          FROM PLANILHA P, LANCAMENTO L, PLANOCONTA PL'+
          '         WHERE (P.PLNDATDIA = TO_DATE('+quotedStr(Data)+',''DD/MM/YYYY'')) '+
          '           AND (P.IDPESSOA  = '+intTostr(IdEmpresa)+ ') '+
          '           AND (P.PLNCODIGO = L.PLNCODIGO) '+
          '           AND (L.PLANO = PL.PLANO) '+
          '           AND (L.PLACONTA = PL.PLACONTA) '+
          '         GROUP BY P.PLNDATDIA,P.PLNCODIGO, L.LACDEBCRE, PL.PLAREDUZ '+
          ' UNION ALL '+
          ' SELECT P.PLNDATDIA,2 AS ORDEM, P.PLNCODIGO,L.LACDEBCRE, PL.PLAREDUZ, '+
          '        L.CODCENTROCUSTO,  L.CODSUBCONTA, SUM(L.LACVALOR) AS VALOR, '+
          '        '''' AS NUMDOC, '''' AS HIST '+
          '   FROM PLANILHA P,LANCAMENTO L, PLANOCONTA PL '+
          '  WHERE (P.PLNDATDIA = TO_DATE('+quotedStr(Data)+',''DD/MM/YYYY'')) '+
          '    AND (P.IDPESSOA  ='+intTostr(IdEmpresa)+ ') '+
          '    AND (P.PLNCODIGO = L.PLNCODIGO) '+
          '    AND ((L.CODSUBCONTA IS NOT NULL) OR (L.CODCENTROCUSTO IS NOT NULL)) '+
          '    AND (L.PLANO = PL.PLANO)  '+
          '    AND (L.PLACONTA = PL.PLACONTA) '+
          '  GROUP BY P.PLNDATDIA,P.PLNCODIGO, L.LACDEBCRE, PL.PLAREDUZ,L.CODCENTROCUSTO, '+
          '           L.CODSUBCONTA) U '+
          '  ORDER BY U.PLNCODIGO, U.LACDEBCRE DESC, U.ORDEM ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlADP.ListaNotasPDV(Data: string): OleVariant;
Var
  Ssql : TStringList;
begin
  Ssql := TStringList.Create;
  Ssql.Append('Select   PI.codImpressora, TO_CHAR(L.DataLanc, ''DDMMYYYY'') AS DataLanc, L.NumNota, I.CODARTIGO, L.Quantidade, (L.PrecoUnit * 100) AS PrecoUnit, ');
  Ssql.Append('         (T.ValorTotalRat * 100) AS ValorTotalRat, N.CUPOMFISCAL, ');
  Ssql.Append('         DECODE(NVL(BASECALCULO, 0), 0, 0, REPLACE(TO_CHAR(((ALIQUOTA /BASECALCULO) * ');
  Ssql.Append('         ((L.Quantidade * L.PrecoUnit)-Decode(N.Desconto,Null,0,(L.Quantidade * L.PrecoUnit * N.Desconto / T.ValorTotalRat)))), ''999999999999.99''), ''.'')) AS VALORIMPOSTO, ');
  Ssql.Append('         (((L.Quantidade * L.PrecoUnit)-Decode(N.Desconto,Null,0,(L.Quantidade * L.PrecoUnit * N.Desconto / T.ValorTotalRat))) * 100) as ValorContabil, ');
  Ssql.Append('         (I.ALIQUOTA * 100) AS ALIQUOTA, I.CODFISCALITEM ');
  Ssql.Append('  from Lancamen L,    Nota N,   Item I,  pdvitem PI, ');
  Ssql.Append('       (SELECT l.CODPDV,L.DataLanc, L.NumNota, SUM(L.Quantidade * L.PrecoUnit) As ValorTotalRat ');
  Ssql.Append('          FROM CM.Lancamen L ');
  Ssql.Append('         Where ( L.DataLanc = to_date('+quotedStr(Data)+', ''dd/mm/yyyy'')) ');
  Ssql.Append('           and ( L.CodMotDev is null ) ');
  Ssql.Append('         group by l.CODPDV,L.DataLanc, L.NumNota) T ');
  Ssql.Append(' Where    ( L.DataLanc = to_date('+quotedStr(Data)+', ''dd/mm/yyyy'')) ');
  Ssql.Append('   and   ( L.CodMotDev is null ) ');
  Ssql.Append('   and   ( N.CodUsuarioCAsa is null ) ');
  Ssql.Append('   and   ( L.DataLanc = T.DataLanc) ');
  Ssql.Append('   and   ( L.NumNota = T.NumNota) ');
  Ssql.Append('   and   ( L.CodArtigo             =  I.CodArtigo ) ');
  Ssql.Append('   and   ( L.NumNota               = N.NumNota    ) ');
  Ssql.Append('   and   ( L.CodPdv                =  PI.CodPdv   ) ');
  Ssql.Append('   and   ( L.CodArtigo             =  PI.CodArtigo) ');
  Ssql.Append(' order  by  L.DataLanc, L.NumNota ');
  Result := GetDataPacket(Ssql);
end;

function TCtrlADP.ListCentroCusto(PrimeiraVez: Boolean; Data: string;
                                  IdPessoa: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT CODCENTROCUSTO, NOME '+
          '  FROM CENTCUST '+
          ' WHERE IDEMPRESA = '+ intTostr(IdPessoa);
  if not PrimeiraVez then
     Ssql := Ssql + ' AND TRGDTINCLUSAO = TO_DATE('+quotedStr(Data) + ', ''DD/MM/YYYY'') ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlADP.ListContas(PrimeiraVez: Boolean; Data: string;
                             IdPessoa: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT PLACONTA, PLANOME '+
          '  FROM PLANOCONTA ';
  if not PrimeiraVez then
     Ssql := Ssql + ' WHERE TRGDTINCLUSAO = TO_DATE('+quotedStr(Data) + ', ''DD/MM/YYYY'') ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlADP.ListSubContas(PrimeiraVez: Boolean; Data: string;
                                IdPessoa: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT CODSUBCONTA, NOMESUBCONTA '+
          '  FROM SUBCONTA '+
          ' WHERE IDPESSOA = '+ intTostr(IdPessoa);
  if not PrimeiraVez then
     Ssql := Ssql + ' AND TRGDTINCLUSAO = TO_DATE('+quotedStr(Data) + ', ''DD/MM/YYYY'') ';
  Result := GetDataPacket(Ssql);
end;

end.
