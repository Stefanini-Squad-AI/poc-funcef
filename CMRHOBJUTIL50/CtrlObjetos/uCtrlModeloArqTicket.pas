// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------

Unit uCtrlModeloArqTicket;

interface

uses Classes, SysUtils, Controls, DB, DBClient, uCmControlObject, uCmDbObject, IvDictio,
  uCmClientDataSet, uCMTypes, uCtrlCustomRH, uCtrlDiasTrab, Usistema;

type
  TIncProgresso = procedure (NumPessoas, Incremento: integer) of object;
  TAgrupamentoRegistros = (tpEmpresaProp, tpEstabelecimento, tpCustomizado);

  TParModeloArqTicket = class
    GerarAP: boolean;
    CodCliente: string;
    CalculaValores: boolean;
    AgrupamentoRegistros: TAgrupamentoRegistros; 
    IdEmpresa: integer;
    ListaIdEstab: string; // Lista de Estabelecimentos selecionados pelo usuário
    DataIni: TDate;
    DataFin: TDate;
    DescontarAfastamentos: boolean; // Indica se é para fazer o desconto dos afastamentos no período
    DescontarFerias: boolean; // Indica se é para fazer o desconto dos férias no período
    DescontarFeriados: boolean; // Indica se é para fazer o desconto dos feriados no período
    DescontarFaltas: boolean; // Indica se é para fazer o desconto dos faltas no período
    QuantDiasTrab: integer; // Quantidade de Dias Trabalhados a considerar
    QuantDiasMinTrab: integer; // Quantidade Mínima de dias Trabalhados a considerar
    MesDescFaltas: integer;
    AnoDescFaltas: integer;
    ValorTicket: currency; // Valor de cada Ticket
  end;

  TCtrlModeloArqTicket = class(TCtrlCustomRH)
  protected
    FCtrlDiasTrab: TCtrlDiasTrab;

    FCdsPrincipal: TClientDataSet;
    FCdsCCusto_X_Val: TClientDataSet;

    FSQL: TStringList; // SQL usado na Query principal

    FParametros: TParModeloArqTicket;

    FIdPessoa: string; // ID da pessoa atual
    FListaIdPessoa: string; // Lista de pessoas processadas (usada em vários métodos com
                            // auxiliar para saber se uma pessoa já foi contada ou processada)
    FQuantTotalGrupo: double; // Quantidade de vales transporte total de um grupo
    FValorTotalGrupo: double; // Valor total da compra de vales transportes de um grupo
    FQuantTotal: double; // Quantidade de vales transporte total de todos os grupos
    FValorTotal: double; // Valor total da compra de vales de todos os grupos

    FNumSequencia: integer; // Nº de sequência do registro no arquivo

    FInicioFerias: TDate; // Período Inicial das férias da pessoa
    FFinalFerias: TDate; // Período Final das férias da pessoa

    FIdEstab: string; // Estabelecimento atual
    FFiltroCdsPrincipal: string;

    FArquivo: TStringList; // Conteúdo do arquivo

    // Calcular alguns valores das linhas de transporte de cada pessoa.
    // Os campos modificados são:
    // -> NUM_DIAS_TRAB = Número de dias trabalhados
    // -> QUANT_TICKETS = NUM_DIAS_TRAB * Quantidade de vales por dia da linha de transporte
    // -> VALOR_COMPRA  = QUANT_TICKETS * Valor da tarifa da linha de transporte
    procedure CalcularValoresPessoa;

    // Métodos de validação dos dados a serem gravados nos arquivos
    function ValidarDados(Tipo: char; Dado: string; Tamanho: word): string;

    // Métodos de Geração dos registros do arquivo
    procedure GerarRegistro_CabecalhoArquivo;
    procedure GerarRegistro_Cabecalho_GrupoCustomizado;
    procedure GerarRegistro_Detalhe;
    procedure GerarRegistro_Rodape_GrupoCustomizado;
    procedure GerarRegistro_RodapeArquivo;

    // Métodos de Geração dos registros do arquivo a serem sobrepostos
    function GetRegistro_CabecalhoArquivo: string; virtual;
    function GetRegistro_Cabecalho_GrupoCustomizado: string; virtual;
    function GetRegistro_Detalhe: string; virtual;
    function GetRegistro_Rodape_GrupoCustomizado: string; virtual;
    function GetRegistro_RodapeArquivo: string; virtual;

    function GetArquivo: string; virtual;

    // Métodos de inicialização de dados específicos de cadas classe base
    procedure IniciarProcessoArquivo; virtual;
    procedure IniciarProcessoGrupoCustomizado; virtual;

    function  ContinuaLoopGrupoCustomizado: boolean; virtual;
    procedure FiltraGrupoCustomizado; virtual;
    
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;

    procedure AtualizarValorCCusto(const CodCCusto: string; const Valor: double);
  private
    FIncProgresso: TIncProgresso;

    function GerarArquivo_Customizado: boolean;
    function GerarArquivo_Estabelecimento: boolean;
    function GerarArquivo_EmpresaProp: boolean;
  public
    constructor Create(Param: TParModeloArqTicket); reintroduce;
    destructor  Destroy; override;

    // Método de geração dos arquivos
    function ProcessarGeracao: boolean;

    property SQL: TStringList read FSQL;
    property CdsPrincipal: TClientDataSet read FCdsPrincipal write FCdsPrincipal;

    property Arquivo: string read GetArquivo;
    property CdsCCusto_X_Val: TClientDataSet read FCdsCCusto_X_Val write FCdsCCusto_X_Val;

    property IncProgresso: TIncProgresso read FIncProgresso write FIncProgresso;
  end;
                                      
