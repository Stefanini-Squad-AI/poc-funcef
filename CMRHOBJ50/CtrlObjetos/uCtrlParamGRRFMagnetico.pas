unit uCtrlParamGRRFMagnetico;

interface

uses SysUtils, Classes, Controls, DB, Forms, uCmControlObject, uCmDbObject, IvDictio,
  uCmClientDataSet, uCMTypes, uCtrlCustomRH, uCtrlReqPessoal;

const
  NUM_VALORES = 6; // Número de valores a serem recuperados do Banco de Dados

type
  TOnProgGFIPMagnetico = procedure (const TempoAtual, Mensagem: string;
    const Incremento: integer) of object;

  TCtrlParamGRRFMagnetico = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure AfterInitialize; override;
  private
    FOnProgGFIPMagnetico: TOnProgGFIPMagnetico;

    FCdsPrincipal: TCMClientDataSet;
    FCdsEstab: TCMClientDataSet;
    FCdsResp: TCMClientDataSet;
    FCdsContato: TCMClientDataSet;
    FCdsRemMesAnterior: TCMClientDataSet;
    FCdsRemMesAtual: TCMClientDataSet;
    FCdsAvisoPrevio: TCMClientDataSet;
    FCdsPensaoAlim: TCMClientDataSet;
    FCdsSaldoFinsResc: TCMClientDataSet;
    FCdsDissidio: TCMClientDataSet;

    FCtrlReqPessoal: TCtrlReqPessoal;

    FArq: TStringList;
    FSQL: TStringList;

    FHoraIni: TTime; // Hora inicial do processamento

    FAnoRef: word;

    FCompetencia: string; // Data de Competência (AAAA/MM)
    FListaIdEstab: string; // Estabelecimentos selecionados
    FListaCodCentroCusto: string; // Centros de Custo selecionados
    FListaIdRubrica_RemMesAnterior: string; // Rubricas de Rem. Mês Ant. à Resc. selecionadas
    FListaIdRubrica_RemMesAtual: string; // Rubricas de Rem. Mês da Resc. selecionadas
    FListaIdRubrica_AvisoPrevio: string; // Rubricas de Aviso Prévio Indenizado selecionadas
    FListaIdRubrica_PensaoAlim: string; // Rubricas de Pensão Alimentícia selecionadas
    FListaIdRubrica_SaldoFinsResc: string; // Rubricas de Saldo para Fins Rescisórios
    FListaIdRubrica_Dissidio: string; // Rubricas de Dissídio 
    FTempoDecorridoTotal: string;

    FIdEmpresa: integer; // ID da Empresa
    FOptanteSimples: integer; // Estabelecimentos optantes pelo SIMPLES ?
    FNumDeslocamentos: integer; // Deslocamento da barra de progressos
    FDeslocamentoAtual: integer; // Deslocamento atual da barra de progressos
    FBuscaFuncSitAtual: boolean; // Buscar com base nos dados atuais ou no histórico ?

    FIdPessoaContato: double; // ID da Pessoa de Contato
    FIdResponsavel: double; // ID do Responsável pelas informações no arquivo

    FDataPag: TDate; // Data de Pagamento

    procedure IncProgresso(const TempoAtual, Mensagem: string; const Incremento: integer);
    function  GetTempoDecorrido(Extendido: boolean = false): string;

    function AbrirQueryEstabelecimento: boolean;
    function AbrirQueryResponsavel: boolean;
    function AbrirQueryContato: boolean;

    function AbrirQueryPrincipal: boolean;
    function AbrirQueriesDosValores: boolean;

    function MontarListaPessoas(NumEspacos: integer; Campos: string = '';
      const SemDemitidos: boolean = false): string;

    procedure PosicionarValoresPessoa(const IdPessoa: double);
    procedure ProximaPessoa;

    function  GetValorAtual(const Cds: TCMClientDataSet): string;

    // Valida os dados do GFIP MAGNÉTICO
    function ValidarCampo(Tipo: char; Dado: string; Tamanho: word; Ch: char): string;
    // Rotinas de Validação de Dados
    function Val_CEP(const CEP: string): string;
    function Val_CTPS(Ini,Tam: byte; Campo: string): string;
    function Val_DataIniAvisoPrevio(Campo: TDate; TipoAviso: string): string;
    //function Val_NumContaSal(NumConta: string): string;

    function GetDataMotiventacao(const Data: TDate): string;
    function GetReposicaoVaga: string;
    function GetIndicativoPensaoAlim: string;
    function GetTipoAvisoPrevio: string;

    // Geração dos registros do arquivo
    function GerarRegistro00: string;
    function GerarRegistro10: string;
    function GerarRegistro40: string;
    function GerarRegistro90: string;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ProcessarGeracao(const IdEmpresa: integer; const MesRef, AnoRef: integer;
      const DataPag: TDate; const ListaIdEstab, ListaCodCentroCusto: string;
      const IdResponsavel, IdPessoaContato: double; const BuscaFuncSitAtual: boolean;
      const OptanteSimples: integer; const ListaIdRubrica_RemMesAnterior,
      ListaIdRubrica_RemMesAtual, ListaIdRubrica_AvisoPrevio, ListaIdRubrica_PensaoAlim,
      ListaIdRubrica_SaldoFinsResc, ListaIdRubrica_Dissidio: string): boolean;

    property TempoDecorridoTotal: string read FTempoDecorridoTotal;
    property DadosArquivo: TStringList read FArq;
    property OnProgresso: TOnProgGFIPMagnetico read FOnProgGFIPMagnetico write FOnProgGFIPMagnetico;
  end;

implementation

uses uCtrlFuncoesRH;

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_SEM_DADOS_ESTAB =
    'Dados do(s) Estabelecimento(s) selecionado(s) não estão completos. :1'+
    'Verifique e tente novamente.';
  MSG_SEM_DADOS_RESP =
    'Dados do Responsável selecionado não estão completos. :1'+
    'Verifique e tente novamente.';
  MSG_SEM_DADOS_CONTATO =
    'Dados do Contato selecionado não estão completos. :1'+
    'Verifique e tente novamente.';
  MSG_SEM_DADOS =
    'Não há dados a serem processados para esta competência ou :1'+
    'Dados Cadastrais incompletos.';

{ TCtrlParamGRRFMagnetico }

constructor TCtrlParamGRRFMagnetico.Create;
begin
  inherited;
  FSQL := TStringList.Create;
  FArq := TStringList.Create;
  FCtrlReqPessoal := TCtrlReqPessoal.Create(false, 0);

  GetTempDir;
end;

destructor TCtrlParamGRRFMagnetico.Destroy;
begin
  FSQL.Free;
  FArq.Free;
  FCtrlReqPessoal.Free;
  inherited;
end;

procedure TCtrlParamGRRFMagnetico.AfterInitialize;
begin
  inherited;
  FCtrlReqPessoal.InitializeAs(Self);
end;

procedure TCtrlParamGRRFMagnetico.DoChangeDataBase;
begin
  inherited;
  FCtrlReqPessoal.DataBase := DataBase;
end;

procedure TCtrlParamGRRFMagnetico.IncProgresso(const TempoAtual, Mensagem: string;
  const Incremento: integer);
begin
  if Assigned(OnProgresso) then
    OnProgresso(TempoAtual, Mensagem, Incremento);
end;

function TCtrlParamGRRFMagnetico.GetTempoDecorrido(Extendido: boolean): string;
begin
  if (Extendido) then
    Result := HoraPorExtenso(Time - FHoraIni)
  else
    Result := FormatDateTime('hh:mm:ss', Time - FHoraIni);
