{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 28/11/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlHonorarioProcesso;

interface

uses SysUtils, Controls, Db, DbClient, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlLancamento, uCtrlDocumento, uCtrlIntegraRH, uCtrlCustomRH, uCtrlListTerceirosRH,
  uCtrlBancoPortFolha, uDbProcessoTrab, uDbHonorarios;

type
  TCtrlHonorarioProcesso = class(TCtrlCustomRH)
  protected
    FCtrlLancamento: TCtrlLancamento;
    FCtrlDocumento: TCtrlDocumento;
    FCtrlListTerceirosRH: TCtrlListTerceirosRH;
    FCtrlBancoPortFolha: TCtrlBancoPortFolha;
    FCtrlIntegraRH: TCtrlIntegraRH;

    FCdsDocumentos: TCMClientDataSet;

    FObrigaAbc: boolean;
    FObrigaCRespon: boolean;
    FUsaPlanoPatro: boolean;

    FValorTotalAntes: double;

    FIdPlano: integer;
    FPortadorFormaPadrao: integer;
    FIdModulo: integer;
    FIdUsuario: integer;
    FIdEspAcesso: integer;
    FIdEmpresa: integer;
    FNumReg: integer;
    FIdFavorecido: integer;
    FPlanoPrevGlobal: integer;
    FPatroGlobal: integer;

    FCodFavor: variant;
    FValorAntes: variant;
    FDataHonor: variant;

    FCodTipRecDes: string;
    FListaNumDocCAP: string;
    FListaPlnCodigo: string;

    FDataEmissao: TDate;

    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  private
    FDbProcesso: TDbProcessoTrab;
    FDbHonorarios: TDbHonorarios;

    FCdsProcesso: TCMClientDataSet;
    FCdsHonorarios: TCMClientDataSet;

    function  GetDiferencaValorHonor: double;

    function  GerarIntegracaoCAP(Valor: double): boolean;
    function  GerarIntegracaoContabil(Valor: double; IdPlanoPrev, IdPatro: integer;
      PlaConta: string; PlaContaCredito, TipoOperacao: string): boolean;
    function  GerarCAP(Valor: double): boolean;
  public
    constructor Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce;
    destructor  Destroy; override;

    // Métodos de execução de Querys
    function ListHonorario(NumProcTrab: double; IdFavorecido: double = 0;
      DataPagamento: TDate = 0): OleVariant;
    function ListTabHonorarioEmBranco: OleVariant;

    // Gravação dos Honorários
    function GravarHonorarioProcesso: boolean;

    // Inicializa variáveis usadas na integração
    procedure IniciarIntegracao(IdEmpresa, IdModulo, IdUsuario, IdEspAcesso: integer;
      UsaPlanoPatro, ObrigaAbc, ObrigaCRespon: boolean; PlanoPrevGlobal, PatroGlobal: integer);

    procedure IniciarValoresContabeis;
    // Atualiza Total de Despesas de acordo com a Despesa informada
    procedure AtualizarTotalDespesas(ValorDespesa: double);

    // Faz a geração da integração com a Contabilidade e/ou CAP
    function  GerarIntegracao(FazCAP, FazContab: boolean; DataEmissao, DataPagamento: TDate;
      IdPlanoPrev, IdPatro: integer; PlaConta: string; Plano: integer; PlaContaCredito,
      TipoOperacao, CodTipRecDes: string; CodTipDoc: integer): boolean;

    property CdsHonorarios: TCMClientDataSet read FCdsHonorarios write FCdsHonorarios;
    property CdsProcesso: TCMClientDataSet read FCdsProcesso write FCdsProcesso;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlHonorarioProcesso }

constructor TCtrlHonorarioProcesso.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  FDbProcesso := TDbProcessoTrab.Create(Self);
  FDbHonorarios := TDbHonorarios.Create(Self);

  FCtrlLancamento := TCtrlLancamento.Create;
  FCtrlDocumento := TCtrlDocumento.Create;
  FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCtrlBancoPortFolha := TCtrlBancoPortFolha.Create;
  FCtrlIntegraRH := TCtrlIntegraRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FCtrlLancamento.OpenTransaction := false;
  FCtrlDocumento.OpenTransaction := false;

  inherited Create;
end;

