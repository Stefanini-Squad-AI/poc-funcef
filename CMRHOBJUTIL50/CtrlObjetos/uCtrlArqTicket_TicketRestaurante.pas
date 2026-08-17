unit uCtrlArqTicket_TicketRestaurante;

interface

uses Classes, SysUtils, Controls, DB, DBClient, uCmControlObject, uCmDbObject, IvDictio,
  uCmClientDataSet, uCMTypes, uCtrlModeloArqTicket;

type
  TTipoPoduto = (tpRefeicaoPapel, tpRefeicaoEletronico, tpAlimentacaoEletronico);

  TPedidoSuplementar = record
    Gerar: boolean;
    IdUnidEntrega: double;
    Quant: word;
    Acabamento: byte;
    Blocagem: byte;
  end;

  TPapel = record
    ReceberRelatAssinaturas: boolean;
    ReceberRelatGerencial: boolean;
    ReceberRelatResUnid: boolean;
    LinhaPersonalizacaoTicket2: byte;
    LinhaPersonalizacaoRotulo1: byte;
    LinhaPersonalizacaoRotulo2: byte;
    ReciboEncarte: char;
    DataEntregaPedido: TDate;     
    Acabamento: byte;
    Blocagem: byte;
    PedidoSuplementar: TPedidoSuplementar;
  end;

  TEletronico = record
    TipoProduto: string;
    TipoCartao: byte;
    DataLiberacaoPedido: TDate;
  end;

  TParModelo_TicketRestaurante = class(TParModeloArqTicket)
    NomeUsuario: string;
    TipoPoduto: TTipoPoduto;
    IdResponsavel: double;
    ListaIdUnidEntrega: string;
    CodUnidEntrega: string;
    Papel: TPapel;
    Eletronico: TEletronico;
  end;

  TCtrlArqTicket_TicketRestaurante = class(TCtrlModeloArqTicket)
  protected
    procedure IniciarProcessoArquivo; override;

    // Métodos de Geração dos registros do arquivo
    function GetRegistro_CabecalhoArquivo: string; override;
    function GetRegistro_HeaderProduto: string;
    function GetRegistro_Suplementar: string;
    function GetRegistro_Cabecalho_GrupoCustomizado: string; override;
    function GetRegistro_Detalhe: string; override;
    function GetRegistro_RodapeProduto: string;
    function GetRegistro_RodapeArquivo: string; override;

    function  ContinuaLoopGrupoCustomizado: boolean; override;
    procedure FiltraGrupoCustomizado; override;
  private
    FCdsUnidEntrega: TCMClientDataSet;
    FCdsResp: TCMClientDataSet;
    FCdsUnidEntregaPedSupl: TCMClientDataSet;

    FNumRegHeader: integer;
    FNumRegTrailler: integer;
    FQuantPessoas: integer;
    FListaIdEstab: string;

    function GetTituloLogradouro(const Logradouro: string): string;
    function GetParam: TParModelo_TicketRestaurante;

    function ListDadosUnidEntrega: OleVariant;
    function ListDadosResponsavel: OleVariant;
    function ListUnidadeEntrega(const IdPessoa: double): OleVariant;
  public
    constructor Create(Param: TParModelo_TicketRestaurante); reintroduce;
    destructor  Destroy; override;
  end;

implementation

uses StrUtils, uCtrlFuncoesRH;

{ TCtrlArqTicket_TicketRestaurante }

constructor TCtrlArqTicket_TicketRestaurante.Create(Param: TParModelo_TicketRestaurante);
begin
  Param.AgrupamentoRegistros := tpCustomizado;
  Param.CalculaValores := true;
  
  inherited Create(TParModeloArqTicket(Param));

  FCdsUnidEntrega := TCMClientDataSet.Create(nil);
  FCdsResp := TCMClientDataSet.Create(nil);
  FCdsUnidEntregaPedSupl := TCMClientDataSet.Create(nil);
end;

