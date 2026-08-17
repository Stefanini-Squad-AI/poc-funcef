unit uCtrlRelTransporte;

interface

uses Classes, SysUtils, Controls, DB, uCmControlObject, uCmDbObject, IvDictio,
  uCmClientDataSet, uCMTypes, uDiasUteis, uCtrlCustomRH, uCtrlRubricaIndiv,
  uCtrlHorarioVariavel, uCtrlTurnoSem, uCtrlTurnoDia;

const
  NAO_AGRUPA = 0;
  AGRUPA_TIPO = 1;
  AGRUPA_TIPO_CARTAO = 2;

type
  TOnProgRelTransporte = procedure (const NumReg: integer;
    const Incrementar, Termino: boolean) of object;

  TLinha = class
  public
    Num: string;
    Quant: integer;
    Val: double;
  end;

  TCtrlRelTransporte = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  private
    FOnProgRelTransporte: TOnProgRelTransporte;

    FCtrlRubricaIndiv: TCtrlRubricaIndiv;
    FCtrlHorarioVariavel: TCtrlHorarioVariavel;
    FCtrlTurnoSem: TCtrlTurnoSem;
    FCtrlTurnoDia: TCtrlTurnoDia;

    FCdsDados: TCMClientDataSet;
    FCdsRelTransporte: TCMClientDataSet;
    FCdsRelResumo: TCMClientDataSet;
    FCdsHorarioVariavel: TCMClientDataSet;
    FCdsTurno: TCMClientDataSet;
    FCdsTurnoDiario: TCMClientDataSet;

    FSQL: TStringList;
    FListaIdRubrica: TStringList;
    FListaHorarios: TStringList;

    FDiasUteis: TDiasUteis;

    FTipoAgrupamento: integer;
    FMesRef: integer; // Mês para a gravação dos Lançamentos
    FAnoRef: integer; // Ano para a gravação dos Lançamentos
    FMesRef_Faltas: integer; // Mês para a procura das Faltas
    FAnoRef_Faltas: integer; // Ano para a procura das Faltas
    FNumDiasMes: integer; // Quantidade de dias no mês
    FNumDiasTrab: integer; // Número de dias trabalhados
    FQuantDiasTrab: integer; // Quantidade fixa de dias trabalhados. Usado quando a empresa
                         // sempre considera o mês com determinado número de dias
    FQuantDiasMinTrab: integer; // Indica a quantidade mínima para que uma Linha de Transporte
                               // seja gerada. Ex: Para FQuantDiasMinTrab = 10 e
                               // para uma determinada pessoa FQtdeLinhas = 9, esta
                               // linha não será gerada
    FIdEmpresa: integer; // ID da Empresa Proprietária
    FCodEmpresa: integer; // Código que identifica qual empresa está utilizando o sistema

    FIdPessoa: double; // ID da pessoa que está sendo gerada
    FIdRubricaIncid: double; // ID da Rubrica que será feito o Lançamento Individual
    FIdRegraRubricaIncid: double; // ID da Regra/Forma de Cálculo correspondente à
                                  // Rubrica que será feito o Lançamento Individual
    FQtdeLinhas: double; // Quantidade da Linha de Transporte atual
    FValorLinha: double; // Valor da Linha de Transporte atual (Valor Unitário * Quantidade)
    FValorTotalFunc: double; // Valor Total por Pessoa

    FMatricula: string; // Matrícula da pessoa que está sendo gerada atualmente
    FIdLinha: string; // ID da Linha de Transporte que está sendo gerada atualmente
    FNumLinha: string; // Número da Linha de Transporte que está sendo gerada atualmente
    FTipoLinha: string; // Tipo da Linha de Transporte que está sendo gerada atualmente

    FDataInicial: TDate; // Período Inicial a calcular as linhas de transporte
    FDataFinal: TDate; // Período Final a calcular as linhas de transporte
    FInicioFerias: TDate; // Período Inicial das férias da pessoa
    FFinalFerias: TDate; // Período Final das férias da pessoa

    FDescontarFerias: boolean; // Indica se é para fazer o desconto dos férias no período
    FDescontarFeriados: boolean; // Indica se é para fazer o desconto dos feriados no período
    FDescontarFaltas: boolean; // Indica se é para fazer o desconto dos faltas no período
    FGravarRubricaIncid: boolean; // Indica se será gerado um lançamento de Rubricas
                                  // Individuais para cada linha

    FListaIdPessoas: string;
    FNumTotPessoas: integer; // Quantidade total de pessoas geradas
    FQtdeTotal: double;
    FValorTotal: double;

    procedure IncProgresso(const NumReg: integer; const Incrementar, Termino: boolean);

    function  GetRelatTranspColuna_Em_Branco: OleVariant;
    function  GetRelatTranspResumido_Em_Branco: OleVariant;
    function  GetRelatTranspLinha_Em_Branco: OleVariant;

    procedure InitHorarioVariavel;
    procedure MontarListaHorarios;
    procedure RefazHorario(DiaDoMes: integer);

    function  GetNumDiasTrab: integer;
    function  GetNumDiasTrab_HorarioEscala: integer;
    function  GetNumDiasFaltas: integer;

    procedure CalcularDiasTrabalhados;
    procedure CalcularValorLinha;

    function GravarLancamentos(const RelatorioEmColuna: boolean): boolean;
    function GravarLancamentos_Normal(const CampoValor: string): boolean;
    function GravarLancamentos_Agrupa(const CampoValor: string): boolean;
    function GravarLancTransporte: boolean;

    function Gerar_Dados_Relat_Transp_Coluna_Normal: boolean;
    function Gerar_Dados_Relat_Transp_Coluna_Agrupa: boolean;

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
    property OnProgresso: TOnProgRelTransporte read FOnProgRelTransporte write FOnProgRelTransporte;
  end;

