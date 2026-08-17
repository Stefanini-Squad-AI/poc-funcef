unit uCtrlLancamento;

(*==============================================================================
Analista : Alex Pereira
Data     : 05/01/04
Pendência: 14451
Rotina   : InsereLancaContab / FazRateio / AlteraLancContab / RetornaNumLanc
Solução  : Criar a estrutura IDSEGREGACRITER e DATASEGREGACRITER
           no lançamento contábil

Data     : 07/01/04
Rotina   : SelecionaLancamentosEsp

Data     : 08/01/04
Método   : SelecionaProvaZero (Novo) -
           retorna o total do lançamento por plano, patro e critério de segregação

Data     : 19/01/04
Método   : InsereLancaConta / AlteraLancContab
           Retirada a obrigatoriedade de IdSegregaCriter

==============================================================================*)
(*==============================================================================
Analista : Alex Pereira
Data     : 12/12/03
Pendência: 15792
Solução  : Na exclusão de um lançamento contábil não excluir a planilha caso o
           campo PARAMCONTAB.PACNAOAPAGAPLANIL = 1
==============================================================================*)

// 23/10/03 - by Alex - Pend 15148 - Retornar os números do PLNPLANIL NA FUNÇÃO INSERELANCACONTAB

interface

Uses SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uMidasUtil, uCtrlGeral,
     DB, uDataBase, uDbLancamento, uCmControlObject, dbclient, Provider, uCtrlHistoContab,
     uCtrlContab,StdCtrls, ComCtrls, uCtrlPeriodo, uCtrlContaContabil, uDbPlanoSaldo,
     uDbPlanilha,  math, jclMath, uCMTypes , uCMSqlParams,uCtrlPadroes;

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
  TCtrlLancamento = class(TCmControlObject)

  Protected
      procedure AfterInitialize;override;

      procedure DoChangeDataBase; Override;

  private
    Periodo        : TCtrlPeriodo;
    Padroes        : TCtrlPadroes;
    ContaContabil  : TCtrlContaContabil;
    HistoContab    : TCtrlHistoContab;
    Contab         : TCtrlContab;
    Geral          : TCtrlGeral;
    _dbLancamento  : TdbLancamento;
    _dbPlanoSaldo  : TdbPlanoSaldo;
    _dbPlanilha    : TdbPlanilha;
    _sql           : TCmSqlParams;
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
      Constructor Create; Override;
      Destructor  Destroy;Override;

      Function FloatToStrPonto(dValor :Double) :string;
      // Metodos de Regra de negócio
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
               TipoOrdenaLanc : TTipoOrdenaLanc; TipoSomatorio : TTipoSomatorio; bComConta : Boolean ) : OleVariant;

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
                      // 05/01/03 Alex 14451 - Nova estrutura SEGREGACRITER
                      const iIdSegregaCriter: integer = -1; const dDataSegregaCriter: TDateTime = -1) : Boolean;

      {Esta função altera lançamentos de acordo com os parametros passados}
      Function AlteraLancaContab(cTipoLanc : Char; IdEmpresa, iModuloOrigem,
                      liUsuario, liCodPlano, liUnidNegoc, liSubContaDeb,
                      liSubContaCre, iPlanoPrev, iPatro, liPlnCodigo: Double; iNumLan : LongInt;
                      sDataLanc, sNumDoc, sHist1, sHist2,  sHist3,  sHist4,
                      sHist5, sTipoOper, cCCustd, cContad, cCCustc, cContac, sCodHist : string;
                      rValLanc : double; bJunta, bUsaPlanoPatro : Boolean;
                      // 05/01/03 Alex 14451 - Nova estrutura SEGREGACRITER
                      const iIdSegregaCriter: integer = -1; const dDataSegregaCriter: TDateTime = -1) : Boolean;

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

      {Esta function tem como objetivo retornar a ultima planilha gerada de acordo com o parametro}
      Function RetornaProximaPlanilha(idEmpresa : Double;sDataLanc :String; iPeriodo, iExercicio : Integer) : Boolean;

      {Esta function tem como objetivo retornar o numero do lancamento se este existir}
      Function RetornaNumLanc(idEmpresa,liPlnCodigo, liCodPlano, liSubConta, liUnidNegoc,
                              iPlanoPrev, iPatro: Double; sConta, sCentroCusto, sDebCre,sHistPadrao: String;
                              // 05/01/03 Alex 14451 - Nova estrutura SEGREGACRITER
                              const iIdSegregaCriter: integer; const dDataSegregaCriter: tDateTime): Boolean;

      {Esta function tem como objetivo selecionar lançamentos de uma planilha de maneira a ficar os lançamentos de
                                                partida dobrada no mesmo registro}
      Function SelecionaLancamentosEsp(IdPlnCodigo : Double): OleVariant;

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

      function SelecionaProvaZero(const liIdPlanilha: Double): OleVariant;

  end;

implementation

procedure TCtrlLancamento.DoChangeDataBase;
begin
  inherited;
  _dbLancamento.DataBaseName := DataBaseName;
  _dbPlanoSaldo.DataBaseName := DataBaseName;
  _dbPlanilha.DataBaseName   := DataBaseName;
end;


constructor TCtrlLancamento.Create;
begin
  inherited;
  _dbLancamento  := TdbLancamento.Create(Self);
  _dbPlanoSaldo  := TdbPlanoSaldo.Create(Self);
  _dbPlanilha    := TdbPlanilha.Create(Self);
  //
  Periodo        := TCtrlPeriodo.Create;
  Periodo.OnMessageInfo := nil;

  ContaContabil  := TCtrlContaContabil.Create;
  HistoContab    := TCtrlHistoContab.Create;
  Contab         := TCtrlContab.Create;
  Geral          := TCtrlGeral.Create;
  Padroes        := TCtrlPadroes.Create;

  //
  _sql           := TCmSqlParams.Create(nil);
  _sql.ControlObject := Self;

  //
  IniciaVariavelLancamento;
  //
end;

destructor TCtrlLancamento.Destroy;
begin
  inherited;
  FreeAndNil(_dbLancamento);
  FreeAndNil(_dbPlanoSaldo);
  FreeAndNil(_dbPlanilha);
  FreeAndNil(_sql);
  //
  FreeAndNil(Periodo);
  FreeAndNil(ContaContabil);
  FreeAndNil(HistoContab);
  FreeAndNil(Contab);
  FreeAndNil(Geral);
  FreeAndNil(Padroes);
  //

end;

function TCtrlLancamento.BuscaContaContabil(liIdEmpresa,
  liIdPrograma: Integer; sTipRecDes, sCentroCusto, sRecPag: String): String;
begin

  // implementacao Gustavo
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