destructor TCtrlArqTicket_TicketRestaurante.Destroy;
begin
  FCdsUnidEntrega.Free;
  FCdsResp.Free;
  FCdsUnidEntregaPedSupl.Free;
  inherited;
end;

function TCtrlArqTicket_TicketRestaurante.ContinuaLoopGrupoCustomizado: boolean;
begin
  if (GetParam.ListaIdUnidEntrega = '-1') then
    Result := (FListaIdEstab <> '')
  else
    Result := not(FCdsPrincipal.EOF);
end;

procedure TCtrlArqTicket_TicketRestaurante.FiltraGrupoCustomizado;
begin
  if (GetParam.ListaIdUnidEntrega = '-1') then
  begin
    // Obter o estabelecimento atual
    ExtraiString(FListaIdEstab, FIdEstab, ',');

    FCdsUnidEntrega.Locate('IDPESSOA', FIdEstab, []);

    FCdsPrincipal.Filtered := false;
    FCdsPrincipal.Filter := FFiltroCdsPrincipal + ' AND IDESTAB = ' + FIdEstab;
    FCdsPrincipal.Filtered := true;
  end;
end;

function TCtrlArqTicket_TicketRestaurante.GetRegistro_CabecalhoArquivo: string;
begin
  // **************************
  // Registro Header do Arquivo
  // **************************
  Result :=
    // 01 (001 até 005 / tam. 05) - Tipo do Registro
    'LSUP5' +
    // 02 (006 até 013 / tam. 08) - Usuário do Sistema
    ValidarDados('A', GetParam.NomeUsuario, 8)+
    // 03 (014 até 024 / tam. 11) - Brancos
    Replicate(' ',11)+
    // 04 (025 até 032 / tam. 08) - Data da Geração do Arquivo
    FormatDateTime('YYYYMMDD', Date)+
    // 05 (033 até 040 / tam. 08) - Hora da Geração do Arquivo
    FormatDateTime('HH.NN.SS', Time)+
    // 06 (041 até 057 / tam. 17) - Reservado
    'LAYOUT-23/08/2006'+
    // 07 (058 até 164 / tam. 107) - Brancos
    Replicate(' ',107);

  // **************************
  // Registro Header do Produto
  // **************************
  Result := Result +CR_LF+ GetRegistro_HeaderProduto;

  // ********************
  // Registro Suplementar
  // ********************
  if (GetParam.TipoPoduto = tpRefeicaoPapel) and
     (GetParam.Papel.PedidoSuplementar.Gerar) then
    Result := Result +CR_LF+ GetRegistro_Suplementar;
end;