implementation

uses uCtrlFuncoesRH;
//* Variants,
const
  NUM_COLUNAS = 6;

{ TCtrlRelTransporte }

constructor TCtrlRelTransporte.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;
  FSQL := TStringList.Create;
  FListaIdRubrica := TStringList.Create;
  FListaHorarios := TStringList.Create;

  SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FCdsDados := TCMClientDataSet.Create(nil);

  FCtrlRubricaIndiv := TCtrlRubricaIndiv.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCtrlRubricaIndiv.CdsRubricaIndiv := TCMClientDataSet.Create(nil);

  // Somente cria as classes se estiver na Aplicação Servidora ou
  // estiver no modo de execução Cliente Servidor em Duas Camadas
  if ((IsAppServer) or (ConnectionSide <> cnsClient)) then
  begin
    FCdsHorarioVariavel := TCMClientDataSet.Create(nil);
    FCdsTurno := TCMClientDataSet.Create(nil);
    FCdsTurnoDiario := TCMClientDataSet.Create(nil);

    FCtrlHorarioVariavel := TCtrlHorarioVariavel.Create;
    FCtrlTurnoSem := TCtrlTurnoSem.Create;
    FCtrlTurnoDia := TCtrlTurnoDia.Create;

    FDiasUteis := TDiasUteis.Create;
  end;
end;

destructor TCtrlRelTransporte.Destroy;
begin
  FSQL.Free;
  FListaIdRubrica.Free;
  FListaHorarios.Free;

  FCdsDados.Free;

  FCtrlRubricaIndiv.CdsRubricaIndiv.Free;
  FCtrlRubricaIndiv.Free;

  // Somente destruir as classes se estiver na Aplicação Servidora ou
  // estiver no modo de execução Cliente Servidor em Duas Camadas
  if ((IsAppServer) or (ConnectionSide <> cnsClient)) then
  begin
    FCdsHorarioVariavel.Free;
    FCdsTurno.Free;
    FCdsTurnoDiario.Free;

    FCtrlHorarioVariavel.Free;
    FCtrlTurnoSem.Free;
    FCtrlTurnoDia.Free;

    FDiasUteis.Free;
  end;

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

  // Somente cria as classes se estiver na Aplicação Servidora ou
  // estiver no modo de execução Cliente Servidor em Duas Camadas
  if ((IsAppServer) or (ConnectionSide <> cnsClient)) then
  begin
    FCtrlHorarioVariavel.InitializeAs(Self);
    FCtrlTurnoSem.InitializeAs(Self);
    FCtrlTurnoDia.InitializeAs(Self);

    FDiasUteis.InitializeAs(Self);
  end;
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
 //* FCtrlRubricaIndiv.DataBaseName := DataBaseName;

  // Somente cria as classes se estiver na Aplicação Servidora ou
  // estiver no modo de execução Cliente Servidor em Duas Camadas
  if ((IsAppServer) or (ConnectionSide <> cnsClient)) then
  begin
   //* FCtrlHorarioVariavel.DataBaseName := DataBaseName;
   //* FCtrlTurnoSem.DataBaseName := DataBaseName;
   //* FCtrlTurnoDia.DataBaseName := DataBaseName;
  end;
end;

