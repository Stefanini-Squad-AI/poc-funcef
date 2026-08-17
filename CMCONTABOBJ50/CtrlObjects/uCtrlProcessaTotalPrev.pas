unit uCtrlProcessaTotalPrev;

(*==============================================================================
Analista : Alex Pereira
Data     : 05/01/04
Pendência: 14451
Rotina   : ProcessaGeraLancamentoRateioPlanPatro
           ProcessaGeraLancamentoRatAdmPlanPatro
Solução  : Criar a estrutura IDSEGREGACRITER e DATASEGREGACRITER
           no lançamento contábil.
           Esta estrutura é apenas para a nova segregação passar -1
==============================================================================*)
interface

Uses DB, uDataBase, uCmControlObject, dbclient,
      sysutils, provider, uDiasUteis,
     uCtrlLancamento, uCtrlPadroes,
     uCtrlContaContabil, CmEventosCadastro,
     uMidasUtil,uCMSqlParams, Classes, uCtrlPeriodo,
     uCMTypes,uDbRateioplanpatro,UCtrlContab,
     uDbRatAdDetPlanPatro, uDbRatAdmPlanPatro;

Type
  { upSoPool => Somente as UHs do Pool
    upSoCond => Somente as UHs do Condominio
    upTodas => Todas as UHs
  }
  //TUHPool       = (upSoPool, upSoCond, upTodas);
  TCtrlProcessaTotalPrev = class(TCmControlObject)

  Protected
      procedure AfterInitialize; Override;
      procedure OnCreateAppServer;override;
      procedure DoChangeDataBase; override;
  private
    _DbRateioplanpatro  : TDbRateioplanpatro;
    _DbRatAdmPlanpatro  : TDbRatAdmPlanpatro;
    _DbRatAdDetPlanpatro: TDbRatAdDetPlanpatro;
    _Progresso    : Integer;
    _MaxProgresso : Integer;

    Padroes        : TCtrlPadroes;
    Lancamento     : TCtrlLancamento;
    ContaContabil  : TCtrlContaContabil;
    Periodo        : TCtrlPeriodo;
    Contab         : TCtrlContab;
    DiasUteis      : TDiasUteis;

    FCdsPrin: TClientDataSet;
    FCdsDet: TClientDataSet;
    procedure SetCdsPrin(const Value: TClientDataSet);
    procedure SetCdsDet(const Value: TClientDataSet);
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;
      property CdsPrin: TClientDataSet read FCdsPrin write SetCdsPrin;
      property CdsDet: TClientDataSet read FCdsDet write SetCdsDet;
      function AplicaOperacaoSaldoCotas(dEmpresa,dModulo,dUsuario:Double): Boolean;
      function AplicaOperacaoRatAdm(dEmpresa,dModulo,dUsuario:Double;Operacao : TOperacao): Boolean;
      function ProcurarSaldoCotas(iIdRateio: Double): OleVariant;
      function ProcurarRatAdm(iIdRateio: Double): OleVariant;
      function ListaRatAdmDet(iIdRateio: Double): OleVariant;
      function ListaRatAdm: OleVariant;
      function ListaParametroCota(idEmpresa : Double): OleVariant;
      function TestaExisteRateioPlanPatro(iEmpresa : Double;iExercicio, iPeriodo : Integer): Boolean;
      function ProcessaDeletaRateioPlanPatro(iEmpresa,iModulo,iUsuario : Double;iExercicio, iPeriodo : Integer): Boolean;
      function ProcessaGeraRateioPlanPatro(sBilhete : String; iEmpresa,iModulo,iUsuario : Double;iExercicio, iPeriodo, iSinal : Integer): Boolean;
      function ListaSaldoporPlanoPatro(iEmpresa: Double; iExercicio,iPeriodo, iSinal: Integer; bSaldo, bCalcCota : Boolean): OleVariant;
      function ListaSaldoCotasporPlanoPatro(iEmpresa: Double; iExercicio,iPeriodo: Integer; bSaldo : Boolean): OleVariant;
      function ProcessaGeraLancamentoRateioPlanPatro(sBilhete,sTipoOper : String; iEmpresa,iModulo,iUsuario, iPlanoPrev, iPatro : Double;iExercicio, iPeriodo : Integer; bSomentePer : Boolean): Boolean;
      function ProcessaGeraLancamentoRatAdmPlanPatro(sBilhete,sTipoOper : String; iEmpresa,iModulo,iUsuario : Double;iExercicio, iPeriodo : Integer): Boolean;
      Function ListaSaldoN(iEmpresa, iPlanoPrev, iPatro: Double; iExercicio, iPeriodo, i: Integer): OleVariant;
      Function ListaSaldoNAdm(iEmpresa, iPlanoPrev, iPatro, iRateio: Double; iExercicio, iPeriodo: Integer): OleVariant;
      Function ListaSaldoS(iEmpresa: Double; iExercicio, iPeriodo : Integer; bSomentePer : Boolean): OleVariant;
      Function ListaSaldo(iEmpresa, iPlanoPrev, iPatro: Double; iExercicio, iPeriodo, i: Integer): OleVariant;
  end;

implementation


constructor TCtrlProcessaTotalPrev.Create;
begin
  inherited;
  Padroes       := TCtrlPadroes.create;
  Lancamento    := TCtrlLancamento.Create;
  ContaContabil := TCtrlContaContabil.Create;
  Periodo       := TCtrlPeriodo.Create;
  DiasUteis     := TDiasUteis.Create;
  Contab        := TCtrlContab.Create;
  //
  _DbRateioplanpatro  := TDbRateioplanpatro.Create(Self);
  _DbRatAdmPlanpatro  := TDbRatAdmPlanpatro.Create(Self);
  _DbRatAdDetPlanpatro:= TDbRatAdDetPlanpatro.Create(Self);
end;


destructor TCtrlProcessaTotalPrev.Destroy;
begin
  inherited;
  Padroes.free;
  Lancamento.Free;
  Contab.free;
  DiasUteis.free;
  ContaContabil.Free;
  Periodo.Free;
  _DbRateioplanpatro.Free;
  _DbRatAdmPlanpatro.Free;
  _DbRatAdDetPlanpatro.Free;
  if isAppServer then
     FreeCds([FCdsPrin,FCdsDet]);

end;


procedure TCtrlProcessaTotalPrev.OnCreateAppServer;
begin
  inherited;
  FCdsPrin := TClientDataSet.Create(nil);
  FCdsDet  := TClientDataSet.Create(nil);
end;


function TCtrlProcessaTotalPrev.ListaParametroCota(idEmpresa : Double) : OleVariant;
var sSql : String;
begin
   sSql := 'SELECT IDPESSOA, PACMOEDACOTAS FROM PARAMCONTAB '+
           'WHERE (IDPESSOA = '+FloatToStr(idEmpresa)+')';
   Result := GetDataPacket(sSql);
end;


procedure TCtrlProcessaTotalPrev.AfterInitialize;
begin
  inherited;
  Lancamento.InitializeAs(self);
  ContaContabil.InitializeAs(self);
  Periodo.InitializeAs(self);
  Contab.InitializeAs(self);
  DiasUteis.InitializeAs(self);
  Padroes.InitializeAs(self);
end;

procedure TCtrlProcessaTotalPrev.DoChangeDataBase;
begin
  inherited;
  _DbRateioplanpatro.DatabaseName := DataBaseName;
  _DbRatAdmPlanpatro.DatabaseName := DataBaseName;
  _DbRatAdDetPlanpatro.DatabaseName := DataBaseName;
end;

function TCtrlProcessaTotalPrev.TestaExisteRateioPlanPatro(
  iEmpresa: Double; iExercicio, iPeriodo: Integer): Boolean;
var sSql : String;
begin
   Result := False;
   sSql := 'SELECT IDRATEIOPLANPATRO FROM RATEIOPLANPATRO '+
           'WHERE (IDPESSOA = '+FloatToStr(iEmpresa)+')'+
           '  AND (PEREXERCICIO = '+IntToStr(iExercicio)+')';
   if iPeriodo = 0 then
      sSql := sSql + '  AND (PERNUMERO IS NULL) '
   else
      sSql := sSql + '  AND (PERNUMERO = '+IntToStr(iPeriodo)+')';

   _Cds.Data := GetDataPacket(sSql);
   if not _Cds.isEmpty then
      Result := True;