function TCtrlArqTicket_TicketRestaurante.GetRegistro_HeaderProduto: string;
begin
  Inc(FNumSequencia);
  if (GetParam.TipoPoduto = tpRefeicaoPapel) then
    Result :=
      // 01 (001 até 004 / tam. 04) - Tipo do Produto
      'TR01' +
      // 02 (005 até 005 / tam. 01) - Tipo do Registro
      '0'+
      // 03 (006 até 006 / tam. 01) - Código do Produto
      'R'+
      // 04 (007 até 016 / tam. 10) - Código do Cliente Ticket
      ValidarDados('N', GetParam.CodCliente, 10)+
      // 05 (017 até 046 / tam. 30) - Nome da Empresa
      ValidarDados('A', FCdsUnidEntrega.FieldByName('NOME').asString, 30)+
      // 06 (047 até 054 / tam. 08) - Data da Geração do Pedido
      FormatDateTime('YYYYMMDD', Date)+
      // 07 (055 até 062 / tam. 08) - Data da Entrega do Pedido
      FormatDateTime('YYYYMMDD', GetParam.Papel.DataEntregaPedido)+
      // 08 (063 até 063 / tam. 01) - Tipo de Pedido
      'A'+
      // 09 (064 até 064 / tam. 01) - Branco
      ' '+
      // 10 (065 até 065 / tam. 01) - Relatório de Assinaturas
      IFF(GetParam.Papel.ReceberRelatAssinaturas, 'S', 'N')+
      // 11 (066 até 066 / tam. 01) - 1º Linha de Personalização Ticket
      '1'+
      // 12 (067 até 067 / tam. 01) - 2º Linha de Personalização Ticket
      IntToStr(GetParam.Papel.LinhaPersonalizacaoTicket2)+
      // 13 (068 até 068 / tam. 01) - 1º Linha de Personalização Rótulo
      IntToStr(GetParam.Papel.LinhaPersonalizacaoRotulo1)+
      // 14 (069 até 069 / tam. 01) - 2º Linha de Personalização Rótulo
      IntToStr(GetParam.Papel.LinhaPersonalizacaoRotulo2)+
      // 15 (070 até 070 / tam. 01) - Recibo Encarte
      GetParam.Papel.ReciboEncarte+
      // 16 (071 até 071 / tam. 01) - Relatório Gerencial
      IFF(GetParam.Papel.ReceberRelatGerencial, 'S', 'N')+
      // 17 (072 até 072 / tam. 01) - Resumo de Unidades
      IFF(GetParam.Papel.ReceberRelatResUnid, 'S', 'N')+
      // 18 (073 até 079 / tam. 07) - Brancos
      Replicate(' ',7)+
      // 19 (080 até 081 / tam. 02) - Mês Referência
      FormatDateTime('MM', FParametros.DataIni)+
      // 20 (082 até 100 / tam. 19) - Brancos
      Replicate(' ',19)+
      // 21 (101 até 102 / tam. 02) - Tipo de Layout
      '04'+
      // 22 (103 até 158 / tam. 56) - Brancos
      Replicate(' ',56)+
      // 23 (159 até 164 / tam. 06) - Seqüência
      ValidarDados('N', IntToStr(FNumSequencia), 6)
  else
  begin
    FQuantPessoas := 0;
    Result :=
      // 01 (001 até 001 / tam. 01) - Tipo do Produto
      'T' +
      // 02 (002 até 002 / tam. 01) - Produto
      GetParam.Eletronico.TipoProduto+
      // 03 (003 até 004 / tam. 02) - Fixo
      '02'+
      // 04 (005 até 005 / tam. 01) - Tipo de Registro
      '0'+
      // 05 (006 até 006 / tam. 01) - Produto
      GetParam.Eletronico.TipoProduto+
      // 06 (007 até 016 / tam. 10) - Código do Cliente
      ValidarDados('N', GetParam.CodCliente, 10)+
      // 07 (017 até 040 / tam. 24) - Nome da Empresa cliente que será personalizado no cartão
      ValidarDados('A', FCdsPrincipal.FieldByName('NOME_ESTAB').asString, 24)+
      // 08 (041 até 046 / tam. 06) - Brancos
      Replicate(' ',6)+
      // 09 (047 até 054 / tam. 08) - Data do Pedido
      FormatDateTime('YYYYMMDD', Date)+
      // 10 (055 até 062 / tam. 08) - Data da Liberação do Pedido
      FormatDateTime('YYYYMMDD', GetParam.Eletronico.DataLiberacaoPedido)+
      // 11 (063 até 063 / tam. 01) - Tipo do Pedido
      'C'+
      // 12 (064 até 079 / tam. 16) - Brancos
      Replicate(' ',16)+
      // 12 (080 até 081 / tam. 02) - Mês Referência
      FormatDateTime('MM', FParametros.DataIni)+
      // 14 (082 até 100 / tam. 19) - Brancos
      Replicate(' ',19)+
      // 15 (101 até 102 / tam. 02) - Tipo de Layout
      '04'+
      // 16 (103 até 104 / tam. 02) - Tipo do Cartão
      //   33 -> Magnético (TAE)
      //   34 -> Magnético (TRE)
      //   44 -> Smart (TRE)
      IFF(GetParam.Eletronico.TipoCartao=0,
        IFF(GetParam.Eletronico.TipoProduto='A', '33', '34'), '44')+
      // 17 (105 até 152 / tam. 48) - Brancos
      Replicate(' ',48)+
      // 18 (153 até 158 / tam. 06) - Origem
      'SUP   '+
      // 19 (159 até 164 / tam. 06) - Seqüência
      ValidarDados('N', IntToStr(FNumSequencia), 6);
  end;
