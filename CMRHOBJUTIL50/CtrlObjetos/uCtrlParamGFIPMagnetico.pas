unit uCtrlParamGFIPMagnetico;

interface

uses SysUtils, Classes, Controls, DB, Forms, uCmControlObject, uCmDbObject, IvDictio,
   uCmClientDataSet, uCMTypes, uCtrlCustomRH;

type
  TOnProgGFIPMagnetico = procedure (const TempoAtual, Mensagem: string;
    const Incremento: integer) of object;

  TCtrlParamGFIPMagnetico = class(TCtrlCustomRH)
  protected
    FDataAdmissao: string; // Data de Admissão
    FFPAS: string; // Código de FPAS
    FIndRecFGTS: string; // Indicador de recolhimento FGTS
    FRegitroAltTrab: string; // Contém a(s) Movimentação(ões) dos Empregados
    FIndRecPrevSoc: char; // Indicador de Recolhimento da Perv. Social
    FHoraIni: TTime; // Hora inicial do processamento
  private
    FOnProgGFIPMagnetico: TOnProgGFIPMagnetico;

    FCdsPessoal: TCMClientDataSet;
    FCdsEstab: TCMClientDataSet;
    FCdsListaTomador: TCMClientDataSet;
    FCdsResp: TCMClientDataSet;
    FCdsTomador: TCMClientDataSet;
    FCdsTransfDeOutraEmpresa: TCMClientDataSet;
    FCdsTransfParaOutraEmpresa: TCMClientDataSet;
    FCdsTransfMesmaEmpresa: TCMClientDataSet;
    FCdsGPS: TCMClientDataSet;
    FCdsSalFam: TCMClientDataSet;
    FCdsSalFamTomador: TCMClientDataSet;
    FCdsSalMat: TCMClientDataSet;
    FCdsContribDescontEmpreg: TCMClientDataSet;
    FCdsRemSem13: TCMClientDataSet;
    FCdsRemSobre13: TCMClientDataSet;
    FCdsValorRetidoSegurado: TCMClientDataSet;
    FCdsBaseContribPrevAfast: TCMClientDataSet;
    FCdsBase13PrevSoc: TCMClientDataSet;
    FCdsBaseCalc13_GPS: TCMClientDataSet;
    FCdsAltEndereco: TCMClientDataSet;
    FCdsPenultSitFunc: TCMClientDataSet;

    FArq, FSQL: TStringList;

    FIdEmpresa: integer;
    FSEFIP_13Salario: boolean; // Indica se o SEFIP é da competência de 13º salário
    FDataComp: string; // Data de Competência (AAAA/MM). INCLUINDO a de 13. salário
    FCompetencia: string; // Data de Competência (AAAA/MM). EXCLUINDO a de 13. salário
    FDataCompetencia: string; // Data de Competência (DD/MM/AAAA). INCLUINDO a de 13. salário
    FDataVenc: string;
    FDataPag: string;
    FListaIdEstab: string;
    FListaCodCentroCusto: string;
    FIdResponsavel: double;
    FIdentificadorDocCPF: boolean;
    FCodRecolhimento: integer; // Código de Recolhimento da GRE
    FCodEmpresaCAIXA: string;
    FOptanteSimples: integer;
    FOpcaoModalidade: integer;
    FDiaLimiteGRFC: integer;

    FFiltroPessoaEstab: string;
    //FListaIdPessoa: string;
    FListaIdPessoaTransf: string;
    FListaCodCentroCustoTransf: string;

    FDataDesligamento: TDate; // Usada para trazer somente o valor correto. Algumas
                              // pessoas tem esta data com o valor 31/12/1899 ("0" no BD)
    FNumDeslocamentos: integer;
    FDeslocamentoAtual: integer;
    FBuscaFuncSitAtual: boolean;
    FGerarTomador: boolean;

    FListaRubricaSalFam: string;
    FListaRubricaSalMat: string;
    FListaRubricaValINSS_13: string;
    FListaRubricaSalSem13: string;
    FListaRubrica13Salario: string;
    FListaRubricaValRetSegurado: string;
    FListaRubricaBaseINSS_Esp: string;
    FListaRubricaBaseINSS_13Movimento: string;
    FListaRubricaBaseINSS_13: string;

    FTipoInscricaoTomador: string;
    FInscricaoTomador: string;

    FTempoDecorridoTotal: string;

    procedure IncProgresso(const TempoAtual, Mensagem: string; const Incremento: integer);
    function  GetTempoDecorrido(Extendido: boolean = false): string;

    function AbrirQueryEstabelecimento: boolean;
    function AbrirQueryResponsavel: boolean;
    function AbrirQueryGPS: boolean;

    function AbrirQueryTransfDeOutraEmpresa: boolean;
    function AbrirQueryTransfParaOutraEmpresa: boolean;
    function AbrirQueryTransfMesmaEmpresa: boolean;
    function AbrirQueryPrincipal: boolean;
    function AbrirQueryTomador: boolean;
    function AbrirQueriesDosValores: boolean;
    function AbrirQueryAltEndereco: boolean;

    function MontarListaTransferidos(var ListaIdPessoa, ListaCCusto: string): boolean;
    function MontarListaPessoas(NumEspacos: integer; Campos: string = '';
      const SemDemitidos: boolean = false): string;
    function IdentificarSitHistPessoas: boolean;
    function IdentificarPessoas: boolean;
    function GerarRegistroPessoa: boolean;
    function GetPenultSitFunc(const IdPessoa: double; const DataUltSitFunc: TDate): boolean;

    procedure PosicionarValoresEstab(const IdEstab: double);
    procedure PosicionarValoresPessoa(const IdPessoa: double);
    procedure ProximaPessoa;

    procedure SetDataDesligamento;
    procedure SetDadosTomadorPessoa(const IdGrupo: string);

    function  GetValorAtual(const Cds: TCMClientDataSet): double;
    function  GetValorRetencao(const IdTomador: double): string;
    function  GetValorFatura(const IdTomador: double): string;
    function  GetValor(const Cds: TCMClientDataSet): double;
    function  GetNumDiasTrabAno: integer;

    // Valida os dados do GFIP MAGNÉTICO
    function ValidarCampo(Tipo: char; Dado: string; Tamanho: word; Ch: char): string;
    // Rotinas de Validação de Dados
    function Val_CEP(CEP: string): string;
    function Val_IndiRecFGTS(DtPag,DtComp: TDate): string;
    function Val_DtRecFGTS(DtVenc,DtPag: TDateTime): string;
    function Val_IndiRecPrevSoc(DtPag,Campo: TDateTime): char;
    function Val_DtRecPrevSoc(Campo: string): string;
    function Val_IndiAlteracao(Altera: char): char;
    function Val_AliqSAT(Campo: real): string;
    function Val_CodCentral(TipInscr,Campo: string): string;
    function Val_FPAS(Campo: string): string;
    function Val_CodTerceiros(Campo: string): string;
    function Val_CodPagGPS10(Campo: string): string;
    function Val_CodPagGPS20(Campo: string): string;
    function Val_IsencFilant(Campo: double): string;
    function Val_SalFamilia10(Campo: double): string;
    function Val_SalFamilia20(Campo: double): string;
    function Val_SalMaternidade(Campo: double): string;
    //function Val_ContDescEmpregado10(Campo: double): string;
    //function Val_ValorDevPrev_Neg_Pos10(Campo: double): string;
    //function Val_ValorDevPrev10(Campo: double): string;
    function Val_DtAdmissao(Campo: TDate): string;
    function Val_MatrEmpregado(Campo: string): string;
    function Val_CTPS(Ini,Tam: byte; Campo: string): string;
    function Val_DataOpcao(Campo: TDate): string;
    function Val_DataNascimento(Campo: TDate): string;
    function Val_RemSem13(Campo: double): string;
    function Val_RemSobre13(Campo: double): string;
    function Val_Ocorrencia(Campo: string): string;
    function Val_BaseContribPrevAfast(Campo: double): string;
    function Val_BaseCalc13(Campo: double): string;
    function Val_BaseCalc13_GPS(Campo: double): string;
    function Val_ModalidadeArquivo: string;

    function GerarRegistro_AltEndereco: boolean;

    // Geração dos registros do arquivo
    function GerarRegistro00: string;
    function GerarRegistro10: string;
    //function GerarRegistro13: string;
    function GerarRegistro14: string;
    function GerarRegistro20: string;
    function GerarRegistro30: string;
    function GerarRegistro32: string;
    function GerarRegistro90: string;

    procedure GerarRegistrosPessoas;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListTomadores(const IdEmpresa: integer; const ListaIdEstab: string): OleVariant;
    function GerarTomador(const CodRecolhimento: integer): boolean;

    function ProcessarGeracao(IdEmpresa: integer; MesRef, AnoRef: integer;
      DataVenc, DataPag: TDate; const ovTomador: OleVariant; ListaIdEstab,
      ListaCodCentroCusto: string; IdResponsavel: double; SEFIP_13Salario,
      BuscaFuncSitAtual, GerarRegAltEndereco, IdentificadorDocCPF: boolean;
      CodRecolhimento: integer; CodEmpresaCAIXA: string; DiaLimiteGRFC, OptanteSimples,
      OpcaoModalidade: integer; ListaRubricaSalFam, ListaRubricaSalMat,
      ListaRubricaValINSS_13, ListaRubricaSalSem13, ListaRubrica13Salario,
      ListaRubricaValRetSegurado, ListaRubricaBaseINSS_Esp,
      ListaRubricaBaseINSS_13Movimento, ListaRubricaBaseINSS_13: string): boolean;

    property TempoDecorridoTotal: string read FTempoDecorridoTotal;
    property DadosArquivo: TStringList read FArq;
    property OnProgresso: TOnProgGFIPMagnetico read FOnProgGFIPMagnetico write FOnProgGFIPMagnetico;
  end;

implementation

uses uCtrlFuncoesRH;

const
  TIPO_INSCR_FORN_FOLHAPAG = '1'; // Tipo da Incrição do Fornecedor da Folha (Responsável)
  INSCR_FORN_FOLHAPAG = '29185659000141'; // Incrição do Fornecedor da Folha (Responsável)

  // Situações das pessoas
  SIT_NORMAL = 0; // não houve movimentação na competência
  SIT_AFASTAMENTO = 1; // houve movimentação de afastamento/demissão na competência
  SIT_AFASTAMENTO_RETORNO = 2; // houve movimentação de afastamento e retorno na competência
  SIT_TRANSF_MESMA_EMPRESA_ENT = 3; // transferência para outro estabelecimento da empresa na competência (Estabelecimento de Entrada)
  SIT_TRANSF_MESMA_EMPRESA_SAI = 4; // transferência para outro estabelecimento da empresa na competência (Estabelecimento de Saída)
  SIT_TRANSF_DE_OUTRA_EMPRESA = 5; // movimentação de transferência de outra empresa na competência
  SIT_TRANSF_PARA_OUTRA_EMPRESA = 6; // movimentação de transferência para outra empresa na competência

  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_SEM_DADOS_ESTAB =
    'Dados do(s) Estabelecimento(s) selecionado(s) não estão completos.:1'+
    'Verifique e tente novamente.';
  MSG_SEM_DADOS_RESP =
    'Dados do Responsável selecionado não estão completos.:1'+
    'Verifique e tente novamente.';
  MSG_SEM_DADOS_GPS =
    'GPS do Mês selecionado não foi gerada.:1'+
    'Verifique e tente novamente.';
  MSG_SEM_DADOS =
    'Não há dados a serem processados para esta competência ou:1'+
    'Dados Cadastrais incompletos.';
  MSG_SEM_DADOS_TOMADOR =
    'Dados do(s) Tomador(es) de Serviço associados a algumas pessoas não estão completos.:1'+
    'Verifique e tente novamente.';

{ TCtrlParamGFIPMagnetico }

constructor TCtrlParamGFIPMagnetico.Create;
begin
  inherited;
  FSQL := TStringList.Create;
  FArq := TStringList.Create;

  GetTempDir;
end;

destructor TCtrlParamGFIPMagnetico.Destroy;
begin
  FSQL.Free;
  FArq.Free;
  inherited;
end;

procedure TCtrlParamGFIPMagnetico.IncProgresso(const TempoAtual, Mensagem: string;
  const Incremento: integer);
begin
  if Assigned(OnProgresso) then
    OnProgresso(TempoAtual, Mensagem, Incremento);
end;

function TCtrlParamGFIPMagnetico.GetTempoDecorrido(Extendido: boolean): string;
begin
  if (Extendido) then
    Result := HoraPorExtenso(Time - FHoraIni)
  else
    Result := FormatDateTime('hh:mm:ss', Time - FHoraIni);
end;

function TCtrlParamGFIPMagnetico.AbrirQueryEstabelecimento: boolean;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PJ.IDPESSOA,');
    Add('  NVL(FP.INDTIPOEMPRESA,0) AS COD_CENTRALIZACAO,');
    Add('  FP.IDCONVPREVID AS COD_TERCEIROS,');
    Add('  FP.CUSTOPATROC AS PERC_ISENC_FILANT,');
    Add('  FPAS.IDFPAS AS FPAS,');
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
    Add('  PESSOA PJ, ENDPESS E, TELENDPESS TE, CIDADES CI, ESTADO ES,');
    Add('  FPAS, FILIALPESSOA FP,');
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
    Add('  (FP.IDFPAS          = FPAS.IDFPAS) AND');
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
  IncProgresso('', ('Selecionando dados do(s) Estabelecimento(s)...'), 0);
  FCdsEstab.Data := GetDataPacket(FSQL);
  IncProgresso(GetTempoDecorrido, '', 6);

  Result := not(FCdsEstab.IsEmpty);
  if not(Result) then
    MessageInfo := CMTranslateMsg(MSG_SEM_DADOS_ESTAB, [CR_LF]);
end;

function TCtrlParamGFIPMagnetico.AbrirQueryResponsavel: boolean;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  ''3'' AS TIPO_INSCRICAO,'); // 1 (CNPJ), 2 (CEI) ou 3 (CPF)
    Add('  NUMDOCUMENTO AS INSCRICAO,');
    Add('  NOME,');
    Add('  UPPER(RTRIM(EMAIL)) AS EMAIL');
    Add('FROM');
    Add('  PESSOA');
    Add('WHERE');
    Add('  (IDPESSOA = ' +FloatToStr(FIdResponsavel)+ ')');
    SaveToFile(DirTempLog + '\qryResp.txt');
  end;
  IncProgresso('', ('Selecionando dados do Responsável...'), 3);
  FCdsResp.Data := GetDataPacket(FSQL);
  IncProgresso(GetTempoDecorrido, '', 3);

  Result := not(FCdsResp.IsEmpty);
  if not(Result) then
    MessageInfo := CMTranslateMsg(MSG_SEM_DADOS_RESP, [CR_LF]);
end;

function TCtrlParamGFIPMagnetico.AbrirQueryGPS: boolean;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  DATAFIMGRPS, DATAVENCGRPS, IDFILIALPESSOA AS IDESTAB,');
    Add('  SEGACIDTRABALHO, CODIGOPAG, TOTAL');
    Add('FROM');
    Add('  GUIAGRPS');
    Add('WHERE');
    Add('  (MES = ' +QuotedStr(FCompetencia)+ ')');

{    if (FSEFIP_13Salario) then
      Add('  (MES = ' +QuotedStr(IncDataAM(FDataComp,-1))+ ')')
    else
      Add('  (MES = ' +QuotedStr(FDataComp)+ ')');}

    Add('ORDER BY');
    Add('  IDFILIALPESSOA, DATAFIMGRPS DESC');
    SaveToFile(DirTempLog + '\qryGPS.txt');
  end;
  IncProgresso('', ('Selecionando geração da GPS do mês...'), 0);
  FCdsGPS.Data := GetDataPacket(FSQL);
  IncProgresso(GetTempoDecorrido, '', 3);

  Result := not(FCdsGPS.IsEmpty);
  if not(Result) then
    MessageInfo := CMTranslateMsg(MSG_SEM_DADOS_GPS, [CR_LF]);
end;

