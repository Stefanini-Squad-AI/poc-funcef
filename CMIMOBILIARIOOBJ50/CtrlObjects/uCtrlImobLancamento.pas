unit uCtrlImobLancamento;
{
Pendência: MIGRACAO-ORACLE
Analista : edilaine
Data     : 13/10/2025
Solução  : remover concatenaçao de espaços nas contas contábeis
           mudança de CHAR para VARCHAR2 na migração
================================================================================
 Autor: Cássio Camargo
 Data: 03/09/2008
 Descrição: Unit de controle de lançamentos exclusiva para os sistemas
 Imobiliários, a fim de contemplar o problema de segregação na origem, ou seja,
 possibilitar a segregação de documentos gerados atrvés dos planos definidos no
 cadastro do imóvel.
--------------------------------------------------------------------------------
Rotina......: Add ListaCondPagParc
Nº SOL......: 127213
Nº KINTANA..: 672023
Data........: 03/01/2011
Responsável.: Helen V. Bianchi
Descrição...: Função referente Aquisição Parcelada
--------------------------------------------------------------------------------
}
interface

Uses SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uMidasUtil, uCtrlGeral,
     DB, uDataBase, uDbLancamento, uCmControlObject, dbclient, Provider, uCtrlHistoContab,
     uCtrlContab,StdCtrls, ComCtrls, uCtrlPeriodo, uCtrlContaContabil, uDbPlanoSaldo,
     uDbPlanilha,  math, jclMath, uCMTypes , uCMSqlParams,uCtrlPadroes,
     uCtrlImobSegregacao, uCtrlPlanPrevContabPatro, uCMDBObject,uCMClientDataSet;

Type
  { tpSoPeriodo  => Somente o período indicado
    tpMenorIgual => Todos os períodos menor ou igual ao indicado, incluindo o anterior
    tpSoAnterior => Somente o anterior
  }
  TTipoPeriodo    = (tpSoPeriodo, tpMenorIgual, tpSoAnterior);
  { teNaoEfetivado => Somente os não efetivados
    teEfetivado    => Somente os efetivados
    teAmbos        => Efetivados e não efetivados
  }
  TTipoEfetivado = (teNaoEfetivado, teEfetivado, teAmbos);
  { tomNaoAtualizada => Somente os lançamentos com outra moeda não atualizada
    tomAtualizada    => Somente os lançamentos com outra moeda atualizada
    tomAmbos        => Atualizados e não atualizados
  }
  TTipoOutraMoeda = (tomNaoAtualizada, tomAtualizada, tomAmbos);
  { tolData      => Ordenados por data e Planilha
    tolPlnCodigo => Ordenados por plncodigo
  }
  TTipoOrdenaLanc  = (tolData, tolPlnCodigo);
  { tsPeriodo => Somar acumulando por periodo
    tsData    => Somar acumulando por dia
    tsSemSoma => Não acumular, mostrar todos os lançamentos
  }
  TTipoSomatorio = (tsPeriodo,tsData,tsSemSoma);
  { tapSoSinteticaAP => Somente as Ativ/Proj Sinteticas
    tapSoAnaliticaAP    => Somente as Ativ/Proj Analiticas
    tapAmbos => Todas as Ativ/Proj
   }
  TCtrlImobLancamento = class(TCmControlObject)

  Protected
      procedure AfterInitialize;override;

      procedure DoChangeDataBase; Override;

  private

    _iIdSegregaContr: integer;

    CtrlPeriodo             : TCtrlPeriodo;
    CtrlPadroes             : TCtrlPadroes;
    CtrlContaContabil       : TCtrlContaContabil;
    CtrlHistoContab         : TCtrlHistoContab;
    CtrlContab              : TCtrlContab;
    CtrlGeral               : TCtrlGeral;
    //Cássio - SOL 92381 KINTANA 394180
    //Utiliza a classe TCtrlImobSegregacao para definir os critérios de segregação.
    CtrlImobSegregacao      : TCtrlImobSegregacao;
    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;
    _dbLancamento           : TdbLancamento;
    _dbPlanoSaldo           : TdbPlanoSaldo;
    _dbPlanilha             : TdbPlanilha;
    _sql                    : TCmSqlParams;

    //A variável abaixo serbirá para "apontar" a tabela destino para gravação de lançamentos
    DbGravaLanc        : TdbLancamento;
    _cdsAux        : TClientDataSet;

    FProgresso: Integer;
    FMaxProgresso: Integer;
    FRetornoPlnCodigo: Double;
    FlcTestaConta: Boolean;
    FlcValGe2Cre: Double;
    FlcValOfiDeb: Double;
    FlcValHisDeb: Double;
    FlcValGe1Deb: Double;
    FlcValGerDeb: Double;
    FlcValGe2Deb: Double;
    FlcElemento: Double;
    FlcValOfiCre: Double;
    FlcValGe1Cre: Double;
    FlcValHisCre: Double;
    FlcValGerCre: Double;
    FlcTipConvGe2Cre: String;
    FlcTipConvGerCre: String;
    FlcTipConvOfiCre: String;
    FlcTipConvGe1Cre: String;
    FlcOriAplDeb: String;
    FlcTipConvGe1Deb: String;
    FlcTipConvGerDeb: String;
    FlcTipConvGe2Deb: String;
    FlcTipConvOfiDeb: String;
    FlcOriAplCre: String;
    FlcSubConta: Double;
    FlcCentroCusto: String;
    FlcPanCodigo: Double;
    FlcPlnEstorno: Double;
    FValorCotacao: Double;
    FRetornoPlnPlanil: Double;
    FAtivProjPadrao: Double;
    FProxPlanilha: Double;
    FsMensAPS :String;
    FsMensAPS_Log :String;
    FCodDC :string;
    FsMensAdd :string;
    FNumLancamento: Integer;
    FlcEDePara: String;
    FlcPeriodoEsp: Boolean;
    FPlanoSegregar: Integer;

    bOperComum : boolean;

    procedure SetlcElemento(const Value: Double);
    procedure SetlcOriAplCre(const Value: String);
    procedure SetlcOriAplDeb(const Value: String);
    procedure SetlcTestaConta(const Value: Boolean);
    procedure SetlcTipConvGe1Cre(const Value: String);
    procedure SetlcTipConvGe1Deb(const Value: String);
    procedure SetlcTipConvGe2Cre(const Value: String);
    procedure SetlcTipConvGe2Deb(const Value: String);
    procedure SetlcTipConvGerCre(const Value: String);
    procedure SetlcTipConvGerDeb(const Value: String);
    procedure SetlcTipConvOfiCre(const Value: String);
    procedure SetlcTipConvOfiDeb(const Value: String);
    procedure SetlcValGe1Cre(const Value: Double);
    procedure SetlcValGe1Deb(const Value: Double);
    procedure SetlcValGe2Cre(const Value: Double);
    procedure SetlcValGe2Deb(const Value: Double);
    procedure SetlcValGerCre(const Value: Double);
    procedure SetlcValGerDeb(const Value: Double);
    procedure SetlcValHisCre(const Value: Double);
    procedure SetlcValHisDeb(const Value: Double);
    procedure SetlcValOfiCre(const Value: Double);
    procedure SetlcValOfiDeb(const Value: Double);
    procedure SetlcCentroCusto(const Value: String);
    procedure SetlcSubConta(const Value: Double);
    procedure SetlcPanCodigo(const Value: Double);
    procedure SetlcPlnEstorno(const Value: Double);
    procedure SetValorCotacao(const Value: Double);
    procedure SetAtivProjPadrao(const Value: Double);
    procedure SetProxPlanilha(const Value: Double);
    procedure SetNumLancamento(const Value: Integer);
    procedure SetlcEDePara(const Value: String);
    procedure SetlcPeriodoEsp(const Value: Boolean);
    procedure SetPlanoSegregar(const Value: Integer);

      {Esta function tem como objetivo retornar o numero do lancamento se este existir}
      Function RetornaNumLanc(idEmpresa,liPlnCodigo, liCodPlano, liSubConta, liUnidNegoc,
                              iPlanoPrev, iPatro: Double; sConta, sCentroCusto, sDebCre,sHistPadrao: String;
                              iIdSegregaCriter: integer; dDataSegregaCriter: tDateTime;
                              const iCodDocumento: integer) : Boolean;

      //Monta a query de seleção da planilha de lançamento na tabela LANCAMENTO ou na MEMOCALCSEGREGA
      function SQLPlanilhaLancamento( IdPlnCodigo : Double; sTabela : string ) : string;

  public
      Property RetornoPlnCodigo : Double read FRetornoPlnCodigo;
      Property RetornoPlnPlanil: Double read FRetornoPlnPlanil;
      Property lcElemento      : Double read FlcElemento write SetlcElemento;
      Property ProxPlanilha    : Double read FProxPlanilha write SetProxPlanilha;
      Property NumLancamento   : Integer read FNumLancamento write SetNumLancamento;
      Property lcEDePara       : String read FlcEDePara write SetlcEDePara;
      Property lcTipConvOfiDeb : String read FlcTipConvOfiDeb write SetlcTipConvOfiDeb;
      Property lcTipConvGerDeb : String read FlcTipConvGerDeb write SetlcTipConvGerDeb;
      Property lcTipConvGe1Deb : String read FlcTipConvGe1Deb write SetlcTipConvGe1Deb;
      Property lcTipConvGe2Deb : String read FlcTipConvGe2Deb write SetlcTipConvGe2Deb;
      Property lcOriAplDeb     : String read FlcOriAplDeb write SetlcOriAplDeb;
      Property lcTipConvOfiCre : String read FlcTipConvOfiCre write SetlcTipConvOfiCre;
      Property lcTipConvGerCre : String read FlcTipConvGerCre write SetlcTipConvGerCre;
      Property lcTipConvGe1Cre : String read FlcTipConvGe1Cre write SetlcTipConvGe1Cre;
      Property lcTipConvGe2Cre : String read FlcTipConvGe2Cre write SetlcTipConvGe2Cre;
      Property lcOriAplCre     : String read FlcOriAplCre write SetlcOriAplCre;
      Property lcPanCodigo     : Double read FlcPanCodigo write SetlcPanCodigo;
      Property lcPlnEstorno    : Double read FlcPlnEstorno write SetlcPlnEstorno;
      Property lcValOfiDeb     : Double read FlcValOfiDeb write SetlcValOfiDeb;
      Property lcValGerDeb     : Double read FlcValGerDeb write SetlcValGerDeb;
      Property lcValGe1Deb     : Double read FlcValGe1Deb write SetlcValGe1Deb;
      Property lcValGe2Deb     : Double read FlcValGe2Deb write SetlcValGe2Deb;
      Property lcValHisDeb     : Double read FlcValHisDeb write SetlcValHisDeb;
      Property lcValOfiCre     : Double read FlcValOfiCre write SetlcValOfiCre;
      Property lcValGerCre     : Double read FlcValGerCre write SetlcValGerCre;
      Property lcValGe1Cre     : Double read FlcValGe1Cre write SetlcValGe1Cre;
      Property lcValGe2Cre     : Double read FlcValGe2Cre write SetlcValGe2Cre;
      Property lcPeriodoEsp    : Boolean read FlcPeriodoEsp write SetlcPeriodoEsp;
      Property lcValHisCre     : Double read FlcValHisCre write SetlcValHisCre;
      Property lcTestaConta    : Boolean read FlcTestaConta write SetlcTestaConta;
      Property lcSubConta      : Double read FlcSubConta write SetlcSubConta;
      Property lcCentroCusto   : String read FlcCentroCusto write SetlcCentroCusto;
      Property sMensAPS : String read FsMensAPS write FsMensAPS;
      Property sMensAPS_Log : String read FsMensAPS_Log write FsMensAPS_Log;
      Property CodDC : String read FCodDC write FCodDC;
      Property Progresso : Integer read FProgresso write FProgresso;
      Property MaxProgresso : Integer read FMaxProgresso;
      Property sMensAdd : String read FsMensAdd write FsMensAdd;
      Property ValorCotacao    : Double read FValorCotacao write SetValorCotacao;
      Property AtivProjPadrao  : Double read FAtivProjPadrao write SetAtivProjPadrao;
      Property PlanoSegregar   : Integer read FPlanoSegregar write SetPlanoSegregar;

      Constructor Create; Override;
      Destructor  Destroy;Override;

      Function FloatToStrPonto(dValor :Double) :string;

      {Esta function atualiza o saldo das contas }
      Function AtuSaldoContas(IdEmpresa, iUnidNegoc, iUsuario,
               iPlanoPrev, iPatro, iPlano : Double; iExercicio, iPeriodo: Integer; iSubConta : Double;
               sCCust, sConta, sDebCre, sTipoConta: string; rValCorrente, rValOrcado,
               rValOficial, rValGeren, rValGeren1, rValGeren2, rValHist: Double;
               bUsaPlanoPatro: boolean): Boolean;

      {Esta function atualiza o saldo das contas sintética}
      Function AtuSaldoSintetica(IdEmpresa, iUnidNegoc, iUsuario,
               iPlanoPrev, iPatro, iPlano : Double; iExercicio, iPeriodo: Integer; iSubConta : double;
               sCCust, sConta, sDebCre, sMascara: string; rValCorrente, rValOrcado,
               rValOficial, rValGeren, rValGeren1, rValGeren2, rValHist: Double;
               bUsaPlanoPatro: boolean): Boolean;

      {Esta function tem como objetivo selecionar os lançamentos }
      Function SelecionaLancamentos(IdPlnCodigo,IdEmpresa : Double; iExercicio, iPeriodo : Integer;
               TipoPeriodo : TTipoPeriodo; sDataIni, sDataFim, sModulos, sTipoOper : String;
               TipoEfetivado : TTipoEfetivado; TipoOutraMoeda : TTipoOutraMoeda;
               TipoOrdenaLanc : TTipoOrdenaLanc; TipoSomatorio : TTipoSomatorio; bComConta : Boolean;
               bInserePlanoPatro: boolean = false) : OleVariant;

      {Esta função seleciona planilhas, usada em pre-planilhas - lançamentos}
      Function SelecionaPlanilhas(IdPlnCodigo, IdPlanilhaIni,IdPlanilhaFim,IdEmpresa: Double;
                    iExercicio, iPeriodo: Integer; TipoPeriodo: TTipoPeriodo; sDataIni,
                    sDataFim, sModulos, sTipoOper: String; TipoEfetivado: TTipoEfetivado;
                    TipoOrdenaLanc: TTipoOrdenaLanc) : OleVariant;

      {Esta função insere lançamentos de acordo com os parametros passados}
      Function InsereLancaContab(cTipoLanc : Char; IdEmpresa, iModuloOrigem,
                      liUsuario, liCodPlano, liUnidNegoc, liSubContaDeb,
                      liSubContaCre, iPlanoPrev, iPatro, liPlnCodigo : Double; iNumLan : LongInt;
                      sDataLanc, sNumDoc, sHist1, sHist2,  sHist3,  sHist4,
                      sHist5, sTipoOper, cCCustd, cContad, cCCustc, cContac, sCodHist : string;
                      rValLanc : double; bJunta, bUsaPlanoPatro : Boolean;
                      iIdSegregaCriter: integer = -1; dDataSegregaCriter: TDateTime = -1;
                      iIdSegregaContr: integer = -1;
                      //Cássio - SOL 92381 KINTANA 394180
                      //Incluído o ID do Imóvel como parâmetro.
                      iIdImovel : Integer = -1;
                      const bSegregaOrigem: boolean = true;
                      const iCodDocumento: integer = -1;
                      const bForcaGravacaoMemoCalc : boolean = False;
                      const bValorTotLacamento : Double = 0;
                      //Cássio - SOL Nº 92381 KINTANA Nº 394180
                      iIDContrato : Integer = -1) : Boolean;

      {Esta função altera lançamentos de acordo com os parametros passados}
      Function AlteraLancaContab(cTipoLanc : Char; IdEmpresa, iModuloOrigem,
                      liUsuario, liCodPlano, liUnidNegoc, liSubContaDeb,
                      liSubContaCre, iPlanoPrev, iPatro, liPlnCodigo: Double; iNumLan : LongInt;
                      sDataLanc, sNumDoc, sHist1, sHist2,  sHist3,  sHist4,
                      sHist5, sTipoOper, cCCustd, cContad, cCCustc, cContac, sCodHist : string;
                      rValLanc : double; bJunta, bUsaPlanoPatro : Boolean;
                      // 05/01/03 Alex 14451 - Nova estrutura SEGREGACRITER
                      const iIdSegregaCriter: integer = -1; const dDataSegregaCriter: TDateTime = -1;
                      const bUsaMesmaPlanilha: Boolean =  true) : Boolean; //andre tavares - pendência 24748 - 20/03/2007

      {Esta função exclui lançamentos de acordo com os parametros passados}
      Function ExcluiLancaContab(iUsuario,iPlnCodigo, iModuloOrigem : Double; iNumLan : LongInt; bUsaPlanoPatro, bExcluiPlanilha : Boolean ) : Boolean;

      {Esta função estorna lançamentos}
      Function EstornaLancaContab(iUsuario,iPlnCodigo, iModuloOrigem, iEmpresa : Double; bUsaPlanoPatro : Boolean; sDataEstorno : String ) : Boolean;

      {Esta função limpa as veriaveis usadas na movimentação de lancamentos}
      Procedure IniciaVariavelLancamento;

      {Esta função conta lançamentos de acordo com os parametros passados}
      Function TestaContaLancamento(sConta, sTipoDC, sDataLanc : String; liCodPlano, idEmpresa, idModulo, iPeriodo,iExercicio:Double) : Boolean;

      {Esta function tem como objetivo retornar a cotação de uma moeda }
      Function RetornaCotacao(iMoeda: Double; sData: String; bExato : Boolean): Boolean;

      {Esta function tem como objetivo retornar a Atividade/Projeto padrão}
      Function RetornaAtivProjPadrao(idEmpresa: Double): Boolean;

      {Esta function tem como objetivo selecionar lançamentos de uma planilha de maneira a ficar os lançamentos de
                                                partida dobrada no mesmo registro}
      Function SelecionaLancamentosEsp(IdPlnCodigo : Double): OleVariant;

      {Selecionar lançamentos de uma planilha quando flags de memória de cálculo de segregação estão ativos}
      Function SelecionaLancMemoCalcSegrega( IdPlnCodigo : Double): OleVariant;

      {Esta função tem o objetivo de arrendondar valores}
      Function RoundCM(fNum : Extended) : Extended;

      {Esta função tem o objetivo de Listar os modulos}
      Function ListModulos( bOrdenaModulo : Boolean  ) : OleVariant;

      {Esta função tem o objetivo de fazer o rateio}
      Function FazRateio(liEmpresa, liModulo, liUsuario, liCodPlano,
               liPlanilRateio, liPlanoPrev, liPatro, liSubContaCp, liSubContaRt,
               liUnidNegoc: Integer;  sDataLanc, sNumDoc, sTipoOper, sCcustoCp,
               sContaCp, sCodHistCp, sHist1Cp, sHist2Cp, sHist3Cp, sHist4Cp,
               sHist5Cp, sCcustoRt, sContaRt, sCodHistRt, sHist1Rt, sHist2Rt,
               sHist3Rt, sHist4Rt, sHist5Rt, sDebCre: string; dValor: Double;
               bJunta, bUsaPPatro: Boolean;
               // Alex 05/01/04 - nova estrutura SEGREGACRITER. Avaliar
               const iIdSegregaCriter: integer; const dDataSegregaCriter: tDateTime) :Boolean;

      Function BuscaContaContabil(liIdEmpresa, liIdPrograma: Integer;
                                 sTipRecDes, sCentroCusto, sRecPag: String): String;

      //iTipo: 1 - lançamento; 2 - Memória de cálculo de segregação
      function SelecionaProvaZero(const liIdPlanilha: Double; const iTipo : integer = 1 ): OleVariant;
      {amf 02.07.2007 -
           Esta função corrige o erro encontrado na regra prova zero quando há segregação de
           plano e patro (segregação de recursos). Para corrigir este problema, deve-se levar
           em consideração os lançamentos da planilha e os lançamentos da memória de cálculo da segregação }
      function getProvaZero(const liIdPlanilha: Double): OleVariant; overload;

      //amf 02.07.2007 24589 - prova zero por exercício e período
      function getProvaZero(exercicio, periodo: integer): OleVariant; overload;

      //amf 30.07.2007 24589 - Regra prova zero do Lançamento e da Segregação da Memória de Cálculo
      function getProvaZeroLancamentoMaisMemoCalc(planilha: double): OleVariant; overload;

      {verifica se o sistema está parametrizado para utilizar stored procedure para atualizar saldos em tempo real}
      function UsaStoredProc(const idempresa: integer): boolean; //pendência 25244 - 07/01/2008
      //Cássio -  SOL 92381 KINTANA 394180
      //Funções que verificam se existe Segregação na Origem, na tabela PLANOPATROXIMOVEL
      function VerificaSegregacaoOrigem(IdImovel : array of Integer): boolean; overload;
      function VerificaSegregacaoOrigem(iIdImovel : Integer) : Integer; overload;
      function VerificaSegregacaoOrigemImovelxBem(iIdImovel : Integer; var cdsAux: TClientDataSet): Boolean;
      function VerificaSegregacaoOrigemBem(iIdBem : integer) : boolean;

      function getValorTotalDocumento(iCodDocumento: Integer): Double;
      //Helen - SOL 127213 KINTANA 672023
      function ListaCondPagParc : OleVariant;

  end;

implementation

procedure TCtrlImobLancamento.DoChangeDataBase;
begin
  inherited;
  _dbLancamento.DataBaseName := DataBaseName;
  _dbPlanoSaldo.DataBaseName := DataBaseName;
  _dbPlanilha.DataBaseName   := DataBaseName;

  DbGravaLanc.DataBaseName := DataBaseName;
end;


constructor TCtrlImobLancamento.Create;
begin
  inherited;
  bOperComum := True;
  _iIdSegregaContr := -1; //andré tavares - pendência 21604 - 03/10/2006

  _dbLancamento  := TdbLancamento.Create(Self);
  _dbPlanoSaldo  := TdbPlanoSaldo.Create(Self);
  _dbPlanilha    := TdbPlanilha.Create(Self);

  DbGravaLanc := TdbLancamento.Create(Self);
  CtrlPeriodo        := TCtrlPeriodo.Create;
  CtrlPeriodo.OnMessageInfo := nil;

  CtrlContaContabil  := TCtrlContaContabil.Create;
  CtrlHistoContab    := TCtrlHistoContab.Create;
  CtrlContab         := TCtrlContab.Create;
  CtrlGeral          := TCtrlGeral.Create;
  CtrlPadroes        := TCtrlPadroes.Create;

  CtrlImobSegregacao := TCtrlImobSegregacao.Create;
  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;


  _sql           := TCmSqlParams.Create(nil);
  _sql.ControlObject := Self;


  IniciaVariavelLancamento;

  _cdsAux        := TClientDataSet.Create(Nil);

end;

destructor TCtrlImobLancamento.Destroy;
begin
  _dbLancamento.Free;
  _dbPlanoSaldo.Free;
  _dbPlanilha.Free;
  _sql.Free;

  DbGravaLanc.Free;

  CtrlPeriodo.Free;
  CtrlContaContabil.Free;
  CtrlHistoContab.Free;
  CtrlContab.Free;
  CtrlGeral.Free;
  CtrlPadroes.free;
  CtrlImobSegregacao.Free;

  CtrlPlanPrevContabPatro.Free;
  _cdsAux.Free;
  inherited;
end;




function TCtrlImobLancamento.BuscaContaContabil(liIdEmpresa,
  liIdPrograma: Integer; sTipRecDes, sCentroCusto, sRecPag: String): String;
begin
  With _sql Do
    Try
      ClientDataSet := _Cds;
      SQL.Clear;
      SQL.Add('SELECT ');
      SQL.Add('  TIPORDXCCXCONTA.PLACONTA ');
      SQL.Add('FROM ');
      SQL.Add('  TIPORDXCCXCONTA ');
      SQL.Add('WHERE ');
      SQL.Add('  RTRIM(TIPORDXCCXCONTA.CODTIPRECDES) = :CODTIPRECDES AND ');
      SQL.Add('  TIPORDXCCXCONTA.RECPAG = :RECPAG AND ');
      SQL.Add('  TIPORDXCCXCONTA.IDPESSOA = :IDPESSOA AND ');
      SQL.Add('  RTRIM(TIPORDXCCXCONTA.CODCENTROCUSTO) = :CODCENTROCUSTO AND');
      SQL.Add('  TIPORDXCCXCONTA.IDEMPRESA = :IDEMPRESA AND ');

      If liIdPrograma <= 0 Then
         SQL.Add('  TIPORDXCCXCONTA.IDPROGRAMA IS NULL ')
      Else
         SQL.Add('  TIPORDXCCXCONTA.IDPROGRAMA = ' + IntToStr(liIdPrograma));

      Prepare;

      ParamByName('CODTIPRECDES').AsString   := Trim(sTipRecDes);
      ParamByName('IDPESSOA').AsInteger      := liIdEmpresa;
      ParamByName('CODCENTROCUSTO').AsString := Trim(sCentroCusto);
      ParamByName('IDEMPRESA').AsFloat       := liIdEmpresa;
      ParamByName('RECPAG').AsString := sRecPag;

      Open;

      If Not _Cds.IsEmpty Then
         Result := _Cds.FieldByName('PLACONTA').AsString
      Else
      Begin
         SQL.Clear;
         SQL.Add('SELECT ');
         SQL.Add('  TIPORECEBDESEMB.PLACONTA ');
         SQL.Add('FROM ');
         SQL.Add('  TIPORECEBDESEMB ');
         SQL.Add('WHERE ');
         SQL.Add('  RTRIM(TIPORECEBDESEMB.CODTIPRECDES) = :CODTIPRECDES AND');
         SQL.Add('  TIPORECEBDESEMB.RECPAG = :RECPAG AND ');
         SQL.Add('  TIPORECEBDESEMB.IDPESSOA = :IDPESSOA ');

         Prepare;

         ParamByName('CODTIPRECDES').AsString   := Trim(sTipRecDes);
         ParamByName('IDPESSOA').AsInteger      := liIdEmpresa;
         ParamByName('RECPAG').AsString := sRecPag;

         Open;

         If Not _Cds.IsEmpty Then
            Result := _Cds.FieldByName('PLACONTA').AsString
         Else
            Result := '';
      End;

      If _Cds.Active Then _Cds.Close;
    Except
      If _Cds.Active Then _Cds.Close;
      Result := '';
      Raise;
    End;
end;

function TCtrlImobLancamento.AtuSaldoContas(IdEmpresa, iUnidNegoc, iUsuario,
  iPlanoPrev, iPatro, iPlano : Double; iExercicio, iPeriodo: Integer; iSubConta : Double;
  sCCust, sConta, sDebCre, sTipoConta: string; rValCorrente, rValOrcado,  rValOficial, rValGeren, rValGeren1, rValGeren2,
  rValHist: Double;   bUsaPlanoPatro: boolean): Boolean;
var bInclui : Boolean;
    sSql :string;
    iIDPlanoSaldo: Double;
