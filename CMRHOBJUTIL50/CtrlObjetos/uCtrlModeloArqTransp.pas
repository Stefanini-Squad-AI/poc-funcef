unit uCtrlModeloArqTransp;

interface

uses Classes, SysUtils, Controls, DB, DBClient, uCmControlObject, uCmDbObject, IvDictio,
  uCmClientDataSet, uCMTypes, uCtrlCustomRH, uCtrlDiasTrab;

type
  TIncProgresso = procedure (NumPessoas, Incremento: integer) of object;

  TCtrlModeloArqTransp = class(TCtrlCustomRH)
  protected
    FCtrlDiasTrab: TCtrlDiasTrab;

    FCdsPrincipal: TClientDataSet;
    FCdsCCusto_X_Val: TClientDataSet;

    FSQL: TStringList; // SQL usado na Query principal

    FGerarAP: boolean;    
    FArquivoPorEmpresaProp: boolean; // Para ser gerado um arquivo sem quebra por estabelecimento

    FIdPessoa: string; // ID da pessoa atual
    FListaIdPessoa: string; // Lista de pessoas processadas (usada em vários métodos com
                            // auxiliar para saber se uma pessoa já foi contada ou processada)
    FQuantTotal_Estab: double; // Quantidade de vales transporte total de um estabelecimento
    FValorTotal_Estab: double; // Valor total da compra de vales transportes de um estabelecimento
    FQuantTotal: double; // Quantidade de vales transporte total de todos os estabelecimentos
    FValorTotal: double; // Valor total da compra de vales de todos os estabelecimentos

    FIdEmpresa: integer;

    FQuantDiasTrab: integer; // Quantidade de Dias Trabalhados a considerar
    FQuantDiasMinTrab: integer; // Quantidade Mínima de dias Trabalhados a considerar

    FNumSequencia: integer; // Nº de sequência do registro no arquivo

    FDescontarAfastamentos: boolean; // Indica se é para fazer o desconto dos afastamentos no período
    FDescontarFerias: boolean; // Indica se é para fazer o desconto dos férias no período
    FDescontarFeriados: boolean; // Indica se é para fazer o desconto dos feriados no período
    FDescontarFaltas: boolean; // Indica se é para fazer o desconto dos faltas no período

    FDataInicial: TDate; // Período Inicial a calcular as linhas de transporte
    FDataFinal: TDate; // Período Final a calcular as linhas de transporte
    FInicioFerias: TDate; // Período Inicial das férias da pessoa
    FFinalFerias: TDate; // Período Final das férias da pessoa
    FMesDescFaltas: integer;
    FAnoDescFaltas: integer;

    FListaAdmitidos: string;
    FListaIdEstab: string;
    FIdEstab: string; // Estabelecimento atual
    FFiltroCdsPrincipal: string;

    FArquivo: TStringList; // Conteúdo do arquivo

    // Listar todos os admitidos no período especificado
    function ListAdmitidos: OleVariant;

    // Montar a lista de pessoas admitidas no período
    procedure MontarListaAdmitidos;

    // Avançar o ponteiro da pessoa para a próxima linha de transporte
    procedure IrProxLinhaTransp;

    procedure IrProxPessoa;

    // Calcular alguns valores das linhas de transporte de cada pessoa. Os campos modificados são:
    // -> NUM_DIAS_TRAB = Número de dias trabalhados
    // -> QUANT_VALES   = NUM_DIAS_TRAB * Quantidade de vales por dia da linha de transporte
    // -> VALOR_COMPRA  = NUM_DIAS_TRAB * Valor da tarifa da linha de transporte
    procedure CalcularValoresPessoa;

    // Métodos de validação dos dados a serem gravados nos arquivos
    function ValidarDados(Tipo: char; Dado: string; Tamanho: word; Preenchedor: char = #0;
      Direcao: char = #0): string;

    // Métodos de Geração dos registros do arquivo
    procedure GerarRegistro_CabecalhoArquivo;
    procedure GerarRegistro_CabecalhoEstab;
    procedure GerarRegistro_Detalhe;
    procedure GerarRegistro_RodapeEstab;
    procedure GerarRegistro_RodapeArquivo;

    // Obter o Número de Pessoas a processar (para incrementar a barra de progressos)
    function GetNumFunc: integer;

    // Obter Quantidade de pessoas do estabelecimento atual e monta a lista destas pessoas
    function GetNumPessoasEstab: integer;

    // Métodos de Geração dos registros do arquivo a serem sobrepostos
    function GetRegistro_CabecalhoArquivo: string; virtual;
    function GetRegistro_CabecalhoEstab: string; virtual;
    function GetRegistro_Detalhe: string; virtual;
    function GetRegistro_RodapeEstab: string; virtual;
    function GetRegistro_RodapeArquivo: string; virtual;

    function GetArquivo: string; virtual;

    // Métodos de inicialização de dados específicos de cadas classe base
    procedure IniciarProcessoArquivo; virtual;
    procedure IniciarProcessoEstab; virtual;

    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;

    procedure AtualizarValorCCusto(const CodCCusto: string; const Valor: double);    
  private
    FIncProgresso: TIncProgresso;

    function GerarArquivo_Estabelecimento: boolean;
    function GerarArquivo_EmpresaProp: boolean;
  public
    constructor Create(const GerarAP, ArquivoPorEmpresaProp: boolean); reintroduce;
    destructor  Destroy; override;

    // Método de geração dos arquivos
    function ProcessarGeracao(IdEmpresa: integer; ListaIdEstab: string; DataInicial,
      DataFinal: TDate; DescontarAfastamentos, DescontarFerias, DescontarFeriados,
      DescontarFaltas: boolean; QuantDiasTrab, QuantDiasMinTrab: integer;
      MesDescFaltas, AnoDescFaltas: integer): boolean;

    property SQL: TStringList read FSQL;
    property CdsPrincipal: TClientDataSet read FCdsPrincipal write FCdsPrincipal;

    property Arquivo: string read GetArquivo;
    property CdsCCusto_X_Val: TClientDataSet read FCdsCCusto_X_Val write FCdsCCusto_X_Val;

    property IncProgresso: TIncProgresso read FIncProgresso write FIncProgresso;
  end;

implementation

uses uCtrlFuncoesRH, uCmCustomCdbObject;

{ TCtrlModeloArqTransp }

constructor TCtrlModeloArqTransp.Create(const GerarAP, ArquivoPorEmpresaProp: boolean);
begin
  inherited Create;
  FCtrlDiasTrab := TCtrlDiasTrab.Create;
  FSQL := TStringList.Create;
  FArquivo := TStringList.Create;

  FGerarAP := GerarAP;
  FArquivoPorEmpresaProp := ArquivoPorEmpresaProp;
end;

destructor TCtrlModeloArqTransp.Destroy;
begin
  FArquivo.Free;
  FSQL.Free;
  FCtrlDiasTrab.Free;
  inherited;
end;

procedure TCtrlModeloArqTransp.AfterInitialize;
begin
  inherited;
  FCtrlDiasTrab.InitializeAs(Self);
end;

procedure TCtrlModeloArqTransp.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlModeloArqTransp.DoChangeDataBase;
begin
  inherited;
  FCtrlDiasTrab.DataBaseName := DataBaseName;
end;

function TCtrlModeloArqTransp.ListAdmitidos: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  IDPESSOA' +CR_LF+
    'FROM' +CR_LF+
    '  FUNCIONARIO' +CR_LF+
    'WHERE' +CR_LF+
    '  (DATAADMISSAO >= TO_DATE(' +QuotedStr(DateToStr(IncData(FDataInicial,0,-1,0)))+ ',''DD/MM/YYYY'')) AND' +CR_LF+
    '  (DATAADMISSAO <= TO_DATE(' +QuotedStr(DateToStr(IncData(FDataFinal,0,-1,0)))+ ',''DD/MM/YYYY'')) AND' +CR_LF+
    QuebrarListaFiltro(2, '(IDPESSOA    ', FListaIdPessoa, 50));
