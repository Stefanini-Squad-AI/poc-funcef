// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//--------------------------------------------------------------------------------------------------
//SIG         : 131531
//Data        : 06/01/2023
//Alteração   : Remover alguns beneficios da critica de ValidarSemResgatePortabilidadeouBeneficioRendaContinuada
//Responsável : André Imakawa
//---------------------------------------------------------------------------------------------------
//SIG         : 85590
//Data        : 02/05/2019
//Alteração   : Verificar a compra de carencia.
//Responsável : André Imakawa
//---------------------------------------------------------------------------------------------------
//Pendência   : SIG 82811
//Responsável : Rafael Vasconcelos
//Data        : 26/02/2019
//Descrição   : Inclusao do evento inscrição do participante
//---------------------------------------------------------------------------------------------------
//Pendência   : SIG 70973
//Responsável : Taffarel Sevaybriker
//Data        : 29/06/2018
//Descrição   : Incluir os eventos geradores 373 e 368.
//---------------------------------------------------------------------------------------------------
//Pendência   : SIG 67753
//Responsável : André Imakawa
//Data        : 30/04/2018
//Descrição   : Incluir o evento gerador 383 e 352 e data maior e igual.
//---------------------------------------------------------------------------------------------------
//Pendência   : SIG 52311
//Responsável : Osni Cavalcante
//Data        : 21/08/2017
//Descrição   : Adicionado a condicação para o participante resgatar as contribuições após ter tido
//              reinscrição no plano.
//---------------------------------------------------------------------------------------------------
//Pendência   : SOL 171982 KINTANA 1553751
//Responsável : BRUNO AZEVEDO
//Data        : 25/01/2012
//Descrição   : Adicionado o evento de BPD presumido na regra de elegibilidade.
//---------------------------------------------------------------------------------------------------
//Pendência   : SOL 136956 KINTANA 917626
//Responsável : MARCELO ALMEIDA DA SILVA
//Data        : 24/09/2010
//Descrição   : Criação da classe TAnaliseElegibilidade e regras de elegibilidade.
//---------------------------------------------------------------------------------------------------

unit UAnaliseElegibilidade;

interface

uses
  Classes, SysUtils, Db, wwquery, UBeneficio, USistema;

type
  TRegraElegibilidade = (reNaoDefinida, reElegibilidadeBPD, reElegibilidadePortabilidade, reElegibilidadeResgate, reElegibilidadeAutopatrocinio);
  TValidacaoRegraElegibilidade = (vrePossuiMais3AnosContribuicao, vreExisteContribuicaoPagaDezembro2005ouPosterior, vreNaoElegivelBeneficioProgramadoPleno, vreExisteRegistroRescisaoContratoPatrocinadora, vreSemResgatePortabilidadeouBeneficioRendaContinuada, vrePossui120DiasContadosAPartirDataFatoGerador, vreValidarVerificacaoFinanciamentoHabitacional, vreValidarBeneficiosPeculio);
  TValidacaoRegrasNaoElegiveis = set of TValidacaoRegraElegibilidade;
  TAnaliseElegibilidadeEvent = procedure(ARegraElegibilidade : TValidacaoRegraElegibilidade; var Validou: Boolean) of object;
  EEventoGeradorDiferenteDC = class(Exception);

type
  TAnaliseElegibilidade = class
  private
    FBDEDatabaseName : String;
    FRegraElegibilidade : TRegraElegibilidade;
    FIdPessoaJur : Integer;
    FIdTitular : Integer;
    FDataAdmissao : TDateTime;
    FDataDemissao : TDateTime;
    FIdPessoa : Integer;
    FIdPlanoPrev : Integer;
    FIdEventoGerador : Integer;
    FDataEvento : String;
    FDataRequerimento : String;
    FFlgInternoAntes : String;
    FFlgInternoAtual : String;
    FIdSitPartAntes : String;
    FIdSitPlanAntes : String;
    FIdSitFuncAntes : String;
    FIdSitPartAtual : String;
    FIdSitPlanAtual : String;
    FIdSitFuncAtual : String;
    FValidacaoRegrasNaoElegiveis : TValidacaoRegrasNaoElegiveis;
    FMensagemRegrasNaoElegiveis : TStrings;
    FOnValidouAnaliseElegibilidade : TAnaliseElegibilidadeEvent;
    procedure CarregarDadosPessoa;
    procedure SetRegraElegibilidade(const Value: TRegraElegibilidade);
    //Regras de Elegibilidade
    function ValidarParticipantePossuiFinanciamentoHabitacionalAtivo : Boolean;
    function ValidarBeneficiosPeculio : Boolean;
    function CarregarIdade: Integer;
    function CarregarSexo: String;
    function ValidarPossuiMais3AnosContribuicao : Boolean;
    function ValidarPossuiMais10AnosContribuicao: Boolean;
    function ValidarExisteContribuicaoPagaDezembro2005ouPosterior : Boolean;
    function ValidarNaoElegivelBeneficioProgramadoPleno : Boolean;
    function ValidarExisteRegistroRescisaoContratoPatrocinadora : Boolean;
    function ValidarSemResgatePortabilidadeouBeneficioRendaContinuada : Boolean;
    function ValidarPossui120DiasContadosAPartirDataFatoGerador : Boolean;
    function ValidarEventoGerador(var OFlgInterno : String) : Boolean;
    function ExisteBeneficioVinculado(AIdBeneficio : Integer) : Boolean;
    function ExisteRegraElegibilidadeBeneficio(AIdBeneficio : Integer; var OIdRegraElegibili : Integer) : Boolean;
    function ParticipanteFezOpcoesValorBase(AIdBeneficio, ASeqProposta : Integer; var OValorBase1, OValorBase2, OValorBase3 : Double) : Boolean;
    function GetMensagemRegrasNaoElegiveis: String;
    procedure IncluirValidacaoRegrasNaoElegiveis(const AValidacaoRegrasNaoElegiveis: TValidacaoRegraElegibilidade);
    procedure GravarLOG(AMensagem : String);
  public
    property OnValidouAnaliseElegibilidade : TAnaliseElegibilidadeEvent read FOnValidouAnaliseElegibilidade write FOnValidouAnaliseElegibilidade;
    property RegraElegibilidade : TRegraElegibilidade read FRegraElegibilidade write SetRegraElegibilidade;
    property ValidacaoRegrasNaoElegiveis : TValidacaoRegrasNaoElegiveis read FValidacaoRegrasNaoElegiveis;
    property IdPessoaJur : Integer read FIdPessoaJur;
    property IdTitular : Integer read FIdTitular;
    property DataAdmissao : TDateTime read FDataAdmissao;
    property DataDemissao : TDateTime read FDataDemissao;
    property IdPessoa : Integer read FIdPessoa;
    property IdPlanoPrev : Integer read FIdPlanoPrev;
    property IdEventoGerador : Integer read FIdEventoGerador;
    property DataEvento : String read FDataEvento;
    property DataRequerimento : String read FDataRequerimento;
    property FlgInternoAntes : String read FFlgInternoAntes;
    property FlgInternoAtual : String read FFlgInternoAtual;
    property IdSitPartAntes : String read FIdSitPartAntes;
    property IdSitPlanAntes : String read FIdSitPlanAntes;
    property IdSitFuncAntes : String read FIdSitFuncAntes;
    property IdSitPartAtual : String read FIdSitPartAtual;
    property IdSitPlanAtual : String read FIdSitPlanAtual;
    property IdSitFuncAtual : String read FIdSitFuncAtual;
    property MensagemRegrasNaoElegiveis : String read GetMensagemRegrasNaoElegiveis;
    function ValidarRegra : Boolean;
    class function LocalizarRegraElegibilidade(AIdEventoGerador : String; AFlgInterno : String) : TRegraElegibilidade;
    constructor Create(ABDEDatabaseName : String; ARegraElegibilidade : TRegraElegibilidade; AIdPessoa : Integer;
                       AIdPlanoPrev : Integer; AIdEventoGerador : Integer; ADataEvento : String; ADataRequerimento : String;
                       AFlgInternoAntes : String; AFlgInternoAtual : String; AIdSitPartAntes : String; AIdSitPlanAntes : String; AIdSitFuncAntes : String;
                       AIdSitPartAtual : String; AIdSitPlanAtual : String; AIdSitFuncAtual : String; AIdTitular : Integer; AIdPessoaJur : Integer);
    destructor Destroy;
  end;

implementation

{ TAnaliseElegibilidade }

destructor TAnaliseElegibilidade.Destroy;
begin
  inherited;
  if (Assigned(FMensagemRegrasNaoElegiveis)) then
  begin
    FreeAndNil(FMensagemRegrasNaoElegiveis);
  end;
end;

function TAnaliseElegibilidade.ValidarExisteContribuicaoPagaDezembro2005ouPosterior: Boolean;
var
  qryHstContribuicaoPrev : TwwQuery;
begin
  Result := False;
  qryHstContribuicaoPrev := TwwQuery.Create(nil);
  try
    qryHstContribuicaoPrev.DatabaseName := FBDEDatabaseName;
    with qryHstContribuicaoPrev do
    begin
      SQL.Clear;
      SQL.Add('SELECT COUNT(1) total_contribuicoes');
      SQL.Add('  FROM hstcontribprev HCP');
      SQL.Add(' WHERE HCP.idpessoa = :idpessoa');
      SQL.Add('   AND SUBSTR(TRIM(HCP.mesreferencia), 6, 2) <> ''13''');
      SQL.Add('   AND HCP.sitrecebimento = ''2''');
      SQL.Add('   AND HCP.datarecebimento >= TO_DATE(''01/12/2005'', ''DD/MM/YYYY'')');
      Params.Clear;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      ParamByName('idpessoa').AsInteger := IdPessoa;
    end;
    qryHstContribuicaoPrev.Prepare;
    qryHstContribuicaoPrev.Open;
    if (not(qryHstContribuicaoPrev.IsEmpty)) or (qryHstContribuicaoPrev.FieldByName('total_contribuicoes').AsInteger >= 1) then
    begin
      Result := True;
    end;
    if Assigned(FOnValidouAnaliseElegibilidade) then
    begin
      OnValidouAnaliseElegibilidade(vreExisteContribuicaoPagaDezembro2005ouPosterior, Result);
    end;
    if not(Result) then
    begin
      IncluirValidacaoRegrasNaoElegiveis(vreExisteContribuicaoPagaDezembro2005ouPosterior);
    end;
  finally
    qryHstContribuicaoPrev.Close;
    FreeAndNil(qryHstContribuicaoPrev);
  end;
end;

function TAnaliseElegibilidade.ValidarExisteRegistroRescisaoContratoPatrocinadora: Boolean;
var
  qryElegPatro : TwwQuery;