implementation

uses uCtrlFuncoesRH, uCmCustomCdbObject;

{ TCtrlModeloArqTicket }

constructor TCtrlModeloArqTicket.Create(Param: TParModeloArqTicket);
begin
  inherited Create;
  FCtrlDiasTrab := TCtrlDiasTrab.Create;
  FSQL := TStringList.Create;
  FArquivo := TStringList.Create;

  FParametros := Param;
end;

destructor TCtrlModeloArqTicket.Destroy;
begin
  FArquivo.Free;
  FSQL.Free;
  FCtrlDiasTrab.Free;
  inherited;
end;

procedure TCtrlModeloArqTicket.AfterInitialize;
begin
  inherited;
  FCtrlDiasTrab.InitializeAs(Self);
end;

procedure TCtrlModeloArqTicket.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlModeloArqTicket.DoChangeDataBase;
begin
  inherited;
  FCtrlDiasTrab.DataBaseName := DataBaseName;
end;

procedure TCtrlModeloArqTicket.CalcularValoresPessoa;
var
  iNumDiasTrab: integer;
begin
  FCdsPrincipal.First;
  repeat
    FInicioFerias := FCdsPrincipal.FieldByName('INICIOFERIAS').asDateTime;
    FFinalFerias := FCdsPrincipal.FieldByName('FIMFERIAS').asDateTime;

    if (FParametros.QuantDiasTrab > 0) then
      iNumDiasTrab := FParametros.QuantDiasTrab
    else
    begin
      iNumDiasTrab := FCtrlDiasTrab.Calcular(FCdsPrincipal.FieldByName('IDPESSOA').asFloat,
        false, false, FParametros.DescontarFaltas, FParametros.DescontarAfastamentos,
        FParametros.DescontarFerias, FParametros.DescontarFeriados, FParametros.DataIni,
        FParametros.DataFin, FInicioFerias, FFinalFerias, FParametros.MesDescFaltas,
        FParametros.AnoDescFaltas);
    end;

    if (iNumDiasTrab < FParametros.QuantDiasMinTrab) then
      iNumDiasTrab := 0;

    FCdsPrincipal.Edit;
    FCdsPrincipal.FieldByName('NUM_DIAS_TRAB').asInteger := iNumDiasTrab;
    FCdsPrincipal.FieldByName('QUANT_TICKETS').asInteger :=
      FCdsPrincipal.FieldByName('NUM_DIAS_TRAB').asInteger +
      FCdsPrincipal.FieldByName('NUM_DIAS_EXTRAS').asInteger;
    FCdsPrincipal.FieldByName('VALOR_COMPRA').asFloat :=
      (FCdsPrincipal.FieldByName('QUANT_TICKETS').asInteger * FParametros.ValorTicket);

    FCdsPrincipal.Post;
    FCdsPrincipal.Next;
  until (FCdsPrincipal.EOF);
  {$IFDEF DEPURANDO}
  //FCdsPrincipal.SaveToFile('c:\CdsPrincipal.Cds');
  FCdsPrincipal.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CdsPrincipal.Cds');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  {$ENDIF}
