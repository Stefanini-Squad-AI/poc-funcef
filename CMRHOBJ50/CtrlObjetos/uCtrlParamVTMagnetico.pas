unit uCtrlParamVTMagnetico;

interface

uses SysUtils, Classes, Controls, DB, DbClient, uCmControlObject, uCmDbObject,
  uCMTypes, uCtrlCustomRH, uDiasUteis, uCtrlTurnoSem;

const
  MARCA_ESTAB = '###INSCRICAO###';

type
  TCtrlParamVTMagnetico = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure AfterInitialize; override;
    procedure OnCreateAppServer; override;
  private
    FCtrlTurnoSem: TCtrlTurnoSem;

    FCdsPrincipal: TClientDataSet;
    FCdsTurno: TClientDataSet;

    FDiasUteis: TDiasUteis;
    FSQL: TStringList; // SQL usado na Query principal

    FIdPessoa: string; // ID da pessoa atual
    FListaIdPessoa: string; // Lista de pessoas processadas (usada em vários métodos com
                            // auxiliar para saber se uma pessoa já foi contada ou processada)
    FQuantTotal_ValeTransp: double; // Quantidade de vales transporte total de um estabelecimento
    FValTotal_ValeTransp: double; // Valor total da compra de vales transportes de um estabelecimento
    FValTotal_PedidoRioCard: double; // Valor total do pedid de Rio Card de um estabelecimento
    FValorTotalCompra: double; // Valor total da compra de vales de todos estabelecimentos
                               // Inclui o todas de vales transporte e o de cartões Rio Card

    FCidadeRecargaRioCard: integer; // Cidade onde será feita a recarga do Rio Card
    FCodRedeRecarda: integer; // Código da rede de recarga do Rio Card
    FNumDiasMes: integer; // Quantidade de dias no mês
    FQuantDiasMinTrab: integer; // Quantidade Mínima de dias Trabalhados a considerar
    FQuantDiasTrab: integer; // Quantidade de Dias Trabalhados a considerar
    FHoraInicial: TTime; // Hora inicial de processamento

    // Variáveis usadas somente no processo de geração da AP
    FIdentificadorFunc: integer;
    FCodEmpresa: integer; // Identificação da empresa que está usando o sistema (Refer, CTRQ, ...)

    FNumSequencia_ValeTransp: integer; // Nº de sequência do registro no arquivo de vale transporte
    FNumSequencia_PedidoCard: integer; // Nº de sequência do registro no arquivo de
                                          // Pedidos Rio e Passe Card
    FQuantRegTip2_ValeTransp: integer; // Quantidade de registros tipo 2 de um estabelecimento

    FNumRegCadUsuariosRioCard: word; // Quantidade de pessoas por estabelecimento para
                                     // o arquivo de inclusão de usuários Rio Card
    FNumRegPedidoRioCard: word; // Quantidade de pessoas por estabelecimento para
                                // o arquivo de pedidos do Rio Card
    FNumRegCadUsuariosPasseCard: word; // Quantidade de pessoas por estabelecimento para
                                     // o arquivo de inclusão de usuários Passe Card
    FNumRegPedidoPasseCard: word; // Quantidade de pessoas por estabelecimento para
                                // o arquivo de pedidos do Passe Card
    FNumRegValeTransp: word; // Quantidade de pessoas por estabelecimento para o Vale Transporte

    FGerarRioCard: boolean; // Indica se os arquivos Rio Card devem ser gerados
    FGerarCadUsuariosRioCardTodos: boolean; // Indica se o arquivo da Cadastro de Usuários
                                            // Rio Card será gerado para todos (True) ou
                                            // somente para os que foram admitidos no mês (False)
    // Variáveis usadas no registro Tipo 3 (Informações Adicionais) do Arquivo de Pedidos Rio Card
    FGerarRegTipo3RioCard: boolean; // Indica se deve gerar o registro
    FDataLiberacaoCargaRioCard: TDate; // Data da liberação da carga quando esta for superior 1 5 ou 7 dias
    FTipoEntregaRioCard: integer; // Local de entrega do cartão (D -> Domiciliar, A -> Agência do Unibanco)
    FNumAgenciaAntregaRioCard: string; // Número da Agência a ser entregue os cartões

    FGerarPasseCard: boolean; // Indica se os arquivos Passe Card devem ser gerados
    FGerarCadUsuariosPasseCardTodos: boolean; // Indica se o arquivo da Cadastro de Usuários
                                            // Passe Card será gerado para todos (True) ou
                                            // somente para os que foram admitidos no mês (False)
    FCodCliente: double; // código da empresa no SindiOnibus (Passe Card, Ceará)

    FDescontarFerias: boolean; // Indica se é para fazer o desconto dos férias no período
    FDescontarFeriados: boolean; // Indica se é para fazer o desconto dos feriados no período
    FDescontarFaltas: boolean; // Indica se é para fazer o desconto dos faltas no período

    FDataInicial: TDate; // Período Inicial a calcular as linhas de transporte
    FDataFinal: TDate; // Período Final a calcular as linhas de transporte
    FInicioFerias: TDate; // Período Inicial das férias da pessoa
    FFinalFerias: TDate; // Período Final das férias da pessoa

    FListaAdmitidos: string; 
    FListaIdEstab: string;
    FIdEstab: string; // Estabelecimento atual
    sAnoMes, sUltMatric: string;
    FTempoDeProcessamento: string;

    // Conteúdo dos arquivos
    FArquivoValeTransporte: TStringList;
    FArquivoCadUsuariosCard: TStringList;
    FArquivoPedidoCard: TStringList;

    // Métodos de consultas à Queries
    function AbrirQueryPrincipal(Ordenacao: integer): boolean;
    function ListAdmitidos: OleVariant;

    // Montar a lista de pessoas admitidas no período (usada pela opção de incluir somente
    // pessoas admitidas no Arquivo de Cadastramento de Usuários do Rio Card)
    procedure MontarListaAdmitidos;

    // Avançar o ponteiro da pessoa para a próxima linha de transporte
    procedure IrProxLinhaTransp;

    // Obter o número de dias trabalhados da pessoa que tem horário normal
    function  GetNumDiasTrab_HorarioNormal: integer;
    // Obter o número de dias trabalhados da pessoa que tem horário escala
    function  GetNumDiasTrab_HorarioEscala: integer;
    // Obter o número de dias de falta da pessoa
    function  GetNumDiasFaltas: integer;
    // Obter o número de dias trabalhados da pessoa.
    // Este é o método pai para a obtenção do número de dias trabalhados da pessoa.
    // Faz uso dos demais métodos de obtenção deste número
    function  GetNumDiasTrab: integer;

    // Calcular alguns valores das linhas de transporte de cada pessoa. Os campos modificados são:
    // -> NUM_DIAS_TRAB = Número de dias trabalhados
    // -> QUANT_VALES   = NUM_DIAS_TRAB * Quantidade de vales por dia da linha de transporte
    // -> VALOR_COMPRA  = NUM_DIAS_TRAB * Valor da tarifa da linha de transporte
    procedure CalcularValoresPessoa;

    // Métodos de validação dos dados a serem gravados nos arquivos
    function ValidarDados(Tipo: char; Dado: string; Tamanho: word): string;
    function Val_UsoDoEmpregador07: string;

    // Geração dos registros do(s) arquivo(s)
    procedure GerarRegistroCabecalho;
    procedure GerarRegistroDetalhe;
    procedure GerarRegistroTotEstab;

    procedure GerarRegistroDetalhe_ValeTransp;
    procedure GerarRegistroDetalhe_Card;

    // Arquivo de Importação dos Vales Transporte (papel)
    function GerarRegistro01_ValeTransp: string;
    function GerarRegistro02_ValeTransp: string;
    function GerarRegistro03_ValeTransp: string;
    function GerarRegistro09_ValeTransp: string;

    // Arquivo de Importação dos Usuários de Cartões Rio Card
    function GerarRegistro01_CadUsuariosRioCard: string;
    function GerarRegistro02_CadUsuariosRioCard(const ValUsoDiario: double): string;
    function GerarRegistro99_CadUsuariosRioCard: string;

    // Arquivo de Importação dos Pedidos de Cartões Rio Card
    function GerarRegistro01_PedidoRioCard: string;
    function GerarRegistro02_PedidoRioCard(const ValVales: double): string;
    function GerarRegistro03_PedidoRioCard: string;
    function GerarRegistro99_PedidoRioCard: string;

    // Arquivo de Importação dos Usuários de Cartões Passe Card (CE)
    function GerarRegistro_CadUsuariosPasseCard(const ValUsoDiario: double): string;

    // Arquivo de Importação dos Pedidos de Cartões Passe Card
    function GerarRegistro_PedidoPasseCard(const ValVales: double): string;

    // Obter o número dos registros dos vales transporte a serem comprados
    function GetNumRegValeTransp: integer;
    // Obter o número de pessoas que usam Rio Card (arquivo de pedidos e de cadastro de usuários)
    function GetNumRegCard(ContarUsuarios_a_Cadastrar: boolean): integer;
    // Obter o Número de Pessoas a processar (para incrementar a barra de progressos)
    function GetNumFunc: integer;
  public
    constructor Create(CodEmpresa: integer); reintroduce;
    destructor  Destroy; override;

    // Método de geração dos arquivos
    function ProcessarGeracao(
      ListaIdEstab: string; DataInicial, DataFinal: TDate; DescontarFerias, DescontarFeriados,
      DescontarFaltas: boolean; QuantDiasTrab, QuantDiasMinTrab, IdentificadorFunc,
      Ordenacao: integer; GerarRioCard, GerarCadUsuariosRioCardTodos,
      GerarRegTipo3RioCard, GerarPasseCard, GerarCadUsuariosPasseCardTodos: boolean;
      CidadeRecargaRioCard, CodRedeRecarda: integer;
      DataLiberacaoCargaRioCard: TDate; TipoEntregaRioCard: integer;
      NumAgenciaAntregaRioCard: string; CodCliente: double): boolean;

    property TempoDeProcessamento: string read FTempoDeProcessamento;
    property SQL: TStringList read FSQL;
    property ValorTotalCompra: double read FValorTotalCompra;

    property ArquivoValeTransporte: TStringList read FArquivoValeTransporte;
    property ArquivoCadUsuariosCard: TStringList read FArquivoCadUsuariosCard;
    property ArquivoPedidoCard: TStringList read FArquivoPedidoCard;
  end;

