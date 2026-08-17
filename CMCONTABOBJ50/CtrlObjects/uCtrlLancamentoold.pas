unit uCtrlLancamento;

interface

Uses SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     DB, uDataBase, uDbLancamento, uCmControlObject, dbclient, uSistema,Provider, uCtrlHistoContab,
     wwQuery, uCtrlGeral, uCtrlContab,StdCtrls, ComCtrls, uCtrlPeriodo, uCtrlContaContabil, uDbPlanoSaldo, uDbPlanilha,
     math, jclMath,uCtrlListTerceiros,uCtrlSubConta, uCtrlPlanilha,
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF}, uCMSqlParams;

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
  { toapCodigo  => Ordernar as Ativ/Proj por codigo
    toapNome    => Ordernar as Ativ/Proj por nome
  }

  TCtrlLancamento = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure DoSetConnectionSide; Override;
      procedure DoSetConnectionType; Override;
      procedure DoSetConnection; Override;

  private
    Periodo        : TCtrlPeriodo;
    ContaContabil  : TCtrlContaContabil;
    HistoContab    : TCtrlHistoContab;
    Planilha       : TCtrlPlanilha;
    SubConta       : TCtrlSubConta;
    ListTerceiros  : TCtrlListTerceiros;
    Contab         : TCtrlContab;
    Geral          : TCtrlGeral;
    _dbLancamento  : TdbLancamento;
    _dbPlanoSaldo  : TdbPlanoSaldo;
    _dbPlanilha    : TdbPlanilha;
    FCdsPlanilha      : TClientDataSet;
    FCdsLancamentoEsp : TClientDataSet;
    FCdsLancamento    : TClientDataSet;
    FProgresso: Integer;
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
    FAtivProjPadrao: Double;
    FProxPlanilha: Double;
    FsMensAPS :String;
    FsMensAdd :string;
    FNumLancamento: Integer;
    FStrlImportaExcel :TStrings;
    FContaLinhaTexto :Integer;
    FLinhaTexto :string;
    procedure SetcdsLancamento(const Value: TClientDataSet);
    procedure SetcdsPlanilha(const Value: TClientDataSet);
    procedure SetcdsLancamentoEsp(const Value: TClientDataSet);
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
  public
      Property StrlImportaExcel : TStrings read FStrlImportaExcel write FStrlImportaExcel;
      Property RetornoPlnCodigo : Double read FRetornoPlnCodigo;
      Property ContaLinhaTexto : Integer read FContaLinhaTexto write FContaLinhaTexto;
      Property cdsPlanilha      : TClientDataSet read FcdsPlanilha write SetcdsPlanilha;
      Property cdsLancamentoEsp : TClientDataSet read FcdsLancamentoEsp write SetcdsLancamentoEsp;
      Property cdsLancamento    : TClientDataSet read FcdsLancamento write SetcdsLancamento;
      Property lcElemento      : Double read FlcElemento write SetlcElemento;
      Property ProxPlanilha    : Double read FProxPlanilha write SetProxPlanilha;
      Property NumLancamento   : Integer read FNumLancamento write SetNumLancamento;
      Property LinhaTexto : string read FLinhaTexto write FLinhaTexto;
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
      Property lcValHisCre     : Double read FlcValHisCre write SetlcValHisCre;
      Property lcTestaConta    : Boolean read FlcTestaConta write SetlcTestaConta;
      Property lcSubConta      : Double read FlcSubConta write SetlcSubConta;
      Property lcCentroCusto   : String read FlcCentroCusto write SetlcCentroCusto;
      Property sMensAPS : String read FsMensAPS write FsMensAPS;
      Property Progresso : Integer read FProgresso write FProgresso;
      Property sMensAdd : String read FsMensAdd write FsMensAdd;
      Property ValorCotacao    : Double read FValorCotacao write SetValorCotacao;
      Property AtivProjPadrao  : Double read FAtivProjPadrao write SetAtivProjPadrao;
      Constructor Create; Override;
      Destructor  Destroy;Override;

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
                      rValLanc : double; bJunta, bUsaPlanoPatro : Boolean ) : Boolean;

      {Esta função altera lançamentos de acordo com os parametros passados}
      Function AlteraLancaContab(cTipoLanc : Char; IdEmpresa, iModuloOrigem,
                      liUsuario, liCodPlano, liUnidNegoc, liSubContaDeb,
                      liSubContaCre, iPlanoPrev, iPatro, liPlnCodigo: Double; iNumLan : LongInt;
                      sDataLanc, sNumDoc, sHist1, sHist2,  sHist3,  sHist4,
                      sHist5, sTipoOper, cCCustd, cContad, cCCustc, cContac, sCodHist : string;
                      rValLanc : double; bJunta, bUsaPlanoPatro : Boolean ) : Boolean;

      {Esta função exclui lançamentos de acordo com os parametros passados}
      Function ExcluiLancaContab(iUsuario,iPlnCodigo, iModuloOrigem : Double; iNumLan : LongInt; bUsaPlanoPatro, bExcluiPlanilha : Boolean ) : Boolean;

      {Esta função estorna lançamentos}
      Function EstornaLancaContab(iUsuario,iPlnCodigo, iModuloOrigem, iEmpresa : Double; bUsaPlanoPatro : Boolean; sDataEstorno : String ) : Boolean;

      {Esta função limpa as veriaveis usadas na movimentação de lancamentos}
      Procedure IniciaVariavelLancamento;

      {Esta função conta lançamentos de acordo com os parametros passados}
      Function TestaContaLancamento(sConta, sTipoDC, sDataLanc : String; liCodPlano, idEmpresa, idModulo:Double) : Boolean;

      {Esta function tem como objetivo retornar a cotação de uma moeda }
      Function RetornaCotacao(iMoeda: Double; sData: String; bExato : Boolean): Boolean;

      {Esta function tem como objetivo retornar a Atividade/Projeto padrão}
      Function RetornaAtivProjPadrao(idEmpresa: Double): Boolean;

      {Esta function tem como objetivo retornar a ultima planilha gerada de acordo com o parametro}
      Function RetornaProximaPlanilha(idEmpresa : Double;sDataLanc :String; iPeriodo, iExercicio : Integer) : Boolean;

      {Esta function tem como objetivo retornar o numero do lancamento se este existir}
      Function RetornaNumLanc(idEmpresa,liPlnCodigo, liCodPlano, liSubConta, liUnidNegoc,
                              iPlanoPrev, iPatro: Double; sConta, sCentroCusto, sDebCre: String): Boolean;

      {Esta function tem como objetivo selecionar lançamentos de uma planilha de maneira a ficar os lançamentos de
                                                partida dobrada no mesmo registro}
      Function SelecionaLancamentosEsp(IdPlnCodigo : Double): OleVariant;

      {Esta função tem o objetivo de arrendondar valores}
      Function RoundCM(rValor : Double; iNumCasas : Integer)  : Double;

      {Esta função tem o objetivo de Listar os modulos}
      Function ListModulos( bOrdenaModulo : Boolean  ) : OleVariant;

      {Esta função tem o objetivo de fazer o rateio}
      Function FazRateio(liEmpresa, liModulo, liUsuario, liCodPlano,
               liPlanilRateio, liPlanoPrev, liPatro, liSubContaCp, liSubContaRt,
               liUnidNegoc: Integer;  sDataLanc, sNumDoc, sTipoOper, sCcustoCp,
               sContaCp, sCodHistCp, sHist1Cp, sHist2Cp, sHist3Cp, sHist4Cp,
               sHist5Cp, sCcustoRt, sContaRt, sCodHistRt, sHist1Rt, sHist2Rt,
               sHist3Rt, sHist4Rt, sHist5Rt, sDebCre: string; dValor: Double;
               bJunta, bUsaPPatro: Boolean):Boolean;

      {Esta função processa a importação e integração de lançamentos com a contabilidade}
      Function ImportaLancamentos(dEmpresa:Double;iPlano,iUsuario,iModulo,iContMaxLin,
                                  iNumCommit:Integer; sTipoOper,sCaminho:string;
                                  bTestaConta,bHistCheked,bUsaPPatro:Boolean) : Boolean;

      {Esta função tem o objetivo de importar planilhas excel}
      Function ImportaPlanilhaExcel(dEmpresa:Double;iPlano,iModulo,iUsuario:Integer;
                                   sDataLanc,sTipoOper:string;bUsaPPatro:Boolean) :Boolean;


  end;

implementation

procedure TCtrlLancamento.DoChangeDataBase;
begin
  inherited;
  _dbLancamento.DataBaseName    := DataBaseName;
  _dbPlanoSaldo.DataBaseName    := DataBaseName;
  _dbPlanilha.DataBaseName      := DataBaseName;
  
  Periodo.DataBase           := Self.DataBase;
  Contab.DataBase            := Self.DataBase;
  ContaContabil.DataBase     := Self.DataBase;
  HistoContab.DataBase       := Self.DataBase;
  Geral.DataBase             := Self.DataBase;
  ListTerceiros.DataBase     := DataBase;
  SubConta.DataBase          := DataBase;
  Planilha.DataBase          := DataBase;  
end;


constructor TCtrlLancamento.Create;
begin
  inherited;
  _dbLancamento  := TdbLancamento.Create;
  _dbPlanoSaldo  := TdbPlanoSaldo.Create;
  _dbPlanilha    := TdbPlanilha.Create;
  
  Periodo        := TCtrlPeriodo.Create;
  ContaContabil  := TCtrlContaContabil.Create;
  HistoContab    := TCtrlHistoContab.Create;
  Contab         := TCtrlContab.Create;
  Geral          := TCtrlGeral.Create;
  ListTerceiros  := TCtrlListTerceiros.Create;
  SubConta       := TCtrlSubConta.Create;
  Planilha       := TCtrlPlanilha.Create;

  FcdsPlanilha      := TClientDataSet.Create(nil);
  FcdsLancamentoEsp := TClientDataSet.Create(nil);
  FcdsLancamento    := TClientDataSet.Create(nil);

  
  IniciaVariavelLancamento;
  
end;

destructor TCtrlLancamento.Destroy;
begin
  inherited;
  _dbLancamento.Free;
  _dbPlanoSaldo.Free;
  _dbPlanilha.Free;
  
  Periodo.Free;
  ContaContabil.Free;
  HistoContab.Free;
  Planilha.Free;
  Contab.Free;
  Geral.Free;
  ListTerceiros.free;
  SubConta.free;

  If FcdsPlanilha.Active Then FcdsPlanilha.Close;
     FcdsPlanilha.Free;

  If FcdsLancamentoEsp.Active Then FcdsLancamentoEsp.Close;
     FcdsLancamentoEsp.Free;

  If FcdsLancamento.Active Then FcdsLancamento.Close;
     FcdsLancamento.Free;

end;

function TCtrlLancamento.ImportaPlanilhaExcel(dEmpresa:Double;iPlano,iModulo,
                iUsuario:Integer;sDataLanc,sTipoOper:string;bUsaPPatro:Boolean) :Boolean;
