unit uCtrlConvICMS5795;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient;

Type Total90 = Record
      Tipo    : string[2];
      Total   : integer;
end;

Type
    TCtrlConvICMS5795 = Class(TCmControlObject)

    private

    protected

      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;


      function MontaSelect(cds : TClientDataSet; TipoRegistro : Byte; IdPessoa : Integer;
                           Dataini, DataFim : string) : OleVariant; //monta o select para o tipo de registro solicitado
      function ListValordoImposto(IdNflivro : integer) : OleVariant;
      function BuscaCPFForCli(CodForCli, IdDocumento : LongInt) : String; //busca o cpf do cliente/fornecedor
      function BuscaInscEstForCli(CodForCli : LongInt; Isento : Boolean) : String;//busca o cnpj do cluente/fornecedor
      function BuscaCNPJForCli(CodForCli : LongInt) : String;//busca o cnpj do cluente/fornecedor
      function BuscaValorDesconto(Identificador, CodigoAgre : Longint) : string;
      function BuscaValorICMS(Identificador, CodigoAgre : Longint) : string;
      function BuscaValorICMSSubst(Identificador, CodigoAgre : Longint) : string;
      function BuscaPercICMSTribut(IdPessoa : longInt) : real;
      function ListaCodigos(TipoReg : string) : String;
      function strZero(TamanhoTexto : Integer; Texto : String) : String;  // preenche um valor com zeros a esquerda
      function strEspaco(TamanhoTexto : Integer; Texto : string) : string; //preenche uma string com espaÁos a direita
      function Zerodireita(TamanhoTexto : integer; texto : String) : string;
      function RemoveAcentos(str : string) : string;
      function FormataVAlor(NumeroCasas : integer; valor : string) : string;
      function DiasNoMes(AYear, AMonth: Integer): Integer; // retorna quantos dias tem um mes

    protected

    End;

implementation

{ TCtrlConvICMS5795 }

function TCtrlConvICMS5795.BuscaInscEstForCli(CodForCli: Integer; Isento : Boolean): String;
Var
  Ssql : string;
begin
  with _Cds do
    Begin
      Ssql := 'SELECT REPLACE(D.NUMDOCUMENTO, ''.'') AS NUMDOCUMENTO FROM DOCPESSOA D, PARAMLIVRO P '+
              ' WHERE P.IDINSCEST = D.IDDOCUMENTO '+
              '   AND D.IDPESSOA = '+intTostr(CodForCli);
      Data := GetDataPacket(Ssql);
      Result := fieldByname('NUMDOCUMENTO').Asstring;

      if not IsEmpty then
         result := fieldByname('NUMDOCUMENTO').Asstring
      else
        if Isento then
           result := 'ISENTO'
        else
           result := '';

    end;
end;

function TCtrlConvICMS5795.BuscaCPFForCli(CodForCli,
                                          IdDocumento: Integer): String;
Var
  Ssql : string;
begin
  with _Cds do
    Begin
      Ssql := 'SELECT NumDocumento '+
              '  FROM DocPessoa '+
              ' WHERE IdPessoa = '+intTostr(CodForCli)+' '+
              '   AND IdDocumento = '+intTostr(IdDocumento);
      Data := GetDataPacket(Ssql);
      result := StringReplace(Trim(StringReplace(StringReplace(fieldByname('NumDocumento').AsString, '.', '', [rfReplaceAll]), ',', '', [rfReplaceAll])), '/', '', [rfReplaceAll]);
    end;
end;

constructor TCtrlConvICMS5795.Create;
begin
  inherited;

end;

destructor TCtrlConvICMS5795.Destroy;
begin
  inherited;

end;


procedure TCtrlConvICMS5795.DoChangeDataBase;
begin
  inherited;

end;





