unit uCtrlArq_SodexhoPASS;

interface

uses Classes, SysUtils, Controls, DB, DBClient, uCmControlObject, uCmDbObject, IvDictio,
  uCmClientDataSet, uCMTypes, uCtrlModeloArqTransp, uCtrlListTerceirosRH;

type
  TCtrlArq_SodexhoPASS = class(TCtrlModeloArqTransp)
  protected
    procedure DoChangeDataBase; override;
    procedure AfterInitialize; override;

    // Métodos de Geração dos registros do arquivo
    function GetRegistro_CabecalhoArquivo: string; override;
    function GetRegistro_CabecalhoEstab: string; override;
    function GetRegistro_Detalhe: string; override;
    function GetRegistro_RodapeArquivo: string; override;

    procedure IniciarProcessoArquivo; override;
  private
    FCtrlListTerceirosRH: TCtrlListTerceirosRH;

    FCdsCCusto: TCMClientDataSet;
    FCdsResp: TCMClientDataSet;
    FCdsRespReceb1: TCMClientDataSet;
    FCdsRespReceb2: TCMClientDataSet;
    FCdsRespReceb3: TCMClientDataSet;

    FCodCliente: string;
    FNumPedido: integer;
    FCodCCusto: string;
    FDataEntrega: TDate;
    FDataCredito: TDate;
    FIdResp: double;
    FIdRespReceb1: double;
    FIdRespReceb2: double;
    FIdRespReceb3: double;

    function ListPessoa(const IdPessoa: double): OleVariant;
  public
    constructor Create(const GerarAP: boolean; const CodCliente: string;
      const NumPedido: integer; const CodCCusto: string; const DataEntrega,
      DataCredito: TDate; const IdResp, IdRespReceb1, IdRespReceb2,
      IdRespReceb3: double); reintroduce;
    destructor  Destroy; override;
  end;

implementation

uses uCtrlFuncoesRH;

{ TCtrlArq_SodexhoPASS }

constructor TCtrlArq_SodexhoPASS.Create(const GerarAP: boolean; const CodCliente: string;
  const NumPedido: integer; const CodCCusto: string; const DataEntrega, DataCredito: TDate;
  const IdResp, IdRespReceb1, IdRespReceb2, IdRespReceb3: double);
begin
  inherited Create(GerarAP, false);
  FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create('', '', '');

  FCdsCCusto := TCMClientDataSet.Create(nil);
  FCdsResp := TCMClientDataSet.Create(nil);
  FCdsRespReceb1 := TCMClientDataSet.Create(nil);
  FCdsRespReceb2 := TCMClientDataSet.Create(nil);
  FCdsRespReceb3 := TCMClientDataSet.Create(nil);

  FCodCliente := CodCliente;
  FNumPedido := NumPedido;
  FCodCCusto := CodCCusto;
  FDataEntrega := DataEntrega;
  FDataCredito := DataCredito;
  FIdResp := IdResp;
  FIdRespReceb1 := IdRespReceb1;
  FIdRespReceb2 := IdRespReceb2;
  FIdRespReceb3 := IdRespReceb3;
end;

destructor TCtrlArq_SodexhoPASS.Destroy;
begin
  inherited;
  FCdsCCusto.Free;
  FCdsResp.Free;
  FCdsRespReceb1.Free;
  FCdsRespReceb2.Free;
  FCdsRespReceb3.Free;

  FCtrlListTerceirosRH.Free;
end;

procedure TCtrlArq_SodexhoPASS.AfterInitialize;
begin
  inherited;
  FCtrlListTerceirosRH.InitializeAs(Self);
end;

procedure TCtrlArq_SodexhoPASS.DoChangeDataBase;
begin
  inherited;
  FCtrlListTerceirosRH.DataBaseName := DataBaseName;
end;

function TCtrlArq_SodexhoPASS.ListPessoa(const IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  P.IDPESSOA, P.NOME, RG.NUM AS RG,' +CR_LF+
    '  CC.CODCENTROCUSTO AS COD_CCUSTO, CC.NOME AS NOME_CCUSTO' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA P, FUNCIONARIO F, CENTCUST CC,' +CR_LF+
    '  (SELECT DP.IDPESSOA, TDP.MASCARA, RTRIM(DP.NUMDOCUMENTO) AS NUM' +CR_LF+
    '   FROM   DOCPESSOA DP, TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO' +CR_LF+
    '   WHERE (TDO.SIGLADOCUMENTO = ''RG:'') AND' +CR_LF+
    '         (TDO.IDDOCUMENTO    = TDP.IDDOCUMENTO) AND' +CR_LF+
    '         (TDP.IDDOCUMENTO    = DP.IDDOCUMENTO)) RG' +CR_LF+
    'WHERE' +CR_LF+
    '  (F.IDPESSOA       = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    '  (F.IDPESSOA       = RG.IDPESSOA) AND' +CR_LF+
    '  (F.IDPESSOA       = P.IDPESSOA) AND' +CR_LF+
    '  (F.IDEMPRESA      = CC.IDEMPRESA) AND' +CR_LF+
    '  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO)');