end;

function TCtrlProcessaTotalPrev.ProcessaDeletaRateioPlanPatro(
  iEmpresa,iModulo,iUsuario: Double; iExercicio, iPeriodo: Integer): Boolean;
var sSql : String;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.ProcessaDeletaRateioPlanPatro(iEmpresa,iModulo,iUsuario,iExercicio, iPeriodo);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      Result := True;
      sSql := 'DELETE RATEIOPLANPATRO '+
              'WHERE (IDPESSOA = '+FloatToStr(iEmpresa)+')'+
              '  AND (PEREXERCICIO = '+IntToStr(iExercicio)+')';
      if iPeriodo = 0 then
         sSql := sSql + '  AND (PERNUMERO IS NULL) '
      else
         sSql := sSql + '  AND (PERNUMERO = '+IntToStr(iPeriodo)+')';
      try
         StartTransaction;
         if not ExecSql(sSql) then
            Abort;

        If not Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario, 'Gera Valor da Cota - Deleção',False) then
           Raise Exception.Create( Padroes.MessageInfo );

         Commit;
      except
         On E:Exception Do Begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         End;
      end;
   end;
end;

function TCtrlProcessaTotalPrev.ProcessaGeraRateioPlanPatro(
  sBilhete: String; iEmpresa,iModulo,iUsuario: Double; iExercicio,
  iPeriodo, iSinal: Integer): Boolean;
var sMens : String;
    FCdsSaldos : TClientDataSet;
    rValorCot,iMoedaCota  : Double;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.ProcessaGeraRateioPlanPatro(sBilhete,iEmpresa,iModulo,iUsuario,iExercicio, iPeriodo, iSinal);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      _MaxProgresso := 0;
      _Progresso    := 0;
      sMens  := '';
      Result := True;
      FCdsSaldos := TClientDataSet.Create(nil);
      Try
         _Cds.Data := ListaParametroCota(iEmpresa);
         if (_Cds.isEmpty) or (_Cds.FieldByName('PACMOEDACOTAS').isNull) then begin
            MessageInfo := 'Moeda da Cota não informada no parâmetro';
            DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),MessageInfo]);
            Result := False;
            exit;
         end;
         iMoedaCota := _Cds.FieldByName('PACMOEDACOTAS').AsFloat;
         if iPeriodo = 0 then begin
           // _Cds.Data := Periodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,(iExercicio-1),0);
            _Cds.Data := Periodo.ListPeriodo(iEmpresa,tbpTodos,(iExercicio-1),0);
            _Cds.Last;
         end else begin
           // _Cds.Data := Periodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,iExercicio,iPeriodo);
            _Cds.Data := Periodo.ListPeriodo(iEmpresa,tbpTodos,iExercicio,iPeriodo);
         end;
         rValorCot := Contab.TestaCotacaoMoeda(trunc(iMoedaCota),_cds.FieldByName('PERDATFIM').AsDateTime,False);
         //
         FCdsSaldos.Data := ListaSaldoporPlanoPatro(iEmpresa,iExercicio,iPeriodo,iSinal,False,False);
         if FCdsSaldos.IsEmpty then begin
            MessageInfo := 'Não existe saldo a ser rateado';
            DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),MessageInfo]);
            Result := False;
            exit;
         end;
         _MaxProgresso := FCdsSaldos.RecordCount;
         _Progresso    := 0;
         DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'']);
         if rValorCot <> 0 then begin
            try
               StartTransaction;
               FCdsSaldos.First;
               DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'*** Dados do Rateio ***']);
               DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'  ']);
               while not FCdsSaldos.eof do begin
                  _DbRateioplanpatro.IdPessoa.AsFloat     := iEmpresa;
                  _DbRateioplanpatro.Qtdecotas.AsFloat    := (FCdsSaldos.FieldByName('SALDO').asFloat/rValorCot);
                  _DbRateioplanpatro.Idpatro.AsFloat      := FCdsSaldos.FieldByName('IDPATRO').asFloat;
                  _DbRateioplanpatro.Idplanoprev.AsFloat  := FCdsSaldos.FieldByName('IDPLANOPREV').asFloat;
                  _DbRateioplanpatro.Perexercicio.AsFloat := iExercicio;
                  _DbRateioplanpatro.Pernumero.AsFloat    := iPeriodo;
                  if not _DbRateioplanpatro.Insert then begin
                     sMens := _DbRateioplanpatro.MessageInfo;
                     Abort;
                  end;
                  FCdsSaldos.Next;
                  _Progresso := _Progresso + 1;
                  DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'Valor: ' + FloatToStr(FCdsSaldos.FieldByName('SALDO').asFloat/rValorCot)]);
                  DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'Saldo : ' + FloatToStr(FCdsSaldos.FieldByName('SALDO').asFloat) + ' - Cotação : ' + FloatToStr(rValorCot)]);
                  DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'  ']);
               end;

               If not Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario, 'Gera Valor da Cota - Processamento',False) then
                  Raise Exception.Create( Padroes.MessageInfo );

               Commit;
            except
               On E:Exception Do Begin
                  Result := False;
                  Rollback;
                  MessageInfo := sMens +'. '+E.Message;
                  DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),MessageInfo]);
               End;
            end;
         end else begin
            MessageInfo := 'Cotação da Moeda '+FloatToStr(iMoedaCota)+' Não Cadastrada para o dia '+_cds.FieldByName('PERDATFIM').AsString;
            DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),MessageInfo]);
            Result := False;
         end;
      finally
        FreeCds([FCdsSaldos]);
      end;
   end;
end;


function TCtrlProcessaTotalPrev.ListaSaldoporPlanoPatro(
  iEmpresa: Double; iExercicio,
  iPeriodo, iSinal: Integer; bSaldo, bCalcCota : Boolean): OleVariant;
var _sql : TCMSqlParams;
begin
   Result := True;
   _sql := TCMSqlParams.Create(nil);
   Try
      _sql.ControlObject := Self;
      with _sql do begin
         SQL.Clear;
         if iSinal = 0 then begin
            SQL.Add('SELECT SUM(DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)      ');
            SQL.Add('         - DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)) AS SALDO,   ');
         end else begin
            SQL.Add('SELECT SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)      ');
            SQL.Add('         - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO,   ');
         end;
         SQL.Add('       S.IDPATRO, S.IDPLANOPREV                                           ');
         SQL.Add('FROM PLANOSALDO S, PLANOCONTA C                                           ');
         SQL.Add('WHERE                                                                     ');
         SQL.Add('       (S.PLACONTA     = C.PLACONTA) AND                                  ');
         SQL.Add('       (S.PLANO        = C.PLANO) AND                                     ');
         if bCalcCota then
            SQL.Add('       (C.PLARATEIOAP  = ''N'') AND                                       ')
         else
            SQL.Add('       (C.PLARATEIOAP  = ''S'') AND                                       ');
         //SQL.Add('       (C.PLATIPO      = ''A'') AND                                       ');
         SQL.Add('       (S.PEREXERCICIO ='+IntToStr(iExercicio)+') AND                                ');
         if bSaldo then begin
            SQL.Add('       ((S.PERNUMERO IS NULL) OR (S.PERNUMERO <='+IntToStr(iPeriodo)+')) AND ');
         end else begin
            if iPeriodo = 0 then
               SQL.Add('       (S.PERNUMERO IS NULL) AND                                   ')
            else
               SQL.Add('       (S.PERNUMERO    ='+IntToStr(iPeriodo)+') AND                ');
         end;
         SQL.Add('       (S.IDPESSOA     ='+FloatToStr(iEmpresa)+')                     ');
         SQL.Add('GROUP BY S.IDPATRO, S.IDPLANOPREV                                     ');
      end;
      Result := _sql.Data;
   Finally
      _sql.Free;
   end;
end;

