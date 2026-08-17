unit  uCtrlProcessaContab;

(*==============================================================================
Analista : Alex Pereira
Data     : 05-07/01/04
Pendência: 14451 Nova estrutura para segregação

Métodos atualizados:
  Utiliza Estrutura   Rotina
       Não            EncerraContasDeResultado
       Sim            ProcessaLancamento
       Não            ImportaSAF
       Não (de/para)  AlteraPlanoConta
       Não?  ivete         GeraRateioPorPrograma
       Não?  ivete         GeraRateioPorPPrevePatro
       Não            ApuraResultadoPer
       Não            LancaMeiaNoite

Pendentes: ImportaLancamentos    // RESOLVIDO 11/02/04 - verificar layout gerente contas
           ImportaPlanilhaExcel  // RESOLVIDO 11/02/04
           ProcessaAtuMoeda

Solução  : Criar a estrutura IDSEGREGACRITER e DATASEGREGACRITER
           no lançamento contábil.

Métodos Removidos: segundo orientação Darcy
         ProcessaDepositoVHF,  Contabiliza,
         ListHotel,            ImportaFidelio
         ImportaDadosRM
         ImportaFolhaDinamica
         ImportaSRH
         GeraLancaConsolidado,  MontaSQLConsolidado,  ProcuraSaldo

Data     : 05-07/01/04
Solução  : 14451 - Ajustando o método:
           ImportaPlanilhaExcel - acatando nova segregação
           ImportaLancamentos   - estou dependendo da resposta da REFER, CBS e
           FCRT, para corrigir o layout x programa 

==============================================================================*)
{------------------------------------------------------------------------------
  Desenvolvedor:  Alex Pereira
  Data         : 05/12/03
  Pendência    : 14451 - Nova segregação de recursos
  Solução      : Limpar os métodos da segregação por atividade projeto, utilizada
                 até então apenas pela CBS.
                 Métodos removidos
                 ExisteRateio,             RemoveRateioPorPeriodo,
                 GeraRateioPorPeriodo,     GeraLancaRateioAtivProj,
                 GeraLancaRateioAdm
------------------------------------------------------------------------------}
{
  01/08/03 by Alex - Pend 14564
  Na comparação do fonte 3 camadas com 2 camadas (conforme sugestão da Rosane),
  foi encontrada uma divergência na ApuraResultadoPer

  04/08/03 by Alex - Pend 14564
  Na comparação do fonte 3 camadas com 2 camadas (conforme sugestão da Rosane),
  foi encontrada uma divergência na LancaMeiaNoite

  05/08/03 by Alex - Pend 14564
  - Criado o método uCtrlPlanoSaldo.RetornaSaldoContaExerc a ser utilizado no
  método ApuraResultadoPer e futuramente no método LancaMeiaNoite
  - Substituidos os objetos: TcmSqlParams e TClientDataSet por TCMClientDataSet
  no método ApuraResultadoPer
  - Se a conta de Fundo de Cobertura e Oscilação de Riscos não for parametrizado
  o valor do superávit é lançado apenas em reserva de contingência. Fazer o mesmo
  para LancaMeiaNoite. Ver com CBS, ainda tenho dúvidas.
}

interface

Uses DB, uDataBase, uCmControlObject, dbclient, sysutils,Provider,uMidasUtil,
     uCtrlGeral, uCtrlContab, ComCtrls, Classes,uCtrlPeriodo, uCtrlContaContabil,mask,
     uFuncaoGeral,uCtrlLancamento,uCtrlHistoContab,uCMSqlParams,uCtrlPlanilha,Math,
     uCtrlSubConta,uDiasUteis, uCtrlListTerceiros, uCtrlPlanoDePara,
     uCMTypes,uCtrlPadroes,ComObj,{05/08/03 by Alex} uCtrlPlanoSaldo, uCMClientDataSet;


Type
  { tcSoSintetica => Somente as contas sintéticas
    tcSoAnalitica => Somente as contas analíticas
    tcAmbas => Ambos os tipos (Analíticas e Sintéticas)
  }
  TTipoConta  = (tcSoSintetica, tcSoAnalitica, tcAmbas);

  TCtrlProcessaContab = class(TCmControlObject)

  Protected
      procedure AfterInitialize;override;
      procedure OnCreateAppServer;override;

  private
    Geral          : TCtrlGeral;
    Padroes        : TCtrlPadroes;
    Periodo        : TCtrlPeriodo;
    Lancamento     : TCtrlLancamento;
    FuncaoGeral    : TFuncaoGeral;
    DiasUteis      : TDiasUteis;
    SubConta       : TCtrlSubConta;
    Planilha       : TCtrlPlanilha;
    HistoContab    : TCtrlHistoContab;
    ListTerceiros  : TCtrlListTerceiros;
    ContaContabil  : TCtrlContaContabil;
    PlanoDePara    : TCtrlPlanoDePara;
    Contab         : TCtrlContab;
    _sql           : TCmSqlParams;

    // 05/08/03 - by Alex
    CtrlPlanoSaldo : TCtrlPlanoSaldo;

    //==para geracao de lancamento consolidado ===
    _sqlZeraSaldoOrcado  :TCMSqlParams;
    _sqlZeraSaldoEst     :TCMSqlParams;
    _sqlPlanilhas        :TCMSqlParams;
    _sqlPlano            :TCMSqlParams;
    _sqlBalancete        :TCMSqlParams;
    _sqlBuscaConta       :TCMSqlParams;
    _sqlBuscaSubContaCon :TCMSqlParams;
    _sqlBuscaSubContaNome:TCMSqlParams;
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
    // Alex 06/01/04 _sqlProcuraSaldo     :TCMSqlParams;

    _sqlBuscaContaxSC    :TCMSqlParams;
    _sqlInsereContaxSC   :TCMSqlParams;

    _cdsPlanilhas         :TClientDataSet;
    _cdsPlano             :TClientDataSet;
    _cdsBalancete         :TClientDataSet;
    _cdsBuscaConta        :TClientDataSet;
    _cdsBuscaSubContaCon  :TClientDataSet;
    _cdsBuscaSubContaNome :TClientDataSet;
    _cdsBuscaCCusto       :TClientDataSet;
    _cdsBuscaContaxCC     :TClientDataSet;
    _cdsBuscaContaxSC     :TClientDataSet;
    // 06/01/04 _cdsProcuraSaldo      :TClientDataSet;
    _cdsBuscaUnNegBal     :TClientDataSet;
    _cdsBuscaUnNegCon     :TClientDataSet;
    _cdsMTS               :TClientDataSet;
    //===================================
    FContaDeb : string;
    FNomeTabela : string;
    FParteproc : string;
    FNomeRateio : string;
    FTotReg     :Double;
    FNreg       :Double;
    FNomeCampo  : string;
    FNomeConta  : string;
    FStatusProc : string;
    FTipoOper : string;
    FsMensAPS : string;
    FCodDC :string;
    FError :Boolean;
    FContaLinhaTexto :Integer;
    FLinhaTexto :string;
    FsMensAdd :string;
    FsMensAPS_Log :String;
    FLabelMensTela :String;
    FProgresso: Integer;
    FProgressoOutro: Integer;
    FMaxProgresso: Integer;
    FMaxProgressoOutro: Integer;
    FContaMostra: String;
    FcdsPlanilha: TClientDataSet;
    FcdsLancamento: TClientDataSet;
    FcdsVerificaBloqueados: TClientDataSet;
    FcdsDiariasDBF        : TClientDataSet;
    FcdsLancamentosDBF    : TClientDataSet;
    FcdsEmpresasSel: TClientDataSet;
    FcdsPlanilhaORC: TClientDataSet;
    FRetornaPlnPlanil: Double;
    FRetornaPlnCodigo: Double;
    FRetornaPlnNumLan: Integer;
    FStrlMens :TStringList;
    procedure SetcdsPlanilha(const Value: TClientDataSet);
    procedure SetcdsLancamento(const Value: TClientDataSet);
    procedure SetcdsEmpreasSel(const Value: TClientDataSet);
    procedure SetcdsVerificaBloqueados(const Value: TClientDataSet);
    procedure SetcdsDiariasDBF(const Value: TClientDataSet);
    procedure SetcdsLancamentosDBF(const Value: TClientDataSet);
    procedure SetcdsPlanilhaORC(const Value: TClientDataSet);
    procedure Set_cdsMts(const Value: TClientDataSet);

  public
      Property StrlMens :TStringList read FStrlMens write FStrlMens;
      Property MaxProgresso : Integer read FMaxProgresso;
      Property Progresso: Integer read FProgresso;
      Property RetornaPlnCodigo : Double read FRetornaPlnCodigo;
      Property LabelMensTela : String read FLabelMensTela;
      Property ProgressoOutro : Integer read FProgressoOutro;
      Property MaxProgressoOutro : Integer read FMaxProgressoOutro;

      Property RetornaPlnPlanil : Double read FRetornaPlnPlanil;
      Property ContaLinhaTexto : Integer read FContaLinhaTexto write FContaLinhaTexto;
      Property LinhaTexto : string read FLinhaTexto write FLinhaTexto;
      Property NomeTabela : string read FNomeTabela write FNomeTabela;

      Property ParteProc : string read FParteProc write FParteProc;
      Property Totreg : Double read FTotReg write FTotReg;
      Property Nreg : Double read FNreg write FNreg;

      Property NomeConta : string read FNomeConta write FNomeConta;
      Property StatusProc : string read FStatusProc write FStatusProc;
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

      Property cdsMts : TClientDataSet read _cdsMts write Set_cdsMts;
      Property cdsPlanilhaORC : TClientDataSet read FcdsPlanilhaORC write SetcdsPlanilhaORC;
      Property cdsVerificaBloqueados : TClientDataSet read FcdsVerificaBloqueados write SetcdsVerificaBloqueados;

      Property cdsDiariasDBF : TClientDataSet read FcdsDiariasDBF write SetcdsDiariasDBF;
      Property cdsLancamentosDBF : TClientDataSet read FcdsLancamentosDBF write SetcdsLancamentosDBF;

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
      Function TestaConsistenciaLanc(IdEmpresa,IdModulo,IdUsuario : Double; iExercicio, iPeriodo : Integer) : Boolean;
     {Esta function tem como objetivo arredondar o valor dos lançamentos para 2 casas decimais}
      Function ArredondaValores(dEmpresa,dModulo,dUsuario:Double) : Boolean;
     {Esta function tem como objetivo alterar o campo PLSTIPO da tabela PLANOSALDO
            para ficar igual ao campo PLATIPO da tabela PLANOCONTA}
      Function AcertaTipoSaldopeloTipoConta( IdEmpresa,IdModulo,IdUsuario : Double; iExercicio, iPeriodo : Integer) : Boolean;
     {Esta function tem como objetivo deletar a tabela PLANOSALDO}
      Function DeletaSaldoContas(IdEmpresa : Double; iExercicio, iPeriodo : Integer; bDeletaEstatistica,bDeletaOrcado : Boolean; TipoConta : TTipoConta; TipoPeriodo : TTipoPeriodo ) : Boolean;
     {Esta function tem como objetivo deletar a tabela PLANOSALDO}
      Function ZeraSaldoContas(IdEmpresa : Double; iExercicio, iPeriodo : Integer; bZeraEstatistica,bZeraOrcado : Boolean; TipoConta : TTipoConta; TipoPeriodo : TTipoPeriodo) : Boolean;
     {Esta function efetua o processo de atualizar o saldo das contas pelos lançamentos}
      Function ProcessaSaldoAnalitica(IdEmpresa, IdModulo, iUsuario: Double;iExercicio, iPeriodo: Integer; bUsaPlanoPatro : Boolean): Boolean;
     {Esta function efetua o processo de atualizar o saldo das contas sinteticas (Chamada da tela)}
      Function ProcessaSaldoSintetica(IdEmpresa,IdModulo, iUsuario: Double;iExercicio, iPeriodo: Integer; bUsaPlanoPatro : Boolean ; TipoPeriodo : TTipoPeriodo): Boolean;
     {Esta function efetua o processo de integração por data (Chamada da Tela)}
      Function ProcessaIntegraData(IdEmpresa,IdModulo,iUsuario: Double;iExercicio, iPeriodo: Integer; bUsaPlanoPatro, bBloqueia : Boolean; sData, sModulos : String): Boolean;
     {Esta function efetua o processo de integração por planilha (Chamada da Tela)}
      Function ProcessaIntegraPlanilha(IdModulo,iUsuario, IdEmpresa : Double; bUsaPlanoPatro:Boolean): Boolean;
     {Esta function efetua a inclusão/alteração do lançamento a partir da tela de lançamento contábil (Chamada da Tela)}
      Function ProcessaLancamento(idEmpresa, iModuloOrigem, liUsuario : Double; bUsaPlanoPatro: Boolean;
                        iPlnCodigo: Double; sPlnDatDia: String): Boolean;
     {Esta function efetua a exclusão do lançamento a partir da tela de lançamento contábil (Chamada da Tela)}
      Function ProcessaExcluiLanc(idEmpresa,iPlanilha, iModuloOrigem, liUsuario : Double; iNumLanc: LongInt; bUsaPlanoPatro, bExcluiPlanilha: Boolean): Boolean;
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
      Function ImportaPlanoContas(ArquivoTexto:TStringList;sMascara,sCaminho:string;iPlano:Integer; dEmpresa,dModulo,dUsuario: double): Boolean;
     {Esta função tem a finalidade de importar dados de saldos anteriores}
      Function ImportaSaldoAnterior(ArquivoTexto: TStringList; sExercicio,sCaminho,sMascara: string;
                                   iPlano,iUsuario:Integer;dEmpresa,dModulo: double): Boolean;

     {Esta função tem a finalidade de importar conta correspondente}
      Function ImportaContaCorresp(ArquivoTexto: TStringList; sCaminho: string;
                                       iPlano: Integer;dEmpresa,dModulo,dUsuario:Double): Boolean;

     {Esta função tem a finalidade de importar SAF}
     Function ImportaSAF(ArquivoTexto: TStringList;sTipoOper,sCaminho: string;
                         iModulo,iUsuario,iPlano,iPlanoPrev,iPlanoPatro,
                         iNumCommit,iContMax: Integer; dEmpresa: Double;bUsaPPatro,
                         bTestaConta:Boolean): Boolean;

     {Esta função Importação - Lancamento}
     Function ImportaLancamentos(ArquivoTexto:TStringList;dEmpresa:Double;iPlano,iUsuario,
                                 iModulo,iNumCommit:Integer;sTipoOper, sCaminho:string;
                                 bTestaConta,bHistCheked,bUsaPPatro:Boolean) : Boolean;

     {Esta função tem o objetivo de importar planilhas excel}
     Function ImportaPlanilhaExcel(ArquivoTexto:TStringList;dEmpresa:Double;iPlano,iModulo,iUsuario:Integer;
                                   sDataLanc,sTipoOper:string;bUsaPPatro:Boolean) :Boolean;

     {Esta função tem o objetivo de importar valores orçados de uma planilha Excel}
     Function ImportaValoresOrcadoExcel(ArquivoTexto:TStringList;dEmpresa, dUsuario,dPlanoPrev, dPlanoPatro,dPlano: Double; iExercicio: Integer; bUsaPPatro: Boolean): Boolean;

      {Esta função altera o plano contabil}
      Function AlteraPlanoConta(dEmpresa,dUsuario: Double;sMascara,sDataRef:string;iPlano,iPlanoVigente,iExercicio: Integer;bMesmoPlano,
                                 bMesmosCCSC, bGeraLancSaldoAnt, bSoSaldoAnt:Boolean): Boolean;


      {Esta função gera lancamento de rateios}
       Function GeraRateioPorPrograma(dEmpresa,dModulo: Double;iUsuario, iPlano, iExercicio,
                iPeriodo: Integer; sTipoOper,sDataGera: string; bUsaPPatro: Boolean): Boolean;

      {Esta função gera lancamento de rateios}
       Function GeraRateioPorPPrevePatro(dEmpresa: Double;iUsuario, iPlano, iExercicio,
                iPeriodo: Integer; sTipoOper,sDataGera,sTipoFecha: string; bUsaPPatro: Boolean): Boolean;

      {Esta função altera o saldo orcado já existente}
       Function AlteraSaldoOrc(iSaldo:integer; dValOrcDeb, dValOrcCre: Double) :Boolean;

      {Esta função inserir o saldo orcado }
       Function InsereSaldoOrc(dEmpresa:Double;sConta, sCCusto, cTipo: string;
                         dValOrcDeb, dValOrcCre: Double;iExercicio,iPeriodo,iUsuario,iPlano,iUnidNegoc, iSubConta: Integer): Boolean;

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
       Function ListaEmpConsolidado(dPessoa:Double) :OleVariant;

      {Esta função tem o objetivo de processar atualizaçao de moeda}
       Function ProcessaAtuMoeda(dEmpresa,dModulo: Double;iUsuario,iPlano,
         iExercicio,iPeriodo:integer; sHistorico,sCodHist,sTipoOper,sTipoFecha,
         sDataLanc,sPerdaGanho:string;dtDataIni,dtDataFim:TDateTime;bUsaPPatro:Boolean): Boolean;


      {Esta função verifica planilhas em periodos bloqueados}
       Function VerificaBloqueados(dEmpresa:Double;iUsuario:Integer;
                                      bUsaPPatro:Boolean): Boolean;

      {Esta funcao tem o objetivo de apurar o resultado por periodo}
       Function ApuraResultadoPer(dModulo,dEmpresa: Double;iUsuario,iPlano,iExercicio,
                    iPeriodo:Integer;sProgPrev,sCodHist,sDefTec,sResCont,
                    sFormDefTec,sRevSupTecn,sFormSupTec,sFdoCobOscRisc,sResMat,
                    sRevDefTec,sDataLanc,sTipoOper:string;bUsaPPatro:Boolean): Boolean;

      {Esta funcao tem o objetivo de Gerar Arquivo SIPC-CAP}
       Function GeraArquivo_SIPC(dEmpresa:Double;iPlano,iExercicio,
                                iPeriodo, iPlanoPrev:integer;sPlano,sEntidade,
                                sCaminho, sTipoBalancete :string): Boolean;


      {Esta funcao tem o objetivo de Apurar o resultado do exercicio}
       Function LancaMeiaNoite(dEmpresa:Double;iUsuario,iPlano,iExercicio,iPeriodo:Integer;
                    sProgPrev,sCodHist,sDefTec,sDefTecA,sResCont,sResContA,sFormDefTec,sRevSupTecn,
                    sFormSupTec,sFdoCobOscRisc,sFdoCobOscRiscA,sResMat,sRevDefTec,
                    sDataLanc:string;bUsaPPatro:Boolean):Boolean;

      {Esta funcao tem o objetivo de gerar saldo calculado}
       Function GeraSaldoCalculado(dEmpresa,dModulo,dUsuario: Double; iExercicio,
                  iPeriodo:Integer;sMascara :string; bSubConta, bCCusto: Boolean): Boolean;

     {Esta funcao tem o objetivo listar planilhas em periodos bloqueados }
      Function ListaBloqueados(dEmpresa :Double;iExecAtual:Integer) :OleVariant;

     {Esta função Lista os saldos das contas de acordo com os parametros passados}
      Function ListaSaldoContas(dEmpresa:Double;iPlano,iExercicio,iPeriodo,iPPatro,
                  iPPrev:Integer;sData,sContaIni,sContaFim:String):OleVariant;

     {Esta função tem o objetovo de listar os hoteis}
      Function ListaHoteis(dEmpresa:Double) :OleVariant;

     {Esta função tem o objetivo de Atualizar códigos reduzidos}
      Function AtuCodigoReduzido(dEmpresa,dModulo,dUsuario: Double;iPlano,rgRenumera:integer) :Boolean;

     {Esta função tem o objetivo de Acertar a numeracao da planilha}
      Function AcertaNumPlanilha(dEmpresa,dModulo,dUsuario: Double;iPlano,iExercicio,iPeriodo:integer;sPacDiaMes:string) :Boolean;

     {Esta função faz uma chamada na função estorna planilha}
      Function FazEstorno(dUsuario,dCodPlanilha,dModulo,dEmpresa:Double;
                                     bUsaPPatro:Boolean;sDataEstorno:string) :Boolean;

    {Esta função atualiza a tabela paramcontab com o codigo da planilha que deu diferenca}
    Function AtualizaParamContab(dEmpresa,dPlnCodigo: Double):Boolean;

    {Esta função é usada somente para testar a aplicação Mts}
    Function ListaLanc(dCodPla:Double):OleVariant;

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
             Raise Exception.Create('Erro ao Tentar Deletar Plano Saldos.');
         //-------------------------------------------------------------
         Commit;
 
      Except
         on E:Exception Do
         Begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
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
            Raise Exception.Create(sMens);
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
            Raise Exception.Create(sMens);
          End;
         //-----------------------------------------------------------------------

         //*** Le o arquivo de saldo ***
         _cdsSaldo.First;
         While not _cdsSaldo.EOF do
         Begin
           MessageInfo := '*';
           FProgresso := FProgresso + 1;
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
              Raise Exception.Create(sMens);
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
              Raise Exception.Create(sMens);
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
              Raise Exception.Create(sMens);
            End;
         End;
         Commit;
         _cdsSaldo.free;
      Except
        On E:Exception Do
        Begin
            _cdsSaldo.free;
           Result := False;
           Rollback;
           MessageInfo := E.Message;
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
            Raise Exception.Create(sMens);
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
                                                  bJunta,bUsaPPatro,
                                                  // 05/01/04 Alex 14451 nova estrutura para segregação
                                                  -1, -1) Then

              Begin
                sMens  := Lancamento.MessageInfo;
                Raise Exception.Create(sMens);
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
                                                  bJunta,bUsaPPatro,
                                                  // 05/01/04 Alex 14451 nova estrutura para segregação
                                                  -1, -1) Then

              Begin
                sMens  := Lancamento.MessageInfo;
                Raise Exception.Create(sMens);
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
                                                  bJunta,bUsaPPatro,
                                                  // 05/01/04 Alex 14451 nova estrutura para segregação
                                                  -1, -1) Then

              Begin
                sMens  := Lancamento.MessageInfo;
                Raise Exception.Create(sMens);
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
                                                  bJunta,bUsaPPatro,
                                                  // 05/01/04 Alex 14451 nova estrutura para segregação
                                                  -1, -1) Then

              Begin
                sMens  := Lancamento.MessageInfo;
                Raise Exception.Create(sMens);
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
                                                  bJunta,bUsaPPatro,
                                                  // 05/01/04 Alex 14451 nova estrutura para segregação
                                                  -1, -1) Then

              Begin
                sMens  := Lancamento.MessageInfo;
                Raise Exception.Create(sMens);
              End Else
              Begin
                dPlnCodigo := Lancamento.RetornoPlnCodigo;
              End;

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
            Raise Exception.Create(sMens);
          End;

          Commit;
          CdsLancamento.Free;

      Except
         on E:Exception Do
         Begin
            RollBack;
            Result := False;
            CdsLancamento.Free;
            MessageInfo := E.Message;
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

              If iPeriodo > 0 Then
                 ParamByName('PERNUMERO').asInteger := iPeriodo;

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
  FuncaoGeral    := TFuncaoGeral.Create;
  DiasUteis      := TDiasUteis.Create;
  SubConta       := TCtrlSubConta.Create;
  HistoContab    := TCtrlHistoContab.Create;
  ContaContabil  := TCtrlContaContabil.Create;
  Planilha       := TCtrlPlanilha.Create;
  ListTerceiros  := TCtrlListTerceiros.Create;
  Contab         := TCtrlContab.Create;
  PlanoDePara    := TCtrlPlanoDePara.Create;
  Geral          := TCtrlGeral.Create;
  Padroes        := TCtrlPadroes.Create;

  // 05/08/03 - by Alex
  CtrlPlanoSaldo := TCtrlPlanoSaldo.Create;

  //
  FcdsPlanilha   := TClientDataSet.Create(nil);
  FcdsLancamento := TClientDataSet.Create(nil);
  _cdsMTS        := TClientDataSet.Create(nil);


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

  _sqlBuscaSubContaNome:= TCMSqlParams.Create(nil);
  _sqlBuscaSubContaNome.ControlObject := Self;

  _sqlBuscaContaxCC := TCMSqlParams.Create(nil);
  _sqlBuscaContaxCC.ControlObject := Self;

  _sqlBuscaContaxSC := TCMSqlParams.Create(nil);
  _sqlBuscaContaxSC.ControlObject := Self;

  _sqlInsereConta := TCMSqlParams.Create(nil);
  _sqlInsereConta.ControlObject := Self;

  _sqlInsereContaxCC := TCMSqlParams.Create(nil);
  _sqlInsereContaxCC.ControlObject := Self;

  _sqlInsereContaxSC := TCMSqlParams.Create(nil);
  _sqlInsereContaxSC.ControlObject := Self;

  _sqlPlano  := TCMSqlParams.Create(nil);
  _sqlPlano.ControlObject := Self;

  _sqlPlanilhas := TCMSqlParams.Create(nil);
  _sqlPlanilhas.ControlObject := Self;

  _sqlZeraSaldoEst  := TCMSqlParams.Create(nil);
  _sqlZeraSaldoEst.ControlObject := Self;

  // Alex 06/01/04 _sqlProcuraSaldo  := TCMSqlParams.Create(nil);
  // Alex 06/01/04 _sqlProcuraSaldo.ControlObject := Self;

  _sqlBuscaConta  := TCMSqlParams.Create(nil);
  _sqlBuscaConta.ControlObject := Self;

  _sqlBalancete  := TCMSqlParams.Create(nil);
  _sqlBalancete.ControlObject := Self;

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
  _cdsBuscaContaxSC  := TClientDataSet.Create(nil);
  // Alex 06/01/04 _cdsProcuraSaldo   := TClientDataSet.Create(nil);
  _cdsBuscaSubContaCon  := TClientDataSet.Create(nil);
  _cdsBuscaSubContaNome := TClientDataSet.Create(nil);


end;

destructor TCtrlProcessaContab.Destroy;
begin
  inherited;
  If IsAppServer Then
  Begin
    FreeCds([FcdsEmpresasSel,FcdsVerificaBloqueados,FcdsLancamentosDBF,FcdsDiariasDBF]);

  End;
  //
  //=== geracao de lancamentos consolidados ===
  _sqlZeraSaldoOrcado.free;
  _sqlInsereUnidNegoc.free;
  _sqlBuscaUnNegBal.free;
  _sqlBuscaUnNegCon.free;
  _sqlInsereSubConta.free;
  _sqlInsereSaldoAnt.free;
  _sqlInsereSaldoPer.free;
  _sqlBuscaSubContaCon.free;
  _sqlBuscaSubContaNome.free;
  _sqlBuscaContaxCC.free;
  _sqlBuscaContaxSC.free;
  _sqlInsereConta.free;
  _sqlInsereContaxCC.free;
  _sqlInsereContaxSC.free;
  _sqlPlano.free;
  _sqlPlanilhas.free;
  _sqlZeraSaldoEst.free;
  // Alex 06/01/04 _sqlProcuraSaldo.free;
  _sqlBuscaConta.free;
  _sqlBalancete.free;
  _sqlBuscaCCusto.free;
  _sqlInsereCCusto.free;


  FreeCds([FcdsLancamento,FcdsPlanilha, _cdsPlano,_cdsBalancete, _cdsPlanilhas, _cdsMTS,
           _cdsBuscaConta,_cdsBuscaCCusto,_cdsBuscaUnNegBal,_cdsBuscaUnNegCon,
           _cdsBuscaContaxCC, _cdsBuscaContaxSC,{06/01/04 Alex  _cdsProcuraSaldo,}
           _cdsBuscaSubContaCon,_cdsBuscaSubContaNome]);

  ListTerceiros.free;
  Periodo.Free;
  Lancamento.Free;
  FuncaoGeral.Free;
  DiasUteis.Free;
  PlanoDePara.free;
  SubConta.free;
  ContaContabil.Free;
  Contab.Free;
  Planilha.Free;
  HistoContab.Free;
  Geral.Free;
  Padroes.free;
  _sql.Free;

  // 05/08/03 by Alex
  CtrlPlanoSaldo.Free;

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
             MessageInfo := 'Os totais devedores e credores da planilha ' + inttostr(_cds.FieldByName('PLNPLANIL').AsInteger) + ' do dia ' + _cds.FieldByName('PLNDATDIA').AsString + ' não estão batendo';

             FProgresso  := FProgresso + 1;

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
            MessageInfo := 'A planilha ' + inttostr(_Cds.FieldByName('PLNPLANIL').AsInteger) + ' do dia ' + _Cds.FieldByName('PLNDATDIA').AsString + ' do Sistema de ' + _Cds.FieldByName('NOMEMODULO').AsString + ' não foi integrada';
            FProgresso := FProgresso + 1;
            Result := False;
            _Cds.Next;
         end;
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
                 MessageInfo := 'Não foi feita a devida atualização em outra moeda na planilha' + inttostr(_Cds.FieldByName('PLNPLANIL').AsInteger) + ' do dia ' + _Cds.FieldByName('PLNDATDIA').AsString;
                 FProgresso := FProgresso + 1;
                 Result := False;
                 _Cds.Next;
              end;
           end else begin
              Result := False;
           end;
        end else begin
           if not AtualizaOutraMoedaPadrao( IdEmpresa, iExercicio, iPeriodo,TipoPeriodo ) then
              Result := False
           else
              Result := True;
      end;
   end;
end;

function TCtrlProcessaContab.TestaSaldoAnalitica(IdEmpresa: Double; iExercicio,
  iPeriodo: Integer): Boolean;
begin
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
        FMaxProgresso := 1;
        if not _cds.IsEmpty then begin
           MessageInfo := 'Existe inconsistência entre Saldos e Lançamentos. Faça Verificação de Lançamentos, Atualização de Analítica e Sintética do Período '+IntToStr(iPeriodo);
           Result := False;
           FProgresso := FProgresso + 1;
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

           FProgresso    := 0;
           FMaxProgresso := _cds.RecordCount;

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
              MessageInfo:='*';

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
              FProgresso := FProgresso + 1;
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