end;

function TCtrlArqTicket_TicketRestaurante.GetRegistro_RodapeProduto: string;
begin
  // ****************************
  // Registro Trailler do Produto
  // ****************************
  Inc(FNumRegTrailler);
  Inc(FNumSequencia);
  if (GetParam.TipoPoduto = tpRefeicaoPapel) then
    Result :=
      // 01 (001 até 004 / tam. 04) - Tipo do Produto
      'TR01' +
      // 02 (005 até 005 / tam. 01) - Tipo do Registro
      '9'+
      // 03 (006 até 013 / tam. 08) - Total de Ticket do Pedido
      ValidarDados('N', FloatToStr(FQuantTotal), 8)+
      // 04 (014 até 027 / tam. 14) - Valor total do Pedido
      ValidarDados('N', FormatFloat('#########0.00',FValorTotal), 14)+
      // 05 (028 até 158 / tam. 131) - Brancos
      Replicate(' ',131)+
      // 06 (159 até 164 / tam. 06) - Seqüência
      ValidarDados('N', IntToStr(FNumSequencia), 6)
  else
    Result :=
      // 01 (001 até 001 / tam. 01) - Tipo do Produto
      'T' +
      // 02 (002 até 002 / tam. 01) - Produto
      GetParam.Eletronico.TipoProduto+
      // 03 (003 até 004 / tam. 02) - Fixo
      '02'+
      // 04 (005 até 005 / tam. 01) - Tipo de Registro
      '9'+
      // 05 (006 até 013 / tam. 08) - Total de Pessoas
      ValidarDados('N', IntToStr(FQuantPessoas), 8)+
      // 06 (014 até 027 / tam. 14) - Valor total do Pedido
      ValidarDados('N', FormatFloat('#########0.00',FValorTotal), 14)+
      // 07 (028 até 158 / tam. 131) - Brancos
      Replicate(' ',131)+
      // 08 (159 até 164 / tam. 06) - Seqüência
      ValidarDados('N', IntToStr(FNumSequencia), 6)
end;

function TCtrlArqTicket_TicketRestaurante.GetRegistro_Suplementar: string;
begin
  with (GetParam.Papel.PedidoSuplementar) do
  begin
    FCdsUnidEntregaPedSupl.Data := ListUnidadeEntrega(IdUnidEntrega);
    Inc(FNumSequencia);
    Result :=
      // 01 (001 até 004 / tam. 01) - Tipo do Produto
      'TR01' +
      // 02 (005 até 005 / tam. 01) - Tipo do Registro
      '1'+
      // 03 (006 até 011 / tam. 06) - Quantidade
      ValidarDados('N', IntToStr(Quant), 6)+
      // 04 (012 até 020 / tam. 09) - Valor Facial
      ValidarDados('N', FormatFloat('#########0.00',GetParam.ValorTicket), 9)+
      // 05 (021 até 021 / tam. 01) - Produto
      'R'+
      // 06 (022 até 022 / tam. 01) - Acabamento
      IFF(Acabamento=0, 'C', 'S')+
      // 07 (023 até 024 / tam. 02) - Blocagem (Número de Tickets (folhas) por Carnê)
      ValidarDados('N', IntToStr(Blocagem), 2)+
      // 08 (025 até 030 / tam. 06) - Código da Unidade de Entrega
      ValidarDados('N', FCdsUnidEntregaPedSupl.FieldByName('NUMFILIAL').asString, 6)+
      // 09 (031 até 050 / tam. 20) - Nome da Unidade de Entrega
      ValidarDados('A', FCdsUnidEntregaPedSupl.FieldByName('NOME').asString, 20)+
      // 10 (051 até 158 / tam. 108) - Brancos
      Replicate(' ',108)+
      // 11 (159 até 164 / tam. 06) - Seqüência
      ValidarDados('N', IntToStr(FNumSequencia), 6);
  end;