begin
  Result := False;
  qryElegPatro := TwwQuery.Create(nil);
  try
    qryElegPatro.DatabaseName := FBDEDatabaseName;
    with qryElegPatro do
    begin
      SQL.Clear;
      SQL.Add('SELECT EP.datademissao');
      SQL.Add('  FROM elegpatro EP');
      SQL.Add(' WHERE EP.idpessoa = :idpessoa');
      Params.Clear;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      ParamByName('idpessoa').AsInteger := IdPessoa;
    end;
    qryElegPatro.Prepare;
    qryElegPatro.Open;
    Result := not(qryElegPatro.IsEmpty) and not(qryElegPatro.FieldByName('datademissao').IsNull);
    if Assigned(FOnValidouAnaliseElegibilidade) then
    begin
      OnValidouAnaliseElegibilidade(vreExisteRegistroRescisaoContratoPatrocinadora, Result);
    end;
    if not(Result) then
    begin
      IncluirValidacaoRegrasNaoElegiveis(vreExisteRegistroRescisaoContratoPatrocinadora);
    end;
  finally
    qryElegPatro.Close;
    FreeAndNil(qryElegPatro);
  end;
end;

function TAnaliseElegibilidade.ValidarNaoElegivelBeneficioProgramadoPleno: Boolean;
const
  SEQ_PROPOSTA = 1;
var
  idBeneficioPlano : Integer;
  idRegraElelibilidadeBeneficio : Integer;
  existeBeneficio : Boolean;
  regraElegibilidade : Boolean;
  qryAux : TwwQuery;
  rOpcao1,
  rOpcao2,
  rOpcao3 : Double;
  erroRegraElegibilidade : Boolean;
  mensagemErroRegraElegibilidade : String;
  bTem10Anos: Boolean; //BRUNO AZEVEDO
  iIdade: Integer; //BRUNO AZEVEDO
  sSexo: String; //BRUNO AZEVEDO
begin
  Result := True;
  idBeneficioPlano := 0;
  regraElegibilidade := False;
  existeBeneficio := False;
  if (IdPlanoPrev > 0) then
  begin
    case IdPlanoPrev of
      66 : begin //Plano de previdência REB
             idBeneficioPlano := 66;
             existeBeneficio := ExisteBeneficioVinculado(320); //benefício Renda Vitalícia Tempo Contribuição
           end;
       2 : begin //Plano de previdêncio REG/REPLAN
             idBeneficioPlano := 2;
             existeBeneficio := ExisteBeneficioVinculado(513); //benefício programado pleno
           end;
      74 : begin //Plano de previdêncio REG/REPLAN
             idBeneficioPlano := 74;
             existeBeneficio := ExisteBeneficioVinculado(479); //benefício programado pleno
           end;
    end;
    if (existeBeneficio) and (ExisteRegraElegibilidadeBeneficio(idBeneficioPlano, idRegraElelibilidadeBeneficio)) then
    begin
      qryAux := TwwQuery.Create(nil);
      ParticipanteFezOpcoesValorBase(idBeneficioPlano, SEQ_PROPOSTA, rOpcao1, rOpcao2, rOpcao3);
      try
        qryAux.DatabaseName := FBDEDatabaseName;
        regraElegibilidade := ExecutaRegraElegibilidade(qryAux,
                                                        idRegraElelibilidadeBeneficio,
                                                        IdPessoaJur,
                                                        idBeneficioPlano,
                                                        IdTitular,
                                                        SEQ_PROPOSTA,
                                                        idBeneficioPlano,
                                                        rOpcao1,
                                                        rOpcao2
                                                        rOpcao3,
                                                        DataEvento,
                                                        FormatDateTime('dd/mm/yyyy', FDataAdmissao),
                                                        FormatDateTime('dd/mm/yyyy', FDataDemissao),
                                                        DataRequerimento,
                                                        FlgInternoAntes,
                                                        FlgInternoAtual,
                                                        IdSitPartAntes,
                                                        IdSitPlanAntes,
                                                        IdSitFuncAntes,
                                                        IdSitPartAtual,
                                                        IdSitPlanAtual,
                                                        IdSitFuncAtual,
                                                        1,
                                                        0,
                                                        erroRegraElegibilidade,
                                                        mensagemErroRegraElegibilidade);
         Result := not(regraElegibilidade);
         if Assigned(FOnValidouAnaliseElegibilidade) then
         begin
           OnValidouAnaliseElegibilidade(vreNaoElegivelBeneficioProgramadoPleno, Result);
         end;
         if not(Result) then
         begin
           IncluirValidacaoRegrasNaoElegiveis(vreNaoElegivelBeneficioProgramadoPleno);
         end;
      finally
        qryAux.Close;
        FreeAndNil(qryAux);
      end;
    end else if IdPlanoPrev = 66 then begin
      //PARA SER ELEGIVEL TEM QUE TER 10 ANOS DE CONTRIBUIÇÃO (121 CONTRIBUIÇÕES OU MAIS) E 50 ANOS OU MAIS DE IDADE HOMEM OU MULHER
      bTem10Anos := ValidarPossuiMais10AnosContribuicao;
      iIdade     := CarregarIdade;
      if ((bTem10Anos) and (iIdade >= 50)) then begin
        Result := False;
        if Assigned(FOnValidouAnaliseElegibilidade) then
         begin
           OnValidouAnaliseElegibilidade(vreNaoElegivelBeneficioProgramadoPleno, Result);
         end;
         if not(Result) then
         begin
           IncluirValidacaoRegrasNaoElegiveis(vreNaoElegivelBeneficioProgramadoPleno);
         end;
      end;
    end else if IdPlanoPrev = 74 then begin
      //PARA SER ELEGIVEL TEM QUE TER 10 ANOS DE CONTRIBUIÇÃO (121 CONTRIBUIÇÕES OU MAIS) E 53 ANOS HOMEM OU 48 ANOS MULHER, OU, 10 ANOS DE CONTR. E INSS
      bTem10Anos := ValidarPossuiMais10AnosContribuicao;
      iIdade     := CarregarIdade;
      sSexo      := CarregarSexo;
      if ((bTem10Anos) and (((sSexo = 'M') and (iIdade >= 53)) or ((sSexo = 'F') and (iIdade >= 48)))) or
         ((bTem10Anos) and (existeBeneficio)) then begin
        Result := False;
        if Assigned(FOnValidouAnaliseElegibilidade) then
         begin
           OnValidouAnaliseElegibilidade(vreNaoElegivelBeneficioProgramadoPleno, Result);
         end;
         if not(Result) then
         begin
           IncluirValidacaoRegrasNaoElegiveis(vreNaoElegivelBeneficioProgramadoPleno);
         end;
      end;
    end
    else
    begin
      if Assigned(FOnValidouAnaliseElegibilidade) then
      begin
        OnValidouAnaliseElegibilidade(vreNaoElegivelBeneficioProgramadoPleno, Result);
      end;
      IncluirValidacaoRegrasNaoElegiveis(vreNaoElegivelBeneficioProgramadoPleno);
    end;
  end
  else
  begin
    raise EEventoGeradorDiferenteDC.Create('Plano previdenciário não informado.');
  end;
end;

function TAnaliseElegibilidade.ValidarPossui120DiasContadosAPartirDataFatoGerador: Boolean;
var
  qryElegPatro : TwwQuery;
  dataInicioAfastamento : TDateTime;
  dataAtualDatabase : TDateTime;
begin
  Result := True;
  qryElegPatro := TwwQuery.Create(nil);
  try
    try
      qryElegPatro.DatabaseName := FBDEDatabaseName;
      with qryElegPatro do
      begin
        SQL.Clear;
        SQL.Add('SELECT EP.datademissao,');
        SQL.Add('       TRUNC(SYSDATE) dataatual');
        SQL.Add('  FROM elegpatro EP');
        SQL.Add(' WHERE EP.idpessoa = :idpessoa');
        Params.Clear;
        Params.CreateParam(ftInteger, 'idpessoa', ptInput);
        ParamByName('idpessoa').AsInteger := IdPessoa;
      end;
      qryElegPatro.Prepare;
      qryElegPatro.Open;
      if (not(qryElegPatro.IsEmpty)) and(not(qryElegPatro.FieldByName('datademissao').IsNull)) then
      begin
        dataInicioAfastamento := qryElegPatro.FieldByName('datademissao').AsDateTime;
        dataAtualDatabase := qryElegPatro.FieldByName('dataatual').AsDateTime;
        dataInicioAfastamento := dataInicioAfastamento+120;
        if (dataInicioAfastamento < dataAtualDatabase) then
        begin
          Result := False;
        end;
      end
      else
    finally
      FreeAndNil(qryElegPatro);
    end;
    if Assigned(FOnValidouAnaliseElegibilidade) then
    begin
      OnValidouAnaliseElegibilidade(vrePossui120DiasContadosAPartirDataFatoGerador, Result);
    end;
    if not(Result) then
    begin
      IncluirValidacaoRegrasNaoElegiveis(vrePossui120DiasContadosAPartirDataFatoGerador);
    end;
  except
    Result := False;
    raise;
  end;
end;

function TAnaliseElegibilidade.ValidarPossuiMais3AnosContribuicao: Boolean;
var
  qryHstContribuicaoPrev : TwwQuery;
begin
  Result := False;
  qryHstContribuicaoPrev := TwwQuery.Create(nil);
  try
    qryHstContribuicaoPrev.DatabaseName := FBDEDatabaseName;
    with qryHstContribuicaoPrev do
    begin
      SQL.Clear;
      SQL.Add('SELECT SUM(contagem_contribuicoes) AS contagem_contribuicoes ');  // Andre Imakawa - SIG 85590
      SQL.Add('FROM ( ');                                                        // Andre Imakawa - SIG 85590
      SQL.Add('SELECT COUNT(Q.mescobrancaqtde) contagem_contribuicoes');
      SQL.Add('  FROM (SELECT HCP.mesreferencia,');
      SQL.Add('               COUNT(HCP.mesreferencia) mescobrancaqtde');
      SQL.Add('          FROM hstcontribprev HCP');
      SQL.Add('         WHERE HCP.idpessoa = :idpessoa');
      SQL.Add('           AND SUBSTR(TRIM(HCP.mesreferencia), 6, 2) <> ''13''');
      SQL.Add('           AND HCP.sitrecebimento = ''2''');
      SQL.Add('           AND HCP.FLGDEVOLUCAO = 0 ');
      SQL.Add('         GROUP BY HCP.mesreferencia) Q');
      SQL.Add(' UNION   ');                                                      // Andre Imakawa - SIG 85590
      SQL.Add(' SELECT NVL(SUM(TPCOMPRACARENCIA),0) FROM PARCELAMENTO P');       // Andre Imakawa - SIG 85590
      SQL.Add(' WHERE P.IDPESSOA = :idpessoa2  AND P.SITPARCELAMENTO=1)');       // Andre Imakawa - SIG 85590


      Params.Clear;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      ParamByName('idpessoa').AsInteger := IdPessoa;
      Params.CreateParam(ftInteger, 'idpessoa2', ptInput);                       // Andre Imakawa - SIG 85590
      ParamByName('idpessoa2').AsInteger := IdPessoa;                            // Andre Imakawa - SIG 85590

    end;
    qryHstContribuicaoPrev.Prepare;
    qryHstContribuicaoPrev.Open;
    if (not(qryHstContribuicaoPrev.IsEmpty)) and (qryHstContribuicaoPrev.FieldByName('contagem_contribuicoes').AsInteger >= 36) then
    begin
      Result := True;
    end;
    if Assigned(FOnValidouAnaliseElegibilidade) then
    begin
      OnValidouAnaliseElegibilidade(vrePossuiMais3AnosContribuicao, Result);
    end;
    if not(Result) then
    begin
      IncluirValidacaoRegrasNaoElegiveis(vrePossuiMais3AnosContribuicao);
    end;
  finally
    FreeAndNil(qryHstContribuicaoPrev);
  end;
