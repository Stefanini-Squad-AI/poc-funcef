{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 02/08/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlPessoaFuncionario;

interface

uses SysUtils, Classes, Controls, Db, dbclient, IvDictio, uCMClientDataSet,
  CmEventosCadastro, uCMTypes, uCtrlPessoa, uCtrlFuncoesRH, uCtrlCustomRH, uCtrlRad,
  uCtrlMotivo, uCtrlListTerceirosRH, uDbFuncionario, uDbEstrangeiro, uDbUltEmpr;

const
  NUM_DOC_ALT = 3;
  NUM_CAD_ALT = 12;

type
  TDadosHist = record
    DataSit, DataAdmissao: TDateTime;
    CodCentroCusto, TipoPagamento: string;
    SalarioAtual, IdMotivoDesligRAIS, IdMotivoDesligGerencial,
    IdMovContrCAGED, IdEstab, IdCargo, IdSitFunc: double;
  end;

  THstEndPess = record
    Logradouro, Complemento, Numero, CEP, Bairro: string;
    IdCidades: integer;
  end;

  THstDocumentos = array[1..NUM_DOC_ALT] of record
    IdDocumento: integer;
    Codigo, Numero: string;
  end;

  THstAltCad = array[1..NUM_CAD_ALT] of record
    Codigo, Valor: string;
  end;

  TCtrlPessoaFuncionario = class(TCtrlCustomPessoaRH)
  protected
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
    procedure DoChangeDataBase; override;
    function  ProcessaOutros(Operacao: TOperacao; var Mensagem: string): boolean; override;
  private
    FDbFuncionario: TDbFuncionario;
    FDbEstrangeiro: TDbEstrangeiro;
    FDbUltEmpr: TDbUltEmpr;

    FCtrlRad: TCtrlRad;
    FCtrlListTerceirosRH: TCtrlListTerceirosRH;
    FCtrlMotivo: TCtrlMotivo;

    FFU: TCtrlFuncoesRH;

    FCdsEstrangeiro: TCMClientDataSet;
    FCdsUltEmpr: TCMClientDataSet;

    FSQL: TStringList;

    FUsaEstrangeiro: boolean;
    FUsaUltimosEmpregos: boolean;
    FPassouGravacao: boolean;

    FIdPessoa: double;
    FDadosHist: TDadosHist; // Dados complementares
    FHstEndPess: THstEndPess; // Alterações no Endereço Residencial
    FHstDoc_Ant, FHstDoc_Atu: THstDocumentos; // Alterações nos Documentos
    FHstAltCad_Ant, FHstAltCad_Atu: THstAltCad; // Alterações Cadastrais
    FInserindo, FMudouEndResid, FMudouSituacao: boolean;

    FIdEmpresa: integer; // Empresa utilizada na geração do processo no RAD
    FIntegraRAD: boolean; // Indica se integra com o RAD
    FIdUsuario: integer; // Usuário utilizado na geração do processo no RAD
    FIdTipoProcesso: integer; // Tipo de Processo utilizado na geração do processo no RAD

    procedure InitHstDocumentos;
    procedure InitHstAltCad;

    function GravarHstAltSitFunc: boolean;
    function GravarHstAltEvolFunc(IdEmpresa: double): boolean;
    function GravarHstAltEndereco: boolean;
    function GravarHstDocumentos: boolean;
    function GravarHstAltCadastral: boolean;

    function GerarProcessoRAD: boolean;
  public
    constructor Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string;
      UsaEstrangeiro: boolean = false; UsaUltimosEmpregos: boolean = false;
      IdEmpresa: integer = 0; IntegraRAD: boolean = false; IdUsuario: integer = 0); reintroduce;
    destructor  Destroy; override;

    function ListFuncionario(ListaIdPessoa: string): OleVariant;
    function ListAgenciaSalario(IdPessoa: double): OleVariant;
    function ListPesFisFuncionario(IdPessoa: double; Campos: string = ''): OleVariant;
    function ListEnderecoEmpresaFuncionario(IdPessoa: double; Campos: string = ''): OleVariant;
    function ListEmpresaFuncionario(IdEmpresa: integer; Campos: string = '';
      ListaIdEstab: string = ''; ListaSitFunc: string = ''; ListaTipoContrato: string = '';
      ListaTipoSexo: string = ''; ListaCodCentroCusto: string = '';
      AnoMesAdmissao: string = ''; AnoMesDemissao: string = ''; ListaIdDocumento: string = '';
      PossuiIdDocumento: boolean = false; InicioFerias: TDate = 0; FinalFerias: TDate = 0;
      FeriasOcorridas: integer = -1; TipoHorarioTrab: integer = -1;
      ListaMotivoDesligRAIS: string = ''; DataAdmissaoInicial: TDate = 0;
      DataAdmissaoFinal: TDate = 0; DataDemissaoInicial: TDate = 0;
      DataDemissaoFinal: TDate = 0; ComLinhaTransporte: boolean = false;
      ListaMatricula: string = ''; ListaIdMotivo: string = '';
      DataEvolInicial: TDate = 0; DataEvolFinal: TDate = 0; IdUsuario: double = 0;
      SituacaoAtual: boolean = true; DataRefSituacao: TDate = 0):  OleVariant;
    function ListDadosParticipante(IdPessoa: double):  OleVariant;
    function ListDadosParticipante_ComEndereco(IdPessoa: double): OleVariant;
    function ListDadosParticipante_ComPlano(IdPessoa: double): OleVariant;
    function ListFuncionario_e_Terceiros: OleVariant;
    function ListChefe(IdEmpresa: integer): OleVariant;
    function ListFuncNaRescisao(IdPessoa: double): OleVariant;

    function SetDuracaoContrato(DataAdmissao, DataFinalContrato: TDateTime;
      TipoDocuracaoContrato: integer): boolean;
    function SetDataFinalContrato(DataAdmissao: TDateTime; DocuracaoContrato,
      TipoDocuracaoContrato: integer): boolean;

    function GetMatriculaJaExiste(Matricula: string; IdEmpresa: double): double;
    function GetProxMatricula(Tamanho: byte): string;
    function GetGodigoGrpFunc(IdPessoa: double): string;
    function GetNumAdmitidos(IdEmpresa: double; CodCentroCusto, AnoBarraMes: string): integer;
    function GetNumDemitidos(IdEmpresa: double; CodCentroCusto, AnoBarraMes: string): integer;

    function GravarSubTipos(Operacao: TOperacao; var Mensagem: string): boolean;

    // Alterações Cadastrais
    procedure SelDadosEvolFunc;
    procedure SelDadosSitFunc(TipoSit: string);
    procedure SelHstDocumentos(PrimeiraVez: boolean);
    procedure SelHstAltCad(PrimeiraVez: boolean; Matricula, Nome: string; DataNasc,
      DataAdm: TDate; Horario, Chefe, GrauInstr, EstadoCivil, Sindicato, Profissao: string;
      NumDepIRRF, NumDepSalFam: integer);

    procedure GuardarAlteracaoEndereco;
    function  GravarHistorico(GravarHstAltCad, Inserindo: boolean; IdEmpresa: double): boolean;

    property IdPessoa: double read FIdPessoa write FIdPessoa;
    property MudouEnderecoResidencial: boolean read FMudouEndResid write FMudouEndResid;
    property MudouSituacao: boolean read FMudouSituacao write FMudouSituacao;
    property CdsEstrangeiro: TCMClientDataSet read FCdsEstrangeiro write FCdsEstrangeiro;
    property CdsUltEmpr: TCMClientDataSet read FCdsUltEmpr write FCdsUltEmpr;
    property UsaEstrangeiro: boolean read FUsaEstrangeiro write FUsaEstrangeiro;
    property UsaUltimosEmpregos: boolean read FUsaUltimosEmpregos write FUsaUltimosEmpregos;
    property PassouGravacao: boolean read FPassouGravacao write FPassouGravacao;
  end;

implementation

uses uCmCustomCdbObject, uMidasUtil;

{ TCtrlPessoaFuncionario }

constructor TCtrlPessoaFuncionario.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string;
  UsaEstrangeiro, UsaUltimosEmpregos: boolean; IdEmpresa: integer; IntegraRAD: boolean;
  IdUsuario: integer);
begin
  inherited Create;
  SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FDbFuncionario := TDbFuncionario.Create(Self);
  FFU := TCtrlFuncoesRH.Create;
  FSQL := TStringList.Create;

  FUsaUltimosEmpregos := UsaUltimosEmpregos;
  if (FUsaUltimosEmpregos) then
    FDbUltEmpr := TDbUltEmpr.Create(Self);

  FUsaEstrangeiro := UsaEstrangeiro;
  if (FUsaEstrangeiro) then
    FDbEstrangeiro := TDbEstrangeiro.Create(Self);

  FIdEmpresa := IdEmpresa;
  FIntegraRAD := IntegraRAD;
  FIdUsuario := IdUsuario;

  // Somente cria o RAD se estiver na Aplicação Servidora ou estiver
  // no modo de execução Cliente Servidor em Duas Camadas
  if (FIntegraRAD) and ((IsAppServer) or (ConnectionSide <> cnsClient)) then
  begin
    FCtrlRad := TCtrlRad.Create;
    FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create('', '', '');
    FCtrlMotivo := TCtrlMotivo.Create;
  end;
end;

destructor TCtrlPessoaFuncionario.Destroy;
begin
  FSQL.Free;
  FFU.Free;
  FDbFuncionario.Free;

  if (FUsaEstrangeiro) then
    FDbEstrangeiro.Free;
  if (FUsaUltimosEmpregos) then
    FDbUltEmpr.Free;

  // Somente destrói o RAD se estiver na Aplicação Servidora ou estiver
  // no modo de execução Cliente Servidor em Duas Camadas
  if (FIntegraRAD) and ((IsAppServer) or (ConnectionSide <> cnsClient)) then
  begin
    FCtrlRad.Free;
    FCtrlListTerceirosRH.Free;
    FCtrlMotivo.Free;
  end;

  if (IsAppServer) then
  begin
    if (FUsaEstrangeiro) then
      FCdsEstrangeiro.Free;
    if (FUsaUltimosEmpregos) then
      FCdsUltEmpr.Free;
  end;
  inherited;