function TCtrlConvICMS5795.ListValordoImposto(IdNflivro : integer) : OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT ALIQUOTA, VALORIMPOSTO, VALORISENTO, VALOROUTROS, VALORCONTABIL,BASECALCULO '+
          '  FROM NFLIVRODETALHE '+
          ' WHERE IDNFLIVRO = '+intTostr(IdNflivro)+
          '   AND ((ROUND(VALORIMPOSTO,2) <> 0) OR '+
          '       (ROUND(VALORISENTO,2) <> 0) OR '+
          '       (ROUND(VALOROUTROS,2) <> 0))';
  Result := GetDataPacket(Ssql);        
end;

function TCtrlConvICMS5795.MontaSelect(cds: TClientDataSet;
                                       TipoRegistro: Byte; IdPessoa : integer; Dataini, DataFim : string) : OleVariant;
Var
 Ssql  : string;
begin
  with cds do
    Begin
      Case TipoRegistro of
        10:
          Begin     //registro tipo 10
            Ssql := 'SELECT replace(replace(replace(replace(replace(replace(P.NumDocumento, '+ quotedStr('-')+', '+quotedStr('')+ '), '+quotedStr('.')+', '+quotedStr('')+'), '+quotedStr(',')+', '+quotedStr('')+'), '+quotedStr('/')+', '+quotedStr('')+'), '+quotedStr(' ')+', '+quotedStr('')+'), '+quotedStr(';')+', '+quotedStr('')+')  As NumDocumento, replace(replace(replace(replace(replace(replace(D.NumDocumento, '+ quotedStr('-')+', '+quotedStr('')+ '), '+quotedStr('.')+', '+quotedStr('')+'), '+quotedStr(',')+', '+quotedStr('')+'), '+quotedStr('/')+', '+quotedStr('')+'), '+quotedStr(' ')+', '+quotedStr('')+'), '+quotedStr(';')+', '+quotedStr('')+')  As InscEst, P.RazaoSocial, ES.CODESTADO, C.Nome, '+
                    '       T.Numero '+
                    '  FROM Pessoa P, DocPessoa D, ESTADO ES, Cidades C, EndPess E, (SELECT IDENDERECO, Numero, Tipo, MAX(IDTELEFONE) AS IDTELEFONE '+
                    '                                                                                FROM TELENDPESS WHERE (TIPO LIKE ''%F%'') GROUP BY IDENDERECO, Numero, Tipo) T, '+
                    '       PARAMLIVRO PL '+
                    ' WHERE P.idPessoa = '+intTostr(IdPessoa)+' '+
                    '   AND P.IDPESSOA = PL.IDPESSOA '+
                    '   AND PL.IDINSCEST = D.IdDocumento(+) '+
                    '   AND P.IdPessoa = D.IdPessoa '+
                    '   AND P.IdendComercial = E.IdEndereco(+) '+
                    '   AND E.IdCidades = C.IdCidades(+) '+
                    '   AND C.IDESTADO = ES.IDESTADO(+) '+
                    '   AND E.IdEndereco = T.IdEndereco(+) '+
                    '   AND ROWNUM < 2 ';
            Result := GetDataPacket(Ssql);
          end;
        11:
           Begin  //registro tipo 11
             Ssql := 'SELECT DISTINCT E.Logradouro, E.Numero, E.Complemento, E.Bairro, '+
                     '                E.Cep, P.Nome, T.Numero as Fax, T.Tipo '+
                     '  FROM EndPess E, (SELECT IDENDERECO, TIPO, NUMERO FROM TelendPess) T, Pessoa P '+
                     ' WHERE P.IdPessoa = '+intTostr(IdPessoa)+' '+
                     '   AND P.IdendComercial = E.IdEndereco(+) '+
                     '   AND E.IdEndereco = T.IdEndereco(+) ';
             Result := GetDataPacket(Ssql);
           end;
        50:
           Begin  //registro tipo 50
             Ssql := 'SELECT L.DataEntradaNF, ES.CODESTADO, L.CodModelo, '+
                     '       L.NumNFIni, L.NFCOMPLEMENTO, L.IdForCli, LD.CodFiscal, LD.ValorContabil, LD.BaseCalculo, '+
                     '       LD.ValorIsento, LD.ValorOutros, LD.ValorImposto, LD.Aliquota '+
                     '  FROM Pessoa P, NFLivro L, ESTADO ES, Cidades C, NFLivroDetalhe LD, EndPess E '+
                     ' WHERE L.IdPessoa = '+IntToStr(IdPessoa)+' '+
                     '   AND L.NUMNFINI IS NOT NULL '+
                     '   AND L.FlgEntradaSaida = '+quotedstr('E') + ' '+
                     '   AND L.CODMODELO in ('+  ListaCodigos('50') + ') '+ //nota fiscal de entradas
                     '   AND L.IdForCli = P.idPessoa '+
                     '   AND P.IdendComercial = E.IdEndereco(+) '+
                     '   AND E.IdCidades = C.IdCidades(+) '+
                     '   AND C.IDESTADO = ES.IDESTADO(+) '+
                     '   AND L.IdNFLivro = LD.IdNFLivro '+
                     '   AND LD.ValorContabil > 0 '+
                     '   AND L.DataEntradaNF BETWEEN TO_DATE('+quotedStr(Dataini)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedstr(DataFim) + ', ''DD/MM/YYYY'') ';
             cds.Data := GetDataPacket(Ssql);
             Result   := cds.Data;
             //cortei a Insc Est porque na base de teste havia algumas com 15 caracteres
            //se o 1∫ caracter do codfiscal for 3 a operaÁ„o ocorreu no exterior
           end;
        53:
           Begin  //Registro do Tipo 53
             Ssql := 'SELECT L.DataEntradaNF, ES.CODESTADO, L.CodModelo, LD.BCSUBST, '+
                     '       L.NumNFIni, L.IdForCli, L.NFCOMPLEMENTO, LD.CodFiscal, LD.VLRICMSSUBST, LD.BaseCalculo '+
                     '  FROM Pessoa P, NFLivro L, ESTADO ES, Cidades C, NFLivroDetalhe LD, EndPess E '+
                     ' WHERE L.IdPessoa = '+intTostr(IdPessoa)+' '+
                     '   AND L.FlgEntradaSaida = '+quotedStr('E') +' '+
                     '   AND L.CODMODELO in ('+  ListaCodigos('50') + ') '+ //nota fiscal de entradas
                     '   AND L.IdForCli = P.idPessoa '+
                     '   AND P.IdendComercial = E.IdEndereco(+) '+
                     '   AND E.IdCidades = C.IdCidades(+) '+
                     '   AND C.IDESTADO = ES.IDESTADO(+) '+
                     '   AND L.IdNFLivro = LD.IdNFLivro '+
                     '   AND LD.VlrICMSSubst > 0 '+
                     '   AND L.DataEntradaNF BETWEEN TO_DATE('+quotedStr(Dataini)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedstr(DataFim) + ', ''DD/MM/YYYY'') ';
             cds.Data := GetDataPacket(Ssql);
             Result   := cds.Data;
           end;
        54:
           Begin //registro tipo 54
             Ssql := 'SELECT L.CODMODELO, L.NUMNFINI, L.IDFORCLI, L.NFCOMPLEMENTO, NFR.CODFISCAL, IT.CODARTIGO, IT.QTDERECEBDEVOL, P.SITUACAOTRIB, P.SITUACAOTRIBA, '+
                     '       (IT.QTDERECEBDEVOL * IT.VLRUNITARIO) AS VALORTOTAL, (LD.BaseCalculo * 100) as BaseCalculo, LD.Aliquota, '+
                     '       A.IDAGRITENSRECDEV, IT.IDITENSRECDEV, NFR.IDNFRECEBDEVOL '+
                     '  FROM NFLIVRO L, NFRECEBDEVOL NFR, ITENSRECEBDEVOL IT, AGRITENSRECDEV A, NFLivroDetalhe LD, PRODUTO P '+
                     ' WHERE L.IDPESSOA = '+intTostr(IdPessoa)+' '+
                     '   AND L.NUMNFINI IS NOT NULL '+
                     '   AND L.IdNFLivro = LD.IdNFLivro '+
                     '   AND L.FlgEntradaSaida = '+quotedstr('E') +' '+
                     '   AND L.CODMODELO in ('+  ListaCodigos('50') + ') '+ // nota fiscal de entradas
                     '   AND L.IDPESSOA  = NFR.IDPESSOA '+
                     '   AND L.IDNFLIVRO = NFR.IDNFLIVRO '+
                     '   AND L.IDFORCLI  = NFR.IDFORCLI '+
                     '   AND L.NUMNFINI  = NFR.NUMNF '+
                     '   AND NFR.VLRNOTAFISCAL > 0 '+
                     '   AND (SUBSTR(IT.CODARTIGO,1,6) = P.CODPRODUTO) '+
                     '   AND NFR.IDNFRECEBDEVOL = IT.IDNFRECEBDEVOL '+
                     '   AND IT.IDITENSRECDEV = A.IDITENSRECDEV(+) '+
                     '   AND IT.VLRUNITARIO > 0 '+
                     '   AND IT.QTDERECEBDEVOL > 0 '+
                     '   AND L.DataEntradaNF BETWEEN TO_DATE('+quotedStr(Dataini)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedstr(DataFim)+ ', ''DD/MM/YYYY'') '+
                     ' ORDER BY L.NUMNFINI, L.IDFORCLI, L.CODMODELO ';

             cds.Data := GetDataPacket(Ssql);
             Result   := cds.Data;
           end;
        60:
           Begin //registro tipo 60
             Ssql := 'SELECT L.DATAEMISSAONF, L.CONTADORINI, L.CONTADORFIM, L.CONTADORREDUCAOZ, L.TOTALIZADORINI,  '+
                     '       L.TOTALIZADORFIM, L.IDNFLIVRO, L.CANCELAMENTO, L.DESCONTO, L.SUBSTITUTRIB, M.NUMSERIEFABRI, M.IDMAQUINAECF '+
                     '  FROM NFLIVRO L, MAQUINAECF M '+
                     ' WHERE L.IDPESSOA = '+intTostr(IdPessoa)+' '+
                     '   AND L.CODMODELO in ('+  ListaCodigos('60') + ') '+ // cupom fiscal
                     '   AND L.IDMAQUINAECF = M.IDMAQUINAECF '+
                     '   AND L.DataEntradaNF BETWEEN TO_DATE('+quotedStr(Dataini)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedstr(DataFim)+ ', ''DD/MM/YYYY'') '+
                     ' GROUP BY L.DATAEMISSAONF, L.CONTADORINI, L.CONTADORFIM, L.CONTADORREDUCAOZ, L.TOTALIZADORINI, '+
                     '          L.TOTALIZADORFIM, L.IDNFLIVRO, L.CANCELAMENTO, L.DESCONTO, L.SUBSTITUTRIB, M.NUMSERIEFABRI, M.IDMAQUINAECF ';
             cds.Data := GetDataPacket(Ssql);
             Result   := cds.Data;
           end;
        61:
           Begin //registro tipo 61
             Ssql := 'SELECT L.DATAENTRADANF, L.NUMNFINI, L.NFCOMPLEMENTO, L.CodModelo, L.NUMNFFIM, LD.CodFiscal, '+
                     '       LD.ValorContabil, LD.BaseCalculo, LD.ValorImposto, '+
                     '       LD.ValorIsento, LD.ValorOutros, LD.Aliquota '+
                     '  FROM NfLivro L, NfLivroDetalhe LD '+
                     ' WHERE L.IdPessoa = '+intTostr(IdPessoa)+' '+
                     '   AND L.CODMODELO in ('+  ListaCodigos('61') + ') '+ // Nota ao consumidor no ponto de venda
                     '   AND L.FlgEntradaSaida = '+quotedstr('S') + ' ' +
                     '   AND L.IdNfLivro = LD.idNfLivro '+
                     '   AND L.DATAENTRADANF BETWEEN TO_DATE('+quotedStr(Dataini)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedstr(DataFim)+ ', ''DD/MM/YYYY'') ';

             cds.Data := GetDataPacket(Ssql);
             Result   := cds.Data;

           end;
        70:
           Begin //registro tipo 70
             Ssql := 'SELECT L.DataEntradaNF, ES.CODESTADO, L.NFCOMPLEMENTO, L.CodModelo, '+
                     '       L.NumNFIni, L.IdForCli, LD.CodFiscal, LD.ValorContabil, LD.BaseCalculo, LD.ValorImposto, '+
                     '       LD.ValorIsento, LD.ValorOutros, LD.Aliquota '+
                     '  FROM Pessoa P, NFLivro L, ESTADO ES, Cidades C, NFLivroDetalhe LD, EndPess E '+
                     ' WHERE L.IdPessoa = '+intTostr(IdPessoa)+' '+
                     '   AND L.FlgEntradaSaida = '+quotedstr('E') + ' ' +
                     '   AND L.CODMODELO in ('+  ListaCodigos('70') + ') '+ // nota de transporte
                     '   AND L.IdForCli(+) = P.idPessoa '+
                     '   AND P.IdendComercial = E.IdEndereco(+) '+
                     '   AND E.IdCidades = C.IdCidades(+) '+
                     '   AND C.IDESTADO = ES.IDESTADO(+) '+
                     '   AND L.IdNFLivro = LD.IdNFLivro '+
                     '   AND L.DataEntradaNF BETWEEN TO_DATE('+quotedStr(Dataini)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedstr(DataFim)+ ', ''DD/MM/YYYY'') ';

             cds.Data := GetDataPacket(Ssql);
             Result   := cds.Data;
           end;
        75:
           Begin //registro tipo 75
             Ssql := 'SELECT DISTINCT P.DESCPROD, P.CODMEDCUSTO, SUBSTR(IT.CODARTIGO, 1, 6) AS CODARTIGO, P.SITUACAOTRIB, '+
                     '       0 AS ALIQUOTA '+
                     '  FROM NFLIVRO L, NFRECEBDEVOL NFR, ITENSRECEBDEVOL IT, AGRITENSRECDEV A, PRODUTO P, NFLIVRODETALHE LD '+
                     ' WHERE L.IDPESSOA = '+intTostr(IdPessoa)+' '+
                     '   AND L.NUMNFINI IS NOT NULL '+
                     '   AND L.FlgEntradaSaida = '+quotedstr('E') + ' ' +
                     '   AND L.CODMODELO in ('+  ListaCodigos('50') + ') '+ // nota fiscal de entradas
                     '   AND L.IDPESSOA  = NFR.IDPESSOA '+
                     '   AND L.IDNFLIVRO = NFR.IDNFLIVRO '+
                     '   AND L.IDFORCLI  = NFR.IDFORCLI '+
                     '   AND NFR.VLRNOTAFISCAL > 0 '+
                     '   AND L.NUMNFINI  = NFR.NUMNF '+
                     '   AND NFR.IDNFRECEBDEVOL = IT.IDNFRECEBDEVOL '+
                     '   AND IT.QTDERECEBDEVOL > 0 '+
                     '   AND IT.VLRUNITARIO > 0 '+
                     '   AND L.IdNFLivro = LD.IdNFLivro '+
                     '   AND (SUBSTR(IT.CODARTIGO,1,6) = P.CODPRODUTO) '+
                     '   AND IT.IDITENSRECDEV = A.IDITENSRECDEV(+) '+
                     '   AND L.DataEntradaNF BETWEEN TO_DATE('+quotedStr(Dataini)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedstr(DataFim)+ ',  ''DD/MM/YYYY'') ';


             cds.Data := GetDataPacket(Ssql);
             Result   := cds.Data;
           end;
      end;
    end;

