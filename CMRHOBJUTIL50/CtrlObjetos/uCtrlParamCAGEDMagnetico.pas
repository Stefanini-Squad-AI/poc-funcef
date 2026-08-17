unit uCtrlParamCAGEDMagnetico;

interface

uses SysUtils, Classes, Controls, DB, Forms, uCmControlObject, uCmDbObject, IvDictio,
   uCmClientDataSet, uCMTypes, uCtrlCustomRH;

type
  TOnProgCAGEDMagnetic = procedure (const NumReg: integer; const MsgVerificaEstab,
    MsgVerificaResp, MsgProcessando, IncrProgresso: boolean; MsgLog: string) of object;

  TCtrlParamCAGEDMagnetico = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FOnProgCAGEDMagnetic: TOnProgCAGEDMagnetic;

    FCdsPrincipal: TCMClientDataSet;
    FCdsFunc2Moviment: TCMClientDataSet;
    FCdsEstab: TCMClientDataSet;
    FCdsResp: TCMClientDataSet;
    FCdsNumPessoasMesAnterior: TCMClientDataSet;
    FCdsAdmitidosDemitidos: TCMClientDataSet;
    FCdsTransfDeOutraEmpresa: TCMClientDataSet;
    FCdsTransfParaOutraEmpresa: TCMClientDataSet;
    FCdsTransfMesmaEmpresa: TCMClientDataSet;

    FListaIdRubrica: TStringList;
    FArq: TStringList;
    FSQL: TStringList;

    FIdEmpresa: integer;
    FCAGEDNormal: boolean;
    FAlterarDadosCadResp: integer;
    FAlterarDadosCadEstab: integer;
    FPrimeiraDeclaracao: boolean;
    FIdResponsavel: double;
    FTipoMeioInformacao: integer;
    FNumAutorizacao: string;
    FMicroEmpresa: boolean;
    FTipoContrato: string;
    FAnoMes: string; // Competência no formato AAAA/MM
    FListaIdRubSel: string;
    FListaIdEstab: string;

    FNumEstab: word;
    FNumMoviment: word;
    FNumSequencia: word;

    procedure IncProgresso(const NumReg: integer; const MsgVerificaEstab, MsgVerificaResp,
      MsgProcessando, IncrProgresso: boolean; MsgLog: string = '');

    function AbrirQueryEstabelecimento: boolean;
    function AbrirQueryResponsavel: boolean;
    function AbrirQueryAdmitidosDemitidos: boolean;
    function AbrirQueryTransfDeOutraEmpresa: boolean;
    function AbrirQueryTransfParaOutraEmpresa: boolean;
    function AbrirQueryTransfMesmaEmpresa: boolean;
    function AbrirQueryPrincipal: boolean;
    function AbrirQueryNumPessoasMesAnterior: boolean;

    procedure MontarListaIdPessoa(var ListaIdPessoa: string);

    function GetIdEstabAntesTransf(IdPessoa: double): double;
    function GetNumPessoasMesAnterior(const IdEstab: double): string;
    function GetNumeroCTPS(Campo: string): string;
    function GetSerieCTPS(Campo: string): string;
    function GetNumEstab: integer;
    function GetNumMovimentacoes: integer;

    function GerarRegTransferencias: boolean;

    procedure MensagemPessoas;

    procedure GerarRegistro_CabecalhoArquivo;
    procedure GerarRegistro_CabecalhoEstab;
    procedure GerarRegistro_Detalhe;
    
    function  GetRegistroC(DataDesl,TipoMov: string): string;
    function  GetRegistroX(DataDesl,TipoMov: string): string;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function IniciarProcessamento(IdEmpresa: integer; ListaIdEstab, ListaIdRub: string;
      IdResponsavel: double; Mes, Ano: word; TipoContrato: string; TipoMeioInformacao: integer;
      NumAutorizacao: string; CAGEDNormal: boolean; AlterarDadosCadResp,
      AlterarDadosCadEstab: integer; PrimeiraDeclaracao, MicroEmpresa: boolean): boolean;
    function VerificarFunc2Moviment: boolean;
    function ProcessarGeracao: string;

    property CdsFunc2Moviment: TCMClientDataSet read FCdsFunc2Moviment write FCdsFunc2Moviment;
    property OnProgresso: TOnProgCAGEDMagnetic read FOnProgCAGEDMagnetic write FOnProgCAGEDMagnetic;
  end;

implementation

uses  uDiasUteis, uCtrlFuncoesRH, uCmCustomCdbObject;
//*uCMTraduzSql,
const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_SEM_DADOS_ESTAB =
    'Dados do(s) Estabelecimento(s) selecionado(s) não estão completos. :1'+
    'Verifique e tente novamente.';
  MSG_SEM_DADOS_RESP =
    'Dados do Responsável selecionado não estão completos. :1'+
    'Verifique e tente novamente.';
  MSG_SEM_DADOS_MOVIM =
    'Não há dados a serem processados para esta competência ou :1'+
    'Dados Cadastrais (como Movimento Contratual CAGED) incompletos.';
  MSG_ERRO_GERA_ARQ =
    'Ocorreu um erro durante a geração do arquivo para o :1'+
    'Empregado: :2';

  TRANSF_ENTRADA = 70;
  TRANSF_SAIDA = 80;

{ TCtrlParamCAGEDMagnetico }

constructor TCtrlParamCAGEDMagnetico.Create;
begin
  inherited;
  FCdsPrincipal := TCMClientDataSet.Create(nil);
  FCdsEstab := TCMClientDataSet.Create(nil);
  FCdsResp := TCMClientDataSet.Create(nil);
  FCdsNumPessoasMesAnterior := TCMClientDataSet.Create(nil);
  FCdsAdmitidosDemitidos := TCMClientDataSet.Create(nil);
  FCdsTransfDeOutraEmpresa := TCMClientDataSet.Create(nil);
  FCdsTransfParaOutraEmpresa := TCMClientDataSet.Create(nil);
  FCdsTransfMesmaEmpresa := TCMClientDataSet.Create(nil);

  FSQL := TStringList.Create;
  FArq := TStringList.Create;
  FListaIdRubrica := TStringList.Create;
end;

destructor TCtrlParamCAGEDMagnetico.Destroy;
begin
  FCdsPrincipal.Free;
  FCdsEstab.Free;
  FCdsResp.Free;
  FCdsNumPessoasMesAnterior.Free;
  FCdsAdmitidosDemitidos.Free;
  FCdsTransfDeOutraEmpresa.Free;
  FCdsTransfParaOutraEmpresa.Free;
  FCdsTransfMesmaEmpresa.Free;

  FSQL.Free;
  FArq.Free;
  FListaIdRubrica.Free;

  if (IsAppServer) then
    FCdsFunc2Moviment.Free;
  inherited;
end;

procedure TCtrlParamCAGEDMagnetico.OnCreateAppServer;
begin
  inherited;
  FCdsFunc2Moviment := TCMClientDataSet.Create(nil);
end;

procedure TCtrlParamCAGEDMagnetico.DoChangeDataBase;
begin
  inherited;
end;

procedure TCtrlParamCAGEDMagnetico.IncProgresso(const NumReg: integer;
  const MsgVerificaEstab, MsgVerificaResp, MsgProcessando, IncrProgresso: boolean;
  MsgLog: string);
begin
  if Assigned(OnProgresso) then
    OnProgresso(
      NumReg, MsgVerificaEstab, MsgVerificaResp, MsgProcessando, IncrProgresso, MsgLog);
end;

function TCtrlParamCAGEDMagnetico.AbrirQueryEstabelecimento: boolean;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PJ.IDPESSOA AS IDESTAB,');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS NOME,');
    Add('  TO_CHAR(DECODE(RTRIM(TD.SIGLADOCUMENTO),');
    Add('    ''CGC:'',''1'',');
    Add('    ''CNPJ:'',''1'',');
    Add('    ''2''');
    Add('  )) AS TIPO_INSCRICAO,');
    Add('  PJ.NUMDOCUMENTO AS INSCRICAO,');
    Add('  TO_CHAR(DECODE(RTRIM(NVL(E.LOGRADOURO,'''')),'''','''',');
    Add('    RTRIM(E.LOGRADOURO) ||');
    Add('    TO_CHAR(DECODE(TO_CHAR(E.NUMERO),'''','''',');
    Add('      '', '' || TO_CHAR(E.NUMERO)');
    Add('    )) ||');
    Add('    TO_CHAR(DECODE(RTRIM(NVL(E.COMPLEMENTO,'''')),'''','''',');
    Add('      '' - '' || RTRIM(E.COMPLEMENTO)');
    Add('    ))');
    Add('  )) AS ENDERECO,');
    Add('  FP.IDITEMCNAE AS CNAE,');
    Add('  RTRIM(E.BAIRRO) AS BAIRRO,');
    Add('  RTRIM(E.CEP) AS CEP,');
    Add('  RTRIM(CI.NOME) AS CIDADE,');
    Add('  ES.CODESTADO AS UF,');
    Add('  RTRIM(TELEFONE.DDD) AS DDD,');
    Add('  RTRIM(TELEFONE.NUMERO) AS TELEFONE');
    Add('FROM');
    Add('  PESSOA PJ, ENDPESS E, CIDADES CI, ESTADO ES, FILIALPESSOA FP,');
    Add('  PARAMGLOBAL PG, TIPODOCOFICIAL TD,');
    // -------------------------------------------------------------------------- //
    // Telefone da Empresa
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

    if (Pos(',', FListaIdEstab) > 0) then
      Add('  (PJ.IDPESSOA      IN (' +FListaIdEstab+ ')) AND')
    else
      Add('  (PJ.IDPESSOA       = ' +FListaIdEstab+ ') AND');

    Add('  (PJ.NUMDOCUMENTO  IS NOT NULL) AND');
    Add('  (PJ.IDPESSOA       = FP.IDFILIALPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = TELEFONE.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CI.IDCIDADES) AND');
    Add('  (CI.IDESTADO       = ES.IDESTADO) AND');
    Add('  (PG.IDPESSOA       = ' +IntToStr(FIdEmpresa)+ ') AND');
    Add('  (PG.DOCPJURIDICA   = TD.IDDOCUMENTO(+))');
    SaveToFile(DirTempLog + '\qryEstab.txt');
  end;
  IncProgresso(0, true, false, false, false);
  FCdsEstab.Data := GetDataPacket(FSQL);
  Result := not(FCdsEstab.IsEmpty);
  if not(Result) then
    MessageInfo := CMTranslateMsg(MSG_SEM_DADOS_ESTAB, [CR_LF]);
