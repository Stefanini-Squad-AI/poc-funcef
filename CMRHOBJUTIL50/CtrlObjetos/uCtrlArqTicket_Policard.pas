unit uCtrlArqTicket_Policard;

interface

uses Classes, SysUtils, Controls, DB, DBClient, uCmControlObject, uCmDbObject, IvDictio,
  uCmClientDataSet, uCMTypes, uCtrlModeloArqTicket;

type
  TParModelo_Policard = class(TParModeloArqTicket)
    ListaIdRubrica: string;
  end;

  TCtrlArqTicket_Policard = class(TCtrlModeloArqTicket)
  protected
    procedure IniciarProcessoArquivo; override;

    // Métodos de Geração dos registros do arquivo
    function GetRegistro_Cabecalho_GrupoCustomizado: string; override;
    function GetRegistro_Detalhe: string; override;
    function GetRegistro_RodapeArquivo: string; override;
  private
    FCdsValor: TCMClientDataSet;

    FNumPessoas: word;

    function GetParam: TParModelo_Policard;

    function GetValor(const IdPessoa: double): double;
  public
    constructor Create(Param: TParModelo_Policard); reintroduce;
    destructor  Destroy; override;
  end;

implementation

uses StrUtils, uCMTranslate, uCtrlFuncoesRH, uCtrlCustomRH;

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_PESSOAS_SEM_RUB =
    'Nenhuma Rubrica Selecionada para as pessoas:1'+
    'do(s) Estabelecimento(s) indicado(s) foram geradas';

{ TCtrlArqTicket_Policard }

constructor TCtrlArqTicket_Policard.Create(Param: TParModelo_Policard);
begin
  Param.AgrupamentoRegistros := tpEstabelecimento;
  Param.CalculaValores := false;

  inherited Create(TParModeloArqTicket(Param));

  FCdsValor := TCMClientDataSet.Create(nil);
end;

destructor TCtrlArqTicket_Policard.Destroy;
begin
  FCdsValor.Free;
  inherited;
end;

function TCtrlArqTicket_Policard.GetRegistro_Cabecalho_GrupoCustomizado: string;
begin
  Result :=
    // Marca de Início de um Arquivo
    MARCA_DIVISAO_ARQUIVO+ FCdsPrincipal.FieldByName('INSCR_ESTAB').asString +
    CR_LF+
    // **************************
    // Registro Header do Arquivo
    // **************************
    // 01 (001 até 001 / tam. 01) - Tipo do Registro
    'H' +
    // 02 (002 até 006 / tam. 05) - Código do Produto
    '00005'+
    // 03 (007 até 056 / tam. 50) - CARTAO PAT ALIMENTACAO
    Alinha('CARTAO PAT ALIMENTACAO',50,'E',' ')+
    // 04 (057 até 064 / tam. 08) - Data da Geração do Arquivo
    FormatDateTime('DDMMYYYY', Date);
end;

function TCtrlArqTicket_Policard.GetRegistro_Detalhe: string;
var
  dValor: double;
begin
  dValor := GetValor(FCdsPrincipal.FieldByName('IDPESSOA').asFloat);
  if (dValor <= 0) then
  begin
    IncProgresso(0, 1);
    Result := '';
    exit;
  end;

  Inc(FNumSequencia);

  // Atualização dos valores do Centro de Custo
  AtualizarValorCCusto(FCdsPrincipal.FieldByName('COD_CCUSTO').asString, dValor);

  Result :=
    // 01 (001 até 001 / tam. 01) - Tipo do Registro
    'D' +
    // 02 (002 até 007 / tam. 06) - Código da Empresa
    ValidarDados('N', GetParam.CodCliente, 6)+
    // 03 (008 até 022 / tam. 15) - Matrícula
    // Deve ser preenchido com 10 números alinhados a direita + 5 espaços a esquerda
    ValidarDados('N', FCdsPrincipal.FieldByName('MATRICULA').asString, 10)+ Replicate(' ',5)+
    // 04 (023 até 072 / tam. 50) - Nome
    ValidarDados('A', FCdsPrincipal.FieldByName('NOME').asString, 50)+
    // 05 (073 até 073 / tam. 01) - Sexo
    ValidarDados('A', FCdsPrincipal.FieldByName('SEXO').asString, 1)+
    // 06 (074 até 081 / tam. 08) - Data de Nascimento
    FormatDateTime('DDMMYYYY', FCdsPrincipal.FieldByName('DATANASC').asDateTime)+
    // 07 (082 até 092 / tam. 11) - CPF
    ValidarDados('A', FCdsPrincipal.FieldByName('CPF').asString, 11)+
    // 08 (093 até 107 / tam. 15) - RG
    ValidarDados('A', FCdsPrincipal.FieldByName('RG').asString, 15)+
    // 09 (108 até 157 / tam. 50) - Nome do Pai
    ValidarDados('A', FCdsPrincipal.FieldByName('NOMEPAI').asString, 50)+
    // 10 (158 até 207 / tam. 50) - Nome da Mâe
    ValidarDados('A', FCdsPrincipal.FieldByName('NOMEMAE').asString, 50)+
    // 11 (208 até 213 / tam. 06) - Valor
    ValidarDados('N', FormatFloat('#########0.00',dValor), 6)+
    // 12 (214 até 222 / tam. 09) - Seqüência
    ValidarDados('N', IntToStr(FNumSequencia), 9);

  Inc(FNumPessoas);
  IncProgresso(0, 1);
end;

function TCtrlArqTicket_Policard.GetRegistro_RodapeArquivo: string;
begin
  if (FNumPessoas > 0) then
    Result :=
      // 01 (001 até 001 / tam. 01) - Tipo de Registro
      'T' +
      // 04 (002 até 009 / tam. 09) - Quantidade de registros dentro do arquivo
      ValidarDados('N', IntToStr(FNumSequencia), 9)
  else
  begin
    Result := '';
    FArquivo.Clear;
    MessageInfo := CMTranslateMsg(MSG_PESSOAS_SEM_RUB, [CR_LF]);
    FTipoRetorno := RETORNO_AVISO;
  end;
end;

procedure TCtrlArqTicket_Policard.IniciarProcessoArquivo;
begin
  inherited;
  FNumPessoas := 0;
end;

function TCtrlArqTicket_Policard.GetParam: TParModelo_Policard;
begin
  Result := TParModelo_Policard(FParametros);
end;

function TCtrlArqTicket_Policard.GetValor(const IdPessoa: double): double;
begin
  FCdsValor.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  SUM(DECODE(PD.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO)) AS VALOR' +CR_LF+
    'FROM' +CR_LF+
    '  HISTRUBSAL H, PROVDESC PD' +CR_LF+
    'WHERE' +CR_LF+
    '  (H.IDPESSOA     = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    FU.MontaSelSQL('H.CODPROVDESC',QuotedListaString(GetParam.ListaIdRubrica,','),2,1) +CR_LF+
    '  (H.MES          = ' +QuotedStr(FormatDateTime('YYYY/MM', FParametros.DataIni))+ ') AND' +CR_LF+
    '  (H.IDRUBRICA    = PD.IDPROVENTO)');
  Result := FCdsValor.FieldByName('VALOR').asFloat;
end;

end.