end;

function TAnaliseElegibilidade.ValidarPossuiMais10AnosContribuicao: Boolean;
var
  qryHstContribuicaoPrev : TwwQuery;
begin
  Result := False;
  qryHstContribuicaoPrev := TwwQuery.Create(nil);
  try
    qryHstContribuicaoPrev.DatabaseName := FBDEDatabaseName;
    with qryHstContribuicaoPrev do
    begin
      SQL.Clear;
      SQL.Add('SELECT COUNT(Q.mescobrancaqtde) contagem_contribuicoes');
      SQL.Add('  FROM (SELECT HCP.mesreferencia,');
      SQL.Add('               COUNT(HCP.mesreferencia) mescobrancaqtde');
      SQL.Add('          FROM hstcontribprev HCP');
      SQL.Add('         WHERE HCP.idpessoa = :idpessoa');
      SQL.Add('           AND SUBSTR(TRIM(HCP.mesreferencia), 6, 2) <> ''13''');
      SQL.Add('           AND HCP.sitrecebimento = ''2''');
      SQL.Add('           AND HCP.FLGDEVOLUCAO = 0 ');
      SQL.Add('         GROUP BY HCP.mesreferencia) Q');
      Params.Clear;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      ParamByName('idpessoa').AsInteger := IdPessoa;
    end;
    qryHstContribuicaoPrev.Prepare;
    qryHstContribuicaoPrev.Open;
    if (not(qryHstContribuicaoPrev.IsEmpty)) and (qryHstContribuicaoPrev.FieldByName('contagem_contribuicoes').AsInteger >= 121) then
    begin
      Result := True;
    end;
  finally
    FreeAndNil(qryHstContribuicaoPrev);
  end;
end;

