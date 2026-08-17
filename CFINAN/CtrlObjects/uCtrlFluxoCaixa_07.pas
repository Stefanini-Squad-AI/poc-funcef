unit uCtrlFluxoCaixa;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, DbClient, uCMClientDataSet,
     Classes, uCtrlPadroes,uCMTypes, uCmSqlParams,
     uGeralFinanc, uCtrlFinanc, uCtrlListTercFinanc, uCtrlParamIntegra, uCtrlParamFinanc,
     uDiasUteis, uDbFluxoOrcado, uCMTranslate;

type

   TCoresLegenda = record
                      sCorRecComPrev  : String;
                      sCorRecSemPrev  : String;
                      sCorPgtoComPrev : String;
                      sCorPgtoSemPrev : String;
                   end;

   TParamFluxo = record
                    dDataInicial    : TDateTime; //data inicial e final da coluna
                    dDataFinal      : TDateTime; // corrente a ser exibida
                    dDataMin        : TDateTime; //menor e maior data do período que pode
                    dDataMax        : TDateTime; // ser selecionado pelo usuário
                    dDataInicFluxo  : TDateTime; //início e fim do período selecionado
                    dDataFinalFluxo : TDateTime; // pelo usuário
                    sUneCodigo      : String;
                    sCentroResp     : String;
                    sCentroCusto    : String;
                    rMoeCodigo      : Double;
                    rCodPortador    : Double;
                    sQuebra         : String;
                    Legenda         : TCoresLegenda;
                    sTipoFluxo      : String;
                    sPrazo          : String;
                    bFlxComparativo : Boolean;
                    sFiltroPessoa   : String;
                 end;

   TCtrlFluxoCaixa = Class(TCmControlObject)
   private
      GeralFinanc        : TGeralFinanc;
      CtrlListTerceiros  : TCtrlListTercFinanc;
      CtrlFinanc         : TCtrlFinanc;
      CtrlParamFinanc    : TCtrlParamFinanc;
      CtrlParamIntegra   : TCtrlParamIntegra;
      CtrlPadroes        : TCtrlPadroes;
      DiasUteis          : TDiasUteis;

      F_rIDPessoa        : Double;
      F_rIDModulo        : Double;
      F_rIDUsuario       : Double;
      F_bUsaPlanoPatro   : Boolean;
      FTipoEmpresa       : String;

      sTitSalAnterior    : String;
      sTipSalTransp      : String;
      bDesVermelho       : Boolean;
      bGeraDetFlxPrev    : Boolean;
      bGeraFlxDataConc   : Boolean; 
      bConsMovRealFP     : Boolean;
      iNumArq            : Integer;

   public
      property IDPessoa: Double  read F_rIDPessoa write F_rIDPessoa;
      property IDModulo: Double read F_rIDModulo write F_rIDModulo;
      property IDUsuario: Double read F_rIDUsuario write F_rIDUsuario;
      property UsaPlanoPatro: Boolean read F_bUsaPlanoPatro write F_bUsaPlanoPatro;
      property TipoEmpresa: String read FTipoEmpresa write FTipoEmpresa;

      constructor Create(rIDPessoa,rIDModulo,rIDUsuario: Double; bUsaPlanoPatro: Boolean); reintroduce;
      destructor Destroy; override;

      procedure PreparaCtrl;
      function RecarregaParametros(rIDNovoPessoa: Double): Boolean;

      function GeraFluxoPrevisto(rSaldoInic: Double; dDataInicial,dDataFinal: TDateTime;
                                 bGeraAtrasados: Boolean; const IAppCliente: OleVariant): Boolean;
      function GeraFluxoReal(dDataInicial,dDataFinal: TDateTime; rCodPortador: Double;
                             const IAppCliente: OleVariant): Boolean;
      function GeraFluxoOrcOrcamen(rPeriodoInicial, rPeriodoFinal, rExercicio: Double): Boolean;
      function GeraMultiFluxoOrc(dDataInicial,dDataFinal: TDateTime;
                                 sFluxoOrigem, sFluxoDestino: String): Boolean;
      function CalculaSaldoInicFlxPrev(dDataRef: TDateTime): Double;
      function BuscaMinMaxDataFlxOrc(sPrazoFluxo: String): OleVariant;
      function ExcluiLancFlxOrc(dDataInicial,dDataFinal: TDateTime; sPrazoFluxo: String): Boolean;
      procedure BuscaDataPeriodo(var dDataPeriodo: TDateTime; bDataInicial: Boolean;
                                 rExercicio, rPeriodo: Double);

      //Rotinas da Consulta dos Fluxo de Caixa
      //======================================
      function GeraSaldoInicialFluxo(ParamFluxo : TParamFluxo): Double;
      function GeraColunasFluxo(dDataInicial,dDataFinal: TDateTime;
                                sAgrupamento,sTipoFluxo: String; bExibSabDom: Boolean): OleVariant;
      function GeraLinhasFluxo(ParamFluxo: TParamFluxo; bGeraValores: Boolean;
                               rSaldoInicial, rIDFluxoCaixa: Double): OleVariant;
      function GeraLinhasSaldo(ParamFluxo: TParamFluxo; bGeraValores: Boolean;
                               rSaldoFluxo: Double): OleVariant;
      function GeraLinhasSaldoAplic(ParamFluxo: TParamFluxo; bGeraValores: Boolean;
                                    rSaldoFluxo: Double): OleVariant;
      function GeraSomatorios(LinhasFluxo: OleVariant; ParamFluxo: TParamFluxo;
                              rSaldoInicial: Double): OleVariant;
      function GeraFiltroPessoa(rIDFluxoConsol, rIDPessoa: Double): String;
      function GeraDadosGrafico(ParamFluxo: TParamFluxo; sAgrupamento: String): OleVariant;
      function BuscaNomeFluxo(sTipoFluxo: String): String;
      function ComparaFloat(rValor1,rValor2 : Double): Boolean;
      function ValidaFluxoConsol(rIDFluxoConsol: Double): Boolean;
      procedure MontaFiltro(sSql: TCMSqlParams; ParamFluxo: TParamFluxo; bTodoPeriodo: Boolean);
      function ListDatasMinMax(sFluxo, sCampoData: String; rIDFluxoConsol: Double): OleVariant;
      function ListDadosImpressao(sOrientacao: String): OleVariant;
      function ListUnidNegxFluxoComp(rIDPessoa,rIDConsolidado: Double;
                                     sFluxo1,sFluxo2: String): OleVariant;
      function ListUnidNegxFluxo(rIDPessoa, rIDConsolidado: Double; sFluxo: String): OleVariant;
      function ListCentroResponxFluxo(rIDPessoa, rIDConsolidado: Double; sFluxo: String): OleVariant;
      function ListCentroResponxFluxoComp(rIDPessoa, rIDConsolidado: Double; sFluxo1,sFluxo2: String): OleVariant;
      function ListCentroCustoxFluxo(rIDPessoa, rIDConsolidado: Double; sFluxo: String): OleVariant;
      function ListCentroCustoxFluxoComp(rIDPessoa, rIDConsolidado: Double; sFluxo1,sFluxo2: String): OleVariant;
      function ListPortadorContaxFluxo(rIDPessoa, rIDConsolidado: Double; sFluxo: String): OleVariant;      
   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;

implementation

uses Math, SysConst, uCMTraduzSQL, DateUtils, uCmCustomCdbObject;

{ TCtrlFinanc }

constructor TCtrlFluxoCaixa.Create(rIDPessoa, rIDModulo, rIDUsuario: Double; bUsaPlanoPatro: Boolean);
begin
   inherited Create;

   iNumArq:=0;
   
   F_rIDPessoa:=rIDPessoa;
   F_rIDModulo:=rIDModulo;
   F_rIDUsuario:=rIDUsuario;
   F_bUsaPlanoPatro:=bUsaPlanoPatro;

   GeralFinanc:=TGeralFinanc.Create;
   CtrlListTerceiros:=TCtrlListTercFinanc.Create;
   CtrlFinanc:=TCtrlFinanc.Create(rIDPessoa,rIDModulo,rIDUsuario,bUsaPlanoPatro);
   CtrlParamFinanc:=TCtrlParamFinanc.Create;
   CtrlParamIntegra:=TCtrlParamIntegra.Create;
   CtrlPadroes:=TCtrlPadroes.Create;
   DiasUteis:=TDiasUteis.Create;
end;

destructor TCtrlFluxoCaixa.Destroy;
begin
   GeralFinanc.Free;
   CtrlListTerceiros.Free;
   CtrlFinanc.Free;
   CtrlParamFinanc.Free;
   CtrlParamIntegra.Free;
   CtrlPadroes.Free;
   DiasUteis.Free;
   inherited;
end;

procedure TCtrlFluxoCaixa.DoChangeDataBase;
begin
   inherited;
end;

procedure TCtrlFluxoCaixa.AfterInitialize;
begin
   inherited;
   CtrlListTerceiros.InitializeAs(Self);
   CtrlFinanc.InitializeAs(Self);
   CtrlParamFinanc.InitializeAs(Self);
   CtrlParamIntegra.InitializeAs(Self);
   CtrlPadroes.InitializeAs(Self);
   GeralFinanc.InitializeAs(Self);
   DiasUteis.InitializeAs(Self);
   CtrlListTerceiros.OpenTransaction:=False;
   CtrlFinanc.OpenTransaction:=False;
   CtrlParamFinanc.OpenTransaction:=False;
   CtrlPadroes.OpenTransaction:=False;
   GeralFinanc.OpenTransaction:=False;
   //if (F_rIDPessoa<>0) then PreparaCtrl; //Não executará para cnsServer
   PreparaCtrl;
   CtrlParamIntegra.GetParams(Trunc(F_rIDPessoa), 0, 'INTEGRACONTAB', 'PARAMFINANC', tiSistema);
end;

procedure TCtrlFluxoCaixa.PreparaCtrl;
begin
   with TCMClientDataSet.Create(nil) do
   try
      Data:=CtrlParamFinanc.ListParamFinanc(F_rIDPessoa);
      sTitSalAnterior:=FieldByName('TITSALDOANT').AsString;
      sTipSalTransp:=FieldByName('TITSALDOTRANSP').AsString;
      bDesVermelho:=(FieldByName('FLGDESVERM').AsString='S');
      bGeraDetFlxPrev:=(FieldByName('FLGGERADETFLUXO').AsString='S');
      bConsMovRealFP:=(FieldByName('FLGCONMOVREALFP').AsString='S');
      bGeraFlxDataConc:=(FieldByName('FLGFLXDATACONC').AsString='S');
   finally
      Free;
   end;
end;

function TCtrlFluxoCaixa.RecarregaParametros(rIDNovoPessoa: Double): Boolean;
begin
   Result:=True;
   MessageInfo:='';
   try
      //Recarrega IDPessoa local
      F_rIDPessoa:=rIDNovoPessoa;

      //Recarrega IDPessoa da CtrlFinanc
      CtrlFinanc.IDPessoa:=rIDNovoPessoa;

      //Recarrega parâmetros de integração
      if not(CtrlParamIntegra.GetParams(Trunc(F_rIDPessoa), 0, 'INTEGRACONTAB', 'PARAMFINANC',
                                        tiSistema)) then
         raise Exception.Create(CtrlParamIntegra.MessageInfo);

      //Prepara Ctrl
      PreparaCtrl;
   except
      on E:Exception do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;

//==============================================================================
// Fluxo Previsto
//==============================================================================

function TCtrlFluxoCaixa.GeraFluxoPrevisto(rSaldoInic: Double; dDataInicial,
  dDataFinal: TDateTime; bGeraAtrasados: Boolean; const IAppCliente: OleVariant): Boolean;
var
   cdsAux            : TCMClientDataSet;
   cdsDocumento      : TCMClientDataSet;
   cdsOrcamento      : TCMClientDataSet;
   cdsInvestimento   : TCMClientDataSet;
   cdsPrevReceitaDia : TCMClientDataSet;

   sCodTipRecDesAux  : String;
   sCentroResponAux  : String;
   sCentroResponGlb  : String;
   sTipo             : String;
   sRazaoSocial      : String;
   sComplDoc         : String;
   sHistorico        : String;
   sNoDocumento      : String;

   rUnidNegAux       : Double;
   rUnidNegGlb       : Double;
   rCodTipDocAux     : Double;
   rCodLancFinancAux : Double;
   rCodTipoDocInvest : Double;
   rValor            : Double;

   rTotalDocGeral    : Double;
   rTotalDocOMGeral  : Double;
   rTotalDocumento   : Double;
   rTotalDocOM       : Double;
   rDMais            : Double;
   rSaldoCorrente    : Double;
   rSaldoMoeda       : Double;
   rSaldoDoc         : Double;
   rSaldoDocOM       : Double;
   rCodDocSaldo      : Double;
   rValorCotacao     : Double;
   rNumDecimais      : Double;
   bLanca            : Boolean;
   bAutGeraDetFlx    : Boolean;
   bGeraFlxTodasEmp  : Boolean; 
   dDataAux          : TDateTime;
   sSql              : TCMSqlParams;
   iMaxProgresso     : Integer;
   iParcelaAux       : Integer;
   sFormatoDataAux   : String;
