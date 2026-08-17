unit uCtrlArq_PasseCard;

interface

uses Classes, SysUtils, Controls, DB, DBClient, uCmControlObject, uCmDbObject, IvDictio,
  uCmClientDataSet, uCMTypes, uCtrlModeloArqTranspCartao;

type
  TCtrlArq_PasseCard = class(TCtrlModeloArqTranspCartao)
  protected
    // Método de Geração dos registros do arquivo
    function GetRegistro_Detalhe: string; override;

    procedure IniciarProcessoArquivo; override;
  private
    FCodCliente: double; // Código da empresa no SindiOnibus

    FUltMatric: string;

    function GetRegistro_CadUsuarios(const ValUsoDiario: double): string;
    function GetRegistro_Pedido(const ValVales: double): string;
  public
    constructor Create(const GerarAP: boolean; const CadUsuarios: integer;
      const CodCliente: double); reintroduce;
    destructor  Destroy; override;
  end;

implementation

uses uCtrlFuncoesRH;

{ TCtrlArq_PasseCard }

constructor TCtrlArq_PasseCard.Create(const GerarAP: boolean; const CadUsuarios: integer;
  const CodCliente: double);
begin
  inherited Create(GerarAP, CadUsuarios);
  FCodCliente := CodCliente;
end;

destructor TCtrlArq_PasseCard.Destroy;
begin
  inherited;
end;

function TCtrlArq_PasseCard.GetRegistro_Detalhe: string;
var
  bmkMarca: TBookmark;
  sGerarCadastro: string;
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
    sGerarCadastro := GetRegistro_CadUsuarios(dValUsoDiario);
    if (sGerarCadastro <> '') then
      FArquivo_CadUsuarios.Add(sGerarCadastro);
  end;

  // ***********************************************
  // Geração do Arquivo de Pedidos
  // ***********************************************
  if (FNumReg_Pedido > 0) and (dValVales > 0) then
  begin
    Result := GetRegistro_Pedido(dValVales);
    FValorTotal_Estab := FValorTotal_Estab + dValVales;
  end;

  // ******************************************************
  // OBS: Está pulando a linha de transporte pois de acordo
  // com o seu Eugênio, o PasseCard usa uma linha no arquivo
  // para cada Linha de Transporte da pessoa.
  // Ex: Funcionário X usa um ônibus de R$ 1,80 e um metrô
  // de R$ 2,25. Neste caso, o sistema irá gerar duas linhas
  // para a pessoa, contemplando estas duas linhas.
  // Para fazer com que o sistema gere somente uma linha
  // contendo a soma das duas Linhas de Transporte da pessoa,
  // basta comentar a linha abaixo e descomentar a outra.
  // ******************************************************
  // Posicionar no último registro da linha de transporte
  IrProxLinhaTransp;

  // Posicionar na próxima pessoa
  //IrProxPessoa;
end;

function TCtrlArq_PasseCard.GetRegistro_CadUsuarios(const ValUsoDiario: double): string;
var
  sNomeAbrev: string;
  i: integer;
begin
  if (FCdsPrincipal.FieldByName('MATRICULA').asString = FUltMatric) then
  begin
    Result := '';
    exit;
  end;
  FUltMatric := FCdsPrincipal.FieldByName('MATRICULA').asString;

  i := 20;
  sNomeAbrev := Copy(FCdsPrincipal.FieldByName('FUNCIONARIO').asString,1,20);
  while (Copy(sNomeAbrev,i,1) <> ' ') do
  begin
    sNomeAbrev := Copy(sNomeAbrev, 1, i-1);
    Dec(i);
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
    ValidarDados('A', Copy(FCdsPrincipal.FieldByName('CPF').asString,1,3)+'.'+
                      Copy(FCdsPrincipal.FieldByName('CPF').asString,4,3)+'.'+
                      Copy(FCdsPrincipal.FieldByName('CPF').asString,7,3)+'-'+
                      Copy(FCdsPrincipal.FieldByName('CPF').asString,10,2), 14)+ ' ' +
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

function TCtrlArq_PasseCard.GetRegistro_Pedido(const ValVales: double): string;
begin
  Inc(FNumSequencia);
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
    Copy(ValidarDados('N', Float2String(FCdsPrincipal.FieldByName('VALOR_COMPRA').asFloat), 6),1,4)+','+
    Copy(ValidarDados('N', Float2String(FCdsPrincipal.FieldByName('VALOR_COMPRA').asFloat), 6),5,2)+' '+
    // 01 (43 até 47 / tam. 05) Nº de sequência do registro no meio
    ValidarDados('N', IntToStr(FNumSequencia), 5);

  // Atualização dos valores do Centro de Custo
  AtualizarValorCCusto(
    FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString,
    FCdsPrincipal.FieldByName('VALOR_COMPRA').asFloat);
end;

procedure TCtrlArq_PasseCard.IniciarProcessoArquivo;
begin
  inherited;
  FUltMatric := '';
  FNumSequencia := 0;
end;

end.