function TAnaliseElegibilidade.ValidarSemResgatePortabilidadeouBeneficioRendaContinuada: Boolean;
var
  flgEventoGeradorResgate : String;
  qryBenefbfciario : TwwQuery;

  function ListaBeneficios : String;
  var
    beneficios : TStrings;
  begin
     beneficios := TStringList.Create;
     beneficios.Clear;
     try
       case RegraElegibilidade of
         reElegibilidadeBPD : begin
                                case IdPlanoPrev of
                                  2 : begin //REG/REPLAN
                                        beneficios.Add('149'); //REG/REPLAN - Suplem Apos Tempo Contrib
                                        beneficios.Add('154'); //REG/REPLAN - Suplem Aposent Especial
                                        beneficios.Add('156'); //REG/REPLAN - Suplem Aposent por Idade
                                        beneficios.Add('159'); //REG/REPLAN - Suplem Aposent Invalidez
                                        beneficios.Add('338'); //REG/REPLAN - Suplem Pensão Assistido
                                        beneficios.Add('164'); //REG/REPLAN - Suplem de Pensão Ativo
                                        beneficios.Add('492'); //REG/REPLAN - Beneficio Pleno
                                        beneficios.Add('495'); //REG/REPLAN - Suplem Ap T Contrib Saldada
                                        beneficios.Add('496'); //REG/REPLAN - Suplem Pensão Saldada AT
                                        beneficios.Add('497'); //REG/REPLAN - Suplem Pensão Saldada AS
                                        beneficios.Add('503'); //REG/REPLAN - Suplem Ap por Idade Saldada
                                        beneficios.Add('504'); //REG/REPLAN - Suplem Ap Invalidez Saldada
                                        beneficios.Add('505'); //REG/REPLAN - Suplem Ap Especial Saldada
                                        beneficios.Add('506'); //REG/REPLAN - Beneficio Único Antecipado TC
                                        beneficios.Add('507'); //REG/REPLAN - Benef Único Antecipado Esp
                                        beneficios.Add('508'); //REG/REPLAN - Benef Único Antecip Idade
                                        beneficios.Add('509'); //REG/REPLAN - Benef Único Antecip Inval
                                        beneficios.Add('513'); //REG/REPLAN - Benef Programado Pleno
                                        beneficios.Add('514'); //REG/REPLAN - Benef Programado Antecipado
                                        beneficios.Add('515'); //REG/REPLAN - Benef Único Antecip Pensão
                                        beneficios.Add('521'); //REG/REPLAN - Beneficio por Invalidez
                                        beneficios.Add('522'); //REG/REPLAN - Benef. Pensão por Morte
                                        beneficios.Add('378'); //Resgate de Contrib sem Dedução de IRRF
                                        beneficios.Add('418'); //Resgate Complementar com Dedução de IRRF
                                        beneficios.Add('458'); //Resgate Complementar sem Dedução de IRRF
                                        beneficios.Add('478'); //Resgate Judicial com Dedução de IRRF
                                        beneficios.Add('493'); //Portabilidade - Entidade Aberta
                                        beneficios.Add('510'); //Resgate Judicial sem Dedução de IRRF
                                        beneficios.Add('516'); //Portabilidade - Entidade Fechada
                                        beneficios.Add('523'); //Resgate de Contrib. com Dedução de IRRF - SALDADO
                                        beneficios.Add('524'); //Resgate de Contrib. sem Dedução de IRRF - SALDADO
                                        beneficios.Add('590'); //Resgate de Contribuições c/ Ded. IRRF-Beneficiário Designado
                                        beneficios.Add('591'); //Resgate de Contribuições s/ Ded. IRRF-Beneficiário Designado
                                        beneficios.Add('231'); //Resgate de Contrib com Dedução de IRRF
                                      end;
                                 66 : begin //REB
                                        beneficios.Add('151'); //REB - Benef Diferido Deslig Tit. Licenc
                                        beneficios.Add('152'); //REB - Renda Vitalícia Tempo Contribuição
                                        beneficios.Add('160'); //REB - Renda Vital. Invalidez PartTit Lic
                                        beneficios.Add('161'); //REB - Renda Vitalícia Apos. Invalidez
                                        beneficios.Add('165'); //REB - Pensão por Morte Ativo
                                        beneficios.Add('171'); //REB - Pensão por Morte do Part Tit Lic
                                        beneficios.Add('251'); //REB - Renda Antecipada  Apos Invalidez
                                        beneficios.Add('252'); //REB - Renda Antecipada Tempo Contrib
                                        beneficios.Add('277'); //REB - Resgate Falecimento Partic Ativo
                                        beneficios.Add('278'); //REB - Pensão por Morte Assistido
                                        beneficios.Add('279'); //REB - Pecúlio por Morte Assistido
                                        beneficios.Add('318'); //REB - Benefício Pleno
                                        beneficios.Add('319'); //REB - Renda Antecipada Tempo Contrib
                                        beneficios.Add('320'); //REB - Renda Vitalícia Tempo Contrib
                                        beneficios.Add('323'); //REB - Resgate Falecimento Part Ativo
                                        beneficios.Add('324'); //REB - Pensão por Morte Ativo
                                        beneficios.Add('325'); //REB - Pensão por Morte Assistido
                                        beneficios.Add('326'); //REB - Pensão por Morte Partic Licenc
                                        beneficios.Add('327'); //REB - Renda Antecipada Apos. Inval
                                        beneficios.Add('328'); //REB - Renda Vitalícia Apos Invalidez
                                        beneficios.Add('329'); //REB - Renda Vitalícia Inval Part Lic
                                        beneficios.Add('517'); //REB - Renda Antecipada BP
                                        beneficios.Add('526'); //REB - Resgate Falecimento Part Ativo
                                        beneficios.Add('378'); //Resgate de Contrib sem Dedução de IRRF
                                        beneficios.Add('418'); //Resgate Complementar com Dedução de IRRF
                                        beneficios.Add('458'); //Resgate Complementar sem Dedução de IRRF
                                        beneficios.Add('478'); //Resgate Judicial com Dedução de IRRF
                                        beneficios.Add('493'); //Portabilidade - Entidade Aberta
                                        beneficios.Add('510'); //Resgate Judicial sem Dedução de IRRF
                                        beneficios.Add('516'); //Portabilidade - Entidade Fechada
                                        beneficios.Add('523'); //Resgate de Contrib. com Dedução de IRRF - SALDADO
                                        beneficios.Add('524'); //Resgate de Contrib. sem Dedução de IRRF - SALDADO
                                        beneficios.Add('590'); //Resgate de Contribuições c/ Ded. IRRF-Beneficiário Designado
                                        beneficios.Add('591'); //Resgate de Contribuições s/ Ded. IRRF-Beneficiário Designado
                                        beneficios.Add('231'); //Resgate de Contrib com Dedução de IRRF
                                      end;
                                 74 : begin //NOVO PLANO
                                        beneficios.Add('299'); //F/PMPP - Aposentadoria
                                        beneficios.Add('300'); //F/PMPP - Aposentadoria (Lei 6683/79)
                                        beneficios.Add('301'); //F/PMPP - Aposentadoria CEF
                                        beneficios.Add('302'); //F/PMPP - Pensão por Morte
                                        beneficios.Add('303'); //F/PMPP - Pensão por Morte (Aposent CEF)
                                        beneficios.Add('304'); //F/PMPP - Pensão por Morte (Lei 6683/79)
                                        beneficios.Add('479'); //NP - Benef Programado Pleno
                                        beneficios.Add('480'); //NP - Benef Programado Antecipado
                                        beneficios.Add('481'); //NP - Beneficio por Invalidez
                                        beneficios.Add('482'); //NP - Benef Pensão por Morte Ativo
                                        beneficios.Add('483'); //NP - Benef Único Antecipado
                                        beneficios.Add('484'); //NP - Benef Único Antecipado Invalidez
                                        beneficios.Add('487'); //NP - Beneficio Pleno
                                        beneficios.Add('488'); //NP - Benef Pensão por Morte Assistido
                                        beneficios.Add('528'); //NP - Resgate de Contribuições para Beneficiário Designado
                                        beneficios.Add('518'); //NP - Benef Único Antecipado BP
                                        beneficios.Add('520'); //NP - Beneficio Único Antecipado Pensão
                                        beneficios.Add('378'); //Resgate de Contrib sem Dedução de IRRF
                                        beneficios.Add('418'); //Resgate Complementar com Dedução de IRRF
                                        beneficios.Add('458'); //Resgate Complementar sem Dedução de IRRF
                                        beneficios.Add('478'); //Resgate Judicial com Dedução de IRRF
                                        beneficios.Add('493'); //Portabilidade - Entidade Aberta
                                        beneficios.Add('510'); //Resgate Judicial sem Dedução de IRRF
                                        beneficios.Add('516'); //Portabilidade - Entidade Fechada
                                        beneficios.Add('523'); //Resgate de Contrib. com Dedução de IRRF - SALDADO
                                        beneficios.Add('524'); //Resgate de Contrib. sem Dedução de IRRF - SALDADO
                                        beneficios.Add('590'); //Resgate de Contribuições c/ Ded. IRRF-Beneficiário Designado
                                        beneficios.Add('591'); //Resgate de Contribuições s/ Ded. IRRF-Beneficiário Designado
                                        beneficios.Add('231'); //Resgate de Contrib com Dedução de IRRF
                                      end;
                                 end;
                              end;
         reElegibilidadePortabilidade : begin
                                          case IdPlanoPrev of
                                            2 : begin //REG/REPLAN
                                                  beneficios.Add('149'); //REG/REPLAN - Suplem Apos Tempo Contrib
                                                  beneficios.Add('154'); //REG/REPLAN - Suplem Aposent Especial
                                                  beneficios.Add('156'); //REG/REPLAN - Suplem Aposent por Idade
                                                  beneficios.Add('159'); //REG/REPLAN - Suplem Aposent Invalidez
                                                  beneficios.Add('338'); //REG/REPLAN - Suplem Pensão Assistido
                                                  beneficios.Add('164'); //REG/REPLAN - Suplem de Pensão Ativo
                                                  beneficios.Add('492'); //REG/REPLAN - Beneficio Pleno
                                                  beneficios.Add('495'); //REG/REPLAN - Suplem Ap T Contrib Saldada
                                                  beneficios.Add('496'); //REG/REPLAN - Suplem Pensão Saldada AT
                                                  beneficios.Add('497'); //REG/REPLAN - Suplem Pensão Saldada AS
                                                  beneficios.Add('503'); //REG/REPLAN - Suplem Ap por Idade Saldada
                                                  beneficios.Add('504'); //REG/REPLAN - Suplem Ap Invalidez Saldada
                                                  beneficios.Add('505'); //REG/REPLAN - Suplem Ap Especial Saldada
                                                  beneficios.Add('506'); //REG/REPLAN - Beneficio Único Antecipado TC
                                                  beneficios.Add('507'); //REG/REPLAN - Benef Único Antecipado Esp
                                                  beneficios.Add('508'); //REG/REPLAN - Benef Único Antecip Idade
                                                  beneficios.Add('509'); //REG/REPLAN - Benef Único Antecip Inval
                                                  beneficios.Add('513'); //REG/REPLAN - Benef Programado Pleno
                                                  beneficios.Add('514'); //REG/REPLAN - Benef Programado Antecipado
                                                  beneficios.Add('515'); //REG/REPLAN - Benef Único Antecip Pensão
                                                  beneficios.Add('521'); //REG/REPLAN - Beneficio por Invalidez
                                                  beneficios.Add('522'); //REG/REPLAN - Benef. Pensão por Morte
                                                  // Andre Imakawa - SIG 131531
                                                  {
                                                  beneficios.Add('378'); //Resgate de Contrib sem Dedução de IRRF
                                                  beneficios.Add('418'); //Resgate Complementar com Dedução de IRRF
                                                  beneficios.Add('458'); //Resgate Complementar sem Dedução de IRRF
                                                  beneficios.Add('478'); //Resgate Judicial com Dedução de IRRF
                                                  beneficios.Add('493'); //Portabilidade - Entidade Aberta
                                                  beneficios.Add('510'); //Resgate Judicial sem Dedução de IRRF
                                                  beneficios.Add('516'); //Portabilidade - Entidade Fechada
                                                  beneficios.Add('523'); //Resgate de Contrib. com Dedução de IRRF - SALDADO
                                                  beneficios.Add('524'); //Resgate de Contrib. sem Dedução de IRRF - SALDADO
                                                  beneficios.Add('590'); //Resgate de Contribuições c/ Ded. IRRF-Beneficiário Designado
                                                  beneficios.Add('591'); //Resgate de Contribuições s/ Ded. IRRF-Beneficiário Designado
                                                  beneficios.Add('231'); //Resgate de Contrib com Dedução de IRRF
                                                  }
                                                end;
                                           66 : begin //REB
                                                  beneficios.Add('151'); //REB - Benef Diferido Deslig Tit. Licenc
                                                  beneficios.Add('152'); //REB - Renda Vitalícia Tempo Contribuição
                                                  beneficios.Add('160'); //REB - Renda Vital. Invalidez PartTit Lic
                                                  beneficios.Add('161'); //REB - Renda Vitalícia Apos. Invalidez
                                                  beneficios.Add('165'); //REB - Pensão por Morte Ativo
                                                  beneficios.Add('171'); //REB - Pensão por Morte do Part Tit Lic
                                                  beneficios.Add('251'); //REB - Renda Antecipada  Apos Invalidez
                                                  beneficios.Add('252'); //REB - Renda Antecipada Tempo Contrib
                                                  beneficios.Add('277'); //REB - Resgate Falecimento Partic Ativo
                                                  beneficios.Add('278'); //REB - Pensão por Morte Assistido
                                                  beneficios.Add('279'); //REB - Pecúlio por Morte Assistido
                                                  beneficios.Add('318'); //REB - Benefício Pleno
                                                  beneficios.Add('319'); //REB - Renda Antecipada Tempo Contrib
                                                  beneficios.Add('320'); //REB - Renda Vitalícia Tempo Contrib
                                                  beneficios.Add('323'); //REB - Resgate Falecimento Part Ativo
                                                  beneficios.Add('324'); //REB - Pensão por Morte Ativo
                                                  beneficios.Add('325'); //REB - Pensão por Morte Assistido
                                                  beneficios.Add('326'); //REB - Pensão por Morte Partic Licenc
                                                  beneficios.Add('327'); //REB - Renda Antecipada Apos. Inval
                                                  beneficios.Add('328'); //REB - Renda Vitalícia Apos Invalidez
                                                  beneficios.Add('329'); //REB - Renda Vitalícia Inval Part Lic
                                                  beneficios.Add('517'); //REB - Renda Antecipada BP
                                                  beneficios.Add('526'); //REB - Resgate Falecimento Part Ativo
                                                  // Andre Imakawa - SIG 131531
                                                  {
                                                  beneficios.Add('378'); //Resgate de Contrib sem Dedução de IRRF
                                                  beneficios.Add('418'); //Resgate Complementar com Dedução de IRRF
                                                  beneficios.Add('458'); //Resgate Complementar sem Dedução de IRRF
                                                  beneficios.Add('478'); //Resgate Judicial com Dedução de IRRF
                                                  beneficios.Add('493'); //Portabilidade - Entidade Aberta
                                                  beneficios.Add('510'); //Resgate Judicial sem Dedução de IRRF
                                                  beneficios.Add('516'); //Portabilidade - Entidade Fechada
                                                  beneficios.Add('523'); //Resgate de Contrib. com Dedução de IRRF - SALDADO
                                                  beneficios.Add('524'); //Resgate de Contrib. sem Dedução de IRRF - SALDADO
                                                  beneficios.Add('590'); //Resgate de Contribuições c/ Ded. IRRF-Beneficiário Designado
                                                  beneficios.Add('591'); //Resgate de Contribuições s/ Ded. IRRF-Beneficiário Designado
                                                  beneficios.Add('231'); //Resgate de Contrib com Dedução de IRRF
                                                  }
                                                end;
                                           74 : begin //NOVO PLANO
                                                  beneficios.Add('299'); //F/PMPP - Aposentadoria
                                                  beneficios.Add('300'); //F/PMPP - Aposentadoria (Lei 6683/79)
                                                  beneficios.Add('301'); //F/PMPP - Aposentadoria CEF
                                                  beneficios.Add('302'); //F/PMPP - Pensão por Morte
                                                  beneficios.Add('303'); //F/PMPP - Pensão por Morte (Aposent CEF)
                                                  beneficios.Add('304'); //F/PMPP - Pensão por Morte (Lei 6683/79)
                                                  beneficios.Add('479'); //NP - Benef Programado Pleno
                                                  beneficios.Add('480'); //NP - Benef Programado Antecipado
                                                  beneficios.Add('481'); //NP - Beneficio por Invalidez
                                                  beneficios.Add('482'); //NP - Benef Pensão por Morte Ativo
                                                  beneficios.Add('483'); //NP - Benef Único Antecipado
                                                  beneficios.Add('484'); //NP - Benef Único Antecipado Invalidez
                                                  beneficios.Add('487'); //NP - Beneficio Pleno
                                                  beneficios.Add('488'); //NP - Benef Pensão por Morte Assistido
                                                  beneficios.Add('528'); //NP - Resgate de Contribuições para Beneficiário Designado
                                                  beneficios.Add('518'); //NP - Benef Único Antecipado BP
                                                  beneficios.Add('520'); //NP - Beneficio Único Antecipado Pensão
                                                  // Andre Imakawa - SIG 131531                                                  
                                                  {
                                                  beneficios.Add('378'); //Resgate de Contrib sem Dedução de IRRF
                                                  beneficios.Add('418'); //Resgate Complementar com Dedução de IRRF
                                                  beneficios.Add('458'); //Resgate Complementar sem Dedução de IRRF
                                                  beneficios.Add('478'); //Resgate Judicial com Dedução de IRRF
                                                  beneficios.Add('493'); //Portabilidade - Entidade Aberta
                                                  beneficios.Add('510'); //Resgate Judicial sem Dedução de IRRF
                                                  beneficios.Add('516'); //Portabilidade - Entidade Fechada
                                                  beneficios.Add('523'); //Resgate de Contrib. com Dedução de IRRF - SALDADO
                                                  beneficios.Add('524'); //Resgate de Contrib. sem Dedução de IRRF - SALDADO
                                                  beneficios.Add('590'); //Resgate de Contribuições c/ Ded. IRRF-Beneficiário Designado
                                                  beneficios.Add('591'); //Resgate de Contribuições s/ Ded. IRRF-Beneficiário Designado
                                                  beneficios.Add('231'); //Resgate de Contrib com Dedução de IRRF
                                                  }
                                                end;
                                          end;
                                        end;
         reElegibilidadeResgate : begin
                                    case IdPlanoPrev of
                                      2 : begin //REG/REPLAN
                                            beneficios.Add('149'); //REG/REPLAN - Suplem Apos Tempo Contrib
                                            beneficios.Add('154'); //REG/REPLAN - Suplem Aposent Especial
                                            beneficios.Add('156'); //REG/REPLAN - Suplem Aposent por Idade
                                            beneficios.Add('159'); //REG/REPLAN - Suplem Aposent Invalidez
                                            beneficios.Add('338'); //REG/REPLAN - Suplem Pensão Assistido
                                            beneficios.Add('164'); //REG/REPLAN - Suplem de Pensão Ativo
                                            beneficios.Add('492'); //REG/REPLAN - Beneficio Pleno
                                            beneficios.Add('495'); //REG/REPLAN - Suplem Ap T Contrib Saldada
                                            beneficios.Add('496'); //REG/REPLAN - Suplem Pensão Saldada AT
                                            beneficios.Add('497'); //REG/REPLAN - Suplem Pensão Saldada AS
                                            beneficios.Add('503'); //REG/REPLAN - Suplem Ap por Idade Saldada
                                            beneficios.Add('504'); //REG/REPLAN - Suplem Ap Invalidez Saldada
                                            beneficios.Add('505'); //REG/REPLAN - Suplem Ap Especial Saldada
                                            beneficios.Add('506'); //REG/REPLAN - Beneficio Único Antecipado TC
                                            beneficios.Add('507'); //REG/REPLAN - Benef Único Antecipado Esp
                                            beneficios.Add('508'); //REG/REPLAN - Benef Único Antecip Idade
                                            beneficios.Add('509'); //REG/REPLAN - Benef Único Antecip Inval
                                            beneficios.Add('513'); //REG/REPLAN - Benef Programado Pleno
                                            beneficios.Add('514'); //REG/REPLAN - Benef Programado Antecipado
                                            beneficios.Add('515'); //REG/REPLAN - Benef Único Antecip Pensão
                                            beneficios.Add('521'); //REG/REPLAN - Beneficio por Invalidez
                                            beneficios.Add('522'); //REG/REPLAN - Benef. Pensão por Morte
                                            beneficios.Add('378'); //Resgate de Contrib sem Dedução de IRRF
                                            beneficios.Add('418'); //Resgate Complementar com Dedução de IRRF
                                            beneficios.Add('458'); //Resgate Complementar sem Dedução de IRRF
                                            beneficios.Add('478'); //Resgate Judicial com Dedução de IRRF
                                            beneficios.Add('493'); //Portabilidade - Entidade Aberta
                                            beneficios.Add('510'); //Resgate Judicial sem Dedução de IRRF
                                            beneficios.Add('516'); //Portabilidade - Entidade Fechada
                                            beneficios.Add('523'); //Resgate de Contrib. com Dedução de IRRF - SALDADO
                                            beneficios.Add('524'); //Resgate de Contrib. sem Dedução de IRRF - SALDADO
                                            beneficios.Add('590'); //Resgate de Contribuições c/ Ded. IRRF-Beneficiário Designado
                                            beneficios.Add('591'); //Resgate de Contribuições s/ Ded. IRRF-Beneficiário Designado
                                            beneficios.Add('231'); //Resgate de Contrib com Dedução de IRRF
                                          end;
                                     66 : begin //REB
                                            beneficios.Add('151'); //REB - Benef Diferido Deslig Tit. Licenc
                                            beneficios.Add('152'); //REB - Renda Vitalícia Tempo Contribuição
                                            beneficios.Add('160'); //REB - Renda Vital. Invalidez PartTit Lic
                                            beneficios.Add('161'); //REB - Renda Vitalícia Apos. Invalidez
                                            beneficios.Add('165'); //REB - Pensão por Morte Ativo
                                            beneficios.Add('171'); //REB - Pensão por Morte do Part Tit Lic
                                            beneficios.Add('251'); //REB - Renda Antecipada  Apos Invalidez
                                            beneficios.Add('252'); //REB - Renda Antecipada Tempo Contrib
                                            beneficios.Add('277'); //REB - Resgate Falecimento Partic Ativo
                                            beneficios.Add('278'); //REB - Pensão por Morte Assistido
                                            beneficios.Add('279'); //REB - Pecúlio por Morte Assistido
                                            beneficios.Add('318'); //REB - Benefício Pleno
                                            beneficios.Add('319'); //REB - Renda Antecipada Tempo Contrib
                                            beneficios.Add('320'); //REB - Renda Vitalícia Tempo Contrib
                                            beneficios.Add('323'); //REB - Resgate Falecimento Part Ativo
                                            beneficios.Add('324'); //REB - Pensão por Morte Ativo
                                            beneficios.Add('325'); //REB - Pensão por Morte Assistido
                                            beneficios.Add('326'); //REB - Pensão por Morte Partic Licenc
                                            beneficios.Add('327'); //REB - Renda Antecipada Apos. Inval
                                            beneficios.Add('328'); //REB - Renda Vitalícia Apos Invalidez
                                            beneficios.Add('329'); //REB - Renda Vitalícia Inval Part Lic
                                            beneficios.Add('517'); //REB - Renda Antecipada BP
                                            beneficios.Add('378'); //Resgate de Contrib sem Dedução de IRRF
                                            beneficios.Add('418'); //Resgate Complementar com Dedução de IRRF
                                            beneficios.Add('458'); //Resgate Complementar sem Dedução de IRRF
                                            beneficios.Add('478'); //Resgate Judicial com Dedução de IRRF
                                            beneficios.Add('493'); //Portabilidade - Entidade Aberta
                                            beneficios.Add('510'); //Resgate Judicial sem Dedução de IRRF
                                            beneficios.Add('516'); //Portabilidade - Entidade Fechada
                                            beneficios.Add('523'); //Resgate de Contrib. com Dedução de IRRF - SALDADO
                                            beneficios.Add('524'); //Resgate de Contrib. sem Dedução de IRRF - SALDADO
                                            beneficios.Add('590'); //Resgate de Contribuições c/ Ded. IRRF-Beneficiário Designado
                                            beneficios.Add('591'); //Resgate de Contribuições s/ Ded. IRRF-Beneficiário Designado
                                            beneficios.Add('231'); //Resgate de Contrib com Dedução de IRRF
                                          end;
                                     74 : begin //NOVO PLANO
                                            beneficios.Add('299'); //F/PMPP - Aposentadoria
                                            beneficios.Add('300'); //F/PMPP - Aposentadoria (Lei 6683/79)
                                            beneficios.Add('301'); //F/PMPP - Aposentadoria CEF
                                            beneficios.Add('302'); //F/PMPP - Pensão por Morte
                                            beneficios.Add('303'); //F/PMPP - Pensão por Morte (Aposent CEF)
                                            beneficios.Add('304'); //F/PMPP - Pensão por Morte (Lei 6683/79)
                                            beneficios.Add('479'); //NP - Benef Programado Pleno
                                            beneficios.Add('480'); //NP - Benef Programado Antecipado
                                            beneficios.Add('481'); //NP - Beneficio por Invalidez
                                            beneficios.Add('482'); //NP - Benef Pensão por Morte Ativo
                                            beneficios.Add('483'); //NP - Benef Único Antecipado
                                            beneficios.Add('484'); //NP - Benef Único Antecipado Invalidez
                                            beneficios.Add('487'); //NP - Beneficio Pleno
                                            beneficios.Add('488'); //NP - Benef Pensão por Morte Assistido
                                            beneficios.Add('528'); //NP - Resgate de Contribuições para Beneficiário Designado
                                            beneficios.Add('518'); //NP - Benef Único Antecipado BP
                                            beneficios.Add('378'); //Resgate de Contrib sem Dedução de IRRF
                                            beneficios.Add('418'); //Resgate Complementar com Dedução de IRRF
                                            beneficios.Add('458'); //Resgate Complementar sem Dedução de IRRF
                                            beneficios.Add('478'); //Resgate Judicial com Dedução de IRRF
                                            beneficios.Add('493'); //Portabilidade - Entidade Aberta
                                            beneficios.Add('510'); //Resgate Judicial sem Dedução de IRRF
                                            beneficios.Add('516'); //Portabilidade - Entidade Fechada
                                            beneficios.Add('523'); //Resgate de Contrib. com Dedução de IRRF - SALDADO
                                            beneficios.Add('524'); //Resgate de Contrib. sem Dedução de IRRF - SALDADO
                                            beneficios.Add('590'); //Resgate de Contribuições c/ Ded. IRRF-Beneficiário Designado
                                            beneficios.Add('591'); //Resgate de Contribuições s/ Ded. IRRF-Beneficiário Designado
                                            beneficios.Add('231'); //Resgate de Contrib com Dedução de IRRF
                                          end;
                                    end;
                                  end;
       end;
       Result := StringReplace(beneficios.CommaText, ';', ',', [rfReplaceAll]);
     finally
       FreeAndNil(beneficios);
     end;
  end;