end;

function TCtrlParamCAGEDMagnetico.AbrirQueryResponsavel: boolean;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
   //  IFF(TTipoBDPadrao(iTipoBD_Padrao) in [tbdSQLServer, tbdSQLServerOdbc],' TOP 1', ''));
    Add('  (RTRIM(TD.SIGLADOCUMENTO),');
    Add('    ''CGC:'',''1'',');
    Add('    ''CNPJ:'',''1'',');
    Add('    ''2''');
    Add('  )) AS TIPO_INSCRICAO,');
    Add('  PJ.NUMDOCUMENTO AS INSCRICAO,');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS NOME,');
    Add('  TO_CHAR(DECODE(RTRIM(NVL(E.LOGRADOURO,'''')),'''','''',');
    Add('    RTRIM(E.LOGRADOURO) ||');
    Add('    TO_CHAR(DECODE(TO_CHAR(E.NUMERO),'''','''',');
    Add('      '', '' || TO_CHAR(E.NUMERO)');
    Add('    )) ||');
    Add('    TO_CHAR(DECODE(RTRIM(NVL(E.COMPLEMENTO,'''')),'''','''',');
    Add('      '' - '' || RTRIM(E.COMPLEMENTO)');
    Add('    ))');
    Add('  )) AS ENDERECO,');
    Add('  RTRIM(E.CEP) AS CEP,');
    Add('  ES.CODESTADO AS UF,');
    Add('  RTRIM(TELEFONE.DDD) AS DDD,');
    Add('  RTRIM(TELEFONE.NUMERO) AS TELEFONE,');
    Add('  RTRIM(TELEFONE.RAMAL) AS RAMAL');
    Add('FROM');
    Add('  PESSOA PJ, ENDPESS E, CIDADES CI, ESTADO ES, PARAMGLOBAL PG, TIPODOCOFICIAL TD,');
    // -------------------------------------------------------------------------- //
    // Telefone da Empresa
    Add('  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO, TEC.RAMAL');
    Add('   FROM');
    Add('     TELENDPESS TE, TELCONTATO TEC,');
    Add('     (SELECT IDCONTATO');
    Add('      FROM   CONTATOPESS');
    Add('      WHERE  (FLGBLOQUEADO = ''N'')) CPE,');
    Add('     (SELECT MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('      FROM   TELENDPESS');
    Add('      GROUP BY IDENDERECO) ENDER');
    Add('   WHERE');
    Add('     (ENDER.IDTELEFONE = TE.IDTELEFONE) AND');
    Add('     (TE.IDTELEFONE    = TEC.IDTELEFONE(+)) AND');
    Add('     (TEC.IDCONTATO    = CPE.IDCONTATO(+))) TELEFONE');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA       = ' +FloatToStr(FIdResponsavel)+ ') AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = TELEFONE.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CI.IDCIDADES) AND');
    Add('  (CI.IDESTADO       = ES.IDESTADO) AND');
    Add('  (PG.IDPESSOA       = ' +IntToStr(FIdEmpresa)+ ') AND');

   //* if (TTipoBDPadrao(iTipoBD_Padrao) = tbdOracle) then
   //* begin
  //*   Add('  (PG.DOCPJURIDICA   = TD.IDDOCUMENTO(+)) AND');
  //*    Add('  (ROWNUM = 1)');
 //*   end
  //*  else
      Add('  (PG.DOCPJURIDICA   = TD.IDDOCUMENTO(+))');

    SaveToFile(DirTempLog + '\qryEsp.txt');
  end;
  IncProgresso(0, false, true, false, false);
  FCdsResp.Data := GetDataPacket(FSQL);
  Result := not(FCdsResp.IsEmpty);
  if not(Result) then
    MessageInfo := CMTranslateMsg(MSG_SEM_DADOS_RESP, [CR_LF]);
end;

function TCtrlParamCAGEDMagnetico.AbrirQueryAdmitidosDemitidos: boolean;
begin
  try
    with (FSQL) do
    begin
      Clear;
      Add('SELECT');
      Add('  F.IDPESSOA');
      Add('FROM');
      Add('  FUNCIONARIO F, SITFUNC SF');
      Add('WHERE');
      Add(MontaLinhaSelSQL('  (F.IDESTAB',FListaIdEstab,1));
      Add('  (');
      Add('    (');
      Add('      (SF.TIPOSIT = ''A'') AND');
      Add('      (TO_CHAR(DATAADMISSAO,''YYYY/MM'')     = ' +QuotedStr(FAnoMes)+ ')');
      Add('    ) OR');
      Add('    (');
      Add('      (SF.TIPOSIT = ''D'') AND');
      Add('      (TO_CHAR(DATADESLIGAMENTO,''YYYY/MM'') = ' +QuotedStr(FAnoMes)+ ')');
      Add('    )');
      Add('  ) AND');
      Add('  (F.IDSITFUNC = SF.IDSITFUNC)');
      SaveToFile(DirTempLog + '\qryAdmitidosDemitidos.txt');
    end;
    FCdsAdmitidosDemitidos.Data := GetDataPacket(FSQL);
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end
end;