function TCtrlLancamento.AtuSaldoContas(IdEmpresa, iUnidNegoc, iUsuario,
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
                SQL.Add('  AND (PLACONTA = '''+Copy(trim(sConta)+'                 ',1,18)+''')');
                SQL.Add('  AND (PLSTIPO  = '''+sTipoConta+''')                 ');
                if sCCust = '' then begin
                   SQL.Add('  AND (CODCENTROCUSTO IS NULL)                     ');
                   SQL.Add('  AND (IDEMPRESA IS NULL)                          ');
                end else begin
                   SQL.Add('  AND (CODCENTROCUSTO = '''+Copy(trim(sCCust)+'         ',1,10)+''')');
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
                sSql := sSql + 'PLSORCADODEBITO   = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSORCADODEBITO').AsFloat  +rValOrcado))   + ',';
                sSql := sSql + 'PLSDEBITOOFICIAL  = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSDEBITOOFICIAL').AsFloat +rValOficial))  + ',';
                sSql := sSql + 'PLSDEBITOHIST     = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSDEBITOHIST').AsFloat    +rValHist))     + ',';
                sSql := sSql + 'PLSDEBITOGEREN2   = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSDEBITOGEREN2').AsFloat  +rValGeren2))   + ',';
                sSql := sSql + 'PLSDEBITOGEREN1   = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSDEBITOGEREN1').AsFloat  +rValGeren1))   + ',';
                sSql := sSql + 'PLSDEBITOGER      = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSDEBITOGER').AsFloat     +rValGeren))    + ',';
                sSql := sSql + 'PLSDEBITOCORRENTE = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSDEBITOCORRENTE').AsFloat+rValCorrente)) + ',';

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

                sSql := sSql + 'PLSORCADOCREDITO  = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSORCADOCREDITO').AsFloat +rValOrcado))  + ',';
                sSql := sSql + 'PLSCREDITOOFICIAL = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSCREDITOOFICIAL').AsFloat+rValOficial)) + ',';
                sSql := sSql + 'PLSCREDITOHIST    = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSCREDITOHIST').AsFloat   +rValHist))    + ',';
                sSql := sSql + 'PLSCREDITOGEREN2  = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSCREDITOGEREN2').AsFloat +rValGeren2))  + ',';
                sSql := sSql + 'PLSCREDITOGEREN1  = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSCREDITOGEREN1').AsFloat +rValGeren1))  + ',';
                sSql := sSql + 'PLSCREDITOGER     = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSCREDITOGER').AsFloat    +rValGeren))   + ',';
                sSql := sSql + 'PLSCREDITOCOR     = ' + FloatToStrPonto(RoundCM(_lDataSet.FieldByName('PLSCREDITOCOR').AsFloat    +rValCorrente));
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

function TCtrlLancamento.FazRateio(liEmpresa, liModulo, liUsuario, liCodPlano,
         liPlanilRateio, liPlanoPrev, liPatro, liSubContaCp, liSubContaRt,
         liUnidNegoc: Integer;  sDataLanc, sNumDoc, sTipoOper, sCcustoCp,
         sContaCp, sCodHistCp, sHist1Cp, sHist2Cp, sHist3Cp, sHist4Cp,
         sHist5Cp, sCcustoRt, sContaRt, sCodHistRt, sHist1Rt, sHist2Rt,
         sHist3Rt, sHist4Rt, sHist5Rt, sDebCre: string; dValor: Double;
         bJunta, bUsaPPatro: Boolean;
         // Alex 05/01/04 - nova estrutura SEGREGACRITER. Avaliar
         const iIdSegregaCriter: integer; const dDataSegregaCriter: tDateTime) :Boolean;
var
  sSql,sTipoRateio,sContaD,sContaC,sMens,sCCustoD,sCCustoC :string;
  _cdsPlanilRateio : TClientDataSet;
  _cdsSaldoRateio  : TClientDataSet;
  rValorRateio,  dPlnCodigo : Double;
  sTipoLanc :char;

  iSubContaD,iSubContaC,iUnidNegoc :Integer;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.FazRateio(liEmpresa, liModulo, liUsuario, liCodPlano,
                                 liPlanilRateio, liPlanoPrev, liPatro, liSubContaCp,
                                 liSubContaRt,liUnidNegoc, sDataLanc, sNumDoc, sTipoOper,
                                 sCcustoCp, sContaCp, sCodHistCp, sHist1Cp, sHist2Cp,
                                 sHist3Cp, sHist4Cp, sHist5Cp, sCcustoRt, sContaRt,
                                 sCodHistRt, sHist1Rt, sHist2Rt,  sHist3Rt, sHist4Rt,
                                 sHist5Rt, sDebCre, dValor,bJunta, bUsaPPatro,FRetornoPlnPlanil,
                                 // Alex 05/01/04 - nova estrutura SEGREGACRITER. Avaliar
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

        // *** verifica se a planilha existe antes de fazer o processamento
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
       Periodo.PeriodoEsp := FlcPeriodoEsp;
       If Not Periodo.RetornaPeriodoExercicioDataProc(liEmpresa,sDataLanc)  Then
       Begin
         sMens := Periodo.MessageInfo;
         Raise Exception.Create(sMens);
       End;


       //** Se for do Tipo Percentual, gera os lançamentos na Conta a ser
       // Rateada fazendo o rateio do Valor pelos percentuais

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
                                    // 05/01/03 Alex - nova estrutura SEGREGACRITER
                                    iIdSegregaCriter, dDataSegregaCriter) Then

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
         //** Se for do Tipo Conta Base, verifica se o Centro de Custo da Conta
         // de Rateio foi passado, para se escolher os dados de saldo,
         // (com ou sem Centro de Custo como parâmetro)

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

            sSql := SSql +  '   AND (PEREXERCICIO   = '+ IntToStr(Periodo.Exercicio)+ ') ' +
                            '   AND (PERNUMERO      = '+ IntToStr(Periodo.Exercicio)+ ') ' +
                            '   AND (IDPESSOA       = '+ IntToStr(liEmpresa) + ')) B '+
                            'WHERE  '+
                            '       (S.PLANO     = ' + IntToStr(liCodPlano) + ') '+
                            '   AND (RTRIM(S.PLACONTA)  = ' + Trim(_cdsPlanilRateio.FieldByName('PANCONTABASE').asString) + ') ';

            If sCCustoRt <> '' Then
            Begin
              sSql := sSql + '  AND (RTRIM(CODCENTROCUSTO) = '+ Trim(_cdsPlanilRateio.FieldByName('PANCCUSTOBASE').asString)+ ') '+
                             '  AND (IDEMPRESA      = ' + IntToStr(liEmpresa) + ') ';
            End;

            sSql := sSql +  '   AND (S.PEREXERCICIO   = '+ IntToStr(Periodo.Exercicio)+ ') ' +
                            '   AND (S.PERNUMERO      = '+ IntToStr(Periodo.Periodo)+ ') ' +
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
                    '       AND (PEREXERCICIO    = '+ IntToStr(Periodo.Exercicio)+ ') ' +
                    '       AND (PERNUMERO       = '+ IntToStr(Periodo.Periodo)+ ') ' +
                    '       AND (IDPESSOA        = '+ IntToStr(liEmpresa)+ ')) B '+
                    'WHERE  '+
                    '       (S.PLANO           = ' + IntToStr(liCodPlano) + ') '+
                    '   AND (RTRIM(S.PLACONTA) = ' + Trim(_cdsPlanilRateio.FieldByName('PANCONTABASE').asString) + ') '+
                    '   AND (S.PEREXERCICIO    = '+ IntToStr(Periodo.Exercicio)+ ') ' +
                    '   AND (S.PERNUMERO       = '+ IntToStr(Periodo.Periodo)+ ') ' +
                    '   AND (S.IDPESSOA        = '+ IntToStr(liEmpresa) + ') ' +
                    'GROUP BY ' +
                    '   S.PLANO, S.PLACONTA, S.CODCENTROCUSTO, S.IDEMPRESA, '+
                    '   S.CODSUBCONTA, S.IDPESSOA, S.UNIDNEGOC, B.SALDORATEIO ';


            _cdsSaldoRateio.Data  := GetDataPacket(sSql);
         End;

         //Varre o cds de valores para fazer o Rateio
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
                                      // 05/01/03 Alex - nova estrutura SEGREGACRITER
                                      iIdSegregaCriter, dDataSegregaCriter) Then

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

      //Gera os lançamentos na Conta de Contra-Partida, que só
      // faz se a Conta de Contra-Partida estiver Preenchida
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
                                   // 05/01/03 Alex - nova estrutura SEGREGACRITER
                                   iIdSegregaCriter, dDataSegregaCriter) Then
 
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
        If not Padroes.GravaLogOperacoes(liEmpresa, liModulo, liUsuario, 'Planilhas - Rateio',False) then
           Raise Exception.Create( Padroes.MessageInfo );
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

function TCtrlLancamento.AtuSaldoSintetica(IdEmpresa, iUnidNegoc, iUsuario,
  iPlanoPrev, iPatro, iPlano: Double; iExercicio, iPeriodo: Integer;iSubConta : double;
   sCCust, sConta, sDebCre, sMascara: string; rValCorrente,
  rValOrcado, rValOficial, rValGeren, rValGeren1, rValGeren2,
  rValHist: Double; bUsaPlanoPatro: boolean): Boolean;
var iGrau,iNumEle : Integer;
begin
   Result := True;
   sConta :=trim(sConta);
   iGrau  :=Geral.CalcGrau(sMascara,sConta);
   while iGrau > 0 do begin
      iGrau  :=iGrau-1;
      if iGrau > 0 then begin
         iNumEle:=Geral.CalcNumEleGrau(sMascara,iGrau);
         sConta :=copy(sConta,1,iNumEle);
         Result := AtuSaldoContas(IdEmpresa, iUnidNegoc, iUsuario,
                        iPlanoPrev, iPatro, iPlano, iExercicio, iPeriodo, iSubConta,
                        sCCust, sConta, sDebCre,'S', rValCorrente, rValOrcado, rValOficial,
                        rValGeren, rValGeren1, rValGeren2, rValHist, bUsaPlanoPatro);
         if not Result then break;
      end;
   end;
end;
function TCtrlLancamento.ListModulos(bOrdenaModulo: Boolean): OleVariant;
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

function TCtrlLancamento.SelecionaLancamentos(IdPlnCodigo,IdEmpresa: Double;
  iExercicio, iPeriodo: Integer; TipoPeriodo: TTipoPeriodo; sDataIni,
  sDataFim, sModulos, sTipoOper: String; TipoEfetivado: TTipoEfetivado;
  TipoOutraMoeda: TTipoOutraMoeda;  TipoOrdenaLanc: TTipoOrdenaLanc;
  TipoSomatorio : TTipoSomatorio; bComConta : Boolean): OleVariant;
begin

    With _sql Do
      Try
          SQL.Clear;
          SQL.Add('SELECT                                                        ');
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

          if bComConta then
             SQL.Add('   ,PLANOCONTA C                                           ');

          SQL.Add('WHERE (P.IDPESSOA = '+FloatToStr(IdEmpresa)+')                ');

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
         //
      End;

end;

function TCtrlLancamento.SelecionaLancamentosEsp(IdPlnCodigo : Double): OleVariant;
begin
  // Result := True;
   With _Sql Do
      Try
          SQL.Clear;
          SQL.Add('SELECT ''N'' AS MARCA, U.PLNCODIGO, U.LACNUMLAN, U.UNIDNEGOC, U.IDPLANOPREV,    ');
          // 07/01/04 Alex 14451
          SQL.Add('       U.IDSEGREGACRITER, U.DATASEGREGACRITER, U.DESCSEGREGACRITER,   ');
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
          // 07/01/04 Alex 14451
          SQL.Add('        L.IDSEGREGACRITER, L.DATASEGREGACRITER, S.DESCRICAO AS DESCSEGREGACRITER, ');
          SQL.Add('        L.IDPATRO, L.IDELEMDEMONSTRAT, L.HITCODHIST, L.IDPESSOA,       ');
          SQL.Add('        L.IDMODULO, L.IDUSUARIOINCLUSAO, L.LACVALOR,                   ');
          SQL.Add('        L.TIPCODIGO, L.CODSUBCONTA AS SUBCONTADEB, (0) AS SUBCONTACRE, ');
          SQL.Add('        L.CODCENTROCUSTO AS CCUSTDEB, ('''') AS CCUSTCRE,              ');
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
          SQL.Add(' FROM LANCAMENTO L, PLANOCONTA C, UNIDNEGOCIO UN, SUBCONTA SC, CENTCUST CC,PESSOA PE, PLANPREVCONTABIL PP, SEGREGACRITER S ');
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
          // 07/01/04 Alex 14451
          SQL.Add('        L.IDSEGREGACRITER, L.DATASEGREGACRITER, S.DESCRICAO AS DESCSEGREGACRITER, ');
          SQL.Add('        L.IDPATRO, L.IDELEMDEMONSTRAT, L.HITCODHIST, L.IDPESSOA,       ');
          SQL.Add('        L.IDMODULO, L.IDUSUARIOINCLUSAO, L.LACVALOR,                   ');
          SQL.Add('        L.TIPCODIGO, (0) AS SUBCONTADEB, L.CODSUBCONTA AS SUBCONTACRE, ');
          SQL.Add('        ('''') AS CCUSTDEB, L.CODCENTROCUSTO AS CCUSTCRE,              ');
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
          SQL.Add(' FROM LANCAMENTO L, PLANOCONTA C, UNIDNEGOCIO UN, SUBCONTA SC, CENTCUST CC,PESSOA PE, PLANPREVCONTABIL PP, SEGREGACRITER S   ');
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
          // 07/01/04 Alex 14451
          SQL.Add('         U.IDSEGREGACRITER, U.DATASEGREGACRITER, U.DESCSEGREGACRITER, ');
          SQL.Add('         U.IDPATRO, U.IDELEMDEMONSTRAT, U.HITCODHIST, U.IDPESSOA, ');
          SQL.Add('         U.IDMODULO, U.IDUSUARIOINCLUSAO, U.LACVALOR,             ');
          SQL.Add('         U.PLANO, U.LACTIPO, U.LACNUMDOC, U.LACHIST1,             ');
          SQL.Add('         U.LACHIST2, U.LACHIST3, U.LACHIST4, U.LACHIST5,          ');
          SQL.Add('         U.TIPCODIGO,U.NOMEATIVPROJ, U.UNECODIGO,                 ');
          SQL.Add('         U.NOMEPATRO,U.NOMEPLANOPREV                              ');
          SQL.Add('ORDER BY U.PLNCODIGO, U.LACNUMLAN                                 ');

          Prepare;

          ParamByName('PLNCODIGO').asFloat := IdPlnCodigo;

          Result := Data;

      Finally
         //
      End;
   End;




function TCtrlLancamento.SelecionaPlanilhas(IdPlnCodigo, IdPlanilhaIni,IdPlanilhaFim,IdEmpresa: Double;
  iExercicio, iPeriodo: Integer; TipoPeriodo: TTipoPeriodo; sDataIni,
  sDataFim, sModulos, sTipoOper: String; TipoEfetivado: TTipoEfetivado;
  TipoOrdenaLanc: TTipoOrdenaLanc) : OleVariant;
begin
    //Result := True;
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
        //
      End;
end;

function TCtrlLancamento.EstornaLancaContab(iUsuario,iPlnCodigo, iModuloOrigem,iEmpresa : Double; bUsaPlanoPatro : Boolean; sDataEstorno : String ) : Boolean;
var sHistorico,sCCustoDeb,sCCustoCre,sContaDeb,sContaCre,sMens, sEfetivado : String;
    iPlnCodigoNovo,liSubContaCre, liSubContaDeb :Double;
    iNumLan : LongInt;
    sTipoLanc : Char;
    CdsEstorna : TClientDataSet;
begin
   sMens := '';
   Result := True;
   CdsEstorna := TClientDataSet.Create(nil);
   Try
      _dbPlanilha.Plncodigo.AsFloat := iPlnCodigo;
      if not _dbPlanilha.LoadFromDb then begin
         sMens := 'Planilha não encontrada';
         Raise Exception.Create(sMens);
         //Abort;
      end;
      if iEmpresa  <> _dbPlanilha.idPessoa.AsFloat then begin
         sMens := 'Planilha não pertence a empresa '+FloatToStr(iEmpresa);
         Raise Exception.Create(sMens);
         //Abort;
      end;
      If Not Contab.SelecionaParametrosProc(_dbPlanilha.idPessoa.AsFloat) Then Begin
         sMens := Contab.MessageInfo;
         Abort;
      End;
      Periodo.PeriodoEsp := FlcPeriodoEsp;
      if not Periodo.RetornaPeriodoExercicioDataProc(_dbPlanilha.idPessoa.AsFloat,sDataEstorno) then begin
         sMens := Periodo.MessageInfo;
         Raise Exception.Create(sMens);
         //Abort;
      end;
      if iModuloOrigem = 1 then begin
         if Periodo.TestaPeriodoBloqueadoProc(_dbPlanilha.idPessoa.AsFloat,tbBloqueado,Periodo.Periodo,Periodo.Exercicio,False) then begin
            sMens := Periodo.MessageInfo+' para estorno de lançamento';
            Raise Exception.Create(sMens);
            //Abort;
         end;
         sEfetivado := 'S';
      end else begin
         if Periodo.TestaPeriodoBloqueadoProc(_dbPlanilha.idPessoa.AsFloat,tbBloqOuInt,Periodo.Periodo,Periodo.Exercicio,False) then begin
            sMens := Periodo.MessageInfo+' para estorno de lançamento';
            Raise Exception.Create(sMens);
            //Abort;
         end;
         if not Contab.TestaDataBloqueadaProc(_dbPlanilha.idPessoa.AsFloat,iModuloOrigem,sDataEstorno) then begin
            sMens := Contab.MessageInfo;
            Raise Exception.Create(sMens);
            //Abort;
         end;
         sEfetivado := 'N';
      end;
      //

      CdsEstorna.Data := GetDataPacket('SELECT * FROM LANCAMENTO WHERE (PLNCODIGO = '+FloatToStr(iPlnCodigo)+') ORDER BY LACNUMLAN');

      iPlnCodigoNovo := 0;
      while not CdsEstorna.eof do begin
         if CdsEstorna.FieldByName('LACTIPO').AsString = '2' then begin
            iNumLan := CdsEstorna.FieldByName('LACNUMLAN').AsInteger;
            if CdsEstorna.FieldByName('LACDEBCRE').AsString = 'D' Then Begin
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
               //
               FlcTipConvOfiCre := CdsEstorna.FieldByName('LACTIPCONVOFICIAL').AsString;
               FlcTipConvGerCre := CdsEstorna.FieldByName('LACTIPCONVGER').AsString;
               FlcTipConvGe1Cre := CdsEstorna.FieldByName('LACTIPCONVGEREN1').AsString;
               FlcTipConvGe2Cre := CdsEstorna.FieldByName('LACTIPCONVGEREN2').AsString;
               //
               FlcValOfiDeb := 0;
               FlcValHisDeb := 0;
               FlcValGerDeb := 0;
               FlcValGe1Deb := 0;
               FlcValGe2Deb := 0;
               //
               FlcTipConvOfiDeb := '';
               FlcTipConvGerDeb := '';
               FlcTipConvGe1Deb := '';
               FlcTipConvGe2Deb := '';
               //
               FlcOriAplDeb     := '';
               FlcOriAplCre     := CdsEstorna.FieldByName('LACORIGEMAPLIC').AsString;
            end else begin
               sTipoLanc    := '0';
               FlcValOfiDeb := CdsEstorna.FieldByName('LACVALOFICIAL').AsFloat;
               FlcValHisDeb := CdsEstorna.FieldByName('LACVALHIST').AsFloat;
               FlcValGerDeb := CdsEstorna.FieldByName('LACVALGERENCIAL').AsFloat;
               FlcValGe1Deb := CdsEstorna.FieldByName('LACVALGEREN1').AsFloat;
               FlcValGe2Deb := CdsEstorna.FieldByName('LACVALGEREN2').AsFloat;
               //
               liSubContaCre:= 0;
               liSubContaDeb:= CdsEstorna.FieldByName('CODSUBCONTA').AsFloat;
               sContaCre    := '';
               sContaDeb    := CdsEstorna.FieldByName('PLACONTA').AsString;
               sCCustoCre   := '';
               sCCustoDeb   := CdsEstorna.FieldByName('CODCENTROCUSTO').AsString;
               //
               FlcTipConvOfiDeb := CdsEstorna.FieldByName('LACTIPCONVOFICIAL').AsString;
               FlcTipConvGerDeb := CdsEstorna.FieldByName('LACTIPCONVGER').AsString;
               FlcTipConvGe1Deb := CdsEstorna.FieldByName('LACTIPCONVGEREN1').AsString;
               FlcTipConvGe2Deb := CdsEstorna.FieldByName('LACTIPCONVGEREN2').AsString;
               //
               FlcValOfiCre := 0;
               FlcValHisCre := 0;
               FlcValGerCre := 0;
               FlcValGe1Cre := 0;
               FlcValGe2Cre := 0;
               //
               FlcTipConvOfiCre := '';
               FlcTipConvGerCre := '';
               FlcTipConvGe1Cre := '';
               FlcTipConvGe2Cre := '';
               //
               FlcOriAplCre     := '';
               FlcOriAplDeb     := CdsEstorna.FieldByName('LACORIGEMAPLIC').AsString;
            end;
            CdsEstorna.Next;
            if iNumLan = CdsEstorna.FieldByName('LACNUMLAN').AsFloat then begin
               if CdsEstorna.FieldByName('LACDEBCRE').AsString = 'D' Then begin
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
               end else begin
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
            end else begin
               if not CdsEstorna.Eof then CdsEstorna.Prior;
            end;
         end else begin
            if CdsEstorna.FieldByName('LACDEBCRE').AsString = 'D' Then begin
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
               //
               FlcTipConvOfiCre := CdsEstorna.FieldByName('LACTIPCONVOFICIAL').AsString;
               FlcTipConvGerCre := CdsEstorna.FieldByName('LACTIPCONVGER').AsString;
               FlcTipConvGe1Cre := CdsEstorna.FieldByName('LACTIPCONVGEREN1').AsString;
               FlcTipConvGe2Cre := CdsEstorna.FieldByName('LACTIPCONVGEREN2').AsString;
               //
               FlcValOfiDeb := 0;
               FlcValHisDeb := 0;
               FlcValGerDeb := 0;
               FlcValGe1Deb := 0;
               FlcValGe2Deb := 0;
               //
               FlcTipConvOfiDeb := '';
               FlcTipConvGerDeb := '';
               FlcTipConvGe1Deb := '';
               FlcTipConvGe2Deb := '';
               //
               FlcOriAplDeb     := '';
               FlcOriAplCre     := CdsEstorna.FieldByName('LACORIGEMAPLIC').AsString;
            end else begin
               sTipoLanc    := '0';
               FlcValOfiDeb := CdsEstorna.FieldByName('LACVALOFICIAL').AsFloat;
               FlcValHisDeb := CdsEstorna.FieldByName('LACVALHIST').AsFloat;
               FlcValGerDeb := CdsEstorna.FieldByName('LACVALGERENCIAL').AsFloat;
               FlcValGe1Deb := CdsEstorna.FieldByName('LACVALGEREN1').AsFloat;
               FlcValGe2Deb := CdsEstorna.FieldByName('LACVALGEREN2').AsFloat;
               //
               liSubContaCre:= 0;
               liSubContaDeb:= CdsEstorna.FieldByName('CODSUBCONTA').AsFloat;
               sContaCre    := '';
               sContaDeb    := CdsEstorna.FieldByName('PLACONTA').AsString;
               sCCustoCre   := '';
               sCCustoDeb   := CdsEstorna.FieldByName('CODCENTROCUSTO').AsString;
               //
               FlcTipConvOfiDeb := CdsEstorna.FieldByName('LACTIPCONVOFICIAL').AsString;
               FlcTipConvGerDeb := CdsEstorna.FieldByName('LACTIPCONVGER').AsString;
               FlcTipConvGe1Deb := CdsEstorna.FieldByName('LACTIPCONVGEREN1').AsString;
               FlcTipConvGe2Deb := CdsEstorna.FieldByName('LACTIPCONVGEREN2').AsString;
               //
               FlcValOfiCre := 0;
               FlcValHisCre := 0;
               FlcValGerCre := 0;
               FlcValGe1Cre := 0;
               FlcValGe2Cre := 0;
               //
               FlcTipConvOfiCre := '';
               FlcTipConvGerCre := '';
               FlcTipConvGe1Cre := '';
               FlcTipConvGe2Cre := '';
               //
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
                           // 05/01/03 Alex - voltar e passar parâmetro
                           CdsEstorna.FieldByName('IDSEGREGACRITER').AsInteger,
                           CdsEstorna.FieldByName('DATASEGREGACRITER').AsDateTime) Then begin
            sMens := MessageInfo;
            Raise Exception.Create(sMens);
            //Abort;
         end;
         iPlnCodigoNovo := FRetornoPlnCodigo;
         CdsEstorna.Next;
      end;
      FreeCds([CdsEstorna]);
   Except
       On E : Exception do
       begin
          FreeCds([CdsEstorna]);
          MessageInfo := E.Message;
          Result      := False;
       end;
   end;
end;

function TCtrlLancamento.ExcluiLancaContab(iUsuario,iPlnCodigo, iModuloOrigem : Double; iNumLan : LongInt; bUsaPlanoPatro, bExcluiPlanilha : Boolean ) : Boolean;
var sMens, sEfetivado : String;
    idEmpresa : Double;
    cdsLancamento, _CdsAux {12/12/03 Alex Emergencial Funcef}   : TClientDataSet;
begin
   sMens := '';
   Result := True;
   cdsLancamento   := TClientDataSet.Create(nil);
   // 12/12/03 - Alex - Emergencial Funcef
   _CdsAux := TClientDataSet.Create(nil);
   // fim 12/12/03 - Alex - Emergencial Funcef

   Try
      _dbPlanilha.Plncodigo.AsFloat := iPlnCodigo;
      if not _dbPlanilha.LoadFromDb then begin
         sMens := 'Planilha não encontrada';
         Raise Exception.Create(sMens);
         //Abort;
      end;

      If Not Contab.SelecionaParametrosProc(_dbPlanilha.idPessoa.AsFloat) Then
      Begin
         //Result := False;
         sMens := Contab.MessageInfo;
         Raise Exception.Create(sMens);
         //Abort;
      End;
      Periodo.PeriodoEsp := FlcPeriodoEsp;
      if not Periodo.RetornaPeriodoExercicioDataProc(_dbPlanilha.idPessoa.AsFloat,_dbPlanilha.PlnDatDia.AsString) then begin
         sMens := Periodo.MessageInfo;
         Raise Exception.Create(sMens);
         //Abort;
      end;
      if iModuloOrigem = 1 then begin
         if Periodo.TestaPeriodoBloqueadoProc(_dbPlanilha.idPessoa.AsFloat,tbBloqueado,_dbPlanilha.perNumero.AsInteger,_dbPlanilha.perExercicio.AsInteger,False) then begin
            sMens := Periodo.MessageInfo+' para exclusão de lançamento';
            Raise Exception.Create(sMens);
            //Abort;
         end;
      end else begin
         if Periodo.TestaPeriodoBloqueadoProc(_dbPlanilha.idPessoa.AsFloat,tbBloqOuInt,_dbPlanilha.perNumero.AsInteger,_dbPlanilha.perExercicio.AsInteger,False) then begin
            sMens := Periodo.MessageInfo+' para exclusão de lançamento';
            Raise Exception.Create(sMens);
            //Abort;
         end;
         if not Contab.TestaDataBloqueadaProc(_dbPlanilha.idPessoa.AsFloat,iModuloOrigem, _dbPlanilha.PlnDatDia.AsString) then begin
            sMens := Contab.MessageInfo;
            Raise Exception.Create(sMens);
            //Abort;
         end;
      end;

      sEfetivado := _dbPlanilha.PlnEfetivado.AsString;
      idEmpresa  := _dbPlanilha.idPessoa.AsFloat;

      // 12/12/03 - Alex - Emergencial Funcef
      _CdsAux.Data := GetDataPacket ('SELECT PACNAOAPAGAPLANIL FROM PARAMCONTAB WHERE IDPESSOA = ' +FloatToStr(idEmpresa));
      if _CdsAux.FieldByName('PACNAOAPAGAPLANIL').AsInteger = 1 then
         bExcluiPlanilha := False;
      // fim 12/12/03 - Alex - Emergencial Funcef


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
               //Abort;
            end;
         end;
         cdsLancamento.Data := SelecionaLancamentos(iPlncodigo,idEmpresa,0,0,tpSoPeriodo,'','','','',teAmbos,
                              tomAmbos,tolPlnCodigo,tsSemSoma,False);
         if not cdsLancamento.isEmpty then begin
            while not cdsLancamento.Eof do begin
               _dbLancamento.PlnCodigo.AsFloat := iPlnCodigo;
               _dbLancamento.LacNumLan.AsFloat := cdsLancamento.FieldByName('LACNUMLAN').AsFloat;
               _dbLancamento.LacDebCre.AsString:= cdsLancamento.FieldByName('LACDEBCRE').AsString;
               if _dbLancamento.LoadFromDb then begin
                  if sEfetivado = 'S' then begin
                     if not ContaContabil.BuscaMascaraConta(_dbLancamento.Plano.AsFloat) then begin
                        sMens:=ContaContabil.MessageInfo;
                        Raise Exception.Create(sMens);
                        //Abort;
                     end;
                     if not AtuSaldoContas (IdEmpresa, _dbLancamento.UnidNegoc.AsFloat,
                                           iUsuario, _dbLancamento.idPlanoPrev.AsFloat,
                                           _dbLancamento.idPatro.AsFloat,
                                           _dbLancamento.Plano.AsFloat,
                                           Periodo.Exercicio,Periodo.Periodo,
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
                        //Abort;
                     end;
                     if not AtuSaldoSintetica(IdEmpresa, _dbLancamento.UnidNegoc.AsFloat,
                                           iUsuario, _dbLancamento.idPlanoPrev.AsFloat,
                                           _dbLancamento.idPatro.AsFloat,
                                           _dbLancamento.Plano.AsFloat,
                                           Periodo.Exercicio,Periodo.Periodo,
                                           _dbLancamento.CodSubConta.AsInteger,
                                           _dbLancamento.CodCentroCusto.AsString,
                                           _dbLancamento.PlaConta.AsString,
                                           cdsLancamento.FieldByName('LACDEBCRE').AsString,ContaContabil.MascaraConta,
                                           _dbLancamento.Lacvalor.AsFloat*-1,0,
                                           _dbLancamento.Lacvaloficial.AsFloat*-1,
                                           _dbLancamento.Lacvalgerencial.AsFloat*-1,
                                           _dbLancamento.Lacvalgeren1.AsFloat*-1,
                                           _dbLancamento.Lacvalgeren2.AsFloat*-1,
                                           _dbLancamento.Lacvalhist.AsFloat*-1, bUsaPlanoPatro) then begin
                        sMens := MessageInfo;
                        Raise Exception.Create(sMens);
                        //Abort;
                     end;
                  end;
                  if not _dbLancamento.Delete then begin
                     sMens := _dbLancamento.MessageInfo;
                     Raise Exception.Create(sMens);
                     //Abort;
                  end;
               end;
               cdsLancamento.Next;
            end;
            if bExcluiPlanilha then begin
               if not _dbPlanilha.Delete then begin
                  sMens := _dbPlanilha.MessageInfo;
                  Raise Exception.Create(sMens);
                  //Abort;
               end;
            end;
         end else begin
            sMens := 'Não Existem Lançamentos a serem excluidos';
            Raise Exception.Create(sMens);
            //Abort;
         end;
      end else begin
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
            if sEfetivado = 'S' then begin
               if not ContaContabil.BuscaMascaraConta(_dbLancamento.Plano.AsFloat) then begin
                  sMens:=ContaContabil.MessageInfo;
                  Raise Exception.Create(sMens);
                  //Abort;
               end;
               if not AtuSaldoContas(IdEmpresa, _dbLancamento.UnidNegoc.AsFloat,
                                     iUsuario, _dbLancamento.idPlanoPrev.AsFloat,
                                     _dbLancamento.idPatro.AsFloat,
                                     _dbLancamento.Plano.AsFloat,
                                     Periodo.Exercicio,Periodo.Periodo,
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
                  //Abort;
               end;
               if not AtuSaldoSintetica(IdEmpresa, _dbLancamento.UnidNegoc.AsFloat,
                                     iUsuario, _dbLancamento.idPlanoPrev.AsFloat,
                                     _dbLancamento.idPatro.AsFloat,
                                     _dbLancamento.Plano.AsFloat,
                                     Periodo.Exercicio,Periodo.Periodo,
                                     _dbLancamento.CodSubConta.AsInteger,
                                     _dbLancamento.CodCentroCusto.AsString,
                                     _dbLancamento.PlaConta.AsString,'D',ContaContabil.MascaraConta,
                                     _dbLancamento.Lacvalor.AsFloat*-1,0,
                                     _dbLancamento.Lacvaloficial.AsFloat*-1,
                                     _dbLancamento.Lacvalgerencial.AsFloat*-1,
                                     _dbLancamento.Lacvalgeren1.AsFloat*-1,
                                     _dbLancamento.Lacvalgeren2.AsFloat*-1,
                                     _dbLancamento.Lacvalhist.AsFloat*-1, bUsaPlanoPatro) then begin
                  sMens := MessageInfo;
                  Raise Exception.Create(sMens);
                  //Abort;
               end;
            end;
            if not _dbLancamento.Delete then begin
               sMens := _dbLancamento.MessageInfo;
               Raise Exception.Create(sMens);
               //Abort;
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
            if sEfetivado = 'S' then begin
               if not ContaContabil.BuscaMascaraConta(_dbLancamento.Plano.AsFloat) then begin
                  sMens:=ContaContabil.MessageInfo;
                  Raise Exception.Create(sMens);
                  //Abort;
               end;
               if not AtuSaldoContas(IdEmpresa, _dbLancamento.UnidNegoc.AsFloat,
                                     iUsuario, _dbLancamento.idPlanoPrev.AsFloat,
                                     _dbLancamento.idPatro.AsFloat,
                                     _dbLancamento.Plano.AsFloat,
                                     Periodo.Exercicio,Periodo.Periodo,
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
                  //Abort;
               end;
               if not AtuSaldoSintetica(IdEmpresa, _dbLancamento.UnidNegoc.AsFloat,
                                     iUsuario, _dbLancamento.idPlanoPrev.AsFloat,
                                     _dbLancamento.idPatro.AsFloat,
                                     _dbLancamento.Plano.AsFloat,
                                     Periodo.Exercicio,Periodo.Periodo,
                                     _dbLancamento.CodSubConta.AsInteger,
                                     _dbLancamento.CodCentroCusto.AsString,
                                     _dbLancamento.PlaConta.AsString,'C',ContaContabil.MascaraConta,
                                     _dbLancamento.Lacvalor.AsFloat*-1,0,
                                     _dbLancamento.Lacvaloficial.AsFloat*-1,
                                     _dbLancamento.Lacvalgerencial.AsFloat*-1,
                                     _dbLancamento.Lacvalgeren1.AsFloat*-1,
                                     _dbLancamento.Lacvalgeren2.AsFloat*-1,
                                     _dbLancamento.Lacvalhist.AsFloat*-1, bUsaPlanoPatro) then begin
                  sMens := MessageInfo;
                  Raise Exception.Create(sMens);
                  //Abort;
               end;
            end;
            if not _dbLancamento.Delete then begin
               sMens := _dbLancamento.MessageInfo;
               Raise Exception.Create(sMens);
               //Abort;
            end;
         end;
         if iNumLan = _dbPlanilha.PlnNumLan.AsInteger then
            _dbPlanilha.PlnNumLan.AsFloat := _dbPlanilha.PlnNumLan.AsFloat -1;
         if not _dbPlanilha.UpDate then begin
            sMens := _dbPlanilha.MessageInfo;
            Raise Exception.Create(sMens);
            //Abort;
         end;
      end;
      FRetornoPlnCodigo := iPlnCodigo;
      FreeAndNil(cdsLancamento);
      // 12/12/03 - Alex - Emergencial Funcef
      FreeAndNil(_CdsAux);
      // fim 12/12/03 - Alex - Emergencial Funcef
   Except
       On E : Exception do
       begin
          FreeAndNil(cdsLancamento);
          // 12/12/03 - Alex - Emergencial Funcef
          FreeAndNil(_CdsAux);
          // fim 12/12/03 - Alex - Emergencial Funcef
          MessageInfo := E.Message;
          Result      := False;
       end;
   end;
end;


function TCtrlLancamento.InsereLancaContab(cTipoLanc : Char; IdEmpresa, iModuloOrigem,
                      liUsuario, liCodPlano, liUnidNegoc, liSubContaDeb,
                      liSubContaCre, iPlanoPrev, iPatro, liPlnCodigo: Double; iNumLan : LongInt;
                      sDataLanc, sNumDoc, sHist1, sHist2,  sHist3,  sHist4,
                      sHist5, sTipoOper, cCCustd, cContad, cCCustc, cContac, sCodHist : string;
                      rValLanc : double; bJunta, bUsaPlanoPatro : Boolean;
                      // 05/01/03 Alex 14451 - Nova estrutura SEGREGACRITER
                      const iIdSegregaCriter: integer; const dDataSegregaCriter: TDateTime ) : Boolean;
var rAux : Double;
    sConta, sEfetivado, sMens, sAux : String;
    bIncluiPlanilha, bIncluiLanc : Boolean;
begin
   If Not Contab.SelecionaParametrosProc(IdEmpresa) Then
   Begin
      Result := False;
      MessageInfo := Contab.MessageInfo;
      Exit;
   End;

   Result := True;
   FRetornoPlnCodigo := liPlnCodigo;
   sMens  := '';
   if (Contab.PermiteZero = 'N') and (rValLanc = 0) and (FlcValHisDeb = 0) and (FlcValHisCre = 0)
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
         end else begin
            iPlanoPrev := 0;
            iPatro     := 0;
         end;
         if sTipoOper = '' then begin
            if Contab.ObrigaTipoOper = 'S' then begin
               sMens := 'Obrigatório indicar o Tipo de Operação';
               Raise Exception.Create(sMens);
            end else begin
               sTipoOper := Contab.TipoOperLanca;
            end;
         end;
         Periodo.PeriodoEsp := FlcPeriodoEsp;
         if not Periodo.RetornaPeriodoExercicioDataProc(IdEmpresa,sDataLanc) then begin
            sMens := Periodo.MessageInfo;
            Raise Exception.Create(sMens);
         end;
         if iModuloOrigem = 1 then begin
            if Periodo.TestaPeriodoBloqueadoProc(idEmpresa,tbBloqueado,Periodo.Periodo,Periodo.Exercicio,False) then begin
               sMens := Periodo.MessageInfo+' para lançamento';
               Raise Exception.Create(sMens);
            end;
         end else begin
            if Periodo.TestaPeriodoBloqueadoProc(idEmpresa,tbBloqOuInt,Periodo.Periodo,Periodo.Exercicio,False) then begin
               sMens := Periodo.MessageInfo+' para lançamento';
               Raise Exception.Create(sMens);
            end;
            if not Contab.TestaDataBloqueadaProc(idEmpresa,iModuloOrigem, sDataLanc) then begin
               sMens := Contab.MessageInfo;
               Raise Exception.Create(sMens);
            end;
         end;

         cContaD := Trim(cContaD);
         cContaC := Trim(cContaC);

         if liSubContaDeb < 0 then liSubContaDeb := 0;
         if liSubContaCre < 0 then liSubContaCre := 0;
         //
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
                    if ((cContaD = '') or (cContaC = '')) then begin
                       sMens := 'Para lançamento de partida dobrada obrigatório indicar a conta a débito e a crédito';
                       Raise Exception.Create(sMens);
                       //Abort;
                    end;
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
                    if (cContaD = '') then begin
                       sMens := 'Para lançamento a Débito obrigatório indicar a conta a débito';
                       Raise Exception.Create(sMens);
                       //Abort;
                    end;
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
                    if (cContaC = '') then begin
                       sMens := 'Para lançamento a Crédito obrigatório indicar a conta a crédito';
                       //Abort;
                      Raise Exception.Create(sMens);
                    end;
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
         if not Contab.SelecionaPlanoDataProc(idEmpresa,sDataLanc) then begin
            sMens := 'Plano de Contas Inválido';
            Raise Exception.Create(sMens);
            //Abort;
         end;
         //Faz o DE-Para do plano de contas
         if (liCodPlano <> Contab.PlanoData) and (FlcEDePara = 'N') then begin
            if ContaContabil.FazDeParaConta(idEmpresa,liCodPlano,Contab.PlanoData,cContaD,cCCustD) then begin
               cContaD := ContaContabil.ContaContabilPara;
               if ContaContabil.CentroCustoPara <> '' then
                  cCCustD := ContaContabil.CentroCustoPara;
            end;
            if ContaContabil.FazDeParaConta(idEmpresa,liCodPlano,Contab.PlanoData,cContaC,cCCustC) then begin
               cContaC := ContaContabil.ContaContabilPara;
               if ContaContabil.CentroCustoPara <> '' then
                  cCCustC := ContaContabil.CentroCustoPara;
            end;
            liCodPlano := Contab.PlanoData;
         end;
         if FlcTestaConta or (iModuloOrigem <> 1) then begin
            if cContaD <> '' then begin
               FlcCentroCusto := cCCustd;
               FlcSubConta    := liSubContaDeb;
               if not TestaContaLancamento(cContaD,'D', sDataLanc,liCodPlano,idEmpresa,iModuloOrigem,Periodo.Periodo,Periodo.Exercicio) then begin
                  sMens := MessageInfo;
                  Raise Exception.Create(sMens);
                  //Abort;
               end;
               cCCustd       :=FlcCentroCusto;
               liSubContaDeb :=FlcSubConta;
               // Faz cálculo da outra moeda para débito
               if ContaContabil.MoedaHistorica <> 0 then begin
                  if not RetornaCotacao(ContaContabil.MoedaHistorica,sDataLanc,True) then begin
                     sMens:=MessageInfo+' para a conta a Débito '+cContaD;
                     Raise Exception.Create(sMens);
                     //Abort;
                  end else begin
                     if FValorCotacao <> 0 then
                        FlcValHisDeb := RoundCM(rValLanc / FValorCotacao);
                  end;
               end;
            end;
            if (cContaC <> '') then begin
               FlcCentroCusto:=cCCustC;
               FlcSubConta   :=liSubContaCre;
               if not TestaContaLancamento(cContaC,'C', sDataLanc,liCodPlano,idEmpresa,iModuloOrigem,Periodo.Periodo,Periodo.Exercicio) then begin
                  sMens := MessageInfo;
                  Raise Exception.Create(sMens);
                  //Abort;
               end;
               cCCustc       :=FlcCentroCusto;
               liSubContaCre :=FlcSubConta;
               // Faz cálculo da outra moeda para crédito
               if ContaContabil.MoedaHistorica <> 0 then begin
                  if not RetornaCotacao(ContaContabil.MoedaHistorica,sDataLanc,True) then begin
                     sMens:=MessageInfo+' para a conta a Crédito '+cContaC;
                     Raise Exception.Create(sMens);
                     //Abort;
                  end else begin
                     if FValorCotacao <> 0 then
                        FlcValHisCre := RoundCM(rValLanc / FValorCotacao);
                  end;
               end;
            end;
         end;
         //
         sNumDoc := Copy(Trim(sNumDoc),1,15);
         //
         if (iModuloOrigem = 1) and (FlcTestaConta) then
            sEfetivado := 'S'
         else
            sEfetivado := 'N';
         //
         if (length(trim(sHist1)) > 40) and (sHist2 = '') then begin
            HistoContab.ArrumaHistorico(sHist1);
            sHist1:=HistoContab.Hist1;
            sHist2:=HistoContab.Hist2;
            sHist3:=HistoContab.Hist3;
            sHist4:=HistoContab.Hist4;
            sHist5:=HistoContab.Hist5;
         end;
         if Contab.CaixaAlta = 'S' then begin
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
         //Setar Atividade/Projeto Padrão
         if (liUnidNegoc = 0) then begin
            if Contab.ObrigaAtivProj = 'S' then begin
               sMens := 'Obrigatório indicar a atividade/projeto';
               Raise Exception.Create(sMens);
               //Abort;
            end else begin
               if not RetornaAtivProjPadrao(idEmpresa) then begin
                  sMens:=MessageInfo;
                  Raise Exception.Create(sMens);
                  //Abort;
               end else begin
                  liUnidNegoc := FAtivProjPadrao;
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
                 //Abort;
              end;
              bIncluiPlanilha := False;
              sEfetivado      := _Cds.FieldByName('PLNEFETIVADO').AsString;
            end else begin
               sMens := 'Planilha com código interno '+_Cds.FieldByName('PLNCODIGO').AsString+' não encontrada';
               Raise Exception.Create(sMens);
               //Abort;
            end;
         end;
         if bIncluiPlanilha then begin
            FProxPlanilha  := 1;
            FNumLancamento := 1;
            if not RetornaProximaPlanilha(idEmpresa,sDataLanc, Periodo.Periodo, Periodo.Exercicio) then
              Abort;
            _dbPlanilha.Plnplanil.AsFloat         := FProxPlanilha;
            _dbPlanilha.Plnnumlan.AsFloat         := 1;
            _dbPlanilha.Tipcodigo.AsString        := sTipoOper;
            _dbPlanilha.Plnefetivado.AsString     := sEfetivado;
            _dbPlanilha.Plndatdia.AsDateTime      := StrToDate(sDataLanc);
            _dbPlanilha.Pernumero.AsInteger       := Periodo.Periodo;
            _dbPlanilha.Perexercicio.AsInteger    := Periodo.Exercicio;
            _dbPlanilha.Pancodigo.AsFloat         := FlcPanCodigo;
            _dbPlanilha.Idusuarioinclusao.AsFloat := liUsuario;
            _dbPlanilha.Idpessoa.AsFloat          := idEmpresa;
            _dbPlanilha.Idmodulo.AsFloat          := iModuloOrigem;
            _dbPlanilha.Plnplanestorno.AsFloat    := FlcPlnEstorno;

            if (cTipoLanc = '0') or (cTipoLanc = '2') then begin
               _dbPlanilha.Plntotdeboficial.AsFloat := RoundCM(FlcValOfiDeb);
               _dbPlanilha.Plntotdebhist.AsFloat    := RoundCM(FlcValHisDeb);
               _dbPlanilha.Plntotdebgeren2.AsFloat  := RoundCM(FlcValGe2Deb);
               _dbPlanilha.Plntotdebgeren1.AsFloat  := RoundCM(FlcValGe1Deb);
               _dbPlanilha.Plntotdebger.AsFloat     := RoundCM(FlcValGerDeb);
               _dbPlanilha.Plntotdeb.AsFloat        := RoundCM(rValLanc);
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
               _dbPlanilha.Plntotcre.AsFloat        := RoundCM(rValLanc);
            end else begin
               _dbPlanilha.Plntotcreoficial.AsFloat := 0;
               _dbPlanilha.Plntotcrehist.AsFloat    := 0;
               _dbPlanilha.Plntotcregeren2.AsFloat  := 0;
               _dbPlanilha.Plntotcregeren1.AsFloat  := 0;
               _dbPlanilha.Plntotcreger.AsFloat     := 0;
               _dbPlanilha.Plntotcre.AsFloat        := 0;
            end;

            if not _dbPlanilha.Insert then begin
               sMens := _dbPlanilha.MessageInfo;
               Raise Exception.Create(sMens);
               //Abort;
            end;
         end else begin
            //Verifica bJunta

            if bJunta then begin
               if cTipoLanc = '0' then begin
                  if RetornaNumLanc(idEmpresa,liPlnCodigo, liCodPlano,
                            liSubContaDeb,liUnidNegoc, iPlanoPrev, iPatro, cContaD,
                            cCCustD,'D',sCodHist,
                            // 05/01/04 - Alex 14451 - nova estrutura SEGREGACRITER
                            iIdSegregaCriter, dDataSegregaCriter) then bIncluiLanc := False;
               end else begin
                  if RetornaNumLanc(idEmpresa,liPlnCodigo, liCodPlano,
                            liSubContaCre,liUnidNegoc, iPlanoPrev, iPatro, cContaC,
                            cCCustC,'C',sCodHist,
                            // 05/01/04 - Alex 14451 - nova estrutura SEGREGACRITER
                            iIdSegregaCriter, dDataSegregaCriter) then bIncluiLanc := False;
               end;
            end;
            _dbPlanilha.Plncodigo.AsFloat := liPlnCodigo;
            _dbPlanilha.LoadFromDb;
            if _dbPlanilha.Plndatdia.AsDateTime <> StrToDate(sDataLanc) then begin
               if not RetornaProximaPlanilha(idEmpresa,sDataLanc, Periodo.Periodo, Periodo.Exercicio) then Abort;
               _dbPlanilha.Plnplanil.AsFloat         := FProxPlanilha;
            end;
            _dbPlanilha.Tipcodigo.AsString        := sTipoOper;
            _dbPlanilha.Plnefetivado.AsString     := sEfetivado;
            _dbPlanilha.Plndatdia.AsDateTime      := StrToDate(sDataLanc);
            _dbPlanilha.Pernumero.AsInteger       := Periodo.Periodo;
            _dbPlanilha.Perexercicio.AsInteger    := Periodo.Exercicio;
            _dbPlanilha.Idpessoa.AsFloat          := idEmpresa;
            if bIncluiLanc then begin
               if iNumLan > 0 then begin
                  FNumLancamento := iNumLan;
                  if iNumLan > _dbPlanilha.Plnnumlan.AsInteger then
                     _dbPlanilha.Plnnumlan.AsInteger := iNumLan;
               end else begin
                  _dbPlanilha.Plnnumlan.AsInteger := _dbPlanilha.Plnnumlan.AsInteger + 1;
                  FNumLancamento := _dbPlanilha.Plnnumlan.AsInteger;
               end;
            end;
            _dbPlanilha.Plncodigo.AsFloat := liPlnCodigo;
            _dbPlanilha.Plncodigo.AsFloat := liPlnCodigo;
            _dbPlanilha.Plncodigo.AsFloat := liPlnCodigo;
            if (cTipoLanc = '0') or (cTipoLanc = '2') then begin
               _dbPlanilha.Plntotdeboficial.AsFloat := _dbPlanilha.Plntotdeboficial.AsFloat + RoundCM(FlcValOfiDeb);
               _dbPlanilha.Plntotdebhist.AsFloat    := _dbPlanilha.Plntotdebhist.AsFloat    + RoundCM(FlcValHisDeb);
               _dbPlanilha.Plntotdebgeren2.AsFloat  := _dbPlanilha.Plntotdebgeren2.AsFloat  + RoundCM(FlcValGe2Deb);
               _dbPlanilha.Plntotdebgeren1.AsFloat  := _dbPlanilha.Plntotdebgeren1.AsFloat  + RoundCM(FlcValGe1Deb);
               _dbPlanilha.Plntotdebger.AsFloat     := _dbPlanilha.Plntotdebger.AsFloat     + RoundCM(FlcValGerDeb);
               _dbPlanilha.Plntotdeb.AsFloat        := _dbPlanilha.Plntotdeb.AsFloat        + RoundCM(rValLanc);
            end;
            if (cTipoLanc = '1') or (cTipoLanc = '2') then begin
               _dbPlanilha.Plntotcreoficial.AsFloat := _dbPlanilha.Plntotcreoficial.AsFloat + RoundCM(FlcValOfiCre);
               _dbPlanilha.Plntotcrehist.AsFloat    := _dbPlanilha.Plntotcrehist.AsFloat    + RoundCM(FlcValHisCre);
               _dbPlanilha.Plntotcregeren2.AsFloat  := _dbPlanilha.Plntotcregeren2.AsFloat  + RoundCM(FlcValGe2Cre);
               _dbPlanilha.Plntotcregeren1.AsFloat  := _dbPlanilha.Plntotcregeren1.AsFloat  + RoundCM(FlcValGe1Cre);
               _dbPlanilha.Plntotcreger.AsFloat     := _dbPlanilha.Plntotcreger.AsFloat     + RoundCM(FlcValGerCre);
               _dbPlanilha.Plntotcre.AsFloat        := _dbPlanilha.Plntotcre.AsFloat        + RoundCM(rValLanc);
            end;
            if not _dbPlanilha.Update then begin
               sMens := _dbPlanilha.MessageInfo;
               Raise Exception.Create(sMens);
               //Abort;
            end;
         end;
         if bIncluiLanc then begin

            // 05/01/03 Alex - 14451 nova estrutura SEGREGACRITER
            // acho que não precisa escrever no else.
            if iIdSegregaCriter = -1 then begin
              _dbLancamento.Idsegregacriter.Clear;
              _dbLancamento.Datasegregacriter.Clear;
            end else begin
              _dbLancamento.Idsegregacriter.AsInteger := iIdSegregaCriter;
              _dbLancamento.Datasegregacriter.AsDateTime := dDataSegregaCriter;
            end;
            // Fim 05/01/03 Alex - 14451 nova estrutura SEGREGACRITER

            _dbLancamento.Plncodigo.AsFloat := _dbPlanilha.Plncodigo.AsFloat;
            _dbLancamento.Lacnumlan.AsFloat := FNumLancamento;
            _dbLancamento.Lactipo.AsString  := cTipoLanc;
            _dbLancamento.Unidnegoc.AsFloat := liUnidNegoc;
            _dbLancamento.Idpessoa.AsFloat  := idEmpresa;
            _dbLancamento.Tipcodigo.AsString:= sTipoOper;
            _dbLancamento.Plano.AsFloat     := liCodPlano;
            _dbLancamento.Lacvalor.AsFloat  := RoundCM(rValLanc);
            _dbLancamento.Lacnumdoc.AsString:= sNumDoc;
            _dbLancamento.Lachist1.AsString := sHist1;
            _dbLancamento.Lachist2.AsString := sHist2;
            _dbLancamento.Lachist3.AsString := sHist3;
            _dbLancamento.Lachist4.AsString := sHist4;
            _dbLancamento.Lachist5.AsString := sHist5;
            _dbLancamento.Lacatoutmoeda.AsString    := 'N';
            _dbLancamento.Idusuarioinclusao.AsFloat := liUsuario;
            _dbLancamento.Idplanoprev.AsFloat       := iPlanoPrev;
            _dbLancamento.Idpatro.AsFloat           := iPatro;
            _dbLancamento.Idmodulo.AsFloat          := iModuloOrigem;
            _dbLancamento.Hitcodhist.AsString       := sCodHist;
            _dbLancamento.Idelemdemonstrat.AsFloat  := FlcElemento;
            if cContaD <> '' then begin
               _dbLancamento.Lacdebcre.AsString         := 'D';
               _dbLancamento.Placonta.AsString          := cContaD;
               _dbLancamento.Codcentrocusto.AsString    := cCCustD;
               _dbLancamento.Codsubconta.AsFloat        := liSubContaDeb;
               _dbLancamento.Lacvaloficial.AsFloat      := RoundCM(FlcValOfiDeb);
               _dbLancamento.Lacvalhist.AsFloat         := RoundCM(FlcValHisDeb);
               _dbLancamento.Lacvalgeren2.AsFloat       := RoundCM(FlcValGe2Deb);
               _dbLancamento.Lacvalgeren1.AsFloat       := RoundCM(FlcValGe1Deb);
               _dbLancamento.Lacvalgerencial.AsFloat    := RoundCM(FlcValGerDeb);
               _dbLancamento.Lactipconvoficial.AsString := FlcTipConvOfiDeb;
               _dbLancamento.Lactipconvger.AsString     := FlcTipConvGerDeb;
               _dbLancamento.Lactipconvgeren1.AsString  := FlcTipConvGe1Deb;
               _dbLancamento.Lactipconvgeren2.AsString  := FlcTipConvGe2Deb;
               _dbLancamento.Lacorigemaplic.AsString    := FlcOriAplDeb;
               if cCCustD <> '' then
                  _dbLancamento.Idempresa.AsFloat    := idEmpresa;
               if not _dbLancamento.Insert then begin
                  sMens := _dbLancamento.MessageInfo;
                  Raise Exception.Create(sMens);
                  //Abort;
               end;
            end;
            if cContaC <> '' then begin
               _dbLancamento.Lacdebcre.AsString         := 'C';
               _dbLancamento.Placonta.AsString          := cContaC;
               _dbLancamento.Codcentrocusto.AsString    := cCCustC;
               _dbLancamento.Codsubconta.AsFloat        := liSubContaCre;
               _dbLancamento.Lacvaloficial.AsFloat      := RoundCM(FlcValOfiCre);
               _dbLancamento.Lacvalhist.AsFloat         := RoundCM(FlcValHisCre);
               _dbLancamento.Lacvalgeren2.AsFloat       := RoundCM(FlcValGe2Cre);
               _dbLancamento.Lacvalgeren1.AsFloat       := RoundCM(FlcValGe1Cre);
               _dbLancamento.Lacvalgerencial.AsFloat    := RoundCM(FlcValGerCre);
               _dbLancamento.Lactipconvoficial.AsString := FlcTipConvOfiCre;
               _dbLancamento.Lactipconvger.AsString     := FlcTipConvGerCre;
               _dbLancamento.Lactipconvgeren1.AsString  := FlcTipConvGe1Cre;
               _dbLancamento.Lactipconvgeren2.AsString  := FlcTipConvGe2Cre;
               _dbLancamento.Lacorigemaplic.AsString    := FlcOriAplCre;
               if cCCustC <> '' then
                  _dbLancamento.Idempresa.AsFloat    := idEmpresa;
               if not _dbLancamento.Insert then begin
                  sMens := _dbLancamento.MessageInfo;
                  Raise Exception.Create(sMens);
                  //Abort;
               end;
            end;
         end else begin
            if cContaD <> '' then begin
               _dbLancamento.Plncodigo.AsFloat := _dbPlanilha.Plncodigo.AsFloat;
               _dbLancamento.Lacdebcre.AsString:= 'D';
               _dbLancamento.Lacnumlan.AsFloat := FNumLancamento;
               _dbLancamento.LoadFromDb;
               _dbLancamento.Lacvalor.AsFloat        := _dbLancamento.Lacvalor.AsFloat        + RoundCM(rValLanc);
               _dbLancamento.Lacvaloficial.AsFloat   := _dbLancamento.Lacvaloficial.AsFloat   + RoundCM(FlcValOfiDeb);
               _dbLancamento.Lacvalhist.AsFloat      := _dbLancamento.Lacvalhist.AsFloat      + RoundCM(FlcValHisDeb);
               _dbLancamento.Lacvalgeren2.AsFloat    := _dbLancamento.Lacvalgeren2.AsFloat    + RoundCM(FlcValGe2Deb);
               _dbLancamento.Lacvalgeren1.AsFloat    := _dbLancamento.Lacvalgeren1.AsFloat    + RoundCM(FlcValGe1Deb);
               _dbLancamento.Lacvalgerencial.AsFloat := _dbLancamento.Lacvalgerencial.AsFloat + RoundCM(FlcValGerDeb);
               if not _dbLancamento.UpDate then begin
                  sMens := _dbLancamento.MessageInfo;
                  Raise Exception.Create(sMens);
                  //Abort;
               end;
            end;
            if cContaC <> '' then begin
               _dbLancamento.Plncodigo.AsFloat := _dbPlanilha.Plncodigo.AsFloat;
               _dbLancamento.Lacdebcre.AsString:= 'C';
               _dbLancamento.Lacnumlan.AsFloat := FNumLancamento;
               _dbLancamento.LoadFromDb;
               _dbLancamento.Lacvalor.AsFloat        := _dbLancamento.Lacvalor.AsFloat       + RoundCM(rValLanc);
               _dbLancamento.Lacvaloficial.AsFloat   := _dbLancamento.Lacvaloficial.AsFloat  + RoundCM(FlcValOfiCre);
               _dbLancamento.Lacvalhist.AsFloat      := _dbLancamento.Lacvalhist.AsFloat     + RoundCM(FlcValHisCre);
               _dbLancamento.Lacvalgeren2.AsFloat    := _dbLancamento.Lacvalgeren2.AsFloat   + RoundCM(FlcValGe2Cre);
               _dbLancamento.Lacvalgeren1.AsFloat    := _dbLancamento.Lacvalgeren1.AsFloat   + RoundCM(FlcValGe1Cre);
               _dbLancamento.Lacvalgerencial.AsFloat := _dbLancamento.Lacvalgerencial.AsFloat+ RoundCM(FlcValGerCre);
               if not _dbLancamento.UpDate then begin
                  sMens := _dbLancamento.MessageInfo;
                  Raise Exception.Create(sMens);
                  //Abort;
               end;
            end;
         end;
         //
         FRetornoPlnCodigo := _dbPlanilha.Plncodigo.AsFloat;
         // 23/10/03 - by Alex - Pend 15148 - Retornar os números do PLNPLANIL NA FUNÇÃO INSERELANCACONTAB
         FRetornoPlnPlanil := _dbPlanilha.Plnplanil.AsFloat;
         // FIM 23/10/03 - by Alex - Pend 15148 - Retornar os números do PLNPLANIL NA FUNÇÃO INSERELANCACONTAB

         if sEfetivado = 'S' then begin
            if not ContaContabil.BuscaMascaraConta(liCodPlano) then begin
               sMens:=ContaContabil.MessageInfo;
               Raise Exception.Create(sMens);
               //Abort;
            end;
            if cContaD <> '' then begin
               if not AtuSaldoContas(IdEmpresa, liUnidNegoc,
                                     liUsuario, iPlanoPrev, iPatro, liCodPlano,
                                     Periodo.Exercicio,Periodo.Periodo,
                                     liSubContaDeb, cCCustD,cContaD,'D','A',
                                     rValLanc,0, FlcValOfiDeb,FlcValGerDeb, FlcValGe1Deb,
                                     FlcValGe2Deb, FlcValHisDeb, bUsaPlanoPatro) then begin
                  sMens := MessageInfo;
                  Raise Exception.Create(sMens);
                  //Abort;
               end;
               if not AtuSaldoSintetica(IdEmpresa, liUnidNegoc,
                                     liUsuario, iPlanoPrev, iPatro, liCodPlano,
                                     Periodo.Exercicio,Periodo.Periodo,
                                     liSubContaDeb, cCCustD,cContaD,'D',
                                     ContaContabil.MascaraConta,
                                     rValLanc,0, FlcValOfiDeb,FlcValGerDeb, FlcValGe1Deb,
                                     FlcValGe2Deb, FlcValHisDeb, bUsaPlanoPatro) then begin
                  sMens := MessageInfo;
                  Raise Exception.Create(sMens);
                  //Abort;
               end;
            end;
            if cContaC <> '' then begin
               if not AtuSaldoContas(IdEmpresa, liUnidNegoc,
                                     liUsuario, iPlanoPrev, iPatro, liCodPlano,
                                     Periodo.Exercicio,Periodo.Periodo,
                                     liSubContaCre, cCCustC,cContaC,'C','A',
                                     rValLanc,0, FlcValOfiCre,FlcValGerCre, FlcValGe1Cre,
                                     FlcValGe2Cre, FlcValHisCre, bUsaPlanoPatro) then begin
                  sMens := MessageInfo;
                  Raise Exception.Create(sMens);
                  //Abort;
               end;
               if not AtuSaldoSintetica(IdEmpresa, liUnidNegoc,
                                     liUsuario, iPlanoPrev, iPatro, liCodPlano,
                                     Periodo.Exercicio,Periodo.Periodo,
                                     liSubContaCre, cCCustC,cContaC,'C',
                                     ContaContabil.MascaraConta,
                                     rValLanc,0, FlcValOfiCre,FlcValGerCre, FlcValGe1Cre,
                                     FlcValGe2Cre, FlcValHisCre, bUsaPlanoPatro) then begin
                  sMens := MessageInfo;
                  Raise Exception.Create(sMens);
                  //Abort;
               end;
            end;
         end;
      Except
         On E : Exception do
         begin
            FRetornoPlnCodigo := -1;
            // 23/10/03 - by Alex - Pend 15148 - Retornar os números do PLNPLANIL NA FUNÇÃO INSERELANCACONTAB
            FRetornoPlnPlanil := -1;
            // FIM 23/10/03 - by Alex - Pend 15148 - Retornar os números do PLNPLANIL NA FUNÇÃO INSERELANCACONTAB
            MessageInfo := E.Message;
            Result := False;
         end;
      End;
   end;
   IniciaVariavelLancamento;
end;

procedure TCtrlLancamento.SetlcElemento(const Value: Double);
begin
  FlcElemento := Value;
end;

procedure TCtrlLancamento.SetlcOriAplCre(const Value: String);
begin
  FlcOriAplCre := Value;
end;

procedure TCtrlLancamento.SetlcOriAplDeb(const Value: String);
begin
  FlcOriAplDeb := Value;
end;

procedure TCtrlLancamento.SetlcTestaConta(const Value: Boolean);
begin
  FlcTestaConta := Value;
end;

procedure TCtrlLancamento.SetlcTipConvGe1Cre(const Value: String);
begin
  FlcTipConvGe1Cre := Value;
end;

procedure TCtrlLancamento.SetlcTipConvGe1Deb(const Value: String);
begin
  FlcTipConvGe1Deb := Value;
end;

procedure TCtrlLancamento.SetlcTipConvGe2Cre(const Value: String);
begin
  FlcTipConvGe2Cre := Value;
end;

procedure TCtrlLancamento.SetlcTipConvGe2Deb(const Value: String);
begin
  FlcTipConvGe2Deb := Value;
end;

procedure TCtrlLancamento.SetlcTipConvGerCre(const Value: String);
begin
  FlcTipConvGerCre := Value;
end;

procedure TCtrlLancamento.SetlcTipConvGerDeb(const Value: String);
begin
  FlcTipConvGerDeb := Value;
end;

procedure TCtrlLancamento.SetlcTipConvOfiCre(const Value: String);
begin
  FlcTipConvOfiCre := Value;
end;

procedure TCtrlLancamento.SetlcTipConvOfiDeb(const Value: String);
begin
  FlcTipConvOfiDeb := Value;
end;

procedure TCtrlLancamento.SetlcValGe1Cre(const Value: Double);
begin
  FlcValGe1Cre := Value;
end;

procedure TCtrlLancamento.SetlcValGe1Deb(const Value: Double);
begin
  FlcValGe1Deb := Value;
end;

procedure TCtrlLancamento.SetlcValGe2Cre(const Value: Double);
begin
  FlcValGe2Cre := Value;
end;

procedure TCtrlLancamento.SetlcValGe2Deb(const Value: Double);
begin
  FlcValGe2Deb := Value;
end;

procedure TCtrlLancamento.SetlcValGerCre(const Value: Double);
begin
  FlcValGerCre := Value;
end;

procedure TCtrlLancamento.SetlcValGerDeb(const Value: Double);
begin
  FlcValGerDeb := Value;
end;

procedure TCtrlLancamento.SetlcValHisCre(const Value: Double);
begin
  FlcValHisCre := Value;
end;

procedure TCtrlLancamento.SetlcValHisDeb(const Value: Double);
begin
  FlcValHisDeb := Value;
end;

procedure TCtrlLancamento.SetlcValOfiCre(const Value: Double);
begin
  FlcValOfiCre := Value;
end;

procedure TCtrlLancamento.SetlcValOfiDeb(const Value: Double);
begin
  FlcValOfiDeb := Value;
end;


procedure TCtrlLancamento.IniciaVariavelLancamento;
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


function TCtrlLancamento.TestaContaLancamento(sConta, sTipoDC, sDataLanc: String; liCodPlano, idEmpresa, idModulo,iPeriodo,iExercicio :Double): Boolean;
var sMens, sMensDC : String;
begin
   Result := True;
   sMens  := '';
   try
      if sTipoDC = 'D' then sMensDC := ' a Débito ' else sMensDC := ' a Crédito ';
      if not ContaContabil.TestaContaContabilProc(liCodPlano,idEmpresa,iPeriodo,iExercicio, sConta,False, False) then begin
         sMens := 'Conta '+sConta+sMensDC+ContaContabil.MessageInfo;
         Abort;
      end;
      if ContaContabil.ObrigaCentroCusto = 'N' then begin
         FlcCentroCusto := '';
      end else begin
         if FlcCentroCusto = '' then begin
            sMens := 'Conta '+sConta+sMensDC+'Obriga Centro de Custo';
            Abort;
         end;
         if not ContaContabil.TestaContaxCC(liCodPlano,idEmpresa,sConta,FlcCentroCusto) then begin
            sMens := ContaContabil.MessageInfo+sMensDC;
            Abort;
         end;
      end;

      if ContaContabil.ObrigaSubConta = 'S' then begin
         if FlcSubConta = 0 then begin
            sMens := 'Conta '+sConta+sMensDC+' Obriga Subconta';
            Abort;
         end;
         if not ContaContabil.TestaContaxSC(liCodPlano,idEmpresa,FlcSubConta,sConta) then begin
            sMens := ContaContabil.MessageInfo+sMensDC;
            Abort;
         end;
      end else begin
         FlcSubConta := 0;
      end;

      if (ContaContabil.AceitaAlteraContab = 'N') and (idModulo = 1) then begin
         sMens := 'Conta '+sConta+sMensDC+'não permite movimentação pela Contabilidade';
         Abort;
      end;
      if (ContaContabil.ContaBloqueada = 'S') and (ContaContabil.DataBloqueio >= StrToDate(sDataLanc)) then begin
         sMens := 'Conta '+sConta+sMensDC+'está bloqueada até '+DateToStr(ContaContabil.DataBloqueio);
         Abort;
      end;
      if sTipoDC = 'D' then begin
         if FlcTipConvOfiDeb = '' then FlcTipConvOfiDeb := ContaContabil.TipoConvOfi;
         if FlcTipConvGerDeb = '' then FlcTipConvGerDeb := ContaContabil.TipoConvGeren;
         if FlcTipConvGe1Deb = '' then FlcTipConvGe1Deb := ContaContabil.TipoConvGeren1;
         if FlcTipConvGe2Deb = '' then FlcTipConvGe2Deb := ContaContabil.TipoConvGeren2;
      end else begin
         if FlcTipConvOfiCre = '' then FlcTipConvOfiCre := ContaContabil.TipoConvOfi;
         if FlcTipConvGerCre = '' then FlcTipConvGerCre := ContaContabil.TipoConvGeren;
         if FlcTipConvGe1Cre = '' then FlcTipConvGe1Cre := ContaContabil.TipoConvGeren1;
         if FlcTipConvGe2Cre = '' then FlcTipConvGe2Cre := ContaContabil.TipoConvGeren2;
      end;
   Except
      MessageInfo := sMens;
      Result := False;
   end;
end;

procedure TCtrlLancamento.SetlcCentroCusto(const Value: String);
begin
  FlcCentroCusto := Value;
end;

procedure TCtrlLancamento.SetlcSubConta(const Value: Double);
begin
  FlcSubConta := Value;
end;

procedure TCtrlLancamento.SetlcPanCodigo(const Value: Double);
begin
  FlcPanCodigo := Value;
end;

procedure TCtrlLancamento.SetlcPlnEstorno(const Value: Double);
begin
  FlcPlnEstorno := Value;
end;

function TCtrlLancamento.RetornaCotacao(iMoeda: Double;
  sData: String; bExato : Boolean): Boolean;
var sNome, sPeriodo : String;
begin
   {Funcão implementada na Aplicação Servidora}
{   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.RetornaCotacao(iMoeda, sData ,bExato);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else begin  }
      Result := True;
      {** GUSTAVO VIEGAS 23/04/2002 **}
      _Cds.Data := GetDataPacket( 'SELECT  MOEDESC, MOEPERIODICIDADE          ' +
                                  'FROM MOEDA                                 ' +
                                  'WHERE (MOECODIGO = '+FloatToStr(iMoeda)+') ');

      if _Cds.isEmpty then begin
         MessageInfo := 'Moeda '+FloatToStr(iMoeda)+' não existe no cadastro';
         Result := False;
      end else begin
         sNome    := _Cds.FieldByName('MOEDESC').AsString;
         sPeriodo := _Cds.FieldByName('MOEPERIODICIDADE').AsString;

         {** GUSTAVO VIEGAS 23/04/2002 **}
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
             //
           end;

         if _Cds.isEmpty then begin
            MessageInfo := 'Moeda '+sNome+' não tem cotação para o dia '+sData;
            Result := False;
         end else begin
            FValorCotacao := _Cds.FieldByName('COTVALOR').AsFloat;
         end;
      end;
end;

procedure TCtrlLancamento.SetValorCotacao(const Value: Double);
begin
  FValorCotacao := Value;
end;

function TCtrlLancamento.RetornaAtivProjPadrao(idEmpresa: Double): Boolean;
begin
      Result := True;
      {** GUSTAVO VIEGAS 23/04/2002 **}
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

procedure TCtrlLancamento.SetAtivProjPadrao(const Value: Double);
begin
  FAtivProjPadrao := Value;
end;

procedure TCtrlLancamento.SetProxPlanilha(const Value: Double);
begin
  FProxPlanilha := Value;
end;

function TCtrlLancamento.RetornaProximaPlanilha(idEmpresa : Double;sDataLanc: String; iPeriodo,
  iExercicio: Integer): Boolean;
var iAno,iMes,iDia : Word;
    sNomeSequence : String;
begin
   If Not Contab.SelecionaParametrosProc(idEmpresa) Then
   Begin
      Result := False;
      MessageInfo := Contab.MessageInfo;
      Exit;
   End;

   Result := True;

   {** GUSTAVO VIEGAS 23/04/2002 **}
   With _sql Do
      Try
        SQL.Clear;
        SQL.Add('SELECT MAX(PLNPLANIL) AS ULTPLANILHA      ');
        SQL.Add('FROM PLANILHA                             ');
        SQL.Add('WHERE (IDPESSOA = '+FloatToStr(idEmpresa)+') ');
        if Contab.NumeracaoPlanilha = 'D' then
           SQL.Add('  AND (PLNDATDIA = TO_DATE('''+sDataLanc+''',''DD/MM/YYYY'')) ');
        if Contab.NumeracaoPlanilha = 'P' then
           SQL.Add('  AND (PERNUMERO = '+IntToStr(iPeriodo)+') ');
        if (Contab.NumeracaoPlanilha = 'E') or (Contab.NumeracaoPlanilha = 'P') then
           SQL.Add('  AND (PEREXERCICIO = '+IntToStr(iExercicio)+') ');

        _Cds.Data := Data;
     finally
       //
     end;

   if _Cds.isEmpty then begin
      FProxPlanilha := 1;
   end else begin
      FProxPlanilha := _Cds.FieldByName('ULTPLANILHA').AsFloat+1;
   end;
   //Versão Nova
   // Gustavo deverá alterar o GETSEQUENCE
   DecodeDate(StrToDate(sDataLanc),iAno,iMes,iDia);
   sNomeSequence := 'PLAN';
   if Contab.NumeracaoPlanilha = 'D' then
      sNomeSequence := 'PLAND'+Trim(IntToStr(iDia))+Trim(IntToStr(iMes))+Trim(IntToStr(iAno))+'E'+trim(FloatToStr(idEmpresa));
   if Contab.NumeracaoPlanilha = 'P' then
      sNomeSequence := 'PLANP'+Trim(IntToStr(iPeriodo))+Trim(IntToStr(iExercicio))+'E'+trim(FloatToStr(idEmpresa));
   if Contab.NumeracaoPlanilha = 'E' then
      sNomeSequence := 'PLANE'+Trim(IntToStr(iExercicio))+'E'+trim(FloatToStr(idEmpresa));
   //FProxPlanilha := GetSequence(sNomeSequence,FProxPlanilha);
end;

function TCtrlLancamento.RetornaNumLanc(idEmpresa,liPlnCodigo,
  liCodPlano, liSubConta, liUnidNegoc, iPlanoPrev, iPatro: Double; sConta,
  sCentroCusto, sDebCre,sHistPadrao: String;
  // 05/01/03 Alex 14451 - Nova estrutura SEGREGACRITER
  const iIdSegregaCriter: integer; const dDataSegregaCriter: tDateTime): Boolean;
begin
   Result := True;
   FNumLancamento := 0;
   {** GUSTAVO VIEGAS 23/04/2002 **}
   With _sql Do
      Try
         SQL.Clear;
         SQL.Add('SELECT LACNUMLAN                                ');
         SQL.Add('FROM LANCAMENTO                                 ');
         SQL.Add('WHERE (PLNCODIGO = '+FloatToStr(liPlnCodigo)+') ');
         SQL.Add('  AND (LACDEBCRE = '''+sDebCre+''')             ');
         SQL.Add('  AND (PLACONTA = '''+Copy(sConta+'                  ',1,18)+''')    ');
         SQL.Add('  AND (PLANO = '+FloatToStr(liCodPlano)+')      ');
         if sCentroCusto <> '' then begin
            SQL.Add('  AND (CODCENTROCUSTO = '''+Copy(sCentroCusto+'          ',1,10)+''')    ');
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

         // 05/01/04 - Alex 14451 - nova estrutura SEGREGACRITER
         if iIdSegregaCriter <> -1 then
            SQL.Add('  AND (IDSEGREGACRITER = '+IntToStr(iIdSegregaCriter)+')   ');
         if dDataSegregaCriter <> -1 then
            SQL.Add('  AND (DATASEGREGACRITER = TO_DATE('+ QuotedStr(FormatDateTime('dd/mm/yyyy', dDataSegregaCriter)) +', ''DD/MM/YYYY''))   ');
         // FIM 05/01/04 - Alex 14451 - nova estrutura SEGREGACRITER


         _Cds.Data := Data;
      finally
        //
      end;

   if _Cds.isEmpty then begin
      Result := False;
   end else begin
      FNumLancamento := _Cds.FieldByName('LACNUMLAN').AsInteger;
   end;
end;

procedure TCtrlLancamento.SetNumLancamento(const Value: Integer);
begin
  FNumLancamento := Value;
end;


function TCtrlLancamento.AlteraLancaContab(cTipoLanc: Char; IdEmpresa,
  iModuloOrigem, liUsuario, liCodPlano, liUnidNegoc, liSubContaDeb,
  liSubContaCre, iPlanoPrev, iPatro, liPlnCodigo: Double; iNumLan : LongInt;
  sDataLanc, sNumDoc, sHist1, sHist2, sHist3, sHist4, sHist5, sTipoOper,
  cCCustd, cContad, cCCustc, cContac, sCodHist: string; rValLanc: double;
  bJunta, bUsaPlanoPatro: Boolean;
  // 05/01/03 Alex 14451 - Nova estrutura SEGREGACRITER
  const iIdSegregaCriter: integer; const dDataSegregaCriter: TDateTime ) : Boolean;
var sMens : String;
begin
   Result := True;
   sMens  := '';
   Try
      if not ExcluiLancaContab(liUsuario,liPlnCodigo,iModuloOrigem,iNumLan, bUsaPlanoPatro,False) then begin
         sMens:=MessageInfo;
         Raise Exception.Create(sMens);
         //Abort;
      end;
      if not InsereLancaContab(cTipoLanc, IdEmpresa, iModuloOrigem, liUsuario, liCodPlano,
             liUnidNegoc, liSubContaDeb,liSubContaCre, iPlanoPrev, iPatro, liPlnCodigo,
             iNumLan, sDataLanc, sNumDoc, sHist1, sHist2, sHist3, sHist4, sHist5, sTipoOper,
             cCCustd, cContad, cCCustc, cContac, sCodHist, rValLanc,bJunta, bUsaPlanoPatro,
             // 05/01/03 Alex 14451 - Nova estrutura SEGREGACRITER
             iIdSegregaCriter, dDataSegregaCriter) Then begin
         sMens:=MessageInfo;
         Raise Exception.Create(sMens);
         //Abort;
      end;
   Except
      On E : Exception do
       begin
         MessageInfo := E.Message;
         Result := False;
       end;
   end;
end;


function TCtrlLancamento.RoundCM(fNum : Extended) : Extended;
begin
 Result := strtofloat(Format('%20.2f',[fNum]));
end;

procedure TCtrlLancamento.AfterInitialize;
begin
  inherited;
  Periodo.initializeas(self);
  Periodo.OnMessageInfo := nil;

  Contab.initializeas(self);
  ContaContabil.initializeas(self);
  HistoContab.initializeas(self);
  Geral.initializeas(self);
  Padroes.initializeas(self);
end;
procedure TCtrlLancamento.SetlcEDePara(const Value: String);
begin
  FlcEDePara := Value;
end;

function TCtrlLancamento.FloatToStrPonto(dValor: Double): string;
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

procedure TCtrlLancamento.SetlcPeriodoEsp(const Value: Boolean);
begin
  FlcPeriodoEsp := Value;
end;

// 07/01/04 Alex 14451
function TCtrlLancamento.SelecionaProvaZero(const liIdPlanilha: double): OleVariant;
var sSql: string;
begin

  sSql := 'SELECT ' + #13 +
          // 09/02/04 Alex 14451 - incluídos os ids para utilização na segregação
          '  L.IDPLANOPREV, L.IDPATRO, ' + #13 +
          '  P.NOME AS PANOPREV, PE.NOME AS PATRO, S.DESCRICAO AS SEGREGA, L.DATASEGREGACRITER, ' + #13 +
          '  SUM (DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, 0)) AS TOT_DEBITO, ' + #13 +
          '  SUM (DECODE(L.LACDEBCRE, ''C'', L.LACVALOR, 0)) AS TOT_CREDITO, ' + #13 +
          '  SUM (DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, L.LACVALOR*(-1))) AS TOT_SALDO ' + #13 +
          'FROM ' + #13 +
          '  LANCAMENTO L, PLANPREVCONTABIL P, PATRO PT, PESSOA PE, SEGREGACRITER S ' + #13 +
          'WHERE ' + #13 +
          '  L.PLNCODIGO = ' + FloatToStr (liIdPlanilha) + #13 +
          '  AND L.IDPLANOPREV = P.IDPLANOPREV (+)' + #13 +
          '  AND L.IDPATRO = PT.IDPESSOA (+)' + #13 +
          '  AND PT.IDPESSOA = PE.IDPESSOA (+)' + #13 +
          '  AND L.IDSEGREGACRITER = S.IDSEGREGACRITER (+) ' + #13 +
          'GROUP BY ' + #13 +
          '  P.NOME, PE.NOME, S.DESCRICAO, L.DATASEGREGACRITER, L.IDPLANOPREV, L.IDPATRO ';
  Result := GetDataPacket (sSql);
end;
// fim 07/01/04 Alex 14451

end.