end;

function TCtrlArq_SodexhoPASS.GetRegistro_CabecalhoArquivo: string;
begin
  // ******************************************
  // Registro Tipo 0 (Identificação da Empresa)
  // ******************************************
  Result :=
    // 01 (001 até 001 / tam. 001) Tipo do registro
    '0'+
    // 02 (002 até 009 / tam. 008) Código do cliente
    ValidarDados('A', FCodCliente, 8, '0', 'D')+
    // 03 (010 até 049 / tam. 040) Razão social do Estabelecimento
    Replicate(' ', 40)+
    // 04 (050 até 055 / tam. 006) Número do Pedido (Controle do Cliente)
    Replicate('0', 6)+
    // 05 (056 até 061 / tam. 006) Mes de referência
    FormatDateTime('MMYYYY', FDataInicial)+
    // 06 (062 até 064 / tam. 003) Administradora
    '005'+ // Sodexho Pass
    // 07 (066 até 067 / tam. 003) Tipo do Pedido
    '001'+ // Pedido Normal
    // 08 (068 até 068 / tam. 001) Brancos
    ' '+
    // 09 (069 até 076 / tam. 008) Data da Geração do Arquivo
    FormatDateTime('DDMMYYYY', Date)+
    // 10 (077 até 084 / tam. 008) Data de Entrega do Pedido
    FormatDateTime('DDMMYYYY', FDataEntrega)+
    // 11 (085 até 092 / tam. 008) Data para Crédito no Cartão
    FormatDateTime('DDMMYYYY', FDataCredito)+
    // 12 (093 até 098 / tam. 006) Número Sequencial do Arquivo
    ValidarDados('N', IntToStr(FNumPedido), 6)+
    // 13 (099 até 100 / tam. 002) Nº de versão (Controle do Cliente)
    '01'+ // Versão 1.0
    // 14 (101 até 629 / tam. 529) Brancos
    Replicate('0', 529);
end;

