{*******************************************************************************
  Rotina: uCtrlMovimFinanc.pas
 *******************************************************************************}
{---------------------------------------------------------------------------------------------------
Rotina    : Divs
Data      : 28/10/2004
Autor     : Alex Pereira
pendência : 17193
Descrição : Segregação de recursos - Implementar a segregação de recursos na origem

Metodo    : Criar a estrutura IDSEGREGACRITER na tabela RATEIOFINANC.
            Finalidade: Ratear na origem o movimento financeiro.

---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : GravaFinanceiro
Data      : 22/07/2004
Autor     : Fabio Fagundes
Descrição : Implementacao da CtrlFinanc.GravaCodLancTranf para gravar o CODLANCTRANSF = CODLANCFINANC
            qdo o lancamento for de Transferencia entre Planos
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Rotina    : Diversas, GeraContabilizacao
Data      : 29/01/2004
Autor     : Alex Pereira
Pendência : 14451 - Nova segregação de recursos
Descrição : Preparar objeto para acatar nova estrutura contábil IDSEGREGACRITER
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Rotina    : Diversas, GeraContabilizacao
Data      : 29/01/2004
Autor     : Alex Pereira
Pendência : 14451 - Nova segregação de recursos
Descrição : Preparar objeto para acatar nova estrutura contábil IDSEGREGACRITER
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ListRateioFinanc
Data      : 23/12/2003
Autor     : André Tavares
Descrição : pendência 14391: Alteração da query - trocquei a tablela planprev por planprevcontábil.
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Rotina    : function TCtrlMovimFinanc.MudaStatus
Data      : 11/08/2003
Autor     : Fabio Fagundes
Descrição : Criação da função AlteraDispFinancDocBaixado para alterar a Data de Disponibilidade para
            Documento à Receber já baixados.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ListRateioFinanc
Data      : 15/08/2003
Autor     : André Pontes
Pendencia : 14391
Descrição : Incluídos campos de Plano, Patro e Programa, com respectivos joins
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : function TCtrlMovimFinanc.MudaStatus
Data      : 28/08/2003
Autor     : Fabio Fagundes
Descrição : Incluido o campo dDataDisp para Gravação
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Diversos
Data      : 07/10/2003
Autor     : Alex Pereira
Pendência : 14818
Descrição : Incorporados os fontes do Beraldo devido a erros no conceituais.
            Instruido por Rosane, exitiam problemas na troca do status do campo
            MOVIMFINANC.STATUSCONCILIA
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotinas   : GeraRegistroContabil, GeraContabilizacao 
Data      : 29/04/2004 (Término)
Autor     : David Ayrolla
Pendência : 16350
Descrição : Fazer créditos distintos para partidas dobradas.
---------------------------------------------------------------------------------------------------}

unit uCtrlMovimFinanc;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uDbMovimFinanc, uCtrlFinanc, uGeralFinanc, uCtrlListTercFinanc, uCMClientDataSet,
     uCtrlLancamento, uCtrlParamIntegra, uDbImpostoRetido , uCtrlImpostoRetido,
     uCtrlPadroes, uCMTypes,
     // 29/01/04 Alex 14451
     uCtrlSegregacao;

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
                  // 29/01/04 Alex 14451
                  IdSegregaCriter   : Integer;
                  DescPatro         : String;
                  DescPlanPrev      : String;
                  DescSegregaCriter : String;
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
      CtrlPadroes        : TCtrlPadroes;
      CtrlParamIntegra   : TCtrlParamIntegra;
      GeralFinanc        : TGeralFinanc;
      // 29/01/04 Alex 14451
      CtrlSegregacao     : TCtrlSegregacao;

      F_rIDPessoa      : Double;
      F_rIDModulo      : Double;
      F_rIDUsuario     : Double;
      F_bUsaPlanoPatro : Boolean;
      rTipoDoc         : Double;
   public
      property CdsMovimFinanc  : TCMClientDataSet read FCdsMovimFinanc  write FCdsMovimFinanc;
      property CdsRateioFinanc : TCMClientDataSet read FCdsRateioFinanc write FCdsRateioFinanc;
      property CdsContabil     : TCMClientDataSet read FCdsContabil     write FCdsContabil;

      property IDPessoa: Double read F_rIDPessoa write F_rIDPessoa;
      property IDModulo: Double read F_rIDModulo write F_rIDModulo;
      property IDUsuario: Double read F_rIDUsuario write F_rIDUsuario;
      property UsaPlanoPatro: Boolean read F_bUsaPlanoPatro write F_bUsaPlanoPatro;

      constructor Create(rIDPessoa,rIDModulo,rIDUsuario: Double; bUsaPlanoPatro: Boolean); reintroduce;
      destructor Destroy; override;

      procedure PreparaCtrl;

      procedure OnCreateAppServer; override;

      function EstornoFinanceiro(dDataEstorno, dDataDisp: TDateTime ; bRegNaoIdent: Boolean;
                                var rCodLancFinan: Double; rIDPlano: Double;
                                bIntegraContabil: Boolean): Boolean;


      function GravaFinanceiro(bRegNaoIdent: Boolean; Operacao: TOperacaoFinanc;
                               rIDPlano: Double;
                               bIntegraContabil,bCalcImposto: Boolean): Boolean; { 29/01/04 Alex  overload;}


      function ExcluiFinanceiro(rCodLancFinan: Double): Boolean;

      function GeraImpostoRateio(var rImposto: Double): Boolean;
      function VerificaRateio: Boolean;
      function GeraContabilizacao(sContaBanco, sCCustoBanco: String; rSubContaBanco: Double;
                                  sContaNI, sCCustoNI: String;rSubContaNI: Double;
                                  bRegNaoIdent: Boolean; rIDPlano: Double): Boolean;

      function GeraRegistroContabil(RegContabil: TContabil; rIDPlano: Double;
                                    //DAVID - Pendência 16350
                                    //Parâmetro que indica se há partida dobrada ou não.
                                    bPartidaDobrada : Boolean ): Boolean;

      function VerificaContabilizacao(rIDPlano: Double; sContaBanco: String;
                                      rSubContaBanco: Double): Boolean;
      function MudaStatus(rCodLancFinanc: Double; sStatus: String;
                          dDataConc,dDataDisp: TDateTime): OleVariant;

      function ListMovimFinanc(rCodLancFinanc: Double): OleVariant;

      function ListMovimFinancConciliacao(const rCodPortador, rIDPessoa: Double): OleVariant;

      function ListRateioFinanc(rCodLancFinanc: Double): OleVariant;

      function ListContabil(rCodLancContabil: Double): OleVariant;
      // 07/10/03 - by Alex - Pend 14818 - Incorporando fontes beraldo
      function TestaRegularizado(rCodLancFinanc: Double): Boolean;

      function AlteraDispFinancDocBaixado(sEntradaSaida:string;iCodLancFinanc: integer; dDataDisp:TDateTime): boolean;

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
   CtrlPadroes:=TCtrlPadroes.Create;
   CtrlParamIntegra:=TCtrlParamIntegra.Create;

   GeralFinanc:=TGeralFinanc.Create;
   FDbImpostoRetido:=TDbImpostoRetido.Create(Self);
   // 29/01/04 Alex 14451
   CtrlSegregacao := TCtrlSegregacao.Create;
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
   CtrlPadroes.Free;
   CtrlParamIntegra.Free;
   FDbImpostoRetido.Free;
   GeralFinanc.Free;
   // 23/01/04 Alex 14451
   CtrlSegregacao.Free;
   inherited;