begin
   Try
       if bUsaPlanoPatro and ((iPlanoPrev = 0) or (iPatro = 0)) then begin
          Result      := False;
          MessageInfo := 'Plano ou Patrocinadora não preenchido';
       end else begin
          if not bUsaPlanoPatro then begin
             iPlanoPrev := 0;
             iPatro
                  := 0;
          end;
          bInclui := True;

          With _Sql Do
             Try
                SQL.Clear;
                SQL.Add('SELECT IDPLANOSALDO, ROUND(PLSORCADODEBITO,2) AS PLSORCADODEBITO, ROUND(PLSORCADOCREDITO,2) AS PLSORCADOCREDITO,     ');
                SQL.Add('       ROUND(PLSDEBITOOFICIAL,2) AS PLSDEBITOOFICIAL, ROUND(PLSDEBITOHIST,2) AS PLSDEBITOHIST, ROUND(PLSDEBITOGEREN2,2) AS PLSDEBITOGEREN2,    ');
                SQL.Add('       ROUND(PLSDEBITOGEREN1,2) AS PLSDEBITOGEREN1, ROUND(PLSDEBITOGER,2) AS PLSDEBITOGER, ROUND(PLSDEBITOCORRENTE,2) AS PLSDEBITOCORRENTE,    ');
                SQL.Add('       ROUND(PLSCREDITOOFICIAL,2) AS PLSCREDITOOFICIAL, ROUND(PLSCREDITOHIST,2) AS PLSCREDITOHIST, ROUND(PLSCREDITOGEREN2,2) AS PLSCREDITOGEREN2, ');
                SQL.Add('       ROUND(PLSCREDITOGEREN1,2) AS PLSCREDITOGEREN1, ROUND(PLSCREDITOGER,2) AS PLSCREDITOGER, ROUND(PLSCREDITOCOR,2) AS PLSCREDITOCOR      ');
                SQL.Add('FROM PLANOSALDO                                       ');
                SQL.Add('WHERE (PEREXERCICIO = ' + IntToStr(iExercicio) + ')   ');
                if iPeriodo > 0 then
                   SQL.Add('  AND (PERNUMERO = '+IntToStr(iPeriodo)+')         ')
                else
                   SQL.Add('  AND (PERNUMERO IS NULL)                          ');

                SQL.Add('  AND (IDPESSOA = '+FloatToStr(IdEmpresa)+')          ');
                SQL.Add('  AND (PLANO    = '+FloatToStr(iPlano)+')             ');
                //SQL.Add('  AND (PLACONTA = '''+Copy(trim(sConta)+'                 ',1,18)+''')');   //MIGRACAO-ORACLE
                SQL.Add('  AND (PLACONTA = '+Quotedstr(trim(sConta))+')');                             //MIGRACAO-ORACLE
                SQL.Add('  AND (PLSTIPO  = '''+sTipoConta+''')                 ');
                if sCCust = '' then begin
                   SQL.Add('  AND (CODCENTROCUSTO IS NULL)                     ');
                   SQL.Add('  AND (IDEMPRESA IS NULL)                          ');
                end else begin
                   //SQL.Add('  AND (CODCENTROCUSTO = '''+Copy(trim(sCCust)+'         ',1,10)+''')');    //MIGRACAO-ORACLE
                   SQL.Add('  AND (CODCENTROCUSTO = '+Quotedstr(trim(sCCust))+')');                      //MIGRACAO-ORACLE
                   SQL.Add('  AND (IDEMPRESA      = '+FloatToStr(IdEmpresa)+') ');
                end;
                if iUnidNegoc = 0 then begin
                   SQL.Add('  AND (UNIDNEGOC IS NULL)                          ');
                end else begin
                   SQL.Add('  AND (UNIDNEGOC = '+FloatToStr(iUnidNegoc)+')     ');
                end;
                if iSubConta = 0 then begin
                   SQL.Add('  AND (CODSUBCONTA IS NULL)                        ');
                end else begin
                   SQL.Add('  AND (CODSUBCONTA = '+FloatToStr(iSubConta)+')    ');
                end;
                if iPlanoPrev = 0 then begin
                   SQL.Add('  AND (IDPLANOPREV IS NULL)                        ');
                end else begin
                   SQL.Add('  AND (IDPLANOPREV = '+FloatToStr(iPlanoPrev)+')   ');
                end;
                if iPatro = 0 then begin
                   SQL.Add('  AND (IDPATRO IS NULL)                            ');
                end else begin
                   SQL.Add('  AND (IDPATRO = '+FloatToStr(iPatro)+')           ');
                end;
                OpenDataSet(SQL.Text);

             Finally

             End;

          If not _lDataSet.isEmpty then bInclui := False;

          //=============================================================
          // Insere registros no tabela PlanoSaldo
          //=============================================================
          If bInclui Then
          Begin
             iIDPlanoSaldo := GetSequence('PLANOSALDO');

             sSql := 'INSERT INTO PLANOSALDO                                    ' +
                     '  ( PLANO, IDPLANOSALDO, IDPATRO,IDPLANOPREV,             ' +
                     '    IDPESSOA,UNIDNEGOC,CODSUBCONTA,IDUSUARIOINCLUSAO,     ' +
                     '    PEREXERCICIO, PERNUMERO, PLSTIPO,PLACONTA,            ' +
                     '    CODCENTROCUSTO, IDEMPRESA, PLSORCADODEBITO,           ' +
                     '    PLSDEBITOOFICIAL,PLSDEBITOHIST, PLSDEBITOGER,         ' +
                     '    PLSDEBITOGEREN1, PLSDEBITOGEREN2, PLSDEBITOCORRENTE,  ' +
                     '    PLSORCADOCREDITO, PLSCREDITOOFICIAL,PLSCREDITOHIST,   ' +
                     '    PLSCREDITOGER,  PLSCREDITOGEREN1,PLSCREDITOGEREN2,    ' +
                     '    PLSCREDITOCOR )                                       ' +
                     'VALUES ( ' +
                     FloatToStr(iPlano)    +  ','  + FloatToStr(iIDPlanoSaldo) + ',';

                     if  iPatro <>  0 then
                         sSql := sSql + FloatToStr(iPatro)  +  ','
                     else
                         sSql := sSql + 'null' +  ',';

                     if iPlanoPrev <> 0 then
                        sSql := sSql  + FloatToStr(iPlanoPrev)  + ','
                     else
                        sSql := sSql  + 'null'  + ',';

                     sSql := sSql + FloatToStr(IdEmpresa) +  ',';

                     if iUnidNegoc <> 0 then
                        sSql := sSql + FloatToStr(iUnidNegoc) + ','
                     else
                        sSql := sSql + 'null' + ',';

                     if iSubConta <> 0 then
                        sSql := sSql +  FloatToStr(iSubConta) +  ','
                     else
                        sSql := sSql +  'null' +  ',';

                     sSql := sSql + FloatToStr(iUsuario) + ',' + IntToStr(iExercicio) + ',';

                     if iPeriodo <> 0 then
                        sSql := sSql  + IntToStr(iPeriodo)  + ','
                     else
                        sSql := sSql  + 'null' + ',';

                     sSql := sSql +  #39+sTipoConta+#39 + ',' + #39+sConta+#39 + ',';


             if (sCCust = '') then
             begin
                sSql := sSql + 'null' +  ',';
                sSql := sSql + 'null' +  ',';
             end else
             begin
                sSql := sSql + #39+sCCust+#39 + ',';
                sSql := sSql + FloatToStr(IdEmpresa) + ',';
             end;

             if sDebCre = 'D' then
             begin
                sSql := sSql + FloatToStrPonto(RoundCM(rValOrcado))   + ',';
                sSql := sSql + FloatToStrPonto(RoundCM(rValOficial))  + ',';
                sSql := sSql + FloatToStrPonto(RoundCM(rValHist))     + ',';
                sSql := sSql + FloatToStrPonto(RoundCM(rValGeren))    + ',';
                sSql := sSql + FloatToStrPonto(RoundCM(rValGeren1))   + ',';
                sSql := sSql + FloatToStrPonto(RoundCM(rValGeren2))   + ',';
                sSql := sSql + FloatToStrPonto(RoundCM(rValCorrente)) + ',';

                sSql := sSql + '0' + ',';    // orcadocredito
                sSql := sSql + '0' + ',';    // creditooficial
                sSql := sSql + '0' + ',';    // creditohist
                sSql := sSql + '0' + ',';    // creditoger
                sSql := sSql + '0' + ',';    // creditogeren1
                sSql := sSql + '0' + ',';    // creditogeren2
                sSql := sSql + '0' + ')';    // creditocor
             end else
             begin
                sSql := sSql + '0' + ',';    // orcadodebito
                sSql := sSql + '0' + ',';    // debitooficial
                sSql := sSql + '0' + ',';    // debitohist
                sSql := sSql + '0' + ',';    // debitoger
                sSql := sSql + '0' + ',';    // debitogeren1
                sSql := sSql + '0' + ',';    // debitogeren2
                sSql := sSql + '0' + ',';    // debitocor


                sSql := sSql + FloatToStrPonto(RoundCM(rValOrcado))   + ',';
                sSql := sSql + FloatToStrPonto(RoundCM(rValOficial))  + ',';
                sSql := sSql + FloatToStrPonto(RoundCM(rValHist))     + ',';
                sSql := sSql + FloatToStrPonto(RoundCM(rValGeren))    + ',';
                sSql := sSql + FloatToStrPonto(RoundCM(rValGeren1))   + ',';
                sSql := sSql + FloatToStrPonto(RoundCM(rValGeren2))   + ',';
                sSql := sSql + FloatToStrPonto(RoundCM(rValCorrente)) + ')';
             end;

          End Else
          Begin
             //=============================================================
             // Altera registros na tabela PlanoSaldo
             //=============================================================
             sSql := 'UPDATE PLANOSALDO SET  ';
             sSql := sSql + 'PLANO = ' + FloatToStr(iPlano)     + ',';

             if iPatro <> 0 then
                 sSql := sSql + 'IDPATRO = ' + FloatToStr(iPatro)     + ','
             else
                 sSql := sSql + 'IDPATRO = null' + ',';

             if iPlanoPrev <> 0 then
                sSql := sSql + 'IDPLANOPREV = ' + FloatToStr(iPlanoPrev) + ','
             else
                sSql := sSql + 'IDPLANOPREV = null' +  ',';

             sSql := sSql + 'IDPESSOA  = ' + FloatToStr(IdEmpresa)  + ',';

             if  iUnidNegoc <> 0 then
                 sSql := sSql + 'UNIDNEGOC = ' + FloatToStr(iUnidNegoc) + ','
             else
                 sSql := sSql + 'UNIDNEGOC = null' + ',';

             if iSubConta <> 0 then
                sSql := sSql + 'CODSUBCONTA = ' + FloatToStr(iSubConta)  + ','
             else
                sSql := sSql + 'CODSUBCONTA = null' + ',';

             sSql := sSql + 'IDUSUARIOINCLUSAO = ' + FloatToStr(iUsuario)   + ',';
             sSql := sSql + 'PEREXERCICIO      = ' + IntToStr(iExercicio)   + ',';

             if  iPeriodo <> 0 then
                 sSql := sSql + 'PERNUMERO = ' + IntToStr(iPeriodo) + ','
             else
                 sSql := sSql + 'PERNUMERO = null' + ',';

             sSql := sSql + 'PLSTIPO   = ' + #39+sTipoConta+#39 + ',';
             sSql := sSql + 'PLACONTA  = ' + #39+sConta+#39     + ',';


             if (sCCust = '') then
             begin
                 sSql := sSql + 'CODCENTROCUSTO = null' + ',';
                 sSql := sSql + 'IDEMPRESA      = null' + ',';
             end else
             begin
                sSql := sSql + 'CODCENTROCUSTO = ' + #39+sCCust+#39        + ',';
                sSql := sSql + 'IDEMPRESA      = ' + FloatToStr(IdEmpresa) + ',';
             end;

             if sDebCre = 'D' then begin
                sSql := sSql + 'PLSORCADODEBITO   = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSORCADODEBITO').AsFloat  {+rValOrcado}))   + ',';
                sSql := sSql + 'PLSDEBITOOFICIAL  = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSDEBITOOFICIAL').AsFloat {+rValOficial}))  + ',';
                sSql := sSql + 'PLSDEBITOHIST     = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSDEBITOHIST').AsFloat    {+rValHist}))     + ',';
                sSql := sSql + 'PLSDEBITOGEREN2   = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSDEBITOGEREN2').AsFloat  {+rValGeren2}))   + ',';
                sSql := sSql + 'PLSDEBITOGEREN1   = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSDEBITOGEREN1').AsFloat  {+rValGeren1}))   + ',';
                sSql := sSql + 'PLSDEBITOGER      = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSDEBITOGER').AsFloat     {+rValGeren}))    + ',';
                sSql := sSql + 'PLSDEBITOCORRENTE = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSDEBITOCORRENTE').AsFloat{+rValCorrente})) + ',';

                sSql := sSql + 'PLSORCADOCREDITO  = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSORCADOCREDITO').AsFloat)) + ',';
                sSql := sSql + 'PLSCREDITOOFICIAL = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSCREDITOOFICIAL').AsFloat))+ ',';
                sSql := sSql + 'PLSCREDITOHIST    = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSCREDITOHIST').AsFloat))   + ',';
                sSql := sSql + 'PLSCREDITOGEREN2  = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSCREDITOGEREN2').AsFloat)) + ',';
                sSql := sSql + 'PLSCREDITOGEREN1  = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSCREDITOGEREN1').AsFloat)) + ',';
                sSql := sSql + 'PLSCREDITOGER     = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSCREDITOGER').AsFloat))    + ',';
                sSql := sSql + 'PLSCREDITOCOR     = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSCREDITOCOR').AsFloat));
             end else
             begin
                sSql := sSql + 'PLSORCADODEBITO   = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSORCADODEBITO').AsFloat))  + ',';
                sSql := sSql + 'PLSDEBITOOFICIAL  = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSDEBITOOFICIAL').AsFloat)) + ',';
                sSql := sSql + 'PLSDEBITOHIST     = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSDEBITOHIST').AsFloat))    + ',';
                sSql := sSql + 'PLSDEBITOGEREN2   = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSDEBITOGEREN2').AsFloat))  + ',';
                sSql := sSql + 'PLSDEBITOGEREN1   = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSDEBITOGEREN1').AsFloat))  + ',';
                sSql := sSql + 'PLSDEBITOGER      = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSDEBITOGER').AsFloat))     + ',';
                sSql := sSql + 'PLSDEBITOCORRENTE = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSDEBITOCORRENTE').AsFloat))+ ',';

                sSql := sSql + 'PLSORCADOCREDITO  = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSORCADOCREDITO').AsFloat {+rValOrcado}))  + ',';
                sSql := sSql + 'PLSCREDITOOFICIAL = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSCREDITOOFICIAL').AsFloat{+rValOficial})) + ',';
                sSql := sSql + 'PLSCREDITOHIST    = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSCREDITOHIST').AsFloat   {+rValHist}))    + ',';
                sSql := sSql + 'PLSCREDITOGEREN2  = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSCREDITOGEREN2').AsFloat {+rValGeren2}))  + ',';
                sSql := sSql + 'PLSCREDITOGEREN1  = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSCREDITOGEREN1').AsFloat {+rValGeren1}))  + ',';
                sSql := sSql + 'PLSCREDITOGER     = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSCREDITOGER').AsFloat    {+rValGeren}))   + ',';
                sSql := sSql + 'PLSCREDITOCOR     = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSCREDITOCOR').AsFloat    {+rValCorrente}));
             end;
             sSql := sSql + ' WHERE (IDPLANOSALDO  = ' + FloatToStr(_lDataSet.FieldByName('IDPLANOSALDO').AsFloat) + ')';

          End;

          Result := ExecSQL(sSql);

          If Not Result Then
          Begin
             If bInclui Then
                Raise Exception.Create('Erro ao Tentar Incluir Plano Saldos.' + #10#13+MessageInfo)
             Else
                Raise Exception.Create('Erro ao Tentar Alterar Plano Saldos.'+ #10#13+MessageInfo);
          End;

       End;

   Except
       on E:Exception Do
       Begin
          Result := False;
          MessageInfo := E.Message;
       End;
  End;

end;

function TCtrlImobLancamento.FazRateio(liEmpresa, liModulo, liUsuario, liCodPlano,
         liPlanilRateio, liPlanoPrev, liPatro, liSubContaCp, liSubContaRt,
         liUnidNegoc: Integer;  sDataLanc, sNumDoc, sTipoOper, sCcustoCp,
         sContaCp, sCodHistCp, sHist1Cp, sHist2Cp, sHist3Cp, sHist4Cp,
         sHist5Cp, sCcustoRt, sContaRt, sCodHistRt, sHist1Rt, sHist2Rt,
         sHist3Rt, sHist4Rt, sHist5Rt, sDebCre: string; dValor: Double;
         bJunta, bUsaPPatro: Boolean;
         const iIdSegregaCriter: integer; const dDataSegregaCriter: tDateTime) :Boolean;
var
  sSql,sTipoRateio,sContaD,sContaC,sMens,sCCustoD,sCCustoC :string;
  _cdsPlanilRateio : TClientDataSet;
  _cdsSaldoRateio  : TClientDataSet;
  rValorRateio,  dPlnCodigo : Double;
  sTipoLanc :char;

  iSubContaD,iSubContaC,iUnidNegoc :Integer;
begin
   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.FazRateio(liEmpresa, liModulo, liUsuario, liCodPlano,
                                 liPlanilRateio, liPlanoPrev, liPatro, liSubContaCp,
                                 liSubContaRt,liUnidNegoc, sDataLanc, sNumDoc, sTipoOper,
                                 sCcustoCp, sContaCp, sCodHistCp, sHist1Cp, sHist2Cp,
                                 sHist3Cp, sHist4Cp, sHist5Cp, sCcustoRt, sContaRt,
                                 sCodHistRt, sHist1Rt, sHist2Rt,  sHist3Rt, sHist4Rt,
                                 sHist5Rt, sDebCre, dValor,bJunta, bUsaPPatro,FRetornoPlnPlanil,
                                 iIdSegregaCriter, dDataSegregaCriter );

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
         MessageInfo := Connection.AppServer.MessageInfo;

   End Else
   Begin
      Result := True;
      iUnidNegoc := liUnidNegoc;
      dPlnCodigo := 0;
      _cdsPlanilRateio := TClientDataSet.Create(nil);
      _cdsSaldoRateio  := TClientDataSet.Create(nil);

     Try

        StartTransaction;
        sSql := 'SELECT  '+
                '   P.PANCONTAPERC, D.PANNUMLANC, '+
                '   D.PLANO, D.PANCONTABASE, D.PANCCUSTOBASE, '+
                '   D.PLACONTA, D.CODCENTROCUSTO, '+
                '   D.IDEMPRESA, D.IDPESSOA, D.PANPERC, ' +
                '   D.UNIDNEGOC, D.CODSUBCONTA, D.TIPCODIGO '+
                '   FROM  PREPLANILHA P, PREDETALHE D ' +
                'WHERE '  +
                '   (P.PANCODIGO = ' + IntToStr(liPlanilRateio) + ') AND '+
                '   (P.PANCODIGO = D.PANCODIGO) ' +
                'ORDER BY  D.PANNUMLANC ';

        _cdsPlanilRateio.Data := GetDataPacket(sSql);

       If _cdsPlanilRateio.isEmpty Then
       Begin
         sMens := 'Código da Planilha de Rateio não existe.';
         Raise Exception.Create(sMens);
       End;

       sTipoRateio := _cdsPlanilRateio.FieldByName('PANCONTAPERC').asString;
       CtrlPeriodo.PeriodoEsp := FlcPeriodoEsp;
       If Not CtrlPeriodo.RetornaPeriodoExercicioDataProc(liEmpresa,sDataLanc)  Then
       Begin
         sMens := CtrlPeriodo.MessageInfo;
         Raise Exception.Create(sMens);
       End;

       If sTipoRateio = 'P' Then
       Begin

         While Not _cdsPlanilRateio.Eof do
         Begin

            If Not _cdsPlanilRateio.FieldByName('UNIDNEGOC').isNull Then
            Begin
               iUnidNegoc := _cdsPlanilRateio.FieldByName('UNIDNEGOC').asInteger;
            End;

            If Not _cdsPlanilRateio.FieldByName('TIPCODIGO').isNull Then
            Begin
               sTipoOper := _cdsPlanilRateio.FieldByName('TIPCODIGO').asString;
            End;

            rValorRateio := (dValor * (_cdsPlanilRateio.FieldByName('PANPERC').asFloat / 100));

            If sDebCre = 'D' Then
            Begin
               sTipoLanc  := '0';

               If _cdsPlanilRateio.FieldByName('PLACONTA').isNull Then
                  sContaD    := sContaRt
               Else
                  sContaD    := _cdsPlanilRateio.FieldByName('PLACONTA').asString;

               If _cdsPlanilRateio.FieldByName('CODCENTROCUSTO').isNull Then
                  sCCustoD   := sCCustoRt
               Else
                  sCCustoD   := _cdsPlanilRateio.FieldByName('CODCENTROCUSTO').asString;

               If _cdsPlanilRateio.FieldByName('CODSUBCONTA').isNull Then
                  iSubContaD := liSubContaRt
               Else
                  iSubContaD := _cdsPlanilRateio.FieldByName('CODSUBCONTA').asInteger;

               sContaC    := '';
               sCCustoC   := '';
               iSubContaC := 0;

            End Else
            Begin

               sTipoLanc := '1';

               If _cdsPlanilRateio.FieldByName('PLACONTA').isNull Then
                  sContaC    := sContaRt
               Else
                  sContaC    := _cdsPlanilRateio.FieldByName('PLACONTA').asString;

               If _cdsPlanilRateio.FieldByName('CODCENTROCUSTO').isNull Then
                  sCCustoC   := sCCustoRt
               Else
                  sCCustoC   := _cdsPlanilRateio.FieldByName('CODCENTROCUSTO').asString;

               If _cdsPlanilRateio.FieldByName('CODSUBCONTA').isNull Then
                  iSubContaC := liSubContaRt
               Else
                  iSubContaC := _cdsPlanilRateio.FieldByName('CODSUBCONTA').asInteger;

               sContaD    := '';
               sCCustoD   := '';
               iSubContaD := 0;
            End;

            FlcTestaConta := True;
            If Not InsereLancaContab(sTipoLanc,liEmpresa,liModulo,liUsuario,
                                    liCodPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                    liPlanoPrev,liPatro,dPlnCodigo,0,
                                    sDataLanc,sNumDoc,sHist1Rt,sHist2Rt,sHist3Rt,
                                    sHist4Rt,sHist5Rt,sTipoOper,sCCustoD,sContaD,
                                    sCCustoC,sContaC,sCodHistRt,
                                    rValorRateio,bJunta,bUsaPPatro,
                                    iIdSegregaCriter, dDataSegregaCriter, -1) Then

            Begin
              sMens  := MessageInfo;
              Raise Exception.Create(sMens);
            End Else
            Begin
               dPlnCodigo := RetornoPlnCodigo;
            End;

            _cdsPlanilRateio.Next;
         End;

      End Else
      Begin
         If sCCustoRt <> '' Then
         Begin
            sSql := 'SELECT '+
                    '   S.PLANO, S.PLACONTA, S.CODCENTROCUSTO, S.IDEMPRESA, '+
                    '   S.CODSUBCONTA, S.IDPESSOA, S.UNIDNEGOC, '+
                    '   DECODE(B.SALDORATEIO, 0, 0, SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) - '+
                    '   DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR))/B.SALDORATEIO) AS PERCRATEIO '+
                    'FROM '+
                    '   PLANOSALDO S, '+
                    '   (SELECT '+
                    '       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) - '+
                    '           DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDORATEIO '+
                    '    FROM '+
                    '       PLANOSALDO '+
                    '    WHERE '+
                    '           (PLANO     = ' + IntToStr(liCodPlano) + ') '+
                    '       AND (RTRIM(PLACONTA)  = ' + Trim(_cdsPlanilRateio.FieldByName('PANCONTABASE').asString) + ') ';

            If sCCustoRt <> '' Then
            Begin
              sSql := sSql + '  AND (RTRIM(CODCENTROCUSTO) = ' + Trim(_cdsPlanilRateio.FieldByName('PANCCUSTOBASE').asString) + ') '+
                             '  AND (IDEMPRESA      = ' + IntToStr(liEmpresa) + ') ';
            End;

            sSql := SSql +  '   AND (PEREXERCICIO   = '+ IntToStr(CtrlPeriodo.Exercicio)+ ') ' +
                            '   AND (PERNUMERO      = '+ IntToStr(CtrlPeriodo.Exercicio)+ ') ' +
                            '   AND (IDPESSOA       = '+ IntToStr(liEmpresa) + ')) B '+
                            'WHERE  '+
                            '       (S.PLANO     = ' + IntToStr(liCodPlano) + ') '+
                            '   AND (RTRIM(S.PLACONTA)  = ' + Trim(_cdsPlanilRateio.FieldByName('PANCONTABASE').asString) + ') ';

            If sCCustoRt <> '' Then
            Begin
              sSql := sSql + '  AND (RTRIM(CODCENTROCUSTO) = '+ Trim(_cdsPlanilRateio.FieldByName('PANCCUSTOBASE').asString)+ ') '+
                             '  AND (IDEMPRESA      = ' + IntToStr(liEmpresa) + ') ';
            End;

            sSql := sSql +  '   AND (S.PEREXERCICIO   = '+ IntToStr(CtrlPeriodo.Exercicio)+ ') ' +
                            '   AND (S.PERNUMERO      = '+ IntToStr(CtrlPeriodo.Periodo)+ ') ' +
                            '   AND (S.IDPESSOA       = '+ IntToStr(liEmpresa)+ ') ' +
                            'GROUP BY  '+
                            '   S.PLANO, S.PLACONTA, S.CODCENTROCUSTO, S.IDEMPRESA, '+
                            '   S.CODSUBCONTA, S.IDPESSOA, S.UNIDNEGOC, B.SALDORATEIO ';

            _cdsSaldoRateio.Data  := GetDataPacket(sSql);

         End Else
         Begin
            sSql := 'SELECT '+
                    '   S.PLANO, S.PLACONTA, S.CODCENTROCUSTO, S.IDEMPRESA, '+
                    '   S.CODSUBCONTA, S.IDPESSOA, S.UNIDNEGOC, '+
                    '   DECODE(B.SALDORATEIO, 0, 0, SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) - '+
                    '       DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR))/B.SALDORATEIO) AS PERCRATEIO '+
                    'FROM '+
                    '   PLANOSALDO S, '+
                    '   (SELECT  '+
                    '       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) - '+
                    '           DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDORATEIO '+
                    '    FROM  '+
                    '       PLANOSALDO '+
                    '    WHERE '+
                    '           (PLANO           = '+ IntToStr(liCodPlano) + ') '+
                    '       AND (RTRIM(PLACONTA) = '+ Trim(_cdsPlanilRateio.FieldByName('PANCONTABASE').asString) + ') ' +
                    '       AND (PEREXERCICIO    = '+ IntToStr(CtrlPeriodo.Exercicio)+ ') ' +
                    '       AND (PERNUMERO       = '+ IntToStr(CtrlPeriodo.Periodo)+ ') ' +
                    '       AND (IDPESSOA        = '+ IntToStr(liEmpresa)+ ')) B '+
                    'WHERE  '+
                    '       (S.PLANO           = ' + IntToStr(liCodPlano) + ') '+
                    '   AND (RTRIM(S.PLACONTA) = ' + Trim(_cdsPlanilRateio.FieldByName('PANCONTABASE').asString) + ') '+
                    '   AND (S.PEREXERCICIO    = '+ IntToStr(CtrlPeriodo.Exercicio)+ ') ' +
                    '   AND (S.PERNUMERO       = '+ IntToStr(CtrlPeriodo.Periodo)+ ') ' +
                    '   AND (S.IDPESSOA        = '+ IntToStr(liEmpresa) + ') ' +
                    'GROUP BY ' +
                    '   S.PLANO, S.PLACONTA, S.CODCENTROCUSTO, S.IDEMPRESA, '+
                    '   S.CODSUBCONTA, S.IDPESSOA, S.UNIDNEGOC, B.SALDORATEIO ';


            _cdsSaldoRateio.Data  := GetDataPacket(sSql);
         End;

         While not _cdsSaldoRateio.eof do
         Begin
            rValorRateio := (dValor * (_cdsSaldoRateio.FieldByName('PERCRATEIO').asFloat));

            If sDebCre = 'D' Then
            Begin
               sTipoLanc  := '0';
               sContaD    := _cdsSaldoRateio.FieldByName('PLACONTA').asString;
               sCCustoD   := _cdsSaldoRateio.FieldByName('CODCENTROCUSTO').asString;
               iSubContaD := _cdsSaldoRateio.FieldByName('CODSUBCONTA').asInteger;
               sContaC    := '';
               sCCustoC   := '';
               iSubContaC := 0;
            End Else
            Begin
               sTipoLanc := '1';
               sContaC    := _cdsSaldoRateio.FieldByName('PLACONTA').asString;
               sCCustoC   := _cdsSaldoRateio.FieldByName('CODCENTROCUSTO').asString;
               iSubContaC := _cdsSaldoRateio.FieldByName('CODSUBCONTA').asInteger;
               sContaD    := '';
               sCCustoD   := '';
               iSubContaD := 0;
            End;

            If Not _cdsSaldoRateio.FieldByName('UNIDNEGOC').isNull Then
               iUnidNegoc := _cdsSaldoRateio.FieldByName('UNIDNEGOC').asInteger
            Else
               iUnidNegoc := liUnidNegoc;

            If Not _cdsSaldoRateio.FieldByName('TIPCODIGO').isNull Then
               sTipoOper := _cdsSaldoRateio.FieldByName('TIPCODIGO').asString;


            FlcTestaConta := True;
            If not InsereLancaContab (sTipoLanc,liEmpresa,liModulo,
                                      liUsuario,liCodPlano,iUnidNegoc,
                                      iSubContaD,iSubContaC,
                                      liPlanoPrev,liPatro,dPlnCodigo,0,
                                      sDataLanc,sNumDoc,sHist1Rt,sHist2Rt,sHist3Rt,
                                      sHist4Rt,sHist5Rt,sTipoOper,sCCustoD,sContaD,
                                      sCCustoC,sContaC,sCodHistRt, rValorRateio,
                                      bJunta, bUsaPPatro,
                                      iIdSegregaCriter, dDataSegregaCriter, -1) Then

            Begin
              sMens  := MessageInfo;
              Raise Exception.Create(sMens);
            End Else
            Begin
               dPlnCodigo := RetornoPlnCodigo;
            End;
            _cdsSaldoRateio.Next;
         End;
      End;

      If sContaCP <> '' Then
      Begin

         If sDebCre = 'C' then begin
            sTipoLanc  := '0';
            sDebCre    := 'D';
            sContaD    := sContaCP;
            sCCustoD   := sCCustoCP;
            iSubContaD := liSubContaCP;
            sContaC    := '';
            sCCustoC   := '';
            iSubContaC := 0;
         End Else
         Begin
            sTipoLanc  := '1';
            sDebCre    := 'C';
            sContaC    := sContaCP;
            sCCustoC   := sCCustoCP;
            iSubContaC := liSubContaCP;
            sContaD    := '';
            sCCustoD   := '';
            iSubContaD := 0;
         End;

         FlcTestaConta := True;
         If not InsereLancaContab (sTipoLanc,liEmpresa,liModulo,liUsuario,
                                   liCodPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                   liPlanoPrev,liPatro,dPlnCodigo,0,
                                   sDataLanc,sNumDoc,sHist1Cp,sHist2Cp,sHist3Cp,
                                   sHist4Cp,sHist5Cp,sTipoOper,sCCustoD,sContaD,
                                   sCCustoC,sContaC, sCodHistCp, dValor,
                                   bJunta,bUsaPPatro,
                                   iIdSegregaCriter, dDataSegregaCriter, -1) Then

         Begin
           sMens  := MessageInfo;
           Raise Exception.Create(sMens);
         End;
      End;

      _Sql.SQL.Clear;
      _Sql.SQL.Add('SELECT P.PLNPLANIL FROM PLANILHA P ');
      _Sql.SQL.Add(' WHERE (P.PLNCODIGO = :PLNCODIGO)  ');

      _Sql.Prepare;
      _Sql.ParamByName('PLNCODIGO').AsFloat := RetornoPlnCodigo;
      _cds.data := _Sql.Data;

      FRetornoPlnPlanil := _cds.FieldByName('PLNPLANIL').asFloat;
      MessageInfo  := FloatToStr(_cds.FieldByName('PLNPLANIL').asFloat);
        If not CtrlPadroes.GravaLogOperacoes(liEmpresa, liModulo, liUsuario, 'Planilhas - Rateio',False) then
           Raise Exception.Create( CtrlPadroes.MessageInfo );
      Commit;

     Except
         on E:Exception Do
         Begin
            RollBack;
            Result := False;
            MessageInfo := E.Message;
         End;
     End;
   End;

end;


function TCtrlImobLancamento.AtuSaldoSintetica(IdEmpresa, iUnidNegoc, iUsuario,
  iPlanoPrev, iPatro, iPlano: Double; iExercicio, iPeriodo: Integer;iSubConta : double;
   sCCust, sConta, sDebCre, sMascara: string; rValCorrente,
  rValOrcado, rValOficial, rValGeren, rValGeren1, rValGeren2,
  rValHist: Double; bUsaPlanoPatro: boolean): Boolean;
var iGrau,iNumEle : Integer;
    _cdsConta : TClientDataset;
begin
   Result := True;
   sConta := trim(sConta);
   iGrau  := CtrlGeral.CalcGrau(sMascara,sConta);
   _cdsConta := TClientDataset.Create(nil);
   try
     while iGrau > 0 do begin
        iGrau  := iGrau - 1;
        if iGrau > 0 then begin
           iNumEle:= CtrlGeral.CalcNumEleGrau(sMascara,iGrau);
           sConta := copy(sConta,1,iNumEle);
           //_cdsConta.Data := getDataPacket('SELECT PLACONTA FROM PLANOCONTA WHERE PLACONTA = '''+ copy( sConta +'                  ', 1, 18 ) +''' AND PLANO = '+ FloatToStr(iPlano) );  //MIGRACAO-ORACLE
           _cdsConta.Data := getDataPacket('SELECT PLACONTA FROM PLANOCONTA WHERE PLACONTA = '+ Quotedstr(trim(sConta))+' AND PLANO = '+ FloatToStr(iPlano) );  //MIGRACAO-ORACLE
           if not _cdsConta.IsEmpty then
             Result := AtuSaldoContas(IdEmpresa, iUnidNegoc, iUsuario,
                            iPlanoPrev, iPatro, iPlano, iExercicio, iPeriodo, iSubConta,
                            sCCust, sConta, sDebCre,'S', rValCorrente, rValOrcado, rValOficial,
                            rValGeren, rValGeren1, rValGeren2, rValHist, bUsaPlanoPatro);

           if not Result then break;
        end;
     end;
   finally
     _cdsConta.Free;
   end;
end;
function TCtrlImobLancamento.ListModulos(bOrdenaModulo: Boolean): OleVariant;
var
  sSql,sOrdena :string;
begin
      sOrdena := '';
      Result := True;

      sSql := 'SELECT IDMODULO, NOMEMODULO ' +
              'FROM MODULO ';

      if bOrdenaModulo then
         sOrdena := 'ORDER BY IDMODULO '
      else
         sOrdena := 'ORDER BY NOMEMODULO ';

      sSql := sSql + sOrdena;
      result := GetDataPacket(sSql);

end;

function TCtrlImobLancamento.SelecionaLancamentos(IdPlnCodigo,IdEmpresa: Double;
  iExercicio, iPeriodo: Integer; TipoPeriodo: TTipoPeriodo; sDataIni,
  sDataFim, sModulos, sTipoOper: String; TipoEfetivado: TTipoEfetivado;
  TipoOutraMoeda: TTipoOutraMoeda;  TipoOrdenaLanc: TTipoOrdenaLanc;
  TipoSomatorio : TTipoSomatorio; bComConta : Boolean;
  bInserePlanoPatro: boolean = false): OleVariant;
begin

    With _sql Do
      Try
          SQL.Clear;
          SQL.Add('SELECT                                                        ');

          if bInserePlanoPatro then
             SQL.Add('   PRV.NOME AS PLANOPREV, PE.NOME AS PATRO,');

          SQL.Add('   P.PERNUMERO,P.PEREXERCICIO,L.PLANO,L.PLACONTA, L.TIPCODIGO,');
          SQL.Add('   L.CODSUBCONTA,L.IDEMPRESA,L.UNIDNEGOC,L.CODCENTROCUSTO,    ');
          SQL.Add('   L.IDPLANOPREV, L.IDPATRO, L.LACDEBCRE,                     ');

          if bComConta then begin
             SQL.Add('   C.PLANOME, C.PLATIPO, C.PLAGRUPO, C.PLANOMEOUTLING, C.PLACCUST,    ');
          end;

          if (TipoSomatorio = tsPeriodo) or (TipoSomatorio = tsData) then
          begin

             if (TipoSomatorio = tsData) then
                SQL.Add('   P.PLNDATDIA,                     ');

             SQL.Add('   ROUND(SUM(NVL(L.LACVALOR,0)),2) AS LACVALOR,               ');
             SQL.Add('   ROUND(SUM(NVL(L.LACVALOFICIAL,0)),2) AS LACVALOFICIAL,     ');
             SQL.Add('   ROUND(SUM(NVL(L.LACVALGERENCIAL,0)),2) AS LACVALGERENCIAL, ');
             SQL.Add('   ROUND(SUM(NVL(L.LACVALGEREN1,0)),2) AS LACVALGEREN1,       ');
             SQL.Add('   ROUND(SUM(NVL(L.LACVALGEREN2,0)),2) AS LACVALGEREN2,       ');
             SQL.Add('   ROUND(SUM(NVL(L.LACVALHIST,0)),2) AS LACVALHIST            ');
          end else
          begin
             SQL.Add('   L.LACNUMLAN, P.PLNPLANIL,P.PLNCODIGO, P.PLNDATDIA,         ');
             SQL.Add('   L.LACVALOR, L.LACVALOFICIAL, L.LACVALGERENCIAL,L.LACNUMDOC,');
             SQL.Add('   L.LACVALGEREN1, L.LACVALGEREN2, L.LACVALHIST               ');
          end;

          SQL.Add('FROM                                                          ');
          SQL.Add('   PLANILHA P, LANCAMENTO L                                   ');

          if bInserePlanoPatro then
             SQL.Add('   ,PLANPREVCONTABIL PRV, PESSOA PE ');

          if bComConta then
             SQL.Add('   ,PLANOCONTA C                                           ');

          SQL.Add('WHERE (P.IDPESSOA = '+FloatToStr(IdEmpresa)+')                ');

          // Rodolpho da Silva - P: 17987 - 01/12/2005
          if bInserePlanoPatro then
          begin
             SQL.Add('  AND (L.IDPATRO = PE.IDPESSOA)' );
             SQL.Add('  AND (L.IDPLANOPREV = PRV.IDPLANOPREV) ');
          end;

          if IdPlnCodigo <> 0 then
             SQL.Add('  AND (P.PLNCODIGO = '+FloatToStr(IdPlnCodigo)+')             ');

          if iExercicio > 0 then
             SQL.Add('  AND (P.PEREXERCICIO = '+IntToStr(iExercicio)+')             ');

          if iPeriodo > 0 then begin
             Case TipoPeriodo of
                tpSoPeriodo  : SQL.Add('  AND (P.PERNUMERO = '+IntToStr(iPeriodo)+')     ');
                tpMenorIgual : SQL.Add('  AND (P.PERNUMERO <= '+IntToStr(iPeriodo)+')    ');
             end;
          end;

          if sModulos <> '' then
             SQL.Add('  AND (P.IDMODULO IN ('+sModulos+'))                  ');

          if sTipoOper <> '' then
             SQL.Add('  AND (L.TIPCODIGO ='''+sTipoOper+''')                ');

          if sDataIni <> '' then
             SQL.Add('  AND (P.PLNDATDIA >= TO_DATE('''+sDataIni+''',''DD/MM/YYYY''))  ');

          if sDataFim <> '' then
             SQL.Add('  AND (P.PLNDATDIA <= TO_DATE('''+sDataFim+''',''DD/MM/YYYY''))  ');


          if bComConta then begin
             SQL.Add('  AND (C.PLANO    = L.PLANO)                              ');
             SQL.Add('  AND (C.PLACONTA = L.PLACONTA)                           ');
          end;

          Case TipoOutraMoeda of
             tomNaoAtualizada : SQL.Add('  AND ((L.LACATOUTMOEDA = ''N'') OR (L.LACATOUTMOEDA IS NULL)) ');
             tomAtualizada    : SQL.Add('  AND (L.LACATOUTMOEDA = ''S'')                                ');
          end;

          Case TipoEfetivado of
             teNaoEfetivado : SQL.Add('  AND ((P.PLNEFETIVADO <> ''S'') OR (P.PLNEFETIVADO IS NULL)) ');
             teEfetivado    : SQL.Add('  AND (P.PLNEFETIVADO = ''S'')                                ');
          end;

          SQL.Add('  AND (P.PLNCODIGO = L.PLNCODIGO)                             ');

          if (TipoSomatorio = tsPeriodo) or (TipoSomatorio = tsData) then
          begin
             SQL.Add('GROUP BY P.PERNUMERO,P.PEREXERCICIO,L.PLANO,L.PLACONTA, L.TIPCODIGO,');

             // Rodolpho da Silva - P: 17987 - 01/12/2005
             if bInserePlanoPatro then
                SQL.Add('PRV.NOME, PE.NOME, ');

             if (TipoSomatorio = tsData) then
                SQL.Add('   P.PLNDATDIA,                     ');

             SQL.Add('   L.CODSUBCONTA,L.IDEMPRESA,L.UNIDNEGOC,L.CODCENTROCUSTO,    ');

             if bComConta then
             begin
                SQL.Add('   C.PLANOME, C.PLATIPO, C.PLAGRUPO, C.PLANOMEOUTLING,  C.PLACCUST,   ');
             end;
             SQL.Add('   L.IDPLANOPREV, L.IDPATRO, L.LACDEBCRE       ');
          end else
          begin
             Case TipoOrdenaLanc of
                tolData     : SQL.Add('ORDER BY P.PLNDATDIA, P.PLNPLANIL, L.LACNUMLAN  ');
                tolPlnCodigo: SQL.Add('ORDER BY P.PLNCODIGO, L.LACNUMLAN  ');
             end;
          end;
          Result := Data;
      Finally

      End;

end;

function TCtrlImobLancamento.SelecionaLancamentosEsp(IdPlnCodigo : Double): OleVariant;
begin
  SQLPlanilhaLancamento( IdPlnCodigo, 'LANCAMENTO' );
  With _Sql Do
  begin
    Prepare;
    ParamByName('PLNCODIGO').asFloat := IdPlnCodigo;
    Result := Data;
  end;
end;

function TCtrlImobLancamento.SelecionaPlanilhas(IdPlnCodigo, IdPlanilhaIni,IdPlanilhaFim,IdEmpresa: Double;
  iExercicio, iPeriodo: Integer; TipoPeriodo: TTipoPeriodo; sDataIni,
  sDataFim, sModulos, sTipoOper: String; TipoEfetivado: TTipoEfetivado;
  TipoOrdenaLanc: TTipoOrdenaLanc) : OleVariant;
begin
    With _Sql Do
      Try
           SQL.Clear;
           SQL.Add('SELECT M.NOMEMODULO, P.PLNPLANIL, P.PLNDATDIA, P.PLNCODIGO,   ');
           SQL.Add('       P.IDMODULO, P.PERNUMERO, P.PEREXERCICIO, P.IDPESSOA,   ');
           SQL.Add('       P.PLNNUMLAN, P.PLNTOTDEB, P.PLNTOTCRE, T.TIPDESCRICAO, ');
           SQL.Add('       P.PLNTOTDEBOFICIAL, P.PLNTOTCREOFICIAL, P.PLNTOTDEBGER,');
           SQL.Add('       P.PLNTOTCREGER, P.PLNTOTDEBGEREN1, P.PLNTOTCREGEREN1,  ');
           SQL.Add('       P.PLNTOTDEBGEREN2, P.PLNTOTCREGEREN2, P.PLNEFETIVADO,  ');
           SQL.Add('       P.PLNTOTDEBHIST, P.PLNTOTCREHIST, P.PLNPLANESTORNO,    ');
           SQL.Add('       P.PLNREFERENCIA, P.PANCODIGO, PE.PERNOME,              ');
           SQL.Add('       PS.NOME,(P.PLNTOTDEB-P.PLNTOTCRE) AS DIFERENCA         ');
           SQL.Add('FROM PLANILHA P, MODULO M, TIPOPER T, PERIODO PE, PESSOA PS   ');
           SQL.Add('WHERE (P.IDPESSOA = '+FloatToStr(IdEmpresa)+')                ');

           if IdPlnCodigo <> 0 then
              SQL.Add('  AND (P.PLNCODIGO = '+FloatToStr(IdPlnCodigo)+')           ');

           if IdPlanilhaIni > 0 then
              SQL.Add('  AND (P.PLNPLANIL >= '+FloatToStr(IdPlanilhaIni)+')        ');

           if IdPlanilhaFim > 0 then
               SQL.Add('  AND (P.PLNPLANIL <= '+FloatToStr(IdPlanilhaFim)+')       ');

           if iExercicio > 0 then
              SQL.Add('  AND (P.PEREXERCICIO = '+IntToStr(iExercicio)+')           ');

           if iPeriodo > 0 then begin
              Case TipoPeriodo of
                 tpSoPeriodo  : SQL.Add('  AND (P.PERNUMERO = '+IntToStr(iPeriodo)+')  ');
                 tpMenorIgual : SQL.Add('  AND (P.PERNUMERO <= '+IntToStr(iPeriodo)+')  ');
              end;
           end;

          if sModulos <> '' then
             SQL.Add('  AND (P.IDMODULO IN ('+sModulos+'))                  ');

          if sTipoOper <> '' then
             SQL.Add('  AND (P.TIPCODIGO ='''+sTipoOper+''')                ');

          if sDataIni <> '' then
             SQL.Add('  AND (P.PLNDATDIA >= TO_DATE('''+sDataIni+''',''DD/MM/YYYY''))  ');

          if sDataFim <> '' then
             SQL.Add('  AND (P.PLNDATDIA <= TO_DATE('''+sDataFim+''',''DD/MM/YYYY''))  ');

          Case TipoEfetivado of
             teNaoEfetivado : SQL.Add('  AND ((P.PLNEFETIVADO <> ''S'') OR (P.PLNEFETIVADO IS NULL)) ');
             teEfetivado    : SQL.Add('  AND (P.PLNEFETIVADO = ''S'')                                ');
          end;

          SQL.Add('  AND (P.IDMODULO          = M.IDMODULO(+))                    ');
          SQL.Add('  AND (P.TIPCODIGO         = T.TIPCODIGO(+))                   ');
          SQL.Add('  AND (P.IDUSUARIOINCLUSAO = PS.IDPESSOA(+))                   ');
          SQL.Add('  AND (P.PERNUMERO         = PE.PERNUMERO)                     ');
          SQL.Add('  AND (P.PEREXERCICIO      = PE.PEREXERCICIO)                  ');
          SQL.Add('  AND (P.IDPESSOA          = PE.IDPESSOA)                      ');

          Case TipoOrdenaLanc of
             tolData     : SQL.Add('ORDER BY P.PLNDATDIA, P.PLNPLANIL  ');
             tolPlnCodigo: SQL.Add('ORDER BY P.PLNCODIGO               ');
          end;

          Result := Data;

      Finally

      End;
end;

function TCtrlImobLancamento.EstornaLancaContab(iUsuario,iPlnCodigo, iModuloOrigem,iEmpresa : Double; bUsaPlanoPatro : Boolean; sDataEstorno : String ) : Boolean;
var sHistorico,sCCustoDeb,sCCustoCre,sContaDeb,sContaCre,sMens, sEfetivado : String;
    iPlnCodigoNovo,liSubContaCre, liSubContaDeb :Double;
    iNumLan : LongInt;
    sTipoLanc : Char;
    CdsEstorna : TClientDataSet;

  function getPlacontaDePara(const iPlano: integer; const sPlaconta: string): string;
  begin
    result := sPlaconta;
    _cds.data := getDataPacket(' SELECT PD.CONTA2 AS PLACONTA FROM PLANODEPARA PD, PLANOCONTA P '+
                               ' WHERE PD.CONTA1 = '+ quotedStr(sPlaconta) + ' AND '+
                               '       PD.PLANO2 = '+ intToStr(iPlano) + ' AND '+
                               '       PD.CONTA1 <> PD.CONTA2 AND '+
                               '       PD.CONTA1 = P.PLACONTA AND '+
                               '       PD.PLANO1 = P.PLANO AND '+
                               '       P.PLATIPO = ''S'' ' );

    if not _cds.isEmpty then
      result := _cds.fieldByName('PLACONTA').asString

  end;

  procedure GravaEstorno( bGravacaoMemoCalc : boolean );
  var
    sTableName : string;
  begin
    if not bGravacaoMemoCalc then
      sTableName := 'LANCAMENTO'
    else
      sTableName := 'MEMOCALCSEGREGA';

    DbGravaLanc.TableName := sTableName;

    CdsEstorna.Data := GetDataPacket('SELECT * FROM ' + sTableName + ' WHERE (PLNCODIGO = '+FloatToStr(iPlnCodigo)+') ORDER BY LACNUMLAN');

    CdsEstorna.First;
    while not CdsEstorna.eof do
    begin
      CdsEstorna.Edit;
      CdsEstorna.FieldByName('PLACONTA').AsString := getPlacontaDePara(CdsEstorna.FieldByName('PLANO').AsInteger,
                                                                       CdsEstorna.FieldByName('PLACONTA').AsString);
      CdsEstorna.Post;

      if CdsEstorna.FieldByName('LACTIPO').AsString = '2' then
      begin
        iNumLan := CdsEstorna.FieldByName('LACNUMLAN').AsInteger;
        if CdsEstorna.FieldByName('LACDEBCRE').AsString = 'D' Then
        begin
          sTipoLanc    := '1';
          FlcValOfiCre := CdsEstorna.FieldByName('LACVALOFICIAL').AsFloat;
          FlcValHisCre := CdsEstorna.FieldByName('LACVALHIST').AsFloat;
          FlcValGerCre := CdsEstorna.FieldByName('LACVALGERENCIAL').AsFloat;
          FlcValGe1Cre := CdsEstorna.FieldByName('LACVALGEREN1').AsFloat;
          FlcValGe2Cre := CdsEstorna.FieldByName('LACVALGEREN2').AsFloat;
          liSubContaDeb:= 0;
          liSubContaCre:= CdsEstorna.FieldByName('CODSUBCONTA').AsFloat;
          sContaDeb    := '';
          sContaCre    := CdsEstorna.FieldByName('PLACONTA').AsString;
          sCCustoDeb   := '';
          sCCustoCre   := CdsEstorna.FieldByName('CODCENTROCUSTO').AsString;

          FlcTipConvOfiCre := CdsEstorna.FieldByName('LACTIPCONVOFICIAL').AsString;
          FlcTipConvGerCre := CdsEstorna.FieldByName('LACTIPCONVGER').AsString;
          FlcTipConvGe1Cre := CdsEstorna.FieldByName('LACTIPCONVGEREN1').AsString;
          FlcTipConvGe2Cre := CdsEstorna.FieldByName('LACTIPCONVGEREN2').AsString;

          FlcValOfiDeb := 0;
          FlcValHisDeb := 0;
          FlcValGerDeb := 0;
          FlcValGe1Deb := 0;
          FlcValGe2Deb := 0;

          FlcTipConvOfiDeb := '';
          FlcTipConvGerDeb := '';
          FlcTipConvGe1Deb := '';
          FlcTipConvGe2Deb := '';

          FlcOriAplDeb     := '';
          FlcOriAplCre     := CdsEstorna.FieldByName('LACORIGEMAPLIC').AsString;
        end
        else
        begin
          sTipoLanc    := '0';
          FlcValOfiDeb := CdsEstorna.FieldByName('LACVALOFICIAL').AsFloat;
          FlcValHisDeb := CdsEstorna.FieldByName('LACVALHIST').AsFloat;
          FlcValGerDeb := CdsEstorna.FieldByName('LACVALGERENCIAL').AsFloat;
          FlcValGe1Deb := CdsEstorna.FieldByName('LACVALGEREN1').AsFloat;
          FlcValGe2Deb := CdsEstorna.FieldByName('LACVALGEREN2').AsFloat;

          liSubContaCre:= 0;
          liSubContaDeb:= CdsEstorna.FieldByName('CODSUBCONTA').AsFloat;
          sContaCre    := '';
          sContaDeb    := CdsEstorna.FieldByName('PLACONTA').AsString;
          sCCustoCre   := '';
          sCCustoDeb   := CdsEstorna.FieldByName('CODCENTROCUSTO').AsString;

          FlcTipConvOfiDeb := CdsEstorna.FieldByName('LACTIPCONVOFICIAL').AsString;
          FlcTipConvGerDeb := CdsEstorna.FieldByName('LACTIPCONVGER').AsString;
          FlcTipConvGe1Deb := CdsEstorna.FieldByName('LACTIPCONVGEREN1').AsString;
          FlcTipConvGe2Deb := CdsEstorna.FieldByName('LACTIPCONVGEREN2').AsString;

          FlcValOfiCre := 0;
          FlcValHisCre := 0;
          FlcValGerCre := 0;
          FlcValGe1Cre := 0;
          FlcValGe2Cre := 0;

          FlcTipConvOfiCre := '';
          FlcTipConvGerCre := '';
          FlcTipConvGe1Cre := '';
          FlcTipConvGe2Cre := '';

          FlcOriAplCre     := '';
          FlcOriAplDeb     := CdsEstorna.FieldByName('LACORIGEMAPLIC').AsString;
        end;

        CdsEstorna.Next;
        CdsEstorna.Edit;
        CdsEstorna.FieldByName('PLACONTA').AsString := getPlacontaDePara(CdsEstorna.FieldByName('PLANO').AsInteger,
                                                                         CdsEstorna.FieldByName('PLACONTA').AsString);
        CdsEstorna.Post;

        if iNumLan = CdsEstorna.FieldByName('LACNUMLAN').AsFloat then
        begin
          if CdsEstorna.FieldByName('LACDEBCRE').AsString = 'D' Then
          begin
            FlcValOfiCre     := CdsEstorna.FieldByName('LACVALOFICIAL').AsFloat;
            FlcValHisCre     := CdsEstorna.FieldByName('LACVALHIST').AsFloat;
            FlcValGerCre     := CdsEstorna.FieldByName('LACVALGERENCIAL').AsFloat;
            FlcValGe1Cre     := CdsEstorna.FieldByName('LACVALGEREN1').AsFloat;
            FlcValGe2Cre     := CdsEstorna.FieldByName('LACVALGEREN2').AsFloat;
            liSubContaCre    := CdsEstorna.FieldByName('CODSUBCONTA').AsFloat;
            sContaCre        := CdsEstorna.FieldByName('PLACONTA').AsString;
            sCCustoCre       := CdsEstorna.FieldByName('CODCENTROCUSTO').AsString;
            FlcTipConvOfiCre := CdsEstorna.FieldByName('LACTIPCONVOFICIAL').AsString;
            FlcTipConvGerCre := CdsEstorna.FieldByName('LACTIPCONVGER').AsString;
            FlcTipConvGe1Cre := CdsEstorna.FieldByName('LACTIPCONVGEREN1').AsString;
            FlcTipConvGe2Cre := CdsEstorna.FieldByName('LACTIPCONVGEREN2').AsString;
            FlcOriAplCre     := CdsEstorna.FieldByName('LACORIGEMAPLIC').AsString;
          end
          else
          begin
            FlcValOfiDeb     := CdsEstorna.FieldByName('LACVALOFICIAL').AsFloat;
            FlcValHisDeb     := CdsEstorna.FieldByName('LACVALHIST').AsFloat;
            FlcValGerDeb     := CdsEstorna.FieldByName('LACVALGERENCIAL').AsFloat;
            FlcValGe1Deb     := CdsEstorna.FieldByName('LACVALGEREN1').AsFloat;
            FlcValGe2Deb     := CdsEstorna.FieldByName('LACVALGEREN2').AsFloat;
            liSubContaDeb    := CdsEstorna.FieldByName('CODSUBCONTA').AsFloat;
            sContaDeb        := CdsEstorna.FieldByName('PLACONTA').AsString;
            sCCustoDeb       := CdsEstorna.FieldByName('CODCENTROCUSTO').AsString;
            FlcTipConvOfiDeb := CdsEstorna.FieldByName('LACTIPCONVOFICIAL').AsString;
            FlcTipConvGerDeb := CdsEstorna.FieldByName('LACTIPCONVGER').AsString;
            FlcTipConvGe1Deb := CdsEstorna.FieldByName('LACTIPCONVGEREN1').AsString;
            FlcTipConvGe2Deb := CdsEstorna.FieldByName('LACTIPCONVGEREN2').AsString;
            FlcOriAplDeb     := CdsEstorna.FieldByName('LACORIGEMAPLIC').AsString;
          end;
          sTipoLanc    := '2';
        end
        else
        begin
          if not CdsEstorna.Eof then
            CdsEstorna.Prior;
        end;
      end
      else
      begin
        if CdsEstorna.FieldByName('LACDEBCRE').AsString = 'D' Then
        begin
          sTipoLanc    := '1';
          FlcValOfiCre := CdsEstorna.FieldByName('LACVALOFICIAL').AsFloat;
          FlcValHisCre := CdsEstorna.FieldByName('LACVALHIST').AsFloat;
          FlcValGerCre := CdsEstorna.FieldByName('LACVALGERENCIAL').AsFloat;
          FlcValGe1Cre := CdsEstorna.FieldByName('LACVALGEREN1').AsFloat;
          FlcValGe2Cre := CdsEstorna.FieldByName('LACVALGEREN2').AsFloat;
          liSubContaDeb:= 0;
          liSubContaCre:= CdsEstorna.FieldByName('CODSUBCONTA').AsFloat;
          sContaDeb    := '';
          sContaCre    := CdsEstorna.FieldByName('PLACONTA').AsString;
          sCCustoDeb   := '';
          sCCustoCre   := CdsEstorna.FieldByName('CODCENTROCUSTO').AsString;

          FlcTipConvOfiCre := CdsEstorna.FieldByName('LACTIPCONVOFICIAL').AsString;
          FlcTipConvGerCre := CdsEstorna.FieldByName('LACTIPCONVGER').AsString;
          FlcTipConvGe1Cre := CdsEstorna.FieldByName('LACTIPCONVGEREN1').AsString;
          FlcTipConvGe2Cre := CdsEstorna.FieldByName('LACTIPCONVGEREN2').AsString;

          FlcValOfiDeb := 0;
          FlcValHisDeb := 0;
          FlcValGerDeb := 0;
          FlcValGe1Deb := 0;
          FlcValGe2Deb := 0;

          FlcTipConvOfiDeb := '';
          FlcTipConvGerDeb := '';
          FlcTipConvGe1Deb := '';
          FlcTipConvGe2Deb := '';

          FlcOriAplDeb     := '';
          FlcOriAplCre     := CdsEstorna.FieldByName('LACORIGEMAPLIC').AsString;
        end
        else
        begin
          sTipoLanc    := '0';
          FlcValOfiDeb := CdsEstorna.FieldByName('LACVALOFICIAL').AsFloat;
          FlcValHisDeb := CdsEstorna.FieldByName('LACVALHIST').AsFloat;
          FlcValGerDeb := CdsEstorna.FieldByName('LACVALGERENCIAL').AsFloat;
          FlcValGe1Deb := CdsEstorna.FieldByName('LACVALGEREN1').AsFloat;
          FlcValGe2Deb := CdsEstorna.FieldByName('LACVALGEREN2').AsFloat;

          liSubContaCre:= 0;
          liSubContaDeb:= CdsEstorna.FieldByName('CODSUBCONTA').AsFloat;
          sContaCre    := '';
          sContaDeb    := CdsEstorna.FieldByName('PLACONTA').AsString;
          sCCustoCre   := '';
          sCCustoDeb   := CdsEstorna.FieldByName('CODCENTROCUSTO').AsString;

          FlcTipConvOfiDeb := CdsEstorna.FieldByName('LACTIPCONVOFICIAL').AsString;
          FlcTipConvGerDeb := CdsEstorna.FieldByName('LACTIPCONVGER').AsString;
          FlcTipConvGe1Deb := CdsEstorna.FieldByName('LACTIPCONVGEREN1').AsString;
          FlcTipConvGe2Deb := CdsEstorna.FieldByName('LACTIPCONVGEREN2').AsString;

          FlcValOfiCre := 0;
          FlcValHisCre := 0;
          FlcValGerCre := 0;
          FlcValGe1Cre := 0;
          FlcValGe2Cre := 0;

          FlcTipConvOfiCre := '';
          FlcTipConvGerCre := '';
          FlcTipConvGe1Cre := '';
          FlcTipConvGe2Cre := '';

          FlcOriAplCre     := '';
          FlcOriAplDeb     := CdsEstorna.FieldByName('LACORIGEMAPLIC').AsString;
        end;
      end;
      FlcElemento      := CdsEstorna.FieldByName('IDELEMDEMONSTRAT').AsFloat;
      FlcPanCodigo     := _dbPlanilha.PanCodigo.AsFloat;
      FlcPlnEstorno    := iPlnCodigo;
      sHistorico := Trim('ESTORNO '+CdsEstorna.FieldByName('LACHIST1').AsString+' '+
                               CdsEstorna.FieldByName('LACHIST2').AsString+' '+
                               CdsEstorna.FieldByName('LACHIST3').AsString+' '+
                               CdsEstorna.FieldByName('LACHIST4').AsString+' '+
                               CdsEstorna.FieldByName('LACHIST5').AsString);

      if not InsereLancaContab( sTipoLanc, iEmpresa, iModuloOrigem,
                        iUsuario, CdsEstorna.FieldByName('PLANO').AsFloat,
                        CdsEstorna.FieldByName('UNIDNEGOC').AsFloat,
                        liSubContaDeb,liSubContaCre,
                        CdsEstorna.FieldByName('IDPLANOPREV').AsFloat,
                        CdsEstorna.FieldByName('IDPATRO').AsFloat, iPlnCodigoNovo,0,
                        sDataEstorno, CdsEstorna.FieldByName('LACNUMDOC').AsString,
                        sHistorico,'', '', '','', CdsEstorna.FieldByName('TIPCODIGO').AsString,
                        sCCustoDeb, sContaDeb, sCCustoCre, sContaCre,
                        CdsEstorna.FieldByName('HITCODHIST').AsString,
                        CdsEstorna.FieldByName('LACVALOR').AsFloat,False,
                        bUsaPlanoPatro,
                        CdsEstorna.FieldByName('IDSEGREGACRITER').AsInteger,
                        CdsEstorna.FieldByName('DATASEGREGACRITER').AsDateTime, -1,
                        CdsEstorna.FieldByName('IDSEGREGACONTR').AsInteger,
                        False, -1,
                        bGravacaoMemoCalc
                        ) Then
      begin
         sMens := MessageInfo;
         Raise Exception.Create(sMens);
      end;

      iPlnCodigoNovo := FRetornoPlnCodigo;
      CdsEstorna.Next;
    end;

  end;

begin
   sMens := '';
   Result := True;
   CdsEstorna := TClientDataSet.Create(nil);
   try
     Try
        _dbPlanilha.Plncodigo.AsFloat := iPlnCodigo;
        if not _dbPlanilha.LoadFromDb then begin
           sMens := 'Planilha não encontrada';
           Raise Exception.Create(sMens);
        end;
        if iEmpresa  <> _dbPlanilha.idPessoa.AsFloat then begin
           sMens := 'Planilha não pertence a empresa '+FloatToStr(iEmpresa);
           Raise Exception.Create(sMens);
        end;
        If Not CtrlContab.SelecionaParametrosProc(_dbPlanilha.idPessoa.AsFloat) Then Begin
           sMens := CtrlContab.MessageInfo;
           Abort;
        End;
        CtrlPeriodo.PeriodoEsp := FlcPeriodoEsp;
        if not CtrlPeriodo.RetornaPeriodoExercicioDataProc(_dbPlanilha.idPessoa.AsFloat,sDataEstorno) then begin
           sMens := CtrlPeriodo.MessageInfo;
           Raise Exception.Create(sMens);
        end;
        if iModuloOrigem = 1 then begin
           if CtrlPeriodo.TestaPeriodoBloqueadoProc(_dbPlanilha.idPessoa.AsFloat,tbBloqueado,CtrlPeriodo.Periodo,CtrlPeriodo.Exercicio,False) then begin
              sMens := CtrlPeriodo.MessageInfo + ' para estorno de lançamento';
              Raise Exception.Create(sMens);
           end;
           sEfetivado := 'S';
        end else begin
           if CtrlPeriodo.TestaPeriodoBloqueadoProc(_dbPlanilha.idPessoa.AsFloat,tbBloqOuInt, CtrlPeriodo.Periodo, CtrlPeriodo.Exercicio,False) then begin
              sMens := CtrlPeriodo.MessageInfo + ' para estorno de lançamento';
              Raise Exception.Create(sMens);
           end;
           if not CtrlContab.TestaDataBloqueadaProc(_dbPlanilha.idPessoa.AsFloat,iModuloOrigem,sDataEstorno) then begin
              sMens := CtrlContab.MessageInfo;
              Raise Exception.Create(sMens);
           end;
           sEfetivado := 'N';
        end;
        //Zera o número da nova planilha
        iPlnCodigoNovo := 0;

        //Grava os lançamentos
        GravaEstorno( False );

        //Grava memória de cálculo
        GravaEstorno( True );

     Except
       On E : Exception do
       begin
         MessageInfo := E.Message;
         Result      := False;
       end;
     end;

   finally
     FreeCds([CdsEstorna]);
   end;
end;

function TCtrlImobLancamento.ExcluiLancaContab(iUsuario,iPlnCodigo, iModuloOrigem : Double; iNumLan : LongInt; bUsaPlanoPatro, bExcluiPlanilha : Boolean ) : Boolean;
var sMens, sEfetivado, sSegregaControle : String;
    idEmpresa : Double;
    cdsLancamento, _CdsLocal : TClientDataSet;
    bUsaStoredProc: boolean;

begin
   if iNumLan = -1 then iNumLan := 0;

   sMens := '';
   Result := True;
   cdsLancamento   := TClientDataSet.Create(nil);
   _CdsLocal := TClientDataSet.Create(nil);

   Try
      _dbPlanilha.Plncodigo.AsFloat := iPlnCodigo;
      if not _dbPlanilha.LoadFromDb then begin
         sMens := 'Planilha não encontrada';
         Raise Exception.Create(sMens);
      end;

      if _dbPlanilha.IdLoteExportaCTB.AsFloat > 0 then begin
         sMens := 'A Planilha foi exportada e não poderá ser excluída';
         Raise Exception.Create(sMens);
      end;

      If Not CtrlContab.SelecionaParametrosProc(_dbPlanilha.idPessoa.AsFloat) Then
      Begin
         sMens := CtrlContab.MessageInfo;
         Raise Exception.Create(sMens);
      End;
      CtrlPeriodo.PeriodoEsp := FlcPeriodoEsp;
      if not CtrlPeriodo.RetornaPeriodoExercicioDataProc(_dbPlanilha.idPessoa.AsFloat,_dbPlanilha.PlnDatDia.AsString) then begin
         sMens := CtrlPeriodo.MessageInfo;
         Raise Exception.Create(sMens);
      end;
      if iModuloOrigem = 1 then begin
         if CtrlPeriodo.TestaPeriodoBloqueadoProc(_dbPlanilha.idPessoa.AsFloat,tbBloqueado,_dbPlanilha.perNumero.AsInteger,_dbPlanilha.perExercicio.AsInteger,False) then begin
            sMens := CtrlPeriodo.MessageInfo + ' para exclusão de lançamento';
            Raise Exception.Create(sMens);
         end;
      end else begin
         if CtrlPeriodo.TestaPeriodoBloqueadoProc(_dbPlanilha.idPessoa.AsFloat,tbBloqOuInt,_dbPlanilha.perNumero.AsInteger,_dbPlanilha.perExercicio.AsInteger,False) then begin
            sMens := CtrlPeriodo.MessageInfo+' para exclusão de lançamento';
            Raise Exception.Create(sMens);
         end;
         if not CtrlContab.TestaDataBloqueadaProc(_dbPlanilha.idPessoa.AsFloat,iModuloOrigem, _dbPlanilha.PlnDatDia.AsString) then begin
            sMens := CtrlContab.MessageInfo;
            Raise Exception.Create(sMens);
         end;
      end;

      sEfetivado := _dbPlanilha.PlnEfetivado.AsString;
      idEmpresa  := _dbPlanilha.idPessoa.AsFloat;
      bUsaStoredProc := UsaStoredProc(trunc(IdEmpresa));

      _CdsLocal.Data := GetDataPacket ('SELECT PACNAOAPAGAPLANIL FROM PARAMCONTAB WHERE IDPESSOA = ' +FloatToStr(idEmpresa));
      if _CdsLocal.FieldByName('PACNAOAPAGAPLANIL').AsInteger = 1 then
         bExcluiPlanilha := False;

      if iNumLan = 0 then begin
         if not bExcluiPlanilha then begin
            _dbPlanilha.Plntotdeboficial.AsFloat := 0;
            _dbPlanilha.Plntotdebhist.AsFloat    := 0;
            _dbPlanilha.Plntotdebgeren2.AsFloat  := 0;
            _dbPlanilha.Plntotdebgeren1.AsFloat  := 0;
            _dbPlanilha.Plntotdebger.AsFloat     := 0;
            _dbPlanilha.Plntotdeb.AsFloat        := 0;
            _dbPlanilha.Plntotcreoficial.AsFloat := 0;
            _dbPlanilha.Plntotcrehist.AsFloat    := 0;
            _dbPlanilha.Plntotcregeren2.AsFloat  := 0;
            _dbPlanilha.Plntotcregeren1.AsFloat  := 0;
            _dbPlanilha.Plntotcreger.AsFloat     := 0;
            _dbPlanilha.Plntotcre.AsFloat        := 0;
            _dbPlanilha.PlnNumLan.AsFloat        := 0;
            if not _dbPlanilha.UpDate then begin
               sMens := _dbPlanilha.MessageInfo;
               Raise Exception.Create(sMens);
            end;
         end;
         cdsLancamento.Data := SelecionaLancamentos(iPlncodigo,idEmpresa,0,0,tpSoPeriodo,'','','','',teAmbos,
                              tomAmbos,tolPlnCodigo,tsSemSoma,False);

         if not cdsLancamento.isEmpty then begin

            while not cdsLancamento.Eof do begin
               _dbLancamento.PlnCodigo.AsFloat := iPlnCodigo;
               _dbLancamento.LacNumLan.AsFloat := cdsLancamento.FieldByName('LACNUMLAN').AsFloat;
               _dbLancamento.LacDebCre.AsString:= cdsLancamento.FieldByName('LACDEBCRE').AsString;

               if _dbLancamento.LoadFromDb then
               begin
                  // perguntar se existe A STRORAGE PROCEDURE antes de prosseguir
                  if (not bUsaStoredProc) and (sEfetivado = 'S') then
                  begin
                     if not CtrlContaContabil.BuscaMascaraConta(_dbLancamento.Plano.AsFloat) then begin
                        sMens:= CtrlContaContabil.MessageInfo;
                        Raise Exception.Create(sMens);
                     end;
                     if not AtuSaldoContas (IdEmpresa, _dbLancamento.UnidNegoc.AsFloat,
                                           iUsuario, _dbLancamento.idPlanoPrev.AsFloat,
                                           _dbLancamento.idPatro.AsFloat,
                                           _dbLancamento.Plano.AsFloat,
                                           CtrlPeriodo.Exercicio,CtrlPeriodo.Periodo,
                                           _dbLancamento.CodSubConta.AsInteger,
                                           _dbLancamento.CodCentroCusto.AsString,
                                           _dbLancamento.PlaConta.AsString,
                                           cdsLancamento.FieldByName('LACDEBCRE').AsString,'A',
                                           _dbLancamento.Lacvalor.AsFloat*-1,0,
                                           _dbLancamento.Lacvaloficial.AsFloat*-1,
                                           _dbLancamento.Lacvalgerencial.AsFloat*-1,
                                           _dbLancamento.Lacvalgeren1.AsFloat*-1,
                                           _dbLancamento.Lacvalgeren2.AsFloat*-1,
                                           _dbLancamento.Lacvalhist.AsFloat*-1, bUsaPlanoPatro) then begin
                        sMens := MessageInfo;
                        Raise Exception.Create(sMens);
                     end;
                     if not AtuSaldoSintetica(IdEmpresa, _dbLancamento.UnidNegoc.AsFloat,
                                           iUsuario, _dbLancamento.idPlanoPrev.AsFloat,
                                           _dbLancamento.idPatro.AsFloat,
                                           _dbLancamento.Plano.AsFloat,
                                           CtrlPeriodo.Exercicio,CtrlPeriodo.Periodo,
                                           _dbLancamento.CodSubConta.AsInteger,
                                           _dbLancamento.CodCentroCusto.AsString,
                                           _dbLancamento.PlaConta.AsString,
                                           cdsLancamento.FieldByName('LACDEBCRE').AsString, CtrlContaContabil.MascaraConta,
                                           _dbLancamento.Lacvalor.AsFloat*-1,0,
                                           _dbLancamento.Lacvaloficial.AsFloat*-1,
                                           _dbLancamento.Lacvalgerencial.AsFloat*-1,
                                           _dbLancamento.Lacvalgeren1.AsFloat*-1,
                                           _dbLancamento.Lacvalgeren2.AsFloat*-1,
                                           _dbLancamento.Lacvalhist.AsFloat*-1, bUsaPlanoPatro) then begin
                        sMens := MessageInfo;
                        Raise Exception.Create(sMens);
                     end;
                  end;

                  if not _dbLancamento.Delete then begin
                     sMens := _dbLancamento.MessageInfo;
                     Raise Exception.Create(sMens);
                  end;
               end;
               cdsLancamento.Next;
            end;

            //Apaga a memória de cálculo de segregação de toda a planilha
            ExecSQL( ' delete from MEMOCALCSEGREGA where PLNCODIGO = ' + FloatToStr( iPlnCodigo ) );

            if bExcluiPlanilha then begin
               if not _dbPlanilha.Delete then begin
                  sMens := _dbPlanilha.MessageInfo;
                  Raise Exception.Create(sMens);
               end;
            end;
         end;
      end else begin

         //Recupera o seqüencial de segregação do lançamento
         sSegregaControle := '';
         _CdsLocal.Data := GetDataPacket (' select IDSEGREGACONTR from LANCAMENTO ' +
           ' where PLNCODIGO = ' + FloatToStr( iPlnCodigo ) + ' and LACNUMLAN = ' + FloatToStr( iNumLan ) );
         _CdsLocal.First;
         while not _CdsLocal.Eof do
         begin
           if sSegregaControle <> '' then sSegregaControle := sSegregaControle + ', ';
           sSegregaControle := sSegregaControle + _CdsLocal.FieldByName('IDSEGREGACONTR').AsString;
           _CdsLocal.Next;
         end;

         _dbLancamento.PlnCodigo.AsFloat := iPlnCodigo;
         _dbLancamento.LacNumLan.AsInteger := iNumLan;
         _dbLancamento.LacDebCre.AsString:= 'D';
         if _dbLancamento.LoadFromDb then begin
            _dbPlanilha.Plntotdeboficial.AsFloat := _dbPlanilha.Plntotdeboficial.AsFloat - _dbLancamento.Lacvaloficial.AsFloat;
            _dbPlanilha.Plntotdebhist.AsFloat    := _dbPlanilha.Plntotdebhist.AsFloat    - _dbLancamento.Lacvalhist.AsFloat;
            _dbPlanilha.Plntotdebgeren2.AsFloat  := _dbPlanilha.Plntotdebgeren2.AsFloat  - _dbLancamento.Lacvalgeren2.AsFloat;
            _dbPlanilha.Plntotdebgeren1.AsFloat  := _dbPlanilha.Plntotdebgeren1.AsFloat  - _dbLancamento.Lacvalgeren1.AsFloat;
            _dbPlanilha.Plntotdebger.AsFloat     := _dbPlanilha.Plntotdebger.AsFloat     - _dbLancamento.Lacvalgerencial.AsFloat;
            _dbPlanilha.Plntotdeb.AsFloat        := _dbPlanilha.Plntotdeb.AsFloat        - _dbLancamento.Lacvalor.AsFloat;
            if (not bUsaStoredProc) and (sEfetivado = 'S') then
            begin
               if not CtrlContaContabil.BuscaMascaraConta(_dbLancamento.Plano.AsFloat) then begin
                  sMens:= CtrlContaContabil.MessageInfo;
                  Raise Exception.Create(sMens);
               end;
               if not AtuSaldoContas(IdEmpresa, _dbLancamento.UnidNegoc.AsFloat,
                                     iUsuario, _dbLancamento.idPlanoPrev.AsFloat,
                                     _dbLancamento.idPatro.AsFloat,
                                     _dbLancamento.Plano.AsFloat,
                                     CtrlPeriodo.Exercicio,CtrlPeriodo.Periodo,
                                     _dbLancamento.CodSubConta.AsInteger,
                                     _dbLancamento.CodCentroCusto.AsString,
                                     _dbLancamento.PlaConta.AsString,'D','A',
                                     _dbLancamento.Lacvalor.AsFloat*-1,0,
                                     _dbLancamento.Lacvaloficial.AsFloat*-1,
                                     _dbLancamento.Lacvalgerencial.AsFloat*-1,
                                     _dbLancamento.Lacvalgeren1.AsFloat*-1,
                                     _dbLancamento.Lacvalgeren2.AsFloat*-1,
                                     _dbLancamento.Lacvalhist.AsFloat*-1, bUsaPlanoPatro) then begin
                  sMens := MessageInfo;
                  Raise Exception.Create(sMens);
               end;
               if not AtuSaldoSintetica(IdEmpresa, _dbLancamento.UnidNegoc.AsFloat,
                                     iUsuario, _dbLancamento.idPlanoPrev.AsFloat,
                                     _dbLancamento.idPatro.AsFloat,
                                     _dbLancamento.Plano.AsFloat,
                                     CtrlPeriodo.Exercicio,CtrlPeriodo.Periodo,
                                     _dbLancamento.CodSubConta.AsInteger,
                                     _dbLancamento.CodCentroCusto.AsString,
                                     _dbLancamento.PlaConta.AsString,'D', CtrlContaContabil.MascaraConta,
                                     _dbLancamento.Lacvalor.AsFloat*-1,0,
                                     _dbLancamento.Lacvaloficial.AsFloat*-1,
                                     _dbLancamento.Lacvalgerencial.AsFloat*-1,
                                     _dbLancamento.Lacvalgeren1.AsFloat*-1,
                                     _dbLancamento.Lacvalgeren2.AsFloat*-1,
                                     _dbLancamento.Lacvalhist.AsFloat*-1, bUsaPlanoPatro) then begin
                  sMens := MessageInfo;
                  Raise Exception.Create(sMens);
               end;
            end;

            if not _dbLancamento.Delete then begin
               sMens := _dbLancamento.MessageInfo;
               Raise Exception.Create(sMens);
            end;
         end;
         _dbLancamento.PlnCodigo.AsFloat := iPlnCodigo;
         _dbLancamento.LacNumLan.AsInteger := iNumLan;
         _dbLancamento.LacDebCre.AsString:= 'C';
         if _dbLancamento.LoadFromDb then begin
            _dbPlanilha.Plntotcreoficial.AsFloat := _dbPlanilha.Plntotcreoficial.AsFloat - _dbLancamento.Lacvaloficial.AsFloat;
            _dbPlanilha.Plntotcrehist.AsFloat    := _dbPlanilha.Plntotcrehist.AsFloat    - _dbLancamento.Lacvalhist.AsFloat;
            _dbPlanilha.Plntotcregeren2.AsFloat  := _dbPlanilha.Plntotcregeren2.AsFloat  - _dbLancamento.Lacvalgeren2.AsFloat;
            _dbPlanilha.Plntotcregeren1.AsFloat  := _dbPlanilha.Plntotcregeren1.AsFloat  - _dbLancamento.Lacvalgeren1.AsFloat;
            _dbPlanilha.Plntotcreger.AsFloat     := _dbPlanilha.Plntotcreger.AsFloat     - _dbLancamento.Lacvalgerencial.AsFloat;
            _dbPlanilha.Plntotcre.AsFloat        := _dbPlanilha.Plntotcre.AsFloat        - _dbLancamento.Lacvalor.AsFloat;
            if (not bUsaStoredProc) and (sEfetivado = 'S') then
            begin
               if not CtrlContaContabil.BuscaMascaraConta(_dbLancamento.Plano.AsFloat) then begin
                  sMens:= CtrlContaContabil.MessageInfo;
                  Raise Exception.Create(sMens);
               end;
               if not AtuSaldoContas(IdEmpresa, _dbLancamento.UnidNegoc.AsFloat,
                                     iUsuario, _dbLancamento.idPlanoPrev.AsFloat,
                                     _dbLancamento.idPatro.AsFloat,
                                     _dbLancamento.Plano.AsFloat,
                                     CtrlPeriodo.Exercicio,CtrlPeriodo.Periodo,
                                     _dbLancamento.CodSubConta.AsInteger,
                                     _dbLancamento.CodCentroCusto.AsString,
                                     _dbLancamento.PlaConta.AsString,'C','A',
                                     _dbLancamento.Lacvalor.AsFloat*-1,0,
                                     _dbLancamento.Lacvaloficial.AsFloat*-1,
                                     _dbLancamento.Lacvalgerencial.AsFloat*-1,
                                     _dbLancamento.Lacvalgeren1.AsFloat*-1,
                                     _dbLancamento.Lacvalgeren2.AsFloat*-1,
                                     _dbLancamento.Lacvalhist.AsFloat*-1, bUsaPlanoPatro) then begin
                  sMens := MessageInfo;
                  Raise Exception.Create(sMens);
               end;
               if not AtuSaldoSintetica(IdEmpresa, _dbLancamento.UnidNegoc.AsFloat,
                                     iUsuario, _dbLancamento.idPlanoPrev.AsFloat,
                                     _dbLancamento.idPatro.AsFloat,
                                     _dbLancamento.Plano.AsFloat,
                                     CtrlPeriodo.Exercicio,CtrlPeriodo.Periodo,
                                     _dbLancamento.CodSubConta.AsInteger,
                                     _dbLancamento.CodCentroCusto.AsString,
                                     _dbLancamento.PlaConta.AsString,'C', CtrlContaContabil.MascaraConta,
                                     _dbLancamento.Lacvalor.AsFloat*-1,0,
                                     _dbLancamento.Lacvaloficial.AsFloat*-1,
                                     _dbLancamento.Lacvalgerencial.AsFloat*-1,
                                     _dbLancamento.Lacvalgeren1.AsFloat*-1,
                                     _dbLancamento.Lacvalgeren2.AsFloat*-1,
                                     _dbLancamento.Lacvalhist.AsFloat*-1, bUsaPlanoPatro) then begin
                  sMens := MessageInfo;
                  Raise Exception.Create(sMens);
               end;
            end;

            if not _dbLancamento.Delete then begin
               sMens := _dbLancamento.MessageInfo;
               Raise Exception.Create(sMens);
            end;
         end;

         if iNumLan = _dbPlanilha.PlnNumLan.AsInteger then
            _dbPlanilha.PlnNumLan.AsFloat := _dbPlanilha.PlnNumLan.AsFloat -1;
         if not _dbPlanilha.UpDate then
         begin
            sMens := _dbPlanilha.MessageInfo;
            Raise Exception.Create(sMens);
         end;

         if trim(sSegregaControle) <> '' then  //andré tavares - 20/03/2007 - tive que colocar este if aqui, pois está dando erro de sql quando a variável sSegregaControle é nula
           //Apaga a memória de cálculo de segregação do lançamento excluído
           if not ExecSQL( ' delete from MEMOCALCSEGREGA ' +
                           ' where IDSEGREGACONTR in ( ' + sSegregaControle + ' ) ' ) then
           begin
              sMens := MessageInfo;
              Raise Exception.Create(sMens);
           end;

      end;

      FRetornoPlnCodigo := iPlnCodigo;
      cdsLancamento.Free;
      _CdsLocal.Free;
   Except
       On E : Exception do
       begin
          cdsLancamento.Free;
          _CdsLocal.Free;
          MessageInfo := E.Message;
          Result      := False;
       end;
   end;

end;


function TCtrlImobLancamento.InsereLancaContab(cTipoLanc : Char; IdEmpresa, iModuloOrigem,
                      liUsuario, liCodPlano, liUnidNegoc, liSubContaDeb,
                      liSubContaCre, iPlanoPrev, iPatro, liPlnCodigo: Double; iNumLan : LongInt;
                      sDataLanc, sNumDoc, sHist1, sHist2,  sHist3,  sHist4,
                      sHist5, sTipoOper, cCCustd, cContad, cCCustc, cContac, sCodHist : string;
                      rValLanc : double; bJunta, bUsaPlanoPatro : Boolean;
                      iIdSegregaCriter: integer; dDataSegregaCriter: TDateTime;
                      iIdSegregaContr: integer;
                      iIdImovel : integer;
                      const bSegregaOrigem: boolean;
                      const iCodDocumento: integer;
                      const bForcaGravacaoMemoCalc : boolean;
                      const bValorTotLacamento : Double;
                      iIDContrato : Integer ) : Boolean;

type  TTipoSegregacao    = (tsRateio, tsOrigem, tsSegregacao, tsFluxoPrimario);
{ tsRateio        = Lançamentos no plano de operações comum em conta contábil que tenha segregação de recursos.
                    Neste caso: Se PARAMINTEGRA.SEGREGAFINAN
                                  rateio na origem
                                Senão
                                  rateio ao fim do mês
  tsOrigem        = Lançamentos no plano "carimbado"        em conta contábil que tenha segregação de recursos.
                    Neste caso sempre o rateio deve ser feito na origem
  tsSegregação    = Lançamentos na própria conta contábil para segregação
                    Não deve aceitar critérios para rateio.
                    O lançamento deve ser acatado como veio.
  tsFluxoPrimario = Lançamentos no plano "carimbado"        em conta contábil que não segregação de recursos.
}
var rAux : Double;
    sConta, sEfetivado, sMens, sAux : String;
    bIncluiPlanilha, bIncluiLanc : Boolean;
    bGravaMemoriaDeCalculo : boolean;
    bUsaStoredProc: boolean;

   procedure RetPlanoSegregar(const sConta: string);
   var iPlanoSegregar: integer;
   begin
      // se o iPlanoSegregar vier 0, o programa da conta não foi parametrizado, não trocar o plano a segregar, usar o anterior
      iPlanoSegregar := CtrlImobSegregacao.RetornaPlanoSegregar (trunc(liCodPlano), sConta, trunc(iPlanoPrev));
      if iPlanoSegregar = -1 then begin
        raise Exception.Create (CtrlImobSegregacao.MessageInfo);
      end else if iPlanoSegregar > 0 then begin
        FPlanoSegregar := iPlanoSegregar;
      end;
   end;

   // **************************************************************************
   // este função retorna o tipo de segregação que o lançamento irá efetuar
   // **************************************************************************
   function VerificaContaxSegregacao(const sContaLancada: string; var sContaSegrega: string): TTipoSegregacao;
   begin
      RetPlanoSegregar(sContaLancada);  // Verifica se existe inversão de programa ou qual o plano a segregar uma conta

      sContaSegrega := '';
      // verificar se a conta contábil é a conta para segregação
      if CtrlImobSegregacao.ContaContabilDeSegregacao(sContaLancada) then begin
         if iIdSegregaCriter <> -1 then
            raise exception.Create ('A conta contábil "Segregação de Recursos" não permite critério para segregação. ')
         else
           Result := tsSegregacao;

      end else begin
         sContaSegrega := CtrlImobSegregacao.ContaContabilSegregacao (sContaLancada);
         // este grupo não possui conta para segregação de recursos - fluxo primário
         if sContaSegrega = '' then begin
            // verificar se está tentando fazer o lançamento no plano O.C.
            if (CtrlImobSegregacao.PlanoPrevSegrega = iPlanoPrev) or (CtrlImobSegregacao.PatroSegrega = iPatro) or
               (CtrlImobSegregacao.PlanoPrevAdm   = iPlanoPrev) then begin
               raise exception.Create ('A conta contábil: ' + sContaLancada + ' não possui Segregação de Recursos. ' + #13 +
                                       'Nestas contas não é permitido o lançamento no plano de Operações Comum, na Patrocinadora Comum ou no Plano Administrativo!')
            end else
                Result := tsFluxoPrimario;
         end else begin
           // conta contábil com o grupo para segreação parametrizado
            // verificar se está tentando fazer o lançamento no plano O.C.
            if (CtrlImobSegregacao.PlanoPrevSegrega = iPlanoPrev) or (CtrlImobSegregacao.PatroSegrega = iPatro) or
               (CtrlImobSegregacao.PlanoPrevAdm   = iPlanoPrev) then
               Result := tsRateio
            else begin
               // Alex 31/01/2006
               // Verifiquei que se tivermos segregação na origem para dois documentos
               // diferentes, e os documentos tiverem critérios distintos para segregação.
               // O lançamento de baixa não pode passar o critério para segregação, senão,
               // o lançamento contábil do banco não será juntado.
               // O critério neste momento deve ser eliminado
               Result := tsOrigem;
            end;
         end;
      end;
   end;

    //Este método faz a inserção efetiva na tabela de lançamentos ou na
    //de memória de cálculo da segregação, de acordo com a propriedade DbGravaLanc
    procedure GravaDadosLancamento;
    begin
      if bIncluiLanc then
      begin
        if iIdSegregaCriter = -1 then begin
          DbGravaLanc.Idsegregacriter.Clear;
          DbGravaLanc.Datasegregacriter.Clear;
        end else begin
          DbGravaLanc.Idsegregacriter.AsInteger := iIdSegregaCriter;

          if (trunc(dDataSegregaCriter) <= 0) then
            DbGravaLanc.Datasegregacriter.AsDateTime := strToDate(sDataLanc)
          else //senão continua como estava antes
            DbGravaLanc.Datasegregacriter.AsDateTime := dDataSegregaCriter;
        end;

        if _iIdSegregaContr = -1 then
          DbGravaLanc.IdSegregaContr.Clear
        else
          DbGravaLanc.IdSegregaContr.AsInteger := _iIdSegregaContr;

        if iCodDocumento = -1 then
           DbGravaLanc.CodDocumento.Clear
        else
           DbGravaLanc.CodDocumento.AsFloat := iCodDocumento;

        // Ricardo A. SOL 130350/941 KTN 745297
        DbGravaLanc.OrdLancaRateado.AsInteger := -1;
        // FIM Ricardo A. SOL 130350/941 KTN 745297

        DbGravaLanc.Plncodigo.AsFloat := _dbPlanilha.Plncodigo.AsFloat;
        DbGravaLanc.Lacnumlan.AsFloat := FNumLancamento;
        DbGravaLanc.Lactipo.AsString  := cTipoLanc;
        DbGravaLanc.Unidnegoc.AsFloat := liUnidNegoc;
        DbGravaLanc.Idpessoa.AsFloat  := idEmpresa;
        DbGravaLanc.Tipcodigo.AsString:= sTipoOper;
        DbGravaLanc.Plano.AsFloat     := liCodPlano;
        DbGravaLanc.Lacvalor.AsFloat  := RoundCM(rValLanc);
        DbGravaLanc.Lacnumdoc.AsString:= sNumDoc;
        DbGravaLanc.Lachist1.AsString := sHist1;
        DbGravaLanc.Lachist2.AsString := sHist2;
        DbGravaLanc.Lachist3.AsString := sHist3;
        DbGravaLanc.Lachist4.AsString := sHist4;
        DbGravaLanc.Lachist5.AsString := sHist5;
        DbGravaLanc.Lacatoutmoeda.AsString    := 'N';
        DbGravaLanc.Idusuarioinclusao.AsFloat := liUsuario;
        DbGravaLanc.Idplanoprev.AsFloat       := iPlanoPrev;
        DbGravaLanc.Idpatro.AsFloat           := iPatro;
        DbGravaLanc.Idmodulo.AsFloat          := iModuloOrigem;
        DbGravaLanc.Hitcodhist.AsString       := sCodHist;
        DbGravaLanc.Idelemdemonstrat.AsFloat  := FlcElemento;
        if cContaD <> '' then begin
           DbGravaLanc.Lacdebcre.AsString         := 'D';
           DbGravaLanc.Placonta.AsString          := cContaD;
           DbGravaLanc.Codcentrocusto.AsString    := cCCustD;
           DbGravaLanc.Codsubconta.AsFloat        := liSubContaDeb;
           DbGravaLanc.Lacvaloficial.AsFloat      := RoundCM(FlcValOfiDeb);
           DbGravaLanc.Lacvalhist.AsFloat         := RoundCM(FlcValHisDeb);
           DbGravaLanc.Lacvalgeren2.AsFloat       := RoundCM(FlcValGe2Deb);
           DbGravaLanc.Lacvalgeren1.AsFloat       := RoundCM(FlcValGe1Deb);
           DbGravaLanc.Lacvalgerencial.AsFloat    := RoundCM(FlcValGerDeb);
           DbGravaLanc.Lactipconvoficial.AsString := FlcTipConvOfiDeb;
           DbGravaLanc.Lactipconvger.AsString     := FlcTipConvGerDeb;
           DbGravaLanc.Lactipconvgeren1.AsString  := FlcTipConvGe1Deb;
           DbGravaLanc.Lactipconvgeren2.AsString  := FlcTipConvGe2Deb;
           DbGravaLanc.Lacorigemaplic.AsString    := FlcOriAplDeb;
           if cCCustD <> '' then
              DbGravaLanc.Idempresa.AsFloat    := idEmpresa;
           if not DbGravaLanc.Insert then begin
              sMens := DbGravaLanc.MessageInfo;
              Raise Exception.Create(sMens);
           end;
        end;
        if cContaC <> '' then begin
           DbGravaLanc.Lacdebcre.AsString         := 'C';
           DbGravaLanc.Placonta.AsString          := cContaC;
           DbGravaLanc.Codcentrocusto.AsString    := cCCustC;
           DbGravaLanc.Codsubconta.AsFloat        := liSubContaCre;
           DbGravaLanc.Lacvaloficial.AsFloat      := RoundCM(FlcValOfiCre);
           DbGravaLanc.Lacvalhist.AsFloat         := RoundCM(FlcValHisCre);
           DbGravaLanc.Lacvalgeren2.AsFloat       := RoundCM(FlcValGe2Cre);
           DbGravaLanc.Lacvalgeren1.AsFloat       := RoundCM(FlcValGe1Cre);
           DbGravaLanc.Lacvalgerencial.AsFloat    := RoundCM(FlcValGerCre);
           DbGravaLanc.Lactipconvoficial.AsString := FlcTipConvOfiCre;
           DbGravaLanc.Lactipconvger.AsString     := FlcTipConvGerCre;
           DbGravaLanc.Lactipconvgeren1.AsString  := FlcTipConvGe1Cre;
           DbGravaLanc.Lactipconvgeren2.AsString  := FlcTipConvGe2Cre;
           DbGravaLanc.Lacorigemaplic.AsString    := FlcOriAplCre;
           if cCCustC <> '' then
              DbGravaLanc.Idempresa.AsFloat    := idEmpresa;
           if not DbGravaLanc.Insert then begin
              sMens := DbGravaLanc.MessageInfo;
              Raise Exception.Create(sMens);
           end;
        end;
      end
      else
      begin
        if cContaD <> '' then begin
           DbGravaLanc.Plncodigo.AsFloat := _dbPlanilha.Plncodigo.AsFloat;
           DbGravaLanc.Lacdebcre.AsString:= 'D';
           DbGravaLanc.Lacnumlan.AsFloat := FNumLancamento;
           DbGravaLanc.LoadFromDb;
           DbGravaLanc.Lacvalor.AsFloat        := DbGravaLanc.Lacvalor.AsFloat;        //+ RoundCM(rValLanc);
           DbGravaLanc.Lacvaloficial.AsFloat   := DbGravaLanc.Lacvaloficial.AsFloat   + RoundCM(FlcValOfiDeb);
           DbGravaLanc.Lacvalhist.AsFloat      := DbGravaLanc.Lacvalhist.AsFloat      + RoundCM(FlcValHisDeb);
           DbGravaLanc.Lacvalgeren2.AsFloat    := DbGravaLanc.Lacvalgeren2.AsFloat    + RoundCM(FlcValGe2Deb);
           DbGravaLanc.Lacvalgeren1.AsFloat    := DbGravaLanc.Lacvalgeren1.AsFloat    + RoundCM(FlcValGe1Deb);
           DbGravaLanc.Lacvalgerencial.AsFloat := DbGravaLanc.Lacvalgerencial.AsFloat + RoundCM(FlcValGerDeb);
           if not DbGravaLanc.UpDate then begin
              sMens := DbGravaLanc.MessageInfo;
              Raise Exception.Create(sMens);
           end;
        end;
        if cContaC <> '' then begin
           DbGravaLanc.Plncodigo.AsFloat := _dbPlanilha.Plncodigo.AsFloat;
           DbGravaLanc.Lacdebcre.AsString:= 'C';
           DbGravaLanc.Lacnumlan.AsFloat := FNumLancamento;
           DbGravaLanc.LoadFromDb;
           DbGravaLanc.Lacvalor.AsFloat        := DbGravaLanc.Lacvalor.AsFloat;       //+ RoundCM(rValLanc);
           DbGravaLanc.Lacvaloficial.AsFloat   := DbGravaLanc.Lacvaloficial.AsFloat  + RoundCM(FlcValOfiCre);
           DbGravaLanc.Lacvalhist.AsFloat      := DbGravaLanc.Lacvalhist.AsFloat     + RoundCM(FlcValHisCre);
           DbGravaLanc.Lacvalgeren2.AsFloat    := DbGravaLanc.Lacvalgeren2.AsFloat   + RoundCM(FlcValGe2Cre);
           DbGravaLanc.Lacvalgeren1.AsFloat    := DbGravaLanc.Lacvalgeren1.AsFloat   + RoundCM(FlcValGe1Cre);
           DbGravaLanc.Lacvalgerencial.AsFloat := DbGravaLanc.Lacvalgerencial.AsFloat+ RoundCM(FlcValGerCre);
           if not DbGravaLanc.UpDate then begin
              sMens := DbGravaLanc.MessageInfo;
              Raise Exception.Create(sMens);
           end;
        end;
      end;

    end;



   // **************************************************************************
   // este procedimento insere o lançamento contábil efetivamente
   // **************************************************************************
   procedure InsereLancamento; // Alex 11/04/2007 25052( bLancSegregacao : boolean );
   var
    bSegregaOrigem :  Boolean;
   begin
      // verificar se o identificador de controle que une os lançamentos de segregação é -1,
      // se for chamar o seequence para atribuí-lo


      if iIdSegregaContr = -1 then iIdSegregaContr := CtrlImobSegregacao.GetSegregaCtrl;


      //Define a tabela de lançamentos como a tabela destino de gravação dos lançamentos
      DbGravaLanc.TableName := 'LANCAMENTO';

      if _iIdSegregaContr = -1 then
      begin
        _iIdSegregaContr := CtrlImobSegregacao.GetSegregaCtrl;
        bGravaMemoriaDeCalculo :=
            //Se o plano é comum e o flag de memória de cálculo de segregação está ligado...
            ( ( ( iPlanoPrev = CtrlImobSegregacao.PlanoPrevSegrega ) {and ( CtrlImobSegregacao.SegregaOrComum )} ) and CtrlImobSegregacao.FlgSegOrComFin )
            //Se o plano é administrativo e o flag de memória de cálculo de segregação está ligado...
         or ( ( ( iPlanoPrev = CtrlImobSegregacao.PlanoPrevAdm ) and ( CtrlImobSegregacao.SegregaOrAdm ) ) and CtrlImobSegregacao.FlgSegOrAdmFin ) ;
      end
      else
      begin
        if bGravaMemoriaDeCalculo then
          DbGravaLanc.TableName := 'MEMOCALCSEGREGA';
      end;


      //Se o flag estiver ligado, ignora as configurações e salva obrigatoriamente na MEMOCALCSEGREGA
      if bForcaGravacaoMemoCalc then
        DbGravaLanc.TableName := 'MEMOCALCSEGREGA';


      if not InsereLancaContab(cTipoLanc, IdEmpresa, iModuloOrigem,
                 liUsuario, liCodPlano, liUnidNegoc, liSubContaDeb,
                 liSubContaCre, iPlanoPrev, iPatro, liPlnCodigo,
                 0,
                 sDataLanc, sNumDoc, sHist1, sHist2,  sHist3,  sHist4,
                 sHist5, sTipoOper, cCCustd, cContad, cCCustc, cContac, sCodHist,
                 rValLanc, bJunta, bUsaPlanoPatro,
                 iIdSegregaCriter, dDataSegregaCriter,
                 _iIdSegregaContr, -1, false,
                 iCodDocumento) then
         raise exception.Create (MessageInfo)
      else
         // neste procedimento vários lançamentos de segregação serão feitos,
         // gravar o liPlnCodigo para utilizar a mesma planilha para os próximos
         // lançamentos
         liPlnCodigo := FRetornoPlnCodigo;
   end;

   //Indica se o plano passado como parâmetro deve ser segregado na origem
   function SegregaOrigem( _PlanoPrev : Double ) : boolean;
   begin
     // Testa o plano comum
     Result := ( ( _PlanoPrev = CtrlImobSegregacao.PlanoPrevSegrega )); //and ( CtrlImobSegregacao.SegregaOrComum ) );

     //Testa o plano administrativo
     if ( not Result ) and ( CtrlImobSegregacao.PlanoPrevAdm > 0 ) then
       Result := ( ( _PlanoPrev = CtrlImobSegregacao.PlanoPrevAdm ) and ( CtrlImobSegregacao.SegregaOrAdm ) );
   end;


   // este procedimento intercepta os lançamentos contábeis para segregá-los na origem
   function SegregaLancamento: boolean;
   // se retornar true a segregação foi feita por este procedimento, é para abortar
   // o InsereLancaContab logo após a chamada dese método
   // senão o lançamento não foi interceptado devendo continuar o método InsereLancaContab
   var
       TipoSegregacaoD, TipoSegregacaoC: TTipoSegregacao;
       sContaSegregaD, sContaSegregaC, sContaAux: string;
       sCentroCustoAux: string;
       iPlanPrevAux, iPatroAux: Double;
   begin
      Result := false;
      sContaSegregaD := '';
      sContaSegregaC := '';

      //Define a tabela de lançamentos como a tabela destino de gravação dos lançamentos
      DbGravaLanc.TableName := 'LANCAMENTO';

      //Se o flag estiver ligado, ignora as configurações e salva obrigatoriamente na MEMOCALCSEGREGA
      if bForcaGravacaoMemoCalc then
        DbGravaLanc.TableName := 'MEMOCALCSEGREGA';

      case cTipoLanc of
         '0':
            begin
               TipoSegregacaoD := VerificaContaxSegregacao(cContad, sContaSegregaD);
               case TipoSegregacaoD of
                 tsSegregacao: exit;    // o lançamento é como o passado, nada a fazer
                 tsFluxoPrimario: exit; // o lançamento é como o passado, nada a fazer

                 tsRateio:
                    // o lançamento é para ser segregado
                    begin
                       // Verificar se a fundação escolheu segregação na origem
                       // se a segregação for no fim do mês nada a fazer
                       if not SegregaOrigem( iPlanoPrev ) then exit;

                       if iIdSegregaCriter = -1 then exit; // a segregação não foi informada...

                       if not CtrlImobSegregacao.RateiaValor (rValLanc, iIdSegregaCriter, StrtoDate (sDataLanc)) then begin
                         sMens := CtrlImobSegregacao.MessageInfo;
                         raise Exception.Create (sMens);
                       end else begin

                         // Fazer o Lançamento na conta contábil com o plano de O.C., já foi passado na origem
                         InsereLancamento;

                         // zerar o plano O.C. na conta de segregação de recursos
                         cTipoLanc := '1';
                         cContad := '';
                         cContac := sContaSegregaD;
                         cCCustc := cCCustd;  // levar o centro de custo para os lançamentos da segregação
                         InsereLancamento;

                         // acertar a conta contábil para os lançamentos segregados
                         cTipoLanc := '0';
                         cContac    := '';
                         cContad    := sContaSegregaD;

                         // fazer a segreação de recursos na origem
                         CtrlImobSegregacao.CdsRateio.First;
                         while not CtrlImobSegregacao.CdsRateio.Eof do begin

                           // Lançar nos plano encontrados pelo rateio
                           iPlanoPrev := CtrlImobSegregacao.CdsRateio.FieldByName('IDPLANOPREV').AsInteger;
                           iPatro     := CtrlImobSegregacao.CdsRateio.FieldByName('IDPATRO').AsInteger;
                           rValLanc   := CtrlImobSegregacao.CdsRateio.FieldByName('VALOR').AsFloat;
                           InsereLancamento;

                           CtrlImobSegregacao.CdsRateio.Next;
                         end;
                         Result := true;
                       end;
                     end;

                 tsOrigem:
                    // aqui é que deveríamos armazenar os lançamentos com carimbo
                    // nas contas que iremos perder
                    begin
                       // Fazer o Lançamento na conta contábil com o plano de O.C.
                       iPlanPrevAux := iPlanoPrev;
                       iPatroAux    := iPatro;
                       iPlanoPrev   := FPlanoSegregar; // este plano é obtido do método retPlanoSegregar
                       iPatro       := CtrlImobSegregacao.PatroSegrega;
                       InsereLancamento;

                       // zerar o plano O.C. na conta de segregação de recursos
                       cTipoLanc := '1';
                       cContad := '';
                       cContac := sContaSegregaD;
                       cCCustc := cCCustd;  // levar o centro de custo para os lançamentos da segregação
                       InsereLancamento;

                       // Lançar no plano "carimbado" na conta de segregação de recursos
                       cTipoLanc := '0';
                       iPlanoPrev := iPlanPrevAux;
                       iPatro     := iPatroAux;
                       cContac    := '';
                       cContad    := sContaSegregaD;
                       InsereLancamento;

                       Result := true;
                    end;
               end;
            end;
         '1':
            begin
               TipoSegregacaoC := VerificaContaxSegregacao(cContac, sContaSegregaC);
               case TipoSegregacaoC of
                 tsSegregacao: exit;    // o lançamento é como o passado, nada a fazer
                 tsFluxoPrimario: exit; // o lançamento é como o passado, nada a fazer

                 tsRateio:
                    // o lançamento é para ser segregado
                    begin
                       // Verificar se a fundação escolheu segregação na origem
                       // se a segregação for no fim do mês nada a fazer
                       if not SegregaOrigem( iPlanoPrev ) then exit;

                       if iIdSegregaCriter = -1 then exit; // a segregação não foi informada...

                       if not CtrlImobSegregacao.RateiaValor (rValLanc, iIdSegregaCriter, StrtoDate (sDataLanc)) then begin
                         sMens := CtrlImobSegregacao.MessageInfo;
                         raise Exception.Create (sMens);
                       end else begin

                         // Fazer o Lançamento na conta contábil com o plano de O.C., já foi passado na origem
                         InsereLancamento;

                         // zerar o plano O.C. na conta de segregação de recursos
                         cTipoLanc := '0';
                         cContac := '';
                         cContad := sContaSegregaC;
                         cCCustd := cCCustc;  // levar o centro de custo para os lançamentos da segregação
                         InsereLancamento;

                         // acertar a conta contábil para os lançamentos segregados
                         cTipoLanc := '1';
                         cContad    := '';
                         cContac    := sContaSegregaC;

                         // fazer a segreação de recursos na origem
                         CtrlImobSegregacao.CdsRateio.First;
                         while not CtrlImobSegregacao.CdsRateio.Eof do begin

                           // Lançar nos plano encontrados pelo rateio
                           iPlanoPrev := CtrlImobSegregacao.CdsRateio.FieldByName('IDPLANOPREV').AsInteger;
                           iPatro     := CtrlImobSegregacao.CdsRateio.FieldByName('IDPATRO').AsInteger;
                           rValLanc   := CtrlImobSegregacao.CdsRateio.FieldByName('VALOR').AsFloat;
                           InsereLancamento;

                           CtrlImobSegregacao.CdsRateio.Next;
                         end;
                         Result := true;
                       end;
                     end;

                 tsOrigem:
                    // aqui é que deveríamos armazenar os lançamentos com carimbo
                    // nas contas que iremos perder
                    begin
                       // Fazer o Lançamento na conta contábil com o plano de O.C.
                       iPlanPrevAux := iPlanoPrev;
                       iPatroAux    := iPatro;
                       iPlanoPrev   := FPlanoSegregar; // este plano é obtido do método retPlanoSegregar
                       iPatro       := CtrlImobSegregacao.PatroSegrega;
                       InsereLancamento;

                       // zerar o plano O.C. na conta de segregação de recursos
                       cTipoLanc := '0';
                       cContac := '';
                       cContad := sContaSegregaC;
                       cCCustd := cCCustc;  // levar o centro de custo para os lançamentos da segregação
                       InsereLancamento;

                       // Lançar no plano "carimbado" na conta de segregação de recursos
                       cTipoLanc := '1';
                       iPlanoPrev := iPlanPrevAux;
                       iPatro     := iPatroAux;
                       cContad    := '';
                       cContac    := sContaSegregaC;
                       InsereLancamento; // Alex 11/04/2007 25052( True );

                       Result := true;
                    end;
               end;
            end;
         '2':
            begin
               TipoSegregacaoD := VerificaContaxSegregacao(cContad, sContaSegregaD);
               TipoSegregacaoC := VerificaContaxSegregacao(cContac, sContaSegregaC);

               if (TipoSegregacaoD = tsSegregacao) and (TipoSegregacaoC = tsSegregacao) then
                  // este é um lançamento normal de segregação, nada a fazer
                  exit;

               //***************************************************************
               // lançamento com critério para segregação
               //***************************************************************
               if (TipoSegregacaoD = tsRateio) and (TipoSegregacaoC = tsRateio) then begin

                 // Verificar se a fundação escolheu segregação na origem
                 // se a segregação for no fim do mês nada a fazer
                 if not SegregaOrigem( iPlanoPrev ) then exit;

                 if iIdSegregaCriter = -1 then exit; // a segregação não foi informada...

                 //Cássio - SOL 91381 KINTANA 394180
                 //Faz a chamada para a segregação do valor na origem, dividindo o valor a ser lançado
                 //entre os planos definidos no Cadastro do Imóvel.
                 //if not CtrlImobSegregacao.RateiaValor (rValLanc, iIdSegregaCriter, StrtoDate (sDataLanc)) then begin
                 if not CtrlImobSegregacao.RateiaValorOrigem(rValLanc, iIdSegregaCriter, StrToDate(sDataLanc), iIdImovel, iIDContrato) then
                 begin
                   sMens := CtrlImobSegregacao.MessageInfo;
                   raise Exception.Create (sMens);
                 end
                 else
                 begin
                  //Cássio - SOL 91381 KINTANA 394180
                  //Esta flag permite que somente seja inserido um único lançamento do documento
                  //e uma linha do documento contabilizado para o plano OPERAÇÕES COMUNS. No fim é
                  //flag é atribuída para FALSE, impedindo que, se houver outro imóvel segregando este
                  //lançamento, este bloco de código não seja executado novamente.
                   if bOperComum then
                   begin
                     rValLanc := bValorTotLacamento;
                     // Fazer o Lançamento na conta contábil com o plano de O.C., já foi passado na origem
                     InsereLancamento;

                     // zerar o plano O.C. na conta de segregação de recursos
                     cContad := sContaSegregaC;
                     cContac := sContaSegregaD;
                     sCentroCustoAux := cCCustc;
                     cCCustc := cCCustd;  // levar o centro de custo para os lançamentos da segregação

                      // acertar a conta contábil para os lançamentos segregados
                     cContac    := sContaSegregaC;
                     cContad    := sContaSegregaD;
                     cCCustd    := cCCustc;
                     cCCustc    := sCentroCustoAux;
                     InsereLancamento;             

                     bOperComum := False;
                   end;

                   // fazer a segreação de recursos na origem
                   CtrlImobSegregacao.CdsRateio.First;
                   while not CtrlImobSegregacao.CdsRateio.Eof do begin

                     // Lançar nos plano encontrados pelo rateio
                     iPlanoPrev := CtrlImobSegregacao.CdsRateio.FieldByName('IDPLANOPREV').AsInteger;
                     iPatro     := CtrlImobSegregacao.CdsRateio.FieldByName('IDPATRO').AsInteger;
                     rValLanc   := CtrlImobSegregacao.CdsRateio.FieldByName('VALOR').AsFloat;
                     InsereLancamento;

                     CtrlImobSegregacao.CdsRateio.Next;
                   end;
                   Result := true;
                 end;
               end;


               //***************************************************************
               // segregação na origem
               //***************************************************************
               if (TipoSegregacaoD = tsOrigem) and (TipoSegregacaoC = tsOrigem) then begin
                  // lançamento a ser segregado na origem

                  // primeiro lançamento trocando o plano por OC na própria conta contábil
                  iPlanPrevAux := iPlanoPrev;
                  iPatroAux    := iPatro;
                  iPlanoPrev   := FPlanoSegregar; // este plano é obtido do método retPlanoSegregar
                  iPatro       := CtrlImobSegregacao.PatroSegrega;
                  InsereLancamento;

                  // zerar o plano O.C.
                  cContac   := sContaSegregaD;
                  cContad   := sContaSegregaC;
                  // levar o centro de custo para os lançamentos de segregação
                  sCentroCustoAux := cCCustd;
                  cCCustd := cCCustc;
                  cCCustc := sCentroCustoAux;
                  InsereLancamento;

                  // lançar no plano do "carimbo"
                  cContac   := sContaSegregaC;
                  cContad   := sContaSegregaD;
                  sCentroCustoAux := cCCustd;
                  cCCustd := cCCustc;
                  cCCustc := sCentroCustoAux;
                  // levar o centro de custo para os lançamentos de segregação

                  iPatro     := iPatroAux;
                  iPlanoPrev := iPlanPrevAux;
                  InsereLancamento;
                  result := true;
               end;

               if ((TipoSegregacaoD = tsSegregacao) or (TipoSegregacaoC = tsSegregacao)) and
                  ((TipoSegregacaoD <> tsSegregacao) or (TipoSegregacaoC <> tsSegregacao)) then
                  // lançamentos em conta de segregação devem ter como contra-partida contas de segregação
                  raise exception.Create ('Lançamentos em conta para segregação recursos devem ter como contra-partida, contas também para segregação de recursos.' +#13 +
                                          'Débito:  ' + cContad + #13 +
                                          'Crédito: ' + cContac);

               //***************************************************************
               // lançamento contra fluxo primário
               //***************************************************************
               // verificar lançamentos em fluxo primário, contra fluxo secundário, ex:
               // Déb  Cta: 1.2.1 Plano: BD
               // Créd Cta: 1.1.1 Plano: BD
               // Os seguintes lançamentos serão gerados, ex:

               // Déb  Cta: 1.2.1 Plano: BD
               // Créd Cta: 1.1.9 Plano: BD

               // Déb  Cta: 1.9.1 Plano: OC
               // Créd Cta: 1.1.1 Plano: OC
               if (TipoSegregacaoD = tsFluxoPrimario) then begin
                  // se a outra perna do lançamento também for fluxo primário, nada a fazer
                  if (TipoSegregacaoC = tsFluxoPrimario) then exit;

                  // fazer o lançamento com o "carimbo"
                  sContaAux := cContac;
                  cContac   := sContaSegregaC;
                  InsereLancamento; // Alex 11/04/2007 25052( False );

                  // fazer o lançamento com o plano O.C.
                  cContad    := sContaSegregaC;
                  cContac    := sContaAux;
                  iPlanoPrev := CtrlImobSegregacao.PlanoPrevSegrega;
                  iPatro     := CtrlImobSegregacao.PatroSegrega;
                  cCCustd := cCCustc;
                  InsereLancamento;

                  result := true;

               end else if (TipoSegregacaoC = tsFluxoPrimario) then begin

                  // fazer o lançamento com o "carimbo"
                  sContaAux := cContad;
                  cContad   := sContaSegregaD;
                  InsereLancamento;
                  // fazer o lançamento com o plano O.C.
                  cContac    := sContaSegregaD;
                  cContad    := sContaAux;
                  iPlanoPrev := CtrlImobSegregacao.PlanoPrevSegrega;
                  iPatro     := CtrlImobSegregacao.PatroSegrega;
                  cCCustc := cCCustd;
                  InsereLancamento;

                  result := true;

               end;

            end;
      else
         raise Exception.Create ('Tipo de Lançamento Inválido!');
      end;
   end;

   function excluiContaEstatiscaMov(const sPlaconta: string): boolean;
   var splacontaAux: string;
   begin
     result := true;
     if (trim(sPlaconta) <> '') then
     begin
       splacontaAux := sPlaconta + '                  ';
       //_cds.data := getDataPacket(' SELECT FLGESTATCOMLANC, PLAGRUPO FROM PLANOCONTA WHERE PLACONTA = '+ quotedStr( copy(splacontaAux, 1, 18) ) +   //MIGRACAO-ORACLE
       _cds.data := getDataPacket(' SELECT FLGESTATCOMLANC, PLAGRUPO FROM PLANOCONTA WHERE PLACONTA = '+ quotedStr(trim(splacontaAux)) +   //MIGRACAO-ORACLE
                                  ' AND PLANO = '+ floatToStr(liCodPlano) );
       if ( _cds.FieldByName('PLAGRUPO').asString = 'E' ) and ( _cds.FieldByName('FLGESTATCOMLANC').asString <> 'S' ) then
       begin
         result := false;
         messageInfo := 'A conta '+ sPlaconta + ' é do tipo "Estatística Sem Movimento" e não é permitido lançamentos neste tipo de conta.';
         raise exception.Create(messageInfo);
       end;
     end;
   end;

   function verificaLancPlanilhaEstat(const iplncodigo: longint): Boolean;
   begin
     _cds.data := getDataPacket(' SELECT DISTINCT P.PLAGRUPO FROM LANCAMENTO L, PLANOCONTA P '+
                                ' WHERE L.PLNCODIGO = '+ intToStr(iplncodigo) +' AND '+
                                ' L.PLACONTA = P.PLACONTA AND '+
                                ' P.PLANO = L.PLANO ');

     result := ( (_cds.fieldByName('PLAGRUPO').asString = 'E') and (_cds.recordCount = 1) );
   end;

   function eContaEstatistica(const sPlaconta: string): Boolean;
   var splacontaAux: string;
   begin
     result := false;
     if (trim(sPlaconta) <> '') then
     begin
       splacontaAux := sPlaconta + '                  ';
       //_cds.data := getDataPacket(' SELECT FLGESTATCOMLANC, PLAGRUPO FROM PLANOCONTA WHERE PLACONTA = '+ quotedStr( copy(splacontaAux, 1, 18) ) +  //MIGRACAO-ORACLE
       _cds.data := getDataPacket(' SELECT FLGESTATCOMLANC, PLAGRUPO FROM PLANOCONTA WHERE PLACONTA = '+quotedStr(trim(splacontaAux)) +  //MIGRACAO-ORACLE
                                  ' AND PLANO = '+ floatToStr(liCodPlano) );
       result := ( _cds.FieldByName('PLAGRUPO').asString = 'E' );
     end;
   end;

begin

    bUsaStoredProc := UsaStoredProc(trunc(IdEmpresa));
    _iIdSegregaContr := iIdSegregaContr;
    bGravaMemoriaDeCalculo := False;

   if (not excluiContaEstatiscaMov(cContac)) or (not excluiContaEstatiscaMov(cContad)) then
   begin
     result := false;
     exit;
   end;

   If Not CtrlContab.SelecionaParametrosProc(IdEmpresa) Then
   Begin
      Result := False;
      MessageInfo := CtrlContab.MessageInfo;
      Exit;
   End;

   if not CtrlImobSegregacao.Active then begin
      CtrlImobSegregacao.GetParams(trunc(IdEmpresa));
      FPlanoSegregar := CtrlImobSegregacao.PlanoPrevSegrega;
   end;

   Result := True;
   FRetornoPlnCodigo := liPlnCodigo;
   sMens  := '';
   if (CtrlContab.PermiteZero = 'N') and (rValLanc = 0) and (FlcValHisDeb = 0) and (FlcValHisCre = 0)
       and (FlcValOfiDeb = 0) and (FlcValOfiCre = 0) and (FlcValGerDeb = 0) and (FlcValGerCre = 0)
       and (FlcValGe1Deb = 0) and (FlcValGe1Cre = 0) and (FlcValGe2Deb = 0) and (FlcValGe2Cre = 0) then begin
       // Não fazer Nada. Sair do lançamento
   end else begin
      Try
         if bUsaPlanoPatro then begin
            if ((iPlanoPrev = 0) or (iPatro = 0)) then begin
               sMens := 'Plano ou Patrocinadora não preenchido';
               Raise Exception.Create(sMens);
            end;
            // Alex 16/09/04 17623 verificar relacionamentos válidos entre plano e patro
            if not CtrlPlanPrevContabPatro.ValidaPlanoPatro( trunc(iPatro), trunc(iPlanoPrev) ) then begin
              sMens := CtrlPlanPrevContabPatro.MessageInfo;
              Raise Exception.Create(sMens);
            end;

         end else begin
            iPlanoPrev := 0;
            iPatro     := 0;
         end;
         if sTipoOper = '' then begin
            if CtrlContab.ObrigaTipoOper = 'S' then begin
               sMens := 'Obrigatório indicar o Tipo de Operação';
               Raise Exception.Create(sMens);
            end else begin
               sTipoOper := CtrlContab.TipoOperLanca;
            end;
         end;
         CtrlPeriodo.PeriodoEsp := FlcPeriodoEsp;
         if not CtrlPeriodo.RetornaPeriodoExercicioDataProc(IdEmpresa,sDataLanc) then begin
            sMens := CtrlPeriodo.MessageInfo;
            Raise Exception.Create(sMens);
         end;
//         if iModuloOrigem = 1 then begin
//            if CtrlPeriodo.TestaPeriodoBloqueadoProc(idEmpresa,tbBloqueado,CtrlPeriodo.Periodo,CtrlPeriodo.Exercicio,False) then begin
//               sMens := CtrlPeriodo.MessageInfo + ' para lançamento';
//               Raise Exception.Create(sMens);
//            end;
//         end else begin
            if CtrlPeriodo.TestaPeriodoBloqueadoProc(idEmpresa,tbBloqOuInt,CtrlPeriodo.Periodo,CtrlPeriodo.Exercicio,False) then begin
               sMens := CtrlPeriodo.MessageInfo + ' para lançamento';
               Raise Exception.Create(sMens);
//            end;
            if not CtrlContab.TestaDataBloqueadaProc(idEmpresa,iModuloOrigem, sDataLanc) then begin
               sMens := CtrlContab.MessageInfo;
               Raise Exception.Create(sMens);
            end;
         end;

         if not CtrlContab.SelecionaPlanoDataProc(idEmpresa,sDataLanc) then begin
            sMens := 'Plano de Contas Inválido';
            Raise Exception.Create(sMens);
         end;

         Case cTipoLanc of
           '2' : Begin
                    if ((cContaD = '') or (cContaC = '')) then begin
                       sMens := 'Para lançamento de partida dobrada obrigatório indicar a conta a débito e a crédito';
                       Raise Exception.Create(sMens);
                    end;
                 End;
           '0' : Begin
                    if (cContaD = '') then begin
                       sMens := 'Para lançamento a Débito obrigatório indicar a conta a débito';
                       Raise Exception.Create(sMens);
                    end;
                 End;
           '1' : Begin
                    if (cContaC = '') then begin
                       sMens := 'Para lançamento a Crédito obrigatório indicar a conta a crédito';
                      Raise Exception.Create(sMens);
                    end;
                 end;
         end;

         {_Cds.Data := GetDataPacket ('SELECT DTSEGREGAVIRTUAL FROM PARAMGLOBAL');
         if ((_Cds.FieldByName('DTSEGREGAVIRTUAL').AsDateTime) <= ( strtodate(sDataLanc) )) and
            (bSegregaOrigem) and (CtrlImobSegregacao.SegregaVirtual) then begin
            if liCodPlano = 0 then
              liCodPlano := CtrlContab.PlanoData;
            //Executa a segregação do lançamento.
            if SegregaLancamento  then exit;
         end;}

         cContaD := Trim(cContaD);
         cContaC := Trim(cContaC);

         if liSubContaDeb < 0 then liSubContaDeb := 0;
         if liSubContaCre < 0 then liSubContaCre := 0;

         FlcValOfiCre     := RoundCM(FlcValOfiCre);
         FlcValGerCre     := RoundCM(FlcValGerCre);
         FlcValGe1Cre     := RoundCM(FlcValGe1Cre);
         FlcValGe2Cre     := RoundCM(FlcValGe2Cre);
         FlcValOfiDeb     := RoundCM(FlcValOfiDeb);
         FlcValGerDeb     := RoundCM(FlcValGerDeb);
         FlcValGe1Deb     := RoundCM(FlcValGe1Deb);
         FlcValGe2Deb     := RoundCM(FlcValGe2Deb);
         FlcValHisCre     := RoundCM(FlcValHisCre);
         FlcValHisDeb     := RoundCM(FlcValHisDeb);
         rValLanc         := RoundCM(rValLanc);
         Case cTipoLanc of
           '2' : Begin
                    bJunta := False;
                    if rValLanc < 0 then begin
                       rValLanc         := rValLanc*(-1);
                       sAux             := FlcTipConvOfiCre;
                       FlcTipConvOfiCre := FlcTipConvOfiDeb;
                       FlcTipConvOfiDeb := sAux;
                       sAux             := FlcTipConvGerCre;
                       FlcTipConvGerCre := FlcTipConvGerDeb;
                       FlcTipConvGerDeb := sAux;
                       sAux             := FlcTipConvGe1Cre;
                       FlcTipConvGe1Cre := FlcTipConvGe1Deb;
                       FlcTipConvGe1Deb := sAux;
                       sAux             := FlcTipConvGe2Cre;
                       FlcTipConvGe2Cre := FlcTipConvGe2Deb;
                       FlcTipConvGe2Deb := sAux;
                       rAux             := FlcValOfiCre*(-1);
                       FlcValOfiCre     := FlcValOfiDeb*(-1);
                       FlcValOfiDeb     := rAux;
                       rAux             := FlcValGerCre*(-1);
                       FlcValGerCre     := FlcValGerDeb*(-1);
                       FlcValGerDeb     := rAux;
                       rAux             := FlcValGe1Cre*(-1);
                       FlcValGe1Cre     := FlcValGe1Deb*(-1);
                       FlcValGe1Deb     := rAux;
                       rAux             := FlcValGe2Cre*(-1);
                       FlcValGe2Cre     := FlcValGe2Deb*(-1);
                       FlcValGe2Deb     := rAux;
                       sAux             := FlcOriAplDeb;
                       FlcOriAplDeb     := FlcOriAplCre;
                       FlcOriAplCre     := sAux;
                       rAux             := liSubContaDeb;
                       liSubContaDeb    := liSubContaCre;
                       liSubContaCre    := rAux;
                       sAux             := cCCustD;
                       cCCustD          := cCCustC;
                       cCCustC          := sAux;
                       sAux             := cContaD;
                       cContaD          := cContaC;
                       cContaC          := sAux;
                       rAux             := FlcValHisDeb*(-1);
                       FlcValHisDeb    := FlcValHisCre*(-1);
                       FlcValHisCre    := rAux;
                    end;
                 end;
           '0' : Begin
                    cContaC := '';
                    if rValLanc < 0 then begin
                       cTipoLanc        := '1';
                       rValLanc         := rValLanc*(-1);
                       FlcTipConvOfiCre := FlcTipConvOfiDeb;
                       FlcTipConvGerCre := FlcTipConvGerDeb;
                       FlcTipConvGe1Cre := FlcTipConvGe1Deb;
                       FlcTipConvGe2Cre := FlcTipConvGe2Deb;
                       FlcTipConvOfiDeb := '';
                       FlcTipConvGerDeb := '';
                       FlcTipConvGe1Deb := '';
                       FlcTipConvGe2Deb := '';
                       FlcValOfiCre     := FlcValOfiDeb*(-1);
                       FlcValGerCre     := FlcValGerDeb*(-1);
                       FlcValGe1Cre     := FlcValGe1Deb*(-1);
                       FlcValGe2Cre     := FlcValGe2Deb*(-1);
                       FlcValOfiDeb     := 0;
                       FlcValGerDeb     := 0;
                       FlcValGe1Deb     := 0;
                       FlcValGe2Deb     := 0;
                       FlcOriAplCre     := FlcOriAplDeb;
                       FlcOriAplDeb     := '';
                       liSubContaCre    := liSubContaDeb;
                       liSubContaDeb    := 0;
                       cCCustC          := cCCustD;
                       cCCustD          := '';
                       cContaC          := cContaD;
                       cContaD          := '';
                       FlcValHisCre    := FlcValHisDeb*(-1);
                       FlcValHisDeb    := 0;
                    end;
                 end;
           '1' : Begin
                    cContaD := '';
                    if rValLanc < 0 then begin
                       cTipoLanc        := '0';
                       rValLanc         := rValLanc*(-1);
                       FlcTipConvOfiDeb := FlcTipConvOfiCre;
                       FlcTipConvGerDeb := FlcTipConvGerCre;
                       FlcTipConvGe1Deb := FlcTipConvGe1Cre;
                       FlcTipConvGe2Deb := FlcTipConvGe2Cre;
                       FlcTipConvOfiCre := '';
                       FlcTipConvGerCre := '';
                       FlcTipConvGe1Cre := '';
                       FlcTipConvGe2Cre := '';
                       FlcValOfiDeb     := FlcValOfiCre*(-1);
                       FlcValGerDeb     := FlcValGerCre*(-1);
                       FlcValGe1Deb     := FlcValGe1Cre*(-1);
                       FlcValGe2Deb     := FlcValGe2Cre*(-1);
                       FlcValOfiCre     := 0;
                       FlcValGerCre     := 0;
                       FlcValGe1Cre     := 0;
                       FlcValGe2Cre     := 0;
                       FlcOriAplDeb     := FlcOriAplCre;
                       FlcOriAplCre     := '';
                       liSubContaDeb    := liSubContaCre;
                       liSubContaCre    := 0;
                       cCCustD          := cCCustC;
                       cCCustC          := '';
                       cContaD          := cContaC;
                       cContaC          := '';
                       FlcValHisDeb    := FlcValHisCre*(-1);
                       FlcValHisCre    := 0;
                    end;
                 end;
         end;
         //Faz o DE-Para do plano de contas
         if (liCodPlano <> CtrlContab.PlanoData) and (FlcEDePara = 'N') then begin
            if CtrlContaContabil.FazDeParaConta(idEmpresa,liCodPlano,CtrlContab.PlanoData,cContaD,cCCustD) then begin
               cContaD := CtrlContaContabil.ContaContabilPara;
               if CtrlContaContabil.CentroCustoPara <> '' then
                  cCCustD := CtrlContaContabil.CentroCustoPara;
            end;
            if CtrlContaContabil.FazDeParaConta(idEmpresa,liCodPlano,CtrlContab.PlanoData,cContaC,cCCustC) then begin
               cContaC := CtrlContaContabil.ContaContabilPara;
               if CtrlContaContabil.CentroCustoPara <> '' then
                  cCCustC := CtrlContaContabil.CentroCustoPara;
            end;
            liCodPlano := CtrlContab.PlanoData;
         end;
         if FlcTestaConta or (iModuloOrigem <> 1) then begin
            if cContaD <> '' then begin
               FlcCentroCusto := cCCustd;
               FlcSubConta    := liSubContaDeb;
               if not TestaContaLancamento(cContaD,'D', sDataLanc,liCodPlano,idEmpresa,iModuloOrigem,CtrlPeriodo.Periodo,CtrlPeriodo.Exercicio) then begin
                  sMens := MessageInfo;
                  Raise Exception.Create(sMens);
               end;
               cCCustd       :=FlcCentroCusto;
               liSubContaDeb :=FlcSubConta;
               // Faz cálculo da outra moeda para débito
               if CtrlContaContabil.MoedaHistorica <> 0 then begin
                  if not RetornaCotacao(CtrlContaContabil.MoedaHistorica,sDataLanc,True) then begin
                     sMens:= MessageInfo+' para a conta a Débito '+cContaD;
                     Raise Exception.Create(sMens);
                  end else begin
                     if FValorCotacao <> 0 then
                        FlcValHisDeb := RoundCM(rValLanc / FValorCotacao);
                  end;
               end;
            end;
            if (cContaC <> '') then begin
               FlcCentroCusto:=cCCustC;
               FlcSubConta   :=liSubContaCre;
               if not TestaContaLancamento(cContaC,'C', sDataLanc,liCodPlano,idEmpresa,iModuloOrigem,CtrlPeriodo.Periodo,CtrlPeriodo.Exercicio) then begin
                  sMens := MessageInfo;
                  Raise Exception.Create(sMens);
               end;
               cCCustc       :=FlcCentroCusto;
               liSubContaCre :=FlcSubConta;
               // Faz cálculo da outra moeda para crédito
               if CtrlContaContabil.MoedaHistorica <> 0 then begin
                  if not RetornaCotacao(CtrlContaContabil.MoedaHistorica,sDataLanc,True) then begin
                     sMens:= MessageInfo + ' para a conta a Crédito '+cContaC;
                     Raise Exception.Create(sMens);
                  end else begin
                     if FValorCotacao <> 0 then
                        FlcValHisCre := RoundCM(rValLanc / FValorCotacao);
                  end;
               end;
            end;
         end;

         sNumDoc := Copy(Trim(sNumDoc),1,15);

         if (iModuloOrigem = 1) and (FlcTestaConta) then
            sEfetivado := 'S'
         else
            sEfetivado := 'N';

         if (length(trim(sHist1)) > 40) and (sHist2 = '') then begin
            CtrlHistoContab.ArrumaHistorico(sHist1);
            sHist1 := CtrlHistoContab.Hist1;
            sHist2 := CtrlHistoContab.Hist2;
            sHist3 := CtrlHistoContab.Hist3;
            sHist4 := CtrlHistoContab.Hist4;
            sHist5 := CtrlHistoContab.Hist5;
         end;
         if CtrlContab.CaixaAlta = 'S' then begin
            sHist1 := AnsiUpperCase(Copy(trim(sHist1),1,40));
            sHist2 := AnsiUpperCase(Copy(trim(sHist2),1,40));
            sHist3 := AnsiUpperCase(Copy(trim(sHist3),1,40));
            sHist4 := AnsiUpperCase(Copy(trim(sHist4),1,40));
            sHist5 := AnsiUpperCase(Copy(trim(sHist5),1,40));
         end else begin
            sHist1 := Copy(trim(sHist1),1,40);
            sHist2 := Copy(trim(sHist2),1,40);
            sHist3 := Copy(trim(sHist3),1,40);
            sHist4 := Copy(trim(sHist4),1,40);
            sHist5 := Copy(trim(sHist5),1,40);
         end;
         if (liUnidNegoc = 0) then begin
            if CtrlContab.ObrigaAtivProj = 'S' then begin
               sMens := 'Obrigatório indicar a atividade/projeto';
               Raise Exception.Create(sMens);
            end else begin
               if not RetornaAtivProjPadrao(idEmpresa) then begin
                  sMens:=MessageInfo;
                  Raise Exception.Create(sMens);
               end else begin
                  liUnidNegoc := FAtivProjPadrao;
               end;
            end;
         end;

         if (trunc(liPlnCodigo) <> 0) then
         begin
           if ( verificaLancPlanilhaEstat(trunc(liPlnCodigo)) ) then
           begin
             if (not eContaEstatistica(cContac)) then
             begin
               MessageInfo := 'A planilha de código interno '+ FloatToStr(liPlnCodigo) + ' só aceita lançamentos contábeis de Contas do Grupo Estatístico '+#13+
               'e a conta '+ cContac + ' não pertence a esse grupo.';
               Raise Exception.Create(MessageInfo);
             end;

             if (not eContaEstatistica(cContad)) then
             begin
               MessageInfo := 'A planilha de código interno '+ FloatToStr(liPlnCodigo) + ' só aceita lançamentos contábeis de Contas do Grupo Estatístico '+#13+
               'e a conta '+ cContad + ' não pertence a esse grupo.';
               Raise Exception.Create(MessageInfo);
             end;

           end;
         end;

         bIncluiPlanilha := True;
         bIncluiLanc     := True;
         if liPlnCodigo <> 0 then begin
            _Cds.Data := SelecionaPlanilhas(liPlnCodigo,0,0,idEmpresa,0,0,tpSoPeriodo,'','','','',teAmbos,tolPlnCodigo);
            if not _Cds.isEmpty then
            begin
              if _Cds.FieldByName('PLNDATDIA').AsDateTime <> StrToDate(sDataLanc) then begin
                 sMens:='Planilha com código interno '+_Cds.FieldByName('PLNCODIGO').AsString+' não pertence ao dia '+sDataLanc;
                 Raise Exception.Create(sMens);
              end;
              bIncluiPlanilha := False;
              sEfetivado      := _Cds.FieldByName('PLNEFETIVADO').AsString;
            end else begin
               sMens := 'Planilha com código interno ' + FloatToStr(liPlnCodigo) + ' não encontrada';
               Raise Exception.Create(sMens);
            end;
         end;
         if bIncluiPlanilha then begin
            FProxPlanilha  := 1;
            FNumLancamento := 1;

            if not CtrlPeriodo.RetornaProximaPlanilha(idEmpresa,sDataLanc, CtrlPeriodo.Periodo, CtrlPeriodo.Exercicio) then
              Abort;
            FProxPlanilha := CtrlPeriodo.ProxPlanilha;
            _dbPlanilha.Plnplanil.AsFloat         := FProxPlanilha;
            _dbPlanilha.Plnnumlan.AsFloat         := 1;
            _dbPlanilha.Tipcodigo.AsString        := sTipoOper;
            _dbPlanilha.Plnefetivado.AsString     := sEfetivado;
            _dbPlanilha.Plndatdia.AsDateTime      := StrToDate(sDataLanc);
            _dbPlanilha.Pernumero.AsInteger       := CtrlPeriodo.Periodo;
            _dbPlanilha.Perexercicio.AsInteger    := CtrlPeriodo.Exercicio;
            _dbPlanilha.Pancodigo.AsFloat         := FlcPanCodigo;
            _dbPlanilha.Idusuarioinclusao.AsFloat := liUsuario;
            _dbPlanilha.Idpessoa.AsFloat          := idEmpresa;
            _dbPlanilha.Idmodulo.AsFloat          := iModuloOrigem;
            _dbPlanilha.Plnplanestorno.AsFloat    := FlcPlnEstorno;

            if DbGravaLanc.TableName = 'LANCAMENTO' then begin
               if (cTipoLanc = '0') or (cTipoLanc = '2') then begin
                  _dbPlanilha.Plntotdeboficial.AsFloat := RoundCM(FlcValOfiDeb);
                  _dbPlanilha.Plntotdebhist.AsFloat    := RoundCM(FlcValHisDeb);
                  _dbPlanilha.Plntotdebgeren2.AsFloat  := RoundCM(FlcValGe2Deb);
                  _dbPlanilha.Plntotdebgeren1.AsFloat  := RoundCM(FlcValGe1Deb);
                  _dbPlanilha.Plntotdebger.AsFloat     := RoundCM(FlcValGerDeb);
                  //_dbPlanilha.Plntotdeb.AsFloat        := RoundCM(rValLanc);
                  _dbPlanilha.Plntotdeb.asFloat        := RoundCM(bValorTotLacamento);
               end else begin
                  _dbPlanilha.Plntotdeboficial.AsFloat := 0;
                  _dbPlanilha.Plntotdebhist.AsFloat    := 0;
                  _dbPlanilha.Plntotdebgeren2.AsFloat  := 0;
                  _dbPlanilha.Plntotdebgeren1.AsFloat  := 0;
                  _dbPlanilha.Plntotdebger.AsFloat     := 0;
                  _dbPlanilha.Plntotdeb.AsFloat        := 0;
               end;

               if (cTipoLanc = '1') or (cTipoLanc = '2') then begin
                  _dbPlanilha.Plntotcreoficial.AsFloat := RoundCM(FlcValOfiCre);
                  _dbPlanilha.Plntotcrehist.AsFloat    := RoundCM(FlcValHisCre);
                  _dbPlanilha.Plntotcregeren2.AsFloat  := RoundCM(FlcValGe2Cre);
                  _dbPlanilha.Plntotcregeren1.AsFloat  := RoundCM(FlcValGe1Cre);
                  _dbPlanilha.Plntotcreger.AsFloat     := RoundCM(FlcValGerCre);
                  //_dbPlanilha.Plntotcre.AsFloat        := RoundCM(rValLanc);
                  _dbPlanilha.Plntotcre.asFloat        := RoundCM(bValorTotLacamento);
               end else begin
                  _dbPlanilha.Plntotcreoficial.AsFloat := 0;
                  _dbPlanilha.Plntotcrehist.AsFloat    := 0;
                  _dbPlanilha.Plntotcregeren2.AsFloat  := 0;
                  _dbPlanilha.Plntotcregeren1.AsFloat  := 0;
                  _dbPlanilha.Plntotcreger.AsFloat     := 0;
                  _dbPlanilha.Plntotcre.AsFloat        := 0;
               end;
            end;

            if not _dbPlanilha.Insert then begin
               sMens := _dbPlanilha.MessageInfo;
               Raise Exception.Create(sMens);
            end;
         end else begin

            if bJunta then begin
               if cTipoLanc = '0' then begin
                  if RetornaNumLanc(idEmpresa,liPlnCodigo, liCodPlano,
                            liSubContaDeb,liUnidNegoc, iPlanoPrev, iPatro, cContaD,
                            cCCustD,'D',sCodHist,
                            iIdSegregaCriter, dDataSegregaCriter,
                            iCodDocumento) then bIncluiLanc := False;

               end else begin
                  if RetornaNumLanc(idEmpresa,liPlnCodigo, liCodPlano,
                            liSubContaCre,liUnidNegoc, iPlanoPrev, iPatro, cContaC,
                            cCCustC,'C',sCodHist,
                            iIdSegregaCriter, dDataSegregaCriter,
                            iCodDocumento) then bIncluiLanc := False;

               end;
            end;
            _dbPlanilha.Plncodigo.AsFloat := liPlnCodigo;
            _dbPlanilha.LoadFromDb;
            if _dbPlanilha.Plndatdia.AsDateTime <> StrToDate(sDataLanc) then begin
               if not CtrlPeriodo.RetornaProximaPlanilha(idEmpresa,sDataLanc, CtrlPeriodo.Periodo, CtrlPeriodo.Exercicio) then Abort;
               FProxPlanilha := CtrlPeriodo.ProxPlanilha;
               _dbPlanilha.Plnplanil.AsFloat := FProxPlanilha;
            end;
            _dbPlanilha.Tipcodigo.AsString        := sTipoOper;
            _dbPlanilha.Plnefetivado.AsString     := sEfetivado;
            _dbPlanilha.Plndatdia.AsDateTime      := StrToDate(sDataLanc);
            _dbPlanilha.Pernumero.AsInteger       := CtrlPeriodo.Periodo;
            _dbPlanilha.Perexercicio.AsInteger    := CtrlPeriodo.Exercicio;
            _dbPlanilha.Idpessoa.AsFloat          := idEmpresa;
            if bIncluiLanc then begin
               if DbGravaLanc.TableName = 'LANCAMENTO' then begin
                  if iNumLan > 0 then begin
                     FNumLancamento := iNumLan;
                     if iNumLan > _dbPlanilha.Plnnumlan.AsInteger then
                        _dbPlanilha.Plnnumlan.AsInteger := iNumLan;
                  end else begin
                     _dbPlanilha.Plnnumlan.AsInteger := _dbPlanilha.Plnnumlan.AsInteger + 1;
                     FNumLancamento := _dbPlanilha.Plnnumlan.AsInteger;     {zerar o numlac por aqui Bruno Bastos}
                  end;
               end else begin
                  if _dbPlanilha.NumLanSegrega.IsNull then _dbPlanilha.NumLanSegrega.AsInteger :=0;
                  _dbPlanilha.NumLanSegrega.AsInteger := _dbPlanilha.NumLanSegrega.AsInteger + 1;
                  FNumLancamento := _dbPlanilha.NumLanSegrega.AsInteger;
               end;
            end;
            _dbPlanilha.Plncodigo.AsFloat := liPlnCodigo;
            if DbGravaLanc.TableName = 'LANCAMENTO' then begin
               if (cTipoLanc = '0') or (cTipoLanc = '2') then begin
                  _dbPlanilha.Plntotdeboficial.AsFloat := _dbPlanilha.Plntotdeboficial.AsFloat  + RoundCM(FlcValOfiDeb);
                  _dbPlanilha.Plntotdebhist.AsFloat    := _dbPlanilha.Plntotdebhist.AsFloat     + RoundCM(FlcValHisDeb);
                  _dbPlanilha.Plntotdebgeren2.AsFloat  := _dbPlanilha.Plntotdebgeren2.AsFloat   + RoundCM(FlcValGe2Deb);
                  _dbPlanilha.Plntotdebgeren1.AsFloat  := _dbPlanilha.Plntotdebgeren1.AsFloat   + RoundCM(FlcValGe1Deb);
                  _dbPlanilha.Plntotdebger.AsFloat     := _dbPlanilha.Plntotdebger.AsFloat      + RoundCM(FlcValGerDeb);
                  //Bruno Bastos - 23/12/2009 - _dbPlanilha.Plntotdeb.AsFloat        := _dbPlanilha.Plntotdeb.AsFloat         + ;        //+ RoundCM(rValLanc);  Comentado para atender chamado
                  _dbPlanilha.Plntotdeb.AsFloat        := RoundCM(bValorTotLacamento); //Bruno Bastos - 23/12/2009

               end;
               if (cTipoLanc = '1') or (cTipoLanc = '2') then begin
                  _dbPlanilha.Plntotcreoficial.AsFloat := _dbPlanilha.Plntotcreoficial.AsFloat  + RoundCM(FlcValOfiCre);
                  _dbPlanilha.Plntotcrehist.AsFloat    := _dbPlanilha.Plntotcrehist.AsFloat     + RoundCM(FlcValHisCre);
                  _dbPlanilha.Plntotcregeren2.AsFloat  := _dbPlanilha.Plntotcregeren2.AsFloat   + RoundCM(FlcValGe2Cre);
                  _dbPlanilha.Plntotcregeren1.AsFloat  := _dbPlanilha.Plntotcregeren1.AsFloat   + RoundCM(FlcValGe1Cre);
                  _dbPlanilha.Plntotcreger.AsFloat     := _dbPlanilha.Plntotcreger.AsFloat      + RoundCM(FlcValGerCre);
                  //Bruno Bastos - 23/12/2009 - _dbPlanilha.Plntotcre.AsFloat        := _dbPlanilha.Plntotcre.AsFloat        //+ RoundCM(rValLanc); Comentado para atender chamado
                  _dbPlanilha.Plntotcre.AsFloat        := RoundCM(bValorTotLacamento); //Bruno Bastos - 23/12/2009

               end;
            end;

            if not _dbPlanilha.Update then begin
               sMens := _dbPlanilha.MessageInfo;
               Raise Exception.Create(sMens);
            end;
         end;

         GravaDadosLancamento;
         FRetornoPlnCodigo := _dbPlanilha.Plncodigo.AsFloat;
         FRetornoPlnPlanil := _dbPlanilha.Plnplanil.AsFloat;


          if (not bUsaStoredProc) and (sEfetivado = 'S') then
          begin
            if not CtrlContaContabil.BuscaMascaraConta(liCodPlano) then begin
               sMens:= CtrlContaContabil.MessageInfo;
               Raise Exception.Create(sMens);
            end;
            if cContaD <> '' then begin
               if not AtuSaldoContas(IdEmpresa, liUnidNegoc,
                                     liUsuario, iPlanoPrev, iPatro, liCodPlano,
                                     CtrlPeriodo.Exercicio,CtrlPeriodo.Periodo,
                                     liSubContaDeb, cCCustD,cContaD,'D','A',
                                     rValLanc,0, FlcValOfiDeb,FlcValGerDeb, FlcValGe1Deb,
                                     FlcValGe2Deb, FlcValHisDeb, bUsaPlanoPatro) then begin
                  sMens := MessageInfo;
                  Raise Exception.Create(sMens);
               end;
               if not AtuSaldoSintetica(IdEmpresa, liUnidNegoc,
                                     liUsuario, iPlanoPrev, iPatro, liCodPlano,
                                     CtrlPeriodo.Exercicio,CtrlPeriodo.Periodo,
                                     liSubContaDeb, cCCustD,cContaD,'D',
                                     CtrlContaContabil.MascaraConta,
                                     rValLanc,0, FlcValOfiDeb,FlcValGerDeb, FlcValGe1Deb,
                                     FlcValGe2Deb, FlcValHisDeb, bUsaPlanoPatro) then begin
                  sMens := MessageInfo;
                  Raise Exception.Create(sMens);
               end;
            end;
            if cContaC <> '' then begin
               if not AtuSaldoContas(IdEmpresa, liUnidNegoc,
                                     liUsuario, iPlanoPrev, iPatro, liCodPlano,
                                     CtrlPeriodo.Exercicio,CtrlPeriodo.Periodo,
                                     liSubContaCre, cCCustC,cContaC,'C','A',
                                     rValLanc,0, FlcValOfiCre,FlcValGerCre, FlcValGe1Cre,
                                     FlcValGe2Cre, FlcValHisCre, bUsaPlanoPatro) then begin
                  sMens := MessageInfo;
                  Raise Exception.Create(sMens);
               end;
               if not AtuSaldoSintetica(IdEmpresa, liUnidNegoc,
                                     liUsuario, iPlanoPrev, iPatro, liCodPlano,
                                     CtrlPeriodo.Exercicio,CtrlPeriodo.Periodo,
                                     liSubContaCre, cCCustC,cContaC,'C',
                                     CtrlContaContabil.MascaraConta,
                                     rValLanc,0, FlcValOfiCre,FlcValGerCre, FlcValGe1Cre,
                                     FlcValGe2Cre, FlcValHisCre, bUsaPlanoPatro) then begin
                  sMens := MessageInfo;
                  Raise Exception.Create(sMens);
               end;
            end;
         end;

      Except
         On E : Exception do
         begin
            FRetornoPlnCodigo := -1;
            FRetornoPlnPlanil := -1;
            MessageInfo := E.Message;
            Result := False;
         end;
      End;
   end;
   IniciaVariavelLancamento;
end;

procedure TCtrlImobLancamento.SetlcElemento(const Value: Double);
begin
  FlcElemento := Value;
end;

procedure TCtrlImobLancamento.SetlcOriAplCre(const Value: String);
begin
  FlcOriAplCre := Value;
end;

procedure TCtrlImobLancamento.SetlcOriAplDeb(const Value: String);
begin
  FlcOriAplDeb := Value;
end;

procedure TCtrlImobLancamento.SetlcTestaConta(const Value: Boolean);
begin
  FlcTestaConta := Value;
end;

procedure TCtrlImobLancamento.SetlcTipConvGe1Cre(const Value: String);
begin
  FlcTipConvGe1Cre := Value;
end;

procedure TCtrlImobLancamento.SetlcTipConvGe1Deb(const Value: String);
begin
  FlcTipConvGe1Deb := Value;
end;

procedure TCtrlImobLancamento.SetlcTipConvGe2Cre(const Value: String);
begin
  FlcTipConvGe2Cre := Value;
end;

procedure TCtrlImobLancamento.SetlcTipConvGe2Deb(const Value: String);
begin
  FlcTipConvGe2Deb := Value;
end;

procedure TCtrlImobLancamento.SetlcTipConvGerCre(const Value: String);
begin
  FlcTipConvGerCre := Value;
end;

procedure TCtrlImobLancamento.SetlcTipConvGerDeb(const Value: String);
begin
  FlcTipConvGerDeb := Value;
end;

procedure TCtrlImobLancamento.SetlcTipConvOfiCre(const Value: String);
begin
  FlcTipConvOfiCre := Value;
end;

procedure TCtrlImobLancamento.SetlcTipConvOfiDeb(const Value: String);
begin
  FlcTipConvOfiDeb := Value;
end;

procedure TCtrlImobLancamento.SetlcValGe1Cre(const Value: Double);
begin
  FlcValGe1Cre := Value;
end;

procedure TCtrlImobLancamento.SetlcValGe1Deb(const Value: Double);
begin
  FlcValGe1Deb := Value;
end;

procedure TCtrlImobLancamento.SetlcValGe2Cre(const Value: Double);
begin
  FlcValGe2Cre := Value;
end;

procedure TCtrlImobLancamento.SetlcValGe2Deb(const Value: Double);
begin
  FlcValGe2Deb := Value;
end;

procedure TCtrlImobLancamento.SetlcValGerCre(const Value: Double);
begin
  FlcValGerCre := Value;
end;

procedure TCtrlImobLancamento.SetlcValGerDeb(const Value: Double);
begin
  FlcValGerDeb := Value;
end;

procedure TCtrlImobLancamento.SetlcValHisCre(const Value: Double);
begin
  FlcValHisCre := Value;
end;

procedure TCtrlImobLancamento.SetlcValHisDeb(const Value: Double);
begin
  FlcValHisDeb := Value;
end;

procedure TCtrlImobLancamento.SetlcValOfiCre(const Value: Double);
begin
  FlcValOfiCre := Value;
end;

procedure TCtrlImobLancamento.SetlcValOfiDeb(const Value: Double);
begin
  FlcValOfiDeb := Value;
end;


procedure TCtrlImobLancamento.IniciaVariavelLancamento;
begin
   FlcElemento      := 0;
   FlcTipConvOfiDeb := '';
   FlcTipConvGerDeb := '';
   FlcTipConvGe1Deb := '';
   FlcTipConvGe2Deb := '';
   FlcOriAplDeb     := '';
   FlcTipConvOfiCre := '';
   FlcEDePara       := 'N';
   FlcTipConvGerCre := '';
   FlcTipConvGe1Cre := '';
   FlcTipConvGe2Cre := '';
   FlcOriAplCre     := '';
   FlcPanCodigo     := 0;
   FlcPlnEstorno    := 0;
   FlcValOfiDeb     := 0;
   FlcValGerDeb     := 0;
   FlcValGe1Deb     := 0;
   FlcValGe2Deb     := 0;
   FlcValHisDeb     := 0;
   FlcValOfiCre     := 0;
   FlcValGerCre     := 0;
   FlcValGe1Cre     := 0;
   FlcValGe2Cre     := 0;
   FlcValHisCre     := 0;
   FlcTestaConta    := true;
   FlcPeriodoEsp    := False;
end;


function TCtrlImobLancamento.TestaContaLancamento(sConta, sTipoDC, sDataLanc: String; liCodPlano, idEmpresa, idModulo,iPeriodo,iExercicio :Double): Boolean;
var sMens, sMensDC : String;
begin
   Result := True;
   sMens  := '';
   try
      if sTipoDC = 'D' then sMensDC := ' a Débito ' else sMensDC := ' a Crédito ';
      if not CtrlContaContabil.TestaContaContabilProc(liCodPlano,idEmpresa,iPeriodo,iExercicio, sConta,False, False) then begin
         sMens := 'Conta ' + sConta + sMensDC + CtrlContaContabil.MessageInfo;
         Abort;
      end;
      if CtrlContaContabil.ObrigaCentroCusto = 'N' then begin
         FlcCentroCusto := '';
      end else begin
         if FlcCentroCusto = '' then begin
            sMens := 'Conta '+sConta+sMensDC+'Obriga Centro de Custo';
            Abort;
         end;
         if not CtrlContaContabil.TestaContaxCC(liCodPlano,idEmpresa,sConta,FlcCentroCusto) then begin
            sMens := CtrlContaContabil.MessageInfo + sMensDC;
            Abort;
         end;
      end;

      if CtrlContaContabil.ObrigaSubConta = 'S' then begin
         if FlcSubConta = 0 then begin
            sMens := 'Conta '+sConta+sMensDC+' Obriga Subconta';
            Abort;
         end;
         if not CtrlContaContabil.TestaContaxSC(liCodPlano,idEmpresa,FlcSubConta,sConta) then begin
            sMens := CtrlContaContabil.MessageInfo+sMensDC;
            Abort;
         end;
      end else begin
         FlcSubConta := 0;
      end;

      if (CtrlContaContabil.AceitaAlteraContab = 'N') and (idModulo = 1) then begin
         sMens := 'Conta '+sConta+sMensDC+'não permite movimentação pela Contabilidade';
         Abort;
      end;
      if (CtrlContaContabil.ContaBloqueada = 'S') and (CtrlContaContabil.DataBloqueio >= StrToDate(sDataLanc)) then begin
         sMens := 'Conta '+sConta+sMensDC+'está bloqueada até ' + DateToStr(CtrlContaContabil.DataBloqueio);
         Abort;
      end;
      if sTipoDC = 'D' then begin
         if FlcTipConvOfiDeb = '' then FlcTipConvOfiDeb := CtrlContaContabil.TipoConvOfi;
         if FlcTipConvGerDeb = '' then FlcTipConvGerDeb := CtrlContaContabil.TipoConvGeren;
         if FlcTipConvGe1Deb = '' then FlcTipConvGe1Deb := CtrlContaContabil.TipoConvGeren1;
         if FlcTipConvGe2Deb = '' then FlcTipConvGe2Deb := CtrlContaContabil.TipoConvGeren2;
      end else begin
         if FlcTipConvOfiCre = '' then FlcTipConvOfiCre := CtrlContaContabil.TipoConvOfi;
         if FlcTipConvGerCre = '' then FlcTipConvGerCre := CtrlContaContabil.TipoConvGeren;
         if FlcTipConvGe1Cre = '' then FlcTipConvGe1Cre := CtrlContaContabil.TipoConvGeren1;
         if FlcTipConvGe2Cre = '' then FlcTipConvGe2Cre := CtrlContaContabil.TipoConvGeren2;
      end;
   Except
      MessageInfo := sMens;
      Result := False;
   end;
end;

procedure TCtrlImobLancamento.SetlcCentroCusto(const Value: String);
begin
  FlcCentroCusto := Value;
end;

procedure TCtrlImobLancamento.SetlcSubConta(const Value: Double);
begin
  FlcSubConta := Value;
end;

procedure TCtrlImobLancamento.SetlcPanCodigo(const Value: Double);
begin
  FlcPanCodigo := Value;
end;

procedure TCtrlImobLancamento.SetlcPlnEstorno(const Value: Double);
begin
  FlcPlnEstorno := Value;
end;

function TCtrlImobLancamento.RetornaCotacao(iMoeda: Double;
  sData: String; bExato : Boolean): Boolean;
var sNome, sPeriodo : String;
begin
      Result := True;
      _Cds.Data := GetDataPacket( 'SELECT  MOEDESC, MOEPERIODICIDADE          ' +
                                  'FROM MOEDA                                 ' +
                                  'WHERE (MOECODIGO = '+FloatToStr(iMoeda)+') ');

      if _Cds.isEmpty then begin
         MessageInfo := 'Moeda '+FloatToStr(iMoeda)+' não existe no cadastro';
         Result := False;
      end else begin
         sNome    := _Cds.FieldByName('MOEDESC').AsString;
         sPeriodo := _Cds.FieldByName('MOEPERIODICIDADE').AsString;

         With _Sql Do
           Try
              SQL.Clear;
              SQL.Add('SELECT COTDATA, COTVALOR                   ');
              SQL.Add('FROM COTACAOMOEDA                          ');
              SQL.Add('WHERE (MOECODIGO = '+FloatToStr(iMoeda)+') ');
              if not bExato then begin
                 SQL.Add('  AND ((COTDATA  <= TO_DATE('''+sData+''',''DD/MM/YYYY''))');
                 if (sPeriodo = 'D') then
                    SQL.Add(')')
                 else
                    SQL.Add('  OR (TO_DATE('''+sData+''',''DD/MM/YYYY'') <= (DECODE(COTDATAFIM,NULL,COTDATA,COTDATAFIM)))) ');
              end else begin
                 if (sPeriodo = 'D') then
                    SQL.Add('  AND (COTDATA  = TO_DATE('''+sData+''',''DD/MM/YYYY''))')
                 else
                    SQL.Add('  AND (TO_DATE('''+sData+''',''DD/MM/YYYY'') BETWEEN COTDATA AND (DECODE(COTDATAFIM,NULL,COTDATA,COTDATAFIM)))');
              end;
              SQL.Add('ORDER BY COTDATA DESC                      ');

              _Cds.Data := Data;
           finally

           end;

         if _Cds.isEmpty then begin
            MessageInfo := 'Moeda '+sNome+' não tem cotação para o dia '+sData;
            Result := False;
         end else begin
            FValorCotacao := _Cds.FieldByName('COTVALOR').AsFloat;
         end;
      end;
end;

procedure TCtrlImobLancamento.SetValorCotacao(const Value: Double);
begin
  FValorCotacao := Value;
end;

function TCtrlImobLancamento.RetornaAtivProjPadrao(idEmpresa: Double): Boolean;
begin
      Result := True;
      _Cds.Data := GetDataPacket('SELECT UNIDNEGOC                             ' +
                                 'FROM PARAMGLOBAL                             ' +
                                 'WHERE (IDPESSOA = '+FloatToStr(idEmpresa)+') ' +
                                 '  AND (UNIDNEGOC IS NOT NULL)                ');

      if _Cds.isEmpty then begin
         MessageInfo := 'Atividade/Projeto Padrão não cadastrada no Parâmetro Global';
         Result := False;
      end else begin
         FAtivProjPadrao := _Cds.FieldByName('UNIDNEGOC').AsFloat;
      end;
end;

procedure TCtrlImobLancamento.SetAtivProjPadrao(const Value: Double);
begin
  FAtivProjPadrao := Value;
end;

procedure TCtrlImobLancamento.SetProxPlanilha(const Value: Double);
begin
  FProxPlanilha := Value;
end;

function TCtrlImobLancamento.RetornaNumLanc(idEmpresa,liPlnCodigo,
  liCodPlano, liSubConta, liUnidNegoc, iPlanoPrev, iPatro: Double; sConta,
  sCentroCusto, sDebCre,sHistPadrao: String;
  iIdSegregaCriter: integer; dDataSegregaCriter: tDateTime;
  const iCodDocumento: integer) : Boolean;
begin
   Result := True;
   FNumLancamento := 0;
   With _sql Do
      Try
         SQL.Clear;
         SQL.Add('SELECT LACNUMLAN, IDSEGREGACONTR                ');


         SQL.Add('FROM ' + DbGravaLanc.TableName );  //LANCAMENTO


         SQL.Add('WHERE (PLNCODIGO = '+FloatToStr(liPlnCodigo)+') ');
         SQL.Add('  AND (LACDEBCRE = '''+sDebCre+''')             ');
         //SQL.Add('  AND (PLACONTA = '''+Copy(sConta+'                  ',1,18)+''')    ');      //MIGRACAO-ORACLE
         SQL.Add('  AND (PLACONTA = '+Quotedstr(trim(sConta))+')    ');                           //MIGRACAO-ORACLE
         SQL.Add('  AND (PLANO = '+FloatToStr(liCodPlano)+')      ');
         if sCentroCusto <> '' then begin
            //SQL.Add('  AND (CODCENTROCUSTO = '''+Copy(sCentroCusto+'          ',1,10)+''')    ');  //MIGRACAO-ORACLE
            SQL.Add('  AND (CODCENTROCUSTO = '+Quotedstr(trim(sCentroCusto))+')    ');               //MIGRACAO-ORACLE
            SQL.Add('  AND (IDEMPRESA = '+FloatToStr(idEmpresa)+')      ');
         end;
         if liUnidNegoc <> 0 then begin
            SQL.Add('  AND (UNIDNEGOC = '+FloatToStr(liUnidNegoc)+')    ');
            SQL.Add('  AND (IDPESSOA  = '+FloatToStr(idEmpresa)+')      ');
         end;
         if liSubConta <> 0 then begin
            SQL.Add('  AND (CODSUBCONTA = '+FloatToStr(liSubConta)+')   ');
            SQL.Add('  AND (IDPESSOA  = '+FloatToStr(idEmpresa)+')      ');
         end;
         if iPlanoPrev <> 0 then
            SQL.Add('  AND (IDPLANOPREV = '+FloatToStr(iPlanoPrev)+')   ');
         if iPatro <> 0 then
            SQL.Add('  AND (IDPATRO = '+FloatToStr(iPatro)+')   ');

         if sHistPadrao <> '' then
            SQL.Add('  AND (HITCODHIST = '''+Copy(sHistPadrao+'          ',1,4)+''')    ');

         if iIdSegregaCriter <> -1 then begin
            SQL.Add('  AND (IDSEGREGACRITER = '+IntToStr(iIdSegregaCriter)+')   ');
            if dDataSegregaCriter <> -1 then
               SQL.Add('  AND (DATASEGREGACRITER = TO_DATE('+ QuotedStr(FormatDateTime('dd/mm/yyyy', dDataSegregaCriter)) +', ''DD/MM/YYYY''))   ');
         end;
         // 29/09/04 - 17193 - Alex - nova estrutura IDSEGREGACONTR
         // 01/11/2006 - retirado do bjunta o segregacontrole, motivo:
         // 1) toda segregação na origem tem um critério para segregação testado acima
         // 2) a data do critério também é testada acima
         // 3) desta forma lançamentos segregados na origem como o mesmo histórico podem ser juntados
         // 4) Lançamentos de carimbo que são segregados na origem passando pela conta de segregação também podem ser juntados
         if iCodDocumento = -1 then
            SQL.Add ('  AND (CODDOCUMENTO IS NULL) ')
         else
            SQL.Add ('  AND (CODDOCUMENTO = ' + IntToStr (iCodDocumento) + ') ');


         _Cds.Data := Data;

      finally

      end;

   if _Cds.isEmpty then begin
      Result := False;
   end else begin
      FNumLancamento := _Cds.FieldByName('LACNUMLAN').AsInteger;

     if _iIdSegregaContr <> _Cds.FieldByName('IDSEGREGACONTR').AsInteger then
       _iIdSegregaContr := _Cds.FieldByName('IDSEGREGACONTR').AsInteger;

   end;
end;

procedure TCtrlImobLancamento.SetNumLancamento(const Value: Integer);
begin
  FNumLancamento := Value;
end;


function TCtrlImobLancamento.AlteraLancaContab(cTipoLanc: Char; IdEmpresa,
  iModuloOrigem, liUsuario, liCodPlano, liUnidNegoc, liSubContaDeb,
  liSubContaCre, iPlanoPrev, iPatro, liPlnCodigo: Double; iNumLan : LongInt;
  sDataLanc, sNumDoc, sHist1, sHist2, sHist3, sHist4, sHist5, sTipoOper,
  cCCustd, cContad, cCCustc, cContac, sCodHist: string; rValLanc: double;
  bJunta, bUsaPlanoPatro: Boolean;
  const iIdSegregaCriter: integer = -1; const dDataSegregaCriter: TDateTime = -1;
  const bUsaMesmaPlanilha: Boolean = true) : Boolean;
var sMens : String;
    bUsaStoredProc : boolean;
    FCodDocumento: Integer;
begin
   Result := True;
   sMens  := '';
   Try
      bUsaStoredProc := UsaStoredProc(trunc(IdEmpresa));

      FCodDocumento := -1;
      _Cds.Data     := GetDataPacket('SELECT IDSEGREGACONTR, CODDOCUMENTO FROM LANCAMENTO WHERE PLNCODIGO = ' + FloatTostr(liPlnCodigo) + ' AND LACNUMLAN = ' + IntToStr(iNumLan) );
      if not _Cds.IsEmpty then begin
        if not _Cds.FieldByName('CODDOCUMENTO').IsNull then
          FCodDocumento := _Cds.FieldByName('CODDOCUMENTO').AsInteger;
        if not _Cds.FieldByName('IDSEGREGACONTR').IsNull then
        begin
          sMens := 'Lançamentos contábeis segregados na origem não podem ser alterados! ' + #13 +
                   'Exclua todos os lançamentos com o Contr. Segregação = ' + _Cds.FieldByName('IDSEGREGACONTR').AsString + ',' + #13 +
                   'e inclua o lançamento novamente!';
          Raise Exception.Create (sMens)
        end;
      end;


      if not ExcluiLancaContab(liUsuario,liPlnCodigo,iModuloOrigem,iNumLan, bUsaPlanoPatro,False) then begin
         sMens:= MessageInfo;
         Raise Exception.Create(sMens);
      end;


      if not bUsaMesmaPlanilha then
        liPlnCodigo := 0;

      if not InsereLancaContab(cTipoLanc, IdEmpresa, iModuloOrigem, liUsuario, liCodPlano,
             liUnidNegoc, liSubContaDeb,liSubContaCre, iPlanoPrev, iPatro, liPlnCodigo,
             iNumLan, sDataLanc, sNumDoc, sHist1, sHist2, sHist3, sHist4, sHist5, sTipoOper,
             cCCustd, cContad, cCCustc, cContac, sCodHist, rValLanc,bJunta, bUsaPlanoPatro,
             iIdSegregaCriter, dDataSegregaCriter, -1, -1,  True,  FCodDocumento) Then begin
         sMens:= MessageInfo;
         Raise Exception.Create(sMens);
      end;

   Except
      On E : Exception do
       begin
         MessageInfo := E.Message;
         Result := False;
       end;
   end;
end;


function TCtrlImobLancamento.RoundCM(fNum : Extended) : Extended;
begin
 Result := strtofloat(Format('%20.2f',[fNum]));
end;

procedure TCtrlImobLancamento.AfterInitialize;
begin
  inherited;
  CtrlPeriodo.initializeas(self);
  CtrlPeriodo.OnMessageInfo := nil;

  CtrlContab.initializeas(self);
  CtrlContaContabil.initializeas(self);
  CtrlHistoContab.initializeas(self);
  CtrlGeral.initializeas(self);
  CtrlPadroes.initializeas(self);
  CtrlImobSegregacao.InitializeAs (self);
  CtrlPlanPrevContabPatro.InitializeAs (self);

end;
procedure TCtrlImobLancamento.SetlcEDePara(const Value: String);
begin
  FlcEDePara := Value;
end;

function TCtrlImobLancamento.FloatToStrPonto(dValor: Double): string;
var
  s :string;
  p :integer;
begin
  s := FloatToStr(dValor);
  p := Pos(',', s);
  if p <> 0 then
     s[p] := '.';
  result := s;
end;

procedure TCtrlImobLancamento.SetlcPeriodoEsp(const Value: Boolean);
begin
  FlcPeriodoEsp := Value;
end;

function TCtrlImobLancamento.SelecionaProvaZero(const liIdPlanilha: Double; const iTipo : integer = 1 ): OleVariant;
var sSql: string;
begin
  sSql := 'SELECT ' + #13 +
          // 09/02/04 Alex 14451 - incluídos os ids para utilização na segregação
          '  L.IDPLANOPREV, L.IDPATRO, L.IDSEGREGACRITER, L.PLNCODIGO, ' + #13 +
          '  P.NOME AS PANOPREV, PE.NOME AS PATRO, S.DESCRICAO AS SEGREGA, L.DATASEGREGACRITER, ' + #13 +
          '  SUM (DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, 0)) AS TOT_DEBITO, ' + #13 +
          '  SUM (DECODE(L.LACDEBCRE, ''C'', L.LACVALOR, 0)) AS TOT_CREDITO, ' + #13 +
          '  SUM (DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, L.LACVALOR*(-1))) AS TOT_SALDO ' + #13 +
          'FROM ' + #13 ;

  if iTipo = 1 then
    sSql := sSql + ' LANCAMENTO '
  else
    sSql := sSql + ' MEMOCALCSEGREGA ';

  sSql := sSql +
          ' L, PLANPREVCONTABIL P, PATRO PT, PESSOA PE, SEGREGACRITER S ' + #13 +
          'WHERE ' + #13 +
          '  L.PLNCODIGO = ' + FloatToStr (liIdPlanilha) + #13 +
          '  AND L.IDPLANOPREV = P.IDPLANOPREV (+)' + #13 +
          '  AND L.IDPATRO = PT.IDPESSOA (+)' + #13 +
          '  AND PT.IDPESSOA = PE.IDPESSOA (+)' + #13 +
          '  AND L.IDSEGREGACRITER = S.IDSEGREGACRITER (+) ' + #13 +
          'GROUP BY ' + #13 +
          '  P.NOME, PE.NOME, S.DESCRICAO, L.DATASEGREGACRITER, L.IDPLANOPREV, L.IDPATRO, L.IDSEGREGACRITER, L.PLNCODIGO ';

  Result := GetDataPacket (sSql);
end;
// fim 07/01/04 Alex 14451

procedure TCtrlImobLancamento.SetPlanoSegregar(const Value: Integer);
begin
  FPlanoSegregar := Value;
end;


function TCtrlImobLancamento.SelecionaLancMemoCalcSegrega( IdPlnCodigo : Double ) : OleVariant;
begin
  SQLPlanilhaLancamento( IdPlnCodigo, 'MEMOCALCSEGREGA' );
  With _Sql Do
  begin
    Prepare;
    ParamByName('PLNCODIGO').asFloat := IdPlnCodigo;
    Result := Data;
  end;
end;


function TCtrlImobLancamento.SQLPlanilhaLancamento( IdPlnCodigo : Double; sTabela: string ): string;
begin
  With _Sql Do
  begin
    SQL.Clear;
    SQL.Add('SELECT ''N'' AS MARCA, U.PLNCODIGO, U.LACNUMLAN, U.UNIDNEGOC, U.IDPLANOPREV,    ');
    SQL.Add('       U.IDSEGREGACRITER, U.DATASEGREGACRITER, U.DESCSEGREGACRITER,   ');
    SQL.Add('       U.IDSEGREGACONTR,                                              ');
    SQL.Add('       U.IDPATRO, U.IDELEMDEMONSTRAT, U.HITCODHIST, U.IDPESSOA,       ');
    SQL.Add('       U.IDMODULO, U.IDUSUARIOINCLUSAO, U.LACVALOR,                   ');
    SQL.Add('       U.TIPCODIGO, MAX(U.SUBCONTADEB) AS SUBCONTADEB, MAX(U.SUBCONTACRE) AS SUBCONTACRE,');
    SQL.Add('       MAX(U.CCUSTDEB) AS CCUSTDEB, MAX(U.CCUSTCRE) AS CCUSTCRE,      ');
    SQL.Add('       MAX(U.PLACONTAD) AS PLACONTAD, MAX(U.PLACONTAC) AS PLACONTAC,  ');
    SQL.Add('       MAX(U.PLACONCORRESPD) AS PLACONCORRESPD, MAX(U.PLACONCORRESPC) AS PLACONCORRESPC,  ');
    SQL.Add('       DECODE(MAX(U.PLAREDUZD),0,NULL,TO_CHAR(MAX(U.PLAREDUZD))) AS PLAREDUZD, DECODE(MAX(U.PLAREDUZC),0,NULL,TO_CHAR(MAX(U.PLAREDUZC))) AS PLAREDUZC,  ');
    SQL.Add('       U.PLANO, U.LACTIPO, U.LACNUMDOC, U.LACHIST1,                   ');
    SQL.Add('       U.LACHIST2, U.LACHIST3, U.LACHIST4, U.LACHIST5,                ');
    SQL.Add('       U.NOMEPATRO,U.NOMEPLANOPREV,                                   ');
    SQL.Add('       MAX(U.TIPCONVOFIDEB) AS TIPCONVOFIDEB, MAX(U.TIPCONVGERDEB) AS TIPCONVGERDEB, ');
    SQL.Add('       MAX(U.TIPCONVGE1DEB) AS TIPCONVGE1DEB, MAX(U.TIPCONVGE2DEB) AS TIPCONVGE2DEB, ');
    SQL.Add('       MAX(U.TIPCONVOFICRE) AS TIPCONVOFICRE, MAX(U.TIPCONVGERCRE) AS TIPCONVGERCRE, ');
    SQL.Add('       MAX(U.TIPCONVGE1CRE) AS TIPCONVGE1CRE, MAX(U.TIPCONVGE2CRE) AS TIPCONVGE2CRE, ');
    SQL.Add('       SUM(U.VALOFIDEB) AS VALOFIDEB, SUM(U.VALGERDEB) AS VALGERDEB,  ');
    SQL.Add('       SUM(U.VALGE1DEB) AS VALGE1DEB, SUM(U.VALGE2DEB) AS VALGE2DEB,  ');
    SQL.Add('       SUM(U.VALOFICRE) AS VALOFICRE, SUM(U.VALGERCRE) AS VALGERCRE,  ');
    SQL.Add('       SUM(U.VALGE1CRE) AS VALGE1CRE, SUM(U.VALGE2CRE) AS VALGE2CRE,  ');
    SQL.Add('       MAX(U.ORIAPLDEB) AS ORIAPLDEB, MAX(U.ORIAPLCRE) AS ORIAPLCRE,  ');
    SQL.Add('       SUM(U.VALHISDEB) AS VALHISDEB, SUM(U.VALHISCRE) AS VALHISCRE,  ');
    SQL.Add('       MAX(U.NOMECONTAD) AS NOMECONTAD, MAX(U.NOMECONTAC) AS NOMECONTAC, U.NOMEATIVPROJ, U.UNECODIGO,');
    SQL.Add('       MAX(U.NOMESUBCONTAD) AS NOMESUBCONTAD,MAX(U.NOMESUBCONTAC) AS NOMESUBCONTAC, ');
    SQL.Add('       MAX(U.NOMECCUSTOD) AS NOMECCUSTOD, MAX(U.NOMECCUSTOC) AS NOMECCUSTOC');
    SQL.Add('FROM ');
    SQL.Add('(SELECT L.PLNCODIGO, L.LACNUMLAN, L.UNIDNEGOC, L.IDPLANOPREV,                     ');
    SQL.Add('        L.IDSEGREGACRITER, L.DATASEGREGACRITER, S.DESCRICAO AS DESCSEGREGACRITER, ');
    SQL.Add('        L.IDSEGREGACONTR,                                                         ');
    SQL.Add('        L.IDPATRO, L.IDELEMDEMONSTRAT, L.HITCODHIST, L.IDPESSOA,       ');
    SQL.Add('        L.IDMODULO, L.IDUSUARIOINCLUSAO, L.LACVALOR,                   ');
    SQL.Add('        L.TIPCODIGO, L.CODSUBCONTA AS SUBCONTADEB, (0) AS SUBCONTACRE, ');
    SQL.Add('        CC.CODEXTERNO AS CCUSTDEB, ('''') AS CCUSTCRE,              ');
    SQL.Add('        L.PLACONTA AS PLACONTAD, ('''') AS PLACONTAC,                  ');
    SQL.Add('        C.PLACONCORRESP AS PLACONCORRESPD, ('''') AS PLACONCORRESPC,   ');
    SQL.Add('        C.PLAREDUZ AS PLAREDUZD, (0) AS PLAREDUZC,                     ');
    SQL.Add('        L.PLANO, L.LACTIPO, L.LACNUMDOC, L.LACHIST1,                   ');
    SQL.Add('        L.LACHIST2, L.LACHIST3, L.LACHIST4, L.LACHIST5,                ');
    SQL.Add('        L.LACTIPCONVOFICIAL AS TIPCONVOFIDEB, L.LACTIPCONVGER AS TIPCONVGERDEB,   ');
    SQL.Add('        L.LACTIPCONVGEREN1 AS TIPCONVGE1DEB, L.LACTIPCONVGEREN2 AS TIPCONVGE2DEB, ');
    SQL.Add('        ('''') AS TIPCONVOFICRE, ('''') AS TIPCONVGERCRE,                             ');
    SQL.Add('        ('''') AS TIPCONVGE1CRE,('''') AS TIPCONVGE2CRE,                              ');
    SQL.Add('        L.LACVALOFICIAL AS VALOFIDEB, L.LACVALGERENCIAL AS VALGERDEB,             ');
    SQL.Add('        L.LACVALGEREN1 AS VALGE1DEB, L.LACVALGEREN2 AS VALGE2DEB,                 ');
    SQL.Add('        (0) AS VALOFICRE, (0) AS VALGERCRE, (0) AS VALGE1CRE, (0) AS VALGE2CRE,   ');
    SQL.Add('        L.LACORIGEMAPLIC AS ORIAPLDEB, ('''') AS ORIAPLCRE, L.LACVALHIST AS VALHISDEB, (0) AS VALHISCRE,      ');
    SQL.Add('        C.PLANOME AS NOMECONTAD, ('''') AS NOMECONTAC, UN.NOME AS NOMEATIVPROJ, UN.UNECODIGO,                 ');
    SQL.Add('        SC.NOMESUBCONTA AS NOMESUBCONTAD,('''') AS NOMESUBCONTAC, CC.NOME AS NOMECCUSTOD, ('''') AS NOMECCUSTOC, ');
    SQL.Add('        PE.NOME AS NOMEPATRO,PP.NOME AS NOMEPLANOPREV                                                      ');
    SQL.Add(' FROM ' + sTabela + ' L, PLANOCONTA C, UNIDNEGOCIO UN, SUBCONTA SC, CENTCUST CC,PESSOA PE, PLANPREVCONTABIL PP, SEGREGACRITER S ');
    SQL.Add(' WHERE (L.PLNCODIGO = :PLNCODIGO)                ');
    SQL.Add('   AND (L.PLANO = C.PLANO)                       ');
    SQL.Add('   AND (L.LACDEBCRE = ''D'')                     ');
    SQL.Add('   AND (L.PLACONTA = C.PLACONTA)                 ');
    SQL.Add('   AND (L.IDPESSOA = UN.IDPESSOA(+))             ');
    SQL.Add('   AND (L.UNIDNEGOC = UN.UNIDNEGOC(+))           ');
    SQL.Add('   AND (L.IDPESSOA = SC.IDPESSOA(+))             ');
    SQL.Add('   AND (L.CODSUBCONTA = SC.CODSUBCONTA(+))       ');
    SQL.Add('   AND (L.IDEMPRESA = CC.IDEMPRESA(+))           ');
    SQL.Add('   AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) ');
    SQL.Add('   AND (L.IDPATRO        = PE.IDPESSOA(+))       ');
    SQL.Add('   AND (L.IDPLANOPREV    = PP.IDPLANOPREV(+))    ');
    SQL.Add('   AND (L.IDSEGREGACRITER= S.IDSEGREGACRITER(+)) ');
    SQL.Add('UNION                                            ');
    SQL.Add(' SELECT L.PLNCODIGO, L.LACNUMLAN, L.UNIDNEGOC, L.IDPLANOPREV,          ');
    SQL.Add('        L.IDSEGREGACRITER, L.DATASEGREGACRITER, S.DESCRICAO AS DESCSEGREGACRITER, ');
    SQL.Add('        L.IDSEGREGACONTR,                                                         ');
    SQL.Add('        L.IDPATRO, L.IDELEMDEMONSTRAT, L.HITCODHIST, L.IDPESSOA,       ');
    SQL.Add('        L.IDMODULO, L.IDUSUARIOINCLUSAO, L.LACVALOR,                   ');
    SQL.Add('        L.TIPCODIGO, (0) AS SUBCONTADEB, L.CODSUBCONTA AS SUBCONTACRE, ');
    SQL.Add('        ('''') AS CCUSTDEB, CC.CODEXTERNO AS CCUSTCRE,              ');
    SQL.Add('        ('''') AS PLACONTAD, L.PLACONTA AS PLACONTAC,                  ');
    SQL.Add('        ('''') AS PLACONCORRESPD, C.PLACONCORRESP AS PLACONCORRESPC,   ');
    SQL.Add('        (0) AS PLAREDUZD, C.PLAREDUZ AS PLAREDUZC,                     ');
    SQL.Add('        L.PLANO, L.LACTIPO, L.LACNUMDOC, L.LACHIST1,                   ');
    SQL.Add('        L.LACHIST2, L.LACHIST3, L.LACHIST4, L.LACHIST5,                ');
    SQL.Add('        ('''') AS TIPCONVOFIDEB, ('''') AS TIPCONVGERDEB,                             ');
    SQL.Add('        ('''') AS TIPCONVGE1DEB,('''') AS TIPCONVGE2DEB,                              ');
    SQL.Add('        L.LACTIPCONVOFICIAL AS TIPCONVOFICRE, L.LACTIPCONVGER AS TIPCONVGERCRE,   ');
    SQL.Add('        L.LACTIPCONVGEREN1 AS TIPCONVGE1CRE, L.LACTIPCONVGEREN2 AS TIPCONVGE2CRE, ');
    SQL.Add('        (0) AS VALOFIDEB, (0) AS VALGERDEB, (0) AS VALGE1DEB, (0) AS VALGE2DEB,   ');
    SQL.Add('        L.LACVALOFICIAL AS VALOFICRE, L.LACVALGERENCIAL AS VALGERCRE,             ');
    SQL.Add('        L.LACVALGEREN1 AS VALGE1CRE, L.LACVALGEREN2 AS VALGE2CRE,                 ');
    SQL.Add('        ('''') AS ORIAPLDEB, L.LACORIGEMAPLIC AS ORIAPLCRE, (0) AS VALHISDEB, L.LACVALHIST AS VALHISCRE,       ');
    SQL.Add('        ('''') AS NOMECONTAD, C.PLANOME AS NOMECONTAC, UN.NOME AS NOMEATIVPROJ, UN.UNECODIGO,                  ');
    SQL.Add('        ('''') AS NOMESUBCONTAD, SC.NOMESUBCONTA AS NOMESUBCONTAC, ('''') AS NOMECCUSTOD, CC.NOME AS NOMECCUSTOC, ');
    SQL.Add('        PE.NOME AS NOMEPATRO,PP.NOME AS NOMEPLANOPREV                                                      ');
    SQL.Add(' FROM ' + sTabela + ' L, PLANOCONTA C, UNIDNEGOCIO UN, SUBCONTA SC, CENTCUST CC,PESSOA PE, PLANPREVCONTABIL PP, SEGREGACRITER S   ');
    SQL.Add(' WHERE (L.PLNCODIGO      = :PLNCODIGO)                    ');
    SQL.Add('   AND (L.PLANO          = C.PLANO)                       ');
    SQL.Add('   AND (L.LACDEBCRE      = ''C'')                         ');
    SQL.Add('   AND (L.PLACONTA       = C.PLACONTA)                    ');
    SQL.Add('   AND (L.IDPESSOA       = UN.IDPESSOA(+))                ');
    SQL.Add('   AND (L.UNIDNEGOC      = UN.UNIDNEGOC(+))               ');
    SQL.Add('   AND (L.IDPESSOA       = SC.IDPESSOA(+))                ');
    SQL.Add('   AND (L.CODSUBCONTA    = SC.CODSUBCONTA(+))             ');
    SQL.Add('   AND (L.IDEMPRESA      = CC.IDEMPRESA(+))               ');
    SQL.Add('   AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))          ');
    SQL.Add('   AND (L.IDPATRO        = PE.IDPESSOA(+))                ');
    SQL.Add('   AND (L.IDPLANOPREV    = PP.IDPLANOPREV(+))             ');
    SQL.Add('   AND (L.IDSEGREGACRITER= S.IDSEGREGACRITER(+)) ) U      ');
    SQL.Add('GROUP BY U.PLNCODIGO, U.LACNUMLAN, U.UNIDNEGOC, U.IDPLANOPREV,    ');
    SQL.Add('         U.IDSEGREGACRITER, U.DATASEGREGACRITER, U.DESCSEGREGACRITER, ');
    SQL.Add('         U.IDSEGREGACONTR,                                            ');
    SQL.Add('         U.IDPATRO, U.IDELEMDEMONSTRAT, U.HITCODHIST, U.IDPESSOA, ');
    SQL.Add('         U.IDMODULO, U.IDUSUARIOINCLUSAO, U.LACVALOR,             ');
    SQL.Add('         U.PLANO, U.LACTIPO, U.LACNUMDOC, U.LACHIST1,             ');
    SQL.Add('         U.LACHIST2, U.LACHIST3, U.LACHIST4, U.LACHIST5,          ');
    SQL.Add('         U.TIPCODIGO,U.NOMEATIVPROJ, U.UNECODIGO,                 ');
    SQL.Add('         U.NOMEPATRO,U.NOMEPLANOPREV                              ');

    if sTabela = 'LANCAMENTO' then
      SQL.Add('ORDER BY U.PLNCODIGO, U.LACNUMLAN                               ')
    else
      SQL.Add('ORDER BY U.PLNCODIGO, U.IDSEGREGACONTR, U.LACNUMLAN             ');
  end;
end;

function TCtrlImobLancamento.GetProvaZero(const liIdPlanilha: Double): OleVariant;
var
  sSQL: string;
begin
  sSQL :=
   ' SELECT UN.IDPLANOPREV, '+
         ' UN.IDPATRO, '+
         ' P.NOME AS PANOPREV, '+
         ' PE.NOME AS PATRO, '+
         ' S.DESCRICAO AS SEGREGA, '+
         ' UN.DATASEGREGACRITER, '+
         ' SUM (VALOR) AS VALOR '+
   ' FROM  PLANPREVCONTABIL P, '+
         ' PATRO PT, '+
         ' PESSOA PE, '+
         ' SEGREGACRITER S, '+
        '( '+
          ' SELECT L.PLNCODIGO, L.IDPLANOPREV, L.IDPATRO, L.IDSEGREGACRITER, L.DATASEGREGACRITER, SUM(DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, L.LACVALOR*-1)) VALOR '+
          ' FROM  LANCAMENTO L '+
          ' WHERE L.PLNCODIGO = ' + floattostr (liidplanilha) +
          ' GROUP BY L.PLNCODIGO, L.IDPLANOPREV, L.IDPATRO, L.IDSEGREGACRITER, L.DATASEGREGACRITER '+
          ' UNION '+
          ' SELECT  M.PLNCODIGO, M.IDPLANOPREV, M.IDPATRO, M.IDSEGREGACRITER, M.DATASEGREGACRITER, SUM(DECODE(M.LACDEBCRE, ''D'', M.LACVALOR, M.LACVALOR*-1)) VALOR '+
          ' FROM  MEMOCALCSEGREGA M '+
          ' WHERE M.PLNCODIGO = ' + floattostr (liidplanilha) +
          ' GROUP BY M.PLNCODIGO, M.IDPLANOPREV, M.IDPATRO, M.IDSEGREGACRITER, M.DATASEGREGACRITER '+
        ') UN '+
   ' WHERE  UN.IDPLANOPREV = P.IDPLANOPREV (+) '+
   '   AND UN.IDPATRO = PT.IDPESSOA (+) '+
   '   AND PT.IDPESSOA = PE.IDPESSOA (+) '+
   '   AND UN.IDSEGREGACRITER = S.IDSEGREGACRITER (+) '+
   ' GROUP BY P.NOME, PE.NOME, S.DESCRICAO, UN.DATASEGREGACRITER, UN.IDPLANOPREV, UN.IDPATRO ';

  Result := GetDataPacket (sSql);
end;

function TCtrlImobLancamento.getProvaZero(exercicio,
  periodo: integer): OleVariant;
var
  sSQL: string;
begin
   sSQL :=
      ' SELECT DISTINCT PLNCODIGO ' +
      'FROM ' +
      '(SELECT P.PLNCODIGO, m.IDSEGREGACRITER, m.DATASEGREGACRITER, m.IDPLANOPREV, m.IDPATRO, ' +
      '        SUM (DECODE(m.LACDEBCRE, ''D'', m.LACVALOR, m.LACVALOR*(-1))) AS VALOR ' +
      ' FROM MEMOCALCSEGREGA M, PLANILHA P ' +
      ' WHERE P.PEREXERCICIO = ' + IntToStr(exercicio) +
      '       AND P.PERNUMERO = ' + IntToStr(periodo) +
      '       AND M.PLNCODIGO = P.PLNCODIGO ' +
      ' GROUP BY P.PLNCODIGO, M.IDSEGREGACRITER, M.DATASEGREGACRITER, M.IDPLANOPREV, M.IDPATRO ' +
      ' UNION ' +
      ' SELECT P.PLNCODIGO, L.IDSEGREGACRITER, L.DATASEGREGACRITER, L.IDPLANOPREV, L.IDPATRO, ' +
      '        SUM (DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, L.LACVALOR*(-1))) AS VALOR ' +
      ' FROM LANCAMENTO L, PLANILHA P ' +
      ' WHERE P.PEREXERCICIO = ' + IntToStr(exercicio) +
      '       AND P.PERNUMERO = ' + IntToStr(periodo) +
      '       AND L.PLNCODIGO = P.PLNCODIGO ' +
      ' GROUP BY P.PLNCODIGO, L.IDSEGREGACRITER, L.DATASEGREGACRITER, L.IDPLANOPREV, L.IDPATRO ' +
      ') ' +
      'GROUP BY PLNCODIGO, ' +
      'IDSEGREGACRITER, '+
      'DATASEGREGACRITER, '+
      'IDPLANOPREV, '+
      'IDPATRO '+

      'HAVING SUM(VALOR) <> 0 ' ;
   Result := getDataPacket(sSQL);
end;

function TCtrlImobLancamento.getProvaZeroLancamentoMaisMemoCalc(planilha: double): OleVariant;
var
  sSQL: string;
begin
  try
     sSQL :=
       'SELECT IDPLANOPREV, IDPATRO, PANOPREV, PATRO, SEGREGA, DATASEGREGACRITER, ' +
       '       SUM(TOT_DEBITO) AS TOT_DEBITO, ' +
       '       SUM(TOT_CREDITO) AS TOT_CREDITO, ' +
       '       SUM(TOT_SALDO) AS TOT_SALDO ' +
       'FROM ( ' +
       'SELECT L.IDPLANOPREV, L.IDPATRO, ' +
       '       P.NOME AS PANOPREV, PE.NOME AS PATRO, S.DESCRICAO AS SEGREGA, L.DATASEGREGACRITER, ' +
       '       SUM (DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, 0)) AS TOT_DEBITO, '+
       '       SUM (DECODE(L.LACDEBCRE, ''C'', L.LACVALOR, 0)) AS TOT_CREDITO,' +
       '       SUM (DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, L.LACVALOR*(-1))) AS TOT_SALDO '+
       'FROM    LANCAMENTO L, '+
       '        PLANPREVCONTABIL P,'+
       '        PATRO PT,'+
       '        PESSOA PE, '+
       '        SEGREGACRITER S '+
       'WHERE   L.PLNCODIGO = ' + floatToStr(planilha) +
       '    AND L.IDPLANOPREV = P.IDPLANOPREV (+) ' +
       '    AND L.IDPATRO = PT.IDPESSOA (+) ' +
       '    AND PT.IDPESSOA = PE.IDPESSOA (+) ' +
       '    AND L.IDSEGREGACRITER = S.IDSEGREGACRITER (+) '+
       'GROUP BY P.NOME, ' +
       '         PE.NOME,' +
       '         S.DESCRICAO, '+
       '         L.DATASEGREGACRITER,'+
       '         L.IDPLANOPREV,      '+
       '         L.IDPATRO           '+
       'UNION ALL '+
       'SELECT  M.IDPLANOPREV, M.IDPATRO, ' +
       '        P.NOME AS PANOPREV, PE.NOME AS PATRO, S.DESCRICAO AS SEGREGA, M.DATASEGREGACRITER,'+
       '        SUM (DECODE(M.LACDEBCRE, ''D'', M.LACVALOR, 0)) AS TOT_DEBITO, '+
       '        SUM (DECODE(M.LACDEBCRE, ''C'', M.LACVALOR, 0)) AS TOT_CREDITO,  '+
       '        SUM (DECODE(M.LACDEBCRE, ''D'', M.LACVALOR, M.LACVALOR*(-1))) AS TOT_SALDO '+
       'FROM    MEMOCALCSEGREGA M, '+
       '        PLANPREVCONTABIL P,'+
       '        PATRO PT, '+
       '        PESSOA PE, '+
       '        SEGREGACRITER S '+
       'WHERE   M.PLNCODIGO = ' + floatToStr(planilha) +
       '    AND M.IDPLANOPREV = P.IDPLANOPREV (+) '+
       '    AND M.IDPATRO = PT.IDPESSOA (+) '+
       '    AND PT.IDPESSOA = PE.IDPESSOA (+) '+
       '    AND M.IDSEGREGACRITER = S.IDSEGREGACRITER (+) '+
       'GROUP BY P.NOME, '+
       '     PE.NOME, '+
       '     S.DESCRICAO, '+
       '     M.DATASEGREGACRITER, '+
       '     M.IDPLANOPREV, '+
       '     M.IDPATRO '+
       '     ) ' +
       'GROUP BY IDPLANOPREV, IDPATRO, PANOPREV, PATRO, SEGREGA, DATASEGREGACRITER';

     Result := getDataPacket(sSQL);

    except
     on e:exception do
        MessageInfo := e.message;
    end;
end;

function TCtrlImobLancamento.UsaStoredProc(const idempresa: integer): boolean;
var cds : TClientDataset;
begin
  result := false;
  cds := TClientDataset.Create(nil);
  try
    cds.data := getDataPacket(' SELECT NVL(FLGUSASPLANCASLD, ''N'') AS FLGUSASPLANCASLD FROM PARAMCONTAB WHERE IDPESSOA = '+ intToStr(idempresa) );
    result := cds.fieldByName('FLGUSASPLANCASLD').asString = 'S';
    cds.data := getDataPacket('SELECT OBJECT_NAME FROM ALL_PROCEDURES WHERE OBJECT_NAME =  ''LANCASALDOCONTAB''');
    result := result and (uppercase(cds.fieldByName('OBJECT_NAME').asString) = 'LANCASALDOCONTAB')
  finally
    cds.free;
  end;