procedure TCtrlRelTransporte.InicializarVariaveis(DataInicial, DataFinal: TDateTime;
  DescontaFeriados, DescontaFerias, DescontaFaltas: boolean; QuantDiasTrab, QuantDiasMinTrab,
  IdEmpresa, CodEmpresa: integer; GravarRubricaIncid: boolean; MesRef, AnoRef, MesRef_Faltas,
  AnoRef_Faltas: integer; IdRubricaIncid, IdRegraRubricaIncid: double;
  TipoAgrupamento: integer);
begin
  FDataInicial := DataInicial;
  FDataFinal := DataFinal;
  FNumDiasMes := Round(FDataFinal - FDataInicial)+1;
  FDescontarFeriados := DescontaFeriados;
  FDescontarFerias := DescontaFerias;
  FDescontarFaltas := DescontaFaltas;
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
      Add('  F.IDHORARIO,');
      Add('  HT.FLGTIPOHORARIO AS TIPOHORARIO,');
      Add('  HT.HORASFOLGA1,');
      Add('  HT.HORASSERVICO,');
      Add('  HT.HORASFOLGA2,');
      Add('  (CASE');
      Add('     WHEN PFFERIAS.INIGOZOFERIAS IS NULL THEN ''''');
      Add('     ELSE (CASE');
      Add('             WHEN PFFERIAS.INIGOZOFERIAS >= TO_DATE(' +
        QuotedStr(DateToStr(FDataInicial))+ ',''DD/MM/YYYY'') THEN TO_CHAR(PFFERIAS.INIGOZOFERIAS,''DD/MM/YYYY'')');
      Add('             ELSE ' +QuotedStr(DateToStr(FDataInicial)));
      Add('           END)');
      Add('   END) AS INICIOFERIAS,');
      Add('  (CASE');
      Add('     WHEN PFFERIAS.FIMGOZOFERIAS IS NULL THEN ''''');
      Add('     ELSE (CASE');
      Add('             WHEN PFFERIAS.FIMGOZOFERIAS <= TO_DATE(' +
        QuotedStr(DateToStr(FDataFinal))+ ',''DD/MM/YYYY'') THEN TO_CHAR(PFFERIAS.FIMGOZOFERIAS,''DD/MM/YYYY'')');
      Add('             ELSE ' +QuotedStr(DateToStr(FDataFinal)));
      Add('           END)');
      Add('   END) AS FIMFERIAS,');

      if not(RelatorioEmColuna) then
      begin
        Add('  PT.NOME AS EMPRESATRANSP,');
        Add('  LT.DESCRICAO AS NOMELINHA,');
      end;

      Add('  LP.QTDDIARIA AS QTDE_VALES,');
      Add('  LT.VLRLINHATRANSP AS VLR_TARIFA,');
      Add('  LT.IDLINHATRANSP AS IDLINHA,');
      Add('  LT.NUMLINHATRANSP AS NUMLINHA,');
      Add('  LT.TIPOLINHATRANSP AS TIPOLINHA,');
      Add('  DIASACUMULADOS.CODRUBCLT,');
      Add('  NVL(EXTRA.DIASEXTRAS,0) AS DIASEXTRA,');
      Add('  NVL(DIASACUMULADOS.VALORPROVENTO,0) AS VALOR');
      // ---------------------------------------------------------------------------- //
      Add('FROM');
      Add('  PESSOA PJ, PESSOA PF, ' +IFF(RelatorioEmColuna, '', 'PESSOA PT, ')+
        'ENDPESS E, FUNCIONARIO F,');
      Add('  HORATRAB HT, LINHATRANSP LT, LINHAXPESS LP,');
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

      if (FDescontarFerias) then
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
      Add('  (PF.IDPESSOA       = DIASACUMULADOS.IDPESSOA(+)) AND');
      Add('  (PF.IDPESSOA       = PFFERIAS.IDPESSOA(+)) AND');
      Add('  (PF.IDPESSOA       = EXTRA.IDPESSOA(+))');
      Add('ORDER BY');

      if (RelatorioEmColuna) then
      begin
        if (FTipoAgrupamento in [AGRUPA_TIPO, AGRUPA_TIPO_CARTAO]) then
        begin
          case (Ordenacao) of
            0 : Add('  EMPRESA, TIPOLINHA, FUNCIONARIO, IDFUNCIONARIO, NUMLINHA, LT.IDLINHATRANSP');
            1 : Add('  EMPRESA, TIPOLINHA, CENTROCUSTO, FUNCIONARIO, IDFUNCIONARIO, NUMLINHA, LT.IDLINHATRANSP');
            2 : Add('  EMPRESA, TIPOLINHA, CENTROCUSTO, MATRICULA, IDFUNCIONARIO, NUMLINHA, LT.IDLINHATRANSP');
            3 : Add('  EMPRESA, TIPOLINHA, MATRICULA, IDFUNCIONARIO, NUMLINHA, LT.IDLINHATRANSP');
          end;
        end
        else // NAO_AGRUPA
        begin
          case (Ordenacao) of
            0 : Add('  EMPRESA, FUNCIONARIO, IDFUNCIONARIO, TIPOLINHA, NUMLINHA, LT.IDLINHATRANSP');
            1 : Add('  EMPRESA, CENTROCUSTO, FUNCIONARIO, IDFUNCIONARIO, TIPOLINHA, NUMLINHA, LT.IDLINHATRANSP');
            2 : Add('  EMPRESA, CENTROCUSTO, MATRICULA, IDFUNCIONARIO, TIPOLINHA, NUMLINHA, LT.IDLINHATRANSP');
            3 : Add('  EMPRESA, MATRICULA, IDFUNCIONARIO, TIPOLINHA, NUMLINHA, LT.IDLINHATRANSP');
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
            0 : Add('  EMPRESA, FUNCIONARIO, EMPRESATRANSP, TIPOLINHA, NUMLINHA, LT.IDLINHATRANSP');
            1 : Add('  EMPRESA, CENTROCUSTO, FUNCIONARIO, EMPRESATRANSP, TIPOLINHA, NUMLINHA, LT.IDLINHATRANSP');
            2 : Add('  EMPRESA, CENTROCUSTO, MATRICULA, EMPRESATRANSP, TIPOLINHA, NUMLINHA, LT.IDLINHATRANSP');
            3 : Add('  EMPRESA, MATRICULA, EMPRESATRANSP, TIPOLINHA, NUMLINHA, LT.IDLINHATRANSP');
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

