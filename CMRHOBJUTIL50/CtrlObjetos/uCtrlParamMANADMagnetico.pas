unit uCtrlParamMANADMagnetico;

interface

uses Classes, SysUtils, Controls, DB, DBClient, uCmControlObject, uCmDbObject, IvDictio,
  uCMTranslate, uCmClientDataSet, uCMTypes, uCtrlCustomRH;

// Hierarquia dos registros a serem usados:
//->[Bloco 0]
//  |->(0000)
//  |->(0001)
//  |->(0990)
//
//->[Bloco K]
//  |->(K001)
//  |->(K050)
//  |->(K100)
//  |->(K150)
//  |->(K200)
//  |->(K250)
//  |->(K300)
//  |->(K990)
//
//->[Bloco 9]
//  |->(9001)
//  |->(9900)
//  |->(9990)
//  |->(9999)

const
  NUM_REGISTROS = 11;
  NOME_CAMPO: array [1..NUM_REGISTROS] of string = (
    '0000','0001','0990','K001','K050','K100','K150','K200','K250','K300','K990');

type
  TOnProgMANADMagnetico = procedure (const TempoAtual, Mensagem: string;
    const Incremento: integer) of object;

  TCtrlParamMANADMagnetico = class(TCtrlCustomRH)
  protected
    FCdsEstab: TCMClientDataSet;
    FCdsPessoa: TCMClientDataSet;
    FCdsCCusto: TCMClientDataSet;
    FCdsRub: TCMClientDataSet;
    FCdsContabFolha: TCMClientDataSet;
    FCdsHistRubSal: TCMClientDataSet;

    FArq: TStringList;
    FQuantReg: array [1..NUM_REGISTROS] of integer;

    FHoraIni: TTime; // Hora inicial do processamento

    FIdMotivo: integer;
    FIdPessoa: double;
    FMesAtual: string;

    FListaIdEstab: string;
    FDeParaTipoFolha: string;
    FAnoMesIni: string;
    FAnoMesFin: string;

    FCodFinalidade: integer;
    FNumRegBloco: integer;

    FDataIni: TDate;
    FDataFin: TDate;
  private
    FOnProgMANADMagnetico: TOnProgMANADMagnetico;

    FTempoDecorridoTotal: string;

    procedure IncProgresso(const TempoAtual, Mensagem: string; const Incremento: integer);
    function  GetTempoDecorrido(Extendido: boolean = false): string;

    function  AbrirQueryEstab: boolean;
    function  AbrirQueryPessoa: boolean;
    function  AbrirQueryCCusto: boolean;
    function  AbrirQueryRub(const IdEmpresa: integer): boolean;
    function  AbrirQueryContabFolha(const IdEmpresa: integer): boolean;
    procedure AbrirQueryHistRubSal(const IdPessoa: double);

    function ValidarValorCampo(Tipo: char; Dado: string; const Tamanho: word = 0): string;
    function GetDeParaTipoFolha(const IdMotivo: string): string;
    function GetIndBaseIRRF(const IdRubrica: double): string;
    function GetIndBaseINSS(const IdRubrica: double): string;

    // Bloco 0
    function GerarReg0000: string;
    function GerarReg0001: string;
    function GerarReg0990: string;
    // Bloco K
    function GerarRegK001: string;
    function GerarRegK050: string;
    function GerarRegK100: string;
    function GerarRegK150: string;
    function GerarRegK200: string;
    function GerarRegK250: string;
    function GerarRegK300: string;
    function GerarRegK990: string;

    // Bloco 9
    function GerarReg9001: string;
    function GerarReg9900: string;
    function GerarReg9990: string;
    function GerarReg9999: string;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function GerarArquivo(const IdEmpresa: integer; const ListaIdEstab,
      DeParaTipoFolha: string; const MesIni, AnoIni, MesFin, AnoFin,
      CodFinalidade: integer): boolean;

    property DadosArquivo: TStringList read FArq;
    property TempoDecorridoTotal: string read FTempoDecorridoTotal;
    property OnProgresso: TOnProgMANADMagnetico read FOnProgMANADMagnetico write FOnProgMANADMagnetico;
  end;

implementation

uses uCtrlFuncoesRH;

const
  SEP_CAMPO = #124; // Caracter separador dos campos: "|"

{ TCtrlParamMANADMagnetico }

constructor TCtrlParamMANADMagnetico.Create;
begin
  inherited;
  FCdsEstab := TCMClientDataSet.Create(nil);
  FCdsPessoa := TCMClientDataSet.Create(nil);
  FCdsCCusto := TCMClientDataSet.Create(nil);
  FCdsRub := TCMClientDataSet.Create(nil);
  FCdsHistRubSal := TCMClientDataSet.Create(nil);
  FCdsContabFolha := TCMClientDataSet.Create(nil);

  FArq := TStringList.Create;
end;

destructor TCtrlParamMANADMagnetico.Destroy;
begin
  FCdsEstab.Free;
  FCdsPessoa.Free;
  FCdsCCusto.Free;
  FCdsRub.Free;
  FCdsHistRubSal.Free;
  FCdsContabFolha.Free;

  FArq.Free;
  inherited;
end;

procedure TCtrlParamMANADMagnetico.IncProgresso(const TempoAtual, Mensagem: string;
  const Incremento: integer);
begin
  if Assigned(OnProgresso) then
    OnProgresso(TempoAtual, Mensagem, Incremento);
end;

function TCtrlParamMANADMagnetico.GetTempoDecorrido(Extendido: boolean): string;
begin
  if (Extendido) then
    Result := HoraPorExtenso(Time - FHoraIni)
  else
    Result := FormatDateTime('hh:mm:ss', Time - FHoraIni);
end;