function TCtrlProcessaTotalPrev.ListaSaldoCotasporPlanoPatro(
  iEmpresa: Double; iExercicio, iPeriodo: Integer;
  bSaldo: Boolean): OleVariant;
var _sql : TCMSqlParams;
begin
   //Result := True;
   _sql := TCMSqlParams.Create(nil);
   Try
      _sql.ControlObject := Self;
      with _sql do begin
         SQL.Clear;
         SQL.Add('SELECT SUM(NVL(S.QTDECOTAS,0)) AS QTDECOTAS, ');
         SQL.Add('       S.IDPATRO, S.IDPLANOPREV              ');
         SQL.Add('FROM RATEIOPLANPATRO S                       ');
         SQL.Add('WHERE                                        ');
         SQL.Add('       (S.PEREXERCICIO ='+IntToStr(iExercicio)+') AND                                ');
         if bSaldo then begin
            SQL.Add('       ((S.PERNUMERO IS NULL) OR (S.PERNUMERO <='+IntToStr(iPeriodo)+')) AND ');
         end else begin
            if iPeriodo = 0 then
               SQL.Add('       (S.PERNUMERO IS NULL) AND                                   ')
            else
               SQL.Add('       (S.PERNUMERO    ='+IntToStr(iPeriodo)+') AND                ');
         end;
         SQL.Add('       (S.IDPESSOA     ='+FloatToStr(iEmpresa)+')                     ');
         SQL.Add('GROUP BY S.IDPATRO, S.IDPLANOPREV                                     ');
      end;
      Result := _sql.Data;
   Finally
      _sql.Free;
   end;
end;

function TCtrlProcessaTotalPrev.ProcessaGeraLancamentoRateioPlanPatro(
  sBilhete, sTipoOper: String; iEmpresa,iModulo,iUsuario, iPlanoPrev, iPatro: Double;
  iExercicio, iPeriodo: Integer; bSomentePer : Boolean): Boolean;
var cContaD,sDataLanc,sMens : String;
    FCdsSaldosN,FCdsSaldosS,FCdsSaldos : TClientDataSet;
    liPlnCodigo,rAcuCor, rAcuOfi, rAcuGer, rAcuGer1, rAcuGer2, rAcuHist : Double;
    rValLanc,rValCor,rValOfi, rValGe1, rValGe2 , rValGe3, rValHistDeb : Double;
    iPlanoPrevRef,iPatroRef,rTotRecAplicado, rEstoqueCotas,rNovoValorCota  : Double;
    i : Integer;
  //  bOk : Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.ProcessaGeraLancamentoRateioPlanPatro(sBilhete, sTipoOper,iEmpresa,iModulo,iUsuario,iPlanoPrev,iPatro,iExercicio, iPeriodo);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      _MaxProgresso := 0;
      _Progresso    := 0;
      sMens    := '';
      Result   := True;
      _Cds.Data := Periodo.ListPeriodo(iEmpresa,tbpTodos,iExercicio,iPeriodo);
      if _Cds.IsEmpty then begin
         MessageInfo := 'Periodo não Existe';
      end;
      sDataLanc   := _Cds.FieldByName('PERDATFIM').AsString;
      FCdsSaldos  := TClientDataSet.Create(nil);
      FCdsSaldosN := TClientDataSet.Create(nil);
      FCdsSaldosS := TClientDataSet.Create(nil);
      Try
      //   bOk := true;
         StartTransaction;
         for i := 1 to 2 do begin
            FcdsSaldosN.Data := ListaSaldoN(iEmpresa,iPlanoPrev,iPatro,iExercicio,iPeriodo,i);
            FcdsSaldosS.Data := ListaSaldoS(iEmpresa,iExercicio,iPeriodo,bSomentePer);
            FcdsSaldos.Data  := ListaSaldo(iEmpresa,iPlanoPrev,iPatro,iExercicio,iPeriodo,i);
            with FcdsSaldos do begin
               //
               _MaxProgresso := RecordCount;
               _Progresso    := 0;
               DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'','','']);
               liPlnCodigo := 0;
               First;
               FcdsSaldosN.First;
               FcdsSaldosS.First;
               iPlanoPrevRef :=FcdsSaldosS.FieldByName('IDPLANOPREV').AsFloat;
               iPatroRef     :=FcdsSaldosS.FieldByName('IDPATRO').AsFloat;
               while not eof do begin
                  rAcuCor  := 0;
                  rAcuOfi  := 0;
                  rAcuGer  := 0;
                  rAcuGer1 := 0;
                  rAcuGer2 := 0;
                  rAcuHist := 0;
                  FcdsSaldosS.First;
                  while (not FcdsSaldosS.eof) do begin
                     rValCor := FieldByName('SALDOCOR2').asFloat * FcdsSaldosS.FieldByName('PERC').asFloat;
                     rValOfi := FieldByName('SALDOOFI2').asFloat * FcdsSaldosS.FieldByName('PERC').asFloat;
                     rValGe1 := FieldByName('SALDOGER2').asFloat * FcdsSaldosS.FieldByName('PERC').asFloat;
                     rValGe2 := FieldByName('SALDOGER12').asFloat * FcdsSaldosS.FieldByName('PERC').asFloat;
                     rValGe3 := FieldByName('SALDOGER22').asFloat * FcdsSaldosS.FieldByName('PERC').asFloat;
                     rValHistDeb := FieldByName('SALDOHIST2').asFloat * FcdsSaldosS.FieldByName('PERC').asFloat;

                     rAcuCor  := rAcuCor  + StrToFloat(formatFloat('###########0.00', rValCor));
                     rAcuOfi  := rAcuOfi  + StrToFloat(formatFloat('###########0.00', rValOfi));
                     rAcuGer  := rAcuGer  + StrToFloat(formatFloat('###########0.00', rValGe1));
                     rAcuGer1 := rAcuGer1 + StrToFloat(formatFloat('###########0.00', rValGe2));
                     rAcuGer2 := rAcuGer2 + StrToFloat(formatFloat('###########0.00', rValGe3));
                     rAcuHist := rAcuHist + StrToFloat(formatFloat('###########0.00', rValHistDeb));
                     while (not FcdsSaldosN.eof) and
                           (FcdsSaldosS.FieldByName('IDPATRO').asInteger = FcdsSaldosN.FieldByName('IDPATRO').asInteger) and
                           (FcdsSaldosS.FieldByName('IDPLANOPREV').asInteger = FcdsSaldosN.FieldByName('IDPLANOPREV').asInteger) and
                           (FieldByName('UNIDNEGOC').asInteger = FcdsSaldosN.FieldByName('UNIDNEGOC').asInteger) and
                           (FieldByName('PLACONTA').asString = FcdsSaldosN.FieldByName('PLACONTA').asString) and
                           (FieldByName('CODCENTROCUSTO').asString = FcdsSaldosN.FieldByName('CODCENTROCUSTO').asString) and
                           (FieldByName('CODSUBCONTA').asInteger = FcdsSaldosN.FieldByName('CODSUBCONTA').asInteger) do begin
                        rValCor := rValCor - FcdsSaldosN.FieldByName('SALDOCOR').asFloat;
                        rValOfi := rValOfi - FcdsSaldosN.FieldByName('SALDOOFI').asFloat;
                        rValGe1 := rValGe1 - FcdsSaldosN.FieldByName('SALDOGER').asFloat;
                        rValGe2 := rValGe2 - FcdsSaldosN.FieldByName('SALDOGER1').asFloat;
                        rValGe3 := rValGe3 - FcdsSaldosN.FieldByName('SALDOGER2').asFloat;
                        rValHistDeb := rValHistDeb - FcdsSaldosN.FieldByName('SALDOHIST').asFloat;
                        //
                        FcdsSaldosN.next;
                     end;
                     if FieldByName('PLACONTASEGREG').isNull then begin
                        cContaD        := FieldByName('PLACONTA').AsString;
                     end else begin
                        cContaD        := FieldByName('PLACONTASEGREG').AsString;
                     end;
                     if rValCor <> 0 then begin
                        Lancamento.lcValGerDeb := rValGe1;
                        Lancamento.lcValGe1Deb := rValGe2;
                        Lancamento.lcValGe2Deb := rValGe3;
                        Lancamento.lcValOfiDeb := rValOfi;
                        Lancamento.lcValHisDeb := rValHistDeb;
                        iPlanoPrevRef :=FcdsSaldosS.FieldByName('IDPLANOPREV').AsFloat;
                        iPatroRef     :=FcdsSaldosS.FieldByName('IDPATRO').AsFloat;
                        if not Lancamento.InsereLancaContab('0',iEmpresa,1,iUsuario,FieldByName('PLANO').AsFloat,
                                                     FieldByName('UNIDNEGOC').AsFloat,FieldByName('CODSUBCONTA').AsFloat,0,
                                                     FcdsSaldosS.FieldByName('IDPLANOPREV').AsFloat,FcdsSaldosS.FieldByName('IDPATRO').AsFloat,
                                                     liPlncodigo,0,sDataLanc,'Rateio','Rateio por Cotas','','','','',sTipoOper,
                                                     FieldByName('CODCENTROCUSTO').AsString,cContaD,'','','',rValCor,False,True,
                                                     // 05/01/03 Alex 14451 - Nova estrutura para Segregação, não utilizada pela anterior
                                                     -1, -1) then begin
                           sMens := Lancamento.MessageInfo;
                           Abort;
                        end;
                        liPlncodigo := Lancamento.RetornoPlnCodigo;
                     end;
                     DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'',FcdsSaldosS.FieldByName('IDPLANOPREV').AsString+'/'+FcdsSaldosS.FieldByName('IDPATRO').AsString,cContaD]);
                     FcdsSaldosS.Next;
                  end;
                  if FieldByName('SALDOCOR2').asFloat <> rAcuCor then begin
                     rValLanc    := FieldByName('SALDOCOR2').asFloat - rAcuCor;
                     Lancamento.lcValGerDeb := FieldByName('SALDOGER2').asFloat - rAcuGer;
                     Lancamento.lcValGe1Deb := FieldByName('SALDOGER12').asFloat - rAcuGer1;
                     Lancamento.lcValGe2Deb := FieldByName('SALDOGER22').asFloat - rAcuGer2;
                     Lancamento.lcValOfiDeb := FieldByName('SALDOOFI2').asFloat - rAcuOfi;
                     Lancamento.lcValHisDeb := FieldByName('SALDOHIST2').asFloat - rAcuHist;
                     if not Lancamento.InsereLancaContab('0',iEmpresa,1,iUsuario,FieldByName('PLANO').AsFloat,
                                                  FieldByName('UNIDNEGOC').AsFloat,FieldByName('CODSUBCONTA').AsFloat,0,
                                                  iPlanoPrevRef,iPatroRef,
                                                  liPlncodigo,0,sDataLanc,'Rateio','Acerto do Rateio por Cotas','','','','',sTipoOper,
                                                  FieldByName('CODCENTROCUSTO').AsString,cContaD,'','','',rValLanc,False,True,
                                                     // 05/01/03 Alex 14451 - Nova estrutura para Segregação, não utilizada pela anterior
                                                     -1, -1) then begin
                        sMens := Lancamento.MessageInfo;
                        Abort;
                     end;
                  end;
                 // if not bOK then Break;
                  next;
                  _Progresso := _Progresso + 1;
                  DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'','','']);
               end;
            end;
           // if not bOK then Break;
         end;
         rNovoValorCota := 0;
         rTotRecAplicado:= 0;
         rEstoqueCotas  := 0;
         //
         FCdsSaldos.Data := ListaSaldoporPlanoPatro(iEmpresa,iExercicio,iPeriodo,0,true,true);
         FCdsSaldos.First;
         while not FCdsSaldos.Eof do begin
            rTotRecAplicado:= rTotRecAplicado+FCdsSaldos.FieldByName('SALDO').asFloat;
            FCdsSaldos.Next;
         end;
         FCdsSaldos.Data := ListaSaldoCotasporPlanoPatro(iEmpresa,iExercicio,iPeriodo,true);
         FCdsSaldos.First;
         while not FCdsSaldos.Eof do begin
            rEstoqueCotas:= rEstoqueCotas+FCdsSaldos.FieldByName('QTDECOTAS').asFloat;
            FCdsSaldos.Next;
         end;
         if rEstoqueCotas <> 0 then begin
            rNovoValorCota := rTotRecAplicado/rEstoqueCotas;
         end;
         DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'***** Novo valor da Cota : ' + FloatToStr(rNovoValorCota)+ ' *****','','']);

         If not Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario, 'Gera Lançamentos de Segregação por Plano e Patrocinadora',False) then
            Raise Exception.Create( Padroes.MessageInfo );
         Commit;
         FreeCds([FCdsSaldosN,FCdsSaldosS,FCdsSaldos]);
      except
         On E:Exception Do Begin
            Result := False;
           // bOk := false;
            Rollback;
            MessageInfo := sMens +'. '+E.Message;
            DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),MessageInfo,'','']);
            FreeCds([FCdsSaldosN,FCdsSaldosS,FCdsSaldos]);
         End;
      end;
   end;