procedure TCtrlRelTransporte.IncProgresso(const NumReg: integer;
  const Incrementar, Termino: boolean);
begin
  if Assigned(OnProgresso) then
    OnProgresso(NumReg, Incrementar, Termino);
end;

function TCtrlRelTransporte.GetRelatTranspColuna_Em_Branco: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  0 AS IDPESSOA,'+CR_LF+
    '  LPAD(''1'',60,''1'') AS FUNCIONARIO,'+CR_LF+
    '  0 AS IDLINHA1,'+CR_LF+
    '  ''12345'' AS NUMLINHA1,'+CR_LF+
    '  0.00 AS QTDE_LINHA1,'+CR_LF+
    '  0.00 AS VAL_LINHA1,'+CR_LF+
    '  0 AS IDLINHA2,'+CR_LF+
    '  ''12345'' AS NUMLINHA2,'+CR_LF+
    '  0.00 AS QTDE_LINHA2,'+CR_LF+
    '  0.00 AS VAL_LINHA2,'+CR_LF+
    '  0 AS IDLINHA3,'+CR_LF+
    '  ''12345'' AS NUMLINHA3,'+CR_LF+
    '  0.00 AS QTDE_LINHA3,'+CR_LF+
    '  0.00 AS VAL_LINHA3,'+CR_LF+
    '  0 AS IDLINHA4,'+CR_LF+
    '  ''12345'' AS NUMLINHA4,'+CR_LF+
    '  0.00 AS QTDE_LINHA4,'+CR_LF+
    '  0.00 AS VAL_LINHA4,'+CR_LF+
    '  0 AS IDLINHA5,'+CR_LF+
    '  ''12345'' AS NUMLINHA5,'+CR_LF+
    '  0.00 AS QTDE_LINHA5,'+CR_LF+
    '  0.00 AS VAL_LINHA5,'+CR_LF+
    '  0 AS IDLINHA6,'+CR_LF+
    '  ''12345'' AS NUMLINHA6,'+CR_LF+
    '  0.00 AS QTDE_LINHA6,'+CR_LF+
    '  0.00 AS VAL_LINHA6,'+CR_LF+
    '  LPAD(''1'',60,''1'') AS EMPRESA,' +CR_LF+
    '  LPAD(''1'',60,''1'') AS ESTABELECIMENTO,' +CR_LF+
    '  LPAD(''1'',20,''1'') AS TIPOLINHA,' +CR_LF+
    '  ''12'' AS UF,'+CR_LF+
    '  LPAD(''1'',13,''1'') AS MATRICULA,' +CR_LF+
    '  ''1234567890'' AS CENTROCUSTO,' +CR_LF+
    '  LPAD(''1'',30,''1'') AS NOMECENTROCUSTO,' +CR_LF+
    '  0.00 AS QTDE_TOT_FUNC,'+CR_LF+
    '  0.00 AS VAL_TOT_FUNC,'+CR_LF+
    '  0.00 AS NUM_FUNC'+CR_LF+
    'FROM'+CR_LF+
    '  DUAL'+CR_LF+
    'WHERE'+CR_LF+
    '  (1 = 2)');
