unit uCtrlParamTicketMagnetico;

interface

uses Classes, SysUtils, Controls, DB, DBClient, uCmControlObject, uCmDbObject, IvDictio,
  uCMTranslate, uCmClientDataSet, uCMTypes, uCtrlCustomRH, uCtrlIntegraCAPCAR_RH,
  uCtrlBancoPortFolha, uCtrlModeloArqTicket, uCtrlArqTicket_SodexhoPASS,
  uCtrlArqTicket_TicketRestaurante, uCtrlArqTicket_Policard;

type
  TOnProgTicketMagnetico = procedure (const NumReg, NumIncremento: integer) of object;

  TModeloArquivo = (tpSodexhoPASS, tpTicketRestaurante, tpPolicard);

  TParamGeracaoTicket = class
  public
    GerarAP: boolean;
    CodCliente: string;
    ListaIdEstab: string; // Estabelecimentos selecionados pelo usuário
    ListaIdFunc: string; // Pessoas selecionadas pelo usuário
    ListaSitFunc: string; // Situações Funcionais selecionadas pelo usuário
    ListaTipoContrato: string; // Tipos de Contrato selecionados pelo usuário
    DataIni: TDate;
    DataFin: TDate;
    MesDescFaltas: integer;
    AnoDescFaltas: integer;
    DescontarAfastamentos: boolean;
    DescontarFerias: boolean;
    DescontarFeriados: boolean;
    DescontarFaltas: boolean;
    QuantDiasTrab: integer;
    QuantDiasMinTrab: integer;
    ValorTicket: double;

    ModeloArquivo: TModeloArquivo;

    SodexhoPASS: TParModelo_SodexhoPASS;
    TicketRestaurante: TParModelo_TicketRestaurante;
    Policard: TParModelo_Policard;
  public
    constructor Create;
    destructor  Destroy; override;
  end;

  TCtrlParamTicketMagnetico = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  private
    FOnProgTicketMagnetico: TOnProgTicketMagnetico;

    FCtrlBancoPortFolha: TCtrlBancoPortFolha;
    FCtrlIntegraCAPCAR_RH: TCtrlIntegraCAPCAR_RH;
    FCtrlArq: TCtrlModeloArqTicket;

    FCdsPrincipal: TClientDataSet;
    FCdsCCusto_X_Val: TClientDataSet; // Valores dos vales agrupados por Centro de Custo
    FSQL: TStringList;

    FParamGeracaoTicket: TParamGeracaoTicket;
    FParModeloArqTicket: TParModeloArqTicket;

    FDadosArquivo: TStringList; // Conteúdo do arquivo

    FIdEmpresa: integer;

    FIdHotel: double;

    procedure MontarDatasFerias;

    function AbrirQueryPrincipal: boolean; // Abrir Query com os dados principais das pessoas
    function ListCCusto_X_Val_EmBranco: OleVariant;

    procedure IncProgresso(NumPessoas, Incremento: integer);
    procedure SetParametrosArqTicket;
    procedure CriarObjArqTicket;
  public
    constructor Create(IdEmpresa: integer; IdHotel: double;
      UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce;
    destructor  Destroy; override;

    // Lista a parametrização da rubrica de Vale Transporte em CONTABFOLHA
    function ListParamCAP: OleVariant;

    // Método de geração dos arquivos
    function ProcessarGeracao(Param: TParamGeracaoTicket): boolean;

    // Método de geração da Autorização de Pagamento (AP) para a compra dos Tickets
    function GerarAP_Ticket(const DataRef, DataEmissao, DataPagamento: TDate;
      const IdModulo, IdUsuario, IdFavorecido, UnidNegoc: integer; const CodCentroRespon,
      CodTipRecDes: string; const RateioCC, ObrigaAbc, ObrigaCRespon: boolean;
      const PlanoPrevGlobal, PatroGlobal, CodTipDoc: integer;
      const UsaPlanoPatro: boolean): boolean;

    property SQL: TStringList read FSQL;
    property CdsCCusto_X_Val: TClientDataSet read FCdsCCusto_X_Val write FCdsCCusto_X_Val;

    property DadosArquivo: TStringList read FDadosArquivo;
    property OnProgresso: TOnProgTicketMagnetico read FOnProgTicketMagnetico write FOnProgTicketMagnetico;
  end;

implementation

uses uCtrlFuncoesRH;

{ TParamGeracaoTicket }

constructor TParamGeracaoTicket.Create;
begin
  SodexhoPASS := TParModelo_SodexhoPASS.Create;
  TicketRestaurante := TParModelo_TicketRestaurante.Create;
  Policard := TParModelo_Policard.Create;
end;

destructor TParamGeracaoTicket.Destroy;
begin
  SodexhoPASS.Free;
  TicketRestaurante.Free;
  Policard.Free;
  inherited;
end;

{ TCtrlParamTicketMagnetico }

constructor TCtrlParamTicketMagnetico.Create(IdEmpresa: integer; IdHotel: double;
  UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;
  FCdsPrincipal := TClientDataSet.Create(nil);
  FCdsCCusto_X_Val := TClientDataSet.Create(nil);

  FSQL := TStringList.Create;

  FDadosArquivo := TStringList.Create;

  // Somente cria as classes relacionadas a integração com CAP se estiver na
  // Aplicação Servidora ou estiver no modo de execução Cliente Servidor em Duas Camadas
  if ((IsAppServer) or (ConnectionSide <> cnsClient)) then
  begin
    FCtrlBancoPortFolha := TCtrlBancoPortFolha.Create(IdEmpresa);
    FCtrlIntegraCAPCAR_RH := TCtrlIntegraCAPCAR_RH.Create(IdHotel, UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  end;

  FIdEmpresa := IdEmpresa;
  FIdHotel := IdHotel;

  if not(IsAppServer) then
    GetTempDir;
end;

destructor TCtrlParamTicketMagnetico.Destroy;
begin
  FCdsPrincipal.Free;
  FCdsCCusto_X_Val.Free;

  FSQL.Free;
  FDadosArquivo.Free;

  // Somente cria as classes relacionadas a integração com CAP se estiver na
  // Aplicação Servidora ou estiver no modo de execução Cliente Servidor em Duas Camadas
  if ((IsAppServer) or (ConnectionSide <> cnsClient)) then
  begin
    FCtrlBancoPortFolha.Free;
    FCtrlIntegraCAPCAR_RH.Free;
  end;
  inherited;
end;

procedure TCtrlParamTicketMagnetico.AfterInitialize;
begin
  inherited;
  // Somente cria as classes relacionadas a integração com CAP se estiver na
  // Aplicação Servidora ou estiver no modo de execução Cliente Servidor em Duas Camadas
  if ((IsAppServer) or (ConnectionSide <> cnsClient)) then
  begin
    FCtrlBancoPortFolha.InitializeAs(Self);
    FCtrlIntegraCAPCAR_RH.InitializeAs(Self);
  end;
end;

procedure TCtrlParamTicketMagnetico.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlParamTicketMagnetico.DoChangeDataBase;
begin
  inherited;
  // Somente cria as classes relacionadas a integração com CAP se estiver na
  // Aplicação Servidora ou estiver no modo de execução Cliente Servidor em Duas Camadas
  if ((IsAppServer) or (ConnectionSide <> cnsClient)) then
  begin
    FCtrlBancoPortFolha.DataBaseName := DataBaseName;
    FCtrlIntegraCAPCAR_RH.DataBaseName := DataBaseName;
  end;
end;

procedure TCtrlParamTicketMagnetico.MontarDatasFerias;
begin
  FCdsPrincipal.First;
  while not(FCdsPrincipal.EOF) do
  begin
    FCdsPrincipal.Edit;

    if not(FCdsPrincipal.FieldByName('INICIOFERIAS').IsNull) then
      if (FCdsPrincipal.FieldByName('INICIOFERIAS').asDateTime < FParamGeracaoTicket.DataIni) then
        FCdsPrincipal.FieldByName('INICIOFERIAS').asDateTime := FParamGeracaoTicket.DataIni;

    if not(FCdsPrincipal.FieldByName('FIMFERIAS').IsNull) then
      if (FCdsPrincipal.FieldByName('FIMFERIAS').asDateTime > FParamGeracaoTicket.DataFin) then
        FCdsPrincipal.FieldByName('FIMFERIAS').asDateTime := FParamGeracaoTicket.DataFin;

    FCdsPrincipal.Post;
    FCdsPrincipal.Next;
  end;
  FCdsPrincipal.First;
end;

function TCtrlParamTicketMagnetico.AbrirQueryPrincipal: boolean;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  PJ.NOME AS NOME_ESTAB,');
    Add('  PJ.IDPESSOA AS IDESTAB,');
    Add('  PJ.NUMDOCUMENTO AS INSCR_ESTAB,');
    Add('  F.IDPESSOA,');
    Add('  F.MATRICULA,');
    Add('  CC.CODCENTROCUSTO AS COD_CCUSTO,');
    Add('  CC.NOME AS NOME_CCUSTO,');
    Add('  PF.NOME,');
    Add('  DOC_CPF.NUM AS CPF,');
    Add('  DOC_RG.NUM AS RG,');
    Add('  PFIS.SEXO,');
    Add('  PFIS.DATANASC,');
    Add('  PFIS.NOMEPAI,');
    Add('  PFIS.NOMEMAE,');
    Add('  PFFERIAS.INIGOZOFERIAS AS INICIOFERIAS,');
    Add('  PFFERIAS.FIMGOZOFERIAS AS FIMFERIAS,');
    Add('  C.TITULO AS CARGO,');
    Add('  NVL(EXTRA.DIASEXTRAS,0) AS NUM_DIAS_EXTRAS,');
    Add('  0 AS NUM_DIAS_TRAB,');
    Add('  0 AS QUANT_TICKETS,');
    Add('  0.00 AS VALOR_COMPRA');
    // ---------------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, PESSOAFISICA PFIS, CARGO C, CENTCUST CC,');
    // ---------------------------------------------------------------------------- //
    // Seleção dos empregados
    Add('  (SELECT F.*');
    Add('   FROM');
    Add('     FUNCIONARIO F, SITFUNC SF');
    Add('   WHERE');

    if (FParamGeracaoTicket.ListaIdFunc <> '') then
      Add(QuebrarListaFiltro(5, '(F.IDPESSOA    ', FParamGeracaoTicket.ListaIdFunc, 100) +' AND')
    else
    begin
      if (FParamGeracaoTicket.ListaSitFunc <> '') then
        Add(MontaLinhaSelSQL('     (SF.TIPOSIT',QuotedListaString(FParamGeracaoTicket.ListaSitFunc,','),5))
      else
        Add('     (SF.TIPOSIT      = ''A'') AND');

      Add(MontaLinhaSelSQL('     (F.TIPOCONTRATO',QuotedListaString(FParamGeracaoTicket.ListaTipoContrato,','),1));
      Add(MontaLinhaSelSQL('     (F.IDESTAB',FParamGeracaoTicket.ListaIdEstab,6));
    end;

    Add('     (SF.IDSITFUNC    = F.IDSITFUNC)) F,');
    // ---------------------------------------------------------------------------- //
    // CPF da pessoa
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CPF:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) DOC_CPF,');
    // ---------------------------------------------------------------------------- //
    // RG da pessoa
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''RG:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) DOC_RG,');
    // ---------------------------------------------------------------------------- //
    // Férias
    Add('  (SELECT FE.IDPESSOA, FE.INIGOZOFERIAS, FE.FIMGOZOFERIAS');
    Add('   FROM FERIAS FE');
    Add('   WHERE ((FE.INIGOZOFERIAS >= TO_DATE('+
      QuotedStr(DateToStr(FParamGeracaoTicket.DataIni))+',''DD/MM/YYYY'')) AND');
    Add('          (FE.INIGOZOFERIAS <= TO_DATE('+
      QuotedStr(DateToStr(FParamGeracaoTicket.DataFin))   +',''DD/MM/YYYY''))) OR');
    Add('         ((FE.FIMGOZOFERIAS >= TO_DATE('+
      QuotedStr(DateToStr(FParamGeracaoTicket.DataIni))+',''DD/MM/YYYY'')) AND');
    Add('          (FE.FIMGOZOFERIAS <= TO_DATE('+
      QuotedStr(DateToStr(FParamGeracaoTicket.DataFin))   +',''DD/MM/YYYY'')))) PFFERIAS,');
    // --------------------------------------------------------------------------------- //
    // Dias Extras de Trabalho
    Add('  (SELECT IDPESSOA, COUNT(*) AS DIASEXTRAS');
    Add('   FROM   DIAEXTRATRAB');
    Add('   WHERE  (DIATRAB >= TO_DATE('+
      QuotedStr(DateToStr(FParamGeracaoTicket.DataIni))+',''DD/MM/YYYY'')) AND');
    Add('          (DIATRAB <= TO_DATE('+
      QuotedStr(DateToStr(FParamGeracaoTicket.DataFin))+',''DD/MM/YYYY''))');
    Add('   GROUP BY IDPESSOA) EXTRA');
    // --------------------------------------------------------------------------------- //
    Add('WHERE');
    Add(MontaSelSQL('PJ.IDPESSOA',FParamGeracaoTicket.ListaIdEstab,2,5));
    Add('  (PJ.IDPESSOA      = F.IDESTAB) AND');
    Add('  (F.IDCARGO        = C.IDCARGO) AND');
    Add('  (F.IDPESSOA       = PFIS.IDPESSOA) AND');
    Add('  (F.IDPESSOA       = PF.IDPESSOA) AND');
    Add('  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDEMPRESA      = CC.IDEMPRESA) AND');
    Add('  (F.IDPESSOA       = DOC_CPF.IDPESSOA) AND');
    Add('  (F.IDPESSOA       = DOC_RG.IDPESSOA) AND');
    Add('  (PF.IDPESSOA      = PFFERIAS.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA      = EXTRA.IDPESSOA(+))');
    Add('ORDER BY');
    Add('  INSCR_ESTAB, NOME');
  end;

  if not(IsAppServer) then
    FSQL.SaveToFile(DirTempLog + '\qry.txt');
  FCdsPrincipal.Data := GetDataPacket(FSQL);
  MontarDatasFerias;
  FCdsPrincipal.Filter := '';
  FCdsPrincipal.Filtered := true;
  Result := not(FCdsPrincipal.IsEmpty);
  if not(Result) then
    FTipoRetorno := RETORNO_AVISO;
end;

function TCtrlParamTicketMagnetico.ListCCusto_X_Val_EmBranco: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  LPAD(''1'',10,''1'') AS CODCENTROCUSTO,' +CR_LF+
    '  0.00 AS VALOR' +CR_LF+
    'FROM' +CR_LF+
    '  DUAL' +CR_LF+
    'WHERE' +CR_LF+
    '  (1=2)');
