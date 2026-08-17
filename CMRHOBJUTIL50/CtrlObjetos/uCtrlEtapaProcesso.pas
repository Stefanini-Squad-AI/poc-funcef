{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 27/11/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlEtapaProcesso;

interface

uses SysUtils, Controls, Db, DbClient, uCmDbObject, uCmControlObject, IvDictio,
  uCMClientDataSet, uCtrlCustomRH, uCtrlLancamento, uCtrlParamIntegra, uCtrlDocumento,
  uCtrlHonorarioProcesso, uCtrlListTerceirosRH, uCtrlBancoPortFolha, uCtrlIntegraCAPCAR_RH,
  uDbProcessoTrab, uDbEtapaProcTrab, uDbHonorarios, uDbImagens, uDbImovel, uDbEventoImovel;

type
  TCtrlEtapaProcesso = class(TCtrlCustomRH)
  protected
    FCtrlLancamento: TCtrlLancamento;
    FCtrlDocumento: TCtrlDocumento;
    FCtrlListTerceirosRH: TCtrlListTerceirosRH;
    FCtrlBancoPortFolha: TCtrlBancoPortFolha;
    FCtrlIntegraCAPCAR_RH: TCtrlIntegraCAPCAR_RH;
    FCtrlHonorarioProcesso: TCtrlHonorarioProcesso;

    FCdsDocumentos: TCMClientDataSet;

    FObrigaAbc: boolean;
    FObrigaCRespon: boolean;
    FUsaPlanoPatro: boolean;

    FIdHotel: double;

    FValorTotal_Original: double;

    FIdPlano: integer;
    FPortadorFormaPadrao: integer;
    FIdModulo: integer;
    FIdUsuario: integer;
    FIdEspAcesso: integer;
    FIdEmpresa: integer;
    FNumEtapas_Original: integer;
    FIdFavorecido: integer;
    FPlanoPrevGlobal: integer;
    FPatroGlobal: integer;

    FCodEtapas_Original: OleVariant;
    FValorEtapas_Original: OleVariant;
    FValorHonorarios_Original: OleVariant;

    FCodTipRecDes: string;
    FListaNumDocCAP: string;
    FListaPlnCodigo: string;

    FDataEmissao: TDate;

    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
    procedure OnApplyCdsRecord(aCds: TClientDataSet; const sTableName: string;
      CdsState: TUpdateStatus; var Accept: boolean); override;
    procedure AfterApplyCdsRecord(aCds: TClientDataSet; const sTableName: string;
      CdsState: TUpdateStatus; Accept: boolean); override;
  private
    FDbProcesso: TDbProcessoTrab;
    FDbEtapas: TDbEtapaProcTrab;
    FDbImagens: TDbImagens;
    FDbHonorarios: TDbHonorarios;
    FDbImovel: TDbImovel;
    FDbEventoImovel: TDbEventoImovel;

    FCdsProcesso: TCMClientDataSet;
    FCdsEtapas: TCMClientDataSet;
    FCdsImagens: TCMClientDataSet;
    FCdsHonorarios: TCMClientDataSet;
    FCdsImovel: TCMClientDataSet;
    FCdsEventoImovel: TCMClientDataSet;

    procedure GetDiferencaValorIntegra(var ValEtapa, ValHonor: double);

    function GerarIntegracaoCAP(Valor: double; DataPag: TDate): boolean;
    function GerarIntegracaoContabil(Valor: double; IdPlanoPrev, IdPatro: integer;
      PlaConta: string; Plano: integer; PlaContaCredito, TipoOperacao,
      DescricaoLancamento: string): boolean;
    function GerarCAP(Valor: double): boolean;
  public
    constructor Create(IdEmpresa: integer; IdHotel: double; UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce;
    destructor  Destroy; override;

    // Métodos de execução de Querys
    function ListEtapas(NumProcTrab: double): OleVariant;
    function ListImagens(NumProcTrab: double): OleVariant;

    function GetUltimoNumSeq: integer;
    function ApanhaProximoNumSeq(NumProcesso: string): integer;

    // Verifica se o Usuário especificado tiver agenda
    function UsuarioComAgenda(IdUsuario: double): boolean;

    function GerarHonorario(DataPag: TDate): boolean;

    function GravarEtapaProcesso(GravarImagens: boolean = true;
      GravarHonorarios: boolean = true): boolean;

    // Inicializa variáveis usadas na integração
    procedure IniciarIntegracao(IdModulo, IdUsuario, IdEspAcesso: integer;
      UsaPlanoPatro, ObrigaAbc, ObrigaCRespon: boolean; PlanoPrevGlobal, PatroGlobal: integer);

    procedure IniciarValoresContabeis;
    procedure IniciarValoresContabeisAppServer(NumEtapas_Original: integer;
      CodEtapas_Original: OleVariant; ValorEtapas_Original: OleVariant;
      ValorHonorarios_Original: OleVariant; ValorTotal_Original: double);
      
    // Atualiza Total de Despesas de acordo com a Despesa informada
    procedure AtualizarTotalDespesas(ValorDespesa: double);

    // Faz a geração da integração com a Contabilidade e/ou CAP
    function  GerarIntegracao(const IAppCliente: OleVariant; FazCAP, FazContab: boolean;
      DataEmissao, DataPagamento: TDateTime; IdFavorecido, IdPlanoPrev, IdPatro: integer;
      PlaConta: string; Plano: integer; PlaContaCredito, TipoOperacao, CodTipRecDes: string;
      CodTipDoc: integer): boolean;

    function  GerarIntegracaoRateioDespesas(FazCAP, FazContab: boolean; DataEmissao, DataPagamento: TDate;
      IdFavorecido, IdPlanoPrev, IdPatro: integer; PlaConta: string; Plano: integer;
      PlaContaCredito, TipoOperacao, CodTipRecDes: string; CodTipDoc: integer;
      DescricaoLancamento: string; Valor: double): boolean;

    function AtualizarImovel(IdImovel: double; Inicio: boolean): boolean;

    function InserirEventoImovel(IdImovel: double; EviData: TDate;
      Inicio: boolean; EviDescricao: string; EviPercent, EviVlrAjustado: double): boolean;

    property CdsEtapas: TCMClientDataSet read FCdsEtapas write FCdsEtapas;
    property CdsImagens: TCMClientDataSet read FCdsImagens write FCdsImagens;
    property CdsHonorarios: TCMClientDataSet read FCdsHonorarios write FCdsHonorarios;
    property CdsProcesso: TCMClientDataSet read FCdsProcesso write FCdsProcesso;
    property CdsImovel: TCMClientDataSet read FCdsImovel write FCdsImovel;
    property CdsEventoImovel: TCMClientDataSet read FCdsEventoImovel write FCdsEventoImovel;

  end;

implementation

uses  uCMTypes, uCtrlFuncoesRH;
//Variants,
{ TCtrlEtapaProcesso }

constructor TCtrlEtapaProcesso.Create(IdEmpresa: integer; IdHotel: double; UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  FDbProcesso := TDbProcessoTrab.Create(Self);
  FDbEtapas := TDbEtapaProcTrab.Create(Self);
  FDbImagens := TDbImagens.Create(Self);
  FDbHonorarios := TDbHonorarios.Create(Self);
  FDbImovel := TDbImovel.Create(Self);
  FDbEventoImovel := TDbEventoImovel.Create(Self);

  FCtrlLancamento := TCtrlLancamento.Create;
  FCtrlDocumento := TCtrlDocumento.Create;
  FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCtrlBancoPortFolha := TCtrlBancoPortFolha.Create(IdEmpresa);
  FCtrlIntegraCAPCAR_RH := TCtrlIntegraCAPCAR_RH.Create(IdHotel, UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCtrlHonorarioProcesso := TCtrlHonorarioProcesso.Create(
    IdEmpresa, IdHotel, UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FCtrlLancamento.OpenTransaction := false;
  FCtrlDocumento.OpenTransaction := false;

  FIdEmpresa := IdEmpresa;
  FIdHotel := IdHotel;

  inherited Create;
end;

destructor TCtrlEtapaProcesso.Destroy;
begin
  FreeAndNil(FDbProcesso);
  FreeAndNil(FDbEtapas);
  FreeAndNil(FDbImagens);
  FreeAndNil(FDbHonorarios);
  FreeAndNil(FDbImovel);
  FreeAndNil(FDbEventoImovel);

  FreeAndNil(FCtrlLancamento);
  FreeAndNil(FCtrlDocumento);
  FreeAndNil(FCtrlListTerceirosRH);
  FreeAndNil(FCtrlBancoPortFolha);
  FreeAndNil(FCtrlIntegraCAPCAR_RH);
  FreeAndNil(FCtrlHonorarioProcesso);
  if (IsAppServer) then
  begin
    FreeAndNil(FCdsProcesso);
    FreeAndNil(FCdsEtapas);
    FreeAndNil(FCdsImagens);
    FreeAndNil(FCdsHonorarios);
    FreeAndNil(FCdsImovel);
    FreeAndNil(FCdsEventoImovel);
  end;
  inherited;
end;

procedure TCtrlEtapaProcesso.AfterInitialize;
begin
  inherited;
  FCtrlLancamento.InitializeAs(Self);
  FCtrlDocumento.InitializeAs(Self);
  FCtrlListTerceirosRH.InitializeAs(Self);
  FCtrlBancoPortFolha.InitializeAs(Self);
  FCtrlIntegraCAPCAR_RH.InitializeAs(Self);
  FCtrlHonorarioProcesso.InitializeAs(Self);
end;

procedure TCtrlEtapaProcesso.OnCreateAppServer;
begin
  inherited;
  FCdsProcesso := TCMClientDataSet.Create(nil);
  FCdsEtapas := TCMClientDataSet.Create(nil);
  FCdsImagens := TCMClientDataSet.Create(nil);
  FCdsHonorarios := TCMClientDataSet.Create(nil);
  FCdsImovel := TCMClientDataSet.Create(nil);
  FCdsEventoImovel := TCMClientDataSet.Create(nil);
end;

procedure TCtrlEtapaProcesso.DoChangeDataBase;
begin
  inherited;
  FDbProcesso.DataBaseName := DataBaseName;
  FDbEtapas.DataBaseName := DataBaseName;
  FDbImagens.DataBaseName := DataBaseName;
  FDbHonorarios.DataBaseName := DataBaseName;
  FDbImovel.DataBaseName := DataBaseName;
  FDbEventoImovel.DataBaseName := DataBaseName;

  //*FCtrlLancamento.DataBaseName := DataBaseName;
 //* FCtrlDocumento.DataBaseName := DataBaseName;
 //* FCtrlListTerceirosRH.DataBaseName := DataBaseName;
 //* FCtrlBancoPortFolha.DataBaseName := DataBaseName;
 //* FCtrlIntegraCAPCAR_RH.DataBaseName := DataBaseName;
 //* FCtrlHonorarioProcesso.DataBaseName := DataBaseName;
end;

function TCtrlEtapaProcesso.ListEtapas(NumProcTrab: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  ET.NUMSEQ, TP.DESCRICAO AS ETAPA, ET.ASSUNTO, ET.DATAREALOCOR, TP.VALORHONOR,'+CR_LF+
    '  ET.NUMPROCTRAB, ET.CODTIPORECURSO, ET.VALORREC, ET.OBSERVETAPA, ET.IDIMAGEM,'+CR_LF+
    '  ET.FLGVALORABATE, TP.FLGPENHORA, TP.FLGENCERRAMENTO,'+CR_LF+
    '  ET.INDPENHORA, ET.IDBEM, ET.IDPESSOA, ET.IDIMOVEL, ET.IDCONJUNTO,'+CR_LF+
    '  ET.IDINVESTIMENTO, ET.VALOR, ET.INDVALOR'+CR_LF+
    'FROM'+CR_LF+
    '  ETAPAPROCTRAB ET, TIPORECTRAB TP'+CR_LF+
    'WHERE'+CR_LF+
    '  (ET.NUMPROCTRAB    = ' +FloatToStr(NumProcTrab)+ ') AND'+CR_LF+
    '  (ET.CODTIPORECURSO = TP.CODTIPORECURSO)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  ET.DATAREALOCOR');
end;

function TCtrlEtapaProcesso.ListImagens(NumProcTrab: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  EP.NUMSEQ, IMG.IDIMAGEM, IMG.IMAGEM, IMG.DESCRIMAGEM'+CR_LF+
    'FROM'+CR_LF+
    '  IMAGENS IMG, ETAPAPROCTRAB EP'+CR_LF+
    'WHERE'+CR_LF+
    '  (EP.NUMPROCTRAB = ' +FloatToStr(NumProcTrab)+ ') AND'+CR_LF+
    '  (EP.IDIMAGEM    = IMG.IDIMAGEM)');
end;

function TCtrlEtapaProcesso.GetUltimoNumSeq: integer;
begin
  CdsEtapas.DisableControls;
  CdsEtapas.First;
  Result := 0;
  while not(CdsEtapas.EOF) do
  begin
    if (CdsEtapas.FieldByName('NUMSEQ').asInteger > Result) then
      Result := CdsEtapas.FieldByName('NUMSEQ').asInteger;
    CdsEtapas.Next;
  end;
  CdsEtapas.First;
  CdsEtapas.EnableControls;
end;

function TCtrlEtapaProcesso.ApanhaProximoNumSeq(NumProcesso: string): integer;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Data := GetDataPacket(
    'SELECT MAX(NUMSEQ) AS NUMSEQ'+CR_LF+
    'FROM   ETAPAPROCTRAB'+CR_LF+
    'WHERE (NUMPROCTRAB = ' +NumProcesso+ ')');

  Result := _CdsAux.FieldByName('NUMSEQ').asinteger + 1;

  _CdsAux.Free;
end;

function TCtrlEtapaProcesso.UsuarioComAgenda(IdUsuario: double): boolean;
begin
  _Cds.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  EP.NUMPROCTRAB, EP.NUMSEQ ' +CR_LF+
    'FROM' +CR_LF+
    '  ETAPAPROCTRAB EP, PROCESSOTRAB PT' +CR_LF+
    'WHERE' +CR_LF+
    '  (PT.IDADVOGCASA   = ' +FloatToStr(IdUsuario)+ ') AND' +CR_LF+
    '  (PT.NUMPROCTRAB   = EP.NUMPROCTRAB) AND' +CR_LF+
    '  (EP.DATAREALOCOR >= SYSDATE)');

  Result := not(_Cds.IsEmpty);
end;

function TCtrlEtapaProcesso.GerarHonorario(DataPag: TDate): boolean;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := FCtrlHonorarioProcesso.ListHonorario(
      FCdsProcesso.FieldByName('NUMPROCTRAB').asFloat,
      FCdsProcesso.FieldByName('IDADVOGRECDA').asFloat, DataPag);
    if (_CdsAux.IsEmpty) then
    begin
      if (FCdsHonorarios.Locate('NUMSEQ', FCdsEtapas.FieldByName('NUMSEQ').asInteger, [])) then
        FCdsHonorarios.Edit
      else
        FCdsHonorarios.Insert;

      FCdsHonorarios.FieldByName('NUMSEQ').asInteger := FCdsEtapas.FieldByName('NUMSEQ').asInteger;
      FCdsHonorarios.FieldByName('NUMPROCTRAB').asFloat := FCdsProcesso.FieldByName('NUMPROCTRAB').asFloat;
      FCdsHonorarios.FieldByName('DATAPAGTOHONOR').asDateTime := DataPag;
      FCdsHonorarios.FieldByName('IDFORNSERV').asFloat := FCdsProcesso.FieldByName('IDADVOGRECDA').asFloat;
      FCdsHonorarios.FieldByName('VALORHONOR').asFloat := FCdsEtapas.FieldByName('VALORHONOR').asFloat;
      FCdsHonorarios.Post;
    end;
    Result := true;
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
  FreeAndNil(_CdsAux);
end;

procedure TCtrlEtapaProcesso.OnApplyCdsRecord(aCds: TClientDataSet;
  const sTableName: string; CdsState: TUpdateStatus; var Accept: boolean);
begin
  inherited;
  if (Accept) and (sTableName = 'IMAGENS') and (CdsState = usDeleted) then
  begin
    ExecSQL(
      'UPDATE ETAPAPROCTRAB SET IDIMAGEM=NULL'+CR_LF+
      'WHERE (NUMPROCTRAB = ' +FCdsProcesso.FieldByName('NUMPROCTRAB').asString+ ') AND'+CR_LF+
      '      (NUMSEQ      = ' +aCds.FieldByName('NUMSEQ').asString+ ')');

    FCdsEtapas.Locate('NUMSEQ', aCds.FieldByName('NUMSEQ').asString, []);
    FCdsEtapas.Edit;
    FCdsEtapas.FieldByName('IDIMAGEM').Clear;
    FCdsEtapas.Post;
  end;
end;

procedure TCtrlEtapaProcesso.AfterApplyCdsRecord(aCds: TClientDataSet;
  const sTableName: string; CdsState: TUpdateStatus; Accept: boolean);
begin
  inherited;
  if (Accept) and (sTableName = 'IMAGENS') and (CdsState = usInserted) then
  begin
    FCdsEtapas.Locate('IDIMAGEM', aCds.FieldByName('IDIMAGEM').asString, []);
    FCdsEtapas.Edit;
    FCdsEtapas.FieldByName('IDIMAGEM').asFloat := FDbImagens.IdImagem.asFloat;
    FCdsEtapas.Post;
  end;
end;

function TCtrlEtapaProcesso.GravarEtapaProcesso(GravarImagens, GravarHonorarios: boolean): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarEtapaProcesso(FIdEmpresa, FIdHotel,
      FUsuXFilial, FUsuXCCusto, FIdUsuarioGeral, GravarImagens, GravarHonorarios,
      FCdsProcesso.Data, FCdsEtapas.Data, FCdsImagens.Data, FCdsHonorarios.Data,
      FCdsImovel.Data, FCdsEventoImovel.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    FCdsEtapas.DisableControls;
    try
      StartTransaction;

      Result := ApplyCds(FCdsProcesso, FDbProcesso, [], []);
      if not(Result) then
        raise Exception.Create(FDbProcesso.MessageInfo);

      if (GravarImagens) then
      begin
        Result := ApplyCds(FCdsImagens, FDbImagens, [], []);
        if not(Result) then
          raise Exception.Create(FDbImagens.MessageInfo);
      end;

      Result := ApplyCds(FCdsEtapas, FDbEtapas,
        [FDbProcesso.NumProcTrab], [FDbEtapas.NumProcTrab]);
      if not(Result) then
        raise Exception.Create(FDbEtapas.MessageInfo);

      if (GravarHonorarios) then
      begin
        Result := ApplyCds(FCdsHonorarios, FDbHonorarios, [], []);
        if not(Result) then
          raise Exception.Create(FDbHonorarios.MessageInfo);
      end;

      // Gravar Imóvel
      Result := ApplyCds(FCdsImovel, FDbImovel, [], []);
      if not(Result) then
        raise Exception.Create(FDbImovel.MessageInfo);

      // Gravar Evento Imóvel
      Result := ApplyCds(FCdsEventoImovel, FDbEventoImovel, [], []);
      if not(Result) then
        raise Exception.Create(FDbEventoImovel.MessageInfo);

      Commit;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
    FCdsEtapas.EnableControls;
  end;
end;

procedure TCtrlEtapaProcesso.IniciarIntegracao(IdModulo, IdUsuario,
  IdEspAcesso: integer; UsaPlanoPatro, ObrigaAbc, ObrigaCRespon: boolean; PlanoPrevGlobal,
  PatroGlobal: integer);
begin
  FIdModulo := IdModulo;
  FIdUsuario := IdUsuario;
  FIdEspAcesso := IdEspAcesso;
  FPortadorFormaPadrao := FCtrlBancoPortFolha.GetCodPortFormaPadrao;
  FUsaPlanoPatro := UsaPlanoPatro;
  FObrigaAbc := ObrigaAbc;
  FObrigaCRespon := ObrigaCRespon;
  FPlanoPrevGlobal := PlanoPrevGlobal;
  FPatroGlobal := PatroGlobal;
end;

procedure TCtrlEtapaProcesso.IniciarValoresContabeis;
var
  c: integer;
begin
  FCdsEtapas.DisableControls;
  FCdsEtapas.First;

  FNumEtapas_Original := FCdsEtapas.RecordCount;
  FCodEtapas_Original := VarArrayCreate([1, FNumEtapas_Original], varInteger);
  FValorEtapas_Original := VarArrayCreate([1, FNumEtapas_Original], varDouble);
  FValorHonorarios_Original := VarArrayCreate([1, FNumEtapas_Original], varDouble);
  FValorTotal_Original := 0;
  c := 0;
  while not(FCdsEtapas.EOF) do
  begin
    Inc(c);
    FCodEtapas_Original[c] := FCdsEtapas.FieldByName('NUMSEQ').asInteger;
    FValorEtapas_Original[c] := FCdsEtapas.FieldByName('VALORREC').asFloat;
    FValorHonorarios_Original[c] := FCdsEtapas.FieldByName('VALORHONOR').asFloat;
    FValorTotal_Original := FValorTotal_Original + FValorEtapas_Original[c] + FValorHonorarios_Original[c];
    FCdsEtapas.Next;
  end;
  FCdsEtapas.First;
  FCdsEtapas.EnableControls;
end;

procedure TCtrlEtapaProcesso.IniciarValoresContabeisAppServer(NumEtapas_Original: integer;
  CodEtapas_Original: OleVariant; ValorEtapas_Original: OleVariant; ValorHonorarios_Original: OleVariant;
  ValorTotal_Original: double);
begin
  FNumEtapas_Original := NumEtapas_Original;
  FCodEtapas_Original := CodEtapas_Original;
  FValorEtapas_Original := ValorEtapas_Original;
  FValorHonorarios_Original := ValorHonorarios_Original;
  FValorTotal_Original := ValorTotal_Original;
end;

procedure TCtrlEtapaProcesso.GetDiferencaValorIntegra(var ValEtapa, ValHonor: double);
var
  c: byte;
begin
  ValEtapa := FCdsEtapas.FieldByName('VALORREC').asFloat;
  ValHonor := FCdsEtapas.FieldByName('VALORHONOR').asFloat;
  if (FValorTotal_Original > 0) then
    for c:=1 to FNumEtapas_Original do
      if (FCdsEtapas.FieldByName('NUMSEQ').asInteger = FCodEtapas_Original[c]) then
      begin
        ValEtapa := ValEtapa - FValorEtapas_Original[c];
        ValHonor := ValHonor - FValorHonorarios_Original[c];
        break;
      end;
end;

procedure TCtrlEtapaProcesso.AtualizarTotalDespesas(ValorDespesa: double);
begin
  FCdsProcesso.FieldByName('DESPESAPROC').asFloat :=
    FCdsProcesso.FieldByName('DESPESAPROC').asFloat + ValorDespesa;
end;

function TCtrlEtapaProcesso.GerarIntegracao(const IAppCliente: OleVariant; FazCAP,
  FazContab: boolean; DataEmissao, DataPagamento: TDateTime; IdFavorecido, IdPlanoPrev,
  IdPatro: integer; PlaConta: string; Plano: integer; PlaContaCredito, TipoOperacao,
  CodTipRecDes: string; CodTipDoc: integer): boolean;
var
  c: byte;
  sDescricaoLancamento: string;
  dValDepois: array [1..2] of double; // 1º -> Valor da Etapa, 2º -> Valor do Honorário
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GerarIntegracaoEtapaProcTrab(IAppCliente,
      FIdModulo, FIdUsuario, FIdEmpresa, FIdHotel, FUsaPlanoPatro, FUsuXFilial, FUsuXCCusto,
      FIdUsuarioGeral, FazCAP, FazContab, DataEmissao, DataPagamento, IdFavorecido,
      IdPlanoPrev, IdPatro, Plano, PlaConta, PlaContaCredito, TipoOperacao,
      CodTipRecDes, CodTipDoc, FIdEspAcesso, FObrigaAbc, FObrigaCRespon,
      FPlanoPrevGlobal, FPatroGlobal, FCdsProcesso.Data, FCdsEtapas.Data,
      FNumEtapas_Original, FCodEtapas_Original, FValorEtapas_Original,
      FValorHonorarios_Original, FValorTotal_Original);
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := true;

    FCodTipRecDes := CodTipRecDes;
    FListaNumDocCAP := '';
    FListaPlnCodigo := '';

    try
      if (FazCAP) then
      begin
        FCdsDocumentos := TCMClientDataSet.Create(nil);

        FDataEmissao := DataEmissao;

        FCtrlIntegraCAPCAR_RH.CdsDocumentos := FCdsDocumentos;
        FCtrlIntegraCAPCAR_RH.ObrigaAbc := FObrigaAbc;
        FCtrlIntegraCAPCAR_RH.ObrigaCRespon := FObrigaCRespon;
        FCtrlIntegraCAPCAR_RH.IdEmpresa := FIdEmpresa;
        FCtrlIntegraCAPCAR_RH.IdModulo := FIdModulo;
        FCtrlIntegraCAPCAR_RH.IdUsuario := FIdUsuario;
        FCtrlIntegraCAPCAR_RH.CodTipDoc := CodTipDoc;

        if not(FCtrlIntegraCAPCAR_RH.AbrirQueryDocumentos) then
          raise Exception.Create(FCtrlIntegraCAPCAR_RH.MessageInfo);
      end;

      FCdsEtapas.DisableControls;
      FCdsEtapas.First;
      try
        StartTransaction;

         // Enviar mensagem ao cliente
        try
          IAppCliente.GerarIntegracaoProcesso_CB;
        except
        end;

        while not(FCdsEtapas.EOF) do
        begin
          // Calcular o Valor a integrar pela diferença entre o Valor da Etapa e Honorário
          // antes de ser gravado pelo Valor atual (mudado pelo usuário).
          GetDiferencaValorIntegra(dValDepois[1], dValDepois[2]);

          if ((FazCAP) and (dValDepois[1] > 0)) or
             ((FazContab) and (dValDepois[2] <> 0)) then
          begin
            for c:=1 to 2 do
            begin
              case (c) of
                1 : // Etapas
                begin
                  FIdFavorecido := IdFavorecido;
                  sDescricaoLancamento := Copy(Trim(FCdsEtapas.FieldByName('ETAPA').asString),1,40);
                end;
                2 : // Honorários
                begin
                  FIdFavorecido := FCdsProcesso.FieldByName('IDADVOGRECDA').asInteger;
                  sDescricaoLancamento := Copy(('Honorários Relativos ao Processo ')+
                    FCdsProcesso.FieldByName('PROCJCJNUM').asString,1,40);
                end;
              end;

              if (FIdFavorecido <= 0) then
                continue;

              if (FazCAP) and (dValDepois[c] > 0) then
                if not(GerarIntegracaoCAP(dValDepois[c], DataPagamento)) then
                  raise Exception.Create(MessageInfo);

              if (FazContab) and (dValDepois[c] <> 0) then
                if not(GerarIntegracaoContabil(dValDepois[c], IdPlanoPrev,
                  IdPatro, PlaConta, Plano, PlaContaCredito, TipoOperacao,
                  sDescricaoLancamento)) then
                begin
                  raise Exception.Create(MessageInfo);
                end;
            end;
          end;
          FCdsEtapas.Next;

          // Enviar mensagem ao cliente
          try
            IAppCliente.GerarIntegracaoProcesso_CB;
          except
          end;
        end;

        Commit;

        // Enviar mensagem ao cliente
        try
          IAppCliente.GerarIntegracaoProcesso_CB;
        except
        end;

        // Criação das mensagens de término do processo de integração
        if (FazCAP) then
        begin
          if (FListaNumDocCAP <> '') then
            MessageInfo :=
              ('Contas a Pagar gerada com sucesso.') +CR_LF+
              ('Documento(s) Nº.: ') +FListaNumDocCAP
          else
          MessageInfo := ('Contas a Pagar não foi feita.');
        end;

        if (FazContab) then
        begin
          if (MessageInfo <> '') then
            MessageInfo := MessageInfo +CR_LF+CR_LF;

          if (FListaPlnCodigo <> '') then
            MessageInfo := MessageInfo +
              ('Contabilização gerada com sucesso.') +CR_LF+
              ('Planilha(s) Nº.: ') + FListaPlnCodigo
          else
            MessageInfo := MessageInfo + ('Contabilidade não foi feita.');
        end;
      except
        on E: Exception do
        begin
          Rollback;
          Result := false;
          MessageInfo := E.Message;
        end;
      end;

      FCdsEtapas.First;
      FCdsEtapas.EnableControls;

      if (FazCAP) then
        FCdsDocumentos.Free;
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;

    // A nova situação passa a ser a "anterior", caso o usuário faça nova atualização
    IniciarValoresContabeis;
  end;
end;

function TCtrlEtapaProcesso.GerarIntegracaoRateioDespesas(FazCAP, FazContab: boolean; DataEmissao,
  DataPagamento: TDate; IdFavorecido, IdPlanoPrev, IdPatro: integer; PlaConta: string;
  Plano: integer; PlaContaCredito, TipoOperacao, CodTipRecDes: string; CodTipDoc: integer;
  DescricaoLancamento: string; Valor: double): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GerarIntegracao(FazCAP, FazContab, DataEmissao,
      DataPagamento, IdFavorecido, IdPlanoPrev, IdPatro, PlaConta, Plano, PlaContaCredito,
      TipoOperacao, CodTipRecDes, CodTipDoc, DescricaoLancamento);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := true;
    FCodTipRecDes := CodTipRecDes;
    FListaNumDocCAP := '';
    FListaPlnCodigo := '';

    try
      if (FazCAP) then
      begin
        FCdsDocumentos := TCMClientDataSet.Create(nil);

        FDataEmissao := DataEmissao;

        FCtrlIntegraCAPCAR_RH.CdsDocumentos := FCdsDocumentos;
        FCtrlIntegraCAPCAR_RH.ObrigaAbc := FObrigaAbc;
        FCtrlIntegraCAPCAR_RH.ObrigaCRespon := FObrigaCRespon;
        FCtrlIntegraCAPCAR_RH.IdEmpresa := FIdEmpresa;
        FCtrlIntegraCAPCAR_RH.IdModulo := FIdModulo;
        FCtrlIntegraCAPCAR_RH.IdUsuario := FIdUsuario;
        FCtrlIntegraCAPCAR_RH.CodTipDoc := CodTipDoc;

        if not(FCtrlIntegraCAPCAR_RH.AbrirQueryDocumentos) then
          raise Exception.Create(FCtrlIntegraCAPCAR_RH.MessageInfo);
      end;

      try
        StartTransaction;

        if ((FazCAP) and (Valor > 0)) or
           ((FazContab) and (Valor <> 0)) then
        begin
          FIdFavorecido := IdFavorecido;
          if (FazCAP) and (Valor > 0) then
            if not(GerarIntegracaoCAP(Valor, DataPagamento)) then
              raise Exception.Create(MessageInfo);

          if (FazContab) and (Valor <> 0) then
            if not(GerarIntegracaoContabil(Valor, IdPlanoPrev,
              IdPatro, PlaConta, Plano, PlaContaCredito, TipoOperacao,
              DescricaoLancamento)) then
            begin
              raise Exception.Create(MessageInfo);
            end;
        end;

        Commit;

        // Criação das mensagens de término do processo de integração
        if (FazCAP) then
        begin
          if (FListaNumDocCAP <> '') then
            MessageInfo :=
              ('Contas a Pagar gerada com sucesso.') +CR_LF+
              ('Documento(s) Nº.: ') +FListaNumDocCAP
          else
            MessageInfo := ('Contas a Pagar não foi feita.');
        end;

        if (FazContab) then
        begin
          if (MessageInfo <> '') then
            MessageInfo := MessageInfo +CR_LF+CR_LF;

          if (FListaPlnCodigo <> '') then
            MessageInfo := MessageInfo +
              ('Contabilização gerada com sucesso.') +CR_LF+
              ('Planilha(s) Nº.: ') + FListaPlnCodigo
          else
            MessageInfo := MessageInfo +
              ('Contabilidade não foi feita.');
        end;
      except
        on E: Exception do
        begin
          Rollback;
          Result := false;
          MessageInfo := E.Message;
        end;
      end;

      if (FazCAP) then
        FCdsDocumentos.Free;
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlEtapaProcesso.GerarIntegracaoCAP(Valor: double; DataPag: TDate): boolean;
var
  bErro: boolean;
begin
  try
    bErro := not(GerarCAP(Valor));
    if not(bErro) then
    begin
      // Gravar no Banco os Documentos
      if not(FCtrlIntegraCAPCAR_RH.GravarDocumentos(
             FDataEmissao, DataPag, false,
             FUsaPlanoPatro, FPlanoPrevGlobal, FPatroGlobal)) then
      begin
        raise Exception.Create(FCtrlIntegraCAPCAR_RH.MessageInfo);
      end;

      FCdsDocumentos.EmptyDataSet;
    end;
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      bErro := true;
    end;
  end;

  if (bErro) then
    MessageInfo := ('Contas a Pagar Não Efetuada.') +CR_LF+CR_LF+ MessageInfo
  else
  begin
    if (FListaNumDocCAP = '') then
      FListaNumDocCAP := FCtrlIntegraCAPCAR_RH.NumDocGerados
    else
      FListaNumDocCAP := FListaNumDocCAP +','+ FCtrlIntegraCAPCAR_RH.NumDocGerados;
  end;

  Result := not(bErro);
end;

function TCtrlEtapaProcesso.GerarIntegracaoContabil(Valor: double; IdPlanoPrev, IdPatro: integer;
  PlaConta: string; Plano: integer; PlaContaCredito, TipoOperacao, DescricaoLancamento: string): boolean;
var
  _CdsAux: TCmClientDataSet;
  bErro: boolean;
  dPlnCodigo, IdPlano, dCodSubConta: double;
  sPlnCodigo, sDataEmissao, sContaDebito, sContaCredito: string;
begin
  Result := false;
  try
    _CdsAux := TCmClientDataSet.Create(nil);

    bErro := false;
    dPlnCodigo := 0;
    try
      // Implementar Lançamento na Contabilidade
      dCodSubConta := 0;
      _CdsAux.Data := FCtrlListTerceirosRH.ListEmpresaForn(FIdEmpresa, FIdFavorecido);

      if (_CdsAux.FieldByName('CONTACDESPESA').asString = '') then
      begin
        sContaDebito := PlaConta;
        IdPlano := Plano;
      end
      else
      begin
        sContaDebito := _CdsAux.FieldByName('CONTACDESPESA').asString;
        IdPlano := _CdsAux.FieldByName('PLANO').asInteger;
        dCodSubConta := _CdsAux.FieldByName('CODSUBCONTA').asFloat;
      end;

      sContaCredito := PlaContaCredito;
      if (sContaCredito = '') then
        sContaCredito := _CdsAux.FieldByName('CONTACFORN').asString;

      // Gravar o Lançamento na Contabilidade
      if (sContaDebito <> '') and (sContaCredito <> '') then
      begin
        sDataEmissao := DateToStr(FDataEmissao);
        if (FCtrlLancamento.InsereLancaContab(
            '2', // Tipo do Lançamento (0 - Débito; 1 - Crédito; 2 - Partida Dobrada)
            FIdEmpresa, // Empresa
            FIdModulo, // Módulo de Origem
            FIdUsuario, // Usuário Ativo
            IdPlano, // Plano de Contas
            -1, // Unidade de Negócio
            dCodSubConta, // Sub-Conta de Debito
            dCodSubConta, // Sub-Conta de Crédito
            IdPlanoPrev, // ID do Plano Previdenciário
            IdPatro, // ID da Patrocinadora
            dPlnCodigo, // Número da Planilha
            0, // Número do Lançamento
            sDataEmissao, // Data do Lançamento
            Copy(sDataEmissao,7,4) + Copy(sDataEmissao,3,3), // Número do Documento
            DescricaoLancamento, // 1ª Linha da Histórico
            '', // 2ª Linha da Histórico
            Copy(sDataEmissao,7,4) + Copy(sDataEmissao,3,3), // 3ª Linha da Histórico
            '', // 4ª Linha da Histórico
            '', // 5ª Linha da Histórico
            TipoOperacao, // Tipo de Operação Indicado
            '', // Centro de Custo para Débito
            sContaDebito, // Conta para Débito
            '', // Centro de Custo para Crédito
            sContaCredito, // Conta para Crédito
            '', // Código do Histórico Padrão
            Valor, // Valor a ser Lançado
            false, // Indica se os Lançamentos devem ser unidos em uma mesma Planilha
            FUsaPlanoPatro // Indica se usa Plano da Patrocinadora
          )) then
          dPlnCodigo := FCtrlLancamento.RetornoPlnCodigo
        else
          raise Exception.Create(FCtrlLancamento.MessageInfo);
      end;
    except
      on E: Exception do
      begin
        MessageInfo := E.Message;
        bErro := true;
      end;
    end;

    if (bErro) then
      MessageInfo := ('Contabilização Não Efetuada.') +CR_LF+CR_LF+ MessageInfo
    else
    if (dPlnCodigo > 0) then
    begin
      sPlnCodigo := FloatToStr(FCtrlListTerceirosRH.GetNumeroPlanilha(dPlnCodigo));
      if (FListaPlnCodigo = '') then
        FListaPlnCodigo := sPlnCodigo
      else
        FListaPlnCodigo := FListaPlnCodigo +','+ sPlnCodigo;
    end;

    Result := not(bErro);
  finally
    FreeAndNil(_CdsAux);
  end;
end;

function TCtrlEtapaProcesso.GerarCAP(Valor: double): boolean;
begin
  try
    // Guardo o valor da Rubrica
    if not(FCtrlIntegraCAPCAR_RH.SetDadosDocumento(
           FIdFavorecido, FPortadorFormaPadrao, 'P', FCodTipRecDes,
           UNIDNEGOC_PADRAO, '', CODCENTRORESPON_PADRAO, Valor)) then
    begin
      raise Exception.Create(FCtrlIntegraCAPCAR_RH.MessageInfo);
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

function TCtrlEtapaProcesso.AtualizarImovel(IdImovel: double; Inicio: boolean): boolean;
begin
  try
    Result := FCdsImovel.Locate('IDIMOVEL', IdImovel, []);
    if (Result) then
    begin
      FCdsImovel.Edit;
      if (Inicio) then
        FCdsImovel.FieldByName('FLGSTATUS').asString := 'P'
      else
        FCdsImovel.FieldByName('FLGSTATUS').asString := 'N';
      FCdsImovel.Post;
    end;
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
end;

function TCtrlEtapaProcesso.InserirEventoImovel(IdImovel: double; EviData: TDate;
  Inicio: boolean; EviDescricao: string; EviPercent, EviVlrAjustado: double): boolean;
begin
  try
    FCdsEventoImovel.Insert;
    FCdsEventoImovel.FieldByName('IDEVENTOIMOVEL').asFloat := GetSequence('IMOVEL');
    FCdsEventoImovel.FieldByName('IDIMOVEL').asFloat := IdImovel;
    FCdsEventoImovel.FieldByName('EVIDATA').asDateTime := EviData;
    FCdsEventoImovel.FieldByName('EVIDESCRICAO').asString := EviDescricao;
    FCdsEventoImovel.FieldByName('FLGTIPOEVENTO').asString := 'PE';
    FCdsEventoImovel.FieldByName('EVIPERCENT').asFloat := EviPercent;
    FCdsEventoImovel.FieldByName('EVIVLRAJUSTADO').asFloat := EviVlrAjustado;
    if (Inicio) then
      FCdsEventoImovel.FieldByName('EVICABECALHO').asString := ('Início de Penhora')
    else
      FCdsEventoImovel.FieldByName('EVICABECALHO').asString := ('Término de Penhora');
    FCdsEventoImovel.Post;

    Result := true;
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
end;

end.