end;

function TCtrlRelTransporte.GetRelatTranspResumido_Em_Branco: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  LPAD(''1'',60,''1'') AS EMPRESA,' +CR_LF+
    '  LPAD(''1'',60,''1'') AS ESTABELECIMENTO,' +CR_LF+
    '  ''12'' AS UF,'+CR_LF+
    '  ''12345'' AS NUMLINHA,'+CR_LF+
    '  0.00 AS VAL_UNIT_LINHA,'+CR_LF+
    '  0.00 AS QTDE_LINHA,'+CR_LF+
    '  0.00 AS VAL_LINHA'+CR_LF+
    'FROM'+CR_LF+
    '  DUAL'+CR_LF+
    'WHERE'+CR_LF+
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

    IncProgresso(FCdsDados.RecordCount, false, false);

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

    IncProgresso(0, false, true);

    Result := true;
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
end;

function TCtrlRelTransporte.Gerar_Dados_Coluna(const ContaNumEmpregados: boolean): boolean;
var
  bOk: boolean;
begin
  Result := true;
  if not(FCdsDados.IsEmpty) then
  begin
    FQtdeTotal := 0;
    FValorTotal := 0;
    FNumTotPessoas := 0;
    FListaIdPessoas := '';

    FCdsTurnoDiario.Data := FCtrlTurnoDia.ListTurnoDiario;

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

      InitHorarioVariavel;
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
            FCdsRelTransporte.FieldByName('IDLINHA'+ IntToStr(iPos)).asString := FCdsDados.FieldByName('IDLINHA').asString;
            FCdsRelTransporte.FieldByName('NUMLINHA'+ IntToStr(iPos)).asString := FCdsDados.FieldByName('NUMLINHA').asString;
            FCdsRelTransporte.FieldByName('QTDE_LINHA'+ IntToStr(iPos)).asFloat := FQtdeLinhas;
            FCdsRelTransporte.FieldByName('VAL_LINHA'+ IntToStr(iPos)).asFloat := FCdsDados.FieldByName('VLR_TARIFA').asFloat;

            // Calcular o valor total da(s) linha(s) do funcionário
            FValorTotalFunc := FValorTotalFunc + FValorLinha;
            // Somar a quantidade de vales da linha do funcionário a Quantidade Total
            FQtdeTotal := FQtdeTotal + FQtdeLinhas;

            while (FIdPessoa  = FCdsDados.FieldByName('IDFUNCIONARIO').asFloat) and
                  (FIdLinha   = FCdsDados.FieldByName('IDLINHA').asString) and
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

      InitHorarioVariavel;
      CalcularDiasTrabalhados;
      if (FNumDiasTrab > 0) then
      begin
        IncNumTotPessoas;
        repeat
          sTipoLinhaAtual := sTipoLinha;
          if (FTipoAgrupamento = AGRUPA_TIPO_CARTAO) then
          begin
            if (Copy(sTipoLinhaAtual,1,1) = 'C') then // Cartão
              sTipoLinhaAtual := ('Cartão')
            else
              sTipoLinhaAtual := ('Outros');
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
          FCdsRelTransporte.FieldByName('MATRICULA').asString := FMatricula;
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
            FCdsRelTransporte.FieldByName('IDLINHA'+ IntToStr(iPos)).asString := FCdsDados.FieldByName('IDLINHA').asString;
            FCdsRelTransporte.FieldByName('NUMLINHA'+ IntToStr(iPos)).asString := FCdsDados.FieldByName('NUMLINHA').asString;
            FCdsRelTransporte.FieldByName('QTDE_LINHA'+ IntToStr(iPos)).asFloat := FQtdeLinhas;
            FCdsRelTransporte.FieldByName('VAL_LINHA'+ IntToStr(iPos)).asFloat := FCdsDados.FieldByName('VLR_TARIFA').asFloat;

            // Calcular o valor total da(s) linha(s) do funcionário
            FValorTotalFunc := FValorTotalFunc + FValorLinha;
            // Somar a quantidade de vales da linha do funcionário a Quantidade Total
            FQtdeTotal := FQtdeTotal + FQtdeLinhas;

            while (FIdPessoa  = FCdsDados.FieldByName('IDFUNCIONARIO').asFloat) and
                  (FIdLinha   = FCdsDados.FieldByName('IDLINHA').asString) and
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
  IncProgresso(0, true, false);
end;