end;

procedure TCtrlMovimFinanc.DoChangeDataBase;
begin
   inherited;
   FDbImpostoRetido.DataBaseName:=DataBaseName;
end;

procedure TCtrlMovimFinanc.AfterInitialize;
var _Cdsaux: TClientDataSet;
begin
   inherited;
   CtrlFinanc.InitializeAs(Self);
   CtrlLancamento.InitializeAs(Self);
   CtrlImpostoRetido.InitializeAs(Self);
   CtrlPadroes.InitializeAs(Self);
   CtrlParamIntegra.InitializeAs(Self);
   GeralFinanc.InitializeAs(Self);

   CtrlFinanc.OpenTransaction:=False;
   CtrlLancamento.OpenTransaction:=False;
   CtrlImpostoRetido.OpenTransaction:=False;
   CtrlPadroes.OpenTransaction:=False;
   GeralFinanc.OpenTransaction:=False;
   if (F_rIDPessoa<>0) then PreparaCtrl; //Não executará para cnsServer

   // 29/01/04 Alex 14451  - se na criação esqecer de instanciar a empresa
   CtrlSegregacao.InitializeAs(self);
   if F_rIDPessoa = 0 then begin
     try
       _Cdsaux := TClientDataSet.Create(nil);
       _Cdsaux.Data := GetDataPacket('SELECT IDPESSOA FROM EMPRESAPROP');
       F_rIDPessoa := _Cdsaux.FieldByName('IDPESSOA').AsInteger;
     finally
       _Cdsaux.Free
     end;
   end;
   CtrlSegregacao.GetParams(trunc(F_rIDPessoa));
   // fim 29/01/04 Alex 14451  - se na criação esqecer de instanciar a empresa
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

   CtrlParamIntegra.GetParams(Trunc(F_rIDPessoa), 0, 'INTEGRACONTAB', 'PARAMFINANC', tiSistema);
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



function TCtrlMovimFinanc.ListMovimFinancConciliacao(const rCodPortador, rIDPessoa: Double): OleVariant;
begin
   Result :=
   GetDataPacket(
   'SELECT * '                                                       +
   'FROM '                                                           +
   '   MOVIMFINANC '                                                 +
   'WHERE '                                                          +
   '   ( CODPORTADOR        = ' + FloatToStr(rCodPortador) + ' ) '   +
   '   AND ( IDPESSOA       = ' + FloatToStr(rIDPessoa) + ' ) '      +
   '   AND ( STATUSCONCILIA = ''N'' OR STATUSCONCILIA = ''P'' ) '    +
   'ORDER BY '                                                       +
   '   DATALANCFINAN, NUMCHQBORDERO '
   );
end;



