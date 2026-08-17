unit uCtrlDiasTrab;

interface

uses Classes, SysUtils, Controls, DB, DBClient, uCmControlObject, uCMTypes, uDiasUteis,
  uCtrlCustomRH, uCtrlHorarioVariavel, uCtrlTurnoSem, uCtrlTurnoDia;

type
  TRegListaAfastamentos = class
  public
    DataIni, DataFin: TDate;
  end;

  TCtrlDiasTrab = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure AfterInitialize; override;
  private
    FCtrlHorarioVariavel: TCtrlHorarioVariavel;
    FCtrlTurnoSem: TCtrlTurnoSem;
    FCtrlTurnoDia: TCtrlTurnoDia;

    FCdsPessoa: TClientDataSet;
    FCdsAfastPessoa: TClientDataSet;
    FCdsFaltasPessoa: TClientDataSet;
    FCdsDiasExtrasPessoa: TClientDataSet;
    FCdsHorarioVariavel: TClientDataSet;
    FCdsTurnoSemanal: TClientDataSet;
    FCdsTurnoDiario: TClientDataSet;

    FDiasUteis: TDiasUteis; // Objeto usado no verificação dos dias úteis no período
    FListaHorarios: TStringList; // Lista contendo os horários variáveis da pessoa
    FListaAfastamentos: TStringList;

    FSelDados: boolean;
    FSelDadosAfast: boolean;

    FIdPessoa: double; // ID da pessoa
    FNumDiasPeriodo: integer; // Quantidade de dias no período especificado

    FDataInicial: TDate; // Período Inicial a calcular as linhas de transporte
    FDataFinal: TDate; // Período Final a calcular as linhas de transporte
    FInicioFerias: TDate; // Período Inicial das férias da pessoa
    FFinalFerias: TDate; // Período Final das férias da pessoa

    FAnoMesDescFaltas: string; // Data de Referência das rubricas de Faltas

    FConsideraSituacao: boolean;
    FDescontarAfastamentos: boolean;
    FDescontarFerias: boolean;
    FDescontarFeriados: boolean;

    procedure SelDadosPessoa;
    procedure SelDadosAfastPessoa;
    procedure SelFaltasPessoa;
    procedure SelDiasExtrasPessoa;

    // Inicializar horário variável para a pessoa atual
    procedure InitHorarioVariavel;
    // Montar o horário variável para a pessoa atual
    procedure MontarListaHorarios;
    // Selecionar o horário de trabalho da pessoa para o dia (no caso de horário variável)
    procedure GetHorarioDia(DiaDoMes: integer);
    // Montar os períodos de afastamento
    procedure MontarPeriodosAfastamento;
    // Verificar se a data espeficiada está dentro de um período de afastamento
    function EmAfastamento(const Data: TDate): boolean;

    // Obter o número de dias trabalhados da pessoa que tem horário normal
    function GetNumDiasTrab_HorarioNormal: integer;
    // Obter o número de dias trabalhados da pessoa que tem horário escala
    function GetNumDiasTrab_HorarioEscala: integer;
    // Obter o número de dias extras da pessoa
    function GetNumDiasExtras: integer;
    // Obter o número de dias de falta da pessoa
    function GetNumDiasFaltas: integer;
  public
    constructor Create(SelDados: boolean = true); reintroduce;
    destructor  Destroy; override;

    function ListDadosAfast(IdPessoa: double; DatIni, DatFim: TDate): OleVariant;

    function Calcular(IdPessoa: double; ConsideraSituacao, DiasExtras, DescontarFaltas,
      DescontarAfastamentos, DescontarFerias, DescontarFeriados: boolean; DataInicial,
      DataFinal, InicioFerias, FinalFerias: TDate; MesDescFaltas: integer = 0; AnoDescFaltas: integer = 0): integer;

    property CdsPessoa: TClientDataSet read FCdsPessoa write FCdsPessoa;
    property CdsAfastPessoa: TClientDataSet read FCdsAfastPessoa write FCdsAfastPessoa;
  end;

implementation

uses uCtrlFuncoesRH;

{ TCtrlDiasTrab }