function TCtrlRelTransporte.Gerar_Dados_Coluna_Resumido: boolean;
var
  c: byte;
  iQuantLinha, iPos: integer;
  _Linhas: TStringList;
begin
  _Linhas := TStringList.Create;
  try
    _Linhas.Sorted := true;
    try
      if not(FCdsRelTransporte.IsEmpty) then
      begin
        FCdsRelTransporte.First;
        while not(FCdsRelTransporte.EOF) do
        begin
        for c:=1 to NUM_COLUNAS do
        begin
            FIdLinha := FCdsRelTransporte.FieldByName('IDLINHA'+ IntToStr(c)).asString;
            FNumLinha := FCdsRelTransporte.FieldByName('NUMLINHA'+ IntToStr(c)).asString;
            iQuantLinha := FCdsRelTransporte.FieldByName('QTDE_LINHA'+ IntToStr(c)).asInteger;

            if (FIdLinha <> '') then
            begin
              iPos := _Linhas.IndexOf(FIdLinha);
              if (iPos > -1) then
                TLinha(_Linhas.Objects[iPos]).Quant := TLinha(_Linhas.Objects[iPos]).Quant + iQuantLinha
              else
              begin
                iPos := _Linhas.AddObject(FIdLinha, TLinha.Create);
                TLinha(_Linhas.Objects[iPos]).Num := FNumLinha;
                TLinha(_Linhas.Objects[iPos]).Quant := iQuantLinha;
                TLinha(_Linhas.Objects[iPos]).Val :=
                  FCdsRelTransporte.FieldByName('VAL_LINHA'+ IntToStr(c)).asFloat;
              end;
            end;
          end;
          FCdsRelTransporte.Next;
        end;

        for c:=0 to _Linhas.Count-1 do
        begin
          FCdsRelResumo.Insert;
          FCdsRelResumo.FieldByName('EMPRESA').asString := FCdsRelTransporte.FieldByName('EMPRESA').asString;
          FCdsRelResumo.FieldByName('ESTABELECIMENTO').asString := FCdsRelTransporte.FieldByName('ESTABELECIMENTO').asString;
          FCdsRelResumo.FieldByName('UF').asString := FCdsRelTransporte.FieldByName('UF').asString;
          FCdsRelResumo.FieldByName('NUMLINHA').asString := TLinha(_Linhas.Objects[c]).Num;
          FCdsRelResumo.FieldByName('VAL_UNIT_LINHA').asFloat := TLinha(_Linhas.Objects[c]).Val;
          FCdsRelResumo.FieldByName('QTDE_LINHA').asInteger := TLinha(_Linhas.Objects[c]).Quant;
          FCdsRelResumo.FieldByName('VAL_LINHA').asFloat :=
            TLinha(_Linhas.Objects[c]).Quant * TLinha(_Linhas.Objects[c]).Val;
          FCdsRelResumo.Post;
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
  finally
    _Linhas.Clear;
    _Linhas.Free;
  end;
end;

function TCtrlRelTransporte.Gerar_Dados_Linha(const ContaNumEmpregados: boolean): boolean;
begin
  Result := true;
  if not(FCdsDados.IsEmpty) then
  begin
    FNumTotPessoas := 0;
    FCdsTurnoDiario.Data := FCtrlTurnoDia.ListTurnoDiario;

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

        InitHorarioVariavel;
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
            FCdsRelTransporte.FieldByName('VAL_UNIT_LINHA').asFloat := FCdsDados.FieldByName('VLR_TARIFA').asFloat;
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
                FCdsRelTransporte.FieldByName('TIPOLINHA').asString := ('Cartão')
              else
                FCdsRelTransporte.FieldByName('TIPOLINHA').asString := ('Outros');
            end
            else // NAO_AGRUPA
              FCdsRelTransporte.FieldByName('TIPOLINHA').asString := '';

            FCdsRelTransporte.Post;

            // Calcular o valor total da(s) linha(s) do funcionário
            FValorTotalFunc := FValorTotalFunc + FValorLinha;

            while (FMatricula = FCdsDados.FieldByName('MATRICULA').asString) and
                  (FIdLinha   = FCdsDados.FieldByName('IDLINHA').asString) and
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

procedure TCtrlRelTransporte.InitHorarioVariavel;
begin
  FCdsHorarioVariavel.Data := FCtrlHorarioVariavel.ListHorarioVariavel(
    FIdPessoa, DateToStr(FDataInicial), DateToStr(FDataFinal));
  FListaHorarios.Clear;
  MontarListaHorarios;
  FCdsTurno.Data := FCtrlTurnoSem.ListDiasDaSemana(StrToInt(FListaHorarios[0]));
