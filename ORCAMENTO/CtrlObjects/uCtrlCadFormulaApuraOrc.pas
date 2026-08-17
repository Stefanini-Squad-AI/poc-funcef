{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marcio Motta                    }
{ Atualizado Em: 24/06/2005                             }
{                                                       }
{*******************************************************}


unit uCtrlCadFormulaApuraOrc;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCmTypes,
     uDbFormOrcado, uDbFormasApuraOrc, Classes, Db, DbClient, JclMath, udiasUteis,
     UFuncaoGeral, uCtrlPadroes, uCtrlSaldoorcado, uCtrlOrcamento;

Type
  TCtrlCadFormulaApuraOrc = class(TCmControlObject)
  private
    FCdsFormOrcado    : TCMClientDataSet;
    FCdsFormasApuraOrc: TCMClientDataSet;


    FDbFormOrcado    : TDbFormOrcado;
    FDbFormasApuraOrc: TDbFormOrcadoDet;
    FbCancelaProcApura: Boolean;

    CtrlOrcamentoBack : TOrcamentoBackMT;
    procedure SetCdsFormOrcado(const Value: TCMClientDataSet);
    procedure SetCdsFormasApuraOrc(const Value: TCMClientDataSet);
    procedure SetDbFormOrcado(const Value: TDbFormOrcado);
    procedure SetDbFormOrcadoDet(const Value: TDbFormOrcadoDet);
    procedure SetbCancelaProcApura(const Value: Boolean);


  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbFormOrcado       : TDbFormOrcado    read FDbFormOrcado      write SetDbFormOrcado;
    property DbFormasApuraOrc   : TDbFormOrcadoDet read FDbFormasApuraOrc  write SetDbFormOrcadoDet;
    property CdsFormOrcado      : TCMClientDataSet read FCdsFormOrcado     write SetCdsFormOrcado;
    property CdsFormasApuraOrc  : TCMClientDataSet read FCdsFormasApuraOrc write SetCdsFormasApuraOrc;

    property bCancelaProcApura : Boolean read FbCancelaProcApura write SetbCancelaProcApura;

    function GravarCadFormulaApuraOrc : Boolean;
    function ExcluirCadFormulaApuraOrc : Boolean;

    function ListaFormulaApuraOrc(idFormula: Double = 0): Olevariant;
    function ListaFormasApuracao(idFormula: Double): Olevariant;

    function ProcessaGeracaoOrc(const iExercicioOrigem: integer;
                                const iPeriodoOrigem: integer;
                                const iExercicioDest: integer;
                                const iPeriodoDestIni: integer;
                                const iPeriodoDestFim: integer;
                                const iIdPessoa: integer;
                                const iIdPlanoOrcamen: integer;
                                const iIdformorcado: integer;
                                const iContaIni: integer = 0;
                                const iContaDigtos: integer = 0;
                                const sContaConteudo: string = ''): Olevariant;

    function GravaSimulacao(const ovdados : Olevariant): boolean;
    function ExcluiDestino(const iIdPlanoOrcamen,
                                 iIdPessoa, iExercicio, iPeriodoIni, iPeriodoFim, iContaIni,
                                 iContaDigtos: integer; const sContaConteudo: string;
                                 const idformorcado: integer): Boolean;

    function GetOrcGerado(const iIdPlanoOrcamen, iIdPessoa, iExercicio, iPeriodoIni,
                          iPeriodoFim, idformorcado: integer; iIdcontarcamen: string): OleVariant;

  private

    function GetContasXFornula(const iIdPlanoOrcamen: integer;  const iIdPessoa: integer): olevariant;
    function GetDadosEntrada(const iIdPlanoOrcamen: integer;  const iIdPessoa: integer;
                             const iExercicioOrigem: integer; const iPeriodoOrigem: integer;
                             const idFormaApuracao: integer;  const iDformOrcado: integer = 0;
                             const iContaIni: integer = 0;
                             const iContaDigtos: integer = 0;
                             const sContaConteudo: string = '';
                             const sIdcontasOrcamen : string = ''
                             ): Olevariant;

    function GetContas(const iIdPlanoOrcamen: integer;  const iIdPessoa: integer;
                       const iContaIni: integer = 0;
                       const iContaDigtos: integer = 0; const sContaConteudo: string = '';
                       const idformorcado: integer = -1 ): olevariant;

    function acumulaMoeda(const DataIni, DataFim: TDateTime;
                          const moecodigo : integer): extended;

    function acumulaPercentual(const DataIni, DataFim: TDateTime;
                               const valorIni: extended): extended;


  published

end;


implementation

{ TCtrlCadFormulaApuraOrc }

procedure TCtrlCadFormulaApuraOrc.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    begin
      FDbFormOrcado.DataBaseName     := DataBaseName;
      FDbFormasApuraOrc.DataBaseName := DataBaseName;
    end
  else
    begin
      FDbFormOrcado.DbAdoConnection     := DbAdoConnection;
      FDbFormasApuraOrc.DbAdoConnection := DbAdoConnection;
    end;

  CtrlOrcamentoBack.InitializeAs(self);  
end;


procedure TCtrlCadFormulaApuraOrc.OnCreateAppServer;
begin
  inherited;
  FCdsFormOrcado := TCMClientDataSet.Create(nil);
  FCdsFormasApuraOrc  := TCMClientDataSet.Create(nil);
end;


constructor TCtrlCadFormulaApuraOrc.Create;
begin
  inherited;
  FbCancelaProcApura := false;
  FDbFormOrcado     := TDbFormOrcado.Create(self);
  FDbFormasApuraOrc := TDbFormOrcadoDet.Create(self);
  CtrlOrcamentoBack := TOrcamentoBackMT.Create;
end;


destructor TCtrlCadFormulaApuraOrc.Destroy;
begin
  FDbFormOrcado.Free;
  FDbFormasApuraOrc.Free;
  FreeAndNil(CtrlOrcamentoBack);
  if IsAppServer then FCdsFormOrcado.Free;
  inherited;
end;


function TCtrlCadFormulaApuraOrc.GravarCadFormulaApuraOrc: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
    begin
      Result := Connection.AppServer.GravarCadFormulaApuraOrc;
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
  else
    begin
      try
        StartTransaction;

        // Pai
        Result := ApplyCds(CdsFormOrcado, // Cds_PAI
                           DbFormOrcado,  // DbCtrl_PAI
                           [],
                           []);

        Msg := DbFormOrcado.MessageInfo;

        if not Result then
          raise Exception.Create( Msg );

        // Filhos
        Result := ApplyCds(CdsFormasApuraOrc,               // Cds_FILHO
                           DbFormasApuraOrc,                // DbCtrl_FILHO
                           [DbFormOrcado.IdFormOrcado],     // ID_PAI
                           [DbFormasApuraOrc.IdFormOrcado]);// Campo onde será gravado o ID_PAI

        Msg := DbFormasApuraOrc.MessageInfo;

        if not Result then
          raise Exception.Create( Msg );

        Commit;
      except
        on E : Exception do
          begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
          end;
      end;
    end;
end;


procedure TCtrlCadFormulaApuraOrc.SetDbFormOrcado(const Value: TDbFormOrcado);
begin
  FDbFormOrcado := Value;
end;