destructor TCtrlHonorarioProcesso.Destroy;
begin
  FDbProcesso.Free;
  FDbHonorarios.Free;

  FCtrlLancamento.Free;
  FCtrlDocumento.Free;
  FCtrlListTerceirosRH.Free;
  FCtrlBancoPortFolha.Free;
  FCtrlIntegraRH.Free;
  if (IsAppServer) then
  begin
    FCdsProcesso.Free;
    FCdsHonorarios.Free;
  end;
  inherited;
end;

procedure TCtrlHonorarioProcesso.AfterInitialize;
begin
  inherited;
  FCtrlLancamento.InitializeAs(Self);
  FCtrlDocumento.InitializeAs(Self);
  FCtrlListTerceirosRH.InitializeAs(Self);
  FCtrlBancoPortFolha.InitializeAs(Self);
  FCtrlIntegraRH.InitializeAs(Self);
end;

procedure TCtrlHonorarioProcesso.OnCreateAppServer;
begin
  inherited;
  FCdsProcesso := TCMClientDataSet.Create(nil);
  FCdsHonorarios := TCMClientDataSet.Create(nil);
end;

procedure TCtrlHonorarioProcesso.DoChangeDataBase;
begin
  inherited;
  FDbProcesso.DataBaseName := DataBaseName;
  FDbHonorarios.DataBaseName := DataBaseName;

  FCtrlDocumento.DataBase := DataBase;
  FCtrlBancoPortFolha.DataBase := DataBase;
  FCtrlIntegraRH.DataBase := DataBase;
end;

function TCtrlHonorarioProcesso.ListHonorario(NumProcTrab, IdFavorecido: double;
  DataPagamento: TDate): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  H.NUMPROCTRAB, H.DATAPAGTOHONOR, H.IDFORNSERV, H.VALORHONOR, H.INDHONOR,'+CR_LF+
    '  H.FLGPROVISAO, P.NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P, HONORARIOS H'+CR_LF+
    'WHERE'+CR_LF+
    '  (H.NUMPROCTRAB = ' +FloatToStr(NumProcTrab)+ ') AND'+CR_LF+
    IFF(IdFavorecido=0, '', '  (H.IDFORNSERV  = ' +FloatToStr(IdFavorecido)+ ') AND'+CR_LF)+
    IFF(DataPagamento=0, '', '  (H.DATAPAGTOHONOR = TO_DATE(' +
      QuotedStr(DateToStr(DataPagamento))+ ',''DD/MM/YYYY'')) AND'+CR_LF)+
    '  (H.IDFORNSERV  = P.IDPESSOA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  H.NUMPROCTRAB, H.DATAPAGTOHONOR, H.IDFORNSERV');
end;

function TCtrlHonorarioProcesso.ListTabHonorarioEmBranco: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  0 AS NUMPROCTRAB, SYSDATE AS DATAPAGTOHONOR, 0 AS IDFORNSERV,'+CR_LF+
    '  0 AS VALORHONOR, 0 AS NUMSEQ'+CR_LF+
    'FROM'+CR_LF+
    '  DUAL');
end;

function TCtrlHonorarioProcesso.GravarHonorarioProcesso: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarHonorarioProcesso(FCdsProcesso.Data,
      FCdsHonorarios.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsProcesso, FDbProcesso, [], []);
      if not(Result) then
        raise Exception.Create(FDbProcesso.MessageInfo);

      Result := ApplyCds(FCdsHonorarios, FDbHonorarios,
        [FDbProcesso.NumProcTrab], [FDbHonorarios.NumProcTrab], true);
      if not(Result) then
        raise Exception.Create(FDbHonorarios.MessageInfo);

      Commit;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

procedure TCtrlHonorarioProcesso.IniciarIntegracao(IdEmpresa, IdModulo, IdUsuario,
  IdEspAcesso: integer; UsaPlanoPatro, ObrigaAbc, ObrigaCRespon: boolean; PlanoPrevGlobal,
  PatroGlobal: integer);
begin
  FIdEmpresa := IdEmpresa;
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

procedure TCtrlHonorarioProcesso.IniciarValoresContabeis;
var
  c: integer;