end;

procedure TCtrlRelTransporte.MontarListaHorarios;
var
  c: integer;
begin
  for c:=0 to FNumDiasMes-1 do
  begin
    FListaHorarios.Add(FCdsDados.FieldByName('IDHORARIO').asString);
    FCdsHorarioVariavel.First;
    while not(FCdsHorarioVariavel.EOF) do
    begin
      if (FCdsHorarioVariavel.FieldByName('DATAINI').asDateTime <= FDataInicial + c) and
         (FCdsHorarioVariavel.FieldByName('DATAFIM').asDateTime >= FDataInicial + c) then
      begin
        FListaHorarios.Add(FCdsHorarioVariavel.FieldByName('IDHORARIO').asString);
        break;
      end;
      FCdsHorarioVariavel.Next;
    end;
  end;
end;

procedure TCtrlRelTransporte.RefazHorario(DiaDoMes: integer);
begin
  if (FCdsTurno.FieldByName('IDHORARIO').asString <> FListaHorarios[DiaDoMes]) then
  begin
    FCdsTurno.Data := FCtrlTurnoSem.ListDiasDaSemana(StrToInt(FListaHorarios[DiaDoMes]));
    FCdsTurnoDiario.Locate('IDTURNODIARIO',
      FCdsTurno.FieldByName('IDTURNODIARIO').asInteger, []);
  end;
end;

function TCtrlRelTransporte.GetNumDiasTrab: integer;
var
  c: integer;
  bAchou: boolean;
  dtData: TDate;
begin
  Result := 0;
  for c:=0 to FNumDiasMes-1 do
  begin
    dtData := FDataInicial + c;

    // Verificar se o dia atual está dentro das férias
    if (FDescontarFerias) then
      if (dtData >= FInicioFerias) and (dtData <= FFinalFerias) then
        continue;

    // Verificar se o dia atual é um feriado
    if (FDescontarFeriados) then
      if (FDiasUteis.Feriado(dtData, FCdsDados.FieldByName('IDCIDADES').asInteger,
         FCdsDados.FieldByName('IDPAIS').asInteger,
         FCdsDados.FieldByName('UF').asString, false, true)) then
        continue;

    // Verificar se o dia atual está dentro do horário da pessoa
    RefazHorario(c);
    bAchou := FCdsTurno.Locate('IDDIASEMANA', DayOfWeek(dtData), []);

    if (bAchou) then
      Inc(Result);
  end;
end;

function TCtrlRelTransporte.GetNumDiasTrab_HorarioEscala: integer;
var
  c: integer;
  bDescFerias: boolean;
  dtData: TDate;
  dHora1, dTotHoras: double;
begin
  Result := 0;

  // Só deve fazer o restante caso a data de referência estiver preenchida
  if (FCdsDados.FieldByName('DATAREF').asDateTime = 0) or
     (FCdsDados.FieldByName('DATAREF').IsNull) then
    exit;

  // Verificar se a pessoa está em período de férias nas datas indicadas
  bDescFerias := (FDescontarFerias) and (FInicioFerias > 0) and (FFinalFerias > 0) and
    (FInicioFerias >= FDataInicial) and (FFinalFerias <= FDataFinal);

  if (FCodEmpresa = REFER) then
    Result := FNumDiasMes + 1
  else
  begin
    // Calcular o tatal de horas do ciclo de trabalho
    dTotHoras := FCdsDados.FieldByName('HORASFOLGA1').asFloat +
                FCdsDados.FieldByName('HORASSERVICO').asFloat +
                FCdsDados.FieldByName('HORASFOLGA2').asFloat;

    for c:=0 to FNumDiasMes-1 do
    begin
      dtData := FDataInicial + c;

      // Calcular a primera hora de trabalho dentro do período especificado
      dHora1 := RestoDivisao((dtData -
        FCdsDados.FieldByName('DATAREF').asDateTime) * 24, dTotHoras) +
        FCdsDados.FieldByName('HORASFOLGA1').asFloat;

      // Somente incrementar a quantidade de dias trabalhados se o dia
      // atual está dentro das férias ou não existir período de férias
      if (dHora1 < 24) then
      begin
        if (bDescFerias) then
        begin
          if (dtData < FInicioFerias) or (dtData > FFinalFerias) then
            Inc(Result);
        end
        else
          Inc(Result);
      end;
    end;
  end;
end;

function TCtrlRelTransporte.GetNumDiasFaltas: integer;
var
  bmRegistro: TBookMark;
  sMatricula, sCodRubCLT: string;
  iPosRub, // Somente para que o método Find de FListaIdRubrica possa ser usado
  iTotDiasFaltas, iTotDiasFaltasAbonadas: integer;