procedure TCtrlCadFormulaApuraOrc.SetDbFormOrcadoDet(const Value: TDbFormOrcadoDet);
begin
  FDbFormasApuraOrc := Value;
end;

function TCtrlCadFormulaApuraOrc.ListaFormulaApuraOrc(idFormula: Double): Olevariant;
// Função para LISTAR as Fórmulas cadastradas //

var
  sSql : TStringList;
  cdsAux : TClientDataSet;
begin
  sSql := TStringList.Create;
  cdsAux := TClientDataSet.Create(nil);
  try
    sSql.Add('SELECT IDFORMORCADO, ');
    sSql.Add('       NOME, ');
    sSql.Add('       DESCRICAO,');
    sSql.Add('       BASEARREDONDAMENTO, ');
    sSql.Add('       BASECALCULO ');
    sSql.Add('  FROM FORMORCADO ');

    if idFormula <> 0 then
      sSql.Add(' WHERE IDFORMORCADO = ' + IntToStr(Trunc(idFormula)));

    cdsAux.Data := GetDataPacket(sSql);
    Result      := cdsAux.Data;
  finally
    FreeAndNil(sSql);
    FreeAndNil(cdsAux);
  end;
end;

function TCtrlCadFormulaApuraOrc.ListaFormasApuracao(idFormula: Double): Olevariant;
// Função para LISTAR os registros FILHOS das Fórmulas cadastradas //

var
  sSql : TStringList;
  cdsAux : TClientDataSet;
begin
  sSql := TStringList.Create;
  cdsAux := TClientDataSet.Create(nil);
  try
    sSql.Add('SELECT FD.IDFORMORCADODET, ');
    sSql.Add('       FD.IDFORMAAPURACAO, ');
    sSql.Add('       FD.IDFORMORCADO, ');
    sSql.Add('       FD.MOECODIGO, ');
    sSql.Add('       FD.DATA, ');
    sSql.Add('       FD.PERIODOINI, ');
    sSql.Add('       FD.PERIODOFIM, ');
    sSql.Add('       FD.PERCENTUAL, ');
    sSql.Add('       FD.FLGACUMPERC, ');
    sSql.Add('       FD.FLGACUMULAMOEDA, ');
    sSql.Add('       MO.MOEDESC, ');
    sSql.Add('       MO.MOESIGLA, ');
    sSql.Add('       DECODE(FD.IDFORMAAPURACAO, 1, ''Moviment. Último Mês Apurado'', ');
    sSql.Add('                                  2, ''Média Moviment. dos Meses'', ');
    sSql.Add('                                  3, ''Somatório Moviment. dos Meses'', ');
    sSql.Add('                                  4, ''Período a Período'', ');
    sSql.Add('                                  5, ''Orçado do Mês anterior'', ');    
    sSql.Add('                                     ''Não Definida'') AS FORMAAPURACAO ');

    sSql.Add('  FROM FORMORCADODET FD, ');
    sSql.Add('       MOEDA MO ');

    sSql.Add(' WHERE FD.IDFORMORCADO = ' + IntToStr(Trunc(idFormula)));
    sSql.Add('   AND FD.MOECODIGO = MO.MOECODIGO(+) ');

    cdsAux.Data := GetDataPacket(sSql);
    Result      := cdsAux.Data;
  finally
    FreeAndNil(sSql);
    FreeAndNil(cdsAux);
  end;

end;

procedure TCtrlCadFormulaApuraOrc.SetCdsFormOrcado(const Value: TCMClientDataSet);
begin
  FCdsFormOrcado := Value;
end;

procedure TCtrlCadFormulaApuraOrc.SetCdsFormasApuraOrc(const Value: TCMClientDataSet);
begin
  FCdsFormasApuraOrc := Value;
end;

function TCtrlCadFormulaApuraOrc.ExcluirCadFormulaApuraOrc: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
    begin
      Result := Connection.AppServer.ExcluirCadFormulaApuraOrc;
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
  else
    begin
      try
        StartTransaction;

        // Filhos
        CdsFormasApuraOrc.First;
        while not CdsFormasApuraOrc.Eof do
          CdsFormasApuraOrc.Delete;

        Result := ApplyCds(CdsFormasApuraOrc,
                           DbFormasApuraOrc,
                           [],
                           []);

        Msg := DbFormasApuraOrc.MessageInfo;

        if not Result then
          raise Exception.Create( Msg );


        Result := ApplyCds(CdsFormOrcado,
                           DbFormOrcado,
                           [],
                           []);

        Msg := DbFormOrcado.MessageInfo;

        if not Result then
          raise Exception.Create( Msg );

        Commit;
      except
        on E : Exception do
          begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
          end;
      end;
    end;
end;


//faz a simulação do orcamento baseado na fórmula
function TCtrlCadFormulaApuraOrc.ProcessaGeracaoOrc(const iExercicioOrigem: integer;
                                                    const iPeriodoOrigem: integer;
                                                    const iExercicioDest: integer;
                                                    const iPeriodoDestIni: integer;
                                                    const iPeriodoDestFim: integer;
                                                    const iIdPessoa: integer;
                                                    const iIdPlanoOrcamen: integer;
                                                    const iIdformorcado: integer;
                                                    const iContaIni: integer = 0;
                                                    const iContaDigtos: integer = 0;
                                                    const sContaConteudo: string = ''): Olevariant;


var  cdsPeriodo, cdsOrgGerado, cdsContasOrc, cdsFormula, cdsDados, cdsAux, cdsSaida, cdsFormXconta, cdsMoeda : TclientDataset;
     sSql, sMsg, sSqlFormula, sIdcontOrcProc : string;
     iper, iperIni, iPerFim, iValMin, iValMax, iValCorr, iPerProc : integer;
     funcaoGeral : TFuncaoGeral;
     cotacaoAcum: Extended;
     DiasUteis : TDiasUteis;

function arredondaFloat(Valor: double; tipoArred: integer): double;
var sVal: string;
    valf : double;
begin
  sVal := '';
  case tipoArred of
    1: begin // 2 Casas Decimais = 10.845,55
      sVal := formatFloat('###0.00', valor);
      valor := strToFloat(sVal);
    end;
    2: begin //Centavo = 10.846,00
      valf := frac(valor);
      if valf >= 0.50 then
        valor := trunc(valor) + 1
      else
        valor := trunc(valor);
    end;
    3: begin //Dezena = 10.850,00
    //10.845,55
      valor := trunc(valor);
      valor := valor / 10;
      valf := frac(valor);
      if valf >= 0.50 then
        valor := (trunc(valor) + 1) * 10
      else
        valor := trunc(valor) * 10;
    end;
    4: begin //10.845,55 para Centena = 10.900,00
      if valor >= 1000 then
      begin
        valor := trunc(valor);
        valor := valor / 1000;
        valf := frac(valor);
        valf := round(valf) * 100;
        valor := (trunc(valor * 10) * 100) + valf;
      end
      else
        valor := 0;
    end;
    5: begin //10.845,55 para Milhar = 11.000,00
      valor := trunc(valor);
      valor := valor / 1000;
      valor := round(valor) * 1000;
    end;
  end; //case

  result := valor;
end;