end;

procedure TCtrlPessoaFuncionario.OnCreateAppServer;
begin
  inherited;
  if (FUsaEstrangeiro) then
    FCdsEstrangeiro := TCMClientDataSet.Create(nil);
  if (FUsaUltimosEmpregos) then
    FCdsUltEmpr := TCMClientDataSet.Create(nil);
end;

procedure TCtrlPessoaFuncionario.AfterInitialize;
begin
  inherited;
  FFU.InitializeAs(Self);

  // Somente procura o IdTipoProcesso se estiver na Aplicação Servidora ou estiver
  // no modo de execução Cliente Servidor em Duas Camadas
  if (IsAppServer) or (ConnectionSide <> cnsClient) then
  begin
    if (FIntegraRAD) then
    begin
      FCtrlMotivo.InitializeAs(Self);

      FCtrlRad.InitializeAs(Self);
      FCtrlRad.OpenTransaction := false;
      FIdTipoProcesso := FCtrlListTerceirosRH.GetIdTipoProcesso(FIdUsuario, 19);
    end
    else
      FIdTipoProcesso := -1;
  end;

  // Inicialização das variáveis para a Geração do Histórico de Alterações Cadastrais
  InitHstDocumentos;
  InitHstAltCad;
end;

procedure TCtrlPessoaFuncionario.DoChangeDataBase;
begin
  inherited;
  FDbFuncionario.DataBaseName := DataBaseName;
  FFU.DataBase := DataBase;

  if (FUsaEstrangeiro) then
    FDbEstrangeiro.DataBaseName := DataBaseName;
  if (FUsaUltimosEmpregos) then
    FDbUltEmpr.DataBaseName := DataBaseName;

  // Somente muda o DataBaseName do RAD se estiver na Aplicação Servidora ou estiver
  // no modo de execução Cliente Servidor em Duas Camadas
  if (FIntegraRAD) and ((IsAppServer) or (ConnectionSide <> cnsClient)) then
  begin
    FCtrlListTerceirosRH.DataBase := DataBase;
    FCtrlRad.DataBase := DataBase;
    FCtrlMotivo.DataBase := DataBase;
  end;
end;

function TCtrlPessoaFuncionario.ListFuncionario(ListaIdPessoa: string): OleVariant;
var
  sSQL: string;
begin
  if (ListaIdPessoa = '-1') then
    sSQL := 'WHERE' +CR_LF+ '  (1 = 2)'
  else
  begin
    if (ListaIdPessoa = '') then
      sSQL := 'ORDER BY' +CR_LF+ '  IDPESSOA'
    else
    begin
      if (Pos(',',ListaIdPessoa) > 0) then
        sSQL := 'WHERE' +CR_LF+ '  (IDPESSOA IN (' +ListaIdPessoa+ '))'
      else
        sSQL := 'WHERE' +CR_LF+ '  (IDPESSOA = ' +ListaIdPessoa+ ')'
    end;
  end;

  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  FUNCIONARIO'+CR_LF+
    sSQL);
end;

function TCtrlPessoaFuncionario.ListAgenciaSalario(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  AGB.IDBANCO, BPF.CODPORTFORMA,'+CR_LF+
    '  F.NUMCONTASALARIO AS CONTACORRENTE, AGB.NUMAGENCIA, BAN.NUMBANCO'+CR_LF+
    'FROM'+CR_LF+
    '  FUNCIONARIO F, AGENCIABANCARIA AGB, BANCO BAN, BANCOPORTFOLHA BPF'+CR_LF+
    'WHERE'+CR_LF+
    '  (F.IDPESSOA         = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (F.IDAGENCIASALARIO = AGB.IDPESSOA) AND'+CR_LF+
    '  (AGB.IDBANCO        = BAN.IDPESSOA(+)) AND'+CR_LF+
    '  (AGB.IDBANCO        = BPF.IDBANCO(+))');
end;

function TCtrlPessoaFuncionario.ListPesFisFuncionario(IdPessoa: double; Campos: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    FFU.IFF(Campos = '',
      '  F.IDPESSOA, F.MATRICULA, (''  '' || P.NOME) AS NOME,'+CR_LF+
      '  F.DATAADMISSAO, ST.TIPOSIT, F.IDEMPRESA,'+CR_LF+
      '  TO_CHAR(DECODE(ST.TIPOSIT,NULL,''Indefinida'','+CR_LF+
      '    TO_CHAR(DECODE(ST.TIPOSIT,''A'',''(Ativ'', ''F'',''(Afastad'', ''D'',''(Demitid'')) ||'+CR_LF+
      '    TO_CHAR(DECODE(PF.SEXO,''F'',''a)'',''o)'')))) AS SITUACAO, F.IDCARGO',
      Campos)+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, PESSOAFISICA PF, FUNCIONARIO F, SITFUNC ST'+CR_LF+
    'WHERE'+CR_LF+
    '  (F.IDPESSOA  = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (F.IDSITFUNC = ST.IDSITFUNC) AND'+CR_LF+
    '  (F.IDPESSOA  = PF.IDPESSOA) AND'+CR_LF+
    '  (F.IDPESSOA  = P.IDPESSOA)');
end;

function TCtrlPessoaFuncionario.ListEnderecoEmpresaFuncionario(IdPessoa: double;
  Campos: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    FFU.IFF(Campos = '',
      '  PF.NOME,'+CR_LF+
      '  F.IDPESSOA,'+CR_LF+
      '  F.MATRICULA,'+CR_LF+
      '  F.IDEMPRESA,'+CR_LF+
      '  F.IDESTAB,'+CR_LF+
      '  F.IDHORARIO,'+CR_LF+
      '  F.DATAREFHORARIO,'+CR_LF+
      '  ST.TIPOSIT,'+CR_LF+
      '  TO_CHAR(DECODE(ST.TIPOSIT,'+CR_LF+
      '    NULL,''Indefinida'','+CR_LF+
      '    TO_CHAR(DECODE(ST.TIPOSIT,'+CR_LF+
      '      ''A'',''(Ativ'','+CR_LF+
      '      ''F'',''(Afastad'','+CR_LF+
      '      ''D'',''(Demitid'''+CR_LF+
      '    )) ||'+CR_LF+
      '    TO_CHAR(DECODE(PEFIS.SEXO,'+CR_LF+
      '      ''F'',''a)'','+CR_LF+
      '      ''o)'''+CR_LF+
      '    ))'+CR_LF+
      '  )) AS SITUACAO,'+CR_LF+
      '  TO_NUMBER(DECODE(C.IDPAIS,'+CR_LF+
      '    NULL,E.IDPAIS,'+CR_LF+
      '    C.IDPAIS'+CR_LF+
      '  )) AS IDPAIS,'+CR_LF+
      '  E.IDCIDADES,'+CR_LF+
      '  RTRIM(ES.CODESTADO) AS UF',
      Campos)+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA PJ, PESSOA PF, PESSOAFISICA PEFIS, ENDPESS E, FUNCIONARIO F,'+CR_LF+
    '  SITFUNC ST, CIDADES C, ESTADO ES'+CR_LF+
    'WHERE'+CR_LF+
    '  (F.IDPESSOA        = '+FloatToStr(IdPessoa)+') AND'+CR_LF+
    '  (F.IDSITFUNC       = ST.IDSITFUNC) AND'+CR_LF+
    '  (F.IDPESSOA        = PF.IDPESSOA) AND'+CR_LF+
    '  (F.IDPESSOA        = PEFIS.IDPESSOA) AND'+CR_LF+
    '  (F.IDESTAB         = PJ.IDPESSOA) AND'+CR_LF+
    '  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND'+CR_LF+
    '  (PJ.IDPESSOA       = E.IDPESSOA) AND'+CR_LF+
    '  (E.IDCIDADES       = C.IDCIDADES) AND'+CR_LF+
    '  (C.IDESTADO        = ES.IDESTADO)');
end;

function TCtrlPessoaFuncionario.ListEmpresaFuncionario(IdEmpresa: integer; Campos: string;
  ListaIdEstab, ListaSitFunc, ListaTipoContrato, ListaTipoSexo, ListaCodCentroCusto,
  AnoMesAdmissao, AnoMesDemissao, ListaIdDocumento: string; PossuiIdDocumento: boolean;
  InicioFerias, FinalFerias: TDate; FeriasOcorridas, TipoHorarioTrab: integer;
  ListaMotivoDesligRAIS: string; DataAdmissaoInicial, DataAdmissaoFinal, DataDemissaoInicial,
  DataDemissaoFinal: TDate; ComLinhaTransporte: boolean; ListaMatricula,
  ListaIdMotivo: string; DataEvolInicial, DataEvolFinal: TDate; IdUsuario: double;
  SituacaoAtual: boolean; DataRefSituacao: TDate): OleVariant;