constructor TCtrlDiasTrab.Create(SelDados: boolean);
begin
  inherited Create;
  FDiasUteis := TDiasUteis.Create;

  FCtrlHorarioVariavel := TCtrlHorarioVariavel.Create;
  FCtrlTurnoSem := TCtrlTurnoSem.Create;
  FCtrlTurnoDia := TCtrlTurnoDia.Create;

  if (SelDados) then
    FCdsPessoa := TClientDataSet.Create(nil);

  FCdsHorarioVariavel := TClientDataSet.Create(nil);
  FCdsTurnoSemanal := TClientDataSet.Create(nil);
  FCdsTurnoDiario := TClientDataSet.Create(nil);

  FListaHorarios := TStringList.Create;
  FListaAfastamentos := TStringList.Create;

  FSelDados := SelDados;
end;

destructor TCtrlDiasTrab.Destroy;
begin
  FListaAfastamentos.Clear;

  FListaHorarios.Free;
  FListaAfastamentos.Free;

  FCdsTurnoDiario.Free;
  FCdsTurnoSemanal.Free;
  FCdsHorarioVariavel.Free;

  if (FSelDados) then
    FCdsPessoa.Free;

  if Assigned(FCdsFaltasPessoa) then
    FCdsFaltasPessoa.Free;
  if Assigned(FCdsDiasExtrasPessoa) then
    FCdsDiasExtrasPessoa.Free;

  FCtrlTurnoDia.Free;
  FCtrlTurnoSem.Free;
  FCtrlHorarioVariavel.Free;

  FDiasUteis.Free;
  inherited;
end;

procedure TCtrlDiasTrab.AfterInitialize;
begin
  inherited;
  FCtrlHorarioVariavel.InitializeAs(Self);
  FCtrlTurnoSem.InitializeAs(Self);
  FCtrlTurnoDia.InitializeAs(Self);
  FDiasUteis.InitializeAs(Self);

  FCdsTurnoDiario.Data := FCtrlTurnoDia.ListTurnoDiario;
end;

procedure TCtrlDiasTrab.DoChangeDataBase;
begin
  inherited;
  //*FCtrlHorarioVariavel.DataBaseName := DataBaseName;
  //*FCtrlTurnoSem.DataBaseName := DataBaseName;
  //*FCtrlTurnoDia.DataBaseName := DataBaseName;
  //*FDiasUteis.DataBaseName := DataBaseName;
end;

procedure TCtrlDiasTrab.SelDadosPessoa;
begin
  if (FSelDados) then
    FCdsPessoa.Data := GetDataPacket(
      'SELECT' +CR_LF+
      IFF(FConsideraSituacao, '  SF.TIPOSIT,' +CR_LF, '')+
      '  F.DATAADMISSAO, F.DATADESLIGAMENTO,' +CR_LF+
      '  E.IDCIDADES, ES.IDPAIS, ES.CODESTADO AS UF,' +CR_LF+
      '  F.DATAREFHORARIO AS DATAREF, F.IDHORARIO,' +CR_LF+
      '  HT.FLGTIPOHORARIO AS TIPOHORARIO, HT.HORASFOLGA1,' +CR_LF+
      '  HT.HORASSERVICO, HT.HORASFOLGA2' +CR_LF+
      'FROM' +CR_LF+
      '  PESSOA PJ, PESSOA PF, FUNCIONARIO F, ENDPESS E, CIDADES CI, ESTADO ES, HORATRAB HT' +
      IFF(FConsideraSituacao, ', SITFUNC SF', '') +CR_LF+
      'WHERE' +CR_LF+
      '  (F.IDPESSOA        = ' +FloatToStr(FIdPessoa)+ ') AND' +CR_LF+
      IFF(FConsideraSituacao, '  (F.IDSITFUNC       = SF.IDSITFUNC) AND' +CR_LF, '')+
      '  (F.IDHORARIO       = HT.IDHORARIO) AND' +CR_LF+
      '  (F.IDPESSOA        = PF.IDPESSOA) AND' +CR_LF+
      '  (F.IDESTAB         = PJ.IDPESSOA) AND' +CR_LF+
      '  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND' +CR_LF+
      '  (PJ.IDPESSOA       = E.IDPESSOA) AND' +CR_LF+
      '  (E.IDCIDADES       = CI.IDCIDADES) AND' +CR_LF+
      '  (CI.IDESTADO       = ES.IDESTADO)');
