unit uCtrlParamDeclRemPortugalMagnetico;

interface

uses SysUtils, Classes, Controls, DB, Forms, uCmControlObject, uCmDbObject, IvDictio,
  uCMTranslate, uCmClientDataSet, uCMTypes, uCtrlCustomRH;

// Agrupar o arquivo por Tipo de Trabalhador que está na TABGENER SEGSOC e por Estabelecimento

type
  TOnProgDeclRemPortugalMagnetico = procedure (const TempoAtual, Mensagem: string;
    const Incremento: integer) of object;

  TRubricas = record
    Comiss: string;
    Ferias: string;
    Natal: string;
    RemPerm: string;
    OutrosSubsidios: string;
    ForcasArm: string;
    RemVar: string;
    FerPagas: string;
    DifVenc: string;
    ExecTemp: string;
    Promocoes: string;
    Contrib: string;
    DiasTrab: string;
  end;

  TCtrlParamDeclRemPortugalMagnetico = class(TCtrlCustomRH)
  protected
    FHoraIni: TTime; // Hora inicial do processamento
  private
    FOnProgDeclRemPortugalMagnetico: TOnProgDeclRemPortugalMagnetico;

    FCdsPessoal: TCMClientDataSet;
    FCdsEstab: TCMClientDataSet;
    FCdsTaxas: TCMClientDataSet;
    FCdsValor: TCMClientDataSet;
    FCdsContrib: TCMClientDataSet;
    FCdsDiasTrab: TCMClientDataSet;

    FArq: TStringList;
    FSQL: TStringList;

    FIdEmpresa: integer;
    FDataCompetencia: string; // Data de Competência (DD/MM/AAAA)
    FCompetencia: string; // Data de Competência (AAAA/MM)
    FListaIdEstab: string;
    FListaCodCentroCusto: string;
    FListaIdMotivo: string;
    FTempoDecorridoTotal: string;

    FListaIdRubrica: string;

    FNomeTabela: string;
    FNumDeslocamentos: integer;
    FDeslocamentoAtual: integer;

    FTotalRem: double; // Total de remunerações por Estabelecimento
    FNumRegR2: integer; // Número de registro R2 por Estabelecimento

    FRubricas: TRubricas;

    procedure IncProgresso(const TempoAtual, Mensagem: string; const Incremento: integer);
    function  GetTempoDecorrido(Extendido: boolean = false): string;

    function AbrirQueryEstabelecimento: boolean;
    function AbrirQueryTaxas: boolean;
    function AbrirQueryPessoal: boolean;
    function AbrirQueriesDosValores: boolean;

    procedure ProximaPessoa;

    // Validação dos dados
    function ValidarCampo(Tipo: char; Dado: string; const Tamanho: word): string;

    // Geração dos registros do arquivo
    function GerarRegistroR0: string;
    function GerarRegistroR1: string;
    function GerarRegistroR2: string;
    function GerarRegistroR3: string;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ProcessarGeracao(const IdEmpresa: integer; const MesRef, AnoRef: integer;
      const Previa: boolean; const ListaIdEstab, ListaCodCentroCusto, ListaIdMotivo,
      ListaRubricaComiss, ListaRubricaFerias, ListaRubricaNatal, ListaRubricaRemPerm,
      ListaRubricaOutrosSubsidios, ListaRubricaDifVenc, ListaRubricaForcasArm,
      ListaRubricaRemVar, ListaRubricaFerPagas, ListaRubricaExecTemp,
      ListaRubricaPromocoes, ListaRubricaContrib, ListaRubricaDiasTrab: string): boolean;

    property TempoDecorridoTotal: string read FTempoDecorridoTotal;
    property DadosArquivo: TStringList read FArq;
    property OnProgresso: TOnProgDeclRemPortugalMagnetico read FOnProgDeclRemPortugalMagnetico write FOnProgDeclRemPortugalMagnetico;
  end;

implementation

uses uCtrlFuncoesRH, uCMTraduzSQL;

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_SEM_DADOS_ESTAB =
    'Dados do(s) Estabelecimento(s) selecionado(s) não estão completos.:1'+
    'Verifique e tente novamente.';
  MSG_SEM_TAXAS =
    'Não foi encontrada nenhuma associação de Taxas para as pessoas cujos:1'+
    'Tipos de Contrato estão associados no campo CODIGO da Tabela Genérica SEGSOC:2'+
    'e que estejam alocadas nos Estabelecimentos indicados.:3'+
    'Verifique e tente novamente.';
  MSG_SEM_DADOS =
    'Não há dados a serem processados para esta competência ou:1'+
    'Dados Cadastrais incompletos.';

{ TCtrlParamDeclRemPortugalMagnetico }

constructor TCtrlParamDeclRemPortugalMagnetico.Create;
begin
  inherited;
  FSQL := TStringList.Create;
  FArq := TStringList.Create;

  GetTempDir;