end;

procedure TCtrlModeloArqTransp.MontarListaAdmitidos;
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

procedure TCtrlModeloArqTransp.IrProxLinhaTransp;
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
  IncProgresso(0, 1);
end;

procedure TCtrlModeloArqTransp.IrProxPessoa;
begin
  repeat
    FCdsPrincipal.Next;
  until (FIdPessoa <> FCdsPrincipal.FieldByName('IDPESSOA').asString) or (FCdsPrincipal.EOF);
end;

procedure TCtrlModeloArqTransp.CalcularValoresPessoa;
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
      FInicioFerias := FCdsPrincipal.FieldByName('FUNC_INICIOFERIAS').asDateTime;
      FFinalFerias := FCdsPrincipal.FieldByName('FUNC_FIMFERIAS').asDateTime;

      if (FQuantDiasTrab > 0) then
        iNumDiasTrab := FQuantDiasTrab
      else
        iNumDiasTrab := FCtrlDiasTrab.Calcular(StrToFloat(FIdPessoa), false, false,
          FDescontarFaltas, FDescontarAfastamentos, FDescontarFerias, FDescontarFeriados,
          FDataInicial, FDataFinal, FInicioFerias, FFinalFerias, FMesDescFaltas,
          FAnoDescFaltas);

      if (iNumDiasTrab < FQuantDiasMinTrab) then
        iNumDiasTrab := 0;
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
//  FCdsPrincipal.SaveToFile('c:\CdsPrincipal.Cds');
end;

