unit uCtrlMovimFinanc;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uDbMovimFinanc, uCtrlFinanc, uGeralFinanc, uCtrlListTercFinanc, uCMClientDataSet,
     uCtrlLancamento, uCtrlParamIntegra, uDbImpostoRetido , uCtrlImpostoRetido
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TOperacaoFinanc = (opInclusao,opAlteracao);
   
   TMovimFinanc = record
                     CodLancFinanc    : Double;
                     PlnCodigo        : Double;
                     IDNFLivro        : Double;
                     IDModulo         : Double;
                     HistPadFinan     : Double;
                     MoeCodigo        : Double;
                     IDUsuarioInclusao: Double;
                     CodPortador      : Double;
                     ValorLancFinanc  : Double;
                     NumChqBordero    : String;
                     DataLancFinan    : TDateTime;
                     DataConciliacao  : TDateTime;
                     EntradaSaida     : String;
                     Historico        : String;
                     StatusConcilia   : String;
                     ValorOutraMoeda  : Double;
                     IDPessoa         : Double;
                     CodLancTransf    : Double;
                     LoteTransmissao  : Double;
                     DataDispFinanc   : TDateTime;
                  end;

   TRateioFinanc = record
                      IDPessoa       : Double;
                      IDEmpresa      : Double;
                      IDPrograma     : Double;
                      IDPlanoPrev    : Double;
                      IDRateioFinanc : Double;
                      CodLancFinanc  : Double;
                      IDPatro        : Double;
                      CodCentroCusto : String;
                      UnidNegoc      : Double;
                      CodTipRecDes   : String;
                      RecPag         : String;
                      CodCentroRespon: String;
                      MoeCodigo      : Double;
                      Valor          : Double;
                      ValorOutraMoeda: Double;
                      LoteTransmissao: Double;
                      CodTipDoc      : Double;
                   end;

   TContabil = record
                  PlnCodigo         : Double;
                  LacNumLan         : Double;
                  LacDebCre         : String;
                  UnidNegoc         : Double;
                  IDPlanoPrev       : Double;
                  IDPatro           : Double;
                  IDElemDemonstrat  : Double;
                  HitCodHist        : String;
                  IDPessoa          : Double;
                  IDEmpresa         : Double;
                  IDModulo          : Double;
                  IDUsuarioInclusao : Double;
                  CodCentroCusto    : String;
                  PlaConta          : String;
                  Plano             : Double;
                  LacTipo           : String;
                  LacNumDoc         : String;
                  LacHist1          : String;
                  LacHist2          : String;
                  LacHist3          : String;
                  LacHist4          : String;
                  LacHist5          : String;
                  LacValor          : Double;
                  LacTipConvOficial : String;
                  LacValOficial     : String;
                  LacTipConvGer     : String;
                  LacValGerencial   : Double;
                  LacTipConvGeren1  : String;
                  LacValGeren1      : Double;
                  LacTipConvGeren2  : String;
                  LacValGeren2      : Double;
                  LacAtOutMoeda     : String;
                  LacOrigemAplic    : String;
                  TipCodigo         : String;
                  LacValHist        : Double;
                  CodSubConta       : Double;
                  LoteTransmissao   : Double;
                  DescCCusto        : String;
                  DescUnidNeg       : String;
               end;

   TCtrlMovimFinanc = Class(TCmControlObject)
   private
      FCdsMovimFinanc    : TCMClientDataSet;
      FCdsRateioFinanc   : TCMClientDataSet;
      FCdsContabil       : TCMClientDataSet;
      FDbImpostoRetido   : TDbImpostoRetido;
      CtrlFinanc         : TCtrlFinanc;
      CtrlLancamento     : TCtrlLancamento;
      CtrlListTerceiros  : TCtrlListTercFinanc;
      CtrlImpostoRetido  : TCtrlImpostoRetido;
      GeralFinanc        : TGeralFinanc;

      F_rIDPessoa      : Double;
      F_rIDModulo      : Double;
      F_rIDUsuario     : Double;
      F_bUsaPlanoPatro : Boolean;
      rTipoDoc         : Double;
   public
      property CdsMovimFinanc  : TCMClientDataSet read FCdsMovimFinanc  write FCdsMovimFinanc;
      property CdsRateioFinanc : TCMClientDataSet read FCdsRateioFinanc write FCdsRateioFinanc;
      property CdsContabil     : TCMClientDataSet read FCdsContabil     write FCdsContabil;

      property IDPessoa: Double write F_rIDPessoa;
      property IDModulo: Double write F_rIDModulo;
      property IDUsuario: Double write F_rIDUsuario;
      property UsaPlanoPatro: Boolean write F_bUsaPlanoPatro;

      constructor Create(rIDPessoa,rIDModulo,rIDUsuario: Double; bUsaPlanoPatro: Boolean); reintroduce;
      destructor Destroy; override;

      procedure PreparaCtrl;

      procedure OnCreateAppServer; override;

      function EstornoFinanceiro(dDataEstorno, dDataDisp: TDateTime ; bRegNaoIdent: Boolean;
                                var rCodLancFinan: Double; rIDPlano: Double;
                                bIntegraContabil: Boolean): Boolean;


      function GravaFinanceiro(bRegNaoIdent: Boolean; Operacao: TOperacaoFinanc;
                               rIDPlano: Double;
                               bIntegraContabil,bCalcImposto: Boolean): Boolean; overload;

      function GravaFinanceiro(DadosMovimento: array of TMovimFinanc;
                               DadosRateio:    array of TRateioFinanc;
                               DadosContabeis: array of TContabil;
                               bRegNaoIdent: Boolean;
                               Operacao: TOperacaoFinanc;
                               rIDPlano: Double;
                               bIntegraContabil,bCalcImposto: Boolean): Boolean; overload;

      function ExcluiFinanceiro(rCodLancFinan: Double): Boolean;

      function GeraImpostoRateio(var rImposto: Double): Boolean;
      function VerificaRateio: Boolean;
      function GeraContabilizacao(sContaBanco, sCCustoBanco: String; rSubContaBanco: Double;
                                  sContaNI, sCCustoNI: String;rSubContaNI: Double;
                                  bRegNaoIdent: Boolean; rIDPlano: Double): Boolean;

      function GeraRegistroContabil(RegContabil: TContabil; rIDPlano: Double): Boolean;
      function VerificaContabilizacao(rIDPlano: Double; sContaBanco: String;
                                      rSubContaBanco: Double): Boolean;
      function ListMovimFinanc(rCodLancFinanc: Double): OleVariant;
      function ListMovimFinancConciliacao(rCodPortador, rIDPessoa: Double): OleVariant;

      function ListRateioFinanc(rCodLancFinanc: Double): OleVariant;

      function ListContabil(rCodLancContabil: Double): OleVariant;
   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;

implementation

{ TCtrlMovimFinanc }

constructor TCtrlMovimFinanc.Create(rIDPessoa, rIDModulo,
  rIDUsuario: Double; bUsaPlanoPatro: Boolean);
begin
   inherited Create;

   F_rIDPessoa:=rIDPessoa;
   F_rIDModulo:=rIDModulo;
   F_rIDUsuario:=rIDUsuario;
   F_bUsaPlanoPatro:=bUsaPlanoPatro;

   CtrlFinanc:=TCtrlFinanc.Create(rIDPessoa,rIDModulo,rIDUsuario,bUsaPlanoPatro);

   CtrlLancamento:=TCtrlLancamento.Create;
   CtrlListTerceiros:=TCtrlListTercFinanc.Create;
   CtrlImpostoRetido:=TCtrlImpostoRetido.Create;

   GeralFinanc:=TGeralFinanc.Create;
   FDbImpostoRetido:=TDbImpostoRetido.Create(Self);
end;

destructor TCtrlMovimFinanc.Destroy;
begin
   if IsAppServer then
    begin
       FCdsMovimFinanc.Free;
       FCdsRateioFinanc.Free;
       FCdsContabil.Free;
    end;

   CtrlFinanc.Free;
   CtrlLancamento.Free;
   CtrlListTerceiros.Free;
   CtrlImpostoRetido.Free;
   FDbImpostoRetido.Free;
   
   GeralFinanc.Free;
   inherited;
end;

procedure TCtrlMovimFinanc.DoChangeDataBase;
begin
   inherited;
   FDbImpostoRetido.DataBaseName:=DataBaseName;
end;

procedure TCtrlMovimFinanc.AfterInitialize;
begin
   inherited;
   CtrlFinanc.InitializeAs(Self);
   CtrlLancamento.InitializeAs(Self);
   CtrlImpostoRetido.InitializeAs(Self);
   GeralFinanc.InitializeAs(Self);

   CtrlFinanc.OpenTransaction:=False;
   CtrlLancamento.OpenTransaction:=False;
   CtrlImpostoRetido.OpenTransaction:=False;
   GeralFinanc.OpenTransaction:=False;
   if (F_rIDPessoa<>0) then PreparaCtrl; //Não executará para cnsServer   