end;

Function TCtrlProcessaTotalPrev.ListaSaldoN(iEmpresa, iPlanoPrev, iPatro: Double;
  iExercicio, iPeriodo, i: Integer): OleVariant;
var _sql : TCMSqlParams;
begin
   Result := True;
   _sql := TCMSqlParams.Create(nil);
   Try
      _sql.ControlObject := Self;
      with _sql do begin
         SQL.Clear;
         SQL.Add('SELECT SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)                  ');
         SQL.Add('         - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDOCOR,            ');
         SQL.Add('       SUM(DECODE(S.PLSDEBITOOFICIAL, NULL, 0, S.PLSDEBITOOFICIAL)                    ');
         SQL.Add('         - DECODE(S.PLSCREDITOOFICIAL, NULL, 0, S.PLSCREDITOOFICIAL)) AS SALDOOFI,    ');
         SQL.Add('       SUM(DECODE(S.PLSDEBITOGER, NULL, 0, S.PLSDEBITOGER)                            ');
         SQL.Add('         - DECODE(S.PLSCREDITOGER, NULL, 0, S.PLSCREDITOGER)) AS SALDOGER,            ');
         SQL.Add('       SUM(DECODE(S.PLSDEBITOGEREN1, NULL, 0, S.PLSDEBITOGEREN1)                      ');
         SQL.Add('         - DECODE(S.PLSCREDITOGEREN1, NULL, 0, S.PLSCREDITOGEREN1)) AS SALDOGER1,     ');
         SQL.Add('       SUM(DECODE(S.PLSDEBITOGEREN2, NULL, 0, S.PLSDEBITOGEREN2)                      ');
         SQL.Add('         - DECODE(S.PLSCREDITOGEREN2, NULL, 0, S.PLSCREDITOGEREN2)) AS SALDOGER2,     ');
         SQL.Add('       SUM(DECODE(S.PLSDEBITOHIST, NULL, 0, S.PLSDEBITOHIST)                          ');
         SQL.Add('         - DECODE(S.PLSCREDITOHIST, NULL, 0, S.PLSCREDITOHIST)) AS SALDOHIST,         ');
         SQL.Add('       C.PLATIPO,C.PLACONTASEGREG,S.PLANO,S.PLACONTA,S.CODSUBCONTA,S.CODCENTROCUSTO,S.UNIDNEGOC,S.IDPLANOPREV,S.IDPATRO  ');
         SQL.Add('FROM PLANOSALDO S, PLANOCONTA C                                                       ');
         SQL.Add('WHERE                                                                                 ');
         SQL.Add('       (S.PLACONTA = C.PLACONTA) AND                                                  ');
         SQL.Add('       (S.PLANO = C.PLANO) AND                                                        ');
         if iPlanoPrev <> 0 then
            SQL.Add('       (S.IDPLANOPREV = '+FloatToStr(iPlanoPrev)+') AND                   ');
         if iPatro <> 0 then
            SQL.Add('       (S.IDPATRO = '+FloatToStr(iPatro)+') AND                   ');
         SQL.Add('       (C.PLARATEIOAP = ''N'') AND                                                    ');
         SQL.Add('       (S.PEREXERCICIO ='+IntToStr(iExercicio)+') AND                                            ');
         if i = 1 then begin
            SQL.Add('    (C.PLAGRUPO IN (''R'', ''D'', ''C'', ''O'')) AND                               ');
            SQL.Add('    (S.PERNUMERO ='+IntToStr(iPeriodo)+') AND                                                  ');
         end else begin
            SQL.Add('    (C.PLAGRUPO NOT IN (''R'', ''D'', ''C'', ''O'')) AND                           ');
            SQL.Add('    (S.PERNUMERO ='+IntToStr(iPeriodo)+') AND                                                  ');
           // SQL.Add('    ((S.PERNUMERO <='+IntToStr(iPeriodo)+') OR (S.PERNUMERO IS NULL)) AND                      ');
         end;
         SQL.Add('       (S.IDPESSOA     ='+FloatToStr(iEmpresa)+')                                                    ');
         SQL.Add('GROUP BY                                                                              ');
         SQL.Add('       C.PLATIPO,C.PLACONTASEGREG,S.PLANO,S.PLACONTA,S.CODSUBCONTA,S.CODCENTROCUSTO, S.UNIDNEGOC,S.IDPLANOPREV,S.IDPATRO ');
         SQL.Add('ORDER BY S.PLANO,S.PLACONTA,S.CODSUBCONTA,S.CODCENTROCUSTO,S.UNIDNEGOC,S.IDPLANOPREV,S.IDPATRO');
      end;
      Result := _sql.Data;
   Finally
      _sql.Free;
   end;
