unit uCtrlTerceiros;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient;
  Type
    TCtrlTerceiros = Class(TCmControlObject)

    private
    protected
      procedure DoChangeDataBase; Override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      {Lista todos os tipos de Agregados - Esse list tem que ficar no CAPCAR}
      function ListTiposDeAgregados : OleVariant;
      {Lista todos os impostos do hotel - procurar o dono dessa tabela para passar esse List}
      function ListTiposDeImpostos : OleVariant;
      {Lista o IDISSHOTEL da empresa logada no sistema - Esse List pertence a classe de controle do
       ParamLivro}
      function ListISSHotel(IdPessoa : Integer) : OleVariant;
      {Lista o imposto da nota - pertence ao almoxa - Igor }
      function ListAgradosRecDev(IdNfRecebeDevol : LongInt) : OleVariant;
      {Lista os itens da nota - Almoxa - Igor}
      function ListItensRecebDevol(IdNfRecebDevol : LongInt) : OleVariant;
      {Lista os impostos dos itens de Recb/Devol - Almoxa - Igor}
      function ListImpostoItem(IdItemRecebDevol : LongInt) : OleVariant;
      {Lista a Razão Social da empresa própria}
      function ListRazaoSocialEmpresaProp(IdPessoa : LongInt) : OleVariant;
      {Lista os lançamentos do Front 1 - VHF}
      function ListLancamentosFront1(NumNotaRegime, IdHotel, IdPessoa : LongInt) : OleVariant;
      {Lista os lançamento do Front - VHF}
      function ListLancamentosFront(IdConta, IdHotel, IdPessoa : LongInt) : OleVariant;
      {Lista os lançamentos do VHL}
      function ListLancamentosVHL(NumNota, IdHotel, IdPessoa : string) : OleVariant;
      {Lista os exercícios disponíveis}
      function ListExercicio : OleVariant;
      {Lista os tipos de documentos disponíveis}
      function ListTipoDocPessoa : OleVariant;

      function ListMascaraFis(IdPessoa : LongInt) : OleVariant;

      function ListMascaraJur(IdPessoa : LongInt) : OleVariant;

    protected

    End;


implementation

{ TCtrlTerceiros }

constructor TCtrlTerceiros.Create;
begin
  inherited;

end;

destructor TCtrlTerceiros.Destroy;
begin
  inherited;

end;

procedure TCtrlTerceiros.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlTerceiros.ListAgradosRecDev(
  IdNfRecebeDevol: Integer): OleVariant;
Var
   Ssql : string;
begin
  Ssql := 'SELECT A.ALIQUOTA,A.VLRAGREGADO,A.VLRRECUPERADO,A.BASECALCULO, '+
          '       A.CODTIPOCUSTAGREG,T.CODTRATFISCE '+
          '  FROM AGRNFRECDEV A,TIPOAGRE T '+
          ' WHERE (A.IDNFRECEBDEVOL = '+intTostr(IdNfRecebeDevol)+') AND '+
          '       (A.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)';
  Result := GetDataPacket(Ssql);        
end;


