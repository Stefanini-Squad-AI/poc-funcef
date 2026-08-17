unit uCtrlSisif;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient;

Type
    TCtrlSisif = Class(TCmControlObject)

    private

    protected

      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;override;
    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      {monta o OleVariant com os dados para o Registro corrente}
      function MontaSelect(IdPessoa, IdContador, TipoRegistro : LongInt; DataIni, DataFim, ListaCodigos : string) : OleVariant;
      function PegaCodMunIBGE(idForcli : longInt) : string;

    protected

    End;

implementation

{ TCtrlSisif }

procedure TCtrlSisif.AfterInitialize;
begin
  inherited;

end;

constructor TCtrlSisif.Create;
begin
  inherited;

end;

destructor TCtrlSisif.Destroy;
begin
  inherited;

end;

procedure TCtrlSisif.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlSisif.MontaSelect(IdPessoa, IdContador, TipoRegistro : LongInt; DataIni, DataFim, ListaCodigos : string) : OleVariant;
Var
 Ssql  : string;
begin
  Ssql := '';
  Case TipoRegistro of
    10: //Transmissor Responsável pelo Envio do Arquivo Magnético
       Begin
         Ssql := 'SELECT REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(P.NUMDOCUMENTO, '+ quotedStr('-')+', '+quotedStr('')+ '), '+quotedStr('.')+', '+quotedStr('')+'), '+quotedStr(',')+', '+quotedStr('')+'), '+quotedStr('/')+', '+quotedStr('')+'), '+quotedStr(' ')+', '+quotedStr('')+'), '+quotedStr(';')+', '+quotedStr('')+')  As NUMDOCUMENTO, P.RAZAOSOCIAL, '+
                 '       T.NUMERO, T.DDD '+
                 '  FROM PESSOA P, ESTADO ES, CIDADES C, ENDPESS E, (SELECT IDENDERECO, DDD, NUMERO, TIPO, MAX(IDTELEFONE) AS IDTELEFONE '+
                 '                                                                                FROM TELENDPESS WHERE (TIPO LIKE ''%F%'') GROUP BY IDENDERECO, NUMERO, TIPO, DDD) T '+
                 ' WHERE P.IDPESSOA = '+intTostr(IdPessoa)+' '+
                 '   AND P.IDENDCOMERCIAL = E.IDENDERECO(+) '+
                 '   AND E.IDCIDADES = C.IDCIDADES(+) '+
                 '   AND C.IDESTADO = ES.IDESTADO(+) '+
                 '   AND E.IDENDERECO = T.IDENDERECO(+) ';
       end;
    11: //Dados complementares do Transmissor
       Begin
         Ssql := 'SELECT DISTINCT E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, C.CODMUNICIPIOIBGE, '+
                 '                E.CEP, P.NOME, T.NUMERO as FAX, T.TIPO, P.EMAIL, E.CODESTADO '+
                 '  FROM ENDPESS E, (SELECT IDENDERECO, TIPO, NUMERO FROM TELENDPESS) T, PESSOA P, CIDADES C '+
                 ' WHERE P.IDPESSOA = '+intTostr(IdPessoa)+' '+
                 '   AND P.IDENDCOMERCIAL = E.IDENDERECO(+) '+
                 '   AND E.IDENDERECO = T.IDENDERECO(+) '+
                 '   AND E.IDCIDADES = C.IDCIDADES(+) ';
       end;
    20: //Contribuinte do estado do Ceará
       Begin
         Ssql := 'SELECT REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(D.NUMDOCUMENTO, '+ quotedStr('-')+', '+quotedStr('')+ '), '+quotedStr('.')+', '+quotedStr('')+'), '+quotedStr(',')+', '+quotedStr('')+'), '+quotedStr('/')+', '+quotedStr('')+'), '+quotedStr(' ')+', '+quotedStr('')+'), '+quotedStr(';')+', '+quotedStr('')+')  AS INSCEST, P.RAZAOSOCIAL, ES.CODESTADO, C.NOME, '+
                 '       T.NUMERO, T.DDD, C.CODMUNICIPIOIBGE, TO_CHAR(INV.DTINVENTARIO, ''YYYYMMDD'') AS DTINVENTARIO, E.LOGRADOURO, E.COMPLEMENTO, E.BAIRRO, E.CEP, P.EMAIL '+
                 '  FROM PESSOA P, DOCPESSOA D, ESTADO ES, CIDADES C, ENDPESS E, (SELECT IDENDERECO, Numero, DDD, Tipo, MAX(IDTELEFONE) AS IDTELEFONE '+
                 '                                                                                FROM TELENDPESS WHERE (TIPO LIKE ''%F%'') GROUP BY IDENDERECO, NUMERO, TIPO, DDD) T, '+
                 '       PARAMLIVRO PL, (SELECT MAX(DATAULTINVENTARIO) AS DTINVENTARIO FROM UNCUSTEI) INV '+
                 ' WHERE P.IDPESSOA = '+intTostr(IdPessoa)+' '+
                 '   AND P.IDPESSOA = PL.IDPESSOA '+
                 '   AND PL.IDINSCEST = D.IDDOCUMENTO(+) '+
                 '   AND P.IDPESSOA = D.IDPESSOA '+
                 '   AND P.IDENDCOMERCIAL = E.IDENDERECO(+) '+
                 '   AND E.IDCIDADES = C.IDCIDADES(+) '+
                 '   AND C.IDESTADO = ES.IDESTADO(+) '+
                 '   AND E.IDENDERECO = T.IDENDERECO(+) ';
       end;
    21: //Dados do Contabilista
       Begin
         Ssql := 'SELECT REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(P.NUMDOCUMENTO, '+ quotedStr('-')+', '+quotedStr('')+ '), '+quotedStr('.')+', '+quotedStr('')+'), '+quotedStr(',')+', '+quotedStr('')+'), '+quotedStr('/')+', '+quotedStr('')+'), '+quotedStr(' ')+', '+quotedStr('')+'), '+quotedStr(';')+', '+quotedStr('')+')  AS NUMDOCUMENTO, P.NOME, ES.CODESTADO, C.NOME, '+
                 '       T.NUMERO, T.DDD, C.CODMUNICIPIOIBGE, E.LOGRADOURO, E.COMPLEMENTO, E.BAIRRO, E.CEP, P.EMAIL '+
                 '  FROM PESSOA P, ESTADO ES, CIDADES C, ENDPESS E, (SELECT IDENDERECO, Numero, DDD, Tipo, MAX(IDTELEFONE) AS IDTELEFONE '+
                 '                                                                                FROM TELENDPESS WHERE (TIPO LIKE ''%F%'') GROUP BY IDENDERECO, NUMERO, TIPO, DDD) T '+
                 ' WHERE P.IDPESSOA = '+intTostr(IdContador)+' '+
                 '   AND P.IDENDCOMERCIAL = E.IDENDERECO(+) '+
                 '   AND E.IDCIDADES = C.IDCIDADES(+) '+
                 '   AND C.IDESTADO = ES.IDESTADO(+) '+
                 '   AND E.IDENDERECO = T.IDENDERECO(+) ';
       end;
    30: //Tabela de Produtos/Servições
       Begin
         Ssql := 'SELECT DISTINCT CODPRODUTO, DESCPROD, CODMEDCUSTO FROM PRODUTO ';
       end;
    34: //Registro de Inventário
      Begin
        Ssql := 'SELECT AR.CODARTIGO, (MV.SALDOQTDE * 100000) AS SALDOQTDE, (MV.CUSTOMEDIO * 10000000) AS CUSTOMEDIO, AL.DESCALMOX, PR.CODGRUPOPROD, PR.DESCPROD '+
                '  FROM (SELECT M.CODARTIGO, M.SALDOQTDEMOV AS SALDOQTDE, M.CUSTOMEDIOMOV AS CUSTOMEDIO, '+
                '               M.CODALMOXARIFADO, M.IDPESSOA '+
                '          FROM MOVIMENT M, (SELECT M.CODARTIGO, MAX(M.IDMOV) AS IDMOV '+
                '                              FROM MOVIMENT M, (SELECT CODARTIGO, MAX(DATAMOV) AS MAXDATAMOV '+
                '                                                  FROM MOVIMENT '+
                '                                                 WHERE  (DATAMOV <= TO_DATE('+QuotedStr(DataFim)+',''DD/MM/YYYY'')) '+
                '                                                 GROUP BY CODARTIGO) SUB '+
                '                             WHERE (M.CODARTIGO = SUB.CODARTIGO) '+
                '                               AND (M.DATAMOV = SUB.MAXDATAMOV) '+
                '                               AND (M.IDPESSOA   = '+IntToStr(IdPessoa)+' ) '+
                '                             GROUP BY M.CODARTIGO ) AUX '+
                '         WHERE (M.CODARTIGO = AUX.CODARTIGO) '+
                '           AND (M.IDPESSOA   = '+IntToStr(IdPessoa)+' ) '+
                '           AND (M.IDMOV = AUX.IDMOV)) MV, ARTIGO AR, PRODUTO PR, GRUPPROD GP, ALMOX AL '+
                ' WHERE (AL.IDPESSOA   = '+IntToStr(IdPessoa)+' ) '+
                '   AND (MV.SALDOQTDE <> 0) '+
                '   AND (AR.CODPRODUTO = PR.CODPRODUTO) '+
                '   AND (AR.CODARTIGO  = MV.CODARTIGO) '+
                '   AND (PR.CODGRUPOPROD = GP.CODGRUPOPROD) '+
                '   AND (AL.CODALMOXARIFADO = MV.CODALMOXARIFADO) '+
                ' ORDER BY AL.DESCALMOX,PR.CODGRUPOPROD, PR.DESCPROD ';
      end;
    37: //Tabela de Códigos Contábeis
      Begin
        Ssql := 'SELECT PC.PLACONTA AS CODCONTA, PC.PLANOME AS DESCRICAO '+
                '  FROM PLANOCONTA PC, PARAMCONTAB PR '+
                ' WHERE (PR.IDPESSOA = '+IntToStr(IdPessoa)+') '+
                '   AND (PC.PLANO = PR.PLANO) '+
                ' ORDER BY CODCONTA ';
      end;
    40: //Nota Fiscal - modelo 1 ou 1A
      Begin
        Ssql := 'SELECT NF.NUMNF, NF.CODFISCAL, TO_CHAR(NF.DATAEMISNF,''YYYYMMDD'')  AS DATAEMISNF, NF.IDFORCLI, NF.VLRNOTAFISCAL, TO_CHAR(NF.DATAEMISNF,''YYYYMMDD'') AS DATAEMISNF, TO_CHAR(NF.DATAENTDEVOL,''YYYYMMDD'')  AS DATAENTDEVOL '+
                '  FROM NFRECEBDEVOL NF, ITENSRECEBDEVOL IT, PRODUTO P, agritensrecdev A '+
                ' WHERE NF.IDPESSOA = '+IntToStr(IdPessoa)+' '+
                '   AND NF.DATAEMISNF BETWEEN TO_DATE('+ QuotedStr(DataIni)+', ''DD/MM/YYYY'') AND TO_DATE('+ QuotedStr(DataFim)+', ''DD/MM/YYYY'') '+
                '   AND NF.IDNFRECEBDEVOL = IT.IDNFRECEBDEVOL '+
                '   AND IT.CODARTIGO = P.CODPRODUTO '+
                '   AND IT.IDITENSRECDEV = A.IDITENSRECDEV ';
      end;
    43: //Resumo Movimento Diário
      Begin
        Ssql := 'SELECT TO_CHAR(L.DATAEMISSAONF, ''YYYYMMDD'') AS DATAEMISSAONF, L.CONTADORINI, L.CONTADORFIM, L.CONTADORREDUCAOZ, L.TOTALIZADORINI, '+
                '  L.TOTALIZADORFIM, L.IDNFLIVRO, L.CANCELAMENTO, L.DESCONTO, L.SUBSTITUTRIB, M.NUMSERIEFABRI, M.IDMAQUINAECF, L.NUMNFINI '+
                '  FROM NFLIVRO L, MAQUINAECF M '+
                ' WHERE L.IDPESSOA = '+intTostr(IdPessoa)+' '+
                '   AND L.CODMODELO in ('+  ListaCodigos + ') '+ // cupom fiscal
                '   AND L.IDMAQUINAECF = M.IDMAQUINAECF '+
                '   AND L.DataEntradaNF BETWEEN TO_DATE('+quotedStr(Dataini)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedstr(DataFim)+ ', ''DD/MM/YYYY'') '+
                ' GROUP BY DATAEMISSAONF, L.CONTADORINI, L.CONTADORFIM, L.CONTADORREDUCAOZ, L.TOTALIZADORINI, L.NUMNFINI, '+
                '          L.TOTALIZADORFIM, L.IDNFLIVRO, L.CANCELAMENTO, L.DESCONTO, L.SUBSTITUTRIB, M.NUMSERIEFABRI, M.IDMAQUINAECF ';
      end;
    60: // Itens de Produto do Documento Fiscal
      Begin
        Ssql := 'SELECT NF.NUMNF, TO_CHAR(NF.DATAEMISNF,''YYYYMMDD'')  AS DATAEMISNF, NF.IDFORCLI, IT.CODARTIGO, IT.CODCENTROCUSTO, IT.UNIDNEGOC, '+
                '       IT.CODFISCAL, (IT.QTDERECEBDEVOL * 10000) AS QTDERECEBDEVOL, (IT.VLRUNITARIO * 10000) AS VLRUNITARIO, '+
                '       P.CODMEDCUSTO, P.DESCPROD, A.CODTIPOCUSTAGREG, IT.IDNFRECEBDEVOL, P.SITUACAOTRIB, NAT.CODNATUREZA '+
                '  FROM NFRECEBDEVOL NF, ITENSRECEBDEVOL IT, PRODUTO P, agritensrecdev A, NATUREZAESTOQUE NAT, GRUPPROD G '+
                ' WHERE NF.IDPESSOA = '+IntToStr(IdPessoa)+' '+
                '   AND NF.DATAEMISNF BETWEEN TO_DATE('+QuotedStr(DataIni)+', ''DD/MM/YYYY'') AND TO_DATE('+QuotedStr(DataFim)+', ''DD/MM/YYYY'') '+
                '   AND NF.IDNFRECEBDEVOL = IT.IDNFRECEBDEVOL '+
                '   AND IT.CODARTIGO = P.CODPRODUTO '+
                '   AND P.CODGRUPOPROD = G.CODGRUPOPROD '+
                '   AND G.IDNATUREZAESTOQUE = NAT.IDNATUREZAESTOQUE(+) '+
                '   AND IT.IDITENSRECDEV = A.IDITENSRECDEV ';
      end;
    62:
      Begin
        Ssql := 'SELECT P.NUMDOCUMENTO, REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(D.NUMDOCUMENTO, '+ quotedStr('-')+', '+quotedStr('')+ '), '+quotedStr('.')+', '+quotedStr('')+'), '+quotedStr(',')+', '+quotedStr('')+'), '+quotedStr('/')+', '+quotedStr('')+'), '+quotedStr(' ')+', '+quotedStr('')+'), '+quotedStr(';')+', '+quotedStr('')+')  AS INSCEST, P.RAZAOSOCIAL, ES.CODESTADO '+
                '  FROM PESSOA P, DOCPESSOA D, ESTADO ES, CIDADES C, ENDPESS E, '+
                '       PARAMLIVRO PL'+
                ' WHERE P.IDPESSOA IN (SELECT IDFORCLI FROM NFRECEBDEVOL WHERE DATAEMISNF BETWEEN TO_DATE('+ QuotedStr(DataIni)+', ''DD/MM/YYYY'') AND TO_DATE('+ QuotedStr(DataFim)+', ''DD/MM/YYYY'')) '+
                '   AND P.IDPESSOA = PL.IDPESSOA '+
                '   AND PL.IDINSCEST = D.IDDOCUMENTO(+) '+
                '   AND P.IDPESSOA = D.IDPESSOA '+
                '   AND P.IDENDCOMERCIAL = E.IDENDERECO(+) '+
                '   AND E.IDCIDADES = C.IDCIDADES(+) '+
                '   AND C.IDESTADO = ES.IDESTADO(+) ';
      end;
    67:
      Begin
        Ssql := 'SELECT TO_CHAR(L.DATAEMISSAONF, ''YYYYMMDD'') AS DATAEMISSAONF, L.CONTADORINI, L.CONTADORFIM, L.CONTADORREDUCAOZ, L.TOTALIZADORINI, L.IDFORCLI, '+
                '       L.TOTALIZADORFIM, L.IDNFLIVRO, L.CANCELAMENTO, L.DESCONTO, L.SUBSTITUTRIB, M.NUMSERIEFABRI, M.IDMAQUINAECF, L.NUMNFINI, L.NUMNFFIM, (L.VLRTOTALNF * 100) AS VLRTOTALNF '+
                '  FROM NFLIVRO L, MAQUINAECF M '+
                ' WHERE L.IDPESSOA = '+intTostr(IdPessoa)+' '+
                '   AND L.CODMODELO in ('+  ListaCodigos + ') '+ // cupom fiscal
                '   AND L.IDMAQUINAECF = M.IDMAQUINAECF '+
                '   AND L.DataEntradaNF BETWEEN TO_DATE('+quotedStr(Dataini)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedstr(DataFim)+ ', ''DD/MM/YYYY'') '+
                ' GROUP BY DATAEMISSAONF, L.CONTADORINI, L.CONTADORFIM, L.CONTADORREDUCAOZ, L.TOTALIZADORINI, L.NUMNFINI, L.NUMNFFIM, VLRTOTALNF, '+
                '          L.TOTALIZADORFIM, L.IDNFLIVRO, L.CANCELAMENTO, L.DESCONTO, L.SUBSTITUTRIB, M.NUMSERIEFABRI, M.IDMAQUINAECF, L.IDFORCLI ';
      end;
    69:
      Begin
        Ssql := 'SELECT COUNT(IT.IDITENSRECDEV) AS NUMITENS, NF.NUMNF, NF.CODFISCAL, TO_CHAR(NF.DATAEMISNF,''YYYYMMDD'')  AS DATAEMISNF, NF.IDFORCLI, NF.VLRNOTAFISCAL, TO_CHAR(NF.DATAEMISNF,''YYYYMMDD'') '+
                '       AS DATAEMISNF, TO_CHAR(NF.DATAENTDEVOL,''YYYYMMDD'')  AS DATAENTDEVOL, NF.IDNFRECEBDEVOL, (NF.VLRNOTAFISCAL * 100) AS VLRNOTAFISCAL '+
                '  FROM NFRECEBDEVOL NF, ITENSRECEBDEVOL IT, PRODUTO P, agritensrecdev A '+
                ' WHERE NF.IDPESSOA = '+IntToStr(IdPessoa)+' '+
                '   AND NF.DATAEMISNF BETWEEN TO_DATE('+ QuotedStr(DataIni)+', ''DD/MM/YYYY'') AND TO_DATE('+ QuotedStr(DataFim)+', ''DD/MM/YYYY'') '+
                '   AND NF.IDNFRECEBDEVOL = IT.IDNFRECEBDEVOL '+
                '   AND IT.CODARTIGO = P.CODPRODUTO '+
                '   AND IT.IDITENSRECDEV = A.IDITENSRECDEV '+
                ' GROUP BY NF.NUMNF, NF.CODFISCAL, DATAEMISNF, NF.IDNFRECEBDEVOL, '+
                '          DATAENTDEVOL, NF.VLRNOTAFISCAL, DATAEMISNF, NF.IDFORCLI ';
      end;
    691:
      Begin
        Ssql := 'SELECT TO_CHAR(L.DATAEMISSAONF, ''YYYYMMDD'') AS DATAEMISSAONF, L.CONTADORINI, L.CONTADORFIM, L.CONTADORREDUCAOZ, L.TOTALIZADORINI, '+
                '       L.TOTALIZADORFIM, L.IDNFLIVRO, L.CANCELAMENTO, L.DESCONTO, L.SUBSTITUTRIB, M.NUMSERIEFABRI, M.IDMAQUINAECF, L.NUMNFINI, L.NUMNFFIM, (L.VLRTOTALNF * 100) AS VLRTOTALNF '+
                '  FROM NFLIVRO L, MAQUINAECF M '+
                ' WHERE L.IDPESSOA = '+intTostr(IdPessoa)+' '+
                '   AND L.CODMODELO in ('+  ListaCodigos + ') '+ // cupom fiscal
                '   AND L.IDMAQUINAECF = M.IDMAQUINAECF '+
                '   AND L.DataEntradaNF BETWEEN TO_DATE('+quotedStr(Dataini)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedstr(DataFim)+ ', ''DD/MM/YYYY'') '+
                ' GROUP BY DATAEMISSAONF, L.CONTADORINI, L.CONTADORFIM, L.CONTADORREDUCAOZ, L.TOTALIZADORINI, L.NUMNFINI, L.NUMNFFIM, VLRTOTALNF, '+
                '          L.TOTALIZADORFIM, L.IDNFLIVRO, L.CANCELAMENTO, L.DESCONTO, L.SUBSTITUTRIB, M.NUMSERIEFABRI, M.IDMAQUINAECF ';
      end;



  end; //end do case


  Result := GetDataPacket(Ssql);

end;

procedure TCtrlSisif.OnCreateAppServer;
begin
  inherited;

end;

function TCtrlSisif.PegaCodMunIBGE(idForcli: Integer): string;
Var
  Ssql : string;
begin
  Ssql := 'SELECT C.CODMUNICIPIOIBGE '+
          '  FROM PESSOA P, CIDADES C, ENDPESS E '+
          ' WHERE P.IDPESSOA = '+intTostr(idForcli)+' '+
          '   AND P.IDENDCOMERCIAL = E.IDENDERECO(+) '+
          '   AND E.IDCIDADES = C.IDCIDADES(+) ';
  _Cds.data := GetDataPacket(SSql);
  Result := _Cds.fieldByname('CODMUNICIPIOIBGE').Asstring;
end;

end.