end;

function TCtrlArqTicket_TicketRestaurante.GetRegistro_Cabecalho_GrupoCustomizado: string;
begin
  Inc(FNumRegHeader);
  Inc(FNumSequencia);
  // ********************************
  // Registro das Unidades de Entrega
  // ********************************
  if (GetParam.TipoPoduto = tpRefeicaoPapel) then
    Result :=
      // 01 (001 até 004 / tam. 04) - Tipo do Produto
      'TR01' +
      // 02 (005 até 005 / tam. 01) - Tipo do Registro
      '2'+
      // 03 (006 até 011 / tam. 06) - Código da Unidade de Entrega
      ValidarDados('N', FCdsUnidEntrega.FieldByName('NUMFILIAL').asString, 6)+
      // 04 (012 até 031 / tam. 20) - Nome da Unidade de Entrega
      ValidarDados('A', FCdsUnidEntrega.FieldByName('NOME').asString, 20)+
      // 05 (032 até 035 / tam. 04) - Tipo de Logradouro
      ValidarDados('A', GetTituloLogradouro(FCdsUnidEntrega.FieldByName('LOGRADOURO').asString), 4)+
      // 06 (036 até 065 / tam. 30) - Logradouro
      ValidarDados('A', FCdsUnidEntrega.FieldByName('LOGRADOURO').asString, 30)+
      // 07 (066 até 071 / tam. 06) - Número
      ValidarDados('A', FCdsUnidEntrega.FieldByName('NUMERO').asString, 6)+
      // 08 (072 até 081 / tam. 10) - Complemento
      ValidarDados('A', FCdsUnidEntrega.FieldByName('COMPLEMENTO').asString, 10)+
      // 09 (082 até 106 / tam. 25) - Município
      ValidarDados('A', FCdsUnidEntrega.FieldByName('CIDADE').asString, 25)+
      // 10 (107 até 121 / tam. 15) - Bairro
      ValidarDados('A', FCdsUnidEntrega.FieldByName('BAIRRO').asString, 15)+
      // 11 (122 até 126 / tam. 05) - Código do CEP
      ValidarDados('N', FCdsUnidEntrega.FieldByName('CEP').asString, 5)+
      // 12 (127 até 128 / tam. 02) - UF
      ValidarDados('A', FCdsUnidEntrega.FieldByName('UF').asString, 2)+
      // 13 (129 até 148 / tam. 20) - Responsável pelo recebimento na Unidade de Entrega
      ValidarDados('A', FCdsResp.FieldByName('NOME').asString, 20)+
      // 11 (149 até 151 / tam. 03) - Complemento do CEP
      ValidarDados('N', Copy(FCdsUnidEntrega.FieldByName('CEP').asString,6,3), 3)+
      // 12 (152 até 158 / tam. 07) - Brancos
      Replicate(' ',7)+
      // 13 (159 até 164 / tam. 06) - Seqüência
      ValidarDados('N', IntToStr(FNumSequencia), 6)
  else
    Result :=
      // 01 (001 até 001 / tam. 01) - Tipo do Produto
      'T' +
      // 02 (002 até 002 / tam. 01) - Produto
      GetParam.Eletronico.TipoProduto+
      // 03 (003 até 004 / tam. 02) - Fixo
      '02'+
      // 04 (005 até 005 / tam. 01) - Tipo de Registro
      '2'+
      // 04 (006 até 031 / tam. 26) - Nome da Unidade de Entrega
      ValidarDados('A', FCdsUnidEntrega.FieldByName('NOME').asString, 26)+
      // 05 (032 até 035 / tam. 04) - Tipo de Logradouro
      ValidarDados('A', GetTituloLogradouro(FCdsUnidEntrega.FieldByName('LOGRADOURO').asString), 4)+
      // 06 (036 até 065 / tam. 30) - Logradouro
      ValidarDados('A', FCdsUnidEntrega.FieldByName('LOGRADOURO').asString, 30)+
      // 07 (066 até 071 / tam. 06) - Número
      ValidarDados('A', FCdsUnidEntrega.FieldByName('NUMERO').asString, 6)+
      // 08 (072 até 081 / tam. 10) - Complemento
      ValidarDados('A', FCdsUnidEntrega.FieldByName('COMPLEMENTO').asString, 10)+
      // 09 (082 até 106 / tam. 25) - Município
      ValidarDados('A', FCdsUnidEntrega.FieldByName('CIDADE').asString, 25)+
      // 10 (107 até 121 / tam. 15) - Bairro
      ValidarDados('A', FCdsUnidEntrega.FieldByName('BAIRRO').asString, 15)+
      // 11 (122 até 126 / tam. 05) - Código do CEP
      ValidarDados('N', FCdsUnidEntrega.FieldByName('CEP').asString, 5)+
      // 12 (127 até 128 / tam. 02) - UF
      ValidarDados('A', FCdsUnidEntrega.FieldByName('UF').asString, 2)+
      // 13 (129 até 148 / tam. 20) - Responsável pelo recebimento na Unidade de Entrega
      ValidarDados('A', FCdsResp.FieldByName('NOME').asString, 20)+
      // 14 (149 até 151 / tam. 03) - Complemento do CEP
      ValidarDados('N', Copy(FCdsUnidEntrega.FieldByName('CEP').asString,6,3), 3)+
      // 15 (152 até 158 / tam. 07) - Brancos
      Replicate(' ',7)+
      // 16 (159 até 164 / tam. 06) - Seqüência
      ValidarDados('N', IntToStr(FNumSequencia), 6);