end;

function TCtrlParamTicketMagnetico.ListParamCAP: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  C.CODTIPRECDES, C.IDFAVORECIDO, C.UNIDNEGOC, C.CODCENTRORESPON'+CR_LF+
    'FROM'+CR_LF+
    '  CONTABFOLHA C, PROVDESC P'+CR_LF+
    'WHERE'+CR_LF+
    '  (C.CODTIPRECDES IS NOT NULL) AND'+CR_LF+
    '  (C.IDEMPRESA     = ' +IntToStr(FIdEmpresa)+ ') AND'+CR_LF+
    '  (P.CODRUBCLT     = ''50446'') AND'+CR_LF+
    '  (P.IDPROVENTO    = C.IDPROVENTO)');
end;

procedure TCtrlParamTicketMagnetico.IncProgresso(NumPessoas, Incremento: integer);
begin
  if Assigned(OnProgresso) then
    OnProgresso(NumPessoas, Incremento);
end;

function TCtrlParamTicketMagnetico.ProcessarGeracao(Param: TParamGeracaoTicket): boolean;
var
  bOk: boolean;
begin
  FTipoRetorno := RETORNO_NORMAL;
  FParamGeracaoTicket := Param;

  if (Param.GerarAP) then
    FCdsCCusto_X_Val.Data := ListCCusto_X_Val_EmBranco;

  try
    FDadosArquivo.Clear;

    if (AbrirQueryPrincipal) then
    begin
      SetParametrosArqTicket;
      try
        CriarObjArqTicket;
        try
          FCtrlArq.InitializeAs(Self);
          FCtrlArq.DataBaseName := DataBaseName;
          FCtrlArq.CdsPrincipal := FCdsPrincipal;
          FCtrlArq.CdsCCusto_X_Val := FCdsCCusto_X_Val;
          FCtrlArq.IncProgresso := IncProgresso;

          bOk := FCtrlArq.ProcessarGeracao;
          FTipoRetorno := FCtrlArq.TipoRetorno;
          if (bOk) then
            FDadosArquivo.Text := FCtrlArq.Arquivo
          else
            raise Exception.Create(FCtrlArq.MessageInfo);
        finally
          FCtrlArq.CdsPrincipal := nil;
          FreeObject(FCtrlArq, true);
        end;
      finally
        FreeObject(FParModeloArqTicket, true);
      end;
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