end;

procedure TCtrlMovimFinanc.PreparaCtrl;
begin
   with TCMClientDataSet.Create(nil) do
   try
      Data:=GetDataPacket('SELECT CODTIPDOC '+
                          'FROM PARALMOX '+
                          'WHERE (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ');
      rTipoDoc:=0;
      if not(IsEmpty) then rTipoDoc:=FieldByName('CODTIPDOC').AsFloat;
   finally
      Free;
   end;

   ParamIntegra.GetParams(Trunc(F_rIDPessoa), 0, 'INTEGRACONTAB', 'PARAMFINANC', tiSistema);   
end;

procedure TCtrlMovimFinanc.OnCreateAppServer;
begin
   inherited;
   FCdsMovimFinanc:=TCMClientDataSet.Create(nil);
   FCdsRateioFinanc:=TCMClientDataSet.Create(nil);
   FCdsContabil:=TCMClientDataSet.Create(nil);
end;

function TCtrlMovimFinanc.ListMovimFinanc(rCodLancFinanc: Double): OleVariant;
begin
   Result:=GetDataPacket('SELECT M.*, P.DESCRICAO AS DESCPORTADOR, U.NOMEUSUARIO  '+
                         'FROM MOVIMFINANC M, PORTADORCONTA P, USUARIOSISTEMA U '+
                         'WHERE (M.CODLANCFINANC = '+FloatToStr(rCodLancFinanc)+') AND '+
                         '      (M.CODPORTADOR=P.CODPORTADOR) AND '+
                         '      (RTRIM(M.TRGUSERINCLUSAO)=RTRIM(''CM''||TO_CHAR(U.IDUSUARIO)))');
end;

function TCtrlMovimFinanc.ListMovimFinancConciliacao(rCodPortador,
  rIDPessoa: Double): OleVariant;
begin
   Result:=GetDataPacket('SELECT * '+
                         'FROM MOVIMFINANC '+
                         'WHERE (CODPORTADOR = '+FloatToStr(rCodPortador)+') AND '+
                         '      (IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
                         '      (STATUSCONCILIA = ''N'' OR STATUSCONCILIA = ''P'') '+
                         'ORDER BY DATALANCFINAN, NUMCHQBORDERO');
end;



function TCtrlMovimFinanc.ListRateioFinanc(rCodLancFinanc: Double): OleVariant;
begin
   Result:=GetDataPacket('SELECT R.*, '+
                         '   U.NOME AS DESCUNIDNEG, '+
                         '   C.NOME AS DESCCRESPON, '+
                         '   T.DESCRICAO, '+
                         '   I.MOESIGLA '+
                         'FROM '+
                         '   RATEIOFINANC R, '+
                         '   UNIDNEGOCIO U, '+
                         '   CENTRESPON C, '+
                         '   TIPORECEBDESEMB T, '+
                         '   MOEDA I '+
                         'WHERE '+
                         '   (R.CODLANCFINANC='+FloatToStr(rCodLancFinanc)+') AND '+
                         '   (T.CODTIPRECDES=R.CODTIPRECDES) AND '+
                         '   (T.RECPAG=R.RECPAG) AND '+
                         '   (T.IDPESSOA=R.IDPESSOA) AND '+
                         '   (U.UNIDNEGOC=R.UNIDNEGOC) AND '+
                         '   (U.IDPESSOA=R.IDPESSOA) AND '+
                         '   (I.MOECODIGO(+)=R.MOECODIGO) AND '+
                         '   (C.CODCENTRORESPON=R.CODCENTRORESPON) AND '+
                         '   (C.IDPESSOA=R.IDPESSOA)');
end;

function TCtrlMovimFinanc.ListContabil(rCodLancContabil: Double): OleVariant;
begin
   Result:=GetDataPacket('SELECT '+
                         '   LC.*, '+
                         '   U.NOME AS DESCUNIDNEG, '+
                         '   CC.NOME AS DESCCCUSTO, '+
                         '   P.PLANOME AS DESCPLANO '+
                         'FROM '+
                         '   LANCAMENTO LC, '+
                         '   UNIDNEGOCIO U, '+
                         '   CENTCUST CC, '+
                         '   PLANOCONTA P '+
                         'WHERE '+
                         '   (LC.PLANO = P.PLANO) AND '+
                         '   (LC.PLACONTA = P.PLACONTA) AND '+
                         '   (LC.PLNCODIGO = '+FloatToStr(rCodLancContabil)+')  AND '+
                         '   (LC.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND '+
                         '   (LC.IDEMPRESA = CC.IDEMPRESA(+)) AND '+
                         '   (LC.IDPESSOA = U.IDPESSOA(+)) AND '+
                         '   (LC.UNIDNEGOC = U.UNIDNEGOC(+)) ');
end;

function TCtrlMovimFinanc.EstornoFinanceiro(dDataEstorno,dDataDisp: TDateTime; bRegNaoIdent: Boolean;
                                            var rCodLancFinan: Double; rIDPlano: Double;
                                            bIntegraContabil: Boolean): Boolean;
begin
   MessageInfo:='';
   if ConnectionSide=cnsClient then
    begin
       Result:=Connection.AppServer.EstornoFinanceiro(dDataEstorno,
                                                      dDataDisp,
                                                      rCodLancFinan,
                                                      rIDPlano,
                                                      bIntegraContabil,
                                                      bRegNaoIdent,
                                                      F_rIDPessoa,
                                                      F_rIDModulo,
                                                      F_rIDUsuario,
                                                      F_bUsaPlanoPatro);

       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result:=CtrlFinanc.EstornoFinanceiro(dDataEstorno,dDataDisp, bRegNaoIdent ,rCodLancFinan,
                                               F_rIDPessoa,F_rIDModulo, F_rIDUsuario,
                                               rIDPlano,
                                               bIntegraContabil);
          if not Result then
           begin
              MessageInfo:=CtrlFinanc.MessageInfo;
              Rollback;
           end
          else
           Commit;
       except
          on E:Exception do
          begin
             Result := False;
             Rollback;
             MessageInfo := E.Message;
          end;
       end;
    end;
end;

function TCtrlMovimFinanc.GravaFinanceiro(bRegNaoIdent: Boolean; Operacao: TOperacaoFinanc;
                                          rIDPlano: Double;
                                          bIntegraContabil,bCalcImposto: Boolean): Boolean;
var
   rCodLancFinancAux     : Double;
   rPlnCodigoAux         : Double;
   rTotalImposto         : Double;
   sOperacao             : String;
   sEntradaSaidaAux      : String;
   cdsMovimFinancAntigo  : TCMClientDataSet;
   cdsRateioFinancAntigo : TCMClientDataSet;