begin
  Result := True;
  try
    if (RegraElegibilidade in [reElegibilidadeBPD, reElegibilidadePortabilidade, reElegibilidadeResgate])
    and (IdPlanoPrev in [2, 66, 74]) then
    begin
      qryBenefbfciario := TwwQuery.Create(nil);
      try
        qryBenefbfciario.DatabaseName := FBDEDatabaseName;
        with qryBenefbfciario do
        begin
          SQL.Clear;
          SQL.Add('SELECT B.idbeneficio');
          SQL.Add('  FROM benefbfciario B');
          SQL.Add(' WHERE B.idpessoa = :idpessoa');
          SQL.Add('   AND B.idplanoprev = :idplanoprev');
          SQL.Add('   AND B.idbeneficio IN ('+ListaBeneficios()+')');

          // Osni Cavacante - SIG 52311 - Início da alteração
          SQL.Add('   AND NOT EXISTS (SELECT 1');
          SQL.Add('   FROM EVENTOSPREV E');
          SQL.Add('   WHERE E.IDPESSOA = B.IDPESSOA');
          SQL.Add('         AND E.IDPLANOPREV = B.IDPLANOPREV');
          //SQL.Add('         AND E.IDEVENTOGERADOR = 23');//Andre Imakawa - SIG 67753
          //SQL.Add('         AND E.DATAREGISTRO > B.DATAFINAL)');//Andre Imakawa - SIG 67753
          // Osni Cavacante - SIG 52311 - Fim da alteração
          //Taffarel - SIG70973 - início

          case IdEventoGerador of
           15,337,334: SQL.Add('         AND E.IDEVENTOGERADOR IN (23,383,352,373,368,1)'); // Rafael Vasconcelos - SIG 82811
           else  SQL.Add('         AND E.IDEVENTOGERADOR IN (23,383,352)');  //Andre Imakawa - SIG 67753
          end;

          //Taffarel - SIG70973 - fim
          SQL.Add('         AND E.DATAREGISTRO >= B.DATAFINAL)'); //Andre Imakawa - SIG 67753
          Params.Clear;
          Params.CreateParam(ftInteger, 'idpessoa', ptInput);
          ParamByName('idpessoa').AsInteger := IdPessoa;
          Params.CreateParam(ftInteger, 'idplanoprev', ptInput);
          ParamByName('idplanoprev').AsInteger := IdPlanoPrev;
        end;
        qryBenefbfciario.Prepare;
        qryBenefbfciario.Open;
        Result := qryBenefbfciario.IsEmpty; //Não deve existir nenhum registro.
      finally
        FreeAndNil(qryBenefbfciario);
      end;
    end;

    if Assigned(FOnValidouAnaliseElegibilidade) then
    begin
      OnValidouAnaliseElegibilidade(vreSemResgatePortabilidadeouBeneficioRendaContinuada, Result);
    end;

    if not(Result) then
    begin
      IncluirValidacaoRegrasNaoElegiveis(vreSemResgatePortabilidadeouBeneficioRendaContinuada);
    end;

  except
    Result := False;
    raise;
  end;
