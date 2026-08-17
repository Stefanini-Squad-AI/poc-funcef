unit uCtrlFSRF6895;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCtrlTerceiros, uCtrlTipoAltxImpostos, uCtrlConvICMS5795;
  Type
    TCtrlFSRF6895 = Class(TCmControlObject)

    private
      cdsFuncao,
      CdsItensNF, cdsImpostoItem,
      cdsImpostoNF, cdsAltxImposto : TClientDataSet;
      Terceiros : TCtrlTerceiros;
      convICMS : TCtrlConvICMS5795;
      TipoAltxImpostos : TCtrlTipoAltxImpostos;
    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;override;
    public
      Constructor Create; Override;
      Destructor Destroy; Override;
      {Faz e retorna um GetDataPacket para o número passado
       1 - Lançamentos contábeis
       2 - Saldos mensais
       3 - Contas a Receber
       4 - Dados mestre de mercadoria
       5 - Itens da nota
       6 - arquivo de dados mestre de serviço (saida)
       7 - arquivo de dados dos itens de serviço (saidas)
       8 - controle de estoque
       9 - inventário
       }
      function MontaSelect(cds: TClientDataSet; TipoRegistro: Byte; DataIni, DataFim : TdateTime; IdPessoa, idHotel : integer; Exercicio, Periodo, IdCpf : string; VetCodigos : Array of integer) : OleVariant;
      {Lista o conteúdo da tabela situaçãotribTabb}
      Function ListSituacaoTrib : OleVariant;
      {Busca o CPF do fornecedor}
      function BuscaCPFForCli(CodForCli, IdDocumento : LongInt) : String; //busca o cpf do cliente/fornecedor
      {Busca o CNPJ do fornecedor}
      function BuscaCNPJForCli(CodForCli : LongInt) : string;//busca o cnpj do cluente/fornecedor
      function ContaAnaliticaEstoque(cds: TClientDataSet; idPessoa : integer) : string;
      function BuscaCodNatureza(IdNatureza : string) : string;
      {Pega o valo de ICMS e de ICMS de substituição tributária
       Se o Paramêtro ICMSSUBST for verdadeiro retornará ICMS de
       substituiçào tributária, senão retornará ICMS}
      function BuscaValorICMS(Identificador, CodigoAgre : Longint; ICMSSubst : Boolean) : OleVariant;
      {Lista as unidades de medida - Almoxarifado - Compras - Igor}
      function ListUnidadeMedida : OleVariant;
      {Lista as unidades de negócio - Igor}
      function ListUnidadeNegocio : OleVariant;
      {Lista os tipos de movimentação - Igor}
      function ListTipoMov : OleVariant;
      {Lista os centros de custo}
      function ListCentCust : OleVariant;
      {Lista histórico padrão}
      function ListHistoricoPadrao : OleVariant;
      {Lista os tipos de documento do CAP - CAP}
      function ListTipoDocAgrupado : OleVariant;
      {Lista os tipos de débito e crédito do hotel}
      function ListTipoCredDebHotel : OleVariant;
      {Lista os tipos de débito e crédito}
      function ListTipoDebCred : OleVariant;
      {Listas os produtos}
      function ListProdutos : OleVariant;
      {retorna o valor dos impostos passados por referência}
      procedure Pegaimpostos(var sVlrIcmsSubst, sVlrIpi, sVlrDifIcms, sIcmsAntecipado, sAliquota, sBase, sValorImp : string; IdNFRecebDevol : longInt);
      function OraNumero(rNumero : Double ):string;
      function ArrumaId(VetCodigos : Array of integer) : String;
      function FormataVAlor(NumeroCasas : integer; valor : string) : string;
      function BuscaValorNotaporConta(IdConta, IdHotel, IdEmpresa : LongInt) : OleVariant;
      function BuscaValorNotaporNumero(NumNotaRegime, IdHotel, IdEmpresa : LongInt) : OleVariant;
      function ListItensporContaVHF(idHotel, IdEmpresa : LongInt; VetIdConta : Array of integer) : OleVariant;
      function ListItensporNumeroVHF(IdHotel, IdEmpresa : LongInt; VetNumeroNota : array of integer) : OleVariant;


    protected

    End;


implementation

{ TCtrlFSRF6895 }

procedure TCtrlFSRF6895.AfterInitialize;
begin
  inherited;
  Terceiros.InitializeAs(self);
  TipoAltxImpostos.InitializeAs(Self);
  convICMS.InitializeAs(self);
end;

function TCtrlFSRF6895.ArrumaId(VetCodigos: array of integer): String;
Var
  sTexto : string;
  i : integer;
begin
  sTexto := '';
  for i := 0 to length(VetCodigos) - 1 do
    if (i = 0) then
       sTexto := intTostr(Vetcodigos[i])
    else if (VetCodigos[i] > 0) and (trim(sTexto) <> '') then
       sTexto := sTexto + ', ' + intTostr(Vetcodigos[i]);

    if Trim(sTexto) = '' then
      Result := '-1'
    else
      Result := sTexto;
end;

function TCtrlFSRF6895.BuscaCNPJForCli(CodForCli : LongInt) : string;
Var
  Ssql : string;
begin
  with _Cds do
    Begin
      Ssql := 'SELECT NUMDOCUMENTO '+
              '  FROM PESSOA '+
              ' WHERE IDPESSOA = '+ intTostr(CodForCli); 
      Data := GetDataPacket(Ssql);
      Result := fieldByname('NUMDOCUMENTO').Asstring;
    end;
end;

function TCtrlFSRF6895.BuscaCodNatureza(IdNatureza: string): string;
Var
  Ssql : string;
begin
  with _Cds do
    Begin
      Ssql := 'SELECT CODNATUREZA '+
              '  FROM NATUREZAESTOQUE '+
              ' WHERE IDNATUREZAESTOQUE = '+quotedStr(IdNatureza)+' ';
      _Cds.data := GetDataPacket(Ssql);        
      result := fieldByname('CODNATUREZA').Asstring;
    end;
end;

function TCtrlFSRF6895.BuscaCPFForCli(CodForCli, IdDocumento : Integer): String;
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

function TCtrlFSRF6895.BuscaValorICMS(Identificador, CodigoAgre: Integer; ICMSSubst: Boolean) : OleVariant;
Var
  Ssql : string;
begin
  if ICMSSubst then
    Begin
      Ssql := 'SELECT A.IDAGRITENSRECDEV, A.IDITENSRECDEV, SUM(A.BASECALCULO) AS BaseICMSSUBTRIBUTARIA, SUM(A.VLRAGREGADO) AS ICMSSUBTRIBUTARIA, SUM(A.ALIQUOTA) AS ALIQUOTA '+
              '  FROM agritensrecdev A, TIPOAGRE B '+
              ' WHERE A.IDITENSRECDEV = '+IntToStr(Identificador)+' '+
              '   AND A.CODTIPOCUSTAGREG = '+IntToStr(CodigoAgre)+' '+
              '   AND A.CODTIPOCUSTAGREG = B.CODTIPOCUSTAGREG '+
              '   AND B.CODTIPOCUSTAGREG = '+quotedStr('25') +' '+
              '   AND B.CODTRATFISCE = '+quotedStr('2') + ' '+
              ' GROUP BY A.IDITENSRECDEV, A.IDAGRITENSRECDEV ';
    end
  else
    Begin
      Ssql := 'SELECT  A.IDAGRITENSRECDEV, A.IDITENSRECDEV, SUM(A.BASECALCULO) AS BaseICMS, SUM(A.VLRAGREGADO) AS ICMS, SUM(A.ALIQUOTA) AS ALIQUOTA '+
              '  FROM agritensrecdev A, TIPOAGRE B '+
              ' WHERE A.IDITENSRECDEV = '+intTostr(Identificador)+' '+
              '   AND A.CODTIPOCUSTAGREG = '+intTostr(CodigoAgre)+' '+
              '   AND A.CODTIPOCUSTAGREG = B.CODTIPOCUSTAGREG '+
              '   AND B.CODTIPOCUSTAGREG = '+quotedStr('6') + ' '+
              '   AND B.CODTRATFISCE = '+quotedstr('2') + ' ' +
              ' GROUP BY A.IDITENSRECDEV, A.IDAGRITENSRECDEV ';
    end;
  Result := GetDataPacket(Ssql);