function TCtrlProcessaContab.TestaConsistenciaLanc(IdEmpresa,IdModulo,IdUsuario: Double;
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
     Result := Connection.AppServer.TestaConsistenciaLanc(IdEmpresa,IdModulo,IdUsuario,iExercicio,iPeriodo);

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
        //------------------------------------------
        // Grava do log
        //------------------------------------------

         FProgresso    := 0;
         FMaxProgresso := 0;
         bOK           := True;
         bMsg          := False;
         _Cds.Data := Lancamento.SelecionaLancamentos(0,idEmpresa, iExercicio, iPeriodo, tpSoPeriodo,'','','','',
                              teAmbos,tomAmbos,tolPlnCodigo,tsSemSoma,False);
         If not _Cds.IsEmpty then
         begin
            FMaxProgresso := _Cds.RecordCount;

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
                        if not ContaContabil.TestaContaContabilProc(_Cds.FieldByName('PLANO').AsFloat, idEmpresa,iPeriodo,iExercicio,
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

                  If not Padroes.GravaLogOperacoes(IdEmpresa,IdModulo,IdUsuario, 'Verifica Lançamentos - Testa Consistencia dos Lançamentos',False) then
                     Raise Exception.Create( Padroes.MessageInfo );

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

function TCtrlProcessaContab.ArredondaValores(dEmpresa,dModulo,dUsuario:Double): Boolean;
var
  sSql :string;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.ArredondaValores(dEmpresa,dModulo,dUsuario);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      FProgresso    := 0;
      FMaxProgresso := 0;
      try
         StartTransaction;

         sSql := 'UPDATE LANCAMENTO SET ' +
                 ' LACVALOR = ROUND(LACVALOR,2)' +
                 ',LACVALOFICIAL = ROUND(LACVALOFICIAL,2) '+
                 ',LACVALGERENCIAL = ROUND(LACVALGERENCIAL,2) ' +
                 ',LACVALGEREN1 = ROUND(LACVALGEREN1,2) ' +
                 ',LACVALGEREN2 = ROUND(LACVALGEREN2,2) ' +
                 ',LACVALHIST = ROUND(LACVALHIST,2) ';

         Result := ExecSQL(sSql);

         If not Padroes.GravaLogOperacoes(dEmpresa,dModulo,dUsuario, 'Verifica Lançamentos - Arredondamento',False) then
            Raise Exception.Create( Padroes.MessageInfo );

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

function TCtrlProcessaContab.AcertaTipoSaldopeloTipoConta(IdEmpresa,IdModulo,IdUsuario: Double;
   iExercicio, iPeriodo: Integer): Boolean;
var
  sSql :string;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AcertaTipoSaldopeloTipoConta(IdEmpresa,IdModulo,IdUsuario,
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
                     If not Padroes.GravaLogOperacoes(IdEmpresa,IdModulo,IdUsuario, 'Verifica Lançamentos - Tipo de Conta',False) then
                        Raise Exception.Create( Padroes.MessageInfo );

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
      //
      Result := True;
      if TipoPeriodo <> tpSoAnterior then begin
         if not Periodo.TestaPeriodoExiste(IdEmpresa, iPeriodo, iExercicio) then begin
            MessageInfo := Periodo.MessageInfo;
            Result := False;
         end else begin
            if not Contab.SelecionaPlanoDataProc(IdEmpresa, DateToStr(Periodo.DataIniPeriodo)) then begin
               MessageInfo := Contab.MessageInfo;
               Result := False;
            end;
         end;
      end;
      if Result then begin
         With TCMSqlParams.Create(nil) Do begin
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
                  if TipoPeriodo <> tpSoAnterior then
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

function TCtrlProcessaContab.ProcessaSaldoAnalitica(IdEmpresa, IdModulo,iUsuario: Double;
  iExercicio, iPeriodo: Integer; bUsaPlanoPatro : Boolean): Boolean;
var sMens : String;
    CdsLancamento : TClientDataSet;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.ProcessaSaldoAnalitica(IdEmpresa,IdModulo,iUsuario, iExercicio,
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

         MessageInfo := 'Zerando o saldo das contas';
         if not ZeraSaldoContas(IdEmpresa,iExercicio,iPeriodo,False,False,tcAmbas,tpSoPeriodo) then begin
            sMens := MessageInfo;
            Raise Exception.Create(sMens);
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
                  Raise Exception.Create(sMens);
               end;
               CdsLancamento.Next;
            end;
         end else begin
            sMens := 'Não existe lançamentos para este período';
            Raise Exception.Create(sMens);
         end;
         If not Padroes.GravaLogOperacoes(IdEmpresa,IdModulo,iUsuario, 'Atualização de Analítica - '+IntToStr(iExercicio)+'/'+IntToStr(iPeriodo),False) then
            Raise Exception.Create( Padroes.MessageInfo );
         Commit;
         CdsLancamento.Free;
      except
         On E:Exception Do
         Begin
            CdsLancamento.Free;
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         End;
      End;
   end;
end;


function TCtrlProcessaContab.ProcessaSaldoSintetica(IdEmpresa,IdModulo,
  iUsuario: Double; iExercicio, iPeriodo: Integer;
  bUsaPlanoPatro : Boolean; TipoPeriodo : TTipoPeriodo): Boolean;
var
    sqlProcessaSaldo : TCMSqlParams;
    cdsProcessaSaldo : TClientDataSet;
    sMens, sConta,sNumero : String;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.ProcessaSaldoSintetica(IdEmpresa,idModulo,iUsuario, iExercicio,
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
            MessageInfo := 'Zerando o saldo das contas';
            if not ZeraSaldoContas(IdEmpresa,iExercicio,iPeriodo,true,true,tcSoSintetica,TipoPeriodo) then
            begin
               sMens := MessageInfo;
               Raise Exception.Create(sMens);
            end;
            if not ContaContabil.BuscaMascaraConta(Contab.PlanoData) then begin
               sMens := ContaContabil.MessageInfo;
               Raise Exception.Create(sMens);
            end;
            _Cds.Data := ContaContabil.SelecionaContas(Contab.PlanoData, tcSoSinteticaC, true);
            MessageInfo := 'Atualizando o saldo das contas sintéticas';
            _Cds.First;


               While not _Cds.Eof do
               begin
                   Try
                     StartTransaction;

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
                           Raise Exception.Create(sMens);
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
                                              bUsaPlanoPatro) then
                        begin
                           sMens := Lancamento.MessageInfo;
                           Raise Exception.Create(sMens);
                        end;
                        cdsProcessaSaldo.Next;
                     end;

                     Commit;
                   Except
                       On E:Exception Do
                       Begin
                          Rollback;
                          MessageInfo := E.Message;
                          Raise Exception.Create(MessageInfo);
                       End;
                   End;

                   _Cds.Next;
               End;

               Try
                  StartTransaction;

                  _Cds.Data := Periodo.ListPeriodo(idEmpresa,tbpTodos,iExercicio,0);
                  _Cds.First;
                  while not _Cds.Eof do begin
                     if not Periodo.EncerraPeriodo(idEmpresa,IdModulo,iUsuario, _Cds.FieldByName('PEREXERCICIO').AsInteger,
                             _Cds.FieldByName('PERNUMERO').AsInteger,tbgAtualiza) then begin
                        sMens := Periodo.MessageInfo;
                        Raise Exception.Create(sMens);
                     end;
                     _Cds.Next;
                  end;
                  If not Padroes.GravaLogOperacoes(IdEmpresa,IdModulo,iUsuario, 'Atualização de Sintética - '+IntToStr(iExercicio)+'/'+IntToStr(iPeriodo),False) then
                     Raise Exception.Create( Padroes.MessageInfo );

                  Commit;
               Except
                     On E:Exception Do
                     Begin
                        Rollback;
                        Result := False;
                        MessageInfo := E.Message;
                     End;
               End;
      Except
         on E:Exception do begin
            Result := False;
            MessageInfo := E.Message;
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
          SQL.Add('SELECT /*+ index (PLANOSALDO XIE1PLANOSALDO) */ S.PEREXERCICIO, S.PERNUMERO,                 ');
          SQL.Add('       (ROUND(SUM(NVL(S.PLSDEBITOCORRENTE,0)-NVL(S.PLSCREDITOCOR,0)),2)) AS MOEDACORRENTE,   ');
          SQL.Add('       (ROUND(SUM(NVL(S.PLSDEBITOOFICIAL,0)-NVL(S.PLSCREDITOOFICIAL,0)),2)) AS MOEDAOFICIAL, ');
          SQL.Add('       (ROUND(SUM(NVL(S.PLSDEBITOGER,0)-NVL(S.PLSCREDITOGER,0)),2)) AS MOEDAGER1,            ');
          SQL.Add('       (ROUND(SUM(NVL(S.PLSDEBITOGEREN1,0)-NVL(S.PLSCREDITOGEREN1,0)),2)) AS MOEDAGER2,      ');
          SQL.Add('       (ROUND(SUM(NVL(S.PLSDEBITOGEREN2,0)-NVL(S.PLSCREDITOGEREN2,0)),2)) AS MOEDAGER3       ');
          SQL.Add('FROM PLANOSALDO S, PLANOCONTA C    ');
          SQL.Add('WHERE (S.PEREXERCICIO = ' + IntToStr(iExercicio) + ')  ');
          SQL.Add('  AND (S.IDPESSOA = '+FloatToStr(IdEmpresa)+')         ');
          SQL.Add('  AND (S.PLSTIPO  = ''A'')                             ');
          SQL.Add('  AND (C.PLAGRUPO <> ''E'')                            ');
          SQL.Add('  AND (C.PLACONTA = S.PLACONTA)                        ');
          SQL.Add('  AND (C.PLANO = S.PLANO)                              ');
          If iPeriodo > 0 Then
          Begin
            Case TipoPeriodo of
                tpSoPeriodo : SQL.Add('  AND (S.PERNUMERO = '+IntToStr(iPeriodo)+')                             ');
                tpMenorIgual: SQL.Add('  AND ((S.PERNUMERO <= '+IntToStr(iPeriodo)+') OR (S.PERNUMERO IS NULL)) ');
                tpSoAnterior: SQL.Add('  AND (S.PERNUMERO IS NULL)                                              ');
            End;
          End;
          SQL.Add('GROUP BY  S.PEREXERCICIO, S.PERNUMERO                     ');
          SQL.Add('HAVING ((ROUND(SUM(NVL(S.PLSDEBITOCORRENTE,0)-NVL(S.PLSCREDITOCOR,0)),2) <> 0)      ');
          SQL.Add('    OR (ROUND(SUM(NVL(S.PLSDEBITOOFICIAL,0)-NVL(S.PLSCREDITOOFICIAL,0)),2) <> 0)    ');
          SQL.Add('    OR (ROUND(SUM(NVL(S.PLSDEBITOGER,0)-NVL(S.PLSCREDITOGER,0)),2) <> 0)            ');
          SQL.Add('    OR (ROUND(SUM(NVL(S.PLSDEBITOGEREN1,0)-NVL(S.PLSCREDITOGEREN1,0)),2) <> 0)      ');
          SQL.Add('    OR (ROUND(SUM(NVL(S.PLSDEBITOGEREN2,0)-NVL(S.PLSCREDITOGEREN2,0)),2) <> 0))     ');

          _cds.Data := Data;

          FProgresso    := 0;
          FMaxProgresso := _cds.RecordCount;
          _cds.First;

          while not _cds.EOF do
          begin
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

             FProgresso  := FProgresso + 1;

             Result      := False;
             _cds.Next;
          end;

       Finally
          Free;
       End;
    End;
end;


function TCtrlProcessaContab.ProcessaIntegraData(IdEmpresa,IdModulo, iUsuario: Double; iExercicio, iPeriodo: Integer;
                          bUsaPlanoPatro, bBloqueia : Boolean; sData, sModulos : String): Boolean;
var
    sSql : String;
    sMens :string;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ProcessaIntegraData(IdEmpresa,IdModulo, iUsuario, iExercicio, iPeriodo,
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
               Raise Exception.Create(sMens);
            end;
            //if not Sistema.GravaLogOperacoes('Integração por Data até a Data '+sData) then Raise Exception.Create('Não Consegui Gravar o Log');
            sSql := 'UPDATE PLANILHA SET PLNEFETIVADO = ''S'' WHERE (PEREXERCICIO = '+FloatToStr(iExercicio)+') AND (PERNUMERO = '+FloatToStr(iPeriodo)+')'+
                    ' AND (IDPESSOA = '+FloatToStr(idEmpresa)+') AND (PLNDATDIA <= TO_DATE('''+sData+''',''DD/MM/YYYY'')) ';
            if sModulos <> '' then begin
               sSql := sSql + ' AND (IDMODULO IN ('+sModulos+')) ';
            end;
            if not ExecSql(sSql) then
               Raise Exception.Create(MessageInfo);
            //
            MessageInfo := 'Zerando o saldo das contas';
            if not ZeraSaldoContas(IdEmpresa,iExercicio,iPeriodo,False,False,tcAmbas,tpSoPeriodo) then
               Raise Exception.Create(MessageInfo);
            _Cds.Data := Lancamento.SelecionaLancamentos(0,idEmpresa, iExercicio, iPeriodo, tpSoPeriodo,'','','','',
                                         teEfetivado,tomAmbos,tolPlnCodigo,tsPeriodo, False);
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
                     Raise Exception.Create(sMens);
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
                     Raise Exception.Create(sMens);
                  end;
                  //
                  _Cds.Next;
               end;
            end else begin
               sMens := 'Não Há Lançamentos Para Serem Processados.';
               Raise Exception.Create(sMens);
            end;
            if bBloqueia then begin
               if not Periodo.TestaPeriodoExiste(idEmpresa,iPeriodo,iExercicio) then begin
                 sMens := Periodo.MessageInfo;
                 Raise Exception.Create(sMens);
               end;
               if DateToStr(Periodo.DataFimPeriodo) = sData then begin
                  if not Periodo.EncerraPeriodo(idEmpresa,idModulo,iUsuario,iExercicio,iPeriodo,tbgIntegrado) then begin
                    sMens := Periodo.MessageInfo;
                    Raise Exception.Create(sMens);
                  end;
               end;
               if not Contab.BloqueiaData(idEmpresa,sData) then begin
                  sMens := Contab.MessageInfo;
                  Raise Exception.Create(sMens);
               end;
            end;
            If not Padroes.GravaLogOperacoes(IdEmpresa,IdModulo,iUsuario, 'Integração - Por Dia',False) then
               Raise Exception.Create( Padroes.MessageInfo );
            Commit;
         Except
            On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
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

function TCtrlProcessaContab.ProcessaIntegraPlanilha(IdModulo,iUsuario, IdEmpresa : Double; bUsaPlanoPatro:Boolean): Boolean;
var
    sData, sMens,sSql : String;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.ProcessaIntegraPlanilha(IdModulo,iUsuario, IdEmpresa, bUsaPlanoPatro, FcdsPlanilha.Data);
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
                     Raise Exception.Create(sMens);
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
                        Raise Exception.Create(sMens);
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
                        Raise Exception.Create(sMens);
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
               MessageInfo := E.Message;
            End;
         End;
      Except
         on E:Exception do begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;


function TCtrlProcessaContab.ProcessaLancamento(idEmpresa, iModuloOrigem, liUsuario : Double;
                                                bUsaPlanoPatro: Boolean; iPlnCodigo: Double; sPlnDatDia: String): Boolean;
var sMens : String;
    cTipoLanc : Char;
    iIdSegregaCriter: integer;
    dDataSegregaCriter: TDateTime;
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

         // Alex 07/01/03 14451
         if cdsLancamento.FieldByName('IDSEGREGACRITER').IsNull then begin
           iIdSegregaCriter := -1;
           dDataSegregaCriter := -1;
         end else begin 
           iIdSegregaCriter := cdsLancamento.FieldByName('IDSEGREGACRITER').AsInteger;
           dDataSegregaCriter := cdsLancamento.FieldByName('DATASEGREGACRITER').AsDateTime;
         end;
         // fim Alex 07/01/03 14451


         if cdsLancamento.FieldByName('LACNUMLAN').AsFloat <> 0 then begin
            //Altera
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
                                             False,bUsaPlanoPatro,
                                             // 05/01/04 Alex 14451 - nova segregacao
                                             iIdSegregaCriter, dDataSegregaCriter) then begin
               sMens := Lancamento.MessageInfo;
               Raise Exception.Create(sMens);
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
                                             False,bUsaPlanoPatro,
                                             // 05/01/04 Alex 14451 - nova segregacao
                                             iIdSegregaCriter, dDataSegregaCriter) then begin
               sMens := Lancamento.MessageInfo;
               Raise Exception.Create(sMens);
            end;
         end;
         FRetornaPlnCodigo := Lancamento.RetornoPlnCodigo;
         FRetornaPlnPlanil := Lancamento.ProxPlanilha;
         FRetornaPlnNumLan := Lancamento.NumLancamento;
         If not Padroes.GravaLogOperacoes(IdEmpresa,iModuloOrigem,liUsuario, 'Planilhas - Lançamentos',False) then
            Raise Exception.Create( Padroes.MessageInfo );
         Commit;
      except
         On E:Exception Do
         Begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         End;
      End;
   end;
end;

procedure TCtrlProcessaContab.SetcdsLancamento(
  const Value: TClientDataSet);
begin
  FcdsLancamento := Value;
end;

function TCtrlProcessaContab.ProcessaExcluiLanc(idEmpresa,iPlanilha, iModuloOrigem, liUsuario: Double;
                      iNumLanc: LongInt; bUsaPlanoPatro, bExcluiPlanilha: Boolean): Boolean;
var sMens : String;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.ProcessaExcluiLanc(idEmpresa,iPlanilha, iModuloOrigem, liUsuario,
                            iNumLanc, bUsaPlanoPatro, bExcluiPlanilha);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      sMens:='';
      Result := True;
      if iNumLanc = 0 then begin
         Try
            if not Contab.SelecionaParametrosProc(idEmpresa) then
               Raise Exception.Create(Contab.MessageInfo);
            if Contab.PlnCodigo = iPlanilha then begin
               if not AtualizaParamContab(idEmpresa,0) then
                  Raise Exception.Create(MessageInfo);
            end;
         except
            On E:Exception Do
            Begin
               Result := False;
               MessageInfo := E.Message;
            End;
         end;
      end;
      Try
         StartTransaction;
         if not Lancamento.ExcluiLancaContab(liUsuario,iPlanilha,iModuloOrigem,iNumLanc,
                                      bUsaPlanoPatro,bExcluiPlanilha) then begin
            sMens:=Lancamento.MessageInfo;
            Raise Exception.Create(sMens);
         end;
         Commit;
      except
         On E:Exception Do
         Begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         End;
      End;
   end;
end;


procedure TCtrlProcessaContab.AfterInitialize;
begin
  inherited;

  Lancamento.Initializeas(self);
  Lancamento.OnMessageInfo := nil;

  FuncaoGeral.Initializeas(self);
  FuncaoGeral.OnMessageInfo := nil;

  DiasUteis.Initializeas(self);
  DiasUteis.OnMessageInfo := nil;

  Periodo.initializeas(self);
  Periodo.OnMessageInfo := nil;

  HistoContab.initializeas(self);
  HistoContab.OnMessageInfo := nil;

  SubConta.initializeas(self);
  SubConta.OnMessageInfo := nil;

  Contab.initializeas(self);
  Contab.OnMessageInfo := nil;

  PlanoDePara.initializeas(self);
  PlanoDePara.OnMessageInfo := nil;

  Planilha.initializeas(self);
  Planilha.OnMessageInfo := nil;

  ListTerceiros.initializeas(self);
  ListTerceiros.OnMessageInfo := nil;

  ContaContabil.initializeas(self);
  ContaContabil.OnMessageInfo := nil;

  Geral.initializeas(self);
  Geral.OnMessageInfo := nil;

  Padroes.initializeas(self);
  Padroes.OnMessageInfo := nil;

  Periodo.OpenTransaction := False;

  // 05/08/03 - by Alex
  CtrlPlanoSaldo.InitializeAs(self);
end;

function TCtrlProcessaContab.ImportaPlanoContas(ArquivoTexto:TStringList;sMascara,sCaminho:string;
                                           iPlano :Integer;dEmpresa,dModulo,dUsuario: double): Boolean;
var
  sGrau, sGrupo, sNomoutling, sSumariza, sObrigacc, sOrdAlfab, sSecretaria : string;
  sLinha, sPlaconta, sCorresp,sSql,sMens,sConta : string;
  iReduz,iContaLinha : integer;
  sDesc, sTiposa, sTipodc   : String;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ImportaPlanoContas(StringlistToVariant(ArquivoTexto),
                            sMascara,sCaminho,iPlano,dEmpresa,dModulo,dUsuario,FsMensAPS);

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

     sLinha := ArquivoTexto[0];

     //Verifica se a formatação está correta
     if length(sLinha) <> 144 then
     Begin
       MessageInfo := 'Arquivo texto com formato incompatível';
       sMensAPS := sMensAPS + MessageInfo + chr(13) + chr(13);

       Result := False;
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

         If not Padroes.GravaLogOperacoes(dEmpresa,dModulo,dUsuario, 'Importa Dados do Plano de Contas',False) then
            Raise Exception.Create( Padroes.MessageInfo );

         Commit;
         Result := True;
         sMens := 'Importação do Plano de Contas Efetuada com Sucesso!';
         sMensAPS := sMensAPS + sMens + chr(13) + chr(13);

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

function TCtrlProcessaContab.ImportaSaldoAnterior(ArquivoTexto: TStringList; sExercicio,
  sCaminho,sMascara: string;  iPlano,iUsuario:Integer;dEmpresa,dModulo: double): Boolean;
var
  iZeros,iGrau,iContaLinha :integer;
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
                            sExercicio,sCaminho,sMascara,iPlano,iUsuario,dEmpresa,dModulo,FsMensAPS);

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

     sLinha := ArquivoTexto[0];

     //Verifica se a formatação está correta
     if (length(sLinha) <> 63) and (length(sLinha) <> 83) Then
     Begin
       MessageInfo := 'Arquivo texto com formato incompatível';
       sMensAPS := sMensAPS + MessageInfo + chr(13) + chr(13);

       Result := False;
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

         If not Padroes.GravaLogOperacoes(dEmpresa,dModulo,iUsuario, 'Importa Dados dos Saldos Anteriores',False) then
            Raise Exception.Create( Padroes.MessageInfo );

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
     _cdsParamGlobal.free;
     _cdsPlanoConta.free;
     _cdsUnidNegoc.free;
     _cdsConta.free;
  End;
end;

function TCtrlProcessaContab.ImportaContaCorresp(ArquivoTexto: TStringList;
                          sCaminho: string; iPlano: Integer;dEmpresa,dModulo,dUsuario:Double): Boolean;
var
 sConta,sCorresp,sSql,sMens,sLinha :string;
 iContaLinha :Integer;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ImportaContaCorresp(StringlistToVariant(ArquivoTexto),
                            sCaminho,iPlano,dEmpresa,dModulo,dUsuario,FsMensAPS);

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


     sLinha := ArquivoTexto[0];

     //Verifica se a formatação está correta
     if length(sLinha) <> 144 then
     Begin
       MessageInfo := 'Arquivo texto com formato incompatível';
       sMensAPS := sMensAPS + MessageInfo + chr(13) + chr(13);

       Result := False;
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
         If not Padroes.GravaLogOperacoes(dEmpresa,dModulo,dUsuario, 'Importa Contas Correspondentes',False) then
            Raise Exception.Create( Padroes.MessageInfo );

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
            MessageInfo := E.Message;
         End;
     End;
  End;

end;

function TCtrlProcessaContab.ImportaSAF(ArquivoTexto: TStringList;
  sTipoOper,sCaminho: string; iModulo,iUsuario,iPlano,iPlanoPrev,iPlanoPatro,
  iNumCommit,iContMax: Integer; dEmpresa: Double;bUsaPPatro,bTestaConta:Boolean): Boolean;

var
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
                           dEmpresa,bUsaPPatro,bTestaConta,sMensAPS_Log);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
      Begin
         FsMensAPS_Log := Connection.AppServer.MessageInfo;
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

     Result := True;


    _cdsCentroCusto  := TClientDataSet.Create(nil);
    _cdsPlanoConta   := TClientDataSet.Create(nil);
    _cdsContasxCC    := TClientDataSet.Create(nil);
    _cdsPlanilha     := TClientDataSet.Create(nil);

     If Not Contab.SelecionaParametrosProc(dEmpresa) Then
     Begin
        Result := False;
        MessageInfo := Contab.MessageInfo;
        sMensAPS_Log := MessageInfo + chr(13) + chr(13);
        Exit;
     End;

     // Marchetti - 19/02/2004
     StartTransaction;

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

//            if ((iContaLinha Mod iNumCommit) = 0) then
//               StartTransaction;

             sLinha := ArquivoTexto[iContaLinha];

             iContaLinha := iContaLinha + 1;

             FProgresso  := FProgresso + 1;

             sDataLanc   := Trim(copy(sLinha,28,10));
             cTipoLanc   := '2';
             sNumDoc     := Trim(copy(sLinha,38,10));
             sHistorico  := Trim(copy(sLinha,138,120));
             sCodCorresp := Trim(copy(sLinha,1,2));

             HistoContab.ArrumaHistorico(sHistorico);

             cAuxDec           := DecimalSeparator;
             DecimalSeparator := '.';
             sValor    := Trim(copy(sLinha,118,20));

             if sValor = '' then
                sValor := '0';

             dValLanc := strToFloat(sValor)/100;
             DecimalSeparator := cAuxDec;

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


            //=== Pega dados da Conta Crédito ===
            iSubContaD  := 0;
            iSubContaC  := 0;

            sCCustoC    := sCCusto;
            sContaC     := Contab.RemoveMascara(Trim(copy(sLinha,88,30)));

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
                                      dValLanc,False,bUsaPPatro,
                                      // Alex 05/01/04 14451
                                      -1, -1) Then

            Begin
               sMensAPS_Log := sMensAPS_Log + Lancamento.MessageInfo + chr(13);
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
               sMensAPS_Log := sMensAPS_Log + 'Gravei até a linha:' +IntToStr(iContaLinha) + chr(13);
               iContCommit := iContaLinha;
               // Marchetti - 19/02/2004
               StartTransaction;
            End;

         Except
            on E:Exception Do
            Begin
               _cdsCentroCusto.free;
               _cdsPlanoConta.free;
               _cdsContasxCC.free;

               Result := False;

               RollBack;

               sMens := 'Houve erro na importação. ' + CHR(13) + CHR(13) +
                        'A linha nº ' + IntToStr(iContaLinha) + ' do arquivo importado está com problemas.'+ CHR(13) +
                        'Foi importado até a linha nº ' + IntToStr(iContCommit) +'.'+ CHR(13) +
                        'Apague do seu TXT as linhas já importadas. ' + CHR(13) +
                        'Verifique os Lançamentos com inconsistências.';

               sMensAPS_Log := sMensAPS_Log + sMens + chr(13);

               MessageInfo := sMens+' '+E.Message;

               sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);

               // Marchetti - 19/02/2004
               StartTransaction;

            End;

         End;
//         Commit;

     End;

     // Marchetti - 19/02/2004
     If (iContaLinha = iContMax) then
     Begin
        Commit;
     End;

     _cdsCentroCusto.free;
     _cdsPlanoConta.free;
     _cdsContasxCC.free;
     _cdsPlanilha.free;
     sMens := 'Lançamentos efetuados com sucesso!';
     MessageInfo := sMens;
     sMensAPS_Log := sMensAPS_Log + sMens;
   End;
end;


function TCtrlProcessaContab.ImportaLancamentos(ArquivoTexto:TStringList;dEmpresa:Double;
                   iPlano,iUsuario,iModulo,iNumCommit:Integer; sTipoOper,
                   sCaminho:string;bTestaConta,bHistCheked,bUsaPPatro:Boolean) : Boolean;
var
  sLinha,sValor,sMens,sDataLanc,sContaD,sContaC,sCCustD,sCCustC :string;
  sHistCompleto, sMascaraHist,sDebCre,sSql,sNumDoc :string;


  sHist1,sHist2,sHist3,sHist4,sHist5,sHistorico,sUneCodigo :string;

  dValLanc,dPlnCodigo,dPlnCodigo2,dPlanilha :Double;
  iContaLinha,iContaCommit,iSubContaC,iSubContaD,iPatro,iUnidNegoc, iPlanPrev  :integer;
  // 11/02/04 Alex 14451
  iIdSegregaCriter : integer;

  Auxdec,sTipoLanc : char;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ImportaLancamentos(StringlistToVariant(ArquivoTexto),
                                dEmpresa,iPlano,iUsuario,iModulo,iNumCommit, sTipoOper,
                                sCaminho,bTestaConta,bHistCheked,bUsaPPatro,FsMensAPS_Log);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
      Begin
         FsMensAPS_Log := Connection.AppServer.MessageInfo2;
      End;

   End Else
   Begin
       //Inicializa as variáveis

       iContaLinha      := 0;
       FProgresso       := 0;
       dPlnCodigo2      := 0;
       sMens            := '';
       sMensAPS_Log     := '';
       iContaCommit     := 0;
       dPlanilha := 0;


       //*** Deleta os lançamentos contábeis externos
       StartTransaction;
       Try
         sSql := 'DELETE FROM LANCONTABEXTERNOS';
         ExecSQL(sSql);
         Commit;
       Except
          Rollback;
       End;

       //Loop de Varredura do Arquivo Texto
       While (ArquivoTexto.Count <>  iContaLinha)  do
       Begin
          MessageInfo := 'a';
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

             {  11/02/04 Alex 14451
                Não entendi o if "temos dois layouts para arquivo texto?"
                 If length(sLinha) = 411 Then
             Begin
                if Trim(copy(sLinha,392,10)) <> '' then
                   iPlanPrev := StrToInt(Trim(copy(sLinha,392,10)))
                else
                   iPlanPrev := 0;

                if Trim(copy(sLinha,402,10)) <> '' then
                   iPatro    := StrToInt(Trim(copy(sLinha,402,10)))
                else
                   iPatro    := 0;
             End Else
             Begin
                If length(sLinha) = 412 Then
                Begin
                   if Trim(copy(sLinha,393,10)) <> '' then
                      iPlanPrev := StrToInt(Trim(copy(sLinha,393,10)))
                   else
                      iPlanPrev := 0;

                   if Trim(copy(sLinha,403,10)) <> '' then
                      iPatro    := StrToInt(Trim(copy(sLinha,403,10)))
                   else
                      iPatro := 0;
                End;
             End; }

             // 11/02/04 Alex 14451 trocado todo if acima por estas duas linhas
             iPlanPrev := StrToIntDef(Trim(copy(sLinha,392,10)), 0);
             iPatro    := StrToIntDef(Trim(copy(sLinha,402,10)), 0);

             // 11/02/04 Alex 14451 - iIdSegregaCriter
             iIdSegregaCriter := StrToIntDef(Trim(copy(sLinha,412,10)), -1);


             sHistCompleto := trim(sHist1) +' '+ trim(sHist2) +' '+ trim(sHist3) +' '+ trim(sHist4) +' '+ trim(sHist5);

             AuxDec           := DecimalSeparator;
             DecimalSeparator := '.';
             sValor := Trim(copy(sLinha,257,17));

             If sValor = '' Then
                sValor  := '0';

             dValLanc := StrToFloat(sValor);

             If (length(sLinha) = 392) or (length(sLinha) = 412) Then
                sHistorico := Trim(copy(sLinha,373,4))
             Else
                sHistorico := Trim(copy(sLinha,372,4));

             If (sHistorico <> '0000') AND (sHistorico <> '') then
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
             if Trim(copy(sLinha,342,8)) <> '' then
                sUneCodigo := Trim(copy(sLinha,342,8))
             else
                sUneCodigo := '';


             _cds.Data := ListTerceiros.ListAtivProj(dEmpresa,0,sUneCodigo,tapAmbos,toapCodigo);

             If _cds.isEmpty Then
                iUnidNegoc := 0
             Else
                iUnidNegoc := _cds.FieldByName('UNIDNEGOC').AsInteger;

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

                sValor := Trim(copy(sLinha,350,17));
                If sValor = '' Then sValor := '0';
                   Lancamento.lcValHisDeb := StrToFloat(sValor);

                if (length(sLinha) = 392) or (length(sLinha) = 412) then
                begin
                   if Trim(copy(sLinha,367,6)) <> '' then
                      iSubContaD  := StrToInt(Trim(copy(sLinha,367,6)))
                   else
                      iSubContaD  := 0;
                end else
                begin
                   if Trim(copy(sLinha,367,5)) <> '' then
                      iSubContaD  := StrToInt(Trim(copy(sLinha,367,5)))
                   else
                      iSubContaD  := 0;
                end;

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

                sValor := Trim(copy(sLinha,350,17));
                If sValor = '' Then sValor := '0';
                   Lancamento.lcValHisCre := StrToFloat(sValor);

                iSubContaD := 0;
                If (length(sLinha) = 392) or (length(sLinha) = 412) Then
                Begin
                   if Trim(copy(sLinha,367,6)) <> '' then
                      iSubContaC := StrToInt(Trim(copy(sLinha,367,6)))
                   else
                      iSubContaC := 0;
                End Else
                Begin
                   if Trim(copy(sLinha,367,5)) <> '' then
                      iSubContaC := StrToInt(Trim(copy(sLinha,367,5)))
                   else
                      iSubContaC := 0;
                End;
             End;

             If iSubContaD <> 0 Then
             Begin
                _cds.Data := SubConta.ListSubConta(dEmpresa,iSubContaD);

                If _cds.IsEmpty Then
                Begin
                   MessageInfo := 'Sub-Conta a Débito '+IntToStr(iSubContaD)+' Inválida';
                   sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);

                   Raise Exception.Create(MessageInfo);
                End;
             End;

             If iSubContaC <> 0 Then
             Begin
                _cds.Data := SubConta.ListSubConta(dEmpresa,iSubContaC);

                If _cds.IsEmpty Then
                Begin
                   MessageInfo := 'Sub-Conta a Crédito '+IntToStr(iSubContaC)+' Inválida';
                   sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);

                   Raise Exception.Create(MessageInfo);
                End;
             End;
             DecimalSeparator := AuxDec;
             //*** insere os lancamentos ***
             Lancamento.lcTestaConta := bTestaConta;
             If Not Lancamento.InsereLancaContab (sTipoLanc,dEmpresa,iModulo,iUsuario,
                                      iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                      iPlanPrev, iPatro,dPlnCodigo,0,
                                      sDataLanc,sNumDoc,
                                      HistoContab.Hist1,
                                      HistoContab.Hist2,
                                      HistoContab.Hist3,
                                      HistoContab.Hist4,
                                      HistoContab.Hist5,
                                      sTipoOper,sCCustD,sContaD,
                                      sCCustC,sContaC,sHistorico,
                                      dValLanc,False,bUsaPPatro,
                                      // 05/01/04 Alex 14451
                                      iIdSegregaCriter, StrToDate(sDataLanc) ) Then

             Begin
               sMensAdd := sMensAdd + MessageInfo + chr(13);
               MessageInfo := Lancamento.MessageInfo;
               Raise Exception.Create(Lancamento.MessageInfo);

             End Else
             Begin
                 dPlnCodigo := Lancamento.RetornoPlnCodigo;
             End;

             _cds.Data := Planilha.ListPlanilhas(0,dPlnCodigo);

             FLinhaTexto := '';
             If dPlnCodigo <> dPlnCodigo2 Then
             Begin
                sMens := IntToStr(_cds.FieldByName('PLNPLANIL').asInteger) + ' em: ' + sDataLanc;
                sMensAPS_Log := sMensAPS_Log + sMens + chr(13);
                dPlnCodigo2 := dPlnCodigo;
                FLinhaTexto := sMens;
             End;

             If ((iContaLinha Mod iNumCommit) = 0)  Then
             Begin
               If not Padroes.GravaLogOperacoes(dEmpresa,iModulo,iUsuario, 'Importa Lançamentos Externos - Lançamentos',False) then
                 Raise Exception.Create( Padroes.MessageInfo );
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

             MessageInfo := MessageInfo + '. ' +sMens;
             sMensAPS_Log := sMensAPS_Log + sMens + chr(13);
             Result := False;
             Exit;
          End;

          If not Padroes.GravaLogOperacoes(dEmpresa,iModulo,iUsuario, 'Importa Lançamentos Externos - Lançamentos',False) then
             Raise Exception.Create( Padroes.MessageInfo );

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
   End;
end;


function TCtrlProcessaContab.ImportaPlanilhaExcel(ArquivoTexto:TStringList;dEmpresa:Double;iPlano,iModulo,
                iUsuario:Integer;sDataLanc,sTipoOper:string;bUsaPPatro:Boolean) :Boolean;
const
  // 12/02/04 alex 14451
  // número de colunas a serem importadas do arquivo excel. Caso inclua mais um
  // campo na coluna incrementar esta constante.
  iColunas = 13;

var
  sLinha,sMens,sTralhaNove,sContaD,sDebCre,sHistorico,sNumDoc,sUnidNegoc :string;
  sContaC,sCCustC,sCCustD,sHist1,sHist2,sHist3,sHist4,sHist5,sValor,cTipoLanc:string;
  iContaLinha,Y,Z,W,X,iSubContaC,iSubContaD,iPatro,iPlanoPrev,i :integer;
  sTipoLanc :char;
  dValLanc,dPlnCodigo :Double;
// 11/02/04 Alex 14451  aLinha : array [1..12] of string;
  aLinha : array [1..iColunas] of string;
  iIdSegregaCriter : integer;
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

               // 11/02/04 Alex 14451
               iIdSegregaCriter := StrToIntDef(Trim(aLinha[13]), -1);

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

               For i := 1 to iColunas{Alex 12/02/04 12} do
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
                                             dValLanc,False,bUsaPPatro,
                                             // 11/02/04 Alex 14451
                                             iIdSegregaCriter, StrToDate(sDataLanc)) Then

                     Begin
                         dPlnCodigo := Lancamento.RetornoPlnCodigo;
                     End Else
                     Begin
                        FLinhaTexto := MessageInfo;
                        Raise Exception.Create(Lancamento.MessageInfo);
                     End;
                  End;
               End;
            End;

            _cds.Data := Planilha.ListPlanilhas(0,dPlnCodigo);

            MessageInfo := 'Planilha Gerada: '+ IntToStr(_cds.FieldByName('PLNPLANIL').asInteger) + ' em: ' + sDataLanc + chr(13)+ chr(13);
            FsMensAdd := FsMensAdd + MessageInfo + chr(13);

            Commit;

            Result := True;

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

function TCtrlProcessaContab.AlteraPlanoConta(dEmpresa,dUsuario: Double;sMascara,sDataRef:string;
                                    iPlano,iPlanoVigente,iExercicio: Integer;bMesmoPlano,
                                    bMesmosCCSC, bGeraLancSaldoAnt, bSoSaldoAnt:Boolean): Boolean;
var
    sContaDE, sCCustoDE, sContaPARA, sCCustoPARA : string;
    iPlnCodigo,iPlanoAnterior: Double;
    sSql,sMens,sWhere, sUpdate,sCampos : String;

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
      Result := Connection.AppServer.AlteraPlanoConta(dEmpresa,dUsuario,sMascara,sDataRef,
                                    iPlano,iPLanoVigente,iExercicio,bMesmoPlano,
                                    bMesmosCCSC, bGeraLancSaldoAnt, bSoSaldoAnt);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;

   End Else
   Begin
      FMaxProgresso := 0;
      FProgresso    := 0;
      sMens         := '';
      sCampos       := '';
      FTotreg       := 0;
      FNreg         := 0;

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

         If not bSoSaldoAnt then
         Begin
            //=== Faz o DE/PARA nas tabelas de configuração parte 1 ===
            _cdsTabelaDePara.Data := PlanoDePara.ListTabelaDePara;

            FMaxProgresso := _cdsTabelaDePara.Recordcount;
            FTotreg := _cdsTabelaDePara.Recordcount;

            FParteProc := 'Parte 1 - De/Para na Tabelas de Configuração DE/PARA';

            _cdsTabelaDePara.First;

            FNreg := 0;
            While not _cdsTabelaDePara.eof do
            Begin
               MessageInfo := 'x';
               FProgresso := FProgresso + 1;
               FNreg := FNreg + 1;

               FNomeTabela  := _cdsTabelaDePara.FieldByName('NOMETABELA').asString;

               //=== pega campos da tabela campos de-para ===
               sCampos  := '';
               sCampos  := _cdsTabelaDePara.FieldByName('NOMECAMPOPLANO').asString;
               _cdsCampoDePara.Data := PlanoDePara.ListCampoDePara(_cdsTabelaDePara.FieldByName('IDTABELADEPARA').asFloat);

               _cdsCampoDePara.First;
               while not _cdsCampoDePara.eof do
               begin
                  sCampos := sCampos +','+ _cdsCampoDePara.FieldByName('NOMECAMPOCONTA').asString;
                  _cdsCampoDePara.Next;
               end;

               sSql := 'SELECT DISTINCT '+ sCampos +' FROM '+ _cdsTabelaDePara.FieldByName('NOMETABELA').asString;

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

                     if (iPlanoAnterior = _cdsPrincipal.FieldByName(trim(_cdsTabelaDePara.FieldByName('NOMECAMPOPLANO').asString)).AsInteger) or
                        (_cdsPrincipal.FieldByName(trim(_cdsTabelaDePara.FieldByName('NOMECAMPOPLANO').asString)).isNull) then
                     begin
                        //faz a troca da conta a Debito no DE/PARA
                        sCCustoDE   := '';
                        sContaDE    := trim(_cdsPrincipal.FieldByName(trim(_cdsCampoDePara.FieldByName('NOMECAMPOCONTA').asString)).AsString);
                        sContaPARA  := '';
                        sCCustoPARA := '';
                        if sContaDE <> '' then
                        begin
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
                              sContaPARA  := ContaContabil.ContaContabilPara;
                              sCCustoPARA := ContaContabil.CentroCustoPara;
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

                  End; // fim do campo de/para

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

               End; // fim do principal

               _cdsTabelaDePara.Next;

            End;   // fim da tabela de/para

            //==  Faz o De/Para nas tabelas de lançamentos  parte-2
            MessageInfo := 'x';
            FParteProc := 'Parte 2 -  De/Para na Tabela Lançamento';

            FNomeTabela := 'LANCAMENTO';
            FProgresso    := 0;
            FMaxProgresso := 0;
            FNreg := 0;
            Ftotreg := 0;

            sSql := 'SELECT L.LACDEBCRE, L.LACNUMLAN, L.PLACONTA, '+
                    '    L.PLANO, L.PLNCODIGO, L.CODCENTROCUSTO '+
                    'FROM LANCAMENTO L, PLANILHA P '+
                    'WHERE  (P.IDPESSOA     = ' + FloatToStr(dEmpresa) + ') AND '+
                    '       (P.PEREXERCICIO = '+ IntToStr(iExercicio) + ') AND '+
                    '       (P.PLNCODIGO    = L.PLNCODIGO) ';


            _cdsLancamentos.Data := GetDataPacket(sSql);
            FMaxProgresso := _cdsLancamentos.Recordcount;
            Ftotreg :=  _cdsLancamentos.Recordcount;


            _cdsLancamentos.First;
            While not _cdsLancamentos.eof do
            Begin
               MessageInfo := 'x';
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
               bFezDePara  := ContaContabil.FazDeParaConta(dEmpresa, _cdsLancamentos.FieldByName('PLANO').asInteger, iPlanoVigente, sContaDE, sCCustoDE);

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
                  sContaPARA  := ContaContabil.ContaContabilPara;
                  sCCustoPARA := ContaContabil.CentroCustoPara;
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
                     bFezDePara  := ContaContabil.FazDeParaConta(dEmpresa, _cdsLancamentos.FieldByName('PLANO').asInteger, iPlanoVigente,sContaDE, sCCustoDE);

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
                       sContaPARA  := ContaContabil.ContaContabilPara;
                       sCCustoPARA := ContaContabil.CentroCustoPara;
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
               Fnreg := Fnreg  + 1;

            End; // fim do cdslancamento

         End;


         //=== Faz o DE/PARA nas tabelas de saldos parte 3 ====
         MessageInfo := 'x';
         FParteProc := 'Parte 3 - De/Para na Tabela de Saldo';
         FNomeTabela := 'PLANOSALDO';

         FProgresso    := 0;
         FMaxProgresso := 0;
         Ftotreg := 0;
         FNreg := 0;

         _sqlSaldos.SQL.Clear;
         _sqlSaldos.SQL.Add('SELECT                                           ');
         _sqlSaldos.SQL.Add('   PLACONTA, PLANO, IDPLANOSALDO, CODCENTROCUSTO ');
         _sqlSaldos.SQL.Add('FROM                                             ');
         _sqlSaldos.SQL.Add('   PLANOSALDO                                    ');
         _sqlSaldos.SQL.Add('WHERE                                            ');
         _sqlSaldos.SQL.Add('   (IDPESSOA=:IDPESSOA) AND                      ');
         if bSoSaldoAnt then
            _sqlSaldos.SQL.Add('  (PERNUMERO IS NULL) AND                 ');
         if bGeraLancSaldoAnt then
            _sqlSaldos.SQL.Add('  (PERNUMERO IS NOT NULL) AND                 ');
         _sqlSaldos.SQL.Add('  (PEREXERCICIO=:PEREXERCICIO)                   ');

         _sqlSaldos.Prepare;
         _sqlSaldos.ParamByName('IDPESSOA').asFloat       := dEmpresa;
         _sqlSaldos.ParamByName('PEREXERCICIO').asInteger := iExercicio;

         _cdsSaldos.Data := _sqlSaldos.Data;

         FMaxProgresso := _cdsSaldos.RecordCount;
         FtotReg := _cdsSaldos.RecordCount;

         _cdsSaldos.First;
         While not _cdsSaldos.eof do
         Begin
            MessageInfo := 'x';
            FNomeConta := _cdsSaldos.FieldByName('PLACONTA').asString;

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
               sContaPARA  := ContaContabil.ContaContabilPara;
               sCCustoPARA := ContaContabil.CentroCustoPara;

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
                     sContaPARA  := ContaContabil.ContaContabilPara;
                     sCCustoPARA := ContaContabil.CentroCustoPara;

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
            End;
            _cdsSaldos.Next;
            FProgresso := FProgresso + 1;
            FNreg := FNreg + 1;
         End;

         If bGeraLancSaldoAnt then
         Begin
            //=== Faz o DE/PARA nas tabelas de saldos parte 3 ====
            FParteProc := 'Parte 3 - De/Para na Tabela de Saldo';
            FNomeTabela := 'PLANOSALDO';
            MessageInfo := 'x';

            FProgresso := 0;

            _sqlSaldos.SQL.Clear;
            _sqlSaldos.SQL.Add('SELECT                                           ');
            _sqlSaldos.SQL.Add('   PLACONTA, PLANO, IDPLANOSALDO, CODCENTROCUSTO ');
            _sqlSaldos.SQL.Add('FROM                                             ');
            _sqlSaldos.SQL.Add('   PLANOSALDO                                    ');
            _sqlSaldos.SQL.Add('WHERE                                            ');
            _sqlSaldos.SQL.Add('   (PLSTIPO = ''A'') AND                         ');
            _sqlSaldos.SQL.Add('   (IDPESSOA=:IDPESSOA) AND                      ');
            _sqlSaldos.SQL.Add('  (PERNUMERO IS NULL) AND                        ');
            _sqlSaldos.SQL.Add('  (PEREXERCICIO=:PEREXERCICIO) AND               ');
            _sqlSaldos.SQL.Add('  (ROUND(PLSDEBITOCORRENTE,2) <> ROUND(PLSCREDITOCOR,2)) ');

            _sqlSaldos.Prepare;
            _sqlSaldos.ParamByName('IDPESSOA').asFloat       := dEmpresa;
            _sqlSaldos.ParamByName('PEREXERCICIO').asInteger := iExercicio;

            _cdsSaldos.Data := _sqlSaldos.Data;

            MessageInfo := 'x';
            FMaxProgresso := _cdsSaldos.RecordCount;
            FTotreg := _cdsSaldos.RecordCount;
            FNreg :=0;
            MessageInfo := 'x';

            _cdsSaldos.First;
            iPlnCodigo := 0;
            While not _cdsSaldos.eof do
            Begin
               FNomeConta := _cdsSaldos.FieldByName('PLACONTA').asString;

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
               bFezDePara  := ContaContabil.FazDeParaConta(dEmpresa, _cdsSaldos.FieldByName('PLANO').asInteger, iPlanoVigente, sContaDE, sCCustoDE);
               //
               if bFezDePara then begin
                  sContaPARA  := ContaContabil.ContaContabilPara;
                  sCCustoPARA := ContaContabil.CentroCustoPara;

                  if sCCustoPARA = '' then
                     sCCustoPARA := _cdsSaldos.FieldByName('CODCENTROCUSTO').asString;

                  //Procura dados no Plano Antigo
                  OpenDataSet('SELECT * FROM PLANOSALDO WHERE (IDPLANOSALDO ='+FloatToStr(_cdsSaldos.FieldByName('IDPLANOSALDO').asFloat)+') ');
                  if _lDataSet.FieldByName('PLSCREDITOCOR').AsFloat <> 0 then begin
                     //Estorna do Plano Antigo a Débito
                     Lancamento.lcEDePara := 'S';
                     Lancamento.lcPeriodoEsp := True;
                     Lancamento.lcTestaConta := False;
                     if not Lancamento.InsereLancaContab('0',dEmpresa,1,dUsuario,
                                                         _lDataSet.FieldByName('PLANO').AsFloat,
                                                         _lDataSet.FieldByName('UNIDNEGOC').AsFloat,
                                                         _lDataSet.FieldByName('CODSUBCONTA').AsFloat,
                                                         0,
                                                         _lDataSet.FieldByName('IDPLANOPREV').AsFloat,
                                                         _lDataSet.FieldByName('IDPATRO').AsFloat,
                                                         iPlnCodigo,0,
                                                         sDataRef,
                                                         'De/Para',
                                                         'Saldo a ser Transferido pelo De/Para',
                                                         '',
                                                         '',
                                                         '',
                                                         '',
                                                         '03',
                                                         _lDataSet.FieldByName('CODCENTROCUSTO').AsString,
                                                         _lDataSet.FieldByName('PLACONTA').AsString,
                                                         '',
                                                         '',
                                                         '',
                                                         _lDataSet.FieldByName('PLSCREDITOCOR').AsFloat,
                                                         False,(not _lDataSet.FieldByName('IDPLANOPREV').isnull),
                                                         // 05/01/04 - Alex 14451 - Nova estrutura de segregação
                                                         -1, -1) then begin
                        sMens := Lancamento.MessageInfo;
                        Raise Exception.Create(sMens);
                     end;
                     iPlnCodigo := Lancamento.RetornoPlnCodigo;
                     //
                     //Lança no Plano Novo a Crébito
                     Lancamento.lcEDePara := 'S';
                     Lancamento.lcPeriodoEsp := True;
                     Lancamento.lcTestaConta := False;
                     if not Lancamento.InsereLancaContab('1',dEmpresa,1,dUsuario,
                                                         iPlanoVigente,
                                                         _lDataSet.FieldByName('UNIDNEGOC').AsFloat,
                                                         0,
                                                         _lDataSet.FieldByName('CODSUBCONTA').AsFloat,
                                                         _lDataSet.FieldByName('IDPLANOPREV').AsFloat,
                                                         _lDataSet.FieldByName('IDPATRO').AsFloat,
                                                         iPlnCodigo,0,
                                                         sDataRef,
                                                         'De/Para',
                                                         'Saldo Transferido pelo De/Para',
                                                         '',
                                                         '',
                                                         '',
                                                         '',
                                                         '03',
                                                         '',
                                                         '',
                                                         sCCustoPARA,
                                                         sContaPARA,
                                                         '',
                                                         _lDataSet.FieldByName('PLSCREDITOCOR').AsFloat,
                                                         False,(not _lDataSet.FieldByName('IDPLANOPREV').isnull),
                                                         // 05/01/04 - Alex 14451 - Nova estrutura de segregação
                                                         -1, -1) then begin
                        sMens := Lancamento.MessageInfo;
                        Raise Exception.Create(sMens);
                     end;
                     iPlnCodigo := Lancamento.RetornoPlnCodigo;
                  end;
                  //
                  if _lDataSet.FieldByName('PLSDEBITOCORRENTE').AsFloat <> 0 then begin
                     Lancamento.lcEDePara := 'S';
                     Lancamento.lcPeriodoEsp := True;
                     Lancamento.lcTestaConta := False;
                     if not Lancamento.InsereLancaContab('1',dEmpresa,1,dUsuario,
                                                         _lDataSet.FieldByName('PLANO').AsFloat,
                                                         _lDataSet.FieldByName('UNIDNEGOC').AsFloat,
                                                         0,
                                                         _lDataSet.FieldByName('CODSUBCONTA').AsFloat,
                                                         _lDataSet.FieldByName('IDPLANOPREV').AsFloat,
                                                         _lDataSet.FieldByName('IDPATRO').AsFloat,
                                                         iPlnCodigo,0,
                                                         sDataRef,
                                                         'De/Para',
                                                         'Saldo a ser Transferido pelo De/Para',
                                                         '',
                                                         '',
                                                         '',
                                                         '',
                                                         '03',
                                                         '',
                                                         '',
                                                         _lDataSet.FieldByName('CODCENTROCUSTO').AsString,
                                                         _lDataSet.FieldByName('PLACONTA').AsString,
                                                         '',
                                                         _lDataSet.FieldByName('PLSDEBITOCORRENTE').AsFloat,
                                                         False,(not _lDataSet.FieldByName('IDPLANOPREV').isnull),
                                                         // 05/01/04 - Alex 14451 - Nova estrutura de segregação
                                                         -1, -1) then begin
                        sMens := Lancamento.MessageInfo;
                        Raise Exception.Create(sMens);
                     end;
                     iPlnCodigo := Lancamento.RetornoPlnCodigo;
                     //
                     //
                     //Lança no Plano Novo a Débito
                     Lancamento.lcEDePara := 'S';
                     Lancamento.lcPeriodoEsp := True;
                     Lancamento.lcTestaConta := False;
                     if not Lancamento.InsereLancaContab('0',dEmpresa,1,dUsuario,
                                                         iPlanoVigente,
                                                         _lDataSet.FieldByName('UNIDNEGOC').AsFloat,
                                                         _lDataSet.FieldByName('CODSUBCONTA').AsFloat,
                                                         0,
                                                         _lDataSet.FieldByName('IDPLANOPREV').AsFloat,
                                                         _lDataSet.FieldByName('IDPATRO').AsFloat,
                                                         iPlnCodigo,0,
                                                         sDataRef,
                                                         'De/Para',
                                                         'Saldo Transferido pelo De/Para',
                                                         '',
                                                         '',
                                                         '',
                                                         '',
                                                         '03',
                                                         sCCustoPARA,
                                                         sContaPARA,
                                                         '',
                                                         '',
                                                         '',
                                                         _lDataSet.FieldByName('PLSDEBITOCORRENTE').AsFloat,
                                                         False,(not _lDataSet.FieldByName('IDPLANOPREV').isnull),
                                                         // 05/01/04 - Alex 14451 - Nova estrutura de segregação
                                                         -1, -1) then begin
                        sMens := Lancamento.MessageInfo;
                        Raise Exception.Create(sMens);
                     end;
                     iPlnCodigo := Lancamento.RetornoPlnCodigo;
                  end;
               end;
               _cdsSaldos.Next;
               FProgresso := FProgresso + 1;
               FNreg := FNreg + 1;
            End;
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
            MessageInfo := E.Message;
         End;
      End;
   End;
end;


function TCtrlProcessaContab.GeraRateioPorPrograma(dEmpresa,dModulo: Double;
  iUsuario, iPlano, iExercicio, iPeriodo: Integer; sTipoOper,
  sDataGera: string; bUsaPPatro: Boolean): Boolean;

var
    cTipoLanc :char;
    dAcuCor, dAcuOfi, dAcuGer, dAcuGer1, dAcuGer2, dAcuHist, dValCor,dPlnCodigo,dTotLanc : Double;
    dValLanc,dValOfi,dValGe1,dValGe2,dValGe3,dvalhistdeb,dTotal,dPercentual :Double;
    sMens,sContaD,sContaC,sCCustoD,sCCustoC,sNumDoc,sHistoricoOri,sHistPad,sConta,sCCusto,sHistorico : string;
    iSubContaC,iSubContaD,iModulo,iPlanoPrev,iPatro,iUnidNegoc,iCodPlano,iX :Integer;

   bFezRateio :Boolean;

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
      Result := Connection.AppServer.GeraRateioPorPrograma(dEmpresa,dModulo,iUsuario,
                   iPlano, iExercicio, iPeriodo,sTipoOper, sDataGera, bUsaPPatro,
                   FsMensAPS_Log);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
      Begin
         FsMensAPS_Log := Connection.AppServer.MessageInfo;
         MessageInfo   := 'Geração efetuada com sucesso!';
      End;

   End Else
   Begin
      FMaxProgresso := 0;
      FProgresso    := 0;
      bFezRateio    := False;
      sMens         := '';
      FsMensAPS_Log := '';
      MessageInfo   := '*';
      iModulo       := 1;
      dPlnCodigo    := 0;
      iSubContaD    := 0;
      iSubContaC    := 0;
      iUnidNegoc    := 0;
      Result        := True;

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


      //============ sql Insere CCusto ==========
      _sqlInsContasxCC.SQL.Clear;
      _sqlInsContasxCC.SQL.Add('INSERT INTO CONTASXCC                  ');
      _sqlInsContasxCC.SQL.Add('(PLANO, PLACONTA, CODCENTROCUSTO,      ');
      _sqlInsContasxCC.SQL.Add('IDEMPRESA, IDUSUARIOINCLUSAO)          ');
      _sqlInsContasxCC.SQL.Add('VALUES                                 ');
      _sqlInsContasxCC.SQL.Add('  (:PLANO, :PLACONTA, :CODCENTROCUSTO, ');
      _sqlInsContasxCC.SQL.Add('  :IDEMPRESA, :IDUSUARIOINCLUSAO)      ');
      //=========================================


      //=============== sql SaldosOPP ================
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
      _sqlSaldosOPP.SQL.Add('      (P.PLNEFETIVADO = ''S'') AND                                         ');
      _sqlSaldosOPP.SQL.Add('      (P.PLNDATDIA <= TO_DATE(:DATAREF,''DD/MM/YYYY'')) AND                ');
      _sqlSaldosOPP.SQL.Add('      (P.PLNCODIGO = L.PLNCODIGO)                                          ');
      _sqlSaldosOPP.SQL.Add('GROUP BY L.PLACONTA, L.CODCENTROCUSTO, L.IDEMPRESA, L.UNIDNEGOC,           ');
      _sqlSaldosOPP.SQL.Add('         L.IDPLANOPREV, L.IDPATRO, L.CODSUBCONTA                           ');
      //=========================================


      //=============== sql SaldosO ================
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
      //=========================================


      //========= sql verifica planilha ==========
      _sqlVerifPlanil.SQL.Clear;
      _sqlVerifPlanil.SQL.Add('SELECT PLNCODIGO, PLNPLANIL, PLNDATDIA ');
      _sqlVerifPlanil.SQL.Add('FROM PLANILHA                          ');
      _sqlVerifPlanil.SQL.Add('WHERE (PANCODIGO = :PANCODIGO) AND     ');
      _sqlVerifPlanil.SQL.Add('      (PLNDATDIA = TO_DATE(:DATAREF,''DD/MM/YYYY'')) AND ');
      _sqlVerifPlanil.SQL.Add('      (IDPESSOA  = :IDPESSOA) ');
      //=========================================

      //========= sql para saldos DPP  ==========
      _sqlSaldosDPP.SQL.Clear;
      _sqlSaldosDPP.SQL.Add('SELECT  /*+ INDEX LANCAMENTO */            ');
      _sqlSaldosDPP.SQL.Add('    SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,(L.LACVALOR*-1))) AS SALDOCOR ');
      _sqlSaldosDPP.SQL.Add('FROM PLANILHA P, LANCAMENTO L              ');
      _sqlSaldosDPP.SQL.Add('WHERE (P.PEREXERCICIO = :PEREXERCICIO) AND ');
      _sqlSaldosDPP.SQL.Add('      (P.PERNUMERO = :PERNUMERO) AND       ');
      _sqlSaldosDPP.SQL.Add('      (P.IDPESSOA  = :IDPESSOA) AND        ');
      _sqlSaldosDPP.SQL.Add('      (P.PLNDATDIA <= TO_DATE(:DATAREF,''DD/MM/YYYY'')) AND ');
      _sqlSaldosDPP.SQL.Add('      (L.PLACONTA  LIKE :PLACONTA) AND        ');
      _sqlSaldosDPP.SQL.Add('      (L.PLANO        = :PLANO) AND           ');
      _sqlSaldosDPP.SQL.Add('      (L.IDPLANOPREV  = :IDPLANOPREV) AND     ');
      _sqlSaldosDPP.SQL.Add('      (L.IDPATRO      = :IDPATRO) AND         ');
      _sqlSaldosDPP.SQL.Add('      (P.PLNCODIGO    = L.PLNCODIGO) AND      ');
      _sqlSaldosDPP.SQL.Add('      (P.PLNEFETIVADO = ''S'')                ');
      //=========================================

      //========= sql para saldos data ==========
      _sqlSaldosD.SQL.Clear;
      _sqlSaldosD.SQL.Add('SELECT  /*+ INDEX LANCAMENTO */            ');
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
      //=========================================

      //======== sql historico =================
      _sqlHistoPadrao.SQL.Clear;
      _sqlHistoPadrao.SQL.Add('SELECT HITCODHIST, HITDESCR1       ');
      _sqlHistoPadrao.SQL.Add('FROM HISTOPADRAO                   ');
      _sqlHistoPadrao.SQL.Add('WHERE (IDPESSOA = :IDPESSOA) AND   ');
      _sqlHistoPadrao.SQL.Add('      (HITCODHIST = :HITCODHIST)   ');
      //=========================================


      //========= sql para buscar conta ==========
      _sqlBuscaContaxCC.SQL.Clear;
      _sqlBuscaContaxCC.SQL.Add('SELECT CODCENTROCUSTO                       ');
      _sqlBuscaContaxCC.SQL.Add('FROM  CONTASXCC                             ');
      _sqlBuscaContaxCC.SQL.Add('WHERE (CODCENTROCUSTO =:CODCENTROCUSTO) AND ');
      _sqlBuscaContaxCC.SQL.Add('      (IDEMPRESA =:IDEMPRESA) AND           ');
      _sqlBuscaContaxCC.SQL.Add('      (PLACONTA = :PLACONTA) AND            ');
      _sqlBuscaContaxCC.SQL.Add('      (PLANO = :PLANO)                      ');
      //=========================================

       //====== Verifica se a planilha foi gerada ======
       _sqlPlanilhaGerada.SQL.Clear;
       _sqlPlanilhaGerada.SQL.Add('SELECT   PLNPLANIL           ');
       _sqlPlanilhaGerada.SQL.Add('FROM  PLANILHA               ');
       _sqlPlanilhaGerada.SQL.Add('WHERE  PLNCODIGO =:PLNCODIGO ');
      //=========================================

      //=========== Atualiza a tabela =========
      _sqlUpdPlanilha.SQL.Clear;
      _sqlUpdPlanilha.SQL.Add('UPDATE   PLANILHA            ');
      _sqlUpdPlanilha.SQL.Add('SET PANCODIGO = :PANCODIGO   ');
      _sqlUpdPlanilha.SQL.Add('WHERE  PLNCODIGO =:PLNCODIGO ');
      //=========================================

      //========== sql contas ref  ==============
       _sqlContasRef.SQL.Clear;
       _sqlContasRef.SQL.Add('SELECT  D.PLACONTA, D.PLANO, D.PANPERC ');
       _sqlContasRef.SQL.Add('FROM PREDETALHE D                      ');
       _sqlContasRef.SQL.Add('WHERE (D.PANCODIGO = :PANCODIGO) AND   ');
       _sqlContasRef.SQL.Add('      (D.PLACONTA IS NOT NULL)         ');
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

      If _cdsRateio.isEmpty then
      Begin
         Raise Exception.Create('Problemas na geração da Planilha: Tabela de Rateio Vazia.');
      End;

      _cdsRateio.First;

      While not _cdsRateio.EOF do
      Begin

        MessageInfo := 'a';
        FNomeRateio := _cdsRateio.FieldByName('PANDESCRICAO').AsString;

        Try

           StartTransaction;

           //== pega as contas de referencia ===
           _sqlContasRef.Prepare;
           _sqlContasRef.ParamByName('PANCODIGO').AsFloat := _cdsRateio.FieldByName('PANCODIGO').AsFloat;
           _cdsContasRef.Data := _sqlContasRef.Data;

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

           dTotal := 0;

           If (_cdsRateio.FieldByName('PANCONTAPERC').IsNull) or (_cdsRateio.FieldByName('PANCONTAPERC').AsString <> 'P') then
           Begin

              _cdsContasRef.First;
              While not _cdsContasRef.EOF do
              Begin

                If (_cdsRateio.FieldByName('IDPLANOPREV').IsNull) or (_cdsRateio.FieldByName('IDPATRO').isNull) then
                Begin
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
             _sqlSaldosO.Prepare;
             _sqlSaldosO.ParamByName('PLACONTA').AsString      := trim(_cdsRateio.FieldByName('PANCONTABASE').AsString)+'%';
             _sqlSaldosO.ParamByName('PLANO').AsInteger        := _cdsRateio.FieldByName('PLANO').AsInteger;
             _sqlSaldosO.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
             _sqlSaldosO.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
             _sqlSaldosO.ParamByName('IDPESSOA').AsFloat       := dEmpresa;
             _sqlSaldosO.ParamByName('DATAREF').AsString       := sDataGera;
             _cdsSaldosO.Data := _sqlSaldosO.Data;
             if _cdsSaldosO.IsEmpty then
             begin
               MessageInfo := chr(13) +'Rateio não processado dados os parâmetros:' + chr(13) +
                              'Conta:' +  trim(_cdsRateio.FieldByName('PANCONTABASE').AsString) + chr(13) +
                              'Plano:' +  IntToStr(_cdsRateio.FieldByName('PLANO').AsInteger) + chr(13) +
                              'Exercicio:' + IntToStr(iExercicio) + chr(13) +
                              'Período:' + IntToStr(iPeriodo) + chr(13) +
                              'Empresa:' + FloatToStr(dEmpresa) + chr(13) +
                              'Data:' + sDataGera + chr(13) + chr(13);
             end;
           End Else
           Begin
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
             if _cdsSaldosOPP.IsEmpty then
             begin
               MessageInfo := chr(13) +'Rateio não processado dados os parâmetros:' + chr(13) +
                              'Conta:' +  trim(_cdsRateio.FieldByName('PANCONTABASE').AsString) + chr(13) +
                              'Plano:' +  IntToStr(_cdsRateio.FieldByName('PLANO').AsInteger) + chr(13) +
                              'Exercicio:' + IntToStr(iExercicio) + chr(13) +
                              'Período:' + IntToStr(iPeriodo) + chr(13) +
                              'Empresa:' + FloatToStr(dEmpresa) + chr(13) +
                              'Data:' + sDataGera + chr(13) +
                              'Patrocinadora:' + IntToStr(_cdsRateio.FieldByName('IDPATRO').AsInteger) + chr(13) +
                              'Plano Previdenciario:' + IntToStr(_cdsRateio.FieldByName('IDPLANOPREV').AsInteger) + chr(13) + chr(13);
             end;
          End;

          sHistoricoOri := _cdsRateio.FieldByName('PANDESCRICAO').asString;
          sHistPad      := '';

          If not _cdsRateio.FieldByName('HITCODHIST').IsNull then
          Begin
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
                   End;
                   sHistorico := sHistoricoOri+' '+format('%18.7f', [dPercentual*100])+'%';

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

                   // Testa se conta existe no plano de conta antes
                   // efetuar o lancamento
                   if not ContaContabil.TestaContaContabilProc(iCodPlano,dEmpresa,iPeriodo,iExercicio,sConta,True,True) then
                   begin
                      sConta := trim(_cdsContasRef.FieldByName('PLACONTA').AsString);
                      if not ContaContabil.TestaContaContabilProc(iCodPlano,dEmpresa,iPeriodo,iExercicio,sConta,True,True) then
                      begin
                        sMens := ContaContabil.MessageInfo;
                        sMensAPS_Log := sMensAPS_Log + sMens + chr(13);
                        Raise Exception.Create(sMens);
                      end;
                   end;

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
                   MessageInfo := 'a';
                   FNomeCampo :=  sContaD;

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
                                                sDataGera,sNumDoc,HistoContab.Hist1,
                                                HistoContab.Hist2,HistoContab.Hist3,
                                                HistoContab.Hist4,HistoContab.Hist5,
                                                sTipoOper,sCCustoD,sContaD,
                                                sCCustoC,sContaC,sHistPad,
                                                dValLanc,False,bUsaPPatro,
                                                // 06/01/03 Alex 14451 - Nova segregação
                                                -1, -1) Then

                      Begin
                         sMensAPS_Log := sMensAPS_Log + Lancamento.MessageInfo + chr(13);
                         Raise Exception.Create(Lancamento.MessageInfo);
                      End Else
                      Begin
                         dPlnCodigo := Lancamento.RetornoPlnCodigo;
                         bFezRateio := True;


                      End;

                   End;
                   _cdsContasRef.Next;
                End;

                If Format('%17.2f',[dTotLanc]) <> Format('%17.2f',[_cdsSaldosO.FieldByName('SALDOCOR').AsFloat]) then
                Begin
                   sHistorico := sHistoricoOri+' - Arredondamento';

                   HistoContab.ArrumaHistorico(sHistorico);

                   dValLanc := StrToFloat(format('%18.2f', [(_cdsSaldosO.FieldByName('SALDOCOR').AsFloat-dTotLanc)]));

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
                                             sDataGera,sNumDoc,HistoContab.Hist1,
                                             HistoContab.Hist2,HistoContab.Hist3,
                                             HistoContab.Hist4,HistoContab.Hist5,
                                             sTipoOper,sCCustoD,sContaD,
                                             sCCustoC,sContaC,sHistPad,
                                             dValLanc,False,bUsaPPatro,
                                             // 06/01/03 Alex 14451 - Nova segregação
                                             -1, -1) Then

                   Begin
                      sMensAPS_Log := sMensAPS_Log + Lancamento.MessageInfo + chr(13);
                      Raise Exception.Create(Lancamento.MessageInfo);
                   End Else
                   Begin
                      dPlnCodigo := Lancamento.RetornoPlnCodigo;
                      bFezRateio := True;
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

                   HistoContab.ArrumaHistorico(sHistorico);

                   iX             := length(trim(_cdsContasRef.FieldByName('PLACONTA').AsString));
                   sConta         := trim(trim(_cdsContasRef.FieldByName('PLACONTA').AsString)+copy(_cdsSaldosOPP.FieldByName('PLACONTA').AsString,(iX+1),(18-iX)));
                   iCodPlano      := _cdsContasRef.FieldByName('PLANO').AsInteger;

                   dValCor        := (_cdsSaldosOPP.FieldByName('SALDOCOR').AsFloat * dPercentual);

                   If _cdsSaldosOPP.FieldByName('UNIDNEGOC').AsString = '' then
                      iUnidNegoc := 0
                   Else
                      iUnidNegoc := StrToInt(_cdsSaldosOPP.FieldByName('UNIDNEGOC').AsString);

                   // Testa se conta existe no plano de conta antes
                   // efetuar o lancamento
                   if not ContaContabil.TestaContaContabilProc(iCodPlano,dEmpresa,iPeriodo,iExercicio,sConta,True,True) then
                   begin
                      sConta := trim(_cdsContasRef.FieldByName('PLACONTA').AsString);
                      if not ContaContabil.TestaContaContabilProc(iCodPlano,dEmpresa,iPeriodo,iExercicio,sConta,True,True) then
                      begin
                        sMens := ContaContabil.MessageInfo;
                        sMensAPS_Log := sMensAPS_Log + sMens + chr(13);
                        Raise Exception.Create(sMens);
                      end;
                   end;

                   sContaD   := sConta;
                   sCCustoD  := _cdsSaldosOPP.FieldByName('CODCENTROCUSTO').AsString;

                   MessageInfo := 'a';
                   FNomeCampo :=  sContaD;

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
                   MessageInfo := 'a';
                   FNomeCampo := sContaD;

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
                                                sDataGera,sNumDoc,HistoContab.Hist1,
                                                HistoContab.Hist2,HistoContab.Hist3,
                                                HistoContab.Hist4,HistoContab.Hist5,
                                                sTipoOper,sCCustoD,sContaD,
                                                sCCustoC,sContaC,sHistPad,
                                                dValLanc,False,bUsaPPatro,
                                                // 06/01/03 Alex 14451 - Nova segregação
                                                -1, -1) Then

                      Begin
                         sMensAPS_Log := sMensAPS_Log + Lancamento.MessageInfo + chr(13);
                         Raise Exception.Create(Lancamento.MessageInfo);
                      End Else
                      Begin
                         dPlnCodigo := Lancamento.RetornoPlnCodigo;
                         bFezRateio := True;
                      End;
                   End;
                   _cdsContasRef.Next;
                End;

                If Format('%17.2f',[dTotLanc]) <> Format('%17.2f',[_cdsSaldosOPP.FieldByName('SALDOCOR').AsFloat]) then
                Begin
                   sHistorico := sHistoricoOri+' - Arredondamento';

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
                                             sDataGera,sNumDoc,HistoContab.Hist1,
                                             HistoContab.Hist2,HistoContab.Hist3,
                                             HistoContab.Hist4,HistoContab.Hist5,
                                             sTipoOper,sCCustoD,sContaD,
                                             sCCustoC,sContaC,sHistPad,
                                             dValLanc,False,bUsaPPatro,
                                             // 06/01/03 Alex 14451 - Nova segregação
                                             -1, -1) Then

                   Begin
                      sMensAPS_Log := sMensAPS_Log + Lancamento.MessageInfo + chr(13);
                      Raise Exception.Create(Lancamento.MessageInfo);
                   End Else
                   Begin
                      dPlnCodigo := Lancamento.RetornoPlnCodigo;
                      bFezRateio := True;
                   End;
                End;
                _cdsSaldosOPP.Next;
             End;
          End;

          //=========== Atualiza a tabela =========
          _sqlUpdPlanilha.Prepare;
          _sqlUpdPlanilha.ParamByName('PANCODIGO').asFloat := _cdsRateio.FieldByName('PANCODIGO').AsFloat;
          _sqlUpdPlanilha.ParamByName('PLNCODIGO').asFloat := dPlnCodigo;

          If not ExecSQL(_sqlUpdPlanilha.SQLChanged,False) Then
          Begin
             sMens := 'Erro ao Atualizar a Tabela PLANILHA.';
             Raise Exception.Create(sMens);
          End;

          _sqlPlanilhaGerada.Prepare;
          _sqlPlanilhaGerada.ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
          _cdsPlanilhaGerada.Data := _sqlPlanilhaGerada.Data;

          If not _cdsPlanilhaGerada.isEmpty then
          Begin
             MessageInfo := 'Gerada a Planilha no. ' + _cdsPlanilhaGerada.FieldByName('PLNPLANIL').asString  + chr(13);
             sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
          End;

         If not Padroes.GravaLogOperacoes(dEmpresa,dModulo,iUsuario, 'Rateio Por Programa',False) then
            Raise Exception.Create( Padroes.MessageInfo );

          Commit;

        Except
           on E:Exception Do
           Begin
              Result := False;
              RollBack;

              MessageInfo := 'Problemas na geração da Planilha '+_cdsRateio.FieldByName('PANDESCRICAO').AsString;

              sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
              sMensAPS_Log := sMensAPS_Log + '**************************************************' + chr(13);
              MessageInfo  := E.Message;
              Break;
           End
        End;

        If Result = True Then
        Begin
          FProgresso := FProgresso + 1;
          _cdsRateio.Next;
        End;

      End;
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


      If bFezRateio = True Then
      Begin
         MessageInfo := 'Planilhas de Rateio geradas com sucesso!';
         sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
         sMensAPS_Log := sMensAPS_Log + '**************************************************' + chr(13);
      End Else
      Begin
         MessageInfo := 'Não há Dados para Gerar Planilhas de Rateio';
         sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
         sMensAPS_Log := sMensAPS_Log + '**************************************************' + chr(13);

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

        MessageInfo := 'a';
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
                                                     dValLanc,False,bUsaPPatro,
                                                     // 06/01/03 Alex 14451 - Nova segregação
                                                     -1, -1) Then

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
                                                     dValLanc,False,bUsaPPatro,
                                                     // 06/01/03 Alex 14451 - Nova segregação
                                                     -1, -1) Then

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
                                               dValLanc,False,bUsaPPatro,
                                               // 06/01/03 Alex 14451 - Nova segregação
                                               -1, -1) Then

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

procedure TCtrlProcessaContab.OnCreateAppServer;
begin
  inherited;
  FcdsEmpresasSel        := TClientDataSet.Create(nil);
  FCdsVerificaBloqueados := TClientDataSet.Create(nil);
  FcdsDiariasDBF         := TClientDataSet.Create(nil);
  FcdsLancamentosDBF     := TClientDataSet.Create(nil);
end;

procedure TCtrlProcessaContab.SetcdsEmpreasSel(
  const Value: TClientDataSet);
begin
  FcdsEmpresasSel := Value;
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

   _sqlSaldoOrc.Prepare;
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
      Prepare;
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
     if iPeriodo = 0 then begin
        if not DeletaSaldoContas(dEmpresa,iExercicio,iPeriodo,true,true,tcAmbas,tpSoAnterior) then
        Begin
           Result := False;
           Exit;
        End;
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
           Prepare;
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
           Prepare;
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

function TCtrlProcessaContab.ListaEmpConsolidado(dPessoa:Double): OleVariant;
var  sSql :string;
begin
     sSql := 'SELECT E.NOMEEMPRESA, E.TIPOEMPRESA, E.IDPESSOA, '' '' as SEL '+
             'FROM  EMPRESAPROP E '+
             'WHERE ' +
             '  (E.IDPESSOA <> '+ FloatToStr(dPessoa) + ') ' +
             'ORDER BY E.NOMEEMPRESA ';

     Result := GetDataPacket(sSql);
end;

function TCtrlProcessaContab.ProcessaAtuMoeda(dEmpresa,dModulo: Double;iUsuario,iPlano,
         iExercicio,iPeriodo:integer; sHistorico,sCodHist,sTipoOper,sTipoFecha,
         sDataLanc,sPerdaGanho:string;dtDataIni,dtDataFim:TDateTime;bUsaPPatro:Boolean): Boolean;

var
    dValLanc,dTxJuros,dValorCotAux,dValorCot,dPlnCodigo : Double;
    iPatro, iPlanoPrev: LongInt;
    bPrimVez: Boolean;
    sNumDoc, sMens : String;
    sContaD, sContaC, sCCustoD, sCCustoC  :string;
    iSubContaD, iSubContaC,iModulo,iUnidNegoc : Integer;
    dtDataLancAnt,dDataIni : TDateTime;
    cTipoLanc :char;

  _sqlPlanoConta :TCMSqlParams;
  _cdsPlanoConta :TClientDataSet;

  _sqlMoeda :TCMSqlParams;
  _cdsMoeda :TClientDataSet;

  _sqlCotacaoMoeda :TCMSqlParams;
  _cdsCotacaoMoeda :TClientDataSet;

  _sqlSaldo :TCMSqlParams;
  _cdsSaldo :TClientDataSet;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ProcessaAtuMoeda(dEmpresa,dModulo,iUsuario,iPlano,
               iExercicio,iPeriodo,sHistorico,sCodHist,sTipoOper,sTipoFecha,
                sDataLanc,sPerdaGanho,dtDataIni,dtDataFim,bUsaPPatro,FsMensAPS_Log);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
         MessageInfo := 'Atualização de Moeda efetuada com sucesso!';

   End Else
   Begin
      FMaxProgresso := 0;
      FProgresso    := 0;
      sMens         := '';
      FsMensAPS_Log := '';
      MessageInfo   := '*';
      iModulo       := 1;
      dPlnCodigo    := 0;
      Result        := True;

      HistoContab.ArrumaHistorico(sHistorico);

      Lancamento.lcTipConvGe2Cre := 'N';
      Lancamento.lcTipConvGerCre := 'N';
      Lancamento.lcTipConvOfiCre := 'N';
      Lancamento.lcTipConvGe1Cre := 'N';
      Lancamento.lcTipConvGe2Deb := 'N';
      Lancamento.lcTipConvGerDeb := 'N';
      Lancamento.lcTipConvOfiDeb := 'N';
      Lancamento.lcTipConvGe1Deb := 'N';

      sNumDoc        := 'Atualiza Moeda';
      cTipoLanc      := '2';
      dtDataLancAnt  := StrToDate(sDataLanc) -1;

      //=============================================================
      _sqlSaldo  := TCMSqlParams.Create(nil);
      _sqlSaldo.ControlObject := Self;
      _cdsSaldo   := TClientDataSet.Create(nil);

      _sqlSaldo.SQL.Clear;
      _sqlSaldo.SQL.Add('SELECT U.IDPLANOPREV, U.IDPATRO, U.UNIDNEGOC,                                     ');
      _sqlSaldo.SQL.Add('       U.CODCENTROCUSTO, U.CODSUBCONTA,                                           ');
      _sqlSaldo.SQL.Add('       SUM(U.SALDO) AS SALDO, SUM(U.SALDOHIST) AS SALDOHIST                       ');
      _sqlSaldo.SQL.Add('FROM                                                                              ');
      _sqlSaldo.SQL.Add('  ((SELECT IDPLANOPREV, IDPATRO, UNIDNEGOC,                                       ');
      _sqlSaldo.SQL.Add('           CODCENTROCUSTO, CODSUBCONTA,                                           ');
      _sqlSaldo.SQL.Add('       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)                  ');
      _sqlSaldo.SQL.Add('       - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDO,                 ');
      _sqlSaldo.SQL.Add('       SUM(DECODE(PLSDEBITOHIST, NULL, 0, PLSDEBITOHIST)                          ');
      _sqlSaldo.SQL.Add('       - DECODE(PLSCREDITOHIST, NULL, 0, PLSCREDITOHIST)) AS SALDOHIST            ');
      _sqlSaldo.SQL.Add('    FROM PLANOSALDO                                                               ');
      _sqlSaldo.SQL.Add('    WHERE (PLANO =:PLANO) AND                                                     ');
      _sqlSaldo.SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                                          ');
      _sqlSaldo.SQL.Add('          ((PERNUMERO <:PERIODO) OR (PERNUMERO IS NULL)) AND                      ');
      _sqlSaldo.SQL.Add('          (IDPESSOA =:IDPESSOA) AND                                               ');
      _sqlSaldo.SQL.Add('          (PLACONTA = :CONTAINIL)                                                 ');
      _sqlSaldo.SQL.Add('    GROUP BY                                                                      ');
      _sqlSaldo.SQL.Add('          IDPLANOPREV, IDPATRO, UNIDNEGOC,                                        ');
      _sqlSaldo.SQL.Add('          CODCENTROCUSTO, CODSUBCONTA                                             ');
      _sqlSaldo.SQL.Add('          )                                                                       ');
      _sqlSaldo.SQL.Add(' UNION ALL                                                                        ');
      _sqlSaldo.SQL.Add('   (SELECT L.IDPLANOPREV, L.IDPATRO, L.UNIDNEGOC,                                 ');
      _sqlSaldo.SQL.Add('           L.CODCENTROCUSTO, L.CODSUBCONTA,                                       ');
      _sqlSaldo.SQL.Add('           SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,L.LACVALOR*-1)) AS SALDO,        ');
      _sqlSaldo.SQL.Add('           SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALHIST,L.LACVALHIST*-1)) AS SALDOHIST ');
      _sqlSaldo.SQL.Add('    FROM PLANILHA P, LANCAMENTO L                                                 ');
      _sqlSaldo.SQL.Add('    WHERE (L.PLANO =:PLANO) AND                                                   ');
      _sqlSaldo.SQL.Add('          (P.PEREXERCICIO =:EXERCICIO) AND                                        ');
      _sqlSaldo.SQL.Add('          (P.PERNUMERO =:PERIODO) AND                                             ');
      _sqlSaldo.SQL.Add('          (P.IDPESSOA =:IDPESSOA) AND                                             ');
      _sqlSaldo.SQL.Add('          (P.PLNDATDIA <= TO_DATE(:DATAREF,''DD/MM/YYYY'')) AND                     ');
      _sqlSaldo.SQL.Add('          (P.PLNEFETIVADO = ''S'') AND                                              ');
      _sqlSaldo.SQL.Add('          (P.PLNCODIGO = L.PLNCODIGO) AND                                         ');
      _sqlSaldo.SQL.Add('          (L.PLACONTA = :CONTAINIL)                                               ');
      _sqlSaldo.SQL.Add('    GROUP BY                                                                      ');
      _sqlSaldo.SQL.Add('          L.IDPLANOPREV, L.IDPATRO, L.UNIDNEGOC,                                  ');
      _sqlSaldo.SQL.Add('          L.CODCENTROCUSTO, L.CODSUBCONTA)                                        ');
      _sqlSaldo.SQL.Add('          ) U                                                                     ');
      _sqlSaldo.SQL.Add('GROUP BY                                                                          ');
      _sqlSaldo.SQL.Add('       U.IDPLANOPREV, U.IDPATRO, U.UNIDNEGOC,                                     ');
      _sqlSaldo.SQL.Add('       U.CODCENTROCUSTO, U.CODSUBCONTA                                            ');
      //=============================================================
      _sqlCotacaoMoeda  := TCMSqlParams.Create(nil);
      _sqlCotacaoMoeda.ControlObject := Self;
      _cdsCotacaoMoeda   := TClientDataSet.Create(nil);

      _sqlCotacaoMoeda.SQL.Clear;
      _sqlCotacaoMoeda.SQL.Add('SELECT COTDATA, COTVALOR         ');
      _sqlCotacaoMoeda.SQL.Add('FROM COTACAOMOEDA                ');
      _sqlCotacaoMoeda.SQL.Add('WHERE (MOECODIGO = :MOECODIGO)   ');
      _sqlCotacaoMoeda.SQL.Add('  AND (COTDATA >= :DATAINI)      ');
      _sqlCotacaoMoeda.SQL.Add('  AND (COTDATA  <= :DATAFIM)     ');
      _sqlCotacaoMoeda.SQL.Add('ORDER BY COTDATA                 ');
      //=============================================================
      _sqlMoeda  := TCMSqlParams.Create(nil);
      _sqlMoeda.ControlObject := Self;
      _cdsMoeda  := TClientDataSet.Create(nil);

      _sqlMoeda.SQL.Clear;
      _sqlMoeda.SQL.Add('SELECT MOEPERIODICIDADE, FLGPERCVALOR ');
      _sqlMoeda.SQL.Add('FROM MOEDA                            ');
      _sqlMoeda.SQL.Add('WHERE (MOECODIGO = :MOECODIGO)        ');
      //=============================================================
      _sqlPlanoConta  := TCMSqlParams.Create(nil);
      _sqlPlanoConta.ControlObject := Self;
      _cdsPlanoConta  := TClientDataSet.Create(nil);

      _sqlPlanoConta.SQL.Clear;
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

      if _cdsPlanoConta.IsEmpty then
      begin
         MessageInfo := 'Não existe nenhum Dados a ser Processado com estes Parâmetros.';
         sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
         Result := False;
         _cdsPlanoConta.free;
         _sqlPlanoConta.free;
         _sqlMoeda.free;
         _cdsMoeda.free;
         _sqlCotacaoMoeda.free;
         _cdsCotacaoMoeda.free;
         _sqlSaldo.free;
         _cdsSaldo.free;
         Exit;
      end;

      Try
         StartTransaction;
         If not Padroes.GravaLogOperacoes(dEmpresa,dModulo,iUsuario, 'Atualiza Moeda',False) then
            Raise Exception.Create( Padroes.MessageInfo );
         Commit;
      Except
         On E:Exception Do
         Begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
            Exit;
         End;
      End;


      FMaxProgresso := _cdsPlanoConta.RecordCount;
      FProgresso := 0;

      _cdsPlanoConta.First;
      While not _cdsPlanoConta.EOF do
      Begin
         MessageInfo := 'a';
         FNomeCampo := 'Gerando Atualização da Conta: '+ _cdsPlanoConta.FieldByName('PLACONTA').AsString;

         Try
            StartTransaction;

            If not _cdsPlanoConta.FieldByName('PLAMOEDAHISTORICA').IsNull then
            Begin
               _sqlMoeda.Prepare;
               _sqlMoeda.ParamByName('MOECODIGO').AsInteger := _cdsPlanoConta.FieldByName('PLAMOEDAHISTORICA').AsInteger;
               _cdsMoeda.Data := _sqlMoeda.Data;
               //
               if _cdsMoeda.FieldByName('MOEPERIODICIDADE').AsString = 'D' then
               begin
                  if sTipoFecha = 'D' then
                  begin
                     dValorCot := Contab.TestaCotacaoMoeda(_cdsPlanoConta.FieldByName('PLAMOEDAHISTORICA').AsInteger,StrToDate(sDataLanc),True);
                     if dValorCot = 0 then
                     begin
                        sMens := 'Cotação da Moeda Histórica da Conta '+_cdsPlanoConta.FieldByName('PLACONTA').AsString+' não cadastrada para o dia '+sDataLanc;
                        sMensAPS_Log := sMensAPS_Log + sMens + chr(13);
                        Raise Exception.Create(sMens);
                     end;
                     if _cdsMoeda.FieldByName('FLGPERCVALOR').AsString = 'P' then
                     begin
                        dValorCot := 1 + (dValorCot/100);
                     end else
                     begin
                        dValorCotAux := Contab.TestaCotacaoMoeda(_cdsPlanoConta.FieldByName('PLAMOEDAHISTORICA').AsFloat,dtDataLancAnt,True);
                        if dValorCotAux = 0 then
                        begin
                           sMens := 'Cotação da Moeda Histórica da Conta '+_cdsPlanoConta.FieldByName('PLACONTA').AsString+' não cadastrada para o dia '+DateToStr(dtDataLancAnt);
                           sMensAPS_Log := sMensAPS_Log + sMens + chr(13);
                           Raise Exception.Create(sMens);
                        end;
                        dValorCot := dValorCot/dValorCotAux;
                     end;
                  end else
                  begin
                     dDataIni := dtDataIni - 1;
                     if _cdsMoeda.FieldByName('FLGPERCVALOR').AsString = 'P' then
                     begin
                        _sqlCotacaoMoeda.Prepare;
                        _sqlCotacaoMoeda.ParamByName('MOECODIGO').AsInteger := _cdsPlanoConta.FieldByName('PLAMOEDAHISTORICA').AsInteger;
                        _sqlCotacaoMoeda.ParamByName('DATAINI').AsDate      := dtDataIni;
                        _sqlCotacaoMoeda.ParamByName('DATAFIM').AsDate      := dtDataFim;
                        _cdsCotacaoMoeda.Data := _sqlCotacaoMoeda.Data;
                        //
                        bPrimVez  := True;
                        dValorCot := 0;
                        _cdsCotacaoMoeda.First;
                        While not _cdsCotacaoMoeda.EOF do
                        begin
                           dValorCotAux := ((_cdsCotacaoMoeda.FieldByName('COTVALOR').AsFloat/100)+1);
                           if bPrimVez then
                           begin
                              dValorCot := dValorCotAux;
                              bPrimVez  := False;
                           end else
                           begin
                              dValorCot := dValorCot * dValorCotAux;
                           end;
                           _cdsCotacaoMoeda.Next;
                        end;
                     end else
                     begin
                        dValorCot := Contab.TestaCotacaoMoeda(_cdsPlanoConta.FieldByName('PLAMOEDAHISTORICA').AsFloat,dtDataFim,false);
                        if dValorCot = 0 then
                        begin
                           sMens := 'Cotação da Moeda Histórica da Conta '+_cdsPlanoConta.FieldByName('PLACONTA').AsString+' não cadastrada para o dia '+sDataLanc;
                           sMensAPS_Log := sMensAPS_Log + sMens + chr(13);
                           Raise Exception.Create(sMens);
                        end;
                        dValorCotAux := Contab.TestaCotacaoMoeda(_cdsPlanoConta.FieldByName('PLAMOEDAHISTORICA').AsFloat,dDataIni,false);
                        if dValorCotAux = 0 then
                        begin
                           sMens := 'Cotação da Moeda Histórica da Conta '+_cdsPlanoConta.FieldByName('PLACONTA').AsString+' não cadastrada para o dia '+DateToStr(dtDataLancAnt);
                           sMensAPS_Log := sMensAPS_Log + sMens + chr(13);
                           Raise Exception.Create(sMens);
                        end;
                        dValorCot := dValorCot/dValorCotAux;
                     end;
                  end;
               end else
               begin
                  dDataIni := dtDataIni - 1;
                  dValorCot := Contab.TestaCotacaoMoeda(_cdsPlanoConta.FieldByName('PLAMOEDAHISTORICA').AsFloat,dtDataFim,false);
                  if dValorCot = 0 then
                  begin
                     sMens := 'Cotação da Moeda Histórica da Conta '+_cdsPlanoConta.FieldByName('PLACONTA').AsString+' não cadastrada para o dia '+sDataLanc;
                     sMensAPS_Log := sMensAPS_Log + sMens + chr(13);
                     Raise Exception.Create(sMens);
                  end;
                  if _cdsMoeda.FieldByName('FLGPERCVALOR').AsString = 'P' then
                  begin
                     dValorCot := 1 + (dValorCot/100);
                  end else
                  begin
                     dValorCotAux := Contab.TestaCotacaoMoeda(_cdsPlanoConta.FieldByName('PLAMOEDAHISTORICA').AsFloat,dDataIni,false);
                     if dValorCotAux = 0 then
                     begin
                        sMens := 'Cotação da Moeda Histórica da Conta '+_cdsPlanoConta.FieldByName('PLACONTA').AsString+' não cadastrada para o dia '+DateToStr(dtDataLancAnt);
                        sMensAPS_Log := sMensAPS_Log + sMens + chr(13);
                        Raise Exception.Create(sMens);
                     end;
                     dValorCot := dValorCot/dValorCotAux;
                  end;
                  if sTipoFecha = 'D' then
                     dValorCot := Power(dValorCot,(1/(dtDataFim - dtDataIni)));
               end;

               //=== calcula saldo ===
               with _sqlSaldo do begin
                  Prepare;
                  ParamByName('CONTAINIL').AsString  := copy(_cdsPlanoConta.FieldByName('PLACONTA').AsString+'                  ',1,18);
                  ParamByName('DATAREF').AsString    := sDataLanc;
                  ParamByName('EXERCICIO').AsInteger := iExercicio;
                  ParamByName('PERIODO').AsInteger   := iPeriodo;
                  ParamByName('PLANO').AsInteger     := iPlano;
                  ParamByName('IDPESSOA').AsFloat   := dEmpresa;
                  _cdsSaldo.Data := Data;
               end;

               _cdsSaldo.First;
               While not _cdsSaldo.EOF do
               Begin
                  dValLanc := _cdsSaldo.FieldByName('SALDO').AsFloat*(dValorCot-1);
                  dValLanc := StrToFloat(format('%18.2f', [dValLanc]));

                  If dValLanc <> 0 then
                  Begin

                     if _cdsSaldo.FieldByName('UNIDNEGOC').AsString = '' then
                        iUnidNegoc := 0
                     else
                        iUnidNegoc := StrToint(_cdsSaldo.FieldByName('UNIDNEGOC').AsString);

                     sContaD    := _cdsPlanoConta.FieldByName('PLACONTA').AsString;

                     if _cdsPlanoConta.FieldByName('PLACONTRAPARTIDA').IsNull then
                        sContaC := sPerdaGanho
                     else
                        sContaC := _cdsPlanoConta.FieldByName('PLACONTRAPARTIDA').AsString;

                     sCCustoD    := _cdsSaldo.FieldByName('CODCENTROCUSTO').AsString;
                     sCCustoC    := _cdsSaldo.FieldByName('CODCENTROCUSTO').AsString;

                     If _cdsSaldo.FieldByName('CODSUBCONTA').AsString = '' then
                        iSubContaD := 0
                     Else
                        iSubContaD := StrToInt(_cdsSaldo.FieldByName('CODSUBCONTA').AsString);

                     If _cdsSaldo.FieldByName('CODSUBCONTA').AsString = '' then
                        iSubContaC := 0
                     Else
                        iSubContaC := StrToInt(_cdsSaldo.FieldByName('CODSUBCONTA').AsString);

                     if _cdsSaldo.FieldByName('IDPLANOPREV').IsNull then
                        iPlanoPrev := 0
                     else
                        iPlanoPrev := _cdsSaldo.FieldByName('IDPLANOPREV').AsInteger;
                     if _cdsSaldo.FieldByName('IDPATRO').IsNull then
                        iPatro := 0
                     else
                        iPatro := _cdsSaldo.FieldByName('IDPATRO').AsInteger;

                     Lancamento.lcTestaConta := True;
                     If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                               iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                               iPlanoPrev, iPatro,dPlnCodigo,0,
                                               sDataLanc,sNumDoc,HistoContab.Hist1,
                                               HistoContab.Hist2,HistoContab.Hist3,
                                               HistoContab.Hist4,HistoContab.Hist5,
                                               sTipoOper,sCCustoD,sContaD,
                                               sCCustoC,sContaC,sHistorico,
                                               dValLanc,False,bUsaPPatro,
                                               // 06/01/03 Alex 14451 - Nova segregação
                                               -1, -1) Then

                     Begin
                        sMensAPS_Log := sMensAPS_Log + Lancamento.MessageInfo + chr(13);
                        sMens := Lancamento.MessageInfo;
                        Raise Exception.Create(Lancamento.MessageInfo);
                     End Else
                     Begin
                        dPlnCodigo := Lancamento.RetornoPlnCodigo;
                     End;

                  End;
                  _cdsSaldo.Next;
               End;
            End;

            If (not _cdsPlanoConta.FieldByName('PLATXJUROS').IsNull) and
               (_cdsPlanoConta.FieldByName('PLATXJUROS').AsFloat <> 0) then
            Begin

               //=== calcula saldo ===
               with _sqlSaldo do begin
                  Prepare;
                  ParamByName('CONTAINIL').AsString  := copy(_cdsPlanoConta.FieldByName('PLACONTA').AsString +'                  ',1,18);
                  ParamByName('DATAREF').AsString    := sDataLanc;
                  ParamByName('EXERCICIO').AsInteger := iExercicio;
                  ParamByName('PERIODO').AsInteger   := iPeriodo;
                  ParamByName('PLANO').AsInteger     := iPlano;
                  ParamByName('IDPESSOA').AsFloat    := dEmpresa;
                  _cdsSaldo.Data := Data;
               end;

               _cdsSaldo.First;
               While not _cdsSaldo.EOF do
               Begin
                  if sTipoFecha = 'D' then
                     dTxJuros := (Power((1+(_cdsPlanoConta.FieldByName('PLATXJUROS').AsFloat/100)),(1/(dtDataFim - dtDataIni))) - 1)
                  else
                     dTxJuros := (_cdsPlanoConta.FieldByName('PLATXJUROS').AsFloat/100);
                  //
                  dValLanc    := _cdsSaldo.FieldByName('SALDO').AsFloat * dTxJuros;
                  dValLanc    := StrToFloat(format('%18.2f', [dValLanc]));
                  if dValLanc <> 0 then
                  begin
                     if _cdsSaldo.FieldByName('UNIDNEGOC').AsString = '' then
                        iUnidNegoc := 0
                     else
                        iUnidNegoc := StrToint(_cdsSaldo.FieldByName('UNIDNEGOC').AsString);

                     sContaD    := _cdsPlanoConta.FieldByName('PLACONTA').AsString;

                     if _cdsPlanoConta.FieldByName('PLACONTRAPTXJUROS').IsNull then
                        sContaC := sPerdaGanho
                     else
                        sContaC := _cdsPlanoConta.FieldByName('PLACONTRAPTXJUROS').AsString;

                     sCCustoD    := _cdsSaldo.FieldByName('CODCENTROCUSTO').AsString;
                     sCCustoC    := _cdsSaldo.FieldByName('CODCENTROCUSTO').AsString;

                     if _cdsSaldo.FieldByName('CODSUBCONTA').AsString = '' then
                        iSubContaD := 0
                     else
                        iSubContaD := StrToInt(_cdsSaldo.FieldByName('CODSUBCONTA').AsString);

                     if _cdsSaldo.FieldByName('CODSUBCONTA').AsString = '' then
                        iSubContaC := 0
                     else
                        iSubContaC := StrToInt(_cdsSaldo.FieldByName('CODSUBCONTA').AsString);

                     if _cdsSaldo.FieldByName('IDPLANOPREV').IsNull then
                        iPlanoPrev := 0
                     else
                        iPlanoPrev := _cdsSaldo.FieldByName('IDPLANOPREV').AsInteger;

                     if _cdsSaldo.FieldByName('IDPATRO').IsNull then
                        iPatro := 0
                     else
                        iPatro := _cdsSaldo.FieldByName('IDPATRO').AsInteger;

                        Lancamento.lcTestaConta := True;
                        If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                  iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                  iPlanoPrev, iPatro,dPlnCodigo,0,
                                                  sDataLanc,sNumDoc,HistoContab.Hist1,
                                                  HistoContab.Hist2,HistoContab.Hist3,
                                                  HistoContab.Hist4,HistoContab.Hist5,
                                                  sTipoOper,sCCustoD,sContaD,
                                                  sCCustoC,sContaC,sHistorico,
                                                  dValLanc,False,bUsaPPatro,
                                                  // 06/01/03 Alex 14451 - Nova segregação
                                                  -1, -1) Then

                        Begin
                           sMensAPS_Log := sMensAPS_Log + Lancamento.MessageInfo + chr(13);
                           sMens := Lancamento.MessageInfo;
                           Raise Exception.Create(Lancamento.MessageInfo);
                        End Else
                        Begin
                           dPlnCodigo := Lancamento.RetornoPlnCodigo;
                        End;

                  End;
                  _cdsSaldo.Next;
               End;
            End;
            Commit;

         Except
           on E:Exception Do
           Begin
              _cdsPlanoConta.free;
              _sqlPlanoConta.free;
              _sqlMoeda.free;
              _cdsMoeda.free;
              _sqlCotacaoMoeda.free;
              _cdsCotacaoMoeda.free;
              _sqlSaldo.free;
              _cdsSaldo.free;

              RollBack;
              Result := False;
              FNomeCampo  := '';
              MessageInfo := 'Problemas na geração da Conta '+_cdsPlanoConta.FieldByName('PLACONTA').AsString;

              sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);

              FProgresso := 0;
              MessageInfo := sMens+' '+E.Message;
              Break;
           End
         End;

         FProgresso := FProgresso + 1;
         _cdsPlanoConta.Next;
      End;

      If Result then
      Begin
         _cdsPlanoConta.free;
         _sqlPlanoConta.free;
         _sqlMoeda.free;
         _cdsMoeda.free;
         _sqlCotacaoMoeda.free;
         _cdsCotacaoMoeda.free;
         _sqlSaldo.free;
         _cdsSaldo.free;
         MessageInfo := 'Atualização de Moeda efetuada com sucesso!';
         sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
      End;
  End;

end;

function TCtrlProcessaContab.VerificaBloqueados(dEmpresa:Double;iUsuario:Integer;
                                      bUsaPPatro:Boolean): Boolean;
var
  sSql,sMens :string;
  iModulo :Integer;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.VerificaBloqueados(dEmpresa,iUsuario,bUsaPPatro,
                                   FcdsVerificaBloqueados.Data);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
         MessageInfo := 'Exclusão Efetuada com Sucesso.';

   End Else
   Begin
      sMens       := '';
      MessageInfo := '*';
      iModulo     := 1;

      Try
          StartTransaction;


          FcdsVerificaBloqueados.First;
          while not FcdsVerificaBloqueados.Eof do
          begin
             sSql := 'UPDATE PERIODO SET PERBLOQUE = ''N'' WHERE (PERBLOQUE = ''S'') AND PERNUMERO = ' + FcdsVerificaBloqueados.FieldByName('PERNUMERO').AsString +
                     ' AND PEREXERCICIO = ' + FcdsVerificaBloqueados.FieldByName('PEREXERCICIO').AsString + ' AND IDPESSOA = ' + FloatToStr(dempresa);

             Result := ExecSql(sSql);

             if Not Result then
             begin
               sMens := 'Erro ao Atualizar a Tabela PERIODO.';
               Raise Exception.Create(sMens);
             end;

             If not Lancamento.ExcluiLancaContab(iUsuario,FcdsVerificaBloqueados.FieldByName('PLNCODIGO').asInteger,
                                iModulo,0,bUsaPPatro, False) Then
             Begin
                 sMens := Lancamento.MessageInfo;
                 Raise Exception.Create(sMens);
             End;

             sSql := 'UPDATE PLANILHA SET PLNEFETIVADO = ''S'' WHERE (PLNCODIGO = '+ cdsVerificaBloqueados.FieldByName('PLNCODIGO').AsString +')';
             Result := ExecSql(sSql);

             if Not Result then
             begin
               sMens := 'Erro ao Atualizar a Tabela PLANILHA.';
               Raise Exception.Create(sMens);
             end;

             cdsVerificaBloqueados.Next;
          end;

          MessageInfo := 'Exclusão Efetuada com Sucesso.';
          Commit;
          Result := True;
      Except
        on E:Exception Do
        Begin
           RollBack;
           Result := False;
           MessageInfo := sMens+' '+E.Message;
        End
      End;
  End;

end;

function TCtrlProcessaContab.ApuraResultadoPer(dModulo,dEmpresa: Double;iUsuario,iPlano,iExercicio,
                    iPeriodo:Integer;sProgPrev,sCodHist,sDefTec,sResCont,
                    sFormDefTec,sRevSupTecn,sFormSupTec,sFdoCobOscRisc,sResMat,
                    sRevDefTec,sDataLanc,sTipoOper:string;bUsaPPatro:Boolean): Boolean;
var

   dDefTec, dProgPrev, dResCont, dFormDefTec, dRevSupTecn : double;
   dFormSupTec, dFdoCobOscRisc, dResMat, dRevDefTec,dPlnCodigo,dValLanc : double;
   sHistPrin, sHistorico,sMens,sSql, sNumDoc, sCCustoD,sCCustoC: string;
   iUnidNegoc, iSubcontad, iSubContac,iPlanoPrev,iPlanoPatro,iModulo : Integer;
   sContaD,sContaC :string;
   cTipoLanc :char;

   // 05/08/03 by Alex - TROCADOS OS COMPONENTES ORIGINAIS
   // QUE ERAM: TCMSQLPARAMS e  TCLIENTDATASET
   _cdsSaldoConta    : TCMClientDataSet;
   _cdsPlanilha      : TCMClientDataSet;
   _cdsGlobal        : TCMClientDataSet;
   _cdsSaldoProgPrev : TCMClientDataSet;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ApuraResultadoPer(dModulo,dEmpresa,iUsuario,iPlano,
                    iExercicio,iPeriodo,sProgPrev,sCodHist,sDefTec,sResCont,
                    sFormDefTec,sRevSupTecn,sFormSupTec,sFdoCobOscRisc,sResMat,
                    sRevDefTec,sDataLanc,sTipoOper,bUsaPPatro,FsMensAPS_Log);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
         FsMensAPS_Log := Connection.AppServer.MessageInfo;

   End Else
   Begin
      sMens         := '';
      MessageInfo   := '*';
      iModulo       := 1;
      dPlnCodigo    := 0;
      iSubContad    := 0;
      iSubContaC    := 0;

      _cdsPlanilha      := TCMClientDataSet.Create(nil);
      _cdsGlobal        := TCMClientDataSet.Create(nil);
      _cdsSaldoConta    := TCMClientDataSet.Create (nil);
      _cdsSaldoProgPrev := TCMClientDataSet.Create(nil);

      sSql := 'SELECT UNIDNEGOC FROM PARAMGLOBAL ' + #13 +
              'WHERE IDPESSOA = ' + FloatToStr(dEmpresa);
      _cdsGlobal.Data := GetDataPacket(sSql);
      if _cdsGlobal.FieldByName('UNIDNEGOC').asString = '' then
         iUnidNegoc := 0
      else
         iUnidNegoc := StrToInt(_cdsGlobal.FieldByName('UNIDNEGOC').asString);

      sSql := 'SELECT HITDESCR1 FROM HISTOPADRAO WHERE HITCODHIST = ''' + sCodHist + '''';
      _cds.Data := GetDataPacket(sSql);
      sHistPrin := _cds.FieldByName('HITDESCR1').AsString;

      sSql := 'SELECT C.PLANOME, C.PLATIPO, S.IDPLANOPREV, S.IDPATRO, ' + #13 +
              '       ROUND(SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE)),2) AS DEBITOATUAL, ' + #13 +
              '       ROUND(SUM(DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR)),2) AS CREDITOATUAL ' + #13 +
              'FROM PLANOCONTA C, PLANOSALDO S ' + #13 +
              'WHERE (S.PEREXERCICIO = ' + IntToStr (iExercicio) + ') ' + #13 +
              '  AND ((S.PERNUMERO  <= ' + IntToStr (iPeriodo) + ') OR (S.PERNUMERO IS NULL)) ' + #13 +
              '  AND (S.IDPESSOA     = ' + FloatToStr (dEmpresa) + ') ' + #13 +
              '  AND (S.PLACONTA     = ' + QuotedStr(sProgPrev) + ') ' + #13 +
              '  AND (S.PLANO        = ' + IntToStr (iPlano) + ') '+ #13 +
              '  AND (S.PLACONTA     = C.PLACONTA) ' + #13 +
              '  AND (S.PLANO        = C.PLANO) ' + #13 +
              'GROUP BY C.PLANOME, C.PLATIPO, S.IDPLANOPREV, S.IDPATRO ';
      _cdsSaldoProgPrev.Data := GetDataPacket (sSql);

      try
         try
             StartTransaction;

             _cdsSaldoProgPrev.First;
             while not _cdsSaldoProgPrev.EOF do begin
                dProgPrev  := _cdsSaldoProgPrev.FieldByName('DEBITOATUAL').AsFloat - _cdsSaldoProgPrev.FieldByName('CREDITOATUAL').AsFloat;

                iPlanoPrev   := _cdsSaldoProgPrev.FieldByName('IDPLANOPREV').AsInteger;
                iPlanoPatro  := _cdsSaldoProgPrev.FieldByName('IDPATRO').AsInteger;

                // Alex. Se a query voltar mais de uma linha, existe mais de um plano
                // previdenciário, neste caso as querys devem ser feitas por plano
                if _cdsSaldoProgPrev.RecordCount > 1  then begin
                   MessageInfo := 'Processando Saldo do Defict Técnico...';
                   _cdsSaldoConta.Data := CtrlPlanoSaldo.RetornaSaldoContaExerc (iExercicio, iPeriodo, iPlano, dEmpresa, sDefTec, tAnterior, iPlanoPrev, iPlanoPatro);
                   dDefTec := _cdsSaldoConta.FieldByName('DEBITO').AsFloat - _cdsSaldoConta.FieldByName('CREDITO').AsFloat;

                   MessageInfo := 'Processando Saldo da Reserva de Contingência...';
                   _cdsSaldoConta.Data := CtrlPlanoSaldo.RetornaSaldoContaExerc (iExercicio, iPeriodo, iPlano, dEmpresa, sResCont, tAnterior, iPlanoPrev, iPlanoPatro);
                   dResCont := _cdsSaldoConta.FieldByName('DEBITO').AsFloat - _cdsSaldoConta.FieldByName('CREDITO').AsFloat;

                   MessageInfo := 'Processando Saldo da Reserva Matemática...';
                   _cdsSaldoConta.Data := CtrlPlanoSaldo.RetornaSaldoContaExerc (iExercicio, iPeriodo, iPlano, dEmpresa, sResMat, tAtual, iPlanoPrev, iPlanoPatro);
                   dResMat := _cdsSaldoConta.FieldByName('DEBITO').AsFloat - _cdsSaldoConta.FieldByName('CREDITO').AsFloat;

                   MessageInfo := 'Processando Saldo de Fundo de Oscilação...';
                   _cdsSaldoConta.Data := CtrlPlanoSaldo.RetornaSaldoContaExerc (iExercicio, iPeriodo, iPlano, dEmpresa, sFdoCobOscRisc, tAtual, iPlanoPrev, iPlanoPatro);
                   dFdoCobOscRisc := _cdsSaldoConta.FieldByName('DEBITO').AsFloat - _cdsSaldoConta.FieldByName('CREDITO').AsFloat;

                // Alex. Se a query voltar apenas uma linha, existe apenas um plano
                // previdenciário, neste caso as querys podem ser feitas sem plano
                end else begin

                   MessageInfo := 'Processando Saldo do Defict Técnico...';
                   _cdsSaldoConta.Data := CtrlPlanoSaldo.RetornaSaldoContaExerc (iExercicio, iPeriodo, iPlano, dEmpresa, sDefTec, tAnterior);
                   dDefTec := _cdsSaldoConta.FieldByName('DEBITO').AsFloat - _cdsSaldoConta.FieldByName('CREDITO').AsFloat;

                   MessageInfo := 'Processando Saldo da Reserva de Contingência...';
                   _cdsSaldoConta.Data := CtrlPlanoSaldo.RetornaSaldoContaExerc (iExercicio, iPeriodo, iPlano, dEmpresa, sResCont, tAnterior);
                   dResCont := _cdsSaldoConta.FieldByName('DEBITO').AsFloat - _cdsSaldoConta.FieldByName('CREDITO').AsFloat;

                   MessageInfo := 'Processando Saldo da Reserva Matemática...';
                   _cdsSaldoConta.Data := CtrlPlanoSaldo.RetornaSaldoContaExerc (iExercicio, iPeriodo, iPlano, dEmpresa, sResMat, tAtual);
                   dResMat := _cdsSaldoConta.FieldByName('DEBITO').AsFloat - _cdsSaldoConta.FieldByName('CREDITO').AsFloat;

                   MessageInfo := 'Processando Saldo de Fundo de Oscilação...';
                   _cdsSaldoConta.Data := CtrlPlanoSaldo.RetornaSaldoContaExerc (iExercicio, iPeriodo, iPlano, dEmpresa, sFdoCobOscRisc, tAtual);
                   dFdoCobOscRisc := _cdsSaldoConta.FieldByName('DEBITO').AsFloat - _cdsSaldoConta.FieldByName('CREDITO').AsFloat;
                end;

                // 05/08/03 by Alex - Analisar no futuro a real necessidade destas variáveis
                cTipoLanc := '2';                   // partida dobrada
                Lancamento.lcTestaConta := True;
                Lancamento.lcTipConvOfiDeb := 'D';
                Lancamento.lcTipConvGerDeb := 'D';
                Lancamento.lcTipConvGe1Deb := 'D';
                Lancamento.lcTipConvGe2Deb := 'D';
                Lancamento.lcOriAplDeb     := 'O';

                Lancamento.lcTipConvOfiCre := 'D';
                Lancamento.lcTipConvGerCre := 'D';
                Lancamento.lcTipConvGe1Cre := 'D';
                Lancamento.lcTipConvGe2Cre := 'D';
                Lancamento.lcOriAplCre     := 'A';

                sNumDoc  := '';
                sCCustoD := '';
                sCCustoC := '';
                // FIM 05/08/03 by Alex - Analisar no futuro a real necessidade destas variáveis

                // o saldo do programa previdenciário é devedor
                if dProgPrev > 0 then begin
                   if dFdoCobOscRisc <> 0 then begin
                      sHistorico := sHistPrin + ' - Reversão do Superavit Técnico';
                      HistoContab.ArrumaHistorico(sHistorico);
                      sContaD  := sFdoCobOscRisc;
                      sContaC  := sRevSupTecn;

                      { abs(dProgPrev) não faz sentido, aqui será sempre positivo,
                        vide if acima ==>> if dProgPrev > 0       }
                      if abs(dProgPrev) > abs(dFdoCobOscRisc) then begin

                         dValLanc := abs(dFdoCobOscRisc);

                         if not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                   iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                   iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                   sDataLanc,sNumDoc,HistoContab.Hist1,
                                                   HistoContab.Hist2,HistoContab.Hist3,
                                                   HistoContab.Hist4,HistoContab.Hist5,
                                                   sTipoOper,sCCustoD,sContaD,
                                                   sCCustoC,sContaC,sCodHist,
                                                   dValLanc,False,bUsaPPatro,
                                                   // 06/01/03 Alex 14451 - Nova segregação
                                                   // na apuração do resultado a segregação já foi calculada
                                                   -1, -1) then begin
                            Raise Exception.Create(Lancamento.MessageInfo);
                         end else begin
                            dPlnCodigo := Lancamento.RetornoPlnCodigo;
                            _cdsPlanilha.Data := Planilha.ListPlanilhas( Round(dModulo), dPlnCodigo);
                            MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                            sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                         end;

                      end else begin

                         dValLanc := abs(dProgPrev);
                         if not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                   iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                   iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                   sDataLanc,sNumDoc,HistoContab.Hist1,
                                                   HistoContab.Hist2,HistoContab.Hist3,
                                                   HistoContab.Hist4,HistoContab.Hist5,
                                                   sTipoOper,sCCustoD,sContaD,
                                                   sCCustoC,sContaC,sCodHist,
                                                   dValLanc,False,bUsaPPatro,
                                                   // 06/01/03 Alex 14451 - Nova segregação
                                                   // na apuração do resultado a segregação já foi calculada
                                                   -1, -1) then begin
                            Raise Exception.Create(Lancamento.MessageInfo);
                         end else begin
                            dPlnCodigo := Lancamento.RetornoPlnCodigo;
                            _cdsPlanilha.Data := Planilha.ListPlanilhas( Round(dModulo), dPlnCodigo);
                            MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                            sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                         end;
                      end;
                   end;
                   if abs(dProgPrev) > abs(dFdoCobOscRisc) then begin
                      if dResCont <> 0 then begin
                         if (abs(dProgPrev)-abs(dFdoCobOscRisc)) > abs(dResCont) then begin
                            sHistorico := sHistPrin + ' - Reversão do Superavit Técnico';
                            HistoContab.ArrumaHistorico(sHistorico);

                            sContaD  := sResCont;
                            sContaC  := sRevSupTecn;

                            dValLanc := abs(dResCont);

                            if not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                      iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                      iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                      sDataLanc,sNumDoc,HistoContab.Hist1,
                                                      HistoContab.Hist2,HistoContab.Hist3,
                                                      HistoContab.Hist4,HistoContab.Hist5,
                                                      sTipoOper,sCCustoD,sContaD,
                                                      sCCustoC,sContaC,sCodHist,
                                                      dValLanc,False,bUsaPPatro,
                                                      // 06/01/03 Alex 14451 - Nova segregação
                                                      // na apuração do resultado a segregação já foi calculada
                                                      -1, -1) then begin
                               Raise Exception.Create(Lancamento.MessageInfo);
                            end else begin
                               dPlnCodigo := Lancamento.RetornoPlnCodigo;
                               _cdsPlanilha.Data := Planilha.ListPlanilhas( Round(dModulo), dPlnCodigo);
                               MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                               sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                            end;

                            sHistorico := sHistPrin + ' - Formação de Deficit Técnico';
                            HistoContab.ArrumaHistorico(sHistorico);
                            sContaD  := sDefTec;
                            sContaC  := sFormDefTec;
                            dValLanc := (abs(dProgPrev) - abs(dFdoCobOscRisc)) - abs(dResCont);

                            if not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                      iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                      iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                      sDataLanc,sNumDoc,HistoContab.Hist1,
                                                      HistoContab.Hist2,HistoContab.Hist3,
                                                      HistoContab.Hist4,HistoContab.Hist5,
                                                      sTipoOper,sCCustoD,sContaD,
                                                      sCCustoC,sContaC,sCodHist,
                                                      dValLanc,False,bUsaPPatro,
                                                      // 06/01/03 Alex 14451 - Nova segregação
                                                      // na apuração do resultado a segregação já foi calculada
                                                      -1, -1) then begin
                               Raise Exception.Create(Lancamento.MessageInfo);
                            end else begin
                               dPlnCodigo := Lancamento.RetornoPlnCodigo;
                               _cdsPlanilha.Data := Planilha.ListPlanilhas( Round(dModulo), dPlnCodigo);
                               MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                               sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                            end;

                         end else begin
                            sHistorico := sHistPrin + ' - Reversão do Superavit Técnico';
                            HistoContab.ArrumaHistorico(sHistorico);

                            sContaD  := sResCont;
                            sContaC  := sRevSupTecn;
                            // 01/08/03 - by Alex alterado pela comparação dos fontes
                            // 3 camadas x 2 camadas, conforme sugestões Rosane
                            // dValLanc := abs(dFdoCobOscRisc);
                            dValLanc := abs (dProgPrev) - abs (dFdoCobOscRisc);

                            if not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                      iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                      iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                      sDataLanc,sNumDoc,HistoContab.Hist1,
                                                      HistoContab.Hist2,HistoContab.Hist3,
                                                      HistoContab.Hist4,HistoContab.Hist5,
                                                      sTipoOper,sCCustoD,sContaD,
                                                      sCCustoC,sContaC,sCodHist,
                                                      dValLanc,False,bUsaPPatro,
                                                      // 06/01/03 Alex 14451 - Nova segregação
                                                      // na apuração do resultado a segregação já foi calculada
                                                      -1, -1) then begin
                               Raise Exception.Create(Lancamento.MessageInfo);
                            end else begin
                               dPlnCodigo := Lancamento.RetornoPlnCodigo;
                               _cdsPlanilha.Data := Planilha.ListPlanilhas( Round(dModulo), dPlnCodigo);
                               MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                               sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                            end;
                         end;
                      end else begin
                         sHistorico := sHistPrin + ' - Formação de Deficit Técnico';
                         HistoContab.ArrumaHistorico(sHistorico);

                         sContaD  := sDefTec;
                         sContaC  := sFormDefTec;
                         dValLanc := abs(dProgPrev)- abs(dFdoCobOscRisc);

                         if not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                   iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                   iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                   sDataLanc,sNumDoc,HistoContab.Hist1,
                                                   HistoContab.Hist2,HistoContab.Hist3,
                                                   HistoContab.Hist4,HistoContab.Hist5,
                                                   sTipoOper,sCCustoD,sContaD,
                                                   sCCustoC,sContaC,sCodHist,
                                                   dValLanc,False,bUsaPPatro,
                                                   // 06/01/03 Alex 14451 - Nova segregação
                                                   // na apuração do resultado a segregação já foi calculada
                                                   -1, -1) then begin
                            Raise Exception.Create(Lancamento.MessageInfo);
                         end else begin
                            dPlnCodigo := Lancamento.RetornoPlnCodigo;
                            _cdsPlanilha.Data := Planilha.ListPlanilhas( Round(dModulo), dPlnCodigo);
                            MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                            sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                         end;
                      end;
                   // end if abs(dProgPrev) > abs(dFdoCobOscRisc)
                   // cadê o else?
                   end;

                end else begin // o saldo do programa previdenciário é credor

                   if dDefTec <> 0 then begin
                      if abs(dProgPrev) > abs(dDefTec) then begin
                         sHistorico := sHistPrin + ' - Reversão de Deficit Técnico';
                         HistoContab.ArrumaHistorico(sHistorico);

                         sContaD  := sRevDefTec;
                         sContaC  := sDefTec;
                         dValLanc := abs(dDefTec);

                         if not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                   iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                   iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                   sDataLanc,sNumDoc,HistoContab.Hist1,
                                                   HistoContab.Hist2,HistoContab.Hist3,
                                                   HistoContab.Hist4,HistoContab.Hist5,
                                                   sTipoOper,sCCustoD,sContaD,
                                                   sCCustoC,sContaC,sCodHist,
                                                   dValLanc,False,bUsaPPatro,
                                                   // 06/01/03 Alex 14451 - Nova segregação
                                                   // na apuração do resultado a segregação já foi calculada
                                                   -1, -1) then begin
                            Raise Exception.Create(Lancamento.MessageInfo);
                         end else begin
                            dPlnCodigo := Lancamento.RetornoPlnCodigo;
                            _cdsPlanilha.Data := Planilha.ListPlanilhas( Round(dModulo), dPlnCodigo);
                            MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                            sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                         end;

                         if ((abs(dResMat)*0.25) <= (abs(dProgPrev) - abs(dDefTec))) or
                            (sFdoCobOscRisc = '') then begin // 05/08/03 Alex fdo de cob osc de risco não parametrizado - a Fundação não usa
                            //Vai tudo para reserva de contingencia
                            sHistorico := sHistPrin + ' - Formação de Superavit Técnico';
                            HistoContab.ArrumaHistorico(sHistorico);


                            sContaD  := sFormSupTec;
                            sContaC  := sResCont;
                            dValLanc := abs(dProgPrev) - abs(dDefTec);

                            if not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                      iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                      iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                      sDataLanc,sNumDoc,HistoContab.Hist1,
                                                      HistoContab.Hist2,HistoContab.Hist3,
                                                      HistoContab.Hist4,HistoContab.Hist5,
                                                      sTipoOper,sCCustoD,sContaD,
                                                      sCCustoC,sContaC,sCodHist,
                                                      dValLanc,False,bUsaPPatro,
                                                      // 06/01/03 Alex 14451 - Nova segregação
                                                      // na apuração do resultado a segregação já foi calculada
                                                      -1, -1) then begin
                               Raise Exception.Create(Lancamento.MessageInfo);
                            end else begin
                               dPlnCodigo := Lancamento.RetornoPlnCodigo;
                               _cdsPlanilha.Data := Planilha.ListPlanilhas( Round(dModulo), dPlnCodigo);
                               MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                               sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                            end;

                         end else begin
                            sHistorico := sHistPrin + ' - Formação de Superavit Técnico';
                            HistoContab.ArrumaHistorico(sHistorico);

                            sContaD  := sFormSupTec;
                            sContaC  := sFdoCobOscRisc;
                            dValLanc := (abs(dProgPrev) - abs(dDefTec)) - (abs(dResMat)*0.25);

                            if not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                      iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                      iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                      sDataLanc,sNumDoc,HistoContab.Hist1,
                                                      HistoContab.Hist2,HistoContab.Hist3,
                                                      HistoContab.Hist4,HistoContab.Hist5,
                                                      sTipoOper,sCCustoD,sContaD,
                                                      sCCustoC,sContaC,sCodHist,
                                                      dValLanc,False,bUsaPPatro,
                                                      // 06/01/03 Alex 14451 - Nova segregação
                                                      // na apuração do resultado a segregação já foi calculada
                                                      -1, -1) then begin
                               Raise Exception.Create(Lancamento.MessageInfo);
                            end else begin
                               dPlnCodigo := Lancamento.RetornoPlnCodigo;
                               _cdsPlanilha.Data := Planilha.ListPlanilhas( Round(dModulo), dPlnCodigo);
                               MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                               sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                            end;

                            sContaD  := sFormSupTec;
                            sContaC  := sResCont;
                            dValLanc := (abs(dResMat)*0.25);

                            if not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                      iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                      iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                      sDataLanc,sNumDoc,HistoContab.Hist1,
                                                      HistoContab.Hist2,HistoContab.Hist3,
                                                      HistoContab.Hist4,HistoContab.Hist5,
                                                      sTipoOper,sCCustoD,sContaD,
                                                      sCCustoC,sContaC,sCodHist,
                                                      dValLanc,False,bUsaPPatro,
                                                      // 06/01/03 Alex 14451 - Nova segregação
                                                      // na apuração do resultado a segregação já foi calculada
                                                      -1, -1) then begin
                               Raise Exception.Create(Lancamento.MessageInfo);
                            end else begin
                               dPlnCodigo := Lancamento.RetornoPlnCodigo;
                               _cdsPlanilha.Data := Planilha.ListPlanilhas( Round(dModulo), dPlnCodigo);
                               MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                               sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                            end;

                         // end (else) abs(resmat) * 0.25
                         end;
                      // else abs(ProgPrev) > abs(DefTec)
                      end else begin
                         sHistorico := sHistPrin + ' - Reversão de Déficit Técnico';
                         HistoContab.ArrumaHistorico(sHistorico);

                         sContaD  := sRevDefTec;
                         sContaC  := sDefTec;
                         dValLanc := abs(dProgPrev);

                         if not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                   iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                   iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                   sDataLanc,sNumDoc,HistoContab.Hist1,
                                                   HistoContab.Hist2,HistoContab.Hist3,
                                                   HistoContab.Hist4,HistoContab.Hist5,
                                                   sTipoOper,sCCustoD,sContaD,
                                                   sCCustoC,sContaC,sCodHist,
                                                   dValLanc,False,bUsaPPatro,
                                                   // 06/01/03 Alex 14451 - Nova segregação
                                                   // na apuração do resultado a segregação já foi calculada
                                                   -1, -1) then begin
                            Raise Exception.Create(Lancamento.MessageInfo);
                         end else begin
                            dPlnCodigo := Lancamento.RetornoPlnCodigo;
                            _cdsPlanilha.Data := Planilha.ListPlanilhas( Round(dModulo), dPlnCodigo);
                            MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                            sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                         end;
                      end;
                   // end do if deftec <> 0
                   end else begin
                      sHistorico := sHistPrin + ' - Formação de Superavit Técnico';

                      HistoContab.ArrumaHistorico(sHistorico);
                      if ((abs(dResMat)*0.25) >= (abs(dProgPrev) + abs(dResCont))) or
                         (sFdoCobOscRisc = '') then begin // 05/08/03 Alex fdo de cob osc de risco não parametrizado - a Fundação não usa

                         sContaD  := sFormSupTec;
                         sContaC  := sResCont;
                         dValLanc := abs(dProgPrev);

                         if not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                   iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                   iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                   sDataLanc,sNumDoc,HistoContab.Hist1,
                                                   HistoContab.Hist2,HistoContab.Hist3,
                                                   HistoContab.Hist4,HistoContab.Hist5,
                                                   sTipoOper,sCCustoD,sContaD,
                                                   sCCustoC,sContaC,sCodHist,
                                                   dValLanc,False,bUsaPPatro,
                                                   // 06/01/03 Alex 14451 - Nova segregação
                                                   // na apuração do resultado a segregação já foi calculada
                                                   -1, -1) then begin
                            Raise Exception.Create(Lancamento.MessageInfo);
                         end else begin
                            dPlnCodigo := Lancamento.RetornoPlnCodigo;
                            _cdsPlanilha.Data := Planilha.ListPlanilhas( Round(dModulo), dPlnCodigo);
                            MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                            sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                         end;
                      end else begin
                         sContaD  := sFormSupTec;
                         sContaC  := sFdoCobOscRisc;
                         dValLanc := abs(dProgPrev)-((abs(dResMat)*0.25)-abs(dResCont));

                         if not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                   iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                   iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                   sDataLanc,sNumDoc,HistoContab.Hist1,
                                                   HistoContab.Hist2,HistoContab.Hist3,
                                                   HistoContab.Hist4,HistoContab.Hist5,
                                                   sTipoOper,sCCustoD,sContaD,
                                                   sCCustoC,sContaC,sCodHist,
                                                   dValLanc,False,bUsaPPatro,
                                                   // 06/01/03 Alex 14451 - Nova segregação
                                                   // na apuração do resultado a segregação já foi calculada
                                                   -1, -1) then begin
                            Raise Exception.Create(Lancamento.MessageInfo);
                         end else begin
                            dPlnCodigo := Lancamento.RetornoPlnCodigo;
                            _cdsPlanilha.Data := Planilha.ListPlanilhas( Round(dModulo), dPlnCodigo);
                            MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                            sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                         end;

                         sContaD  := sFormSupTec;
                         sContaC  := sResCont;
                         dValLanc := (abs(dResMat)*0.25)-abs(dResCont);

                         if not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                   iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                   iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                   sDataLanc,sNumDoc,HistoContab.Hist1,
                                                   HistoContab.Hist2,HistoContab.Hist3,
                                                   HistoContab.Hist4,HistoContab.Hist5,
                                                   sTipoOper,sCCustoD,sContaD,
                                                   sCCustoC,sContaC,sCodHist,
                                                   dValLanc,False,bUsaPPatro,
                                                   // 06/01/03 Alex 14451 - Nova segregação
                                                   // na apuração do resultado a segregação já foi calculada
                                                   -1, -1) then begin
                            Raise Exception.Create(Lancamento.MessageInfo);
                         end else begin
                            dPlnCodigo := Lancamento.RetornoPlnCodigo;
                            _cdsPlanilha.Data := Planilha.ListPlanilhas( Round(dModulo), dPlnCodigo);
                            MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                            sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                         end;

                      end;
                   end;
                // END IF DPROGPREV <0
                end;
                _cdsSaldoProgPrev.Next;
             end;

             If not Padroes.GravaLogOperacoes(dEmpresa,dModulo,iUsuario, 'Apuração do Resultado do Período',False) then
                Raise Exception.Create( Padroes.MessageInfo );

             Commit;
             Result := True;
             MessageInfo := 'Apuração de Resultado efetuada com Sucesso.';
             sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);

         except
           on E:Exception do begin
              RollBack;
              Result := False;
              MessageInfo := sMens+' '+E.Message;
           end
         end;
      finally
         FreeAndNil (_cdsSaldoConta);
         FreeAndNil (_cdsPlanilha);
         FreeAndNil (_cdsGlobal);
         FreeAndNil (_cdsSaldoProgPrev);
      end;
   End;
end;

function TCtrlProcessaContab.GeraArquivo_SIPC(dEmpresa:Double;iPlano,iExercicio,
                         iPeriodo, iPlanoPrev:integer;sPlano,sEntidade,sCaminho, sTipoBalancete:string): Boolean;

var
  _sqlSaldo :TCMSqlParams;
  _cdsSaldo :TClientDataSet;
  i,iTamanho :integer;
   ArquivoTexto : TextFile;
   sNomeArquivo,sLinha,sCodigo,sEspacos : string;

begin
   sNomeArquivo := 'BALANCETE.TXT';

   //=== Codigo da Entidade ===
   sCodigo := sEntidade;
   if length(sCodigo) < 5 then
   begin
      sEspacos := '';
      for i := length(sCodigo) to 4 do
      begin
         sEspacos := sEspacos + ' ';
      end;
      sCodigo := sCodigo + sEspacos;
   end;

   //======================================================================
   _sqlSaldo := TCMSqlParams.Create(nil);
   _sqlSaldo.ControlObject := Self;
   _cdsSaldo  := TClientDataSet.Create(nil);

   with _sqlSaldo do
   begin
      SQL.Clear;
      SQL.Add('SELECT                                                           ');
      SQL.Add('   C.PLACONTA, C.PLATIPO, C.PLANATUREZA,                         ');
      SQL.Add('   S.DEB,                                                        ');
      SQL.Add('   S.CRED,                                                       ');
      SQL.Add('   SA.SALDOANT, SS.SALDO                                         ');
      SQL.Add('FROM                                                             ');
      SQL.Add('   PLANOCONTA C,                                                 ');
      SQL.Add('   (SELECT                                                       ');
      SQL.Add('       PLACONTA,                                                 ');
      SQL.Add('       SUM(NVL(PLSDEBITOCORRENTE,0)) AS DEB,                     ');
      SQL.Add('       SUM(NVL(PLSCREDITOCOR,0)) AS CRED                         ');
      SQL.Add('    FROM PLANOSALDO                                              ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                                    ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                         ');
      SQL.Add('          (PERNUMERO =:PERIODO) AND                              ');
      if iPlanoPrev <> 0 then
         SQL.Add('          (IDPLANOPREV = '+IntToStr(iPlanoPrev)+') AND        ');
      SQL.Add('          (IDPESSOA =:IDPESSOA)                                  ');
      SQL.Add('    GROUP BY PLACONTA ) S,                                       ');
      SQL.Add('   (SELECT                                                       ');
      SQL.Add('       PLACONTA, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
      SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOANT');
      SQL.Add('    FROM PLANOSALDO                                              ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                                    ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                         ');
      SQL.Add('          ((PERNUMERO <:PERIODO) OR (PERNUMERO IS NULL)) AND     ');
      if iPlanoPrev <> 0 then
         SQL.Add('          (IDPLANOPREV = '+IntToStr(iPlanoPrev)+') AND        ');
      SQL.Add('          (IDPESSOA =:IDPESSOA)                                  ');
      SQL.Add('    GROUP BY PLACONTA ) SA,                                      ');
      SQL.Add('                                                                 ');
      SQL.Add('   (SELECT                                                       ');
      SQL.Add('       PLACONTA, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
      SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDO');
      SQL.Add('    FROM PLANOSALDO                                              ');
      SQL.Add('    WHERE (PLANO =:PLANO) AND                                    ');
      SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                         ');
      SQL.Add('          ((PERNUMERO <=:PERIODO) OR (PERNUMERO IS NULL)) AND    ');
      if iPlanoPrev <> 0 then
         SQL.Add('          (IDPLANOPREV = '+IntToStr(iPlanoPrev)+') AND        ');
      SQL.Add('          (IDPESSOA =:IDPESSOA)                                  ');
      SQL.Add('    GROUP BY PLACONTA ) SS                                       ');
      SQL.Add('                                                                 ');
      SQL.Add('WHERE                                                            ');
      SQL.Add('    (S.PLACONTA(+) = C.PLACONTA) AND                             ');
      SQL.Add('    (SA.PLACONTA(+) = C.PLACONTA) AND                            ');
      SQL.Add('    (SS.PLACONTA(+) = C.PLACONTA) AND                            ');
      SQL.Add('    (C.PLASECRETARIA = ''S'') AND                                ');
      SQL.Add('    (C.PLANO =:PLANO) AND                                        ');
      SQL.Add('    ((S.DEB <> 0) OR                                             ');
      SQL.Add('     (S.CRED <> 0) OR                                            ');
      SQL.Add('     (SA.SALDOANT <> 0) OR                                       ');
      SQL.Add('     (SS.SALDO <> 0))                                            ');
      SQL.Add('ORDER BY C.PLACONTA                                              ');

      Prepare;
      ParamByName('PLANO').asInteger     := iPlano;
      ParamByName('IDPESSOA').asFloat    := dEmpresa;
      ParamByName('EXERCICIO').asInteger := iExercicio;
      ParamByName('PERIODO').asInteger   := iPeriodo;

      _cdsSaldo.Data := Data;

      If  _cdsSaldo.IsEmpty then
      begin
        MessageInfo := 'Não Existe Saldo para Este Exercício e Período.';
        _sqlSaldo.free;
        _cdsSaldo.free;
        Result := False;
        Exit;
      end;

      iTamanho := _cdsSaldo.RecordCount;
      _cdsSaldo.First;
   end;

   //Cria Um Novo Arquivo ou Sobrescreve um já existente
   AssignFile(ArquivoTexto, sCaminho + '\' + sNomeArquivo);
   ReWrite(Arquivotexto);

   FMaxProgresso := iTamanho;
   FProgresso    := 0;
   Result        := True;

   while not _cdsSaldo.EOF do
   begin

      FProgresso := FProgresso + 1;

      sLinha := '';

      //Concatena o Código da Entidade (+5 brancos)
      sLinha := sLinha + sCodigo + '     ';

      //Concatena o Plano  (+2 brancos)
      sLinha := sLinha + sPlano + '  ';

      //Concatena a Conta Contábil (+2 brancos)
      sLinha := sLinha + Contab.ZE(copy(_cdsSaldo.FieldByName('PLACONTA').AsString, 1, 8), 8) + '  ';

      //Concatena o Exercicio
      sLinha := sLinha + IntToStr(iExercicio);

      //Concatena o Período
      if length(IntToStr(iPeriodo)) = 1 then begin
         sLinha := sLinha + '0' + IntToStr(IPeriodo);
      end else begin
         sLinha := sLinha + IntToStr(iPeriodo);
      end;

      //Concatena o Débito e o Crédito
      sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', _cdsSaldo.FieldByName('CRED').AsFloat), 20);
      sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', _cdsSaldo.FieldByName('DEB').AsFloat), 20);

      //Concatena o Saldo Anterior
      sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', abs(_cdsSaldo.FieldByName('SALDOANT').AsFloat)), 20);

      if _cdsSaldo.FieldByName('SALDOANT').asFloat = 0 then begin
         if _cdsSaldo.FieldByName('PLANATUREZA').asString = 'C' then begin
            sLinha := sLinha + 'CR';
         end else begin
            sLinha := sLinha + 'DV';
         end;
      end else begin
         if _cdsSaldo.FieldByName('SALDOANT').asFloat < 0 then begin
            sLinha := sLinha + 'CR';
         end else begin
            sLinha := sLinha + 'DV';
         end;
      end;

      // Concatena Tipo de Balancete
      sLinha := sLinha + sTipoBalancete; { Augusto 08/08/2003 }

      //------------------------------------------------------------

      //Adiciona as linhas no arquivo texto
      WriteLn(ArquivoTexto, sLinha);

      _cdsSaldo.Next;

   end;

   CloseFile(ArquivoTexto);
   _sqlSaldo.free;
   _cdsSaldo.free;
   MessageInfo := 'Arquivo gerado com sucesso.';

end;

Function TCtrlProcessaContab.LancaMeiaNoite(dEmpresa:Double;iUsuario,iPlano,iExercicio,iPeriodo:Integer;
                    sProgPrev,sCodHist,sDefTec,sDefTecA,sResCont,sResContA,sFormDefTec,sRevSupTecn,
                    sFormSupTec,sFdoCobOscRisc,sFdoCobOscRiscA,sResMat,sRevDefTec,
                    sDataLanc:string;bUsaPPatro:Boolean):Boolean;

var
   dDefTec, dProgPrev, dResCont, dFormDefTec, dRevSupTecn : double;
   dFormSupTec, dFdoCobOscRisc, dResMat, dRevDefTec : double;
   dDefTecA, dResContA, dFdoCobOscRiscA,dValLanc : double;

   dPlnCodigo : Double;


   sHistPrin, sHistorico,sMens,sSql,sNumDoc,sCCustoD,sCCustoC,sContaC,sContaD,sTipoOper : string;
   iUnidNegoc, iSubcontaD, iSubContaC,iPlanoPrev, iPlanoPatro,iModulo : integer;
   dValor1,dValor2,dValor3,dValor4,dValor31, dValor32,dValor41, dValor42, dValor5 :Double;

   cTipoLanc :char;

  _sqlPlanilha :TCMSqlParams;
  _cdsPlanilha :TClientDataSet;

  _sqlSaldoSemPlano :TCMSqlParams;
  _cdsSaldoSemPlano :TClientDataSet;

  _sqlSaldoComPlano :TCMSqlParams;
  _cdsSaldoComPlano :TClientDataSet;

  _sqlGlobal :TCMSqlParams;
  _cdsGlobal :TClientDataSet;

  _sqlPlanoPatro :TCMSqlParams;
  _cdsPlanoPatro :TClientDataSet;

  _sqlPlanoPrev :TCMSqlParams;
  _cdsPlanoPrev :TClientDataSet;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.LancaMeiaNoite(dEmpresa,iUsuario,iPlano,
                    iExercicio,iPeriodo, sProgPrev,sCodHist,sDefTec,sDefTecA,sResCont,
                    sResContA,sFormDefTec,sRevSupTecn, sFormSupTec,sFdoCobOscRisc,
                    sFdoCobOscRiscA,sResMat,sRevDefTec, sDataLanc,bUsaPPatro,FsMensAPS_Log);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
         FsMensAPS_Log := Connection.AppServer.MessageInfo;


   End Else
   Begin
      sMens         := '';
      MessageInfo   := '*';
      iModulo       := 1;
      dPlnCodigo    := 0;
      iSubContad    := 0;
      iSubContaC    := 0;
      sTipoOper     := '';

      //======================================================================
      _sqlPlanilha := TCMSqlParams.Create(nil);
      _sqlPlanilha.ControlObject := Self;
      _cdsPlanilha  := TClientDataSet.Create(nil);

      _sqlPlanilha.SQL.Clear;
      _sqlPlanilha.SQL.Add('SELECT  PLNPLANIL           ');
      _sqlPlanilha.SQL.Add('FROM PLANILHA               ');
      _sqlPlanilha.SQL.Add('WHERE PLNCODIGO =:PLNCODIGO ');
      //======================================================================
      _sqlGlobal := TCMSqlParams.Create(nil);
      _sqlGlobal.ControlObject := Self;
      _cdsGlobal  := TClientDataSet.Create(nil);

      _sqlGlobal.SQL.Clear;
      _sqlGlobal.SQL.Add('SELECT UNIDNEGOC FROM PARAMGLOBAL ');
      _sqlGlobal.SQL.Add('WHERE IDPESSOA = :PESSOA          ');

      _sqlGlobal.Prepare;
      _sqlGlobal.ParamByName('PESSOA').asFloat := dEmpresa;
      _cdsGlobal.Data := _sqlGlobal.Data;

      if _cdsGlobal.FieldByName('UNIDNEGOC').asString = '' then
         iUnidNegoc := 0
      else
         iUnidNegoc := StrToInt(_cdsGlobal.FieldByName('UNIDNEGOC').asString);
      //======================================================================
      sSql := 'SELECT HITDESCR1 FROM HISTOPADRAO WHERE HITCODHIST = ''' + sCodHist + '''';
      _cds.Data := GetDataPacket(sSql);
      sHistPrin := _cds.FieldByName('HITDESCR1').AsString;
      //======================================================================

      _sqlPlanoPatro := TCMSqlParams.Create(nil);
      _sqlPlanoPatro.ControlObject := Self;
      _cdsPlanoPatro  := TClientDataSet.Create(nil);

      _sqlPlanoPatro.SQL.Clear;
      _sqlPlanoPatro.SQL.Add('SELECT 0 as IDPATRO, 0 as IDPLANOPREV  ');
      _sqlPlanoPatro.SQL.Add('FROM PATRO     ');
      _sqlPlanoPatro.SQL.Add('WHERE (1=2)    ');
      _cdsPlanoPatro.Data := _sqlPlanoPatro.Data;
      //======================================================================
      _sqlPlanoPrev := TCMSqlParams.Create(nil);
      _sqlPlanoPrev.ControlObject := Self;
      _cdsPlanoPrev  := TClientDataSet.Create(nil);

      _sqlPlanoPrev.SQL.Clear;
      _sqlPlanoPrev.SQL.Add('SELECT IDPLANOPREV     ');
      _sqlPlanoPrev.SQL.Add('FROM PLANPREVCONTABIL ');
      //======================================================================
      _sqlSaldoComPlano := TCMSqlParams.Create(nil);
      _sqlSaldoComPlano.ControlObject := Self;
      _cdsSaldoComPlano  := TClientDataSet.Create(nil);

      _sqlSaldoComPlano.SQL.Clear;

      _sqlSaldoComPlano.SQL.Add('SELECT C.PLANOME, C.PLATIPO, C.PLANATUREZA, C.PLACONTA,                                     ');
      _sqlSaldoComPlano.SQL.Add('       ROUND(SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE)),2) AS DEBITOATUAL, ');
      _sqlSaldoComPlano.SQL.Add('       ROUND(SUM(DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR)),2) AS CREDITOATUAL         ');
      _sqlSaldoComPlano.SQL.Add('FROM PLANOCONTA C, PLANOSALDO S                                                             ');
      _sqlSaldoComPlano.SQL.Add('WHERE (S.PEREXERCICIO = :PEREXERCICIO) AND                                                  ');
      _sqlSaldoComPlano.SQL.Add('      ((S.PERNUMERO   <= :PERNUMERO) OR (S.PERNUMERO IS NULL)) AND                          ');
      _sqlSaldoComPlano.SQL.Add('      (S.IDPESSOA     = :IDPESSOA) AND                                                      ');
      _sqlSaldoComPlano.SQL.Add('      (S.PLACONTA     = :PLACONTA) AND                                                      ');
      _sqlSaldoComPlano.SQL.Add('      (S.PLANO        = :PLANO) AND                                                         ');
      _sqlSaldoComPlano.SQL.Add('      (S.IDPLANOPREV  = :IDPLANOPREV) AND                                                   ');
      _sqlSaldoComPlano.SQL.Add('      (S.IDPATRO      = :IDPATRO) AND                                                       ');
      _sqlSaldoComPlano.SQL.Add('      (S.PLACONTA     = C.PLACONTA) AND                                                     ');
      _sqlSaldoComPlano.SQL.Add('      (S.PLANO        = C.PLANO)                                                            ');
      _sqlSaldoComPlano.SQL.Add('GROUP BY C.PLANOME, C.PLATIPO, C.PLANATUREZA, C.PLACONTA                                    ');
      //======================================================================
      _sqlSaldoSemPlano := TCMSqlParams.Create(nil);
      _sqlSaldoSemPlano.ControlObject := Self;
      _cdsSaldoSemPlano  := TClientDataSet.Create(nil);

      _sqlSaldoSemPlano.SQL.Clear;
      _sqlSaldoSemPlano.SQL.Add('SELECT C.PLANOME, C.PLATIPO, C.PLANATUREZA, C.PLACONTA,                                    ');
      _sqlSaldoSemPlano.SQL.Add('       ROUND(SUM(DECODE(S.PLSDEBITOCORRENTE,NULL,0,S.PLSDEBITOCORRENTE)),2) AS DEBITOATUAL,');
      _sqlSaldoSemPlano.SQL.Add('       ROUND(SUM(DECODE(S.PLSCREDITOCOR,NULL,0,S.PLSCREDITOCOR)),2) AS CREDITOATUAL        ');
      _sqlSaldoSemPlano.SQL.Add('FROM PLANOCONTA C, PLANOSALDO S                                                            ');
      _sqlSaldoSemPlano.SQL.Add('WHERE (S.PEREXERCICIO = :PEREXERCICIO) AND                                                 ');
      _sqlSaldoSemPlano.SQL.Add('      ((S.PERNUMERO   <= :PERNUMERO) OR (S.PERNUMERO IS NULL)) AND                         ');
      _sqlSaldoSemPlano.SQL.Add('      (S.IDPESSOA     = :IDPESSOA) AND                                                     ');
      _sqlSaldoSemPlano.SQL.Add('      (S.PLACONTA     = :PLACONTA) AND                                                     ');
      _sqlSaldoSemPlano.SQL.Add('      (S.PLANO        = :PLANO) AND                                                        ');
      _sqlSaldoSemPlano.SQL.Add('      (S.PLACONTA     = C.PLACONTA) AND                                                    ');
      _sqlSaldoSemPlano.SQL.Add('      (S.PLANO        = C.PLANO)                                                           ');
      _sqlSaldoSemPlano.SQL.Add('GROUP BY C.PLANOME, C.PLATIPO, C.PLANATUREZA, C.PLACONTA                                   ');
      //======================================================================

      if bUsaPPatro Then
      Begin
         _cdsPlanoPatro.Data := _sqlPlanoPatro.Data;
         _cdsPlanoPrev.Data  := _sqlPlanoPrev.Data;

         _cdsPlanoPatro.First;
         While not _cdsPlanoPatro.Eof do
         begin
            _cdsPlanoPrev.First;
            While not _cdsPlanoPrev.Eof do
            begin
               _cdsPlanoPatro.Insert;
               _cdsPlanoPatro.FieldByName('IDPLANOPREV').AsInteger := _cdsPlanoPrev.FieldByName('IDPLANOPREV').AsInteger;
               _cdsPlanoPatro.FieldByName('IDPATRO').AsInteger     := _cdsPlanoPatro.FieldByName('IDPESSOA').AsInteger;
               _cdsPlanoPatro.Post;
               _cdsPlanoPrev.Next;
            end;
            _cdsPlanoPatro.Next;
         end;
      End else
      Begin
         _cdsPlanoPatro.Insert;
         _cdsPlanoPatro.FieldByName('IDPLANOPREV').AsInteger := 0;
         _cdsPlanoPatro.FieldByName('IDPATRO').AsInteger     := 0;
         _cdsPlanoPatro.Post;
      End;

      Try
         StartTransaction;

         _cdsPlanoPatro.First;
         While not _cdsPlanoPatro.Eof do
         begin

            iPlanoPrev     := _cdsPlanoPatro.FieldByName('IDPLANOPREV').AsInteger;
            iPlanoPatro    := _cdsPlanoPatro.FieldByName('IDPATRO').AsInteger;

            if bUsaPPatro then begin
               MessageInfo := 'Processando Saldo do Defict Técnico do Exercício Anterior...';
               _sqlSaldoComPlano.Prepare;
               _sqlSaldoComPlano.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
               _sqlSaldoComPlano.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
               _sqlSaldoComPlano.ParamByName('IDPESSOA').AsFloat       := dEmpresa;
               _sqlSaldoComPlano.ParamByName('PLACONTA').AsString      := Copy(sDefTecA + '                  ',1,18);
               _sqlSaldoComPlano.ParamByName('PLANO').AsInteger        := iPlano;
               _sqlSaldoComPlano.ParamByName('IDPLANOPREV').AsInteger  := iPlanoPrev;
               _sqlSaldoComPlano.ParamByName('IDPATRO').AsInteger      := iPlanoPatro;
               _cdsSaldoComPlano.Data := _sqlSaldoComPlano.Data;
               if _cdsSaldoComPlano.FieldByName('PLANATUREZA').AsString = 'D' then
                  dDefTecA := _cdsSaldoComPlano.FieldByName('DEBITOATUAL').AsFloat - _cdsSaldoComPlano.FieldByName('CREDITOATUAL').AsFloat
               else
                  dDefTecA := _cdsSaldoComPlano.FieldByName('CREDITOATUAL').AsFloat - _cdsSaldoComPlano.FieldByName('DEBITOATUAL').AsFloat;
               //
               MessageInfo := 'Processando Saldo da Reserva de Contingência do Exercício Anterior...';
               _sqlSaldoComPlano.Prepare;
               _sqlSaldoComPlano.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
               _sqlSaldoComPlano.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
               _sqlSaldoComPlano.ParamByName('IDPESSOA').AsFloat       := dEmpresa;
               _sqlSaldoComPlano.ParamByName('PLACONTA').AsString      := copy(sResContA+ '                  ',1,18);
               _sqlSaldoComPlano.ParamByName('PLANO').AsInteger        := iPlano;
               _sqlSaldoComPlano.ParamByName('IDPLANOPREV').AsInteger  := iPlanoPrev;
               _sqlSaldoComPlano.ParamByName('IDPATRO').AsInteger      := iPlanoPatro;
               _cdsSaldoComPlano.Data := _sqlSaldoComPlano.Data;
               if _cdsSaldoComPlano.FieldByName('PLANATUREZA').AsString = 'D' then
                  dResContA := _cdsSaldoComPlano.FieldByName('DEBITOATUAL').AsFloat - _cdsSaldoComPlano.FieldByName('CREDITOATUAL').AsFloat
               else
                  dResContA := _cdsSaldoComPlano.FieldByName('CREDITOATUAL').AsFloat - _cdsSaldoComPlano.FieldByName('DEBITOATUAL').AsFloat;
               //
               MessageInfo := 'Processando Saldo de Fundo de Oscilação do Exercício Anterior...';
               _sqlSaldoComPlano.Prepare;
               _sqlSaldoComPlano.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
               _sqlSaldoComPlano.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
               _sqlSaldoComPlano.ParamByName('IDPESSOA').AsFloat       := dEmpresa;
               _sqlSaldoComPlano.ParamByName('PLACONTA').AsString      := copy(sFdoCobOscRiscA+'                  ',1,18);
               _sqlSaldoComPlano.ParamByName('PLANO').AsInteger        := iPlano;
               _sqlSaldoComPlano.ParamByName('IDPLANOPREV').AsInteger  := iPlanoPrev;
               _sqlSaldoComPlano.ParamByName('IDPATRO').AsInteger      := iPlanoPatro;
               _cdsSaldoComPlano.Data := _sqlSaldoComPlano.Data;
               if _cdsSaldoComPlano.FieldByName('PLANATUREZA').AsString = 'D' then
                  dFdoCobOscRiscA := _cdsSaldoComPlano.FieldByName('DEBITOATUAL').AsFloat - _cdsSaldoComPlano.FieldByName('CREDITOATUAL').AsFloat
               else
                  dFdoCobOscRiscA := _cdsSaldoComPlano.FieldByName('CREDITOATUAL').AsFloat - _cdsSaldoComPlano.FieldByName('DEBITOATUAL').AsFloat;
               //
               MessageInfo := 'Processando Saldo da Reserva Matemática...';
               _sqlSaldoComPlano.Prepare;
               _sqlSaldoComPlano.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
               _sqlSaldoComPlano.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
               _sqlSaldoComPlano.ParamByName('IDPESSOA').AsFloat       := dEmpresa;
               _sqlSaldoComPlano.ParamByName('PLACONTA').AsString      := Copy(sResMat+'                  ',1,18);
               _sqlSaldoComPlano.ParamByName('PLANO').AsInteger        := iPlano;
               _sqlSaldoComPlano.ParamByName('IDPLANOPREV').AsInteger  := iPlanoPrev;
               _sqlSaldoComPlano.ParamByName('IDPATRO').AsInteger      := iPlanoPatro;
               _cdsSaldoComPlano.Data := _sqlSaldoComPlano.Data;
               if _cdsSaldoComPlano.FieldByName('PLANATUREZA').AsString = 'D' then
                  dResMat := _cdsSaldoComPlano.FieldByName('DEBITOATUAL').AsFloat - _cdsSaldoComPlano.FieldByName('CREDITOATUAL').AsFloat
               else
                  dResMat := _cdsSaldoComPlano.FieldByName('CREDITOATUAL').AsFloat - _cdsSaldoComPlano.FieldByName('DEBITOATUAL').AsFloat;
               //
               MessageInfo := 'Processando Saldo do Defict Técnico...';
               _cdsSaldoComPlano.Close;
               _sqlSaldoComPlano.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
               _sqlSaldoComPlano.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
               _sqlSaldoComPlano.ParamByName('IDPESSOA').AsFloat       := dEmpresa;
               _sqlSaldoComPlano.ParamByName('PLACONTA').AsString      := copy(sDefTec+'                  ',1,18);
               _sqlSaldoComPlano.ParamByName('PLANO').AsInteger        := iPlano;
               _sqlSaldoComPlano.ParamByName('IDPLANOPREV').AsInteger  := iPlanoPrev;
               _sqlSaldoComPlano.ParamByName('IDPATRO').AsInteger      := iPlanoPatro;
               _cdsSaldoComPlano.Data := _sqlSaldoComPlano.Data;
               if _cdsSaldoComPlano.FieldByName('PLANATUREZA').AsString = 'D' then
                  dDefTec := _cdsSaldoComPlano.FieldByName('DEBITOATUAL').AsFloat - _cdsSaldoComPlano.FieldByName('CREDITOATUAL').AsFloat
               else
                  dDefTec := _cdsSaldoComPlano.FieldByName('CREDITOATUAL').AsFloat - _cdsSaldoComPlano.FieldByName('DEBITOATUAL').AsFloat;
               //
               MessageInfo := 'Processando Saldo da Reserva de Contingência...';
               _sqlSaldoComPlano.Prepare;
               _sqlSaldoComPlano.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
               _sqlSaldoComPlano.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
               _sqlSaldoComPlano.ParamByName('IDPESSOA').AsFloat       := dEmpresa;
               _sqlSaldoComPlano.ParamByName('PLACONTA').AsString      := copy(sResCont+ '                  ',1,18);
               _sqlSaldoComPlano.ParamByName('PLANO').AsInteger        := iPlano;
               _sqlSaldoComPlano.ParamByName('IDPLANOPREV').AsInteger  := iPlanoPrev;
               _sqlSaldoComPlano.ParamByName('IDPATRO').AsInteger      := iPlanoPatro;
               _cdsSaldoComPlano.Data := _sqlSaldoComPlano.Data;
               if _cdsSaldoComPlano.FieldByName('PLANATUREZA').AsString = 'D' then
                  dResCont := _cdsSaldoComPlano.FieldByName('DEBITOATUAL').AsFloat - _cdsSaldoComPlano.FieldByName('CREDITOATUAL').AsFloat
               else
                  dResCont := _cdsSaldoComPlano.FieldByName('CREDITOATUAL').AsFloat - _cdsSaldoComPlano.FieldByName('DEBITOATUAL').AsFloat;
               //
               MessageInfo := 'Processando Saldo de Fundo de Oscilação...';
               _sqlSaldoComPlano.Prepare;
               _sqlSaldoComPlano.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
               _sqlSaldoComPlano.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
               _sqlSaldoComPlano.ParamByName('IDPESSOA').AsFloat       := dEmpresa;
               _sqlSaldoComPlano.ParamByName('PLACONTA').AsString      := copy(sFdoCobOscRisc +'                  ',1,18);
               _sqlSaldoComPlano.ParamByName('PLANO').AsInteger        := iPlano;
               _sqlSaldoComPlano.ParamByName('IDPLANOPREV').AsInteger  := iPlanoPrev;
               _sqlSaldoComPlano.ParamByName('IDPATRO').AsInteger      := iPlanoPatro;
               _cdsSaldoComPlano.Data := _sqlSaldoComPlano.Data;
               if _cdsSaldoComPlano.FieldByName('PLANATUREZA').AsString = 'D' then
                  dFdoCobOscRisc := _cdsSaldoComPlano.FieldByName('DEBITOATUAL').AsFloat - _cdsSaldoComPlano.FieldByName('CREDITOATUAL').AsFloat
               else
                  dFdoCobOscRisc := _cdsSaldoComPlano.FieldByName('CREDITOATUAL').AsFloat - _cdsSaldoComPlano.FieldByName('DEBITOATUAL').AsFloat;
            end else begin
               MessageInfo := 'Processando Saldo do Defict Técnico do Exercício Anterior...';
               _sqlSaldoSemPlano.Prepare;
               _sqlSaldoSemPlano.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
               _sqlSaldoSemPlano.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
               _sqlSaldoSemPlano.ParamByName('IDPESSOA').AsFloat       := dEmpresa;
               _sqlSaldoSemPlano.ParamByName('PLACONTA').AsString      := copy(sDefTecA + '                  ',1,18);
               _sqlSaldoSemPlano.ParamByName('PLANO').AsInteger        := iPlano;
               _cdsSaldoSemPlano.Data := _sqlSaldoSemPlano.Data;
               if _cdsSaldoSemPlano.FieldByName('PLANATUREZA').AsString = 'D' then
                  dDefTecA := _cdsSaldoSemPlano.FieldByName('DEBITOATUAL').AsFloat - _cdsSaldoSemPlano.FieldByName('CREDITOATUAL').AsFloat
               else
                  dDefTecA := _cdsSaldoSemPlano.FieldByName('CREDITOATUAL').AsFloat - _cdsSaldoSemPlano.FieldByName('DEBITOATUAL').AsFloat;
               //
               MessageInfo := 'Processando Saldo da Reserva de Contingência do Exercício Anterior...';
               _sqlSaldoSemPlano.Prepare;
               _sqlSaldoSemPlano.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
               _sqlSaldoSemPlano.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
               _sqlSaldoSemPlano.ParamByName('IDPESSOA').AsFloat       := dEmpresa;
               _sqlSaldoSemPlano.ParamByName('PLACONTA').AsString      := copy(sResContA +'                  ',1,18);
               _sqlSaldoSemPlano.ParamByName('PLANO').AsInteger        := iPlano;
               _cdsSaldoSemPlano.Data := _sqlSaldoSemPlano.Data;
               if _cdsSaldoSemPlano.FieldByName('PLANATUREZA').AsString = 'D' then
                  dResContA := _cdsSaldoSemPlano.FieldByName('DEBITOATUAL').AsFloat - _cdsSaldoSemPlano.FieldByName('CREDITOATUAL').AsFloat
               else
                  dResContA := _cdsSaldoSemPlano.FieldByName('CREDITOATUAL').AsFloat - _cdsSaldoSemPlano.FieldByName('DEBITOATUAL').AsFloat;
               //
               MessageInfo := 'Processando Saldo de Fundo de Oscilação do Exercício Anterior...';
               _sqlSaldoSemPlano.Prepare;
               _sqlSaldoSemPlano.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
               _sqlSaldoSemPlano.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
               _sqlSaldoSemPlano.ParamByName('IDPESSOA').AsFloat       := dEmpresa;
               _sqlSaldoSemPlano.ParamByName('PLACONTA').AsString      := copy(sFdoCobOscRiscA + '                  ',1,18);
               _sqlSaldoSemPlano.ParamByName('PLANO').AsInteger        := iPlano;
               _cdsSaldoSemPlano.Data := _sqlSaldoSemPlano.Data;
               if _cdsSaldoSemPlano.FieldByName('PLANATUREZA').AsString = 'D' then
                  dFdoCobOscRiscA := _cdsSaldoSemPlano.FieldByName('DEBITOATUAL').AsFloat - _cdsSaldoSemPlano.FieldByName('CREDITOATUAL').AsFloat
               else
                  dFdoCobOscRiscA := _cdsSaldoSemPlano.FieldByName('CREDITOATUAL').AsFloat - _cdsSaldoSemPlano.FieldByName('DEBITOATUAL').AsFloat;

               MessageInfo := 'Processando Saldo da Reserva Matemática...';
               _sqlSaldoSemPlano.Prepare;
               _sqlSaldoSemPlano.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
               _sqlSaldoSemPlano.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
               _sqlSaldoSemPlano.ParamByName('IDPESSOA').AsFloat       := dEmpresa;
               _sqlSaldoSemPlano.ParamByName('PLACONTA').AsString      := copy(sResMat + '                 ',1,18);
               _sqlSaldoSemPlano.ParamByName('PLANO').AsInteger        := iPlano;
               _cdsSaldoSemPlano.Data := _sqlSaldoSemPlano.Data;
               if _cdsSaldoSemPlano.FieldByName('PLANATUREZA').AsString = 'D' then
                  dResMat := _cdsSaldoSemPlano.FieldByName('DEBITOATUAL').AsFloat - _cdsSaldoSemPlano.FieldByName('CREDITOATUAL').AsFloat
               else
                  dResMat := _cdsSaldoSemPlano.FieldByName('CREDITOATUAL').AsFloat - _cdsSaldoSemPlano.FieldByName('DEBITOATUAL').AsFloat;
               //
               MessageInfo := 'Processando Saldo do Defict Técnico...';
               _sqlSaldoSemPlano.Prepare;
               _sqlSaldoSemPlano.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
               _sqlSaldoSemPlano.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
               _sqlSaldoSemPlano.ParamByName('IDPESSOA').AsFloat       := dEmpresa;
               _sqlSaldoSemPlano.ParamByName('PLACONTA').AsString      := copy(sDefTec +'                  ',1,18);
               _sqlSaldoSemPlano.ParamByName('PLANO').AsInteger        := iPlano;
               _cdsSaldoSemPlano.Data := _sqlSaldoSemPlano.Data;
               if _cdsSaldoSemPlano.FieldByName('PLANATUREZA').AsString = 'D' then
                  dDefTec := _cdsSaldoSemPlano.FieldByName('DEBITOATUAL').AsFloat - _cdsSaldoSemPlano.FieldByName('CREDITOATUAL').AsFloat
               else
                  dDefTec := _cdsSaldoSemPlano.FieldByName('CREDITOATUAL').AsFloat - _cdsSaldoSemPlano.FieldByName('DEBITOATUAL').AsFloat;
               //
               MessageInfo := 'Processando Saldo da Reserva de Contingência...';
               _sqlSaldoSemPlano.Prepare;
               _sqlSaldoSemPlano.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
               _sqlSaldoSemPlano.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
               _sqlSaldoSemPlano.ParamByName('IDPESSOA').AsFloat       := dEmpresa;
               _sqlSaldoSemPlano.ParamByName('PLACONTA').AsString      := copy(sResCont+ '                  ',1,18);
               _sqlSaldoSemPlano.ParamByName('PLANO').AsInteger        := iPlano;
               _cdsSaldoSemPlano.Data := _sqlSaldoSemPlano.Data;
               if _cdsSaldoSemPlano.FieldByName('PLANATUREZA').AsString = 'D' then
                  dResCont := _cdsSaldoSemPlano.FieldByName('DEBITOATUAL').AsFloat - _cdsSaldoSemPlano.FieldByName('CREDITOATUAL').AsFloat
               else
                  dResCont := _cdsSaldoSemPlano.FieldByName('CREDITOATUAL').AsFloat - _cdsSaldoSemPlano.FieldByName('DEBITOATUAL').AsFloat;
               //
               MessageInfo := 'Processando Saldo de Fundo de Oscilação...';
               _sqlSaldoSemPlano.Prepare;
               _sqlSaldoSemPlano.ParamByName('PEREXERCICIO').AsInteger := iExercicio;
               _sqlSaldoSemPlano.ParamByName('PERNUMERO').AsInteger    := iPeriodo;
               _sqlSaldoSemPlano.ParamByName('IDPESSOA').AsFloat       := dEmpresa;
               _sqlSaldoSemPlano.ParamByName('PLACONTA').AsString      := copy(sFdoCobOscRisc+'                  ',1,18);
               _sqlSaldoSemPlano.ParamByName('PLANO').AsInteger        := iPlano;
               _cdsSaldoSemPlano.Data := _sqlSaldoSemPlano.Data;
               if _cdsSaldoSemPlano.FieldByName('PLANATUREZA').AsString = 'D' then
                  dFdoCobOscRisc := _cdsSaldoSemPlano.FieldByName('DEBITOATUAL').AsFloat - _cdsSaldoSemPlano.FieldByName('CREDITOATUAL').AsFloat
               else
                  dFdoCobOscRisc := _cdsSaldoSemPlano.FieldByName('CREDITOATUAL').AsFloat - _cdsSaldoSemPlano.FieldByName('DEBITOATUAL').AsFloat;
            end;
            if dDefTec <> 0 then
            begin
               Lancamento.lcTestaConta := True;
               cTipoLanc := '2';
               Lancamento.lcTipConvOfiDeb := 'D';
               Lancamento.lcTipConvGerDeb := 'D';
               Lancamento.lcTipConvGe1Deb := 'D';
               Lancamento.lcTipConvGe2Deb := 'D';
               Lancamento.lcOriAplDeb     := 'O';

               Lancamento.lcTipConvOfiCre := 'D';
               Lancamento.lcTipConvGerCre := 'D';
               Lancamento.lcTipConvGe1Cre := 'D';
               Lancamento.lcTipConvGe2Cre := 'D';
               Lancamento.lcOriAplCre     := 'A';

               sNumDoc  := '';
               sCCustoD := '';
               sCCustoC := '';

               if dFdoCobOscRiscA <> 0 then begin
                  sHistorico := sHistPrin + ' - Reversão do Superavit Técnico';
                  HistoContab.ArrumaHistorico(sHistorico);
                  if dDefTec > dFdoCobOscRiscA then
                  begin

                     sContaD  := sFdoCobOscRiscA;
                     sContaC  := sDefTec;
                     dValLanc := dFdoCobOscRiscA;

                     If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                               iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                               iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                               sDataLanc,sNumDoc,HistoContab.Hist1,
                                               HistoContab.Hist2,HistoContab.Hist3,
                                               HistoContab.Hist4,HistoContab.Hist5,
                                               sTipoOper,sCCustoD,sContaD,
                                               sCCustoC,sContaC,sHistorico,
                                               dValLanc,False,bUsaPPatro,
                                               // 06/01/03 Alex 14451 - Nova segregação
                                               -1, -1) then

                     Begin
                        MessageInfo := Lancamento.MessageInfo;
                        Raise Exception.Create(Lancamento.MessageInfo);
                     End Else
                     Begin
                          dPlnCodigo := Lancamento.RetornoPlnCodigo;
                     End;

                     with _sqlPlanilha do
                     begin
                        Prepare;
                        ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
                        _cdsPlanilha.Data := Data;
                        if not _cdsPlanilha.isEmpty then
                        begin
                           MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                           sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                        end;
                     end;
                  end else
                  begin
                     sContaD  := sFdoCobOscRiscA;
                     sContaC  := sDefTec;
                     dValLanc := dDefTec;

                     If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                               iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                               iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                               sDataLanc,sNumDoc,HistoContab.Hist1,
                                               HistoContab.Hist2,HistoContab.Hist3,
                                               HistoContab.Hist4,HistoContab.Hist5,
                                               sTipoOper,sCCustoD,sContaD,
                                               sCCustoC,sContaC,sHistorico,
                                               dValLanc,False,bUsaPPatro,
                                               // 06/01/03 Alex 14451 - Nova segregação
                                               -1, -1) then

                     Begin
                        MessageInfo :=  Lancamento.MessageInfo;
                        Raise Exception.Create(Lancamento.MessageInfo);
                     End Else
                     Begin
                          dPlnCodigo := Lancamento.RetornoPlnCodigo;
                     End;

                     with _sqlPlanilha do
                     begin
                        Prepare;
                        ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
                        _cdsPlanilha.Data := Data;
                        if not _cdsPlanilha.isEmpty then
                        begin
                           MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                           sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                        end;
                     end;
                  end;
               end;
               if dDefTec > dFdoCobOscRiscA then begin
                  if dResContA <> 0 then begin
                     if (dDefTec-dFdoCobOscRiscA) > dResContA then begin
                        sHistorico := sHistPrin + ' - Reversão do Superavit Técnico';
                        HistoContab.ArrumaHistorico(sHistorico);

                        sContaD  := sResContA;
                        sContaC  := sDefTec;
                        dValLanc := dResContA;

                        If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                  iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                  iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                  sDataLanc,sNumDoc,HistoContab.Hist1,
                                                  HistoContab.Hist2,HistoContab.Hist3,
                                                  HistoContab.Hist4,HistoContab.Hist5,
                                                  sTipoOper,sCCustoD,sContaD,
                                                  sCCustoC,sContaC,sHistorico,
                                                  dValLanc,False,bUsaPPatro,
                                                  // 06/01/03 Alex 14451 - Nova segregação
                                                  -1, -1) then

                        Begin
                           MessageInfo :=  Lancamento.MessageInfo;
                           Raise Exception.Create(Lancamento.MessageInfo);
                        End Else
                        Begin
                             dPlnCodigo := Lancamento.RetornoPlnCodigo;
                        End;

                        with _sqlPlanilha do
                        begin
                           Prepare;
                           ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
                           _cdsPlanilha.Data := Data;
                           if not _cdsPlanilha.isEmpty then
                           begin
                              MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                              sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                           end;
                        end;
                        //
                        sHistorico := sHistPrin + ' - Formação de Deficit Técnico';
                        HistoContab.ArrumaHistorico(sHistorico);

                        sContaD  := sDefTecA;
                        sContaC  := sDefTec;
                        // 04/08/03 by Alex - alterado pela conferência do fonte em 2 camadas
                        // dValLanc := dDefTec-dFdoCobOscRiscA;
                        dValLanc := ( dDefTec-dFdoCobOscRiscA ) - dResContA;

                        If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                  iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                  iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                  sDataLanc,sNumDoc,HistoContab.Hist1,
                                                  HistoContab.Hist2,HistoContab.Hist3,
                                                  HistoContab.Hist4,HistoContab.Hist5,
                                                  sTipoOper,sCCustoD,sContaD,
                                                  sCCustoC,sContaC,sHistorico,
                                                  dValLanc,False,bUsaPPatro,
                                                  // 06/01/03 Alex 14451 - Nova segregação
                                                  -1, -1) then

                        Begin
                           MessageInfo := Lancamento.MessageInfo;
                           Raise Exception.Create(Lancamento.MessageInfo);
                        End Else
                        Begin
                             dPlnCodigo := Lancamento.RetornoPlnCodigo;
                        End;

                        with _sqlPlanilha do
                        begin
                           Prepare;
                           ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
                           _cdsPlanilha.Data := Data;
                           if not _cdsPlanilha.isEmpty then
                           begin
                              MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                              sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                           end;
                        end;
                     end else begin
                        sHistorico := sHistPrin + ' - Reversão do Superavit Técnico';
                        HistoContab.ArrumaHistorico(sHistorico);

                        sContaD  := sResContA;
                        sContaC  := sDefTec;
                        dValLanc := dDefTec- dFdoCobOscRiscA;

                        If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                  iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                  iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                  sDataLanc,sNumDoc,HistoContab.Hist1,
                                                  HistoContab.Hist2,HistoContab.Hist3,
                                                  HistoContab.Hist4,HistoContab.Hist5,
                                                  sTipoOper,sCCustoD,sContaD,
                                                  sCCustoC,sContaC,sHistorico,
                                                  dValLanc,False,bUsaPPatro,
                                                  // 06/01/03 Alex 14451 - Nova segregação
                                                  -1, -1) then

                        Begin
                           MessageInfo := Lancamento.MessageInfo;
                           Raise Exception.Create(Lancamento.MessageInfo);
                        End Else
                        Begin
                             dPlnCodigo := Lancamento.RetornoPlnCodigo;
                        End;

                        with _sqlPlanilha do
                        begin
                           Prepare;
                           ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
                           _cdsPlanilha.Data := Data;
                           if not _cdsPlanilha.isEmpty then
                           begin
                              MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                              sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                           end;
                        end;
                     end;
                  end else
                  begin
                     sHistorico := sHistPrin + ' - Formação de Deficit Técnico';
                     HistoContab.ArrumaHistorico(sHistorico);

                     sContaD  := sDefTecA;
                     sContaC  := sDefTec;
                     dValLanc := dDefTec-dFdoCobOscRiscA;

                     If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                               iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                               iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                               sDataLanc,sNumDoc,HistoContab.Hist1,
                                               HistoContab.Hist2,HistoContab.Hist3,
                                               HistoContab.Hist4,HistoContab.Hist5,
                                               sTipoOper,sCCustoD,sContaD,
                                               sCCustoC,sContaC,sHistorico,
                                               dValLanc,False,bUsaPPatro,
                                               // 06/01/03 Alex 14451 - Nova segregação
                                               -1, -1) then

                     Begin
                        MessageInfo :=  Lancamento.MessageInfo;
                        Raise Exception.Create(Lancamento.MessageInfo);
                     End Else
                     Begin
                          dPlnCodigo := Lancamento.RetornoPlnCodigo;
                     End;

                     with _sqlPlanilha do
                     begin
                        Prepare;
                        ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
                        _cdsPlanilha.Data := Data;
                        if not _cdsPlanilha.isEmpty then
                        begin
                           MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                           sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                        end;
                     end;
                  end;
               end;
            end;

            if (dFdoCobOscRisc <> 0) or (dResCont <> 0) then
            begin
               Lancamento.lcTestaConta := True;
               cTipoLanc := '2';
               Lancamento.lcTipConvOfiDeb := 'D';
               Lancamento.lcTipConvGerDeb := 'D';
               Lancamento.lcTipConvGe1Deb := 'D';
               Lancamento.lcTipConvGe2Deb := 'D';
               Lancamento.lcOriAplDeb     := 'O';

               Lancamento.lcTipConvOfiCre := 'D';
               Lancamento.lcTipConvGerCre := 'D';
               Lancamento.lcTipConvGe1Cre := 'D';
               Lancamento.lcTipConvGe2Cre := 'D';
               Lancamento.lcOriAplCre     := 'A';

               sNumDoc  := '';
               sCCustoD := '';
               sCCustoC := '';

               if dDefTecA <> 0 then begin
                  if (dFdoCobOscRisc+dResCont) > dDefTecA then begin
                     if dFdoCobOscRisc > dDefTecA then begin
                        dValor1 := dDefTecA;
                        dValor2 := 0;
                        dValor3 := dFdoCobOscRisc - dDefTecA;
                        dValor4 := dResCont;
                     end else begin
                        dValor1 := dFdoCobOscRisc;
                        dValor2 := dDefTecA-dFdoCobOscRisc;
                        dValor3 := 0;
                        dValor4 := dFdoCobOscRisc + dResCont - dDefTecA;
                     end;
                     sHistorico := sHistPrin + ' - Reversão de Deficit Técnico';
                     HistoContab.ArrumaHistorico(sHistorico);

                     sContaD  := sFdoCobOscRisc;
                     sContaC  := sDefTecA;
                     dValLanc := dValor1;

                     If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                               iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                               iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                               sDataLanc,sNumDoc,HistoContab.Hist1,
                                               HistoContab.Hist2,HistoContab.Hist3,
                                               HistoContab.Hist4,HistoContab.Hist5,
                                               sTipoOper,sCCustoD,sContaD,
                                               sCCustoC,sContaC,sHistorico,
                                               dValLanc,False,bUsaPPatro,
                                               // 06/01/03 Alex 14451 - Nova segregação
                                               -1, -1) then

                     Begin
                        MessageInfo :=  Lancamento.MessageInfo;
                        Raise Exception.Create(Lancamento.MessageInfo);
                     End Else
                     Begin
                          dPlnCodigo := Lancamento.RetornoPlnCodigo;
                     End;

                     with _sqlPlanilha do
                     begin
                        Prepare;
                        ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
                        _cdsPlanilha.Data := Data;
                        if not _cdsPlanilha.isEmpty then
                        begin
                           MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                           sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                        end;
                     end;

                     if dValor2 <> 0 then
                     begin
                        sContaD  := sResCont;
                        sContaC  := sDefTecA;
                        dValLanc := dValor2;

                        If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                  iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                  iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                  sDataLanc,sNumDoc,HistoContab.Hist1,
                                                  HistoContab.Hist2,HistoContab.Hist3,
                                                  HistoContab.Hist4,HistoContab.Hist5,
                                                  sTipoOper,sCCustoD,sContaD,
                                                  sCCustoC,sContaC,sHistorico,
                                                  dValLanc,False,bUsaPPatro,
                                                  // 06/01/03 Alex 14451 - Nova segregação
                                                  -1, -1) then

                        Begin
                           MessageInfo :=  Lancamento.MessageInfo;
                           Raise Exception.Create(Lancamento.MessageInfo);
                        End Else
                        Begin
                             dPlnCodigo := Lancamento.RetornoPlnCodigo;
                        End;

                        with _sqlPlanilha do
                        begin
                           Prepare;
                           ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
                           _cdsPlanilha.Data := Data;
                           if not _cdsPlanilha.isEmpty then
                           begin
                              MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                              sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                           end;
                        end;
                     end;
                     if (dResMat*0.25) <= (dValor3 + dValor4) then begin
                        //Vai tudo para reserva de contingencia
                        sHistorico := sHistPrin + ' - Formação de Superavit Técnico';
                        HistoContab.ArrumaHistorico(sHistorico);
                        if dValor3 <> 0 then
                        begin
                           sContaD  := sFdoCobOscRisc;
                           sContaC  := sResContA;
                           dValLanc := dValor3;

                           If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                     iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                     iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                     sDataLanc,sNumDoc,HistoContab.Hist1,
                                                     HistoContab.Hist2,HistoContab.Hist3,
                                                     HistoContab.Hist4,HistoContab.Hist5,
                                                     sTipoOper,sCCustoD,sContaD,
                                                     sCCustoC,sContaC,sHistorico,
                                                     dValLanc,False,bUsaPPatro,
                                                     // 06/01/03 Alex 14451 - Nova segregação
                                                     -1, -1) then

                           Begin
                              MessageInfo :=  Lancamento.MessageInfo;
                              Raise Exception.Create(Lancamento.MessageInfo);
                           End Else
                           Begin
                                dPlnCodigo := Lancamento.RetornoPlnCodigo;
                           End;

                           with _sqlPlanilha do
                           begin
                              Prepare;
                              ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
                              _cdsPlanilha.Data := Data;
                              if not _cdsPlanilha.isEmpty then
                              begin
                                 MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                                 sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                              end;
                           end;
                        end;
                        if dValor4 <> 0 then
                        begin

                           sContaD  := sResCont;
                           sContaC  := sResContA;
                           dValLanc := dValor4;

                           If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                     iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                     iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                     sDataLanc,sNumDoc,HistoContab.Hist1,
                                                     HistoContab.Hist2,HistoContab.Hist3,
                                                     HistoContab.Hist4,HistoContab.Hist5,
                                                     sTipoOper,sCCustoD,sContaD,
                                                     sCCustoC,sContaC,sHistorico,
                                                     dValLanc,False,bUsaPPatro,
                                                     // 06/01/03 Alex 14451 - Nova segregação
                                                     -1, -1) then

                           Begin
                              MessageInfo :=  Lancamento.MessageInfo;
                              Raise Exception.Create(Lancamento.MessageInfo);
                           End Else
                           Begin
                                dPlnCodigo := Lancamento.RetornoPlnCodigo;
                           End;

                           with _sqlPlanilha do
                           begin
                              Prepare;
                              ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
                              _cdsPlanilha.Data := Data;
                              if not _cdsPlanilha.isEmpty then
                              begin
                                 MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                                 sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                              end;
                           end;
                        end;
                     end else
                     begin
                        sHistorico := sHistPrin + ' - Formação de Superavit Técnico';
                        HistoContab.ArrumaHistorico(sHistorico);
                        //
                        if dValor3 > (dResMat*0.25) then begin
                           dValor31 := (dResMat*0.25);           //Vai entrar no RESCONTA
                           dValor32 := dValor3-(dResMat*0.25);  //Vai entrar no FDOSCRISCA
                           dValor41 := 0;        //Vai entrar no RESCONTA
                           dValor42 := dValor4; //Vai entrar no FDOSCRISCA
                        end else begin
                           dValor31 := dValor3;                //Vai entrar no RESCONTA
                           dValor32 := dValor3-(dResMat*0.25);  //Vai entrar no FDOSCRISCA
                           dValor41 := (dResMat*0.25)-dValor3; //Vai entrar no RESCONTA
                           dValor42 := dValor4+dValor3-(dResMat*0.25); //Vai entrar no FDOSCRISCA
                        end;
                        //
                        if dValor31 <> 0 then
                        begin
                           sContaD  := sResCont;
                           sContaC  := sResContA;
                           dValLanc := dValor31;

                           If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                     iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                     iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                     sDataLanc,sNumDoc,HistoContab.Hist1,
                                                     HistoContab.Hist2,HistoContab.Hist3,
                                                     HistoContab.Hist4,HistoContab.Hist5,
                                                     sTipoOper,sCCustoD,sContaD,
                                                     sCCustoC,sContaC,sHistorico,
                                                     dValLanc,False,bUsaPPatro,
                                                     // 06/01/03 Alex 14451 - Nova segregação
                                                     -1, -1) then

                           Begin
                              MessageInfo :=  Lancamento.MessageInfo;
                              Raise Exception.Create(Lancamento.MessageInfo);
                           End Else
                           Begin
                                dPlnCodigo := Lancamento.RetornoPlnCodigo;
                           End;

                           with _sqlPlanilha do
                           begin
                              Prepare;
                              ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
                              _cdsPlanilha.Data := Data;
                              if not _cdsPlanilha.isEmpty then
                              begin
                                 MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                                 sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                              end;
                           end;
                        end;
                        if dValor41 <> 0 then
                        begin

                           sContaD  := sFdoCobOscRisc;
                           sContaC  := sResContA;
                           dValLanc := dValor41;

                           If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                     iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                     iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                     sDataLanc,sNumDoc,HistoContab.Hist1,
                                                     HistoContab.Hist2,HistoContab.Hist3,
                                                     HistoContab.Hist4,HistoContab.Hist5,
                                                     sTipoOper,sCCustoD,sContaD,
                                                     sCCustoC,sContaC,sHistorico,
                                                     dValLanc,False,bUsaPPatro,
                                                     // 06/01/03 Alex 14451 - Nova segregação
                                                     -1, -1) then

                           Begin
                              MessageInfo :=  Lancamento.MessageInfo;
                              Raise Exception.Create(Lancamento.MessageInfo);
                           End Else
                           Begin
                                dPlnCodigo := Lancamento.RetornoPlnCodigo;
                           End;

                           with _sqlPlanilha do
                           begin
                              Prepare;
                              ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
                              _cdsPlanilha.Data := Data;
                              if not _cdsPlanilha.isEmpty then
                              begin
                                 MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                                 sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                              end;
                           end;
                        end;
                        //
                        if dValor32 <> 0 then
                        begin

                           sContaD  := sResCont;
                           sContaC  := sFdoCobOscRiscA;
                           dValLanc := dValor32;

                           If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                     iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                     iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                     sDataLanc,sNumDoc,HistoContab.Hist1,
                                                     HistoContab.Hist2,HistoContab.Hist3,
                                                     HistoContab.Hist4,HistoContab.Hist5,
                                                     sTipoOper,sCCustoD,sContaD,
                                                     sCCustoC,sContaC,sHistorico,
                                                     dValLanc,False,bUsaPPatro,
                                                     // 06/01/03 Alex 14451 - Nova segregação
                                                     -1, -1) then

                           Begin
                              MessageInfo :=  Lancamento.MessageInfo;
                              Raise Exception.Create(Lancamento.MessageInfo);
                           End Else
                           Begin
                                dPlnCodigo := Lancamento.RetornoPlnCodigo;
                           End;

                           with _sqlPlanilha do
                           begin
                              Prepare;
                              ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
                              _cdsPlanilha.Data := Data;
                              if not _cdsPlanilha.isEmpty then
                              begin
                                 MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                                 sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                              end;
                           end;
                        end;
                        if dValor42 <> 0 then
                        begin

                           sContaD  := sFdoCobOscRisc;
                           sContaC  := sFdoCobOscRiscA;
                           dValLanc := dValor42;

                           If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                     iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                     iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                     sDataLanc,sNumDoc,HistoContab.Hist1,
                                                     HistoContab.Hist2,HistoContab.Hist3,
                                                     HistoContab.Hist4,HistoContab.Hist5,
                                                     sTipoOper,sCCustoD,sContaD,
                                                     sCCustoC,sContaC,sHistorico,
                                                     dValLanc,False,bUsaPPatro,
                                                     // 06/01/03 Alex 14451 - Nova segregação
                                                     -1, -1) then

                           Begin
                              MessageInfo :=  Lancamento.MessageInfo;
                              Raise Exception.Create(Lancamento.MessageInfo);
                           End Else
                           Begin
                                dPlnCodigo := Lancamento.RetornoPlnCodigo;
                           End;

                           with _sqlPlanilha do
                           begin
                              Prepare;
                              ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
                              _cdsPlanilha.Data := Data;
                              if not _cdsPlanilha.isEmpty then
                              begin
                                 MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                                 sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                              end;
                           end;
                        end;
                     end;
                  end else begin
                     sHistorico := sHistPrin + ' - Reversão de Deficit Técnico';
                     HistoContab.ArrumaHistorico(sHistorico);
                     if dFormSupTec <> 0 then
                     begin
                        sContaD  := sFormSupTec;
                        sContaC  := sDefTecA;
                        dValLanc := dFormSupTec;

                        If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                  iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                  iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                  sDataLanc,sNumDoc,HistoContab.Hist1,
                                                  HistoContab.Hist2,HistoContab.Hist3,
                                                  HistoContab.Hist4,HistoContab.Hist5,
                                                  sTipoOper,sCCustoD,sContaD,
                                                  sCCustoC,sContaC,sHistorico,
                                                  dValLanc,False,bUsaPPatro,
                                                  // 06/01/03 Alex 14451 - Nova segregação
                                                  -1, -1) then

                        Begin
                           MessageInfo :=  Lancamento.MessageInfo;
                           Raise Exception.Create(Lancamento.MessageInfo);
                        End Else
                        Begin
                             dPlnCodigo := Lancamento.RetornoPlnCodigo;
                        End;

                        with _sqlPlanilha do
                        begin
                           Prepare;
                           ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
                           _cdsPlanilha.Data := Data;
                           if not _cdsPlanilha.isEmpty then
                           begin
                              MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                              sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                           end;
                        end;
                     end;
                     if dResCont <> 0 then
                     begin
                        sContaD  := sResCont;
                        sContaC  := sDefTecA;
                        dValLanc := dResCont;

                        If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                  iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                  iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                  sDataLanc,sNumDoc,HistoContab.Hist1,
                                                  HistoContab.Hist2,HistoContab.Hist3,
                                                  HistoContab.Hist4,HistoContab.Hist5,
                                                  sTipoOper,sCCustoD,sContaD,
                                                  sCCustoC,sContaC,sHistorico,
                                                  dValLanc,False,bUsaPPatro,
                                                  // 06/01/03 Alex 14451 - Nova segregação
                                                  -1, -1) then

                        Begin
                           MessageInfo :=  Lancamento.MessageInfo;
                           Raise Exception.Create(Lancamento.MessageInfo);
                        End Else
                        Begin
                             dPlnCodigo := Lancamento.RetornoPlnCodigo;
                        End;

                        with _sqlPlanilha do
                        begin
                           Prepare;
                           ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
                           _cdsPlanilha.Data := Data;
                           if not _cdsPlanilha.isEmpty then
                           begin
                              MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                              sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                           end;
                        end;
                     end;
                  end;
               end else begin
                  sHistorico := sHistPrin + ' - Formação de Superavit Técnico';
                  HistoContab.ArrumaHistorico(sHistorico);
                  if (dResMat*0.25) >= (dFdoCobOscRisc+dResCont+dResContA) then begin
                     if dResCont <> 0 then
                     begin
                        sContaD  := sResCont;
                        sContaC  := sResContA;
                        dValLanc := dResCont;

                        If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                  iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                  iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                  sDataLanc,sNumDoc,HistoContab.Hist1,
                                                  HistoContab.Hist2,HistoContab.Hist3,
                                                  HistoContab.Hist4,HistoContab.Hist5,
                                                  sTipoOper,sCCustoD,sContaD,
                                                  sCCustoC,sContaC,sHistorico,
                                                  dValLanc,False,bUsaPPatro,
                                                  // 06/01/03 Alex 14451 - Nova segregação
                                                  -1, -1) then

                        Begin
                           MessageInfo :=  Lancamento.MessageInfo;
                           Raise Exception.Create(Lancamento.MessageInfo);
                        End Else
                        Begin
                             dPlnCodigo := Lancamento.RetornoPlnCodigo;
                        End;

                        with _sqlPlanilha do
                        begin
                           Prepare;
                           ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
                           _cdsPlanilha.Data := Data;
                           if not _cdsPlanilha.isEmpty then
                           begin
                              MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                              sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                           end;
                        end;
                     end;

                     if dFdoCobOscRisc <> 0 then
                     begin
                        sContaD  := sFdoCobOscRisc;
                        sContaC  := sResContA;
                        dValLanc := dFdoCobOscRisc;

                        If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                  iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                  iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                  sDataLanc,sNumDoc,HistoContab.Hist1,
                                                  HistoContab.Hist2,HistoContab.Hist3,
                                                  HistoContab.Hist4,HistoContab.Hist5,
                                                  sTipoOper,sCCustoD,sContaD,
                                                  sCCustoC,sContaC,sHistorico,
                                                  dValLanc,False,bUsaPPatro,
                                                  // 06/01/03 Alex 14451 - Nova segregação
                                                  -1, -1) then

                        Begin
                           MessageInfo :=  Lancamento.MessageInfo;
                           Raise Exception.Create(Lancamento.MessageInfo);
                        End Else
                        Begin
                             dPlnCodigo := Lancamento.RetornoPlnCodigo;
                        End;

                        with _sqlPlanilha do
                        begin
                           Prepare;
                           ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
                           _cdsPlanilha.Data := Data;
                           if not _cdsPlanilha.isEmpty then
                           begin
                              MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                              sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                           end;
                        end;
                     end;
                  end else begin
                     if dResContA > (dResMat*0.25) then begin
                        dValor31 := 0;
                        dValor32 := dResCont;
                        dValor41 := 0; //Vai entrar no RESCONTA
                        dValor42 := dFdoCobOscRisc; //Vai entrar no FDOSCRISCA
                        dValor5  := dResContA - (dResMat*0.25)  //Sai do RESCONTA e vai para o FDOSCRISCA
                     end else begin
                        dValor5 :=0;
                        if dResCont > (dResMat*0.25)-dResContA then begin
                           dValor31 := (dResMat*0.25)-dResContA; //Vai entrar no RESCONTA
                           dValor32 := dResCont-dValor31;  //Vai entrar no FDOSCRISCA
                           dValor41 := 0; //Vai entrar no RESCONTA
                           dValor42 := dFdoCobOscRisc; //Vai entrar no FDOSCRISCA
                        end else begin
                           dValor31 := dResCont; //Vai entrar no RESCONTA
                           dValor32 := 0;  //Vai entrar no FDOSCRISCA
                           dValor41 := (dResMat*0.25)-dResContA-dResCont; //Vai entrar no RESCONTA
                           dValor42 := dFdoCobOscRisc-dValor41; //Vai entrar no FDOSCRISCA
                        end;
                     end;
                     //
                     if dValor31 <> 0 then
                     begin
                        sContaD  := sResCont;
                        sContaC  := sResContA;
                        dValLanc := dValor31;

                        If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                  iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                  iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                  sDataLanc,sNumDoc,HistoContab.Hist1,
                                                  HistoContab.Hist2,HistoContab.Hist3,
                                                  HistoContab.Hist4,HistoContab.Hist5,
                                                  sTipoOper,sCCustoD,sContaD,
                                                  sCCustoC,sContaC,sHistorico,
                                                  dValLanc,False,bUsaPPatro,
                                                  // 06/01/03 Alex 14451 - Nova segregação
                                                  -1, -1) then

                        Begin
                           MessageInfo :=  Lancamento.MessageInfo;
                           Raise Exception.Create(Lancamento.MessageInfo);
                        End Else
                        Begin
                             dPlnCodigo := Lancamento.RetornoPlnCodigo;
                        End;

                        with _sqlPlanilha do
                        begin
                           Prepare;
                           ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
                           _cdsPlanilha.Data := Data;
                           if not _cdsPlanilha.isEmpty then
                           begin
                              MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                              sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                           end;
                        end;
                     end;
                     if dValor41 <> 0 then
                     begin
                        sContaD  := sFdoCobOscRisc;
                        sContaC  := sResContA;
                        dValLanc := dValor41;

                        If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                  iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                  iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                  sDataLanc,sNumDoc,HistoContab.Hist1,
                                                  HistoContab.Hist2,HistoContab.Hist3,
                                                  HistoContab.Hist4,HistoContab.Hist5,
                                                  sTipoOper,sCCustoD,sContaD,
                                                  sCCustoC,sContaC,sHistorico,
                                                  dValLanc,False,bUsaPPatro,
                                                  // 06/01/03 Alex 14451 - Nova segregação
                                                  -1, -1) then

                        Begin
                           MessageInfo :=  Lancamento.MessageInfo;
                           Raise Exception.Create(Lancamento.MessageInfo);
                        End Else
                        Begin
                             dPlnCodigo := Lancamento.RetornoPlnCodigo;
                        End;

                        with _sqlPlanilha do
                        begin
                           Prepare;
                           ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
                           _cdsPlanilha.Data := Data;
                           if not _cdsPlanilha.isEmpty then
                           begin
                              MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                              sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                           end;
                        end;
                     end;
                     //
                     if dValor32 <> 0 then
                     begin
                        sContaD  := sResCont;
                        sContaC  := sFdoCobOscRiscA;
                        dValLanc := dValor32;

                        If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                  iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                  iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                  sDataLanc,sNumDoc,HistoContab.Hist1,
                                                  HistoContab.Hist2,HistoContab.Hist3,
                                                  HistoContab.Hist4,HistoContab.Hist5,
                                                  sTipoOper,sCCustoD,sContaD,
                                                  sCCustoC,sContaC,sHistorico,
                                                  dValLanc,False,bUsaPPatro,
                                                  // 06/01/03 Alex 14451 - Nova segregação
                                                  -1, -1) then

                        Begin
                           MessageInfo :=  Lancamento.MessageInfo;
                           Raise Exception.Create(Lancamento.MessageInfo);
                        End Else
                        Begin
                             dPlnCodigo := Lancamento.RetornoPlnCodigo;
                        End;

                        with _sqlPlanilha do
                        begin
                           Prepare;
                           ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
                           _cdsPlanilha.Data := Data;
                           if not _cdsPlanilha.isEmpty then
                           begin
                              MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                              sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                           end;
                        end;
                     end;
                     if dValor42 <> 0 then
                     begin
                        sContaD  := sFdoCobOscRisc;
                        sContaC  := sFdoCobOscRiscA;
                        dValLanc := dValor42;

                        If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                  iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                  iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                  sDataLanc,sNumDoc,HistoContab.Hist1,
                                                  HistoContab.Hist2,HistoContab.Hist3,
                                                  HistoContab.Hist4,HistoContab.Hist5,
                                                  sTipoOper,sCCustoD,sContaD,
                                                  sCCustoC,sContaC,sHistorico,
                                                  dValLanc,False,bUsaPPatro,
                                                  // 06/01/03 Alex 14451 - Nova segregação
                                                  -1, -1) then

                        Begin
                           MessageInfo :=  Lancamento.MessageInfo;
                           Raise Exception.Create(Lancamento.MessageInfo);
                        End Else
                        Begin
                             dPlnCodigo := Lancamento.RetornoPlnCodigo;
                        End;

                        with _sqlPlanilha do
                        begin
                           Prepare;
                           ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
                           _cdsPlanilha.Data := Data;
                           if not _cdsPlanilha.isEmpty then
                           begin
                              MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                              sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                           end;
                        end;
                     end;

                     if dValor5 <> 0 then
                     begin
                        sContaD  := sResContA;
                        sContaC  := sFdoCobOscRiscA;
                        dValLanc := dValor5;

                        If Not Lancamento.InsereLancaContab(cTipoLanc,dEmpresa,iModulo,iUsuario,
                                                  iPlano,iUnidNegoc,iSubContaD,iSubContaC,
                                                  iPlanoPrev, iPlanoPatro,dPlnCodigo,0,
                                                  sDataLanc,sNumDoc,HistoContab.Hist1,
                                                  HistoContab.Hist2,HistoContab.Hist3,
                                                  HistoContab.Hist4,HistoContab.Hist5,
                                                  sTipoOper,sCCustoD,sContaD,
                                                  sCCustoC,sContaC,sHistorico,
                                                  dValLanc,False,bUsaPPatro,
                                                  // 06/01/03 Alex 14451 - Nova segregação
                                                  -1, -1) then

                        Begin
                           MessageInfo :=  Lancamento.MessageInfo;
                           Raise Exception.Create(Lancamento.MessageInfo);
                        End Else
                        Begin
                             dPlnCodigo := Lancamento.RetornoPlnCodigo;
                        End;

                        with _sqlPlanilha do
                        begin
                           Prepare;
                           ParamByName('PLNCODIGO').asFloat := dPlnCodigo;
                           _cdsPlanilha.Data := Data;
                           if not _cdsPlanilha.isEmpty then
                           begin
                              MessageInfo := 'Gerando lançamento na Planilha no. ' + _cdsPlanilha.FieldByName('PLNPLANIL').asString;
                              sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);
                           end;
                        end;
                     end;
                  end;
                  //
               end;
            end;
            _cdsPlanoPatro.Next;
          end;
          Commit;
          Result := True;
          MessageInfo := 'Apuração de Resultado efetuada com Sucesso.';
          sMensAPS_Log := sMensAPS_Log + MessageInfo + chr(13);

      Except
        on E:Exception Do
        Begin
           RollBack;
           Result := False;
           MessageInfo := sMens+' '+E.Message;
        End
      End;
  End;
end;


function TCtrlProcessaContab.GeraSaldoCalculado(dEmpresa,dModulo,dUsuario: Double; iExercicio,
                        iPeriodo:Integer;sMascara :string; bSubConta, bCCusto: Boolean): Boolean;

var
  sPeriodo, sFieldMov,sFieldDeb,sFieldCre, sFieldSal,sMens,sConta :string;


  _sqlInsereSaldos :TCMSqlParams;
  _sqlUpdateSaldos :TCMSqlParams;

  _sqlSaldos :TCMSqlParams;
  _cdsSaldos :TClientDataSet;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GeraSaldoCalculado(dEmpresa,dModulo,dUsuario,iExercicio,
                                     iPeriodo,sMascara,bSubConta, bCCusto);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;

   End Else
   Begin
      sMens       := '';
      MessageInfo := '*';
      Result      := True;

      //======================================================================
      _sqlInsereSaldos := TCMSqlParams.Create(nil);
      _sqlInsereSaldos.ControlObject := Self;

      _sqlUpdateSaldos := TCMSqlParams.Create(nil);
      _sqlUpdateSaldos.ControlObject := Self;

      //======================================================================
      _sqlSaldos := TCMSqlParams.Create(nil);
      _sqlSaldos.ControlObject := Self;
      _cdsSaldos  := TClientDataSet.Create(nil);

      With _sqlSaldos do
      Begin
         SQL.Clear;
         SQL.add('SELECT                                                              ');
         SQL.add('   UN.PLACONTA, UN.CODSUBCONTA, UN.CODCENTROCUSTO,               ');
         SQL.add('   UN.UNIDNEGOC, UN.PLSTIPO, UN.IDPESSOA, UN.IDEMPRESA, UN.PLANO,   ');
         SQL.add('   SUM(UN.DEB) AS DEB,SUM(UN.CRE) AS CRE , SUM(UN.MOV) AS MOV, SUM(UN.SALDO) AS SALDO ');
         SQL.add('FROM                                                                ');
         if (bSubConta) and (bCCusto) then begin
            SQL.add('  ((SELECT PLACONTA, CODSUBCONTA, CODCENTROCUSTO, IDEMPRESA,            ');
         end else begin
            if (not bSubConta) and (bCCusto) then begin
               SQL.add('  ((SELECT PLACONTA, 0 AS CODSUBCONTA ,CODCENTROCUSTO, IDEMPRESA,    ');
            end else begin
               if (bSubConta) and (not bCCusto) then begin
                  SQL.add('  ((SELECT PLACONTA, CODSUBCONTA, ''          '' AS CODCENTROCUSTO, 0 AS IDEMPRESA, ');
               end else begin
                  SQL.add('  ((SELECT PLACONTA, 0 AS CODSUBCONTA, ''          '' AS CODCENTROCUSTO, 0 AS IDEMPRESA, ');
               end;
            end;
         end;
         SQL.add('          UNIDNEGOC, PLSTIPO, IDPESSOA, PLANO,                      ');
         SQL.add('          0 AS DEB, 0 AS CRE, 0 AS MOV,                             ');
         SQL.add('          SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
         SQL.add('          - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDO ');
         SQL.add('   FROM                                                             ');
         SQL.add('      PLANOSALDO                                                    ');
         SQL.add('   WHERE (IDPESSOA =:IDPESSOA) AND                                  ');
         SQL.add('         (PEREXERCICIO =:EXERCICIO) AND                             ');
         SQL.add('         ((PERNUMERO <=:PERIODO) OR (PERNUMERO IS NULL))            ');
         if (bSubConta) and (bCCusto) then begin
            SQL.add('   GROUP BY PLACONTA, CODSUBCONTA, CODCENTROCUSTO, IDEMPRESA,  ');
         end else begin
            if (not bSubConta) and (bCCusto) then begin
               SQL.add('   GROUP BY PLACONTA, CODCENTROCUSTO, IDEMPRESA,            ');
            end else begin
               if (bSubConta) and (not bCCusto) then begin
                  SQL.add('   GROUP BY PLACONTA, CODSUBCONTA,                  ');
               end else begin
                  SQL.add('   GROUP BY PLACONTA,                               ');
               end;
            end;
         end;
         SQL.add('            UNIDNEGOC, IDPESSOA, PLANO, PLSTIPO )        ');
         SQL.add('UNION                                                               ');
         if (bSubConta) and (bCCusto) then begin
            SQL.add('  (SELECT PLACONTA, CODSUBCONTA, CODCENTROCUSTO, IDEMPRESA,            ');
         end else begin
            if (not bSubConta) and (bCCusto) then begin
               SQL.add('   (SELECT PLACONTA, 0 AS CODSUBCONTA ,CODCENTROCUSTO, IDEMPRESA,    ');
            end else begin
               if (bSubConta) and (not bCCusto) then begin
                  SQL.add('  (SELECT PLACONTA, CODSUBCONTA, ''          '' AS CODCENTROCUSTO, 0 AS IDEMPRESA, ');
               end else begin
                  SQL.add('  (SELECT PLACONTA, 0 AS CODSUBCONTA, ''          '' AS CODCENTROCUSTO, 0 AS IDEMPRESA, ');
               end;
            end;
         end;
         SQL.add('          UNIDNEGOC, PLSTIPO, IDPESSOA, PLANO,                    ');
         SQL.add('          SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)) AS DEB, ');
         SQL.add('          SUM(DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS CRE, ');
         SQL.add('          SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)  ');
         SQL.add('            - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS MOV, 0 AS SALDO ');
         SQL.add('   FROM PLANOSALDO                                               ');
         SQL.add('   WHERE (IDPESSOA =:IDPESSOA) AND                               ');
         SQL.add('         (PEREXERCICIO =:EXERCICIO) AND                          ');
         SQL.add('         (PERNUMERO =:PERIODO)                                   ');
         if (bSubConta) and (bCCusto) then begin
            SQL.add('   GROUP BY PLACONTA, CODSUBCONTA, CODCENTROCUSTO, IDEMPRESA, ');
         end else begin
            if (not bSubConta) and (bCCusto) then begin
               SQL.add('   GROUP BY PLACONTA, CODCENTROCUSTO, IDEMPRESA,           ');
            end else begin
               if (bSubConta) and (not bCCusto) then begin
                  SQL.add('   GROUP BY PLACONTA, CODSUBCONTA,                  ');
               end else begin
                  SQL.add('   GROUP BY PLACONTA,                               ');
               end;
            end;
         end;
         SQL.add('            UNIDNEGOC, IDPESSOA, PLANO, PLSTIPO )) UN ');
         SQL.add('GROUP BY                                                         ');
         SQL.add('    UN.PLACONTA, UN.CODSUBCONTA, UN.CODCENTROCUSTO,               ');
         SQL.add('    UN.UNIDNEGOC,UN.PLSTIPO,  UN.IDPESSOA, UN.IDEMPRESA, UN.PLANO ');
         SQL.add('ORDER BY UN.PLACONTA                                              ');

         Prepare;
         ParamByName('IDPESSOA').asFloat    := dEmpresa;
         ParamByName('EXERCICIO').asInteger := iExercicio;
         ParamByName('PERIODO').asInteger   := iPeriodo;

         _cdsSaldos.Data := _sqlSaldos.Data;

         FMaxProgresso := _cdsSaldos.RecordCount;
         _cdsSaldos.First;
      End;

      case iPeriodo of
         1:  sPeriodo := '01';
         2:  sPeriodo := '02';
         3:  sPeriodo := '03';
         4:  sPeriodo := '04';
         5:  sPeriodo := '05';
         6:  sPeriodo := '06';
         7:  sPeriodo := '07';
         8:  sPeriodo := '08';
         9:  sPeriodo := '09';
         10: sPeriodo := '10';
         11: sPeriodo := '11';
         12: sPeriodo := '12';
      end;

      sFieldMov := 'MOVPER' + sPeriodo;
      sFieldDeb := 'DEBPER' + sPeriodo;
      sFieldCre := 'CREPER' + sPeriodo;
      sFieldSal := 'SALPER' + sPeriodo;

      _cdsSaldos.First;
      While not _cdsSaldos.eof do
      Begin

         FNomeCampo := 'Gerando Conta : ' + formatMaskText(sMascara + ';0; ', _cdsSaldos.FieldByName('PLACONTA').asString);
         sConta := Trim(_cdsSaldos.FieldByName('PLACONTA').AsString);

         Try
             StartTransaction;
             While (not _cdsSaldos.eof) and
                   (trim(_cdsSaldos.FieldByName('PLACONTA').AsString) = sConta) do
             Begin
               //*** verifica se existe antes de efetuar operacoes ****
               _sql.SQL.Clear;
               _sql.SQL.Add('SELECT IDSALDOCALCULADO FROM SALDOCALCULADO  ');
               _sql.SQL.Add('WHERE  (RTRIM(PLACONTA) =:PLACONTA) AND      ');

               if (not _cdsSaldos.FieldByName('CODSUBCONTA').isNull) and (_cdsSaldos.FieldByName('CODSUBCONTA').asInteger <> 0) then begin
                  _sql.SQL.Add('   (CODSUBCONTA =:CODSUBCONTA) AND         ');
               end else begin
                  _sql.SQL.Add('   (CODSUBCONTA IS NULL) AND               ');
               end;

               if (not _cdsSaldos.FieldByName('CODCENTROCUSTO').isNull) and (trim(_cdsSaldos.FieldByName('CODCENTROCUSTO').asString) <> '') then begin
                  _sql.SQL.Add('   (RTRIM(CODCENTROCUSTO) =:CODCENTROCUSTO) AND ');
                  _sql.SQL.Add('   (IDEMPRESA =:IDEMPRESA) AND                  ');
               end else begin
                  _sql.SQL.Add('   (CODCENTROCUSTO IS NULL) AND                 ');
               end;

               if not _cdsSaldos.FieldByName('UNIDNEGOC').isNull then begin
                  _sql.SQL.Add('   (UNIDNEGOC =:UNIDNEGOC) AND                    ');
               end else begin
                  _sql.SQL.Add('   (UNIDNEGOC IS NULL) AND                        ');
               end;
               _sql.SQL.Add('   (IDPESSOA =:IDPESSOA) AND                         ');
               _sql.SQL.Add('   (PLANO =:PLANO) AND (PEREXERCICIO =:PEREXERCICIO) ');

               _sql.Prepare;
               _sql.ParamByName('PLACONTA').asString      := _cdsSaldos.FieldByName('PLACONTA').asString;
               _sql.ParamByName('PLANO').asInteger        := _cdsSaldos.FieldByName('PLANO').asInteger;
               _sql.ParamByName('PEREXERCICIO').asInteger := iExercicio;

               if (not _cdsSaldos.FieldByName('CODSUBCONTA').isNull) and (_cdsSaldos.FieldByName('CODSUBCONTA').asInteger <> 0) then
               begin
                  _sql.ParamByName('CODSUBCONTA').asInteger := _cdsSaldos.FieldByName('CODSUBCONTA').asInteger;
               end;

               if (not _cdsSaldos.FieldByName('CODCENTROCUSTO').isNull) and (trim(_cdsSaldos.FieldByName('CODCENTROCUSTO').asString) <> '') then
               begin
                  _sql.ParamByName('CODCENTROCUSTO').asString := trim(_cdsSaldos.FieldByName('CODCENTROCUSTO').asString);
                  _sql.ParamByName('IDEMPRESA').asInteger     := _cdsSaldos.FieldByName('IDEMPRESA').asInteger;
               end;

               if not _cdsSaldos.FieldByName('UNIDNEGOC').isNull then begin
                  _sql.ParamByName('UNIDNEGOC').asInteger := _cdsSaldos.FieldByName('UNIDNEGOC').asInteger;
               end;

               _sql.ParamByName('IDPESSOA').asInteger  := _cdsSaldos.FieldByName('IDPESSOA').asInteger;
               _cds.Data := _sql.Data;

               if not _cds.IsEmpty then
               begin
                 //==== Fazer Alteracao ====
                 _sqlUpdateSaldos.SQL.Clear;
                 _sqlUpdateSaldos.SQL.Add('UPDATE SALDOCALCULADO SET                     ');
                 _sqlUpdateSaldos.SQL.Add(sFieldMov + '=:' + sFieldMov + ',              ');
                 _sqlUpdateSaldos.SQL.Add(sFieldDeb + '=:' + sFieldDeb + ',              ');
                 _sqlUpdateSaldos.SQL.Add(sFieldCre + '=:' + sFieldCre + ',              ');
                 _sqlUpdateSaldos.SQL.Add(sFieldSal + '=:' + sFieldSal + '               ');
                 _sqlUpdateSaldos.SQL.Add('WHERE                                         ');
                 _sqlUpdateSaldos.SQL.Add('   (RTRIM(PLACONTA) =:PLACONTA) AND           ');

                 if (not _cdsSaldos.FieldByName('CODSUBCONTA').isNull) and (_cdsSaldos.FieldByName('CODSUBCONTA').asInteger <> 0) then begin
                    _sqlUpdateSaldos.SQL.Add('   (CODSUBCONTA =:CODSUBCONTA) AND         ');
                 end else begin
                    _sqlUpdateSaldos.SQL.Add('   (CODSUBCONTA IS NULL) AND               ');
                 end;

                 if (not _cdsSaldos.FieldByName('CODCENTROCUSTO').isNull) and (trim(_cdsSaldos.FieldByName('CODCENTROCUSTO').asString) <> '') then begin
                    _sqlUpdateSaldos.SQL.Add('   (RTRIM(CODCENTROCUSTO) =:CODCENTROCUSTO) AND ');
                    _sqlUpdateSaldos.SQL.Add('   (IDEMPRESA =:IDEMPRESA) AND                   ');
                 end else begin
                    _sqlUpdateSaldos.SQL.Add('   (CODCENTROCUSTO IS NULL) AND               ');
                 end;

                 if not _cdsSaldos.FieldByName('UNIDNEGOC').isNull then begin
                    _sqlUpdateSaldos.SQL.Add('   (UNIDNEGOC =:UNIDNEGOC) AND            ');
                 end else begin
                    _sqlUpdateSaldos.SQL.Add('   (UNIDNEGOC IS NULL) AND               ');
                 end;
                 _sqlUpdateSaldos.SQL.Add('   (IDPESSOA =:IDPESSOA) AND              ');
                 _sqlUpdateSaldos.SQL.Add('   (PLANO =:PLANO) AND (PEREXERCICIO =:PEREXERCICIO) ');

                 _sqlUpdateSaldos.Prepare;
                 _sqlUpdateSaldos.ParamByName('PLACONTA').asString   := _cdsSaldos.FieldByName('PLACONTA').asString;
                 _sqlUpdateSaldos.ParamByName('PLANO').asInteger     := _cdsSaldos.FieldByName('PLANO').asInteger;
                 _sqlUpdateSaldos.ParamByName('PEREXERCICIO').asInteger := iExercicio;

                 if (not _cdsSaldos.FieldByName('CODSUBCONTA').isNull) and (_cdsSaldos.FieldByName('CODSUBCONTA').asInteger <> 0) then
                 begin
                    _sqlUpdateSaldos.ParamByName('CODSUBCONTA').asInteger := _cdsSaldos.FieldByName('CODSUBCONTA').asInteger;
                 end;

                 if (not _cdsSaldos.FieldByName('CODCENTROCUSTO').isNull) and (trim(_cdsSaldos.FieldByName('CODCENTROCUSTO').asString) <> '') then
                 begin
                    _sqlUpdateSaldos.ParamByName('CODCENTROCUSTO').asString := trim(_cdsSaldos.FieldByName('CODCENTROCUSTO').asString);
                    _sqlUpdateSaldos.ParamByName('IDEMPRESA').asInteger     := _cdsSaldos.FieldByName('IDEMPRESA').asInteger;
                 end;

                 if not _cdsSaldos.FieldByName('UNIDNEGOC').isNull then begin
                    _sqlUpdateSaldos.ParamByName('UNIDNEGOC').asInteger := _cdsSaldos.FieldByName('UNIDNEGOC').asInteger;
                 end;

                 _sqlUpdateSaldos.ParamByName('IDPESSOA').asInteger  := _cdsSaldos.FieldByName('IDPESSOA').asInteger;
                 _sqlUpdateSaldos.ParamByName(sFieldMov).asFloat := _cdsSaldos.FieldByName('MOV').asFloat;
                 _sqlUpdateSaldos.ParamByName(sFieldDeb).asFloat := _cdsSaldos.FieldByName('DEB').asFloat;
                 _sqlUpdateSaldos.ParamByName(sFieldCre).asFloat := _cdsSaldos.FieldByName('CRE').asFloat;
                 _sqlUpdateSaldos.ParamByName(sFieldSal).asFloat := _cdsSaldos.FieldByName('SALDO').asFloat;

                 if not ExecSQL(_sqlUpdateSaldos.SQLChanged,false) Then
                 begin
                    sMens := 'Erro ao Alterar Dados na Tabela SALDOCALCULADO.';
                    Raise Exception.Create(sMens);
                 end
               end else
               begin
                 //==== Fazer insersao ====
                 _sqlInsereSaldos.SQL.Clear;
                 _sqlInsereSaldos.SQL.Add('INSERT INTO SALDOCALCULADO                           ');
                 _sqlInsereSaldos.SQL.Add('   (IDSALDOCALCULADO, IDPESSOA, PLACONTA, PLANO, PEREXERCICIO, ');

                 if (not _cdsSaldos.FieldByName('CODSUBCONTA').isNull) and
                    (_cdsSaldos.FieldByName('CODSUBCONTA').asInteger <> 0) then
                 begin
                    _sqlInsereSaldos.SQL.Add('CODSUBCONTA, ');
                 end;

                 if (not _cdsSaldos.FieldByName('CODCENTROCUSTO').isNull) and
                    (trim(_cdsSaldos.FieldByName('CODCENTROCUSTO').asString) <> '') then
                 begin
                    _sqlInsereSaldos.SQL.Add('CODCENTROCUSTO, IDEMPRESA, ');
                 end;

                 if not _cdsSaldos.FieldByName('UNIDNEGOC').isNull then
                 begin
                    _sqlInsereSaldos.SQL.Add('UNIDNEGOC,     ');
                 end;

                 _sqlInsereSaldos.SQL.Add('   PSCTIPO,                   ');
                 _sqlInsereSaldos.SQL.Add(sFieldMov + ',' + sFieldDeb + ',' + sFieldCre + ',' + sFieldSal + ')');
                 _sqlInsereSaldos.SQL.Add('VALUES                                        ');
                 _sqlInsereSaldos.SQL.Add('   (:IDSALDOCALCULADO, :IDPESSOA, :PLACONTA, :PLANO, :PEREXERCICIO, ');

                 if (not _cdsSaldos.FieldByName('CODSUBCONTA').isNull) and
                    (_cdsSaldos.FieldByName('CODSUBCONTA').asInteger <> 0) then
                 begin
                    _sqlInsereSaldos.SQL.Add(':CODSUBCONTA,  ');
                 end;

                 if (not _cdsSaldos.FieldByName('CODCENTROCUSTO').isNull) and
                    (trim(_cdsSaldos.FieldByName('CODCENTROCUSTO').asString) <> '') then
                 begin
                    _sqlInsereSaldos.SQL.Add(':CODCENTROCUSTO, :IDEMPRESA, ');
                 end;

                 if not _cdsSaldos.FieldByName('UNIDNEGOC').isNull then
                 begin
                    _sqlInsereSaldos.SQL.Add(':UNIDNEGOC,       ');
                 end;

                 _sqlInsereSaldos.SQL.Add(':PSCTIPO,       ');
                 _sqlInsereSaldos.SQL.Add(':' + sFieldMov + ',:' + sFieldDeb + ',:' + sFieldCre + ',:' + sFieldSal + ')');

                 _sqlInsereSaldos.Prepare;
                 _sqlInsereSaldos.ParamByName('IDSALDOCALCULADO').asInteger := GetSequence('SALDOCALCULADO');
                 _sqlInsereSaldos.ParamByName('IDPESSOA').asInteger     := _cdsSaldos.FieldByName('IDPESSOA').asInteger;
                 _sqlInsereSaldos.ParamByName('PSCTIPO').asString       := _cdsSaldos.FieldByName('PLSTIPO').asString;
                 _sqlInsereSaldos.ParamByName('PLACONTA').asString      := _cdsSaldos.FieldByName('PLACONTA').asString;
                 _sqlInsereSaldos.ParamByName('PLANO').asInteger        := _cdsSaldos.FieldByName('PLANO').asInteger;
                 _sqlInsereSaldos.ParamByName('PEREXERCICIO').asInteger := iExercicio;

                 if (not _cdsSaldos.FieldByName('CODSUBCONTA').isNull) and
                    (_cdsSaldos.FieldByName('CODSUBCONTA').asInteger <> 0) then
                 begin
                    _sqlInsereSaldos.ParamByName('CODSUBCONTA').asInteger := _cdsSaldos.FieldByName('CODSUBCONTA').asInteger;
                 end;

                 if (not _cdsSaldos.FieldByName('CODCENTROCUSTO').isNull) and
                    (trim(_cdsSaldos.FieldByName('CODCENTROCUSTO').asString) <> '') then
                 begin
                    _sqlInsereSaldos.ParamByName('CODCENTROCUSTO').asString := trim(_cdsSaldos.FieldByName('CODCENTROCUSTO').asString);
                    _sqlInsereSaldos.ParamByName('IDEMPRESA').asInteger     := _cdsSaldos.FieldByName('IDEMPRESA').asInteger;
                 end;

                 if not _cdsSaldos.FieldByName('UNIDNEGOC').isNull then
                 begin
                    _sqlInsereSaldos.ParamByName('UNIDNEGOC').asInteger := _cdsSaldos.FieldByName('UNIDNEGOC').asInteger;
                 end;

                 _sqlInsereSaldos.ParamByName(sFieldMov).asFloat := _cdsSaldos.FieldByName('MOV').asFloat;
                 _sqlInsereSaldos.ParamByName(sFieldDeb).asFloat := _cdsSaldos.FieldByName('DEB').asFloat;
                 _sqlInsereSaldos.ParamByName(sFieldCre).asFloat := _cdsSaldos.FieldByName('CRE').asFloat;
                 _sqlInsereSaldos.ParamByName(sFieldSal).asFloat := _cdsSaldos.FieldByName('SALDO').asFloat;

                  if not ExecSQL(_sqlInsereSaldos.SQLChanged,False) Then
                  begin
                    sMens := 'Erro ao Inserir Dados na Tabela SALDOCALCULADO.';
                    Raise Exception.Create(sMens);
                  end;
               end;
               _cdsSaldos.Next;
               FProgresso := FProgresso + 1;
             End;

             If not Padroes.GravaLogOperacoes(dEmpresa,dModulo,dUsuario, 'Gera Saldo Calculado por Período',False) then
                Raise Exception.Create( Padroes.MessageInfo );

             Commit;
             MessageInfo := 'Saldos Calculados gerados com sucesso.';

         Except
           on E:Exception Do
           Begin
              RollBack;
              Result := False;
              MessageInfo := sMens+' '+E.Message;
           End
         End;
      End;
   End;
end;


procedure TCtrlProcessaContab.SetcdsVerificaBloqueados(
  const Value: TClientDataSet);
begin
     FcdsVerificaBloqueados := Value;
end;

function TCtrlProcessaContab.ListaBloqueados(dEmpresa: Double;
  iExecAtual: Integer): OleVariant;

var
   sSql :string;
begin


      sSql := 'SELECT  P.PLNCODIGO, P.PLNPLANIL, P.PLNDATDIA,       ' +
              '  M.NOMEMODULO, ''N'' AS FLGEXCLUI, P.PEREXERCICIO,  ' +
              '  P.PERNUMERO                                        ' +
              'FROM  PERIODO E, PLANILHA P, MODULO M                ' +
              'WHERE                                                ' +
              '  (P.PEREXERCICIO= ' + IntToStr(iExecAtual) + ') AND ' +
              '  (P.IDPESSOA= '+ FloatToStr(dEmpresa) + ') AND     ' +
              '  (P.PLNEFETIVADO=''N'') AND                         ' +
              '  ((E.PERBLOQUE=''S'') OR (E.PERBLOINT=''S'')) AND   ' +
              '  (P.PEREXERCICIO=E.PEREXERCICIO) AND                ' +
              '  (P.PERNUMERO=E.PERNUMERO) AND                      ' +
              '  (P.IDPESSOA=E.IDPESSOA) AND                        ' +
              '  (P.IDMODULO=M.IDMODULO)                            ';


     Result := GetDataPacket(sSql);
end;

function TCtrlProcessaContab.ListaSaldoContas(dEmpresa: Double; iPlano,
  iExercicio, iPeriodo, iPPatro, iPPrev: Integer; sData, sContaIni,
  sContaFim: String): OleVariant;
begin

   With TCmSqlParams.Create(nil) Do
      Try
          ControlObject := Self;
          SQL.Clear;

          if trim(sData) = '' then
          begin
             SQL.Add('SELECT                                                           ');
             SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLANOME,                             ');
             SQL.Add('   SUM(S.PLSDEBITOCORRENTE) AS DEB,                              ');
             SQL.Add('   SUM(S.PLSCREDITOCOR) AS CRED,                                 ');
             SQL.Add('   (SUM(S.PLSDEBITOCORRENTE) - SUM(S.PLSCREDITOCOR)) AS MOV,     ');
             SQL.Add('   SA.SALDOANT, SS.SALDO,(0) as SALDOANTABS, '' '' as DEBCREANT, ');
             SQL.Add('   '' '' as DEBCRESALDO, (0) as SALDOABS                         ');
             SQL.Add('FROM                                                             ');
             SQL.Add('   PLANOSALDO S, PLANOCONTA C,                                   ');
             SQL.Add('   (SELECT                                                       ');
             SQL.Add('       PLACONTA, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
             SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOANT');
             SQL.Add('    FROM PLANOSALDO                                              ');
             SQL.Add('    WHERE (PLANO =:PLANO) AND                                    ');
             SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                         ');
             SQL.Add('          ((PERNUMERO <:PERIODO) OR (PERNUMERO IS NULL)) AND     ');
             SQL.Add('          (IDPESSOA =:IDPESSOA) AND                              ');
             if iPPrev <> 0 then
             begin
                SQL.Add('      (IDPLANOPREV =' + IntToStr(iPPrev) + ') AND             ');
             end;
             if iPPatro <> 0 then
             begin
                SQL.Add('       (IDPATRO =' + IntToStr(iPPatro) + ') AND               ');
             end;
             SQL.Add('          (PLACONTA >= :CONTAINI) AND                            ');
             SQL.Add('          (PLACONTA <= :CONTAFIM)                                ');
             SQL.Add('    GROUP BY PLACONTA ) SA,                                      ');
             SQL.Add('                                                                 ');
             SQL.Add('   (SELECT                                                       ');
             SQL.Add('       PLACONTA, SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE) ');
             SQL.Add('                   - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDO');
             SQL.Add('    FROM PLANOSALDO                                              ');
             SQL.Add('    WHERE (PLANO =:PLANO) AND                                    ');
             SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                         ');
             SQL.Add('          ((PERNUMERO <=:PERIODO) OR (PERNUMERO IS NULL)) AND    ');
             SQL.Add('          (IDPESSOA =:IDPESSOA) AND                              ');
             if iPPrev <> 0 then
             begin
                SQL.Add('      (IDPLANOPREV =' + IntToStr(iPPrev) + ') AND ');
             end;
             if iPPatro <> 0 then
             begin
                SQL.Add('       (IDPATRO =' + IntToStr(iPPatro) + ') AND        ');
             end;
             SQL.Add('          (PLACONTA >= :CONTAINI) AND                            ');
             SQL.Add('          (PLACONTA <= :CONTAFIM)                                ');
             SQL.Add('    GROUP BY PLACONTA ) SS                                       ');
             SQL.Add('                                                                 ');
             SQL.Add('WHERE                                                            ');
             SQL.Add('    ((S.PLANO(+) = C.PLANO) AND                                  ');
             SQL.Add('    (S.PLACONTA(+) = C.PLACONTA)) AND                            ');
             SQL.Add('    (SA.PLACONTA(+) = C.PLACONTA) AND                            ');
             SQL.Add('    (SS.PLACONTA(+) = C.PLACONTA) AND                            ');
             if iPPrev <> 0 then
             begin
                SQL.Add('      (S.IDPLANOPREV(+) =' + IntToStr(iPPrev) + ') AND ');
             end;
             if iPPatro <> 0 then
             begin
                SQL.Add('       (S.IDPATRO(+) =' + IntToStr(iPPatro) + ') AND        ');
             end;
             SQL.Add('    (C.PLANO =:PLANO) AND                                        ');
             SQL.Add('    (S.PEREXERCICIO(+) =:EXERCICIO) AND                          ');
             SQL.Add('    (S.PERNUMERO(+) =:PERIODO) AND                               ');
             SQL.Add('    (S.IDPESSOA(+) =:IDPESSOA) AND                               ');
             SQL.Add('    (C.PLACONTA >= :CONTAINI) AND                                ');
             SQL.Add('    (C.PLACONTA <= :CONTAFIM)                                    ');
             SQL.Add('GROUP BY                                                         ');
             SQL.Add('    C.PLACONTA, SA.SALDOANT, SS.SALDO,                           ');
             SQL.Add('    C.PLAGRAU, C.PLANOME                                         ');
             SQL.Add('ORDER BY                                                         ');
             SQL.Add(' C.PLACONTA                                                      ');
          End else
          Begin
             SQL.Add('SELECT                                                              ');
             SQL.Add('   C.PLACONTA, C.PLAGRAU, C.PLANOME,                                ');
             SQL.Add('   MOV.DEB,                                                         ');
             SQL.Add('   MOV.CRED,                                                        ');
             SQL.Add('   MOV.MOV,                                                         ');
             SQL.Add('   (0) as SALDOANTABS, '' '' as DEBCREANT,                          ');
             SQL.Add('   '' '' as DEBCRESALDO, (0) as SALDOABS,                           ');
             SQL.Add('   DECODE(SA.SALDOANT,NULL,0,SA.SALDOANT)+                          ');
             SQL.Add('   DECODE(SAL.SALDOANT,NULL,0,SAL.SALDOANT) AS SALDOANT,            ');
             SQL.Add('   DECODE(SA.SALDOANT,NULL,0,SA.SALDOANT)+                          ');
             SQL.Add('   DECODE(SAL.SALDOANT,NULL,0,SAL.SALDOANT)+                        ');
             SQL.Add('   DECODE(MOV.MOV,NULL,0,MOV.MOV) AS SALDO                          ');
             SQL.Add('FROM                                                                ');
             SQL.Add('   PLANOCONTA C,                                                    ');
             SQL.Add('   (SELECT                                                          ');
             SQL.Add('       SUM(DECODE(PLSDEBITOCORRENTE, NULL, 0, PLSDEBITOCORRENTE)    ');
             SQL.Add('       - DECODE(PLSCREDITOCOR, NULL, 0, PLSCREDITOCOR)) AS SALDOANT ');
             SQL.Add('    FROM PLANOSALDO                                                   ');
             SQL.Add('    WHERE (PLANO =:PLANO) AND                                         ');
             SQL.Add('          (PEREXERCICIO =:EXERCICIO) AND                              ');
             if iPPrev <> 0 then
             begin
                SQL.Add('      (IDPLANOPREV =' + IntToStr(iPPrev) + ') AND ');
             end;
             if iPPatro <> 0 then
             begin
                SQL.Add('       (IDPATRO =' + IntToStr(iPPatro) + ') AND        ');
             end;
             SQL.Add('          ((PERNUMERO <:PERIODO) OR (PERNUMERO IS NULL)) AND          ');
             SQL.Add('          (IDPESSOA =:IDPESSOA) AND                                   ');
             SQL.Add('          (PLACONTA = :CONTAINI)                                      ');
             SQL.Add('     ) SA,                                                            ');
             SQL.Add('   (SELECT                                                            ');
             SQL.Add('       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,0)) AS DEB,            ');
             SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,0)) AS CRED,           ');
             SQL.Add('       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,L.LACVALOR*-1)) AS MOV ');
             SQL.Add('    FROM PLANILHA P, LANCAMENTO L                                     ');
             SQL.Add('    WHERE (L.PLANO =:PLANO) AND                                       ');
             SQL.Add('          (P.PEREXERCICIO =:EXERCICIO) AND                            ');
             SQL.Add('          (P.PERNUMERO =:PERIODO) AND                                 ');
             SQL.Add('          (P.IDPESSOA =:IDPESSOA) AND                                 ');
             if iPPrev <> 0 then
             begin
                SQL.Add('      (L.IDPLANOPREV =' + IntToStr(iPPrev) + ') AND ');
             end;
             if iPPatro <> 0 then
             begin
                SQL.Add('       (L.IDPATRO =' + IntToStr(iPPatro) + ') AND        ');
             end;
             SQL.Add('          (P.PLNDATDIA = TO_DATE(:DATAREF,''DD/MM/YYYY'')) AND        ');
             SQL.Add('          (P.PLNEFETIVADO = ''S'') AND                                ');
             SQL.Add('          (P.PLNCODIGO = L.PLNCODIGO) AND                             ');
             SQL.Add('          (L.PLACONTA LIKE :CONTAINIL)                                ');
             SQL.Add('                        ) MOV,                                        ');
             SQL.Add('   (SELECT                                                            ');
             SQL.Add('       SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,L.LACVALOR*-1)) AS SALDOANT ');
             SQL.Add('    FROM PLANILHA P, LANCAMENTO L                                ');
             SQL.Add('    WHERE (L.PLANO =:PLANO) AND                                  ');
             SQL.Add('          (P.PEREXERCICIO =:EXERCICIO) AND                       ');
             SQL.Add('          (P.PERNUMERO =:PERIODO) AND                            ');
             SQL.Add('          (P.IDPESSOA =:IDPESSOA) AND                            ');

             if iPPrev <> 0 then
             begin
                SQL.Add('      (L.IDPLANOPREV =' + IntToStr(iPPrev) + ') AND ');
             end;

             if iPPatro <> 0 then
             begin
                SQL.Add('       (L.IDPATRO =' + IntToStr(iPPatro) + ') AND            ');
             end;

             SQL.Add('          (P.PLNDATDIA < TO_DATE(:DATAREF,''DD/MM/YYYY'')) AND   ');
             SQL.Add('          (P.PLNEFETIVADO = ''S'') AND                           ');
             SQL.Add('          (P.PLNCODIGO = L.PLNCODIGO) AND                        ');
             SQL.Add('          (L.PLACONTA LIKE :CONTAINIL)                           ');
             SQL.Add('    ) SAL                                                        ');
             SQL.Add('WHERE                                                            ');
             SQL.Add('    (C.PLANO =:PLANO) AND                                        ');
             SQL.Add('    (C.PLACONTA = :CONTAINI)                                     ');
             SQL.Add('ORDER BY                                                         ');
             SQL.Add(' C.PLACONTA                                                      ');
          End;

          Prepare;
          ParamByName('PLANO').asInteger     := iPlano;
          ParamByName('IDPESSOA').asFloat    := dEmpresa;
          ParamByName('EXERCICIO').asInteger := iExercicio;
          ParamByName('PERIODO').asInteger   := iPeriodo;

          if trim(sData) <> '' then
          begin
             ParamByName('DATAREF').asString   := sData;
             ParamByName('CONTAINIL').asString := trim(sContaIni)+'%';
             ParamByName('CONTAINI').asString  := Copy(sContaIni + '                  ',1,18);
          end else
          begin
             if trim(sContaIni) <> '' then
             begin
                ParamByName('CONTAINI').asString := Copy(sContaIni + '                  ',1,18);
             end else
             begin
                ParamByName('CONTAINI').asString := Copy('0' + '                  ',1,18);
             end;
             if trim(sContaFim) <> '' then
             begin
                ParamByName('CONTAFIM').asString := Copy(sContaFim + '                  ',1,18);
             end else
             begin
                ParamByName('CONTAFIM').asString := '999999999999999999';
             end;
          end;

          Result := Data;
      Finally
        Free;
      End;

end;

function TCtrlProcessaContab.ListaHoteis(dEmpresa: Double): OleVariant;
var
  sSql :string;
begin
   sSql := 'SELECT H.IDHOTEL, P.IDPESSOA, P.NOME '+
           'FROM PESSOA P, '+
           '     HOTEL H '+
           'WHERE (P.IDPESSOA = H.IDHOTEL) '+
           '  AND (H.IDPESSOA = ' + FloatToStr(dEmpresa) + ')';

    Result := GetDataPacket(sSql);

end;


function TCtrlProcessaContab.AtuCodigoReduzido(dEmpresa,dModulo,dUsuario: Double;iPlano,rgRenumera:integer): Boolean;
var
  sMens :string;
  iProxCod,iCodRedAnt : LongInt;

  _sqlAux :TCMSqlParams;
  _sqlAux1 :TCMSqlParams;
  _sqlAux2 :TCMSqlParams;
  _cdsAux :TClientDataSet;

  _sqlCodReduzDupl :TCMSqlParams;
  _cdsCodReduzDupl :TClientDataSet;

  _sqlMax :TCMSqlParams;
  _cdsMax :TClientDataSet;

  _sqlCodReduzTodos :TCMSqlParams;
  _cdsCodReduzTodos :TClientDataSet;

  DescReNumera :string;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.AtuCodigoReduzido(dEmpresa,dModulo,dUsuario,iPlano,rgRenumera);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
         MessageInfo := 'Código Reduzido Renumerado com Sucesso.';

   End Else
   Begin
      sMens         := '';
      MessageInfo   := '*';
      FProgresso    := 0;
      FMaxProgresso := 0;

      _sqlAux := TCMSqlParams.Create(nil);
      _sqlAux.ControlObject := Self;
      _cdsAux :=TClientDataSet.Create(nil);

      _sqlAux1 := TCMSqlParams.Create(nil);
      _sqlAux1.ControlObject := Self;

      _sqlAux2 := TCMSqlParams.Create(nil);
      _sqlAux2.ControlObject := Self;

      _sqlMax := TCMSqlParams.Create(nil);
      _sqlMax.ControlObject := Self;
      _cdsMax :=TClientDataSet.Create(nil);

      //=======================================================================
      _sqlCodReduzTodos := TCMSqlParams.Create(nil);
      _sqlCodReduzTodos.ControlObject := Self;
      _cdsCodReduzTodos := TClientDataSet.Create(nil);

      _sqlCodReduzTodos.Sql.Clear;
      _sqlCodReduzTodos.Sql.Add('SELECT PP.PLACONTA, PP.PLAREDUZ, PP.PLAGRUPO ');
      _sqlCodReduzTodos.Sql.Add('FROM PLANOCONTA PP        ');
      _sqlCodReduzTodos.Sql.Add('WHERE (PP.PLANO = :PLANO) ');
      _sqlCodReduzTodos.Sql.Add('ORDER BY PP.PLACONTA      ');

      //=======================================================================
      _sqlMax.SQL.Clear;
      _sqlMax.SQL.Add('SELECT MAX(PLAREDUZ) AS NUMMAXIMO, PLAGRUPO ');
      _sqlMax.SQL.Add('FROM PLANOCONTA         ');
      _sqlMax.SQL.Add('WHERE                   ');
      _sqlMax.SQL.Add('   (PLANO = :PLANO)     ');
      _sqlMax.SQL.Add('GROUP BY PLAGRUPO       ');

      //=======================================================================
      _sqlCodReduzDupl := TCMSqlParams.create(nil);
      _sqlCodReduzDupl.ControlObject := Self;
      _cdsCodReduzDupl := TClientDataSet.Create(nil);

      _sqlCodReduzDupl.Sql.Clear;
      _sqlCodReduzDupl.Sql.Add('SELECT PP.PLACONTA, PP.PLAREDUZ, PP.PLAGRUPO ');
      _sqlCodReduzDupl.Sql.Add('FROM PLANOCONTA PP,                          ');
      _sqlCodReduzDupl.Sql.Add('     (SELECT PLAREDUZ, COUNT(*)              ');
      _sqlCodReduzDupl.Sql.Add('               FROM PLANOCONTA               ');
      _sqlCodReduzDupl.Sql.Add('               WHERE (PLANO = :PLANO)        ');
      _sqlCodReduzDupl.Sql.Add('               GROUP BY PLAREDUZ             ');
      _sqlCodReduzDupl.Sql.Add('               HAVING COUNT(*) > 1) PS       ');
      _sqlCodReduzDupl.Sql.Add('WHERE                                        ');
      _sqlCodReduzDupl.Sql.Add('   (PP.PLANO = :PLANO) AND                   ');
      _sqlCodReduzDupl.Sql.Add('   (PS.PLAREDUZ = PP.PLAREDUZ)               ');
      _sqlCodReduzDupl.Sql.Add('ORDER BY PP.PLAREDUZ                         ');
      //=======================================================================

      Try
         StartTransaction;

         If rgRenumera = 0 then
         Begin
            _sqlMax.Prepare;
            _sqlMax.ParamByName('PLANO').AsInteger := iPlano;
            _cdsMax.Data := _sqlMax.Data;

            _cdsMax.First;
            While not _cdsMax.EOF do
            Begin
               _sqlAux.Sql.Clear;
               _sqlAux.Sql.Add('UPDATE PARAMCONTAB SET PACREDUZ'+ _cdsMax.FieldByName('PLAGRUPO').AsString + ' = '+_cdsMax.FieldByName('NUMMAXIMO').AsString );
               _sqlAux.Sql.Add('WHERE (IDPESSOA = '+FloatToStr(dEmpresa) + ')');

              If not ExecSQL(_sqlAux.SQLChanged,False) Then
              Begin
                 sMens := 'Erro ao Alterar Dados na Tabela PARAMCONTAB.';
                 Raise Exception.Create(sMens);
              End;

              _cdsMax.Next;
            End;

            _sqlCodReduzDupl.Prepare;
            _sqlCodReduzDupl.ParamByName('PLANO').AsInteger := iPlano;
            _cdsCodReduzDupl.Data := _sqlCodReduzDupl.Data;

            FMaxProgresso  := _cdsCodReduzDupl.RecordCount;
            FProgresso := 0;

            iCodRedAnt := -10;
            _cdsCodReduzDupl.First;
            While not _cdsCodReduzDupl.EOF do
            Begin
               FProgresso := FProgresso + 1;
               If iCodRedAnt = _cdsCodReduzDupl.FieldByName('PLAREDUZ').AsInteger then
               Begin
                  _sqlAux.Sql.Clear;
                  _sqlAux.Sql.Add('SELECT PACREDUZ'+_cdsCodReduzDupl.FieldByName('PLAGRUPO').AsString+' FROM PARAMCONTAB ');
                  _sqlAux.Sql.Add('WHERE (IDPESSOA = '+FloatToStr(dEmpresa)+')');
                  _cdsAux.Data := _sqlAux.Data;

                  If Not _cdsAux.IsEmpty Then
                  Begin

                     iProxCod := _cdsAux.FieldByName('PACREDUZ'+_cdsCodReduzDupl.FieldByName('PLAGRUPO').AsString).AsInteger + 1;

                     _sqlAux1.Sql.Clear;
                     _sqlAux1.Sql.Add('UPDATE PARAMCONTAB SET PACREDUZ'+_cdsCodReduzDupl.FieldByName('PLAGRUPO').AsString+' = '+IntToStr(iProxCod) );
                     _sqlAux1.Sql.Add('WHERE (IDPESSOA = '+FloatToStr(dEmpresa)+')' );

                     If not ExecSQL(_sqlAux1.SQLChanged,False) Then
                     Begin
                        sMens := 'Erro ao Alterar Dados na Tabela PARAMCONTAB.';
                        Raise Exception.Create(sMens);
                     End;

                     _sqlAux2.Sql.Clear;
                     _sqlAux2.Sql.Add('UPDATE PLANOCONTA SET PLAREDUZ = '+IntToStr(iProxCod) );
                     _sqlAux2.Sql.Add(' WHERE (PLANO = '+IntToStr(iPlano)+')' );
                     _sqlAux2.Sql.Add('   AND (RTRIM(PLACONTA) = '''+_cdsCodReduzDupl.FieldByName('PLACONTA').AsString + ''')');

                     If not ExecSQL(_sqlAux2.SQLChanged,False) Then
                     Begin
                        sMens := 'Erro ao Alterar Dados na Tabela PLANOCONTA.';
                        Raise Exception.Create(sMens);
                     End;

                  End;
               End;
               iCodRedAnt := _cdsCodReduzDupl.FieldByName('PLAREDUZ').AsInteger;
               _cdsCodReduzDupl.Next;
            End;
         End Else
         Begin
            _sqlAux.Sql.Clear;
            _sqlAux.Sql.Add('UPDATE PARAMCONTAB SET       ');
            _sqlAux.Sql.Add('      PACREDUZA = PACREDUAI, ');
            _sqlAux.Sql.Add('      PACREDUZP = PACREDUPI, ');
            _sqlAux.Sql.Add('      PACREDUZR = PACREDURI, ');
            _sqlAux.Sql.Add('      PACREDUZD = PACREDUDI, ');
            _sqlAux.Sql.Add('      PACREDUZC = PACREDUCI, ');
            _sqlAux.Sql.Add('      PACREDUZO = PACREDUOI, ');
            _sqlAux.Sql.Add('      PACREDUZE = PACREDUEI  ');
            _sqlAux.Sql.Add('WHERE (IDPESSOA = '+FloatToStr(dEmpresa)+')');

            If not ExecSQL(_sqlAux.SQLChanged,False) Then
            Begin
               sMens := 'Erro ao Alterar Dados na Tabela PARAMCONTAB.';
               Raise Exception.Create(sMens);
            End;

            _sqlCodReduzTodos.Prepare;
            _sqlCodReduzTodos.ParamByName('PLANO').AsInteger := iPlano;
            _cdsCodReduzTodos.Data := _sqlCodReduzTodos.Data;

            FMaxProgresso := _cdsCodReduzTodos.RecordCount;
            FProgresso    := 0;

            _cdsCodReduzTodos.First;
            While not _cdsCodReduzTodos.EOF do
            Begin
              FProgresso := FProgresso + 1;

              _sqlAux.Sql.Clear;
              _sqlAux.Sql.Add('SELECT PACREDUZ'+_cdsCodReduzTodos.FieldByName('PLAGRUPO').AsString+' FROM PARAMCONTAB ');
              _sqlAux.Sql.Add('WHERE (IDPESSOA = '+FloatToStr(dEmpresa)+')');
              _cdsAux.Data := _sqlAux.Data;

              If Not _cdsAux.IsEmpty Then
              Begin

                 iProxCod := _cdsAux.FieldByName('PACREDUZ'+_cdsCodReduzTodos.FieldByName('PLAGRUPO').AsString).AsInteger + 1;

                 _sqlAux1.Sql.Clear;
                 _sqlAux1.Sql.Add('UPDATE PARAMCONTAB SET PACREDUZ'+_cdsCodReduzTodos.FieldByName('PLAGRUPO').AsString+' = '+IntToStr(iProxCod) );
                 _sqlAux1.Sql.Add('WHERE (IDPESSOA = '+FloatToStr(dEmpresa)+')' );

                 If not ExecSQL(_sqlAux1.SQLChanged,False) Then
                 Begin
                    sMens := 'Erro ao Alterar Dados na Tabela PARAMCONTAB.';
                    Raise Exception.Create(sMens);
                 End;

                 _sqlAux2.Sql.Clear;
                 _sqlAux2.Sql.Add('UPDATE PLANOCONTA SET PLAREDUZ = '+IntToStr(iProxCod) );
                 _sqlAux2.Sql.Add(' WHERE (PLANO = '+IntToStr(iPlano)+')' );
                 _sqlAux2.Sql.Add('   AND (RTRIM(PLACONTA) = '''+_cdsCodReduzTodos.FieldByName('PLACONTA').AsString + ''')');

                 If not ExecSQL(_sqlAux2.SQLChanged,False) Then
                 Begin
                    sMens := 'Erro ao Alterar Dados na Tabela PLANOCONTA.';
                    Raise Exception.Create(sMens);
                 End;

              End;

              _cdsCodReduzTodos.Next;
            End;
         End;

         if rgReNumera = 0 then
            DescReNumera := 'Somente os Duplicados'
         else
            DescReNumera := 'Todos os Códigos';

         if not Padroes.GravaLogOperacoes(dEmpresa,dModulo,dUsuario, Copy('Atualização Códigos Reduzidos - ' + DescReNumera,1,60) ,False) then
            Raise Exception.Create( Padroes.MessageInfo );

         Commit;
         Result := True;
         MessageInfo := 'Código Reduzido Renumerado com Sucesso.';
         _sqlAux.free;
         _sqlAux1.free;
         _sqlAux2.free;
         _cdsAux.free;

         _sqlCodReduzDupl.free;
         _cdsCodReduzDupl.free;

         _sqlMax.free;
         _cdsMax.free;

         _sqlCodReduzTodos.free;
         _cdsCodReduzTodos.free;

      Except
        on E:Exception Do
        Begin
           _sqlAux.free;
           _sqlAux1.free;
           _sqlAux2.free;
           _cdsAux.free;

           _sqlCodReduzDupl.free;
           _cdsCodReduzDupl.free;

           _sqlMax.free;
           _cdsMax.free;

           _sqlCodReduzTodos.free;
           _cdsCodReduzTodos.free;

           RollBack;
           Result := False;
           MessageInfo := sMens+' '+E.Message;
        End
      End;
  End;

end;

function TCtrlProcessaContab.AcertaNumPlanilha(dEmpresa,dModulo,dUsuario: Double; iPlano,iExercicio,
                      iPeriodo:integer;sPacDiaMes:string): Boolean;
var
  sMens,sDataAnt :string;
  iNumPlanil :Integer;
  _sqlAux       :TCMSqlParams;
  _sqlPlanilhas :TCMSqlParams;
  _cdsPlanilhas :TClientDataSet;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.AcertaNumPlanilha(dEmpresa,dModulo,dUsuario,iPlano,
                                 iExercicio,iPeriodo,sPacDiaMes);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
         MessageInfo := 'Atualização efetuada com sucesso.';

   End Else
   Begin
      sMens         := '';
      MessageInfo   := '*';
      FProgresso    := 0;
      FMaxProgresso := 0;

      sDataAnt      := '';

      //========================================================================
      _sqlAux := TCMSqlParams.Create(nil);
      _sqlAux.ControlObject := Self;

      _sqlPlanilhas := TCMSqlParams.Create(nil);
      _sqlPlanilhas.ControlObject := Self;
      _cdsPlanilhas := TClientDataSet.Create(nil);

      _sqlPlanilhas.Sql.Clear;
      _sqlPlanilhas.Sql.Add('SELECT PLNDATDIA, PLNPLANIL, PLNCODIGO   ');
      _sqlPlanilhas.Sql.Add('FROM PLANILHA                            ');
      _sqlPlanilhas.Sql.Add('WHERE (IDPESSOA        = :IDPESSOA)      ');
      _sqlPlanilhas.Sql.Add('     AND (PEREXERCICIO = :PEREXERCICIO)  ');
      _sqlPlanilhas.Sql.Add('     AND (PERNUMERO    = :PERNUMERO)     ');
      _sqlPlanilhas.Sql.Add('ORDER BY PLNDATDIA, PLNCODIGO            ');

      _sqlPlanilhas.Prepare;
      _sqlPlanilhas.ParamByName('IDPESSOA').asFloat       := dEmpresa;
      _sqlPlanilhas.ParamByName('PEREXERCICIO').asInteger := iExercicio;
      _sqlPlanilhas.ParamByName('PERNUMERO').asInteger    := iPeriodo;
      _cdsPlanilhas.Data := _sqlPlanilhas.Data;

      If _cdsPlanilhas.isEmpty Then
      Begin
         Raise Exception.Create('Atualização não efetuada: Não há Dados para Realizar o Processamento.');
      End;

      FMaxProgresso := _cdsPlanilhas.RecordCount;

      Try
         StartTransaction;


         _cdsPlanilhas.First;
         iNumPlanil := 0;
         sDataAnt   := _cdsPlanilhas.FieldByName('PLNDATDIA').AsString;

         While not _cdsPlanilhas.EOF do
         Begin
            iNumPlanil := iNumPlanil + 1;

            FProgresso := FProgresso + 1;

            _sqlAux.Sql.Clear;
            _sqlAux.Sql.Add('UPDATE PLANILHA ');
            _sqlAux.Sql.Add('SET PLNPLANIL = :PLNPLANIL ');
            _sqlAux.Sql.Add('WHERE (PLNCODIGO = :PLNCODIGO) ');

            _sqlAux.Prepare;
            _sqlAux.ParamByName('PLNCODIGO').AsFloat   := _cdsPlanilhas.FieldByName('PLNCODIGO').AsFloat;
            _sqlAux.ParamByName('PLNPLANIL').AsInteger := iNumPlanil;

            If not ExecSQL(_sqlAux.SQLChanged,False) Then
            Begin
               sMens := 'Erro ao Alterar Dados na Tabela PLANILHA.';
               Raise Exception.Create(sMens);
            End;

            _cdsPlanilhas.Next;

            If (sPacDiaMes = 'D') and
               (sDataAnt <> _cdsPlanilhas.FieldByName('PLNDATDIA').AsString) then
            Begin
               iNumPlanil := 0;
               sDataAnt   := _cdsPlanilhas.FieldByName('PLNDATDIA').AsString;
            End;
         End;

         _sqlAux.free;
         _sqlPlanilhas.free;
         _cdsPlanilhas.free;

         If not Padroes.GravaLogOperacoes(dEmpresa,dModulo,dUsuario, 'Acerta Numeração das Planilhas',False) then
            Raise Exception.Create( Padroes.MessageInfo );

         Commit;
         Result := True;
         MessageInfo := 'Planilhas Renumeradas com Sucesso.';

      Except
        on E:Exception Do
        Begin
           _sqlAux.free;
           _sqlPlanilhas.free;
           _cdsPlanilhas.free;

           RollBack;
           Result := False;
           MessageInfo := sMens+' '+E.Message;
        End
      End;

  End;

end;

function TCtrlProcessaContab.FazEstorno(dUsuario, dCodPlanilha, dModulo,
  dEmpresa: Double; bUsaPPatro: Boolean; sDataEstorno: string): Boolean;
var
  sMens,sSql :string;
  NumPlanil  :Double;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.FazEstorno(dUsuario,dCodPlanilha,dModulo,
                                        dEmpresa,bUsaPPatro,sDataEstorno);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
         MessageInfo := 'Planilha Estornada com Sucesso.';

   End Else
   Begin
      sMens := '';
      sSql  := '';

      Try
         StartTransaction;

         if Not Lancamento.EstornaLancaContab(dUsuario,dCodPlanilha,dModulo,
                                               dEmpresa,bUsaPPatro,sDataEstorno) then
         begin
           sMens := Lancamento.MessageInfo;
           Raise Exception.Create(sMens);
         end;

         sSql := 'SELECT PLNPLANIL FROM PLANILHA WHERE PLNCODIGO = '+ FloatToStr(Lancamento.RetornoPlnCodigo);
         _cds.Data := GetDataPacket(sSql);
         NumPlanil := _cds.FieldByName('PLNPLANIL').asFloat;

         Commit;
         Result := True;


         MessageInfo := 'Planilha Número: '+ FloatToStr(NumPlanil) + ' Estornada com Sucesso.';
      Except
        on E:Exception Do
        Begin
           RollBack;
           Result := False;
           MessageInfo := sMens+' '+E.Message;
        End
      End;

  End;

end;


procedure TCtrlProcessaContab.SetcdsDiariasDBF(
  const Value: TClientDataSet);
begin
    FcdsDiariasDBF := Value;
end;

procedure TCtrlProcessaContab.SetcdsLancamentosDBF(
  const Value: TClientDataSet);
begin
     FcdsLancamentosDBF := Value;

end;

function TCtrlProcessaContab.AtualizaParamContab(dEmpresa, dPlnCodigo: Double): Boolean;
var
  sSql,sMens :string;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.AtualizaParamContab(dEmpresa,dPlnCodigo);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin
      Try
            StartTransaction;

            sSql := 'UPDATE PARAMCONTAB SET ';

            if dPlnCodigo <> 0 then
               sSql := sSql + 'PACPLNCODIGO = ' + FloatToStr(dPlnCodigo)
            else
               sSql := sSql + 'PACPLNCODIGO = ' + 'null';

            sSql := sSql + ' WHERE IDPESSOA = '+FloatToStr(dEmpresa);

            Result := ExecSql(sSql);
            If Not Result Then
            Begin
              sMens := 'Erro ao Atualizar a Tabela de Parametros.';
              Raise Exception.Create(sMens);
            End;

           Commit;
           Result := True;
      Except
         on E:Exception Do
         Begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         End;
      End;
  End;
end;

function TCtrlProcessaContab.ImportaValoresOrcadoExcel(ArquivoTexto:TStringList;dEmpresa, dUsuario, dPlanoPrev, dPlanoPatro,
                           dPlano: Double; iExercicio: Integer; bUsaPPatro: Boolean): Boolean;
var
  sMens :string;

  sConta,sCCusto,sDebCre,sTipoConta,sTralhaNove :string;

  iSubConta,iUnidNegoc,Y,Z,W,X :Integer;

  iMes,iLinha :integer;

  dValorOrc :double;

  aLinha : array [1..17] of string;

  aValores :array [1..12] of string;

begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ImportaValoresOrcadoExcel(StringlistToVariant(ArquivoTexto),dEmpresa, dUsuario, dPlanoPrev, dPlanoPatro,
                                     dPlano,iExercicio,bUsaPPatro, FsMensAdd);

      If Not Result Then
      Begin
         MessageInfo := 'Houve erros na importação. ' + CHR(13) +
                        'Linha da Planilha: ' +  Connection.AppServer.MessageInfo + CHR(13) + CHR(13) +
                        'O estado anterior do Banco de Dados foi retornado. ';
      End;
   End Else
   Begin
       //Inicializa as variáveis
       sMens        := '';
       FsMensAdd    := '';
       FProgresso   := 0;
       MessageInfo  := '*';

       Try

            StartTransaction;

            //Varre a planilha para gravar os valores
            FContaLinhaTexto := 0;
            FProgresso       := 04;
            MessageInfo      := 'Importando...' + chr(13);

            iLinha           := 0;
            FMaxProgresso    := ArquivoTexto.Count;
            While (ArquivoTexto.Count <> iLinha) do
            Begin

              Y := 0;
              X := 1;
              Z := 1;
              W := 0;

              Repeat

                  sTralhaNove := Copy(ArquivoTexto[iLinha],X,1);
                  If sTralhaNove = #9 Then
                  Begin
                     Y := Y + 1;

                     aLinha[Y] := Copy(ArquivoTexto[iLinha], Z, X - 1 - W);

                     Z := Z + X - W;
                     W := X;
                  End;
                  X := X + 1;

               Until Length(ArquivoTexto[iLinha]) <= X;

               y := y + 1;

               aLinha[Y] := Copy(ArquivoTexto[iLinha], Z, X - W);

               MessageInfo  := '*';

               FProgresso := FProgresso + 1;

               sConta     := Trim(aLinha[1]);
               sCCusto    := Trim(aLinha[2]);


               If Trim(aLinha[3]) <> '' then
                  iUnidNegoc := StrToInt(Trim(aLinha[3]))
               Else
                  iUnidNegoc := 0;

               if Trim(aLinha[4]) = '' then
                  iSubConta := 0
               else
                  iSubConta := StrToInt(Trim(aLinha[4]));

               sDebCre := Trim(aLinha[5]);

               MessageInfo := 'Processando Conta:' + sConta  +  '  D/C:' + sDebCre + chr(13)+
                              'Centro de Custo  :' + sCCusto + chr(13) +
                              'Atividade Projeto:' + IntToStr(iUnidNegoc) + chr(13) +
                              'Codigo SubConta  :' + IntToStr(iSubConta) + chr(13) + chr(13);
               FsMensAdd := FsMensAdd +  MessageInfo;
               //---------------------------------------------------------------
               // Pega o tipo da conta
               //---------------------------------------------------------------
               _cds.data := GetDataPacket('SELECT PLATIPO FROM PLANOCONTA ' +
                                          ' WHERE (PLANO = ' + FloatToStr(dPlano) + ')' +
                                          ' AND   (PLACONTA = '''+Copy(trim(sConta)+'                 ',1,18)+''')');

               If not _cds.IsEmpty then
                  sTipoConta := _cds.FieldByName('PLATIPO').asString
               Else
                  sTipoConta := '';

               //---------------------------------------------------------------
               // Inicializa vetor e Guarda no vetor os Valores dos períodos
               //---------------------------------------------------------------
               For iMes := 1 to 12 do
               Begin
                 If Trim(aLinha[iMes + 5]) <> '' Then
                    aValores[iMes] := Trim(aLinha[iMes + 5])
                 Else
                    aValores[iMes] := '0';
               End;
               //---------------------------------------------------------------

               //--------------------------------------------------------------
               // Verifica se Existe Centro de Custo
               //--------------------------------------------------------------

               If (sConta <> '') Then
               Begin

                   //-----------------------------------------------------------
                   // Movimenta Saldo para os 12 periodos
                   //-----------------------------------------------------------
                   For iMes := 1 to 12 do
                   Begin

                     dValorOrc   := StrToFloat(aValores[iMes]);

                     If Not Lancamento.AtuSaldoContas(dEmpresa,    // Empresa
                                                      iUnidNegoc,  // iUnidNegoc
                                                      dUsuario,    // Usuario
                                                      dPlanoPrev,  // Plano Previdenciario
                                                      dPlanoPatro, // Patrocinadora
                                                      dPlano,      // Plano
                                                      iExercicio,  // Exercicio
                                                      iMes,           // Periodo
                                                      iSubConta,   // SubConta
                                                      sCCusto,     // Centro de Custo
                                                      sConta,      // Conta
                                                      sDebCre,     // Debito ou credito
                                                      sTipoConta,  // plstipo
                                                      0,           // Valor corrente
                                                      dValorOrc,   // Valor Orçado
                                                      0,           // Valor Oficial
                                                      0,           // Valor Geren
                                                      0,           // Valor Geren1
                                                      0,           // Valor Geren2,
                                                      0,           // Valor Hist,
                                                      bUsaPPatro) then
                     Begin
                       sMens := Lancamento.MessageInfo;
                       Raise Exception.Create(sMens);
                     End;
                   End;
               End;
               iLinha := iLinha + 1;
            End;

            Commit;
            Result := True;
            MessageInfo := '';
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

procedure TCtrlProcessaContab.SetcdsPlanilhaORC(
  const Value: TClientDataSet);
begin
  FcdsPlanilhaORC := Value;
end;

procedure TCtrlProcessaContab.Set_cdsMts(const Value: TClientDataSet);
begin
  _cdsMts := Value;

end;

function TCtrlProcessaContab.ListaLanc(dCodPla: Double): OleVariant;
begin
   With _Sql Do
      Try
          SQL.Clear;
          SQL.Add('SELECT ''N'' AS MARCA, U.PLNCODIGO, U.LACNUMLAN, U.UNIDNEGOC, U.IDPLANOPREV,    ');
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
          SQL.Add('(SELECT L.PLNCODIGO, L.LACNUMLAN, L.UNIDNEGOC, L.IDPLANOPREV,          ');
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
          SQL.Add(' FROM LANCAMENTO L, PLANOCONTA C, UNIDNEGOCIO UN, SUBCONTA SC, CENTCUST CC,PESSOA PE, PLANPREVCONTABIL PP  ');
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
          SQL.Add('UNION                                            ');
          SQL.Add(' SELECT L.PLNCODIGO, L.LACNUMLAN, L.UNIDNEGOC, L.IDPLANOPREV,          ');
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
          SQL.Add(' FROM LANCAMENTO L, PLANOCONTA C, UNIDNEGOCIO UN, SUBCONTA SC, CENTCUST CC,PESSOA PE, PLANPREVCONTABIL PP  ');
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
          SQL.Add('   AND (L.IDPLANOPREV    = PP.IDPLANOPREV(+)) ) U         ');
          SQL.Add('GROUP BY U.PLNCODIGO, U.LACNUMLAN, U.UNIDNEGOC, U.IDPLANOPREV,    ');
          SQL.Add('         U.IDPATRO, U.IDELEMDEMONSTRAT, U.HITCODHIST, U.IDPESSOA, ');
          SQL.Add('         U.IDMODULO, U.IDUSUARIOINCLUSAO, U.LACVALOR,             ');
          SQL.Add('         U.PLANO, U.LACTIPO, U.LACNUMDOC, U.LACHIST1,             ');
          SQL.Add('         U.LACHIST2, U.LACHIST3, U.LACHIST4, U.LACHIST5,          ');
          SQL.Add('         U.TIPCODIGO,U.NOMEATIVPROJ, U.UNECODIGO,                 ');
          SQL.Add('         U.NOMEPATRO,U.NOMEPLANOPREV                              ');
          SQL.Add('ORDER BY U.PLNCODIGO, U.LACNUMLAN                                 ');

          Prepare;

          ParamByName('PLNCODIGO').asFloat := dCodPla;

          Result := Data;

      Finally
         //
      End;

end;

end.


