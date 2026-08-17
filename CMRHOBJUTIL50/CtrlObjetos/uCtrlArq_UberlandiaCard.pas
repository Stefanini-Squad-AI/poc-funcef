unit uCtrlArq_UberlandiaCard;

interface

uses Classes, SysUtils, Controls, DB, DBClient, uCmControlObject, uCmDbObject, IvDictio,
  uCmClientDataSet, uCMTypes, uCtrlModeloArqTranspCartao;

type
  TCtrlArq_UberlandiaCard = class(TCtrlModeloArqTranspCartao)
  protected
    // Método de Geração dos registros do arquivo
    function GetRegistro_Detalhe: string; override;
  private
    FNumDias: array of integer;
    FCodigo: array of string;

    function GetGrupoCarga: string;
    function GetRegistro_CadUsuarios(const QuantUsoDiario: integer): string;
    function GetRegistro_Pedido: string;
  public
    constructor Create(const GerarAP: boolean; const CadUsuarios: integer;
      const NumDias: array of integer; const Codigo: array of string); reintroduce;
    destructor  Destroy; override;
  end;

implementation

uses uCtrlFuncoesRH;

{ TCtrlArq_UberlandiaCard }

constructor TCtrlArq_UberlandiaCard.Create(const GerarAP: boolean;
  const CadUsuarios: integer; const NumDias: array of integer; const Codigo: array of string);
var
  c, iNum: integer;
begin
  inherited Create(GerarAP, CadUsuarios);

  iNum := High(NumDias);
  if (iNum > -1) then
  begin
    SetLength(FNumDias, iNum+1);
    for c:=0 to iNum do
      FNumDias[c] := NumDias[c];
  end;

  iNum := High(Codigo);
  if (iNum > -1) then
  begin
    SetLength(FCodigo, iNum+1);
    for c:=0 to iNum do
      FCodigo[c] := Codigo[c];
  end;
end;

destructor TCtrlArq_UberlandiaCard.Destroy;
begin
  inherited;
end;

function TCtrlArq_UberlandiaCard.GetGrupoCarga: string;
var
  c: integer;
begin
  Result := '00001';
  for c:=0 to High(FNumDias)+1 do
    if (FNumDias[c] = FCdsPrincipal.FieldByName('NUM_DIAS_TRAB').asInteger) then
    begin
      Result := FCodigo[c];
      break;
    end;
end;

function TCtrlArq_UberlandiaCard.GetRegistro_Detalhe: string;
var
  bmkMarca: TBookmark;
  iQuantUsoDiario: integer;
  dValVales: double;
begin
  bmkMarca := FCdsPrincipal.GetBookMark;

  iQuantUsoDiario := 0;
  dValVales := 0;
  repeat
    // Somar a quantidade diária dos transportes
    iQuantUsoDiario := iQuantUsoDiario +
      Round(FCdsPrincipal.FieldByName('QUANT_VALES').asFloat /
      (FCdsPrincipal.FieldByName('NUM_DIAS_TRAB').asInteger +
       FCdsPrincipal.FieldByName('DIASEXTRA').asInteger));

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
     (FNumReg_CadUsuarios > 0) and (iQuantUsoDiario > 0) then
  begin
    FArquivo_CadUsuarios.Add(GetRegistro_CadUsuarios(iQuantUsoDiario));
  end;

  // ***********************************************
  // Geração do Arquivo de Pedidos
  // ***********************************************
  if (FNumReg_Pedido > 0) and (dValVales > 0) then
    Result := GetRegistro_Pedido;

  // Posicionar na próxima pessoa
  IrProxPessoa;
end;

function TCtrlArq_UberlandiaCard.GetRegistro_CadUsuarios(const QuantUsoDiario: integer): string;
begin
  Result :=
    // 01 (001 até 050 / tam. 50) - Nome
    ValidarDados('A', FCdsPrincipal.FieldByName('FUNCIONARIO').asString, 50)+
    // 02 (051 até 065 / tam. 15) - Número da matrícula
    ValidarDados('A', FCdsPrincipal.FieldByName('MATRICULA').asString, 15)+
    // 03 (066 até 115 / tam. 50) - Cargo (opcional)
    ValidarDados('A', ' ', 50)+
    // 04 (116 até 125 / tam. 10) - Data Admissão (opcional)
    ValidarDados('A', ' ', 10)+
    // 05 (126 até 185 / tam. 60) - Endereço (opcional)
    ValidarDados('A', ' ', 60)+
    // 06 (186 até 225 / tam. 40) - Bairro (opcional)
    ValidarDados('A', ' ', 40)+
    // 07 (226 até 275 / tam. 50) - Estado (opcional)
    ValidarDados('A', ' ', 50)+
    // 08 (276 até 283 / tam. 08) - CEP (opcional)
    ValidarDados('A', ' ', 8)+
    // 09 (284 até 298 / tam. 15) - Telefone
    ValidarDados('A', ' ', 15)+
    // 10 (299 até 348 / tam. 50) - Centro de Custo (opcional)
    ValidarDados('A', ' ', 50)+
    // 11 (349 até 353 / tam. 05) - Grupo da Carga
    GetGrupoCarga+
    // 12 (354 até 355 / tam. 01) - Tarifa
    'A'+
    // 13 (356 até 357 / tam. 02) - Qtde de uso diário
    ValidarDados('N', IntToStr(QuantUsoDiario), 2);
end;

function TCtrlArq_UberlandiaCard.GetRegistro_Pedido: string;
begin
  Result :=
    // 01 (01 até 15 / tam. 15) - Número da matrícula
    ValidarDados('A', FCdsPrincipal.FieldByName('MATRICULA').asString, 15)+
    // 02 (16 até 17 / tam. 02) - Número de Dias para carregamento
    ValidarDados('N', IntToStr(FCdsPrincipal.FieldByName('NUM_DIAS_TRAB').asInteger+
                               FCdsPrincipal.FieldByName('DIASEXTRA').asInteger), 2);
end;

end.