function TCtrlParamCAGEDMagnetico.AbrirQueryTransfDeOutraEmpresa: boolean;
begin
  // Transferências entre Estabelecimentos de Empresas Proprietárias diferentes
  try
    with (FSQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  MESMA_EMPRESA.IDPESSOA, MESMA_EMPRESA.DATA');
      Add('FROM');
      Add('  FUNCIONARIO F,');
      Add('  (SELECT');
      Add('     EF.IDPESSOA, EF.DATAALTERFUNC AS DATA');
      Add('   FROM');
      Add('     EVOLFUNC EF, MOTIVO MO');
      Add('   WHERE');
      Add('     (RTRIM(MO.MOTIVOFGTS) IN (''N1'',''N2'')) AND');
      Add('     (MO.IDMOTIVO  = EF.IDMOTIVO) AND');
      Add(MontaLinhaSelSQL('     (EF.IDESTAB',FListaIdEstab,2));
      Add('     (TO_CHAR(EF.DATAALTERFUNC,''YYYY/MM'') = ' +QuotedStr(FAnoMes)+ ')');
      Add('  ) MESMA_EMPRESA,');
      Add('  (SELECT');
      Add('     EF.IDPESSOA, EF.DATAALTERFUNC AS DATA');
      Add('   FROM');
      Add('     EVOLFUNC EF,');
      Add('     (SELECT IDPESSOA, MAX(DATAALTERFUNC) AS DATA');
      Add('      FROM   EVOLFUNC');
      Add('      WHERE  (TO_CHAR(DATAALTERFUNC,''YYYY/MM'') < ' +QuotedStr(FAnoMes)+ ') AND');
      Add('             (IDEMPRESA <> ' +IntToStr(FIdEmpresa)+ ')');
      Add('      GROUP BY IDPESSOA');
      Add('     ) ULT_EF');
      Add('   WHERE');
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

function TCtrlParamCAGEDMagnetico.AbrirQueryTransfParaOutraEmpresa: boolean;
begin
  // Transferências entre Estabelecimentos de Empresas Proprietárias diferentes
  try
    with (FSQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  OUTRA_EMPRESA.IDPESSOA, OUTRA_EMPRESA.DATA');
      Add('FROM');
      Add('  FUNCIONARIO F,');
      Add('  (SELECT');
      Add('     EF.IDPESSOA, EF.DATAALTERFUNC AS DATA');
      Add('   FROM');
      Add('     EVOLFUNC EF, MOTIVO MO');
      Add('   WHERE');
      Add('     (RTRIM(MO.MOTIVOFGTS) IN (''N1'',''N2'')) AND');
      Add('     (MO.IDMOTIVO  = EF.IDMOTIVO) AND');
      Add('     (TO_CHAR(EF.DATAALTERFUNC,''YYYY/MM'') = ' +QuotedStr(FAnoMes)+ ') AND');
      Add('     (EF.IDEMPRESA <> ' +IntToStr(FIdEmpresa)+ ')');
      Add('  ) OUTRA_EMPRESA,');
      Add('  (SELECT');
      Add('     EF.IDPESSOA, EF.DATAALTERFUNC AS DATA');
      Add('   FROM');
      Add('     EVOLFUNC EF,');
      Add('     (SELECT IDPESSOA, MAX(DATAALTERFUNC) AS DATA');
      Add('      FROM   EVOLFUNC');
      Add('      WHERE  (TO_CHAR(DATAALTERFUNC,''YYYY/MM'') < ' +QuotedStr(FAnoMes)+ ')');
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

function TCtrlParamCAGEDMagnetico.AbrirQueryTransfMesmaEmpresa: boolean;
begin
  // Transferências entre Estabelecimentos da mesma Empresa Proprietária
  try
    with (FSQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  EMPRESA_ATU.IDPESSOA, EMPRESA_ATU.DATA');
      Add('FROM');
      Add('  FUNCIONARIO F,');
      Add('  (SELECT');
      Add('     EF.IDPESSOA, EF.DATAALTERFUNC AS DATA');
      Add('   FROM');
      Add('     EVOLFUNC EF, MOTIVO MO');
      Add('   WHERE');
      Add('     (RTRIM(MO.MOTIVOFGTS) IN (''N1'',''N2'')) AND');
      Add('     (MO.IDMOTIVO  = EF.IDMOTIVO) AND');
      Add('     (TO_CHAR(EF.DATAALTERFUNC,''YYYY/MM'') = ' +QuotedStr(FAnoMes)+ ') AND');
      Add('     (EF.IDEMPRESA = ' +IntToStr(FIdEmpresa)+ ') AND');
      Add(MontaLinhaSelSQL('     (EF.IDESTAB',FListaIdEstab,3,false));
      Add('  ) EMPRESA_ATU,');
      Add('  (SELECT');
      Add('     EF.IDPESSOA, EF.DATAALTERFUNC AS DATA');
      Add('   FROM');
      Add('     EVOLFUNC EF,');
      Add('     (SELECT IDPESSOA, MAX(DATAALTERFUNC) AS DATA');
      Add('      FROM   EVOLFUNC');
      Add('      WHERE  (TO_CHAR(DATAALTERFUNC,''YYYY/MM'') < ' +QuotedStr(FAnoMes)+ ')');
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

procedure TCtrlParamCAGEDMagnetico.MontarListaIdPessoa(var ListaIdPessoa: string);
var
  c: byte;
  _CdsAux: TCMClientDataSet;
  sIdPessoa: string;
begin
  // Obter a lista das pessoas a gerar o arquivo (admitidos, demitidos e transferidos)
  ListaIdPessoa := '';
  for c:=1 to 4 do
  begin
    case (c) of
      1 :  _CdsAux := FCdsAdmitidosDemitidos;
      2 :  _CdsAux := FCdsTransfDeOutraEmpresa;
      3 :  _CdsAux := FCdsTransfParaOutraEmpresa;
      else _CdsAux := FCdsTransfMesmaEmpresa;
    end;

    while not(_CdsAux.EOF) do
    begin
      sIdPessoa := _CdsAux.FieldByName('IDPESSOA').asString;
      if (VerificaCodigoEm(ListaIdPessoa, sIdPessoa, ',') <= 0) then
        if (ListaIdPessoa = '') then
          ListaIdPessoa := sIdPessoa
        else
          ListaIdPessoa := ListaIdPessoa +','+ sIdPessoa;
      _CdsAux.Next;
    end;
  end;

  if (ListaIdPessoa = '') then
    ListaIdPessoa := '-1';
end;

function TCtrlParamCAGEDMagnetico.AbrirQueryPrincipal: boolean;
var
  sListaIdPessoa: string;
begin
  // Obter a lista das pessoas a gerar o arquivo (admitidos, demitidos e transferidos)
  MontarListaIdPessoa(sListaIdPessoa);

  with (FSQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  F.IDESTAB,');
    Add('  P.IDPESSOA,');
    Add('  RTRIM(P.NOME) AS EMPREGADO,');
    Add('  CTPS.NUM AS CTPS,');
    Add('  CTPS.UF AS CTPS_UF,');
    Add('  PIS.NUM AS PIS,');
    Add('  C.CBO2002 AS CBO,');
    // Se não possuir Grau de Instrução, indico o grau ZERO para que seja gerado um erro
    Add('  TO_NUMBER(DECODE(SUBSTR(GR.CODRAIS,1,1),');
    Add('    '''',0,');
    Add('    SUBSTR(GR.CODRAIS,1,1)');
    Add('  )) AS GRAU_INSTR,');
    Add('  SF.TIPOSIT AS SITUACAO,');
    Add('  TO_CHAR(DECODE(PF.SEXO,');
    Add('    ''M'',''1'',');
    Add('    ''2''');
    Add('  )) AS SEXO,');
    Add('  NVL(PF.CORPESSOA,9) AS CORPESSOA,');
    Add('  NVL(PF.FLGDEFICIENTE,''2'') AS DEFICIENTE,');
    Add('  F.IDHORARIO, (HT.JORNADAMENSAL / 5) AS HRS_TRAB,');
    Add('  HIST_SIT.IDMOVCONTRCAGED AS TIPO_MOVIMENTACAO_HIST,');
    Add('  F.IDMOVCONTRCAGED AS TIPO_MOVIMENTACAO,');
    Add('  F.IDCATEMPRGRE,');
    Add('  PF.DATANASC,');
    Add('  F.DATAADMISSAO,');
    Add('  F.DATARETORNO,');
    Add('  F.TIPOCONTRATO,');

    Add('  (CASE');
    Add('     WHEN SF.TIPOSIT = ''D'' THEN F.DATADESLIGAMENTO');
    Add('     ELSE NULL');
    Add('   END) AS DATADESLIGAMENTO,');
    Add('  0 AS TRANSFERENCIA,');

    if (FListaIdRubSel = '') then
    begin
      Add('  NVL(TO_NUMBER(DECODE(SF.TIPOSIT,');
      Add('    ''D'',VAL_REM_DEM.VALOR,');
      Add('        TO_NUMBER(DECODE(F.TIPOPAGAMENTO,');
      Add('          ''M'',F.SALARIOATUAL,');
      Add('              HT.JORNADAMENSAL * F.SALARIOATUAL');
      Add('      ))');
      Add('  )),0) AS REMUNERACAO');
    end
    else
    begin
      Add('  NVL(TO_NUMBER(DECODE(SF.TIPOSIT,');
      Add('    ''D'',VAL_REM_DEM.VALOR,');
      Add('        VAL_REM.VALOR');
      Add('  )),0) AS REMUNERACAO');
    end;
    // -------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA P, PESSOAFISICA PF, FUNCIONARIO F, CARGO C,');
    Add('  HORATRAB HT, SITFUNC SF, GRINSTR GR,');
    // -------------------------------------------------------------------- //
    // Remuneração Normal
    if (FListaIdRubSel <> '') then
    begin
      Add('  (SELECT');
      Add('     H.IDPESSOA,');
      Add('     SUM(TO_NUMBER(DECODE(PD.FLGDESCONTO,');
      aDD('         1,-H.VALORPROVENTO,');
      Add('         H.VALORPROVENTO');
      Add('     ))) AS VALOR');
      Add('   FROM');
      Add('     HISTRUBSAL H, PROVDESC PD, FUNCIONARIO F, SITFUNC SF');
      Add('   WHERE');
      Add('     (SF.TIPOSIT    <> ''D'') AND');
      Add(MontaLinhaSelSQL('     (F.IDESTAB',FListaIdEstab,6));
      Add(MontaLinhaSelSQL('     (F.TIPOCONTRATO',FTipoContrato,1));
      Add(MontaLinhaSelSQL('     (H.CODPROVDESC',QuotedListaString(FListaIdRubSel,','),2));
      Add('     (H.MES          = ' +QuotedStr(FAnoMes)+ ') AND');
      Add('     (H.IDPESSJUR    = ' +IntToStr(FIdEmpresa)+ ') AND');
      Add('     (F.IDSITFUNC    = SF.IDSITFUNC) AND');
      Add('     (F.IDPESSOA     = H.IDPESSOA) AND');
      Add('     (H.IDRUBRICA    = PD.IDPROVENTO)');
      Add('   GROUP BY');
      Add('     H.IDPESSOA) VAL_REM,');
    end;
    // -------------------------------------------------------------------- //
    // Remuneração para Demissão
    Add('  (SELECT');
    Add('     H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM');
    Add('     HISTRUBSAL H, FUNCIONARIO F, PROVDESC PD, SITFUNC SF');
    Add('   WHERE');
    Add('     (SF.TIPOSIT          = ''D'') AND');
    Add('     (PD.CODRUBCLT        = ''63012'') AND');
    Add('     (H.IDPESSJUR         = ' +IntToStr(FIdEmpresa)+ ') AND');
    Add('     (H.MES               = ' +QuotedStr(FAnoMes)+ ') AND');
    Add(MontaLinhaSelSQL('     (F.IDESTAB',FListaIdEstab,10));
    Add(MontaLinhaSelSQL('     (F.TIPOCONTRATO',FTipoContrato,5));
    Add('     (F.DATADESLIGAMENTO IS NOT NULL) AND');
    Add('     (F.IDSITFUNC         = SF.IDSITFUNC) AND');
    Add('     (F.IDPESSOA          = H.IDPESSOA) AND');
    Add('     (H.IDRUBRICA         = PD.IDPROVENTO)');
    Add('   GROUP BY');
    Add('     H.IDPESSOA) VAL_REM_DEM,');
    // -------------------------------------------------------------------- //
    // Última situação funcional
    Add('  (SELECT DISTINCT');
    Add('     H.IDPESSOA, H.IDMOVCONTRCAGED');
    Add('   FROM');
    Add('     HSTSITFUNC H,');
    Add('     (SELECT H.IDPESSOA, MAX(H.DATASITFUNC) DATA_MAX');
    Add('      FROM   HSTSITFUNC H, SITFUNC SF');
    Add('      WHERE  (SF.TIPOSIT   = ''A'') AND');
    Add('             (SF.IDSITFUNC = H.IDSITFUNC)');
    Add('      GROUP BY IDPESSOA) MAX_HIST');
    Add('   WHERE (H.IDPESSOA    = MAX_HIST.IDPESSOA) AND');
    Add('         (H.DATASITFUNC = MAX_HIST.DATA_MAX)) HIST_SIT,');
    // -------------------------------------------------------------------- //
    // CTPS
    Add('  (SELECT');
    Add('     F.IDPESSOA, TDP.MASCARA, DP.NUMDOCUMENTO AS NUM, ES.CODESTADO AS UF');
    Add('   FROM');
    Add('     DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO, TIPODOCPESSOA TDP, ESTADO ES');
    Add('   WHERE');
    Add('     (TDO.SIGLADOCUMENTO = ''CTPS:'') AND');
    Add('     (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('     (TDP.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('     (F.IDPESSOA         = DP.IDPESSOA) AND');
    Add('     (DP.IDESTADO        = ES.IDESTADO)) CTPS,');
    // -------------------------------------------------------------------- //
    // PIS
    Add('  (SELECT');
    Add('     F.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM');
    Add('     DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO');
    Add('   WHERE');
    Add('     (TDO.SIGLADOCUMENTO = ''PIS/PASEP:'') AND');
    Add('     (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('     (DP.IDPESSOA        = F.IDPESSOA)) PIS');
    // -------------------------------------------------------------------- //
    Add('WHERE');
    Add(MontaLinhaSelSQL('  (F.TIPOCONTRATO',FTipoContrato,1));
    Add(MontaLinhaSelSQL('  (F.IDPESSOA',sListaIdPessoa,5));
    Add('  (F.IDPESSOA      = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA      = P.IDPESSOA) AND');
    Add('  (PF.IDGRINSTR    = GR.IDGRINSTR(+)) AND');
    Add('  (F.IDHORARIO     = HT.IDHORARIO(+)) AND');
    Add('  (F.IDCARGO       = C.IDCARGO(+)) AND');
    Add('  (F.IDSITFUNC     = SF.IDSITFUNC(+)) AND');
    Add('  (F.IDPESSOA      = CTPS.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA      = PIS.IDPESSOA(+)) AND');

    if (FListaIdRubSel <> '') then
      Add('  (F.IDPESSOA      = VAL_REM.IDPESSOA(+)) AND');

    Add('  (F.IDPESSOA      = HIST_SIT.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA      = VAL_REM_DEM.IDPESSOA(+))');
    Add('ORDER BY');
    Add('  IDESTAB, EMPREGADO');
    SaveToFile(DirTempLog + '\qry.txt');
  end;
  IncProgresso(0, false, false, true, false);
  FCdsPrincipal.Data := GetDataPacket(FSQL);
  Result := not(FCdsPrincipal.IsEmpty);
  if not(Result) then
    MessageInfo := CMTranslateMsg(MSG_SEM_DADOS_MOVIM, [CR_LF]);
end;

function TCtrlParamCAGEDMagnetico.AbrirQueryNumPessoasMesAnterior: boolean;
var
  _SQLPrincipal: string;
begin
  _SQLPrincipal := FSQL.Text;
  try
    with (FSQL) do
    begin
      Clear;
      Add('SELECT');
      Add('  HST_EVOL.IDESTAB, COUNT(F.IDPESSOA) AS NUMERO');
      Add('FROM');
      Add('  FUNCIONARIO F,');
      Add('  (SELECT DISTINCT');
      Add('     SF.IDPESSOA');
      Add('   FROM');
      Add('     HSTSITFUNC SF, SITFUNC S,');
      Add('     (SELECT IDPESSOA, MAX(DATASITFUNC) AS DATA');
      Add('      FROM   HSTSITFUNC');
      Add('      WHERE  (TO_CHAR(DATASITFUNC,''YYYY/MM'') < ' +QuotedStr(FAnoMes)+ ')');
      Add('      GROUP BY IDPESSOA');
      Add('     ) ULT_SF');
      Add('   WHERE');
      Add('     (S.TIPOSIT     IN (''A'',''F'')) AND');
      Add('     (SF.IDSITFUNC   = S.IDSITFUNC) AND');
      Add('     (SF.IDPESSOA    = ULT_SF.IDPESSOA) AND');
      Add('     (SF.DATASITFUNC = ULT_SF.DATA)) HST_SIT,');

      Add('  (SELECT DISTINCT');
      Add('     EF.IDPESSOA, EF.IDESTAB');
      Add('   FROM');
      Add('     EVOLFUNC EF,');
      Add('     (SELECT IDPESSOA, MAX(DATAALTERFUNC) AS DATAALTERFUNC');
      Add('      FROM   EVOLFUNC');
      Add('      WHERE  (TO_CHAR(DATAALTERFUNC,''YYYY/MM'') < ' +QuotedStr(FAnoMes)+ ')');
      Add('      GROUP BY IDPESSOA) HST1,');
      Add('     (SELECT EV.IDPESSOA, MAX(EV.TRGDTINCLUSAO) AS DATAINCLUSAO');
      Add('      FROM   EVOLFUNC EV,');
      Add('             (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
      Add('              FROM   EVOLFUNC');
      Add('              WHERE  (TO_CHAR(DATAALTERFUNC,''YYYY/MM'') < ' +QuotedStr(FAnoMes)+ ')');
      Add('              GROUP BY IDPESSOA) H');
      Add('      WHERE');
      Add('        (EV.IDPESSOA      = H.IDPESSOA) AND');
      Add('        (EV.DATAALTERFUNC = H.DATAALTERFUNC)');
      Add('      GROUP BY EV.IDPESSOA) HST2');
      Add('   WHERE');
      Add(MontaSelSQL('EF.IDESTAB',FListaIdEstab,5,6));
      Add('     (EF.IDPESSOA      = HST1.IDPESSOA) AND');
      Add('     (EF.DATAALTERFUNC = HST1.DATAALTERFUNC) AND');
      Add('     (EF.IDPESSOA      = HST2.IDPESSOA) AND');
      Add('     (EF.TRGDTINCLUSAO = HST2.DATAINCLUSAO)) HST_EVOL');

      Add('WHERE');
      Add('  (F.TIPOCONTRATO IN (''E'',''S'')) AND');
      Add('  (TO_CHAR(F.DATAADMISSAO,''YYYY/MM'') < ' +QuotedStr(FAnoMes)+ ') AND');
      Add('  (F.IDPESSOA = HST_SIT.IDPESSOA) AND');
      Add('  (F.IDPESSOA = HST_EVOL.IDPESSOA)');
      Add('GROUP BY');
      Add('  HST_EVOL.IDESTAB');

{      Add('  (SELECT DISTINCT');
      Add('     EF.IDPESSOA, EF.IDESTAB');
      Add('   FROM');
      Add('     EVOLFUNC EF,');
      Add('     (SELECT IDPESSOA, MAX(DATAALTERFUNC) AS DATA');
      Add('      FROM   EVOLFUNC');
      Add('      WHERE  (TO_CHAR(DATAALTERFUNC,''YYYY/MM'') < ' +QuotedStr(FAnoMes)+ ')');
      Add('      GROUP BY IDPESSOA');
      Add('     ) ULT_EF');
      Add('   WHERE');
      Add(MontaLinhaSelSQL('     (EF.IDESTAB',FListaIdEstab,6));
      Add('     (EF.IDPESSOA      = ULT_EF.IDPESSOA) AND');
      Add('     (EF.DATAALTERFUNC = ULT_EF.DATA)) HST_EVOL');}

      {Add('SELECT');
      Add('  HST.IDESTAB, COUNT(F.IDPESSOA) AS NUMERO');
      Add('FROM');
      Add('  FUNCIONARIO F, SITFUNC SF,');
      // -------------------------------------------------------------------- //
      Add('  (SELECT DISTINCT');
      Add('     EF.IDPESSOA, EF.IDESTAB');
      Add('   FROM');
      Add('     EVOLFUNC EF,');
      Add('     (SELECT IDPESSOA, MAX(DATAALTERFUNC) AS DATA');
      Add('      FROM   EVOLFUNC');
      Add('      WHERE  (TO_CHAR(DATAALTERFUNC,''YYYY/MM'') < ' +QuotedStr(FAnoMes)+ ')');
      Add('      GROUP BY IDPESSOA');
      Add('     ) ULT_EF');
      Add('   WHERE');
      Add('     (EF.IDESTAB  IS NOT NULL) AND');
      Add('     (EF.IDPESSOA      = ULT_EF.IDPESSOA) AND');
      Add('     (EF.DATAALTERFUNC = ULT_EF.DATA)) HST');
      // -------------------------------------------------------------------- //
      Add('WHERE');
      Add(MontaLinhaSelSQL('  (F.TIPOCONTRATO',FTipoContrato,1));
      Add('  (TO_CHAR(F.DATAADMISSAO,''YYYY/MM'') < ' +QuotedStr(FAnoMes)+ ') AND');
      Add('  (F.IDSITFUNC     = SF.IDSITFUNC) AND');
      Add('  (');
      Add('    (SF.TIPOSIT   IN (''A'',''F'')) OR');
      Add('    (');
      Add('      (SF.TIPOSIT  = ''D'') AND');
      Add('      (TO_CHAR(F.DATADESLIGAMENTO,''YYYY/MM'') >= ' +QuotedStr(FAnoMes)+ ')');
      Add('    )');
      Add('  ) AND');
      Add(MontaLinhaSelSQL('  (HST.IDESTAB ',FListaIdEstab,1));
      Add('  (F.IDPESSOA   = HST.IDPESSOA)');
      Add('GROUP BY');
      Add('  HST.IDESTAB');}
      SaveToFile(DirTempLog + '\qryNumPessoasMesAnterior.txt');
    end;
    FCdsNumPessoasMesAnterior.Data := GetDataPacket(FSQL);
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
  FSQL.Text := _SQLPrincipal;
end;

function TCtrlParamCAGEDMagnetico.GetIdEstabAntesTransf(IdPessoa: double): double;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  EF.IDESTAB, ULT_EF.DATA' +CR_LF+
      'FROM' +CR_LF+
      '  EVOLFUNC EF,' +CR_LF+
      '  (SELECT MAX(DATAALTERFUNC) AS DATA' +CR_LF+
      '   FROM   EVOLFUNC' +CR_LF+
      '   WHERE  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
      '          (TO_CHAR(DATAALTERFUNC,''YYYY/MM'') < ' +QuotedStr(FAnoMes)+ ')' +CR_LF+
      '  ) ULT_EF' +CR_LF+
      'WHERE' +CR_LF+
      '  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
      '  (DATAALTERFUNC = ULT_EF.DATA)');
    Result := _CdsAux.FieldByName('IDESTAB').asFloat;
  finally
    _CdsAux.Free;
  end;
end;

function TCtrlParamCAGEDMagnetico.GetNumPessoasMesAnterior(const IdEstab: double): string;
var
  iNum: integer;
  //dIdEstab: double;
begin
  //FLog.Inserir('IdEstab = ' +FloatToStr(IdEstab));
  if (FCdsNumPessoasMesAnterior.Locate('IDESTAB', IdEstab, [])) then
  begin
    iNum := FCdsNumPessoasMesAnterior.FieldByName('NUMERO').asInteger;
    {FLog.Inserir('NumPessoasMesAnterior = ' +IntToStr(iNum));
    FLog.Inserir('Num. Reg. = ' +IntToStr(FCdsTransfMesmaEmpresa.RecordCount));
    FCdsTransfMesmaEmpresa.First;
    while not(FCdsTransfMesmaEmpresa.EOF) do
    begin
      FLog.Inserir('IdPessoa = ' +FCdsTransfMesmaEmpresa.FieldByName('IDPESSOA').asString);
      dIdEstab := GetIdEstabAntesTransf(FCdsTransfMesmaEmpresa.FieldByName('IDPESSOA').asFloat);
      if (dIdEstab = IdEstab) then
        Inc(iNum);
      FLog.Inserir(FloatToStr(dIdEstab) +' = IdEstab: '+ BoolToStr(dIdEstab = IdEstab, true));
      FLog.Inserir('  Num = ' +IntToStr(iNum));
      FCdsTransfMesmaEmpresa.Next;
    end;}
  end
  else
    iNum := 0;

  Result := IntToStr(iNum);
end;

function TCtrlParamCAGEDMagnetico.GetNumeroCTPS(Campo: string): string;
var
  c: byte;
  sAux: string;
begin
  sAux := '';
  for c:=1 to length(Campo) do
    if (Campo[c] in ['0'..'9']) then
      sAux := sAux + Campo[c];

  Result := Alinha(Copy(sAux,1,7), 7, 'D', '0');
end;

function TCtrlParamCAGEDMagnetico.GetSerieCTPS(Campo: string): string;
var
  c: byte;
  sAux: string;
begin
  sAux := '';
  for c:=1 to length(Campo) do
    if (Campo[c] in ['0'..'9']) then
      sAux := sAux + Campo[c];

  Result := Alinha(UltimosCaracteres(sAux,3), 3, 'D', '0'); // Somente os 3 últimos dígitos
end;

function TCtrlParamCAGEDMagnetico.GetNumEstab: integer;
var
  dIdEstab: double;
begin
  FCdsPrincipal.First;
  Result := 1;
  dIdEstab := FCdsPrincipal.FieldByName('IDESTAB').asFloat;
  repeat
    if (FCdsPrincipal.FieldByName('IDESTAB').asFloat <> dIdEstab) then
    begin
      dIdEstab := FCdsPrincipal.FieldByName('IDESTAB').asFloat;
      Inc(Result);
    end;
    FCdsPrincipal.Next;
  until (FCdsPrincipal.EOF);
end;

function TCtrlParamCAGEDMagnetico.GetNumMovimentacoes: integer;
begin
  Result := 0;
  FCdsPrincipal.First;
  repeat
    if (RetornaAnoMes(FCdsPrincipal.FieldByName('DATAADMISSAO').asDateTime) = FAnoMes) then
      Inc(Result);

    if (RetornaAnoMes(FCdsPrincipal.FieldByName('DATADESLIGAMENTO').asDateTime) = FAnoMes) then
      Inc(Result);

    FCdsPrincipal.Next;
  until (FCdsPrincipal.EOF);
end;

procedure TCtrlParamCAGEDMagnetico.GerarRegistro_CabecalhoArquivo;
begin
  FArq.Add(
    // 01-Tipo do registro
    'A'+
    // 02-Meio Informado (2->Disquete; 3->Fita; 4->Outros)
    IntToStr(FTipoMeioInformacao)+
    // 03-Número de Autorização
    fValidaDados('N', FNumAutorizacao, 7)+
    // 04-Competência (no formato MMAAAA)
    Copy(FAnoMes,6,2) + Copy(FAnoMes,1,4)+
    // 05-Alteração de dados cadastrais
    IntToStr(FAlterarDadosCadResp)+
    // 06-Sequência (Número seqüencial no arquivo)
    fValidaDados('N', IntToStr(FNumSequencia), 5)+
    // 07-Tipo de inscrição do responsável (1->CGC/CNPJ; 2->CEI)
    FCdsResp.FieldByName('TIPO_INSCRICAO').asString+
    // 08-Inscrição do responsável
    fValidaDados('N', FCdsResp.FieldByName('INSCRICAO').asString, 14)+
    // 09-Nome do responsável (Razão social)
    fValidaDados('A', FCdsResp.FieldByName('NOME').asString, 35)+
    // 10-Endereço
    fValidaDados('*', FCdsResp.FieldByName('ENDERECO').asString, 40)+
    // 11-CEP
    fValidaDados('*', FCdsResp.FieldByName('CEP').asString, 8)+
    // 12-UF
    fValidaDados('A', FCdsResp.FieldByName('UF').asString, 2)+
    // 13-DDD
    fValidaDados('N', FCdsResp.FieldByName('DDD').asString, 4)+
    // 14-Telefone
    fValidaDados('N', FCdsResp.FieldByName('TELEFONE').asString, 8)+
    // 15-Ramal
    fValidaDados('N', FCdsResp.FieldByName('RAMAL').asString, 5)+
    // 16-Total de Estabelecimentos informados (Quantidade de Registros B)
    fValidaDados('N', IntToStr(FNumEstab), 5)+
    // 17-Total de Movimentações informadas (Quantidade de Registros C ou X)
    fValidaDados('N', IntToStr(FNumMoviment), 5)+
    // 18-Final de linha
    Replicate(' ', 2));
end;

procedure TCtrlParamCAGEDMagnetico.GerarRegistro_CabecalhoEstab;
var
  cMicroEmpr: char;
begin
  Inc(FNumSequencia);
  if(FMicroEmpresa) then
    cMicroEmpr := '1'
  else
    cMicroEmpr := '2';

  FArq.Add(
    // 01-Tipo do registro
    'B'+
    // 02-Tipo de inscrição (1->CGC/CNPJ; 2->CEI)
    FCdsEstab.FieldByName('TIPO_INSCRICAO').asString+
    // 03-Inscrição
    fValidaDados('N', FCdsEstab.FieldByName('INSCRICAO').asString, 14)+
    // 04-Sequência (Número seqüencial no arquivo)
    fValidaDados('N', IntToStr(FNumSequencia), 5)+
    // 05-1ª Declaração
    IFF(FPrimeiraDeclaracao, '1', '2')+
    // 06-Alteração de dados cadastrais
    IntToStr(FAlterarDadosCadEstab)+
    // 07-CEP
    fValidaDados('N', FCdsEstab.FieldByName('CEP').asString, 8)+
    // 08-Atividade Econômica
    fValidaDados('N', FCdsEstab.FieldByName('CNAE').asString, 5)+
    // 09-Nome do Estabelecimento (Razão social)
    fValidaDados('A', FCdsEstab.FieldByName('NOME').asString, 40)+
    // 10-Endereço
    fValidaDados('*', FCdsEstab.FieldByName('ENDERECO').asString, 40)+
    // 11-Bairro
    fValidaDados('A', FCdsEstab.FieldByName('BAIRRO').asString, 20)+
    // 12-UF
    fValidaDados('A', FCdsEstab.FieldByName('UF').asString, 2)+
    // 13-Total de Empregados existentes no 1º dia
    fValidaDados('N', GetNumPessoasMesAnterior(FCdsEstab.FieldByName('IDESTAB').asFloat), 5)+
    // 14-Se é Pequena ou Micro Empresa (S->Sim; N->Não)
    cMicroEmpr+
    // 14-FILLER
    Replicate(' ', 6));
end;

function TCtrlParamCAGEDMagnetico.GetRegistroC(DataDesl, TipoMov: string): string;
begin
  Inc(FNumSequencia);
  Result :=
    // 01-Tipo do registro
    'C'+
    // 02-Tipo de inscrição do Estabelecimento (1->CGC/CNPJ; 2->CEI)
    FCdsEstab.FieldByName('TIPO_INSCRICAO').asString+
    // 03-Inscrição do Estabelecimento
    fValidaDados('N', FCdsEstab.FieldByName('INSCRICAO').asString, 14)+
    // 04-Sequência (Número seqüencial no arquivo)
    fValidaDados('N', IntToStr(FNumSequencia), 5)+
    // 05-PIS/PASEP
    fValidaDados('N', FCdsPrincipal.FieldByName('PIS').asString, 11)+
    // 06-Sexo
    fValidaDados('N', FCdsPrincipal.FieldByName('SEXO').asString, 1)+
    // 07-Data de nascimento
    fValidaDados('N', TiraBarra(FCdsPrincipal.FieldByName('DATANASC').asString), 8)+
    // 08-Grau de Instrução
    fValidaDados('N', FCdsPrincipal.FieldByName('GRAU_INSTR').asString, 1)+
    // 09-FILLER
    Replicate(' ', 5)+
    // 10-Remuneração
    fValidaDados('N', FormatFloat('#########0.00',
      FCdsPrincipal.FieldByName('REMUNERACAO').asFloat), 8)+
    // 11-Horas Trabalhadas
    fValidaDados('N', FloatToStr(Arredondar(FCdsPrincipal.FieldByName('HRS_TRAB').asFloat,0)), 2)+
    // 12-Data de admissão
    TiraBarra(FCdsPrincipal.FieldByName('DATAADMISSAO').asString)+
    // 13-Tipo de Movimentação
    fValidaDados('N', TipoMov, 2)+
    // 14-Dia de Desligamento
    IFF(DataDesl = '', '  ', DataDesl)+
    // 15-Nome do Empregado
    fValidaDados('A', FCdsPrincipal.FieldByName('EMPREGADO').asString, 40)+
    // 16-Número da CTPS
    '0' + GetNumeroCTPS(FCdsPrincipal.FieldByName('CTPS').asString)+
    // 17-Série da CTPS
    '0' + GetSerieCTPS(FCdsPrincipal.FieldByName('CTPS').asString)+
    // 18-FILLER
    Replicate(' ', 7)+
    // 20-Raça/Cor (1->Indígena; 2->Branca; 4->Preta; 6->Amarela; 8->Parda; 9->Não informado)
    fValidaDados('N', FCdsPrincipal.FieldByName('CORPESSOA').asString, 1)+
    // 21-Deficiente físico (1->SIM; 2->NÃO)
    //   Preencher com, no módulo gerador (S->SIM; N->NÃO)
    FCdsPrincipal.FieldByName('DEFICIENTE').asString+
    // 22-CBO
    fValidaDados('N', FCdsPrincipal.FieldByName('CBO').asString, 6)+
    // 23-Menor Aprendiz (1 -> SIM; 2 -> NÃO)
    IFF(FCdsPrincipal.FieldByName('IDCATEMPRGRE').asInteger = 7, '1', '2')+
    // 24-UF da CTPS
    fValidaDados('A', FCdsPrincipal.FieldByName('CTPS_UF').asString, 2)+
    // 25-FILLER
    Replicate(' ', 11);
end;

function TCtrlParamCAGEDMagnetico.GetRegistroX(DataDesl, TipoMov: string): string;
var
  I: byte;
begin
  // Por padrão o sistema gera arquivos de Acerto SEMPRE com registros tipo ALTERAÇÃO.
  // Para processar esta alteração, será necessário gerar um registro tipo EXCLUSÃO e
  // em seguida um outro registro do tipo INCLUSÃO.
  Inc(FNumSequencia);
  Result := '';
  for I:=1 to 2 do
  begin
    Result := Result +
      // 01-Tipo do registro
      'X'+
      // 02-Tipo de inscrição do Estabelecimento (1->CGC/CNPJ; 2->CEI)
      FCdsEstab.FieldByName('TIPO_INSCRICAO').asString+
      // 03-Inscrição do Estabelecimento
      fValidaDados('N', FCdsEstab.FieldByName('INSCRICAO').asString, 14)+
      // 04-Sequência (Número seqüencial no arquivo)
      fValidaDados('N', IntToStr(FNumSequencia), 5)+
      // 05-PIS/PASEP
      fValidaDados('N', FCdsPrincipal.FieldByName('PIS').asString, 11)+
      // 06-Sexo
      fValidaDados('N', FCdsPrincipal.FieldByName('SEXO').asString, 1)+
      // 07-Data de nascimento
      fValidaDados('N', TiraBarra(FCdsPrincipal.FieldByName('DATANASC').asString), 8)+
      // 08-Grau de Instrução
      fValidaDados('N', FCdsPrincipal.FieldByName('GRAU_INSTR').asString, 1)+
      // 09-FILLER
      Replicate(' ', 5)+
      // 10-Remuneração
      fValidaDados('N', FormatFloat('#########0.00',
        FCdsPrincipal.FieldByName('REMUNERACAO').asFloat), 8)+
      // 11-Horas Trabalhadas
      fValidaDados('N', FloatToStr(Arredondar(FCdsPrincipal.FieldByName('HRS_TRAB').asFloat,0)), 2)+
      // 12-Data de admissão
      TiraBarra(FCdsPrincipal.FieldByName('DATAADMISSAO').asString)+
      // 13-Tipo de Movimentação
      fValidaDados('N', TipoMov, 2)+
      // 14-Dia de Desligamento
      IFF(DataDesl = '', '  ', DataDesl)+
      // 15-Nome do Empregado
      fValidaDados('A', FCdsPrincipal.FieldByName('EMPREGADO').asString, 40)+
      // 16-Número da CTPS
      '0' + GetNumeroCTPS(FCdsPrincipal.FieldByName('CTPS').asString)+
      // 17-Série da CTPS
      '0' + GetSerieCTPS(FCdsPrincipal.FieldByName('CTPS').asString)+
      // 18-Atualização, numérico, 1 posição
      // Informar o procedimento a ser seguido:
      // 1 -> exclusão de registro
      // 2 -> inclusão de registro
      // 1º registro=1 e 2º registro=2 -> alteração de registro
      IntToStr(I)+
      // 19-Competência (no formato MMAAAA)
      Copy(FAnoMes,6,2) + Copy(FAnoMes,1,4)+
      // 20-Raça/Cor (1->Indígena; 2->Branca; 4->Preta; 6->Amarela; 8->Parda; 9->Não informado)
      fValidaDados('N', FCdsPrincipal.FieldByName('CORPESSOA').asString, 1)+
      // 21-Deficiente físico (1->SIM; 2->NÃO) / Preencher com, no módulo gerador (S->SIM; N->NÃO)
      fValidaDados('N', FCdsPrincipal.FieldByName('DEFICIENTE').asString, 1)+
      // 22-CBO
      fValidaDados('N', FCdsPrincipal.FieldByName('CBO').asString, 6)+
      // 23-Menor Aprendiz (1 -> SIM; 2 -> NÃO)
      IFF(FCdsPrincipal.FieldByName('IDCATEMPRGRE').asInteger = 7, '1', '2')+
      // 24-UF da CTPS
      fValidaDados('A', FCdsPrincipal.FieldByName('CTPS_UF').asString, 2)+
      // 25-Final de linha
      Replicate(' ',11)+
      // A linha abaixo foi incluída para gerar um salto de linha no primeiro registro X
      IFF(I=1, CR_LF, '');

    if (I = 1) then
      Inc(FNumSequencia);
  end;
end;

procedure TCtrlParamCAGEDMagnetico.GerarRegistro_Detalhe;
var
  sTipoMov, sTipoMovAnt, sTipoMovAtu: string;
begin
  // Movimentação atual
  sTipoMovAtu := Trim(FCdsPrincipal.FieldByName('TIPO_MOVIMENTACAO').asString);

  // Movimentação anterior (se existir)
  if (FCdsFunc2Moviment.Locate('IDPESSOA',
      FCdsPrincipal.FieldByName('IDPESSOA').asFloat, [])) then
    sTipoMovAnt := Trim(FCdsFunc2Moviment.FieldByName('TIPO_MOVIMENTACAO_HIST').asString)
  else
    sTipoMovAnt := Trim(FCdsPrincipal.FieldByName('TIPO_MOVIMENTACAO_HIST').asString);

  if (sTipoMovAnt <> '') then
    sTipoMov := sTipoMovAnt
  else
    sTipoMov := sTipoMovAtu;

  // Gerar o registro de uma Admissão ou Transferência de Entrada
  if (RetornaAnoMes(FCdsPrincipal.FieldByName('DATAADMISSAO').asDateTime) = FAnoMes) or
     ((FCdsPrincipal.FieldByName('DATADESLIGAMENTO').IsNull) and
      (FCdsPrincipal.FieldByName('TRANSFERENCIA').asInteger = 1)) then
  begin
    if (FCAGEDNormal) then
      FArq.Add(GetRegistroC('  ', sTipoMov))
    else
      FArq.Add(GetRegistroX('  ', sTipoMov));
  end;

  // Gerar o registro de uma Demissão ou Transferência de Saída
  if (RetornaAnoMes(FCdsPrincipal.FieldByName('DATADESLIGAMENTO').asDateTime) = FAnoMes) and
     (FCdsPrincipal.FieldByName('DATARETORNO').asString = '') and
     ((FCdsPrincipal.FieldByName('SITUACAO').asString = 'D') or
      (FCdsPrincipal.FieldByName('TRANSFERENCIA').asInteger = 1)) then
  begin
    if (FCAGEDNormal) then
      FArq.Add(GetRegistroC(PoeZero(ExtraiDia(
        FCdsPrincipal.FieldByName('DATADESLIGAMENTO').asDateTime)), sTipoMovAtu))
    else
      FArq.Add(GetRegistroX(PoeZero(ExtraiDia(
        FCdsPrincipal.FieldByName('DATADESLIGAMENTO').asDateTime)), sTipoMov));
  end;
end;

function TCtrlParamCAGEDMagnetico.IniciarProcessamento(IdEmpresa: integer;
  ListaIdEstab, ListaIdRub: string; IdResponsavel: double; Mes, Ano: word;
  TipoContrato: string; TipoMeioInformacao: integer; NumAutorizacao: string;
  CAGEDNormal: boolean; AlterarDadosCadResp, AlterarDadosCadEstab: integer;
  PrimeiraDeclaracao, MicroEmpresa: boolean): boolean;
begin
  FIdEmpresa := IdEmpresa;
  FListaIdRubSel := ListaIdRub;
  FListaIdEstab := ListaIdEstab;
  FIdResponsavel := IdResponsavel;
  FTipoContrato := TipoContrato;
  FTipoMeioInformacao := TipoMeioInformacao;
  FNumAutorizacao := NumAutorizacao;
  FCAGEDNormal := CAGEDNormal;
  FAlterarDadosCadResp := AlterarDadosCadResp;
  FAlterarDadosCadEstab := AlterarDadosCadEstab;
  FPrimeiraDeclaracao := PrimeiraDeclaracao;
  FMicroEmpresa := MicroEmpresa;

  FAnoMes := IntToStr(Ano) +'/'+ PoeZero(Mes);

  Result := (AbrirQueryEstabelecimento) and (AbrirQueryResponsavel) and
    (AbrirQueryAdmitidosDemitidos) and (AbrirQueryTransfDeOutraEmpresa) and
    (AbrirQueryTransfParaOutraEmpresa) and (AbrirQueryTransfMesmaEmpresa) and
    (AbrirQueryPrincipal) and (AbrirQueryNumPessoasMesAnterior);
end;

function TCtrlParamCAGEDMagnetico.VerificarFunc2Moviment: boolean;
begin
  // Verificar se há alguma dupla movimentação no mês que não possui o primeiro Registro
  FCdsFunc2Moviment.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  0 AS IDPESSOA,'+CR_LF+
    '  RPAD(''1'',60,''1'') AS EMPREGADO,'+CR_LF+
    '  ''11'' AS TIPO_MOVIMENTACAO_HIST,'+CR_LF+
    '  ''11'' AS TIPO_MOVIMENTACAO,'+CR_LF+
    '  RPAD(''1'',10,''1'') AS DATAADMISSAO,'+CR_LF+
    '  RPAD(''1'',10,''1'') AS DATADESLIGAMENTO'+CR_LF+
    'FROM'+CR_LF+
    '  DUAL'+CR_LF+
    'WHERE'+CR_LF+
    '  (1 = 2)');

  repeat
    if (RetornaAnoMes(FCdsPrincipal.FieldByName('DATAADMISSAO').asDateTime) = FAnoMes) and
       (RetornaAnoMes(FCdsPrincipal.FieldByName('DATADESLIGAMENTO').asDateTime) = FAnoMes) and
       (Trim(FCdsPrincipal.FieldByName('TIPO_MOVIMENTACAO_HIST').asString) = '') then
    begin
      FCdsFunc2Moviment.Insert;
      FCdsFunc2Moviment.FieldByName('IDPESSOA').asString :=
        FCdsPrincipal.FieldByName('IDPESSOA').asString;
      FCdsFunc2Moviment.FieldByName('EMPREGADO').asString :=
        FCdsPrincipal.FieldByName('EMPREGADO').asString;
      FCdsFunc2Moviment.FieldByName('TIPO_MOVIMENTACAO').asString :=
        FCdsPrincipal.FieldByName('TIPO_MOVIMENTACAO').asString;
      FCdsFunc2Moviment.FieldByName('DATAADMISSAO').asString :=
        FCdsPrincipal.FieldByName('DATAADMISSAO').asString;
      FCdsFunc2Moviment.FieldByName('DATADESLIGAMENTO').asString :=
        FCdsPrincipal.FieldByName('DATADESLIGAMENTO').asString;
      FCdsFunc2Moviment.Post;
    end;
    FCdsPrincipal.Next;
  until (FCdsPrincipal.EOF);

  Result := not(FCdsFunc2Moviment.IsEmpty);
end;

function TCtrlParamCAGEDMagnetico.GerarRegTransferencias: boolean;
var
  c: byte;
  dIdEstab: double;
  //bkPos: TBookmark;
  dtDataTransf: TDate;
  RegistroAux: array of variant;
  bTransfMesmaEmpresa, bTransfDeOutraEmpresa, bTransfParaOutraEmpresa: boolean;
  _CdsOutroEstab, _CdsEstabAntesTransf, _CdsAux: TCMClientDataSet;

{-->}function GetDataTransf(Cds: TCMClientDataSet; IdPessoa: double): TDate;
     begin
       Cds.Locate('IDPESSOA', IdPessoa, []);
       Result := Cds.FieldByName('DATA').asDateTime;
{-->}end;

{-->}function GetDataAntesTransf(IdPessoa: double): TDate;
     begin
       _CdsEstabAntesTransf.Data := GetDataPacket(
         'SELECT' +CR_LF+
         '  IDESTAB, MAX(DATAALTERFUNC) AS DATA' +CR_LF+
         'FROM' +CR_LF+
         '  EVOLFUNC' +CR_LF+
         'WHERE' +CR_LF+
         '  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
         '  (TO_CHAR(DATAALTERFUNC,''YYYY/MM'') < ' +QuotedStr(FAnoMes)+ ')' +CR_LF+
         'GROUP BY' +CR_LF+
         '  IDESTAB');
       Result := _CdsEstabAntesTransf.FieldByName('DATA').asDateTime;
{-->}end;

begin
  _CdsOutroEstab := TCMClientDataSet.Create(nil);
  _CdsEstabAntesTransf := TCMClientDataSet.Create(nil);
  _CdsAux := TCMClientDataSet.Create(nil);

  SetLength(RegistroAux, FCdsPrincipal.FieldCount);

  _CdsAux.Data := FCdsPrincipal.Data;
  try
    try
      _CdsAux.First;
      repeat
        FCdsPrincipal.Locate('IDPESSOA', _CdsAux.FieldByName('IDPESSOA').asFloat, []);
        bTransfMesmaEmpresa := FCdsTransfMesmaEmpresa.Locate('IDPESSOA',
          FCdsPrincipal.FieldByName('IDPESSOA').asFloat, []);
        bTransfDeOutraEmpresa := FCdsTransfDeOutraEmpresa.Locate('IDPESSOA',
          FCdsPrincipal.FieldByName('IDPESSOA').asFloat, []);
        bTransfParaOutraEmpresa := FCdsTransfParaOutraEmpresa.Locate('IDPESSOA',
          FCdsPrincipal.FieldByName('IDPESSOA').asFloat, []);

        // Transferência entre Estabelecimentos da mesma Empresa Proprietária
        if (bTransfMesmaEmpresa) then
        begin
          dtDataTransf := GetDataTransf(FCdsTransfMesmaEmpresa,
            FCdsPrincipal.FieldByName('IDPESSOA').asFloat);

          // Salvar os dados do registro atual
          for c:=0 to FCdsPrincipal.FieldCount-1 do
            RegistroAux[c] := FCdsPrincipal.Fields[c].Value;

          // O registro atual será o registro de entrada no Estabelecimento Novo
          FCdsPrincipal.Edit;
          FCdsPrincipal.FieldByName('DATAADMISSAO').asDateTime := dtDataTransf;
          FCdsPrincipal.FieldByName('DATARETORNO').Clear;
          FCdsPrincipal.FieldByName('DATADESLIGAMENTO').Clear;
          FCdsPrincipal.FieldByName('TIPO_MOVIMENTACAO_HIST').asInteger := TRANSF_ENTRADA;
          FCdsPrincipal.FieldByName('TIPO_MOVIMENTACAO').asInteger := TRANSF_ENTRADA;
          FCdsPrincipal.FieldByName('TRANSFERENCIA').asInteger := 1;
          FCdsPrincipal.Post;

          // O registro a ser inserido será o registro de saída do Estabelecimento Anterior
          dIdEstab := GetIdEstabAntesTransf(FCdsPrincipal.FieldByName('IDPESSOA').asFloat);
          if (dIdEstab > 0) and (VerificaCodigoEm(FListaIdEstab,FloatToStr(dIdEstab),',') > 0) then
          begin
            //bkPos := FCdsPrincipal.GetBookmark;
            FCdsPrincipal.Insert;
            for c:=0 to FCdsPrincipal.FieldCount-1 do
              FCdsPrincipal.Fields[c].Value := RegistroAux[c];

            FCdsPrincipal.FieldByName('DATADESLIGAMENTO').asDateTime := dtDataTransf;
            FCdsPrincipal.FieldByName('DATARETORNO').Clear;
            FCdsPrincipal.FieldByName('TIPO_MOVIMENTACAO_HIST').asInteger := TRANSF_SAIDA;
            FCdsPrincipal.FieldByName('TIPO_MOVIMENTACAO').asInteger := TRANSF_SAIDA;
            FCdsPrincipal.FieldByName('SITUACAO').asString := 'D';
            FCdsPrincipal.FieldByName('IDESTAB').asFloat := dIdEstab;
            FCdsPrincipal.FieldByName('TRANSFERENCIA').asInteger := 1;
            FCdsPrincipal.Post;
            // Corrigir ponteiro do Cds após inclusão de registro acima
            //FCdsPrincipal.GotoBookmark(bkPos);
            //FCdsPrincipal.FreeBookmark(bkPos);
          end;
        end
        else
        // Transferência "Para" um Estabelecimento de outra Empresa Proprietária
        if (bTransfParaOutraEmpresa) then
        begin
          // Caso esteja no mesmo mês da admissão, a pessoa não deve entrar no
          // arquivo da empresa de origem portanto, deve ser retirada do Cds.
          if (RetornaAnoMes(FCdsPrincipal.FieldByName('DATAADMISSAO').asDateTime) = FAnoMes) then
          begin
            FCdsPrincipal.Delete;
            //FCdsPrincipal.Prior; // para corrigir o cursor do Cds
          end
          else
          begin
            dIdEstab := GetIdEstabAntesTransf(FCdsPrincipal.FieldByName('IDPESSOA').asFloat);
            FCdsPrincipal.Edit;
            FCdsPrincipal.FieldByName('IDESTAB').asFloat := dIdEstab;
            FCdsPrincipal.FieldByName('DATARETORNO').Clear;
            FCdsPrincipal.FieldByName('DATADESLIGAMENTO').asDateTime :=
              GetDataTransf(FCdsTransfParaOutraEmpresa,
                            FCdsPrincipal.FieldByName('IDPESSOA').asFloat);
            FCdsPrincipal.FieldByName('TIPO_MOVIMENTACAO_HIST').asInteger := TRANSF_SAIDA;
            FCdsPrincipal.FieldByName('TIPO_MOVIMENTACAO').asInteger := TRANSF_SAIDA;
            FCdsPrincipal.FieldByName('SITUACAO').asString := 'D';
            FCdsPrincipal.FieldByName('TRANSFERENCIA').asInteger := 1;
            FCdsPrincipal.Post;
            //FCdsPrincipal.Next;
          end;
        end
        else
        // Transferência "Para" um Estabelecimento de outra Empresa Proprietária
        if (bTransfDeOutraEmpresa) then
        begin
          FCdsPrincipal.Edit;

          if (RetornaAnoMes(FCdsPrincipal.FieldByName('DATAADMISSAO').asDateTime) < FAnoMes) then
            FCdsPrincipal.FieldByName('DATAADMISSAO').asDateTime :=
              GetDataTransf(FCdsTransfDeOutraEmpresa,
                            FCdsPrincipal.FieldByName('IDPESSOA').asFloat);

          FCdsPrincipal.FieldByName('DATARETORNO').Clear;
          FCdsPrincipal.FieldByName('DATADESLIGAMENTO').Clear;
          FCdsPrincipal.FieldByName('TIPO_MOVIMENTACAO_HIST').asInteger := TRANSF_ENTRADA;
          FCdsPrincipal.FieldByName('TIPO_MOVIMENTACAO').asInteger := TRANSF_ENTRADA;
          FCdsPrincipal.FieldByName('TRANSFERENCIA').asInteger := 1;
          FCdsPrincipal.Post;
          //FCdsPrincipal.Next;
        end;

        _CdsAux.Next;
      until (_CdsAux.EOF);

      if (FCdsPrincipal.IndexDefs.IndexOf('Index') > -1) then
        FCdsPrincipal.DeleteIndex('Index');
      FCdsPrincipal.AddIndex('Index', 'IDESTAB;EMPREGADO', []);
      FCdsPrincipal.IndexDefs.Update;
      FCdsPrincipal.IndexName := 'Index';

      FCdsPrincipal.First;
      Result := true;
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  finally
    _CdsOutroEstab.Free;
    _CdsEstabAntesTransf.Free;
    _CdsAux.Free;
  end;
end;

procedure TCtrlParamCAGEDMagnetico.MensagemPessoas;
var
  _CdsAux: TCMClientDataSet;
  bPrimeiroEstab: boolean;
  sMsg, sMsgAvisoPessoa: string;
  iNumAdm, iNumDem, iNumAdmDem, iNumTransEnt, iNumTransSai: integer;

{->}procedure AddMsg(const Msg: string);
    begin
      if (sMsgAvisoPessoa = '') then
        sMsgAvisoPessoa :=
          Replicate('-',50) +CR_LF+
          ('Pessoa: ') + _CdsAux.FieldByName('EMPREGADO').asString +CR_LF+
          ('Inconsistência(s):');

      sMsgAvisoPessoa := sMsgAvisoPessoa +CR_LF+ '   * ' + Msg;
{->}end;

begin
  sMsg := '';
  bPrimeiroEstab := true;
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    FCdsPrincipal.Filtered := false;
    _CdsAux.Data := FCdsPrincipal.Data;

    FCdsEstab.First;
    while not(FCdsEstab.EOF) do
    begin
      iNumAdm := 0;
      iNumDem := 0;
      iNumAdmDem := 0;
      iNumTransEnt := 0;
      iNumTransSai := 0;

      _CdsAux.Filter := 'IDESTAB = ' + FCdsEstab.FieldByName('IDESTAB').asString;
      _CdsAux.Filtered := true;

      _CdsAux.First;
      while not(_CdsAux.EOF) do
      begin
        sMsgAvisoPessoa := '';
        FCdsPrincipal.Locate('IDPESSOA', _CdsAux.FieldByName('IDPESSOA').asFloat, []);

        if (VerificaCodigoEm(FTipoContrato,
            _CdsAux.FieldByName('TIPOCONTRATO').asString,',') = -1) then
          AddMsg(('Tipo de Contrato não confere com os selecionados'));

        if (_CdsAux.FieldByName('IDHORARIO').asString = '') then
          AddMsg(('Sem Horário de Trabalho'));

        if (_CdsAux.FieldByName('CBO').asString = '') then
          AddMsg(('Sem Cargo ou CBO do Cargo'));

        if (_CdsAux.FieldByName('SITUACAO').asString = '') then
          AddMsg(('Sem Situação Funcional'));

        if (_CdsAux.FieldByName('CTPS').asString = '') then
          AddMsg(('Sem CTPS ou a UF da mesma'));

        if (_CdsAux.FieldByName('PIS').asString = '') then
          AddMsg(('Sem PIS'));

        if (_CdsAux.FieldByName('GRAU_INSTR').asInteger = 0) then
          AddMsg(('Sem Grau de Instrução'));

        if (_CdsAux.FieldByName('REMUNERACAO').asFloat = 0) then
          AddMsg(('Remuneração não Encontrada'));

        if (sMsgAvisoPessoa = '') then
        begin
          if (_CdsAux.FieldByName('TRANSFERENCIA').asInteger = 1) then
          begin
            if (_CdsAux.FieldByName('TIPO_MOVIMENTACAO').asInteger = TRANSF_ENTRADA) then
              Inc(iNumTransEnt)
            else
              Inc(iNumTransSai);
          end
          else
          if (FormatDateTime('YYYY/MM', _CdsAux.FieldByName('DATAADMISSAO').asDateTime) = FAnoMes) then
          begin
            if (FormatDateTime('YYYY/MM', _CdsAux.FieldByName('DATADESLIGAMENTO').asDateTime) = FAnoMes) then
              Inc(iNumAdmDem)
            else
              Inc(iNumAdm);
          end
          else
          if (FormatDateTime('YYYY/MM', _CdsAux.FieldByName('DATADESLIGAMENTO').asDateTime) = FAnoMes) then
            Inc(iNumDem);
        end
        else
        begin
          sMsg := sMsg +CR_LF+ sMsgAvisoPessoa;
          FCdsPrincipal.Delete;
        end;  

        _CdsAux.Next;
      end;

      if (iNumAdm > 0) or (iNumDem > 0) or
         (iNumAdmDem > 0) or (iNumTransEnt > 0) or (iNumTransSai > 0) then
      begin
        IncProgresso(0, false, false, false, false,
          IFF(bPrimeiroEstab,
            Replicate('*',50) +CR_LF+
            ('NÚMERO DE PESSOAS GERADAS') +CR_LF, '')+
          Replicate('-',50) +CR_LF+
          ('Estabelecimento: ') +FCdsEstab.FieldByName('NOME').asString +CR_LF+
          ('Admitidos: ') +IntToStr(iNumAdm) +CR_LF+
          ('Demitidos: ') +IntToStr(iNumDem) +CR_LF+
          ('Admitidos e Demitidos: ') +IntToStr(iNumAdmDem) +CR_LF+
          ('Transferidos - Entrada: ') +IntToStr(iNumTransEnt) +CR_LF+
          ('Transferidos - Saída: ') +IntToStr(iNumTransSai));
        bPrimeiroEstab := false;
      end;

      FCdsEstab.Next;
    end;
  finally
    FCdsPrincipal.Filtered := false;
    _CdsAux.Free;
  end;

  if (sMsg <> '') then
    IncProgresso(0, false, false, false, false,
      CR_LF+
      Replicate('*',50) +CR_LF+
      ('Algumas pessoas não foram geradas no arquivo devido a falta de dados cadastrais.') +CR_LF+
      ('Segue a lista delas abaixo:') + sMsg);
end;

function TCtrlParamCAGEDMagnetico.ProcessarGeracao: string;
var
  dIdEstab: double;
begin
  IncProgresso(FCdsPrincipal.RecordCount, false, false, false, false);

  //FLog.Init(tlArquivo, 'C:\LogCAGED.txt');
  FArq.Clear;
  try
    if not(GerarRegTransferencias) then
      raise Exception.Create(MessageInfo);

    MensagemPessoas;

    // Faz a contagem dos estabelecimentos que têm informações dentre os que foram
    // selecionados pelo usuário
    FNumEstab := GetNumEstab;
    // Faz a contagem das movimentações a serem processadas
    FNumMoviment := GetNumMovimentacoes;

    FNumSequencia := 1;
    // Arquivo de Acerto gera dois registros por pessoa por isto, o total deve ser dobrado
    if not(FCAGEDNormal) then
      FNumMoviment := FNumMoviment * 2;

    FCdsPrincipal.First;

    // Cabeçalho do arquivo
    GerarRegistro_CabecalhoArquivo;

    repeat
      // Posicionar no Estabelecimento correto no Cds que possui os dados deste
      // pelo registro principal atual
      FCdsEstab.Locate('IDESTAB', FCdsPrincipal.FieldByName('IDESTAB').asFloat,
        [loCaseInsensitive]);

      // Cabeçalho do estabelecimento
      GerarRegistro_CabecalhoEstab;

      // Registro de movimentação do trabalhador
      dIdEstab := FCdsPrincipal.FieldByName('IDESTAB').asFloat;
      repeat
        GerarRegistro_Detalhe;
        FCdsPrincipal.Next;
        IncProgresso(0, false, false, false, true);
      until (FCdsPrincipal.EOF) or (dIdEstab <> FCdsPrincipal.FieldByName('IDESTAB').asFloat);
    until (FCdsPrincipal.EOF);

    MessageInfo := '';
  except
    on E: Exception do
    begin
      MessageInfo :=
        CMTranslateMsg(MSG_ERRO_GERA_ARQ, [CR_LF,
          UpperCase(FCdsPrincipal.FieldByName('EMPREGADO').asString)])+
        CR_LF+CR_LF+ ('Descrição:') +CR_LF+ E.Message;
      FArq.Clear;
      IncProgresso(0, false, false, false, false);
    end;
  end;
  //FLog.Finish;

  Result := FArq.Text;
end;

end.