end;

destructor TCtrlParamDeclRemPortugalMagnetico.Destroy;
begin
  FSQL.Free;
  FArq.Free;
  inherited;
end;

procedure TCtrlParamDeclRemPortugalMagnetico.IncProgresso(const TempoAtual, Mensagem: string;
  const Incremento: integer);
begin
  if Assigned(OnProgresso) then
    OnProgresso(TempoAtual, Mensagem, Incremento);
end;

function TCtrlParamDeclRemPortugalMagnetico.GetTempoDecorrido(Extendido: boolean): string;
begin
  if (Extendido) then
    Result := HoraPorExtenso(Time - FHoraIni)
  else
    Result := FormatDateTime('hh:mm:ss', Time - FHoraIni);
end;

function TCtrlParamDeclRemPortugalMagnetico.AbrirQueryEstabelecimento: boolean;
begin
{  case TTipoBDPadrao(iTipoBD_Padrao) of
    tbdOracle                      : GetSeparadorDecimalORACLE;
    tbdSQLServer, tbdSQLServerOdbc : SepDecORACLE := '.';
  end;}

  with (FSQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  PJ.IDPESSOA,');
    Add('  PJ.RAZAOSOCIAL,');
    Add('  DOC_NISS.NUM AS NISS,');
    Add('  PJ.NUMDOCUMENTO AS NIPC,');
    Add('  FP.NUMFILIAL');
//    Add('  ,TO_NUMBER(REPLACE(REPLACE(VALOR,'','',''.''),''.'',''' +SepDecORACLE+ ''')) AS TAXA');
    // -------------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PJ, FILIALPESSOA FP,');
    // -------------------------------------------------------------------------- //
    // Taxas associadas aos Trabalhadores em cada Estabelecimento
{    Add('  (SELECT');
    Add('     F.IDESTAB, VT_PER.VALOR');
    Add('   FROM');
    Add('     VALTABGENER VT_COD, VALTABGENER VT_PER,');
    // -------------------------------------------------------------------------- //
    // Buscar do Histórico de EVOLFUNC
    Add('     (SELECT DISTINCT');
    Add('        F.IDTIPOTRAB,');
    Add('        HST.IDESTAB');
    Add('      FROM');
    Add('        FUNCIONARIO F,');
    Add('        (SELECT');
    Add('           EF.IDPESSOA, EF.IDESTAB');
    Add('         FROM');
    Add('           EVOLFUNC EF,');
    Add('           (SELECT IDPESSOA, MAX(DATAALTERFUNC) AS DATAALTERFUNC');
    Add('            FROM   EVOLFUNC');
    Add('            WHERE  (DATAALTERFUNC <= TO_DATE('+
      QuotedStr(FDataCompetencia)+ ',''DD/MM/YYYY''))');
    Add('            GROUP BY IDPESSOA) HST1,');
    Add('           (SELECT EV.IDPESSOA, MAX(EV.TRGDTINCLUSAO) AS DATAINCLUSAO');
    Add('            FROM   EVOLFUNC EV,');
    Add('                   (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
    Add('                    FROM   EVOLFUNC');
    Add('                    WHERE  (DATAALTERFUNC <= TO_DATE('+
      QuotedStr(FDataCompetencia)+ ',''DD/MM/YYYY''))');
    Add('                    GROUP BY IDPESSOA) H');
    Add('            WHERE');
    Add('              (EV.IDPESSOA      = H.IDPESSOA) AND');
    Add('              (EV.DATAALTERFUNC = H.DATAALTERFUNC)');
    Add('            GROUP BY EV.IDPESSOA) HST2');
    Add('         WHERE');
    Add('           (EF.IDPESSOA      = HST1.IDPESSOA) AND');
    Add('           (EF.DATAALTERFUNC = HST1.DATAALTERFUNC) AND');
    Add('           (EF.IDPESSOA      = HST2.IDPESSOA) AND');
    Add('           (EF.TRGDTINCLUSAO = HST2.DATAINCLUSAO)) HST');
    Add('      WHERE');
    Add('        (F.IDPESSOA = HST.IDPESSOA)) F');
    // -------------------------------------------------------------------------- //
    Add('  WHERE');
    Add('    (VT_COD.CODTABELA = ''SEGSOC'') AND');
    Add('    (VT_PER.CODTABELA = ''SEGSOC'') AND');
    Add('    (VT_COD.CODCAMPO  = ''CODIGO'') AND');
    Add('    (VT_PER.CODCAMPO  = ''PERC2'') AND');
    Add('    (VT_COD.VALOR     = TO_CHAR(F.IDTIPOTRAB)) AND');
    Add('    (VT_COD.NUMLINHA  = VT_PER.NUMLINHA) AND');
    Add('    (F.IDESTAB       IS NOT NULL)');
    Add('  GROUP BY');
    Add('    F.IDESTAB, VT_PER.VALOR) VAL_TAXA,');   }
    // -------------------------------------------------------------------------- //
    // NISS do Estabelecimento
    Add('  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, DO.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DO, FILIALPESSOA FP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''NISS:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO) AND');
    Add('         (FP.IDFILIALPESSOA  = DO.IDPESSOA)) DOC_NISS');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add(MontaLinhaSelSQL('  (FP.IDFILIALPESSOA', FListaIdEstab, 1));
    Add('  (FP.IDFILIALPESSOA  = PJ.IDPESSOA) AND');
//    Add('  (FP.IDFILIALPESSOA  = VAL_TAXA.IDESTAB) AND');
    Add('  (PJ.IDPESSOA        = DOC_NISS.IDPESSOA)');
    Add('ORDER BY');
    Add('  RAZAOSOCIAL');
    SaveToFile(DirTempLog + '\qryEstab.txt');
  end;
  IncProgresso('', CMTranslate('Selecionando dados do(s) Estabelecimento(s)...'), 0);
  FCdsEstab.Data := GetDataPacket(FSQL);
  IncProgresso(GetTempoDecorrido, '', 10);

  Result := not(FCdsEstab.IsEmpty);
  if not(Result) then
    MessageInfo := CMTranslateMsg(MSG_SEM_DADOS_ESTAB, [CR_LF]);
end;

function TCtrlParamDeclRemPortugalMagnetico.AbrirQueryTaxas: boolean;
begin
  case TTipoBDPadrao(iTipoBD_Padrao) of
    tbdOracle                      : GetSeparadorDecimalORACLE;
    tbdSQLServer, tbdSQLServerOdbc : SepDecORACLE := '.';
  end;

  with (FSQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  F.IDESTAB, F.IDTIPOTRAB,');
    Add('  TO_NUMBER(REPLACE(REPLACE(VT_PER.VALOR,'','',''.''),''.'',''' +SepDecORACLE+ ''')) AS TAXA');
    Add('FROM');
    Add('  VALTABGENER VT_COD, VALTABGENER VT_PER,');
    // -------------------------------------------------------------------------- //
    // Buscar do Histórico de EVOLFUNC
    Add('  (SELECT DISTINCT');
    Add('     F.IDTIPOTRAB,');
    Add('     HST.IDESTAB');
    Add('   FROM');
    Add('     FUNCIONARIO F,');
    Add('     (SELECT');
    Add('        EF.IDPESSOA, EF.IDESTAB');
    Add('      FROM');
    Add('        EVOLFUNC EF,');
    Add('        (SELECT IDPESSOA, MAX(DATAALTERFUNC) AS DATAALTERFUNC');
    Add('         FROM   EVOLFUNC');
    Add('         WHERE  (DATAALTERFUNC <= TO_DATE('+
      QuotedStr(FDataCompetencia)+ ',''DD/MM/YYYY''))');
    Add('         GROUP BY IDPESSOA) HST1,');
    Add('        (SELECT EV.IDPESSOA, MAX(EV.TRGDTINCLUSAO) AS DATAINCLUSAO');
    Add('         FROM   EVOLFUNC EV,');
    Add('                (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
    Add('                 FROM   EVOLFUNC');
    Add('                 WHERE  (DATAALTERFUNC <= TO_DATE('+
      QuotedStr(FDataCompetencia)+ ',''DD/MM/YYYY''))');
    Add('                 GROUP BY IDPESSOA) H');
    Add('         WHERE');
    Add('           (EV.IDPESSOA      = H.IDPESSOA) AND');
    Add('           (EV.DATAALTERFUNC = H.DATAALTERFUNC)');
    Add('         GROUP BY EV.IDPESSOA) HST2');
    Add('      WHERE');
    Add('        (EF.IDPESSOA      = HST1.IDPESSOA) AND');
    Add('        (EF.DATAALTERFUNC = HST1.DATAALTERFUNC) AND');
    Add('        (EF.IDPESSOA      = HST2.IDPESSOA) AND');
    Add('        (EF.TRGDTINCLUSAO = HST2.DATAINCLUSAO)) HST');
    Add('   WHERE');
    Add('     (F.IDPESSOA = HST.IDPESSOA)) F');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (VT_COD.CODTABELA = ''SEGSOC'') AND');
    Add('  (VT_PER.CODTABELA = ''SEGSOC'') AND');
    Add('  (VT_COD.CODCAMPO  = ''CODIGO'') AND');
    Add('  (VT_PER.CODCAMPO  = ''PERC2'') AND');
    Add('  (VT_COD.VALOR     = TO_CHAR(F.IDTIPOTRAB)) AND');
    Add('  (VT_COD.NUMLINHA  = VT_PER.NUMLINHA) AND');
    Add('  (F.IDESTAB       IS NOT NULL)');
    Add('GROUP BY');
    Add('  F.IDESTAB, F.IDTIPOTRAB, VT_PER.VALOR');
    Add('ORDER BY');
    Add('  F.IDESTAB, F.IDTIPOTRAB');
    SaveToFile(DirTempLog + '\qryTaxas.txt');
  end;
  IncProgresso('', CMTranslate('Selecionando Taxas...'), 0);
  FCdsTaxas.Data := GetDataPacket(FSQL);
  IncProgresso(GetTempoDecorrido, '', 5);

  Result := not(FCdsTaxas.IsEmpty);
  if not(Result) then
    MessageInfo := CMTranslateMsg(MSG_SEM_TAXAS, [CR_LF, CR_LF, CR_LF]);
end;

function TCtrlParamDeclRemPortugalMagnetico.AbrirQueryPessoal: boolean;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  F.IDESTAB,');
    Add('  F.IDPESSOA,');
    Add('  F.IDTIPOTRAB,');
    Add('  PF.NOME,');
    Add('  PESFIS.DATANASC,');
    Add('  DOC_NIF.NUM AS NIF');
    // -------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PF, PESSOAFISICA PESFIS, FUNCIONARIO F,');
    // -------------------------------------------------------------------- //
    // NIF da pessoa
    Add('  (SELECT DO.IDPESSOA, DO.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''NIF:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO)) DOC_NIF,');
    // -------------------------------------------------------------------- //
    // Somente as pessoas que tiveram Folha na competência
    Add('  (SELECT IDPESSOA');
    Add('   FROM   ' +FNomeTabela);
    Add('   WHERE' +MontaSelSQL('CODPROVDESC',FListaIdRubrica,2,1));
    if (FListaIdMotivo <> '') then
      Add(MontaSelSQL('IDMOTIVO',FListaIdMotivo,10,4));
    Add('          (MES          = ' +QuotedStr(FCompetencia)+ ')');
    Add('   GROUP BY IDPESSOA) HIST');
    // -------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (F.IDPESSOA = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA = PESFIS.IDPESSOA) AND');
    Add('  (F.IDPESSOA = DOC_NIF.IDPESSOA) AND');
    Add('  (F.IDPESSOA = HIST.IDPESSOA)');
    Add('ORDER BY');
    Add('  IDESTAB, NOME');
    SaveToFile(DirTempLog + '\qryPessoal.txt');
  end;
  IncProgresso('', CMTranslate('Selecionando dados das Pessoas...'), 0);
  FCdsPessoal.Data := GetDataPacket(FSQL);
  IncProgresso(GetTempoDecorrido, '', 20);

  Result := not(FCdsPessoal.IsEmpty);
  if not(Result) then
    MessageInfo := CMTranslateMsg(MSG_SEM_DADOS, [CR_LF]);
end;

function TCtrlParamDeclRemPortugalMagnetico.AbrirQueriesDosValores: boolean;

{->}function MontaLinhaNatureza(const ListaRub, Natureza: string): string;
    begin
      if (ListaRub = '') then
        Result := ''
      else
        Result :=
          '        WHEN'+
          MontaSelSQL('H.CODPROVDESC',ListaRub,1,1,false) +' THEN '+ QuotedStr(Natureza);
{->}end;

begin
  try
    // Valor das contribuições
    with (FSQL) do
    begin
      Clear;
      Add('SELECT');
      Add('  F.IDESTAB,');
      Add('  SUM(CASE');
      Add('        WHEN P.FLGDESCONTO = 1 THEN -H.VALORPROVENTO');
      Add('        ELSE H.VALORPROVENTO');
      Add('      END) AS VALOR');
      Add('FROM');
      Add('  ' +FNomeTabela+ ' H, PROVDESC P,');
      // -------------------------------------------------------------------------- //
      // Buscar do Histórico de EVOLFUNC
      Add('  (SELECT DISTINCT');
      Add('     F.IDPESSOA,');
      Add('     HST.IDESTAB');
      Add('   FROM');
      Add('     FUNCIONARIO F,');
      Add('     (SELECT');
      Add('        EF.IDPESSOA, EF.IDESTAB');
      Add('      FROM');
      Add('        EVOLFUNC EF,');
      Add('        (SELECT IDPESSOA, MAX(DATAALTERFUNC) AS DATAALTERFUNC');
      Add('         FROM   EVOLFUNC');
      Add('         WHERE  (DATAALTERFUNC <= TO_DATE('+
        QuotedStr(FDataCompetencia)+ ',''DD/MM/YYYY''))');
      Add('         GROUP BY IDPESSOA) HST1,');
      Add('        (SELECT EV.IDPESSOA, MAX(EV.TRGDTINCLUSAO) AS DATAINCLUSAO');
      Add('         FROM   EVOLFUNC EV,');
      Add('                (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
      Add('                 FROM   EVOLFUNC');
      Add('                 WHERE  (DATAALTERFUNC <= TO_DATE('+
        QuotedStr(FDataCompetencia)+ ',''DD/MM/YYYY''))');
      Add('                 GROUP BY IDPESSOA) H');
      Add('         WHERE');
      Add('           (EV.IDPESSOA      = H.IDPESSOA) AND');
      Add('           (EV.DATAALTERFUNC = H.DATAALTERFUNC)');
      Add('         GROUP BY EV.IDPESSOA) HST2');
      Add('      WHERE');
      Add('        (EF.IDPESSOA      = HST1.IDPESSOA) AND');
      Add('        (EF.DATAALTERFUNC = HST1.DATAALTERFUNC) AND');
      Add('        (EF.IDPESSOA      = HST2.IDPESSOA) AND');
      Add('        (EF.TRGDTINCLUSAO = HST2.DATAINCLUSAO)) HST');
      Add('   WHERE');
      Add('     (F.IDPESSOA = HST.IDPESSOA)) F');
      // -------------------------------------------------------------------------- //
      Add('WHERE');
      Add('  (H.MES          = ' +QuotedStr(FCompetencia)+ ') AND');
      Add(MontaSelSQL('H.CODPROVDESC',FRubricas.Contrib,2,1));
      if (FListaIdMotivo <> '') then
        Add(MontaSelSQL('IDMOTIVO',FListaIdMotivo,2,4));
      Add('  (H.IDRUBRICA    = P.IDPROVENTO) AND');
      Add('  (H.IDPESSOA     = F.IDPESSOA)');
      Add('GROUP BY');
      Add('  F.IDESTAB');
      SaveToFile(DirTempLog + '\qryContrib.txt');
    end;
    IncProgresso('', CMTranslate('Selecionando contribuições...'), 0);
    FCdsContrib.Data := GetDataPacket(FSQL);
    IncProgresso(GetTempoDecorrido, '', 40);

    // Valor dos Dias Trabalhados
    with (FSQL) do
    begin
      Clear;
      Add('SELECT');
      Add('  H.IDPESSOA,');
      Add('  SUM(CASE');
      Add('        WHEN P.FLGDESCONTO = 1 THEN -H.VALORPROVENTO');
      Add('        ELSE H.VALORPROVENTO');
      Add('      END) AS VALOR');
      Add('FROM');
      Add('  ' +FNomeTabela+ ' H, PROVDESC P');
      Add('WHERE');
      Add('  (H.MES          = ' +QuotedStr(FCompetencia)+ ') AND');
      Add(MontaSelSQL('H.CODPROVDESC',FRubricas.DiasTrab,2,1));
      Add(MontaSelSQL('H.IDMOTIVO',FListaIdMotivo,2,4));
      Add('  (H.IDRUBRICA    = P.IDPROVENTO)');
      Add('GROUP BY');
      Add('  H.IDPESSOA');
      SaveToFile(DirTempLog + '\qryDiasTrab.txt');
    end;
    IncProgresso('', CMTranslate('Selecionando dias trabalhados...'), 0);
    FCdsDiasTrab.Data := GetDataPacket(FSQL);
    IncProgresso(GetTempoDecorrido, '', 40);

    // Valor das remunerações
    with (FSQL) do
    begin
      Clear;
      Add('SELECT');
      Add('  HIST.IDPESSOA,');
      Add('  HIST.NATUREZA,');
      Add('  SUM(CASE');
      Add('        WHEN HIST.FLGDESCONTO = 1 THEN -HIST.VALORPROVENTO');
      Add('        ELSE HIST.VALORPROVENTO');
      Add('      END) AS VALOR');
      Add('FROM');
      Add('  (SELECT');
      Add('     H.IDPESSOA,');
      Add('     (CASE');
      with (FRubricas) do
      begin
        Add(MontaLinhaNatureza(Comiss, 'C'));
        Add(MontaLinhaNatureza(Ferias, 'F'));
        Add(MontaLinhaNatureza(Natal, 'N'));
        Add(MontaLinhaNatureza(RemPerm, 'P'));
        Add(MontaLinhaNatureza(OutrosSubsidios, 'X'));
        Add(MontaLinhaNatureza(DifVenc, 'O'));
        Add(MontaLinhaNatureza(ForcasArm, '1'));
        Add(MontaLinhaNatureza(RemVar, '2'));
        Add(MontaLinhaNatureza(FerPagas, '6'));
        Add(MontaLinhaNatureza(ExecTemp, '8'));
        Add(MontaLinhaNatureza(Promocoes, '9'));
      end;
      Add('      END) AS NATUREZA,');
      Add('     P.FLGDESCONTO,');
      Add('     H.VALORPROVENTO');
      Add('   FROM');
      Add('     ' +FNomeTabela+ ' H, PROVDESC P');
      Add('   WHERE');
      Add('     (H.MES          = ' +QuotedStr(FCompetencia)+ ') AND');
      Add(MontaSelSQL('H.CODPROVDESC',FListaIdRubrica,5,1));
      Add(MontaSelSQL('H.IDMOTIVO',FListaIdMotivo,5,4));
      Add('     (H.IDRUBRICA    = P.IDPROVENTO)) HIST');
      Add('GROUP BY');
      Add('  IDPESSOA, NATUREZA');
      SaveToFile(DirTempLog + '\qryValores.txt');
    end;
    IncProgresso('', CMTranslate('Selecionando valores...'), 0);
    FCdsValor.Data := GetDataPacket(FSQL);
    IncProgresso(GetTempoDecorrido, '', 40);

    Result := true;
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
end;

function TCtrlParamDeclRemPortugalMagnetico.ValidarCampo(Tipo: char; Dado: string;
  const Tamanho: word): string;
var
  sTemp: string;
  c: word;
begin
  Result := '';
  Tipo := UpCase(Tipo);
  if not(Tipo in ['A','N']) or (Tamanho <= 0) then
    exit;

  // Inicializar Variáveis
  sTemp := '';
  Tipo := UpCase(Tipo);
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

function TCtrlParamDeclRemPortugalMagnetico.GerarRegistroR0: string;
begin
  Result :=
    // 01 (01 até 02 / tam. 02) Tipo do registro
    'R0'+
    // 02 (03 até 08 / tam. 06) Modelo
    'RC4008'+
    // 03 (09 até 10 / tam. 02) Brancos
    '  '+
    // 04 (11 até 12 / tam. 02) Versão
    '01'+
    // 05 (13 até 118 / tam. 106) Brancos
    Replicate(' ',106);
end;

function TCtrlParamDeclRemPortugalMagnetico.GerarRegistroR1: string;
begin
  Result :=
    // 01 (01 até 02 / tam. 02) Tipo do registro
    'R1'+
    // 02 (03 até 13 / tam. 11) Número de Identificação da Segurança Social
    ValidarCampo('N', FCdsEstab.FieldByName('NISS').asString, 11)+
    // 03 (14 até 17 / tam. 04) Estabelecimento da Entidade Empregadora
    ValidarCampo('N', FCdsEstab.FieldByName('NUMFILIAL').asString, 4)+
    // 04 (18 até 26 / tam. 09) NIPC
    ValidarCampo('N', FCdsEstab.FieldByName('NIPC').asString, 9)+
    // 05 (27 até 92 / tam. 66) Razão Social da Entidade Empregadora
    ValidarCampo('A', FCdsEstab.FieldByName('RAZAOSOCIAL').asString, 66)+
    // 06 (93 até 98 / tam. 06) Mês de referência
    TiraBarra(FCompetencia)+
    // 07 (99 até 118 / tam. 20) Brancos
    Replicate(' ',20);
end;

function TCtrlParamDeclRemPortugalMagnetico.GerarRegistroR2: string;
begin
  FCdsDiasTrab.Filter := 'IDPESSOA = ' +FCdsPessoal.FieldByName('IDPESSOA').asString;
  FTotalRem := FTotalRem + FCdsValor.FieldByName('VALOR').asFloat;
  Inc(FNumRegR2);

  Result :=
    // 01 (01 até 02 / tam. 02) Tipo do registro
    'R2'+
    // 02 (03 até 13 / tam. 11) Número de Identificação da Segurança Social
    ValidarCampo('N', FCdsEstab.FieldByName('NISS').asString, 11)+
    // 03 (14 até 17 / tam. 04) Estabelecimento da Entidade Empregadora
    ValidarCampo('N', FCdsEstab.FieldByName('NUMFILIAL').asString, 4)+
    // 04 (18 até 28 / tam. 11) Número de Identificação da Segurança Social do Trabalhador
    ValidarCampo('N', FCdsPessoal.FieldByName('NIF').asString, 11)+
    // 05 (29 até 88 / tam. 60) Nome do trabalhador
    ValidarCampo('A', FCdsPessoal.FieldByName('NOME').asString, 60)+
    // 06 (89 até 96 / tam. 08) Data de nascimento
    ValidarCampo('N', TiraBarra(FCdsPessoal.FieldByName('DATANASC').asString), 8)+
    // 07 (97 até 102 / tam. 06) Mês de referência
    TiraBarra(FCompetencia)+
    // 08 (103 até 105 / tam. 03) Dias de Trabalho
    ValidarCampo('N', FormatFloat('####0.0', FCdsDiasTrab.FieldByName('VALOR').asFloat), 3)+
    // 09 (106 até 106 / tam. 01) Sinal dos Dias de Trabalho
    IFF(FCdsDiasTrab.FieldByName('VALOR').asFloat < 0, '-', '0')+
    // 10 (107 até 108 / tam. 02) Natureza do Valor
    ValidarCampo('A', FCdsValor.FieldByName('NATUREZA').asString, 2)+
    // 11 (109 até 117 / tam. 09) Valor
    ValidarCampo('N', FormatFloat('#########0.00', FCdsValor.FieldByName('VALOR').asFloat), 9)+
    // 12 (118 até 118 / tam. 01) Sinal do valor
    IFF(FCdsValor.FieldByName('VALOR').asFloat < 0, '-', '0');
end;

function TCtrlParamDeclRemPortugalMagnetico.GerarRegistroR3: string;
begin
  FCdsContrib.Filter := 'IDESTAB = ' +FCdsEstab.FieldByName('IDPESSOA').asString;

  Result :=
    // 01 (01 até 02 / tam. 02) Tipo do registro
    'R3'+
    // 02 (03 até 13 / tam. 11) Número de Identificação da Segurança Social
    ValidarCampo('N', FCdsEstab.FieldByName('NISS').asString, 11)+
    // 03 (14 até 17 / tam. 04) Estabelecimento da Entidade Empregadora
    ValidarCampo('N', FCdsEstab.FieldByName('NUMFILIAL').asString, 4)+
    // 04 (18 até 28 / tam. 11) Noves
    Replicate('0',11)+
    // 05 (29 até 42 / tam. 14) Valor Total
    ValidarCampo('N', FormatFloat('#########0.00', FTotalRem), 14)+
    // 06 (43 até 43 / tam. 01) Sinal do Valor Total
    IFF(FTotalRem < 0, '-', '0')+
    // 07 (44 até 55 / tam. 14) Valor Total das Contribuições
    ValidarCampo('N', FormatFloat('#########0.00', FCdsContrib.FieldByName('VALOR').asFloat), 14)+
    // 08 (56 até 56 / tam. 01) Sinal do Valor Total das Contribuições
    IFF(FCdsContrib.FieldByName('VALOR').asFloat < 0, '-', '0')+
    // 09 (57 até 60 / tam. 04) Taxa contributiva
    ValidarCampo('N', FormatFloat('#####0.00',
      StrFloat(FCdsTaxas.FieldByName('TAXA').asString)), 4)+
    // 10 (61 até 66 / tam. 06) Total de registos com TIPREG = R2
    ValidarCampo('N', IntToStr(FNumRegR2), 6);
end;

procedure TCtrlParamDeclRemPortugalMagnetico.ProximaPessoa;
begin
  FCdsPessoal.Next;

  if (FDeslocamentoAtual = FNumDeslocamentos) then
  begin
    IncProgresso(GetTempoDecorrido, '', 1);
    FDeslocamentoAtual := 0;
  end
  else
    Inc(FDeslocamentoAtual);
end;

function TCtrlParamDeclRemPortugalMagnetico.ProcessarGeracao(const IdEmpresa: integer;
  const MesRef, AnoRef: integer; const Previa: boolean; const ListaIdEstab,
  ListaCodCentroCusto, ListaIdMotivo, ListaRubricaComiss, ListaRubricaFerias,
  ListaRubricaNatal, ListaRubricaRemPerm, ListaRubricaOutrosSubsidios, ListaRubricaDifVenc,
  ListaRubricaForcasArm, ListaRubricaRemVar, ListaRubricaFerPagas, ListaRubricaExecTemp,
  ListaRubricaPromocoes, ListaRubricaContrib, ListaRubricaDiasTrab: string): boolean;
begin
  try
    Result := false;
    FHoraIni := Time;

    FCdsEstab := TCMClientDataSet.Create(nil);
    FCdsTaxas := TCMClientDataSet.Create(nil);
    FCdsPessoal := TCMClientDataSet.Create(nil);
    FCdsValor := TCMClientDataSet.Create(nil);
    FCdsContrib := TCMClientDataSet.Create(nil);
    FCdsDiasTrab := TCMClientDataSet.Create(nil);

    FCdsTaxas.Filtered := true;
    FCdsPessoal.Filtered := true;
    FCdsValor.Filtered := true;
    FCdsContrib.Filtered := true;
    FCdsDiasTrab.Filtered := true;

    FCompetencia := IntToStr(AnoRef) +'/'+ PoeZero(MesRef);
    FDataCompetencia :=
      PoeZero(TrazUltDiaMes(MesRef, AnoRef)) +'/'+ PoeZero(MesRef) +'/'+ IntToStr(AnoRef);

    if (Previa) then
      FNomeTabela := 'PREVIAFOLPAG'
    else
      FNomeTabela := 'HISTRUBSAL';
      
    FIdEmpresa := IdEmpresa;
    FListaIdEstab := ListaIdEstab;
    FListaCodCentroCusto := ListaCodCentroCusto;
    FListaIdMotivo := ListaIdMotivo;

    with (FRubricas) do
    begin
      Comiss := QuotedListaString(ListaRubricaComiss,',');
      Ferias := QuotedListaString(ListaRubricaFerias,',');
      Natal := QuotedListaString(ListaRubricaNatal,',');
      RemPerm := QuotedListaString(ListaRubricaRemPerm,',');
      OutrosSubsidios := QuotedListaString(ListaRubricaOutrosSubsidios,',');
      DifVenc := QuotedListaString(ListaRubricaDifVenc,',');
      ForcasArm := QuotedListaString(ListaRubricaForcasArm,',');
      RemVar := QuotedListaString(ListaRubricaRemVar,',');
      FerPagas := QuotedListaString(ListaRubricaFerPagas,',');
      ExecTemp := QuotedListaString(ListaRubricaExecTemp,',');
      Promocoes := QuotedListaString(ListaRubricaPromocoes,',');
      Contrib := QuotedListaString(ListaRubricaContrib,',');
      DiasTrab := QuotedListaString(ListaRubricaDiasTrab,',');

      FListaIdRubrica := '';
      InserirCodigoEm(FListaIdRubrica, Comiss);
      InserirCodigoEm(FListaIdRubrica, Ferias);
      InserirCodigoEm(FListaIdRubrica, Natal);
      InserirCodigoEm(FListaIdRubrica, RemPerm);
      InserirCodigoEm(FListaIdRubrica, OutrosSubsidios);
      InserirCodigoEm(FListaIdRubrica, DifVenc);
      InserirCodigoEm(FListaIdRubrica, ForcasArm);
      InserirCodigoEm(FListaIdRubrica, RemVar);
      InserirCodigoEm(FListaIdRubrica, FerPagas);
      InserirCodigoEm(FListaIdRubrica, ExecTemp);
      InserirCodigoEm(FListaIdRubrica, Promocoes);
      InserirCodigoEm(FListaIdRubrica, Contrib);
      InserirCodigoEm(FListaIdRubrica, DiasTrab);
    end;

    FArq.Text := '';
    try
      // Montar Query com informações dos Estabelecimentos 
      if not(AbrirQueryEstabelecimento) or not(AbrirQueryTaxas) then
      begin
        Result := true;
        raise Exception.Create(MessageInfo);
      end;

      // Montar Queries com informações das pessoas
      if not(AbrirQueryPessoal) or not(AbrirQueriesDosValores) then
      begin
        Result := true;
        raise Exception.Create(MessageInfo);
      end;

      // Para que a barra de progressos seja incrementada, será preciso passar por N registros
      // dentro dos 30% restantes do processo.
      // Ex(1): 200 registros divididos por 30 é igual a aproximadamente 7
      // Isto quer dizer que a cada 7 registros o progresso será incrementado
      FNumDeslocamentos := (FCdsPessoal.RecordCount div 30);
      FDeslocamentoAtual := 0;

      // Processar dados para a geração do arquivo
      IncProgresso(GetTempoDecorrido, CMTranslate('Processando Dados...'), 0);

      // Registro Header do Arquivo
      FArq.Add(GerarRegistroR0);
      IncProgresso(GetTempoDecorrido, '', 0);

      // Geração do subarquivo de todos os estabelecimentos selecionados
      repeat
        FCdsTaxas.Filter := 'IDESTAB = ' +FCdsEstab.FieldByName('IDPESSOA').asString;
        FCdsTaxas.First;
        // Geração do subarquivo de todas as Taxas dos estabelecimentos selecionados
        repeat
          FCdsPessoal.Filter :=
            'IDESTAB = ' +FCdsEstab.FieldByName('IDPESSOA').asString +' AND '+
            'IDTIPOTRAB = ' +FCdsTaxas.FieldByName('IDTIPOTRAB').asString;
          if not(FCdsPessoal.IsEmpty) then
          begin
            // Registro Header do Estabelecimento
            FArq.Add(GerarRegistroR1);
            IncProgresso(GetTempoDecorrido, '', 0);

            FTotalRem := 0;
            FNumRegR2 := 0;

            // Registro das Remunerações dos Trabalhadores
            FCdsPessoal.First;
            repeat
              FCdsValor.Filter := 'IDPESSOA = ' +FCdsPessoal.FieldByName('IDPESSOA').asString;
              FCdsValor.First;
              while not(FCdsValor.EOF) do
              begin
                FArq.Add(GerarRegistroR2);
                FCdsValor.Next;
              end;      
              ProximaPessoa;
            until (FCdsPessoal.EOF);

            // Registro de Totais do Estabelecimento x Taxa
            FArq.Add(GerarRegistroR3);
          end;
          FCdsTaxas.Next;
        until (FCdsTaxas.EOF);

        FCdsEstab.Next;
      until (FCdsEstab.EOF);

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
    FreeObject(FCdsEstab,true);
    FreeObject(FCdsTaxas,true);
    FreeObject(FCdsPessoal,true);
    FreeObject(FCdsValor,true);
    FreeObject(FCdsContrib);
    FreeObject(FCdsDiasTrab);
  end;
end;

end.