begin
  FCdsHonorarios.DisableControls;
  FCdsHonorarios.First;

  FNumReg := FCdsHonorarios.RecordCount;
  FCodFavor := VarArrayCreate([1, FNumReg], varInteger);
  FValorAntes := VarArrayCreate([1, FNumReg], varDouble);
  FDataHonor := VarArrayCreate([1, FNumReg], varDate);
  FValorTotalAntes := 0;
  c := 0;
  while not(FCdsHonorarios.EOF) do
  begin
    Inc(c);
    FCodFavor[c] := FCdsHonorarios.FieldByName('IDFORNSERV').asInteger;
    FValorAntes[c] := FCdsHonorarios.FieldByName('VALORHONOR').asFloat;
    FDataHonor[c] := FCdsHonorarios.FieldByName('DATAPAGTOHONOR').asDateTime;
    FValorTotalAntes := FValorTotalAntes + FValorAntes[c];
    FCdsHonorarios.Next;
  end;
  FCdsHonorarios.First;
  FCdsHonorarios.EnableControls;
end;

function TCtrlHonorarioProcesso.GetDiferencaValorHonor: double;
var
  c: byte;
begin
  Result := FCdsHonorarios.FieldByName('VALORHONOR').asFloat;
  if (FValorTotalAntes > 0) then
    for c:=1 to FNumReg do
      if (FCdsHonorarios.FieldByName('IDFORNSERV').asInteger = FCodFavor[c]) and
         (FCdsHonorarios.FieldByName('DATAPAGTOHONOR').asDateTime = FDataHonor[c]) then
      begin
        Result := Result - FValorAntes[c];
        break;
      end;
end;

procedure TCtrlHonorarioProcesso.AtualizarTotalDespesas(ValorDespesa: double);
begin
  FCdsProcesso.FieldByName('DESPESAPROC').asFloat :=
    FCdsProcesso.FieldByName('DESPESAPROC').asFloat + ValorDespesa;
end;

function TCtrlHonorarioProcesso.GerarIntegracao(FazCAP, FazContab: boolean; DataEmissao,
  DataPagamento: TDate; IdPlanoPrev, IdPatro: integer; PlaConta: string; Plano: integer;
  PlaContaCredito, TipoOperacao, CodTipRecDes: string; CodTipDoc: integer): boolean;
var
  dValorDepois: double;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GerarIntegracao(FazCAP, FazContab, DataEmissao,
      DataPagamento, IdPlanoPrev, IdPatro, PlaConta, Plano, PlaContaCredito, TipoOperacao,
      CodTipRecDes, CodTipDoc);
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := true;
    FCodTipRecDes := CodTipRecDes;
    FIdPlano := Plano;
    FListaNumDocCAP := '';
    FListaPlnCodigo := '';
    FDataEmissao := DataEmissao;

    try
      if (FazCAP) then
      begin
        FCdsDocumentos := TCMClientDataSet.Create(nil);

        FCtrlIntegraRH.CdsDocumentos := FCdsDocumentos;
        FCtrlIntegraRH.ObrigaAbc := FObrigaAbc;
        FCtrlIntegraRH.ObrigaCRespon := FObrigaCRespon;
        FCtrlIntegraRH.IdEmpresa := FIdEmpresa;
        FCtrlIntegraRH.IdModulo := FIdModulo;
        FCtrlIntegraRH.IdUsuario := FIdUsuario;
        FCtrlIntegraRH.CodTipDoc := CodTipDoc;

        if not(FCtrlIntegraRH.AbrirQueryDocumentos) then
          raise Exception.Create(FCtrlIntegraRH.MessageInfo);
      end;

      FCdsHonorarios.DisableControls;
      FCdsHonorarios.First;
      try
        StartTransaction;

        while not(FCdsHonorarios.EOF) do
        begin
          // Calcular o Valor a integrar pela diferença entre o Valor do Honorário
          // antes de ser gravado pelo Valor atual (mudado pelo usuário).
          dValorDepois := GetDiferencaValorHonor;

          if (FazCAP) and (dValorDepois > 0) then
            if not(GerarIntegracaoCAP(dValorDepois)) then
              raise Exception.Create(MessageInfo);

          if (FazContab) and (dValorDepois <> 0) then
            if not(GerarIntegracaoContabil(dValorDepois, IdPlanoPrev,
              IdPatro, PlaConta, PlaContaCredito, TipoOperacao)) then
            begin
              raise Exception.Create(MessageInfo);
            end;

          FCdsHonorarios.Next;
        end;

        Commit;

        // Criação das mensagens de término do processo de integração
        if (FazCAP) then
        begin
          if (FListaNumDocCAP <> '') then
            MessageInfo :=
              'Contas a Pagar gerada com sucesso.'+CR_LF+
              'Documento(s) Nº.: ' +FListaNumDocCAP
          else
            MessageInfo :=
              'Contas a Pagar não foi feita.';
        end;

        if (FazContab) then
        begin
          if (MessageInfo <> '') then
            MessageInfo := MessageInfo +CR_LF+CR_LF;

          if (FListaPlnCodigo <> '') then
            MessageInfo := MessageInfo +
              'Contabilização gerada com sucesso.'+CR_LF+
              'Planilha(s) Nº.: ' + FListaPlnCodigo
          else
            MessageInfo := MessageInfo +
              'Contabilidade não foi feita.';
        end;
      except
        on E: Exception do
        begin
          Rollback;
          Result := false;
          MessageInfo := E.Message;
        end;
      end;

      FCdsHonorarios.First;
      FCdsHonorarios.EnableControls;

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