function TCtrlParamTicketMagnetico.GerarAP_Ticket(
  const DataRef, DataEmissao, DataPagamento: TDate; const IdModulo, IdUsuario,
  IdFavorecido, UnidNegoc: integer; const CodCentroRespon, CodTipRecDes: string;
  const RateioCC, ObrigaAbc, ObrigaCRespon: boolean; const PlanoPrevGlobal, PatroGlobal,
  CodTipDoc: integer; const UsaPlanoPatro: boolean): boolean;
var
  iPortadorFormaPadrao: integer;
  _CdsDocumentos: TClientDataSet;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GerarAP_Ticket(FIdHotel, FUsuXFilial,
      FUsuXCCusto, FIdUsuarioGeral, FIdEmpresa, DataRef, DataEmissao, DataPagamento,
      IdModulo, IdUsuario, IdFavorecido, UnidNegoc, CodCentroRespon, CodTipRecDes,
      RateioCC, ObrigaAbc, ObrigaCRespon, PlanoPrevGlobal, PatroGlobal, CodTipDoc,
      UsaPlanoPatro, FCdsCCusto_X_Val.Data);
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := true;
    _CdsDocumentos := TClientDataSet.Create(nil);
    try
      FCtrlIntegraCAPCAR_RH.CdsDocumentos := TCmClientDataSet(_CdsDocumentos);
      FCtrlIntegraCAPCAR_RH.ObrigaAbc := ObrigaAbc;
      FCtrlIntegraCAPCAR_RH.ObrigaCRespon := ObrigaCRespon;
      FCtrlIntegraCAPCAR_RH.IdEmpresa := FIdEmpresa;
      FCtrlIntegraCAPCAR_RH.IdModulo := IdModulo;
      FCtrlIntegraCAPCAR_RH.IdUsuario := IdUsuario;
      FCtrlIntegraCAPCAR_RH.CodTipDoc := CodTipDoc;

      // Portador Forma Padrão
      iPortadorFormaPadrao := FCtrlBancoPortFolha.GetCodPortFormaPadrao;

      // Montar Querys
      if not(FCtrlIntegraCAPCAR_RH.AbrirQueryDocumentos) then
        raise Exception.Create(MessageInfo);

      try
        StartTransaction;

        FCdsCCusto_X_Val.First;
        while not(FCdsCCusto_X_Val.EOF) do
        begin
          if not(FCtrlIntegraCAPCAR_RH.SetDadosDocumento(
                 IdFavorecido, iPortadorFormaPadrao, 'P', CodTipRecDes,
                 IFF(UnidNegoc<>0, UnidNegoc, UNIDNEGOC_PADRAO),
                 FCdsCCusto_X_Val.FieldByName('CODCENTROCUSTO').asString,
                 CodCentroRespon, FCdsCCusto_X_Val.FieldByName('VALOR').asFloat)) then
            raise Exception.Create(FCtrlIntegraCAPCAR_RH.MessageInfo);
          FCdsCCusto_X_Val.Next;
        end;

        // Gravar no Banco os Documentos
        if not(FCtrlIntegraCAPCAR_RH.GravarDocumentos(
               DataEmissao, DataPagamento, RateioCC,
               UsaPlanoPatro, PlanoPrevGlobal, PatroGlobal)) then
          raise Exception.Create(FCtrlIntegraCAPCAR_RH.MessageInfo);

        Commit;
        MessageInfo := CMTranslate('Contas a Pagar efetuada com sucesso.') +CR_LF+
          CMTranslate('Documento: ')+ FCtrlIntegraCAPCAR_RH.NumDocGerados;
      except
        on E: Exception do
        begin
          Rollback;
          Result := false;
          MessageInfo :=
            CMTranslate('Ocorreu um erro durante o processamento da integração.')+
            CR_LF+ CMTranslate('Erro:') +CR_LF+ E.Message;
        end;
      end;
    finally
      FreeAndNil(_CdsDocumentos);
    end;
  end;
