unit uCtrlMasterSaf;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient;
  Type
    TCtrlMasterSaf = Class(TCmControlObject)

    private
    protected
      procedure DoChangeDataBase; Override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;
      {lista os exercícios disponíveis por Pessoa}
      function ListExercicioPessoa(IdPessoa : LongInt) : OleVariant;
      {lista os períodos de acordo com o exercício e pessoa}
      function ListPeriodoPessoa(IdPessoa, Exercicio : LongInt) : OleVariant;
      {lista os hoteis}
      function ListHotel : OleVariant;
      {Zera a tabela pessoaMS}
      procedure ApagaPessoaMS;
      {Lista os alteradores da pessoa}
      function ListAlteradores(IdPessoa : longInt) : OleVariant;
      {Lista os códigos de operação}
      function ListCodigoOperacao : OleVariant;
      {Lista dados contábeis}
      function ListDadosContabeis(IdPessoa, Exercicio, Pernumero : LongInt; CodEmpresa, CodEstabelecimento : string) : OleVariant;
      {Lista os Saldos mensais}
      function ListSaldosMensais(CodEmpresa, CodEstabelecimento : string; IdPessoa, Exercicio, Periodo : LongInt) : OleVariant;
      {Lista os fornecedores - Contas a pagar}
      function ListContasPagar(CodEmpresa, CodEstabelecimento : string; DataIni, DataFim : string; IdPessoa : longInt) : OleVariant;
      {Lista PJ}
      function ListPessoaPJ(IdPessoa : string) : OleVariant;
      {Lista contas a receber}
      function ListContasReceber(CodEmpresa, CodEstabelecimento : string; DataIni, DataFim : string; IdPessoa : longInt) : OleVariant;
      {lista estrutura PJ}
      function ListPessoaPJ1 : OleVariant;
      {Lista as notas fiscais}
      function ListNotasFiscais(CodEmpresa, CodEstabelecimento : string; DataIni, DataFim : string; IdPessoa, IdHotel : longInt) : OleVariant;
      {Lista os itens das notas fiscais}
      function ListItensNotasFiscais(CodEmpresa, CodEstabelecimento : string; DataIni, DataFim : string; IdPessoa, IdHotel : longInt) : OleVariant;
      {Lista os Saldos das notas fiscas}
      function ListSaldosNotasFiscais(CodEmpresa, CodEstabelecimento : string; DataIni, DataFim : string; IdPessoa, IdHotel : longInt) : OleVariant;

      {Lista PlanoConta}
      function ListPlanoConta(IdPessoa : integer) : OleVariant;
      {Lista os Tipos de Documento Disponíveis}
      function ListTipoDocumento : OleVariant;
      {Lista código de serviço}
      function ListCodigoServico : OleVariant;

    protected

    End;

implementation

{ TCtrlMasterSaf }

procedure TCtrlMasterSaf.ApagaPessoaMS;
Var
Ssql : string;
begin
  Ssql := 'DELETE FROM PESSOAMS';
  execsql(Ssql);
end;

constructor TCtrlMasterSaf.Create;
begin
  inherited;

end;

destructor TCtrlMasterSaf.Destroy;
begin
  inherited;

end;

procedure TCtrlMasterSaf.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlMasterSaf.ListAlteradores(IdPessoa: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT CODALTERADOR, DESCRICAO,RECPAG, '+
          '       TO_CHAR(TRGDTINCLUSAO,''YYYYMMDD'') AS DTINCLUSAO '+
          '  FROM TIPOALTERADOR '+
          ' WHERE (IDPESSOA = '+intTostr(IdPessoa)+') '+
          ' ORDER BY DESCRICAO';
  Result := GetDataPacket(Ssql);
end;

function TCtrlMasterSaf.ListCodigoOperacao: OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT RPAD(''C''||TIPCODIGO,6) AS C1, '+
          '       ''19960101'' AS C2, '+
          '       DECODE(TIPDESCRICAO,NULL,''Operação Contábil'',RPAD(TIPDESCRICAO,50)) AS C3 '+
          '  FROM TIPOPER';
  Result := GetDataPacket(Ssql);
end;

function TCtrlMasterSaf.ListCodigoServico: OleVariant;
Var
 Ssql : string;
begin
  Ssql := 'SELECT DISTINCT T.COD_TIPO_DC AS C1, '+
          '       ''19960101'' AS C2, '+
          '       T.DESC_DC AS C3, '+
          '       ''0'' AS C4, '+
          '       ''1'' AS C5 '+
          '  FROM TIPODC T '+
          ' WHERE T.COD_GRUPO  IN (''B'',''C'',''D'',''E'',''G'',''J'') '+
          ' UNION SELECT DISTINCT T.COD_TIPO_DC AS C1, '+
          '       ''19960101'' AS C2, '+
          '       T.DESC_DC AS C3, '+
          '       ''0'' AS C4, '+
          '       ''2'' AS C5 '+
          '  FROM TIPODC T '+
          ' WHERE T.COD_GRUPO  NOT IN (''B'',''C'',''D'',''E'',''G'', ''J'') ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlMasterSaf.ListContasPagar(CodEmpresa, CodEstabelecimento,
                                        DataIni, DataFim: string; IdPessoa : integer): OleVariant;
Var
  Ssql : string;