begin
  with (FSQL) do
  begin
    Clear;
    if not(SituacaoAtual) or (ComLinhaTransporte) or
       (DataEvolInicial > 0) or (InicioFerias > 0) or (FinalFerias > 0) then
      Add('SELECT DISTINCT')
    else  
      Add('SELECT');

    if (Campos <> '') then
      Add('  ' +Campos)
    else
      Add('  F.IDPESSOA, P.NOME');

    Add('FROM');
    Add('  PESSOA P, FUNCIONARIO F');

    if (ListaSitFunc <> '') then
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ', SITFUNC ST';

    if (ListaTipoSexo <> '') then
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ', PESSOAFISICA PF';

    if (InicioFerias > 0) and (FinalFerias > 0) then
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ', FERIAS FE';

    if (TipoHorarioTrab > -1) then
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ', HORATRAB HT';

    if (ListaMotivoDesligRAIS <> '') then
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ', MOTIVO MO';

    if (ComLinhaTransporte) then
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ', LINHATRANSP LT, LINHAXPESS LP';

    if (DataEvolInicial > 0) then
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ', EVOLFUNC EF';

    if not(SituacaoAtual) then
    begin
      if (ListaSitFunc <> '') then
      begin
        Add('  ,(SELECT H.IDPESSOA, H.IDSITFUNC');
        Add('    FROM   HSTSITFUNC H,');
        Add('           (SELECT MAX(DATASITFUNC) AS DATASITFUNC, IDPESSOA');
        Add('            FROM   HSTSITFUNC');
        Add('            WHERE  (DATASITFUNC <= TO_DATE('+
            QuotedStr(DateToStr(DataRefSituacao))+ ',''DD/MM/YYYY''))');
        Add('            GROUP BY IDPESSOA) HST2,');
        Add('           (SELECT MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
        Add('            FROM   HSTSITFUNC');
        Add('            WHERE  (DATASITFUNC <= TO_DATE('+
            QuotedStr(DateToStr(DataRefSituacao))+ ',''DD/MM/YYYY''))');
        Add('            GROUP BY IDPESSOA) HST3');
        Add('    WHERE  (H.DATASITFUNC   = HST2.DATASITFUNC) AND');
        Add('           (H.IDPESSOA      = HST2.IDPESSOA) AND');
        Add('           (H.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
        Add('           (H.IDPESSOA      = HST3.IDPESSOA)) HST_SIT');
      end;

      if (ListaIdEstab <> '') or (ListaCodCentroCusto <> '') then
      begin
        Add('  ,(SELECT EF.IDPESSOA, EF.IDEMPRESA, EF.IDESTAB, EF.CODCENTROCUSTO');
        Add('    FROM   EVOLFUNC EF,');
        Add('           (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
        Add('            FROM   EVOLFUNC');
        Add('            WHERE  (DATAALTERFUNC <= TO_DATE('+
          QuotedStr(DateToStr(DataRefSituacao))+ ',''DD/MM/YYYY''))');
        Add('            GROUP BY IDPESSOA) HST2,');
        Add('           (SELECT MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
        Add('            FROM   EVOLFUNC');
        Add('            WHERE  (DATAALTERFUNC <= TO_DATE('+
          QuotedStr(DateToStr(DataRefSituacao))+ ',''DD/MM/YYYY''))');
        Add('            GROUP BY IDPESSOA) HST3');
        Add('    WHERE  (EF.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
        Add('           (EF.IDPESSOA      = HST2.IDPESSOA) AND');
        Add('           (EF.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
        Add('           (EF.IDPESSOA      = HST3.IDPESSOA)) HST_EVOL');
      end;
    end;

    Add('WHERE');

    if (ListaSitFunc <> '') then
      Add(FFU.MontaLinhaSelSQL('  (ST.TIPOSIT', FFU.QuotedListaString(ListaSitFunc,','), 7));

    if (FIdUsuarioGeral <> '') then
      Add('  (F.IDPESSOA        = ' +FIdUsuarioGeral+ ') AND');

    if (ListaMatricula <> '') then
      Add(FFU.MontaLinhaSelSQL('  (F.MATRICULA', FFU.QuotedListaString(ListaMatricula,','), 7));

    if (Trim(ListaTipoContrato) <> '') then
      Add(FFU.MontaLinhaSelSQL('  (F.TIPOCONTRATO', FFU.QuotedListaString(ListaTipoContrato,','), 3));

    if not(SituacaoAtual) and (ListaSitFunc <> '') then
      Add('  (F.DATAADMISSAO   <= TO_DATE('+
        QuotedStr(DateToStr(DataRefSituacao))+ ',''DD/MM/YYYY'')) AND');
                                            
    // Estabelecimento
    if (ListaIdEstab <> '') then
    begin
      if (SituacaoAtual) then
        Add(FU.MontaLinhaSelSQL('  (F.IDESTAB', ListaIdEstab, 8))
      else
      begin
        Add(FU.MontaLinhaSelSQL(
          '  (CASE'+CR_LF+
          '     WHEN HST_EVOL.IDESTAB IS NULL THEN F.IDESTAB'+CR_LF+
          '     ELSE HST_EVOL.IDESTAB'+CR_LF+
          '   END', ListaIdEstab, 14));
      end;
    end
    else
    if (FUsuXFilial <> '') then // Estabelecimento(s) habilitados para o usuário
    begin
      if (IdUsuario > 0) then
        Add('  ((F.IDPESSOA = ' +FloatToStr(IdUsuario)+ ') OR');

      Add(FFU.MontaLinhaSelSQL('  (F.IDESTAB', FUsuXFilial, 8, false));
      if (IdUsuario > 0) then
        FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ')';
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ' AND';
    end;

    // Centro de Custo
    if (ListaCodCentroCusto <> '') then
    begin
      if (SituacaoAtual) then
      begin
        Add(FFU.MontaLinhaSelSQL('  (F.CODCENTROCUSTO', FFU.QuotedListaString(ListaCodCentroCusto,','), 1));
        if (IdEmpresa > 0) then
          Add('  (F.IDEMPRESA       = ' +IntToStr(IdEmpresa)+ ') AND');
      end
      else
      begin
        Add(FFU.MontaLinhaSelSQL(
          '  ((CASE' +CR_LF+
          '      WHEN HST.CODCENTROCUSTO IS NULL THEN F.CODCENTROCUSTO' +CR_LF+
          '      ELSE HST.CODCENTROCUSTO' +CR_LF+
          '    END)', FFU.QuotedListaString(ListaCodCentroCusto,','), 12));
        if (IdEmpresa > 0) then
        begin
          Add('  ((CASE');
          Add('      WHEN HST.IDEMPRESA IS NULL THEN F.IDEMPRESA');
          Add('      ELSE HST.IDEMPRESA');
          Add('    END)             = ' +IntToStr(IdEmpresa)+ ') AND');
        end;
      end;
    end
    else
    if (FUsuXCCusto <> '') then // C. de Custo(s) habilitados para o usuário
    begin
      if (IdUsuario > 0) then
        Add('  ((F.IDPESSOA       = ' +FloatToStr(IdUsuario)+ ') OR');

      Add(FFU.MontaLinhaSelSQL('  (F.CODCENTROCUSTO', FUsuXCCusto, 1, false));
      if (IdUsuario > 0) then
        FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ')';
      FSQL[FSQL.Count-1] := FSQL[FSQL.Count-1] + ' AND';
    end;

    // Situação Funcional
    if (ListaSitFunc <> '') then
    begin
      if (SituacaoAtual) then
        Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND')
      else
      begin
        Add('  (CASE');
        Add('     WHEN HST_SIT.IDSITFUNC IS NULL THEN F.IDSITFUNC');
        Add('     ELSE HST_SIT.IDSITFUNC');
        Add('   END               = ST.IDSITFUNC) AND');
      end;
    end;

    if (AnoMesAdmissao <> '') then
      Add('  (TO_CHAR(F.DATAADMISSAO,''YYYY/MM'') = '+QuotedStr(AnoMesAdmissao)+') AND');

    if (AnoMesDemissao <> '') then
      Add('  (TO_CHAR(F.DATADESLIGAMENTO,''YYYY/MM'') = '+QuotedStr(AnoMesDemissao)+') AND');

    if (DataAdmissaoInicial > 0) and (DataAdmissaoFinal > 0) then
    begin
      Add('  (F.DATAADMISSAO   >= TO_DATE('+
        QuotedStr(DateToStr(DataAdmissaoInicial))+ ',''DD/MM/YYYY'')) AND');
      Add('  (F.DATAADMISSAO   <= TO_DATE('+
        QuotedStr(DateToStr(DataAdmissaoFinal))+ ',''DD/MM/YYYY'')) AND');
    end;

    if (DataDemissaoInicial > 0) and (DataDemissaoFinal > 0) then
    begin
      Add('  (F.DATADESLIGAMENTO >= TO_DATE('+
        QuotedStr(DateToStr(DataDemissaoInicial))+ ',''DD/MM/YYYY'')) AND');
      Add('  (F.DATADESLIGAMENTO <= TO_DATE('+
        QuotedStr(DateToStr(DataDemissaoFinal))+ ',''DD/MM/YYYY'')) AND');
    end;

    if (ListaTipoSexo <> '') then
    begin
      Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
      Add(FFU.MontaLinhaSelSQL('  (PF.SEXO', FFU.QuotedListaString(ListaTipoSexo,','), 10));
    end;

    if (ListaIdDocumento <> '') then
    begin
      if (PossuiIdDocumento) then
        Add('  (F.IDPESSOA        IN (SELECT IDPESSOA')
      else
        Add('  (F.IDPESSOA    NOT IN (SELECT IDPESSOA');

      Add('                         FROM   DOCPESSOA');
      
      if (Pos(',', ListaIdDocumento) > 0) then
        Add('                         WHERE  (IDDOCUMENTO IN (' +ListaIdDocumento+ ')))) AND')
      else
        Add('                         WHERE  (IDDOCUMENTO = ' +ListaIdDocumento+ '))) AND');
    end;

    if (InicioFerias > 0) and (FinalFerias > 0) then
    begin
      Add('  (FE.INIGOZOFERIAS >= TO_DATE(' +
        QuotedStr(DateToStr(InicioFerias))+ ',''DD/MM/YYYY'')) AND');
      Add('  (FE.INIGOZOFERIAS <= TO_DATE(' +
        QuotedStr(DateToStr(FinalFerias))+ ',''DD/MM/YYYY'')) AND');

      if (FeriasOcorridas > -1) then
        Add('  (FE.FLGOCORRIDA = ' +IntToStr(FeriasOcorridas)+ ') AND');

      Add('  (FE.IDPESSOA    = F.IDPESSOA) AND');
    end;

    if (ListaMotivoDesligRAIS <> '') then
    begin
      Add(FFU.MontaLinhaSelSQL('  (MO.MOTIVOFGTS', FFU.QuotedListaString(ListaMotivoDesligRAIS,','), 4));
      Add('  (MO.IDMOTIVO       = F.IDMOTIVODESLIGRAIS) AND');
    end;

    if (TipoHorarioTrab > -1) then
    begin
      Add('  (HT.FLGTIPOHORARIO = '+IntToStr(TipoHorarioTrab)+') AND');
      Add('  (HT.IDHORARIO      = F.IDHORARIO) AND');
    end;

    if (ComLinhaTransporte) then
    begin
      Add('  (F.IDPESSOA        = LP.IDPESSOA) AND');
      Add('  (LP.IDLINHATRANSP  = LT.IDLINHATRANSP) AND');
    end;

    if (DataEvolInicial > 0) then
    begin
      if (ListaIdMotivo <> '') then
        Add(FFU.MontaLinhaSelSQL('  (EF.IDMOTIVO', FFU.QuotedListaString(ListaIdMotivo,','), 1));

      Add('  (EF.DATAALTERFUNC >= TO_DATE(' +
        QuotedStr(DateToStr(DataEvolInicial))+ ',''DD/MM/YYYY'')) AND');
      Add('  (EF.DATAALTERFUNC <= TO_DATE(' +
        QuotedStr(DateToStr(DataEvolFinal))+ ',''DD/MM/YYYY'')) AND');
      Add('  (F.IDPESSOA        = EF.IDPESSOA) AND');
    end;

    Add('  (F.IDPESSOA        = P.IDPESSOA)');

    if not(SituacaoAtual) then
    begin
      if (ListaSitFunc <> '') then
        Add('AND (F.IDPESSOA      = HST_SIT.IDPESSOA(+))');

      if (ListaIdEstab <> '') then
        Add('AND (F.IDPESSOA      = HST_EVOL.IDPESSOA(+))');
    end;

    Add('ORDER BY');
    Add('  NOME');
  end;

  Result := GetDataPacket(FSQL);
end;

function TCtrlPessoaFuncionario.ListDadosParticipante(IdPessoa: double): OleVariant;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCmClientDataSet.Create(nil);
  _CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  P2.NOME, P.NOME AS ESTAB, C.TITULO, F.SALARIOATUAL, F.TIPOPAGAMENTO,'+CR_LF+
    '  F.DATAADMISSAO, F.DATADESLIGAMENTO AS DATADEMISSAO, MO.DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, PESSOA P2, FUNCIONARIO F, CARGO C, MOTIVO MO'+CR_LF+
    'WHERE'+CR_LF+
    '  (F.IDPESSOA           = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (F.IDPESSOA           = P2.IDPESSOA) AND'+CR_LF+
    '  (F.IDESTAB            = P.IDPESSOA(+)) AND'+CR_LF+
    '  (F.IDCARGO            = C.IDCARGO(+)) AND'+CR_LF+
    '  (F.IDMOTIVODESLIGRAIS = MO.IDMOTIVO(+))');

  if not (_CdsAux.IsEmpty) then
    Result := _CdsAux.Data
  else
    Result := GetDataPacket(
      'SELECT'+CR_LF+
      '  NOME, '' '' AS ESTAB, '' '' AS TITULO, 0.00 AS SALARIOATUAL, '' '' AS TIPOPAGAMENTO,'+CR_LF+
      '  '' '' AS DATAADMISSAO, '' '' AS DATADEMISSAO, '' '' AS DESCRICAO'+CR_LF+
      'FROM'+CR_LF+
      '  PESSOA'+CR_LF+
      'WHERE'+CR_LF+
      '  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ')');

  FreeAndNil(_CdsAux);
end;

function TCtrlPessoaFuncionario.ListDadosParticipante_ComEndereco(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.IDENDRESIDENCIAL, P.IDENDCOMERCIAL, EP.IDENDERECO, P.NOME, P.TIPO,'+CR_LF+
    '  P.NUMDOCUMENTO, P.RAZAOSOCIAL, P.EMAIL, CI.NOME AS CIDADE, EP.LOGRADOURO,'+CR_LF+
    '  EP.CODESTADO, EP.NUMERO, EP.COMPLEMENTO, EP.BAIRRO, EP.CEP, ES.NOMEESTADO'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, ENDPESS EP, CIDADES CI, ESTADO ES'+CR_LF+
    'WHERE'+CR_LF+
    '  (P.IDPESSOA          = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  ((P.IDENDRESIDENCIAL = EP.IDENDERECO) OR (P.IDENDRESIDENCIAL IS NULL)) AND'+CR_LF+
    '  ((P.IDENDCOMERCIAL   = EP.IDENDERECO) OR (P.IDENDCOMERCIAL   IS NULL)) AND'+CR_LF+
    '  (EP.IDPESSOA(+)      = P.IDPESSOA) AND'+CR_LF+
    '  (EP.IDCIDADES        = CI.IDCIDADES(+)) AND'+CR_LF+
    '  (CI.IDESTADO         = ES.IDESTADO(+))');
end;

function TCtrlPessoaFuncionario.ListDadosParticipante_ComPlano(IdPessoa: double): OleVariant;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCmClientDataSet.Create(nil);
  _CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.NOME, PP.IDPESSOA, PP.INSCRICAONUMERO, PP.INSCRICAODATA,'+CR_LF+
    '  PP.SALPARTICIPACAO, EL.MATRICULA, EL.DATAADMISSAO,'+CR_LF+
    '  EL.DATADEMISSAO, CE.TITULO, PPR.NOME AS PLANO, PA.NOME AS PATROC'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, PARTPREVPLAN PP, ELEGPATRO EL, CARGOEXT CE,'+CR_LF+
    '  PLANPREV PPR, PESSOA PA'+CR_LF+
    'WHERE'+CR_LF+
    '  (P.IDPESSOA     = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (P.IDPESSOA     = PP.IDPESSOA) AND'+CR_LF+
    '  (P.IDPESSOA     = EL.IDPESSOA) AND'+CR_LF+
    '  (P.IDPESSOA     = EL.IDPESSOA) AND'+CR_LF+
    '  (PP.IDPESSJUR   = EL.IDPESSJUR) AND'+CR_LF+
    '  (PP.IDPESSJUR   = PA.IDPESSOA) AND'+CR_LF+
    '  (PP.IDPLANOPREV = PPR.IDPLANOPREV) AND'+CR_LF+
    '  (NVL(PP.FLGDESATIVADO,0) = 0) AND'+CR_LF+
    '  (EL.IDCARGOEXT  = CE.IDCARGOEXT(+))');

  if not (_CdsAux.IsEmpty) then
    Result := _CdsAux.Data
  else
    Result := GetDataPacket(
      'SELECT'+CR_LF+
    '  NOME, IDPESSOA, '' '' AS INSCRICAONUMERO, '' '' AS INSCRICAODATA,'+CR_LF+
    '  '' '' AS SALPARTICIPACAO, '' '' AS MATRICULA, '' '' AS DATAADMISSAO,'+CR_LF+
    '  '' '' AS DATADEMISSAO, '' '' AS TITULO, '' '' AS PLANO, '' '' AS PATROC'+CR_LF+
      'FROM'+CR_LF+
      '  PESSOA'+CR_LF+
      'WHERE'+CR_LF+
      '  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ')');

  FreeAndNil(_CdsAux);
end;

function TCtrlPessoaFuncionario.ListFuncionario_e_Terceiros: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.IDPESSOA, UPPER(P.NOME) AS NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, FUNCIONARIO F'+CR_LF+
    'WHERE'+CR_LF+
    '  (F.IDPESSOA = P.IDPESSOA)'+CR_LF+
    'UNION'+CR_LF+
    'SELECT'+CR_LF+
    '  P.IDPESSOA, UPPER(P.NOME) AS NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, TERCEIRO T'+CR_LF+
    'WHERE'+CR_LF+
    '  (T.IDPESSOA = P.IDPESSOA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  2');
end;

function TCtrlPessoaFuncionario.ListChefe(IdEmpresa: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  PF.NOME, PF.IDPESSOA, C.TITULO'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA PF, FUNCIONARIO F, CARGO C'+CR_LF+
    'WHERE'+CR_LF+
    '  (F.IDEMPRESA = ' +IntToStr(IdEmpresa)+ ') AND'+CR_LF+
    '  (F.IDPESSOA  = PF.IDPESSOA) AND'+CR_LF+
    '  (F.IDCARGO   = C.IDCARGO(+))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  PF.NOME');
end;

function TCtrlPessoaFuncionario.ListFuncNaRescisao(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.NOME, C.TITULO, F.*, PF.*'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, PESSOAFISICA PF, FUNCIONARIO F, CARGO C'+CR_LF+
    'WHERE'+CR_LF+
    '  (F.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (F.IDPESSOA = PF.IDPESSOA) AND'+CR_LF+
    '  (F.IDPESSOA = P.IDPESSOA) AND'+CR_LF+
    '  (F.IDCARGO  = C.IDCARGO(+))');
end;

function TCtrlPessoaFuncionario.SetDuracaoContrato(DataAdmissao, DataFinalContrato: TDateTime;
  TipoDocuracaoContrato: integer): boolean;
var
  NumDias, NumMeses, NumAnos: integer;
begin
  try
    if (DataAdmissao > 0) then
      FFU.CalculaDifData(DateToStr(DataAdmissao), DateToStr(DataFinalContrato), NumDias, NumMeses, NumAnos)
    else
      FFU.CalculaDifData(DateToStr(Date), DateToStr(DataFinalContrato), NumDias, NumMeses, NumAnos);

    case (TipoDocuracaoContrato) of
      1 : CdsSubTipo.FieldByName('DURACAOCONTRATO').asInteger := NumDias + 1;
      2 : CdsSubTipo.FieldByName('DURACAOCONTRATO').asInteger := (NumDias + 1) div 7;
      3 : CdsSubTipo.FieldByName('DURACAOCONTRATO').asInteger := NumMeses + 1;
      4 : CdsSubTipo.FieldByName('DURACAOCONTRATO').asInteger := NumAnos;
    end;
    Result := true;
  except
    Result := false;
  end;
end;

function TCtrlPessoaFuncionario.SetDataFinalContrato(DataAdmissao: TDateTime;
  DocuracaoContrato, TipoDocuracaoContrato: integer): boolean;
begin
  try
    case (TipoDocuracaoContrato) of
      1 : CdsSubTipo.FieldByName('DATAFIMCONTRATO').asString :=
        FFU.IncData(DateToStr(DataAdmissao), DocuracaoContrato-1, 0, 0);
      2 : CdsSubTipo.FieldByName('DATAFIMCONTRATO').asString :=
        FFU.IncData(DateToStr(DataAdmissao), (DocuracaoContrato*7)-1, 0, 0);
      3 : CdsSubTipo.FieldByName('DATAFIMCONTRATO').asString :=
        FFU.IncData(DateToStr(DataAdmissao), -1, DocuracaoContrato, 0);
      4 : CdsSubTipo.FieldByName('DATAFIMCONTRATO').asString :=
        FFU.IncData(DateToStr(DataAdmissao), -1, 0, DocuracaoContrato);
    end;
    Result := true;
  except
    Result := false;
  end;
end;

procedure TCtrlPessoaFuncionario.GuardarAlteracaoEndereco;
begin
  FMudouEndResid :=
    (CdsPessoa.FieldByName('IDENDRESIDENCIAL').asFloat =
     CdsEndPess.FieldByName('IDENDERECO').asFloat) and
    ((FHstEndPess.Logradouro  <> CdsEndPess.FieldByName('LOGRADOURO').asString) or
     (FHstEndPess.Complemento <> CdsEndPess.FieldByName('COMPLEMENTO').asString) or
     (FHstEndPess.Bairro      <> CdsEndPess.FieldByName('BAIRRO').asString) or
     (FHstEndPess.CEP         <> CdsEndPess.FieldByName('CEP').asString) or
     (FHstEndPess.IdCidades   <> CdsEndPess.FieldByName('IDCIDADES').asInteger) or
     (FHstEndPess.Numero      <> CdsEndPess.FieldByName('NUMERO').asString));

  if (FMudouEndResid) then
  begin
    FHstEndPess.Logradouro := CdsEndPess.FieldByName('LOGRADOURO').asString;
    FHstEndPess.Complemento := CdsEndPess.FieldByName('COMPLEMENTO').asString;
    FHstEndPess.Bairro := CdsEndPess.FieldByName('BAIRRO').asString;
    FHstEndPess.CEP := CdsEndPess.FieldByName('CEP').asString;
    FHstEndPess.IdCidades := CdsEndPess.FieldByName('IDCIDADES').asInteger;
    FHstEndPess.Numero := CdsEndPess.FieldByName('NUMERO').asString;
  end;
end;

function TCtrlPessoaFuncionario.GetMatriculaJaExiste(Matricula: string; IdEmpresa: double): double;
var
  _CdsAux: TCMClientDataSet;
begin
  try
    _CdsAux := TCMClientDataSet.Create(nil);

    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  IDPESSOA'+CR_LF+
      'FROM'+CR_LF+
      '  FUNCIONARIO'+CR_LF+
      'WHERE'+CR_LF+
      '  (MATRICULA = ' +QuotedStr(Matricula)+ ') AND'+CR_LF+
      '  (IDEMPRESA = ' +FloatToStr(IdEmpresa)+ ')');

    Result := _CdsAux.FieldByName('IDPESSOA').asFloat;

    _CdsAux.Free;
  except
    Result := 0;
  end;
end;

function TCtrlPessoaFuncionario.GetProxMatricula(Tamanho: byte): string;
var
  sMascara: string;
  _CdsAux: TCMClientDataSet;
begin
  sMascara := QuotedStr(FFU.Replicate('0', Tamanho));
  try
    _CdsAux := TCMClientDataSet.Create(nil);

    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  RTRIM(TO_CHAR(MAX(TO_NUMBER(MATRICULA))+1,' +sMascara+ ')) AS PROXIMA'+CR_LF+
      'FROM'+CR_LF+
      '  FUNCIONARIO');

    Result := _CdsAux.FieldByName('PROXIMA').asString;

    _CdsAux.Free;
  except
    Result := '';
  end;
end;

function TCtrlPessoaFuncionario.GetGodigoGrpFunc(IdPessoa: double): string;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  C.CODGRPFUNC'+CR_LF+
    'FROM'+CR_LF+
    '  FUNCIONARIO F, CARGO C'+CR_LF+
    'WHERE'+CR_LF+
    '  (F.IDPESSOA = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (F.IDCARGO  = C.IDCARGO)');

  Result := Trim(_CdsAux.FieldByName('CODGRPFUNC').asString);

  _CdsAux.Free;
