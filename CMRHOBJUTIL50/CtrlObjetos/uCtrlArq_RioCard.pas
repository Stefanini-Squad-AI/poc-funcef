unit uCtrlArq_RioCard;

interface

uses Classes, SysUtils, Controls, DB, DBClient, uCmControlObject, uCmDbObject, IvDictio,
  uCmClientDataSet, uCMTypes, uCtrlModeloArqTranspCartao;

type
  TCtrlArq_RioCard = class(TCtrlModeloArqTranspCartao)
  protected
    // Métodos de Geração dos registros do arquivo
    function GetRegistro_CabecalhoArquivo: string; override;
    function GetRegistro_Detalhe: string; override;
    function GetRegistro_RodapeEstab: string; override;

    procedure IniciarProcessoEstab; override;
  private
    FCidadeRecarga: integer; // Cidade onde será feita a recarga
    FCodRedeRecarda: integer; // Código da rede de recarga

    // Variáveis usadas no registro Tipo 3 (Informações Adicionais) do Arquivo de Pedidos
    FGerarRegTipo3: boolean; // Indica se deve gerar o registro
    FDataLiberacaoCarga: TDate; // Data da liberação da carga quando esta for superior 1 5 ou 7 dias
    FTipoEntrega: integer; // Local de entrega do cartão (D -> Domiciliar, A -> Agência do Unibanco)
    FNumAgenciaAntrega: string; // Número da Agência a ser entregue os cartões
  public
    constructor Create(const GerarAP: boolean; const CadUsuarios: integer;
      const GerarRegTipo3: boolean; const CidadeRecarga, CodRedeRecarda: integer;
      const DataLiberacaoCarga: TDate; const TipoEntrega: integer;
      const NumAgenciaAntrega: string); reintroduce;
    destructor  Destroy; override;
  end;

implementation

uses uCtrlFuncoesRH;

{ TCtrlArq_RioCard }

constructor TCtrlArq_RioCard.Create(const GerarAP: boolean; const CadUsuarios: integer;
  const GerarRegTipo3: boolean; const CidadeRecarga, CodRedeRecarda: integer;
  const DataLiberacaoCarga: TDate; const TipoEntrega: integer;
  const NumAgenciaAntrega: string);
begin
  inherited Create(GerarAP, CadUsuarios);
  FGerarRegTipo3 := GerarRegTipo3;
  FCidadeRecarga := CidadeRecarga;
  FCodRedeRecarda := CodRedeRecarda;
  FDataLiberacaoCarga := DataLiberacaoCarga;
  FTipoEntrega := TipoEntrega;
  FNumAgenciaAntrega := NumAgenciaAntrega;
end;

destructor TCtrlArq_RioCard.Destroy;
begin
  inherited;
end;

function TCtrlArq_RioCard.GetRegistro_CabecalhoArquivo: string;
begin
  // ***********************************************
  // Geração do Arquivo de Cadastramento de Usuários
  // ***********************************************
  if (FNumReg_CadUsuarios > 0) then
  begin
    FArquivo_CadUsuarios.Add(
      // Marca de Início de um Arquivo
      MARCA_DIVISAO_ARQUIVO+ FCdsPrincipal.FieldByName('INSCR_ESTAB').asString +CR_LF+
      // Cabeçalho
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
      FormatDateTime('hhnn', Time));
  end;

  // ***********************************************
  // Geração do Arquivo de Pedidos
  // ***********************************************
  if (FNumReg_Pedido > 0) then
  begin
    Result :=
      // Marca de Início de um Arquivo
      MARCA_DIVISAO_ARQUIVO+ FCdsPrincipal.FieldByName('INSCR_ESTAB').asString +CR_LF+
      // Cabeçalho
      // 01 (01 até 05 / tam. 05) Nº de sequência do registro no meio
      ValidarDados('N', IntToStr(FNumSequencia), 5)+
      // 02 (06 até 07 / tam. 02) - Tipo do Registro
      '01' +
      // 03 (08 até 13 / tam. 06) - Nome do arquivo
      'PEDIDO' +
      // 04 (14 até 18 / tam. 05) - Número da versão do layout do arquivo
      '01.00' +
      // 05 (19 até 32 / tam. 14) - Inscrição do comprador (CNPJ/CEI; CPF)
      ValidarDados('N', FCdsPrincipal.FieldByName('INSCR_ESTAB').asString, 14);
  end;
end;

function TCtrlArq_RioCard.GetRegistro_Detalhe: string;
var
  bmkMarca: TBookmark;
  dValVales, dValUsoDiario: double;