end;

//---------------------------------------------------------------------------------------
// Cássio - SOL 92381 KINTANA 394180
// Verifica se existem planos previdenciários definidos para os imóveis armazendos dentro
// do array idImovel, definido como parâmetro da função.
//---------------------------------------------------------------------------------------
function TCtrlImobLancamento.VerificaSegregacaoOrigem(
  IdImovel: array of Integer): boolean;
var
  cdsSegregacaoOrigem : TClientDataSet;
  sSQL :  string;
  i: integer;
begin
  Result := False;
  cdsSegregacaoOrigem := TClientDataSet.Create(nil);
  try
    for i := 0 to Length(IdImovel) -1 do
    begin

      sSQL := 'SELECT IDPATRO,         ' + #10#13 +
              '       IDPLANOPREV,     ' + #10#13 +
              '       PPIPERCENTRATEIO ' + #10#13 +
              '  FROM PLANOPATROXIMOVEL ' + #10#13 +
              ' WHERE IDIMOVEL = ' + IntToStr(IdImovel[i]);
      cdsSegregacaoOrigem.Data := GetDataPacket(sSQL);
      if not cdsSegregacaoOrigem.IsEmpty then
        Result := True
      else
        Result := False;
    end;
  finally
    FreeAndNil(cdsSegregacaoOrigem);
  end;