end;

function TCtrlPessoaFuncionario.GetNumAdmitidos(IdEmpresa: double; CodCentroCusto,
  AnoBarraMes: string): integer;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  COUNT(*) AS NUM_ADMISSOES'+CR_LF+
    'FROM'+CR_LF+
    '  FUNCIONARIO F, EVOLFUNC E'+CR_LF+
    'WHERE'+CR_LF+
    '  (E.CODCENTROCUSTO = ' +QuotedStr(CodCentroCusto)+ ') AND'+CR_LF+
    '  (E.IDEMPRESA      = ' +FloatToStr(IdEmpresa)+ ') AND'+CR_LF+
    '  (TO_CHAR(E.DATAALTERFUNC,''YYYY/MM'') = ' +QuotedStr(AnoBarraMes)+ ') AND'+CR_LF+
    '  (E.IDPESSOA       = F.IDPESSOA) AND'+CR_LF+
    '  (E.DATAALTERFUNC  = F.DATAADMISSAO)');
  Result := _CdsAux.FieldByName('NUM_ADMISSOES').asInteger;

  _CdsAux.Free;
end;

function TCtrlPessoaFuncionario.GetNumDemitidos(IdEmpresa: double; CodCentroCusto,
  AnoBarraMes: string): integer;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  COUNT(*) AS NUM_DEMISSOES'+CR_LF+
    'FROM'+CR_LF+
    '  FUNCIONARIO F, SITFUNC SF'+CR_LF+
    'WHERE'+CR_LF+
    '  (SF.TIPOSIT       = ''D'') AND'+CR_LF+
    '  (F.CODCENTROCUSTO = ' +QuotedStr(CodCentroCusto)+ ') AND'+CR_LF+
    '  (F.IDEMPRESA      = ' +FloatToStr(IdEmpresa)+ ') AND'+CR_LF+
    '  (TO_CHAR(F.DATADESLIGAMENTO,''YYYY/MM'') = ' +QuotedStr(AnoBarraMes)+ ') AND'+CR_LF+
    '  (SF.IDSITFUNC     = F.IDSITFUNC)');
  Result := _CdsAux.FieldByName('NUM_DEMISSOES').asInteger;

  _CdsAux.Free;