end;

// *************************************************************************************
// Valida os dados do VALE TRANSPORTE MAGNÉTICO
// Parâmetros: sTipo    - A (alfanumérico), N (numérico), V (valor)
//             sDado    - Dado a ser validado
//             wTamanho - Tamanho de retorno da string validada
// *************************************************************************************
function TCtrlModeloArqTicket.ValidarDados(Tipo: char; Dado: string; Tamanho: word): string;
var
  sTemp: string;
  c: word;
begin
  Result := '';
  Tipo := UpCase(Tipo);
  if not(Tipo in ['A','N']) or (Tamanho = 0) then
    exit;

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
        sTemp := Alinha(Dado, Tamanho, 'E', ' ');
    except
      sTemp := Replicate(' ', Tamanho);
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
        sTemp := Alinha(sTemp, Tamanho, 'D', '0');
    except
      sTemp := Replicate('0', Tamanho);
    end;
  end;
  Result := sTemp;
end;

procedure TCtrlModeloArqTicket.GerarRegistro_CabecalhoArquivo;
var
  sLinha: string;
begin
  sLinha := GetRegistro_CabecalhoArquivo;
  if (sLinha <> '') then
    FArquivo.Add(sLinha);
end;

procedure TCtrlModeloArqTicket.GerarRegistro_Cabecalho_GrupoCustomizado;
var
  sLinha: string;
begin
  sLinha := GetRegistro_Cabecalho_GrupoCustomizado;
  if (sLinha <> '') then
    FArquivo.Add(sLinha);
end;

procedure TCtrlModeloArqTicket.GerarRegistro_Detalhe;
var
  sLinha: string;
begin
  repeat
    FIdPessoa := FCdsPrincipal.FieldByName('IDPESSOA').asString;
    sLinha := GetRegistro_Detalhe;
    if (sLinha <> '') then
      FArquivo.Add(sLinha);

    FCdsPrincipal.Next;
    //IncProgresso(0, 1);
  until (FCdsPrincipal.EOF);
end;

procedure TCtrlModeloArqTicket.GerarRegistro_Rodape_GrupoCustomizado;
var
  sLinha: string;
begin
  sLinha := GetRegistro_Rodape_GrupoCustomizado;
  if (sLinha <> '') then
    FArquivo.Add(sLinha);
end;

procedure TCtrlModeloArqTicket.GerarRegistro_RodapeArquivo;
var
  sLinha: string;
begin
  sLinha := GetRegistro_RodapeArquivo;
  if (sLinha <> '') then
    FArquivo.Add(sLinha);
end;

function TCtrlModeloArqTicket.GetRegistro_CabecalhoArquivo: string;
begin
  Result := '';
end;

function TCtrlModeloArqTicket.GetRegistro_Cabecalho_GrupoCustomizado: string;
begin
  Result := '';
end;

function TCtrlModeloArqTicket.GetRegistro_Detalhe: string;
begin
  Result := '';
end;

function TCtrlModeloArqTicket.GetRegistro_Rodape_GrupoCustomizado: string;
begin
  Result := '';
end;

function TCtrlModeloArqTicket.GetRegistro_RodapeArquivo: string;
begin
  Result := '';
end;

function TCtrlModeloArqTicket.GetArquivo: string;
begin
  Result := FArquivo.Text;
end;

procedure TCtrlModeloArqTicket.IniciarProcessoArquivo;
begin
  // Método que pode ser sobreposto se necessário inicializar o processamento
end;

procedure TCtrlModeloArqTicket.IniciarProcessoGrupoCustomizado;
begin
  // Método que pode ser sobreposto se necessário inicializar o processamento
end;