end;

procedure TAnaliseElegibilidade.SetRegraElegibilidade(
  const Value: TRegraElegibilidade);
begin
  FRegraElegibilidade := Value;
  FValidacaoRegrasNaoElegiveis := [];
end;

function TAnaliseElegibilidade.ValidarRegra: Boolean;
var
  flgEventoGeradorResgate : String;
  checkValidarPossuiMais3AnosContribuicao : Boolean;
  checkValidarExisteContribuicaoPagaDezembro2005ouPosterior : Boolean;
  checkValidarNaoElegivelBeneficioProgramadoPleno : Boolean;
  checkValidarExisteRegistroRescisaoContratoPatrocinadora : Boolean;
  checkValidarSemResgatePortabilidadeouBeneficioRendaContinuada : Boolean;
  checkValidarPossui120DiasContadosAPartirDataFatoGerador  : Boolean;
begin
  Result := True;
  ValidarParticipantePossuiFinanciamentoHabitacionalAtivo();
  if (ValidarEventoGerador(flgEventoGeradorResgate))  then
  begin
    case FRegraElegibilidade of
       reElegibilidadeBPD : begin
                              //demissão com cancelamento identificados por meio da estrutura de evento gerador (EVENTOGERADOR) campo identificador (FLGINTERNO) igual a DC. (Demissão com cancelamento)
                              //BRUNO AZEVEDO
                              if (flgEventoGeradorResgate = 'DC') or (flgEventoGeradorResgate = 'DS') then
                              begin
                                if (ValidarBeneficiosPeculio) then
                                begin
                                  checkValidarExisteRegistroRescisaoContratoPatrocinadora := ValidarExisteRegistroRescisaoContratoPatrocinadora();
                                  checkValidarPossuiMais3AnosContribuicao := ValidarPossuiMais3AnosContribuicao();
                                  checkValidarNaoElegivelBeneficioProgramadoPleno := ValidarNaoElegivelBeneficioProgramadoPleno();
                                  checkValidarSemResgatePortabilidadeouBeneficioRendaContinuada := ValidarSemResgatePortabilidadeouBeneficioRendaContinuada();
                                  Result := (checkValidarPossuiMais3AnosContribuicao)
                                        and (checkValidarNaoElegivelBeneficioProgramadoPleno)
                                        and (checkValidarExisteRegistroRescisaoContratoPatrocinadora)
                                        and (checkValidarSemResgatePortabilidadeouBeneficioRendaContinuada);
                                end
                                else
                                begin
                                  Result := False;
                                end;
                              end;
                            end;
       reElegibilidadePortabilidade : begin
                                        //demissão com cancelamento identificados por meio da estrutura de evento gerador (EVENTOGERADOR) campo identificador (FLGINTERNO) igual a DC. (Demissão com cancelamento)
                                        if (flgEventoGeradorResgate = 'DC') then
                                        begin
                                          if (ValidarBeneficiosPeculio) then
                                          begin
                                            checkValidarPossuiMais3AnosContribuicao := (ValidarPossuiMais3AnosContribuicao);
                                            checkValidarExisteRegistroRescisaoContratoPatrocinadora := (ValidarExisteRegistroRescisaoContratoPatrocinadora);
                                            checkValidarSemResgatePortabilidadeouBeneficioRendaContinuada := (ValidarSemResgatePortabilidadeouBeneficioRendaContinuada);
                                            Result := (checkValidarPossuiMais3AnosContribuicao)
                                                  and (checkValidarExisteRegistroRescisaoContratoPatrocinadora)
                                                  and (checkValidarSemResgatePortabilidadeouBeneficioRendaContinuada);
                                          end
                                          else
                                          begin
                                            Result := False;
                                          end;
                                        end;
                                      end;
       reElegibilidadeResgate : begin
                                  //demissão com cancelamento identificados por meio da estrutura de evento gerador (EVENTOGERADOR) campo identificador (FLGINTERNO) igual a DC (Resgate).
                                  if (flgEventoGeradorResgate = 'DC') then
                                  begin
                                    if (ValidarBeneficiosPeculio) then
                                    begin
                                      checkValidarExisteRegistroRescisaoContratoPatrocinadora := ValidarExisteRegistroRescisaoContratoPatrocinadora();
                                      checkValidarSemResgatePortabilidadeouBeneficioRendaContinuada := ValidarSemResgatePortabilidadeouBeneficioRendaContinuada();
                                      Result := (checkValidarExisteRegistroRescisaoContratoPatrocinadora)
                                            and (checkValidarSemResgatePortabilidadeouBeneficioRendaContinuada);
                                    end
                                    else
                                    begin
                                      Result := False;
                                    end;
                                  end;
                                end;
       reElegibilidadeAutopatrocinio : begin
                                         //afastamento identificados por meio do identificador (IDSITPART) igual a 83 – “Aguardando Opção pelo Autopatrocínio Total, e, do evento gerador (EVENTOGERADOR) igual a 351 – “Aguardando pelo Autopatrocínio Total”.
                                         //if (IdSitPartAtual = '83') and (IdEventoGerador = 351) then
                                         //begin
                                           checkValidarExisteRegistroRescisaoContratoPatrocinadora := ValidarExisteRegistroRescisaoContratoPatrocinadora();
                                           checkValidarPossui120DiasContadosAPartirDataFatoGerador := ValidarPossui120DiasContadosAPartirDataFatoGerador();
                                           Result := (checkValidarExisteRegistroRescisaoContratoPatrocinadora)
                                                 and (checkValidarPossui120DiasContadosAPartirDataFatoGerador);
                                         //end;
                                       end;
    end;
  end;
end;

constructor TAnaliseElegibilidade.Create(ABDEDatabaseName : String;
            ARegraElegibilidade : TRegraElegibilidade; AIdPessoa : Integer;
            AIdPlanoPrev : Integer; AIdEventoGerador : Integer; ADataEvento : String; ADataRequerimento : String;
            AFlgInternoAntes : String; AFlgInternoAtual : String; AIdSitPartAntes : String; AIdSitPlanAntes : String; AIdSitFuncAntes : String;
            AIdSitPartAtual : String; AIdSitPlanAtual : String; AIdSitFuncAtual : String; AIdTitular : Integer; AIdPessoaJur : Integer);
var
  flgEventoGeradorResgate : String;
begin
  FRegraElegibilidade := ARegraElegibilidade;
  FIdPessoa := AIdPessoa;
  FIdPessoaJur := AIdPessoaJur;
  FIdTitular := AIdTitular;
  FIdPlanoPrev := AIdPlanoPrev;
  FIdEventoGerador := AIdEventoGerador;
  FDataEvento := ADataEvento;
  FDataRequerimento := ADataRequerimento;
  FFlgInternoAntes := AFlgInternoAntes;
  FFlgInternoAtual := AFlgInternoAtual;
  FIdSitPartAntes := AIdSitPartAntes;
  FIdSitPlanAntes := AIdSitPlanAntes;
  FIdSitFuncAntes := AIdSitFuncAntes;
  FIdSitPartAtual := AIdSitPartAtual;
  FIdSitPlanAtual := AIdSitPlanAtual;
  FIdSitFuncAtual := AIdSitFuncAtual;
  FMensagemRegrasNaoElegiveis := TStringList.Create();
  FMensagemRegrasNaoElegiveis.Clear;
  if (Trim(ABDEDatabaseName) = EmptyStr) then
  begin
    raise Exception.Create('Alias BDE do database não informado!');
  end
  else
  begin
    FBDEDatabaseName :=  ABDEDatabaseName;
  end;
  CarregarDadosPessoa();
end;

function TAnaliseElegibilidade.ValidarEventoGerador(var OFlgInterno : String) : Boolean;
var
  qryEventoGerador : TwwQuery;
begin
  Result := False;
  OFlgInterno := EmptyStr;
  if (IdEventoGerador > 0) then
  begin
    qryEventoGerador := TwwQuery.Create(nil);
    try
      qryEventoGerador.DatabaseName := FBDEDatabaseName;
      with qryEventoGerador do
      begin
        SQL.Clear;
        SQL.Add('SELECT EG.flginterno');
        SQL.Add('  FROM eventogerador EG');
        SQL.Add(' WHERE EG.ideventogerador = :ideventogerador');
        Params.Clear;
        Params.CreateParam(ftInteger, 'ideventogerador', ptInput);
        ParamByName('ideventogerador').AsInteger := IdEventoGerador;
      end;
      qryEventoGerador.Prepare;
      qryEventoGerador.Open;
      OFlgInterno := qryEventoGerador.FieldByName('flginterno').AsString;
      if (not(qryEventoGerador.IsEmpty)) then
      begin
        Result := True;
      end;
    finally
      FreeAndNil(qryEventoGerador);
    end;
  end
  else
  begin
    raise EEventoGeradorDiferenteDC.Create('Evento gerador não informado.');
  end;
end;

function TAnaliseElegibilidade.ExisteBeneficioVinculado(
  AIdBeneficio: Integer): Boolean;
var
  qryBenefbfciario : TwwQuery;