end;

function TCtrlArqTicket_TicketRestaurante.GetRegistro_Detalhe: string;
var
  dValor, dValorFacial: double;
  iQuantTickets: integer;
begin
  iQuantTickets := FCdsPrincipal.FieldByName('QUANT_TICKETS').asInteger;
  if (iQuantTickets <= 0) then
  begin
    IncProgresso(0, 1);
    Result := '';
    exit;
  end;

  Inc(FNumSequencia);
  dValorFacial := GetParam.ValorTicket;
  dValor := dValorFacial * iQuantTickets;

  FQuantTotal := FQuantTotal + iQuantTickets;
  FValorTotal := FValorTotal + dValor;

  // Atualização dos valores do Centro de Custo
  AtualizarValorCCusto(
    FCdsPrincipal.FieldByName('COD_CCUSTO').asString, dValor);

  // ********************
  // Registro das Pessoas
  // ********************
  if (GetParam.TipoPoduto = tpRefeicaoPapel) then
    Result :=
      // 01 (001 até 004 / tam. 04) - Tipo do Produto
      'TR01' +
      // 02 (005 até 005 / tam. 01) - Tipo do Registro
      '3'+
      // 03 (006 até 011 / tam. 06) - Código do Centro de Custo
      ValidarDados('A', FCdsPrincipal.FieldByName('COD_CCUSTO').asString, 6)+
      // 04 (012 até 031 / tam. 20) - Nome do Centro de Custo
      ValidarDados('A', FCdsPrincipal.FieldByName('NOME_CCUSTO').asString, 20)+
      // 05 (032 até 043 / tam. 12) - Matrícula
      ValidarDados('A', FCdsPrincipal.FieldByName('MATRICULA').asString, 12)+
      // 06 (044 até 069 / tam. 26) - Personalização
      Replicate(' ',26)+
      // 07 (070 até 075 / tam. 06) - Código da Unidade de Entrega
      ValidarDados('N', FCdsUnidEntrega.FieldByName('NUMFILIAL').asString, 6)+
      // 08 (076 até 095 / tam. 20) - Nome da Unidade de Entrega
      ValidarDados('A', FCdsUnidEntrega.FieldByName('NOME').asString, 20)+
      // 09 (096 até 098 / tam. 03) - Quantidade de Tickets
      ValidarDados('N', IntToStr(iQuantTickets), 3)+
      // 10 (099 até 100 / tam. 02) - Blocagem (Número de Tickets (folhas) por carnê)
      ValidarDados('N', IntToStr(GetParam.Papel.Blocagem), 2)+
      // 11 (101 até 109 / tam. 09) - Valor Facial dos Tickets
      ValidarDados('N', FormatFloat('#########0.00',dValorFacial), 9)+
      // 12 (110 até 110 / tam. 01) - Produto
      'R'+
      // 13 (111 até 111 / tam. 01) - Acabamento
      IFF(GetParam.Papel.Acabamento=0, 'C', 'S')+
      // 14 (112 até 141 / tam. 30) - Nome
      ValidarDados('A', FCdsPrincipal.FieldByName('NOME').asString, 30)+
      // 15 (142 até 158 / tam. 17) - Brancos
      Replicate(' ',17)+
      // 16 (159 até 164 / tam. 06) - Seqüência
      ValidarDados('N', IntToStr(FNumSequencia), 6)
  else
  begin
    Inc(FQuantPessoas);
    Result :=
      // 01 (001 até 001 / tam. 01) - Tipo do Produto
      'T' +
      // 02 (002 até 002 / tam. 01) - Produto
      GetParam.Eletronico.TipoProduto+
      // 03 (003 até 004 / tam. 02) - Fixo
      '02'+
      // 04 (005 até 005 / tam. 01) - Tipo de Registro
      '3'+
      // 05 (006 até 026 / tam. 26) - Código do Centro de Custo
      ValidarDados('A', FCdsPrincipal.FieldByName('COD_CCUSTO').asString, 26)+
      // 06 (032 até 043 / tam. 12) - Matrícula
      ValidarDados('A', FCdsPrincipal.FieldByName('MATRICULA').asString, 12)+
      // 07 (044 até 051 / tam. 08) - Data de Nascimento
      FormatDateTime('DDMMYYYY', FCdsPrincipal.FieldByName('DATANASC').asDateTime)+
      // 08 (052 até 069 / tam. 18) - Brancos
      Replicate(' ',18)+
      // 09 (070 até 095 / tam. 26) - Nome da Unidade de Entrega
      ValidarDados('A', FCdsUnidEntrega.FieldByName('NOME').asString, 26)+
      // 10 (096 até 100 / tam. 05) - Fixo
      '00101'+
      // 11 (101 até 109 / tam. 09) - Valor do benefício
      ValidarDados('N', FormatFloat('#########0.00',dValor), 9)+
      // 12 (110 até 110 / tam. 01) - Produto
      GetParam.Eletronico.TipoProduto+
      // 13 (111 até 111 / tam. 01) - Fixo
      'E'+
      // 14 (112 até 141 / tam. 30) - Nome
      ValidarDados('A', FCdsPrincipal.FieldByName('NOME').asString, 30)+
      // 15 (142 até 158 / tam. 17) - Brancos
      Replicate(' ',17)+
      // 16 (159 até 164 / tam. 06) - Seqüência
      ValidarDados('N', IntToStr(FNumSequencia), 6);
  end;

  IncProgresso(0, 1);