end;


Function TCtrlProcessaTotalPrev.ListaSaldoS(iEmpresa: Double; iExercicio, iPeriodo : Integer; bSomentePer : Boolean): OleVariant;
var _sql : TCMSqlParams;
begin
   Result := True;
   _sql := TCMSqlParams.Create(nil);
   Try
      _sql.ControlObject := Self;
      with _sql do begin
         SQL.Clear;
         SQL.Add('SELECT PERC, IDPLANOPREV, IDPATRO FROM                            ');
         SQL.Add('(SELECT (0) AS PERC, PP.IDPLANOPREV, PT.IDPESSOA AS IDPATRO       ');
         SQL.Add('FROM PATRO PT, PLANPREVCONTABIL PP                                ');
         SQL.Add('WHERE NOT EXISTS (SELECT R.IDRATEIOPLANPATRO                      ');
         SQL.Add('FROM RATEIOPLANPATRO R WHERE                                      ');
         SQL.Add('        (R.IDPATRO = PT.IDPESSOA) AND                             ');
         SQL.Add('        (R.IDPLANOPREV = PP.IDPLANOPREV) AND                      ');
         SQL.Add('        (R.PEREXERCICIO ='+IntToStr(iExercicio)+') AND            ');
         if bSomentePer then
            SQL.Add('        (R.PERNUMERO ='+IntToStr(iPeriodo)+') AND ')
         else
            SQL.Add('        ((R.PERNUMERO <='+IntToStr(iPeriodo)+') OR (PERNUMERO IS NULL)) AND ');
         SQL.Add('        (R.IDPESSOA     ='+FloatToStr(iEmpresa)+'))                         ');
         SQL.Add('UNION                                                             ');
         SQL.Add('SELECT DECODE(NVL(T.TOT,0),0,0,(SUM(R.QTDECOTAS)/T.TOT)) AS PERC, R.IDPLANOPREV, R.IDPATRO ');
         SQL.Add('FROM RATEIOPLANPATRO R,                                            ');
         SQL.Add('   (SELECT SUM(QTDECOTAS) AS TOT                                  ');
         SQL.Add('      FROM RATEIOPLANPATRO                                         ');
         SQL.Add('      WHERE                                                       ');
         SQL.Add('        (PEREXERCICIO ='+IntToStr(iExercicio)+') AND                          ');
         if bSomentePer then
            SQL.Add('        (PERNUMERO ='+IntToStr(iPeriodo)+') AND ')
         else
            SQL.Add('        ((PERNUMERO <='+IntToStr(iPeriodo)+') OR (PERNUMERO IS NULL)) AND     ');
         SQL.Add('        (IDPESSOA     ='+FloatToStr(iEmpresa)+')) T                           ');
         SQL.Add('WHERE                                                                         ');
         SQL.Add('   (R.PEREXERCICIO ='+IntToStr(iExercicio)+') AND                             ');
         if bSomentePer then
            SQL.Add('        (R.PERNUMERO ='+IntToStr(iPeriodo)+') AND ')
         else
            SQL.Add('   ((R.PERNUMERO <='+IntToStr(iPeriodo)+') OR (R.PERNUMERO IS NULL)) AND      ');
         SQL.Add('   (R.IDPESSOA     ='+FloatToStr(iEmpresa)+')                                 ');
         SQL.Add('GROUP BY R.IDPLANOPREV, R.IDPATRO, T.TOT)                                   ');
         SQL.Add('ORDER BY IDPLANOPREV, IDPATRO                                             ');
      end;
      Result := _sql.Data;
   Finally
      _sql.Free;
   end;
end;


function TCtrlProcessaTotalPrev.ListaSaldo(iEmpresa, iPlanoPrev,
  iPatro: Double; iExercicio, iPeriodo, i: Integer): OleVariant;
var _sql : TCMSqlParams;
begin
   Result := True;
   _sql := TCMSqlParams.Create(nil);
   Try
      _sql.ControlObject := Self;
      with _sql do begin
         SQL.Clear;
         SQL.Add('SELECT SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)          ');
         SQL.Add('    - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDOCOR2,        ');
         SQL.Add('  SUM(DECODE(S.PLSDEBITOOFICIAL, NULL, 0, S.PLSDEBITOOFICIAL)                 ');
         SQL.Add('    - DECODE(S.PLSCREDITOOFICIAL, NULL, 0, S.PLSCREDITOOFICIAL)) AS SALDOOFI2,');
         SQL.Add('  SUM(DECODE(S.PLSDEBITOGER, NULL, 0, S.PLSDEBITOGER)                         ');
         SQL.Add('    - DECODE(S.PLSCREDITOGER, NULL, 0, S.PLSCREDITOGER)) AS SALDOGER2,        ');
         SQL.Add('  SUM(DECODE(S.PLSDEBITOGEREN1, NULL, 0, S.PLSDEBITOGEREN1)                   ');
         SQL.Add('    - DECODE(S.PLSCREDITOGEREN1, NULL, 0, S.PLSCREDITOGEREN1)) AS SALDOGER12, ');
         SQL.Add('  SUM(DECODE(S.PLSDEBITOGEREN2, NULL, 0, S.PLSDEBITOGEREN2)                   ');
         SQL.Add('    - DECODE(S.PLSCREDITOGEREN2, NULL, 0, S.PLSCREDITOGEREN2)) AS SALDOGER22, ');
         SQL.Add('  SUM(DECODE(S.PLSDEBITOHIST, NULL, 0, S.PLSDEBITOHIST)                       ');
         SQL.Add('    - DECODE(S.PLSCREDITOHIST, NULL, 0, S.PLSCREDITOHIST)) AS SALDOHIST2,     ');
         SQL.Add('  S.PLACONTA,S.PLANO,S.CODSUBCONTA,S.CODCENTROCUSTO,S.UNIDNEGOC,                      ');
         SQL.Add('  C.PLATIPO,C.PLACONTASEGREG,C.PLATIPCONVGER,C.PLATIPCONVGEREN1,C.PLATIPCONVGEREN2, C.PLATIPCONVOFICIAL  ');
         SQL.Add('FROM PLANOSALDO S, PLANOCONTA C                                               ');
         SQL.Add('WHERE                                                                         ');
         SQL.Add('  (S.PLACONTA = C.PLACONTA) AND                                               ');
         SQL.Add('  (S.PLANO = C.PLANO) AND                                                     ');
         if iPlanoPrev <> 0 then
            SQL.Add('       (S.IDPLANOPREV = '+FloatToStr(iPlanoPrev)+') AND                   ');
         if iPatro <> 0 then
            SQL.Add('       (S.IDPATRO = '+FloatToStr(iPatro)+') AND                   ');
         SQL.Add('  (C.PLARATEIOAP = ''N'') AND                                                 ');
         SQL.Add('  (S.PEREXERCICIO ='+IntToStr(iExercicio)+') AND                                         ');
         if i = 1 then begin
            SQL.Add('(C.PLAGRUPO IN (''R'', ''D'', ''C'', ''O'')) AND                           ');
            SQL.Add('(S.PERNUMERO ='+IntToStr(iPeriodo)+') AND                                              ');
         end else begin
            SQL.Add('(C.PLAGRUPO NOT IN (''R'', ''D'', ''C'', ''O'')) AND                       ');
            SQL.Add('(S.PERNUMERO ='+IntToStr(iPeriodo)+') AND                                              ');
         //   SQL.Add('((S.PERNUMERO <='+IntToStr(iPeriodo)+') OR (S.PERNUMERO IS NULL)) AND                  ');
         end;
         SQL.Add('  (S.IDPESSOA     ='+FloatToStr(iEmpresa)+')                                              ');
         SQL.Add('GROUP BY                                                                      ');
         SQL.Add('  C.PLATIPO,C.PLACONTASEGREG,S.PLANO,S.PLACONTA,S.CODSUBCONTA,S.CODCENTROCUSTO,S.UNIDNEGOC,          ');
         SQL.Add('  C.PLATIPCONVGER,C.PLATIPCONVGEREN1,C.PLATIPCONVGEREN2, C.PLATIPCONVOFICIAL  ');
         SQL.Add('ORDER BY                                                                      ');
         SQL.Add('  S.PLANO,S.PLACONTA,S.CODSUBCONTA,S.CODCENTROCUSTO,S.UNIDNEGOC                       ');
      end;
      Result := _sql.Data;
   Finally
      _sql.Free;
   end;