function TCtrlParamGFIPMagnetico.AbrirQueryTransfDeOutraEmpresa: boolean;
begin
  // Transferências entre Estabelecimentos de Empresas Proprietárias diferentes
  try
    with (FSQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  MESMA_EMPRESA.IDPESSOA, MESMA_EMPRESA.DATA,');
      Add('  MESMA_EMPRESA.MOTIVOFGTS AS COD_MOV, F.CODCENTROCUSTO');
      Add('FROM');
      Add('  FUNCIONARIO F,');
      Add('  (SELECT');
      Add('     EF.IDPESSOA, EF.DATAALTERFUNC AS DATA, MO.MOTIVOFGTS');
      Add('   FROM');
      Add('     EVOLFUNC EF, MOTIVO MO');
      Add('   WHERE');
      Add('     (RTRIM(MO.MOTIVOFGTS) IN (''N1'',''N2'')) AND');
      Add('     (MO.IDMOTIVO  = EF.IDMOTIVO) AND');
      Add(MontaLinhaSelSQL('     (EF.IDESTAB',FListaIdEstab,2));
      Add('     (TO_CHAR(EF.DATAALTERFUNC,''YYYY/MM'') = ' +QuotedStr(FCompetencia)+ ')');
      Add('  ) MESMA_EMPRESA,');
      Add('  (SELECT');
      Add('     EF.IDPESSOA, EF.DATAALTERFUNC AS DATA');
      Add('   FROM');
      Add('     EVOLFUNC EF,');
      Add('     (SELECT IDPESSOA, MAX(DATAALTERFUNC) AS DATA');
      Add('      FROM   EVOLFUNC');
      Add('      WHERE  (TO_CHAR(DATAALTERFUNC,''YYYY/MM'') < ' +QuotedStr(FCompetencia)+ ')');
      Add('      GROUP BY IDPESSOA');
      Add('     ) ULT_EF');
      Add('   WHERE');
      Add('     (EF.IDEMPRESA     <> ' +IntToStr(FIdEmpresa)+ ') AND');
      Add('     (EF.IDPESSOA      = ULT_EF.IDPESSOA) AND');
      Add('     (EF.DATAALTERFUNC = ULT_EF.DATA)');
      Add('  ) OUTRA_EMPRESA');
      Add('WHERE');
      Add('  (MESMA_EMPRESA.IDPESSOA = F.IDPESSOA) AND');
      Add('  (OUTRA_EMPRESA.IDPESSOA = F.IDPESSOA)');
      SaveToFile(DirTempLog + '\qryTransfDeOutraEmpresa.txt');
    end;
    FCdsTransfDeOutraEmpresa.Data := GetDataPacket(FSQL);
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end
end;

function TCtrlParamGFIPMagnetico.AbrirQueryTransfParaOutraEmpresa: boolean;
begin
  // Transferências entre Estabelecimentos de Empresas Proprietárias diferentes
  try
    with (FSQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  OUTRA_EMPRESA.IDPESSOA, OUTRA_EMPRESA.DATA,');
      Add('  OUTRA_EMPRESA.MOTIVOFGTS AS COD_MOV, F.CODCENTROCUSTO');
      Add('FROM');
      Add('  FUNCIONARIO F,');
      Add('  (SELECT');
      Add('     EF.IDPESSOA, EF.DATAALTERFUNC AS DATA, MO.MOTIVOFGTS');
      Add('   FROM');
      Add('     EVOLFUNC EF, MOTIVO MO');
      Add('   WHERE');
      Add('     (RTRIM(MO.MOTIVOFGTS) IN (''N1'',''N2'')) AND');
      Add('     (MO.IDMOTIVO  = EF.IDMOTIVO) AND');
      Add('     (TO_CHAR(EF.DATAALTERFUNC,''YYYY/MM'') = ' +QuotedStr(FCompetencia)+ ') AND');
      Add('     (EF.IDEMPRESA <> ' +IntToStr(FIdEmpresa)+ ')');
      Add('  ) OUTRA_EMPRESA,');
      Add('  (SELECT');
      Add('     EF.IDPESSOA, EF.DATAALTERFUNC AS DATA');
      Add('   FROM');
      Add('     EVOLFUNC EF,');
      Add('     (SELECT IDPESSOA, MAX(DATAALTERFUNC) AS DATA');
      Add('      FROM   EVOLFUNC');
      Add('      WHERE  (TO_CHAR(DATAALTERFUNC,''YYYY/MM'') < ' +QuotedStr(FCompetencia)+ ')');
      Add('      GROUP BY IDPESSOA');
      Add('     ) ULT_EF');
      Add('   WHERE');
      Add(MontaLinhaSelSQL('     (EF.IDESTAB',FListaIdEstab,1));
      Add('     (EF.IDPESSOA      = ULT_EF.IDPESSOA) AND');
      Add('     (EF.DATAALTERFUNC = ULT_EF.DATA)');
      Add('  ) MESMA_EMPRESA');
      Add('WHERE');
      Add('  (OUTRA_EMPRESA.IDPESSOA = F.IDPESSOA) AND');
      Add('  (MESMA_EMPRESA.IDPESSOA = F.IDPESSOA)');
      SaveToFile(DirTempLog + '\qryTransfParaOutraEmpresa.txt');
    end;
    FCdsTransfParaOutraEmpresa.Data := GetDataPacket(FSQL);
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end
end;

function TCtrlParamGFIPMagnetico.AbrirQueryTransfMesmaEmpresa: boolean;
begin
  // Transferências entre Estabelecimentos da mesma Empresa Proprietária
  try
    with (FSQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  EMPRESA_ATU.IDPESSOA, EMPRESA_ATU.DATA,');
      Add('  EMPRESA_ATU.MOTIVOFGTS AS COD_MOV, F.CODCENTROCUSTO');
      Add('FROM');
      Add('  FUNCIONARIO F,');
      Add('  (SELECT');
      Add('     EF.IDPESSOA, EF.DATAALTERFUNC AS DATA, MO.MOTIVOFGTS');
      Add('   FROM');
      Add('     EVOLFUNC EF, MOTIVO MO');
      Add('   WHERE');
      Add('     (RTRIM(MO.MOTIVOFGTS) IN (''N1'',''N2'')) AND');
      Add('     (MO.IDMOTIVO  = EF.IDMOTIVO) AND');
      Add('     (TO_CHAR(EF.DATAALTERFUNC,''YYYY/MM'') = ' +QuotedStr(FCompetencia)+ ') AND');
      Add('     (EF.IDEMPRESA = ' +IntToStr(FIdEmpresa)+ ') AND');
      Add(MontaLinhaSelSQL('     (EF.IDESTAB',FListaIdEstab,3,false));
      Add('  ) EMPRESA_ATU,');
      Add('  (SELECT');
      Add('     EF.IDPESSOA, EF.DATAALTERFUNC AS DATA');
      Add('   FROM');
      Add('     EVOLFUNC EF,');
      Add('     (SELECT IDPESSOA, MAX(DATAALTERFUNC) AS DATA');
      Add('      FROM   EVOLFUNC');
      Add('      WHERE  (TO_CHAR(DATAALTERFUNC,''YYYY/MM'') < ' +QuotedStr(FCompetencia)+ ')');
      Add('      GROUP BY IDPESSOA');
      Add('     ) ULT_EF');
      Add('   WHERE');
      Add('     (EF.IDPESSOA      = ULT_EF.IDPESSOA) AND');
      Add('     (EF.DATAALTERFUNC = ULT_EF.DATA)');
      Add('  ) EMPRESA_ANT');
      Add('WHERE');
      Add('  (EMPRESA_ATU.IDPESSOA = F.IDPESSOA) AND');
      Add('  (EMPRESA_ANT.IDPESSOA = F.IDPESSOA)');
      SaveToFile(DirTempLog + '\qryTransfMesmaEmpresa.txt');
    end;
    FCdsTransfMesmaEmpresa.Data := GetDataPacket(FSQL);
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end
end;

function TCtrlParamGFIPMagnetico.AbrirQueryPrincipal: boolean;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  F.IDESTAB,');
    Add('  F.IDPESSOA,');
    Add('  PF.IDGRUPO,');
    Add('  F.MATRICULA,');
    Add('  PF.NOME,');
    Add('  CTPS.NUM AS CTPS,');
    Add('  PIS.NUM AS PIS,');
    Add('  ''0'' || SUBSTR(TO_CHAR(C.CBO2002),1,4) AS CBO,');
    Add('  NVL(F.IDCATEMPRGRE,1) AS CATEGORIA,');
    Add('  NVL(F.IDSITRISCO,-1) AS OCORRENCIA,');
    Add('  PESFIS.DATANASC,');
    Add('  F.DATAADMISSAO,');
    Add('  F.DATAOPCAOFGTS,');
    Add('  F.NUMCONTAFGTS,');
    Add('  F.NUMCONTASALARIO,');
    Add('  F.TIPOSIT,');
    Add('  ENDER.LOGRADOURO AS ENDERECO,');
    Add('  ENDER.BAIRRO,');
    Add('  ENDER.CEP,');
    Add('  ENDER.CIDADE,');
    Add('  ENDER.UF,');

    if (FBuscaFuncSitAtual) then
    begin
      Add('  MO.MOTIVOFGTS AS COD_MOV_ATUAL,');
      Add('  ULT_SITUACAO.MOTIVOFGTS AS COD_MOV_ANTERIOR,');
      Add('  TO_CHAR(F.DATADESLIGAMENTO,''DD/MM/YYYY'') AS DATADESLIGAMENTO,');
      Add('  TO_CHAR(F.DATARETORNO,''DD/MM/YYYY'') AS DATARETORNO,');
    end
    else
    begin
      Add('  ULT_SITUACAO.MOTIVOFGTS AS COD_MOV_ATUAL,');
      Add('  ULT_SITUACAO.DATA AS DATA_MOV_ATUAL,');
      Add('  ''1234'' AS COD_MOV_ANTERIOR,');
      Add('  (CASE');
      Add('     WHEN TO_CHAR(F.DATADESLIGAMENTO,''YYYY/MM'') <= ' +QuotedStr(FCompetencia)+
        ' THEN TO_CHAR(F.DATADESLIGAMENTO,''DD/MM/YYYY'')');
      Add('     ELSE ''''');
      Add('   END) AS DATADESLIGAMENTO,');
      Add('  (CASE');
      Add('     WHEN TO_CHAR(F.DATARETORNO,''YYYY/MM'') <= ' +QuotedStr(FCompetencia)+
        ' THEN TO_CHAR(F.DATARETORNO,''DD/MM/YYYY'')');
      Add('     ELSE ''''');
      Add('   END) AS DATARETORNO,');
    end;

    Add('  0 AS SITUACAO,');
    Add('  ''DD/MM/YYYY'' AS DATAMOV1,');
    Add('  ''DD/MM/YYYY'' AS DATAMOV2');
    // -------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PF, PESSOAFISICA PESFIS, MOTIVO MO, CARGO C,');
    // -------------------------------------------------------------------- //
    // Pessoas
    Add('  (');
    Add(MontarListaPessoas(3,
      '  TIPOSIT, IDPESSOA, MATRICULA, IDESTAB, IDCARGO,' +CR_LF+
      '  IDMOTIVODESLIGRAIS, DATARETORNO, TIPOCONTRATO,' +CR_LF+
      '  IDCATEMPRGRE, IDSITRISCO, DATAADMISSAO, DATAOPCAOFGTS,' +CR_LF+
      '  NUMCONTAFGTS, NUMCONTASALARIO, DATADESLIGAMENTO', true));
    Add('  ) F,');
    // -------------------------------------------------------------------- //
    // Endereço de Alteração
    Add('  (SELECT');
    Add('     F.IDPESSOA,');
    Add('     TO_CHAR(DECODE(E.LOGRADOURO,');
    Add('       NULL,'''',');
    Add('       RTRIM(E.LOGRADOURO) ||'' ''|| TO_CHAR(E.NUMERO) ||');
    Add('         TO_CHAR(DECODE(E.COMPLEMENTO,');
    Add('           NULL,'''',');
    Add('           '' '' || RTRIM(E.COMPLEMENTO)');
    Add('         ))');
    Add('     )) AS LOGRADOURO,');
    Add('     E.BAIRRO, E.CEP, CI.NOME AS CIDADE, ES.CODESTADO AS UF');
    Add('   FROM');
    Add('     PESSOA PF, ENDPESS E, CIDADES CI, ESTADO ES,');
    Add('     (');
    Add(MontarListaPessoas(6, '', true));
    Add('     ) F');
    Add('   WHERE');
    Add('     (F.IDPESSOA          = PF.IDPESSOA) AND');
    Add('     (PF.IDENDRESIDENCIAL = E.IDENDERECO) AND');
    Add('     (PF.IDPESSOA         = E.IDPESSOA) AND');
    Add('     (E.IDCIDADES         = CI.IDCIDADES) AND');
    Add('     (CI.IDESTADO         = ES.IDESTADO)) ENDER,');
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
    Add('         (DP.IDPESSOA         = F.IDPESSOA)) PIS,');
    // -------------------------------------------------------------------- //
    // Obter os trabalhadores que tiveram folha na competência
    Add('  (SELECT');
    Add('     H.IDPESSOA');
    Add('   FROM');
    Add('     HISTRUBSAL H, MOTIVO MO,');
    Add('     (');
    Add(MontarListaPessoas(6, '', true));
    Add('     ) F');
    Add('   WHERE');
    Add('     (MO.GRUPOMOTIVO IN (''F'',''D'')) AND');
    Add('     (H.MES           = ' +QuotedStr(FCompetencia)+ ') AND');
    Add('     (F.IDPESSOA      = H.IDPESSOA) AND');
    Add('     (MO.IDMOTIVO     = H.IDMOTIVO)');
    Add('   GROUP BY');
    Add('     H.IDPESSOA) TEM_MOVIMENTO,');

    // -------------------------------------------------------------------- //
    // Obter o último afastamento dos trabalhadores
    if (FBuscaFuncSitAtual) then
    begin
      Add('  (SELECT DISTINCT');
      Add('     H.IDPESSOA, MO.MOTIVOFGTS');
      Add('   FROM');
      Add('     FUNCIONARIO F, HSTSITFUNC H, MOTIVO MO');
      Add('   WHERE');
      Add('     (TO_CHAR(H.DATASITFUNC,''YYYY/MM'') <= ' +QuotedStr(FCompetencia)+ ') AND');
      Add('     (H.IDPESSOA     = F.IDPESSOA) AND');
      Add('     (H.DATASITFUNC  = F.DATADESLIGAMENTO) AND');
      Add('     (H.IDMOTIVOOFIC = MO.IDMOTIVO)) ULT_SITUACAO');
    end
    else
    begin
      Add('  (SELECT DISTINCT');
      Add('     H.IDPESSOA, MO.MOTIVOFGTS, H.DATASITFUNC AS DATA');
      Add('   FROM');
      Add('     HSTSITFUNC H, MOTIVO MO,');
      Add('     (SELECT');
      Add('        MAX(DATASITFUNC) AS DATASITFUNC, IDPESSOA');
      Add('      FROM');
      Add('        HSTSITFUNC');
      Add('      WHERE');
      Add('        (TO_CHAR(DATASITFUNC,''YYYY/MM'') <= ' + QuotedStr(FCompetencia)+ ')');
      Add('      GROUP BY');
      Add('        IDPESSOA) HST2,');
      Add('     (SELECT');
      Add('        MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
      Add('      FROM');
      Add('        HSTSITFUNC');
      Add('      WHERE');
      Add('        (TO_CHAR(DATASITFUNC,''YYYY/MM'') <= ' +QuotedStr(FCompetencia)+ ')');
      Add('      GROUP BY');
      Add('        IDPESSOA) HST3');
      Add('   WHERE');
      Add('     (H.DATASITFUNC   = HST2.DATASITFUNC) AND');
      Add('     (H.IDPESSOA      = HST2.IDPESSOA) AND');
      Add('     (H.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
      Add('     (H.IDPESSOA      = HST3.IDPESSOA) AND');
      Add('     (H.IDMOTIVOOFIC  = MO.IDMOTIVO)) ULT_SITUACAO');
    end;
    // -------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (F.IDCARGO            = C.IDCARGO) AND');
    Add('  (F.IDPESSOA           = PESFIS.IDPESSOA) AND');
    Add('  (F.IDPESSOA           = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA           = TEM_MOVIMENTO.IDPESSOA) AND');

    if (FGerarTomador) then
      Add('  (PF.IDGRUPO      IS NOT NULL) AND')
    else
      Add('  (PF.IDGRUPO          IS NULL) AND');

    if (FBuscaFuncSitAtual) then
      Add('  (F.IDPESSOA           = ULT_SITUACAO.IDPESSOA(+)) AND')
    else
      Add('  (F.IDPESSOA           = ULT_SITUACAO.IDPESSOA) AND');

    Add('  (F.IDPESSOA           = ENDER.IDPESSOA(+)) AND');
    Add('  (F.IDMOTIVODESLIGRAIS = MO.IDMOTIVO(+)) AND');
    Add('  (F.IDPESSOA           = CTPS.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA           = PIS.IDPESSOA(+))');
    SaveToFile(DirTempLog + '\qryPessoal.txt');
  end;
  IncProgresso('', ('Selecionando dados das Pessoas...'), 0);
  FCdsPessoal.Data := GetDataPacket(FSQL);
  IncProgresso(GetTempoDecorrido, '', 20);

  Result := not(FCdsPessoal.IsEmpty);
  if not(Result) then
    MessageInfo := CMTranslateMsg(MSG_SEM_DADOS, [CR_LF]);
end;

function TCtrlParamGFIPMagnetico.AbrirQueryTomador: boolean;
var
  sListaIdTomador: string;
begin
  if not(FGerarTomador) then
  begin
    Result := true;
    exit;
  end;

  sListaIdTomador := '';
  FCdsPessoal.First;
  while not(FCdsPessoal.EOF) do
  begin
    if (FCdsPessoal.FieldByName('IDGRUPO').asString <> '') and
       (VerificaCodigoEm(sListaIdTomador, FCdsPessoal.FieldByName('IDGRUPO').asString) <= 0) then
      InserirCodigoEm(sListaIdTomador, FCdsPessoal.FieldByName('IDGRUPO').asString);
    FCdsPessoal.Next;
  end;

  if (sListaIdTomador = '') then
  begin
    Result := true;
    exit;
  end;

  with (FSQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  PJ.IDPESSOA,');
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
    Add('  ES.CODESTADO AS UF');
    // -------------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PJ, ENDPESS E, CIDADES CI, ESTADO ES,');
    // -------------------------------------------------------------------------- //
    // CEI do Estabelecimento
    Add('  (SELECT DO.IDPESSOA, DO.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CEI:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO)) CEI,');
    // -------------------------------------------------------------------------- //
    // CNPJ do Estabelecimento
    Add('  (SELECT DO.IDPESSOA, DO.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO');
    Add('   WHERE ((TDO.SIGLADOCUMENTO = ''CGC:'') OR');
    Add('          (TDO.SIGLADOCUMENTO = ''CNPJ:'')) AND');
    Add('         (TDO.IDDOCUMENTO     = DO.IDDOCUMENTO)) CGC_CNPJ');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add(MontaLinhaSelSQL('  (PJ.IDPESSOA', sListaIdTomador, 7));
    Add('  (PJ.IDENDCOMERCIAL  = E.IDENDERECO) AND');
    Add('  (PJ.IDPESSOA        = E.IDPESSOA) AND');
    Add('  (E.IDCIDADES        = CI.IDCIDADES) AND');
    Add('  (CI.IDESTADO        = ES.IDESTADO) AND');
    Add('  (PJ.IDPESSOA        = CEI.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA        = CGC_CNPJ.IDPESSOA(+))');
    Add('ORDER BY');
    Add('  INSCRICAO');
    SaveToFile(DirTempLog + '\qryTomador.txt');
  end;
  FCdsTomador.Data := GetDataPacket(FSQL);
  Result := not(FCdsTomador.IsEmpty);
  if not(Result) then
    MessageInfo := CMTranslateMsg(MSG_SEM_DADOS_TOMADOR, [CR_LF]);

  // Valor do salário família
  with (FSQL) do
  begin
    Clear;
    if (FSEFIP_13Salario) or (FCdsTomador.IsEmpty) then
    begin
      Add('SELECT');
      Add('  0 AS IDGRUPO, 0.00 AS VALOR');
      Add('FROM');
      Add('  DUAL');
      Add('WHERE');
      Add('  (1 = 2)');
    end
    else
    begin
      Add('SELECT');
      Add('  PF.IDGRUPO,');
      Add('  SUM(TO_NUMBER(DECODE(P.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO))) AS VALOR');
      Add('FROM');
      Add('  HISTRUBSAL H, PESSOA PF, PROVDESC P,');
      // -------------------------------------------------------------------- //
      // Trabalhadores
      Add('  (');
      Add(MontarListaPessoas(3, '  IDPESSOA'));
      Add('  ) F');
      // -------------------------------------------------------------------- //
      Add('WHERE');

      if (FListaRubricaSalFam <> '') then
        Add(MontaLinhaSelSQL('  (H.CODPROVDESC',QuotedListaString(FListaRubricaSalFam,','),5))
      else
        Add('  (P.CODRUBCLT        = ''40573'') AND');

      sListaIdTomador := '';
      FCdsTomador.First;
      while not(FCdsTomador.EOF) do
      begin
        if (FCdsTomador.FieldByName('IDPESSOA').asString <> '') then
          InserirCodigoEm(sListaIdTomador, FCdsTomador.FieldByName('IDPESSOA').asString);
        FCdsTomador.Next;
      end;
      FCdsTomador.First;

      Add(MontaLinhaSelSQL('  (PF.IDGRUPO',sListaIdTomador,8));
      Add('  (H.MES              = ' +QuotedStr(FCompetencia)+ ') AND');
      Add('  (F.IDPESSOA         = H.IDPESSOA) AND');
      Add('  (F.IDPESSOA         = PF.IDPESSOA) AND');
      Add('  (H.IDRUBRICA        = P.IDPROVENTO)');
      Add('GROUP BY');
      Add('  IDGRUPO');
    end;
    SaveToFile(DirTempLog + '\qrySalFamTomador.txt');
  end;
  FCdsSalFamTomador.Data := GetDataPacket(FSQL);
end;

function TCtrlParamGFIPMagnetico.AbrirQueriesDosValores: boolean;
begin
  try
    // Valor do salário família
    with (FSQL) do
    begin
      Clear;
      if (FSEFIP_13Salario) then
      begin
        Add('SELECT');
        Add('  0 AS IDESTAB, 0.00 AS VALOR');
        Add('FROM');
        Add('  DUAL');
        Add('WHERE');
        Add('  (1 = 2)');
      end
      else
      begin
        Add('SELECT');
        Add('  F.IDESTAB,');
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

        if (FListaRubricaSalFam <> '') then
          Add(MontaLinhaSelSQL('  (H.CODPROVDESC',QuotedListaString(FListaRubricaSalFam,','),5))
        else
          Add('  (P.CODRUBCLT        = ''40573'') AND');

        Add('  (H.MES              = ' +QuotedStr(FCompetencia)+ ') AND');
        Add('  (F.IDPESSOA         = H.IDPESSOA) AND');
        Add('  (H.IDRUBRICA        = P.IDPROVENTO)');
        Add('GROUP BY');
        Add('  IDESTAB');
      end;
      SaveToFile(DirTempLog + '\qrySalFam.txt');
    end;
    IncProgresso('', ('Selecionando Valor do Salário Família...'), 0);
    FCdsSalFam.Data := GetDataPacket(FSQL);
    IncProgresso(GetTempoDecorrido, '', 8);

    // Valor do salário maternidade
    with (FSQL) do
    begin
      Clear;
      if (FSEFIP_13Salario) then
      begin
        Add('SELECT');
        Add('  0 AS IDESTAB, 0.00 AS VALOR');
        Add('FROM');
        Add('  DUAL');
        Add('WHERE');
        Add('  (1 = 2)');
      end
      else
      begin
        Add('SELECT');
        Add('  F.IDESTAB,');
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

        if (FListaRubricaSalMat <> '') then
          Add(MontaLinhaSelSQL('  (H.CODPROVDESC',QuotedListaString(FListaRubricaSalMat,','),5))
        else
          Add('  (P.CODRUBCLT        = ''40570'') AND');

        Add('  (H.MES              = ' +QuotedStr(FCompetencia)+ ') AND');
        Add('  (F.IDPESSOA         = H.IDPESSOA) AND');
        Add('  (H.IDRUBRICA        = P.IDPROVENTO)');
        Add('GROUP BY');
        Add('  IDESTAB');
      end;
      SaveToFile(DirTempLog + '\qrySalMat.txt');
    end;
    IncProgresso('', ('Selecionando Valor do Salário Maternidade...'), 0);
    FCdsSalMat.Data := GetDataPacket(FSQL);
    IncProgresso(GetTempoDecorrido, '', 5);

    // Valor da contribuição descontada do empregado referente ao 13º salário
    with (FSQL) do
    begin
      Clear;
      Add('SELECT');
      Add('  F.IDESTAB,');
      Add('  SUM(TO_NUMBER(DECODE(P.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO))) AS VALOR');
      Add('FROM');
      Add('  HISTRUBSAL H, PROVDESC P, FILIALPESSOA FP,');
      // -------------------------------------------------------------------- //
      // Trabalhadores
      Add('  (');
      Add(MontarListaPessoas(3, '  IDPESSOA, IDESTAB'));
      Add('  ) F');
      // -------------------------------------------------------------------- //
      Add('WHERE');

      if (FListaRubricaValINSS_13 <> '') then
        Add(MontaLinhaSelSQL('  (H.CODPROVDESC',QuotedListaString(FListaRubricaValINSS_13,','),5))
      else
        Add('  (P.CODRUBCLT        = ''50025'') AND');

      Add('  (H.MES              = ' +QuotedStr(FCompetencia)+ ') AND');
      Add('  (F.IDPESSOA         = H.IDPESSOA) AND');
      Add('  (H.IDRUBRICA        = P.IDPROVENTO)');
      Add('GROUP BY');
      Add('  IDESTAB');
      SaveToFile(DirTempLog + '\qryContribDescontTrab.txt');
    end;
    IncProgresso('', ('Selecionando INSS do 13º...'), 0);
    FCdsContribDescontEmpreg.Data := GetDataPacket(FSQL);
    IncProgresso(GetTempoDecorrido, '', 5);

    // Remuneração SEM 13º Salário
    with (FSQL) do
    begin
      Clear;
      if (FSEFIP_13Salario) then
      begin
        Add('SELECT');
        Add('  0 AS IDPESSOA, 0.00 AS VALOR');
        Add('FROM');
        Add('  DUAL');
        Add('WHERE');
        Add('  (1 = 2)');
      end
      else
      begin
        Add('SELECT');
        Add('  H.IDPESSOA,');
        Add('  SUM(TO_NUMBER(DECODE(P.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO))) AS VALOR');
        Add('FROM');
        Add('  HISTRUBSAL H, PROVDESC P,');
        // -------------------------------------------------------------------- //
        // Trabalhadores
        Add('  (');
        Add(MontarListaPessoas(3, '  IDPESSOA, IDESTAB, IDCATEMPRGRE'));
        Add('  ) F');
        // -------------------------------------------------------------------- //
        Add('WHERE');

        if (FListaRubricaSalSem13 <> '') then
          Add(MontaLinhaSelSQL('  (H.CODPROVDESC',QuotedListaString(FListaRubricaSalSem13,','),5))
        else
        begin
          Add('  (');
          Add('    ((NVL(F.IDCATEMPRGRE,1) = 11) AND');
          Add('     (P.CODRUBCLT     = ''40003'')) OR');
          Add('    (P.CODRUBCLT     IN (''60695'',''60696'',''60697'',''60698''))');
          Add('  ) AND');
        end;

        Add('  (H.MES              = ' +QuotedStr(FCompetencia)+ ') AND');
        Add('  (F.IDPESSOA         = H.IDPESSOA) AND');
        Add('  (H.IDRUBRICA        = P.IDPROVENTO)');
        Add('GROUP BY');
        Add('  H.IDPESSOA');
      end;  
      SaveToFile(DirTempLog + '\qryRemSem13.txt');
    end;
    IncProgresso('', ('Selecionando Remuneração SEM 13º Salário...'), 0);
    FCdsRemSem13.Data := GetDataPacket(FSQL);
    IncProgresso(GetTempoDecorrido, '', 5);

    // 13º Salário (Base de Cálculo do FGTS)
    with (FSQL) do
    begin
      Clear;
      if (FSEFIP_13Salario) then
      begin
        Add('SELECT');
        Add('  0 AS IDPESSOA, 0.00 AS VALOR');
        Add('FROM');
        Add('  DUAL');
        Add('WHERE');
        Add('  (1 = 2)');
      end
      else
      begin
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

        if (FListaRubrica13Salario <> '') then
          Add(MontaLinhaSelSQL('  (H.CODPROVDESC',QuotedListaString(FListaRubrica13Salario,','),3))
        else
          Add('  (P.CODRUBCLT        = ''62022'') AND');

        Add('  (H.MES              = ' +QuotedStr(FCompetencia)+ ') AND');
        Add('  (F.IDPESSOA         = H.IDPESSOA) AND');
        Add('  (H.IDRUBRICA        = P.IDPROVENTO)');
        Add('GROUP BY');
        Add('  H.IDPESSOA');
      end;  
      SaveToFile(DirTempLog + '\qryRemSobre13.txt');
    end;
    IncProgresso('', ('Selecionando Remuneração COM 13º Salário...'), 0);
    FCdsRemSobre13.Data := GetDataPacket(FSQL);
    IncProgresso(GetTempoDecorrido, '', 5);

    // Valor retido segurado
    with (FSQL) do
    begin
      Clear;
      Add('SELECT');
      Add('  H.IDPESSOA,');
      Add('  SUM(TO_NUMBER(DECODE(P.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO))) AS VALOR');
      Add('FROM');
  //    Add('  HISTRUBSAL H, HSTSITFUNC HS, PROVDESC P, FUNCIONARIO F, FILIALPESSOA FP, MOTIVO MO');
      Add('  HISTRUBSAL H, PROVDESC P,');
      // -------------------------------------------------------------------- //
      // Trabalhadores
      Add('  (');
      Add(MontarListaPessoas(3, '  IDPESSOA, IDESTAB'));
      Add('  ) F');
      // -------------------------------------------------------------------- //
      Add('WHERE');

      if (FListaRubricaValRetSegurado <> '') then
        Add(MontaLinhaSelSQL('  (H.CODPROVDESC',QuotedListaString(FListaRubricaValRetSegurado,','),5))
      else
  //      Add('  (P.CODRUBCLT       = ''50025'') AND'); // 60423 era a que estava antes
        Add('  (P.CODRUBCLT       = ''50035'') AND'); // 60423 era a que estava antes

  //    Add('  (MO.MOTIVOFGTS     IN (''Q1'',''Z1'')) AND');
  //    Add('  (TO_CHAR(HS.DATASITFUNC,''YYYY/MM'') = ' +QuotedStr(FCompetencia)+ ') AND');
  //    Add('  (HS.IDMOTIVOOFIC    = MO.IDMOTIVO) AND');
  //    Add('  (F.IDPESSOA         = HS.IDPESSOA) AND');
      Add('  (H.MES              = ' +QuotedStr(FCompetencia)+ ') AND');
      Add('  (F.IDPESSOA         = H.IDPESSOA) AND');
      Add('  (H.IDRUBRICA        = P.IDPROVENTO)');
      Add('GROUP BY');
      Add('  H.IDPESSOA');
      SaveToFile(DirTempLog + '\qryValorRetidoSegurado.txt');
    end;
    IncProgresso('', ('Selecionando Valor Retido Segurado...'), 0);
    FCdsValorRetidoSegurado.Data := GetDataPacket(FSQL);
    IncProgresso(GetTempoDecorrido, '', 5);

    // Remuneração para cálculo da contribuição previdenciária
    with (FSQL) do
    begin
      Clear;
      if (FSEFIP_13Salario) then
      begin
        Add('SELECT');
        Add('  0 AS IDPESSOA, 0.00 AS VALOR');
        Add('FROM');
        Add('  DUAL');
        Add('WHERE');
        Add('  (1 = 2)');
      end
      else
      begin
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

        if (FListaRubricaBaseINSS_Esp <> '') then
          Add(MontaLinhaSelSQL('  (H.CODPROVDESC',QuotedListaString(FListaRubricaBaseINSS_Esp,','),5))
        else
          Add('  (P.CODRUBCLT       IN (''60696'',''60697'')) AND');

        Add('  (H.MES              = ' +QuotedStr(FCompetencia)+ ') AND');
        Add('  (F.IDPESSOA         = H.IDPESSOA) AND');
        Add('  (H.IDRUBRICA        = P.IDPROVENTO)');
        Add('GROUP BY');
        Add('  H.IDPESSOA');
      end;
      SaveToFile(DirTempLog + '\qryBaseContribPrevAfast.txt');
    end;
    IncProgresso('',
      ('Selecionando Base de Cálculo da Contribuição Previdenciária...'), 0);
    FCdsBaseContribPrevAfast.Data := GetDataPacket(FSQL);
    IncProgresso(GetTempoDecorrido, '', 5);

    // Base de cálculo 13º Previdência Social
    // Somente gerar este valor para o caso da pessoa estar demitida ou ser 13º
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
      Add(MontarListaPessoas(3));
      Add('  ) F');
      // -------------------------------------------------------------------- //
      Add('WHERE');
      if (FListaRubricaBaseINSS_13Movimento <> '') then
        Add(MontaLinhaSelSQL('  (H.CODPROVDESC',QuotedListaString(FListaRubricaBaseINSS_13Movimento,','),5))
      else
        Add('  (P.CODRUBCLT        = ''62016'') AND');

      Add('  (H.MES              = ' +QuotedStr(FCompetencia)+ ') AND');
      Add('  (F.IDPESSOA         = H.IDPESSOA) AND');
      Add('  (H.IDRUBRICA        = P.IDPROVENTO)');
      Add('GROUP BY');
      Add('  H.IDPESSOA');
      SaveToFile(DirTempLog + '\qryBase13PrevSoc.txt');
    end;
    IncProgresso('', ('Selecionando Base de Cálculo 13º Previdência Social...'), 0);
    FCdsBase13PrevSoc.Data := GetDataPacket(FSQL);
    IncProgresso(GetTempoDecorrido, '', 5);

    with (FSQL) do
    begin
      Clear;
      // Base de cálculo 13º Previdência Social referente ao recolhimento em GPS
      // Somente gerar este valor para o caso da pessoas estar demitida ou ser 13º
      Add('SELECT');
      Add('  H.IDPESSOA,');
      Add('  SUM(DECODE(P.FLGDESCONTO,1,-H.VALORPROVENTO,H.VALORPROVENTO)) AS VALOR');
      Add('FROM');
      Add('  HISTRUBSAL H, PROVDESC P,');
      // -------------------------------------------------------------------- //
      // Trabalhadores
      Add('  (');
      Add(MontarListaPessoas(3));
      Add('  ) F');
      // -------------------------------------------------------------------- //
      Add('WHERE');

      if (FListaRubricaBaseINSS_13 <> '') then
        Add(MontaLinhaSelSQL('  (H.CODPROVDESC',QuotedListaString(FListaRubricaBaseINSS_13,','),5))
      else
        Add('  (P.CODRUBCLT        = ''60421'') AND');

      Add('  (H.MES              = ' +QuotedStr(FCompetencia)+ ') AND');
      Add('  (F.IDPESSOA         = H.IDPESSOA) AND');
      Add('  (H.IDRUBRICA        = P.IDPROVENTO)');
      Add('GROUP BY');
      Add('  H.IDPESSOA');
      SaveToFile(DirTempLog + '\qryBaseCalc13_GPS.txt');
    end;
    IncProgresso('',
      ('Selecionando Base de Cálculo 13º Previdência Social - GPS...'), 0);
    FCdsBaseCalc13_GPS.Data := GetDataPacket(FSQL);
    IncProgresso(GetTempoDecorrido, '', 5);
    Result := true;
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
end;

function TCtrlParamGFIPMagnetico.AbrirQueryAltEndereco: boolean;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  HE.IDPESSOA,');
    Add('  TO_CHAR(DECODE(HE.LOGRADOURO,');
    Add('    NULL,'''',');
    Add('    RTRIM(HE.LOGRADOURO) ||'' ''|| TO_CHAR(HE.NUMERO) ||');
    Add('      TO_CHAR(DECODE(HE.COMPLEMENTO,');
    Add('        NULL,'''',');
    Add('        '' '' || RTRIM(HE.COMPLEMENTO)');
    Add('      ))');
    Add('  )) AS ENDERECO,');
    Add('  HE.BAIRRO,');
    Add('  HE.CEP,');
    Add('  RTRIM(CI.NOME) AS CIDADE,');
    Add('  ES.CODESTADO AS UF');
    Add('FROM');
    Add('  HSTENDPESS HE, CIDADES CI, ESTADO ES');
    Add('WHERE');
    Add('  (TO_CHAR(HE.DATAALT,''YYYY/MM'') = ' +QuotedStr(FCompetencia)+ ') AND');
    Add('  (HE.IDCIDADES = CI.IDCIDADES) AND');
    Add('  (CI.IDESTADO  = ES.IDESTADO)');
    SaveToFile(DirTempLog + '\qryAltEndereco.txt');
  end;
  IncProgresso('', ('Selecionando dados do Histórico de Alteração de Endereços...'), 0);
  FCdsAltEndereco.Data := GetDataPacket(FSQL);
  IncProgresso(GetTempoDecorrido, '', 3);

  Result := not(FCdsAltEndereco.IsEmpty);
end;

// *************************************************************************************
// Parâmetros: sTipo          - A, AN, N, V, D (Vide Manual da SEFIP, pág.13)
//             sDado          - Dado a ser validado
//             iTamanho       - Tamanho de retorno da string validada
// *************************************************************************************
function TCtrlParamGFIPMagnetico.ValidarCampo(Tipo: char; Dado: string; Tamanho: word;
  Ch: char): string;
var
  sTemp: string;
  c, wMax: word;
begin
  Result :=('ERRO VALIDA GFIP');
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

function TCtrlParamGFIPMagnetico.Val_CEP(CEP: string): string;
begin
  if (CEP <> '20000000') and (CEP <> '30000000') and (CEP <> '70000000') and
     (CEP <> '80000000') then
    Result := ValidarCampo('N', CEP, 8,' ')
  else
    Result := '        ';
end;

function TCtrlParamGFIPMagnetico.Val_IndiRecFGTS(DtPag,DtComp: TDate): string;
begin
  if (FSEFIP_13Salario) or (FCodRecolhimento = 211) then
    Result := ' '  // BRANCO
  else
  if (Comparar(FCodRecolhimento,[145,307,317,327,337,345,640]).Achou) or (DtPag > DtComp) then
    Result := '2'  // GFIP em atraso
  else
    Result := '1'; // GFIP no prazo
end;

function TCtrlParamGFIPMagnetico.Val_DtRecFGTS(DtVenc,DtPag: TDateTime): string;
begin
  if (FIndRecFGTS = '2') and (DtVenc < DtPag) then
    Result := TiraBarra(DateToStr(DtPag))
  else
    Result := '        ';
end;

function TCtrlParamGFIPMagnetico.Val_IndiRecPrevSoc(DtPag,Campo: TDateTime): char;
begin
  if (FCompetencia <= '1998/10') or
     (Comparar(FCodRecolhimento, [145,317,337,345,640,660]).Achou) or (Campo = 0) then
    Result := '3'    // Não gerou GPS
  else
  begin
    if (DtPag <= Campo) then
      Result := '1'  // no prazo
    else
      Result := '2'; // em atraso
  end;
end;

function TCtrlParamGFIPMagnetico.Val_DtRecPrevSoc(Campo: string): string;
begin
  if (FIndRecPrevSoc <> '2') then
    Result := '        '
  else
    Result := TiraBarra(Campo);
end;

function TCtrlParamGFIPMagnetico.Val_IndiAlteracao(Altera: char): char;
begin
  if (FSEFIP_13Salario) or (Altera = 'N') then
    Result := 'N'
  else
    Result := 'S';
end;

function TCtrlParamGFIPMagnetico.Val_AliqSAT(Campo: real): string;
{-->}function ConverteSAT(Aliq: real): string;
     var
       sAux: string;
       byPos: byte;
     begin
       sAux := Float2String(Aliq);
       byPos := Pos ('.', sAux);
       Result := sAux[1] + Copy(sAux, byPos+1, 1);
{-->}end;
begin
  if (FFPAS = '604') or (FFPAS = '647') or (FFPAS = '825') or
     (FFPAS = '833') or (FFPAS = '868') or (FOptanteSimples in [2,3]) then
    Result := '00'
  else
  if (Campo = 0) or (FCompetencia = '1998/10') or
     (Comparar(FCodRecolhimento, [604,647,825,833,868]).Achou) then
    Result := '  '
  else
    Result := ConverteSAT(Campo);
end;

function TCtrlParamGFIPMagnetico.Val_CodCentral(TipInscr, Campo: string): string;
begin
  // Pode ter os valores:
  // 0 -> não centralizada
  // 1 -> centralizadora
  // 2 -> centralizada
  if (Comparar(FCodRecolhimento, [130,135,150,155,211,317,337,608]).Achou) or
     (TipInscr = '2') or (Trim(Campo) = '') then
    Result := '0'
  else // Preenche com o código correto
    Result := Copy(Campo,1,1);
end;

function TCtrlParamGFIPMagnetico.Val_FPAS(Campo: string): string;
begin
  if (Campo = '620') or (Campo = '744') or (Campo = '779') then
    Result := '   '
  else
    Result := ValidarCampo('N', Campo, 3, '0');
end;

function TCtrlParamGFIPMagnetico.Val_CodTerceiros(Campo: string): string;
begin
  if not(Comparar(FCodRecolhimento, [145,307,317,327,337,345,640,660]).Achou) and
     not(FOptanteSimples in [2,3]) and (FCompetencia >= '1998/10') then
    Result := ValidarCampo('N', Campo, 4, '0')
  else
    Result := '    ';
end;

function TCtrlParamGFIPMagnetico.Val_CodPagGPS10(Campo: string): string;
begin
  if (Comparar(FCodRecolhimento, [115,150,211,650]).Achou) then
    Result := ValidarCampo('N', Campo, 4,' ')
  else
    Result := '    ';
end;

function TCtrlParamGFIPMagnetico.Val_CodPagGPS20(Campo: string): string;
begin
  if (Comparar(FCodRecolhimento, [130,135,155,608]).Achou) then
    Result := ValidarCampo('N', Campo, 4,' ')
  else
    Result := '    ';
end;

function TCtrlParamGFIPMagnetico.Val_IsencFilant(Campo: double): string;
{-->}function ConverteIsencFilant(Aliq: real): string;
     var
       sAux: string;
       byPos: byte;
     begin
       sAux := Float2String(Aliq);
       byPos := Pos('.', sAux);
       if (byPos > 4) then
         Result := Copy(sAux,1,3) + Copy(sAux,byPos+1,2)
       else
         Result := Alinha(Copy(sAux,1,byPos-1), 3, 'D', '0') + Copy(sAux,byPos+1,2);
{-->}end;
begin
  if (FFPAS = '639') and (FCompetencia >= '1999/04') then
    Result := ConverteIsencFilant(Campo)
  else
    Result := '     ';
end;

function TCtrlParamGFIPMagnetico.Val_SalFamilia10(Campo: double): string;
begin
  if (FSEFIP_13Salario) or (FCompetencia <= '1998/10') or
     (Comparar(FCodRecolhimento, [145,327,345,640,650,660]).Achou) then
    Result := '000000000000000'
  else
    Result := ValidarCampo('N', FormatFloat('#########0.00', Campo), 15, '0');
end;

function TCtrlParamGFIPMagnetico.Val_SalFamilia20(Campo: double): string;
begin
  if (FSEFIP_13Salario) or (FCompetencia <= '1998/10') or
     not(Comparar(FCodRecolhimento, [115,211]).Achou) then
    Result := '000000000000000'
  else
    Result := ValidarCampo('N', FormatFloat('#########0.00', Campo), 15, '0');
end;

function TCtrlParamGFIPMagnetico.Val_SalMaternidade(Campo: double): string;
begin        
  if (FSEFIP_13Salario) or (FCompetencia <= '1998/10') or
     ((FCompetencia >= '2000/06') and (FCompetencia <= '2003/08')) or
     (Comparar(FCodRecolhimento, [130,135,145,211,307,317,327,337,345,640,650,660]).Achou) then
    Result := '000000000000000'
  else
    Result := ValidarCampo('N', FormatFloat('#########0.00', Campo), 15, '0');
end;

{function TCtrlParamGFIPMagnetico.Val_ContDescEmpregado10(Campo: double): string;
begin
  if (Comparar(FCodRecolhimento, [115,307,327,903,905]).Achou) and
     (Copy(FDataComp,6,2) = '12') then
    Result := ValidarCampo('N', FormatFloat('#########0.00', Campo), 15, '0')
  else
    Result := '000000000000000';
end;

function TCtrlParamGFIPMagnetico.Val_ValorDevPrev_Neg_Pos10(Campo: double): string;
begin
  if not(Comparar(FCodRecolhimento, [115,307,327,903,905]).Achou) and
     (Copy(FDataComp,6,2) = '12') then
  begin
    if (Campo >= 0) then
      Result := '0'
    else
      Result := '1';
  end
  else
    Result := '0';
end;

function TCtrlParamGFIPMagnetico.Val_ValorDevPrev10(Campo: double): string;
begin
  if not(Comparar(FCodRecolhimento, [145,345,640,660]).Achou) and
     (Copy(FDataComp,6,2) = '12') then
    Result := ValidarCampo('N', FormatFloat('#########0.00', Campo), 14, '0')
  else
    Result := '00000000000000';
end;}

function TCtrlParamGFIPMagnetico.Val_MatrEmpregado(Campo: string): string;
begin
  if (FCdsPessoal.FieldByName('CATEGORIA').asInteger in [6,13..16]) then
    Result := '           '
  else
    Result := ValidarCampo('N', Campo, 11, ' ');
end;

function TCtrlParamGFIPMagnetico.Val_CTPS(Ini,Tam: byte; Campo: string): string;
var
  c: byte;
  sAux: string;
begin
  if (FCdsPessoal.FieldByName('CATEGORIA').asInteger in [1,3,4,6,7,26]) then
  begin
    for c:=1 to length(Campo) do
      if (Campo[c] in ['0'..'9']) then
        sAux := sAux + Campo[c];
    Result := Replicate ('0', Abs(Tam-Length(Copy(sAux,Ini,Tam)))) + Copy(sAux,Ini,Tam);
  end
  else
    Result := Replicate(' ', Tam);
end;

function TCtrlParamGFIPMagnetico.Val_DataOpcao(Campo: TDate): string;
begin
  if (FCdsPessoal.FieldByName('CATEGORIA').asInteger in [1,3,4,5,6,7]) and
     (Campo >= StrDate(FDataAdmissao)) and (FCodRecolhimento <> 640) then
    Result := TiraBarra(DateTimeToStr(Campo))
  else
    Result := Replicate(' ', 8);
end;

function TCtrlParamGFIPMagnetico.Val_DataNascimento(Campo: TDate): string;
begin
  if (FCdsPessoal.FieldByName('CATEGORIA').asInteger in [1..7,12,19..21,26]) and
     (Campo < StrDate(FDataAdmissao)) and (Campo >= StrToDate('01/01/1900')) then
    Result := TiraBarra(DateToStr(Campo))
  else
    Result := Replicate(' ', 8);
end;

function TCtrlParamGFIPMagnetico.Val_RemSem13(Campo: double): string;
begin
  if (FSEFIP_13Salario) then
    Result := '000000000000000'
  else
    Result := ValidarCampo('N', FormatFloat('#########0.00', Campo), 15, '0');
end;

function TCtrlParamGFIPMagnetico.Val_RemSobre13(Campo: double): string;
begin
  if (FCdsPessoal.FieldByName('CATEGORIA').asInteger in [1..7,11,12,19..21,26]) and
     not(FSEFIP_13Salario) then
    Result := ValidarCampo('N', FormatFloat('#########0.00', Campo), 15, '0')
  else
    Result := '000000000000000';
end;

function TCtrlParamGFIPMagnetico.Val_Ocorrencia(Campo: string): string;
begin
  if (
       (FCdsPessoal.FieldByName('CATEGORIA').asInteger in [1,3,4,6,7,12,19,20,21]) or
       (
         (FCdsPessoal.FieldByName('CATEGORIA').asInteger in [5,11,13,15,17,18,22,23,24,25]) and
         (FCompetencia >= '2003/04')
       ) or
       (
         (FCdsPessoal.FieldByName('CATEGORIA').asInteger = 2) and
         (FCompetencia >= '1999/04')
       )
     ) and
     (Campo <> '-1') and (Campo <> '0') then
    Result := ValidarCampo('N', Campo, 2, '0')
  else
    Result := '  ';
end;

function TCtrlParamGFIPMagnetico.Val_BaseContribPrevAfast(Campo: double): string;
begin
  if (FCdsPessoal.FieldByName('CATEGORIA').asInteger in [1,4,6,7,11,12,19,20,21]) and
     (StringEm(FCdsPessoal.FieldByName('COD_MOV_ATUAL').asString, ['O1','O2','R','Z2','Z3','Z4']) > -1) and
     not(FSEFIP_13Salario) and (FCompetencia >= '1998/10') and (FRegitroAltTrab <> '') then
    Result := ValidarCampo('N', FormatFloat('#########0.00', Campo), 15, '0')
  else
    Result := '000000000000000';
end;

function TCtrlParamGFIPMagnetico.Val_BaseCalc13(Campo: double): string;
begin
  if (FCdsPessoal.FieldByName('CATEGORIA').asInteger in [1,2,4,6,7,12,19,20,21,26]) and
     ((StrToInt(Copy(FDataComp,6,2)) in [12,13]) or
      (FCdsPessoal.FieldByName('TIPOSIT').asString = 'D') and (GetNumDiasTrabAno >= 15)) then
  begin
    // Caso a pessoa esteja sendo demitida e não recebeu 13º, gravar 0,01 pois o programa
    // SEFIP não reconheçe esta possibilidade.
    if (Campo = 0) and (FCdsPessoal.FieldByName('TIPOSIT').asString = 'D') then
      Result := ValidarCampo('N', FormatFloat('#########0.00', 0.01), 15, '0')
    else
      Result := ValidarCampo('N', FormatFloat('#########0.00', Campo), 15, '0');
  end
  else
    Result := '000000000000000';
end;

function TCtrlParamGFIPMagnetico.Val_BaseCalc13_GPS(Campo: double): string;
begin
  if (Copy(FDataComp,6,2) = '12') and
     (FCdsPessoal.FieldByName('CATEGORIA').asInteger in [1,4,6,7,12,19,20,21,26]) then
    Result := ValidarCampo('N', FormatFloat('#########0.00', Campo), 15, '0')
  else
    Result := '000000000000000';
end;

function TCtrlParamGFIPMagnetico.Val_ModalidadeArquivo: string;
begin
  // Pode ter os valores:
  //   BRANCO -> Recolhimento ao FGTS e Declaração à Previdência
  //   1      -> Declaração ao FGTS e à Previdência
  //   7      -> Retificação de Recolhimento ao FGTS e à Previdência
  //   8      -> Retificação de Declaração ao FGTS e à Previdência
  //   9      -> Confirmação Informações anteriores – Rec/Decl ao FGTS e Decl à Previdência
  if (FSEFIP_13Salario) then
    Result := '1'
  else
  begin
    case (FOpcaoModalidade) of
      2 :  Result := '1';
      3 :  Result := '7';
      4 :  Result := '8';
      5 :  Result := '9';
      else Result := ' ';
    end;
  end;
end;

function TCtrlParamGFIPMagnetico.Val_DtAdmissao(Campo: TDate): string;
begin
  Result := '        ';
  if (FCdsPessoal.FieldByName('CATEGORIA').asInteger in [1,3,4,5,6,7,11,12,19,20,21]) and
     (Campo <= StrToDate(FDataCompetencia)) then
    case (FCdsPessoal.FieldByName('CATEGORIA').asInteger) of
      4 : if (Campo >= StrToDate('22/01/1998')) then
            Result := DateToStr(Campo);
      7 : if (Campo >= StrToDate('20/12/2000')) then
            Result := DateToStr(Campo);
      else Result := DateToStr(Campo);
    end;
end;

function TCtrlParamGFIPMagnetico.GerarRegistro_AltEndereco: boolean;
begin
  try
    if (AbrirQueryAltEndereco) then
      raise Exception.Create(MessageInfo);
      
    FCdsPessoal.First;
    repeat
      if not(GerarRegistroPessoa) then
      begin
        FCdsPessoal.Next;
        Continue;
      end;

      FCdsAltEndereco.Filter := 'IDPESSOA = ' +FCdsPessoal.FieldByName('IDPESSOA').asString;
      if not(FCdsAltEndereco.IsEmpty) then
      begin
        // 6-Data de Admissão
        FDataAdmissao := Val_DtAdmissao(FCdsPessoal.FieldByName('DATAADMISSAO').asDateTime);

        // Alteração cadastral do trabalhador
        // FArq.Add(GerarRegistro13);
        // Inclusão/Alteração do endereço do trabalhador
        FArq.Add(GerarRegistro14);
      end;

      FCdsPessoal.Next;
    until (FCdsPessoal.EOF);
    FCdsPessoal.First;

    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlParamGFIPMagnetico.GerarRegistro00: string;
begin
  // 17-Indicador de recolhimento do FGTS
  FIndRecFGTS := Val_IndiRecFGTS(StrToDate(FDataPag), StrToDate(FDataVenc));

  // 20-Indicador de recolhimento Prev. Social
  FIndRecPrevSoc := Val_IndiRecPrevSoc(FCdsGPS.FieldByName('DATAVENCGRPS').asDateTime,
    FCdsGPS.FieldByName('DATAFIMGRPS').asDateTime);

  Result :=
    // 01-Tipo do registro
    '00'+
    // 02-Brancos
    Replicate(' ',51)+
    // 03-Tipo de Remessa
    '1'+
    // 04-Tipo de inscrição-responsável (1->CNPJ; 2->CEI; 3->CPF)
    IFF(FIdentificadorDocCPF,
      ValidarCampo('N', FCdsResp.FieldByName('TIPO_INSCRICAO').asString, 1,' '),
      ValidarCampo('N', FCdsEstab.FieldByName('TIPO_INSCRICAO').asString, 1,' '))+
    // 05-Inscrição do responsável
    IFF(FIdentificadorDocCPF,
      ValidarCampo('N', FCdsResp.FieldByName('INSCRICAO').asString, 14,' '),
      ValidarCampo('N', FCdsEstab.FieldByName('INSCRICAO').asString, 14,' '))+
    // 06-Nome do responsável (Razão social)
    ValidarCampo('*', FCdsEstab.FieldByName('RAZAOSOCIAL').asString, 30,' ')+
    // 07-Nome da pessoa de contato
    ValidarCampo('A', FCdsResp.FieldByName('NOME').asString, 20,' ')+
    // 08-RUA = Logradouro + Rua + nº + andar + apartamento
    ValidarCampo('*', FCdsEstab.FieldByName('ENDERECO').asString, 50,' ')+
    // 09-Bairro
    ValidarCampo('*', FCdsEstab.FieldByName('BAIRRO').asString, 20,' ')+
    // 10-Cep
    Val_CEP(FCdsEstab.FieldByName('CEP').asString)+
    // 11-Cidade
    ValidarCampo('*', FCdsEstab.FieldByName('CIDADE').asString, 20,' ')+
    // 12-UF
    ValidarCampo('A', FCdsEstab.FieldByName('UF').asString, 2,' ')+
    // 13-Telefone de contato (DDD)
    ValidarCampo('N', FCdsEstab.FieldByName('DDD').asString, 3,' ')+
    // 13-Telefone de contato (Número)
    ValidarCampo('N', FCdsEstab.FieldByName('TELEFONE').asString, 9,' ')+
    // 14-Endereço INTERNET de contato
    Alinha(FCdsResp.FieldByName('EMAIL').asString, 60, 'E', ' ')+
    // 15-Data da competência
    TiraBarra(FDataComp)+
    // 16-Código de recolhimento
    IntToStr(FCodRecolhimento)+
    // 17-Indicador de recolhimento do FGTS
    FIndRecFGTS+
    // 18-Modalidade do arquivo
    Val_ModalidadeArquivo+
    // 19-Data de recolhimento do FGTS
    Val_DtRecFGTS(StrToDate(FDataVenc), StrToDate(FDataPag))+
    // 20-Indicador de recolhimento Prev. Social
    FIndRecPrevSoc+
    // 21-Data de recolhimento Prev. Social
    Val_DtRecPrevSoc(FCdsGPS.FieldByName('DATAFIMGRPS').asString)+
    // 22-Indice de recolhimento em atraso da Prev. Social
    Replicate(' ',7)+ // EM BRANCO
    // 23-Tipo de Inscrição - Fornecedor Folha de Pagmento
    TIPO_INSCR_FORN_FOLHAPAG+
    // 24-Inscrição do Fornecedor - Folha de Pagamento
    INSCR_FORN_FOLHAPAG+
    // 25-Brancos
    Replicate(' ',18)+
    // 26-Final de linha
    '*';
end;

function TCtrlParamGFIPMagnetico.GerarRegistro10: string;
begin
  Result :=
    // 01-Tipo do registro
    '10'+
    // 02-Tipo de inscrição empresa (1->CNPJ; 2->CEI)
    ValidarCampo('N', FCdsEstab.FieldByName('TIPO_INSCRICAO').asString, 1,' ')+
    // 03-Inscrição do empresa
    ValidarCampo('N', FCdsEstab.FieldByName('INSCRICAO').asString, 14,' ')+
    // 04-Zeros
    Replicate('0',36)+
    // 05-Razão social
    ValidarCampo('*', FCdsEstab.FieldByName('RAZAOSOCIAL').asString, 40,' ')+
    // 06-RUA = Logradouro + Rua + nº + andar + apartamento
    ValidarCampo('*', FCdsEstab.FieldByName('ENDERECO').asString, 50,' ')+
    // 07-Bairro
    ValidarCampo('*', FCdsEstab.FieldByName('BAIRRO').asString, 20,' ')+
    // 08-Cep
    Val_CEP(FCdsEstab.FieldByName('CEP').asString)+
    // 09-Cidade
    ValidarCampo('*', FCdsEstab.FieldByName('CIDADE').asString, 20,' ')+
    // 10-UF
    ValidarCampo('A', FCdsEstab.FieldByName('UF').asString, 2,' ')+
    // 11-Contato Telefone (DDD)
    ValidarCampo('N', FCdsEstab.FieldByName('DDD').asString, 3,'0')+
    // 11-Contato Telefone (Número)
    ValidarCampo('N', FCdsEstab.FieldByName('TELEFONE').asString, 9,'0')+
    // 12-Indicador de alteração de endereço
    Val_IndiAlteracao('N')+ // FALTA FAZER
    // 13-CNAE
    Alinha(FCdsEstab.FieldByName('CNAE').asString,7,'D','0')+
    // 14-Indicador de alteração CNAE
    Val_IndiAlteracao('N')+ // FALTA FAZER
    // 15-Alíquota SAT
    Val_AliqSAT(FCdsGPS.FieldByName('SEGACIDTRABALHO').asFloat)+
    // 16-Código de centralização
    Val_CodCentral(FCdsEstab.FieldByName('TIPO_INSCRICAO').asString,
                   FCdsEstab.FieldByName('COD_CENTRALIZACAO').asString)+
    // 17-SIMPLES
    IntToStr(FOptanteSimples)+
    // 18-FPAS
    FFPAS+
    // 19-Código de terceiros
    Val_CodTerceiros(FCdsEstab.FieldByName('COD_TERCEIROS').asString)+
    // 20-Código de Pagamento GPS
    Val_CodPagGPS10(FCdsGPS.FieldByName('CODIGOPAG').asString)+
    // 21-Percentual de Inseção de Filantropia
    Val_IsencFilant(FCdsEstab.FieldByName('PERC_ISENC_FILANT').asFloat)+
    // 22-Salário Família
    Val_SalFamilia10(GetValorAtual(FCdsSalFam))+
    // 23-Salário Maternidade
    Val_SalMaternidade(GetValorAtual(FCdsSalMat))+
    // 24-Contrib. Desc. Trabalhador Referente à Competência 13
    //Val_ContDescEmpregado10(GetValorAtual(FCdsContribDescontEmpreg))+
    Replicate('0', 15)+
    // 25-Indicador de valor negativo ou imposto
    //Val_ValorDevPrev_Neg_Pos10(FCdsGPS.FieldByName('TOTAL').asFloat)+
    Replicate('0', 1)+
    // 26-Valor devido à Prev. Soc. referente à Com. 13
    //Val_ValorDevPrev10(FCdsGPS.FieldByName('TOTAL').asFloat)+
    Replicate('0', 14)+
    // 27-Banco para débito em conta corrente. (IMPLEMENTAÇÃO FUTURA)
    Replicate(' ', 3)+
    // 28-Agência para débito em conta corrente. (IMPLEMENTAÇÃO FUTURA)
    Replicate(' ', 4)+
    // 29-Conta para débito em conta corrente. (IMPLEMENTAÇÃO FUTURA)
    Replicate(' ', 9)+
    // 30-(IMPLEMENTAÇÃO FUTURA)
    Replicate('0', 45)+
    // 31-Brancos
    Replicate(' ', 4)+
    // 32-Final de linha
    '*';
end;

{function TCtrlParamGFIPMagnetico.GerarRegistro13: string;
begin
  Result := '';
  if (FCdsPessoal.FieldByName('CATEGORIA').asInteger in [1..7]) and not(FSEFIP_13Salario) and
     (Comparar(FCodRecolhimento, [130,135,150,155,317,337,608]).Achou) then
  begin
    qryAltCad.Close;
    qryAltCad.ParamByName('IDPESSOA').asString := FCdsPessoal.FieldByName('IDPESSOA').asString;
    qryAltCad.ParamByName('MES').asString := speAno.Text +'/'+ PoeZero(cmbMes.ItemIndex + 1);
    qryAltCad.Open;
    while not(qryAltCad.EOF) do
    begin
      // Gravo o registro no arquivo
      Write(fGFIP,
        // 01-Tipo do registro
        '13'+
        // 02-Tipo de inscrição (1->CNPJ; 2->CEI)
        ValidarCampo('N', FCdsEstab.FieldByName('TIPO_INSCRICAO').asString, 1, ' ')+
        // 03-Inscrição da Empresa
        ValidarCampo('N', FCdsEstab.FieldByName('INSCRICAO').asString, 14, ' ')+
        // 04-Zeros
        Replicate('0',36)+
        // 05-PIS/PASEP/CI
        ValidarCampo('N', FCdsPessoal.FieldByName('PIS').asString, 11, ' ')+
        // 06-Data de admissão
        ValidarCampo('N', FDataAdmissao, 8, ' ')+
        // 07-Categoria do trabalhador
        ValidarCampo('N', FCdsPessoal.FieldByName('CATEGORIA').asString, 2, '0')+
        // 08-Matrícula do trabalhador
        ValidarCampo('N', FCdsPessoal.FieldByName('MATRICULA').asString, 11, ' ')+
        // 09-Número da CTPS
        Val_CTPS(1, 7, Trim(FCdsPessoal.FieldByName('CTPS').asString))+
        // 10-Série da CTPS
        Val_CTPS(8, 5, Trim(FCdsPessoal.FieldByName('CTPS').asString))+
        // 11-Nome do trabalhador
        ValidarCampo('A',FCdsPessoal.FieldByName('NOME').asString, 70, ' ')+
        // 12-Código empresa CAIXA // FALTA FAZER
        '              '+
        // 13-Código Trabalhador CAIXA
        ValidarCampo('N',FCdsPessoal.FieldByName('NUMCONTAFGTS').asString, 11, '0')+
        // 14-Código de alteração cadastral
        ValidarCampo('N',qryAltCad.FieldByName('CODALTERACAO').asString, 3, '0')+
        // 15-Novo conteúdo do campo
        ValidarCampo('*',qryAltCad.FieldByName('ALTERACAO').asString, 70, ' ')+
        // 16-Brancos
        Replicate(' ',94)+
        // 17-Final de linha
        '*'+CR_LF);
      qryAltCad.Next;
    end;
  end;
end;}

function TCtrlParamGFIPMagnetico.GerarRegistro14: string;
begin
  if not(FCdsPessoal.FieldByName('ENDERECO').IsNull) and not(FSEFIP_13Salario) and
     (FCdsPessoal.FieldByName('CATEGORIA').asInteger in [1..7]) {and
     not(Comparar(FCodRecolhimento, [130,135,150,155,317,337,608]).Achou) }then
  begin
    Result :=
      // 01-Tipo do registro
      '14'+
      // 02-Tipo de inscrição empresa (1->CNPJ; 2->CEI)
      ValidarCampo('N', FCdsEstab.FieldByName('TIPO_INSCRICAO').asString, 1,' ')+
      // 03-Inscrição do empresa
      ValidarCampo('N', FCdsEstab.FieldByName('INSCRICAO').asString, 14,' ')+
      // 04-Zeros
      Replicate('0',36)+
      // 05-PIS/PASEP/CI
      ValidarCampo('N', FCdsPessoal.FieldByName('PIS').asString, 11,' ')+
      // 06-Data de admissão
      ValidarCampo('N', FDataAdmissao, 8, ' ')+
      // 07-Categoria do trabalhador
      ValidarCampo('N', FCdsPessoal.FieldByName('CATEGORIA').asString, 2,'0')+
      // 08-Nome do trabalhador
      ValidarCampo('A', FCdsPessoal.FieldByName('NOME').asString, 70,' ')+
      // 09-Número da CTPS
      Val_CTPS(1, 7, Trim(FCdsPessoal.FieldByName('CTPS').asString))+
      // 10-Série da CTPS
      Val_CTPS(8, 5, Trim(FCdsPessoal.FieldByName('CTPS').asString))+
      // 11-RUA = Logradouro + Rua + nº + andar + apartamento
      ValidarCampo('*', FCdsAltEndereco.FieldByName('ENDERECO').asString, 50, ' ')+
      // 12-Bairro
      ValidarCampo('*', FCdsAltEndereco.FieldByName('BAIRRO').asString, 20, ' ')+
      // 13-CEP
      Val_CEP(FCdsAltEndereco.FieldByName('CEP').asString)+
      // 14-Cidade
      ValidarCampo('*', FCdsAltEndereco.FieldByName('CIDADE').asString, 20, ' ')+
      // 15-UF
      ValidarCampo('A', FCdsAltEndereco.FieldByName('UF').asString, 2, ' ')+
      // 16-Brancos
      Replicate(' ',103)+
      // 17-Final de linha
      '*';
  end;
end;

function TCtrlParamGFIPMagnetico.GerarRegistro20: string;
begin
  FCdsSalFamTomador.Filter := 'IDGRUPO = ' + FCdsTomador.FieldByName('IDPESSOA').asString;

  Result :=
    // 01-Tipo do registro
    '20'+
    // 02-Tipo de inscrição-empresa (1->CNPJ; 2->CEI; 3->CPF)
    ValidarCampo('N', FCdsEstab.FieldByName('TIPO_INSCRICAO').asString, 1,' ')+
    // 03-Inscrição empresa
    ValidarCampo('N', FCdsEstab.FieldByName('INSCRICAO').asString, 14,' ')+
    // 04-Tipo de inscrição-tomador (1->CNPJ; 2->CEI; 3->CPF)
    ValidarCampo('N', FCdsTomador.FieldByName('TIPO_INSCRICAO').asString, 1,' ')+
    // 05-Inscrição tomador
    ValidarCampo('N', FCdsTomador.FieldByName('INSCRICAO').asString, 14,' ')+
    // 06-Zeros
    Replicate('0',21)+
    // 07-Nome do tomador (Razão social)
    ValidarCampo('*', FCdsTomador.FieldByName('RAZAOSOCIAL').asString, 40,' ')+
    // 08-RUA = Logradouro + Rua + nº + andar + apartamento
    ValidarCampo('*', FCdsTomador.FieldByName('ENDERECO').asString, 50,' ')+
    // 09-Bairro
    ValidarCampo('*', FCdsTomador.FieldByName('BAIRRO').asString, 20,' ')+
    // 10-Cep
    Val_CEP(FCdsTomador.FieldByName('CEP').asString)+
    // 11-Cidade
    ValidarCampo('*', FCdsTomador.FieldByName('CIDADE').asString, 20,' ')+
    // 12-UF
    ValidarCampo('A', FCdsTomador.FieldByName('UF').asString, 2,' ')+
    // 13-Código de Pagamento GPS
    Val_CodPagGPS20(FCdsGPS.FieldByName('CODIGOPAG').asString)+
    // 14-Salário Família
    Val_SalFamilia20(GetValorAtual(FCdsSalFamTomador))+
    // 15-Contrib. Desc. Empregado Referente à competência 13 (NÃO INFORMAR)
    Replicate('0', 15)+
    // 16-Indicador de valor negativo ou positivo (NÃO INFORMAR)
    '0'+
    // 17-Valor Devido à Previdência Social, Referente à competência 13 (NÃO INFORMAR)
    Replicate('0', 14)+
    // 18-Valor de Retenção
    GetValorRetencao(FCdsTomador.FieldByName('IDPESSOA').asFloat)+
    // 19-Valor das faturas emitidas para o tomador
    GetValorFatura(FCdsTomador.FieldByName('IDPESSOA').asFloat)+
    // 20-Zeros
    Replicate('0', 45)+
    // 21-Brancos
    Replicate(' ', 42)+
    // 22-Final de linha
    '*';
end;

function TCtrlParamGFIPMagnetico.GerarRegistro30: string;
begin
  // Identificar o Tomador de Serviço
  SetDadosTomadorPessoa(FCdsPessoal.FieldByName('IDGRUPO').asString);

  Result :=
    // 01-Tipo do registro
    '30'+
    // 02-Tipo de inscrição-empresa (1->CNPJ; 2->CEI)
    ValidarCampo('N', FCdsEstab.FieldByName('TIPO_INSCRICAO').asString, 1, ' ')+
    // 03-Inscrição empresa
    ValidarCampo('N', FCdsEstab.FieldByName('INSCRICAO').asString, 14, ' ')+
    // 04-Tipo de inscrição - tomador
    ValidarCampo('N', FTipoInscricaoTomador, 1, ' ')+
    // 05-Inscrição tomador
    ValidarCampo('N', FInscricaoTomador, 14, ' ')+
    // 06-PIS/PASEP/CI
    ValidarCampo('N', FCdsPessoal.FieldByName('PIS').asString, 11, ' ')+
    // 07-Data de admissão
    ValidarCampo('N', FDataAdmissao, 8, ' ')+
    // 08-Categoria do trabalhador
    ValidarCampo('N', FCdsPessoal.FieldByName('CATEGORIA').asString, 2, '0')+
    // 09-Nome do trabalhador
    ValidarCampo('A', FCdsPessoal.FieldByName('NOME').asString, 70, ' ')+
    // 10-Matrícula do Trabalhador
    Val_MatrEmpregado(FCdsPessoal.FieldByName('MATRICULA').asString)+
    // 11-Número da CTPS
    Val_CTPS(1, 7, Trim(FCdsPessoal.FieldByName('CTPS').asString))+
    // 12-Série da CTPS
    Val_CTPS(8, 5, Trim(FCdsPessoal.FieldByName('CTPS').asString))+
    // 13-Data de opção
    Val_DataOpcao(FCdsPessoal.FieldByName('DATAOPCAOFGTS').asDateTime)+
    // 14-Data de nascimento
    Val_DataNascimento(FCdsPessoal.FieldByName('DATANASC').asDateTime)+
    // 15-CBO
    Alinha(FCdsPessoal.FieldByName('CBO').asString, 5, 'D', '0')+
    // 16-Remuneração sem 13º
    Val_RemSem13(GetValor(FCdsRemSem13))+
    // 17-Remuneração sobre 13º
    Val_RemSobre13(GetValor(FCdsRemSobre13))+
    // 18-Classe de contribuição
    '  '+
    // 19-Ocorrência - Indica se o Trabalhador está exposto a agente nocivo
    Val_Ocorrencia(FCdsPessoal.FieldByName('OCORRENCIA').asString)+
    // 20-Valor Descontado do Segurado - Multiplos Vínculos
    ValidarCampo('N', FormatFloat('#########0.00', GetValor(FCdsValorRetidoSegurado)), 15, '0')+
    // 21-Base de Cálculo da Contribuição Previdenciária
    Val_BaseContribPrevAfast(GetValor(FCdsBaseContribPrevAfast))+
    // 22-Base de cálculo 13º salário Prev. Soc. - referente à competência do movimento
    Val_BaseCalc13(GetValor(FCdsBase13PrevSoc))+
    // 23-Remuneração 13º salário Prev. Soc. - referente à GPS da competência 13
    Val_BaseCalc13_GPS(GetValor(FCdsBaseCalc13_GPS))+
    // 24-Brancos
    Replicate(' ',98)+
    // 25-Final de linha
    '*';
end;

function TCtrlParamGFIPMagnetico.GerarRegistro32: string;
var
  c, byNumReg: byte;
  sAux: string;
  cIndRecFGTS: char;
  DtMov, CodMov: array [1..2] of string;
begin
  // Se houver movimentação para o trabalhador gravar o(s) registro(s)
  sAux := '';
  if not(FSEFIP_13Salario) and
     (FCdsPessoal.FieldByName('CATEGORIA').asInteger in [1..7,11,12,19..21]) then
  begin
    // Identificar o Tomador de Serviço
    SetDadosTomadorPessoa(FCdsPessoal.FieldByName('IDGRUPO').asString);

    case (FCdsPessoal.FieldByName('SITUACAO').asInteger) of
      SIT_AFASTAMENTO,
      SIT_TRANSF_MESMA_EMPRESA_SAI,
      SIT_TRANSF_PARA_OUTRA_EMPRESA :
      begin
        DtMov[1] := FCdsPessoal.FieldByName('DATAMOV1').asString;
        CodMov[1] := UpperCase(Trim(FCdsPessoal.FieldByName('COD_MOV_ANTERIOR').asString));
        byNumReg := 1;
      end;
      SIT_AFASTAMENTO_RETORNO :
      begin
        DtMov[1] := FCdsPessoal.FieldByName('DATAMOV1').asString;
        DtMov[2] := FCdsPessoal.FieldByName('DATAMOV2').asString;
        CodMov[1] := UpperCase(Trim(FCdsPessoal.FieldByName('COD_MOV_ANTERIOR').asString));
        CodMov[2] := UpperCase(Trim(FCdsPessoal.FieldByName('COD_MOV_ATUAL').asString));
        byNumReg := 2;
      end;
      //SIT_TRANSF_MESMA_EMPRESA_ENT :
      //SIT_TRANSF_MESMA_EMPRESA_SAI :
      //SIT_TRANSF_DE_OUTRA_EMPRESA :
      //SIT_TRANSF_PARA_OUTRA_EMPRESA :
      else byNumReg := 0; // SIT_NORMAL, SIT_TRANSF_MESMA_EMPRESA_ENT e SIT_TRANSF_DE_OUTRA_EMPRESA
    end;

    // 12-Indicativo de recolhimento do FGTS
    if (FDataComp > '1998/01') and ((Copy(CodMov[1],1,1) = 'I') or (Trim(CodMov[1]) = 'L')) then
      cIndRecFGTS := 'S'
    else
      cIndRecFGTS := ' ';

    // Geração do registro
    for c:=1 to byNumReg do
      sAux := sAux +IFF(c>1, CR_LF, '')+
        // 01-Tipo do registro
        '32'+
        // 02-Tipo de inscrição-empresa (1->CGC/CNPJ; 2->CEI)
        ValidarCampo('N', FCdsEstab.FieldByName('TIPO_INSCRICAO').asString, 1,' ')+
        // 03-Inscrição do empresa
        ValidarCampo('N', FCdsEstab.FieldByName('INSCRICAO').asString, 14,' ')+
        // 04-Tipo de inscrição - tomador
        ValidarCampo('N', FTipoInscricaoTomador, 1, ' ')+
        // 05-Inscrição tomador
        ValidarCampo('N', FInscricaoTomador, 14, ' ')+
        // 06-PIS/PASEP/CI
        ValidarCampo('N', FCdsPessoal.FieldByName('PIS').asString, 11, ' ')+
        // 07-Data de admissão
        ValidarCampo('N', TiraBarra(FDataAdmissao), 8, ' ')+
        // 08-Categoria do trabalhador
        ValidarCampo('N', FCdsPessoal.FieldByName('CATEGORIA').asString, 2, '0')+
        // 09-Nome do trabalhador
        ValidarCampo('A', FCdsPessoal.FieldByName('NOME').asString, 70, ' ')+
        // 10-Código de movimentação
        ValidarCampo('*', CodMov[c], 2, ' ')+
        // 11-Data de movimentação
        TiraBarra(DtMov[c])+
        // 12-Indicativo de recolhimento do FGTS
        cIndRecFGTS+
        // 13-Brancos
        Replicate(' ', 225)+
        // 14-Final de linha
        '*';
  end;

  Result := sAux;
end;

function TCtrlParamGFIPMagnetico.GerarRegistro90: string;
begin
  Result :=
    // 01-Tipo do registro
    '90'+
    // 02-Repetição do caracter nove
    Replicate('9',  51)+
    // 03-Brancos
    Replicate(' ', 306)+
    // 04-Final de linha
    '*';
end;

function TCtrlParamGFIPMagnetico.MontarListaTransferidos(var ListaIdPessoa,
  ListaCCusto: string): boolean;
var
  c: byte;
  _CdsAux: TCMClientDataSet;
  sIdPessoa, sCodCCusto: string;
begin
  Result := (AbrirQueryTransfDeOutraEmpresa) and
            (AbrirQueryTransfParaOutraEmpresa) and
            (AbrirQueryTransfMesmaEmpresa);
  if not(Result) then
    exit;

  ListaIdPessoa := '';
  ListaCCusto := '';
  try
    for c:=1 to 3 do
    begin
      case (c) of
        1 :  _CdsAux := FCdsTransfDeOutraEmpresa;
        2 :  _CdsAux := FCdsTransfParaOutraEmpresa;
        else _CdsAux := FCdsTransfMesmaEmpresa;
      end;

      while not(_CdsAux.EOF) do
      begin
        sIdPessoa := _CdsAux.FieldByName('IDPESSOA').asString;
        if (VerificaCodigoEm(ListaIdPessoa, sIdPessoa, ',') <= 0) then
          InserirCodigoEm(ListaIdPessoa, sIdPessoa);

        sCodCCusto := _CdsAux.FieldByName('CODCENTROCUSTO').asString;
        if (VerificaCodigoEm(ListaCCusto, sCodCCusto, ',') <= 0) then
          InserirCodigoEm(ListaCCusto, QuotedStr(sCodCCusto));

        _CdsAux.Next;
      end;
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

function TCtrlParamGFIPMagnetico.MontarListaPessoas(NumEspacos: integer; Campos: string;
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
        IFF((FSEFIP_13Salario) and (SemDemitidos),
          '     (SF.TIPOSIT         <> ''D'') AND' +CR_LF, '')+
        '     (SF.IDSITFUNC        = F.IDSITFUNC) AND' +CR_LF;

      if (FListaIdPessoaTransf = '') then
      begin
        if (FListaCodCentroCusto <> '') then
        begin
          sSQL := sSQL +
            MontaLinhaSelSQL('     (F.CODCENTROCUSTO',FListaCodCentroCusto,1) +CR_LF+
            '     (F.IDEMPRESA       = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF;
        end;

        sSQL := sSQL +
          MontaLinhaSelSQL('     (F.IDESTAB',FListaIdEstab,8);
      end
      else
      begin
        sSQL := sSQL +
          MontaLinhaSelSQL('     (((F.IDPESSOA', FListaIdPessoaTransf,7) +CR_LF;

        if (FListaCodCentroCustoTransf <> '') then
          sSQL := sSQL +
            MontaLinhaSelSQL('       (F.CODCENTROCUSTO',FListaCodCentroCustoTransf,2,false) +') OR' +CR_LF;

        if (FListaCodCentroCusto <> '') then
          sSQL := sSQL +
            MontaLinhaSelSQL('      ((F.IDESTAB',FListaIdEstab,9) +CR_LF+
            MontaLinhaSelSQL('       (F.CODCENTROCUSTO',FListaCodCentroCusto,2) +CR_LF+
            '       (F.IDEMPRESA       = ' +IntToStr(FIdEmpresa)+ '))) AND'
        else
          sSQL := sSQL +
            MontaLinhaSelSQL('      (F.IDESTAB',FListaIdEstab,9,false) +') AND';
      end;

      sSQL := sSQL +CR_LF+
        '     (TO_CHAR(F.DATAADMISSAO,''YYYY/MM'') <= ' +QuotedStr(FCompetencia)+ ')) FUNC';
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
        IFF((FSEFIP_13Salario) and (SemDemitidos),
          '           (SF.TIPOSIT    <> ''D'') AND' +CR_LF, '')+
        '           (SF.IDSITFUNC   = H.IDSITFUNC) AND' +CR_LF+
        '           (H.DATASITFUNC <= TO_DATE(' +
          QuotedStr(FDataCompetencia)+ ',''DD/MM/YYYY''))' +CR_LF+
        '         GROUP BY' +CR_LF+
        '           H.IDPESSOA) HST2,' +CR_LF+
        '        (SELECT' +CR_LF+
        '           MAX(H.TRGDTINCLUSAO) AS DATAINCLUSAO, H.IDPESSOA' +CR_LF+
        '         FROM' +CR_LF+
        '           HSTSITFUNC H, SITFUNC SF' +CR_LF+
        '         WHERE' +CR_LF+
        IFF((FSEFIP_13Salario) and (SemDemitidos),
          '           (SF.TIPOSIT    <> ''D'') AND' +CR_LF, '')+
        '           (SF.IDSITFUNC   = H.IDSITFUNC) AND' +CR_LF+
        '           (H.DATASITFUNC <= TO_DATE(' +
          QuotedStr(FDataCompetencia)+ ',''DD/MM/YYYY''))' +CR_LF+
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
        '           (DATAALTERFUNC <= TO_DATE('+
          QuotedStr(FDataCompetencia)+ ',''DD/MM/YYYY''))' +CR_LF+
        '         GROUP BY' +CR_LF+
        '           IDPESSOA) HST2,' +CR_LF+
        '        (SELECT' +CR_LF+
        '           MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA' +CR_LF+
        '         FROM' +CR_LF+
        '           EVOLFUNC' +CR_LF+
        '         WHERE' +CR_LF+
        '           (DATAALTERFUNC <= TO_DATE('+
          QuotedStr(FDataCompetencia)+ ',''DD/MM/YYYY''))' +CR_LF+
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

      if (FListaIdPessoaTransf = '') then
      begin
        if (FListaCodCentroCusto <> '') then
        begin
          sSQL := sSQL +
            MontaLinhaSelSQL('  (COD_CENTROCUSTO',FListaCodCentroCusto,1) +CR_LF+
            '  (IDEMPRESA        = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF;
        end;

        sSQL := sSQL +
          MontaLinhaSelSQL('  (ID_ESTAB',FListaIdEstab,8,false);
      end
      else
      begin
        sSQL := sSQL +
          MontaLinhaSelSQL('  ((IDPESSOA', FListaIdPessoaTransf,8) +CR_LF;

        if (FListaCodCentroCustoTransf <> '') then
          sSQL := sSQL +
            MontaLinhaSelSQL('   (COD_CENTROCUSTO',FListaCodCentroCustoTransf,1,false) +') OR' +CR_LF;

        sSQL := sSQL +
          MontaLinhaSelSQL('  (ID_ESTAB',FListaIdEstab,9,false);
      end;
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

function TCtrlParamGFIPMagnetico.IdentificarSitHistPessoas: boolean;
begin
  try
    FCdsPessoal.First;
    repeat
      if (GetPenultSitFunc(FCdsPessoal.FieldByName('IDPESSOA').asFloat,
                           FCdsPessoal.FieldByName('DATA_MOV_ATUAL').asDateTime)) then
      begin
        FCdsPessoal.Edit;
        FCdsPessoal.FieldByName('COD_MOV_ANTERIOR').asString :=
          FCdsPenultSitFunc.FieldByName('CODIGO').asString;
        FCdsPessoal.Post;
      end;
      FCdsPessoal.Next;
    until (FCdsPessoal.EOF);
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlParamGFIPMagnetico.IdentificarPessoas: boolean;
var
  iSituacaoPessoa: byte;
  sCodMov1: string;
  sCodMov2: string;
  DataMov1: TDate;
  DataMov2: TDate;
  DataAfast: TDate;
  DataRet: TDate;
  RegistroAux: array of variant;
  dIdEstab: double;
  dIdEstabProcura: double;
  //bkPos: TBookmark;
  _CdsAux: TCMClientDataSet;
  _CdsEstabAntesTransf: TCMClientDataSet;

{-->}function GetIdEstabAntesTransf(IdPessoa: double): double;
     begin
       _CdsEstabAntesTransf.Data := GetDataPacket(
         'SELECT' +CR_LF+
         '  EF.IDESTAB, MAX_EF.DATA' +CR_LF+
         'FROM' +CR_LF+
         '  EVOLFUNC EF,' +CR_LF+
         '  (SELECT MAX(DATAALTERFUNC) AS DATA' +CR_LF+
         '   FROM   EVOLFUNC' +CR_LF+
         '   WHERE  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
         '          (TO_CHAR(DATAALTERFUNC,''YYYY/MM'') < ' +QuotedStr(FCompetencia)+ ')' +CR_LF+
         '  ) MAX_EF' +CR_LF+
         'WHERE' +CR_LF+
         '  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
         '  (DATAALTERFUNC = MAX_EF.DATA)');
       Result := _CdsEstabAntesTransf.FieldByName('IDESTAB').asFloat;
{-->}end;

begin
  SetLength(RegistroAux, FCdsPessoal.FieldCount);

  _CdsAux := TCMClientDataSet.Create(nil);
  _CdsEstabAntesTransf := TCMClientDataSet.Create(nil);

  FCdsPessoal.IndexName := '';
  try
    try
      _CdsAux.Data := FCdsPessoal.Data;
      _CdsAux.First;
      repeat
        FCdsPessoal.Locate('IDPESSOA', _CdsAux.FieldByName('IDPESSOA').asFloat, []);
        SetDataDesligamento;

        // Selecionar a data de início do afastamento ou data de demissão
        if (FDataDesligamento <> 0) then
          DataAfast := FDataDesligamento
        else
          DataAfast := 0;

        // Selecionar a data de retorno do afastamento
        if (Trim(_CdsAux.FieldByName('DATARETORNO').asString) <> '') then
          DataRet := _CdsAux.FieldByName('DATARETORNO').asDateTime
        else
          DataRet := 0;

        // Se for afastamento, as dastas devem indicar o último dia trabalhado e o último
        // dia de afastamento respectivamente
        if (Trim(_CdsAux.FieldByName('TIPOSIT').asString) <> 'D') and (DataAfast <> 0) then
        begin
          DataAfast := IncData(DataAfast,-1,0,0);
          DataRet := IncData(DataRet,-1,0,0);
        end;

        DataMov1 := 0;
        DataMov2 := 0;
        sCodMov1 := '';
        sCodMov2 := '';
        dIdEstab := _CdsAux.FieldByName('IDESTAB').asFloat;
        iSituacaoPessoa := SIT_NORMAL;
        if (FCdsTransfMesmaEmpresa.Locate('IDPESSOA', _CdsAux.FieldByName('IDPESSOA').asFloat, [])) then
        begin
          // Somente gerar o registro correspondente à saída do trabalhador
          dIdEstabProcura := GetIdEstabAntesTransf(_CdsAux.FieldByName('IDPESSOA').asFloat);
          if (VerificaCodigoEm(FListaIdEstab, FloatToStr(dIdEstabProcura), ',') > 0) then
          begin
            iSituacaoPessoa := SIT_TRANSF_MESMA_EMPRESA_SAI;
            DataMov1 := IncData(FCdsTransfMesmaEmpresa.FieldByName('DATA').asDateTime,-1,0,0);
            sCodMov1 := FCdsTransfMesmaEmpresa.FieldByName('COD_MOV').asString;
            dIdEstab := dIdEstabProcura;
          end;  
        end
{        if (FCdsTransfMesmaEmpresa.Locate('IDPESSOA', _CdsAux.FieldByName('IDPESSOA').asFloat, [])) then
        begin
          iSituacaoPessoa := SIT_TRANSF_MESMA_EMPRESA_ENT;
          DataMov1 := FCdsTransfMesmaEmpresa.FieldByName('DATA').asDateTime;
          sCodMov1 := 'Z5';

          // Criar mais um registro para indicar a saída do antigo estabelecimento
          // caso o estabelecimento anterior tiver sido selecionado na tela pelo usuário.
          dIdEstabProcura := GetIdEstabAntesTransf(_CdsAux.FieldByName('IDPESSOA').asFloat);
          if (VerificaCodigoEm(FListaIdEstab, FloatToStr(dIdEstabProcura), ',') > 0) then
          begin
            bkPos := FCdsPessoal.GetBookmark;

            // Salvar os dados do registro atual
            for c:=0 to _CdsAux.FieldCount-1 do
              RegistroAux[c] := _CdsAux.Fields[c].Value;

            FCdsPessoal.Insert;

            // Carregar os dados do registro atual
            for c:=0 to FCdsPessoal.FieldCount-1 do
              FCdsPessoal.Fields[c].Value := RegistroAux[c];

            FCdsPessoal.FieldByName('IDESTAB').asFloat := dIdEstabProcura;
            FCdsPessoal.FieldByName('SITUACAO').asInteger := SIT_TRANSF_MESMA_EMPRESA_SAI;
            FCdsPessoal.FieldByName('DATAMOV1').asString := IncData(FCdsTransfMesmaEmpresa.FieldByName('DATA').asString,-1,0,0);
            FCdsPessoal.FieldByName('DATAMOV2').asString := '';
            FCdsPessoal.FieldByName('COD_MOV_ANTERIOR').asString := FCdsTransfMesmaEmpresa.FieldByName('COD_MOV').asString;
            FCdsPessoal.FieldByName('COD_MOV_ATUAL').asString := '';
            FCdsPessoal.Post;

            // Corrigir ponteiro do Cds após inclusão de registro acima
            FCdsPessoal.GotoBookmark(bkPos);
            FCdsPessoal.FreeBookmark(bkPos);
          end;
        end}
        else
        if (FCdsTransfDeOutraEmpresa.Locate('IDPESSOA', _CdsAux.FieldByName('IDPESSOA').asFloat, [])) then
        begin
          iSituacaoPessoa := SIT_TRANSF_DE_OUTRA_EMPRESA;
          DataMov1 := FCdsTransfDeOutraEmpresa.FieldByName('DATA').asDateTime;
          sCodMov1 := FCdsTransfDeOutraEmpresa.FieldByName('COD_MOV').asString;
        end
        else
        if (FCdsTransfParaOutraEmpresa.Locate('IDPESSOA', _CdsAux.FieldByName('IDPESSOA').asFloat, [])) then
        begin
          iSituacaoPessoa := SIT_TRANSF_PARA_OUTRA_EMPRESA;
          DataMov1 := FCdsTransfParaOutraEmpresa.FieldByName('DATA').asDateTime;
          sCodMov1 := FCdsTransfParaOutraEmpresa.FieldByName('COD_MOV').asString;
          dIdEstab := GetIdEstabAntesTransf(_CdsAux.FieldByName('IDPESSOA').asFloat);
        end
        else
(*        // Caso o trabalhador tenha sido afastado e retornado na competência, indicar que serão
        // gerados dois registros. Um inicial com a data de afastamento e um final com a data
        // de retorno
        if (Trim(_CdsAux.FieldByName('TIPOSIT').asString) = 'A') and
           (RetornaAnoMes(DataAfast) = FCompetencia) and
           (DataRet <> 0) and
           (RetornaAnoMes(DataRet) = FCompetencia) then
        begin
          DataMov1 := DataAfast;
          DataMov2 := DataRet;
          sCodMov1 := _CdsAux.FieldByName('COD_MOV_ANTERIOR').asString;
          sCodMov2 := _CdsAux.FieldByName('COD_MOV_ATUAL').asString;
          iSituacaoPessoa := SIT_AFASTAMENTO_RETORNO;
        end*)
        // Caso o trabalhador tenha retornado de um afastamento na competência, indicar
        // que serão gerados dois registros. Um inicial com a data de afastamento e um
        // final com a data de retorno.
        if (Trim(_CdsAux.FieldByName('TIPOSIT').asString) = 'A') and
           // (RetornaAnoMes(DataAfast) = FCompetencia) and   ECF 11/07/05
           (DataRet <> 0) and
           (RetornaAnoMes(DataRet) = FCompetencia) then
        begin
          DataMov1 := DataAfast;
          DataMov2 := DataRet;
          sCodMov1 := _CdsAux.FieldByName('COD_MOV_ANTERIOR').asString;
          sCodMov2 := _CdsAux.FieldByName('COD_MOV_ATUAL').asString;
          iSituacaoPessoa := SIT_AFASTAMENTO_RETORNO;
        end
        else
        // Caso o trabalhador tenha sido demitido ou afastado, indicar que será gravado
        // apenas um registro contendo a movimentação de demissão ou afastamento
        if (_CdsAux.FieldByName('TIPOSIT').asString[1] in ['F','D']) and
           (DataAfast <> 0) and
           ((_CdsAux.FieldByName('TIPOSIT').asString[1] = 'F') or
            (RetornaAnoMes(DataAfast) = FCompetencia)) and
           ((_CdsAux.FieldByName('COD_MOV_ATUAL').asString = 'O1') or
            (_CdsAux.FieldByName('COD_MOV_ATUAL').asString = 'O2') or
            (_CdsAux.FieldByName('COD_MOV_ATUAL').asString = 'Q1') or
            (_CdsAux.FieldByName('COD_MOV_ATUAL').asString = 'R') or
            (_CdsAux.FieldByName('COD_MOV_ATUAL').asString =
             _CdsAux.FieldByName('COD_MOV_ANTERIOR').asString) or
            (RetornaAnoMes(DataAfast) = FCompetencia)) then
        begin
          DataMov1 := DataAfast;
          sCodMov1 := _CdsAux.FieldByName('COD_MOV_ATUAL').asString;
          iSituacaoPessoa := SIT_AFASTAMENTO;
        end;

        FCdsPessoal.Edit;
        FCdsPessoal.FieldByName('IDESTAB').asFloat := dIdEstab;
        FCdsPessoal.FieldByName('SITUACAO').asInteger := iSituacaoPessoa;
        FCdsPessoal.FieldByName('DATAMOV1').asDateTime := DataMov1;
        FCdsPessoal.FieldByName('DATAMOV2').asDateTime := DataMov2;
        FCdsPessoal.FieldByName('COD_MOV_ANTERIOR').asString := sCodMov1;
        FCdsPessoal.FieldByName('COD_MOV_ATUAL').asString := sCodMov2;
        FCdsPessoal.Post;

        _CdsAux.Next;
      until (_CdsAux.EOF);

      //FCdsPessoal.savetofile(DirTempLog + '\CdsPessoal.Cds');

      if (FCdsPessoal.IndexDefs.IndexOf('Index') > -1) then
        FCdsPessoal.DeleteIndex('Index');
      FCdsPessoal.AddIndex('Index', 'IDESTAB;PIS', []);
      FCdsPessoal.IndexDefs.Update;
      FCdsPessoal.IndexName := 'Index';

      FCdsPessoal.First;
      Result := true;
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  finally
    _CdsAux.Free;
    _CdsEstabAntesTransf.Free;
  end;
end;

function TCtrlParamGFIPMagnetico.GerarRegistroPessoa: boolean;
begin
  // Gerar para quem tem valor de FGTS ou somente INSS
  Result :=
    ((FSEFIP_13Salario) and (GetValorAtual(FCdsBase13PrevSoc) > 0)) or
    not(
    ((GetValorAtual(FCdsRemSem13) + GetValorAtual(FCdsRemSobre13) +
      GetValorAtual(FCdsBaseContribPrevAfast)) = 0) or
    (
      (FCdsPessoal.FieldByName('TIPOSIT').asString = 'D') and
      ((UpperCase(Copy(FCdsPessoal.FieldByName('COD_MOV_ATUAL').asString,1,1)) = 'I') or
       (UpperCase(Trim(FCdsPessoal.FieldByName('COD_MOV_ATUAL').asString))     = 'L')) and
      (RetornaAnoMes(IncData(FDataDesligamento,0,-1,0)) = FCompetencia) and
      (ExtraiDia(FDataDesligamento)                    <= FDiaLimiteGRFC)
    ));
end;

function TCtrlParamGFIPMagnetico.GetPenultSitFunc(const IdPessoa: double;
  const DataUltSitFunc: TDate): boolean;
begin
  FCdsPenultSitFunc.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  MO.MOTIVOFGTS AS CODIGO' +CR_LF+
    'FROM' +CR_LF+
    '  HSTSITFUNC H, MOTIVO MO,' +CR_LF+
    '  (SELECT' +CR_LF+
    '     MAX(DATASITFUNC) AS DATASITFUNC, IDPESSOA' +CR_LF+
    '   FROM' +CR_LF+
    '     HSTSITFUNC' +CR_LF+
    '   WHERE' +CR_LF+
    '     (IDPESSOA    = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    '     (DATASITFUNC < TO_DATE(' +QuotedStr(DateToStr(DataUltSitFunc))+ ',''DD/MM/YYYY''))' +CR_LF+
    '   GROUP BY' +CR_LF+
    '     IDPESSOA) HST2,' +CR_LF+
    '  (SELECT' +CR_LF+
    '     MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA' +CR_LF+
    '   FROM' +CR_LF+
    '     HSTSITFUNC' +CR_LF+
    '   WHERE' +CR_LF+
    '     (IDPESSOA    = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    '     (DATASITFUNC < TO_DATE(' +QuotedStr(DateToStr(DataUltSitFunc))+ ',''DD/MM/YYYY''))' +CR_LF+
    '   GROUP BY' +CR_LF+
    '     IDPESSOA) HST3' +CR_LF+
    'WHERE' +CR_LF+
    '  (H.DATASITFUNC   = HST2.DATASITFUNC) AND' +CR_LF+
    '  (H.IDPESSOA      = HST2.IDPESSOA) AND' +CR_LF+
    '  (H.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND' +CR_LF+
    '  (H.IDPESSOA      = HST3.IDPESSOA) AND' +CR_LF+
    '  (H.IDMOTIVOOFIC  = MO.IDMOTIVO)');

  Result := not(FCdsPenultSitFunc.IsEmpty);
end;

function TCtrlParamGFIPMagnetico.GerarTomador(const CodRecolhimento: integer): boolean;
begin
  Result := (Comparar(CodRecolhimento,[130,135,150,155,211,317,337,608]).Achou);
end;

procedure TCtrlParamGFIPMagnetico.PosicionarValoresEstab(const IdEstab: double);
begin
  // FPAS do estabelecimento atual
  FFPAS := Val_FPAS(FCdsEstab.FieldByName('FPAS').asString);

  FFiltroPessoaEstab := 'IDESTAB = ' +FloatToStr(IdEstab);
  FCdsSalFam.Filter := FFiltroPessoaEstab;
  FCdsSalMat.Filter := FFiltroPessoaEstab;
  FCdsContribDescontEmpreg.Filter := FFiltroPessoaEstab;
  FCdsGPS.Filter := FFiltroPessoaEstab;
  FCdsPessoal.Filter := FFiltroPessoaEstab;
end;

procedure TCtrlParamGFIPMagnetico.PosicionarValoresPessoa(const IdPessoa: double);
begin
  FCdsRemSem13.Filter := 'IDPESSOA = ' +FloatToStr(IdPessoa);
  FCdsRemSobre13.Filter := 'IDPESSOA = ' +FloatToStr(IdPessoa);
  FCdsValorRetidoSegurado.Filter := 'IDPESSOA = ' +FloatToStr(IdPessoa);
  FCdsBaseContribPrevAfast.Filter := 'IDPESSOA = ' +FloatToStr(IdPessoa);
  FCdsBase13PrevSoc.Filter := 'IDPESSOA = ' +FloatToStr(IdPessoa);
  FCdsBaseCalc13_GPS.Filter := 'IDPESSOA = ' +FloatToStr(IdPessoa);

  SetDataDesligamento;
end;

procedure TCtrlParamGFIPMagnetico.SetDataDesligamento;
begin
  try
    if (StrToDate(FCdsPessoal.FieldByName('DATADESLIGAMENTO').asString) > 0) then
      FDataDesligamento := FCdsPessoal.FieldByName('DATADESLIGAMENTO').asDateTime
    else
      FDataDesligamento := 0;
  except
    FDataDesligamento := 0;
  end;
end;

procedure TCtrlParamGFIPMagnetico.SetDadosTomadorPessoa(const IdGrupo: string);
begin
  if (IdGrupo <> '') and (FCdsTomador.Locate('IDPESSOA', IdGrupo, [])) then
  begin
    FTipoInscricaoTomador := FCdsTomador.FieldByName('TIPO_INSCRICAO').asString;
    FInscricaoTomador := Trim(FCdsTomador.FieldByName('INSCRICAO').asString);
  end
  else
  begin
    FTipoInscricaoTomador := '';
    FInscricaoTomador := '';
  end;
end;

procedure TCtrlParamGFIPMagnetico.ProximaPessoa;
begin
  FCdsPessoal.Next;
  PosicionarValoresPessoa(FCdsPessoal.FieldByName('IDPESSOA').asFloat);

  if (FDeslocamentoAtual = FNumDeslocamentos) then
  begin
    IncProgresso(GetTempoDecorrido, '', 1);
    FDeslocamentoAtual := 0;
  end
  else
    Inc(FDeslocamentoAtual);
end;

function TCtrlParamGFIPMagnetico.GetValorAtual(const Cds: TCMClientDataSet): double;
begin
  if (Cds.IsEmpty) then
    Result := 0
  else
    Result := Cds.FieldByName('VALOR').asFloat;
end;

function TCtrlParamGFIPMagnetico.GetValorRetencao(const IdTomador: double): string;
begin
  if (FCompetencia >= '1999/02') and (Comparar(FCodRecolhimento, [150,155]).Achou) and
     (FCdsListaTomador.Locate('IDPESSOA', IdTomador, [])) then
    Result := ValidarCampo('N', FormatFloat('#########0.00',
      FCdsListaTomador.FieldByName('VALOR_RETENCAO').asFloat), 15, '0')
  else
    Result := Replicate('0', 15);
end;

function TCtrlParamGFIPMagnetico.GetValorFatura(const IdTomador: double): string;
begin
  if (FCompetencia >= '2000/03') and (FCodRecolhimento = 211) and
     (FCdsListaTomador.Locate('IDPESSOA', IdTomador, [])) then
    Result := ValidarCampo('N', FormatFloat('#########0.00',
      FCdsListaTomador.FieldByName('VALOR_FATURA').asFloat), 15, '0')
  else
    Result := Replicate('0', 15);
end;

function TCtrlParamGFIPMagnetico.GetValor(const Cds: TCMClientDataSet): double;
begin
//  if (FCdsPessoal.FieldByName('SITUACAO').asInteger in [
//      SIT_TRANSF_MESMA_EMPRESA_SAI, SIT_TRANSF_PARA_OUTRA_EMPRESA]) then
  if (FCdsPessoal.FieldByName('SITUACAO').asInteger = SIT_TRANSF_PARA_OUTRA_EMPRESA) then
    Result := 0
  else
    Result := GetValorAtual(Cds);
end;

function TCtrlParamGFIPMagnetico.GetNumDiasTrabAno: integer;
var
  dtInicial, dtFinal: TDate;
  iNumDias, iNumMeses, iNumAnos: integer;
begin             
  dtInicial := FCdsPessoal.FieldByName('DATAADMISSAO').asDateTime;
  if (ExtraiAno(dtInicial) < StrToInt(Copy(FDataComp,1,4))) then
    dtInicial := StrToDate('01/01/' + Copy(FDataComp,1,4));

  if (FCdsPessoal.FieldByName('TIPOSIT').asString = 'D') and
     (FCdsPessoal.FieldByName('DATADESLIGAMENTO').asString <> '') then
    dtFinal := FCdsPessoal.FieldByName('DATADESLIGAMENTO').asDateTime
  else
    dtFinal := Date;

  CalculaDifData(DateToStr(dtInicial), DateToStr(dtFinal), iNumDias, iNumMeses, iNumAnos);

  Result := iNumDias;
end;

procedure TCtrlParamGFIPMagnetico.GerarRegistrosPessoas;
//var
//  sAnoMesPosDeslig: string; // Ano/Mês anterior à Data de Desligamento
begin
  repeat
    if not(GerarRegistroPessoa) then
    begin
      ProximaPessoa;
      Continue;
    end;

{    if (FDataDesligamento = 0) then
      sAnoMesPosDeslig := ''
    else
      sAnoMesPosDeslig := RetornaAnoMes(IncData(FDataDesligamento,0,-1,0));}

    // 6-Data de Admissão
    FDataAdmissao := Val_DtAdmissao(FCdsPessoal.FieldByName('DATAADMISSAO').asDateTime);

    // OBS: É feito desta maneira, pois preciso saber se o empregado teve movimentação
    // Gerar Registro de Movimentação do Trabalhador
    FRegitroAltTrab := GerarRegistro32;
    // Registro do Trabalhador
    FArq.Add(GerarRegistro30);
    // Gravar Registro de Movimentação do Trabalhador
    if (FRegitroAltTrab <> '') then
      FArq.Add(FRegitroAltTrab);

    ProximaPessoa;
  until (FCdsPessoal.EOF);
end;

function TCtrlParamGFIPMagnetico.ListTomadores(const IdEmpresa: integer;
  const ListaIdEstab: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT DISTINCT' +CR_LF+
    '  0 AS SELECIONADO,' +CR_LF+
    '  P.IDPESSOA,' +CR_LF+
    '  P.NOME,' +CR_LF+
    '  0.00 AS VALOR_RETENCAO,' +CR_LF+
    '  0.00 AS VALOR_FATURA' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA P, PESSOA PF, CLIENTEPESS CP, EMPRESACLIENTE EC, FUNCIONARIO F' +CR_LF+
    'WHERE' +CR_LF+
    IFF(ListaIdEstab = '',
      '  (F.IDESTAB    = -1) AND',
      MontaLinhaSelSQL('  (F.IDESTAB', ListaIdEstab, 3)) +CR_LF+
    '  (F.IDPESSOA   = PF.IDPESSOA) AND' +CR_LF+
    '  (PF.IDGRUPO   = CP.IDPESSOA) AND' +CR_LF+
    '  (EC.IDPESSOA  = ' +FloatToStr(IdEmpresa)+ ') AND' +CR_LF+
    '  (EC.FLGSTATUS = ''A'') AND' +CR_LF+
    '  (CP.IDPESSOA  = P.IDPESSOA) AND' +CR_LF+
    '  (CP.IDPESSOA  = EC.IDFORCLI)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  P.NOME');
end;

function TCtrlParamGFIPMagnetico.ProcessarGeracao(IdEmpresa: integer; MesRef, AnoRef: integer;
  DataVenc, DataPag: TDate; const ovTomador: OleVariant; ListaIdEstab, ListaCodCentroCusto: string;
  IdResponsavel: double; SEFIP_13Salario, BuscaFuncSitAtual, GerarRegAltEndereco,
  IdentificadorDocCPF: boolean; CodRecolhimento: integer; CodEmpresaCAIXA: string;
  DiaLimiteGRFC, OptanteSimples, OpcaoModalidade: integer; ListaRubricaSalFam,
  ListaRubricaSalMat, ListaRubricaValINSS_13, ListaRubricaSalSem13, ListaRubrica13Salario,
  ListaRubricaValRetSegurado, ListaRubricaBaseINSS_Esp, ListaRubricaBaseINSS_13Movimento,
  ListaRubricaBaseINSS_13: string): boolean;
begin
  try
    Result := false;
    FHoraIni := Time;

    FCdsPessoal := TCMClientDataSet.Create(nil);
    FCdsEstab := TCMClientDataSet.Create(nil);
    FCdsListaTomador := TCMClientDataSet.Create(nil);
    FCdsResp := TCMClientDataSet.Create(nil);
    FCdsGPS := TCMClientDataSet.Create(nil);
    FCdsTomador := TCMClientDataSet.Create(nil);
    FCdsTransfDeOutraEmpresa := TCMClientDataSet.Create(nil);
    FCdsTransfParaOutraEmpresa := TCMClientDataSet.Create(nil);
    FCdsTransfMesmaEmpresa := TCMClientDataSet.Create(nil);
    FCdsSalFam := TCMClientDataSet.Create(nil);
    FCdsSalFamTomador := TCMClientDataSet.Create(nil);
    FCdsSalMat := TCMClientDataSet.Create(nil);
    FCdsContribDescontEmpreg := TCMClientDataSet.Create(nil);
    FCdsRemSem13 := TCMClientDataSet.Create(nil);
    FCdsRemSobre13 := TCMClientDataSet.Create(nil);
    FCdsValorRetidoSegurado := TCMClientDataSet.Create(nil);
    FCdsBaseContribPrevAfast := TCMClientDataSet.Create(nil);
    FCdsBase13PrevSoc := TCMClientDataSet.Create(nil);
    FCdsBaseCalc13_GPS := TCMClientDataSet.Create(nil);
    FCdsAltEndereco := TCMClientDataSet.Create(nil);
    FCdsPenultSitFunc := TCMClientDataSet.Create(nil);

    FCdsPessoal.Filtered := true;
    FCdsGPS.Filtered := true;
    FCdsSalFam.Filtered := true;
    FCdsSalFamTomador.Filtered := true;
    FCdsSalMat.Filtered := true;
    FCdsContribDescontEmpreg.Filtered := true;
    FCdsRemSem13.Filtered := true;
    FCdsRemSobre13.Filtered := true;
    FCdsValorRetidoSegurado.Filtered := true;
    FCdsBaseContribPrevAfast.Filtered := true;
    FCdsBase13PrevSoc.Filtered := true;
    FCdsBaseCalc13_GPS.Filtered := true;
    FCdsAltEndereco.Filtered := true;

    FSEFIP_13Salario := SEFIP_13Salario;
    if (FSEFIP_13Salario) then
      FDataComp := IntToStr(AnoRef) +'/13'
    else
      FDataComp := IntToStr(AnoRef) +'/'+ PoeZero(MesRef);

    FCompetencia := IntToStr(AnoRef) +'/'+ PoeZero(MesRef);
    FDataCompetencia :=
      PoeZero(TrazUltDiaMes(MesRef, AnoRef)) +'/'+ PoeZero(MesRef) +'/'+ IntToStr(AnoRef);

    FIdEmpresa := IdEmpresa;
    FDiaLimiteGRFC := DiaLimiteGRFC;
    FBuscaFuncSitAtual := BuscaFuncSitAtual;

    if (DataVenc > 0) then
      FDataVenc := DateToStr(DataVenc)
    else
      FDataVenc := '';

    if (DataPag > 0) then
      FDataPag := DateToStr(DataPag)
    else
      FDataPag := '';

    FCdsListaTomador.Data := ovTomador;
    FListaIdEstab := ListaIdEstab;
    FListaCodCentroCusto := ListaCodCentroCusto;
    FIdResponsavel := IdResponsavel;
    FIdentificadorDocCPF := IdentificadorDocCPF;
    FCodRecolhimento := CodRecolhimento;
    FCodEmpresaCAIXA := CodEmpresaCAIXA;
    FOptanteSimples := OptanteSimples;
    FOpcaoModalidade := OpcaoModalidade;

    FListaRubricaSalFam := ListaRubricaSalFam;
    FListaRubricaSalMat := ListaRubricaSalMat;
    FListaRubricaValINSS_13 := ListaRubricaValINSS_13;
    FListaRubricaSalSem13 := ListaRubricaSalSem13;
    FListaRubrica13Salario := ListaRubrica13Salario;
    FListaRubricaValRetSegurado := ListaRubricaValRetSegurado;
    FListaRubricaBaseINSS_Esp := ListaRubricaBaseINSS_Esp;
    FListaRubricaBaseINSS_13Movimento := ListaRubricaBaseINSS_13Movimento;
    FListaRubricaBaseINSS_13 := ListaRubricaBaseINSS_13;

    FGerarTomador := GerarTomador(FCodRecolhimento);
    FFiltroPessoaEstab := '';
    FArq.Text := '';
    try
      // Montar Queries com informações dos Estabelecimentos
      if not(AbrirQueryEstabelecimento) or not(AbrirQueryResponsavel) or not(AbrirQueryGPS) then
      begin
        Result := true;
        raise Exception.Create(MessageInfo);
      end;

      // Obter a lista das pessoas transferidas
      if not(MontarListaTransferidos(FListaIdPessoaTransf, FListaCodCentroCustoTransf)) then
        raise Exception.Create(MessageInfo);

      // Montar Queries com informações das pessoas
      if not(AbrirQueryPrincipal) or not(AbrirQueryTomador) or not(AbrirQueriesDosValores) then
      begin
        Result := true;
        raise Exception.Create(MessageInfo);
      end;

      // Identificar a situação anterior à atual de cada pessoa
      if not(FBuscaFuncSitAtual) then
        if not(IdentificarSitHistPessoas) then
          raise Exception.Create(MessageInfo);

      // Identificar a situação atual de cada pessoa
      if not(IdentificarPessoas) then
        raise Exception.Create(MessageInfo);

      // Para que a barra de progressos seja incrementada, será preciso passar por N registros
      // dentro dos 20% restantes do processo.
      // Ex(1): 200 registros divididos por 20 é igual a 10
      // Isto quer dizer que a cada 10 registros o progresso será incrementado
      // Ex(2): 257 registros divididos por 20 é aproximadamente 34
      // Isto quer dizer que a cada 34 registros o progresso será incrementado
      FNumDeslocamentos := (FCdsPessoal.RecordCount div 20);
      FDeslocamentoAtual := 0;

      // Processar dados para a geração do arquivo
      IncProgresso(GetTempoDecorrido, ('Processando Dados...'), 0);

      // Posicionar querys de valores do primeiro estabelecimento
      PosicionarValoresEstab(FCdsEstab.FieldByName('IDPESSOA').asFloat);

      // Informações do responsável (header do arquivo)
      FArq.Add(GerarRegistro00);
      IncProgresso(GetTempoDecorrido, '', 0);

      // Geração do subarquivo de todos os estabelecimentos selecionados
      repeat
        if not(FCdsPessoal.IsEmpty) then
        begin
          // Informações da Empresa (header da Estabelecimento)
          FArq.Add(GerarRegistro10);
          IncProgresso(GetTempoDecorrido, '', 0);

          // Geração do registros de alteração de endereço
          // Eles têm que ser gerados antes das informações da contribuição das pessoas
          if (GerarRegAltEndereco) then
            if not(GerarRegistro_AltEndereco) then
              raise Exception.Create(MessageInfo);

          // Posicionar querys de valores da primeira pessoa do estabelecimento atual
          PosicionarValoresPessoa(FCdsPessoal.FieldByName('IDPESSOA').asFloat);

          // Geração dos registros das pessoas alocadas em um Tomador de Serviço
          if (FGerarTomador) then
          begin
            if not(FCdsTomador.IsEmpty) then
            begin
              FCdsTomador.First;
              while not(FCdsTomador.EOF) do
              begin
                FCdsPessoal.Filter := FFiltroPessoaEstab +' AND ' +
                  'IDGRUPO = ' + FCdsTomador.FieldByName('IDPESSOA').asString;
                if not(FCdsPessoal.IsEmpty) then
                begin
                  FArq.Add(GerarRegistro20);
                  GerarRegistrosPessoas;
                end;
                FCdsTomador.Next;
              end;
            end;
          end
          else
          begin
            // Geração dos registros das pessoas NÃO alocadas em um Tomador de Serviço
            FCdsPessoal.Filter := FFiltroPessoaEstab + ' AND IDGRUPO = NULL';
            GerarRegistrosPessoas;
          end;  
        end;

        FCdsEstab.Next;
        // Posicionar querys de valores do estabelecimento atual
        PosicionarValoresEstab(FCdsEstab.FieldByName('IDPESSOA').asFloat);
      until (FCdsEstab.EOF);

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
    FreeAndNil(FCdsPessoal);
    FreeAndNil(FCdsEstab);
    FreeAndNil(FCdsListaTomador);
    FreeAndNil(FCdsResp);
    FreeAndNil(FCdsGPS);
    FreeAndNil(FCdsTomador);
    FreeAndNil(FCdsTransfDeOutraEmpresa);
    FreeAndNil(FCdsTransfParaOutraEmpresa);
    FreeAndNil(FCdsTransfMesmaEmpresa);
    FreeAndNil(FCdsSalFam);
    FreeAndNil(FCdsSalFamTomador);
    FreeAndNil(FCdsSalMat);
    FreeAndNil(FCdsContribDescontEmpreg);
    FreeAndNil(FCdsRemSem13);
    FreeAndNil(FCdsRemSobre13);
    FreeAndNil(FCdsValorRetidoSegurado);
    FreeAndNil(FCdsBaseContribPrevAfast);
    FreeAndNil(FCdsBase13PrevSoc);
    FreeAndNil(FCdsBaseCalc13_GPS);
    FreeAndNil(FCdsAltEndereco);
    FreeAndNil(FCdsPenultSitFunc);
  end;
end;

end.