begin
   MessageInfo:='';

   if ConnectionSide = cnsClient then
   begin
      Result:=Connection.AppServer.GeraFluxoPrevisto(rSaldoInic,
                                                     dDataInicial,
                                                     dDataFinal,
                                                     bGeraAtrasados,
                                                     F_rIDPessoa,
                                                     F_rIDModulo,
                                                     F_rIDUsuario,
                                                     F_bUsaPlanoPatro,
                                                     FTipoEmpresa,
                                                     IAppCliente);
      if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
   end
   else
   begin
      StartTransaction;
      try
         cdsAux:=TCMClientDataSet.Create(nil);
         sSql:=TCMSqlParams.Create(nil);
         try
            //Busca qualquer recebimento analítico a ser utilizado na gravação do Saldo Anterior
            cdsAux.Data:=CtrlListTerceiros.ListTipoRD(F_rIDPessoa,'R','A');
            sCodTipRecDesAux:=cdsAux.FieldByName('CODTIPRECDES').AsString;

            //Busca Tipo de Documento usado em Transfêrencias
            cdsAux.Close;
            cdsAux.Data:=CtrlParamFinanc.ListParamFinanc(F_rIDPessoa);
            rCodTipoDocInvest:=0;
            if (cdsAux.FieldByName('CODTIPDOCINVEST').AsFloat<>0) then
               rCodTipoDocInvest:=cdsAux.FieldByName('CODTIPDOCINVEST').AsFloat;

            //Busca Unidade de Negócio e Centro de Respon a serem utilizados na gravação do Saldo Anterior
            cdsAux.Close;
            cdsAux.Data:=CtrlListTerceiros.ListParamGlobal(F_rIDPessoa);
            rUnidNegGlb:=cdsAux.FieldByName('UNIDNEGOC').AsFloat;
            rUnidNegAux:=rUnidNegGlb;
            sCentroResponGlb:=cdsAux.FieldByName('CODCENTRORESPON').AsString;
            sCentroResponAux:=sCentroResponGlb;

            //Busca Código de Tipo de Documento a ser utilizado na gravação do Saldo Anterior
            cdsAux.Close;
            cdsAux.Data:=CtrlListTerceiros.ListTipoDoc('R');
            rCodTipDocAux:=cdsAux.FieldByName('CODTIPDOC').AsFloat;

            //Limpa Fluxo Previsto
            Result:=ExecSQL('DELETE FLUXOPREVISTO WHERE (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ');
            if not(Result) then
            begin
               Rollback;
               Exit;
            end;

            //Limpa Detalhes
            if bGeraDetFlxPrev then
             begin
                Result:=ExecSQL('DELETE DETFLXPREVISTO WHERE (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ');
                if not(Result) then
                begin
                   Rollback;
                   Exit;
                end;
             end;

            //Grava Datas de Geração do Fluxo
            Result:=ExecSQL('UPDATE PARAMFINANC '+
                            'SET DATAINICFLXPREV = TO_DATE('''+
                            FormatDateTime('dd/mm/yyyy',dDataInicial)+''',''dd/mm/yyyy''), '+
                            '    DATAFINALFLXPREV = TO_DATE('''+
                            FormatDateTime('dd/mm/yyyy',dDataFinal)+''',''dd/mm/yyyy'') '+
                            'WHERE (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ');

            if not(Result) then
            begin
               Rollback;
               Exit;
            end;

            //----------------------Início Geração do Saldo
            iMaxProgresso:=0;
            //Chama a rotina atualizadora da Progressbar
            try
               IAppCliente.ProgressoCFinan(iMaxProgresso,'Gerando Saldo...');
            except
               //
            end;

            Result:=CtrlFinanc.GravaFluxoPrev(sCentroResponAux,sCodTipRecDesAux,'R','N',
                                              StrToDate('01/01/1900'),rUnidNegAux,rSaldoInic,'',
                                              F_rIDPessoa,0,0,0,rCodTipDocAux,False,
                                              '','','','','');
            if not(Result) then
            begin
               MessageInfo:=CtrlFinanc.MessageInfo;
               Rollback;
               Exit;
            end;

            Result:=CtrlFinanc.GravaFluxoPrev(sCentroResponAux,sCodTipRecDesAux,'R','N',
                                              dDataInicial-1,rUnidNegAux,0,'',F_rIDPessoa,
                                              0,0,0,rCodTipDocAux,False,
                                              '','','','','');
            if not(Result) then
            begin
               MessageInfo:=CtrlFinanc.MessageInfo;
               Rollback;
               Exit;
            end;

            Result:=CtrlFinanc.GravaFluxoPrev(sCentroResponAux,sCodTipRecDesAux,'R','N',dDataInicial,
                                              rUnidNegAux,0,'',F_rIDPessoa,0,0,0,
                                              rCodTipDocAux,False,
                                              '','','','','');
            if not(Result) then
            begin
               MessageInfo:=CtrlFinanc.MessageInfo;
               Rollback;
               Exit;
            end;

            Result:=CtrlFinanc.GravaFluxoPrev(sCentroResponAux,sCodTipRecDesAux,'R','N',dDataFinal,
                                              rUnidNegAux,0,'',F_rIDPessoa,0,0,0,
                                              rCodTipDocAux,False,
                                              '','','','','');
            if not(Result) then
            begin
               MessageInfo:=CtrlFinanc.MessageInfo;
               Rollback;
               Exit;
            end; //----------------------Fim Geração do Saldo

            //----------------------Início dos Dados vindos do Controle Financeiro
            cdsAux.Close;

            if (bConsMovRealFP) then
               cdsAux.Data:=GetDataPacket('SELECT '+
                                          '   M.DATALANCFINAN, '+
                                          '   M.HISTORICO, '+
                                          '   M.NUMCHQBORDERO, '+
                                          '   R.* '+
                                          'FROM '+
                                          '   RATEIOFINANC R, '+
                                          '   MOVIMFINANC M, '+
                                          '   PORTADORCONTA C '+
                                          'WHERE '+
                                          '   (M.CODLANCFINANC = R.CODLANCFINANC) AND '+
                                          '   (M.DATALANCFINAN >= TO_DATE ('''+
                                          FormatDateTime('dd/mm/yyyy',dDataInicial)+
                                                         ''',''dd/mm/yyyy'')) AND '+
                                          '   (M.DATALANCFINAN <= TO_DATE ('''+
                                          FormatDateTime('dd/mm/yyyy',dDataFinal)+
                                                         ''',''dd/mm/yyyy'')) AND  '+
                                          '   (R.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND '+
                                          '   (M.CODPORTADOR = C.CODPORTADOR) AND '+
                                          '   ((C.FLGGRAVAFLUXO = ''S'') OR '+
                                          '    (C.FLGGRAVAFLUXO IS NULL)) AND '+
                                          '   (M.STATUSCONCILIA <> ''C'') ')
            else
               cdsAux.Data:=GetDataPacket('SELECT '+
                                          '   M.DATALANCFINAN, '+
                                          '   M.HISTORICO, '+
                                          '   M.NUMCHQBORDERO, '+
                                          '   R.* '+
                                          'FROM '+
                                          '   RATEIOFINANC R, '+
                                          '   MOVIMFINANC M, '+
                                          '   PORTADORCONTA C '+
                                          'WHERE '+
                                          '   (M.CODLANCFINANC = R.CODLANCFINANC) AND '+
                                          '   (M.DATALANCFINAN > TO_DATE ('''+
                                          FormatDateTime('dd/mm/yyyy',dDataInicial)+
                                                         ''',''dd/mm/yyyy'')) AND '+
                                          '   (M.DATALANCFINAN <= TO_DATE ('''+
                                          FormatDateTime('dd/mm/yyyy',dDataFinal)+
                                                         ''',''dd/mm/yyyy'')) AND  '+
                                          '   (R.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND '+
                                          '   (M.CODPORTADOR = C.CODPORTADOR) AND '+
                                          '   ((C.FLGGRAVAFLUXO = ''S'') OR '+
                                          '    (C.FLGGRAVAFLUXO IS NULL)) AND '+
                                          '   (M.STATUSCONCILIA <> ''C'') ');

            iMaxProgresso:=cdsAux.RecordCount;
            cdsAux.First;
            while not(cdsAux.Eof)do
            begin
               //Chama a rotina atualizadora da Progressbar
               try
                  IAppCliente.ProgressoCFinan(iMaxProgresso,'Buscando dados do Movimento Financeiro');
               except
                  //
               end;

               Result:=CtrlFinanc.GravaFluxoPrev(cdsAux.FieldByName('CODCENTRORESPON').AsString,
                                                 cdsAux.FieldByName('CODTIPRECDES').AsString,
                                                 cdsAux.FieldByName('RECPAG').AsString,'S',
                                                 cdsAux.FieldByName('DATALANCFINAN').AsDateTime,
                                                 cdsAux.FieldByName('UNIDNEGOC').AsFloat,
                                                 cdsAux.FieldByName('VALOR').AsFloat,
                                                 cdsAux.FieldByName('CODCENTROCUSTO').AsString,
                                                 F_rIDPessoa,0,0,0,
                                                 cdsAux.FieldByName('CODTIPDOC').AsFloat,
                                                 bGeraDetFlxPrev,
                                                 CMTranslate('Movimento Financeiro'),'',
                                                 CMTranslate('Efetivo'),
                                                 cdsAux.FieldByName('HISTORICO').AsString,
                                                 cdsAux.FieldByName('NUMCHQBORDERO').AsString);
               if not(Result) then
               begin
                  MessageInfo:=CtrlFinanc.MessageInfo;
                  Rollback;
                  Exit;
               end;

               cdsAux.Next;
            end; //---------------------- Fim de Dados vindos do Movimento Financeiro

            //----- Alteração das datas para o caso de geração de fluxo previsto com datas passadas
            if (dDataInicial<date) then dDataInicial:=Date;

            if (dDataFinal>=date) then
            begin
               //----------------------Início Dados vindos do CAP/CAR

               //Chama a rotina atualizadora da Progressbar
               try
                  IAppCliente.ProgressoCFinan(0,'Buscando dados do Contas a Pagar/Receber...');
               except
                  //
               end;

               rCodLancFinancAux:=0;
               cdsDocumento:=TCMClientDataSet.Create(nil);
               try
                  //Carrega cdsDocumento
                  with sSql.SQL do
                  begin
                     sSql.SQL.Clear;
                     Add(' SELECT ');
                     Add('    U.DATAPROGRAMADA, ');
                     Add('    U.MOECODIGO, ');

                     if bGeraDetFlxPrev then Add('    U.CODDOCUMENTO, ');

                     Add('    U.CODTIPDOC, ');
                     Add('    U.OPERACAO,  ');
                     Add('    U.CODPORTFORMA, ');
                     Add('    U.RECPAG, ');
                     Add('    U.IDPESSOA, ');
                     Add('    U.CODTIPRECDES, ');
                     Add('    U.CODCENTROCUSTO, ');
                     Add('    U.CODCENTRORESPON, ');
                     Add('    U.UNIDNEGOC, ');
                     Add('    SUM(U.SALDO) AS SALDO, ');
                     Add('    SUM(U.SALDOOM) AS SALDOOM ');
                     Add(' FROM ');
                     Add('   (SELECT ');
                     Add('       D.CODDOCUMENTO, ');
                     Add('       ROUND(R.PERC*100,4) AS PERC, ');
                     Add('       D.DATAPROGRAMADA, ');
                     Add('       D.MOECODIGO, ');
                     Add('       D.CODTIPDOC, ');
                     Add('       D.OPERACAO, ');
                     Add('       D.CODPORTFORMA, ');
                     Add('       R.RECPAG, ');
                     Add('       R.IDPESSOA, ');
                     Add('       R.CODTIPRECDES, ');
                     Add('       R.CODCENTROCUSTO, ');
                     Add('       R.CODCENTRORESPON, ');
                     Add('       R.UNIDNEGOC, ');
                     Add('       SUM(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''C'',L.VALOR,-L.VALOR), ');
                     Add('                                 DECODE(L.DEBCRE,''D'',L.VALOR,-L.VALOR)))*R.PERC AS SALDO, ');
                     Add('       SUM(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,-L.VALOROUTRAMOEDA), ');
                     Add('                                 DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,-L.VALOROUTRAMOEDA)))*R.PERC AS SALDOOM ');
                     Add('    FROM ');
                     Add('       DOCUMENTO D, ');
                     Add('       LANCTODOCUM L, ');
                     Add('      (SELECT ');
                     Add('          R.CODDOCUMENTO, ');
                     Add('          R.RECPAG, ');
                     Add('          R.IDPESSOA, ');
                     Add('          R.CODTIPRECDES, ');
                     Add('          R.CODCENTROCUSTO, ');
                     Add('          R.CODCENTRORESPON, ');
                     Add('          R.UNIDNEGOC, ');
                     Add('         (SUM(R.VALOR)/T.VALORTOTAL) AS PERC ');
                     Add('       FROM ');
                     Add('          RATEIODOCUM R, ');
                     Add('         (SELECT ');
                     Add('             D.CODDOCUMENTO, ');
                     Add('             SUM(L.VALOR) AS VALORTOTAL ');
                     Add('          FROM ');
                     Add('             DOCUMENTO D, ');
                     Add('             LANCTODOCUM L ');
                     Add('          WHERE ');
                     Add('            (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ');
                     Add('            (D.OPERACAO = L.OPERACAO) AND ');
                     Add('            (D.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND ');

                     if not(bGeraAtrasados) then
                        Add('            (D.DATAPROGRAMADA >= TO_DATE ('''+
                            FormatDateTime('dd/mm/yyyy',dDataInicial-10)+''',''DD/MM/YYYY'')) AND ');

                     Add('            (D.DATAPROGRAMADA <= TO_DATE ('''+
                         FormatDateTime('dd/mm/yyyy',dDataFinal+10)+''',''DD/MM/YYYY'')) AND ');

                     Add('            (L.ESTORNO IS NULL) AND ');
                     Add('            (L.VALOR <> 0) AND ');
                     Add('            (D.OPERACAO IN (''1 '',''2 '',''10'',''11'',''12'',''14'')) ');
                     Add('          GROUP BY D.CODDOCUMENTO) T ');
                     Add('       WHERE ');
                     Add('         (T.CODDOCUMENTO = R.CODDOCUMENTO) AND ');
                     Add('         (T.VALORTOTAL <> 0)  ');
                     Add('       GROUP BY ');
                     Add('          R.CODDOCUMENTO, R.RECPAG, R.IDPESSOA, T.VALORTOTAL,  ');
                     Add('          R.CODTIPRECDES, R.CODCENTROCUSTO,R.CODCENTRORESPON, ');
                     Add('          R.UNIDNEGOC) R ');
                     Add(' WHERE ');
                     Add('   (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ');
                     Add('   (D.CODDOCUMENTO = R.CODDOCUMENTO) AND ');
                     Add('   (D.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND ');

                     if not(bGeraAtrasados) then
                        Add('   (D.DATAPROGRAMADA >= TO_DATE ('''+
                            FormatDateTime('dd/mm/yyyy',dDataInicial-10)+''',''DD/MM/YYYY'')) AND ');

                     Add('   (D.DATAPROGRAMADA <= TO_DATE ('''+
                         FormatDateTime('dd/mm/yyyy',dDataFinal+10)+''',''DD/MM/YYYY'')) AND ');
                     Add('   (L.OPERACAO <> ''16'') AND      ');
                     Add('   ((D.STATUS < ''2'') OR (D.STATUS IS NULL)) ');
                     Add(' GROUP BY ');
                     Add('    D.CODDOCUMENTO, ');
                     Add('    D.DATAPROGRAMADA,D.MOECODIGO, ');
                     Add('    D.CODTIPDOC,D.OPERACAO, ');
                     Add('    D.CODPORTFORMA, ');
                     Add('    R.RECPAG, R.IDPESSOA, ');
                     Add('    R.CODTIPRECDES, R.CODCENTROCUSTO, ');
                     Add('    R.CODCENTRORESPON, R.UNIDNEGOC,R.PERC ');
                     Add('UNION ALL   ');
                     Add(' SELECT ');
                     Add('    D.CODDOCUMENTO, ');
                     Add('    ROUND(R.PERC*100,4) AS PERC, ');
                     Add('    D.DATAPROGRAMADA, ');
                     Add('    D.MOECODIGO, ');
                     Add('    D.CODTIPDOC, ');
                     Add('    D.OPERACAO, ');
                     Add('    D.CODPORTFORMA, ');
                     Add('    R.RECPAG, ');
                     Add('    R.IDPESSOA, ');
                     Add('    R.CODTIPRECDES, ');
                     Add('    R.CODCENTROCUSTO, ');
                     Add('    R.CODCENTRORESPON, ');
                     Add('    R.UNIDNEGOC, ');
                     Add('    SUM(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''C'',L.VALOR,-L.VALOR),                     ');
                     Add('                              DECODE(L.DEBCRE,''D'',L.VALOR,-L.VALOR)))*R.PERC AS SALDO,     ');
                     Add('    SUM(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,-L.VALOROUTRAMOEDA), ');
                     Add('                              DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,-L.VALOROUTRAMOEDA)))*R.PERC AS SALDOOM ');
                     Add(' FROM ');
                     Add('    DOCUMENTO D, ');
                     Add('    LANCTODOCUM L, ');
                     Add('   (SELECT ');
                     Add('       D.NUMFATURA, ');
                     Add('       R.RECPAG, ');
                     Add('       R.IDPESSOA, ');
                     Add('       R.CODTIPRECDES, ');
                     Add('       R.CODCENTROCUSTO, ');
                     Add('       R.CODCENTRORESPON, ');
                     Add('       R.UNIDNEGOC, ');
                     Add('      (SUM(R.VALOR)/T.VALORTOTAL) AS PERC ');
                     Add('    FROM ');
                     Add('       RATEIODOCUM R, ');
                     Add('       DOCUMENTO D, ');
                     Add('      (SELECT ');
                     Add('          D.NUMFATURA, ');
                     Add('          SUM(L.VALOR) AS VALORTOTAL ');
                     Add('       FROM ');
                     Add('          DOCUMENTO D, ');
                     Add('          LANCTODOCUM L ');
                     Add('       WHERE ');
                     Add('         (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ');
                     Add('         (D.OPERACAO = L.OPERACAO) AND ');
                     Add('         (L.ESTORNO IS NULL) AND ');
                     Add('         (D.NUMFATURA IS NOT NULL) AND ');
                     Add('         (D.OPERACAO IN (''1 '',''11'')) ');
                     Add('       GROUP BY D.NUMFATURA) T ');
                     Add('    WHERE ');
                     Add('      (T.NUMFATURA = D.NUMFATURA) AND ');
                     Add('      (T.VALORTOTAL <> 0) AND ');
                     Add('      (D.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND ');
                     Add('      (D.CODDOCUMENTO = R.CODDOCUMENTO) AND ');
                     Add('      (D.OPERACAO IN (''1 '',''11'')) ');
                     Add('    GROUP BY ');
                     Add('       D.NUMFATURA, R.RECPAG, R.IDPESSOA, T.VALORTOTAL,R.CODTIPRECDES, ');
                     Add('       R.CODCENTROCUSTO,R.CODCENTRORESPON, R.UNIDNEGOC) R  ');
                     Add(' WHERE ');
                     Add('   (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ');
                     Add('   (D.NUMFATURA = R.NUMFATURA) AND ');
                     Add('   (D.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND ');

                     if not(bGeraAtrasados) then
                     Add('   (D.DATAPROGRAMADA >= TO_DATE ('''+
                         FormatDateTime('dd/mm/yyyy',dDataInicial-10)+''',''DD/MM/YYYY'')) AND ');

                     Add('   (D.DATAPROGRAMADA <= TO_DATE ('''+
                         FormatDateTime('dd/mm/yyyy',dDataFinal+10)+''',''DD/MM/YYYY'')) AND ');

                     Add('   ((D.STATUS < ''2'') OR (D.STATUS IS NULL)) AND ');
                     Add('   (D.OPERACAO IN (''3 '',''13'')) ');
                     Add(' GROUP BY ');
                     Add('    D.CODDOCUMENTO, ');
                     Add('    D.DATAPROGRAMADA, ');
                     Add('    D.MOECODIGO, ');
                     Add('    D.CODTIPDOC, ');
                     Add('    D.OPERACAO, ');
                     Add('    D.CODPORTFORMA, ');
                     Add('    R.RECPAG, ');
                     Add('    R.IDPESSOA, ');
                     Add('    R.CODTIPRECDES, ');
                     Add('    R.CODCENTROCUSTO, ');
                     Add('    R.CODCENTRORESPON, ');
                     Add('    R.UNIDNEGOC, ');
                     Add('    R.PERC ) U  ');
                     Add('GROUP BY ');
                     Add('   U.DATAPROGRAMADA, ');
                     Add('   U.MOECODIGO, ');
                     Add('   U.CODTIPDOC, ');

                     if bGeraDetFlxPrev then Add('   U.CODDOCUMENTO, ');

                     Add('   U.CODPORTFORMA,U.OPERACAO, ');
                     Add('   U.RECPAG, U.IDPESSOA, ');
                     Add('   U.CODTIPRECDES, U.CODCENTROCUSTO,U.CODCENTRORESPON, U.UNIDNEGOC ');
                     Add('ORDER BY U.DATAPROGRAMADA ');

                     //sSql.SQL.SaveToFile('C:\ProjetosCM7\CFinan\FlxPrev.txt');

                     sSql.ControlObject:=Self;
                     cdsDocumento.Data:=sSql.Data;
                  end;

                  iMaxProgresso:=cdsDocumento.RecordCount;

                  cdsDocumento.First;
                  while not(cdsDocumento.Eof) do
                  begin
                     rDMais:=0;
                     bLanca:=True;

                     //Chama a rotina atualizadora da Progressbar
                     try
                        IAppCliente.ProgressoCFinan(iMaxProgresso,
                                                    'Buscando dados do Contas a Pagar/Receber...');
                     except
                        //
                     end;

                     if (cdsDocumento.FieldByName('CODPORTFORMA').AsFloat<>0) then
                     begin
                        cdsAux.Close;
                        cdsAux.Data:=GetDataPacket('SELECT DMAIS FROM PORTADORFORMA '+
                                                   'WHERE (CODPORTFORMA = '+
                                                   FloatToStr(cdsDocumento.FieldByName('CODPORTFORMA').AsFloat)+') ');

                        if (cdsDocumento.FieldByName('RECPAG').asString='P') then
                           rDMais:=-cdsAux.FieldByName('DMAIS').AsFloat
                        else
                           rDMais:=cdsAux.FieldByName('DMAIS').AsFloat;

                        if (cdsAux.FieldByName('DMAIS').AsFloat=999) then bLanca:=False;
                     end;

                     if bLanca then
                     begin
                        //Na função PrimeiroDiaUtilPosterior, a DataProgramada foi subtraída de 1 para
                        //que a mesma testa a data corrente e não a data do dia seguinte.
                        //Data que o cliente paga
                        dDataAux:=DiasUteis.PrimeiroDiaUtilPosterior(Trunc(F_rIDPessoa),
                                  (cdsDocumento.FieldByName('DATAPROGRAMADA').AsDateTime-1),True,True,False);
                        //Data que o hotel recebe
                        dDataAux:=DiasUteis.PrimeiroDiaUtilPosterior(Trunc(F_rIDPessoa),
                                  (dDataAux+rDMais-1),True,True,False);

                        rValor:=cdsDocumento.FieldByName('SALDO').AsFloat;
                        if (cdsDocumento.FieldByName('MOECODIGO').AsFloat<>0) then
                        begin
                           GeralFinanc.TestaCotacaoMoeda(cdsDocumento.FieldByName('MOECODIGO').AsFloat,
                                                         dDataAux,False,rValorCotacao,rNumDecimais);
                           if (rValorCotacao<>0) then
                               rValor:=cdsDocumento.FieldByName('SALDOOM').AsFloat*rValorCotacao;
                        end;

                        //Data dos Atrasados
                        if (dDataAux<dDataInicial) and (bGeraAtrasados) then
                        begin
                           dDataAux:=(dDataInicial-1);

                           bLanca:=not((cdsDocumento.FieldByName('OPERACAO').AsString = '12') or
                                       (cdsDocumento.FieldByName('OPERACAO').AsString = '11') or
                                       (cdsDocumento.FieldByName('OPERACAO').AsString = '13'));
                        end;

                        if bLanca and ((bGeraAtrasados) or not(dDataAux<dDataInicial)) then
                        //if not((dDataAux<dDataInicial) and not(bGeraAtrasados)) then
                        begin
                           if (dDataAux<=dDataFinal) and
                               not((dDataAux < Date) and (bConsMovRealFP)) then
                           begin
                              if (cdsDocumento.FieldByName('OPERACAO').AsString = '12') or
                                 (cdsDocumento.FieldByName('OPERACAO').AsString = '11') or
                                 (cdsDocumento.FieldByName('OPERACAO').AsString = '13') then
                                  sTipo := CMTranslate('Previsto')
                              else
                                 sTipo := CMTranslate('Efetivo');
                                 sRazaoSocial := '';

                              sComplDoc    := '';
                              sHistorico   := '';
                              sNoDocumento := '';

                              if bGeraDetFlxPrev then
                              begin
                                 cdsAux.Data:=GetDataPacket(' SELECT '+
                                                     '    P.RAZAOSOCIAL, '+
                                                     '    D.COMPLDOCUMENTO, '+
                                                     '    L.HISTORICOCOMPL, '+
                                                     '    D.NODOCUMENTO '+
                                                     ' FROM '+
                                                     '    DOCUMENTO D, '+
                                                     '    LANCTODOCUM L, '+
                                                     '    PESSOA P '+
                                                     ' WHERE '+
                                                     '   (D.CODDOCUMENTO = L.CODDOCUMENTO) AND '+
                                                     '   (D.OPERACAO = L.OPERACAO) AND '+
                                                     '   (D.IDFORCLI = P.IDPESSOA) AND '+
                                                     '   (D.CODDOCUMENTO = '+
                                                     cdsDocumento.FieldByName('CODDOCUMENTO').AsString+')');

                                 sRazaoSocial:=cdsAux.FieldByName('RAZAOSOCIAL').AsString;
                                 sComplDoc:=cdsAux.FieldByName('COMPLDOCUMENTO').AsString;
                                 sHistorico:=cdsAux.FieldByName('HISTORICOCOMPL').AsString;
                                 sNoDocumento:=cdsAux.FieldByName('NODOCUMENTO').AsString;
                              end;

                              Result:=CtrlFinanc.GravaFluxoPrev(
                                            cdsDocumento.FieldByName('CODCENTRORESPON').AsString,
                                            cdsDocumento.FieldByName('CODTIPRECDES').AsString,
                                            cdsDocumento.FieldByName('RECPAG').AsString,'S',
                                            dDataAux,
                                            cdsDocumento.FieldByName('UNIDNEGOC').AsFloat,
                                            rValor,
                                            cdsDocumento.FieldByName('CODCENTROCUSTO').AsString,
                                            F_rIDPessoa,0,0,0,
                                            cdsDocumento.FieldByName('CODTIPDOC').AsFloat,
                                            bGeraDetFlxPrev,sRazaoSocial,sComplDoc,
                                            sTipo,sHistorico,sNoDocumento);

                              if not(Result) then
                              begin
                                 MessageInfo:=CtrlFinanc.MessageInfo;
                                 Rollback;
                                 Exit;
                              end;
                           end;
                        end;
                     end;

                     cdsDocumento.Next;
                  end;
               finally
                  cdsDocumento.Free;
               end;
               //----------------------Fim Dados vindos do CAP/CAR

               //----------------------Início Dados vindos do Orçamento
               cdsOrcamento:=TCMClientDataSet.Create(nil);
               try
                  //Carrega cds de Orçamentos
                  with sSql.SQL do
                  begin
                     sSql.SQL.Clear;
                     Add(' SELECT ');
                     Add('    IDCONTAORCAMEN, ');
                     Add('    IDPLANOORCAMEN, ');
                     Add('    TO_NUMBER(DECODE(FLGRESCOMP,''C'', (VLRRESERVA - VLRCOMPROMISSO), '+
                                                      ' VLRRESERVA)) AS VALOR, ');
                     Add('   DATAREFERENCIA, ');
                     Add('   FLGRESCOMP ');
                     Add('FROM ');
                     Add('   RESERVAORCAMEN ');
                     Add('WHERE ');
                     Add('   ((FLGRESCOMP = ''C'' ) OR ');
                     Add('    (FLGRESCOMP = ''R'' )) AND ');
                     Add('   (FLGRESERVA = ''A'' ) AND ');
                     Add('   (DATAREFERENCIA >= TO_DATE('''+
                              FormatDateTime('dd/mm/yyyy',dDataInicial)+''','+
                              '''DD/MM/YYYY'')) AND ');
                     Add('   (DATAREFERENCIA <= TO_DATE('''+
                              FormatDateTime('dd/mm/yyyy',dDataFinal)+''','+
                              '''DD/MM/YYYY'')) AND ');
                     Add('   (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ');

                     sSql.ControlObject:=Self;
                     cdsOrcamento.Data:=sSql.Data;
                  end;

                  iMaxProgresso:=cdsOrcamento.RecordCount;
                  cdsOrcamento.First;
                  while not(cdsOrcamento.Eof) do
                  begin
                     cdsAux.Close;

                     //Chama a rotina atualizadora da Progressbar
                     try
                        IAppCliente.ProgressoCFinan(iMaxProgresso,
                                                    'Buscando dados do Orçamento...');
                     except
                        //
                     end;

                     with sSql.SQL do
                     begin
                        sSql.SQL.Clear;
                        Add('SELECT ');
                        Add('   P.NUMLINHAS, ');
                        Add('   C.CODTIPRECDES, ');
                        Add('   C.RECPAG, ');
                        Add('   C.CODCENTRORESPON, ');
                        Add('   C.UNIDNEGOC, ');
                        Add('   C.CODCENTROCUSTO, ');
                        Add('   C.IDPATRO, ');
                        Add('   C.IDPLANOPREV, ');
                        Add('   C.CODTIPDOC, ');
                        Add('   CO.IDCONTAORCAMEN||''-''||CO.NOMECONTAORCAMEN ');
                        Add('   AS HISTORICO ');
                        Add('FROM ');
                        Add('   COMPCONTASORCAMEN C, ');
                        Add('   CONTASORCAMEN CO, ');
                        Add('   (SELECT COUNT(*) AS NUMLINHAS ');
                        Add('    FROM COMPCONTASORCAMEN ');
                        Add('    WHERE (IDPLANOORCAMEN = '+
                                   FloatToStr(cdsOrcamento.FieldByName('IDPLANOORCAMEN').AsFloat)+') AND ');
                        Add('          (IDCONTAORCAMEN = '+
                                   FloatToStr(cdsOrcamento.FieldByName('IDCONTAORCAMEN').AsFloat)+')) P ');
                        Add('WHERE ');
                        Add('   (C.IDPLANOORCAMEN = CO.IDPLANOORCAMEN) AND ');
                        Add('   (C.IDCONTAORCAMEN = CO.IDCONTAORCAMEN) AND ');
                        Add('   (C.IDPLANOORCAMEN = '+
                                 FloatToStr(cdsOrcamento.FieldByName('IDPLANOORCAMEN').AsFloat)+') AND ');
                        Add('   (C.IDCONTAORCAMEN = '+
                                 FloatToStr(cdsOrcamento.FieldByName('IDCONTAORCAMEN').AsFloat)+')');

                        sSql.ControlObject:=Self;
                        cdsAux.Data:=sSql.Data;
                     end;

                     dDataAux:=cdsOrcamento.FieldByName('DATAREFERENCIA').asDateTime;
                     //Corrige a Data caso a mesma seja de um Sábado ou de um Domingo
                     if (DayOfWeek(dDataAux)=1) then dDataAux:=dDataAux+1;
                     if (DayOfWeek(dDataAux)=7) then dDataAux:=dDataAux+2;

                     cdsAux.First;  //Composição
                     while not(cdsAux.Eof) do
                     begin

                        rSaldoCorrente:=(cdsOrcamento.FieldByName('VALOR').AsFloat/
                                         cdsAux.FieldByName('NUMLINHAS').AsFloat);

                        if cdsAux.FieldByName('CODCENTRORESPON').isNull then
                           sCentroResponAux:=sCentroResponGlb
                        else
                           sCentroResponAux:=cdsAux.FieldByName('CODCENTRORESPON').AsString;

                        if cdsAux.FieldByName('UNIDNEGOC').isNull then
                           rUnidNegAux:=rUnidNegGlb
                        else
                           rUnidNegAux:=cdsAux.FieldByName('UNIDNEGOC').AsFloat;

                        Result:=CtrlFinanc.GravaFluxoPrev(sCentroResponAux,
                                                          cdsAux.FieldByName('CODTIPRECDES').AsString,
                                                          cdsAux.FieldByName('RECPAG').AsString,'S',
                                                          dDataAux,rUnidNegAux,rSaldoCorrente,
                                                          cdsAux.FieldByName('CODCENTROCUSTO').AsString,
                                                          F_rIDPessoa,0,
                                                          cdsAux.FieldByName('IDPATRO').AsFloat,
                                                          cdsAux.FieldByName('IDPLANOPREV').AsFloat,
                                                          cdsAux.FieldByName('CODTIPDOC').AsFloat,
                                                          bGeraDetFlxPrev,'Orçamento','','Previsto',
                                                          cdsAux.FieldByName('HISTORICO').AsString,'');
                        if not(Result) then
                        begin
                           MessageInfo:=CtrlFinanc.MessageInfo;
                           Rollback;
                           Exit;
                        end;

                        cdsAux.Next;
                     end; //Fim Composição
                     cdsOrcamento.Next;
                  end;
               finally
                  cdsOrcamento.Free;
               end; //----------------------Fim Dados vindos do Orçamento

               //----------------------Início Dados vindos da Previsão de Receita Diária (Hotéis)
               if (FTipoEmpresa<>'P') then
               begin
                  cdsAux.Close;
                  cdsAux.Data:=GetDataPacket('SELECT '+
                                             '   T.CODCENTRORESPON, '+
                                             '   T.CODTIPRECDES, '+
                                             '   T.RECPAG, '+
                                             '   T.UNIDNEGOC, '+
                                             '   T.CODTIPDOC, '+
                                             '   T.CENTROCUSTOCREDIT , '+
                                             '   T.IDPESSOA '+
                                             'FROM '+
                                             '   TIPODEBCREDHOTEL T , '+
                                             '   HOTEL H, '+
                                             '   PARAMHOTEL P '+
                                             'WHERE '+
                                             '   (H.IDHOTEL = T.IDHOTEL) AND '+
                                             '   (H.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND '+
                                             '   (T.CODTIPRECDES IS NOT NULL) AND '+
                                             '   (P.IDHOTEL = T.IDHOTEL) AND '+
                                             '   (P.IDTIPODCDIARIA = T.IDTIPODEBCRED) ');

                  if  not(cdsAux.IsEmpty) then
                   begin
                      cdsPrevReceitaDia:=TCMClientDataSet.Create(nil);
                      try
                         cdsPrevReceitaDia.data:=GetDataPacket('SELECT '+
                                                 '   DATA, '+
                                                 '   SUM(DECODE(R.STATUSRESERVA,7,0, '+
                                                 '       R.VLRDIARIA* (1 - (R.PERCDESCONTODIARIA/100)))) '+
                                                 '       AS VALOR '+
                                                 'FROM '+
                                                 '   DATASIS D, '+
                                                 '   RESERVAREDUZ RD, '+
                                                 '   RESERVASFRONT R '+
                                                 'WHERE '+
                                                 '   (D.DATA >= TO_DATE('''+
                                                        FormatDateTime('dd/mm/yyyy',dDataInicial)+''','+
                                                        '''DD/MM/YYYY'')) AND '+
                                                 '   (D.DATA <= TO_DATE('''+
                                                       FormatDateTime('dd/mm/yyyy',dDataFinal)+''','+
                                                       '''DD/MM/YYYY'')) AND '+
                                                 '   (D.IDHOTEL IN (SELECT IDHOTEL '+
                                                 '                  FROM HOTEL '+
                                                 '                  WHERE (IDPESSOA = '+
                                                      FloatToStr(F_rIDPessoa)+'))) AND '+
                                                 '   (RD.DATACHEGADA <= D.DATA) AND '+
                                                 '   (RD.DATAPARTIDA > D.DATA) AND '+
                                                 '   (RD.IDHOTEL = D.IDHOTEL) AND '+
                                                 '   (R.IDRESERVASFRONT = RD.IDRESERVASFRONT) AND '+
                                                 '   ((R.CODUH IS NULL) OR '+
                                                 '    (R.CODUH IN (SELECT U.CODUH '+
                                                 '                 FROM UH U '+
                                                 '                 WHERE '+
                                                 '                    (U.CODUH = R.CODUH) AND '+
                                                 '                    (U.IDHOTEL = R.IDHOTEL) AND '+
                                                 '                    (U.UHPOOL = ''S''))) OR '+
                                                 '    (R.CODUH IN (SELECT PF.CODUH '+
                                                 '                 FROM POOLFLUTUANTE PF '+
                                                 '                 WHERE '+
                                                 '                    (PF.CODUH = R.CODUH) AND '+
                                                 '                    (PF.IDHOTEL = R.IDHOTEL) AND '+
                                                 '                    (PF.DATAINICIO <= DATA) AND '+
                                                 '                    (PF.DATAFIM > DATA)))) '+
                                                 'GROUP BY DATA ');

                         iMaxProgresso:=cdsPrevReceitaDia.RecordCount;
                         cdsPrevReceitaDia.First;
                         while not(cdsPrevReceitaDia.Eof) do
                         begin

                            //Chama a rotina atualizadora da Progressbar
                            try
                               IAppCliente.ProgressoCFinan(iMaxProgresso,
                                                           'Buscando dados da Previsão de Receita Diária...');
                            except
                               //
                            end;

                            Result:=CtrlFinanc.GravaFluxoPrev(cdsAux.FieldByName('CODCENTRORESPON').AsString,
                                                              cdsAux.FieldByName('CODTIPRECDES').AsString,
                                                              cdsAux.FieldByName('RECPAG').AsString,'S',
                                                              cdsPrevReceitaDia.FieldByName('DATA').AsDateTime,
                                                              cdsAux.FieldByName('UNIDNEGOC').AsFloat,
                                                              cdsPrevReceitaDia.FieldByName('VALOR').AsFloat,
                                                              cdsAux.FieldByName('CENTROCUSTOCREDIT').AsString,
                                                              F_rIDPessoa,0,0,0,
                                                              cdsAux.FieldByName('CODTIPDOC').AsFloat,
                                                              bGeraDetFlxPrev,
                                                              'Receita Front','','Previsto','','');
                            if not(Result) then
                            begin
                               MessageInfo:=CtrlFinanc.MessageInfo;
                               Rollback;
                               Exit;
                            end;

                            cdsPrevReceitaDia.Next;
                         end;
                      finally
                         cdsPrevReceitaDia.Free;
                      end;
                   end;
               end;//----------------------Fim Dados vindos da Previsão de Receita Diária (Hotéis)

               //----------------------Início Dados vindos do Contratos e Projetos
               with sSql.SQL do
               begin
                  sSql.SQL.Clear;
                  Add('SELECT ');
                  Add('   C.IDCONTRATO, ');
                  Add('   C.IDPESSOA, ');
                  Add('   RCC.CODCENTROCUSTO, ');
                  Add('   C.CODCENTRORESPON, ');
                  Add('   C.CODTIPDOC, ');
                  Add('   OXI.CODTIPRECDES, ');
                  Add('   OXI.RECPAG, ');
                  Add('   C.UNIDNEGOC, ');
                  Add('   ((OIC.QTDEITEM*OIC.VALORUNITARIOOBJETO*RCC.PERCRATEIOCONTR)/100) AS VALOR, ');
                  Add('   RCC.PERCRATEIOCONTR, ');
                  Add('   OIC.NUMPARCELAS, ');
                  Add('   OIC.INTERVALO, ');
                  Add('   OIC.FREQUENCIA, ');
                  Add('  (OIC.NUMPARCELAS-NVL(NP.NUMPARC,0)) AS NUMPARCREST,');
                  Add('   DECODE(OIC.FREQUENCIA,''D'',(OIC.DATAINICIOCOBR+(NVL(OIC.INTERVALO,0)*NVL(NP.NUMPARC,0))), ');
                  Add('                         ''M'',ADD_MONTHS(OIC.DATAINICIOCOBR,(NVL(OIC.INTERVALO,0)*NVL(NP.NUMPARC,0))), ');
                  Add('                         ''A'',ADD_MONTHS(OIC.DATAINICIOCOBR,(12*(NVL(OIC.INTERVALO,0)*NVL(NP.NUMPARC,0))))) AS DATAINICIO, ');
                  Add('   DECODE(OIC.FREQUENCIA,''D'',(OIC.DATAINICIOCOBR+(NVL(OIC.INTERVALO,0)*(OIC.NUMPARCELAS-1))), ');
                  Add('                         ''M'',ADD_MONTHS(OIC.DATAINICIOCOBR,(NVL(OIC.INTERVALO,0)*(OIC.NUMPARCELAS-1))), ');
                  Add('                         ''A'',ADD_MONTHS(OIC.DATAINICIOCOBR,(12*(NVL(OIC.INTERVALO,0)*(OIC.NUMPARCELAS-1))))) AS DATAFIM ');
                  Add('FROM ');
                  Add('   CONTRATOCONTR C, ');
                  Add('   OBJETOSXITEMCONTR OIC, ');
                  Add('   OBJETOXITEM OXI, ');
                  Add('   ITEMCONTRATUAL IC, ');
                  Add('   RATEIOCENTROCUSTO RCC, ');
                  Add('  (SELECT ');
                  Add('      PR.IDCONTRATO, ');
                  Add('      PR.IDOBJETO, ');
                  Add('      PR.IDITEM, ');
                  Add('      PR.IDPESSOA, ');
                  Add('      COUNT(*) AS NUMPARC, ');
                  Add('      MAX(PR.DATAVENCPARCELA) AS ULTDATA ');
                  Add('   FROM ');
                  Add('      PARCELAREALCONTR PR, ');
                  Add('      OBJETOSXITEMCONTR OXI ');
                  Add('   WHERE ');
                  Add('     (PR.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND ');
                  Add('     (PR.IDCONTRATO = OXI.IDCONTRATO) AND ');
                  Add('     (PR.IDOBJETO = OXI.IDOBJETO) AND ');
                  Add('     (PR.IDITEM = OXI.IDITEM) AND ');
                  Add('     (PR.DATAVENCPARCELA >= OXI.DATAINICIOCOBR) AND ');
                  Add('     (PR.IDPESSOA = OXI.IDPESSOA) ');
                  Add('   GROUP BY PR.IDCONTRATO,PR.IDOBJETO,PR.IDITEM,PR.IDPESSOA) NP ');
                  Add('WHERE ');
                  Add('  (C.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND ');
                  Add('  (IC.TIPOCOBRANCA IN (''PS'',''PQ'',''PV'')) AND ');

                  Add('  (C.IDCONTRATO = OIC.IDCONTRATO) AND ');
                  Add('  (C.IDPESSOA = OIC.IDPESSOA) AND ');

                  Add('  (OIC.IDITEM = IC.IDITEM) AND ');
                  Add('  (OIC.IDPESSOA = IC.IDPESSOA) AND ');

                  Add('  (OIC.IDCONTRATO = RCC.IDCONTRATO) AND ');
                  Add('  (OIC.IDITEM = RCC.IDITEM) AND ');
                  Add('  (OIC.IDOBJETO = RCC.IDOBJETO) AND ');
                  Add('  (OIC.IDPESSOA = RCC.IDEMPRESA) AND ');

                  Add('  (OIC.IDITEM = OXI.IDITEM) AND ');
                  Add('  (OIC.IDOBJETO = OXI.IDOBJETO) AND ');
                  Add('  (OIC.IDPESSOA = OXI.IDPESSOA) AND ');

                  Add('  (OIC.IDCONTRATO = NP.IDCONTRATO(+)) AND ');
                  Add('  (OIC.IDOBJETO = NP.IDOBJETO(+)) AND ');
                  Add('  (OIC.IDITEM = NP.IDITEM(+)) AND ');
                  Add('  (OIC.IDPESSOA = NP.IDPESSOA(+)) AND ');
                  Add('  (OIC.NUMPARCELAS-NVL(NP.NUMPARC,0) > 0) AND ');
                  Add('  (((OIC.QTDEITEM*OIC.VALORUNITARIOOBJETO*RCC.PERCRATEIOCONTR)/100) > 0) ');

                  Add('ORDER BY ');
                  Add('   C.IDCONTRATO ');

                  sSql.ControlObject:=Self;
                  cdsAux.Data:=sSql.Data;

                  iMaxProgresso:=cdsAux.RecordCount;
                  cdsAux.First;
                  while not(cdsAux.Eof) do
                  begin
                     //Chama a rotina atualizadora da Progressbar
                     try
                        IAppCliente.ProgressoCFinan(iMaxProgresso,
                                    'Buscando dados do Contratos/Projetos');
                     except
                        //
                     end;

                     for iParcelaAux:=1 to cdsAux.FieldByName('NUMPARCREST').AsInteger do
                     begin
                        if (cdsAux.FieldByName('DATAINICIO').AsDateTime>=dDataInicial) and
                           (cdsAux.FieldByName('DATAINICIO').AsDateTime<=dDataFinal) then
                        begin
                           Result:=CtrlFinanc.GravaFluxoPrev(
                                       cdsAux.FieldByName('CODCENTRORESPON').AsString,
                                       cdsAux.FieldByName('CODTIPRECDES').AsString,
                                       cdsAux.FieldByName('RECPAG').AsString,
                                       'S',
                                       cdsAux.FieldByName('DATAINICIO').AsDateTime,
                                       cdsAux.FieldByName('UNIDNEGOC').AsFloat,
                                       cdsAux.FieldByName('VALOR').AsFloat,
                                       cdsAux.FieldByName('CODCENTROCUSTO').AsString,
                                       F_rIDPessoa,0,0,0,
                                       cdsAux.FieldByName('CODTIPDOC').AsFloat,
                                       False,'','','','','');
                           if not(Result) then
                           begin
                              MessageInfo:=CtrlFinanc.MessageInfo;
                              Rollback;
                              Exit;
                           end;
                        end
                        else
                           if (cdsAux.FieldByName('DATAINICIO').AsDateTime>dDataFinal) then Break;

                        //Atualiza a Data
                        sFormatoDataAux:=ShortDateFormat;
                        ShortDateFormat:='dd/mm/yyyy';
                        try
                           cdsAux.Edit;
                           //Atualiza Dia
                           if (cdsAux.FieldByName('FREQUENCIA').AsString='D') then
                               cdsAux.FieldByName('DATAINICIO').AsDateTime:=
                                           cdsAux.FieldByName('DATAINICIO').AsDateTime+1;

                           //Atualiza Mês
                           if (cdsAux.FieldByName('FREQUENCIA').AsString='M') then
                               cdsAux.FieldByName('DATAINICIO').AsDateTime:=
                                      IncMonth(cdsAux.FieldByName('DATAINICIO').AsDateTime);

                           //Atualiza Ano
                           if (cdsAux.FieldByName('FREQUENCIA').AsString='A') then
                               cdsAux.FieldByName('DATAINICIO').AsDateTime:=
                                      IncYear(cdsAux.FieldByName('DATAINICIO').AsDateTime);

                           cdsAux.Post;
                        finally
                           ShortDateFormat:=sFormatoDataAux;
                        end;
                     end; //End do FOR de parcelas

                     cdsAux.Next;
                  end;
               end; //----------------------Fim Dados vindos do Contratos e Projetos

               //----------------------Início Dados vindos da Previsão de Depósito do Front
               with sSql.SQL do
               begin
                  sSql.SQL.Clear;
                  Add('SELECT ');
                  Add('   P.DATA, ');
                  Add('   P.VALOR, ');
                  Add('   T.CODTIPRECDES, ');
                  Add('   T.RECPAG, ');
                  Add('   T.CENTROCUSTOPDV AS CODCENTROCUSTO, ');
                  Add('   T.CODCENTRORESPON, ');
                  Add('   T.CODTIPDOC, ');
                  Add('   T.UNIDNEGOC, ');
                  Add('   PS.NOME ');
                  Add('FROM ');
                  Add('   PARCDEPOSITOVHF P, ');
                  Add('   RESERVASFRONT R, ');
                  Add('   TIPODEBCREDHOTEL T, ');
                  Add('   PARAMHOTEL PH, ');
                  Add('   HOTEL H, ');
                  Add('   PESSOA PS ');
                  Add('WHERE ');
                  Add('  (P.FLGPAGO = ''N'') AND ');
                  Add('  (H.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND ');
                  Add('  (P.IDRESERVASFRONT = R.IDRESERVASFRONT) AND ');
                  Add('  (R.IDHOTEL = PH.IDHOTEL) AND ');
                  Add('  (PH.IDHOTEL = H.IDHOTEL) AND ');
                  Add('  (PH.IDTIPODCDEPOSITO = T.IDTIPODEBCRED) AND ');
                  Add('  (PH.IDHOTEL = T.IDHOTEL) AND ');
                  Add('  (PH.IDHOTEL = PS.IDPESSOA) AND ');
                  Add('  (P.DATA >= TO_DATE('''+
                      FormatDateTime('dd/mm/yyyy',dDataInicial)+''',''DD/MM/YYYY'')) AND ');
                  Add('  (P.DATA <= TO_DATE('''+
                      FormatDateTime('dd/mm/yyyy',dDataFinal)+''',''DD/MM/YYYY'')) ');

                  sSql.ControlObject:=Self;
                  cdsAux.Data:=sSql.Data;

                  iMaxProgresso:=cdsAux.RecordCount;
                  cdsAux.First;
                  while not(cdsAux.Eof) do
                  begin
                     //Chama a rotina atualizadora da Progressbar
                     try
                        IAppCliente.ProgressoCFinan(iMaxProgresso,
                                    'Buscando dados da Previsão de Depósito do Front');
                     except
                        //
                     end;

                     if (cdsAux.FieldByName('CODTIPDOC').AsFloat=0) then
                     begin
                        MessageInfo:='O parâmetro indicado em "Depósito", na guia "Tipo Débito/Crédito" '+#10#13+
                                     'dos Parâmetros do Sistema, não está com o Tipo de Documento '+#10#13+
                                     'preenchido (ver Cadastro de Tipo de Débito/Crédito). '+#10#13+
                                     '(Hotel: '+Trim(cdsAux.FieldByName('NOME').AsString)+')';
                        Result:=False;
                        Rollback;
                        Exit;
                     end;

                     Result:=CtrlFinanc.GravaFluxoPrev(
                                 cdsAux.FieldByName('CODCENTRORESPON').AsString,
                                 cdsAux.FieldByName('CODTIPRECDES').AsString,
                                 cdsAux.FieldByName('RECPAG').AsString,
                                 'S',
                                 cdsAux.FieldByName('DATA').AsDateTime,
                                 cdsAux.FieldByName('UNIDNEGOC').AsFloat,
                                 cdsAux.FieldByName('VALOR').AsFloat,
                                 cdsAux.FieldByName('CODCENTROCUSTO').AsString,
                                 F_rIDPessoa,0,0,0,
                                 cdsAux.FieldByName('CODTIPDOC').AsFloat,
                                 False,'','','','','');
                     if not(Result) then
                     begin
                        MessageInfo:=CtrlFinanc.MessageInfo;
                        Rollback;
                        Exit;
                     end;

                     cdsAux.Next;
                  end;
               end; //----------------------Fim Dados vindos da Previsão de Depósito do Front
            end; // ---- IF (dDataFinal<=Date)

            //Grava LOG
            Result:=CtrlPadroes.GravaLogOperacoes(F_rIDPessoa,F_rIDModulo,F_rIDUsuario,
                                                 'Geração de Fluxo de Caixa Previsto',False);
            if not(Result) then
            begin
               MessageInfo:=CtrlPadroes.MessageInfo;
               Rollback;
               Exit;
            end;

            //Finaliza Transação
            Commit;
         finally
            cdsAux.Free;
            sSql.Free;
         end;
      except
         on E:Exception do
         begin
            Result := False;
            MessageInfo := E.Message;
            Rollback;
         end;
      end;
   end;
end;

function TCtrlFluxoCaixa.CalculaSaldoInicFlxPrev(dDataRef: TDateTime): Double;
var
   sSql   : String;
   cdsAux : TCMClientDataSet;
begin
   cdsAux:=TCMClientDataSet.Create(nil);
   try
      sSql:=' SELECT '+
            '    SUM(DECODE(M.ENTRADASAIDA,''S'',-M.VALORLANCFINAN, '+
            '        M.VALORLANCFINAN)) AS SALDO '+
            ' FROM   MOVIMFINANC M '+
            ' WHERE ';

      cdsAux.Data:=GetDataPacket('SELECT FLGCONMOVREALFP '+
                                 'FROM PARAMFINANC '+
                                 'WHERE (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ');

      if (cdsAux.FieldByName('FLGCONMOVREALFP').AsString='S') then
          sSql:=sSql+'    (M.DATALANCFINAN < TO_DATE('''+
                FormatDateTime('dd/mm/yyyy',dDataRef)+''',''DD/MM/YYYY'')) AND '
      else
          sSql:=sSql+'    (M.DATALANCFINAN <= TO_DATE('''+
                FormatDateTime('dd/mm/yyyy',dDataRef)+''',''DD/MM/YYYY'')) AND ';

      sSql:=sSql+'    (M.STATUSCONCILIA <> ''C'') AND '+
                 '    (M.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ';

      cdsAux.Data:=GetDataPacket(sSql);
      Result:=cdsAux.FieldByName('SALDO').AsFloat;
   finally
      cdsAux.Free;
   end;
end;

//==============================================================================
// Fluxo Real
//==============================================================================

function TCtrlFluxoCaixa.GeraFluxoReal(dDataInicial, dDataFinal: TDateTime;
                                       rCodPortador: Double; const IAppCliente: OleVariant): Boolean;
var
   rMoedaCorrAux : Double;
   rMoedaCorr    : Double;
   rValor        : Double;
   iMaxProgresso : Integer;
   sSql          : String;
   cdsRateio     : TCMClientDataSet;
   bGeraFlxMutuo : Boolean;
   sAlteradores  : String;
   sSqlAux       : TCMSqlParams;
begin
   MessageInfo:='';
   iMaxProgresso:=0;
   sSql:='';

   if ConnectionSide = cnsClient then
   begin
      Result:=Connection.AppServer.GeraFluxoReal(dDataInicial,
                                                 dDataFinal,
                                                 rCodPortador,
                                                 F_rIDPessoa,
                                                 F_rIDModulo,
                                                 F_rIDUsuario,
                                                 F_bUsaPlanoPatro,
                                                 IAppCliente);

      if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         with TCMClientDataSet.Create(nil) do
         try
            Data:=CtrlListTerceiros.ListParamGlobal(F_rIDPessoa);
            rMoedaCorrAux:=FieldByName('MOEDACORRENTE').AsFloat;
         finally
            Free;
         end;

         //Inicia Transação
         StartTransaction;

         //Carrega variável de teste de mútuo
         with TCMClientDataSet.Create(nil) do
         try
            Data:=GetDataPacket(' SELECT FLGCONSMUTFREAL '+
                                ' FROM PARAMFINANC '+
                                ' WHERE (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ');
            bGeraFlxMutuo:=(FieldByName('FLGCONSMUTFREAL').AsString='S');
         finally
            Free;
         end;

         //Limpa Fluxo Real
         sSql:='DELETE FROM FLUXOREAL '+
               'WHERE (DATACFLOAT >= TO_DATE (''' +
                FormatDateTime('dd/mm/yyyy',dDataInicial)+''',''dd/mm/yyyy'')) AND '+
               '      (DATACFLOAT <= TO_DATE (''' +
                FormatDateTime('dd/mm/yyyy',dDataFinal)+''',''dd/mm/yyyy'')) AND '+
               '      (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ';

         if (rCodPortador<>0) then
             sSql:=sSql+'      AND (CODPORTADOR = '+FloatToStr(rCodPortador)+') ';

         Result:=ExecSQL(sSql);

         if not(Result) then
         begin
            Rollback;
            Exit;
         end;

         cdsRateio:=TCMClientDataSet.Create(nil);
         try
            sSql:='SELECT '+
                  '   R.*, ';

            if bGeraFlxDataConc then
               sSql:=sSql+'   M.DATACONCILIACAO AS DATALANCFINAN, '
            else
               sSql:=sSql+'   M.DATALANCFINAN, ';

            sSql:=sSql+
                  '   M.CODPORTADOR '+
                  'FROM '+
                  '   RATEIOFINANC R, '+
                  '   MOVIMFINANC M, '+
                  '   PORTADORCONTA C '+
                  'WHERE '+
                  '   (M.CODLANCFINANC = R.CODLANCFINANC) AND '+
                  '   (M.IDPESSOA = R.IDPESSOA) AND '+
                  '   (M.CODPORTADOR = C.CODPORTADOR) AND '+
                  '   (M.IDPESSOA = C.IDPESSOA) AND '+
                  '   (M.STATUSCONCILIA <> ''C'') AND ';

            if bGeraFlxDataConc then sSql:=sSql+'   (M.DATACONCILIACAO IS NOT NULL) AND ';

            sSql:=sSql+
                  //Não retirar o (+ 0) da query pois este foi introduzido para melhorar o
                  //desempenho da mesma
                  '   (M.DATALANCFINAN + 0 >= TO_DATE ('''+
                  FormatDateTime('dd/mm/yyyy',dDataInicial)+
                                 ''',''dd/mm/yyyy'')) AND '+
                  '   (M.DATALANCFINAN + 0 <= TO_DATE ('''+
                  FormatDateTime('dd/mm/yyyy',dDataFinal)+
                                 ''',''dd/mm/yyyy'')) AND  '+

                  '   (R.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND '+
                  '   ((C.FLGGRAVAFLUXO = ''S'') OR (C.FLGGRAVAFLUXO IS NULL)) ';

            if (rCodPortador<>0) then
                sSql:=sSql+'   AND (M.CODPORTADOR = '+FloatToStr(rCodPortador)+') ';

            if (bGeraFlxMutuo) then
               sSql:=sSql+'   AND NOT EXISTS(SELECT RP.CODLANCFINANC '+
                          '                  FROM RECBTOPAGTO RP '+
                          '                  WHERE (RP.CODLANCFINANC = M.CODLANCFINANC)) ';

            cdsRateio.Data:=GetDataPacket(sSql);

            iMaxProgresso:=cdsRateio.RecordCount;

            //Inicializa Progressbar
            try
               IAppCliente.ProgressoCFinan(0,'Buscando dados da Movimentação Financeira...');
            except
               //
            end;

            cdsRateio.First;
            while not(cdsRateio.Eof)do
            begin
               //Chama a rotina atualizadora da Progressbar
               try
                  IAppCliente.ProgressoCFinan(iMaxProgresso,
                                              'Buscando dados da Movimentação Financeira...');
               except
                  //
               end;

               if (cdsRateio.FieldByName('MOECODIGO').AsFloat<>0) then
               begin
                  rMoedaCorr:=cdsRateio.FieldByName('MOECODIGO').AsFloat;
                  rValor:=cdsRateio.FieldByName('VALOROUTRAMOEDA').AsFloat;
               end
               else
               begin
                  rMoedaCorr:=rMoedaCorrAux;
                  rValor:=cdsRateio.FieldByName('VALOR').AsFloat;
               end;

               Result:=CtrlFinanc.GravaFluxoReal(cdsRateio.FieldByName('CODCENTRORESPON').AsString,
                                                 cdsRateio.FieldByName('CODTIPRECDES').AsString,
                                                 cdsRateio.FieldByName('RECPAG').AsString,
                                                 cdsRateio.FieldByName('CODCENTROCUSTO').AsString,
                                                 cdsRateio.FieldByName('DATALANCFINAN').AsDateTime,
                                                 rMoedaCorr,
                                                 cdsRateio.FieldByName('UNIDNEGOC').AsFloat,
                                                 rValor,
                                                 F_rIDPessoa,0,0,0,
                                                 cdsRateio.FieldByName('CODTIPDOC').AsFloat,
                                                 cdsRateio.FieldByName('CODPORTADOR').AsFloat);
               if not(Result) then
               begin
                  MessageInfo:=CtrlFinanc.MessageInfo;
                  Rollback;
                  Exit;
               end;

               cdsRateio.Next;
            end;

            //Buscando dados do Mútuo
            if (bGeraFlxMutuo) then
            begin
               //Gera Lista de Alteradores
               with TCMClientDataSet.Create(nil) do
               try
                  Data:=GetDataPacket(' SELECT CODALTERADOR '+
                                      ' FROM MUTUO '+
                                      ' WHERE (CODALTERADOR IS NOT NULL) '+
                                      'UNION '+
                                      ' SELECT CODALTERADORCAR AS CODALTERADOR '+
                                      ' FROM MUTUO '+
                                      ' WHERE (CODALTERADORCAR IS NOT NULL) ');
                  First;
                  sAlteradores:='';
                  while not(Eof) do
                  begin
                     if (sAlteradores='') then
                         sAlteradores:=FloatToStr(FieldByName('CODALTERADOR').AsFloat)
                     else
                         sAlteradores:=sAlteradores+','+
                                       FloatToStr(FieldByName('CODALTERADOR').AsFloat);
                     Next;
                  end;
               finally
                  Free;
               end;

               //Carrega cds de rateios
               sSqlAux:=TCMSqlParams.Create(nil);
               try
                  with sSqlAux.SQL do
                  begin
                     sSqlAux.SQL.Clear;
                     Add('SELECT ');
                     Add('   U.CODTIPRECDES,');
                     Add('   U.RECPAG,');
                     Add('   U.CODCENTRORESPON,');
                     Add('   U.UNIDNEGOC,');
                     Add('   U.CODCENTROCUSTO,');
                     Add('   U.DATALANCTO,');
                     Add('   U.CODTIPDOC,');
                     Add('   U.MOECODIGO,');
                     Add('   U.CODPORTADOR,');
                     Add('   SUM(U.VALOR) AS VALOR,');
                     Add('   SUM(U.VALOROUTRAMOEDA) AS VALOROUTRAMOEDA');
                     Add('FROM ');
                     Add(' ((SELECT');
                     Add('      R.CODTIPRECDES,');
                     Add('      R.RECPAG,');
                     Add('      R.CODCENTRORESPON,');
                     Add('      R.UNIDNEGOC,');
                     Add('      R.CODCENTROCUSTO,');
                     Add('      L.DATALANCTO,');
                     Add('      D.CODTIPDOC,');
                     Add('      D.MOECODIGO, ');
                     Add('      P.CODPORTADOR, ');
                     Add('      SUM(DECODE(D.RECPAG,''P'',DECODE(D.OPERACAO,''10'',TO_NUMBER(DECODE(L.DEBCRE,''C'',L.VALOR,-L.VALOR))*R.PERC,');
                     Add('                                                         TO_NUMBER(DECODE(L.DEBCRE,''D'',L.VALOR,-L.VALOR))*R.PERC),');
                     Add('                              DECODE(D.OPERACAO,''10'',TO_NUMBER(DECODE(L.DEBCRE,''D'',L.VALOR,-L.VALOR))*R.PERC,');
                     Add('                                                       TO_NUMBER(DECODE(L.DEBCRE,''C'',L.VALOR,-L.VALOR))*R.PERC))) AS VALOR,');
                     Add('      SUM(DECODE(D.RECPAG,''P'',DECODE(D.OPERACAO,''10'',TO_NUMBER(DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,-L.VALOROUTRAMOEDA))*R.PERC,');
                     Add('                                                         TO_NUMBER(DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,-L.VALOROUTRAMOEDA))*R.PERC),');
                     Add('                              DECODE(D.OPERACAO,''10'',TO_NUMBER(DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,-L.VALOROUTRAMOEDA))*R.PERC,');
                     Add('                                                       TO_NUMBER(DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,-L.VALOROUTRAMOEDA))*R.PERC))) AS VALOROUTRAMOEDA');
                     Add('   FROM');
                     Add('      DOCUMENTO D, ');
                     Add('      LANCTODOCUM L,');
                     Add('      RECBTOPAGTO RP,');
                     Add('      PORTADORFORMA P,');
                     Add('     (SELECT');
                     Add('         D.NUMFATURA,');
                     Add('         R.RECPAG,');
                     Add('         R.IDPESSOA,');
                     Add('         R.CODTIPRECDES,');
                     Add('         R.CODCENTROCUSTO,');
                     Add('         R.CODCENTRORESPON,');
                     Add('         R.UNIDNEGOC,');
                     Add('        (SUM(R.VALOR)/T.VALORTOTAL) AS PERC');
                     Add('      FROM');
                     Add('         RATEIODOCUM R, ');
                     Add('         DOCUMENTO D,');
                     Add('        (SELECT');
                     Add('            D.NUMFATURA,');
                     Add('            SUM(DECODE(D.RECPAG,''P'',TO_NUMBER(DECODE(L.DEBCRE,''C'',L.VALOR,-L.VALOR)),');
                     Add('                                      TO_NUMBER(DECODE(L.DEBCRE,''D'',L.VALOR,-L.VALOR)))) AS VALORTOTAL ');
                     Add('         FROM');
                     Add('            DOCUMENTO D,');
                     Add('            LANCTODOCUM L');
                     Add('         WHERE');
                     Add('           (D.CODDOCUMENTO = L.CODDOCUMENTO) AND');
                     Add('           (D.OPERACAO = L.OPERACAO||'''') AND');
                     Add('           (L.ESTORNO IS NULL) AND');
                     Add('           (D.NUMFATURA IS NOT NULL) AND');
                     Add('           (D.OPERACAO = ''1 '')');
                     Add('         GROUP BY');
                     Add('            D.NUMFATURA) T');
                     Add('      WHERE');
                     Add('        (T.NUMFATURA = D.NUMFATURA) AND');
                     Add('        (T.VALORTOTAL <> 0) AND');
                     Add('        (D.CODDOCUMENTO = R.CODDOCUMENTO)');
                     Add('      GROUP BY');
                     Add('         D.NUMFATURA, R.RECPAG, R.IDPESSOA, R.CODTIPRECDES, ');
                     Add('		      R.CODCENTROCUSTO, R.CODCENTRORESPON, R.UNIDNEGOC, T.VALORTOTAL) R');
                     Add('   WHERE');
                     Add('     (D.CODDOCUMENTO = L.CODDOCUMENTO) AND');
                     Add('     ((L.OPERACAO IN (''5 '',''10'',''15'')) OR ');
                     Add('	     ((L.OPERACAO = ''4 '') AND (L.CODALTERADOR IN ('+sAlteradores+')))) AND');
                     Add('     (L.ESTORNO IS NULL) AND');
                     Add('     (D.NUMFATURA = R.NUMFATURA) AND');
                     Add('     (D.CODDOCUMENTOMUTUO IS NULL) AND ');
                     Add('     (L.CODDOCUMENTO = RP.CODDOCUMENTO(+)) AND ');
                     Add('     (L.NUMLANCTO = RP.NUMLANCTO(+)) AND ');
                     Add('     (RP.CODPORTFORMA = P.CODPORTFORMA(+)) AND ');
                     Add('     (L.DATALANCTO >= TO_DATE('''+
                         FormatDateTime('dd/mm/yyyy',dDataInicial)+''',''DD/MM/YYYY'')) AND');
                     Add('     (L.DATALANCTO <= TO_DATE('''+
                         FormatDateTime('dd/mm/yyyy',dDataFinal)+''',''DD/MM/YYYY'')) AND ');
                     Add('     (D.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ');
                     Add('   GROUP BY');
                     Add('      R.CODTIPRECDES, R.RECPAG, R.CODCENTRORESPON, R.UNIDNEGOC, ');
                     Add('      R.CODCENTROCUSTO, L.DATALANCTO, D.CODTIPDOC, D.MOECODIGO,');
                     Add('      P.CODPORTADOR) ');
                     Add('  UNION ALL');
                     Add('   (SELECT');
                     Add('      R.CODTIPRECDES,');
                     Add('      R.RECPAG,');
                     Add('      R.CODCENTRORESPON,');
                     Add('      R.UNIDNEGOC,');
                     Add('      R.CODCENTROCUSTO,');
                     Add('      L.DATALANCTO,');
                     Add('      D.CODTIPDOC,');
                     Add('      D.MOECODIGO, ');
                     Add('      P.CODPORTADOR, ');
                     Add('      SUM(DECODE(D.RECPAG,''P'',DECODE(D.OPERACAO,''10'',TO_NUMBER(DECODE(L.DEBCRE,''C'',L.VALOR,-L.VALOR))*R.PERC,');
                     Add('                                                         TO_NUMBER(DECODE(L.DEBCRE,''D'',L.VALOR,-L.VALOR))*R.PERC),');
                     Add('                              DECODE(D.OPERACAO,''10'',TO_NUMBER(DECODE(L.DEBCRE,''D'',L.VALOR,-L.VALOR))*R.PERC,');
                     Add('                                                       TO_NUMBER(DECODE(L.DEBCRE,''C'',L.VALOR,-L.VALOR))*R.PERC))) AS VALOR,');
                     Add('      SUM(DECODE(D.RECPAG,''P'',DECODE(D.OPERACAO,''10'',TO_NUMBER(DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,-L.VALOROUTRAMOEDA))*R.PERC,');
                     Add('                                                         TO_NUMBER(DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,-L.VALOROUTRAMOEDA))*R.PERC),');
                     Add('                              DECODE(D.OPERACAO,''10'',TO_NUMBER(DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,-L.VALOROUTRAMOEDA))*R.PERC,');
                     Add('                                                       TO_NUMBER(DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA,-L.VALOROUTRAMOEDA))*R.PERC))) AS VALOROUTRAMOEDA');
                     Add('   FROM');
                     Add('      DOCUMENTO D, ');
                     Add('      LANCTODOCUM L,');
                     Add('      RECBTOPAGTO RP,');
                     Add('      PORTADORFORMA P,');
                     Add('     (SELECT');
                     Add('         R.CODDOCUMENTO,');
                     Add('         R.RECPAG,');
                     Add('         R.IDPESSOA,');
                     Add('         T.HISTORICOCOMPL,');
                     Add('         R.CODTIPRECDES,');
                     Add('         R.CODCENTROCUSTO,');
                     Add('         R.CODCENTRORESPON,');
                     Add('         R.UNIDNEGOC,');
                     Add('        (SUM(R.VALOR)/T.VALORTOTAL) AS PERC');
                     Add('      FROM');
                     Add('         RATEIODOCUM R,');
                     Add('        (SELECT');
                     Add('            D.CODDOCUMENTO,');
                     Add('            L.HISTORICOCOMPL,');
                     Add('            SUM(L.VALOR) AS VALORTOTAL');
                     Add('         FROM');
                     Add('            DOCUMENTO D,');
                     Add('            LANCTODOCUM L');
                     Add('         WHERE');
                     Add('           (D.CODDOCUMENTO = L.CODDOCUMENTO) AND');
                     Add('           (D.OPERACAO = L.OPERACAO||'''') AND');
                     Add('           (L.ESTORNO IS NULL) AND');
                     Add('           (L.VALOR <> 0) AND');
                     Add('           (D.OPERACAO IN (''2 '',''10'',''14''))');
                     Add('         GROUP BY ');
                     Add('	        D.CODDOCUMENTO,L.HISTORICOCOMPL) T');
                     Add('      WHERE');
                     Add('        (T.CODDOCUMENTO = R.CODDOCUMENTO) AND');
                     Add('        (T.VALORTOTAL <> 0)');
                     Add('      GROUP BY');
                     Add('         R.CODDOCUMENTO,R.RECPAG,R.IDPESSOA,T.HISTORICOCOMPL,R.CODTIPRECDES,');
                     Add('         R.CODCENTROCUSTO,R.CODCENTRORESPON,R.UNIDNEGOC,T.VALORTOTAL) R');
                     Add('   WHERE');
                     Add('     (D.CODDOCUMENTO = L.CODDOCUMENTO) AND');
                     Add('     ((L.OPERACAO IN (''5 '',''10'',''15'')) OR ');
                     Add('	    ((L.OPERACAO = ''4 '') AND (L.CODALTERADOR IN ('+sAlteradores+')))) AND');
                     Add('	    (L.ESTORNO IS NULL) AND');
                     Add('     (D.CODDOCUMENTO = R.CODDOCUMENTO) AND');
                     Add('     (D.CODDOCUMENTOMUTUO IS NULL) AND ');
                     Add('     (L.CODDOCUMENTO = RP.CODDOCUMENTO(+)) AND ');
                     Add('     (L.NUMLANCTO = RP.NUMLANCTO(+)) AND ');
                     Add('     (RP.CODPORTFORMA = P.CODPORTFORMA(+)) AND ');
                     Add('     (L.DATALANCTO >= TO_DATE('''+
                         FormatDateTime('dd/mm/yyyy',dDataInicial)+''',''DD/MM/YYYY'')) AND');
                     Add('     (L.DATALANCTO <= TO_DATE('''+
                         FormatDateTime('dd/mm/yyyy',dDataFinal)+''',''DD/MM/YYYY'')) AND');
                     Add('     (D.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ');
                     Add('   GROUP BY');
                     Add('      R.CODTIPRECDES, R.RECPAG, R.CODCENTRORESPON, R.UNIDNEGOC,');
                     Add('      R.CODCENTROCUSTO, L.DATALANCTO, D.CODTIPDOC, D.MOECODIGO, ');
                     Add('      P.CODPORTADOR)) U');
                     Add('GROUP BY ');
                     Add('   U.CODTIPRECDES, U.RECPAG, U.CODCENTRORESPON, U.UNIDNEGOC,');
                     Add('   U.CODCENTROCUSTO, U.DATALANCTO, U.CODTIPDOC, U.MOECODIGO,');
                     Add('   U.CODPORTADOR');
                     sSqlAux.ControlObject:=Self;
                     //sSqlAux.SQL.SaveToFile('C:\ProjetosCM7\CFinan\QryMutuo.txt');

                     cdsRateio.Data:=sSqlAux.Data;
                  end;
               finally
                  sSqlAux.Free;
               end;

               //Buscando dadod do Mútuo
               //Inicializa Progressbar
               try
                  IAppCliente.ProgressoCFinan(0,'Buscando dados do Mútuo...');
               except
                  //
               end;

               iMaxProgresso:=cdsRateio.RecordCount;

               cdsRateio.First;
               while not(cdsRateio.Eof) do
               begin
                  //Chama a rotina atualizadora da Progressbar
                  try
                     IAppCliente.ProgressoCFinan(iMaxProgresso,'Buscando dados do Mútuo...');
                  except
                     //
                  end;

                  if (cdsRateio.FieldByName('MOECODIGO').AsFloat<>0) then
                  begin
                     rMoedaCorr:=cdsRateio.FieldByName('MOECODIGO').AsFloat;
                     rValor:=cdsRateio.FieldByName('VALOROUTRAMOEDA').AsFloat;
                  end
                  else
                  begin
                     rMoedaCorr:=rMoedaCorrAux;
                     rValor:=cdsRateio.FieldByName('VALOR').AsFloat;
                  end;

                  Result:=CtrlFinanc.GravaFluxoReal(cdsRateio.FieldByName('CODCENTRORESPON').AsString,
                                                    cdsRateio.FieldByName('CODTIPRECDES').AsString,
                                                    cdsRateio.FieldByName('RECPAG').AsString,
                                                    cdsRateio.FieldByName('CODCENTROCUSTO').AsString,
                                                    cdsRateio.FieldByName('DATALANCTO').AsDateTime,
                                                    rMoedaCorr,
                                                    cdsRateio.FieldByName('UNIDNEGOC').AsFloat,
                                                    rValor,
                                                    F_rIDPessoa,0,0,0,
                                                    cdsRateio.FieldByName('CODTIPDOC').AsFloat,
                                                    cdsRateio.FieldByName('CODPORTADOR').AsFloat);
                  if not(Result) then
                  begin
                     MessageInfo:=CtrlFinanc.MessageInfo;
                     Rollback;
                     Exit;
                  end;

                  cdsRateio.Next;
               end;
            end; //Fim dos dados vindos do Mútuo

            //Grava LOG
            Result:=CtrlPadroes.GravaLogOperacoes(F_rIDPessoa,F_rIDModulo,F_rIDUsuario,
                                                 'Geração de Fluxo de Caixa Real',False);
            if not(Result) then
            begin
               MessageInfo:=CtrlPadroes.MessageInfo;
               Rollback;
               Exit;
            end;

            //Finaliza Transação
            Commit;

         finally
            cdsRateio.Free;
         end;
      except
         on E:Exception do
         begin
            Result := False;
            MessageInfo := E.Message;
            Rollback;
         end;
      end;
   end;
end;

//==============================================================================
// Fluxo Orçado
//==============================================================================

function TCtrlFluxoCaixa.BuscaMinMaxDataFlxOrc(sPrazoFluxo: String): OleVariant;
begin
   Result:=GetDataPacket('SELECT '+
                         '   Min(FOrc.DataProgramada) AS DtMenor, '+
                         '   Max(FOrc.DataProgramada) AS DtMaior '+
                         'FROM '+
                         '   FluxoOrcado FOrc '+
                         'WHERE '+
                         '   (FOrc.Prazo= '''+sPrazoFluxo+''') AND '+
                         '   (FOrc.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ');
end;

function TCtrlFluxoCaixa.GeraMultiFluxoOrc(dDataInicial,dDataFinal: TDateTime;
                                           sFluxoOrigem, sFluxoDestino: String): Boolean;
var
   sSql   : TCMSqlParams;
   cdsAux : TCMClientDataSet;
   FDbFluxoOrcado : TDbFluxoOrcado;
begin
   MessageInfo:='';

   if ConnectionSide = cnsClient then
    begin
       Result:=Connection.AppServer.GeraMultiFluxoOrc(dDataInicial,
                                                      dDataFinal,
                                                      sFluxoOrigem,
                                                      sFluxoDestino,
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
         //Testa se existe dados no Flx Previsto a serem transportados para o fluxo orçado
         if (sFluxoOrigem='PRV') then
            with TCMClientDataSet.Create(nil) do
            try
               Data:=GetDataPacket('SELECT Count(*) AS NUMREG '+
                                   'FROM FluxoPrevisto '+
                                   'WHERE (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND '+
                                   '      (DATAPROGRAMADA >= To_Date('''+
                                   FormatDateTime('dd/mm/yyyy',dDataInicial)+''', ''dd/mm/yyyy'')) AND '+
                                   '      (DATAPROGRAMADA <= To_Date('''+
                                   FormatDateTime('dd/mm/yyyy',dDataFinal)+''',''dd/mm/yyyy'')) ');
               if (FieldByName('NUMREG').AsFloat<1) then
                begin
                   MessageInfo:='Não existe nenhum Lançamento no Fluxo Previsto neste Período';
                   Rollback;
                   Result:=False;
                   Exit;
                end;
            finally
               Free;
            end;

         //
         // Exclui Lancamentos do Fluxo de Destino para o período solicitado
         //
         Result:=ExcluiLancFlxOrc(dDataInicial,dDataFinal,sFluxoDestino);

         if not(Result) then
          begin
             Rollback;
             Exit;
          end;

         //
         // Cria novos Lancamentos no Fluxo de Destino para o período solicitado
         //
         sSql:=TCMSqlParams.Create(nil);
         cdsAux:=TCMClientDataSet.Create(nil);
         FDbFluxoOrcado:=TDbFluxoOrcado.Create(Self);
         with sSql.SQL do
         try
            sSql.SQL.Clear;
            Add(' SELECT ');
            Add('    IDPESSOA, ');
            Add('    DATAPROGRAMADA, ');
            Add('    CODTIPRECDES, ');
            Add('    RECPAG, ');
            Add('    UNIDNEGOC, ');
            Add('    CODCENTRORESPON, ');
            Add('    '''+sFluxoDestino+''' AS PRAZO, ');

            if (sFluxoOrigem='PRV') then
                Add('    0.00 AS MOECODIGO, ')
            else
                Add('    MOECODIGO, ');

            Add('    VALOR, ');

            if (sFluxoOrigem='PRV') then
             begin
                Add('    0.00 AS VALOROUTRAMOEDA, ');
                Add('    0.00 AS LOTETRANSMISSAO, ');
             end
            else
             begin
                Add('    VALOROUTRAMOEDA, ');
                Add('    LOTETRANSMISSAO, ');
             end;

            Add('    IDEMPRESA, ');
            Add('    CODCENTROCUSTO, ');
            Add('    0.00 AS IDFLUXOORCADO, ');

            if (sFluxoOrigem='PRV') then
                Add('    '' '' AS FLGSIMULAATIVO, ')
            else
                Add('    FLGSIMULAATIVO, ');

            Add('    IDPLANOPREV, ');
            Add('    IDPATRO, ');
            Add('    IDPROGRAMA, ');
            Add('    CODTIPDOC ');

            if (sFluxoOrigem='PRV') then
             begin
                Add(' FROM FluxoPrevisto ');
                Add(' WHERE ');
             end
            else
             begin
                Add(' FROM FluxoOrcado ');
                Add(' WHERE (Prazo= '''+sFluxoOrigem+''') AND ');
             end;

            Add('    (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND ');
            Add('    (DataProgramada >= To_Date('''+FormatDateTime('dd/mm/yyyy',dDataInicial)+
                                                ''', ''dd/mm/yyyy'')) AND ');
            Add('    (DataProgramada <= To_Date('''+FormatDateTime('dd/mm/yyyy',dDataFinal)+
                                                ''',''dd/mm/yyyy'')) ');

            sSql.ControlObject:=Self;
            cdsAux.Data:=sSql.Data;

            cdsAux.First;
            while not(cdsAux.Eof) do
            begin
               FDbFluxoOrcado.Dataprogramada.AsDateTime:=
                              cdsAux.FieldByName('DATAPROGRAMADA').AsDateTime;
               FDbFluxoOrcado.Codtiprecdes.AsString:=
                              cdsAux.FieldByName('CODTIPRECDES').AsString;
               FDbFluxoOrcado.Recpag.AsString:=
                              cdsAux.FieldByName('RECPAG').AsString;
               FDbFluxoOrcado.Unidnegoc.AsFloat:=
                              cdsAux.FieldByName('UNIDNEGOC').AsFloat;
               FDbFluxoOrcado.Codcentrorespon.AsString:=
                              cdsAux.FieldByName('CODCENTRORESPON').AsString;
               FDbFluxoOrcado.Prazo.AsString:=
                              cdsAux.FieldByName('PRAZO').AsString;
               FDbFluxoOrcado.Moecodigo.AsFloat:=
                              cdsAux.FieldByName('MOECODIGO').AsFloat;
               FDbFluxoOrcado.Valor.AsFloat:=
                              cdsAux.FieldByName('VALOR').AsFloat;
               FDbFluxoOrcado.Valoroutramoeda.AsFloat:=
                              cdsAux.FieldByName('VALOROUTRAMOEDA').AsFloat;
               FDbFluxoOrcado.Lotetransmissao.AsFloat:=
                              cdsAux.FieldByName('LOTETRANSMISSAO').AsFloat;
               FDbFluxoOrcado.Idempresa.AsFloat:=
                              cdsAux.FieldByName('IDEMPRESA').AsFloat;
               FDbFluxoOrcado.Codcentrocusto.AsString:=
                              cdsAux.FieldByName('CODCENTROCUSTO').AsString;
               FDbFluxoOrcado.Flgsimulaativo.AsString:=
                              cdsAux.FieldByName('FLGSIMULAATIVO').AsString;
               FDbFluxoOrcado.Idplanoprev.AsFloat:=
                              cdsAux.FieldByName('IDPLANOPREV').AsFloat;
               FDbFluxoOrcado.Idpatro.AsFloat:=
                              cdsAux.FieldByName('IDPATRO').AsFloat;
               FDbFluxoOrcado.Idprograma.AsFloat:=
                              cdsAux.FieldByName('IDPROGRAMA').AsFloat;
               FDbFluxoOrcado.Codtipdoc.AsFloat:=
                              cdsAux.FieldByName('CODTIPDOC').AsFloat;
               FDbFluxoOrcado.Idpessoa.AsFloat:=
                              cdsAux.FieldByName('IDPESSOA').AsFloat;

               Result:=FDbFluxoOrcado.Insert;
               if not(Result) then
                begin
                   Rollback;
                   Exit;
                end;

               cdsAux.Next;
            end;
         finally
            sSql.Free;
            cdsAux.Free;
            FDbFluxoOrcado.Free;
         end;

         //Grava LOG
         Result:=CtrlPadroes.GravaLogOperacoes(F_rIDPessoa,F_rIDModulo,F_rIDUsuario,
                                              'Geração do Fluxo de Cx Orç. a partir '+
                                              'do Fluxo de Cx Prev.',False);
         if not(Result) then
          begin
             MessageInfo:=CtrlPadroes.MessageInfo;
             Rollback;
             Exit;
          end;

         //Finaliza Transação
         Commit;
      except
         on E:Exception do
         begin
            Result := False;
            MessageInfo := E.Message;
            Rollback;
         end;
      end;
   end;
end;

function TCtrlFluxoCaixa.ExcluiLancFlxOrc(dDataInicial,
  dDataFinal: TDateTime; sPrazoFluxo: String): Boolean;
begin
   Result:=ExecSQL('DELETE FluxoOrcado '+
                   'WHERE (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND '+
                   '      (Prazo= '''+sPrazoFluxo+''') AND '+
                   '      (DataProgramada >= To_Date( '''+
                   FormatDateTime('dd/mm/yyyy',dDataInicial)+''',''dd/mm/yyyy'')) AND '+
                   '      (DataProgramada <= To_Date( '''+
                   FormatDateTime('dd/mm/yyyy',dDataFinal)+''', ''dd/mm/yyyy'')) ');
end;

function TCtrlFluxoCaixa.GeraFluxoOrcOrcamen(rPeriodoInicial,
  rPeriodoFinal, rExercicio: Double): Boolean;
var
   dDataInicial   : TDateTime;
   dDataFinal     : TDateTime;
   sCResponGlobal : String;
   sCResponAux    : String;
   rUnidNegGlobal : Double;
   rUnidNegAux    : Double;
   cdsSaldo       : TCMClientDataSet;
   cdsComposicao  : TCMClientDataSet;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result:=Connection.AppServer.GeraFluxoOrcOrcamen(rPeriodoInicial,
                                                        rPeriodoFinal,
                                                        rExercicio,
                                                        F_rIDPessoa,
                                                        F_rIDModulo,
                                                        F_rIDUsuario,
                                                        F_bUsaPlanoPatro);

       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          with TCMClientDataSet.Create(nil) do
          try
             //Busca Parâmetros Globais
             Data:=CtrlListTerceiros.ListParamGlobal(F_rIDPessoa);
             sCResponGlobal:=FieldByName('CODCENTRORESPON').AsString;
             rUnidNegGlobal:=FieldByName('UNIDNEGOC').AsFloat;

             //Busca datas dos períodos
             BuscaDataPeriodo(dDataInicial,True,rExercicio,rPeriodoInicial);
             BuscaDataPeriodo(dDataFinal,False,rExercicio,rPeriodoFinal);
          finally
             Free;
          end;

          //Testa se existe dados no Orçamento para transportar para o Fluxo Orçado LP
          cdsSaldo:=TCMClientDataSet.Create(nil);
          cdsComposicao:=TCMClientDataSet.Create(nil);
          try

             cdsSaldo.Data:=GetDataPacket('SELECT '+
                                          '   P.DATAINIPERIODO AS DATAREFERENCIA, '+
                                          '   SUM(S.VLRORCADO) AS VLRORCADO, '+
                                          '   S.IDCONTAORCAMEN, '+
                                          '   S.IDPLANOORCAMEN '+
                                          'FROM '+
                                          '   SALDOORCADO S, '+
                                          '   CONTASORCAMEN C, '+
                                          '   PERIODOORCAMEN P '+
                                          'WHERE '+
                                          '   (S.DATAREFERENCIA >= TO_DATE('''+
                                          FormatDateTime('dd/mm/yyyy',dDataInicial)+
                                               ''',''DD/MM/YYYY'')) AND '+
                                          '   (S.DATAREFERENCIA <= TO_DATE('''+
                                          FormatDateTime('dd/mm/yyyy',dDataFinal)+
                                               ''',''DD/MM/YYYY'')) AND '+
                                          '   (S.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND '+
                                          '   (C.TIPOCALCREALIZADO = ''X'') AND '+
                                          '   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND '+
                                          '   (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN) AND '+
                                          '   (P.EXERCICIO = S.EXERCICIO) AND '+
                                          '   (P.PERIODO = S.PERIODO) AND '+
                                          '   (P.IDPESSOA = S.IDPESSOA) '+
                                          'GROUP BY P.DATAINIPERIODO, S.IDCONTAORCAMEN, S.IDPLANOORCAMEN ');

             if (cdsSaldo.IsEmpty) then
              begin
                 MessageInfo:='Não existe nenhum Orçamento neste Período';
                 Result:=False;
                 Exit;
              end;

              StartTransaction;

              Result:=ExcluiLancFlxOrc(dDataInicial,dDataFinal,'L');
              if not(Result) then
               begin
                  Rollback;
                  Exit;
               end;

               cdsSaldo.First;
               while not(cdsSaldo.Eof) do
               begin
                  MessageInfo:='*';

                  cdsComposicao.Close;
                  cdsComposicao.Data:=GetDataPacket('SELECT '+
                                                    '   P.NUMLINHAS, '+
                                                    '   C.CODTIPRECDES, '+
                                                    '   C.RECPAG, '+
                                                    '   C.CODCENTRORESPON, '+
                                                    '   C.UNIDNEGOC, '+
                                                    '   C.CODTIPDOC '+
                                                    'FROM '+
                                                    '   COMPCONTASORCAMEN C, '+
                                                    '   (SELECT COUNT(*) AS NUMLINHAS '+
                                                    '    FROM COMPCONTASORCAMEN '+
                                                    '    WHERE '+
                                                    '       (IDPLANOORCAMEN = '+
                                                    FloatToStr(cdsSaldo.FieldByName('IDPLANOORCAMEN').AsFloat)+') AND '+
                                                    '       (IDCONTAORCAMEN = '+
                                                    cdsSaldo.FieldByName('IDCONTAORCAMEN').AsString+') AND '+
                                                    '       (CODTIPRECDES is not null)) P '+
                                                    'WHERE '+
                                                    '   (C.IDPLANOORCAMEN = '+
                                                    FloatToStr(cdsSaldo.FieldByName('IDPLANOORCAMEN').AsFloat)+') AND '+
                                                    '   (C.IDCONTAORCAMEN = '+
                                                    cdsSaldo.FieldByName('IDCONTAORCAMEN').AsString+') AND '+
                                                    '   (C.CODTIPRECDES is not null) ');

                  cdsComposicao.First;
                  while not(cdsComposicao.Eof) do
                  begin
                     if cdsComposicao.FieldByName('CODCENTRORESPON').isNull then
                        sCResponAux:=sCResponGlobal
                     else
                        sCResponAux:=cdsComposicao.FieldByName('CODCENTRORESPON').AsString;

                     if cdsComposicao.FieldByName('UNIDNEGOC').isNull then
                        rUnidNegAux:=rUnidNegGlobal
                     else
                        rUnidNegAux:=cdsComposicao.FieldByName('UNIDNEGOC').AsFloat;


                     Result:=CtrlFinanc.GravaFluxoOrc(F_rIDPessoa,
                                                      cdsSaldo.FieldByName('DATAREFERENCIA').AsDateTime,
                                                      cdsComposicao.FieldByName('CODTIPRECDES').AsString,
                                                      cdsComposicao.FieldByName('RECPAG').AsString,
                                                      sCResponAux,'L',rUnidNegAux,
                                                      (cdsSaldo.FieldByName('VLRORCADO').asFloat/
                                                       cdsComposicao.FieldByName('NUMLINHAS').asFloat),
                                                      cdsComposicao.FieldByName('CODTIPDOC').AsFloat);
                     if not(Result) then
                      begin
                         MessageInfo:=CtrlFinanc.MessageInfo;
                         Rollback;
                         Exit;
                      end;

                     cdsComposicao.Next;
                  end;
                  cdsSaldo.Next;
               end;

              Commit;
          finally
             cdsSaldo.Free;
             cdsComposicao.Free;
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

procedure TCtrlFluxoCaixa.BuscaDataPeriodo(var dDataPeriodo: TDateTime; bDataInicial: Boolean;
                                            rExercicio, rPeriodo: Double);
begin
   with TCMClientDataSet.Create(nil) do
   try
      Data:=GetDataPacket('SELECT DATAINIPERIODO, DATAFIMPERIODO '+
                          'FROM PERIODOORCAMEN '+
                          'WHERE (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND '+
                          '      (EXERCICIO = '+FloatToStr(rExercicio)+') AND '+
                          '      (PERIODO = '+FloatToStr(rPeriodo)+') ');

      if bDataInicial then
         dDataPeriodo:=FieldByName('DATAINIPERIODO').AsDateTime
      else
         dDataPeriodo:=FieldByName('DATAFIMPERIODO').AsDateTime;
   finally
      Free;
   end;
end;

function TCtrlFluxoCaixa.ListDatasMinMax(sFluxo,
         sCampoData: String; rIDFluxoConsol: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT  '+
         '   Min('+sCampoData+') AS DataInic, '+
         '   Max('+sCampoData+') AS DataFim '+
         'FROM  '+sFluxo+
         ' WHERE '+
         '  (IDPessoa '+GeraFiltroPessoa(rIDFluxoConsol,F_rIDPessoa)+') AND '+
         '  ('+sCampoData+'<>To_Date(''01/01/1900'',''dd/mm/yyyy''))';
   Result:=GetDataPacket(sSql);
end;

function TCtrlFluxoCaixa.GeraSaldoInicialFluxo(ParamFluxo : TParamFluxo): Double;
var
   rValorCotacao      : Double;
   rNumDecimais       : Double;
   rSaldoAux          : Double;
   cdsAux             : TCMClientDataSet;
   sSql               : TCMSqlParams;
   bSaldoDiferenciado : Boolean;
begin
   rSaldoAux:=0;

   bSaldoDiferenciado:=(ParamFluxo.dDataInicFluxo<>ParamFluxo.dDataMin);

   cdsAux:=TCMClientDataSet.Create(nil);
   sSql:=TCMSqlParams.Create(nil);
   try
     //----------------------------
     //Saldo para o Fluxo Previsto
     //----------------------------

     if (ParamFluxo.sTipoFluxo='P') then
      begin
         with sSql.SQL do
         begin
            Clear;
            if bSaldoDiferenciado then
             begin
                Add(' SELECT SUM(DECODE(RECPAG,''R'',VALOR,-VALOR)) AS VALORC ');
                Add(' FROM FLUXOPREVISTO ');
                Add(' WHERE (IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
                Add('  (DATAPROGRAMADA < TO_DATE('''+FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataInicFluxo)+
                                                    ''',''DD/MM/YYYY'')) AND ');
                Add('  NOT((DATAPROGRAMADA > TO_DATE(''01/01/1900'',''DD/MM/YYYY'')) AND ');
                Add('      (DATAPROGRAMADA < TO_DATE('''+FormatDateTime('dd/mm/yyyy',
                            ParamFluxo.dDataMin)+''',''DD/MM/YYYY''))) ');
             end
            else
             begin
                Add(' SELECT SUM(VALOR) AS VALORC ');
                Add(' FROM FLUXOPREVISTO ');
                Add(' WHERE (IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
                Add('       (DATAPROGRAMADA = TO_DATE(''01/01/1900'',''dd/mm/yyyy'')) ');
             end;

            sSql.ControlObject:=Self;
            cdsAux.Data:=sSql.Data;

            rSaldoAux:=cdsAux.FieldByName('VALORC').AsFloat;
         end;
      end;

     //--------------------------
     //Saldo para o Fluxo Real
     //--------------------------

     if (ParamFluxo.sTipoFluxo='R') then
      begin
         with sSql.SQL do
         begin
            Clear;
            Add(' SELECT ');

            if (ParamFluxo.rMoeCodigo=0) then
                Add('    SUM(DECODE(Flx.RECPAG,''R'',Flx.VALOR*NVL(CT.COTVALOR,1),'+
                                              '-Flx.VALOR*NVL(CT.COTVALOR,1))) AS TOTAL ')
            else
                Add('    SUM(DECODE(Flx.RECPAG,''R'',Flx.VALOR,-Flx.VALOR)) AS TOTAL ');

            Add(' FROM ');
            Add('    FLUXOREAL Flx ');

            //Estrutura de Conversão de moeda
            if (ParamFluxo.rMoeCodigo=0) then
             begin
                Add('    ,COTACAOMOEDA CT ');

                //Estrutura que relaciona DataCFloat a data de cotação de uma moeda
                Add('    ,(SELECT ');
                Add('         DTM.DATACFLOAT, ');
                Add('         C.MOECODIGO, ');
                Add('         MAX(C.COTDATA) AS COTDATA ');
                Add('      FROM ');
                Add('         COTACAOMOEDA C, ');
                Add('         (SELECT DISTINCT ');
                Add('             Flx.DATACFLOAT, ');
                Add('             Flx.MOECODIGO ');
                Add('          FROM ');
                Add('             FLUXOREAL Flx ');
                Add('          WHERE ');
                Add('             (Flx.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
                Add('             (Flx.DATACFLOAT < TO_DATE('''+
                    FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataInicFluxo)+''',''DD/MM/YYYY''))) DTM ');
                Add('      WHERE ');
                Add('         (C.COTDATA <= DTM.DATACFLOAT) AND ');
                Add('         (C.MOECODIGO = DTM.MOECODIGO) ');
                Add('      GROUP BY DTM.DATACFLOAT,C.MOECODIGO) MD ');
             end;

            Add(' WHERE ');
            Add('    (Flx.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
            Add('    (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) AND ');

            if (ParamFluxo.rCodPortador<>0) then
                Add('    (Flx.CODPORTADOR = '+FloatToStr(ParamFluxo.rCodPortador)+') AND ');

            //Join da conversão de moeda
            if (ParamFluxo.rMoeCodigo=0) then
             begin
                Add('    (Flx.MOECODIGO = MD.MOECODIGO(+)) AND ');
                Add('    (Flx.DATACFLOAT = MD.DATACFLOAT(+)) AND ');
                Add('    (MD.MOECODIGO = CT.MOECODIGO(+)) AND ');
                Add('    (MD.COTDATA = CT.COTDATA(+)) AND ');
             end
            else
             Add('    (Flx.MOECODIGO = '+FloatToStr(ParamFluxo.rMoeCodigo)+') AND ');

            Add('    (Flx.DATACFLOAT < TO_DATE('''+
                FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataInicFluxo)+''',''DD/MM/YYYY'')) ');

            sSql.ControlObject:=Self; 
            cdsAux.Data:=sSql.Data;
            rSaldoAux:=cdsAux.FieldByName('TOTAL').AsFloat;
         end;
      end;

     //--------------------------
     //Saldo para o Fluxo Orçado
     //--------------------------
     if (ParamFluxo.sTipoFluxo='O') then
      begin
         with sSql.SQL do
         begin
            //Gera a parte real do saldo
            Clear;
            Add(' SELECT ');
            Add('    SUM(DECODE(ENTRADASAIDA,''E'',VALORLANCFINAN ,-VALORLANCFINAN)) AS SALDOREAL ');
            Add(' FROM ');
            Add('    MOVIMFINANC ');
            Add(' WHERE ');

            if (ParamFluxo.dDataInicFluxo>Date) then
                Add('    (DATALANCFINAN  <= TO_DATE('''+FormatDateTime('dd/mm/yyyy',Date)+
                                                   ''',''DD/MM/YYYY'')) ')
            else
                Add('    (DATALANCFINAN  < TO_DATE('''+
                FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataInicFluxo)+''',''DD/MM/YYYY'')) ');

            sSql.ControlObject:=Self;
            cdsAux.Data:=sSql.Data;

            rSaldoAux:=cdsAux.FieldByName('SALDOREAL').AsFloat;

            //Gera parte orçada do saldo
            if (ParamFluxo.dDataInicFluxo>Date) then
            begin
               Clear;
               Add(' SELECT ');
               Add('    SUM(DECODE(RECPAG,''R'',VALOROUTRAMOEDA,-VALOROUTRAMOEDA)) AS VALORO, ');
               Add('    MOECODIGO, ');
               Add('    SUM(DECODE(RECPAG,''R'',VALOR,-VALOR))  AS VALORC ');
               Add(' FROM FLUXOORCADO ');
               Add(' WHERE ');
               Add('    (PRAZO = '''+ParamFluxo.sPrazo+''') AND ');
               Add('    (IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');

               Add('    (DATAPROGRAMADA > TO_DATE('''+
                   FormatDateTime('dd/mm/yyyy',Date)+''',''DD/MM/YYYY'')) AND ');

               Add('    (DATAPROGRAMADA < TO_DATE('''+
                   FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataInicFluxo)+''',''DD/MM/YYYY'')) ');

               Add(' GROUP BY MOECODIGO');

               sSql.ControlObject:=Self;
               cdsAux.Data:=sSql.Data;

               cdsAux.First;
               while not(cdsAux.Eof) do
               begin
                  if cdsAux.FieldByName('MOECODIGO').IsNull then
                     rSaldoAux:=rSaldoAux+cdsAux.FieldByName('VALORC').AsFloat
                  else
                   begin
                      GeralFinanc.TestaCotacaoMoeda(cdsAux.FieldByName('MOECODIGO').AsFloat,Now,
                                                    False,rValorCotacao,rNumDecimais);

                      if (rValorCotacao=0) then rValorCotacao :=1;
                      rSaldoAux:=rSaldoAux+(cdsAux.FieldByName('VALORO').AsFloat*rValorCotacao);
                   end;
                  cdsAux.Next;
               end;
            end;
         end;
      end;
   finally
      cdsAux.Free;
      sSql.Free;
   end;

   Result:=rSaldoAux;
end;

//------------------------------------------------------------------------------
//Rotinas das Consultas dos Fluxos de Caixa
//------------------------------------------------------------------------------

function TCtrlFluxoCaixa.GeraColunasFluxo(dDataInicial,dDataFinal: TDateTime;
                                          sAgrupamento,sTipoFluxo: String;
                                          bExibSabDom: Boolean): OleVariant;
var
   iDia            : Integer;
   iMes            : Integer;
   iAno            : Integer;
   iNumDias        : Integer;
   iContador       : Integer;
   iDiaSemana      : Integer;
   iNumFluxo       : Integer;
   iNumMaxFluxos   : Integer;
   dDataRef        : TDateTime;
   dDataRefAux     : TDateTime;
   bSemanaCheia    : Boolean;
   cdsColunasFluxo : TCMClientDataSet;
begin
   cdsColunasFluxo:=TCMClientDataSet.Create(nil);
   try
      cdsColunasFluxo.Data:=GetDataPacket('SELECT '+
                                          '   To_Date(''01/01/2001'',''dd/mm/yyyy'') AS DataInicial, '+
                                          '   To_Date(''01/01/2001'',''dd/mm/yyyy'') AS DataFinal, '+
                                          '   ''123456789012345678901234567890'' AS Titulo, '+
                                          '   ''123456789012345678901234567890'' AS SubTitulo, '+
                                          '   ''N'' AS SabDom, '+
                                          '   ''_'' AS TipoFluxo '+
                                          'FROM '+
                                          '   Dual '+
                                          'WHERE '+
                                          '   (1=2) /*+OPTIMIZER_MODE RULE*/ ');

      iNumDias:=Round(dDataFinaL-dDataInicial+1);
      iContador:=0;

      iNumMaxFluxos:=Length(Trim(sTipoFluxo))-1;
      if (iNumMaxFluxos=0) then iNumMaxFluxos:=1;

      if (sAgrupamento='D') then  //Fluxo Diário
       begin
          for iDia:=1 to iNumDias do
          begin
             iDiaSemana:=DayOfWeek(dDataInicial+(iDia-1));
             if ((iDiaSemana=1) or (iDiaSemana=7)) and not(bExibSabDom) then Continue;

             Inc(iContador);
             for iNumFluxo:=1 to iNumMaxFluxos do
             begin
                cdsColunasFluxo.Append;
                cdsColunasFluxo.FieldByName('DATAINICIAL').AsDateTime:=(dDataInicial+(iDia-1));
                cdsColunasFluxo.FieldByName('DATAFINAL').AsDateTime:=(dDataInicial+(iDia-1));

                if (iNumMaxFluxos=1) then
                   cdsColunasFluxo.FieldByName('TITULO').AsString:=
                                   FormatDateTime('dd/mm/yyyy',(dDataInicial+(iDia-1)))
                else
                   if (iNumFluxo=1) then
                       cdsColunasFluxo.FieldByName('TITULO').AsString:=
                                       FormatDateTime('dd/mm/yyyy',(dDataInicial+(iDia-1)))+
                                       ' - '+Copy(Trim(sTipoFluxo),1,1)
                   else
                       cdsColunasFluxo.FieldByName('TITULO').AsString:=
                                       FormatDateTime('dd/mm/yyyy',(dDataInicial+(iDia-1)))+
                                       ' - '+Copy(Trim(sTipoFluxo),3,1);

                cdsColunasFluxo.FieldByName('SABDOM').AsString:='N';

                case iDiaSemana of
                   1: begin
                         cdsColunasFluxo.FieldByName('SUBTITULO').AsString:='Domingo';
                         cdsColunasFluxo.FieldByName('SABDOM').AsString:='S';
                      end;
                   2: cdsColunasFluxo.FieldByName('SUBTITULO').AsString:='Segunda';
                   3: cdsColunasFluxo.FieldByName('SUBTITULO').AsString:='Terça';
                   4: cdsColunasFluxo.FieldByName('SUBTITULO').AsString:='Quarta';
                   5: cdsColunasFluxo.FieldByName('SUBTITULO').AsString:='Quinta';
                   6: cdsColunasFluxo.FieldByName('SUBTITULO').AsString:='Sexta';
                   7: begin
                         cdsColunasFluxo.FieldByName('SUBTITULO').AsString:='Sábado';
                         cdsColunasFluxo.FieldByName('SABDOM').AsString:='S';
                      end;
                end;

                if (iNumMaxFluxos=1) then
                    cdsColunasFluxo.FieldByName('TIPOFLUXO').AsString:=sTipoFluxo
                else
                 if (iNumFluxo=1) then
                     cdsColunasFluxo.FieldByName('TIPOFLUXO').AsString:=Copy(Trim(sTipoFluxo),1,1)
                 else
                     cdsColunasFluxo.FieldByName('TIPOFLUXO').AsString:=Copy(Trim(sTipoFluxo),3,1);

                cdsColunasFluxo.Post;
             end;
          end;
       end; //Fim Fluxo Diário

      if (sAgrupamento='S') then //Fluxo Semanal
       begin
          iContador:=0;
          dDataRef:=dDataInicial;
          bSemanaCheia:=False;

          for iDia:=1 to iNumDias do
          begin
             bSemanaCheia:=False;

             if DayOfWeek(dDataInicial+(iDia-1))=7 then
              begin
                 Inc(iContador);

                 //Inclusão da Coluna
                 for iNumFluxo:=1 to iNumMaxFluxos do
                 begin
                    cdsColunasFluxo.Append;
                    cdsColunasFluxo.FieldByName('DATAINICIAL').AsDateTime:=dDataRef;
                    cdsColunasFluxo.FieldByName('DATAFINAL').AsDateTime:=(dDataInicial+(iDia-1));

                    if (iNumMaxFluxos=1) then
                        cdsColunasFluxo.FieldByName('TITULO').AsString:=FormatDateTime('dd/mm',dDataRef)+
                                        ' - '+FormatDateTime('dd/mm',(dDataInicial+(iDia-1)))
                    else
                     if (iNumFluxo=1) then
                        cdsColunasFluxo.FieldByName('TITULO').AsString:=FormatDateTime('dd/mm',dDataRef)+
                                        ' - '+FormatDateTime('dd/mm',(dDataInicial+(iDia-1)))+
                                        ' - '+Copy(Trim(sTipoFluxo),1,1)
                     else
                        cdsColunasFluxo.FieldByName('TITULO').AsString:=FormatDateTime('dd/mm',dDataRef)+
                                        ' - '+FormatDateTime('dd/mm',(dDataInicial+(iDia-1)))+
                                        ' - '+Copy(Trim(sTipoFluxo),3,1);

                    cdsColunasFluxo.FieldByName('SABDOM').AsString:='N';
                    cdsColunasFluxo.FieldByName('SUBTITULO').AsString:=IntToStr(iContador);

                    if (iNumMaxFluxos=1) then
                        cdsColunasFluxo.FieldByName('TIPOFLUXO').AsString:=sTipoFluxo
                    else
                     if (iNumFluxo=1) then
                         cdsColunasFluxo.FieldByName('TIPOFLUXO').AsString:=Copy(Trim(sTipoFluxo),1,1)
                     else
                         cdsColunasFluxo.FieldByName('TIPOFLUXO').AsString:=Copy(Trim(sTipoFluxo),3,1);

                    cdsColunasFluxo.Post;
                 end;
                 
                 dDataRef:=dDataInicial+(iDia-1)+1;
                 bSemanaCheia:=True;
              end;
          end;

          if not(bSemanaCheia) then
           begin
              Inc(iContador);
              for iNumFluxo:=1 to iNumMaxFluxos do
              begin
                 cdsColunasFluxo.Append;
                 cdsColunasFluxo.FieldByName('DATAINICIAL').AsDateTime:=dDataRef;
                 cdsColunasFluxo.FieldByName('DATAFINAL').AsDateTime:=dDataFinal;

                 if (iNumMaxFluxos=1) then
                     cdsColunasFluxo.FieldByName('TITULO').AsString:=FormatDateTime('dd/mm',dDataRef)+
                                     ' - '+FormatDateTime('dd/mm',(dDataInicial+(iDia-1)))
                 else
                  if (iNumFluxo=1) then
                     cdsColunasFluxo.FieldByName('TITULO').AsString:=FormatDateTime('dd/mm',dDataRef)+
                                     ' - '+FormatDateTime('dd/mm',(dDataInicial+(iDia-1)))+
                                     ' - '+Copy(Trim(sTipoFluxo),1,1)
                  else
                     cdsColunasFluxo.FieldByName('TITULO').AsString:=FormatDateTime('dd/mm',dDataRef)+
                                     ' - '+FormatDateTime('dd/mm',(dDataInicial+(iDia-1)))+
                                     ' - '+Copy(Trim(sTipoFluxo),3,1);

                 cdsColunasFluxo.FieldByName('SABDOM').AsString:='N';
                 cdsColunasFluxo.FieldByName('SUBTITULO').AsString:=IntToStr(iContador);

                 if (iNumMaxFluxos=1) then
                     cdsColunasFluxo.FieldByName('TIPOFLUXO').AsString:=sTipoFluxo
                 else
                  if (iNumFluxo=1) then
                      cdsColunasFluxo.FieldByName('TIPOFLUXO').AsString:=Copy(Trim(sTipoFluxo),1,1)
                  else
                      cdsColunasFluxo.FieldByName('TIPOFLUXO').AsString:=Copy(Trim(sTipoFluxo),3,1);

                 cdsColunasFluxo.Post;
              end;
           end;
       end; //Fim Fluxo Semanal

      if (sAgrupamento='M') then //Fluxo Mensal
       begin
          iContador:=0;
          dDataRef:=0;
          repeat
             if (dDataRef=0) then dDataRef:=dDataInicial;

             iMes:=StrToInt(FormatDateTime('mm',dDataRef));
             iAno:=StrToInt(FormatDateTime('yyyy',dDataRef));

             Inc(iMes);
             if (iMes>12) then
              begin
                 iMes:=1;
                 Inc(iAno);
              end;
              
             dDataRefAux:=StrToDate('01/'+IntToStr(iMes)+'/'+IntToStr(iAno));
             Inc(iContador);

             for iNumFluxo:=1 to iNumMaxFluxos do
             begin
                cdsColunasFluxo.Append;
                cdsColunasFluxo.FieldByName('DATAINICIAL').AsDateTime:=dDataRef;

                if (dDataRefAux>dDataFinal) then
                    cdsColunasFluxo.FieldByName('DATAFINAL').AsDateTime:=dDataFinal
                else
                    cdsColunasFluxo.FieldByName('DATAFINAL').AsDateTime:=dDataRefAux-1;

                if (iNumMaxFluxos=1) then
                    cdsColunasFluxo.FieldByName('TITULO').AsString:=FormatDateTime('mm/yyyy',dDataRef)
                else
                    if (iNumFluxo=1) then
                        cdsColunasFluxo.FieldByName('TITULO').AsString:=
                           FormatDateTime('mm/yyyy',dDataRef)+' - '+Copy(Trim(sTipoFluxo),1,1)
                    else
                        cdsColunasFluxo.FieldByName('TITULO').AsString:=
                           FormatDateTime('mm/yyyy',dDataRef)+' - '+Copy(Trim(sTipoFluxo),3,1);

                cdsColunasFluxo.FieldByName('SUBTITULO').AsString:=IntToStr(iContador);
                cdsColunasFluxo.FieldByName('SABDOM').AsString:='N';

                if (iNumMaxFluxos=1) then
                    cdsColunasFluxo.FieldByName('TIPOFLUXO').AsString:=sTipoFluxo
                else
                    if (iNumFluxo=1) then
                        cdsColunasFluxo.FieldByName('TIPOFLUXO').AsString:=Copy(Trim(sTipoFluxo),1,1)
                    else
                        cdsColunasFluxo.FieldByName('TIPOFLUXO').AsString:=Copy(Trim(sTipoFluxo),3,1);

                cdsColunasFluxo.Post;
             end;

             dDataRef:=dDataRefAux;
             
          until (dDataRef>=dDataFinaL);
       end; //Fim Fluxo Mensal

    Result:=cdsColunasFluxo.Data;
   finally
      cdsColunasFluxo.Free;
   end;
end;

function TCtrlFluxoCaixa.GeraLinhasFluxo(ParamFluxo: TParamFluxo; bGeraValores: Boolean;
                                         rSaldoInicial, rIDFluxoCaixa: Double): OleVariant;
var
   sFluxo      : String;
   sTipoFlxAux : String;
   sSql        : TCMSqlParams;
   sAuxSql     : String;
begin
   sFluxo:=BuscaNomeFluxo(ParamFluxo.sTipoFluxo);

   if (Trim(ParamFluxo.sUneCodigo)<>'') or (ParamFluxo.sQuebra='UN') then
       sFluxo:=' (SELECT U.UNECODIGO, U.NOME, F.* '+
               'FROM UNIDNEGOCIO U, '+sFluxo+' F '+
               'WHERE (U.IDPESSOA = F.IDPESSOA) AND (U.UNIDNEGOC = F.UNIDNEGOC)) ';

   sSql:=TCMSqlParams.Create(nil);
   with sSql.SQL do
   try
      //Estrutura de Saldo Anterior
      Add(' SELECT ');

      if (ParamFluxo.sQuebra='UN') then
      begin
         Add('   ''0'' AS UNECODIGO, ');
         Add('   '' '' AS UNIDADENEG, ');
         Add('   0.00 AS UNIDNEGOC, ');
      end;

      if (ParamFluxo.sQuebra='CR') then
      begin
         Add('   ''0'' AS CODCENTRORESPON, ');
         Add('   '' '' AS NOME, ');
      end;

      if (ParamFluxo.sQuebra='CC') then
      begin
         Add('   ''0'' AS CODCENTROCUSTO, ');
         Add('   '' '' AS NOME, ');
      end;

      Add('   0.00 AS POSFAIXA, '); //este campo serve apenas para posicionar os Saldos
      Add('   0.00 AS ORDEM, ');
      Add('   ''A''  AS POSICAO, ');
      Add('   0.00 AS CODLINHAFLUXO, ');
      Add('   0.00 AS CODCOMPLINHA, ');
      Add('   '''+sTitSalAnterior+''' AS LINHAFLUXO, ');
      Add('   ''0'' AS CODTIPRECDES, ');
      Add('   0.00 AS CODTIPDOC, ');
      Add('   ''R'' AS RECPAG, ');
      Add('   0.00 AS NUMCARCODTRD, ');
      Add('   ''X'' AS TIPOCALCULO, ');
      Add('   ''N'' AS FLGACUMULA, ');
      Add('   ''I'' AS POSICAOTOTAL, ');
      Add('   0.00 AS TOTAL, ');
      Add('   ''clBlack          '' AS CORCAMPO, ');
      Add('   0  AS NUMTERMOS, ');
      Add('   ''#'' AS LINHATOTAL ');
      Add('FROM PARAMFINANC WHERE (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ');

      Add('/* Linhas do Fluxo  */');
      Add('UNION ALL  ');

      //Estrutura das Linhas do Fluxo
      Add('(SELECT ');

      //Estrutura para quebra por Unidade de Negócio,Centro de Responsabilidade ou Centro de Custo
      if (ParamFluxo.sQuebra='UN') then
      begin
         Add('   LF.UNECODIGO, ');
         Add('   LF.UNIDADENEG, ');
         Add('   LF.UNIDNEGOC, ');
      end;

      if (ParamFluxo.sQuebra='CR') then
      begin
         Add('   LF.CODCENTRORESPON, ');
         Add('   LF.NOME, ');
      end;

      if (ParamFluxo.sQuebra='CC') then
      begin
         Add('   LF.CODCENTROCUSTO, ');
         Add('   LF.NOME, ');
      end;

      Add('   1.00 AS POSFAIXA, '); //este campo serve apenas para posicionar os Saldos
      Add('   LF.ORDEM, ');
      Add('   LF.POSICAO, ');
      Add('   LF.CODLINHAFLUXO, ');
      Add('   LF.CODCOMPLINHA, ');
      Add('   LF.LINHAFLUXO, ');
      Add('   LF.CODTIPRECDES, ');
      Add('   LF.CODTIPDOC, ');
      Add('   LF.RECPAG, ');
      Add('   LF.NUMCARCODTRD, ');
      Add('   LF.TIPOCALCULO, ');
      Add('   LF.FLGACUMULA, ');
      Add('   LF.POSICAOTOTAL, ');

      if bGeraValores then
      begin
         Add('   DECODE(LF.TIPOCALCULO,''R'',TOTTRD.Total,''P'',TotTRD.Total, '+
                                      '''C'',TOTTDOC.Total,''D'',TotTDOC.Total ) AS TOTAL, ');
         if (ParamFluxo.sTipoFluxo='P') then
         begin
            Add('   DECODE(LF.TIPOCALCULO,''C'',DECODE(QtdePrevTDOC.NumTermComPrev,null,'''+
                                          ParamFluxo.Legenda.sCorRecSemPrev+''','''+
                                          ParamFluxo.Legenda.sCorRecComPrev+'''),');
            Add('                         ''D'',DECODE(QtdePrevTDOC.NumTermComPrev,null,'''+
                                          ParamFluxo.Legenda.sCorPgtoSemPrev+''','''+
                                          ParamFluxo.Legenda.sCorPgtoComPrev+'''),');
            Add('                         ''R'',DECODE(QtdePrevTRD.NumTermComPrev,null,'''+
                                          ParamFluxo.Legenda.sCorRecSemPrev+''','''+
                                          ParamFluxo.Legenda.sCorRecComPrev+'''),');
            Add('                         ''P'',DECODE(QtdePrevTRD.NumTermComPrev,null,'''+
                                          ParamFluxo.Legenda.sCorPgtoSemPrev+''','''+
                                          ParamFluxo.Legenda.sCorPgtoComPrev+'''),''clBlack'')AS CORCAMPO, ');
         end
         else
            Add('   ''clBlack'' AS CORCAMPO, ');
      end
      else
      begin
         Add('   0.00 AS TOTAL, ');
         Add('   ''clBlack'' AS CORCAMPO, ');
      end;

      Add('   NVL(DECODE(LF.TIPOCALCULO,''R'',NumTRD.NaoZerados,'+
                                       '''P'',NumTRD.NaoZerados,'+
                                       '''C'',NumTDOC.NaoZerados,'+
                                       '''D'',NumTDOC.NaoZerados,0),0) AS NUMTERMOS, ');

      Add('   LF.LINHATOTAL ');
      Add('FROM ');

      if (ParamFluxo.sQuebra<>'') then
      begin
         Add('   (SELECT ');
         if (ParamFluxo.sQuebra='UN') then
         begin
            Add('       UN.UNECODIGO, ');
            Add('       UN.NOME AS UNIDADENEG, ');
            Add('       UN.UNIDNEGOC, ');
         end;

         if (ParamFluxo.sQuebra='CR') then
         begin
            Add('       CR.CODCENTRORESPON, ');
            Add('       CR.NOME, ');
         end;

         if (ParamFluxo.sQuebra='CC') then
         begin
            Add('       CC.CODCENTROCUSTO, ');
            Add('       CC.NOME, ');
         end;

         Add('       1.00 AS POSFAIXA, '); //este campo serve apenas para posicionar os Saldos
         Add('       LF1.ORDEM, ');
         Add('       LF1.POSICAO, ');
         Add('       LF1.CODLINHAFLUXO, ');
         Add('       LF1.CODCOMPLINHA, ');
         Add('       LF1.LINHAFLUXO, ');
         Add('       LF1.CODTIPRECDES, ');
         Add('       LF1.CODTIPDOC, ');
         Add('       LF1.RECPAG, ');
         Add('       LF1.NUMCARCODTRD, ');
         Add('       LF1.TIPOCALCULO, ');
         Add('       LF1.FLGACUMULA, ');
         Add('       LF1.POSICAOTOTAL, ');
         Add('       LF1.LINHATOTAL ');
         Add('    FROM ');
      end;

      // Estrutrura que fornece as Linhas Sintéticas
      Add('    /* Linhas do MontaFluxo */');
      Add('       (SELECT ');
      Add('           1.00 AS POSFAIXA, '); //este campo serve apenas para posicionar os Saldos
      Add('           M.ORDEM, ');
      Add('           DECODE(M.POSICAOTOTAL,''I'',''A'',''Z'') AS POSICAO, ');
      Add('           M.CODLINHAFLUXO, ');
      Add('           M.CODLINHAFLUXO AS CODCOMPLINHA, ');
      Add('           M.DESCRICAO AS LINHAFLUXO, ');
      Add('           null AS CODTIPRECDES, ');
      Add('           0.00 AS CODTIPDOC, ');
      Add('           null AS RECPAG, ');
      Add('           0.00 AS NUMCARCODTRD, ');
      Add('           M.TIPOCALCULO, ');
      Add('           M.FLGACUMULA, ');
      Add('           M.POSICAOTOTAL, ');
      Add('           DECODE(M.TIPOCALCULO,''T'',null,''#'') AS LINHATOTAL ');
      Add('        FROM ');
      Add('           MONTAFLUXO M ');
      Add('        WHERE ');
      Add('           (M.IDPESSOA  = '+FloatToStr(F_rIDPessoa)+') AND ');
      Add('           (M.IDFLUXOCAIXA  = '+FloatToStr(rIDFluxoCaixa)+') ');
      Add('       UNION ALL ');
      // Estrutrura que fornece as Linhas do Fluxo Analítico
      Add('    /* Linhas do CompFluxo */');
      Add('        (SELECT ');
      Add('           1.00 AS POSFAIXA, '); //este campo serve apenas para posicionar os Saldos
      Add('           M.ORDEM, ');
      Add('           ''T'' AS POSICAO, ');
      Add('           M.CODLINHAFLUXO, ');
      Add('           C.CODCOMPLINHA, ');
      Add('           ''   ''||T.DESCRICAO AS LINHAFLUXO, ');
      Add('           C.CODTIPRECDES, ');
      Add('           C.CODTIPDOC, ');
      Add('           T.RECPAG, ');
      Add('           TO_NUMBER(DECODE(Length(RTrim(C.CODTIPRECDES)),null,0,Length(RTrim(C.CODTIPRECDES)))) '+
                      'AS NUMCARCODTRD, ');
      Add('           M.TIPOCALCULO, ');
      Add('           M.FLGACUMULA, ');
      Add('           M.POSICAOTOTAL, ');
      Add('           ''S'' AS LINHATOTAL ');
      Add('        FROM ');
      Add('           MONTAFLUXO M, ');
      Add('           COMPFLUXO C, ');
      Add('           TIPORECEBDESEMB T ');
      Add('        WHERE ');
      Add('           (C.CODTIPRECDES = T.CODTIPRECDES(+)) AND ');
      Add('           (C.RECPAG = T.RECPAG(+)) AND ');
      Add('           (C.IDPESSOA = T.IDPESSOA(+)) AND ');
      Add('           (C.CODLINHAFLUXO = M.CODLINHAFLUXO) AND ');
      Add('           (C.IDFLUXOCAIXA = M.IDFLUXOCAIXA) AND ');
      Add('           (M.IDPESSOA  = '+FloatToStr(F_rIDPessoa)+') AND ');
      Add('           (M.IDFLUXOCAIXA  = '+FloatToStr(rIDFluxoCaixa)+') AND ');
      Add('           (M.TIPOCALCULO<>''C'') AND ');
      Add('           (M.TIPOCALCULO<>''D'')) ');
      Add('       UNION ALL ');
      // Estrutrura que fornece as Sub-Linhas do Fluxo Analítico
      Add('    /* Sub-Linhas do CompFluxo */');
      Add('        (SELECT ');
      Add('           1.00 AS POSFAIXA, '); //este campo serve apenas para posicionar os Saldos
      Add('           M.ORDEM, ');
      Add('           ''T'' AS POSICAO, ');
      Add('           M.CODLINHAFLUXO, ');
      Add('           C.CODCOMPLINHA, ');
      Add('           ''   ''||SubStr(''                    '',1,Length(RTrim(T.CODTIPRECDES)))||'+
                             'T.DESCRICAO AS LINHAFLUXO, ');
      Add('           T.CODTIPRECDES, ');
      Add('           C.CODTIPDOC, ');
      Add('           T.RECPAG, ');
      Add('           TO_NUMBER(DECODE(Length(RTrim(T.CODTIPRECDES)),null,0,Length(RTrim(T.CODTIPRECDES)))) '+
                                    'AS NUMCARCODTRD, ');
      Add('           M.TIPOCALCULO, ');
      Add('           M.FLGACUMULA, ');
      Add('           M.POSICAOTOTAL, ');
      Add('           ''N'' AS LINHATOTAL ');
      Add('        FROM ');
      Add('           TIPORECEBDESEMB T, ');
      Add('           COMPFLUXO C, ');
      Add('           MONTAFLUXO M ');
      Add('        WHERE ');
      Add('           (RTrim(C.CODTIPRECDES) = SubStr(RTrim(T.CODTIPRECDES),1,Length(RTrim(C.CODTIPRECDES)))) AND ');
      Add('           (RTrim(C.CODTIPRECDES)<>RTrim(T.CODTIPRECDES)) AND ');
      Add('           (C.RECPAG = T.RECPAG) AND ');
      Add('           (C.IDPESSOA = T.IDPESSOA) AND ');
      Add('           (C.CODLINHAFLUXO = M.CODLINHAFLUXO) AND ');
      Add('           (C.IDFLUXOCAIXA = M.IDFLUXOCAIXA) AND ');
      Add('           (M.IDPESSOA  = '+FloatToStr(F_rIDPessoa)+') AND ');
      Add('           (M.IDFLUXOCAIXA  = '+FloatToStr(rIDFluxoCaixa)+') AND ');
      Add('           (M.TIPOCALCULO<>''C'') AND ');
      Add('           (M.TIPOCALCULO<>''D'')) ');
      Add('       UNION ALL ');
      // Estrutrura que fornece as Linhas por Tipo de Documento
      Add('     /* Linhas da Montagem por Codigo de Tipo de Documento */');
      Add('        (SELECT ');
      Add('           1.00 AS POSFAIXA, '); //este campo serve apenas para posicionar os Saldos
      Add('           M.ORDEM, ');
      Add('           ''D'' AS POSICAO, ');
      Add('           M.CODLINHAFLUXO, ');
      Add('           C.CODCOMPLINHA, ');
      Add('           ''    ''||T.DESCRICAO AS LINHAFLUXO, ');
      Add('           C.CODTIPRECDES, ');
      Add('           C.CODTIPDOC, ');
      Add('           T.RECPAG, ');
      Add('           0.00 AS NUMCARCODTRD, ');
      Add('           M.TIPOCALCULO, ');
      Add('           M.FLGACUMULA, ');
      Add('           M.POSICAOTOTAL, ');
      Add('           ''S'' AS LINHATOTAL ');
      Add('        FROM ');
      Add('           MONTAFLUXO M, ');
      Add('           COMPFLUXO C, ');
      Add('           TIPODOCRECPAG T ');
      Add('        WHERE ');
      Add('           (M.CODLINHAFLUXO = C.CODLINHAFLUXO) AND ');
      Add('           (M.IDFLUXOCAIXA = C.IDFLUXOCAIXA) AND ');
      Add('           (M.IDPESSOA  = '+FloatToStr(F_rIDPessoa)+') AND ');
      Add('           (M.IDFLUXOCAIXA  = '+FloatToStr(rIDFluxoCaixa)+') AND ');

      if (ParamFluxo.sQuebra<>'') then
         Add('           (T.CODTIPDOC = C.CODTIPDOC))) LF1 ')
      else
         Add('           (T.CODTIPDOC = C.CODTIPDOC))) LF ');

      //------------------------------------------------------------------------
      //Estrutura para quebra por Unidade de Negócio, Centro de Responsabilidade 
      // ou Centro de Custo
      //------------------------------------------------------------------------
      if (ParamFluxo.sQuebra='UN') then
      begin
         if not(ParamFluxo.bFlxComparativo) then
         begin
            Add('   ,(SELECT DISTINCT ');
            Add('        Flx.UNECODIGO, ');
            Add('        Flx.NOME, ');
            Add('        Flx.UNIDNEGOC ');
            Add('     FROM ');
            Add('        '+sFluxo+' Flx ');
            Add('     WHERE ');
            Add('        (Flx.IDPESSOA '+ParamFluxo.sFiltroPessoa+') ');
            MontaFiltro(sSql,ParamFluxo,True);
            Add('    ) UN ');
         end
         else
         begin
            //Estrutura de Unidades de Negócio para Fluxo Comparativo Orçado x Realizado
            sTipoFlxAux:=ParamFluxo.sTipoFluxo;

            Add('   ,( SELECT DISTINCT ');
            Add('         Flx.UNECODIGO, ');
            Add('         Flx.NOME, ');
            Add('         Flx.UNIDNEGOC ');
            Add('      FROM ');
            Add('         (SELECT ');
            Add('             U.UNECODIGO, ');
            Add('             U.NOME, ');
            Add('             F.* ');
            Add('          FROM ');
            Add('             UNIDNEGOCIO U, ');
            Add('             FLUXOORCADO F ');
            Add('          WHERE ');
            Add('             (F.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
            Add('             (U.IDPESSOA = F.IDPESSOA) AND ');
            Add('             (U.UNIDNEGOC = F.UNIDNEGOC)) Flx ');
            Add('      WHERE ');
            Add('         (Flx.IDPESSOA '+ParamFluxo.sFiltroPessoa+') ');

            //Monta Filtro para o Fluxo Orçado
            ParamFluxo.sTipoFluxo:='O';
            MontaFiltro(sSql,ParamFluxo,True);

            Add('     UNION');
            Add('      SELECT DISTINCT ');
            Add('         Flx.UNECODIGO, ');
            Add('         Flx.NOME, ');
            Add('         Flx.UNIDNEGOC ');
            Add('      FROM ');
            Add('        (SELECT ');
            Add('            U.UNECODIGO, ');
            Add('            U.NOME, ');
            Add('            F.* ');
            Add('         FROM ');
            Add('            UNIDNEGOCIO U, ');
            Add('            FLUXOREAL F ');
            Add('         WHERE ');
            Add('            (F.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
            Add('            (U.IDPESSOA = F.IDPESSOA) AND ');
            Add('            (U.UNIDNEGOC = F.UNIDNEGOC)) Flx ');
            Add('      WHERE ');
            Add('         (Flx.IDPESSOA '+ParamFluxo.sFiltroPessoa+') ');

            //Monta Filtro para o Fluxo Realizado
            ParamFluxo.sTipoFluxo:='R';
            MontaFiltro(sSql,ParamFluxo,True);
            Add('    ) UN ');

            ParamFluxo.sTipoFluxo:=sTipoFlxAux;
         end;
      end;  //Fim quebra UN

      if (ParamFluxo.sQuebra='CR') then
      begin
         if not(ParamFluxo.bFlxComparativo) then
         begin
            Add('   ,(SELECT DISTINCT ');
            Add('        C.CODCENTRORESPON, ');
            Add('        C.NOME ');
            Add('     FROM ');
            Add('        '+sFluxo+' Flx, ');
            Add('        CENTRESPON C ');
            Add('     WHERE ');
            Add('        (Flx.CODCENTRORESPON = C.CODCENTRORESPON) AND ');
            Add('        (Flx.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
            Add('        (Flx.IDPESSOA = C.IDPESSOA) ');
            MontaFiltro(sSql,ParamFluxo,True);
            Add('     ) CR ');
         end
         else
         begin
            //Estrutura de Centros de responsabilidade para Fluxo Comparativo Orçado x Realizado
            sTipoFlxAux:=ParamFluxo.sTipoFluxo;

            Add('   ,( SELECT DISTINCT ');
            Add('         C.CODCENTRORESPON, ');
            Add('         C.NOME ');
            Add('      FROM ');
            Add('         CENTRESPON C, ');

            //Estrutura de filtragem por unidade/projeto hierárquico
            if (Trim(ParamFluxo.sUneCodigo)<>'') then
            begin
               Add('        (SELECT ');
               Add('            U.UNECODIGO, ');
               Add('            U.NOME, F.* ');
               Add('         FROM ');
               Add('            UNIDNEGOCIO U, ');
               Add('            FLUXOORCADO F ');
               Add('         WHERE ');
               Add('            (F.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
               Add('            (U.IDPESSOA = F.IDPESSOA) AND ');
               Add('            (U.UNIDNEGOC = F.UNIDNEGOC)) Flx ');
            end
            else
               Add('         FLUXOORCADO Flx ');

            Add('      WHERE ');
            Add('         (Flx.CODCENTRORESPON = C.CODCENTRORESPON) AND ');
            Add('         (Flx.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
            Add('         (Flx.IDPESSOA = C.IDPessoa) ');

            //Monta filtro para o Fluxo Orçado
            ParamFluxo.sTipoFluxo:='O';
            MontaFiltro(sSql,ParamFluxo,True);

            Add('     UNION ');
            
            Add('      SELECT DISTINCT ');
            Add('         C.CODCENTRORESPON, ');
            Add('         C.NOME ');
            Add('      FROM ');
            Add('         CENTRESPON C, ');

            //Estrutura de filtragem por unidade/projeto hierárquico
            if (Trim(ParamFluxo.sUneCodigo)<>'') then
            begin
               Add('        (SELECT ');
               Add('            U.UNECODIGO, ');
               Add('            U.NOME, F.* ');
               Add('         FROM ');
               Add('            UNIDNEGOCIO U, ');
               Add('            FLUXOREAL F ');
               Add('         WHERE ');
               Add('            (F.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
               Add('            (U.IDPESSOA = F.IDPESSOA) AND ');
               Add('            (U.UNIDNEGOC = F.UNIDNEGOC)) Flx ');
            end
            else
               Add('      FLUXOREAL Flx ');

            Add('      WHERE ');
            Add('         (Flx.CODCENTRORESPON = C.CODCENTRORESPON) AND ');
            Add('         (Flx.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
            Add('         (Flx.IDPESSOA = C.IDPESSOA) ');

            //Monta filtro para o Fluxo Real
            ParamFluxo.sTipoFluxo:='R';
            MontaFiltro(sSql,ParamFluxo,True);
            
            Add('    ) CR ');
            ParamFluxo.sTipoFluxo:=sTipoFlxAux;
         end;
      end; //Fim quebra CR

      if (ParamFluxo.sQuebra='CC') then
      begin
         if not(ParamFluxo.bFlxComparativo) then
         begin
            Add('   ,(SELECT DISTINCT ');
            Add('        C.CODCENTROCUSTO, ');
            Add('        C.NOME ');
            Add('     FROM ');
            Add('        '+sFluxo+' Flx, ');
            Add('        CENTCUST C ');
            Add('     WHERE ');
            Add('        (Flx.CODCENTROCUSTO = C.CODCENTROCUSTO) AND ');
            Add('        (Flx.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
            Add('        (Flx.IDPESSOA = C.IDEMPRESA) ');
            MontaFiltro(sSql,ParamFluxo,True);
            Add('     ) CC ');
         end
         else
         begin
            //Estrutura de Centros de Custo para Fluxo Comparativo Orçado x Realizado
            sTipoFlxAux:=ParamFluxo.sTipoFluxo;

            Add('   ,( SELECT DISTINCT ');
            Add('         C.CODCENTROCUSTO, ');
            Add('         C.NOME ');
            Add('      FROM ');
            Add('         CENTCUST C, ');
            
            //Estrutura de filtragem por unidade/projeto hierárquico
            if (Trim(ParamFluxo.sUneCodigo)<>'') then
            begin
               Add('        (SELECT ');
               Add('            U.UNECODIGO, ');
               Add('            U.NOME, F.* ');
               Add('         FROM ');
               Add('            UNIDNEGOCIO U, ');
               Add('            FLUXOORCADO F ');
               Add('         WHERE ');
               Add('            (F.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
               Add('            (U.IDPESSOA = F.IDPESSOA) AND ');
               Add('            (U.UNIDNEGOC = F.UNIDNEGOC)) Flx ');
            end
            else
               Add('      FLUXOORCADO Flx ');

            Add('      WHERE ');
            Add('         (Flx.CODCENTROCUSTO = C.CODCENTROCUSTO) AND ');
            Add('         (Flx.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
            Add('         (Flx.IDPESSOA = C.IDEmpresa) ');

            ParamFluxo.sTipoFluxo:='O';
            MontaFiltro(sSql,ParamFluxo,True);
            Add('     UNION ');
            Add('      SELECT DISTINCT ');
            Add('         C.CODCENTROCUSTO, ');
            Add('         C.NOME ');
            Add('      FROM ');
            Add('         CENTCUST C, ');

            //Estrutura de filtragem por unidade/projeto hierárquico
            if (Trim(ParamFluxo.sUneCodigo)<>'') then
            begin
               Add('         (SELECT ');
               Add('             U.UNECODIGO, ');
               Add('             U.NOME, F.* ');
               Add('         FROM ');
               Add('            UNIDNEGOCIO U, ');
               Add('            FLUXOREAL F ');
               Add('         WHERE ');
               Add('            (F.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
               Add('            (U.IDPESSOA = F.IDPESSOA) AND ');
               Add('            (U.UNIDNEGOC = F.UNIDNEGOC)) Flx ');
            end
            else
               Add('      FLUXOREAL Flx ');

            Add('      WHERE ');
            Add('         (Flx.CODCENTROCUSTO = C.CODCENTROCUSTO) AND ');
            Add('         (Flx.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
            Add('         (Flx.IDPESSOA = C.IDEMPRESA) ');

            ParamFluxo.sTipoFluxo:='R';
            MontaFiltro(sSql,ParamFluxo,True);
            Add('     ) CC ');

            ParamFluxo.sTipoFluxo:=sTipoFlxAux;
         end;
      end; //Fim quebra CC

      if (ParamFluxo.sQuebra<>'') then Add('     ) LF ');

      //Estrutura para geração do Número de termos não zerados de um TRD
      if not(ParamFluxo.bFlxComparativo) then
      begin
         Add('   ,(SELECT ');

         if (ParamFluxo.sQuebra='UN') then Add('        Flx.UNECODIGO, ');
         if (ParamFluxo.sQuebra='CR') then Add('        Flx.CODCENTRORESPON, ');
         if (ParamFluxo.sQuebra='CC') then Add('        Flx.CODCENTROCUSTO, ');

         Add('        TRD.CODTIPRECDES, ');
         Add('        TRD.RECPAG, ');
         Add('        COUNT(*) AS NAOZERADOS ');
         Add('     FROM '+sFluxo+' Flx, ');
         Add('          TIPORECEBDESEMB TRD ');
         Add('     WHERE ');
         Add('        (Flx.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
         Add('        (Flx.IDPESSOA = TRD.IDPESSOA) AND ');
         Add('        (SUBSTR(Flx.CODTIPRECDES,1,LENGTH(RTrim(TRD.CODTIPRECDES))) = '+
                      'RTRIM(TRD.CODTIPRECDES)) AND ');
         Add('        (Flx.RECPAG = TRD.RECPAG) AND ');
         Add('        (Flx.IDPESSOA = TRD.IDPESSOA) AND ');
         Add('        (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) ');

         MontaFiltro(sSql,ParamFluxo,True);

         if (ParamFluxo.sQuebra='')   then
             Add('     GROUP BY TRD.CODTIPRECDES, TRD.RECPAG) NUMTRD, ');
         if (ParamFluxo.sQuebra='UN') then
             Add('     GROUP BY Flx.UNECODIGO, TRD.CODTIPRECDES, TRD.RECPAG) NUMTRD, ');
         if (ParamFluxo.sQuebra='CR') then
             Add('     GROUP BY Flx.CODCENTRORESPON, TRD.CODTIPRECDES, TRD.RECPAG) NUMTRD, ');
         if (ParamFluxo.sQuebra='CC') then
             Add('     GROUP BY Flx.CODCENTROCUSTO, TRD.CODTIPRECDES, TRD.RECPAG) NUMTRD, ');
      end
      else
      begin
         //Estrutura para geração do Número de termos não zerados de um TRD no
         //Fluxo Comparativo Orçado x Realizado

         sTipoFlxAux:=ParamFluxo.sTipoFluxo;

         Add('   ,(SELECT ');

         if (ParamFluxo.sQuebra='UN') then Add('        U.UNECODIGO, ');
         if (ParamFluxo.sQuebra='CR') then Add('        U.CODCENTRORESPON, ');
         if (ParamFluxo.sQuebra='CC') then Add('        U.CODCENTROCUSTO, ');

         Add('        U.CODTIPRECDES, ');
         Add('        U.RECPAG, ');
         Add('        SUM(U.NAOZERADOS) AS NAOZERADOS');
         Add('     FROM ');
         Add('        (SELECT ');

         if (ParamFluxo.sQuebra='UN') then Add('            Flx.UNECODIGO, ');
         if (ParamFluxo.sQuebra='CR') then Add('            Flx.CODCENTRORESPON, ');
         if (ParamFluxo.sQuebra='CC') then Add('            Flx.CODCENTROCUSTO, ');

         Add('            TRD.CODTIPRECDES, ');
         Add('            TRD.RECPAG, ');
         Add('            COUNT(*) AS NAOZERADOS ');

         if (Trim(ParamFluxo.sUneCodigo)<>'') or (ParamFluxo.sQuebra='UN') then
         begin
            Add('      FROM ');
            Add('        (SELECT U.UNECODIGO, ');
            Add('                U.NOME, F.* ');
            Add('         FROM UNIDNEGOCIO U, ');
            Add('              FLUXOORCADO F ');
            Add('         WHERE (U.IDPESSOA = F.IDPESSOA) AND ');
            Add('               (U.UNIDNEGOC = F.UNIDNEGOC)) Flx, ');
         end
         else
            Add('         FROM FLUXOORCADO Flx, ');

         Add('              TIPORECEBDESEMB TRD ');
         Add('         WHERE ');
         Add('            (Flx.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
         Add('            (Flx.IDPESSOA = TRD.IDPessoa) AND ');
         Add('            (SubStr(Flx.CODTIPRECDES,1,Length(RTrim(TRD.CODTIPRECDES))) = '+
                           'RTrim(TRD.CODTIPRECDES)) AND ');
         Add('            (Flx.RECPAG = TRD.RECPAG) AND ');
         Add('            (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) ');

         ParamFluxo.sTipoFluxo:='O';
         MontaFiltro(sSql,ParamFluxo,True);

         if (ParamFluxo.sQuebra='')   then
             Add('         GROUP BY TRD.CODTIPRECDES, TRD.RECPAG ');
         if (ParamFluxo.sQuebra='UN') then
             Add('         GROUP BY Flx.UNECODIGO, TRD.CODTIPRECDES, TRD.RECPAG ');
         if (ParamFluxo.sQuebra='CR') then
             Add('         GROUP BY Flx.CODCENTRORESPON, TRD.CODTIPRECDES, TRD.RECPAG ');
         if (ParamFluxo.sQuebra='CC') then
             Add('         GROUP BY Flx.CODCENTROCUSTO, TRD.CODTIPRECDES, TRD.RECPAG ');

         Add('        UNION ');

         Add('         SELECT ');

         if (ParamFluxo.sQuebra='UN') then Add('            Flx.UNECODIGO, ');
         if (ParamFluxo.sQuebra='CR') then Add('            Flx.CODCENTRORESPON, ');
         if (ParamFluxo.sQuebra='CC') then Add('            Flx.CODCENTROCUSTO, ');

         Add('            TRD.CODTIPRECDES, ');
         Add('            TRD.RECPAG, ');
         Add('            COUNT(*) AS NAOZERADOS ');

         if (Trim(ParamFluxo.sUneCodigo)<>'') or (ParamFluxo.sQuebra='UN') then
         begin
            Add('      FROM ');
            Add('        (SELECT U.UNECODIGO, ');
            Add('                U.NOME, F.* ');
            Add('         FROM UNIDNEGOCIO U, ');
            Add('              FLUXOREAL F ');
            Add('         WHERE (U.IDPESSOA = F.IDPESSOA) AND ');
            Add('               (U.UNIDNEGOC = F.UNIDNEGOC)) Flx, ');
         end
         else
            Add('         FROM FLUXOREAL Flx, ');

         Add('              TIPORECEBDESEMB TRD ');
         Add('         WHERE ');
         Add('            (Flx.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
         Add('            (Flx.IDPESSOA = TRD.IDPESSOA) AND ');
         Add('            (SubStr(Flx.CODTIPRECDES,1,Length(RTrim(TRD.CODTIPRECDES))) = '+
                           'RTrim(TRD.CODTIPRECDES)) AND ');
         Add('            (Flx.RECPAG = TRD.RECPAG) AND ');
         Add('            (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) ');

         ParamFluxo.sTipoFluxo:='R';
         MontaFiltro(sSql,ParamFluxo,True);

         if (ParamFluxo.sQuebra='')   then
             Add('         GROUP BY TRD.CODTIPRECDES, TRD.RECPAG) U ');
         if (ParamFluxo.sQuebra='UN') then
             Add('         GROUP BY FLX.UNECODIGO, TRD.CODTIPRECDES, TRD.RECPAG) U ');
         if (ParamFluxo.sQuebra='CR') then
             Add('         GROUP BY FLX.CODCENTRORESPON, TRD.CODTIPRECDES, TRD.RECPAG) U ');
         if (ParamFluxo.sQuebra='CC') then
             Add('         GROUP BY FLX.CODCENTROCUSTO, TRD.CODTIPRECDES, TRD.RECPAG) U ');

         if (ParamFluxo.sQuebra='')   then
             Add('     GROUP BY U.CODTIPRECDES, U.RECPAG) NumTRD, ');
         if (ParamFluxo.sQuebra='UN') then
             Add('     GROUP BY U.UNECODIGO, U.CODTIPRECDES, U.RECPAG) NumTRD, ');
         if (ParamFluxo.sQuebra='CR') then
             Add('     GROUP BY U.CODCENTRORESPON, U.CODTIPRECDES, U.RECPAG) NumTRD, ');
         if (ParamFluxo.sQuebra='CC') then
             Add('     GROUP BY U.CODCENTROCUSTO, U.CODTIPRECDES, U.RECPAG) NumTRD, ');

         ParamFluxo.sTipoFluxo:=sTipoFlxAux;
      end;

      //Estrutura para geração do Número de termos não zerados de um TDOC
      if not(ParamFluxo.bFlxComparativo) then
      begin
         Add('    (SELECT ');

         if (ParamFluxo.sQuebra='UN') then Add('        Flx.UneCodigo, ');
         if (ParamFluxo.sQuebra='CR') then Add('        Flx.CodCentroRespon, ');
         if (ParamFluxo.sQuebra='CC') then Add('        Flx.CodCentroCusto, ');

         Add('        TDOC.CODTIPDOC, ');
         Add('        TDOC.RECPAG, ');
         Add('        COUNT(*) AS NAOZERADOS ');
         Add('     FROM '+sFluxo+' Flx, ');
         Add('          TIPODOCRECPAG TDOC ');
         Add('     WHERE ');
         Add('        (Flx.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
         Add('        (Flx.CODTIPDOC = TDOC.CODTIPDOC) AND ');
         Add('        NOT (TDOC.CODTIPDOC IS NULL) AND ');
         Add('        (TDOC.CODTIPDOC<>0) AND ');
         Add('        (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) ');

         MontaFiltro(sSql,ParamFluxo,True);

         if (ParamFluxo.sQuebra='')   then
             Add('     GROUP BY TDOC.CODTIPDOC, TDOC.RECPAG) NumTDOC ');
         if (ParamFluxo.sQuebra='UN') then
             Add('     GROUP BY Flx.UNECODIGO, TDOC.CODTIPDOC, TDOC.RECPAG) NumTDOC ');
         if (ParamFluxo.sQuebra='CR') then
             Add('     GROUP BY Flx.CODCENTRORESPON, TDOC.CODTIPDOC, TDOC.RECPAG) NumTDOC ');
         if (ParamFluxo.sQuebra='CC') then
             Add('     GROUP BY Flx.CODCENTROCUSTO, TDOC.CODTIPDOC, TDOC.RECPAG) NumTDOC ');
      end
      else
      begin
         sTipoFlxAux:=ParamFluxo.sTipoFluxo;

         Add('    (SELECT ');

         if (ParamFluxo.sQuebra='UN') then Add('        U.UNECODIGO, ');
         if (ParamFluxo.sQuebra='CR') then Add('        U.CODCENTRORESPON, ');
         if (ParamFluxo.sQuebra='CC') then Add('        U.CODCENTROCUSTO, ');

         Add('        U.CODTIPDOC, ');
         Add('        U.RECPAG, ');
         Add('        SUM(U.NAOZERADOS) AS NAOZERADOS ');
         Add('     FROM ');
         Add('        (SELECT ');

         if (ParamFluxo.sQuebra='UN') then Add('        Flx.UNECODIGO, ');
         if (ParamFluxo.sQuebra='CR') then Add('        Flx.CODCENTRORESPON, ');
         if (ParamFluxo.sQuebra='CC') then Add('        Flx.CODCENTROCUSTO, ');

         Add('            TDOC.CODTIPDOC, ');
         Add('            TDOC.RECPAG, ');
         Add('            COUNT(*) AS NAOZERADOS ');

         if (Trim(ParamFluxo.sUneCodigo)<>'') or (ParamFluxo.sQuebra='UN') then
         begin
            Add('      FROM ');
            Add('        (SELECT U.UNECODIGO, ');
            Add('                U.NOME, F.* ');
            Add('         FROM UNIDNEGOCIO U, ');
            Add('              FLUXOORCADO F ');
            Add('         WHERE (U.IDPESSOA = F.IDPESSOA) AND ');
            Add('               (U.UNIDNEGOC = F.UNIDNEGOC)) Flx, ');
         end
         else
            Add('         FROM FLUXOORCADO Flx, ');

         Add('              TIPODOCRECPAG TDOC ');
         Add('         WHERE ');
         Add('            (Flx.IDPessoa '+ParamFluxo.sFiltroPessoa+') AND ');
         Add('            (Flx.CODTIPDOC = TDOC.CODTIPDOC) AND ');
         Add('             NOT (TDOC.CODTIPDOC IS NULL) AND ');
         Add('            (TDOC.CODTIPDOC<>0) AND ');
         Add('            (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) ');

         ParamFluxo.sTipoFluxo:='O';
         MontaFiltro(sSql,ParamFluxo,True);

         if (ParamFluxo.sQuebra='')   then
             Add('         GROUP BY TDOC.CODTIPDOC, TDOC.RECPAG ');
         if (ParamFluxo.sQuebra='UN') then
             Add('         GROUP BY Flx.UNECODIGO, TDOC.CODTIPDOC, TDOC.RECPAG ');
         if (ParamFluxo.sQuebra='CR') then
             Add('         GROUP BY Flx.CODCENTRORESPON, TDOC.CODTIPDOC, TDOC.RECPAG ');
         if (ParamFluxo.sQuebra='CC') then
             Add('         GROUP BY Flx.CODCENTROCUSTO, TDOC.CODTIPDOC, TDOC.RECPAG ');

         Add('    UNION ');

         Add('        SELECT ');

         if (ParamFluxo.sQuebra='UN') then Add('        Flx.UneCodigo, ');
         if (ParamFluxo.sQuebra='CR') then Add('        Flx.CodCentroRespon, ');
         if (ParamFluxo.sQuebra='CC') then Add('        Flx.CodCentroCusto, ');

         Add('            TDOC.CODTIPDOC, ');
         Add('            TDOC.RECPAG, ');
         Add('            COUNT(*) AS NAOZERADOS ');

         if (Trim(ParamFluxo.sUneCodigo)<>'') or (ParamFluxo.sQuebra='UN') then
         begin
            Add('      FROM ');
            Add('        (SELECT U.UNECODIGO, ');
            Add('                U.NOME, F.* ');
            Add('         FROM UNIDNEGOCIO U, ');
            Add('              FLUXOREAL F ');
            Add('         WHERE (U.IDPESSOA = F.IDPESSOA) AND ');
            Add('               (U.UNIDNEGOC = F.UNIDNEGOC)) Flx, ');
         end
         else
            Add('         FROM FLUXOREAL Flx, ');

         Add('              TIPODOCRECPAG TDOC ');
         Add('         WHERE ');
         Add('            (Flx.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
         Add('            (Flx.CODTIPDOC = TDOC.CODTIPDOC) AND ');
         Add('             NOT (TDOC.CODTIPDOC IS NULL) AND ');
         Add('            (TDOC.CODTIPDOC<>0) AND ');
         Add('            (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) ');

         ParamFluxo.sTipoFluxo:='R';
         MontaFiltro(sSql,ParamFluxo,True);

         if (ParamFluxo.sQuebra='')   then
             Add('         GROUP BY TDOC.CODTIPDOC, TDOC.RECPAG) U ');
         if (ParamFluxo.sQuebra='UN') then
             Add('         GROUP BY Flx.UNECODIGO, TDOC.CODTIPDOC, TDOC.RECPAG) U ');
         if (ParamFluxo.sQuebra='CR') then
             Add('         GROUP BY Flx.CODCENTRORESPON, TDOC.CODTIPDOC, TDOC.RECPAG) U ');
         if (ParamFluxo.sQuebra='CC') then
             Add('         GROUP BY Flx.CODCENTROCUSTO, TDOC.CODTIPDOC, TDOC.RECPAG) U ');

         if (ParamFluxo.sQuebra='')   then
             Add('     GROUP BY U.CODTIPDOC, U.RECPAG) NumTDOC ');
         if (ParamFluxo.sQuebra='UN') then
             Add('     GROUP BY U.UNECODIGO, U.CODTIPDOC, U.RECPAG) NumTDOC ');
         if (ParamFluxo.sQuebra='CR') then
             Add('     GROUP BY U.CODCENTRORESPON, U.CODTIPDOC, U.RECPAG) NumTDOC ');
         if (ParamFluxo.sQuebra='CC') then
             Add('     GROUP BY U.CODCENTROCUSTO, U.CODTIPDOC, U.RECPAG) NumTDOC ');

         ParamFluxo.sTipoFluxo:=sTipoFlxAux;
      end;

      //Estrutura de Geração dos Valores
      if bGeraValores then
      begin
         //Estrutura de Geração de Total dos Tipos de Rec/Des
         Add('   ,(SELECT ');

         if (ParamFluxo.sQuebra='UN') then Add('        Flx.UNECODIGO, ');
         if (ParamFluxo.sQuebra='CR') then Add('        Flx.CODCENTRORESPON, ');
         if (ParamFluxo.sQuebra='CC') then Add('        Flx.CODCENTROCUSTO, ');

         Add('        TRD.CODTIPRECDES, ');
         Add('        TRD.RECPAG, ');

         if (ParamFluxo.sTipoFluxo='R') and (ParamFluxo.rMoeCodigo=0) then
            Add('        Sum(DECODE(TRD.RECPAG,''R'',Flx.VALOR*NVL(CT.COTVALOR,1),'+
                                                   '-Flx.VALOR*NVL(CT.COTVALOR,1))) AS TOTAL ')
         else
            Add('        Sum(DECODE(TRD.RECPAG,''R'',Flx.VALOR,-Flx.VALOR)) AS TOTAL ');

         Add('     FROM '+sFluxo+' Flx, ');
         Add('        TIPORECEBDESEMB TRD ');

         //Estrutura de Conversão de moeda para Fluxo Real
         if (ParamFluxo.sTipoFluxo='R') and (ParamFluxo.rMoeCodigo=0) then
         begin
            Add('       ,COTACAOMOEDA CT ');

            //Estrutura que relaciona DataCFloat a data de cotação de uma moeda
            Add('       ,(SELECT ');
            Add('            DTM.DATACFLOAT, ');
            Add('            C.MOECODIGO, ');
            Add('            MAX(C.COTDATA) AS COTDATA ');
            Add('         FROM ');
            Add('            COTACAOMOEDA C, ');
            Add('            (SELECT DISTINCT ');
            Add('                Flx.DATACFLOAT, ');
            Add('                Flx.MOECODIGO ');
            Add('             FROM ');
            Add('                '+sFluxo+' Flx ');
            Add('             WHERE ');
            Add('                (Flx.IDPESSOA '+ParamFluxo.sFiltroPessoa+') ');

            MontaFiltro(sSql,ParamFluxo,False);

            Add('            ) DTM ');
            Add('         WHERE ');
            Add('            (C.COTDATA <= DTM.DATACFLOAT) AND ');
            Add('            (C.MOECODIGO = DTM.MOECODIGO) ');
            Add('         GROUP BY DTM.DATACFLOAT,C.MOECODIGO) MD ');
         end;

         Add('     WHERE ');
         Add('        (Flx.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
         Add('        (Flx.IDPESSOA = TRD.IDPESSOA) AND ');
         Add('        (SubStr(Flx.CODTIPRECDES,1,Length(RTrim(TRD.CODTIPRECDES))) = '+
             'RTrim(TRD.CODTIPRECDES)) AND ');
         Add('        (Flx.RECPAG = TRD.RECPAG) AND ');
         Add('        (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) ');

         //Join da conversão de moeda para Fluxo Real
         if (ParamFluxo.sTipoFluxo='R') and (ParamFluxo.rMoeCodigo=0) then
         begin
            Add('        AND (Flx.MOECODIGO = MD.MOECODIGO(+)) ');
            Add('        AND (Flx.DATACFLOAT = MD.DATACFLOAT(+)) ');
            Add('        AND (MD.MOECODIGO = CT.MOECODIGO(+)) ');
            Add('        AND (MD.COTDATA = CT.COTDATA(+)) ');
         end;

         MontaFiltro(sSql,ParamFluxo,False);

         if (ParamFluxo.sQuebra='') then
             Add('     GROUP BY TRD.CODTIPRECDES, TRD.RECPAG) TotTRD ');
         if (ParamFluxo.sQuebra='UN') then
             Add('     GROUP BY Flx.UNECODIGO, TRD.CODTIPRECDES, TRD.RECPAG) TotTRD ');
         if (ParamFluxo.sQuebra='CR') then
             Add('     GROUP BY Flx.CODCENTRORESPON, TRD.CODTIPRECDES, TRD.RECPAG) TotTRD ');
         if (ParamFluxo.sQuebra='CC') then
             Add('     GROUP BY Flx.CODCENTROCUSTO, TRD.CODTIPRECDES, TRD.RECPAG) TotTRD ');

         //Estrutura de Geração de Totais dos Tipos Documento
         Add('   ,(SELECT ');
         if (ParamFluxo.sQuebra='UN') then Add('        Flx.UNECODIGO, ');
         if (ParamFluxo.sQuebra='CR') then Add('        Flx.CODCENTRORESPON, ');
         if (ParamFluxo.sQuebra='CC') then Add('        Flx.CODCENTROCUSTO, ');

         Add('        TDOC.CodTipDoc, ');
         Add('        TDOC.RecPag, ');

         if (ParamFluxo.sTipoFluxo='R') and (ParamFluxo.rMoeCodigo=0) then
             Add('        Sum(DECODE(TDOC.RECPAG,''R'',Flx.VALOR*NVL(CT.COTVALOR,1),'+
                                                     '-Flx.VALOR*NVL(CT.COTVALOR,1))) AS TOTAL ')
         else
             Add('        Sum(DECODE(TDOC.RECPAG,''R'',Flx.VALOR,-Flx.VALOR)) AS TOTAL ');

         Add('     FROM '+sFluxo+' Flx, ');
         Add('        TIPODOCRECPAG TDOC ');

         //Estrutura de Conversão de moeda para Fluxo Real
         if (ParamFluxo.sTipoFluxo='R') and (ParamFluxo.rMoeCodigo=0) then
         begin
            Add('       ,COTACAOMOEDA CT ');

            //Estrutura que relaciona DataCFloat a data de cotação de uma moeda
            Add('       ,(SELECT ');
            Add('            DTM.DATACFLOAT, ');
            Add('            C.MOECODIGO, ');
            Add('            MAX(C.COTDATA) AS COTDATA ');
            Add('         FROM ');
            Add('            COTACAOMOEDA C, ');
            Add('            (SELECT DISTINCT ');
            Add('                Flx.DATACFLOAT, ');
            Add('                Flx.MOECODIGO ');
            Add('             FROM ');
            Add('                '+sFluxo+' Flx ');
            Add('             WHERE ');
            Add('                (Flx.IDPessoa '+ParamFluxo.sFiltroPessoa+') ');

            MontaFiltro(sSql,ParamFluxo,False);

            Add('            ) DTM ');
            Add('         WHERE ');
            Add('            (C.COTDATA <= DTM.DATACFLOAT) AND ');
            Add('            (C.MOECODIGO = DTM.MOECODIGO) ');
            Add('         GROUP BY DTM.DATACFLOAT,C.MOECODIGO) MD ');
         end;

         Add('     WHERE ');
         Add('        (Flx.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
         Add('        (Flx.CODTIPDOC = TDOC.CODTIPDOC) AND ');
         Add('         NOT (TDOC.CODTIPDOC IS NULL) AND ');
         Add('        (TDOC.CODTIPDOC<>0) AND ');
         Add('        (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) ');

         //Join da conversão de moeda para Fluxo Real
         if (ParamFluxo.sTipoFluxo='R') and (ParamFluxo.rMoeCodigo=0) then
         begin
            Add('        AND (Flx.MOECODIGO = MD.MOECODIGO(+)) ');
            Add('        AND (Flx.DATACFLOAT = MD.DATACFLOAT(+)) ');
            Add('        AND (MD.MOECODIGO = CT.MOECODIGO(+)) ');
            Add('        AND (MD.COTDATA = CT.COTDATA(+)) ');
         end;

         MontaFiltro(sSql,ParamFluxo,False);

         if (ParamFluxo.sQuebra='') then
             Add('     GROUP BY TDOC.CodTipDoc, TDOC.RecPag) TotTDOC ');
         if (ParamFluxo.sQuebra='UN') then
             Add('     GROUP BY Flx.UneCodigo, TDOC.CODTIPDOC, TDOC.RecPag) TotTDOC ');
         if (ParamFluxo.sQuebra='CR') then
             Add('     GROUP BY Flx.CodCentroRespon, TDOC.CODTIPDOC, TDOC.RecPag) TotTDOC ');
         if (ParamFluxo.sQuebra='CC') then
             Add('     GROUP BY Flx.CodCentroCusto, TDOC.CODTIPDOC, TDOC.RecPag) TotTDOC ');

         //Estrutura de Geração de Cores dos Tipos de Documento
         if (ParamFluxo.sTipoFluxo='P') then
         begin
            Add('   ,(SELECT ');

            if (ParamFluxo.sQuebra='UN') then Add('        Flx.UneCodigo, ');
            if (ParamFluxo.sQuebra='CR') then Add('        Flx.CodCentroRespon, ');
            if (ParamFluxo.sQuebra='CC') then Add('        Flx.CodCentroCusto, ');

            Add('        TRD.CodTipRecDes, ');
            Add('        TRD.RecPag, ');
            Add('        Count(*) AS NumTermComPrev ');
            Add('     FROM '+sFluxo+' Flx, ');
            Add('          TIPORECEBDESEMB TRD ');
            Add('     WHERE ');
            Add('        (Flx.IDPessoa '+ParamFluxo.sFiltroPessoa+') AND ');
            Add('        (Flx.IDPessoa = TRD.IDPessoa) AND ');
            Add('        (SubStr(Flx.CodTipRecDes,1,Length(RTrim(TRD.CODTIPRECDES))) = '+
                'RTrim(TRD.CODTIPRECDES)) AND ');
            Add('        (Flx.RecPag = TRD.RecPag) AND ');
            Add('        (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) AND ');
            Add('        (Flx.FLGPREVISAO = ''S'') ');

            MontaFiltro(sSql,ParamFluxo,False);

            if (ParamFluxo.sQuebra='') then
                Add('     GROUP BY TRD.CodTipRecDes, TRD.RecPag) QtdePrevTRD ');
            if (ParamFluxo.sQuebra='UN') then
                Add('     GROUP BY Flx.UneCodigo, TRD.CodTipRecDes, TRD.RecPag) QtdePrevTRD ');
            if (ParamFluxo.sQuebra='CR') then
                Add('     GROUP BY Flx.CodCentroRespon, TRD.CodTipRecDes, TRD.RecPag) QtdePrevTRD ');
            if (ParamFluxo.sQuebra='CC') then
                Add('     GROUP BY Flx.CodCentroCusto, TRD.CodTipRecDes, TRD.RecPag) QtdePrevTRD ');

            Add('   ,(SELECT ');

            if (ParamFluxo.sQuebra='UN') then Add('        Flx.UneCodigo, ');
            if (ParamFluxo.sQuebra='CR') then Add('        Flx.CodCentroRespon, ');
            if (ParamFluxo.sQuebra='CC') then Add('        Flx.CodCentroCusto, ');

            Add('        TDOC.CodTipDoc, ');
            Add('        TDOC.RecPag, ');
            Add('        Count(*) AS NumTermComPrev ');
            Add('     FROM '+sFluxo+' Flx, ');
            Add('          TIPODOCRECPAG TDOC ');
            Add('     WHERE ');
            Add('        (Flx.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
            Add('        (Flx.CODTIPDOC = TDOC.CODTIPDOC) AND ');
            Add('         NOT (TDOC.CODTIPDOC IS NULL) AND ');
            Add('        (TDOC.CODTIPDOC<>0) AND ');
            Add('        (Flx.VALOR<>0) AND (Flx.VALOR IS NOT NULL) AND ');
            Add('        (Flx.FLGPREVISAO = ''S'') ');

            MontaFiltro(sSql,ParamFluxo,False);

            if (ParamFluxo.sQuebra='') then
               Add('     GROUP BY TDOC.CodTipDoc, TDOC.RecPag) QtdePrevTDOC ');
            if (ParamFluxo.sQuebra='UN') then
                Add('    GROUP BY Flx.UneCodigo, TDOC.CODTIPDOC, TDOC.RecPag) QtdePrevTDOC ');
            if (ParamFluxo.sQuebra='CR') then
                Add('    GROUP BY Flx.CodCentroRespon, TDOC.CODTIPDOC, TDOC.RecPag) QtdePrevTDOC ');
            if (ParamFluxo.sQuebra='CC') then
                Add('    GROUP BY Flx.CodCentroCusto, TDOC.CODTIPDOC, TDOC.RecPag) QtdePrevTDOC ');
         end; //Fim geração de Cores
      end;

      //Estrutura de Filtros e Join's da Qry principal
      Add('WHERE ');
      Add('   (LF.CodTipRecDes = NumTRD.CodTipRecDes(+)) AND ');
      Add('   (LF.RecPag = NumTRD.RecPag(+)) AND ');
      Add('   (LF.CodTipDoc = NumTDOC.CodTipDoc(+)) AND ');
      Add('   (LF.RecPag = NumTDOC.RecPag(+)) ');

      if (ParamFluxo.sQuebra='UN') then
      begin
         Add('   AND (LF.UneCodigo = NumTRD.UneCodigo(+)) ');
         Add('   AND (LF.UneCodigo = NumTDOC.UneCodigo(+)) ');
      end;

      if (ParamFluxo.sQuebra='CR') then
      begin
         Add('   AND (LF.CodCentroRespon = NumTRD.CodCentroRespon(+)) ');
         Add('   AND (LF.CodCentroRespon = NumTDOC.CodCentroRespon(+)) ');
      end;

      if (ParamFluxo.sQuebra='CC') then
      begin
         Add('   AND (LF.CodCentroCusto = NumTRD.CodCentroCusto(+)) ');
         Add('   AND (LF.CodCentroCusto = NumTDOC.CodCentroCusto(+)) ');
      end;

      if bGeraValores then
      begin
         Add('   AND (LF.CodTipRecDes = TotTRD.CodTipRecDes(+)) ');
         Add('   AND (LF.RecPag = TotTRD.RecPag(+)) ');
         Add('   AND (LF.CodTipDoc = TotTDOC.CodTipDoc(+)) ');
         Add('   AND (LF.RecPag = TotTDOC.RecPag(+)) ');

         if (ParamFluxo.sTipoFluxo='P') then
         begin
            Add('   AND (LF.CodTipRecDes = QtdePrevTRD.CodTipRecDes(+)) ');
            Add('   AND (LF.RecPag = QtdePrevTRD.RecPag(+))  ');
            Add('   AND (LF.CodTipDoc = QtdePrevTDOC.CodTipDoc(+)) ');
            Add('   AND (LF.RecPag = QtdePrevTDOC.RecPag(+)) ');
         end;

         if (ParamFluxo.sQuebra='UN') then
         begin
            Add('   AND (LF.UneCodigo = TotTRD.UneCodigo(+)) ');
            Add('   AND (LF.UneCodigo = TotTDOC.UneCodigo(+)) ');
            if (ParamFluxo.sTipoFluxo='P') then
            begin
               Add('   AND (LF.UneCodigo = QtdePrevTRD.UneCodigo(+)) ');
               Add('   AND (LF.UneCodigo = QtdePrevTDOC.UneCodigo(+)) ');
            end;
         end;

         if (ParamFluxo.sQuebra='CR') then
         begin
            Add('   AND (LF.CodCentroRespon = TotTRD.CodCentroRespon(+)) ');
            Add('   AND (LF.CodCentroRespon = TotTDOC.CodCentroRespon(+)) ');
            if (ParamFluxo.sTipoFluxo='P') then
            begin
               Add('   AND (LF.CodCentroRespon = QtdePrevTRD.CodCentroRespon(+)) ');
               Add('   AND (LF.CodCentroRespon = QtdePrevTDOC.CodCentroRespon(+)) ');
            end;
         end;

         if (ParamFluxo.sQuebra='CC') then
         begin
            Add('   AND (LF.CodCentroCusto = TotTRD.CodCentroCusto(+)) ');
            Add('   AND (LF.CodCentroCusto = TotTDOC.CodCentroCusto(+)) ');
            if (ParamFluxo.sTipoFluxo='P') then
            begin
               Add('   AND (LF.CodCentroCusto = QtdePrevTRD.CodCentroCusto(+)) ');
               Add('   AND (LF.CodCentroCusto = QtdePrevTDOC.CodCentroCusto(+)) ');
            end;
         end;
      end;
      Add(')');
      //Estrutura de Saldo a Transportar
      Add('/* Linha de Saldo a Transportar */');
      Add('UNION ALL ');
      Add(' SELECT ');

      if (ParamFluxo.sQuebra='UN') then
      begin
         Add('   ''9999999999'' AS UNECODIGO, ');
         Add('   '' '' AS UNIDADENEG, ');
         Add('   0.00 AS UNIDNEGOC, ');
      end;

      if (ParamFluxo.sQuebra='CR') then
      begin
         Add('   ''9999999999'' AS CODCENTRORESPON, ');
         Add('   '' '' AS Nome, ');
      end;

      if (ParamFluxo.sQuebra='CC') then
      begin
         Add('   ''9999999999'' AS CODCENTROCUSTO, ');
         Add('   '' '' AS Nome, ');
      end;

      Add('   2.00 AS POSFAIXA, '); //este campo serve apenas para posicionar os Saldos
      Add('   0.00 AS ORDEM, ');
      Add('   ''Z''  AS POSICAO, ');
      Add('   0.00 AS CODLINHAFLUXO, ');
      Add('   0.00 AS CODCOMPLINHA, ');
      Add('   '''+sTipSalTransp+''' AS LINHAFLUXO, ');
      Add('   ''99999999'' AS CODTIPRECDES, ');
      Add('   0.00 AS CODTIPDOC, ');
      Add('   ''R'' RECPAG, ');
      Add('   0.00 AS NUMCARCODTRD, ');
      Add('   ''X'' AS TIPOCALCULO, ');
      Add('   ''N'' AS FLGACUMULA, ');
      Add('   ''F'' AS POSICAOTOTAL, ');
      Add('   0.00 AS TOTAL, ');
      Add('   ''clBlack          '' AS CORCAMPO, ');
      Add('   0  AS NUMTERMOS, ');
      Add('   ''#'' AS LINHATOTAL ');
      Add(' FROM PARAMFINANC WHERE (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ');

      //Estrutura de Ordenação
      Add('ORDER BY ');
      Add('   POSFAIXA, ');

      //Estrutura para quebra por Unidade de Negócio ou Centro de Responsabilidade
      if (ParamFluxo.sQuebra='UN') then Add('   UNIDADENEG, ');
      if (ParamFluxo.sQuebra='CR') then Add('   NOME, ');
      if (ParamFluxo.sQuebra='CC') then Add('   NOME, ');

      Add('   ORDEM, ');
      Add('   POSICAO, ');
      Add('   CODTIPRECDES, ');
      Add('   CODTIPDOC ');

      //Linha de Teste
      //sSql.SQL.SaveToFile('C:\ProjetosCM7\CFinan\LinhasFluxoOracle'+FormatFloat('000',iNumArq)+'.txt'); //linha de verificação de query

      if (iTipoBD_Padrao in [2,3]) then
      begin
         TCMTraduzSQL.Traduzir(sSql.SQL);
         sAuxSql := sSql.SQL.Text;
         sAuxSql := StringReplace(sAuxSql, 'CM.', '', [rfReplaceAll, rfIgnoreCase]);
         sSql.SQL.Text := sAuxSql;
      end;

      //sSql.SQL.SaveToFile('C:\ProjetosCM7\CFinan\LinhasFluxoSQL'+FormatFloat('000',iNumArq)+'.txt'); //linha de verificação de query

      Inc(iNumArq);

      sSql.ControlObject:=Self;
      Result:=sSql.Data;

   finally
       sSql.Free;
   end;

   if bGeraValores then
   begin
      //Gera Saldo Inicial
      if (rSaldoInicial=0) then rSaldoInicial:=GeraSaldoInicialFluxo(ParamFluxo);
      if (rSaldoInicial=-0.000001) then rSaldoInicial:=0;
      Result:=GeraSomatorios(Result,ParamFluxo,rSaldoInicial);
   end;
end;

function TCtrlFluxoCaixa.GeraLinhasSaldo(ParamFluxo: TParamFluxo; bGeraValores: Boolean;
                                         rSaldoFluxo: Double): OleVariant;
var
   rTotalAux : Double;
   sSql      : TCMSqlParams;
   cdsAux    : TCMClientDataSet;
begin
   sSql:=TCMSqlParams.Create(nil);
   cdsAux:=TCMClientDataSet.Create(nil);
   with sSql.SQL do
   try
      Add(' SELECT ');
      Add('    U.ORDEM, ');

      if (bGeraValores) then
          Add('    U.TIPO, ')
      else
          Add('    ''  '' AS TIPO, ');

      Add('    U.CODPORTADOR, ');
      Add('    U.DESCRICAO, ');

      if (bGeraValores) then
          Add('    SAL.VALOR ')
      else
          Add('    0.00 AS VALOR ');

      Add(' FROM ');
      Add('    (SELECT ');
      Add('        0.00 AS ORDEM, ');
      Add('       -9.99 AS CODPORTADOR,');
      Add('        ''LT'' AS TIPO,');  //Linha de Titulo
      Add('        ''--> '+CMTranslate('Saldo das Contas')+''' AS  DESCRICAO ');
      Add('     FROM ');
      Add('        PARAMFINANC ');
      Add('     WHERE ');
      Add('       (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ');
      Add('    UNION ALL ');
      Add('    (SELECT ');
      Add('        1.00 AS ORDEM, ');
      Add('        PC.CODPORTADOR, ');
      Add('        ''LD'' AS TIPO,');  //Linha de Detalhe
      Add('        ''    ''||PC.DESCRICAO AS DESCRICAO ');
      Add('     FROM ');
      Add('        PORTADORCONTA PC ');
      Add('     WHERE ');
      Add('       (PC.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
      Add('       ((PC.FLGSTATUS = ''A'') OR (PC.FLGSTATUS IS NULL))) ');
      Add('    UNION ALL ');
      Add('    (SELECT ');
      Add('        2.00 AS ORDEM, ');
      Add('       -9.99 AS CODPORTADOR, ');
      Add('        ''LB'' AS TIPO,');  //Linha de Total dos Bancos
      Add('        ''    - '+CMTranslate('Total dos Bancos')+''' AS  DESCRICAO ');
      Add('     FROM ');
      Add('        PARAMFINANC ');
      Add('     WHERE ');
      Add('       (IDPESSOA = '+FloatToStr(F_rIDPessoa)+')) ');
      Add('    UNION ALL ');
      Add('    (SELECT ');
      Add('        3.01 AS ORDEM, ');
      Add('       -9.99 AS CODPORTADOR, ');
      Add('        ''LR'' AS TIPO,');  //Linha de Recebimentos Pendentes
      Add('        ''    - '+CMTranslate('Conciliações Pendentes')+''' AS  DESCRICAO ');
      Add('     FROM ');
      Add('        PARAMFINANC ');
      Add('     WHERE ');
      Add('       (IDPESSOA = '+FloatToStr(F_rIDPessoa)+')) ');
      Add('    UNION ALL ');
      Add('    (SELECT ');
      Add('        3.02 AS ORDEM, ');
      Add('       -9.99 AS CODPORTADOR, ');
      Add('        ''LC'' AS TIPO,');  //Linha de Cheques Pendentes
      Add('        ''    - '+CMTranslate('Cheques Pendentes')+''' AS  DESCRICAO ');
      Add('     FROM ');
      Add('        PARAMFINANC ');
      Add('     WHERE ');
      Add('       (IDPESSOA = '+FloatToStr(F_rIDPessoa)+')) ');
      Add('    UNION ALL ');
      Add('    (SELECT ');
      Add('        4.00 AS ORDEM, ');
      Add('       -9.99 AS CODPORTADOR, ');
      Add('        ''LP'' AS TIPO,');  //Linha de Total Disponível
      Add('        ''    - '+CMTranslate('Total Disponível')+''' AS  DESCRICAO ');
      Add('     FROM ');
      Add('        PARAMFINANC ');
      Add('     WHERE ');
      Add('       (IDPESSOA = '+FloatToStr(F_rIDPessoa)+')) ');
      Add('    UNION ALL ');
      Add('    (SELECT ');
      Add('        5.00 AS ORDEM, ');
      Add('       -9.99 AS CODPORTADOR, ');
      Add('        ''LF'' AS TIPO,');  //Linha de Diferença
      Add('        ''    - '+CMTranslate('Diferença')+''' AS  DESCRICAO ');
      Add('     FROM ');
      Add('        PARAMFINANC ');
      Add('     WHERE ');
      Add('       (IDPESSOA = '+FloatToStr(F_rIDPessoa)+')) ');
      Add('    ) U ');

      if (bGeraValores) then
      begin
         Add('   ,(SELECT ');
         Add('        C.CODPORTADOR, ');
         Add('        ''LD'' AS TIPO, ');
         Add('        SUM(DECODE(M.ENTRADASAIDA,''E'',M.VALORLANCFINAN,-M.VALORLANCFINAN)) AS VALOR ');
         Add('     FROM ');
         Add('        PORTADORCONTA C, ');
         Add('        MOVIMFINANC M ');
         Add('     WHERE ');
         Add('        (M.DATACONCILIACAO <= TO_DATE('''+
             FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataFinal) + ''',''DD/MM/YYYY'')) AND ');
         Add('        (M.DATACONCILIACAO IS NOT NULL) AND ');

         if bConsMovRealFP then
            Add('        (M.DATALANCFINAN <= TO_DATE('''+
                FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataFinal) + ''',''DD/MM/YYYY'')) AND ');

         Add('        (M.CODPORTADOR = C.CODPORTADOR) AND ');
         Add('        (M.IDPESSOA = C.IDPESSOA) AND ');
         Add('        (M.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
         Add('        ((C.FLGSTATUS = ''A'') OR (C.FLGSTATUS IS NULL)) ');
         Add('     GROUP BY C.CODPORTADOR ');
         Add('    UNION ALL ');

         Add('    (SELECT ');
         Add('        -9.99 AS CODPORTADOR, ');
         Add('        ''LR'' AS TIPO, ');
         Add('        SUM(M.VALORLANCFINAN) AS VALOR ');
         Add('     FROM ');
         Add('        PORTADORCONTA C, ');
         Add('        MOVIMFINANC M ');
         Add('     WHERE ');
         Add('        (M.ENTRADASAIDA = ''E'') AND ');
         Add('        ((M.DATACONCILIACAO IS NULL) OR ');
         Add('         (M.DATACONCILIACAO > TO_DATE('''+
             FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataFinal) + ''',''DD/MM/YYYY''))) AND ');

         if bConsMovRealFP then
            Add('        (M.DATALANCFINAN <= TO_DATE('''+
                FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataFinal) + ''',''DD/MM/YYYY'')) AND ');

         Add('        (M.CODPORTADOR = C.CODPORTADOR) AND ');
         Add('        (M.IDPESSOA = C.IDPESSOA) AND ');
         Add('        (M.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
         Add('        ((C.FLGSTATUS = ''A'') OR (C.FLGSTATUS IS NULL)) ) ');

         Add('    UNION ALL ');
         Add('    (SELECT ');
         Add('        -9.99 AS CODPORTADOR, ');
         Add('        ''LC'' AS TIPO, ');
         Add('        SUM(M.VALORLANCFINAN) AS VALOR ');
         Add('     FROM ');
         Add('        PORTADORCONTA C, ');
         Add('        MOVIMFINANC M ');
         Add('     WHERE ');
         Add('        (M.ENTRADASAIDA = ''S'') AND ');
         Add('        ((M.DATACONCILIACAO IS NULL) OR ');
         Add('         (M.DATACONCILIACAO > TO_DATE('''+
             FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataFinal) + ''',''DD/MM/YYYY''))) AND ');

         if bConsMovRealFP then
            Add('        (M.DATALANCFINAN <= TO_DATE('''+
                FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataFinal) + ''',''DD/MM/YYYY'')) AND ');

         Add('        (M.CODPORTADOR = C.CODPORTADOR) AND ');
         Add('        (M.IDPESSOA = C.IDPESSOA) AND ');
         Add('        (M.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
         Add('        ((C.FLGSTATUS = ''A'') OR (C.FLGSTATUS IS NULL)) )) SAL ');

         Add(' WHERE ');
         Add('    (U.TIPO = SAL.TIPO(+)) AND ');
         Add('    (U.CODPORTADOR = SAL.CODPORTADOR(+)) ');
      end;

      Add(' ORDER BY U.ORDEM,U.DESCRICAO ');

      sSql.ControlObject:=Self;
      cdsAux.Data:=sSql.Data;

      rTotalAux:=0;
      if (bGeraValores) then
      begin
          cdsAux.First;
          while not(cdsAux.Eof) do
          begin
             if (cdsAux.FieldByName('TIPO').AsString='LD')  then
                 rTotalAux:=rTotalAux+cdsAux.FieldByName('VALOR').AsFloat;

             if (cdsAux.FieldByName('TIPO').AsString='LR') then
                 rTotalAux:=rTotalAux+cdsAux.FieldByName('VALOR').AsFloat;

             if (cdsAux.FieldByName('TIPO').AsString='LC') then
                 rTotalAux:=rTotalAux-cdsAux.FieldByName('VALOR').AsFloat;

             if (cdsAux.FieldByName('TIPO').AsString='LB') or
                (cdsAux.FieldByName('TIPO').AsString='LP') then
             begin
                cdsAux.Edit;
                cdsAux.FieldByName('VALOR').AsFloat:=rTotalAux;
                cdsAux.Post;
             end;

             if (cdsAux.FieldByName('TIPO').AsString='LF') then
             begin
                cdsAux.Edit;
                cdsAux.FieldByName('VALOR').AsFloat:=rSaldoFluxo-rTotalAux;
                cdsAux.Post;
             end;

             cdsAux.Next;
          end;
      end;

      Result:=cdsAux.Data;
      //cdsAux.SaveToFile('C:\ProjetosCM7\Testes-XML\T1.XML',dfXML);
   finally
       sSql.Free;
       cdsAux.Free;
   end;
end;

function TCtrlFluxoCaixa.GeraLinhasSaldoAplic(ParamFluxo: TParamFluxo; bGeraValores: Boolean;
                                              rSaldoFluxo: Double): OleVariant;
var
   rTotalAux : Double;
   sSql      : TCMSqlParams;
   cdsAux    : TCMClientDataSet;
   cDecSep   : Char;
begin
   sSql:=TCMSqlParams.Create(nil);
   cdsAux:=TCMClientDataSet.Create(nil);
   with sSql.SQL do
   try
      Add(' SELECT ');
      Add('    U.ORDEM, ');

      if (bGeraValores) then
          Add('    U.TIPO, ')
      else
          Add('    ''  '' AS TIPO, ');

      Add('    U.IDCONTAAPLIC, ');
      Add('    U.DESCRICAO, ');

      if (bGeraValores) then
          Add('    SAL.VALOR AS VALOR ')
      else
          Add('    0.00 AS VALOR ');

      Add(' FROM ');
      Add('    (SELECT ');
      Add('        0.00 AS ORDEM, ');
      Add('       -9.99 AS IDCONTAAPLIC,');
      Add('        ''LT'' AS TIPO,');  //Linha de Titulo
      Add('        ''--> '+CMTranslate('Saldo das Aplicações')+''' AS  DESCRICAO ');
      Add('     FROM ');
      Add('        PARAMFINANC ');
      Add('     WHERE ');
      Add('       (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ');
      Add('    UNION ALL ');
      Add('    (SELECT ');
      Add('        1.00 AS ORDEM, ');
      Add('        CA.IDCONTAAPLIC, ');
      Add('        ''LD'' AS TIPO,');  //Linha de Detalhe
      Add('        ''    ''||CONTAAPLIC AS DESCRICAO ');
      Add('     FROM ');
      Add('        CONTAAPLICACAO CA ');
      Add('     WHERE ');
      Add('       (CA.IDPESSOA '+ParamFluxo.sFiltroPessoa+')) ');
      Add('    UNION ALL ');
      Add('    (SELECT ');
      Add('        2.00 AS ORDEM, ');
      Add('       -9.99 AS IDCONTAAPLIC, ');
      Add('        ''LA'' AS TIPO,');  //Linha Total de Saldo das aplicações
      Add('        ''    - '+CMTranslate('Total das Aplicações')+''' AS  DESCRICAO ');
      Add('     FROM ');
      Add('        PARAMFINANC ');
      Add('     WHERE ');
      Add('       (IDPESSOA = '+FloatToStr(F_rIDPessoa)+')) ');
      Add('    UNION ALL ');
      Add('    (SELECT ');
      Add('        3.00 AS ORDEM, ');
      Add('       -9.99 AS IDCONTAAPLIC, ');
      Add('        ''LS'' AS TIPO,');  //Linha Total de Saldo mais aplicações
      Add('        ''--> '+CMTranslate('Saldo com Aplicações')+''' AS DESCRICAO ');
      Add('     FROM ');
      Add('        PARAMFINANC ');
      Add('     WHERE ');
      Add('       (IDPESSOA = '+FloatToStr(F_rIDPessoa)+')) ');
      Add('    ) U ');

      if (bGeraValores) then
      begin
         Add('   ,(SELECT ');  //Linhas Detalhe
         Add('        M.IDCONTAAPLIC, ');
         Add('        ''LD'' AS TIPO, ');
         Add('        SUM(DECODE(M.TIPOMOVIM,''R'',-M.VALOR,M.VALOR)) AS VALOR ');
         Add('     FROM ');
         Add('        MOVIMAPLIC M ');
         Add('     WHERE ');
         Add('        (M.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');

         //Add('        (M.DATAAPLICRESG >= TO_DATE('''+
         //    FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataInicial) + ''',''DD/MM/YYYY'')) AND ');

         Add('        (M.DATAAPLICRESG <= TO_DATE('''+
             FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataFinal) + ''',''DD/MM/YYYY'')) ');
         Add('     GROUP BY M.IDCONTAAPLIC ');
         Add('    UNION ALL ');
         Add('    (SELECT ');  //Linha Total de Saldo das Aplicações
         Add('        -9.99 AS IDCONTAAPLIC, ');
         Add('        ''LA'' AS TIPO, ');
         Add('        SUM(DECODE(M.TIPOMOVIM,''R'',-M.VALOR,M.VALOR)) AS VALOR ');
         Add('     FROM ');
         Add('        MOVIMAPLIC M ');
         Add('     WHERE ');
         Add('        (M.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');

         //Add('        (M.DATAAPLICRESG >= TO_DATE('''+
         //    FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataInicial) + ''',''DD/MM/YYYY'')) AND ');

         Add('        (M.DATAAPLICRESG <= TO_DATE('''+
             FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataFinal) + ''',''DD/MM/YYYY'')))  ');
         Add('    UNION ALL ');
         Add('    (SELECT ');  //Saldo do Fluxo + Saldo das Aplicações
         Add('        -9.99 AS IDCONTAAPLIC, ');
         Add('        ''LS'' AS TIPO, ');

         cDecSep:=DecimalSeparator;
         try
            DecimalSeparator:='.';
            Add('        ('+FloatToStr(rSaldoFluxo)+
                ' + NVL(SUM(DECODE(M.TIPOMOVIM,''R'',-M.VALOR,M.VALOR)),0)) AS VALOR ');
         finally
            DecimalSeparator:=cDecSep;
         end;

         Add('     FROM ');
         Add('        MOVIMAPLIC M ');
         Add('     WHERE ');
         Add('        (M.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');

         //Add('        (M.DATAAPLICRESG >= TO_DATE('''+
         //    FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataInicial) + ''',''DD/MM/YYYY'')) AND ');

         Add('        (M.DATAAPLICRESG <= TO_DATE('''+
             FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataFinal) + ''',''DD/MM/YYYY''))) ) SAL ');
         Add(' WHERE ');
         Add('    (U.TIPO = SAL.TIPO(+)) AND ');
         Add('    (U.IDCONTAAPLIC = SAL.IDCONTAAPLIC(+)) ');
      end;
      Add(' ORDER BY U.ORDEM,U.DESCRICAO ');

      sSql.ControlObject:=Self;
      cdsAux.Data:=sSql.Data;

      Result:=cdsAux.Data;
      //cdsAux.SaveToFile('C:\ProjetosCM7\Testes-XML\T1.XML',dfXML);
   finally
       sSql.Free;
       cdsAux.Free;
   end;
end;

function TCtrlFluxoCaixa.BuscaNomeFluxo(sTipoFluxo: String): String;
begin
   Result:='';
   if (sTipoFluxo='P') then Result:='FluxoPrevisto';
   if (sTipoFluxo='R') then Result:='FluxoReal';
   if (sTipoFluxo='O') then Result:='FluxoOrcado';
   if (sTipoFluxo='OXR') then Result:='FluxoOrcado';
end;

procedure TCtrlFluxoCaixa.MontaFiltro(sSql: TCMSqlParams; ParamFluxo: TParamFluxo;
          bTodoPeriodo: Boolean);
var
   dDataIAux : TDateTime;
   dDataFAux : TDateTime;
begin
   with sSql.SQL do
   begin
      //Estrutura para filtragem por Unid.Negóc. , C. Respon. , Centro de Custo, Plano e Patrocinador
      if  (Trim(ParamFluxo.sUneCodigo)<>'') then
         Add('       AND (SubStr(RTrim(Flx.UneCodigo),1,Length('''+Trim(ParamFluxo.sUneCodigo)+
             ''')) = '''+Trim(ParamFluxo.sUneCodigo)+''') ');

      if Trim(ParamFluxo.sCentroResp)<>'' then
         Add('       AND (SubStr(RTrim(Flx.CodCentroRespon),1,Length('''+Trim(ParamFluxo.sCentroResp)+
             ''')) = '''+Trim(ParamFluxo.sCentroResp)+''') ');

      if Trim(ParamFluxo.sCentroCusto)<>'' then
         Add('       AND (SubStr(RTrim(Flx.CodCentroCusto),1,Length('''+Trim(ParamFluxo.sCentroCusto)+
             ''')) = '''+Trim(ParamFluxo.sCentroCusto)+''') ');

      if (ParamFluxo.rMoeCodigo<>0) and (ParamFluxo.sTipoFluxo='R') then
         Add('       AND (Flx.MOECODIGO = '+FloatToStr(ParamFluxo.rMoeCodigo)+') ');

      if (ParamFluxo.rCodPortador<>0) and (ParamFluxo.sTipoFluxo='R') then
         Add('       AND (Flx.CODPORTADOR = '+FloatToStr(ParamFluxo.rCodPortador)+') ');

      //Estrutura para filtragem por Prazo
      if (ParamFluxo.sTipoFluxo='O') then
       begin
          Add('       AND (Flx.Prazo = '''+ParamFluxo.sPrazo+''') ');

          {if (ParamFluxo.sPrazo='C') then Add('       AND (Flx.Prazo = ''C'') ');
          if (ParamFluxo.sPrazo='M') then Add('       AND (Flx.Prazo = ''M'') ');
          if (ParamFluxo.sPrazo='L') then Add('       AND (Flx.Prazo = ''L'') ');}
       end;

      dDataIAux:=ParamFluxo.dDataInicial;
      dDataFAux:=ParamFluxo.dDataFinal;

      if bTodoPeriodo then
      begin
         ParamFluxo.dDataInicial:=ParamFluxo.dDataInicFluxo;
         ParamFluxo.dDataFinal:=ParamFluxo.dDataFinalFluxo;
      end;

      //Estrutura de Filtragem por data
      if (ParamFluxo.sTipoFluxo='P') or (ParamFluxo.sTipoFluxo='O') then
      begin
         Add('       AND (Flx.DATAPROGRAMADA >= To_Date('''+
             FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataInicial)+''',''DD/MM/YYYY'')) ');
         Add('       AND (Flx.DATAPROGRAMADA <= To_Date('''+
              FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataFinal)+''',''DD/MM/YYYY'')) ');
      end
      else
      begin
         Add('       AND (Flx.DATACFLOAT >= To_Date('''+
             FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataInicial)+''',''DD/MM/YYYY'')) ');
         Add('       AND (Flx.DATACFLOAT <= To_Date('''+
             FormatDateTime('dd/mm/yyyy',ParamFluxo.dDataFinal)+''',''DD/MM/YYYY'')) ');
      end;

      ParamFluxo.dDataInicial:=dDataIAux;
      ParamFluxo.dDataFinal:=dDataFAux;
   end;
end;

function TCtrlFluxoCaixa.GeraSomatorios(LinhasFluxo: OleVariant; ParamFluxo: TParamFluxo;
                                        rSaldoInicial: Double): OleVariant;
var
   bContinua         : Boolean;
   aSomatorio        : TStringList;
   cdsAux            : TCMClientDataSet;
   rSaldoTransportar : Double;

   function AssociaValores: Boolean;
   var
      rValorAux      : Double;
      iPosicao       : LongInt; 
   begin
      //
      //Rotina de associação de Total de uma linha ao total de uma outra linha de
      //mesmo código (CODCOMPLINHA)
      //

      iPosicao:=0;

      Result:=False;
      cdsAux.First;
      aSomatorio.Clear;
      while not(cdsAux.Eof) do
      begin
         if (cdsAux.FieldByName('CODLINHAFLUXO').AsFloat=
             cdsAux.FieldByName('CODCOMPLINHA').AsFloat) and
            (cdsAux.FieldByName('TIPOCALCULO').AsString<>'T') and
            (cdsAux.FieldByName('LINHATOTAL').AsString='#') and
            (cdsAux.FieldByName('TIPOCALCULO').AsString<>'X')then
          begin
             if (ParamFluxo.sQuebra='') then
                 aSomatorio.Add('#'+FloatToStr(cdsAux.FieldByName('CODLINHAFLUXO').AsFloat));
             if (ParamFluxo.sQuebra='UN') then
                 aSomatorio.Add('#'+cdsAux.FieldByName('UneCodigo').AsString+'-'+
                                    FloatToStr(cdsAux.FieldByName('CODLINHAFLUXO').AsFloat));
             if (ParamFluxo.sQuebra='CR') then
                 aSomatorio.Add('#'+Trim(cdsAux.FieldByName('CodCentroRespon').AsString)+'-'+
                                    FloatToStr(cdsAux.FieldByName('CODLINHAFLUXO').AsFloat));
             if (ParamFluxo.sQuebra='CC') then
                 aSomatorio.Add('#'+Trim(cdsAux.FieldByName('CodCentroCusto').AsString)+'-'+
                                    FloatToStr(cdsAux.FieldByName('CODLINHAFLUXO').AsFloat));

             aSomatorio.Add(FloatToStr(cdsAux.FieldByName('TOTAL').AsFloat));
          end;
         cdsAux.Next;
      end;

      cdsAux.First;
      while not(cdsAux.Eof) do
      begin
         if (cdsAux.FieldByName('CODLINHAFLUXO').AsFloat<>
             cdsAux.FieldByName('CODCOMPLINHA').AsFloat) and
            (cdsAux.FieldByName('TIPOCALCULO').AsString<>'T') and
            (cdsAux.FieldByName('TIPOCALCULO').AsString<>'X') then
         begin
            if (ParamFluxo.sQuebra='') then
                iPosicao:=aSomatorio.IndexOf('#'+
                          FloatToStr(cdsAux.FieldByName('CODCOMPLINHA').AsFloat));

            if (ParamFluxo.sQuebra='UN') then
                iPosicao:=aSomatorio.IndexOf('#'+
                          cdsAux.FieldByName('UneCodigo').AsString+'-'+
                          FloatToStr(cdsAux.FieldByName('CODCOMPLINHA').AsFloat));

            if (ParamFluxo.sQuebra='CR') then
                iPosicao:=aSomatorio.IndexOf('#'+
                          Trim(cdsAux.FieldByName('CodCentroRespon').AsString)+'-'+
                          FloatToStr(cdsAux.FieldByName('CODCOMPLINHA').AsFloat));

            if (ParamFluxo.sQuebra='CC') then
                iPosicao:=aSomatorio.IndexOf('#'+
                            Trim(cdsAux.FieldByName('CodCentroCusto').AsString)+'-'+
                            FloatToStr(cdsAux.FieldByName('CODCOMPLINHA').AsFloat));

            if (iPosicao<>-1) then
             begin
                rValorAux:=StrToFloat(aSomatorio.Strings[iPosicao+1]);
                if not(ComparaFloat(cdsAux.FieldByName('TOTAL').AsFloat,rValorAux)) then
                 begin
                    cdsAux.Edit;
                    cdsAux.FieldByName('TOTAL').AsFloat:=rValorAux;

                    if (rValorAux<0) then
                        cdsAux.FieldByName('CORCAMPO').AsString:='clRed'
                    else
                        cdsAux.FieldByName('CORCAMPO').AsString:='clBlack';

                    cdsAux.Post;
                    Result:=True;
                 end;
             end;
         end;
         cdsAux.Next;
      end;
   end;

   function Totaliza: Boolean;
   var
      rUltimaLinha   : Double;
      iPosicao       : Longint;
      rTotal         : Double;
      PosicaoAtual   : TbookMark;
      PosicaoAux     : TbookMark;
      bComPrevisao   : Boolean;

      procedure GeraCorLinhaSoma;
      begin
         //Gera Cor das linhas de Somatório de outras linhas
         if (ParamFluxo.sTipoFluxo='P') and (cdsAux.FieldByName('TIPOCALCULO').AsString<>'L') then
         begin
            if (cdsAux.FieldByName('TIPOCALCULO').AsString='R') or
               (cdsAux.FieldByName('TIPOCALCULO').AsString='C') then
            begin
               if bComPrevisao then
                  cdsAux.FieldByName('CORCAMPO').AsString:=
                                     ParamFluxo.Legenda.sCorRecComPrev
               else
                  cdsAux.FieldByName('CORCAMPO').AsString:=
                                     ParamFluxo.Legenda.sCorRecSemPrev;
            end
            else
            begin
               if bComPrevisao then
                  cdsAux.FieldByName('CORCAMPO').AsString:=
                                      ParamFluxo.Legenda.sCorPgtoComPrev
               else
                  cdsAux.FieldByName('CORCAMPO').AsString:=
                                      ParamFluxo.Legenda.sCorPgtoSemPrev;
            end;
         end
         else
         begin
            if (rTotal<0) and bDesVermelho then
                cdsAux.FieldByName('CORCAMPO').AsString:='clRed'
            else
                cdsAux.FieldByName('CORCAMPO').AsString:='clBlack';
         end;
      end;

   begin
      //
      //Totalização de linhas do mesmo conjunto
      //
      rTotal:=0;
      iPosicao:=0;
      rUltimaLinha:=0;
      PosicaoAux:=nil;
      bComPrevisao:=False;

      Result:=False;

      cdsAux.First;
      while not(cdsAux.Eof) do
      begin
         if (cdsAux.FieldByName('TIPOCALCULO').AsString='T') or
            (cdsAux.FieldByName('TIPOCALCULO').AsString='X') or
            (cdsAux.FieldByName('LINHATOTAL').AsString='N') then
         begin
            cdsAux.Next;
            Continue;
         end;

         if (cdsAux.FieldByName('CODLINHAFLUXO').AsFloat<>rUltimaLinha) then
         begin
            if (PosicaoAux<>nil) then //Teste de Linha de total pendente
            begin
               //Guarda posição atual
               PosicaoAtual:=cdsAux.GetBookmark;

               //Resgata posição anterior
               cdsAux.GotoBookmark(PosicaoAux);
               cdsAux.FreeBookmark(PosicaoAux);
               PosicaoAux:=nil;

               if not(Result) then
                  Result:=not(ComparaFloat(cdsAux.FieldByName('TOTAL').AsFloat,rTotal));

               //Atribui valor
               cdsAux.Edit;
               cdsAux.FieldByName('TOTAL').AsFloat:=rTotal;
               GeraCorLinhaSoma;
               cdsAux.Post;

               //Atualiza Saldo a Transportar
               if (cdsAux.FieldByName('LINHATOTAL').AsString='#') and
                  (cdsAux.FieldByName('TIPOCALCULO').AsString<>'L') then
                   rSaldoTransportar:=rSaldoTransportar+rTotal;

               cdsAux.GotoBookmark(PosicaoAtual);
               cdsAux.FreeBookmark(PosicaoAtual);
            end;

            //Teste de Linha de Totalização
            if (cdsAux.FieldByName('LINHATOTAL').AsString='#') then
                PosicaoAux:=cdsAux.GetBookmark;

            //Teste de Linha de Sub-Total
            rTotal:=0;
            if (cdsAux.FieldByName('LINHATOTAL').AsString='S') then
            begin
               rTotal:=cdsAux.FieldByName('TOTAL').AsFloat;
               bComPrevisao:=((cdsAux.FieldByName('CORCAMPO').AsString =
                               ParamFluxo.Legenda.sCorRecComPrev) or
                              (cdsAux.FieldByName('CORCAMPO').AsString =
                               ParamFluxo.Legenda.sCorPgtoComPrev));
            end
            else
               bComPrevisao:=False;
               
            rUltimaLinha:=cdsAux.FieldByName('CODLINHAFLUXO').AsFloat;
         end
         else
         begin
            if (cdsAux.FieldByName('LINHATOTAL').AsString='#') then
            begin

               if not(Result) then
                  Result:=not(ComparaFloat(cdsAux.FieldByName('TOTAL').AsFloat,rTotal));

               //Atribui valor
               cdsAux.Edit;
               cdsAux.FieldByName('TOTAL').AsFloat:=rTotal;
               GeraCorLinhaSoma;
               cdsAux.Post;

               //Atualiza Saldo a Transportar
               if (cdsAux.FieldByName('LinhaTotal').AsString='#') and
                  (cdsAux.FieldByName('TipoCalculo').AsString<>'L') then
                   rSaldoTransportar:=rSaldoTransportar+rTotal;

               rTotal:=0;
               bComPrevisao:=False;
            end;

            if (cdsAux.FieldByName('LINHATOTAL').AsString='S') then
            begin
               rTotal:=rTotal+cdsAux.FieldByName('TOTAL').AsFloat;
               bComPrevisao:=((cdsAux.FieldByName('CORCAMPO').AsString =
                               ParamFluxo.Legenda.sCorRecComPrev) or
                              (cdsAux.FieldByName('CORCAMPO').AsString =
                               ParamFluxo.Legenda.sCorPgtoComPrev)) or bComPrevisao;
            end;
         end;

         cdsAux.Next;
      end;

      if (PosicaoAux<>nil) then
      begin
         //Resgata posição anterior
         cdsAux.GotoBookmark(PosicaoAux);
         cdsAux.FreeBookmark(PosicaoAux);
         PosicaoAux:=nil;

         if not(Result) then
            Result:=not(ComparaFloat(cdsAux.FieldByName('TOTAL').AsFloat,rTotal));

         //Atribui valor
         cdsAux.Edit;
         cdsAux.FieldByName('TOTAL').AsFloat:=rTotal;
         GeraCorLinhaSoma;
         cdsAux.Post;

         //Atualiza Saldo a Transportar
         if (cdsAux.FieldByName('LinhaTotal').AsString='#') and
            (cdsAux.FieldByName('TipoCalculo').AsString<>'L') then
             rSaldoTransportar:=rSaldoTransportar+rTotal;
      end;
   end;

begin
   cdsAux:=TCMClientDataSet.Create(nil);
   aSomatorio:=TStringList.Create;
   try
      cdsAux.Data:=LinhasFluxo;

      if (ParamFluxo.sQuebra='UN') then
      begin
         cdsAux.AddIndex('Indice','UneCodigo;Ordem;Posicao;CodTipRecDes',[]);
         cdsAux.IndexName:='Indice';
      end;

      if (ParamFluxo.sQuebra='CR') then
      begin
         cdsAux.AddIndex('Indice','CodCentroRespon;Ordem;Posicao;CodTipRecDes',[]);
         cdsAux.IndexName:='Indice';
      end;

      if (ParamFluxo.sQuebra='CC') then
      begin
         cdsAux.AddIndex('Indice','CodCentroCusto;Ordem;Posicao;CodTipRecDes',[]);
         cdsAux.IndexName:='Indice';
      end;

      cdsAux.First;

      //Grava Saldo Anterior
      cdsAux.Edit;
      cdsAux.FieldByName('TOTAL').AsFloat:=rSaldoInicial;
      cdsAux.Post;

      bContinua:=True;
      rSaldoTransportar:=rSaldoInicial;
      Totaliza;

      while bContinua do
      begin
         bContinua:=AssociaValores;
         rSaldoTransportar:=rSaldoInicial;
         bContinua:=bContinua or Totaliza;
      end;

      //Grava Saldo a Transportar
      cdsAux.Last;
      cdsAux.Edit;
      cdsAux.FieldByName('TOTAL').AsFloat:=rSaldoTransportar;
      cdsAux.Post;

      Result:=cdsAux.Data;

   finally
      cdsAux.Free;
      aSomatorio.Free;
   end;
end;

function TCtrlFluxoCaixa.ListDadosImpressao(sOrientacao: String): OleVariant;
var
   sSql: String;
begin
   sSql:='SELECT '+
         '   ''12345678901234567890123456789012345'' AS LinhaFluxo, '+
         '   ''123456789012345678901234567890''      AS Data1, '+
         '   ''123456789012345678901234567890''      AS Valor1, '+
         '   0.00 AS Cor1, '+
         '   ''123456789012345678901234567890''      AS Data2, '+
         '   ''123456789012345678901234567890''      AS Valor2, '+
         '   0.00 AS Cor2, '+
         '   ''123456789012345678901234567890''      AS Data3, '+
         '   ''123456789012345678901234567890''      AS Valor3, '+
         '   0.00 AS Cor3, '+
         '   ''123456789012345678901234567890''      AS Data4, '+
         '   ''123456789012345678901234567890''      AS Valor4, '+
         '   0.00 AS Cor4, '+
         '   ''123456789012345678901234567890''      AS Data5, '+
         '   ''123456789012345678901234567890''      AS Valor5, '+
         '   0.00 AS Cor5 ';

   if (sOrientacao<>'RETRATO') then
   begin
      sSql:=sSql+'   ,''123456789012345678901234567890''     AS Data6, '+
                 '   ''123456789012345678901234567890''      AS Valor6, '+
                 '   0.00 AS Cor6, '+
                 '   ''123456789012345678901234567890''      AS Data7, '+
                 '   ''123456789012345678901234567890''      AS Valor7, '+
                 '   0.00 AS Cor7, '+
                 '   ''123456789012345678901234567890''      AS Data8, '+
                 '   ''123456789012345678901234567890''      AS Valor8, '+
                 '   0.00 AS Cor8 ';
   end;

    sSql:=sSql+'FROM '+
               '   Dual '+
               'WHERE '+
               '   (1=2) /*+OPTIMIZER_MODE RULE*/';
    Result:=GetDataPacket(sSql);
end;

function TCtrlFluxoCaixa.ComparaFloat(rValor1, rValor2: Double): Boolean;
begin
   Result:=((Trunc(rValor1*100)-Trunc(rValor2*100)) = 0);
end;

function TCtrlFluxoCaixa.GeraFiltroPessoa(rIDFluxoConsol, rIDPessoa: Double): String;
begin
   Result:='';
   with TCMClientDataSet.Create(nil) do
   try
      Data:=GetDataPacket('SELECT IDPESSOA '+
                          'FROM COMPCONSOLEMP '+
                          'WHERE (IDCONSOL = '+ FloatToStr(rIDFluxoConsol)+') ');

      if not(IsEmpty) then
       begin
          if (RecordCount=1) then
              Result:=' = '+FloatToStr(FieldByName('IDPESSOA').AsFloat)
          else
           begin
              First;
              while not(Eof) do
              begin
                 if (Trim(Result)='') then
                    Result:=Result+' IN ('+FloatToStr(FieldByName('IDPESSOA').AsFloat)
                 else
                    Result:=Result+','+FloatToStr(FieldByName('IDPESSOA').AsFloat);
                 Next;
              end;
              Result:=Result+') ';
           end;
       end;

   finally
      Free;
   end;
   if (Trim(Result)='') then Result:=' = '+FloatTosTr(rIDPessoa);
end;

function TCtrlFluxoCaixa.ValidaFluxoConsol(rIDFluxoConsol: Double): Boolean;
var
   sSql : String;
begin
   Result:=True;
   sSql:='SELECT '+
         '   COUNT(*) AS NUMLINHAS '+
         'FROM '+
         '   (SELECT '+
         '       P.DATAINICFLXPREV, '+
         '       P.DATAFINALFLXPREV '+
         '    FROM '+
         '       PARAMFINANC P, '+
         '       COMPCONSOLEMP C '+
         '    WHERE '+
         '       (C.IDCONSOL = '+FloatToStr(rIDFluxoConsol)+') AND '+
         '       (C.IDPESSOA = P.IDPESSOA) '+
         '    GROUP BY '+
         '       P.DATAINICFLXPREV, '+
         '       P.DATAFINALFLXPREV) DT';

   with TCMClientDataSet.Create(nil) do
   try
      Data:=GetDataPacket(sSql);
      Result:=(FieldByName('NUMLINHAS').AsFloat=1);
   finally
      Free;
   end;
end;

//==============================================================================
// List Diversos
//==============================================================================

function TCtrlFluxoCaixa.ListUnidNegxFluxo(rIDPessoa,
  rIDConsolidado: Double; sFluxo: String): OleVariant;
var
   sSql : String;
begin
    sSql:='SELECT DISTINCT '+
          '   U.UNIDNEGOC, '+
          '   U.NOME, '+
          '   U.UNECODIGO, '+
         '    U.UNETIPO '+          
          'FROM '+sFluxo+' F,'+
          '   UNIDNEGOCIO U '+
          'WHERE (F.UNIDNEGOC = U.UNIDNEGOC) AND ';

    if (rIDConsolidado<>0) then
        sSql:=sSql+'      (U.IDPESSOA IN (SELECT CE.IDPESSOA '+
                   '                      FROM '+
                   '                         COMPCONSOLEMP CE '+
                   '                      WHERE '+
                   '                         (CE.IDCONSOL = '+FloatToStr(rIDConsolidado)+'))) '
    else
        sSql:=sSql+'      (U.IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   sSql:=sSql+'ORDER BY U.UNECODIGO';

   Result:=GetDataPacket(sSql);
end;

function TCtrlFluxoCaixa.ListUnidNegxFluxoComp(rIDPessoa,
  rIDConsolidado: Double; sFluxo1, sFluxo2: String): OleVariant;
var
   sSql : String;
begin
   sSql:=' SELECT DISTINCT '+
         '    U.UNIDNEGOC, '+
         '    U.NOME, '+
         '    U.UNECODIGO, '+
         '    U.UNETIPO '+
         ' FROM '+sFluxo1+' F,'+
         '    UNIDNEGOCIO U '+
         ' WHERE (F.UNIDNEGOC = U.UNIDNEGOC) AND ';

   if (rIDConsolidado<>0) then
       sSql:=sSql+'       (U.IDPESSOA IN (SELECT CE.IDPESSOA '+
                  '                       FROM '+
                  '                          COMPCONSOLEMP CE '+
                  '                       WHERE '+
                  '                          (CE.IDCONSOL = '+
                  FloatToStr(rIDConsolidado)+'))) '
   else
       sSql:=sSql+'       (U.IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   sSql:=sSql+'UNION '+
         ' (SELECT DISTINCT '+
         '     U.UNIDNEGOC, '+
         '     U.NOME, '+
         '     U.UNECODIGO, '+
         '     U.UNETIPO '+
         '  FROM '+sFluxo2+' F,'+
         '     UNIDNEGOCIO U '+
         '  WHERE (F.UNIDNEGOC = U.UNIDNEGOC) AND ';

   if (rIDConsolidado<>0) then
       sSql:=sSql+'        (U.IDPESSOA IN (SELECT CE.IDPESSOA '+
                  '                        FROM '+
                  '                           COMPCONSOLEMP CE '+
                  '                        WHERE '+
                  '                           (CE.IDCONSOL = '+
                  FloatToStr(rIDConsolidado)+')))) '
   else
       sSql:=sSql+'        (U.IDPESSOA = '+FloatToStr(rIDPessoa)+')) ';

   sSql:=sSql+'ORDER BY UNECODIGO';

   Result:=GetDataPacket(sSql);
end;

function TCtrlFluxoCaixa.ListCentroResponxFluxo(rIDPessoa, rIDConsolidado: Double;
  sFluxo: String): OleVariant;
var
   sSql    : String;
begin
   sSql:='SELECT DISTINCT '+
         '   RTRIM(C.CODCENTRORESPON) AS CODCENTRORESPON, '+
         '   C.NOME, '+
         '   C.ANALITICOSINTET '+
         'FROM '+sFluxo+' F, '+
         '   CENTRESPON C '+
         'WHERE (F.CODCENTRORESPON = C.CODCENTRORESPON) AND '+
         '      (F.IDPESSOA = C.IDPESSOA) AND ';

   if (rIDConsolidado<>0) then
       sSql:=sSql+'        (F.IDPESSOA IN (SELECT CE.IDPESSOA '+
                  '                        FROM '+
                  '                           COMPCONSOLEMP CE '+
                  '                        WHERE '+
                  '                           (CE.IDCONSOL = '+
                  FloatToStr(rIDConsolidado)+'))) '
   else
       sSql:=sSql+'        (F.IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   sSql:=sSql+'ORDER BY CODCENTRORESPON';
   Result:=GetDataPacket(sSql);
end;

function TCtrlFluxoCaixa.ListCentroResponxFluxoComp(rIDPessoa, rIDConsolidado: Double;
  sFluxo1, sFluxo2: String): OleVariant;
var
   sSql    : String;
begin
   sSql:=' SELECT DISTINCT '+
         '    RTRIM(C.CODCENTRORESPON) AS CODCENTRORESPON, '+
         '    C.NOME, '+
         '    C.ANALITICOSINTET '+
         ' FROM '+sFluxo1+' F, '+
         '    CENTRESPON C '+
         ' WHERE (F.CODCENTRORESPON = C.CODCENTRORESPON) AND '+
         '       (F.IDPESSOA = C.IDPESSOA) AND ';

   if (rIDConsolidado<>0) then
       sSql:=sSql+'        (F.IDPESSOA IN (SELECT CE.IDPESSOA '+
                  '                        FROM '+
                  '                           COMPCONSOLEMP CE '+
                  '                        WHERE '+
                  '                           (CE.IDCONSOL = '+
                  FloatToStr(rIDConsolidado)+'))) '
   else
       sSql:=sSql+'        (F.IDPESSOA = '+FloatToStr(rIDPessoa)+') ';


   sSql:=sSql+'UNION '+
         ' (SELECT DISTINCT '+
         '     RTRIM(C.CODCENTRORESPON) AS CODCENTRORESPON, '+
         '     C.NOME, '+
         '     C.ANALITICOSINTET '+
         '  FROM '+sFluxo2+' F, '+
         '     CENTRESPON C '+
         '  WHERE (F.CODCENTRORESPON = C.CODCENTRORESPON) AND '+
         '        (F.IDPESSOA = C.IDPESSOA) AND ';

   if (rIDConsolidado<>0) then
       sSql:=sSql+'         (F.IDPESSOA IN (SELECT CE.IDPESSOA '+
                  '                         FROM '+
                  '                            COMPCONSOLEMP CE '+
                  '                         WHERE '+
                  '                            (CE.IDCONSOL = '+
                  FloatToStr(rIDConsolidado)+')))) '
   else
       sSql:=sSql+'         (F.IDPESSOA = '+FloatToStr(rIDPessoa)+')) ';


   sSql:=sSql+'ORDER BY CODCENTRORESPON';
   Result:=GetDataPacket(sSql);
end;

function TCtrlFluxoCaixa.ListCentroCustoxFluxo(rIDPessoa, rIDConsolidado: Double;
  sFluxo: String): OleVariant;
var
   sSql    : String;
begin
   sSql:='SELECT DISTINCT '+
         '   RTRIM(C.CODCENTROCUSTO) AS CODCENTROCUSTO, '+
         '   C.NOME, '+
         '   C.STATUSGRUPOCDC '+
         'FROM '+sFluxo+' F, '+
         '   CENTCUST C '+
         'WHERE (C.IDEMPRESA = F.IDPESSOA) AND '+
         '      (F.CODCENTROCUSTO = C.CODCENTROCUSTO) AND ';

   if (rIDConsolidado<>0) then
       sSql:=sSql+'        (F.IDPESSOA IN (SELECT CE.IDPESSOA '+
                  '                        FROM '+
                  '                           COMPCONSOLEMP CE '+
                  '                        WHERE '+
                  '                           (CE.IDCONSOL = '+
                  FloatToStr(rIDConsolidado)+'))) '
   else
       sSql:=sSql+'        (F.IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   sSql:=sSql+'ORDER BY CODCENTROCUSTO';

   Result:=GetDataPacket(sSql);
end;

function TCtrlFluxoCaixa.ListCentroCustoxFluxoComp(rIDPessoa, rIDConsolidado: Double;
  sFluxo1, sFluxo2: String): OleVariant;
var
   sSql    : String;
begin
   sSql:=' SELECT DISTINCT '+
         '    RTRIM(C.CODCENTROCUSTO) AS CODCENTROCUSTO, '+
         '    C.NOME, '+
         '    C.STATUSGRUPOCDC '+         
         ' FROM '+sFluxo1+' F, '+
         '    CENTCUST C '+
         ' WHERE (C.IDEMPRESA = F.IDPESSOA) AND '+
         '       (F.CODCENTROCUSTO = C.CODCENTROCUSTO) AND ';

   if (rIDConsolidado<>0) then
       sSql:=sSql+'        (F.IDPESSOA IN (SELECT CE.IDPESSOA '+
                  '                        FROM '+
                  '                           COMPCONSOLEMP CE '+
                  '                        WHERE '+
                  '                           (CE.IDCONSOL = '+
                  FloatToStr(rIDConsolidado)+'))) '
   else
       sSql:=sSql+'        (F.IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   sSql:=sSql+'UNION '+
         ' (SELECT DISTINCT '+
         '     RTRIM(C.CODCENTROCUSTO) AS CODCENTROCUSTO, '+
         '     C.NOME, '+
         '     C.STATUSGRUPOCDC '+         
         '  FROM '+sFluxo2+' F, '+
         '     CENTCUST C '+
         '  WHERE (C.IDEMPRESA = F.IDPESSOA) AND '+
         '        (F.CODCENTROCUSTO = C.CODCENTROCUSTO) AND ';

   if (rIDConsolidado<>0) then
       sSql:=sSql+'        (F.IDPESSOA IN (SELECT CE.IDPESSOA '+
                  '                        FROM '+
                  '                           COMPCONSOLEMP CE '+
                  '                        WHERE '+
                  '                           (CE.IDCONSOL = '+
                  FloatToStr(rIDConsolidado)+')))) '
   else
       sSql:=sSql+'        (F.IDPESSOA = '+FloatToStr(rIDPessoa)+')) ';

   sSql:=sSql+'ORDER BY CODCENTROCUSTO';  

   Result:=GetDataPacket(sSql);
end;

function TCtrlFluxoCaixa.ListPortadorContaxFluxo(rIDPessoa, rIDConsolidado: Double; sFluxo: String): OleVariant;
var
   sSql : String;
begin
   sSql:=' SELECT DISTINCT '+
         '    Flx.CODPORTADOR, '+
         '    PC.DESCRICAO '+
         ' FROM '+
         '    PORTADORCONTA PC, '+
         '    '+sFluxo+' Flx '+
         ' WHERE '+
         '    (Flx.IDPESSOA = PC.IDPESSOA) AND '+
         '    (Flx.CODPORTADOR = PC.CODPORTADOR) AND ';

   if (rIDConsolidado<>0) then
       sSql:=sSql+'        (Flx.IDPESSOA IN (SELECT CE.IDPESSOA '+
                  '                        FROM '+
                  '                           COMPCONSOLEMP CE '+
                  '                        WHERE '+
                  '                           (CE.IDCONSOL = '+
                  FloatToStr(rIDConsolidado)+'))) '
   else
       sSql:=sSql+'        (Flx.IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

    sSql:= sSql+' ORDER BY PC.DESCRICAO';
   Result:=GetDataPacket(sSql);
end;

function TCtrlFluxoCaixa.GeraDadosGrafico(ParamFluxo: TParamFluxo;
                                          sAgrupamento: String): OleVariant;
var
   sSql          : TCMSqlParams;
   cdsAux        : TCMClientDataSet;
   cdsEntSaiAux  : TCMClientDataSet;
   cdsSaldoAux   : TCMClientDataSet;
   rSaldo        : Double;
   rEntrada      : Double;
   rSaida        : Double;
   sDescEixoX    : String;
   dDataAux      : TDateTime;
   iDia          : Integer;
   iNumDias      : Integer;
   iContadorAux  : Integer;
   sCampoData    : String;
   sFluxoCaixa   : String;
   TabelaDiasMes : PDayTable;
begin
   sSql:=TCMSqlParams.Create(nil);
   cdsAux:=TCMClientDataSet.Create(nil);
   cdsSaldoAux:=TCMClientDataSet.Create(nil);
   cdsEntSaiAux:=TCMClientDataSet.Create(nil);
   try
      with sSql.SQL do
      begin
         //Abre Cds com a estrutura
         sSql.SQL.Clear;
         Add('SELECT ');
         Add('   0.00 AS ENTRADA, ');
         Add('   0.00 AS SAIDA, ');
         Add('   0.00 AS SALDO, ');
         Add('   RPAD('' '',20,'' '') AS DESCEIXOX, ');
         Add('   0.00 AS DATAPERIODO ');
         Add('FROM ');
         Add('   PARAMFINANC ');
         Add('WHERE ');
         Add('  (IDPESSOA = -9999) ');
         Add('ORDER BY DATAPERIODO ');

         sSql.ControlObject:=Self;
         cdsAux.Data:=sSql.Data;

         //Prepara parâmetros para cada tipo de Fluxo
         if (ParamFluxo.sTipoFluxo='P') then
          begin
             sFluxoCaixa:='FLUXOPREVISTO';
             sCampoData:='DATAPROGRAMADA';
          end;

         if (ParamFluxo.sTipoFluxo='O') then
          begin
             sFluxoCaixa:='FLUXOORCADO';
             sCampoData:='DATAPROGRAMADA';
          end;

         if (ParamFluxo.sTipoFluxo='R') then
          begin
             sFluxoCaixa:='FLUXOREAL';
             sCampoData:='DATACFLOAT';
          end;

         //=================================================================
         //Gera Entradas e Saídas por dia para todo o período
         //=================================================================
         sSql.SQL.Clear;
         Add('SELECT ');
         Add('   F.'+sCampoData+' AS DATADIA, ');
         Add('   SUM(DECODE(F.RECPAG,''R'',F.VALOR,0)) AS ENTRADA, ');
         Add('   SUM(DECODE(F.RECPAG,''P'',F.VALOR,0)) AS SAIDA ');
         Add('FROM ');
         Add('   '+sFluxoCaixa+' F ');

         if  (Trim(ParamFluxo.sUneCodigo)<>'') then
          begin
             Add('  ,(SELECT ');
             Add('       IDPESSOA, ');
             Add('       UNIDNEGOC');
             Add('    FROM ');
             Add('       UNIDNEGOCIO ');
             Add('    WHERE ');
             Add('      (IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
             Add('      (SUBSTR(RTRIM(UNECODIGO),1,LENGTH('''+Trim(ParamFluxo.sUneCodigo)+
                         ''')) = '''+Trim(ParamFluxo.sUneCodigo)+''')) UN ');
          end;

         Add('WHERE ');
         Add('  (F.IDPESSOA '+ParamFluxo.sFiltroPessoa+') AND ');
         Add('  (F.'+sCampoData+' >= TO_DATE('''+FormatDateTime('dd/mm/yyyy',
                     ParamFluxo.dDataInicFluxo)+''',''DD/MM/YYYY'')) AND ');
         Add('  (F.'+sCampoData+' <= TO_DATE('''+FormatDateTime('dd/mm/yyyy',
                     ParamFluxo.dDataFinalFluxo)+''',''DD/MM/YYYY'')) ');

         if (ParamFluxo.sTipoFluxo='O') and (ParamFluxo.sPrazo<>'') then
            Add('  AND (F.Prazo = '''+ParamFluxo.sPrazo+''') ');

         if (Trim(ParamFluxo.sCentroResp)<>'') then
            Add('  AND (SUBSTR(RTRIM(F.CODCENTRORESPON),1,LENGTH('''+Trim(ParamFluxo.sCentroResp)+
                ''')) = '''+Trim(ParamFluxo.sCentroResp)+''') ');

         if (Trim(ParamFluxo.sCentroCusto)<>'') then
            Add('  AND (SUBSTR(RTRIM(F.CODCENTROCUSTO),1,LENGTH('''+Trim(ParamFluxo.sCentroCusto)+
                ''')) = '''+Trim(ParamFluxo.sCentroCusto)+''') ');

         if (ParamFluxo.rMoeCodigo<>0) and (ParamFluxo.sTipoFluxo='R') then
            Add('  AND (F.MOECODIGO = '+FloatToStr(ParamFluxo.rMoeCodigo)+') ');

         if (ParamFluxo.rCodPortador<>0) and (ParamFluxo.sTipoFluxo='R') then
            Add('  AND (F.CODPORTADOR = '+FloatToStr(ParamFluxo.rCodPortador)+') ');

         if  (Trim(ParamFluxo.sUneCodigo)<>'') then
          begin
             Add('  AND (F.IDPESSOA = UN.IDPESSOA) AND ');
             Add('      (F.UNIDNEGOC = UN.UNIDNEGOC) ');
          end;

         Add('GROUP BY F.'+sCampoData+' ');

         sSql.ControlObject:=Self;
         cdsEntSaiAux.Data:=sSql.Data;

         //Calcula Saldo Inicial
         rSaldo:=GeraSaldoInicialFluxo(ParamFluxo);
         iNumDias:=Trunc(ParamFluxo.dDataFinalFluxo-ParamFluxo.dDataInicFluxo)+1;

         if (sAgrupamento='D') then
          begin
             for iDia:=1 to iNumDias do
             begin
                dDataAux:=ParamFluxo.dDataInicFluxo+iDia-1;

                //Inicializa Entrada e Saída
                rEntrada:=0;
                rSaida:=0;

                if (cdsEntSaiAux.Locate('DATADIA',dDataAux,[])) then
                 begin
                    rEntrada:=cdsEntSaiAux.FieldByName('ENTRADA').AsFloat;
                    rSaida:=cdsEntSaiAux.FieldByName('SAIDA').AsFloat;
                 end;

                //Atualiza Saldo e Monta a descrição do eixo X
                rSaldo:=rSaldo+rEntrada-rSaida;
                sDescEixoX:=FormatFloat('00',DayOf(dDataAux));

                //Acrescenta registro do dia corrente
                if (Trim(sDescEixoX)<>'') then
                 begin
                    cdsAux.Append;
                    cdsAux.FieldByName('SALDO').AsFloat:=rSaldo;
                    cdsAux.FieldByName('ENTRADA').AsFloat:=rEntrada;
                    cdsAux.FieldByName('SAIDA').AsFloat:=rSaida;
                    cdsAux.FieldByName('DESCEIXOX').AsString:=sDescEixoX;
                    cdsAux.FieldByName('DATAPERIODO').AsFloat:=dDataAux;
                    cdsAux.Post;
                 end;
             end;
          end;

         if (sAgrupamento='S') then
         begin
            //Inicializa Contador de semanas
            iContadorAux:=0;

            //Inicializa Entrada e Saída
            rEntrada:=0;
            rSaida:=0;
            sDescEixoX:='';

            for iDia:=1 to iNumDias do
            begin
               dDataAux:=ParamFluxo.dDataInicFluxo+iDia-1;
               if (Trim(sDescEixoX)='') then sDescEixoX:=FormatDateTime('DD/MM',dDataAux)+' a ';

               if (cdsEntSaiAux.Locate('DATADIA',dDataAux,[])) then
               begin
                  if (rEntrada=0) and (rSaida=0) then
                  begin
                     rEntrada:=cdsEntSaiAux.FieldByName('ENTRADA').AsFloat;
                     rSaida:=cdsEntSaiAux.FieldByName('SAIDA').AsFloat;
                  end
                  else
                  begin
                     rEntrada:=rEntrada+cdsEntSaiAux.FieldByName('ENTRADA').AsFloat;
                     rSaida:=rSaida+cdsEntSaiAux.FieldByName('SAIDA').AsFloat;
                  end;
               end;

               //Testa se a semana chegou ao fim
               if (DayOfWeek(dDataAux)=7) or (iDia=iNumDias) then
               begin
                  //Complementa descrição do eixo X
                  sDescEixoX:=sDescEixoX+FormatDateTime('DD/MM',dDataAux);

                  //Atualiza Saldo
                  rSaldo:=rSaldo+rEntrada-rSaida;

                  //Acrescenta registro do dia corrente
                  cdsAux.Append;
                  cdsAux.FieldByName('SALDO').AsFloat:=rSaldo;
                  cdsAux.FieldByName('ENTRADA').AsFloat:=rEntrada;
                  cdsAux.FieldByName('SAIDA').AsFloat:=rSaida;
                  cdsAux.FieldByName('DESCEIXOX').AsString:=sDescEixoX;
                  cdsAux.FieldByName('DATAPERIODO').AsFloat:=ParamFluxo.dDataInicFluxo+iContadorAux;
                  cdsAux.Post;

                  sDescEixoX:='';
                  Inc(iContadorAux);
                  rEntrada:=0;
                  rSaida:=0;
               end;
            end;
         end;

         if (sAgrupamento='M') then
         begin
            //Inicializa Contador de semanas
            iContadorAux:=0;

            //Inicializa Entrada e Saída
            rEntrada:=0;
            rSaida:=0;
            sDescEixoX:='';

            for iDia:=1 to iNumDias do
            begin
               dDataAux:=ParamFluxo.dDataInicFluxo+iDia-1;

               //Associa tabela de dias do mês
               TabelaDiasMes:=@MonthDays[IsLeapYear(YearOf(dDataAux))];

               //Inicializa descrição do eixo X
               if (Trim(sDescEixoX)='') then sDescEixoX:=FormatDateTime('MM/YYYY',dDataAux);

               if (cdsEntSaiAux.Locate('DATADIA',dDataAux,[])) then
               begin
                  if (rEntrada=0) and (rSaida=0) then
                  begin
                     rEntrada:=cdsEntSaiAux.FieldByName('ENTRADA').AsFloat;
                     rSaida:=cdsEntSaiAux.FieldByName('SAIDA').AsFloat;
                  end
                  else
                  begin
                     rEntrada:=rEntrada+cdsEntSaiAux.FieldByName('ENTRADA').AsFloat;
                     rSaida:=rSaida+cdsEntSaiAux.FieldByName('SAIDA').AsFloat;
                  end;
               end;

               //Testa se a semana chegou ao fim
               if (DayOf(dDataAux)=TabelaDiasMes^[MonthOf(dDataAux)]) or (iDia=iNumDias) then
               begin
                  //Atualiza Saldo
                  rSaldo:=rSaldo+rEntrada-rSaida;

                  //Acrescenta registro do dia corrente
                  cdsAux.Append;
                  cdsAux.FieldByName('SALDO').AsFloat:=rSaldo;
                  cdsAux.FieldByName('ENTRADA').AsFloat:=rEntrada;
                  cdsAux.FieldByName('SAIDA').AsFloat:=rSaida;
                  cdsAux.FieldByName('DESCEIXOX').AsString:=sDescEixoX;
                  cdsAux.FieldByName('DATAPERIODO').AsFloat:=ParamFluxo.dDataInicFluxo+iContadorAux;
                  cdsAux.Post;

                  sDescEixoX:='';
                  Inc(iContadorAux);
                  rEntrada:=0;
                  rSaida:=0;
               end;
            end;
         end;
      end;
      Result:=cdsAux.Data;

      //Linha de Teste
      //cdsAux.SaveToFile('C:\ProjetosCM7\Testes-XML\T1.XML',dfXML);
   finally
      sSql.Free;
      cdsAux.Free;
      cdsSaldoAux.Free;
      cdsEntSaiAux.Free;
   end;
end;

end.