implementation

uses uCtrlFuncoesRH;

{ TCtrlParamVTMagnetico }

constructor TCtrlParamVTMagnetico.Create(CodEmpresa: integer);
begin
  inherited Create;
  FCtrlTurnoSem := TCtrlTurnoSem.Create;

  FCdsPrincipal := TClientDataSet.Create(nil);
  FCdsTurno := TClientDataSet.Create(nil);

  FDiasUteis := TDiasUteis.Create;

  FSQL := TStringList.Create;

  FArquivoValeTransporte := TStringList.Create;
  FArquivoCadUsuariosCard := TStringList.Create;
  FArquivoPedidoCard := TStringList.Create;

  FCodEmpresa := CodEmpresa;
end;

destructor TCtrlParamVTMagnetico.Destroy;
begin
  FArquivoPedidoCard.Free;
  FArquivoCadUsuariosCard.Free;
  FArquivoValeTransporte.Free;

  FSQL.Free;

  FDiasUteis.Free;

  FCdsTurno.Free;
  FCdsPrincipal.Free;

  FCtrlTurnoSem.Free;
  inherited;
end;

procedure TCtrlParamVTMagnetico.AfterInitialize;
begin
  inherited;
  FCtrlTurnoSem.InitializeAs(Self);
  FDiasUteis.InitializeAs(Self);
end;

procedure TCtrlParamVTMagnetico.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlParamVTMagnetico.DoChangeDataBase;
begin
  inherited;
  FCtrlTurnoSem.DataBase := DataBase;
  FDiasUteis.DataBase := DataBase;
end;

