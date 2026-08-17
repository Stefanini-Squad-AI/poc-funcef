unit uCtrlArqTicket_SodexhoPASS;

interface

uses Classes, SysUtils, Controls, DB, DBClient, uCmControlObject, uCmDbObject, IvDictio,
  uCmClientDataSet, uCMTypes, uCtrlModeloArqTicket;

type
  TParModelo_SodexhoPASS = class(TParModeloArqTicket)
    TipoPedido: string;
    DataEntregaPedido: TDate;
    DataCredito: TDate;
    IdRespCentroCusto: double;
    IdRespReceb1: double;
    IdRespReceb2: double;
    IdRespReceb3: double;
    TipoProduto: string;
    FormaProduto: string;
    MensagemLinha1: string;
    MensagemLinha2: string;
    QuantTaloes_Pacotao: integer;
    QuantChequesTalao_Pacotao: integer;
  end;

  TCtrlArqTicket_SodexhoPASS = class(TCtrlModeloArqTicket)
  protected
    procedure IniciarProcessoArquivo; override;

    // Métodos de Geração dos registros do arquivo
    function GetRegistro_CabecalhoArquivo: string; override;
    function GetRegistro_Detalhe: string; override;
    function GetRegistro_RodapeArquivo: string; override;
  private
    FCdsEmpresa: TCMClientDataSet;
    FCdsResp: TCMClientDataSet;
    FCdsRespCentroCusto: TCMClientDataSet;
    FCdsRespReceb1: TCMClientDataSet;
    FCdsRespReceb2: TCMClientDataSet;
    FCdsRespReceb3: TCMClientDataSet;

    function GetInscrEstab(const Inscricao: string): string;
    function GetTituloLogradouro(const Logradouro: string): string;
    function GetParam: TParModelo_SodexhoPASS;

    function ListDadosEmpresa: OleVariant;
    function ListDadosResponsavel: OleVariant;
    function ListDadosRespRecebimento(const IdPessoa: double): OleVariant;
  public
    constructor Create(Param: TParModelo_SodexhoPASS); reintroduce;
    destructor  Destroy; override;
  end;

implementation

uses StrUtils, uCtrlFuncoesRH;

{ TCtrlArqTicket_SodexhoPASS }

constructor TCtrlArqTicket_SodexhoPASS.Create(Param: TParModelo_SodexhoPASS);
begin
  Param.AgrupamentoRegistros := tpEmpresaProp;
  Param.CalculaValores := true;

  inherited Create(TParModeloArqTicket(Param));
  
  FCdsEmpresa := TCMClientDataSet.Create(nil);
  FCdsResp := TCMClientDataSet.Create(nil);
  FCdsRespCentroCusto := TCMClientDataSet.Create(nil);
  FCdsRespReceb1 := TCMClientDataSet.Create(nil);
  FCdsRespReceb2 := TCMClientDataSet.Create(nil);
  FCdsRespReceb3 := TCMClientDataSet.Create(nil);
end;

destructor TCtrlArqTicket_SodexhoPASS.Destroy;
begin
  FCdsEmpresa.Free;
  FCdsResp.Free;
  FCdsRespCentroCusto.Free;
  FCdsRespReceb1.Free;
  FCdsRespReceb2.Free;
  FCdsRespReceb3.Free;
  inherited;
end;