begin
  Result := False;
  qryBenefbfciario := TwwQuery.Create(nil);
  try
    qryBenefbfciario.DatabaseName := FBDEDatabaseName;
    with qryBenefbfciario do
    begin
      SQL.Clear;
      SQL.Add('SELECT B.idbeneficio');
      SQL.Add('  FROM benefbfciario B');
      SQL.Add(' WHERE B.idpessoa = :idpessoa');
      SQL.Add('   AND B.idbeneficio = :idbeneficio');
      Params.Clear;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      ParamByName('idpessoa').AsInteger := IdPessoa;
      Params.CreateParam(ftInteger, 'idbeneficio', ptInput);
      ParamByName('idbeneficio').AsInteger := AIdBeneficio;
    end;
    qryBenefbfciario.Prepare;
    qryBenefbfciario.Open;
    Result := not(qryBenefbfciario.IsEmpty);
  finally
    FreeAndNil(qryBenefbfciario);
  end;
end;

function TAnaliseElegibilidade.ExisteRegraElegibilidadeBeneficio(
  AIdBeneficio: Integer; var OIdRegraElegibili : Integer): Boolean;
var
  qryBenefPlanPrev : TwwQuery;
begin
  Result := False;
  OIdRegraElegibili := 0;
  qryBenefPlanPrev := TwwQuery.Create(nil);
  try
    qryBenefPlanPrev.DatabaseName := FBDEDatabaseName;
    with qryBenefPlanPrev do
    begin
      SQL.Clear;
      SQL.Add('SELECT BPP.idregraelegibili');
      SQL.Add('  FROM benefplanprev BPP');
      SQL.Add(' WHERE BPP.Idbeneficio = :idbeneficio');
      Params.Clear;
      Params.CreateParam(ftInteger, 'idbeneficio', ptInput);
      ParamByName('idbeneficio').AsInteger := AIdBeneficio;
    end;
    qryBenefPlanPrev.Prepare;
    qryBenefPlanPrev.Open;
    if (not(qryBenefPlanPrev.IsEmpty) and not(qryBenefPlanPrev.FieldByName('idregraelegibili').IsNull)) then
    begin
      OIdRegraElegibili := qryBenefPlanPrev.FieldByName('idregraelegibili').AsInteger;
      Result := True;
    end;
  finally
    FreeAndNil(qryBenefPlanPrev);
  end;
end;

procedure TAnaliseElegibilidade.CarregarDadosPessoa;
var
  qryElegPatro : TwwQuery;
begin
  qryElegPatro := TwwQuery.Create(nil);
  try
    qryElegPatro.DatabaseName := FBDEDatabaseName;
    with qryElegPatro do
    begin
      SQL.Clear;
      SQL.Add('SELECT EP.dataadmissao,');
      SQL.Add('       EP.datademissao');
      SQL.Add('  FROM elegpatro EP');
      SQL.Add(' WHERE EP.idpessjur = :idpessjur');
      SQL.Add('   AND EP.idpessoa = :idpessoa');
      Params.Clear;
      Params.CreateParam(ftInteger, 'idpessjur', ptInput);
      ParamByName('idpessjur').AsInteger := IdPessoaJur;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      ParamByName('idpessoa').AsInteger := IdPessoa;
    end;
    qryElegPatro.Prepare;
    qryElegPatro.Open;
    if (not(qryElegPatro.IsEmpty)) then
    begin
      FDataAdmissao := qryElegPatro.FieldByName('dataadmissao').AsDateTime;
      FDataDemissao := qryElegPatro.FieldByName('datademissao').AsDateTime;
    end
    else
    begin
      raise Exception.Create('Não foi possível carregar informações da pessoa.');
    end;
  finally
    FreeAndNil(qryElegPatro);
  end;

end;

function TAnaliseElegibilidade.ParticipanteFezOpcoesValorBase(AIdBeneficio,
  ASeqProposta: Integer; var OValorBase1, OValorBase2,
  OValorBase3: Double): Boolean;
var
  qryBenefBfciario : TwwQuery;
begin
  qryBenefBfciario := TwwQuery.Create(nil);
  try
    qryBenefBfciario.DatabaseName := FBDEDatabaseName;
    with qryBenefBfciario do
    begin
      SQL.Clear;
      SQL.Add('SELECT NVL(BB.valorbase1, 0) valorbase1,');
      SQL.Add('       NVL(BB.valorbase2, 0) valorbase2,');
      SQL.Add('       NVL(BB.valorbase3, 0) valorbase3');
      SQL.Add('  FROM benefbfciario BB');
      SQL.Add(' WHERE BB.idplanoprev = :idplanoprev');
      SQL.Add('   AND BB.idtitular = :idtitular');
      SQL.Add('   AND BB.idpessjur = :idpessjur');
      SQL.Add('   AND BB.idbeneficio = :idbeneficio');
      SQL.Add('   AND BB.idpessoa = :idpessoa');
      SQL.Add('   AND BB.seqproposta = :seqproposta');
      Params.Clear;
      Params.CreateParam(ftInteger, 'idplanoprev', ptInput);
      ParamByName('idplanoprev').AsInteger := IdPlanoPrev;
      Params.CreateParam(ftInteger, 'idtitular', ptInput);
      ParamByName('idtitular').AsInteger := IdTitular;
      Params.CreateParam(ftInteger, 'idpessjur', ptInput);
      ParamByName('idpessjur').AsInteger := IdPessoaJur;
      Params.CreateParam(ftInteger, 'idbeneficio', ptInput);
      ParamByName('idbeneficio').AsInteger := AIdBeneficio;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      ParamByName('idpessoa').AsInteger := IdPessoa;
      Params.CreateParam(ftInteger, 'seqproposta', ptInput);
      ParamByName('seqproposta').AsInteger := ASeqProposta;
    end;
    qryBenefBfciario.Prepare;
    qryBenefBfciario.Open;
    if (not(qryBenefBfciario.IsEmpty)) then
    begin
      OValorBase1 := qryBenefBfciario.FieldByName('valorbase1').AsFloat;
      OValorBase2 := qryBenefBfciario.FieldByName('valorbase2').AsFloat;
      OValorBase3 := qryBenefBfciario.FieldByName('valorbase3').AsFloat;
    end
    else
    begin
      OValorBase1 := 0;
      OValorBase2 := 0;
      OValorBase3 := 0;
    end;
  finally
    FreeAndNil(qryBenefBfciario);
  end;
end;

function TAnaliseElegibilidade.GetMensagemRegrasNaoElegiveis: String;
begin
  Result := EmptyStr;
  if (Assigned(FMensagemRegrasNaoElegiveis)) then
  begin
    if (FMensagemRegrasNaoElegiveis.Count > 0) then
    begin
      FMensagemRegrasNaoElegiveis.Insert(0, 'Não é possível registrar o evento. Motivo(s):');
      FMensagemRegrasNaoElegiveis.Insert(1, EmptyStr);
    end;
    Result := FMensagemRegrasNaoElegiveis.GetText();
  end;
end;

procedure TAnaliseElegibilidade.IncluirValidacaoRegrasNaoElegiveis(
  const AValidacaoRegrasNaoElegiveis: TValidacaoRegraElegibilidade);
begin
  if (not(AValidacaoRegrasNaoElegiveis in FValidacaoRegrasNaoElegiveis)) then
  begin
    FValidacaoRegrasNaoElegiveis := FValidacaoRegrasNaoElegiveis + [AValidacaoRegrasNaoElegiveis];
  end;
  case AValidacaoRegrasNaoElegiveis of
    vrePossuiMais3AnosContribuicao : FMensagemRegrasNaoElegiveis.Add('O participante deve possuir mais de 3 anos de contribuição na fundação, considerando todos os planos.');
    //vreExisteContribuicaoPagaDezembro2005ouPosterior : FMensagemRegrasNaoElegiveis.Add('O participante deve ter contribuição paga em dezembro de 2005, ou posterior a esta data.');
    vreNaoElegivelBeneficioProgramadoPleno : FMensagemRegrasNaoElegiveis.Add('O participante é elegível ao benefício programado pleno.');
    vreExisteRegistroRescisaoContratoPatrocinadora : FMensagemRegrasNaoElegiveis.Add('O participante deve ter registro de rescisão de contrato com a patrocinadora.');
    vreSemResgatePortabilidadeouBeneficioRendaContinuada : FMensagemRegrasNaoElegiveis.Add('O participante possui resgate, portabilidade ou benefício de renda continuada.');
    vrePossui120DiasContadosAPartirDataFatoGerador : FMensagemRegrasNaoElegiveis.Add('O participante possui mais de 120 dias contados a partir da data do fato gerador, não é permitdo requerer o autopatrocínio.');
    vreValidarVerificacaoFinanciamentoHabitacional : FMensagemRegrasNaoElegiveis.Add('O participante possui financiamento habitacional ativo.');
  else
    FMensagemRegrasNaoElegiveis.Add('Mensagem de validação da regra não definida.');
  end;

end;

function TAnaliseElegibilidade.ValidarParticipantePossuiFinanciamentoHabitacionalAtivo: Boolean;
var
  qryParamFinanciamentoHabitacional : TwwQuery;
  possuiFinanciamentoHabitacionalAtivo : Boolean;
begin
  //Conforme RM e ET esta não é uma validação impeditiva.
  possuiFinanciamentoHabitacionalAtivo := False;
  qryParamFinanciamentoHabitacional := TwwQuery.Create(nil);
  try
    qryParamFinanciamentoHabitacional.DatabaseName := FBDEDatabaseName;
    with qryParamFinanciamentoHabitacional do
    begin
      SQL.Clear;
      SQL.Add('SELECT PP.idpessoa,');
      SQL.Add('       PP.valor,');
      SQL.Add('       UPPER(TRIM(PFP.descricao)) descricao,');
      SQL.Add('       PFP.idparam');
      SQL.Add('  FROM pessoaparam PP');
      SQL.Add(' INNER JOIN paramflagpessoa PFP');
      SQL.Add('    ON (PFP.idparam = PP.idparam)');
      SQL.Add(' WHERE PP.idpessoa = :idpessoa');
      SQL.Add('   AND PP.idparam IN (10, 90)');
      Params.Clear;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      ParamByName('idpessoa').AsInteger := IdPessoa;
    end;
    qryParamFinanciamentoHabitacional.Prepare;
    qryParamFinanciamentoHabitacional.Open;

    if (not(qryParamFinanciamentoHabitacional.IsEmpty)) then
    begin
      if (qryParamFinanciamentoHabitacional.FieldByName('valor').AsString = 'S') then
      begin
        possuiFinanciamentoHabitacionalAtivo := (qryParamFinanciamentoHabitacional.FieldByName('idparam').AsInteger = 10);
      end
      else if (qryParamFinanciamentoHabitacional.FieldByName('valor').AsString = 'N') then
      begin
        possuiFinanciamentoHabitacionalAtivo := (qryParamFinanciamentoHabitacional.FieldByName('idparam').AsInteger = 90);
      end;
    end;

    if (possuiFinanciamentoHabitacionalAtivo) then
    begin
      GravarLOG('Verificação de Financiamento habitacional');
    end;

    Result := not(possuiFinanciamentoHabitacionalAtivo);

    if Assigned(FOnValidouAnaliseElegibilidade) then
    begin
      OnValidouAnaliseElegibilidade(vreValidarVerificacaoFinanciamentoHabitacional, Result);
    end;

  finally
    qryParamFinanciamentoHabitacional.Close;
    FreeAndNil(qryParamFinanciamentoHabitacional);
  end;