begin
  //tentativa desesperada de solucionar o erro do Campo que nào existe
  Ssql := 'SELECT '+QuotedStr(CodEmpresa)+' AS C1, '+
          '       '+QuotedStr(CodEstabelecimento)+ ' AS C2, '+
          '       TO_CHAR(L.DATALANCTO,''YYYYMMDD'') AS C3, '+
          '       ''1'' AS C4, D.IDFORCLI AS C5, DECODE(D.CODTIPDOC,NULL,''NF'',D.CODTIPDOC) AS C6, '+
          '       D.NODOCUMENTO AS C7, D.COMPLDOCUMENTO C8, '+
          '       DECODE(L.OPERACAO,''17'',''17'',DECODE(L.OPERACAO,''4 '',D.RECPAG||TO_CHAR(L.CODALTERADOR), '+
          '       DECODE(L.ESTORNO,NULL,DECODE(L.OPERACAO,''5 '',''P5L'',''P2L''),          '+
          '       DECODE(L.OPERACAO,''5 '',''P5E'',''P2E'')))) AS C10, '+
          '       TO_CHAR(D.DATAEMISSAO,''YYYYMMDD'') AS C11, '+
          '       DECODE(SIGN(D.DATAPROGRAMADA-D.DATAEMISSAO),-1,TO_CHAR(D.DATAEMISSAO,''YYYYMMDD''),TO_CHAR(D.DATAPROGRAMADA,''YYYYMMDD'')) AS C12, '+
          '       TO_CHAR(D.CODDOCUMENTO)||''-''||TO_CHAR(L.NUMLANCTO) AS C13, '+
          '       ROUND(L.VALOR*100,0) AS C14, '+
          '       L.DEBCRE AS C15, '+
          '       D.PLACONTA AS C16, '+
          '       D.CODCENTROCUSTO AS C17, '+
          '       ROUND(VO.VALOR*100,0) AS C20, '+
          '       L.OPERACAO, L.ESTORNO, D.RECPAG, D.RECPAG||TO_CHAR(L.CODALTERADOR) AS CODOPALT '+
          '  FROM DOCUMENTO D, LANCTODOCUM L, (SELECT DISTINCT D.CODDOCUMENTO, L.VALOR '+
          '                                      FROM DOCUMENTO D, LANCTODOCUM L         '+
          '                                     WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO) '+
          '                                       AND (D.OPERACAO = L.OPERACAO)  '+
          '                                       AND (D.OPERACAO IN (''1'',''3'',''2'',''10'')) '+
          '                                       AND (D.IDPESSOA = '+IntToStr(IdPessoa)+')  '+
          '                                       AND (D.RECPAG = ''P'')) VO     '+
          ' WHERE (L.CODDOCUMENTO = D.CODDOCUMENTO) '+
          '   AND (D.CODDOCUMENTO = VO.CODDOCUMENTO) '+
          '   AND (D.RECPAG = ''P'') '+
          '   AND (L.OPERACAO IN (''1'',''3'',''2'',''4'',''5'',''10'',''17'')) '+
          '   AND (D.IDPESSOA = '+intTostr(IdPessoa)+') '+
          '   AND (L.VALOR <> 0) AND (L.VALOR IS NOT NULL) '+
          '   AND (L.DATALANCTO >= TO_DATE('''+DataIni+''',''DD/MM/YYYY'')) '+
          '   AND (L.DATALANCTO <= TO_DATE('''+DataFim+''',''DD/MM/YYYY'')) '+
          ' ORDER BY L.DATALANCTO, L.OPERACAO ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlMasterSaf.ListContasReceber(CodEmpresa, CodEstabelecimento,
                                          DataIni, DataFim: string; IdPessoa: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT '+QuotedStr(CodEmpresa)+' AS C1, '+QuotedStr(CodEstabelecimento)+ ' AS C2, '+
          '       TO_CHAR(L.DATALANCTO,''YYYYMMDD'') AS C3, ''2'' AS C4, '+
          '       D.IDFORCLI AS C5, DECODE(D.CODTIPDOC,NULL,''NF'',D.CODTIPDOC) AS C6, '+
          '       D.NODOCUMENTO AS C7, D.COMPLDOCUMENTO C8, DECODE(L.OPERACAO,''17'',''17'',DECODE(L.OPERACAO,''4 '',D.RECPAG||TO_CHAR(L.CODALTERADOR), '+
          '       DECODE(L.ESTORNO,NULL,DECODE(L.OPERACAO,''5 '',''R5L'',''R2L''),          '+
          '       DECODE(L.OPERACAO,''5 '',''R5E'',''R2E'')))) AS C10, '+
          '       TO_CHAR(D.DATAEMISSAO,''YYYYMMDD'') AS C11, '+
          '       DECODE(SIGN(D.DATAPROGRAMADA-D.DATAEMISSAO),-1,TO_CHAR(D.DATAEMISSAO,''YYYYMMDD''),TO_CHAR(D.DATAPROGRAMADA,''YYYYMMDD'')) AS C12, '+
          '       TO_CHAR(D.CODDOCUMENTO)||''-''||TO_CHAR(L.NUMLANCTO) AS C13, '+
          '       ROUND(L.VALOR*100,0) AS C14, L.DEBCRE AS C15, '+
          '       D.PLACONTA AS C16, D.CODCENTROCUSTO AS C17, ROUND(VO.VALOR*100,0) AS C20, '+
          '       L.OPERACAO, L.ESTORNO, D.RECPAG, D.RECPAG||TO_CHAR(L.CODALTERADOR) AS CODOPALT '+
          '  FROM DOCUMENTO D, LANCTODOCUM L, (SELECT DISTINCT D.CODDOCUMENTO, L.VALOR '+
          '                                      FROM DOCUMENTO D, LANCTODOCUM L         '+
          '                                     WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO) '+
          '                                       AND (D.OPERACAO = L.OPERACAO)  '+
          '                                       AND (D.OPERACAO IN (''1'',''3'',''2'',''10'')) '+
          '                                       AND (D.IDPESSOA = '+IntToStr(IdPessoa)+')  '+
          '                                       AND (D.RECPAG = ''R'')) VO     '+
          ' WHERE (L.CODDOCUMENTO = D.CODDOCUMENTO) '+
          '   AND (D.CODDOCUMENTO = VO.CODDOCUMENTO) '+
          '   AND (D.RECPAG = ''R'') '+
          '   AND (L.OPERACAO IN (''1'',''3'',''2'',''4'',''5'',''10'',''17'')) '+
          '   AND (D.IDPESSOA = '+IntToStr(IdPessoa)+') '+
          '   AND (L.VALOR <> 0) AND (L.VALOR IS NOT NULL) '+
          '   AND (L.DATALANCTO >= TO_DATE('''+DataIni+''',''DD/MM/YYYY'')) '+
          '   AND (L.DATALANCTO <= TO_DATE('''+DataFim+''',''DD/MM/YYYY'')) '+
          ' ORDER BY L.DATALANCTO, L.OPERACAO ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlMasterSaf.ListDadosContabeis(IdPessoa, Exercicio, Pernumero: Integer;
                                           CodEmpresa, CodEstabelecimento: string): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT '+quotedStr(CodEmpresa)+' As C1, '+quotedStr(CodEstabelecimento)+' AS C2, '+
          '        TO_CHAR(PL.PLNDATDIA,''YYYYMMDD'')  AS C3, '+
          '        L.PLACONTA As C4, '+
          '        L.LACDEBCRE As C5, '+
          '        SUBSTR((TO_CHAR(L.PLNCODIGO) || TO_CHAR(LACNUMLAN)),1, 20) As C6, '+
          '        ROUND((L.LACVALOR*100),0) As C7, '+
          '        L.CODCENTROCUSTO As C9, '+
          '        decode(L.TIPCODIGO,null,''BF'',''C''||L.TIPCODIGO) As C12, '+
          '        L.LACHIST1 AS C13, '+
          '        DECODE(NVL(L.LACNUMLAN,0), 0, '''', L.LACNUMLAN) AS C16 '+
          '  FROM  LANCAMENTO L, PLANILHA PL '+
          ' WHERE (PL.IDPESSOA = '+intTostr(IdPessoa)+') '+
          '   AND (PL.PEREXERCICIO = '+intTostr(Exercicio)+') '+
          '   AND (PL.PERNUMERO = '+IntToStr(Pernumero)+') '+
          '   AND (L.PLNCODIGO = PL.PLNCODIGO) '+
          '   AND (L.LACVALOR <> 0) ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlMasterSaf.ListExercicioPessoa(IdPessoa: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT DISTINCT PEREXERCICIO, IDPESSOA '+
          '  FROM PERIODO '+
          ' WHERE IDPESSOA = '+intTostr(IdPessoa)+ ' '+
          ' ORDER BY PEREXERCICIO';
  Result := GetDataPacket(Ssql);