begin
   MessageInfo:='';
   if ConnectionSide=cnsClient then
    begin
       case Operacao of
          opInclusao : sOperacao:='I';
          opAlteracao: sOperacao:='A';
       end;

       Result:=Connection.AppServer.GravaFinanceiro(FCdsMovimFinanc.Data,
                                                    FCdsRateioFinanc.Data,
                                                    FCdsContabil.Data,
                                                    bRegNaoIdent,
                                                    sOperacao,
                                                    rIDPlano,
                                                    bIntegraContabil,
                                                    bCalcImposto,
                                                    F_rIDPessoa,
                                                    F_rIDModulo,
                                                    F_rIDUsuario,
                                                    F_bUsaPlanoPatro);

       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    try
       //Verifica o Rateio
       Result:=VerificaRateio;
       if not(Result) then Exit;

       if ((FCdsMovimFinanc.FieldByName('STATUSCONCILIA').AsString = 'X') or
          (FCdsMovimFinanc.FieldByName('STATUSCONCILIA').AsString = 'I')) and
          (FCdsMovimFinanc.FieldByName('DATACONCILIACAO').IsNull) then
           FCdsMovimFinanc.FieldByName('DATACONCILIACAO').AsString:=
                           FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsString;

       if (FCdsMovimFinanc.FieldByName('STATUSCONCILIA').AsString = 'N') or
          (FCdsMovimFinanc.FieldByName('STATUSCONCILIA').AsString = 'C') then
           FCdsMovimFinanc.FieldByName('DATACONCILIACAO').Clear;

       //Inclusão ou Regulraização de Lançamentos
       if (Operacao=opInclusao) then
        begin
           StartTransaction;
           try
              if bRegNaoIdent then
               begin
                  Result:=CtrlFinanc.MudaStatusConcilia('J',
                                         FCdsMovimFinanc.FieldByName('DATACONCILIACAO').AsDateTime,
                                         FCdsMovimFinanc.FieldByName('CODLANCFINANC').AsFloat);
                  if not(Result) then
                   begin
                      MessageInfo:=CtrlFinanc.MessageInfo;
                      Rollback;
                      Exit;
                   end;

                  cdsMovimFinancAntigo:=TCMClientDataSet.Create(nil);
                  cdsRateioFinancAntigo:=TCMClientDataSet.Create(nil);
                  try
                     //Busca dados do Movimento e do Rateio antes das modificações feitas na tela
                     cdsMovimFinancAntigo.Data:=
                             ListMovimFinanc(FCdsMovimFinanc.FieldByName('CODLANCFINANC').AsFloat);
                     cdsRateioFinancAntigo.Data:=
                             ListRateioFinanc(FCdsMovimFinanc.FieldByName('CODLANCFINANC').AsFloat);

                     //Zera Parâmetros
                     rCodLancFinancAux:=0;
                     rPlnCodigoAux:=0;

                     if (FCdsMovimFinanc.FieldByName('ENTRADASAIDA').AsString='E') then
                        sEntradaSaidaAux:='S'
                     else
                        sEntradaSaidaAux:='E';

                     Result:=CtrlFinanc.LancaFinanceiro(
                                             FCdsContabil.Data,
                                             F_rIDModulo,
                                             cdsMovimFinancAntigo.FieldByName('HISTPADFINAN').AsFloat,
                                             cdsMovimFinancAntigo.FieldByName('MOECODIGO').AsFloat,
                                             F_rIDUsuario,
                                             cdsMovimFinancAntigo.FieldByName('CODPORTADOR').AsFloat,
                                             F_rIDPessoa,
                                             FCdsMovimFinanc.FieldByName('VALORLANCFINAN').AsFloat,
                                             FCdsMovimFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                             FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime,
                                             cdsMovimFinancAntigo.FieldByName('DATACONCILIACAO').AsDateTime,0,
                                             cdsMovimFinancAntigo.FieldByName('NUMCHQBORDERO').AsString,
                                             sEntradaSaidaAux,
                                             cdsMovimFinancAntigo.FieldByName('HISTORICO').AsString,
                                             'J',rCodLancFinancAux,rPlnCodigoAux,rIDPlano,
                                             bIntegraContabil);

                     if not(Result) then
                      begin
                         MessageInfo:=CtrlFinanc.MessageInfo;
                         Rollback;
                         Exit;
                      end;

                     FCdsRateioFinanc.First;
                     while not(FCdsRateioFinanc.EOF) do
                     begin
                        Result:=CtrlFinanc.LancaRateioFinanc(
                                                cdsRateioFinancAntigo.FieldByName('UNIDNEGOC').AsFloat,
                                                cdsRateioFinancAntigo.FieldByName('MOECODIGO').AsFloat,
                                                F_rIDPessoa,
                                                cdsMovimFinancAntigo.FieldByName('CODPORTADOR').AsFloat,
                                               -cdsRateioFinancAntigo.FieldByName('VALOR').AsFloat,
                                               -cdsRateioFinancAntigo.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                                cdsRateioFinancAntigo.FieldByName('CODTIPRECDES').AsString,
                                                cdsRateioFinancAntigo.FieldByName('RECPAG').AsString,
                                                cdsRateioFinancAntigo.FieldByName('CODCENTRORESPON').AsString,
                                                FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime,
                                                rCodLancFinancAux,
                                                cdsRateioFinancAntigo.FieldByName('CODCENTROCUSTO').AsString,
                                                cdsRateioFinancAntigo.FieldByName('IDPROGRAMA').AsFloat,
                                                cdsRateioFinancAntigo.FieldByName('IDPATRO').AsFloat,
                                                cdsRateioFinancAntigo.FieldByName('IDPLANOPREV').AsFloat,
                                                cdsRateioFinancAntigo.FieldByName('CODTIPDOC').AsFloat,
                                                rIDPlano);
                        if not(Result) then
                         begin
                            MessageInfo:=CtrlFinanc.MessageInfo;
                            Rollback;
                            Exit;
                         end;

                        FCdsRateioFinanc.Next;
                     end;

                     rCodLancFinancAux:=0;
                     rPlnCodigoAux:=0;

                     Result:=CtrlFinanc.LancaFinanceiro(
                                             CtrlFinanc.DadosVazio,
                                             F_rIDModulo,
                                             FCdsMovimFinanc.FieldByName('HISTPADFINAN').AsFloat,
                                             FCdsMovimFinanc.FieldByName('MOECODIGO').AsFloat,
                                             F_rIDUsuario,
                                             FCdsMovimFinanc.FieldByName('CODPORTADOR').AsFloat,
                                             F_rIDPessoa,
                                             FCdsMovimFinanc.FieldByName('VALORLANCFINAN').AsFloat,
                                             FCdsMovimFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                             FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime,
                                             FCdsMovimFinanc.FieldByName('DATACONCILIACAO').AsDateTime,0,
                                             FCdsMovimFinanc.FieldByName('NUMCHQBORDERO').AsString,
                                             FCdsMovimFinanc.FieldByName('ENTRADASAIDA').AsString,
                                             FCdsMovimFinanc.FieldByName('HISTORICO').AsString,
                                             'X',rCodLancFinancAux,rPlnCodigoAux,rIDPlano,
                                             bIntegraContabil);

                     if not(Result) then
                      begin
                         MessageInfo:=CtrlFinanc.MessageInfo;
                         Rollback;
                         Exit;
                      end;
                  finally
                     cdsMovimFinancAntigo.Free;
                     cdsRateioFinancAntigo.Free;
                  end;
               end
              else
               begin
                  rPlnCodigoAux:=0;
                  rCodLancFinancAux:=0;

                  Result:=CtrlFinanc.LancaFinanceiro(
                                     FCdsContabil.Data,F_rIDModulo,
                                     FCdsMovimFinanc.FieldByName('HISTPADFINAN').AsFloat,
                                     FCdsMovimFinanc.FieldByName('MOECODIGO').AsFloat,
                                     F_rIDUsuario,
                                     FCdsMovimFinanc.FieldByName('CODPORTADOR').AsFloat,
                                     F_rIDPessoa,
                                     FCdsMovimFinanc.FieldByName('VALORLANCFINAN').AsFloat,
                                     FCdsMovimFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                     FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime,
                                     FCdsMovimFinanc.FieldByName('DATACONCILIACAO').AsDateTime,0,
                                     FCdsMovimFinanc.FieldByName('NUMCHQBORDERO').AsString,
                                     FCdsMovimFinanc.FieldByName('ENTRADASAIDA').AsString,
                                     FCdsMovimFinanc.FieldByName('HISTORICO').AsString,
                                     FCdsMovimFinanc.FieldByName('STATUSCONCILIA').AsString,
                                     rCodLancFinancAux,rPlnCodigoAux,rIDPlano,
                                     bIntegraContabil);

                  if not(Result) then
                   begin
                      MessageInfo:=CtrlFinanc.MessageInfo;
                      Rollback;
                      Exit;
                   end;
               end;

              FCdsRateioFinanc.First;
              while not(FCdsRateioFinanc.EOF) do
              begin
                 //=========== Início Imposto Retido ============================
                 if bCalcImposto then
                  begin
                     //Gravar impostos vinculados ao tipo de desembolso e Classificacao Fiscal
                     rTotalImposto:=0;
                     CtrlImpostoRetido.DataProgramada:=
                                       FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime;
                     CtrlImpostoRetido.OperacaoDocumento:='2 ';
                     CtrlImpostoRetido.IdForCli:=0;
                     CtrlImpostoRetido.CodDocumento:=0;
                     CtrlImpostoRetido.NumLancto:=0;
                     CtrlImpostoRetido.ValorLancto:=FCdsRateioFinanc.FieldByName('VALOR').AsFloat;
                     CtrlImpostoRetido.ValorLiquido:=FCdsRateioFinanc.FieldByName('VALOR').AsFloat;
                     CtrlImpostoRetido.DataLancto:=FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime;
                     CtrlImpostoRetido.DataEmissao:=FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime;

                     if (ParamIntegra.RecPag='R') then
                      begin
                         if (ParamIntegra.RecPag=FCdsRateioFinanc.FieldByName('RECPAG').AsString) then
                            CtrlImpostoRetido.DebCre:='D'
                         else
                            CtrlImpostoRetido.DebCre:='C';
                      end
                     else
                      begin
                         if (ParamIntegra.RecPag=FCdsRateioFinanc.FieldByName('RECPAG').AsString) then
                             CtrlImpostoRetido.DebCre:='C'
                         else
                             CtrlImpostoRetido.DebCre:='D';
                      end;

                     CtrlImpostoRetido.RecPag:=FCdsRateioFinanc.FieldByName('RECPAG').AsString[1];
                     CtrlImpostoRetido.IdEmpresa:=Trunc(F_rIDPessoa);
                     CtrlImpostoRetido.CodTipRecDes:=FCdsRateioFinanc.FieldByName('CODTIPRECDES').AsString;
                     CtrlImpostoRetido.MomentoLancamento:=mlLancamento;
                     CtrlImpostoRetido.CodTipoDoc:=Trunc(rTipoDoc);
                     CtrlImpostoRetido.Incluir;

                     if not(CtrlImpostoRetido.CdsSimulacao.IsEmpty) then
                      begin
                         CtrlImpostoRetido.CdsSimulacao.First;
                         while not(CtrlImpostoRetido.CdsSimulacao.Eof) do
                         begin
                            with TCMClientDataSet.Create(nil) do
                            try
                               Data:=GetDataPacket('SELECT CODTIPRECDES, RECPAG '+
                                                   'FROM TIPOAGRE '+
                                                   'WHERE (CODTIPRECDES IS NOT NULL) AND '+
                                                   '      (CODTIPOCUSTAGREG = '+
                                IntToStr(CtrlImpostoRetido.CdsSimulacao.FieldByName('IDIMPOSTO').AsInteger)+') ');

                               if not(IsEmpty) then
                                begin
                                   rTotalImposto:=rTotalImposto+
                                     CtrlImpostoRetido.CdsSimulacao.FieldByName('VALORIMPOSTO').AsFloat;

                                   FDbImpostoRetido.Dataretencao.AsDateTime:=
                                      FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime;
                                   FDbImpostoRetido.Codtipocustagreg.AsFloat:=
                                      CtrlImpostoRetido.CdsSimulacao.FieldByName('IDIMPOSTO').AsFloat;
                                   FDbImpostoRetido.Vlrbase.AsFloat:=
                                      CtrlImpostoRetido.CdsSimulacao.FieldByName('VALORBASE').AsFloat;
                                   FDbImpostoRetido.Vlrretido.AsFloat:=
                                      CtrlImpostoRetido.CdsSimulacao.FieldByName('VALORIMPOSTO').AsFloat;
                                   FDbImpostoRetido.Idpessoa.AsFloat:=F_rIDPessoa;
                                   FDbImpostoRetido.Recpag.AsString:=ParamIntegra.RecPag;
                                   FDbImpostoRetido.Codlancfinanc.AsFloat:=rCodLancFinancAux;

                                   Result:=FDbImpostoRetido.Insert;
                                   if not(Result) then
                                    begin
                                       MessageInfo:=FDbImpostoRetido.MessageInfo;
                                       Rollback;
                                       Exit;
                                    end;
                                end;
                            finally
                               Free;
                            end;
                            CtrlImpostoRetido.CdsSimulacao.Next;
                         end;
                      end;
                  end;
                 //=========== Final Imposto Retido ============================

                 Result:=CtrlFinanc.LancaRateioFinanc(
                                               FCdsRateioFinanc.FieldByName('UNIDNEGOC').AsFloat,
                                               FCdsRateioFinanc.FieldByName('MOECODIGO').AsFloat,
                                               F_rIDPessoa,
                                               FCdsMovimFinanc.FieldByName('CODPORTADOR').AsFloat,
                                               FCdsRateioFinanc.FieldByName('VALOR').AsFloat,
                                               FCdsRateioFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                               FCdsRateioFinanc.FieldByName('CODTIPRECDES').AsString,
                                               FCdsRateioFinanc.FieldByName('RECPAG').AsString,
                                               FCdsRateioFinanc.FieldByName('CODCENTRORESPON').AsString,
                                               FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime,
                                               rCodLancFinancAux,
                                               FCdsRateioFinanc.FieldByName('CODCENTROCUSTO').AsString,
                                               FCdsRateioFinanc.FieldByName('IDPROGRAMA').AsFloat,
                                               FCdsRateioFinanc.FieldByName('IDPATRO').AsFloat,
                                               FCdsRateioFinanc.FieldByName('IDPLANOPREV').AsFloat,
                                               FCdsRateioFinanc.FieldByName('CODTIPDOC').AsFloat,
                                               rIDPlano);
                 if not(Result) then
                  begin
                     MessageInfo:=CtrlFinanc.MessageInfo;
                     Rollback;
                     Exit;
                  end;

                 FCdsRateioFinanc.Next;
              end;

              Commit;
           except
              on E:Exception do
              begin
                 Result := False;
                 Rollback;
                 MessageInfo := E.Message;
              end;
           end;
        end;

       //Alteração de Lançamentos
       if (Operacao=opAlteracao) then
        begin
           StartTransaction;
           try
              rPlnCodigoAux:=FCdsMovimFinanc.FieldByName('PLNCODIGO').AsFloat;
              rCodLancFinancAux:=FCdsMovimFinanc.FieldByName('CODLANCFINANC').AsFloat;
              Result:=CtrlFinanc.AlteraFinanceiro(
                                       FCdsContabil.Data,
                                       FCdsMovimFinanc.FieldByName('HISTPADFINAN').AsFloat,
                                       F_rIDModulo,
                                       FCdsMovimFinanc.FieldByName('MOECODIGO').AsFloat,
                                       F_rIDUsuario,
                                       FCdsMovimFinanc.FieldByName('CODPORTADOR').AsFloat,
                                       F_rIDPessoa,
                                       FCdsMovimFinanc.FieldByName('VALORLANCFINAN').AsFloat,
                                       FCdsMovimFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                       FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime,
                                       FCdsMovimFinanc.FieldByName('DATACONCILIACAO').AsDateTime,
                                       FCdsMovimFinanc.FieldByName('NUMCHQBORDERO').AsString,
                                       FCdsMovimFinanc.FieldByName('ENTRADASAIDA').AsString,
                                       FCdsMovimFinanc.FieldByName('HISTORICO').AsString,
                                       FCdsMovimFinanc.FieldByName('STATUSCONCILIA').AsString,
                                       rPlnCodigoAux,rCodLancFinancAux,
                                       ParamIntegra.Plano,bIntegraContabil);

              if not(Result) then
               begin
                  MessageInfo:=CtrlFinanc.MessageInfo;
                  Rollback;
                  Exit;
               end;

              Result:=CtrlFinanc.ExcluiRateioFinanc(rCodLancFinancAux);

              FCdsRateioFinanc.First;
              while not(FCdsRateioFinanc.EOF) do
              begin
                 Result:=CtrlFinanc.LancaRateioFinanc(
                                         FCdsRateioFinanc.FieldByName('UNIDNEGOC').AsFloat,
                                         FCdsRateioFinanc.FieldByName('MOECODIGO').AsFloat,
                                         F_rIDPessoa,
                                         FCdsMovimFinanc.FieldByName('CODPORTADOR').AsFloat,
                                         FCdsRateioFinanc.FieldByName('VALOR').AsFloat,
                                         FCdsRateioFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                         FCdsRateioFinanc.FieldByName('CODTIPRECDES').AsString,
                                         FCdsRateioFinanc.FieldByName('RECPAG').AsString,
                                         FCdsRateioFinanc.FieldByName('CODCENTRORESPON').AsString,
                                         FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime,
                                         rCodLancFinancAux,
                                         FCdsRateioFinanc.FieldByName('CODCENTROCUSTO').AsString,
                                         FCdsRateioFinanc.FieldByName('IDPROGRAMA').AsFloat,
                                         FCdsRateioFinanc.FieldByName('IDPATRO').AsFloat,
                                         FCdsRateioFinanc.FieldByName('IDPLANOPREV').AsFloat,
                                         FCdsRateioFinanc.FieldByName('CODTIPDOC').AsFloat,
                                         ParamIntegra.Plano);
                 if not(Result) then
                  begin
                     MessageInfo:=CtrlFinanc.MessageInfo;
                     Rollback;
                     Exit;
                  end;
                 FCdsRateioFinanc.Next;
              end;

              FCdsMovimFinanc.Edit;
              FCdsMovimFinanc.FieldByName('PLNCODIGO').AsFloat:=rPlnCodigoAux;
              FCdsMovimFinanc.Post;

              Commit;
           except
              on E:Exception do
              begin
                 Result := False;
                 Rollback;
                 MessageInfo := E.Message;
              end;
           end;
        end;
    except
       on E:Exception do
       begin
          Result := False;
          MessageInfo := E.Message;
       end;
    end;