function TCtrlParamMANADMagnetico.AbrirQueryEstab: boolean;
begin
  IncProgresso('', CMTranslate('Selecionando Estabelecimentos...'), 0);
  FCdsEstab.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  PJ.IDPESSOA,' +CR_LF+
    '  PJ.RAZAOSOCIAL AS RAZAO,' +CR_LF+
    '  DOC_CNPJ.NUM AS CNPJ,' +CR_LF+
    '  DOC_CEI.NUM AS CEI,' +CR_LF+
    '  DOC_ESTADUAL.NUM AS INSCRICAO_ESTADUAL,' +CR_LF+
    '  DOC_MUNICIPAL.NUM AS INSCRICAO_MUNICIPAL,' +CR_LF+
    '  DOC_SUFRAMA.NUM AS SUFRAMA,' +CR_LF+
    '  ES.CODESTADO AS UF,' +CR_LF+
    '  RTRIM(CI.CODMUNICIPIO) AS COD_MUNICIPIO,' +CR_LF+
    '  NVL(FP.INDTIPOEMPRESA,0) AS COD_CENTRALIZACAO' +CR_LF+
    // -------------------------------------------------------------------------- //
    'FROM' +CR_LF+
    '  PESSOA PJ, ENDPESS E, CIDADES CI, ESTADO ES, FILIALPESSOA FP,' +CR_LF+
    // -------------------------------------------------------------------------- //
    // CNPJ do Estabelecimento
    '  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, DO.NUMDOCUMENTO AS NUM' +CR_LF+
    '   FROM   DOCPESSOA DO, FILIALPESSOA FP, TIPODOCOFICIAL TDO' +CR_LF+
    '   WHERE ((TDO.SIGLADOCUMENTO = ''CGC:'') OR' +CR_LF+
    '          (TDO.SIGLADOCUMENTO = ''CNPJ:'')) AND' +CR_LF+
    '         (TDO.IDDOCUMENTO     = DO.IDDOCUMENTO) AND' +CR_LF+
    '         (FP.IDFILIALPESSOA   = DO.IDPESSOA)) DOC_CNPJ,' +CR_LF+
    // -------------------------------------------------------------------------- //
    // CEI do Estabelecimento
    '  (SELECT FP.IDFILIALPESSOA AS IDPESSOA, DO.NUMDOCUMENTO AS NUM' +CR_LF+
    '   FROM   DOCPESSOA DO, FILIALPESSOA FP, TIPODOCOFICIAL TDO' +CR_LF+
    '   WHERE (TDO.SIGLADOCUMENTO = ''CEI:'') AND' +CR_LF+
    '         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO) AND' +CR_LF+
    '         (FP.IDFILIALPESSOA  = DO.IDPESSOA)) DOC_CEI,' +CR_LF+
    // ------------------------------------------------------------------------------- //
    // Inscrição Estadual do Estabelecimento
    '  (SELECT DO.IDPESSOA, DO.NUMDOCUMENTO AS NUM' +CR_LF+
    '   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO' +CR_LF+
    '   WHERE (TDO.SIGLADOCUMENTO = ''ESTADUAL:'') AND' +CR_LF+
    '         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO)) DOC_ESTADUAL,' +CR_LF+
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal do Estabelecimento
    '  (SELECT DO.IDPESSOA, DO.NUMDOCUMENTO AS NUM' +CR_LF+
    '   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO' +CR_LF+
    '   WHERE (TDO.SIGLADOCUMENTO = ''MUNICIPAL:'') AND' +CR_LF+
    '         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO)) DOC_MUNICIPAL,' +CR_LF+
    // -------------------------------------------------------------------------- //
    // SUFRAMA do Estabelecimento
    '  (SELECT DO.IDPESSOA, DO.NUMDOCUMENTO AS NUM' +CR_LF+
    '   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO' +CR_LF+
    '   WHERE (TDO.SIGLADOCUMENTO = ''SUFRAMA:'') AND' +CR_LF+
    '         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO)) DOC_SUFRAMA' +CR_LF+
    // -------------------------------------------------------------------------- //
    'WHERE' +CR_LF+
    MontaLinhaSelSQL('  (FP.IDFILIALPESSOA', FListaIdEstab, 1) +CR_LF+
    '  (FP.IDFILIALPESSOA  = PJ.IDPESSOA) AND' +CR_LF+
    '  (PJ.IDENDCOMERCIAL  = E.IDENDERECO) AND' +CR_LF+
    '  (PJ.IDPESSOA        = E.IDPESSOA) AND' +CR_LF+
    '  (E.IDCIDADES        = CI.IDCIDADES) AND' +CR_LF+
    '  (CI.IDESTADO        = ES.IDESTADO) AND' +CR_LF+
    '  (PJ.IDPESSOA        = DOC_CNPJ.IDPESSOA(+)) AND' +CR_LF+
    '  (PJ.IDPESSOA        = DOC_CEI.IDPESSOA(+)) AND' +CR_LF+
    '  (PJ.IDPESSOA        = DOC_ESTADUAL.IDPESSOA(+)) AND' +CR_LF+
    '  (PJ.IDPESSOA        = DOC_MUNICIPAL.IDPESSOA(+)) AND' +CR_LF+
    '  (PJ.IDPESSOA        = DOC_SUFRAMA.IDPESSOA(+))' +CR_LF+
    'ORDER BY' +CR_LF+
    '  CNPJ, CEI');
  IncProgresso(GetTempoDecorrido, '', 5);

  Result := not(FCdsEstab.IsEmpty);
  if not(Result) then
    MessageInfo := CMTranslate('Nenhum Estabelecimento selecionado.');
end;

function TCtrlParamMANADMagnetico.AbrirQueryPessoa: boolean;
begin
  IncProgresso('', CMTranslate('Selecionando Pessoas...'), 0);
  FCdsPessoa.Filtered := true;
  FCdsPessoa.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  F.IDESTAB,' +CR_LF+
    '  P.IDPESSOA,' +CR_LF+
    '  P.NOME,' +CR_LF+
    '  F.MATRICULA,' +CR_LF+
    '  F.TRGDTINCLUSAO AS DATA_INCLUSAO,' +CR_LF+
    '  DOC_CPF.NUM AS CPF,' +CR_LF+
    '  DOC_NIT.NUM AS NIT,' +CR_LF+
    '  F.IDCATEMPRGRE,' +CR_LF+
    '  PF.DATANASC,' +CR_LF+
    '  F.DATAADMISSAO,' +CR_LF+
    '  F.DATADESLIGAMENTO,' +CR_LF+
    '  F.CODCENTROCUSTO,' +CR_LF+
    '  NVL(F.IDSITRISCO,-1) AS OCORRENCIA,' +CR_LF+
    '  C.CBO2002 AS CBO,' +CR_LF+
    '  C.TITULO AS CARGO,' +CR_LF+
    '  PF.NUMDEPIRRF,' +CR_LF+
    '  PF.NUMDEPSALF' +CR_LF+
    // -------------------------------------------------------------------------- //
    'FROM' +CR_LF+
    '  PESSOA P, PESSOAFISICA PF, FUNCIONARIO F, CARGO C,' +CR_LF+
    // ------------------------------------------------------------------------------- //
    // CPF
    '  (SELECT DO.IDPESSOA, DO.NUMDOCUMENTO AS NUM' +CR_LF+
    '   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO' +CR_LF+
    '   WHERE (TDO.SIGLADOCUMENTO = ''CPF:'') AND' +CR_LF+
    '         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO)) DOC_CPF,' +CR_LF+
    // -------------------------------------------------------------------------- //
    // NIT
    '  (SELECT DO.IDPESSOA, DO.NUMDOCUMENTO AS NUM' +CR_LF+
    '   FROM   DOCPESSOA DO, TIPODOCOFICIAL TDO' +CR_LF+
    '   WHERE (TDO.SIGLADOCUMENTO = ''NIT:'') AND' +CR_LF+
    '         (TDO.IDDOCUMENTO    = DO.IDDOCUMENTO)) DOC_NIT' +CR_LF+
    // -------------------------------------------------------------------------- //
    'WHERE' +CR_LF+
    MontaLinhaSelSQL('  (F.IDESTAB', FListaIdEstab, 1) +CR_LF+
    '  (F.IDPESSOA = PF.IDPESSOA) AND' +CR_LF+
    '  (F.IDPESSOA = P.IDPESSOA) AND' +CR_LF+
    '  (F.IDCARGO  = C.IDCARGO) AND' +CR_LF+
    '  (P.IDPESSOA = DOC_CPF.IDPESSOA(+)) AND' +CR_LF+
    '  (P.IDPESSOA = DOC_NIT.IDPESSOA(+))' +CR_LF+
    'ORDER BY' +CR_LF+
    '  IDESTAB, NOME');
  IncProgresso(GetTempoDecorrido, '', 15);

  Result := not(FCdsPessoa.IsEmpty);
  if not(Result) then
    MessageInfo := CMTranslate('Nenhuma Pessoa selecionada.');