function TCtrlMovimFinanc.ListRateioFinanc(rCodLancFinanc: Double): OleVariant;
begin
   Result:=GetDataPacket('SELECT '                                                              + #13 +
                         '   R.*, '                                                             + #13 +
                         '   U.NOME AS DESCUNIDNEG, '                                           + #13 +
                         '   C.NOME AS DESCCRESPON, '                                           + #13 +
                         '   T.DESCRICAO, '                                                     + #13 +
                         // André Pontes - 15/08/2003 - pendência 14391
                         '   PRG.CODPROGRAMA, PRG.DESCPROGRAMA, '                               + #13 +
                         // início André Tavares - 23/12/2003 - pendência 14391 - tem que ser planprevcontábil
                         //'   PTR.NOME AS NOME_PATRO, PLP.NOME AS NOME_PLANO, '                  + #13 +
                         '   PTR.NOME AS NOME_PATRO, PLC.NOME AS NOME_PLANO, '                  + #13 +
                         // fim André Tavares - 23/12/2003 - pendência 14391
                         // FIM André Pontes - 15/08/2003 - pendência 14391
                         '   I.MOESIGLA '                                                       + #13 +
                         'FROM '                                                                + #13 +
                         '   RATEIOFINANC    R, '                                               + #13 +
                         '   UNIDNEGOCIO     U, '                                               + #13 +
                         '   CENTRESPON      C, '                                               + #13 +
                         '   TIPORECEBDESEMB T, '                                               + #13 +
                         // André Pontes - 15/08/2003 - pendência 14391
                         '   PESSOA          PTR, '                                             + #13 +
                         // início André Tavares - 23/12/2003 - pendência 14391 - tem que ser planprevcontábil
                         //'   PLANPREV        PLP, '                                             + #13 +
                         '   PLANPREVCONTABIL        PLC, '                                             + #13 +
                         // fim André Tavares - 23/12/2003 - pendência 14391
                         '   PROGRAMA        PRG, '                                             + #13 +
                         // FIM André Pontes - 15/08/2003 - pendência 14391
                         '   MOEDA           I '                                                + #13 +
                         'WHERE '                                                               + #13 +
                         '       ( R.CODLANCFINANC   = ' + FloatToStr(rCodLancFinanc)+ ' ) '    + #13 +
                         '   AND ( R.CODTIPRECDES    = T.CODTIPRECDES ) '                       + #13 +
                         '   AND ( R.RECPAG          = T.RECPAG ) '                             + #13 +
                         '   AND ( R.IDPESSOA        = T.IDPESSOA ) '                           + #13 +
                         '   AND ( R.UNIDNEGOC       = U.UNIDNEGOC ) '                          + #13 +
                         '   AND ( R.IDPESSOA        = U.IDPESSOA ) '                           + #13 +
                         '   AND ( R.MOECODIGO       = I.MOECODIGO(+) ) '                       + #13 +
                         '   AND ( R.CODCENTRORESPON = C.CODCENTRORESPON ) '                    + #13 +
                         // André Pontes - 15/08/2003 - pendência 14391
                         '   AND ( R.IDPROGRAMA      = PRG.IDPROGRAMA(+) ) '                    + #13 +
                         // início André Tavares - 23/12/2003 - pendência 14391 - tem que ser planprevcontábil
                         //'   AND ( R.IDPLANOPREV     = PLP.IDPLANOPREV(+) ) '                   + #13 +
                         '   AND ( R.IDPLANOPREV     = PLC.IDPLANOPREV(+) ) '                   + #13 +
                         // fim André Tavares - 23/12/2003 - pendência 14391
                         '   AND ( R.IDPATRO         = PTR.IDPESSOA(+) ) '                      + #13 +
                         // FIM André Pontes - 15/08/2003 - pendência 14391
                         '   AND ( R.IDPESSOA        = C.IDPESSOA ) ' );
end;