end;

function TCtrlProcessaTotalPrev.AplicaOperacaoSaldoCotas(dEmpresa,dModulo,dUsuario:Double): Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoSaldoCotas(dEmpresa,dModulo,dUsuario,CdsPrin.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         Result := ApplyCDS(FCdsPrin,_DbRateioplanpatro,[],[]);
         If Not Result Then Begin
            MessageInfo := _DbRateioplanpatro.MessageInfo;
            Abort;
         End Else

         If not Padroes.GravaLogOperacoes(dEmpresa,dModulo,dUsuario, 'Cadastro de Saldo de Cotas por Plano e Patrocinadora',False) then
             Raise Exception.Create( Padroes.MessageInfo );

            Commit;
      Except
         On E:Exception Do Begin
            Result := False;
            Rollback;
            MessageInfo := MessageInfo + E.Message;
         End;
      End;
   End;
end;

function TCtrlProcessaTotalPrev.ProcurarSaldoCotas(iIdRateio: Double): OleVariant;
begin
  _DbRateioplanpatro.Idrateioplanpatro.AsFloat := iIdRateio;
  Result := GetDataPacket(_DbRateioplanpatro.SSqlSelect);
end;

procedure TCtrlProcessaTotalPrev.SetCdsPrin(
  const Value: TClientDataSet);
begin
  FCdsPrin := Value;
end;


function TCtrlProcessaTotalPrev.AplicaOperacaoRatAdm(dEmpresa,dModulo,dUsuario:Double;
  Operacao: TOperacao): Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoRatAdm(dEmpresa,dModulo,dUsuario,Integer(Operacao),CdsPrin.Data,CdsDet.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         if (Operacao = opApagar) then begin
            FCdsDet.First;
            while not FCdsDet.Eof do
               FCdsDet.delete;
            Result := ApplyCDS(FCdsDet,_DbRatAdDetPlanPatro,[],[]);
            if not Result then begin
               MessageInfo := _DbRatAdDetPlanPatro.MessageInfo;
               Abort;
            end;
            Result := ApplyCDS(FCdsPrin,_DbRatAdmPlanPatro,[],[]);
            if not Result then begin
               MessageInfo := _DbRatAdmPlanPatro.MessageInfo;
               Abort;
            end;
         end else begin
            Result := ApplyCDS(FCdsPrin,_DbRatAdmPlanPatro,[],[]);
            If Not Result Then Begin
               MessageInfo := _DbRatAdmPlanPatro.MessageInfo;
               Abort;
            end;

            Result := ApplyCDS(FCdsDet,_DbRatAdDetPlanPatro,[_DbRatAdmPlanPatro.IdRatAdmPlanPatro],[_DbRatAdDetPlanPatro.IdRatAdmPlanPrev],True);
            if not Result then begin
               MessageInfo := _DbRatAdDetPlanPatro.MessageInfo;
               Abort;
            end;
         end;

         if (Operacao = opApagar) then begin
            If not Padroes.GravaLogOperacoes(dEmpresa,dModulo,dUsuario, 'Exclusão do Rateio Adm. por Plano/Patrocinadora',False) then
               Raise Exception.Create( Padroes.MessageInfo );
         end;

         if (Operacao = opInserir) then begin
            If not Padroes.GravaLogOperacoes(dEmpresa,dModulo,dUsuario, 'Inclusão do Rateio Adm. por Plano/Patrocinadora',False) then
               Raise Exception.Create( Padroes.MessageInfo );
         end;

         if (Operacao = opAlterar) then begin
            If not Padroes.GravaLogOperacoes(dEmpresa,dModulo,dUsuario, 'Alteração do Rateio Adm. por Plano/Patrocinadora',False) then
               Raise Exception.Create( Padroes.MessageInfo );
         end;

         Commit;
      Except
         On E:Exception Do Begin
            Result := False;
            Rollback;
            MessageInfo := MessageInfo + E.Message;
         End;
      End;
   End;
end;

procedure TCtrlProcessaTotalPrev.SetCdsDet(const Value: TClientDataSet);
begin
  FCdsDet := Value;
end;

function TCtrlProcessaTotalPrev.ListaRatAdmDet(
  iIdRateio: Double): OleVariant;
var sSql : String;
begin
  sSql := 'SELECT R.*, PP.NOME AS NOMEPLANO, P.NOME AS NOMEPATRO '+
          'FROM RATADDETPLANPATRO R, PLANPREVCONTABIL PP, PESSOA P '+
          'WHERE (R.IDRATADMPLANPREV = '+FloatToStr(iIdRateio)+') '+
          '  AND (R.IDPLANOPREV = PP.IDPLANOPREV) '+
          '  AND (R.IDPATRO = P.IDPESSOA) '+
          'ORDER BY NOMEPLANO, NOMEPATRO';
  Result := GetDataPacket(sSql);
end;

function TCtrlProcessaTotalPrev.ProcurarRatAdm(
  iIdRateio: Double): OleVariant;
begin
  _DbRatAdmPlanPatro.IdRatAdmPlanPatro.AsFloat := iIdRateio;
  Result := GetDataPacket(_DbRatAdmPlanPatro.SSqlSelect);
end;

function TCtrlProcessaTotalPrev.ProcessaGeraLancamentoRatAdmPlanPatro(
  sBilhete, sTipoOper: String; iEmpresa,iModulo, iUsuario : Double; iExercicio, iPeriodo: Integer): Boolean;
var sSql,cContaD,sDataLanc,sMens : String;
    FCdsSaldosN,FCdsSaldosS,FCdsRatAdm : TClientDataSet;
    liPlnCodigo,rAcuCor, rAcuOfi, rAcuGer, rAcuGer1, rAcuGer2, rAcuHist : Double;
    rValLanc,rValCor,rValOfi, rValGe1, rValGe2 , rValGe3, rValHistDeb : Double;
    bOk : Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.ProcessaGeraLancamentoRatAdmPlanPatro(sBilhete, sTipoOper,iEmpresa,iModulo,iUsuario,iExercicio, iPeriodo);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      _MaxProgresso := 0;
      _Progresso    := 0;
      sMens    := '';
      Result   := True;
      sSql := 'SELECT '+
              '   SUM(C.PERCRATEIO) AS SOMA, C.IDRATADMPLANPREV, '+
              '   R.DESCRICAO '+
              'FROM RATADDETPLANPATRO C, RATADMPLANPATRO R '+
              'WHERE (R.IDRATADMPLANPATRO = C.IDRATADMPLANPREV) '+
              'GROUP BY C.IDRATADMPLANPREV, R.DESCRICAO '+
              'HAVING SUM(C.PERCRATEIO) <> 100 '+
              'ORDER BY R.DESCRICAO';
      _Cds.Data := GetDataPacket(sSql);
      if not _Cds.isEmpty then begin
         MessageInfo := '';
         while not _Cds.Eof do begin
            if MessageInfo = '' then begin
               MessageInfo := 'Rateios que não Fecham 100%: '+_Cds.FieldByName('DESCRICAO').AsString;
            end else begin
               MessageInfo := MessageInfo +', '+_Cds.FieldByName('DESCRICAO').AsString;
            end;
            _Cds.Next;
         end;
         Result := False;
      end;
      if Result then begin
         _Cds.Data := Periodo.ListPeriodo(iEmpresa,tbpTodos,iExercicio,iPeriodo);
         if _Cds.IsEmpty then begin
            MessageInfo := 'Periodo não Existe';
            Result := False;
         end;
      end;
      if Result then begin
         sDataLanc   := _Cds.FieldByName('PERDATFIM').AsString;
         FCdsRatAdm  := TClientDataSet.Create(nil);
         FCdsSaldosN := TClientDataSet.Create(nil);
         FCdsSaldosS := TClientDataSet.Create(nil);
         Try
            bOk := true;
            FCdsRatAdm.Data := ListaRatAdm;
            _MaxProgresso := FCdsRatAdm.RecordCount;
            _Progresso    := 0;
            DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'','','']);
            While not FCdsRatAdm.Eof do begin
               try
                  StartTransaction;
                  liPlncodigo := 0;
                  FcdsSaldosN.Data := ListaSaldoNAdm(iEmpresa,FCdsRatAdm.FieldByName('IDPLANOPREV').AsFloat,FCdsRatAdm.FieldByName('IDPATRO').AsFloat,FCdsRatAdm.FieldByName('IDRATADMPLANPATRO').AsFloat,iExercicio,iPeriodo);
                  FcdsSaldosS.Data := ListaRatAdmDet(FCdsRatAdm.FieldByName('IDRATADMPLANPATRO').AsFloat);
                  FcdsSaldosN.First;
                  while not FcdsSaldosN.eof do begin
                     //Lança contabilidade
                     rAcuCor  := 0;
                     rAcuOfi  := 0;
                     rAcuGer  := 0;
                     rAcuGer1 := 0;
                     rAcuGer2 := 0;
                     rAcuHist := 0;
                     if FcdsSaldosN.FieldByName('PLACONTASEGREG').isNull then begin
                        cContaD        := FcdsSaldosN.FieldByName('PLACONTA').AsString;
                     end else begin
                        cContaD        := FcdsSaldosN.FieldByName('PLACONTASEGREG').AsString;
                     end;
                     rValCor     := FcdsSaldosN.FieldByName('SALDOCOR').asFloat * (-1);
                     rValOfi     := FcdsSaldosN.FieldByName('SALDOOFI').asFloat * (-1);
                     rValGe1     := FcdsSaldosN.FieldByName('SALDOGER').asFloat * (-1);
                     rValGe2     := FcdsSaldosN.FieldByName('SALDOGER1').asFloat * (-1);
                     rValGe3     := FcdsSaldosN.FieldByName('SALDOGER2').asFloat * (-1);
                     rValHistDeb := FcdsSaldosN.FieldByName('SALDOHIST').asFloat * (-1);
                     if rValCor <> 0 then begin
                        Lancamento.lcValGerDeb := rValGe1;
                        Lancamento.lcValGe1Deb := rValGe2;
                        Lancamento.lcValGe2Deb := rValGe3;
                        Lancamento.lcValOfiDeb := rValOfi;
                        Lancamento.lcValHisDeb := rValHistDeb;
                        if not Lancamento.InsereLancaContab('0',iEmpresa,1,iUsuario,FcdsSaldosN.FieldByName('PLANO').AsFloat,
                                                            FcdsSaldosN.FieldByName('UNIDNEGOC').AsFloat,FcdsSaldosN.FieldByName('CODSUBCONTA').AsFloat,0,
                                                            FCdsRatAdm.FieldByName('IDPLANOPREV').AsFloat,FCdsRatAdm.FieldByName('IDPATRO').AsFloat,
                                                            liPlncodigo,0,sDataLanc,'Rateio Adm.',FCdsRatAdm.FieldByName('DESCRICAO').asString,'','','','',sTipoOper,
                                                            FcdsSaldosN.FieldByName('CODCENTROCUSTO').AsString,cContaD,'','','',rValCor,False,True,
                                                            // 05/01/03 Alex 14451 - Nova estrutura para Segregação, não utilizada pela anterior
                                                            -1, -1) then begin
                           sMens := Lancamento.MessageInfo;
                           Abort;
                        end;
                        liPlncodigo := Lancamento.RetornoPlnCodigo;
                     end;
                     FcdsSaldosS.First;
                     While not FcdsSaldosS.Eof do begin
                        DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'',FcdsSaldosS.FieldByName('IDPLANOPREV').AsString+'/'+FcdsSaldosS.FieldByName('IDPATRO').AsString,cContaD]);
                        //
                        rValCor        := FcdsSaldosN.FieldByName('SALDOCOR').asFloat * (FcdsSaldosS.FieldByName('PERCRATEIO').asFloat/100);
                        rValOfi        := FcdsSaldosN.FieldByName('SALDOOFI').asFloat * (FcdsSaldosS.FieldByName('PERCRATEIO').asFloat/100);
                        rValGe1        := FcdsSaldosN.FieldByName('SALDOGER').asFloat * (FcdsSaldosS.FieldByName('PERCRATEIO').asFloat/100);
                        rValGe2        := FcdsSaldosN.FieldByName('SALDOGER1').asFloat * (FcdsSaldosS.FieldByName('PERCRATEIO').asFloat/100);
                        rValGe3        := FcdsSaldosN.FieldByName('SALDOGER2').asFloat * (FcdsSaldosS.FieldByName('PERCRATEIO').asFloat/100);
                        rValHistDeb    := FcdsSaldosN.FieldByName('SALDOHIST').asFloat * (FcdsSaldosS.FieldByName('PERCRATEIO').asFloat/100);
                        //
                        rValCor        := StrToFloat(format('%18.2f', [rValCor]));
                        rValOfi        := StrToFloat(format('%18.2f', [rValOfi]));
                        rValGe1        := StrToFloat(format('%18.2f', [rValGe1]));
                        rValGe2        := StrToFloat(format('%18.2f', [rValGe2]));
                        rValGe3        := StrToFloat(format('%18.2f', [rValGe3]));
                        rValHistDeb    := StrToFloat(format('%18.2f', [rValHistDeb]));
                        if rValCor <> 0 then begin
                           rAcuCor  := rAcuCor  + rValCor;
                           rAcuOfi  := rAcuOfi  + rValOfi;
                           rAcuGer  := rAcuGer  + rValGe1;
                           rAcuGer1 := rAcuGer1 + rValGe2;
                           rAcuGer2 := rAcuGer2 + rValGe3;
                           rAcuHist := rAcuHist + rValHistDeb;
                           //
                           Lancamento.lcValGerDeb := rValGe1;
                           Lancamento.lcValGe1Deb := rValGe2;
                           Lancamento.lcValGe2Deb := rValGe3;
                           Lancamento.lcValOfiDeb := rValOfi;
                           Lancamento.lcValHisDeb := rValHistDeb;
                           if not Lancamento.InsereLancaContab('0',iEmpresa,1,iUsuario,FcdsSaldosN.FieldByName('PLANO').AsFloat,
                                                               FcdsSaldosN.FieldByName('UNIDNEGOC').AsFloat,FcdsSaldosN.FieldByName('CODSUBCONTA').AsFloat,0,
                                                               FcdsSaldosS.FieldByName('IDPLANOPREV').AsFloat,FcdsSaldosS.FieldByName('IDPATRO').AsFloat,
                                                               liPlncodigo,0,sDataLanc,'Rateio Adm.',FCdsRatAdm.FieldByName('DESCRICAO').asString,'','','','',sTipoOper,
                                                               FcdsSaldosN.FieldByName('CODCENTROCUSTO').AsString,cContaD,'','','',rValCor,False,True,
                                                               // 05/01/03 Alex 14451 - Nova estrutura para Segregação, não utilizada pela anterior
                                                               -1, -1) then begin
                              sMens := Lancamento.MessageInfo;
                              Abort;
                           end;
                           liPlncodigo := Lancamento.RetornoPlnCodigo;
                        end;
                        FcdsSaldosS.Next;
                     end;
                     if FcdsSaldosN.FieldByName('SALDOCOR').asFloat <> rAcuCor then begin
                        rValLanc := FcdsSaldosN.FieldByName('SALDOCOR').asFloat - rAcuCor;
                        Lancamento.lcValGerDeb := FcdsSaldosN.FieldByName('SALDOGER').asFloat - rAcuGer;
                        Lancamento.lcValGe1Deb := FcdsSaldosN.FieldByName('SALDOGER1').asFloat - rAcuGer1;
                        Lancamento.lcValGe2Deb := FcdsSaldosN.FieldByName('SALDOGER2').asFloat - rAcuGer2;
                        Lancamento.lcValOfiDeb := FcdsSaldosN.FieldByName('SALDOOFI').asFloat - rAcuOfi;
                        Lancamento.lcValHisDeb := FcdsSaldosN.FieldByName('SALDOHIST').asFloat - rAcuHist;
                        if not Lancamento.InsereLancaContab('0',iEmpresa,1,iUsuario,FcdsSaldosN.FieldByName('PLANO').AsFloat,
                                                        FcdsSaldosN.FieldByName('UNIDNEGOC').AsFloat,FcdsSaldosN.FieldByName('CODSUBCONTA').AsFloat,0,
                                                        FcdsSaldosS.FieldByName('IDPLANOPREV').AsFloat,FcdsSaldosS.FieldByName('IDPATRO').AsFloat,
                                                        liPlncodigo,0,sDataLanc,'Rateio Adm.','Acerto do Rateio Adm - '+FCdsRatAdm.FieldByName('DESCRICAO').asString,'','','','',sTipoOper,
                                                        FcdsSaldosN.FieldByName('CODCENTROCUSTO').AsString,cContaD,'','','',rValLanc,False,True,
                                                        // 05/01/03 Alex 14451 - Nova estrutura para Segregação, não utilizada pela anterior
                                                        -1, -1) then begin
                           sMens := Lancamento.MessageInfo;
                           Abort;
                        end;
                     end;
                     FcdsSaldosN.Next;
                  end;

                  If not Padroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario, 'Gera Lançamentos de Rateio Adm. por Plano/Patrocinadora',False) then
                     Raise Exception.Create( Padroes.MessageInfo );

                  Commit;
               except
                  On E:Exception Do Begin
                     Result := False;
                     bOk := false;
                     Rollback;
                     MessageInfo := sMens +'. '+E.Message;
                     DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),MessageInfo,'','']);
                  End;
               end;
               if not bOK then Break;
               FCdsRatAdm.Next;
               Inc(_Progresso);
               DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'','','']);
            end;
         finally
           FreeCds([FCdsSaldosN,FCdsSaldosS,FCdsRatAdm]);
         end;
      end;
   end;
