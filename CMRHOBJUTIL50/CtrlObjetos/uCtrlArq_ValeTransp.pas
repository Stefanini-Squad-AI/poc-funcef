unit uCtrlArq_ValeTransp;

interface

uses Classes, SysUtils, Controls, DB, DBClient, uCmControlObject, uCmDbObject, IvDictio,
  uCmClientDataSet, uCMTypes, uCtrlModeloArqTransp;

type
  TCtrlArq_ValeTransp = class(TCtrlModeloArqTransp)
  protected
    // Métodos de Geração dos registros do arquivo
    function GetRegistro_CabecalhoArquivo: string; override;
    function GetRegistro_Detalhe: string; override;
    function GetRegistro_RodapeEstab: string; override;
    function GetRegistro_RodapeArquivo: string; override;

    procedure IniciarProcessoArquivo; override;
    procedure IniciarProcessoEstab; override;
  private
    FQuantRegTip2: integer; // Quantidade de registros tipo 2 de um estabelecimento
    FNumPessoasEstab: word; // Quantidade de pessoas por estabelecimento
    FIdentificadorFunc: integer;

    // O que será gravado no campo de Uso do Empregador
    function GetUsoDoEmpregador: string;
  public
    constructor Create(const GerarAP: boolean; const IdentificadorFunc: integer); reintroduce;
    destructor  Destroy; override;
  end;

implementation

uses uCtrlFuncoesRH;

{ TCtrlArq_ValeTransp }

constructor TCtrlArq_ValeTransp.Create(const GerarAP: boolean;
  const IdentificadorFunc: integer);
begin
  inherited Create(GerarAP, false);
  FIdentificadorFunc := IdentificadorFunc;
end;

destructor TCtrlArq_ValeTransp.Destroy;
begin
  inherited;
end;

function TCtrlArq_ValeTransp.GetUsoDoEmpregador: string;
begin
  case (FIdentificadorFunc) of
    0 : Result :=
      ValidarDados('A', AbreviaNome(25, FCdsPrincipal.FieldByName('FUNCIONARIO').asString), 25);
    1 : Result :=
      ValidarDados('A', AbreviaNome(25, FCdsPrincipal.FieldByName('MATRICULA').asString), 25);
   else Result := Replicate(' ', 25);
  end;
end;

function TCtrlArq_ValeTransp.GetRegistro_CabecalhoArquivo: string;
begin
  Result :=
    // 01-Nº de sequência do registro no meio
    ValidarDados('N', IntToStr(FNumSequencia), 5)+
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
    ValidarDados('N', IntToStr(FNumPessoasEstab), 5)+
    // 08-Cep Ex.: 00000000 (se não houver informação)
    ValidarDados('N', FCdsPrincipal.FieldByName('CEP_ESTAB').asString, 8)+
    // 09-Bairro
    ValidarDados('A', FCdsPrincipal.FieldByName('BAIRRO_ESTAB').asString, 17)+
    // 10-Cidade
    ValidarDados('A', FCdsPrincipal.FieldByName('CIDADE_ESTAB').asString, 20)+
    // 11-UF
    ValidarDados('A', FCdsPrincipal.FieldByName('UF_ESTAB').asString, 2)+
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

function TCtrlArq_ValeTransp.GetRegistro_Detalhe: string;
begin
  Result := '';
  repeat
    Inc(FNumSequencia);
    Result := IFF(Result='', '', Result+CR_LF)+
      // 01-Nº de sequência do registro no meio
      ValidarDados('N', IntToStr(FNumSequencia),5)+
      // 02-Inscrição do responsável (CNPJ/CEI; CPF)
      ValidarDados('N', FCdsPrincipal.FieldByName('INSCR_ESTAB').asString, 14)+
      // 03-Tipo Fixo 2
      '2'+
      // 04-Módulo
      FCdsPrincipal.FieldByName('TIPOLINHA').asString+
      // 05-Quantidade de vales
      ValidarDados('N', IntToStr(Round(FCdsPrincipal.FieldByName('QUANT_VALES').asFloat)), 9)+
      // 06-Valor da tarifa
      ValidarDados('N', Float2String(FCdsPrincipal.FieldByName('VLR_TARIFA').asFloat), 8)+
      // Brancos
      Replicate(' ',144)+
      // 07-Para uso do empregador
      GetUsoDoEmpregador;
    Inc(FQuantRegTip2);

    // Atualizar valores de totalização
    FQuantTotal_Estab := FQuantTotal_Estab + FCdsPrincipal.FieldByName('QUANT_VALES').asFloat;
    FValorTotal_Estab := FValorTotal_Estab + FCdsPrincipal.FieldByName('VALOR_COMPRA').asFloat;
    FValorTotal := FValorTotal + FCdsPrincipal.FieldByName('VALOR_COMPRA').asFloat;

    // Atualização dos valores do Centro de Custo
    AtualizarValorCCusto(
      FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString,
      FCdsPrincipal.FieldByName('VALOR_COMPRA').asFloat);

    // Posicionar no último registro da linha de transporte
    IrProxLinhaTransp;
  until (FIdPessoa <> FCdsPrincipal.FieldByName('IDPESSOA').asString) or (FCdsPrincipal.EOF);
end;

function TCtrlArq_ValeTransp.GetRegistro_RodapeEstab: string;
begin
  Inc(FNumSequencia);
  Result :=
    // 01-Nº de sequência do registro no meio
    ValidarDados('N', IntToStr(FNumSequencia), 5)+
    // 02-Inscrição do responsável (CNPJ/CEI; CPF)
    ValidarDados('N', FCdsPrincipal.FieldByName('INSCR_ESTAB').asString, 14)+
    // 03-Tipo Fixo 3
    '3'+
    // 04-Quantidade de registros tipo 2
    ValidarDados('N', IntToStr(FQuantRegTip2), 5)+
    // 05-Quantidade de vales
    ValidarDados('N', IntToStr(Round(FQuantTotal_Estab)), 9)+
    // 06-Valor da compra
    ValidarDados('N', Float2String(FValorTotal_Estab), 15)+
    // Brancos
    Replicate(' ',133)+
    // 07-Para uso do empregador
    Replicate(' ', 25);
end;

function TCtrlArq_ValeTransp.GetRegistro_RodapeArquivo: string;
begin
  Result := Replicate('9', 207);
end;

procedure TCtrlArq_ValeTransp.IniciarProcessoArquivo;
begin
  inherited;
  FFiltroCdsPrincipal := 'TIPOLINHA <> ''C''';
end;

procedure TCtrlArq_ValeTransp.IniciarProcessoEstab;
begin
  inherited;
  // Obter o número de pessoas que receberão vale transporte no estabelecimento atual
  FNumPessoasEstab := GetNumPessoasEstab;
  FQuantRegTip2 := 0;
  FNumSequencia := 1;
end;

end.
