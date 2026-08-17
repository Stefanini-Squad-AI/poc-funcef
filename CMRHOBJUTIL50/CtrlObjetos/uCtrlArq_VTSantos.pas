unit uCtrlArq_VTSantos;

interface

uses Classes, SysUtils, Controls, DB, DBClient, uCmControlObject, uCmDbObject, IvDictio,
  uCmClientDataSet, uCMTypes, uCtrlModeloArqTransp;

type
  TCtrlArq_VTSantos = class(TCtrlModeloArqTransp)
  protected
    procedure IniciarProcessoArquivo; override;

    // Métodos de Geração dos registros do arquivo
    function GetRegistro_CabecalhoArquivo: string; override;
    function GetRegistro_Detalhe: string; override;
    function GetRegistro_RodapeArquivo: string; override;

    function GetArquivo: string; override;
  private
    FCodClienteVTSantos: integer;
    FNumPedidoVTSantos: integer;
    FDataPedidoVTSantos: TDate;
    FDataLiberacaoVTSantos: TDate;
    
    function GetQuantTotal: integer;
    function GetValorTotal: double;
  public
    constructor Create(const GerarAP: boolean; const CodClienteVTSantos,
      NumPedidoVTSantos: integer; const DataPedidoVTSantos,
      DataLiberacaoVTSantos: TDate); reintroduce;
    destructor  Destroy; override;
  end;

implementation

uses uCtrlFuncoesRH;

{ TCtrlArq_VTSantos }

constructor TCtrlArq_VTSantos.Create(const GerarAP: boolean; const CodClienteVTSantos,
  NumPedidoVTSantos: integer; const DataPedidoVTSantos, DataLiberacaoVTSantos: TDate);
begin
  inherited Create(GerarAP, true);
  FCodClienteVTSantos := CodClienteVTSantos;
  FNumPedidoVTSantos := NumPedidoVTSantos;
  FDataPedidoVTSantos := DataPedidoVTSantos;
  FDataLiberacaoVTSantos := DataLiberacaoVTSantos;
end;

destructor TCtrlArq_VTSantos.Destroy;
begin
  inherited;
end;

function TCtrlArq_VTSantos.GetRegistro_CabecalhoArquivo: string;
begin
  Result :=
    // 01-Versão do Arquivo
    '00' +
    // 02-Filler
    Replicate('0',8) +
    // 03-Código da Empresa
    ValidarDados('N', IntToStr(FCodClienteVTSantos), 8)+
    // 03-Inscrição da Empresa
    ValidarDados('N', FCdsPrincipal.FieldByName('INSCR_EMPRESA').asString, 15)+
    // 04-Número do Pedido
    ValidarDados('N', IntToStr(FNumPedidoVTSantos), 8)+
    // 05-Data do Pedido
    ValidarDados('N', FormatDateTime('YYYYMMDD', FDataPedidoVTSantos), 8)+
    // 06-Data da Liberação
    ValidarDados('N', FormatDateTime('YYYYMMDD', FDataLiberacaoVTSantos), 8)+
    // 07-Data da Expiração
    ValidarDados('N', FormatDateTime('YYYYMMDD', FDataLiberacaoVTSantos), 8)+
    // 08-Quantidade de Cartões
    ValidarDados('N', FloatToStr(FQuantTotal), 5)+
    // 09-Valor dos Cartões
    ValidarDados('N', Float2String(FValorTotal), 15)+
    // 10-Filler
    Replicate('0',15);
end;

function TCtrlArq_VTSantos.GetRegistro_Detalhe: string;
var
  dValVales: double;
  sNumCartao: string;
begin
  FCdsPrincipal.First;
  Result := '';
  repeat
    FIdPessoa := FCdsPrincipal.FieldByName('IDPESSOA').asString;
    sNumCartao := FCdsPrincipal.FieldByName('NUM_CARTAO').asString;
    dValVales := 0;
    repeat
      dValVales := dValVales + FCdsPrincipal.FieldByName('VALOR_COMPRA').asFloat;
      FCdsPrincipal.Next;
    until (FIdPessoa <> FCdsPrincipal.FieldByName('IDPESSOA').asString) or (FCdsPrincipal.EOF);

    Result := Result +
      // 01-Número do Cartão
      ValidarDados('N', Trim(sNumCartao), 10)+
      // 02-Valor do Cartão
      ValidarDados('N', Float2String(dValVales), 6);

    // Atualização dos valores do Centro de Custo
    if not(FCdsPrincipal.EOF) then
      FCdsPrincipal.Prior;
    AtualizarValorCCusto(FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString, dValVales);
    FCdsPrincipal.Next;

    IncProgresso(0, 1);
  until (FCdsPrincipal.EOF);
end;

function TCtrlArq_VTSantos.GetRegistro_RodapeArquivo: string;
begin
  Result := Replicate('0', 50);
end;

function TCtrlArq_VTSantos.GetArquivo: string;
var
  c: Cardinal;
  sArquivo: string;
begin
  sArquivo := '';
  for c:=1 to Length(FArquivo.Text) do
    if (FArquivo.Text[c] in [#32..#126]) then
      sArquivo := sArquivo + FArquivo.Text[c];

  Result := sArquivo;
end;

procedure TCtrlArq_VTSantos.IniciarProcessoArquivo;
begin
  inherited;
  FFiltroCdsPrincipal := 'TIPOLINHA = ''C'' AND VALOR_COMPRA > 0';
  FCdsPrincipal.Filtered := false;
  FCdsPrincipal.Filter := FFiltroCdsPrincipal;
  FCdsPrincipal.Filtered := true;
  FCdsPrincipal.First;
  FQuantTotal := GetQuantTotal;
  FValorTotal := GetValorTotal;
end;

function TCtrlArq_VTSantos.GetQuantTotal: integer;
begin
  Result := 0;
  FCdsPrincipal.First;
  FIdPessoa := FCdsPrincipal.FieldByName('IDPESSOA').asString;
  repeat
    Inc(Result);
    IrProxPessoa;
    FIdPessoa := FCdsPrincipal.FieldByName('IDPESSOA').asString;
  until (FCdsPrincipal.EOF);
end;

function TCtrlArq_VTSantos.GetValorTotal: double;
begin
  Result := 0;
  FCdsPrincipal.First;
  repeat
    Result := Result + FCdsPrincipal.FieldByName('VALOR_COMPRA').asFloat;
    FCdsPrincipal.Next;
  until (FCdsPrincipal.EOF);
end;

end.