end;

//---------------------------------------------------------------------------------------
// Cássio - SOL 92381 KINTANA 394180
// Soma todos os valores que possuem um determinado número de Documento.
//---------------------------------------------------------------------------------------
function TCtrlImobLancamento.getValorTotalDocumento(
  iCodDocumento: Integer): Double;
var
  sSQL: string;
begin
  Result := 0;
  _cdsAux := TClientDataSet.Create(nil);
  try
    sSQL := 'SELECT RECPAG, ' + #10#13 +
            '       VLRLANCPAGAR, ' + #10#13 +
            '       VLRLANCRECEB ' + #10#13 +
            '  FROM LANCAMENTOSIMOVEL ' + #10#13 +
            ' WHERE PLNCODIGO = ' + IntToStr(iCodDocumento);
    FazQuery(_cdsAux, sSQL);

    while not _cdsAux.Eof do
    begin
      if _cdsAux.FieldByName('RECPAG').AsString = 'P' then
        Result := Result + _cdsAux.FieldByName('VLRLANCPAGAR').AsFloat
      else
        Result := Result + _cdsAux.FieldByName('VLRLANCRECEB').AsFloat;
      _cdsAux.Next;
    end;
  finally
    FreeAndNil(_cdsAux);
  end;
end;

//---------------------------------------------------------------------------------------
// Cássio - SOL 92381 KINTANA 394180
// Verifica se existem planos previdenciários definidos para o imóvel,
// definido como parâmetro da função.
//---------------------------------------------------------------------------------------
function TCtrlImobLancamento.VerificaSegregacaoOrigem(
  iIdImovel: Integer): Integer;