function TCtrlTerceiros.ListImpostoItem(
                        IdItemRecebDevol: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT A.ALIQUOTA,A.VLRAGREGADO,A.VLRRECUPERADO,A.BASECALCULO, '+
          '       A.CODTIPOCUSTAGREG,T.CODTRATFISCE '+
          '  FROM AGRITENSRECDEV A,TIPOAGRE T '+
          ' WHERE (A.IDITENSRECDEV = '+intTostr(IdItemRecebDevol)+') '+
          '   AND (A.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG) ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlTerceiros.ListISSHotel(IdPessoa : Integer) : OleVariant;
Var
  Ssql : string;
begin
  Ssql :=  'SELECT P.IDISSHOTEL,P.IDPESSOA '+
           '  FROM PARAMLIVRO P,NFLIVRO NL,NFLIVRODETALHE ND '+
           ' WHERE (P.IDPESSOA = '+IntTostr(IdPessoa)+ ') '+
           '   AND (NL.IDNFLIVRO = ND.IDNFLIVRO) '+
           '   AND (P.IDPESSOA = NL.IDPESSOA) ';

  Result := GetDataPacket(Ssql);
end;

function TCtrlTerceiros.ListItensRecebDevol(
                        IdNfRecebDevol: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT I.IDITENSRECDEV,I.CODFISCAL,P.CONSUMOREVENDA,P.ISENTOOUTROS, '+
          '       (I.QTDERECEBDEVOL*I.VLRUNITARIO) AS VLRTOTITEM '+
          '  FROM ITENSRECEBDEVOL I,PRODUTO P '+
          ' WHERE (I.IDNFRECEBDEVOL = '+intTostr(IdNfRecebDevol)+') '+
          '   AND (SUBSTR(I.CODARTIGO,1,6) = P.CODPRODUTO)';
  Result := GetDataPacket(Ssql);
end;


function TCtrlTerceiros.ListLancamentosFront(IdConta, IdHotel, IdPessoa : Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT L.NUMERONOTA, I.PERCENTUAL AS ALIQUOTA, P.IDISSHOTEL, ' +
          '       SUM((L.VLRLANCAMENTO * I.BASE/100)) AS BASECALCULO, ' +
          '       SUM(((L.VLRLANCAMENTO * I.BASE/100)*(I.PERCENTUAL/100))) AS VALORIMPOSTO, ' +
          '       SUM( L.VLRLANCAMENTO ) AS VALORCONTABIL ' +
          '  FROM LANCAMENTOSFRONT L, IMPOSXTIPODCHOTEL I, PARAMLIVRO P ' +
          ' WHERE (L.IDCONTA = '+intTostr(IdConta)+') ' +
          '   AND (I.IDHOTEL = '+intTostr(IdHotel)+') ' +
          '   AND (P.IDPESSOA = '+intTostr(IdPessoa)+') ' +
          '   AND (I.IDTIPODEBCRED = L.IDTIPODEBCRED) ' +
          '   AND (I.IDIMPOSTO = P.IDISSHOTEL) ' +
          '   AND (L.NUMNOTAREGIME IS NULL) ' +
          ' GROUP BY L.NUMERONOTA, I.PERCENTUAL, P.IDISSHOTEL';
  Result := GetDataPacket(Ssql); 
end;

function TCtrlTerceiros.ListLancamentosFront1(NumNotaRegime, IdHotel, IdPessoa : LongInt) : OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT L.NUMNOTAREGIME, I.PERCENTUAL AS ALIQUOTA, ' +
          '       P.IDISSHOTEL, SUM((L.VLRLANCAMENTO * I.BASE/100)) AS BASECALCULO, ' +
          '       SUM(((L.VLRLANCAMENTO * I.BASE/100)*(I.PERCENTUAL/100))) AS VALORIMPOSTO, ' +
          '       SUM(L.VLRLANCAMENTO) AS VALORCONTABIL ' +
          '  FROM LANCAMENTOSFRONT L, IMPOSXTIPODCHOTEL I, PARAMLIVRO P ' +
          ' WHERE (L.NUMNOTAREGIME = '+IntTostr(NumNotaRegime)+') '+
          '   AND (I.IDHOTEL = '+IntTostr(IdHotel)+') ' +
          '   AND (P.IDPESSOA = '+IntTostr(IdPessoa)+') ' +
          '   AND (I.IDTIPODEBCRED = L.IDTIPODEBCRED) ' +
          '   AND (I.IDIMPOSTO = P.IDISSHOTEL) ' +
          ' GROUP BY L.NUMNOTAREGIME, I.PERCENTUAL, P.IDISSHOTEL ';
  result := GetDataPacket(Ssql); 
end;

function TCtrlTerceiros.ListLancamentosVHL(NumNota, IdHotel,
                                           IdPessoa: string): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT L.NUM_NOTA, L.COD_HOSPEDE, ' +
          '       I.PERCENTUAL AS ALIQUOTA, ' +
          '       P.IDISSHOTEL, SUM((DECODE(T.DEBITOCREDITO,''D'',L.VALOR_LANCAMENTO,(L.VALOR_LANCAMENTO*-1)) * I.BASE/100) ) AS BASECALCULO, ' +
          '       SUM(((DECODE(T.DEBITOCREDITO,''D'',L.VALOR_LANCAMENTO,(L.VALOR_LANCAMENTO*-1)) * I.BASE/100)*(I.PERCENTUAL/100)) ) AS VALORIMPOSTO, ' +
          '       SUM(DECODE(T.DEBITOCREDITO,''D'',L.VALOR_LANCAMENTO,(L.VALOR_LANCAMENTO*-1))) AS VALORCONTABIL ' +
          '  FROM LANCAMENVHL L, TIPODEBCREDHOTEL T, IMPOSXTIPODCHOTEL I, PARAMLIVRO P ' +
          ' WHERE (L.NUM_NOTA      = '+NumNota+') ' +
          '   AND (T.IDHOTEL       = '+IdHotel+') ' +
          '   AND (P.IDPESSOA      = '+IdPessoa+') ' +
          '   AND (L.COD_TIPO_DC   = T.CODREDUZIDO) ' +
          '   AND (I.IDTIPODEBCRED = T.IDTIPODEBCRED) ' +
          '   AND (I.IDHOTEL       = T.IDHOTEL) ' +
          '   AND (I.IDIMPOSTO     = P.IDISSHOTEL) ' +
          ' GROUP BY L.NUM_NOTA, I.PERCENTUAL, P.IDISSHOTEL, L.COD_HOSPEDE ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlTerceiros.ListExercicio : OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT DISTINCT PEREXERCICIO '+
          '  FROM PERIODO ' +
          ' ORDER BY PEREXERCICIO';
  Result := GetDataPacket(Ssql);
end;

function TCtrlTerceiros.ListRazaoSocialEmpresaProp(
                        IdPessoa: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT RAZAOSOCIAL '+
          '  FROM PESSOA '+
          ' WHERE IDPESSOA = '+IntTostr(IdPessoa);
  Result := GetDataPacket(Ssql);        

end;



function TCtrlTerceiros.ListTiposDeAgregados: OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT CODTIPOCUSTAGREG, DESCCUSTAGREG, CODTRATFISCE, '+
          '       TOTALITEM, PERCVALOR, CODTRATFISCD '+
          '  FROM TIPOAGRE '+
          ' ORDER BY DESCCUSTAGREG';
  Result := GetDataPacket(Ssql);

end;

function TCtrlTerceiros.ListTiposDeImpostos: OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT IDIMPOSTO, NOME '+
          '  FROM IMPOSTOSHOTEL '+
          ' ORDER BY NOME';
  Result := GetDataPacket(Ssql);
end;

function TCtrlTerceiros.ListTipoDocPessoa: OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT IDDOCUMENTO, NOMEDOCUMENTO '+
          '  FROM TIPODOCPESSOA '+
          ' ORDER BY IDDOCUMENTO';
  Result := GetDataPacket(Ssql);
end;


function TCtrlTerceiros.ListMascaraFis(IdPessoa: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT T.MASCARA '+
          '  FROM TIPODOCPESSOA T, PARAMGLOBAL P '+
          ' WHERE (T.IDDOCUMENTO = P.DOCPFISICA) '+
          '   AND (P.IDPESSOA = '+IntToStr(IdPessoa)+')';
  Result := GetDataPacket(SSql);
end;

function TCtrlTerceiros.ListMascaraJur(IdPessoa: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT T.MASCARA FROM TIPODOCPESSOA T, PARAMGLOBAL P '+
          ' WHERE (T.IDDOCUMENTO = P.DOCPJURIDICA) '+
          '   AND (P.IDPESSOA = '+IntToStr(IdPessoa)+')';
  Result := GetDataPacket(SSql);
end;

end.
