// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit uCtrlParamVTMagnetico;

interface

uses Classes, SysUtils, Controls, DB, DBClient, uCMTranslate, uCmControlObject, uCmDbObject,
  IvDictio, uCmClientDataSet, uCMTypes, uCtrlCustomRH, uCtrlIntegraCAPCAR_RH,
  uCtrlBancoPortFolha, uCtrlModeloArqTransp, uCtrlModeloArqTranspCartao, uCtrlArq_ValeTransp,
  uCtrlArq_RioCard, uCtrlArq_PasseCard, uCtrlArq_VTSantos, uCtrlArq_UberlandiaCard,
  uCtrlArq_SodexhoPASS, Usistema;

const
  NUM_ARQUIVOS = 6;

type
  TOnProgVTMagnetico = procedure (const NumReg, NumIncremento: integer) of object;

  TCtrlParamVTMagnetico = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  private
    FOnProgVTMagnetico: TOnProgVTMagnetico;

    FCtrlBancoPortFolha: TCtrlBancoPortFolha;
    FCtrlIntegraCAPCAR_RH: TCtrlIntegraCAPCAR_RH;
    FCtrlArq: TCtrlModeloArqTransp;

    FCdsPrincipal: TClientDataSet;
    FCdsCCusto_X_Val: TClientDataSet; // Valores dos vales agrupados por Centro de Custo
    
    FSQL: TStringList;

    // Conteúdo dos arquivos
    FArquivo_ValeTransp: TStringList;
    FArquivo_Pedido_RioCard: TStringList;
    FArquivo_CadUsuarios_RioCard: TStringList;
    FArquivo_Pedido_PasseCard: TStringList;
    FArquivo_CadUsuarios_PasseCard: TStringList;
    FArquivo_Pedido_VTSantos: TStringList;
    FArquivo_Pedido_UberlandiaCard: TStringList;
    FArquivo_CadUsuarios_UberlandiaCard: TStringList;
    FArquivo_Pedido_SodexhoPass: TStringList;

    // Variáveis usadas somente no processo de geração da AP
    FIdEmpresa: integer;

    FDataInicial: TDate; // Período Inicial a calcular as linhas de transporte
    FDataFinal: TDate; // Período Final a calcular as linhas de transporte

    FListaIdEstab: string;
    FListaIdFunc: string;
    FListaSitFunc: string;
    FListaTipoContrato: string;
    FAnoMesRef: string;

    FIdHotel: double;

    FGerar_ValeTransp: boolean;
    FGerar_RioCard: boolean;
    FGerar_PasseCard: boolean;
    FGerar_VTSantos: boolean;
    FGerar_UberlandiaCard: boolean;
    FGerar_SodexhoPASS: boolean;

    procedure MontarDatasFerias;

    // Abrir Query com os dados principais das pessoas
    function AbrirQueryPrincipal(Ordenacao: integer): boolean;

    procedure IncProgresso(NumPessoas, Incremento: integer);
  public
    constructor Create(IdEmpresa: integer; IdHotel: double;
      UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce;
    destructor  Destroy; override;

    // Lista a parametrização da rubrica de Vale Transporte em CONTABFOLHA
    function ListParamCAP: OleVariant;

    // Método de geração dos arquivos
    function ProcessarGeracao(const GerarAP: boolean; const IdEmpresa: integer;
      const ListaIdEstab, ListaIdFunc, ListaSitFunc, ListaTipoContrato: string;
      const DataInicial, DataFinal: TDate; const MesDescFaltas, AnoDescFaltas: integer;
      const DescontarAfastamentos, DescontarFerias, DescontarFeriados,
      DescontarFaltas: boolean; const QuantDiasTrab, QuantDiasMinTrab, IdentificadorFunc,
      Ordenacao: integer; const Gerar_ValeTransp, Gerar_RioCard, Gerar_PasseCard,
      Gerar_VTSantos, Gerar_UberlandiaCard, Gerar_SodexhoPASS, GerarRegTipo3_RioCard: boolean;
      const CadUsuarios_RioCard, CadUsuarios_PasseCard, CadUsuarios_UberlandiaCard,
      CidadeRecarga_RioCard, CodRedeRecarda_RioCard: integer;
      const DataLiberacaoCarga_RioCard: TDate; const TipoEntrega_RioCard: integer;
      const NumAgenciaAntrega_RioCard: string; const CodCliente_PasseCard: double;
      const CodCliente_VTSantos, NumPedido_VTSantos: integer; const DataPedido_VTSantos,
      DataLiberacao_VTSantos: TDate; const NumDias_UberlandiaCard: array of integer;
      const Codigo_UberlandiaCard: array of string; const CodCliente_SodexhoPass: string;
      const NumPedido_SodexhoPass: integer; const DataEntrega_SodexhoPass,
      DataCredito_SodexhoPass: TDate; const CodCCusto_SodexhoPass: string;
      const IdResp_SodexhoPass, IdRespReceb1_SodexhoPass, IdRespReceb2_SodexhoPass,
      IdRespReceb3_SodexhoPass: double): boolean;

    // Método de geração da Autorização de Pagamento (AP) para a compra dos vales
    function GerarAP_ValeTransp(const DataRef, DataEmissao, DataPagamento: TDate;
      const IdModulo, IdUsuario, IdFavorecido, UnidNegoc: integer; const CodCentroRespon,
      CodTipRecDes: string; const RateioCC, ObrigaAbc, ObrigaCRespon: boolean;
      const PlanoPrevGlobal, PatroGlobal, CodTipDoc: integer;
      const UsaPlanoPatro: boolean): boolean;

    property CdsCCusto_X_Val: TClientDataSet read FCdsCCusto_X_Val write FCdsCCusto_X_Val;
    property SQL: TStringList read FSQL;

    property Arquivo_ValeTransp: TStringList read FArquivo_ValeTransp;
    property Arquivo_Pedido_RioCard: TStringList read FArquivo_Pedido_RioCard;
    property Arquivo_CadUsuarios_RioCard: TStringList read FArquivo_CadUsuarios_RioCard;
    property Arquivo_Pedido_PasseCard: TStringList read FArquivo_Pedido_PasseCard;
    property Arquivo_CadUsuarios_PasseCard: TStringList read FArquivo_CadUsuarios_PasseCard;
    property Arquivo_Pedido_VTSantos: TStringList read FArquivo_Pedido_VTSantos;
    property Arquivo_Pedido_UberlandiaCard: TStringList read FArquivo_Pedido_UberlandiaCard;
    property Arquivo_CadUsuarios_UberlandiaCard: TStringList read FArquivo_CadUsuarios_UberlandiaCard;
    property Arquivo_Pedido_SodexhoPass: TStringList read FArquivo_Pedido_SodexhoPass;
    property OnProgresso: TOnProgVTMagnetico read FOnProgVTMagnetico write FOnProgVTMagnetico;
  end;

implementation

uses uCtrlFuncoesRH;

{ TCtrlParamVTMagnetico }

constructor TCtrlParamVTMagnetico.Create(IdEmpresa: integer; IdHotel: double;
  UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;
  FCdsPrincipal := TClientDataSet.Create(nil);
  FCdsCCusto_X_Val := TClientDataSet.Create(nil);
  
  FSQL := TStringList.Create;
  FArquivo_ValeTransp := TStringList.Create;
  FArquivo_Pedido_RioCard := TStringList.Create;
  FArquivo_CadUsuarios_RioCard := TStringList.Create;
  FArquivo_Pedido_PasseCard := TStringList.Create;
  FArquivo_CadUsuarios_PasseCard := TStringList.Create;
  FArquivo_Pedido_VTSantos := TStringList.Create;
  FArquivo_Pedido_UberlandiaCard := TStringList.Create;
  FArquivo_CadUsuarios_UberlandiaCard := TStringList.Create;
  FArquivo_Pedido_SodexhoPass := TStringList.Create;

  // Somente cria as classes relacionadas a integração com CAP se estiver na
  // Aplicação Servidora ou estiver no modo de execução Cliente Servidor em Duas Camadas
  if ((IsAppServer) or (ConnectionSide <> cnsClient)) then
  begin
    FCtrlBancoPortFolha := TCtrlBancoPortFolha.Create(FIdEmpresa);
    FCtrlIntegraCAPCAR_RH := TCtrlIntegraCAPCAR_RH.Create(IdHotel, UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  end;

  FIdEmpresa := IdEmpresa;
  FIdHotel := IdHotel;  

  if not(IsAppServer) then
    GetTempDir;
end;

destructor TCtrlParamVTMagnetico.Destroy;
begin
  FCdsPrincipal.Free;
  FCdsCCusto_X_Val.Free;

  FSQL.Free;
  FArquivo_ValeTransp.Free;
  FArquivo_Pedido_RioCard.Free;
  FArquivo_CadUsuarios_RioCard.Free;
  FArquivo_Pedido_PasseCard.Free;
  FArquivo_CadUsuarios_PasseCard.Free;
  FArquivo_Pedido_VTSantos.Free;
  FArquivo_Pedido_UberlandiaCard.Free;
  FArquivo_CadUsuarios_UberlandiaCard.Free;
  FArquivo_Pedido_SodexhoPass.Free;

  // Somente cria as classes relacionadas a integração com CAP se estiver na
  // Aplicação Servidora ou estiver no modo de execução Cliente Servidor em Duas Camadas
  if ((IsAppServer) or (ConnectionSide <> cnsClient)) then
  begin
    FCtrlBancoPortFolha.Free;
    FCtrlIntegraCAPCAR_RH.Free;
  end;
  inherited;
end;

procedure TCtrlParamVTMagnetico.AfterInitialize;
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

procedure TCtrlParamVTMagnetico.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlParamVTMagnetico.DoChangeDataBase;
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

procedure TCtrlParamVTMagnetico.MontarDatasFerias;
begin
  FCdsPrincipal.First;
  while not(FCdsPrincipal.EOF) do
  begin
    FCdsPrincipal.Edit;
    if not(FCdsPrincipal.FieldByName('FUNC_INICIOFERIAS').IsNull) then
      if (FCdsPrincipal.FieldByName('FUNC_INICIOFERIAS').asDateTime < FDataInicial) then
        FCdsPrincipal.FieldByName('FUNC_INICIOFERIAS').asDateTime := FDataInicial;

    if not(FCdsPrincipal.FieldByName('FUNC_FIMFERIAS').IsNull) then
      if (FCdsPrincipal.FieldByName('FUNC_FIMFERIAS').asDateTime > FDataFinal) then
        FCdsPrincipal.FieldByName('FUNC_FIMFERIAS').asDateTime := FDataFinal;

    FCdsPrincipal.Post;
    FCdsPrincipal.Next;
  end;
  FCdsPrincipal.First;
end;

function TCtrlParamVTMagnetico.AbrirQueryPrincipal(Ordenacao: integer): boolean;
begin
  with (FSQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PE.NUMDOCUMENTO AS INSCR_EMPRESA,');
    Add('  PJ.RAZAOSOCIAL AS NOME_ESTAB,');
    Add('  PJ.IDPESSOA AS IDESTAB,');
    Add('  PJ.NUMDOCUMENTO AS INSCR_ESTAB,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| TO_CHAR(E.NUMERO) ||');
    Add('    TO_CHAR(DECODE(E.COMPLEMENTO,');
    Add('      NULL,'''',');
    Add('      '' - '' || RTRIM(E.COMPLEMENTO)');
    Add('    )) AS END_ESTAB,');
    Add('  E.LOGRADOURO AS LOGRADOURO_ESTAB,');
    Add('  E.NUMERO AS NUMERO_ESTAB,');
    Add('  E.COMPLEMENTO AS COMPLEMENTO_ESTAB,');
    Add('  RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS CEP_ESTAB,');
    Add('  RTRIM(E.BAIRRO) AS BAIRRO_ESTAB,');
    Add('  RTRIM(CI.NOME) AS CIDADE_ESTAB,');
    Add('  ES.CODESTADO AS UF_ESTAB,');
    Add('  CATCNAE.IDCATCNAE AS ATIV_PRINC_ESTAB,');
    Add('  TEL.DDD AS DDD_ESTAB,');
    Add('  TEL.NUMERO AS TEL_ESTAB,');
    Add('  F.IDPESSOA,');
    Add('  F.MATRICULA,');
    Add('  PF.NOME AS FUNCIONARIO,');
    Add('  F.CODCENTROCUSTO,');
    Add('  CPF.NUM AS CPF,');

    if (FGerar_PasseCard) or (FGerar_SodexhoPass) then
    begin
      Add('  RG.NUM AS RG,');
      Add('  RTRIM(RG.ORGAO) || DECODE(RG.UF,NULL,'''',''/'' || RG.UF) AS ORGAO,');
      Add('  PFIS.DATANASC,');
    end;

    if (FGerar_SodexhoPass) then
    begin
      Add('  PFIS.SEXO,');
      Add('  RG.DATAEMISSAO,');
      Add('  EMPRESA_TRANSP.NUM AS COD_EMPRESA_TRANSP,');
    end;

{    Add('  (CASE');
    Add('     WHEN PFFERIAS.INIGOZOFERIAS IS NULL THEN NULL');
    Add('     ELSE (CASE');
    Add('             WHEN PFFERIAS.INIGOZOFERIAS >= TO_DATE(' +
      QuotedStr(DateToStr(FDataInicial))+ ',''DD/MM/YYYY'') THEN PFFERIAS.INIGOZOFERIAS');
    Add('             ELSE TO_DATE(' +QuotedStr(DateToStr(FDataInicial))+ ',''DD/MM/YYYY'')');
    Add('           END)');
    Add('   END) AS FUNC_INICIOFERIAS,');
    Add('  (CASE');
    Add('     WHEN PFFERIAS.FIMGOZOFERIAS IS NULL THEN NULL');
    Add('     ELSE (CASE');
    Add('             WHEN PFFERIAS.FIMGOZOFERIAS <= TO_DATE(' +
      QuotedStr(DateToStr(FDataFinal))+ ',''DD/MM/YYYY'') THEN PFFERIAS.FIMGOZOFERIAS');
    Add('             ELSE TO_DATE(' +QuotedStr(DateToStr(FDataFinal))+ ',''DD/MM/YYYY'')');
    Add('           END)');
    Add('   END) AS FUNC_FIMFERIAS,');}

    Add('  PFFERIAS.INIGOZOFERIAS AS FUNC_INICIOFERIAS,');
    Add('  PFFERIAS.FIMGOZOFERIAS AS FUNC_FIMFERIAS,');
    Add('  LP.QTDDIARIA AS QTDE_VALES,');
    Add('  LT.VLRLINHATRANSP AS VLR_TARIFA,');
    Add('  LT.IDLINHATRANSP,');
    Add('  LT.NUMLINHATRANSP AS NUMLINHA,');
    Add('  TO_CHAR(DECODE(LT.TIPOLINHATRANSP,');
    Add('     ' +QuotedStr(CMTranslate('Ônibus'))+ ',''O'',');
    Add('     ' +QuotedStr(CMTranslate('Onibus'))+ ',''O'',');
    Add('     ' +QuotedStr(CMTranslate('Bonde'))+ ',''O'',');
    Add('     ' +QuotedStr(CMTranslate('Metrô'))+ ',''M'',');
    Add('     ' +QuotedStr(CMTranslate('Metro'))+ ',''M'',');
    Add('     ' +QuotedStr(CMTranslate('Barca'))+ ',''B'',');
    Add('     ' +QuotedStr(CMTranslate('Trem'))+ ',''T'',');
    Add('     ' +QuotedStr(CMTranslate('Cartão'))+ ',''C'',');
    Add('     ' +QuotedStr(CMTranslate('Cartao'))+ ',''C'',');
    Add('     ''O''');
    Add('  )) AS TIPOLINHA,');
    Add('  CART_RIO_CARD.NUM AS NUM_CARTAO,');
    Add('  DIASACUMULADOS.CODRUBCLT,');
    Add('  NVL(EXTRA.DIASEXTRAS,0) AS DIASEXTRA,');
    Add('  NVL(DIASACUMULADOS.VALORPROVENTO,0) AS VALOR,');
    Add('  0 AS NUM_DIAS_TRAB,');
    Add('  0.00 AS QUANT_VALES,');
    Add('  0.00 AS VALOR_COMPRA,');
    Add('  0 AS SOMADO');
    // ---------------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PE, PESSOA PJ, PESSOA PF, ENDPESS E,');
    Add('  CIDADES CI, LINHAXPESS LP, LINHATRANSP LT,');
    Add('  CATCNAE, ESTADO ES, FILIALPESSOA FP,');
    // -------------------------------------------------------------------------- //
    // Telefone do Estabelecimento
    Add('  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.NUMERO');
    Add('   FROM');
    Add('     TELENDPESS TE,');
    Add('     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('      FROM     TELENDPESS');
    Add('      GROUP BY IDENDERECO) ENDER');
    Add('   WHERE');
    Add('     (ENDER.IDTELEFONE = TE.IDTELEFONE)) TEL,');
    // ---------------------------------------------------------------------------- //
    // Seleção dos empregados
    Add('  (SELECT F.*');
    Add('   FROM');
    Add('     FUNCIONARIO F, SITFUNC SF');
    Add('   WHERE');

    if (FListaIdFunc <> '') then
      Add(QuebrarListaFiltro(5, '(F.IDPESSOA    ', FListaIdFunc, 100) +' AND')
    else
    begin
      if (FListaSitFunc <> '') then
        Add(MontaLinhaSelSQL('     (SF.TIPOSIT',QuotedListaString(FListaSitFunc,','),5))
      else
        Add('     (SF.TIPOSIT      = ''A'') AND');

      Add(MontaLinhaSelSQL('     (F.TIPOCONTRATO',QuotedListaString(FListaTipoContrato,','),1));
      Add(MontaLinhaSelSQL('     (F.IDESTAB',FListaIdEstab,6));
    end;

    Add('     (SF.IDSITFUNC    = F.IDSITFUNC)) F,');
    // ---------------------------------------------------------------------------- //
    // RG da pessoa
    if (FGerar_PasseCard) or (FGerar_SodexhoPass) then
    begin
      Add('  PESSOAFISICA PFIS,');
      Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO AS NUM, DP.ORGAO, DP.DATAEMISSAO, ES.CODESTADO AS UF');
      Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO, ESTADO ES');
      Add('   WHERE (TDO.SIGLADOCUMENTO = ''RG:'') AND');
      Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
      Add('         (DP.IDESTADO        = ES.IDESTADO(+))) RG,');
    end;
    // ---------------------------------------------------------------------------- //
    // Código da Empresa de Transporte junto à Sodexho Pass
    if (FGerar_SodexhoPass) then
    begin
      Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
      Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
      Add('   WHERE (TDO.SIGLADOCUMENTO = ''COD_EMPR_TRANSP:'') AND');
      Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) EMPRESA_TRANSP,');
    end;
    // ---------------------------------------------------------------------------- //
    // CPF da pessoa
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CPF:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) CPF,');
    // ---------------------------------------------------------------------------- //
    // CPF da pessoa
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CART_MAGNETICO:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO)) CART_RIO_CARD,');
    // ---------------------------------------------------------------------------- //
    Add('  (SELECT H.IDPESSOA, H.VALORPROVENTO, P.CODRUBCLT');
    Add('   FROM   HISTRUBSAL H, PROVDESC P');
    Add('   WHERE (P.CODRUBCLT LIKE (''00%'')) AND');
    Add('         (H.MES        = ' +QuotedStr(FAnoMesRef)+ ') AND');
    Add('         (P.IDPROVENTO = H.IDRUBRICA)) DIASACUMULADOS,');
    // ---------------------------------------------------------------------------- //
    Add('  (SELECT FE.IDPESSOA, FE.INIGOZOFERIAS, FE.FIMGOZOFERIAS');
    Add('   FROM FERIAS FE');
    Add('   WHERE ((FE.INIGOZOFERIAS >= TO_DATE('+QuotedStr(DateToStr(FDataInicial))+',''DD/MM/YYYY'')) AND');
    Add('          (FE.INIGOZOFERIAS <= TO_DATE('+QuotedStr(DateToStr(FDataFinal))   +',''DD/MM/YYYY''))) OR');
    Add('         ((FE.FIMGOZOFERIAS >= TO_DATE('+QuotedStr(DateToStr(FDataInicial))+',''DD/MM/YYYY'')) AND');
    Add('          (FE.FIMGOZOFERIAS <= TO_DATE('+QuotedStr(DateToStr(FDataFinal))   +',''DD/MM/YYYY'')))) PFFERIAS,');
    // --------------------------------------------------------------------------------- //
    // SUB-SELECT PARA DIAS EXTRAS DE TRABALHO NO PERIODO
    Add('  (SELECT IDPESSOA, COUNT(*) AS DIASEXTRAS');
    Add('   FROM   DIAEXTRATRAB');
    Add('   WHERE  (DIATRAB >= TO_DATE('+QuotedStr(DateToStr(FDataInicial))+',''DD/MM/YYYY'')) AND');
    Add('          (DIATRAB <= TO_DATE('+QuotedStr(DateToStr(FDataFinal))+',''DD/MM/YYYY''))');
    Add('   GROUP BY IDPESSOA) EXTRA');
    // --------------------------------------------------------------------------------- //
    Add('WHERE');

    if not(FGerar_RioCard) and not(FGerar_PasseCard) and not(FGerar_VTSantos) and
       not(FGerar_UberlandiaCard) then
      Add('  (LT.TIPOLINHATRANSP NOT IN (' +QuotedStr(CMTranslate('Cartão')) +','+
                                            QuotedStr(CMTranslate('Cartao'))+ ')) AND');

    Add(MontaLinhaSelSQL('  (PJ.IDPESSOA',FListaIdEstab,6));
    Add('  (PJ.IDPESSOA       = F.IDESTAB) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = LP.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = CPF.IDPESSOA) AND');
    Add('  (F.IDEMPRESA       = PE.IDPESSOA) AND');
    Add('  (LP.IDLINHATRANSP  = LT.IDLINHATRANSP) AND');
    Add('  (PJ.IDPESSOA       = FP.IDFILIALPESSOA) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (E.IDENDERECO      = TEL.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CI.IDCIDADES) AND');
    Add('  (CI.IDESTADO       = ES.IDESTADO) AND');

    if (FGerar_PasseCard) or (FGerar_SodexhoPass) then
    begin
      Add('  (F.IDPESSOA       = PFIS.IDPESSOA) AND');
      Add('  (F.IDPESSOA       = RG.IDPESSOA(+)) AND');
    end;

    if (FGerar_SodexhoPass) then
      Add('  (LT.IDPESSOA      = EMPRESA_TRANSP.IDPESSOA(+)) AND');

    Add('  (F.IDPESSOA       = CART_RIO_CARD.IDPESSOA(+)) AND');
    Add('  (FP.IDCATCNAE     = CATCNAE.IDCATCNAE(+)) AND');
    Add('  (PF.IDPESSOA      = PFFERIAS.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA      = DIASACUMULADOS.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA      = EXTRA.IDPESSOA(+))');
    Add('ORDER BY');

    case (Ordenacao) of
      0 : Add('  INSCR_ESTAB, FUNCIONARIO, IDPESSOA, TIPOLINHA, NUMLINHA');
      1 : Add('  INSCR_ESTAB, CODCENTROCUSTO, FUNCIONARIO, IDPESSOA, TIPOLINHA, NUMLINHA');
      2 : Add('  INSCR_ESTAB, CODCENTROCUSTO, MATRICULA, TIPOLINHA, NUMLINHA');
      3 : Add('  INSCR_ESTAB, MATRICULA, TIPOLINHA, NUMLINHA');
    end;
  end;

  try
    if not(IsAppServer) then
      FSQL.SaveToFile(DirTempLog + '\qry.txt');
    FCdsPrincipal.Data := GetDataPacket(FSQL);
    MontarDatasFerias;
    FCdsPrincipal.Filter := '';
    FCdsPrincipal.Filtered := true;
    Result := not(FCdsPrincipal.IsEmpty);
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlParamVTMagnetico.ListParamCAP: OleVariant;
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

procedure TCtrlParamVTMagnetico.IncProgresso(NumPessoas, Incremento: integer);
begin
  if Assigned(OnProgresso) then
    OnProgresso(NumPessoas, Incremento);
end;

function TCtrlParamVTMagnetico.ProcessarGeracao(const GerarAP: boolean;
  const IdEmpresa: integer; const ListaIdEstab, ListaIdFunc, ListaSitFunc,
  ListaTipoContrato: string; const DataInicial, DataFinal: TDate; const MesDescFaltas,
  AnoDescFaltas: integer; const DescontarAfastamentos, DescontarFerias, DescontarFeriados,
  DescontarFaltas: boolean; const QuantDiasTrab, QuantDiasMinTrab, IdentificadorFunc,
  Ordenacao: integer; const Gerar_ValeTransp, Gerar_RioCard, Gerar_PasseCard,
  Gerar_VTSantos, Gerar_UberlandiaCard, Gerar_SodexhoPASS, GerarRegTipo3_RioCard: boolean;
  const CadUsuarios_RioCard, CadUsuarios_PasseCard, CadUsuarios_UberlandiaCard,
  CidadeRecarga_RioCard, CodRedeRecarda_RioCard: integer;
  const DataLiberacaoCarga_RioCard: TDate; const TipoEntrega_RioCard: integer;
  const NumAgenciaAntrega_RioCard: string; const CodCliente_PasseCard: double;
  const CodCliente_VTSantos, NumPedido_VTSantos: integer; const DataPedido_VTSantos,
  DataLiberacao_VTSantos: TDate; const NumDias_UberlandiaCard: array of integer;
  const Codigo_UberlandiaCard: array of string; const CodCliente_SodexhoPass: string;
  const NumPedido_SodexhoPass: integer; const DataEntrega_SodexhoPass,
  DataCredito_SodexhoPass: TDate; const CodCCusto_SodexhoPass: string;
  const IdResp_SodexhoPass, IdRespReceb1_SodexhoPass, IdRespReceb2_SodexhoPass,
  IdRespReceb3_SodexhoPass: double): boolean;
var
  bOk: boolean;
  iNum, iPos: byte;
begin
  if (GerarAP) then
    FCdsCCusto_X_Val.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  LPAD(''1'',10,''1'') AS CODCENTROCUSTO, 0.00 AS VALOR' +CR_LF+
      'FROM' +CR_LF+
      '  DUAL' +CR_LF+
      'WHERE' +CR_LF+
      '  (1=2)');

  try
    FGerar_ValeTransp := Gerar_ValeTransp;
    FGerar_RioCard := Gerar_RioCard;
    FGerar_PasseCard := Gerar_PasseCard;
    FGerar_VTSantos := Gerar_VTSantos;
    FGerar_UberlandiaCard := Gerar_UberlandiaCard;
    FGerar_SodexhoPASS := Gerar_SodexhoPASS;

    FAnoMesRef := RetornaAnoMes(IncData(DataInicial,0,-1,0));
    FDataInicial := DataInicial;
    FDataFinal := DataFinal;
    FListaIdEstab := ListaIdEstab;
    FListaIdFunc := ListaIdFunc;
    FListaSitFunc := ListaSitFunc;
    FListaTipoContrato := ListaTipoContrato;

    FArquivo_ValeTransp.Clear;
    FArquivo_Pedido_RioCard.Clear;
    FArquivo_CadUsuarios_RioCard.Clear;
    FArquivo_Pedido_PasseCard.Clear;
    FArquivo_CadUsuarios_PasseCard.Clear;
    FArquivo_Pedido_VTSantos.Clear;
    FArquivo_Pedido_UberlandiaCard.Clear;
    FArquivo_CadUsuarios_UberlandiaCard.Clear;
    FArquivo_Pedido_SodexhoPass.Clear;

    iNum := 0;
    if (Gerar_ValeTransp) then     Inc(iNum);
    if (Gerar_RioCard) then        Inc(iNum);
    if (Gerar_PasseCard) then      Inc(iNum);
    if (Gerar_VTSantos) then       Inc(iNum);
    if (Gerar_UberlandiaCard) then Inc(iNum);
    if (Gerar_SodexhoPass) then    Inc(iNum);

    if (iNum > 0) then
    begin
      if (AbrirQueryPrincipal(Ordenacao)) then
      begin
        for iPos:=1 to NUM_ARQUIVOS do
        begin
          case (iPos) of
            1 :
            if (Gerar_ValeTransp) then
            begin
              FCtrlArq := TCtrlArq_ValeTransp.Create(GerarAP, IdentificadorFunc);
              FCtrlArq.InitializeAs(Self);
              FCtrlArq.DataBaseName := DataBaseName;
              FCtrlArq.CdsPrincipal := FCdsPrincipal;
              FCtrlArq.CdsCCusto_X_Val := FCdsCCusto_X_Val;
              FCtrlArq.IncProgresso := IncProgresso;

              bOk := FCtrlArq.ProcessarGeracao(IdEmpresa, ListaIdEstab, DataInicial,
                DataFinal, DescontarAfastamentos, DescontarFerias, DescontarFeriados,
                DescontarFaltas, QuantDiasTrab, QuantDiasMinTrab, MesDescFaltas,
                AnoDescFaltas);
              if (bOk) then
                FArquivo_ValeTransp.Text := FCtrlArq.Arquivo
              else
                raise Exception.Create(FCtrlArq.MessageInfo);

              FCtrlArq.CdsPrincipal := nil;
              FCtrlArq.Free;
            end;
            2 :
            if (Gerar_RioCard) then
            begin
              FCtrlArq := TCtrlArq_RioCard.Create(GerarAP, CadUsuarios_RioCard,
                GerarRegTipo3_RioCard, CidadeRecarga_RioCard, CodRedeRecarda_RioCard,
                DataLiberacaoCarga_RioCard, TipoEntrega_RioCard, NumAgenciaAntrega_RioCard);
              FCtrlArq.InitializeAs(Self);
              FCtrlArq.DataBaseName := DataBaseName;
              FCtrlArq.CdsPrincipal := FCdsPrincipal;
              FCtrlArq.CdsCCusto_X_Val := FCdsCCusto_X_Val;
              FCtrlArq.IncProgresso := IncProgresso;

              bOk := FCtrlArq.ProcessarGeracao(IdEmpresa, ListaIdEstab, DataInicial,
                DataFinal, DescontarAfastamentos, DescontarFerias, DescontarFeriados,
                DescontarFaltas, QuantDiasTrab, QuantDiasMinTrab, MesDescFaltas,
                AnoDescFaltas);
              if (bOk) then
              begin
                FArquivo_Pedido_RioCard.Text := FCtrlArq.Arquivo;
                FArquivo_CadUsuarios_RioCard.Text := TCtrlModeloArqTranspCartao(FCtrlArq).Arquivo_CadUsuarios;
              end
              else
                raise Exception.Create(FCtrlArq.MessageInfo);

              FCtrlArq.CdsPrincipal := nil;
              FCtrlArq.Free;
            end;
            3 :
            if (Gerar_PasseCard) then
            begin
              FCtrlArq := TCtrlArq_PasseCard.Create(GerarAP, CadUsuarios_PasseCard,
                CodCliente_PasseCard);
              FCtrlArq.InitializeAs(Self);
              FCtrlArq.DataBaseName := DataBaseName;
              FCtrlArq.CdsPrincipal := FCdsPrincipal;
              FCtrlArq.CdsCCusto_X_Val := FCdsCCusto_X_Val;
              FCtrlArq.IncProgresso := IncProgresso;

              bOk := FCtrlArq.ProcessarGeracao(IdEmpresa, ListaIdEstab, DataInicial,
                DataFinal, DescontarAfastamentos, DescontarFerias, DescontarFeriados,
                DescontarFaltas, QuantDiasTrab, QuantDiasMinTrab, MesDescFaltas,
                AnoDescFaltas);
              if (bOk) then
              begin
                FArquivo_Pedido_PasseCard.Text := FCtrlArq.Arquivo;
                FArquivo_CadUsuarios_PasseCard.Text := TCtrlModeloArqTranspCartao(FCtrlArq).Arquivo_CadUsuarios;
              end
              else
                raise Exception.Create(FCtrlArq.MessageInfo);

              FCtrlArq.CdsPrincipal := nil;
              FCtrlArq.Free;
            end;
            4 :
            if (Gerar_VTSantos) then
            begin
              FCtrlArq := TCtrlArq_VTSantos.Create(GerarAP, CodCliente_VTSantos,
                NumPedido_VTSantos, DataPedido_VTSantos, DataLiberacao_VTSantos);
              FCtrlArq.InitializeAs(Self);
              FCtrlArq.DataBaseName := DataBaseName;
              FCtrlArq.CdsPrincipal := FCdsPrincipal;
              FCtrlArq.CdsCCusto_X_Val := FCdsCCusto_X_Val;
              FCtrlArq.IncProgresso := IncProgresso;

              bOk := FCtrlArq.ProcessarGeracao(IdEmpresa, ListaIdEstab, DataInicial,
                DataFinal, DescontarAfastamentos, DescontarFerias, DescontarFeriados,
                DescontarFaltas, QuantDiasTrab, QuantDiasMinTrab, MesDescFaltas,
                AnoDescFaltas);
              if (bOk) then
                FArquivo_Pedido_VTSantos.Text := FCtrlArq.Arquivo
              else
                raise Exception.Create(FCtrlArq.MessageInfo);

              FCtrlArq.CdsPrincipal := nil;
              FCtrlArq.Free;
            end;
            5 :
            if (Gerar_UberlandiaCard) then
            begin
              FCtrlArq := TCtrlArq_UberlandiaCard.Create(GerarAP, CadUsuarios_UberlandiaCard,
                NumDias_UberlandiaCard, Codigo_UberlandiaCard);
              FCtrlArq.InitializeAs(Self);
              FCtrlArq.DataBaseName := DataBaseName;
              FCtrlArq.CdsPrincipal := FCdsPrincipal;
              FCtrlArq.CdsCCusto_X_Val := FCdsCCusto_X_Val;
              FCtrlArq.IncProgresso := IncProgresso;

              bOk := FCtrlArq.ProcessarGeracao(IdEmpresa, ListaIdEstab, DataInicial,
                DataFinal, DescontarAfastamentos, DescontarFerias, DescontarFeriados,
                DescontarFaltas, QuantDiasTrab, QuantDiasMinTrab, MesDescFaltas,
                AnoDescFaltas);
              if (bOk) then
              begin
                FArquivo_Pedido_UberlandiaCard.Text := FCtrlArq.Arquivo;
                FArquivo_CadUsuarios_UberlandiaCard.Text := TCtrlModeloArqTranspCartao(FCtrlArq).Arquivo_CadUsuarios;
              end
              else
                raise Exception.Create(FCtrlArq.MessageInfo);

              FCtrlArq.CdsPrincipal := nil;
              FCtrlArq.Free;
            end;
            6 :
            if (Gerar_SodexhoPASS) then
            begin
              FCtrlArq := TCtrlArq_SodexhoPASS.Create(GerarAP, CodCliente_SodexhoPass,
                NumPedido_SodexhoPass, CodCCusto_SodexhoPass, DataEntrega_SodexhoPass,
                DataCredito_SodexhoPass, IdResp_SodexhoPass, IdRespReceb1_SodexhoPass,
                IdRespReceb2_SodexhoPass, IdRespReceb3_SodexhoPass);
              FCtrlArq.InitializeAs(Self);
              FCtrlArq.DataBaseName := DataBaseName;
              FCtrlArq.CdsPrincipal := FCdsPrincipal;
              FCtrlArq.CdsCCusto_X_Val := FCdsCCusto_X_Val;
              FCtrlArq.IncProgresso := IncProgresso;

              bOk := FCtrlArq.ProcessarGeracao(IdEmpresa, ListaIdEstab, DataInicial,
                DataFinal, DescontarAfastamentos, DescontarFerias, DescontarFeriados,
                DescontarFaltas, QuantDiasTrab, QuantDiasMinTrab, MesDescFaltas,
                AnoDescFaltas);
              if (bOk) then
                FArquivo_Pedido_SodexhoPass.Text := FCtrlArq.Arquivo
              else
                raise Exception.Create(FCtrlArq.MessageInfo);

              FCtrlArq.CdsPrincipal := nil;
              FCtrlArq.Free;
            end;
          end;
        end;
      end;
    end;
    {$IFDEF DEPURANDO}                                        
    //FCdsPrincipal.SaveToFile('c:\CdsPrincipal.Cds');
    FCdsPrincipal.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CdsPrincipal.Cds');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

    //FCdsCCusto_X_Val.SaveToFile('c:\CdsCCusto_X_Val.Cds');
    FCdsCCusto_X_Val.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CdsCCusto_X_Val.Cds');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    {$ENDIF}
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlParamVTMagnetico.GerarAP_ValeTransp(
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
    Result := Connection.AppServer.GerarAP_ValeTransp(FIdHotel, FUsuXFilial,
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
        MessageInfo := CR_LF+ CMTranslate('* Contas a Pagar efetuada com sucesso.') +CR_LF+
          CMTranslate('Documento: ')+ FCtrlIntegraCAPCAR_RH.NumDocGerados;
      except
        on E: Exception do
        begin
          Rollback;
          Result := false;
          MessageInfo := CR_LF+
            CMTranslate('* Ocorreu um erro durante o processamento da integração.')+
            CR_LF+ CMTranslate('Erro:') +CR_LF+ E.Message;
        end;
      end;
    finally
      FreeAndNil(_CdsDocumentos);
    end;
  end;
end;

end.