end;

function TCtrlDiasTrab.ListDadosAfast(IdPessoa: double; DatIni, DatFim: TDate): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  H.DATASITFUNC, SF.TIPOSIT' +CR_LF+
    'FROM' +CR_LF+
    '  HSTSITFUNC H, SITFUNC SF' +CR_LF+
    'WHERE' +CR_LF+
    '  (SF.TIPOSIT    <> ''D'') AND' +CR_LF+
    '  (H.IDPESSOA     = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (H.IDSITFUNC    = SF.IDSITFUNC) AND' +CR_LF+
    '  (H.DATASITFUNC >= TO_DATE(' +QuotedStr(DateToStr(DatIni))+ ',''DD/MM/YYYY'')) AND' +CR_LF+
    '  (H.DATASITFUNC <= TO_DATE(' +QuotedStr(DateToStr(DatFim))+ ',''DD/MM/YYYY''))' +CR_LF+
    'ORDER BY' +CR_LF+
    '  H.DATASITFUNC');
end;

procedure TCtrlDiasTrab.SelDadosAfastPessoa;
begin
  if (FSelDadosAfast) then
    FCdsAfastPessoa.Data := ListDadosAfast(FIdPessoa, FDataInicial, FDataFinal);
end;

procedure TCtrlDiasTrab.SelFaltasPessoa;
begin
  if not(Assigned(FCdsFaltasPessoa)) then
    FCdsFaltasPessoa := TClientDataSet.Create(nil);

  FCdsFaltasPessoa.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  PD.CODRUBCLT, H.VALORPROVENTO AS VALOR' +CR_LF+
    'FROM' +CR_LF+
    '  HISTRUBSAL H, PROVDESC PD' +CR_LF+
    'WHERE' +CR_LF+
    '  (H.IDPESSOA      = ' +FloatToStr(FIdPessoa)+ ') AND' +CR_LF+
    '  (H.MES           = ' +QuotedStr(FAnoMesDescFaltas)+ ') AND' +CR_LF+
    '  (PD.CODRUBCLT LIKE (''00%'')) AND' +CR_LF+
    '  (PD.IDPROVENTO   = H.IDRUBRICA)');
end;

procedure TCtrlDiasTrab.SelDiasExtrasPessoa;
begin
  if not(Assigned(FCdsDiasExtrasPessoa)) then
    FCdsDiasExtrasPessoa := TClientDataSet.Create(nil);

  FCdsDiasExtrasPessoa.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  COUNT(*) AS QUANT' +CR_LF+
    'FROM' +CR_LF+
    '  DIAEXTRATRAB' +CR_LF+
    'WHERE' +CR_LF+
    '  (IDPESSOA = ' +FloatToStr(FIdPessoa)+ ') AND' +CR_LF+
    '  (DIATRAB >= TO_DATE('+QuotedStr(DateToStr(FDataInicial))+',''DD/MM/YYYY'')) AND' +CR_LF+
    '  (DIATRAB <= TO_DATE('+QuotedStr(DateToStr(FDataFinal))+',''DD/MM/YYYY''))' +CR_LF+
    'GROUP BY' +CR_LF+
    '  IDPESSOA');
end;

procedure TCtrlDiasTrab.InitHorarioVariavel;
begin
  FCdsHorarioVariavel.Data := FCtrlHorarioVariavel.ListHorarioVariavel(
    FIdPessoa, DateToStr(FDataInicial), DateToStr(FDataFinal));
  FListaHorarios.Clear;
  MontarListaHorarios;
  FCdsTurnoSemanal.Data := FCtrlTurnoSem.ListDiasDaSemana(StrToInt(FListaHorarios[0]));
end;

procedure TCtrlDiasTrab.MontarListaHorarios;
var
  c: integer;
begin
  for c:=0 to FNumDiasPeriodo-1 do
  begin
    FListaHorarios.Add(FCdsPessoa.FieldByName('IDHORARIO').asString);
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