function TCtrlModeloArqTicket.ContinuaLoopGrupoCustomizado: boolean;
begin
  // Método que pode ser sobreposto se necessário inicializar o processamento
  Result := false;
end;

procedure TCtrlModeloArqTicket.FiltraGrupoCustomizado;
begin
  // Método que pode ser sobreposto se necessário inicializar o processamento
end;

function TCtrlModeloArqTicket.GerarArquivo_Customizado: boolean;
begin
  try
    GerarRegistro_CabecalhoArquivo;
    // Loop para cada ítem do grupo customizado
    while (ContinuaLoopGrupoCustomizado) do
    begin
      FiltraGrupoCustomizado;
      if not(FCdsPrincipal.IsEmpty) then
      begin
        // Inicializar valores específicos para o ítem do grupo customizado atual
        FQuantTotalGrupo := 0;
        FValorTotalGrupo := 0;
        IniciarProcessoGrupoCustomizado;

        FCdsPrincipal.First;

        // Gerar os registros do estabelecimento atual
        GerarRegistro_Cabecalho_GrupoCustomizado;
        GerarRegistro_Detalhe;
        GerarRegistro_Rodape_GrupoCustomizado;
      end;
    end;
    GerarRegistro_RodapeArquivo;
    Result := true;
  except
    on E: Exception do
    begin
      if (FTipoRetorno = RETORNO_NORMAL) then
        FTipoRetorno := RETORNO_ERRO;

      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlModeloArqTicket.GerarArquivo_Estabelecimento: boolean;
var
  sListaIdEstab: string;
begin
  try 
    // Loop para cada estabelecimento selecionado
    sListaIdEstab := FParametros.ListaIdEstab;
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
      FQuantTotalGrupo := 0;
      FValorTotalGrupo := 0;
      IniciarProcessoGrupoCustomizado;

      FCdsPrincipal.First;

      // Gerar os registros do estabelecimento atual
      GerarRegistro_CabecalhoArquivo;
      GerarRegistro_Cabecalho_GrupoCustomizado;
      GerarRegistro_Detalhe;
      GerarRegistro_Rodape_GrupoCustomizado;
    end;
    GerarRegistro_RodapeArquivo;
    Result := true;
  except
    on E: Exception do
    begin
      if (FTipoRetorno = RETORNO_NORMAL) then
        FTipoRetorno := RETORNO_ERRO;

      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlModeloArqTicket.GerarArquivo_EmpresaProp: boolean;
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
      if (FTipoRetorno = RETORNO_NORMAL) then
        FTipoRetorno := RETORNO_ERRO;

      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlModeloArqTicket.ProcessarGeracao: boolean;
begin
  try
    FQuantTotal := 0;
    FValorTotal := 0;
    FArquivo.Clear;

    // Indicar o Número de Pessoas a processar para que a barra de progresso seja incrementada
    IncProgresso(FCdsPrincipal.RecordCount, 0);

    // Calcular alguns valores das linhas de transporte das pessoas
    if (FParametros.CalculaValores) then
    begin
      CalcularValoresPessoa;
      FFiltroCdsPrincipal := 'VALOR_COMPRA > 0';
    end
    else
      FFiltroCdsPrincipal := '';

    FCdsPrincipal.First;
    IniciarProcessoArquivo;
    FCdsPrincipal.First;

    case (FParametros.AgrupamentoRegistros) of
      tpEmpresaProp     : Result := GerarArquivo_EmpresaProp;
      tpEstabelecimento : Result := GerarArquivo_Estabelecimento;
      else                Result := GerarArquivo_Customizado; // tpCustomizado
    end;
    
    if not(Result) then
      raise Exception.Create(MessageInfo);

    Result := (FArquivo.Count > 0);
  except
    on E: Exception do
    begin
      if (FTipoRetorno = RETORNO_NORMAL) then
        FTipoRetorno := RETORNO_ERRO;

      MessageInfo := E.Message;
      Result := false;
    end;
  end;
end;

procedure TCtrlModeloArqTicket.AtualizarValorCCusto(const CodCCusto: string;
  const Valor: double);
begin
  if not(FParametros.GerarAP) then
    exit;
    
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
end;

end.