begin
  iTotDiasFaltas := 0;
  iTotDiasFaltasAbonadas := 0;

  bmRegistro := FCdsDados.GetBookMark;

  // Fazer os descontos dos dias de faltas e/ou afastamentos
  if (FDescontarFaltas) then
  begin
    FListaIdRubrica.Clear;
    sMatricula := FCdsDados.FieldByName('MATRICULA').asString;
    while (sMatricula = FCdsDados.FieldByName('MATRICULA').asString) and
          not(FCdsDados.EOF) do
    begin
      sCodRubCLT := FCdsDados.FieldByName('CODRUBCLT').asString;
      if (sCodRubCLT <> '') and not(FListaIdRubrica.Find(sCodRubCLT, iPosRub)) then
      begin
        // Total de Dias de Faltas Abonadas
        if (sCodRubCLT = '00006') then
        begin
          FListaIdRubrica.Add(sCodRubCLT);
          Inc(iTotDiasFaltasAbonadas, FCdsDados.FieldByName('VALOR').asInteger);
        end
        else
        if (sCodRubCLT = '00001') or // Total de Dias de Faltas
           (sCodRubCLT = '00024') or // Total de Dias de Afastamento por Doença
           (sCodRubCLT = '00034') or // Total de Dias de Suspensão
           (sCodRubCLT = '00039') or // Total de Dias de Afastamento pelo INSS por Doença
           (sCodRubCLT = '00041') or // Total de Dias de Licença Remunerada
           (sCodRubCLT = '00043') or // Total de Dias de Licença Não Remunerada
           (sCodRubCLT = '00570') or // Total de Dias de Afastamento Maternidade
           (sCodRubCLT = '00571') or // Total de Dias de Afastamento Paternidade
           (sCodRubCLT = '00574') or // Total de Dias de Afastamento por Natmorte
           (sCodRubCLT = '00696') or // Total de Dias de Afastamento Militar
           (sCodRubCLT = '00697') then // Total de Dias de Afastamento pelo INSS (Acidente de Trabalho)
        begin
          FListaIdRubrica.Add(sCodRubCLT);
          Inc(iTotDiasFaltas, FCdsDados.FieldByName('VALOR').asInteger);
        end;
      end;
      FCdsDados.Next;
    end;
  end;

  if (iTotDiasFaltas > 0) and (iTotDiasFaltasAbonadas > 0) then
    Result := iTotDiasFaltas - iTotDiasFaltasAbonadas
  else
    Result := iTotDiasFaltas;

  FCdsDados.GoToBookMark(bmRegistro);
  FCdsDados.FreeBookMark(bmRegistro);
end;

procedure TCtrlRelTransporte.CalcularDiasTrabalhados;
var
  iTotDiasDesc: integer;
begin
  FInicioFerias := StrDate(FCdsDados.FieldByName('INICIOFERIAS').asString);
  FFinalFerias := StrDate(FCdsDados.FieldByName('FIMFERIAS').asString);

  if (FQuantDiasTrab > 0) then
    FNumDiasTrab := FQuantDiasTrab
  else
  begin
    // Obter o número de dias trabalhados no mês
    case (FCdsDados.FieldByName('TIPOHORARIO').asInteger) of
      1 :  FNumDiasTrab := GetNumDiasTrab_HorarioEscala;
      else FNumDiasTrab := GetNumDiasTrab;
    end;

    // Obter a quantidade de dias de falta
    iTotDiasDesc := GetNumDiasFaltas;

    // Subtrair os dias trabalhados pela quantidade de dias de falta
    FNumDiasTrab := FNumDiasTrab - iTotDiasDesc;
    if (FNumDiasTrab < FQuantDiasMinTrab) then
      FNumDiasTrab := 0;
  end;    
end;

procedure TCtrlRelTransporte.CalcularValorLinha;
begin
  FIdLinha := FCdsDados.FieldByName('IDLINHA').asString;
  FNumLinha := FCdsDados.FieldByName('NUMLINHA').asString;
  FTipoLinha := FCdsDados.FieldByName('TIPOLINHA').asString;

  FQtdeLinhas := Round(FNumDiasTrab * FCdsDados.FieldByName('QTDE_VALES').asFloat) +
    Round(FCdsDados.FieldByName('DIASEXTRA').asInteger *
    FCdsDados.FieldByName('QTDE_VALES').asFloat);
  FValorLinha := FQtdeLinhas * FCdsDados.FieldByName('VLR_TARIFA').asFloat;
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

end.