var
  sSQL: string;
  cdsSegregacaoOrigem : TClientDataSet;
begin
  cdsSegregacaoOrigem := TClientDataSet.Create(nil);
  try
    sSQL := 'SELECT IDPATRO,         ' + #10#13 +
            '       IDPLANOPREV,     ' + #10#13 +
            '       PPIPERCENTRATEIO ' + #10#13 +
            '  FROM PLANOPATROXIMOVEL ' + #10#13 +
            ' WHERE IDIMOVEL = ' + IntToStr(iIdImovel);
    cdsSegregacaoOrigem.Data := GetDataPacket(sSQL);
    Result := cdsSegregacaoOrigem.RecordCount;
  finally
    FreeAndNil(cdsSegregacaoOrigem);
  end;
end;

function TCtrlImobLancamento.VerificaSegregacaoOrigemImovelxBem(iIdImovel: Integer;
   var cdsAux: TClientDataSet): Boolean;
var
  sSQL: string;
begin
  Result := False;
  sSQL := 'SELECT PPI.IDPATRO,                        ' + #10#13 +
          '       PES.NOME AS NOMEPATRO,              ' + #10#13 +
          '       PPI.IDPLANOPREV,                    ' + #10#13 +
          '       PREV.NOME AS NOMEPLANO,             ' + #10#13 +
          '       PPI.PPIPERCENTRATEIO                ' + #10#13 +
          '  FROM PLANOPATROXIMOVEL PPI,              ' + #10#13 +
          '       PESSOA PES,                         ' + #10#13 +
          '       PLANPREVCONTABIL PREV               ' + #10#13 +
          '  WHERE PPI.IDPLANOPREV = PREV.IDPLANOPREV ' + #10#13 +
          '    AND PPI.IDPATRO = PES.IDPESSOA         ' + #10#13 +
          '   AND PPI.IDIMOVEL =  ' + IntToStr(iIdImovel);
  cdsAux.Data := GetDataPacket(sSQL);
  if not cdsAux.IsEmpty then
    Result := True
  else
    Result := False;