end;

function TCtrlMovimFinanc.GravaFinanceiro(DadosMovimento: array of TMovimFinanc;
                                          DadosRateio:    array of TRateioFinanc;
                                          DadosContabeis: array of TContabil;
                                          bRegNaoIdent: Boolean;
                                          Operacao: TOperacaoFinanc;
                                          rIDPlano: Double;
                                          bIntegraContabil,bCalcImposto: Boolean): Boolean;
var
   iNumTermosMF   : Integer;
   iNumTermosRat  : Integer;
   iNumTermosCont : Integer;
   iLinha         : Integer;
begin
   MessageInfo:='';

   try
      iNumTermosMF:=Length(DadosMovimento);
      iNumTermosRat:=Length(DadosRateio);
      iNumTermosCont:=Length(DadosContabeis);

      if (iNumTermosMF<1) or (iNumTermosRat<1) then
       begin
          Result:=False;
          MessageInfo:='Não foram informados dados do Movimento e/ou do Rateio.';
          Exit;
       end;

      //Carrega cds de Movimento Financeiro
      for iLinha:=1 to iNumTermosMF do
      begin
         FcdsMovimFinanc.Append;
         FcdsMovimFinanc.FieldByName('CODLANCFINANC').AsFloat:=DadosMovimento[iLinha].CodLancFinanc;
         FcdsMovimFinanc.FieldByName('PLNCODIGO').AsFloat:=DadosMovimento[iLinha].PlnCodigo;
         FcdsMovimFinanc.FieldByName('IDNFLIVRO').AsFloat:=DadosMovimento[iLinha].IDNFLivro;
         FcdsMovimFinanc.FieldByName('IDMODULO').AsFloat:=DadosMovimento[iLinha].IDModulo;
         FcdsMovimFinanc.FieldByName('HISTPADFINAN').AsFloat:=DadosMovimento[iLinha].HistPadFinan;
         FcdsMovimFinanc.FieldByName('MOECODIGO').AsFloat:=DadosMovimento[iLinha].MoeCodigo;
         FcdsMovimFinanc.FieldByName('IDUSUARIOINCLUSAO').AsFloat:=
                                              DadosMovimento[iLinha].IDUsuarioInclusao;
         FcdsMovimFinanc.FieldByName('CODPORTADOR').AsFloat:=DadosMovimento[iLinha].CodPortador;
         FcdsMovimFinanc.FieldByName('VALORLANCFINAN').AsFloat:=DadosMovimento[iLinha].ValorLancFinanc;
         FcdsMovimFinanc.FieldByName('NUMCHQBORDERO').AsString:=DadosMovimento[iLinha].NumChqBordero;
         FcdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime:=DadosMovimento[iLinha].DataLancFinan;
         FcdsMovimFinanc.FieldByName('DATACONCILIACAO').AsDateTime:=
                                              DadosMovimento[iLinha].DataConciliacao;
         FcdsMovimFinanc.FieldByName('ENTRADASAIDA').AsString:=DadosMovimento[iLinha].EntradaSaida;
         FcdsMovimFinanc.FieldByName('HISTORICO').AsString:=DadosMovimento[iLinha].Historico;
         FcdsMovimFinanc.FieldByName('STATUSCONCILIA').AsString:=DadosMovimento[iLinha].StatusConcilia;
         FcdsMovimFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat:=
                                              DadosMovimento[iLinha].ValorOutraMoeda;
         FcdsMovimFinanc.FieldByName('IDPESSOA').AsFloat:=DadosMovimento[iLinha].IDPessoa;
         FcdsMovimFinanc.FieldByName('CODLANCTRANSF').AsFloat:=DadosMovimento[iLinha].CodLancTransf;
         FcdsMovimFinanc.FieldByName('LOTETRANSMISSAO').AsFloat:=
                                              DadosMovimento[iLinha].LoteTransmissao;
         FcdsMovimFinanc.FieldByName('DATADISPFINANC').AsDateTime:=
                                              DadosMovimento[iLinha].DataDispFinanc;
         FcdsMovimFinanc.Post;
      end;

      //Carrega cds de Rateio
      for iLinha:=1 to iNumTermosMF do
      begin
         FCdsRateioFinanc.Append;
         FCdsRateioFinanc.FieldByName('IDPESSOA').AsFloat:=DadosRateio[iLinha].IDPessoa;
         FCdsRateioFinanc.FieldByName('IDEMPRESA').AsFloat:=DadosRateio[iLinha].IDEmpresa;
         FCdsRateioFinanc.FieldByName('IDPROGRAMA').AsFloat:=DadosRateio[iLinha].IDPrograma;
         FCdsRateioFinanc.FieldByName('IDPLANOPREV').AsFloat:=DadosRateio[iLinha].IDPlanoPrev;
         FCdsRateioFinanc.FieldByName('IDRATEIOFINANC').AsFloat:=DadosRateio[iLinha].IDRateioFinanc;
         FCdsRateioFinanc.FieldByName('CODLANCFINANC').AsFloat:=DadosRateio[iLinha].CodLancFinanc;
         FCdsRateioFinanc.FieldByName('IDPATRO').AsFloat:=DadosRateio[iLinha].IDPatro;
         FCdsRateioFinanc.FieldByName('CODCENTROCUSTO').AsString:=DadosRateio[iLinha].CodCentroCusto;
         FCdsRateioFinanc.FieldByName('UNIDNEGOC').AsFloat:=DadosRateio[iLinha].UnidNegoc;
         FCdsRateioFinanc.FieldByName('CODTIPRECDES').AsString:=DadosRateio[iLinha].CodTipRecDes;
         FCdsRateioFinanc.FieldByName('RECPAG').AsString:=DadosRateio[iLinha].RecPag;
         FCdsRateioFinanc.FieldByName('CODCENTRORESPON').AsString:=DadosRateio[iLinha].CodCentroRespon;
         FCdsRateioFinanc.FieldByName('MOECODIGO').AsFloat:=DadosRateio[iLinha].MoeCodigo;
         FCdsRateioFinanc.FieldByName('VALOR').AsFloat:=DadosRateio[iLinha].Valor;
         FCdsRateioFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat:=DadosRateio[iLinha].ValorOutraMoeda;
         FCdsRateioFinanc.FieldByName('LOTETRANSMISSAO').AsFloat:=DadosRateio[iLinha].LoteTransmissao;
         FCdsRateioFinanc.FieldByName('CODTIPDOC').AsFloat:=DadosRateio[iLinha].CodTipDoc;
         FCdsRateioFinanc.Post;
      end;

      //Carrega cds Contabil
      for iLinha:=1 to iNumTermosCont do
      begin
         FCdsContabil.Append;
         FCdsContabil.FieldByName('PLNCODIGO').AsFloat:=DadosContabeis[iLinha].PlnCodigo;
         FCdsContabil.FieldByName('LACNUMLAN').AsFloat:=DadosContabeis[iLinha].LacNumLan;
         FCdsContabil.FieldByName('LACDEBCRE').AsString:=DadosContabeis[iLinha].LacDebCre;
         FCdsContabil.FieldByName('UNIDNEGOC').AsFloat:=DadosContabeis[iLinha].UnidNegoc;
         FCdsContabil.FieldByName('IDPLANOPREV').AsFloat:=DadosContabeis[iLinha].IDPlanoPrev;
         FCdsContabil.FieldByName('IDPATRO').AsFloat:=DadosContabeis[iLinha].IDPatro;
         FCdsContabil.FieldByName('IDELEMDEMONSTRAT').AsFloat:=DadosContabeis[iLinha].IDElemDemonstrat;
         FCdsContabil.FieldByName('HITCODHIST').AsString:=DadosContabeis[iLinha].HitCodHist;
         FCdsContabil.FieldByName('IDPESSOA').AsFloat:=DadosContabeis[iLinha].IDPessoa;
         FCdsContabil.FieldByName('IDEMPRESA').AsFloat:=DadosContabeis[iLinha].IDEmpresa;
         FCdsContabil.FieldByName('IDMODULO').AsFloat:=DadosContabeis[iLinha].IDModulo;
         FCdsContabil.FieldByName('IDUSUARIOINCLUSAO').AsFloat:=
                                           DadosContabeis[iLinha].IDUsuarioInclusao;
         FCdsContabil.FieldByName('CODCENTROCUSTO').AsString:=DadosContabeis[iLinha].CodCentroCusto;
         FCdsContabil.FieldByName('PLACONTA').AsString:=DadosContabeis[iLinha].PlaConta;
         FCdsContabil.FieldByName('PLANO').AsFloat:=DadosContabeis[iLinha].Plano;
         FCdsContabil.FieldByName('LACTIPO').AsString:=DadosContabeis[iLinha].LacTipo;
         FCdsContabil.FieldByName('LACNUMDOC').AsString:=DadosContabeis[iLinha].LacNumDoc;
         FCdsContabil.FieldByName('LACHIST1').AsString:=DadosContabeis[iLinha].LacHist1;
         FCdsContabil.FieldByName('LACHIST2').AsString:=DadosContabeis[iLinha].LacHist2;
         FCdsContabil.FieldByName('LACHIST3').AsString:=DadosContabeis[iLinha].LacHist3;
         FCdsContabil.FieldByName('LACHIST4').AsString:=DadosContabeis[iLinha].LacHist4;
         FCdsContabil.FieldByName('LACHIST5').AsString:=DadosContabeis[iLinha].LacHist5;
         FCdsContabil.FieldByName('LACVALOR').AsFloat:=DadosContabeis[iLinha].LacValor;
         FCdsContabil.FieldByName('LACTIPCONVOFICIAL').AsString:=
                                             DadosContabeis[iLinha].LacTipConvOficial;
         FCdsContabil.FieldByName('LACVALOFICIAL').AsString:=DadosContabeis[iLinha].LacValOficial;
         FCdsContabil.FieldByName('LACTIPCONVGER').AsString:=DadosContabeis[iLinha].LacTipConvGer;
         FCdsContabil.FieldByName('LACVALGERENCIAL').AsFloat:=DadosContabeis[iLinha].LacValGerencial;
         FCdsContabil.FieldByName('LACTIPCONVGEREN1').AsString:=
                                             DadosContabeis[iLinha].LacTipConvGeren1;
         FCdsContabil.FieldByName('LACVALGEREN1').AsFloat:=DadosContabeis[iLinha].LacValGeren1;
         FCdsContabil.FieldByName('LACTIPCONVGEREN2').AsString:=
                                             DadosContabeis[iLinha].LacTipConvGeren2;
         FCdsContabil.FieldByName('LACVALGEREN2').AsFloat:=DadosContabeis[iLinha].LacValGeren2;
         FCdsContabil.FieldByName('LACATOUTMOEDA').AsString:=DadosContabeis[iLinha].LacAtOutMoeda;
         FCdsContabil.FieldByName('LACORIGEMAPLIC').AsString:=DadosContabeis[iLinha].LacOrigemAplic;
         FCdsContabil.FieldByName('TIPCODIGO').AsString:=DadosContabeis[iLinha].TipCodigo;
         FCdsContabil.FieldByName('LACVALHIST').AsFloat:=DadosContabeis[iLinha].LacValHist;
         FCdsContabil.FieldByName('CODSUBCONTA').AsFloat:=DadosContabeis[iLinha].CodSubConta;
         FCdsContabil.FieldByName('LOTETRANSMISSAO').AsFloat:=DadosContabeis[iLinha].LoteTransmissao;
         FCdsContabil.Post;
      end;

      //Grava no Financeiro os cds em vez dos arrays
      Result:=GravaFinanceiro(bRegNaoIdent,Operacao,rIDPlano,bIntegraContabil,bCalcImposto);
   except
      on E:Exception do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;