var
  sSql,sLinha,sTralhaNove,sContaD,sDebCre,sHistorico,sNumDoc,sUnidNegoc :string;
  sContaC,sCCustC,sCCustD,sHist1,sHist2,sHist3,sHist4,sHist5,sValor,cTipoLanc:string;
  iContaLinha,Y,Z,W,X,iSubContaC,iSubContaD,iPatro,iPlanoPrev,i :integer;
  sTipoLanc :char;
  dValLanc,dPlnCodigo :Double;
  aLinha : array [1..12] of string;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ImportaPlanilhaExcel(dEmpresa,iPlano,iModulo,
                    iUsuario,sDataLanc,sTipoOper,bUsaPPatro);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;

   End Else
   Begin
       //Inicializa as variáveis
       FsMensAdd    := '';
       dPlnCodigo  := 0;
       MessageInfo := '*';

       Try
            StartTransaction;

            //Varre a planilha para gravar os valores
            iContaLinha      := 0;
            FContaLinhaTexto := 0;

            While (FStrlImportaExcel.Count <> iContaLinha) do
            Begin
               Y := 0;
               X := 1;
               Z := 1;
               W := 0;

               Repeat

                  sTralhaNove := Copy(FStrlImportaExcel[iContaLinha],X,1);
                  If sTralhaNove = #9 Then
                  Begin
                     Y := Y + 1;

                     aLinha[Y] := Copy(FStrlImportaExcel[iContaLinha], Z, X - 1 - W);

                     Z := Z + X - W;
                     W := X;
                  End;
                  X := X + 1;

               Until Length(FStrlImportaExcel[iContaLinha]) <= X;

               y := y + 1;
               aLinha[Y] := Copy(FStrlImportaExcel[iContaLinha], Z, X - W);

               //zera as variáveis
               sDataLanc   := '';
               sDebCre     := '';
               sNumDoc     := '';
               iPatro      := 0;
               iPlanoPrev  := 0;
               sLinha      := '';
               sHist1      := '';
               sHist2      := '';
               sHist3      := '';
               sHist4      := '';
               sHist5      := '';
               sValor      := '';
               sHistorico  := '';
               sCCustD     := '';
               sCCustC     := '';
               sContaD     := '';
               sContaC     := '';
               cTipoLanc   := '';
               sDebCre     := '';
               sValor      := '0';

               If (Trim(aLinha[7]) = '') or (Trim(aLinha[7]) = '0,00') or (Trim(aLinha[7]) = '0.00') or (Trim(aLinha[7]) = '0') Then
               Begin
                  sTipoLanc    := '1';
                  sDebCre      := 'C';
                  FlcOriAplCre := 'O';

                  If Trim(aLinha[4]) <> '' Then
                     iSubContaC := StrToInt(Trim(aLinha[4]))
                  Else
                     iSubContaC := 0;
                  sCCustC     := Trim(aLinha[3]);
                  sContaC     := Trim(aLinha[2]);
                  FLinhaTexto := 'Conta Contábil: ' + sContaC;
                  iSubContaD := 0;
                  sCCustD    := '';
                  sContaD    := '';

                  If sCCustC = '0' Then sCCustC := '';

               End Else
               Begin
                  sTipoLanc  := '0';
                  sDebCre    := 'D';

                  If Trim(aLinha[4]) <> '' Then
                     iSubContaD := StrToInt(Trim(aLinha[4]))
                  Else
                     iSubContaD := 0;

                  sCCustD    := Trim(aLinha[3]);
                  sContaD    := Trim(aLinha[2]);
                  iSubContaC := 0;
                  FLinhaTexto := 'Conta Contábil: ' + sContaD;

                  sCCustC    := '';
                  sContaC    := '';
                  If sCCustD = '0' then sCCustD := '';
               End;

               sNumDoc := '';

               If Trim(aLinha[9]) <> ''  Then iPlanoPrev := StrToInt(Trim(aLinha[9]));
               If Trim(aLinha[10]) <> '' Then iPatro     := StrToInt(Trim(aLinha[10]));
               If Trim(aLinha[11]) <> '' Then sUnidNegoc := Trim(aLinha[11]);
               If Trim(aLinha[12]) <> '' Then sNumDoc := Trim(aLinha[12]);

               sHistorico := Trim(aLinha[5]);
               sLinha     := Trim(aLinha[6]);

               If length(sLinha) > 40 Then
                  sHist1 := copy(sLinha, 1, 40)
               Else
                  sHist1 := sLinha;

               sHist2  := '';
               sHist3  := '';
               sHist4  := '';
               sHist5  := '';

               If sHistorico = '0' then
                  sHistorico := '';

               If sDebCre = 'D' Then
                  sValor := Trim(aLinha[7])
               Else
                  sValor := Trim(aLinha[8]);

               If sValor = '' Then
                  sValor := '0';

               sUnidNegoc := '';

               iContaLinha := iContaLinha + 1;
               FContaLinhaTexto := iContaLinha;
               For i := 1 to 12 do
               Begin
                  aLinha[i] := '';
               End;


               //*** Verifica Historico ***
               _cds.Data := HistoContab.ListHistoContab(dEmpresa,tohCodigo,sHistorico);

               If Not _cds.IsEmpty Then
               Begin
                  If sHist1 = '' Then
                  Begin
                     sHist1 := copy(_cds.FieldByName('HITDESCR1').AsString,1,40);
                     sHist2 := copy(_cds.FieldByName('HITDESCR1').AsString,41,40);
                     sHist3 := copy(_cds.FieldByName('HITDESCR1').AsString,81,40);
                     sHist4 := copy(_cds.FieldByName('HITDESCR1').AsString,121,40);
                     sHist5 := copy(_cds.FieldByName('HITDESCR1').AsString,161,40);
                  End;
               End;

               dValLanc := StrToFloat(sValor);

               If sDebCre = 'D' Then
               Begin

                  If Trim(sCCustD) <> '' Then
                  Begin

                     sSql := 'SELECT CODCENTROCUSTO FROM CONTASXCC '+
                             'WHERE PLANO = ' + IntToStr(iplano) + ' AND '+
                             '      PLACONTA = ''' + sContaD + ''' AND '+
                             '      CODCENTROCUSTO = ''' + sCCustd + ''' AND ' +
                             '      IDEMPRESA = '+FloatToStr(dEmpresa);

                     _cds.Data := GetDataPacket(sSql);

                     If _cds.IsEmpty Then
                     Begin
                        sSql := 'INSERT INTO CONTASXCC '+
                                '(PLANO,PLACONTA,CODCENTROCUSTO,IDEMPRESA,IDUSUARIOINCLUSAO) '+
                                'VALUES (';
                        sSql := sSql + IntToStr(iPlano) + ',' + QuotedStr(sContaD) + ','+
                                       QuotedStr(sCCustD) + ',' + FloatToStr(dEmpresa) + ',' +
                                       IntToStr(iUsuario) + ')';

                        ExecSQL(sSql);
                     End;
                  End;

               End Else
               Begin
                  If Trim(sCCustC) <> '' Then
                  Begin
                     sSql := 'SELECT CODCENTROCUSTO FROM CONTASXCC '+
                             'WHERE PLANO = ' + IntToStr(iplano) + ' AND '+
                             '      PLACONTA = ''' + sContaC + ''' AND '+
                             '      CODCENTROCUSTO = ''' + sCCustC + ''' AND ' +
                             '      IDEMPRESA = '+FloatToStr(dEmpresa);

                     _cds.Data := GetDataPacket(sSql);

                     If _cds.IsEmpty Then
                     Begin
                        sSql := 'INSERT INTO CONTASXCC '+
                                '(PLANO,PLACONTA,CODCENTROCUSTO,IDEMPRESA,IDUSUARIOINCLUSAO) '+
                                'VALUES (';
                        sSql := sSql + IntToStr(iPlano) + ',' + QuotedStr(sContaC) + ','+
                                       QuotedStr(sCCustC) + ',' + FloatToStr(dEmpresa) + ',' +
                                       IntToStr(iUsuario) + ')';

                        ExecSQL(sSql);
                     End;
                  End;
               End;

               If Not ((sContaD = '') and (sContaC = '')) Then
               Begin
                  If (dValLanc <> 0) Then
                  Begin
                     FProgresso := FProgresso + 1;

                     FlcTestaConta := True;
                     If InsereLancaContab (sTipoLanc,dEmpresa,iModulo,iUsuario,
                                           iPlano,StrToInt(sUnidNegoc),iSubContaD,iSubContaC,
                                           iPlanoPrev, iPatro,dPlnCodigo,0,
                                           sDataLanc,sNumDoc,sHist1,sHist2,sHist3,
                                           sHist4,sHist5,sTipoOper,sCCustD,sContaD,
                                           sCCustC,sContaC,sHistorico,
                                           dValLanc,False,bUsaPPatro) Then

                     Begin
                         dPlnCodigo := FRetornoPlnCodigo;
                     End;
                  End;
               End;
            End;

            _cds.Data := Planilha.ListPlanilhas(0,dPlnCodigo);

            MessageInfo := IntToStr(_cds.FieldByName('PLNPLANIL').asInteger) + ' em: ' + sDataLanc + chr(13);
            FsMensAdd := FsMensAdd + MessageInfo + chr(13);

            Commit;
            Result := True;

       Except
            RollBack;
            Result := False;
       End;
       FStrlImportaExcel.Free;
   End;
end;

function TCtrlLancamento.AtuSaldoContas(IdEmpresa, iUnidNegoc, iUsuario,
  iPlanoPrev, iPatro, iPlano : Double; iExercicio, iPeriodo: Integer; iSubConta : Double;
  sCCust, sConta, sDebCre, sTipoConta: string; rValCorrente, rValOrcado,
  rValOficial, rValGeren, rValGeren1, rValGeren2, rValHist: Double;
  bUsaPlanoPatro: boolean): Boolean;
var bInclui : Boolean;
begin
   if bUsaPlanoPatro and ((iPlanoPrev = 0) or (iPatro = 0)) then begin
      Result      := False;
      MessageInfo := 'Plano ou Patrocinadora não preenchido';
   end else begin
      if not bUsaPlanoPatro then begin
         iPlanoPrev := 0;
         iPatro     := 0;
      end;
      bInclui := True;

      {** GUSTAVO VIEGAS 23/04/2002 **}
      With TCMSqlParams.Create(nil) Do
         Try
            SQL.Clear;
            SQL.Add('SELECT IDPLANOSALDO, ROUND(PLSORCADODEBITO,2) AS PLSORCADODEBITO, ROUND(PLSORCADOCREDITO,2) AS PLSORCADOCREDITO,     ');
            SQL.Add('       ROUND(PLSDEBITOOFICIAL,2) AS PLSDEBITOOFICIAL, ROUND(PLSDEBITOHIST,2) AS PLSDEBITOHIST, ROUND(PLSDEBITOGEREN2,2) AS PLSDEBITOGEREN2,    ');
            SQL.Add('       ROUND(PLSDEBITOGEREN1,2) AS PLSDEBITOGEREN1, ROUND(PLSDEBITOGER,2) AS PLSDEBITOGER, ROUND(PLSDEBITOCORRENTE,2) AS PLSDEBITOCORRENTE,    ');
            SQL.Add('       ROUND(PLSCREDITOOFICIAL,2) AS PLSCREDITOOFICIAL, ROUND(PLSCREDITOHIST,2) AS PLSCREDITOHIST, ROUND(PLSCREDITOGEREN2,2) AS PLSCREDITOGEREN2, ');
            SQL.Add('       ROUND(PLSCREDITOGEREN1,2) AS PLSCREDITOGEREN1, ROUND(PLSCREDITOGER,2) AS PLSCREDITOGER, ROUND(PLSCREDITOCOR,2) AS PLSCREDITOCOR      ');
            SQL.Add('FROM PLANOSALDO                                             ');
            SQL.Add('WHERE (PEREXERCICIO = ' + IntToStr(iExercicio) + ')         ');
            if iPeriodo > 0 then
               SQL.Add('  AND (PERNUMERO = '+IntToStr(iPeriodo)+')                  ')
            else
               SQL.Add('  AND (PERNUMERO IS NULL)                                ');
            SQL.Add('  AND (IDPESSOA = '+FloatToStr(IdEmpresa)+')                ');
            SQL.Add('  AND (PLANO = '+FloatToStr(iPlano)+')');
            SQL.Add('  AND (PLACONTA = '''+Copy(trim(sConta)+'                 ',1,18)+''')');
            if sCCust = '' then begin
               SQL.Add('  AND (CODCENTROCUSTO IS NULL)                           ');
               SQL.Add('  AND (IDEMPRESA IS NULL)                                ');
            end else begin
               SQL.Add('  AND (CODCENTROCUSTO = '''+Copy(trim(sCCust)+'         ',1,10)+''')');
               SQL.Add('  AND (IDEMPRESA = '+FloatToStr(IdEmpresa)+')            ');
            end;
            if iUnidNegoc = 0 then begin
               SQL.Add('  AND (UNIDNEGOC IS NULL)                                ');
            end else begin
               SQL.Add('  AND (UNIDNEGOC = '+FloatToStr(iUnidNegoc)+')           ');
            end;
            if iSubConta = 0 then begin
               SQL.Add('  AND (CODSUBCONTA IS NULL)                                ');
            end else begin
               SQL.Add('  AND (CODSUBCONTA = '+FloatToStr(iSubConta)+')            ');
            end;
            if iPlanoPrev = 0 then begin
               SQL.Add('  AND (IDPLANOPREV IS NULL)                              ');
            end else begin
               SQL.Add('  AND (IDPLANOPREV = '+FloatToStr(iPlanoPrev)+')           ');
            end;
            if iPatro = 0 then begin
               SQL.Add('  AND (IDPATRO IS NULL)                            ');
            end else begin
               SQL.Add('  AND (IDPATRO = '+FloatToStr(iPatro)+')           ');
            end;

            _Cds.Data := Data;
         finally
           free;
         end;

      if not _Cds.isEmpty then bInclui := False;
      
      _dbPlanoSaldo.Plano.AsFloat             := iPlano;
      _dbPlanoSaldo.Placonta.AsString         := sConta;
      _dbPlanoSaldo.Perexercicio.AsInteger    := iExercicio;
      _dbPlanoSaldo.Pernumero.AsInteger       := iPeriodo;
      _dbPlanoSaldo.Idusuarioinclusao.AsFloat := iUsuario;
      _dbPlanoSaldo.Idplanoprev.AsFloat       := iPlanoPrev;
      _dbPlanoSaldo.Idpatro.AsFloat           := iPatro;
      _dbPlanoSaldo.Idpessoa.AsFloat          := IdEmpresa;
      if (sCCust = '') then
         _dbPlanoSaldo.Idempresa.AsFloat      := 0
      else
         _dbPlanoSaldo.Idempresa.AsFloat      := IdEmpresa;
      _dbPlanoSaldo.Codsubconta.AsFloat       := iSubConta;
      _dbPlanoSaldo.Codcentrocusto.AsString   := sCCust;
      _dbPlanoSaldo.Unidnegoc.AsFloat         := iUnidNegoc;
      _dbPlanoSaldo.Plstipo.AsString          := sTipoConta;
      if bInclui then begin
         if sDebCre = 'D' then begin
            _dbPlanoSaldo.Plsorcadodebito.AsFloat   := RoundCM(rValOrcado,2);
            _dbPlanoSaldo.Plsdebitooficial.AsFloat  := RoundCM(rValOficial,2);
            _dbPlanoSaldo.Plsdebitohist.AsFloat     := RoundCM(rValHist,2);
            _dbPlanoSaldo.Plsdebitogeren2.AsFloat   := RoundCM(rValGeren2,2);
            _dbPlanoSaldo.Plsdebitogeren1.AsFloat   := RoundCM(rValGeren1,2);
            _dbPlanoSaldo.Plsdebitoger.AsFloat      := RoundCM(rValGeren,2);
            _dbPlanoSaldo.Plsdebitocorrente.AsFloat := RoundCM(rValCorrente,2);
            
            _dbPlanoSaldo.Plsorcadocredito.AsFloat  := 0;
            _dbPlanoSaldo.Plscreditooficial.AsFloat := 0;
            _dbPlanoSaldo.Plscreditohist.AsFloat    := 0;
            _dbPlanoSaldo.Plscreditogeren2.AsFloat  := 0;
            _dbPlanoSaldo.Plscreditogeren1.AsFloat  := 0;
            _dbPlanoSaldo.Plscreditoger.AsFloat     := 0;
            _dbPlanoSaldo.Plscreditocor.AsFloat     := 0;
         end else begin
            _dbPlanoSaldo.Plsorcadodebito.AsFloat   := 0;
            _dbPlanoSaldo.Plsdebitooficial.AsFloat  := 0;
            _dbPlanoSaldo.Plsdebitohist.AsFloat     := 0;
            _dbPlanoSaldo.Plsdebitogeren2.AsFloat   := 0;
            _dbPlanoSaldo.Plsdebitogeren1.AsFloat   := 0;
            _dbPlanoSaldo.Plsdebitoger.AsFloat      := 0;
            _dbPlanoSaldo.Plsdebitocorrente.AsFloat := 0;
            
            _dbPlanoSaldo.Plsorcadocredito.AsFloat  := RoundCM(rValOrcado,2);
            _dbPlanoSaldo.Plscreditooficial.AsFloat := RoundCM(rValOficial,2);
            _dbPlanoSaldo.Plscreditohist.AsFloat    := RoundCM(rValHist,2);
            _dbPlanoSaldo.Plscreditogeren2.AsFloat  := RoundCM(rValGeren2,2);
            _dbPlanoSaldo.Plscreditogeren1.AsFloat  := RoundCM(rValGeren1,2);
            _dbPlanoSaldo.Plscreditoger.AsFloat     := RoundCM(rValGeren,2);
            _dbPlanoSaldo.Plscreditocor.AsFloat     := RoundCM(rValCorrente,2);
         end;
         Result := _dbPlanoSaldo.Insert;
      end else begin
         _dbPlanoSaldo.Idplanosaldo.AsFloat      := _Cds.FieldByName('IDPLANOSALDO').AsFloat;
         if sDebCre = 'D' then begin
            _dbPlanoSaldo.Plsorcadodebito.AsFloat   := RoundCM(_Cds.FieldByName('PLSORCADODEBITO').AsFloat  +rValOrcado,2);
            _dbPlanoSaldo.Plsdebitooficial.AsFloat  := RoundCM(_Cds.FieldByName('PLSDEBITOOFICIAL').AsFloat +rValOficial,2);
            _dbPlanoSaldo.Plsdebitohist.AsFloat     := RoundCM(_Cds.FieldByName('PLSDEBITOHIST').AsFloat    +rValHist,2);
            _dbPlanoSaldo.Plsdebitogeren2.AsFloat   := RoundCM(_Cds.FieldByName('PLSDEBITOGEREN2').AsFloat  +rValGeren2,2);
            _dbPlanoSaldo.Plsdebitogeren1.AsFloat   := RoundCM(_Cds.FieldByName('PLSDEBITOGEREN1').AsFloat  +rValGeren1,2);
            _dbPlanoSaldo.Plsdebitoger.AsFloat      := RoundCM(_Cds.FieldByName('PLSDEBITOGER').AsFloat     +rValGeren,2);
            _dbPlanoSaldo.Plsdebitocorrente.AsFloat := RoundCM(_Cds.FieldByName('PLSDEBITOCORRENTE').AsFloat+rValCorrente,2);
            
            _dbPlanoSaldo.Plsorcadocredito.AsFloat  := RoundCM(_Cds.FieldByName('PLSORCADOCREDITO').AsFloat,2);
            _dbPlanoSaldo.Plscreditooficial.AsFloat := RoundCM(_Cds.FieldByName('PLSCREDITOOFICIAL').AsFloat,2);
            _dbPlanoSaldo.Plscreditohist.AsFloat    := RoundCM(_Cds.FieldByName('PLSCREDITOHIST').AsFloat,2);
            _dbPlanoSaldo.Plscreditogeren2.AsFloat  := RoundCM(_Cds.FieldByName('PLSCREDITOGEREN2').AsFloat,2);
            _dbPlanoSaldo.Plscreditogeren1.AsFloat  := RoundCM(_Cds.FieldByName('PLSCREDITOGEREN1').AsFloat,2);
            _dbPlanoSaldo.Plscreditoger.AsFloat     := RoundCM(_Cds.FieldByName('PLSCREDITOGER').AsFloat,2);
            _dbPlanoSaldo.Plscreditocor.AsFloat     := RoundCM(_Cds.FieldByName('PLSCREDITOCOR').AsFloat,2);
         end else begin
            _dbPlanoSaldo.Plsorcadodebito.AsFloat   := RoundCM(_Cds.FieldByName('PLSORCADODEBITO').AsFloat,2);
            _dbPlanoSaldo.Plsdebitooficial.AsFloat  := RoundCM(_Cds.FieldByName('PLSDEBITOOFICIAL').AsFloat,2);
            _dbPlanoSaldo.Plsdebitohist.AsFloat     := RoundCM(_Cds.FieldByName('PLSDEBITOHIST').AsFloat,2);
            _dbPlanoSaldo.Plsdebitogeren2.AsFloat   := RoundCM(_Cds.FieldByName('PLSDEBITOGEREN2').AsFloat,2);
            _dbPlanoSaldo.Plsdebitogeren1.AsFloat   := RoundCM(_Cds.FieldByName('PLSDEBITOGEREN1').AsFloat,2);
            _dbPlanoSaldo.Plsdebitoger.AsFloat      := RoundCM(_Cds.FieldByName('PLSDEBITOGER').AsFloat,2);
            _dbPlanoSaldo.Plsdebitocorrente.AsFloat := RoundCM(_Cds.FieldByName('PLSDEBITOCORRENTE').AsFloat,2);
            
            _dbPlanoSaldo.Plsorcadocredito.AsFloat  := RoundCM(_Cds.FieldByName('PLSORCADOCREDITO').AsFloat +rValOrcado,2);
            _dbPlanoSaldo.Plscreditooficial.AsFloat := RoundCM(_Cds.FieldByName('PLSCREDITOOFICIAL').AsFloat+rValOficial,2);
            _dbPlanoSaldo.Plscreditohist.AsFloat    := RoundCM(_Cds.FieldByName('PLSCREDITOHIST').AsFloat   +rValHist,2);
            _dbPlanoSaldo.Plscreditogeren2.AsFloat  := RoundCM(_Cds.FieldByName('PLSCREDITOGEREN2').AsFloat +rValGeren2,2);
            _dbPlanoSaldo.Plscreditogeren1.AsFloat  := RoundCM(_Cds.FieldByName('PLSCREDITOGEREN1').AsFloat +rValGeren1,2);
            _dbPlanoSaldo.Plscreditoger.AsFloat     := RoundCM(_Cds.FieldByName('PLSCREDITOGER').AsFloat    +rValGeren,2);
            _dbPlanoSaldo.Plscreditocor.AsFloat     := RoundCM(_Cds.FieldByName('PLSCREDITOCOR').AsFloat    +rValCorrente,2);
         end;
         Result := _dbPlanoSaldo.Update;
      end;
      MessageInfo := _dbPlanoSaldo.MessageInfo;
   end;
end;

function TCtrlLancamento.FazRateio(liEmpresa, liModulo, liUsuario, liCodPlano,
         liPlanilRateio, liPlanoPrev, liPatro, liSubContaCp, liSubContaRt,
         liUnidNegoc: Integer;  sDataLanc, sNumDoc, sTipoOper, sCcustoCp,
         sContaCp, sCodHistCp, sHist1Cp, sHist2Cp, sHist3Cp, sHist4Cp,
         sHist5Cp, sCcustoRt, sContaRt, sCodHistRt, sHist1Rt, sHist2Rt,
         sHist3Rt, sHist4Rt, sHist5Rt, sDebCre: string; dValor: Double;
         bJunta, bUsaPPatro: Boolean):Boolean;
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
                                 sHist5Rt, sDebCre, dValor,bJunta, bUsaPPatro,FRetornoPlnCodigo);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
         MessageInfo := Connection.AppServer.MessageInfo;

   End Else
   Begin
      Result := True;
      iUnidNegoc := 0;
      dPlnCodigo := 0;
      _cdsPlanilRateio := TClientDataSet.Create(nil);
      _cdsSaldoRateio  := TClientDataSet.Create(nil);

     Try

        StartTransaction;

        // *** verifica se a planilha existe antes de fazer o processamento
        sSql := 'SELECT  '+
                '   P.PANCONTAPERC, '+
                '   D.PLANO, D.PANCONTABASE, D.PANCCUSTOBASE, '+
                '   D.PLACONTA, D.CODCENTROCUSTO, '+
                '   D.IDEMPRESA, D.IDPESSOA, D.PANPERC, ' +
                '   D.UNIDNEGOC, D.CODSUBCONTA, D.TIPCODIGO '+
                '   FROM  PREPLANILHA P, PREDETALHE D ' +
                'WHERE '  +
                '   (P.PANCODIGO = ' + IntToStr(liPlanilRateio) + ') AND '+
                '   (P.PANCODIGO = D.PANCODIGO) ' +
                'ORDER BY  D.PANNUMLANC ';

        _cds.Data := GetDataPacket(sSql);

       If _cdsPlanilRateio.isEmpty Then
       Begin
         sMens := 'Código da Planilha de Rateio não existe.';
         Abort;
         Result := False;
       End;

       sTipoRateio := _cdsPlanilRateio.FieldByName('PANCONTAPERC').asString;

       If Not Periodo.RetornaPeriodoExercicioData(liEmpresa,sDataLanc)  Then
       Begin
         sMens := Periodo.MessageInfo;
         Result := False;
         Abort;
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

            FlcTestaConta := False;
            If Not InsereLancaContab(sTipoLanc,liEmpresa,liModulo,liUsuario,
                                    liCodPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                    liPlanoPrev,liPatro,dPlnCodigo,0,
                                    sDataLanc,sNumDoc,sHist1Rt,sHist2Rt,sHist3Rt,
                                    sHist4Rt,sHist5Rt,sTipoOper,sCCustoD,sContaD,
                                    sCCustoC,sContaC,sCodHistRt,
                                    rValorRateio,bJunta,bUsaPPatro) Then

            Begin
              sMens  := MessageInfo;
              RollBack;
              Result := False;
              Exit;
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
                    '           (PLANO           = ' + IntToStr(liCodPlano) + ') '+
                    '       AND (RTRIM(PLACONTA) = ' + Trim(_cdsPlanilRateio.FieldByName('PANCONTABASE').asString) + ') ' +
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


            FlcTestaConta := False;
            If not InsereLancaContab (sTipoLanc,liEmpresa,liModulo,
                                      liUsuario,liCodPlano,iUnidNegoc,
                                      iSubContaD,iSubContaC,
                                      liPlanoPrev,liPatro,dPlnCodigo,0,
                                      sDataLanc,sNumDoc,sHist1Rt,sHist2Rt,sHist3Rt,
                                      sHist4Rt,sHist5Rt,sTipoOper,sCCustoD,sContaD,
                                      sCCustoC,sContaC,sCodHistRt, rValorRateio,
                                      bJunta, bUsaPPatro) Then

            Begin
              sMens  := MessageInfo;
              RollBack;
              Result := False;
              Exit;
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
         dPlnCodigo := 0;

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

         FlcTestaConta := False;
         If not InsereLancaContab (sTipoLanc,liEmpresa,liModulo,liUsuario,
                                   liCodPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                   liPlanoPrev,liPatro,dPlnCodigo,0,
                                   sDataLanc,sNumDoc,sHist1Cp,sHist2Cp,sHist3Cp,
                                   sHist4Cp,sHist5Cp,sTipoOper,sCCustoD,sContaD,
                                   sCCustoC,sContaC, sCodHistCp, dValor,
                                   bJunta,bUsaPPatro) Then

         Begin
           sMens  := MessageInfo;
           RollBack;
           Result := False;
           Exit;
         End;
      End;

      MessageInfo := FloatToStr(RetornoPlnCodigo);
      Commit;

     Except
         on E:Exception Do
         Begin
            RollBack;
            Result := False;
            MessageInfo := sMens+' '+E.Message;
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
                                  {
function TCtrlLancamento.SelecionaModulos(bOrdenaModulo: Boolean): Boolean;
begin
   {Funcão implementada na Aplicação Servidora}
{   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.SelecionaModulos(bOrdenaModulo);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      Result := True;
      FqryModuloL.Close;
      FqryModuloL.SQL.Clear;
      FqryModuloL.SQL.Add('SELECT IDMODULO, NOMEMODULO ');
      FqryModuloL.SQL.Add('FROM MODULO ');
      if bOrdenaModulo then
         FqryModuloL.SQL.Add('ORDER BY IDMODULO ')
      else
         FqryModuloL.SQL.Add('ORDER BY NOMEMODULO ');
   end;
end;
     }
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
       {
function TCtrlLancamento.SelecionaTipoOper(bOrdenaTipoOper: Boolean): Boolean;
begin
   {Funcão implementada na Aplicação Servidora}
  { If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.SelecionaTipoOper(bOrdenaTipoOper);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      Result := True;
      FqryTipoOper.Close;
      FqryTipoOper.SQL.Clear;
      FqryTipoOper.SQL.Add('SELECT TIPCODIGO, TIPDESCRICAO ');
      FqryTipoOper.SQL.Add('FROM TIPOPER ');
      if bOrdenaTipoOper then
         FqryTipoOper.SQL.Add('ORDER BY TIPCODIGO ')
      else
         FqryTipoOper.SQL.Add('ORDER BY TIPDESCRICAO ');
   end;
end;

procedure TCtrlLancamento.SetdspModuloL(const Value: TDataSetProvider);
begin
  FdspModuloL := Value;
end;

procedure TCtrlLancamento.SetqryModuloL(const Value: TwwQuery);
begin
  FqryModuloL := Value;
end;

procedure TCtrlLancamento.SetdspLancamento(const Value: TDataSetProvider);
begin
  FdspLancamento := Value;
end;

procedure TCtrlLancamento.SetqryLancamento(const Value: TwwQuery);
begin
  FqryLancamento := Value;
end;
      {
function TCtrlLancamento.SelecionaLancamentos(IdPlnCodigo,IdEmpresa: Double;
  iExercicio, iPeriodo: Integer; TipoPeriodo: TTipoPeriodo; sDataIni,
  sDataFim, sModulos, sTipoOper: String; TipoEfetivado: TTipoEfetivado;
  TipoOutraMoeda: TTipoOutraMoeda;
  TipoOrdenaLanc: TTipoOrdenaLanc; TipoSomatorio : TTipoSomatorio; bComConta : Boolean): Boolean;
begin
   {Funcão implementada na Aplicação Servidora}
 {  If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.SelecionaLancamentos(IdPlnCodigo,IdEmpresa,iExercicio, iPeriodo,
                                     Integer(TipoPeriodo), sDataIni, sDataFim, sModulos, sTipoOper, Integer(TipoEfetivado),
                                     Integer(TipoOutraMoeda), Integer(TipoOrdenaLanc) , Integer(TipoSomatorio) ,bComConta);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      Result := True;
      FqryLancamento.Close;
      FqryLancamento.SQL.Clear;
      FqryLancamento.SQL.Add('SELECT                                                        ');
      FqryLancamento.SQL.Add('   P.PERNUMERO,P.PEREXERCICIO,L.PLANO,L.PLACONTA, L.TIPCODIGO,');
      FqryLancamento.SQL.Add('   L.CODSUBCONTA,L.IDEMPRESA,L.UNIDNEGOC,L.CODCENTROCUSTO,    ');
      FqryLancamento.SQL.Add('   L.IDPLANOPREV, L.IDPATRO, L.LACDEBCRE,                     ');
      if bComConta then begin
         FqryLancamento.SQL.Add('   C.PLANOME, C.PLATIPO, C.PLAGRUPO, C.PLANOMEOUTLING,     ');
      end;
      if (TipoSomatorio = tsPeriodo) or (TipoSomatorio = tsData) then begin
         if (TipoSomatorio = tsData) then
            FqryLancamento.SQL.Add('   P.PLNDATDIA,                     ');
         FqryLancamento.SQL.Add('   ROUND(SUM(NVL(L.LACVALOR,0)),2) AS LACVALOR,               ');
         FqryLancamento.SQL.Add('   ROUND(SUM(NVL(L.LACVALOFICIAL,0)),2) AS LACVALOFICIAL,     ');
         FqryLancamento.SQL.Add('   ROUND(SUM(NVL(L.LACVALGERENCIAL,0)),2) AS LACVALGERENCIAL, ');
         FqryLancamento.SQL.Add('   ROUND(SUM(NVL(L.LACVALGEREN1,0)),2) AS LACVALGEREN1,       ');
         FqryLancamento.SQL.Add('   ROUND(SUM(NVL(L.LACVALGEREN2,0)),2) AS LACVALGEREN2,       ');
         FqryLancamento.SQL.Add('   ROUND(SUM(NVL(L.LACVALHIST,0)),2) AS LACVALHIST            ');
      end else begin
         FqryLancamento.SQL.Add('   L.LACNUMLAN, P.PLNPLANIL,P.PLNCODIGO, P.PLNDATDIA,         ');
         FqryLancamento.SQL.Add('   L.LACVALOR, L.LACVALOFICIAL, L.LACVALGERENCIAL,            ');
         FqryLancamento.SQL.Add('   L.LACVALGEREN1, L.LACVALGEREN2, L.LACVALHIST               ');
      end;
      FqryLancamento.SQL.Add('FROM                                                          ');
      FqryLancamento.SQL.Add('   PLANILHA P, LANCAMENTO L                                   ');
      if bComConta then
         FqryLancamento.SQL.Add('   ,PLANOCONTA C                                           ');
      FqryLancamento.SQL.Add('WHERE (P.IDPESSOA = '+FloatToStr(IdEmpresa)+')                ');
      if bComConta then begin
         FqryLancamento.SQL.Add('  AND (C.PLANO = L.PLANO)                                  ');
         FqryLancamento.SQL.Add('  AND (C.PLACONTA = L.PLACONTA)                            ');
      end;
      if IdPlnCodigo <> 0 then
         FqryLancamento.SQL.Add('  AND (P.PLNCODIGO = '+FloatToStr(IdPlnCodigo)+')             ');
      if iExercicio > 0 then
         FqryLancamento.SQL.Add('  AND (P.PEREXERCICIO = '+IntToStr(iExercicio)+')             ');
      if iPeriodo > 0 then begin
         Case TipoPeriodo of
            tpSoPeriodo  : FqryLancamento.SQL.Add('  AND (P.PERNUMERO = '+IntToStr(iPeriodo)+')     ');
            tpMenorIgual : FqryLancamento.SQL.Add('  AND (P.PERNUMERO <= '+IntToStr(iPeriodo)+')    ');
         end;
      end;
      if sModulos <> '' then
         FqryLancamento.SQL.Add('  AND (P.IDMODULO IN ('+sModulos+'))                  ');
      if sTipoOper <> '' then
         FqryLancamento.SQL.Add('  AND (L.TIPCODIGO ='''+sTipoOper+''')                ');
      if sDataIni <> '' then
         FqryLancamento.SQL.Add('  AND (P.PLNDATDIA >= TO_DATE('''+sDataIni+''',''DD/MM/YYYY''))  ');
      if sDataFim <> '' then
         FqryLancamento.SQL.Add('  AND (P.PLNDATDIA <= TO_DATE('''+sDataFim+''',''DD/MM/YYYY''))  ');
      Case TipoOutraMoeda of
         tomNaoAtualizada : FqryLancamento.SQL.Add('  AND ((L.LACATOUTMOEDA = ''N'') OR (L.LACATOUTMOEDA IS NULL)) ');
         tomAtualizada    : FqryLancamento.SQL.Add('  AND (L.LACATOUTMOEDA = ''S'')                                ');
      end;
      Case TipoEfetivado of
         teNaoEfetivado : FqryLancamento.SQL.Add('  AND ((P.PLNEFETIVADO <> ''S'') OR (P.PLNEFETIVADO IS NULL)) ');
         teEfetivado    : FqryLancamento.SQL.Add('  AND (P.PLNEFETIVADO = ''S'')                                ');
      end;
      FqryLancamento.SQL.Add('  AND (P.PLNCODIGO = L.PLNCODIGO)                             ');
      if (TipoSomatorio = tsPeriodo) or (TipoSomatorio = tsData) then begin
         FqryLancamento.SQL.Add('GROUP BY P.PERNUMERO,P.PEREXERCICIO,L.PLANO,L.PLACONTA, L.TIPCODIGO,');
         if (TipoSomatorio = tsData) then
            FqryLancamento.SQL.Add('   P.PLNDATDIA,                     ');
         FqryLancamento.SQL.Add('   L.CODSUBCONTA,L.IDEMPRESA,L.UNIDNEGOC,L.CODCENTROCUSTO,    ');
         if bComConta then begin
            FqryLancamento.SQL.Add('   C.PLANOME, C.PLATIPO, C.PLAGRUPO, C.PLANOMEOUTLING,     ');
         end;
         FqryLancamento.SQL.Add('   L.IDPLANOPREV, L.IDPATRO, L.LACDEBCRE       ');
      end else begin
         Case TipoOrdenaLanc of
            tolData     : FqryLancamento.SQL.Add('ORDER BY P.PLNDATDIA, P.PLNPLANIL, L.LACNUMLAN  ');
            tolPlnCodigo: FqryLancamento.SQL.Add('ORDER BY P.PLNCODIGO, L.LACNUMLAN  ');
         end;
      end;
   end;

end;   }


function TCtrlLancamento.SelecionaLancamentos(IdPlnCodigo,IdEmpresa: Double;
  iExercicio, iPeriodo: Integer; TipoPeriodo: TTipoPeriodo; sDataIni,
  sDataFim, sModulos, sTipoOper: String; TipoEfetivado: TTipoEfetivado;
  TipoOutraMoeda: TTipoOutraMoeda;  TipoOrdenaLanc: TTipoOrdenaLanc;
  TipoSomatorio : TTipoSomatorio; bComConta : Boolean): OleVariant;
begin

    Result := True;
    With TCMSqlParams.Create(nil) Do
      Try
          SQL.Clear;
          SQL.Add('SELECT                                                        ');
          SQL.Add('   P.PERNUMERO,P.PEREXERCICIO,L.PLANO,L.PLACONTA, L.TIPCODIGO,');
          SQL.Add('   L.CODSUBCONTA,L.IDEMPRESA,L.UNIDNEGOC,L.CODCENTROCUSTO,    ');
          SQL.Add('   L.IDPLANOPREV, L.IDPATRO, L.LACDEBCRE,                     ');

          if bComConta then begin
             SQL.Add('   C.PLANOME, C.PLATIPO, C.PLAGRUPO, C.PLANOMEOUTLING,     ');
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
             SQL.Add('   L.LACVALOR, L.LACVALOFICIAL, L.LACVALGERENCIAL,            ');
             SQL.Add('   L.LACVALGEREN1, L.LACVALGEREN2, L.LACVALHIST               ');
          end;

          SQL.Add('FROM                                                          ');
          SQL.Add('   PLANILHA P, LANCAMENTO L                                   ');

          if bComConta then
             SQL.Add('   ,PLANOCONTA C                                           ');

          SQL.Add('WHERE (P.IDPESSOA = '+FloatToStr(IdEmpresa)+')                ');

          if bComConta then begin
             SQL.Add('  AND (C.PLANO = L.PLANO)                                  ');
             SQL.Add('  AND (C.PLACONTA = L.PLACONTA)                            ');
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
                SQL.Add('   C.PLANOME, C.PLATIPO, C.PLAGRUPO, C.PLANOMEOUTLING,     ');
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
          FcdsLancamento.Data := Result;

      Finally
        Free;
      End;

end;

function TCtrlLancamento.SelecionaLancamentosEsp(IdPlnCodigo : Double): OleVariant;
begin
  {Funcão implementada na Aplicação Servidora}
 {  If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.SelecionaLancamentosEsp(IdPlnCodigo);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin  }
   Result := True;
   With TCMSqlParams.Create(nil) Do
      Try
          SQL.Clear;
          SQL.Add('SELECT U.PLNCODIGO, U.LACNUMLAN, U.UNIDNEGOC, U.IDPLANOPREV,    ');
          SQL.Add('       U.IDPATRO, U.IDELEMDEMONSTRAT, U.HITCODHIST, U.IDPESSOA, ');
          SQL.Add('       U.IDMODULO, U.IDUSUARIOINCLUSAO, U.LACVALOR,');
          SQL.Add('       U.TIPCODIGO, MAX(U.SUBCONTADEB) AS SUBCONTADEB, MAX(U.SUBCONTACRE) AS SUBCONTACRE,');
          SQL.Add('       MAX(U.CCUSTDEB) AS CCUSTDEB, MAX(U.CCUSTCRE) AS CCUSTCRE,');
          SQL.Add('       MAX(U.PLACONTAD) AS PLACONTAD, MAX(U.PLACONTAC) AS PLACONTAC, ');
          SQL.Add('       U.PLANO, U.LACTIPO, U.LACNUMDOC, U.LACHIST1, ');
          SQL.Add('       U.LACHIST2, U.LACHIST3, U.LACHIST4, U.LACHIST5, ');
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
          SQL.Add('(SELECT L.PLNCODIGO, L.LACNUMLAN, L.UNIDNEGOC, L.IDPLANOPREV,          ');
          SQL.Add('        L.IDPATRO, L.IDELEMDEMONSTRAT, L.HITCODHIST, L.IDPESSOA,       ');
          SQL.Add('        L.IDMODULO, L.IDUSUARIOINCLUSAO, L.LACVALOR,      ');
          SQL.Add('        L.TIPCODIGO, L.CODSUBCONTA AS SUBCONTADEB, (0) AS SUBCONTACRE, ');
          SQL.Add('        L.CODCENTROCUSTO AS CCUSTDEB, ('''') AS CCUSTCRE,                ');
          SQL.Add('        L.PLACONTA AS PLACONTAD, ('''') AS PLACONTAC,                    ');
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
          SQL.Add('        SC.NOMESUBCONTA AS NOMESUBCONTAD,('''') AS NOMESUBCONTAC, CC.NOME AS NOMECCUSTOD, ('''') AS NOMECCUSTOC ');
          SQL.Add(' FROM LANCAMENTO L, PLANOCONTA C, UNIDNEGOCIO UN, SUBCONTA SC, CENTCUST CC  ');
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
          SQL.Add('UNION  ');
          SQL.Add(' SELECT L.PLNCODIGO, L.LACNUMLAN, L.UNIDNEGOC, L.IDPLANOPREV,          ');
          SQL.Add('        L.IDPATRO, L.IDELEMDEMONSTRAT, L.HITCODHIST, L.IDPESSOA,       ');
          SQL.Add('        L.IDMODULO, L.IDUSUARIOINCLUSAO, L.LACVALOR,      ');
          SQL.Add('        L.TIPCODIGO, (0) AS SUBCONTADEB, L.CODSUBCONTA AS SUBCONTACRE, ');
          SQL.Add('        ('''') AS CCUSTDEB, L.CODCENTROCUSTO AS CCUSTCRE,                ');
          SQL.Add('        ('''') AS PLACONTAD, L.PLACONTA AS PLACONTAC,                    ');
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
          SQL.Add('        ('''') AS NOMESUBCONTAD, SC.NOMESUBCONTA AS NOMESUBCONTAC, ('''') AS NOMECCUSTOD, CC.NOME AS NOMECCUSTOC ');
          SQL.Add(' FROM LANCAMENTO L, PLANOCONTA C, UNIDNEGOCIO UN, SUBCONTA SC, CENTCUST CC  ');
          SQL.Add(' WHERE (L.PLNCODIGO      = :PLNCODIGO)                    ');
          SQL.Add('   AND (L.PLANO          = C.PLANO)                       ');
          SQL.Add('   AND (L.LACDEBCRE      = ''C'')                         ');
          SQL.Add('   AND (L.PLACONTA       = C.PLACONTA)                    ');
          SQL.Add('   AND (L.IDPESSOA       = UN.IDPESSOA(+))                ');
          SQL.Add('   AND (L.UNIDNEGOC      = UN.UNIDNEGOC(+))               ');
          SQL.Add('   AND (L.IDPESSOA       = SC.IDPESSOA(+))                ');
          SQL.Add('   AND (L.CODSUBCONTA    = SC.CODSUBCONTA(+))             ');
          SQL.Add('   AND (L.IDEMPRESA      = CC.IDEMPRESA(+))               ');
          SQL.Add('   AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) ) U');
          SQL.Add('GROUP BY U.PLNCODIGO, U.LACNUMLAN, U.UNIDNEGOC, U.IDPLANOPREV,    ');
          SQL.Add('         U.IDPATRO, U.IDELEMDEMONSTRAT, U.HITCODHIST, U.IDPESSOA, ');
          SQL.Add('         U.IDMODULO, U.IDUSUARIOINCLUSAO, U.LACVALOR,');
          SQL.Add('         U.PLANO, U.LACTIPO, U.LACNUMDOC, U.LACHIST1, ');
          SQL.Add('         U.LACHIST2, U.LACHIST3, U.LACHIST4, U.LACHIST5, ');
          SQL.Add('         U.TIPCODIGO,U.NOMEATIVPROJ, U.UNECODIGO      ');
          SQL.Add('ORDER BY U.PLNCODIGO, U.LACNUMLAN  ');

          Prepare;

          ParamByName('PLNCODIGO').asFloat := IdPlnCodigo;

          Result := Data;
          FcdsLancamentoEsp.Data := Result;

      Finally
        Free;
      End;
   End;

procedure TCtrlLancamento.SetcdsLancamento(const Value: TClientDataSet);
begin
  FcdsLancamento := Value;
end;

procedure TCtrlLancamento.SetcdsLancamentoEsp(const Value: TClientDataSet);
begin
  FcdsLancamentoEsp := Value;
end;


function TCtrlLancamento.SelecionaPlanilhas(IdPlnCodigo, IdPlanilhaIni,IdPlanilhaFim,IdEmpresa: Double;
  iExercicio, iPeriodo: Integer; TipoPeriodo: TTipoPeriodo; sDataIni,
  sDataFim, sModulos, sTipoOper: String; TipoEfetivado: TTipoEfetivado;
  TipoOrdenaLanc: TTipoOrdenaLanc) : OleVariant;
begin
   {Funcão implementada na Aplicação Servidora}
{   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.SelecionaPlanilhas(IdPlnCodigo, IdPlanilhaIni,IdPlanilhaFim,IdEmpresa,
                                     iExercicio, iPeriodo, Integer(TipoPeriodo), sDataIni, sDataFim, sModulos, sTipoOper,
                                     Integer(TipoEfetivado), Integer(TipoOrdenaLanc));
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin }
    Result := True;
    With TCMSqlParams.Create(nil) Do
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
          FcdsPlanilha.Data := Result;


      Finally
        Free;
      End;
end;
{
procedure TCtrlLancamento.SetdspPlanilha(const Value: TDataSetProvider);
begin
  FdspPlanilha := Value;
end;

procedure TCtrlLancamento.SetqryPlanilha(const Value: TwwQuery);
begin
  FqryPlanilha := Value;
end;

procedure TCtrlLancamento.SetdspTipoOper(const Value: TDataSetProvider);
begin
  FdspTipoOper := Value;
end;

procedure TCtrlLancamento.SetqryTipoOper(const Value: TwwQuery);
begin
  FqryTipoOper := Value;
end;
 }

function TCtrlLancamento.EstornaLancaContab(iUsuario,iPlnCodigo, iModuloOrigem,iEmpresa : Double; bUsaPlanoPatro : Boolean; sDataEstorno : String ) : Boolean;
var sHistorico,sCCustoDeb,sCCustoCre,sContaDeb,sContaCre,sMens, sEfetivado : String;
    iPlnCodigoNovo,liSubContaCre, liSubContaDeb :Double;
    iNumLan : LongInt;
    sTipoLanc : Char;
begin
   sMens := '';
   Result := True;
   Try
      _dbPlanilha.Plncodigo.AsFloat := iPlnCodigo;
      if not _dbPlanilha.LoadFromDb then begin
         sMens := 'Planilha não encontrada';
         Abort;
      end;
      if iEmpresa  <> _dbPlanilha.idPessoa.AsFloat then begin
         sMens := 'Planilha não pertence a empresa '+FloatToStr(iEmpresa);
         Abort;
      end;
      If Not Contab.SelecionaParametros(_dbPlanilha.idPessoa.AsFloat) Then Begin
         sMens := Contab.MessageInfo;
         Abort;
      End;
      if not Periodo.RetornaPeriodoExercicioData(_dbPlanilha.idPessoa.AsFloat,sDataEstorno) then begin
         sMens := Periodo.MessageInfo;
         Abort;
      end;
      if iModuloOrigem = 1 then begin
         if Periodo.TestaPeriodoBloqueado(_dbPlanilha.idPessoa.AsFloat,tbBloqueado,Periodo.Periodo,Periodo.Exercicio,False) then begin
            sMens := Periodo.MessageInfo+' para estorno de lançamento';
            Abort;
         end;
         sEfetivado := 'S';
      end else begin
         if Periodo.TestaPeriodoBloqueado(_dbPlanilha.idPessoa.AsFloat,tbBloqOuInt,Periodo.Periodo,Periodo.Exercicio,False) then begin
            sMens := Periodo.MessageInfo+' para estorno de lançamento';
            Abort;
         end;
         if not Contab.TestaDataBloqueada(_dbPlanilha.idPessoa.AsFloat, sDataEstorno) then begin
            sMens := Contab.MessageInfo;
            Abort;
         end;
         sEfetivado := 'N';
      end;
      

      _Cds.Data := GetDataPacket('SELECT * FROM LANCAMENTO WHERE (PLNCODIGO = '+FloatToStr(iPlnCodigo)+') ORDER BY LACNUMLAN');

      iPlnCodigoNovo := 0;
      while not _Cds.eof do begin
         if _Cds.FieldByName('LACTIPO').AsString = '2' then begin
            iNumLan := _Cds.FieldByName('LACNUMLAN').AsInteger;
            if _Cds.FieldByName('LACDEBCRE').AsString = 'D' Then Begin
               sTipoLanc    := '1';
               FlcValOfiCre := _Cds.FieldByName('LACVALOFICIAL').AsFloat;
               FlcValHisCre := _Cds.FieldByName('LACVALHIST').AsFloat;
               FlcValGerCre := _Cds.FieldByName('LACVALGERENCIAL').AsFloat;
               FlcValGe1Cre := _Cds.FieldByName('LACVALGEREN1').AsFloat;
               FlcValGe2Cre := _Cds.FieldByName('LACVALGEREN2').AsFloat;
               liSubContaDeb:= 0;
               liSubContaCre:= _Cds.FieldByName('CODSUBCONTA').AsFloat;
               sContaDeb    := '';
               sContaCre    := _Cds.FieldByName('PLACONTA').AsString;
               sCCustoDeb   := '';
               sCCustoCre   := _Cds.FieldByName('CODCENTROCUSTO').AsString;
               
               FlcTipConvOfiCre := _Cds.FieldByName('LACTIPCONVOFICIAL').AsString;
               FlcTipConvGerCre := _Cds.FieldByName('LACTIPCONVGER').AsString;
               FlcTipConvGe1Cre := _Cds.FieldByName('LACTIPCONVGEREN1').AsString;
               FlcTipConvGe2Cre := _Cds.FieldByName('LACTIPCONVGEREN2').AsString;
               
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
               FlcOriAplCre     := _Cds.FieldByName('LACORIGEMAPLIC').AsString;
            end else begin
               sTipoLanc    := '0';
               FlcValOfiDeb := _Cds.FieldByName('LACVALOFICIAL').AsFloat;
               FlcValHisDeb := _Cds.FieldByName('LACVALHIST').AsFloat;
               FlcValGerDeb := _Cds.FieldByName('LACVALGERENCIAL').AsFloat;
               FlcValGe1Deb := _Cds.FieldByName('LACVALGEREN1').AsFloat;
               FlcValGe2Deb := _Cds.FieldByName('LACVALGEREN2').AsFloat;
               
               liSubContaCre:= 0;
               liSubContaDeb:= _Cds.FieldByName('CODSUBCONTA').AsFloat;
               sContaCre    := '';
               sContaDeb    := _Cds.FieldByName('PLACONTA').AsString;
               sCCustoCre   := '';
               sCCustoDeb   := _Cds.FieldByName('CODCENTROCUSTO').AsString;
               
               FlcTipConvOfiDeb := _Cds.FieldByName('LACTIPCONVOFICIAL').AsString;
               FlcTipConvGerDeb := _Cds.FieldByName('LACTIPCONVGER').AsString;
               FlcTipConvGe1Deb := _Cds.FieldByName('LACTIPCONVGEREN1').AsString;
               FlcTipConvGe2Deb := _Cds.FieldByName('LACTIPCONVGEREN2').AsString;
               
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
               FlcOriAplDeb     := _Cds.FieldByName('LACORIGEMAPLIC').AsString;
            end;
            _Cds.Next;
            if iNumLan = _Cds.FieldByName('LACNUMLAN').AsFloat then begin
               if _Cds.FieldByName('LACDEBCRE').AsString = 'D' Then begin
                  FlcValOfiCre     := _Cds.FieldByName('LACVALOFICIAL').AsFloat;
                  FlcValHisCre     := _Cds.FieldByName('LACVALHIST').AsFloat;
                  FlcValGerCre     := _Cds.FieldByName('LACVALGERENCIAL').AsFloat;
                  FlcValGe1Cre     := _Cds.FieldByName('LACVALGEREN1').AsFloat;
                  FlcValGe2Cre     := _Cds.FieldByName('LACVALGEREN2').AsFloat;
                  liSubContaCre    := _Cds.FieldByName('CODSUBCONTA').AsFloat;
                  sContaCre        := _Cds.FieldByName('PLACONTA').AsString;
                  sCCustoCre       := _Cds.FieldByName('CODCENTROCUSTO').AsString;
                  FlcTipConvOfiCre := _Cds.FieldByName('LACTIPCONVOFICIAL').AsString;
                  FlcTipConvGerCre := _Cds.FieldByName('LACTIPCONVGER').AsString;
                  FlcTipConvGe1Cre := _Cds.FieldByName('LACTIPCONVGEREN1').AsString;
                  FlcTipConvGe2Cre := _Cds.FieldByName('LACTIPCONVGEREN2').AsString;
                  FlcOriAplCre     := _Cds.FieldByName('LACORIGEMAPLIC').AsString;
               end else begin
                  FlcValOfiDeb     := _Cds.FieldByName('LACVALOFICIAL').AsFloat;
                  FlcValHisDeb     := _Cds.FieldByName('LACVALHIST').AsFloat;
                  FlcValGerDeb     := _Cds.FieldByName('LACVALGERENCIAL').AsFloat;
                  FlcValGe1Deb     := _Cds.FieldByName('LACVALGEREN1').AsFloat;
                  FlcValGe2Deb     := _Cds.FieldByName('LACVALGEREN2').AsFloat;
                  liSubContaDeb    := _Cds.FieldByName('CODSUBCONTA').AsFloat;
                  sContaDeb        := _Cds.FieldByName('PLACONTA').AsString;
                  sCCustoDeb       := _Cds.FieldByName('CODCENTROCUSTO').AsString;
                  FlcTipConvOfiDeb := _Cds.FieldByName('LACTIPCONVOFICIAL').AsString;
                  FlcTipConvGerDeb := _Cds.FieldByName('LACTIPCONVGER').AsString;
                  FlcTipConvGe1Deb := _Cds.FieldByName('LACTIPCONVGEREN1').AsString;
                  FlcTipConvGe2Deb := _Cds.FieldByName('LACTIPCONVGEREN2').AsString;
                  FlcOriAplDeb     := _Cds.FieldByName('LACORIGEMAPLIC').AsString;
               end;
               sTipoLanc    := '2';
            end else begin
               if not _Cds.Eof then _Cds.Prior;
            end;
         end else begin
            if _Cds.FieldByName('LACDEBCRE').AsString = 'D' Then begin
               sTipoLanc    := '1';
               FlcValOfiCre := _Cds.FieldByName('LACVALOFICIAL').AsFloat;
               FlcValHisCre := _Cds.FieldByName('LACVALHIST').AsFloat;
               FlcValGerCre := _Cds.FieldByName('LACVALGERENCIAL').AsFloat;
               FlcValGe1Cre := _Cds.FieldByName('LACVALGEREN1').AsFloat;
               FlcValGe2Cre := _Cds.FieldByName('LACVALGEREN2').AsFloat;
               liSubContaDeb:= 0;
               liSubContaCre:= _Cds.FieldByName('CODSUBCONTA').AsFloat;
               sContaDeb    := '';
               sContaCre    := _Cds.FieldByName('PLACONTA').AsString;
               sCCustoDeb   := '';
               sCCustoCre   := _Cds.FieldByName('CODCENTROCUSTO').AsString;
               
               FlcTipConvOfiCre := _Cds.FieldByName('LACTIPCONVOFICIAL').AsString;
               FlcTipConvGerCre := _Cds.FieldByName('LACTIPCONVGER').AsString;
               FlcTipConvGe1Cre := _Cds.FieldByName('LACTIPCONVGEREN1').AsString;
               FlcTipConvGe2Cre := _Cds.FieldByName('LACTIPCONVGEREN2').AsString;
               
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
               FlcOriAplCre     := _Cds.FieldByName('LACORIGEMAPLIC').AsString;
            end else begin
               sTipoLanc    := '0';
               FlcValOfiDeb := _Cds.FieldByName('LACVALOFICIAL').AsFloat;
               FlcValHisDeb := _Cds.FieldByName('LACVALHIST').AsFloat;
               FlcValGerDeb := _Cds.FieldByName('LACVALGERENCIAL').AsFloat;
               FlcValGe1Deb := _Cds.FieldByName('LACVALGEREN1').AsFloat;
               FlcValGe2Deb := _Cds.FieldByName('LACVALGEREN2').AsFloat;
               
               liSubContaCre:= 0;
               liSubContaDeb:= _Cds.FieldByName('CODSUBCONTA').AsFloat;
               sContaCre    := '';
               sContaDeb    := _Cds.FieldByName('PLACONTA').AsString;
               sCCustoCre   := '';
               sCCustoDeb   := _Cds.FieldByName('CODCENTROCUSTO').AsString;
               
               FlcTipConvOfiDeb := _Cds.FieldByName('LACTIPCONVOFICIAL').AsString;
               FlcTipConvGerDeb := _Cds.FieldByName('LACTIPCONVGER').AsString;
               FlcTipConvGe1Deb := _Cds.FieldByName('LACTIPCONVGEREN1').AsString;
               FlcTipConvGe2Deb := _Cds.FieldByName('LACTIPCONVGEREN2').AsString;
               
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
               FlcOriAplDeb     := _Cds.FieldByName('LACORIGEMAPLIC').AsString;
            end;
         end;
         FlcElemento      := _Cds.FieldByName('IDELEMDEMONSTRAT').AsFloat;
         FlcPanCodigo     := _dbPlanilha.PanCodigo.AsFloat;
         FlcPlnEstorno    := iPlnCodigo;
         sHistorico := Trim('ESTORNO '+_Cds.FieldByName('LACHIST1').AsString+' '+
                                  _Cds.FieldByName('LACHIST2').AsString+' '+
                                  _Cds.FieldByName('LACHIST3').AsString+' '+
                                  _Cds.FieldByName('LACHIST4').AsString+' '+
                                  _Cds.FieldByName('LACHIST5').AsString);
         if not InsereLancaContab( sTipoLanc, iEmpresa, iModuloOrigem,
                           iUsuario, _Cds.FieldByName('PLANO').AsFloat,
                           _Cds.FieldByName('UNIDNEGOC').AsFloat,
                           liSubContaDeb,liSubContaCre,
                           _Cds.FieldByName('IDPLANOPREV').AsFloat,
                           _Cds.FieldByName('IDPATRO').AsFloat, iPlnCodigoNovo,0,
                           sDataEstorno, _Cds.FieldByName('LACNUMDOC').AsString,
                           sHistorico,'', '', '','', _Cds.FieldByName('TIPCODIGO').AsString,
                           sCCustoDeb, sContaDeb, sCCustoCre, sContaCre,
                           _Cds.FieldByName('HITCODHIST').AsString,
                           _Cds.FieldByName('LACVALOR').AsFloat,False,
                           bUsaPlanoPatro) then begin
            sMens := MessageInfo;
            Abort;
         end;
         iPlnCodigoNovo := FRetornoPlnCodigo;
         _Cds.Next;
      end;
   Except
      MessageInfo := sMens;
      Result      := False;
   end;
end;

function TCtrlLancamento.ExcluiLancaContab(iUsuario,iPlnCodigo, iModuloOrigem : Double; iNumLan : LongInt; bUsaPlanoPatro, bExcluiPlanilha : Boolean ) : Boolean;
var sMens, sEfetivado : String;
    idEmpresa : Double;
begin
   sMens := '';
   Result := True;
   Try
      _dbPlanilha.Plncodigo.AsFloat := iPlnCodigo;
      if not _dbPlanilha.LoadFromDb then begin
         sMens := 'Planilha não encontrada';
         Abort;
      end;

      If Not Contab.SelecionaParametros(_dbPlanilha.idPessoa.AsFloat) Then
      Begin
         Result := False;
         sMens := Contab.MessageInfo;
         Abort;
      End;

      if not Periodo.RetornaPeriodoExercicioData(_dbPlanilha.idPessoa.AsFloat,_dbPlanilha.PlnDatDia.AsString) then begin
         sMens := Periodo.MessageInfo;
         Abort;
      end;
      if iModuloOrigem = 1 then begin
         if Periodo.TestaPeriodoBloqueado(_dbPlanilha.idPessoa.AsFloat,tbBloqueado,_dbPlanilha.perNumero.AsInteger,_dbPlanilha.perExercicio.AsInteger,False) then begin
            sMens := Periodo.MessageInfo+' para exclusão de lançamento';
            Abort;
         end;
      end else begin
         if Periodo.TestaPeriodoBloqueado(_dbPlanilha.idPessoa.AsFloat,tbBloqOuInt,_dbPlanilha.perNumero.AsInteger,_dbPlanilha.perExercicio.AsInteger,False) then begin
            sMens := Periodo.MessageInfo+' para exclusão de lançamento';
            Abort;
         end;
         if not Contab.TestaDataBloqueada(_dbPlanilha.idPessoa.AsFloat, _dbPlanilha.PlnDatDia.AsString) then begin
            sMens := Contab.MessageInfo;
            Abort;
         end;
      end;

      sEfetivado := _dbPlanilha.PlnEfetivado.AsString;
      idEmpresa  := _dbPlanilha.idPessoa.AsFloat;

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
               Abort;
            end;
         end;
         if SelecionaLancamentos(iPlncodigo,idEmpresa,0,0,tpSoPeriodo,'','','','',teAmbos,
                              tomAmbos,tolPlnCodigo,tsSemSoma,False) then begin
            while not FcdsLancamento.Eof do begin
               _dbLancamento.PlnCodigo.AsFloat := iPlnCodigo;
               _dbLancamento.LacNumLan.AsFloat := FcdsLancamento.FieldByName('LACNUMLAN').AsFloat;
               _dbLancamento.LacDebCre.AsString:= FcdsLancamento.FieldByName('LACDEBCRE').AsString;
               if _dbLancamento.LoadFromDb then begin
                  if sEfetivado = 'S' then begin
                     if not ContaContabil.BuscaMascaraConta(_dbLancamento.Plano.AsFloat) then begin
                        sMens:=ContaContabil.MessageInfo;
                        Abort;
                     end;
                     if not AtuSaldoContas (IdEmpresa, _dbLancamento.UnidNegoc.AsFloat,
                                           iUsuario, _dbLancamento.idPlanoPrev.AsFloat,
                                           _dbLancamento.idPatro.AsFloat,
                                           _dbLancamento.Plano.AsFloat,
                                           Periodo.Exercicio,Periodo.Periodo,
                                           _dbLancamento.CodSubConta.AsInteger,
                                           _dbLancamento.CodCentroCusto.AsString,
                                           _dbLancamento.PlaConta.AsString,
                                           FcdsLancamento.FieldByName('LACDEBCRE').AsString,'A',
                                           _dbLancamento.Lacvalor.AsFloat*-1,0,
                                           _dbLancamento.Lacvaloficial.AsFloat*-1,
                                           _dbLancamento.Lacvalgerencial.AsFloat*-1,
                                           _dbLancamento.Lacvalgeren1.AsFloat*-1,
                                           _dbLancamento.Lacvalgeren2.AsFloat*-1,
                                           _dbLancamento.Lacvalhist.AsFloat*-1, bUsaPlanoPatro) then begin
                        sMens := MessageInfo;
                        Abort;
                     end;
                     if not AtuSaldoSintetica(IdEmpresa, _dbLancamento.UnidNegoc.AsFloat,
                                           iUsuario, _dbLancamento.idPlanoPrev.AsFloat,
                                           _dbLancamento.idPatro.AsFloat,
                                           _dbLancamento.Plano.AsFloat,
                                           Periodo.Exercicio,Periodo.Periodo,
                                           _dbLancamento.CodSubConta.AsInteger,
                                           _dbLancamento.CodCentroCusto.AsString,
                                           _dbLancamento.PlaConta.AsString,
                                           FcdsLancamento.FieldByName('LACDEBCRE').AsString,ContaContabil.MascaraConta,
                                           _dbLancamento.Lacvalor.AsFloat*-1,0,
                                           _dbLancamento.Lacvaloficial.AsFloat*-1,
                                           _dbLancamento.Lacvalgerencial.AsFloat*-1,
                                           _dbLancamento.Lacvalgeren1.AsFloat*-1,
                                           _dbLancamento.Lacvalgeren2.AsFloat*-1,
                                           _dbLancamento.Lacvalhist.AsFloat*-1, bUsaPlanoPatro) then begin
                        sMens := MessageInfo;
                        Abort;
                     end;
                  end;
                  if not _dbLancamento.Delete then begin
                     sMens := _dbLancamento.MessageInfo;
                     Abort;
                  end;
               end;
               FcdsLancamento.Next;
            end;
            if bExcluiPlanilha then begin
               if not _dbPlanilha.Delete then begin
                  sMens := _dbPlanilha.MessageInfo;
                  Abort;
               end;
            end;
         end else begin
            sMens := MessageInfo;
            Abort;
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
                  Abort;
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
                  Abort;
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
                  Abort;
               end;
            end;
            if not _dbLancamento.Delete then begin
               sMens := _dbLancamento.MessageInfo;
               Abort;
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
                  Abort;
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
                  Abort;
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
                  Abort;
               end;
            end;
            if not _dbLancamento.Delete then begin
               sMens := _dbLancamento.MessageInfo;
               Abort;
            end;
         end;
         if iNumLan = _dbPlanilha.PlnNumLan.AsInteger then
            _dbPlanilha.PlnNumLan.AsFloat := _dbPlanilha.PlnNumLan.AsFloat -1;
         if not _dbPlanilha.UpDate then begin
            sMens := _dbPlanilha.MessageInfo;
            Abort;
         end;
      end;
      FRetornoPlnCodigo := iPlnCodigo;
   Except
      MessageInfo := sMens;
      Result      := False;
   end;
end;

function TCtrlLancamento.InsereLancaContab(cTipoLanc : Char; IdEmpresa, iModuloOrigem,
                      liUsuario, liCodPlano, liUnidNegoc, liSubContaDeb,
                      liSubContaCre, iPlanoPrev, iPatro, liPlnCodigo: Double; iNumLan : LongInt;
                      sDataLanc, sNumDoc, sHist1, sHist2,  sHist3,  sHist4,
                      sHist5, sTipoOper, cCCustd, cContad, cCCustc, cContac, sCodHist : string;
                      rValLanc : double; bJunta, bUsaPlanoPatro : Boolean ) : Boolean;
var rAux : Double;
    sConta, sEfetivado, sMens, sAux : String;
    bIncluiPlanilha, bIncluiLanc : Boolean;
begin
   If Not Contab.SelecionaParametros(IdEmpresa) Then
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

   end else begin
      Try
         if bUsaPlanoPatro then begin
            if ((iPlanoPrev = 0) or (iPatro = 0)) then begin
               sMens := 'Plano ou Patrocinadora não preenchido';
               Abort;
            end;
         end else begin
            iPlanoPrev := 0;
            iPatro     := 0;
         end;
         if sTipoOper = '' then begin
            sMens := 'Obrigatório indicar o Tipo de Operação';
            Abort;
         end;
         if not Periodo.RetornaPeriodoExercicioData(IdEmpresa,sDataLanc) then begin
            sMens := Periodo.MessageInfo;
            Abort;
         end;
         if iModuloOrigem = 1 then begin
            if Periodo.TestaPeriodoBloqueado(idEmpresa,tbBloqueado,Periodo.Periodo,Periodo.Exercicio,False) then begin
               sMens := Periodo.MessageInfo+' para lançamento';
               Abort;
            end;
         end else begin
            if Periodo.TestaPeriodoBloqueado(idEmpresa,tbBloqOuInt,Periodo.Periodo,Periodo.Exercicio,False) then begin
               sMens := Periodo.MessageInfo+' para lançamento';
               Abort;
            end;
            if not Contab.TestaDataBloqueada(idEmpresa, sDataLanc) then begin
               sMens := Contab.MessageInfo;
               Abort;
            end;
         end;
         cContaD := Trim(cContaD);
         cContaC := Trim(cContaC);
         if liSubContaDeb < 0 then liSubContaDeb := 0;
         if liSubContaCre < 0 then liSubContaCre := 0;
         
         FlcValOfiCre     := RoundCM(FlcValOfiCre,2);
         FlcValGerCre     := RoundCM(FlcValGerCre,2);
         FlcValGe1Cre     := RoundCM(FlcValGe1Cre,2);
         FlcValGe2Cre     := RoundCM(FlcValGe2Cre,2);
         FlcValOfiDeb     := RoundCM(FlcValOfiDeb,2);
         FlcValGerDeb     := RoundCM(FlcValGerDeb,2);
         FlcValGe1Deb     := RoundCM(FlcValGe1Deb,2);
         FlcValGe2Deb     := RoundCM(FlcValGe2Deb,2);
         FlcValHisCre     := RoundCM(FlcValHisCre,2);
         FlcValHisDeb     := RoundCM(FlcValHisDeb,2);
         rValLanc         := RoundCM(rValLanc,2);
         Case cTipoLanc of
           '2' : Begin
                    if ((cContaD = '') or (cContaC = '')) then begin
                       sMens := 'Para lançamento de partida dobrada obrigatório indicar a conta a débito e a crédito';
                       Abort;
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
                       Abort;
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
                       Abort;
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
         if not Contab.SelecionaPlanoData(idEmpresa,sDataLanc) then begin
            sMens := 'Plano de Contas Inválido';
            Abort;
         end;
         //Faz o DE-Para do plano de contas
         if liCodPlano <> Contab.PlanoData then begin
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
               FlcCentroCusto:=cCCustd;
               FlcSubConta   :=liSubContaDeb;
               if not TestaContaLancamento(cContaD,'D', sDataLanc,liCodPlano,idEmpresa,iModuloOrigem) then begin
                  sMens := MessageInfo;
                  Abort;
               end;
               cCCustd       :=FlcCentroCusto;
               liSubContaDeb :=FlcSubConta;
               // Faz cálculo da outra moeda para débito
               if ContaContabil.MoedaHistorica <> 0 then begin
                  if not RetornaCotacao(ContaContabil.MoedaHistorica,sDataLanc,True) then begin
                     sMens:=MessageInfo+' para a conta a Débito '+cContaD;
                     Abort;
                  end else begin
                     if FValorCotacao <> 0 then
                        FlcValHisDeb := rValLanc / FValorCotacao;
                  end;
               end;
            end;
            if (cContaC <> '') then begin
               FlcCentroCusto:=cCCustC;
               FlcSubConta   :=liSubContaCre;
               if not TestaContaLancamento(cContaC,'C', sDataLanc,liCodPlano,idEmpresa,iModuloOrigem) then begin
                  sMens := MessageInfo;
                  Abort;
               end;
               cCCustc       :=FlcCentroCusto;
               liSubContaCre :=FlcSubConta;
               // Faz cálculo da outra moeda para crédito
               if ContaContabil.MoedaHistorica <> 0 then begin
                  if not RetornaCotacao(ContaContabil.MoedaHistorica,sDataLanc,True) then begin
                     sMens:=MessageInfo+' para a conta a Crédito '+cContaC;
                     Abort;
                  end else begin
                     if FValorCotacao <> 0 then
                        FlcValHisCre := rValLanc / FValorCotacao;
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
               Abort;
            end else begin
               if not RetornaAtivProjPadrao(idEmpresa) then begin
                  sMens:=MessageInfo;
                  Abort;
               end else begin
                  liUnidNegoc := FAtivProjPadrao;
               end;
            end;
         end;
         bIncluiPlanilha := True;
         bIncluiLanc     := True;
         if liPlnCodigo <> 0 then begin
            if SelecionaPlanilhas(liPlnCodigo,0,0,idEmpresa,0,0,tpSoPeriodo,'','','','',teAmbos,tolPlnCodigo) then
            begin
              if FcdsPlanilha.FieldByName('PLNDATDIA').AsDateTime <> StrToDate(sDataLanc) then begin
                 sMens:='Planilha com código interno '+FcdsPlanilha.FieldByName('PLNCODIGO').AsString+' não pertence ao dia '+sDataLanc;
                 Abort;
              end;
              bIncluiPlanilha := False;
              sEfetivado      := FcdsPlanilha.FieldByName('PLNEFETIVADO').AsString;
            end else begin
               sMens := MessageInfo;
               Abort;
            end;
         end;
         if bIncluiPlanilha then begin
            FProxPlanilha  := 1;
            FNumLancamento := 1;
            if not RetornaProximaPlanilha(idEmpresa,sDataLanc, Periodo.Periodo, Periodo.Exercicio) then Abort;
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
               _dbPlanilha.Plntotdeboficial.AsFloat := FlcValOfiDeb;
               _dbPlanilha.Plntotdebhist.AsFloat    := FlcValHisDeb;
               _dbPlanilha.Plntotdebgeren2.AsFloat  := FlcValGe2Deb;
               _dbPlanilha.Plntotdebgeren1.AsFloat  := FlcValGe1Deb;
               _dbPlanilha.Plntotdebger.AsFloat     := FlcValGerDeb;
               _dbPlanilha.Plntotdeb.AsFloat        := rValLanc;
            end;
            if (cTipoLanc = '1') or (cTipoLanc = '2') then begin
               _dbPlanilha.Plntotcreoficial.AsFloat := FlcValOfiCre;
               _dbPlanilha.Plntotcrehist.AsFloat    := FlcValHisCre;
               _dbPlanilha.Plntotcregeren2.AsFloat  := FlcValGe2Cre;
               _dbPlanilha.Plntotcregeren1.AsFloat  := FlcValGe1Cre;
               _dbPlanilha.Plntotcreger.AsFloat     := FlcValGerCre;
               _dbPlanilha.Plntotcre.AsFloat        := rValLanc;
            end;
            if not _dbPlanilha.Insert then begin
               sMens := _dbPlanilha.MessageInfo;
               Abort;
            end;
         end else begin
            //Verifica bJunta
            if bJunta then begin
               if cTipoLanc = '0' then begin
                  if RetornaNumLanc(idEmpresa,liPlnCodigo, liCodPlano,
                            liSubContaDeb,liUnidNegoc, iPlanoPrev, iPatro, cContaD,
                            cCCustD,'D') then bIncluiLanc := False;
               end else begin
                  if RetornaNumLanc(idEmpresa,liPlnCodigo, liCodPlano,
                            liSubContaCre,liUnidNegoc, iPlanoPrev, iPatro, cContaC,
                            cCCustC,'C') then bIncluiLanc := False;
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
               _dbPlanilha.Plntotdeboficial.AsFloat := _dbPlanilha.Plntotdeboficial.AsFloat + FlcValOfiDeb;
               _dbPlanilha.Plntotdebhist.AsFloat    := _dbPlanilha.Plntotdebhist.AsFloat    + FlcValHisDeb;
               _dbPlanilha.Plntotdebgeren2.AsFloat  := _dbPlanilha.Plntotdebgeren2.AsFloat  + FlcValGe2Deb;
               _dbPlanilha.Plntotdebgeren1.AsFloat  := _dbPlanilha.Plntotdebgeren1.AsFloat  + FlcValGe1Deb;
               _dbPlanilha.Plntotdebger.AsFloat     := _dbPlanilha.Plntotdebger.AsFloat     + FlcValGerDeb;
               _dbPlanilha.Plntotdeb.AsFloat        := _dbPlanilha.Plntotdeb.AsFloat        + rValLanc;
            end;
            if (cTipoLanc = '1') or (cTipoLanc = '2') then begin
               _dbPlanilha.Plntotcreoficial.AsFloat := _dbPlanilha.Plntotcreoficial.AsFloat + FlcValOfiCre;
               _dbPlanilha.Plntotcrehist.AsFloat    := _dbPlanilha.Plntotcrehist.AsFloat    + FlcValHisCre;
               _dbPlanilha.Plntotcregeren2.AsFloat  := _dbPlanilha.Plntotcregeren2.AsFloat  + FlcValGe2Cre;
               _dbPlanilha.Plntotcregeren1.AsFloat  := _dbPlanilha.Plntotcregeren1.AsFloat  + FlcValGe1Cre;
               _dbPlanilha.Plntotcreger.AsFloat     := _dbPlanilha.Plntotcreger.AsFloat     + FlcValGerCre;
               _dbPlanilha.Plntotcre.AsFloat        := _dbPlanilha.Plntotcre.AsFloat        + rValLanc;
            end;
            if not _dbPlanilha.Update then begin
               sMens := _dbPlanilha.MessageInfo;
               Abort;
            end;
         end;
         if bIncluiLanc then begin
            _dbLancamento.Plncodigo.AsFloat := _dbPlanilha.Plncodigo.AsFloat;
            _dbLancamento.Lacnumlan.AsFloat := FNumLancamento;
            _dbLancamento.Lactipo.AsString  := cTipoLanc;
            _dbLancamento.Unidnegoc.AsFloat := liUnidNegoc;
            _dbLancamento.Idpessoa.AsFloat  := idEmpresa;
            _dbLancamento.Tipcodigo.AsString:= sTipoOper;
            _dbLancamento.Plano.AsFloat     := liCodPlano;
            _dbLancamento.Lacvalor.AsFloat  := RoundCM(rValLanc,2);
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
               _dbLancamento.Lacvaloficial.AsFloat      := RoundCM(FlcValOfiDeb,2);
               _dbLancamento.Lacvalhist.AsFloat         := RoundCM(FlcValHisDeb,2);
               _dbLancamento.Lacvalgeren2.AsFloat       := RoundCM(FlcValGe2Deb,2);
               _dbLancamento.Lacvalgeren1.AsFloat       := RoundCM(FlcValGe1Deb,2);
               _dbLancamento.Lacvalgerencial.AsFloat    := RoundCM(FlcValGerDeb,2);
               _dbLancamento.Lactipconvoficial.AsString := FlcTipConvOfiDeb;
               _dbLancamento.Lactipconvger.AsString     := FlcTipConvGerDeb;
               _dbLancamento.Lactipconvgeren1.AsString  := FlcTipConvGe1Deb;
               _dbLancamento.Lactipconvgeren2.AsString  := FlcTipConvGe2Deb;
               _dbLancamento.Lacorigemaplic.AsString    := FlcOriAplDeb;
               if cCCustD <> '' then
                  _dbLancamento.Idempresa.AsFloat    := idEmpresa;
               if not _dbLancamento.Insert then begin
                  sMens := _dbLancamento.MessageInfo;
                  Abort;
               end;
            end;
            if cContaC <> '' then begin
               _dbLancamento.Lacdebcre.AsString         := 'C';
               _dbLancamento.Placonta.AsString          := cContaC;
               _dbLancamento.Codcentrocusto.AsString    := cCCustC;
               _dbLancamento.Codsubconta.AsFloat        := liSubContaCre;
               _dbLancamento.Lacvaloficial.AsFloat      := RoundCM(FlcValOfiCre,2);
               _dbLancamento.Lacvalhist.AsFloat         := RoundCM(FlcValHisCre,2);
               _dbLancamento.Lacvalgeren2.AsFloat       := RoundCM(FlcValGe2Cre,2);
               _dbLancamento.Lacvalgeren1.AsFloat       := RoundCM(FlcValGe1Cre,2);
               _dbLancamento.Lacvalgerencial.AsFloat    := RoundCM(FlcValGerCre,2);
               _dbLancamento.Lactipconvoficial.AsString := FlcTipConvOfiCre;
               _dbLancamento.Lactipconvger.AsString     := FlcTipConvGerCre;
               _dbLancamento.Lactipconvgeren1.AsString  := FlcTipConvGe1Cre;
               _dbLancamento.Lactipconvgeren2.AsString  := FlcTipConvGe2Cre;
               _dbLancamento.Lacorigemaplic.AsString    := FlcOriAplCre;
               if cCCustC <> '' then
                  _dbLancamento.Idempresa.AsFloat    := idEmpresa;
               if not _dbLancamento.Insert then begin
                  sMens := _dbLancamento.MessageInfo;
                  Abort;
               end;
            end;
         end else begin
            if cContaD <> '' then begin
               _dbLancamento.Plncodigo.AsFloat := _dbPlanilha.Plncodigo.AsFloat;
               _dbLancamento.Lacdebcre.AsString:= 'D';
               _dbLancamento.Lacnumlan.AsFloat := FNumLancamento;
               _dbLancamento.LoadFromDb;
               _dbLancamento.Lacvalor.AsFloat        := _dbLancamento.Lacvalor.AsFloat + rValLanc;
               _dbLancamento.Lacvaloficial.AsFloat   := _dbLancamento.Lacvaloficial.AsFloat   + FlcValOfiDeb;
               _dbLancamento.Lacvalhist.AsFloat      := _dbLancamento.Lacvalhist.AsFloat      + FlcValHisDeb;
               _dbLancamento.Lacvalgeren2.AsFloat    := _dbLancamento.Lacvalgeren2.AsFloat    + FlcValGe2Deb;
               _dbLancamento.Lacvalgeren1.AsFloat    := _dbLancamento.Lacvalgeren1.AsFloat    + FlcValGe1Deb;
               _dbLancamento.Lacvalgerencial.AsFloat := _dbLancamento.Lacvalgerencial.AsFloat + FlcValGerDeb;
               if not _dbLancamento.UpDate then begin
                  sMens := _dbLancamento.MessageInfo;
                  Abort;
               end;
            end;
            if cContaC <> '' then begin
               _dbLancamento.Plncodigo.AsFloat := _dbPlanilha.Plncodigo.AsFloat;
               _dbLancamento.Lacdebcre.AsString:= 'C';
               _dbLancamento.Lacnumlan.AsFloat := FNumLancamento;
               _dbLancamento.LoadFromDb;
               _dbLancamento.Lacvalor.AsFloat        := _dbLancamento.Lacvalor.AsFloat       + rValLanc;
               _dbLancamento.Lacvaloficial.AsFloat   := _dbLancamento.Lacvaloficial.AsFloat  + FlcValOfiCre;
               _dbLancamento.Lacvalhist.AsFloat      := _dbLancamento.Lacvalhist.AsFloat     + FlcValHisCre;
               _dbLancamento.Lacvalgeren2.AsFloat    := _dbLancamento.Lacvalgeren2.AsFloat   + FlcValGe2Cre;
               _dbLancamento.Lacvalgeren1.AsFloat    := _dbLancamento.Lacvalgeren1.AsFloat   + FlcValGe1Cre;
               _dbLancamento.Lacvalgerencial.AsFloat := _dbLancamento.Lacvalgerencial.AsFloat+ FlcValGerCre;
               if not _dbLancamento.UpDate then begin
                  sMens := _dbLancamento.MessageInfo;
                  Abort;
               end;
            end;
         end;
         
         FRetornoPlnCodigo := _dbPlanilha.Plncodigo.AsFloat;
         if sEfetivado = 'S' then begin
            if not ContaContabil.BuscaMascaraConta(liCodPlano) then begin
               sMens:=ContaContabil.MessageInfo;
               Abort;
            end;
            if cContaD <> '' then begin
               if not AtuSaldoContas(IdEmpresa, liUnidNegoc,
                                     liUsuario, iPlanoPrev, iPatro, liCodPlano,
                                     Periodo.Exercicio,Periodo.Periodo,
                                     liSubContaDeb, cCCustD,cContaD,'D','A',
                                     rValLanc,0, FlcValOfiDeb,FlcValGerDeb, FlcValGe1Deb,
                                     FlcValGe2Deb, FlcValHisDeb, bUsaPlanoPatro) then begin
                  sMens := MessageInfo;
                  Abort;
               end;
               if not AtuSaldoSintetica(IdEmpresa, liUnidNegoc,
                                     liUsuario, iPlanoPrev, iPatro, liCodPlano,
                                     Periodo.Exercicio,Periodo.Periodo,
                                     liSubContaDeb, cCCustD,cContaD,'D',
                                     ContaContabil.MascaraConta,
                                     rValLanc,0, FlcValOfiDeb,FlcValGerDeb, FlcValGe1Deb,
                                     FlcValGe2Deb, FlcValHisDeb, bUsaPlanoPatro) then begin
                  sMens := MessageInfo;
                  Abort;
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
                  Abort;
               end;
               if not AtuSaldoSintetica(IdEmpresa, liUnidNegoc,
                                     liUsuario, iPlanoPrev, iPatro, liCodPlano,
                                     Periodo.Exercicio,Periodo.Periodo,
                                     liSubContaCre, cCCustC,cContaC,'C',
                                     ContaContabil.MascaraConta,
                                     rValLanc,0, FlcValOfiCre,FlcValGerCre, FlcValGe1Cre,
                                     FlcValGe2Cre, FlcValHisCre, bUsaPlanoPatro) then begin
                  sMens := MessageInfo;
                  Abort;
               end;
            end;
         end;
      Except
         FRetornoPlnCodigo := -1;
         MessageInfo := sMens;
         Result := False;
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
end;


function TCtrlLancamento.TestaContaLancamento(sConta, sTipoDC, sDataLanc: String; liCodPlano, idEmpresa, idModulo :Double): Boolean;
var sMens, sMensDC : String;
begin
   Result := True;
   sMens  := '';
   try
      if sTipoDC = 'D' then sMensDC := ' a Débito ' else sMensDC := ' a Crédito ';
      if not ContaContabil.TestaContaContabil(liCodPlano, sConta,False, False) then begin
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
      if ContaContabil.ObrigaSubConta = 'N' then begin
         FlcSubConta := 0;
      end else begin
         if FlcSubConta = 0 then begin
            sMens := 'Conta '+sConta+sMensDC+' Obriga Subconta';
            Abort;
         end;
         if not ContaContabil.TestaContaxSC(liCodPlano,idEmpresa,FlcSubConta,sConta) then begin
            sMens := ContaContabil.MessageInfo+sMensDC;
            Abort;
         end;
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
         With TCMSqlParams.Create(nil) Do
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
             free;
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
   If Not Contab.SelecionaParametros(idEmpresa) Then
   Begin
      Result := False;
      MessageInfo := Contab.MessageInfo;
      Exit;
   End;

   Result := True;

   {** GUSTAVO VIEGAS 23/04/2002 **}
   With TCmSqlParams.Create(nil) Do
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
       free;
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
end;

function TCtrlLancamento.RetornaNumLanc(idEmpresa,liPlnCodigo,
  liCodPlano, liSubConta, liUnidNegoc, iPlanoPrev, iPatro: Double; sConta,
  sCentroCusto, sDebCre: String): Boolean;
begin
   Result := True;
   FNumLancamento := 0;
   {** GUSTAVO VIEGAS 23/04/2002 **}
   With TCmSqlParams.Create(nil) Do
      Try
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
            
         _Cds.Data := Data;
      finally
        free;
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
  bJunta, bUsaPlanoPatro: Boolean): Boolean;
var sMens : String;
begin
   Result := True;
   sMens  := '';
   Try
      if not ExcluiLancaContab(liUsuario,liPlnCodigo,iModuloOrigem,iNumLan, bUsaPlanoPatro,False) then begin
         sMens:=MessageInfo;
         Abort;
      end;
      if not InsereLancaContab(cTipoLanc, IdEmpresa, iModuloOrigem, liUsuario, liCodPlano,
             liUnidNegoc, liSubContaDeb,liSubContaCre, iPlanoPrev, iPatro, liPlnCodigo,
             iNumLan, sDataLanc, sNumDoc, sHist1, sHist2, sHist3, sHist4, sHist5, sTipoOper,
             cCCustd, cContad, cCCustc, cContac, sCodHist, rValLanc,bJunta, bUsaPlanoPatro) then begin
         sMens:=MessageInfo;
         Abort;
      end;
   Except
      MessageInfo := sMens;
      Result := False;
   end;
end;
       {
procedure TCtrlLancamento.SetdspLancamentoEsp(
  const Value: TDataSetProvider);
begin
  FdspLancamentoEsp := Value;
end;

procedure TCtrlLancamento.SetqryLancamentoEsp(const Value: TwwQuery);
begin
  FqryLancamentoEsp := Value;
end;
         {
procedure TCtrlLancamento.SetdspAtivProj(const Value: TDataSetProvider);
begin
  FdspAtivProj := Value;
end;
    {
procedure TCtrlLancamento.SetqryAtivProj(const Value: TwwQuery);
begin
  FqryAtivProj := Value;
end;
                                     {
function TCtrlLancamento.SelecionaAtivProj(idEmpresa, iUnidNegoc: Double; sUneCodigo : String;
  TipoAtivProj: TTipoAtivProj;
  TipoOrdemAtivProj: TTipoOrdemAtivProj): Boolean;
begin
   {Funcão implementada na Aplicação Servidora}
  { If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.SelecionaAtivProj(idEmpresa, iUnidNegoc, sUneCodigo,
                                  Integer(TipoAtivProj), Integer(TipoOrdemAtivProj));
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      Result := True;
      FqryAtivProj.Close;
      FqryAtivProj.SQL.Clear;
      FqryAtivProj.SQL.Add('SELECT                                        ');
      FqryAtivProj.SQL.Add('   UNIDNEGOC, NOME, UNETIPO, UNECODIGO        ');
      FqryAtivProj.SQL.Add('FROM                                          ');
      FqryAtivProj.SQL.Add('   UNIDNEGOCIO                                ');
      FqryAtivProj.SQL.Add('WHERE (IDPESSOA = '+FloatToStr(IdEmpresa)+')  ');
      if iUnidNegoc <> 0 then begin
         FqryAtivProj.SQL.Add('  AND (UNIDNEGOC = '+FloatToStr(iUnidNegoc)+')');
      end;
      if sUneCodigo <> '' then begin
         FqryAtivProj.SQL.Add('  AND (UNECODIGO = '''+sUneCodigo+''')        ');
      end;
      Case TipoAtivProj of
         tapSoSinteticaAP : FqryAtivProj.SQL.Add('  AND (UNETIPO = ''S'')  ');
         tapSoAnaliticaAP : FqryAtivProj.SQL.Add('  AND (UNETIPO = ''A'')  ');
      end;
      Case TipoOrdemAtivProj of
         toapCodigo : FqryAtivProj.SQL.Add('ORDER BY UNECODIGO ');
         toapNome   : FqryAtivProj.SQL.Add('ORDER BY NOME      ');
      end;
   end;
end;
          }
procedure TCtrlLancamento.DoSetConnection;
begin
  inherited;
  Periodo.Connection := Connection;
  Contab.Connection := Connection;
  ContaContabil.Connection := Connection;
  HistoContab.Connection := Connection;
  Geral.Connection := Connection;
end;

procedure TCtrlLancamento.DoSetConnectionSide;
begin
  inherited;
  Periodo.ConnectionSide := ConnectionSide;
  Contab.ConnectionSide := ConnectionSide;
  ContaContabil.ConnectionSide := ConnectionSide;
  HistoContab.ConnectionSide := ConnectionSide;
  Geral.ConnectionSide := ConnectionSide;
end;

procedure TCtrlLancamento.DoSetConnectionType;
begin
  inherited;
  Periodo.DbConnectionType := DbConnectionType;
  Contab.DbConnectionType := DbConnectionType;
  ContaContabil.DbConnectionType := DbConnectionType;
  HistoContab.DbConnectionType := DbConnectionType;
  Geral.DbConnectionType := DbConnectionType;
end;


function TCtrlLancamento.RoundCM(rValor: Double;
  iNumCasas: Integer): Double;
begin
   if isFloatZero(rValor) then
      Result := 0
   else
      Result := Round(rValor*(power(10,iNumCasas)))/(power(10,iNumCasas));
end;

procedure TCtrlLancamento.SetcdsPlanilha(const Value: TClientDataSet);
begin
    FCdsPlanilha := Value;
end;

function TCtrlLancamento.ImportaLancamentos(dEmpresa:Double;iPlano,iUsuario,iModulo,iContMaxLin,
                   iNumCommit:Integer; sTipoOper,sCaminho:string;bTestaConta,bHistCheked,bUsaPPatro:Boolean) : Boolean;
var
  sLinha,sValor,sMens,sDataLanc,sContaD,sContaC,sCCustD,sCCustC :string;
  sHistCompleto, sMascaraHist,sDebCre,sSql,sNumDoc :string;

  sHist1,sHist2,sHist3,sHist4,sHist5,sHistorico :string;

  dValLanc,dPlnCodigo,dPlnCodigo2,dPlanilha :Double;
  iCont,iContaCommit,iSubContaC,iSubContaD,iPatro,iUnidNegoc, iPlanPrev  :integer;

  ArquivoTexto, ArquivoLog : TextFile;

  Auxdec,sTipoLanc : char;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ImportaLancamentos(dEmpresa,iPlano,iUsuario,iModulo,iContMaxLin,
                   iNumCommit, sTipoOper,sCaminho,bTestaConta,bHistCheked,bUsaPPatro,FsMensAdd);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
         FsMensAPS := Connection.AppServer.MessageInfo;

   End Else
   Begin
       //Inicializa as variáveis

       AuxDec           := DecimalSeparator;
       iCont            := 0;
       FProgresso       := 0;
       dPlnCodigo2      := 0;
       DecimalSeparator := '.';
       sMens            := '';
       sMensAdd         := '';
       iContaCommit     := 0;
       dPlanilha := 0;


       AssignFile(ArquivoTexto,sCaminho);
       Reset(ArquivoTexto);

       AssignFile(ArquivoLog,Copy(trim(sCaminho),1,Pos('.',Trim(sCaminho)))+ 'LOG');
       ReWrite(ArquivoLog);
       Read(ArquivoTexto,sLinha);

       //Verifica se a formatação está correta
       If (length(sLinha) <> 391) and (length(sLinha) <> 411) and
          (length(sLinha) <> 392) and (length(sLinha) <> 412) Then
       Begin
         MessageInfo := 'Arquivo texto com formato incompatível';
         Result := False;
         CloseFile(ArquivoLog);
         CloseFile(ArquivoTexto);
         Exit;
       End;

       //*** Deleta os lançamentos contábeis externos
       Try
         StartTransaction;
         sSql := 'DELETE FROM LANCONTABEXTERNOS';
         ExecSQL(sSql);
         Commit;
       Except
          Rollback;
       End;

       CloseFile(ArquivoTexto);
       Reset(ArquivoTexto);

       sMens := '*** Planilha Geradas ***';
       sMens := sMens + ' ';
       sMensAdd := sMens + chr(13) + chr(13);

       //Loop de Varredura do Arquivo Texto
       While (not eof(ArquivoTexto)) And (iCont <> iContMaxLin) do
       Begin

          sDataLanc   := '';
          sDebCre     := '';
          sNumDoc     := '';
          sHist1      := '';
          sHist2      := '';
          sHist3      := '';
          sHist4      := '';
          sHist5      := '';
          sValor      := '';
          iPlanPrev   := 0;
          iPatro      := 0;
          sHistorico  := '';
          sCCustD     := '';
          sContaD     := '';
          sContaC     := '';
          sDebCre     := '';
          sValor      := '';
          Try
             If ((iCont Mod iNumCommit) = 0) Then
                StartTransaction;

             Readln(ArquivoTexto,sLinha);

             iCont := iCont + 1;

             FProgresso  := FProgresso + 1;

             sDataLanc := Trim(copy(sLinha,1,10));

             sDebCre   := Trim(copy(sLinha,12,1));
             sNumDoc   := Trim(copy(sLinha,14,15));
             sHist1    := HistoContab.LimpaHisto(Trim(copy(sLinha,29, 40)),#39);
             sHist2    := HistoContab.LimpaHisto(Trim(copy(sLinha,69, 40)),#39);
             sHist3    := HistoContab.LimpaHisto(Trim(copy(sLinha,109,40)),#39);
             sHist4    := HistoContab.LimpaHisto(Trim(copy(sLinha,149,40)),#39);
             sHist5    := HistoContab.LimpaHisto(Trim(copy(sLinha,189,40)),#39);

             If length(sLinha) = 411 Then
             Begin
                iPlanPrev := StrToInt(Trim(copy(sLinha,392,10)));
                iPatro    := StrToInt(Trim(copy(sLinha,402,10)));
             End Else
             Begin
                If length(sLinha) = 412 Then
                Begin
                   iPlanPrev := StrToInt(Trim(copy(sLinha,393,10)));
                   iPatro    := StrToInt(Trim(copy(sLinha,403,10)));
                End;
             End;

             sHistCompleto := trim(sHist1) +' '+ trim(sHist2) +' '+ trim(sHist3) +' '+ trim(sHist4) +' '+ trim(sHist5);

             sValor := Trim(copy(sLinha,257,17));

             If sValor = '' Then
                sValor  := '0';

             dValLanc := StrToFloat(sValor);

             If (length(sLinha) = 392) or (length(sLinha) = 412) Then
                sHistorico := Trim(copy(sLinha,373,4))
             Else
                sHistorico := Trim(copy(sLinha,372,4));

             If sHistorico <> '' then
             Begin
                If bHistCheked Then
                Begin
                   _cds.Data := HistoContab.ListHistoContab(dEmpresa,tohCodigo,sHistorico);

                   If not _cds.isEmpty Then
                   Begin
                     sMascaraHist  := Trim(_cds.FieldByName('HITDESCR1').asString);
                     sMascaraHist  := HistoContab.LimpaHisto(sMascaraHist,#35);
                     sHistCompleto := sMascaraHist + sHistCompleto;
                   End;
                End;
             End;

             HistoContab.ArrumaHistorico(sHistCompleto);

             //Pega a Unidade de Negócio
             iUnidNegoc := StrToInt(Trim(copy(sLinha,342,8)));

             _cds.Data := ListTerceiros.ListAtivProj(dEmpresa,iUnidNegoc,'',tapAmbos,toapCodigo);

             If _cds.isEmpty Then
                iUnidNegoc := 0
             Else
                iUnidNegoc := StrToInt(_cds.FieldByName('UNIDNEGOC').AsString);

             If (length(sLinha) = 392) or (length(sLinha) = 412) Then
             Begin
                If copy(sLinha,377,8) = '' Then
                Begin
                   dPlnCodigo := 0;
                End Else
                Begin
                   If dPlanilha = StrToInt(Trim(copy(sLinha,377,8))) Then
                   Begin
                      dPlnCodigo := FRetornoPlnCodigo;
                   End Else
                   Begin
                      dPlnCodigo := 0;
                      dPlanilha  := StrToInt(Trim(copy(sLinha,377,8)));
                   End;
                End;
             End Else
             Begin
                If copy(sLinha,376,8) = '' Then
                Begin
                   dPlnCodigo := 0
                End Else
                Begin
                   If dPlanilha = StrToInt(Trim(copy(sLinha,376,8))) Then
                   Begin
                      dPlnCodigo := FRetornoPlnCodigo;
                   End Else
                   Begin
                      dPlnCodigo := 0;
                      dPlanilha  := StrToInt(Trim(copy(sLinha,376,8)));
                   End;
                End;
             End;

             //verifica se o Lançamento é a débito
             If sDebCre = 'D' Then
             Begin

                sCCustD := Trim(copy(sLinha,229,10));
                sContaD := Trim(copy(sLinha,239,18));

                If sCCustD <> '' Then
                Begin
                   If StrToInt(sCCustD) = 0 Then
                   Begin
                      sCCustD := '';
                   End;
                End;

                sContaC       := '';
                sTipoLanc     := '0';
                sDebCre       := 'D';


                FlcOriAplDeb  := Trim(copy(sLinha,13,1));

                sValor := Trim(copy(sLinha,274,17));
                If sValor = '' Then sValor := '0';
                   FlcValOfiDeb := StrToFloat(sValor);

                sValor := Trim(copy(sLinha,291,17));
                If sValor = '' Then sValor := '0';
                FlcValGerDeb := StrToFloat(sValor);

                sValor := Trim(copy(sLinha,308,17));
                If sValor = '' Then sValor := '0';
                FlcValGe1Deb := StrToFloat(sValor);

                sValor := Trim(copy(sLinha,325,17));
                If sValor = '' Then sValor := '0';
                FlcValGe2Deb := StrToFloat(sValor);


                If Trim(sCCustD) <> '' Then
                Begin
                   _cds.Data := ContaContabil.ListContasxCC(iPlano,dEmpresa,sContaD,
                                                        sCCustD,tccAmbasCC,toCodigo);

                   If _cds.isEmpty Then
                   Begin
                      sSql := 'INSERT INTO CONTASXCC ' +
                              ' (PLANO, PLACONTA, CODCENTROCUSTO, '+
                              '  IDEMPRESA, IDUSUARIOINCLUSAO) ' +
                              'VALUES (';

                      sSql := sSql + IntToStr(iPlano) + ',' + QuotedStr(sContaD) + ','+
                              QuotedStr(sCCustD) + ',' + FloatToStr(dEmpresa) + ',' +
                              IntToStr(iUsuario) + ')';

                      result := ExecSQL(sSql);
                      If not Result Then
                      Begin
                         MessageInfo := 'Erro na Inserção do Centro de Custo, em um Lançamento a Débito.';
                         Result := false;
                         Exit;
                      End
                   End;
                End;

                sValor := Trim(copy(sLinha,350,17));
                If sValor = '' Then sValor := '0';
                   FlcValHisDeb := StrToFloat(sValor);

                if (length(sLinha) = 392) or (length(sLinha) = 412) then
                   iSubContaD  := StrToInt(Trim(copy(sLinha,367,6)))
                else
                   iSubContaD  := StrToInt(Trim(copy(sLinha,367,5)));

                iSubContaC  := 0;


             //O lançamento é a crédito
             End Else
             Begin
                sCCustD := '';
                sContaD := '';

                sCCustC := Trim(copy(sLinha,229,10));
                sContaC := Trim(copy(sLinha,239,18));

                If sCCustC <> '' Then
                Begin
                   If StrToInt(sCCustC) = 0 Then
                   Begin
                      sCCustC := '';
                   End;
                End;

                sTipoLanc := '1';
                sDebCre   := 'C';

                FlcOriAplCre   := Trim(copy(sLinha,13,1));

                sValor := Trim(copy(sLinha,274,17));
                If sValor = '' Then sValor := '0';
                FlcValOfiCre := StrToFloat(sValor);

                sValor     := Trim(copy(sLinha,291,17));
                If sValor  = '' Then sValor := '0';
                FlcValGerCre := StrToFloat(sValor);

                sValor := Trim(copy(sLinha,308,17));
                If sValor = '' Then sValor := '0';
                FlcValGe1Cre := StrToFloat(sValor);

                sValor := Trim(copy(sLinha,325,17));
                If sValor = '' Then sValor := '0';
                FlcValGe2Cre := StrToFloat(sValor);

                If Trim(sCCustC) <> '' Then
                Begin

                   _cds.Data := ContaContabil.ListContasxCC(iPlano,dEmpresa,sContaC,
                                                        sCCustC,tccAmbasCC,toCodigo);

                   If _cds.isEmpty Then
                   Begin
                      sSql := 'INSERT INTO CONTASXCC ' +
                              ' (PLANO, PLACONTA, CODCENTROCUSTO, '+
                              '  IDEMPRESA, IDUSUARIOINCLUSAO) ' +
                              'VALUES (';

                      sSql := sSql + IntToStr(iPlano) + ',' + QuotedStr(sContaC) + ','+
                              QuotedStr(sCCustC) + ',' + FloatToStr(dEmpresa) + ',' +
                              IntToStr(iUsuario) + ')';

                      Result := ExecSQL(sSql);
                      If not Result Then
                      Begin
                         MessageInfo := 'Erro na Inserção do Centro de Custo, em um Lançamento a Crédito.';
                         Result := false;
                         Exit;
                      End

                   End;
                End;

                sValor := Trim(copy(sLinha,350,17));
                If sValor = '' Then sValor := '0';
                   FlcValHisCre := StrToFloat(sValor);

                iSubContaD := 0;
                If (length(sLinha) = 392) or (length(sLinha) = 412) Then
                   iSubContaC := StrToInt(Trim(copy(sLinha,367,6)))
                Else
                   iSubContaC := StrToInt(Trim(copy(sLinha,367,5)));

             End;

             If iSubContaD <> 0 Then
             Begin
                _cds.Data := SubConta.ListSubConta(dEmpresa,iSubContaD);

                If _cds.IsEmpty Then
                Begin
                   sMens := 'Sub-Conta a Débito '+IntToStr(iSubContaD)+' Inválida';
                   sMensAdd := sMensAdd + sMens + chr(13);
                   Result := False;
                   Exit;
                End;
             End;

             If iSubContaC <> 0 Then
             Begin
                _cds.Data := SubConta.ListSubConta(dEmpresa,iSubContaC);

                If _cds.IsEmpty Then
                Begin
                   sMens := 'Sub-Conta a Crédito '+IntToStr(iSubContaC)+' Inválida';
                   sMensAdd := sMensAdd + sMens + chr(13);

                   Result := False;
                   Exit;
                End;
             End;

             //*** insere os lancamentos ***
             FlcTestaConta := bTestaConta;
             If Not InsereLancaContab (sTipoLanc,dEmpresa,iModulo,iUsuario,
                                      iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                      iPlanPrev, iPatro,dPlnCodigo,0,
                                      sDataLanc,sNumDoc,sHist1,sHist2,sHist3,
                                      sHist4,sHist5,sTipoOper,sCCustD,sContaD,
                                      sCCustC,sContaC,sHistorico,
                                      dValLanc,False,bUsaPPatro) Then

             Begin
               sMensAdd := sMensAdd + MessageInfo + chr(13);
               RollBack;
               Result := False;
               Exit;
             End Else
             Begin
                 dPlnCodigo := FRetornoPlnCodigo;
             End;

             _cds.Data := Planilha.ListPlanilhas(0,dPlnCodigo);

             If dPlnCodigo <> dPlnCodigo2 Then
             Begin
                sMens := IntToStr(_cds.FieldByName('PLNPLANIL').asInteger) + ' em: ' + sDataLanc;
                sMensAdd := sMensAdd + sMens + chr(13);
                dPlnCodigo2 := dPlnCodigo;
             End;

             If ((iCont Mod iNumCommit) = 0) or (iCont = iContMaxLin) Then
             Begin
                Commit;
                iContaCommit := iCont;
             End;
          Except
             RollBack;
             CloseFile(ArquivoTexto);
             CloseFile(ArquivoLog);
             DecimalSeparator := AuxDec;

             MessageInfo :='Houve erros na importação. ' + CHR(13) + CHR(13) +
                           'A linha nº ' + IntToStr(iCont) + ' do arquivo importado está com problemas.'+ CHR(13) +
                           'Foi importado até a linha nº ' + IntToStr(iContaCommit) +'.'+ CHR(13) +
                           'Apague do seu TXT as linhas já importadas. ' + CHR(13) +
                           'Verifique os Lançamentos com inconsistências.';
             Result := False;
             Exit;
          End;
       End;

       Try
          Commit;
          Result := True;
          MessageInfo := 'Lançamentos efetuados com sucesso!';
       Except
          MessageInfo := 'Houve Problemas na Importação do Arquivo. A Importação  NÃO foi realizada.';
          RollBack;
          Result := False;
       End;
       CloseFile(ArquivoTexto);
       CloseFile(ArquivoLog);
       DecimalSeparator := AuxDec;

   End;
end;

end.