end;





function TCtrlConvICMS5795.BuscaCNPJForCli(CodForCli: Integer): String;
Var
  Ssql : string;
begin
  with _Cds do
    Begin
      Ssql := 'SELECT P.NUMDOCUMENTO FROM PESSOA P '+
              ' WHERE P.IDPESSOA = '+intTostr(CodForCli);
      Data := GetDataPacket(Ssql);
      Result := fieldByname('NUMDOCUMENTO').Asstring;
    end;
end;

function TCtrlConvICMS5795.BuscaValorDesconto(Identificador,
                                              CodigoAgre: Integer): string;
Var
  Ssql : string;
begin
  with _Cds do
    Begin
      Ssql := 'SELECT  A.IDAGRITENSRECDEV, A.IDITENSRECDEV, SUM(A.VLRAGREGADO) AS VALDESCONTO '+
              '  FROM agritensrecdev A, TIPOAGRE B '+
              ' WHERE A.IDITENSRECDEV = '+IntToStr(Identificador)+' '+
              '   AND A.CODTIPOCUSTAGREG = '+IntToStr(CodigoAgre)+' '+
              '   AND A.CODTIPOCUSTAGREG = B.CODTIPOCUSTAGREG '+
              '   AND B.CODTRATFISCE = '+quotedStr('6') + ' '+
              ' GROUP BY A.IDITENSRECDEV, A.IDAGRITENSRECDEV ';
      Data := GetDataPacket(Ssql);        
      Result := fieldByname('VALDESCONTO').asstring;
    end;