end;

function TCtrlPessoaFuncionario.GerarProcessoRAD: boolean;
var
  bOk: boolean;
  sOBS: string;
{-->}function GetMotivoDesligamento: string;
     var
       _CdsAux: TCMClientDataSet;
     begin
       _CdsAux := TCMClientDataSet.Create(nil);

       _CdsAux.Data := FCtrlMotivo.ListGeral(
         CdsSubTipo.FieldByName('IDMOTIVODESLIGRAIS').asInteger);

       Result := _CdsAux.FieldByName('DESCRICAO').asString;

       _CdsAux.Free;
{-->}end;
begin
  MessageInfo := '';
  try
    if (FIdTipoProcesso > 0) then
    begin
      sOBS :=
        'Desligamento de: ' + Trim(CdsSubTipo.FieldByName('NOME').asString) +CR_LF+
        'Data de Desligamento: ' + CdsSubTipo.FieldByName('DATADESLIGAMENTO').asString +CR_LF+
        'Data do Aviso Prévio: ' + CdsSubTipo.FieldByName('DATAAVISO').asString +CR_LF+
        'Aviso Trabalhado: ' +
          FFU.IFF(CdsSubTipo.FieldByName('SALARIOTIPO').asString='S', 'Sim', 'Não') +CR_LF+
        'Motivo do Desligamento: ' + GetMotivoDesligamento;

      if (CdsSubTipo.FieldByName('IDPROCESSODEM').asInteger <= 0) then
      begin
        FCtrlRad.TipoProcesso := FIdTipoProcesso;
        FCtrlRad.IdPessoa := FIdEmpresa;
        FCtrlRad.IdUsuario := FIdUsuario;
        FCtrlRad.IdPessResp := Trunc(CdsSubTipo.FieldByName('IDPESSOA').asFloat);
        FCtrlRad.OBS := sOBS;
        FCtrlRad.IdEmpresa := CdsSubTipo.FieldByName('IDEMPRESA').asInteger;
        FCtrlRad.CodCentroCusto := CdsSubTipo.FieldByName('CODCENTROCUSTO').asString;

        CdsSubTipo.FieldByName('IDPROCESSODEM').asInteger := FCtrlRad.IniciarProcesso;

        if (CdsSubTipo.FieldByName('IDPROCESSODEM').asInteger < 0) then
          raise Exception.Create('Erro ao tentar instanciar o processo no RAD.'+
            CR_LF + FCtrlRad.MessageInfo)
        else
          MessageInfo := 'Nº do Processo RAD Gerado: ' +
            CdsSubTipo.FieldByName('IDPROCESSODEM').asString;
      end
      else
      begin
        bOk := ExecSQL('UPDATE RADINSTPROCESSO SET OBS = ' +QuotedStr(sOBS)+
                       ' WHERE IDPROCESSO = ' +CdsSubTipo.FieldByName('IDPROCESSODEM').asString);
        if not(bOk) then
          raise Exception.Create('Erro ao tentar atualizar o processo no RAD.'+
            CR_LF + MessageInfo);
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