begin

  DiasUteis := TDiasUteis.Create;
  DiasUteis.InitializeAs(padroes);

  bCancelaProcApura := false;
  sMsg := '';
  sSql := '';
  sSqlFormula := '';
  sIdcontOrcProc := '';
  cotacaoAcum := 1;
  iperIni := 0;
  iPerFim := 0;
  iValMin := 1;
  iValMax := 12;
  iValCorr := 1;
  iPerProc := 1;

  funcaoGeral   := TFuncaoGeral.Create;
  funcaoGeral.InitializeAs(padroes);

  cdsFormula    := TCmClientDataset.Create(nil);
  cdsDados      := TCmClientDataset.Create(nil);
  cdsAux        := TCmClientDataset.Create(nil);
  cdsSaida      := TCmClientDataset.Create(nil);
  cdsFormXconta := TCmClientDataset.Create(nil);
  cdsMoeda      := TCmClientDataset.Create(nil);
  cdsContasOrc  := TCmClientDataset.Create(nil);
  cdsOrgGerado  := TCmClientDataset.Create(nil);
  cdsPeriodo    := TCmClientDataset.Create(nil);

  try
    // prepara um dataset vazio para inserir os dados de saída do novo orçamento
    cdsSaida.Data := GetDataPacket(' SELECT S.*, 0 AS VALORBASE, ''__________________________________________________'' AS NOMECONTAORCAMEN, 0 AS FATORAPLICADO, VLRORCADO, 0 AS COTACAO, ''____________________________'' AS NOMEFORMULA '+
                                   ' FROM SALDOORCADO S '+
                                   ' WHERE (IDCONTAORCAMEN = -1) AND (IDPLANOORCAMEN = -1) AND '+
                                   '       (IDPESSOA = -1) AND (EXERCICIO = -1) '+
                                   ' ORDER BY EXERCICIO, PERIODO ');

    cdsSaida.LogChanges := false;

    sSqlFormula := ' SELECT * FROM FORMORCADO F, FORMORCADODET FD '+
                   ' WHERE F.IDFORMORCADO = FD.IDFORMORCADO ';

    if iIdformorcado > 0  then
      sSqlFormula := sSqlFormula + ' AND  F.IDFORMORCADO = '+ intTostr(iIdformOrcado);


    sSqlFormula := sSqlFormula + ' ORDER BY FD.PERIODOINI ASC ';


    cdsFormula.data := getdataPacket(sSqlFormula);

    //pega as contas
    cdsContasOrc.Data := GetContas(iIdPlanoOrcamen, iIdPessoa,
                                   iContaIni, iContaDigtos, sContaConteudo, iIdformorcado);
    cdsFormXconta.data := GetContasXFornula(iIdPlanoOrcamen, iIdPessoa);


    if (iIdformorcado > 0) or (trim(sContaConteudo) <> '') then
      iValMax := cdsContasOrc.RecordCount
    else
      iValMax := cdsContasOrc.RecordCount + cdsFormXconta.RecordCount;

   iValMin := 1;
    iValCorr := 1;
    if iValMax < iValMin then
      iValMax := iValMin + 1;

    DoProgresso(['Processamento da conta '+ sIdcontOrcProc,
                        0,                  // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                        iValMin,            // Mínimo de Registros  (em cima)
                        iValMax,            // Total de Registros   (em cima)
                        iValCorr,           // Registro Atual        (em cima)
                        '',
                        '----- Início do processamento  ----- '+#13#13 ]
                        );


    cdsFormula.First;
    while (not cdsFormula.eof) and  (not bCancelaProcApura) do
    begin

      DoProgresso(['Processamento da conta '+ sIdcontOrcProc,
                        1,                  // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                        iValMin,            // Mínimo de Registros  (em cima)
                        iValMax,            // Total de Registros   (em cima)
                        iValCorr,           // Registro Atual        (em cima)
                        '',
                        sMsg ]
                        );

      // se a tem fórmula
      if not cdsFormula.isEmpty then
      begin
        // loop para percorrer os dados de entrada e calcular o novo orçamento
        iper := 0;

          // pega dados de entrada para servir de base de cálculo
          if cdsFormula.FieldByName('IDFORMAAPURACAO').asInteger = 4 then // - periodo a periodo
            cdsDados.Data := GetDadosEntrada(iIdPlanoOrcamen, iIdPessoa, // pega do primeiro periodo
                                             iExercicioOrigem, 1,
                                             cdsFormula.FieldByName('IDFORMAAPURACAO').asInteger,
                                             cdsFormula.fieldByName('IDFORMORCADO').asInteger,
                                             iContaIni, iContaDigtos, sContaConteudo)
          else
            cdsDados.Data := GetDadosEntrada(iIdPlanoOrcamen, iIdPessoa,
                                             iExercicioOrigem, iPeriodoOrigem,
                                             cdsFormula.FieldByName('IDFORMAAPURACAO').asInteger,
                                             cdsFormula.fieldByName('IDFORMORCADO').asInteger,
                                             iContaIni, iContaDigtos, sContaConteudo);

          sIdcontOrcProc := cdsContasOrc.fieldByName('IDCONTAORCAMEN').asString;

          while (not cdsDados.eof) and (not bCancelaProcApura) do
          begin
          // se a conta tem entrada de dados manual e está assoiada à fórmula
            sIdcontOrcProc := cdsContasOrc.fieldByName('IDCONTAORCAMEN').asString;
            if (cdsContasOrc.Locate('IDCONTAORCAMEN', cdsDados.fieldByName('IDCONTAORCAMEN').asString, []))  then
            begin
              inc(iValCorr);
              // *** preence os dados do período destino e insere os dados de saída no dataset vazio
              if iPeriodoDestIni > cdsFormula.fieldByName('PERIODOINI').asInteger then
                iperIni := iPeriodoDestIni
              else
                iperIni := cdsFormula.fieldByName('PERIODOINI').asInteger;

              if iPeriodoDestFim < cdsFormula.fieldByName('PERIODOFIM').asInteger then
                iperFim := iPeriodoDestFim
              else
                iperFim := cdsFormula.fieldByName('PERIODOFIM').asInteger;


              for iper := iperIni to iPerFim do
              begin

                if cdsFormula.FieldByName('IDFORMAAPURACAO').asInteger = 4 then // - periodo a periodo
                begin
                  cdsPeriodo.Data := GetDadosEntrada(iIdPlanoOrcamen, iIdPessoa, // pega do primeiro periodo
                                                     iExercicioOrigem, iper,
                                                     cdsFormula.FieldByName('IDFORMAAPURACAO').asInteger,
                                                     cdsFormula.fieldByName('IDFORMORCADO').asInteger,
                                                     iContaIni, iContaDigtos, sContaConteudo,
                                                     cdsDados.fieldByName('IDCONTAORCAMEN').asString);

                  if cdsPeriodo.isEmpty then
                  begin
                    cdsDados.Edit;
                    cdsDados.fieldByName('VLRREALIZADO').asFloat := 0;
                    cdsDados.fieldByName('VLRORCADO').asFloat := 0;
                    cdsDados.Post;
                  end else begin
                    cdsDados.Edit;
                    cdsDados.fieldByName('VLRREALIZADO').asFloat := cdsPeriodo.fieldByName('VLRREALIZADO').asFloat;
                    cdsDados.fieldByName('VLRORCADO').asFloat := cdsPeriodo.fieldByName('VLRORCADO').asFloat;
                    cdsDados.Post;
                  end;
              end;

                cdsOrgGerado.Data := GetOrcGerado(iIdPlanoOrcamen, iIdPessoa, iExercicioDest, iper - 1, iper - 1,
                                                  cdsFormula.fieldByName('IDFORMORCADO').asInteger,
                                                  cdsDados.fieldByName('IDCONTAORCAMEN').asString);

                cdsAux.Data := cdsSaida.Data;

                iPerProc := iper;

                if (bCancelaProcApura) then
                  break;

                sMsg := sMsg + 'Gerado orçamento para a conta: '+ cdsDados.FieldByName('IDCONTAORCAMEN').asString +
                        ' no período ' + intToStr(iPerProc) + ' do exercício '+ intToStr(iExercicioDest) + #13#10;

                DoProgresso(['Processamento da conta '+ sIdcontOrcProc,
                                    1,                  // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                                    iValMin,            // Mínimo de Registros  (em cima)
                                    iValMax,            // Total de Registros   (em cima)
                                    iValCorr,           // Registro Atual        (em cima)
                                    '',
                                    sMsg ]
                                    );

                sMsg := '';

                cdsSaida.Append;

                cdsSaida.FieldByName('NOMEFORMULA').asString := cdsFormula.FieldByName('NOME').asString;
                cdsSaida.FieldByName('IDPESSOA').asInteger := iIdPessoa;
                cdsSaida.FieldByName('IDPLANOORCAMEN').asInteger := iIdPlanoOrcamen;

                 // pega dodos do período
                cdsSaida.FieldByName('DATAREFERENCIA').AsString :=  CtrlOrcamentoBack.UltimoDiaPeriodo(iExercicioDest, iper, iIdPessoa);

                cdsSaida.FieldByName('IDCONTAORCAMEN').asString := cdsDados.fieldByName('IDCONTAORCAMEN').asString;

                cdsSaida.fieldByName('NOMECONTAORCAMEN').asString := cdsDados.fieldByName('NOMECONTAORCAMEN').asString;

                cdsSaida.FieldByName('EXERCICIO').asInteger := iExercicioDest;
                cdsSaida.FieldByName('PERIODO').asInteger := iPer;

                if cdsFormula.fieldByName('BASECALCULO').asString = 'O' then //'O' - orcado
                begin
                  if (iper > 1) and (iper >= iperIni) and (cdsFormula.FieldByName('IDFORMAAPURACAO').asInteger = 5) then //se baseado no mes anterior
                  begin
                    cdsAux.filter := 'IDCONTAORCAMEN = '+ cdsSaida.FieldByName('IDCONTAORCAMEN').asString;
                    cdsAux.filtered := true;
                    cdsAux.Last;
                    if not cdsAux.fieldByName('VLRORCADO').IsNull then
                      cdsSaida.fieldByName('VALORBASE').asFloat := cdsAux.fieldByName('VLRORCADO').asFloat
                    else
                      cdsSaida.fieldByName('VALORBASE').asFloat := cdsOrgGerado.fieldByName('VLRORCADO').asFloat
                  end
                  else
                    cdsSaida.fieldByName('VALORBASE').asFloat := cdsDados.fieldByName('VLRORCADO').asFloat;
                  cdsSaida.fieldByName('VLRORCADO').asFloat := cdsSaida.fieldByName('VALORBASE').asFloat;
                end
                else //'R' - Realizado
                begin
                  if  (iper > 1) and (iper >= iperIni) and (cdsFormula.FieldByName('IDFORMAAPURACAO').asInteger = 5) then //se baseado no mes anterior
                  begin
                    cdsAux.filter := 'IDCONTAORCAMEN = '+ cdsSaida.FieldByName('IDCONTAORCAMEN').asString;
                    cdsAux.filtered := true;
                    cdsAux.Last;
                    // primeiro verifica se existe no fluxo, senão repuera do banco
                    if not cdsAux.fieldByName('VLRORCADO').IsNull then
                      if cdsFormula.FieldByName('IDFORMAAPURACAO').asInteger = 5 then // orçado no mês anterior
                        cdsSaida.fieldByName('VALORBASE').asFloat := cdsAux.fieldByName('VLRORCADO').asFloat
                      else
                        cdsSaida.fieldByName('VALORBASE').asFloat := cdsAux.fieldByName('VLRREALIZADO').asFloat
                    else
                      if cdsFormula.FieldByName('IDFORMAAPURACAO').asInteger = 5 then // orçado no mês anterior
                        cdsSaida.fieldByName('VALORBASE').asFloat := cdsOrgGerado.fieldByName('VLRORCADO').asFloat
                      else
                        cdsSaida.fieldByName('VALORBASE').asFloat := cdsOrgGerado.fieldByName('VLRREALIZADO').asFloat;
                  end
                  else
                    cdsSaida.fieldByName('VALORBASE').asFloat := cdsDados.fieldByName('VLRREALIZADO').asFloat;
                  cdsSaida.fieldByName('VLRORCADO').asFloat := cdsSaida.fieldByName('VALORBASE').asFloat;
                end;

                // aplica percentual
                if not cdsFormula.FieldByName('PERCENTUAL').isNull then
                begin
                  if cdsFormula.FieldByName('FLGACUMPERC').asString <> 'T' then
                  begin
                    cdsSaida.fieldByName('COTACAO').asFloat := cdsFormula.FieldByName('PERCENTUAL').asFloat;
                    cdsSaida.fieldByName('FATORAPLICADO').asFloat := (cdsFormula.FieldByName('PERCENTUAL').asFloat/100) + 1;
                    cdsSaida.fieldByName('VLRORCADO').asFloat := cdsSaida.fieldByName('VLRORCADO').asFloat * cdsSaida.FieldByName('FATORAPLICADO').asFloat;
                  end
                  else
                  begin   // acumula percentual
                    cdsSaida.fieldByName('COTACAO').asFloat := cdsFormula.FieldByName('PERCENTUAL').asFloat;
                    cdsSaida.fieldByName('FATORAPLICADO').asFloat := acumulaPercentual(DiasUteis.UltDiaMes(iExercicioOrigem, iPeriodoOrigem),
                                                                                       DiasUteis.UltDiaMes(iExercicioDest, iper),
                                                                                       cdsFormula.FieldByName('PERCENTUAL').asFloat);
                    cdsSaida.fieldByName('VLRORCADO').asFloat := cdsSaida.fieldByName('VLRORCADO').asFloat * cdsSaida.fieldByName('FATORAPLICADO').asFloat;
                  end;
                end //aplica moeda
                else if not cdsFormula.FieldByName('MOECODIGO').isNull then
                begin
                  cdsMoeda.Data := GetDataPacket('SELECT FLGPERCVALOR FROM MOEDA WHERE MOECODIGO = '+ cdsFormula.FieldByName('MOECODIGO').AsString);

                  //NÃO acumula moeda
                  if (trim(cdsFormula.FieldByName('FLGACUMULAMOEDA').asString) <> 'T') then
                  begin

                    cdsSaida.fieldByName('COTACAO').asFloat := funcaoGeral.TestaCotacaoMoeda(cdsFormula.FieldByName('MOECODIGO').AsInteger, dateToStr(DiasUteis.UltDiaMes(iExercicioDest, iper)), 'N');

                    cdsSaida.fieldByName('FATORAPLICADO').asFloat := (cdsSaida.FieldByName('COTACAO').asFloat/100) + 1;
                    cdsSaida.fieldByName('VLRORCADO').asFloat := cdsSaida.fieldByName('VLRORCADO').asFloat * cdsSaida.fieldByName('FATORAPLICADO').asFloat;
                  end // acumula moeda
                  else if (trim(cdsMoeda.fieldByName('FLGPERCVALOR').asString) = 'P') and
                          (trim(cdsFormula.FieldByName('FLGACUMULAMOEDA').asString) = 'T') then// acumula moeda pois a moeda é percentual
                  begin
                    cotacaoAcum := acumulaMoeda(DiasUteis.UltDiaMes(iExercicioOrigem, iPeriodoOrigem),
                                                                     DiasUteis.UltDiaMes(iExercicioDest, iPer),
                                                                     cdsFormula.FieldByName('MOECODIGO').AsInteger);

                    cdsSaida.fieldByName('VLRORCADO').asFloat := cdsSaida.fieldByName('VLRORCADO').asFloat * cotacaoAcum;

                    cdsSaida.fieldByName('COTACAO').asFloat := funcaoGeral.TestaCotacaoMoeda(cdsFormula.FieldByName('MOECODIGO').AsInteger, dateToStr(DiasUteis.UltDiaMes(iExercicioDest, iper)), 'N');

                    cdsSaida.fieldByName('FATORAPLICADO').asFloat := cotacaoAcum;
                  end;

                end;

                // arredondamento do resultado
                cdsSaida.fieldByName('VLRORCADO').asFloat := arredondaFloat(cdsSaida.fieldByName('VLRORCADO').asFloat,
                                                                            cdsFormula.FieldByName('BASEARREDONDAMENTO').asInteger);


                cdsSaida.fieldByName('VLRREALIZADO').asFloat       := 0;
                cdsSaida.FieldByName('VLRRESERVADO').asFloat       := 0;
                cdsSaida.FieldByName('VLRCOMPROMETIDO').asFloat    := 0;
                cdsSaida.FieldByName('VLRORCACUM').asFloat         := 0;
                cdsSaida.FieldByName('VLRREALACUM').asFloat        := 0;
                cdsSaida.FieldByName('FLGSIMULAATIVO').asString    := ' ';
                cdsSaida.FieldByName('IDCRITERIORATORC').asInteger := -1;
                cdsSaida.FieldByName('PERCUTILRATEIO').asInteger   := -1;
                cdsSaida.FieldByName('VLRRATEIOORI').asInteger     := 0;

                cdsSaida.Post;

                if iPer >= iPeriodoDestFim then
                  break;
              end; //for

            end; // if da conta

            DoProgresso(['Processamento da conta '+ sIdcontOrcProc,
                                1,                  // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                                iValMin,            // Mínimo de Registros  (em cima)
                                iValMax,            // Total de Registros   (em cima)
                                iValCorr,           // Registro Atual        (em cima)
                                '',
                                sMsg ]
                                );

            sMsg := '';

            cdsDados.Next;

          end; //while cdsDados

          DoProgresso(['Processamento da conta '+ sIdcontOrcProc,
                                1,                  // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                                iValMin,            // Mínimo de Registros  (em cima)
                                iValMax,            // Total de Registros   (em cima)
                                iValCorr,           // Registro Atual        (em cima)
                                '',
                                sMsg ]
                                );
          sMsg := '';

        cdsFormula.Next;
      end; //fim do if periodo


    end; // while cdsFormula

    if (iIdformorcado <= 0) and (trim(sContaConteudo) = '') then // se nao tem uma fómula especificada
    begin
      // lista as contas que não geraram orcamento poque nao tem formula
      cdsFormXconta.First;
      while (not cdsFormXconta.eof) and (not bCancelaProcApura) do
      begin
        sMsg := sMsg + 'Não gerado orçamento para a conta: '+ cdsFormXconta.FieldByName('IDCONTAORCAMEN').asString +
                       ' no exercício '+ intToStr(iExercicioDest) +
                       ', pois não existe fómula cadastrada para a conta ou para seu grupo.'+#13#10;

        DoProgresso(['Processamento da conta '+ cdsFormXconta.fieldByName('IDCONTAORCAMEN').asString,
                            1,                  // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                            iValMin,            // Mínimo de Registros  (em cima)
                            iValMax,            // Total de Registros   (em cima)
                            iValCorr,           // Registro Atual        (em cima)
                            '',
                            sMsg ]
                            );
        sMsg := '';
        cdsFormXconta.next;
        inc(iValCorr);
      end;
    end; //if
    
    result := cdsSaida.Data;
  finally
    // esconde o form de progresso

    DoProgresso(['Processamento dos registros',
                        2,                  // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                        iValMin,            // Mínimo de Registros  (em cima)
                        iValMax,            // Total de Registros   (em cima)
                        iValCorr,           // Registro Atual        (em cima)
                        '',
                        #13#13+' ------ Fim do Processamento  ----- ' ]
                        );

    cdsFormula.Free;
    cdsDados.Free;
    cdsAux.Free;
    cdsSaida.Free;
    cdsFormXconta.Free;
    cdsContasOrc.Free;
    cdsMoeda.Free;
    cdsOrgGerado.Free;
    cdsPeriodo.Free;
    funcaoGeral.Free;
    DiasUteis.free;
  end;
end;



function TCtrlCadFormulaApuraOrc.GetContasXFornula(const iIdPlanoOrcamen: integer;  const iIdPessoa: integer): olevariant;
var cds : TclientDataset;
    sSql : string;

begin
  cds := TclientDataset.create(nil);
  try
    sSql := ' SELECT * FROM CONTASORCAMEN C '+
            ' WHERE C.TIPOCALCORCADO = ''V'' AND '+
            '       C.IDCONTAORCAMEN NOT IN '+
            '       (  SELECT DISTINCT CO.IDCONTAORCAMEN '+
            ' FROM FORMORCADO FO, FORMORCADODET F, CONTASORCAMEN CO, GRUPOORCAMEN GR '+
            ' WHERE  F.IDFORMORCADO = DECODE (CO.IDFORMORCADO, NULL, GR.IDFORMORCADO, CO.IDFORMORCADO) AND '+
            ' F.IDFORMORCADO = FO.IDFORMORCADO AND '+
            ' CO.TIPOCALCORCADO = ''V'' AND '+
            ' CO.IDGRUPOORCAMEN = GR.IDGRUPOORCAMEN AND '+
            ' CO.IDPESSOA = '+ intTostr(iIdPessoa) + ' AND '+
            ' CO.IDPLANOORCAMEN = '+ intTostr(iIdPlanoOrcamen)+
            ' ) ORDER BY C.IDCONTAORCAMEN DESC ';

    cds.data := getDataPacket(sSql);
    result := cds.data;
  finally
    cds.free;
  end;
end;

// busca os dados de entrada para servir de base de cálculo
function TCtrlCadFormulaApuraOrc.GetDadosEntrada(const iIdPlanoOrcamen: integer;  const iIdPessoa: integer;
                                                 const iExercicioOrigem: integer; const iPeriodoOrigem: integer;
                                                 const idFormaApuracao: integer;  const iDformOrcado: integer = 0;
                                                 const iContaIni: integer = 0;
                                                 const iContaDigtos: integer = 0; const sContaConteudo: string = '';
                                                 const sIdcontasOrcamen : string = ''
                                                 ): olevariant;

var sSql, sfiltro : string;
    cds: TClientDataSet;
begin
  sfiltro := '';
  cds := TcmClientDataSet.Create(nil);
  try
    if (iContaIni > 0) and (iContaDigtos > 0) and (trim(sContaConteudo) <> '') then
      sfiltro := ' AND SUBSTR(TO_CHAR(S.IDCONTAORCAMEN), ' + intToStr(iContaIni) + ', '+
                 intToStr(iContaDigtos) +') = ' + quotedStr(trim(sContaConteudo));

    if trim(sIdContasOrcamen) <> '' then
      sFiltro := ' AND S.IDCONTAORCAMEN = '+ sIdcontasOrcamen;

    if iDformOrcado > 0 then
    begin
      case idFormaApuracao of  // dados de origem filtrados por fórmula
        0, 1, 5: begin  //Movimentação do último mês apurado - orçado do mês anterior
          sSql := ' SELECT CO.NOMECONTAORCAMEN, CO.IDCONTAORCAMEN, S.EXERCICIO, SUM(S.VLRORCADO) AS VLRORCADO, SUM(S.VLRREALIZADO) AS VLRREALIZADO '+
                  ' FROM SALDOORCADO S, CONTASORCAMEN CO, GRUPOORCAMEN GR '+
                  ' WHERE S.IDPLANOORCAMEN(+) = '+ inttostr(iIdPlanoOrcamen) +' AND '+
                  '       S.IDPESSOA(+)       = '+ inttostr(iIdPessoa) + ' AND '+
                  '       S.EXERCICIO(+)      = '+ inttostr(iExercicioOrigem)+ ' AND '+
                  '       CO.TIPOCALCORCADO = ''V'' AND '+
                  '       S.PERIODO(+)        = '+ inttostr(iPeriodoOrigem) + sFiltro + ' AND '+
                  '       CO.IDCONTAORCAMEN = S.IDCONTAORCAMEN(+) AND '+
                  '       GR.IDGRUPOORCAMEN = CO.IDGRUPOORCAMEN AND '+
                  '       DECODE (CO.IDFORMORCADO, NULL, GR.IDFORMORCADO, CO.IDFORMORCADO) = '+ intToStr(iDformOrcado)+
                  ' GROUP BY CO.NOMECONTAORCAMEN, CO.IDCONTAORCAMEN, S.EXERCICIO '+
                  ' ORDER BY CO.IDCONTAORCAMEN DESC ';
        end;
        2: begin  //Média da movimentação dos meses
          sSql := ' SELECT CO.NOMECONTAORCAMEN, CO.IDCONTAORCAMEN, S.EXERCICIO, SUM(S.VLRORCADO)/'+ inttostr(iPeriodoOrigem) +' AS VLRORCADO, SUM(S.VLRREALIZADO)/'+ inttostr(iPeriodoOrigem) +' AS VLRREALIZADO '+
                  ' FROM SALDOORCADO S, CONTASORCAMEN CO, GRUPOORCAMEN GR '+
                  ' WHERE S.IDPLANOORCAMEN(+) = '+ inttostr(iIdPlanoOrcamen) +' AND '+
                  '       S.IDPESSOA(+)       = '+ inttostr(iIdPessoa) + ' AND '+
                  '       S.EXERCICIO(+)      = '+ inttostr(iExercicioOrigem)+ ' AND '+
                  '       CO.TIPOCALCORCADO = ''V'' AND '+
                  '       S.PERIODO BETWEEN 1 AND '+ inttostr(iPeriodoOrigem) + sFiltro + ' AND '+
                  '       CO.IDCONTAORCAMEN = S.IDCONTAORCAMEN(+) AND '+
                  '       GR.IDGRUPOORCAMEN = CO.IDGRUPOORCAMEN AND '+
                  '       DECODE (CO.IDFORMORCADO, NULL, GR.IDFORMORCADO, CO.IDFORMORCADO) = '+ intToStr(iDformOrcado)+
                  ' GROUP BY CO.NOMECONTAORCAMEN, CO.IDCONTAORCAMEN, S.EXERCICIO '+
                  ' ORDER BY CO.IDCONTAORCAMEN DESC ';

        end;
        3: begin  ////Somatório da movimentação dos meses -
          sSql := ' SELECT CO.NOMECONTAORCAMEN, CO.IDCONTAORCAMEN, S.EXERCICIO, SUM(S.VLRORCADO) AS VLRORCADO, SUM(S.VLRREALIZADO) AS VLRREALIZADO '+
                  ' FROM SALDOORCADO S, CONTASORCAMEN CO, GRUPOORCAMEN GR '+
                  ' WHERE S.IDPLANOORCAMEN(+) = '+ inttostr(iIdPlanoOrcamen) +' AND '+
                  '       S.IDPESSOA(+)       = '+ inttostr(iIdPessoa) + ' AND '+
                  '       S.EXERCICIO(+)      = '+ inttostr(iExercicioOrigem)+ ' AND '+
                  '       CO.TIPOCALCORCADO = ''V'' AND '+
                  '       S.PERIODO BETWEEN 1 AND '+ inttostr(iPeriodoOrigem) + sFiltro + ' AND '+
                  '       CO.IDCONTAORCAMEN = S.IDCONTAORCAMEN(+) AND '+
                  '       GR.IDGRUPOORCAMEN = CO.IDGRUPOORCAMEN AND '+
                  '       DECODE (CO.IDFORMORCADO, NULL, GR.IDFORMORCADO, CO.IDFORMORCADO) = '+ intToStr(iDformOrcado)+
                  ' GROUP BY CO.NOMECONTAORCAMEN, CO.IDCONTAORCAMEN, S.EXERCICIO '+
                  ' ORDER BY CO.IDCONTAORCAMEN DESC ';
        end;
        4: begin // periodo a periodo
          sSql := ' SELECT CO.NOMECONTAORCAMEN, S.IDCONTAORCAMEN, SUM(S.VLRORCADO) AS VLRORCADO, SUM(S.VLRREALIZADO) AS VLRREALIZADO '+
                  ' FROM SALDOORCADO S, CONTASORCAMEN CO, GRUPOORCAMEN GR  '+
                  ' WHERE S.IDPLANOORCAMEN(+) = '+ inttostr(iIdPlanoOrcamen) +' AND '+
                  '       S.IDPESSOA(+)       = '+ inttostr(iIdPessoa) + ' AND '+
                  '       S.EXERCICIO(+)      = '+ inttostr(iExercicioOrigem)+ ' AND '+
                  '       CO.IDCONTAORCAMEN   = S.IDCONTAORCAMEN(+) AND '+
                  '       GR.IDGRUPOORCAMEN = CO.IDGRUPOORCAMEN AND '+
                  '       DECODE (CO.IDFORMORCADO, NULL, GR.IDFORMORCADO, CO.IDFORMORCADO) = '+ intToStr(iDformOrcado)+ ' AND '+
                  '       S.PERIODO = '+ inttostr(iPeriodoOrigem) + sFiltro +
                  ' GROUP BY CO.NOMECONTAORCAMEN, S.IDCONTAORCAMEN ';
        end;
      end;//case
    end
    else
    begin
      sSql := ' SELECT CO.NOMECONTAORCAMEN, CO.IDCONTAORCAMEN, S.EXERCICIO '+
              '   SUM(S.VLRORCADO) AS VLRORCADO,  SUM(S.VLRREALIZADO) AS VLRREALIZADO, '+
              '   SUM(S.VLRRESERVADO) AS VLRRESERVADO, SUM(S.VLRCOMPROMETIDO) AS VLRCOMPROMETIDO '+
              ' FROM SALDOORCADO S, CONTASORCAMEN CO '+
              ' WHERE S.IDPLANOORCAMEN(+) = '+ inttostr(iIdPlanoOrcamen) +' AND '+
              '       S.IDPESSOA(+)       = '+ inttostr(iIdPessoa) + ' AND '+
              '       S.EXERCICIO(+)      = '+ inttostr(iExercicioOrigem)+ ' AND '+
              '       CO.TIPOCALCORCADO = ''V'' AND '+
              '       CO.IDCONTAORCAMEN = S.IDCONTAORCAMEN AND '+
              '       S.PERIODO BETWEEN 1 AND '+ inttostr(iPeriodoOrigem) + sFiltro +
              ' GROUP BY CO.NOMECONTAORCAMEN, CO.EXERCICIO, S.IDCONTAORCAMEN '+
              ' ORDER BY CO.IDCONTAORCAMEN DESC ';

    end;//else
    cds.data := getDataPacket(sSql);
    result := cds.data;
  finally
    cds.Free;
  end;
end;



function TCtrlCadFormulaApuraOrc.GetContas(const iIdPlanoOrcamen: integer;  const iIdPessoa: integer;
                                                 const iContaIni: integer = 0;
                                                 const iContaDigtos: integer = 0; const sContaConteudo: string = '';
                                                 const idformorcado: integer = -1 ): olevariant;
Var sSql, sFiltro, sFilForm1 : string;
begin
  sFiltro := '';
  sFilForm1 := '';

  if (iContaIni > 0) and (iContaDigtos > 0) and (trim(sContaConteudo) <> '') then
    sfiltro := ' AND SUBSTR(TO_CHAR(CO.IDCONTAORCAMEN), ' + intToStr(iContaIni) + ', '+
               intToStr(iContaDigtos) +') = ' + quotedStr(trim(sContaConteudo));

  if idformorcado > 0 then
  begin
    sFilForm1 := sFilForm1 + ' AND DECODE (CO.IDFORMORCADO, NULL, GR.IDFORMORCADO, CO.IDFORMORCADO) = '+ intToStr(idformorcado);
  end;

  sSql := ' SELECT DISTINCT CO.IDCONTAORCAMEN '+
          ' FROM FORMORCADO FO, FORMORCADODET F, CONTASORCAMEN CO, GRUPOORCAMEN GR '+
          ' WHERE  F.IDFORMORCADO = DECODE (CO.IDFORMORCADO, NULL, GR.IDFORMORCADO, CO.IDFORMORCADO) AND '+
          ' F.IDFORMORCADO = FO.IDFORMORCADO AND '+
          ' CO.TIPOCALCORCADO = ''V'' AND '+
          ' CO.IDGRUPOORCAMEN = GR.IDGRUPOORCAMEN AND '+
          ' CO.IDPESSOA = '+ intTostr(iIdPessoa) + ' AND '+
          ' CO.IDPLANOORCAMEN = '+ intTostr(iIdPlanoOrcamen)+ sFilForm1 + sfiltro +
          ' ORDER BY CO.IDCONTAORCAMEN DESC ';

  result := getDataPacket(sSql);
end;



function TCtrlCadFormulaApuraOrc.acumulaMoeda(const DataIni, DataFim: TDateTime;
                                              const moecodigo : integer): extended;
var cotacao, acum: extended;
    funcaoGeral : TFuncaoGeral;
    DiasUteis : TDiasUteis;
    iMesIni, iMesFim, iAnoIni, iAnoFim, iDia: word;
    _dataIni, _dataFim : tdatetime;
begin
  result := 0;
  acum := 1;
  funcaoGeral   := TFuncaoGeral.Create;
  funcaoGeral.InitializeAs(padroes);

  DiasUteis := TDiasUteis.Create;
  DiasUteis.InitializeAs(padroes);

  try
    iMesIni := DiasUteis.ExtraiMes(DataIni);
    iAnoIni := DiasUteis.ExtraiAno(DataIni);

    if iMesIni < 12 then
      imesIni := imesIni + 1
    else begin
      iMesIni := 1;
      iAnoIni := iAnoIni + 1;
    end;

    iMesFim := DiasUteis.ExtraiMes(DataFim);
    iAnoFim := DiasUteis.ExtraiAno(DataFim);
    _dataIni := DiasUteis.UltDiaMes(iAnoIni, iMesIni);
    _dataFim := DiasUteis.UltDiaMes(iAnoFim, iMesFim);
    while _DataIni < _DataFim do
    begin
      _dataIni := DiasUteis.UltDiaMes(iAnoIni, iMesIni);

      cotacao := funcaoGeral.TestaCotacaoMoeda(moecodigo, dateToStr(_dataIni), 'N');
      acum := acum + ((cotacao * acum)/100);

      if iMesIni < 12 then
        iMesIni := iMesIni + 1
      else
      begin
        iMesIni := 1;
        iAnoIni := iAnoIni + 1;
      end;

    end;// while
    result := acum;
  finally
    funcaoGeral.free;
    DiasUteis.free;
  end;
end;

function TCtrlCadFormulaApuraOrc.GravaSimulacao(const ovdados: Olevariant): boolean;
var CtrlSaldoorcado: TCtrlSaldoorcado;
    cds, cdsSdoOrcado : TClientDataSet;
begin

  result := false;
  CtrlSaldoorcado := TCtrlSaldoorcado.Create;
  CtrlSaldoorcado.InitializeAs(Padroes);

  cds := TClientDataSet.create(nil);
  cdsSdoOrcado := TClientDataSet.create(nil);
  cdsSdoOrcado.Data := getDataPacket('select * from saldoorcado where 1 = 2');
  CtrlSaldoorcado.CdsSaldoorcado := cdsSdoOrcado;
  cds.data := ovDados;

  try
    cds.First;
    while not cds.Eof do
    begin
      cdsSdoOrcado.Insert;
      cdsSdoOrcado.FieldByName('IDPESSOA').asInteger        := cds.FieldByName('IDPESSOA').asInteger;
      cdsSdoOrcado.FieldByName('IDPLANOORCAMEN').asInteger  := cds.FieldByName('IDPLANOORCAMEN').asInteger;
      cdsSdoOrcado.FieldByName('DATAREFERENCIA').asDateTime := cds.FieldByName('DATAREFERENCIA').asDateTime;
      cdsSdoOrcado.FieldByName('IDCONTAORCAMEN').asString   := cds.FieldByName('IDCONTAORCAMEN').asString;
      cdsSdoOrcado.FieldByName('EXERCICIO').asInteger       := cds.FieldByName('EXERCICIO').asInteger;
      cdsSdoOrcado.FieldByName('PERIODO').asInteger         := cds.FieldByName('PERIODO').asInteger;
      cdsSdoOrcado.fieldByName('VLRORCADO').asFloat         := cds.fieldByName('VLRORCADO').asFloat;

      cdsSdoOrcado.Post;

      cds.next;
    end;

    result := CtrlSaldoorcado.AplicaOperacaoSaldoOrcado;
    if not result then
      MessageInfo := CtrlSaldoorcado.MessageInfo;

  finally
    cds.Free;
    cdsSdoOrcado.Free;
    CtrlSaldoorcado.Free;
  end;
end;

procedure TCtrlCadFormulaApuraOrc.SetbCancelaProcApura(const Value: Boolean);
begin
  FbCancelaProcApura := Value;
end;



function TCtrlCadFormulaApuraOrc.acumulaPercentual(const DataIni,
         DataFim: TDateTime; const valorIni: extended): extended;
var vlrAux: extended;
    DiasUteis : TDiasUteis;
    iMesIni, iMesFim, iAnoIni, iAnoFim, iDia: word;
    _dataIni, _dataFim : tdatetime;
begin
  result := 0;
  vlrAux := 1;
  DiasUteis := TDiasUteis.Create;
  DiasUteis.InitializeAs(padroes);
  try
    iAnoIni := DiasUteis.ExtraiAno(DataIni);
    iMesIni := DiasUteis.ExtraiMes(DataIni);

    if iMesIni < 12 then
      imesIni := imesIni + 1
    else begin
      iMesIni := 1;
      iAnoIni := iAnoIni + 1;
    end;

    iMesFim := DiasUteis.ExtraiMes(DataFim);
    iAnoFim := DiasUteis.ExtraiAno(DataFim);
    _dataIni := DiasUteis.UltDiaMes(iAnoIni, iMesIni);
    _dataFim := DiasUteis.UltDiaMes(iAnoFim, iMesFim);

    while _DataIni < _DataFim do
    begin
      _dataIni := DiasUteis.UltDiaMes(iAnoIni, iMesIni);
      vlrAux := vlrAux + ((valorIni * vlrAux)/100);

      if iMesIni < 12 then
        iMesIni := iMesIni + 1
      else
      begin
        iMesIni := 1;
        iAnoIni := iAnoIni + 1;
      end;

    end; //while
    result := vlrAux;
  finally
    DiasUteis.free;
  end;
end;

function TCtrlCadFormulaApuraOrc.ExcluiDestino(const iIdPlanoOrcamen,
                                              iIdPessoa, iExercicio, iPeriodoIni, iPeriodoFim, iContaIni,
                                              iContaDigtos: integer; const sContaConteudo: string;
                                              const idformorcado: integer): Boolean;

Var sSql, sFiltro, sFilForm : string;
begin
  sFiltro := '';
  sFilForm := '';
  result := false;

  if (iContaIni > 0) and (iContaDigtos > 0) and (trim(sContaConteudo) <> '') then
    sfiltro := ' AND SUBSTR(TO_CHAR(S.IDCONTAORCAMEN), ' + intToStr(iContaIni) + ', '+
               intToStr(iContaDigtos) +') = ' + quotedStr(trim(sContaConteudo));

  if idformorcado > 0 then
    sFilForm := sFilForm + ' AND SALDO.IDFORMORCADO = '+ intToStr(idformorcado);

    sSql := ' DELETE FROM SALDOORCADO SD WHERE 0 IN ( '+
            ' SELECT 0 FROM '+
            '( SELECT '+
            '   S.IDCONTAORCAMEN, '+
            '   S.EXERCICIO, '+
            '   S.PERIODO, '+
            '   DECODE (CO.IDFORMORCADO, NULL, GR.IDFORMORCADO, CO.IDFORMORCADO) AS IDFORMORCADO '+
            ' FROM SALDOORCADO S, CONTASORCAMEN CO, GRUPOORCAMEN GR '+
            ' WHERE S.IDPLANOORCAMEN = '+ inttostr(iIdPlanoOrcamen) +' AND '+
            '       S.IDPESSOA       = '+ inttostr(iIdPessoa) + ' AND '+
            '       S.EXERCICIO      = '+ inttostr(iExercicio)+ ' AND '+
            '       CO.TIPOCALCORCADO = ''V'' AND '+
            '       CO.IDCONTAORCAMEN = S.IDCONTAORCAMEN AND '+
            '       S.PERIODO BETWEEN ' + inttostr(iPeriodoIni)+ ' AND '+ inttostr(iPeriodoFim) + sFiltro + ' AND '+
            '       CO.IDGRUPOORCAMEN = GR.IDGRUPOORCAMEN '+
            ' GROUP BY S.EXERCICIO, S.IDCONTAORCAMEN, S.PERIODO, GR.IDFORMORCADO, DECODE (CO.IDFORMORCADO, NULL, GR.IDFORMORCADO, CO.IDFORMORCADO) '+
            ' ) SALDO '+
            ' WHERE SALDO.IDCONTAORCAMEN = SD.IDCONTAORCAMEN AND '+
            '   SALDO.EXERCICIO = SD.EXERCICIO AND '+
            '   SALDO.PERIODO = SD.PERIODO  '+ sFilForm + ')';
  try
    result := execSql(sSql);
  except
    on E: exception do
      messageInfo := e.Message;
  end; //except
end;

function TCtrlCadFormulaApuraOrc.GetOrcGerado(const iIdPlanoOrcamen, iIdPessoa, iExercicio, iPeriodoIni,
                                                    iPeriodoFim, idformorcado: integer; iIdcontarcamen: string): OleVariant;
Var sSql, sFilForm : string;
begin
  sFilForm := '';

  if idformorcado > 0 then
    sFilForm := sFilForm + ' AND DECODE (CO.IDFORMORCADO, NULL, GR.IDFORMORCADO, CO.IDFORMORCADO) = '+ intToStr(idformorcado);

  if trim(iIdcontarcamen) <> '' then
    sFilForm := sFilForm + ' AND S.IDCONTAORCAMEN = '+ quotedStr(iIdcontarcamen);

  sSql :=   ' SELECT '+
            '   S.IDCONTAORCAMEN, '+
            '   S.EXERCICIO, '+
            '   S.PERIODO, '+
            '   S.VLRORCADO, '+
            '   S.VLRREALIZADO, '+
            '   DECODE (CO.IDFORMORCADO, NULL, GR.IDFORMORCADO, CO.IDFORMORCADO) AS IDFORMORCADO '+
            ' FROM SALDOORCADO S, CONTASORCAMEN CO, GRUPOORCAMEN GR '+
            ' WHERE S.IDPLANOORCAMEN = '+ inttostr(iIdPlanoOrcamen) +' AND '+
            '       S.IDPESSOA       = '+ inttostr(iIdPessoa) + ' AND '+
            '       S.EXERCICIO      = '+ inttostr(iExercicio)+ ' AND '+
            '       CO.TIPOCALCORCADO = ''V'' AND '+
            '       CO.IDCONTAORCAMEN = S.IDCONTAORCAMEN AND '+
            '       S.PERIODO BETWEEN ' + inttostr(iPeriodoIni)+ ' AND '+ inttostr(iPeriodoFim) + sFilForm + ' AND '+
            '       CO.IDGRUPOORCAMEN = GR.IDGRUPOORCAMEN '+
            ' ORDER BY S.PERIODO ';

  try
    result := GetDataPacket(sSql);
  except
    on E: exception do
      messageInfo := e.Message;
  end; //except
end;

end.