end;

function TCtrlParamMANADMagnetico.AbrirQueryCCusto: boolean;
begin
  IncProgresso('', CMTranslate('Selecionando Centros de Custo...'), 0);
  FCdsCCusto.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  CODCENTROCUSTO, NOME, TRGDTINCLUSAO' +CR_LF+
    'FROM' +CR_LF+
    '  CENTCUST' +CR_LF+
    'WHERE' +CR_LF+
    '  (ATIVO = ''S'')' +CR_LF+
    'ORDER BY' +CR_LF+
    '  CODCENTROCUSTO');
  IncProgresso(GetTempoDecorrido, '', 5);

  Result := not(FCdsCCusto.IsEmpty);
  if not(Result) then
    MessageInfo := CMTranslate('Nenhum Centro de Custo selecionado.');
end;

function TCtrlParamMANADMagnetico.AbrirQueryRub(const IdEmpresa: integer): boolean;
begin
  IncProgresso('', CMTranslate('Selecionando Rubricas...'), 0);
  FCdsRub.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  RP.IDRUBRICA,' +CR_LF+
    '  RP.CODPROVDESC,' +CR_LF+
    '  RP.DESCRPROVDESC,' +CR_LF+
    '  RP.TRGDTINCLUSAO,' +CR_LF+
    '  DECODE(PD.FLGDESCONTO,' +CR_LF+
    '    0, ''P'',' +CR_LF+
    '    1, ''D'',' +CR_LF+
    '    ''O''' +CR_LF+
    '  ) AS TIPO_RUB,' +CR_LF+
    '  PD.CODRUBCLT' +CR_LF+
    'FROM' +CR_LF+
    '  RUBRICAXPESS RP, PROVDESC PD' +CR_LF+
    'WHERE' +CR_LF+
    '  (RP.IDPESSOA       = ' +FloatToStr(IdEmpresa)+ ') AND' +CR_LF+
    '  (PD.FLGCONSTAFOLHA = 1) AND' +CR_LF+
    '  (RP.IDRUBRICA      = PD.IDPROVENTO)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  DESCRPROVDESC');
  IncProgresso(GetTempoDecorrido, '', 5);

  Result := not(FCdsCCusto.IsEmpty);
  if not(Result) then
    MessageInfo := CMTranslate('Nenhuma Rubrica selecionada.');
end;

function TCtrlParamMANADMagnetico.AbrirQueryContabFolha(const IdEmpresa: integer): boolean;
begin
  IncProgresso('', CMTranslate('Selecionando Param. Contab...'), 0);
  FCdsContabFolha.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  RP.CODPROVDESC,' +CR_LF+
    '  CF.CODCENTROCUSTO,' +CR_LF+
    '  CF.CONTADEBITO,' +CR_LF+
    '  CF.CONTACREDITO,' +CR_LF+
    '  CF.TRGDTINCLUSAO' +CR_LF+
    'FROM' +CR_LF+
    '  RUBRICAXPESS RP, CONTABFOLHA CF' +CR_LF+
    'WHERE' +CR_LF+
    '  (RP.IDPESSOA  = ' +FloatToStr(IdEmpresa)+ ') AND' +CR_LF+
    '  (RP.IDRUBRICA = CF.IDPROVENTO)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  CODPROVDESC');
  IncProgresso(GetTempoDecorrido, '', 5);

  Result := not(FCdsCCusto.IsEmpty);
  if not(Result) then
    MessageInfo := CMTranslate('Nenhuma Parametrização Contábil selecionada.');
end;

procedure TCtrlParamMANADMagnetico.AbrirQueryHistRubSal(const IdPessoa: double);
begin
  FCdsHistRubSal.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  IDPESSOA,' +CR_LF+
    '  IDRUBRICA,' +CR_LF+
    '  CODPROVDESC,' +CR_LF+
    '  VALORPROVENTO,' +CR_LF+
    '  DATAPAGAMENTO,' +CR_LF+
    '  IDMOTIVO,' +CR_LF+
    '  MES' +CR_LF+
    'FROM' +CR_LF+
    '  HISTRUBSAL' +CR_LF+
    'WHERE' +CR_LF+
    '  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    IFF(FAnoMesIni=FAnoMesFin,
      '  (MES      = ' +QuotedStr(FAnoMesIni)+ ')',
      '  (MES     >= ' +QuotedStr(FAnoMesIni)+ ') AND' +CR_LF+
      '  (MES     <= ' +QuotedStr(FAnoMesFin)+ ')') +CR_LF+
    'ORDER BY' +CR_LF+
    '  IDMOTIVO, CODPROVDESC');
end;

function TCtrlParamMANADMagnetico.ValidarValorCampo(Tipo: char; Dado: string;
  const Tamanho: word): string;
var
  sTemp: string;
  c: word;