end;

function TCtrlArqTicket_TicketRestaurante.GetRegistro_RodapeArquivo: string;
begin
  // **************************
  // Registro Rodapé do Produto
  // **************************
  Result := GetRegistro_RodapeProduto;

  // **************************
  // Registro Rodapé do Arquivo
  // **************************
  Result := Result +CR_LF+ 
    // 01 (001 até 005 / tam. 05) - Tipo de Registro
    'LSUP9' +
    // 02 (006 até 013 / tam. 08) - Quantidade de Header
    ValidarDados('N', IntToStr(FNumRegHeader), 8)+
    // 03 (014 até 021 / tam. 08) - Quantidade de Trailler
    ValidarDados('N', IntToStr(FNumRegTrailler), 8)+
    // 04 (022 até 029 / tam. 08) - Quantidade de registros dentro do arquivo
    ValidarDados('N', IntToStr(FNumSequencia - FNumRegHeader - FNumRegTrailler), 8)+
    // 05 (030 até 306 / tam. 277) - Brancos
    Replicate(' ',277);
end;

procedure TCtrlArqTicket_TicketRestaurante.IniciarProcessoArquivo;
begin
  inherited;
  FListaIdEstab := GetParam.ListaIdEstab;

  FCdsPrincipal.IndexName := '';
  if (FCdsPrincipal.IndexDefs.IndexOf('Indice') > 0) then
    FCdsPrincipal.DeleteIndex('Indice');

  // Opção de usar os Estabelecimentos das pessoas como Unidades de Entrega
  if (GetParam.ListaIdUnidEntrega = '-1') then // Estabelecimento
    FCdsPrincipal.AddIndex('Indice', 'IDESTAB;NOME', [])
  else
    FCdsPrincipal.AddIndex('Indice', 'NOME', []); // Nome da pessoa

  FNumRegHeader := 0;
  FNumRegTrailler := 0;

  FCdsUnidEntrega.Data := ListDadosUnidEntrega;
  FCdsResp.Data := ListDadosResponsavel;