procedure TCtrlDiasTrab.GetHorarioDia(DiaDoMes: integer);
begin
  if (FCdsTurnoSemanal.FieldByName('IDHORARIO').asString <> FListaHorarios[DiaDoMes]) then
  begin
    FCdsTurnoSemanal.Data := FCtrlTurnoSem.ListDiasDaSemana(StrToInt(FListaHorarios[DiaDoMes]));
    FCdsTurnoDiario.Locate('IDTURNODIARIO',
      FCdsTurnoSemanal.FieldByName('IDTURNODIARIO').asInteger, []);
  end;
end;

procedure TCtrlDiasTrab.MontarPeriodosAfastamento;
var
  dtDataIni, dtDataFin: TDate;
begin
  if not(FDescontarAfastamentos) then
    exit;

  FListaAfastamentos.Clear;
  FCdsAfastPessoa.First;
  while not(FCdsAfastPessoa.EOF) do
  begin
    // Retornou de um Afastamento ocorrido antes do Início do Período
    if (FCdsAfastPessoa.RecNo = 1) and
       (FCdsAfastPessoa.FieldByName('TIPOSIT').asString = 'A') and
       (FCdsAfastPessoa.FieldByName('DATASITFUNC').asDateTime <>
        FCdsPessoa.FieldByName('DATAADMISSAO').asDateTime) then
    begin
      dtDataIni := FDataInicial;
      dtDataFin := FCdsAfastPessoa.FieldByName('DATASITFUNC').asDateTime-1;
    end
    else // Afastamento e Retorno no mesmo mês OU Afastamento até outro mês
    begin
      // Período Inicial (Afastamento)
      dtDataIni := FCdsAfastPessoa.FieldByName('DATASITFUNC').asDateTime;

      // Período Final (Retorno)
      if (FCdsAfastPessoa.RecNo = FCdsAfastPessoa.RecordCount) then
        dtDataFin := FDataFinal
      else
      begin
        FCdsAfastPessoa.Next;
        dtDataFin := FCdsAfastPessoa.FieldByName('DATASITFUNC').asDateTime-1;
      end;
    end;

    // Inserir o registro de Afastamento - Retorno
    FListaAfastamentos.AddObject(IntToStr(FCdsAfastPessoa.RecNo), TRegListaAfastamentos.Create);
    TRegListaAfastamentos(FListaAfastamentos.Objects[FCdsAfastPessoa.RecNo-1]).DataIni := dtDataIni;
    TRegListaAfastamentos(FListaAfastamentos.Objects[FCdsAfastPessoa.RecNo-1]).DataFin := dtDataFin;

    FCdsAfastPessoa.Next;    
  end;
end;

function TCtrlDiasTrab.EmAfastamento(const Data: TDate): boolean;
var
  c: byte;
begin
  if (FListaAfastamentos.Count > 0) then
    for c:=0 to FListaAfastamentos.Count-1 do
      if (Data >= TRegListaAfastamentos(FListaAfastamentos.Objects[c]).DataIni) and
         (Data <= TRegListaAfastamentos(FListaAfastamentos.Objects[c]).DataFin) then
      begin
        Result := true;
        exit;
      end;

  Result := false;
end;

function TCtrlDiasTrab.GetNumDiasTrab_HorarioNormal: integer;
var
  c: integer;
  bAchou: boolean;
  dtData: TDate;
begin
  Result := 0;
  for c:=0 to FNumDiasPeriodo-1 do
  begin
    dtData := FDataInicial + c;

    // Não contar o dia atual se está dentro de algum afastamento
    if (FDescontarAfastamentos) then
      if (EmAfastamento(dtData)) then
        continue;

    // Não contar o dia atual se está dentro das férias
    if (FDescontarFerias) then
      if (dtData >= FInicioFerias) and (dtData <= FFinalFerias) then
        continue;

    // Não contar o dia atual se é um feriado
    if (FDescontarFeriados) then
      if (FDiasUteis.Feriado(dtData, FCdsPessoa.FieldByName('IDCIDADES').asInteger,
          FCdsPessoa.FieldByName('IDPAIS').asInteger,
          FCdsPessoa.FieldByName('UF').asString, false, true)) then
        continue;

    // Verificar se o dia atual está dentro do horário da pessoa
    GetHorarioDia(c);
    bAchou := FCdsTurnoSemanal.Locate('IDDIASEMANA', DayOfWeek(dtData), []);

    if (bAchou) then
      Inc(Result);
  end;