function TCtrlArqTicket_SodexhoPASS.GetRegistro_CabecalhoArquivo: string;
begin
  // ******************************************
  // Registro Tipo 0 (Identificação da Empresa)
  // ******************************************
  Result :=
    // 01 (001 até 001 / tam. 01) - Tipo do Registro
    '0' +
    // 02 (002 até 007 / tam. 06) - Código da Empresa
    ValidarDados('A', GetParam.CodCliente, 6)+
    // 03 (008 até 047 / tam. 40) - Razão Social da Empresa
    ValidarDados('A', FCdsEmpresa.FieldByName('RAZAOSOCIAL').asString, 40)+
    // 04 (048 até 053 / tam. 06) - Número do Pedido do Cliente
    Replicate('0', 6)+
    // 05 (054 até 059 / tam. 06) - Mês de Referência
    FormatDateTime('MMYYYY', FParametros.DataIni)+
    // 06 (060 até 062 / tam. 03) - Administradora
    '005'+
    // 07 (063 até 065 / tam. 03) - Tipo de Pedido
    ValidarDados('A', GetParam.TipoPedido, 3)+
    // 08 (066 até 066 / tam. 01) - Montagem Unificada
    // 0 -> SIM
    // 1 -> NÃO
    '1'+
    // 09 (067 até 074 / tam. 08) - Data da Geração do Arquivo
    FormatDateTime('DDMMYYYY', Date)+
    // 10 (075 até 082 / tam. 08) - Data da Entrega do Pedido
    ValidarDados('N', FormatDateTime('DDMMYYYY', GetParam.DataEntregaPedido), 8)+
    // 11 (083 até 090 / tam. 08) - Data da Crédito do Cartão
    ValidarDados('N', FormatDateTime('DDMMYYYY', GetParam.DataCredito), 8)+
    // 12 (091 até 096 / tam. 06) - Número Sequencial do Arquivo
    Replicate('0', 6)+
    // 13 (097 até 098 / tam. 02) - Número da Versão do Arquivo
    Replicate('0', 2)+
    // 14 (099 até 128 / tam. 30) - Nome do Responsável pelo Arquivo
    ValidarDados('A', FCdsResp.FieldByName('NOME').asString, 30)+
    // 15 (129 até 208 / tam. 80) - E-Mail do Responsável pelo Arquivo
    ValidarDados('A', FCdsResp.FieldByName('EMAIL').asString, 80)+
    // 16 (209 até 212 / tam. 04) - DDD do Número do Telefone de Contato
    ValidarDados('A', FCdsEmpresa.FieldByName('DDD').asString, 04)+
    // 17 (213 até 224 / tam. 12) - Número do Telefone de Contato
    ValidarDados('A', FCdsEmpresa.FieldByName('TELEFONE').asString, 12)+
    // 18 (225 até 225 / tam. 01) - Categoria do Cliente
    // 0 -> Física
    // 1 -> Jurídica
    '1'+
    // 19 (226 até 239 / tam. 14) - CNPJ
    ValidarDados('A', FCdsResp.FieldByName('NUMDOCUMENTO').asString, 14)+
    // 20 (240 até 249 / tam. 10) - Nome do Usuário Login
    Replicate(' ', 10)+
    // 21 (250 até 259 / tam. 10) - Senha do Usuário Login
    Replicate(' ', 10)+
    // 22 (260 até 289 / tam. 30) - Versão do SIP
    Replicate(' ', 30)+
    // 23 (290 até 629 / tam. 340) - Filler
    Replicate(' ', 340);

  // ***************************************************
  // Registro Tipo 3 (Identificação do Local de Entrega)
  // ***************************************************
  Result := Result +CR_LF+
    // 01 (001 até 001 / tam. 01) - Tipo do Registro
    '3' +
    // 02 (002 até 007 / tam. 06) - Código da Filial (6 últimos dígitos do CNPJ)
    ValidarDados('N', GetInscrEstab(FCdsEmpresa.FieldByName('NUMDOCUMENTO').asString), 6)+
    // 03 (008 até 025 / tam. 18) - Código do Centro de Custo
    ValidarDados('A', FCdsRespCentroCusto.FieldByName('COD_CCUSTO').asString, 18)+
    // 04 (026 até 037 / tam. 12) - Brancos
    Replicate(' ', 12)+
    // 05 (038 até 067 / tam. 30) - Nome do Centro de Custo
    ValidarDados('A', FCdsRespCentroCusto.FieldByName('NOME_CCUSTO').asString, 30)+
    // 06 (068 até 077 / tam. 10) - Brancos
    Replicate(' ', 10)+
    // 07 (078 até 107 / tam. 30) - Nome do Responsável no Centro de Custo
    ValidarDados('A', FCdsRespCentroCusto.FieldByName('NOME').asString, 30)+
    // 08 (108 até 111 / tam. 4) - Brancos
    Replicate(' ', 4)+
    // 09 (112 até 117 / tam. 6) - Título do Logradouro
    ValidarDados('A', GetTituloLogradouro(FCdsEmpresa.FieldByName('LOGRADOURO').asString), 6)+
    // 10 (118 até 157 / tam. 40) - Logradouro
    ValidarDados('A', FCdsEmpresa.FieldByName('LOGRADOURO').asString, 40)+
    // 11 (158 até 165 / tam. 8) - Número
    ValidarDados('A', FCdsEmpresa.FieldByName('NUMERO').asString, 8)+
    // 12 (166 até 185 / tam. 20) - Complemento
    ValidarDados('A', FCdsEmpresa.FieldByName('COMPLEMENTO').asString, 20)+
    // 13 (186 até 205 / tam. 20) - Bairro
    ValidarDados('A', FCdsEmpresa.FieldByName('BAIRRO').asString, 20)+
    // 14 (206 até 235 / tam. 30) - Cidade
    ValidarDados('A', FCdsEmpresa.FieldByName('CIDADE').asString, 30)+
    // 15 (236 até 237 / tam. 2) - UF
    ValidarDados('A', FCdsEmpresa.FieldByName('UF').asString, 2)+
    // 16 (238 até 245 / tam. 9) - CEP
    ValidarDados('N', FCdsEmpresa.FieldByName('CEP').asString, 8)+
    // 17 (246 até 248 / tam. 3) - Produto/Serviço
    ValidarDados('N', GetParam.TipoProduto, 3)+
    // 18 (249 até 251 / tam. 3) - Forma do Produto/Serviço
    ValidarDados('N', GetParam.FormaProduto, 3)+
    // 19 (252 até 256 / tam. 5) - Quantidade de Talões (Usado quando na opção PACOTAO)
    ValidarDados('N', IntToStr(GetParam.QuantTaloes_Pacotao), 5)+
    // 20 (257 até 258 / tam. 2) - Quantidade de Cheques por Talão (Usado quando na opção PACOTAO)
    ValidarDados('N', IntToStr(GetParam.QuantChequesTalao_Pacotao), 2)+
    // 21 (259 até 270 / tam. 12) - Valor Facial/Crédito
    ValidarDados('N',
      IFF(GetParam.QuantTaloes_Pacotao>0, Float2String(GetParam.ValorTicket), '0'), 12)+
    // 22 (271 até 274 / tam. 4) - Quantidade de Passes
    Replicate('0', 4)+
    // 23 (275 até 277 / tam. 3) - Empresa de Transporte
    Replicate('0', 3)+
    // 24 (278 até 281 / tam. 4) - Código do Bilhete/Linha
    Replicate('0', 4)+
    // 25 (282 até 293 / tam. 12) - RG do Responsável no Centro de Custo
    ValidarDados('A', FCdsRespCentroCusto.FieldByName('NUMDOCUMENTO').asString, 12)+
    // 26 (294 até 323 / tam. 30) - Nome do 1º Responsável pelo Recebimento
    ValidarDados('A', FCdsRespReceb1.FieldByName('NOME').asString, 30)+
    // 27 (324 até 353 / tam. 30) - Nome do 2º Responsável pelo Recebimento
    ValidarDados('A', FCdsRespReceb2.FieldByName('NOME').asString, 30)+
    // 28 (354 até 383 / tam. 30) - Nome do 3º Responsável pelo Recebimento
    ValidarDados('A', FCdsRespReceb3.FieldByName('NOME').asString, 30)+
    // 29 (384 até 395 / tam. 12) - RG do 1º Responsável pelo Recebimento
    ValidarDados('A', FCdsRespReceb1.FieldByName('NUMDOCUMENTO').asString, 12)+
    // 30 (396 até 407 / tam. 12) - RG do 2º Responsável pelo Recebimento
    ValidarDados('A', FCdsRespReceb2.FieldByName('NUMDOCUMENTO').asString, 12)+
    // 31 (408 até 419 / tam. 12) - RG do 3º Responsável pelo Recebimento
    ValidarDados('A', FCdsRespReceb3.FieldByName('NUMDOCUMENTO').asString, 12)+
    // 32 (420 até 449 / tam. 30) - Código do Centro de Custo do 1º Responsável pelo Recebimento
    ValidarDados('A', FCdsRespReceb1.FieldByName('COD_CCUSTO').asString, 30)+
    // 33 (450 até 479 / tam. 30) - Código do Centro de Custo do 2º Responsável pelo Recebimento
    ValidarDados('A', FCdsRespReceb2.FieldByName('COD_CCUSTO').asString, 30)+
    // 34 (480 até 509 / tam. 30) - Código do Centro de Custo do 3º Responsável pelo Recebimento
    ValidarDados('A', FCdsRespReceb3.FieldByName('COD_CCUSTO').asString, 30)+
    // 35 (510 até 549 / tam. 40) - Nome do Centro de Custo do 1º Responsável pelo Recebimento
    ValidarDados('A', FCdsRespReceb1.FieldByName('NOME_CCUSTO').asString, 40)+
    // 36 (550 até 589 / tam. 40) - Nome do Centro de Custo do 2º Responsável pelo Recebimento
    ValidarDados('A', FCdsRespReceb2.FieldByName('NOME_CCUSTO').asString, 40)+
    // 37 (590 até 629 / tam. 40) - Nome do Centro de Custo do 3º Responsável pelo Recebimento
    ValidarDados('A', FCdsRespReceb3.FieldByName('NOME_CCUSTO').asString, 40)+
    // 38 (630 até 659 / tam. 30) - Mensagem Chequinho (Linha 1)
    ValidarDados('A', GetParam.MensagemLinha1, 30)+
    // 39 (660 até 689 / tam. 30) - Mensagem Chequinho (Linha 2)
    ValidarDados('A', GetParam.MensagemLinha2, 30);