begin
  bmkMarca := FCdsPrincipal.GetBookMark;

  dValUsoDiario := 0;
  dValVales := 0;
  repeat
    // Somar o valor diário dos transportes
    dValUsoDiario := dValUsoDiario +
      FCdsPrincipal.FieldByName('QTDE_VALES').asFloat *
      FCdsPrincipal.FieldByName('VLR_TARIFA').asFloat;
    dValVales := dValVales + FCdsPrincipal.FieldByName('VALOR_COMPRA').asFloat;
    FValorTotal := FValorTotal + FCdsPrincipal.FieldByName('VALOR_COMPRA').asFloat;

    // Atualização dos valores do Centro de Custo
    AtualizarValorCCusto(
      FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString,
      FCdsPrincipal.FieldByName('VALOR_COMPRA').asFloat);
    
    // Posicionar no último registro da linha de transporte
    IrProxLinhaTransp;
  until (FIdPessoa <> FCdsPrincipal.FieldByName('IDPESSOA').asString) or (FCdsPrincipal.EOF);

  FCdsPrincipal.GotoBookmark(bmkMarca);
  FCdsPrincipal.FreeBookmark(bmkMarca);

  // ***********************************************
  // Geração do Arquivo de Cadastramento de Usuários
  // ***********************************************
  // Só fará a pessoa se a geração do arquivo de cadastro for para todas as pessoas ou
  // ela estiver sendo admitida no período especificado
  if (
       (FCadUsuarios = 2) or
       (
         (FCadUsuarios = 1) and (VerificaCodigoEm(FListaAdmitidos, FIdPessoa, ',') >= 1)
       )
     ) and
     (FNumReg_CadUsuarios > 0) and (dValUsoDiario > 0) then
  begin
    FArquivo_CadUsuarios.Add(
      // 01 (01 até 02 / tam. 02) - Tipo do Registro
      '02' +
      // 02 (03 até 17 / tam. 15) - Número da matrícula do usuário
      ValidarDados('A', FCdsPrincipal.FieldByName('MATRICULA').asString, 15)+
      // 03 (18 até 77 / tam. 60) - Nome do usuário
      ValidarDados('A', FCdsPrincipal.FieldByName('FUNCIONARIO').asString, 60)+
      // 04 (78 até 88 / tam. 11) - Nome do usuário
      ValidarDados('N', FCdsPrincipal.FieldByName('CPF').asString, 11)+
      // 05 (89 até 94 / tam. 06) - Valor de uso diário
      ValidarDados('N', Float2String(dValUsoDiario), 6)+
      // 06 (95 até 96 / tam. 02) - Código da cidade onde será feita a recarga
      ValidarDados('N', IntToStr(FCidadeRecarga), 2) +
      // 07 (97 até 98 / tam. 02) - Código da rede de recarga
      ValidarDados('N', IntToStr(FCodRedeRecarda), 2) +
      // 08 (99 até 111 / tam. 13) - Número do Cartão 
      ValidarDados('N', FCdsPrincipal.FieldByName('NUM_CARTAO').asString, 13));
  end;

  // ***********************************************
  // Geração do Arquivo de Pedidos
  // ***********************************************
  if (FNumReg_Pedido > 0) and (dValVales > 0) then
  begin
    Inc(FNumSequencia);
    Result :=
      // 01 (01 até 05 / tam. 05) Nº de sequência do registro no meio
      ValidarDados('N', IntToStr(FNumSequencia), 5)+
      // 02 (06 até 07 / tam. 02) - Tipo do Registro
      '02' +
      // 03 (08 até 22 / tam. 15) - Número da matrícula do usuário
      ValidarDados('A', FCdsPrincipal.FieldByName('MATRICULA').asString, 15)+
      // 04 (23 até 30 / tam. 08) - Valor da Carga
      ValidarDados('N', Float2String(dValVales), 8);
    FValorTotal_Estab := FValorTotal_Estab + dValVales;
  end;

  // Posicionar na próxima pessoa
  IrProxPessoa;
end;

function TCtrlArq_RioCard.GetRegistro_RodapeEstab: string;
begin
  // *********************************************************
  // Geração do Rodapé do Arquivo de Cadastramento de Usuários
  // *********************************************************
  if (FNumReg_CadUsuarios > 0) then
  begin
    FArquivo_CadUsuarios.Add(
      // 01 (01 até 02 / tam. 02) - Tipo do Registro
      '99' +
      // 02 (03 até 08 / tam. 06) - Número de registros do arquivo (incluindo o Header e o Trailler)
      ValidarDados('N', IntToStr(FNumReg_CadUsuarios+2), 6));
  end;
  
  if (FNumReg_Pedido > 0) then
  begin
    // ************************************************
    // Geração do Registro Tipo 3 do Arquivo de Pedidos
    // ************************************************
    if (FGerarRegTipo3) then
    begin
      Inc(FNumSequencia);
      Result :=
        // 01 (01 até 02 / tam. 02) Nº de sequência do registro no meio
        ValidarDados('N', IntToStr(FNumSequencia), 5)+
        // 02 (03 até 04 / tam. 02) - Tipo do Registro
        '03' +
        // 03 (05 até 12 / tam. 08) - Data da liberação da carga
        IFF(FDataLiberacaoCarga=0,
          Replicate('0', 8),
          ValidarDados('N', DateToStr(FDataLiberacaoCarga), 8))+
        // 04 (13 até 13 / tam. 01) - Local de entrega do cartão (D -> Domiciliar, A -> Agência do Unibanco)
        IFF(FTipoEntrega = 0, 'D', 'A')+
        // 05 (14 até 17 / tam. 04) - Número da Agência a ser entregue os cartões
        IFF(FTipoEntrega = 0,
          Replicate('0', 4),
          ValidarDados('N', FNumAgenciaAntrega, 4) + CR_LF);
    end;

    // ***********************************************
    // Geração do Arquivo de Pedidos
    // ***********************************************
    Inc(FNumSequencia);
    Result := Result +
      // 01 (01 até 02 / tam. 02) Nº de sequência do registro no meio
      ValidarDados('N', IntToStr(FNumSequencia), 5)+
      // 02 (03 até 04 / tam. 02) - Tipo do Registro
      '99' +
      // 03 (05 até 14 / tam. 10) - Valor total do pedido
      ValidarDados('N', Float2String(FValorTotal_Estab), 10);
  end;
end;

procedure TCtrlArq_RioCard.IniciarProcessoEstab;
begin
  inherited;
  FNumSequencia := 1;
end;

end.