end;

function TCtrlParamGRRFMagnetico.AbrirQueryEstabelecimento: boolean;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PJ.IDPESSOA,');
    Add('  FP.IDFPAS AS FPAS,');
    Add('  FP.IDITEMCNAE AS CNAE,');
    Add('  PJ.RAZAOSOCIAL,');
    Add('  TO_CHAR(DECODE(CGC_CNPJ.NUM,');
    Add('    NULL,''2'',');
    Add('    ''1''');
    Add('  )) AS TIPO_INSCRICAO,');
    Add('  TO_CHAR(DECODE(CGC_CNPJ.NUM,');
    Add('    NULL,CEI.NUM,');
    Add('    CGC_CNPJ.NUM');
    Add('  )) AS INSCRICAO,');
    Add('  TO_CHAR(DECODE(E.LOGRADOURO,');
    Add('    NULL,'''',');
    Add('    RTRIM(E.LOGRADOURO) ||'' ''|| TO_CHAR(E.NUMERO) ||');
    Add('      TO_CHAR(DECODE(E.COMPLEMENTO,');
    Add('        NULL,'''',');
    Add('        '' '' || RTRIM(E.COMPLEMENTO)');
    Add('      ))');
    Add('  )) AS ENDERECO,');
    Add('  E.BAIRRO,');
    Add('  E.CEP,');
    Add('  CI.NOME AS CIDADE,');
    Add('  ES.CODESTADO AS UF,');
    Add('  TELEFONE.DDD,');
    Add('  TELEFONE.NUMERO AS TELEFONE');
    // -------------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PJ, ENDPESS E, TELENDPESS TE, CIDADES CI, ESTADO ES, FILIALPESSOA FP,');
    // -------------------------------------------------------------------------- //
    // CEI do Estabelecimento
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, DO.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DO, FILIALPESSOA FP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CEI:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO) AND');
    Add('         (FP.IDFILIALPESSOA  = DO.IDPESSOA)) CEI,');
    // -------------------------------------------------------------------------- //
    // CNPJ do Estabelecimento
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, DO.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DO, FILIALPESSOA FP, TIPODOCOFICIAL TDO');
    Add('   WHERE ((TDO.SIGLADOCUMENTO = ''CGC:'') OR');
    Add('          (TDO.SIGLADOCUMENTO = ''CNPJ:'')) AND');
    Add('         (TDO.IDDOCUMENTO     = DO.IDDOCUMENTO) AND');
    Add('         (FP.IDFILIALPESSOA   = DO.IDPESSOA)) CGC_CNPJ,');
    // -------------------------------------------------------------------------- //
    // Telefone do Estabelecimento
    Add('  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
    Add('   FROM');
    Add('     TELENDPESS TE,');
    Add('     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('      FROM     TELENDPESS');
    Add('      GROUP BY IDENDERECO) ENDER');
    Add('   WHERE');
    Add('     (ENDER.IDTELEFONE = TE.IDTELEFONE)) TELEFONE');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add(MontaLinhaSelSQL('  (FP.IDFILIALPESSOA', FListaIdEstab, 1));
    Add('  (FP.IDFILIALPESSOA  = PJ.IDPESSOA) AND');
    Add('  (PJ.NUMDOCUMENTO   IS NOT NULL) AND');
    Add('  (PJ.IDENDCOMERCIAL  = E.IDENDERECO) AND');
    Add('  (PJ.IDPESSOA        = E.IDPESSOA) AND');
    Add('  (E.IDCIDADES        = CI.IDCIDADES) AND');
    Add('  (CI.IDESTADO        = ES.IDESTADO) AND');
    Add('  (PJ.IDPESSOA        = CEI.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA        = CGC_CNPJ.IDPESSOA(+)) AND');
    Add('  (PJ.IDENDCOMERCIAL  = TELEFONE.IDENDERECO(+)) AND');
    Add('  (PJ.IDENDCOMERCIAL  = TE.IDENDERECO(+))');
    Add('ORDER BY');
    Add('  INSCRICAO');
    SaveToFile(DirTempLog + '\qryEstab.txt');
  end;
  IncProgresso('', CMTranslate('Selecionando dados do(s) Estabelecimento(s)...'), 0);
  FCdsEstab.Data := GetDataPacket(FSQL);
  IncProgresso(GetTempoDecorrido, '', 6);

  Result := not(FCdsEstab.IsEmpty);
  if not(Result) then
    MessageInfo := CMTranslateMsg(MSG_SEM_DADOS_ESTAB, [CR_LF]);
end;

function TCtrlParamGRRFMagnetico.AbrirQueryResponsavel: boolean;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  ''1'' AS TIPO_INSCRICAO,');
    Add('  NUMDOCUMENTO AS INSCRICAO,');
    Add('  NOME,');
    Add('  UPPER(RTRIM(EMAIL)) AS EMAIL');
    Add('FROM');
    Add('  PESSOA');
    Add('WHERE');
    Add('  (IDPESSOA = ' +FloatToStr(FIdResponsavel)+ ')');
    SaveToFile(DirTempLog + '\qryResp.txt');
  end;
  IncProgresso('', CMTranslate('Selecionando dados do Responsável...'), 3);
  FCdsResp.Data := GetDataPacket(FSQL);
  IncProgresso(GetTempoDecorrido, '', 3);

  Result := not(FCdsResp.IsEmpty);
  if not(Result) then
    MessageInfo := CMTranslateMsg(MSG_SEM_DADOS_RESP, [CR_LF]);
end;

function TCtrlParamGRRFMagnetico.AbrirQueryContato: boolean;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  NOME,');
    Add('  UPPER(RTRIM(EMAIL)) AS EMAIL');
    Add('FROM');
    Add('  PESSOA');
    Add('WHERE');
    Add('  (IDPESSOA = ' +FloatToStr(FIdPessoaContato)+ ')');
    SaveToFile(DirTempLog + '\qryContato.txt');
  end;
  IncProgresso('', CMTranslate('Selecionando dados do Contato...'), 3);
  FCdsContato.Data := GetDataPacket(FSQL);
  IncProgresso(GetTempoDecorrido, '', 3);

  Result := not(FCdsContato.IsEmpty);
  if not(Result) then
    MessageInfo := CMTranslateMsg(MSG_SEM_DADOS_CONTATO, [CR_LF]);
end;

function TCtrlParamGRRFMagnetico.AbrirQueryPrincipal: boolean;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  F.IDESTAB,');
    Add('  F.IDPESSOA,');
    Add('  TO_CHAR(DECODE(CNPJ_TOMADOR.NUM,');
    Add('    NULL,DECODE(CEI_TOMADOR.NUM,NULL,'''',''2''),');
    Add('    ''1''');
    Add('  )) AS TIPO_INSCRICAO_TOMADOR,');
    Add('  TO_CHAR(DECODE(CNPJ_TOMADOR.NUM,');
    Add('    NULL,CEI_TOMADOR.NUM,');
    Add('    CNPJ_TOMADOR.NUM');
    Add('  )) AS INSCRICAO_TOMADOR,');
    Add('  S.MESBASE AS MES_DISSIDIO,');
    Add('  PF.NOME,');
    Add('  PF.NUMDOCUMENTO AS CPF,');
    Add('  CTPS.NUM AS CTPS,');
    Add('  PIS.NUM AS PIS,');
    Add('  ''00'' || SUBSTR(TO_CHAR(C.CBO2002),1,4) AS CBO,');
    Add('  NVL(F.IDCATEMPRGRE,1) AS CATEGORIA,');
    Add('  PESFIS.DATANASC,');
    Add('  DECODE(PESFIS.SEXO,''F'',''2'',''1'') AS SEXO,'); // 1 -> Masculino; 2 -> Feminino
    Add('  PESFIS.IDGRINSTR,');
    Add('  (HT.JORNADAMENSAL / 5) AS HRS_TRAB,');
    Add('  F.DATAADMISSAO,');
    Add('  F.DATAOPCAOFGTS,');
    Add('  F.DATAAVISO,');
    Add('  MO.MOTIVOFGTS AS COD_MOV,');
    Add('  F.DATADESLIGAMENTO,');
    Add('  TO_CHAR(F.DATADESLIGAMENTO,''DD/MM/YYYY'') AS DATA_MOV,');
    Add('  FS.CODOFICIAL AS COD_SAQUE');
    // -------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PF, PESSOAFISICA PESFIS, MOTIVO MO, CARGO C, HORATRAB HT,');
    Add('  FORMARESCFGTS FS, SINDICATO S,');
    // -------------------------------------------------------------------- //
    // Pessoas
    Add('  (');
    Add(MontarListaPessoas(3,
      '  IDPESSOA, IDESTAB, TIPOCONTRATO, IDCATEMPRGRE, DATAADMISSAO,' +CR_LF+
      '  DATAOPCAOFGTS, DATAAVISO, DATADESLIGAMENTO, IDCARGO,' +CR_LF+
      '  IDMOTIVODESLIGRAIS, IDFORMARESC, IDHORARIO', true));
    Add('  ) F,');
    // -------------------------------------------------------------------- //
    // CNPJ do Tomador de Serviços
    Add('  (SELECT DP.IDPESSOA, RTRIM(DP.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE ((TDO.SIGLADOCUMENTO = ''CNPJ:'') OR');
    Add('          (TDO.SIGLADOCUMENTO = ''CGC:'')) AND');
    Add('         (TDO.IDDOCUMENTO     = DP.IDDOCUMENTO)) CNPJ_TOMADOR,');
    // -------------------------------------------------------------------- //
    // CEI do Tomador de Serviços
    Add('  (SELECT DP.IDPESSOA, RTRIM(DP.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CEI:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) CEI_TOMADOR,');
    // -------------------------------------------------------------------- //
    // CTPS
    Add('  (SELECT F.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CTPS:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (DP.IDPESSOA        = F.IDPESSOA)) CTPS,');
    // -------------------------------------------------------------------- //
    // PIS
    Add('  (SELECT F.IDPESSOA, LTRIM(RTRIM(DP.NUMDOCUMENTO)) AS NUM');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO');
    Add('   WHERE ((TDO.SIGLADOCUMENTO = ''PIS:'') OR');
    Add('          (TDO.SIGLADOCUMENTO = ''PIS/PASEP:'')) AND');
    Add('         (TDO.IDDOCUMENTO     = DP.IDDOCUMENTO) AND');
    Add('         (DP.IDPESSOA         = F.IDPESSOA)) PIS');
    // -------------------------------------------------------------------- //
    Add('WHERE');
    // A categoria 2 será implementada futuramente e somente deverá ser utilizada
    // quando autorizada pela CAIXA
    Add('  (F.IDCATEMPRGRE       IN (1,3,4,5,6,7)) AND');

    // A movimentações U1, U2 e U3, H, J e M serão implementadas futuramente e somente
    // deverão ser utilizadas quando autorizadas pela CAIXA
    Add('  (RTRIM(MO.MOTIVOFGTS) IN (''I1'',''I2'',''I3'',''I4'',''L'')) AND');

    Add('  (F.IDHORARIO           = HT.IDHORARIO) AND');
    Add('  (F.IDCARGO             = C.IDCARGO) AND');
    Add('  (F.IDPESSOA            = PESFIS.IDPESSOA) AND');
    Add('  (F.IDPESSOA            = PF.IDPESSOA) AND');
    Add('  (F.IDFORMARESC         = FS.IDFORMARESC) AND');
    Add('  (F.IDMOTIVODESLIGRAIS  = MO.IDMOTIVO) AND');
    Add('  (F.IDPESSOA            = CTPS.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA            = PIS.IDPESSOA(+)) AND');
    Add('  (PESFIS.IDSINDICATO    = S.IDPESSOA(+)) AND');
    Add('  (PF.IDGRUPO            = CNPJ_TOMADOR.IDPESSOA(+)) AND');
    Add('  (PF.IDGRUPO            = CEI_TOMADOR.IDPESSOA(+))');
    Add('ORDER BY');
    Add('  PIS, DATAADMISSAO, CATEGORIA');
    SaveToFile(DirTempLog + '\qryPrincipal.txt');
  end;
  IncProgresso('', CMTranslate('Selecionando dados das Pessoas...'), 0);
  FCdsPrincipal.Data := GetDataPacket(FSQL);
  IncProgresso(GetTempoDecorrido, '', 20);

  Result := not(FCdsPrincipal.IsEmpty);
  if not(Result) then
    MessageInfo := CMTranslateMsg(MSG_SEM_DADOS, [CR_LF]);
end;

function TCtrlParamGRRFMagnetico.AbrirQueriesDosValores: boolean;
const
  MsgValores: array [1..NUM_VALORES] of string = (
    'Selecionando Remuneração Mês Anterior à Rescisão...',
    'Selecionando Remuneração Mês da Rescisão...',
    'Selecionando Aviso Prévio Indenizado...',
    'Selecionando Pensão Alimentícia...',
    'Selecionando Saldo para Fins Rescisórios...',
    'Selecionando Dissídio...');
var
  c: byte;
  Cds: array [1..NUM_VALORES] of TCMClientDataSet;
  ListaRubrica, NomeArq: array [1..NUM_VALORES] of string;
begin
  try
    ListaRubrica[1] := FListaIdRubrica_RemMesAnterior;
    ListaRubrica[2] := FListaIdRubrica_RemMesAtual;
    ListaRubrica[3] := FListaIdRubrica_AvisoPrevio;
    ListaRubrica[4] := FListaIdRubrica_PensaoAlim;
    ListaRubrica[5] := FListaIdRubrica_SaldoFinsResc;
    ListaRubrica[6] := FListaIdRubrica_Dissidio;
    NomeArq[1] := 'qryRemMesAnterior';
    NomeArq[2] := 'qryRemMesAtual';
    NomeArq[3] := 'qryAvisoPrevio';
    NomeArq[4] := 'qryPensaoAlim';
    NomeArq[5] := 'qrySaldoFinsResc';
    NomeArq[6] := 'qryDissidio';
    Cds[1] := FCdsRemMesAnterior;
    Cds[2] := FCdsRemMesAtual;
    Cds[3] := FCdsAvisoPrevio;
    Cds[4] := FCdsPensaoAlim;
    Cds[5] := FCdsSaldoFinsResc;
    Cds[6] := FCdsDissidio;

    // 1. vez = Remuneração Mês Anterior à Rescisão
    // 2. vez = Remuneração Mês da Rescisão
    // 3. vez = Aviso Prévio Indenizado
    // 4. vez = Pensão Alimentícia
    // 5. vez = Saldo para Fins Rescisórios
    // 6. vez = Dissídio Coletivo
    for c:=1 to NUM_VALORES do
    begin
      with (FSQL) do
      begin
        Clear;
        Add('SELECT');
        Add('  H.IDPESSOA,');
        Add('  SUM(TO_NUMBER(DECODE(P.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO))) AS VALOR');
        Add('FROM');
        Add('  HISTRUBSAL H, PROVDESC P,');
        // -------------------------------------------------------------------- //
        // Trabalhadores
        Add('  (');
        Add(MontarListaPessoas(3, '  IDPESSOA, IDESTAB'));
        Add('  ) F');
        // -------------------------------------------------------------------- //
        Add('WHERE');
        if (ListaRubrica[c] = '') then
          Add('  (H.IDPESSOA     = -1) AND')
        else
          Add(MontaLinhaSelSQL('  (H.CODPROVDESC',QuotedListaString(ListaRubrica[c],','),1));

        if (c = 1) then // Mês anterior para Remuneração Mês Anterior à Rescisão
          Add('  (H.MES          = ' +QuotedStr(IncDataAM(FCompetencia,-1))+ ') AND')
        else
          Add('  (H.MES          = ' +QuotedStr(FCompetencia)+ ') AND');

        Add('  (F.IDPESSOA     = H.IDPESSOA) AND');
        Add('  (H.IDRUBRICA    = P.IDPROVENTO)');
        Add('GROUP BY');
        Add('  H.IDPESSOA');
        SaveToFile(DirTempLog + '\' +NomeArq[c]+ '.txt');
      end;
      IncProgresso('', CMTranslate(MsgValores[c]), 0);
      Cds[c].Data := GetDataPacket(FSQL);
      IncProgresso(GetTempoDecorrido, '', 5);
    end;

    Result := true;
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
end;

// *************************************************************************************
// Parâmetros: sTipo          - A, AN, N, V, D (Vide Manual da SEFIP, pág.13)
//             sDado          - Dado a ser validado
//             iTamanho       - Tamanho de retorno da string validada
// *************************************************************************************
function TCtrlParamGRRFMagnetico.ValidarCampo(Tipo: char; Dado: string; Tamanho: word;
  Ch: char): string;
var
  sTemp: string;
  c, wMax: word;
begin
  Result := CMTranslate('ERRO VALIDA GFIP');
  if not(Tipo in ['*','A','N','D']) or (Tamanho <= 0) then
    exit;

  // Inicializar Variáveis
  sTemp := '';
  Tipo := UpCase(Tipo);
  Dado := Trim(Dado);

  // Atribuir o maior tamanho verificável possível
  if (Tamanho > Length(Dado)) then
    wMax := Length(Dado)
  else
    wMax := Tamanho;

  // ******************************
  // Faz tratamento das informações
  // ******************************
  case (Tipo) of
    '*','A' : // Campos Alfanuméricos e Alfabéticos
    begin
      try
        Dado := UpperCase(ConverteCar(Dado));

        for c:=1 to length(Dado) do
          if ((Tipo = 'A') and (Dado[c] in [' ','A'..'Z'])) or
             ((Tipo = '*') and (Dado[c] in [' ','A'..'Z','0'..'9'])) then
            sTemp := sTemp+Dado[c];

        sTemp := Alinha(NormalizaString(TiraCarRepetidos(Copy(sTemp,1,wMax),2)), Tamanho, 'E', Ch);
      except
        sTemp := Replicate(Ch, Tamanho);
      end;
    end;
    'N' : // Campos Numéricos
    begin
      try
        for c:=1 to length(Dado) do
          if (Dado[c] in ['0'..'9']) then
            sTemp := sTemp+Dado[c];

        sTemp := Alinha(Copy(sTemp,1,wMax), Tamanho, 'D', Ch);
      except
        sTemp := Replicate(Ch, Tamanho);
      end;
    end;
    'D' : // Campos Data
    begin
      try
        StrToDate(sTemp);
        sTemp := Alinha(TiraBarra(sTemp), Tamanho, 'D', Ch);
      except
        sTemp := Replicate(Ch, Tamanho);
      end;
    end;
  end;
  Result := sTemp;
end;

function TCtrlParamGRRFMagnetico.Val_CEP(const CEP: string): string;
begin
  if (CEP <> '20000000') and (CEP <> '30000000') and (CEP <> '70000000') and
     (CEP <> '80000000') then
    Result := ValidarCampo('N', CEP, 8, '0')
  else
    Result := Replicate(' ', 8);
end;

function TCtrlParamGRRFMagnetico.Val_CTPS(Ini,Tam: byte; Campo: string): string;
var
  c: byte;
  sAux: string;
begin
  if (FCdsPrincipal.FieldByName('CATEGORIA').asInteger = 5) then
    Result := Replicate('0', Tam)
  else
  begin
    for c:=1 to length(Campo) do
      if (Campo[c] in ['0'..'9']) then
        sAux := sAux + Campo[c];
    Result := Replicate('0', Abs(Tam-Length(Copy(sAux,Ini,Tam)))) + Copy(sAux,Ini,Tam);
  end;
end;

function TCtrlParamGRRFMagnetico.Val_DataIniAvisoPrevio(Campo: TDate; TipoAviso: string): string;
begin
  if (TipoAviso = '2') then // Não informar para Aviso Prévio Indenizado
    Result := Replicate(' ', 8)
  else
    Result := ValidarCampo('N', DateToStr(Campo), 8, ' ');
end;

{function TCtrlParamGRRFMagnetico.Val_NumContaSal(NumConta: string): string;
begin
  NumConta := Trim(NumConta);
  // Caso o dígito verificador seja alfanumérico, informar ZERO no lugar
  if (NumConta[Length(NumConta)] in ['a'..'z','A'..'Z']) then
    NumConta[Length(NumConta)] := '0';

  Result := ValidarCampo('N', NumConta, 13, ' ');
end;}

function TCtrlParamGRRFMagnetico.GetDataMotiventacao(const Data: TDate): string;
begin
  if (Data > 0) then
    Result := ValidarCampo('N', FormatDateTime('DDMMYYYY', Data), 8, ' ')
  else
    Result := Replicate(' ', 8);
end;

function TCtrlParamGRRFMagnetico.GetReposicaoVaga: string;
begin
  if (FCtrlReqPessoal.GetPessoaSubstituida(FCdsPrincipal.FieldByName('IDPESSOA').asFloat)) then
    Result := 'S'
  else
    Result := 'N';
end;

function TCtrlParamGRRFMagnetico.GetIndicativoPensaoAlim: string;
begin
  if (FCdsPensaoAlim.IsEmpty) then
    Result := 'N'
  else
    Result := 'V';
end;

function TCtrlParamGRRFMagnetico.GetTipoAvisoPrevio: string;
begin
  // Códigos para Aviso Prévio:
  // 1 –> Trabalhado
  // 2 –> Indenizado
  // 3 –> Ausência/Dispensa

  if not(FCdsAvisoPrevio.IsEmpty) and
     (FCdsPrincipal.FieldByName('DATADESLIGAMENTO').asDateTime =
      FCdsPrincipal.FieldByName('DATAAVISO').asDateTime) then
    Result := '2'
  else
  if (FCdsPrincipal.FieldByName('DATAAVISO').IsNull) then
    Result := '3'
  else
    Result := '1';
end;

function TCtrlParamGRRFMagnetico.GerarRegistro00: string;
begin
  Result :=
    // 01 (001 até 002 / tam. 002) Tipo do registro
    '00'+
    // 02 (003 até 053 / tam. 051) Brancos
    Replicate(' ', 51)+
    // 03 (054 até 054 / tam. 001) Tipo de Remessa
    // 2 -> GRRF
    '2'+
    // 04 (055 até 055 / tam. 001) Tipo de inscrição-responsável (1->CNPJ; 2->CEI; 3->CPF)
    ValidarCampo('N', FCdsResp.FieldByName('TIPO_INSCRICAO').asString, 1, '0')+
    // 05 (056 até 069 / tam. 014) Inscrição do responsável
    ValidarCampo('N', FCdsResp.FieldByName('INSCRICAO').asString, 14, '0')+
    // 06 (070 até 099 / tam. 030) Nome do responsável (Razão social)
    ValidarCampo('*', FCdsEstab.FieldByName('RAZAOSOCIAL').asString, 30, ' ')+
    // 07 (100 até 119 / tam. 020) Nome da pessoa de contato
    ValidarCampo('A', FCdsContato.FieldByName('NOME').asString, 20, ' ')+
    // 08 (120 até 169 / tam. 050) RUA = Logradouro + Rua + nº + andar + apartamento
    ValidarCampo('*', FCdsEstab.FieldByName('ENDERECO').asString, 50, ' ')+
    // 09 (170 até 189 / tam. 020) Bairro
    ValidarCampo('*', FCdsEstab.FieldByName('BAIRRO').asString, 20, ' ')+
    // 10 (190 até 197 / tam. 008) Cep
    Val_CEP(FCdsEstab.FieldByName('CEP').asString)+
    // 11 (198 até 217 / tam. 020) Cidade
    ValidarCampo('*', FCdsEstab.FieldByName('CIDADE').asString, 20, ' ')+
    // 12 (218 até 219 / tam. 002) UF
    ValidarCampo('A', FCdsEstab.FieldByName('UF').asString, 2, ' ')+
    // 13 (220 até 231 / tam. 012) Telefone de contato (DDD + Número)
    ValidarCampo('N', FCdsEstab.FieldByName('DDD').asString, 2, '0')+
    ValidarCampo('N', FCdsEstab.FieldByName('TELEFONE').asString, 10, '0')+
    // 14 (232 até 291 / tam. 060) Endereço INTERNET de contato
    Alinha(FCdsContato.FieldByName('EMAIL').asString, 60, 'E', ' ')+
    // 15 (292 até 299 / tam. 008) Data de Pagamento
    ValidarCampo('N', DateToStr(FDataPag), 8, ' ')+
    // 16 (300 até 359 / tam. 060) Brancos
    Replicate(' ', 60)+
    // 17 (360 até 360 / tam. 001) Final de linha
    '*';
end;

function TCtrlParamGRRFMagnetico.GerarRegistro10: string;
begin
  Result :=
    // 01 (001 até 002 / tam. 002) Tipo do registro
    '10'+
    // 02 (003 até 003 / tam. 001) Tipo de inscrição empresa (1->CNPJ; 2->CEI)
    ValidarCampo('N', FCdsEstab.FieldByName('TIPO_INSCRICAO').asString, 1, '0')+
    // 03 (004 até 017 / tam. 014) Inscrição do empresa
    ValidarCampo('N', FCdsEstab.FieldByName('INSCRICAO').asString, 14, '0')+
    // 04 (018 até 053 / tam. 036) Zeros
    Replicate('0', 36)+
    // 05 (054 até 093 / tam. 040) Razão social
    ValidarCampo('*', FCdsEstab.FieldByName('RAZAOSOCIAL').asString, 40, ' ')+
    // 06 (094 até 143 / tam. 050) RUA = Logradouro + Rua + nº + andar + apartamento
    ValidarCampo('*', FCdsEstab.FieldByName('ENDERECO').asString, 50, ' ')+
    // 07 (144 até 163 / tam. 020) Bairro
    ValidarCampo('*', FCdsEstab.FieldByName('BAIRRO').asString, 20, ' ')+
    // 08 (164 até 171 / tam. 008) Cep
    Val_CEP(FCdsEstab.FieldByName('CEP').asString)+
    // 09 (172 até 191 / tam. 020) Cidade
    ValidarCampo('*', FCdsEstab.FieldByName('CIDADE').asString, 20, ' ')+
    // 10 (192 até 193 / tam. 002) UF
    ValidarCampo('A', FCdsEstab.FieldByName('UF').asString, 2, ' ')+
    // 11 (194 até 205 / tam. 012) Contato Telefone (DDD + Número)
      ValidarCampo('N', FCdsEstab.FieldByName('DDD').asString, 2, '0')+
    ValidarCampo('N', FCdsEstab.FieldByName('TELEFONE').asString, 10, '0')+
    // 12 (206 até 212 / tam. 007) CNAE
    ValidarCampo('N', FCdsEstab.FieldByName('CNAE').asString, 7, '0')+
    // 13 (213 até 213 / tam. 001) SIMPLES
    IntToStr(FOptanteSimples)+
    // 14 (204 até 216 / tam. 003) FPAS
    ValidarCampo('N', FCdsEstab.FieldByName('FPAS').asString, 3, '0')+
    // 15 (217 até 359 / tam. 143) Brancos
    Replicate(' ', 143)+
    // 16 (360 até 360 / tam. 001) Final de linha
    '*';
end;

function TCtrlParamGRRFMagnetico.GerarRegistro40: string;
var
  dtDataHomologaDissidio: TDate;
  sTipoAvisoPrevio, sTipoInscricaoTomador, sInscricaoTomador: string;
begin
  sInscricaoTomador := Trim(FCdsPrincipal.FieldByName('INSCRICAO_TOMADOR').asString);
  if (sInscricaoTomador = '') then
    sTipoInscricaoTomador := ''
  else
    sTipoInscricaoTomador := FCdsPrincipal.FieldByName('TIPO_INSCRICAO_TOMADOR').asString;

  sTipoAvisoPrevio := GetTipoAvisoPrevio;

  if not(FCdsDissidio.IsEmpty) and (FCdsPrincipal.FieldByName('MES_DISSIDIO').asInteger > 0) then
    dtDataHomologaDissidio :=
      EncodeDate(FAnoRef, FCdsPrincipal.FieldByName('MES_DISSIDIO').asInteger, 1)
  else
    dtDataHomologaDissidio := 0;

  if (StrToFloat(GetValorAtual(FCdsDissidio)) = 0) and
     (StrToFloat(GetValorAtual(FCdsRemMesAtual)) = 0) and
     (StrToFloat(GetValorAtual(FCdsAvisoPrevio)) = 0) and
     (StrToFloat(GetValorAtual(FCdsSaldoFinsResc)) = 0) then
    Result := ''  // ISTO É PARA FORÇAR QUE HAJA UM DESSES VALORES ACIMA
  else
    Result :=
      // 01 (001 até 002 / tam. 002) Tipo do registro
      '40'+
      // 02 (003 até 003 / tam. 001) Tipo de inscrição da empresa (1->CNPJ; 2->CEI)
      ValidarCampo('N', FCdsEstab.FieldByName('TIPO_INSCRICAO').asString, 1, '0')+
      // 03 (004 até 017 / tam. 014) Inscrição da empresa
      ValidarCampo('N', FCdsEstab.FieldByName('INSCRICAO').asString, 14, '0')+
      // 04 (018 até 018 / tam. 001) Tipo de inscrição - tomador
      ValidarCampo('N', sTipoInscricaoTomador, 1, '0')+
      // 05 (019 até 032 / tam. 014) Inscrição tomador
      ValidarCampo('N', sInscricaoTomador, 14, '0')+
      // 06 (033 até 043 / tam. 011) PIS/PASEP/CI
      ValidarCampo('N', FCdsPrincipal.FieldByName('PIS').asString, 11, '0')+
      // 07 (044 até 051 / tam. 008) Data de admissão
      ValidarCampo('N', FCdsPrincipal.FieldByName('DATAADMISSAO').asString, 8, ' ')+
      // 08 (052 até 053 / tam. 002) Categoria do trabalhador
      ValidarCampo('N', FCdsPrincipal.FieldByName('CATEGORIA').asString, 2, '0')+
      // 09 (054 até 123 / tam. 070) Nome do trabalhador
      ValidarCampo('A', FCdsPrincipal.FieldByName('NOME').asString, 70, ' ')+
      // 10 (124 até 130 / tam. 007) Número da CTPS
      Val_CTPS(1, 7, Trim(FCdsPrincipal.FieldByName('CTPS').asString))+
      // 11 (131 até 135 / tam. 005) Série da CTPS
      Val_CTPS(8, 5, Trim(FCdsPrincipal.FieldByName('CTPS').asString))+
      // 12 (136 até 136 / tam. 001) Sexo
      FCdsPrincipal.FieldByName('SEXO').asString+
      // 13 (137 até 138 / tam. 002) Grau de Instrução
      ValidarCampo('N', FCdsPrincipal.FieldByName('IDGRINSTR').asString, 2, '0')+
      // 14 (139 até 146 / tam. 008) Data de nascimento
      ValidarCampo('N', FCdsPrincipal.FieldByName('DATANASC').asString, 8, ' ')+
      // 15 (147 até 148 / tam. 002) Horas Trabalhadas Semanais
      ValidarCampo('N', FloatToStr(Arredondar(FCdsPrincipal.FieldByName('HRS_TRAB').asFloat,0)), 2, '0')+
      // 16 (149 até 154 / tam. 006) CBO
      ValidarCampo('N', FCdsPrincipal.FieldByName('CBO').asString, 6, '0')+
      // 17 (155 até 162 / tam. 008) Data de opção do FGTS
      ValidarCampo('N', FCdsPrincipal.FieldByName('DATAOPCAOFGTS').asString, 8, ' ')+
      // 18 (163 até 164 / tam. 002) Código de Movimentação
      ValidarCampo('*', FCdsPrincipal.FieldByName('COD_MOV').asString, 2, ' ')+
      // 19 (165 até 172 / tam. 008) Data de Movimentação
      GetDataMotiventacao(FCdsPrincipal.FieldByName('DATA_MOV').asDateTime)+
      // 20 (173 até 175 / tam. 003) Código de Saque
      ValidarCampo('*', FCdsPrincipal.FieldByName('COD_SAQUE').asString, 3, ' ')+
      // 21 (176 até 176 / tam. 001) Tipo do Aviso Prévio
      sTipoAvisoPrevio+
      // 22 (177 até 184 / tam. 008) Data do Aviso Prévio
      Val_DataIniAvisoPrevio(FCdsPrincipal.FieldByName('DATAAVISO').asDateTime, sTipoAvisoPrevio)+
      // 23 (185 até 185 / tam. 001) Reposição de Vaga
      GetReposicaoVaga+
      // 24 (186 até 193 / tam. 008) Data da Homologação do Dissídio
      ValidarCampo('N',
        IFF(dtDataHomologaDissidio = 0, '', DateToStr(dtDataHomologaDissidio)), 8, ' ')+
      // 25 (194 até 208 / tam. 015) Valor do Dissídio
      IFF(dtDataHomologaDissidio = 0,
        Replicate('0', 15), GetValorAtual(FCdsDissidio))+
      // 26 (209 até 223 / tam. 015) Remuneração do mês anterior à rescisão
      IFF(dtDataHomologaDissidio > 0,
        Replicate('0', 15), GetValorAtual(FCdsRemMesAnterior))+
      // 27 (224 até 238 / tam. 015) Remuneração do mês da rescisão
      IFF(dtDataHomologaDissidio > 0,
        Replicate('0', 15), GetValorAtual(FCdsRemMesAtual))+
      // 28 (239 até 253 / tam. 015) Aviso Prévio Indenizado
      IFF((dtDataHomologaDissidio > 0) or (sTipoAvisoPrevio <> '2'),
        Replicate('0', 15), GetValorAtual(FCdsAvisoPrevio))+
      // 29 (254 até 254 / tam. 001) Indicativo de Pensão Alimentícia
      GetIndicativoPensaoAlim+
      // 30 (255 até 259 / tam. 005) Percentual de Pensão Alimentícia
      '00000'+
      // 31 (260 até 274 / tam. 015) Pensão Alimentícia
      GetValorAtual(FCdsPensaoAlim)+
      // 32 (275 até 285 / tam. 011) CPF
      ValidarCampo('N', FCdsPrincipal.FieldByName('CPF').asString, 11, '0')+
      // 33 (286 até 288 / tam. 003) Banco da Conta Salário
      '000'+
      // 34 (289 até 292 / tam. 004) Agência da Conta Salário
      '0000'+
      // 35 (293 até 305 / tam. 013) Conta Salário
      Replicate('0', 13)+
      // 36 (306 até 320 / tam. 015) Saldo para Fins Rescisório
      GetValorAtual(FCdsSaldoFinsResc)+
      // 37 (321 até 359 / tam. 039) Brancos
      Replicate(' ', 39)+
      // 38 (360 até 360 / tam. 001) Final de linha
      '*';
end;

function TCtrlParamGRRFMagnetico.GerarRegistro90: string;
begin
  Result :=
    // 01 (001 até 002 / tam. 002) Tipo do registro
    '90'+
    // 02 (003 até 053 / tam. 051) Marca de Final de Registro
    Replicate('9',  51)+
    // 03 (054 até 359 / tam. 306) Brancos
    Replicate(' ', 306)+
    // 04 (360 até 360 / tam. 001) Final de linha
    '*';
end;

function TCtrlParamGRRFMagnetico.MontarListaPessoas(NumEspacos: integer; Campos: string;
  const SemDemitidos: boolean): string;
var
  c: integer;
  sSQL: string;
  _SQL: TStringList;
begin
  try
    sSQL :=
      'SELECT' +CR_LF+
      IFF(Campos = '', '  IDPESSOA', Campos) +CR_LF+
      'FROM' +CR_LF;

    if (FBuscaFuncSitAtual) then
    begin
      sSQL := sSQL +
        '  (SELECT' +CR_LF+
        '     F.*,' +CR_LF+
        '     SF.TIPOSIT' +CR_LF+
        '   FROM' +CR_LF+
        '     FUNCIONARIO F, SITFUNC SF' +CR_LF+
        '   WHERE' +CR_LF+
        '     (F.TIPOCONTRATO     <> ''G'') AND' +CR_LF+
        '     (SF.TIPOSIT          = ''D'') AND' +CR_LF+
        '     (SF.IDSITFUNC        = F.IDSITFUNC) AND' +CR_LF;

      if (FListaCodCentroCusto <> '') then
      begin
        sSQL := sSQL +
          MontaLinhaSelSQL('     (F.CODCENTROCUSTO',FListaCodCentroCusto,1) +CR_LF+
          '     (F.IDEMPRESA       = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF;
      end;

      sSQL := sSQL +
        MontaLinhaSelSQL('     (F.IDESTAB',FListaIdEstab,8) +CR_LF+
        '     (TO_CHAR(F.DATAADMISSAO,''YYYY/MM'')     <= ' +QuotedStr(FCompetencia)+ ') AND' +CR_LF+
        '     (TO_CHAR(F.DATADESLIGAMENTO,''YYYY/MM'') <= ' +QuotedStr(FCompetencia)+ ')) FUNC'
    end
    else
    begin
      sSQL := sSQL +
        '  (SELECT' +CR_LF+
        '     F.*,' +CR_LF+
        '     HST_SIT.TIPOSIT,' +CR_LF+
        '     RTRIM(CASE' +CR_LF+
        '             WHEN HST_EVOL.CODCENTROCUSTO IS NULL THEN F.CODCENTROCUSTO' +CR_LF+
        '             ELSE HST_EVOL.CODCENTROCUSTO' +CR_LF+
        '           END) AS COD_CENTROCUSTO,' +CR_LF+
        '     (CASE' +CR_LF+
        '        WHEN HST_EVOL.IDESTAB IS NULL THEN F.IDESTAB' +CR_LF+
        '        ELSE HST_EVOL.IDESTAB' +CR_LF+
        '      END) AS ID_ESTAB' +CR_LF+
        '   FROM' +CR_LF+
        '     FUNCIONARIO F,' +CR_LF+
        // Situação Funcional atual
        // -------------------------------------------------------------------- //
        '     (SELECT DISTINCT' +CR_LF+
        '        H.IDPESSOA, SF.TIPOSIT' +CR_LF+
        '      FROM' +CR_LF+
        '        HSTSITFUNC H, SITFUNC SF,' +CR_LF+
        '        (SELECT' +CR_LF+
        '           MAX(H.DATASITFUNC) AS DATASITFUNC, H.IDPESSOA' +CR_LF+
        '         FROM' +CR_LF+
        '           HSTSITFUNC H, SITFUNC SF' +CR_LF+
        '         WHERE' +CR_LF+
        '           (SF.TIPOSIT   = ''D'') AND' +CR_LF+
        '           (SF.IDSITFUNC = H.IDSITFUNC) AND' +CR_LF+
        '           (TO_CHAR(H.DATASITFUNC,''YYYY/MM'') = ' +QuotedStr(FCompetencia)+ ')' +CR_LF+
        '         GROUP BY' +CR_LF+
        '           H.IDPESSOA) HST2,' +CR_LF+
        '        (SELECT' +CR_LF+
        '           MAX(H.TRGDTINCLUSAO) AS DATAINCLUSAO, H.IDPESSOA' +CR_LF+
        '         FROM' +CR_LF+
        '           HSTSITFUNC H, SITFUNC SF' +CR_LF+
        '         WHERE' +CR_LF+
        '           (SF.TIPOSIT   = ''D'') AND' +CR_LF+
        '           (SF.IDSITFUNC = H.IDSITFUNC) AND' +CR_LF+
        '           (TO_CHAR(H.DATASITFUNC,''YYYY/MM'') = ' +QuotedStr(FCompetencia)+ ')' +CR_LF+
        '         GROUP BY' +CR_LF+
        '           H.IDPESSOA) HST3' +CR_LF+
        '      WHERE' +CR_LF+
        '        (H.DATASITFUNC   = HST2.DATASITFUNC) AND' +CR_LF+
        '        (H.IDPESSOA      = HST2.IDPESSOA) AND' +CR_LF+
        '        (H.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND' +CR_LF+
        '        (H.IDPESSOA      = HST3.IDPESSOA) AND' +CR_LF+
        '        (H.IDSITFUNC     = SF.IDSITFUNC)) HST_SIT,' +CR_LF+
        // Situação da Evolução Funcional atual
        // -------------------------------------------------------------------- //
        '     (SELECT DISTINCT' +CR_LF+
        '        EF.IDPESSOA, EF.IDESTAB, EF.IDEMPRESA, EF.CODCENTROCUSTO' +CR_LF+
        '      FROM' +CR_LF+
        '        EVOLFUNC EF,' +CR_LF+
        '        (SELECT' +CR_LF+
        '           MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA' +CR_LF+
        '         FROM' +CR_LF+
        '           EVOLFUNC' +CR_LF+
        '         WHERE' +CR_LF+
        '           (TO_CHAR(DATAALTERFUNC,''YYYY/MM'') = ' +QuotedStr(FCompetencia)+ ')' +CR_LF+
        '         GROUP BY' +CR_LF+
        '           IDPESSOA) HST2,' +CR_LF+
        '        (SELECT' +CR_LF+
        '           MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA' +CR_LF+
        '         FROM' +CR_LF+
        '           EVOLFUNC' +CR_LF+
        '         WHERE' +CR_LF+
        '           (TO_CHAR(DATAALTERFUNC,''YYYY/MM'') = ' +QuotedStr(FCompetencia)+ ')' +CR_LF+
        '         GROUP' +CR_LF+
        '           BY IDPESSOA) HST3' +CR_LF+
        '      WHERE' +CR_LF+
        '        (EF.IDESTAB        IS NOT NULL) AND' +CR_LF+
        '        (EF.IDEMPRESA      IS NOT NULL) AND' +CR_LF+
        '        (EF.CODCENTROCUSTO IS NOT NULL) AND' +CR_LF+
        '        (EF.DATAALTERFUNC  = HST2.DATAALTERFUNC) AND' +CR_LF+
        '        (EF.IDPESSOA       = HST2.IDPESSOA) AND' +CR_LF+
        '        (EF.TRGDTINCLUSAO  = HST3.DATAINCLUSAO) AND' +CR_LF+
        '        (EF.IDPESSOA       = HST3.IDPESSOA)) HST_EVOL' +CR_LF+
        // -------------------------------------------------------------------- //
        '   WHERE' +CR_LF+
        '     (F.TIPOCONTRATO <> ''G'') AND' +CR_LF+
        '     (TO_CHAR(F.DATAADMISSAO,''YYYY/MM'') <= ' +QuotedStr(FCompetencia)+ ') AND' +CR_LF+
        '     (F.IDPESSOA      = HST_SIT.IDPESSOA) AND' +CR_LF+
        '     (F.IDPESSOA      = HST_EVOL.IDPESSOA(+))) FUNC' +CR_LF+
        // -------------------------------------------------------------------- //
        'WHERE' +CR_LF;

      if (FListaCodCentroCusto <> '') then
      begin
        sSQL := sSQL +
          MontaLinhaSelSQL('  (COD_CENTROCUSTO',FListaCodCentroCusto,1) +CR_LF+
          '  (IDEMPRESA        = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF;
      end;

      sSQL := sSQL +
        MontaLinhaSelSQL('  (ID_ESTAB',FListaIdEstab,8,false);
    end;

    _SQL := TStringList.Create;
    try
      _SQL.Text := sSQL;
      for c:=0 to _SQL.Count-1 do
        _SQL[c] := Replicate(' ', NumEspacos) + _SQL[c];

      // Retornar a Query sem o caracter ENTER do final
      Result := Copy(_SQL.Text, 1, Length(_SQL.Text)-2);
    finally
      _SQL.Free;
    end;
  except
    on E: Exception do
    begin
      Result := '';
      MessageInfo := E.Message;
    end;
  end;
end;

procedure TCtrlParamGRRFMagnetico.PosicionarValoresPessoa(const IdPessoa: double);
begin
  FCdsRemMesAnterior.Filter := 'IDPESSOA = ' +FloatToStr(IdPessoa);
  FCdsRemMesAtual.Filter := 'IDPESSOA = ' +FloatToStr(IdPessoa);
  FCdsAvisoPrevio.Filter := 'IDPESSOA = ' +FloatToStr(IdPessoa);
  FCdsPensaoAlim.Filter := 'IDPESSOA = ' +FloatToStr(IdPessoa);
  FCdsSaldoFinsResc.Filter := 'IDPESSOA = ' +FloatToStr(IdPessoa);
  FCdsDissidio.Filter := 'IDPESSOA = ' +FloatToStr(IdPessoa);
end;

procedure TCtrlParamGRRFMagnetico.ProximaPessoa;
begin
  FCdsPrincipal.Next;
  PosicionarValoresPessoa(FCdsPrincipal.FieldByName('IDPESSOA').asFloat);

  if (FDeslocamentoAtual = FNumDeslocamentos) then
  begin
    IncProgresso(GetTempoDecorrido, '', 1);
    FDeslocamentoAtual := 0;
  end
  else
    Inc(FDeslocamentoAtual);
end;

function TCtrlParamGRRFMagnetico.GetValorAtual(const Cds: TCMClientDataSet): string;
begin
  if (Cds.IsEmpty) then
    Result := Replicate('0', 15)
  else
    Result := ValidarCampo('N',
      FormatFloat('#########0.00', Cds.FieldByName('VALOR').asFloat), 15, '0');
end;

function TCtrlParamGRRFMagnetico.ProcessarGeracao(const IdEmpresa: integer; const MesRef,
  AnoRef: integer; const DataPag: TDate; const ListaIdEstab, ListaCodCentroCusto: string;
  const IdResponsavel, IdPessoaContato: double; const BuscaFuncSitAtual: boolean;
  const OptanteSimples: integer; const ListaIdRubrica_RemMesAnterior,
  ListaIdRubrica_RemMesAtual, ListaIdRubrica_AvisoPrevio,
  ListaIdRubrica_PensaoAlim, ListaIdRubrica_SaldoFinsResc,
  ListaIdRubrica_Dissidio: string): boolean;
var
  sRegistro40: string;
begin
  try
    Result := false;
    FHoraIni := Time;

    FCdsPrincipal := TCMClientDataSet.Create(nil);
    FCdsEstab := TCMClientDataSet.Create(nil);
    FCdsResp := TCMClientDataSet.Create(nil);
    FCdsContato := TCMClientDataSet.Create(nil);
    FCdsRemMesAnterior := TCMClientDataSet.Create(nil);
    FCdsRemMesAtual := TCMClientDataSet.Create(nil);
    FCdsAvisoPrevio := TCMClientDataSet.Create(nil);
    FCdsPensaoAlim := TCMClientDataSet.Create(nil);
    FCdsSaldoFinsResc := TCMClientDataSet.Create(nil);
    FCdsDissidio := TCMClientDataSet.Create(nil);

    FCdsPrincipal.Filtered := true;
    FCdsRemMesAnterior.Filtered := true;
    FCdsRemMesAtual.Filtered := true;
    FCdsAvisoPrevio.Filtered := true;
    FCdsPensaoAlim.Filtered := true;
    FCdsSaldoFinsResc.Filtered := true;
    FCdsDissidio.Filtered := true;

    FAnoRef := AnoRef;
    FCompetencia := IntToStr(AnoRef) +'/'+ PoeZero(MesRef);
    FIdEmpresa := IdEmpresa;
    FBuscaFuncSitAtual := BuscaFuncSitAtual;
    FDataPag := DataPag;

    FIdResponsavel := IdResponsavel;
    FIdPessoaContato := IdPessoaContato;
    FOptanteSimples := OptanteSimples;

    FListaIdEstab := ListaIdEstab;
    FListaCodCentroCusto := ListaCodCentroCusto;
    FListaIdRubrica_RemMesAnterior := ListaIdRubrica_RemMesAnterior;
    FListaIdRubrica_RemMesAtual := ListaIdRubrica_RemMesAtual;
    FListaIdRubrica_AvisoPrevio := ListaIdRubrica_AvisoPrevio;
    FListaIdRubrica_PensaoAlim := ListaIdRubrica_PensaoAlim;
    FListaIdRubrica_SaldoFinsResc := ListaIdRubrica_SaldoFinsResc;
    FListaIdRubrica_Dissidio := ListaIdRubrica_Dissidio;
        
    FArq.Text := '';
    try
      // Montar Queries com informações dos Estabelecimentos, do Reponsável e do Contato
      if not(AbrirQueryEstabelecimento) or not(AbrirQueryResponsavel) or
         not(AbrirQueryContato) then
      begin
        Result := true;
        raise Exception.Create(MessageInfo);
      end;

      // Montar Queries com informações das pessoas
      if not(AbrirQueryPrincipal) or not(AbrirQueriesDosValores) then
      begin
        Result := true;
        raise Exception.Create(MessageInfo);
      end;

      // Para que a barra de progressos seja incrementada, será preciso passar por N registros
      // dentro dos 20% restantes do processo.
      // Ex(1): 200 registros divididos por 20 é igual a 10
      // Isto quer dizer que a cada 10 registros o progresso será incrementado
      // Ex(2): 257 registros divididos por 20 é aproximadamente 34
      // Isto quer dizer que a cada 34 registros o progresso será incrementado
      FNumDeslocamentos := (FCdsPrincipal.RecordCount div 20);
      FDeslocamentoAtual := 0;

      // Processar dados para a geração do arquivo
      IncProgresso(GetTempoDecorrido, CMTranslate('Processando Dados...'), 0);

      // Informações do responsável (header do arquivo)
      FArq.Add(GerarRegistro00);
      IncProgresso(GetTempoDecorrido, '', 0);

      // Geração do subarquivo de todos os estabelecimentos selecionados
      while not(FCdsEstab.EOF) do
      begin
        FCdsPrincipal.Filter := 'IDESTAB = ' +FCdsEstab.FieldByName('IDPESSOA').asString;
        if not(FCdsPrincipal.IsEmpty) then
        begin
          // Informações da Empresa (header da Estabelecimento)
          FArq.Add(GerarRegistro10);
          IncProgresso(GetTempoDecorrido, '', 0);

          // Posicionar querys de valores da primeira pessoa do estabelecimento atual
          PosicionarValoresPessoa(FCdsPrincipal.FieldByName('IDPESSOA').asFloat);

          // Geração dos registros para cada pessoa
          repeat
            sRegistro40 := GerarRegistro40;
            if (sRegistro40 <> '') then
              FArq.Add(sRegistro40);
            ProximaPessoa;
          until (FCdsPrincipal.EOF);
        end;

        FCdsEstab.Next;
      end;

      // *************************************
      // Registro Tipo '90' - Registro Trailer
      // *************************************
      FArq.Add(GerarRegistro90);

      IncProgresso(GetTempoDecorrido, '', 100);
      MessageInfo := '';
      Result := true;
    except
      on E: Exception do
        MessageInfo := E.Message;
    end;

    IncProgresso(GetTempoDecorrido, '', 0);
    FTempoDecorridoTotal := GetTempoDecorrido(true);
  finally
    FreeAndNil(FCdsPrincipal);
    FreeAndNil(FCdsEstab);
    FreeAndNil(FCdsResp);
    FreeAndNil(FCdsContato);
    FreeAndNil(FCdsRemMesAnterior);
    FreeAndNil(FCdsRemMesAtual);
    FreeAndNil(FCdsAvisoPrevio);
    FreeAndNil(FCdsPensaoAlim);
    FreeAndNil(FCdsSaldoFinsResc);
    FreeAndNil(FCdsDissidio);
  end;
end;

end.