end;

function TCtrlArqTicket_SodexhoPASS.GetRegistro_Detalhe: string;
var
  dValorFacial: double;
  iQuantCheques: integer;
begin
  // *****************************************
  // Registro Tipo 4 (Identificação da Pessoa)
  // *****************************************

  if (GetParam.FormaProduto = '001') then
  begin
    iQuantCheques := FCdsPrincipal.FieldByName('QUANT_TICKETS').asInteger;
    dValorFacial := GetParam.ValorTicket;
  end
  else
  begin
    iQuantCheques := 1;
    dValorFacial := FCdsPrincipal.FieldByName('VALOR_COMPRA').asFloat;
  end;

  if (iQuantCheques <= 0) then
  begin
    IncProgresso(0, 1);
    Result := '';
    exit;
  end;

  FValorTotal := FValorTotal + (dValorFacial * iQuantCheques);

  // Atualização dos valores do Centro de Custo
  AtualizarValorCCusto(
    FCdsPrincipal.FieldByName('COD_CCUSTO').asString, dValorFacial * iQuantCheques);

  if (GetParam.QuantTaloes_Pacotao = 0) then
    Result :=
      // 01 (001 até 001 / tam. 01) - Tipo do Registro
      '4' +
      // 02 (002 até 007 / tam. 06) - Código da Filial (6 últimos dígitos do CNPJ)
      ValidarDados('N', GetInscrEstab(FCdsPrincipal.FieldByName('INSCR_ESTAB').asString), 6)+
      // 03 (008 até 025 / tam. 18) - Código do Centro de Custo
      ValidarDados('A', FCdsRespReceb1.FieldByName('COD_CCUSTO').asString, 18)+
      // 04 (026 até 037 / tam. 12) - Brancos
      Replicate('0', 12)+
      // 05 (038 até 047 / tam. 10) - Matrícula
      ValidarDados('A', FCdsPrincipal.FieldByName('MATRICULA').asString, 10)+
      // 06 (048 até 087 / tam. 40) - Nome
      ValidarDados('A', FCdsPrincipal.FieldByName('NOME').asString, 40)+
      // 07 (088 até 088 / tam. 1) - 1->Titular; 2->Dependente
      '1'+
      // 08 (089 até 096 / tam. 8) - Data de Nascimento
      FormatDateTime('DDMMYYYY', FCdsPrincipal.FieldByName('DATANASC').asDateTime)+
      // 09 (097 até 107 / tam. 11) - CPF
      ValidarDados('N', FCdsPrincipal.FieldByName('CPF').asString, 11)+
      // 10 (108 até 108 / tam. 1) - Brancos
      Replicate('0', 1)+
      // 11 (109 até 111 / tam. 3) - Produto/Serviço
      ValidarDados('N', GetParam.TipoProduto, 3)+
      // 12 (112 até 114 / tam. 3) - Forma do Produto/Serviço
      ValidarDados('N', GetParam.FormaProduto, 3)+
      // 13 (115 até 119 / tam. 5) - Quantidade de Talões
      ValidarDados('N', '1', 5)+
      // 14 (120 até 121 / tam. 2) - Quantidade de Cheques por Talão
      ValidarDados('N', IntToStr(iQuantCheques), 2)+
      // 15 (122 até 133 / tam. 12) - Valor Facial/Crédito
      ValidarDados('N', Float2String(dValorFacial), 12)+
      // 16 (134 até 137 / tam. 4) - Quantidade de Passes por Dia
      Replicate('0', 4)+
      // 17 (138 até 140 / tam. 3) - Quantidade de Dias Úteis
      Replicate('0', 3)+
      // 18 (141 até 143 / tam. 3) - Empresa de Transporte
      Replicate('0', 3)+
      // 19 (144 até 147 / tam. 4) - Código do Bilhete/Linha
      Replicate('0', 4)+
      // 20 (148 até 171 / tam. 24) - Nome da Pessoa (Gravado no Cartão)
      ValidarDados('A', AbreviaNome(24, FCdsPrincipal.FieldByName('NOME').asString), 24)+
      // 21 (172 até 241 / tam. 70) - Cargo
      ValidarDados('A', FCdsPrincipal.FieldByName('CARGO').asString, 70)+
      // 22 (242 até 629 / tam. 388) - Brancos
      Replicate(' ', 388);

  IncProgresso(0, 1);