end;

function TCtrlArqTicket_TicketRestaurante.GetTituloLogradouro(const Logradouro: string): string;
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

function TCtrlArqTicket_TicketRestaurante.GetParam: TParModelo_TicketRestaurante;
begin
  Result := TParModelo_TicketRestaurante(FParametros);
end;

function TCtrlArqTicket_TicketRestaurante.ListDadosUnidEntrega: OleVariant;
var
  sListaIdUnidEntrega: string;
begin
  if (GetParam.ListaIdUnidEntrega = '-1') then
    sListaIdUnidEntrega := FListaIdEstab
  else
    sListaIdUnidEntrega := GetParam.ListaIdUnidEntrega;

  Result := GetDataPacket(
    'SELECT' +CR_LF+
    IFF(GetParam.CodUnidEntrega<>'',
      '  '+QuotedStr(GetParam.CodUnidEntrega)+' AS NUMFILIAL,',
      '  FP.NUMFILIAL,') +CR_LF+
    '  P.IDPESSOA, P.NOME, P.NUMDOCUMENTO,' +CR_LF+
    '  TEL.DDD, TEL.NUMERO AS TELEFONE,' +CR_LF+
    '  EP.LOGRADOURO, EP.NUMERO, EP.COMPLEMENTO, EP.BAIRRO, EP.CEP,' +CR_LF+
    '  CI.NOME AS CIDADE, ES.CODESTADO AS UF' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA P, ENDPESS EP, FILIALPESSOA FP, ESTADO ES, CIDADES CI,' +CR_LF+
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
    FU.MontaSelSQL('P.IDPESSOA',sListaIdUnidEntrega,2,6) +CR_LF+
    '  (P.IDPESSOA       = EP.IDPESSOA) AND' +CR_LF+
    '  (P.IDENDCOMERCIAL = EP.IDENDERECO) AND' +CR_LF+
    '  (EP.IDENDERECO    = TEL.IDENDERECO) AND' +CR_LF+
    '  (EP.IDCIDADES     = CI.IDCIDADES) AND' +CR_LF+
    '  (CI.IDESTADO      = ES.IDESTADO) AND' +CR_LF+
    '  (P.IDPESSOA       = FP.IDFILIALPESSOA(+))');
end;

function TCtrlArqTicket_TicketRestaurante.ListDadosResponsavel: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  NOME' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA' +CR_LF+
    'WHERE' +CR_LF+
    '  (IDPESSOA = ' +FloatToStr(GetParam.IdResponsavel)+ ')');
end;

function TCtrlArqTicket_TicketRestaurante.ListUnidadeEntrega(const IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  FP.NUMFILIAL, P.NOME' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA P, FILIALPESSOA FP' +CR_LF+
    'WHERE' +CR_LF+
    '  (FP.IDFILIALPESSOA = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    '  (FP.IDFILIALPESSOA = P.IDPESSOA)');
end;

end.