function TCtrlMovimFinanc.ListContabil(rCodLancContabil: Double): OleVariant;
begin
   Result:=GetDataPacket('SELECT '+
                         '   LC.*, '+
                         '   U.NOME AS DESCUNIDNEG,  '+
                         '   CC.NOME AS DESCCCUSTO,  '+
                         '   P.PLANOME AS DESCPLANO, '+
                         // 30/01/04 Alex 14451
                         '   PP.NOME AS NOMEPATRO, '+
                         '   PB.NOME AS DESCPLANOPREV, '+
                         '   S.DESCRICAO DESCSEGREGACRITER '+
                         'FROM '+
                         '   LANCAMENTO LC, '+
                         '   UNIDNEGOCIO U, '+
                         '   CENTCUST CC, '+
                         '   PLANOCONTA P, '+
                         // 30/01/04 Alex 14451
                         '   SEGREGACRITER S, '+
                         '   PLANPREVCONTABIL PB, '+
                         '   PATRO PT, '+
                         '   PESSOA PP '+
                         'WHERE '+
                         '   (LC.PLANO = P.PLANO) AND '+
                         '   (LC.PLACONTA = P.PLACONTA) AND '+
                         '   (LC.PLNCODIGO = '+FloatToStr(rCodLancContabil)+')  AND '+
                         '   (LC.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND '+
                         '   (LC.IDEMPRESA = CC.IDEMPRESA(+)) AND '+
                         '   (LC.IDPESSOA = U.IDPESSOA(+)) AND '+
                         '   (LC.UNIDNEGOC = U.UNIDNEGOC(+)) AND '+
                         // 30/01/04 Alex 14451
                         '   (LC.IDSEGREGACRITER = S.IDSEGREGACRITER(+)) AND '+
                         '   (LC.IDPLANOPREV = PB.IDPLANOPREV(+) ) AND '+
                         '   (LC.IDPATRO = PT.IDPESSOA(+) ) AND '+
                         '   (PT.IDPESSOA = PP.IDPESSOA(+) )');
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
       StartTransaction;
       try
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
   // 07/10/03 - by Alex - Pend 14818 - Incorporando fontes Beraldo
   //cdsMovimFinancAntigo  : TCMClientDataSet;
   //cdsRateioFinancAntigo : TCMClientDataSet;
   cdsRegNI              : TCMClientDataSet;
   // fim 07/10/03 - by Alex - Pend 14818 - Incorporando fontes Beraldo
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
           FCdsMovimFinanc.FieldByName('DATACONCILIACAO').AsDateTime:=
                           FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime;

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
                  // 07/10/03 - by Alex - Pend 14818 - incorporando fontes Beraldo
                  cdsRegNI:=TCMClientDataSet.Create(nil);
                  {Result:=CtrlFinanc.MudaStatusConcilia('J',
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
                  }
                  // Fim 07/10/03 - by Alex - Pend 14818 - incorporando fontes Beraldo
                  // Início bloco substituído 07/10/03 - by Alex - Pend 14818 - incorporando fontes Beraldo
                  {try

                     //Guarda dados do Movimento e do Rateio antes das modificações feitas na tela
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
                                             cdsMovimFinancAntigo.FieldByName('DATACONCILIACAO').AsDateTime,
                                             FCdsMovimFinanc.FieldByName('DATADISPFINANC').AsDateTime,
                                             //0,
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
                                             FCdsMovimFinanc.FieldByName('DATACONCILIACAO').AsDateTime,
                                             FCdsMovimFinanc.FieldByName('DATADISPFINANC').AsDateTime,
                                             //0,
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
                  }
                  try
                     //Gera Relacionaods vazio
                     cdsRegNI.Data:=GetDataPacket(CtrlFinanc.sSqlRelacionados);

                     //Estorna Lancamento Antigo
                     rCodLancFinancAux:=FCdsMovimFinanc.FieldByName('CODLANCFINANC').AsFloat;
                     Result:=CtrlFinanc.EstornoFinanceiro(
                                               FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime,
                                               FCdsMovimFinanc.FieldByName('DATADISPFINANC').AsDateTime,
                                               True,
                                               rCodLancFinancAux,
                                               F_rIDPessoa,
                                               F_rIDModulo,
                                               F_rIDUsuario,
                                               rIDPlano,
                                               bIntegraContabil);
                     if not(Result) then
                      begin
                         MessageInfo:=CtrlFinanc.MessageInfo;
                         Rollback;
                         Exit;
                      end;

                     //Muda Status do Lançamento antigo
                     Result:=CtrlFinanc.MudaStatusConcilia('X',
                                            FCdsMovimFinanc.FieldByName('DATACONCILIACAO').AsDateTime,
                                            FCdsMovimFinanc.FieldByName('CODLANCFINANC').AsFloat);
                     if not(Result) then
                      begin
                         MessageInfo:=CtrlFinanc.MessageInfo;
                         Rollback;
                         Exit;
                      end;

                     //Muda os StatusConciliação do Estorno
                     Result:=CtrlFinanc.MudaStatusConcilia('J',
                                        FCdsMovimFinanc.FieldByName('DATACONCILIACAO').AsDateTime,
                                        rCodLancFinancAux);
                     if not(Result) then
                      begin
                         MessageInfo:=CtrlFinanc.MessageInfo;
                         Rollback;
                         Exit;
                      end;

                     //Lança movimento de conciliação
                     rCodLancFinancAux:=0;
                     rPlnCodigoAux:=0;
                     Result:=CtrlFinanc.LancaFinanceiro(
                                             CdsContabil.Data,
                                             F_rIDModulo,
                                             FCdsMovimFinanc.FieldByName('HISTPADFINAN').AsFloat,
                                             FCdsMovimFinanc.FieldByName('MOECODIGO').AsFloat,
                                             F_rIDUsuario,
                                             FCdsMovimFinanc.FieldByName('CODPORTADOR').AsFloat,
                                             F_rIDPessoa,
                                             FCdsMovimFinanc.FieldByName('VALORLANCFINAN').AsFloat,
                                             FCdsMovimFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                             FCdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime,
                                             FCdsMovimFinanc.FieldByName('DATACONCILIACAO').AsDateTime,
                                             //0,
                                             FCdsMovimFinanc.FieldByName('DATADISPFINANC').AsDateTime,
                                             FCdsMovimFinanc.FieldByName('NUMCHQBORDERO').AsString,
                                             FCdsMovimFinanc.FieldByName('ENTRADASAIDA').AsString,
                                             FCdsMovimFinanc.FieldByName('HISTORICO').AsString,
                                             'J',rCodLancFinancAux,rPlnCodigoAux,rIDPlano,
                                             bIntegraContabil);
                     if not(Result) then
                      begin
                         MessageInfo:=CtrlFinanc.MessageInfo;
                         Rollback;
                         Exit;
                      end;


                    cdsRegNI.Append;
                    cdsRegNI.FieldByName('CODLANCFINANC').AsFloat:=
                                FCdsMovimFinanc.FieldByName('CODLANCFINANC').AsFloat;
                    cdsRegNI.FieldByName('DATADISP').AsDateTime:=
                                FCdsMovimFinanc.FieldByName('DATADISPFINANC').AsDateTime;
                    cdsRegNI.FieldByName('FLGNI').AsString:='I';
                    cdsRegNI.FieldByName('FLGMARCADO').AsString:='N';
                    cdsRegNI.Post;

                    cdsRegNI.Append;
                    cdsRegNI.FieldByName('CODLANCFINANC').AsFloat:=rCodLancFinancAux;
                    cdsRegNI.FieldByName('DATADISP').AsDateTime:=
                                FCdsMovimFinanc.FieldByName('DATADISPFINANC').AsDateTime;
                    cdsRegNI.FieldByName('FLGNI').AsString:='N';
                    cdsRegNI.FieldByName('FLGMARCADO').AsString:='N';
                    cdsRegNI.Post;

                    //Grava Relacionados
                    Result:=CtrlFinanc.GravaRelacionados(cdsRegNI.Data);
                    if not(Result) then
                     begin
                        MessageInfo:=CtrlFinanc.MessageInfo;
                        Rollback;
                        Exit;
                     end

                  finally
                     cdsRegNI.Free;
                  end;
                  // Fim bloco substituído 07/10/03 - by Alex - Pend 14818 - incorporando fontes Beraldo


               end //Fim Regularização
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
                                     FCdsMovimFinanc.FieldByName('DATACONCILIACAO').AsDateTime,
                                     FCdsMovimFinanc.FieldByName('DATADISPFINANC').AsDateTime,
                                     //0,
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

              // Fabio Fagundes 22/07/2004 - Verificar depois se pode ser melhorado as condicoes para TRC entre Planos
              // -> Ver pq  rHistPad é Float
              if (FCdsMovimFinanc.FieldByName('VALORLANCFINAN').AsFloat = 0) and
                 (FCdsMovimFinanc.FieldByName('HISTPADFINAN').AsFloat = 11) then  //'Transferência Entre Planos'
              begin
                 // Grava o CODLANCTRANSF = CODLANCFINANC qdo for Trasf. Entre Planos
                 //Result:=CtrlFinanc.GravaCodLancTranf(rCodLancFinancAux);

                 // 26/07/04 Alex - Fábio estavamos com problemas para compilar a bpl cmcfinan, incorporei o fonte abaixo no exe do cfinan
                 Result := ExecSQL('UPDATE MOVIMFINANC SET CODLANCTRANSF = '+FloatToStr(rCodLancFinancAux) +
                                   ' WHERE (CODLANCFINANC = '+FloatToStr(rCodLancFinancAux)+')');

                  if not(Result) then
                  begin
                     MessageInfo:= 'O banco de dados não conseguiu atualizar o campo MOVIMFINANC.CODLANCTRANSF!';
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

                     if (CtrlParamIntegra.RecPag='R') then
                      begin
                         if (CtrlParamIntegra.RecPag=FCdsRateioFinanc.FieldByName('RECPAG').AsString) then
                            CtrlImpostoRetido.DebCre:='D'
                         else
                            CtrlImpostoRetido.DebCre:='C';
                      end
                     else
                      begin
                         if (CtrlParamIntegra.RecPag=FCdsRateioFinanc.FieldByName('RECPAG').AsString) then
                             CtrlImpostoRetido.DebCre:='C'
                         else
                             CtrlImpostoRetido.DebCre:='D';
                      end;

                     CtrlImpostoRetido.IdEmpresa:=Trunc(F_rIDPessoa);
                     CtrlImpostoRetido.IdModulo:=Trunc(F_rIDModulo);
                     CtrlImpostoRetido.IdUsuario:=Trunc(F_rIDUsuario);
                     CtrlImpostoRetido.UsaPlanoPatro:=F_bUsaPlanoPatro;
                     CtrlImpostoRetido.IntegraContab:=CtrlParamIntegra.IntegraContab;
                     CtrlImpostoRetido.IdPlanoConta:=CtrlParamIntegra.Plano;

                     with TCMClientDataSet.Create(nil) do
                     try
                        Data:=GetDataPacket('SELECT PACDOBRADA FROM PARAMCONTAB WHERE (IDPESSOA = '+
                              FloatToStr(F_rIDPessoa)+') ');
                        CtrlImpostoRetido.PartidaDobrada:=(FieldByName('PACDOBRADA').AsString='S');
                     finally
                        Free;
                     end;

                     CtrlImpostoRetido.CodTipRecDes:=FCdsRateioFinanc.FieldByName('CODTIPRECDES').AsString;
                     CtrlImpostoRetido.RecPag:=FCdsRateioFinanc.FieldByName('RECPAG').AsString[1];
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
                                   FDbImpostoRetido.Recpag.AsString:=CtrlParamIntegra.RecPag;
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
                                               rIDPlano,
                                               // 29/10/04 Alex 17193 nova estrutura RATEIOFINANC.IDSEGREGACRITER
                                               FCdsRateioFinanc.FieldByName('IDSEGREGACRITER').AsInteger);
                 if not(Result) then
                  begin
                     MessageInfo:=CtrlFinanc.MessageInfo;
                     Rollback;
                     Exit;
                  end;

                 FCdsRateioFinanc.Next;
              end;

              //Grava LOG
              if (Operacao=opInclusao) then
                  Result:=CtrlPadroes.GravaLogOperacoes(F_rIDPessoa,F_rIDModulo,F_rIDUsuario,
                                                       'Inclusão no Movimento Financeiro',False)
              else
                  Result:=CtrlPadroes.GravaLogOperacoes(F_rIDPessoa,F_rIDModulo,F_rIDUsuario,
                                                       'Alteração no Movimento Financeiro',False);
              if not(Result) then
               begin
                  MessageInfo:=CtrlPadroes.MessageInfo;
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
                                       CtrlParamIntegra.Plano,bIntegraContabil);

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
                                         CtrlParamIntegra.Plano,
                                         // 29/10/04 Alex 17193 nova estrutura RATEIOFINANC.IDSEGREGACRITER
                                         FCdsRateioFinanc.FieldByName('IDSEGREGACRITER').AsInteger);
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
           begin
              //Grava LOG
              Result:=CtrlPadroes.GravaLogOperacoes(F_rIDPessoa,F_rIDModulo,F_rIDUsuario,
                                                   'Exclusão no Movimento Financeiro',False);
              if not(Result) then
               begin
                  MessageInfo:=CtrlPadroes.MessageInfo;
                  Rollback;
               end
              else
               Commit;
           end;
       except
          on E:Exception do
          begin
             MessageInfo := E.Message;
             Result := False;
             Rollback;
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
       try
          cdsRateioFinancAux:=TCMClientDataSet.Create(nil);
          try
             //=========== Início Imposto Retido ============================
             rTotalImposto:=0;
             if (FCdsMovimFinanc.FieldByName('ENTRADASAIDA').AsString='E') then
                sIntegraBackRecPag:='R'
             else
                sIntegraBackRecPag:='P';

             //Copia Dados do Movimento Financeiro
             cdsRateioFinancAux.Data:=FCdsRateioFinanc.Data;

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
                    if (cdsRateioFinancAux.FieldByName('RECPAG').AsString='R') then
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

                CtrlImpostoRetido.IdEmpresa:=Trunc(F_rIDPessoa);
                CtrlImpostoRetido.IdModulo:=Trunc(F_rIDModulo);
                CtrlImpostoRetido.IdUsuario:=Trunc(F_rIDUsuario);
                CtrlImpostoRetido.UsaPlanoPatro:=F_bUsaPlanoPatro;
                CtrlImpostoRetido.IntegraContab:=CtrlParamIntegra.IntegraContab;
                CtrlImpostoRetido.IdPlanoConta:=CtrlParamIntegra.Plano;

                with TCMClientDataSet.Create(nil) do
                try
                   Data:=GetDataPacket('SELECT PACDOBRADA FROM PARAMCONTAB WHERE (IDPESSOA = '+
                         FloatToStr(F_rIDPessoa)+') ');
                   CtrlImpostoRetido.PartidaDobrada:=(FieldByName('PACDOBRADA').AsString='S');
                finally
                   Free;
                end;

                CtrlImpostoRetido.CodTipRecDes:=cdsRateioFinancAux.FieldByName('CODTIPRECDES').AsString;
                CtrlImpostoRetido.RecPag:=cdsRateioFinancAux.FieldByName('RECPAG').AsString[1];
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
                              FCdsRateioFinanc.FieldByName('RECPAG').AsString:=
                                  FieldByName('RECPAG').AsString;
                              FCdsRateioFinanc.FieldByName('CODCENTRORESPON').AsString:=
                                  cdsRateioFinancAux.FieldByName('CODCENTRORESPON').AsString;
                              FCdsRateioFinanc.FieldByName('CODTIPRECDES').AsString:=
                                  FieldByName('CODTIPRECDES').AsString;
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

   // 07/10/03 - by Alex - Pend 14818 - incorporando fontes Beraldo
   {
   if (FormatFloat('#,##0.00',abs(rTotalRateio))<>
       FormatFloat('#,##0.00',abs(FCdsMovimFinanc.FieldByName('VALORLANCFINAN').AsFloat))) then
   }
   if (FormatFloat('#,##0.00',rTotalRateio)<>
       FormatFloat('#,##0.00',FCdsMovimFinanc.FieldByName('VALORLANCFINAN').AsFloat)) then
   // Fim 07/10/03 - by Alex - Pend 14818 - incorporando fontes Beraldo
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
   // 29/01/04 Alex 14451
   // RegContabil : TContabil;
   // declarado como array poi na segunda posição, conta dif do banco será gerado
   // o idsegregacriter que deverá ser levado ao banco
   RegContabil : array[1..2] of TContabil;
   rLacNumLan  : Double;
   iIdSegregaCriter: integer; // 29/01/04 Alex
   sContaSegregaCriter: string;
   _CdsLocal: TClientDataSet;

   //DAVID - Pendência 16350
   //Variável que indica se há partida dobrada ou não.
   bPartidaDobrada : boolean;