end;

function TCtrlConvICMS5795.BuscaValorICMS(Identificador,
                                          CodigoAgre: Integer): string;
Var
  Ssql : string;
begin
  with _Cds do
    Begin
      Ssql := 'SELECT  A.IDAGRITENSRECDEV, A.IDITENSRECDEV, SUM(A.BASECALCULO) AS ICMS '+
              '  FROM agritensrecdev A, TIPOAGRE B '+
              ' WHERE A.IDITENSRECDEV = '+IntToStr(Identificador)+' '+
              '   AND A.CODTIPOCUSTAGREG = '+IntToStr(CodigoAgre)+' '+
              '   AND A.CODTIPOCUSTAGREG = B.CODTIPOCUSTAGREG '+
              '   AND B.CODTIPOCUSTAGREG = '+quotedStr('6') + ' '+
              '   AND B.CODTRATFISCE = '+quotedstr('2') +' '+
              ' GROUP BY A.IDITENSRECDEV, A.IDAGRITENSRECDEV';
      Data := GetDataPacket(Ssql);
      Result := fieldByname('ICMS').Asstring;
    end;
end;

function TCtrlConvICMS5795.BuscaValorICMSSubst(Identificador,
                                               CodigoAgre: Integer): string;
Var
  Ssql : string;
begin
  with _Cds do
    Begin
      Ssql := 'SELECT A.IDAGRITENSRECDEV, A.IDITENSRECDEV, SUM(A.BASECALCULO) AS ICMSSUBTRIBUTARIA '+
              '  FROM agritensrecdev A, TIPOAGRE B '+
              ' WHERE A.IDITENSRECDEV = '+IntToStr(Identificador)+' '+
              '   AND A.CODTIPOCUSTAGREG = '+IntToStr(CodigoAgre)+' '+
              '   AND A.CODTIPOCUSTAGREG = B.CODTIPOCUSTAGREG '+
              '   AND B.CODTIPOCUSTAGREG = '+quotedStr('25') + ' ' +
              '   AND B.CODTRATFISCE = '+quotedStr('2') + ' ' +
              ' GROUP BY A.IDITENSRECDEV, A.IDAGRITENSRECDEV ';
      Data := GetDataPacket(Ssql);
      Result := fieldByname('ICMSSUBTRIBUTARIA').Asstring;
    end;