function TCtrlParamVTMagnetico.AbrirQueryPrincipal(Ordenacao: integer): boolean;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PJ.NOME AS NOME_ESTAB,');
    Add('  PJ.IDPESSOA AS IDESTAB,');
    Add('  PJ.NUMDOCUMENTO AS INSCR_ESTAB,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| TO_CHAR(E.NUMERO) ||');
    Add('    TO_CHAR(DECODE(E.COMPLEMENTO,');
    Add('      NULL,'''',');
    Add('      '' - '' || RTRIM(E.COMPLEMENTO)');
    Add('    )) AS END_ESTAB,');
    Add('  RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS CEP_ESTAB,');
    Add('  RTRIM(E.BAIRRO) AS BAIRRO_ESTAB,');
    Add('  CIDADES.IDCIDADES,');
    Add('  RTRIM(CIDADES.NOME) AS CIDADE_ESTAB,');
    Add('  ES.CODESTADO AS UF,');
    Add('  CATCNAE.IDCATCNAE AS ATIV_PRINC_ESTAB,');
    Add('  TEL.DDD AS DDD_ESTAB,');
    Add('  TEL.NUMERO AS TEL_ESTAB,');
    Add('  FUNC.IDPESSOA,');
    Add('  FUNC.MATRICULA,');
    Add('  PF.NOME AS FUNCIONARIO,');
    Add('  CPF.NUM AS CPF,');
    if (FGerarPasseCard) then
      Add('  RG.NUM AS RG, RTRIM(RG.ORGAO) || DECODE(RG.UF,NULL,'''',''/'' || RG.UF) AS ORGAO, PFIS.DATANASC,');
    Add('  CIDADES.IDPAIS,');
    Add('  FUNC.DATAREFHORARIO AS DATAREF,');
    Add('  FUNC.CODCENTROCUSTO,');
    Add('  FUNC.IDHORARIO,');
    Add('  HT.FLGTIPOHORARIO AS TIPOHORARIO,');
    Add('  HT.HORASFOLGA1,');
    Add('  HT.HORASSERVICO,');
    Add('  HT.HORASFOLGA2,');
    Add('  (CASE');
    Add('     WHEN PFFERIAS.INIGOZOFERIAS IS NULL THEN NULL');
    Add('     ELSE (CASE');
    Add('             WHEN PFFERIAS.INIGOZOFERIAS >= TO_DATE(' +
      QuotedStr(DateToStr(FDataInicial))+ ',''DD/MM/YYYY'') THEN PFFERIAS.INIGOZOFERIAS');
    Add('             ELSE TO_DATE(' +QuotedStr(DateToStr(FDataInicial))+ ',''DD/MM/YYYY'')');
    Add('           END)');
    Add('   END) AS FUNC_INICIOFERIAS,');
    Add('  (CASE');
    Add('     WHEN PFFERIAS.FIMGOZOFERIAS IS NULL THEN NULL');
    Add('     ELSE (CASE');
    Add('             WHEN PFFERIAS.FIMGOZOFERIAS <= TO_DATE(' +
      QuotedStr(DateToStr(FDataFinal))+ ',''DD/MM/YYYY'') THEN PFFERIAS.FIMGOZOFERIAS');
    Add('             ELSE TO_DATE(' +QuotedStr(DateToStr(FDataFinal))+ ',''DD/MM/YYYY'')');
    Add('           END)');
    Add('   END) AS FUNC_FIMFERIAS,');
    Add('  LP.QTDDIARIA AS QTDE_VALES,');
    Add('  LT.VLRLINHATRANSP AS VLR_TARIFA,');
    Add('  LT.IDLINHATRANSP,');
    Add('  LT.NUMLINHATRANSP AS NUMLINHA,');
    Add('  TO_CHAR(DECODE(LT.TIPOLINHATRANSP,');
    Add('     ''Ônibus'',''O'',');
    Add('     ''Onibus'',''O'',');
    Add('     ''Bonde'',''O'',');
    Add('     ''Metrô'',''M'',');
    Add('     ''Metro'',''M'',');
    Add('     ''Barca'',''B'',');
    Add('     ''Trem'',''T'',');
    Add('     ''Cartão'',''C'',');
    Add('     ''Cartao'',''C'',');
    Add('     ''''');
    Add('  )) AS TIPOLINHA,');
    Add('  CART_RIO_CARD.NUM AS NUM_CART_RIO_CARD,');
    Add('  TS.IDDIASEMANA,');
    Add('  DIASACUMULADOS.CODRUBCLT,');
    Add('  NVL(EXTRA.DIASEXTRAS,0) AS DIASEXTRA,');
    Add('  NVL(DIASACUMULADOS.VALORPROVENTO,0) AS VALOR,');
    Add('  0 AS NUM_DIAS_TRAB,');
    Add('  0.00 AS QUANT_VALES,');
    Add('  0.00 AS VALOR_COMPRA');
    // ---------------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, ENDPESS E, TELENDPESS TEL, FUNCIONARIO FUNC,');
    Add('  CIDADES, LINHAXPESS LP, LINHATRANSP LT, TURNOSEM TS,');
    Add('  CATCNAE, ESTADO ES, HORATRAB HT, SITFUNC SF, FILIALPESSOA FP,');
    // ---------------------------------------------------------------------------- //
    if (FGerarPasseCard) then
    begin
      // DataNasc e RG da pessoa
      Add('  PESSOAFISICA PFIS,');
      Add(' (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO AS NUM, DP.ORGAO, ES.CODESTADO AS UF');
      Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO, ESTADO ES');
      Add('   WHERE (TDO.SIGLADOCUMENTO = ''RG:'') AND');
      Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
      Add('         (DP.IDESTADO        = ES.IDESTADO(+))) RG,');
    end;
    // ---------------------------------------------------------------------------- //
    // CPF da pessoa
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CPF:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) CPF,');
    // ---------------------------------------------------------------------------- //
    // Rio Card da pessoa
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CART_MAGETICO:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) CART_RIO_CARD,');
    // ---------------------------------------------------------------------------- //
    Add('  (SELECT H.IDPESSOA, H.VALORPROVENTO, P.CODRUBCLT');
    Add('   FROM   HISTRUBSAL H, PROVDESC P');
    Add('   WHERE (P.CODRUBCLT LIKE (''00%'')) AND');
    Add('         (H.MES        = ' +QuotedStr(sAnoMes)+ ') AND');
    Add('         (P.IDPROVENTO = H.IDRUBRICA)) DIASACUMULADOS,');
    // ---------------------------------------------------------------------------- //
    Add('  (SELECT FE.IDPESSOA, FE.INIGOZOFERIAS, FE.FIMGOZOFERIAS');
    Add('   FROM FERIAS FE');
    Add('   WHERE ((FE.INIGOZOFERIAS >= TO_DATE('+QuotedStr(DateToStr(FDataInicial))+',''DD/MM/YYYY'')) AND');
    Add('          (FE.INIGOZOFERIAS <= TO_DATE('+QuotedStr(DateToStr(FDataFinal))   +',''DD/MM/YYYY''))) OR');
    Add('         ((FE.FIMGOZOFERIAS >= TO_DATE('+QuotedStr(DateToStr(FDataInicial))+',''DD/MM/YYYY'')) AND');
    Add('          (FE.FIMGOZOFERIAS <= TO_DATE('+QuotedStr(DateToStr(FDataFinal))   +',''DD/MM/YYYY'')))) PFFERIAS,');
    // --------------------------------------------------------------------------------- //
    // SUB-SELECT PARA DIAS EXTRAS DE TRABALHO NO PERIODO
    Add('  (SELECT IDPESSOA, COUNT(*) AS DIASEXTRAS');
    Add('   FROM   DIAEXTRATRAB');
    Add('   WHERE  (DIATRAB >= TO_DATE('+QuotedStr(DateToStr(FDataInicial))+',''DD/MM/YYYY'')) AND');
    Add('          (DIATRAB <= TO_DATE('+QuotedStr(DateToStr(FDataFinal))+',''DD/MM/YYYY''))');
    Add('   GROUP BY IDPESSOA) EXTRA');
    // --------------------------------------------------------------------------------- //
    Add('WHERE');
    if not(FGerarRioCard) and not(FGerarPasseCard) then
      Add('  (LT.TIPOLINHATRANSP NOT IN (''Cartão'',''Cartao'')) AND');
    Add(MontaLinhaSelSQL('  (PJ.IDPESSOA',FListaIdEstab,8));
    Add(MontaLinhaSelSQL('  (FUNC.IDESTAB',FListaIdEstab,7));
    Add('  (SF.TIPOSIT          = ''A'') AND');
    Add('  (SF.IDSITFUNC        = FUNC.IDSITFUNC) AND');
    Add('  (PJ.IDPESSOA         = FUNC.IDESTAB) AND');
    Add('  (FUNC.IDPESSOA       = PF.IDPESSOA) AND');
    Add('  (FUNC.IDHORARIO      = HT.IDHORARIO) AND');
    Add('  (FUNC.IDPESSOA       = LP.IDPESSOA) AND');
    Add('  (FUNC.IDPESSOA       = CPF.IDPESSOA) AND');
    Add('  (LP.IDLINHATRANSP    = LT.IDLINHATRANSP) AND');
    Add('  (PJ.IDPESSOA         = FP.IDFILIALPESSOA) AND');
    Add('  (PJ.IDPESSOA         = E.IDPESSOA) AND');
    Add('  (E.IDENDERECO        = TEL.IDENDERECO) AND');
    Add('  (E.IDCIDADES         = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO    = ES.IDESTADO) AND');
    if (FGerarPasseCard) then
    begin
      Add('  (FUNC.IDPESSOA       = PFIS.IDPESSOA) AND');
      Add('  (FUNC.IDPESSOA       = RG.IDPESSOA(+)) AND');
    end;
    Add('  (FUNC.IDPESSOA       = CART_RIO_CARD.IDPESSOA(+)) AND');
    Add('  (HT.IDHORARIO        = TS.IDHORARIO(+)) AND');
    Add('  (FP.IDCATCNAE        = CATCNAE.IDCATCNAE(+)) AND');
    Add('  (PF.IDPESSOA         = PFFERIAS.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA         = DIASACUMULADOS.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA         = EXTRA.IDPESSOA(+))');
    Add('ORDER BY');

    case (Ordenacao) of
      0 : Add('  INSCR_ESTAB, FUNCIONARIO, TIPOLINHA, NUMLINHA');
      1 : Add('  INSCR_ESTAB, CODCENTROCUSTO, FUNCIONARIO, TIPOLINHA, NUMLINHA');
      2 : Add('  INSCR_ESTAB, CODCENTROCUSTO, MATRICULA, TIPOLINHA, NUMLINHA');
      3 : Add('  INSCR_ESTAB, MATRICULA, TIPOLINHA, NUMLINHA');
    end;
  end;
  try
    FCdsPrincipal.Data := GetDataPacket(FSQL);
    FCdsPrincipal.Filter := '';
    FCdsPrincipal.Filtered := true;
    Result := not(FCdsPrincipal.IsEmpty);
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;  
  end;
end;

function TCtrlParamVTMagnetico.ListAdmitidos: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  IDPESSOA' +CR_LF+
    'FROM' +CR_LF+
    '  FUNCIONARIO' +CR_LF+
    'WHERE' +CR_LF+
    '  (DATAADMISSAO >= TO_DATE(' +QuotedStr(IncData(DateToStr(FDataInicial), 0, -1, 0))+ ',''DD/MM/YYYY'')) AND' +CR_LF+
    '  (DATAADMISSAO <= TO_DATE(' +QuotedStr(IncData(DateToStr(FDataFinal), 0, -1, 0))+ ',''DD/MM/YYYY'')) AND' +CR_LF+
    QuebrarListaFiltro(2, '(IDPESSOA    ', FListaIdPessoa, 50));
end;

procedure TCtrlParamVTMagnetico.MontarListaAdmitidos;
var
  _CdsAdmitidos: TClientDataSet;
begin
  FListaAdmitidos := '';
  FListaIdPessoa := '';
  _CdsAdmitidos := TClientDataSet.Create(nil);
  try
    FCdsPrincipal.First;
    while not(FCdsPrincipal.EOF) do
    begin
      if (FCdsPrincipal.FieldByName('NUM_DIAS_TRAB').asInteger > 0) then
      begin
        if (FListaIdPessoa = '') then
          FListaIdPessoa := FCdsPrincipal.FieldByName('IDPESSOA').asString
        else
          FListaIdPessoa := FListaIdPessoa +','+ FCdsPrincipal.FieldByName('IDPESSOA').asString;
      end;
      FCdsPrincipal.Next;
    end;
    FCdsPrincipal.First;

    _CdsAdmitidos.Data := ListAdmitidos;
    while not(_CdsAdmitidos.EOF) do
    begin
      if (FListaAdmitidos = '') then
        FListaAdmitidos := _CdsAdmitidos.FieldByName('IDPESSOA').asString
      else
        FListaAdmitidos := FListaAdmitidos +','+ _CdsAdmitidos.FieldByName('IDPESSOA').asString;
      _CdsAdmitidos.Next;
    end;
  finally
    _CdsAdmitidos.Free;
  end;
end;

procedure TCtrlParamVTMagnetico.IrProxLinhaTransp;
var
  sNumLinha: string;
begin
  sNumLinha := FCdsPrincipal.FieldByName('IDLINHATRANSP').asString;
  while (FIdPessoa = FCdsPrincipal.FieldByName('IDPESSOA').asString) and
        (sNumLinha = FCdsPrincipal.FieldByName('IDLINHATRANSP').asString) and
        not(FCdsPrincipal.EOF) do
  begin
    FCdsPrincipal.Next;
  end;
end;

function TCtrlParamVTMagnetico.GetNumDiasTrab_HorarioNormal: integer;
var
  c: integer;
  bAchou: boolean;
  dtData: TDate;
begin
  Result := 0;
  for c:=0 to FNumDiasMes-1 do
  begin
    dtData := FDataInicial + c;

    // Verificar se o dia atual está dentro das férias
    if (FDescontarFerias) then
      if (dtData >= FInicioFerias) and (dtData <= FFinalFerias) then
        continue;

    // Verificar se o dia atual é um feriado
    if (FDescontarFeriados) then
      if (FDiasUteis.Feriado(dtData, FCdsPrincipal.FieldByName('IDCIDADES').asInteger,
         FCdsPrincipal.FieldByName('IDPAIS').asInteger,
         FCdsPrincipal.FieldByName('UF').asString, false, true)) then
        continue;

    // Verificar se o dia atual está dentro do horário da pessoa
    bAchou := FCdsTurno.Locate('IDDIASEMANA', DayOfWeek(dtData), []);
    
    if (bAchou) then
      Inc(Result);
  end;
end;

function TCtrlParamVTMagnetico.GetNumDiasTrab_HorarioEscala: integer;
var
  c: integer;
  bDescFerias: boolean;
  dtData: TDate;
  dHora1, dTotHoras: double;
begin
  Result := 0;

  // Só deve fazer o restante caso a data de referência estiver preenchida
  if (FCdsPrincipal.FieldByName('DATAREF').asDateTime = 0) or
     (FCdsPrincipal.FieldByName('DATAREF').IsNull) then
    exit;

  // Verificar se a pessoa está em período de férias nas datas indicadas
  bDescFerias := (FDescontarFerias) and (FInicioFerias > 0) and (FFinalFerias > 0) and
    (FInicioFerias >= FDataInicial) and (FFinalFerias <= FDataFinal);

  if (FCodEmpresa = REFER) then
    Result := FNumDiasMes 
  else
  begin
    // Calcular o tatal de horas do ciclo de trabalho
    dTotHoras := FCdsPrincipal.FieldByName('HORASFOLGA1').asFloat +
                FCdsPrincipal.FieldByName('HORASSERVICO').asFloat +
                FCdsPrincipal.FieldByName('HORASFOLGA2').asFloat;

    for c:=0 to FNumDiasMes-1 do
    begin
      dtData := FDataInicial + c;

      // Calcular a primera hora de trabalho dentro do período especificado
      dHora1 := RestoDivisao((dtData -
        FCdsPrincipal.FieldByName('DATAREF').asDateTime) * 24, dTotHoras) +
        FCdsPrincipal.FieldByName('HORASFOLGA1').asFloat;

      // Somente incrementar a quantidade de dias trabalhados se o dia
      // atual está dentro das férias ou não existir período de férias
      if (dHora1 < 24) then
      begin
        if (bDescFerias) then
        begin
          if (dtData < FInicioFerias) or (dtData > FFinalFerias) then
            Inc(Result);
        end
        else
          Inc(Result);
      end;
    end;
  end;
end;

function TCtrlParamVTMagnetico.GetNumDiasFaltas: integer;
var
  bmRegistro: TBookMark;
  sIdPessoa, sListaCodRubCLT, sCodRubCLT: string;
  iTotDiasFaltas, iTotDiasFaltasAbonadas: integer;
begin
  iTotDiasFaltas := 0;
  iTotDiasFaltasAbonadas := 0;

  bmRegistro := FCdsPrincipal.GetBookMark;

  // Fazer os descontos dos dias de faltas e/ou afastamentos
  if (FDescontarFaltas) then
  begin
    sListaCodRubCLT := '';
    sIdPessoa := FCdsPrincipal.FieldByName('MATRICULA').asString;
    while (sIdPessoa = FCdsPrincipal.FieldByName('MATRICULA').asString) and
          not(FCdsPrincipal.EOF) do
    begin
      sCodRubCLT := FCdsPrincipal.FieldByName('CODRUBCLT').asString;
      if (sCodRubCLT <> '') and (VerificaCodigoEm(sListaCodRubCLT, sCodRubCLT, ',') < 1) then
      begin
        // Total de Dias de Faltas Abonadas
        if (sCodRubCLT = '00006') then
        begin
          InserirCodigoEm(sListaCodRubCLT, sCodRubCLT);
          Inc(iTotDiasFaltasAbonadas, FCdsPrincipal.FieldByName('VALOR').asInteger);
        end
        else
        if (sCodRubCLT = '00001') or // Total de Dias de Faltas
           (sCodRubCLT = '00024') or // Total de Dias de Afastamento por Doença
           (sCodRubCLT = '00034') or // Total de Dias de Suspensão
           (sCodRubCLT = '00039') or // Total de Dias de Afastamento pelo INSS por Doença
           (sCodRubCLT = '00041') or // Total de Dias de Licença Remunerada
           (sCodRubCLT = '00043') or // Total de Dias de Licença Não Remunerada
           (sCodRubCLT = '00570') or // Total de Dias de Afastamento Maternidade
           (sCodRubCLT = '00571') or // Total de Dias de Afastamento Paternidade
           (sCodRubCLT = '00574') or // Total de Dias de Afastamento por Natmorte
           (sCodRubCLT = '00696') or // Total de Dias de Afastamento Militar
           (sCodRubCLT = '00697') then // Total de Dias de Afastamento pelo INSS (Acidente de Trabalho)
        begin
          InserirCodigoEm(sListaCodRubCLT, sCodRubCLT);
          Inc(iTotDiasFaltas, FCdsPrincipal.FieldByName('VALOR').asInteger);
        end;
      end;
      FCdsPrincipal.Next;
    end;
  end;

  if (iTotDiasFaltas > 0) and (iTotDiasFaltasAbonadas > 0) then
    Result := iTotDiasFaltas - iTotDiasFaltasAbonadas
  else
    Result := iTotDiasFaltas;

  FCdsPrincipal.GoToBookMark(bmRegistro);
  FCdsPrincipal.FreeBookMark(bmRegistro);
end;

function TCtrlParamVTMagnetico.GetNumDiasTrab: integer;
var
  iTotDiasDesc: integer;
begin
  FInicioFerias := FCdsPrincipal.FieldByName('FUNC_INICIOFERIAS').asDateTime;
  FFinalFerias := FCdsPrincipal.FieldByName('FUNC_FIMFERIAS').asDateTime;

  if (FQuantDiasTrab > 0) then
    Result := FQuantDiasTrab
  else
  begin
    // Obter o número de dias trabalhados no mês
    case (FCdsPrincipal.FieldByName('TIPOHORARIO').asInteger) of
      1 :  Result := GetNumDiasTrab_HorarioEscala;
      else Result := GetNumDiasTrab_HorarioNormal;
    end;

    // Obter a quantidade de dias de falta
    iTotDiasDesc := GetNumDiasFaltas;

    // Subtrair os dias trabalhados pela quantidade de dias de falta
    Result := Result - iTotDiasDesc;
    if (Result < FQuantDiasMinTrab) then
      Result := 0;
  end;
end;

procedure TCtrlParamVTMagnetico.CalcularValoresPessoa;
var
  iNumDiasTrab: integer;
begin
  FCdsPrincipal.First;
  FIdPessoa := '';
  iNumDiasTrab := 0;
  repeat
    if (FIdPessoa <> FCdsPrincipal.FieldByName('IDPESSOA').asString) then
    begin
      FIdPessoa := FCdsPrincipal.FieldByName('IDPESSOA').asString;
      FCdsTurno.Data := FCtrlTurnoSem.ListDiasDaSemana(FCdsPrincipal.FieldByName('IDHORARIO').asInteger);
      iNumDiasTrab := GetNumDiasTrab;
    end;

    FCdsPrincipal.Edit;
    FCdsPrincipal.FieldByName('NUM_DIAS_TRAB').asInteger := iNumDiasTrab;
    FCdsPrincipal.FieldByName('QUANT_VALES').asFloat :=
      Round(FCdsPrincipal.FieldByName('NUM_DIAS_TRAB').asInteger *
            FCdsPrincipal.FieldByName('QTDE_VALES').asFloat)+
      Round(FCdsPrincipal.FieldByName('DIASEXTRA').asInteger *
            FCdsPrincipal.FieldByName('QTDE_VALES').asFloat);
    FCdsPrincipal.FieldByName('VALOR_COMPRA').asFloat :=
      (FCdsPrincipal.FieldByName('QUANT_VALES').asFloat *
       FCdsPrincipal.FieldByName('VLR_TARIFA').asFloat);

    FCdsPrincipal.Post;
    FCdsPrincipal.Next;
  until (FCdsPrincipal.EOF);
end;

procedure TCtrlParamVTMagnetico.GerarRegistroDetalhe_ValeTransp;
begin
  repeat
    if (FCdsPrincipal.FieldByName('TIPOLINHA').asString <> 'C') then
    begin
      // Montar registro
      Inc(FNumSequencia_ValeTransp);
      FArquivoValeTransporte.Add(GerarRegistro02_ValeTransp);
      Inc(FQuantRegTip2_ValeTransp);

      // Atualizar valores de totalização
      FQuantTotal_ValeTransp := FQuantTotal_ValeTransp + FCdsPrincipal.FieldByName('QUANT_VALES').asFloat;
      FValTotal_ValeTransp := FValTotal_ValeTransp + FCdsPrincipal.FieldByName('VALOR_COMPRA').asFloat;
      FValorTotalCompra := FValorTotalCompra + FCdsPrincipal.FieldByName('VALOR_COMPRA').asFloat;
    end;

    // Posicionar no último registro da linha de transporte
    IrProxLinhaTransp;
  until (FIdPessoa <> FCdsPrincipal.FieldByName('IDPESSOA').asString) or (FCdsPrincipal.EOF);
end;

procedure TCtrlParamVTMagnetico.GerarRegistroDetalhe_Card;
var
  bmkMarca: TBookmark;
  dValVales, dValUsoDiario: double;
  sGerarCadastro: string;
begin
  bmkMarca := FCdsPrincipal.GetBookMark;

  dValUsoDiario := 0;
  dValVales := 0;
  repeat
    // Somar o valor diário dos transportes
    if (FCdsPrincipal.FieldByName('TIPOLINHA').asString = 'C') then
    begin
      dValUsoDiario := dValUsoDiario +
        FCdsPrincipal.FieldByName('QTDE_VALES').asFloat *
        FCdsPrincipal.FieldByName('VLR_TARIFA').asFloat;
      dValVales := dValVales + FCdsPrincipal.FieldByName('VALOR_COMPRA').asFloat;
      FValorTotalCompra := FValorTotalCompra + FCdsPrincipal.FieldByName('VALOR_COMPRA').asFloat;
    end;

    // Posicionar no último registro da linha de transporte
    IrProxLinhaTransp;
  until (FIdPessoa <> FCdsPrincipal.FieldByName('IDPESSOA').asString) or (FCdsPrincipal.EOF);

  FCdsPrincipal.GotoBookmark(bmkMarca);
  FCdsPrincipal.FreeBookmark(bmkMarca);

  // Só fará a pessoa se a geração do arquivo de cadastro for para todas as pessoas ou
  // ela estiver sendo admitida no período especificado
  // Rio Card
  if ((FGerarCadUsuariosRioCardTodos) or
      (VerificaCodigoEm(FListaAdmitidos, FIdPessoa, ',') >= 1)) and
     (FNumRegCadUsuariosRioCard > 0) and (dValUsoDiario > 0) then
  begin
    FArquivoCadUsuariosCard.Add(GerarRegistro02_CadUsuariosRioCard(dValUsoDiario));
  end;

  if (FNumRegPedidoRioCard > 0) and (dValVales > 0) then
  begin
    FArquivoPedidoCard.Add(GerarRegistro02_PedidoRioCard(dValVales));
    FValTotal_PedidoRioCard := FValTotal_PedidoRioCard + dValVales;
  end;

  // Passe Card
  if ((FGerarCadUsuariosPasseCardTodos) or
      (VerificaCodigoEm(FListaAdmitidos, FIdPessoa, ',') >= 1)) and
     (FNumRegCadUsuariosPasseCard > 0) and (dValUsoDiario > 0) then
  begin
    sGerarCadastro := GerarRegistro_CadUsuariosPasseCard(dValUsoDiario);
    if (sGerarCadastro <> '') then
      FArquivoCadUsuariosCard.Add(sGerarCadastro);
  end;

  if (FNumRegPedidoPasseCard > 0) and (dValVales > 0) then
    FArquivoPedidoCard.Add(GerarRegistro_PedidoPasseCard(dValVales));
end;

// *************************************************************************************
// Valida os dados do VALE TRANSPORTE MAGNÉTICO
// Parâmetros: sTipo    - A (alfanumérico), N (numérico), V (valor)
//             sDado    - Dado a ser validado
//             wTamanho - Tamanho de retorno da string validada
// *************************************************************************************
function TCtrlParamVTMagnetico.ValidarDados(Tipo: char; Dado: string; Tamanho: word): string;
var
  sTemp: string;
  c, wMax: word;
begin
  Result := '';
  if not(Tipo in ['A','N','V']) and (Tamanho = 0) then
    exit;

  // Inicializa Variáveis
  sTemp := '';
  Tipo := UpCase(Tipo);
  Dado := Trim(Dado);

  // ******************************
  // Faz tratamento das informações
  // ******************************
  wMax := Tamanho;
  case (Tipo) of
    'A' : // Campos alfanuméricos
    begin
      try
        Dado := UpperCase(NormalizaString(ConverteCar(Dado)));
        sTemp := Alinha(Copy(Dado, 1, wMax), Tamanho, 'E', ' ');
      except
        sTemp := Replicate(' ', Tamanho);
      end;
    end;

    'N','V' : // Campos Numéricos e de Valor
    begin
      try
        // Atribuir o maior tamanho verificável possível
        if (Tamanho > Length(Dado)) then
          wMax := Length(Dado);

        for c:=1 to length(Dado) do
          if (Dado[c] in ['0'..'9']) then
            sTemp := sTemp + Dado[c];

        sTemp := Alinha(Copy(sTemp, 1, wMax), Tamanho, 'D', '0');
      except
        sTemp := Replicate('0', Tamanho);
      end;
    end;
  end;
  Result := sTemp;
end;

function TCtrlParamVTMagnetico.Val_UsoDoEmpregador07: string;
begin
  case (FIdentificadorFunc) of
    0 : Result :=
      ValidarDados('A', AbreviaNome(25, FCdsPrincipal.FieldByName('FUNCIONARIO').asString), 25);
    1 : Result :=
      ValidarDados('A', AbreviaNome(25, FCdsPrincipal.FieldByName('MATRICULA').asString), 25);
   else Result := Replicate(' ', 25);
  end;
end;

procedure TCtrlParamVTMagnetico.GerarRegistroCabecalho;
begin
  FArquivoValeTransporte.Add(GerarRegistro01_ValeTransp);
  if (FGerarRioCard) then
  begin
    if (FNumRegCadUsuariosRioCard > 0) then
    begin
      FArquivoCadUsuariosCard.Add(MARCA_ESTAB + FCdsPrincipal.FieldByName('INSCR_ESTAB').asString);
      FArquivoCadUsuariosCard.Add(GerarRegistro01_CadUsuariosRioCard);
    end;
    
    if (FNumRegPedidoRioCard > 0) then
    begin
      FArquivoPedidoCard.Add(MARCA_ESTAB + FCdsPrincipal.FieldByName('INSCR_ESTAB').asString);
      FArquivoPedidoCard.Add(GerarRegistro01_PedidoRioCard);
    end;
  end;
end;

procedure TCtrlParamVTMagnetico.GerarRegistroDetalhe;
begin
  repeat
    FIdPessoa := FCdsPrincipal.FieldByName('IDPESSOA').asString;
    if (FCdsPrincipal.FieldByName('QUANT_VALES').asFloat > 0) then
    begin
      // Gerar a linha de transporte para o Rio Card
      if (FGerarRioCard) then
        GerarRegistroDetalhe_Card;

      if (FGerarPasseCard) then
      // Gerar a linha de transporte para o Passe Card
      begin
        GerarRegistroDetalhe_Card;
        IrProxLinhaTransp;
      end
      else
        // Gerar a linha de transporte para o Vale Transporte
        GerarRegistroDetalhe_ValeTransp;
    end
    else
    begin
      repeat
        FCdsPrincipal.Next;
      until (FIdPessoa <> FCdsPrincipal.FieldByName('IDPESSOA').asString) or (FCdsPrincipal.EOF);
    end;
    DoProgresso([0, 1]);
  until (FCdsPrincipal.EOF);
end;

procedure TCtrlParamVTMagnetico.GerarRegistroTotEstab;
begin
  Inc(FNumSequencia_ValeTransp);
  FArquivoValeTransporte.Add(GerarRegistro03_ValeTransp);
end;

function TCtrlParamVTMagnetico.GerarRegistro01_ValeTransp: string;
begin
  Result :=
    // 01-Nº de sequência do registro no meio
    ValidarDados('N', IntToStr(FNumSequencia_ValeTransp), 5)+
    // 02-Inscrição do responsável (CNPJ/CEI; CPF)
    ValidarDados('N', FCdsPrincipal.FieldByName('INSCR_ESTAB').asString, 14)+
    // 03-Tipo Fixo 1
    '1' +Replicate(' ', 7)+
    // 04-Nome do responsável (Razão social)
    ValidarDados('A', FCdsPrincipal.FieldByName('NOME_ESTAB').asString, 40)+
    // 05-Endereço
    ValidarDados('A', FCdsPrincipal.FieldByName('END_ESTAB').asString, 38)+
    // 06-Mes/Ano de referência
    PoeZero(ExtraiMes(FDataInicial)) + IntToStr(ExtraiAno(FDataFinal))+
    // 07-Quantidade de funcionários
    ValidarDados('N', IntToStr(FNumRegValeTransp), 5)+
    // 08-Cep Ex.: 00000000 (se não houver informação)
    ValidarDados('N', FCdsPrincipal.FieldByName('CEP_ESTAB').asString, 8)+
    // 09-Bairro
    ValidarDados('A', FCdsPrincipal.FieldByName('BAIRRO_ESTAB').asString, 17)+
    // 10-Cidade
    ValidarDados('A', FCdsPrincipal.FieldByName('CIDADE_ESTAB').asString, 20)+
    // 11-UF
    ValidarDados('A', FCdsPrincipal.FieldByName('UF').asString, 2)+
    // 12-Atividade principal
    ValidarDados('N', FCdsPrincipal.FieldByName('ATIV_PRINC_ESTAB').asString, 4)+
    // 13-DDD
    ValidarDados('N', FCdsPrincipal.FieldByName('DDD_ESTAB').asString, 4)+
    // 14-Complemento
    ValidarDados('N', FCdsPrincipal.FieldByName('TEL_ESTAB').asString, 7)+
    // 15-Ramal
    Replicate(' ', 4)+
    // 16-Para uso do empregador
    Replicate(' ', 25);
end;

function TCtrlParamVTMagnetico.GerarRegistro02_ValeTransp: string;
begin
  Result :=
    // 01-Nº de sequência do registro no meio
    ValidarDados('N', IntToStr(FNumSequencia_ValeTransp),5)+
    // 02-Inscrição do responsável (CNPJ/CEI; CPF)
    ValidarDados('N', FCdsPrincipal.FieldByName('INSCR_ESTAB').asString, 14)+
    // 03-Tipo Fixo 2
    '2'+
    // 04-Módulo
    FCdsPrincipal.FieldByName('TIPOLINHA').asString+
    // 05-Quantidade de vales
    ValidarDados('N', IntToStr(Round(FCdsPrincipal.FieldByName('QUANT_VALES').asFloat)), 9)+
    // 06-Valor da tarifa
    ValidarDados('V', Float2String(FCdsPrincipal.FieldByName('VLR_TARIFA').asFloat), 8)+
    // Brancos
    Replicate(' ',144)+
    // 07-Para uso do empregador
    Val_UsoDoEmpregador07;
end;

function TCtrlParamVTMagnetico.GerarRegistro03_ValeTransp: string;
begin
  Result :=
    // 01-Nº de sequência do registro no meio
    ValidarDados('N', IntToStr(FNumSequencia_ValeTransp), 5)+
    // 02-Inscrição do responsável (CNPJ/CEI; CPF)
    ValidarDados('N', FCdsPrincipal.FieldByName('INSCR_ESTAB').asString, 14)+
    // 03-Tipo Fixo 3
    '3'+
    // 04-Quantidade de registros tipo 2
    ValidarDados('N', IntToStr(FQuantRegTip2_ValeTransp), 5)+
    // 05-Quantidade de vales
    ValidarDados('N', IntToStr(Round(FQuantTotal_ValeTransp)), 9)+
    // 06-Valor da compra
    ValidarDados('V', Float2String(FValTotal_ValeTransp), 15)+
    // Brancos
    Replicate(' ',133)+
    // 07-Para uso do empregador
    Replicate(' ', 25);
end;

function TCtrlParamVTMagnetico.GerarRegistro09_ValeTransp: string;
begin
  Result := Replicate('9', 207);
end;

function TCtrlParamVTMagnetico.GerarRegistro01_CadUsuariosRioCard: string;
begin
  Result :=
    // 01 (01 até 02 / tam. 02) - Tipo do Registro
    '01' +
    // 02 (03 até 08 / tam. 06) - Nome do arquivo
    'CADUSU' +
    // 03 (09 até 13 / tam. 05) - Número da versão do layout do arquivo
    '02.00' +
    // 04 (14 até 27 / tam. 14) - Inscrição do comprador (CNPJ/CEI; CPF)
    ValidarDados('N', FCdsPrincipal.FieldByName('INSCR_ESTAB').asString, 14)+
    // 05 (28 até 33 / tam. 08) - Data de geração do arquivo
    FormatDateTime('ddmmyyyy', Date)+
    // 05 (34 até 37 / tam. 04) - Hora de geração do arquivo
    FormatDateTime('hhnn', Time);
end;

function TCtrlParamVTMagnetico.GerarRegistro02_CadUsuariosRioCard(const ValUsoDiario: double): string;
begin
  Result :=
    // 01 (01 até 02 / tam. 02) - Tipo do Registro
    '02' +
    // 02 (03 até 17 / tam. 15) - Número da matrícula do usuário
    ValidarDados('A', FCdsPrincipal.FieldByName('MATRICULA').asString, 15)+
    // 03 (18 até 77 / tam. 60) - Nome do usuário
    ValidarDados('A', FCdsPrincipal.FieldByName('FUNCIONARIO').asString, 60)+
    // 04 (78 até 88 / tam. 11) - Nome do usuário
    ValidarDados('N', FCdsPrincipal.FieldByName('CPF').asString, 11)+
    // 05 (89 até 94 / tam. 06) - Valor de uso diário
    ValidarDados('V', Float2String(ValUsoDiario), 6)+
    // 06 (95 até 96 / tam. 02) - Código da cidade onde será feita a recarga
    ValidarDados('N', IntToStr(FCidadeRecargaRioCard), 2) +
    // 07 (97 até 98 / tam. 02) - Código da rede de recarga
    ValidarDados('N', IntToStr(FCodRedeRecarda), 2) +
    // 08 (99 até 111 / tam. 13) - Número do Cartão Rio Card
    ValidarDados('N', FCdsPrincipal.FieldByName('NUM_CART_RIO_CARD').asString, 13);
end;

function TCtrlParamVTMagnetico.GerarRegistro99_CadUsuariosRioCard: string;
begin
  Result :=
    // 01 (01 até 02 / tam. 02) - Tipo do Registro
    '99' +
    // 02 (03 até 08 / tam. 06) - Número de registros do arquivo (incluindo o Header e o Trailler)
    ValidarDados('N', IntToStr(FNumRegCadUsuariosRioCard+2), 6);
end;

function TCtrlParamVTMagnetico.GerarRegistro01_PedidoRioCard: string;
begin
  Result :=
    // 01 (01 até 05 / tam. 05) Nº de sequência do registro no meio
    ValidarDados('N', IntToStr(FNumSequencia_PedidoCard), 5)+
    // 02 (06 até 07 / tam. 02) - Tipo do Registro
    '01' +
    // 03 (08 até 13 / tam. 06) - Nome do arquivo
    'PEDIDO' +
    // 04 (14 até 18 / tam. 05) - Número da versão do layout do arquivo
    '01.00' +
    // 05 (19 até 32 / tam. 14) - Inscrição do comprador (CNPJ/CEI; CPF)
    ValidarDados('N', FCdsPrincipal.FieldByName('INSCR_ESTAB').asString, 14);
end;

function TCtrlParamVTMagnetico.GerarRegistro02_PedidoRioCard(const ValVales: double): string;
begin
  Inc(FNumSequencia_PedidoCard);
  Result :=
    // 01 (01 até 05 / tam. 05) Nº de sequência do registro no meio
    ValidarDados('N', IntToStr(FNumSequencia_PedidoCard), 5)+
    // 02 (06 até 07 / tam. 02) - Tipo do Registro
    '02' +
    // 03 (08 até 22 / tam. 15) - Número da matrícula do usuário
    ValidarDados('A', FCdsPrincipal.FieldByName('MATRICULA').asString, 15)+
    // 04 (23 até 30 / tam. 08) - Valor da Carga
    ValidarDados('V', Float2String(ValVales), 8);
end;

function TCtrlParamVTMagnetico.GerarRegistro03_PedidoRioCard: string;
begin
  Inc(FNumSequencia_PedidoCard);
  Result :=
    // 01 (01 até 02 / tam. 02) Nº de sequência do registro no meio
    ValidarDados('N', IntToStr(FNumSequencia_PedidoCard), 5)+
    // 02 (03 até 04 / tam. 02) - Tipo do Registro
    '03' +
    // 03 (05 até 12 / tam. 08) - Data da liberação da carga
    IFF(FDataLiberacaoCargaRioCard=0,
      Replicate('0', 8),
      ValidarDados('N', DateToStr(FDataLiberacaoCargaRioCard), 8))+
    // 04 (13 até 13 / tam. 01) - Local de entrega do cartão (D -> Domiciliar, A -> Agência do Unibanco)
    IFF(FTipoEntregaRioCard = 0, 'D', 'A')+
    // 05 (14 até 17 / tam. 04) - Número da Agência a ser entregue os cartões
    IFF(FTipoEntregaRioCard = 0,
      Replicate('0', 4),
      ValidarDados('N', FNumAgenciaAntregaRioCard, 4));
end;

function TCtrlParamVTMagnetico.GerarRegistro99_PedidoRioCard: string;
begin
  Inc(FNumSequencia_PedidoCard);
  Result :=
    // 01 (01 até 02 / tam. 02) Nº de sequência do registro no meio
    ValidarDados('N', IntToStr(FNumSequencia_PedidoCard), 5)+
    // 02 (03 até 04 / tam. 02) - Tipo do Registro
    '99' +
    // 03 (05 até 14 / tam. 10) - Valor total do pedido
    ValidarDados('N', Float2String(FValTotal_PedidoRioCard), 10);
end;

function TCtrlParamVTMagnetico.GetNumRegValeTransp: integer;
begin
  Result := 0;
  FListaIdPessoa := '';
  FCdsPrincipal.First;
  repeat
    FIdPessoa := FCdsPrincipal.FieldByName('IDPESSOA').asString;
    if (FCdsPrincipal.FieldByName('NUM_DIAS_TRAB').asInteger > 0) and
       (FCdsPrincipal.FieldByName('TIPOLINHA').asString <> 'C') and
       (VerificaCodigoEm(FListaIdPessoa, FIdPessoa, ',') < 1) then
    begin
      if (FListaIdPessoa = '') then
        FListaIdPessoa := FListaIdPessoa + FIdPessoa
      else
        FListaIdPessoa := FListaIdPessoa +','+ FIdPessoa;
      Inc(Result);
    end;
    FCdsPrincipal.Next;
  until (FCdsPrincipal.EOF);
end;

function TCtrlParamVTMagnetico.GetNumRegCard(ContarUsuarios_a_Cadastrar: boolean): integer;

{-->}function PodeGerarDetalhe: boolean;
     begin
       if (FCdsPrincipal.FieldByName('NUM_DIAS_TRAB').asInteger = 0) then
       begin
         Result := false;
         exit;
       end;

       // Se for para contar as pessoas que farão parte do arquivo de cadastro,
       // verificar se a pessoa atual foi admitida dentro do período (referente
       // à opção na tela) ou se deve incluir todas as pessoas selecionadas pela
       // Query Principal
       if (ContarUsuarios_a_Cadastrar) then
         Result := ((FGerarRioCard) and (FGerarCadUsuariosRioCardTodos)) or
                   ((FGerarPasseCard) and (FGerarCadUsuariosPasseCardTodos)) or
                   (VerificaCodigoEm(FListaAdmitidos, FIdPessoa, ',') >= 1)
       // Se for para contar as pessoas que farão parte do arquivo de pedidos,
       // sempre considerar que a pessoa deve entrar na contagem
       else
         Result := true;
{-->}end;

begin
  Result := 0;
  FListaIdPessoa := '';
  FCdsPrincipal.First;
  repeat
    FIdPessoa := FCdsPrincipal.FieldByName('IDPESSOA').asString;

    // Verificar se a pessoa atual deve entrar no arquivo
    if (PodeGerarDetalhe) and
       (FCdsPrincipal.FieldByName('TIPOLINHA').asString  = 'C') and
       (VerificaCodigoEm(FListaIdPessoa, FIdPessoa, ',') < 1) then
    begin
      if (FListaIdPessoa = '') then
        FListaIdPessoa := FListaIdPessoa + FIdPessoa
      else
        FListaIdPessoa := FListaIdPessoa +','+ FIdPessoa;
      Inc(Result);
    end;
    FCdsPrincipal.Next;
  until (FCdsPrincipal.EOF);
end;

function TCtrlParamVTMagnetico.GetNumFunc: integer;
var
  sIdPessoa: string;
begin
  Result := 0;
  sIdPessoa := '';
  repeat
    if (sIdPessoa <> FCdsPrincipal.FieldByName('IDPESSOA').asString) then
    begin
      Inc(Result);
      sIdPessoa := FCdsPrincipal.FieldByName('IDPESSOA').asString;
    end;
    FCdsPrincipal.Next;
  until (FCdsPrincipal.EOF);
end;

function TCtrlParamVTMagnetico.ProcessarGeracao(
  ListaIdEstab: string; DataInicial, DataFinal: TDate; DescontarFerias, DescontarFeriados,
  DescontarFaltas: boolean; QuantDiasTrab, QuantDiasMinTrab, IdentificadorFunc,
  Ordenacao: integer; GerarRioCard, GerarCadUsuariosRioCardTodos,
  GerarRegTipo3RioCard, GerarPasseCard, GerarCadUsuariosPasseCardTodos: boolean;
  CidadeRecargaRioCard, CodRedeRecarda: integer;
  DataLiberacaoCargaRioCard: TDate; TipoEntregaRioCard: integer;
  NumAgenciaAntregaRioCard: string; CodCliente: double): boolean;
var
  sListaIdEstab: string;
begin
  sUltMatric := '';
  FHoraInicial := Time;
  FNumSequencia_ValeTransp := 0;
  sAnoMes := RetornaAnoMes(StrToDate(IncData(DateToStr(DataInicial), 0, -1, 0)));
  FDataInicial := DataInicial;
  FDataFinal := DataFinal;
  FNumDiasMes := Round(FDataFinal - FDataInicial)+1;
  FIdentificadorFunc := IdentificadorFunc;
  FListaIdEstab := ListaIdEstab;
  FDescontarFerias := DescontarFerias;
  FDescontarFeriados := DescontarFeriados;
  FDescontarFaltas := DescontarFaltas;
  FQuantDiasTrab := QuantDiasTrab;
  FQuantDiasMinTrab := QuantDiasMinTrab;
  FValorTotalCompra := 0;

  FGerarRioCard := GerarRioCard;
  FGerarCadUsuariosRioCardTodos := GerarCadUsuariosRioCardTodos;
  FGerarRegTipo3RioCard := GerarRegTipo3RioCard;
  FCidadeRecargaRioCard := CidadeRecargaRioCard;
  FCodRedeRecarda := CodRedeRecarda;
  FDataLiberacaoCargaRioCard := DataLiberacaoCargaRioCard;
  FTipoEntregaRioCard := TipoEntregaRioCard;
  FNumAgenciaAntregaRioCard := NumAgenciaAntregaRioCard;

  FGerarPasseCard := GerarPasseCard;
  FGerarCadUsuariosPasseCardTodos := GerarCadUsuariosPasseCardTodos;
  FCodCliente := CodCliente;


  FArquivoValeTransporte.Text := '';
  FArquivoCadUsuariosCard.Text := '';
  FArquivoPedidoCard.Text := '';

  if (AbrirQueryPrincipal(Ordenacao)) then
  begin
    // Obter o Número de Pessoas a processar
    DoProgresso([GetNumFunc, 0]);

    try
      // Calcular alguns valores das linhas de transporte de cada pessoa
      CalcularValoresPessoa;

      // Loop para cada estabelecimento selecionado
      sListaIdEstab := FListaIdEstab;
      while (sListaIdEstab <> '') do
      begin
        ExtraiString(sListaIdEstab, FIdEstab, ',');
        FCdsPrincipal.Filter := 'IDESTAB = ' + FIdEstab;

        if (FCdsPrincipal.IsEmpty) then
          continue;

        // *******************************************
        // Obter o número de pessoas para cada arquivo
        // *******************************************

        // Obter o número de pessoas que receberão vale transporte no estabelecimento atual
        FNumRegValeTransp := GetNumRegValeTransp;

        if (FGerarRioCard) then
        begin
          if not(FGerarCadUsuariosRioCardTodos) then
            MontarListaAdmitidos;

          // Obter o número de pessoas que serão cadastradas como usuários do Rio Card
          FNumRegCadUsuariosRioCard := GetNumRegCard(true);
          // Obter o número de pessoas que irão gerar pedidos Rio Card
          FNumRegPedidoRioCard := GetNumRegCard(false);
        end;

        if (FGerarPasseCard) then
        begin
          if not(FGerarCadUsuariosPasseCardTodos) then
            MontarListaAdmitidos;

          // Obter o número de pessoas que serão cadastradas como usuários do Rio Card
          FNumRegCadUsuariosPasseCard := GetNumRegCard(true);
          // Obter o número de pessoas que irão gerar pedidos Passe Card
          FNumRegPedidoPasseCard := GetNumRegCard(false);
        end;

        // ************************************************************
        // Inicializar valores específicos para o estabelecimento atual
        // ************************************************************
        FNumSequencia_ValeTransp := 1;
        FNumSequencia_PedidoCard := IFF(FGerarPasseCard,0,1);
        FValTotal_ValeTransp := 0;
        FValTotal_PedidoRioCard := 0;
        FQuantRegTip2_ValeTransp := 0;
        FQuantTotal_ValeTransp := 0;

        // *******************************************
        // Gerar os registros do estabelecimento atual
        // *******************************************
        FCdsPrincipal.First;
        // Gerar Registro de Cabeçalho
        if not (FGerarPasseCard) then
          GerarRegistroCabecalho;
        // Gerar Registro Detalhe
        GerarRegistroDetalhe;
        // Gerar Registro Totalizador por Estabelecimento para o Arquivo de Vale Transporte
        if not (FGerarPasseCard) then
          GerarRegistroTotEstab;
        // Gerar Registro de Final de Arquivo para o Rio Card
        if (FGerarRioCard) then
        begin
          if (FNumRegCadUsuariosRioCard > 0) then
            FArquivoCadUsuariosCard.Add(GerarRegistro99_CadUsuariosRioCard);

          if (FNumRegPedidoRioCard > 0) then
          begin
            if (FGerarRegTipo3RioCard) then
              FArquivoPedidoCard.Add(GerarRegistro03_PedidoRioCard);

            FArquivoPedidoCard.Add(GerarRegistro99_PedidoRioCard);
          end;
        end;
      end;
      // Gerar Registro de Final de Arquivo para o Vale Transporte
      if not (FGerarPasseCard) then
        FArquivoValeTransporte.Add(GerarRegistro09_ValeTransp);
    except
      on E: Exception do
      begin
        if (FGerarPasseCard) then
          FArquivoPedidoCard.Text := ''
        else
          FArquivoValeTransporte.Text := '';
        MessageInfo := E.Message;
      end;
    end;
  end;

  FTempoDeProcessamento := HoraPorExtenso(Time - FHorainicial);
  Result := ((FGerarPasseCard) and (FArquivoPedidoCard.Text <> '')) or
            (not(FGerarPasseCard) and (FArquivoValeTransporte.Text <> ''));
end;

function TCtrlParamVTMagnetico.GerarRegistro_CadUsuariosPasseCard(const ValUsoDiario: double): string;
var
  sNomeAbrev: string;
  i: integer;
begin
  if (FCdsPrincipal.FieldByName('MATRICULA').asString = sUltMatric) then
  begin
    Result := '';
    exit;
  end;
  sUltMatric := FCdsPrincipal.FieldByName('MATRICULA').asString;

  i := 20;
  sNomeAbrev := copy(FCdsPrincipal.FieldByName('FUNCIONARIO').asString,1,20);
  while copy(sNomeAbrev, i, 1) <> ' ' do
  begin
    sNomeAbrev := copy(sNomeAbrev, 1, i-1);
    dec(i);
  end;
  Result :=
    // 01 (tam. 05) Código do Cliente
    ValidarDados('N', FloatToStr(FCodCliente), 5)+ ' ' +
    // 02 (tam. 08) - Número da matrícula do usuário
    ValidarDados('A', FCdsPrincipal.FieldByName('MATRICULA').asString, 8)+ ' ' +
    // 03 (tam. 05) - Branco
    ValidarDados('A', ' ', 5)+ ' ' +
    // 04 (tam. 50) - Nome do usuário
    ValidarDados('A', FCdsPrincipal.FieldByName('FUNCIONARIO').asString, 50)+ ' ' +
    // 05 (tam. 20) - Nome do usuário abreviado
    ValidarDados('A', sNomeAbrev, 20)+ ' ' +
    // 06 (tam. 10) - Data Nasc. do usuário
    ValidarDados('A', FCdsPrincipal.FieldByName('DATANASC').asString, 10)+ ' ' +
    // 07 (tam. 20) - Telefone do usuário
    ValidarDados('A', ' ', 20)+ ' ' +
    // 08 (tam. 14) - CPF do usuário editado
    ValidarDados('A', copy(FCdsPrincipal.FieldByName('CPF').asString,1,3)+'.'+
                      copy(FCdsPrincipal.FieldByName('CPF').asString,4,3)+'.'+
                      copy(FCdsPrincipal.FieldByName('CPF').asString,7,3)+'-'+
                      copy(FCdsPrincipal.FieldByName('CPF').asString,10,2), 14)+ ' ' +
    // 09 (tam. 20) - RG do usuário
    ValidarDados('A', FCdsPrincipal.FieldByName('RG').asString, 20)+ ' ' +
    // 10 (tam. 20) - Órgão RG do usuário
    ValidarDados('A', FCdsPrincipal.FieldByName('ORGAO').asString, 20)+ ' ' +
    // 11 a 20 (tam. 266) - Endereço do usuário e outros dados (opcional)
    ValidarDados('A', ' ', 266)+ ' ' +
    // 21 a 27 (tam. 13) - Flags Dias da Semana (D S T Q Q S S)
    ValidarDados('A', 'S S S S S S S', 13)+ ' ' +
    // 28 (tam. 03) - Qtde de uso diário
    ValidarDados('N', IntToStr(Round(FCdsPrincipal.FieldByName('QUANT_VALES').asFloat/
                              (FCdsPrincipal.FieldByName('NUM_DIAS_TRAB').asInteger+
                               FCdsPrincipal.FieldByName('DIASEXTRA').asInteger))), 3)+ ' ' +
    // 29 (tam. 03) - Qtde vales mensais (opcional)
    ValidarDados('A', '000', 3)+ ' ' +
    // 30 (tam. 1) - Tipo de Pedido
    'D '+
    // 31 (tam. 50) - Departamento do usuário (opcional)
    ValidarDados('A', ' ', 50);
end;

function TCtrlParamVTMagnetico.GerarRegistro_PedidoPasseCard(const ValVales: double): string;
begin
  Inc(FNumSequencia_PedidoCard);
  Result :=
    // 01 (01 até 05 / tam. 05) Código do Cliente
    ValidarDados('N', FloatToStr(FCodCliente), 5)+ ' ' +
    // 02 (07 até 16 / tam. 10) Data do Pedido
    ValidarDados('A', DateToStr(Date), 10)+ ' ' +
    // 03 (18 até 25 / tam. 08) - Número da matrícula do usuário
    ValidarDados('A', FCdsPrincipal.FieldByName('MATRICULA').asString, 8)+ ' ' +
    // 04 (27 até 29 / tam. 03) - Dias
    ValidarDados('N', IntToStr(FCdsPrincipal.FieldByName('NUM_DIAS_TRAB').asInteger+
                               FCdsPrincipal.FieldByName('DIASEXTRA').asInteger), 3)+ ' ' +
    // 05 (31 até 33 / tam. 03) - Vales Diários
    ValidarDados('N', IntToStr(Round(FCdsPrincipal.FieldByName('QUANT_VALES').asFloat/
                              (FCdsPrincipal.FieldByName('NUM_DIAS_TRAB').asInteger+
                               FCdsPrincipal.FieldByName('DIASEXTRA').asInteger))), 3)+ ' ' +
    // 06 (35 até 41 / tam. 07) - Valor da Carga
    copy(ValidarDados('V', Float2String(FCdsPrincipal.FieldByName('VALOR_COMPRA').asFloat), 6),1,4)+','+
    copy(ValidarDados('V', Float2String(FCdsPrincipal.FieldByName('VALOR_COMPRA').asFloat), 6),5,2)+' '+
    // 01 (43 até 47 / tam. 05) Nº de sequência do registro no meio
    ValidarDados('N', IntToStr(FNumSequencia_PedidoCard), 5);
end;

end.