end;


function TCtrlFSRF6895.BuscaValorNotaporConta(IdConta, IdHotel,
                                              IdEmpresa: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT (SUM(L.VLRLANCAMENTO) * 100) AS VALORCONTABIL ' +
          '  FROM LANCAMENTOSFRONT L, IMPOSXTIPODCHOTEL I, PARAMLIVRO P ' +
          ' WHERE (L.IDCONTA = '+intTostr(IdConta)+') ' +
          '   AND (I.IDHOTEL = '+intTostr(IdHotel)+') ' +
          '   AND (P.IDPESSOA = '+intTostr(IdEmpresa)+') ' +
          '   AND (I.IDTIPODEBCRED = L.IDTIPODEBCRED) ' +
          '   AND (I.IDIMPOSTO = P.IDISSHOTEL) ' +
          '   AND (L.NUMNOTAREGIME IS NULL) ' +
          ' GROUP BY L.NUMERONOTA, I.PERCENTUAL, P.IDISSHOTEL';
  Result := GetDataPacket(Ssql);

end;

function TCtrlFSRF6895.BuscaValorNotaporNumero(NumNotaRegime, IdHotel,
  IdEmpresa: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT (SUM(L.VLRLANCAMENTO) * 100) AS VALORCONTABIL ' +
          '  FROM LANCAMENTOSFRONT L, IMPOSXTIPODCHOTEL I, PARAMLIVRO P ' +
          ' WHERE (L.NUMNOTAREGIME = '+IntTostr(NumNotaRegime)+') '+
          '   AND (I.IDHOTEL = '+IntTostr(IdHotel)+') ' +
          '   AND (P.IDPESSOA = '+IntTostr(IdEmpresa)+') ' +
          '   AND (I.IDTIPODEBCRED = L.IDTIPODEBCRED) ' +
          '   AND (I.IDIMPOSTO = P.IDISSHOTEL) ' +
          ' GROUP BY L.NUMNOTAREGIME, I.PERCENTUAL, P.IDISSHOTEL ';
  result := GetDataPacket(Ssql);
end;

function TCtrlFSRF6895.ContaAnaliticaEstoque(cds: TClientDataSet; idPessoa : integer) : string;
Var
  Ssql : string;
begin

Result := '';

Ssql := 'SELECT CONTAENTRADA,CONTASAIDA,SUBCONTAENTRADA,SUBCONTASAIDA,UNIDNEGOC FROM ARTXCONTAXCC WHERE '+
        '(RTRIM(CODARTIGO) = '''+trim(cds.fieldByName('CODARTIGO').AsString)+''') AND (IDPESSOA = '
        +IntToStr(idPessoa)+')'+ ' AND (RTRIM(CODCENTROCUSTO) = '''
        +trim(cds.FieldByName('CODCENTROCUSTO').AsString)+''')'+
        ' AND (CODALMOXARIFADO = '+cds.FieldByName('CODALMOXARIFADO').AsString+')';
_Cds.data := GetDataPacket(Ssql);
 if _Cds.IsEmpty then
    Begin

      Ssql :='SELECT CONTAENTRADA,CONTASAIDA,SUBCONTAENTRADA,SUBCONTASAIDA,UNIDNEGOC FROM ARTXCONTAXCC WHERE '+
             '(RTRIM(CODARTIGO) = '''+trim(cds.fieldByName('CODARTIGO').AsString)+''') AND (IDPESSOA = '
             +IntToStr(idPessoa)+')'+ ' AND (RTRIM(CODCENTROCUSTO) = '''+trim(cds.FieldByName('CODCENTROCUSTO').AsString)+''')'+
             ' AND (CODALMOXARIFADO IS NULL) ';
       _Cds.Data := GetDataPacket(Ssql);
       //
      if _Cds.IsEmpty then
         Begin

           Ssql := 'SELECT CONTAENTRADA,CONTASAIDA,SUBCONTAENTRADA,SUBCONTASAIDA,UNIDNEGOC FROM ARTXCONTAXCC WHERE '+
                            '(RTRIM(CODARTIGO) = '''+trim(cds.fieldByName('CODARTIGO').AsString)+''') AND (IDPESSOA = '
                            +IntToStr(idPessoa)+')'+ ' AND (CODALMOXARIFADO = '+cds.FieldByName('CODALMOXARIFADO').AsString+')'+
                            ' AND (CODCENTROCUSTO IS NULL) ';
           _Cds.Data := GetDataPacket(Ssql);
           if _Cds.IsEmpty then
              Begin
                Ssql := 'SELECT CONTAENTRADA,CONTASAIDA,SUBCONTAENTRADA,SUBCONTASAIDA,UNIDNEGOC FROM ARTXCONTAXCC WHERE '+
                                 '(RTRIM(CODARTIGO) ='''+trim(cds.fieldByName('CODARTIGO').AsString)+''') AND (IDPESSOA ='
                                 +IntToStr(idPessoa)+')';

                if _Cds.IsEmpty then
                   Begin
                     Ssql :='SELECT CODGRUPOPROD FROM PRODUTO WHERE '+
                                            '(RTRIM(CODPRODUTO) = '''+trim(copy(cds.fieldByName('CODARTIGO').AsString,1,6))+''')';
                     cdsFuncao.data := GetDataPacket(Ssql);
                     //
                     Ssql :='SELECT CONTAENTRADA,CONTASAIDA,SUBCONTAENTRADA,SUBCONTASAIDA,UNIDNEGOC FROM ARTXCONTAXCC WHERE '+
                                      '(RTRIM(CODGRUPOPROD) = '''+trim(cdsFuncao.fieldByName('CODGRUPOPROD').AsString)+''') AND (IDPESSOA = '+
                                      IntToStr(idPessoa)+') '+ ' AND (RTRIM(CODCENTROCUSTO) = '''+trim(cds.FieldByName('CODCENTROCUSTO').AsString)+''')'+
                                      ' AND (CODALMOXARIFADO =' +cds.FieldByName('CODALMOXARIFADO').AsString+')';
                     _cds.Data := GetDataPacket(Ssql);
                     //
                     if _Cds.IsEmpty then
                        Begin
                          //
                          Ssql := 'SELECT CONTAENTRADA,CONTASAIDA,SUBCONTAENTRADA,SUBCONTASAIDA,UNIDNEGOC FROM ARTXCONTAXCC WHERE '+
                                           '(RTRIM(CODGRUPOPROD) = '''+trim(cdsFuncao.fieldByName('CODGRUPOPROD').AsString)+''') AND (IDPESSOA = '+
                                           IntToStr(idPessoa)+') '+ ' AND (RTRIM(CODCENTROCUSTO) = '''+trim(cds.FieldByName('CODCENTROCUSTO').AsString)+''')'+
                                           ' AND (CODALMOXARIFADO IS NULL)';
                          _Cds.data := GetDataPacket(Ssql);
                          if _Cds.IsEmpty then
                             Begin
                               Ssql :='SELECT CONTAENTRADA,CONTASAIDA,SUBCONTAENTRADA,SUBCONTASAIDA,UNIDNEGOC FROM ARTXCONTAXCC WHERE '+
                                                '(RTRIM(CODGRUPOPROD) = '''+trim(cdsFuncao.fieldByName('CODGRUPOPROD').AsString)+''') AND (IDPESSOA = '
                                                +IntToStr(idPessoa)+') '+ ' AND (CODCENTROCUSTO IS NULL)'+ ' AND (CODALMOXARIFADO = '+cds.FieldByName('CODALMOXARIFADO').AsString+')';
                                _Cds.Data := GetDataPacket(Ssql);
                                if _Cds.IsEmpty then
                                   Begin
                                     Ssql :='SELECT CONTAENTRADA,CONTASAIDA,SUBCONTAENTRADA,SUBCONTASAIDA,UNIDNEGOC FROM ARTXCONTAXCC WHERE '+
                                                      '(RTRIM(CODGRUPOPROD) = '''+trim(cdsFuncao.fieldByName('CODGRUPOPROD').AsString)+''') AND (IDPESSOA = '
                                                      +IntToStr(idPessoa)+')';
                                     _Cds.data := GetDataPacket(Ssql);

                                     result := _Cds.fieldByname('CONTAENTRADA').Asstring; //conta analitica de estoque
                                   end;
                             end;
                        end;
                   end;
              end;
         end;
    end;
end;

constructor TCtrlFSRF6895.Create;
begin
  inherited;
  cdsFuncao        := TClientDataSet.Create(nil);
  CdsItensNF       := TclientDataSet.create(nil);
  cdsImpostoItem   := TclientDataSet.create(nil);
  cdsImpostoNF     := TclientDataSet.create(nil);
  cdsAltxImposto   := TclientDataset.create(nil);
  Terceiros        := TCtrlTerceiros.create;
  TipoAltxImpostos := TCtrlTipoAltxImpostos.create;
  ConvICMS         := TCtrlConvICMS5795.Create;
end;

destructor TCtrlFSRF6895.Destroy;
begin
  inherited;
  cdsFuncao.free;
  CdsItensNF.free;
  cdsImpostoItem.free;
  cdsImpostoNF.free;
  cdsAltxImposto.free;
  Terceiros.Free;
  TipoAltxImpostos.free;
  convICMS.Free;
end;

procedure TCtrlFSRF6895.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlFSRF6895.FormataVAlor(NumeroCasas: integer;
  valor: string): string;
Var
 i, b, flag : integer;
 Resultado, left, rigth : string;
begin
  left      := '';
  rigth     := '';
  resultado := '';
  flag := 0;
  for i := 1 to length(valor) do
    Begin
      if (valor[i] = ',') or (valor[i] = '.') then
        Begin
          for b := i + 1 to length(valor) do
           rigth := rigth + Valor[b];
          flag  := 1;
        end
      else if flag = 0 then
        left  := Left + valor[i];
    end;
    result := convICMS.strZero((NumeroCasas - 2), left) + convICMS.Zerodireita(2, copy(rigth, 1, 2))
end;

function TCtrlFSRF6895.ListCentCust: OleVariant;
Var
  Ssql : string;
begin
  Ssql :=  'SELECT CODCENTROCUSTO, NOME, ROWNUM, TO_CHAR(SYSDATE,''DDMMYYYY'') AS DATA FROM CENTCUST '+
           ' GROUP BY CODCENTROCUSTO, NOME, ROWNUM ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlFSRF6895.ListHistoricoPadrao: OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT HITCODHIST, HITDESCR1, ROWNUM, TO_CHAR(SYSDATE,''DDMMYYYY'') AS DATA FROM HISTOPADRAO '+
          ' GROUP BY HITCODHIST, HITDESCR1, ROWNUM ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlFSRF6895.ListItensporContaVHF(idHotel,
                                            IdEmpresa: Integer; VetIdConta : Array of integer): OleVariant;
Var
 Ssql : string;
begin
  Ssql := 'SELECT L.NUMERONOTA, (I.PERCENTUAL * 100) AS ALIQUOTA, P.IDISSHOTEL, ' +
          '       (L.VLRLANCAMENTO * I.BASE/100) AS BASECALCULO, L.CODARTIGO, ' +
          '       ((L.VLRLANCAMENTO * I.BASE/100)*(I.PERCENTUAL/100)) AS VALORIMPOSTO, ' +
          '       L.VLRLANCAMENTO  AS VALORCONTABIL, N.SERIE, TO_CHAR(N.DATAEMISSAO,''DDMMYYYY'') AS DATAEMISSAO ' +
          '  FROM LANCAMENTOSFRONT L, IMPOSXTIPODCHOTEL I, PARAMLIVRO P, NOTAFRONT N ' +
          ' WHERE (L.IDCONTA in ('+ArrumaId(VetIdConta)+')) ' +
          '   AND (L.IDCONTA = N.IDCONTA) '+
          '   AND (I.IDHOTEL = '+intTostr(IdHotel)+') ' +
          '   AND (P.IDPESSOA = '+intTostr(IdEmpresa)+') ' +
          '   AND (I.IDTIPODEBCRED = L.IDTIPODEBCRED) ' +
          '   AND (I.IDIMPOSTO = P.IDISSHOTEL) ' +
          '   AND (L.NUMNOTAREGIME IS NULL) ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlFSRF6895.ListItensporNumeroVHF(IdHotel,
                                            IdEmpresa: LongInt; VetNumeroNota : array of integer): OleVariant;
Var
 Ssql : string;
begin
  Ssql := 'SELECT L.NUMNOTAREGIME, I.PERCENTUAL AS ALIQUOTA, ' +
          '       P.IDISSHOTEL, (L.VLRLANCAMENTO * I.BASE/100) AS BASECALCULO, L.CODARTIGO, ' +
          '       ((L.VLRLANCAMENTO * I.BASE/100)*(I.PERCENTUAL/100)) AS VALORIMPOSTO, ' +
          '       L.VLRLANCAMENTO AS VALORCONTABIL, N.SERIE, TO_CHAR(N.DATAEMISSAO,''DDMMYYYY'') AS DATAEMISSAO ' +
          '  FROM LANCAMENTOSFRONT L, IMPOSXTIPODCHOTEL I, PARAMLIVRO P, NOTAFRONT N ' +
          ' WHERE (L.NUMNOTAREGIME in ('+ ArrumaId(VetNumeroNota)+')) '+
          '   AND (L.NUMNOTAREGIME = N.NUMERONOTA) '+
          '   AND (I.IDHOTEL = '+IntTostr(IdHotel)+') ' +
          '   AND (P.IDPESSOA = '+IntTostr(IdEmpresa)+') ' +
          '   AND (I.IDTIPODEBCRED = L.IDTIPODEBCRED) ' +
          '   AND (I.IDIMPOSTO = P.IDISSHOTEL) ';
  result := GetDataPacket(Ssql);
end;

function TCtrlFSRF6895.ListProdutos: OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT CODPRODUTO, DESCPROD, ROWNUM, TO_CHAR(SYSDATE,''DDMMYYYY'') AS DATA FROM PRODUTO '+
          ' GROUP BY CODPRODUTO, DESCPROD, ROWNUM ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlFSRF6895.ListSituacaoTrib: OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT SITUACAOTRIB, DESCSITUACAOTRIB, ROWNUM, TO_CHAR(SYSDATE,''DDMMYYYY'')  AS DATA FROM SITUACAOTRIBTABB '+
          ' GROUP BY SITUACAOTRIB, DESCSITUACAOTRIB, ROWNUM ';
  Result :=  GetDataPacket(Ssql);
end;

function TCtrlFSRF6895.ListTipoCredDebHotel: OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT IDTIPODEBCRED, DESCRICAO, ROWNUM, TO_CHAR(SYSDATE,''DDMMYYYY'') AS DATA FROM TIPODEBCREDHOTEL '+
          ' GROUP BY DESCRICAO, ROWNUM, IDTIPODEBCRED';
  Result := GetDataPacket(Ssql);
end;

function TCtrlFSRF6895.ListTipoDebCred: OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT DESC_DC, ROWNUM, TO_CHAR(SYSDATE,''DDMMYYYY'') AS DATA FROM TIPODC '+
          ' GROUP BY DESC_DC, COD_TIPO_DC, ROWNUM';
  Result := GetDataPacket(Ssql);
end;

function TCtrlFSRF6895.ListTipoDocAgrupado : OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT CODTIPDOC, DESCRICAO, ROWNUM, TO_CHAR(SYSDATE,''DDMMYYYY'') AS DATA FROM TIPODOCRECPAG '+
            ' GROUP BY CODTIPDOC, DESCRICAO, ROWNUM ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlFSRF6895.ListTipoMov: OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT CODTIPOMOV, DESCTIPOMOV, ROWNUM, TO_CHAR(SYSDATE,''DDMMYYYY'')  AS DATA FROM TIPOMOV '+
          ' GROUP BY CODTIPOMOV, DESCTIPOMOV, ROWNUM';
  Result := GetDataPacket(Ssql);
end;

function TCtrlFSRF6895.ListUnidadeMedida: OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT CODMEDIDA, ROWNUM, DESCMEDIDA, TO_CHAR(SYSDATE,''DDMMYYYY'')  AS DATA FROM UNMEDIDA '+
          ' GROUP BY CODMEDIDA, ROWNUM, DESCMEDIDA '+
          ' ORDER BY ROWNUM ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlFSRF6895.ListUnidadeNegocio: OleVariant;
Var
  Ssql : string;
begin
  Ssql :=  'SELECT UNIDNEGOC, NOME, ROWNUM, TO_CHAR(SYSDATE,''DDMMYYYY'')  AS DATA FROM UNIDNEGOCIO '+
           ' GROUP BY UNIDNEGOC, NOME, ROWNUM ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlFSRF6895.MontaSelect(cds: TClientDataSet; TipoRegistro: Byte; DataIni, DataFim : TdateTime; IdPessoa, idHotel : integer; Exercicio, Periodo, IdCpf : string; VetCodigos: array of integer): OleVariant;
Var
  Ssql, AnoIni, AnoFim : string;
  Dia,Mes,Ano:Word;
begin
  Ssql := '';
  Case TipoRegistro of
    1:  //Lançamentos Contabeis
      Begin
        Ssql := 'SELECT TO_CHAR(PL.PLNDATDIA,''DDMMYYYY'') AS DATALANCAMENTO, '+
                '        L.PLACONTA As CONTAANALITICA, L.PLANO, '+
                '        L.LACDEBCRE As INDICADOR, '+
                '        SUBSTR((TO_CHAR(L.PLNCODIGO) || TO_CHAR(LACNUMLAN)),1, 12) AS ARQUIVAMENTO, '+
                '        ROUND((L.LACVALOR*100),0) As VALOR, '+
                '        L.CODCENTROCUSTO As CENTROCUSTO, '+
                '        L.LACNUMLAN AS NUMLANCAMENTO, '+
                '        L.LACHIST1 || ''  '' || LACHIST2 || '' '' || LACHIST3 || '' '' || LACHIST4 || '' '' || LACHIST5  AS HISTORICO, '+
                '        P.PLACONTRAPARTIDA  '+
                '  FROM  LANCAMENTO L, PLANILHA PL, PLANOCONTA P'+
                ' WHERE (PL.IDPESSOA = '+intTostr(IdPessoa)+') '+
                '   AND (PL.PEREXERCICIO = '+Exercicio+') '+
                '   AND (PL.PERNUMERO = '+Periodo+') '+
                '   AND (L.PLNCODIGO = PL.PLNCODIGO) '+
                '   AND (L.LACVALOR <> 0) '+
                '   AND (L.PLANO = P.PLANO) '+
                '   AND (L.PLACONTA = P.PLACONTA) ';
        Result := GetDataPacket(Ssql);
      end;
    2:  // Saldos Mensais
      Begin
        Ssql := 'SELECT U.PLACONTA AS CONTAANALITICA, TO_CHAR(U.PERDATFIM,''DDMMYYYY'') AS DATASALDOINICIAL, '+
                '       ROUND(ABS(SUM(NVL(U.SALDOANTERIOR,0)*100)),0) AS SALDOINICIAL, '+
                '       DECODE(SIGN(SUM(NVL(U.SALDOANTERIOR,0))),1,''D'',''C'') AS INDICADORINICIAL, '+
                '       ROUND(ABS(SUM(NVL(U.SALDOATUAL,0)*100)),0) AS SALDOFINAL, U.PLACONTA, '+
                '       DECODE(SIGN(SUM(NVL(U.SALDOATUAL,0))),1,''D'',''C'') AS INDICADORFINAL, '+
                '       ROUND(SUM(NVL(U.CRED,0)*100),0) AS TOTALCRED, '+
                '       ROUND(SUM(NVL(U.DEB,0)*100),0) AS TOTALDEB  '+
                '  FROM ((SELECT PL.PLACONTA, PL.PLANO, P.PERDATFIM, 0 AS SALDOANTERIOR, '+
                '                SUM(NVL(PL.PLSDEBITOCORRENTE,0)-NVL(PL.PLSCREDITOCOR,0)) AS SALDOATUAL, '+
                '                0 AS DEB, 0 AS CRED '+
                '           FROM PLANOSALDO PL, '+
                '                (SELECT PERDATFIM FROM PERIODO '+
                '                  WHERE (PEREXERCICIO = ' + Exercicio+ ') '+
                '                    AND (IDPESSOA = ' + IntToStr(IdPessoa) + ') '+
                '                    AND (PERNUMERO = ' +Periodo+ ')) P '+
                '          WHERE (PL.PEREXERCICIO = ' + Exercicio + ') '+
                '            AND ((PL.PERNUMERO <= ' +Periodo+ ') OR (PERNUMERO IS NULL)) '+
                '            AND (PL.IDPESSOA = ' + IntToStr(IdPessoa) + ') '+
                '          GROUP BY PLANO,PLACONTA, PERDATFIM ) '+
                ' UNION ALL '+
                '      (SELECT PL.PLACONTA, PL.PLANO, '+
                '              P.PERDATFIM, 0 AS SALDOANTERIOR, 0 AS SALDOATUAL, SUM(NVL(PL.PLSDEBITOCORRENTE,0)) AS DEB, '+
                '              SUM(NVL(PL.PLSCREDITOCOR,0)) AS CRED '+
                '         FROM PLANOSALDO PL, PERIODO P       '+
                '        WHERE (PL.PEREXERCICIO = ' + Exercicio + ') '+
                '          AND (PL.PERNUMERO = ' + Periodo + ') '+
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
                '                WHERE (PEREXERCICIO = ' + Exercicio + ') '+
                '                  AND (IDPESSOA = ' + IntToStr(IdPessoa) + ') '+
                '                  AND (PERNUMERO = ' +Periodo+ ')) P '+
                '        WHERE (PL.PEREXERCICIO = ' + Exercicio + ') '+
                '          AND ((PL.PERNUMERO < ' +Periodo+ ') OR (PERNUMERO IS NULL)) '+
                '          AND (PL.IDPESSOA = ' + IntToStr(IdPessoa) + ') '+
                '        GROUP BY PLANO,PLACONTA, PERDATFIM )) U '+
                ' GROUP BY U.PLACONTA,U.PLANO,U.PERDATFIM '+
                ' ORDER BY U.PLACONTA ';
        Result := GetDataPacket(Ssql);
      end;
    3:     //Contas a Receber
      Begin
        Ssql := 'SELECT TO_CHAR(L.DATALANCTO,''DDMMYYYY'')  AS DATALANCTO, L.UNIDNEGOC, L.VALOR, L.DEBCRE, L.CODTIPDOC, D.NODOCUMENTO, '+
                '       TO_CHAR(D.DATAVENCTO,''DDMMYYYY'')  AS DATAVENCTO, TO_CHAR(D.DATAEMISSAO,''DDMMYYYY'')  AS DATAEMISSAO, D.NODOCUMENTO, D.COMPLDOCUMENTO, D.IDFORCLI '+
                '  FROM DOCUMENTO D, LANCTODOCUM L '+
                ' WHERE D.IDPESSOA = '+IntToStr(IdPessoa)+' '+
                '   AND L.DATALANCTO >= '+QuotedStr(DateTostr(DataIni))+' '+
                '   AND L.DATALANCTO <= '+QuotedStr(DateToStr(DataFim))+' '+
                '   AND L.CODDOCUMENTO = D.CODDOCUMENTO ';
        Result := GetDataPacket(Ssql);
      end;
    4:  //dados mestre de mercadoria/serviços - Notas de Saída ou de entrada Emitidas pela pessoa juridica
        //pegar do almoxerifado
      Begin
        Ssql := 'SELECT NF.NUMNF, TO_CHAR(NF.DATAEMISNF,''DDMMYYYY'')  AS DATAEMISNF, NF.IDFORCLI, NF.VLRNOTAFISCAL, TO_CHAR(NF.DATAENTDEVOL,''DDMMYYYY'')  AS DATAENTDEVOL '+
                '  FROM NFRECEBDEVOL NF, ITENSRECEBDEVOL IT, PRODUTO P, agritensrecdev A '+
                ' WHERE NF.IDPESSOA = '+IntToStr(IdPessoa)+' '+
                '   AND NF.DATAEMISNF BETWEEN '+QuotedStr(DateTostr(DataIni))+' AND '+QuotedStr(DateToStr(DataFim))+' '+
                '   AND NF.IDNFRECEBDEVOL = IT.IDNFRECEBDEVOL '+
                '   AND IT.CODARTIGO = P.CODPRODUTO '+
                '   AND IT.IDITENSRECDEV = A.IDITENSRECDEV ';
        Result := GetDataPacket(Ssql);
      end;
    5:  // itens da nota
        //pegar do almoxarifado
      Begin
        Ssql := 'SELECT NF.NUMNF, TO_CHAR(NF.DATAEMISNF,''DDMMYYYY'')  AS DATAEMISNF, NF.IDFORCLI, IT.CODARTIGO, IT.CODCENTROCUSTO, IT.CODMEDIDA, '+
                '       IT.CODFISCAL, IT.QTDERECEBDEVOL, IT.VLRUNITARIO, (IT.QTDERECEBDEVOL * IT.VLRUNITARIO) AS VALORTOTAL, '+
                '       P.CODMEDCUSTO, P.DESCPROD, A.CODTIPOCUSTAGREG, IT.IDITENSRECDEV, IT.IDNFRECEBDEVOL, P.SITUACAOTRIB, NAT.CODNATUREZA '+
                '  FROM NFRECEBDEVOL NF, ITENSRECEBDEVOL IT, PRODUTO P, agritensrecdev A, NATUREZAESTOQUE NAT, GRUPPROD G '+
                ' WHERE NF.IDPESSOA = '+IntToStr(IdPessoa)+' '+
                '   AND NF.DATAEMISNF BETWEEN '+QuotedStr(DateTostr(DataIni))+' AND '+QuotedStr(DateToStr(DataFim))+' '+
                '   AND NF.IDNFRECEBDEVOL = IT.IDNFRECEBDEVOL '+
                '   AND IT.CODARTIGO = P.CODPRODUTO '+
                '   AND P.CODGRUPOPROD = G.CODGRUPOPROD '+
                '   AND G.IDNATUREZAESTOQUE = NAT.IDNATUREZAESTOQUE(+) '+
                '   AND IT.IDITENSRECDEV = A.IDITENSRECDEV ';
        Result := GetDataPacket(Ssql);
      end;
    6:    //ARQUIVO DE DADOS MESTRE DE SERVIÇO (SAIDA)
      Begin
        Ssql := 'SELECT U.COD_EMPRESA, U.NUM_RESERVA, U.IDPESSOA, '+
                '       U.NOMEHOSP, U.C8 AS NUMERODOCUMENTO, '+
                '       U.C9 AS SERIESUBSERIE, '+
                '       U.C11 AS DATAEMISSAO, '+
                '       U.C30 AS SITUACAONOTA, '+
                '       SUM(U.C23) AS VALORTOTAL '+
                '  FROM ( '+
                'SELECT HR.COD_EMPRESA, HR.NUM_RESERVA, C.IDPESSOA, '+
                '       RTRIM(HR.NOME_HOSP)||'' ''||RTRIM(HR.SOBRENOME_HOSP) AS NOMEHOSP, '+
                '       REPLACE(NVL(N.NOTA_INICIAL,N.NUM_NOTA), ''-'') AS C8, '+
                '       N.FLAGSERIE C9, TO_CHAR(N.DATA_NOTA,''DDMMYYYY'') AS C11, '+
                '       (0) AS C23, '+
                '       DECODE(N.DATA_CANCELAMENTO,NULL,''N'',''S'') C30 '+
                '  FROM NOTAVHL N, HEFAZRES HR, CLIENTEPESS C, FECHAMEN F '+
                ' WHERE (N.DATA_NOTA BETWEEN TO_DATE(' + QuotedStr(dateTostr(DataIni)) + ',''DD/MM/YYYY'') AND TO_DATE(' + QuotedStr(dateTostr(DataFim)) + ',''DD/MM/YYYY'')) '+
                '   AND (HR.COD_EMPRESA = C.CODCLIENTE(+))     '+
                '   AND (F.COD_FECHAMENTO = N.COD_FECHAMENTO)  '+
                '   AND (F.NUM_RESERVA = HR.NUM_RESERVA)       '+
                '   AND (N.DATA_CANCELAMENTO IS NOT NULL)      '+
                '   AND (HR.PRINCIPAL = ''True'')              '+
                ' UNION ALL '+
                ' SELECT HR.COD_EMPRESA, HR.NUM_RESERVA, C.IDPESSOA, '+
                '        RTRIM(HR.NOME_HOSP)||'' ''||RTRIM(HR.SOBRENOME_HOSP) NOMEHOSP, '+
                '       REPLACE(NVL(N.NOTA_INICIAL,N.NUM_NOTA), ''-'') AS C8, '+
                '       N.FLAGSERIE C9, TO_CHAR(N.DATA_NOTA,''DDMMYYYY'') AS C11, '+
                '       ROUND((SUM(DECODE(T.DEBITOCREDITO,''D'',L.VALOR_LANCAMENTO,(L.VALOR_LANCAMENTO*-1)))*100),0) AS C23, '+
                '       DECODE(N.DATA_CANCELAMENTO,NULL,''N'',''S'') C30 '+
                '  FROM NOTAVHL N, LANCAMENVHL L, TIPODEBCREDHOTEL T, IMPOSXTIPODCHOTEL I, '+
                '       PARAMLIVRO P, HEFAZRES HR, TIPODC TDC, CLIENTEPESS C '+
                '  WHERE (T.IDHOTEL = ' + IntToStr(IdHotel) + ') '+
                '   AND (P.IDPESSOA = ' + IntToStr(IdPessoa) + ') '+
                '   AND (N.DATA_NOTA BETWEEN TO_DATE(' + QuotedStr(dateTostr(DataIni)) + ',''DD/MM/YYYY'') AND TO_DATE(' + QuotedStr(dateTostr(DataFim)) + ',''DD/MM/YYYY'')) '+
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
                '         U.NOMEHOSP, U.C8, U.C9, U.C11, '+
                '         U.C30 '+
                ' ORDER BY NUMERODOCUMENTO ';
        Result := GetDataPacket(Ssql);
      end;
    7:  //ARQUIVO DE DADOS DOS ITENS DE SERVIÇO (SAIDAS)
      Begin
        Ssql := 'SELECT HR.COD_EMPRESA, HR.NUM_RESERVA, C.IDPESSOA, '+
                '       RTRIM(HR.NOME_HOSP)||'' ''||RTRIM(HR.SOBRENOME_HOSP) NOMEHOSP, '+
                '       TO_CHAR(N.DATA_NOTA,''DDMMYYYY'') AS DATAEMISSAO, '+
                '       L.VALOR_LANCAMENTO, '+
                '       REPLACE(NVL(N.NOTA_INICIAL,N.NUM_NOTA), ''-'') AS NUMERODOCUMENTO, '+
                '       N.FLAGSERIE AS SERIESUBSERIE, N.NOTA_INICIAL, N.NUM_NOTA, N.FLAGSERIE, '+
                '       TDC.COD_TIPO_DC AS CODSERVICO, '+
                '       ROUND(((DECODE(T.DEBITOCREDITO,''D'',L.VALOR_LANCAMENTO,(L.VALOR_LANCAMENTO*-1)))*100),0) AS VALORSERVICO, '+
                '       ROUND((I.PERCENTUAL * 100),0) AS ALIQUOTAISS, '+  //o campo no banco só tem 2 casas decimais e necessita ter 4 no arquivo
                '       ROUND((((DECODE(T.DEBITOCREDITO,''D'',L.VALOR_LANCAMENTO,(L.VALOR_LANCAMENTO*-1))*(NVL(I.BASE,0)/100)*(I.PERCENTUAL/100)))*100),0) AS VALORISS, '+
                '       ROUND((((DECODE(T.DEBITOCREDITO,''D'',L.VALOR_LANCAMENTO,(L.VALOR_LANCAMENTO*-1))*(DECODE(NVL(I.PERCENTUAL,0),0,1,NVL(I.BASE,0)/100 ))))*100),0) AS BASEISS, '+
                '       P.IDISSHOTEL '+
                '  FROM NOTAVHL N, LANCAMENVHL L, TIPODEBCREDHOTEL T, IMPOSXTIPODCHOTEL I, PARAMLIVRO P, '+
                '       HEFAZRES HR, TIPODC TDC, CLIENTEPESS C '+
                ' WHERE (T.IDHOTEL = ' + IntToStr(IdHotel) + ') '+
                '   AND (P.IDPESSOA = ' + IntToStr(IdPessoa) + ') '+
                '   AND (N.DATA_NOTA BETWEEN TO_DATE(' + QuotedStr(dateTostr(DataIni)) + ',''DD/MM/YYYY'') AND TO_DATE(' + QuotedStr(dateTostr(DataFim)) + ',''DD/MM/YYYY'')) '+
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
                ' ORDER BY N.NOTA_INICIAL, N.NUM_NOTA, N.FLAGSERIE';
        Result := GetDataPacket(Ssql);
      end;
    8:      //controle de estoque
      Begin
        Ssql := 'SELECT NAT.CODNATUREZA, A.CODALMOXARIFADO, MOV.NUMDOCUMENTO, TO_CHAR(MOV.DATAMOV, ''DDMMYYYY'') AS DATAMOV, MOV.CODARTIGO, MOV.QTDEMOV, '+
                '       (MOV.CUSTOMEDIOMOV * 10000) AS CUSTOMEDIOMOV, (MOV.VALORMOV * 100) AS VALORMOV, MOV.CODTIPOMOV, MOV.CODCENTROCUSTO, P.CODMEDCUSTO '+
                '  FROM NATUREZAESTOQUE NAT, MOVIMENT MOV, PRODUTO P, GRUPPROD G, ALMOX A '+
                ' WHERE MOV.IDPESSOA = '+IntToStr(IdPessoa)+' '+
                '   AND MOV.DATAMOV BETWEEN '+QuotedStr(DateTostr(DataIni))+' AND '+QuotedStr(DateToStr(DataFim))+' '+
                '   AND MOV.CODALMOXARIFADO = A.CODALMOXARIFADO '+
                '   AND MOV.CODARTIGO = P.CODPRODUTO '+
                '   AND P.CODGRUPOPROD = G.CODGRUPOPROD '+
                '   AND G.IDNATUREZAESTOQUE = NAT.IDNATUREZAESTOQUE(+) '+
                ' GROUP BY MOV.NUMDOCUMENTO, MOV.CUSTOMEDIOMOV, MOV.VALORMOV, NAT.CODNATUREZA, A.CODALMOXARIFADO, MOV.DATAMOV, MOV.CODARTIGO, MOV.QTDEMOV, '+
                '          MOV.CODTIPOMOV, MOV.CODCENTROCUSTO, P.CODMEDCUSTO ';
        Result :=  GetDataPacket(Ssql);
      end;
    9:          //INVENTÁRIO
      Begin
        Ssql := 'SELECT AL.CODCENTROCUSTO, AL.DESCALMOX, AR.CODARTIGO, PR.DESCPROD, PR.CODMEDCUSTO, PR.CODFISCALPADRAO, '+
                '       PR.CODGRUPOPROD, GP.DESCGRUPOPROD, MV.SALDOQTDE, GP.IDNATUREZAESTOQUE, MV.CUSTOMEDIO, '+
                '       (MV.SALDOQTDE * MV.CUSTOMEDIO) AS VALTOTAL, TO_CHAR(MV.DATAMOV, ''DDMMYYYY'') AS DATAMOV '+
                '  FROM (SELECT M.IDMOV, M.DATAMOV, M.CODARTIGO, M.SALDOQTDEMOV AS SALDOQTDE, M.CUSTOMEDIOMOV AS CUSTOMEDIO, '+
                '               M.CODALMOXARIFADO, M.IDPESSOA '+
                '          FROM MOVIMENT M, (SELECT M.CODARTIGO, MAX(M.IDMOV) AS IDMOV '+
                '                              FROM MOVIMENT M, (SELECT CODARTIGO, MAX(DATAMOV) AS MAXDATAMOV '+
                '                                                  FROM MOVIMENT '+
                '                                                 WHERE  (DATAMOV <= TO_DATE('+QuotedStr(DateToStr(DataFim))+',''DD/MM/YYYY'')) '+
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
        Result := GetDataPacket(Ssql);
      end;
    10:
      Begin    //CADASTRO DE PESSOAS JURIDICAS E FÍSICAS
        Ssql := 'SELECT replace(replace(replace(replace(replace(replace(P.NUMDOCUMENTO, '+ quotedStr('-')+', '+quotedStr('')+ '), '+quotedStr('.')+', '+quotedStr('')+'), '+quotedStr(',')+', '+quotedStr('')+'), '+quotedStr('/')+', '+quotedStr('')+'), '+quotedStr(' ')+', '+quotedStr('')+'), '+quotedStr(';')+', '+quotedStr('')+')  AS CNPJ, replace(replace(replace(replace(replace(replace(DD.NumDocumento, '+ quotedStr('-')+', '+quotedStr('')+ '), '+quotedStr('.')+', '+quotedStr('')+'), '+quotedStr(',')+', '+quotedStr('')+'), '+quotedStr('/')+', '+quotedStr('')+'), '+quotedStr(' ')+', '+quotedStr('')+'), '+quotedStr(';')+', '+quotedStr('')+
                '       )  AS INSCEST, replace(replace(replace(replace(replace(replace(DDD.NUMDOCUMENTO, '+ quotedStr('-')+', '+quotedStr('')+ '), '+quotedStr('.')+', '+quotedStr('')+'), '+quotedStr(',')+', '+quotedStr('')+'), '+quotedStr('/')+', '+quotedStr('')+'), '+quotedStr(' ')+', '+quotedStr('')+'), '+quotedStr(';')+', '+quotedStr('')+')  AS CPF, '+
                '       replace(replace(replace(replace(replace(replace(DDDD.NUMDOCUMENTO, '+ quotedStr('-')+', '+quotedStr('')+ '), '+quotedStr('.')+', '+quotedStr('')+'), '+quotedStr(',')+', '+quotedStr('')+'), '+quotedStr('/')+', '+quotedStr('')+'), '+quotedStr(' ')+', '+quotedStr('')+'), '+quotedStr(';')+', '+quotedStr('')+')  AS INSCMUN, P.RAZAOSOCIAL, C.UF, C.NOME, E.LOGRADOURO, '+
                '       E.COMPLEMENTO, E.BAIRRO, E.CEP, E.NUMERO, TO_CHAR(SYSDATE,''DDMMYYYY'') AS DATA, P.NOME AS NOMEFANTASIA '+
                '  FROM PESSOA P, CIDADES C, ENDPESS E, (SELECT D.IDDOCUMENTO, D.NUMDOCUMENTO, D.IDPESSOA '+
                '                                          FROM DOCPESSOA D, PARAMLIVRO P '+
                '                                         WHERE D.IDDOCUMENTO = P.IDINSCEST ) DD, '+
                '                                       (SELECT D.IDDOCUMENTO, D.NUMDOCUMENTO, D.IDPESSOA '+
                '                                          FROM DOCPESSOA D '+
                '                                         WHERE D.IDDOCUMENTO = '+IdCpf+' ) DDD, '+
                '                                       (SELECT D.IDDOCUMENTO, D.NUMDOCUMENTO, D.IDPESSOA '+
                '                                          FROM DOCPESSOA D, PARAMLIVRO P '+
                '                                         WHERE D.IDDOCUMENTO = P.IDINSCRMUNIC ) DDDD '+
                ' WHERE P.IdPessoa in ('+ArrumaId(VetCodigos)+') '+
                '   AND P.IdPessoa = DD.IdPessoa(+) '+
                '   AND P.IdPessoa = DDD.IdPessoa(+) '+
                '   AND P.IdPessoa = DDDD.IdPessoa(+) '+
                '   AND P.IdendComercial = E.IdEndereco '+
                '   AND E.IdCidades = C.IdCidades ';
        Result := GetDataPacket(Ssql);
      end;
    11: //Arquivo de Fornecedores / Clientes
      Begin
        Ssql := 'SELECT TO_CHAR(L.DATALANCTO,''DDMMYYYY'') AS DATAOPERACAO, L.DATALANCTO, '+
                '       DECODE(D.STATUS, ''1'', ''C'', DECODE(D.STATUS, ''2'', ''P'', DECODE(D.STATUS,''0'', ''C'')))  AS TIPOOPERACAO, DECODE(D.CODTIPDOC,NULL,''NF'',D.CODTIPDOC) AS TIPODOCUMENTO, '+
                '       D.NODOCUMENTO AS NUMERODOCUMENTO, '+
                '       D.IDFORCLI, '+
                '       TO_CHAR(D.DATAEMISSAO,''DDMMYYYY'') AS DATAEMISSAO, '+
                '       DECODE(SIGN(D.DATAPROGRAMADA-D.DATAEMISSAO),-1,TO_CHAR(D.DATAEMISSAO,''DDMMYYYY''),TO_CHAR(D.DATAPROGRAMADA,''DDMMYYYY'')) AS DATAVENCIMENTO, '+
                '       TO_CHAR(D.CODDOCUMENTO)||''-''||TO_CHAR(L.NUMLANCTO) AS NUMEROARQUIVAMENTO, '+
                '       ROUND(L.VALOR*100,0) AS VALOROPERACAO, '+
                '       ROUND(VO.VALOR*100,0) AS VALORORIGINAL, '+
                '       D.PLACONTA AS CONTAANALITICA, '+
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
                '   AND (L.DATALANCTO >= TO_DATE('''+dateTostr(DataIni)+''',''DD/MM/YYYY'')) '+
                '   AND (L.DATALANCTO <= TO_DATE('''+dateTostr(DataFim)+''',''DD/MM/YYYY'')) '+
                ' ORDER BY L.DATALANCTO, L.OPERACAO ';
        Result := GetDataPacket(Ssql);
      end;
    12:  //arquivo de plano de contas
      Begin
        Ssql := 'SELECT PC.PLACONTA AS CODCONTA, PC.PLACONTA, '+
                '       ''01011996'' AS DATAATUALIZACAO, '+
                '       PC.PLANOME AS DESCRICAO, PC.PLATIPO AS INDICADORCONTA, '+
                '       PC.PLAREDUZ AS CONTATOTALIZADORA '+
                '  FROM PLANOCONTA PC, PARAMCONTAB PR '+
                ' WHERE (PR.IDPESSOA = '+IntToStr(IdPessoa)+') '+
                '   AND (PC.PLANO = PR.PLANO) '+
                ' ORDER BY PC.PLACONTA ';
        Result := GetDataPacket(Ssql);
      end;
    13: //Arquivo de centro de custo
      Begin
        Result := ListCentCust;
      end;
    14: //Arquivo Mestre de Notas Fiscais de Serviço Emitidas pela Pessoa Jurídica - VHF
       Begin
         Ssql := 'SELECT N.IDCONTA, N.NUMERONOTA, N.NUMERONOTAFINAL, N.DATACANCELAMENTO, TO_CHAR(N.DATAEMISSAO,''DDMMYYYY'') AS DATAEMISSAO, N.SERIE, ' +
                 '       NVL(C.IDFORCLI,C.IDHOSPEDE) AS IDFORCLI '+
                 '  FROM NOTAFRONT N, CONTASFRONT C '+
                 ' WHERE (N.DATAEMISSAO BETWEEN TO_DATE('''+dateTostr(DataIni)+''',''DD/MM/YYYY'') '+
                 '   AND TO_DATE('''+dateTostr(DataFim)+''',''DD/MM/YYYY'')) ' +
                 '   AND (N.IDHOTEL = '+IntToStr(idHotel)+') ' +
                 '   AND (N.IDHOTEL = C.IDHOTEL) '+
                 '   AND (N.IDCONTA = C.IDCONTA) '+
                 '   AND ((N.FLGGEROULIVROISS = ''N'') OR (N.FLGGEROULIVROISS IS NULL)) ';
         Result := GetDataPacket(Ssql);
       end;
  end;
end;

procedure TCtrlFSRF6895.OnCreateAppServer;
begin
  inherited;
end;

function TCtrlFSRF6895.OraNumero(rNumero: Double): string;
var sNumero : string;
    AuxDec  : char;
begin
   AuxDec           := DecimalSeparator;
   DecimalSeparator := '.';
   sNumero:= FloatToStr(rNumero);
   Result :=sNumero;
   DecimalSeparator:=AuxDec;
end;

procedure TCtrlFSRF6895.Pegaimpostos(var sVlrIcmsSubst, sVlrIpi, sVlrDifIcms, sIcmsAntecipado, sAliquota, sBase, sValorImp : string; IdNFRecebDevol : longInt);
var rVlrAgregado,rValContab,rTotalItem,
    rVlrRecuperado,rBaseCalculo,s12,s13,s14, s16 :Double;
begin
  // pega o imposto da nota
  CdsImpostoNF.data := Terceiros.ListAgradosRecDev(IdNFRecebDevol);
  //
  //pega os itens da nota
  CdsItensNF.data := Terceiros.ListItensRecebDevol(IdNFRecebDevol);

  //
  rTotalItem:=0;
  cdsItensNF.First;
  while not cdsItensNF.Eof do   // PEGA A SOMA DO VALOR DOS ITENS DA NF
    Begin
      rTotalItem := rTotalItem + cdsItensNF.FieldByName('VLRTOTITEM').AsFloat;
      cdsItensNF.Next;
    end;
  // VARRE OS ITENS DA NF
  if not cdsItensNF.IsEmpty then
   Begin
     cdsItensNF.First;
     While not cdsItensNF.Eof do
     Begin
        rValContab := cdsItensNF.FieldByName('VLRTOTITEM').AsFloat;
        //pega o imposto do item
        cdsImpostoItem.data := Terceiros.ListImpostoItem(cdsItensNF.FieldByName('IDITENSRECDEV').AsInteger);
        //
        if rTotalItem <> 0 then // Soma do total dos itens <> 0
          Begin
           cdsImpostoNF.First;
           while not cdsImpostoNF.Eof do
           Begin
              rVlrAgregado := ((cdsImpostoNF.FieldByName('VLRAGREGADO').AsFloat *
                              cdsItensNF.FieldByName('VLRTOTITEM').AsFloat) / rTotalItem);

              rBaseCalculo := ((cdsImpostoNF.FieldByName('BASECALCULO').AsFloat *
                              cdsItensNF.FieldByName('VLRTOTITEM').AsFloat) / rTotalItem);

              rVlrRecuperado:=0;

              if cdsItensNF.FieldByName('CONSUMOREVENDA').AsString = 'R' then
                 rVlrRecuperado := ((cdsImpostoNF.FieldByName('VLRRECUPERADO').AsFloat *
                                   cdsItensNF.FieldByName('VLRTOTITEM').AsFloat) / rTotalItem);
              //calcula o imposto e insere na query qryimpostoItem

              cdsImpostoItem.Append;
              cdsImpostoItem.FieldByName('ALIQUOTA').AsFloat           := cdsImpostoNF.FieldByName('ALIQUOTA').AsFloat;
              cdsImpostoItem.FieldByName('VLRAGREGADO').AsFloat        := rVlrAgregado;
              cdsImpostoItem.FieldByName('VLRRECUPERADO').AsFloat      := rVlrRecuperado;
              cdsImpostoItem.FieldByName('BASECALCULO').AsFloat        := rBaseCalculo;
              cdsImpostoItem.FieldByName('CODTIPOCUSTAGREG').AsInteger := cdsImpostoNF.FieldByName('CODTIPOCUSTAGREG').AsInteger;
              cdsImpostoItem.FieldByName('CODTRATFISCE').AsString      := cdsImpostoNF.FieldByName('CODTRATFISCE').AsString;
              cdsImpostoItem.Post;
              cdsImpostoNF.Next;
           end;
        end;
        cdsImpostoItem.First;
        while not cdsImpostoItem.Eof do
        Begin
           if (cdsImpostoItem.FieldByName('CODTRATFISCE').AsString = '3') or
              (cdsImpostoItem.FieldByName('CODTRATFISCE').AsString = '4') then
              rValContab := rValContab + cdsImpostoItem.FieldByName('VLRAGREGADO').AsFloat
           else if (cdsImpostoItem.FieldByName('CODTRATFISCE').AsString = '6') then
              rValContab := rValContab - cdsImpostoItem.FieldByName('VLRAGREGADO').AsFloat;
           cdsImpostoItem.Next;
        end;
        //
        cdsImpostoItem.First;
        s12 := 0;
        s13 := 0;
        s14 := 0;
        s16 := 0; //icms antecipado
        while not cdsImpostoItem.Eof do
        Begin
           //  -- PROCURA O CODTIPOCUSTAGREG NA TABELA ALTXIMPOSTO E VERIFICA O CODIMPOSTO

           //pega o alterado x imposto do item
           cdsAltxImposto.data := TipoAltxImpostos.ListAltxImposto(cdsImpostoItem.FieldByName('CODTIPOCUSTAGREG').AsInteger);
           cdsAltxImposto.First;
           if not cdsAltxImposto.Eof then
              Case cdsAltxImposto.FieldByName('CODIMPOSTO').AsInteger of
                12 :  s12 := cdsImpostoItem.FieldByName('VLRAGREGADO').AsFloat;
                13 :  s13 := cdsImpostoItem.FieldByName('VLRAGREGADO').AsFloat;
                14 :  s14 := cdsImpostoItem.FieldByName('VLRAGREGADO').AsFloat;
                16 :  s16 := cdsImpostoItem.FieldByName('VLRAGREGADO').AsFloat;
              end;
           sVlrIcmsSubst   := OraNumero(s12);
           sVlrIpi         := OraNumero(s13);
           sVlrDifIcms     := OraNumero(s14);
           sIcmsAntecipado := OraNumero(s16);
           //
           if (cdsImpostoItem.FieldByName('VLRRECUPERADO').AsFloat <> 0) then
            Begin
              sAliquota    := OraNumero(cdsImpostoItem.FieldByName('ALIQUOTA').AsFloat);
              sBase        := OraNumero(cdsImpostoItem.FieldByName('BASECALCULO').AsFloat);
              sValorImp    := OraNumero(cdsImpostoItem.FieldByName('VLRAGREGADO').AsFloat);
            end;
           //
           cdsImpostoItem.Next;
        end;
        cdsItensNF.Next;
     end;
   end;
end;

end.