end;

procedure TAnaliseElegibilidade.GravarLOG(AMensagem : String);
var
  insLOGCADFINHAB : TwwQuery;
begin
  insLOGCADFINHAB := TwwQuery.Create(nil);
  try
    insLOGCADFINHAB.DatabaseName := FBDEDatabaseName;
    with insLOGCADFINHAB do
    begin
      SQL.Clear;
      SQL.Add('INSERT INTO LOGCADFINHAB');
      SQL.Add('            (');
      SQL.Add('              IDUSUARIO,');
      SQL.Add('              DESFUNC');
      SQL.Add('            )');
      SQL.Add('     VALUES (');
      SQL.Add('              :IDUSUARIO,');
      SQL.Add('              :DESFUNC');
      SQL.Add('            )');
      Params.Clear;
      Params.CreateParam(ftInteger, 'IDUSUARIO', ptInput);
      ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
      Params.CreateParam(ftString, 'DESFUNC', ptInput);
      ParamByName('DESFUNC').AsString := AMensagem;
    end;
    insLOGCADFINHAB.Prepare;
    insLOGCADFINHAB.ExecSql;
  finally
    FreeAndNil(insLOGCADFINHAB);
  end;
end;

function TAnaliseElegibilidade.ValidarBeneficiosPeculio: Boolean;
var
  flgEventoGeradorResgate : String;
  qryBenefbfciario : TwwQuery;
  possuiBeneficiosPeculio : Boolean;
  function ListaBeneficiosPeculio : String;
  var
    beneficios : TStrings;
  begin
     beneficios := TStringList.Create;
     beneficios.Clear;
     try
       case RegraElegibilidade of
         reElegibilidadeBPD : begin
                                case IdPlanoPrev of
                                  2 : begin //REG/REPLAN
                                        beneficios.Add('256'); //REG/REPLAN - Auxilio Funeral Ativo
                                        beneficios.Add('298'); //REG/REPLAN - Auxílio Funeral Assistido
                                        beneficios.Add('499'); //REG/REPLAN - Pecúlio p/ Morte AT
                                        beneficios.Add('500'); //REG/REPLAN - Pecúlio p/ Morte AS
                                        beneficios.Add('525'); //REG/REPLAN - Auxilio Funeral Herdeiros
                                      end;
                                 66 : begin //REB
                                        beneficios.Add('253'); //REB - Pecúlio por Morte Ativo
                                        beneficios.Add('321'); //REB - Pecúlio por Morte Ativo
                                        beneficios.Add('322'); // REB - Pecúlio por Morte Assistido
                                      end;
                                 74 : begin //NOVO PLANO
                                        beneficios.Add('485'); //NP - Pecúlio por Morte Ativo
                                        beneficios.Add('486'); //NP - Pecúlio por Morte Assistido
                                      end;
                                 end;
                              end;
         reElegibilidadePortabilidade : begin
                                          case IdPlanoPrev of
                                            2 : begin //REG/REPLAN
                                                  beneficios.Add('256'); //REG/REPLAN - Auxilio Funeral Ativo
                                                  beneficios.Add('298'); //REG/REPLAN - Auxílio Funeral Assistido
                                                  beneficios.Add('499'); //REG/REPLAN - Pecúlio p/ Morte AT
                                                  beneficios.Add('500'); //REG/REPLAN - Pecúlio p/ Morte AS
                                                  beneficios.Add('525'); // REG/REPLAN - Auxilio Funeral Herdeiros
                                                end;
                                           66 : begin //REB
                                                  beneficios.Add('253'); //REB - Pecúlio por Morte Ativo
                                                  beneficios.Add('321'); //REB - Pecúlio por Morte Ativo
                                                  beneficios.Add('322'); //REB - Pecúlio por Morte Assistido
                                                end;
                                           74 : begin //NOVO PLANO
                                                  beneficios.Add('485'); //NP - Pecúlio por Morte Ativo
                                                  beneficios.Add('486'); //NP - Pecúlio por Morte Assistido
                                                end;
                                          end;
                                        end;
         reElegibilidadeResgate : begin
                                    case IdPlanoPrev of
                                      2 : begin //REG/REPLAN
                                            beneficios.Add('256'); //REG/REPLAN - Auxilio Funeral Ativo
                                            beneficios.Add('298'); //REG/REPLAN - Auxílio Funeral Assistido
                                            beneficios.Add('499'); //REG/REPLAN - Pecúlio p/ Morte AT
                                            beneficios.Add('500'); //REG/REPLAN - Pecúlio p/ Morte AS
                                            beneficios.Add('525'); //REG/REPLAN - Auxilio Funeral Herdeiros
                                          end;
                                     66 : begin //REB
                                            beneficios.Add('253'); //REB - Pecúlio por Morte Ativo
                                            beneficios.Add('321'); //REB - Pecúlio por Morte Ativo
                                            beneficios.Add('322'); //REB - Pecúlio por Morte Assistido
                                          end;
                                     74 : begin //NOVO PLANO
                                            beneficios.Add('485'); //NP - Pecúlio por Morte Ativo
                                            beneficios.Add('486'); //NP - Pecúlio por Morte Assistido
                                          end;
                                    end;
                                  end;
       end;
       Result := StringReplace(beneficios.CommaText, ';', ',', [rfReplaceAll]);
     finally
       FreeAndNil(beneficios);
     end;
  end;
begin
  Result := True;
  try
    if (RegraElegibilidade in [reElegibilidadeBPD, reElegibilidadePortabilidade, reElegibilidadeResgate])
    and (IdPlanoPrev in [2, 66, 74]) then
    begin
      qryBenefbfciario := TwwQuery.Create(nil);
      try
        qryBenefbfciario.DatabaseName := FBDEDatabaseName;
        with qryBenefbfciario do
        begin
          SQL.Clear;
          SQL.Add('SELECT B.idbeneficio');
          SQL.Add('  FROM benefbfciario B');
          SQL.Add(' WHERE B.idpessoa = :idpessoa');
          SQL.Add('   AND B.idplanoprev = :idplanoprev');
          SQL.Add('   AND B.idbeneficio IN ('+ListaBeneficiosPeculio()+')');
          Params.Clear;
          Params.CreateParam(ftInteger, 'idpessoa', ptInput);
          ParamByName('idpessoa').AsInteger := IdPessoa;
          Params.CreateParam(ftInteger, 'idplanoprev', ptInput);
          ParamByName('idplanoprev').AsInteger := IdPlanoPrev;
        end;
        qryBenefbfciario.Prepare;
        qryBenefbfciario.Open;
        possuiBeneficiosPeculio := not(qryBenefbfciario.IsEmpty);
      finally
        FreeAndNil(qryBenefbfciario);
      end;
    end;

    if (possuiBeneficiosPeculio) then
    begin
      GravarLOG('Verificação de Participante Falecido');
    end;
    
    if Assigned(FOnValidouAnaliseElegibilidade) then
    begin
      OnValidouAnaliseElegibilidade(vreValidarBeneficiosPeculio, Result);
    end;
  except
    Result := False;
    raise;
  end;
end;

class function TAnaliseElegibilidade.LocalizarRegraElegibilidade(
  AIdEventoGerador: String; AFlgInterno : String): TRegraElegibilidade;
begin
  Result := reNaoDefinida;
  //BRUNO AZEVEDO SOL 171982 KINTANA 1553751
  if (((AIdEventoGerador = '17') or (AIdEventoGerador = '341')) and ((AFlgInterno = 'DP') or (AFlgInterno = 'DS'))) then Result := reElegibilidadeBPD;
  if ((AIdEventoGerador = '334') and (AFlgInterno = 'DC')) then Result := reElegibilidadePortabilidade;
  if ((AIdEventoGerador = '15') and (AFlgInterno = 'DC')) then Result := reElegibilidadeResgate;
  if ((AIdEventoGerador = '345') and (AFlgInterno = 'DC')) then Result := reElegibilidadeResgate;
  if ((AIdEventoGerador = '3') and (AFlgInterno = 'DM')) then Result := reElegibilidadeAutopatrocinio;
end;

function TAnaliseElegibilidade.CarregarIdade: Integer;
var
  qryHstContribuicaoPrev : TwwQuery;
begin
  Result := 0;
  qryHstContribuicaoPrev := TwwQuery.Create(nil);
  try
    qryHstContribuicaoPrev.DatabaseName := FBDEDatabaseName;
    with qryHstContribuicaoPrev do
    begin
      SQL.Clear;
      SQL.Add('SELECT DATANASC ');
      SQL.Add('  FROM PESSOAFISICA');
      SQL.Add(' WHERE idpessoa = :idpessoa');
      Params.Clear;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      ParamByName('idpessoa').AsInteger := IdPessoa;
    end;
    qryHstContribuicaoPrev.Prepare;
    qryHstContribuicaoPrev.Open;
    if (not(qryHstContribuicaoPrev.IsEmpty)) then
    begin
      Result := (Trunc((Date-qryHstContribuicaoPrev.FieldByName('DATANASC').AsDateTime)/365.25));
    end;
  finally
    FreeAndNil(qryHstContribuicaoPrev);
  end;
end;

function TAnaliseElegibilidade.CarregarSexo: String;
var
  qryHstContribuicaoPrev : TwwQuery;
begin
  Result := '';
  qryHstContribuicaoPrev := TwwQuery.Create(nil);
  try
    qryHstContribuicaoPrev.DatabaseName := FBDEDatabaseName;
    with qryHstContribuicaoPrev do
    begin
      SQL.Clear;
      SQL.Add('SELECT SEXO ');
      SQL.Add('  FROM PESSOAFISICA');
      SQL.Add(' WHERE idpessoa = :idpessoa');
      Params.Clear;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      ParamByName('idpessoa').AsInteger := IdPessoa;
    end;
    qryHstContribuicaoPrev.Prepare;
    qryHstContribuicaoPrev.Open;
    if (not(qryHstContribuicaoPrev.IsEmpty)) then
    begin
      Result := qryHstContribuicaoPrev.FieldByName('SEXO').AsString;
    end;
  finally
    FreeAndNil(qryHstContribuicaoPrev);
  end;
end;

end.