end;

function TCtrlArqTicket_SodexhoPASS.GetRegistro_RodapeArquivo: string;
begin
  Result := Replicate('0', 50);
end;

procedure TCtrlArqTicket_SodexhoPASS.IniciarProcessoArquivo;
begin
  inherited;
  FCdsEmpresa.Data := ListDadosEmpresa;
  FCdsResp.Data := ListDadosResponsavel;
  FCdsRespCentroCusto.Data := ListDadosRespRecebimento(GetParam.IdRespCentroCusto);
  FCdsRespReceb1.Data := ListDadosRespRecebimento(GetParam.IdRespReceb1);
  FCdsRespReceb2.Data := ListDadosRespRecebimento(GetParam.IdRespReceb2);
  FCdsRespReceb3.Data := ListDadosRespRecebimento(GetParam.IdRespReceb3);
end;

function TCtrlArqTicket_SodexhoPASS.GetInscrEstab(const Inscricao: string): string;
begin
  // Pegar os últimos 6 caracteres da Inscrição
  Result := RightStr(Inscricao, 6);
end;

function TCtrlArqTicket_SodexhoPASS.GetTituloLogradouro(const Logradouro: string): string;
var
  iPos: byte;
begin
  // Pegar a primeira palavra da String. Assumindo que esta conterá o Tipo do Logradouro
  iPos := Pos(' ', Logradouro);
  if (iPos > 1) then
    Result := Copy(Logradouro, 1, iPos-1)
  else
    Result := '';