end;

procedure TCtrlParamTicketMagnetico.SetParametrosArqTicket;
begin
  if (FParamGeracaoTicket.ModeloArquivo = tpSodexhoPASS) then
    FParModeloArqTicket := TParModelo_SodexhoPASS.Create
  else
  if (FParamGeracaoTicket.ModeloArquivo = tpTicketRestaurante) then
    FParModeloArqTicket := TParModelo_TicketRestaurante.Create
  else
  if (FParamGeracaoTicket.ModeloArquivo = tpPolicard) then
    FParModeloArqTicket := TParModelo_Policard.Create;

  // Alimentar parâmetros do objeto de geração dos Tickets
  FParModeloArqTicket.GerarAP := FParamGeracaoTicket.GerarAP;
  FParModeloArqTicket.CodCliente := FParamGeracaoTicket.CodCliente;
  FParModeloArqTicket.IdEmpresa := FIdEmpresa;
  FParModeloArqTicket.ListaIdEstab := FParamGeracaoTicket.ListaIdEstab;
  FParModeloArqTicket.DataIni := FParamGeracaoTicket.DataIni;
  FParModeloArqTicket.DataFin := FParamGeracaoTicket.DataFin;
  FParModeloArqTicket.DescontarAfastamentos := FParamGeracaoTicket.DescontarAfastamentos;
  FParModeloArqTicket.DescontarFerias := FParamGeracaoTicket.DescontarFerias;
  FParModeloArqTicket.DescontarFeriados := FParamGeracaoTicket.DescontarFeriados;
  FParModeloArqTicket.DescontarFaltas := FParamGeracaoTicket.DescontarFaltas;
  FParModeloArqTicket.QuantDiasTrab := FParamGeracaoTicket.QuantDiasTrab;
  FParModeloArqTicket.QuantDiasMinTrab := FParamGeracaoTicket.QuantDiasMinTrab;
  FParModeloArqTicket.MesDescFaltas := FParamGeracaoTicket.MesDescFaltas;
  FParModeloArqTicket.AnoDescFaltas := FParamGeracaoTicket.AnoDescFaltas;
  FParModeloArqTicket.ValorTicket := FParamGeracaoTicket.ValorTicket;

  if (FParModeloArqTicket is TParModelo_SodexhoPASS) then
  begin
    with (FParModeloArqTicket as TParModelo_SodexhoPASS) do
    begin
      TipoPedido := FParamGeracaoTicket.SodexhoPASS.TipoPedido;
      DataEntregaPedido := FParamGeracaoTicket.SodexhoPASS.DataEntregaPedido;
      DataCredito := FParamGeracaoTicket.SodexhoPASS.DataCredito;
      IdRespCentroCusto := FParamGeracaoTicket.SodexhoPASS.IdRespCentroCusto;
      IdRespReceb1 := FParamGeracaoTicket.SodexhoPASS.IdRespReceb1;
      IdRespReceb2 := FParamGeracaoTicket.SodexhoPASS.IdRespReceb2;
      IdRespReceb3 := FParamGeracaoTicket.SodexhoPASS.IdRespReceb3;
      TipoProduto := FParamGeracaoTicket.SodexhoPASS.TipoProduto;
      FormaProduto := FParamGeracaoTicket.SodexhoPASS.FormaProduto;
      MensagemLinha1 := FParamGeracaoTicket.SodexhoPASS.MensagemLinha1;
      MensagemLinha2 := FParamGeracaoTicket.SodexhoPASS.MensagemLinha2;
      QuantTaloes_Pacotao := FParamGeracaoTicket.SodexhoPASS.QuantTaloes_Pacotao;
      QuantChequesTalao_Pacotao := FParamGeracaoTicket.SodexhoPASS.QuantChequesTalao_Pacotao;
    end;
  end;

  if (FParModeloArqTicket is TParModelo_TicketRestaurante) then
  begin
    with (FParModeloArqTicket as TParModelo_TicketRestaurante) do
    begin
      ListaIdUnidEntrega := FParamGeracaoTicket.TicketRestaurante.ListaIdUnidEntrega;
      NomeUsuario := FParamGeracaoTicket.TicketRestaurante.NomeUsuario;
      TipoPoduto := FParamGeracaoTicket.TicketRestaurante.TipoPoduto;
      IdResponsavel := FParamGeracaoTicket.TicketRestaurante.IdResponsavel;
      CodUnidEntrega := FParamGeracaoTicket.TicketRestaurante.CodUnidEntrega;
      Papel.Acabamento := FParamGeracaoTicket.TicketRestaurante.Papel.Acabamento;
      Papel.Blocagem := FParamGeracaoTicket.TicketRestaurante.Papel.Blocagem;

      Papel.DataEntregaPedido := FParamGeracaoTicket.TicketRestaurante.Papel.DataEntregaPedido;
      Papel.ReceberRelatAssinaturas := FParamGeracaoTicket.TicketRestaurante.Papel.ReceberRelatAssinaturas;
      Papel.ReceberRelatGerencial := FParamGeracaoTicket.TicketRestaurante.Papel.ReceberRelatGerencial;
      Papel.ReceberRelatResUnid := FParamGeracaoTicket.TicketRestaurante.Papel.ReceberRelatResUnid;
      Papel.LinhaPersonalizacaoTicket2 := FParamGeracaoTicket.TicketRestaurante.Papel.LinhaPersonalizacaoTicket2;
      Papel.LinhaPersonalizacaoRotulo1 := FParamGeracaoTicket.TicketRestaurante.Papel.LinhaPersonalizacaoRotulo1;
      Papel.LinhaPersonalizacaoRotulo2 := FParamGeracaoTicket.TicketRestaurante.Papel.LinhaPersonalizacaoRotulo2;
      Papel.ReciboEncarte := FParamGeracaoTicket.TicketRestaurante.Papel.ReciboEncarte;

      Papel.PedidoSuplementar.Gerar := FParamGeracaoTicket.TicketRestaurante.Papel.PedidoSuplementar.Gerar;
      Papel.PedidoSuplementar.IdUnidEntrega := FParamGeracaoTicket.TicketRestaurante.Papel.PedidoSuplementar.IdUnidEntrega;
      Papel.PedidoSuplementar.Quant := FParamGeracaoTicket.TicketRestaurante.Papel.PedidoSuplementar.Quant;
      Papel.PedidoSuplementar.Acabamento := FParamGeracaoTicket.TicketRestaurante.Papel.PedidoSuplementar.Acabamento;
      Papel.PedidoSuplementar.Blocagem := FParamGeracaoTicket.TicketRestaurante.Papel.PedidoSuplementar.Blocagem;

      Eletronico.DataLiberacaoPedido := FParamGeracaoTicket.TicketRestaurante.Eletronico.DataLiberacaoPedido;
      Eletronico.TipoProduto := FParamGeracaoTicket.TicketRestaurante.Eletronico.TipoProduto;
      Eletronico.TipoCartao := FParamGeracaoTicket.TicketRestaurante.Eletronico.TipoCartao;
    end;
  end;

  if (FParModeloArqTicket is TParModelo_Policard) then
  begin
    with (FParModeloArqTicket as TParModelo_Policard) do
    begin
      ListaIdRubrica := FParamGeracaoTicket.Policard.ListaIdRubrica;
    end;
  end;
end;

procedure TCtrlParamTicketMagnetico.CriarObjArqTicket;
begin
  case (FParamGeracaoTicket.ModeloArquivo) of
    tpSodexhoPASS       : FCtrlArq :=
      TCtrlArqTicket_SodexhoPASS.Create(TParModelo_SodexhoPASS(FParModeloArqTicket));
    tpTicketRestaurante : FCtrlArq :=
      TCtrlArqTicket_TicketRestaurante.Create(TParModelo_TicketRestaurante(FParModeloArqTicket));
    else { tpPolicard }   FCtrlArq :=
      TCtrlArqTicket_Policard.Create(TParModelo_Policard(FParModeloArqTicket));
  end;
end;

end.