end;

function TCtrlDiasTrab.GetNumDiasTrab_HorarioEscala: integer;
var
  c: integer;
  bDescFerias: boolean;
  dtData: TDate;
  dHora1, dTotHoras: double;
begin
  Result := 0;

  // Só deve fazer o restante caso a data de referência estiver preenchida
  if (FCdsPessoa.FieldByName('DATAREF').asDateTime = 0) or
     (FCdsPessoa.FieldByName('DATAREF').IsNull) then
    exit;

  // Verificar se a pessoa está em período de férias nas datas indicadas
  bDescFerias := (FDescontarFerias) and (FInicioFerias > 0) and (FFinalFerias > 0) and
    (FInicioFerias >= FDataInicial) and (FFinalFerias <= FDataFinal);

  // Calcular o tatal de horas do ciclo de trabalho
  dTotHoras := FCdsPessoa.FieldByName('HORASFOLGA1').asFloat +
               FCdsPessoa.FieldByName('HORASSERVICO').asFloat +
               FCdsPessoa.FieldByName('HORASFOLGA2').asFloat;

  for c:=0 to FNumDiasPeriodo-1 do
  begin
    dtData := FDataInicial + c;

    // Não contar o dia atual se está dentro de algum afastamento
    if (FDescontarAfastamentos) then
      if (EmAfastamento(dtData)) then
        continue;

    // Calcular a primera hora de trabalho dentro do período especificado
    dHora1 := RestoDivisao((dtData -
      FCdsPessoa.FieldByName('DATAREF').asDateTime) * 24, dTotHoras) +
      FCdsPessoa.FieldByName('HORASFOLGA1').asFloat;

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

function TCtrlDiasTrab.GetNumDiasExtras: integer;
begin
  // Abrir a query de dias extras
  SelDiasExtrasPessoa;

  Result := FCdsDiasExtrasPessoa.FieldByName('QUANT').asInteger;
end;

function TCtrlDiasTrab.GetNumDiasFaltas: integer;
var
  sListaCodRubCLT, sCodRubCLT: string;
  iTotDiasFaltas, iTotDiasFaltasAbonadas: integer;
begin
  iTotDiasFaltas := 0;
  iTotDiasFaltasAbonadas := 0;

  // Abrir a query de faltas
  SelFaltasPessoa;
  
  // Fazer os descontos dos dias de faltas e/ou afastamentos
  sListaCodRubCLT := '';
  while not(FCdsFaltasPessoa.EOF) do
  begin
    sCodRubCLT := FCdsFaltasPessoa.FieldByName('CODRUBCLT').asString;
    if (sCodRubCLT <> '') and (VerificaCodigoEm(sListaCodRubCLT, sCodRubCLT, ',') < 1) then
    begin
      // Total de Dias de Faltas Abonadas
      if (sCodRubCLT = '00006') then
      begin
        InserirCodigoEm(sListaCodRubCLT, sCodRubCLT);
        Inc(iTotDiasFaltasAbonadas, FCdsFaltasPessoa.FieldByName('VALOR').asInteger);
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
        InserirCodigoEm(sListaCodRubCLT, sCodRubCLT);
        Inc(iTotDiasFaltas, FCdsFaltasPessoa.FieldByName('VALOR').asInteger);
      end;
    end;
    FCdsFaltasPessoa.Next;
  end;

  if (iTotDiasFaltas > 0) and (iTotDiasFaltasAbonadas > 0) then
    Result := iTotDiasFaltas - iTotDiasFaltasAbonadas
  else
    Result := iTotDiasFaltas;
end;

function TCtrlDiasTrab.Calcular(IdPessoa: double; ConsideraSituacao, DiasExtras,
  DescontarFaltas, DescontarAfastamentos, DescontarFerias, DescontarFeriados: boolean;
  DataInicial, DataFinal, InicioFerias, FinalFerias: TDate; MesDescFaltas, AnoDescFaltas: integer): integer;