end;

function TCtrlMasterSaf.ListHotel: OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT H.IDHOTEL, P.NOME '+
          '  FROM HOTEL H, PESSOA P '+
          ' WHERE H.IDHOTEL = P.IDPESSOA '+
          ' ORDER BY P.NOME';
  Result := GetDataPacket(Ssql);
end;

function TCtrlMasterSaf.ListItensNotasFiscais(CodEmpresa,
                                              CodEstabelecimento, DataIni, DataFim: string; IdPessoa,
                                              IdHotel: Integer): OleVariant;
Var
 Ssql : string;
begin
  Ssql := 'SELECT HR.COD_EMPRESA, HR.NUM_RESERVA, C.IDPESSOA, '+
          '       RTRIM(HR.NOME_HOSP)||'' ''||RTRIM(HR.SOBRENOME_HOSP) NOMEHOSP, '+
          '       '+QuotedStr(CodEmpresa) + ' AS C1, '+
          '       '+QuotedStr(CodEstabelecimento) + ' AS C2, '+
          '       TO_CHAR(N.DATA_NOTA,''YYYYMMDD'') AS C3, '+
          '       L.VALOR_LANCAMENTO, ''9'' AS C4, ''1'' AS C5, '+
          '       ''NF'' AS C6, ''2'' AS C7, TO_CHAR(C.IDPESSOA)||''              '' AS C8, '+
          '       REPLACE(NVL(N.NOTA_INICIAL,N.NUM_NOTA), ''-'') AS C9, '+
          '       N.FLAGSERIE C10, TDC.COD_TIPO_DC AS C12, 0  AS C13, '+
          '       ROUND(((DECODE(T.DEBITOCREDITO,''D'',L.VALOR_LANCAMENTO,(L.VALOR_LANCAMENTO*-1)))*100),0) AS C14, '+
          '       ROUND(((DECODE(T.DEBITOCREDITO,''D'',L.VALOR_LANCAMENTO,(L.VALOR_LANCAMENTO*-1)))*100),0) AS C15, '+
          '       ROUND((I.PERCENTUAL * 10000),0) AS C32, '+  //o campo no banco só tem 2 casas decimais e necessita ter 4 no arquivo
          '       ROUND((((DECODE(T.DEBITOCREDITO,''D'',L.VALOR_LANCAMENTO,(L.VALOR_LANCAMENTO*-1))*(NVL(I.BASE,0)/100)*(I.PERCENTUAL/100)))*100),0) AS C33, '+
          '       DECODE(NVL(I.PERCENTUAL,0),0,DECODE(T.IDEMPASSOCIADA,NULL,''2'',''3''),''1'') AS C38, '+
          '       ROUND((((DECODE(T.DEBITOCREDITO,''D'',L.VALOR_LANCAMENTO,(L.VALOR_LANCAMENTO*-1))*(DECODE(NVL(I.PERCENTUAL,0),0,1,NVL(I.BASE,0)/100 ))))*100),0) AS C39, '+
          '       P.IDISSHOTEL '+
          '  FROM NOTAVHL N, LANCAMENVHL L, TIPODEBCREDHOTEL T, IMPOSXTIPODCHOTEL I, PARAMLIVRO P, '+
          '       HEFAZRES HR, TIPODC TDC, CLIENTEPESS C '+
          ' WHERE (T.IDHOTEL = ' + IntToStr(IdHotel) + ') '+
          '   AND (P.IDPESSOA = ' + IntToStr(IdPessoa) + ') '+
          '   AND (N.DATA_NOTA BETWEEN TO_DATE(' + QuotedStr(DataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + QuotedStr(DataFim) + ',''DD/MM/YYYY'')) '+
          '   AND (L.COD_TIPO_DC   = T.CODREDUZIDO(+)) '+
          '   AND (I.IDTIPODEBCRED(+) = T.IDTIPODEBCRED) '+
          '   AND (I.IDHOTEL(+) = T.IDHOTEL) '+
          '   AND (I.IDIMPOSTO = P.IDISSHOTEL(+)) '+
          '   AND (HR.COD_EMPRESA = C.CODCLIENTE(+)) '+
          '   AND (N.NUM_NOTA = L.NUM_NOTA(+)) '+
          '   AND (L.NUM_RESERVA = HR.NUM_RESERVA(+)) '+
          '   AND (TDC.COD_TIPO_DC = L.COD_TIPO_DC) '+
          '   AND (HR.PRINCIPAL = ''True'') '+
          '   AND (L.VALOR_LANCAMENTO <> 0) AND (L.VALOR_LANCAMENTO IS NOT NULL) '+
          ' ORDER BY C10,C9';
  Result := GetDataPacket(Ssql);
end;

function TCtrlMasterSaf.ListNotasFiscais(CodEmpresa, CodEstabelecimento,
                                         DataIni, DataFim: string; IdPessoa, IdHotel: Integer): OleVariant;
var Ssql : string;
begin
      Ssql := 'SELECT U.COD_EMPRESA, U.NUM_RESERVA, U.IDPESSOA, '+
              '       U.NOMEHOSP, U.C1, U.C2, '+
              '       U.C3, U.C4, U.C5, U.C6, '+
              '       U.C7, U.C8, U.C9, U.C11, '+
              '       U.C12, U.CAMPO13, U.C30, '+
              '       SUM(U.C22) AS C22,      '+
              '       SUM(U.C23) AS C23,      '+
              '       SUM(U.C46) AS C46,      '+
              '       SUM(U.C61) AS C61,      '+
              '       SUM(U.C62) AS C62      '+
              '  FROM ( '+
              'SELECT HR.COD_EMPRESA, HR.NUM_RESERVA, C.IDPESSOA, '+
              '       RTRIM(HR.NOME_HOSP)||'' ''||RTRIM(HR.SOBRENOME_HOSP) AS NOMEHOSP, '+
              '        '+QuotedStr(CodEmpresa) + ' AS C1, '+
              '       '+QuotedStr(CodEstabelecimento) + ' AS C2, '+
              '       ''9'' AS C3, ''1'' AS C4, ''NF'' AS C5, ''2'' AS C6, '+
              '       TO_CHAR(C.IDPESSOA)||''              '' AS C7, '+
              '       REPLACE(NVL(N.NOTA_INICIAL,N.NUM_NOTA), ''-'') AS C8, '+
              '       N.FLAGSERIE C9, TO_CHAR(N.DATA_NOTA,''YYYYMMDD'') AS C11, '+
              '       ''2'' AS C12, TO_CHAR(N.DATA_NOTA,''YYYYMMDD'') AS CAMPO13, '+
              '       (0) AS C22, '+
              '       (0) AS C23, '+
              '       DECODE(N.DATA_CANCELAMENTO,NULL,''N'',''S'') C30, '+
              '       (0) AS C46, '+
              '       (0) AS C61, '+
              '       (0) AS C62  '+
              '  FROM NOTAVHL N, HEFAZRES HR, CLIENTEPESS C, FECHAMEN F '+
              ' WHERE (N.DATA_NOTA BETWEEN TO_DATE(' + QuotedStr(DataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + QuotedStr(DataFim) + ',''DD/MM/YYYY'')) '+
              '   AND (HR.COD_EMPRESA = C.CODCLIENTE(+))     '+
              '   AND (F.COD_FECHAMENTO = N.COD_FECHAMENTO)  '+
              '   AND (F.NUM_RESERVA = HR.NUM_RESERVA)       '+
              '   AND (N.DATA_CANCELAMENTO IS NOT NULL)      '+
              '   AND (HR.PRINCIPAL = ''True'')              '+
              ' UNION ALL '+
              ' SELECT HR.COD_EMPRESA, HR.NUM_RESERVA, C.IDPESSOA, '+
              '        RTRIM(HR.NOME_HOSP)||'' ''||RTRIM(HR.SOBRENOME_HOSP) NOMEHOSP, '+
              '       '+QuotedStr(CodEmpresa) + ' AS C1, '+
              '       '+QuotedStr(CodEstabelecimento) + ' AS C2, '+
              '       ''9'' AS C3, ''1'' AS C4, ''NF'' AS C5, ''2'' AS C6, '+
              '       TO_CHAR(C.IDPESSOA)||''              '' AS C7, '+
              '       REPLACE(NVL(N.NOTA_INICIAL,N.NUM_NOTA), ''-'') AS C8, '+
              '       N.FLAGSERIE C9, TO_CHAR(N.DATA_NOTA,''YYYYMMDD'') AS C11, '+
              '       ''2'' AS C12, TO_CHAR(N.DATA_NOTA,''YYYYMMDD'') AS CAMPO13, '+
              '       ROUND((SUM(DECODE(T.DEBITOCREDITO,''D'',L.VALOR_LANCAMENTO,(L.VALOR_LANCAMENTO*-1)))*100),0) AS C22, '+
              '       ROUND((SUM(DECODE(T.DEBITOCREDITO,''D'',L.VALOR_LANCAMENTO,(L.VALOR_LANCAMENTO*-1)))*100),0) AS C23, '+
              '       DECODE(N.DATA_CANCELAMENTO,NULL,''N'',''S'') C30, '+
              '       ROUND((SUM((DECODE(T.DEBITOCREDITO,''D'',L.VALOR_LANCAMENTO,(L.VALOR_LANCAMENTO*-1))*(NVL(I.BASE,0)/100)*(I.PERCENTUAL/100)))*100),0) AS C46, '+
              '       ROUND((SUM((DECODE(T.DEBITOCREDITO,''D'',L.VALOR_LANCAMENTO,(L.VALOR_LANCAMENTO*-1))*(NVL(I.BASE,0)/100)))*100),0) AS C61,                    '+
              '       ROUND((SUM((DECODE(T.DEBITOCREDITO,''D'',L.VALOR_LANCAMENTO,(L.VALOR_LANCAMENTO*-1))*((100-NVL(I.BASE,0))/100)))*100),0) AS C62               '+
              '  FROM NOTAVHL N, LANCAMENVHL L, TIPODEBCREDHOTEL T, IMPOSXTIPODCHOTEL I, '+
              '       PARAMLIVRO P, HEFAZRES HR, TIPODC TDC, CLIENTEPESS C '+
              '  WHERE (T.IDHOTEL = ' + IntToStr(IdHotel) + ') '+
              '   AND (P.IDPESSOA = ' + IntToStr(IdPessoa) + ') '+
              '   AND (N.DATA_NOTA BETWEEN TO_DATE(' + QuotedStr(DataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + QuotedStr(DataFim) + ',''DD/MM/YYYY'')) '+
              '   AND (L.COD_TIPO_DC   = T.CODREDUZIDO(+)) '+
              '   AND (I.IDTIPODEBCRED(+) = T.IDTIPODEBCRED) '+
              '   AND (I.IDHOTEL(+) = T.IDHOTEL) '+
              '   AND (I.IDIMPOSTO = P.IDISSHOTEL(+)) '+
              '   AND (HR.COD_EMPRESA = C.CODCLIENTE(+)) '+
              '   AND (N.NUM_NOTA = L.NUM_NOTA(+)) '+
              '   AND (L.NUM_RESERVA = HR.NUM_RESERVA(+)) '+
              '   AND (TDC.COD_TIPO_DC = L.COD_TIPO_DC)   '+
              '   AND (N.DATA_CANCELAMENTO IS NULL)       '+
              '   AND (HR.PRINCIPAL = ''True'') '+
              ' GROUP BY N.NUM_NOTA,HR.NUM_RESERVA, N.DATA_NOTA, N.DATA_CANCELAMENTO, N.NOTA_INICIAL, N.FLAGSERIE, '+
              '          HR.COD_EMPRESA, HR.NOME_HOSP, C.IDPESSOA, HR.SOBRENOME_HOSP '+
              ' HAVING ROUND((SUM(DECODE(T.DEBITOCREDITO,''D'',L.VALOR_LANCAMENTO,(L.VALOR_LANCAMENTO*-1)))*100),0)  <> 0 '+
              ' ) U '+
              ' GROUP BY U.COD_EMPRESA, U.NUM_RESERVA, U.IDPESSOA, '+
              '         U.NOMEHOSP, U.C1, U.C2, '+
              '         U.C3, U.C4, U.C5, U.C6, '+
              '         U.C7, U.C8, U.C9, U.C11, '+
              '         U.C12, U.CAMPO13, U.C30 '+
              ' ORDER BY C8 ';
      Result := GetDataPacket(Ssql);
end;

function TCtrlMasterSaf.ListPeriodoPessoa(IdPessoa,
                                          Exercicio: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT DISTINCT PERNUMERO, PERNOME '+
          '  FROM PERIODO '+
          ' WHERE PEREXERCICIO = '+intTostr(Exercicio)+' '+
          '   AND IDPESSOA = '+IntToStr(IdPessoa)+' '+
          '   AND PERBLOQUE = ''S'' '+
          ' ORDER BY PERNUMERO';
  Result := GetDataPacket(Ssql);
end;

function TCtrlMasterSaf.ListPessoaPJ(IdPessoa: string): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT ''2'' AS C1, TO_CHAR(P.IDPESSOA)||''          '' AS C2, ''19960101'' AS C3, '+
          '       DECODE(P.NUMDOCUMENTO,NULL,''4'',DECODE(SUBSTR(P.NUMDOCUMENTO,1,7),''0000000'',''4'',''1'')) AS C4, '+
          '       DECODE(P.NOME,NULL,DECODE(P.RAZAOSOCIAL,NULL,''EMPRESA SEM NOME NO CADASTRO'', '+
          '       REPLACE(REPLACE(REPLACE(P.RAZAOSOCIAL, CHR(13)),CHR(10)),CHR(9))), '+
          '       DECODE(P.RAZAOSOCIAL,NULL,REPLACE(REPLACE(REPLACE(P.NOME, CHR(13)),CHR(10)),CHR(9)), '+
          '       REPLACE(REPLACE(REPLACE(P.RAZAOSOCIAL, CHR(13)),CHR(10)),CHR(9)))) AS C5, '+
          '       REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(P.NUMDOCUMENTO)), ''.''), ''-''), ''/'') AS C6, '+
          '       REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(D.NUMDOCUMENTO)), ''.''), ''-''), ''/'') AS C8, '+
          '       ''@'' AS C9, REPLACE(REPLACE(REPLACE(P.NOME, CHR(13)),CHR(10)),CHR(9)) AS C11, '+
          '       REPLACE(REPLACE(REPLACE(E.LOGRADOURO, CHR(13)),CHR(10)),CHR(9)) AS C12, '+
          '       REPLACE(REPLACE(REPLACE(E.NUMERO, CHR(13)),CHR(10)),CHR(9)) AS C13, '+
          '       REPLACE(REPLACE(REPLACE(E.COMPLEMENTO, CHR(13)),CHR(10)),CHR(9)) AS C14, '+
          '       REPLACE(REPLACE(REPLACE(E.BAIRRO, CHR(13)),CHR(10)),CHR(9)) AS C15, '+
          '       REPLACE(REPLACE(REPLACE(C.NOME, CHR(13)),CHR(10)),CHR(9)) AS C16, '+
          '       DECODE(ES.IDPAIS,1,ES.CODESTADO,''EX'') AS C19, '+
          '       RPAD(REPLACE(E.CEP,''-''), 8, ''0'') AS C20, '+
          '       T.DDD AS C22, REPLACE(T.NUMTEL,''-'') AS C23, '+
          '       REPLACE(F.NUMFAX,''-'') AS C24 '+
          '  FROM PESSOA P, CLIENTEPESS C, ESTADO ES, CIDADES C, ENDPESS E, '+
          '      (SELECT D.IDPESSOA, D.NUMDOCUMENTO '+
          '         FROM DOCPESSOA D, PARAMLIVRO PL '+
          '        WHERE (D.IDDOCUMENTO = PL.IDINSCEST) '+
          '          AND (PL.IDPESSOA = '+IdPessoa+')) D, '+
          '      (SELECT T.IDENDERECO, T.DDD, T.NUMERO AS NUMTEL '+
          '         FROM  TELENDPESS T, '+
          '      (SELECT IDENDERECO, MIN(IDTELEFONE) AS IDTELEFONE '+
          '         FROM TELENDPESS '+
          '        WHERE (TIPO LIKE ''%C%'') '+
          '          AND (NUMERO IS NOT NULL) '+
          '        GROUP BY IDENDERECO) TT '+
          ' WHERE (TT.IDENDERECO = T.IDENDERECO) '+
          '   AND (TT.IDTELEFONE = T.IDTELEFONE)) T, '+
          '       (SELECT T.IDENDERECO, T.DDD, T.NUMERO AS NUMFAX '+
          '          FROM  TELENDPESS T, '+
          '       (SELECT IDENDERECO, MIN(IDTELEFONE) AS IDTELEFONE '+
          '          FROM TELENDPESS '+
          '         WHERE (TIPO LIKE ''%F%'') '+
          '           AND (NUMERO IS NOT NULL) '+
          '         GROUP BY IDENDERECO) TT '+
          '         WHERE (TT.IDENDERECO = T.IDENDERECO) '+
          '           AND (TT.IDTELEFONE = T.IDTELEFONE)) F '+
          '         WHERE (P.IDPESSOA = C.IDPESSOA) '+
          '           AND (P.IDPESSOA = D.IDPESSOA(+)) '+
          '           AND (P.IDENDCOMERCIAL = E.IDENDERECO(+)) '+
          '           AND (E.IDCIDADES = C.IDCIDADES(+)) '+
          '           AND (C.IDESTADO = ES.IDESTADO(+)) '+
          '           AND (E.IDENDERECO = T.IDENDERECO(+)) '+
          '           AND (E.IDENDERECO = F.IDENDERECO(+)) '+
          ' UNION '+
          ' SELECT ''1'' AS C1, '+
          '        TO_CHAR(P.IDPESSOA)||''          '' AS C2, ''19960101'' AS C3, '+
          '        DECODE(P.NUMDOCUMENTO,NULL,''4'',DECODE(SUBSTR(P.NUMDOCUMENTO,1,7),''0000000'',''4'',''1'')) AS C4, '+
          '        DECODE(P.NOME,NULL,DECODE(P.RAZAOSOCIAL,NULL,''EMPRESA SEM NOME NO CADASTRO'', '+
          '        REPLACE(REPLACE(REPLACE(P.RAZAOSOCIAL, CHR(13)),CHR(10)),CHR(9))), '+
          '        DECODE(P.RAZAOSOCIAL,NULL,REPLACE(REPLACE(REPLACE(P.NOME, CHR(13)),CHR(10)),CHR(9)), '+
          '        REPLACE(REPLACE(REPLACE(P.RAZAOSOCIAL, CHR(13)),CHR(10)),CHR(9)))) AS C5, '+
          '        REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(P.NUMDOCUMENTO)), ''.''), ''-''), ''/'') AS C6, '+
          '        REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(D.NUMDOCUMENTO)), ''.''), ''-''), ''/'') AS C8, '+
          '        ''@'' AS C9, REPLACE(REPLACE(REPLACE(P.NOME, CHR(13)),CHR(10)),CHR(9)) AS C11, '+
          '        REPLACE(REPLACE(REPLACE(E.LOGRADOURO, CHR(13)),CHR(10)),CHR(9)) AS C12, '+
          '        REPLACE(REPLACE(REPLACE(E.NUMERO, CHR(13)),CHR(10)),CHR(9)) AS C13, '+
          '        REPLACE(REPLACE(REPLACE(E.COMPLEMENTO, CHR(13)),CHR(10)),CHR(9)) AS C14, '+
          '        REPLACE(REPLACE(REPLACE(E.BAIRRO, CHR(13)),CHR(10)),CHR(9)) AS C15, '+
          '        REPLACE(REPLACE(REPLACE(C.NOME, CHR(13)),CHR(10)),CHR(9)) AS C16, '+
          '        ES.CODESTADO AS C19, '+
          '        RPAD(REPLACE(E.CEP,''-''), 8, ''0'') AS C20, '+
          '        T.DDD AS C22, REPLACE(T.NUMTEL,''-'') AS C23, '+
          '        REPLACE(F.NUMFAX,''-'') AS C24 '+
          '   FROM PESSOA P, FORNSERV C, '+
          '        ESTADO ES, CIDADES C, ENDPESS E, '+
          '       (SELECT D.IDPESSOA, D.NUMDOCUMENTO '+
          '          FROM DOCPESSOA D, PARAMLIVRO PL '+
          '         WHERE (D.IDDOCUMENTO = PL.IDINSCEST) '+
          '           AND (PL.IDPESSOA = '+IdPessoa+')) D, '+
          '        (SELECT T.IDENDERECO, T.DDD, T.NUMERO AS NUMTEL '+
          '           FROM  TELENDPESS T, (SELECT IDENDERECO, MIN(IDTELEFONE) AS IDTELEFONE '+
          '                                  FROM TELENDPESS '+
          '                                 WHERE (TIPO LIKE ''%C%'') '+
          '                                   AND (NUMERO IS NOT NULL) '+
          '                                 GROUP BY IDENDERECO) TT '+
          '          WHERE (TT.IDENDERECO = T.IDENDERECO) '+
          '            AND (TT.IDTELEFONE = T.IDTELEFONE)) T, '+
          '         (SELECT T.IDENDERECO, T.DDD, T.NUMERO AS NUMFAX '+
          '            FROM  TELENDPESS T, '+
          '         (SELECT IDENDERECO, MIN(IDTELEFONE) AS IDTELEFONE '+
          '            FROM TELENDPESS '+
          '           WHERE (TIPO LIKE ''%F%'') '+
          '             AND (NUMERO IS NOT NULL) '+
          '           GROUP BY IDENDERECO) TT '+
          '           WHERE (TT.IDENDERECO = T.IDENDERECO) '+
          '             AND (TT.IDTELEFONE = T.IDTELEFONE)) F '+
          '   WHERE (P.IDPESSOA = C.IDPESSOA) '+
          '     AND (P.IDPESSOA = D.IDPESSOA(+)) '+
          '     AND (P.IDENDCOMERCIAL = E.IDENDERECO(+)) '+
          '     AND (E.IDCIDADES = C.IDCIDADES(+)) '+
          '     AND (C.IDESTADO = ES.IDESTADO(+)) '+
          '     AND (E.IDENDERECO = T.IDENDERECO(+)) '+
          '     AND (E.IDENDERECO = F.IDENDERECO(+))';
  Result := GetDataPacket(Ssql);
end;

function TCtrlMasterSaf.ListPessoaPJ1 : OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT ''2'' AS C1, TO_CHAR(P.IDPESSOA)||''          '' AS C2, '+
          '       ''19960101'' AS C3, DECODE(P.NUMDOCUMENTO,NULL,''4'',DECODE(SUBSTR(P.NUMDOCUMENTO,1,7),''0000000'',''4'',''1'')) AS C4, '+
          '       DECODE(P.NOME,NULL,DECODE(P.RAZAOSOCIAL,NULL,''EMPRESA SEM NOME NO CADASTRO'', '+
          '       REPLACE(REPLACE(REPLACE(P.RAZAOSOCIAL, CHR(13)),CHR(10)),CHR(9))), '+
          '       DECODE(P.RAZAOSOCIAL,NULL,REPLACE(REPLACE(REPLACE(P.NOME, CHR(13)),CHR(10)),CHR(9)), '+
          '       REPLACE(REPLACE(REPLACE(P.RAZAOSOCIAL, CHR(13)),CHR(10)),CHR(9)))) AS C5, '+
          '       REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(P.NUMDOCUMENTO)), ''.''), ''-''), ''/'') AS C6, '+
          '       REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(D.NUMDOCUMENTO)), ''.''), ''-''), ''/'') AS C8, '+
          '       ''@'' AS C9, REPLACE(REPLACE(REPLACE(P.NOME, CHR(13)),CHR(10)),CHR(9)) AS C11, '+
          '       REPLACE(REPLACE(REPLACE(E.LOGRADOURO, CHR(13)),CHR(10)),CHR(9)) AS C12, '+
          '       REPLACE(REPLACE(REPLACE(E.NUMERO, CHR(13)),CHR(10)),CHR(9)) AS C13, '+
          '       REPLACE(REPLACE(REPLACE(E.COMPLEMENTO, CHR(13)),CHR(10)),CHR(9)) AS C14, '+
          '       REPLACE(REPLACE(REPLACE(E.BAIRRO, CHR(13)),CHR(10)),CHR(9)) AS C15, '+
          '       REPLACE(REPLACE(REPLACE(C.NOME, CHR(13)),CHR(10)),CHR(9)) AS C16, '+
          '       DECODE(ES.IDPAIS,1,ES.CODESTADO,''EX'') AS C19, '+
          '       RPAD(REPLACE(E.CEP,''-''), 8, ''0'') AS C20, '+
          '       T.DDD AS C22, REPLACE(T.NUMERO,''-'') AS C23, '+
          '       REPLACE(F.NUMERO,''-'') AS C24 '+
          '  FROM PESSOA P, CLIENTEPESS C, TELENDPESS T, TELENDPESS F, DOCPESSOA D, '+
          '       ESTADO ES, CIDADES C, ENDPESS E  '+
          ' WHERE (1 = 2) ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlMasterSaf.ListPlanoConta(IdPessoa: integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT PC.PLACONTA AS C1, '+
          '       ''19960101'' AS C2, '+
          '       PC.PLANOME AS C3, PC.PLATIPO AS C4, '+
          '       PC.PLAREDUZ AS C5 '+
          '  FROM PLANOCONTA PC, PARAMCONTAB PR '+
          ' WHERE (PR.IDPESSOA = '+IntToStr(IdPessoa)+') '+
          '   AND (PC.PLANO = PR.PLANO) '+
          ' ORDER BY PC.PLACONTA ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlMasterSaf.ListSaldosMensais(CodEmpresa,
                                          CodEstabelecimento: string; IdPessoa, Exercicio,
                                          Periodo: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT '+QuotedStr(CodEmpresa)+' AS C1, '+QuotedStr(CodEstabelecimento)+' AS C2, '+
          '       U.PLACONTA AS C3, TO_CHAR(U.PERDATFIM,''YYYYMMDD'') AS C4, '+
          '       ROUND(ABS(SUM(NVL(U.SALDOANTERIOR,0)*100)),0) AS C5, '+
          '       DECODE(SIGN(SUM(NVL(U.SALDOANTERIOR,0))),1,''D'',''C'') AS C6, '+
          '       ROUND(ABS(SUM(NVL(U.SALDOATUAL,0)*100)),0) AS C7, '+
          '       DECODE(SIGN(SUM(NVL(U.SALDOATUAL,0))),1,''D'',''C'') AS C8, '+
          '       ROUND(SUM(NVL(U.CRED,0)*100),0) AS C9, '+
          '       ROUND(SUM(NVL(U.DEB,0)*100),0) AS C10  '+
          '  FROM ((SELECT PL.PLACONTA, PL.PLANO, P.PERDATFIM, 0 AS SALDOANTERIOR, '+
          '                SUM(NVL(PL.PLSDEBITOCORRENTE,0)-NVL(PL.PLSCREDITOCOR,0)) AS SALDOATUAL, '+
          '                0 AS DEB, 0 AS CRED '+
          '           FROM PLANOSALDO PL, '+
          '                (SELECT PERDATFIM FROM PERIODO '+
          '                  WHERE (PEREXERCICIO = ' + intTostr(Exercicio) + ') '+
          '                    AND (IDPESSOA = ' + IntToStr(IdPessoa) + ') '+
          '                    AND (PERNUMERO = ' + IntToStr(Periodo) + ')) P '+
          '          WHERE (PL.PEREXERCICIO = ' + intTostr(Exercicio) + ') '+
          '            AND ((PL.PERNUMERO <= ' + IntToStr(Periodo) + ') OR (PERNUMERO IS NULL)) '+
          '            AND (PL.IDPESSOA = ' + IntToStr(IdPessoa) + ') '+
          '          GROUP BY PLANO,PLACONTA, PERDATFIM ) '+
          ' UNION ALL '+
          '      (SELECT PL.PLACONTA, PL.PLANO, '+
          '              P.PERDATFIM, 0 AS SALDOANTERIOR, 0 AS SALDOATUAL, SUM(NVL(PL.PLSDEBITOCORRENTE,0)) AS DEB, '+
          '              SUM(NVL(PL.PLSCREDITOCOR,0)) AS CRED '+
          '         FROM PLANOSALDO PL, PERIODO P       '+
          '        WHERE (PL.PEREXERCICIO = ' + IntToStr(Exercicio) + ') '+
          '          AND (PL.PERNUMERO = ' + IntToStr(Periodo) + ') '+
          '          AND (PL.IDPESSOA = ' + IntToStr(IdPessoa) + ') '+
          '          AND (P.PEREXERCICIO = PL.PEREXERCICIO) '+
          '          AND (P.PERNUMERO = PL.PERNUMERO) '+
          '          AND (P.IDPESSOA = PL.IDPESSOA) '+
          '        GROUP BY PLANO,PLACONTA, PERDATFIM) '+
          ' UNION ALL '+
          '      (SELECT PL.PLACONTA, PL.PLANO, '+
          '              P.PERDATFIM, SUM(NVL(PL.PLSDEBITOCORRENTE,0)-NVL(PL.PLSCREDITOCOR,0)) AS SALDOANTERIOR, '+
          '              0 AS SALDOATUAL, 0 AS DEB, 0 AS CRED '+
          '         FROM PLANOSALDO PL, '+
          '              (SELECT PERDATFIM FROM PERIODO '+
          '                WHERE (PEREXERCICIO = ' + IntToStr(Exercicio) + ') '+
          '                  AND (IDPESSOA = ' + IntToStr(IdPessoa) + ') '+
          '                  AND (PERNUMERO = ' + IntToStr(Periodo) + ')) P '+
          '        WHERE (PL.PEREXERCICIO = ' + IntToStr(Exercicio) + ') '+
          '          AND ((PL.PERNUMERO < ' + IntToStr(Periodo) + ') OR (PERNUMERO IS NULL)) '+
          '          AND (PL.IDPESSOA = ' + IntToStr(IdPessoa) + ') '+
          '        GROUP BY PLANO,PLACONTA, PERDATFIM )) U '+
          ' GROUP BY U.PLACONTA,U.PLANO,U.PERDATFIM '+
          ' ORDER BY U.PLACONTA ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlMasterSaf.ListSaldosNotasFiscais(CodEmpresa,
                                               CodEstabelecimento, DataIni, DataFim: string; IdPessoa,
                                               IdHotel: Integer): OleVariant;
Var
 Ssql : string;
begin
  Ssql :=   'SELECT D.COD_EMPRESA, D.NUM_RESERVA, D.IDPESSOA, '+
            '       D.NOMEHOSP, '+
            '       '+QuotedStr(CodEmpresa) + ' AS C1, '+
            '       '+QuotedStr(CodEstabelecimento) + ' AS C2, '+
            '       D.C3, '+
            '       ''9'' AS C4, ''1'' AS C5, '+
            '       ''NF'' AS C6, ''2'' AS C7, TO_CHAR(D.IDPESSOA) ||''              '' AS C8, '+
            '       D.C9, '+
            '       D.C10, '+
            '       D.C13, '+
            '       D.C12, '+
            '       (D.C14 - NVL(C.C14,0)) AS C14, '+
            '       (D.C15 - NVL(C.C15,0)) AS C15, '+
            '       D.C32, '+
            '       D.C33, '+
            '       D.C38, '+
            '       D.C39, '+
            '       D.IDISSHOTEL '+
            '  FROM (SELECT HR.COD_EMPRESA, HR.NUM_RESERVA, C.IDPESSOA, '+
            '               RTRIM(HR.NOME_HOSP)||'' ''||RTRIM(HR.SOBRENOME_HOSP) NOMEHOSP, '+
            '               TO_CHAR(N.DATA_NOTA,''YYYYMMDD'') AS C3, '+
            '               L.VALOR_LANCAMENTO, ''9'' AS C4, ''1'' AS C5, '+
            '               ''NF'' AS C6, ''2'' AS C7, TO_CHAR(1) ||''              '' AS C8, '+
            '               REPLACE(NVL(N.NOTA_INICIAL,N.NUM_NOTA), ''-'') AS C9, '+
            '               N.FLAGSERIE C10, TDC.COD_TIPO_DC AS C12, 0  AS C13, '+
            '               ROUND((L.VALOR_LANCAMENTO * 100),0) AS C14, '+
            '               ROUND((L.VALOR_LANCAMENTO * 100),0) AS C15, '+
            '               ROUND((I.PERCENTUAL * 10000),0) AS C32, '+
            '               ROUND((((L.VALOR_LANCAMENTO)*(NVL(I.BASE,0)/100)*(I.PERCENTUAL/100))*100),0) AS C33, '+
            '               DECODE(NVL(I.PERCENTUAL,0),0,DECODE(T.IDEMPASSOCIADA,NULL,''2'',''3''),''1'') AS C38, '+
            '               ROUND(((L.VALOR_LANCAMENTO *(DECODE(NVL(I.PERCENTUAL,0),0,1,NVL(I.BASE,0)/100 )))*100),0) AS C39, '+
            '               P.IDISSHOTEL '+
            '          FROM NOTAVHL N, LANCAMENVHL L, TIPODEBCREDHOTEL T, IMPOSXTIPODCHOTEL I, PARAMLIVRO P, '+
            '               HEFAZRES HR, TIPODC TDC, CLIENTEPESS C '+
            '         WHERE (T.IDHOTEL = ' + IntToStr(IdHotel) + ') '+
            '           AND (P.IDPESSOA = ' + IntToStr(IdPessoa) + ') '+
            '           AND (N.DATA_NOTA BETWEEN TO_DATE(' + QuotedStr(DataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + QuotedStr(DataFim) + ',''DD/MM/YYYY'')) '+
            '           AND (L.COD_TIPO_DC   = T.CODREDUZIDO(+)) '+
            '           AND (I.IDTIPODEBCRED(+) = T.IDTIPODEBCRED) '+
            '           AND (I.IDHOTEL(+) = T.IDHOTEL) '+
            '           AND (T.DEBITOCREDITO = ''D'') '+
            '           AND (I.IDIMPOSTO = P.IDISSHOTEL(+)) '+
            '           AND (HR.COD_EMPRESA = C.CODCLIENTE(+)) '+
            '           AND (N.NUM_NOTA = L.NUM_NOTA(+)) '+
            '           AND (L.NUM_RESERVA = HR.NUM_RESERVA(+)) '+
            '           AND (TDC.COD_TIPO_DC = L.COD_TIPO_DC) '+
            '           AND (HR.PRINCIPAL = ''True'') '+
            '           AND (L.VALOR_LANCAMENTO <> 0) AND (L.VALOR_LANCAMENTO IS NOT NULL) '+
            '         ORDER BY C10,C9) D, '+
            '       (SELECT HR.COD_EMPRESA, HR.NUM_RESERVA, C.IDPESSOA, '+
            '               TO_CHAR(N.DATA_NOTA,''YYYYMMDD'') AS C3, '+
            '               REPLACE(NVL(N.NOTA_INICIAL,N.NUM_NOTA), ''-'') AS C9, '+
            '               N.FLAGSERIE C10, '+
            '               ROUND(((L.VALOR_LANCAMENTO*-1) * 100),0) AS C14, '+
            '               ROUND(((L.VALOR_LANCAMENTO*-1) * 100),0) AS C15 '+
            '          FROM NOTAVHL N, LANCAMENVHL L, TIPODEBCREDHOTEL T, IMPOSXTIPODCHOTEL I, PARAMLIVRO P, '+
            '               HEFAZRES HR, TIPODC TDC, CLIENTEPESS C '+
            '         WHERE (T.IDHOTEL = ' + IntToStr(IdHotel) + ') '+
            '           AND (P.IDPESSOA = ' + IntToStr(IdPessoa) + ') '+
            '           AND (N.DATA_NOTA BETWEEN TO_DATE(' + QuotedStr(DataIni) + ',''DD/MM/YYYY'') AND TO_DATE(' + QuotedStr(DataFim) + ',''DD/MM/YYYY'')) '+
            '           AND (L.COD_TIPO_DC   = T.CODREDUZIDO(+)) '+
            '           AND (I.IDTIPODEBCRED(+) = T.IDTIPODEBCRED) '+
            '           AND (I.IDHOTEL(+) = T.IDHOTEL) '+
            '           AND (T.DEBITOCREDITO <> ''D'') '+
            '           AND (I.IDIMPOSTO = P.IDISSHOTEL(+)) '+
            '           AND (HR.COD_EMPRESA = C.CODCLIENTE(+)) '+
            '           AND (N.NUM_NOTA = L.NUM_NOTA(+)) '+
            '           AND (L.NUM_RESERVA = HR.NUM_RESERVA(+)) '+
            '           AND (TDC.COD_TIPO_DC = L.COD_TIPO_DC) '+
            '           AND (HR.PRINCIPAL = ''True'') '+
            '           AND (L.VALOR_LANCAMENTO <> 0) AND (L.VALOR_LANCAMENTO IS NOT NULL) '+
            '         ORDER BY C10,C9) C '+
            ' WHERE (D.COD_EMPRESA = C.COD_EMPRESA(+)) '+
            '   AND (D.IDPESSOA = C.IDPESSOA(+)) '+
            '   AND (D.NUM_RESERVA = C.NUM_RESERVA(+)) '+
            '   AND (D.C3 = C.C3(+)) '+
            '   AND (D.C9 = C.C9(+)) '+
            '   AND (D.C10 = C.C10(+)) '+
            ' ORDER BY D.C10, D.C9 ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlMasterSaf.ListTipoDocumento: OleVariant;
Var
 Ssql : string;
begin
  Ssql := 'SELECT TO_CHAR(RTRIM(LTRIM(SUBSTR(CODTIPDOC, 1, 5)))) AS C1, '+
          '       ''19960101'' AS C2, DECODE(DESCRICAO,NULL,''DOCUMENTO'',DESCRICAO) AS C3, '+
          '       ''S'' AS C4 '+
          '  FROM TIPODOCRECPAG '+
          ' UNION ALL '+
          ' SELECT ''NF'' AS C1, '+
          '        ''19960101'' AS C2, '+
          '        ''Nota Fiscal'' AS C3, '+
          '        ''S'' AS C4 '+
          '   FROM DUAL ';
  Result := GetDataPacket(Ssql);
end;

end.