function TCtrlMovimFinanc.ExcluiFinanceiro(rCodLancFinan: Double): Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result:=Connection.AppServer.ExcluiFinanceiro(rCodLancFinan,
                                                     F_rIDPessoa,
                                                     F_rIDModulo,
                                                     F_rIDUsuario,
                                                     F_bUsaPlanoPatro);
                                                     
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;
          //Exclui possíveis Impostos
          Result:=ExecSQL('DELETE IMPOSTORETIDO '+
                          'WHERE (CODLANCFINANC = '+FloatToStr(rCodLancFinan)+') ');

          if not(Result) then Exit;

          //Exclui Lançamento
          Result:=CtrlFinanc.ExcluiFinanceiro(rCodLancFinan);
          if not(Result) then
           begin
              MessageInfo:=CtrlFinanc.MessageInfo;
              Rollback;
           end
          else
           Commit;
       except
          on E:Exception do
          begin
             Result := False;
             Rollback;
             MessageInfo := E.Message;
          end;
       end;
    end;
end;

function TCtrlMovimFinanc.GeraImpostoRateio(var rImposto: Double): Boolean;
var
   rTotalImposto      : Double;
   rValorCheckBanco   : Double;
   sIntegraBackRecPag : String;
   cdsRateioFinancAux : TClientDataSet;
