unit uCtrlProcessaContab;

interface

Uses DB, uDataBase, uCmControlObject, dbclient, sysutils,uSistema,Provider,uMidasUtil,
     uCtrlGeral, uCtrlContab, ComCtrls, Classes,uCtrlPeriodo, uCtrlContaContabil,
     uFuncaoGeral,uCtrlLancamento,uCtrlHistoContab,uCMSqlParams,uCtrlPlanilha,
     uCtrlSubConta,uDiasUteis,uCtrlEventoSRH,uCtrlListTerceiros, uCtrlPlanoDePara,
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};


Type
  { tcSoSintetica => Somente as contas sintéticas
    tcSoAnalitica => Somente as contas analíticas
    tcAmbas => Ambos os tipos (Analíticas e Sintéticas)
  }
  TTipoConta      = (tcSoSintetica, tcSoAnalitica, tcAmbas);

  TCtrlProcessaContab = class(TCmControlObject)

  Protected
      procedure AfterInitialize;override;
      procedure OnCreateAppServer;override;

  private
    Geral          : TCtrlGeral;
    Periodo        : TCtrlPeriodo;
    Lancamento     : TCtrlLancamento;
    SubConta       : TCtrlSubConta;
    Planilha       : TCtrlPlanilha;
    HistoContab    : TCtrlHistoContab;
    ListTerceiros  : TCtrlListTerceiros;
    EventoSRH      : TCtrlEventoSRH;
    ContaContabil  : TCtrlContaContabil;
    PlanoDePara    : TCtrlPlanoDePara;
    Contab         : TCtrlContab;
    _sql           : TCmSqlParams;

    //==para geracao de lancamento consolidado ===
    _sqlZeraSaldoOrcado  :TCMSqlParams;
    _sqlZeraSaldoEst     :TCMSqlParams;
    _sqlPlanilhas        :TCMSqlParams;
    _sqlPlano            :TCMSqlParams;
    _sqlBalancete        :TCMSqlParams;
    _sqlBuscaConta       :TCMSqlParams;
    _sqlBuscaSubContaCon :TCMSqlParams;
    _sqlInsereConta      :TCMSqlParams;
    _sqlInsereSubConta   :TCMSqlParams;
    _sqlInsereUnidNegoc  :TCMSqlParams;
    _sqlInsereCCusto     :TCMSqlParams;
    _sqlBuscaUnNegBal    :TCMSqlParams;
    _sqlBuscaUnNegCon    :TCMSqlParams;
    _sqlBuscaCCusto      :TCMSqlParams;
    _sqlBuscaContaxCC    :TCMSqlParams;
    _sqlInsereContaxCC   :TCMSqlParams;
    _sqlInsereSaldoAnt   :TCMSqlParams;
    _sqlInsereSaldoPer   :TCMSqlParams;
    _sqlProcuraSaldo     :TCMSqlParams;
    _sqlInsereContasxCC  :TCMSqlParams;

    _cdsPlanilhas         :TClientDataSet;
    _cdsPlano             :TClientDataSet;
    _cdsBalancete         :TClientDataSet;
    _cdsBuscaConta        :TClientDataSet;
    _cdsBuscaSubContaCon  :TClientDataSet;
    _cdsBuscaCCusto       :TClientDataSet;
    _cdsBuscaContaxCC     :TClientDataSet;
    _cdsProcuraSaldo      :TClientDataSet;
    _cdsBuscaUnNegBal     :TClientDataSet;
    _cdsBuscaUnNegCon     :TClientDataSet;
    //===================================

    FContaDeb : string;
    FNomeTabela : string;
    FNomeRateio : string;
    FNomeCampo  : string;
    FTipoOper : string;
    FsMensAPS : string;
    FCodDC :string;
    FError :Boolean;
    FContaLinhaTexto :Integer;
    FLinhaTexto :string;
    FsMensAdd :string;
    FsMensAPS_Log :String;
    FProgresso: Integer;
    FMaxProgresso: Integer;
    FContaMostra: String;
    FcdsPlanilha: TClientDataSet;
    FcdsLancamento: TClientDataSet;
    FcdsEmpresasSel: TClientDataSet;
    FRetornaPlnPlanil: Double;
    FRetornaPlnCodigo: Double;
    FRetornaPlnNumLan: Integer;
    FStrlMens :TStringList;
    procedure SetcdsPlanilha(const Value: TClientDataSet);
    procedure SetcdsLancamento(const Value: TClientDataSet);
    procedure SetcdsEmpreasSel(const Value: TClientDataSet);
  public
      Property StrlMens :TStringList read FStrlMens write FStrlMens;
      Property Progresso : Integer read FProgresso;
      Property MaxProgresso : Integer read FMaxProgresso;
      Property RetornaPlnCodigo : Double read FRetornaPlnCodigo;
      Property RetornaPlnPlanil : Double read FRetornaPlnPlanil;
      Property ContaLinhaTexto : Integer read FContaLinhaTexto write FContaLinhaTexto;
      Property LinhaTexto : string read FLinhaTexto write FLinhaTexto;
      Property NomeTabela : string read FNomeTabela write FNomeTabela;
      Property NomeRateio : string read FNomeRateio write FNomeRateio;
      Property NomeCampo : string read FNomeCampo write FNomeCampo;
      Property RetornaPlnNumLan : Integer read FRetornaPlnNumLan;
      Property ContaMostra : String read FContaMostra;
      Property sMensAdd : String read FsMensAdd write FsMensAdd;
      Property CodDC : String read FCodDC write FCodDC;
      Property ContaDeb : String read FContaDeb;
      Property Error   : Boolean read FError write FError;
      Property sMensAPS : String read FsMensAPS write FsMensAPS;
      Property sMensAPS_Log : String read FsMensAPS_Log write FsMensAPS_Log;
      Property TipoOper : String read FTipoOper;
      Property cdsPlanilha : TClientDataSet read FcdsPlanilha write SetcdsPlanilha;
      Property cdsLancamento : TClientDataSet read FcdsLancamento write SetcdsLancamento;
      Property cdsEmpresasSel : TClientDataSet read FcdsEmpresasSel write SetcdsEmpreasSel;

      Constructor Create; Override;
      Destructor  Destroy;Override;

      // Metodos de Regra de negócio
     {Esta function tem como objetivo testar se Todos os lançamentos estão atualizados para outra moeda}
      Function TestaOutraMoeda( IdEmpresa : Double; iExercicio, iPeriodo : Integer; TipoPeriodo : TTipoPeriodo ) : Boolean;
     {Esta function tem como objetivo de marcar como atualizados os lançamentos em outra moeda para quem não usa outra moeda }
      Function AtualizaOutraMoedaPadrao( IdEmpresa : Double; iExercicio, iPeriodo : Integer; TipoPeriodo : TTipoPeriodo ) : Boolean;
     {Esta function tem como objetivo testar se o Saldo das contas sintéticas estão compatíveis com as analíticas}
      Function TestaSaldoSintetica(IdEmpresa: Double; iExercicio, iPeriodo: Integer): Boolean;
     {Esta function tem como objetivo testar se o Saldo das contas Analíticas estão compatíveis com os lançamentos}
      Function TestaSaldoAnalitica( IdEmpresa : Double; iExercicio, iPeriodo : Integer) : Boolean;
     {Esta function tem como objetivo testar se o Débito está batendo com o crédito nas planilhas}
      Function TestaDebCrePlanilha( IdEmpresa : Double; iExercicio, iPeriodo : Integer) : Boolean;
     {Esta function tem como objetivo testar se o Débito está batendo com o crédito na talela de saldo}
      Function TestaDebCreSaldo( IdEmpresa : Double; iExercicio, iPeriodo : Integer;
                                 TipoPeriodo : TTipoPeriodo) : Boolean;
     {Esta function tem como objetivo testar se todas as planilhas foram integradas}
      Function TestaIntegraPlanilha( IdEmpresa : Double; iExercicio, iPeriodo : Integer) : Boolean;
     {Esta function tem como objetivo testar se existe Saldo Contra a natureza das contas}
      Function TestaSaldoContraNatureza( IdEmpresa : Double; iExercicio, iPeriodo : Integer) : Boolean;
     {Esta function tem como objetivo testar a consistencia dos lançamentos}
      Function TestaConsistenciaLanc( IdEmpresa : Double; iExercicio, iPeriodo : Integer) : Boolean;
     {Esta function tem como objetivo arredondar o valor dos lançamentos para 2 casas decimais}
      Function ArredondaValores : Boolean;
     {Esta function tem como objetivo alterar o campo PLSTIPO da tabela PLANOSALDO
            para ficar igual ao campo PLATIPO da tabela PLANOCONTA}
      Function AcertaTipoSaldopeloTipoConta( IdEmpresa : Double; iExercicio, iPeriodo : Integer) : Boolean;
     {Esta function tem como objetivo deletar a tabela PLANOSALDO}
      Function DeletaSaldoContas(IdEmpresa : Double; iExercicio, iPeriodo : Integer; bDeletaEstatistica,bDeletaOrcado : Boolean; TipoConta : TTipoConta; TipoPeriodo : TTipoPeriodo ) : Boolean;
     {Esta function tem como objetivo deletar a tabela PLANOSALDO}
      Function ZeraSaldoContas(IdEmpresa : Double; iExercicio, iPeriodo : Integer; bZeraEstatistica,bZeraOrcado : Boolean; TipoConta : TTipoConta; TipoPeriodo : TTipoPeriodo) : Boolean;
     {Esta function efetua o processo de atualizar o saldo das contas pelos lançamentos}
      Function ProcessaSaldoAnalitica(IdEmpresa, iUsuario: Double;iExercicio, iPeriodo: Integer; bUsaPlanoPatro : Boolean): Boolean;
     {Esta function efetua o processo de atualizar o saldo das contas sinteticas (Chamada da tela)}
      Function ProcessaSaldoSintetica(IdEmpresa, iUsuario: Double;iExercicio, iPeriodo: Integer; bUsaPlanoPatro : Boolean ; TipoPeriodo : TTipoPeriodo): Boolean;
     {Esta function efetua o processo de integração por data (Chamada da Tela)}
      Function ProcessaIntegraData(IdEmpresa, iUsuario: Double;iExercicio, iPeriodo: Integer; bUsaPlanoPatro, bBloqueia : Boolean; sData, sModulos : String): Boolean;
     {Esta function efetua o processo de integração por planilha (Chamada da Tela)}
      Function ProcessaIntegraPlanilha(iUsuario, IdEmpresa : Double; bUsaPlanoPatro:Boolean): Boolean;
     {Esta function efetua a inclusão/alteração do lançamento a partir da tela de lançamento contábil (Chamada da Tela)}
      Function ProcessaLancamento(idEmpresa, iModuloOrigem, liUsuario : Double; bUsaPlanoPatro: Boolean;
                        iPlnCodigo: Double; sPlnDatDia: String): Boolean;
     {Esta function efetua a exclusão do lançamento a partir da tela de lançamento contábil (Chamada da Tela)}
      Function ProcessaExcluiLanc(iPlanilha, iModuloOrigem, liUsuario : Double; iNumLanc: LongInt; bUsaPlanoPatro, bExcluiPlanilha: Boolean): Boolean;
     {Esta função testa os parametros da contabilidade}
      Function TestaParamContab(dIdEmpresa :Double) :Boolean;
     {Esta função tem o objetivo de encerrar as contas de resultado}
      Function EncerraContasDeResultado(dEmpresa,dExercicio,dPeriodo,
                       dModuloO,dCodPlano:Double;iUsuario:Integer;sHist1,sHist2,sHist3,
                       sHist4,sHist5,sContaD,sCCustoD,sDataLanc,sTipoOper :string;bJunta,bUsaPPatro:boolean) :Boolean;
     {Esta função tem o objetivo de encerrar exercício}
      Function TemContasComSaldo(iEmpresa,iExercicio:Integer) :Boolean;
     {Esta função tem o objetivo de Verificar se Existe Saldo anterior no proximo exercicio}
      Function TestaSaldoAnteriorNoProxExerc(iEmpresa,iExercicio :Integer)  :Boolean;
     {Esta função tem o objetivo de deletar saldo anterior no processamento do encerramento do exercicio }
      Function DeletaSaldoAnterior(iEmpresa,iExercicio :Integer) :Boolean;
     {Esta função é responsável pelo processamento do encerramento do exercício}
      Function EncerraExercicio(iEmpresa,iExercicio,iUsuario:Integer;bChecado,bUsaPlanoPatro:Boolean) :Boolean;
     {Esta função tem a finalidade de importar o plano de contas}
      Function ImportaPlanoContas(ArquivoTexto:TStringList;sMascara,sCaminho:string;iPlano:Integer; dEmpresa: double): Boolean;
     {Esta função tem a finalidade de importar dados de saldos anteriores}
      Function ImportaSaldoAnterior(ArquivoTexto: TStringList; sExercicio,sCaminho,sMascara: string;
                                   iPlano,iUsuario:Integer;dEmpresa: double): Boolean;

     {Esta função tem a finalidade de importar conta correspondente}
      Function ImportaContaCorresp(ArquivoTexto: TStringList; sCaminho: string;
                                       iPlano: Integer;dEmpresa:Double): Boolean;

     {Esta função tem a finalidade de importar SAF}
     Function ImportaSAF(ArquivoTexto: TStringList;sTipoOper,sCaminho: string;
                         iModulo,iUsuario,iPlano,iPlanoPrev,iPlanoPatro,
                         iNumCommit,iContMax: Integer; dEmpresa: Double;bUsaPPatro,
                         bTestaConta:Boolean): Boolean;

     {Esta função tem a finalidade de importar folha dinamica}
      Function ImportaFolhaDinamica(ArquivoTexto: TStringList; sTipoOper, sCaminho: string;
                     iModulo, iUsuario, iPlano, iContMax: Integer;
                     dEmpresa: Double; bUsaPPatro, bTestaConta,bHistoChecado: Boolean): Boolean;


     {Esta função tem a finalidade de importar SRH Plus}
     Function ImportaSRH(ArquivoTexto: TStringList; sTipoOper, sCaminho,
                         sAtivProj: string; iModulo, iUsuario, iPlano,
                         iContMax: Integer; dNumColunas,dEmpresa: Double;
                         bUsaPPatro: Boolean): Boolean;

      {Esta função Importação - Lancamento}
      Function ImportaLancamentos(ArquivoTexto:TStringList;dEmpresa:Double;iPlano,iUsuario,
                                 iModulo,iNumCommit:Integer;sTipoOper, sCaminho:string;
                                 bTestaConta,bHistCheked,bUsaPPatro:Boolean) : Boolean;

      {Esta função tem o objetivo de importar planilhas excel}
      Function ImportaPlanilhaExcel(ArquivoTexto:TStringList;dEmpresa:Double;iPlano,iModulo,iUsuario:Integer;
                                   sDataLanc,sTipoOper:string;bUsaPPatro:Boolean) :Boolean;

      {Esta função Importação - RM}
      Function ImportaDadosRM(ArqTexto:TStringList;dEmpresa:Double;iPlano,iModulo,
                   iUsuario,rgVersao:Integer;sTipoOper,sAtivProj,Caminho:string;bUsaPPatro:Boolean):Boolean;

      {Esta função Importação - Fidelio}
      Function ImportaFidelio(ArqDiarias,ArqLanc:OleVariant;dEmpresa,dHotel:Double;iPlano,
                              iUsuario:Integer;Caminho:String; dtDataIni,dtDataFim:TDateTime;
                              bUsaPPatro:Boolean): Boolean;

      {Esta função altera o plano contabil}
       Function AlteraPlanoConta(dEmpresa: Double;sMascara:string;iPlano,iPlanoVigente,iExercicio: Integer;bMesmoPlano,
                                 bMesmosCCSC:Boolean): Boolean;


      {Esta função gera rateio por periodo}
       Function RemoveRateioPorPeriodo(dEmpresa:Double;iExercicio,iPeriodo:Integer): Boolean;

      {Esta função verifica se já existe rateio, antes de processar}
       Function ExisteRateio(dEmpresa:Double;iExercicio,iPeriodo:Integer) :Boolean;

      {Esta função gera rateio por periodo}
       Function GeraRateioPorPeriodo(dEmpresa:Double;iCodMoeda,iSinal,
                      iExercicio,iPeriodo:Integer;sDataFim:String): Boolean;

      {Esta função gera lancamento de rateios}
       Function GeraLancaRateioAtivProj(dEmpresa: Double; iUsuario,iPlano,iExercicio,
                 iPeriodo,iUnidNegoc: Integer;sTipoOper,sDataLanc:string;bUsaPPatro:Boolean): Boolean;

      {Esta função gera lancamento de rateios}
       Function GeraLancaRateioADM(dEmpresa: Double; iUsuario,iPlano,iExercicio,
                 iPeriodo: Integer;sTipoOper,sDataLanc:string;bUsaPPatro:Boolean): Boolean;

      {Esta função gera lancamento de rateios}
       Function GeraRateioPorPrograma(dEmpresa: Double;iUsuario, iPlano, iExercicio,
                iPeriodo: Integer; sTipoOper,sDataGera: string; bUsaPPatro: Boolean): Boolean;

      {Esta função gera lancamento de rateios}
       Function GeraRateioPorPPrevePatro(dEmpresa: Double;iUsuario, iPlano, iExercicio,
                iPeriodo: Integer; sTipoOper,sDataGera,sTipoFecha: string; bUsaPPatro: Boolean): Boolean;

      {Esta função gera lancamento de rateios}
       Function GeraLancaConsolidado(dEmpresa: Double;iUsuario, iPlano, iExercicio, iPeriodo: Integer; sTipoOper, sDataLanc,
                sMascara: string; bUsaPPatro,bOrcamento,bConsoUnidNegoc,bConsoSubConta: Boolean): Boolean;

      {Esta função procura saldo - sub funcao do gera lancamento consolidado}
       Function ProcuraSaldo(sConta, sCCusto: string; iUnidNegocOri, iPlano, iSubContaOri,iPeriodo,
                              iExercicio:Integer;dEmpresa,dPessoa: Double): LongInt;

      {Esta função altera o saldo orcado já existente}
       Function AlteraSaldoOrc(iSaldo:integer; dValOrcDeb, dValOrcCre: Double) :Boolean;

      {Esta função inserir o saldo orcado }
       Function InsereSaldoOrc(dEmpresa:Double;sConta, sCCusto, cTipo: string;
                         dValOrcDeb, dValOrcCre: Double;iExercicio,iPeriodo,iUsuario,iPlano,iUnidNegoc, iSubConta: Integer): Boolean;

      {Esta função tem o objetivo de montar os sql da funcao geralancaconsolidado }
       Procedure MontaSQLConsolidado(iPeriodo:Integer;bConsoUnidNegoc,bConsoSubconta:Boolean);

      {Esta função tem o objetivo de zerar os saldos orcados }
       Function ZeraSaldoOrcado(dEmpresa:Double;iExercicio,iPeriodo:Integer) :Boolean;

      {Esta função tem o objetivo de exclujir planilhas existentes }
       Function ExcluiPlanilhasExistentes(dEmpresa: Double;iExercicio,iPeriodo,
                     iUsuario,iModulo:Integer;bUsaPPatro:Boolean) :Boolean;

      {Esta função tem o objetivo de exclujir planilhas existentes }
       Function ZeraSaldoContaEst(dEmpresa: Double;iExercicio,iPeriodo:Integer) :Boolean;

      {Esta função tem o objetivo de inserir saldo }
       Function InsereSaldo(dEmpresa,dValCre,dValDeb:Double;iPlano,iExercicio,
                         iPeriodo,iSubConta,iUnidNegoc,iUsuario:Integer;cTipo,sConta,sCCusto:string) :Boolean;

      {Esta função tem o objetivo de criar estrutura para o cdsEmpresasSel}
       Function ListaEmpresasSel(dPessoa:Double) :OleVariant;

      {Esta função tem o objetivo de processar atualizaçao de moeda}
       Function ProcessaAtuMoeda(dEmpresa:Double) :Boolean;

  end;

implementation

Uses uCMMath;


Function TCtrlProcessaContab.DeletaSaldoAnterior(iEmpresa,iExercicio :Integer) :Boolean;
var
 sSql :string;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.DeletaSaldoAnterior(iEmpresa,iExercicio);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin
      Try
          StartTransaction;

          //*** Deleta saldo anterior ***
          sSql := 'DELETE FROM PLANOSALDO ' +
                  'WHERE (IDPESSOA     = ' + IntToStr(iEmpresa) + ') AND ' +
                  '      (PEREXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
                  '      (PERNUMERO IS NULL) ';

          Result := ExecSql(sSql);
          If Not Result Then
             Abort;
         //-------------------------------------------------------------
         Commit;

      Except
         on E:Exception Do
         Begin
            Rollback;
            Result := False;
         End;
      End;
   End;

end;


Function TCtrlProcessaContab.TestaSaldoAnteriorNoProxExerc(iEmpresa,iExercicio :Integer) :Boolean;
var
  sSql :string;
begin
     sSql := 'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ IDPLANOSALDO ' +
             'FROM PLANOSALDO ' +
             'WHERE ' +
             '    (IDPESSOA     = ' + IntToStr(iEmpresa) + ')  AND ' +
             '    (PEREXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
             '    (PERNUMERO IS NULL) ';

      _cds.Data := GetDataPacket(sSql);
      If Not _cds.isEmpty Then
      Begin
        Result := True;
      End Else
      Begin
         Result := False;
      End;
end;


Function TCtrlProcessaContab.TemContasComSaldo(iEmpresa,iExercicio:Integer) :Boolean;
var
  sSql :string;
Begin
       sSql := 'SELECT  /*+ index (PLANOSALDO XIE1PLANOSALDO) */ '+
               ' SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE)- '+
               '     DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR)) AS VLCOR,'+
               ' SUM(DECODE(S.PLSDEBITOOFICIAL,NULL,0,S.PLSDEBITOOFICIAL)- '+
               '     DECODE(S.PLSCREDITOOFICIAL,NULL,0,S.PLSCREDITOOFICIAL)) AS VLOFI,'+
               ' SUM(DECODE(S.PLSDEBITOGER,NULL,0,S.PLSDEBITOGER)- '+
               '     DECODE(S.PLSCREDITOGER,NULL,0,S.PLSCREDITOGER)) AS VLGER,'+
               ' SUM(DECODE(S.PLSDEBITOGEREN1,NULL,0,S.PLSDEBITOGEREN1)- '+
               '     DECODE(S.PLSCREDITOGEREN1,NULL,0,S.PLSCREDITOGEREN1)) AS VLGER1,'+
               ' SUM(DECODE(S.PLSDEBITOGEREN2,NULL,0,S.PLSDEBITOGEREN2)- '+
               '     DECODE(S.PLSCREDITOGEREN2,NULL,0,S.PLSCREDITOGEREN2)) AS VLGER2 '+
               ' FROM PLANOSALDO S , PLANOCONTA C WHERE (C.PLATIPO = ''A'') AND ' +
               ' (S.IDPESSOA = '+IntToStr(iEmpresa)+ ') AND ' +
               ' (S.PEREXERCICIO = '+ IntToStr(iExercicio) + ') '+
               ' AND ((C.PLAGRUPO = ''D'') OR (C.PLAGRUPO = ''R'') OR (C.PLAGRUPO = ''C'') '+
               ' OR (C.PLAGRUPO = ''O''))' +
               ' AND ((C.PLANO = S.PLANO) AND (C.PLACONTA = S.PLACONTA))' +
               ' HAVING '+
               ' (round(SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE)- '+
               '     DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR)),2) <> 0) OR  '+
               ' (round(SUM(DECODE(S.PLSDEBITOOFICIAL,NULL,0,S.PLSDEBITOOFICIAL)- '+
               '     DECODE(S.PLSCREDITOOFICIAL,NULL,0,S.PLSCREDITOOFICIAL)),2) <> 0) OR '+
               ' (round(SUM(DECODE(S.PLSDEBITOGER,NULL,0,S.PLSDEBITOGER)- '+
               '     DECODE(S.PLSCREDITOGER,NULL,0,S.PLSCREDITOGER)),2) <> 0) OR '+
               ' (round(SUM(DECODE(S.PLSDEBITOGEREN1,NULL,0,S.PLSDEBITOGEREN1)- '+
               '     DECODE(S.PLSCREDITOGEREN1,NULL,0,S.PLSCREDITOGEREN1)),2) <> 0) OR '+
               ' (round(SUM(DECODE(S.PLSDEBITOGEREN2,NULL,0,S.PLSDEBITOGEREN2)- '+
               '     DECODE(S.PLSCREDITOGEREN2,NULL,0,S.PLSCREDITOGEREN2)),2) <> 0) ';

      _cds.Data := GetDataPacket(sSql);
      If Not _cds.isEmpty Then
      Begin
        Result := True;
      End Else
      Begin
         Result := False;
      End;

End;

Function TCtrlProcessaContab.EncerraExercicio(iEmpresa,iExercicio,iUsuario:Integer;bChecado,bUsaPlanoPatro:Boolean) :Boolean;
var
  _cdsSaldo :TClientDataSet;
  sSql,sMens : String;
begin
    _cdsSaldo := TClientDataSet.Create(nil);

   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.EncerraExercicio(iEmpresa,iExercicio,iUsuario,bChecado,bUsaPlanoPatro);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin
      FMaxProgresso := 0;
      FProgresso    := 0;
      sMens         := ' ';
      Try

          sSql := 'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ S.IDPLANOPREV,S.IDPATRO,S.PLACONTA, S.PLSTIPO, S.CODCENTROCUSTO, S.UNIDNEGOC, S.CODSUBCONTA, S.PLANO,' +
                  ' SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE)) AS DEBCOR, '+
                  ' SUM(DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR)) AS CRECOR,'+
                  ' SUM(DECODE(S.PLSDEBITOOFICIAL,NULL,0,S.PLSDEBITOOFICIAL)) AS DEBOFI, '+
                  ' SUM(DECODE(S.PLSCREDITOOFICIAL,NULL,0,S.PLSCREDITOOFICIAL)) AS CREOFI,'+
                  ' SUM(DECODE(S.PLSDEBITOGER,NULL,0,S.PLSDEBITOGER)) AS DEBGER, '+
                  ' SUM(DECODE(S.PLSCREDITOGER,NULL,0,S.PLSCREDITOGER)) AS CREGER,'+
                  ' SUM(DECODE(S.PLSDEBITOGEREN1,NULL,0,S.PLSDEBITOGEREN1)) AS DEBGER1, '+
                  ' SUM(DECODE(S.PLSCREDITOGEREN1,NULL,0,S.PLSCREDITOGEREN1)) AS CREGER1,'+
                  ' SUM(DECODE(S.PLSDEBITOGEREN2,NULL,0,S.PLSDEBITOGEREN2)) AS DEBGER2, '+
                  ' SUM(DECODE(S.PLSCREDITOGEREN2,NULL,0,S.PLSCREDITOGEREN2)) AS CREGER2, '+
                  ' SUM(DECODE(S.PLSDEBITOHIST,NULL,0,S.PLSDEBITOHIST)) AS DEBHIS, '+
                  ' SUM(DECODE(S.PLSCREDITOHIST,NULL,0,S.PLSCREDITOHIST)) AS CREHIS '+
                  ' FROM PLANOSALDO S, PLANOCONTA C WHERE ' +
                  ' (S.IDPESSOA = '+IntToStr(iEmpresa)+') AND ' +
                  ' (S.PEREXERCICIO = '+ IntToStr(iExercicio -1) + ')  AND '+
                  ' (C.PLACONTA = S.PLACONTA) AND (C.PLANO = S.PLANO) AND (C.PLAGRUPO <> ''E'') '+
                  ' GROUP BY S.IDPLANOPREV,S.IDPATRO,S.PLACONTA ,S.PLSTIPO ,S.CODCENTROCUSTO, S.UNIDNEGOC, S.CODSUBCONTA, S.PLANO';

          _cdsSaldo.Data := GetDataPacket(sSql);
          FMaxProgresso := _cdsSaldo.RecordCount;
          //---------------------------------------------------------------------

          StartTransaction;

          //*** deleta os saldos do exercicio ***
          sSql:='DELETE PLANOSALDO WHERE (IDPESSOA = '+IntToStr(iEmpresa)+') AND '+
                ' (PEREXERCICIO = '+IntToStr(iExercicio)+') AND '+
                ' (PERNUMERO IS NULL) AND '+
                ' ((PLSORCADODEBITO IS NULL) OR (PLSORCADODEBITO = 0)) AND '+
                ' ((PLSORCADOCREDITO IS NULL) OR (PLSORCADOCREDITO = 0))';

          Result := ExecSql(sSql);
          If Not Result Then
          Begin
            sMens := 'Erro ao Deletar Registro na Tabela de Saldo.';
            RollBack;
            Result := False;
            _cdsSaldo.free;
            Exit;
          End;
          //----------------------------------------------------------------------

          //*** edita o arquivo de saldo ***
          sSql :='UPDATE PLANOSALDO SET ';
          sSql := sSql + ' PLSDEBITOCORRENTE = 0';
          sSql := sSql + ',PLSCREDITOCOR     = 0';
          sSql := sSql + ',PLSDEBITOOFICIAL  = 0';
          sSql := sSql + ',PLSCREDITOOFICIAL = 0';
          sSql := sSql + ',PLSDEBITOGER      = 0';
          sSql := sSql + ',PLSCREDITOGER     = 0';
          sSql := sSql + ',PLSDEBITOGEREN1   = 0';
          sSql := sSql + ',PLSCREDITOGEREN1  = 0';
          sSql := sSql + ',PLSDEBITOGEREN2   = 0';
          sSql := sSql + ',PLSCREDITOGEREN2  = 0';
          sSql := sSql + ',PLSDEBITOHIST     = 0';
          sSql := sSql + ',PLSCREDITOHIST    = 0';
          sSql := sSql + ' WHERE (IDPESSOA     = '+IntToStr(iEmpresa)+') AND '+
                         '       (PEREXERCICIO = '+IntToStr(iExercicio)+') AND '+
                         '       (PERNUMERO IS NULL)';

          Result := ExecSql(sSql);
          If Not Result Then
          Begin
            sMens := 'Erro ao Atualizar a Tabela de Saldo.';
            RollBack;
            Result := False;
            _cdsSaldo.free;
            Exit;
          End;
         //-----------------------------------------------------------------------

         //*** Le o arquivo de saldo ***
         _cdsSaldo.First;
         While not _cdsSaldo.EOF do
         Begin
           FProgresso := FProgresso + 1;
           MessageInfo := '*';
           if not Lancamento.AtuSaldoContas(iEmpresa, _cdsSaldo.FieldByName('UNIDNEGOC').AsFloat,
                                     iUsuario, _cdsSaldo.FieldByName('IDPLANOPREV').AsFloat,
                                     _cdsSaldo.FieldByName('IDPATRO').AsFloat,
                                     _cdsSaldo.FieldByName('PLANO').AsFloat, iExercicio,0,
                                     _cdsSaldo.FieldByName('CODSUBCONTA').AsInteger,
                                     _cdsSaldo.FieldByName('CODCENTROCUSTO').AsString,
                                     _cdsSaldo.FieldByName('PLACONTA').AsString,
                                     'D',
                                     _cdsSaldo.FieldByName('PLSTIPO').AsString,
                                     _cdsSaldo.FieldByName('DEBCOR').AsFloat,0,
                                     _cdsSaldo.FieldByName('DEBOFI').AsFloat,
                                     _cdsSaldo.FieldByName('DEBGER').AsFloat,
                                     _cdsSaldo.FieldByName('DEBGER1').AsFloat,
                                     _cdsSaldo.FieldByName('DEBGER2').AsFloat,
                                     _cdsSaldo.FieldByName('DEBHIS').AsFloat,
                                     bUsaPlanoPatro) then begin
              sMens := Lancamento.MessageInfo;
              Result := False;
              _cdsSaldo.free;
              RollBack;
              Exit;
           end;

           if not Lancamento.AtuSaldoContas(iEmpresa, _cdsSaldo.FieldByName('UNIDNEGOC').AsFloat,
                                     iUsuario, _cdsSaldo.FieldByName('IDPLANOPREV').AsFloat,
                                     _cdsSaldo.FieldByName('IDPATRO').AsFloat,
                                     _cdsSaldo.FieldByName('PLANO').AsFloat, iExercicio,0,
                                     _cdsSaldo.FieldByName('CODSUBCONTA').AsInteger,
                                     _cdsSaldo.FieldByName('CODCENTROCUSTO').AsString,
                                     _cdsSaldo.FieldByName('PLACONTA').AsString,
                                     'C',
                                     _cdsSaldo.FieldByName('PLSTIPO').AsString,
                                     _cdsSaldo.FieldByName('CRECOR').AsFloat,0,
                                     _cdsSaldo.FieldByName('CREOFI').AsFloat,
                                     _cdsSaldo.FieldByName('CREGER').AsFloat,
                                     _cdsSaldo.FieldByName('CREGER1').AsFloat,
                                     _cdsSaldo.FieldByName('CREGER2').AsFloat,
                                     _cdsSaldo.FieldByName('CREHIS').AsFloat,
                                     bUsaPlanoPatro) then begin
              sMens := Lancamento.MessageInfo;
              Result := False;
              _cdsSaldo.free;
              RollBack;
              Exit;
           end;

           _cdsSaldo.Next;

         End;

         If not bChecado Then
         Begin
            sSql:='UPDATE PARAMCONTAB SET PACENCER = ''N'',PACEXERCICIOATUAL = '+IntToStr(iExercicio)+
                  ' WHERE IDPESSOA = '+IntToStr(iEmpresa);

            Result := ExecSql(sSql);
            If Not Result Then
            Begin
              sMens := 'Erro ao Atualizar a Tabela de Parametros.';
              RollBack;
              Result := False;
              _cdsSaldo.free;
              Exit;
            End;
         End;
         Commit;
      Except
        On E:Exception Do
        Begin
           Rollback;
           MessageInfo := sMens;
           Result := False;
        End;
      End;
   End;
end;

Function TCtrlProcessaContab.EncerraContasDeResultado(dEmpresa,dExercicio,dPeriodo,
     dModuloO,dCodPlano:Double;iUsuario:Integer;sHist1,sHist2,sHist3,
     sHist4,sHist5,sContaD,sCCustoD,sDataLanc,sTipoOper :string;bJunta,bUsaPPatro:boolean) :Boolean;
var
  sSql,sMens : String;
  dPlnCodigo : Double;
  CdsLancamento : TClientDataSet;
begin

   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.EncerraContasDeResultado(dEmpresa,dExercicio,dPeriodo,
                                    dModuloO,dCodPlano,iUsuario,sHist1,sHist2,sHist3,
                                    sHist4,sHist5,sContaD,sCCustoD,sDataLanc,sTipoOper,
                                    bJunta,bUsaPPatro);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin
      dPlnCodigo := 0;
      sMens      := '';
      CdsLancamento := TClientDataSet.Create(nil);

      Try
          FMaxProgresso := 0;
          FProgresso    := 0;
          StartTransaction;

          sSql := 'SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ S.PLACONTA, S.CODCENTROCUSTO, S.UNIDNEGOC, S.CODSUBCONTA, ' +
                  '       S.IDPATRO, S.IDPLANOPREV, '+
                  ' SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE)- '+
                  '     DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR)) AS VLCOR,'+
                  ' SUM(DECODE(S.PLSDEBITOOFICIAL,NULL,0,S.PLSDEBITOOFICIAL)- '+
                  '     DECODE(S.PLSCREDITOOFICIAL,NULL,0,S.PLSCREDITOOFICIAL)) AS VLOFI,'+
                  ' SUM(DECODE(S.PLSDEBITOGER,NULL,0,S.PLSDEBITOGER)- '+
                  '     DECODE(S.PLSCREDITOGER,NULL,0,S.PLSCREDITOGER)) AS VLGER,'+
                  ' SUM(DECODE(S.PLSDEBITOGEREN1,NULL,0,S.PLSDEBITOGEREN1)- '+
                  '     DECODE(S.PLSCREDITOGEREN1,NULL,0,S.PLSCREDITOGEREN1)) AS VLGER1,'+
                  ' SUM(DECODE(S.PLSDEBITOGEREN2,NULL,0,S.PLSDEBITOGEREN2)- '+
                  '     DECODE(S.PLSCREDITOGEREN2,NULL,0,S.PLSCREDITOGEREN2)) AS VLGER2 '+
                  ' FROM PLANOSALDO S , PLANOCONTA C WHERE (S.PLSTIPO = ''A'') AND ' +
                  ' (S.IDPESSOA = '+FloatToStr(dEmpresa)+') AND ' +
                  ' (S.PEREXERCICIO = '+FloatToStr(dExercicio)+') AND ((S.PERNUMERO IS NULL) OR ' +
                  ' (S.PERNUMERO <= '+FloatToStr(dPeriodo)+')) AND ' +
                  ' ((C.PLAGRUPO = ''R'') OR (C.PLAGRUPO = ''D'') OR (C.PLAGRUPO = ''C'') OR (C.PLAGRUPO = ''O'')) AND ' +
                  ' ((C.PLANO = S.PLANO) AND (C.PLACONTA = S.PLACONTA))' +
                  ' GROUP BY S.PLACONTA ,S.CODCENTROCUSTO, S.UNIDNEGOC, S.CODSUBCONTA, S.IDPATRO, S.IDPLANOPREV';


           CdsLancamento.Data := GetDataPacket(sSql);
           FMaxProgresso := CdsLancamento.RecordCount;

         //--------------------------------------------------------------------
         // Edita a tabela periodo
         //--------------------------------------------------------------------
          sSql:= 'UPDATE PERIODO SET PERBLOQUE = ''N'',PERATUALI = ''N'' '+
                 'WHERE PEREXERCICIO = ' + FloatToStr(dExercicio) +
                 ' AND PERNUMERO     = ' + FloatToStr(dPeriodo) +
                 ' AND IDPESSOA      = ' + FloatToStr(dEmpresa);

          Result := ExecSql(sSql);
          If Not Result Then
          Begin
            sMens := 'Erro ao Atualizarr a Tabela Periodo.';
            RollBack;
            Result := False;
            Exit;
          End;
         //----------------------------------------------------------------
         CdsLancamento.First;
         While not CdsLancamento.EOF do
         Begin
            FProgresso  := FProgresso + 1;
            MessageInfo := '*';
            If CdsLancamento.FieldByName('VLCOR').AsFloat <> 0 Then
            Begin
              Lancamento.lcTestaConta := False;
              If not Lancamento.InsereLancaContab ('2',dEmpresa,dModuloO,iUsuario,dCodPlano,
                                                  CdsLancamento.FieldbyName('UNIDNEGOC').AsFloat,
                                                  0,CdsLancamento.FieldbyName('CODSUBCONTA').AsFloat,
                                                  CdsLancamento.FieldbyName('IDPLANOPREV').AsFloat,
                                                  CdsLancamento.FieldByName('IDPATRO').AsFloat,
                                                  dPlnCodigo,0,sDataLanc,
                                                  '',sHist1,sHist2,sHist3,
                                                  sHist4,sHist5,sTipoOper,sCCustoD,sContaD,
                                                  CdsLancamento.FieldbyName('CODCENTROCUSTO').AsString,
                                                  CdsLancamento.FieldByName('PLACONTA').AsString,'',
                                                  CdsLancamento.FieldByName('VLCOR').AsFloat,
                                                  bJunta,bUsaPPatro) Then

              Begin
                sMens  := Lancamento.MessageInfo;
                RollBack;
                Result := False;
                Exit;
              End Else
              Begin
                 dPlnCodigo := Lancamento.RetornoPlnCodigo;
              End
            End;
            //----------------------------------------------------------------
            If CdsLancamento.FieldByName('VLOFI').AsFloat <> 0 Then
            Begin
              Lancamento.lcTipConvOfiCre := 'M';
              Lancamento.lcTipConvOfiDeb := 'M';
              Lancamento.lcTestaConta    := False;
              If not Lancamento.InsereLancaContab('2',dEmpresa,dModuloO,iUsuario,dCodPlano,
                                                  CdsLancamento.FieldbyName('UNIDNEGOC').AsFloat,
                                                  0,CdsLancamento.FieldbyName('CODSUBCONTA').AsFloat,
                                                  CdsLancamento.FieldbyName('IDPLANOPREV').AsFloat,
                                                  CdsLancamento.FieldByName('IDPATRO').AsFloat,
                                                  dPlnCodigo,0,sDataLanc,
                                                  '',sHist1,sHist2,sHist3,
                                                  sHist4,sHist5,sTipoOper,sCCustoD,sContaD,
                                                  CdsLancamento.FieldbyName('CODCENTROCUSTO').AsString,
                                                  CdsLancamento.FieldByName('PLACONTA').AsString,'',
                                                  CdsLancamento.FieldByName('VLOFI').AsFloat,
                                                  bJunta,bUsaPPatro) Then

              Begin
                sMens  := Lancamento.MessageInfo;
                RollBack;
                Result := False;
                Exit;
              End Else
              Begin
                dPlnCodigo := Lancamento.RetornoPlnCodigo;
              End
            End;
         //----------------------------------------------------------------
            If CdsLancamento.FieldByName('VLGER').AsFloat <> 0 Then
            Begin
              Lancamento.lcTipConvGerCre := 'M';
              Lancamento.lcTipConvGerDeb := 'M';
              Lancamento.lcTestaConta    := False;
              If not Lancamento.InsereLancaContab('2',dEmpresa,dModuloO,iUsuario,dCodPlano,
                                                  CdsLancamento.FieldbyName('UNIDNEGOC').AsFloat,
                                                  0,CdsLancamento.FieldbyName('CODSUBCONTA').AsFloat,
                                                  CdsLancamento.FieldbyName('IDPLANOPREV').AsFloat,
                                                  CdsLancamento.FieldByName('IDPATRO').AsFloat,
                                                  dPlnCodigo,0,sDataLanc,
                                                  '',sHist1,sHist2,sHist3,
                                                  sHist4,sHist5,sTipoOper,sCCustoD,sContaD,
                                                  CdsLancamento.FieldbyName('CODCENTROCUSTO').AsString,
                                                  CdsLancamento.FieldByName('PLACONTA').AsString,'',
                                                  CdsLancamento.FieldByName('VLGER').AsFloat,
                                                  bJunta,bUsaPPatro) Then

              Begin
                sMens  := Lancamento.MessageInfo;
                RollBack;
                Result := False;
                Exit;
              End Else
              Begin
                dPlnCodigo := Lancamento.RetornoPlnCodigo;
              End

            End;
         //----------------------------------------------------------------
            If CdsLancamento.FieldByName('VLGER1').AsFloat <> 0 Then
            Begin
              Lancamento.lcTipConvGe1Cre := 'M';
              Lancamento.lcTipConvGe1Deb := 'M';
              Lancamento.lcTestaConta    := False;
              If not Lancamento.InsereLancaContab('2',dEmpresa,dModuloO,iUsuario,dCodPlano,
                                                  CdsLancamento.FieldbyName('UNIDNEGOC').AsFloat,
                                                  0,CdsLancamento.FieldbyName('CODSUBCONTA').AsFloat,
                                                  CdsLancamento.FieldbyName('IDPLANOPREV').AsFloat,
                                                  CdsLancamento.FieldByName('IDPATRO').AsFloat,
                                                  dPlnCodigo,0,sDataLanc,
                                                  '',sHist1,sHist2,sHist3,
                                                  sHist4,sHist5,sTipoOper,sCCustoD,sContaD,
                                                  CdsLancamento.FieldbyName('CODCENTROCUSTO').AsString,
                                                  CdsLancamento.FieldByName('PLACONTA').AsString,'',
                                                  CdsLancamento.FieldByName('VLGER1').AsFloat,
                                                  bJunta,bUsaPPatro) Then

              Begin
                sMens  := Lancamento.MessageInfo;
                RollBack;
                Result := False;
                Exit;
              End Else
              Begin
                dPlnCodigo := Lancamento.RetornoPlnCodigo;
              End
            End;
         //----------------------------------------------------------------
            If CdsLancamento.FieldByName('VLGER2').AsFloat <> 0 Then
            Begin
              Lancamento.lcTipConvGe2Cre := 'M';
              Lancamento.lcTipConvGe2Deb := 'M';
              Lancamento.lcTestaConta    := False;
              If not Lancamento.InsereLancaContab('2',dEmpresa,dModuloO,iUsuario,dCodPlano,
                                                  CdsLancamento.FieldbyName('UNIDNEGOC').AsFloat,
                                                  0,CdsLancamento.FieldbyName('CODSUBCONTA').AsFloat,
                                                  CdsLancamento.FieldbyName('IDPLANOPREV').AsFloat,
                                                  CdsLancamento.FieldByName('IDPATRO').AsFloat,
                                                  dPlnCodigo,0, sDataLanc,
                                                  '',sHist1,sHist2,sHist3,
                                                  sHist4,sHist5,sTipoOper,sCCustoD,sContaD,
                                                  CdsLancamento.FieldbyName('CODCENTROCUSTO').AsString,
                                                  CdsLancamento.FieldByName('PLACONTA').AsString,'',
                                                  CdsLancamento.FieldByName('VLGER2').AsFloat,
                                                  bJunta,bUsaPPatro) Then

              Begin
                sMens  := Lancamento.MessageInfo;
                RollBack;
                Result := False;
                Exit;
              End;
            End Else
              Begin
                dPlnCodigo := Lancamento.RetornoPlnCodigo;
              End;

             CdsLancamento.Next;
         End;

         //--------------------------------------------------------------------
         // Edita a tabela paramconta
         //--------------------------------------------------------------------
         sSql:='UPDATE PARAMCONTAB SET PACENCER = ''S'' '+
               'WHERE IDPESSOA = '+FloatToStr(dEmpresa);

          Result := ExecSql(sSql);
          If Not Result Then
          Begin
            sMens := 'Erro ao Atualizar a Tabela de Parametros.';
            Result := False;
            RollBack;
            Exit;
          End;

          Commit;
          CdsLancamento.Free;

      Except
         on E:Exception Do
         Begin
            RollBack;
            Result := False;
            CdsLancamento.Free;
            MessageInfo := sMens+' '+E.Message;
         End;
      End;
   End;

end;

function TCtrlProcessaContab.TestaParamContab(dIdEmpresa:Double) :Boolean;
begin
   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.TestaParamContab(dIdEmpresa,FContaDeb,FTipoOper);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin
       Result := True;

       If Not Contab.SelecionaParametrosProc(dIdEmpresa) Then
       Begin
          Result := False;
          MessageInfo := Contab.MessageInfo;
          Exit;
       End;

       FContaDeb := '';
       If  Contab.ContaEncer  = '' Then
       Begin
         MessageInfo := 'A Conta de Resultados nos Parâmetros da Contabilidade não foi cadastrada.';
         Result := False;
       End Else
       Begin
         FContaDeb := Contab.ContaEncer;
       End;

       FTipoOper := '';
       If  Contab.TipoOpEncer = '' Then
       Begin
         MessageInfo := 'O Tipo de Operação para Encerramento não preenchido.';
         Result := False;
       End Else
       Begin
         FTipoOper := Contab.TipoOpEncer;
       End;
   End;
end;

function TCtrlProcessaContab.AtualizaOutraMoedaPadrao(IdEmpresa: Double; iExercicio,
  iPeriodo: Integer; TipoPeriodo : TTipoPeriodo): Boolean;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.AtualizaOutraMoedaPadrao(IdEmpresa,iExercicio,
                            iPeriodo,Integer(TipoPeriodo));
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin
      FProgresso    := 0;
      FMaxProgresso := 0;
      Result := True;

      With TCMSqlParams.Create(nil) Do
       Try
          Try

              StartTransaction;
              ControlObject := Self;
              SQL.Clear;
              SQL.Add('UPDATE LANCAMENTO SET LACATOUTMOEDA = ''S''                      ');
              SQL.Add('WHERE ((LACATOUTMOEDA <>''S'') OR (LACATOUTMOEDA IS NULL))       ');
              SQL.Add('  AND (PLNCODIGO IN                                              ');
              SQL.Add('                (SELECT PLNCODIGO FROM PLANILHA                  ');
              SQL.Add('                  WHERE (PEREXERCICIO = :PEREXERCICIO)           ');
              If iPeriodo > 0 Then
              Begin
                Case TipoPeriodo of
                   tpSoPeriodo : SQL.Add('  AND (PERNUMERO =  :PERNUMERO)                ');
                   tpMenorIgual: SQL.Add('  AND (PERNUMERO <= :PERNUMERO)                ');
                end ;
              End;
              SQL.Add('                     AND (IDPESSOA = :IDPESSOA)))               ');

              Prepare;

              ParamByName('PEREXERCICIO').asInteger := iExercicio;
              ParamByName('PERNUMERO').asInteger    := iPeriodo;
              ParamByName('IDPESSOA').asFloat       := idEmpresa;


              If not ExecSQL(SQLChanged,False) Then
                 Raise Exception.Create(MessageInfo);

              Commit;

              Result := True;

          Except
              On E:Exception Do
              Begin
                Rollback;
                Result := False;
                MessageInfo := E.Message;
              End;
          End;
       Finally
         Free;
       End;
   End;
end;

constructor TCtrlProcessaContab.Create;
begin
  inherited;
  Periodo        := TCtrlPeriodo.Create;
  Lancamento     := TCtrlLancamento.Create;
  SubConta       := TCtrlSubConta.Create;
  EventoSRH      := TCtrlEventoSRH.Create;
  HistoContab    := TCtrlHistoContab.Create;
  ContaContabil  := TCtrlContaContabil.Create;
  Planilha       := TCtrlPlanilha.Create;
  ListTerceiros  := TCtrlListTerceiros.Create;
  Contab         := TCtrlContab.Create;
  PlanoDePara    := TCtrlPlanoDePara.Create;
  Geral          := TCtrlGeral.Create;
  //
  FcdsPlanilha   := TClientDataSet.Create(nil);
  FcdsLancamento := TClientDataSet.Create(nil);

  _sql               := TCmSqlParams.Create(nil);
  _sql.ControlObject := Self;

  //==== para geracao de lancamentos consolidados ===
  _sqlZeraSaldoOrcado  := TCMSqlParams.Create(nil);
  _sqlZeraSaldoOrcado.ControlObject := Self;

  _sqlInsereUnidNegoc := TCMSqlParams.Create(nil);
  _sqlInsereUnidNegoc.ControlObject := Self;

  _sqlBuscaUnNegBal := TCMSqlParams.Create(nil);
  _sqlBuscaUnNegBal.ControlObject := Self;

  _sqlBuscaUnNegCon := TCMSqlParams.Create(nil);
  _sqlBuscaUnNegCon.ControlObject := Self;

  _sqlInsereSubConta := TCMSqlParams.Create(nil);
  _sqlInsereSubConta.ControlObject := Self;

  _sqlInsereSaldoAnt := TCMSqlParams.Create(nil);
  _sqlInsereSaldoAnt.ControlObject := Self;

  _sqlInsereSaldoPer := TCMSqlParams.Create(nil);
  _sqlInsereSaldoPer.ControlObject := Self;

  _sqlBuscaSubContaCon := TCMSqlParams.Create(nil);
  _sqlBuscaSubContaCon.ControlObject := Self;

  _sqlBuscaContaxCC := TCMSqlParams.Create(nil);
  _sqlBuscaContaxCC.ControlObject := Self;

  _sqlInsereConta := TCMSqlParams.Create(nil);
  _sqlInsereConta.ControlObject := Self;

  _sqlInsereContaxCC := TCMSqlParams.Create(nil);
  _sqlInsereContaxCC.ControlObject := Self;

  _sqlPlano  := TCMSqlParams.Create(nil);
  _sqlPlano.ControlObject := Self;

  _sqlZeraSaldoEst  := TCMSqlParams.Create(nil);
  _sqlZeraSaldoEst.ControlObject := Self;

  _sqlProcuraSaldo  := TCMSqlParams.Create(nil);
  _sqlProcuraSaldo.ControlObject := Self;

  _sqlBuscaConta  := TCMSqlParams.Create(nil);
  _sqlBuscaConta.ControlObject := Self;

  _sqlBuscaCCusto  := TCMSqlParams.Create(nil);
  _sqlBuscaCCusto.ControlObject := Self;

  _sqlInsereCCusto  := TCMSqlParams.Create(nil);
  _sqlInsereCCusto.ControlObject := Self;

  _cdsPlano          := TClientDataSet.Create(nil);
  _cdsBalancete      := TClientDataSet.Create(nil);
  _cdsPlanilhas      := TClientDataSet.Create(nil);
  _cdsBuscaConta     := TClientDataSet.Create(nil);
  _cdsBuscaCCusto    := TClientDataSet.Create(nil);
  _cdsBuscaUnNegBal  := TClientDataSet.Create(nil);
  _cdsBuscaUnNegCon  := TClientDataSet.Create(nil);
  _cdsBuscaContaxCC  := TClientDataSet.Create(nil);
  _cdsProcuraSaldo   := TClientDataSet.Create(nil);
  _cdsProcuraSaldo   := TClientDataSet.Create(nil);

end;

destructor TCtrlProcessaContab.Destroy;
begin
  inherited;
  If IsAppServer Then
  Begin
    FcdsEmpresasSel.Free;
  End;

  If FcdsLancamento.Active Then FcdsLancamento.Close;
     FcdsLancamento.Free;
  If FcdsPlanilha.Active Then FcdsPlanilha.Close;
     FcdsPlanilha.Free;
  //
  ListTerceiros.free;
  Periodo.Free;
  Lancamento.Free;
  PlanoDePara.free;
  SubConta.free;
  EventoSRH.free;
  ContaContabil.Free;
  Contab.Free;
  Planilha.Free;
  HistoContab.Free;
  Geral.Free;
  _sql.Free;

  //=== geracao de lancamentos consolidados ===
  _sqlZeraSaldoOrcado.free;
  _sqlInsereUnidNegoc.free;
  _sqlBuscaUnNegBal.free;
  _sqlBuscaUnNegCon.free;
  _sqlInsereSubConta.free;
  _sqlInsereSaldoAnt.free;
  _sqlInsereSaldoPer.free;
  _sqlBuscaSubContaCon.free;
  _sqlBuscaContaxCC.free;
  _sqlInsereConta.free;
  _sqlInsereContaxCC.free;
  _sqlPlano.free;
  _sqlZeraSaldoEst.free;
  _sqlProcuraSaldo.free;
  _sqlBuscaConta.free;
  _sqlBuscaCCusto.free;
  _sqlInsereCCusto.free;

  _cdsPlano.free;
  _cdsBalancete.free;
  _cdsPlanilhas.free;
  _cdsBuscaConta.free;
  _cdsBuscaCCusto.free;
  _cdsBuscaUnNegBal.free;
  _cdsBuscaUnNegCon.free;
  _cdsBuscaContaxCC.free;
  _cdsProcuraSaldo.free;
end;


function TCtrlProcessaContab.TestaDebCrePlanilha(IdEmpresa: Double; iExercicio,
  iPeriodo: Integer): Boolean;
begin

   Result := True;

   With TCmSqlParams.Create(nil) Do
      Try
          ControlObject := Self;
          SQL.Clear;
          SQL.Add('SELECT P.PLNCODIGO, P.PLNDATDIA, P.PLNPLANIL           ');
          SQL.Add('FROM PLANILHA P, LANCAMENTO L                          ');
          SQL.Add('WHERE (P.PERNUMERO    = :PERNUMERO)                    ');
          SQL.Add('  AND (P.PEREXERCICIO = :PEREXERCICIO)                 ');
          SQL.Add('  AND (P.IDPESSOA     = :IDPESSOA)                     ');
          SQL.Add('  AND (P.PLNCODIGO    = L.PLNCODIGO)                   ');
          SQL.Add('GROUP BY  P.PLNCODIGO, P.PLNDATDIA, P.PLNPLANIL        ');
          SQL.Add('HAVING ((ROUND(SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,L.LACVALOR*-1)),2) <> 0)             ');
          SQL.Add('    OR (ROUND(SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOFICIAL,L.LACVALOFICIAL*-1)),2) <> 0)    ');
          SQL.Add('    OR (ROUND(SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALGERENCIAL,L.LACVALGERENCIAL*-1)),2) <> 0)');
          SQL.Add('    OR (ROUND(SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALGEREN1,L.LACVALGEREN1*-1)),2) <> 0)      ');
          SQL.Add('    OR (ROUND(SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALGEREN2,L.LACVALGEREN2*-1)),2) <> 0))     ');

          Prepare;

          ParamByName('PERNUMERO').AsInteger    := iPeriodo;
          ParamByName('PEREXERCICIO').AsInteger := iExercicio;
          ParamByName('IDPESSOA').AsFloat       := idEmpresa;

          _cds.Data := Data;

          FProgresso    := 0;
          FMaxProgresso := _cds.RecordCount;

          _cds.First;
          While not _cds.EOF do
          Begin
             FProgresso  := FProgresso + 1;
             MessageInfo := 'Os totais devedores e credores da planilha ' + inttostr(_cds.FieldByName('PLNPLANIL').AsInteger) + ' do dia ' + _cds.FieldByName('PLNDATDIA').AsString + ' não estão batendo';
             Result      := False;
             _cds.Next;
          End;
      Finally
        Free;
      End;
end;

function TCtrlProcessaContab.TestaIntegraPlanilha(IdEmpresa: Double;
  iExercicio, iPeriodo: Integer): Boolean;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.TestaIntegraPlanilha(IdEmpresa,iExercicio,iPeriodo);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      Result := True;
      _Cds.Data := Lancamento.SelecionaPlanilhas(0,0,0,idEmpresa,iExercicio,iPeriodo,tpSoPeriodo,'','','','',
                                    teNaoEfetivado,tolData);
      If Not _Cds.IsEmpty then
      begin
         FProgresso    := 0;
         FMaxProgresso := _Cds.RecordCount;
         _Cds.First;
         while not _Cds.EOF do begin
            FProgresso := FProgresso + 1;
            MessageInfo := 'A planilha ' + inttostr(_Cds.FieldByName('PLNPLANIL').AsInteger) + ' do dia ' + _Cds.FieldByName('PLNDATDIA').AsString + ' do Sistema de ' + _Cds.FieldByName('NOMEMODULO').AsString + ' não foi integrada';
            Result := False;
            _Cds.Next;
         end;
      end else begin
         Messageinfo := 'Não Há Planilhas Para Serem Processadas.';
         Result := False;
      end;
   end;
end;

function TCtrlProcessaContab.TestaOutraMoeda(IdEmpresa: Double; iExercicio,
  iPeriodo: Integer; TipoPeriodo : TTipoPeriodo): Boolean;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.TestaOutraMoeda(IdEmpresa,iExercicio,iPeriodo,Integer(TipoPeriodo));
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      If Not Contab.SelecionaParametrosProc(IdEmpresa) Then begin
         Result := False;
         MessageInfo := Contab.MessageInfo
      end Else
        if Contab.TestaExisteMoeda then begin
           Result := True;
           _Cds.Data := Lancamento.SelecionaLancamentos(0,idEmpresa, iExercicio, iPeriodo, TipoPeriodo,'','','','',
                                   teAmbos,tomNaoAtualizada,tolPlnCodigo, tsSemSoma, False);
           If Not _Cds.IsEmpty Then
           begin
              FProgresso    := 0;
              FMaxProgresso := _Cds.RecordCount;
              _Cds.First;
              while not _Cds.EOF do begin
                 FProgresso := FProgresso + 1;
                 MessageInfo := 'Não foi feita a devida atualização em outra moeda na planilha' + inttostr(_Cds.FieldByName('PLNPLANIL').AsInteger) + ' do dia ' + _Cds.FieldByName('PLNDATDIA').AsString;
                 Result := False;
                 _Cds.Next;
              end;
           end else begin
              Result := False;
           end;
        end else begin
           if not AtualizaOutraMoedaPadrao( IdEmpresa, iExercicio, iPeriodo,TipoPeriodo ) then Result := False else Result := True;
      end;
   end;
end;

function TCtrlProcessaContab.TestaSaldoAnalitica(IdEmpresa: Double; iExercicio,
  iPeriodo: Integer): Boolean;
begin
   {Funcão implementada na Aplicação Servidora}
{   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.TestaSaldoAnalitica(IdEmpresa,iExercicio,iPeriodo);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin    }

   Result := True;

   With TCMSqlParams.Create(nil) Do
     Try
        ControlObject := Self;
        SQL.Clear;
        SQL.Add('SELECT UN.PLACONTA, UN.PLANO, SUM(UN.MOVDEBLAN), SUM(UN.MOVCRELAN), SUM(UN.MOVDEVSAL), SUM(UN.MOVCRESAL)');
        SQL.Add('FROM                                                                                  ');
        SQL.Add('   ((SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ S.PLACONTA, S.PLANO, 0 AS MOVDEBLAN, 0 AS MOVCRELAN, ');
        SQL.Add('           SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE)) AS MOVDEVSAL,  ');
        SQL.Add('           SUM(DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR)) AS MOVCRESAL           ');
        SQL.Add('    FROM PLANOSALDO S, PLANOCONTA P                                                   ');
        SQL.Add('    WHERE (S.PERNUMERO    = :PERNUMERO)    AND                                        ');
        SQL.Add('          (S.PEREXERCICIO = :PEREXERCICIO) AND                                        ');
        SQL.Add('          (S.IDPESSOA     = :IDPESSOA)     AND                                        ');
        SQL.Add('          (S.PLSTIPO      = ''A'')         AND                                        ');
        SQL.Add('          (P.PLACONTA     = S.PLACONTA)    AND                                        ');
        SQL.Add('          (P.PLANO        = S.PLANO)       AND                                        ');
        SQL.Add('          (P.PLAGRUPO    <> ''E'')                                                    ');
        SQL.Add('    GROUP BY S.PLACONTA, S.PLANO )                                                    ');
        SQL.Add('   UNION                                                                              ');
        SQL.Add('   (SELECT L.PLACONTA, L.PLANO,                                                       ');
        SQL.Add('           SUM(DECODE(L.LACDEBCRE,''D'',DECODE(L.LACVALOR,NULL,0,L.LACVALOR),0)) AS MOVDEVLAN,  ');
        SQL.Add('           SUM(DECODE(L.LACDEBCRE,''C'',DECODE(L.LACVALOR,NULL,0,L.LACVALOR),0)) AS MOVCRELAN,  ');
        SQL.Add('           0 AS MOVDEBSAL, 0 AS MOVCRESAL                                                       ');
        SQL.Add('    FROM LANCAMENTO L, PLANILHA P, PLANOCONTA PC                                                ');
        SQL.Add('    WHERE (P.PERNUMERO    = :PERNUMERO)              AND                                        ');
        SQL.Add('          (P.PEREXERCICIO = :PEREXERCICIO)           AND                                        ');
        SQL.Add('          (P.IDPESSOA     = :IDPESSOA)               AND                                        ');
        SQL.Add('          (P.PLNEFETIVADO = ''S'') AND                                                          ');
        SQL.Add('          (PC.PLANO = L.PLANO) AND                                                              ');
        SQL.Add('          (PC.PLACONTA = L.PLACONTA) AND                                                        ');
        SQL.Add('          (PC.PLAGRUPO <> ''E'') AND                                                            ');
        SQL.Add('          (P.PLNCODIGO    = L.PLNCODIGO)                                                        ');
        SQL.Add('    GROUP BY L.PLANO,L.PLACONTA ) ) UN                                                          ');
        SQL.Add('GROUP BY UN.PLANO, UN.PLACONTA                                                                  ');
        SQL.Add('HAVING  (ROUND(SUM(UN.MOVDEBLAN),2) <> ROUND(SUM(UN.MOVDEVSAL),2)) OR (ROUND(SUM(UN.MOVCRELAN),2) <> ROUND(SUM(UN.MOVCRESAL),2))    ');

        Prepare;

        ParamByName('IDPESSOA').asFloat       :=  idEmpresa;
        ParamByName('PERNUMERO').asInteger    :=  iPeriodo;
        ParamByName('PEREXERCICIO').asInteger :=  iExercicio;

        _cds.Data := Data;

        FProgresso    := 0;
        FMaxProgresso := 0;
        if not _cds.IsEmpty then begin
           MessageInfo := 'Existe inconsistência entre Saldos e Lançamentos. Faça Verificação de Lançamentos, Atualização de Analítica e Sintética do Período '+IntToStr(iPeriodo);
           Result := False;
        End;
     Finally
       Free;
     End;
end;

function TCtrlProcessaContab.TestaSaldoSintetica(IdEmpresa: Double; iExercicio,
  iPeriodo: Integer): Boolean;
var
  sqlSaldoAna : TCMSqlParams;
  cdsSaldoAna : TClientDataSet;
begin
   {Funcão implementada na Aplicação Servidora}
  { If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.TestaSaldoSintetica(IdEmpresa,iExercicio,iPeriodo);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin    }
    Result := True;
    sqlSaldoAna := TCMSqlParams.Create(nil);
    sqlSaldoAna.ControlObject := Self;
    cdsSaldoAna := TClientDataSet.Create(nil);

    With TCMSqlParams.Create(nil) Do
    Try
       ControlObject := Self;
       Try
           SQL.Clear;
           SQL.Add('SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ PLACONTA, PLANO                                    ');
           SQL.Add('               , SUM(NVL(PLSDEBITOCORRENTE,0)) AS TOTDEB  ');
           SQL.Add('               , SUM(NVL(PLSCREDITOCOR,0)) AS TOTCRE      ');
           SQL.Add('               , SUM(NVL(PLSDEBITOOFICIAL,0)) AS TOTDEBO  ');
           SQL.Add('               , SUM(NVL(PLSCREDITOOFICIAL,0)) AS TOTCREO ');
           SQL.Add('               , SUM(NVL(PLSDEBITOGER,0)) AS TOTDEBG      ');
           SQL.Add('               , SUM(NVL(PLSCREDITOGER,0)) AS TOTCREG     ');
           SQL.Add('               , SUM(NVL(PLSDEBITOGEREN1,0)) AS TOTDEBG1  ');
           SQL.Add('               , SUM(NVL(PLSCREDITOGEREN1,0)) AS TOTCREG1 ');
           SQL.Add('               , SUM(NVL(PLSDEBITOGEREN2,0)) AS TOTDEBG2  ');
           SQL.Add('               , SUM(NVL(PLSCREDITOGEREN2,0)) AS TOTCREG2 ');
           SQL.Add('               , SUM(NVL(PLSDEBITOHIST,0)) AS TOTDEBH     ');
           SQL.Add('               , SUM(NVL(PLSCREDITOHIST,0)) AS TOTCREH    ');
           SQL.Add('FROM PLANOSALDO                                           ');
           SQL.Add('WHERE (PERNUMERO    = :PERNUMERO)                         ');
           SQL.Add('  AND (PEREXERCICIO = :PEREXERCICIO)                      ');
           SQL.Add('  AND (PLSTIPO      = ''S'')                              ');
           SQL.Add('  AND (IDPESSOA     = :IDPESSOA)                          ');
           SQL.Add('GROUP BY PLACONTA, PLANO                                  ');

           Prepare;

           ParamByName('PERNUMERO').asInteger    := iPeriodo;
           ParamByName('PEREXERCICIO').asInteger := iExercicio;
           ParamByName('IDPESSOA').asFloat       := idEmpresa;

           _cds.Data := Data;

           //FProgresso    := 0;
           //FMaxProgresso := _cds.RecordCount;

           sqlSaldoAna.SQL.Clear;
           sqlSaldoAna.SQL.Add('SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ SUM(NVL(PLSDEBITOCORRENTE,0)) AS TOTDEB    ');
           sqlSaldoAna.SQL.Add('     , SUM(NVL(PLSCREDITOCOR,0)) AS TOTCRE        ');
           sqlSaldoAna.SQL.Add('     , SUM(NVL(PLSDEBITOOFICIAL,0)) AS TOTDEBO    ');
           sqlSaldoAna.SQL.Add('     , SUM(NVL(PLSCREDITOOFICIAL,0)) AS TOTCREO   ');
           sqlSaldoAna.SQL.Add('     , SUM(NVL(PLSDEBITOGER,0)) AS TOTDEBG        ');
           sqlSaldoAna.SQL.Add('     , SUM(NVL(PLSCREDITOGER,0)) AS TOTCREG       ');
           sqlSaldoAna.SQL.Add('     , SUM(NVL(PLSDEBITOGEREN1,0)) AS TOTDEBG1    ');
           sqlSaldoAna.SQL.Add('     , SUM(NVL(PLSCREDITOGEREN1,0)) AS TOTCREG1   ');
           sqlSaldoAna.SQL.Add('     , SUM(NVL(PLSDEBITOGEREN2,0)) AS TOTDEBG2    ');
           sqlSaldoAna.SQL.Add('     , SUM(NVL(PLSCREDITOGEREN2,0)) AS TOTCREG2   ');
           sqlSaldoAna.SQL.Add('     , SUM(NVL(PLSDEBITOHIST,0)) AS TOTDEBH       ');
           sqlSaldoAna.SQL.Add('     , SUM(NVL(PLSCREDITOHIST,0)) AS TOTCREH      ');
           sqlSaldoAna.SQL.Add('FROM PLANOSALDO                                   ');
           sqlSaldoAna.SQL.Add('WHERE (PERNUMERO    = :PERNUMERO)                 ');
           sqlSaldoAna.SQL.Add('  AND (PEREXERCICIO = :PEREXERCICIO)              ');
           sqlSaldoAna.SQL.Add('  AND (PLSTIPO      = ''A'')                      ');
           sqlSaldoAna.SQL.Add('  AND (RTRIM(PLACONTA) <> :PLACONTA)              ');
           sqlSaldoAna.SQL.Add('  AND (IDPESSOA = :IDPESSOA)                      ');
           sqlSaldoAna.SQL.Add('  AND (PLANO    = :PLANO)                         ');
           sqlSaldoAna.SQL.Add('  AND (RTRIM(PLACONTA) LIKE :PLACONTAREF)         ');

           sqlSaldoAna.Prepare;

           _cds.First;
           While not _cds.EOF do
           begin
              //FProgresso := FProgresso + 1;
             // MessageInfo:='*';

              sqlSaldoAna.ParamByName('PERNUMERO').asInteger    := iPeriodo;
              sqlSaldoAna.ParamByName('PEREXERCICIO').asInteger := iExercicio;
              sqlSaldoAna.ParamByName('PLACONTA').asString      := Trim(_cds.FieldByName('PLACONTA').AsString);
              sqlSaldoAna.ParamByName('PLACONTAREF').asString   := Trim(_cds.FieldByName('PLACONTA').AsString)+'%';
              sqlSaldoAna.ParamByName('PLANO').asInteger        := _cds.FieldByName('PLANO').AsInteger;
              sqlSaldoAna.ParamByName('IDPESSOA').asFloat       := idEmpresa;

              cdsSaldoAna.Data := sqlSaldoAna.Data;

              if Format('%17.2f',[cdsSaldoAna.FieldByName('TOTDEB').AsFloat]) <> Format('%17.2f',[_cds.FieldByName('TOTDEB').AsFloat]) then begin
                 MessageInfo :='A conta sintética ' + _cds.FieldByName('PLACONTA').AsString + ' não está com o saldo a débito correto na moeda corrente';
                 Result := False;
              end;
              if Format('%17.2f',[cdsSaldoAna.FieldByName('TOTCRE').AsFloat]) <> Format('%17.2f',[_cds.FieldByName('TOTCRE').AsFloat]) then begin
                 MessageInfo :='A conta sintética ' + _cds.FieldByName('PLACONTA').AsString + ' não está com o saldo a crédito correto na moeda corrente';
                 Result := False;
              end;
              //
              if Format('%17.2f',[cdsSaldoAna.FieldByName('TOTDEBO').AsFloat]) <> Format('%17.2f',[_cds.FieldByName('TOTDEBO').AsFloat]) then begin
                 MessageInfo :='A conta sintética ' + _cds.FieldByName('PLACONTA').AsString + ' não está com o saldo a débito correto na moeda oficial';
                 Result := False;
              end;
              if Format('%17.2f',[cdsSaldoAna.FieldByName('TOTCREO').AsFloat]) <> Format('%17.2f',[_cds.FieldByName('TOTCREO').AsFloat]) then begin
                 MessageInfo :='A conta sintética ' + _cds.FieldByName('PLACONTA').AsString + ' não está com o saldo a crédito correto na moeda oficial';
                 Result := False;
              end;
              //
              if Format('%17.2f',[cdsSaldoAna.FieldByName('TOTDEBG').AsFloat]) <> Format('%17.2f',[_cds.FieldByName('TOTDEBG').AsFloat]) then begin
                 MessageInfo :='A conta sintética ' + _cds.FieldByName('PLACONTA').AsString + ' não está com o saldo a débito correto na moeda gerencial 1';
                 Result := False;
              end;
              if Format('%17.2f',[cdsSaldoAna.FieldByName('TOTCREG').AsFloat]) <> Format('%17.2f',[_cds.FieldByName('TOTCREG').AsFloat]) then begin
                 MessageInfo :='A conta sintética ' + _cds.FieldByName('PLACONTA').AsString + ' não está com o saldo a crédito correto na moeda gerencial 1';
                 Result := False;
              end;
              //
              if Format('%17.2f',[cdsSaldoAna.FieldByName('TOTDEBG1').AsFloat]) <> Format('%17.2f',[_cds.FieldByName('TOTDEBG1').AsFloat]) then begin
                 MessageInfo :='A conta sintética ' + _cds.FieldByName('PLACONTA').AsString + ' não está com o saldo a débito correto na moeda gerencial 2';
                 Result := False;
              end;
              if Format('%17.2f',[cdsSaldoAna.FieldByName('TOTCREG1').AsFloat]) <> Format('%17.2f',[_cds.FieldByName('TOTCREG1').AsFloat]) then begin
                 MessageInfo :='A conta sintética ' + _cds.FieldByName('PLACONTA').AsString + ' não está com o saldo a crédito correto na moeda gerencial 2';
                 Result := False;
              end;
              //
              if Format('%17.2f',[cdsSaldoAna.FieldByName('TOTDEBG2').AsFloat]) <> Format('%17.2f',[_cds.FieldByName('TOTDEBG2').AsFloat]) then begin
                 MessageInfo :='A conta sintética ' + _cds.FieldByName('PLACONTA').AsString + ' não está com o saldo a débito correto na moeda gerencial 3';
                 Result := False;
              end;
              if Format('%17.2f',[cdsSaldoAna.FieldByName('TOTCREG2').AsFloat]) <> Format('%17.2f',[_cds.FieldByName('TOTCREG2').AsFloat]) then begin
                 MessageInfo :='A conta sintética ' + _cds.FieldByName('PLACONTA').AsString + ' não está com o saldo a crédito correto na moeda gerencial 3';
                 Result := False;
              end;
              //
              if Format('%17.2f',[cdsSaldoAna.FieldByName('TOTDEBH').AsFloat]) <> Format('%17.2f',[_cds.FieldByName('TOTDEBH').AsFloat]) then begin
                 MessageInfo :='A conta sintética ' + _cds.FieldByName('PLACONTA').AsString + ' não está com o saldo a débito correto na moeda histórica';
                 Result := False;
              end;
              if Format('%17.2f',[cdsSaldoAna.FieldByName('TOTCRE').AsFloat]) <> Format('%17.2f',[_cds.FieldByName('TOTCRE').AsFloat]) then begin
                 MessageInfo :='A conta sintética ' + _cds.FieldByName('PLACONTA').AsString + ' não está com o saldo a crédito correto na moeda corrente';
                 Result := False;
              end;
              //
              _cds.Next;
           end;
        Except
           on E:Exception do begin
              Result := False;
              MessageInfo := E.Message;
           end;
        End;
    Finally
      sqlSaldoAna.Free;
      cdsSaldoAna.Free;
      Free;
    End;
end;

function TCtrlProcessaContab.TestaSaldoContraNatureza(IdEmpresa : Double;
  iExercicio, iPeriodo: Integer): Boolean;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.TestaSaldoContraNatureza(IdEmpresa,
                iExercicio, iPeriodo);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      If Not Contab.SelecionaParametrosProc(IdEmpresa) Then
      Begin
        Result := False;
        MessageInfo := Contab.MessageInfo;
        Exit;
      End;

      if Contab.AceitaContraNat = 'N' then
      begin
        With TCMSqlParams.Create(nil) Do
          Try
             ControlObject := Self;
             SQL.Clear;
             SQL.Add('SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ C.PLACONTA,  ');
             SQL.Add('       DECODE(C.PLANATUREZA,''D'',SUM(NVL(S.PLSDEBITOCORRENTE,0)-NVL(S.PLSCREDITOCOR,0)),SUM(NVL(S.PLSCREDITOCOR,0)-NVL(S.PLSDEBITOCORRENTE,0))) AS SALDO   ');
             SQL.Add('FROM PLANOCONTA C, PLANOSALDO S                  ');
             SQL.Add('WHERE (S.IDPESSOA = '+FloatToStr(IdEmpresa)+')   ');
             SQL.Add('  AND (S.PEREXERCICIO = '+IntToStr(iExercicio)+')');
             SQL.Add('  AND (S.PERNUMERO = '+IntToStr(iPeriodo)+')     ');
             SQL.Add('  AND (C.PLACONTA = S.PLACONTA)                  ');
             SQL.Add('  AND (C.PLANO = S.PLANO)                        ');
             SQL.Add('GROUP BY C.PLACONTA, C.PLANATUREZA               ');
             SQL.Add('HAVING  DECODE(C.PLANATUREZA,''D'',SUM(NVL(S.PLSDEBITOCORRENTE,0)-NVL(S.PLSCREDITOCOR,0)),SUM(NVL(S.PLSCREDITOCOR,0)-NVL(S.PLSDEBITOCORRENTE,0))) < 0 ');

             _cds.Data := Data;

             if _cds.IsEmpty then
             begin
                Result := True;
             end else
             begin
                Result := False;
                MessageInfo :='Existem contas com saldo contra a sua natureza.';
             end;

          Finally
            Free;
          End;

      end else
      begin
        Result := True;
      end;
   End;
end;

function TCtrlProcessaContab.TestaConsistenciaLanc(IdEmpresa: Double;
  iExercicio, iPeriodo: Integer): Boolean;
var
    bOK, bMsg   : Boolean;
    AuxDec : Char;
    iMaiorLanc : LongInt;
    sDataIniPer, sDataFimPer : String;
    iPlnCodigo : Double;
    rTotDeb, rTotCre, rTotDebOF, rTotCreOF, rTotDebGE, rTotCreGE, rTotDebGE1,
    rTotCreGE1, rTotDebGE2, rTotCreGE2, rTotDebHI, rTotCreHI  : Double;
    sVLDEB, sVLDEBOF, sVLDEBGE, sVLDEBGE1, sVLDEBGE2, sVLDEBHI, sSql,
    sVLCRE, sVLCREOF, sVLCREGE, sVLCREGE1, sVLCREGE2, sVLCREHI : String;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then begin
     Result := Connection.AppServer.TestaConsistenciaLanc(IdEmpresa,iExercicio,iPeriodo);

      MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      FStrlMens :=TStringList.Create;
      AuxDec          := DecimalSeparator;
      DecimalSeparator := '.';
      Result           := True;
      _Cds.Data   := Periodo.ListPeriodo(IdEmpresa,tbpTodos,iExercicio,iPeriodo);
      sDataIniPer := _Cds.FieldByName('PERDATINI').AsString;
      sDataFimPer := _Cds.FieldByName('PERDATFIM').AsString;
      Try
         FProgresso    := 0;
         FMaxProgresso := 0;
         bOK           := True;
         bMsg          := False;
         _Cds.Data := Lancamento.SelecionaLancamentos(0,idEmpresa, iExercicio, iPeriodo, tpSoPeriodo,'','','','',
                              teAmbos,tomAmbos,tolPlnCodigo,tsSemSoma,False);
         If not _Cds.IsEmpty then
         begin
            FMaxProgresso := _Cds.RecordCount;
               { Grava do log
               Try
                  StartTransaction;
                  if not Sistema.GravaLogOperacoes('Verifica Lançamentos do Período '+IntToStr(iExercicio)+'/'+IntToStr(iPeriodo)) then Raise Exception.Create('Não Consegui Gravar o Log');
                  Commit;
                  Result := True;
               except
                  On E:Exception Do
                  Begin
                     Rollback;
                     Result := False;
                     MessageInfo := E.Message;
                  End;
               End;}
            _Cds.First;
            while not _Cds.EOF do begin
               if (_Cds.FieldByName('PLNDATDIA').AsDateTime < StrToDate(sDataIniPer)) or
                  (_Cds.FieldByName('PLNDATDIA').AsDateTime > StrToDate(sDataFimPer)) then begin
                  MessageInfo :='Planilha '+_Cds.FieldByName('PLNPLANIL').AsString+' do Dia '+_Cds.FieldByName('PLNDATDIA').AsString+
                                ' está com a data incompatível com o período '+IntToStr(iPeriodo)+'.'+
                                ' Número interno do sistema: '+_Cds.FieldByName('PLNCODIGO').AsString;
                  bMsg:=True;
                  FStrlMens.Add(MessageInfo);
                  FStrlMens.Add('');
               end;
               rTotDeb   :=0;
               rTotCre   :=0;
               rTotDebOF :=0;
               rTotCreOF :=0;
               rTotDebGE :=0;
               rTotCreGE :=0;
               rTotDebGE1:=0;
               rTotCreGE1:=0;
               rTotDebGE2:=0;
               rTotCreGE2:=0;
               rTotDebHI :=0;
               rTotCreHI :=0;
               iPlnCodigo:=_Cds.FieldByName('PLNCODIGO').AsFloat;
               iMaiorLanc:=0;
               try
                  StartTransaction;
                  While (not _Cds.EOF) and (_Cds.FieldByName('PLNCODIGO').AsFloat = iPlnCodigo) do
                  begin
                     FProgresso := FProgresso + 1;
                     MessageInfo:='*';
                     if not _Cds.FieldByName('LACNUMLAN').isNull then
                     begin
                        iMaiorLanc := _Cds.FieldByName('LACNUMLAN').AsInteger;
                        if not ContaContabil.TestaContaContabilProc(_Cds.FieldByName('PLANO').AsFloat,
                                 _Cds.FieldByName('PLACONTA').AsString, False,False) then
                        begin
                           MessageInfo := 'Conta '+_Cds.FieldByName('PLACONTA').AsString+' do lançamento '+
                                          _Cds.FieldByName('PLNPLANIL').AsString+'/'+_Cds.FieldByName('LACNUMLAN').AsString+
                                          ' do Dia '+_Cds.FieldByName('PLNDATDIA').AsString+' - '+ContaContabil.MessageInfo+
                                          ' Número interno do sistema: '+_Cds.FieldByName('PLNCODIGO').AsString;
                           bMsg:=True;
                           FStrlMens.Add(MessageInfo);
                           FStrlMens.Add('');
                        end else
                        begin
                           if (ContaContabil.ObrigaCentroCusto = 'S') and (_Cds.FieldByName('CODCENTROCUSTO').isNull) then
                           begin
                              MessageInfo := 'Conta '+_Cds.FieldByName('PLACONTA').AsString+' do lançamento '+
                                             _Cds.FieldByName('PLNPLANIL').AsString+'/'+_Cds.FieldByName('LACNUMLAN').AsString+
                                             ' do Dia '+_Cds.FieldByName('PLNDATDIA').AsString+' - Obriga Centro de Custo '+
                                             ' Número interno do sistema: '+_Cds.FieldByName('PLNCODIGO').AsString;
                              bMsg:=True;
                              FStrlMens.Add(MessageInfo);
                              FStrlMens.Add('');
                           end;
                        end;
                        if ((ContaContabil.ObrigaCentroCusto = 'N') or (ContaContabil.ObrigaCentroCusto = '')) and (not _Cds.FieldByName('CODCENTROCUSTO').isNull) then
                        begin
                            sSql := 'UPDATE LANCAMENTO SET CODCENTROCUSTO = NULL, IDEMPRESA = NULL ' +
                                    'WHERE PLNCODIGO =  ('+_Cds.FieldByName('PLNCODIGO').AsString+')' +
                                    '  AND LACNUMLAN =  ('+_Cds.FieldByName('LACNUMLAN').AsString+')' +
                                    '  AND LACDEBCRE =  ('''+_Cds.FieldByName('LACDEBCRE').AsString+''')';

                           ExecSQL(sSql);
                        end;
                        if (_Cds.FieldByName('LACDEBCRE').isNull) or
                           ((_Cds.FieldByName('LACDEBCRE').AsString <> 'D') and
                           (_Cds.FieldByName('LACDEBCRE').AsString <> 'C')) then
                        begin
                           MessageInfo := 'Lançamento '+_Cds.FieldByName('PLNPLANIL').AsString+'/'+_Cds.FieldByName('LACNUMLAN').AsString+
                                          ' do Dia '+_Cds.FieldByName('PLNDATDIA').AsString+' - Não está a débito nem a crédito.'+
                                          ' Número interno do sistema: '+_Cds.FieldByName('PLNCODIGO').AsString;
                           bMsg:=True;
                           FStrlMens.Add(MessageInfo);
                           FStrlMens.Add('');
                        end;
                        if (_Cds.FieldByName('LACDEBCRE').AsString = 'D') then
                        begin
                           rTotDeb   :=rTotDeb   +_Cds.FieldByName('LACVALOR').AsFloat;
                           rTotDebOF :=rTotDebOF +_Cds.FieldByName('LACVALOFICIAL').AsFloat;
                           rTotDebGE :=rTotDebGE +_Cds.FieldByName('LACVALGERENCIAL').AsFloat;
                           rTotDebGE1:=rTotDebGE1+_Cds.FieldByName('LACVALGEREN1').AsFloat;
                           rTotDebGE2:=rTotDebGE2+_Cds.FieldByName('LACVALGEREN2').AsFloat;
                           rTotDebHI :=rTotDebHI +_Cds.FieldByName('LACVALHIST').AsFloat;
                        end else
                        begin
                           rTotCre   :=rTotCre   +_Cds.FieldByName('LACVALOR').AsFloat;
                           rTotCreOF :=rTotCreOF +_Cds.FieldByName('LACVALOFICIAL').AsFloat;
                           rTotCreGE :=rTotCreGE +_Cds.FieldByName('LACVALGERENCIAL').AsFloat;
                           rTotCreGE1:=rTotCreGE1+_Cds.FieldByName('LACVALGEREN1').AsFloat;
                           rTotCreGE2:=rTotCreGE2+_Cds.FieldByName('LACVALGEREN2').AsFloat;
                           rTotCreHI :=rTotCreHI +_Cds.FieldByName('LACVALHIST').AsFloat;
                        end;
                     end;
                     _Cds.Next;
                  end;
                  sVLDEB   :=FloatToStr(rTotDeb);
                  sVLDEBOF :=FloatToStr(rTotDebOF);
                  sVLDEBGE :=FloatToStr(rTotDebGE);
                  sVLDEBGE1:=FloatToStr(rTotDebGE1);
                  sVLDEBGE2:=FloatToStr(rTotDebGE2);
                  sVLDEBHI :=FloatToStr(rTotDebHI);
                  sVLCRE   :=FloatToStr(rTotCre);
                  sVLCREOF :=FloatToStr(rTotCreOF);
                  sVLCREGE :=FloatToStr(rTotCreGE);
                  sVLCREGE1:=FloatToStr(rTotCreGE1);
                  sVLCREGE2:=FloatToStr(rTotCreGE2);
                  sVLCREHI :=FloatToStr(rTotCreHI);
                  //
                  sSql := 'UPDATE PLANILHA SET  ';
                  sSql:=sSql+ ' PLNNUMLAN        = '+IntToStr(iMaiorLanc);
                  sSql:=sSql+ ',PLNTOTDEB        = '+sVLDEB;
                  sSql:=sSql+ ',PLNTOTCRE        = '+sVLCRE;
                  sSql:=sSql+ ',PLNTOTDEBOFICIAL = '+sVLDEBOF;
                  sSql:=sSql+ ',PLNTOTCREOFICIAL = '+sVLCREOF;
                  sSql:=sSql+ ',PLNTOTDEBGER     = '+sVLDEBGE;
                  sSql:=sSql+ ',PLNTOTCREGER     = '+sVLCREGE;
                  sSql:=sSql+ ',PLNTOTDEBGEREN1  = '+sVLDEBGE1;
                  sSql:=sSql+ ',PLNTOTCREGEREN1  = '+sVLCREGE1;
                  sSql:=sSql+ ',PLNTOTDEBGEREN2  = '+sVLDEBGE2;
                  sSql:=sSql+ ',PLNTOTCREGEREN2  = '+sVLCREGE2;
                  sSql:=sSql+ ',PLNTOTDEBHIST    = '+sVLDEBHI;
                  sSql:=sSql+  ',PLNTOTCREHIST    = '+sVLCREHI;
                  sSql:=sSql+  ' WHERE PLNCODIGO  = '+FloatToStr(iPlnCodigo);
                  result := ExecSQL(sSql);
                  if not result then
                     Abort;
                  Commit;
               except
                  On E:Exception Do
                  Begin
                     Rollback;
                     Result := False;
                     MessageInfo := 'Número interno do sistema: '+FloatToStr(iPlnCodigo)+' '+E.Message;
                     bOK:=False;
                     FStrlMens.Add(MessageInfo);
                     FStrlMens.Add('');
                     While (not _Cds.EOF) and (_Cds.FieldByName('PLNCODIGO').AsInteger = iPlnCodigo) do begin
                        FProgresso := FProgresso + 1;
                        MessageInfo:='*';
                        _Cds.Next;
                     end;
                  End;
               end;
            end;
            if (bOK) and (not bMsg)then begin
               MessageInfo :='Verificação efetuada com sucesso sem mensagens de inconsistência';
            end else if (bOK) and (bMsg)then begin
               MessageInfo :='Verificação efetuada com sucesso com mensagens de inconsistência';
            end else if (not bOK) and (bMsg)then begin
               MessageInfo :='Verificação efetuada parcialmente com mensagens de inconsistência';
            end else if (not bOK) and (not bMsg)then begin
               MessageInfo :='Verificação efetuada parcialmente sem mensagens de inconsistência';
            end;
         end else begin
            MessageInfo   := 'Não existe nenhum lançamento a ser verificado no período';
            Result := False;
         end;
      Except
         on E:Exception do begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
      DecimalSeparator := AuxDec;
      FStrlMens.free;
   end;
end;

function TCtrlProcessaContab.ArredondaValores: Boolean;
var
  sSql :string;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.ArredondaValores;
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      FProgresso    := 0;
      FMaxProgresso := 0;
      try
         StartTransaction;
         //if not Sistema.GravaLogOperacoes('Verifica Lançamentos - Arredondamento') then Raise Exception.Create('Não Consegui Gravar o Log');

         sSql := 'UPDATE LANCAMENTO SET ' +
                 ' LACVALOR = ROUND(LACVALOR,2)' +
                 ',LACVALOFICIAL = ROUND(LACVALOFICIAL,2) '+
                 ',LACVALGERENCIAL = ROUND(LACVALGERENCIAL,2) ' +
                 ',LACVALGEREN1 = ROUND(LACVALGEREN1,2) ' +
                 ',LACVALGEREN2 = ROUND(LACVALGEREN2,2) ' +
                 ',LACVALHIST = ROUND(LACVALHIST,2) ';

         Result := ExecSQL(sSql);
         Commit;

      except
         On E:Exception Do
         Begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         End;
      end;
   end;
end;

function TCtrlProcessaContab.AcertaTipoSaldopeloTipoConta(IdEmpresa: Double;
   iExercicio, iPeriodo: Integer): Boolean;
var
  sSql :string;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AcertaTipoSaldopeloTipoConta(IdEmpresa,
                iExercicio, iPeriodo);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      Result := true;
      FProgresso    := 0;
      FMaxProgresso := 0;

      With TCMSqlParams.Create(nil) Do
        Try
            ControlObject := Self;
            Try
               SQL.Clear;
               SQL.Add('SELECT  /*+ index (PLANOSALDO XIE1PLANOSALDO) */ S.IDPLANOSALDO, ');
               SQL.Add('                   S.PLSTIPO, P.PLATIPO, S.PLACONTA ');
               SQL.Add('FROM PLANOSALDO S, PLANOCONTA P              ');
               SQL.Add('WHERE (P.PLATIPO      <> S.PLSTIPO)          ');
               SQL.Add('  AND (P.PLANO        = S.PLANO)             ');
               SQL.Add('  AND (P.PLACONTA     = S.PLACONTA)          ');
               SQL.Add('  AND (S.PERNUMERO    = :PERNUMERO)          ');
               SQL.Add('  AND (S.PEREXERCICIO = :PEREXERCICIO)       ');
               SQL.Add('  AND (S.IDPESSOA     = :IDPESSOA)           ');

               Prepare;

               ParamByName('PERNUMERO').asInteger    := iPeriodo;
               ParamByName('PEREXERCICIO').asInteger := iExercicio;
               ParamByName('IDPESSOA').asFloat       := idEmpresa;

               _cds.Data := Data;

               if not _cds.IsEmpty then
               begin
                  try
                     StartTransaction;

                     //if not Sistema.GravaLogOperacoes('Verifica Lançamentos - Tipo de Conta') then Raise Exception.Create('Não Consegui Gravar o Log');

                     FMaxProgresso := _cds.RecordCount;
                     _cds.First;
                     while not _cds.EOF do
                     begin
                        FProgresso := FProgresso + 1;
                        MessageInfo:='Acertado o Tipo da Conta '+_cds.FieldByName('PLACONTA').AsString;

                        sSql := 'UPDATE PLANOSALDO SET PLSTIPO = '''+_cds.FieldByName('PLATIPO').AsString+''' ' +
                                'WHERE (IDPLANOSALDO = '+_cds.FieldByName('IDPLANOSALDO').AsString + ')';

                        ExecSQL(sSql);
                        _cds.Next;
                     end;
                     Commit;
                  except
                     On E:Exception Do
                     Begin
                        Rollback;
                        Result := False;
                        MessageInfo := E.Message;
                     End;
                  end;
               end;
            Except
                on E:Exception do begin
                  Result := False;
                  MessageInfo := E.Message;
               end;
            end;
        Finally
          Free;
       end;
   end;
end;


function TCtrlProcessaContab.DeletaSaldoContas(IdEmpresa: Double; iExercicio,
  iPeriodo: Integer; bDeletaEstatistica, bDeletaOrcado: Boolean;
  TipoConta: TTipoConta; TipoPeriodo : TTipoPeriodo): Boolean;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.DeletaSaldoContas(IdEmpresa, iExercicio,
                iPeriodo, bDeletaEstatistica, bDeletaOrcado, Integer(TipoConta), Integer(TipoPeriodo));
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      If Not Contab.SelecionaParametrosProc(IdEmpresa) Then
      Begin
        Result := False;
        MessageInfo := Contab.MessageInfo;
        Exit;
      End;

      Result := True;
      if not Periodo.TestaPeriodoExiste(IdEmpresa, iPeriodo, iExercicio) then begin
         Result := False;
      end else
      begin
         if not Contab.SelecionaPlanoDataProc(IdEmpresa, DateToStr(Periodo.DataIniPeriodo)) then begin
            Result := False;
         end else
         begin
           With TCMSqlParams.Create(nil) Do
             Try
                Try
                    ControlObject := Self;
                    SQL.Clear;
                    SQL.Add('DELETE PLANOSALDO                             ');
                    SQL.Add('WHERE (IDPESSOA     = :IDPESSOA)              ');
                    SQL.Add('  AND (PEREXERCICIO = :PEREXERCICIO)          ');
                    Case TipoPeriodo of
                         tpSoPeriodo : SQL.Add('  AND (PERNUMERO   = :PERNUMERO)   ');
                         tpMenorIgual: SQL.Add('  AND ((PERNUMERO <= :PERNUMERO) OR (PERNUMERO IS NULL)) ');
                         tpSoAnterior: SQL.Add('  AND (PERNUMERO IS NULL)  ');
                    end;
                    Case TipoConta of
                       tcSoSintetica : SQL.Add('  AND (PLSTIPO = ''S'')  ');
                       tcSoAnalitica : SQL.Add('  AND (PLSTIPO = ''A'')  ');
                    end;
                    //
                    if not bDeletaOrcado then begin
                       SQL.Add('  AND ((PLSORCADODEBITO IS NULL) OR (PLSORCADODEBITO = 0))   ');
                       SQL.Add('  AND ((PLSORCADOCREDITO IS NULL) OR (PLSORCADOCREDITO = 0)) ');
                    end;
                    if not bDeletaEstatistica then begin
                       SQL.Add('  AND (PLACONTA NOT IN (SELECT PLACONTA FROM PLANOCONTA WHERE PLANO = :DPLANO ) ');
                       SQL.Add('  AND (PLAGRUPO = ''E'') AND ((FLGESTATCOMLANC = ''N'') OR (FLGESTATCOMLANC IS NULL))))');
                    end;

                    Prepare;

                    ParamByName('IDPESSOA').asFloat       := idEmpresa;
                    ParamByName('PLANO').asFloat          := Contab.PlanoData;
                    ParamByName('PERNUMERO').asInteger    := iPeriodo;
                    ParamByName('PEREXERCICIO').asInteger := iExercicio;


                    If not ExecSQL(SQLChanged,False) Then
                       Raise Exception.Create(MessageInfo);

                Except
                   On E:Exception Do
                   Begin
                      Result := False;
                      MessageInfo := E.Message;
                   End;
                end;
            Finally
               Free;
            End;
         end;
      end;
   end;
end;

function TCtrlProcessaContab.ZeraSaldoContas(IdEmpresa: Double; iExercicio,
  iPeriodo: Integer; bZeraEstatistica, bZeraOrcado: Boolean;
  TipoConta: TTipoConta; TipoPeriodo : TTipoPeriodo): Boolean;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ZeraSaldoContas(IdEmpresa, iExercicio,
                iPeriodo, bZeraEstatistica, bZeraOrcado, Integer(TipoConta), Integer(TipoPeriodo));
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      If Not Contab.SelecionaParametrosProc(IdEmpresa) Then
      Begin
        Result := False;
        MessageInfo := Contab.MessageInfo;
        Exit;
      End;

      Result := True;
      if not Periodo.TestaPeriodoExiste(IdEmpresa, iPeriodo, iExercicio) then
      begin
         Result := False;
      end else
      begin
         if not Contab.SelecionaPlanoDataProc(IdEmpresa, DateToStr(Periodo.DataIniPeriodo)) then begin
            Result := False;
         end else
         begin
            With TCMSqlParams.Create(nil) Do
              Try
                 Try
                    ControlObject := Self;
                    SQL.Clear;
                    SQL.Add('UPDATE PLANOSALDO SET        ');
                    SQL.Add('       PLSDEBITOCORRENTE = 0 ');
                    SQL.Add('      ,PLSCREDITOCOR     = 0 ');
                    SQL.Add('      ,PLSDEBITOOFICIAL  = 0 ');
                    SQL.Add('      ,PLSCREDITOOFICIAL = 0 ');
                    SQL.Add('      ,PLSDEBITOGER      = 0 ');
                    SQL.Add('      ,PLSCREDITOGER     = 0 ');
                    SQL.Add('      ,PLSDEBITOGEREN1   = 0 ');
                    SQL.Add('      ,PLSCREDITOGEREN1  = 0 ');
                    SQL.Add('      ,PLSDEBITOGEREN2   = 0 ');
                    SQL.Add('      ,PLSCREDITOGEREN2  = 0 ');
                    SQL.Add('      ,PLSDEBITOHIST     = 0 ');
                    SQL.Add('      ,PLSCREDITOHIST    = 0 ');
                    if bZeraOrcado then
                    begin
                       SQL.Add('   ,PLSORCADODEBITO  = 0  ');
                       SQL.Add('   ,PLSORCADOCREDITO = 0  ');
                    end;
                    SQL.Add('WHERE (IDPESSOA     = :IDPESSOA)  ');
                    SQL.Add('  AND (PEREXERCICIO = :PEREXERCICIO) ');
                    Case TipoPeriodo of
                         tpSoPeriodo : SQL.Add('  AND (PERNUMERO  =  :PERNUMERO) ');
                         tpMenorIgual: SQL.Add('  AND ((PERNUMERO <= :PERNUMERO) OR (PERNUMERO IS NULL)) ');
                         tpSoAnterior: SQL.Add('  AND (PERNUMERO IS NULL) ');
                    end;
                    Case TipoConta of
                       tcSoSintetica : SQL.Add('  AND (PLSTIPO = ''S'') ');
                       tcSoAnalitica : SQL.Add('  AND (PLSTIPO = ''A'') ');
                    end;
                    if not bZeraEstatistica then begin
                       SQL.Add('  AND (PLACONTA NOT IN (SELECT PLACONTA FROM PLANOCONTA WHERE PLANO = ' + FloatToStr(Contab.PlanoData));
                       SQL.Add('  AND (PLAGRUPO = ''E'') AND ((FLGESTATCOMLANC = ''N'') OR (FLGESTATCOMLANC IS NULL))))');
                    end;

                    Prepare;

                    ParamByName('IDPESSOA').asFloat       := idEmpresa;
                    ParamByName('PERNUMERO').asInteger    := iPeriodo;
                    ParamByName('PEREXERCICIO').asInteger := iExercicio;

                    If not ExecSQL(SQLChanged,False) Then
                       Raise Exception.Create(MessageInfo);

                 Except
                    On E:Exception Do
                    Begin
                       Result := False;
                       MessageInfo := E.Message;
                    End;
                 End;
              Finally
                 Free;
              End;
         End;
      End;
   End;
end;

function TCtrlProcessaContab.ProcessaSaldoAnalitica(IdEmpresa, iUsuario: Double;
  iExercicio, iPeriodo: Integer; bUsaPlanoPatro : Boolean): Boolean;
var sMens : String;
    CdsLancamento : TClientDataSet;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.ProcessaSaldoAnalitica(IdEmpresa, iUsuario, iExercicio,
                          iPeriodo, bUsaPlanoPatro);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      Result := true;
      CdsLancamento := TClientDataSet.Create(nil);
      FProgresso    := 0;
      FMaxProgresso := 0;
      sMens         := '';
      Try
         StartTransaction;
         //if not Sistema.GravaLogOperacoes('Atualização de Analítica - '+IntToStr(iExercicio)+'/'+IntToStr(iPeriodo)) then Raise Exception.Create('Não Consegui Gravar o Log');
         MessageInfo := 'Zerando o saldo das contas';
         if not ZeraSaldoContas(IdEmpresa,iExercicio,iPeriodo,False,False,tcAmbas,tpSoPeriodo) then begin
            sMens := MessageInfo;
            Abort;
         end;
         CdsLancamento.Data := Lancamento.SelecionaLancamentos(0,idEmpresa, iExercicio, iPeriodo, tpSoPeriodo,'','','','',
                                         teEfetivado,tomAmbos,tolPlnCodigo,tsPeriodo, False);
         if not CdsLancamento.IsEmpty then
         begin
            MessageInfo := 'Atualizando o saldo das contas pelos lançamentos';
            FMaxProgresso := CdsLancamento.RecordCount;
            CdsLancamento.First;
            while not CdsLancamento.Eof do begin
               FProgresso := FProgresso + 1;
               MessageInfo:='*';
               if not Lancamento.AtuSaldoContas(IdEmpresa, CdsLancamento.FieldByName('UNIDNEGOC').AsFloat,
                                     iUsuario, CdsLancamento.FieldByName('IDPLANOPREV').AsFloat,
                                     CdsLancamento.FieldByName('IDPATRO').AsFloat,
                                     CdsLancamento.FieldByName('PLANO').AsFloat, iExercicio,iPeriodo,
                                     CdsLancamento.FieldByName('CODSUBCONTA').AsInteger,
                                     CdsLancamento.FieldByName('CODCENTROCUSTO').AsString,
                                     CdsLancamento.FieldByName('PLACONTA').AsString,
                                     CdsLancamento.FieldByName('LACDEBCRE').AsString,'A',
                                     CdsLancamento.FieldByName('LACVALOR').AsFloat,0,
                                     CdsLancamento.FieldByName('LACVALOFICIAL').AsFloat,
                                     CdsLancamento.FieldByName('LACVALGERENCIAL').AsFloat,
                                     CdsLancamento.FieldByName('LACVALGEREN1').AsFloat,
                                     CdsLancamento.FieldByName('LACVALGEREN2').AsFloat,
                                     CdsLancamento.FieldByName('LACVALHIST').AsFloat,
                                     bUsaPlanoPatro) then begin
                  sMens := Lancamento.MessageInfo;
                  Abort;
               end;
               CdsLancamento.Next;
            end;
         end else begin
            sMens := 'Não existe lançamentos para este período';
            Abort;
         end;
         Commit;
         CdsLancamento.Free;
      except
         On E:Exception Do
         Begin
            CdsLancamento.Free;
            Rollback;
            Result := False;
            MessageInfo := sMens + ' ' + E.Message;
         End;
      End;
   end;
end;


function TCtrlProcessaContab.ProcessaSaldoSintetica(IdEmpresa,
  iUsuario: Double; iExercicio, iPeriodo: Integer;
  bUsaPlanoPatro : Boolean; TipoPeriodo : TTipoPeriodo): Boolean;
var
    sqlProcessaSaldo : TCMSqlParams;
    cdsProcessaSaldo : TClientDataSet;
    sMens, sConta,sNumero : String;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.ProcessaSaldoSintetica(IdEmpresa, iUsuario, iExercicio,
                             iPeriodo, bUsaPlanoPatro, Integer(TipoPeriodo));
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      If Not Contab.SelecionaParametrosProc(IdEmpresa) Then
      Begin
        Result := False;
        MessageInfo := Contab.MessageInfo;
        Exit;
      End;

      Result := true;
      FProgresso    := 0;
      FMaxProgresso := 0;
      sMens         := '';
      MessageInfo   := '*';
      sqlProcessaSaldo := TCMSqlParams.Create(nil);
      sqlProcessaSaldo.ControlObject := Self;
      cdsProcessaSaldo := TClientDataSet.Create(nil);

      Try
         Try
            StartTransaction;
            //if not Sistema.GravaLogOperacoes('Atualização de Sintética - '+IntToStr(iExercicio)+'/'+IntToStr(iPeriodo)) then Raise Exception.Create('Não Consegui Gravar o Log');
            MessageInfo := 'Zerando o saldo das contas';
            if not ZeraSaldoContas(IdEmpresa,iExercicio,iPeriodo,true,true,tcSoSintetica,TipoPeriodo) then begin
               sMens := MessageInfo;
               Abort;
            end;
            if not ContaContabil.BuscaMascaraConta(Contab.PlanoData) then begin
               sMens := ContaContabil.MessageInfo;
               Abort;
            end;
            _Cds.Data := ContaContabil.SelecionaContas(Contab.PlanoData, tcSoSinteticaC, true);
            MessageInfo := 'Atualizando o saldo das contas sintéticas';
            _Cds.First;
            While not _Cds.Eof do begin
               sNumero:= IntToStr(Length(trim(_Cds.FieldByName('PLACONTA').AsString)));
               sConta :=trim(_Cds.FieldByName('PLACONTA').AsString);
               FContaMostra := sConta;
               MessageInfo := '*';
               //
               With  sqlProcessaSaldo do
               Begin
                 SQL.Clear;
                 SQL.Clear;
                 SQL.Add('SELECT  /*+ index (PLANOSALDO XIE1PLANOSALDO) */           ');
                 SQL.Add('   PERNUMERO,PEREXERCICIO,PLANO,                           ');
                 SQL.Add('   SUBSTR(PLACONTA, 1, '+sNumero+') AS CONTA,              ');
                 SQL.Add('   CODSUBCONTA,IDEMPRESA,UNIDNEGOC,CODCENTROCUSTO,         ');
                 SQL.Add('   IDPLANOPREV, IDPATRO,                                   ');
                 SQL.Add('   SUM(NVL(PLSDEBITOCORRENTE,0)) AS PLSDEBITOCORRENTE,     ');
                 SQL.Add('   SUM(NVL(PLSCREDITOCOR,0)) AS PLSCREDITOCOR,             ');
                 SQL.Add('   SUM(NVL(PLSDEBITOOFICIAL,0)) AS PLSDEBITOOFICIAL,       ');
                 SQL.Add('   SUM(NVL(PLSCREDITOOFICIAL,0)) AS PLSCREDITOOFICIAL,     ');
                 SQL.Add('   SUM(NVL(PLSDEBITOGER,0)) AS PLSDEBITOGER,               ');
                 SQL.Add('   SUM(NVL(PLSCREDITOGER,0)) AS PLSCREDITOGER,             ');
                 SQL.Add('   SUM(NVL(PLSDEBITOGEREN1,0)) AS PLSDEBITOGEREN1,         ');
                 SQL.Add('   SUM(NVL(PLSCREDITOGEREN1,0)) AS PLSCREDITOGEREN1,       ');
                 SQL.Add('   SUM(NVL(PLSDEBITOGEREN2,0)) AS PLSDEBITOGEREN2,         ');
                 SQL.Add('   SUM(NVL(PLSCREDITOGEREN2,0)) AS PLSCREDITOGEREN2,       ');
                 SQL.Add('   SUM(NVL(PLSORCADODEBITO,0)) AS PLSORCADODEBITO,         ');
                 SQL.Add('   SUM(NVL(PLSORCADOCREDITO,0)) AS PLSORCADOCREDITO,       ');
                 SQL.Add('   SUM(NVL(PLSDEBITOHIST,0)) AS PLSDEBITOHIST,             ');
                 SQL.Add('   SUM(NVL(PLSCREDITOHIST,0)) AS PLSCREDITOHIST            ');
                 SQL.Add('FROM                                                       ');
                 SQL.Add('   PLANOSALDO                                              ');
                 SQL.Add('WHERE (IDPESSOA = '+FloatToStr(IdEmpresa)+')               ');
                 SQL.Add('  AND (PEREXERCICIO = '+IntToStr(iExercicio)+')            ');
                 Case TipoPeriodo of
                     tpSoPeriodo : SQL.Add('  AND (PERNUMERO = '+IntToStr(iPeriodo)+')                           ');
                     tpMenorIgual: SQL.Add('  AND ((PERNUMERO <= '+IntToStr(iPeriodo)+') OR (PERNUMERO IS NULL)) ');
                     tpSoAnterior: SQL.Add('  AND (PERNUMERO IS NULL)                                            ');
                 End;
                 SQL.Add('  AND (PLSTIPO  = ''A'')                                     ');
                 SQL.Add('  AND (SUBSTR(PLACONTA, 1, '+sNumero+') <> RTRIM(PLACONTA))  ');
                 SQL.Add('  AND (SUBSTR(PLACONTA,1,' + sNumero +') = '''+sConta+''')   ');
                 SQL.Add('GROUP BY PERNUMERO,PEREXERCICIO,PLANO,                    ');
                 SQL.Add('        SUBSTR(PLACONTA, 1, '+sNumero+'),                 ');
                 SQL.Add('        CODSUBCONTA,IDEMPRESA,UNIDNEGOC,CODCENTROCUSTO,   ');
                 SQL.Add('        IDPLANOPREV, IDPATRO                              ');

                 cdsProcessaSaldo.Data := Data;
               end;
               cdsProcessaSaldo.First;
               while not cdsProcessaSaldo.Eof do begin
                  //Débito
                  if not Lancamento.AtuSaldoContas(IdEmpresa, cdsProcessaSaldo.FieldByName('UNIDNEGOC').AsFloat,
                                        iUsuario, cdsProcessaSaldo.FieldByName('IDPLANOPREV').AsFloat,
                                        cdsProcessaSaldo.FieldByName('IDPATRO').AsFloat,
                                        cdsProcessaSaldo.FieldByName('PLANO').AsFloat,
                                        cdsProcessaSaldo.FieldByName('PEREXERCICIO').AsInteger,
                                        cdsProcessaSaldo.FieldByName('PERNUMERO').AsInteger,
                                        cdsProcessaSaldo.FieldByName('CODSUBCONTA').AsInteger,
                                        cdsProcessaSaldo.FieldByName('CODCENTROCUSTO').AsString,
                                        cdsProcessaSaldo.FieldByName('CONTA').AsString, 'D','S',
                                        cdsProcessaSaldo.FieldByName('PLSDEBITOCORRENTE').AsFloat,
                                        cdsProcessaSaldo.FieldByName('PLSORCADODEBITO').AsFloat,
                                        cdsProcessaSaldo.FieldByName('PLSDEBITOOFICIAL').AsFloat,
                                        cdsProcessaSaldo.FieldByName('PLSDEBITOGER').AsFloat,
                                        cdsProcessaSaldo.FieldByName('PLSDEBITOGEREN1').AsFloat,
                                        cdsProcessaSaldo.FieldByName('PLSDEBITOGEREN2').AsFloat,
                                        cdsProcessaSaldo.FieldByName('PLSDEBITOHIST').AsFloat,
                                        bUsaPlanoPatro) then begin
                     sMens := Lancamento.MessageInfo;
                     Abort;
                  end;
                  //Crédito
                  if not Lancamento.AtuSaldoContas(IdEmpresa, cdsProcessaSaldo.FieldByName('UNIDNEGOC').AsFloat,
                                        iUsuario, cdsProcessaSaldo.FieldByName('IDPLANOPREV').AsFloat,
                                        cdsProcessaSaldo.FieldByName('IDPATRO').AsFloat,
                                        cdsProcessaSaldo.FieldByName('PLANO').AsFloat,
                                        cdsProcessaSaldo.FieldByName('PEREXERCICIO').AsInteger,
                                        cdsProcessaSaldo.FieldByName('PERNUMERO').AsInteger,
                                        cdsProcessaSaldo.FieldByName('CODSUBCONTA').AsInteger,
                                        cdsProcessaSaldo.FieldByName('CODCENTROCUSTO').AsString,
                                        cdsProcessaSaldo.FieldByName('CONTA').AsString, 'C', 'S',
                                        cdsProcessaSaldo.FieldByName('PLSCREDITOCOR').AsFloat,
                                        cdsProcessaSaldo.FieldByName('PLSORCADOCREDITO').AsFloat,
                                        cdsProcessaSaldo.FieldByName('PLSCREDITOOFICIAL').AsFloat,
                                        cdsProcessaSaldo.FieldByName('PLSCREDITOGER').AsFloat,
                                        cdsProcessaSaldo.FieldByName('PLSCREDITOGEREN1').AsFloat,
                                        cdsProcessaSaldo.FieldByName('PLSCREDITOGEREN2').AsFloat,
                                        cdsProcessaSaldo.FieldByName('PLSCREDITOHIST').AsFloat,
                                        bUsaPlanoPatro) then begin
                     sMens := Lancamento.MessageInfo;
                     Abort;
                  end;
                  cdsProcessaSaldo.Next;
               end;
               _Cds.Next;
            end;
            _Cds.Data := Periodo.ListPeriodo(idEmpresa,tbpTodos,iExercicio,0);
            _Cds.First;
            while not _Cds.Eof do begin
               if not Periodo.EncerraPeriodo(idEmpresa, _Cds.FieldByName('PEREXERCICIO').AsInteger,
                       _Cds.FieldByName('PERNUMERO').AsInteger,tbgAtualiza) then begin
                  sMens := Periodo.MessageInfo;
                  Abort;
               end;
               _Cds.Next;
            end;
            Commit;
         except
            On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := sMens + ' ' + E.Message;
            End;
         End;
      Except
         on E:Exception do begin
            Result := False;
            MessageInfo := sMens + ' ' + E.Message;
         end;
      end;
      sqlProcessaSaldo.free;
      cdsProcessaSaldo.free;
   end;
end;

function TCtrlProcessaContab.TestaDebCreSaldo(IdEmpresa: Double; iExercicio,
  iPeriodo: Integer; TipoPeriodo : TTipoPeriodo): Boolean;
var sMensBase : String;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.TestaDebCreSaldo(IdEmpresa,iExercicio,iPeriodo, Integer(TipoPeriodo));
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin
      Result := True;
      With TCMSqlParams.Create(nil) Do
       Try
          ControlObject := Self;
          SQL.Clear;
          SQL.Add('SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ PEREXERCICIO, PERNUMERO,                    ');
          SQL.Add('       (ROUND(SUM(NVL(PLSDEBITOCORRENTE,0)-NVL(PLSCREDITOCOR,0)),2)) AS MOEDACORRENTE,      ');
          SQL.Add('       (ROUND(SUM(NVL(PLSDEBITOOFICIAL,0)-NVL(PLSCREDITOOFICIAL,0)),2)) AS MOEDAOFICIAL,    ');
          SQL.Add('       (ROUND(SUM(NVL(PLSDEBITOGER,0)-NVL(PLSCREDITOGER,0)),2)) AS MOEDAGER1,               ');
          SQL.Add('       (ROUND(SUM(NVL(PLSDEBITOGEREN1,0)-NVL(PLSCREDITOGEREN1,0)),2)) AS MOEDAGER2,         ');
          SQL.Add('       (ROUND(SUM(NVL(PLSDEBITOGEREN2,0)-NVL(PLSCREDITOGEREN2,0)),2)) AS MOEDAGER3          ');
          SQL.Add('FROM PLANOSALDO     ');
          SQL.Add('WHERE (PEREXERCICIO = ' + IntToStr(iExercicio) + ')  ');
          SQL.Add('  AND (IDPESSOA = '+FloatToStr(IdEmpresa)+')         ');
          SQL.Add('  AND (PLSTIPO  = ''A'')                             ');
          If iPeriodo > 0 Then
          Begin
            Case TipoPeriodo of
                tpSoPeriodo : SQL.Add('  AND (PERNUMERO = '+IntToStr(iPeriodo)+')                           ');
                tpMenorIgual: SQL.Add('  AND ((PERNUMERO <= '+IntToStr(iPeriodo)+') OR (PERNUMERO IS NULL)) ');
                tpSoAnterior: SQL.Add('  AND (PERNUMERO IS NULL)                                            ');
            End;
          End;
          SQL.Add('GROUP BY  PEREXERCICIO, PERNUMERO                     ');
          SQL.Add('HAVING ((ROUND(SUM(NVL(PLSDEBITOCORRENTE,0)-NVL(PLSCREDITOCOR,0)),2) <> 0)      ');
          SQL.Add('    OR (ROUND(SUM(NVL(PLSDEBITOOFICIAL,0)-NVL(PLSCREDITOOFICIAL,0)),2) <> 0)    ');
          SQL.Add('    OR (ROUND(SUM(NVL(PLSDEBITOGER,0)-NVL(PLSCREDITOGER,0)),2) <> 0)            ');
          SQL.Add('    OR (ROUND(SUM(NVL(PLSDEBITOGEREN1,0)-NVL(PLSCREDITOGEREN1,0)),2) <> 0)      ');
          SQL.Add('    OR (ROUND(SUM(NVL(PLSDEBITOGEREN2,0)-NVL(PLSCREDITOGEREN2,0)),2) <> 0))     ');

          _cds.Data := Data;

          FProgresso    := 0;
          FMaxProgresso := _cds.RecordCount;
          _cds.First;

          while not _cds.EOF do
          begin
             FProgresso  := FProgresso + 1;
             sMensBase := 'Os totais devedores e credores do Periodo ' + inttostr(_cds.FieldByName('PERNUMERO').AsInteger) + '/' + _cds.FieldByName('PEREXERCICIO').AsString + ' não estão batendo';
             if _cds.FieldByName('MOEDACORRENTE').AsFloat <> 0 then
                MessageInfo := sMensBase + ' - na Moeda Corrente. Diferença: '+FloatToStr(_cds.FieldByName('MOEDACORRENTE').AsFloat);
             if _cds.FieldByName('MOEDAOFICIAL').AsFloat <> 0 then
                MessageInfo := sMensBase + ' - na Moeda Oficial. Diferença: '+FloatToStr(_cds.FieldByName('MOEDAOFICIAL').AsFloat);
             if _cds.FieldByName('MOEDAGER1').AsFloat <> 0 then
                MessageInfo := sMensBase + ' - na Moeda Gerencial 1. Diferença: '+FloatToStr(_cds.FieldByName('MOEDAGER1').AsFloat);
             if _cds.FieldByName('MOEDAGER2').AsFloat <> 0 then
                MessageInfo := sMensBase + ' - na Moeda Gerencial 2. Diferença: '+FloatToStr(_cds.FieldByName('MOEDAGER2').AsFloat);
             if _cds.FieldByName('MOEDAGER3').AsFloat <> 0 then
                MessageInfo := sMensBase + ' - na Moeda Gerencial 3. Diferença: '+FloatToStr(_cds.FieldByName('MOEDAGER3').AsFloat);
             Result      := False;
             _cds.Next;
          end;

       Finally
          Free;
       End;
    End;
end;


function TCtrlProcessaContab.ProcessaIntegraData(IdEmpresa, iUsuario: Double; iExercicio, iPeriodo: Integer;
                          bUsaPlanoPatro, bBloqueia : Boolean; sData, sModulos : String): Boolean;
var
    sSql : String;
    sMens :string;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ProcessaIntegraData(IdEmpresa, iUsuario, iExercicio, iPeriodo,
                                                        bUsaPlanoPatro, bBloqueia, sData, sModulos);
      If Not Result Then begin
          MessageInfo := Connection.AppServer.MessageInfo;
      end;
   end else
   begin
      If Not Contab.SelecionaParametrosProc(IdEmpresa) Then
      Begin
        Result := False;
        MessageInfo := Contab.MessageInfo;
        Exit;
      End;
      sMens := '';
      Result := true;
      FProgresso    := 0;
      FMaxProgresso := 0;
      Try
         Try
            StartTransaction;
            if not Contab.SelecionaPlanoDataProc(idEmpresa,sData) then begin
               sMens := Contab.MessageInfo;
               Abort;
            end;
            //if not Sistema.GravaLogOperacoes('Integração por Data até a Data '+sData) then Raise Exception.Create('Não Consegui Gravar o Log');
            _Cds.Data :=Lancamento.SelecionaLancamentos(0,idEmpresa, iExercicio, iPeriodo, tpSoPeriodo,'',sData,sModulos,'',
                                            teNaoEfetivado,tomAmbos,tolPlnCodigo,tsSemSoma,False);
            if not _Cds.isEmpty then
            begin
               MessageInfo := 'Integrando os Lançamentos';
               FMaxProgresso := _Cds.RecordCount;
               _Cds.First;
               while not _Cds.Eof do begin
                  FProgresso  := FProgresso + 1;
                  FContaMostra:=_Cds.FieldByName('PLACONTA').AsString;
                  MessageInfo:='*';
                  if not Lancamento.AtuSaldoContas(IdEmpresa, _Cds.FieldByName('UNIDNEGOC').AsFloat,
                                        iUsuario, _Cds.FieldByName('IDPLANOPREV').AsFloat,
                                        _Cds.FieldByName('IDPATRO').AsFloat,
                                        _Cds.FieldByName('PLANO').AsFloat, iExercicio,iPeriodo,
                                        _Cds.FieldByName('CODSUBCONTA').AsInteger,
                                        _Cds.FieldByName('CODCENTROCUSTO').AsString,
                                        _Cds.FieldByName('PLACONTA').AsString,
                                        _Cds.FieldByName('LACDEBCRE').AsString,'A',
                                        _Cds.FieldByName('LACVALOR').AsFloat,0,
                                        _Cds.FieldByName('LACVALOFICIAL').AsFloat,
                                        _Cds.FieldByName('LACVALGERENCIAL').AsFloat,
                                        _Cds.FieldByName('LACVALGEREN1').AsFloat,
                                        _Cds.FieldByName('LACVALGEREN2').AsFloat,
                                        _Cds.FieldByName('LACVALHIST').AsFloat,
                                        bUsaPlanoPatro) then begin
                     sMens := Lancamento.MessageInfo;
                     Abort;
                  end;
                  if not Lancamento.AtuSaldoSintetica(IdEmpresa, _Cds.FieldByName('UNIDNEGOC').AsFloat,
                                        iUsuario, _Cds.FieldByName('IDPLANOPREV').AsFloat,
                                        _Cds.FieldByName('IDPATRO').AsFloat,
                                        _Cds.FieldByName('PLANO').AsFloat, iExercicio,iPeriodo,
                                        _Cds.FieldByName('CODSUBCONTA').AsInteger,
                                        _Cds.FieldByName('CODCENTROCUSTO').AsString,
                                        _Cds.FieldByName('PLACONTA').AsString,
                                        _Cds.FieldByName('LACDEBCRE').AsString,
                                        Contab.MascaraContaData,
                                        _Cds.FieldByName('LACVALOR').AsFloat,0,
                                        _Cds.FieldByName('LACVALOFICIAL').AsFloat,
                                        _Cds.FieldByName('LACVALGERENCIAL').AsFloat,
                                        _Cds.FieldByName('LACVALGEREN1').AsFloat,
                                        _Cds.FieldByName('LACVALGEREN2').AsFloat,
                                        _Cds.FieldByName('LACVALHIST').AsFloat,
                                        bUsaPlanoPatro) then begin
                     sMens := Lancamento.MessageInfo;
                     Abort;
                  end;
                  sSql := 'UPDATE PLANILHA SET PLNEFETIVADO = ''S'' WHERE PLNCODIGO = '+_Cds.FieldByName('PLNCODIGO').AsString;
                  ExecSQL(sSql);
                  //
                  _Cds.Next;
               end;
            end else begin
               sMens := 'Não Há Lançamentos Para Serem Processados.';
               Abort;
            end;
            if bBloqueia then begin
               if not Periodo.TestaPeriodoExiste(idEmpresa,iPeriodo,iExercicio) then begin
                 sMens := Periodo.MessageInfo;
                 Abort;
               end;
               if DateToStr(Periodo.DataFimPeriodo) = sData then begin
                  if not Periodo.EncerraPeriodo(idEmpresa,iExercicio,iPeriodo,tbgIntegrado) then begin
                    sMens := Periodo.MessageInfo;
                    Abort;
                  end;
               end;
               if not Contab.BloqueiaData(idEmpresa,sData) then begin
                  sMens := Contab.MessageInfo;
                  Abort;
               end;
            end;
            Commit;
         except
            On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := sMens + ' ' + E.Message;
            End;
         End;
      Except
         on E:Exception do begin
            Result := False;
         end;
      end;
   end;
end;

procedure TCtrlProcessaContab.SetcdsPlanilha(const Value: TClientDataSet);
begin
  FcdsPlanilha := Value;
end;

function TCtrlProcessaContab.ProcessaIntegraPlanilha(iUsuario, IdEmpresa : Double; bUsaPlanoPatro:Boolean): Boolean;
var
    sData, sMens,sSql : String;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.ProcessaIntegraPlanilha(iUsuario, IdEmpresa, bUsaPlanoPatro, FcdsPlanilha.Data);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      If Not Contab.SelecionaParametrosProc(IdEmpresa) Then
      Begin
        Result := False;
        MessageInfo := Contab.MessageInfo;
        Exit;
      End;

      Result := true;
      FProgresso    := 0;
      FMaxProgresso := 0;
      sMens         := '';
      Try
         Try
            StartTransaction;

            If Not FcdsPlanilha.Active Then FcdsPlanilha.Open;

            //if not Sistema.GravaLogOperacoes('Integração por Planilha') then Raise Exception.Create('Não Consegui Gravar o Log');
            MessageInfo   := 'Integrando os Lançamentos';
            FMaxProgresso := FcdsPlanilha.RecordCount;
            FProgresso    := 0;
            FcdsPlanilha.First;
            sData     := '';
            FcdsPlanilha.DisableControls;
            while not FcdsPlanilha.Eof do begin
               FProgresso  := FProgresso + 1;
               MessageInfo := '*';
               if sData <> FcdsPlanilha.FieldByName('PLNDATDIA').AsString then begin
                  sData :=FcdsPlanilha.FieldByName('PLNDATDIA').AsString;
                  if not Contab.SelecionaPlanoDataProc(idEmpresa,sData) then begin
                     sMens := Contab.MessageInfo;
                     Abort;
                  end;
               end;
               if FcdsPlanilha.FieldByName('PLNEFETIVADO').AsString = 'S' then
               begin
                  _Cds.Data := Lancamento.SelecionaLancamentos(FcdsPlanilha.FieldByName('PLNCODIGO').AsFloat,idEmpresa, 0,0, tpSoPeriodo,'','','','',
                                                  teNaoEfetivado,tomAmbos,tolPlnCodigo,tsSemSoma,False);
                  _Cds.First;
                  While not _Cds.Eof do begin
                     FContaMostra:=_Cds.FieldByName('PLACONTA').AsString;
                     MessageInfo:='*';
                     if not Lancamento.AtuSaldoContas(IdEmpresa, _Cds.FieldByName('UNIDNEGOC').AsFloat,
                                           iUsuario, _Cds.FieldByName('IDPLANOPREV').AsFloat,
                                           _Cds.FieldByName('IDPATRO').AsFloat,
                                           _Cds.FieldByName('PLANO').AsFloat,
                                           _Cds.FieldByName('PEREXERCICIO').AsInteger,
                                           _Cds.FieldByName('PERNUMERO').AsInteger,
                                           _Cds.FieldByName('CODSUBCONTA').AsInteger,
                                           _Cds.FieldByName('CODCENTROCUSTO').AsString,
                                           _Cds.FieldByName('PLACONTA').AsString,
                                           _Cds.FieldByName('LACDEBCRE').AsString,'A',
                                           _Cds.FieldByName('LACVALOR').AsFloat,0,
                                           _Cds.FieldByName('LACVALOFICIAL').AsFloat,
                                           _Cds.FieldByName('LACVALGERENCIAL').AsFloat,
                                           _Cds.FieldByName('LACVALGEREN1').AsFloat,
                                           _Cds.FieldByName('LACVALGEREN2').AsFloat,
                                           _Cds.FieldByName('LACVALHIST').AsFloat,
                                           bUsaPlanoPatro) then begin
                        sMens := Lancamento.MessageInfo;
                        Abort;
                     end;
                     if not Lancamento.AtuSaldoSintetica(IdEmpresa, _Cds.FieldByName('UNIDNEGOC').AsFloat,
                                           iUsuario, _Cds.FieldByName('IDPLANOPREV').AsFloat,
                                           _Cds.FieldByName('IDPATRO').AsFloat,
                                           _Cds.FieldByName('PLANO').AsFloat,
                                           _Cds.FieldByName('PEREXERCICIO').AsInteger,
                                           _Cds.FieldByName('PERNUMERO').AsInteger,
                                           _Cds.FieldByName('CODSUBCONTA').AsInteger,
                                           _Cds.FieldByName('CODCENTROCUSTO').AsString,
                                           _Cds.FieldByName('PLACONTA').AsString,
                                           _Cds.FieldByName('LACDEBCRE').AsString,
                                           Contab.MascaraContaData,
                                           _Cds.FieldByName('LACVALOR').AsFloat,0,
                                           _Cds.FieldByName('LACVALOFICIAL').AsFloat,
                                           _Cds.FieldByName('LACVALGERENCIAL').AsFloat,
                                           _Cds.FieldByName('LACVALGEREN1').AsFloat,
                                           _Cds.FieldByName('LACVALGEREN2').AsFloat,
                                           _Cds.FieldByName('LACVALHIST').AsFloat,
                                           bUsaPlanoPatro) then begin
                        sMens := Lancamento.MessageInfo;
                        Abort;
                     end;
                     _Cds.Next;
                  end;
                  sSql := 'UPDATE PLANILHA SET PLNEFETIVADO = ''S'' WHERE PLNCODIGO = '+FcdsPlanilha.FieldByName('PLNCODIGO').AsString;
                  ExecSQL(sSql);
               end;
               FcdsPlanilha.Next;
            end;
            Commit;
            FcdsPlanilha.EnableControls;
         except
            On E:Exception Do
            Begin
               Rollback;
               FcdsPlanilha.EnableControls;
               Result := False;
               MessageInfo := sMens + ' ' + E.Message;
            End;
         End;
      Except
         on E:Exception do begin
            Result := False;
            MessageInfo := sMens + ' ' + E.Message;
         end;
      end;
   end;
end;


function TCtrlProcessaContab.ProcessaLancamento(idEmpresa, iModuloOrigem, liUsuario : Double;
                                                bUsaPlanoPatro: Boolean; iPlnCodigo: Double; sPlnDatDia: String): Boolean;
var sMens : String;
    cTipoLanc : Char;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then begin

      Result := Connection.AppServer.ProcessaLancamento(idEmpresa, iModuloOrigem, liUsuario, bUsaPlanoPatro,
                iPlnCodigo, sPlnDatDia, FRetornaPlnCodigo, FRetornaPlnPlanil, FRetornaPlnNumLan, cdsLancamento.Data);



      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;

      //CdsLanctoAux.Free;

   end else begin
      sMens:='';
      Result := True;
      Try
         StartTransaction;

         If Not cdsLancamento.Active Then cdsLancamento.Open;

         Lancamento.lcElemento      := cdsLancamento.FieldByName('IDELEMDEMONSTRAT').AsFloat;
         Lancamento.lcTipConvOfiDeb := cdsLancamento.FieldByName('TIPCONVOFIDEB').AsString;
         Lancamento.lcTipConvGerDeb := cdsLancamento.FieldByName('TIPCONVGERDEB').AsString;
         Lancamento.lcTipConvGe1Deb := cdsLancamento.FieldByName('TIPCONVGE1DEB').AsString;
         Lancamento.lcTipConvGe2Deb := cdsLancamento.FieldByName('TIPCONVGE2DEB').AsString;
         Lancamento.lcOriAplDeb     := cdsLancamento.FieldByName('ORIAPLDEB').AsString;
         Lancamento.lcTipConvOfiCre := cdsLancamento.FieldByName('TIPCONVOFICRE').AsString;
         Lancamento.lcTipConvGerCre := cdsLancamento.FieldByName('TIPCONVGERCRE').AsString;
         Lancamento.lcTipConvGe1Cre := cdsLancamento.FieldByName('TIPCONVGE1CRE').AsString;
         Lancamento.lcTipConvGe2Cre := cdsLancamento.FieldByName('TIPCONVGE2CRE').AsString;
         Lancamento.lcOriAplCre     := cdsLancamento.FieldByName('ORIAPLCRE').AsString;
         Lancamento.lcValOfiDeb     := cdsLancamento.FieldByName('VALOFIDEB').AsFloat;
         Lancamento.lcValGerDeb     := cdsLancamento.FieldByName('VALGERDEB').AsFloat;
         Lancamento.lcValGe1Deb     := cdsLancamento.FieldByName('VALGE1DEB').AsFloat;
         Lancamento.lcValGe2Deb     := cdsLancamento.FieldByName('VALGE2DEB').AsFloat;
         Lancamento.lcValHisDeb     := cdsLancamento.FieldByName('VALHISDEB').AsFloat;
         Lancamento.lcValOfiCre     := cdsLancamento.FieldByName('VALOFICRE').AsFloat;
         Lancamento.lcValGerCre     := cdsLancamento.FieldByName('VALGERCRE').AsFloat;
         Lancamento.lcValGe1Cre     := cdsLancamento.FieldByName('VALGE1CRE').AsFloat;
         Lancamento.lcValGe2Cre     := cdsLancamento.FieldByName('VALGE2CRE').AsFloat;
         Lancamento.lcValHisCre     := cdsLancamento.FieldByName('VALHISCRE').AsFloat;
         if (trim(cdsLancamento.FieldByName('PLACONTAD').AsString) <> '') and
            (trim(cdsLancamento.FieldByName('PLACONTAC').AsString) <> '') then begin
            cTipoLanc := '2';
         end else begin
            if (trim(cdsLancamento.FieldByName('PLACONTAD').AsString) <> '') then
               cTipoLanc := '0'
            else
               cTipoLanc := '1';
         end;
         if cdsLancamento.FieldByName('LACNUMLAN').AsFloat <> 0 then begin
            // Altera
            if not Lancamento.AlteraLancaContab(cTipoLanc,idEmpresa,iModuloOrigem,liUsuario,
                                             cdsLancamento.FieldByName('PLANO').AsFloat,
                                             cdsLancamento.FieldByName('UNIDNEGOC').AsFloat,
                                             cdsLancamento.FieldByName('SUBCONTADEB').AsFloat,
                                             cdsLancamento.FieldByName('SUBCONTACRE').AsFloat,
                                             cdsLancamento.FieldByName('IDPLANOPREV').AsFloat,
                                             cdsLancamento.FieldByName('IDPATRO').AsFloat,
                                             iPlnCodigo,
                                             cdsLancamento.FieldByName('LACNUMLAN').AsInteger,
                                             sPlnDatDia,
                                             cdsLancamento.FieldByName('LACNUMDOC').AsString,
                                             cdsLancamento.FieldByName('LACHIST1').AsString,
                                             cdsLancamento.FieldByName('LACHIST2').AsString,
                                             cdsLancamento.FieldByName('LACHIST3').AsString,
                                             cdsLancamento.FieldByName('LACHIST4').AsString,
                                             cdsLancamento.FieldByName('LACHIST5').AsString,
                                             cdsLancamento.FieldByName('TIPCODIGO').AsString,
                                             cdsLancamento.FieldByName('CCUSTDEB').AsString,
                                             cdsLancamento.FieldByName('PLACONTAD').AsString,
                                             cdsLancamento.FieldByName('CCUSTCRE').AsString,
                                             cdsLancamento.FieldByName('PLACONTAC').AsString,
                                             cdsLancamento.FieldByName('HITCODHIST').AsString,
                                             cdsLancamento.FieldByName('LACVALOR').AsFloat,
                                             False,bUsaPlanoPatro) then begin
               sMens := Lancamento.MessageInfo;
               Abort;
            end;
         end else begin
            //Inclui
            if not Lancamento.InsereLancaContab(cTipoLanc,idEmpresa,iModuloOrigem,liUsuario,
                                             cdsLancamento.FieldByName('PLANO').AsFloat,
                                             cdsLancamento.FieldByName('UNIDNEGOC').AsFloat,
                                             cdsLancamento.FieldByName('SUBCONTADEB').AsFloat,
                                             cdsLancamento.FieldByName('SUBCONTACRE').AsFloat,
                                             cdsLancamento.FieldByName('IDPLANOPREV').AsFloat,
                                             cdsLancamento.FieldByName('IDPATRO').AsFloat,
                                             iPlnCodigo,0,
                                             sPlnDatDia,
                                             cdsLancamento.FieldByName('LACNUMDOC').AsString,
                                             cdsLancamento.FieldByName('LACHIST1').AsString,
                                             cdsLancamento.FieldByName('LACHIST2').AsString,
                                             cdsLancamento.FieldByName('LACHIST3').AsString,
                                             cdsLancamento.FieldByName('LACHIST4').AsString,
                                             cdsLancamento.FieldByName('LACHIST5').AsString,
                                             cdsLancamento.FieldByName('TIPCODIGO').AsString,
                                             cdsLancamento.FieldByName('CCUSTDEB').AsString,
                                             cdsLancamento.FieldByName('PLACONTAD').AsString,
                                             cdsLancamento.FieldByName('CCUSTCRE').AsString,
                                             cdsLancamento.FieldByName('PLACONTAC').AsString,
                                             cdsLancamento.FieldByName('HITCODHIST').AsString,
                                             cdsLancamento.FieldByName('LACVALOR').AsFloat,
                                             False,bUsaPlanoPatro) then begin
               sMens := Lancamento.MessageInfo;
               Abort;
            end;
         end;
         FRetornaPlnCodigo := Lancamento.RetornoPlnCodigo;
         FRetornaPlnPlanil := Lancamento.ProxPlanilha;
         FRetornaPlnNumLan := Lancamento.NumLancamento;
         Commit;
      except
         On E:Exception Do
         Begin
            Rollback;
            Result := False;
            MessageInfo := sMens + ' ' + E.Message;
         End;
      End;
   end;
end;

procedure TCtrlProcessaContab.SetcdsLancamento(
  const Value: TClientDataSet);
begin
  FcdsLancamento := Value;
end;

function TCtrlProcessaContab.ProcessaExcluiLanc(iPlanilha, iModuloOrigem, liUsuario: Double;
                      iNumLanc: LongInt; bUsaPlanoPatro, bExcluiPlanilha: Boolean): Boolean;
var sMens : String;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.ProcessaExcluiLanc(iPlanilha, iModuloOrigem, liUsuario,
                            iNumLanc, bUsaPlanoPatro, bExcluiPlanilha);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      sMens:='';
      Result := True;
      Try
         StartTransaction;
         if not Lancamento.ExcluiLancaContab(liUsuario,iPlanilha,iModuloOrigem,iNumLanc,
                                      bUsaPlanoPatro,bExcluiPlanilha) then begin
            sMens:=Lancamento.MessageInfo;
            Abort;
         end;
         Commit;
      except
         On E:Exception Do
         Begin
            Rollback;
            Result := False;
            MessageInfo := sMens + ' ' + E.Message;
         End;
      End;
   end;
end;


procedure TCtrlProcessaContab.AfterInitialize;
begin
  inherited;
  Lancamento.Initializeas(self);
  Periodo.initializeas(self);
  HistoContab.initializeas(self);
  SubConta.initializeas(self);
  EventoSRH.initializeas(self);
  Contab.initializeas(self);
  PlanoDePara.initializeas(self);
  Planilha.initializeas(self);
  ListTerceiros.initializeas(self);
  ContaContabil.initializeas(self);
  Geral.initializeas(self);

  Periodo.OpenTransaction := False;
end;

function TCtrlProcessaContab.ImportaPlanoContas(ArquivoTexto:TStringList;sMascara,sCaminho:string;
                                           iPlano :Integer;dEmpresa: double): Boolean;
var
  ArquivoLog : TextFile;
  sGrau, sGrupo, sNomoutling, sSumariza, sObrigacc, sOrdAlfab, sSecretaria : string;
  sLinha, sPlaconta, sCorresp,sSql,sMens,sConta : string;
  iReduz,iContaLinha : integer;
  sDesc, sTiposa, sTipodc   : String;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ImportaPlanoContas(StringlistToVariant(ArquivoTexto),
                            sMascara,sCaminho,iPlano,dEmpresa,FsMensAPS);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
         FsMensAPS := Connection.AppServer.MessageInfo;

   End Else
   Begin
     FProgresso   := 0;
     sMens        := '';
     sMensAPS     := '';
     iContaLinha  := 0;
     iReduz       := 0;
     sLinha       := '';
     sSql         := '';

     If Not Contab.SelecionaParametrosProc(dEmpresa) Then
     Begin
        Result := False;
        MessageInfo := Contab.MessageInfo;
        sMensAPS := MessageInfo + chr(13) + chr(13);
        Exit;
     End;

     AssignFile(ArquivoLog,Copy(Trim(sCaminho),1,Pos('.',Trim(sCaminho)))+ 'LOG');
     ReWrite(ArquivoLog);

     sLinha := ArquivoTexto[0];

     //Verifica se a formatação está correta
     if length(sLinha) <> 144 then
     Begin
       MessageInfo := 'Arquivo texto com formato incompatível';
       sMensAPS := sMensAPS + MessageInfo + chr(13) + chr(13);

       Result := False;
       CloseFile(ArquivoLog);
       Exit;
     End;


     Try
         StartTransaction;

         While (ArquivoTexto.Count <>  iContaLinha)  do
         begin

            sLinha := ArquivoTexto[iContaLinha];

            iContaLinha := iContaLinha + 1;

            FProgresso  := FProgresso + 1;

            sConta := Trim(copy(sLinha,1,18));

            sDesc       := Contab.RemoveAnyThing(Trim(copy(sLinha,19,40)),#39);
            sTipodc     := Contab.RemoveAnyThing(Trim(copy(sLinha,79,1)),#39);
            sTiposa     := Contab.RemoveAnyThing(Trim(copy(sLinha,80,1)),#39);
            sGrupo      := Contab.RemoveAnyThing(Trim(copy(sLinha,81,1)),#39);

            sgrau := Contab.RemoveAnyThing(Trim(copy(sLinha,82,1)),#39);

            if trim(sGrau) = '' then
               sGrau := IntToStr(FuncaoGeral.CalcGrau(sMascara,sConta));

            snomoutling := Contab.RemoveAnyThing(Trim(copy(sLinha,83,40)),#39);
            ssumariza   := Contab.RemoveAnyThing(Trim(copy(sLinha,123,1)),#39);
            sobrigacc   := Contab.RemoveAnyThing(Trim(copy(sLinha,124,1)),#39);
            sordalfab   := Contab.RemoveAnyThing(Trim(copy(sLinha,125,1)),#39);
            ssecretaria := Contab.RemoveAnyThing(Trim(copy(sLinha,126,1)),#39);

            sCorresp    := Contab.RemoveAnyThing(Trim(copy(sLinha,127,18)),#39);

            if trim(sSumariza)   = '' then sSumariza   := 'N';
            if trim(sObrigaCC)   = '' then sObrigaCC   := 'N';
            if trim(sordalfab)   = '' then sordalfab   := 'N';
            if trim(ssecretaria) = '' then ssecretaria := 'N';

            //Atribuição do Grupo (Ativo, Passivo, Receita e Despesa) e Código Reduzido
            If (trim(sGrupo) = '') or (iReduz = 0) then
            Begin

               If Copy(sConta,1,1) = '1' then
               Begin

                  if trim(sGrupo) = '' then
                     sgrupo := 'A';

                  if iReduz = 0 then
                     iReduz := Contab.Reduza;


                  sSql:= 'UPDATE PARAMCONTAB SET PACREDUZA = '+ inttoStr(iReduz + 1) +
                         'WHERE IDPESSOA = '+FloatToStr(dEmpresa);

               End Else
               Begin
                  if copy(sPlaconta,1,1) = '2' then
                  begin

                     if trim(sGrupo) = '' then
                        sgrupo := 'P';

                     if iReduz = 0 then
                        iReduz := Contab.Reduzp;

                     sSql:= 'UPDATE PARAMCONTAB SET PACREDUZP = '+ inttoStr(iReduz + 1) +
                            'WHERE IDPESSOA = '+FloatToStr(dEmpresa);

                  End else
                  Begin
                     If (copy(sPlaconta,1,2) = '31') or (copy(sPlaconta,1,2) = '41') then
                     Begin

                        if trim(sGrupo) = '' then
                           sgrupo := 'R';

                        if iReduz = 0 then
                           iReduz := Contab.Reduzr;

                        sSql:= 'UPDATE PARAMCONTAB SET PACREDUZR = '+ inttoStr(iReduz + 1) +
                                'WHERE IDPESSOA = '+FloatToStr(dEmpresa);

                      End Else
                      Begin
                        if (copy(sPlaconta,1,2) = '32') or (copy(sPlaconta,1,2) = '42') Then
                        Begin

                           if trim(sGrupo) = '' then
                              sgrupo := 'D';

                           if iReduz = 0 then
                              iReduz := Contab.Reduzd;

                           sSql:= 'UPDATE PARAMCONTAB SET PACREDUZD = '+ inttoStr(iReduz + 1) +
                                   'WHERE IDPESSOA = '+FloatToStr(dEmpresa);


                        End Else
                        Begin

                           if trim(sGrupo) = '' then
                              sgrupo := 'O';

                           if iReduz = 0 then
                              iReduz := Contab.Reduzo;

                           sSql:= 'UPDATE PARAMCONTAB SET PACREDUZO = '+ inttoStr(iReduz + 1) +
                                   'WHERE IDPESSOA = '+FloatToStr(dEmpresa);

                        End;
                        Result := ExecSql(sSql);
                        If Not Result Then
                        Begin
                           sMens := 'Erro ao Atualizar os Parametros do Sistema.';
                           sMensAPS := sMensAPS + sMens + chr(13) + chr(13);

                           Raise Exception.Create(sMens);
                        End;
                      End;
                  End;
               End;
            End;
            sSql := '';
            sSql := 'INSERT INTO PLANOCONTA (PLANO, PLACONTA, PLANOME, PLATIPO, ' +
                    ' PLANATUREZA, PLAGRUPO, PLAGRAU, PLAREDUZ, PLAINATIVA, PLAALTERA, PLATIPCONVOFICIAL, ' +
                    ' PLATIPCONVGER, PLATIPCONVGEREN1, PLATIPCONVGEREN2, PLANOMEOUTLING, ' +
                    ' PLASUMARIZA, PLACCUST, PLAORDALF, PLASECRETARIA, PLACONCORRESP, PLABLOQUE) VALUES (''' + inttostr(iPlano) + ''',''' +
                    sConta + ''',''' + sDesc + ''',''' + sTiposa + ''',''' + sTipodc + ''',''' + sGrupo +
                    ''',''' + sGrau + ''',''' + inttostr(iReduz) + ''',''A'',''S'',''D'',''' +
                    'D'',''D'',''D'',''' + sNomOutLing + ''',''' + sSumariza + ''',''' + sObrigaCC +
                    ''',''' + sOrdalfab + ''',''' + sSecretaria + ''',''' + sCorresp + ''',''N'')';

            Result := ExecSql(sSql);
            If Not Result Then
            Begin
               sMens := 'Importação Não pôde ser Realizada, Verifique se os Dados Importados Estão Consistentes.';
               sMensAPS := sMensAPS + sMens + chr(13) + chr(13);

               Raise Exception.Create(sMens);
            End;
         End;

         Commit;
         Result := True;
         sMens := 'Importação do Plano de Contas Efetuada com Sucesso!';
         sMensAPS := sMensAPS + sMens + chr(13) + chr(13);

     Except
         on E:Exception Do
         Begin
            MessageInfo := sMens;
            RollBack;
            Result := False;
            MessageInfo := sMens+' '+E.Message;
         End;
     End;
     CloseFile(ArquivoLog);
   End;
end;

function TCtrlProcessaContab.ImportaSaldoAnterior(ArquivoTexto: TStringList; sExercicio,
  sCaminho,sMascara: string;
  iPlano,iUsuario:Integer;dEmpresa: double): Boolean;
var
  iZeros,iGrau,iContaLinha :integer;
  ArquivoLog : TextFile;
  sTipoAS,sLinha,sSql,sMens : string;

  sSaldo, sConta, sTipodc, sSubConta, sCCusto, sUnidNegoc   : String;
  iPlanPrev, iPatro,iIDPlanoSaldo : LongInt;
  sPlanPrev, sPatro : String;

  _cdsParamGlobal  :TClientDataSet;
  _cdsUnidNegoc    :TClientDataSet;
  _cdsPlanoConta   :TClientDataSet;
  _cdsConta        :TClientDataSet;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ImportaSaldoAnterior(StringlistToVariant(ArquivoTexto),
                            sExercicio,sCaminho,sMascara,iPlano,iUsuario,dEmpresa,FsMensAPS);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
         FsMensAPS := Connection.AppServer.MessageInfo;

   End Else
   Begin
     FProgresso   := 0;
     sMens        := '';
     sMensAPS     := '';
     iContaLinha  := 0;
     sLinha       := '';
     sSql         := '';

     If Not Contab.SelecionaParametrosProc(dEmpresa) Then
     Begin
        Result := False;
        MessageInfo := Contab.MessageInfo;
        sMensAPS := MessageInfo + chr(13) + chr(13);
        Exit;
     End;

     AssignFile(ArquivoLog,Copy(Trim(sCaminho),1,Pos('.',Trim(sCaminho)))+ 'LOG');
     ReWrite(ArquivoLog);

     sLinha := ArquivoTexto[0];

     //Verifica se a formatação está correta
     if (length(sLinha) <> 63) and (length(sLinha) <> 83) Then
     Begin
       MessageInfo := 'Arquivo texto com formato incompatível';
       sMensAPS := sMensAPS + MessageInfo + chr(13) + chr(13);

       Result := False;
       CloseFile(ArquivoLog);
       Exit;
     End;

     _cdsParamGlobal  := TClientDataSet.Create(nil);
     _cdsPlanoConta   := TClientDataSet.Create(nil);
     _cdsUnidNegoc    := TClientDataSet.Create(nil);
     _cdsConta        := TClientDataSet.Create(nil);

     Try

         StartTransaction;

         While (ArquivoTexto.Count <>  iContaLinha)  do
         Begin

            sLinha := ArquivoTexto[iContaLinha];

            iContaLinha := iContaLinha + 1;

            FProgresso  := FProgresso + 1;

            sconta := Trim(copy(sLinha,1,18));

            for iZeros := length(sConta) downto 1 do
            begin
               if (copy(sConta,iZeros,1) = '0') then
                  sConta  := Copy(sConta,1,iZeros - 1)
               else
                  break;
            end;

            iGrau := FuncaoGeral.CalcGrau(sMascara,SConta);

            // problema com a retirada de zeros a direita da conta
            while igrau = 0 do
            begin
               sConta := sConta + '0';
               iGrau := FuncaoGeral.CalcGrau(sMascara,sConta);
            end;

            iIDPlanoSaldo := GetSequence('PLANOSALDO');

            sSubConta  := Trim(copy(sLinha,19,7));
            sCCusto    := Trim(copy(sLinha,26,10));
            sUnidNegoc := Trim(copy(sLinha,36,10));
            stipodc    := Trim(copy(sLinha,46,1));
            ssaldo     := Trim(copy(sLinha,47,17));

            If length(sLinha) = 83 then
            begin
               iPlanPrev := StrToInt(Trim(copy(sLinha,64,10)));
               iPatro    := StrToInt(Trim(copy(sLinha,74,10)));
            end else
            begin
               iPlanPrev := 0;
               iPatro    := 0;
            end;

            if trim(sSubConta) = '' then
            begin
               sSubConta := 'NULL';
            end else
            begin
               sSubConta :=  sSubConta;
            end;

            if trim(sUnidNegoc) = '' then
            begin
               sSql := 'SELECT UNIDNEGOC FROM PARAMGLOBAL WHERE IDPESSOA = '+FloatToStr(dEmpresa);
               _cdsParamGlobal.Data := GetDataPacket(sSql);
               if not _cdsParamGlobal.IsEmpty then
               begin
                 sUnidNegoc := _cdsParamGlobal.FieldByName('UNIDNEGOC').AsString;
               end;

            end else
            begin
               sSql := 'SELECT UNIDNEGOC FROM UNIDNEGOCIO WHERE (UNECODIGO = '''+sUnidNegoc+''') AND '+
                       '(IDPESSOA = '+FloatToStr(dEmpresa)+ ')';

               _cdsUnidNegoc.Data := GetDataPacket(sSql);
               if not _cdsUnidNegoc.IsEmpty then
               begin
                 sUnidNegoc := _cdsUnidNegoc.FieldByName('UNIDNEGOC').AsString;
               end;
            end;

            if trim(sCCusto) = '' then
            begin
               sCCusto := 'NULL';
            end else
            begin
               sCCusto := '''' + sCCusto + '''';
            end;

            if (iPlanPrev <= 0) then
            begin
               sPlanPrev := 'NULL';
            end else
            begin
               sPlanPrev := IntToStr(iPlanPrev);
            end;

            if (iPatro <= 0) then
            begin
               sPatro := 'NULL';
            end else
            begin
               sPatro := IntToStr(iPatro);
            end;

            sSql :=  'SELECT PLACONTA FROM PLANOCONTA WHERE PLACONTA = ''' + sconta +
                     ''' AND PLANO = ' + inttostr(iPlano);

            _cdsPlanoConta.Data := GetDataPacket(sSql);

            //================

            sSql := 'SELECT PLACONTA, PLATIPO FROM PLANOCONTA '+
                    'WHERE (RTRIM(PLACONTA) = ''' + trim(sconta) + ''' ) AND '+
                    '      (PLANO = ' + IntToStr(iPlano) + ') ';

            _cdsConta.Data := GetDataPacket(sSql);
            if not _cdsConta.isEmpty then
            begin
                  sTipoAS := _cdsConta.FieldByName('PLATIPO').asString;
            end else
            begin
                  sTipoAS := '';
            end;


            if not _cdsPlanoConta.EOF then
            begin

              sSql := 'INSERT INTO PLANOSALDO (PLANO, IDPLANOSALDO, IDPESSOA, ' +
                      ' PLACONTA, PEREXERCICIO, PERNUMERO, CODCENTROCUSTO, UNIDNEGOC, PLSDEBITOCORRENTE, ' +
                      ' PLSCREDITOCOR, PLSDEBITOOFICIAL, PLSCREDITOOFICIAL, PLSDEBITOGER, ' +
                      ' PLSCREDITOGER, PLSDEBITOGEREN1, PLSCREDITOGEREN1, PLSDEBITOGEREN2, ' +
                      ' PLSCREDITOGEREN2, PLSORCADODEBITO, PLSORCADOCREDITO, IDUSUARIOINCLUSAO, ' +
                      ' PLSDEBITOHIST, PLSCREDITOHIST, CODSUBCONTA, PLSTIPO, IDPLANOPREV, IDPATRO) VALUES ('+
                      inttostr(iPlano) + ',' + inttostr(iIDPlanoSaldo) + ',' +
                      FloatTostr(dempresa) + ',''' + sConta + ''',' + sExercicio +
                      ', null, '+ sCCusto + ',' + sUnidNegoc + ', ';

              if sTipoDC = 'D' then
                 sSql := sSql + ssaldo + ',0,'
              else
                 sSql := sSql +'0,' + sSaldo + ',';

              sSql := sSql + '0,0,0,0,0,0,0,0,0,0,' + IntToStr(iUsuario) + ',' +
                             '0,0, ' + sSubConta + ', '''+ sTipoAS + ''','+sPlanPrev+','+sPatro+')';

              Result := ExecSql(sSql);
              If Not Result Then
              Begin
                sMens := 'Importação de Saldos Anteriores Não pôde ser Realizada, Verifique se os Dados Importados Estão Consistentes.';
                sMensAPS := sMensAPS + sMens + chr(13) + chr(13);

                Raise Exception.Create(sMens);
              End;

            end else
            begin
               sMens := 'Erro na Importação. Verifique a Conta: ' + sConta + ' e o Plano : '+ IntToStr(iPlano) + ' em questão';
               sMensAPS := sMensAPS + sMens + chr(13) + chr(13);

               Raise Exception.Create(sMens);
            end;

         End;


         Commit;
         Result := True;
         sMens := 'Importação de Saldos Anteriores Efetuada com Sucesso!';
         sMensAPS := sMensAPS + sMens + chr(13) + chr(13);
         MessageInfo := sMens;
     Except
         on E:Exception Do
          Begin
            MessageInfo := sMens;
            RollBack;
            Result := False;
            MessageInfo := sMens+' '+E.Message;
         End;
     End;
     CloseFile(ArquivoLog);
     _cdsParamGlobal.free;
     _cdsPlanoConta.free;
     _cdsUnidNegoc.free;
     _cdsConta.free;
  End;
end;

function TCtrlProcessaContab.ImportaContaCorresp(ArquivoTexto: TStringList;
                          sCaminho: string; iPlano: Integer;dEmpresa:Double): Boolean;
var
 sConta,sCorresp,sSql,sMens,sLinha :string;
 iContaLinha :Integer;
 ArquivoLog : TextFile;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ImportaContaCorresp(StringlistToVariant(ArquivoTexto),
                            sCaminho,iPlano,dEmpresa,FsMensAPS);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
         FsMensAPS := Connection.AppServer.MessageInfo;

   End Else
   Begin
     FProgresso   := 0;
     sMens        := '';
     sMensAPS     := '';
     iContaLinha  := 0;
     sLinha       := '';
     sSql         := '';

     If Not Contab.SelecionaParametrosProc(dEmpresa) Then
     Begin
        Result := False;
        MessageInfo := Contab.MessageInfo;
        sMensAPS := MessageInfo + chr(13) + chr(13);
        Exit;
     End;

     AssignFile(ArquivoLog,Copy(Trim(sCaminho),1,Pos('.',Trim(sCaminho)))+ 'LOG');
     ReWrite(ArquivoLog);

     sLinha := ArquivoTexto[0];

     //Verifica se a formatação está correta
     if length(sLinha) <> 144 then
     Begin
       MessageInfo := 'Arquivo texto com formato incompatível';
       sMensAPS := sMensAPS + MessageInfo + chr(13) + chr(13);

       Result := False;
       CloseFile(ArquivoLog);
       Exit;
     End;


     Try

         StartTransaction;

         While (ArquivoTexto.Count <>  iContaLinha)  do
         Begin

            sLinha := ArquivoTexto[iContaLinha];

            iContaLinha := iContaLinha + 1;

            FProgresso  := FProgresso + 1;

            sConta   := Trim(copy(sLinha,1,18));
            sCorresp := Contab.RemoveAnyThing(Trim(copy(sLinha,127,18)),#39);

            sSql :=  'UPDATE PLANOCONTA SET PLACONCORRESP = ''' + sCorresp + ''' WHERE PLANO = ' + intToStr(iPlano) +
                     ' AND PLACONTA = ''' + sConta + '''';

            Result := ExecSql(sSql);
            If Not Result Then
            Begin
              sMens := 'Importação das Contas Correspondentes Não pôde ser Realizada, Verifique se os Dados Importados Estão Consistentes.';
              sMensAPS := sMensAPS + sMens + chr(13) + chr(13);

              Raise Exception.Create(sMens);
            End;
         End;
         Commit;
         Result := True;
         sMens := 'Importação das Contas Correspondentes Efetuada com Sucesso!';
         sMensAPS := sMensAPS + sMens + chr(13) + chr(13);
         MessageInfo := sMens;

     Except
         on E:Exception Do
         Begin
            MessageInfo := sMens;
            RollBack;
            Result := False;
            MessageInfo := sMens+' '+E.Message;
         End;
     End;
     CloseFile(ArquivoLog);
  End;

end;

function TCtrlProcessaContab.ImportaSAF(ArquivoTexto: TStringList;
  sTipoOper,sCaminho: string; iModulo,iUsuario,iPlano,iPlanoPrev,iPlanoPatro,
  iNumCommit,iContMax: Integer; dEmpresa: Double;bUsaPPatro,bTestaConta:Boolean): Boolean;

var
  ArquivoLog : TextFile;
  cTipoLanc,cAuxDec :Char;
  sCCusto,sCCustoD,sCCustoC :String;
  iContCommit,iContaLinha  : LongInt;
  sHistorico,sContaC,sContaD,sNumDoc :String;
  sCodAnt, sMens, sLinha,sSql,sCodCorresp,sDataIni,sValor,sDataLanc :String;
  dPlnCodigo,dValLanc :Double;

  iSubContaD,iSubContaC,iUnidNegoc :Integer;
  _cdsCentroCusto  :TClientDataSet;
  _cdsPlanoConta   :TClientDataSet;
  _cdsContasxCC    :TClientDataSet;
  _cdsPlanilha     :TClientDataSet;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ImportaSAF(StringlistToVariant(ArquivoTexto),
                           sTipoOper,sCaminho,iModulo,iUsuario,iPlano,
                           iPlanoPrev,iPlanoPatro,iNumCommit,iContMax,
                           dEmpresa,bUsaPPatro,bTestaConta,FsMensAPS,sMensAPS_Log);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
      Begin
         FsMensAPS     := Connection.AppServer.MessageInfo;
         FsMensAPS_Log := Connection.AppServer.MessageInfo2;
      End;

   End Else
   Begin
     FProgresso   := 0;
     sMens        := '';
     sMensAPS_Log := '';
     sMensAPS     := '';
     iContaLinha  := 0;
     iContCommit  := 0;

     sLinha       := '';
     sSql         := '';
     sDataIni     := '';
     dPlnCodigo  := 0;
     sCodAnt      := '@@@';

     cAuxDec           := DecimalSeparator;
     DecimalSeparator := '.';
     Result := True;


    _cdsCentroCusto  := TClientDataSet.Create(nil);
    _cdsPlanoConta   := TClientDataSet.Create(nil);
    _cdsContasxCC    := TClientDataSet.Create(nil);
    _cdsPlanilha     := TClientDataSet.Create(nil);

     If Not Contab.SelecionaParametrosProc(dEmpresa) Then
     Begin
        Result := False;
        MessageInfo := Contab.MessageInfo;
        sMensAPS := MessageInfo + chr(13) + chr(13);
        Exit;
     End;

     AssignFile(ArquivoLog,Copy(Trim(sCaminho),1,Pos('.',Trim(sCaminho)))+ 'LOG');
     ReWrite(ArquivoLog);

     //Loop de Varredura do Arquivo Texto
     While (ArquivoTexto.Count <>  iContaLinha)  do
     Begin

         sDataLanc    := '';
         sNumDoc      := '';
         sHistorico   := '';
         sCCustoD     := '';
         sCCusto      := '';
         sContaD      := '';
         sContaC      := '';
         sValor       := '';
         Try

            if ((iContaLinha Mod iNumCommit) = 0) then
                StartTransaction;

             sLinha := ArquivoTexto[iContaLinha];

             iContaLinha := iContaLinha + 1;

             FProgresso  := FProgresso + 1;

             sDataLanc   := Trim(copy(sLinha,28,10));
             cTipoLanc   := '2';
             sNumDoc     := Trim(copy(sLinha,38,10));
             sHistorico  := Trim(copy(sLinha,138,120));
             sCodCorresp := Trim(copy(sLinha,1,2));

             HistoContab.ArrumaHistorico(sHistorico);

             sValor    := Trim(copy(sLinha,118,20));

             if sValor = '' then
                sValor := '0';

             dValLanc := strToFloat(sValor)/100;

             iUnidNegoc := 0;

             sSql := 'SELECT CODCENTROCUSTO FROM CENTCUST '+
                     'WHERE (RTRIM(CODREDUZIDO) = ''' + sCodCorresp + ''' ) '+
                     '  AND (IDEMPRESA = '+ FloatToStr(dEmpresa) + ')';

             _cdsCentroCusto.Data := GetDataPacket(sSql);


            if _cdsCentroCusto.IsEmpty then
            begin
               sCCusto := ''
            end else begin
               sCCusto := _cdsCentroCusto.FieldByName('CODCENTROCUSTO').AsString;
            end;

            if Trim(copy(sLinha,1,47)) <> sCodAnt then
               dPlnCodigo := 0;

            sCodAnt := Trim(copy(sLinha,1,47));

            //== pega dados da  Conta Débito ===
            sCCustoD := sCCusto;
            sContaD := Contab.RemoveMascara(Trim(copy(sLinha,58,30)));

            _cdsPlanoConta.Data := ContaContabil.ListContas(iPlano,tcAmbasC, True,sContaD);

            Lancamento.lcTipConvOfiDeb   := _cdsPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString;
            Lancamento.lcTipConvGerDeb   := _cdsPlanoConta.FieldByName('PLATIPCONVGER').AsString;
            Lancamento.lcTipConvGe1Deb   := _cdsPlanoConta.FieldByName('PLATIPCONVGEREN1').AsString;
            Lancamento.lcTipConvGe2Deb   := _cdsPlanoConta.FieldByName('PLATIPCONVGEREN2').AsString;

            If trim(sCCustoD) <> '' then
            Begin
              sSql := 'SELECT CODCENTROCUSTO '+
                      'FROM CONTASXCC '  +
                      'WHERE (PLANO = ' + IntToStr(iPlano) + ') AND '+
                      '    (RTRIM(PLACONTA) = '''+sContaD+''' ) AND '+
                      '    (RTRIM(CODCENTROCUSTO) = '''+sCCustoD+ ''') AND '+
                      '    (IDEMPRESA = '+ FloatToStr(dEmpresa) + ') ';



              _cdsContasxCC.Data := GetDataPacket(sSql);

              If _cdsContasxCC.isEmpty then
              Begin

                 sSql := 'INSERT INTO CONTASXCC '+
                         '  (PLANO, PLACONTA, CODCENTROCUSTO, IDEMPRESA, IDUSUARIOINCLUSAO) '+
                         '  VALUES (''' + IntToStr(iPlano) + ''',''' + sContaD + ''',''' + sCCustoD + ''',''' + FloatToStr(dEmpresa) +
                                    ''',''' + IntToStr(iUsuario) + ')';

                 Result := ExecSql(sSql);
                 If Not Result Then
                 Begin
                   sMens := 'Importação Não Realizada. Erro de Inclusão na Tabela ContasxCC.';
                   sMensAPS := sMensAPS + sMens + chr(13) + chr(13);

                   Raise Exception.Create(sMens);
                 End;

              End;
            End;

            //=== Pega dados da Conta Crédito ===
            iSubContaD  := 0;
            iSubContaC  := 0;

            sCCustoC    := sCCusto;
            sContaC     := Contab.RemoveMascara(Trim(copy(sLinha,88,30)));

            _cdsPlanoConta.Data := ContaContabil.ListContas(iPlano,tcAmbasC, True,sContaC);

            Lancamento.lcTipConvOfiCre := _cdsPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString;
            Lancamento.lcTipConvGerCre := _cdsPlanoConta.FieldByName('PLATIPCONVGER').AsString;
            Lancamento.lcTipConvGe1Cre := _cdsPlanoConta.FieldByName('PLATIPCONVGEREN1').AsString;
            Lancamento.lcTipConvGe2Cre := _cdsPlanoConta.FieldByName('PLATIPCONVGEREN2').AsString;

            If trim(sCCustoC) <> '' then
            Begin
              sSql := 'SELECT CODCENTROCUSTO '+
                      'FROM CONTASXCC ' +
                      'WHERE (PLANO = '+ IntToStr(iPlano) + ') AND '+
                      '    (RTRIM(PLACONTA) = '''+sContaC+ ''' ) AND '+
                      '    (RTRIM(CODCENTROCUSTO) = '''+sCCustoC+ ''') AND '+
                      '    (IDEMPRESA = '+ FloatToStr(dEmpresa) + ') ';



              _cdsContasxCC.Data := GetDataPacket(sSql);

               If _cdsContasxCC.isEmpty then
               Begin
                 sSql := 'INSERT INTO CONTASXCC '+
                         '  (PLANO, PLACONTA, CODCENTROCUSTO, IDEMPRESA, IDUSUARIOINCLUSAO) '+
                         '  VALUES (''' + IntToStr(iPlano) + ''',''' + sContaC + ''',''' + sCCustoC + ''',''' + FloatToStr(dEmpresa) +
                                    ''',''' + IntToStr(iUsuario) + ')';


                 Result := ExecSql(sSql);
                 If Not Result Then
                 Begin
                   sMens := 'Importação Não Realizada. Erro de Inclusão na Tabela ContasxCC.';
                   sMensAPS := sMensAPS + sMens + chr(13) + chr(13);

                   Raise Exception.Create(sMens);
                 End;

               End;
            End;

            //*** insere os lancamentos ***
            Lancamento.lcTestaConta := bTestaConta;
            If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                      iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                      iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                      sDataLanc,sNumDoc,HistoContab.Hist1,
                                      HistoContab.Hist2,HistoContab.Hist3,
                                      HistoContab.Hist4,HistoContab.Hist5,
                                      sTipoOper,sCCustoD,sContaD,
                                      sCCustoC,sContaC,sHistorico,
                                      dValLanc,False,bUsaPPatro) Then

            Begin
               sMensAPS := sMensAPS + Lancamento.MessageInfo + chr(13);
               Raise Exception.Create(Lancamento.MessageInfo);
            End Else
            Begin
                 dPlnCodigo := Lancamento.RetornoPlnCodigo;
            End;

            If sDataIni <> sDataLanc then
            Begin
               _cdsPlanilha.Data := Planilha.ListPlanilhas(0,dPlnCodigo);

               sMens := 'Planilha Inicial: '+IntToStr(_cdsPlanilha.FieldByName('PLNPLANIL').asInteger) + ' em: ' + sDataLanc;
               sMensAPS_Log := sMensAPS_Log + sMens + chr(13);
               sDataIni := sDataLanc;
            End;

            If ((iContaLinha Mod iNumCommit) = 0) or (iContaLinha = iContMax) then
            Begin
               Commit;
               Writeln(ArquivoLog,'Gravei até a linha '+IntToStr(iContaLinha));
               iContCommit := iContaLinha;
            End;

         Except
            on E:Exception Do
            Begin
               _cdsCentroCusto.free;
               _cdsPlanoConta.free;
               _cdsContasxCC.free;

               Result := False;

               RollBack;
               Writeln(ArquivoLog,'Houve erros na importação na linha '+IntToStr(iContaLinha));
               CloseFile(ArquivoLog);

               DecimalSeparator := cAuxDec;
               sMens := 'Houve erros na importação. ' + CHR(13) + CHR(13) +
                        'A linha nº ' + IntToStr(iContaLinha) + ' do arquivo importado está com problemas.'+ CHR(13) +
                        'Foi importado até a linha nº ' + IntToStr(iContCommit) +'.'+ CHR(13) +
                        'Apague do seu TXT as linhas já importadas. ' + CHR(13) +
                        'Verifique os Lançamentos com inconsistências.';

               sMensAPS := sMensAPS + sMens + chr(13);

               MessageInfo := sMens+' '+E.Message;

            End;

         End;
         Commit;

     End;
     _cdsCentroCusto.free;
     _cdsPlanoConta.free;
     _cdsContasxCC.free;
     _cdsPlanilha.free;
     Writeln(ArquivoLog,'Lançamentos efetuados com sucesso!');
     sMens := 'Lançamentos efetuados com sucesso!';
     MessageInfo := sMens;
     CloseFile(ArquivoLog);
     sMensAPS := sMensAPS + sMens + chr(13);
     DecimalSeparator := cAuxDec;
   End;
end;

function TCtrlProcessaContab.ImportaFolhaDinamica(ArquivoTexto: TStringList; sTipoOper,
                     sCaminho: string; iModulo, iUsuario, iPlano, iContMax: Integer;
                     dEmpresa: Double; bUsaPPatro, bTestaConta,bHistoChecado: Boolean): Boolean;

var
  ArquivoLog : TextFile;
  cTipoLanc,cAuxDec :Char;
  sCCusto,sCCustoD,sCCustoC,sHist1,sHist2,sHist3,sHist4,sHist5,sDebCre :String;
  iContaLinha  : LongInt;
  sHistorico,sHistoCompleto,sContaC,sContaD,sNumDoc,sMascaraHisto :String;
  sMens, sLinha,sSql,sValor,sDataLanc :String;
  dPlnCodigo,dPlnCodigo2,dValLanc :Double;

  iSubContaD,iSubContaC,iUnidNegoc :Integer;
  _cdsPlanoConta   :TClientDataSet;
  _cdsHistorico    :TClientDataSet;
  _cdsPlanilha     :TClientDataSet;
  _cdsSubConta     :TClientDataSet;
  _cdsContasxCC    :TClientDataSet;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ImportaFolhaDinamica(StringlistToVariant(ArquivoTexto),
                            sTipoOper,  sCaminho, iModulo, iUsuario, iPlano, iContMax,
                            dEmpresa,bUsaPPatro, bTestaConta,bHistoChecado,FsMensAPS,FsMensAPS_Log);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
      Begin
         FsMensAPS     := Connection.AppServer.MessageInfo;
         FsMensAPS_Log := Connection.AppServer.MessageInfo2;
      End;

   End Else
   Begin
     FProgresso   := 0;
     sMens        := '';
     sMensAPS_Log := '';
     sMensAPS     := '';
     iContaLinha  := 0;

     sLinha       := '';
     sSql         := '';
     dPlnCodigo   := 0;
     dPlnCodigo2  := 0;

     cAuxDec           := DecimalSeparator;
     DecimalSeparator  := '.';


    _cdsSubConta     := TClientDataSet.Create(nil);
    _cdsPlanoConta   := TClientDataSet.Create(nil);
    _cdsContasxCC    := TClientDataSet.Create(nil);
    _cdsHistorico    := TClientDataSet.Create(nil);
    _cdsPlanilha     := TClientDataSet.Create(nil);

     If Not Contab.SelecionaParametrosProc(dEmpresa) Then
     Begin
        Result      := False;
        MessageInfo := Contab.MessageInfo;
        sMensAPS    := MessageInfo + chr(13) + chr(13);
        Exit;
     End;

     AssignFile(ArquivoLog,Copy(Trim(sCaminho),1,Pos('.',Trim(sCaminho)))+ 'LOG');
     ReWrite(ArquivoLog);

     sLinha := ArquivoTexto[0];

     //Verifica se a formatação está correta
     If (length(sLinha) <> 372) Then
     Begin
       MessageInfo := 'Arquivo texto com formato incompatível';
       sMensAPS := sMensAPS + MessageInfo + chr(13) + chr(13);

       Result := False;
       CloseFile(ArquivoLog);
       Exit;
     End;

     Try
        StartTransaction;

        //=== Deleta os lançamentos contábeis externos ===
        sSql := 'DELETE FROM LANCONTABEXTERNOS ';
        Result := ExecSql(sSql);
        If Not Result Then
        Begin
           sMens := 'Erro ao Deltar os Lançamentos Externos do Sistema.';
           sMensAPS := sMensAPS + sMens + chr(13) + chr(13);

           Raise Exception.Create(sMens);
        End;


        While (ArquivoTexto.Count <>  iContaLinha)  do
        Begin
           cTipoLanc      := '0';
           sDataLanc      := '';
           sNumDoc        := '';
           sHistorico     := '';
           sHistoCompleto := '';
           sCCustoD       := '';
           sCCusto        := '';
           sContaD        := '';
           sContaC        := '';
           sValor         := '';
           iUnidNegoc     := 0;

           sLinha := ArquivoTexto[iContaLinha];

           iContaLinha := iContaLinha + 1;

           FProgresso  := FProgresso + 1;

           sDataLanc := Trim(copy(sLinha,187,2))+'/'+Trim(copy(sLinha,189,2))+'/'+Trim(copy(sLinha,191,4));
           sDebCre   := Trim(copy(sLinha,12,1));

           if sDebCre = 'D' then
              cTipoLanc := '1';

           sNumDoc    := sDataLanc;
           sHist1     := Contab.RemoveAnyThing(Trim(copy(sLinha,137,40)),#39);
           sHist2     := Contab.RemoveAnyThing(Trim(copy(sLinha,213,40)),#39);
           sHist3     := Contab.RemoveAnyThing(Trim(copy(sLinha,253,40)),#39);
           sHist4     := Contab.RemoveAnyThing(Trim(copy(sLinha,293,40)),#39);
           sHist5     := Contab.RemoveAnyThing(Trim(copy(sLinha,333,40)),#39);
           sHistoCompleto := Trim(sHist1) +' '+ trim(sHist2) +' '+ trim(sHist3) +' '+ trim(sHist4) +' '+ trim(sHist5);

           sValor := Trim(copy(sLinha,195,15));
           if sValor = '' then sValor := '0';
           dValLanc := StrToFloat(sValor)/100;

           sHistorico := Trim(copy(sLinha,132,5));

           If sHistorico <> '' then
           Begin
              If bHistoChecado then
              Begin
                 _cdsHistorico.Data := HistoContab.ListHistoContab(dEmpresa,tohCodigo,sHistorico);
                 If not _cdsHistorico.isEmpty then
                 Begin
                    sMascaraHisto  := Trim(_cdsHistorico.FieldByName('HITDESCR1').asString);
                    sMascaraHisto  := Contab.RemoveMascara(sMascaraHisto);
                    sHistoCompleto := sMascaraHisto + sHistoCompleto;
                 end;
              End;
           End;

           HistoContab.ArrumaHistorico(sHistoCompleto);

           //verifica se o Lançamento é a débito
           If sDebCre = 'D' then
           Begin

             sCCustoD := Trim(copy(sLinha,71,18));
             sContaD  := Trim(copy(sLinha,1,18));

             If sCCustoD <> '' then
             Begin
                If StrToInt(sCCustoD) = 0 then
                Begin
                   sCCustoD := '';
                End;
             End;

             sContaC   := '';
             sDebCre   := 'D';


            _cdsPlanoConta.Data := ContaContabil.ListContas(iPlano,tcAmbasC, True,sContaC);

            Lancamento.lcTipConvOfiDeb   := _cdsPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString;
            Lancamento.lcTipConvGerDeb   := _cdsPlanoConta.FieldByName('PLATIPCONVGER').AsString;
            Lancamento.lcTipConvGe1Deb   := _cdsPlanoConta.FieldByName('PLATIPCONVGEREN1').AsString;
            Lancamento.lcTipConvGe2Deb   := _cdsPlanoConta.FieldByName('PLATIPCONVGEREN2').AsString;

            If trim(sCCustoD) <> '' then
            Begin
              sSql := 'SELECT CODCENTROCUSTO '+
                      'FROM CONTASXCC '  +
                      'WHERE (PLANO = ' + IntToStr(iPlano) + ') AND '+
                      '    (RTRIM(PLACONTA) = '''+sContaD+''' ) AND '+
                      '    (RTRIM(CODCENTROCUSTO) = '''+sCCustoD+ ''') AND '+
                      '    (IDEMPRESA = '+ FloatToStr(dEmpresa) + ') ';

              _cdsContasxCC.Data := GetDataPacket(sSql);

              If _cdsContasxCC.isEmpty then
              Begin

                 sSql := 'INSERT INTO CONTASXCC '+
                         '  (PLANO, PLACONTA, CODCENTROCUSTO, IDEMPRESA, IDUSUARIOINCLUSAO) '+
                         '  VALUES (''' + IntToStr(iPlano) + ''',''' + sContaD + ''',''' + sCCustoD + ''',''' + FloatToStr(dEmpresa) +
                                    ''',''' + IntToStr(iUsuario) + ')';

                 Result := ExecSql(sSql);
                 If Not Result Then
                 Begin
                   sMens := 'Importação Não Realizada. Erro de Inclusão na Tabela ContasxCC.';
                   sMensAPS := sMensAPS + sMens + chr(13) + chr(13);

                   Raise Exception.Create(sMens);
                 End;
              End;

            End;
            iSubContaD  := 0;
            iSubContaC  := 0;
           End Else
           Begin
              sCCustoD  := '';
              sContaD   := '';
              sCCustoC  := Trim(copy(sLinha,71,18));
              sContaC   := Trim(copy(sLinha,1,18));
              cTipoLanc := '1';
              sDebCre   := 'C';

              sSql := 'SELECT CODCENTROCUSTO '+
                       'FROM CONTASXCC '  +
                       'WHERE (PLANO = ' + IntToStr(iPlano) + ') AND '+
                       '    (RTRIM(PLACONTA) = '''+sContaC+''' ) AND '+
                       '    (RTRIM(CODCENTROCUSTO) = '''+sCCustoC+ ''') AND '+
                       '    (IDEMPRESA = '+ FloatToStr(dEmpresa) + ') ';

              _cdsContasxCC.Data := GetDataPacket(sSql);

              Lancamento.lcTipConvOfiCre   := _cdsPlanoConta.FieldByName('PLATIPCONVOFICIAL').AsString;
              Lancamento.lcTipConvGerCre   := _cdsPlanoConta.FieldByName('PLATIPCONVGER').AsString;
              Lancamento.lcTipConvGe1Cre   := _cdsPlanoConta.FieldByName('PLATIPCONVGEREN1').AsString;
              Lancamento.lcTipConvGe2Cre   := _cdsPlanoConta.FieldByName('PLATIPCONVGEREN2').AsString;

              If _cdsContasxCC.isEmpty then
              Begin

                 sSql := 'INSERT INTO CONTASXCC '+
                         '  (PLANO, PLACONTA, CODCENTROCUSTO, IDEMPRESA, IDUSUARIOINCLUSAO) '+
                         '  VALUES (''' + IntToStr(iPlano) + ''',''' + sContaC + ''',''' + sCCustoC + ''',''' + FloatToStr(dEmpresa) +
                                    ''',''' + IntToStr(iUsuario) + ')';

                 Result := ExecSql(sSql);
                 If Not Result Then
                 Begin
                   sMens := 'Importação Não Realizada. Erro de Inclusão na Tabela ContasxCC.';
                   sMensAPS := sMensAPS + sMens + chr(13) + chr(13);

                   Raise Exception.Create(sMens);
                 End;
              End;
              iSubContaD := 0;
              iSubContaC := 0;
           End;

           If iSubContaD <> 0 then
           Begin

              _cdsSubConta.Data := SubConta.ListSubConta(dEmpresa,iSubContaD);

              If _cdsSubConta.IsEmpty then
              Begin
                 sMens := 'Sub-Conta a Débito '+IntToStr(iSubContaD)+' Inválida';
                 sMensAPS := sMensAPS + sMens + chr(13) + chr(13);

                 Raise Exception.Create(sMens);
              End;
           End;

           If iSubContaC = 0 then
           Begin
              _cdsSubConta.Data := SubConta.ListSubconta(dEmpresa,iSubContaC);

              If _cdsSubConta.IsEmpty then
              Begin
                 sMens := 'Sub-Conta a Crédito '+IntToStr(iSubContaC)+' Inválida';
                 sMensAPS := sMensAPS + sMens + chr(13) + chr(13);

                 Raise Exception.Create(sMens);
              End;
           End;

           //*** insere os lancamentos ***
           Lancamento.lcTestaConta := bTestaConta;
           If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                      iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                      0,0,dPlnCodigo,0,
                                      sDataLanc,sNumDoc,HistoContab.Hist1,
                                      HistoContab.Hist2,HistoContab.Hist3,
                                      HistoContab.Hist4,HistoContab.Hist5,
                                      sTipoOper,sCCustoD,sContaD,
                                      sCCustoC,sContaC,sHistorico,
                                      dValLanc,False,bUsaPPatro) Then

           Begin
              sMensAPS := sMensAPS + Lancamento.MessageInfo + chr(13);
              Raise Exception.Create(Lancamento.MessageInfo);
           End Else
           Begin
              dPlnCodigo := Lancamento.RetornoPlnCodigo;
           End;

           _cdsPlanilha.Data := Planilha.ListPlanilhas(0,dPlnCodigo);

           If dPlnCodigo <> dPlnCodigo2 then
           Begin
               sMens := 'Planilha: '+IntToStr(_cdsPlanilha.FieldByName('PLNPLANIL').asInteger) + ' em: ' + sDataLanc;
               sMensAPS_Log := sMensAPS_Log + sMens + chr(13);
               dPlnCodigo2 := dPlnCodigo;
           End;

        End;

        Commit;
        sMens := 'Importação da Folha Dinâmica efetuada com sucesso!';
        MessageInfo := sMens;
        sMensAPS := sMensAPS + sMens + chr(13);
        Result := True;
        CloseFile(ArquivoLog);
        DecimalSeparator := cAuxDec;
        _cdsSubConta.free;
        _cdsPlanoConta.free;
        _cdsHistorico.free;
        _cdsPlanilha.free;

     Except
       on E:Exception Do
       Begin
          _cdsSubConta.free;
          _cdsPlanoConta.free;
          _cdsHistorico.free;
          _cdsPlanilha.free;

          Result := False;
          DecimalSeparator := cAuxDec;

          RollBack;
          Writeln(ArquivoLog,'Houve erros na importação na linha '+IntToStr(iContaLinha));
          CloseFile(ArquivoLog);

          sMens := 'Houve erros na importação. ' + CHR(13) + CHR(13) +
                   'A linha nº ' + IntToStr(iContaLinha) + ' do arquivo importado está com problemas.'+
                   'O estado anterior do Banco de Dados foi retornado. ' + CHR(13) +
                   'Verifique os Lançamentos com inconsistências.';

          sMensAPS := sMensAPS + sMens + chr(13);

          MessageInfo := sMens+' '+E.Message;

       End;
     End;
 End;
end;

function TCtrlProcessaContab.ImportaSRH(ArquivoTexto: TStringList;
  sTipoOper, sCaminho,sAtivProj: string; iModulo, iUsuario, iPlano,
  iContMax: Integer; dNumColunas,dEmpresa: Double; bUsaPPatro: Boolean): Boolean;

var
  iAno, iMes   : Word;

  ArquivoLog : TextFile;
  cTipoLanc,cAuxDec :Char;
  sCCusto,sCCustoD,sCCustoC :String;
  iContaLinha  : LongInt;
  sHistorico,sHistoCompleto,sContaC,sContaD,sNumDoc :String;
  sMens, sLinha,sSql,sValor,sDataLanc, sCodEvento :String;
  dPlnCodigo,dValLanc,dDataLanc :Double;

  iSubContaD,iSubContaC,iUnidNegoc,J :Integer;

  _cdsHistorico    :TClientDataSet;
  _cdsEventoSRH    :TClientDataSet;
  _cdsUnidNegoc    :TClientDataSet;
  _cdsCentroCusto  :TClientDataSet;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ImportaSRH(StringlistToVariant(ArquivoTexto),
                            sTipoOper, sCaminho,sAtivProj,iModulo, iUsuario, iPlano,
                            iContMax,dNumColunas,dEmpresa, bUsaPPatro,FsMensAPS);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
      Begin
         FsMensAPS     := Connection.AppServer.MessageInfo;
      End;

   End Else
   Begin
     FProgresso   := 0;
     sMens        := '';
     sMensAPS_Log := '';
     sMensAPS     := '';
     iContaLinha  := 0;
     sLinha       := '';
     sSql         := '';
     dPlnCodigo   := 0;

     cAuxDec           := DecimalSeparator;
     DecimalSeparator  := '.';
     Result := True;


     _cdsEventoSRH   := TClientDataSet.Create(nil);
     _cdsUnidNegoc   := TClientDataSet.Create(nil);
     _cdsHistorico   := TClientDataSet.Create(nil);
     _cdsCentroCusto := TClientDataSet.Create(nil);

     If Not Contab.SelecionaParametrosProc(dEmpresa) Then
     Begin
        Result      := False;
        MessageInfo := Contab.MessageInfo;
        sMensAPS    := MessageInfo + chr(13) + chr(13);
        Exit;
     End;

     AssignFile(ArquivoLog,Copy(Trim(sCaminho),1,Pos('.',Trim(sCaminho)))+ 'LOG');
     ReWrite(ArquivoLog);

     sLinha := ArquivoTexto[0];

     //Verifica se a formatação está correta
     if Length(sLinha) <> dNumColunas then
     Begin
       MessageInfo := 'Arquivo texto com formato incompatível';
       sMensAPS := sMensAPS + MessageInfo + chr(13) + chr(13);

       Result := False;
       CloseFile(ArquivoLog);
       Exit;
     End;


     Try
        StartTransaction;
        While (ArquivoTexto.Count <>  iContaLinha)  do
        Begin

           sDataLanc      := '';
           sNumDoc        := '';
           sHistorico     := '';
           sHistoCompleto := '';
           sCCustoD       := '';
           sCCusto        := '';
           sContaD        := '';
           sContaC        := '';
           sValor         := '';

           sLinha := ArquivoTexto[iContaLinha];

           iContaLinha := iContaLinha + 1;

           FProgresso  := FProgresso + 1;

           iAno := StrToInt(Copy(sLinha, 1, 4));
           iMes := StrToInt(Copy(sLinha, 5, 2));

           dDataLanc := DiasUteis.UltDiaMes(iAno,iMes);
           sDataLanc := DateToStr(dDataLanc);
           sNumDoc := Trim(Copy(sLinha, 14, 3))+' - '+IntToStr(iMes) + '/' + IntToStr(iAno);

           //=== pega dados da tabela Evento ===
           _cdsEventoSRH.Data := EventoSRH.ListEventoSRH(dEmpresa,Trim(Copy(sLinha, 14, 3)));

           If _cdsEventoSRH.IsEmpty then
           Begin
              sMens :='Evento '+Trim(Copy(sLinha, 14, 3))+'Não cadastrado no Cadastro de Eventos.';
              sMensAPS := sMensAPS + sMens + chr(13) + chr(13);
              WriteLn(ArquivoLog,sMens);
              Raise Exception.Create(sMens);
           End;

           sContaD := _cdsEventoSRH.FieldByName('CONTADEB').AsString;
           sContaC := _cdsEventoSRH.FieldByName('CONTACRE').AsString;
           sValor  := Trim(Copy(sLinha, 18, 13));

           if sValor = '' then
              sValor := '0';

           dValLanc   := StrToFloat(sValor);

           if _cdsEventoSRH.FieldByName('UNIDNEGOC').isNull then
              iUnidNegoc := 0
           else
              iUnidNegoc := StrToInt(_cdsEventoSRH.FieldByName('UNIDNEGOC').AsString);


           If iUnidNegoc = 0 then
           Begin
              If sAtivProj = '' then
              Begin
                 _cdsUnidNegoc.Data := ListTerceiros.ListAtivProj(dEmpresa,iUnidNegoc,' ',tapAmbos,toapCodigo);

                 If _cdsUnidNegoc.IsEmpty then
                 Begin
                    iUnidNegoc := 0
                 End Else
                 Begin
                    iUnidNegoc := StrToInt(_cdsUnidNegoc.FieldByName('UNIDNEGOC').asString);
                 End;
              End Else
              Begin
                 iUnidNegoc := StrToInt(sAtivProj);
              End;
           End;

           sHistoCompleto := 'Folha de Pagamento do Mes '+IntToStr(iMes) + '/' + IntToStr(iAno)+' Ref. '+_cdsEventoSRH.FieldByName('DESCRICAO').AsString;
           HistoContab.ArrumaHistorico(sHistoCompleto);

           If not _cdsEventoSRH.FieldByName('HITCODHIST').isNull then
           Begin
              sHistorico :=_cdsEventoSRH.FieldByName('HITCODHIST').AsString;

              _cdsHistorico.Data := HistoContab.ListHistoContab(dEmpresa,tohCodigo,sHistorico);

              If not _cdsHistorico.IsEmpty then
              Begin
                sHistoCompleto := Trim(_cdsHistorico.FieldByName('HITDESCR1').asString) + ' ref. ' +IntToStr(iMes) + '/' + IntToStr(iAno);
                HistoContab.ArrumaHistorico(sHistoCompleto);
              End Else
              Begin
                sHistorico := '';
              End;
           End;
           sCodEvento :=  Trim(Copy(sLinha, 14, 3));
           sSql := 'SELECT CODCENTROCUSTO FROM CENTCUST '+
                   'WHERE (RTRIM(CODREDUZIDO) = ''' + sCodEvento + ''' ) '+
                   '  AND (IDEMPRESA = '+ FloatToStr(dEmpresa) + ')';

           _cdsCentroCusto.Data := GetDataPacket(sSql);

           if not _cdsCentroCusto.IsEmpty then
              sCCustoD := _cdsCentroCusto.FieldByName('CODCENTROCUSTO').AsString;

           sCCustoC := sCCustoD;
           Val(sValor, dValLanc, J);

           cTipoLanc := '2';

           If sCCustoD <> '' then
           Begin
              if StrToInt(sCCustoD) = 0 then
                 sCCustoD := '';
           End;

           If sCCustoC <> '' then
           Begin
             if StrToInt(sCCustoC) = 0 then
               sCCustoC := '';
           End;

           If _cdsEventoSRH.FieldByName('SUBCONTADEB').AsString = '' Then
               iSubcontaD := 0
           Else
               iSubcontaD := StrToInt(_cdsEventoSRH.FieldByName('SUBCONTADEB').AsString);

           If _cdsEventoSRH.FieldByName('SUBCONTACRE').AsString = '' Then
               iSubcontaC := 0
           Else
              iSubcontaC := StrToInt(_cdsEventoSRH.FieldByName('SUBCONTACRE').AsString);


           //Faz o Lançamento Contábil
           If dValLanc <> 0 then
           Begin
              Lancamento.lcTestaConta := False;
              If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                         iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                         0,0,dPlnCodigo,0,
                                         sDataLanc,sNumDoc,HistoContab.Hist1,
                                         HistoContab.Hist2,HistoContab.Hist3,
                                         HistoContab.Hist4,HistoContab.Hist5,
                                         sTipoOper,sCCustoD,sContaD,
                                         sCCustoC,sContaC,sHistorico,
                                         dValLanc,False,bUsaPPatro) Then

              Begin
                 sMensAPS := sMensAPS + Lancamento.MessageInfo + chr(13);
                 Raise Exception.Create(Lancamento.MessageInfo);
              End Else
              Begin
                 dPlnCodigo := Lancamento.RetornoPlnCodigo;
              End;
           End;
       End;

       Commit;
       CloseFile(ArquivoLog);
       _cdsEventoSRH.free;
       _cdsUnidNegoc.free;
       _cdsHistorico.free;
       _cdsCentroCusto.free;

     Except
       on E:Exception Do
       Begin

          _cdsEventoSRH.free;
          _cdsUnidNegoc.free;
          _cdsHistorico.free;
          _cdsCentroCusto.free;

          Result := False;
          DecimalSeparator := cAuxDec;

          RollBack;
          Writeln(ArquivoLog,'Houve erros na importação na linha '+IntToStr(iContaLinha));
          CloseFile(ArquivoLog);

          sMens := 'Houve erros na importação. ' + CHR(13) + CHR(13) +
                   'A linha nº ' + IntToStr(iContaLinha) + ' do arquivo importado está com problemas.'+
                   'O estado anterior do Banco de Dados foi retornado. ' + CHR(13) +
                   'Verifique os Lançamentos com inconsistências.';

          sMensAPS := sMensAPS + sMens + chr(13);

          MessageInfo := sMens+' '+E.Message;

       End;
     End;
 End;

end;

function TCtrlProcessaContab.ImportaLancamentos(ArquivoTexto:TStringList;dEmpresa:Double;
                   iPlano,iUsuario,iModulo,iNumCommit:Integer; sTipoOper,
                   sCaminho:string;bTestaConta,bHistCheked,bUsaPPatro:Boolean) : Boolean;
var
  sLinha,sValor,sMens,sDataLanc,sContaD,sContaC,sCCustD,sCCustC :string;
  sHistCompleto, sMascaraHist,sDebCre,sSql,sNumDoc :string;

  sHist1,sHist2,sHist3,sHist4,sHist5,sHistorico :string;

  dValLanc,dPlnCodigo,dPlnCodigo2,dPlanilha :Double;
  iContaLinha,iContaCommit,iSubContaC,iSubContaD,iPatro,iUnidNegoc, iPlanPrev  :integer;

  ArquivoLog : TextFile;

  Auxdec,sTipoLanc : char;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ImportaLancamentos(StringlistToVariant(ArquivoTexto),
                                dEmpresa,iPlano,iUsuario,iModulo,iNumCommit, sTipoOper,
                                sCaminho,bTestaConta,bHistCheked,bUsaPPatro,FsMensAPS,FsMensAPS_Log);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
      Begin
         FsMensAPS     := Connection.AppServer.MessageInfo;
         FsMensAPS_Log := Connection.AppServer.MessageInfo2;
      End;

   End Else
   Begin
       //Inicializa as variáveis

       AuxDec           := DecimalSeparator;
       iContaLinha      := 0;
       FProgresso       := 0;
       dPlnCodigo2      := 0;
       DecimalSeparator := '.';
       sMens            := '';
       sMensAPS         := '';
       sMensAPS_Log     := '';
       iContaCommit     := 0;
       dPlanilha := 0;

       AssignFile(ArquivoLog,Copy(Trim(sCaminho),1,Pos('.',Trim(sCaminho)))+ 'LOG');
       ReWrite(ArquivoLog);

       sLinha := ArquivoTexto[0];

       //Verifica se a formatação está correta
       If (length(sLinha) <> 391) and (length(sLinha) <> 411) and
          (length(sLinha) <> 392) and (length(sLinha) <> 412) Then
       Begin
         MessageInfo := 'Arquivo texto com formato incompatível';
         Result := False;
         CloseFile(ArquivoLog);
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


       //Loop de Varredura do Arquivo Texto
       While (ArquivoTexto.Count <>  iContaLinha)  do
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
             If ((iContaLinha Mod iNumCommit) = 0) Then
                StartTransaction;

             sLinha := ArquivoTexto[iContaLinha];

             iContaLinha := iContaLinha + 1;

             FProgresso  := FProgresso + 1;

             sDataLanc := Trim(copy(sLinha,1,10));

             sDebCre   := Trim(copy(sLinha,12,1));
             sNumDoc   := Trim(copy(sLinha,14,15));
             sHist1    := Contab.RemoveAnyThing(Trim(copy(sLinha,29, 40)),#39);
             sHist2    := Contab.RemoveAnyThing(Trim(copy(sLinha,69, 40)),#39);
             sHist3    := Contab.RemoveAnyThing(Trim(copy(sLinha,109,40)),#39);
             sHist4    := Contab.RemoveAnyThing(Trim(copy(sLinha,149,40)),#39);
             sHist5    := Contab.RemoveAnyThing(Trim(copy(sLinha,189,40)),#39);

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
                     sMascaraHist  := Contab.RemoveAnyThing(sMascaraHist,#35);
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
                      dPlnCodigo := Lancamento.RetornoPlnCodigo;
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
                      dPlnCodigo := Lancamento.RetornoPlnCodigo;
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


                Lancamento.lcOriAplDeb  := Trim(copy(sLinha,13,1));

                sValor := Trim(copy(sLinha,274,17));
                If sValor = '' Then sValor := '0';
                   Lancamento.lcValOfiDeb := StrToFloat(sValor);

                sValor := Trim(copy(sLinha,291,17));
                If sValor = '' Then sValor := '0';
                Lancamento.lcValGerDeb := StrToFloat(sValor);

                sValor := Trim(copy(sLinha,308,17));
                If sValor = '' Then sValor := '0';
                Lancamento.lcValGe1Deb := StrToFloat(sValor);

                sValor := Trim(copy(sLinha,325,17));
                If sValor = '' Then sValor := '0';
                Lancamento.lcValGe2Deb := StrToFloat(sValor);


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
                   Lancamento.lcValHisDeb := StrToFloat(sValor);

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

                Lancamento.lcOriAplCre   := Trim(copy(sLinha,13,1));

                sValor := Trim(copy(sLinha,274,17));
                If sValor = '' Then sValor := '0';
                Lancamento.lcValOfiCre := StrToFloat(sValor);

                sValor     := Trim(copy(sLinha,291,17));
                If sValor  = '' Then sValor := '0';
                Lancamento.lcValGerCre := StrToFloat(sValor);

                sValor := Trim(copy(sLinha,308,17));
                If sValor = '' Then sValor := '0';
                Lancamento.lcValGe1Cre := StrToFloat(sValor);

                sValor := Trim(copy(sLinha,325,17));
                If sValor = '' Then sValor := '0';
                Lancamento.lcValGe2Cre := StrToFloat(sValor);

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
                   Lancamento.lcValHisCre := StrToFloat(sValor);

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
                   sMensAPS := sMensAPS + sMens + chr(13);

                   Raise Exception.Create(sMens);
                End;
             End;

             If iSubContaC <> 0 Then
             Begin
                _cds.Data := SubConta.ListSubConta(dEmpresa,iSubContaC);

                If _cds.IsEmpty Then
                Begin
                   sMens := 'Sub-Conta a Crédito '+IntToStr(iSubContaC)+' Inválida';
                   sMensAPS := sMensAPS + sMens + chr(13);

                   Raise Exception.Create(sMens);
                End;
             End;

             //*** insere os lancamentos ***
             Lancamento.lcTestaConta := bTestaConta;
             If Not Lancamento.InsereLancaContab (sTipoLanc,dEmpresa,iModulo,iUsuario,
                                      iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                      iPlanPrev, iPatro,dPlnCodigo,0,
                                      sDataLanc,sNumDoc,sHist1,sHist2,sHist3,
                                      sHist4,sHist5,sTipoOper,sCCustD,sContaD,
                                      sCCustC,sContaC,sHistorico,
                                      dValLanc,False,bUsaPPatro) Then

             Begin
               sMensAdd := sMensAdd + MessageInfo + chr(13);
               Raise Exception.Create(sMens);
             End Else
             Begin
                 dPlnCodigo := Lancamento.RetornoPlnCodigo;
             End;

             _cds.Data := Planilha.ListPlanilhas(0,dPlnCodigo);

             If dPlnCodigo <> dPlnCodigo2 Then
             Begin
                sMens := IntToStr(_cds.FieldByName('PLNPLANIL').asInteger) + ' em: ' + sDataLanc;
                sMensAPS_Log := sMensAPS_Log + sMens + chr(13);
                dPlnCodigo2 := dPlnCodigo;
             End;

             If ((iContaLinha Mod iNumCommit) = 0)  Then
             Begin
                Commit;
                iContaCommit := iContaLinha;
             End;
          Except
             RollBack;
             sMens :='Houve erros na importação. ' + CHR(13) + CHR(13) +
                     'A linha nº ' + IntToStr(iContaLinha) + ' do arquivo importado está com problemas.'+ CHR(13) +
                     'Foi importado até a linha nº ' + IntToStr(iContaCommit) +'.'+ CHR(13) +
                     'Apague do seu TXT as linhas já importadas. ' + CHR(13) +
                     'Verifique os Lançamentos com inconsistências.';
             Result := False;
             Exit;
          End;
          Commit;

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
       CloseFile(ArquivoLog);
       DecimalSeparator := AuxDec;

   End;
end;

Function TCtrlProcessaContab.ImportaDadosRM(ArqTexto:TStringList;dEmpresa:Double;iPlano,iModulo,
                   iUsuario,rgVersao:Integer;sTipoOper,sAtivProj,Caminho:string;bUsaPPatro:Boolean):Boolean;
var
 ArquivoLog  :TextFile;
 dValLanc, dPlnCodigo  :Double;
 iContaLinha,J,iUnidNegoc,iSubcontaD, iSubcontaC :Integer;
 sMens, sValor,sDataLanc, sDebCre,sHistorico : string;

 sHist1, sHist2, sHist3, sHist4, sHist5,sSql,sLinha,sHistoPadrao :string;
 sCCustd, sContaC,sContaD, sCCustc, sNumDoc :string;

 sTipoLanc,  AuxDec : Char;

 cdsConta :TClientDataSet;
 cdsContasxCC :TClientDataSet;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ImportaDadosRM(StringlistToVariant(ArqTexto),
                                     dEmpresa,iPlano,iModulo,iUsuario,rgVersao,sAtivProj,
                                     Caminho,bUsaPPatro,FContaLinhaTexto,FLinhaTexto);

      If Not Result Then
      Begin
         MessageInfo := 'Houve erros na importação. ' + CHR(13) +
                        'Linha da Planilha: ' +  Connection.AppServer.MessageInfo + CHR(13) + CHR(13) +
                        'O estado anterior do Banco de Dados foi retornado. ' + CHR(13) +
                        'Verifique os Lançamentos com inconsistências.' + chr(13);
      End;
   End Else
   Begin
     cdsConta     := TClientDataSet.Create(nil);
     cdsContasxCC := TClientDataSet.Create(nil);

     AssignFile(ArquivoLog, Copy(Trim(Caminho), 1, Pos('.', Trim(Caminho))) + 'LOG');
     ReWrite(ArquivoLog);
     AuxDec := DecimalSeparator;
     DecimalSeparator := '.';

     iContaLinha  := 0;
     FProgresso   := 1;
     MessageInfo  := '*';
     dPlnCodigo   := 0;
     iUnidNegoc   := 0;

     StartTransaction;

     //*** Deleta os lançamentos contábeis externos ***
     Try
       StartTransaction;
       sSql := 'DELETE FROM LANCONTABEXTERNOS';
       ExecSQL(sSql);
       Commit;
     Except
       Rollback;
     End;

     Try
         While (ArqTexto.Count <> iContaLinha) do
         Begin
              sDataLanc  := '';
              sTipoLanc  := '0';
              sDebCre    := '';
              sNumDoc    := '';
              sHist1     := '';
              sHist2     := '';
              sHist3     := '';
              sHist4     := '';
              sHist5     := '';
              sValor     := '';
              sHistorico := '';
              sCCustD    := '';
              sContaD    := '';
              sContaC    := '';
              iSubcontaD := 0;
              iSubcontaC := 0;
              sDebCre    := '';
              sValor     := '';

              sLinha := ArqTexto[iContaLinha];

              FProgresso := FProgresso + 1;

              iContaLinha      := iContaLinha + 1;
              FContaLinhaTexto := iContaLinha;

              sDataLanc := Contab.RemoveAnyThing(Trim(Copy(sLinha, 1, 8)),#39);

              sDataLanc := Copy(sDataLanc, 1, 2) + '/' + Copy(sDataLanc, 3, 2) + '/' + Copy(sDataLanc, 5, 4);

              sNumDoc   := Contab.RemoveAnyThing(Trim(Copy(sLinha,  9,  8)),#39);
              sContaD   := Contab.RemoveAnyThing(Trim(Copy(sLinha, 17, 18)),#39);
              sContaC   := Contab.RemoveAnyThing(Trim(Copy(sLinha, 37, 18)),#39);
              sValor    := Contab.RemoveAnyThing(Trim(Copy(sLinha, 77, 18)),#39);

              If sValor = '' Then
                 sValor := '0';

              dValLanc := StrToFloat(sValor);

              If sAtivProj  = '' Then  // verificar com Rosane se é para pegar o primeiro
              Begin
                 _cds.Data := ListTerceiros.ListAtivProj(dEmpresa,0,'',tapAmbos,toapCodigo);

                 If _cds.isEmpty Then
                   iUnidNegoc := 0
                 Else
                   iUnidNegoc := StrToInt(_cds.FieldByName('UNIDNEGOC').AsString);
              End;

              sHist1    := Contab.RemoveAnyThing(Trim(copy(sLinha,103,40)),#39);
              sHist2    := Contab.RemoveAnyThing(Trim(copy(sLinha,143,40)),#39);
              sHist3    := Contab.RemoveAnyThing(Trim(copy(sLinha,183,40)),#39);
              sHist4    := Contab.RemoveAnyThing(Trim(copy(sLinha,223,40)),#39);
              sHist5    := Contab.RemoveAnyThing(Trim(copy(sLinha,263,23)),#39);

              sHistorico := Contab.RemoveAnyThing(Trim(Copy(sLinha, 99, 4)),#39);

              If sHistorico <> '' Then
              Begin
                 _cds.Data := HistoContab.ListHistoContab(dEmpresa,tohCodigo,sHistorico);

                 If not _cds.isEmpty Then
                 Begin
                   sHistoPadrao := Trim(_cds.FieldByName('HITDESCR1').asString) + ' ' + Trim(sHist1) +
                     ' ' + Trim(sHist2) + ' ' + Trim(sHist3) + ' ' + Trim(sHist4) + ' ' + Trim(sHist5);

                  HistoContab.ArrumaHistorico(sHistoPadrao);
                  sHist1:=HistoContab.Hist1;
                  sHist2:=HistoContab.Hist2;
                  sHist3:=HistoContab.Hist3;
                  sHist4:=HistoContab.Hist4;
                  sHist5:=HistoContab.Hist5;

                 End Else
                 Begin
                   sHistorico := '';
                 End;
              End;

              If rgVersao = 0 then
                 sCCustD := Contab.RemoveAnyThing(Trim(Copy(sLinha, 292, 10)),#39)
              Else
                 sCCustD := Contab.RemoveAnyThing(Trim(Copy(sLinha, 294, 10)),#39);

              sCCustC := sCCustD;

              Val(sValor, dValLanc, J);
              If (sContaD = '') And (sContaC <> '') Then
              Begin
                sTipoLanc := '1';
                sDebCre   := 'C';
                FLinhaTexto := 'Tipo de Lançamento: ' + sTipoLanc +
                               ' Conta Contábil: ' + sContaC;
              End;

              If (sContaC = '') And (sContaD <> '') Then
              Begin
                sTipoLanc := '0';
                sDebCre   := 'D';
                FLinhaTexto := 'Tipo de Lançamento: ' + sTipoLanc +
                               ' Conta Contábil: ' + sContaD;
              End;

              if (sContaC <> '') and (sContaD <> '') Then
              Begin
                sTipoLanc := '2';
                sDebCre := 'D';
                FLinhaTexto := 'Tipo de Lançamento: ' + sTipoLanc +
                               ' Conta Contábil: ' + sContaC + '/' + sContaD;

              end;

              If sCCustD <> '' Then
              Begin
                 If StrToInt(sCCustD) = 0 Then
                    sCCustD := '';
              End;

              If sCCustC <> '' Then
              Begin
                If StrToInt(sCCustC) = 0 Then
                  sCCustC := '';
              End;

             { sMens := '';
              TestaPeriodo(True, 'BaseDados', sDataLanc, '2', liExercicio, liPeriodo, liEmpresa, sMens);
              if sMens <> '' then begin
                 MsgDlg(sMens, 'Aviso', mtWarning,[mbOK], 0);
                 mmTxt.Lines.Add(sMens);
              end;       }

              // *** Valores a Débito ***
              If sContaD <> '' Then
              Begin
                 sSql := 'SELECT PLACONTA, PLANOME, PLATIPO, PLATIPCONVGER, ' +
                         'PLATIPCONVGEREN1, PLATIPCONVGEREN2, PLATIPCONVOFICIAL, ' +
                         'PLAALTERA, PLAINATIVA, PLANATUREZA, PLANO, PLACCUST, ' +
                         'PLAMOEDAHISTORICA, PLASUBCONTA, PLAGRUPO, PLAMUTACOES, ' +
                         'PLATIPCONVOFICIAL, PLATIPCONVGER, PLATIPCONVGEREN1, PLATIPCONVGEREN2 ' +
                         'FROM PLANOCONTA '+
                         'WHERE '+
                         '  RTRIM(PLACONTA) = ''' + Trim(sContaD) + ''' AND ' +
                         '  PLANO  = '+ IntToStr(iPlano);

                 cdsConta.Data := GetDataPacket(sSql);

                 If cdsConta.FieldByName('PLACCUST').asString = 'S' Then
                 Begin
                    If Trim(sCCustD) <> '' Then
                    Begin
                       sSql := 'SELECT CODCENTROCUSTO FROM CONTASXCC ' +
                               'WHERE (PLANO  = '+ IntToStr(iPlano) + ' AND ' +
                               '      (RTRIM(PLACONTA) = ''' + Trim(sContaD) + ''' AND ' +
                               '      (RTRIM(CODCENTROCUSTO) = ''' + Trim(sCCustD) + ''' AND ' +
                               '      (IDEMPRESA = ' + FloatToStr(dEmpresa);

                       cdsContasxCC.data := GetDataPacket(sSql);
                       If cdsContasxCC.IsEmpty Then
                       Begin
                          sSql := 'INSERT INTO CONTASXCC '+
                                  '(PLANO,PLACONTA,CODCENTROCUSTO,IDEMPRESA,IDUSUARIOINCLUSAO) '+
                                  'VALUES (';
                          sSql := sSql + IntToStr(iPlano) + ',' + QuotedStr(sContaD) + ','+
                                         QuotedStr(sCCustD) + ',' + FloatToStr(dEmpresa) + ',' +
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
                 End;

              End;

              // *** Valores a Crédito ***
              If sContac <> '' Then
              Begin
                 sSql := 'SELECT PLACONTA, PLANOME, PLATIPO, PLATIPCONVGER, ' +
                         'PLATIPCONVGEREN1, PLATIPCONVGEREN2, PLATIPCONVOFICIAL, ' +
                         'PLAALTERA, PLAINATIVA, PLANATUREZA, PLANO, PLACCUST, ' +
                         'PLAMOEDAHISTORICA, PLASUBCONTA, PLAGRUPO, PLAMUTACOES, ' +
                         'PLATIPCONVOFICIAL, PLATIPCONVGER, PLATIPCONVGEREN1, PLATIPCONVGEREN2 ' +
                         'FROM PLANOCONTA '+
                         'WHERE '+
                         '  RTRIM(PLACONTA) = ''' + Trim(sContaC) + ''' AND ' +
                         '  PLANO  = '+ IntToStr(iPlano);

                 cdsConta.Data := GetDataPacket(sSql);

                 If cdsConta.FieldByName('PLACCUST').asString = 'S' Then
                 Begin
                    If Trim(sCCustC) <> '' Then
                    Begin
                       sSql := 'SELECT CODCENTROCUSTO FROM CONTASXCC ' +
                               'WHERE (PLANO  = '+ IntToStr(iPlano) + ' AND ' +
                               '      (RTRIM(PLACONTA) = ''' + Trim(sContaC) + ''' AND ' +
                               '      (RTRIM(CODCENTROCUSTO) = ''' + Trim(sCCustC) + ''' AND ' +
                               '      (IDEMPRESA = ' + FloatToStr(dEmpresa);

                       cdsContasxCC.data := GetDataPacket(sSql);
                       If cdsContasxCC.IsEmpty Then
                       Begin
                          sSql := 'INSERT INTO CONTASXCC '+
                                  '(PLANO,PLACONTA,CODCENTROCUSTO,IDEMPRESA,IDUSUARIOINCLUSAO) '+
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
                 End;
              End;

              // *** Faz o Lançamento Contábil ***
             If Lancamento.InsereLancaContab(sTipoLanc,dEmpresa,iModulo,iUsuario,
                                  iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                  0, 0,dPlnCodigo,0, sDataLanc,sNumDoc,
                                  sHist1,sHist2,sHist3,sHist4,sHist5,sTipoOper,
                                  sCCustD,sContaD,sCCustC,sContaC,sHistorico,
                                  dValLanc,False,bUsaPPatro) Then

             Begin
                 dPlnCodigo := Lancamento.RetornoPlnCodigo;
             End Else
             Begin
                sMens       := MessageInfo;
                FLinhaTexto := MessageInfo;
                RollBack;
                Result := False;
                Exit;
             End;
         End;
         Commit;
         Result := True;
     Except
        on E:Exception Do
        Begin
           RollBack;
           DecimalSeparator := AuxDec;
           Result := False;
           MessageInfo := sMens+' '+E.Message;
        End;
     End;
     cdsConta.free;
     cdsContasxCC.free;
   End;

end;

Function TCtrlProcessaContab.ImportaFidelio(ArqDiarias,ArqLanc:OleVariant;dEmpresa,dHotel:Double;iPlano,
                                        iUsuario:Integer;Caminho:String;dtDataIni,dtDataFim:TDateTime;
                                        bUsaPPatro:Boolean): Boolean;
var
  sDataInv, sSql, sMens, sCodDC, sDataLanc:String;
  iAno,iMes,iDia : Word;
  dValorLanc,dPlnCodigo : Double;
  cdsDiarias     : TClientDataSet;
  cdsLancamentos : TClientDataSet;

Begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ImportaFidelio(ArqDiarias,ArqLanc,dEmpresa,dHotel,iPlano,
                                  iUsuario,Caminho,dtDataIni,dtDataFim,bUsaPPatro,FCodDC);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo

   End Else
   Begin
      cdsDiarias     := TClientDataSet.Create(nil);
      cdsLancamentos := TClientDataSet.Create(nil);

      cdsDiarias.Data     := ArqDiarias.Data;
      cdsLancamentos.Data := ArqLanc.Data;

      FProgresso     := 0;
      FMaxProgresso  := 0;
      MessageInfo    := '*';

      Try
          StartTransaction;

          sSql := 'UPDATE PARAMCONTAB SET CAMINHOFIDELIO = '''+Trim(Caminho)+''' ' +
                  'WHERE IDPESSOA = '+FloatToStr(dEmpresa);
          ExecSQL(sSql);
          Commit;
      Except
         RollBack;
      End;


      If (cdsLancamentos.IsEmpty) then
      Begin
         MessageInfo := 'Não existe nenhum lançamento pendente de contabilização no Período indicado.';
         Result := False;
         Exit;
      End;


      MessageInfo   := 'Lançamento da Receita e do Caixa';

      FMaxProgresso := cdsLancamentos.RecordCount;

      DecodeDate(dtDataIni,iAno,iMes,iDia);
      sDataInv := Contab.CompletaZero(IntToStr(iAno),4)+Contab.CompletaZero(IntToStr(iMes),2)+Contab.CompletaZero(IntToStr(iDia),2);

      Try
           StartTransaction;
           dPlncodigo := 0;
           sDataLanc  := '';

           cdsLancamentos.First;
           While Not cdsLancamentos.EOF do
           Begin

              FProgresso := FProgresso + 1;

              If (cdsLancamentos.FieldByName('UTAG').AsFloat <> 0) Then
              Begin

                 sCodDC     := Trim(cdsLancamentos.FieldByName('LNR').AsString);
                 FCodDC     := sCodDC;
                 dValorLanc := cdsLancamentos.FieldByName('UTAG').AsFloat;
                 sDataLanc  := cdsLancamentos.FieldByName('DATUM').AsString;

                 If not Lancamento.Contabiliza(dEmpresa,dValorLanc,dPlncodigo,dHotel, sCodDC,
                                      sDataLanc,iPlano,iUsuario,bUsaPPatro) Then
                 Begin
                   sMens := 'Houve um Erro na contabilização no Lançamento.';
                   Abort;
                 End;
              End;

              cdsLancamentos.Next;
              DecodeDate(cdsLancamentos.FieldByName('DATUM').AsDateTime,iAno,iMes,iDia);
              sDataInv := Contab.CompletaZero(IntToStr(iAno),4)+Contab.CompletaZero(IntToStr(iMes),2)+Contab.CompletaZero(IntToStr(iDia),2);

              If sDataLanc <> cdsLancamentos.FieldByName('DATUM').AsString then
                 dPlncodigo := 0;
           End;

           MessageInfo   := 'Lançamento da Receita de Diária por Segmento';
           FProgresso    := 0;
           FMaxProgresso := 0;
           FMaxProgresso :=  cdsDiarias.RecordCount;

           dPlncodigo := 0;
           DecodeDate(dtDataIni,iAno,iMes,iDia);
           sDataInv   := Contab.CompletaZero(IntToStr(iAno),4)+Contab.CompletaZero(IntToStr(iMes),2)+Contab.CompletaZero(IntToStr(iDia),2);
           sDataLanc  := '';

           While Not cdsDiarias.EOF do
           Begin
              FProgresso := FProgresso + 1;

              If (cdsDiarias.FieldByName('UTAG').AsFloat <> 0) Then
              Begin
                 sCodDC     := Trim(cdsDiarias.FieldByName('MARKET').AsString);
                 FCodDC     := sCodDC;
                 dValorLanc := cdsDiarias.FieldByName('UTAG').AsFloat;
                 sDataLanc  := cdsDiarias.FieldByName('DATUM').AsString;

                 If not Lancamento.Contabiliza(dEmpresa,dValorLanc,dPlncodigo,dHotel,sCodDC,
                                 sDataLanc,iPlano,iUsuario,bUsaPPatro) Then
                 Begin
                   sMens :=  'Houve um Erro na contabilização no Lançamento.';
                   Abort;
                 End;
              End;
              cdsDiarias.Next;

              If sDataLanc <> cdsDiarias.FieldByName('DATUM').AsString then
                 dPlncodigo := 0;
           End;
           Result := True;
           Commit;
      Except
         on E:Exception Do
         Begin
            RollBack;
            Result := False;
            MessageInfo := sMens + E.Message;
         End;
      End;
      cdsDiarias.free;
      cdsLancamentos.free;
  End;
end;

function TCtrlProcessaContab.ImportaPlanilhaExcel(ArquivoTexto:TStringList;dEmpresa:Double;iPlano,iModulo,
                iUsuario:Integer;sDataLanc,sTipoOper:string;bUsaPPatro:Boolean) :Boolean;
var
  sSql,sLinha,sMens,sTralhaNove,sContaD,sDebCre,sHistorico,sNumDoc,sUnidNegoc :string;
  sContaC,sCCustC,sCCustD,sHist1,sHist2,sHist3,sHist4,sHist5,sValor,cTipoLanc:string;
  iContaLinha,Y,Z,W,X,iSubContaC,iSubContaD,iPatro,iPlanoPrev,i :integer;
  sTipoLanc :char;
  dValLanc,dPlnCodigo :Double;
  aLinha : array [1..12] of string;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ImportaPlanilhaExcel(StringlistToVariant(ArquivoTexto) ,dEmpresa,
                             iPlano,iModulo,iUsuario,sDataLanc,sTipoOper,bUsaPPatro,
                             FContaLinhaTexto,FLinhaTexto,FsMensAdd);

      If Not Result Then
      Begin
         MessageInfo := 'Houve erros na importação. ' + CHR(13) +
                        'Linha da Planilha: ' +  Connection.AppServer.MessageInfo + CHR(13) + CHR(13) +
                        'O estado anterior do Banco de Dados foi retornado. ' + CHR(13) +
                        'Verifique os Lançamentos com inconsistências.' + chr(13);
      End Else
          MessageInfo := FsMensAdd;
   End Else
   Begin
       //Inicializa as variáveis
       sMens        := '';
       FsMensAdd    := '';
       dPlnCodigo   := 0;
       FProgresso   := 1;
       MessageInfo  := '*';

       Try
            StartTransaction;

            //Varre a planilha para gravar os valores
            iContaLinha      := 0;
            FContaLinhaTexto := 0;

            While (ArquivoTexto.Count <> iContaLinha) do
            Begin
              Error := False;

               Y := 0;
               X := 1;
               Z := 1;
               W := 0;

               Repeat

                  sTralhaNove := Copy(ArquivoTexto[iContaLinha],X,1);
                  If sTralhaNove = #9 Then
                  Begin
                     Y := Y + 1;

                     aLinha[Y] := Copy(ArquivoTexto[iContaLinha], Z, X - 1 - W);

                     Z := Z + X - W;
                     W := X;
                  End;
                  X := X + 1;

               Until Length(ArquivoTexto[iContaLinha]) <= X;

               y := y + 1;
               aLinha[Y] := Copy(ArquivoTexto[iContaLinha], Z, X - W);

               //zera as variáveis
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
                  Lancamento.lcOriAplCre := 'O';

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

               If Trim(aLinha[9])  <> '' Then iPlanoPrev := StrToInt(Trim(aLinha[9]));
               If Trim(aLinha[10]) <> '' Then iPatro     := StrToInt(Trim(aLinha[10]));
               If Trim(aLinha[11]) <> '' Then sUnidNegoc := Trim(aLinha[11]);
               If Trim(aLinha[12]) <> '' Then sNumDoc    := Trim(aLinha[12]);

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

              If sUnidNegoc = '' Then
                 sUnidNegoc := '0';

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

                        Result := ExecSQL(sSql);
                        If not Result Then
                        Begin
                           MessageInfo := 'Erro na Inserção do Centro de Custo, em um Lançamento a Crédito.';
                           Result := false;
                           Exit;
                        End
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

                        Result := ExecSQL(sSql);
                        If not Result Then
                        Begin
                           MessageInfo := 'Erro na Inserção do Centro de Custo, em um Lançamento a Crédito.';
                           Result := false;
                           Exit;
                        End
                     End;
                  End;
               End;

               If Not ((sContaD = '') and (sContaC = '')) Then
               Begin
                  If (dValLanc <> 0) Then
                  Begin
                     FProgresso  := FProgresso + 1;
                     Lancamento.lcTestaConta := True;

                     If Lancamento.InsereLancaContab(sTipoLanc,dEmpresa,iModulo,iUsuario,
                                             iPlano,StrToInt(sUnidNegoc),iSubContaD,iSubContaC,
                                             iPlanoPrev, iPatro,dPlnCodigo,0,
                                             sDataLanc,sNumDoc,sHist1,sHist2,sHist3,
                                             sHist4,sHist5,sTipoOper,sCCustD,sContaD,
                                             sCCustC,sContaC,sHistorico,
                                             dValLanc,False,bUsaPPatro) Then

                     Begin
                         dPlnCodigo := Lancamento.RetornoPlnCodigo;
                     End Else
                     Begin
                        Error := True;
                        sMens  := MessageInfo;
                        FLinhaTexto := MessageInfo;
                        RollBack;
                        Result := False;
                        Exit;
                     End;
                  End;
               End;
            End;

            _cds.Data := Planilha.ListPlanilhas(0,dPlnCodigo);

            MessageInfo := IntToStr(_cds.FieldByName('PLNPLANIL').asInteger) + ' em: ' + sDataLanc + chr(13)+ chr(13);
            FsMensAdd := FsMensAdd + MessageInfo + chr(13);

            Commit;

            Result := True;

       Except
         on E:Exception Do
         Begin
            Error := True;
            RollBack;
            Result := False;
            MessageInfo := sMens+' '+E.Message;
         End;
       End;
   End;
end;

function TCtrlProcessaContab.AlteraPlanoConta(dEmpresa: Double;sMascara:string;
                                    iPlano,iPlanoVigente,iExercicio: Integer;bMesmoPlano,
                                    bMesmosCCSC:Boolean): Boolean;
var
    sContaDE, sCCustoDE, sContaPARA, sCCustoPARA : string;
    iPlanoAnterior: integer;
    sSql,sMens,sWhere, sUpdate : String;

  bFezDePara :Boolean;
  _cdsTabelaDePara  :TClientDataSet;
  _cdsCampoDePara   :TClientDataSet;
  _cdsLancamentos   :TClientDataSet;
  _cdsPrincipal     :TClientDataSet;
  _cdsSaldos        :TClientDataSet;


  _sqlUpdL          :TCMSqlParams;
  _sqlCCusto        :TCMSqlParams;
  _sqlSubConta      :TCMSqlParams;
  _sqlSaldos        :TCMSqlParams;
  _sqlUpdSaldos     :TCMSqlParams;



begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.AlteraPlanoConta(dEmpresa,sMascara,
                                    iPlano,iPLanoVigente,iExercicio,bMesmoPlano, bMesmosCCSC,FNomeTabela,FNomeCampo);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;

   End Else
   Begin
      FMaxProgresso := 0;
      FProgresso    := 0;
      sMens         := ' ';

      _cdsTabelaDePara := TClientDataSet.Create(nil);
      _cdsCampoDePara  := TClientDataSet.Create(nil);
      _cdsLancamentos  := TClientDataSet.Create(nil);
      _cdsPrincipal    := TClientDataSet.Create(nil);
      _cdsSaldos       := TClientDataSet.Create(nil);

      _sqlSaldos       := TCMSqlParams.Create(nil);
      _sqlSaldos.ControlObject := Self;

      _sqlUpdSaldos       := TCMSqlParams.Create(nil);
      _sqlUpdSaldos.ControlObject := Self;

      _sqlUpdL         := TCMSqlParams.Create(nil);
      _sqlUpdL.ControlObject := Self;

      _sqlCCusto  := TCMSqlParams.Create(nil);
      _sqlCCusto.ControlObject := Self;

      _sqlSubConta := TCMSqlParams.Create(nil);
      _sqlSubConta.ControlObject := Self;


      Try

         StartTransacao;

         //=== Faz o DE/PARA nas tabelas de configuração parte 1 ===

         _cdsTabelaDePara.Data := PlanoDePara.ListTabelaDePara;

         FMaxProgresso := _cdsTabelaDePara.Recordcount;

         _cdsTabelaDePara.First;

         While not _cdsTabelaDePara.eof do
         Begin

            FNomeTabela := _cdsTabelaDePara.FieldByName('NOMETABELA').asString;
            FNomeCampo  := _cdsTabelaDePara.FieldByName('NOMECAMPOPLANO').asString;

            //=== pega campos da tabela campos de-para ===
            _cdsCampoDePara.Data := PlanoDePara.ListCampoDePara(_cdsTabelaDePara.FieldByName('IDTABELADEPARA').asFloat);

            _cdsCampoDePara.First;
            while not _cdsCampoDePara.eof do
            begin
               FNomeCampo := FNomeCampo +','+ _cdsCampoDePara.FieldByName('NOMECAMPOCONTA').asString;
               _cdsCampoDePara.Next;
            end;

            sSql := 'SELECT DISTINCT '+ FNomeCampo +' FROM '+ _cdsTabelaDePara.FieldByName('NOMETABELA').asString;

            _cdsPrincipal.Data := GetDataPacket(sSql);

            _cdsPrincipal.First;
            while not _cdsPrincipal.Eof do
            begin
               sWhere  := '';
               sUpdate := '';

               sSql := 'UPDATE ' + _cdsTabelaDePara.FieldByName('NOMETABELA').asString + ' SET ';

               _cdsCampoDePara.First;

               While not _cdsCampoDePara.eof do
               Begin
                  iPlanoAnterior := iPlano;

                  //if bMesmoPlano then
                 // begin
                     //Como nao tem plano anterior neste caso, a funcao plano vigente estava zerando este campo,
                     //por isto inicializei de novo

                   //  iPlanoAnterior := iPlano;
                  //end;
                  if (iPlanoAnterior = _cdsPrincipal.FieldByName(trim(_cdsTabelaDePara.FieldByName('NOMECAMPOPLANO').asString)).AsInteger) or
                     (_cdsPrincipal.FieldByName(trim(_cdsTabelaDePara.FieldByName('NOMECAMPOPLANO').asString)).isNull) then
                  begin
                     //faz a troca da conta a Debito no DE/PARA
                     sCCustoDE := '';
                     sContaDE    := trim(_cdsPrincipal.FieldByName(trim(_cdsCampoDePara.FieldByName('NOMECAMPOCONTA').asString)).AsString);
                     sContaPARA  := '';
                     sCCustoPARA := '';
                     if sContaDE <> '' then begin
                        if _cdsPrincipal.FieldByName(trim(_cdsTabelaDePara.FieldByName('NOMECAMPOPLANO').asString)).isNull then
                           iPlanoAnterior := iPlano
                        else
                           iPlanoAnterior := _cdsPrincipal.FieldByName(trim(_cdsTabelaDePara.FieldByName('NOMECAMPOPLANO').asString)).AsInteger;

                        bFezDePara   := ContaContabil.FazDeParaConta(dEmpresa, iPlanoAnterior, iPlanoVigente, sContaDE, sCCustoDE);

                        if (not bFezDePara) then
                        begin
                           if (not bMesmoPlano) then
                           begin
                              sMens := 'Não encontrado DE/PARA para a conta '+_cdsPrincipal.FieldByName(trim(_cdsCampoDePara.FieldByName('NOMECAMPOCONTA').asString)).AsString+' da tabela '+_cdsTabelaDePara.FieldByName('NOMETABELA').asString;
                              Raise Exception.Create(sMens);
                           end;
                        end else
                        begin
                           if sWhere = '' then
                           begin
                              sWhere  := '(('+trim(_cdsTabelaDePara.FieldByName('NOMECAMPOPLANO').asString)+' = '+IntToStr(_cdsPrincipal.FieldByName(trim(_cdsTabelaDePara.FieldByName('NOMECAMPOPLANO').asString)).AsInteger)+') OR ('+trim(_cdsTabelaDePara.FieldByName('NOMECAMPOPLANO').asString)+' IS NULL)) ';
                              sUpdate := trim(_cdsTabelaDePara.FieldByName('NOMECAMPOPLANO').asString)+' = '+IntToStr(iPlanoVigente);
                           end;
                           sWhere  := sWhere  +' AND '+trim(_cdsCampoDePara.FieldByName('NOMECAMPOCONTA').asString)+' = '''+_cdsPrincipal.FieldByName(trim(_cdsCampoDePara.FieldByName('NOMECAMPOCONTA').asString)).AsString+'''';
                           sUpdate := sUpdate +', '+trim(_cdsCampoDePara.FieldByName('NOMECAMPOCONTA').asString)+' = '''+sContaPARA+'''';
                        end;
                     end;
                  end;
                  _cdsCampoDePara.Next;
               End;

               if sWhere <> '' then
               begin
                  sSql := sSql + sUpdate;
                  sSql := sSql +' WHERE ';
                  sSql := sSql + sWhere;

                  Result := ExecSql(sSql);
                  If Not Result Then
                  Begin
                     sMens := 'Erro ao Atualizar a Tabela Tabela-De-Para.';
                     Raise Exception.Create(sMens);
                  End;
               end;
               _cdsPrincipal.Next;
            end;
            _cdsTabelaDePara.Next;
            FProgresso := FProgresso + 1;
         End;

         //==  Faz o De/Para nas tabelas de lançamentos  parte-2
         FNomeTabela := 'LANCAMENTO';
         FProgresso  := 0;

         sSql := 'SELECT L.LACDEBCRE, L.LACNUMLAN, L.PLACONTA, '+
                 '    L.PLANO, L.PLNCODIGO, L.CODCENTROCUSTO '+
                 'FROM LANCAMENTO L, PLANILHA P '+
                 'WHERE  (P.IDPESSOA     = ' + FloatToStr(dEmpresa) + ') AND '+
                 '       (P.PEREXERCICIO = '+ IntToStr(iExercicio) + ') AND '+
                 '       (P.PLNCODIGO    = L.PLNCODIGO) ';


         _cdsLancamentos.Data := GetDataPacket(sSql);
         FMaxProgresso := _cdsLancamentos.Recordcount;

         _cdsLancamentos.First;

         While not _cdsLancamentos.eof do
         Begin
            FNomeCampo := _cdsLancamentos.FieldByName('PLACONTA').asString;

            //iPlanoAnterior := iPlano;

            //if bMesmoPlano then
            //begin
               //Como nao tem plano anterior neste caso,
               //a funcao plano vigente estava zerando este campo,
               //por isto inicializei de novo
              // iPlanoAnterior := iPlano;
            //end;

            //faz a troca da conta a Debito no DE/PARA
            if _cdsLancamentos.FieldByName('CODCENTROCUSTO').isNull then begin
               sCCustoDE := '';
            end else begin
               sCCustoDE := _cdsLancamentos.FieldByName('CODCENTROCUSTO').asString;
            end;

            sContaDE    := _cdsLancamentos.FieldByName('PLACONTA').asString;
            sContaPARA  := '';
            sCCustoPARA := '';
            bFezDePara     := ContaContabil.FazDeParaConta(dEmpresa, _cdsLancamentos.FieldByName('PLANO').asInteger, iPlanoVigente, sContaDE, sCCustoDE);

            if sCCustoPARA <> '' then
            begin
              _sqlUpdL.SQL.Clear;
              _sqlUpdL.SQL.Add('UPDATE  LANCAMENTO                     ');
              _sqlUpdL.SQL.Add('   SET PLACONTA =:PLACONTA, PLANO=:PLANO, CODCENTROCUSTO=:CODCENTROCUSTO ');
              _sqlUpdL.SQL.Add(' WHERE                                 ');
              _sqlUpdL.SQL.Add('     (PLNCODIGO =:PLNCODIGO) AND       ');
              _sqlUpdL.SQL.Add('     (LACNUMLAN =:LACNUMLAN) AND       ');
              _sqlUpdL.SQL.Add('     (LACDEBCRE =:LACDEBCRE)           ');
            end else
            begin
              _sqlUpdL.SQL.Clear;
              _sqlUpdL.SQL.Add('UPDATE LANCAMENTO                        ');
              _sqlUpdL.SQL.Add('   SET PLACONTA =:PLACONTA, PLANO=:PLANO ');
              _sqlUpdL.SQL.Add('WHERE                                    ');
              _sqlUpdL.SQL.Add('  (PLNCODIGO =:PLNCODIGO) AND            ');
              _sqlUpdL.SQL.Add('  (LACNUMLAN =:LACNUMLAN) AND            ');
              _sqlUpdL.SQL.Add('  (LACDEBCRE =:LACDEBCRE)                ');
            end;

            if bFezDepara then
            begin
               if bMesmosCCSC then
               begin
                  //=== centro de custo ===
                  _sqlCCusto.SQL.Clear;
                  _sqlCCusto.SQL.Add('INSERT INTO CONTASXCC(PLANO, PLACONTA,           ');
                  _sqlCCusto.SQL.Add('   CODCENTROCUSTO, IDEMPRESA, IDUSUARIOINCLUSAO) ');
                  _sqlCCusto.SQL.Add('   (SELECT :PLANO2, :PLACONTA2, C.CODCENTROCUSTO,');
                  _sqlCCusto.SQL.Add('           C.IDEMPRESA, C.IDUSUARIOINCLUSAO      ');
                  _sqlCCusto.SQL.Add('    FROM CONTASXCC C                             ');
                  _sqlCCusto.SQL.Add('    WHERE (C.PLANO = :PLANO1)                    ');
                  _sqlCCusto.SQL.Add('      AND (C.PLACONTA = :PLACONTA1)              ');
                  _sqlCCusto.SQL.Add('      AND (C.IDEMPRESA = :IDEMPRESA)             ');
                  _sqlCCusto.SQL.Add('      AND (NOT EXISTS (SELECT X.PLACONTA         ');
                  _sqlCCusto.SQL.Add('                       FROM CONTASXCC X                  ');
                  _sqlCCusto.SQL.Add('                       WHERE (X.PLACONTA = :PLACONTA2)   ');
                  _sqlCCusto.SQL.Add('                         AND (X.PLANO = :PLANO2)         ');
                  _sqlCCusto.SQL.Add('                         AND (X.IDEMPRESA = C.IDEMPRESA) ');
                  _sqlCCusto.SQL.Add('                         AND (X.CODCENTROCUSTO = C.CODCENTROCUSTO))))');

                  _sqlCCusto.Prepare;
                  _sqlCCusto.ParamByName('PLANO1').AsInteger   := _cdsLancamentos.FieldByName('PLANO').AsInteger;
                  _sqlCCusto.ParamByName('PLANO2').AsInteger   := iPlanoVigente;
                  _sqlCCusto.ParamByName('PLACONTA1').AsString := Copy(_cdsLancamentos.FieldByName('PLACONTA').asString + '                  ',1,18);
                  _sqlCCusto.ParamByName('PLACONTA2').AsString := Copy(sContaPARA + '                  ',1,18);
                  _sqlCCusto.ParamByName('IDEMPRESA').AsFloat  := dEmpresa;

                  If not ExecSQL(_sqlCCusto.SQLChanged,False) Then
                  begin
                     sMens := 'Erro ao Inserir Dados na TAbela CONTASXCC.';
                     Raise Exception.Create(sMens);
                  end;

                  //=== subconta ===
                  _sqlSubConta.SQL.Clear;

                  _sqlSubConta.SQL.Add('INSERT INTO CONTASXSUBC(PLANO, PLACONTA, CODSUBCONTA, ');
                  _sqlSubConta.SQL.Add('       IDPESSOA, IDUSUARIO)                           ');
                  _sqlSubConta.SQL.Add('       (SELECT :PLANO2, :PLACONTA2,                   ');
                  _sqlSubConta.SQL.Add('                 C.CODSUBCONTA, C.IDPESSOA,           ');
                  _sqlSubConta.SQL.Add('                 C.IDUSUARIO                          ');
                  _sqlSubConta.SQL.Add('          FROM CONTASXSUBC C                          ');
                  _sqlSubConta.SQL.Add('          WHERE (C.PLANO = :PLANO1)                   ');
                  _sqlSubConta.SQL.Add('            AND (C.PLACONTA = :PLACONTA1)             ');
                  _sqlSubConta.SQL.Add('            AND (C.IDPESSOA = :IDEMPRESA)             ');
                  _sqlSubConta.SQL.Add('            AND (NOT EXISTS (SELECT X.PLACONTA        ');
                  _sqlSubConta.SQL.Add('                             FROM CONTASXSUBC X       ');
                  _sqlSubConta.SQL.Add('                             WHERE (X.PLACONTA = :PLACONTA2) ');
                  _sqlSubConta.SQL.Add('                               AND (X.PLANO = :PLANO2)       ');
                  _sqlSubConta.SQL.Add('                               AND (X.IDPESSOA = C.IDPESSOA) ');
                  _sqlSubConta.SQL.Add('                               AND (X.CODSUBCONTA = C.CODSUBCONTA)))) ');

                  _sqlSubConta.Prepare;
                  _sqlSubConta.ParamByName('PLANO1').AsInteger   := _cdsLancamentos.FieldByName('PLANO').AsInteger;
                  _sqlSubConta.ParamByName('PLANO2').AsInteger   := iPlanoVigente;
                  _sqlSubConta.ParamByName('PLACONTA1').AsString := Copy(_cdsLancamentos.FieldByName('PLACONTA').asString+'                  ',1,18);
                  _sqlSubConta.ParamByName('PLACONTA2').AsString := Copy(sContaPARA + '                  ',1,18);
                  _sqlSubConta.ParamByName('IDEMPRESA').AsFloat  := dEmpresa;

                  If not ExecSQL(_sqlSubConta.SQLChanged,False) Then
                  Begin
                     sMens := 'Erro ao Inserir Dados na TAbela CONTASXSUBC.';
                     Raise Exception.Create(sMens);
                  End;

               end;
               _sqlUpdL.Prepare;
               _sqlUpdL.ParamByName('PLNCODIGO').asInteger := _cdsLancamentos.FieldByName('PLNCODIGO').asInteger;
               _sqlUpdL.ParamByName('LACDEBCRE').asString  := _cdsLancamentos.FieldByName('LACDEBCRE').asString;
               _sqlUpdL.ParamByName('LACNUMLAN').asInteger := _cdsLancamentos.FieldByName('LACNUMLAN').asInteger;
               _sqlUpdL.ParamByName('PLACONTA').asString   := sContaPARA;
               _sqlUpdL.ParamByName('PLANO').asInteger     := iPlanoVigente;

               if sCCustoPARA <> '' then begin
                  _sqlUpdL.ParamByName('CODCENTROCUSTO').asString := sCCustoPARA;
               end;

               If not ExecSQL(_sqlUpdL.SQLChanged,False) Then
               begin
                  sMens := 'Erro ao Atualizar a Tabela LANCAMENTO.';
                  Raise Exception.Create(sMens);
               end;

            end else
            begin
               if sCCustoDE <> '' then
               begin
                  sCCustoDE   := '';
                  sContaDE    := _cdsLancamentos.FieldByName('PLACONTA').asString;
                  sContaPARA  := '';
                  sCCustoPARA := '';
                  bFezDePara     := ContaContabil.FazDeParaConta(dEmpresa, _cdsLancamentos.FieldByName('PLANO').asInteger, iPlanoVigente, sContaDE, sCCustoDE);

                  if sCCustoPARA <> '' then
                  begin
                    _sqlUpdL.SQL.Clear;
                    _sqlUpdL.SQL.Add('UPDATE  LANCAMENTO                     ');
                    _sqlUpdL.SQL.Add('   SET PLACONTA =:PLACONTA, PLANO=:PLANO, CODCENTROCUSTO=:CODCENTROCUSTO ');
                    _sqlUpdL.SQL.Add(' WHERE                                 ');
                    _sqlUpdL.SQL.Add('     (PLNCODIGO =:PLNCODIGO) AND       ');
                    _sqlUpdL.SQL.Add('     (LACNUMLAN =:LACNUMLAN) AND       ');
                    _sqlUpdL.SQL.Add('     (LACDEBCRE =:LACDEBCRE)           ');
                 end else
                 begin
                    _sqlUpdL.SQL.Clear;
                    _sqlUpdL.SQL.Add('UPDATE LANCAMENTO                        ');
                    _sqlUpdL.SQL.Add('   SET PLACONTA =:PLACONTA, PLANO=:PLANO ');
                    _sqlUpdL.SQL.Add('WHERE                                    ');
                    _sqlUpdL.SQL.Add('  (PLNCODIGO =:PLNCODIGO) AND            ');
                    _sqlUpdL.SQL.Add('  (LACNUMLAN =:LACNUMLAN) AND            ');
                    _sqlUpdL.SQL.Add('  (LACDEBCRE =:LACDEBCRE)                ');
                 end;
                 if bFezDePara then
                 begin
                     if bMesmosCCSC then
                     begin

                        _sqlCCusto.Prepare;
                        _sqlCCusto.ParamByName('PLANO1').AsInteger   := _cdsLancamentos.FieldByName('PLANO').AsInteger;
                        _sqlCCusto.ParamByName('PLANO2').AsInteger   := iPlanoVigente;
                        _sqlCCusto.ParamByName('PLACONTA1').AsString := Copy(_cdsLancamentos.FieldByName('PLACONTA').asString+ '                  ',1,18);
                        _sqlCCusto.ParamByName('PLACONTA2').AsString := Copy(sContaPARA+ '                  ',1,18);
                        _sqlCCusto.ParamByName('IDEMPRESA').AsFloat  := dEmpresa;


                        If not ExecSQL(_sqlCCusto.SQLChanged,False) Then
                        begin
                           sMens := 'Erro ao Inserir Dados na Tabela CONTASXCC.';
                           Raise Exception.Create(sMens);
                        end;

                        _sqlSubConta.Prepare;
                        _sqlSubConta.ParamByName('PLANO1').AsInteger   := _cdsLancamentos.FieldByName('PLANO').AsInteger;
                        _sqlSubConta.ParamByName('PLANO2').AsInteger   := iPlanoVigente;
                        _sqlSubConta.ParamByName('PLACONTA1').AsString := Copy(_cdsLancamentos.FieldByName('PLACONTA').asString+ '                  ',1,18);
                        _sqlSubConta.ParamByName('PLACONTA2').AsString := Copy(sContaPARA+ '                  ',1,18);
                        _sqlSubConta.ParamByName('IDEMPRESA').AsFloat  := dEmpresa;

                        If not ExecSQL(_sqlSubConta.SQLChanged,False) Then
                        Begin
                           sMens := 'Erro ao Inserir Dados na Tabela CONTASXSUBC.';
                           Raise Exception.Create(sMens);
                        End;
                     end;
                     _sqlUpdL.Prepare;
                     _sqlUpdL.ParamByName('PLNCODIGO').asInteger := _cdsLancamentos.FieldByName('PLNCODIGO').asInteger;
                     _sqlUpdL.ParamByName('LACDEBCRE').asString  := _cdsLancamentos.FieldByName('LACDEBCRE').asString;
                     _sqlUpdL.ParamByName('LACNUMLAN').asInteger := _cdsLancamentos.FieldByName('LACNUMLAN').asInteger;
                     _sqlUpdL.ParamByName('PLACONTA').asString   := sContaPARA;
                     _sqlUpdL.ParamByName('PLANO').asInteger     := iPlanoVigente;

                     if sCCustoPARA <> '' then
                     begin
                        _sqlUpdL.ParamByName('CODCENTROCUSTO').asString := sCCustoPARA;
                     end;

                     If not ExecSQL(_sqlUpdL.SQLChanged,False) Then
                     begin
                        sMens := 'Erro ao Atualizar a Tabela LANCAMENTO.';
                        Raise Exception.Create(sMens);
                     end;

                 end;
               end;
            end;
            _cdsLancamentos.Next;
            FProgresso := FProgresso + 1;
         End;

         //=== Faz o DE/PARA nas tabelas de saldos parte 3 ====
         FNomeTabela := 'PLANOSALDO';
         FProgresso := 0;

         _sqlSaldos.SQL.Clear;
         _sqlSaldos.SQL.Add('SELECT                                           ');
         _sqlSaldos.SQL.Add('   PLACONTA, PLANO, IDPLANOSALDO, CODCENTROCUSTO ');
         _sqlSaldos.SQL.Add('FROM                                             ');
         _sqlSaldos.SQL.Add('   PLANOSALDO                                    ');
         _sqlSaldos.SQL.Add('WHERE                                            ');
         _sqlSaldos.SQL.Add('   (IDPESSOA=:IDPESSOA) AND                      ');
         _sqlSaldos.SQL.Add('  (PEREXERCICIO=:PEREXERCICIO)                   ');

         _sqlSaldos.Prepare;
         _sqlSaldos.ParamByName('IDPESSOA').asFloat       := dEmpresa;
         _sqlSaldos.ParamByName('PEREXERCICIO').asInteger := iExercicio;

         _cdsSaldos.Data := _sqlSaldos.Data;

         FMaxProgresso := _cdsSaldos.RecordCount;

         _cdsSaldos.First;

         While not _cdsSaldos.eof do
         Begin
            FNomeCampo := _cdsSaldos.FieldByName('PLACONTA').asString;

            //iPlanoAnterior := iPlano;

            //if bMesmoPlano then
           // begin
               //== Como nao tem plano anterior neste caso, a funcao plano vigente estava zerando este campo,
               //== por isto inicializei de novo
             //  iPlanoAnterior := iPlano;
            //end;

            //== faz a troca da conta a Debito no DE/PARA ==
            if _cdsSaldos.FieldByName('CODCENTROCUSTO').isNull then
            begin
               sCCustoDE := '';
            end else
            begin
               sCCustoDE := _cdsSaldos.FieldByName('CODCENTROCUSTO').asString;
            end;

            sContaDE    := _cdsSaldos.FieldByName('PLACONTA').asString;
            sContaPARA  := '';
            sCCustoPARA := '';
            bFezDePara     := ContaContabil.FazDeParaConta(dEmpresa, _cdsSaldos.FieldByName('PLANO').asInteger, iPlanoVigente, sContaDE, sCCustoDE);

            if sCCustoPARA <> '' then
            begin
              _sqlUpdSaldos.SQL.Clear;
              _sqlUpdSaldos.SQL.Add('UPDATE                                                               ');
              _sqlUpdSaldos.SQL.Add('   PLANOSALDO                                                        ');
              _sqlUpdSaldos.SQL.Add('SET                                                                  ');
              _sqlUpdSaldos.SQL.Add('   PLACONTA =:PLACONTA, PLANO=:PLANO, CODCENTROCUSTO=:CODCENTROCUSTO ');
              _sqlUpdSaldos.SQL.Add('WHERE                                                                ');
              _sqlUpdSaldos.SQL.Add('   (IDPLANOSALDO =:IDPLANOSALDO)                                     ');
            end else
            begin
              _sqlUpdSaldos.SQL.Clear;
             _sqlUpdSaldos.SQL.Add('UPDATE                               ');
             _sqlUpdSaldos.SQL.Add('   PLANOSALDO                        ');
             _sqlUpdSaldos.SQL.Add('SET                                  ');
             _sqlUpdSaldos.SQL.Add('   PLACONTA =:PLACONTA, PLANO=:PLANO ');
             _sqlUpdSaldos.SQL.Add('WHERE                                ');
             _sqlUpdSaldos.SQL.Add('   (IDPLANOSALDO =:IDPLANOSALDO)     ');
            end;

            if bFezDePara then begin
               _sqlUpdSaldos.Prepare;
               _sqlUpdSaldos.ParamByName('IDPLANOSALDO').asInteger := _cdsSaldos.FieldByName('IDPLANOSALDO').asInteger;
               _sqlUpdSaldos.ParamByName('PLACONTA').asString      := sContaPARA;
               _sqlUpdSaldos.ParamByName('PLANO').asInteger        := iPlanoVigente;

               if sCCustoPARA <> '' then begin
                  _sqlUpdSaldos.ParamByName('CODCENTROCUSTO').asString := sCCustoPARA;
               end;

               If not ExecSql(_sqlUpdSaldos.SQLChanged,False) Then
               begin
                  sMens := 'Erro ao Atualizaar a Tabela PLANOSALDO.';
                  Raise Exception.Create(sMens);
               end;
            end else
            begin
               if sCCustoDE <> '' then
               begin
                  sCCustoDE   := '';
                  sContaDE    := _cdsSaldos.FieldByName('PLACONTA').asString;
                  sContaPARA  := '';
                  sCCustoPARA := '';
                  bFezDePara     := ContaContabil.FazDeParaConta(dEmpresa, _cdsSaldos.FieldByName('PLANO').asInteger, iPlanoVigente, sContaDE, sCCustoDE);

                  if sCCustoPARA <> '' then
                  begin
                     _sqlUpdSaldos.SQL.Clear;
                     _sqlUpdSaldos.SQL.Add('UPDATE                                                               ');
                     _sqlUpdSaldos.SQL.Add('   PLANOSALDO                                                        ');
                     _sqlUpdSaldos.SQL.Add('SET                                                                  ');
                     _sqlUpdSaldos.SQL.Add('   PLACONTA =:PLACONTA, PLANO=:PLANO, CODCENTROCUSTO=:CODCENTROCUSTO ');
                     _sqlUpdSaldos.SQL.Add('WHERE                                                                ');
                     _sqlUpdSaldos.SQL.Add('   (IDPLANOSALDO =:IDPLANOSALDO)                                     ');
                   end else
                   begin
                     _sqlUpdSaldos.SQL.Clear;
                    _sqlUpdSaldos.SQL.Add('UPDATE                               ');
                    _sqlUpdSaldos.SQL.Add('   PLANOSALDO                        ');
                    _sqlUpdSaldos.SQL.Add('SET                                  ');
                    _sqlUpdSaldos.SQL.Add('   PLACONTA =:PLACONTA, PLANO=:PLANO ');
                    _sqlUpdSaldos.SQL.Add('WHERE                                ');
                    _sqlUpdSaldos.SQL.Add('   (IDPLANOSALDO =:IDPLANOSALDO)     ');
                  end;
                  if bFezDePara then
                  begin
                     _sqlUpdSaldos.Prepare;
                     _sqlUpdSaldos.ParamByName('IDPLANOSALDO').asInteger := _cdsSaldos.FieldByName('IDPLANOSALDO').asInteger;
                     _sqlUpdSaldos.ParamByName('PLACONTA').asString      := sContaPARA;
                     _sqlUpdSaldos.ParamByName('PLANO').asInteger        := iPlanoVigente;

                     if sCCustoPARA <> '' then
                     begin
                        _sqlUpdSaldos.ParamByName('CODCENTROCUSTO').asString := sCCustoPARA;
                     end;
                     If not ExecSql(_sqlUpdSaldos.SQLChanged,False) Then
                     begin
                        sMens := 'Erro ao Atualizaar a Tabela PLANOSALDO.';
                        Raise Exception.Create(sMens);
                     end;
                  end;
               end;
            end;
            _cdsSaldos.Next;
            FProgresso := FProgresso + 1;
         End;
         Commit;
         MessageInfo := 'Alteração do Plano Contabil realizada com sucesso!';
         Result := True;

         _cdsTabelaDePara.free;
         _cdsCampoDePara.free;
         _cdsLancamentos.free;
         _cdsPrincipal.free;
         _cdsSaldos.free;

         _sqlUpdL.free;
         _sqlCCusto.free;
         _sqlSubConta.free;
         _sqlSaldos.free;
         _sqlUpdSaldos.free;

      Except
         on E:Exception Do
         Begin
            _cdsTabelaDePara.free;
            _cdsCampoDePara.free;
            _cdsLancamentos.free;
            _cdsPrincipal.free;
            _cdsSaldos.free;

            _sqlUpdL.free;
            _sqlCCusto.free;
            _sqlSubConta.free;
            _sqlSaldos.free;
            _sqlUpdSaldos.free;


            RollBack;
            Result := False;
            MessageInfo := sMens+' '+E.Message;
         End;
      End;
   End;
   end;

function TCtrlProcessaContab.GeraRateioPorPeriodo(dEmpresa:Double;iCodMoeda,iSinal,
                      iExercicio,iPeriodo:Integer;sDataFim:String): Boolean;
var
    dValorCot     : Double;

     _sqlRateio  :TCMSqlParams;
     _sqlSaldos  :TCMSqlParams;
     _cdsSaldos  :TClientDataSet;

    sMens :string;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GeraRateioPorPeriodo(dEmpresa,iCodMoeda,iSinal,
                      iExercicio,iPeriodo,sDataFim,FsMensAPS_Log);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
         FsMensAPS_Log := Connection.AppServer.MessageInfo;

   End Else
   Begin
      FMaxProgresso := 0;
      FProgresso    := 0;
      sMens         := '';
      FsMensAPS_Log := '';
      MessageInfo   := '*';
      Result := True;
      _sqlRateio       := TCMSqlParams.Create(nil);
      _sqlRateio.ControlObject := Self;

      _sqlSaldos       := TCMSqlParams.Create(nil);
      _sqlSaldos.ControlObject := Self;

      _cdsSaldos := TClientDataSet.Create(nil);

      with _sqlRateio do
      begin
         SQL.Clear;
         SQL.Add('INSERT INTO RATEIOATIVPROJ                                                               ');
         SQL.Add('       (IDRATEIOATIVPROJ, UNIDNEGOC, IDPESSOA, PEREXERCICIO, VLRRATEIO, PERNUMERO)       ');
         SQL.Add('VALUES                                                                                   ');
         SQL.Add('       (:IDRATEIOATIVPROJ, :UNIDNEGOC, :IDPESSOA, :PEREXERCICIO, :VLRRATEIO, :PERNUMERO) ');

         Prepare;
      end;

      with _sqlSaldos do
      begin
         SQL.Clear;
         if iSinal = 0 then begin
            SQL.Add('SELECT SUM(DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)      ');
            SQL.Add('         - DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)) AS SALDO,   ');
         end else begin
            SQL.Add('SELECT SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)      ');
            SQL.Add('         - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDO,   ');
         end;
         SQL.Add('       S.UNIDNEGOC                                                        ');
         SQL.Add('FROM PLANOSALDO S, PLANOCONTA C                                           ');
         SQL.Add('WHERE                                                                     ');
         SQL.Add('       (S.PLACONTA     = C.PLACONTA) AND                                  ');
         SQL.Add('       (S.PLANO        = C.PLANO) AND                                     ');
         SQL.Add('       (C.PLARATEIOAP  = ''S'') AND                                       ');
         SQL.Add('       (C.PLATIPO      = ''A'') AND                                       ');
         SQL.Add('       (S.PEREXERCICIO =:PEREXERCICIO) AND                                ');
         SQL.Add('       (S.PERNUMERO    =:PERNUMERO) AND                                   ');
         SQL.Add('       (S.IDPESSOA     =:IDPESSOA)                                        ');
         SQL.Add('GROUP BY S.UNIDNEGOC                                                      ');

         Prepare;
         ParamByName('PEREXERCICIO').asInteger := iExercicio;
         ParamByName('PERNUMERO').asInteger    := iPeriodo;
         ParamByName('IDPESSOA').asFloat       := dEmpresa;

         _cdsSaldos.Data := Data;

         FMaxProgresso := _cdsSaldos.RecordCount;

         dValorCot     := Contab.TestaCotacaoMoeda(iCodMoeda,StrToDate(sDataFim),False);
         if dValorCot <> 0 then
         Begin
            Try

               StartTransaction;
               _cdsSaldos.First;

               while not _cdsSaldos.eof do
               begin
                  _sqlSaldos.ParamByName('IDRATEIOATIVPROJ').asInteger := GetSequence('RATEIOATIVPROJ');
                  _sqlSaldos.ParamByName('UNIDNEGOC').asInteger        := _cdsSaldos.FieldByName('UNIDNEGOC').asInteger;

                  _sqlSaldos.ParamByName('IDPESSOA').asFloat           := dEmpresa;
                  _sqlSaldos.ParamByName('PEREXERCICIO').asInteger     := iExercicio;
                  _sqlSaldos.ParamByName('PERNUMERO').asInteger        := iPeriodo;
                  _sqlSaldos.ParamByName('VLRRATEIO').asFloat          := (_cdsSaldos.FieldByName('SALDO').asFloat/dValorCot);

                  If not ExecSQL(_sqlSaldos.SQLChanged,False) Then
                  begin
                     sMens := 'Erro ao Inserir Dados a Tabela RATEIOATIVPROJ.';
                     Raise Exception.Create(sMens);
                  end;

                  _cdsSaldos.Next;


                  sMensAPS_Log := sMensAPS_Log + 'Valor: ' + FloatToStr(_cdsSaldos.FieldByName('SALDO').asFloat/dValorCot) + chr(13);
                  sMensAPS_Log := sMensAPS_Log + 'Saldo : ' + FloatToStr(_cdsSaldos.FieldByName('SALDO').asFloat) + ' - Cotação : ' + FloatToStr(dValorCot) + chr(13);

                  MessageInfo := 'Valor: ' + FloatToStr(_cdsSaldos.FieldByName('SALDO').asFloat/dValorCot) + chr(13);
                  MessageInfo := 'Saldo : ' + FloatToStr(_cdsSaldos.FieldByName('SALDO').asFloat) + ' - Cotação : ' + FloatToStr(dValorCot) + chr(13);

                  FProgresso := FProgresso + 1;

               end;

               Result := True;
               Commit;

               sMens :=  'Geração dos dados do Rateio efetuada com sucesso.' + chr(13);
               MessageInfo := sMens;
               sMensAPS_Log := sMensAPS_Log + sMens + chr(13);

               sMensAPS_Log := sMensAPS_Log + '***********************' + chr(13);

               _cdsSaldos.free;
               _sqlSaldos.free;
               _sqlRateio.free;

            Except
               on E:Exception Do
               Begin
                  RollBack;
                  _cdsSaldos.free;
                  _sqlSaldos.free;
                  _sqlRateio.free;
                  Result := False;
                  MessageInfo := sMens+' '+E.Message;
               End;

            End;
         End;
      End;
   End;
end;

function TCtrlProcessaContab.ExisteRateio(dEmpresa: Double; iExercicio,
  iPeriodo: Integer): Boolean;
var
    _sqlAux    :TCMSqlParams;
    _cdsAux    :TClientDataSet;

begin
        _sqlAux       := TCMSqlParams.Create(nil);
        _sqlAux.ControlObject := Self;

        _cdsAux  := TClientDataSet.Create(nil);
     Try

         With _sqlAux do
         Begin
            SQL.Clear;
            SQL.Add('SELECT                                 ');
            SQL.Add('   IDRATEIOATIVPROJ                    ');
            SQL.Add('FROM                                   ');
            SQL.Add('   RATEIOATIVPROJ                      ');
            SQL.Add('WHERE                                  ');
            SQL.Add('   (PEREXERCICIO =:PEREXERCICIO) AND   ');
            SQL.Add('   (PERNUMERO    =:PERNUMERO) AND      ');
            SQL.Add('   (IDPESSOA     =:IDPESSOA)           ');

            Prepare;
            ParamByName('PEREXERCICIO').asInteger := iExercicio;
            ParamByName('PERNUMERO').asInteger    := Iperiodo;
            ParamByName('IDPESSOA').asFloat       := dEmpresa;

            _cdsAux.Data := Data;
            if not _cdsAux.isEmpty then
            begin
               Result := True;
            end else
            begin
               Result := False
            end;

         End;

     Finally
        _cdsAux.free;
        _sqlAux.Free;
     End;

end;

function TCtrlProcessaContab.RemoveRateioPorPeriodo(dEmpresa:Double;iExercicio,iPeriodo:Integer): Boolean;
var
    _sqlAux    :TCMSqlParams;
    _cdsAux    :TClientDataSet;
    sMens :string;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.RemoveRateioPorPeriodo(dEmpresa,iExercicio,iPeriodo);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;

   End Else
   Begin
      _sqlAux       := TCMSqlParams.Create(nil);
      _sqlAux.ControlObject := Self;
      _cdsAux  := TClientDataSet.Create(nil);

      Try

          StartTransaction;

          _sqlAux.SQL.Clear;
          _sqlAux.SQL.Add('DELETE                               ');
          _sqlAux.SQL.Add('FROM                                 ');
          _sqlAux.SQL.Add('   RATEIOATIVPROJ                    ');
          _sqlAux.SQL.Add('WHERE                                ');
          _sqlAux.SQL.Add('   (PEREXERCICIO =:PEREXERCICIO) AND ');
          _sqlAux.SQL.Add('   (PERNUMERO    =:PERNUMERO) AND    ');
          _sqlAux.SQL.Add('   (IDPESSOA     =:IDPESSOA)         ');

          _sqlAux.Prepare;
          _sqlAux.ParamByName('PEREXERCICIO').asInteger := iExercicio;
          _sqlAux.ParamByName('PERNUMERO').asInteger    := iPeriodo;
          _sqlAux.ParamByName('IDPESSOA').asFloat       := dEmpresa;

          If not ExecSQL(_sqlAux.SQLChanged,False) Then
          begin
             sMens := 'Erro ao Remover Dados da Tabela RATEIOATIVPROJ.';
             Raise Exception.Create(sMens);
          end;
          Result := True;
          Commit;
          _sqlAux.Free;
          _cdsAux.free;
       Except
         on E:Exception Do
         Begin
            RollBack;
            Result := False;
            _sqlAux.Free;
            _cdsAux.free;
            MessageInfo := sMens+' '+E.Message;
         End;
       End;
  End;

end;

function TCtrlProcessaContab.GeraLancaRateioAtivProj(dEmpresa: Double;
         iUsuario,iPlano,iExercicio, iPeriodo,iUnidNegoc: Integer;
         sTipoOper,sDataLanc:string;bUsaPPatro:Boolean): Boolean;

var
    i  : longint;
    cTipoLanc :char;
    dAcuCor, dAcuOfi, dAcuGer, dAcuGer1, dAcuGer2, dAcuHist, dValCor,dPlnCodigo : Double;
    dValLanc,dValOfi,dValGe1,dValGe2,dValGe3,dvalhistdeb :Double;
    sMens,sContaD,sContaC,sCCustoD,sCCustoC,sNumDoc : string;
    iSubContaC,iSubContaD,iModulo,iPlanoPrev,iPatro :Integer;

    sHist1,sHist2,sHist3,sHist4,sHist5,sHistorico :string;

    _sqlSaldosN  :TCMSqlParams;
    _sqlSaldos   :TCMSqlParams;
    _sqlSaldosS  :TCMSqlParams;

    _cdsSaldos   : TClientDataSet;
    _cdsSaldosS  : TClientDataSet;
    _cdsSaldosN  : TClientDataSet;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GeraLancaRateioAtivProj(dEmpresa,iUsuario,iPlano,
                                         iExercicio, iPeriodo,iUnidNegoc, sTipoOper,
                                         sDataLanc,bUsaPPatro,FsMensAPS_Log);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
         FsMensAPS_Log := Connection.AppServer.MessageInfo;


   End Else
   Begin
      FMaxProgresso := 0;
      FProgresso    := 0;
      sMens         := '';
      FsMensAPS_Log := '';
      MessageInfo   := '*';
      iModulo       := 1;
      dPlnCodigo    := 0;

      _sqlSaldosN  := TCMSqlParams.Create(nil);
      _sqlSaldosN.ControlObject := Self;

      _sqlSaldosS  := TCMSqlParams.Create(nil);
      _sqlSaldosS.ControlObject := Self;

      _sqlSaldos  := TCMSqlParams.Create(nil);
      _sqlSaldos.ControlObject := Self;

      _cdsSaldosN  := TClientDataSet.Create(nil);
      _cdsSaldos   := TClientDataSet.Create(nil);
      _cdsSaldosS  := TClientDataSet.Create(nil);

      Try

          StartTransaction;


          For i := 1 to 2 do
          Begin

             With _sqlSaldosN do
             Begin
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
                SQL.Add('       C.PLATIPO,C.PLACONTASEGREG,S.PLACONTA,S.CODSUBCONTA,S.CODCENTROCUSTO,S.UNIDNEGOC,S.IDPLANOPREV,S.IDPATRO  ');
                SQL.Add('FROM PLANOSALDO S, PLANOCONTA C                                                       ');
                SQL.Add('WHERE                                                                                 ');
                SQL.Add('       (S.PLACONTA = C.PLACONTA) AND                                                  ');
                SQL.Add('       (S.PLANO = C.PLANO) AND                                                        ');

                if iUnidNegoc <> 0 then
                   SQL.Add('       (S.UNIDNEGOC = '+IntToStr(iUnidNegoc) +') AND                                 ');

                SQL.Add('       (C.PLARATEIOAP = ''N'') AND                                                    ');
                SQL.Add('       (S.PEREXERCICIO =:PEREXERCICIO) AND                                            ');

                if i = 1 then
                begin
                   SQL.Add('    (C.PLAGRUPO IN (''R'', ''D'', ''C'', ''O'')) AND                               ');
                   SQL.Add('    (S.PERNUMERO =:PERNUMERO) AND                                                  ');
                end else
                begin
                   SQL.Add('    (C.PLAGRUPO NOT IN (''R'', ''D'', ''C'', ''O'')) AND                           ');
                   SQL.Add('    ((S.PERNUMERO <=:PERNUMERO) OR (S.PERNUMERO IS NULL)) AND                      ');
                end;
                SQL.Add('       (S.IDPESSOA     =:IDPESSOA)                                                    ');
                SQL.Add('GROUP BY                                                                              ');
                SQL.Add('       C.PLATIPO,C.PLACONTASEGREG,S.PLACONTA,S.CODSUBCONTA,S.CODCENTROCUSTO, S.UNIDNEGOC,S.IDPLANOPREV,S.IDPATRO ');
                SQL.Add('ORDER BY S.PLACONTA,S.CODSUBCONTA,S.CODCENTROCUSTO,S.UNIDNEGOC,S.IDPLANOPREV,S.IDPATRO');

                Prepare;
                ParamByName('PEREXERCICIO').asInteger := iExercicio;
                ParamByName('PERNUMERO').asInteger    := iPeriodo;
                ParamByName('IDPESSOA').asFloat       := dEmpresa;

                _cdsSaldosN.Data := Data;
             End;


             With _sqlSaldosS do
             Begin
                SQL.Clear;
                SQL.Add('SELECT PERC, UNIDNEGOC FROM                                       ');
                SQL.Add('(SELECT (0) AS PERC, UNIDNEGOC                                    ');
                SQL.Add('FROM UNIDNEGOCIO                                                  ');
                SQL.Add('WHERE IDPESSOA =:IDPESSOA AND UNIDNEGOC NOT IN (SELECT UNIDNEGOC  ');
                SQL.Add('FROM RATEIOATIVPROJ WHERE                                         ');
                SQL.Add('        (PEREXERCICIO =:PEREXERCICIO) AND                         ');
                SQL.Add('        ((PERNUMERO <=:PERNUMERO) OR (PERNUMERO IS NULL)) AND     ');
                SQL.Add('        (IDPESSOA     =:IDPESSOA))                                ');
                SQL.Add('GROUP BY UNIDNEGOC                                                ');
                SQL.Add('UNION                                                             ');
                SQL.Add('SELECT DECODE(NVL(T.TOT,0),0,0,(SUM(R.VLRRATEIO)/T.TOT)) AS PERC, R.UNIDNEGOC AS UNIDNEGOC ');
                SQL.Add('FROM RATEIOATIVPROJ R,                                            ');
                SQL.Add('   (SELECT SUM(VLRRATEIO) AS TOT                                  ');
                SQL.Add('      FROM RATEIOATIVPROJ                                         ');
                SQL.Add('      WHERE                                                       ');
                SQL.Add('        (PEREXERCICIO =:PEREXERCICIO) AND                         ');
                SQL.Add('        ((PERNUMERO <=:PERNUMERO) OR (PERNUMERO IS NULL)) AND     ');
                SQL.Add('        (IDPESSOA     =:IDPESSOA)) T                              ');
                SQL.Add('WHERE                                                             ');
                SQL.Add('   (R.PEREXERCICIO =:PEREXERCICIO) AND                            ');
                SQL.Add('   ((R.PERNUMERO <=:PERNUMERO) OR (R.PERNUMERO IS NULL)) AND      ');
                SQL.Add('   (R.IDPESSOA     =:IDPESSOA)                                    ');
                SQL.Add('GROUP BY R.UNIDNEGOC, T.TOT)                                      ');
                SQL.Add('ORDER BY UNIDNEGOC                                                ');

                Prepare;
                ParamByName('PEREXERCICIO').asInteger := iExercicio;
                ParamByName('PERNUMERO').asInteger    := iPeriodo;
                ParamByName('IDPESSOA').asFloat       := dEmpresa;

                _cdsSaldosS.Data := Data;
             End;

             With _sqlSaldos do
             Begin
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
                SQL.Add('  S.PLACONTA,S.CODSUBCONTA,S.CODCENTROCUSTO,S.IDPLANOPREV,S.IDPATRO,          ');
                SQL.Add('  C.PLATIPO,C.PLACONTASEGREG,C.PLATIPCONVGER,C.PLATIPCONVGEREN1,C.PLATIPCONVGEREN2, C.PLATIPCONVOFICIAL  ');
                SQL.Add('FROM PLANOSALDO S, PLANOCONTA C                                               ');
                SQL.Add('WHERE                                                                         ');
                SQL.Add('  (S.PLACONTA = C.PLACONTA) AND                                               ');
                SQL.Add('  (S.PLANO = C.PLANO) AND                                                     ');

                if iUnidNegoc <> 0 then
                   SQL.Add('  (S.UNIDNEGOC = '+IntToStr(iUnidNegoc)+') AND                   ');

                SQL.Add('  (C.PLARATEIOAP = ''N'') AND                                                 ');

                SQL.Add('  (S.PEREXERCICIO =:PEREXERCICIO) AND                                         ');
                if i = 1 then begin
                   SQL.Add('(C.PLAGRUPO IN (''R'', ''D'', ''C'', ''O'')) AND                           ');
                   SQL.Add('(S.PERNUMERO =:PERNUMERO) AND                                              ');
                end else begin
                   SQL.Add('(C.PLAGRUPO NOT IN (''R'', ''D'', ''C'', ''O'')) AND                       ');
                   SQL.Add('((S.PERNUMERO <=:PERNUMERO) OR (S.PERNUMERO IS NULL)) AND                  ');
                end;
                SQL.Add('  (S.IDPESSOA     =:IDPESSOA)                                                 ');
                SQL.Add('GROUP BY                                                                      ');
                SQL.Add('  C.PLATIPO,C.PLACONTASEGREG,S.PLACONTA,S.CODSUBCONTA,S.CODCENTROCUSTO,S.IDPLANOPREV,S.IDPATRO,          ');
                SQL.Add('  C.PLATIPCONVGER,C.PLATIPCONVGEREN1,C.PLATIPCONVGEREN2, C.PLATIPCONVOFICIAL  ');
                SQL.Add('ORDER BY                                                                      ');
                SQL.Add('  S.PLACONTA,S.CODSUBCONTA,S.CODCENTROCUSTO                                   ');

                Prepare;
                ParamByName('PEREXERCICIO').asInteger := iExercicio;
                ParamByName('PERNUMERO').asInteger    := iPeriodo;
                ParamByName('IDPESSOA').asFloat       := dEmpresa;

                _cdsSaldos.Data := Data;

             End;

             FMaxProgresso :=  _cdsSaldos.RecordCount;

             _cdsSaldos.First;
             _cdsSaldosN.First;
             _cdsSaldosS.First;

             While not _cdsSaldos.Eof do
             Begin

                dAcuCor  := 0;
                dAcuOfi  := 0;
                dAcuGer  := 0;
                dAcuGer1 := 0;
                dAcuGer2 := 0;
                dAcuHist := 0;

                sMens := '';

                _cdsSaldosS.First;

                While (not _cdsSaldosS.eof) do
                Begin
                   dValCor     := _cdsSaldos.FieldByName('SALDOCOR2').asFloat  * _cdsSaldosS.FieldByName('PERC').asFloat;
                   dValOfi     := _cdsSaldos.FieldByName('SALDOOFI2').asFloat  * _cdsSaldosS.FieldByName('PERC').asFloat;
                   dValGe1     := _cdsSaldos.FieldByName('SALDOGER2').asFloat  * _cdsSaldosS.FieldByName('PERC').asFloat;
                   dValGe2     := _cdsSaldos.FieldByName('SALDOGER12').asFloat * _cdsSaldosS.FieldByName('PERC').asFloat;
                   dValGe3     := _cdsSaldos.FieldByName('SALDOGER22').asFloat * _cdsSaldosS.FieldByName('PERC').asFloat;
                   dValHistDeb := _cdsSaldos.FieldByName('SALDOHIST2').asFloat * _cdsSaldosS.FieldByName('PERC').asFloat;

                   Lancamento.lcValOfiDeb := dValOfi;
                   Lancamento.lcValGe1Deb := dValGe2;
                   Lancamento.lcValGerDeb := dValGe1;
                   Lancamento.lcValGe2Deb := dValGe3;
                   Lancamento.lcValHisDeb := dValHistDeb;

                   dAcuCor  := dAcuCor  + StrToFloat(formatFloat('###########0.00', dValCor));
                   dAcuOfi  := dAcuOfi  + StrToFloat(formatFloat('###########0.00', dValOfi));
                   dAcuGer  := dAcuGer  + StrToFloat(formatFloat('###########0.00', dValGe1));
                   dAcuGer1 := dAcuGer1 + StrToFloat(formatFloat('###########0.00', dValGe2));
                   dAcuGer2 := dAcuGer2 + StrToFloat(formatFloat('###########0.00', dValGe3));
                   dAcuHist := dAcuHist + StrToFloat(formatFloat('###########0.00', dValHistDeb));

                   While (not _cdsSaldosN.eof) and
                         (_cdsSaldosS.FieldByName('UNIDNEGOC').asInteger    = _cdsSaldosN.FieldByName('UNIDNEGOC').asInteger) and
                         (_cdsSaldos.FieldByName('PLACONTA').asString       = _cdsSaldosN.FieldByName('PLACONTA').asString) and
                         (_cdsSaldos.FieldByName('CODCENTROCUSTO').asString = _cdsSaldosN.FieldByName('CODCENTROCUSTO').asString) and
                         (_cdsSaldos.FieldByName('IDPATRO').asInteger       = _cdsSaldosN.FieldByName('IDPATRO').asInteger) and
                         (_cdsSaldos.FieldByName('IDPLANOPREV').asInteger   = _cdsSaldosN.FieldByName('IDPLANOPREV').asInteger) and
                         (_cdsSaldos.FieldByName('CODSUBCONTA').asInteger   = _cdsSaldosN.FieldByName('CODSUBCONTA').asInteger) do
                   Begin

                      dValCor := dValCor - _cdsSaldosN.FieldByName('SALDOCOR').asFloat;
                      dValOfi := dValOfi - _cdsSaldosN.FieldByName('SALDOOFI').asFloat;
                      dValGe1 := dValGe1 - _cdsSaldosN.FieldByName('SALDOGER').asFloat;
                      dValGe2 := dValGe2 - _cdsSaldosN.FieldByName('SALDOGER1').asFloat;
                      dValGe3 := dValGe3 - _cdsSaldosN.FieldByName('SALDOGER2').asFloat;
                      dValHistDeb := dValHistDeb - _cdsSaldosN.FieldByName('SALDOHIST').asFloat;
                      //
                      _cdsSaldosN.next;
                   End;

                   //Lança contabilidade
                   sNumDoc        := 'Rateio';

                   Lancamento.lcTipConvOfiDeb    := _cdsSaldos.FieldByName('PLATIPCONVOFICIAL').asString;
                   Lancamento.lcTipConvGerDeb    := _cdsSaldos.FieldByName('PLATIPCONVGER').asString;
                   Lancamento.lcTipConvGe1Deb    := _cdsSaldos.FieldByName('PLATIPCONVGEREN1').asString;
                   Lancamento.lcTipConvGe2Deb    := _cdsSaldos.FieldByName('PLATIPCONVGEREN2').asString;

                   sHist1         := 'Rateio por Cotas';
                   sHist2         := '';
                   sHist3         := '';
                   sHist4         := '';
                   sHist5         := '';
                   sHistorico     := '';

                   If _cdsSaldosS.FieldByName('UNIDNEGOC').AsString = '' then
                       iUnidNegoc := 0
                   Else
                       iUnidNegoc  := StrToInt(_cdsSaldosS.FieldByName('UNIDNEGOC').AsString);

                   if _cdsSaldos.FieldByName('PLACONTASEGREG').isNull then
                   begin
                      sContaD  := _cdsSaldos.FieldByName('PLACONTA').AsString;
                   end else
                   begin
                      sContaD  := _cdsSaldos.FieldByName('PLACONTASEGREG').AsString;
                   end;
                   sCCustoD        := _cdsSaldos.FieldByName('CODCENTROCUSTO').AsString;

                   If _cdsSaldos.FieldByName('CODSUBCONTA').AsString = '' then
                      iSubContaD  := 0
                   Else
                      iSubContaD := StrToInt(_cdsSaldos.FieldByName('CODSUBCONTA').AsString);

                   iPlanoPrev     := _cdsSaldos.FieldByName('IDPLANOPREV').AsInteger;
                   iPatro         := _cdsSaldos.FieldByName('IDPATRO').AsInteger;

                   sContaC        := '';
                   sCCustoC       := '';
                   iSubContaC     := 0;
                   cTipoLanc      := '0';
                   dValLanc       := dValCor;

                   FNomeRAteio := 'Gerando Ativ./Proj. : ' + IntToStr(iUnidNegoc);
                   FNomeCampo  := 'Gerando Conta : ' + sContaD;

                   If dValLanc <> 0 then
                   Begin
                      dValLanc := StrToFloat(format('%18.2f', [dValLanc]));
                      Lancamento.lcTestaConta := False;
                      If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                iPlanoPrev, iPatro,dPlnCodigo,0,
                                                sDataLanc,sNumDoc,sHist1,
                                                sHist2,sHist3,sHist4,sHist5,
                                                sTipoOper,sCCustoD,sContaD,
                                                sCCustoC,sContaC,sHistorico,
                                                dValLanc,False,bUsaPPatro) Then

                      Begin
                         sMensAPS := sMensAPS + Lancamento.MessageInfo + chr(13);
                         Raise Exception.Create(Lancamento.MessageInfo);
                      End Else
                      Begin
                           dPlnCodigo := Lancamento.RetornoPlnCodigo;
                      End;
                   End;
                   _cdsSaldosS.Next;
                End;

                sNumDoc        := 'Rateio';
                sHist1         := 'Acerto do Rateio por Cotas';
                sHist2         := '';
                sHist3         := '';
                sHist4         := '';
                sHist5         := '';
                sHistorico     := '';

                If _cdsSaldosS.FieldByName('UNIDNEGOC').AsString = '' then
                   iUnidNegoc := 0
                Else
                   iUnidNegoc     := StrToInt(_cdsSaldosS.FieldByName('UNIDNEGOC').AsString);

                if _cdsSaldos.FieldByName('PLACONTASEGREG').isNull then begin
                   sContaD        := _cdsSaldos.FieldByName('PLACONTA').AsString;
                end else begin
                   sContaD        := _cdsSaldos.FieldByName('PLACONTASEGREG').AsString;
                end;
                sCCustoD       := _cdsSaldos.FieldByName('CODCENTROCUSTO').AsString;
                iPlanoPrev     := _cdsSaldos.FieldByName('IDPLANOPREV').AsInteger;
                iPatro         := _cdsSaldos.FieldByName('IDPATRO').AsInteger;

                If _cdsSaldos.FieldByName('CODSUBCONTA').AsString = '' then
                   iSubContaD := 0
                Else
                   iSubContaD     := StrToInt(_cdsSaldos.FieldByName('CODSUBCONTA').AsString);

                sContaC        := '';
                sCCustoC       := '';
                iSubContaC     := 0;
                cTipoLanc      := '0';

                Lancamento.lcTipConvOfiDeb    := _cdsSaldos.FieldByName('PLATIPCONVOFICIAL').asString;
                Lancamento.lcTipConvGerDeb    := _cdsSaldos.FieldByName('PLATIPCONVGER').asString;
                Lancamento.lcTipConvGe1Deb    := _cdsSaldos.FieldByName('PLATIPCONVGEREN1').asString;
                Lancamento.lcTipConvGe2Deb    := _cdsSaldos.FieldByName('PLATIPCONVGEREN2').asString;


                FNomeRateio := 'Gerando Ativ./Proj. : ' + IntToStr(iUnidNegoc);
                FNomeCampo  := 'Gerando Conta : ' + sContaD;

                If _cdsSaldos.FieldByName('SALDOCOR2').asFloat <> dAcuCor then
                Begin

                   dValLanc    := _cdsSaldos.FieldByName('SALDOCOR2').asFloat - dAcuCor;

                   dValLanc := StrToFloat(format('%18.2f', [dValLanc]));

                   Lancamento.lcTestaConta := False;
                   If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                             iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                             iPlanoPrev, iPatro,dPlnCodigo,0,
                                             sDataLanc,sNumDoc,sHist1,
                                             sHist2,sHist3,sHist4,sHist5,
                                             sTipoOper,sCCustoD,sContaD,
                                             sCCustoC,sContaC,sHistorico,
                                             dValLanc,False,bUsaPPatro) Then

                   Begin
                      sMensAPS := sMensAPS + Lancamento.MessageInfo + chr(13);
                      Raise Exception.Create(Lancamento.MessageInfo);
                   End Else
                   Begin
                        dPlnCodigo := Lancamento.RetornoPlnCodigo;
                   End;
                End;

                If _cdsSaldos.FieldByName('SALDOOFI2').asFloat <> dAcuOfi then
                Begin

                   Lancamento.lcValOfiDeb := _cdsSaldos.FieldByName('SALDOOFI2').asFloat - dAcuOfi;

                   //dValOfi     := _cdsSaldos.FieldByName('SALDOOFI2').asFloat - dAcuOfi;

                   dValLanc    := 0;

                   dValLanc := StrToFloat(format('%18.2f', [dValLanc]));
                   Lancamento.lcTestaConta := False;
                   If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                             iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                             iPlanoPrev, iPatro,dPlnCodigo,0,
                                             sDataLanc,sNumDoc,sHist1,
                                             sHist2,sHist3,sHist4,sHist5,
                                             sTipoOper,sCCustoD,sContaD,
                                             sCCustoC,sContaC,sHistorico,
                                             dValLanc,False,bUsaPPatro) Then

                   Begin
                      sMensAPS := sMensAPS + Lancamento.MessageInfo + chr(13);
                      Raise Exception.Create(Lancamento.MessageInfo);
                   End Else
                   Begin
                        dPlnCodigo := Lancamento.RetornoPlnCodigo;
                   End;

                End;

                If _cdsSaldos.FieldByName('SALDOGER2').asFloat <> dAcuGer then
                Begin

                   dValLanc    := 0;

                   Lancamento.lcValGe1Deb := _cdsSaldos.FieldByName('SALDOGER2').asFloat - dAcuGer;

                   //dValGe1     := _cdsSaldos.FieldByName('SALDOGER2').asFloat - dAcuGer;

                   dValLanc := StrToFloat(format('%18.2f', [dValLanc]));
                   Lancamento.lcTestaConta := False;
                   If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                             iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                             iPlanoPrev, iPatro,dPlnCodigo,0,
                                             sDataLanc,sNumDoc,sHist1,
                                             sHist2,sHist3,sHist4,sHist5,
                                             sTipoOper,sCCustoD,sContaD,
                                             sCCustoC,sContaC,sHistorico,
                                             dValLanc,False,bUsaPPatro) Then

                   Begin
                      sMensAPS := sMensAPS + Lancamento.MessageInfo + chr(13);
                      Raise Exception.Create(Lancamento.MessageInfo);
                   End Else
                   Begin
                        dPlnCodigo := Lancamento.RetornoPlnCodigo;
                   End;

                End;

                If _cdsSaldos.FieldByName('SALDOGER12').asFloat <> dAcuGer1 then
                Begin

                   dValLanc    := 0;

                   Lancamento.lcValGe2Deb := _cdsSaldos.FieldByName('SALDOGER12').asFloat - dAcuGer1;

                   //dValGe2     := _cdsSaldos.FieldByName('SALDOGER12').asFloat - dAcuGer1;

                   dValLanc := StrToFloat(format('%18.2f', [dValLanc]));
                   Lancamento.lcTestaConta := False;
                   If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                             iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                             iPlanoPrev, iPatro,dPlnCodigo,0,
                                             sDataLanc,sNumDoc,sHist1,
                                             sHist2,sHist3,sHist4,sHist5,
                                             sTipoOper,sCCustoD,sContaD,
                                             sCCustoC,sContaC,sHistorico,
                                             dValLanc,False,bUsaPPatro) Then

                   Begin
                      sMensAPS := sMensAPS + Lancamento.MessageInfo + chr(13);
                      Raise Exception.Create(Lancamento.MessageInfo);
                   End Else
                   Begin
                      dPlnCodigo := Lancamento.RetornoPlnCodigo;
                   End;

                End;

                If _cdsSaldos.FieldByName('SALDOGER22').asFloat <> dAcuGer2 then
                Begin

                   dValLanc    := 0;

                   Lancamento.lcValGe2Deb := _cdsSaldos.FieldByName('SALDOGER22').asFloat - dAcuGer2;

                   //dValGe3     := _cdsSaldos.FieldByName('SALDOGER22').asFloat - dAcuGer2;

                   dValLanc := StrToFloat(format('%18.2f', [dValLanc]));
                   Lancamento.lcTestaConta := False;
                   If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                             iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                             iPlanoPrev, iPatro,dPlnCodigo,0,
                                             sDataLanc,sNumDoc,sHist1,
                                             sHist2,sHist3,sHist4,sHist5,
                                             sTipoOper,sCCustoD,sContaD,
                                             sCCustoC,sContaC,sHistorico,
                                             dValLanc,False,bUsaPPatro) Then

                   Begin
                      sMensAPS := sMensAPS + Lancamento.MessageInfo + chr(13);
                      Raise Exception.Create(Lancamento.MessageInfo);
                   End Else
                   Begin
                        dPlnCodigo := Lancamento.RetornoPlnCodigo;
                   End;

                End;

                If _cdsSaldos.FieldByName('SALDOHIST2').asFloat <> dAcuHist then
                Begin

                   dValLanc    := 0;

                   Lancamento.lcValHisDeb := _cdsSaldos.FieldByName('SALDOHIST2').asFloat - dAcuHist;

                   //dValHistDeb := FieldByName('SALDOHIST2').asFloat - rAcuHist;

                   dValLanc := StrToFloat(format('%18.2f', [dValLanc]));
                   Lancamento.lcTestaConta := False;
                   If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                             iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                             iPlanoPrev, iPatro,dPlnCodigo,0,
                                             sDataLanc,sNumDoc,sHist1,
                                             sHist2,sHist3,sHist4,sHist5,
                                             sTipoOper,sCCustoD,sContaD,
                                             sCCustoC,sContaC,sHistorico,
                                             dValLanc,False,bUsaPPatro) Then

                   Begin
                      sMensAPS := sMensAPS + Lancamento.MessageInfo + chr(13);
                      Raise Exception.Create(Lancamento.MessageInfo);
                   End Else
                   Begin
                      dPlnCodigo := Lancamento.RetornoPlnCodigo;
                   End;
                End;
                _cdsSaldos.Next;
                FProgresso := FProgresso + 1;
             End;                     // do next saldos
         End;                         // do for

         _sqlSaldosN.free;
         _sqlSaldos.free;
         _sqlSaldosS.free;
         _cdsSaldos.free;
         _cdsSaldosS.free;
         _cdsSaldosN.free;

         Commit;
         Result := True;

         MessageInfo := 'Geração efetuada com sucesso!';

         sMens :=  'Planilha de Cotas gerada com sucesso!' + chr(13);
         sMensAPS_Log := sMensAPS_Log + sMens + chr(13);

         sMensAPS_Log := sMensAPS_Log + '**********************************' + chr(13);

      Except
         on E:Exception Do
         Begin
            RollBack;
            Result := False;
            _sqlSaldosN.free;
            _sqlSaldos.free;
            _sqlSaldosS.free;
            _cdsSaldos.free;
            _cdsSaldosS.free;
            _cdsSaldosN.free;
            MessageInfo := sMens+' '+E.Message;
         End;
      End;
   End;

end;

function TCtrlProcessaContab.GeraLancaRateioADM(dEmpresa: Double; iUsuario,
  iPlano, iExercicio, iPeriodo: Integer; sTipoOper, sDataLanc: string;
  bUsaPPatro: Boolean): Boolean;

var
    cTipoLanc :char;
    dAcuCor, dAcuOfi, dAcuGer, dAcuGer1, dAcuGer2, dAcuHist, dValCor,dPlnCodigo : Double;
    dValLanc,dValOfi,dValGe1,dValGe2,dValGe3,dvalhistdeb :Double;
    sMens,sContaD,sContaC,sCCustoD,sCCustoC,sNumDoc : string;
    iSubContaC,iSubContaD,iModulo,iPlanoPrev,iPatro,iUnidNegoc :Integer;

    sHist1,sHist2,sHist3,sHist4,sHist5,sHistorico :string;

    _sqlRateio   :TCMSqlParams;
    _sqlSaldosS  :TCMSqlParams;
    _sqlSaldosN  :TCMSqlParams;

    _cdsSaldosS  : TClientDataSet;
    _cdsSaldosN  : TClientDataSet;
    _cdsRateio   : TClientDataSet;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GeraLancaRateioADM(dEmpresa,iUsuario,iPlano,
                                         iExercicio, iPeriodo,sTipoOper,
                                         sDataLanc,bUsaPPatro,FsMensAPS_Log);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
         FsMensAPS_Log := Connection.AppServer.MessageInfo;


   End Else
   Begin
      FMaxProgresso := 0;
      FProgresso    := 0;
      sMens         := '';
      FsMensAPS_Log := '';
      MessageInfo   := '*';
      iModulo       := 1;
      dPlnCodigo    := 0;


      _sqlRateio  := TCMSqlParams.Create(nil);
      _sqlRateio.ControlObject := Self;

      _sqlSaldosS  := TCMSqlParams.Create(nil);
      _sqlSaldosS.ControlObject := Self;

      _sqlSaldosN  := TCMSqlParams.Create(nil);
      _sqlSaldosN.ControlObject := Self;

      _cdsRateio   := TClientDataSet.Create(nil);
      _cdsSaldosS  := TClientDataSet.Create(nil);
      _cdsSaldosN  := TClientDataSet.Create(nil);

      Try

          StartTransaction;

          With _sqlSaldosS do
          Begin
             SQL.Clear;
             SQL.Add('SELECT                                           ');
             SQL.Add('   SUM(C.PERCRATEIO) AS SOMA, C.IDRATEIOAPEXTRA, ');
             SQL.Add('   R.NOMERATEIO                                  ');
             SQL.Add('FROM COMPORATEIOAP C, RATEIOAPEXTRA R            ');
             SQL.Add('WHERE                                            ');
             SQL.Add('   (R.IDRATEIOAPEXTRA = C.IDRATEIOAPEXTRA)       ');
             SQL.Add('GROUP BY C.IDRATEIOAPEXTRA, R.NOMERATEIO         ');
             SQL.Add('HAVING SUM(C.PERCRATEIO) <> 100                  ');
             SQL.Add('ORDER BY R.NOMERATEIO                            ');

             _cdsSaldosS.Data := Data;
          End;

          If not _cdsSaldosS.isEmpty then
          Begin
             sMens :=  '*** Existem Rateios com valores diferentes de 100% ***' + chr(13);
             MessageInfo := sMens;
             sMensAPS_Log := sMensAPS_Log + sMens + chr(13);

             while not _cdsSaldosS.eof do
             begin
                sMens := _cdsSaldosS.FieldByName('NOMERATEIO').asString + ' - ' + FloatToStr(_cdsSaldosS.FieldByName('SOMA').asFloat) + '%';
                MessageInfo := sMens;
                sMensAPS_Log := sMensAPS_Log + sMens + chr(13);

                _cdsSaldosS.Next;
             end;

             sMens := 'Problemas na geração de Lançamentos!' + chr(13);
             sMens := '************************************' + chr(13);

             sMensAPS_Log := sMensAPS_Log + sMens + chr(13);
             sMensAPS_Log := sMensAPS_Log + '**********************************' + chr(13);

             MessageInfo := 'Houve erros na geração. Verifique os Lançamentos com inconsistências.';

             Raise Exception.Create(sMens);

          End;

          With _sqlRateio do
          Begin
             SQL.Clear;
             SQL.Add('SELECT                                           ');
             SQL.Add('     UNIDNEGOC, IDRATEIOAPEXTRA, NOMERATEIO      ');
             SQL.Add('FROM RATEIOAPEXTRA                               ');
             SQL.Add('WHERE (IDPESSOA =:IDPESSOA)                      ');

             Prepare;
             ParamByName('IDPESSOA').asFloat := dEmpresa;

             _cdsRateio.Data := Data

          End;

          _cdsRateio.First;


          While not _cdsRateio.eof do
          Begin

            FNomeRateio :=  'Gerando Rateio : ' + _cdsRateio.FieldByName('NOMERATEIO').asString;

            _sqlSaldosN.SQL.Clear;
            _sqlSaldosN.SQL.Add('SELECT SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE)                  ');
            _sqlSaldosN.SQL.Add('         - DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDOCOR,            ');
            _sqlSaldosN.SQL.Add('       SUM(DECODE(S.PLSDEBITOOFICIAL, NULL, 0, S.PLSDEBITOOFICIAL)                    ');
            _sqlSaldosN.SQL.Add('         - DECODE(S.PLSCREDITOOFICIAL, NULL, 0, S.PLSCREDITOOFICIAL)) AS SALDOOFI,    ');
            _sqlSaldosN.SQL.Add('       SUM(DECODE(S.PLSDEBITOGER, NULL, 0, S.PLSDEBITOGER)                            ');
            _sqlSaldosN.SQL.Add('         - DECODE(S.PLSCREDITOGER, NULL, 0, S.PLSCREDITOGER)) AS SALDOGER,            ');
            _sqlSaldosN.SQL.Add('       SUM(DECODE(S.PLSDEBITOGEREN1, NULL, 0, S.PLSDEBITOGEREN1)                      ');
            _sqlSaldosN.SQL.Add('         - DECODE(S.PLSCREDITOGEREN1, NULL, 0, S.PLSCREDITOGEREN1)) AS SALDOGER1,     ');
            _sqlSaldosN.SQL.Add('       SUM(DECODE(S.PLSDEBITOGEREN2, NULL, 0, S.PLSDEBITOGEREN2)                      ');
            _sqlSaldosN.SQL.Add('         - DECODE(S.PLSCREDITOGEREN2, NULL, 0, S.PLSCREDITOGEREN2)) AS SALDOGER2,     ');
            _sqlSaldosN.SQL.Add('       SUM(DECODE(S.PLSDEBITOHIST, NULL, 0, S.PLSDEBITOHIST)                          ');
            _sqlSaldosN.SQL.Add('         - DECODE(S.PLSCREDITOHIST, NULL, 0, S.PLSCREDITOHIST)) AS SALDOHIST,         ');
            _sqlSaldosN.SQL.Add('       S.PLACONTA,S.CODSUBCONTA,S.CODCENTROCUSTO,S.IDPATRO,S.IDPLANOPREV              ');
            _sqlSaldosN.SQL.Add('FROM PLANOSALDO S, PLANOCONTA C                                                       ');
            _sqlSaldosN.SQL.Add('WHERE                                                                                 ');
            _sqlSaldosN.SQL.Add('       (S.PLACONTA = C.PLACONTA) AND                                                  ');
            _sqlSaldosN.SQL.Add('       (S.PLANO = C.PLANO) AND                                                        ');
            _sqlSaldosN.SQL.Add('       (C.PLATIPO = ''A'') AND                                                        ');
            _sqlSaldosN.SQL.Add('       (C.IDRATEIOAPEXTRA =:IDRATEIOAPEXTRA) AND                                      ');
            _sqlSaldosN.SQL.Add('       (S.UNIDNEGOC =:UNIDNEGOC) AND                                                  ');
            _sqlSaldosN.SQL.Add('       (S.PEREXERCICIO =:PEREXERCICIO) AND                                            ');
            _sqlSaldosN.SQL.Add('       (S.PERNUMERO =:PERNUMERO) AND                                                  ');
            _sqlSaldosN.SQL.Add('       (S.IDPESSOA =:IDPESSOA)                                                        ');
            _sqlSaldosN.SQL.Add('GROUP BY                                                                              ');
            _sqlSaldosN.SQL.Add('       S.PLACONTA,S.CODSUBCONTA,S.CODCENTROCUSTO,S.IDPATRO,S.IDPLANOPREV              ');
            _sqlSaldosN.SQL.Add('ORDER BY S.PLACONTA,S.CODSUBCONTA,S.CODCENTROCUSTO,S.IDPATRO,S.IDPLANOPREV            ');

            _sqlSaldosN.Prepare;
            _sqlSaldosN.ParamByName('PEREXERCICIO').asInteger    := iExercicio;
            _sqlSaldosN.ParamByName('PERNUMERO').asInteger       := iPeriodo;
            _sqlSaldosN.ParamByName('IDPESSOA').asFloat          := dEmpresa;
            _sqlSaldosN.ParamByName('UNIDNEGOC').asInteger       := _cdsRateio.FieldByName('UNIDNEGOC').asInteger;
            _sqlSaldosN.ParamByName('IDRATEIOAPEXTRA').asInteger := _cdsRateio.FieldByName('IDRATEIOAPEXTRA').asInteger;

            _cdsSaldosN.Data := _sqlSaldosN.Data;

            //==================================================================
            _sqlSaldosS.SQL.Clear;
            _sqlSaldosS.SQL.Add('SELECT UNIDNEGOC, PERCRATEIO           ');
            _sqlSaldosS.SQL.Add('FROM COMPORATEIOAP                     ');
            _sqlSaldosS.SQL.Add('WHERE                                  ');
            _sqlSaldosS.SQL.Add('   (IDRATEIOAPEXTRA =:IDRATEIOAPEXTRA) ');
            _sqlSaldosS.SQL.Add('ORDER BY UNIDNEGOC                     ');

            _sqlSaldosS.Prepare;
            _sqlSaldosS.ParamByName('IDRATEIOAPEXTRA').asInteger := _cdsRateio.FieldByName('IDRATEIOAPEXTRA').asInteger;

            _cdsSaldosS.Data := _sqlSaldosS.Data;

            FMaxProgresso := _cdsSaldosS.RecordCount;

            _cdsSaldosN.First;
            While not _cdsSaldosN.eof do
            Begin

               //Lança contabilidade
               dValCor        := _cdsSaldosN.FieldByName('SALDOCOR').asFloat * (-1);

               Lancamento.lcValOfiDeb := _cdsSaldosN.FieldByName('SALDOOFI').asFloat * (-1);
               Lancamento.lcValGe1Deb := _cdsSaldosN.FieldByName('SALDOGER1').asFloat * (-1);
               Lancamento.lcValGerDeb := _cdsSaldosN.FieldByName('SALDOGER').asFloat * (-1);
               Lancamento.lcValGe2Deb := _cdsSaldosN.FieldByName('SALDOGER2').asFloat * (-1);
               Lancamento.lcValHisDeb := _cdsSaldosN.FieldByName('SALDOHIST').asFloat * (-1);

               sNumDoc        := 'Rateio Admin.';
               sHist1         := _cdsSaldosN.FieldByName('NOMERATEIO').asString;
               sHist2         := '';
               sHist3         := '';
               sHist4         := '';
               sHist5         := '';
               sHistorico     := '';

               If _cdsRateio.FieldByName('UNIDNEGOC').AsString = '' then
                   iUnidNegoc := 0
               Else
                  iUnidNegoc  := StrToInt(_cdsRateio.FieldByName('UNIDNEGOC').AsString);

               iPlanoPrev     := _cdsSaldosN.FieldByName('IDPLANOPREV').AsInteger;
               iPatro         := _cdsSaldosN.FieldByName('IDPATRO').AsInteger;

               sContaD        := _cdsSaldosN.FieldByName('PLACONTA').AsString;
               sCCustoD       := _cdsSaldosN.FieldByName('CODCENTROCUSTO').AsString;

               If _cdsSaldosN.FieldByName('CODSUBCONTA').AsString = '' then
                  iSubContaD := 0
               Else
                  iSubContaD := StrToInt(_cdsSaldosN.FieldByName('CODSUBCONTA').AsString);

               sContaC        := '';
               sCCustoC       := '';

               iSubContaC     := 0;
               cTipoLanc      := '0';

               dValLanc       := dValCor;

               FNomeCampo := 'Gerando Conta : ' + sContaD;

               If dValLanc <> 0 then
               Begin
                   dValLanc := StrToFloat(format('%18.2f', [dValLanc]));
                   Lancamento.lcTestaConta := False;
                   If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                             iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                             iPlanoPrev, iPatro,dPlnCodigo,0,
                                             sDataLanc,sNumDoc,sHist1,
                                             sHist2,sHist3,sHist4,sHist5,
                                             sTipoOper,sCCustoD,sContaD,
                                             sCCustoC,sContaC,sHistorico,
                                             dValLanc,False,bUsaPPatro) Then

                   Begin
                      sMensAPS := sMensAPS + Lancamento.MessageInfo + chr(13);
                      Raise Exception.Create(Lancamento.MessageInfo);
                   End Else
                   Begin
                      dPlnCodigo := Lancamento.RetornoPlnCodigo;
                   End;
               End;

               _cdsSaldosS.First;

               dAcuCor  := 0;
               dAcuOfi  := 0;
               dAcuGer  := 0;
               dAcuGer1 := 0;
               dAcuGer2 := 0;
               dAcuHist := 0;

               While not _cdsSaldosS.eof do
               Begin

                  dValCor     := _cdsSaldosN.FieldByName('SALDOCOR').asFloat  * (_cdsSaldosS.FieldByName('PERCRATEIO').asFloat /100);
                  dValOfi     := _cdsSaldosN.FieldByName('SALDOOFI').asFloat  * (_cdsSaldosS.FieldByName('PERCRATEIO').asFloat /100);
                  dValGe1     := _cdsSaldosN.FieldByName('SALDOGER').asFloat  * (_cdsSaldosS.FieldByName('PERCRATEIO').asFloat /100);
                  dValGe2     := _cdsSaldosN.FieldByName('SALDOGER1').asFloat * (_cdsSaldosS.FieldByName('PERCRATEIO').asFloat /100);
                  dValGe3     := _cdsSaldosN.FieldByName('SALDOGER2').asFloat * (_cdsSaldosS.FieldByName('PERCRATEIO').asFloat /100);
                  dValHistDeb := _cdsSaldosN.FieldByName('SALDOHIST').asFloat * (_cdsSaldosS.FieldByName('PERCRATEIO').asFloat /100);

                  Lancamento.lcValOfiDeb := dValOfi;
                  Lancamento.lcValGe1Deb := dValGe2;
                  Lancamento.lcValGerDeb := dValGe1;
                  Lancamento.lcValGe2Deb := dValGe3;
                  Lancamento.lcValHisDeb := dValHistDeb;

                  dAcuCor  := dAcuCor  + StrToFloat(formatFloat('###########0.00', dValCor));
                  dAcuOfi  := dAcuOfi  + StrToFloat(formatFloat('###########0.00', dValOfi));
                  dAcuGer  := dAcuGer  + StrToFloat(formatFloat('###########0.00', dValGe1));
                  dAcuGer1 := dAcuGer1 + StrToFloat(formatFloat('###########0.00', dValGe2));
                  dAcuGer2 := dAcuGer2 + StrToFloat(formatFloat('###########0.00', dValGe3));
                  dAcuHist := dAcuHist + StrToFloat(formatFloat('###########0.00', dValHistDeb));

                  //Lança contabilidade
                  sNumDoc        := 'Rateio Admin.';
                  sHist1         := _cdsRateio.FieldByName('NOMERATEIO').asString;
                  sHist2         := '';
                  sHist3         := '';
                  sHist4         := '';
                  sHist5         := '';
                  sHistorico     := '';

                  If _cdsSaldosS.FieldByName('UNIDNEGOC').AsString = '' Then
                    iUnidNegoc := 0
                  Else
                    iUnidNegoc := StrToInt(_cdsSaldosS.FieldByName('UNIDNEGOC').AsString);

                  iPlanoPrev     := _cdsSaldosN.FieldByName('IDPLANOPREV').AsInteger;
                  iPatro         := _cdsSaldosN.FieldByName('IDPATRO').AsInteger;

                  sContaD        := _cdsSaldosN.FieldByName('PLACONTA').AsString;
                  sCCustoD       := _cdsSaldosN.FieldByName('CODCENTROCUSTO').AsString;

                  If _cdsSaldosN.FieldByName('CODSUBCONTA').AsString = '' Then
                     iSubContaD  := 0
                  Else
                     iSubContaD  := StrToInt(_cdsSaldosN.FieldByName('CODSUBCONTA').AsString);

                  sContaC        := '';
                  sCCustoC       := '';
                  iSubContaC     := 0;
                  cTipoLanc      := '0';

                  dValLanc       := dValCor;

                  FNomeCampo := 'Gerando Conta : ' + sContaD;

                  If dValLanc <> 0 then
                  Begin
                     dValLanc := StrToFloat(format('%18.2f', [dValLanc]));
                     Lancamento.lcTestaConta := False;
                     If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                               iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                               iPlanoPrev, iPatro,dPlnCodigo,0,
                                               sDataLanc,sNumDoc,sHist1,
                                               sHist2,sHist3,sHist4,sHist5,
                                               sTipoOper,sCCustoD,sContaD,
                                               sCCustoC,sContaC,sHistorico,
                                               dValLanc,False,bUsaPPatro) Then

                     Begin
                        sMensAPS := sMensAPS + Lancamento.MessageInfo + chr(13);
                        Raise Exception.Create(Lancamento.MessageInfo);
                     End Else
                     Begin
                        dPlnCodigo := Lancamento.RetornoPlnCodigo;
                     End;
                  End;

                  _cdsSaldosS.Next;
               End;

               //Se tiver diferenca FieldByName('SALDOCOR').Asfloat <> rAcuCor Acertar.
               sNumDoc        := 'Rateio Admin.';
               sHist1         := 'Acerto do Rateio Administrativo';
               sHist2         := '';
               sHist3         := '';
               sHist4         := '';
               sHist5         := '';
               sHistorico     := '';

               If _cdsSaldosS.FieldByName('UNIDNEGOC').AsString = '' Then
                  iUnidNegoc := 0
               Else
                 iUnidNegoc := StrToInt(_cdsSaldosS.FieldByName('UNIDNEGOC').AsString);

               iPlanoPrev     := _cdsSaldosN.FieldByName('IDPLANOPREV').AsInteger;
               iPatro         := _cdsSaldosN.FieldByName('IDPATRO').AsInteger;

               sContaD        := _cdsSaldosN.FieldByName('PLACONTA').AsString;
               sCCustoD       := _cdsSaldosN.FieldByName('CODCENTROCUSTO').AsString;

               If _cdsSaldosN.FieldByName('CODSUBCONTA').AsString = '' then
                 iSubContaD := 0
               Else
                 iSubContaD := StrToInt(_cdsSaldosN.FieldByName('CODSUBCONTA').AsString);

               sContaC        := '';
               sCCustoC       := '';
               iSubContaC     := 0;

               cTipoLanc      := '0';

               If _cdsSaldosN.FieldByName('SALDOCOR').asFloat <> dAcuCor then
               Begin

                  dValLanc := _cdsSaldosN.FieldByName('SALDOCOR').asFloat - dAcuCor;

                  dValLanc := StrToFloat(format('%18.2f', [dValLanc]));

                  Lancamento.lcTestaConta := False;
                  If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                            iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                            iPlanoPrev, iPatro,dPlnCodigo,0,
                                            sDataLanc,sNumDoc,sHist1,
                                            sHist2,sHist3,sHist4,sHist5,
                                            sTipoOper,sCCustoD,sContaD,
                                            sCCustoC,sContaC,sHistorico,
                                            dValLanc,False,bUsaPPatro) Then

                  Begin
                     sMensAPS := sMensAPS + Lancamento.MessageInfo + chr(13);
                     Raise Exception.Create(Lancamento.MessageInfo);
                  End Else
                  Begin
                     dPlnCodigo := Lancamento.RetornoPlnCodigo;
                  End;
               End;

               If _cdsSaldosN.FieldByName('SALDOOFI').asFloat <> dAcuOfi then
               Begin

                  //dValOfi     := _cdsSaldosN.FieldByName('SALDOOFI').asFloat - dAcuOfi;
                  Lancamento.lcValOfiDeb := _cdsSaldosN.FieldByName('SALDOOFI').asFloat - dAcuOfi;

                  dValLanc := StrToFloat(format('%18.2f', [dValLanc]));
                  Lancamento.lcTestaConta := False;
                  If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                            iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                            iPlanoPrev, iPatro,dPlnCodigo,0,
                                            sDataLanc,sNumDoc,sHist1,
                                            sHist2,sHist3,sHist4,sHist5,
                                            sTipoOper,sCCustoD,sContaD,
                                            sCCustoC,sContaC,sHistorico,
                                            dValLanc,False,bUsaPPatro) Then

                  Begin
                     sMensAPS := sMensAPS + Lancamento.MessageInfo + chr(13);
                     Raise Exception.Create(Lancamento.MessageInfo);
                  End Else
                  Begin
                     dPlnCodigo := Lancamento.RetornoPlnCodigo;
                  End;

               End;

               If _cdsSaldosN.FieldByName('SALDOGER').asFloat <> dAcuGer then
               Begin

                  //dValGe1     := _cdsSaldosN.FieldByName('SALDOGER').asFloat - dAcuGer;
                  Lancamento.lcValGerDeb := _cdsSaldosN.FieldByName('SALDOGER').asFloat - dAcuGer;

                  dValLanc := StrToFloat(format('%18.2f', [dValLanc]));
                  Lancamento.lcTestaConta := False;
                  If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                            iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                            iPlanoPrev, iPatro,dPlnCodigo,0,
                                            sDataLanc,sNumDoc,sHist1,
                                            sHist2,sHist3,sHist4,sHist5,
                                            sTipoOper,sCCustoD,sContaD,
                                            sCCustoC,sContaC,sHistorico,
                                            dValLanc,False,bUsaPPatro) Then

                  Begin
                     sMensAPS := sMensAPS + Lancamento.MessageInfo + chr(13);
                     Raise Exception.Create(Lancamento.MessageInfo);
                  End Else
                  Begin
                     dPlnCodigo := Lancamento.RetornoPlnCodigo;
                  End;
               End;

               If _cdsSaldosN.FieldByName('SALDOGER1').asFloat <> dAcuGer1 then
               Begin

                  //dValGe2     := _cdsSaldosN.FieldByName('SALDOGER1').asFloat - dAcuGer1;
                  Lancamento.lcValGerDeb := _cdsSaldosN.FieldByName('SALDOGER1').asFloat - dAcuGer1;

                  dValLanc := StrToFloat(format('%18.2f', [dValLanc]));
                  Lancamento.lcTestaConta := False;
                  If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                            iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                            iPlanoPrev, iPatro,dPlnCodigo,0,
                                            sDataLanc,sNumDoc,sHist1,
                                            sHist2,sHist3,sHist4,sHist5,
                                            sTipoOper,sCCustoD,sContaD,
                                            sCCustoC,sContaC,sHistorico,
                                            dValLanc,False,bUsaPPatro) Then

                  Begin
                     sMensAPS := sMensAPS + Lancamento.MessageInfo + chr(13);
                     Raise Exception.Create(Lancamento.MessageInfo);
                  End Else
                  Begin
                     dPlnCodigo := Lancamento.RetornoPlnCodigo;
                  End;
               End;

               If _cdsSaldosN.FieldByName('SALDOGER2').asFloat <> dAcuGer2 then
               Begin

                  //dValGe3   := _cdsSaldosN.FieldByName('SALDOGER2').asFloat - dAcuGer2;

                  Lancamento.lcValGe2Deb := _cdsSaldosN.FieldByName('SALDOGER2').asFloat - dAcuGer2;

                  dValLanc := StrToFloat(format('%18.2f', [dValLanc]));
                  Lancamento.lcTestaConta := False;
                  If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                            iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                            iPlanoPrev, iPatro,dPlnCodigo,0,
                                            sDataLanc,sNumDoc,sHist1,
                                            sHist2,sHist3,sHist4,sHist5,
                                            sTipoOper,sCCustoD,sContaD,
                                            sCCustoC,sContaC,sHistorico,
                                            dValLanc,False,bUsaPPatro) Then

                  Begin
                     sMensAPS := sMensAPS + Lancamento.MessageInfo + chr(13);
                     Raise Exception.Create(Lancamento.MessageInfo);
                  End Else
                  Begin
                     dPlnCodigo := Lancamento.RetornoPlnCodigo;
                  End;
               End;

               If _cdsSaldosN.FieldByName('SALDOHIST').asFloat <> dAcuHist then
               Begin

                  //dValHistDeb := _cdsSaldosN.FieldByName('SALDOHIST').asFloat - dAcuHist;
                  Lancamento.lcValHisDeb := _cdsSaldosN.FieldByName('SALDOHIST').asFloat - dAcuHist;

                  dValLanc := StrToFloat(format('%18.2f', [dValLanc]));
                  Lancamento.lcTestaConta := False;
                  If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                            iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                            iPlanoPrev, iPatro,dPlnCodigo,0,
                                            sDataLanc,sNumDoc,sHist1,
                                            sHist2,sHist3,sHist4,sHist5,
                                            sTipoOper,sCCustoD,sContaD,
                                            sCCustoC,sContaC,sHistorico,
                                            dValLanc,False,bUsaPPatro) Then

                  Begin
                     sMensAPS := sMensAPS + Lancamento.MessageInfo + chr(13);
                     Raise Exception.Create(Lancamento.MessageInfo);
                  End Else
                  Begin
                     dPlnCodigo := Lancamento.RetornoPlnCodigo;
                  End;
               End;
               _cdsSaldosN.Next;
               FProgresso := FProgresso + 1;
            End;

            _cdsRateio.Next;

          End;

          _sqlRateio.free;
          _sqlSaldosN.free;
          _sqlSaldosS.free;
          _cdsRateio.free;
          _cdsSaldosS.free;
          _cdsSaldosN.free;

          Commit;
          Result := True;

          MessageInfo := 'Planilhas de Cotas gerada com sucesso!';

          sMens :=  'Planilha de Cotas gerada com sucesso!' + chr(13);
          sMensAPS_Log := sMensAPS_Log + sMens + chr(13);

          sMensAPS_Log := sMensAPS_Log + '**********************************' + chr(13);

      Except
         on E:Exception Do
         Begin
            RollBack;
            Result := False;
            _sqlRateio.free;
            _sqlSaldosN.free;
            _sqlSaldosS.free;
            _cdsRateio.free;
            _cdsSaldosS.free;
            _cdsSaldosN.free;
            MessageInfo := sMens+' '+E.Message;
         End;
      End;
   End;
end;

function TCtrlProcessaContab.GeraRateioPorPrograma(dEmpresa: Double;
  iUsuario, iPlano, iExercicio, iPeriodo: Integer; sTipoOper,
  sDataGera: string; bUsaPPatro: Boolean): Boolean;

var
    cTipoLanc :char;
    dAcuCor, dAcuOfi, dAcuGer, dAcuGer1, dAcuGer2, dAcuHist, dValCor,dPlnCodigo,dTotLanc : Double;
    dValLanc,dValOfi,dValGe1,dValGe2,dValGe3,dvalhistdeb,dTotal,dPercentual :Double;
    sMens,sContaD,sContaC,sCCustoD,sCCustoC,sNumDoc,sHistoricoOri,sHistPad,sConta,sCCusto : string;
    iSubContaC,iSubContaD,iModulo,iPlanoPrev,iPatro,iUnidNegoc,iCodPlano,iX :Integer;

    sHist1,sHist2,sHist3,sHist4,sHist5,sHistorico :string;

  _sqlSaldosD       : TCMSqlParams;
  _sqlUpdPlanilha   : TCMSqlParams;
  _sqlSaldosDPP     : TCMSqlParams;
  _sqlRateio        : TCMSqlParams;
  _sqlSaldosO       : TCMSqlParams;
  _sqlSaldosOPP     : TCMSqlParams;
  _sqlContasRef     : TCMSqlParams;
  _sqlVerifPlanil   : TCMSqlParams;
  _sqlHistoPadrao   : TCMSqlParams;
  _sqlBuscaContaxCC : TCMSqlParams;
  _sqlInsContasxCC  : TCMSqlParams;
  _sqlPlanilhaGerada  : TCMSqlParams;

  _cdsPlanilhaGerada : TClientDataSet;
  _cdsBuscaContaxCC : TClientDataSet;
  _cdsHistoPadrao   : TClientDataSet;
  _cdsRateio        : TClientDataSet;
  _cdsContasRef     : TClientDataSet;
  _cdsVerifPlanil   : TClientDataSet;
  _cdsSaldosDPP     : TClientDataSet;
  _cdsSaldosD       : TClientDataSet;
  _cdsSaldosO       : TClientDataSet;
  _cdsSaldosOPP     : TClientDataSet;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GeraRateioPorPrograma(dEmpresa,iUsuario,iPlano,
                         iExercicio,iPeriodo,sTipoOper, sDataGera,bUsaPPatro,FsMensAPS_Log);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
         FsMensAPS_Log := Connection.AppServer.MessageInfo;


   End Else
   Begin
      FMaxProgresso := 0;
      FProgresso    := 0;
      sMens         := '';
      FsMensAPS_Log := '';
      MessageInfo   := '*';
      iModulo       := 1;
      dPlnCodigo    := 0;
      iSubContaD    := 0;
      iSubContaC    := 0;
      iUnidNegoc    := 0;

      _sqlSaldosD  := TCMSqlParams.Create(nil);
      _sqlSaldosD.ControlObject := Self;

      _sqlUpdPlanilha  := TCMSqlParams.Create(nil);
      _sqlUpdPlanilha.ControlObject := Self;

      _sqlSaldosDPP  := TCMSqlParams.Create(nil);
      _sqlSaldosDPP.ControlObject := Self;

      _sqlRateio  := TCMSqlParams.Create(nil);
      _sqlRateio.ControlObject := Self;

      _sqlSaldosO  := TCMSqlParams.Create(nil);
      _sqlSaldosO.ControlObject := Self;


      _sqlSaldosOPP  := TCMSqlParams.Create(nil);
      _sqlSaldosOPP.ControlObject := Self;

      _sqlContasRef  := TCMSqlParams.Create(nil);
      _sqlContasRef.ControlObject := Self;

      _sqlVerifPlanil  := TCMSqlParams.Create(nil);
      _sqlVerifPlanil.ControlObject := Self;

      _sqlHistoPadrao  := TCMSqlParams.Create(nil);
      _sqlHistoPadrao.ControlObject := Self;

      _sqlBuscaContaxCC  := TCMSqlParams.Create(nil);
      _sqlBuscaContaxCC.ControlObject := Self;

      _sqlPlanilhaGerada  := TCMSqlParams.Create(nil);
      _sqlPlanilhaGerada.ControlObject := Self;

      _sqlInsContasxCC  := TCMSqlParams.Create(nil);
      _sqlInsContasxCC.ControlObject := Self;

      _cdsBuscaContaxCC := TClientDataSet.Create(nil);
      _cdsHistoPadrao   := TClientDataSet.Create(nil);
      _cdsRateio        := TClientDataSet.Create(nil);
      _cdsContasRef     := TClientDataSet.Create(nil);
      _cdsVerifPlanil   := TClientDataSet.Create(nil);
      _cdsSaldosDPP     := TClientDataSet.Create(nil);
      _cdsSaldosD       := TClientDataSet.Create(nil);
      _cdsSaldosO       := TClientDataSet.Create(nil);
      _cdsSaldosOPP     := TClientDataSet.Create(nil);
      _cdsPlanilhaGerada:= TClientDataSet.Create(nil);

      //========= sql para buscar conta ==========
      _sqlBuscaContaxCC.SQL.Clear;
      _sqlBuscaContaxCC.SQL.Add('SELECT CODCENTROCUSTO                       ');
      _sqlBuscaContaxCC.SQL.Add('FROM  CONTASXCC                             ');
      _sqlBuscaContaxCC.SQL.Add('WHERE (CODCENTROCUSTO =:CODCENTROCUSTO) AND ');
      _sqlBuscaContaxCC.SQL.Add('      (IDEMPRESA =:IDEMPRESA) AND           ');
      _sqlBuscaContaxCC.SQL.Add('      (PLACONTA = :PLACONTA) AND            ');
      _sqlBuscaContaxCC.SQL.Add('      (PLANO = :PLANO)                      ');
      //=========================================

      _sqlRateio.SQL.Clear;
      _sqlRateio.SQL.Add('SELECT                                  ');
      _sqlRateio.SQL.Add('  P.PANDESCRICAO,                       ');
      _sqlRateio.SQL.Add('   P.PANCODIGO,                         ');
      _sqlRateio.SQL.Add('   P.PANCONTAPERC,                      ');
      _sqlRateio.SQL.Add('   D.PLANO,                             ');
      _sqlRateio.SQL.Add('   D.PANCONTABASE,                      ');
      _sqlRateio.SQL.Add('   D.IDPLANOPREV,                       ');
      _sqlRateio.SQL.Add('   D.IDPATRO,                           ');
      _sqlRateio.SQL.Add('   D.HITCODHIST                         ');
      _sqlRateio.SQL.Add('FROM                                    ');
      _sqlRateio.SQL.Add('   PREPLANILHA P, PREDETALHE D          ');
      _sqlRateio.SQL.Add('WHERE                                   ');
      _sqlRateio.SQL.Add('   ( P.PANIDENTIFICACAO = ''G'' ) AND   ');
      _sqlRateio.SQL.Add('   ( P.IDPESSOA = :IDPESSOA ) AND       ');
      _sqlRateio.SQL.Add('   ( D.PANCONTABASE IS NOT NULL) AND    ');
      _sqlRateio.SQL.Add('   ( P.PANINATIVO = ''N'') AND          ');
      _sqlRateio.SQL.Add('   ( D.PANCODIGO = P.PANCODIGO)         ');

      _sqlRateio.Prepare;
      _sqlRateio.ParamByName('IDPESSOA').asFloat := dEmpresa;
      _cdsRateio.Data := _sqlRateio.Data;

      FMaxProgresso := _cdsRateio.RecordCount;

      _cdsRateio.First;

      While not _cdsRateio.EOF do
      Begin

        FNomeRateio := 'Gerando Rateio : '+_cdsRateio.FieldByName('PANDESCRICAO').AsString;

        Try

           StartTransaction;

           //== pega as contas de referencia ===
           _sqlContasRef.SQL.Clear;
           _sqlContasRef.SQL.Add('SELECT  D.PLACONTA, D.PLANO, D.PANPERC ');
           _sqlContasRef.SQL.Add('FROM PREDETALHE D                      ');
           _sqlContasRef.SQL.Add('WHERE (D.PANCODIGO = :PANCODIGO) AND   ');
           _sqlContasRef.SQL.Add('      (D.PLACONTA IS NOT NULL)         ');

           _sqlContasRef.Prepare;
           _sqlContasRef.ParamByName('PANCODIGO').AsFloat := _cdsRateio.FieldByName('PANCODIGO').AsFloat;
           _cdsContasRef.Data := _sqlContasRef.Data;


           //=== Verifica se a planilha já foi gerada para ser excluida. ===
           _sqlVerifPlanil.SQL.Clear;
           _sqlVerifPlanil.SQL.Add('SELECT PLNCODIGO, PLNPLANIL, PLNDATDIA ');
           _sqlVerifPlanil.SQL.Add('FROM PLANILHA                          ');
           _sqlVerifPlanil.SQL.Add('WHERE (PANCODIGO = :PANCODIGO) AND     ');
           _sqlVerifPlanil.SQL.Add('      (PLNDATDIA = TO_DATE(:DATAREF,''DD/MM/YYYY'')) AND ');
           _sqlVerifPlanil.SQL.Add('      (IDPESSOA  = :IDPESSOA) ');

           _sqlVerifPlanil.Prepare;
           _sqlVerifPlanil.ParamByName('IDPESSOA').AsFloat    := dEmpresa;
           _sqlVerifPlanil.ParamByName('PANCODIGO').AsInteger := _cdsRateio.FieldByName('PANCODIGO').AsInteger;
           _sqlVerifPlanil.ParamByName('DATAREF').AsString    := sDataGera;

           _cdsVerifPlanil.Data := _sqlVerifPlanil.Data;

           If not _cdsVerifPlanil.isEmpty then
           Begin

              If not Lancamento.ExcluiLancaContab(iUsuario,_cdsVerifPlanil.FieldByName('PLNCODIGO').asInteger,
                                  iModulo, 0,bUsaPPatro, True) Then
              Begin
                  sMensAPS_Log := sMensAPS_Log + Lancamento.MessageInfo + chr(13);
                  Raise Exception.Create(Lancamento.MessageInfo);
              End;
              MessageInfo := 'Excluída a Planilha no. ' + _cdsVerifPlanil.FieldByName('PLNPLANIL').asString+ ' do dia '+sDataGera;
           End;

           dTotal := 0;
           If (_cdsRateio.FieldByName('PANCONTAPERC').IsNull) or (_cdsRateio.FieldByName('PANCONTAPERC').AsString <> 'P') then
           Begin

              _cdsContasRef.First;

              While not _cdsContasRef.EOF do
              Begin

                If (_cdsRateio.FieldByName('IDPLANOPREV').IsNull) or (_cdsRateio.FieldByName('IDPATRO').isNull) then
                Begin

                   _sqlSaldosD.SQL.Clear;
                   _sqlSaldosD.SQL.Add('SELECT  /*+ INDEX LANCAMENTO */      ');
                   _sqlSaldosD.SQL.Add('  SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDOCOR ');
                   _sqlSaldosD.SQL.Add('FROM PLANILHA P, LANCAMENTO L  ');
                   _sqlSaldosD.SQL.Add('WHERE (P.PEREXERCICIO = :PEREXERCICIO) AND ');
                   _sqlSaldosD.SQL.Add('       (P.PERNUMERO = :PERNUMERO) AND      ');
                   _sqlSaldosD.SQL.Add('       (P.IDPESSOA  = :IDPESSOA) AND       ');
                   _sqlSaldosD.SQL.Add('       (P.PLNDATDIA <= TO_DATE(:DATAREF,''DD/MM/YYYY'')) AND ');
                   _sqlSaldosD.SQL.Add('       (L.PLACONTA  LIKE :PLACONTA) AND  ');
                   _sqlSaldosD.SQL.Add('       (L.PLANO     = :PLANO) AND        ');
                   _sqlSaldosD.SQL.Add('       (P.PLNCODIGO = L.PLNCODIGO) AND   ');
                   _sqlSaldosD.SQL.Add('       (P.PLNEFETIVADO = ''S'')          ');

                   _sqlSaldosD.Prepare;
                   _sqlSaldosD.ParamByName('PLACONTA').AsString      := trim(_cdsContasRef.FieldByName('PLACONTA').AsString)+'%';
                   _sqlSaldosD.ParamByName('PLANO').AsInteger        := _cdsContasRef.FieldByName('PLANO').AsInteger;
                   _sqlSaldosD.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
                   _sqlSaldosD.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
                   _sqlSaldosD.ParamByName('IDPESSOA').AsFloat       := dEmpresa;
                   _sqlSaldosD.ParamByName('DATAREF').AsString       := sDataGera;

                   _cdsSaldosD.Data :=_sqlSaldosD.Data;

                   if not _cdsSaldosD.IsEmpty then
                      dTotal := dTotal + _cdsSaldosD.FieldByName('SALDOCOR').AsFloat;

                End Else
                Begin

                  _sqlSaldosDPP.SQL.Clear;
                  _sqlSaldosDPP.SQL.Add('SELECT  /*+ INDEX LANCAMENTO */   ');
                  _sqlSaldosDPP.SQL.Add('    SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDOCOR ');
                  _sqlSaldosDPP.SQL.Add('FROM PLANILHA P, LANCAMENTO L  ');
                  _sqlSaldosDPP.SQL.Add('WHERE (P.PEREXERCICIO = :PEREXERCICIO) AND ');
                  _sqlSaldosDPP.SQL.Add('      (P.PERNUMERO = :PERNUMERO) AND       ');
                  _sqlSaldosDPP.SQL.Add('      (P.IDPESSOA  = :IDPESSOA) AND        ');
                  _sqlSaldosDPP.SQL.Add('      (P.PLNDATDIA <= TO_DATE(:DATAREF,''DD/MM/YYYY'')) AND ');
                  _sqlSaldosDPP.SQL.Add('      (L.PLACONTA  LIKE :PLACONTA) AND   ');
                  _sqlSaldosDPP.SQL.Add('      (L.PLANO     = :PLANO) AND         ');
                  _sqlSaldosDPP.SQL.Add('      (L.IDPLANOPREV = :IDPLANOPREV) AND ');
                  _sqlSaldosDPP.SQL.Add('      (L.IDPATRO = :IDPATRO) AND         ');
                  _sqlSaldosDPP.SQL.Add('      (P.PLNCODIGO = L.PLNCODIGO) AND    ');
                  _sqlSaldosDPP.SQL.Add('      (P.PLNEFETIVADO = ''S'')           ');

                  _sqlSaldosDPP.Prepare;
                  _sqlSaldosDPP.ParamByName('PLACONTA').AsString      := trim(_cdsContasRef.FieldByName('PLACONTA').AsString)+'%';
                  _sqlSaldosDPP.ParamByName('PLANO').AsInteger        := _cdsContasRef.FieldByName('PLANO').AsInteger;
                  _sqlSaldosDPP.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
                  _sqlSaldosDPP.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
                  _sqlSaldosDPP.ParamByName('IDPESSOA').AsFloat       := dEmpresa;
                  _sqlSaldosDPP.ParamByName('DATAREF').AsString       := sDataGera;
                  _sqlSaldosDPP.ParamByName('IDPATRO').AsInteger      := _cdsRateio.FieldByName('IDPATRO').AsInteger;
                  _sqlSaldosDPP.ParamByName('IDPLANOPREV').AsInteger  := _cdsRateio.FieldByName('IDPLANOPREV').AsInteger;

                  _cdsSaldosDPP.Data := _sqlSaldosDPP.Data;

                   if not _cdsSaldosDPP.IsEmpty then
                      dTotal := dTotal + _cdsSaldosDPP.FieldByName('SALDOCOR').AsFloat;
                End;
                _cdsContasRef.Next;
              End;
           End;

           If (_cdsRateio.FieldByName('IDPLANOPREV').IsNull) or (_cdsRateio.FieldByName('IDPATRO').isNull) then
           Begin

             _sqlSaldosO.SQL.Clear;
             _sqlSaldosO.SQL.Add('SELECT L.PLACONTA, L.CODCENTROCUSTO, L.IDEMPRESA, L.UNIDNEGOC, ');
             _sqlSaldosO.SQL.Add('       L.IDPLANOPREV, L.IDPATRO, L.CODSUBCONTA,   ');
             _sqlSaldosO.SQL.Add('       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDOCOR ');
             _sqlSaldosO.SQL.Add('FROM PLANILHA P, LANCAMENTO L                                ');
             _sqlSaldosO.SQL.Add('WHERE (L.PLACONTA LIKE :PLACONTA) AND                        ');
             _sqlSaldosO.SQL.Add('      (L.PLANO = :PLANO) AND                                 ');
             _sqlSaldosO.SQL.Add('      (P.PEREXERCICIO = :PEREXERCICIO) AND                   ');
             _sqlSaldosO.SQL.Add('      (P.PERNUMERO = :PERNUMERO) AND                         ');
             _sqlSaldosO.SQL.Add('      (P.IDPESSOA = :IDPESSOA) AND                           ');
             _sqlSaldosO.SQL.Add('      (P.PLNEFETIVADO = ''S'') AND                           ');
             _sqlSaldosO.SQL.Add('      (P.PLNDATDIA <= TO_DATE(:DATAREF,''DD/MM/YYYY'')) AND  ');
             _sqlSaldosO.SQL.Add('      (P.PLNCODIGO = L.PLNCODIGO)                            ');
             _sqlSaldosO.SQL.Add('GROUP BY L.PLACONTA, L.CODCENTROCUSTO, L.IDEMPRESA, L.UNIDNEGOC, ');
             _sqlSaldosO.SQL.Add('         L.IDPLANOPREV, L.IDPATRO, L.CODSUBCONTA                 ');

             _sqlSaldosO.Prepare;
             _sqlSaldosO.ParamByName('PLACONTA').AsString      := trim(_cdsRateio.FieldByName('PANCONTABASE').AsString)+'%';
             _sqlSaldosO.ParamByName('PLANO').AsInteger        := _cdsRateio.FieldByName('PLANO').AsInteger;
             _sqlSaldosO.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
             _sqlSaldosO.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
             _sqlSaldosO.ParamByName('IDPESSOA').AsFloat       := dEmpresa;
             _sqlSaldosO.ParamByName('DATAREF').AsString       := sDataGera;

             _cdsSaldosO.Data := _sqlSaldosO.Data;
           End Else
           Begin

             _sqlSaldosOPP.SQL.Clear;
             _sqlSaldosOPP.SQL.Add('SELECT L.PLACONTA, L.CODCENTROCUSTO, L.IDEMPRESA, L.UNIDNEGOC, ');
             _sqlSaldosOPP.SQL.Add('       L.IDPLANOPREV, L.IDPATRO, L.CODSUBCONTA,                ');
             _sqlSaldosOPP.SQL.Add('       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDOCOR ');
             _sqlSaldosOPP.SQL.Add('FROM PLANILHA P, LANCAMENTO L                                              ');
             _sqlSaldosOPP.SQL.Add('WHERE (L.PLACONTA LIKE :PLACONTA) AND                                      ');
             _sqlSaldosOPP.SQL.Add('      (L.PLANO = :PLANO) AND                                               ');
             _sqlSaldosOPP.SQL.Add('      (P.PEREXERCICIO = :PEREXERCICIO) AND                                 ');
             _sqlSaldosOPP.SQL.Add('      (P.PERNUMERO = :PERNUMERO) AND                                       ');
             _sqlSaldosOPP.SQL.Add('      (P.IDPESSOA = :IDPESSOA) AND                                         ');
             _sqlSaldosOPP.SQL.Add('      (L.IDPLANOPREV = :IDPLANOPREV) AND                                   ');
             _sqlSaldosOPP.SQL.Add('      (L.IDPATRO = :IDPATRO) AND                                           ');
             _sqlSaldosOPP.SQL.Add('      (P.PLNEFETIVADO = ''S'') AND                                           ');
             _sqlSaldosOPP.SQL.Add('      (P.PLNDATDIA <= TO_DATE(:DATAREF,''DD/MM/YYYY'')) AND                  ');
             _sqlSaldosOPP.SQL.Add('      (P.PLNCODIGO = L.PLNCODIGO)                                          ');
             _sqlSaldosOPP.SQL.Add('GROUP BY L.PLACONTA, L.CODCENTROCUSTO, L.IDEMPRESA, L.UNIDNEGOC,           ');
             _sqlSaldosOPP.SQL.Add('         L.IDPLANOPREV, L.IDPATRO, L.CODSUBCONTA                           ');

             _sqlSaldosOPP.Prepare;
             _sqlSaldosOPP.ParamByName('PLACONTA').AsString      := trim(_cdsRateio.FieldByName('PANCONTABASE').AsString)+'%';
             _sqlSaldosOPP.ParamByName('PLANO').AsInteger        := _cdsRateio.FieldByName('PLANO').AsInteger;
             _sqlSaldosOPP.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
             _sqlSaldosOPP.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
             _sqlSaldosOPP.ParamByName('IDPESSOA').AsFloat       := dEmpresa;
             _sqlSaldosOPP.ParamByName('DATAREF').AsString       := sDataGera;
             _sqlSaldosOPP.ParamByName('IDPATRO').AsInteger      := _cdsRateio.FieldByName('IDPATRO').AsInteger;
             _sqlSaldosOPP.ParamByName('IDPLANOPREV').AsInteger  := _cdsRateio.FieldByName('IDPLANOPREV').AsInteger;

             _cdsSaldosOPP.Data := _sqlSaldosOPP.Data;

          end;

          sHistoricoOri := _cdsRateio.FieldByName('PANDESCRICAO').asString;
          sHistPad      := '';

          If not _cdsRateio.FieldByName('HITCODHIST').IsNull then
          Begin

            _sqlHistoPadrao.SQL.Clear;
            _sqlHistoPadrao.SQL.Add('SELECT HITCODHIST, HITDESCR1       ');
            _sqlHistoPadrao.SQL.Add('FROM HISTOPADRAO                   ');
            _sqlHistoPadrao.SQL.Add('WHERE (IDPESSOA = :IDPESSOA) AND   ');
            _sqlHistoPadrao.SQL.Add('      (HITCODHIST = :HITCODHIST)   ');

            _sqlHistoPadrao.Prepare;
            _sqlHistoPadrao.ParamByName('IDPESSOA').AsFloat    := dEmpresa;
            _sqlHistoPadrao.ParamByName('HITCODHIST').AsString := Copy(_cdsRateio.FieldByName('HITCODHIST').AsString + '    ',1,4);
            _cdsHistoPadrao.Data := _sqlHistoPadrao.Data;

             if not _cdsHistoPadrao.IsEmpty then
             begin
                sHistoricoOri := _cdsHistoPadrao.FieldByName('HITDESCR1').asString;
                sHistPad      := _cdsRateio.FieldByName('HITCODHIST').AsString;
             end;
          end;
          dValOfi        := 0;
          dValGe1        := 0;
          dValGe2        := 0;
          dValGe3        := 0;
          dValHistDeb    := 0;
          iCodPlano      := iPlano;
          sNumDoc        := 'Rateio por Prog';
          cTipoLanc      := '2';

          If (_cdsRateio.FieldByName('IDPLANOPREV').IsNull) or (_cdsRateio.FieldByName('IDPATRO').isNull) then
          Begin

             _cdsSaldosO.First;

             While not _cdsSaldosO.EOF do
             Begin
                dTotLanc       := 0;
                iPlanoPrev     := _cdsSaldosO.FieldByName('IDPLANOPREV').AsInteger;
                iPatro         := _cdsSaldosO.FieldByName('IDPATRO').AsInteger;

                _cdsContasRef.First;

                While not _cdsContasRef.EOF do
                Begin

                   If _cdsRateio.FieldByName('PANCONTAPERC').AsString = 'P' then
                   Begin
                      dPercentual    := _cdsContasRef.FieldByName('PANPERC').AsFloat/100;
                   End Else
                   Begin
                      _sqlSaldosD.SQL.Clear;
                      _sqlSaldosD.SQL.Add('SELECT  /*+ INDEX LANCAMENTO */                        ');
                      _sqlSaldosD.SQL.Add('SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDOCOR ');
                      _sqlSaldosD.SQL.Add('FROM PLANILHA P, LANCAMENTO L                                       ');
                      _sqlSaldosD.SQL.Add('WHERE                                                               ');
                      _sqlSaldosD.SQL.Add('      (P.PEREXERCICIO = :PEREXERCICIO) AND                          ');
                      _sqlSaldosD.SQL.Add('      (P.PERNUMERO = :PERNUMERO) AND                                ');
                      _sqlSaldosD.SQL.Add('      (P.IDPESSOA  = :IDPESSOA) AND                                 ');
                      _sqlSaldosD.SQL.Add('      (P.PLNDATDIA <= TO_DATE(:DATAREF,''DD/MM/YYYY'')) AND           ');
                      _sqlSaldosD.SQL.Add('      (L.PLACONTA  LIKE :PLACONTA) AND                              ');
                      _sqlSaldosD.SQL.Add('      (L.PLANO     = :PLANO) AND                                    ');
                      _sqlSaldosD.SQL.Add('      (P.PLNCODIGO = L.PLNCODIGO) AND                               ');
                      _sqlSaldosD.SQL.Add('      (P.PLNEFETIVADO = ''S'')                                        ');

                      _sqlSaldosD.Prepare;
                      _sqlSaldosD.ParamByName('PLACONTA').AsString      := _cdsContasRef.FieldByName('PLACONTA').AsString+'%';
                      _sqlSaldosD.ParamByName('PLANO').AsInteger        := _cdsContasRef.FieldByName('PLANO').AsInteger;
                      _sqlSaldosD.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
                      _sqlSaldosD.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
                      _sqlSaldosD.ParamByName('IDPESSOA').AsFloat       := dEmpresa;
                      _sqlSaldosD.ParamByName('DATAREF').AsString       := sDataGera;
                      _cdsSaldosD.Data := _sqlSaldosD.Data;

                      if dTotal <> 0 then
                         dPercentual := _cdsSaldosD.FieldByName('SALDOCOR').AsFloat/dTotal
                      else
                         dPercentual := 0;
                   end;
                   sHistorico := sHistoricoOri+' '+format('%18.7f', [dPercentual*100])+'%';
                   sHist1     := '';
                   sHist2     := '';
                   sHist3     := '';
                   sHist4     := '';
                   sHist5     := '';

                   HistoContab.ArrumaHistorico(sHistorico);
                   //
                   iX             := length(trim(_cdsContasRef.FieldByName('PLACONTA').AsString));
                   sConta         := trim(trim(_cdsContasRef.FieldByName('PLACONTA').AsString)+copy(_cdsSaldosO.FieldByName('PLACONTA').AsString,(iX+1),(18-iX)));
                   iCodPlano      := _cdsContasRef.FieldByName('PLANO').AsInteger;

                   dValCor        := (_cdsSaldosO.FieldByName('SALDOCOR').AsFloat * dPercentual);

                   If _cdsSaldosO.FieldByName('UNIDNEGOC').AsString = '' then
                      iUnidNegoc := 0
                   Else
                     iUnidNegoc  := StrToInt(_cdsSaldosO.FieldByName('UNIDNEGOC').AsString);

                   sContaD        := sConta;
                   sCCustoD       := _cdsSaldosO.FieldByName('CODCENTROCUSTO').AsString;

                   If _cdsSaldosO.FieldByName('CODSUBCONTA').AsString = '' then
                      iSubContaD := 0
                   Else
                      iSubContaD := StrToInt(_cdsSaldosO.FieldByName('CODSUBCONTA').AsString);

                   sContaC        := _cdsSaldosO.FieldByName('PLACONTA').AsString;
                   sCCustoC       := sCCustoD;
                   iSubContaC     := iSubContaD;
                   dValLanc       := dValCor;

                   //=== faz lancamento ===
                   FNomeCampo := 'Gerando Conta : ' + sContaD;

                   If dValLanc <> 0 then
                   Begin
                      dValLanc := StrToFloat(format('%18.2f', [dValLanc]));
                      dTotLanc := dTotLanc + dValLanc;

                      //========== insere conta debito ===========
                      If sCCusto <> '' then
                      Begin

                        _sqlBuscaContaxCC.Prepare;
                        _sqlBuscaContaxCC.ParamByName('CODCENTROCUSTO').asString := Copy(sCCustoD + '          ',1,10);
                        _sqlBuscaContaxCC.ParamByName('IDEMPRESA').asFloat       := dEmpresa;
                        _sqlBuscaContaxCC.ParamByName('PLANO').asInteger         := iCodPlano;
                        _sqlBuscaContaxCC.ParamByName('PLACONTA').asString       := Copy(sContaD + '                  ',1,18);

                        _cdsBuscaContaxCC.Data := _sqlBuscaContaxCC.Data;

                         If _cdsBuscaContaxCC.IsEmpty then
                         Begin
                            //==Insere o relacionamento da Conta e do Centro de Custo
                            _sqlInsContasxCC.SQL.Clear;
                            _sqlInsContasxCC.SQL.Add('INSERT INTO CONTASXCC              ');
                            _sqlInsContasxCC.SQL.Add('(PLANO, PLACONTA, CODCENTROCUSTO,  ');
                            _sqlInsContasxCC.SQL.Add('IDEMPRESA, IDUSUARIOINCLUSAO)      ');
                            _sqlInsContasxCC.SQL.Add('VALUES                             ');
                            _sqlInsContasxCC.SQL.Add('  (:PLANO, :PLACONTA, :CODCENTROCUSTO, ');
                            _sqlInsContasxCC.SQL.Add('  :IDEMPRESA, :IDUSUARIOINCLUSAO)      ');

                            _sqlInsContasxCC.Prepare;
                            _sqlInsContasxCC.ParamByName('PLANO').asInteger             := iCodPlano;
                            _sqlInsContasxCC.ParamByName('PLACONTA').asString           := sContaD;
                            _sqlInsContasxCC.ParamByName('CODCENTROCUSTO').asString     := sCCustoD;
                            _sqlInsContasxCC.ParamByName('IDEMPRESA').asFloat           := dEmpresa;
                            _sqlInsContasxCC.ParamByName('IDUSUARIOINCLUSAO').asInteger := iUsuario;

                            If not ExecSQL(_sqlInsContasxCC.SQLChanged,False) Then
                            Begin
                               sMens := 'Erro ao Inserir Dados na Tabela CONTASXCC.';
                               Raise Exception.Create(sMens);
                            End;
                         End;

                        //========== insere conta credito ===========
                        _sqlBuscaContaxCC.Prepare;
                        _sqlBuscaContaxCC.ParamByName('CODCENTROCUSTO').asString := Copy(sCCustoC + '          ',1,10);
                        _sqlBuscaContaxCC.ParamByName('IDEMPRESA').asFloat       := dEmpresa;
                        _sqlBuscaContaxCC.ParamByName('PLANO').asInteger         := iCodPlano;
                        _sqlBuscaContaxCC.ParamByName('PLACONTA').asString       := Copy(sContaC + '                  ',1,18);

                        _cdsBuscaContaxCC.Data := _sqlBuscaContaxCC.Data;

                         If _cdsBuscaContaxCC.IsEmpty then
                         Begin
                            _sqlInsContasxCC.SQL.Clear;
                            _sqlInsContasxCC.SQL.Add('INSERT INTO CONTASXCC              ');
                            _sqlInsContasxCC.SQL.Add('(PLANO, PLACONTA, CODCENTROCUSTO,  ');
                            _sqlInsContasxCC.SQL.Add('IDEMPRESA, IDUSUARIOINCLUSAO)      ');
                            _sqlInsContasxCC.SQL.Add('VALUES                             ');
                            _sqlInsContasxCC.SQL.Add('  (:PLANO, :PLACONTA, :CODCENTROCUSTO, ');
                            _sqlInsContasxCC.SQL.Add('  :IDEMPRESA, :IDUSUARIOINCLUSAO)      ');

                            _sqlInsContasxCC.Prepare;
                            _sqlInsContasxCC.ParamByName('PLANO').asInteger             := iCodPlano;
                            _sqlInsContasxCC.ParamByName('PLACONTA').asString           := sContaC;
                            _sqlInsContasxCC.ParamByName('CODCENTROCUSTO').asString     := sCCustoC;
                            _sqlInsContasxCC.ParamByName('IDEMPRESA').asFloat           := dEmpresa;
                            _sqlInsContasxCC.ParamByName('IDUSUARIOINCLUSAO').asInteger := iUsuario;

                            If not ExecSQL(_sqlInsContasxCC.SQLChanged,False) Then
                            Begin
                               sMens := 'Erro ao Inserir Dados na Tabela CONTASXCC.';
                               Raise Exception.Create(sMens);
                            End;
                         End;

                      End;
                      //==========================================
                      Lancamento.lcTestaConta := False;
                      If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                iCodPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                iPlanoPrev, iPatro,dPlnCodigo,0,
                                                sDataGera,sNumDoc,sHist1,
                                                sHist2,sHist3,sHist4,sHist5,
                                                sTipoOper,sCCustoD,sContaD,
                                                sCCustoC,sContaC,sHistorico,
                                                dValLanc,False,bUsaPPatro) Then

                      Begin
                         sMensAPS_Log := sMensAPS_Log + Lancamento.MessageInfo + chr(13);
                         Raise Exception.Create(Lancamento.MessageInfo);
                      End Else
                      Begin
                         dPlnCodigo := Lancamento.RetornoPlnCodigo;
                      End;

                   End;
                   _cdsContasRef.Next;
                End;

                If Format('%17.2f',[dTotLanc]) <> Format('%17.2f',[_cdsSaldosO.FieldByName('SALDOCOR').AsFloat]) then
                Begin
                   sHistorico := sHistoricoOri+' - Arredondamento';
                   sHist1     := '';
                   sHist2     := '';
                   sHist3     := '';
                   sHist4     := '';
                   sHist5     := '';

                   HistoContab.ArrumaHistorico(sHistorico);

                   dValLanc := StrToFloat(format('%18.2f', [(_cdsSaldosO.FieldByName('SALDOCOR').AsFloat-dTotLanc)]));

                   //========== insere conta debito ===========
                   If sCCusto <> '' then
                   Begin
                     _sqlBuscaContaxCC.SQL.Clear;
                     _sqlBuscaContaxCC.SQL.Add('SELECT CODCENTROCUSTO                       ');
                     _sqlBuscaContaxCC.SQL.Add('FROM  CONTASXCC                             ');
                     _sqlBuscaContaxCC.SQL.Add('WHERE (CODCENTROCUSTO =:CODCENTROCUSTO) AND ');
                     _sqlBuscaContaxCC.SQL.Add('      (IDEMPRESA =:IDEMPRESA) AND           ');
                     _sqlBuscaContaxCC.SQL.Add('      (PLACONTA = :PLACONTA) AND            ');
                     _sqlBuscaContaxCC.SQL.Add('      (PLANO = :PLANO)                      ');

                     _sqlBuscaContaxCC.Prepare;
                     _sqlBuscaContaxCC.ParamByName('CODCENTROCUSTO').asString := Copy(sCCustoD + '          ',1,10);
                     _sqlBuscaContaxCC.ParamByName('IDEMPRESA').asFloat       := dEmpresa;
                     _sqlBuscaContaxCC.ParamByName('PLANO').asInteger         := iCodPlano;
                     _sqlBuscaContaxCC.ParamByName('PLACONTA').asString       := Copy(sContaD + '                  ',1,18);

                     _cdsBuscaContaxCC.Data := _sqlBuscaContaxCC.Data;

                      If _cdsBuscaContaxCC.IsEmpty then
                      Begin
                         //==Insere o relacionamento da Conta e do Centro de Custo
                         _sqlInsContasxCC.SQL.Clear;
                         _sqlInsContasxCC.SQL.Add('INSERT INTO CONTASXCC              ');
                         _sqlInsContasxCC.SQL.Add('(PLANO, PLACONTA, CODCENTROCUSTO,  ');
                         _sqlInsContasxCC.SQL.Add('IDEMPRESA, IDUSUARIOINCLUSAO)      ');
                         _sqlInsContasxCC.SQL.Add('VALUES                             ');
                         _sqlInsContasxCC.SQL.Add('  (:PLANO, :PLACONTA, :CODCENTROCUSTO, ');
                         _sqlInsContasxCC.SQL.Add('  :IDEMPRESA, :IDUSUARIOINCLUSAO)      ');

                         _sqlInsContasxCC.Prepare;
                         _sqlInsContasxCC.ParamByName('PLANO').asInteger             := iCodPlano;
                         _sqlInsContasxCC.ParamByName('PLACONTA').asString           := sContaD;
                         _sqlInsContasxCC.ParamByName('CODCENTROCUSTO').asString     := sCCustoD;
                         _sqlInsContasxCC.ParamByName('IDEMPRESA').asFloat           := dEmpresa;
                         _sqlInsContasxCC.ParamByName('IDUSUARIOINCLUSAO').asInteger := iUsuario;

                         If not ExecSQL(_sqlInsContasxCC.SQLChanged,False) Then
                         Begin
                            sMens := 'Erro ao Inserir Dados na Tabela CONTASXCC.';
                            Raise Exception.Create(sMens);
                         End;
                      End;

                     //========== insere conta creito ===========
                     _sqlBuscaContaxCC.Prepare;
                     _sqlBuscaContaxCC.ParamByName('CODCENTROCUSTO').asString := Copy(sCCustoC + '          ',1,10);
                     _sqlBuscaContaxCC.ParamByName('IDEMPRESA').asFloat       := dEmpresa;
                     _sqlBuscaContaxCC.ParamByName('PLANO').asInteger         := iCodPlano;
                     _sqlBuscaContaxCC.ParamByName('PLACONTA').asString       := Copy(sContaC + '                  ',1,18);

                     _cdsBuscaContaxCC.Data := _sqlBuscaContaxCC.Data;

                      If _cdsBuscaContaxCC.IsEmpty then
                      Begin
                         _sqlInsContasxCC.SQL.Clear;
                         _sqlInsContasxCC.SQL.Add('INSERT INTO CONTASXCC              ');
                         _sqlInsContasxCC.SQL.Add('(PLANO, PLACONTA, CODCENTROCUSTO,  ');
                         _sqlInsContasxCC.SQL.Add('IDEMPRESA, IDUSUARIOINCLUSAO)      ');
                         _sqlInsContasxCC.SQL.Add('VALUES                             ');
                         _sqlInsContasxCC.SQL.Add('  (:PLANO, :PLACONTA, :CODCENTROCUSTO, ');
                         _sqlInsContasxCC.SQL.Add('  :IDEMPRESA, :IDUSUARIOINCLUSAO)      ');

                         _sqlInsContasxCC.Prepare;
                         _sqlInsContasxCC.ParamByName('PLANO').asInteger             := iCodPlano;
                         _sqlInsContasxCC.ParamByName('PLACONTA').asString           := sContaC;
                         _sqlInsContasxCC.ParamByName('CODCENTROCUSTO').asString     := sCCustoC;
                         _sqlInsContasxCC.ParamByName('IDEMPRESA').asFloat           := dEmpresa;
                         _sqlInsContasxCC.ParamByName('IDUSUARIOINCLUSAO').asInteger := iUsuario;

                         If not ExecSQL(_sqlInsContasxCC.SQLChanged,False) Then
                         Begin
                            sMens := 'Erro ao Inserir Dados na Tabela CONTASXCC.';
                            Raise Exception.Create(sMens);
                         End;
                      End;

                   End;

                   Lancamento.lcTestaConta := False;
                   If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                             iCodPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                             iPlanoPrev, iPatro,dPlnCodigo,0,
                                             sDataGera,sNumDoc,sHist1,
                                             sHist2,sHist3,sHist4,sHist5,
                                             sTipoOper,sCCustoD,sContaD,
                                             sCCustoC,sContaC,sHistorico,
                                             dValLanc,False,bUsaPPatro) Then

                   Begin
                      sMensAPS_Log := sMensAPS_Log + Lancamento.MessageInfo + chr(13);
                      Raise Exception.Create(Lancamento.MessageInfo);
                   End Else
                   Begin
                      dPlnCodigo := Lancamento.RetornoPlnCodigo;
                   End;
                End;
                _cdsSaldosO.Next;
             End;
          End Else
          Begin
             _cdsSaldosOPP.First;
             While not _cdsSaldosOPP.EOF do
             Begin
                dTotLanc   := 0;
                iPlanoPrev := _cdsSaldosOPP.FieldByName('IDPLANOPREV').AsInteger;
                iPatro     := _cdsSaldosOPP.FieldByName('IDPATRO').AsInteger;
                _cdsContasRef.First;
                While not _cdsContasRef.EOF do begin
                   if _cdsRateio.FieldByName('PANCONTAPERC').AsString = 'P' then
                   begin
                      dPercentual    := _cdsContasRef.FieldByName('PANPERC').AsFloat/100;
                   end else
                   begin
                      _sqlSaldosDPP.Prepare;
                      _sqlSaldosDPP.ParamByName('PLACONTA').AsString      := _cdsContasRef.FieldByName('PLACONTA').AsString+'%';
                      _sqlSaldosDPP.ParamByName('PLANO').AsInteger        := _cdsContasRef.FieldByName('PLANO').AsInteger;
                      _sqlSaldosDPP.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
                      _sqlSaldosDPP.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
                      _sqlSaldosDPP.ParamByName('IDPESSOA').AsFloat       := dEmpresa;
                      _sqlSaldosDPP.ParamByName('DATAREF').AsString       := sDataGera;
                      _sqlSaldosDPP.ParamByName('IDPATRO').AsInteger      := _cdsRateio.FieldByName('IDPATRO').AsInteger;
                      _sqlSaldosDPP.ParamByName('IDPLANOPREV').AsInteger  := _cdsRateio.FieldByName('IDPLANOPREV').AsInteger;

                      _cdsSaldosDPP.Data := _sqlSaldosDPP.Data;

                      if dTotal <> 0 then
                         dPercentual := _cdsSaldosDPP.FieldByName('SALDOCOR').AsFloat/dTotal
                      else
                         dPercentual := 0;
                   end;
                   sHistorico := sHistoricoOri+' '+format('%18.7f', [dPercentual*100])+'%';
                   sHist1     := '';
                   sHist2     := '';
                   sHist3     := '';
                   sHist4     := '';
                   sHist5     := '';

                   HistoContab.ArrumaHistorico(sHistorico);

                   iX             := length(trim(_cdsContasRef.FieldByName('PLACONTA').AsString));
                   sConta         := trim(trim(_cdsContasRef.FieldByName('PLACONTA').AsString)+copy(_cdsSaldosOPP.FieldByName('PLACONTA').AsString,(iX+1),(18-iX)));
                   iCodPlano      := _cdsContasRef.FieldByName('PLANO').AsInteger;

                   dValCor        := (_cdsSaldosOPP.FieldByName('SALDOCOR').AsFloat * dPercentual);

                   If _cdsSaldosOPP.FieldByName('UNIDNEGOC').AsString = '' then
                      iUnidNegoc := 0
                   Else
                      iUnidNegoc := StrToInt(_cdsSaldosOPP.FieldByName('UNIDNEGOC').AsString);

                   sContaD   := sConta;
                   sCCustoD  := _cdsSaldosOPP.FieldByName('CODCENTROCUSTO').AsString;

                   If _cdsSaldosOPP.FieldByName('CODSUBCONTA').AsString = '' then
                      iSubContaD := 0
                   Else
                      iSubContaD := StrToInt(_cdsSaldosOPP.FieldByName('CODSUBCONTA').AsString);

                   iPlanoPrev  := _cdsSaldosOPP.FieldByName('IDPLANOPREV').AsInteger;
                   iPatro      := _cdsSaldosOPP.FieldByName('IDPATRO').AsInteger;
                   sContaC     := _cdsSaldosOPP.FieldByName('PLACONTA').AsString;

                   sCCustoC    := sCCustoD;
                   iSubContaC  := iSubContaD;
                   dValLanc    := dValCor;

                   //========= Faz o lançamento =========
                   FNomeCampo := 'Gerando Conta : ' + sContaD;

                   If dValLanc <> 0 then
                   Begin
                      //========== insere conta debito ===========
                      If sCCusto <> '' then
                      Begin

                        _sqlBuscaContaxCC.Prepare;
                        _sqlBuscaContaxCC.ParamByName('CODCENTROCUSTO').asString := Copy(sCCustoD + '          ',1,10);
                        _sqlBuscaContaxCC.ParamByName('IDEMPRESA').asFloat       := dEmpresa;
                        _sqlBuscaContaxCC.ParamByName('PLANO').asInteger         := iCodPlano;
                        _sqlBuscaContaxCC.ParamByName('PLACONTA').asString       := Copy(sContaD + '                  ',1,18);

                        _cdsBuscaContaxCC.Data := _sqlBuscaContaxCC.Data;

                         If _cdsBuscaContaxCC.IsEmpty then
                         Begin
                            //==Insere o relacionamento da Conta e do Centro de Custo
                            _sqlInsContasxCC.SQL.Clear;
                            _sqlInsContasxCC.SQL.Add('INSERT INTO CONTASXCC              ');
                            _sqlInsContasxCC.SQL.Add('(PLANO, PLACONTA, CODCENTROCUSTO,  ');
                            _sqlInsContasxCC.SQL.Add('IDEMPRESA, IDUSUARIOINCLUSAO)      ');
                            _sqlInsContasxCC.SQL.Add('VALUES                             ');
                            _sqlInsContasxCC.SQL.Add('  (:PLANO, :PLACONTA, :CODCENTROCUSTO, ');
                            _sqlInsContasxCC.SQL.Add('  :IDEMPRESA, :IDUSUARIOINCLUSAO)      ');

                            _sqlInsContasxCC.Prepare;
                            _sqlInsContasxCC.ParamByName('PLANO').asInteger             := iCodPlano;
                            _sqlInsContasxCC.ParamByName('PLACONTA').asString           := sContaD;
                            _sqlInsContasxCC.ParamByName('CODCENTROCUSTO').asString     := sCCustoD;
                            _sqlInsContasxCC.ParamByName('IDEMPRESA').asFloat           := dEmpresa;
                            _sqlInsContasxCC.ParamByName('IDUSUARIOINCLUSAO').asInteger := iUsuario;

                            If not ExecSQL(_sqlInsContasxCC.SQLChanged,False) Then
                            Begin
                               sMens := 'Erro ao Inserir Dados na Tabela CONTASXCC.';
                               Raise Exception.Create(sMens);
                            End;
                         End;

                        //========== insere conta creito ===========
                        _sqlBuscaContaxCC.Prepare;
                        _sqlBuscaContaxCC.ParamByName('CODCENTROCUSTO').asString := Copy(sCCustoC + '          ',1,10);
                        _sqlBuscaContaxCC.ParamByName('IDEMPRESA').asFloat       := dEmpresa;
                        _sqlBuscaContaxCC.ParamByName('PLANO').asInteger         := iCodPlano;
                        _sqlBuscaContaxCC.ParamByName('PLACONTA').asString       := Copy(sContaC + '                  ',1,18);

                        _cdsBuscaContaxCC.Data := _sqlBuscaContaxCC.Data;

                         If _cdsBuscaContaxCC.IsEmpty then
                         Begin
                            _sqlInsContasxCC.SQL.Clear;
                            _sqlInsContasxCC.SQL.Add('INSERT INTO CONTASXCC              ');
                            _sqlInsContasxCC.SQL.Add('(PLANO, PLACONTA, CODCENTROCUSTO,  ');
                            _sqlInsContasxCC.SQL.Add('IDEMPRESA, IDUSUARIOINCLUSAO)      ');
                            _sqlInsContasxCC.SQL.Add('VALUES                             ');
                            _sqlInsContasxCC.SQL.Add('  (:PLANO, :PLACONTA, :CODCENTROCUSTO, ');
                            _sqlInsContasxCC.SQL.Add('  :IDEMPRESA, :IDUSUARIOINCLUSAO)      ');

                            _sqlInsContasxCC.Prepare;
                            _sqlInsContasxCC.ParamByName('PLANO').asInteger             := iCodPlano;
                            _sqlInsContasxCC.ParamByName('PLACONTA').asString           := sContaC;
                            _sqlInsContasxCC.ParamByName('CODCENTROCUSTO').asString     := sCCustoC;
                            _sqlInsContasxCC.ParamByName('IDEMPRESA').asFloat           := dEmpresa;
                            _sqlInsContasxCC.ParamByName('IDUSUARIOINCLUSAO').asInteger := iUsuario;

                            If not ExecSQL(_sqlInsContasxCC.SQLChanged,False) Then
                            Begin
                               sMens := 'Erro ao Inserir Dados na Tabela CONTASXCC.';
                               Raise Exception.Create(sMens);
                            End;
                         End;

                      End;
                      //==========================================
                      dValLanc := StrToFloat(format('%18.2f', [dValLanc]));
                      dTotLanc := dTotLanc + dValLanc;

                      Lancamento.lcTestaConta := False;
                      If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                iCodPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                iPlanoPrev, iPatro,dPlnCodigo,0,
                                                sDataGera,sNumDoc,sHist1,
                                                sHist2,sHist3,sHist4,sHist5,
                                                sTipoOper,sCCustoD,sContaD,
                                                sCCustoC,sContaC,sHistorico,
                                                dValLanc,False,bUsaPPatro) Then

                      Begin
                         sMensAPS_Log := sMensAPS_Log + Lancamento.MessageInfo + chr(13);
                         Raise Exception.Create(Lancamento.MessageInfo);
                      End Else
                      Begin
                         dPlnCodigo := Lancamento.RetornoPlnCodigo;
                      End;
                   End;
                   _cdsContasRef.Next;
                End;

                If Format('%17.2f',[dTotLanc]) <> Format('%17.2f',[_cdsSaldosOPP.FieldByName('SALDOCOR').AsFloat]) then
                Begin
                   sHistorico := sHistoricoOri+' - Arredondamento';
                   sHist1     := '';
                   sHist2     := '';
                   sHist3     := '';
                   sHist4     := '';
                   sHist5     := '';

                   HistoContab.ArrumaHistorico(sHistorico);

                   If sCCusto <> '' then
                   Begin

                      _sqlBuscaContaxCC.Prepare;
                      _sqlBuscaContaxCC.ParamByName('CODCENTROCUSTO').asString := Copy(sCCustoD + '          ',1,10);
                      _sqlBuscaContaxCC.ParamByName('IDEMPRESA').asFloat       := dEmpresa;
                      _sqlBuscaContaxCC.ParamByName('PLANO').asInteger         := iCodPlano;
                      _sqlBuscaContaxCC.ParamByName('PLACONTA').asString       := Copy(sContaD + '                  ',1,18);

                      _cdsBuscaContaxCC.Data := _sqlBuscaContaxCC.Data;

                       If _cdsBuscaContaxCC.IsEmpty then
                       Begin
                          //==Insere o relacionamento da Conta e do Centro de Custo
                          _sqlInsContasxCC.SQL.Clear;
                          _sqlInsContasxCC.SQL.Add('INSERT INTO CONTASXCC              ');
                          _sqlInsContasxCC.SQL.Add('(PLANO, PLACONTA, CODCENTROCUSTO,  ');
                          _sqlInsContasxCC.SQL.Add('IDEMPRESA, IDUSUARIOINCLUSAO)      ');
                          _sqlInsContasxCC.SQL.Add('VALUES                             ');
                          _sqlInsContasxCC.SQL.Add('  (:PLANO, :PLACONTA, :CODCENTROCUSTO, ');
                          _sqlInsContasxCC.SQL.Add('  :IDEMPRESA, :IDUSUARIOINCLUSAO)      ');

                          _sqlInsContasxCC.Prepare;
                          _sqlInsContasxCC.ParamByName('PLANO').asInteger             := iCodPlano;
                          _sqlInsContasxCC.ParamByName('PLACONTA').asString           := sContaD;
                          _sqlInsContasxCC.ParamByName('CODCENTROCUSTO').asString     := sCCustoD;
                          _sqlInsContasxCC.ParamByName('IDEMPRESA').asFloat           := dEmpresa;
                          _sqlInsContasxCC.ParamByName('IDUSUARIOINCLUSAO').asInteger := iUsuario;

                          If not ExecSQL(_sqlInsContasxCC.SQLChanged,False) Then
                          Begin
                             sMens := 'Erro ao Inserir Dados na Tabela CONTASXCC.';
                             Raise Exception.Create(sMens);
                          End;
                       End;

                      //========== insere conta creito ===========
                      _sqlBuscaContaxCC.Prepare;
                      _sqlBuscaContaxCC.ParamByName('CODCENTROCUSTO').asString := Copy(sCCustoC + '          ',1,10);
                      _sqlBuscaContaxCC.ParamByName('IDEMPRESA').asFloat       := dEmpresa;
                      _sqlBuscaContaxCC.ParamByName('PLANO').asInteger         := iCodPlano;
                      _sqlBuscaContaxCC.ParamByName('PLACONTA').asString       := Copy(sContaC + '                  ',1,18);

                      _cdsBuscaContaxCC.Data := _sqlBuscaContaxCC.Data;

                       If _cdsBuscaContaxCC.IsEmpty then
                       Begin
                          _sqlInsContasxCC.SQL.Clear;
                          _sqlInsContasxCC.SQL.Add('INSERT INTO CONTASXCC              ');
                          _sqlInsContasxCC.SQL.Add('(PLANO, PLACONTA, CODCENTROCUSTO,  ');
                          _sqlInsContasxCC.SQL.Add('IDEMPRESA, IDUSUARIOINCLUSAO)      ');
                          _sqlInsContasxCC.SQL.Add('VALUES                             ');
                          _sqlInsContasxCC.SQL.Add('  (:PLANO, :PLACONTA, :CODCENTROCUSTO, ');
                          _sqlInsContasxCC.SQL.Add('  :IDEMPRESA, :IDUSUARIOINCLUSAO)      ');

                          _sqlInsContasxCC.Prepare;
                          _sqlInsContasxCC.ParamByName('PLANO').asInteger             := iCodPlano;
                          _sqlInsContasxCC.ParamByName('PLACONTA').asString           := sContaC;
                          _sqlInsContasxCC.ParamByName('CODCENTROCUSTO').asString     := sCCustoC;
                          _sqlInsContasxCC.ParamByName('IDEMPRESA').asFloat           := dEmpresa;
                          _sqlInsContasxCC.ParamByName('IDUSUARIOINCLUSAO').asInteger := iUsuario;

                          If not ExecSQL(_sqlInsContasxCC.SQLChanged,False) Then
                          Begin
                             sMens := 'Erro ao Inserir Dados na Tabela CONTASXCC.';
                             Raise Exception.Create(sMens);
                          End;
                       End;

                   End;
                   //==========================================
                   dValLanc := StrToFloat(format('%18.2f', [(_cdsSaldosOPP.FieldByName('SALDOCOR').AsFloat-dTotLanc)]));
                   Lancamento.lcTestaConta := False;
                   If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                             iCodPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                             iPlanoPrev, iPatro,dPlnCodigo,0,
                                             sDataGera,sNumDoc,sHist1,
                                             sHist2,sHist3,sHist4,sHist5,
                                             sTipoOper,sCCustoD,sContaD,
                                             sCCustoC,sContaC,sHistorico,
                                             dValLanc,False,bUsaPPatro) Then

                   Begin
                      sMensAPS_Log := sMensAPS_Log + Lancamento.MessageInfo + chr(13);
                      Raise Exception.Create(Lancamento.MessageInfo);
                   End Else
                   Begin
                      dPlnCodigo := Lancamento.RetornoPlnCodigo;
                   End;
                End;
                _cdsSaldosOPP.Next;
             End;
          End;

          //=========== Atualiza a tabela =========
          _sqlUpdPlanilha.SQL.Clear;
          _sqlUpdPlanilha.SQL.Add('UPDATE   PLANILHA            ');
          _sqlUpdPlanilha.SQL.Add('SET PANCODIGO = :PANCODIGO   ');
          _sqlUpdPlanilha.SQL.Add('WHERE  PLNCODIGO =:PLNCODIGO ');

          _sqlUpdPlanilha.Prepare;
          _sqlUpdPlanilha.ParamByName('PANCODIGO').asFloat := _cdsRateio.FieldByName('PANCODIGO').AsFloat;
          _sqlUpdPlanilha.ParamByName('PLNCODIGO').asFloat := dPlnCodigo;

          If not ExecSQL(_sqlUpdPlanilha.SQLChanged,False) Then
          Begin
             sMens := 'Erro ao Atualizar a Tabela PLANILHA.';
             Raise Exception.Create(sMens);
          End;

          //====== Verifica se a planilha foi gerada ======
          _sqlPlanilhaGerada.SQL.Clear;
          _sqlPlanilhaGerada.SQL.Add('SELECT   PLNPLANIL           ');
          _sqlPlanilhaGerada.SQL.Add('FROM  PLANILHA               ');
          _sqlPlanilhaGerada.SQL.Add('WHERE  PLNCODIGO =:PLNCODIGO ');

          _sqlPlanilhaGerada.Prepare;
          _sqlPlanilhaGerada.ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
          _cdsPlanilhaGerada.Data := _sqlPlanilhaGerada.Data;

          If not _cdsPlanilhaGerada.isEmpty then
          Begin
             MessageInfo := 'Gerada a Planilha no. ' + _cdsPlanilhaGerada.FieldByName('PLNPLANIL').asString;
             sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
          End;

          Commit;

          _sqlUpdPlanilha.Free;
          _sqlSaldosDPP.Free;
          _sqlRateio.Free;
          _sqlSaldosO.Free;
          _sqlSaldosD.Free;
          _sqlSaldosOPP.Free;
          _sqlContasRef.Free;
          _sqlVerifPlanil.Free;
          _sqlHistoPadrao.Free;
          _sqlBuscaContaxCC.Free;
          _sqlInsContasxCC.Free;
          _sqlPlanilhaGerada.Free;

          _cdsPlanilhaGerada.Free;
          _cdsBuscaContaxCC.Free;
          _cdsHistoPadrao.Free;
          _cdsRateio.Free;
          _cdsContasRef.Free;
          _cdsVerifPlanil.Free;
          _cdsSaldosDPP.Free;
          _cdsSaldosD.Free;
          _cdsSaldosO.Free;
          _cdsSaldosOPP.Free;

          Result := True;

          MessageInfo := 'Planilhas de Rateio geradas com sucesso!';

          sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);

          sMensAPS_Log := sMensAPS_Log + '************************************' + chr(13);

        Except
           on E:Exception Do
           Begin
              RollBack;
              Result := False;

              _sqlUpdPlanilha.Free;
              _sqlPlanilhaGerada.Free;
              _sqlSaldosDPP.Free;
              _sqlRateio.Free;
              _sqlSaldosO.Free;
              _sqlSaldosD.Free;
              _sqlSaldosOPP.Free;
              _sqlContasRef.Free;
              _sqlVerifPlanil.Free;
              _sqlHistoPadrao.Free;
              _sqlBuscaContaxCC.Free;
              _sqlInsContasxCC.Free;

              _cdsBuscaContaxCC.Free;
              _cdsHistoPadrao.Free;
              _cdsRateio.Free;
              _cdsContasRef.Free;
              _cdsVerifPlanil.Free;
              _cdsSaldosDPP.Free;
              _cdsSaldosD.Free;
              _cdsSaldosO.Free;
              _cdsSaldosOPP.Free;
              _cdsPlanilhaGerada.Free;

              MessageInfo := 'Problemas na geração da Planilha '+_cdsRateio.FieldByName('PANDESCRICAO').AsString;

              sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);

              sMensAPS_Log := sMensAPS_Log + '**********************************' + chr(13);

              FProgresso := 0;
              MessageInfo := sMens+' '+E.Message;
           End
        End;

        FProgresso := FProgresso + 1;
        _cdsRateio.Next;
     End;
  End;
end;

function TCtrlProcessaContab.GeraRateioPorPPrevePatro(dEmpresa: Double;
  iUsuario, iPlano, iExercicio, iPeriodo: Integer; sTipoOper,
  sDataGera,sTipoFecha: string; bUsaPPatro: Boolean): Boolean;

var
    cTipoLanc :char;
    dAcuCor, dAcuOfi, dAcuGer, dAcuGer1, dAcuGer2, dAcuHist, dValCor,dPlnCodigo,dTotLanc : Double;
    dValLanc,dValOfi,dValGe1,dValGe2,dValGe3,dvalhistdeb,dTotal,dPercentual :Double;
    sMens,sContaD,sContaC,sCCustoD,sCCustoC,sNumDoc,sHistoricoOri,sHistPad,sConta,sCCusto : string;
    iSubContaC,iSubContaD,iModulo,iPlanoPrev,iPatro,iUnidNegoc,iCodPlano,iX :Integer;

    bAchou :Boolean;
    sContaDebito, sContaCredito,sPlanoPrev,sPatro : string;

    sHist1,sHist2,sHist3,sHist4,sHist5,sHistorico :string;

    _sqlSaldosD        : TCMSqlParams;
    _sqlUpdPlanilha    : TCMSqlParams;
    _sqlSaldosDPP      : TCMSqlParams;
    _sqlRateio         : TCMSqlParams;
    _sqlSaldosOT       : TCMSqlParams;
    _sqlSaldosO        : TCMSqlParams;
    _sqlPlanoPrevOri   : TCMSqlParams;
    _sqlContasRef      : TCMSqlParams;
    _sqlVerifPlanil    : TCMSqlParams;
    _sqlHistoPadrao    : TCMSqlParams;
    _sqlBuscaContaxCC  : TCMSqlParams;
    _sqlPlanilhaGerada : TCMSqlParams;
    _sqlInsContasxCC   : TCMSqlParams;

    _cdsBuscaContaxCC : TClientDataSet;
    _cdsHistoPadrao   : TClientDataSet;
    _cdsRateio        : TClientDataSet;
    _cdsContasRef     : TClientDataSet;
    _cdsVerifPlanil   : TClientDataSet;
    _cdsSaldosDPP     : TClientDataSet;
    _cdsSaldosD       : TClientDataSet;
    _cdsSaldosOT      : TClientDataSet;
    _cdsSaldosO       : TClientDataSet;
    _cdsPlanilhaGerada: TClientDataSet;
    _cdsPlanoPrevOri  : TClientDataSet;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GeraRateioPorPPrevePatro(dEmpresa,iUsuario,iPlano,
                         iExercicio,iPeriodo,sTipoOper, sDataGera,sTipoFecha,bUsaPPatro,FsMensAPS_Log);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
         FsMensAPS_Log := Connection.AppServer.MessageInfo;


   End Else
   Begin
      FMaxProgresso := 0;
      FProgresso    := 0;
      sMens         := '';
      FsMensAPS_Log := '';
      MessageInfo   := '*';
      iModulo       := 1;
      dPlnCodigo    := 0;
      sContaDebito  := '';
      sContaCredito := '';
      iSubContaC    := 0;
      iSubContaD    := 0;
      iUnidNegoc    := 0;

      _sqlSaldosD  := TCMSqlParams.Create(nil);
      _sqlSaldosD.ControlObject := Self;



      _sqlUpdPlanilha  := TCMSqlParams.Create(nil);
      _sqlUpdPlanilha.ControlObject := Self;

      _sqlHistoPadrao  := TCMSqlParams.Create(nil);
      _sqlHistoPadrao.ControlObject := Self;

      _sqlSaldosDPP  := TCMSqlParams.Create(nil);
      _sqlSaldosDPP.ControlObject := Self;

      _sqlRateio  := TCMSqlParams.Create(nil);
      _sqlRateio.ControlObject := Self;

      _sqlSaldosOT  := TCMSqlParams.Create(nil);
      _sqlSaldosOT.ControlObject := Self;


      _sqlSaldosO  := TCMSqlParams.Create(nil);
      _sqlSaldosO.ControlObject := Self;

      _sqlPlanoPrevOri  := TCMSqlParams.Create(nil);
      _sqlPlanoPrevOri.ControlObject := Self;

      _sqlContasRef  := TCMSqlParams.Create(nil);
      _sqlContasRef.ControlObject := Self;

      _sqlVerifPlanil  := TCMSqlParams.Create(nil);
      _sqlVerifPlanil.ControlObject := Self;

      _sqlHistoPadrao  := TCMSqlParams.Create(nil);
      _sqlHistoPadrao.ControlObject := Self;

      _sqlPlanilhaGerada  := TCMSqlParams.Create(nil);
      _sqlPlanilhaGerada.ControlObject := Self;

      _sqlInsContasxCC  := TCMSqlParams.Create(nil);
      _sqlInsContasxCC.ControlObject := Self;

      _cdsHistoPadrao   := TClientDataSet.Create(nil);
      _cdsRateio        := TClientDataSet.Create(nil);
      _cdsContasRef     := TClientDataSet.Create(nil);
      _cdsVerifPlanil   := TClientDataSet.Create(nil);
      _cdsSaldosDPP     := TClientDataSet.Create(nil);
      _cdsSaldosD       := TClientDataSet.Create(nil);
      _cdsSaldosOT      := TClientDataSet.Create(nil);
      _cdsSaldosO       := TClientDataSet.Create(nil);
      _cdsPlanilhaGerada:= TClientDataSet.Create(nil);
      _cdsPlanoPrevOri  := TClientDataSet.Create(nil);

      //=========================================
      _sqlVerifPlanil.SQL.Clear;
      _sqlVerifPlanil.SQL.Add('SELECT PLNCODIGO, PLNPLANIL, PLNDATDIA ');
      _sqlVerifPlanil.SQL.Add('FROM PLANILHA                          ');
      _sqlVerifPlanil.SQL.Add('WHERE (PANCODIGO = :PANCODIGO) AND     ');
      _sqlVerifPlanil.SQL.Add('      (PLNDATDIA = TO_DATE(:DATAREF,''DD/MM/YYYY'')) AND ');
      _sqlVerifPlanil.SQL.Add('      (IDPESSOA  = :IDPESSOA) ');
      //=========================================
      _sqlContasRef.SQL.Clear;
      _sqlContasRef.SQL.Add('SELECT D.PANCONTABASE, D.PLANO, D.PANTIPO,     ');
      _sqlContasRef.SQL.Add('   D.HITCODHIST, D.CODCENTROCUSTO,D.UNIDNEGOC, ');
      _sqlContasRef.SQL.Add('   D.IDPLANOPREV, D.IDPATRO                    ');
      _sqlContasRef.SQL.Add('FROM PREDETALHE D                              ');
      _sqlContasRef.SQL.Add('WHERE (D.PANCODIGO = :PANCODIGO) AND           ');
      _sqlContasRef.SQL.Add('      (D.PANORIGEM = :PANORIGEM)               ');
      //=========================================
      _sqlSaldosD.SQL.Clear;
      _sqlSaldosD.SQL.Add('SELECT U.IDPLANOPREV,U.IDPATRO,                                           ');
      _sqlSaldosD.SQL.Add('   SUM(DECODE(U.SALDO,NULL,0,U.SALDO)) AS SALDOCOR                        ');
      _sqlSaldosD.SQL.Add('FROM                                                                      ');
      _sqlSaldosD.SQL.Add('   ((SELECT                                                               ');
      _sqlSaldosD.SQL.Add('       IDPLANOPREV, IDPATRO,                                              ');
      _sqlSaldosD.SQL.Add('       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)          ');
      _sqlSaldosD.SQL.Add('       - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDO          ');
      _sqlSaldosD.SQL.Add('    FROM PLANOSALDO                                                       ');
      _sqlSaldosD.SQL.Add('    WHERE (PLANO =:PLANO) AND                                             ');
      _sqlSaldosD.SQL.Add('          (PEREXERCICIO =:PEREXERCICIO) AND                               ');
      _sqlSaldosD.SQL.Add('          ((PERNUMERO <:PERNUMERO) OR (PERNUMERO IS NULL)) AND            ');
      _sqlSaldosD.SQL.Add('          (IDPESSOA =:IDPESSOA) AND                                       ');
      _sqlSaldosD.SQL.Add('          (PLACONTA = :CONTAINI)                                          ');
      _sqlSaldosD.SQL.Add('    GROUP BY IDPLANOPREV, IDPATRO)                                        ');
      _sqlSaldosD.SQL.Add('     UNION                                                                ');
      _sqlSaldosD.SQL.Add('   (SELECT L.IDPLANOPREV, L.IDPATRO,                                      ');
      _sqlSaldosD.SQL.Add('           SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,L.LACVALOR*-1)) AS SALDO ');
      _sqlSaldosD.SQL.Add('    FROM PLANILHA P, LANCAMENTO L                                         ');
      _sqlSaldosD.SQL.Add('    WHERE (L.PLANO =:PLANO) AND                                           ');
      _sqlSaldosD.SQL.Add('          (P.PEREXERCICIO =:PEREXERCICIO) AND                             ');
      _sqlSaldosD.SQL.Add('          (P.PERNUMERO =:PERNUMERO) AND                                   ');
      _sqlSaldosD.SQL.Add('          (P.IDPESSOA =:IDPESSOA) AND                                     ');
      _sqlSaldosD.SQL.Add('          (P.PLNDATDIA <= TO_DATE(:DATAREF,''DD/MM/YYYY'')) AND             ');
      _sqlSaldosD.SQL.Add('          (P.PLNEFETIVADO = ''S'') AND                                      ');
      _sqlSaldosD.SQL.Add('          (P.PLNCODIGO = L.PLNCODIGO) AND                                 ');
      _sqlSaldosD.SQL.Add('          (L.PLACONTA LIKE :CONTAINIL)                                    ');
      _sqlSaldosD.SQL.Add('    GROUP BY L.IDPLANOPREV, L.IDPATRO)                                    ');
      _sqlSaldosD.SQL.Add('          ) U                                                             ');
      _sqlSaldosD.SQL.Add('GROUP BY U.IDPLANOPREV,U.IDPATRO                                          ');
      //=========================================
      _sqlPlanoPrevOri.SQL.Clear;
      _sqlPlanoPrevOri.SQL.Add('SELECT IDPLANOPREV, IDPATRO,     ');
      _sqlPlanoPrevOri.SQL.Add('   ''N'' AS CALC,  (0) AS VALOR  ');
      _sqlPlanoPrevOri.SQL.Add('FROM LANCAMENTO                  ');
      _sqlPlanoPrevOri.SQL.Add('WHERE   (1 = 2)                  ');
      //=========================================

      _sqlRateio.SQL.Clear;
      _sqlRateio.SQL.Add('SELECT                                    ');
      _sqlRateio.SQL.Add('   P.PANDESCRICAO,                        ');
      _sqlRateio.SQL.Add('   P.PANCODIGO                            ');
      _sqlRateio.SQL.Add('FROM                                      ');
      _sqlRateio.SQL.Add('   PREPLANILHA P                          ');
      _sqlRateio.SQL.Add('WHERE                                     ');
      _sqlRateio.SQL.Add('   ( P.PANIDENTIFICACAO = ''T'' ) AND     ');
      _sqlRateio.SQL.Add('   ( P.IDPESSOA = :IDPESSOA ) AND         ');
      _sqlRateio.SQL.Add('   ( P.PANINATIVO = ''N'')                ');

      _sqlRateio.Prepare;
      _sqlRateio.ParamByName('IDPESSOA').asFloat := dEmpresa;
      _cdsRateio.Data := _sqlRateio.Data;

      FMaxProgresso := _cdsRateio.RecordCount;

      _cdsRateio.First;

      While not _cdsRateio.EOF do
      Begin

        FNomeRateio := 'Gerando Rateio : '+_cdsRateio.FieldByName('PANDESCRICAO').AsString;

        Try

           StartTransaction;

           //=== Verifica se a planilha já foi gerada para ser excluida. ===
           _sqlVerifPlanil.Prepare;
           _sqlVerifPlanil.ParamByName('IDPESSOA').AsFloat    := dEmpresa;
           _sqlVerifPlanil.ParamByName('PANCODIGO').AsInteger := _cdsRateio.FieldByName('PANCODIGO').AsInteger;
           _sqlVerifPlanil.ParamByName('DATAREF').AsString    := sDataGera;

           _cdsVerifPlanil.Data := _sqlVerifPlanil.Data;

           If not _cdsVerifPlanil.isEmpty then
           Begin

              If not Lancamento.ExcluiLancaContab(iUsuario,_cdsVerifPlanil.FieldByName('PLNCODIGO').asInteger,
                                  iModulo, 0,bUsaPPatro, True) Then
           Begin
                  sMensAPS_Log := sMensAPS_Log + Lancamento.MessageInfo + chr(13);
                  Raise Exception.Create(Lancamento.MessageInfo);
              End;
              MessageInfo := 'Excluída a Planilha no. ' + _cdsVerifPlanil.FieldByName('PLNPLANIL').asString+ ' do dia '+sDataGera;
           End;


           //== pega as contas de referencia ===
           _sqlContasRef.Prepare;
           _sqlContasRef.ParamByName('PANCODIGO').AsFloat  := _cdsRateio.FieldByName('PANCODIGO').AsFloat;
           _sqlContasRef.ParamByName('PANORIGEM').AsString := 'C';

           _cdsContasRef.Data := _sqlContasRef.Data;

           _cdsContasRef.First;
            while not _cdsContasRef.EOF do
            begin
               if _cdsContasRef.FieldByName('PANTIPO').AsString = 'D' then
                  sContaDebito  := _cdsContasRef.FieldByName('PANCONTABASE').AsString
               else
                  sContaCredito := _cdsContasRef.FieldByName('PANCONTABASE').AsString;
               _cdsContasRef.Next;
            end;

            //=== escreve sql plano previvenciario ====
            _sqlContasRef.Prepare;
            _sqlContasRef.ParamByName('PANCODIGO').AsFloat  := _cdsRateio.FieldByName('PANCODIGO').AsFloat;
            _sqlContasRef.ParamByName('PANORIGEM').AsString := '0';
            _cdsContasRef.Data := _sqlContasRef.Data;

            dTotal     := 0;
            sPlanoPrev := '';
            sPatro     := '';

            _cdsContasRef.First;
            While not _cdsContasRef.EOF do
            Begin
               _sqlSaldosD.Prepare;
               _sqlSaldosD.ParamByName('CONTAINI').AsString      := Copy(_cdsContasRef.FieldByName('PANCONTABASE').AsString+'                  ',1,18);
               _sqlSaldosD.ParamByName('CONTAINIL').AsString     := trim(_cdsContasRef.FieldByName('PANCONTABASE').AsString)+'%';
               _sqlSaldosD.ParamByName('PLANO').AsInteger        := _cdsContasRef.FieldByName('PLANO').AsInteger;
               _sqlSaldosD.ParamByName('PEREXERCICIO').AsInteger := iExercicio;

               if sTipoFecha = 'D' then
                  _sqlSaldosD.ParamByName('PERNUMERO').AsInteger := iPeriodo
               else
                  _sqlSaldosD.ParamByName('PERNUMERO').AsInteger := iPeriodo-1;

               _sqlSaldosD.ParamByName('IDPESSOA').AsFloat     := dEmpresa;

               if sTipoFecha = 'D' then
                  _sqlSaldosD.ParamByName('DATAREF').AsString := DateToStr(StrToDate(sDataGera)-1);

               _cdsSaldosD.Data := _sqlSaldosD.Data;
               _cdsSaldosD.First;
               while not _cdsSaldosD.EOF do
               begin
                  if ((_cdsContasRef.FieldByName('IDPLANOPREV').IsNull) or (_cdsContasRef.FieldByName('IDPLANOPREV').AsInteger = _cdsSaldosD.FieldByName('IDPLANOPREV').AsInteger)) and
                     ((_cdsContasRef.FieldByName('IDPATRO').IsNull) or (_cdsContasRef.FieldByName('IDPATRO').AsInteger = _cdsSaldosD.FieldByName('IDPATRO').AsInteger)) then
                  begin
                     dTotal := dTotal + _cdsSaldosD.FieldByName('SALDOCOR').AsFloat;
                     bAchou := False;
                     _cdsPlanoPrevOri.First;
                     while not _cdsPlanoPrevOri.EOF do
                     begin
                        if (_cdsPlanoPrevOri.FieldByName('IDPLANOPREV').AsInteger = _cdsSaldosD.FieldByName('IDPLANOPREV').AsInteger) and
                           (_cdsPlanoPrevOri.FieldByName('IDPATRO').AsInteger = _cdsSaldosD.FieldByName('IDPATRO').AsInteger) then
                        begin
                           bAchou := True;
                           _cdsPlanoPrevOri.Edit;
                           _cdsPlanoPrevOri.FieldByName('VALOR').AsFloat := _cdsPlanoPrevOri.FieldByName('VALOR').AsFloat + _cdsSaldosD.FieldByName('SALDOCOR').AsFloat;
                           _cdsPlanoPrevOri.Post;
                           Break;
                        end;
                        _cdsPlanoPrevOri.Next;
                     end;
                     if not bAchou then begin
                        _cdsPlanoPrevOri.Insert;
                        _cdsPlanoPrevOri.FieldByName('IDPLANOPREV').AsInteger := _cdsSaldosD.FieldByName('IDPLANOPREV').AsInteger;
                        _cdsPlanoPrevOri.FieldByName('IDPATRO').AsInteger     := _cdsSaldosD.FieldByName('IDPATRO').AsInteger;
                        _cdsPlanoPrevOri.FieldByName('VALOR').AsFloat         := _cdsSaldosD.FieldByName('SALDOCOR').AsFloat;
                        _cdsPlanoPrevOri.FieldByName('CALC').AsString         := 'N';
                        _cdsPlanoPrevOri.Post;
                        if not _cdsContasRef.FieldByName('IDPLANOPREV').IsNull then
                        begin
                           if sPlanoPrev = '' then
                              sPlanoPrev := _cdsSaldosD.FieldByName('IDPLANOPREV').AsString
                           else
                              sPlanoPrev := sPlanoPrev + ','+ _cdsSaldosD.FieldByName('IDPLANOPREV').AsString;
                        end;
                        if not _cdsContasRef.FieldByName('IDPATRO').IsNull then
                        begin
                           if sPatro = '' then
                              sPatro := _cdsSaldosD.FieldByName('IDPATRO').AsString
                           else
                              sPatro := sPatro + ','+ _cdsSaldosD.FieldByName('IDPATRO').AsString;
                        end;
                     end;
                  end;
                  _cdsSaldosD.Next;
               end;
               _cdsContasRef.Next;
            end;
            sNumDoc        := 'Rat.Plano/Patro';
            sHistorico     := '';
            sHistPad       := '';
            cTipoLanc      := '2';
            iPlanoPrev     := 0;
            iPatro         := 0;
            iCodPlano      := iPlano;
            _sqlContasRef.Prepare;
            _sqlContasRef.ParamByName('PANCODIGO').AsFloat  := _cdsRateio.FieldByName('PANCODIGO').AsFloat;
            _sqlContasRef.ParamByName('PANORIGEM').AsString := 'D';

            _cdsContasRef.Data := _sqlContasRef.Data;

            _cdsContasRef.First;
            while not _cdsContasRef.EOF do
            begin

               _sqlSaldosOT.SQL.Clear;
               _sqlSaldosOT.SQL.Add('SELECT  /*+ INDEX LANCAMENTO */                                              ');
               _sqlSaldosOT.SQL.Add('       L.PLACONTA, L.CODSUBCONTA,                                            ');

               if _cdsContasRef.FieldByName('CODCENTROCUSTO').isNull then
                  _sqlSaldosOT.SQL.Add('       L.CODCENTROCUSTO, L.IDEMPRESA,                                        ');

               if _cdsContasRef.FieldByName('UNIDNEGOC').isNull then
                  _sqlSaldosOT.SQL.Add('       L.UNIDNEGOC,                                                          ');

               _sqlSaldosOT.SQL.Add('       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDOTOT ');
               _sqlSaldosOT.SQL.Add('FROM PLANILHA P, LANCAMENTO L                                                ');
               _sqlSaldosOT.SQL.Add('WHERE (L.PLACONTA LIKE :PLACONTA) AND                                        ');
               _sqlSaldosOT.SQL.Add('      (L.PLANO = :PLANO) AND                                                 ');
               _sqlSaldosOT.SQL.Add('      (P.PEREXERCICIO = :PEREXERCICIO) AND                                   ');
               _sqlSaldosOT.SQL.Add('      (P.PERNUMERO = :PERNUMERO) AND                                         ');
               _sqlSaldosOT.SQL.Add('      (P.IDPESSOA = :IDPESSOA) AND                                           ');
               _sqlSaldosOT.SQL.Add('      (P.PLNEFETIVADO = ''S'') AND                                           ');

               if sTipoFecha = 'D' then
                  _sqlSaldosOT.SQL.Add('      (P.PLNDATDIA = TO_DATE(:DATAREF,''DD/MM/YYYY'')) AND                   ');

               if sPlanoPrev <> '' then
                  _sqlSaldosOT.SQL.Add('      (L.IDPLANOPREV IN ('+sPlanoPrev+')) AND ');

               if sPatro <> '' then
                  _sqlSaldosOT.SQL.Add('      (L.IDPATRO IN ('+sPatro+')) AND ');

               _sqlSaldosOT.SQL.Add('      (P.PLNCODIGO = L.PLNCODIGO)                                            ');
               _sqlSaldosOT.SQL.Add('GROUP BY L.PLACONTA,                                                         ');

               if _cdsContasRef.FieldByName('CODCENTROCUSTO').isNull then
                  _sqlSaldosOT.SQL.Add('        L.CODCENTROCUSTO, L.IDEMPRESA,                                     ');

               if _cdsContasRef.FieldByName('UNIDNEGOC').isNull then
                  _sqlSaldosOT.SQL.Add('        L.UNIDNEGOC,                                                       ');

               _sqlSaldosOT.SQL.Add('        L.CODSUBCONTA                                                      ');

               sHistoricoOri := _cdsRateio.FieldByName('PANDESCRICAO').asString;
               sHistPad      := '';
               if not _cdsContasRef.FieldByName('HITCODHIST').IsNull then
               begin
                  _sqlHistoPadrao.SQL.Clear;
                  _sqlHistoPadrao.SQL.Add('SELECT HITCODHIST, HITDESCR1     ');
                  _sqlHistoPadrao.SQL.Add('FROM HISTOPADRAO                 ');
                  _sqlHistoPadrao.SQL.Add('WHERE (IDPESSOA = :IDPESSOA) AND ');
                  _sqlHistoPadrao.SQL.Add('     (HITCODHIST = :HITCODHIST)  ');

                  _sqlHistoPadrao.Prepare;
                  _sqlHistoPadrao.ParamByName('IDPESSOA').AsFloat    := dEmpresa;
                  _sqlHistoPadrao.ParamByName('HITCODHIST').AsString := Copy(_cdsContasRef.FieldByName('HITCODHIST').AsString+'    ',1,4);
                  _cdsHistoPadrao.Data := _sqlHistoPadrao.Data;

                  if not _cdsHistoPadrao.IsEmpty then begin
                     sHistoricoOri := _cdsHistoPadrao.FieldByName('HITDESCR1').asString;
                     sHistPad      := _cdsContasRef.FieldByName('HITCODHIST').AsString;
                  end;
               end;
               //
               _sqlSaldosOT.Prepare;
               _sqlSaldosOT.ParamByName('PLACONTA').AsString      := trim(_cdsContasRef.FieldByName('PANCONTABASE').AsString)+'%';
               _sqlSaldosOT.ParamByName('PLANO').AsInteger        := _cdsContasRef.FieldByName('PLANO').AsInteger;
               _sqlSaldosOT.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
               _sqlSaldosOT.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
               _sqlSaldosOT.ParamByName('IDPESSOA').AsFloat       := dEmpresa;

               if sTipoFecha = 'D' then
                  _sqlSaldosOT.ParamByName('DATAREF').AsString := sDataGera;

               _cdsSaldosOT.Data := _sqlSaldosOT.Data;

               _cdsSaldosOT.First;
               while not _cdsSaldosOT.EOF do
               begin

                  _sqlSaldosO.SQL.Clear;
                  _sqlSaldosO.SQL.Add('SELECT  /*+ INDEX LANCAMENTO */                                               ');
                  _sqlSaldosO.SQL.Add('       L.PLACONTA, L.CODSUBCONTA,                                             ');
                  _sqlSaldosO.SQL.Add('       L.IDPLANOPREV, L.IDPATRO,                                              ');
                  _sqlSaldosO.SQL.Add('       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDOCOR  ');
                  _sqlSaldosO.SQL.Add('FROM PLANILHA P, LANCAMENTO L                                                 ');
                  _sqlSaldosO.SQL.Add('WHERE (L.PLACONTA = :PLACONTA) AND                                            ');
                  _sqlSaldosO.SQL.Add('      (L.PLANO = :PLANO) AND                                                  ');
                  _sqlSaldosO.SQL.Add('      (P.PEREXERCICIO = :PEREXERCICIO) AND                                    ');
                  _sqlSaldosO.SQL.Add('      (P.PERNUMERO = :PERNUMERO) AND                                          ');
                  _sqlSaldosO.SQL.Add('      (P.IDPESSOA = :IDPESSOA) AND                                            ');
                  _sqlSaldosO.SQL.Add('      (P.PLNEFETIVADO = ''S'') AND                                            ');

                  if _cdsContasRef.FieldByName('CODCENTROCUSTO').isNull then
                  begin
                     if _cdsSaldosOT.FieldByName('CODCENTROCUSTO').isNull then
                     begin
                        _sqlSaldosO.SQL.Add('    (L.CODCENTROCUSTO IS NULL) AND                                      ');
                     end else
                     begin
                        _sqlSaldosO.SQL.Add('    (L.CODCENTROCUSTO = '''+Copy(_cdsSaldosOT.FieldByName('CODCENTROCUSTO').AsString + '          ',1,10)+''') AND     ');
                        _sqlSaldosO.SQL.Add('    (L.IDEMPRESA = '+_cdsSaldosOT.FieldByName('IDEMPRESA').AsString+') AND      ');
                     end;
                  end;
                  if _cdsContasRef.FieldByName('UNIDNEGOC').isNull then
                  begin
                     if not _cdsSaldosOT.FieldByName('UNIDNEGOC').isNull then
                      begin
                        _sqlSaldosO.SQL.Add('    (L.UNIDNEGOC = '+_cdsSaldosOT.FieldByName('UNIDNEGOC').AsString+') AND     ');
                     end else begin
                        _sqlSaldosO.SQL.Add('    (L.UNIDNEGOC IS NULL) AND                                                 ');
                     end;
                  end;

                  if sTipoFecha = 'D' then
                     _sqlSaldosO.SQL.Add('      (P.PLNDATDIA = TO_DATE(:DATAREF,''DD/MM/YYYY'')) AND                    ');
                  if sPlanoPrev <> '' then
                     _sqlSaldosO.SQL.Add('      (L.IDPLANOPREV IN ('+sPlanoPrev+')) AND ');
                  if sPatro <> '' then
                     _sqlSaldosO.SQL.Add('      (L.IDPATRO IN ('+sPatro+')) AND ');

                  _sqlSaldosO.SQL.Add('      (P.PLNCODIGO = L.PLNCODIGO)                                             ');
                  _sqlSaldosO.SQL.Add('GROUP BY L.PLACONTA,                                                          ');
                  _sqlSaldosO.SQL.Add('         L.IDPLANOPREV, L.IDPATRO, L.CODSUBCONTA                              ');
                  _sqlSaldosO.SQL.Add('ORDER BY L.PLACONTA,                                                          ');
                  _sqlSaldosO.SQL.Add('         L.CODSUBCONTA, L.IDPLANOPREV, L.IDPATRO                              ');

                  _sqlSaldosO.Prepare;
                  _sqlSaldosO.ParamByName('PLACONTA').AsString      := Copy(_cdsSaldosOT.FieldByName('PLACONTA').AsString+'                  ',1,18);
                  _sqlSaldosO.ParamByName('PLANO').AsInteger        := _cdsContasRef.FieldByName('PLANO').AsInteger;
                  _sqlSaldosO.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
                  _sqlSaldosO.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
                  _sqlSaldosO.ParamByName('IDPESSOA').AsFloat       := dEmpresa;

                  if sTipoFecha = 'D' then
                     _sqlSaldosO.ParamByName('DATAREF').AsString    := sDataGera;

                  _cdsSaldosO.Data := _sqlSaldosO.Data;

                  dTotLanc       := 0;
                  _cdsPlanoPrevOri.First;
                  while not _cdsPlanoPrevOri.EOF do
                  begin
                     _cdsPlanoPrevOri.Edit;
                     _cdsPlanoPrevOri.FieldByName('CALC').AsString := 'N';
                     _cdsPlanoPrevOri.Post;
                     _cdsPlanoPrevOri.Next;
                  end;

                  _cdsSaldosO.First;
                  while not _cdsSaldosO.EOF do
                  begin
                     If (_cdsSaldosO.FieldByName('CODSUBCONTA').AsInteger = _cdsSaldosOT.FieldByName('CODSUBCONTA').AsInteger) then
                     Begin
                        iPlanoPrev  := _cdsSaldosO.FieldByName('IDPLANOPREV').AsInteger;
                        iPatro      := _cdsSaldosO.FieldByName('IDPATRO').AsInteger;
                        dPercentual := 0;
                        _cdsPlanoPrevOri.First;
                        while not _cdsPlanoPrevOri.EOF do
                        begin
                           if (_cdsPlanoPrevOri.FieldByName('IDPLANOPREV').AsInteger = _cdsSaldosO.FieldByName('IDPLANOPREV').AsInteger) and
                              (_cdsPlanoPrevOri.FieldByName('IDPATRO').AsInteger = _cdsSaldosO.FieldByName('IDPATRO').AsInteger) then begin
                              if dTotal <> 0 then
                                 dPercentual := (_cdsPlanoPrevOri.FieldByName('VALOR').AsFloat/dTotal);
                              _cdsPlanoPrevOri.Edit;
                              _cdsPlanoPrevOri.FieldByName('CALC').AsString := 'S';
                              _cdsPlanoPrevOri.Post;
                              Break;
                           end;
                           _cdsPlanoPrevOri.Next;
                        end;
                        //
                        sHistorico := sHistoricoOri+' '+format('%18.7f', [dPercentual*100])+'%';

                        HistoContab.ArrumaHistorico(sHistorico);

                        dValLanc := (_cdsSaldosOT.FieldByName('SALDOTOT').AsFloat * dPercentual);
                        dValLanc := StrToFloat(format('%18.2f', [dValLanc]));
                        dTotLanc := dTotLanc + dValLanc;
                        dValLanc := dValLanc - _cdsSaldosO.FieldByName('SALDOCOR').AsFloat;
                        if dValLanc > 0 then
                           sConta := sContaCredito
                        else
                           sConta := sContaDebito;

                        sContaD   := _cdsSaldosO.FieldByName('PLACONTA').AsString;
                        if _cdsContasRef.FieldByName('CODCENTROCUSTO').isNull then
                           sCCustoD    := _cdsSaldosOT.FieldByName('CODCENTROCUSTO').AsString
                        else
                           sCCustoD    := _cdsContasRef.FieldByName('CODCENTROCUSTO').AsString;

                        if _cdsContasRef.FieldByName('UNIDNEGOC').isNull then
                        begin
                           if _cdsSaldosOT.FieldByName('UNIDNEGOC').AsString = '' then
                             iUnidNegoc := 0
                           else
                              iUnidNegoc := StrToInt(_cdsSaldosOT.FieldByName('UNIDNEGOC').AsString);
                        end else
                        begin
                           if _cdsContasRef.FieldByName('UNIDNEGOC').AsString = '' then
                              iUnidNegoc := 0
                           else
                              iUnidNegoc := StrToInt(_cdsContasRef.FieldByName('UNIDNEGOC').AsString);
                        end;
                        if _cdsSaldosO.FieldByName('CODSUBCONTA').AsString = '' then
                           iSubContaD := 0
                        else
                           iSubContaD := StrToInt(_cdsSaldosO.FieldByName('CODSUBCONTA').AsString);

                        sContaC    := sConta;
                        sCCustoC   := '';
                        iSubContaC := 0;

                        //Faz o lançamento
                        FNomeCampo := 'Gerando Conta : ' + sContaD;
                        if dValLanc <> 0 then
                        Begin
                           dValLanc := StrToFloat(format('%18.2f', [dValLanc]));
                           If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                     iCodPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                     iPlanoPrev, iPatro,dPlnCodigo,0,
                                                     sDataGera,sNumDoc,HistoContab.Hist1,
                                                     HistoContab.Hist2,HistoContab.Hist3,
                                                     HistoContab.Hist4,HistoContab.Hist5,
                                                     sTipoOper,sCCustoD,sContaD,
                                                     sCCustoC,sContaC,sHistorico,
                                                     dValLanc,False,bUsaPPatro) Then

                           Begin
                              sMensAPS_Log := sMensAPS_Log + Lancamento.MessageInfo + chr(13);
                              Raise Exception.Create(Lancamento.MessageInfo);
                           End Else
                           Begin
                              dPlnCodigo := Lancamento.RetornoPlnCodigo;
                           End;

                        End;

                     End;
                     _cdsSaldosO.Next;
                  End;

                  //Complementa Lançamentos
                  _cdsPlanoPrevOri.First;
                  While not _cdsPlanoPrevOri.EOF do
                  Begin
                     If _cdsPlanoPrevOri.FieldByName('CALC').AsString = 'N' then
                     Begin
                        dPercentual:=0;
                        if dTotal <> 0 then
                           dPercentual := (_cdsPlanoPrevOri.FieldByName('VALOR').AsFloat/dTotal);

                        dValLanc := (_cdsSaldosOT.FieldByName('SALDOTOT').AsFloat * dPercentual);
                        dValLanc := StrToFloat(format('%18.2f', [dValLanc]));

                        if dValLanc > 0 then
                           sConta := sContaCredito
                        else
                           sConta := sContaDebito;
                        //
                        sHistorico := sHistoricoOri+' '+format('%18.7f', [dPercentual*100])+'%';

                        HistoContab.ArrumaHistorico(sHistorico);

                        if _cdsContasRef.FieldByName('CODCENTROCUSTO').isNull then
                           sCCustoD    := _cdsSaldosOT.FieldByName('CODCENTROCUSTO').AsString
                        else
                           sCCustoD    := _cdsContasRef.FieldByName('CODCENTROCUSTO').AsString;

                        if _cdsContasRef.FieldByName('UNIDNEGOC').isNull then
                        begin
                           if _cdsSaldosOT.FieldByName('UNIDNEGOC').AsString = '' then
                             iUnidNegoc := 0
                           else
                              iUnidNegoc := StrToInt(_cdsSaldosOT.FieldByName('UNIDNEGOC').AsString)
                        end else
                        begin
                           if _cdsContasRef.FieldByName('UNIDNEGOC').AsString = '' then
                             iUnidNegoc := 0
                           else
                             iUnidNegoc := StrToInt(_cdsContasRef.FieldByName('UNIDNEGOC').AsString);
                        end;

                        sContaD    := _cdsSaldosOT.FieldByName('PLACONTA').AsString;

                        if _cdsSaldosOT.FieldByName('CODSUBCONTA').AsString = '' then
                          iSubContaD := 0
                        else
                          iSubContaD := StrToInt(_cdsSaldosOT.FieldByName('CODSUBCONTA').AsString);

                        iPlanoPrev := _cdsPlanoPrevOri.FieldByName('IDPLANOPREV').AsInteger;
                        iPatro     := _cdsPlanoPrevOri.FieldByName('IDPATRO').AsInteger;
                        sContaC    := sConta;
                        sCCustoC   := '';
                        iSubContaC := 0;

                        //Faz o lançamento
                        FNomeCampo := 'Gerando Conta : ' + sContaD;
                        If dValLanc <> 0 then
                        Begin
                           dValLanc := StrToFloat(format('%18.2f', [dValLanc]));
                           dTotLanc := dTotLanc + dValLanc;

                           If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                     iCodPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                     iPlanoPrev, iPatro,dPlnCodigo,0,
                                                     sDataGera,sNumDoc,HistoContab.Hist1,
                                                     HistoContab.Hist2,HistoContab.Hist3,
                                                     HistoContab.Hist4,HistoContab.Hist5,
                                                     sTipoOper,sCCustoD,sContaD,
                                                     sCCustoC,sContaC,sHistorico,
                                                     dValLanc,False,bUsaPPatro) Then

                           Begin
                              sMensAPS_Log := sMensAPS_Log + Lancamento.MessageInfo + chr(13);
                              Raise Exception.Create(Lancamento.MessageInfo);
                           End Else
                           Begin
                              dPlnCodigo := Lancamento.RetornoPlnCodigo;
                           End;
                        End;
                     End;
                     _cdsPlanoPrevOri.Next;
                  End;

                  If Format('%17.2f',[dTotLanc]) <> Format('%17.2f',[_cdsSaldosOT.FieldByName('SALDOTOT').AsFloat]) then
                  Begin
                     sHistorico := sHistoricoOri+' - Arredondamento';

                     HistoContab.ArrumaHistorico(sHistorico);

                     dValLanc := StrToFloat(format('%18.2f', [(_cdsSaldosOT.FieldByName('SALDOTOT').AsFloat-dTotLanc)]));
                     If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                               iCodPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                               iPlanoPrev, iPatro,dPlnCodigo,0,
                                               sDataGera,sNumDoc,HistoContab.Hist1,
                                               HistoContab.Hist2,HistoContab.Hist3,
                                               HistoContab.Hist4,HistoContab.Hist5,
                                               sTipoOper,sCCustoD,sContaD,
                                               sCCustoC,sContaC,sHistorico,
                                               dValLanc,False,bUsaPPatro) Then

                     Begin
                        sMensAPS_Log := sMensAPS_Log + Lancamento.MessageInfo + chr(13);
                        Raise Exception.Create(Lancamento.MessageInfo);
                     End Else
                     Begin
                        dPlnCodigo := Lancamento.RetornoPlnCodigo;
                     End;
                  End;
                  _cdsSaldosOT.Next;
               End;

               _cdsContasRef.Next;
            End;

          //=========== Atualiza a tabela =========
          _sqlUpdPlanilha.SQL.Clear;
          _sqlUpdPlanilha.SQL.Add('UPDATE   PLANILHA            ');
          _sqlUpdPlanilha.SQL.Add('SET PANCODIGO = :PANCODIGO   ');
          _sqlUpdPlanilha.SQL.Add('WHERE  PLNCODIGO =:PLNCODIGO ');

          _sqlUpdPlanilha.Prepare;
          _sqlUpdPlanilha.ParamByName('PANCODIGO').asFloat := _cdsRateio.FieldByName('PANCODIGO').AsFloat;
          _sqlUpdPlanilha.ParamByName('PLNCODIGO').asFloat := dPlnCodigo;

          If not ExecSQL(_sqlUpdPlanilha.SQLChanged,False) Then
          Begin
             sMens := 'Erro ao Atualizar a Tabela PLANILHA.';
             Raise Exception.Create(sMens);
          End;

          //====== Verifica se a planilha foi gerada ======
          _sqlPlanilhaGerada.SQL.Clear;
          _sqlPlanilhaGerada.SQL.Add('SELECT   PLNPLANIL           ');
          _sqlPlanilhaGerada.SQL.Add('FROM  PLANILHA               ');
          _sqlPlanilhaGerada.SQL.Add('WHERE  PLNCODIGO =:PLNCODIGO ');

          _sqlPlanilhaGerada.Prepare;
          _sqlPlanilhaGerada.ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
          _cdsPlanilhaGerada.Data := _sqlPlanilhaGerada.Data;

          If not _cdsPlanilhaGerada.isEmpty then
          Begin
             MessageInfo := 'Gerada a Planilha no. ' + _cdsPlanilhaGerada.FieldByName('PLNPLANIL').asString;
             sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
          End;

          Commit;
          FNomeRateio := '';
          FNomeCampo  := '';

          _sqlUpdPlanilha.Free;
          _sqlSaldosDPP.Free;
          _sqlRateio.Free;
          _sqlSaldosO.Free;
          _sqlSaldosD.Free;
          _sqlContasRef.Free;
          _sqlVerifPlanil.Free;
          _sqlHistoPadrao.Free;
          _sqlInsContasxCC.Free;
          _sqlPlanilhaGerada.Free;

          _cdsPlanilhaGerada.Free;
          _cdsHistoPadrao.Free;
          _cdsRateio.Free;
          _cdsContasRef.Free;
          _cdsVerifPlanil.Free;
          _cdsSaldosDPP.Free;
          _cdsSaldosD.Free;
          _cdsSaldosO.Free;

          Result := True;

          MessageInfo := 'Planilhas de Rateio geradas com sucesso!';

          sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);

          sMensAPS_Log := sMensAPS_Log + '************************************' + chr(13);


        Except
           on E:Exception Do
           Begin
              RollBack;
              Result := False;
              FNomeRateio := '';
              FNomeCampo  := '';

              _sqlUpdPlanilha.Free;
              _sqlPlanilhaGerada.Free;
              _sqlSaldosDPP.Free;
              _sqlRateio.Free;
              _sqlSaldosO.Free;
              _sqlSaldosD.Free;
              _sqlContasRef.Free;
              _sqlVerifPlanil.Free;
              _sqlHistoPadrao.Free;
              _sqlInsContasxCC.Free;

              _cdsHistoPadrao.Free;
              _cdsRateio.Free;
              _cdsContasRef.Free;
              _cdsVerifPlanil.Free;
              _cdsSaldosDPP.Free;
              _cdsSaldosD.Free;
              _cdsSaldosO.Free;
              _cdsPlanilhaGerada.Free;

              MessageInfo := 'Problemas na geração da Planilha '+_cdsRateio.FieldByName('PANDESCRICAO').AsString;

              sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);

              sMensAPS_Log := sMensAPS_Log + '**********************************' + chr(13);

              FProgresso := 0;
              MessageInfo := sMens+' '+E.Message;
           End
        End;

        FProgresso := FProgresso + 1;
        _cdsRateio.Next;
     End;
  End;

end;

Function TCtrlProcessaContab.GeraLancaConsolidado(dEmpresa: Double;
  iUsuario, iPlano, iExercicio, iPeriodo: Integer; sTipoOper, sDataLanc,
  sMascara: string; bUsaPPatro,bOrcamento,bConsoUnidNegoc,bConsoSubConta: Boolean): Boolean;
var
    cTipoLanc :char;
    dAcuCor, dAcuOfi, dAcuGer, dAcuGer1, dAcuGer2, dAcuHist, dValCor,dPlnCodigo,dTotLanc : Double;
    dValLanc,dValOfi,dValGe1,dValGe2,dValGe3,dvalhistdeb,dTotal,dPercentual,dValDeb,dValCre,dValOrcDeb,dValOrcCre :Double;
    sMens,sContaD,sContaC,sCCustoD,sCCustoC,sNumDoc,sHistoricoOri,sHistPad,sConta,sCCusto,cTipo : string;
    iSubContaC,iSubConta,iSubContaD,iModulo,iPlanoPrev,iPlanoPatro,iUnidNegoc,iCodPlano,iX,iSaldoProc :Integer;

    bAchou :Boolean;
    sContaDebito, sContaCredito,sPlanoPrev,sPatro : string;
    sHist1,sHist2,sHist3,sHist4,sHist5,sHistorico :string;

    iPessoa,iSubContaOri,iUnidNegocOri :integer;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GeraLancaConsolidado(dEmpresa,iUsuario,iPlano,
                 iExercicio,iPeriodo,sTipoOper,sDataLanc,sMascara,bUsaPPatro,
                 bOrcamento,bConsoUnidNegoc,bConsoSubConta);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;

   End Else
   Begin
      FMaxProgresso := 0;
      FProgresso    := 0;
      sMens         := '';
      MessageInfo   := '*';
      iModulo       := 1;
      dPlnCodigo    := 0;
      sContaDebito  := '';
      sContaCredito := '';
      iPlanoPrev    := 0;
      iPlanoPatro   := 0;

      Try
          StartTransaction;

          MontaSQLConsolidado(iPeriodo,bConsoUnidNegoc,bConsoSubconta);

          //======================== Zera saldo orçado ========================
          FNomeRateio := 'Zera Saldo das Contas Orçadas...';
          FNomeCampo  := '';
          If not ZeraSaldoOrcado (dEmpresa,iExercicio,iPeriodo) Then
          Begin
             sMens := 'Erro ao Zerar os Saldos Orçados -  Tabela PLANOSALDO.';
             Raise Exception.Create(sMens);
          End;
          //====================== Exclui planilhas ============================
          If not bOrcamento then
          Begin
             FNomeRateio := 'Exclui as Planilhas Existentes...';
             FNomeCampo  := '';
             if Not ExcluiPlanilhasExistentes(dEmpresa,iExercicio,iPeriodo,iUsuario,iModulo,bUsaPPatro) Then
                Raise Exception.Create(Lancamento.MessageInfo);
          End;
          //=============== Zera Saldo das contas estatisticas ================
          FNomeRateio := 'Zera Saldo das Contas Estatísticas...';
          FNomeCampo  := '';
          If Not ZeraSaldoContaEst(dEmpresa,iExercicio,iPeriodo) Then
          Begin
             sMens := 'Erro ao Atualizar a Tabela PLANOSALDO.';
             Raise Exception.Create(sMens);
          End;
          //===================================================================

          //=========== calcula o Balancete dessa empresa selecionada ==========
          cdsEmpresasSel.Filtered := False;
          cdsEmpresasSel.Filter   := 'SEL = ''S''';
          cdsEmpresasSel.Filtered := True;

          cdsEmpresasSel.First;
          While not cdsEmpresasSel.Eof  do
          Begin
             _sqlPlano.Prepare;
             _sqlPlano.ParamByName('IDPESSOA').asInteger := cdsEmpresasSel.FieldByName('IDPESSOA').asInteger;
             _cdsPlano.Data := _sqlPlano.Data;

             //=================================================================
             If iPeriodo <> 0 then
             Begin
                _sqlBalancete.Prepare;
                _sqlBalancete.ParamByName('IDPESSOA').asFloat      := cdsEmpresasSel.FieldByName('IDPESSOA').asFloat;
                _sqlBalancete.ParamByName('PLANO').asInteger        := _cdsPlano.FieldByName('PLANO').asInteger;
                _sqlBalancete.ParamByName('PEREXERCICIO').asInteger := iExercicio;
                _sqlBalancete.ParamByName('PERNUMERO').asInteger    := iPeriodo;

                _cdsBalancete.Data := _sqlBalancete.Data;
             End Else
             Begin
                _sqlBalancete.Prepare;
                _sqlBalancete.ParamByName('IDPESSOA').asFloat       := cdsEmpresasSel.FieldByName('IDPESSOA').asFloat;
                _sqlBalancete.ParamByName('PLANO').asInteger        := _cdsPlano.FieldByName('PLANO').asInteger;
                _sqlBalancete.ParamByName('PEREXERCICIO').asInteger := iExercicio;

                _cdsBalancete.Data := _sqlBalancete.Data;
             End;

             FMaxProgresso := _cdsBalancete.RecordCount;
             FProgresso    := 0;
             _cdsBalancete.First;

             While not _cdsBalancete.eof do
             Begin
                iUnidNegoc := 0;
                iSubConta  := 0;

                If bConsoUnidNegoc then
                Begin

                  //=== busca unidade de negocio antes de inserir ====

                  _sqlBuscaUnNegBal.Prepare;
                  _sqlBuscaUnNegBal.ParamByName('UNIDNEGOC').asInteger := _cdsBalancete.FieldByName('UNIDNEGOC').AsInteger;
                  _sqlBuscaUnNegBal.ParamByName('IDPESSOA').asInteger  := _cdsBalancete.FieldByName('IDPESSOA').AsInteger;
                  _cdsBuscaUnNegBal.Data := _sqlBuscaUnNegBal.Data;

                  If not _cdsBuscaUnNegBal.IsEmpty then
                  Begin
                     _sqlBuscaUnNegCon.Prepare;
                     _sqlBuscaUnNegCon.ParamByName('UNECODIGO').asString := trim(_cdsBuscaUnNegBal.FieldByName('UNECODIGO').asString);
                     _sqlBuscaUnNegCon.ParamByName('IDPESSOA').asFloat   := dEmpresa;
                     _cdsBuscaUnNegCon.Data := _sqlBuscaUnNegCon.Data;

                     If _cdsBuscaUnNegCon.IsEmpty then
                     Begin

                        //== Insere a Atividade/Projeto no Consolidado ==
                        _sqlInsereUnidNegoc.ParamByName('UNIDNEGOC').asInteger := GetSequence('UNIDNEGOCIO');
                        _sqlInsereUnidNegoc.ParamByName('IDPESSOA').asFloat    := dEmpresa;
                        _sqlInsereUnidNegoc.ParamByName('NOME').asString       := _cdsBuscaUnNegBal.FieldByName('NOME').AsString;
                        _sqlInsereUnidNegoc.ParamByName('IDUSUARIO').asInteger := iUsuario;
                        _sqlInsereUnidNegoc.ParamByName('UNETIPO').asString    := _cdsBuscaUnNegBal.FieldByName('UNETIPO').AsString;
                        _sqlInsereUnidNegoc.ParamByName('UNECODIGO').asString  := _cdsBuscaUnNegBal.FieldByName('UNECODIGO').AsString;

                        If not ExecSQL(_sqlInsereUnidNegoc.SQLChanged,False) Then
                        Begin
                           sMens := 'Erro ao Inserir Dados na Tabela UNIDNEGOCIO.';
                           Raise Exception.Create(sMens);
                        End;

                        FNomeRateio := 'Inserindo Atividade/Projeto...';
                        FNomeCampo  := _cdsBuscaUnNegBal.FieldByName('UNECODIGO').AsString;

                     End Else
                     Begin
                        iUnidNegoc := _cdsBuscaUnNegCon.FieldByName('UNIDNEGOC').AsInteger;
                     End;
                  End;
                End;

                If bConsoSubConta then
                Begin

                  iSubConta := 0;
                  If _cdsBalancete.FieldByName('CODSUBCONTA').AsInteger <> 0 then
                  Begin
                     _sqlBuscaSubContaCon.Prepare;
                     _sqlBuscaSubContaCon.ParamByName('CODSUBCONTA').asInteger := _cdsBalancete.FieldByName('CODSUBCONTA').AsInteger;
                     _sqlBuscaSubContaCon.ParamByName('IDPESSOA').asFloat      := dEmpresa;
                     _cdsBuscaSubContaCon.Data := _sqlBuscaSubContaCon.Data;

                     If _cdsBuscaSubContaCon.IsEmpty then
                     Begin
                        iSubConta := _cdsBalancete.FieldByName('CODSUBCONTA').AsInteger;

                        _sqlBuscaSubContaCon.Prepare;
                        _sqlBuscaSubContaCon.ParamByName('CODSUBCONTA').asInteger := _cdsBalancete.FieldByName('CODSUBCONTA').AsInteger;
                        _sqlBuscaSubContaCon.ParamByName('IDPESSOA').asFloat      := _cdsBalancete.FieldByName('IDPESSOA').AsInteger;
                        _cdsBuscaSubContaCon.Data := _sqlBuscaSubContaCon.Data;

                        //Insere SubConta
                        If not _cdsBuscaSubContaCon.IsEmpty then
                        Begin
                           _sqlInsereSubConta.Prepare;
                           _sqlInsereSubConta.ParamByName('CODSUBCONTA').asInteger := iSubConta;
                           _sqlInsereSubConta.ParamByName('IDPESSOA').asFloat      := dEmpresa;
                           _sqlInsereSubConta.ParamByName('NOMESUBCONTA').asString := _cdsBuscaSubContaCon.FieldByName('NOMESUBCONTA').AsString;

                           If not ExecSQL(_sqlInsereSubConta.SQLChanged,False) Then
                           Begin
                              sMens := 'Erro ao Inserir Dados na Tabela SUBCONTA.';
                              Raise Exception.Create(sMens);
                           End;
                        End Else
                        Begin
                           _sqlInsereSubConta.Prepare;
                           _sqlInsereSubConta.ParamByName('CODSUBCONTA').asInteger := iSubConta;
                           _sqlInsereSubConta.ParamByName('IDPESSOA').asFloat      := dEmpresa;
                           _sqlInsereSubConta.ParamByName('NOMESUBCONTA').asString := 'Nome Provisório';

                           If not ExecSQL(_sqlInsereSubConta.SQLChanged,False) Then
                           Begin
                              sMens := 'Erro ao Inserir Dados na Tabela SUBCONTA.';
                              Raise Exception.Create(sMens);
                           End;

                        End;
                     End Else
                     Begin
                        iSubConta := _cdsBalancete.FieldByName('CODSUBCONTA').AsInteger;
                     End;
                  End;

                End;

                //== verifica se existe a conta do balancete na empresa consolidada ==
                _sqlBuscaConta.Prepare;
                _sqlBuscaConta.ParamByName('PLACONTA').asString := Copy(_cdsBalancete.FieldByName('PLACONTA').asString + '                  ',1,18);
                _sqlBuscaConta.ParamByName('PLANO').asInteger   := iPlano;
                _cdsBuscaConta.Data := _sqlBuscaConta.Data;

                //=== se não existe a conta, então cria ela ===
                If _cdsBuscaConta.isEmpty then
                Begin
                   _sqlBuscaConta.Prepare;
                   _sqlBuscaConta.ParamByName('PLACONTA').asString := Copy(_cdsBalancete.FieldByName('PLACONTA').asString + '                  ',1,18);
                   _sqlBuscaConta.ParamByName('PLANO').asInteger   := _cdsBalancete.FieldByName('PLANO').asInteger;
                   _cdsBuscaConta.Data := _sqlBuscaConta.Data;

                   //===== dá insert na nova conta =====

                   With _sqlInsereConta do
                   Begin
                      ParamByName('PLANO').asInteger             := iPlano;
                      ParamByName('PLACONTA').asString           := _cdsBuscaConta.FieldByName('PLACONTA').asString;
                      ParamByName('IDUSUARIOINCLUSAO').asInteger := iUsuario;
                      ParamByName('PLATIPO').asString            := _cdsBuscaConta.FieldByName('PLATIPO').asString;
                      ParamByName('PLAGRUPO').asString           := _cdsBuscaConta.FieldByName('PLAGRUPO').asString;
                      ParamByName('PLAGRAU').asInteger           := _cdsBuscaConta.FieldByName('PLAGRAU').asInteger;
                      ParamByName('PLANOME').asString            := _cdsBuscaConta.FieldByName('PLANOME').asString;
                      ParamByName('PLANOMEOUTLING').asString     := _cdsBuscaConta.FieldByName('PLANOMEOUTLING').asString;
                      ParamByName('PLASUBGR1').asInteger         := _cdsBuscaConta.FieldByName('PLASUBGR1').asInteger;
                      ParamByName('PLASUBGR2').asInteger         := _cdsBuscaConta.FieldByName('PLASUBGR2').asInteger;
                      ParamByName('PLASUBGR3').asInteger         := _cdsBuscaConta.FieldByName('PLASUBGR3').asInteger;
                      ParamByName('PLASUBGR4').asInteger         := _cdsBuscaConta.FieldByName('PLASUBGR4').asInteger;
                      ParamByName('PLAREDUZ').asInteger          := _cdsBuscaConta.FieldByName('PLAREDUZ').asInteger;
                      ParamByName('PLACCUST').asString           := _cdsBuscaConta.FieldByName('PLACCUST').asString;
                      ParamByName('PLAORDALF').asString          := _cdsBuscaConta.FieldByName('PLAORDALF').asString;
                      ParamByName('PLATIPCONVGER').asString      := _cdsBuscaConta.FieldByName('PLATIPCONVGER').asString;
                      ParamByName('PLATIPCONVGEREN1').asString   := _cdsBuscaConta.FieldByName('PLATIPCONVGEREN1').asString;
                      ParamByName('PLATIPCONVGEREN2').asString   := _cdsBuscaConta.FieldByName('PLATIPCONVGEREN2').asString;
                      ParamByName('PLATIPCONVOFICIAL').asString  := _cdsBuscaConta.FieldByName('PLATIPCONVOFICIAL').asString;
                      ParamByName('PLAALTERA').asString          := _cdsBuscaConta.FieldByName('PLAALTERA').asString;
                      ParamByName('PLAINATIVA').asString         := _cdsBuscaConta.FieldByName('PLAINATIVA').asString;
                      ParamByName('PLANATUREZA').asString        := _cdsBuscaConta.FieldByName('PLANATUREZA').asString;
                      ParamByName('PLASUMARIZA').asString        := 'N';
                      ParamByName('PLASECRETARIA').asString      := _cdsBuscaConta.FieldByName('PLASECRETARIA').asString;
                      ParamByName('PLAMOEDAHISTORICA').asInteger := _cdsBuscaConta.FieldByName('PLAMOEDAHISTORICA').asInteger;
                      ParamByName('PLASUBCONTA').asString        := 'N';
                      ParamByName('PLAMUTACOES').asString        := _cdsBuscaConta.FieldByName('PLAMUTACOES').asString;
                      ParamByName('PLACONCILIA').asString        := _cdsBuscaConta.FieldByName('PLACONCILIA').asString;
                      ParamByName('PLABLOQUE').asString          := _cdsBuscaConta.FieldByName('PLABLOQUE').asString;
                      ParamByName('PLABLOQUEDATA').asDateTime    := _cdsBuscaConta.FieldByName('PLABLOQUEDATA').asDateTime;
                      ParamByName('PLACONCORRESP').asString      := _cdsBuscaConta.FieldByName('PLACONCORRESP').asString;

                      If not ExecSQL(_sqlInsereConta.SQLChanged,False) Then
                      Begin
                         sMens := 'Erro ao Inserir Dados na Tabela SUBCONTA.';
                         Raise Exception.Create(sMens);
                      End;

                      FNomeRateio := 'Inserindo Conta...';
                      FNomeCampo  := _cdsBuscaConta.FieldByName('PLACONTA').asString;

                      If _cdsBuscaConta.FieldByName('PLACCUST').asString = 'S' then
                      Begin

                       //Insere o Centro de Custo
                       If _cdsBalancete.FieldByName('CCUSTO').asString <> 'XX' then
                       Begin
                         _sqlBuscaCCusto.Prepare;
                         _sqlBuscaCCusto.ParamByName('CODCENTROCUSTO').asString := Copy(_cdsBalancete.FieldByName('CCUSTO').asString+ '          ',1,10);
                         _sqlBuscaCCusto.ParamByName('IDEMPRESA').asFloat       := dEmpresa;
                         _cdsBuscaCCusto.Data := _sqlBuscaCCusto.Data;

                         If _cdsBuscaCCusto.isEmpty then
                         Begin
                            _sqlBuscaCCusto.Prepare;
                            _sqlBuscaCCusto.ParamByName('CODCENTROCUSTO').asString := Copy(_cdsBalancete.FieldByName('CCUSTO').asString+ '          ',1,10);
                            _sqlBuscaCCusto.ParamByName('IDEMPRESA').asInteger     := _cdsBalancete.FieldByName('IDPESSOA').asInteger;
                            _cdsBuscaCCusto.Data := _sqlBuscaCCusto.Data;

                            If not _cdsBuscaCCusto.isEmpty then
                            Begin
                               With _sqlInsereCCusto do
                               Begin
                                  ParamByName('CODCENTROCUSTO').asString     := _cdsBuscaCCusto.FieldByName('CODCENTROCUSTO').asString;
                                  ParamByName('IDEMPRESA').asFloat           := dEmpresa;
                                  ParamByName('IDUSUARIOINCLUSAO').asInteger := iUsuario;
                                  ParamByName('NOME').asString               := _cdsBuscaCCusto.FieldByName('NOME').asString;
                                  ParamByName('STATUSGRUPOCDC').asString     := _cdsBuscaCCusto.FieldByName('STATUSGRUPOCDC').asString;
                                  ParamByName('RESPONSAVEL').asString        := _cdsBuscaCCusto.FieldByName('RESPONSAVEL').asString;
                                  ParamByName('CODREDUZIDO').asString        := _cdsBuscaCCusto.FieldByName('CODREDUZIDO').asString;
                                  ParamByName('ATIVO').asString              := _cdsBuscaCCusto.FieldByName('ATIVO').asString;
                                  ParamByName('IDUSUARIO').asInteger         := iUsuario;

                                  If not ExecSQL(_sqlInsereCCusto.SQLChanged,False) Then
                                  Begin
                                     sMens := 'Erro ao Inserir Dados na Tabela CENTCUST.';
                                     Raise Exception.Create(sMens);
                                  End;

                                  FNomeRateio  := 'Inserindo Centro de Custo...';
                                  FNomeCampo   := _cdsBuscaCCusto.FieldByName('CODCENTROCUSTO').asString;
                               End;
                            End;
                         End;
                         //=== insere na tabela relacao conta x centrocusto ===
                         _sqlBuscaContaxCC.Prepare;
                         _sqlBuscaContaxCC.ParamByName('CODCENTROCUSTO').asString := Copy(_cdsBalancete.FieldByName('CCUSTO').asString+'          ',1,10);
                         _sqlBuscaContaxCC.ParamByName('IDEMPRESA').asFloat       := dEmpresa;
                         _sqlBuscaContaxCC.ParamByName('PLANO').asInteger         := iPlano;
                         _sqlBuscaContaxCC.ParamByName('PLACONTA').asString       := Copy(_cdsBalancete.FieldByName('PLACONTA').asString+'                  ',1,18);
                         _cdsBuscaContaxCC.Data := _sqlBuscaContaxCC.Data;

                         If _cdsBuscaContaxCC.IsEmpty then
                         Begin

                           //Insere o relacionamento da Conta e do Centro de Custo
                           With _sqlInsereContasxCC do
                           Begin
                             ParamByName('PLANO').asInteger             := iPlano;
                             ParamByName('PLACONTA').asString           := _cdsBalancete.FieldByName('PLACONTA').asString;
                             ParamByName('CODCENTROCUSTO').asString     := _cdsBalancete.FieldByName('CCUSTO').asString;
                             ParamByName('IDEMPRESA').asFloat           := dEmpresa;
                             ParamByName('IDUSUARIOINCLUSAO').asInteger := iUsuario;

                             If not ExecSQL(_sqlInsereContasxCC.SQLChanged,False) Then
                             Begin
                                sMens := 'Erro ao Inserir Dados na Tabela CONTASXCC.';
                                Raise Exception.Create(sMens);
                             End;

                             FNomeRateio := 'Inserindo relacionamento ContaxCC...';
                             FNomeCampo  := _cdsBuscaCCusto.FieldByName('CODCENTROCUSTO').asString;
                           End;
                         End;
                       End;
                      End;
                   End;
                End;
                sConta  := _cdsBalancete.FieldByName('PLACONTA').asString;
                sCCusto := _cdsBalancete.FieldByName('CCUSTO').asString;
                cTipo   := _cdsBalancete.FieldByName('PLATIPO').asString;

                If sCCusto = 'XX' then
                Begin
                   sCCusto := '';
                End;

                //verifica se o período selecionado é nulo, para calcular o saldo anterior
                If (iPeriodo = 0) or (_cdsBalancete.FieldByName('PLAGRUPO').AsString = 'E') then
                Begin

                   dValDeb := _cdsBalancete.FieldByName('DEB').asFloat;
                   dValCre := _cdsBalancete.FieldByName('CRED').asFloat;

                   If Not InsereSaldo(dEmpresa,dValCre,dValDeb,iPlano,iExercicio,
                                      iPeriodo,iSubConta,iUnidNegoc,iUsuario,cTipo,sConta,sCCusto) Then
                   Begin
                      sMens := 'Erro ao Inserir Dados na Tabela PLANOSALDO.';
                      Raise Exception.Create(sMens);
                   End;

                   FNomeRateio := 'Inserindo Saldo...';
                   FNomeCampo  := sConta;

                End Else
                Begin
                   If not (bOrcamento) then
                   Begin
                      if _cdsBuscaConta.FieldByName('PLATIPO').asString = 'A' then begin
                         //faz o lancamento contábil a Débito na empresa consolidada
                         sNumDoc     := 'CONSOLIDADO';

                         HistoContab.ArrumaHistorico('Lançamento na Empresa ' + cdsEmpresasSel.FieldByName('NOMEEMPRESA').asString);

                         sContaD   := _cdsBalancete.FieldByName('PLACONTA').asString;

                         sCCustoD   := sCCusto;
                         sContaC    := '';
                         sCCustoC   := '';
                         cTipoLanc  := '0';
                         iSubContaD := iSubConta;
                         dValLanc   := _cdsBalancete.FieldByName('DEB').asFloat;
                         iSubContaC := 0;

                         If dValLanc <> 0 then
                         Begin
                            Lancamento.lcTestaConta := True;
                            If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                      iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                      iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                      sDataLanc,sNumDoc,HistoContab.Hist1,
                                                      HistoContab.Hist2,HistoContab.Hist3,
                                                      HistoContab.Hist4,HistoContab.Hist5,
                                                      sTipoOper,sCCustoD,sContaD,
                                                      sCCustoC,sContaC,sHistorico,
                                                      dValLanc,False,bUsaPPatro) Then

                            Begin
                               Raise Exception.Create(Lancamento.MessageInfo);
                            End Else
                            Begin
                               dPlnCodigo := Lancamento.RetornoPlnCodigo;
                            End;
                         End;

                         FNomeRateio := 'Inserindo Lançamento Débito...';
                         FNomeCampo  := sContaD;

                         //faz o lancamento contábil a Crédito na empresa consolidada
                         sNumDoc    := 'CONSOLIDADO';

                         HistoContab.ArrumaHistorico('Lançamento na Empresa ' + cdsEmpresasSel.FieldByName('NOMEEMPRESA').AsString);

                         sContaD    := '';
                         sCCustoD   := '';
                         sContaC    := _cdsBalancete.FieldByName('PLACONTA').asString;
                         sCCustoC   := sCCusto;
                         cTipoLanc  := '1';
                         iSubContaC := iSubConta;
                         dValLanc   := _cdsBalancete.FieldByName('CRED').asFloat;

                         If dValLanc <> 0 then
                         Begin
                            Lancamento.lcTestaConta := True;
                            If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                      iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                      iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                      sDataLanc,sNumDoc,HistoContab.Hist1,
                                                      HistoContab.Hist2,HistoContab.Hist3,
                                                      HistoContab.Hist4,HistoContab.Hist5,
                                                      sTipoOper,sCCustoD,sContaD,
                                                      sCCustoC,sContaC,sHistorico,
                                                      dValLanc,False,bUsaPPatro) Then

                            Begin
                               Raise Exception.Create(Lancamento.MessageInfo);
                            End Else
                            Begin
                               dPlnCodigo := Lancamento.RetornoPlnCodigo;
                            End;
                         End;

                         FNomeRateio := 'Inserindo Lançamento Crédito...';
                         FNomeCampo  := sContaC;
                      End;
                   End;
                End;

                If iPeriodo <> 0 then
                Begin
                   //=== Procura valor orçado na empresa de origem ===
                   if bConsoUnidNegoc then
                      iUnidNegocOri := _cdsBalancete.FieldByName('UNIDNEGOC').AsInteger
                   else
                      iUnidNegocOri := 0;

                   if bConsoSubConta then
                      iSubContaOri := _cdsBalancete.FieldByName('CODSUBCONTA').AsInteger
                   else
                      iSubContaOri := 0;


                   iSaldoProc := ProcuraSaldo(sConta, sCCusto, iUnidNegocOri, _cdsPlano.FieldByName('PLANO').asInteger,
                                              iSubContaOri,iPeriodo,iexercicio,dEmpresa,cdsEmpresasSel.FieldByName('IDPESSOA').asFloat);

                   If iSaldoProc <> 0 then
                   Begin

                      dValOrcDeb := 0;
                      dValOrcCre := 0;

                      _cdsProcuraSaldo.First;

                      While not _cdsProcuraSaldo.EOF do
                      Begin
                         dValOrcDeb := dValOrcDeb + _cdsProcuraSaldo.FieldByName('PLSORCADODEBITO').asFloat;
                         dValOrcCre := dValOrcCre + _cdsProcuraSaldo.FieldByName('PLSORCADOCREDITO').asFloat;
                         _cdsProcuraSaldo.Next;
                      End;

                      //Procura se já existe saldo para esta conta e este centro de custo na empresa consolidada

                      iSaldoProc := ProcuraSaldo(sConta, sCCusto, iUnidNegoc, _cdsBalancete.FieldByName('PLANO').asInteger,
                                              iSubConta,iPeriodo,iexercicio,dEmpresa,dEmpresa);

                      If iSaldoProc <> 0 then
                      Begin
                         //altera o saldo orcamentário já existente
                         If not AlteraSaldoOrc(iSaldoProc, dValOrcDeb, dValOrcCre) Then
                         Begin
                            sMens := 'Erro ao Alterar a Tabela PLANOSALDO.';
                            Raise Exception.Create(sMens);
                         End;

                      End Else
                      Begin
                         //insere o saldo orcamentário caso não existente
                         If not InsereSaldoOrc(dEmpresa,sConta, sCCusto, cTipo, dValOrcDeb,
                                         dValOrcCre,iExercicio,iPeriodo,iUsuario,iPlano, iUnidNegoc, iSubConta) then
                         Begin
                            sMens := 'Erro ao Inserir Dados na Tabela PLANOSALDO.';
                            Raise Exception.Create(sMens);
                         End;
                         FNomeRateio := 'Inserindo Saldo Orçado...';
                         FNomeCampo  := sConta;
                      End;
                      FNomeRateio := 'Atualizando Orçamento...';
                      FNomeCampo   := sContaC;
                   End;
                End;
                _cdsBalancete.Next;
                FProgresso := FProgresso + 1;
             End;
          End;
          Commit;
          FNomeRateio := '';
          FNomeCampo  := '';

          Result := True;

          MessageInfo := 'Geração de Dados do Consolidado realizada com sucesso!';



      Except
        on E:Exception Do
        Begin
           RollBack;
           Result := False;

           FNomeRateio := '';
           FNomeCampo  := '';


           MessageInfo := 'Problemas detectados na Geração de Dados do Consolidado.';

           FProgresso := 0;
           MessageInfo := sMens+' '+E.Message;
        End
      End;
  End;
end;

procedure TCtrlProcessaContab.OnCreateAppServer;
begin
  inherited;
  FCdsEmpresasSel  := TClientDataSet.Create(nil);
end;

procedure TCtrlProcessaContab.SetcdsEmpreasSel(
  const Value: TClientDataSet);
begin
  FcdsEmpresasSel := Value;
end;

function TCtrlProcessaContab.ProcuraSaldo(sConta, sCCusto: string;
         iUnidNegocOri, iPlano, iSubContaOri,iPeriodo,iExercicio: Integer;dEmpresa,dPessoa:Double): LongInt;
var
  _sqlProcuraSaldo   :TCMSqlParams;

begin
   _sqlProcuraSaldo  := TCMSqlParams.Create(nil);
   _sqlProcuraSaldo.ControlObject := Self;

   with _sqlProcuraSaldo do begin
      SQL.Clear;
      SQL.Add('SELECT                                                          ');
      SQL.Add('   IDPLANOSALDO, PLSDEBITOCORRENTE, PLSCREDITOCOR,              ');
      SQL.Add('   PLSORCADODEBITO,  PLSORCADOCREDITO                           ');
      SQL.Add('FROM                                                            ');
      SQL.Add('   PLANOSALDO                                                   ');
      SQL.Add('WHERE                                                           ');
      SQL.Add('      (PLACONTA=:PLACONTA)                                      ');
      SQL.Add('  AND (PLANO=:PLANO)                                            ');
      if sCCusto <> '' then begin
         SQL.Add(' AND (CODCENTROCUSTO=:CODCENTROCUSTO)                        ');
         SQL.Add(' AND (IDEMPRESA=:IDEMPRESA)                                  ');
      end;
      if iUnidNegocOri <> 0 then
         SQL.Add(' AND (UNIDNEGOC=:UNIDNEGOC)                                   ');
      if dPessoa = dEmpresa then begin
         if iSubContaOri <> 0 then
            SQL.Add(' AND (CODSUBCONTA=:CODSUBCONTA)                            ')
         else
            SQL.Add(' AND (CODSUBCONTA IS NULL)                                 ');
      end else begin
         if iSubContaOri <> 0 then
            SQL.Add(' AND (CODSUBCONTA=:CODSUBCONTA)                            ');
      end;
      SQL.Add('  AND (IDPESSOA=:IDPESSOA)                                         ');
      SQL.Add('  AND (PEREXERCICIO=:PEREXERCICIO)                                 ');
      if iPeriodo <> 0 then
         SQL.Add('  AND (PERNUMERO   =:PERNUMERO)                                 ')
      else
         SQL.Add('  AND (PERNUMERO IS NULL)                                       ');


      ParamByName('PLACONTA').asString      := copy(sConta + '                   ',1,18);
      ParamByName('PLANO').asInteger        := iPlano;
      if sCCusto <> '' then begin
         ParamByName('CODCENTROCUSTO').asString := copy(sCCusto +'          ',1,10);
         ParamByName('IDEMPRESA').asFloat       := dPessoa;
      end;
      if iUnidNegocOri <> 0 then
         ParamByName('UNIDNEGOC').asInteger     := iUnidNegocOri;
      if iSubContaOri <> 0 then
         ParamByName('CODSUBCONTA').asInteger  := iSubContaOri;
      ParamByName('IDPESSOA').asFloat          := dPessoa;
      ParamByName('PEREXERCICIO').asInteger    := iExercicio;
      if iPeriodo <> 0 then
         ParamByName('PERNUMERO').asInteger    := iPeriodo;

      _cdsProcuraSaldo.Data := Data;

      if _cdsProcuraSaldo.isEmpty then begin
         result := 0;
      end else begin
         result := _cdsProcuraSaldo.FieldByName('IDPLANOSALDO').asInteger;
      end;
   end;
   _sqlProcuraSaldo.free;
end;

function TCtrlProcessaContab.AlteraSaldoOrc(iSaldo: integer; dValOrcDeb,
  dValOrcCre: Double): Boolean;

var
  _sqlSaldoOrc   :TCMSqlParams;

begin
   _sqlSaldoOrc  := TCMSqlParams.Create(nil);
   _sqlSaldoOrc.ControlObject := Self;

   _sqlSaldoOrc.SQL.Clear;
   _sqlSaldoOrc.SQL.Add('UPDATE PLANOSALDO SET                                     ');
   _sqlSaldoOrc.SQL.Add('   PLSORCADODEBITO=PLSORCADODEBITO + :PLSORCADODEBITO,    ');
   _sqlSaldoOrc.SQL.Add('   PLSORCADOCREDITO =PLSORCADOCREDITO + :PLSORCADOCREDITO ');
   _sqlSaldoOrc.SQL.Add('WHERE                                                     ');
   _sqlSaldoOrc.SQL.Add('   IDPLANOSALDO=:IDPLANOSALDO                             ');

   _sqlSaldoOrc.ParamByName('IDPLANOSALDO').asInteger   := iSaldo;
   _sqlSaldoOrc.ParamByName('PLSORCADOCREDITO').asFloat := dValOrcCre;
   _sqlSaldoOrc.ParamByName('PLSORCADODEBITO').asFloat  := dValOrcDeb;

   result := ExecSQL(_sqlSaldoOrc.SQLChanged,False);
   _sqlSaldoOrc.free;
end;

function TCtrlProcessaContab.InsereSaldoOrc(dEmpresa:Double;sConta, sCCusto, cTipo: string;
     dValOrcDeb, dValOrcCre: Double;iExercicio,iPeriodo,iUsuario,iPlano,iUnidNegoc, iSubConta: Integer): Boolean;
var
  _sqlSaldoOrc   :TCMSqlParams;

begin
   _sqlSaldoOrc  := TCMSqlParams.Create(nil);
   _sqlSaldoOrc.ControlObject := Self;

   _sqlSaldoOrc.SQL.Clear;
   _sqlSaldoOrc.SQL.Add('INSERT INTO PLANOSALDO                                                 ');
   _sqlSaldoOrc.SQL.Add('  (IDPLANOSALDO, IDPESSOA, PLACONTA, CODCENTROCUSTO, IDEMPRESA,        ');
   _sqlSaldoOrc.SQL.Add('   PLANO, PEREXERCICIO, PLSORCADODEBITO, PLSORCADOCREDITO,             ');
   _sqlSaldoOrc.SQL.Add('   IDUSUARIOINCLUSAO, PLSTIPO, PERNUMERO, UNIDNEGOC, CODSUBCONTA)      ');
   _sqlSaldoOrc.SQL.Add('VALUES                                                                 ');
   _sqlSaldoOrc.SQL.Add('  (:IDPLANOSALDO, :IDPESSOA, :PLACONTA, :CODCENTROCUSTO, :IDEMPRESA,   ');
   _sqlSaldoOrc.SQL.Add('   :PLANO, :PEREXERCICIO, :PLSORCADODEBITO, :PLSORCADOCREDITO,         ');
   _sqlSaldoOrc.SQL.Add('   :IDUSUARIOINCLUSAO, :PLSTIPO, :PERNUMERO, :UNIDNEGOC, :CODSUBCONTA) ');

   with _sqlSaldoOrc do begin
      ParamByName('PLANO').asInteger             := iPlano;
      if sCCusto <> '' then begin
         ParamByName('CODCENTROCUSTO').asString  := sCCusto;
         ParamByName('IDEMPRESA').asFloat        := dEmpresa;
      end else begin
         ParamByName('CODCENTROCUSTO').clear;
         ParamByName('IDEMPRESA').clear;
      end;
      if iUnidNegoc <> 0 then
         ParamByName('UNIDNEGOC').asInteger := iUnidNegoc
      else
         ParamByName('UNIDNEGOC').clear;
      if iSubConta <> 0 then
         ParamByName('CODSUBCONTA').asInteger := iSubConta
      else
         ParamByName('CODSUBCONTA').clear;

      ParamByName('IDPLANOSALDO').asInteger      := GetSequence('PLANOSALDO');
      ParamByName('IDUSUARIOINCLUSAO').asInteger := iUsuario;
      ParamByName('IDPESSOA').asFloat            := dEmpresa;
      ParamByName('PEREXERCICIO').asInteger      := iExercicio;
      ParamByName('PERNUMERO').asInteger         := iPeriodo;
      ParamByName('PLSTIPO').asString            := cTipo;
      ParamByName('PLACONTA').asString           := sConta;
      ParamByName('PLSORCADOCREDITO').asFloat    := dValOrcCre;
      ParamByName('PLSORCADODEBITO').asFloat     := dValOrcDeb;
   end;

   result := ExecSQL(_sqlSaldoOrc.SQLChanged,False);

   _sqlSaldoOrc.free;

end;

procedure TCtrlProcessaContab.MontaSQLConsolidado(iPeriodo:Integer;bConsoUnidNegoc,bConsoSubconta:Boolean);
begin

    _sqlPlano.SQL.Clear;
    _sqlPlano.SQL.Add('SELECT PLANO               ');
    _sqlPlano.SQL.Add('FROM PARAMCONTAB           ');
    _sqlPlano.SQL.Add('WHERE IDPESSOA =:IDPESSOA  ');
    //===================================================================
    _sqlInsereSaldoPer.SQL.Clear;
    _sqlInsereSaldoPer.SQL.Add('INSERT INTO PLANOSALDO                                                 ');
    _sqlInsereSaldoPer.SQL.Add('  (IDPLANOSALDO, IDPESSOA, PLACONTA, CODCENTROCUSTO, IDEMPRESA,        ');
    _sqlInsereSaldoPer.SQL.Add('   PLANO, PEREXERCICIO, PLSDEBITOCORRENTE, PLSCREDITOCOR,              ');
    _sqlInsereSaldoPer.SQL.Add('   IDUSUARIOINCLUSAO, PLSTIPO, UNIDNEGOC, PERNUMERO, CODSUBCONTA)      ');
    _sqlInsereSaldoPer.SQL.Add('VALUES                                                                 ');
    _sqlInsereSaldoPer.SQL.Add('  (:IDPLANOSALDO, :IDPESSOA, :PLACONTA, :CODCENTROCUSTO, :IDEMPRESA,   ');
    _sqlInsereSaldoPer.SQL.Add('   :PLANO, :PEREXERCICIO, :PLSDEBITOCORRENTE, :PLSCREDITOCOR,          ');
    _sqlInsereSaldoPer.SQL.Add('   :IDUSUARIOINCLUSAO, :PLSTIPO, :UNIDNEGOC, :PERNUMERO, :CODSUBCONTA) ');
    //===================================================================
    _sqlInsereSaldoAnt.SQL.Clear;
    _sqlInsereSaldoAnt.SQL.Add('INSERT INTO PLANOSALDO                                               ');
    _sqlInsereSaldoAnt.SQL.Add('  (IDPLANOSALDO, IDPESSOA, PLACONTA, CODCENTROCUSTO, IDEMPRESA,      ');
    _sqlInsereSaldoAnt.SQL.Add('   PLANO, PEREXERCICIO, PLSDEBITOCORRENTE, PLSCREDITOCOR,            ');
    _sqlInsereSaldoAnt.SQL.Add('   IDUSUARIOINCLUSAO, PLSTIPO, UNIDNEGOC, CODSUBCONTA)               ');
    _sqlInsereSaldoAnt.SQL.Add('VALUES                                                               ');
    _sqlInsereSaldoAnt.SQL.Add('  (:IDPLANOSALDO, :IDPESSOA, :PLACONTA, :CODCENTROCUSTO, :IDEMPRESA, ');
    _sqlInsereSaldoAnt.SQL.Add('   :PLANO, :PEREXERCICIO, :PLSDEBITOCORRENTE, :PLSCREDITOCOR,        ');
    _sqlInsereSaldoAnt.SQL.Add('   :IDUSUARIOINCLUSAO, :PLSTIPO, :UNIDNEGOC, :CODSUBCONTA)           ');
    //===================================================================
    _sqlBuscaContaxCC.SQL.Clear;
    _sqlBuscaContaxCC.SQL.Add('SELECT CODCENTROCUSTO                    ');
    _sqlBuscaContaxCC.SQL.Add('FROM CONTASXCC                           ');
    _sqlBuscaContaxCC.SQL.Add('WHERE                                    ');
    _sqlBuscaContaxCC.SQL.Add('   (CODCENTROCUSTO =:CODCENTROCUSTO) AND ');
    _sqlBuscaContaxCC.SQL.Add('   (IDEMPRESA =:IDEMPRESA) AND           ');
    _sqlBuscaContaxCC.SQL.Add('   (PLACONTA = :PLACONTA) AND            ');
    _sqlBuscaContaxCC.SQL.Add('   (PLANO = :PLANO)                      ');
    //===================================================================
    _sqlBuscaCCusto.SQL.Clear;
    _sqlBuscaCCusto.SQL.Add('SELECT                                   ');
    _sqlBuscaCCusto.SQL.Add('   CODCENTROCUSTO, NOME,                 ');
    _sqlBuscaCCusto.SQL.Add('   STATUSGRUPOCDC, RESPONSAVEL,          ');
    _sqlBuscaCCusto.SQL.Add('   CODREDUZIDO, ATIVO                    ');
    _sqlBuscaCCusto.SQL.Add('FROM CENTCUST                            ');
    _sqlBuscaCCusto.SQL.Add('WHERE                                    ');
    _sqlBuscaCCusto.SQL.Add('   (CODCENTROCUSTO =:CODCENTROCUSTO) AND ');
    _sqlBuscaCCusto.SQL.Add('   (IDEMPRESA =:IDEMPRESA)               ');
    //===================================================================
    _sqlInsereCCusto.SQL.Clear;
    _sqlInsereCCusto.SQL.Add('INSERT INTO CENTCUST                  ');
    _sqlInsereCCusto.SQL.Add('   (CODCENTROCUSTO, IDEMPRESA,        ');
    _sqlInsereCCusto.SQL.Add('   IDUSUARIOINCLUSAO, NOME,           ');
    _sqlInsereCCusto.SQL.Add('   STATUSGRUPOCDC, RESPONSAVEL,       ');
    _sqlInsereCCusto.SQL.Add('   CODREDUZIDO, ATIVO, IDUSUARIO)     ');
    _sqlInsereCCusto.SQL.Add('VALUES                                ');
    _sqlInsereCCusto.SQL.Add('   (:CODCENTROCUSTO, :IDEMPRESA,      ');
    _sqlInsereCCusto.SQL.Add('   :IDUSUARIOINCLUSAO, :NOME,         ');
    _sqlInsereCCusto.SQL.Add('   :STATUSGRUPOCDC, :RESPONSAVEL,     ');
    _sqlInsereCCusto.SQL.Add('   :CODREDUZIDO, :ATIVO, :IDUSUARIO)  ');

    //===================================================================
    _sqlBuscaSubContaCon.SQL.Clear; // busca subconta no conslidado
    _sqlBuscaSubContaCon.SQL.Add('SELECT CODSUBCONTA,NOMESUBCONTA         ');
    _sqlBuscaSubContaCon.SQL.Add('FROM SUBCONTA                           ');
    _sqlBuscaSubContaCon.SQL.Add('WHERE  (CODSUBCONTA =:CODSUBCONTA) AND  ');
    _sqlBuscaSubContaCon.SQL.Add('       (IDPESSOA  =:IDPESSOA)           ');
    //===================================================================
    _sqlBuscaUnNegBal.SQL.Clear;
    _sqlBuscaUnNegBal.SQL.Add('SELECT UNIDNEGOC,IDPESSOA, NOME,       ');
    _sqlBuscaUnNegBal.SQL.Add('       UNETIPO, UNECODIGO              ');
    _sqlBuscaUnNegBal.SQL.Add('FROM   UNIDNEGOCIO                     ');
    _sqlBuscaUnNegBal.SQL.Add('WHERE   (UNIDNEGOC =:UNIDNEGOC) AND    ');
    _sqlBuscaUnNegBal.SQL.Add('        (IDPESSOA  =:IDPESSOA)         ');
    //===================================================================
    _sqlBuscaUnNegCon.SQL.Clear;
    _sqlBuscaUnNegCon.SQL.Add('SELECT UNIDNEGOC                    ');
    _sqlBuscaUnNegCon.SQL.Add('FROM UNIDNEGOCIO                    ');
    _sqlBuscaUnNegCon.SQL.Add('WHERE (UNECODIGO =:UNECODIGO) AND   ');
    _sqlBuscaUnNegCon.SQL.Add('      (IDPESSOA  =:IDPESSOA)        ');
    //===================================================================
    _sqlInsereSubConta.SQL.Clear;
    _sqlInsereSubConta.SQL.Add('INSERT INTO SUBCONTA                        ');
    _sqlInsereSubConta.SQL.Add('   (CODSUBCONTA, IDPESSOA, NOMESUBCONTA)    ');
    _sqlInsereSubConta.SQL.Add('VALUES                                      ');
    _sqlInsereSubConta.SQL.Add('   (:CODSUBCONTA, :IDPESSOA, :NOMESUBCONTA) ');
    //===================================================================
    _sqlInsereUnidNegoc.SQL.Clear;
    _sqlInsereUnidNegoc.SQL.Add('INSERT INTO UNIDNEGOCIO                                              ');
    _sqlInsereUnidNegoc.SQL.Add('    (UNIDNEGOC, IDPESSOA, NOME, IDUSUARIO, UNETIPO, UNECODIGO)      ');
    _sqlInsereUnidNegoc.SQL.Add('VALUES                                                               ');
    _sqlInsereUnidNegoc.SQL.Add('    (:UNIDNEGOC, :IDPESSOA, :NOME, :IDUSUARIO, :UNETIPO, :UNECODIGO) ');
    //===================================================================
    _sqlInsereContaxCC.SQL.Clear;
    _sqlInsereContaxCC.SQL.Add('INSERT INTO CONTASXCC                   ');
    _sqlInsereContaxCC.SQL.Add('   (PLANO, PLACONTA, CODCENTROCUSTO,    ');
    _sqlInsereContaxCC.SQL.Add('   IDEMPRESA, IDUSUARIOINCLUSAO)        ');
    _sqlInsereContaxCC.SQL.Add('VALUES                                  ');
    _sqlInsereContaxCC.SQL.Add('   (:PLANO, :PLACONTA, :CODCENTROCUSTO, ');
    _sqlInsereContaxCC.SQL.Add('   :IDEMPRESA, :IDUSUARIOINCLUSAO)      ');
    //===================================================================
    _sqlInsereConta.SQL.Clear;
    _sqlInsereConta.SQL.Add('INSERT INTO PLANOCONTA                                        ');
    _sqlInsereConta.SQL.Add('  (PLANO, PLACONTA, IDUSUARIOINCLUSAO,                        ');
    _sqlInsereConta.SQL.Add('   PLATIPO, PLAGRUPO, PLAGRAU, PLANOME,                       ');
    _sqlInsereConta.SQL.Add('   PLANOMEOUTLING, PLASUBGR1, PLASUBGR2,                      ');
    _sqlInsereConta.SQL.Add('   PLASUBGR3, PLASUBGR4, PLAREDUZ, PLACCUST,                  ');
    _sqlInsereConta.SQL.Add('   PLAORDALF, PLATIPCONVGER, PLATIPCONVGEREN1,                ');
    _sqlInsereConta.SQL.Add('   PLATIPCONVGEREN2, PLATIPCONVOFICIAL, PLAALTERA,            ');
    _sqlInsereConta.SQL.Add('   PLAINATIVA, PLANATUREZA, PLASUMARIZA, PLASECRETARIA,       ');
    _sqlInsereConta.SQL.Add('   PLAMOEDAHISTORICA, PLASUBCONTA, PLAMUTACOES,               ');
    _sqlInsereConta.SQL.Add('   PLACONCILIA, PLABLOQUE, PLABLOQUEDATA, PLACONCORRESP)      ');
    _sqlInsereConta.SQL.Add('VALUES                                                        ');
    _sqlInsereConta.SQL.Add('  (:PLANO, :PLACONTA, :IDUSUARIOINCLUSAO,                     ');
    _sqlInsereConta.SQL.Add('   :PLATIPO, :PLAGRUPO, :PLAGRAU, :PLANOME,                   ');
    _sqlInsereConta.SQL.Add('   :PLANOMEOUTLING, :PLASUBGR1, :PLASUBGR2,                   ');
    _sqlInsereConta.SQL.Add('   :PLASUBGR3, :PLASUBGR4, :PLAREDUZ, :PLACCUST,              ');
    _sqlInsereConta.SQL.Add('   :PLAORDALF, :PLATIPCONVGER, :PLATIPCONVGEREN1,             ');
    _sqlInsereConta.SQL.Add('   :PLATIPCONVGEREN2, :PLATIPCONVOFICIAL, :PLAALTERA,         ');
    _sqlInsereConta.SQL.Add('   :PLAINATIVA, :PLANATUREZA, :PLASUMARIZA, :PLASECRETARIA,   ');
    _sqlInsereConta.SQL.Add('   :PLAMOEDAHISTORICA, :PLASUBCONTA, :PLAMUTACOES,            ');
    _sqlInsereConta.SQL.Add('   :PLACONCILIA, :PLABLOQUE, :PLABLOQUEDATA, :PLACONCORRESP)  ');
    //===================================================================
    _sqlBuscaConta.SQL.Clear;
    _sqlBuscaConta.SQL.Add('SELECT                                   ');
    _sqlBuscaConta.SQL.Add('   PLANO, PLACONTA, IDUSUARIOINCLUSAO,                     ');
    _sqlBuscaConta.SQL.Add('   PLATIPO, PLAGRUPO, PLAGRAU, PLANOME,                    ');
    _sqlBuscaConta.SQL.Add('   PLANOMEOUTLING, PLASUBGR1, PLASUBGR2,                   ');
    _sqlBuscaConta.SQL.Add('   PLASUBGR3, PLASUBGR4, PLAREDUZ, PLACCUST,               ');
    _sqlBuscaConta.SQL.Add('   PLAORDALF, PLATIPCONVGER, PLATIPCONVGEREN1,             ');
    _sqlBuscaConta.SQL.Add('   PLATIPCONVGEREN2, PLATIPCONVOFICIAL, PLAALTERA,         ');
    _sqlBuscaConta.SQL.Add('   PLAINATIVA, PLANATUREZA, PLASUMARIZA, PLASECRETARIA,    ');
    _sqlBuscaConta.SQL.Add('   PLAMOEDAHISTORICA, PLASUBCONTA, PLAMUTACOES,            ');
    _sqlBuscaConta.SQL.Add('   PLACONCILIA, PLABLOQUE, PLABLOQUEDATA, PLACONCORRESP,   ');
    _sqlBuscaConta.SQL.Add('   PLARATEIOAP, IDRATEIOAPEXTRA                            ');
    _sqlBuscaConta.SQL.Add('FROM                                                       ');
    _sqlBuscaConta.SQL.Add('   PLANOCONTA                                              ');
    _sqlBuscaConta.SQL.Add('WHERE                                                      ');
    _sqlBuscaConta.SQL.Add('   (PLACONTA =:PLACONTA) AND                               ');
    _sqlBuscaConta.SQL.Add('   (PLANO =:PLANO)                                          ');
    //===================================================================
     With _sqlBalancete do
      Begin
         SQL.CLear;
         If iPeriodo <> 0 then
         Begin
            SQL.Add('SELECT                                                                   ');
            SQL.Add('   S.PLACONTA, C.PLAGRUPO, C.PLATIPO, S.IDPESSOA, S.PLANO,                           ');
            if bConsoUnidNegoc then
               SQL.Add('   S.UNIDNEGOC,                                                       ');
            if bConsoSubConta then
               SQL.Add('   S.CODSUBCONTA,                                                       ');
            SQL.Add('   DECODE(S.CODCENTROCUSTO, NULL, ''XX'', S.CODCENTROCUSTO) AS CCUSTO,   ');
            SQL.Add('   SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)) AS DEB,    ');
            SQL.Add('   SUM(DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS CRED            ');
            SQL.Add('FROM                                                                     ');
            SQL.Add('   PLANOSALDO S, PLANOCONTA C                                            ');
            SQL.Add('WHERE                                                                    ');
            SQL.Add('   (S.PEREXERCICIO =:PEREXERCICIO) AND                                   ');
            SQL.Add('   (S.PERNUMERO =:PERNUMERO ) AND              ');
            SQL.Add('   (S.IDPESSOA =:IDPESSOA) AND                                           ');
            SQL.Add('   (S.PLANO =:PLANO) AND                                                 ');
            SQL.Add('   (S.PLACONTA = C.PLACONTA) AND                                         ');
            SQL.Add('   (S.PLANO = C.PLANO)                                                   ');
            SQL.Add('GROUP BY                                                                 ');
            SQL.Add('   S.PLACONTA, C.PLAGRUPO, C.PLATIPO, S.IDPESSOA, S.PLANO,                           ');
            if bConsoUnidNegoc then
               SQL.Add('   S.UNIDNEGOC,                                                       ');
            if bConsoSubConta then
               SQL.Add('   S.CODSUBCONTA,                                                       ');
            SQL.Add('   DECODE(S.CODCENTROCUSTO, NULL, ''XX'', S.CODCENTROCUSTO)              ');
            SQL.Add('ORDER BY                                                                 ');
            SQL.Add('   S.PLACONTA, CCUSTO                                                    ');

         End Else
         Begin
            SQL.Add('SELECT                                                                   ');
            SQL.Add('   S.PLACONTA, C.PLAGRUPO, C.PLATIPO, S.IDPESSOA, S.PLANO,                           ');
            if bConsoUnidNegoc then
               SQL.Add('   S.UNIDNEGOC,                                                       ');
            if bConsoSubConta then
               SQL.Add('   S.CODSUBCONTA,                                                       ');
            SQL.Add('   DECODE(S.CODCENTROCUSTO, NULL, ''XX'', S.CODCENTROCUSTO) AS CCUSTO,   ');
            SQL.Add('   SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)) AS DEB,    ');
            SQL.Add('   SUM(DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS CRED            ');
            SQL.Add('FROM                                                                     ');
            SQL.Add('   PLANOSALDO S, PLANOCONTA C                                            ');
            SQL.Add('WHERE                                                                    ');
            SQL.Add('   (S.PEREXERCICIO =:PEREXERCICIO) AND                                   ');
            SQL.Add('   (S.PERNUMERO IS NULL) AND                                             ');
            SQL.Add('   (S.IDPESSOA =:IDPESSOA) AND                                           ');
            SQL.Add('   (S.PLANO =:PLANO) AND                                                 ');
            SQL.Add('   (S.PLACONTA = C.PLACONTA) AND                                         ');
            SQL.Add('   (S.PLANO = C.PLANO)                                                   ');
            SQL.Add('GROUP BY                                                                 ');
            SQL.Add('   S.PLACONTA, C.PLAGRUPO, C.PLATIPO, S.IDPESSOA, S.PLANO,                           ');
            if bConsoUnidNegoc then
               SQL.Add('   S.UNIDNEGOC,                                                       ');

            if bConsoSubConta then
               SQL.Add('   S.CODSUBCONTA,                                                       ');

            SQL.Add('   DECODE(S.CODCENTROCUSTO, NULL, ''XX'', S.CODCENTROCUSTO)              ');
            SQL.Add('ORDER BY                                                                 ');
            SQL.Add('   S.PLACONTA, CCUSTO                                                    ');
         End;
     End;
    //===================================================================

end;

function TCtrlProcessaContab.ZeraSaldoOrcado(dEmpresa:Double;iExercicio,iPeriodo:Integer): Boolean;
begin
   _sqlZeraSaldoOrcado.SQL.Clear;
   _sqlZeraSaldoOrcado.SQL.Add('UPDATE PLANOSALDO                    ');
   _sqlZeraSaldoOrcado.SQL.Add('  SET PLSORCADODEBITO = 0,           ');
   _sqlZeraSaldoOrcado.SQL.Add('  PLSORCADOCREDITO = 0               ');
   _sqlZeraSaldoOrcado.SQL.Add(' WHERE                               ');
   _sqlZeraSaldoOrcado.SQL.Add('    (IDPESSOA=:IDPESSOA) AND         ');
   _sqlZeraSaldoOrcado.SQL.Add('    (PEREXERCICIO=:PEREXERCICIO) AND ');
   _sqlZeraSaldoOrcado.SQL.Add('    (PERNUMERO   =:PERNUMERO)        ');

   _sqlZeraSaldoOrcado.Prepare;
   _sqlZeraSaldoOrcado.ParamByName('IDPESSOA').asFloat       := dEmpresa;
   _sqlZeraSaldoOrcado.ParamByName('PEREXERCICIO').asInteger := iExercicio;
   if iPeriodo <> 0 then
      _sqlZeraSaldoOrcado.ParamByName('PERNUMERO').asInteger := iPeriodo
   else
      _sqlZeraSaldoOrcado.ParamByName('PERNUMERO').Clear;

   result :=  ExecSQL(_sqlZeraSaldoOrcado.SQLChanged,False);


end;

function TCtrlProcessaContab.ExcluiPlanilhasExistentes(dEmpresa: Double;iExercicio,
              iPeriodo,iUsuario,iModulo:Integer;bUsaPPatro:Boolean): Boolean;
begin
      Result := True;

     _sqlPlanilhas.SQL.Clear;
     _sqlPlanilhas.SQL.Add('SELECT PLNCODIGO                     ');
     _sqlPlanilhas.SQL.Add('FROM PLANILHA                        ');
     _sqlPlanilhas.SQL.Add('WHERE (IDPESSOA     = :IDPESSOA)     ');
     _sqlPlanilhas.SQL.Add('  AND (PERNUMERO    = :PERNUMERO)    ');
     _sqlPlanilhas.SQL.Add('  AND (PEREXERCICIO = :PEREXERCICIO) ');

     _sqlPlanilhas.Prepare;
     _sqlPlanilhas.ParamByName('IDPESSOA').AsFloat       := dEmpresa;
     _sqlPlanilhas.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
     _sqlPlanilhas.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
     _cdsPlanilhas.Data := _sqlPlanilhas.Data;

     FMaxProgresso := _cdsPlanilhas.RecordCount;

     _cdsPlanilhas.First;
     while not _cdsPlanilhas.Eof do
     begin
        If not Lancamento.ExcluiLancaContab(iUsuario,_cdsPlanilhas.FieldByName('PLNCODIGO').AsInteger,
                            iModulo, 0,bUsaPPatro, True) Then
        Begin
           Result := False;
           Exit;
        End;
        _cdsPlanilhas.Next;
        FProgresso := FProgresso + 1;
     end;



end;

function TCtrlProcessaContab.ZeraSaldoContaEst(dEmpresa: Double;
  iExercicio, iPeriodo: Integer): Boolean;
begin
    _sqlZeraSaldoEst.SQL.Clear;
    _sqlZeraSaldoEst.SQL.Add('UPDATE PLANOSALDO S                             ');
    _sqlZeraSaldoEst.SQL.Add('SET S.PLSDEBITOCORRENTE = 0,                    ');
    _sqlZeraSaldoEst.SQL.Add('    S.PLSCREDITOCOR = 0                         ');
    _sqlZeraSaldoEst.SQL.Add('WHERE                                           ');
    _sqlZeraSaldoEst.SQL.Add('   (S.IDPESSOA=:IDPESSOA) AND                   ');
    _sqlZeraSaldoEst.SQL.Add('   (S.PEREXERCICIO=:PEREXERCICIO) AND           ');
    _sqlZeraSaldoEst.SQL.Add('   (S.PERNUMERO   =:PERNUMERO) AND              ');
    _sqlZeraSaldoEst.SQL.Add('   EXISTS (SELECT P.PLACONTA                    ');
    _sqlZeraSaldoEst.SQL.Add('           FROM PLANOCONTA  P                   ');
    _sqlZeraSaldoEst.SQL.Add('           WHERE (P.PLAGRUPO = ''E'') AND       ');
    _sqlZeraSaldoEst.SQL.Add('                 (S.PLACONTA = P.PLACONTA) AND  ');
    _sqlZeraSaldoEst.SQL.Add('                 (S.PLANO = P.PLANO))           ');

    _sqlZeraSaldoEst.Prepare;
    _sqlZeraSaldoEst.ParamByName('IDPESSOA').asFloat      := dEmpresa;
    _sqlZeraSaldoEst.ParamByName('PEREXERCICIO').asInteger := iExercicio;

    if iPeriodo <> 0 then
       _sqlZeraSaldoEst.ParamByName('PERNUMERO').asInteger := iPeriodo
    else
       _sqlZeraSaldoEst.ParamByName('PERNUMERO').Clear;

    Result := ExecSQL(_sqlZeraSaldoEst.SQLChanged,False);
end;

function TCtrlProcessaContab.InsereSaldo(dEmpresa, dValCre,
  dValDeb: Double; iPlano, iExercicio, iPeriodo, iSubConta, iUnidNegoc,
  iUsuario: Integer; cTipo, sConta,sCCusto: string): Boolean;
begin
     If iPeriodo = 0 then
     Begin

        With _sqlInsereSaldoAnt do
        Begin
           ParamByName('PLANO').asInteger             := iPlano;
           if sCCusto <> '' then begin
              ParamByName('CODCENTROCUSTO').asString  := sCCusto;
              ParamByName('IDEMPRESA').asFloat        := dEmpresa;
           end else begin
              ParamByName('CODCENTROCUSTO').clear;
              ParamByName('IDEMPRESA').clear;
           end;
           if iUnidNegoc <> 0 then
              ParamByName('UNIDNEGOC').asInteger      := iUnidNegoc
           else
              ParamByName('UNIDNEGOC').clear;
           if iSubConta <> 0 then
              ParamByName('CODSUBCONTA').asInteger    := iSubConta
           else
              ParamByName('CODSUBCONTA').clear;
           ParamByName('IDPLANOSALDO').asInteger      := GetSequence('PLANOSALDO');
           ParamByName('IDUSUARIOINCLUSAO').asInteger := iUsuario;
           ParamByName('IDPESSOA').asFloat            := dEmpresa;
           ParamByName('PEREXERCICIO').asInteger      := iExercicio;
           ParamByName('PLSTIPO').asString            := cTipo;
           ParamByName('PLACONTA').asString           := sConta;
           ParamByName('PLSCREDITOCOR').asFloat       := dValCre;
           ParamByName('PLSDEBITOCORRENTE').asFloat   := dValDeb;

           Result := ExecSQL(_sqlInsereSaldoAnt.SQLChanged,False);
        End;
     End Else
     Begin
        With _sqlInsereSaldoPer do
        Begin
           ParamByName('PLANO').asInteger             := iPlano;
           if sCCusto <> '' then begin
              ParamByName('CODCENTROCUSTO').asString  := sCCusto;
              ParamByName('IDEMPRESA').asFloat        := dEmpresa;
           end else begin
              ParamByName('CODCENTROCUSTO').clear;
              ParamByName('IDEMPRESA').clear;
           end;
           if iUnidNegoc <> 0 then
              ParamByName('UNIDNEGOC').asInteger      := iUnidNegoc
           else
              ParamByName('UNIDNEGOC').clear;
           if iSubConta <> 0 then
              ParamByName('CODSUBCONTA').asInteger    := iSubConta
           else
              ParamByName('CODSUBCONTA').clear;
           ParamByName('IDPLANOSALDO').asInteger      := GetSequence('PLANOSALDO');
           ParamByName('IDUSUARIOINCLUSAO').asInteger := iUsuario;
           ParamByName('IDPESSOA').asFloat            := dEmpresa;
           ParamByName('PEREXERCICIO').asInteger      := iExercicio;
           ParamByName('PERNUMERO').asInteger         := iPeriodo;
           ParamByName('PLSTIPO').asString            := cTipo;
           ParamByName('PLACONTA').asString           := sConta;
           ParamByName('PLSCREDITOCOR').asFloat       := dValCre;
           ParamByName('PLSDEBITOCORRENTE').asFloat   := dValDeb;

           Result :=  ExecSQL(_sqlInsereSaldoPer.SQLChanged,False);
        End;
     End;
end;

function TCtrlProcessaContab.ListaEmpresasSel(dPessoa:Double): OleVariant;
var  sSql :string;
begin
     sSql := 'SELECT E.NOMEEMPRESA, E.TIPOEMPRESA, E.IDPESSOA, '' '' as SEL '+
             'FROM  EMPRESAPROP E '+
             'WHERE ' +
             '  (E.IDPESSOA <> '+ FloatToStr(dPessoa) + ') ' +
             'ORDER BY E.NOMEEMPRESA ';

     Result := GetDataPacket(sSql);
end;

function TCtrlProcessaContab.ProcessaAtuMoeda(dEmpresa: Double;iPlano:integer): Boolean;

var
  _sqlPlanoConta :TCMSqlParams;
  _cdsPlanoConta :TClientDataSet;


begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GeraRateioPorPPrevePatro(dEmpresa,iUsuario,iPlano,
                         iExercicio,iPeriodo,sTipoOper, sDataGera,sTipoFecha,bUsaPPatro,FsMensAPS_Log);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
         FsMensAPS_Log := Connection.AppServer.MessageInfo;

   End Else
   Begin
      FMaxProgresso := 0;
      FProgresso    := 0;
      sMens         := '';
      FsMensAPS_Log := '';
      MessageInfo   := '*';
      iModulo       := 1;
      dPlnCodigo    := 0;
      iSubContaC    := 0;
      iSubContaD    := 0;
      iUnidNegoc    := 0;

      _sqlPlanoConta  := TCMSqlParams.Create(nil);
      _sqlPlanoConta.ControlObject := Self;

      _sqlPlanoConta.SQL.Clear;
      _sqlPlanoConta.SQL.Add('

      _sqlPlanoConta.SQL.Add('SELECT PLACONTA, PLANOME,                    ');
      _sqlPlanoConta.SQL.Add('       PLATIPCONVGER, PLATIPCONVGEREN1,      ');
      _sqlPlanoConta.SQL.Add('       PLATIPCONVGEREN2, PLATIPCONVOFICIAL,  ');
      _sqlPlanoConta.SQL.Add('       PLAMOEDAHISTORICA, PLACONTRAPARTIDA,  ');
      _sqlPlanoConta.SQL.Add('       PLATXJUROS, PLACONTRAPTXJUROS         ');
      _sqlPlanoConta.SQL.Add('FROM PLANOCONTA                              ');
      _sqlPlanoConta.SQL.Add('WHERE (PLANO =:PLANO) AND                    ');
      _sqlPlanoConta.SQL.Add('      (PLATIPO = ''A'') AND                  ');
      _sqlPlanoConta.SQL.Add('      ((PLATXJUROS IS NOT NULL) OR           ');
      _sqlPlanoConta.SQL.Add('      (PLAMOEDAHISTORICA IS NOT NULL))       ');

      _sqlPlanoConta.Prepare;
      _sqlPlanoConta.ParamByName('PLANO').asInteger := iPlano;
      _cdsPlanoConta.Data := _sqlPlanoConta.Data;

      FMaxProgresso := _cdsPlanoConta.RecordCount;
      FProgresso := 0;

      _cdsPlanoConta.First;
      While not _cdsPlanoConta.EOF do
      Begin

         FNomeCampo := 'Gerando Atualização da Conta: '+ _cdsPlanoConta.FieldByName('PLACONTA').AsString;

         Try
            StartTransaction;
            AtualizaMoeda;
            Commit;
         Except
           on E:Exception Do
           Begin
              RollBack;
              Result := False;
              FNomeCampo  := '';
              MessageInfo := 'Problemas na geração da Conta '+_cdsPlanoConta.FieldByName('PLACONTA').AsString;

              sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
              sMensAPS_Log := sMensAPS_Log + '**********************************' + chr(13);

              FProgresso := 0;
              MessageInfo := sMens+' '+E.Message;
           End
         End;

         FProgresso := FProgresso + 1;
         _cdsPlanoConta.Next;
      End;


  End;

end;

end.


