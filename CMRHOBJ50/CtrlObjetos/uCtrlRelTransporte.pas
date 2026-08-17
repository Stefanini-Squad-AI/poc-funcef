unit uCtrlRelTransporte;

interface

uses Classes, SysUtils, Controls, Db, uCmControlObject, uCmDbObject, uCmClientDataSet,
  uCMTypes, uCtrlCustomRH, uCtrlRubricaIndiv;

const
  NAO_AGRUPA = 0;
  AGRUPA_TIPO = 1;
  AGRUPA_TIPO_CARTAO = 2;

type
  TCtrlRelTransporte = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  private
    FCdsDados: TCMClientDataSet;
    FCdsRelTransporte: TCMClientDataSet;
    FCdsRelResumo: TCMClientDataSet;
    FCtrlRubricaIndiv: TCtrlRubricaIndiv;

    FSQL: TStringList;

    FIdPessoa: double;
    FTipoFerias: integer;
    FNumDiasTrab: integer;
    FQtdeLinhas: double;
    FValorLinha: double;
    FMatricula: string;
    FNumLinha: string;
    FTipoLinha: string;
    FTipoAgrupamento: integer;

    FDataInicial: TDate;
    FDataFinal: TDate;
    FDescontaFeriados: boolean;
    FDescontaFerias: boolean;
    FDescontaFaltas: boolean;
    FGravarRubricaIncid: boolean;
    FQuantDiasTrab, FQuantDiasMinTrab, FIdEmpresa, FCodEmpresa: integer;
    FIdRubricaIncid, FIdRegraRubricaIncid: double;
    FValorTotalFunc: double; // Valor Total por Pessoa
    FMesRef: integer; // Mês para a gravação dos Lançamentos
    FAnoRef: integer; // Ano para a gravação dos Lançamentos
    FMesRef_Faltas: integer; // Mês para a procura das Faltas
    FAnoRef_Faltas: integer; // Ano para a procura das Faltas

    FListaIdPessoas: string;
    FNumTotPessoas: integer; // Quantidade total de pessoas geradas
    FQtdeTotal: double;
    FValorTotal: double;

    function  GetRelatTranspColuna_Em_Branco: OleVariant;
    function  GetRelatTranspResumido_Em_Branco: OleVariant;
    function  GetRelatTranspLinha_Em_Branco: OleVariant;
    procedure CalcularDiasTrabalhados;
    procedure CalcularValorLinha;

    function GravarLancamentos(const RelatorioEmColuna: boolean): boolean;
    function GravarLancamentos_Normal(const CampoValor: string): boolean;
    function GravarLancamentos_Agrupa(const CampoValor: string): boolean;
    function GravarLancTransporte: boolean;
    
    function  Gerar_Dados_Relat_Transp_Coluna_Normal: boolean;
    function  Gerar_Dados_Relat_Transp_Coluna_Agrupa: boolean;
    
    procedure IncNumTotPessoas;
    procedure ProxRegistroDados;

    procedure InicializarVariaveis(DataInicial, DataFinal: TDateTime; DescontaFeriados,
      DescontaFerias, DescontaFaltas: boolean; QuantDiasTrab, QuantDiasMinTrab, IdEmpresa,
      CodEmpresa: integer; GravarRubricaIncid: boolean; MesRef, AnoRef, MesRef_Faltas,
      AnoRef_Faltas: integer; IdRubricaIncid, IdRegraRubricaIncid: double;
      TipoAgrupamento: integer);

    function Montar_Query_Principal(RelatorioEmColuna: boolean; IdEstab: double; ListaIdFunc,
      SitFunc, TipoContrato: string; Ordenacao: integer): boolean;

    function Gerar_Dados_Coluna(const ContaNumEmpregados: boolean): boolean;
    function Gerar_Dados_Coluna_Resumido: boolean;
    function Gerar_Dados_Linha(const ContaNumEmpregados: boolean): boolean;
  public
    constructor Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce;
    destructor  Destroy; override;

    function Gerar_Dados(RelatorioEmColuna, ContaNumEmpregados: boolean; IdEstab: double;
      ListaIdFunc, SitFunc, TipoContrato: string; DataInicial, DataFinal: TDateTime;
      DescontaFeriados, DescontaFerias, DescontaFaltas: boolean; QuantDiasTrab,
      QuantDiasMinTrab, IdEmpresa, CodEmpresa: integer; GravarRubricaIncid: boolean;
      MesRef, AnoRef, MesRef_Faltas, AnoRef_Faltas: integer; IdRubricaIncid,
      IdRegraRubricaIncid: double; Ordenacao, TipoAgrupamento: integer): boolean;

    property CdsRelTransporte: TCMClientDataSet read FCdsRelTransporte write FCdsRelTransporte;
    property CdsRelResumo: TCMClientDataSet read FCdsRelResumo write FCdsRelResumo;
    property SQL: TStringList read FSQL;
  end;

implementation

uses uCtrlFuncoesRH, uDiasUteis;

const
  NUM_COLUNAS = 6;

{ TCtrlRelTransporte }

constructor TCtrlRelTransporte.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;
  FSQL := TStringList.Create;

  SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FCdsDados := TCMClientDataSet.Create(nil);

  FCtrlRubricaIndiv := TCtrlRubricaIndiv.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCtrlRubricaIndiv.CdsRubricaIndiv := TCMClientDataSet.Create(nil);
end;

destructor TCtrlRelTransporte.Destroy;
begin
  FSQL.Free;

  FCdsDados.Free;

  FCtrlRubricaIndiv.CdsRubricaIndiv.Free;
  FCtrlRubricaIndiv.Free;

  if (IsAppServer) then
  begin
    FCdsRelTransporte.Free;
    FCdsRelResumo.Free;
  end;
  
  inherited;
end;

procedure TCtrlRelTransporte.AfterInitialize;
begin
  inherited;
  FCtrlRubricaIndiv.InitializeAs(Self);
end;

procedure TCtrlRelTransporte.OnCreateAppServer;
begin
  inherited;
  FCdsRelTransporte := TCMClientDataSet.Create(nil);
  FCdsRelResumo := TCMClientDataSet.Create(nil);
end;

procedure TCtrlRelTransporte.DoChangeDataBase;
begin
  inherited;
  FCtrlRubricaIndiv.DataBase := DataBase;
end;

procedure TCtrlRelTransporte.InicializarVariaveis(DataInicial, DataFinal: TDateTime;
  DescontaFeriados, DescontaFerias, DescontaFaltas: boolean; QuantDiasTrab, QuantDiasMinTrab,
  IdEmpresa, CodEmpresa: integer; GravarRubricaIncid: boolean; MesRef, AnoRef, MesRef_Faltas,
  AnoRef_Faltas: integer; IdRubricaIncid, IdRegraRubricaIncid: double;
  TipoAgrupamento: integer);
begin
  FDataInicial := DataInicial;
  FDataFinal := DataFinal;
  FDescontaFeriados := DescontaFeriados;
  FDescontaFerias := DescontaFerias;
  FDescontaFaltas := DescontaFaltas;
  FQuantDiasTrab := QuantDiasTrab;
  FQuantDiasMinTrab := QuantDiasMinTrab;
  FCodEmpresa := CodEmpresa;
  FGravarRubricaIncid := GravarRubricaIncid;
  FIdRubricaIncid := IdRubricaIncid;
  FIdEmpresa := IdEmpresa;
  FIdRegraRubricaIncid := IdRegraRubricaIncid;
  FMesRef := MesRef;
  FAnoRef := AnoRef;
  FMesRef_Faltas := MesRef_Faltas;
  FAnoRef_Faltas := AnoRef_Faltas;
  FTipoAgrupamento := TipoAgrupamento;
end;

function TCtrlRelTransporte.Montar_Query_Principal(RelatorioEmColuna: boolean; IdEstab: double;
  ListaIdFunc, SitFunc, TipoContrato: string; Ordenacao: integer): boolean;
var
  sAnoMes: string;