function TCtrlPessoaFuncionario.GravarSubTipos(Operacao: TOperacao; var Mensagem: string): boolean;
var
  sMensagem: WideString; // Necessário para fazer a conversão de WideString da
                         // Aplicação Servidora com o STRING do Delphi
begin
  if (ConnectionSide = cnsClient) then
  begin
    sMensagem := Mensagem;
    Result := Connection.AppServer.GravarPessoaRescisao(Integer(Operacao), sMensagem,
      CdsSubTipo.Data);
    Mensagem := sMensagem;
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      Result := ProcessaOutros(Operacao, Mensagem);
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlPessoaFuncionario.ProcessaOutros(Operacao: TOperacao; var Mensagem: string): boolean;
begin
  Mensagem := '';
  try
    if (Operacao = opApagar) then
    begin
      if (FUsaUltimosEmpregos) then
        if not(FCdsUltEmpr.IsEmpty) then
        begin
          while not(FCdsUltEmpr.EOF) do
            FCdsUltEmpr.Delete;
          Result := ApplyCds(FCdsUltEmpr, FDbUltEmpr, [], []);
          if not(Result) then
            raise Exception.Create(FDbUltEmpr.MessageInfo);
        end; 

      if (FUsaEstrangeiro) then
        if not(FCdsEstrangeiro.IsEmpty) then
        begin
          FCdsEstrangeiro.Delete;
          Result := ApplyCds(FCdsEstrangeiro, FDbEstrangeiro, [], []);
          if not(Result) then
            raise Exception.Create(FDbEstrangeiro.MessageInfo);
        end;

      CdsSubTipo.Delete;
      Result := ApplyCds(CdsSubTipo, FDbFuncionario, [], []);
      if not(Result) then
        raise Exception.Create(FDbFuncionario.MessageInfo);

      CdsPessoaFisica.Delete;
      Result := ApplyCds(CdsPessoaFisica, _DbPessoaFisica, [], []);
      if not(Result) then
        raise Exception.Create(_DbPessoaFisica.MessageInfo);

      FIdPessoa := -1;
    end
    else
    begin
      if (FIntegraRAD) then
      begin
        if (GerarProcessoRAD) then
          Mensagem := MessageInfo
        else
          raise Exception.Create(MessageInfo);
      end;
      
      Result := ApplyCds(CdsSubTipo, FDbFuncionario,
        [_DbPessoa.IdPessoa], [FDbFuncionario.IdPessoa]);
      if not(Result) then
        raise Exception.Create(FDbFuncionario.MessageInfo);

      if (FUsaUltimosEmpregos) then
      begin
        Result := ApplyCds(FCdsUltEmpr, FDbUltEmpr,
          [FDbFuncionario.IdPessoa], [FDbUltEmpr.IdPessoa]);
        if not(Result) then
          raise Exception.Create(FDbUltEmpr.MessageInfo);
      end;

      if (FUsaEstrangeiro) then
      begin
        Result := ApplyCds(FCdsEstrangeiro, FDbEstrangeiro,
          [FDbFuncionario.IdPessoa], [FDbEstrangeiro.IdPessoa]);
        if not(Result) then
          raise Exception.Create(FDbEstrangeiro.MessageInfo);
      end;

      FIdPessoa := FDbFuncionario.IdPessoa.asFloat;
    end;
    FPassouGravacao := true;
  except
    on E:Exception do
    begin
      Result := false;
      Mensagem := E.Message;
    end;
  end;
end;

procedure TCtrlPessoaFuncionario.InitHstDocumentos;
begin
  _Cds.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDDOCUMENTO, DECODE(SIGLADOCUMENTO,''CTPS:'',1,''PIS/PASEP:'',2,3) AS CAMPO'+CR_LF+
    'FROM'+CR_LF+
    '  TIPODOCOFICIAL'+CR_LF+
    'WHERE'+CR_LF+
    '  (SIGLADOCUMENTO IN (''PIS/PASEP:'',''CTPS:'',''CPF:''))');

  // Limpo a Variável de Histórico
  FillChar(FHstDoc_Ant, SizeOf(FHstDoc_Ant), 0);
  FillChar(FHstDoc_Atu, SizeOf(FHstDoc_Atu), 0);

  FHstDoc_Ant[1].Codigo := 'CTPS'; // CTPS
  FHstDoc_Ant[2].Codigo := 'PIS'; // PIS
  FHstDoc_Ant[3].Codigo := 'CPF'; // CPF

  // Preencho o IdDocumento correspondente
  if not(_Cds.IsEmpty) then
  begin
    repeat
      FHstDoc_Ant[_Cds.FieldByName('CAMPO').asInteger].IdDocumento :=
        _Cds.FieldByName('IDDOCUMENTO').asInteger;
      FHstDoc_Atu[_Cds.FieldByName('CAMPO').asInteger].IdDocumento :=
        _Cds.FieldByName('IDDOCUMENTO').asInteger;
      _Cds.Next;
    until (_Cds.EOF);
  end;
end;

procedure TCtrlPessoaFuncionario.InitHstAltCad;
begin
  FHstAltCad_Ant[01].Codigo := 'MATRI'; // Matrícula
  FHstAltCad_Ant[02].Codigo := 'NOME';  // Nome do Empregado
  FHstAltCad_Ant[03].Codigo := 'DTNAS'; // Data de Nascimento
  FHstAltCad_Ant[04].Codigo := 'DTADM'; // Data de Admissão
  FHstAltCad_Ant[05].Codigo := 'HORTR'; // Horário de Trabalho
  FHstAltCad_Ant[06].Codigo := 'NOMCH'; // Nome do Chefe
  FHstAltCad_Ant[07].Codigo := 'GRINS'; // Grau de Instrução
  FHstAltCad_Ant[08].Codigo := 'ESTCV'; // Estado Civil
  FHstAltCad_Ant[09].Codigo := 'NOMSI'; // Sindicato
  FHstAltCad_Ant[10].Codigo := 'PROFI'; // Profissão
  FHstAltCad_Ant[11].Codigo := 'NIRRF'; // Número de Dependentes p/ IRFF
  FHstAltCad_Ant[12].Codigo := 'NSALF'; // Número de Dependentes p/ Sal. Fam.
end;

procedure TCtrlPessoaFuncionario.SelDadosEvolFunc;
begin
  FDadosHist.DataAdmissao := FFU.IFF(CdsSubTipo.FieldByName('DATAADMISSAO').asDateTime<=0,
    Date, CdsSubTipo.FieldByName('DATAADMISSAO').asDateTime);
  FDadosHist.CodCentroCusto := CdsSubTipo.FieldByName('CODCENTROCUSTO').asString;
  FDadosHist.SalarioAtual := CdsSubTipo.FieldByName('SALARIOATUAL').asFloat;
  FDadosHist.IdMotivoDesligRAIS := CdsSubTipo.FieldByName('IDMOTIVODESLIGRAIS').asFloat;
  FDadosHist.IdEstab := CdsSubTipo.FieldByName('IDESTAB').asFloat;
  FDadosHist.IdCargo := CdsSubTipo.FieldByName('IDCARGO').asFloat;
  FDadosHist.TipoPagamento := CdsSubTipo.FieldByName('TIPOPAGAMENTO').asString;
end;

procedure TCtrlPessoaFuncionario.SelDadosSitFunc(TipoSit: string);
begin
  if (TipoSit <> 'A') and not(CdsSubTipo.FieldByName('DataDesligamento').IsNull) then
    FDadosHist.DataSit := CdsSubTipo.FieldByName('DataDesligamento').asDateTime
  else
  if (TipoSit = 'A') and not(CdsSubTipo.FieldByName('DataRetorno').IsNull) then
    FDadosHist.DataSit := CdsSubTipo.FieldByName('DataRetorno').asDateTime
  else
  if not(CdsSubTipo.FieldByName('DataAdmissao').IsNull) then
    FDadosHist.DataSit := CdsSubTipo.FieldByName('DataAdmissao').asDateTime
  else
    FDadosHist.DataSit := Date;

  FDadosHist.IdSitFunc := CdsSubTipo.FieldByName('IDSITFUNC').asFloat;
  FDadosHist.IdMotivoDesligRAIS := CdsSubTipo.FieldByName('IDMOTIVODESLIGRAIS').asFloat;
  FDadosHist.IdMotivoDesligGerencial := CdsSubTipo.FieldByName('IDMOTIVODESLIGGERENCIAL').asFloat;
  FDadosHist.IdMovContrCAGED := CdsSubTipo.FieldByName('IDMOVCONTRCAGED').asFloat;
end;

procedure TCtrlPessoaFuncionario.SelHstDocumentos(PrimeiraVez: boolean);
var
  c: byte;
  HstDoc: ^THstDocumentos;
  Marca: TBookmark;