function TCtrlArq_SodexhoPASS.GetRegistro_CabecalhoEstab: string;
begin
  // ***************************************************
  // Registro Tipo 3 (Identificação do Local de Entrega)
  // ***************************************************
  Result :=
    // 01 (001 até 001 / tam. 001) Tipo do registro
    '3'+
    // 02 (001 até 007 / tam. 006) Brancos
    Replicate(' ', 6)+
    // 03 (008 até 025 / tam. 018) Código do Centro de Custo
    ValidarDados('A', FCdsCCusto.FieldByName('CODCENTROCUSTO').asString, 18)+
    // 04 (026 até 037 / tam. 012) Brancos
    Replicate(' ', 12)+
    // 05 (038 até 072 / tam. 035) Nome do Centro de Custo
    ValidarDados('A', FCdsCCusto.FieldByName('NOME').asString, 35)+
    // 06 (073 até 077 / tam. 005) Brancos
    Replicate(' ', 5)+
    // 07 (078 até 097 / tam. 020) Nome de responsável pelo Centro de Custo
    ValidarDados('A', FCdsResp.FieldByName('NOME').asString, 20)+
    // 08 (098 até 111 / tam. 014) Brancos
    Replicate(' ', 14)+
    // 09 (112 até 117 / tam. 006) Tipo de Logradouro
    Replicate(' ', 6)+
    // 10 (118 até 157 / tam. 045) Logradouro
    ValidarDados('A', FCdsPrincipal.FieldByName('LOGRADOURO_ESTAB').asString, 40)+
    // 11 (158 até 165 / tam. 008) Número
    ValidarDados('A', FCdsPrincipal.FieldByName('NUMERO_ESTAB').asString, 8)+
    // 12 (166 até 185 / tam. 020) Complemento
    ValidarDados('A', FCdsPrincipal.FieldByName('COMPLEMENTO_ESTAB').asString, 20)+
    // 13 (186 até 200 / tam. 015) Bairro
    ValidarDados('A', FCdsPrincipal.FieldByName('BAIRRO_ESTAB').asString, 15)+
    // 14 (201 até 205 / tam. 005) Brancos
    Replicate(' ', 5)+
    // 15 (206 até 225 / tam. 020) Cidade
    ValidarDados('A', FCdsPrincipal.FieldByName('CIDADE_ESTAB').asString, 20)+
    // 16 (226 até 235 / tam. 010) Brancos
    Replicate(' ', 10)+
    // 17 (236 até 237 / tam. 002) UF
    ValidarDados('A', FCdsPrincipal.FieldByName('UF_ESTAB').asString, 2)+
    // 18 (238 até 245 / tam. 008) CEP
    ValidarDados('N', FCdsPrincipal.FieldByName('CEP_ESTAB').asString, 8)+
    // 19 (246 até 281 / tam. 036) Brancos
    Replicate(' ', 36)+
    // 20 (282 até 293 / tam. 012) - RG do Responsável pelo Centro de Custo
    ValidarDados('N', FCdsResp.FieldByName('RG').asString, 12, ' ')+
    // 21 (294 até 313 / tam. 020) - Nome do 1º Responsável pelo Recebimento
    ValidarDados('A', FCdsRespReceb1.FieldByName('NOME').asString, 20)+
    // 22 (314 até 323 / tam. 010) Brancos
    Replicate(' ', 10)+
    // 23 (324 até 343 / tam. 020) - Nome do 2º Responsável pelo Recebimento
    ValidarDados('A', FCdsRespReceb2.FieldByName('NOME').asString, 20)+
    // 24 (344 até 353 / tam. 010) Brancos
    Replicate(' ', 10)+
    // 25 (354 até 373 / tam. 020) - Nome do Responsável pelo Recebimento
    ValidarDados('A', FCdsRespReceb3.FieldByName('NOME').asString, 20)+
    // 26 (374 até 383 / tam. 010) Brancos
    Replicate(' ', 10)+
    // 27 (384 até 395 / tam. 012) - RG do 1º Responsável pelo Recebimento
    ValidarDados('N', FCdsRespReceb1.FieldByName('RG').asString, 12, ' ')+
    // 28 (396 até 407 / tam. 012) - RG do 2º Responsável pelo Recebimento
    ValidarDados('N', FCdsRespReceb2.FieldByName('RG').asString, 12, ' ')+
    // 29 (408 até 419 / tam. 012) - RG do 3º Responsável pelo Recebimento
    ValidarDados('N', FCdsRespReceb3.FieldByName('RG').asString, 12, ' ')+
    // 30 (420 até 437 / tam. 18) - Código do Centro de Custo do 1º Responsável pelo Recebimento
    ValidarDados('A', FCdsRespReceb1.FieldByName('COD_CCUSTO').asString, 18)+
    // 31 (438 até 449 / tam. 012) Brancos
    Replicate(' ', 12)+
    // 32 (450 até 467 / tam. 18) - Código do Centro de Custo do 2º Responsável pelo Recebimento
    ValidarDados('A', FCdsRespReceb2.FieldByName('COD_CCUSTO').asString, 18)+
    // 33 (468 até 479 / tam. 012) Brancos
    Replicate(' ', 12)+
    // 34 (480 até 497 / tam. 18) - Código do Centro de Custo do 3º Responsável pelo Recebimento
    ValidarDados('A', FCdsRespReceb3.FieldByName('COD_CCUSTO').asString, 18)+
    // 35 (498 até 509 / tam. 012) Brancos
    Replicate(' ', 12)+
    // 36 (510 até 544 / tam. 35) - Nome do Centro de Custo do 1º Responsável pelo Recebimento
    ValidarDados('A', FCdsRespReceb1.FieldByName('NOME_CCUSTO').asString, 35)+
    // 37 (545 até 549 / tam. 005) Brancos
    Replicate(' ', 5)+
    // 38 (550 até 584 / tam. 35) - Nome do Centro de Custo do 2º Responsável pelo Recebimento
    ValidarDados('A', FCdsRespReceb2.FieldByName('NOME_CCUSTO').asString, 35)+
    // 39 (585 até 589 / tam. 005) Brancos
    Replicate(' ', 5)+
    // 40 (590 até 624 / tam. 35) - Nome do Centro de Custo do 3º Responsável pelo Recebimento
    ValidarDados('A', FCdsRespReceb3.FieldByName('NOME_CCUSTO').asString, 35)+
    // 41 (625 até 629 / tam. 005) Brancos
    Replicate(' ', 5);
end;