end;

function TCtrlConvICMS5795.BuscaPercICMSTribut(IdPessoa: Integer): real;
Var
  Ssql : string;
begin
  with _Cds do
    Begin
      Ssql := 'SELECT PERCICMSSUBSTTRIB '+
              '  FROM PARAMLIVRO '+
              ' WHERE IDPESSOA = '+IntToStr(IdPessoa);
      Data := GetDataPacket(Ssql);
      result := fieldByname('PERCICMSSUBSTTRIB').AsFloat;
    end;
end;

function TCtrlConvICMS5795.ListaCodigos(TipoReg: string): String;
Var
  Lista, Ssql : string;
begin
 Lista := '';
 with _Cds do
   Begin
     Ssql := 'SELECT CODMODELO '+
             '  FROM MODELONF '+
             ' WHERE NUMSINTEGRA = '+quotedStr(TipoReg)+' ';
     Data := GetDataPacket(Ssql);
     first;
     while not eof do
       Begin
         Lista := Lista + quotedstr(fieldByname('CODMODELO').AsString);
         next;
         if not eof then
            Lista := Lista + ', ';
       end;
     if trim(Lista) <> '' then
       result := Lista
     else
       result := quotedStr('-1');
   end;
end;

procedure TCtrlConvICMS5795.OnCreateAppServer;
begin
  inherited;