begin
  if (PrimeiraVez) then
    HstDoc := @FHstDoc_Ant
  else
    HstDoc := @FHstDoc_Atu;

  CdsDocPessoa.DisableControls;
  Marca := CdsDocPessoa.GetBookmark;

  for c:=1 to NUM_DOC_ALT do
    if (CdsDocPessoa.Locate('IDDOCUMENTO', HstDoc[c].IdDocumento, [])) then
      HstDoc[c].Numero := Trim(CdsDocPessoa.FieldByname('NUMDOCUMENTO').asString)
    else
      HstDoc[c].Numero := '';

  CdsDocPessoa.GotoBookmark(Marca);
  CdsDocPessoa.FreeBookmark(Marca);
  CdsDocPessoa.EnableControls;
end;

procedure TCtrlPessoaFuncionario.SelHstAltCad(PrimeiraVez: boolean; Matricula, Nome: string;
  DataNasc,DataAdm: TDate; Horario, Chefe, GrauInstr, EstadoCivil, Sindicato, Profissao: string;
  NumDepIRRF, NumDepSalFam: integer);
var
  HstAltCad: ^THstAltCad;
begin
  if (PrimeiraVez) then
    HstAltCad := @FHstAltCad_Ant
  else
    HstAltCad := @FHstAltCad_Atu;

  HstAltCad[01].Valor := Trim(Matricula);
  HstAltCad[02].Valor := Trim(Nome);
  HstAltCad[03].Valor := DateToStr(DataNasc);
  HstAltCad[04].Valor := DateToStr(DataAdm);
  HstAltCad[05].Valor := Trim(Horario);
  HstAltCad[06].Valor := Trim(Chefe);
  HstAltCad[07].Valor := Trim(GrauInstr);
  HstAltCad[08].Valor := Trim(EstadoCivil);
  HstAltCad[09].Valor := Trim(Sindicato);
  HstAltCad[10].Valor := Trim(Profissao);
  HstAltCad[11].Valor := IntToStr(NumDepIRRF);
  HstAltCad[12].Valor := IntToStr(NumDepSalFam);
end;

function TCtrlPessoaFuncionario.GravarHistorico(GravarHstAltCad, Inserindo: boolean;
  IdEmpresa: double): boolean;
var
  iNumErros: integer;
  sMensagem: string;
  OLD_OnMessageInfo: TOnMessageInfo;
begin
  try
    Result := true;

    OLD_OnMessageInfo := OnMessageInfo;
    OnMessageInfo := nil;

    FInserindo := Inserindo;
    iNumErros := 0;
    sMensagem := '';
    MessageInfo := '';

    // Histórico de Alteração da Evolução Funcional apenas na Inclusão do Empregado
    if (FInserindo) then
    begin
      Result := GravarHstAltEvolFunc(IdEmpresa);
      if not(Result) then
      begin
        Inc(iNumErros);
        sMensagem := CR_LF+ MessageInfo;
      end;
    end;

    // Histórico de Alteração da Situação Funcional
    if (FMudouSituacao) then
    begin
      Result := GravarHstAltSitFunc;
      if not(Result) then
      begin
        Inc(iNumErros);
        sMensagem := sMensagem +CR_LF+ MessageInfo;
      end;
    end;

    if (GravarHstAltCad) then
    begin
      // Mudança de Endereço
      if (FMudouEndResid) then
      begin
        Result := GravarHstAltEndereco;
        if not(Result) then
        begin
          Inc(iNumErros);
          sMensagem := sMensagem +CR_LF+ MessageInfo;
        end;
      end;

      // Documentos
      Result := GravarHstDocumentos;
      if not(Result) then
      begin
        Inc(iNumErros);
        sMensagem := sMensagem +CR_LF+ MessageInfo;
      end;

      // Alterações Cadastrais Diversas
      Result := GravarHstAltCadastral;
      if not(Result) then
      begin
        Inc(iNumErros);
        sMensagem := sMensagem +CR_LF+ MessageInfo;
      end;
    end;

    if (sMensagem <> '') then
    begin
      MessageInfo := 'Ocorreu um erro ao tentar gravar:' + sMensagem;
      Result := (iNumErros < 3);
    end;

    OnMessageInfo := OLD_OnMessageInfo;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;  
  end;
end;

function TCtrlPessoaFuncionario.GravarHstAltSitFunc: boolean;
begin
  try
    StartTransaction;

    _Cds.Data := GetDataPacket(
      'SELECT IDPESSOA'+CR_LF+
      'FROM   HSTSITFUNC'+CR_LF+
      'WHERE  (IDPESSOA    = ' +FloatToStr(FIdPessoa)+ ') AND'+CR_LF+
      '       (DATASITFUNC = TO_DATE(' +QuotedStr(DateToStr(FDadosHist.DataSit))+ ',''DD/MM/YYYY''))');

    if (_Cds.IsEmpty) then
      Result := ExecSQL(
        'INSERT INTO HSTSITFUNC (IDPESSOA,DATASITFUNC,IDSITFUNC,IDMOTIVOOFIC,'+
        'IDMOTIVOGER,IDMOVCONTRCAGED) VALUES ('+
        FloatToStr(FIdPessoa)+','+
        'TO_DATE(' +QuotedStr(DateToStr(FDadosHist.DataSit))+ ',''DD/MM/YYYY''),'+
        FFU.IFF(FDadosHist.IdSitFunc=0, 'NULL', FloatToStr(FDadosHist.IdSitFunc))+','+
        FFU.IFF(FDadosHist.IdMotivoDesligRAIS=0, 'NULL', FloatToStr(FDadosHist.IdMotivoDesligRAIS))+','+
        FFU.IFF(FDadosHist.IdMotivoDesligGerencial=0, 'NULL', FloatToStr(FDadosHist.IdMotivoDesligGerencial))+','+
        FFU.IFF(FDadosHist.IdMovContrCAGED=0, 'NULL', FloatToStr(FDadosHist.IdMovContrCAGED))+')')
    else
      Result := ExecSQL(
        'UPDATE HSTSITFUNC SET'+CR_LF+
        '  IDSITFUNC       = ' +FFU.IFF(FDadosHist.IdSitFunc=0, 'NULL', FloatToStr(FDadosHist.IdSitFunc)) +','+CR_LF+
        '  IDMOTIVOOFIC    = ' +FFU.IFF(FDadosHist.IdMotivoDesligRAIS=0, 'NULL', FloatToStr(FDadosHist.IdMotivoDesligRAIS)) +','+CR_LF+
        '  IDMOTIVOGER     = ' +FFU.IFF(FDadosHist.IdMotivoDesligGerencial=0, 'NULL', FloatToStr(FDadosHist.IdMotivoDesligGerencial)) +','+CR_LF+
        '  IDMOVCONTRCAGED = ' +FFU.IFF(FDadosHist.IdMovContrCAGED=0, 'NULL', FloatToStr(FDadosHist.IdMovContrCAGED)) +CR_LF+
        'WHERE'+CR_LF+
        '  (IDPESSOA    = ' +FloatToStr(FIdPessoa)+ ') AND'+CR_LF+
        '  (DATASITFUNC = TO_DATE(' +QuotedStr(DateToStr(FDadosHist.DataSit))+ ',''DD/MM/YYYY''))');

    if (Result) then
      Commit
    else
      raise Exception.Create(MessageInfo);
  except
    on E: Exception do
    begin
      Rollback;
      Result := false;
      MessageInfo := CR_LF+
        ' * Histórico da Situação Funcional.' +CR_LF+ 'Erro:' +CR_LF+ E.Message;
    end;
  end;
end;

function TCtrlPessoaFuncionario.GravarHstAltEvolFunc(IdEmpresa: double): boolean;
begin
  try
    StartTransaction;

    _Cds.Data := GetDataPacket(
      'SELECT IDPESSOA'+CR_LF+
      'FROM   EVOLFUNC'+CR_LF+
      'WHERE  (IDPESSOA      = ' +FloatToStr(FIdPessoa)+ ') AND'+CR_LF+
      '       (DATAALTERFUNC = TO_DATE(' +QuotedStr(DateToStr(FDadosHist.DataSit))+ ',''DD/MM/YYYY''))');

    if (_Cds.IsEmpty) then
      Result := ExecSQL(
        'INSERT INTO EVOLFUNC (IDPESSOA,DATAALTERFUNC,IDEMPRESA,CODCENTROCUSTO,'+
        'SALARIO,PERC_REAJ,IDMOTIVO,IDESTAB,IDCARGO,TIPOPAGAMENTO) '+
        'VALUES ('+
        FloatToStr(FIdPessoa)+','+
        'TO_DATE(' +QuotedStr(DateToStr(FDadosHist.DataAdmissao))+ ',''DD/MM/YYYY''),'+
        FloatToStr(IdEmpresa)+','+
        FFU.IFF(FDadosHist.CodCentroCusto='', 'NULL', QuotedStr(FDadosHist.CodCentroCusto))+','+
        FFU.Float2String(FDadosHist.SalarioAtual)+','+
        '0,'+
        FFU.IFF(FDadosHist.IdMotivoDesligRAIS=0, 'NULL', FloatToStr(FDadosHist.IdMotivoDesligRAIS))+','+
        FFU.IFF(FDadosHist.IdEstab=0, 'NULL', FloatToStr(FDadosHist.IdEstab))+','+
        FFU.IFF(FDadosHist.IdCargo=0, 'NULL', FloatToStr(FDadosHist.IdCargo))+','+
        FFU.IFF(FDadosHist.TipoPagamento='', 'NULL', QuotedStr(FDadosHist.TipoPagamento))+')')
    else
      Result := ExecSQL(
        'UPDATE EVOLFUNC SET'+CR_LF+
        '  IDEMPRESA      = ' +FloatToStr(IdEmpresa) +','+CR_LF+
        '  CODCENTROCUSTO = ' +FFU.IFF(FDadosHist.CodCentroCusto='', 'NULL', QuotedStr(FDadosHist.CodCentroCusto)) +','+CR_LF+
        '  SALARIO        = ' +FFU.Float2String(FDadosHist.SalarioAtual) +','+CR_LF+
        '  PERC_REAJ      = 0,' +CR_LF+
        '  IDMOTIVO       = ' +FFU.IFF(FDadosHist.IdMotivoDesligRAIS=0, 'NULL', FloatToStr(FDadosHist.IdMotivoDesligRAIS)) +','+CR_LF+
        '  IDESTAB        = ' +FFU.IFF(FDadosHist.IdEstab=0, 'NULL', FloatToStr(FDadosHist.IdEstab)) +','+CR_LF+
        '  IDCARGO        = ' +FFU.IFF(FDadosHist.IdCargo=0, 'NULL', FloatToStr(FDadosHist.IdCargo)) +','+CR_LF+
        '  TIPOPAGAMENTO  = ' +FFU.IFF(FDadosHist.TipoPagamento='', 'NULL', QuotedStr(FDadosHist.TipoPagamento)) +CR_LF+
        'WHERE'+CR_LF+
        '  (IDPESSOA      = ' +FloatToStr(FIdPessoa)+ ') AND'+CR_LF+
        '  (DATAALTERFUNC = TO_DATE(' +QuotedStr(DateToStr(FDadosHist.DataAdmissao))+ ',''DD/MM/YYYY''))');

    if (Result) then
      Commit
    else
      raise Exception.Create(MessageInfo);
  except
    on E: Exception do
    begin
      Rollback;
      Result := false;
      MessageInfo := CR_LF+
        ' * Histórico da Evolução Funcional.' +CR_LF+ 'Erro:' +CR_LF+ E.Message;
    end;
  end;