begin
  FConsideraSituacao := ConsideraSituacao;
  FDescontarAfastamentos := DescontarAfastamentos;
  FDescontarFerias := DescontarFerias;
  FDescontarFeriados := DescontarFeriados;
  FDataInicial := DataInicial;
  FDataFinal := DataFinal;
  FInicioFerias := InicioFerias;
  FFinalFerias := FinalFerias;
  FIdPessoa := IdPessoa;

  if (DescontarFaltas) then
    FAnoMesDescFaltas := IntToStr(AnoDescFaltas) +'/'+ PoeZero(MesDescFaltas);

  FSelDadosAfast := (FDescontarAfastamentos) and not(Assigned(FCdsAfastPessoa));
  if (FSelDadosAfast) then
    FCdsAfastPessoa := TClientDataSet.Create(nil);

  try
    SelDadosPessoa;
    if (FCdsPessoa.FieldByName('IDHORARIO').asString = '') then
    begin
      if (FSelDadosAfast) then
        FreeObject(FCdsAfastPessoa, true);
      Result := 0;
      exit;
    end;

    SelDadosAfastPessoa;

    if (ConsideraSituacao) then
    begin
      // Para Demitidos:
      // * Se a Pessoa foi Admitida e Demitida dentro do Período especificado, as
      // Datas a Considerar serão a Data de Admissão e de desligamento, respectivamente.
      //
      // * Se a Data do Desligamento for menor que a Data Final a Considerar e ambas estão
      // no mesmo mês, a Data Final a Considerar será a Data do Desligamento.
      //
      // * Se a Data do Desligamento for menor que a Data Final a Considerar e elas estão
      // em meses diferentes, deve-se retornar ZERO.
      // ---------------
      // Para Admitidos:
      // * Se a Data da Admissão for maior que a Data Inicial a Considerar e ambas estão
      // no mesmo mês, a Data Inicial a Considerar será a Data do Admissão.
      //
      // * Outros casos deve-se retornar ZERO.
      if (FCdsPessoa.FieldByName('TIPOSIT').asString = 'D') then
      begin
        if (FCdsPessoa.FieldByName('DATADESLIGAMENTO').asDateTime < DataFinal) then
        begin
          if (FCdsPessoa.FieldByName('DATAADMISSAO').asDateTime > DataInicial) then
          begin
            DataInicial := FCdsPessoa.FieldByName('DATAADMISSAO').asDateTime;
            DataFinal := FCdsPessoa.FieldByName('DATADESLIGAMENTO').asDateTime;
          end
          else
          if (FormatDateTime('yyyymm',FCdsPessoa.FieldByName('DATADESLIGAMENTO').asDateTime) =
              FormatDateTime('yyyymm',DataFinal)) then
            DataFinal := FCdsPessoa.FieldByName('DATADESLIGAMENTO').asDateTime
          else
          begin
            Result := 0;
            exit;
          end;
        end;
      end
      else
      begin
        if (FCdsPessoa.FieldByName('DATAADMISSAO').asDateTime > DataInicial) then
        begin
          if (FormatDateTime('yyyymm',FCdsPessoa.FieldByName('DATAADMISSAO').asDateTime) =
              FormatDateTime('yyyymm',DataInicial)) then
            DataInicial := FCdsPessoa.FieldByName('DATAADMISSAO').asDateTime
          else
          begin
            Result := 0;
            exit;
          end;
        end;
      end;
    end;

    FNumDiasPeriodo := Round(DataFinal - DataInicial) + 1;
    if (FNumDiasPeriodo <= 0) then
      Result := 0
    else
    begin
      InitHorarioVariavel;
      MontarPeriodosAfastamento;

      // Obter o número de dias trabalhados no mês
      case (FCdsPessoa.FieldByName('TIPOHORARIO').asInteger) of
        1 :  Result := GetNumDiasTrab_HorarioEscala;
        else Result := GetNumDiasTrab_HorarioNormal;
      end;

      // Subtrair os dias trabalhados pela quantidade de dias de falta
      if (DiasExtras) then
        Result := Result + GetNumDiasExtras;

      // Subtrair os dias trabalhados pela quantidade de dias de falta
      if (DescontarFaltas) then
        Result := Result - GetNumDiasFaltas;
    end;
  finally
    if (FSelDadosAfast) then
      FreeObject(FCdsAfastPessoa, true);
  end;
end;

end.