begin
   Result:=True;
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result:=Connection.AppServer.GeraImpostoRateio(rImposto,
                                                      F_rIDPessoa,
                                                      F_rIDModulo,
                                                      F_rIDUsuario,
                                                      F_bUsaPlanoPatro);

       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       cdsRateioFinancAux:=TCMClientDataSet.Create(nil);
       try
          try
             //=========== Início Imposto Retido ============================
             rTotalImposto:=0;
             if (FCdsMovimFinanc.FieldByName('ENTRADASAIDA').AsString='E') then
                sIntegraBackRecPag:='R'
             else
                sIntegraBackRecPag:='P';

             //Copia Dados do Movimento Financeiro
             cdsRateioFinancAux.Data:=FCdsRateioFinanc.Data;

             StartTransaction;
             //Cálculo e Lançamento das linhas de Imposto
             cdsRateioFinancAux.First;
             while not(cdsRateioFinancAux.Eof) do
             begin
                CtrlImpostoRetido.DataProgramada:=
                                  FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime;
                CtrlImpostoRetido.OperacaoDocumento:='2 ';
                CtrlImpostoRetido.IdForCli:=0;
                CtrlImpostoRetido.CodDocumento:=0;
                CtrlImpostoRetido.NumLancto:=0;
                CtrlImpostoRetido.ValorLancto:=cdsRateioFinancAux.FieldByName('VALOR').AsFloat;
                CtrlImpostoRetido.ValorLiquido:=cdsRateioFinancAux.FieldByName('VALOR').AsFloat;
                CtrlImpostoRetido.DataLancto:=FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime;
                CtrlImpostoRetido.DataEmissao:=FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime;

                if (sIntegraBackRecPag='R') then
                 begin
                    if (FCdsRateioFinanc.FieldByName('RECPAG').AsString='R') then
                       CtrlImpostoRetido.DebCre:='D'
                    else
                       CtrlImpostoRetido.DebCre:='C';
                 end
                else
                 begin
                    if (cdsRateioFinancAux.FieldByName('RECPAG').AsString='D') then
                       CtrlImpostoRetido.DebCre:='C'
                    else
                       CtrlImpostoRetido.DebCre:='D';
                 end;

                CtrlImpostoRetido.RecPag:=FCdsRateioFinanc.FieldByName('RECPAG').AsString[1];
                CtrlImpostoRetido.IdEmpresa:=Trunc(F_rIDPessoa);
                CtrlImpostoRetido.CodTipRecDes:=FCdsRateioFinanc.FieldByName('CODTIPRECDES').AsString;
                CtrlImpostoRetido.MomentoLancamento:=mlLancamento;
                CtrlImpostoRetido.CodTipoDoc:=Trunc(rTipoDoc);
                CtrlImpostoRetido.Incluir;

                if not(CtrlImpostoRetido.CdsSimulacao.IsEmpty) then
                 begin
                    CtrlImpostoRetido.CdsSimulacao.First;
                    while not(CtrlImpostoRetido.CdsSimulacao.Eof) do
                    begin
                       with TCMClientDataSet.Create(nil) do
                       try
                          Data:=GetDataPacket('SELECT CODTIPRECDES, RECPAG '+
                                              'FROM TIPOAGRE '+
                                              'WHERE (CODTIPRECDES IS NOT NULL) AND '+
                                              '      (CODTIPOCUSTAGREG = '+
                            IntToStr(CtrlImpostoRetido.CdsSimulacao.FieldByName('IDIMPOSTO').AsInteger)+')');

                          if not(IsEmpty) then
                           begin
                              //Limpa qryContabil
                              FCdsContabil.EmptyDataSet;
                              rTotalImposto:=rTotalImposto+
                                    CtrlImpostoRetido.CdsSimulacao.FieldByName('VALORIMPOSTO').AsFloat;

                              FCdsRateioFinanc.Append;
                              FCdsRateioFinanc.FieldByName('IDPESSOA').AsFloat:=
                                  cdsRateioFinancAux.FieldByName('IDPESSOA').AsFloat;
                              FCdsRateioFinanc.FieldByName('UNIDNEGOC').AsFloat:=
                                  cdsRateioFinancAux.FieldByName('UNIDNEGOC').AsFloat;
                              FCdsRateioFinanc.FieldByName('CODTIPRECDES').AsString:=
                                  FieldByName('CODTIPRECDES').AsString;
                              FCdsRateioFinanc.FieldByName('RECPAG').AsString:=
                                  FieldByName('RECPAG').AsString;
                              FCdsRateioFinanc.FieldByName('CODCENTRORESPON').AsString:=
                                  cdsRateioFinancAux.FieldByName('CODCENTRORESPON').AsString;
                              FCdsRateioFinanc.FieldByName('VALOR').AsFloat:=
                                  CtrlImpostoRetido.CdsSimulacao.FieldByName('VALORIMPOSTO').AsFloat;
                              FCdsRateioFinanc.FieldByName('CODCENTROCUSTO').AsString:=
                                  cdsRateioFinancAux.FieldByName('CODCENTROCUSTO').AsString;
                              FCdsRateioFinanc.FieldByName('IDEMPRESA').AsFloat:=
                                  cdsRateioFinancAux.FieldByName('IDEMPRESA').AsFloat;
                              FCdsRateioFinanc.FieldByName('IDPATRO').AsFloat:=
                                  cdsRateioFinancAux.FieldByName('IDPATRO').AsFloat;
                              FCdsRateioFinanc.FieldByName('IDPROGRAMA').AsFloat:=
                                  cdsRateioFinancAux.FieldByName('IDPROGRAMA').AsFloat;
                              FCdsRateioFinanc.FieldByName('IDPLANOPREV').AsFloat:=
                                  cdsRateioFinancAux.FieldByName('IDPLANOPREV').AsFloat;
                              FCdsRateioFinanc.FieldByName('CODTIPDOC').AsFloat:=
                                  cdsRateioFinancAux.FieldByName('CODTIPDOC').AsFloat;
                              FCdsRateioFinanc.Post;
                           end;
                       finally
                          Free;
                       end;
                       CtrlImpostoRetido.CdsSimulacao.Next;
                    end;
                 end;
                cdsRateioFinancAux.Next;
             end;
            Commit;
            rImposto:=rTotalImposto;
            //=========== Final Imposto Retido ============================
          finally
             cdsRateioFinancAux.Free;
          end;
       except
          on E:Exception do
          begin
             Result := False;
             MessageInfo := E.Message;
          end;
       end;
    end;