end;

function TCtrlProcessaTotalPrev.ListaRatAdm: OleVariant;
var sSql : String;
begin
  sSql := 'SELECT IDRATADMPLANPATRO, DESCRICAO, IDPATRO, IDPLANOPREV '+
          'FROM RATADMPLANPATRO '+
          'ORDER BY DESCRICAO ';
  Result := GetDataPacket(sSql);
end;

function TCtrlProcessaTotalPrev.ListaSaldoNAdm(iEmpresa, iPlanoPrev,
  iPatro,iRateio: Double; iExercicio, iPeriodo: Integer): OleVariant;
var _sql : TCMSqlParams;
begin
   Result := True;
   _sql := TCMSqlParams.Create(nil);
   Try
      _sql.ControlObject := Self;
      with _sql do begin
         SQL.Clear;
         SQL.Add('SELECT SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)                  ');
         SQL.Add('         - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDOCOR,            ');
         SQL.Add('       SUM(DECODE(S.PLSDEBITOOFICIAL, NULL, 0, S.PLSDEBITOOFICIAL)                    ');
         SQL.Add('         - DECODE(S.PLSCREDITOOFICIAL, NULL, 0, S.PLSCREDITOOFICIAL)) AS SALDOOFI,    ');
         SQL.Add('       SUM(DECODE(S.PLSDEBITOGER, NULL, 0, S.PLSDEBITOGER)                            ');
         SQL.Add('         - DECODE(S.PLSCREDITOGER, NULL, 0, S.PLSCREDITOGER)) AS SALDOGER,            ');
         SQL.Add('       SUM(DECODE(S.PLSDEBITOGEREN1, NULL, 0, S.PLSDEBITOGEREN1)                      ');
         SQL.Add('         - DECODE(S.PLSCREDITOGEREN1, NULL, 0, S.PLSCREDITOGEREN1)) AS SALDOGER1,     ');
         SQL.Add('       SUM(DECODE(S.PLSDEBITOGEREN2, NULL, 0, S.PLSDEBITOGEREN2)                      ');
         SQL.Add('         - DECODE(S.PLSCREDITOGEREN2, NULL, 0, S.PLSCREDITOGEREN2)) AS SALDOGER2,     ');
         SQL.Add('       SUM(DECODE(S.PLSDEBITOHIST, NULL, 0, S.PLSDEBITOHIST)                          ');
         SQL.Add('         - DECODE(S.PLSCREDITOHIST, NULL, 0, S.PLSCREDITOHIST)) AS SALDOHIST,         ');
         SQL.Add('       C.PLACONTASEGREG,C.PLATIPO,S.PLANO,S.PLACONTA,S.CODSUBCONTA,S.CODCENTROCUSTO,S.UNIDNEGOC,S.IDPLANOPREV,S.IDPATRO  ');
         SQL.Add('FROM PLANOSALDO S, PLANOCONTA C         ');
         SQL.Add('WHERE                                   ');