begin
  sAnoMes := IntToStr(FAnoRef_Faltas) +'/'+ PoeZero(FMesRef_Faltas);
  try
    with (FSQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
      Add('  PJ.NOME AS ESTABELECIMENTO,');
      Add('  (');
      Add('    RTRIM(E.LOGRADOURO) ||');
      Add('    TO_CHAR(DECODE(E.NUMERO,');
      Add('      NULL,'''',');
      Add('      '', ''|| TO_CHAR(E.NUMERO)');
      Add('    )) ||');
      Add('    TO_CHAR(DECODE(E.COMPLEMENTO,');
      Add('      NULL,'''',');
      Add('      '' - '' || RTRIM(E.COMPLEMENTO)');
      Add('    )) ||');
      Add('    TO_CHAR(DECODE(E.BAIRRO,');
      Add('      NULL,'''',');
      Add('      '' - '' || RTRIM(E.BAIRRO)');
      Add('    )) ||');
      Add('    TO_CHAR(DECODE(CIDADES.NOME,');
      Add('      NULL,'''',');
      Add('      '' - '' || RTRIM(CIDADES.NOME)');
      Add('    )) ||');
      Add('    TO_CHAR(DECODE(E.CEP,');
      Add('      NULL,'''',');
      Add('      '' - CEP:'' || RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3))');
      Add('    ))');
      Add('  ) AS ENDERECO,');
      Add('  E.IDCIDADES,');
      Add('  ES.CODESTADO AS UF,');
      Add('  ES.IDPAIS,');
      Add('  PF.IDPESSOA AS IDFUNCIONARIO,');
      Add('  PF.NOME AS FUNCIONARIO,');
      Add('  F.IDEMPRESA,');
      Add('  F.MATRICULA,');
      Add('  F.DATAREFHORARIO AS DATAREF,');
      Add('  F.CODCENTROCUSTO AS CENTROCUSTO,');
      Add('  CC.NOME AS NOMECENTROCUSTO,');
      Add('  (NVL(HT.HORASFOLGA1,0) + NVL(HT.HORASSERVICO,0) + NVL(HT.HORASFOLGA2,0)) AS ESCALA,');
      Add('  HT.HORASSERVICO AS HORASSERVICO,');
      Add('  (HT.HORASFOLGA1 + HT.HORASFOLGA2) AS HORASFOLGA,');
      Add('  HT.FLGTIPOHORARIO AS TIPOHORARIO,');
      Add('  HT.HORASFOLGA1,');
      Add('  DECODE(PFFERIAS.INIGOZOFERIAS,');
      Add('    NULL,PFFERIAS.INIGOZOFERIAS,');
      Add('    GREATEST(PFFERIAS.INIGOZOFERIAS,TO_DATE('+ QuotedStr(DateToStr(FDataInicial)) +',''DD/MM/YYYY''))');
      Add('  ) AS INICIOFERIAS,');
      Add('  DECODE(PFFERIAS.FIMGOZOFERIAS,');
      Add('    NULL,PFFERIAS.FIMGOZOFERIAS,');
      Add('    LEAST(PFFERIAS.FIMGOZOFERIAS,TO_DATE('+ QuotedStr(DateToStr(FDataFinal)) +',''DD/MM/YYYY''))');
      Add('  ) AS FIMFERIAS,');
      Add('  HT.JORNADAMENSAL,');
      Add('  LP.QTDDIARIA,');

      if not(RelatorioEmColuna) then
        Add('  PT.NOME AS EMPRESATRANSP,');

      Add('  LT.IDLINHATRANSP,');
      Add('  LT.TIPOLINHATRANSP AS TIPOLINHA,');
      Add('  LT.NUMLINHATRANSP AS NUMLINHA,');

      if not(RelatorioEmColuna) then
        Add('  LT.DESCRICAO AS NOMELINHA,');

      Add('  LT.VLRLINHATRANSP AS VALORLINHA,');
      Add('  TS.IDDIASEMANA AS DIASEMANA,');
      Add('  TD.INICIOEXPEDIENTE,');
      Add('  TD.FINALEXPEDIENTE,');
      Add('  DIASACUMULADOS.CODRUBCLT,');
      Add('  NVL(EXTRA.DIASEXTRAS,0) AS DIASEXTRA,');
      Add('  NVL(DIASACUMULADOS.VALORPROVENTO,0) AS VALOR');
      // ---------------------------------------------------------------------------- //
      Add('FROM');
      Add('  PESSOA PJ, PESSOA PF, ' +IFF(RelatorioEmColuna, '', 'PESSOA PT, ')+
        'ENDPESS E, FUNCIONARIO F,');
      Add('  TURNOSEM TS, TURNODIA TD, HORATRAB HT, LINHATRANSP LT, LINHAXPESS LP,');
      Add('  CENTCUST CC, CIDADES, ESTADO ES,' +IFF(ListaIdFunc='','  SITFUNC ST,',''));
      // --------------------------------------------------------------------------------- //
      Add('  (SELECT H.IDPESSOA, H.VALORPROVENTO, P.CODRUBCLT');
      Add('   FROM   HISTRUBSAL H, PROVDESC P');
      Add('   WHERE (P.CODRUBCLT LIKE(''00%''))  AND');
      Add('         (H.IDPESSJUR  = ' +IntToStr(FIdEmpresa)+ ') AND');
      Add('         (H.MES        = ' +QuotedStr(sAnoMes)+ ') AND');
      Add('         (P.IDPROVENTO = H.IDRUBRICA)) DIASACUMULADOS,');
      // --------------------------------------------------------------------------------- //
      Add('  (SELECT FE.IDPESSOA, FE.INIGOZOFERIAS, FE.FIMGOZOFERIAS');
      Add('   FROM   FERIAS FE');
      Add('   WHERE ((FE.INIGOZOFERIAS >= TO_DATE(' +QuotedStr(DateToStr(FDataInicial))+',''DD/MM/YYYY'')) AND');
      Add('          (FE.INIGOZOFERIAS <= TO_DATE(' +QuotedStr(DateToStr(FDataFinal))+ ',''DD/MM/YYYY''))) OR');
      Add('         ((FE.FIMGOZOFERIAS >= TO_DATE(' +QuotedStr(DateToStr(FDataInicial))+ ',''DD/MM/YYYY'')) AND');
      Add('          (FE.FIMGOZOFERIAS <= TO_DATE(' +QuotedStr(DateToStr(FDataFinal))+ ',''DD/MM/YYYY'')))');
      Add('  ) PFFERIAS,');
      // --------------------------------------------------------------------------------- //
      // DIAS EXTRAS DE TRABALHO NO PERIODO
      Add('  (SELECT IDPESSOA, COUNT(*) AS DIASEXTRAS');
      Add('   FROM   DIAEXTRATRAB');
      Add('   WHERE  (DIATRAB >= TO_DATE(' +QuotedStr(DateToStr(FDataInicial))+ ',''DD/MM/YYYY'')) AND');
      Add('          (DIATRAB <= TO_DATE(' +QuotedStr(DateToStr(FDataFinal))+ ',''DD/MM/YYYY''))');
      Add('   GROUP BY IDPESSOA) EXTRA');
      // --------------------------------------------------------------------------------- //
      Add('WHERE');
      Add('  (PJ.IDPESSOA = ' +FloatToStr(IdEstab)+ ') AND');

      // Funcionário selecionado
      if (ListaIdFunc <> '') then
      begin
        Add(MontaLinhaSelSQL('  (PF.IDPESSOA',ListaIdFunc,1));
        Add(MontaLinhaSelSQL('  (F.IDPESSOA',ListaIdFunc,2));
      end
      else
      begin
        // C. de Custo(s) habilitados para o usuário
        if (FUsuXCCusto <> '') then
          Add(MontaLinhaSelSQL('  (F.CODCENTROCUSTO',FUsuXCCusto,1));

        if (SitFunc <> '') then
          Add(MontaLinhaSelSQL('  (ST.TIPOSIT',SitFunc,5));

        if (TipoContrato <> '') then
          Add(MontaLinhaSelSQL('  (F.TIPOCONTRATO',TipoContrato,1));
      end;

      if (FDescontaFerias) then
      begin
        Add('  ((PFFERIAS.INIGOZOFERIAS IS NULL) OR');
        Add('   (PFFERIAS.INIGOZOFERIAS > TO_DATE(' +QuotedStr(DateToStr(FDataInicial))+ ',''DD/MM/YYYY'')) OR');
        Add('   (PFFERIAS.FIMGOZOFERIAS IS NULL) OR');
        Add('   (PFFERIAS.FIMGOZOFERIAS < TO_DATE(' +QuotedStr(DateToStr(FDataFinal))+ ',''DD/MM/YYYY''))) AND');
      end;

      Add('  (PJ.IDPESSOA       = F.IDESTAB) AND');

      if (ListaIdFunc = '') then
        Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');

      Add('  (F.IDHORARIO       = HT.IDHORARIO) AND');
      Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
      Add('  (F.IDPESSOA        = LP.IDPESSOA) AND');
      Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO) AND');
      Add('  (F.IDEMPRESA       = CC.IDEMPRESA) AND');
      Add('  (LP.IDLINHATRANSP  = LT.IDLINHATRANSP) AND');

      if not(RelatorioEmColuna) then
        Add('  (LT.IDPESSOA       = PT.IDPESSOA) AND');

      Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
      Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
      Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
      Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
      Add('  (TS.IDTURNODIARIO  = TD.IDTURNODIARIO(+)) AND');
      Add('  (TS.IDHORARIO(+)   = HT.IDHORARIO) AND');
      Add('  (PF.IDPESSOA       = DIASACUMULADOS.IDPESSOA(+)) AND');
      Add('  (PF.IDPESSOA       = PFFERIAS.IDPESSOA(+)) AND');
      Add('  (PF.IDPESSOA       = EXTRA.IDPESSOA(+))');
      Add('ORDER BY');

      if (RelatorioEmColuna) then
      begin
        if (FTipoAgrupamento in [AGRUPA_TIPO, AGRUPA_TIPO_CARTAO]) then
        begin
          case (Ordenacao) of
            0 : Add('  EMPRESA, TIPOLINHA, FUNCIONARIO, NUMLINHA');
            1 : Add('  EMPRESA, TIPOLINHA, CENTROCUSTO, FUNCIONARIO, NUMLINHA');
            2 : Add('  EMPRESA, TIPOLINHA, CENTROCUSTO, MATRICULA, NUMLINHA');
            3 : Add('  EMPRESA, TIPOLINHA, MATRICULA, NUMLINHA');
          end;
        end
        else // NAO_AGRUPA
        begin
          case (Ordenacao) of
            0 : Add('  EMPRESA, FUNCIONARIO, TIPOLINHA, NUMLINHA');
            1 : Add('  EMPRESA, CENTROCUSTO, FUNCIONARIO, TIPOLINHA, NUMLINHA');
            2 : Add('  EMPRESA, CENTROCUSTO, MATRICULA, TIPOLINHA, NUMLINHA');
            3 : Add('  EMPRESA, MATRICULA, TIPOLINHA, NUMLINHA');
          end;
        end;
      end
      else
      begin
        if (FTipoAgrupamento in [AGRUPA_TIPO, AGRUPA_TIPO_CARTAO]) then
        begin
          case (Ordenacao) of
            0 : Add('  EMPRESA, TIPOLINHA, FUNCIONARIO, EMPRESATRANSP, NUMLINHA');
            1 : Add('  EMPRESA, TIPOLINHA, CENTROCUSTO, FUNCIONARIO, EMPRESATRANSP, NUMLINHA');
            2 : Add('  EMPRESA, TIPOLINHA, CENTROCUSTO, MATRICULA, EMPRESATRANSP, NUMLINHA');
            3 : Add('  EMPRESA, TIPOLINHA, MATRICULA, EMPRESATRANSP, NUMLINHA');
          end;
        end
        else // NAO_AGRUPA
        begin
          case (Ordenacao) of
            0 : Add('  EMPRESA, FUNCIONARIO, EMPRESATRANSP, TIPOLINHA, NUMLINHA');
            1 : Add('  EMPRESA, CENTROCUSTO, FUNCIONARIO, EMPRESATRANSP, TIPOLINHA, NUMLINHA');
            2 : Add('  EMPRESA, CENTROCUSTO, MATRICULA, EMPRESATRANSP, TIPOLINHA, NUMLINHA');
            3 : Add('  EMPRESA, MATRICULA, EMPRESATRANSP, TIPOLINHA, NUMLINHA');
          end;
        end
      end;
    end;

    FCdsDados.Data := GetDataPacket(FSQL);

    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlRelTransporte.GetRelatTranspColuna_Em_Branco: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  0 AS IDPESSOA,'+CR_LF+
    '  LPAD(''1'',60,''1'') AS FUNCIONARIO,' +CR_LF+
    '  ''12345'' AS NUMLINHA1,' +CR_LF+
    '  0 AS QTDE_LINHA1,' +CR_LF+
    '  0.00 AS VAL_LINHA1,' +CR_LF+
    '  ''12345'' AS NUMLINHA2,' +CR_LF+
    '  0 AS QTDE_LINHA2,' +CR_LF+
    '  0.00 AS VAL_LINHA2,' +CR_LF+
    '  ''12345'' AS NUMLINHA3,' +CR_LF+
    '  0 AS QTDE_LINHA3,' +CR_LF+
    '  0.00 AS VAL_LINHA3,' +CR_LF+
    '  ''12345'' AS NUMLINHA4,' +CR_LF+
    '  0 AS QTDE_LINHA4,' +CR_LF+
    '  .00 AS VAL_LINHA4,' +CR_LF+
    '  ''12345'' AS NUMLINHA5,' +CR_LF+
    '  0 AS QTDE_LINHA5,' +CR_LF+
    '  0.00 AS VAL_LINHA5,' +CR_LF+
    '  ''12345'' AS NUMLINHA6,' +CR_LF+
    '  0 AS QTDE_LINHA6,' +CR_LF+
    '  0.00 AS VAL_LINHA6,' +CR_LF+
    '  LPAD(''1'',60,''1'') AS EMPRESA,' +CR_LF+
    '  LPAD(''1'',60,''1'') AS ESTABELECIMENTO,' +CR_LF+
    '  LPAD(''1'',20,''1'') AS TIPOLINHA,' +CR_LF+
    '  ''12'' AS UF,' +CR_LF+
    '  LPAD(''1'',13,''1'') AS MATRICULA,' +CR_LF+
    '  ''1234567890'' AS CENTROCUSTO,' +CR_LF+
    '  LPAD(''1'',30,''1'') AS NOMECENTROCUSTO,' +CR_LF+
    '  0 AS QTDE_TOT_FUNC,' +CR_LF+
    '  0.00 AS VAL_TOT_FUNC,' +CR_LF+
    '  0 AS NUM_FUNC' +CR_LF+
    'FROM' +CR_LF+
    '  DUAL' +CR_LF+
    'WHERE' +CR_LF+
    '  (1 = 2)');
end;

function TCtrlRelTransporte.GetRelatTranspResumido_Em_Branco: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  LPAD(''1'',60,''1'') AS EMPRESA,' +CR_LF+
    '  LPAD(''1'',60,''1'') AS ESTABELECIMENTO,' +CR_LF+
    '  ''12'' AS UF,' +CR_LF+
    '  ''12345'' AS NUMLINHA,' +CR_LF+
    '  0.00 AS VAL_UNIT_LINHA,' +CR_LF+
    '  0.00 AS QTDE_LINHA,' +CR_LF+
    '  0.00 AS VAL_LINHA' +CR_LF+
    'FROM' +CR_LF+
    '  DUAL' +CR_LF+
    'WHERE' +CR_LF+
    '  (1 = 2)');
end;

function TCtrlRelTransporte.GetRelatTranspLinha_Em_Branco: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  0 AS IDPESSOA,' +CR_LF+
    '  LPAD(''1'',60,''1'') AS FUNCIONARIO,' +CR_LF+
    '  LPAD(''1'',60,''1'') AS NOMELINHA,' +CR_LF+
    '  LPAD(''1'',20,''1'') AS TIPOLINHA,' +CR_LF+
    '  0.00 AS QTDE_LINHA,' +CR_LF+
    '  0.00 AS VAL_UNIT_LINHA,' +CR_LF+
    '  0.00 AS VAL_TOT_LINHA,' +CR_LF+
    '  LPAD(''1'',60,''1'') AS EMPRESA,' +CR_LF+
    '  LPAD(''1'',60,''1'') AS ESTABELECIMENTO,' +CR_LF+
    '  ''12'' AS UF,' +CR_LF+
    '  LPAD(''1'',60,''1'') AS EMPRESATRANSP,' +CR_LF+
    '  LPAD(''1'',13,''1'') AS MATRICULA,' +CR_LF+
    '  ''1234567890'' AS CENTROCUSTO,' +CR_LF+
    '  LPAD(''1'',30,''1'') AS NOMECENTROCUSTO,' +CR_LF+
    '  0 AS NUM_FUNC' +CR_LF+
    'FROM' +CR_LF+
    '  DUAL' +CR_LF+
    'WHERE' +CR_LF+
    '  (1 = 2)');
end;

function TCtrlRelTransporte.Gerar_Dados_Coluna(const ContaNumEmpregados: boolean): boolean;
var
  bOk: boolean;
  ovRelTransporte, ovRelResumo: OleVariant;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gerar_Dados_Coluna(ContaNumEmpregados,
      FUsuXFilial, FUsuXCCusto, FIdUsuarioGeral, FCdsDados.Data, FDataInicial, FDataFinal,
      FDescontaFerias, FDescontaFaltas, FDescontaFeriados, FQuantDiasTrab, FQuantDiasMinTrab,
      FIdEmpresa, FCodEmpresa, FGravarRubricaIncid, FIdRubricaIncid, FIdRegraRubricaIncid,
      ovRelTransporte, ovRelResumo);
    FCdsRelTransporte.Data := ovRelTransporte;
    FCdsRelResumo.Data := ovRelResumo;
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := true;
    if not(FCdsDados.IsEmpty) then
    begin
      FQtdeTotal := 0;
      FValorTotal := 0;
      FNumTotPessoas := 0;
      FListaIdPessoas := '';

      // Selecionar todas os Lançamentos de Rubricas neste mês da Rubrica selecionada para
      // o caso de ter que atualizá-las.
      FCtrlRubricaIndiv.CdsRubricaIndiv.Data := FCtrlRubricaIndiv.ListRubricasNoMes(
        FIdEmpresa, FIdRubricaIncid, RetornaAnoMes(FDataFinal));

      try
        // Geração das Linhas de Transporte
        if (FTipoAgrupamento = NAO_AGRUPA) then
          bOk := Gerar_Dados_Relat_Transp_Coluna_Normal
        else
          bOk := Gerar_Dados_Relat_Transp_Coluna_Agrupa;

        if not(bOk) then
          raise Exception.Create(MessageInfo);

        if not(FCdsRelTransporte.IsEmpty) then
        begin
          FCdsRelTransporte.Edit;

          // Incluir o Número de Empregados
          if (ContaNumEmpregados) then
            FCdsRelTransporte.FieldByName('NUM_FUNC').asInteger := FNumTotPessoas;

          FCdsRelTransporte.FieldByName('QTDE_TOT_FUNC').asFloat := FQtdeTotal;
          FCdsRelTransporte.Post;
        end;

        // Gravar Rubricas de Incidências
        if (FGravarRubricaIncid) and (FIdRubricaIncid > 0) then
        begin
          if not(GravarLancamentos(true)) then
            raise Exception.Create(MessageInfo);

          Result := FCtrlRubricaIndiv.GravarRubricaIndiv;
          if not(Result) then
            raise Exception.Create(FCtrlRubricaIndiv.MessageInfo);
        end;
      except
        on E: Exception do
        begin
          Result := false;
          MessageInfo := E.Message;
        end;
      end;
    end;
  end;
end;

function TCtrlRelTransporte.Gerar_Dados_Relat_Transp_Coluna_Normal: boolean;
var
  iPos: byte;
begin
  try
    FCdsDados.First;
    while not(FCdsDados.EOF) do
    begin
      FValorTotalFunc := 0;
      FMatricula := FCdsDados.FieldByName('MATRICULA').asString;
      FIdPessoa := FCdsDados.FieldByName('IDFUNCIONARIO').asFloat;

      CalcularDiasTrabalhados;
      if (FNumDiasTrab > 0) then
      begin
        Inc(FNumTotPessoas);
        repeat
          FCdsRelTransporte.Append;
          FCdsRelTransporte.FieldByName('IDPESSOA').asFloat := FCdsDados.FieldByName('IDFUNCIONARIO').asFloat;
          FCdsRelTransporte.FieldByName('FUNCIONARIO').asString := FCdsDados.FieldByName('FUNCIONARIO').asString;
          FCdsRelTransporte.FieldByName('EMPRESA').asString := FCdsDados.FieldByName('EMPRESA').asString;
          FCdsRelTransporte.FieldByName('ESTABELECIMENTO').asString := FCdsDados.FieldByName('ESTABELECIMENTO').asString;
          FCdsRelTransporte.FieldByName('UF').asString := FCdsDados.FieldByName('UF').asString;
          FCdsRelTransporte.FieldByName('MATRICULA').asString := FMatricula;
          FCdsRelTransporte.FieldByName('CENTROCUSTO').asString := FCdsDados.FieldByName('CENTROCUSTO').asString;
          FCdsRelTransporte.FieldByName('NOMECENTROCUSTO').asString := FCdsDados.FieldByName('NOMECENTROCUSTO').asString;

          // Calcular cada linha de transporte
          iPos := 1;
          while (FIdPessoa = FCdsDados.FieldByName('IDFUNCIONARIO').asFloat) and
                not(FCdsDados.EOF) do
          begin
            CalcularValorLinha;
            FCdsRelTransporte.FieldByName('NUMLINHA'+ IntToStr(iPos)).asString := FCdsDados.FieldByName('NUMLINHA').asString;
            FCdsRelTransporte.FieldByName('QTDE_LINHA'+ IntToStr(iPos)).asFloat := FQtdeLinhas;
            FCdsRelTransporte.FieldByName('VAL_LINHA'+ IntToStr(iPos)).asFloat := FCdsDados.FieldByName('VALORLINHA').asFloat;

            // Calcular o valor total da(s) linha(s) do funcionário
            FValorTotalFunc := FValorTotalFunc + FValorLinha;
            // Somar a quantidade de vales da linha do funcionário a Quantidade Total
            FQtdeTotal := FQtdeTotal + FQtdeLinhas;

            while (FIdPessoa  = FCdsDados.FieldByName('IDFUNCIONARIO').asFloat) and
                  (FNumLinha  = FCdsDados.FieldByName('IDLINHATRANSP').asString) and
                  (FTipoLinha = FCdsDados.FieldByName('TIPOLINHA').asString) and
                  not(FCdsDados.EOF) do
            begin
              ProxRegistroDados;
            end;
            Inc(iPos);
          end;

          FCdsRelTransporte.FieldByName('VAL_TOT_FUNC').asFloat := FValorTotalFunc;

          // Somar o valor total da(s) linha(s) do funcionário ao Valor Total
          FValorTotal := FValorTotal + FValorTotalFunc;

          // Gravar registro
          FCdsRelTransporte.Post;
        until (FIdPessoa <> FCdsDados.FieldByName('IDFUNCIONARIO').asFloat) or (FCdsDados.EOF);
      end
      else
      begin
        while (FIdPessoa = FCdsDados.FieldByName('IDFUNCIONARIO').asFloat) and
              not(FCdsDados.EOF) do
        begin
          ProxRegistroDados;
        end;
      end;
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

function TCtrlRelTransporte.Gerar_Dados_Relat_Transp_Coluna_Agrupa: boolean;
var
  iPos, c: byte;
  sTipoLinha, sTipoLinhaAtual: string;
begin
  try
    FCdsDados.First;
    while not(FCdsDados.EOF) do
    begin
      FValorTotalFunc := 0;
      FMatricula := FCdsDados.FieldByName('MATRICULA').asString;
      FIdPessoa := FCdsDados.FieldByName('IDFUNCIONARIO').asFloat;
      sTipoLinha := FCdsDados.FieldByName('TIPOLINHA').asString;

      CalcularDiasTrabalhados;
      if (FNumDiasTrab > 0) then
      begin
        IncNumTotPessoas;
        repeat
          sTipoLinhaAtual := sTipoLinha;
          if (FTipoAgrupamento = AGRUPA_TIPO_CARTAO) then
          begin
            if (Copy(sTipoLinhaAtual,1,1) = 'C') then // Cartão
              sTipoLinhaAtual := 'Cartão'
            else
              sTipoLinhaAtual := 'Outros';
          end;

          if (FCdsRelTransporte.Locate('IDPESSOA;TIPOLINHA', VarArrayOf([
              FCdsDados.FieldByName('IDFUNCIONARIO').asFloat, sTipoLinhaAtual]), [])) then
            FCdsRelTransporte.Edit
          else
            FCdsRelTransporte.Append;
        
          FCdsRelTransporte.FieldByName('IDPESSOA').asFloat := FCdsDados.FieldByName('IDFUNCIONARIO').asFloat;
          FCdsRelTransporte.FieldByName('FUNCIONARIO').asString := FCdsDados.FieldByName('FUNCIONARIO').asString;
          FCdsRelTransporte.FieldByName('EMPRESA').asString := FCdsDados.FieldByName('EMPRESA').asString;
          FCdsRelTransporte.FieldByName('ESTABELECIMENTO').asString := FCdsDados.FieldByName('ESTABELECIMENTO').asString;
          FCdsRelTransporte.FieldByName('UF').asString := FCdsDados.FieldByName('UF').asString;
          FCdsRelTransporte.FieldByName('MATRICULA').asString := FCdsDados.FieldByName('MATRICULA').asString;
          FCdsRelTransporte.FieldByName('CENTROCUSTO').asString := FCdsDados.FieldByName('CENTROCUSTO').asString;
          FCdsRelTransporte.FieldByName('NOMECENTROCUSTO').asString := FCdsDados.FieldByName('NOMECENTROCUSTO').asString;
          FCdsRelTransporte.FieldByName('TIPOLINHA').asString := sTipoLinhaAtual;

          // Calcular cada linha de transporte
          iPos := 1;
          for c:=1 to 6 do
            if (FCdsRelTransporte.FieldByName('VAL_LINHA'+ IntToStr(c)).asFloat > 0) then
              Inc(iPos);

          while (sTipoLinha = FCdsDados.FieldByName('TIPOLINHA').asString) and
                (FIdPessoa  = FCdsDados.FieldByName('IDFUNCIONARIO').asFloat) and
                not(FCdsDados.EOF) do
          begin
            CalcularValorLinha;
            FCdsRelTransporte.FieldByName('NUMLINHA'+ IntToStr(iPos)).asString := FCdsDados.FieldByName('NUMLINHA').asString;
            FCdsRelTransporte.FieldByName('QTDE_LINHA'+ IntToStr(iPos)).asFloat := FQtdeLinhas;
            FCdsRelTransporte.FieldByName('VAL_LINHA'+ IntToStr(iPos)).asFloat := FCdsDados.FieldByName('VALORLINHA').asFloat;

            // Calcular o valor total da(s) linha(s) do funcionário
            FValorTotalFunc := FValorTotalFunc + FValorLinha;
            // Somar a quantidade de vales da linha do funcionário a Quantidade Total
            FQtdeTotal := FQtdeTotal + FQtdeLinhas;

            while (FIdPessoa  = FCdsDados.FieldByName('IDFUNCIONARIO').asFloat) and
                  (FNumLinha  = FCdsDados.FieldByName('IDLINHATRANSP').asString) and
                  (FTipoLinha = FCdsDados.FieldByName('TIPOLINHA').asString) and
                  not(FCdsDados.EOF) do
            begin
              ProxRegistroDados;
            end;
            Inc(iPos);
          end;

          FCdsRelTransporte.FieldByName('VAL_TOT_FUNC').asFloat :=
            FCdsRelTransporte.FieldByName('VAL_TOT_FUNC').asFloat + FValorTotalFunc;

          // Somar o valor total da(s) linha(s) do funcionário ao Valor Total
          FValorTotal := FValorTotal + FValorTotalFunc;

          // Gravar registro
          FCdsRelTransporte.Post;
        until (sTipoLinha <> FCdsDados.FieldByName('TIPOLINHA').asString) or
              (FIdPessoa  <> FCdsDados.FieldByName('IDFUNCIONARIO').asFloat) or
              (FCdsDados.EOF);
      end
      else
      begin
        while (sTipoLinha = FCdsDados.FieldByName('TIPOLINHA').asString) and
              (FIdPessoa  = FCdsDados.FieldByName('IDFUNCIONARIO').asFloat) and
              not(FCdsDados.EOF) do
        begin
          ProxRegistroDados;
        end;
      end;
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

procedure TCtrlRelTransporte.IncNumTotPessoas;
begin
  if (VerificaCodigoEm(FListaIdPessoas, FloatToStr(FIdPessoa), ',') <= 0) then
  begin
    Inc(FNumTotPessoas);
    InserirCodigoEm(FListaIdPessoas, FloatToStr(FIdPessoa));
  end;
end;

procedure TCtrlRelTransporte.ProxRegistroDados;
begin
  FCdsDados.Next;
  DoProgresso([0, 1, 0]);
end;

function TCtrlRelTransporte.Gerar_Dados_Coluna_Resumido: boolean;
var
  c: byte;
  rValLinha: real;
  iQuantLinha, iPosNumLinha: integer;
  _slNumLinha, _slQuantLinha, _slValLinha: TStringList;
begin
  _slNumLinha := TStringList.Create;
  _slQuantLinha := TStringList.Create;
  _slValLinha := TStringList.Create;
  try
    try
      if not(FCdsRelTransporte.IsEmpty) then
      begin
        // Criação dos índices auxiliares no Cds Principal
        for c:=1 to NUM_COLUNAS do
          FCdsRelTransporte.AddIndex('Index'+ IntToStr(c), 'NUMLINHA'+ IntToStr(c), []);

        for c:=1 to NUM_COLUNAS do
        begin
          FCdsRelTransporte.IndexName := 'Index'+ IntToStr(c);
          FCdsRelTransporte.First;
          repeat
            FNumLinha := FCdsRelTransporte.FieldByName('NUMLINHA'+ IntToStr(c)).asString;
            rValLinha := FCdsRelTransporte.FieldByName('VAL_LINHA'+ IntToStr(c)).asFloat;
            iQuantLinha := 0;
            repeat
              iQuantLinha := iQuantLinha +
                FCdsRelTransporte.FieldByName('QTDE_LINHA'+ IntToStr(c)).asInteger;

              FCdsRelTransporte.Next;
            until (FCdsRelTransporte.EOF) or
                  (FNumLinha <> FCdsRelTransporte.FieldByName('NUMLINHA'+ IntToStr(c)).asString);

            if (FNumLinha <> '') then
            begin
              iPosNumLinha := _slNumLinha.IndexOf(FNumLinha);
              if (iPosNumLinha = -1) then
              begin
                _slNumLinha.Add(FNumLinha);
                _slQuantLinha.Add(IntToStr(iQuantLinha));
                _slValLinha.Add(FloatToStr(rValLinha));
              end
              else
              begin
                _slQuantLinha[iPosNumLinha] :=
                  IntToStr(StrInt(_slQuantLinha[iPosNumLinha]) + iQuantLinha);
              end;
            end;
          until (FCdsRelTransporte.EOF);
        end;

        for c:=0 to _slNumLinha.Count-1 do
        begin
          FCdsRelResumo.Insert;
          FCdsRelResumo.FieldByName('EMPRESA').asString := FCdsRelTransporte.FieldByName('EMPRESA').asString;
          FCdsRelResumo.FieldByName('ESTABELECIMENTO').asString := FCdsRelTransporte.FieldByName('ESTABELECIMENTO').asString;
          FCdsRelResumo.FieldByName('UF').asString := FCdsRelTransporte.FieldByName('UF').asString;
          FCdsRelResumo.FieldByName('NUMLINHA').asString := _slNumLinha[c];
          FCdsRelResumo.FieldByName('VAL_UNIT_LINHA').asFloat := StrFloat(_slValLinha[c]);
          FCdsRelResumo.FieldByName('QTDE_LINHA').asInteger := StrInt(_slQuantLinha[c]);
          FCdsRelResumo.FieldByName('VAL_LINHA').asFloat :=
            StrInt(_slQuantLinha[c]) * StrFloat(_slValLinha[c]);
          FCdsRelResumo.Post;
        end;

        // Exclusão dos índices auxiliares no Cds Principal
        FCdsRelTransporte.IndexName := '';
        for c:=1 to NUM_COLUNAS do
          FCdsRelTransporte.DeleteIndex('Index'+ IntToStr(c));
      end;

      Result := true;
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  finally
    FreeObject(_slNumLinha);
    FreeObject(_slQuantLinha);
    FreeObject(_slValLinha);
  end;
end;

function TCtrlRelTransporte.Gerar_Dados_Linha(const ContaNumEmpregados: boolean): boolean;
var
  ovRelTransporte, ovRelResumo: OleVariant;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gerar_Dados_Linha(ContaNumEmpregados,
      FUsuXFilial, FUsuXCCusto, FIdUsuarioGeral, FCdsDados.Data, FDataInicial, FDataFinal,
      FDescontaFerias, FDescontaFaltas, FDescontaFeriados, FQuantDiasTrab, FQuantDiasMinTrab,
      FIdEmpresa, FCodEmpresa, FGravarRubricaIncid, FIdRubricaIncid, FIdRegraRubricaIncid,
      ovRelTransporte, ovRelResumo);
    FCdsRelTransporte.Data := ovRelTransporte;
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := true;
    if not(FCdsDados.IsEmpty) then
    begin
      FNumTotPessoas := 0;
      // Selecionar todas os Lançamentos de Rubricas neste mês da Rubrica selecionada para
      // o caso de ter que atualizá-las.
      FCtrlRubricaIndiv.CdsRubricaIndiv.Data := FCtrlRubricaIndiv.ListRubricasNoMes(
        FIdEmpresa, FIdRubricaIncid, RetornaAnoMes(FDataFinal));

      try
        // Geração das Linhas de Transporte
        FCdsDados.First;
        while not(FCdsDados.EOF) do
        begin
          FValorTotalFunc := 0;
          FMatricula := FCdsDados.FieldByName('MATRICULA').asString;
          FIdPessoa := FCdsDados.FieldByName('IDFUNCIONARIO').asFloat;

          CalcularDiasTrabalhados;
          if (FNumDiasTrab > 0) then
          begin
            IncNumTotPessoas;
            repeat
              CalcularValorLinha;
              FCdsRelTransporte.Append;
              FCdsRelTransporte.FieldByName('IDPESSOA').asFloat := FCdsDados.FieldByName('IDFUNCIONARIO').asFloat;
              FCdsRelTransporte.FieldByName('FUNCIONARIO').asString := FCdsDados.FieldByName('FUNCIONARIO').asString;
              FCdsRelTransporte.FieldByName('NOMELINHA').asString := FCdsDados.FieldByName('NOMELINHA').asString;
              FCdsRelTransporte.FieldByName('QTDE_LINHA').asFloat := FQtdeLinhas;
              FCdsRelTransporte.FieldByName('VAL_UNIT_LINHA').asFloat := FCdsDados.FieldByName('VALORLINHA').asFloat;
              FCdsRelTransporte.FieldByName('VAL_TOT_LINHA').asFloat := FValorLinha;
              FCdsRelTransporte.FieldByName('EMPRESA').asString := FCdsDados.FieldByName('EMPRESA').asString;
              FCdsRelTransporte.FieldByName('ESTABELECIMENTO').asString := FCdsDados.FieldByName('ESTABELECIMENTO').asString;
              FCdsRelTransporte.FieldByName('UF').asString := FCdsDados.FieldByName('UF').asString;
              FCdsRelTransporte.FieldByName('EMPRESATRANSP').asString := FCdsDados.FieldByName('EMPRESATRANSP').asString;
              FCdsRelTransporte.FieldByName('MATRICULA').asString := FCdsDados.FieldByName('MATRICULA').asString;
              FCdsRelTransporte.FieldByName('CENTROCUSTO').asString := FCdsDados.FieldByName('CENTROCUSTO').asString;
              FCdsRelTransporte.FieldByName('NOMECENTROCUSTO').asString := FCdsDados.FieldByName('NOMECENTROCUSTO').asString;

              if (FTipoAgrupamento = AGRUPA_TIPO) then
                FCdsRelTransporte.FieldByName('TIPOLINHA').asString := FCdsDados.FieldByName('TIPOLINHA').asString
              else
              if (FTipoAgrupamento = AGRUPA_TIPO_CARTAO) then
              begin
                if (FCdsDados.FieldByName('TIPOLINHA').asString[1] = 'C') then // Cartão
                  FCdsRelTransporte.FieldByName('TIPOLINHA').asString := 'Cartão'
                else
                  FCdsRelTransporte.FieldByName('TIPOLINHA').asString := 'Outros';
              end
              else // NAO_AGRUPA
                FCdsRelTransporte.FieldByName('TIPOLINHA').asString := '';

              FCdsRelTransporte.Post;

              // Calcular o valor total da(s) linha(s) do funcionário
              FValorTotalFunc := FValorTotalFunc + FValorLinha;

              while (FMatricula = FCdsDados.FieldByName('MATRICULA').asString) and
                    (FNumLinha  = FCdsDados.FieldByName('IDLINHATRANSP').asString) and
                    (FTipoLinha = FCdsDados.FieldByName('TIPOLINHA').asString) and
                    not(FCdsDados.EOF) do
              begin
                ProxRegistroDados;
              end;
            until (FMatricula <> FCdsDados.FieldByName('MATRICULA').asString) or
                  (FCdsDados.EOF);
          end
          else
          begin
            while (FMatricula = FCdsDados.FieldByName('MATRICULA').asString) and
                  not(FCdsDados.EOF) do
            begin
              ProxRegistroDados;
            end;
          end;
        end;

        // Incluir o Número de Empregados
        if (ContaNumEmpregados) and not(FCdsRelTransporte.IsEmpty) then
        begin
          FCdsRelTransporte.Edit;
          FCdsRelTransporte.FieldByName('NUM_FUNC').asInteger := FNumTotPessoas;
          FCdsRelTransporte.Post;
        end;

        if (FGravarRubricaIncid) and (FIdRubricaIncid > 0) then
        begin
          if not(GravarLancamentos(false)) then
            raise Exception.Create(MessageInfo);

          Result := FCtrlRubricaIndiv.GravarRubricaIndiv;
          if not(Result) then
            raise Exception.Create(FCtrlRubricaIndiv.MessageInfo);
        end;    
      except
        on E: Exception do
        begin
          Result := false;
          MessageInfo := E.Message;
        end;
      end;
    end;
  end;
end;

procedure TCtrlRelTransporte.CalcularDiasTrabalhados;
var
  sCodRubClt: string;
  _DiasUteis: TDiasUteis;
  ListaIdRubrica: TStringList;
  bmRegistro: TBookMark;
  rRazao, rTotHoras, rHora1, rHora2, rResto, rRestoDivisao: real;
  {iTipoHorario, }iTotDiasMes, iDiaMes, iTotDiasDesc, {iDiaSemanaInicio, }iDiasFerias,
  iADom, iASeg, iATer, iAQua, iAQui, iASex, iASab, iDom, iSeg, iTer, iQua, iQui, iSex, iSab,
  iPrimeiraDif, iSegundaDif, iPosicao, iContador: integer;
  dDataInicio, dInicioFerias, dFimFerias, dNormalIni2, dNormalFim2: TDateTime;
begin
  _DiasUteis := TDiasUteis.Create;
  _DiasUteis.InitializeAs(Self);
  
  ListaIdRubrica := TStringList.Create;

  iTotDiasDesc := 0;
  //iPrimeiraDif := 0;
//  iSegundaDif := 0;
  FTipoFerias := 0;
//  iDiaSemanaInicio := 0;
  FNumDiasTrab := 0;
//  iDiaMes := 0;
//  iTipoHorario := 0;
  iDiasFerias := 0;
  iADom := 0;
  iASeg := 0;
  iATer := 0;
  iAQua := 0;
  iAQui := 0;
  iASex := 0;
  iASab := 0;

  rHora1 := 0;
  rHora2 := 0;
  rResto := 0;

  FNumLinha := '';
  FTipoLinha := '';
  sCodRubClt := '';

  FMatricula := FCdsDados.FieldByName('MATRICULA').asString;
  dInicioFerias := FCdsDados.FieldByName('INICIOFERIAS').asDateTime;
  dFimFerias := FCdsDados.FieldByName('FIMFERIAS').asDateTime;
  dNormalIni2 := FDataInicial;
  dNormalFim2 := FDataFinal;

  // Incializa variáveis gerais
  iDom := 0;
  iSeg := 0;
  iTer := 0;
  iQua := 0;
  iQui := 0;
  iSex := 0;
  iSab := 0;
  iTotDiasMes := Round(FDataFinal - FDataInicial);
  dDataInicio := FDataInicial;
  bmRegistro := FCdsDados.GetBookMark;

  // Testa se Casos de Férias
  // Verifica se Férias está no Intervalo escolhido pelo Usuário no Form de Parâmetros
  // As férias têm que terminar, também, antes da Data de Início de Processamento
  if (dInicioFerias = 0) or (dFimFerias = 0) or
     (dInicioFerias = StrToDateTime('31/12/1899')) or
     (dFimFerias = StrToDateTime('31/12/1899')) or
     (dFimFerias < FDataInicial) then
  begin // Se não for Período de Férias
    // Diferenças
    iPrimeiraDif := Round((dNormalIni2 - FCdsDados.FieldByName('DATAREF').asDateTime)+1);
    iSegundaDif := Round((dNormalFim2 - FCdsDados.FieldByName('DATAREF').asDateTime)+1);
    iDiaMes := Round((dNormalFim2 - dNormalIni2));

    // Pega Dia da Semana da Data de Contratação do Funcionário
//    iDiaSemanaInicio := DayOfWeek(FCdsDados.FieldByName('DATAREF').AsDateTime);
//    iTipoHorario := FCdsDados.FieldByName('TIPOHORARIO').asInteger;

    if (FDescontaFeriados) then
    begin
      if (FQuantDiasTrab > 0) then
        iSeg := FQuantDiasTrab
      else
      for iContador:=0 to iTotDiasMes do
      begin
        if not(_DiasUteis.Feriado(dDataInicio + iContador,
              FCdsDados.FieldByName('IDCIDADES').asInteger,
              FCdsDados.FieldByName('IDPAIS').asInteger,
              FCdsDados.FieldByName('UF').asString, false, true)) then
          case DayOfWeek(dDataInicio + iContador) of
            1 : Inc(iDom);
            2 : Inc(iSeg);
            3 : Inc(iTer);
            4 : Inc(iQua);
            5 : Inc(iQui);
            6 : Inc(iSex);
            7 : Inc(iSab);
          end;
      end;
    end
    else
    begin
      if (FQuantDiasTrab > 0) then
        iSeg := FQuantDiasTrab
      else
      for iContador:=0 to iTotDiasMes do
        case DayOfWeek(dDataInicio + iContador) of
          1 : Inc(iDom);
          2 : Inc(iSeg);
          3 : Inc(iTer);
          4 : Inc(iQua);
          5 : Inc(iQui);
          6 : Inc(iSex);
          7 : Inc(iSab);
        end;
    end;
  end
  else // Se for Período de Férias
  begin
    if (FQuantDiasTrab > 0) then
       iSeg := FQuantDiasTrab
    else
    for iContador:=0 to iTotDiasMes do
      case DayOfWeek(dDataInicio + iContador) of
        1 : Inc(iDom);
        2 : Inc(iSeg);
        3 : Inc(iTer);
        4 : Inc(iQua);
        5 : Inc(iQui);
        6 : Inc(iSex);
        7 : Inc(iSab);
      end;

    // Testa Tipos de Férias
    if (FDescontaFerias) then
    begin
      // Se o Período de Férias estiver no Intervalo do Mês (>= DataInicial e <= DatalFinal)
      // Caso 1 e 4
      if (dInicioFerias >= dNormalIni2) and (dFimFerias <= dNormalFim2) then
        FTipoFerias := 1;
      // Caso 2
      if (dInicioFerias < dNormalIni2)  and (dFimFerias <= dNormalFim2) then
        FTipoFerias := 2;
      // Caso 3
      if (dInicioFerias >= dNormalIni2) and (dFimFerias > dNormalFim2) then
        FTipoFerias := 3;

      // Calcula o Número de Dias de Férias, se FOR ESCALA.
      // Caso 1 e 4
      if (FTipoFerias = 1) then
      begin
        // Quantidade de Dias da Semana em que o indivíduo ficou de Férias
        if (FCdsDados.FieldByName('ESCALA').asFloat > 0) then // Se for ESCALA
        else // Se NÃO for escala
        begin
          // Pego todos os feriados no período
          if (FDescontaFeriados) then
          begin
            if (FQuantDiasTrab > 0) then
              iSeg := FQuantDiasTrab
            else
            for iContador:=0 to iTotDiasMes do
            begin
              if (_DiasUteis.Feriado(dDataInicio + iContador,
                  FCdsDados.FieldByName('IDCIDADES').asInteger,
                  FCdsDados.FieldByName('IDPAIS').asInteger,
                  FCdsDados.FieldByName('UF').asString, false,true)) and
                  not(((dDataInicio + iContador) >= FCdsDados.FieldByName('INICIOFERIAS').asDateTime) and
                      ((dDataInicio + iContador) <= FCdsDados.FieldByName('FIMFERIAS').asDateTime)) then
                case DayOfWeek(dDataInicio + iContador) of
                  1 : Inc(iADom);
                  2 : Inc(iASeg);
                  3 : Inc(iATer);
                  4 : Inc(iAQua);
                  5 : Inc(iAQui);
                  6 : Inc(iASex);
                  7 : Inc(iASab);
                end;
            end;
          end;

          // E Somo-os aos dias de férias
          while (dInicioFerias <= dFimFerias) do
          begin
            case (DayOfWeek(dInicioFerias)) of
              1 : Inc(iADom);
              2 : Inc(iASeg);
              3 : Inc(iATer);
              4 : Inc(iAQua);
              5 : Inc(iAQui);
              6 : Inc(iASex);
              7 : Inc(iASab);
            end;
            dInicioFerias := dInicioFerias + 1;
          end;
        end;
        dInicioFerias := FCdsDados.FieldByName('INICIOFERIAS').AsDateTime;
      end
      else
      // Caso 2
      // Se as Férias Terminarem antes do último dia do mês
      if (FTipoFerias = 2) then
      begin
        iDiasFerias := Round(dFimFerias - dNormalIni2) + 1;
        dNormalIni2 := dFimFerias+1;
      end
      else
      // Caso 3
      // Se as Férias começarem antes do final do Mês
      if (FTipoFerias = 3) then
      begin
        iDiasFerias := Round(dInicioFerias - dNormalIni2) + 1;
        dNormalFim2 := dInicioFerias-1;
      end;
    end;
    // --------------------------------------------------------------------------------- //
    // Diferenças
    iPrimeiraDif := Round((dNormalIni2 - FCdsDados.FieldByName('DATAREF').AsDateTime)+1);
    iSegundaDif := Round((dNormalFim2 - FCdsDados.FieldByName('DATAREF').AsDateTime)+1);
    iDiaMes := Round((dNormalFim2 - dNormalIni2));
    // Pega Dia da Semana da Data de Contratação do Funcionário
//    iDiaSemanaInicio := DayOfWeek(FCdsDados.FieldByName('DATAREF').AsDateTime);
//    iTipoHorario := FCdsDados.FieldByName('TIPOHORARIO').asInteger;
  end;

  if (FCdsDados.FieldByName('ESCALA').asInteger > 1) then // HORÁRIO ESCALA
  begin
    if ({iTipoHorario}FCdsDados.FieldByName('TIPOHORARIO').asInteger = 1) then // ESCALA VARIÁVEL
    begin
      if (FCodEmpresa = REFER) then
        FNumDiasTrab := iDiaMes + 1
      else
      begin
        for iContador:=0 to iDiaMes do
        begin
          if (iContador = 0) then
          begin
            rTotHoras := FCdsDados.FieldByName('ESCALA').Value;
            rHora1 := ((dNormalIni2 -
              FCdsDados.FieldByName('DATAREF').Value) * 24 mod rTotHoras) +
              FCdsDados.FieldByName('HORASFOLGA1').Value;

            if (rHora1 >= 24) and
               (rTotHoras - rHora1 < FCdsDados.FieldByName('HORASSERVICO').Value) then
              rResto := FCdsDados.FieldByName('HORASSERVICO').Value + rHora1 - rTotHoras;
          end;

          if (rResto > 0) then
          begin
            rHora2 := rResto;
            rHora1 := 0;
          end
          else
          if (rResto = 0) then
          begin
            rHora1 := rHora2 + FCdsDados.FieldByName('HORASFOLGA').Value;
            if (rHora1 > 24) then
              rHora1 := rHora1 - 24;
          end;

          if (rHora1 < 24) then
          begin
            if (rResto <= 0) then
            begin
              rHora2 := rHora1 + FCdsDados.FieldByName('HORASSERVICO').Value;
              FNumDiasTrab := FNumDiasTrab + 1;
            end;

            if (rHora2 > 24) then
            begin
              rResto := rHora2 - 24;
              rHora2 := 24;
            end
            else
              rResto := 0;

            rHora1 := 0;
          end
          else
          begin
            rHora1 := rHora1 - 24;
            rResto := -1;
          end;
        end;
      end;
      // Testa se tem Férias do FTipoFerias ESPECIAL
      if (FTipoFerias = 1) then
        FNumDiasTrab := Round(((((iDiaMes + 1) - ((dFimFerias - dInicioFerias) + 1)) *
          FNumDiasTrab) / (iDiaMes + 1)));
    end
    else
    begin // HORÁRIO ESCALA FIXA
      // Calcula a RAZÃO
      // RAZAO := Horas de Folga / 24; Se RAZAO < Round(RAZAO) então RAZAO := ROUND(Razao) - 1;
      rRazao := FCdsDados.FieldByName('HORASFOLGA').asInteger / 24;
      if (rRazao < Round(rRazao)) then
        rRazao := Round(rRazao) - 1;
      rRazao := rRazao + 1;

      // Faz Variação para Contagem de Dias Trabalhados
      for iContador:=iPrimeiraDif to iSegundaDif do
      begin
        // Pega o Resto da Divisão
        rRestoDivisao := (Round((FCdsDados.FieldByName('DATAREF').asDateTime +
          iContador) - (dNormalIni2)) mod Round(rRazao));

        // Testa se o dia SERÁ ou NÃO trabalhado
        if (rRestoDivisao = 0) then
          FNumDiasTrab := FNumDiasTrab + 1;
      end;
    end;
  end
  else
  begin // HORÁRIO NORMAL
    // Marca o Registro da Query para posterior Retorno
    FNumDiasTrab := 0;
    FNumLinha := FCdsDados.FieldByName('IDLINHATRANSP').asString;
    // Se não tiver período de Férias
    if (FTipoFerias = 0) then
    begin
      while (FMatricula = FCdsDados.FieldByName('MATRICULA').asString) and
            (FNumLinha  = FCdsDados.FieldByName('IDLINHATRANSP').asString) and
            not(FCdsDados.EOF) do
      begin
        // Contabiliza os Dias Trabalhados
        case (FCdsDados.FieldByName('DIASEMANA').asInteger) of
          1 : FNumDiasTrab := FNumDiasTrab + iDom;
          2 : FNumDiasTrab := FNumDiasTrab + iSeg;
          3 : FNumDiasTrab := FNumDiasTrab + iTer;
          4 : FNumDiasTrab := FNumDiasTrab + iQua;
          5 : FNumDiasTrab := FNumDiasTrab + iQui;
          6 : FNumDiasTrab := FNumDiasTrab + iSex;
          7 : FNumDiasTrab := FNumDiasTrab + iSab;
        end;
        FCdsDados.Next;
      end;
    end
    // Se estiver em período de Férias
    else
    begin
      // Loop para Calcular um Período Quebrado do Mês (não inteiro) Ex.: 18/03/99 a 31/03/99
      while (FMatricula = FCdsDados.FieldByName('MATRICULA').asString) and
            (FNumLinha  = FCdsDados.FieldByName('IDLINHATRANSP').asString) and
            not(FCdsDados.EOF) do
      begin
        // Contabiliza os Dias Trabalhados - Dias de Férias
        case (FCdsDados.FieldByName('DIASEMANA').asInteger) of
          1 : FNumDiasTrab := (FNumDiasTrab + iDom) - iADom;
          2 : FNumDiasTrab := (FNumDiasTrab + iSeg) - iASeg;
          3 : FNumDiasTrab := (FNumDiasTrab + iTer) - iATer;
          4 : FNumDiasTrab := (FNumDiasTrab + iQua) - iAQua;
          5 : FNumDiasTrab := (FNumDiasTrab + iQui) - iAQui;
          6 : FNumDiasTrab := (FNumDiasTrab + iSex) - iASex;
          7 : FNumDiasTrab := (FNumDiasTrab + iSab) - iASab;
        end;
        FCdsDados.Next;
      end;
    end;
  end;

  // Faz os descontos dos dias de faltas e/ou afastamentos
  FCdsDados.GoToBookMark(bmRegistro);
  sCodRubClt := FCdsDados.FieldByName('CODRUBCLT').asString;
  while (FMatricula = FCdsDados.FieldByName('MATRICULA').asString) and
        not(FCdsDados.EOF) and
        (FDescontaFaltas) do
  begin
    if (FCdsDados.FieldByName('CODRUBCLT').asString <> '') and
       not(ListaIdRubrica.Find(sCodRubClt, iPosicao)) then
    begin
      // Total de Dias de Faltas Abonadas
      if (sCodRubClt = '00006') then
      begin
        ListaIdRubrica.Add(sCodRubClt);
        iTotDiasDesc := iTotDiasDesc - FCdsDados.FieldByName('VALOR').asInteger;
      end
      else
      if (sCodRubClt = '00001') or // Total de Dias de Faltas
         (sCodRubClt = '00024') or // Total de Dias de Afastamento por Doença
         (sCodRubClt = '00034') or // Total de Dias de Suspensão
         (sCodRubClt = '00039') or // Total de Dias de Afastamento pelo INSS por Doença
         (sCodRubClt = '00041') or // Total de Dias de Licença Remunerada
         (sCodRubClt = '00043') or // Total de Dias de Licença Não Remunerada
         (sCodRubClt = '00570') or // Total de Dias de Afastamento Maternidade
         (sCodRubClt = '00571') or // Total de Dias de Afastamento Paternidade
         (sCodRubClt = '00574') or // Total de Dias de Afastamento por Natmorte
         (sCodRubClt = '00696') or // Total de Dias de Afastamento Militar
         (sCodRubClt = '00697') then // Total de Dias de Afastamento pelo INSS (Acidente de Trabalho)
      begin
        ListaIdRubrica.Add(sCodRubClt);
        iTotDiasDesc := iTotDiasDesc + FCdsDados.FieldByName('VALOR').asInteger;
      end;
    end;
    sCodRubClt := FCdsDados.FieldByName('CODRUBCLT').asString;
    FCdsDados.Next;
  end;

  // Dias Trabalhados - (Afastamentos, Faltas, etc.)
  FNumDiasTrab := FNumDiasTrab - iTotDiasDesc;

  if (FNumDiasTrab < FQuantDiasMinTrab) then
    FNumDiasTrab := 0;

  FCdsDados.GoToBookMark(bmRegistro);
  FCdsDados.FreeBookMark(bmRegistro);

  FreeAndNil(ListaIdRubrica);
  FreeAndNil(_DiasUteis);
end;

procedure TCtrlRelTransporte.CalcularValorLinha;
begin
  FNumLinha := FCdsDados.FieldByName('IDLINHATRANSP').asString;
  FTipoLinha := FCdsDados.FieldByName('TIPOLINHA').asString;

  FQtdeLinhas := Round(FNumDiasTrab * FCdsDados.FieldByName('QTDDIARIA').asFloat) +
    Round(FCdsDados.FieldByName('DIASEXTRA').asInteger *
    FCdsDados.FieldByName('QTDDIARIA').asFloat); 
  FValorLinha := FQtdeLinhas * FCdsDados.FieldByName('VALORLINHA').asFloat;
end;

function TCtrlRelTransporte.GravarLancamentos(const RelatorioEmColuna: boolean): boolean;
begin
  if (RelatorioEmColuna) then
    Result := GravarLancamentos_Normal('VAL_TOT_FUNC')
  else
    Result := GravarLancamentos_Agrupa('VAL_TOT_LINHA');
end;

function TCtrlRelTransporte.GravarLancamentos_Normal(const CampoValor: string): boolean;
begin
  try
    FCdsRelTransporte.First;
    repeat
      FIdPessoa := FCdsRelTransporte.FieldByName('IDPESSOA').asFloat;
      FValorTotalFunc := FCdsRelTransporte.FieldByName(CampoValor).asFloat;

      if not(GravarLancTransporte) then
        raise Exception.Create(MessageInfo);

      FCdsRelTransporte.Next;
    until (FCdsRelTransporte.EOF);
    Result := true;
  except
    On E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlRelTransporte.GravarLancamentos_Agrupa(const CampoValor: string): boolean;
begin
  try
    FCdsRelTransporte.AddIndex('Index', 'IDPESSOA', []);
    FCdsRelTransporte.IndexName := 'Index';
    FCdsRelTransporte.First;
    repeat
      FIdPessoa := FCdsRelTransporte.FieldByName('IDPESSOA').asFloat;
      FValorTotalFunc := 0;
      repeat
        FValorTotalFunc := FValorTotalFunc + FCdsRelTransporte.FieldByName(CampoValor).asFloat;
        FCdsRelTransporte.Next;
      until (FCdsRelTransporte.EOF) or
            (FCdsRelTransporte.FieldByName('IDPESSOA').asFloat <> FIdPessoa);

      if not(GravarLancTransporte) then
        raise Exception.Create(MessageInfo);

    until (FCdsRelTransporte.EOF);
    FCdsRelTransporte.IndexName := '';
    FCdsRelTransporte.DeleteIndex('Index');

    Result := true;
  except
    On E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlRelTransporte.GravarLancTransporte: boolean;
var
  iProxNumSeq: integer;
begin
  Result := true;
  try
    if (FCtrlRubricaIndiv.CdsRubricaIndiv.Locate('IDPESSOA', FIdPessoa, [])) then
      FCtrlRubricaIndiv.CdsRubricaIndiv.Edit
    else
    begin
      // Obter o próximo ID de RUBRICAINDIV
      iProxNumSeq := FCtrlRubricaIndiv.UltimoNumSeq(FIdPessoa,
        FIdRubricaIncid, FIdEmpresa) + 1;

      FCtrlRubricaIndiv.CdsRubricaIndiv.Insert;
      FCtrlRubricaIndiv.CdsRubricaIndiv.FieldByName('IDEMPRESA').asInteger := FIdEmpresa;
      FCtrlRubricaIndiv.CdsRubricaIndiv.FieldByName('IDPESSOA').asFloat := FIdPessoa;
      FCtrlRubricaIndiv.CdsRubricaIndiv.FieldByName('IDRUBRICA').asFloat := FIdRubricaIncid;
      FCtrlRubricaIndiv.CdsRubricaIndiv.FieldByName('SEQRUBRICAINDIV').asInteger := iProxNumSeq;
      FCtrlRubricaIndiv.CdsRubricaIndiv.FieldByName('PARCELAS').asInteger := 1;
      FCtrlRubricaIndiv.CdsRubricaIndiv.FieldByName('NUMOCORRENCIAS').asInteger := 0;
      FCtrlRubricaIndiv.CdsRubricaIndiv.FieldByName('ANOMESINICIO').asString := 
        IntToStr(FAnoRef) +'/'+ PoeZero(FMesRef);

      FCtrlRubricaIndiv.CdsRubricaIndiv.FieldByName('FLGPERMANENTE').asInteger := 0;
      FCtrlRubricaIndiv.CdsRubricaIndiv.FieldByName('FLGTPRUBMANUT').asInteger := 2;

      if (FIdRegraRubricaIncid > 0) then
        FCtrlRubricaIndiv.CdsRubricaIndiv.FieldByName('IDREGRACALCULO').asFloat :=
          FIdRegraRubricaIncid
      else
        FCtrlRubricaIndiv.CdsRubricaIndiv.FieldByName('IDREGRACALCULO').Clear;
    end;

    FCtrlRubricaIndiv.CdsRubricaIndiv.FieldByName('VALORRUBRICA').asFloat :=
      FCtrlRubricaIndiv.CdsRubricaIndiv.FieldByName('VALORRUBRICA').asFloat + FValorTotalFunc;
    FCtrlRubricaIndiv.CdsRubricaIndiv.Post;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlRelTransporte.Gerar_Dados(RelatorioEmColuna, ContaNumEmpregados: boolean;
  IdEstab: double; ListaIdFunc, SitFunc, TipoContrato: string; DataInicial,
  DataFinal: TDateTime; DescontaFeriados, DescontaFerias, DescontaFaltas: boolean;
  QuantDiasTrab, QuantDiasMinTrab, IdEmpresa, CodEmpresa: integer; GravarRubricaIncid: boolean;
  MesRef, AnoRef, MesRef_Faltas, AnoRef_Faltas: integer; IdRubricaIncid,
  IdRegraRubricaIncid: double; Ordenacao, TipoAgrupamento: integer): boolean;
begin
  InicializarVariaveis(DataInicial, DataFinal, DescontaFeriados, DescontaFerias,
    DescontaFaltas, QuantDiasTrab, QuantDiasMinTrab, IdEmpresa, CodEmpresa,
    GravarRubricaIncid, MesRef, AnoRef, MesRef_Faltas, AnoRef_Faltas, IdRubricaIncid,
    IdRegraRubricaIncid, TipoAgrupamento);

  try
    if (RelatorioEmColuna) then
    begin
      FCdsRelTransporte.Data := GetRelatTranspColuna_Em_Branco;
      FCdsRelResumo.Data := GetRelatTranspResumido_Em_Branco;
    end
    else
      FCdsRelTransporte.Data := GetRelatTranspLinha_Em_Branco;

    if not(Montar_Query_Principal(RelatorioEmColuna, IdEstab, ListaIdFunc,
           SitFunc, TipoContrato, Ordenacao)) then
    begin
      raise Exception.Create(MessageInfo);
    end;

    DoProgresso([FCdsDados.RecordCount, 0, 0]);

    if (RelatorioEmColuna) then
    begin
      if not(Gerar_Dados_Coluna(ContaNumEmpregados)) then
        raise Exception.Create(MessageInfo);

      if not(Gerar_Dados_Coluna_Resumido) then
        raise Exception.Create(MessageInfo);
    end
    else
    begin
      if not(Gerar_Dados_Linha(ContaNumEmpregados)) then
        raise Exception.Create(MessageInfo);
    end;

    DoProgresso([0, 0, 1]);

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