end;

function TCtrlMovimFinanc.VerificaRateio: Boolean;
var
   rTotalRateioOM : Double;
   rTotalRateio   : Double;
begin
   Result:=True;
   rTotalRateio:=0;
   rTotalRateioOM:=0;
   MessageInfo:='';
   FCdsRateioFinanc.First;
   while not(FCdsRateioFinanc.Eof) do
   begin
      if ((FCdsRateioFinanc.FieldByName('RECPAG').AsString='R') and
          (FCdsMovimFinanc.FieldByName('ENTRADASAIDA').AsString='E')) or
          ((FCdsRateioFinanc.FieldByName('RECPAG').AsString='P') and
          (FCdsMovimFinanc.FieldByName('ENTRADASAIDA').AsString='S')) then
       begin
          rTotalRateio:=rTotalRateio+FCdsRateioFinanc.FieldByName('VALOR').AsFloat;
          rTotalRateioOM:=rTotalRateioOM+FCdsRateioFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat;
       end
      else
       begin
          rTotalRateio:=rTotalRateio-FCdsRateioFinanc.FieldByName('VALOR').AsFloat;
          rTotalRateioOM:=rTotalRateioOM-FCdsRateioFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat;
       end;
      FCdsRateioFinanc.Next;
   end;

   if (FormatFloat('#,##0.00',rTotalRateio)<>
       FormatFloat('#,##0.00',FCdsMovimFinanc.FieldByName('VALORLANCFINAN').AsFloat)) then
    begin
       Result:=False;
       MessageInfo:='Total do Rateio não bate com o Valor do Lançamento';
       Exit;
    end;

   if (FormatFloat('#,##0.00',rTotalRateioOM)<>
       FormatFloat('#,##0.00',FCdsMovimFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat)) then
    begin
       Result:=False;
       MessageInfo:='Total do Rateio em outra moeda não bate com o '+
                    'Valor do Lançamento em outra moeda';
       Exit;
    end;
end;

function TCtrlMovimFinanc.GeraContabilizacao(sContaBanco, sCCustoBanco: String;
                                             rSubContaBanco: Double;
                                             sContaNI, sCCustoNI: String;
                                             rSubContaNI: Double;
                                             bRegNaoIdent: Boolean;
                                             rIDPlano: Double): Boolean;
var
   RegContabil : TContabil;
begin
   Result:=True;
   MessageInfo:='';
   try
      FcdsContabil.First;
      if (FcdsContabil.IsEmpty) and (FCdsMovimFinanc.FieldByName('CODPORTADOR').asFloat<>0) then
       begin
          FCdsRateioFinanc.First;
          while not(FCdsRateioFinanc.Eof) do
          begin
             RegContabil.PlaConta:=sContaBanco;
             RegContabil.CodCentroCusto:=sCCustoBanco;
             RegContabil.DescUnidNeg:=FCdsRateioFinanc.FieldByName('DESCUNIDNEG').AsString;
             RegContabil.UnidNegoc:=FCdsRateioFinanc.FieldByName('UNIDNEGOC').AsFloat;
             RegContabil.CodSubConta:=rSubContaBanco;
             RegContabil.LacValor:=FCdsRateioFinanc.FieldByName('VALOR').AsFloat;
             RegContabil.LacValHist:=FCdsRateioFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat;
             RegContabil.IDPatro:=FCdsRateioFinanc.FieldByName('IDPATRO').AsFloat;
             RegContabil.IDPlanoPrev:=FCdsRateioFinanc.FieldByName('IDPLANOPREV').AsFloat;
             RegContabil.LacNumDoc:=FCdsMovimFinanc.FieldByName('NUMCHQBORDERO').AsString;

             //Distribui o Histórico pelas 5 linhas disponíveis
             GeralFinanc.ArrumaHistorico((FCdsMovimFinanc.FieldByName('HISTORICO').AsString+' - '+
                                         FCdsMovimFinanc.FieldByName('DESCPORTADOR').AsString),
                                         RegContabil.LacHist1,RegContabil.LacHist2,
                                         RegContabil.LacHist3,RegContabil.LacHist4,
                                         RegContabil.LacHist5);

             if (FCdsMovimFinanc.FieldByName('ENTRADASAIDA').AsString='S') then
              begin
                 RegContabil.LacDebCre:='C';
                 RegContabil.LacTipo:='1';

                 if (FCdsRateioFinanc.FieldByName('RECPAG').AsString='R') then
                  begin
                     RegContabil.LacValor:= -RegContabil.LacValor;
                     RegContabil.LacValHist:= -RegContabil.LacValHist;
                  end;
              end
             else
              begin
                 RegContabil.LacDebCre:='D';
                 RegContabil.LacTipo:='0';

                 if (FCdsRateioFinanc.FieldByName('RECPAG').AsString='P') then
                  begin
                     RegContabil.LacValor:= -RegContabil.LacValor;
                     RegContabil.LacValHist:= -RegContabil.LacValHist;
                  end;
              end;

             //Gera Linha Contabil
             Result:=GeraRegistroContabil(RegContabil,rIDPlano);
             if not(Result) then Exit;

             if (FCdsMovimFinanc.FieldByName('STATUSCONCILIA').AsString='I') and
                not(bRegNaoIdent) then
              begin
                 RegContabil.PlaConta:=sContaNI;
                 RegContabil.CodCentroCusto:=sCCustoNI;
                 RegContabil.CodSubConta:=rSubContaNI;
                 RegContabil.LacValor:=FCdsRateioFinanc.FieldByName('VALOR').AsFloat;
                 RegContabil.LacValHist:=FCdsRateioFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat;

                 if (FCdsMovimFinanc.FieldByName('ENTRADASAIDA').AsString='S') then
                  begin
                     RegContabil.LacDebCre:='D';
                     RegContabil.LacTipo:='0';
                  end
                 else
                  begin
                     RegContabil.LacDebCre:='C';
                     RegContabil.LacTipo:='1';
                  end;

                 //Gera Linha Contabil
                 Result:=GeraRegistroContabil(RegContabil,rIDPlano);
                 if not(Result) then Exit;
              end
             else
              begin
                 RegContabil.CodCentroCusto:=FCdsRateioFinanc.FieldByName('CODCENTROCUSTO').AsString;
                 RegContabil.DescUnidNeg:=FCdsRateioFinanc.FieldByName('DESCUNIDNEG').AsString;

                 RegContabil.PlaConta:=CtrlLancamento.BuscaContaContabil(Trunc(F_rIDPessoa),
                                           FCdsRateioFinanc.FieldByName('IDPROGRAMA').AsInteger,
                                           FCdsRateioFinanc.FieldByName('CODTIPRECDES').AsString,
                                           FCdsRateioFinanc.FieldByName('CODCENTROCUSTO').AsString,
                                           FCdsRateioFinanc.FieldByName('RECPAG').AsString);

                 RegContabil.UnidNegoc:=FCdsRateioFinanc.FieldByName('UNIDNEGOC').AsFloat;
                 RegContabil.CodSubConta:=0;
                 RegContabil.LacValor:=FCdsRateioFinanc.FieldByName('VALOR').AsFloat;
                 RegContabil.LacValHist:=FCdsRateioFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat;

                 if (FCdsRateioFinanc.FieldByName('RECPAG').AsString='R') then
                  begin
                     RegContabil.LacDebCre:='C';
                     RegContabil.LacTipo:='1';
                  end
                 else
                  begin
                     RegContabil.LacDebCre:='D';
                     RegContabil.LacTipo:='0';
                  end;

                 //Gera Linha Contabil
                 Result:=GeraRegistroContabil(RegContabil,rIDPlano);
                 if not(Result) then Exit;
              end;
             FCdsRateioFinanc.Next;
          end;
       end;
   except
      on E:Exception do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;

function TCtrlMovimFinanc.GeraRegistroContabil(RegContabil: TContabil; rIDPlano: Double): Boolean;
var
   sDescContaAux    : String;
   sSubContaAux     : String;
   bObrigaCCustoAux : Boolean;
   cdsAux           : TCMClientDataSet;
   sDescCCustoAux   : String;