end;

function TCtrlConvICMS5795.strZero(TamanhoTexto: Integer;
  Texto: String): String;
var
  numzeros : integer;
  f        : integer;
  zeros    : string;
begin
  zeros := '';
  numzeros := tamanhoTexto - length(texto);

  for f := 1 to numzeros do
    zeros := zeros + '0';

  result := zeros + texto;
end;

function TCtrlConvICMS5795.strEspaco(TamanhoTexto: Integer;
  Texto: string): string;
var
  numEspacos : integer;
  f          : integer;
  Espacos    : string;
begin
  Espacos := '';
  numEspacos := tamanhoTexto - length(texto);

  for f := 1 to numEspacos do
    Espacos := Espacos + ' ';

  result := texto + Espacos;
end;

function TCtrlConvICMS5795.Zerodireita(TamanhoTexto: integer;
  texto: String): string;
var
  numzeros : integer;
  f        : integer;
  zeros    : string;
begin
  zeros := '';
  numzeros := tamanhoTexto - length(texto);

  for f := 1 to numzeros do
    zeros := zeros + '0';

  result := texto + zeros;
end;

function TCtrlConvICMS5795.RemoveAcentos(str: string): string;
Const ComAcento = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸¿¬ ‘€√’¡…Õ”⁄«‹';
      SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