function TCtrlHonorarioProcesso.GerarIntegracaoCAP(Valor: double): boolean;
var
  bErro: boolean;
begin
  try
    FIdFavorecido := FCdsHonorarios.FieldByName('IDFORNSERV').asInteger;
    bErro := not(GerarCAP(Valor));
    if not(bErro) then
    begin
      // Gravar no Banco os Documentos
      if not(FCtrlIntegraRH.GravarDocumentos(
          false, 0, FPortadorFormaPadrao, FDataEmissao,
          FCdsHonorarios.FieldByName('DATAPAGTOHONOR').asDateTime, false,
          FUsaPlanoPatro, FPlanoPrevGlobal, FPatroGlobal,0,'')) then
      begin
        raise Exception.Create(FCtrlIntegraRH.MessageInfo);
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
    MessageInfo := 'Contas a Pagar Não Efetuada.' +CR_LF+CR_LF+ MessageInfo
  else
  begin
    if (FListaNumDocCAP = '') then
      FListaNumDocCAP := FCtrlIntegraRH.NumDocGerados
    else
      FListaNumDocCAP := FListaNumDocCAP +','+ FCtrlIntegraRH.NumDocGerados;
  end;

  Result := not(bErro);
end;

function TCtrlHonorarioProcesso.GerarIntegracaoContabil(Valor: double; IdPlanoPrev,
  IdPatro: integer; PlaConta: string; PlaContaCredito,
  TipoOperacao: string): boolean;
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
      // Implementar o Lançamento na Contabilidade
      dCodSubConta := 0;
      _CdsAux.Data := FCtrlListTerceirosRH.ListEmpresaForn(FIdEmpresa,
        FCdsProcesso.FieldByName('IDADVOGRECDA').asFloat);

      if (_CdsAux.FieldByName('CONTACDESPESA').asString = '') then
      begin
        sContaDebito := PlaConta;
        IdPlano := FIdPlano;
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
            dCodSubConta, // Sub-Conta de Débito
            dCodSubConta, // Sub-Conta de Crédito
            IdPlanoPrev, // ID do Plano Previdenciário
            IdPatro, // ID da Patrocinadora
            dPlnCodigo, // Número da Planilha
            0, // Número do Lançamento
            sDataEmissao, // Data do Lançamento
            Copy(sDataEmissao,7,4) + Copy(sDataEmissao,3,3), // Número do Documento
            'Honorários Relativos ao Processo ', // 1ª Linha da Histórico
            FCdsProcesso.FieldByName('PROCJCJNUM').asString, // 2ª Linha da Histórico
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
      MessageInfo := 'Contabilização Não Efetuada.' +CR_LF+CR_LF+ MessageInfo
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

function TCtrlHonorarioProcesso.GerarCAP(Valor: double): boolean;
begin
  try
    // Guardo o valor da Rubrica
    if not(FCtrlIntegraRH.SetDadosDocumento(
      -1, -1, FIdPlano, -1, FPortadorFormaPadrao, FIdFavorecido,
      '', CODCENTRORESPON_PADRAO, FCodTipRecDes, 'P', 'D', Valor, 0, '', 0)) then
    begin
      raise Exception.Create(FCtrlIntegraRH.MessageInfo);
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

end.