end;

function TCtrlPessoaFuncionario.GravarHstAltEndereco: boolean;
begin
  try
    StartTransaction;

    _Cds.Data := GetDataPacket(
      'SELECT IDPESSOA, DATAALT'+CR_LF+
      'FROM   HSTENDPESS'+CR_LF+
      'WHERE  (IDPESSOA = ' +FloatToStr(FIdPessoa)+ ') AND'+CR_LF+
      '       (DATAALT  = TO_DATE(' +QuotedStr(DateToStr(Date))+ ',''DD/MM/YYYY''))');

    if (_Cds.IsEmpty) then
      Result := ExecSQL(
        'INSERT INTO HSTENDPESS (IDPESSOA, DATAALT, LOGRADOURO, '+
        'COMPLEMENTO, NUMERO, CEP, BAIRRO, IDCIDADES)'+CR_LF+
        'VALUES ('+
        FloatToStr(FIdPessoa) +', '+
        'TO_DATE('+ QuotedStr(DateToStr(Date)) +',''DD/MM/YYYY''), '+
        QuotedStr(FHstEndPess.Logradouro) +', '+
        QuotedStr(FHstEndPess.Complemento) +', '+
        QuotedStr(FHstEndPess.Numero) +', '+
        QuotedStr(FHstEndPess.CEP) +', '+
        QuotedStr(FHstEndPess.Bairro) +', '+
        IntToStr(FHstEndPess.IdCidades) +')')
    else
      Result := ExecSQL(
        'UPDATE HSTENDPESS SET'+CR_LF+
        '  LOGRADOURO  = ' +QuotedStr(FHstEndPess.Logradouro) +','+CR_LF+
        '  COMPLEMENTO = ' +QuotedStr(FHstEndPess.Complemento) +','+CR_LF+
        '  NUMERO      = ' +QuotedStr(FHstEndPess.Numero) +','+CR_LF+
        '  CEP         = ' +QuotedStr(FHstEndPess.CEP) +','+CR_LF+
        '  BAIRRO      = ' +QuotedStr(FHstEndPess.Bairro) +','+CR_LF+
        '  IDCIDADES   = ' +IntToStr(FHstEndPess.IdCidades) +CR_LF+
        'WHERE'+CR_LF+
        '  (IDPESSOA = ' +FloatToStr(FIdPessoa)+ ') AND'+CR_LF+
        '  (DATAALT  = TO_DATE(' +QuotedStr(DateToStr(Date))+ ',''DD/MM/YYYY''))');

    if (Result) then
      Commit
    else
      raise Exception.Create(MessageInfo);
  except
    on E: Exception do
    begin
      Rollback;
      Result := false;
      MessageInfo := CR_LF+
        ' * Histórico das Alterações no Endereço Residencial.' +CR_LF+ 'Erro:' +CR_LF+ E.Message;
    end;
  end;
end;

function TCtrlPessoaFuncionario.GravarHstDocumentos: boolean;
var
  c: byte;
begin
  Result := true;
  try
    StartTransaction;

    for c:=1 to NUM_DOC_ALT do
    begin
      if ((FHstDoc_Ant[c].Numero <> '') or (FHstDoc_Atu[c].Numero <> '')) and
         ((FHstDoc_Ant[c].Numero <> FHstDoc_Atu[c].Numero) or (FInserindo)) then
      begin
        _Cds.Data := GetDataPacket(
          'SELECT IDPESSOA'+CR_LF+
          'FROM   HSTALTCAD'+CR_LF+
          'WHERE  (IDPESSOA     = ' +FloatToStr(FIdPessoa)+ ') AND'+CR_LF+
          '       (CODALTERACAO = ' +QuotedStr(FHstDoc_Ant[c].Codigo)+ ') AND'+CR_LF+
          '       (DATAALT      = TO_DATE(' +QuotedStr(DateToStr(Date))+ ',''DD/MM/YYYY''))');

        if (_Cds.IsEmpty) then
          Result := ExecSQL(
            'INSERT INTO HSTALTCAD (IDPESSOA, DATAALT, CODALTERACAO, ALTERACAO)'+CR_LF+
            ' VALUES ('+
            FloatToStr(FIdPessoa)+
            ', TO_DATE('+ QuotedStr(DateToStr(Date)) +',''DD/MM/YYYY''), '+
            QuotedStr(FHstDoc_Ant[c].Codigo) +', '+
            QuotedStr(FHstDoc_Atu[c].Numero) +')')
        else
          Result := ExecSQL(
            'UPDATE HSTALTCAD SET'+CR_LF+
            '  ALTERACAO     = '+ QuotedStr(FHstDoc_Atu[c].Numero)+CR_LF+
            'WHERE'+CR_LF+
            '  (IDPESSOA     = ' +FloatToStr(FIdPessoa)+ ') AND'+CR_LF+
            '  (CODALTERACAO = ' +QuotedStr(FHstDoc_Ant[c].Codigo)+ ') AND'+CR_LF+
            '  (DATAALT      = TO_DATE(' +QuotedStr(DateToStr(Date))+ ',''DD/MM/YYYY''))');

        if not(Result) then
          break;
      end;
    end;

    if (Result) then
      Commit
    else
      raise Exception.Create(MessageInfo);
  except
    on E: Exception do
    begin
      Rollback;
      Result := false;
      MessageInfo := CR_LF+
        ' * Histórico das Alterações nos Documentos.' +CR_LF+ 'Erro:' +CR_LF+ E.Message;
    end;
  end;
end;

function TCtrlPessoaFuncionario.GravarHstAltCadastral: boolean;
var
  c: byte;
begin
  Result := true;
  try
    StartTransaction;

    for c:=1 to NUM_CAD_ALT do
    begin
      if ((FHstAltCad_Ant[c].Valor <> '') or (FHstAltCad_Atu[c].Valor <> '')) and
         ((FHstAltCad_Ant[c].Valor <> FHstAltCad_Atu[c].Valor) or (FInserindo)) then
      begin
        _Cds.Data := GetDataPacket(
          'SELECT IDPESSOA'+CR_LF+
          'FROM   HSTALTCAD'+CR_LF+
          'WHERE  (IDPESSOA     = ' +FloatToStr(FIdPessoa)+ ') AND'+CR_LF+
          '       (CODALTERACAO = ' +QuotedStr(FHstAltCad_Ant[c].Codigo)+ ') AND'+CR_LF+
          '       (DATAALT      = TO_DATE(' +QuotedStr(DateToStr(Date))+ ',''DD/MM/YYYY''))');

        if (_Cds.IsEmpty) then
          Result := ExecSQL(
            'INSERT INTO HSTALTCAD (IDPESSOA, DATAALT, CODALTERACAO, ALTERACAO)'+CR_LF+
            ' VALUES ('+
            FloatToStr(FIdPessoa)+
            ', TO_DATE('+ QuotedStr(DateToStr(Date)) +',''DD/MM/YYYY''), '+
            QuotedStr(FHstAltCad_Ant[c].Codigo) +', '+
            QuotedStr(FHstAltCad_Atu[c].Valor) +')')
        else
          Result := ExecSQL(
            'UPDATE HSTALTCAD SET'+CR_LF+
            '  ALTERACAO     = '+ QuotedStr(FHstAltCad_Atu[c].Valor)+CR_LF+
            'WHERE'+CR_LF+
            '  (IDPESSOA     = ' +FloatToStr(FIdPessoa)+ ') AND'+CR_LF+
            '  (CODALTERACAO = ' +QuotedStr(FHstAltCad_Ant[c].Codigo)+ ') AND'+CR_LF+
            '  (DATAALT      = TO_DATE(' +QuotedStr(DateToStr(Date))+ ',''DD/MM/YYYY''))');

        if not(Result) then
          break;
      end;
    end;

    if (Result) then
      Commit
    else
      raise Exception.Create(MessageInfo);
  except
    on E: Exception do
    begin
      Rollback;
      Result := false;
      MessageInfo := CR_LF+
        ' * Histórico de Alterações Cadastrais.' +CR_LF+ 'Erro:' +CR_LF+ E.Message;
    end;
  end;
end;

end.