Var
x : Integer;
Begin
For x := 1 to Length(Str) do
    Begin
    if Pos(Str[x],ComAcento)<>0 Then
       begin
       Str[x] := SemAcento[Pos(Str[x],ComAcento)];
       end;
    end;
Result := Str;
end;

function TCtrlConvICMS5795.FormataVAlor(NumeroCasas: integer;
  valor: string): string;
Var
 i, b, flag : integer;
 Resultado, left, rigth : string;
 TemVirgula : Boolean;
begin
  left      := '';
  rigth     := '';
  resultado := '';
  flag := 0;
  if Trim(Valor) <> '' then
    Begin
      //formatar strings que tenham . e , ao mesmo tempo
      TemVirgula := False;
      for i := length(valor) downto 0 do
        Begin
          if valor[i] = ',' then
             TemVirgula := True;

          if TemVirgula and (Valor[i] = '.')  then
             delete(valor, i, 1);
        end;

      for i := 1 to length(valor) do
        Begin
          if (valor[i] = ',') xor (valor[i] = '.') then
            Begin
              for b := i + 1 to length(valor) do
               rigth := rigth + Valor[b];
              flag  := 1;
            end
          else if flag = 0 then
            left  := Left + valor[i];
        end;
    end;
    result := strZero((NumeroCasas - 2), left) + Zerodireita(2, copy(rigth, 1, 2))
end;

function TCtrlConvICMS5795.DiasNoMes(AYear, AMonth: Integer): Integer;
const
DaysInMonth: array[1..12] of Integer = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
if AMonth = 2 then
   begin
   if Ayear mod 4 = 0 then
      begin
      Inc(DaysInMonth[AMonth]);
      end;
   end;
Result := DaysInMonth[AMonth];
end;

end.