// *************************************************************************************
// Valida os dados do VALE TRANSPORTE MAGNÉTICO
// Parâmetros: sTipo    - A (alfanumérico), N (numérico), V (valor)
//             sDado    - Dado a ser validado
//             wTamanho - Tamanho de retorno da string validada
// *************************************************************************************
function TCtrlModeloArqTransp.ValidarDados(Tipo: char; Dado: string; Tamanho: word;
  Preenchedor, Direcao: char): string;
var
  sTemp: string;
  c: word;
begin
  Result := '';
  Tipo := UpCase(Tipo);
  if not(Tipo in ['A','N']) or (Tamanho = 0) then
    exit;

  if (Preenchedor = #0) then
    if (Tipo = 'A') then
      Preenchedor := ' '
    else
      Preenchedor := '0';

  if (Direcao = #0) then
    if (Tipo = 'A') then
      Direcao := 'E'
    else
      Direcao := 'D';

  Direcao := UpCase(Direcao);    
  Dado := Trim(Dado);
  // ******************************
  // Faz tratamento das informações
  // ******************************
  if (Tipo = 'A') then // A = Campos alfanuméricos
  begin
    try
      Dado := UpperCase(NormalizaString(ConverteCar(Dado)));

      // Caso o Dado tenha um tamanho maior que o tamanho disponível, o valor retornado
      // será o conteúdo do Dado até o tamanho disponível.
      if (Length(Dado) > Tamanho) then
        sTemp := Copy(Dado, 1, Tamanho)
      else // Caso contrário, simplemente alinhar o Dado a esquerda
        sTemp := Alinha(Dado, Tamanho, Direcao, Preenchedor);
    except
      sTemp := Replicate(Preenchedor, Tamanho);
    end;
  end
  else // N = Campos Numéricos
  begin
    try
      // Retirar todos os caracteres não-numéricos
      for c:=1 to Length(Dado) do
        if (Dado[c] in ['0'..'9']) then
          sTemp := sTemp + Dado[c];

      // Caso o Dado tenha um tamanho maior que o tamanho disponível, o valor retornado
      // será o conteúdo do Dado até o tamanho disponível.
      if (Length(sTemp) > Tamanho) then
        sTemp := Copy(sTemp, 1, Tamanho)
      else // Caso contrário, simplemente alinhar o Dado a direita
        sTemp := Alinha(sTemp, Tamanho, Direcao, Preenchedor);
    except
      sTemp := Replicate(Preenchedor, Tamanho);
    end;
  end;
  Result := sTemp;
end;

procedure TCtrlModeloArqTransp.GerarRegistro_CabecalhoArquivo;
var
  sLinha: string;
begin
  sLinha := GetRegistro_CabecalhoArquivo;
  if (sLinha <> '') then
    FArquivo.Add(sLinha);
end;

procedure TCtrlModeloArqTransp.GerarRegistro_CabecalhoEstab;
var
  sLinha: string;
begin
  sLinha := GetRegistro_CabecalhoEstab;
  if (sLinha <> '') then
    FArquivo.Add(sLinha);
end;

procedure TCtrlModeloArqTransp.GerarRegistro_Detalhe;
var
  sLinha: string;
begin
  repeat
    FIdPessoa := FCdsPrincipal.FieldByName('IDPESSOA').asString;
    if (FCdsPrincipal.FieldByName('QUANT_VALES').asFloat > 0) then
    begin
      sLinha := GetRegistro_Detalhe;
      if (sLinha <> '') then
        FArquivo.Add(sLinha);
    end
    else
      IrProxPessoa;

  until (FCdsPrincipal.EOF);
end;

procedure TCtrlModeloArqTransp.GerarRegistro_RodapeEstab;
var
  sLinha: string;
begin
  sLinha := GetRegistro_RodapeEstab;
  if (sLinha <> '') then
    FArquivo.Add(sLinha);
end;

procedure TCtrlModeloArqTransp.GerarRegistro_RodapeArquivo;
var
  sLinha: string;
begin
  sLinha := GetRegistro_RodapeArquivo;
  if (sLinha <> '') then
    FArquivo.Add(sLinha);
end;

function TCtrlModeloArqTransp.GetRegistro_CabecalhoArquivo: string;
begin
  Result := '';
end;

function TCtrlModeloArqTransp.GetRegistro_CabecalhoEstab: string;
begin
  Result := '';
end;

function TCtrlModeloArqTransp.GetRegistro_Detalhe: string;
begin
  Result := '';
end;

function TCtrlModeloArqTransp.GetRegistro_RodapeEstab: string;
begin
  Result := '';
end;

function TCtrlModeloArqTransp.GetRegistro_RodapeArquivo: string;
begin
  Result := '';
end;

function TCtrlModeloArqTransp.GetArquivo: string;
begin
  Result := FArquivo.Text;
end;

function TCtrlModeloArqTransp.GetNumFunc: integer;
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

function TCtrlModeloArqTransp.GetNumPessoasEstab: integer;
begin
  Result := 0;
  FListaIdPessoa := '';
  FCdsPrincipal.First;
  repeat
    FIdPessoa := FCdsPrincipal.FieldByName('IDPESSOA').asString;
    if (FCdsPrincipal.FieldByName('NUM_DIAS_TRAB').asInteger > 0) and
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

procedure TCtrlModeloArqTransp.IniciarProcessoArquivo;
begin
  // Método que pode ser sobreposto se necessário inicializar o processamento
end;

procedure TCtrlModeloArqTransp.IniciarProcessoEstab;
begin
  // Método que pode ser sobreposto se necessário inicializar o processamento
end;

function TCtrlModeloArqTransp.GerarArquivo_Estabelecimento: boolean;
var
  sListaIdEstab: string;
begin
  try 
    // Loop para cada estabelecimento selecionado
    sListaIdEstab := FListaIdEstab;
    while (sListaIdEstab <> '') do
    begin
      // Obter o estabelecimento atual
      ExtraiString(sListaIdEstab, FIdEstab, ',');

      FCdsPrincipal.Filtered := false;
      if (FFiltroCdsPrincipal = '') then
        FCdsPrincipal.Filter := 'IDESTAB = ' + FIdEstab
      else
        FCdsPrincipal.Filter := FFiltroCdsPrincipal + ' AND IDESTAB = ' + FIdEstab;
      FCdsPrincipal.Filtered := true;

      // Pular o estabelecimento atual se não houver pessoas a gerar o arquivo
      if (FCdsPrincipal.IsEmpty) then
        continue;

      // Inicializar valores específicos para o estabelecimento atual
      FQuantTotal_Estab := 0;
      FValorTotal_Estab := 0;
      IniciarProcessoEstab;

      FCdsPrincipal.First;

      // Gerar os registros do estabelecimento atual
      GerarRegistro_CabecalhoArquivo;
      GerarRegistro_CabecalhoEstab;
      GerarRegistro_Detalhe;
      GerarRegistro_RodapeEstab;
    end;
    GerarRegistro_RodapeArquivo;
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlModeloArqTransp.GerarArquivo_EmpresaProp: boolean;
begin
  try
    FCdsPrincipal.Filtered := false;
    FCdsPrincipal.Filter := FFiltroCdsPrincipal;
    FCdsPrincipal.Filtered := true;

    if not(FCdsPrincipal.IsEmpty) then
    begin
      // Inicializar valores
      FNumSequencia := 1;

      FCdsPrincipal.First;

      // Gerar os registros
      GerarRegistro_CabecalhoArquivo;
      GerarRegistro_Detalhe;
      GerarRegistro_RodapeArquivo;
    end;
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlModeloArqTransp.ProcessarGeracao(IdEmpresa: integer; ListaIdEstab: string;
  DataInicial, DataFinal: TDate; DescontarAfastamentos, DescontarFerias, DescontarFeriados,
  DescontarFaltas: boolean; QuantDiasTrab, QuantDiasMinTrab: integer; MesDescFaltas,
  AnoDescFaltas: integer): boolean;
begin
  FDataInicial := DataInicial;
  FDataFinal := DataFinal;
  FIdEmpresa := IdEmpresa;
  FListaIdEstab := ListaIdEstab;
  FDescontarAfastamentos := DescontarAfastamentos;
  FDescontarFerias := DescontarFerias;
  FDescontarFeriados := DescontarFeriados;
  FDescontarFaltas := DescontarFaltas;
  FQuantDiasTrab := QuantDiasTrab;
  FQuantDiasMinTrab := QuantDiasMinTrab;
  FMesDescFaltas := MesDescFaltas;
  FAnoDescFaltas := AnoDescFaltas;

  try
    FQuantTotal := 0;
    FValorTotal := 0;
    FFiltroCdsPrincipal := '';
    FArquivo.Clear;

    // Indicar o Número de Pessoas a processar para que a barra de progresso seja incrementada
    IncProgresso(GetNumFunc, 0);

    // Calcular alguns valores das linhas de transporte das pessoas
    CalcularValoresPessoa;

    IniciarProcessoArquivo;
    if (FArquivoPorEmpresaProp) then
      Result := GerarArquivo_EmpresaProp
    else
      Result := GerarArquivo_Estabelecimento;

    if not(Result) then
      raise Exception.Create(MessageInfo);

    Result := (FArquivo.Count > 0);
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
end;

procedure TCtrlModeloArqTransp.AtualizarValorCCusto(const CodCCusto: string;
  const Valor: double);
begin
  if not(FGerarAP) or (FCdsPrincipal.FieldByName('SOMADO').asInteger = 1) then
    exit;

  // Atualização do valor do Centro de Custo da pessoa
  if (FCdsCCusto_X_Val.Locate('CODCENTROCUSTO', CodCCusto, [])) then
  begin
    FCdsCCusto_X_Val.Edit;
    FCdsCCusto_X_Val.FieldByName('VALOR').asFloat :=
      FCdsCCusto_X_Val.FieldByName('VALOR').asFloat + Valor;
  end
  else
  begin
    FCdsCCusto_X_Val.Insert;
    FCdsCCusto_X_Val.FieldByName('CODCENTROCUSTO').asString := CodCCusto;
    FCdsCCusto_X_Val.FieldByName('VALOR').asFloat := Valor;
  end;
  FCdsCCusto_X_Val.Post;

  // Atualizar o Flag (campo "SOMADO") que indica que a pessoa atual já entrou no cálculo.
  // Serve especialmente, quando o usuário faz a geração de mais de um tipo de arquivo de
  // uma só vez pois isto faria com que os valores fossem somados para cada tipo de arquivo.
  FCdsPrincipal.Edit;
  FCdsPrincipal.FieldByName('SOMADO').asInteger := 1;
  FCdsPrincipal.Post;
end;

end.