begin
   Result:=True;

   //DAVID - Pendência 16350
   //Recupera o flag que indica se há partida dobrada ou não.
   with TCMClientDataSet.Create(nil) do
   try
     Data := GetDataPacket('SELECT PACDOBRADA FROM PARAMCONTAB WHERE (IDPESSOA = '+ FloatToStr( F_rIDPessoa ) + ') ');
     bPartidaDobrada := ( UpperCase( FieldByName('PACDOBRADA').AsString ) = 'S' );
   finally
     Free;
   end;

   MessageInfo:='';
   rLacNumLan:=1;
   try
      FcdsContabil.First;
      if (FcdsContabil.IsEmpty) and (FCdsMovimFinanc.FieldByName('CODPORTADOR').asFloat<>0) then
       begin
          FCdsRateioFinanc.First;
          while not(FCdsRateioFinanc.Eof) do
          begin
             RegContabil[1].PlaConta:=sContaBanco;
             RegContabil[1].CodCentroCusto:=sCCustoBanco;
             RegContabil[1].DescUnidNeg:=FCdsRateioFinanc.FieldByName('DESCUNIDNEG').AsString;
             RegContabil[1].UnidNegoc:=FCdsRateioFinanc.FieldByName('UNIDNEGOC').AsFloat;
             RegContabil[1].CodSubConta:=rSubContaBanco;
             RegContabil[1].LacValor:=FCdsRateioFinanc.FieldByName('VALOR').AsFloat;
             RegContabil[1].LacValHist:=FCdsRateioFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat;
             RegContabil[1].IDPatro:=FCdsRateioFinanc.FieldByName('IDPATRO').AsFloat;
             RegContabil[1].IDPlanoPrev:=FCdsRateioFinanc.FieldByName('IDPLANOPREV').AsFloat;
             RegContabil[1].LacNumDoc:=FCdsMovimFinanc.FieldByName('NUMCHQBORDERO').AsString;
             RegContabil[1].LacNumLan:=rLacNumLan;
             // 30/01/04 Alex 14451
             RegContabil[1].DescPatro:=FCdsRateioFinanc.FieldByName('NOME_PATRO').AsString;
             RegContabil[1].DescPlanPrev:=FCdsRateioFinanc.FieldByName('NOME_PLANO').AsString;

             //Distribui o Histórico pelas 5 linhas disponíveis
             GeralFinanc.ArrumaHistorico((FCdsMovimFinanc.FieldByName('HISTORICO').AsString+' - '+
                                         FCdsMovimFinanc.FieldByName('DESCPORTADOR').AsString),
                                         RegContabil[1].LacHist1,RegContabil[1].LacHist2,
                                         RegContabil[1].LacHist3,RegContabil[1].LacHist4,
                                         RegContabil[1].LacHist5);

             if (FCdsMovimFinanc.FieldByName('ENTRADASAIDA').AsString='S') then
              begin
                 RegContabil[1].LacDebCre:='C';
                 RegContabil[1].LacTipo:='1';

                 if (FCdsRateioFinanc.FieldByName('RECPAG').AsString='R') then
                  begin
                     RegContabil[1].LacValor:= -RegContabil[1].LacValor;
                     RegContabil[1].LacValHist:= -RegContabil[1].LacValHist;
                  end;
              end
             else
              begin
                 RegContabil[1].LacDebCre:='D';
                 RegContabil[1].LacTipo:='0';

                 if (FCdsRateioFinanc.FieldByName('RECPAG').AsString='P') then
                  begin
                     RegContabil[1].LacValor:= -RegContabil[1].LacValor;
                     RegContabil[1].LacValHist:= -RegContabil[1].LacValHist;
                  end;
              end;

             // 29/01/04 Alex 14451 esta linha passa para baixo juntando os
             // lançamentos após a definição do critério para segregação
             //Gera Linha Contabil
             //Result:=GeraRegistroContabil(RegContabil,rIDPlano);
             //if not(Result) then Exit;

             // 29/01/04 Alex 14451
             // antes era um record os atributos comuns não tinham que ser atribuidos novamente
             RegContabil[2].IDPatro     :=FCdsRateioFinanc.FieldByName('IDPATRO').AsFloat;
             RegContabil[2].IDPlanoPrev :=FCdsRateioFinanc.FieldByName('IDPLANOPREV').AsFloat;
             RegContabil[2].LacNumDoc   :=FCdsMovimFinanc.FieldByName('NUMCHQBORDERO').AsString;
             RegContabil[2].LacNumLan   :=rLacNumLan;
             RegContabil[2].LacHist1    := RegContabil[1].LacHist1;
             RegContabil[2].LacHist2    := RegContabil[1].LacHist2;
             RegContabil[2].LacHist3    := RegContabil[1].LacHist3;
             RegContabil[2].LacHist4    := RegContabil[1].LacHist4;
             RegContabil[2].LacHist5    := RegContabil[1].LacHist5;
             RegContabil[2].DescPatro   := RegContabil[1].DescPatro;
             RegContabil[2].DescPlanPrev:= RegContabil[1].DescPlanPrev;
             // fim 29/01/04 Alex 14451

             if (FCdsMovimFinanc.FieldByName('STATUSCONCILIA').AsString='I') and
                not(bRegNaoIdent) then
              begin
                 RegContabil[2].PlaConta:=sContaNI;
                 RegContabil[2].CodCentroCusto:=sCCustoNI;
                 RegContabil[2].CodSubConta:=rSubContaNI;
                 RegContabil[2].LacValor:=FCdsRateioFinanc.FieldByName('VALOR').AsFloat;
                 RegContabil[2].LacValHist:=FCdsRateioFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat;

                 if (FCdsMovimFinanc.FieldByName('ENTRADASAIDA').AsString='S') then
                  begin
                     RegContabil[2].LacDebCre:='D';
                     RegContabil[2].LacTipo:='0';
                  end
                 else
                  begin
                     RegContabil[2].LacDebCre:='C';
                     RegContabil[2].LacTipo:='1';
                  end;

                 //Gera Linha Contabil
                 // 29/01/04 Alex Result:=GeraRegistroContabil(RegContabil,rIDPlano);
                 //if not(Result) then Exit;
              end
             else
              begin
                 RegContabil[2].CodCentroCusto:=FCdsRateioFinanc.FieldByName('CODCENTROCUSTO').AsString;
                 RegContabil[2].DescUnidNeg:=FCdsRateioFinanc.FieldByName('DESCUNIDNEG').AsString;

                 RegContabil[2].PlaConta:=CtrlLancamento.BuscaContaContabil(Trunc(F_rIDPessoa),
                                           FCdsRateioFinanc.FieldByName('IDPROGRAMA').AsInteger,
                                           FCdsRateioFinanc.FieldByName('CODTIPRECDES').AsString,
                                           FCdsRateioFinanc.FieldByName('CODCENTROCUSTO').AsString,
                                           FCdsRateioFinanc.FieldByName('RECPAG').AsString);

                 RegContabil[2].UnidNegoc:=FCdsRateioFinanc.FieldByName('UNIDNEGOC').AsFloat;
                 RegContabil[2].CodSubConta:=0;
                 RegContabil[2].LacValor:=FCdsRateioFinanc.FieldByName('VALOR').AsFloat;
                 RegContabil[2].LacValHist:=FCdsRateioFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat;

                 if (FCdsRateioFinanc.FieldByName('RECPAG').AsString='R') then
                  begin
                     RegContabil[2].LacDebCre:='C';
                     RegContabil[2].LacTipo:='1';
                  end
                 else
                  begin
                     RegContabil[2].LacDebCre:='D';
                     RegContabil[2].LacTipo:='0';
                  end;

                 //Gera Linha Contabil
                 // 29/01/04 Alex Result:=GeraRegistroContabil(RegContabil,rIDPlano);
                 //if not(Result) then Exit;
              end;

             // 29/01/04 Alex - 14451 Define o critério para segregação
             iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(trunc(rIDPlano),
                                                                     trunc(RegContabil[2].IDPlanoPrev),
                                                                     trunc(RegContabil[2].IDPatro),
                                                                     RegContabil[2].PlaConta,
                                                                     sContaSegregaCriter);
             // não foi encontrado critério na conta contrária a banco, procurar no banco
             if iIdSegregaCriter = -1 then
               iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(trunc(rIDPlano),
                                                                     trunc(RegContabil[1].IDPlanoPrev),
                                                                     trunc(RegContabil[1].IDPatro),
                                                                     RegContabil[1].PlaConta,
                                                                     sContaSegregaCriter);
             RegContabil[1].IdSegregaCriter := iIdSegregaCriter;
             RegContabil[2].IdSegregaCriter := iIdSegregaCriter;

             // Alex 29/10/04 Criar a estrutura IDSEGREGACRITER na RATEIOFINANC
             FCdsRateioFinanc.Edit;
             FCdsRateioFinanc.FieldByName('IDSEGREGACRITER').AsInteger := iIdSegregaCriter;
             FCdsRateioFinanc.Post;

             if iIdSegregaCriter = -1 then begin
               RegContabil[1].DescSegregaCriter := '';
               RegContabil[2].DescSegregaCriter := '';
             end else begin
               try
                 _CdsLocal := TClientDataSet.Create(nil);
                 _CdsLocal.Data := CtrlSegregacao.ListaSegregaCriter(iIdSegregaCriter);
                 RegContabil[1].DescSegregaCriter := _CdsLocal.FieldByName('DESCRICAO').AsString;
                 RegContabil[2].DescSegregaCriter := RegContabil[1].DescSegregaCriter;
               finally
                 _CdsLocal.Free;
               end;
             end;
             // fim 29/01/04 Alex - 14451 Define o critério para segregação

             Result:=GeraRegistroContabil(RegContabil[1],rIDPlano,
             //DAVID - Pendência 16350
             bPartidaDobrada );

             if not(Result) then Exit;

             Result:=GeraRegistroContabil(RegContabil[2],rIDPlano,
             //DAVID - Pendência 16350
             bPartidaDobrada );

             if not(Result) then Exit;

             rLacNumLan:=rLacNumLan+1;
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