end;

function TCtrlImobLancamento.VerificaSegregacaoOrigemBem(
  iIdBem: integer): boolean;
var
  sSQL: string;
  _cdsSegregOrBem : TClientDataSet;
begin
  _cdsSegregOrBem := TClientDataSet.Create(nil);
  try
    sSQL := 'SELECT IDPATRO,         ' + #10#13 +
            '       IDPLANOPREV,     ' + #10#13 +
            '       PPBPERCRATEIO    ' + #10#13 +
            '  FROM PLANOPATROXBEM   ' + #10#13 +
            ' WHERE IDBEM = ' + IntToStr(iIdBem);

    _cdsSegregOrBem.Data := GetDataPacket(sSQL);

    if not _cdsSegregOrBem.IsEmpty then
      Result := True
    else
      Result := False;
  finally
    FreeAndNil(_cdsSegregOrBem);
  end;

end;

function TCtrlImobLancamento.ListaCondPagParc: OleVariant;
var
  sSQL : string;
begin
    sSQL := ' ';
    sSQL :=         '  SELECT                               ';
    sSQL := sSql +  '  LPAD(''1'',18,''1'') AS DOCUMENTO,';
    sSQL := sSql +  '   LPAD(''1'',18,''1'') AS TIPOPAGAMENTO,';
    sSQL := sSql +  '   LPAD(''1'',18,''1'') AS VENCIMENTO,';
    sSQL := sSql +  '   LPAD(''1'',18,''1'') AS PARCELA,';
    sSQL := sSql +  '   LPAD(''1'',18,''1'') AS COMPETENCIA,';
    sSQL := sSql +  '    0       AS VALOR' ;
    sSQL := sSql +  '   FROM ';
    sSQL := sSql +  '   DUAL ';
    sSQL := sSql +  '   WHERE ';
    sSQL := sSql +  '   1 = 2';
    sSQL := sSql +  '   ORDER BY DOCUMENTO,VENCIMENTO ';
    Result := GetDataPacket( sSQL);
end;

end.