begin
   Result:=True;
   MessageInfo:='';
   try
      if (RegContabil.PlaConta='') then Exit;

      FCdsContabil.First;
      if FCdsContabil.Locate('PLACONTA;CODCENTROCUSTO;UNIDNEGOC;CODSUBCONTA;LACDEBCRE;LACTIPO',
                             VarArrayOf([RegContabil.PlaConta,
                                         RegContabil.CodCentroCusto,
                                         RegContabil.UnidNegoc,
                                         RegContabil.CodSubConta,
                                         RegContabil.LacDebCre,
                                         RegContabil.LacTipo]),[loCaseInsensitive]) then
       begin
          FCdsContabil.Edit;
          FCdsContabil.FieldByName('LACVALOR').AsFloat:=
                       FCdsContabil.FieldByName('LACVALOR').AsFloat+RegContabil.LacValor;
          FCdsContabil.FieldByName('LACVALHIST').AsFloat:=
                       FCdsContabil.FieldByName('LACVALHIST').AsFloat+RegContabil.LacValHist;
          FCdsContabil.Post;
          if (FCdsContabil.FieldByName('LACVALOR').AsFloat=0) then FCdsContabil.Delete;
       end
      else
       begin
          Result:=GeralFinanc.BuscaDadosConta(RegContabil.PlaConta,rIDPlano,False,
                                              sDescContaAux,sSubContaAux,bObrigaCCustoAux);
          if not(Result) then
           begin
              MessageInfo:=GeralFinanc.MessageInfo;
              Exit;
           end;

          //Testa Centro de Custo
          sDescCCustoAux:='';
          if (RegContabil.CodCentroCusto<>'') then
           begin
              cdsAux:=TCMClientDataSet.Create(nil);
              try
                 cdsAux.Data:=GetDataPacket('SELECT NOME FROM CENTCUST '+
                                            'WHERE (CODCENTROCUSTO  = '''+RegContabil.CodCentroCusto+''') AND '+
                                            '      (IDEMPRESA = '+FloatToStr(F_rIDPessoa)+') AND '+
                                            '      ((ATIVO = ''S'') OR (ATIVO IS NULL)) ');
                 if cdsAux.IsEmpty then
                  begin
                     Result:=False;
                     MessageInfo:='Centro de Custo '+RegContabil.CodCentroCusto+' Não Cadastrado. Verifique.';
                     Exit;
                  end;
                 sDescCCustoAux:=cdsAux.FieldByName('NOME').AsString;
              finally
                 cdsAux.Free;
              end;
           end;

          FCdsContabil.Append;
          FCdsContabil.FieldByName('PLACONTA').AsString:=RegContabil.PlaConta;
          FCdsContabil.FieldByName('PLANO').AsFloat:=rIDPlano;
          FCdsContabil.FieldByName('CODCENTROCUSTO').AsString:=RegContabil.CodCentroCusto;
          FCdsContabil.FieldByName('DESCCCUSTO').AsString:=sDescCCustoAux;
          FCdsContabil.FieldByName('DESCPLANO').AsString:=sDescContaAux;
          FCdsContabil.FieldByName('UNIDNEGOC').AsFloat:=RegContabil.UnidNegoc;
          FCdsContabil.FieldByName('DESCUNIDNEG').AsString:=RegContabil.DescUnidNeg;
          FCdsContabil.FieldByName('LACVALOR').AsFloat:=RegContabil.LacValor;
          FCdsContabil.FieldByName('LACVALHIST').AsFloat:=RegContabil.LacValHist;
          FCdsContabil.FieldByName('LACHIST1').AsString:=RegContabil.LacHist1;
          FCdsContabil.FieldByName('LACHIST2').AsString:=RegContabil.LacHist2;
          FCdsContabil.FieldByName('LACHIST3').AsString:=RegContabil.LacHist3;
          FCdsContabil.FieldByName('LACHIST4').AsString:=RegContabil.LacHist4;
          FCdsContabil.FieldByName('LACHIST5').AsString:=RegContabil.LacHist5;
          FCdsContabil.FieldByName('LACNUMDOC').AsString:=RegContabil.LacNumDoc;
          FCdsContabil.FieldByName('LACDEBCRE').AsString:=RegContabil.LacDebCre;
          FCdsContabil.FieldByName('LACTIPO').AsString:=RegContabil.LacTipo;
          FCdsContabil.FieldByName('IDPATRO').AsFloat:=RegContabil.IDPatro;
          FCdsContabil.FieldByName('IDPLANOPREV').AsFloat:=RegContabil.IDPlanoPrev;

          if (RegContabil.CodSubConta<>0) then
             FCdsContabil.FieldByName('CODSUBCONTA').AsFloat:=RegContabil.CodSubConta;
          FCdsContabil.Post;
       end;
   except
      on E:Exception do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;

function TCtrlMovimFinanc.VerificaContabilizacao(rIDPlano: Double;sContaBanco: String;
                                                 rSubContaBanco: Double): Boolean;
var
   rValorCheckBanco  : Double;
   rValorCheckContab : Double;
   rTotalContab      : Double;
   rValorBanco       : Double;
   sDescContaAux     : String;
   sSubContaAux      : String;
   bObrigaCCustoAux  : Boolean;
   cdsAux            : TCMClientDataSet;
begin
   Result:=True;
   MessageInfo:='';
   rValorCheckContab:=0;
   cdsAux:=TCMClientDataSet.Create(nil);
   try
      try
         if FCdsMovimFinanc.FieldByName('ENTRADASAIDA').AsString = 'S' then
            rValorCheckBanco:= -FCdsMovimFinanc.FieldByName('VALORLANCFINAN').AsFloat
         else
            rValorCheckBanco:=  FCdsMovimFinanc.FieldByName('VALORLANCFINAN').AsFloat;
         rTotalContab := 0;
         rValorBanco  := 0;
         FCdsContabil.First;
          while not(FCdsContabil.Eof) do
          begin
             if (FCdsContabil.FieldByName('LACDEBCRE').IsNull) or
                (FCdsContabil.FieldByName('PLACONTA').IsNull) or
                (FCdsContabil.FieldByName('UNIDNEGOC').IsNull) or
                (FCdsContabil.FieldByName('LACVALOR').AsFloat=0) then
             begin
                 Result:=False;
                 MessageInfo:='Faltam alguns dados para completar a Contabilização. Verifique';
                 Exit;
             end;

             Result:=GeralFinanc.BuscaDadosConta(FcdsContabil.FieldByName('PLACONTA').AsString,
                                                 FcdsContabil.FieldByName('PLANO').AsFloat,
                                                 False,sDescContaAux,sSubContaAux,bObrigaCCustoAux);
             if not(Result) then
              begin
                 MessageInfo:=GeralFinanc.MessageInfo;
                 Exit;
              end;

             if sDescContaAux='' then Exit;

             //Crítica de falta de Centro de Custo de Contas que o Obrigam
             if (bObrigaCCustoAux) and (FCdsContabil.FieldByName('CODCENTROCUSTO').isNull) then
              begin
                 cdsAux.Data:=CtrlListTerceiros.ListCentroCustoxConta(F_rIDPessoa,rIDPlano,
                                                FCdsContabil.FieldByName('PLACONTA').AsString);

                 if not(cdsAux.IsEmpty) and (cdsAux.RecordCount=1) then
                  begin
                     FCdsContabil.Edit;
                     FCdsContabil.FieldByName('CODCENTROCUSTO').AsString:=
                                         cdsAux.FieldByName('CODCENTROCUSTO').AsString;
                     FCdsContabil.Post;
                 end
                else
                 begin
                    Result:=False;
                    MessageInfo:='Obrigatório preencher o Centro de Custo da Conta '+
                                 FcdsContabil.FieldByName('PLACONTA').AsString;
                    Exit;
                 end;
             end;

            if (FcdsContabil.FieldByName('LACDEBCRE').AsString='D') then
               rTotalContab:=rTotalContab+FcdsContabil.FieldByName('LACVALOR').AsFloat
            else
               rTotalContab:=rTotalContab-FcdsContabil.FieldByName('LACVALOR').AsFloat;

            if (FcdsContabil.FieldByName('PLACONTA').AsString=sContaBanco) and
               (FcdsContabil.FieldByName('CODSUBCONTA').AsFloat=rSubContaBanco) then
             begin
                if (FcdsContabil.FieldByName('LACDEBCRE').AsString='D') then
                   rValorBanco:=rValorBanco+FcdsContabil.FieldByName('LACVALOR').AsFloat
                else
                   rValorBanco:=rValorBanco-FcdsContabil.FieldByName('LACVALOR').AsFloat;
             end;
            FcdsContabil.Next;
         end;

        if FormatFloat('#,##0.00',rTotalContab)<>FormatFloat('#,##0.00',rValorCheckContab) then
         begin
            Result:=False;
            MessageInfo:='Total do Débito não bate com o Total do Crédito na Contabilização. Verifique';
            Exit;
         end;

        if FormatFloat('#,##0.00',rValorBanco)<>FormatFloat('#,##0.00',rValorCheckBanco) then
         begin
            Result:=False;
            MessageInfo:='O valor contabilizado na conta do banco deve ser igual ao valor do '+
                         'lançamento. Verifique';
            Exit;
          end;
      finally
         cdsAux.Free;
      end;
   except
      on E:Exception do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;

end.