function TCtrlMovimFinanc.GeraRegistroContabil(RegContabil: TContabil; rIDPlano: Double;
                                    //DAVID - Pendência 16350
                                    bPartidaDobrada : Boolean ): Boolean;
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

      //DAVID - Pendência 16350
      //Testa se há partida dobrada. Se houver, contabiliza novo crédito. 
      if ( not bPartidaDobrada ) and
         ( FCdsContabil.Locate('PLACONTA;CODCENTROCUSTO;UNIDNEGOC;CODSUBCONTA;LACDEBCRE;LACTIPO;IDSEGREGACRITER',
            VarArrayOf([RegContabil.PlaConta,
            RegContabil.CodCentroCusto,
            RegContabil.UnidNegoc,
            RegContabil.CodSubConta,
            RegContabil.LacDebCre,
            RegContabil.LacTipo,
            RegContabil.IdSegregaCriter]),[loCaseInsensitive] ) ) then
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
          //O Campo LACNUMLAN será usado como identificador de um par de registros na Partida Dobrada
          FCdsContabil.FieldByName('LACNUMLAN').AsFloat:=RegContabil.LacNumLan;
          // 29/01/04 Alex 14451
          FCdsContabil.FieldByName('IDSEGREGACRITER').AsInteger:=RegContabil.IdSegregaCriter;
          FCdsContabil.FieldByName('DESCPLANOPREV').AsString := RegContabil.DescPlanPrev;
          FCdsContabil.FieldByName('NOMEPATRO').AsString := RegContabil.DescPatro;
          FCdsContabil.FieldByName('DESCSEGREGACRITER').AsString := RegContabil.DescSegregaCriter;

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

            // 07/10/03 - by Alex - Pend 14881 - Incorporando fontes Beraldo
            // if (FcdsContabil.FieldByName('PLACONTA').AsString=sContaBanco) and
            if (FcdsContabil.FieldByName('PLACONTA').AsString=Trim(sContaBanco)) and
            // fim 07/10/03 - by Alex - Pend 14881 - Incorporando fontes Beraldo
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