begin
  Result := '';
  Tipo := UpCase(Tipo);
  if not(Tipo in ['C','N']) then
    exit;

  Dado := Trim(Dado);
  // ******************************
  // Faz tratamento das informações
  // ******************************
  if (Tipo = 'C') then // C = Campos alfanuméricos
  begin
    // Retirar todos os caracteres não-alfanuméricos
    for c:=1 to Length(Dado) do
    begin
      if ((Tamanho > 0) and (c > Tamanho)) or ((Tamanho = 0) and (c > 255)) then
        break;

      if (Dado[c] in [#32..#123,#125..#255]) then
        sTemp := sTemp + Dado[c];
    end;
  end
  else // N = Campos Numéricos
  begin
    // Retirar todos os caracteres não-numéricos
    for c:=1 to Length(Dado) do
      if (Dado[c] in ['0'..'9',',']) then
        sTemp := sTemp + Dado[c];
  end;
  Result := sTemp;
end;

function TCtrlParamMANADMagnetico.GetDeParaTipoFolha(const IdMotivo: string): string;
var
  iPos: integer;
  sDeParaTipoFolha, sValorAtual: string;

{->}procedure SetResultPadrao;
    begin
      if (Result = '') then
        Result := '6';
{->}end;

begin
  Result := '';
  sDeParaTipoFolha := FDeParaTipoFolha;
  while (sDeParaTipoFolha <> '') do
  begin
    ExtraiString(sDeParaTipoFolha, sValorAtual, ',');
    iPos := Pos('=', sValorAtual);
    if (Copy(sValorAtual, iPos+1, Length(sValorAtual)-iPos) = IdMotivo) then
    begin
      Result := Copy(sValorAtual, 1, iPos-1);
      SetResultPadrao;
      break;
    end;
  end;
  SetResultPadrao;
end;

function TCtrlParamMANADMagnetico.GetIndBaseIRRF(const IdRubrica: double): string;
var
  sCodRubCLT: string;
begin
  sCodRubCLT := FCdsRub.FieldByName('CODRUBCLT').asString;
  // 60026 - Valor da base do IRRF
  // 60027 - Valor da base do IRRF (sal. maternidade)
  // 60028 - Valor da base do IRRF (ad. férias)
  // 60057 - Valor da base de abatimento do IRRF
  // 60422 - Valor da base do IRRF-diferença salarial
  // 62026 - Valor da base do IRRF do 13 salário
  if (sCodRubCLT = '60026') then
    Result := '1' // Base de cálculo salário mensal
  else
  if (sCodRubCLT = '62026') then
    Result := '2' // Base de cálculo 13º Salário
  else
  if (sCodRubCLT = '60027') or (sCodRubCLT = '60028') or
     (sCodRubCLT = '60057') or (sCodRubCLT = '60422') then
    Result := '9' // Outras bases de cálculo
  else
  if (sCodRubCLT = '60026') then
    Result := '3'; // Não é base de cálculo
end;

function TCtrlParamMANADMagnetico.GetIndBaseINSS(const IdRubrica: double): string;
var
  sCodRubCLT: string;
begin
  sCodRubCLT := FCdsRub.FieldByName('CODRUBCLT').asString;
  // 60015 - Valor da base do inss do sal. mat.
  // 60017 - Valor da base do inss (ad. de férias)
  // 60025 - Valor da base do inss
  // 60054 - Valor da base a abater do inss (p saúde)
  // 60055 - Valor da base a abater do inss-educação
  // 60056 - Valor da base de abatimento do inss
  // 60421 - Valor da base do inss-diferença salarial
  // 62016 - Valor da base do inss do 13 salário
  // 50035 - Valor descontado do segurado
  // 40573 - Valor do salário família

  // 6 –> Base de cálculo exclusiva FGTS
  // 7 –> Reduções da base de cálculo
  if (sCodRubCLT = '60025') then
    Result := '1' // Base de cálculo do Salário de Contribuição mensal
  else
  if (sCodRubCLT = '62016') then
    Result := '2' // Base de cálculo do 13º salário
  else
  if (sCodRubCLT = '50035') then
    Result := '3' // Refere-se a valor descontado do segurado
  else
  if (sCodRubCLT = '40573') then
    Result := '4' // Refere-se a valor pago de Salário Família
  else
  if (sCodRubCLT = '40570') then
    Result := '5' // Base de cálculo do Salário-Maternidade
  else
  if (sCodRubCLT = '60015') or (sCodRubCLT = '60017') or (sCodRubCLT = '60054') or
     (sCodRubCLT = '60055') or (sCodRubCLT = '60056') or (sCodRubCLT = '60421') then
    Result := '9' // Outras bases de cálculo
  else
    Result := '8'; // Não é base de cálculo
end;

function TCtrlParamMANADMagnetico.GerarReg0000: string;
begin
  // *****************************************************************************
  // Registro Tipo 0000 (Abertura do arquivo e identificação dos estabelecimentos)
  // *****************************************************************************
  Result :=
    // 01 - Tipo do Registro
    '0000' +SEP_CAMPO+
    // 02 - Nome empresarial do contribuinte
    ValidarValorCampo('C', FCdsEstab.FieldByName('RAZAO').asString) +SEP_CAMPO+
    // 03 - CNPJ do contribuinte
    ValidarValorCampo('N', FCdsEstab.FieldByName('CNPJ').asString,14) +SEP_CAMPO+
    // 04 - CPF do contribuinte (NÃO INFORMADO)
    SEP_CAMPO+
    // 05 - CEI do contribuinte
    ValidarValorCampo('N', FCdsEstab.FieldByName('CEI').asString,12) +SEP_CAMPO+
    // 06 - NIT do contribuinte (NÃO INFORMADO)
    SEP_CAMPO+
    // 07 - UF
    ValidarValorCampo('C', FCdsEstab.FieldByName('UF').asString,2) +SEP_CAMPO+
    // 08 - Inscrição Estadual do contribuinte
    ValidarValorCampo('C', FCdsEstab.FieldByName('INSCRICAO_ESTADUAL').asString) +SEP_CAMPO+
    // 09 - Código do município do domicílio fiscal do contribuinte
    ValidarValorCampo('N', FCdsEstab.FieldByName('COD_MUNICIPIO').asString,5) +SEP_CAMPO+
    // 10 - Inscrição Municipal do contribuinte
    ValidarValorCampo('C', FCdsEstab.FieldByName('INSCRICAO_MUNICIPAL').asString) +SEP_CAMPO+
    // 11 - Número de inscrição do contribuinte na SUFRAMA
    ValidarValorCampo('C', FCdsEstab.FieldByName('SUFRAMA').asString,9) +SEP_CAMPO+
    // 12 - Indicador de centralização de escrituração:
    //   0 -> Estabelecimento sem centralização de escrituração;
    //   1 -> Estabelecimento centralizador de escrituração;
    //   2 -> Estabelecimento com escrituração centralizada.
    ValidarValorCampo('N', FCdsEstab.FieldByName('COD_CENTRALIZACAO').asString,1) +SEP_CAMPO+
    // 13 - Data inicial das informações contidas no arquivo
    FormatDateTime('DDMMYYYY', FDataIni) +SEP_CAMPO+
    // 14 - Data final das informações contidas no arquivo
    FormatDateTime('DDMMYYYY', FDataFin) +SEP_CAMPO+
    // 15 - Código da versão do layout (003 = versão 1.0.0.2)
    '003' +SEP_CAMPO+
    // 16 - Finalidade do arquivo
    ValidarValorCampo('N',IntToStr(FCodFinalidade),2) +SEP_CAMPO+
    // 17 - Indicador de tipo de entrada de dados:
    //    0 -> Digitação de dados;
    //    1 -> Importação de arquivo texto;
    //    2 -> Validação de arquivo texto.
    '1';
  Inc(FQuantReg[1]);
  Inc(FNumRegBloco);
end;

function TCtrlParamMANADMagnetico.GerarReg0001: string;
begin
  // ******************************************
  // Registro Tipo 0001 (Abertura do bloco "0")
  // ******************************************
  Result :=
    // 01 - Tipo do Registro
    '0001' +SEP_CAMPO+
    // 02 - Indicador de movimento:
    //    0 -> Bloco com dados informados
    //    1 -> Bloco sem dados informados
    IFF(FCdsPessoa.RecordCount>0, '0', '1');
  Inc(FQuantReg[2]);
  Inc(FNumRegBloco);
end;

function TCtrlParamMANADMagnetico.GerarReg0990: string;
begin
  // **********************************************
  // Registro Tipo 0990 (Encerramento do bloco "0")
  // **********************************************
  Inc(FQuantReg[3]);
  Inc(FNumRegBloco);
  Result :=
    // 01 - Tipo do Registro
    '0990' +SEP_CAMPO+
    // 02 - Quantidade total de linhas do Bloco "0"
    IntToStr(FNumRegBloco);
end;

function TCtrlParamMANADMagnetico.GerarRegK001: string;
begin
  // ******************************************
  // Registro Tipo K001 (Abertura do bloco "K")
  // ******************************************
  Result :=
    // 01 - Tipo do Registro
    'K001' +SEP_CAMPO+
    // 02 - Quantidade total de linhas do Bloco "0"
    IFF(FCdsPessoa.RecordCount>0, '0', '1');
  Inc(FQuantReg[4]);
  Inc(FNumRegBloco);
end;

function TCtrlParamMANADMagnetico.GerarRegK050: string;
begin
  // **********************************************
  // Registro Tipo K050 (Cadastro de trabalhadores)
  // **********************************************
  Result :=
    // 01 - Tipo do Registro
    'K050' +SEP_CAMPO+
    // 02 - CNPJ do contribuinte
    IFF(FCdsEstab.FieldByName('CNPJ').asString<>'',
      ValidarValorCampo('N', FCdsEstab.FieldByName('CNPJ').asString,14),
      ValidarValorCampo('N', FCdsEstab.FieldByName('CEI').asString,12)) +SEP_CAMPO+
    // 03 - Nome empresarial do contribuinte
    FormatDateTime('DDMMYYYY', FCdsPessoa.FieldByName('DATA_INCLUSAO').asDateTime) +SEP_CAMPO+
    // 04 - Código que identifica o trabalhador na empresa
    ValidarValorCampo('C', FCdsPessoa.FieldByName('MATRICULA').asString) +SEP_CAMPO+
    // 05 - CPF
    ValidarValorCampo('N', FCdsPessoa.FieldByName('CPF').asString, 11) +SEP_CAMPO+
    // 06 - NIT
    ValidarValorCampo('N', FCdsPessoa.FieldByName('NIT').asString, 11) +SEP_CAMPO+
    // 07 - Categoria do trabalhador conforme tabela constante do Manual da GFIP
    // OBS: Para estagiário, informar código 00
    ValidarValorCampo('N', FCdsPessoa.FieldByName('IDCATEMPRGRE').asString, 2) +SEP_CAMPO+
    // 08 - Nome completo do trabalhador
    ValidarValorCampo('C', FCdsPessoa.FieldByName('NOME').asString) +SEP_CAMPO+
    // 09 - Data de nascimento do trabalhador
    FormatDateTime('DDMMYYYY', FCdsPessoa.FieldByName('DATANASC').asDateTime) +SEP_CAMPO+
    // 10 - Data de admissão do trabalhador
    FormatDateTime('DDMMYYYY', FCdsPessoa.FieldByName('DATAADMISSAO').asDateTime) +SEP_CAMPO+
    // 11 - Data de demissão do trabalhador
    FormatDateTime('DDMMYYYY', FCdsPessoa.FieldByName('DATADESLIGAMENTO').asDateTime) +SEP_CAMPO+
    // 12 - Indicador do tipo de vínculo do trabalhador
    // (NÃO INFORMADO para empresas de Direito Privado)
    SEP_CAMPO+
    // 13 - Indicativo do tipo de nomeação
    // (NÃO INFORMADO para empresas de Direito Privado)
    SEP_CAMPO+
    // 14 - Número do Ato de Nomeação
    // (NÃO INFORMADO para empresas de Direito Privado)
    SEP_CAMPO+
    // 15 - Data do ato de nomeação
    // (NÃO INFORMADO para empresas de Direito Privado)
    SEP_CAMPO;
  Inc(FQuantReg[5]);
  Inc(FNumRegBloco);
end;

function TCtrlParamMANADMagnetico.GerarRegK100: string;
begin
  // ****************************
  // Registro Tipo K100 (Lotação)
  // ****************************
  Result :=
    // 01 - Tipo do Registro
    'K100' +SEP_CAMPO+
    // 02 - Data de inclusão ou alteração da lotação
    FormatDateTime('DDMMYYYY', FCdsCCusto.FieldByName('TRGDTINCLUSAO').asDateTime) +SEP_CAMPO+
    // 03 - Código da Lotação
    ValidarValorCampo('C', FCdsCCusto.FieldByName('CODCENTROCUSTO').asString) +SEP_CAMPO+
    // 04 - CNPJ do contribuinte
    IFF(FCdsEstab.FieldByName('CNPJ').asString<>'',
      ValidarValorCampo('N', FCdsEstab.FieldByName('CNPJ').asString,14),
      ValidarValorCampo('N', FCdsEstab.FieldByName('CEI').asString,12)) +SEP_CAMPO+
    // 05 - Nome da Lotação
    ValidarValorCampo('C', FCdsCCusto.FieldByName('NOME').asString) +SEP_CAMPO+
    // 06 - CNPJ/CEI do tomador de serviços
    '';
  Inc(FQuantReg[6]);
  Inc(FNumRegBloco);
end;

function TCtrlParamMANADMagnetico.GerarRegK150: string;
begin
  // *****************************
  // Registro Tipo K150 (Rubricas)
  // *****************************
  Result :=
    // 01 - Tipo do Registro
    'K150' +SEP_CAMPO+
    // 02 - CNPJ do contribuinte
    IFF(FCdsEstab.FieldByName('CNPJ').asString<>'',
      ValidarValorCampo('N', FCdsEstab.FieldByName('CNPJ').asString,14),
      ValidarValorCampo('N', FCdsEstab.FieldByName('CEI').asString,12)) +SEP_CAMPO+
    // 03 - Data de inclusão ou alteração da Rubrica
    FormatDateTime('DDMMYYYY', FCdsRub.FieldByName('TRGDTINCLUSAO').asDateTime) +SEP_CAMPO+
    // 03 - Código da Rubrica
    ValidarValorCampo('C', FCdsRub.FieldByName('CODPROVDESC').asString) +SEP_CAMPO+
    // 04 - Nome da Rubrica
    ValidarValorCampo('C', FCdsRub.FieldByName('DESCRPROVDESC').asString);
  Inc(FQuantReg[7]);
  Inc(FNumRegBloco);
end;

function TCtrlParamMANADMagnetico.GerarRegK200: string;
const
  COD_CONTA: array [1..2] of string = ('CONTADEBITO', 'CONTACREDITO');
var
  c: byte;
begin
  // *********************************************************
  // Registro Tipo K200 (Contabilização da folha de pagamento)
  // *********************************************************
  for c:=1 to 2 do
    if (FCdsContabFolha.FieldByName(COD_CONTA[c]).asString <> '') then
    begin
      Result :=
        // 01 - Tipo do Registro
        'K200' +SEP_CAMPO+
        // 02 - Data de inclusão ou alteração da Rubrica
        FormatDateTime('DDMMYYYY', FCdsContabFolha.FieldByName('TRGDTINCLUSAO').asDateTime) +SEP_CAMPO+
        // 03 - CNPJ do contribuinte
        IFF(FCdsEstab.FieldByName('CNPJ').asString<>'',
          ValidarValorCampo('N', FCdsEstab.FieldByName('CNPJ').asString,14),
          ValidarValorCampo('N', FCdsEstab.FieldByName('CEI').asString,12)) +SEP_CAMPO+
        // 04 - Código da Rubrica
        ValidarValorCampo('C', FCdsContabFolha.FieldByName('CODPROVDESC').asString) +SEP_CAMPO+
        // 05 - Código da Lotação
        ValidarValorCampo('C', FCdsContabFolha.FieldByName('CODCENTROCUSTO').asString) +SEP_CAMPO+
        // 06 - Código do centro de custos
        ValidarValorCampo('C', FCdsContabFolha.FieldByName('CODCENTROCUSTO').asString) +SEP_CAMPO+
        // 07 - Código da conta analítica Debitada / Creditada
        ValidarValorCampo('C', FCdsContabFolha.FieldByName(COD_CONTA[c]).asString);
    Inc(FQuantReg[8]);
    Inc(FNumRegBloco);
  end;
end;

function TCtrlParamMANADMagnetico.GerarRegK250: string;
var
  bmMarca: TBookmark;
  dValIRRF, dValINSS: double;
begin
  bmMarca := FCdsHistRubSal.GetBookmark;

  dValIRRF := 0;
  dValINSS := 0;
  repeat
    if (GetIndBaseINSS(FCdsHistRubSal.FieldByName('IDRUBRICA').asFloat) <> '8') then
      dValINSS := dValINSS + FCdsHistRubSal.FieldByName('VALORPROVENTO').asFloat;

    if (GetIndBaseIRRF(FCdsHistRubSal.FieldByName('IDRUBRICA').asFloat) <> '3') then
      dValIRRF := dValIRRF + FCdsHistRubSal.FieldByName('VALORPROVENTO').asFloat;

    FCdsHistRubSal.Next;  
  until (FCdsHistRubSal.EOF) or
        (FIdMotivo <> FCdsHistRubSal.FieldByName('IDMOTIVO').asInteger) or
        (FIdPessoa <> FCdsHistRubSal.FieldByName('IDPESSOA').asFloat) or
        (FMesAtual <> FCdsHistRubSal.FieldByName('MES').asString);

  FCdsHistRubSal.GotoBookmark(bmMarca);
  FCdsHistRubSal.FreeBookmark(bmMarca);

  // *************************************************
  // Registro Tipo K250 (Mestre da Folha de Pagamento)
  // *************************************************
  Result :=
    // 01 - Tipo do Registro
    'K250' +SEP_CAMPO+
    // 02 - CNPJ do contribuinte
    IFF(FCdsEstab.FieldByName('CNPJ').asString<>'',
      ValidarValorCampo('N', FCdsEstab.FieldByName('CNPJ').asString,14),
      ValidarValorCampo('N', FCdsEstab.FieldByName('CEI').asString,12)) +SEP_CAMPO+
    // 03 - Código do Tipo de Folha
    GetDeParaTipoFolha(FCdsHistRubSal.FieldByName('IDMOTIVO').asString) +SEP_CAMPO+
    // 04 - Código da Lotação
    ValidarValorCampo('C', FCdsPessoa.FieldByName('CODCENTROCUSTO').asString) +SEP_CAMPO+
    // 05 - Código que identifica o trabalhador na empresa
    ValidarValorCampo('C', FCdsPessoa.FieldByName('MATRICULA').asString) +SEP_CAMPO+
    // 06 - Competência
    ValidarValorCampo('N', Copy(FCdsHistRubSal.FieldByName('MES').asString,6,2) +'/'+
      Copy(FCdsHistRubSal.FieldByName('MES').asString,1,4)) +SEP_CAMPO+
    // 07 - Data da realização do pagamento
    FormatDateTime('DDMMYYYY', FCdsHistRubSal.FieldByName('DATAPAGAMENTO').asDateTime) +SEP_CAMPO+
    // 08 - CBO
    ValidarValorCampo('N', FCdsPessoa.FieldByName('CBO').asString, 8) +SEP_CAMPO+
    // 09 - Ocorrência SEFIP
    ValidarValorCampo('N', FCdsPessoa.FieldByName('OCORRENCIA').asString, 2) +SEP_CAMPO+
    // 10 - Cargo
    ValidarValorCampo('C', FCdsPessoa.FieldByName('CARGO').asString) +SEP_CAMPO+
    // 11 - Quantidade de dependentes para IRRF
    ValidarValorCampo('N', FCdsPessoa.FieldByName('NUMDEPIRRF').asString) +SEP_CAMPO+
    // 12 - Quantidade de dependentes para Salário Família
    ValidarValorCampo('N', FCdsPessoa.FieldByName('NUMDEPSALF').asString) +SEP_CAMPO+
    // 13 - Valor da Base de Cálculo para IRRF
    ValidarValorCampo('N', FormatFloat('#########0.00', dValIRRF)) +SEP_CAMPO+
    // 14 - Valor da Base de Cálculo para INSS
    ValidarValorCampo('N', FormatFloat('#########0.00', dValINSS));

  Inc(FQuantReg[9]);
  Inc(FNumRegBloco);
end;

function TCtrlParamMANADMagnetico.GerarRegK300: string;
begin
  // ************************************************
  // Registro Tipo K300 (Itens da Folha de Pagamento)
  // ************************************************
  Result :=
    // 01 - Tipo do Registro
    'K300' +SEP_CAMPO+
    // 02 - CNPJ do contribuinte
    IFF(FCdsEstab.FieldByName('CNPJ').asString<>'',
      ValidarValorCampo('N', FCdsEstab.FieldByName('CNPJ').asString,14),
      ValidarValorCampo('N', FCdsEstab.FieldByName('CEI').asString,12)) +SEP_CAMPO+
    // 03 - Código do Tipo de Folha
    GetDeParaTipoFolha(FCdsHistRubSal.FieldByName('IDMOTIVO').asString) +SEP_CAMPO+
    // 04 - Código da Lotação
    ValidarValorCampo('C', FCdsPessoa.FieldByName('CODCENTROCUSTO').asString) +SEP_CAMPO+
    // 05 - Código que identifica o trabalhador na empresa
    ValidarValorCampo('C', FCdsPessoa.FieldByName('MATRICULA').asString) +SEP_CAMPO+
    // 06 - Competência
    ValidarValorCampo('N', Copy(FCdsHistRubSal.FieldByName('MES').asString,6,2) +'/'+
      Copy(FCdsHistRubSal.FieldByName('MES').asString,1,4)) +SEP_CAMPO+
    // 07 - Código da Rubrica
    ValidarValorCampo('C', FCdsHistRubSal.FieldByName('CODPROVDESC').asString) +SEP_CAMPO+
    // 08 - Valor da Rubrica
    ValidarValorCampo('N', FormatFloat('#########0.00',
      FCdsHistRubSal.FieldByName('VALORPROVENTO').asFloat)) +SEP_CAMPO+
    // 09 - Indicação de Provento ou Desconto:
    //   D –> Desconto
    //   P –> Provento ou Vantagem
    //   O –> Outros
    ValidarValorCampo('N', FCdsRub.FieldByName('TIPO_RUB').asString) +SEP_CAMPO+
    // 10 - Indicador de Base de Cálculo para o IRRF:
    //   1 –> Base de cálculo salário mensal
    //   2 –> Base de cálculo 13º Salário
    //   3 –> Não é base de cálculo
    //   9 –> Outras bases de cálculo
    GetIndBaseIRRF(FCdsHistRubSal.FieldByName('IDRUBRICA').asFloat) +SEP_CAMPO+
    // 11 - Indicador de Base de Cálculo para a INSS:
    //   1 –> Base de cálculo do Salário de Contribuição mensal
    //   2 –> Base de cálculo do 13º salário
    //   3 –> Refere-se a valor descontado do segurado
    //   4 –> Refere-se a valor pago de Salário Família
    //   5 –> Base de cálculo do Salário-Maternidade
    //   6 –> Base de cálculo exclusiva FGTS
    //   7 –> Reduções da base de cálculo
    //   8 –> Não é base de cálculo
    //   9 –> Outras bases de cálculo
    GetIndBaseINSS(FCdsHistRubSal.FieldByName('IDRUBRICA').asFloat);

  Inc(FQuantReg[10]);
  Inc(FNumRegBloco);
end;

function TCtrlParamMANADMagnetico.GerarRegK990: string;
begin
  // **********************************************
  // Registro Tipo K990 (Encerramento do bloco "K")
  // **********************************************
  Inc(FNumRegBloco);
  Inc(FQuantReg[11]);
  Result :=
    // 01 - Tipo do Registro
    'K990' +SEP_CAMPO+
    // 02 - Quantidade total de linhas do Bloco "K"
    IntToStr(FNumRegBloco);
end;

function TCtrlParamMANADMagnetico.GerarReg9001: string;
begin
  // ******************************************
  // Registro Tipo 9001 (Abertura do Bloco "9")
  // ******************************************
  Result :=
    // 01 - Tipo do Registro
    '9001' +SEP_CAMPO+
    // 02 - Indicador de movimento:
    //   0 -> Bloco com dados informados
    //   1 -> Bloco sem dados informados
    '0';
  Inc(FNumRegBloco);  
end;

function TCtrlParamMANADMagnetico.GerarReg9900: string;
var
  c: byte;
begin
  // ****************************************
  // Registro Tipo 9900 (Registro dos Blocos)
  // ****************************************
  for c:=1 to NUM_REGISTROS do
    if (FQuantReg[c] > 0) then
    begin
      Result :=
        // 01 - Tipo do Registro
        '9900' +SEP_CAMPO+
        // 02 - Tipo de registro que será totalizado no próximo campo
        NOME_CAMPO[c] +SEP_CAMPO+
        // 03 - Total de registros do tipo informado no campo anterior
        IntToStr(FQuantReg[c]);

      Inc(FNumRegBloco);
    end;
end;

function TCtrlParamMANADMagnetico.GerarReg9990: string;
begin
  Inc(FNumRegBloco);
  // **********************************************
  // Registro Tipo 9990 (Encerramento do Bloco "9")
  // **********************************************
  Result :=
    // 01 - Tipo do Registro
    '9990' +SEP_CAMPO+
    // 02 - Quantidade total de linhas do Bloco 9
    IntToStr(FNumRegBloco+1); // O +1 é para contar com o registro 9999 também
end;

function TCtrlParamMANADMagnetico.GerarReg9999: string;
begin
  // **********************************************
  // Registro Tipo 9990 (Encerramento do Bloco "9")
  // **********************************************
  Result :=
    // 01 - Tipo do Registro
    '9990' +SEP_CAMPO+
    // 02 - Quantidade total de linhas do arquivo digital
    IntToStr(FArq.Count+1); // O +1 é para contar com o registro 9999 também
end;

function TCtrlParamMANADMagnetico.GerarArquivo(const IdEmpresa: integer; const ListaIdEstab,
  DeParaTipoFolha: string; const MesIni, AnoIni, MesFin, AnoFin, CodFinalidade: integer): boolean;
begin
  Result := true;

  FListaIdEstab := ListaIdEstab;
  FDeParaTipoFolha := DeParaTipoFolha;
  FAnoMesIni := IntToStr(AnoIni) +'/'+ PoeZero(MesIni);
  FAnoMesFin := IntToStr(AnoFin) +'/'+ PoeZero(MesFin);
  FCodFinalidade := CodFinalidade;
  FDataIni := EncodeDate(AnoIni, MesIni, 1);
  FDataFin := EncodeDate(AnoFin, MesFin, TrazUltDiaMes(MesFin, AnoFin));

  FArq.Clear;
  FCodFinalidade := CodFinalidade;

  try
    // Montar Query com informações
    if not(AbrirQueryEstab) or not(AbrirQueryPessoa) or not(AbrirQueryCCusto) or
       not(AbrirQueryRub(IdEmpresa)) or not(AbrirQueryContabFolha(IdEmpresa)) then
      exit;

    FillChar(FQuantReg, 0, NUM_REGISTROS); // Zerar todas as quantidades

    // ********************************************************************
    // Geração dos dados do Bloco 0 (Abertura, Identificação e Referências)
    // ********************************************************************
    IncProgresso('', CMTranslate('Gravando Bloco 0...'), 0);
    FNumRegBloco := 0;
    FCdsEstab.First;
    while not(FCdsEstab.EOF) do
    begin
      FCdsPessoa.Filter := 'IDESTAB = ' + FCdsEstab.FieldByName('IDPESSOA').asString;
      FArq.Add(GerarReg0000);
      FArq.Add(GerarReg0001);
      FCdsEstab.Next;
    end;
    FArq.Add(GerarReg0990);
    FCdsPessoa.Filter := '';

    IncProgresso(GetTempoDecorrido, '', 5);

    // *************************************************
    // Geração dos dados do Bloco K (Folha de Pagamento)
    // *************************************************
    IncProgresso('', CMTranslate('Gravando Cadastro de trabalhadores...'), 0);
    FNumRegBloco := 0;
    FArq.Add(GerarRegK001);

    // Cadastro de trabalhadores
    FCdsPessoa.First;
    while not(FCdsPessoa.EOF) do
    begin
      FArq.Add(GerarRegK050);
      FCdsPessoa.Next;
    end;

    IncProgresso(GetTempoDecorrido, '', 5);

    // Lotação
    IncProgresso('', CMTranslate('Gravando Cadastro de Lotações...'), 0);
    FCdsEstab.First;
    while not(FCdsEstab.EOF) do
    begin
      FCdsCCusto.First;
      while not(FCdsCCusto.EOF) do
      begin
        FArq.Add(GerarRegK100);
        FCdsCCusto.Next;
      end;
      FCdsEstab.Next;
    end;

    IncProgresso(GetTempoDecorrido, '', 5);

    // Rubricas
    IncProgresso('', CMTranslate('Gravando Cadastro de Rubricas...'), 0);
    FCdsEstab.First;
    while not(FCdsEstab.EOF) do
    begin
      FCdsRub.First;
      while not(FCdsRub.EOF) do
      begin
        FArq.Add(GerarRegK150);
        FCdsRub.Next;
      end;
      FCdsEstab.Next;
    end;

    IncProgresso(GetTempoDecorrido, '', 5);

    // Contabilização da folha de pagamento
    IncProgresso('', CMTranslate('Gravando Param. Contábil...'), 0);
    FCdsEstab.First;
    while not(FCdsEstab.EOF) do
    begin
      FCdsContabFolha.First;
      while not(FCdsContabFolha.EOF) do
      begin
        FArq.Add(GerarRegK200);
        FCdsContabFolha.Next;
      end;
      FCdsEstab.Next;
    end;

    IncProgresso(GetTempoDecorrido, '', 5);

    // Dados da Folha de Pagamento
    IncProgresso('', CMTranslate('Gravando Dados da Folha de Pagamento...'), 0);
    FCdsEstab.First;
    while not(FCdsEstab.EOF) do
    begin
      FCdsPessoa.Filter := 'IDESTAB = ' + FCdsEstab.FieldByName('IDPESSOA').asString;
      FCdsPessoa.First;
      while not(FCdsPessoa.EOF) do
      begin
        AbrirQueryHistRubSal(FCdsPessoa.FieldByName('IDPESSOA').asFloat);
        FCdsHistRubSal.First;
        while not(FCdsHistRubSal.EOF) do
        begin
          // Mestre da Folha de Pagamento
          FArq.Add(GerarRegK250);

          // Itens da Folha de Pagamento
          FIdMotivo := FCdsHistRubSal.FieldByName('IDMOTIVO').asInteger;
          FIdPessoa := FCdsHistRubSal.FieldByName('IDPESSOA').asFloat;
          FMesAtual := FCdsHistRubSal.FieldByName('MES').asString;
          repeat
            if (FCdsRub.Locate('IDRUBRICA',
                FCdsHistRubSal.FieldByName('IDRUBRICA').asFloat, [])) then
              FArq.Add(GerarRegK300);
            FCdsHistRubSal.Next;
          until (FCdsHistRubSal.EOF) or
                (FIdMotivo <> FCdsHistRubSal.FieldByName('IDMOTIVO').asInteger) or
                (FIdPessoa <> FCdsHistRubSal.FieldByName('IDPESSOA').asFloat) or
                (FMesAtual <> FCdsHistRubSal.FieldByName('MES').asString);
        end;

        FCdsPessoa.Next;
      end;
      FCdsEstab.Next;
    end;

    IncProgresso(GetTempoDecorrido, '', 35);

    // Encerramento do bloco K
    FArq.Add(GerarRegK990);

    // *************************************************************************
    // Geração dos dados do Bloco 9 (Controle e encerramento do arquivo digital)
    // *************************************************************************
    IncProgresso('', CMTranslate('Gravando Bloco 9...'), 0);
    FNumRegBloco := 0;
    FArq.Add(GerarReg9001);
    FArq.Add(GerarReg9900);
    FArq.Add(GerarReg9990);
    FArq.Add(GerarReg9999);

    IncProgresso(GetTempoDecorrido, '', 5);
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
    end;
  end;

  FCdsPessoa.Filter := '';
end;

end.