//         SQL.Add('       (C.PLATIPO = ''A'') AND          ');      retirado a pedido da CBS - 03.06.2003
         SQL.Add('       (S.PLACONTA = C.PLACONTA) AND    ');
         SQL.Add('       (S.PLANO = C.PLANO) AND          ');
         if iPlanoPrev <> 0 then
            SQL.Add('       (S.IDPLANOPREV = '+FloatToStr(iPlanoPrev)+') AND                   ');
         if iPatro <> 0 then
            SQL.Add('       (S.IDPATRO = '+FloatToStr(iPatro)+') AND                   ');
         SQL.Add('       (C.IDRATADMPLANPATRO = '+FloatToStr(iRateio)+') AND                   ');
         SQL.Add('       (S.PEREXERCICIO ='+IntToStr(iExercicio)+') AND                                            ');
         SQL.Add('       (S.PERNUMERO ='+IntToStr(iPeriodo)+') AND                                                  ');
         SQL.Add('       (S.IDPESSOA     ='+FloatToStr(iEmpresa)+')                                                    ');
         SQL.Add('GROUP BY                                                                              ');
         SQL.Add('       C.PLACONTASEGREG,C.PLATIPO,S.PLANO,S.PLACONTA,S.CODSUBCONTA,S.CODCENTROCUSTO, S.UNIDNEGOC,S.IDPLANOPREV,S.IDPATRO ');
         SQL.Add('ORDER BY S.PLANO,S.PLACONTA,S.CODSUBCONTA,S.CODCENTROCUSTO,S.UNIDNEGOC,S.IDPLANOPREV,S.IDPATRO');
      end;
      Result := _sql.Data;
   Finally
      _sql.Free;
   end;
end;

end.