function TCtrlMovimFinanc.MudaStatus(rCodLancFinanc: Double;
  sStatus: String; dDataConc, dDataDisp: TDateTime): OleVariant;
var
   sSql : String;
begin
   MessageInfo:='';

   sSql:='UPDATE MovimFinanc '+
           'SET STATUSCONCILIA = '''+sStatus+''', ';

   if (dDataConc<>0) then
      sSql:=sSql+'    DATACONCILIACAO = TO_DATE('''+
                      FormatDateTime('dd/mm/yyyy',dDataConc)+''',''dd/mm/yyyy''), '
   else
      sSql:=sSql+'    DATACONCILIACAO = NULL, ';

   if (dDataDisp<>0) then
      sSql:=sSql+'    DATADISPFINANC = TO_DATE('''+
                      FormatDateTime('dd/mm/yyyy',dDataDisp)+''',''dd/mm/yyyy'') '
   else
      sSql:=sSql+'    DATADISPFINANC = NULL ';

   sSql:=sSql+'WHERE (CODLANCFINANC = '+FloatToStr(rCodLancFinanc)+') ';

   Result:=ExecSQL(sSql);
end;

function TCtrlMovimFinanc.AlteraDispFinancDocBaixado(sEntradaSaida:string;iCodLancFinanc: integer; dDataDisp:TDateTime): boolean;
var
   cdsAux : TCMClientDataSet;
   sSql   : String;
begin
   Result := True;

   MessageInfo:='';
   if (sEntradaSaida = 'E') and (Trim(DateToStr(dDataDisp)) <> '') then // CAR
   begin
      cdsAux:=TCMClientDataSet.Create(nil);
      try
         cdsAux.Data:=GetDataPacket('SELECT CODDOCUMENTO '+
                          'FROM RECBTOPAGTO '+
                          'WHERE (CODLANCFINANC = '+IntToStr(iCodLancFinanc)+') ');
         if cdsAux.IsEmpty then
          begin
             Result:=False;
             MessageInfo:='Documento não Encontrado. Verifique.';
             Exit;
          end;
          sSql := 'UPDATE DOCUMENTO SET DATADISPONIB  = TO_DATE('''+FormatDateTime('dd/mm/yyyy',dDataDisp)+''',''dd/mm/yyyy'') ';
          sSql := sSql + 'WHERE CODDOCUMENTO = '+cdsAux.FieldByName('CODDOCUMENTO').AsString;

          Result:=ExecSQL(sSql);
      finally
         cdsAux.Free;
      end;
   end;
end;

// 07/10/03 - Pend. 14818 - Incorporando fontes Beraldo
function TCtrlMovimFinanc.TestaRegularizado(
  rCodLancFinanc: Double): Boolean;
begin
   with TCMClientDataSet.Create(nil) do
   try
      Data:=GetDataPacket('SELECT * FROM RELACIONANI '+
                          'WHERE (CODLANCFINANC = '+FloatTosTr(rCodLancFinanc)+') ');
      Result:=not(IsEmpty);
   finally
      Free;
   end;
end;

end.