function TCtrlArq_SodexhoPASS.GetRegistro_Detalhe: string;
begin
  // *****************************************
  // Registro Tipo 4 (Identificação da Pessoa)
  // *****************************************
  repeat
    Result :=
      // 01 (001 até 001 / tam. 001) Tipo do registro
      '4'+
      // 02 (002 até 026 / tam. 025) Brancos
      Replicate(' ', 25)+
      Replicate(' ', 11)+
      // 03 (038 até 047 / tam. 010) Matrícula
      ValidarDados('A', FCdsPrincipal.FieldByName('MATRICULA').asString, 10)+
      // 04 (048 até 087 / tam. 040) - Nome
      ValidarDados('A', FCdsPrincipal.FieldByName('FUNCIONARIO').asString, 40)+
      // 05 (088 até 088 / tam. 001) Brancos
      ' '+
      // 06 (089 até 096 / tam. 008) - Data de Nascimento
      FormatDateTime('DDMMYYYY', FCdsPrincipal.FieldByName('DATANASC').asDateTime)+
      // 07 (097 até 107 / tam. 011) - CPF
      ValidarDados('N', FCdsPrincipal.FieldByName('CPF').asString, 11)+
      // 08 (108 até 108 / tam. 001) - Sexo
      ValidarDados('A', FCdsPrincipal.FieldByName('SEXO').asString, 1)+
      // 09 (109 até 111 / tam. 003) - Produto
      '007'+ // Vale Transporte
      // 10 (112 até 114 / tam. 003) - Forma
      '002'+ // Cartão Smart
      // 11 (115 até 119 / tam. 005) - Quantidade de Talões
      Replicate('0', 5)+
      // 12 (120 até 121 / tam. 002) - Quantidade de Cheques por Talão
      Replicate('0', 2)+
      // 13 (122 até 133 / tam. 012) - Valor facial
      Replicate('0', 12)+
      // 14 (134 até 137 / tam. 004) - Quantidade de Passes por Dia
      fValidaDados('N', FloatToStr(Arredondar(FCdsPrincipal.FieldByName('QTDE_VALES').asFloat,0)), 4)+
      // 15 (138 até 140 / tam. 003) - Quantidade de Dias Úteis
      fValidaDados('N', FCdsPrincipal.FieldByName('NUM_DIAS_TRAB').asString, 3)+
      // 16 (141 até 143 / tam. 003) - Código da Empresa de Transporte
      fValidaDados('N', FCdsPrincipal.FieldByName('COD_EMPRESA_TRANSP').asString, 3)+
      // 17 (144 até 147 / tam. 004) - Código da Linha
      fValidaDados('N', FCdsPrincipal.FieldByName('NUMLINHA').asString, 4)+
      // 18 (148 até 171 / tam. 024) - Nome da Pessoa (Gravado no Cartão)
      Replicate(' ', 24)+
      //ValidarDados('A', AbreviaNome(24, FCdsPrincipal.FieldByName('FUNCIONARIO').asString), 24)+
      // 19 (172 até 241 / tam. 070) - Brancos
      Replicate(' ', 70)+
      // 20 (242 até 251 / tam. 010) - RG
      ValidarDados('N', FCdsPrincipal.FieldByName('RG').asString, 10, ' ')+
      // 21 (252 até 253 / tam. 002) - Dígito do RG
      Replicate(' ', 2)+
      // 22 (254 até 255 / tam. 002) - UF do RG
      ValidarDados('N', FCdsPrincipal.FieldByName('ORGAO').asString, 2, ' ')+
      // 23 (256 até 263 / tam. 008) - Data da Emissão do RG
      FormatDateTime('DDMMYYYY', FCdsPrincipal.FieldByName('DATAEMISSAO').asDateTime)+
      // 24 (264 até 629 / tam. 366) Brancos
      Replicate(' ', 366);

    // Atualização dos valores do Centro de Custo
    AtualizarValorCCusto(
      FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString,
      FCdsPrincipal.FieldByName('VALOR_COMPRA').asFloat);

    // Posicionar no último registro da linha de transporte
    IrProxLinhaTransp;
  until (FIdPessoa <> FCdsPrincipal.FieldByName('IDPESSOA').asString) or (FCdsPrincipal.EOF);
end;

function TCtrlArq_SodexhoPASS.GetRegistro_RodapeArquivo: string;
begin
  Result :=
    // 01 (001 até 001 / tam. 001) Tipo do registro
    '9'+
    // 02 (002 até 629 / tam. 628) Brancos
    Replicate(' ', 628);
end;

procedure TCtrlArq_SodexhoPASS.IniciarProcessoArquivo;
begin
  inherited;
  FCdsCCusto.Data := FCtrlListTerceirosRH.ListCCusto(IntToStr(FIdEmpresa), FCodCCusto);
  FCdsResp.Data := ListPessoa(FIdResp);
  FCdsRespReceb1.Data := ListPessoa(FIdRespReceb1);
  FCdsRespReceb2.Data := ListPessoa(FIdRespReceb2);
  FCdsRespReceb3.Data := ListPessoa(FIdRespReceb3);
end;

end.