end;

function TCtrlArqTicket_SodexhoPASS.GetParam: TParModelo_SodexhoPASS;
begin
  Result := TParModelo_SodexhoPASS(FParametros);
end;

function TCtrlArqTicket_SodexhoPASS.ListDadosEmpresa: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  P.RAZAOSOCIAL, P.NUMDOCUMENTO,' +CR_LF+
    '  TEL.DDD, TEL.NUMERO AS TELEFONE,' +CR_LF+
    '  EP.LOGRADOURO, EP.NUMERO, EP.COMPLEMENTO, EP.BAIRRO, EP.CEP,' +CR_LF+
    '  CI.NOME AS CIDADE, ES.CODESTADO AS UF' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA P, ENDPESS EP, ESTADO ES, CIDADES CI,' +CR_LF+
    // -------------------------------------------------------------------------- //
    // Telefone do Estabelecimento
    '  (SELECT TE.IDENDERECO, TE.DDD, TE.NUMERO' +CR_LF+
    '   FROM' +CR_LF+
    '     TELENDPESS TE,' +CR_LF+
    '     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO' +CR_LF+
    '      FROM     TELENDPESS' +CR_LF+
    '      GROUP BY IDENDERECO) ENDER' +CR_LF+
    '   WHERE' +CR_LF+
    '     (ENDER.IDTELEFONE = TE.IDTELEFONE)) TEL' +CR_LF+
    // -------------------------------------------------------------------------- //
    'WHERE' +CR_LF+
    '  (P.IDPESSOA       = ' +IntToStr(GetParam.IdEmpresa)+ ') AND' +CR_LF+
    '  (P.IDPESSOA       = EP.IDPESSOA) AND' +CR_LF+
    '  (P.IDENDCOMERCIAL = EP.IDENDERECO) AND' +CR_LF+
    '  (EP.IDENDERECO    = TEL.IDENDERECO) AND' +CR_LF+
    '  (EP.IDCIDADES     = CI.IDCIDADES) AND' +CR_LF+
    '  (CI.IDESTADO      = ES.IDESTADO)');
end;

function TCtrlArqTicket_SodexhoPASS.ListDadosResponsavel: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  NOME, NUMDOCUMENTO, EMAIL' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA' +CR_LF+
    'WHERE' +CR_LF+
    '  (IDPESSOA = ' +IntToStr(GetParam.IdEmpresa)+ ')');
end;

function TCtrlArqTicket_SodexhoPASS.ListDadosRespRecebimento(const IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  P.NOME, P.NUMDOCUMENTO,' +CR_LF+
    '  CC.CODCENTROCUSTO AS COD_CCUSTO, CC.NOME AS NOME_CCUSTO' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA P, FUNCIONARIO F, CENTCUST CC' +CR_LF+
    'WHERE' +CR_LF+
    '  (F.IDPESSOA       = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    '  (F.IDPESSOA       = P.IDPESSOA) AND' +CR_LF+
    '  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND' +CR_LF+
    '  (F.IDEMPRESA      = CC.IDEMPRESA)');
end;

end.
