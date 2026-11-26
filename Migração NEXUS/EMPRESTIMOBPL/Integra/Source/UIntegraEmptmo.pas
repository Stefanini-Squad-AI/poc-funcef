//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//Alterações  : InsertTmpDesc
//Pendência WO: 12789
//Responsável : Leandro
//Data        : 29/07/2024
//Descrição   : Grava valor absoluto ao inserir na TMPDESC
//------------------------------------------------------------------------------
//Alterações  : InsertTmpDesc e RetornaFlgDescontoProvDesc
//Pendência   : 101022
//Responsável : edilaine / Itiro
//Data        : 03/05/2018
//Descrição   : Se existir valor negativo a ser lançado na TMPDESC, valor deve
//              ser abatido de um registro positivo.
//------------------------------------------------------------------------------

//Pendência   : 126804
//Responsável : Everson Cunha
//Data        : 08/08/2022
//Descrição   : Alteração no texto de observação da AP
//------------------------------------------------------------------------------
//Alterações  : DesfazEnvioPorDocumento
//Pendência   : 113052
//Responsável : Edilaine
//Data        : 12/02/2021
//Descrição   : Exclusão da tabela HISTENVIOEMPTMO ao desfazer envio - adicionado parâmetro.
//------------------------------------------------------------------------------
//Alterações  : DesfazEnvioPorDocumento
//Pendência   : 102325
//Responsável : Taffarel Sevaybriker
//Data        : 13/11/2020
//Descrição   : Exclusão da tabela HISTENVIOEMPTMO ao desfazer envio.
//------------------------------------------------------------------------------
//Alterações  : EnviaCAPCAR, EnviaLoteConcessao
//Pendência   : 62639
//Responsável : Edilaine
//Data        : 02/02/2018
//Descrição   : inserir no rateio o plano contábil do perfil de investimento do
//participante e não o plano contábil do empréstimo
//------------------------------------------------------------------------------
//Alterações  : ValidaParamPerfilInvestimento, ContabilizaItens
//Pendência   : SIG57627
//Responsável : Edilaine
//Data        : 21/11/2017
//Descrição   : Ajustar queries para adequação a segregação contábil (perfil de investimento)
//------------------------------------------------------------------------------
//Pendência   : SOL 261550 PPM 771995
//Responsável : William Moreira da Silva
//Data        : 15/09/2015
//Descrição   : Ajuste de queries de alteração da HME para desfazer envio
//------------------------------------------------------------------------------
//Pendência   : SOL 261000 PPM 1060102
//Responsável : William Moreira da Silva
//Data        : 08/09/2015
//Descrição   : Não era gravado o plano previdenciario na tmpDesc
//------------------------------------------------------------------------------
//Pendência   : SOL 253185 PPM 771995
//Responsável : Wylliam Leite da Silva / William Moreira da Silva
//Data        : 18/05/2015
//Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
//--------------------------------------------------------------------------------
//Pendência   : SOL 226433 KINTANA 2060252
//Responsável : William Moreira da Silva
//Data        : 17/02/2014
//Descrição   : Ao realizar o processo de envio, quando um contrato está em perda efetiva,
//              todos os itens enviados eram realizados como se todos os contratos fossem
//              perda efetiva
//--------------------------------------------------------------------------------
//Pendência   : SOL 211259 KINTANA 2039215
//Responsável : Marcio Sanches Spinosa SOL 211259 KINTANA 2039215
//Data        : 02/08/2013
//Descrição   : Ajuste na verificação da conta bancaria quando existir mais
// de uma.
//--------------------------------------------------------------------------------
//Pendência   : SOL 213592 Kintana 2040335
//Responsável : Sadi Freire
//Data        : 16/12/2013
//Descrição   : Alterações Voto Empréstimo
//------------------------------------------------------------------------------
//Pendência   : SOL 201764 KINTANA 1963946
//Responsável : Marcio Sanches Spinosa SOL 201764 KINTANA 1963946
//Data        : 19/03/2013
//Descrição   : Ajuste quando um contrato for reb/replan saldado, para não
//inserir na tmpdesc como novo plano.
//------------------------------------------------------------------------------
//Pendência   : SOL 200924 KINTANA 1958353
//Responsável : BRUNO AZEVEDO
//Data        : 12/03/2013
//Descrição   : Ajuste no campo obs ao salvar o numero de contrato.
//------------------------------------------------------------------------------
//Pendência   : SOL 195538 KINTANA 1917765
//Responsável : Otacilio Aquino
//Data        : 25/01/2013
//Descrição   : Implementado para adicionar o numero do contrato no campo obs
//------------------------------------------------------------------------------
//Pendência   : SOL 182258 KINTANA 1697187
//Responsável : TADEU PASSOS
//Data        : 12/11/2012
//Descrição   : Alteralçao da function EnviaTMPDESC() para também ser utilizada
//              pela funcionalidade da tela Pagamento de Empréstimo com Resgate
//------------------------------------------------------------------------------
//Pendência   : SOL 169010 KINTANA 1495798
//Responsável : MARCIO SANCHES SPINOSA
//Data        : 21/05/2012
//Descrição   : Atualiza a CtrlInterface dependendo do valor da folha resgate
//------------------------------------------------------------------------------
//Pendência   : SOL 176629 KINTANA 1614326
//Responsável : Vinicius Ferreira
//Data        : 23/03/2012
//Descrição   : Não inserir valores negativos na tempdesc.
//------------------------------------------------------------------------------
//Pendência   : SOL 174494 KINTANA 1576368
//Responsável : Fernando Xavier
//Data        : 22/02/2012
//Descrição   : Erro ao enviar itens negativos os valores negativos eram somados
//              como positivo foi retirado o ABS do campo HMEVLRPREVISTO
//------------------------------------------------------------------------------
//Pendência   : SOL 168123 Kintana 1480953
//Responsável : Fanuel Junior
//Data        : 09/11/2011
//Descrição   : Erro no campo "Tipo Rubrica"
//--------------------------------------------------------------------------------
//Pendência   : SOL 145571 KINTANA 975201
//Responsável : VINICIUS MACIEL
//Data        : 03/06/2011
//Descrição   : Ajuste No histórico de envio para que seja gravada a data de
//              vencimento.
//--------------------------------------------------------------------------------
//Pendência   : SOL 159447 KINTANA 1311975
//Responsável : Flávio Nogueira
//Data        : 16/06/2011
//Descrição   : Evitar erro  agrupar lançamentos
//--------------------------------------------------------------------------------
//Pendência   : SOL 149067 KINTANA 1059000
//Responsável : BRUNO AZEVEDO
//Data        : 14/04/2011
//Descrição   : Armazenar o histórico de envio.
//--------------------------------------------------------------------------------
//Pendência   : SOL 153430 KINTANA 1156998
//Responsável : BRUNO AZEVEDO
//Data        : 23/02/2011
//Descrição   : Ajusto no envio das rubricas para folha de patrocinadora.
//--------------------------------------------------------------------------------
//Pendência   : SOL 149320 KINTANA 1067557
//Responsável : Fernando Xavier
//Data        : 15/12/2010
//Descrição   : Erro na quitação automática
//------------------------------------------------------------------------------
//Pendência   : SOL 141496 KINTANA 897024
//Responsável : Fernando Xavier
//Data        : 11/11/2010
//Descrição   : Adicionar dois campos no resultado do envio: item e tipo de rubrica
//------------------------------------------------------------------------------
//Pendência   : SOL 137847 KINTANA 836194
//Responsável : Ádler Souza
//Data        : 13/09/2010
//Descrição   : Criar estrutura para gravar histórico de destino de envio por item.
//------------------------------------------------------------------------------
//Pendência   : SOL 141246 KINTANA 892219
//Responsável : BRUNO AZEVEDO
//Data        : 06/08/2010
//Descrição   : No campo ValorInfo, acrescentar + 1 quando a rubrica não for informativa.
//------------------------------------------------------------------------------
//Pendência   : SOL 123125 KINTANA 612563
//Responsável : BRUNO AZEVEDO
//Data        : 07/06/2010
//Descrição   : Envio de rubricas informativas para a folha de benefícios.
//------------------------------------------------------------------------------
//Pendência   : SOL 129014 KINTANA 698559
//Responsável : Ádler Souza
//Data        : 06/05/2010
//Descrição   : Parametrização para itens que terão valores transferidos para o PGA.
//------------------------------------------------------------------------------
//Pendência   : SOL 120615
//Responsável : Daniel Begnami
//Data        : 03/07/2009
//Descrição   : Não havia nenhum controle de COMMIT quando enviado para o Financeiro.
//              Correção: Esta sendo comitado de 500 em 500.
//------------------------------------------------------------------------------
//Pendência   : SOL 118376 KINTANA 561884
//Responsável : Jéssica Lana
//Data        : 29/05/2009
//Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
//------------------------------------------------------------------------------
//Pendência   : SOL 114575 KINTANA 535771
//Responsável : Jésica Lana
//Data        : 24/04/2009
//Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
//------------------------------------------------------------------------------
unit UIntegraEmptmo;

//    Sistema.TipoCliente

//    Código   Cliente
//    -------- -------
//    19971    REFER
//    19981    CBS
//    19991    FUNCEF
//    20011    BRTPREV
//    20041    VALIA


// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : EnviaCAPCAR
Data      : 16/10/2008
Autor     : Daniel Begnami
Pendência : 98926
Descrição : Ajuste na Barra de Progresso para o envio de parcelas.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Várias
Data      : 12/03/2007
Autor     : Marchetti
Pendência : 23083
Descrição : Ajuste no processo de agrupamento de parcela e outros eventos por rubrica e parcela.
            Para a FUNCEF, agrupa parcela e itens de refinanciamento na mesma rubrica parametrizada
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ConsolidaInsTmpDesc
Data      : 02/10/2006
Autor     : Marchetti
Pendência : 23428
Descrição : Colocado no order by os campos IDRUBRICA e CCDEB para fazer o agrupamento de forma correta
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : AcertaPlanoOrigem
Data      : 25/09/2006
Autor     : Alberto
Pendência : 23311 e 23312
Descrição : Criação e utilização da query qryPlanoPrevOrigemFUNCEF
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Nova: DesfazEnvioPorDocumentoProc
Data      : 27/04/2006
Autor     : André Pontes
Pendência : 20170 / 20500
Descrição : 
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : EnviaLoteConcessao 
Data      : 26/04/2006
Autor     : Marchetti
Pendência : 19602
Descrição : Faz a verificacao se o mutuário já possui mais de um contrato ativo
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Novas: VlrBaixadoTMPDESC(...), UltDataBaixaDoc(...), VlrBaixadoDoc(...),
Data      : 26/01/2006
Autor     : André Pontes
Pendência : 21331
Descrição :
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : InsertTMPDesc + BuscaDataInicio
Data      : 25/01/2006
Autor     : André Pontes
Pendência : 21214
Descrição : Busca e gravação da data de crédito do empréstimo original referente ao contrato que se
            está inserindo
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ExistemItensNaoContabilizados(...
Data      : 16/05/2005
Autor     : André Pontes
Pendência : 18961
Descrição : Função que verifica se existem itens não contabilizados anteriores ao período (mês ou
            data) passados
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : GravaPlanilha
Data      : 15/12/2004
Autor     : André Pontes
Pendência :
Descrição : Criado baca
            Está demorando 7 horas na FUNCEF para fazer a contabilização da atualização diária
            Foi criado esse bAtuDia para não gravar a planilha nos itens centralizadores para tentar
            contornar o problema. Isso é um bacão, que está sendo necessário em função de outro baca
            que é gravar o plncodigo no centralizador. O Marchetti não soube dizer exatamente por que
            foi feito isso, mas parece que era para corrigir o fato do centralizador não estar sendo
            marcado como estornado em algum desfazer. O correto seria passar a buscar o centralizador
            no momento do desfazer, não aqui, mas...
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : MontaParamFolha
Data      : 28/07/2004 a 29/07/2004
Autor     : André Pontes
Pendência :
Descrição : Função para prencher os parâmetros de envio para a TMPDESC, para permitir envio agrupado
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ConciliaDocumento
Data      : 13/07/2004
Autor     : Marchetti
Pendência : 16894
Descrição : Criaçào da rotina que fará o update no campo FLGNAOCONCILIADO da tabela documento
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ConsolidaInsTmpDesc
Data      : 16/07/2004 a 02/08/2004
Autor     : André Pontes
Pendência :
Descrição : Geração de apenas 1 registro na TMPDESC para cada prestação da HistMovEmptmo,
            ressalvada a igualdade dos registros
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : várias
Data      : 08/07/2004
Autor     : André Pontes
Pendência :
Descrição : Acerto da questão IDPLANOPREV/IDPLANOORIGEM
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : LancaDocumento
Data      : 21/06/2004
Autor     : Marchetti
Pendência : 17154
Descrição : Chamada da rotina para criação do RAD
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : EnviaTMPDESC e EnviaCAPCAR
Data      : 15/06/2004 a 21/06/2004
Autor     : André Pontes
Pendência : 16983
Descrição : Log de itens enviados
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Contabilização (várias funções)
Data      : 07/05/2004
Autor     : André Pontes
Pendencia : -
Descrição : A pedido da FUNCEF, lançamento contábil agrupado por item também
            Com isso, a tabela paradox e as queries de itens a contabilizar passaram a ter o campo
            ITEDESCRICAO, que será preenchido em caso de FLGEXCEPCIONAL = 1
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : AcertaPlanoOrigem
Data      : 05/03/2004
Autor     : André Pontes
Pendencia : -
Descrição : Procedure que faz update no campo IDPLANOORIGEM de um Contrato, baseado no campo
            IDPLANPREVCONTAB da tabela BENEFBFCARIO (isso só rola para assistidos)
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : EntidadeContabil
Data      : 05/03/2004
Autor     : André Pontes
Pendencia : -
Descrição : Para FUNCEF, a busca da entidade contábil foi alterada de forma a pegar o plano
            PREVIDENCIAL referente a um plano prev CONTÁBIL
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : EnviaLoteConcessao
Data      : 09/09/2003
Autor     : Marchetti
Pendencia :
Descrição : Utilização do IDFAVORECIDO na BANCOPORTFORMA
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : VerificaDocumento
Data      : 14/08/2003
Autor     : André Pontes
Pendencia : 14826
Descrição : Função passou a verificar se um documento de CaP faz parte de um lote. Se fizer, o
            mesmo não pode ser excluído
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ContabilizaItens
Data      : 01/08/2003
Autor     : Marchetti
Pendencia : 14655
Descrição : Gravação dos parâmetros de integração ha HISTMOVEMPTMO
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : DesfazContabilizacaoPorPlanilha
Data      : 24/07/2003
Autor     : André Pontes
Descrição : Função que exclui Planilha e limpa o PLNCODIGO nos registros apropriados
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : GravaTabelaTemp 
Data      : 21/07/2003
Autor     : Marchetti
Descrição : Gravação da referencia dos itens de encargo igual a referencia da percela correspondente
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : DesfazEnvioPorDocumento
Data      : 08/07/2003
Autor     : André Pontes
Descrição : Função alterada para desfazer a baixa dos itens que constam no documento, em caso de
            já haver sido feito o recebimento
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : DesfazEnvioPorDocumento
Data      : 12/06/2003
Autor     : André Pontes
Descrição : Função que desfaz o envio de todos os itens contidos em um determinado documento, de
            uma só vez
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : VerificaDocumento
Data      : 12/06/2003
Autor     : André Pontes
Descrição : O código do Documento é agora passado como Extended
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : EnviaLoteConcessao
Data      : 06/06/2003
Autor     : André Pontes
Descrição : Nova função para envio de um lote de concessões para o CaP, em um único documento
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : EnviaCAPCAR
Data      : 02/06/2003
Autor     : André Pontes
Descrição : Se o FlgUsaFloatConc estiver marcado, a data de vencimento do Documento é alterada de
            acordo com o campo FLOAT da tabela BancoPortForma
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ContabilizaItens
Data      : 21/01/2003
Autor     : André Pontes
Descrição : Novo tipo de contabilização: (A)BONO --> igual ao estorno, só não marca o flgestornado
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : InsereDocumento
Data      : 18/12/2002
Autor     : Marchetti
Descrição : Compara se a data do vencimento é menor que a data do lançamento. Em caso positivo, coloca
            a data do lançamento igual a data do vencimento
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : EnviaTMPDESC
Data      : 07/11/2002
Autor     : André Pontes
Descrição : Rotina totalmente nova. Cada linha da TMPDESC passa a corresponder a 1 item da
            HistMovEmptmo, com a gravação do IDHISTMOVEMPTMO no campo ORDEM
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : DesfazEnvio / dtmIntegraEmptmo.qryExcluiFinanceiro
Data      : 09/10/2002
Autor     : André Pontes
Descrição : Só tenta excluir (financeiro) se o código do documento existir
            ( if FieldByName('CODDOCUMENTO').AsInteger > 0 )
---------------------------------------------------------------------------------------------------}

interface

uses
   forms,          // TApplication
   wwquery,        // TwwQuery
   dbtables,       // TTable
   DB,             // TFieldType
   classes,        // TStringList
   dialogs,        // Message_
   sysutils,       // FileExists
   stdctrls,       // TLabel
   Controls,
   comctrls,       // TProgressBar
   dbclient,
   Provider,
   uCMTypes,
   uCmControlObject,
   uCmDbObject,
   ucmClientDataSet,
   uCtrlDocumento,
   uCtrlPadroes,
   //Pendência 24800 - 21/03/2007 - Alberto
   uCtrlLancamento,
   uCtrlPeriodo,
   uCtrlContab,
   //Fim Pendência 24800
   uTypesEmptmo,
   wwstorep; //Wylliam Leite da Silva - SOL 253185 PPM 771995

type
   TContaBaixa = Record
      sConta      : String;
      fValor      : Currency;
      iUnidNegoc  : Integer;
      iPatro      : Integer;
      iPlanoPrev  : Integer;
   end;

   THistDocumento = Record
      IDHistMov      : Extended;
      CodDocumento   : Integer;
   end;

   //edilaine SIG101022 : inicio
   TBaixaNegativo = class
      sContrato    : string;
      sItemDescr   : string;
      sMatricula   : string;
      iIdPlanoprev : integer;
      iIdPatro     : integer;
      iParcela     : integer;
      rVlrParcela  : extended;
      rVlrDesconto : extended;
      rNovoValor   : extended;
      dDataReceb   : TDate;
   end;
   //edilaine SIG101022 : fim

   TIntegraEmptmo = Class(TObject)

   private  // Private declarations

      // procedimento que abre a tabela de parâmetros de acordo com com os parâmetros passados
      procedure AbreParamIntegra(const iTipoContrato, iItem, iPlano, iPatro: Int64);

      procedure AbreParamIntegraNovo(const iTipoContrato, iItem, iPlano, iPatro: Int64); //Renato Visoni
//      procedure AbreParamIntegraNovo1(const iTipoContrato, iItem, iPlano, iPatro: Int64); //Renato Visoni


      // procedimento que busca a Entidade Contábil associada a um Plano
      function EntidadeContabil(const iPlano: Int64): int64;

      // função que consolida os lançamentos e gera a efetiva contabilização
      function ConsolidaContabiliza(const sHistorico: String): Int64;

      Function VerificaFlag(sCONTRATO : String): Boolean;

      procedure GravaPlanilha(const iPlanilha   : Int64;
                              const dDataLanc   : TDateTime;
                              const sTipoContab : String = 'N';
                              const bAtuDia     : Boolean = False
                             );

      procedure GravaPlanilhaGrupo(const iPlanilha   : Int64;
                                   const dDataLanc   : TDateTime;
                                   const sTipoContab : String = 'N';
                                   const bAtuDia     : Boolean = False
                                   );

      // Função que efetua cada par de lançamentos contábeis
      function LancamentoContabil(var   rParamContabeis : TParamIntegra;
                                        sDebCre         : String;
                                        sHistorico      : String;
                                  const bMostraMsg      : Boolean;
                                  var   iPlanilha       : Integer;
                                  var   sMensContab     : String
                                 ): Boolean;

      // -------------------------------------------------------------------------------------------

      function BuscaRamoForCli(const sSituacao, sRecPag: String): Int64;

      // -------------------------------------------------------------------------------------------

      function AtualizaHistoricoComDocumento(const rParam: TParamIntegra;
                                             var sErro: TStringList): Boolean;

      function AtualizaHistoricoComFlgEnvio(const IDHistMovEmptmo : Extended;
                                            const IDTMPDESC       : Extended;
                                            var   sErro           : TStringList
                                           ): Boolean;

      // -------------------------------------------------------------------------------------------

      procedure MontaParamFolha(var   rTmpDesc     : TDadosTmpDesc;
                                var   qry          : TwwQuery;
                                var   rSitPart     : TSitPart;
                                const iLote        : Integer;
                                const iPeriodo     : Integer;
                                const iExercicio   : Integer;
                                const sAnoMesCob   : String;
                                const sHistorico   : String;
                                bEnvio             : Boolean = False;
                                bInformativa       : Boolean = False //BRUNO AZEVEDO SOL 123125 KINTANA 612563
                               );

      procedure LimpaRegistroTmpDesc(var Registro: TDadosTmpDesc);

      function ConsolidaInsTmpDesc(const sNomePatro   : String;
                                   const sHistorico   : String;
                                   const sAnoMesCob   : String;
                                   const iLote        : Integer;
                                   const iExercicio   : Integer;
                                   const iPeriodo     : Integer;
                                   var   sErro        : TStringList;
                                   var   iTotalReg    : Integer;
                                   var   fTotalPatro  : Currency;
                                   const iAgrupa      : Integer;
                                   bEnvio             : Boolean = False; //Renato Visoni
                                   bInformativa       : Boolean = False; //BRUNO AZEVEDO SOL 123125 KINTANA 612563
                                   bAtualizaEnvio     : Boolean = True;
                                   bPgtoEmpResgate    : Boolean = False  // TADEU PASSOS SOL 182258 KINTANA 1697187
                                  ): Boolean;

      // -------------------------------------------------------------------------------------------

      function DefineEstruturaTabelaTEMP(var T: TTable): Boolean;

      function GravaTabelaTemp(var   T                : TTable;
                               const qry              : TwwQuery;
                               const rParamIntegra    : TParamIntegra;
                               const dDataLanc        : TDateTime;
                               const iExercicio       : Integer;
                               const iPeriodo         : Integer
                              ): Boolean;

      // -------------------------------------------------------------------------------------------

      //edilaine - SIG57627 - inicio
      // Função para verificar se falta parametrização de Perfil de Investimento para recuperar o
      // IDPLANPREVCONTAB (IDPLANOORIGEM) usado na contabilização dos Itens
      function ValidaParamPerfilInvestimento(const qryValida    : TwwQuery;
                                             var sErro: TStringList) : boolean;
      //edilaine - SIG57627 - fim

      function RetornaFlgDescontoProvDesc(pIdProvento: Integer) : Integer; //edilaine - SIG101022


   public   // Public declarations
      // -------------------------------------------------------------------------------------------
      // funções de manipulação de tabelas temporárias PARADOX para consolidação
      //   da contabilização de eventos
      // -------------------------------------------------------------------------------------------

      function DefineEstruturaTabelaPDX(var T: TTable): Boolean;
      function DefineEstruturaTabelaPDXRateio(var T: TTable): Boolean;

      procedure GravaItemPDX(const sOrigemContab   : String;
                             const sTipoContab     : String;
                             var   T               : TTable;
      							  var   rParamIntegra   : TParamIntegra;
                             const dDataLanc       : TDateTime;
                             const iExercicio      : Integer;
                             const iPeriodo        : Integer
                            );

      procedure GravaItemPDXRateio(const fCodDocumento   : Extended;
                                   var   rParamIntegra   : TParamIntegra;
                                   var   T               : TTable
                                  );

      // -------------------------------------------------------------------------------------------

      // Procedimento limpa/inicializa o registro de parâmetros
      procedure LimpaParamIntegra(var rParamIntegra: TParamIntegra);

      // Procedimento que busca a parametrização financeira/contábil dos itens
      function BuscaParamIntegra(const sOrigemContab  : String;
                                 var   rParamIntegra  : TParamIntegra;
                                       qry            : TwwQuery;
                                 const TipoParam      : TTipoParametros;
                                       bEnvio         : Boolean = False //Renato Visoni
                                ): Integer;

      // -------------------------------------------------------------------------------------------

      // Função de contabilização de itens em batch
      function ContabilizaItens(const sOrigemContab   : String;
                                const sTipoContab     : String;
                                const sSQL            : String;
                                const sHistorico      : String;
                                const dDataLanc       : TDateTime;
                                var   sResult         : TStringList;
                                var   sErro           : TStringList;
                                var   iPlanilhaResult : Integer;
                                const bAtuDia         : Boolean = False;
                                //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Início
                                const prIDTIPOMOV         : Integer = -1;
                                const prPatro             : string = '';
                                const prPlano             : string = '';
                                const prData              : TDateTime = 0;
                                const prIdContratoEmptmo  : Integer = -1;
                                const prIdTipoEmptmo      : Integer = -1;
                                const prIdTipoContrEmptmo : Integer = -1;
                                const origemAtualizacaoDiaria : Boolean = False
                                //William Moreira da Silva - SOL 253185 PPM 771995 - Fim - verifica se veio da contabilização de atualização diaria
                                //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Fim
                               ): Integer;

      // Função de contabilização de itens em batch (Atualização diária)
      function ContabilizaItensAtuDia(const sOrigemContab   : String;
                                      const sTipoContab     : String;
                                      const sSQL            : String;
                                      const sHistorico      : String;
                                      const dDataLanc       : TDateTime;
                                      var   sResult         : TStringList;
                                      var   sErro           : TStringList;
                                      var   iPlanilhaResult : Integer;
                                      const bAtuDia         : Boolean = False
                                     ): Integer;

      // -------------------------------------------------------------------------------------------

      procedure CriaTabelaPDX(const sTabela: String; var T: TTable);

      function ExcluiTabelaPDX(const sTabela: String; var T: TTable): Boolean;

      // -------------------------------------------------------------------------------------------

      function EnviaCAPCAR(const sSQL           : String;
                           const sHistorico     : String;
                           const dDataLanc      : TDateTime;
                           const iCodTipoDoc    : Integer;
                           const iMoedaCorrente : Integer;
                           const sCCusto        : String;
                           const iPrograma      : Integer;
                           var   iPlanilha      : Integer;
                           var   sResult        : TStringList;
                           var   sErro          : TStringList
                          ): Integer;

      //Ádler Souza - SOL 137847 KTN 836194
      Procedure InsertHistEnvioEmptmo(IDHistMov : Extended; CodDocumento : String; IDTmpDesc : String);
      //Fim - Ádler Souza - SOL 137847 KTN 836194

      function EnviaLoteConcessao(const sSQL           : String;
                                  const sHistorico     : String;
                                  const dDataLanc      : TDateTime;
                                  const iCodTipoDoc    : Integer;
                                  const iMoedaCorrente : Integer;
                                  const sCCusto        : String;
                                  const iPrograma      : Integer;
                                  var   iPlanilha      : Integer;
                                  var   sResult        : TStringList;
                                  var   sErro          : TStringList
                                  ): Integer;

      //teste renato visoni
      function EnviaTaxaPGA(const sSQL           : String;
                                  const sHistorico     : String;
                                  const dDataLanc      : TDateTime;
                                  const iCodTipoDoc    : Integer;
                                  const iMoedaCorrente : Integer;
                                  const sCCusto        : String;
                                  const iPrograma      : Integer;
                                  var   iPlanilha      : Integer;
                                  var   sResult        : TStringList;
                                  var   sErro          : TStringList;
                                  iDocumentoPai        : Integer; //teste renato visoni
                                  plstDocumentosCapCar : TStringList = nil ; pRecPag : string = ''  //teste renato visoni
                                  ): Integer;


      Function MontaEstruturaReceber(qryItensCAPCAR,pQryReceber : TwwQuery) : Boolean;


      //teste renato visoni


      function InsereDocumento(var   rParam        : TParamIntegra;
                               var   sErro         : TStringList;
                                     CtrlDocumento : TCtrlDocumento;
                               const sHistorico    : String;
                               const bLote         : Boolean = False;
                               iDocumentoPai       : Integer = -1
                              ): Boolean;

      function LancaRateio(const sCCusto        : String;
                           const iPrograma      : Int64;
                                 CtrlDocumento  : TCtrlDocumento;
                           var   rParam         : TParamIntegra;
                           var   sErro          : TStringList): Boolean;

      function LancaDocumento(var   rParam         : TParamIntegra;
                              const fValor         : Currency;
                              const sHistorico     : String;
                                    CtrlDocumento  : TCtrlDocumento;
                              var   iPlanilha      : Integer;
                              var   sErro          : TStringList;
                              const bHistContrato  : Boolean = True;
                              sRecPag              : String ='';
                              pDocumento           : Integer = -1
                             ): Boolean;

      function SetMensagem(const iDocumento     : Int64;
                           const vMsgCnab       : Array of String;
                                 CtrlDocumento  : TCtrlDocumento;
                           var   sErro          : TStringList
                          ): Boolean;

      // -------------------------------------------------------------------------------------------

      function InsertCtrlInterface(const iIDLote   : Int64;
                                   const iNumReg   : Int64;
                                   const iPatro    : Int64;
                                   const sMesRef   : String;
                                   const fValor    : Currency;
                                   isEnviaFolhaResgate : integer = 0 //
                                  ): Boolean;

// MARCIO SANCHES SPINOSA SOL 169010 KINTANA 1495798 - INICIO
      function UpdateCtrlInterface(const iIDLote   : Int64;
                                   isEnviaFolhaResgate : Integer = 0 // MARCIO SANCHES SPINOSA SOL 169010 KINTANA 1495798
                                  ): Boolean;
// MARCIO SANCHES SPINOSA SOL 169010 KINTANA 1495798 - FIM

      function EnviaTMPDESC(const sSQL       : String;
                            const sHistorico : String;
                            const sNomePatro : String;
                            const sAnoMesCob : String;
                            const dDataLanc  : TDateTime;
                            var   sResult    : TStringList;
                            var   sErro      : TStringList;
                            const iPatro     : Integer;
                            var   iLote      : Integer;
                            var   iTotalReg  : Integer;
                            var   fTotalPatro: Currency;
                            const iAgrupa    : Integer;
                            bInformativa: Boolean = False;
                            bAtualizaEnvio: Boolean = True; //BRUNO AZEVEDO SOL 153430 KINTANA 1156998
                            bEnviarFolhaResgate : Integer = 0; // MARCIO SANCHES SPINOSA SOL 169010 KINTANA 1495798
                            qryEnviaPgtoResgate : TwwQuery = nil  // TADEU PASSOS SOL 182258 KINTANA 1697187
                           ): Integer;

      function InsertTmpDesc(const Registro  : TDadosTmpDesc;
                             const IDTmpDesc : Extended;
                             const fValor    : Currency
                            ): Boolean;


      function MarcaBaixaTMPDESC(const IDTmpDesc: Extended): Boolean;

      //edilaine SIG101022 : inicio
      Function RecebeValorNegativo(sSQL : String;
                                   sDataLanc : string;
                                   sNomePatro : string;
                                   var  sResult : TStringList;
                                   var  sErro   : TStringList
                                  ): integer;
      //edilaine SIG101022 : fim

      // -------------------------------------------------------------------------------------------

      // Verifica se é possível excluir a folha
      function VerificaExclusaoFolha(const IDContratoEmptmo : Extended;
                                     const IDTmpDesc        : Extended;
                                     const IDHistMovEmptmo  : Extended;
                                     const sMesCobranca     : String = ''
                                    ): Integer;

      function ExcluiTMPDESCPorMes(const IDContratoEmptmo : Extended;
                                   const IDHistMovEmptmo  : Extended;
                                   const sMesCobranca     : String;
                                   const bMostraMsg       : Boolean = True
                                  ): Boolean;

      function ExcluiTMPDESCPorTmp(const IDContratoEmptmo : Extended;
                                   const IDTmpDesc        : Extended;
                                   var   sMsg             : String;
                                   const bMostraMsg       : Boolean = True
                                  ): Integer;

      // -------------------------------------------------------------------------------------------

      function VerificaDocumento(const fDocumento : Extended;
                                 var   sMsg       : String
                                ): Integer;


      function ExcluiFinanceiro(const fDocumento : Extended;
                                var   sMsg       : String
                               ): Integer;

      // -------------------------------------------------------------------------------------------

      function  VerificaPlanilha(const fPlanilha : Extended;
                                 var   sMsg      : String
                                ): Integer;

      function ExcluiContabil(const fPlanilha : Extended;
                              var   sMsg      : String
                             ): Integer;

      // -------------------------------------------------------------------------------------------

      function EfetuaBaixaCAR(const iDocumento : Int64) : Boolean;

      function DesfazEnvio(const iContratoEmptmo: Extended;
                           const iParcela       : Integer;
                           const iAno           : Integer;
                           const iMes           : Integer;
                           const dDataPrevista  : TDateTime;
                           const bCompetencia   : Boolean;
                           const sFormaEnvio    : String;
                           const bMostraMsg     : Boolean = True
                          ): Boolean;

      function DesfazEnvioPorDocumento(const fDocumento: Extended;
                                       const bMostraMsg: Boolean = False;
                                       const fTipoMov : Integer = -1;
                                       const bApagaDoc : boolean = true    //edilaine SIG113052
                                      ): Boolean;

      function DesfazEnvioPorDocumentoProc(const fDocumento: Extended;
                                           const bMostraMsg : Boolean = False;
                                           const iOrigem    : Integer = -1
                                          ): Boolean;

      // -------------------------------------------------------------------------------------------

      function DesfazContabilizacaoPorPlanilha(const fPlanilha : Extended;
                                               const bMostraMsg: Boolean
                                              ): Boolean;

      function DesfazContabilizacaoPorEvento(const dDataInicial : TDateTime;
                                             const dDataFinal   : TDateTime;
                                             const iEvento      : Integer
                                            ): Integer;

      // -------------------------------------------------------------------------------------------


      // -------------------------------------------------------------------------------------------
      function  BuscaBanco(const iContaBancaria: Int64): Int64;
      function  BuscaPortadorFormaFolha(var iPortadorForma: Int64): Integer;
      function  AjustaDataVenctoFolha: TDateTime;

      // -------------------------------------------------------------------------------------------

      function  AcertaPlanoOrigem(IDContratoEmptmo : Extended;
                                  IDPessoa         : Extended;
                                  IDPlanoPrev      : Integer;
                                  bUpdate          : Boolean
                                 ): Integer;

      // -------------------------------------------------------------------------------------------

      function  EventoBaixado(const IDContratoEmptmo : Extended;
                              const iEvento          : Integer;
                              const dDataEvento      : TDateTime
                             ): Boolean;

      function  EventoEnviado(const IDContratoEmptmo : Extended;
                              const iEvento          : Integer;
                              const dDataEvento      : TDateTime
                             ): Boolean;

      function  ConciliaDocumento(const CodDocumento  : Extended;
                                  const iTipoConcilia : Integer
                                 ): Boolean;

      function  VlrBaixadoDoc(const fDocumento: Extended): Currency;
      function  UltDataBaixaDoc(const fDocumento: Extended): TDateTime;

      function  VlrBaixadoTMPDESC(const IDTmpDesc: Extended): Currency;

      // -------------------------------------------------------------------------------------------

      function ExistemItensNaoContabilizados(const iAno  : Integer;
                                             const iMes  : Integer;
                                             const dData : TDateTime
                                            ): Boolean;

      function ExistemItensJaContabilizados(const iTipoMov  : Integer;
                                            const dData     : TDateTime
                                           ): Boolean;

      // -------------------------------------------------------------------------------------------

      function ContratoOriginal(const IDContrato: Extended): Extended;
      function BuscaDataInicio(const IDContrato: Extended): TDateTime;

      // Marchetti - Pendencia 22641
      function BuscaDataInicioTipoContr(iPessoa: Integer; iTipoContrEmptmo : Integer): TDateTime;
      // Fim Marchetti - Pendencia 22641

      // -------------------------------------------------------------------------------------------

      procedure MontaParamCAPCAR(const iTipoMov       : Integer;
                                 const iTipoDocRec    : Int64;
                                 const iTipoDocPag    : Int64;
                                 const dDataLanc      : TDateTime;
                                 const dDataVenc      : TDateTime;
                                 const qry            : TwwQuery;
                                 const iMoedaCorrente : Int64;
                                 var   rParam         : TParamIntegra
                                );

      procedure MontaParamRateio(const qry    : TwwQuery;
                                 var   rParam : TParamIntegra;
                                 TipoEnvio    : String = '' // Teste renato visoni
                                 );

      function ComparaParam(var rParam1, rParam2: TParamIntegra): Boolean;
      function ComparaParamFolha(var rParam1, rParam2: TDadosTmpDesc): Boolean;

     

      // -------------------------------------------------------------------------------------------
   end;


var
   IntegraEmptmo : TIntegraEmptmo;
   //Pendência 24800 - 21/03/2007 - Alberto
   CtrlLancamento : TCtrlLancamento;
   CtrlPeriodo    : TCtrlPeriodo;
   CtrlContab     : TCtrlContab;
   iDocumentoPai  : Integer; // teste renato visoni
   //Fim Pendência 24800

   vFlagVerifica   : Boolean;



implementation
uses
   dBaseDados, uDataBase, uSistema, uMensErro, FProgresso, uIntegraBack, uFuncaoGeral,
   UCalcEmptmo,    // BuscaData
   UFuncoesEmptmo, // BuscaSitPart
   dIntegraEmptmo,
   dEmptmo,
   dLookEmptmo,
   ULancContab,    // TestaPeriodo
   UDocumento;     // Rotinas do CAPCAR


//ALEX
procedure TIntegraEmptmo.AbreParamIntegra(const iTipoContrato, iItem, iPlano, iPatro: Int64);
var
   sSql: String;
begin

   sSql :=
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   'SELECT '                                     + #13 + //renato visoni
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '  PI.IDPARAMINTEGRAEP , PI.DESCPARAMINTEGRA, PI.IDPLANOPREVCONTAB, '      + #13 +
   '  PI.IDPLANOPREV      , PI.IDPATRO         , PI.IDTIPOEMPTMO     , '      + #13 +
   '  PI.IDTIPOCONTREMPTMO, PI.IDITEMEMPTMO    , PI.IDPESSOA         , '      + #13 +
   '  PI.IDEMPRESA        , PI.PLANO           , PI.CCDEBFOLHA       , '      + #13 +
   '  PI.CCCREDFOLHA      , PI.SUBCDEBFOLHA    , PI.SUBCCREDFOLHA    , '      + #13 +
   '  PI.CCUSTDEBFOLHA    , PI.CCUSTCREDFOLHA  , PI.CCDEBFINAN       , '      + #13 +
   '  PI.CCCREDFINAN      , PI.SUBCDEBFINAN    , PI.SUBCCREDFINAN    , '      + #13 +
   '  PI.CCUSTDEBFINAN    , PI.CCUSTCREDFINAN  , PI.CODCENTRORESPON  , '      + #13 +
   '  PI.UNIDNEGOC        , PI.RECPAGFINAN     , PI.TIPORECDESFINAN  , '      + #13 +
   '  PI.RECPAGFOLHA      , PI.TIPORECDESFOLHA , PI.RECPAG '                  + #13 +
   //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO - INICIO
   ' ,PI.CCDEBFOLHARESULT,   PI.CCCREDFOLHARESULT, PI.CCUSTDEBFOLHARESULT, '  + #13 +
   ' PI.CCUSTCREDFOLHARESULT, PI.SUBCDEBFOLHARESULT, PI.SUBCCREDFOLHARESULT,' + #13 +
   ' PI.TIPORECDESFOLHARESULT                                               ' + #13 +
   //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO - FIM
   
   'FROM '                                                                    + #13 +
   '  PARAMINTEGRAEP PI '                                                     + #13 +
   'WHERE '                                                                   + #13 +
   '      ( PI.IDPESSOA          = ' + IntToStr(Sistema.IDEmpresa) + ' ) '    + #13 +
   '  AND ( PI.IDITEMEMPTMO      = ' + IntToStr(iItem)             + ' ) '    + #13 +
   '  AND ( PI.IDTIPOCONTREMPTMO = ' + IntToStr(iTipoContrato)     + ' ) '    + #13;

   if (iPlano > 0) then
   begin
      sSql := sSql +
      ' AND ( PI.IDPLANOPREV = ' + IntToStr(iPlano) + ' ) '                   + #13;
   end else begin
      sSql := sSql +
      ' AND ( PI.IDPLANOPREV IS NULL ) '                                      + #13;
   end;

   if (iPatro > 0) then
   begin
      sSql := sSql +
      ' AND ( PI.IDPATRO = ' + IntToStr(iPatro) + ' ) '                       + #13;
   end else begin
      sSql := sSql +
      ' AND ( PI.IDPATRO IS NULL ) '                                          + #13;
   end;

   dtmEmptmo.qryParamIntegra.SQL.Clear;
   dtmEmptmo.qryParamIntegra.SQL.Text := sSql;
   dtmEmptmo.qryParamIntegra.Open;
end;



function TIntegraEmptmo.EntidadeContabil(const iPlano: Int64): Int64;
begin
   Result := -1;

   // André Pontes - 05/03/2004
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      with dtmEmptmo.qryEntidadeContabilVolta do
      begin
         LimpaParametros(dtmEmptmo.qryEntidadeContabilVolta);
         ParamByName('PIDPLANPREVC').AsInteger := iPlano;
         Open;

         if not(isEmpty) then Result := dtmEmptmo.qryEntidadeContabilVoltaIDPLANOPREV.AsInteger;
      end;
   // FIM André Pontes - 05/03/2004
   end
   else
   begin
      with dtmEmptmo.qryEntidadeContabil do
      begin
         LimpaParametros(dtmEmptmo.qryEntidadeContabil);
         ParamByName('PIDPLANOPREV').AsInteger := iPlano;
         Open;

         if not(isEmpty) then Result := dtmEmptmo.qryEntidadeContabilIDPLANPREVC.AsInteger;
      end;
   end;
end;



(* -------------------------------------------------------------------------------------------------

   ContabilizaItens: Função que contabiliza itens, em batch.
                     Os itens a serem contabilizados são definidos pela query que será
                     passada para a função

   -------------------------------------------------------------------------------------------------
   O SQL a ser passado deverá ser um SELECT na HistMovEmptmo, com as seguintes características
   obigatórias:

   SELECT
      H.IDHISTMOVEMPTMO       ID do Histórico
      H.IDCONTRATOEMPTMO      ID do Contrato
      TC.IDTIPOCONTREMPTMO    ID do Tipo de Contrato
      H.IDITEMEMPTMO          ID do Item a ser contabilizado
      C.IDPLANOPREV           ID do Plano Previdencial
      C.IDPATRO               ID da Patrocinadora
      H.HMEVLRPREVISTO        Valor a ser contabilizado (no caso de provisão)
      H.HMEVLREFETIVO         Valor a ser contabilizado (no caso de recebimento)
      H.HMEFORMACOBRANCA      'F' = Folha   |__ define quais contas a usar na contabilização
                              'C' = CaP/CaR |
      ITC.TIPCODIGO
   WHERE
      TE.IDEMPRESAPROP =      Filtrar obrigatoriamente por Sistema.IDEmpresa

      AND ( (H.HMECENTRALIZA = 0) OR (H.HMECENTRALIZA IS NULL) )
                              Contabilizar apenas os itens que não são totalizadores
   ORDER BY
      HMEANOCOMPETENCIA, HMEMESCOMPETENCIA, H.IDCONTRATOEMPTMO

   -------------------------------------------------------------------------------------------------
   Parâmetros:

      sOrigemContab  :  'C' --> apropriação/provisão	grupo "Finan"
      					:  'F' --> retorno da folha		grupo "Folha"

      sTipoContab  	:  'N' --> contabilização
      					:  'E' --> estorno
                     :  'A' --> abono

      sSQL           :  SQL que será usado para buscar os itens (ver acima)
      dDataLanc

      sResult        :  linhas "de acerto" que serão exibidas, se for o caso
      sErro          :  linhas "de erro" que serão exibidas, se for o caso

      sHistorico     :  Histórico-padrão a ser passado para a Contabilidade

   -------------------------------------------------------------------------------------------------
   Códigos de retorno (controle de erro):
       0 : Lançamento(s) realizados com sucesso
      -1 : ERRO ao tentar selecionar os itens a contabilizar
      -2 : Query não retornou itens a contabilizar
      -3 : ERRO ao tentar criar tabela para agrupamento
      -4 : ERRO ao buscar Parâmetros de Integração
      -5 : ERRO ao fazer o Lançamento Contábil
      -6 : ERRO no Período Contábil
      -7 : Processo interrompido pelo usuário sem contabilização
      -8 : ERRO de parametrização do Perfil de Investimento

--------------------------------------------------------------------------------------------------*)
function TIntegraEmptmo.ContabilizaItens(const sOrigemContab   : String;
                                         const sTipoContab     : String;
                                         const sSQL            : String;
                                         const sHistorico      : String;
                                         const dDataLanc       : TDateTime;
                                         var   sResult         : TStringList;
                                         var   sErro           : TStringList;
                                         var   iPlanilhaResult : Integer;
                                         const bAtuDia         : Boolean = False;
                                         //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Início
                                         const prIDTIPOMOV         : Integer = -1;
                                         const prPatro             : string = '';
                                         const prPlano             : string = '';
                                         const prData              : TDateTime = 0;
                                         const prIdContratoEmptmo  : Integer = -1;
                                         const prIdTipoEmptmo      : Integer = -1;
                                         const prIdTipoContrEmptmo : Integer = -1;
                                         const origemAtualizacaoDiaria : Boolean = False
                                         //William Moreira da Silva - SOL 253185 PPM 771995 - Fim - verifica se veio da contabilização de atualização diaria
                                         //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Fim
                                        ): Integer;
var
   sModulo, s           : String;
   sSqlExec             : String;
   sDataLanc            : String;
   iEmpresa             : Integer;
   iExercicio           : Integer;
   iPeriodo             : Integer;
   iResultBusca, i      : Integer;
   TabelaPDX            : TTable;
   qryAux               : TwwQuery;
   qryItensContabiliza  : TwwQuery;
   var PR_GRAVA_PLANILHA: TStoredProc; //William Moreira da Silva - SOL 253185 PPM 771995
   rPreparaParamIntegra : TParamIntegra;
begin
   Result := 0;

   TabelaPDX := nil;
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := ftempregra;

   // cria a query que deve resultar nos itens a serem contabilizados
   qryItensContabiliza              := TwwQuery.Create(Application);
   qryItensContabiliza.DatabaseName := 'BaseDados';

   //Pendência 24800 - 21/03/2007 - Alberto
   CtrlLancamento := TCtrlLancamento.Create;
   CtrlLancamento.Initialize(dtmBaseDados.dbBaseDados,
                             true,
                             Sistema.ConnectionType,
                             Sistema.ConnectionSide);

   CtrlPeriodo := TCtrlPeriodo.Create;
   CtrlPeriodo.initializeas( CtrlLancamento );
   CtrlPeriodo.OnMessageInfo := nil;

   CtrlContab := TCtrlContab.Create;
   CtrlContab.initializeas( CtrlLancamento );
   //Fim Pendência 24800

   try
      // -------------------------------------------------------------------------------------------
      //    1º - seleção dos itens a contabilizar
      // -------------------------------------------------------------------------------------------

      s:= 'EP-ItensContab';
      if sTipoContab = 'E' then s:= s + 'Estorno';
      if sTipoContab = 'A' then s:= s + 'Abono';

      try
         MostraEspera('Selecionando Itens a contabilizar...');
         try
            //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Início
            {try
            if not origemAtualizacaoDiaria then
            begin
               PR_PREPARA_CONTABILIZACAO                := TStoredProc.Create(Application);
               PR_PREPARA_CONTABILIZACAO.DataBaseName   := 'BaseDados';
               PR_PREPARA_CONTABILIZACAO.StoredProcName := 'CM.PCK_EMPRESTIMO."PR_PREPARA_CONTABILIZACAO"';

               PR_PREPARA_CONTABILIZACAO.Params.CreateParam(ftFloat, 'pIdContratoEmptmo',  ptInput);
               PR_PREPARA_CONTABILIZACAO.Params.CreateParam(ftFloat, 'pIdTipoEmptmo',      ptInput);
               PR_PREPARA_CONTABILIZACAO.Params.CreateParam(ftFloat, 'pIdTipoContrEmptmo', ptInput);
               PR_PREPARA_CONTABILIZACAO.Params.CreateParam(ftString,  'pPatro',             ptInput);
               PR_PREPARA_CONTABILIZACAO.Params.CreateParam(ftString,  'pPlano',             ptInput);
               PR_PREPARA_CONTABILIZACAO.Params.CreateParam(ftDate,  'pDataPrevista',      ptInput);
               PR_PREPARA_CONTABILIZACAO.Params.CreateParam(ftInteger, 'pTipoMovimentacao',  ptInput);

               PR_PREPARA_CONTABILIZACAO.ParamByName('pIdContratoEmptmo').AsFloat  := prIdContratoEmptmo;
               PR_PREPARA_CONTABILIZACAO.ParamByName('pIdTipoEmptmo').AsFloat      := prIdTipoEmptmo;
               PR_PREPARA_CONTABILIZACAO.ParamByName('pIdTipoContrEmptmo').AsFloat := prIdTipoContrEmptmo;
               PR_PREPARA_CONTABILIZACAO.ParamByName('pPatro').AsString              := prPatro;
               PR_PREPARA_CONTABILIZACAO.ParamByName('pPlano').AsString              := prPlano;
               PR_PREPARA_CONTABILIZACAO.ParamByName('pDataPrevista').AsDateTime       := prData;
               PR_PREPARA_CONTABILIZACAO.ParamByName('pTipoMovimentacao').AsInteger  := prIDTIPOMOV;

               if not dtmBaseDados.dbBaseDados.InTransaction then
               begin
                  dtmBaseDados.dbBaseDados.StartTransaction;
               end;
               try
                  PR_PREPARA_CONTABILIZACAO.Prepare;
                  PR_PREPARA_CONTABILIZACAO.Close;
                  PR_PREPARA_CONTABILIZACAO.ExecProc;
                  dtmBaseDados.dbBaseDados.Commit;
               except
                  Result := -1;
               end;
            end;

            finally
               FreeAndNil(PR_PREPARA_CONTABILIZACAO);
            end; }

            //No lugar de executar essa query vamos rodar a stored procedure acima
            qryItensContabiliza.SQL.Text := sSQL;
            qryItensContabiliza.SQL.SaveToFile(ftempregra + '\' + s + '-' +
                                               FormatDateTime('yyyymmdd', dDataLanc) + '-' +
                                               FormatDateTime('yyyymmdd-hhnnss', Now) +
                                               '.txt');
            qryItensContabiliza.Open;

            //edilaine - SIG57627 - inicio
            if (not qryItensContabiliza.isEmpty) and (prIDTIPOMOV in [0,1,2,3,4,5,6]) then
            begin
              if not ValidaParamPerfilInvestimento(qryItensContabiliza, sErro) then
              begin
                Result := -8;  // falta parametrização Perfil de Investimento
                Exit;
              end;
            end;
            //edilaine - SIG57627 - fim

         except
            on E:Exception do
            begin
               sErro.Add(E.Message);
               Result := -1; // ERRO ao abrir
               Exit;
            end;
         end;
      finally
         EscondeEspera;
      end;


      // abre a tabela de itens a contabilizar - não havendo, sai...
      if qryItensContabiliza.isEmpty then
      begin
         Result := -2;  // não há itens
         Exit;
      end;

      // -------------------------------------------------------------------------------------------
      //    2º - manipulação da tabela temporária Paradox
      // -------------------------------------------------------------------------------------------

      // exclui a tabela
      if not(IntegraEmptmo.ExcluiTabelaPDX('CCEMPTMO.DB', TabelaPDX)) then
      begin
         sErro.Add('Erro ao Excluir Tabela Temporária.');
         Result := -3;  // não conseguiu excluir
         Exit;
      end;

      // cria a tabela
      try
         IntegraEmptmo.CriaTabelaPDX('CCEMPTMO.DB', TabelaPDX);
      except
         on E:Exception do
         begin
            sErro.Add(E.Message);
            Result := -3;  // não conseguir criar
            Exit;
         end;
      end;


      // define a estrutura da tabela
     if not(DefineEstruturaTabelaPDX(TabelaPDX)) then
      begin
         sErro.Add('ERRO ao tentar criar tabela  para agrupamento');
         Result := -3;  // não conseguir criar
         Exit;
      end;


        // Alteração Flávio Nogueira  16/06/2011 Sol 159447
      try
         if not(TabelaPDX.Active) then
            TabelaPDX.open;
      except
         on E:Exception do
         begin
            sErro.Add('Erro ao tentar abrir a tabela'+E.Message);
            Result := -3;  // não conseguir criar
            Exit;
         end;
      end;

      // -------------------------------------------------------------------------------------------
      //    3º - prepara os itens para posterior contabilização
      // -------------------------------------------------------------------------------------------

      // faz o TestaPeriodo apenas aqui, pois a Data de Lançamento será única
      sDataLanc      := FormatDateTime('dd/mm/yyyy', dDataLanc);
      iEmpresa       := Sistema.idEmpresa;
      sModulo        := '15'; // IntToStr(Sistema.idModulo)
      s              := '';

      //Pendência 24800 - 21/03/2007 - Alberto
      CtrlPeriodo.RetornaPeriodoExercicioData( iEmpresa, sDataLanc );
      iPeriodo   := CtrlPeriodo.Periodo;
      iExercicio := CtrlPeriodo.Exercicio;

      //if TestaPeriodo(False, 'BaseDados', sDataLanc, sModulo, iExercicio, iPeriodo, iEmpresa, s) = 0 then
      if (not CtrlPeriodo.TestaPeriodoBloqueadoProc(iEmpresa, tbBloqueado, iPeriodo, iExercicio, False)) and
         (CtrlContab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
      //Fim Pendência 24800
      begin
         //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Início
         // tendo conseguido, começa a iterar pela query
         with qryItensContabiliza do
         begin
            First;
            i := 0;
            frmProgresso.MostraFormProgresso('Preparando Itens para contabilização...',
                                             True,
                                             True,
                                             True,
                                             0,
                                             qryItensContabiliza.RecordCount);
            while not(EOF) do
            begin
               inc(i);
               frmProgresso.AndaFormProgresso(i);

               // Verifica se o usuário Cancelou a Operação
               if frmProgresso.Cancelou then
               begin
                  sErro.Add('Processo interrompido pelo usuário. Não houve contabilização.');
                  Result := -7;
                  Exit;
               end;

//**************************************************//ALEX AQUI//******************************************
               // ----------------------------------------------------------------------------------
               // procura os conjuntos de parâmetros e preenche o registro
               {iResultBusca := BuscaParamIntegra(sOrigemContab,
                                                 rPreparaParamIntegra,
                                                 qryItensContabiliza,
                                                 ttContabeis
                                                );}
               // ----------------------------------------------------------------------------------


               {case iResultBusca of

                 -5: begin (* grava no memErro item que deu errado *) end;
                 -4: begin (* grava no memErro item que deu errado *) end;

                  0:
                  begin}


               // Alimenta o objeto rPreparaParamIntegra com a qryItensContabiliza - Inicio
               rPreparaParamIntegra.iPlano               := FieldByName('PLANO').AsInteger;
               rPreparaParamIntegra.sContaDFolha         := FieldByName('CCDEBFOLHA').AsString;
               rPreparaParamIntegra.sContaCFolha         := FieldByName('CCCREDFOLHA').AsString;
               rPreparaParamIntegra.sCentroCustoDFolha   := FieldByName('CCUSTDEBFOLHA').AsString;
               rPreparaParamIntegra.sCentroCustoCFolha   := FieldByName('CCUSTCREDFOLHA').AsString;
               rPreparaParamIntegra.iSubContaDFolha      := FieldByName('SUBCDEBFOLHA').AsInteger;
               rPreparaParamIntegra.iSubContaCFolha      := FieldByName('SUBCCREDFOLHA').AsInteger;
               rPreparaParamIntegra.sTipoRecDesFolha     := FieldByName('TIPORECDESFOLHA').AsString;
               rPreparaParamIntegra.sContaDFinan         := FieldByName('CCDEBFINAN').AsString;
               rPreparaParamIntegra.sCentroCustoDFinan   := FieldByName('CCUSTDEBFINAN').AsString;
               rPreparaParamIntegra.iSubContaDFinan      := FieldByName('SUBCDEBFINAN').AsInteger;
               rPreparaParamIntegra.sContaCFinan         := FieldByName('CCCREDFINAN').AsString;
               rPreparaParamIntegra.sCentroCustoCFinan   := FieldByName('CCUSTCREDFINAN').AsString;
               rPreparaParamIntegra.iSubContaCFinan      := FieldByName('SUBCCREDFINAN').AsInteger;
               rPreparaParamIntegra.sRecPagFolha         := FieldByName('RECPAGFOLHA').AsString;
               rPreparaParamIntegra.sTipoRecDesFinan     := FieldByName('TIPORECDESFINAN').AsString;
               rPreparaParamIntegra.sRecPagFinan         := FieldByName('RECPAGFINAN').AsString;
               rPreparaParamIntegra.iUnidNegoc           := FieldByName('UNIDNEGOC').AsInteger;
               rPreparaParamIntegra.sCentroRespon        := FieldByName('CODCENTRORESPON').AsString;
               rPreparaParamIntegra.iHistorico           := FieldByName('IDHISTMOVEMPTMO').AsFloat;
               rPreparaParamIntegra.iTipoContrato        := FieldByName('IDTIPOCONTREMPTMO').AsInteger;
               rPreparaParamIntegra.iItem                := FieldByName('IDITEMEMPTMO').AsInteger;
               rPreparaParamIntegra.sItem                := FieldByName('ITEDESCRICAO').AsString;
               rPreparaParamIntegra.iPlanPrevContab      := FieldByName('IDPLANOORIGEM').AsInteger;
               rPreparaParamIntegra.iPatro               := FieldByName('IDPATRO').AsInteger;
               rPreparaParamIntegra.sFormaEnvio          := FieldByName('HMEFORMACOBRANCA').AsString;
               rPreparaParamIntegra.sTipoPer             := FieldByName('TIPCODIGO').AsString;

               // Marchetti - Pendencia 26402
               if Sistema.TipoCliente <> 20071 then
               begin
                  rPreparaParamIntegra.iPlanoPrev   := FieldByName('IDPLANOORIGEM').AsInteger;
               end
               else
               begin
                  LimpaParametros(dtmIntegraEmptmo.qryBuscaPlanoPrev);
                  dtmIntegraEmptmo.qryBuscaPlanoPrev.ParamByName('PIDPLANOCONTAB').AsInteger := FieldByName('IDPLANOORIGEM').AsInteger;
                  dtmIntegraEmptmo.qryBuscaPlanoPrev.Open;

                  if dtmIntegraEmptmo.qryBuscaPlanoPrev.IsEmpty then
                     rPreparaParamIntegra.iPlanoPrev   := FieldByName('IDPLANOPREV').AsInteger
                  else
                     rPreparaParamIntegra.iPlanoPrev   := dtmIntegraEmptmo.qryBuscaPlanoPrev.FieldByName('IDPLANOPREV').AsInteger;

                  dtmIntegraEmptmo.qryBuscaPlanoPrev.Close;
               end;

               if(sOrigemContab = 'C')then
                  rPreparaParamIntegra.fVlrLanc        := FieldByName('HMEVLRPREVISTO').AsFloat
               else
                  rPreparaParamIntegra.fVlrLanc        := FieldByName('HMEVLREFETIVO').AsFloat;
               // Alimenta o objeto rPreparaParamIntegra com a qryItensContabiliza - Fim

               GravaItemPDX(sOrigemContab,
                            sTipoContab,
                            TabelaPDX,
                            rPreparaParamIntegra,
                            dDataLanc,
                            iExercicio,
                            iPeriodo
                            );

                   {with dtmIntegraEmptmo.qryUpdateCCHist do
                   begin
                      LimpaParametros(dtmIntegraEmptmo.qryUpdateCCHist);
                      ParamByName('PCCDEBFINAN').AsString       := rPreparaParamIntegra.sContaDFinan;
                      ParamByName('PCCCREDFINAN').AsString      := rPreparaParamIntegra.sContaCFinan;
                      ParamByName('PCCDEBFOLHA').AsString       := rPreparaParamIntegra.sContaDFolha;
                      ParamByName('PCCCREDFOLHA').AsString      := rPreparaParamIntegra.sContaCFolha;
                      ParamByName('PIDHISTMOVEMPTMO').AsFloat   := rPreparaParamIntegra.iHistorico;

                      ExecSQL;
                   end;}

                //end;
                Application.ProcessMessages;
               Next;
            end;

         end;
         //William Moreira da Silva - SOL 253185 PPM 771995 - Inicio
         //qryItensContabiliza.Close;
         //qryItensContabiliza.Free;
         //William Moreira da Silva - SOL 253185 PPM 771995 - Fim
      end; // with
      //Wylliam Leite da Silva - SOL 253185 PPM 771995 - Fim

      //TODO : Verificar aqui
      frmProgresso.EscondeFormProgresso;
      //Jéssica Lana SOL 114575 24/04/2009
      qryAux.DatabaseName := ftempregra;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT COUNT(*) AS TOTAL FROM "CCEMPTMO.DB" CCEMPTO');
      qryAux.Open;

      // NÃO há registro na tabela Temporária. Houve erro na busca de Parâmetros
      try
         if qryAux.FieldByName('TOTAL').AsInteger = 0 then
         begin
            sErro.Add('NÃO há registros na tabela Temporária.');
            Result := -4;
            Exit;
         end;
      except
         sErro.Add('NÃO há registros na tabela Temporária.');
         Result := -4;
         Exit;
      end;


    // -------------------------------------------------------------------------------------------
    //    4º - Contabilização
    // -------------------------------------------------------------------------------------------

       MostraEspera('Executando lançamentos contábeis...');

       // aqui ocorre a contabilização
       iPlanilhaResult := ConsolidaContabiliza(sHistorico);

       EscondeEspera;

       if iPlanilhaResult > 0 then
       begin
          try
             //William Moreira da Silva - SOL 253185 PPM 771995 - Início
             // grava a planilha resultante em todos os registros da HistMovEmptmo afetados
             try
               MostraEspera('Gravando planilha nº '+inttostr(iPlanilhaResult)+'...');
               if sOrigemContab = 'C' then
               begin
                    PR_GRAVA_PLANILHA                := TStoredProc.Create(Application);
                    PR_GRAVA_PLANILHA.DataBaseName   := 'BaseDados';
                    PR_GRAVA_PLANILHA.StoredProcName := 'CM.PCK_EMPRESTIMO."PR_GRAVA_PLANILHA"';

                    PR_GRAVA_PLANILHA.Params.CreateParam(ftFloat,   'pIdContratoEmptmo',  ptInput);
                    PR_GRAVA_PLANILHA.Params.CreateParam(ftFloat,   'pIdTipoEmptmo', ptInput);
                    PR_GRAVA_PLANILHA.Params.CreateParam(ftFloat,   'pIdTipoContrEmptmo', ptInput);
                    PR_GRAVA_PLANILHA.Params.CreateParam(ftString,  'pPatro', ptInput);
                    PR_GRAVA_PLANILHA.Params.CreateParam(ftString,  'pPlano',             ptInput);
                    PR_GRAVA_PLANILHA.Params.CreateParam(ftDate,    'pDataContab',      ptInput);
                    PR_GRAVA_PLANILHA.Params.CreateParam(ftInteger, 'pTipoMovimentacao', ptInput);
                    PR_GRAVA_PLANILHA.Params.CreateParam(ftInteger, 'pPlnCodigo',             ptInput);
                    PR_GRAVA_PLANILHA.Params.CreateParam(ftString,  'pTipoContab',      ptInput);

                    PR_GRAVA_PLANILHA.ParamByName('pIdContratoEmptmo').AsFloat       := prIdContratoEmptmo;
                    PR_GRAVA_PLANILHA.ParamByName('pIdTipoEmptmo').AsFloat           := prIdTipoEmptmo;
                    PR_GRAVA_PLANILHA.ParamByName('pIdTipoContrEmptmo').AsFloat      := prIdTipoContrEmptmo;
                    PR_GRAVA_PLANILHA.ParamByName('pPatro').AsString                 := prPatro;
                    PR_GRAVA_PLANILHA.ParamByName('pPlano').AsString                 := prPlano;
                    PR_GRAVA_PLANILHA.ParamByName('pDataContab').AsDateTime          := dDataLanc;
                    PR_GRAVA_PLANILHA.ParamByName('pTipoMovimentacao').AsInteger     := prIDTIPOMOV;
                    PR_GRAVA_PLANILHA.ParamByName('pPlnCodigo').AsInteger            := iPlanilhaResult;
                    PR_GRAVA_PLANILHA.ParamByName('pTipoContab').AsString            := sTipoContab;

                    if not dtmBaseDados.dbBaseDados.InTransaction then
                    begin
                         dtmBaseDados.dbBaseDados.StartTransaction;
                    end;

                    PR_GRAVA_PLANILHA.Prepare;
                    PR_GRAVA_PLANILHA.Close;
                    PR_GRAVA_PLANILHA.ExecProc;

                    dtmBaseDados.dbBaseDados.Commit;
               end;

             finally
                EscondeEspera;
             end;
             //William Moreira da Silva - SOL 253185 PPM 771995 - Início
                              {if not origemAtualizacaoDiaria then
                                 GravaPlanilha(iPlanilhaResult,
                                            dDataLanc,
                                            sTipoContab,
                                            bAtuDia
                                            )
                              else
                              //Se vinher da contabilização de atualização diaria, chamar
                                   GravaPlanilhaGrupo(iPlanilhaResult,
                                                      dDataLanc,
                                                      sTipoContab,
                                                      bAtuDia
                                                      );   }
          except
             // mostrar mensagem de erro e gravar no memErro
             Result := -5;
          end;

       end
       else
       begin
          Result := -5;
       end; // if iPlanilhaResult > 0

      // -------------------------------------------------------------------------------------------
      //    FIM
      // -------------------------------------------------------------------------------------------
      {begin
      end
      else
      begin
         // mensagem de erro de TestaPeriodo
         Result := -6;
      end; // if TestaPeriodo}


   finally
      frmProgresso.EscondeFormProgresso;
      EscondeEspera;

      qryAux.Free;
      qryItensContabiliza.Free; //Wylliam Leite da Silva - SOL 253185 PPM 771995
      //Pendência 24800 - 21/03/2007 - Alberto

      FreeAndNil( CtrlLancamento );
      FreeAndNil( CtrlPeriodo );
      FreeAndNil( CtrlContab );
      //Fim Pendência 24800

      if TabelaPDX <> nil then TabelaPDX.Close;
      if TabelaPDX <> nil then TabelaPDX.Free;
   end;
end;




function TIntegraEmptmo.ContabilizaItensAtuDia(const sOrigemContab   : String;
                                               const sTipoContab     : String;
                                               const sSQL            : String;
                                               const sHistorico      : String;
                                               const dDataLanc       : TDateTime;
                                               var   sResult         : TStringList;
                                               var   sErro           : TStringList;
                                               var   iPlanilhaResult : Integer;
                                               const bAtuDia         : Boolean = False
                                              ): Integer;
var
   sModulo, s           : String;
   sSqlExec             : String;
   sDataLanc            : String;
   iEmpresa             : Integer;
   iExercicio           : Integer;
   iPeriodo             : Integer;
   iResultBusca, i      : Integer;
   TabelaPDX            : TTable;
   qryAux               : TwwQuery;
   qryItensContabiliza  : TwwQuery;
   rPreparaParamIntegra : TParamIntegra;
begin
   Result := 0;

   // incializa a tabela
   TabelaPDX := nil;

   // cria a query Auxiliar
   qryAux               := TwwQuery.Create(Application);
   //Jéssica Lana SOL 114575 24/04/2009
   //qryAux.DatabaseName  := copy(Sistema.TempDir, 1, length(Sistema.TempDir) - 1);
   //qryAux.DatabaseName  := copy(ftempregra + '\' , 1, length(ftempregra ) - 1);
     qryAux.DatabaseName := ftempregra;
   // cria a query que deve resultar nos itens a serem contabilizados
   qryItensContabiliza              := TwwQuery.Create(Application);
   qryItensContabiliza.DatabaseName := 'BaseDados';

   //Pendência 24800 - 21/03/2007 - Alberto
   CtrlLancamento := TCtrlLancamento.Create;
   CtrlLancamento.Initialize(dtmBaseDados.dbBaseDados,
                           true,
                           Sistema.ConnectionType,
                           Sistema.ConnectionSide
                          );

   CtrlPeriodo := TCtrlPeriodo.Create;
   CtrlPeriodo.initializeas( CtrlLancamento );
   CtrlPeriodo.OnMessageInfo := nil;

   CtrlContab := TCtrlContab.Create;
   CtrlContab.initializeas( CtrlLancamento );
   //Fim Pendência 24800

   try
      // -------------------------------------------------------------------------------------------
      //    1º - seleção dos itens a contabilizar
      // -------------------------------------------------------------------------------------------

      s:= 'EP-ItensContab';
      if sTipoContab = 'E' then s:= s + 'Estorno';

      try
         MostraEspera('Selecionando Itens a contabilizar...');
         try
            qryItensContabiliza.SQL.Text := sSQL;
            //Jéssica Lana SOL 114575 24/04/2009
            //qryItensContabiliza.SQL.SaveToFile(Sistema.TempDir + s + '-' +
              qryItensContabiliza.SQL.SaveToFile(ftempregra + '\' +  s + '-' +
                                               FormatDateTime('yyyymmdd', dDataLanc) + '-' +
                                               FormatDateTime('yyyymmdd-hhnnss', Now) +
                                               '.txt'
                                              );
            qryItensContabiliza.Open;
         except
            on E:Exception do
            begin
               sErro.Add(E.Message);
               Result := -1; // ERRO ao abrir
               Exit;
            end;// on
         end;// try..except

      finally
         EscondeEspera;
      end;

      // abre a tabela de itens a contabilizar - não havendo, sai...
      if qryItensContabiliza.isEmpty then
      begin
         Result := -2;  // não há itens
         Exit;
      end;

      // -------------------------------------------------------------------------------------------
      //    2º - manipulação da tabela temporária Paradox
      // -------------------------------------------------------------------------------------------

      // exclui a tabela
      if not(IntegraEmptmo.ExcluiTabelaPDX('CCEMPTMO.DB', TabelaPDX)) then
      begin
         sErro.Add('Erro ao Excluir Tabela Temporária.');
         Result := -3;  // não conseguiu excluir
         Exit;
      end;

      // cria a tabela
      try
         IntegraEmptmo.CriaTabelaPDX('CCEMPTMO.DB', TabelaPDX);
      except
         on E:Exception do
         begin
            sErro.Add(E.Message);
            Result := -3;  // não conseguir criar
            Exit;
         end;
      end;

      // define a estrutura da tabela
      if not(DefineEstruturaTabelaPDX(TabelaPDX)) then
      begin
         sErro.Add('ERRO ao tentar criar tabela para agrupamento');
         Result := -3;  // não conseguir criar
         Exit;
      end;
      TabelaPDX.open ;

      // -------------------------------------------------------------------------------------------
      //    3º - prepara os itens para posterior contabilização
      // -------------------------------------------------------------------------------------------

      // faz o TestaPeriodo apenas aqui, pois a Data de Lançamento será única
      sDataLanc      := FormatDateTime('dd/mm/yyyy', dDataLanc);
      iEmpresa       := Sistema.idEmpresa;
      sModulo        := '15'; // IntToStr(Sistema.idModulo)
      s              := '';

      //Pendência 24800 - 21/03/2007 - Alberto
      CtrlPeriodo.RetornaPeriodoExercicioData( iEmpresa, sDataLanc );
      iPeriodo   := CtrlPeriodo.Periodo;
      iExercicio := CtrlPeriodo.Exercicio;

      //if TestaPeriodo(False, 'BaseDados', sDataLanc, sModulo, iExercicio, iPeriodo, iEmpresa, s) = 0 then
      if (not CtrlPeriodo.TestaPeriodoBloqueadoProc(iEmpresa, tbBloqueado, iPeriodo, iExercicio, False)) and
         (CtrlContab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
      //Fim Pendência 24800
      begin
         // tendo conseguido, começa a iterar pela query
         with qryItensContabiliza do
         begin
            First;
            i := 0;
            frmProgresso.MostraFormProgresso('Preparando Itens para contabilização...',
                                             True,
                                             True,
                                             True,
                                             0,
                                             qryItensContabiliza.RecordCount
                                            );

            while not(qryItensContabiliza.EOF) do
            begin
               inc(i);
               frmProgresso.AndaFormProgresso(i);

               // Verifica se o usuário Cancelou a Operação
               if frmProgresso.Cancelou then
               begin
                  sErro.Add('Processo interrompido pelo usuário. Não houve contabilização.');
                  Result := -7;
                  Exit;
               end;

               // ----------------------------------------------------------------------------------
               // procura os conjuntos de parâmetros e preenche o registro
               iResultBusca := BuscaParamIntegra(sOrigemContab,
                                                 rPreparaParamIntegra,
                                                 qryItensContabiliza,
                                                 ttContabeis
                                                );
               // ----------------------------------------------------------------------------------


               case iResultBusca of

                 -5: begin (* grava no memErro item que deu errado *) end;
                 -4: begin (* grava no memErro item que deu errado *) end;

                  0:
                  begin
                     GravaItemPDX(sOrigemContab,
                                  sTipoContab,
                                  TabelaPDX,
                                  rPreparaParamIntegra,
                                  dDataLanc,
                                  iExercicio,
                                  iPeriodo
                                 );

                     with dtmIntegraEmptmo.qryUpdateCCHistGrupo do
                     begin
                        LimpaParametros(dtmIntegraEmptmo.qryUpdateCCHistGrupo);

                        ParamByName('PCCDEBFINAN').AsString          := rPreparaParamIntegra.sContaDFinan;
                        ParamByName('PCCCREDFINAN').AsString         := rPreparaParamIntegra.sContaCFinan;
                        ParamByName('PCCDEBFOLHA').AsString          := rPreparaParamIntegra.sContaDFolha;
                        ParamByName('PCCCREDFOLHA').AsString         := rPreparaParamIntegra.sContaCFolha;

                        ParamByName('PHMEDATAPREVISTA').AsDateTime   := dDataLanc;
                        ParamByName('PIDITEMEMPTMO').AsInteger       := qryItensContabiliza.FieldByName('IDITEMEMPTMO').AsInteger;
                        ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryItensContabiliza.FieldByName('IDTIPOCONTREMPTMO').AsInteger;

                        if (sOrigemContab = 'C') and (sTipoContab = 'E') then ParamByName('PESTORNO').AsInteger  := 1;
                        if (sOrigemContab = 'C') and (sTipoContab = 'N') then ParamByName('PESTORNO').AsInteger  := 0;

                        dtmIntegraEmptmo.qryUpdateCCHistGrupo.ExecSQL;

                     end;

                  end;
               end;

               Application.ProcessMessages;
               qryItensContabiliza.Next;

               Application.ProcessMessages;
            end;
         end; // with

         frmProgresso.EscondeFormProgresso;
         //Jéssica Lana SOL 114575 24/04/2009
         //qryAux.DatabaseName  := copy(Sistema.TempDir, 1, length(Sistema.TempDir) - 1);
         //qryAux.DatabaseName  := copy(ftempregra + '\', 1, length(ftempregra) - 1);
           qryAux.DatabaseName := ftempregra;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('SELECT COUNT(*) AS TOTAL FROM "CCEMPTMO.DB" CCEMPTO');
         qryAux.Open;

         // NÃO há registro na tabela Temporária. Houve erro na busca de Parâmetros
         try
            if qryAux.FieldByName('TOTAL').AsInteger = 0 then
            begin
               sErro.Add('NÃO há registros na tabela Temporária.');
               Result := -4;
               Exit;
            end;
         except
            sErro.Add('NÃO há registros na tabela Temporária.');
            Result := -4;
            Exit;
         end;


      // -------------------------------------------------------------------------------------------
      //    4º - Contabilização
      // -------------------------------------------------------------------------------------------

         MostraEspera('Executando lançamentos contábeis...');

         // aqui ocorre a contabilização
         iPlanilhaResult := ConsolidaContabiliza(sHistorico);

         EscondeEspera;

         if (iPlanilhaResult > 0) then
         begin
            try
               // grava a planilha resultante em todos os registros da HistMovEmptmo afetados

               if sOrigemContab = 'C' then GravaPlanilhaGrupo(iPlanilhaResult,
                                                              dDataLanc,
                                                              sTipoContab,
                                                              bAtuDia
                                                             );

            except
               // mostrar mensagem de erro e gravar no memErro
               Result := -5;
            end;

         end
         else
         begin
            Result := -5;
         end; // if iPlanilhaResult > 0

      // -------------------------------------------------------------------------------------------
      //    FIM
      // -------------------------------------------------------------------------------------------

      end
      else
      begin
         // mensagem de erro de TestaPeriodo
         Result := -6;
      end; // if TestaPeriodo


   finally
      frmProgresso.EscondeFormProgresso;
      EscondeEspera;

      qryAux.Free;
      qryItensContabiliza.Free;

      //Pendência 24800 - 21/03/2007 - Alberto
      FreeAndNil( CtrlLancamento );
      FreeAndNil( CtrlPeriodo );
      FreeAndNil( CtrlContab );
      //Fim Pendência 24800

      if TabelaPDX <> nil then TabelaPDX.Close;
      if TabelaPDX <> nil then TabelaPDX.Free;
   end;
end;


function TIntegraEmptmo.BuscaParamIntegra(const sOrigemContab  : String;
                                          var   rParamIntegra  : TParamIntegra;
                                                qry            : TwwQuery;
                                          const TipoParam      : TTipoParametros;
                                                bEnvio         : Boolean = False //Renato Visoni
                                         ): Integer;
begin
   // nenhum padrão encontrado, a princípio
   Result := 0;

   // inicializa os parâmetros para Integração
   LimpaParamIntegra(rParamIntegra);

   // passa os dados necessários
   rParamIntegra.iHistorico      := qry.FieldByName('IDHISTMOVEMPTMO').AsFloat;
   rParamIntegra.iTipoContrato   := qry.FieldByName('IDTIPOCONTREMPTMO').AsInteger;
   rParamIntegra.iItem           := qry.FieldByName('IDITEMEMPTMO').AsInteger;

   if (TipoParam = ttContabeis) then
   begin
      rParamIntegra.sItem        := qry.FieldByName('ITEDESCRICAO').AsString;
   end;

   // André Pontes - 08/07/2004
   if (TipoParam = ttTmpDesc) then
   begin
      //William Moreira da Silva - SOL 261000 - PPM 1060102
      rParamIntegra.iPlanoPrev   := qry.FieldByName('IDPLANOPREV').AsInteger;
      //William Moreira da Silva - SOL 261000 - PPM 1060102
      //Marcio Sanches Spinosa SOL 201764 KINTANA 1963946 - Inicio
      if (rParamIntegra.iPlanoPrev = 74) and (qry.FieldByName('IDPLANOORIGEM').AsInteger = 28) then
         rParamIntegra.iPlanoPrev := 2;
      //Marcio Sanches Spinosa SOL 201764 KINTANA 1963946 - Fim
   end
   else
   begin
      // Marchetti - Pendencia 26402
      if Sistema.TipoCliente <> 20071 then
      begin
         rParamIntegra.iPlanoPrev   := qry.FieldByName('IDPLANOORIGEM').AsInteger;
      end
      else
      begin
         LimpaParametros(dtmIntegraEmptmo.qryBuscaPlanoPrev);
         dtmIntegraEmptmo.qryBuscaPlanoPrev.ParamByName('PIDPLANOCONTAB').AsInteger := qry.FieldByName('IDPLANOORIGEM').AsInteger;
         dtmIntegraEmptmo.qryBuscaPlanoPrev.Open;

         if dtmIntegraEmptmo.qryBuscaPlanoPrev.IsEmpty then
            rParamIntegra.iPlanoPrev   := qry.FieldByName('IDPLANOPREV').AsInteger
         else
            rParamIntegra.iPlanoPrev   := dtmIntegraEmptmo.qryBuscaPlanoPrev.FieldByName('IDPLANOPREV').AsInteger;

         dtmIntegraEmptmo.qryBuscaPlanoPrev.Close;
      end;
      // Fim Marchetti - Pendencia 26402
   end;

   rParamIntegra.iPlanPrevContab := qry.FieldByName('IDPLANOORIGEM').AsInteger;
   // FIM André Pontes - 08/07/2004

   rParamIntegra.iPatro          := qry.FieldByName('IDPATRO').AsInteger;
   rParamIntegra.sFormaEnvio     := qry.FieldByName('HMEFORMACOBRANCA').AsString;
   rParamIntegra.sTipoPer        := qry.FieldByName('TIPCODIGO').AsString;

   // ----------------------------------------------------------------------------------------------

   // o valor a lançar depende do tipo de contabilização
   if sOrigemContab = 'C' then     //ALEX123
   begin
      rParamIntegra.fVlrLanc     := qry.FieldByName('HMEVLRPREVISTO').AsFloat;   // provisão --> valor previsto
   end
   else
   begin
      rParamIntegra.fVlrLanc     := qry.FieldByName('HMEVLREFETIVO').AsFloat;    // recebimento patro --> valor efetivo
   end;
   vFlagVerifica := VerificaFlag(trim(qry.FieldByName('IDCONTRATOEMPTMO').AsString));
   // ----------------------------------------------------------------------------------------------

   try

       if not(bEnvio) then
          begin  //Renato Visoni
         // 1º passo: caso mais detalhado: Plano + Patro ----------------------------------------------

         IntegraEmptmo.AbreParamIntegra(rParamIntegra.iTipoContrato,
                                       rParamIntegra.iItem,
                                       rParamIntegra.iPlanoPrev,
                                       rParamIntegra.iPatro);


         // 2º Passo: apenas Patro --------------------------------------------------------------------
         if ( (Result = 0) and (dtmEmptmo.qryParamIntegra.isEmpty) ) then
         begin
           IntegraEmptmo.AbreParamIntegra(rParamIntegra.iTipoContrato,
                                          rParamIntegra.iItem,
                                          -1,
                                          rParamIntegra.iPatro);

         end
          else
          begin
         //Renato Visoni
            IntegraEmptmo.AbreParamIntegraNovo(rParamIntegra.iTipoContrato,rParamIntegra.iItem,rParamIntegra.iPlanoPrev,rParamIntegra.iPatro)
          end;


         // 3º Passo: apenas Plano --------------------------------------------------------------------
         if ( (Result = 0) and (dtmEmptmo.qryParamIntegra.isEmpty) ) then
         begin
           IntegraEmptmo.AbreParamIntegra(rParamIntegra.iTipoContrato,
                                          rParamIntegra.iItem,
                                          rParamIntegra.iPlanoPrev,
                                          -1);

         end
          else
          begin
         //Renato Visoni
          IntegraEmptmo.AbreParamIntegraNovo(rParamIntegra.iTipoContrato,rParamIntegra.iItem,rParamIntegra.iPlanoPrev,rParamIntegra.iPatro)
          end;


         // 4º (e último) Passo: nem Plano tampouco Patro ---------------------------------------------
         if ( (Result = 0) and (dtmEmptmo.qryParamIntegra.isEmpty) ) then      //ALEX
         begin
           IntegraEmptmo.AbreParamIntegra(rParamIntegra.iTipoContrato, rParamIntegra.iItem, -1, -1)
         end;
       end else
       begin
         //Renato Visoni  //ENTRA AQUI PARA chkCar
          IntegraEmptmo.AbreParamIntegraNovo(rParamIntegra.iTipoContrato,rParamIntegra.iItem,rParamIntegra.iPlanoPrev,rParamIntegra.iPatro)
       end;
       // Finalmentes: resultado da Busca -----------------------------------------------------------
       if (Result = 0) then
       begin
         // verifica se agora foi encontrado algum Padrão de Lançamento
           if ((dtmEmptmo.qryParamIntegra.Active) and not(dtmEmptmo.qryParamIntegra.isEmpty)) then
             begin
             if not(vFlagVerifica) Then              //ALEX123
                Begin
            // acaba de completar o registro dos parâmetros
               rParamIntegra.iPlano := dtmEmptmo.qryParamIntegraPLANO.AsInteger;
            if not(dtmEmptmo.qryParamIntegraCCDEBFOLHA.isNULL) then
               rParamIntegra.sContaDFolha         := dtmEmptmo.qryParamIntegraCCDEBFOLHA.AsString;
            if not(dtmEmptmo.qryParamIntegraCCCREDFOLHA.isNULL) then
               rParamIntegra.sContaCFolha         := dtmEmptmo.qryParamIntegraCCCREDFOLHA.AsString;
            if not(dtmEmptmo.qryParamIntegraCCUSTDEBFOLHA.isNULL) then
               rParamIntegra.sCentroCustoDFolha   := dtmEmptmo.qryParamIntegraCCUSTDEBFOLHA.AsString;
            if not(dtmEmptmo.qryParamIntegraCCUSTCREDFOLHA.isNULL) then
               rParamIntegra.sCentroCustoCFolha   := dtmEmptmo.qryParamIntegraCCUSTCREDFOLHA.AsString;
            if not(dtmEmptmo.qryParamIntegraSUBCDEBFOLHA.isNULL) then
               rParamIntegra.iSubContaDFolha      := dtmEmptmo.qryParamIntegraSUBCDEBFOLHA.AsInteger;
            if not(dtmEmptmo.qryParamIntegraSUBCCREDFOLHA.isNULL) then
               rParamIntegra.iSubContaCFolha      := dtmEmptmo.qryParamIntegraSUBCCREDFOLHA.AsInteger;
            if not(dtmEmptmo.qryParamIntegraTIPORECDESFOLHA.isNULL) then
               rParamIntegra.sTipoRecDesFolha     := dtmEmptmo.qryParamIntegraTIPORECDESFOLHA.AsString;
            if not(dtmEmptmo.qryParamIntegraCCDEBFINAN.isNULL) then
               rParamIntegra.sContaDFinan         := dtmEmptmo.qryParamIntegraCCDEBFINAN.AsString;
            if not(dtmEmptmo.qryParamIntegraCCUSTDEBFINAN.isNULL) then
               rParamIntegra.sCentroCustoDFinan   := dtmEmptmo.qryParamIntegraCCUSTDEBFINAN.AsString;
            if not(dtmEmptmo.qryParamIntegraSUBCDEBFINAN.isNULL) then
               rParamIntegra.iSubContaDFinan      := dtmEmptmo.qryParamIntegraSUBCDEBFINAN.AsInteger;
            if not(dtmEmptmo.qryParamIntegraCCCREDFINAN.isNULL) then
               rParamIntegra.sContaCFinan         := dtmEmptmo.qryParamIntegraCCCREDFINAN.AsString;
            if not(dtmEmptmo.qryParamIntegraCCUSTCREDFINAN.isNULL) then
               rParamIntegra.sCentroCustoCFinan   := dtmEmptmo.qryParamIntegraCCUSTCREDFINAN.AsString;
            if not(dtmEmptmo.qryParamIntegraSUBCCREDFINAN.isNULL) then
               rParamIntegra.iSubContaCFinan      := dtmEmptmo.qryParamIntegraSUBCCREDFINAN.AsInteger;
            if not(dtmEmptmo.qryParamIntegraRECPAGFOLHA.isNULL) then
               rParamIntegra.sRecPagFolha         := dtmEmptmo.qryParamIntegraRECPAGFOLHA.AsString;
            if not(dtmEmptmo.qryParamIntegraTIPORECDESFINAN.isNULL) then
               rParamIntegra.sTipoRecDesFinan     := dtmEmptmo.qryParamIntegraTIPORECDESFINAN.AsString;
            if not(dtmEmptmo.qryParamIntegraRECPAGFINAN.isNULL) then
               rParamIntegra.sRecPagFinan         := dtmEmptmo.qryParamIntegraRECPAGFINAN.AsString;
            if not(dtmEmptmo.qryParamIntegraUNIDNEGOC.isNULL) then
               rParamIntegra.iUnidNegoc           := dtmEmptmo.qryParamIntegraUNIDNEGOC.AsInteger;
            if not(dtmEmptmo.qryParamIntegraCODCENTRORESPON.isNULL) then
               rParamIntegra.sCentroRespon        := dtmEmptmo.qryParamIntegraCODCENTRORESPON.AsString;
            end
           else
           begin
//            FUNDO PERDIDO
              //William Moreira da Silva - SOL 226433 KINTANA 2060252
              rParamIntegra.iPlano := dtmEmptmo.qryParamIntegraPLANO.AsInteger;
            if not(dtmEmptmo.qryParamIntegraCCDEBFOLHARESULT.isNULL) then
               rParamIntegra.sContaDFolha         := dtmEmptmo.qryParamIntegraCCDEBFOLHARESULT.AsString;
            if not(dtmEmptmo.qryParamIntegraCCCREDFOLHARESULT.isNULL) then
               rParamIntegra.sContaCFolha         := dtmEmptmo.qryParamIntegraCCCREDFOLHARESULT.AsString;
            if not(dtmEmptmo.qryParamIntegraCCUSTDEBFOLHARESULT.isNULL) then
               rParamIntegra.sCentroCustoDFolha   := dtmEmptmo.qryParamIntegraCCUSTDEBFOLHARESULT.AsString;
            if not(dtmEmptmo.qryParamIntegraCCUSTCREDFOLHARESULT.isNULL) then
               rParamIntegra.sCentroCustoCFolha   := dtmEmptmo.qryParamIntegraCCUSTCREDFOLHARESULT.AsString;
            if not(dtmEmptmo.qryParamIntegraSUBCDEBFOLHARESULT.isNULL) then
               rParamIntegra.iSubContaDFolha      := dtmEmptmo.qryParamIntegraSUBCDEBFOLHARESULT.AsInteger;
            if not(dtmEmptmo.qryParamIntegraSUBCCREDFOLHARESULT.isNULL) then
               rParamIntegra.iSubContaCFolha      := dtmEmptmo.qryParamIntegraSUBCCREDFOLHARESULT.AsInteger;
            if not(dtmEmptmo.qryParamIntegraTIPORECDESFOLHARESULT.isNULL) then
               rParamIntegra.sTipoRecDesFolha     := dtmEmptmo.qryParamIntegraTIPORECDESFOLHARESULT.AsString;
            if not(dtmEmptmo.qryParamIntegraCCDEBFINAN.isNULL) then
               rParamIntegra.sContaDFinan         := dtmEmptmo.qryParamIntegraCCDEBFINAN.AsString;
            if not(dtmEmptmo.qryParamIntegraCCUSTDEBFINAN.isNULL) then
               rParamIntegra.sCentroCustoDFinan   := dtmEmptmo.qryParamIntegraCCUSTDEBFINAN.AsString;
            if not(dtmEmptmo.qryParamIntegraSUBCDEBFINAN.isNULL) then
               rParamIntegra.iSubContaDFinan      := dtmEmptmo.qryParamIntegraSUBCDEBFINAN.AsInteger;
            if not(dtmEmptmo.qryParamIntegraCCCREDFINAN.isNULL) then
               rParamIntegra.sContaCFinan         := dtmEmptmo.qryParamIntegraCCCREDFINAN.AsString;
            if not(dtmEmptmo.qryParamIntegraCCUSTCREDFINAN.isNULL) then
               rParamIntegra.sCentroCustoCFinan   := dtmEmptmo.qryParamIntegraCCUSTCREDFINAN.AsString;
            if not(dtmEmptmo.qryParamIntegraSUBCCREDFINAN.isNULL) then
               rParamIntegra.iSubContaCFinan      := dtmEmptmo.qryParamIntegraSUBCCREDFINAN.AsInteger;
            if not(dtmEmptmo.qryParamIntegraRECPAGFOLHA.isNULL) then
               rParamIntegra.sRecPagFolha         := dtmEmptmo.qryParamIntegraRECPAGFOLHA.AsString;
            if not(dtmEmptmo.qryParamIntegraTIPORECDESFINAN.isNULL) then
               rParamIntegra.sTipoRecDesFinan     := dtmEmptmo.qryParamIntegraTIPORECDESFINAN.AsString;
            if not(dtmEmptmo.qryParamIntegraRECPAGFINAN.isNULL) then
               rParamIntegra.sRecPagFinan         := dtmEmptmo.qryParamIntegraRECPAGFINAN.AsString;
            if not(dtmEmptmo.qryParamIntegraUNIDNEGOC.isNULL) then
               rParamIntegra.iUnidNegoc           := dtmEmptmo.qryParamIntegraUNIDNEGOC.AsInteger;
            if not(dtmEmptmo.qryParamIntegraCODCENTRORESPON.isNULL) then
               rParamIntegra.sCentroRespon        := dtmEmptmo.qryParamIntegraCODCENTRORESPON.AsString;
               end;
             end
         else
         begin
            // Erro: nenhum Padrão de Lançamento que atenda os parâmetros passados
          Result := -5;
         end;
        end;
   finally
      // fecha, obrigatoriamente, a tabela de parâmetros
      dtmEmptmo.qryParamIntegra.Close;
   end;
end;



function TIntegraEmptmo.LancamentoContabil(var   rParamContabeis : TParamIntegra;
                                                 sDebCre         : String;
                                                 sHistorico      : String;
                                           const bMostraMsg      : Boolean;
                                           var   iPlanilha       : Integer;
                                           var   sMensContab     : String
                                          ): Boolean;
var
   bJunta                  : Boolean;
   sTipoLanc               : Char; //String;
   sContaD, sContaC        : String;
   sCCustoD, sCCustoC      : String;
   sSContaD, sSContaC      : String;
   sHist1, sHist2, sHist3  : String; // histórico-padrão contábil
   sHist4, sHist5          : String; // histórico-padrão contábil
   sPlanPrev, sPatro       : String;
begin
   Result := False;

   // Histórico do lançamento ----------------------------------------------------------------------
   sPlanPrev := '';
   sPatro    := '';

   try
      with dtmIntegraEmptmo.qryBuscaPlano do
      begin
         LimpaParametros(dtmIntegraEmptmo.qryBuscaPlano);
         ParamByName('PIDPLANOPREV').AsInteger := rParamContabeis.iPlanPrevContab;
         Open;

         if not(isEmpty) then sPlanPrev := dtmIntegraEmptmo.qryBuscaPlanoNOME.AsString;
         Close;
      end;
   except
   end;

   try
      with dtmIntegraEmptmo.qryBuscaPATRO do
      begin
         LimpaParametros(dtmIntegraEmptmo.qryBuscaPatro);
         ParamByName('PIDPESSOA').AsInteger := rParamContabeis.iPatro;
         Open;

         if not(isEmpty) then sPatro := dtmIntegraEmptmo.qryBuscaPatroNOME.AsString;
         Close;
      end;
   except
   end;

   // ----------------------------------------------------------------------------------------------
   //    Preenchimento do Histórico (se for FUNCEF, grava também o nome do Item de empréstimo)
   // ----------------------------------------------------------------------------------------------
   sHistorico := sHistorico + ' - ';

   // André Pontes - 07/05/2004
   if length(trim(rParamContabeis.sItem)) > 0 then
   begin
      sHistorico := sHistorico + rParamContabeis.sItem + ' - ';
   end;
   // FIM André Pontes - 07/05/2004

   sHistorico := sHistorico + sPatro + ' / ' + sPlanPrev;

   FuncaoGeral.ArrumaHistorico(sHistorico, sHist1, sHist2, sHist3, sHist4, sHist5);
   // ----------------------------------------------------------------------------------------------

   // faz os ajustes necessários para (D)ébito ou (C)rédito
   case sDebCre[1] of

      'C':
      begin
         bJunta    := False;

         sTipoLanc := '1';
         sContaD   := '';
         sCCustoD  := '';
         sSContaD  := '';
         sContaC   := rParamContabeis.sContaContab;
         sCCustoC  := rParamContabeis.sCentroCustoContab;
         if rParamContabeis.iSubContaContab > 0 then sSContaC := IntToStr(rParamContabeis.iSubContaContab);
      end;

      'D':
      begin
         bJunta    := False;

         sTipoLanc := '0';
         sContaD   := rParamContabeis.sContaContab;
         sCCustoD  := rParamContabeis.sCentroCustoContab;
         if rParamContabeis.iSubContaContab > 0 then sSContaD := IntToStr(rParamContabeis.iSubContaContab);
         sCCustoC  := '';
         sContaC   := '';
         sSContaC  := '';
      end;

      'A':
      begin
         bJunta    := False;

         sDebCre   := 'D';

         sTipoLanc := '2';
         sContaD   := rParamContabeis.sContaContabDEB;
         sCCustoD  := rParamContabeis.sCentroCustoContabDEB;
         if rParamContabeis.iSubContaContabDEB > 0 then sSContaD := IntToStr(rParamContabeis.iSubContaContabDEB);
         sContaC   := rParamContabeis.sContaContabCRE;
         sCCustoC  := rParamContabeis.sCentroCustoContabCRE;
         if rParamContabeis.iSubContaContabCRE > 0 then sSContaC := IntToStr(rParamContabeis.iSubContaContabCRE);
      end;

   end;

// --------------------------------------------------------------------
//
//    Fazer, posteriormente, as verificações de PermiteSubConta
//    e ObrigaCentroCusto ???   -->  desempenho, redundância
//
// --------------------------------------------------------------------

   try
      //Pendência 24800 - 21/03/2007 - Alberto
      // TODO : aqui ocorre o insert na LANCAMENTO
      CtrlLancamento.InsereLancaContab ( sTipoLanc,
                                         Sistema.IDEmpresa,
                                         15, //Sistema.IDModulo,
                                         Sistema.IDUsuario,
                                         rParamContabeis.iPlano,
                                         rParamContabeis.iUnidNegoc,
                                         StrToIntDef(sSContaD, 0),
                                         StrToIntDef(sSContaC, 0),
                                         rParamContabeis.iPlanPrevContab,
                                         rParamContabeis.iPatro,
                                         iPlanilha, 0,
                                         FormatDateTime('dd/mm/yyyy', rParamContabeis.dDataLanc),
                                         '0', // NumDoc
                                         sHist1, sHist2, sHist3, sHist4, sHist5,
                                         rParamContabeis.sTipoPer,
                                         sCCustoD, sContaD,
                                         sCCustoC, sContaC, '',
                                         rParamContabeis.fVlrLanc, bJunta,
                                         Sistema.UsaPlanoPatro);

      if CtrlLancamento.RetornoPlnCodigo > 0 then
         iPlanilha := StrToInt(FloatToStr(CtrlLancamento.RetornoPlnCodigo));
      //Fim Pendência 24800

      if iPlanilha <= 0 then
      begin
         // integração com contabilidade falhou; exibe a mensagem de erro correspondente
      end;

   except
      // integração com contabilidade falhou; exibe a mensagem de erro correspondente
   end;

end;



procedure TIntegraEmptmo.LimpaParamIntegra(var rParamIntegra: TParamIntegra);
begin
   rParamIntegra.iHistorico            := -1;
   rParamIntegra.iContrato             := -1;
   rParamIntegra.iTipoContrato         := -1;
   rParamIntegra.iPlanoPrev            := -1;
   rParamIntegra.iPlanPrevContab       := -1;
   rParamIntegra.iPatro                := -1;
   rParamIntegra.iPessoa               := -1;

   rParamIntegra.iCodPortForma         := -1;
   rParamIntegra.iCodForma             := -1;

   rParamIntegra.iItem                 := -1;

   rParamIntegra.iPlano                := -1;

   rParamIntegra.sAnoMesCompetencia    := '';

   rParamIntegra.sContaDFolha          := '';
   rParamIntegra.sCentroCustoDFolha    := '';
   rParamIntegra.iSubContaDFolha       := -1;
   rParamIntegra.sContaCFolha          := '';
   rParamIntegra.iSubContaCFolha       := -1;
   rParamIntegra.sCentroCustoCFolha    := '';
   rParamIntegra.sContaDFinan          := '';
   rParamIntegra.sCentroCustoDFinan    := '';
   rParamIntegra.iSubContaDFinan       := -1;
   rParamIntegra.sContaCFinan          := '';
   rParamIntegra.iSubContaCFinan       := -1;
   rParamIntegra.sCentroCustoCFinan    := '';

   rParamIntegra.sContaContab          := '';
   rParamIntegra.sCentroCustoContab    := '';
   rParamIntegra.iSubContaContab       := -1;

   rParamIntegra.sContaContabDEB       := '';
   rParamIntegra.sCentroCustoContabDEB := '';
   rParamIntegra.iSubContaContabDEB    := -1;
   rParamIntegra.sContaContabCRE       := '';
   rParamIntegra.sCentroCustoContabCRE := '';
   rParamIntegra.iSubContaContabCRE    := -1;

   rParamIntegra.iExercicio            := -1;
   rParamIntegra.iPeriodo              := -1;

   rParamIntegra.sTipoPer              := '';
   rParamIntegra.iTipoDoc              := -1;
   rParamIntegra.sRecPag               := '';
   rParamIntegra.sCCBaixa              := '';

   rParamIntegra.sTipoRecDesFolha      := '';
   rParamIntegra.sRecPagFolha          := '';
   rParamIntegra.sTipoRecDesFinan      := '';
   rParamIntegra.sRecPagFinan          := '';
   rParamIntegra.sFormaEnvio           := '';

   rParamIntegra.iUnidNegoc            := -1;
   rParamIntegra.sCentroRespon         := '';
   rParamIntegra.sDescricao            := '';

   rParamIntegra.iMoeda                := -1;
   rParamIntegra.fVlrLanc              := 0;

   rParamIntegra.dDataLanc             := -1;
   rParamIntegra.dDataVenc             := -1;

   rParamIntegra.iPlanilha             := -1;
   rParamIntegra.iRateioDocum          := -1;
   rParamIntegra.iLanctoDocum          := -1;

   rParamIntegra.sDebCre               := '';
   rParamIntegra.bEmisBloq             := False;
   rParamIntegra.fNumDocumento         := 0;
end;



procedure TIntegraEmptmo.CriaTabelaPDX(const sTabela: String; var T: TTable);
begin
   T              := TTable.Create(Application);
   T.Active       := False;
  //Jéssica Lana SOL 114575 24/04/2009
  //T.DataBaseName := copy(Sistema.Tempdir, 1, length(Sistema.Tempdir) - 1);
  // T.DataBaseName := copy(ftempregra + '\', 1, length(ftempregra) - 1);
   T.DataBaseName := ftempregra;
   T.TableType    := ttParadox;
   T.TableName    := sTabela;
end;



function TIntegraEmptmo.DefineEstruturaTabelaPDX(var T: TTable): Boolean;
begin
   Result := True;

   if not T.Exists then
   begin
      try
         // define a estrutura da tabela
         if T.Active then
            T.close ;
         T.FieldDefs.Clear;
         T.FieldDefs.Add('IDHISTMOVEMPTMO',     ftFloat,     0, False);
         T.FieldDefs.Add('HMEVLRPREVISTO',      ftFloat,     0, False);
         T.FieldDefs.Add('DATALANCTO',          ftDate,      0, False);
         T.FieldDefs.Add('IDPATRO',             ftInteger,   0, False);
         T.FieldDefs.Add('IDPLANOPREV',         ftInteger,   0, False);
         T.FieldDefs.Add('IDPLANOPREVCONTAB',   ftInteger,   0, False);
         T.FieldDefs.Add('IDEMPRESA',           ftInteger,   0, False);
         T.FieldDefs.Add('PLANO',               ftInteger,   0, False);
         T.FieldDefs.Add('CCDEB',               ftString,   18, False);
         T.FieldDefs.Add('CCCRED',              ftString,   18, False);
         T.FieldDefs.Add('SUBCDEB',             ftInteger,   0, False);
         T.FieldDefs.Add('SUBCCRED',            ftInteger,   0, False);
         T.FieldDefs.Add('CCUSTDEB',            ftString,   10, False);
         T.FieldDefs.Add('CCUSTCRED',           ftString,   10, False);
         T.FieldDefs.Add('UNIDNEGOC',           ftInteger,   0, False);
         T.FieldDefs.Add('TIPCODIGO',           ftString,    2, False);
         T.FieldDefs.Add('EXERCICIO',           ftInteger,   0, False);
         T.FieldDefs.Add('PERIODO',             ftInteger,   0, False);
         T.FieldDefs.Add('ITCPRIORIDADE',       ftInteger,   0, False);

         // André Pontes - 07/05/2004
         T.FieldDefs.Add('ITEDESCRICAO',        ftString,   60, False);
         // FIM André Pontes - 07/05/2004

         // André Pontes - 17/03/2005
         T.FieldDefs.Add('IDITEMEMPTMO',        ftInteger,   0, False);
         T.FieldDefs.Add('IDTIPOCONTREMPTMO',   ftInteger,   0, False);
         // FIM André Pontes - 17/03/2005

         T.IndexDefs.Clear;   // Limpando indices
         // cria efetivamente a tabela
         T.CreateTable;
        // T.Open;

      except
         Result := False;
      end; // try..except

   end; // if
end;



function TIntegraEmptmo.DefineEstruturaTabelaPDXRateio(var T: TTable): Boolean;
begin
   Result := True;

   if not T.Exists then
   begin
      try
         // define a estrutura da tabela
         T.FieldDefs.Clear;

         T.FieldDefs.Add('CODDOCUMENTO',     ftFloat,    0, False);
         T.FieldDefs.Add('TIPODESEMB',       ftString,  15, False);
         T.FieldDefs.Add('RECPAG',           ftString,   1, False);
         T.FieldDefs.Add('CENTRORESPON',     ftString,  10, False);
         T.FieldDefs.Add('VALOR',            ftFloat,    0, False);
         T.FieldDefs.Add('UNIDNEGOC',        ftInteger,  0, False);
         T.FieldDefs.Add('IDPATRO',          ftInteger,  0, False);
         T.FieldDefs.Add('IDPLANOPREVCONTAB',ftInteger,  0, False);

         // cria efetivamente a tabela
         T.CreateTable;
         T.Open;

      except
         Result := False;
      end; // try..except

   end; // if
end;



function TIntegraEmptmo.ExcluiTabelaPDX(const sTabela: String; var T: TTable): Boolean;
begin
   Result := True;

   try
      //Jéssica Lana SOL 114575 24/04/2009
      //if FileExists(Sistema.TempDir + sTabela) then
        if FileExists(ftempregra + '\' + sTabela) then
      begin
         // exclui a tabela
         //Result := DeleteFile(Sistema.TempDir + sTabela);
           Result := DeleteFile(ftempregra + '\' + sTabela);
      end;

   except
      Result := False;
   end;
end;



procedure TIntegraEmptmo.GravaItemPDX(const sOrigemContab   : String;
                                      const sTipoContab     : String;
                                      var   T               : TTable;
                                      var   rParamIntegra   : TParamIntegra;
                                      const dDataLanc       : TDateTime;
                                      const iExercicio      : Integer;
                                      const iPeriodo        : Integer
                                     );
begin
   if abs(rParamIntegra.fVlrLanc) > 0 then
   begin
      T.Append;

      T.FieldByName('IDHISTMOVEMPTMO').AsFloat        := rParamIntegra.iHistorico;
      T.FieldByName('DATALANCTO').AsDateTime          := dDataLanc;
      //T.FieldByName('HMEVLRPREVISTO').AsFloat         := abs(rParamIntegra.fVlrLanc); // SOL 174494 KINTANA 1576368 retirado o ABS
      T.FieldByName('HMEVLRPREVISTO').AsFloat         := rParamIntegra.fVlrLanc;       // SOL 174494 KINTANA 1576368 nova linha sem o ABS
      T.FieldByName('IDPATRO').AsInteger              := rParamIntegra.iPatro;
      T.FieldByName('IDPLANOPREVCONTAB').AsInteger    := rParamIntegra.iPlanPrevContab;
      T.FieldByName('IDEMPRESA').AsInteger            := Sistema.IDEmpresa;
      T.FieldByName('PLANO').AsInteger                := rParamIntegra.iPlano;
      T.FieldByName('UNIDNEGOC').AsInteger            := rParamIntegra.iUnidNegoc;
      T.FieldByName('TIPCODIGO').AsString             := rParamIntegra.sTipoPer;
      T.FieldByName('EXERCICIO').AsInteger            := iExercicio;
      T.FieldByName('PERIODO').AsInteger              := iPeriodo;

      // André Pontes - 07/05/2004 (19/12/2005 - REFER também...)
      if ( (Sistema.TipoCliente = 19971) or (Sistema.TipoCliente = 19991) ) then
      begin
         T.FieldByName('ITEDESCRICAO').AsString       := rParamIntegra.sItem;
      end;
      // FIM André Pontes - 07/05/2004

      // André Pontes - 07/05/2004
      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
      begin
         T.FieldByName('IDITEMEMPTMO').AsInteger      := rParamIntegra.iItem;
         T.FieldByName('IDTIPOCONTREMPTMO').AsInteger := rParamIntegra.iTipoContrato;
      end;
      // FIM André Pontes - 07/05/2004

      if sOrigemContab = 'C' then
      begin
         // se o valor for negativo ou se for estorno, inverte as contas e etc de débito/crédito
         //   se os for negativo E se for estorno, não faz nada
         if ( ((sTipoContab = 'A') or (sTipoContab = 'E')) xor (Abs(rParamIntegra.fVlrLanc) < 0) ) then  // SOL 174494 KINTANA 1576368
         begin
            T.FieldByName('CCDEB').AsString           := rParamIntegra.sContaCFinan;
            T.FieldByName('CCCRED').AsString          := rParamIntegra.sContaDFinan;

            if rParamIntegra.iSubContaDFinan > 0 then       T.FieldByName('SUBCDEB').AsInteger  := rParamIntegra.iSubContaCFinan;
            if rParamIntegra.iSubContaCFinan > 0 then       T.FieldByName('SUBCCRED').AsInteger := rParamIntegra.iSubContaDFinan;
            if rParamIntegra.sCentroCustoDFinan <> '' then  T.FieldByName('CCUSTDEB').AsString  := rParamIntegra.sCentroCustoCFinan;
            if rParamIntegra.sCentroCustoCFinan <> '' then  T.FieldByName('CCUSTCRED').AsString := rParamIntegra.sCentroCustoDFinan;
         end
         else
         begin
            T.FieldByName('CCDEB').AsString           := rParamIntegra.sContaDFinan;
            T.FieldByName('CCCRED').AsString          := rParamIntegra.sContaCFinan;

            if rParamIntegra.iSubContaDFinan > 0 then       T.FieldByName('SUBCDEB').AsInteger  := rParamIntegra.iSubContaDFinan;
            if rParamIntegra.iSubContaCFinan > 0 then       T.FieldByName('SUBCCRED').AsInteger := rParamIntegra.iSubContaCFinan;
            if rParamIntegra.sCentroCustoDFinan <> '' then  T.FieldByName('CCUSTDEB').AsString  := rParamIntegra.sCentroCustoDFinan;
            if rParamIntegra.sCentroCustoCFinan <> '' then  T.FieldByName('CCUSTCRED').AsString := rParamIntegra.sCentroCustoCFinan;
         end;
      end
      else  // if sOrigemContab = 'F'
      begin
         // se o valor for negativo ou se for estorno, inverte as contas e etc de débito/crédito
         //   se os for negativo E se for estorno, não faz nada
         if ( ((sTipoContab = 'A') or (sTipoContab = 'E')) xor (Abs(rParamIntegra.fVlrLanc) < 0) ) then  // SOL 174494 KINTANA 1576368
         begin
            T.FieldByName('CCDEB').AsString           := rParamIntegra.sContaCFolha;
            T.FieldByName('CCCRED').AsString          := rParamIntegra.sContaDFolha;

            if rParamIntegra.iSubContaDFolha > 0 then       T.FieldByName('SUBCDEB').AsInteger  := rParamIntegra.iSubContaCFolha;
            if rParamIntegra.iSubContaCFolha > 0 then       T.FieldByName('SUBCCRED').AsInteger := rParamIntegra.iSubContaDFolha;
            if rParamIntegra.sCentroCustoDFolha <> '' then  T.FieldByName('CCUSTDEB').AsString  := rParamIntegra.sCentroCustoCFolha;
            if rParamIntegra.sCentroCustoCFolha <> '' then  T.FieldByName('CCUSTCRED').AsString := rParamIntegra.sCentroCustoDFolha;
         end
         else
         begin
            T.FieldByName('CCDEB').AsString           := rParamIntegra.sContaDFolha;
            T.FieldByName('CCCRED').AsString          := rParamIntegra.sContaCFolha;

            if rParamIntegra.iSubContaDFolha > 0 then       T.FieldByName('SUBCDEB').AsInteger  := rParamIntegra.iSubContaDFolha;
            if rParamIntegra.iSubContaCFolha > 0 then       T.FieldByName('SUBCCRED').AsInteger := rParamIntegra.iSubContaCFolha;
            if rParamIntegra.sCentroCustoDFolha <> '' then  T.FieldByName('CCUSTDEB').AsString  := rParamIntegra.sCentroCustoDFolha;
            if rParamIntegra.sCentroCustoCFolha <> '' then  T.FieldByName('CCUSTCRED').AsString := rParamIntegra.sCentroCustoCFolha;
         end;
      end;  // if sOrigemContab

      T.Post;
   end;
end;



procedure TIntegraEmptmo.GravaItemPDXRateio(const fCodDocumento   : Extended;
                                            var   rParamIntegra   : TParamIntegra;
                                            var   T               : TTable
                                           );
var
   sTipoRecDes : String;
begin
   if rParamIntegra.sTipoRecDesFolha <> '' then
   begin
      sTipoRecDes := rParamIntegra.sTipoRecDesFolha;
   end
   else
   begin
      sTipoRecDes := rParamIntegra.sTipoRecDesFinan;
   end;

   T.Append;

   T.FieldByName('CODDOCUMENTO').AsFloat        := fCodDocumento;
   T.FieldByName('RECPAG').AsString             := rParamIntegra.sRecPag;
   T.FieldByName('CENTRORESPON').AsString       := rParamIntegra.sCentroRespon;
   T.FieldByName('VALOR').AsFloat               := rParamIntegra.fVlrLanc;
   T.FieldByName('UNIDNEGOC').AsInteger         := rParamIntegra.iUnidNegoc;
   T.FieldByName('IDPATRO').AsInteger           := rParamIntegra.iPatro;
   T.FieldByName('IDPLANOPREVCONTAB').AsInteger := rParamIntegra.iPlanPrevContab;
   T.FieldByName('TIPODESEMB').AsString         := sTipoRecDes;

   T.Post;
end;



function TIntegraEmptmo.ConsolidaContabiliza(const sHistorico: String): Int64;
var
   qryConsolida      : TwwQuery;
   qryAux            : TwwQuery;
   iPlanilha         : Integer;

   bPartidaDobrada   : Boolean;

   rParamContabeis   : TParamIntegra;
   sSQL              : String;
   sMensagemContab   : String;
begin
   try

      qryConsolida               := TwwQuery.Create(Application);
      //Jéssica Lana SOL 114575 24/04/2009
      //qryConsolida.DataBaseName  := copy(Sistema.TempDir, 1, length(Sistema.TempDir) - 1);
      //qryConsolida.DataBaseName  := copy(ftempregra + '\' , 1, length(ftempregra) - 1);
        qryConsolida.DataBaseName  := ftempregra;
      qryAux                     := TwwQuery.Create(Application);
      qryAux.DataBaseName        := 'BASEDADOS';

      try
         bPartidaDobrada := False;
         try
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Text := 'SELECT PACDOBRADA FROM PARAMCONTAB ';
            qryAux.Open;

            bPartidaDobrada := (qryAux.FieldByName('PACDOBRADA').AsString = 'S');
         except
            //
         end;

      finally
         qryAux.Close;
         qryAux.SQL.Clear;
      end;


      // 'inicializa' a Planilha e a mensagem da LancaContab
      iPlanilha         := 0;
      sMensagemContab   := '';

      if (bPartidaDobrada) or ( not(bPartidaDobrada) and (dtmemptmo.qryParamEmptmoFLGPARTIDADOBRADA.AsInteger = 1) ) then
      begin
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         //    PARTIDA DOBRADA
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------

         sSQL :=
         'SELECT '                                             + #13 +
         '  SUM(HMEVLRPREVISTO) AS VLR_LANC, '                 + #13 +
         '  ITEDESCRICAO, '                                    + #13 +
         '  PLANO, DATALANCTO, IDPATRO, IDPLANOPREVCONTAB, '   + #13 +
         '  CCCRED, SUBCCRED, CCUSTCRED, '                     + #13 +
         '  CCDEB, SUBCDEB, CCUSTDEB, '                        + #13 +
         '  UNIDNEGOC, TIPCODIGO, '                            + #13 +
         '  EXERCICIO, PERIODO '                               + #13 +
         'FROM '                                               + #13 +
         '  "CCEMPTMO.DB" CCEMPTO '                            + #13 +
         'GROUP BY '                                           + #13 +
         '  ITEDESCRICAO, '                                    + #13 +
         '  PLANO, DATALANCTO, IDPATRO, IDPLANOPREVCONTAB, '   + #13 +
         '  CCCRED, SUBCCRED, CCUSTCRED, '                     + #13 +
         '  CCDEB, SUBCDEB, CCUSTDEB, '                        + #13 +
         '  UNIDNEGOC, TIPCODIGO, '                            + #13 +
         '  EXERCICIO, PERIODO ';

         qryConsolida.Close;
         qryConsolida.SQL.Text := sSql;

         try
            qryConsolida.Open;

            // executa todos os lançamentos
            with qryConsolida do
            begin
               First;
               while not(EOF) do
               begin
                  LimpaParamIntegra(rParamContabeis);

                  rParamContabeis.iPatro                 := qryConsolida.FieldByName('IDPATRO').AsInteger;
                  rParamContabeis.iPlanPrevContab        := qryConsolida.FieldByName('IDPLANOPREVCONTAB').AsInteger;

                  rParamContabeis.iPlano                 := qryConsolida.FieldByName('PLANO').AsInteger;

                  rParamContabeis.sContaContabDEB        := qryConsolida.FieldByName('CCDEB').AsString;
                  rParamContabeis.sCentroCustoContabDEB  := qryConsolida.FieldByName('CCUSTDEB').AsString;
                  rParamContabeis.iSubContaContabDEB     := qryConsolida.FieldByName('SUBCDEB').AsInteger;

                  rParamContabeis.sContaContabCRE        := qryConsolida.FieldByName('CCCRED').AsString;
                  rParamContabeis.sCentroCustoContabCRE  := qryConsolida.FieldByName('CCUSTCRED').AsString;
                  rParamContabeis.iSubContaContabCRE     := qryConsolida.FieldByName('SUBCCRED').AsInteger;

                  rParamContabeis.sTipoPer               := qryConsolida.FieldByName('TIPCODIGO').AsString;

                  rParamContabeis.iUnidNegoc             := qryConsolida.FieldByName('UNIDNEGOC').AsInteger;

                  rParamContabeis.fVlrLanc               := qryConsolida.FieldByName('VLR_LANC').AsFloat;

                  rParamContabeis.dDataLanc              := qryConsolida.FieldByName('DATALANCTO').AsDateTime;
                  rParamContabeis.iExercicio             := qryConsolida.FieldByName('EXERCICIO').AsInteger;
                  rParamContabeis.iPeriodo               := qryConsolida.FieldByName('PERIODO').AsInteger;

                  rParamContabeis.sItem                  := qryConsolida.FieldByName('ITEDESCRICAO').AsString;

                  // Passa os parâmtros para a função que vai fazer os últimos ajustes
                  //   e chamar a LancaContab
                  LancamentoContabil(rParamContabeis,
                                     'A',
                                     sHistorico,
                                     False,
                                     iPlanilha,
                                     sMensagemContab
                                    );

                  Next;
               end;  // while

            end;  // with

            Result := iPlanilha;

         except
            Result := -1;
         end;
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         //    FIM PARTIDA DOBRADA
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------

      end
      else
      begin

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         //    PARTIDA SIMPLES
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         //    Lançamento a Débito
         // ----------------------------------------------------------------------------------------

         // agrupa os lançamentos a débito
         sSQL :=
         'SELECT '                                             + #13 +
         '  SUM(HMEVLRPREVISTO) AS VLR_LANC, '                 + #13 +
         '  ITEDESCRICAO, '                                    + #13 +
         '  PLANO, DATALANCTO, IDPATRO, IDPLANOPREVCONTAB, '   + #13 +
         '  CCDEB, SUBCDEB, CCUSTDEB, UNIDNEGOC, TIPCODIGO, '  + #13 +
         '  EXERCICIO, PERIODO '                               + #13 +
         'FROM '                                               + #13 +
         '  "CCEMPTMO.DB" CCEMPTO '                            + #13 +
         'GROUP BY '                                           + #13 +
         '  ITEDESCRICAO, '                                    + #13 +
         '  PLANO, DATALANCTO, IDPATRO, IDPLANOPREVCONTAB, '   + #13 +
         '  CCDEB, SUBCDEB, CCUSTDEB, UNIDNEGOC, TIPCODIGO, '  + #13 +
         '  EXERCICIO, PERIODO ';

         qryConsolida.Close;
         qryConsolida.SQL.Text := sSql;

         try
            qryConsolida.Open;

            // executa todos os lançamentos a débito
            with qryConsolida do
            begin
               First;
               while not(EOF) do
               begin
                  // limpa o record de parâmetros
                  LimpaParamIntegra(rParamContabeis);

                  // monta o record de parâmetros
                  rParamContabeis.iPatro                 := qryConsolida.FieldByName('IDPATRO').AsInteger;
                  rParamContabeis.iPlanPrevContab        := qryConsolida.FieldByName('IDPLANOPREVCONTAB').AsInteger;

                  rParamContabeis.iPlano                 := qryConsolida.FieldByName('PLANO').AsInteger;

                  rParamContabeis.sContaContab           := qryConsolida.FieldByName('CCDEB').AsString;
                  rParamContabeis.sCentroCustoContab     := qryConsolida.FieldByName('CCUSTDEB').AsString;
                  rParamContabeis.iSubContaContab        := qryConsolida.FieldByName('SUBCDEB').AsInteger;

                  rParamContabeis.sTipoPer               := qryConsolida.FieldByName('TIPCODIGO').AsString;

                  rParamContabeis.iUnidNegoc             := qryConsolida.FieldByName('UNIDNEGOC').AsInteger;

                  rParamContabeis.fVlrLanc               := qryConsolida.FieldByName('VLR_LANC').AsFloat;

                  rParamContabeis.dDataLanc              := qryConsolida.FieldByName('DATALANCTO').AsDateTime;
                  rParamContabeis.iExercicio             := qryConsolida.FieldByName('EXERCICIO').AsInteger;
                  rParamContabeis.iPeriodo               := qryConsolida.FieldByName('PERIODO').AsInteger;

                  rParamContabeis.sItem                  := qryConsolida.FieldByName('ITEDESCRICAO').AsString;

                  // Passa os parâmtros para a função que vai fazer os últimos ajustes
                  //   e chamar a LancaContab
                  LancamentoContabil(rParamContabeis,
                                     'D',
                                     sHistorico,
                                     False,
                                     iPlanilha,
                                     sMensagemContab
                                    );

                  Next;
               end;  // while

            end;  // with

            Result := iPlanilha;

         except
            Result := -1;
         end;

         // ----------------------------------------------------------------------------------------
         //    Lançamento a Crédito
         // ----------------------------------------------------------------------------------------

         // se foi feita a contabilização do débito corretamente...
         if Result > 0 then
         begin
            // agrupa os lançamentos a crédito
            sSQL :=
            'SELECT '                                                + #13 +
            '  SUM(HMEVLRPREVISTO) AS VLR_LANC, '                    + #13 +
            '  ITEDESCRICAO, '                                       + #13 +
            '  PLANO, DATALANCTO, IDPATRO, IDPLANOPREVCONTAB, '      + #13 +
            '  CCCRED, SUBCCRED, CCUSTCRED, UNIDNEGOC, TIPCODIGO, '  + #13 +
            '  EXERCICIO, PERIODO '                                  + #13 +
            'FROM '                                                  + #13 +
            '  "CCEMPTMO.DB" CCEMPTO '                               + #13 +
            'GROUP BY '                                              + #13 +
            '  ITEDESCRICAO, '                                       + #13 +
            '  PLANO, DATALANCTO, IDPATRO, IDPLANOPREVCONTAB, '      + #13 +
            '  CCCRED, SUBCCRED, CCUSTCRED, UNIDNEGOC, TIPCODIGO, '  + #13 +
            '  EXERCICIO, PERIODO ';

            qryConsolida.Close;
            qryConsolida.SQL.Text := sSql;

            try
               qryConsolida.Open;

               // executa todos os lançamentos a crédito
               with qryConsolida do
               begin
                  First;
                  while not(EOF) do
                  begin
                     // monta o record de parâmetros
                     LimpaParamIntegra(rParamContabeis);

                     // monta o record de parâmetros
                     rParamContabeis.iPatro                := qryConsolida.FieldByName('IDPATRO').AsInteger;
                     rParamContabeis.iPlanPrevContab       := qryConsolida.FieldByName('IDPLANOPREVCONTAB').AsInteger;

                     rParamContabeis.iPlano                := qryConsolida.FieldByName('PLANO').AsInteger;

                     rParamContabeis.sContaContab          := qryConsolida.FieldByName('CCCRED').AsString;
                     rParamContabeis.sCentroCustoContab    := qryConsolida.FieldByName('CCUSTCRED').AsString;
                     rParamContabeis.iSubContaContab       := qryConsolida.FieldByName('SUBCCRED').AsInteger;

                     rParamContabeis.sTipoPer              := qryConsolida.FieldByName('TIPCODIGO').AsString;

                     rParamContabeis.iUnidNegoc            := qryConsolida.FieldByName('UNIDNEGOC').AsInteger;

                     rParamContabeis.fVlrLanc              := qryConsolida.FieldByName('VLR_LANC').AsFloat;

                     rParamContabeis.dDataLanc             := qryConsolida.FieldByName('DATALANCTO').AsDateTime;
                     rParamContabeis.iExercicio            := qryConsolida.FieldByName('EXERCICIO').AsInteger;
                     rParamContabeis.iPeriodo              := qryConsolida.FieldByName('PERIODO').AsInteger;

                     rParamContabeis.sItem                 := qryConsolida.FieldByName('ITEDESCRICAO').AsString;

                     // Passa os parâmtros para a função que vai fazer os últimos ajustes e chamar a LancaContab
                     LancamentoContabil(rParamContabeis,
                                        'C',
                                        sHistorico,
                                        False,
                                        iPlanilha,
                                        sMensagemContab
                                       );

                     Next;
                  end;
               end;

               Result := iPlanilha;

           except
              Result := -2;
           end;

         end;
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         //    FIM PARTIDA SIMPLES
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
      end;

   finally
      qryAux.Free;
      qryConsolida.Free;
   end;
end;



function TIntegraEmptmo.AtualizaHistoricoComFlgEnvio(const IDHistMovEmptmo : Extended;
                                                     const IDTMPDESC       : Extended;
                                                     var   sErro           : TStringList
                                                    ): Boolean;
begin
   // Retorno da Função
   Result := True;

   try
      with dtmIntegraEmptmo.qryUpdateFlgEnvio do
      begin
         LimpaParametros(dtmIntegraEmptmo.qryUpdateFlgEnvio);
         ParamByName('PIDHISTMOVEMPTMO').AsFloat   := IDHistMovEmptmo;
         ParamByName('PIDTMPDESC').AsFloat         := IDTMPDESC;
         ExecSQL;
      end;

   except

      on E:Exception do
      begin
         sErro.Add(E.Message);
         Result := False;
      end;

   end;
end;



function TIntegraEmptmo.AtualizaHistoricoComDocumento(const rParam: TParamIntegra; var sErro: TStringList): Boolean;
var
   rLogTotalPrev : TLogTotalPrev;
begin
   // Retorno da Função

   Result := True;
   try

      with dtmIntegraEmptmo.qryUpdateDocumento do
      begin
         LimpaParametros(dtmIntegraEmptmo.qryUpdateDocumento);

         ParamByName('PCODDOCUMENTO').AsInteger    := rParam.iDocumento;
         ParamByName('PIDHISTMOVEMPTMO').AsFloat   := rParam.iHistorico;

         ExecSQL;
      end;

      // -------------------------------------------------------------------------------------------
      // André Pontes - 19/01/2006 - LogDocumento - OK

      LimpaRegistroLog(rLogTotalPrev);

      rLogTotalPrev.IDModulo   := Sistema.IDModulo;
      rLogTotalPrev.IDContrato := -1;
      rLogTotalPrev.IDHistMov  := rParam.iHistorico;
      rLogTotalPrev.CodPlanDoc := rParam.iDocumento;
      rLogTotalPrev.Origem     := -1;
      rLogTotalPrev.Operacao   := 'IntegraEmptmo.AtualizaHistoricoComDocumento';
      rLogTotalPrev.Data       := SysDate;
      rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
      rLogTotalPrev.Versao     := Sistema.Versao;

      GravaLogTotalPrev(rLogTotalPrev);

      // -------------------------------------------------------------------------------------------

   except

      on E:Exception do
      begin
         sErro.Add(E.Message);
         Result := False;
      end; // on

   end; // try..except
end;



procedure TIntegraEmptmo.GravaPlanilha(const iPlanilha   : Int64;
                                       const dDataLanc   : TDateTime;
                                       const sTipoContab : String = 'N';
                                       const bAtuDia     : Boolean = False
                                       );
var
   i              : Integer;
   TabelaPDX      : TTable;
   qryTrab        : TwwQuery;
   rLogTotalPrev  : TLogTotalPrev;
begin
   // prepara a criação da tabela
   TabelaPDX              := TTable.Create(Application);
   TabelaPDX.Active       := False;
 //Jéssica Lana SOL 114575 24/04/2009
 //TabelaPDX.DataBaseName := copy(Sistema.TempDir, 1, length(Sistema.TempDir) - 1);
 //TabelaPDX.DataBaseName := copy(ftempregra + '\', 1, length(ftempregra) - 1);
   TabelaPDX.DataBaseName := ftempregra;
   TabelaPDX.TableType    := ttParadox;
   TabelaPDX.TableName    := 'CCEMPTMO.DB';

   case sTipoContab[1] of
      'A': qryTrab := dtmIntegraEmptmo.qryUpdateAbonoContabil;    // Abono
      'E': qryTrab := dtmIntegraEmptmo.qryUpdateEstornoContabil;  // Estorno
      'N': qryTrab := dtmIntegraEmptmo.qryUpdatePlanilha;         // Normal
   end;

   try
      TabelaPDX.Open;

      i := 0;
      frmProgresso.MostraFormProgresso('Gravando nº da Planilha nos Itens Contabilizados...',
                                       True,
                                       False,
                                       True,
                                       0,
                                       TabelaPDX.RecordCount
                                      );

      TabelaPDX.First;
      while not(TabelaPDX.EOF) do
      begin
         inc(i);
         frmProgresso.AndaFormProgresso(i);

         with qryTrab do
         begin
            LimpaParametros(qryTrab);
            ParamByName('PIDHISTMOVEMPTMO').AsFloat      := TabelaPDX.FieldByName('IDHISTMOVEMPTMO').AsFloat;
            ParamByName('PPLNCODIGO').AsInteger          := iPlanilha;

            if sTipoContab = 'E' then ParamByName('PIDUSUARIOESTORNO').AsInteger    := Sistema.IDUsuario;
            if sTipoContab = 'E' then ParamByName('PHMEDATAESTORNO').AsDateTime     := dDataLanc;
            if sTipoContab = 'A' then ParamByName('PHMEDATAQUITABONO').AsDateTime   := dDataLanc;

            ExecSQL;
         end;

         // ----------------------------------------------------------------------------------------
         // André Pontes - 27/01/2006 - LogPlanilha - OK

         LimpaRegistroLog(rLogTotalPrev);

         rLogTotalPrev.IDModulo   := Sistema.IDModulo;
         rLogTotalPrev.IDContrato := -1;
         rLogTotalPrev.IDHistMov  := TabelaPDX.FieldByName('IDHISTMOVEMPTMO').AsFloat;
         rLogTotalPrev.CodPlanDoc := iPlanilha;
         rLogTotalPrev.Origem     := -1;
         rLogTotalPrev.Operacao   := 'GravaPlanilha (planilha estorno)';
         rLogTotalPrev.Data       := SysDate;
         rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
         rLogTotalPrev.Versao     := Sistema.Versao;

         GravaLogTotalPrev(rLogTotalPrev);

         // ----------------------------------------------------------------------------------------

         // André Pontes - 15/12/2004
         // Está demorando 7 horas na FUNCEF para fazer a contabilização da atualização diária
         // Foi criado esse bAtuDia para não gravar a planilha nos itens centralizadores para tentar
         // contornar o problema. Isso é um bacão, que está sendo necessário em função de outro baca
         // que é gravar o plncodigo no centralizador. O Marchetti não soube dizer exatamente por que
         // foi feito isso, mas parece que era para corrigir o fato do centralizador não estar sendo
         // marcado como estornado em algum desfazer. O correto seria passar a buscar o centralizador
         // no momento do desfazer, não aqui.
         if not(bAtuDia) then
         begin
            // gravar também a planilha nos itens centralizadores
            with dtmIntegraEmptmo.qryBuscaItemCentralizador do
            begin
               LimpaParametros(dtmIntegraEmptmo.qryBuscaItemCentralizador);
               ParamByName('PIDHISTMOVEMPTMO').AsFloat := TabelaPDX.FieldByName('IDHISTMOVEMPTMO').AsFloat;
               Open;

               if not(isEmpty) then
               begin
                  with qryTrab do
                  begin
                     LimpaParametros(qryTrab);
                     ParamByName('PIDHISTMOVEMPTMO').AsFloat      := dtmIntegraEmptmo.qryBuscaItemCentralizadorIDHISTMOVEMPTMO.AsFloat;
                     ParamByName('PPLNCODIGO').AsInteger          := iPlanilha;

                     if sTipoContab = 'E' then ParamByName('PIDUSUARIOESTORNO').AsInteger    := Sistema.IDUsuario;
                     if sTipoContab = 'E' then ParamByName('PHMEDATAESTORNO').AsDateTime     := dDataLanc;
                     if sTipoContab = 'A' then ParamByName('PHMEDATAQUITABONO').AsDateTime   := dDataLanc;

                     ExecSQL;
                  end;
               end; // if not(isEmpty)

               // ----------------------------------------------------------------------------------
               // André Pontes - 27/01/2006 - LogPlanilha - OK

               LimpaRegistroLog(rLogTotalPrev);

               rLogTotalPrev.IDModulo   := Sistema.IDModulo;
               rLogTotalPrev.IDContrato := -1;
               rLogTotalPrev.IDHistMov  := dtmIntegraEmptmo.qryBuscaItemCentralizadorIDHISTMOVEMPTMO.AsFloat;
               rLogTotalPrev.CodPlanDoc := iPlanilha;
               rLogTotalPrev.Origem     := -1;
               rLogTotalPrev.Operacao   := 'GravaPlanilha (planilha estorno - item centralizador)';
               rLogTotalPrev.Data       := SysDate;
               rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
               rLogTotalPrev.Versao     := Sistema.Versao;

               GravaLogTotalPrev(rLogTotalPrev);

               // ----------------------------------------------------------------------------------

               Close; // qryBuscaItemCentralizador
            end; // with dtmEmptmo.qryBuscaItemCentralizador
         end;

         TabelaPDX.Next;

      end; // while not(TabelaPDX.EOF)

   finally
      TabelaPDX.Close;

      frmProgresso.EscondeFormProgresso;

      if TabelaPDX <> nil then TabelaPDX.Free;
   end;
end;


procedure TIntegraEmptmo.GravaPlanilhaGrupo(const iPlanilha   : Int64;
                                            const dDataLanc   : TDateTime;
                                            const sTipoContab : String = 'N';
                                            const bAtuDia     : Boolean = False
                                            );
var
   i              : Integer;
   TabelaPDX      : TTable;
   qryTrab        : TwwQuery;
   rLogTotalPrev  : TLogTotalPrev;
   PR_GRAVA_PLANILHA_GRUPO: TStoredProc;
begin
   // prepara a criação da tabela
   TabelaPDX              := TTable.Create(Application);
   TabelaPDX.Active       := False;
 //Jéssica Lana SOL 114575 24/04/2009
 //TabelaPDX.DataBaseName := copy(Sistema.TempDir, 1, length(Sistema.TempDir) - 1);
 //TabelaPDX.DataBaseName := copy(ftempregra + '\', 1, length(ftempregra) - 1);
   TabelaPDX.DataBaseName := ftempregra;
   TabelaPDX.TableType    := ttParadox;
   TabelaPDX.TableName    := 'CCEMPTMO.DB';

   //William Moreira da Silva - SOL 253185 PPM 771995 - Início
   //case sTipoContab[1] of
     // 'A': qryTrab := dtmIntegraEmptmo.qryUpdateAbonoContabilGrupo;    // Abono
     //'E': qryTrab := dtmIntegraEmptmo.qryUpdateEstornoContabilGrupo;  // Estorno
     // 'N': qryTrab := dtmIntegraEmptmo.qryUpdatePlanilhaGrupo;         // Normal
   //end;
   //William Moreira da Silva - SOL 253185 PPM 771995 - FIM

   try
      TabelaPDX.Open;

      i := 0;
      frmProgresso.MostraFormProgresso('Gravando nº da Planilha Contábil no Histórico...',
                                       True,
                                       False,
                                       True,
                                       0,
                                       TabelaPDX.RecordCount
                                      );

      TabelaPDX.First;

      while not(TabelaPDX.EOF) do
      begin
         inc(i);
         frmProgresso.AndaFormProgresso(i);

         //William Moreira da Silva - SOL 253185 PPM 771995 - Início
               PR_GRAVA_PLANILHA_GRUPO                := TStoredProc.Create(Application);
               PR_GRAVA_PLANILHA_GRUPO.DataBaseName   := 'BaseDados';
               PR_GRAVA_PLANILHA_GRUPO.StoredProcName := 'CM.PCK_EMPRESTIMO."PR_GRAVA_PLANILHA_GRUPO"';

               PR_GRAVA_PLANILHA_GRUPO.Params.CreateParam(ftInteger, 'pPlnCodigo',  ptInput);
               PR_GRAVA_PLANILHA_GRUPO.Params.CreateParam(ftDate, 'pDataContab', ptInput);
               PR_GRAVA_PLANILHA_GRUPO.Params.CreateParam(ftInteger, 'pIditemEmptmo', ptInput);
               PR_GRAVA_PLANILHA_GRUPO.Params.CreateParam(ftInteger,  'pIdTipoContrEmptmo', ptInput);
               PR_GRAVA_PLANILHA_GRUPO.Params.CreateParam(ftInteger,  'pIdPatro',             ptInput);
               PR_GRAVA_PLANILHA_GRUPO.Params.CreateParam(ftString,  'pTipoContab',      ptInput);

               PR_GRAVA_PLANILHA_GRUPO.ParamByName('pPlnCodigo').AsInteger           := iPlanilha;
               PR_GRAVA_PLANILHA_GRUPO.ParamByName('pDataContab').AsDate      := dDataLanc;
               PR_GRAVA_PLANILHA_GRUPO.ParamByName('pIditemEmptmo').AsInteger         := TabelaPDX.FieldByName('IDITEMEMPTMO').AsInteger;
               PR_GRAVA_PLANILHA_GRUPO.ParamByName('pIdTipoContrEmptmo').AsInteger   := TabelaPDX.FieldByName('IDTIPOCONTREMPTMO').AsInteger;
               PR_GRAVA_PLANILHA_GRUPO.ParamByName('pIdPatro').AsInteger             := TabelaPDX.FieldByName('IDPATRO').AsInteger;
               PR_GRAVA_PLANILHA_GRUPO.ParamByName('pTipoContab').AsString  := sTipoContab;

               if not dtmBaseDados.dbBaseDados.InTransaction then
               begin
                  dtmBaseDados.dbBaseDados.StartTransaction;
               end;

                PR_GRAVA_PLANILHA_GRUPO.Prepare;
                PR_GRAVA_PLANILHA_GRUPO.Close;
                PR_GRAVA_PLANILHA_GRUPO.ExecProc;
                dtmBaseDados.dbBaseDados.Commit;

         {with qryTrab do
         begin
            LimpaParametros(qryTrab);

            ParamByName('PHMEDATAPREVISTA').AsDateTime   := dDataLanc;
            ParamByName('PIDITEMEMPTMO').AsInteger       := TabelaPDX.FieldByName('IDITEMEMPTMO').AsInteger;
            ParamByName('PIDPATRO').AsInteger            := TabelaPDX.FieldByName('IDPATRO').AsInteger;
            ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := TabelaPDX.FieldByName('IDTIPOCONTREMPTMO').AsInteger;

            ParamByName('PPLNCODIGO').AsInteger          := iPlanilha;

            //Substituido por procedure
            if sTipoContab = 'N' then ParamByName('PSTIPOCONTAB').AsString          := sTipoContab;

            if sTipoContab = 'A' then ParamByName('PIDUSUARIOESTORNO').AsInteger    := Sistema.IDUsuario;
            if sTipoContab = 'E' then ParamByName('PIDUSUARIOESTORNO').AsInteger    := Sistema.IDUsuario;
            if sTipoContab = 'E' then ParamByName('PHMEDATAESTORNO').AsDateTime     := dDataLanc;
            if sTipoContab = 'A' then ParamByName('PHMEDATAQUITABONO').AsDateTime   := dDataLanc;
            //William Moreira da Silva - SOL 253185 PPM 771995 - Fim

            qryTrab.Open;
         end;}

         // ----------------------------------------------------------------------------------------
         // André Pontes - 27/01/2006 - LogPlanilha - OK

         LimpaRegistroLog(rLogTotalPrev);

         rLogTotalPrev.IDModulo   := Sistema.IDModulo;
         rLogTotalPrev.IDContrato := -1;
         rLogTotalPrev.IDHistMov  := TabelaPDX.FieldByName('IDHISTMOVEMPTMO').AsFloat;
         rLogTotalPrev.CodPlanDoc := iPlanilha;
         rLogTotalPrev.Origem     := -1;
         rLogTotalPrev.Operacao   := 'GravaPlanilhaGrupo (planilha estorno)';
         rLogTotalPrev.Data       := SysDate;
         rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
         rLogTotalPrev.Versao     := Sistema.Versao;

         GravaLogTotalPrev(rLogTotalPrev);

         // ----------------------------------------------------------------------------------------

         TabelaPDX.Next;

      end; // while not(TabelaPDX.EOF)

   finally
      TabelaPDX.Close;

      frmProgresso.EscondeFormProgresso;

      if TabelaPDX <> nil then TabelaPDX.Free;
   end;
end;




(* -------------------------------------------------------------------------------------------------
   EnviaCAPCAR: Função que integra com CaP/CaR, em batch.
                Os itens a serem integrados são definidos pela query que será passada para a função

   -------------------------------------------------------------------------------------------------
   O SQL a ser passado deverá ser um SELECT na HistMovEmptmo, com as seguintes características
   obigatórias:

   SELECT
      H.IDHISTMOVEMPTMO             ID do Histórico
      H.IDCONTRATOEMPTMO            ID do Contrato
      TC.IDTIPOCONTREMPTMO          ID do Tipo de Contrato
      H.IDITEMEMPTMO                ID do Item a ser contabilizado
      C.IDPLANOPREV                 ID do Plano Previdencial
      C.IDPATRO                     ID da Patrocinadora
      H.HMEVLRPREVISTO              Valor a ser lançado
      H.HMEDATAPREVISTA             Data prevista para vencimento (original)
      H.HMEDATAVENCTO               Data prevista para vencimento (atualizada)

   WHERE
      TE.IDEMPRESAPROP =            Filtrar obrigatoriamente por Sistema.IDEmpresa

      H.HMEFORMACOBRANCA = 'C'      Apenas os itens que devem ser enviados para o CaP/CaR

      AND ((H.HMECENTRALIZA = 1)    Enviar apenas os itens que são totalizadores, ou
      OR  (H.HMEDESTACADO = 1))     os itens que são cobrados em destacado

   ORDER BY
      H.IDCONTRATOEMPTMO, HMEANOCOBRANCA, HMEMESCOBRANCA, "CONTABAIXA"

   -------------------------------------------------------------------------------------------------
   Parâmetros:

      sSQL           :  SQL que será usado para buscar os itens (ver acima)
      dDataLanc
      dDataVenc

      sResult        :  linhas "de acerto" que serão exibidas, se for o caso
      sErro          :  linhas "de erro" que serão exibidas, se for o caso

      sHistorico     :  Histórico-padrão a ser passado para a Contabilidade

   -------------------------------------------------------------------------------------------------
   Códigos de retorno (controle de erro):
       0 : Envio(s) realizados com sucesso
      -1 : ERRO ao tentar selecionar os itens a enviar ao CAP/CAR
      -2 : Query não retornou itens a Enviar
      -3 : ERRO ao inserir Documento
      -4 : ERRO no Rateio do Documento
      -5 : ERRO ao inserir Mensagens no Documento
      -6 : ERRO ao Lançar Documento
      -7 : ERRO ao Atualizar Histórico com o Documento
      -8 : Processo interrompido pelo usuário sem envio

----------------------------------------------------------------------------------------------------*)
function TIntegraEmptmo.EnviaCAPCAR(const sSQL           : String;
                                    const sHistorico     : String;
                                    const dDataLanc      : TDateTime;
                                    const iCodTipoDoc    : Integer;
                                    const iMoedaCorrente : Integer;
                                    const sCCusto        : String;
                                    const iPrograma      : Integer;
                                    var   iPlanilha      : Integer;
                                    var   sResult        : TStringList;
                                    var   sErro          : TStringList
                                   ): Integer;
var
   vContaBaixa       : Array of TContaBaixa;
   vHistDocumento    : Array of THistDocumento;

   dDataVenc         : TDateTime;
   fTotal 				: Currency;

   i, j, k, y, z, x  : Integer;
   iTipoMov          : Integer;
   iFloat            : Integer;

   iTipoDocRec			: Int64;
   iTipoDocPag			: Int64;
   qryItensCAPCAR		: TwwQuery;
   vMsgCnab  			: array[0..8] of string;
   fNovoSaldoDev     : Currency;

   sSQLUpdate        : String;
   sSQLEnvioSusp     : String;
   sMatricula        : String;
   sHistoricoAlt     : String;
   sFlgTipoDesc      : String;

   rParamAtual       : TParamIntegra;
   rParamAnterior    : TParamIntegra;

   CtrlDocumento     : TCtrlDocumento;

   rLogTotalPrev     : TLogTotalPrev;

   bIniciouTransacao : Boolean;
  iCommitedCount     : Integer;    // SOL:120615 - Daniel Begnami
begin
   Result            := 0;
   iCommitedCount    := 0;          // SOL:120615 - Daniel Begnami
   bIniciouTransacao := False;

   if ParametrosSistema then
   begin
      if not(dtmEmptmo.qryParamEmptmoTIPODOCPAG.IsNULL) then
      begin
         iTipoDocPag := dtmEmptmo.qryParamEmptmoTIPODOCPAG.AsInteger;
      end
      else
      begin
         iTipoDocPag := -1;
      end;

      if iCodTipoDoc = -1 then
      begin
         if not(dtmEmptmo.qryParamEmptmoTIPODOCREC.IsNULL) then
         begin
            iTipoDocRec := dtmEmptmo.qryParamEmptmoTIPODOCREC.AsInteger;
         end
         else
         begin
            iTipoDocRec := -1;
         end;
      end
      else
      begin
         iTipoDocRec := iCodTipoDoc;
      end;

   end
   else
   begin

      // A tabela Parâmetros do Sistema está vazia
      sErro.Add('ERRO nos Parâmetros do Sistema.');
      Result := -1; // ERRO ao abrir
      Exit;

   end; // if ParametrosSistema

   // ----------------------------------------------------------------------------------------------

   for j := 0 to 8 do vMsgCnab[j] := '';

   // ----------------------------------------------------------------------------------------------

   // cria as queries necessárias
   qryItensCAPCAR                := TwwQuery.Create(Application);
   qryItensCAPCAR.DatabaseName   := 'BaseDados';

   CtrlDocumento := TCtrlDocumento.Create;
   CtrlDocumento.Initialize(dtmBaseDados.dbBaseDados,
                            True,
                            Sistema.ConnectionType,
                            Sistema.ConnectionSide,
                            Sistema.AppRemoteServer,
                            True
                           );

   CtrlDocumento.OpenTransaction := False;

   try
      try
         MostraEspera('Selecionando Itens para Contas a Pagar/Receber...');

         try
            qryItensCAPCAR.SQL.Text := sSQL;
          //Jéssica Lana SOL 114575 24/04/2009
          //qryItensCAPCAR.SQL.SaveToFile(Sistema.TempDir + 'EP-ItensEnvioFinanceiro.txt');
            qryItensCAPCAR.SQL.SaveToFile(ftempregra + '\' + 'EP-ItensEnvioFinanceiro.txt');
            qryItensCAPCAR.Open;

         except
            on E:Exception do
            begin
               sErro.Add('[Financeiro] - ERRO ao tentar selecionar os registros para Envio');
               sErro.Add(E.Message);
               Result := -1; // ERRO ao abrir
               Exit;
            end;
         end;

      finally
         EscondeEspera;
      end;

      if qryItensCAPCAR.isEmpty then
      begin
         sErro.Add('Não existem registros para envio [CAPCAR] ');
         Result := -2;  // não há itens
         Exit;
      end;

      //edilaine - SIG62639 - inicio
      if (Pos('PERFILINVEST', qryItensCAPCAR.SQL.Text) > 0) then
      begin
        if not ValidaParamPerfilInvestimento(qryItensCAPCAR, sErro) then
        begin
          Result := -8;  // falta parametrização Perfil de Investimento
          Exit;
        end;
      end;
      //edilaine - SIG62639 - fim

      // -------------------------------------------------------------------------------------------

      SetLength(vHistDocumento, 0);

      // -------------------------------------------------------------------------------------------

      // tendo conseguido, começa a iterar pela query
      with qryItensCAPCAR do
      begin
         First;
         i := 0;
         j := 0;

         frmProgresso.MostraFormProgresso('Enviando Itens para Contas a Pagar/Receber...',
                                          True,
                                          True,
                                          True,
                                          i,
                                          qryItensCAPCAR.RecordCount
                                         );

         dDataVenc   := qryItensCAPCAR.FieldByName('HMEDATAVENCTO').AsDateTime;
         iTipoMov    := qryItensCAPCAR.FieldByName('HMETIPOMOV').AsInteger;

        { case iTipoMov of
            2: sHistoricoAlt  := 'Amortização de Empréstimos - Contrato: ' + FieldByName('IDCONTRATOEMPTMO').AsString; // SOL 195538 KTN 1917765 Otacilio
            3: sHistoricoAlt  := 'Quitação de Empréstimos - Contrato: ' + FieldByName('IDCONTRATOEMPTMO').AsString;  // SOL 195538 KTN 1917765 Otacilio
         else
            //BRUNO AZEVEDO SOL 200924 KINTANA 1958353
            //sHistoricoAlt     := sHistorico;
            sHistoricoAlt := sHistorico + ', Contrato: ' + FieldByName('IDCONTRATOEMPTMO').AsString;
         end; }


         // ----------------------------------------------------------------------------------------
         //    Verificação do FLOAT para concessão
         // ----------------------------------------------------------------------------------------
         if (iTipoMov = 0) then
         begin
            if dtmEmptmo.qryParamEmptmoFLGUSAFLOATCONC.AsInteger = 1 then
            begin
               with dtmEmptmo.qryBancoPortForma do
               begin
                  LimpaParametros(dtmEmptmo.qryBancoPortForma);
                  ParamByName('PCODPORTFORMA').AsInteger := qryItensCAPCAR.FieldByName('PORTFORMAPAG').AsInteger;
                  Open;

                  if not(dtmEmptmo.qryBancoPortForma.IsEmpty) then
                  begin
                     iFloat      := dtmEmptmo.qryBancoPortFormaDFLOATPAGTO.AsInteger;
                     dDataVenc   := dDataVenc - iFloat;
                  end;  // if not(dtmEmptmo.qryBancoPortForma.IsEmpty)
               end;  // with dtmEmptmo.qryBancoPortForma
            end;  // if dtmEmptmo.qryParamEmptmoFLGUSAFLOATCONC.AsInteger = 1
         end;  // if iTipoMov = 0
         // ----------------------------------------------------------------------------------------
         //    FIM Verificação do FLOAT para concessão
         // ----------------------------------------------------------------------------------------

         // guarda os valores do 1º registro para comparação  XXXXXXXXXXXXX
         MontaParamCAPCAR(iTipoMov, iTipoDocRec, iTipoDocPag, dDataLanc, dDataVenc, qryItensCAPCAR, iMoedaCorrente, rParamAnterior);
         MontaParamCAPCAR(iTipoMov, iTipoDocRec, iTipoDocPag, dDataLanc, dDataVenc, qryItensCAPCAR, iMoedaCorrente, rParamAtual);

         // Vai-se criar um único documento para todos os itens de um contrato que tiverem
         //   o mesmo mês e ano de cobrança.  Cada item corresponderá a um RateioDocum, e haverá
         //   um LanctoDocum com o valor total dos itens.
         if not(dtmBaseDados.dbBaseDados.InTransaction) then
         begin
            StartTransacao;
            bIniciouTransacao := True;
         end;

         while not(qryItensCAPCAR.EOF) do
         begin
            case iTipoMov of
              2: sHistoricoAlt  := 'Amortização de Empréstimos - Contrato: ' + FieldByName('IDCONTRATOEMPTMO').AsString; // SOL 195538 KTN 1917765 Otacilio
              3: sHistoricoAlt  := 'Quitação de Empréstimos - Contrato: ' + FieldByName('IDCONTRATOEMPTMO').AsString;  // SOL 195538 KTN 1917765 Otacilio
            else
              //BRUNO AZEVEDO SOL 200924 KINTANA 1958353
              //sHistoricoAlt     := sHistorico;
              sHistoricoAlt := sHistorico + ', Contrato: ' + FieldByName('IDCONTRATOEMPTMO').AsString;
            end;

            // SOL:120615 - Daniel Begnami
            inc(iCommitedCount);

            if (iCommitedCount > 500) then
            begin
              CommitTransacao;
              iCommitedCount := 0;

              if not(dtmBaseDados.dbBaseDados.InTransaction) then
              begin
                 StartTransacao;
                 bIniciouTransacao := True;
              end;

            end;
            // FIM SOL:120615

            // -------------------------------------------------------------------------------------
            //    Tratamento de autalização do saldo devedor em caso de suspensão
            // -------------------------------------------------------------------------------------

            // Faz a atualização do saldo devedor, caso o mesmo não tenha sido atualizado na geração do item
            fNovoSaldoDev := FieldByname('HMESALDODEV').AsCurrency;

            if not(FieldByName('IDTIPOSUSPEMPTMO').IsNull) then
            begin
               sSQLEnvioSusp := 'SELECT '     + #13 +
                                ' ' + FieldByName('IDCONTRATOEMPTMO').AsString   + ' AS IDCONTRATOEMPTMO, '  + #13 +
                                ' ' + FieldByName('IDTIPOSUSPEMPTMO').AsString   + ' AS IDTIPOSUSPEMPTMO  '  + #13 +
                                'FROM DUAL ';

               if (FieldByName('HMETIPOMOV').AsInteger > 0) then
               begin

                  if not(FieldByName('FLGATUALSALDOENV').IsNull) and (FieldByName('FLGATUALSALDOENV').AsInteger = 1) then
                  begin
                     case FieldByname('ITCTRATASALDODEV').AsInteger of
                        // 0: Não Tratar
                        1: fNovoSaldoDev := fNovoSaldoDev - FieldByname('HMEVLRPREVISTO').AsCurrency; // Abater
                        2: fNovoSaldoDev := fNovoSaldoDev + FieldByname('HMEVLRPREVISTO').AsCurrency; // Incorporar
                     end;// case

                     sSQLUpdate :=
                     'UPDATE '                                                            + #13 +
                     '  HISTMOVEMPTMO '                                                   + #13 +
                     'SET '                                                               + #13 +
                     '  HMESALDODEV = ' + NumeroIngles(fNovoSaldoDev)                     + #13 +
                     'WHERE '                                                             + #13 +
                     '  IDHISTMOVEMPTMO = ' + FieldByname('IDHISTMOVEMPTMO').AsString;

                     dtmEmptmo.qryAux.Close;
                     dtmEmptmo.qryAux.Sql.Clear;
                     dtmEmptmo.qryAux.Sql.Text := sSQLUpdate;
                     dtmEmptmo.qryAux.ExecSql;
                  end;
               end;
            end;
            // -------------------------------------------------------------------------------------
            //    FIM Tratamento de autalização do saldo devedor em caso de suspensão
            // -------------------------------------------------------------------------------------



            // -------------------------------------------------------------------------------------

            // cria o Documento com os dados do registro 'ANTERIOR'.
            // função que insere Cliente/Fornecedor e insere Documento
            if not(InsereDocumento(rParamAnterior, sErro, CtrlDocumento, sHistoricoAlt, False)) then
            begin
               Result := -3;  // ERRO ao inserir Documento
               Exit;
            end
            else
            begin
               // atribuição do Código do Documento
               rParamAtual.iDocumento := rParamAnterior.iDocumento;
            end;// Insere Documento

            // -------------------------------------------------------------------------------------

            fTotal := 0;
            SetLength(vContaBaixa, 0);

            // -------------------------------------------------------------------------------------
            // compara os campos-chaves do registro 'ATUAL' com o 'ANTERIOR'
            // -------------------------------------------------------------------------------------
            while ( not(qryItensCAPCAR.EOF) and (ComparaParam(rParamAnterior, rParamAtual)) ) do
            begin
               fTotal := fTotal + rParamAtual.fVlrLanc;

               // ----------------------------------------------------------------------------------

            //Pendência 28219
               x := -1;
               for y := 0 to length(vContaBaixa) - 1 do
               begin
                  if (vContaBaixa[y].sConta     = rParamAtual.sCCBaixa) and
                     (vContaBaixa[y].iPatro     = rParamAtual.iPatro) and
                     (vContaBaixa[y].iUnidNegoc = rParamAtual.iUnidNegoc) and
                     (vContaBaixa[y].iPlanoPrev = rParamAtual.iPlanPrevContab) then
                  begin
                     vContaBaixa[y].fValor := vContaBaixa[y].fValor + rParamAtual.fVlrLanc;
                     x := y;
                  end;
               end;

               //if y >= (length(vContaBaixa) - 1) then
               if (x > (length(vContaBaixa))) or (x = -1) then
               begin
                  z := length(vContaBaixa) + 1;
                  SetLength(vContaBaixa, z);

                  vContaBaixa[z - 1].sConta      := rParamAtual.sCCBaixa;
                  vContaBaixa[z - 1].fValor      := rParamAtual.fVlrLanc;
                  vContaBaixa[z - 1].iPatro      := rParamAtual.iPatro;
                  vContaBaixa[z - 1].iUnidNegoc  := rParamAtual.iUnidNegoc;
                  vContaBaixa[z - 1].iPlanoPrev  := rParamAtual.iPlanPrevContab;
               end;
             //Fim Pendência 28219

               // ----------------------------------------------------------------------------------

               if ( (j >= 0) and (j <= 8) ) then
               begin
                  vMsgCnab[j] := rParamAtual.sDescricao + ' [ ' + rParamAtual.sAnoMesCompetencia
                                 + ' ] = ' + FormatFloat('#0.00', rParamAtual.fVlrLanc);
               end
               else
               begin
                  // se o nº de linhas for superior a 9, NÃO MOSTRA LINHA ALGUMA
                  for k := 0 to 8 do vMsgCnab[k] := '';
               end;

               // ----------------------------------------------------------------------------------

               // cria o RateioDocum com os dados do registro 'ATUAL'
               // função que faz o Rateio do documento
               if not(LancaRateio(sCCusto, iPrograma, CtrlDocumento, rParamAtual, sErro)) then
               begin
                  Result := -4;  // ERRO no Rateio do Documento
                  Exit;
               end;// Lança Rateio

               // ----------------------------------------------------------------------------------

               inc(i);
               inc(j);

               // ----------------------------------------------------------------------------------

               z := length(vHistDocumento) + 1;
               SetLength(vHistDocumento, z);

               vHistDocumento[z - 1].IDHistMov     := qryItensCAPCAR.FieldByName('IDHISTMOVEMPTMO').AsFloat;
               vHistDocumento[z - 1].CodDocumento  := rParamAtual.iDocumento;

               // ----------------------------------------------------------------------------------

               frmProgresso.AndaFormProgresso(i);

               try
                  sMatricula  := qryItensCAPCAR.FieldByName('MATRICULA').AsString;
               except
                  sMatricula  := '               ';
               end;

               sFlgTipoDesc := '          ';

               sResult.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                           CompletaInicio(FormatFloat('#0', qryItensCAPCAR.FieldByName('IDCONTRATOEMPTMO').AsFloat), ' ', 15) + ' ' +
                           CompletaFim(sMatricula, ' ', 13) + ' ' +
                           CompletaFim(FormatFloat(#0, qryItensCAPCAR.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                           CompletaFim(FormatFloat(#0, qryItensCAPCAR.FieldByName('IDPATRO').AsFloat), ' ', 5) + ' ' +
                           CompletaInicio(FormatFloat('#0', qryItensCAPCAR.FieldByName('HMEPARCELA').AsFloat), ' ', 7) + ' ' +
                           CompletaFim(qryItensCAPCAR.FieldByName('ITEDESCRICAO').Asstring, ' ', 21) + ' ' +  // SOL 141496 KINTANA 897024
                           CompletaInicio(FormatFloat('#0.00', qryItensCAPCAR.FieldByName('HMEVLRPREVISTO').AsFloat), ' ', 15) + ' ' +
                           CompletaFim(qryItensCAPCAR.FieldByName('FLGTIPODESC').Asstring, ' ', 11)+ ' ' + //SOL 141496 KINTANA 897024
                           CompletaInicio(FormatFloat('#0', rParamAtual.iDocumento), ' ', 13)
                          );



               qryItensCAPCAR.Next; // qryItensCAPCAR - loop interno - EOF + compara

               // ----------------------------------------------------------------------------------
               //    Pega o Evento e a data do vencimento do próximo registro a ser enviado
               // ----------------------------------------------------------------------------------
               dDataVenc   := qryItensCAPCAR.FieldByName('HMEDATAVENCTO').AsDateTime;
               iTipoMov    := qryItensCAPCAR.FieldByName('HMETIPOMOV').AsInteger;

               // ----------------------------------------------------------------------------------
               //    Verificação do FLOAT para concessão
               // ----------------------------------------------------------------------------------
               if iTipoMov = 0 then
               begin
                  if dtmEmptmo.qryParamEmptmoFLGUSAFLOATCONC.AsInteger = 1 then
                  begin
                     with dtmEmptmo.qryBancoPortForma do
                     begin
                        LimpaParametros(dtmEmptmo.qryBancoPortForma);
                        ParamByName('PCODPORTFORMA').AsInteger := qryItensCAPCAR.FieldByName('PORTFORMAPAG').AsInteger;
                        Open;

                        if not(dtmEmptmo.qryBancoPortForma.IsEmpty) then
                        begin
                           iFloat      := dtmEmptmo.qryBancoPortFormaDFLOATPAGTO.AsInteger;
                           dDataVenc   := dDataVenc - iFloat;
                        end;  // if not(dtmEmptmo.qryBancoPortForma.IsEmpty)
                     end;  // with dtmEmptmo.qryBancoPortForma
                  end;  // if dtmEmptmo.qryParamEmptmoFLGUSAFLOATCONC.AsInteger = 1
               end;  // if iTipoMov = 0
               // ----------------------------------------------------------------------------------
               //    FIM Verificação do FLOAT para concessão
               // ----------------------------------------------------------------------------------

               // ----------------------------------------------------------------------------------
               // atualiza os parâmetros 'ATUAIS'
               MontaParamCAPCAR(iTipoMov,
                                iTipoDocRec,
                                iTipoDocPag,
                                dDataLanc,
                                dDataVenc,
                                qryItensCAPCAR,
                                iMoedaCorrente,
                                rParamAtual
                               );
               // ----------------------------------------------------------------------------------

            end;  // while de comparação
            // -------------------------------------------------------------------------------------
            //
            // -------------------------------------------------------------------------------------

            // -------------------------------------------------------------------------------------

            // Lança as contas de baixa no documento
            for y := 0 to length(vContaBaixa) - 1 do
            begin
               CtrlDocumento.CCBaixasXDocum.SetValues(vContaBaixa[y].fValor,        //
                                                      0,                            // liIDCcBaixasXDocum
                                                      Sistema.IDEmpresa,            // liIDPessos
                                                      rParamAnterior.iDocumento,    // liCodDocumento
                                                      vContaBaixa[y].iUnidNegoc,    // liUnidNegoc
                                                      IntegraBack.Plano,            // liPlano
                                                      vContaBaixa[y].iPlanoPrev,    // liIDPlanoPrev
                                                      vContaBaixa[y].iPatro,        // liIDPatro
                                                      -1,                           // liIDSegregaCriter
                                                      vContaBaixa[y].sConta         // sPlaConta
                                                     );
            end;

            // Limpa o vetor de contas
            SetLength(vContaBaixa, 0);

            // -------------------------------------------------------------------------------------

            // cria o LanctoDocum com os dados do registro 'ANTERIOR', mais
            // a totalização de todos os registros 'ATUAIS'
            // função que faz o lançamento do Documento
            if not(LancaDocumento(rParamAnterior, fTotal, sHistoricoAlt, CtrlDocumento, iPlanilha, sErro, False)) then // // SOL 195538 KTN 1917765 Otacilio
            begin
               Result := -6;  // ERRO ao Lançar Documento
               Exit;
            end;

            // -------------------------------------------------------------------------------------

            //Pendência 20133 - 22/01/2007 - Alberto
            try
            if not(CtrlDocumento.Insert) then
            begin
               sErro.Add(CtrlDocumento.MessageInfo);
               Result := -3;  // ERRO ao inserir Documento
               Exit;
            end;
            except
               sErro.Add(CtrlDocumento.MessageInfo);
               Result := -3;  // ERRO ao inserir Documento
               Exit;
            end;
            //Fim Pendência 20133

            // -------------------------------------------------------------------------------------

            if rParamAtual.sRecPag = 'R' then
            begin

               //Pendência 26194 - 18/07/2007 - Alberto
               if Sistema.TipoCliente = 19991 then
                  begin // FUNCEF

                  for j := 0 to 8 do vMsgCnab[j] := '';

                  with dtmLookEmptmo.qryLookTipoContrato do begin
                     LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);
                     ParamByName('PIDEMPRESAPROP').AsInteger     := Sistema.IdEmpresa;
                     ParamByName('PIDTIPOCONTREMPTMO').AsInteger := rParamAnterior.iTipoContrato;
                     Open;

                     vMsgCnab[2] := 'Contrato ' + FieldByName('TCEDESCRICAO').AsString +
                                    ' - Nº '    + FloatToStr( rParamAnterior.iContrato );
                  end;

               end;
               //Fim Pendência 26194

               // Seta MensagensCNAB com os dados do registro 'ANTERIOR'
               if not(SetMensagem(rParamAnterior.iDocumento, vMsgCnab, CtrlDocumento, sErro)) then
               begin
                  Result := -5;  // ERRO ao inserir Mensagens no Documento
                  Exit;
               end;


            end;  // if rParamAtual.sRecPag = 'R'

            // -------------------------------------------------------------------------------------

            for y := 0 to length(vHistDocumento) - 1 do
            begin
               with dtmIntegraEmptmo.qryUpdateDocumento do
               begin
                  ParamByName('PCODDOCUMENTO').AsInteger    := vHistDocumento[y].CodDocumento;
                  ParamByName('PIDHISTMOVEMPTMO').AsFloat   := vHistDocumento[y].IDHistMov;
                  ExecSQL;
               end;

               // ----------------------------------------------------------------------------------
               // André Pontes - 19/01/2006 - LogDocumento - OK

               LimpaRegistroLog(rLogTotalPrev);

               rLogTotalPrev.IDModulo   := Sistema.IDModulo;
               rLogTotalPrev.IDContrato := -1;
               rLogTotalPrev.IDHistMov  := vHistDocumento[y].IDHistMov;
               rLogTotalPrev.Origem     := -1;
               rLogTotalPrev.Operacao   := 'EnvioCapCar - Update Documento para: ' + FormatFloat('#0', vHistDocumento[y].CodDocumento);
               rLogTotalPrev.Data       := SysDate;
               rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
               rLogTotalPrev.Versao     := Sistema.Versao;

               GravaLogTotalPrev(rLogTotalPrev);

               // ----------------------------------------------------------------------------------
            end;

            //Ádler Souza - SOL 137847 KTN 836194
            for y := 0 to length(vHistDocumento) - 1 do
            begin
              InsertHistEnvioEmptmo(vHistDocumento[y].IDHistMov, intToStr(vHistDocumento[y].CodDocumento),'');
            end;
            //Fim - Ádler Souza - SOL 137847 KTN 836194

            SetLength(vHistDocumento, 0);

            // -------------------------------------------------------------------------------------

            // atualiza os parâmetros 'ANTERIORES'
            MontaParamCAPCAR(iTipoMov,
                             iTipoDocRec,
                             iTipoDocPag,
                             dDataLanc,
                             dDataVenc,
                             qryItensCAPCAR,
                             iMoedaCorrente,
                             rParamAnterior
                            );
            // -------------------------------------------------------------------------------------

            // Limpando o vetor das Mensagens
            for j := 0  to 8 do vMsgCnab[j] := '';

            // Daniel Begnami Sol:98926
            //inc(i);
            //frmProgresso.AndaFormProgresso(i);
            // Fim

            j := 0;

            // Verifica se o usuário Cancelou a Operação
            if frmProgresso.Cancelou then
            begin
               sErro.Add('[Financeiro] - Processo interrompido pelo usuário.');
               Result := -8;
               Exit;
            end;

         end;  // while not(qryItensCAPCAR.EOF)

         // ----------------------------------------------------------------------------------------
         try
            if ( (dtmBaseDados.dbBaseDados.InTransaction) and (bIniciouTransacao) ) then
            begin
               CommitTransacao;
            end;
         except
            if ( (dtmBaseDados.dbBaseDados.InTransaction) and (bIniciouTransacao) ) then
            begin
               RollBackTransacao;
            end;

            sResult.Clear;
         end;

      end; // with qryItensCAPCAR

   finally
      frmProgresso.EscondeFormProgresso;
      EscondeEspera;

      CtrlDocumento.Free;
      qryItensCAPCAR.Free;
   end;
end;



(* -------------------------------------------------------------------------------------------------
   EnviaLoteConcessao: Função que integra com CaP/CaR, em batch.
                       Os itens a serem integrados são definidos pela query que será passada para a função

   -------------------------------------------------------------------------------------------------
   O SQL a ser passado deverá ser um SELECT na HistMovEmptmo, com as seguintes características
   obigatórias:

   SELECT
      H.IDHISTMOVEMPTMO             ID do Histórico
      H.IDCONTRATOEMPTMO            ID do Contrato
      TC.IDTIPOCONTREMPTMO          ID do Tipo de Contrato
      H.IDITEMEMPTMO                ID do Item a ser contabilizado
      C.IDPLANOPREV                 ID do Plano Previdencial
      C.IDPATRO                     ID da Patrocinadora
      H.HMEVLRPREVISTO              Valor a ser lançado
      H.HMEDATAPREVISTA             Data prevista para vencimento (original)
      H.HMEDATAVENCTO               Data prevista para vencimento (atualizada)

   WHERE
      TE.IDEMPRESAPROP =            Filtrar obrigatoriamente por Sistema.IDEmpresa

      H.HMEFORMACOBRANCA = 'C'      Apenas os itens que devem ser enviados para o CaP/CaR

      AND ((H.HMECENTRALIZA = 1)    Enviar apenas os itens que são totalizadores, ou
      OR  (H.HMEDESTACADO = 1))     os itens que são cobrados em destacado

   ORDER BY
      H.IDCONTRATOEMPTMO, HMEANOCOBRANCA, HMEMESCOBRANCA, "CONTABAIXA"

   -------------------------------------------------------------------------------------------------
   Parâmetros:

      sSQL           :  SQL que será usado para buscar os itens (ver acima)
      dDataLanc
      dDataVenc

      sResult        :  linhas "de acerto" que serão exibidas, se for o caso
      sErro          :  linhas "de erro" que serão exibidas, se for o caso

      sHistorico     :  Histórico-padrão a ser passado para a Contabilidade

   -------------------------------------------------------------------------------------------------
   Códigos de retorno (controle de erro):
       0 : Envio(s) realizados com sucesso
      -1 : ERRO ao tentar selecionar os itens a enviar ao CAP/CAR
      -2 : Query não retornou itens a Enviar
      -3 : ERRO ao inserir Documento
      -4 : ERRO no Rateio do Documento
      -5 : ERRO na criação da tabela temporária Paradox
      -6 : ERRO ao Lançar Documento
      -7 : ERRO ao Atualizar Histórico com o Documento
      -8 : Processo interrompido pelo usuário sem envio
      -9 : Não foi encontrado IDBanco (Fornecedor para o Documento)

----------------------------------------------------------------------------------------------------*)
function TIntegraEmptmo.EnviaLoteConcessao(const sSQL           : String;
                                           const sHistorico     : String;
                                           const dDataLanc      : TDateTime;
                                           const iCodTipoDoc    : Integer;
                                           const iMoedaCorrente : Integer;
                                           const sCCusto        : String;
                                           const iPrograma      : Integer;
                                           var   iPlanilha      : Integer;
                                           var   sResult        : TStringList;
                                           var   sErro          : TStringList
                                          ): Integer;
var
   vContaBaixa       : Array of TContaBaixa;
   vHistDocumento    : Array of THistDocumento;

   bAchou            : Boolean;

   dDataVenc         : TDateTime;
   fTotal 				: Currency;

   i, j, k, y, z, x  : Integer;
   iTipoMov          : Integer;
   iFloat            : Integer;

   iTipoDocRec			: Int64;
   iTipoDocPag			: Int64;
   iBanco            : Int64;

   TabelaPDXRateio   : TTable;

   qryTipoContrato   : TwwQuery;
   qryItensCAPCAR    : TwwQuery;
   qryLancaRateio    : TwwQuery;

   sSQLRateio        : String;

   rParamAtual       : TParamIntegra;
   rParamAnterior    : TParamIntegra;

   CtrlDocumento     : TCtrlDocumento;
   rLogTotalPrev     : TLogTotalPrev;
   iTotalDiverg      : Integer;
begin
   Result            := 0;
   iTotalDiverg      := 0;

   // incializa a tabela
   TabelaPDXRateio               := nil;

   // cria as queries necessárias
   qryItensCAPCAR                := TwwQuery.Create(Application);
   qryItensCAPCAR.DatabaseName   := 'BaseDados';

   qryLancaRateio                := TwwQuery.Create(Application);
 //Jéssica Lana SOL 114575 24/04/2009
 //qryLancaRateio.DatabaseName   := copy(Sistema.TempDir, 1, length(Sistema.TempDir) - 1);
 //qryLancaRateio.DatabaseName   := copy(ftempregra + '\', 1, length(ftempregra) - 1);
   qryLancaRateio.DatabaseName   := ftempregra;
   qryTipoContrato                := TwwQuery.Create(Application);
   qryTipoContrato.DatabaseName   := 'BaseDados';


   // ----------------------------------------------------------------------------------------------
   if ParametrosSistema then
   begin
      // -------------------------------------------------------------------------------------------
      if not(dtmEmptmo.qryParamEmptmoTIPODOCPAG.IsNULL) then
      begin
         iTipoDocPag := dtmEmptmo.qryParamEmptmoTIPODOCPAG.AsInteger;
      end
      else
      begin
         iTipoDocPag := -1;
      end;
      // -------------------------------------------------------------------------------------------
      if iCodTipoDoc = -1 then
      begin
         if not(dtmEmptmo.qryParamEmptmoTIPODOCREC.IsNULL) then
         begin
            iTipoDocRec := dtmEmptmo.qryParamEmptmoTIPODOCREC.AsInteger;
         end
         else
         begin
            iTipoDocRec := -1;
         end;
      end
      else
      begin
         iTipoDocRec := iCodTipoDoc;
      end;
      // -------------------------------------------------------------------------------------------
   end
   else  // if ParametrosSistema
   begin

      // A tabela Parâmetros do Sistema está vazia
      sErro.Add('Erro nos Parâmetros do Sistema.');
      Result := -1;  // ERRO ao abrir
      Exit;

   end;  // if ParametrosSistema
   // ----------------------------------------------------------------------------------------------


   // ----------------------------------------------------------------------------------------------
   try
      CtrlDocumento := TCtrlDocumento.Create;
      CtrlDocumento.Initialize(dtmBaseDados.dbBaseDados,
                               True,
                               Sistema.ConnectionType,
                               Sistema.ConnectionSide,
                               Sistema.AppRemoteServer,
                               True
                              );

      CtrlDocumento.OpenTransaction := False;

      try
         MostraEspera('Selecionando Itens para Contas a Pagar/Receber...');

         try
            qryItensCAPCAR.SQL.Clear;
            qryItensCAPCAR.SQL.Text := sSQL;
          //Jéssica Lana SOL 114575 24/04/2009
          //qryItensCAPCAR.SQL.SaveToFile(Sistema.TempDir + 'EP-ItensEnvioLote.txt');
            qryItensCAPCAR.SQL.SaveToFile(ftempregra + '\' + 'EP-ItensEnvioLote.txt');
            qryItensCAPCAR.Open;
         except
            on E:Exception do
            begin
               sErro.Add('Erro ao tentar selecionar os registros para Envio');
               sErro.Add(E.Message);
               Result := -1; // ERRO ao abrir
               Exit;
            end;
         end;

      finally
         EscondeEspera;
      end;

      if qryItensCAPCAR.isEmpty then
      begin
         sErro.Add('Não há registros para envio');
         Result := -2;  // não há itens
         Exit;
      end;

      //edilaine - SIG62639 - inicio
      if (Pos('PERFILINVEST', qryItensCAPCAR.SQL.Text) > 0) then
      begin
        if not ValidaParamPerfilInvestimento(qryItensCAPCAR, sErro) then
        begin
          Result := -8;  // falta parametrização Perfil de Investimento
          Exit;
        end;
      end;
      //edilaine - SIG62639 - fim

      // -------------------------------------------------------------------------------------------
      //    Criação da tabela temporário em Paradox
      // -------------------------------------------------------------------------------------------

      // exclui a tabela Paradox
      if not(IntegraEmptmo.ExcluiTabelaPDX('RATEIOEP.DB', TabelaPDXRateio)) then
      begin
         sErro.Add('Erro ao Excluir Tabela Temporária.');
         Result := -5;  // não conseguiu excluir
         Exit;
      end;

      // cria a tabela Paradox
      try
         IntegraEmptmo.CriaTabelaPDX('RATEIOEP.DB', TabelaPDXRateio);
      except
         on E:Exception do
         begin
            sErro.Add(E.Message);
            Result := -5;  // não conseguir criar
            Exit;
         end;
      end;

      // define a estrutura da tabela Paradox
      if not(DefineEstruturaTabelaPDXRateio(TabelaPDXRateio)) then
      begin
         sErro.Add('ERRO ao tentar criar tabela para agrupamento');
         Result := -5;  // não conseguir criar
         Exit;
      end;

      // -------------------------------------------------------------------------------------------
      //    FIM Criação da tabela temporário em Paradox
      // -------------------------------------------------------------------------------------------


      // tendo conseguido, começa a iterar pela query
      with qryItensCAPCAR do
      begin
         First;
         i := 0;

         iBanco := -1;

         frmProgresso.MostraFormProgresso('Enviando Itens para Contas a Pagar...',
                                          True,
                                          True,
                                          True,
                                          i,
                                          qryItensCAPCAR.RecordCount
                                         );

         dDataVenc   := qryItensCAPCAR.FieldByName('HMEDATAVENCTO').AsDateTime;
         iTipoMov    := qryItensCAPCAR.FieldByName('HMETIPOMOV').AsInteger;


         // ----------------------------------------------------------------------------------------
         //    Verificação do FLOAT para concessão
         // ----------------------------------------------------------------------------------------
         if dtmEmptmo.qryParamEmptmoFLGUSAFLOATCONC.AsInteger = 1 then
         begin
            with dtmEmptmo.qryBancoPortForma do
            begin
               LimpaParametros(dtmEmptmo.qryBancoPortForma);
               ParamByName('PCODPORTFORMA').AsInteger := qryItensCAPCAR.FieldByName('PORTFORMAPAG').AsInteger;
               Open;

               if not(dtmEmptmo.qryBancoPortForma.IsEmpty) then
               begin
                  iFloat      := dtmEmptmo.qryBancoPortFormaDFLOATPAGTO.AsInteger;
                  dDataVenc   := dDataVenc - iFloat;

                  if not(dtmEmptmo.qryBancoPortFormaIDFAVORECIDO.IsNull) then iBanco := dtmEmptmo.qryBancoPortFormaIDFAVORECIDO.AsInteger;
               end;  // if not(dtmEmptmo.qryBancoPortForma.IsEmpty)
            end;  // with dtmEmptmo.qryBancoPortForma
         end;  // if dtmEmptmo.qryParamEmptmoFLGUSAFLOATCONC.AsInteger = 1
         // ----------------------------------------------------------------------------------------
         //    FIM Verificação do FLOAT para concessão
         // ----------------------------------------------------------------------------------------


         // ----------------------------------------------------------------------------------------
         //    Verificação do Banco ligado ao PortadorForma (pois é o Fornecedor do documento)
         // ----------------------------------------------------------------------------------------
         if iBanco = -1 then
         begin
            with dtmEmptmo.qryBancoPortForma do
            begin
               LimpaParametros(dtmEmptmo.qryBancoPortForma);
               ParamByName('PCODPORTFORMA').AsInteger := qryItensCAPCAR.FieldByName('PORTFORMAPAG').AsInteger;
               Open;

               if not(dtmEmptmo.qryBancoPortForma.IsEmpty) then
               begin
                  if not(dtmEmptmo.qryBancoPortFormaIDFAVORECIDO.IsNull) then iBanco := dtmEmptmo.qryBancoPortFormaIDFAVORECIDO.AsInteger;
               end;
            end;
         end;

         with dtmEmptmo.qryPortadorForma do
         begin
            LimpaParametros(dtmEmptmo.qryPortadorForma);
            ParamByName('PCODPORTFORMA').AsInteger := qryItensCAPCAR.FieldByName('PORTFORMAPAG').AsInteger;
            Open;

            if not(dtmEmptmo.qryPortadorForma.IsEmpty) and not(dtmEmptmo.qryPortadorFormaIDBANCO.IsNull) then
            begin
               if iBanco = -1 then iBanco := dtmEmptmo.qryPortadorFormaIDBANCO.AsInteger;
            end
            else
            begin
               Result := -9; // Não foi encontrado banco
               sErro.Add('Não foi encontrado Banco associado à Conta de Caixa');
               Exit;
            end;  // if not(dtmEmptmo.qryBancoPortForma.IsEmpty)
         end;  // with dtmEmptmo.qryBancoPortForma
         // ----------------------------------------------------------------------------------------
         //    FIM verificação o Banco ligado ao PortadorForma (pois é o Fornecedor do documento)
         // ----------------------------------------------------------------------------------------

         // guarda os valores do 1º registro para o Documento a a LanctoDocum
         MontaParamCAPCAR(iTipoMov, iTipoDocRec, iTipoDocPag, dDataLanc, dDataVenc, qryItensCAPCAR, iMoedaCorrente, rParamAnterior);

         // passa o banco como Fornecedor para o Documento
         rParamAnterior.iPessoa := iBanco;

         // ----------------------------------------------------------------------------------------
         //    Vai-se criar um único documento para todos os itens de um contrato que tiverem
         //       o mesmo mês e ano de cobrança.  Cada item corresponderá a um RateioDocum, e haverá
         //       um LanctoDocum com o valor total dos itens.
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         //    Gravação do Documento
         // ----------------------------------------------------------------------------------------
         // cria o Documento com os dados do registro 'ANTERIOR'.
         // função que insere Cliente/Fornecedor e insere Documento
         if not(InsereDocumento(rParamAnterior, sErro, CtrlDocumento, sHistorico, True)) then
         begin
            Result := -3;  // ERRO ao inserir Documento
            sErro.Add('Erro ao criar Documento');
            Exit;
         end
         else
         begin
            // atribuição do Código do Documento
            rParamAtual.iDocumento := rParamAnterior.iDocumento;
            iDocumentoPai          := rParamAnterior.iDocumento; //Teste Renato Visoni
         end;  // if not(InsereDocumento(rParamAnterior, sErro))
         // ----------------------------------------------------------------------------------------
         //    FIM Gravação do Documento
         // ----------------------------------------------------------------------------------------


         // ----------------------------------------------------------------------------------------
         //    Preparação para gravação da RateioDocum
         // ----------------------------------------------------------------------------------------
         fTotal := 0;
         SetLength(vContaBaixa, 0);
         SetLength(vHistDocumento, 0);

         // ----------------------------------------------------------------------------------------

         while not(qryItensCAPCAR.EOF) do
         begin
            inc(i);
            frmProgresso.AndaFormProgresso(i);

            // Verifica se o usuário Cancelou a Operação
            if frmProgresso.Cancelou then
            begin
               sErro.Add('Processo interrompido pelo usuário');
               Result := -8;
               Exit;
            end;

            // Marchetti - Pendencia 19602 - 26/04/2006
            qryTipoContrato.Close;
            qryTipoContrato.Sql.Text := 'SELECT TCEMAXCONTRATO ' + #13 +
                                        'FROM   TIPOCONTREMPTMO' + #13 +
                                        'WHERE  IDTIPOCONTREMPTMO = ' + qryItensCAPCAR.FieldByName('IDTIPOCONTREMPTMO').AsString;
            qryTipoContrato.Open;

            if (qryItensCAPCAR.FieldByName('HMETIPOMOV').AsInteger = 0) and
               (qryTipoContrato.FieldByName('TCEMAXCONTRATO').AsInteger = 1) and
               (not CalcEmptmo.VerificaContratoAtivo(qryItensCAPCAR.FieldByName('IDPESSOA').AsInteger,
                                                    qryItensCAPCAR.FieldByName('IDBENEF').AsInteger,
                                                    qryItensCAPCAR.FieldByName('IDTIPOCONTREMPTMO').AsInteger,
                                                    False,
                                                    qryItensCAPCAR.FieldByName('IDCONTRATOEMPTMO').AsFloat)) then
            begin
               sErro.Add('Participante ' + qryItensCAPCAR.FieldByName('MATRICULA').AsString + ' possui outro empréstimo do mesmo tipo já ativo');
               Inc(iTotalDiverg);
               qryItensCAPCAR.Next;
               Continue;
            end;
            // Fim Marchetti - Pendencia 19602 - 26/04/2006

            // -------------------------------------------------------------------------------------
            MontaParamCAPCAR(iTipoMov,
                             iTipoDocRec,
                             iTipoDocPag,
                             dDataLanc,
                             dDataVenc,
                             qryItensCAPCAR,
                             iMoedaCorrente,
                             rParamAtual
                            );
            // -------------------------------------------------------------------------------------

            fTotal := fTotal + rParamAtual.fVlrLanc;

            GravaItemPDXRateio(rParamAnterior.iDocumento,
                               rParamAtual,
                               TabelaPDXRateio
                              );

            // -------------------------------------------------------------------------------------

            bAchou := False;
            //Pendência 28219
            x := -1;
            for y := 0 to length(vContaBaixa) - 1 do
            begin
               if (vContaBaixa[y].sConta     = rParamAtual.sCCBaixa) and
                  (vContaBaixa[y].iPatro     = rParamAtual.iPatro) and
                  (vContaBaixa[y].iUnidNegoc = rParamAtual.iUnidNegoc) and
                  (vContaBaixa[y].iPlanoPrev = rParamAtual.iPlanPrevContab) then
               begin
                  vContaBaixa[y].fValor := vContaBaixa[y].fValor + rParamAtual.fVlrLanc;

                  bAchou := True;
                  Break;
               end;
            end;


            //if (y >= (length(vContaBaixa) - 1)) and not(bAchou) then
            if ((x > (length(vContaBaixa))) or (x = -1)) and not(bAchou) then
            begin
               z := length(vContaBaixa) + 1;
               SetLength(vContaBaixa, z);

               vContaBaixa[z - 1].sConta      := rParamAtual.sCCBaixa;
               vContaBaixa[z - 1].fValor      := rParamAtual.fVlrLanc;
               vContaBaixa[z - 1].iPatro      := rParamAtual.iPatro;
               vContaBaixa[z - 1].iUnidNegoc  := rParamAtual.iUnidNegoc;
               vContaBaixa[z - 1].iPlanoPrev  := rParamAtual.iPlanPrevContab;
            end;
            //Fim Pendência 2821
            // -------------------------------------------------------------------------------------

            SetLength(vHistDocumento, i);

            vHistDocumento[i - 1].IDHistMov     := qryItensCAPCAR.FieldByName('IDHISTMOVEMPTMO').AsFloat;
            vHistDocumento[i - 1].CodDocumento  := rParamAtual.iDocumento;

            // -------------------------------------------------------------------------------------

            qryItensCAPCAR.Next;
         end;  // while not(qryItensCAPCAR.EOF)


         // Marchetti - Pendencia 19602 - 26/04/2006
         if iTotalDiverg = qryItensCAPCAR.RecordCount then
         begin
            Result := -3;  // O numero de divergencias é igual ao total de registros a enviar
            Exit;
         end;
         // Fim Marchetti - Pendencia 19602 - 26/04/2006

         // ----------------------------------------------------------------------------------------
         //    FIM Preparação para gravação da RateioDocum
         // ----------------------------------------------------------------------------------------


         // ----------------------------------------------------------------------------------------
         //    Gravação da RateioDocum
         // ----------------------------------------------------------------------------------------

         // cria as queries necessárias
         sSQLRateio :=
         'SELECT '                                             + #13 +
         '  SUM(VALOR) AS VALOR, '                             + #13 +
         '  IDPATRO, IDPLANOPREVCONTAB, '                      + #13 +
         '  UNIDNEGOC, CENTRORESPON, '                         + #13 +
         '  TIPODESEMB, CODDOCUMENTO,RECPAG '                         + #13 +
         'FROM '                                               + #13 +
         '  "RATEIOEP.DB" RATEIOEP '                           + #13 +
         'GROUP BY '                                           + #13 +
         '  IDPATRO, IDPLANOPREVCONTAB, '                      + #13 +
         '  UNIDNEGOC, CENTRORESPON, '                         + #13 +
         '  TIPODESEMB, CODDOCUMENTO,RECPAG '                         + #13;

         qryLancaRateio.Close;
         qryLancaRateio.SQL.Clear;
         qryLancaRateio.SQL.Text := sSQLRateio;

         qryLancaRateio.Open;

         // executa todos os lançamentos
         qryLancaRateio.First;
         while not(qryLancaRateio.EOF) do
         begin
            MontaParamRateio(qryLancaRateio, rParamAtual);

            // cria o RateioDocum com os dados do registro 'ATUAL'
            // função que faz o Rateio do documento
            if not(LancaRateio(sCCusto, iPrograma, CtrlDocumento, rParamAtual, sErro)) then
            begin
               Result := -4;  // ERRO no Rateio do Documento
               sErro.Add('Erro ao criar Rateio do Documento');
               Exit;
            end;// Lança Rateio

            qryLancaRateio.Next;
         end;

         // ----------------------------------------------------------------------------------------
         //    FIM Gravação da RateioDocum
         // ----------------------------------------------------------------------------------------

         // -------------------------------------------------------------------------------------

         // Lança as contas de baixa no documento
         for y := 0 to length(vContaBaixa) - 1 do
         begin
            CtrlDocumento.CCBaixasXDocum.SetValues(vContaBaixa[y].fValor,        //
                                                   0,                            // liIDCcBaixasXDocum
                                                   Sistema.IDEmpresa,            // liIDPessos
                                                   rParamAnterior.iDocumento,    // liCodDocumento
                                                   vContaBaixa[y].iUnidNegoc,    // liUnidNegoc
                                                   IntegraBack.Plano,            // liPlano
                                                   vContaBaixa[y].iPlanoPrev,    // liIDPlanoPrev
                                                   vContaBaixa[y].iPatro,        // liIDPatro
                                                   -1,                           // liIDSegregaCriter
                                                   vContaBaixa[y].sConta         // sPlaConta
                                                  );
         end;

         // Limpa o vetor de contas
         SetLength(vContaBaixa, 0);

         // -------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         //    Gravação da LanctoDocum
         // ----------------------------------------------------------------------------------------

         // cria o LanctoDocum com os dados do registro 'ANTERIOR', mais
         // a totalização de todos os registros 'ATUAIS'
         // função que faz o lançamento na LanctoDocum
         if not(LancaDocumento(rParamAnterior, fTotal, sHistorico, CtrlDocumento, iPlanilha, sErro, False)) then
         begin
            Result := -6;  // ERRO ao Lançar Documento
            sErro.Add('Erro ao criar Lançamento do Documento');
            Exit;
         end;

         // ----------------------------------------------------------------------------------------
         //    FIM Gravação da LanctoDocum
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------

         if not(CtrlDocumento.Insert) then
         begin
            sErro.Add(CtrlDocumento.MessageInfo);
            Result := -3;  // ERRO ao inserir Documento
            Exit;
         end;

         // ----------------------------------------------------------------------------------------

         for y := 0 to length(vHistDocumento) - 1 do
         begin
            with dtmIntegraEmptmo.qryUpdateDocumento do
            begin
               ParamByName('PCODDOCUMENTO').AsInteger    := vHistDocumento[y].CodDocumento;
               ParamByName('PIDHISTMOVEMPTMO').AsFloat   := vHistDocumento[y].IDHistMov;
               ExecSQL;
            end;

            //BRUNO AZEVEDO SOL 149067 KINTANA 1059000
            InsertHistEnvioEmptmo(vHistDocumento[y].IDHistMov,IntToStr(vHistDocumento[y].CodDocumento),'');
            //BRUNO AZEVEDO SOL 149067 KINTANA 1059000

            // -------------------------------------------------------------------------------------
            // André Pontes - 19/01/2006 - LogDocumento - OK

            LimpaRegistroLog(rLogTotalPrev);

            rLogTotalPrev.IDModulo   := Sistema.IDModulo;
            rLogTotalPrev.IDContrato := -1;
            rLogTotalPrev.IDHistMov  := vHistDocumento[y].IDHistMov;
            rLogTotalPrev.CodPlanDoc := vHistDocumento[y].CodDocumento;
            rLogTotalPrev.Origem     := -1;
            rLogTotalPrev.Operacao   := 'EnviaLoteConcessao - qryUpdateDocumento';
            rLogTotalPrev.Data       := SysDate;
            rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
            rLogTotalPrev.Versao     := Sistema.Versao;

            GravaLogTotalPrev(rLogTotalPrev);

            // -------------------------------------------------------------------------------------
         end;

         SetLength(vHistDocumento, 0);

         // ----------------------------------------------------------------------------------------

         sResult.Add('Valor enviado: ' + FormatFloat('#,#0.00', fTotal));

         // ----------------------------------------------------------------------------------------
      end; // with

   finally
      CtrlDocumento.Free;

      frmProgresso.EscondeFormProgresso;
      EscondeEspera;

      qryLancaRateio.Free;
      qryItensCAPCAR.Free;
      qryTipoContrato.Free;

      if TabelaPDXRateio <> nil then TabelaPDXRateio.Close;
      if TabelaPDXRateio <> nil then TabelaPDXRateio.Free;
   end;
end;



// função que insere Cliente/Fornecedor e insere Documento
function TIntegraEmptmo.InsereDocumento(var   rParam        : TParamIntegra;
                                        var   sErro         : TStringList;
                                              CtrlDocumento : TCtrlDocumento;
                                        const sHistorico    : String;
                                        const bLote         : Boolean = False;
                                        iDocumentoPai       : Integer = -1 //teste renato visoni
                                       ): Boolean;
var
   qryAux      : TwwQuery;
   rSitPart    : TSitPart;
   iRamoForCli : Integer;
   dDataLanc   : TDateTime;
   fNumDoc     : Extended;
   sHistObs    : String; //Everson Cunha - SIG126804
begin
   Result := True;

   //Everson Cunha - SIG126804 - Ini
   sHistObs := sHistorico;

   if Copy(sHistorico, 0, 35) = 'Concessão/Renovação de Empréstimos:' then
    sHistObs := sHistorico + #13#10 + #13#10 + 'DEX 056 AD 02';
   //Everson Cunha - SIG126804 - Fim

   // ----------------------------------------------------------------------------------------------
   //    Criação do Cliente/Fornecedor
   // ----------------------------------------------------------------------------------------------

   // busca a situação do participante
   rSitPart    := FuncoesEmptmo.BuscaSitPart(rParam.iPessoa);

   // busca o Ramo do Cliente/Fornecedor
   iRamoForCli := BuscaRamoForCli(rSitPart.flgInterno, rParam.sRecPag);

   if rParam.sRecPag = 'R' then
   begin
      try
         // Criar Cliente
         CtrlDocumento.ForCli.Inserir(rParam.iPessoa,
                                      Sistema.IdEmpresa,
                                      -1,
                                      IntegraBack.Plano,
                                      iRamoForCli,
                                      rParam.sCentroCustoDFinan,
                                      '',
                                      rParam.sContaDFinan,
                                      '',
                                      tfcCliente
                                     );
      except

         on E:Exception do
         begin
            sErro.Add(#13 + 'Erro ao Inserir Cliente. Participante: ' + IntToStr(rParam.iPessoa) + #13);
            sErro.Add(E.Message);
            Result := False;
            Exit;
         end;

      end;  // try..except
   end
   else  // if rParam.sRecPag = 'R'
   begin
      try
         // Criar Fornecedor
         CtrlDocumento.ForCli.Inserir(rParam.iPessoa,
                                      Sistema.IdEmpresa,
                                      -1,
                                      IntegraBack.Plano,
                                      iRamoForCli,
                                      rParam.sCentroCustoCFinan,
                                      '',
                                      rParam.sContaCFinan,
                                      '',
                                      tfcFornecedor
                                     );

      except

         on E:Exception do
         begin
            sErro.Add(#13 + 'Erro ao Inserir Fornecedor. Participante: ' + IntToStr(rParam.iPessoa) + #13);
            sErro.Add(E.Message);
            Result := False;
            Exit;
         end;

      end;  // try..except

   end;  // if rParam.sRecPag = 'R'


   // ----------------------------------------------------------------------------------------------
   //    Criação do Documento
   // ----------------------------------------------------------------------------------------------

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try

      // -------------------------------------------------------------------------------------------

      CtrlDocumento.Prepare(OpDocumento, odlEfetivo);

      CtrlDocumento.IdEspAcesso     := Sistema.IdEspAcesso;
      CtrlDocumento.IdModulo        := Sistema.IDModulo;
      CtrlDocumento.IdUsuario       := Sistema.IDUsuario;

      // Gerar codigo do documento
      rParam.iDocumento := CtrlDocumento.GetSequenceDocumento;

      if rParam.iDocumento <= 0 then
      begin
         sErro.Add('Erro ao Gerar código do Documento');
         Result := False;
         Exit;
      end;

      // -------------------------------------------------------------------------------------------

      try
         // ----------------------------------------------------------------------------------------

         fNumDoc := rParam.iContrato;
         if bLote then fNumDoc := StrToFloat(FormatDateTime('yyyymmdd', rParam.dDataVenc));

         dDataLanc := rParam.dDataLanc;
         if rParam.dDataVenc < rParam.dDataLanc then dDataLanc := rParam.dDataVenc;

         // ----------------------------------------------------------------------------------------

         CtrlDocumento.SetValues(rParam.iDocumento,            // liCodDocumento
                                 rParam.iDocumento, // fNumDoc,   // rNoDocumento
                                 '',                           // sComplemento
                                 '0',                          // sStatus
                                 rParam.sRecPag,               // sRecPag
                                 '2',                          // sOperacao
                                 '',                           // sNumSlip
                                 '',                           // sNumLeitCodBarras
                                 rParam.sCCBaixa,              // sPlaConta
                                 rParam.sCentroCustoDFinan,    // sCodCentroCusto
                                 '',                           // sNossoNumero
                                 '',                           // sNumDigCodBarras
                                 '',                           // sGrupoDoc
                                 '',                           // sFlgEmiteLancBaix
                                 '',                           // sFlgConfirmaRecPag
                                 'N',                          // sEmisBloq
                                 '',                           // sReferencia,
                                 //sHistorico,                   // sObs //Everson Cunha - SIG126804
                                 sHistObs,                     // sObs   //Everson Cunha - SIG126804
                                 rParam.dDataVenc,             // dDataVencto
                                 dDataLanc,                    // dDataEmissao
                                 rParam.dDataVenc,             // dDataProgramada
                                 0,                            // dDataRemessa
                                 0,                            // dDataLimite
                                 0,                            // dDataCorrecao
                                 0,                            // rVlrMulta
                                 0,                            // rVlrJuros
                                 0,                            // rVlrDesconto
                                 0,                            // rPercJurosSimples
                                 0,                            // rPercJurosAturalial
                                 rParam.iTipoDoc,              // liCodTipDoc
                                 Sistema.IDEmpresa,            // liIDPessoa
                                 15,                           // liIDModulo
                                 rParam.iPessoa,               // liIDForCli
                                 0,                            // liNumFatura
                                 rParam.IDCBancaria,           // liIDCBancaria
                                 0,                            // liUnidNegoc
                                 IntegraBack.Plano,            // liPlano
                                 0,                            // liNumcpbaixa,
                                 0,                            // liNumapgr,
                                 0,                            // liMoecodigo,
                                 0,                            // liLotetransmissao,
                                 0,                            // liIndicecorrecao,
                                 Sistema.Idusuario,            // liIdusuarioinclusao,
                                 Sistema.IdEmpresa,            // liIdempresa,
                                 0,                            // liFlgnaoconciliado,
                                 0,                            // liControleremessa,
                                 0,                            // liCodsubconta,
                                 rParam.iCodPortForma,         // liCodportforma,
                                 0,                            // liCodgrupocnab,
                                 0,                            // liCodgeradorinss,
                                 rParam.iCodForma,             // liCodForma,
                                 -1,                           // Teste Renato Visoni
                                 '',                           // Teste Renato Visoni
                                 iDocumentoPai                 // Teste Renato Visoni
                                );

         // ----------------------------------------------------------------------------------------

      except

         on E:Exception do
         begin
            sErro.Add(#13 + 'Erro ao Inserir Documento. Participante: ' + IntToStr(rParam.iPessoa) + #13);
            sErro.Add(E.Message);
            Result := False;
            Exit;
         end;

      end;

   finally

     qryAux.Free;

   end;
end;



function TIntegraEmptmo.BuscaRamoForCli(const sSituacao, sRecPag: String): Int64;
var
   qryAux   : TwwQuery;
   sSql     : String;
begin

   sSql :=
   'SELECT '                                             + #13 +
   '  TIPOFAVPATRO, TIPOFAVATIVOS, TIPOFAVASSISTIDOS, '  + #13 +
   '  TIPOCLIPATRO, TIPOCLIATIVOS, TIPOCLIASSISTIDOS, '  + #13 +
   '  TIPOFAVMANTIDOS, TIPOFAVMANTPARC, '                + #13 +
   '  TIPOCLIMANTIDOS, TIPOCLIMANTPARC '                 + #13 +
   'FROM '                                               + #13 +
   '  PARAMAPREV ';

   // Cria a Query Auxiliar
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try
      qryAux.SQL.Text := sSql;
      qryAux.Open;

      with qryAux do
      begin
         if sRecPag = 'R' then
         begin
            // Buscar Tipo de Cliente
            if sSituacao = 'AT' then Result := FieldByname('TIPOCLIATIVOS').AsInteger     else
            if sSituacao = 'AS' then Result := FieldByname('TIPOCLIASSISTIDOS').AsInteger else
            if sSituacao = 'CA' then Result := FieldByname('TIPOCLIASSISTIDOS').AsInteger else
            if sSituacao = 'PT' then Result := FieldByname('TIPOCLIPATRO').AsInteger      else
            if sSituacao = 'MA' then Result := FieldByname('TIPOCLIMANTIDOS').AsInteger   else
            if sSituacao = 'MP' then Result := FieldByname('TIPOCLIMANTPARC').AsInteger
            else Result := FieldByname('TIPOCLIMANTIDOS').AsInteger;
         end
         else
         begin
            // Buscar Ramo de Fornecedor
            if sSituacao = 'AT' then Result := FieldByname('TIPOFAVATIVOS').AsInteger     else
            if sSituacao = 'AS' then Result := FieldByname('TIPOFAVASSISTIDOS').AsInteger else
            if sSituacao = 'CA' then Result := FieldByname('TIPOFAVASSISTIDOS').AsInteger else
            if sSituacao = 'PT' then Result := FieldByname('TIPOFAVPATRO').AsInteger      else
            if sSituacao = 'MA' then Result := FieldByname('TIPOFAVMANTIDOS').AsInteger   else
            if sSituacao = 'MP' then Result := FieldByname('TIPOFAVMANTPARC').AsInteger
            else Result := FieldByname('TIPOFAVMANTIDOS').AsInteger;
         end;

      end;

   finally
     qryAux.Free;
   end;
end;



// função que faz o Rateio do documento
function TIntegraEmptmo.LancaRateio(const sCCusto        : String;
                                    const iPrograma      : Int64;
                                          CtrlDocumento  : TCtrlDocumento;
                                    var   rParam         : TParamIntegra;
                                    var   sErro          : TStringList
                                   ): Boolean;
var
   sTipoRecDes : String;
begin
   Result := True;

   try
      if rParam.sRecPag = 'R' then
      begin
         sTipoRecDes := rParam.sTipoRecDesFinan;
      end
      else
      begin
         if rParam.sTipoRecDesFolha <> '' then
         begin
            sTipoRecDes := rParam.sTipoRecDesFolha;
         end
         else
         begin
            sTipoRecDes := rParam.sTipoRecDesFinan;
         end;
      end;

      rParam.iRateioDocum := 0;

      // -------------------------------------------------------------------------------------------

      CtrlDocumento.RateioDocum.SetValues(rParam.fVlrLanc,           // rValor
                                          0,                         // rValorOM
                                          0,                         // rVlrResOrcamen
                                          rParam.iRateioDocum,       // liIDRateioDocum
                                          Sistema.IDEmpresa,         // liIDEmpresa
                                          rParam.iDocumento,         // liCodDocumento
                                          rParam.iUnidNegoc,         // liUnidNegoc
                                          rParam.iMoeda,             // liMoeCodigo
                                          Sistema.IdUsuario,         // liIDUsuarioInclusao
                                          -1,                        // liIDReservaOrcamen
                                          IntegraBack.Plano,         // liPlano
                                          rParam.iPlanPrevContab,    // liIDPlanoPrev
                                          rParam.iPatro,             // liIDPatro
                                          iPrograma,                 // liIDPrograma
                                          0,                         // liIDprocesso,
                                          Sistema.IDEmpresa,         // liIDEmpresa
                                          sTipoRecDes,	            // sCodTipRecDes
                                          rParam.sRecPag,            // sRecPag
                                          rParam.sCentroRespon,      // sCodCentroRespon
                                          sCCusto,                   // sCodCentroCusto
                                          ''                         // sNumImovel
                                         );

      // -------------------------------------------------------------------------------------------

   except

      on E:Exception do
      begin
         sErro.Add(#13 + 'Erro ao Inserir Rateio. Valor: ' + FormatFloat('#,#0.00', rParam.fVlrLanc) + #13);
         sErro.Add(E.Message);
         Result := False;
      end;

   end;
end;



procedure TIntegraEmptmo.MontaParamCAPCAR(const iTipoMov       : Integer;
                                          const iTipoDocRec    : Int64;
                                          const iTipoDocPag    : Int64;
                                          const dDataLanc      : TDateTime;
                                          const dDataVenc      : TDateTime;
                                          const qry            : TwwQuery;
                                          const iMoedaCorrente : Int64;
                                          var   rParam         : TParamIntegra
                                          );
begin
   BuscaParamIntegra('C',
                     rParam,
                     qry,
                     ttFinanceiros,
                     true //Teste renato visoni
                     );

   with qry do
   begin
      rParam.iContrato           := qry.FieldByName('IDCONTRATOEMPTMO').AsFloat;
      rParam.iPessoa             := qry.FieldByName('IDBENEF').AsInteger;
      rParam.sRecPag             := qry.FieldByName('HMERECPAG').AsString;
      rParam.sCCBaixa            := qry.FieldByName('CONTABAIXA').AsString;
      rParam.sDescricao          := qry.FieldByName('ITEDESCRICAO').AsString;
      rParam.sAnoMesCompetencia  := qry.FieldByName('ANOMESCOMPETENCIA').AsString;

      rParam.iParcela            := qry.FieldByName('HMEPARCELA').AsInteger;

//      Marcio Sanches Spinosa SOL 211259 KINTANA 2039215 - Inicio
//      if qry.FieldByName('IDCBANCARIA').AsInteger > 0       then rParam.IDCBancaria    := qry.FieldByName('IDCBANCARIA').AsInteger;
      if qry.FieldByName('IDCBANCARIADEB').AsInteger > 0       then
         rParam.IDCBancaria    := qry.FieldByName('IDCBANCARIADEB').AsInteger
      else
         rParam.IDCBancaria    := qry.FieldByName('IDCBANCARIA').AsInteger;
//      Marcio Sanches Spinosa SOL 211259 KINTANA 2039215 - Fim

      // Conta Bancária para Débito (tudo que não seja concessão)
      if iTipoMov <> 0 then
      begin
         // Marchetti - Pendencia 20906
         if dtmEmptmo.qryParamEmptmoFLGCTABANCOPREF.AsInteger = 0 then
         begin
            if (qry.FieldByName('IDCBANCARIADEB').AsInteger > 0) then
               rParam.IDCBancaria    := qry.FieldByName('IDCBANCARIADEB').AsInteger;
         end
         else
         begin
            // Busca a conta preferencial do mutuário
            dtmLookEmptmo.qryLookDadosBancarios.Close;
            LimpaParametros(dtmLookEmptmo.qryLookDadosBancarios);
            dtmLookEmptmo.qryLookDadosBancarios.ParamByName('PIDPESSOA').AsInteger := qry.FieldByName('IDBENEF').AsInteger;
            dtmLookEmptmo.qryLookDadosBancarios.Open;

            if (not dtmLookEmptmo.qryLookDadosBancarios.IsEmpty) and
               (not dtmLookEmptmo.qryLookDadosBancariosIDCBANCARIA.IsNull) then
                rParam.IDCBancaria := dtmLookEmptmo.qryLookDadosBancariosIDCBANCARIA.AsInteger;
         end;
         // Fim Marchetti - Pendencia 20906
      end;

      if rParam.sRecPag = 'R' then
      begin
         // a Receber
         if not(qry.FieldByName('PORTFORMAREC').IsNull)     then
            rParam.iCodPortForma  := qry.FieldByName('PORTFORMAREC').AsInteger;
         rParam.bEmisBloq  := True;
         rParam.iCodForma  := -1;
         rParam.sDebCre    := 'D';
         rParam.iTipoDoc   := iTipoDocRec;
      end
      else
      begin
         // a Pagar
         if not(FieldByName('PORTFORMAPAG').IsNull)   then
            rParam.iCodPortForma  := qry.FieldByName('PORTFORMAPAG').AsInteger;
         if not(FieldByName('CODFORMAPAG').IsNull)    then
            rParam.iCodForma      := qry.FieldByName('CODFORMAPAG').AsInteger;

         if (rParam.iCodPortForma = -1) and (rParam.iCodForma = -1) then
         begin
            rParam.iCodForma := dtmEmptmo.qryParamEmptmoCODFORMAPAGTO.AsInteger;
         end;

         rParam.bEmisBloq := False;
         rParam.sDebCre   := 'C';
         rParam.iTipoDoc  := iTipoDocPag;

      end; // if rParam.sRecPag

      rParam.iMoeda     := iMoedaCorrente;
      rParam.dDataLanc  := dDataLanc;
      rParam.dDataVenc  := dDataVenc;

   end; // with qry
end;



procedure TIntegraEmptmo.MontaParamFolha(var   rTmpDesc     : TDadosTmpDesc;
                                         var   qry          : TwwQuery;
                                         var   rSitPart     : TSitPart;
                                         const iLote        : Integer;
                                         const iPeriodo     : Integer;
                                         const iExercicio   : Integer;
                                         const sAnoMesCob   : String;
                                         const sHistorico   : String;
                                         bEnvio             : Boolean = False;
                                         bInformativa       : Boolean = False //BRUNO AZEVEDO SOL 123125 KINTANA 612563
                                        );
var
   dDataRef : TDateTime;
begin
   // limpa o record de dados
   LimpaRegistroTmpDesc(rTmpDesc);

   // monta o record de dados

   rTmpDesc.IDPessoa          := qry.FieldByName('IDBENEF').AsInteger;
   rTmpDesc.IDTitular         := qry.FieldByName('IDTITULAR').AsInteger;
   rTmpDesc.IDPessjur         := qry.FieldByName('IDPATRO').AsInteger;
   rTmpDesc.IDPlanoprev       := qry.FieldByName('IDPLANOPREV').AsInteger;
   rTmpDesc.IDPlanoprevContab := qry.FieldByName('IDPLANOPREVCONTAB').AsInteger;
   rTmpDesc.IDLote            := iLote;
   rTmpDesc.IDProvento        := qry.FieldByName('IDRUBRICA').AsInteger;
   rTmpDesc.IDDesconto        := qry.FieldByName('IDCONTRATOEMPTMO').AsFloat;
   rTmpDesc.IDEmpresa         := qry.FieldByName('IDEMPRESA').AsInteger;
   rTmpDesc.IDEmpresaProp     := qry.FieldByName('IDEMPRESA').AsInteger;
   rTmpDesc.Exercicio         := iExercicio;
   rTmpDesc.NoDocumento       := qry.FieldByName('IDCONTRATOEMPTMO').AsFloat;
   rTmpDesc.NumPrioridade     := 1;
   rTmpDesc.Periodo           := iPeriodo;
   rTmpDesc.Plano             := qry.FieldByName('PLANO').AsInteger;
   rTmpDesc.UnidNegoc         := qry.FieldByName('UNIDNEGOC').AsInteger;

   //BRUNO AZEVEDO SOL 123125 KINTANA 612563
   if (bInformativa) then
      begin
      rTmpDesc.FlgDesconto       := 2;
      end
   else
      begin
      rTmpDesc.FlgDesconto       := 1;
      end;

   rTmpDesc.InscricaoNumero   := qry.FieldByName('INSCRICAONUMERO').AsInteger;

   // Tipo de Folha - (B)enefício ou (P)atrocinadora
   rTmpDesc.FlgDescFolha      := qry.FieldByName('HMETIPOFOLHA').AsString;

   dDataRef                   := StrToDate('01/' + Copy(sAnoMesCob, 5, 2) + '/' + Copy(sAnoMesCob, 1, 4));

   rTmpDesc.DataReferencia    := dDataRef;
   rTmpDesc.ComplDocumento    := '1';

   //BRUNO AZEVEDO SOL 123125 KINTANA 612563
   if (bInformativa) then begin
     rTmpDesc.FlgTipoDesc       := 'K';
   end else begin
     rTmpDesc.FlgTipoDesc       := 'E';
   end;

   rTmpDesc.SitEnvio          := '0';
   rTmpDesc.RecPag            := 'P'; // qryConsolida.qry.FieldByName('RECPAG').AsString;
   rTmpDesc.CodCentroCustoC   := qry.FieldByName('CCUSTCRED').AsString;
   rTmpDesc.CodCentroCustoD   := qry.FieldByName('CCUSTDEB').AsString;
   rTmpDesc.CodCentroRespon   := qry.FieldByName('CODCENTRORESPON').AsString;
   rTmpDesc.Matricula         := qry.FieldByName('MATRICULA').AsString;
   rTmpDesc.CodTipRecDes      := qry.FieldByName('TIPORECDES').AsString;
   rTmpDesc.PlaContaD         := qry.FieldByName('CCDEB').AsString;
   rTmpDesc.PlaContaC         := qry.FieldByName('CCCRED').AsString;
   rTmpDesc.TipCodigo         := qry.FieldByName('TIPCODIGO').AsString;
   rTmpDesc.MesCobranca       := sAnoMesCob;

   // -------------------------------------------------------------------------------------
   // ATENÇÂO - Ordem é necessária para que as Folhas de Benefício e Funcionários possam
   //           identificar o registro a baixar
   //           Basta que seja diferente para cada conjunto de registros onde os outros
   //           dados sejam iguais (mescob, mesref, rubrica, etc.)
   //
   // ATENÇÃO - Ordem corresponde agora ao IDHistMovEmptmo, para permitir identificação única
   //           de cada item do histórico a ser baixado

   rTmpDesc.Ordem             := qry.FieldByName('IDHISTMOVEMPTMO').AsFloat;

   // -------------------------------------------------------------------------------------

   rTmpDesc.MesReferencia     := qry.FieldByName('ANOMESCOMPETENCIA').AsString;

   rTmpDesc.FlgAtrasoDevol    := 'N';
   if (rTmpDesc.MesReferencia < rTmpDesc.MesCobranca)   then
       rTmpDesc.FlgAtrasoDevol  := 'A';
   if (Abs(qry.FieldByName('VALOR').AsCurrency) < 0)    then
       rTmpDesc.FlgAtrasoDevol  := 'D';    //SOL 174494 KINTANA 1576368

   rTmpDesc.Referencia        := FormatFloat('000', qry.FieldByName('HMEPARCELA').AsFloat) + '/' +
                                 FormatFloat('000', (qry.FieldByName('HMENUMPARCELAS').AsFloat + qry.FieldByName('HMEPARCELA').AsFloat));

   // ----------------------------------------------------------------------------------------------

   // Marchetti - Pendencia 23083
   rTmpDesc.HmeTipoMov        := qry.FieldByName('HMETIPOMOV').AsInteger;
   // Fim Marchetti - Pendencia 23083

   //BRUNO AZEVEDO SOL 123125 KINTANA 612563
   if (bInformativa) then begin
     rTmpDesc.ValorInfo         := qry.FieldByName('VALOR').AsFloat;    //BRUNO AZEVEDO SOL 141246 KINTANA 892219
   end else begin
     rTmpDesc.ValorInfo         := qry.FieldByName('HMENUMPARCELAS').AsInteger;
   end;

   //BRUNO AZEVEDO SOL 141246 KINTANA 892219
   if ((dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) and (rTmpDesc.FlgTipoDesc <> 'K')) then
   begin
      // Para folha da Caixa, ValorInfo dever ser (Prazo do Contrato - Numero da Pretação + 1)
      rTmpDesc.ValorInfo      := rTmpDesc.ValorInfo + 1;
   end;
   //BRUNO AZEVEDO SOL 141246 KINTANA 892219

   rTmpDesc.Parcela           := qry.FieldByName('HMEPARCELA').AsInteger;
   rTmpDesc.NumParcelas       := qry.FieldByName('HMENUMPARCELAS').AsInteger + qry.FieldByName('HMEPARCELA').AsInteger;

   // ----------------------------------------------------------------------------------------------

   rTmpDesc.CodProvDesc       := qry.FieldByName('CODPROVDESC').AsString;
   rTmpDesc.Descricao         := sHistorico;
   //rTmpDesc.Valor             := abs(qry.FieldByName('VALOR').AsCurrency); // SOL 174494 KINTANA 1576368 retirado o ABS
   rTmpDesc.Valor             := qry.FieldByName('VALOR').AsCurrency; // SOL 174494 KINTANA 1576368 nova linha sem o ABS


   dDataRef := CalcEmptmo.BuscaData('N', // Normal
                                    qry.FieldByName('HMEFORMACOBRANCA').AsString, // Tipo de Cobrança
                                    rSitPart.flgInterno,
                                    qry.FieldByName('IDPATRO').AsInteger,
                                    qry.FieldByName('IDPLANOPREV').AsInteger,
                                    2, // Parcelas, isto é mais de 1 parcela
                                    dDataRef
                                   );



   rTmpDesc.DataCobranca := dDataRef;

   // Marchetti - pendencia 22641

   //Renato Visoni - Query estava levando muito tempo para buscar somento o Tipo do Contrato
   if Not(bEnvio) then begin
     LimpaParametros(dtmEmptmo.qryDadosContrato);
     dtmEmptmo.qryDadosContrato.ParamByName('PIDCONTRATOEMPTMO').AsFloat := qry.FieldByName('IDCONTRATOEMPTMO').AsFloat;
     dtmEmptmo.qryDadosContrato.Open;
   end else begin
     LimpaParametros(dtmEmptmo.QryTpContratoEmp);
     dtmEmptmo.QryTpContratoEmp.ParamByName('PIDCONTRATOEMPTMO').AsFloat := qry.FieldByName('IDCONTRATOEMPTMO').AsFloat;
     dtmEmptmo.QryTpContratoEmp.Open;
   end;
   //Renato Visoni


   rTmpDesc.IDTipoContrEmptmo := dtmEmptmo.QryTpContratoEmp.FieldByName('IDTIPOCONTREMPTMO').AsInteger;



   // Fim Marchetti - pendencia 22641
end;



procedure TIntegraEmptmo.MontaParamRateio(const qry    : TwwQuery;
                                          var   rParam : TParamIntegra;
                                          TipoEnvio    : String = '' // Teste renato visoni
                                          );
begin
   if tipoEnvio ='T' then begin
     rParam.sRecPag             := qry.FieldByName('RecPag').asString;
   end else begin
     rParam.sRecPag             := 'P';
   end;

   rParam.iDocumento          := qry.FieldByName('CODDOCUMENTO').AsInteger;
   rParam.sTipoRecDesFinan    := qry.FieldByName('TIPODESEMB').AsString;
   rParam.sTipoRecDesFolha    := qry.FieldByName('TIPODESEMB').AsString;
   rParam.sCentroRespon       := qry.FieldByName('CENTRORESPON').AsString;
   rParam.fVlrLanc            := qry.FieldByName('VALOR').AsCurrency;
   rParam.iUnidNegoc          := qry.FieldByName('UNIDNEGOC').AsInteger;
   rParam.iPatro              := qry.FieldByName('IDPATRO').AsInteger;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      rParam.iPlanPrevContab  := EntidadeContabil(qry.FieldByName('IDPLANOPREVCONTAB').AsInteger);
   end
   else
   begin
      rParam.iPlanPrevContab  := qry.FieldByName('IDPLANOPREVCONTAB').AsInteger;
   end;
end;



function TIntegraEmptmo.ComparaParam(var rParam1, rParam2: TParamIntegra): Boolean;
begin
   if dtmEmptmo.qryParamEmptmoFLGAGRUPAPARC.AsInteger = 1 then
   begin
      if (rParam1.iPessoa <> rParam2.iPessoa) or (rParam1.iContrato <> rParam2.iContrato) or (rParam1.iParcela <> rParam2.iParcela)then
      begin
         Result := False;
      end
      else
      begin
         Result := True;
      end;
   end
   else
   begin
      if (rParam1.iPessoa <> rParam2.iPessoa) or (rParam1.iContrato <> rParam2.iContrato) then
      begin
         Result := False;
      end
      else
      begin
         Result := True;
      end;
   end;
end;

function TIntegraEmptmo.ComparaParamFolha(var rParam1, rParam2: TDadosTmpDesc): Boolean;
begin
   Result := False;

   if rParam1.IDPessoa           <> rParam2.IDPessoa           then Exit;
   if rParam1.IDTitular          <> rParam2.IDTitular          then Exit;
   if rParam1.IDPessjur          <> rParam2.IDPessjur          then Exit;
   if rParam1.IDPlanoprev        <> rParam2.IDPlanoprev        then Exit;
   if rParam1.IDPlanoprevContab  <> rParam2.IDPlanoprevContab  then Exit;
   if rParam1.IDLote             <> rParam2.IDLote             then Exit;
   if rParam1.IDProvento         <> rParam2.IDProvento         then Exit;
   if rParam1.IDDesconto         <> rParam2.IDDesconto         then Exit;
   if rParam1.IDEmpresa          <> rParam2.IDEmpresa          then Exit;
   if rParam1.IDEmpresaProp      <> rParam2.IDEmpresaProp      then Exit;
   if rParam1.Exercicio          <> rParam2.Exercicio          then Exit;
   if rParam1.NoDocumento        <> rParam2.NoDocumento        then Exit;
   if rParam1.Periodo            <> rParam2.Periodo            then Exit;
   if rParam1.Plano              <> rParam2.Plano              then Exit;
   if rParam1.UnidNegoc          <> rParam2.UnidNegoc          then Exit;
   if rParam1.FlgDesconto        <> rParam2.FlgDesconto        then Exit;
   if rParam1.InscricaoNumero    <> rParam2.InscricaoNumero    then Exit;
   if rParam1.FlgDescFolha       <> rParam2.FlgDescFolha       then Exit;
   if rParam1.DataReferencia     <> rParam2.DataReferencia     then Exit;
   if rParam1.ComplDocumento     <> rParam2.ComplDocumento     then Exit;
   if rParam1.FlgTipoDesc        <> rParam2.FlgTipoDesc        then Exit;
   if rParam1.SitEnvio           <> rParam2.SitEnvio           then Exit;
   if rParam1.RecPag             <> rParam2.RecPag             then Exit;
   if rParam1.CodCentroCustoD    <> rParam2.CodCentroCustoD    then Exit;
   if rParam1.CodCentroRespon    <> rParam2.CodCentroRespon    then Exit;
   if rParam1.Matricula          <> rParam2.Matricula          then Exit;
   if rParam1.CodTipRecDes       <> rParam2.CodTipRecDes       then Exit;
   if rParam1.PlaContaD          <> rParam2.PlaContaD          then Exit;
   if rParam1.TipCodigo          <> rParam2.TipCodigo          then Exit;
   if rParam1.MesCobranca        <> rParam2.MesCobranca        then Exit;
   if rParam1.MesReferencia      <> rParam2.MesReferencia      then Exit;
   if rParam1.FlgAtrasoDevol     <> rParam2.FlgAtrasoDevol     then Exit;
   if rParam1.NumParcelas        <> rParam2.NumParcelas        then Exit;
   if rParam1.CodProvDesc        <> rParam2.CodProvDesc        then Exit;
   if rParam1.Descricao          <> rParam2.Descricao          then Exit;
   if rParam1.DataCobranca       <> rParam2.DataCobranca       then Exit;

   // Marchetti - Pendencia 23083
   if Sistema.TipoCliente <> 19991 then
   begin
      if rParam1.Parcela            <> rParam2.Parcela            then Exit;
      if rParam1.Referencia         <> rParam2.Referencia         then Exit;
      if rParam1.ValorInfo          <> rParam2.ValorInfo          then Exit;
   end
   else
   begin
      if rParam1.HmeTipoMov         = rParam2.HmeTipoMov then
      begin
         if rParam1.Parcela            <> rParam2.Parcela            then Exit;
         if rParam1.Referencia         <> rParam2.Referencia         then Exit;
         if rParam1.ValorInfo          <> rParam2.ValorInfo          then Exit;
      end;
   end;
   // Fim Marchetti - Pendencia 23083
   Result := True;
end;



// função que faz o lançamento do Documento
function TIntegraEmptmo.LancaDocumento(var   rParam         : TParamIntegra;
                                       const fValor         : Currency;
                                       const sHistorico     : String;
                                             CtrlDocumento  : TCtrlDocumento;
                                       var   iPlanilha      : Integer;
                                       var   sErro          : TStringList;
                                       const bHistContrato  : Boolean = True;
                                       sRecPag              : String ='';
                                       pDocumento           : Integer = -1
                                      ): Boolean;
var
   qryAux    : TwwQuery;
   dDataLanc : TDateTime;
   sHistLanc : String;
   sDebCred  : string;
begin
   Result := True;

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try
      try
         sHistLanc := sHistorico;
         if bHistContrato then sHistLanc := sHistLanc + FormatFloat('#0', rParam.iContrato);

         dDataLanc := rParam.dDataLanc;

         if rParam.dDataVenc < rParam.dDataLanc then dDataLanc := rParam.dDataVenc;

         // ----------------------------------------------------------------------------------------

         if pDocumento = -1 then begin
           CtrlDocumento.Lanctodocum.SetValues(dDataLanc,                 // dDataLancto
                                             rParam.iDocumento,         // liCodDocumento
                                             0,                         // liNumLancto
                                             fValor,                    // rVlrLiquido
                                             0,                         // rValorOM
                                             fValor,                    // rValor
                                             -1,                        // liUnidNegoc
                                             iPlanilha,                 // liPlnCodigo

                                             0,                         // liNumlotemanual,
                                             Sistema.IDusuario,         // liIdusuarioinclusao,
                                             Sistema.IDEmpresa,         // liIdempresa,
                                             0,                         // liIdnflivro,
                                             0,                         // liEstorno,
                                             0,                         // liCodtipdoc,
                                             0,                         // liCoddocinss,
                                             0,                         // liCodalterador
                                             '2',                       // sOperacao,
                                             '',                        // sNumrecibo,
                                             '',                        // sNumnf,
                                             '',                        // sNumfatura,
                                             sHistLanc,                 //sHistoricocompl,
                                             '',                        // sFlgtipofatura,
                                             '',                        // sFlgrecebeunf,
                                             '',                        // sFlgfatemitida,
                                             rParam.sDebCre,            // DebCre
                                             15,                        // liIdModulo
                                             IntegraBack.Plano,         // liPlanoConta
                                             True                       // bUsaPlanoPatro
                                            );

         end else begin
           if sRecPag = 'P' then begin
             sDebCred := 'C';
           end else if sRecPag = 'R' then begin
             sDebCred := 'D';
           end;

           CtrlDocumento.Lanctodocum.SetValues(dDataLanc,                 // dDataLancto
                                             pDocumento,                 // liCodDocumento
                                             0,                         // liNumLancto
                                             fValor,                    // rVlrLiquido
                                             0,                         // rValorOM
                                             fValor,                    // rValor
                                             -1,                        // liUnidNegoc
                                             iPlanilha,                 // liPlnCodigo

                                             0,                         // liNumlotemanual,
                                             Sistema.IDusuario,         // liIdusuarioinclusao,
                                             Sistema.IDEmpresa,         // liIdempresa,
                                             0,                         // liIdnflivro,
                                             0,                         // liEstorno,
                                             0,                         // liCodtipdoc,
                                             0,                         // liCoddocinss,
                                             0,                         // liCodalterador
                                             '2',                       // sOperacao,
                                             '',                        // sNumrecibo,
                                             '',                        // sNumnf,
                                             '',                        // sNumfatura,
                                             sHistLanc,                 //sHistoricocompl,
                                             '',                        // sFlgtipofatura,
                                             '',                        // sFlgrecebeunf,
                                             '',                        // sFlgfatemitida,
                                             sDebCred,                  // DebCre
                                             15,                        // liIdModulo
                                             IntegraBack.Plano,         // liPlanoConta
                                             True                       // bUsaPlanoPatro
                                            );

         end;
         // ----------------------------------------------------------------------------------------

         // variável passada como referência que retorna Código
         //   da planilha que contém a contabilização deste lançamento
         rParam.iPlanilha := iPlanilha;

         // ----------------------------------------------------------------------------------------

      except

         on E:Exception do
         begin
            sErro.Add(#13 + 'Erro ao Lançar Documento. Participante: ' + IntToStr(rParam.iPessoa) + #13);
            sErro.Add(E.Message);
            Result := False;
         end;

      end;// try..except

   finally
     qryAux.Free;
   end;
end;



function TIntegraEmptmo.SetMensagem(const iDocumento     : Int64;
                                    const vMsgCnab       : Array of String;
                                          CtrlDocumento  : TCtrlDocumento;
                                    var   sErro          : TStringList
                                   ): Boolean;
begin
   // Operação realizada com sucesso - Retorno da Função
   Result := True;

   try

      if not(CtrlDocumento.IntBanco.SetaMensagensCNAB(iDocumento, -1, vMsgCNAB)) then
      begin
         Result := False;
         Exit;
      end;

   except

      on E:Exception do
      begin
         sErro.Add(#13 + 'ERRO ao inserir Mensagens no Documento: ' + IntToStr(iDocumento) + #13);
         sErro.Add(E.Message);
         Result := False;
      end;

   end;
end;

//***************************************************************
//BRUNO AZEVEDO - VOTO DE EMPRESTIMO - AJUSTES CRIAÇÃO DE OBJETO
Function TIntegraEmptmo.VerificaFlag(sCONTRATO : String): Boolean;     //ALEX
var
sSQL : String;
qryPreparaFlag  : TwwQuery;
Begin
   //Result :=   True;
   Result :=   False;//William Moreira da Silva - SOL 226433 KINTANA 2060252
   try
     qryPreparaFlag                := TwwQuery.Create(Application);
     qryPreparaFlag.DatabaseName   := 'BaseDados';

     sSQL := ' select IDCONTRATOEMPTMO,FLGPERDAEFETIVA     '  + #13 +
             ' from CONTRATOEMPTMO                         '  + #13 +
             ' where IDCONTRATOEMPTMO = '+ trim(sCONTRATO);

           qryPreparaFlag.Close;
           qryPreparaFlag.SQL.Text := sSQL;
           qryPreparaFlag.Open;

           if qryPreparaFlag.FieldByName('FLGPERDAEFETIVA').AsInteger = 1 then
               Result :=   True;
   finally
     FreeAndNil(qryPreparaFlag);
   end;
end;
//BRUNO AZEVEDO - VOTO DE EMPRESTIMO - AJUSTES CRIAÇÃO DE OBJETO
//end;
//end;
//*******************************************


//edilaine SIG101022 : inicio
(* -------------------------------------------------------------------------------------------------
   RecebeValorNegativo:
        Função que faz recebimento de valor negativo antes do Insert na TMPDESC
        Os registros a serem tratados são definidos pela query passada para a função EnviaTMPDESC
   -------------------------------------------------------------------------------------------------
*)
Function TIntegraEmptmo.RecebeValorNegativo(sSQL : String;
                                            sDataLanc : string;
                                            sNomePatro : string;
                                            var  sResult : TStringList;
                                            var  sErro   : TStringList
                                            ): integer;

    procedure AddLista(lista : TStringList;
                       sNumContrato, sIdMov, sMatr, sDescricao : string;
                       iPlano, iPatro, iNumParcela  : integer;
                       rValor, rDesconto, dDtReceb : extended);
    var regnum : integer;
    begin
      lista.AddObject(sIdMov, TBaixaNegativo.create);
      regnum := lista.count-1;
      with TBaixaNegativo(lista.Objects[regnum]) do
      begin
        sContrato    := sNumContrato;
        sItemDescr   := sDescricao;
        sMatricula   := sMatr;
        iIdPlanoprev := iPlano;
        iIdPatro     := iPatro;
        iParcela     := iNumParcela;
        rVlrParcela  := rValor;
        rVlrDesconto := rDesconto;
        rNovoValor   := rValor + rDesconto;
        dDataReceb   := dDtReceb;
      end;
    end;

var
  qryRecebe  : TwwQuery;
  iParcela   : integer;
  rDesconto  : extended;
  lstBaixa   : TStringList;
  lstParcela : TStringList;
  bErroBaixa : boolean;
  sSQLUpdate : string;
  ind        : integer;
  sVlrNovo   : string;
Begin
  lstBaixa   := TStringList.create;
  lstParcela := TStringList.create;

  qryRecebe := TwwQuery.create(nil);
  qryRecebe.DatabaseName := 'BaseDados';

  try
    qryRecebe.Sql.Add('SELECT S.* FROM ( ');
    qryRecebe.Sql.text := qryRecebe.Sql.text + sSQL;
    qryRecebe.Sql.Add(') S ');
    qryRecebe.Sql.Add(' WHERE S.HMEVLRPREVISTO < 0    ');
    qryRecebe.Sql.Add('    OR S.FLGABATENEGATIVO = 1  ');
    qryRecebe.Sql.Add(' ORDER BY ');
    qryRecebe.Sql.Add('    S.IDCONTRATOEMPTMO, S.HMEPARCELA, S.FLGABATENEGATIVO');
   // qryRecebe.SQL.SaveToFile('C:\qryRecebe_sql.txt');
    try
      qryRecebe.Open;
      if qryRecebe.isEmpty then
      begin
         Result := -2;       // Query não retornou registros
         exit;
      end;
    except
       on E:Exception do
       begin
          sErro.Add('ERRO ao tentar selecionar os registros [FOLHA] - ' + sNomePatro);
          sErro.Add(E.Message);
          Result := -1; // ERRO ao tentar selecionar os registros a inserir
          Exit;
       end;
    end;

    rDesconto  := 0;
    iParcela   := qryRecebe.FieldByName('HMEPARCELA').AsInteger;
    bErroBaixa := false;

    repeat
      if qryRecebe.FieldByName('HMEVLRPREVISTO').AsFloat < 0 then
      begin
        rDesconto := rDesconto + qryRecebe.FieldByName('HMEVLRPREVISTO').AsFloat;
        AddLista(lstBaixa,
                 qryRecebe.FieldByName('IDCONTRATOEMPTMO').AsString,
                 qryRecebe.FieldByName('IDHISTMOVEMPTMO').AsString,
                 qryRecebe.FieldByName('MATRICULA').AsString,
                 qryRecebe.FieldByName('ITEDESCRICAO').AsString,
                 qryRecebe.FieldByName('IDPLANOPREV').AsInteger,
                 qryRecebe.FieldByName('IDPATRO').AsInteger,
                 iParcela,
                 qryRecebe.FieldByName('HMEVLRPREVISTO').AsFloat,
                 rDesconto,
                 qryRecebe.FieldByName('HMEDATAVENCTO').AsDateTime);
      end
      else if rDesconto <> 0 then
      begin
        AddLista(lstParcela,
                 qryRecebe.FieldByName('IDCONTRATOEMPTMO').AsString,
                 qryRecebe.FieldByName('IDHISTMOVEMPTMO').AsString,
                 qryRecebe.FieldByName('MATRICULA').AsString,
                 qryRecebe.FieldByName('ITEDESCRICAO').AsString,
                 qryRecebe.FieldByName('IDPLANOPREV').AsInteger,
                 qryRecebe.FieldByName('IDPATRO').AsInteger,
                 iParcela,
                 qryRecebe.FieldByName('HMEVLRPREVISTO').AsFloat,
                 rDesconto,
                 qryRecebe.FieldByName('HMEDATAVENCTO').AsDateTime);
        rDesconto := 0;
      end;

      qryRecebe.next;
      if (rDesconto = 0) then
        iParcela   := qryRecebe.FieldByName('HMEPARCELA').AsInteger;

      if (iParcela <> qryRecebe.FieldByName('HMEPARCELA').AsInteger) and (rDesconto <> 0) then
      begin
        bErroBaixa := true;
        sErro.Add('ERRO ao baixar encargo da parcela: '+IntToStr(iParcela)+'  [FOLHA] - ' + sNomePatro);
        Result := -99;
      end;

    until (qryRecebe.eof) or (bErroBaixa);

    if (rDesconto <> 0) and (not bErroBaixa) then
    begin
      bErroBaixa := true;
      sErro.Add('ERRO ao baixar encargos  [FOLHA] - ' + sNomePatro);
      Result := -99;
    end;


    try
      if (not bErroBaixa) and (lstBaixa.Count > 0) then
      begin
        sResult.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' +'Início baixa de encargos das Parcela ');

        for ind := 0 to lstBaixa.count-1 do
        begin
          // recebe encargos
          sSQLUpdate := 'UPDATE '                                          + #13 +
                        '    HISTMOVEMPTMO '                               + #13 +
                        'SET '                                             + #13 +
                        '    FLGBAIXADO     = 1, '                         + #13 +
                        '    HMEVLREFETIVO  = HMEVLRPREVISTO*-1, '         + #13 +
                        '    HMEDATAEFETIVA = TO_DATE('+QuotedStr(sDataLanc)+', ''DD/MM/YYYY''), ' + #13 +
                       // '    HMEDATARECEB   = TO_DATE('+datetoSTR(QuotedStr(TBaixaNegativo(lstBaixa.Objects[ind]).dDataReceb))+', ''DD/MM/YYYY'') ' + #13 +
                        '    HMEDATARECEB   = TO_DATE('''+DateToStr(TBaixaNegativo(lstBaixa.Objects[ind]).dDataReceb)+''', ''DD/MM/YYYY'') ' + #13 +
                        'WHERE '                                           + #13 +
                        '    IDHISTMOVEMPTMO in ('+lstBaixa.Strings[ind]+')';

          dtmEmptmo.qryAux.Close;
          dtmEmptmo.qryAux.Sql.Clear;
          dtmEmptmo.qryAux.Sql.Text := sSQLUpdate;
          dtmEmptmo.qryAux.ExecSql;

          sResult.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                      CompletaInicio(TBaixaNegativo(lstBaixa.Objects[ind]).sContrato, ' ', 15) + ' ' +
                      CompletaFim(TBaixaNegativo(lstBaixa.Objects[ind]).sMatricula, ' ', 13) + ' ' +
                      CompletaFim(FormatFloat(#0, TBaixaNegativo(lstBaixa.Objects[ind]).iIdPlanoPrev), ' ', 5) + ' ' +
                      CompletaFim(FormatFloat(#0, TBaixaNegativo(lstBaixa.Objects[ind]).iIdPatro), ' ', 5) + ' ' +
                      CompletaInicio(FormatFloat('#0', TBaixaNegativo(lstBaixa.Objects[ind]).iParcela), ' ', 7) + ' ' +
                      CompletaFim(TBaixaNegativo(lstBaixa.Objects[ind]).sItemDescr, ' ', 21) + ' ' +
                      CompletaInicio(FormatFloat('#0.00', TBaixaNegativo(lstBaixa.Objects[ind]).rVlrParcela), ' ', 14)+ ' ' +
                      CompletaFim('[Baixado]', ' ', 11)+ ' ' +
                      CompletaFim(' ',' ', 13)
                     );
        end;

        // atualiza valor parcela
        for ind := 0 to lstParcela.count-1 do
        begin
          sVlrNovo := OraNumero(FloatToStr(TBaixaNegativo(lstParcela.Objects[ind]).rNovoValor));

          sSQLUpdate := 'UPDATE '                                          + #13 +
                        '    HISTMOVEMPTMO '                               + #13 +
                        'SET '                                             + #13 +
                        '    HMEVLRPREVISTO = '+ sVlrNovo                  + #13 +
                        'WHERE '                                           + #13 +
                        '    IDHISTMOVEMPTMO = '+lstParcela.Strings[ind];

          dtmEmptmo.qryAux.Close;
          dtmEmptmo.qryAux.Sql.Clear;
          dtmEmptmo.qryAux.Sql.Text := sSQLUpdate;
          dtmEmptmo.qryAux.ExecSql;

          sResult.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                      CompletaInicio(TBaixaNegativo(lstParcela.Objects[ind]).sContrato, ' ', 15) + ' ' +
                      CompletaFim(TBaixaNegativo(lstParcela.Objects[ind]).sMatricula, ' ', 13) + ' ' +
                      CompletaFim(FormatFloat(#0, TBaixaNegativo(lstParcela.Objects[ind]).iIdPlanoPrev), ' ', 5) + ' ' +
                      CompletaFim(FormatFloat(#0, TBaixaNegativo(lstParcela.Objects[ind]).iIdPatro), ' ', 5) + ' ' +
                      CompletaInicio(FormatFloat('#0', TBaixaNegativo(lstParcela.Objects[ind]).iParcela), ' ', 7) + ' ' +
                      CompletaFim(TBaixaNegativo(lstParcela.Objects[ind]).sItemDescr, ' ', 21) + ' ' +
                      CompletaInicio(FormatFloat('#0.00', TBaixaNegativo(lstParcela.Objects[ind]).rVlrParcela), ' ', 14)+ ' ' +
                      CompletaFim('[Desconto: ', ' ', 11)+ ' ' +
                      CompletaFim(FormatFloat('#0.00', TBaixaNegativo(lstParcela.Objects[ind]).rVlrDesconto)+']',' ', 13)
                     );

        end;
        sResult.Add(' ');

      end;
    except
       on E:Exception do
       begin
          sErro.Add('ERRO ao tentar receber valores negativos [FOLHA] - ' + sNomePatro);
          sErro.Add(E.Message);
          Result := -99;
       end;
    end;

  finally
     if lstParcela <> nil then
     begin
       for ind := 0 to lstParcela.count-1 do
          lstParcela.Objects[ind].destroy;
       lstParcela.Free;
     end;

     FreeAndNil(qryRecebe);
     FreeAndNil(lstBaixa);
  end;
end;
//edilaine SIG101022 : fim



(* -------------------------------------------------------------------------------------------------
   EnviaTMPDESC: Função que prepara o Insert na TMPDESC, em batch.
                 Os registros a serem inseridos são definidos pela query que será
                 passada para a função
   -------------------------------------------------------------------------------------------------
   O SQL a ser passado deverá ser um SELECT na HistMovEmptmo, com as seguintes características
   obigatórias:

   SELECT
      H.IDHISTMOVEMPTMO       ID do Histórico
      H.IDCONTRATOEMPTMO      ID do Contrato
      TC.IDTIPOCONTREMPTMO    ID do Tipo de Contrato
      H.IDITEMEMPTMO          ID do Item a ser contabilizado
      C.IDPLANOPREV           ID do Plano Previdencial
      C.IDPATRO               ID da Patrocinadora
      H.HMEVLRPREVISTO        Valor a ser contabilizado
      H.HMEFORMACOBRANCA      'F' = Folha   |__ define quais contas a usar na contabilização
                              'C' = CaP/CaR |
   WHERE
      TE.IDEMPRESAPROP =      Filtrar obrigatoriamente por Sistema.IDEmpresa

   ORDER BY
      HMEANOCOMPETENCIA, HMEMESCOMPETENCIA, H.IDCONTRATOEMPTMO

   -------------------------------------------------------------------------------------------------
   Parâmetros:

      sSQL           :  SQL que será usado para buscar os registros (ver acima)
      dDataLanc

      sResult        :  linhas "de acerto" que serão exibidas, se for o caso
      sErro          :  linhas "de erro" que serão exibidas, se for o caso

      sHistorico     :  Histórico-padrão a ser inserido na TMPDESC

   -------------------------------------------------------------------------------------------------
   Códigos de retorno (controle de erro):
       0 : Envio realizado com sucesso
      -1 : ERRO ao tentar selecionar os registros a inserir
      -2 : Query não retornou registros
      -3 : ERRO ao tentar criar tabela para agrupamento
      -4 : Processo interrompido pelo usuário sem o Insert na TMPDESC
      -5 : ERRO na busca de Parâmetros Contábeis
      -6 : ERRO - ambigüidade de Parâmetros Contábeis



--------------------------------------------------------------------------------------------------*)
function TIntegraEmptmo.EnviaTMPDESC(const sSQL       : String;
                                     const sHistorico : String;
                                     const sNomePatro : String;
                                     const sAnoMesCob : String;
                                     const dDataLanc  : TDateTime;
                                     var   sResult    : TStringList;
                                     var   sErro      : TStringList;
                                     const iPatro     : Integer;
                                     var   iLote      : Integer;
                                     var   iTotalReg  : Integer;
                                     var   fTotalPatro: Currency;
                                     const iAgrupa    : Integer;
                                     bInformativa: Boolean = False;
                                     bAtualizaEnvio: Boolean = True; //BRUNO AZEVEDO SOL 153430 KINTANA 1156998
                                     bEnviarFolhaResgate : Integer = 0; // MARCIO SANCHES SPINOSA SOL 169010 KINTANA 1495798
                                     qryEnviaPgtoResgate : TwwQuery = nil  // TADEU PASSOS SOL 182258 KINTANA 1697187
                                     ): Integer;
var
   sModulo              : String;
   sMatricula           : String;
   sTipoDocumento       : String;
   sMsgErroTestaPeriodo : String;
   iEmpresa             : Integer;
   iExercicio           : Integer;
   iPeriodo             : Integer;
   iResultBusca, i      : Integer;
   TabelaPDX            : TTable;
   qryPreparaTmpDesc    : TwwQuery;

   qryPreparaFlag       : TwwQuery;

   rPreparaParamIntegra	: TParamIntegra;
   sSQLUpdate           : String;
   fNovoSaldoDev        : Currency;
   sSqlEnvioSusp        : String;
   sIteDescricao        : String;
   sFlgTipoDesc         : String;
   fChaveTMPDESC        : Extended;
   sInsere              : String;
   bPgtoEmpResgate      : Boolean; // TADEU PASSOS SOL 182258 KINTANA 1697187
begin
   // Retorno da Função
   Result := 0;
   sInsere := '';

   // TADEU PASSOS SOL 182258 KINTANA 1697187
   // Parâmetro que defini se a função EnviaTMPDESC foi chamada da tela de Pagamento de Empréstimo com Resgate (FPagtoEmprestimoResgate)
   bPgtoEmpResgate := False;

   // cria a query que busca os registros a serem inseridos na TMPDESC
   qryPreparaTmpDesc                := TwwQuery.Create(Application);
   qryPreparaTmpDesc.DatabaseName   := 'BaseDados';

   //Pendência 24800 - 21/03/2007 - Alberto
   CtrlLancamento := TCtrlLancamento.Create;
   CtrlLancamento.Initialize(dtmBaseDados.dbBaseDados,
                           true,
                           Sistema.ConnectionType,
                           Sistema.ConnectionSide
                          );

   CtrlPeriodo := TCtrlPeriodo.Create;
   CtrlPeriodo.initializeas( CtrlLancamento );
   CtrlPeriodo.OnMessageInfo := nil;

   CtrlContab := TCtrlContab.Create;
   CtrlContab.initializeas( CtrlLancamento );
   //Fim Pendência 24800

   try
      try

         // TADEU PASSOS SOL 182258 KINTANA 1697187
         // enviaResgateQry = nil significa que a função EnviaTMPDESC não foi chamada da tela Pagamento de Emprésticmo com Resgate (FPagtoEmprestimoResgate)
         if qryEnviaPgtoResgate = nil then
           MostraEspera(sNomePatro + ' - Selecionando Contratos para Envio...');
         try
           // TADEU PASSOS SOL 182258 KINTANA 1697187
           // enviaResgateQry <> nil significa que a função EnviaTMPDESC foi chamada da tela Pagamento de Emprésticmo com Resgate (FPagtoEmprestimoResgate).
           // E qryPreparaTmpDesc recebe uma query já carregada
           if qryEnviaPgtoResgate <> nil then
           begin
             qryPreparaTmpDesc := qryEnviaPgtoResgate;
             bPgtoEmpResgate := True;
           end
           else
           begin

             // -------------------------------------------------------------------------------------------
             // Verifica recebimento de valores negativos
             // -------------------------------------------------------------------------------------------
            // if (bEnviarFolhaResgate = 1) and (not bInformativa) then
                Result := RecebeValorNegativo(sSQL, DateToStr(dDataLanc), sNomePatro, sResult, sErro);    //edilaine SIG101022


              qryPreparaTmpDesc.SQL.Text := sSql;
            //Jéssica Lana SOL 114575 24/04/2009
            //qryPreparaTmpDesc.SQL.SaveToFile(Sistema.TempDir + 'EP-ItensEnvioTMPDESC.txt');
              qryPreparaTmpDesc.SQL.SaveToFile(ftempregra + '\' + 'EP-ItensEnvioTMPDESC.txt');
              qryPreparaTmpDesc.Open;
           end;

         except
            on E:Exception do
            begin
               sErro.Add('ERRO ao tentar selecionar os registros [FOLHA] - ' + sNomePatro);
               sErro.Add(E.Message);
               Result := -1; // ERRO ao tentar selecionar os registros a inserir
               Exit;
            end;
         end; // try..except do Open da qry

      finally
         // EscondeEspera; não pode ser chamado após o "open", pois o fetch demora
      end; // try..finally do Open da qry


      if qryPreparaTmpDesc.isEmpty then
      begin
         sErro.Add('Não foram encontrados itens a enviar [FOLHA] - ' + sNomePatro);
         Result := -2;  // Query não retornou registros
         Exit;
      end;// if qry is Empty

      // -------------------------------------------------------------------------------------------

      // gera novo Lote - apenas se já não houver sido passado um lote
     //SOL 149320 KINTANA 1067557

      if iLote = -1 then
      begin
         iLote := LeUltRegistro(nil, 'CTRLINTERFACE');
         sInsere := 'INSERE'
      end
      else
         sInsere := '' ;
      //SOL 149320 KINTANA 1067557
      // -------------------------------------------------------------------------------------------
      //    Manipulação da tabela Paradox temporária
      // -------------------------------------------------------------------------------------------
      // exclui a tabela temporária Paradox
      if not(IntegraEmptmo.ExcluiTabelaPDX('TMPEMPTMO.DB', TabelaPDX)) then
      begin
         sErro.Add('Erro ao Excluir Tabela Temporária.');
         Result := -3;  // não conseguir excluir tabela temporária
         Exit;
      end;

      // prepara a criação da tabela
      try
         IntegraEmptmo.CriaTabelaPDX('TMPEMPTMO.DB', TabelaPDX);
      except
         on E:Exception do
         begin
            sErro.Add('ERRO ao tentar criar tabela para agrupamento [FOLHA] - ' + sNomePatro);
            sErro.Add(E.Message);
            Result := -3;  // não conseguir criar tabela temporária
            Exit;
         end;// on
      end;// try..except da criação da tabela

      // define a estrutura da tabela
      if not(DefineEstruturaTabelaTEMP(TabelaPDX)) then
      begin
         sErro.Add('ERRO ao tentar criar tabela para agrupamento [FOLHA] - ' + sNomePatro);
         Result := -3;  // não conseguir criar tabela temporária
         Exit;
      end;
      // -------------------------------------------------------------------------------------------
      //    FIM Manipulação da tabela Paradox temporária
      // -------------------------------------------------------------------------------------------

      // faz o TestaPeriodo apenas aqui, pois a Data de Lançamento será única
      iEmpresa       := Sistema.idEmpresa;
      sModulo        := '15';
      vFlagVerifica := VerificaFlag(trim(qryPreparaTmpDesc.FieldByName('IDCONTRATOEMPTMO').AsString));
      //Pendência 24800 - 21/03/2007 - Alberto
      CtrlPeriodo.RetornaPeriodoExercicioData( iEmpresa, FormatDateTime('dd/mm/yyyy', dDataLanc) );
      iPeriodo   := CtrlPeriodo.Periodo;
      iExercicio := CtrlPeriodo.Exercicio;

      if (CtrlPeriodo.TestaPeriodoBloqueadoProc(iEmpresa, tbBloqueado, iPeriodo, iExercicio, False)) or
         (not CtrlContab.TestaDataBloqueadaProc(iEmpresa, 15, FormatDateTime('dd/mm/yyyy', dDataLanc))) then
      begin
         sMsgErroTestaPeriodo := CtrlPeriodo.MessageInfo + ' ' + CtrlContab.MessageInfo;
         //Fim Pendência 24800
         // mensagem de erro de TestaPeriodo
         sErro.Add(sMsgErroTestaPeriodo +  '-  ERRO - ' + sNomePatro);
      end
      else
      begin
         // Primeiro Registro
         qryPreparaTmpDesc.First;

         i := 0;

         // TADEU PASSOS SOL 182258 KINTANA 1697187
         // Se false significa que a função EnviaTMPDESC não foi chamada da tela Pagamento de Emprésticmo com Resgate (FPagtoEmprestimoResgate)
         if not bPgtoEmpResgate then
           begin
             EscondeEspera;
             frmProgresso.MostraFormProgresso(sNomePatro + ' - Preparando Contratos para envio...',
                                              True,
                                              True,
                                              True,
                                              0,
                                              qryPreparaTmpDesc.RecordCount
                                             );
           end;

         // Laço de todos os registros que serão gravados na TmpDesc
         while not(qryPreparaTmpDesc.EOF) do
         begin
            // -------------------------------------------------------------------------------------
            //    Tratamento para atualização do Saldo Dev se houve suspensão
            // -------------------------------------------------------------------------------------
//                                                     qryPreparaTmpDesc.FieldByName('IDCONTRATOEMPTMO').AsInteger
            // Faz a atualização do saldo devedor, caso o mesmo não tenha sido atualizado na geração do item
            fNovoSaldoDev := qryPreparaTmpDesc.FieldByname('HMESALDODEV').AsCurrency;


            if not(qryPreparaTmpDesc.FieldByName('IDTIPOSUSPEMPTMO').IsNull) then
            begin
               sSQLEnvioSusp := 'SELECT '     + #13 +
                                ' ' + qryPreparaTmpDesc.FieldByName('IDCONTRATOEMPTMO').AsString   + ' AS IDCONTRATOEMPTMO, '  + #13 +
                                ' ' + qryPreparaTmpDesc.FieldByName('IDTIPOSUSPEMPTMO').AsString   + ' AS IDTIPOSUSPEMPTMO  '  + #13 +
                                'FROM DUAL ';

               if qryPreparaTmpDesc.FieldByName('HMETIPOMOV').AsInteger > 0 then
               begin
                  if not(qryPreparaTmpDesc.FieldByName('FLGATUALSALDOENV').IsNull) and
                     (qryPreparaTmpDesc.FieldByName('FLGATUALSALDOENV').AsInteger = 1) then
                  begin
                     case qryPreparaTmpDesc.FieldByname('ITCTRATASALDODEV').AsInteger of
                        // 0: Não Tratar
                        1: fNovoSaldoDev := fNovoSaldoDev - qryPreparaTmpDesc.FieldByname('HMEVLRPREVISTO').AsCurrency; // Abater
                        2: fNovoSaldoDev := fNovoSaldoDev + qryPreparaTmpDesc.FieldByname('HMEVLRPREVISTO').AsCurrency; // Incorporar
                     end;// case

                     sSQLUpdate := 'UPDATE '                                          + #13 +
                                   '    HISTMOVEMPTMO '                               + #13 +
                                   'SET '                                             + #13 +
                                   '    HMESALDODEV = ' + NumeroIngles(fNovoSaldoDev) + #13 +
                                   'WHERE '                                           + #13 +
                                   '    IDHISTMOVEMPTMO = ' + qryPreparaTmpDesc.FieldByname('IDHISTMOVEMPTMO').AsString;

                     dtmEmptmo.qryAux.Close;
                     dtmEmptmo.qryAux.Sql.Clear;
                     dtmEmptmo.qryAux.Sql.Text := sSQLUpdate;
                     dtmEmptmo.qryAux.ExecSql;
                  end;
               end;
            end;
            // -------------------------------------------------------------------------------------
            //    Fim Tratamento para atualização do Saldo Dev se houve suspensão
            // -------------------------------------------------------------------------------------


            inc(i);

           // TADEU PASSOS SOL 182258 KINTANA 1697187
           // Se false significa que a função EnviaTMPDESC não foi chamada da tela Pagamento de Emprésticmo com Resgate (FPagtoEmprestimoResgate)
            if not bPgtoEmpResgate then
              frmProgresso.AndaFormProgresso(i);

            // Verifica se o usuário Cancelou a Operação
            if frmProgresso.Cancelou then
            begin
              sErro.Add('Processo interrompido pelo usuário. Não houve envio [FOLHA] - ' + sNomePatro);
              Result := -4;
              Exit;
            end;// if Cancelou

            // Busca os Parâmetros de Integração
            iResultBusca := IntegraEmptmo.BuscaParamIntegra('C',
                                                            rPreparaParamIntegra,
                                                            qryPreparaTmpDesc,
                                                            ttTmpDesc,
                                                            True //Renato
                                                            );

            case iResultBusca of
              -5: sErro.Add('ERRO na busca de Parâmetros Contábeis [FOLHA] - ' + sNomePatro);
              -6: sErro.Add('ERRO - ambigüidade de Parâmetros Contábeis [FOLHA] - ' + sNomePatro);
               0:
               begin
                  // Conseguiu buscar os Parâmetros Contábeis

                  if not(GravaTabelaTemp(TabelaPDX,
                                         qryPreparaTmpDesc,
                                         rPreparaParamIntegra,
                                         dDataLanc,
                                         iExercicio,
                                         iPeriodo
                                        )) then
                  begin
                     sErro.Add(sNomePatro + ' - [FOLHA] ERRO ao inserir na tabela temporária - ' +
                               qryPreparaTmpDesc.FieldByName('IDPESSOA').AsString);
                  end; // if GravaTabelaTemp

               end; // 0
            end;// case

            Application.ProcessMessages;

            try
               sMatricula  := qryPreparaTmpDesc.FieldByName('MATRICULA').AsString;
            except
               sMatricula  := '               ';
            end;

            sTipoDocumento := '             ';

            sIteDescricao := EmptyStr;
            if (Assigned(qryPreparaTmpDesc.FindField('ITEDESCRICAO'))) then
            begin
              sIteDescricao := qryPreparaTmpDesc.FieldByName('ITEDESCRICAO').Asstring;
            end;

            sFlgTipoDesc := EmptyStr;

            if (Assigned(qryPreparaTmpDesc.FieldByName('FLGTIPODESC'))) then
            begin
              sFlgTipoDesc := qryPreparaTmpDesc.FieldByName('FLGTIPODESC').Asstring; //Fanuel Junior SOL168123 Kintana1480953
            end;


            sResult.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' +
                        CompletaInicio(FormatFloat('#0', qryPreparaTmpDesc.FieldByName('IDCONTRATOEMPTMO').AsFloat), ' ', 15) + ' ' +
                        CompletaFim(sMatricula, ' ', 13) + ' ' +
                        CompletaFim(FormatFloat(#0, qryPreparaTmpDesc.FieldByName('IDPLANOPREV').AsFloat), ' ', 5) + ' ' +
                        CompletaFim(FormatFloat(#0, qryPreparaTmpDesc.FieldByName('IDPATRO').AsFloat), ' ', 5) + ' ' +
                        CompletaInicio(FormatFloat('#0', qryPreparaTmpDesc.FieldByName('HMEPARCELA').AsFloat), ' ', 7) + ' ' +
                        CompletaFim(sIteDescricao, ' ', 21) + ' ' +  // SOL 141496 KINTANA 897024
                        CompletaInicio(FormatFloat('#0.00', qryPreparaTmpDesc.FieldByName('HMEVLRPREVISTO').AsFloat), ' ', 14)+ ' ' +
                        CompletaFim(sFlgTipoDesc, ' ', 11)+ ' ' + //SOL 141496 KINTANA 897024
                        CompletaFim(sTipoDocumento,' ', 13)
                       );

            // Próximo registro
            qryPreparaTmpDesc.Next;

         end;// while

         // TADEU PASSOS SOL 182258 KINTANA 1697187
         // Se false significa que a função EnviaTMPDESC não foi chamada da tela Pagamento de Emprésticmo com Resgate (FPagtoEmprestimoResgate)
         if not bPgtoEmpResgate then
           frmProgresso.EscondeFormProgresso;


         // ----------------------------------------------------------------------------------------
         //    Inserção propriamente dita na TMPDESC
         // ----------------------------------------------------------------------------------------
         // MARCIO SANCHES SPINOSA SOL 169010 KINTANA 1495798 - INICIO
         if sInsere = 'INSERE' then  //  SOL 149320 KINTANA 1067557
         begin
           if not(IntegraEmptmo.InsertCtrlInterface(iLote, iTotalReg, iPatro, sAnoMesCob, fTotalPatro, bEnviarFolhaResgate)) then
           begin
             // TADEU PASSOS SOL 182258 KINTANA 1697187
             // Se false significa que a função EnviaTMPDESC não foi chamada da tela Pagamento de Emprésticmo com Resgate (FPagtoEmprestimoResgate)
             if not bPgtoEmpResgate then
               sErro.Add('ERRO ao inserir na CTRLINTERFACE - ' + sNomePatro)
             else
               Result := -99; // TADEU PASSOS SOL 182258 KINTANA 1697187

           end;
         end
         else
         begin
             if not (IntegraEmptmo.UpdateCtrlInterface(iLote,bEnviarFolhaResgate)) then
             begin
               // TADEU PASSOS SOL 182258 KINTANA 1697187
               // Se false significa que a função EnviaTMPDESC não foi chamada da tela Pagamento de Emprésticmo com Resgate (FPagtoEmprestimoResgate)
               if not bPgtoEmpResgate then
                   sErro.Add('ERRO ao atualizar na CTRLINTERFACE - ' + sNomePatro)
               else
                 Result := -99; // TADEU PASSOS SOL 182258 KINTANA 1697187
             end;
         end;
         // MARCIO SANCHES SPINOSA SOL 169010 KINTANA 1495798 - FIM
         // if ConsolidaInsTempDesc

         // ----------------------------------------------------------------------------------------
         if not(ConsolidaInsTmpDesc(sNomePatro,
                                    sHistorico,
                                    sAnoMesCob,
                                    iLote,
                                    iExercicio,
                                    iPeriodo,
                                    sErro,
                                    iTotalReg,
                                    fTotalPatro,
                                    iAgrupa,
                                    True,  //Renato Visoni
                                    bInformativa, //BRUNO AZEVEDO SOL 123125 KINTANA 612563
                                    bAtualizaEnvio //BRUNO AZEVEDO SOL 153430 KINTANA 1156998
                                    bPgtoEmpResgate, // TADEU PASSOS SOL 182258 KINTANA 1697187
                                   )) then
         begin
            // TADEU PASSOS SOL 182258 KINTANA 1697187
            // Se false significa que a função EnviaTMPDESC não foi chamada da tela Pagamento de Emprésticmo com Resgate (FPagtoEmprestimoResgate)
            if not bPgtoEmpResgate then
              sErro.Add('ERRO ao inserir na TMPDESC - ' + sNomePatro)
            else
              Result := -99; // TADEU PASSOS SOL 182258 KINTANA 1697187
         end;// if ConsolidaInsTempDesc

         // ----------------------------------------------------------------------------------------
         //    FIM Inserção propriamente dita na TMPDESC
         // ----------------------------------------------------------------------------------------
      end; // if TestaPeriodo

   finally
      // TADEU PASSOS SOL 182258 KINTANA 1697187
      // Se false significa que a função EnviaTMPDESC não foi chamada da tela Pagamento de Emprésticmo com Resgate (FPagtoEmprestimoResgate), senão libera qryEnviaPgtoResgate
      if not bPgtoEmpResgate then
        begin
          frmProgresso.EscondeFormProgresso;
          qryPreparaTmpDesc.Free;
        end
      else
        qryEnviaPgtoResgate := nil; // TADEU PASSOS SOL 182258 KINTANA 1697187

      //Pendência 24800 - 21/03/2007 - Alberto
      FreeAndNil( CtrlLancamento );
      FreeAndNil( CtrlPeriodo );
      FreeAndNil( CtrlContab );
      //Fim Pendência 24800

      if TabelaPDX <> nil then TabelaPDX.Close;
      if TabelaPDX <> nil then TabelaPDX.Free;
   end;
end;



procedure TIntegraEmptmo.LimpaRegistroTmpDesc(var Registro: TDadosTmpDesc);
begin
   with Registro do
   begin
      IdPessoa          := 0;
      IdTitular         := 0;
      IdPessjur         := 0;
      IdPlanoprev       := 0;
      IdLote            := 0;
      IdProvento        := 0;
      IdDesconto        := 0;
      IdEmpresa         := 0;
      IdEmpresaProp     := 0;
      IdMotivo          := 0;
      CodAlterador      := 0;
      CodPortForma      := 0;
      CodTipDoc         := 0;
      Exercicio         := 0;
      NoDocumento       := 0;
      NumPrioridade     := 0;
      Ordem             := 0;
      Periodo           := 0;
      Plano             := 0;
      PlnCodigoPrev     := 0;
      UnidNegoc         := 0;
      FlgDesconto       := 0;
      InscricaoNumero   := 0;
      FlgAtrasoDevol    := '';
      FlgDescFolha      := '';
      FlgTipoDesc       := '';
      RecPag            := '';
      SitEnvio          := '';
      CodCentroCustoC   := '';
      CodCentroCustoD   := '';
      CodCentroRespon   := '';
      Matricula         := '';
      CodTipRecDes      := '';
      PlaContaD         := '';
      PlaContaC         := '';
      TipCodigo         := '';
      ComplDocumento    := '';
      MesCobranca       := '';
      MesReferencia     := '';
      Referencia        := '';
      CodProvDesc       := '';
      Descricao         := '';
      DataReferencia    := 0;
      DataCobranca      := 0;
      Valor             := 0;
      ValorInfo         := 0;
      Parcela           := 0;
      NumParcelas       := 0;

   end;// with
end;



function TIntegraEmptmo.InsertCtrlInterface(const iIDLote   : Int64;
                                            const iNumReg   : Int64;
                                            const iPatro    : Int64;
                                            const sMesRef   : String;
                                            const fValor    : Currency;
                                            isEnviaFolhaResgate : integer // MARCIO SANCHES SPINOSA SOL 169010 KINTANA 1495798
                                           ): Boolean;
begin
   // função que grava na tabela CTRLINTERFACE, tendo como saída True se a operação foi
   //   bem sucedida e False caso negativo
   with dtmIntegraEmptmo.qryInsertCtrlInterface do
   begin
      LimpaParametros(dtmIntegraEmptmo.qryInsertCtrlInterface);

      ParamByName('PIDLOTE').AsInteger            := iIDLote;
      ParamByName('PTIPO').AsString               := 'E';
      ParamByName('PDATAIDATMP').AsDate           := SysDate;
      ParamByName('PFLGIDATMP').AsInteger         := 1;
      ParamByName('PFLGVOLTATMP').AsInteger       := 0;
      ParamByName('PVLRTOTAL').AsCurrency         := fValor;
      ParamByName('PIDPESSOA').AsInteger          := iPatro;
      ParamByName('PNUMREG').AsInteger            := iNumReg;
      ParamByName('PMESREFERENCIA').AsString      := sMesRef;
      ParamByName('PFLGIDAINTERFACE').AsInteger   := 0;
      ParamByName('PFLGVOLTAINTERFACE').AsInteger := 0;
      ParamByName('PFLGRESGATE').AsInteger        := isEnviaFolhaResgate;

      try
         ExecSQL;
         Result := True;
      except
         Result := False;
      end; // try..except

   end;// with
end;



function TIntegraEmptmo.InsertTmpDesc(const Registro  : TDadosTmpDesc;
                                      const IDTmpDesc : Extended;
                                      const fValor    : Currency
                                     ): Boolean;
var
   sMesR, sMesC   : String;
   IDContratoAnt  : Extended;
   dDataInicio    : TDateTime;
begin
   // função que grava na tabela TMPDESC, tendo como saída True se a operação foi
   //   bem sucedida e False caso negativo
   with dtmIntegraEmptmo.qryInsertTmpDesc do
   begin
      LimpaParametros(dtmIntegraEmptmo.qryInsertTmpDesc);

      // -------------------------------------------------------------------------------------------
      // O Módulo é "cravado" em 15, pq o envio pode ser gerado pelo AdmPrev e
      // o módulo PRECISA ser o Empréstimo
      ParamByName('PIDMODULO').AsInteger     := 15;
      ParamByName('PSISTORIGEM').AsInteger   := 15;
      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------

      ParamByName('PIDTMPDESC').AsFloat      := IDTmpDesc;

      // -------------------------------------------------------------------------------------------

      if Registro.IdPessoa  > 0           then ParamByName('PIDPESSOA').AsInteger         := Registro.IdPessoa;
      if Registro.IdTitular > 0           then ParamByName('PIDTITULAR').AsInteger        := Registro.IdTitular;
      if Registro.IdPessjur > 0           then ParamByName('PIDPESSJUR').AsInteger        := Registro.IdPessjur;
      if Registro.IdPlanoprev > 0         then ParamByName('PIDPLANOPREV').AsInteger      := Registro.IdPlanoprev;
      if Registro.IdPlanoprevContab > 0   then ParamByName('PIDPLANPREVCONTAB').AsInteger := Registro.IdPlanoprevContab;
      if Registro.NoDocumento > 0         then ParamByName('PNODOCUMENTO').AsFloat        := Registro.NoDocumento;
      if Registro.CodAlterador > 0        then ParamByName('PCODALTERADOR').AsInteger     := Registro.CodAlterador;
      if Registro.Plano > 0               then ParamByName('PPLANO').AsInteger            := Registro.Plano;
      if Registro.Ordem > 0               then ParamByName('PORDEM').AsFloat              := Registro.Ordem;
      if Registro.CodPortForma > 0        then ParamByName('PCODPORTFORMA').AsInteger     := Registro.CodPortForma;
      if Registro.UnidNegoc > 0           then ParamByName('PUNIDNEGOC').AsInteger        := Registro.UnidNegoc;
      if Registro.Periodo > 0             then ParamByName('PPERIODO').AsInteger          := Registro.Periodo;
      if Registro.InscricaoNumero > 0     then ParamByName('PINSCRICAONUMERO').AsInteger  := Registro.InscricaoNumero;
      if Registro.IdLote > 0              then ParamByName('PIDLOTE').AsInteger           := Registro.IdLote;
      if Registro.FlgDesconto > 0         then ParamByName('PFLGDESCONTO').AsInteger      := Registro.FlgDesconto;
      if Registro.CodTipDoc > 0           then ParamByName('PCODTIPDOC').AsInteger        := Registro.CodTipDoc;
      if Registro.NumPrioridade > 0       then ParamByName('PNUMPRIORIDADE').AsInteger    := Registro.NumPrioridade;
      if Registro.IdProvento > 0          then ParamByName('PIDPROVENTO').AsInteger       := Registro.IdProvento;
      if Registro.IdEmpresa > 0           then ParamByName('PIDEMPRESA').AsInteger        := Registro.IdEmpresa;
      if Registro.IdMotivo > 0            then ParamByName('PIDMOTIVO').AsInteger         := Registro.IdMotivo;
      if Registro.Exercicio > 0           then ParamByName('PEXERCICIO').AsInteger        := Registro.Exercicio;
      if Registro.PlnCodigoPrev > 0       then ParamByName('PPLNCODIGOPREV').AsInteger    := Registro.PlnCodigoPrev;
      if Registro.IdDesconto > 0          then ParamByName('PIDDESCONTO').AsFloat         := Registro.IdDesconto;
      if Registro.IdEmpresaProp > 0       then ParamByName('PIDEMPRESAPROP').AsInteger    := Registro.IdEmpresaProp;
      if Registro.Matricula <> ''         then ParamByName('PMATRICULA').AsString         := Registro.Matricula;
      if Registro.TipCodigo <> ''         then ParamByName('PTIPCODIGO').AsString         := Registro.TipCodigo;

      // -------------------------------------------------------------------------------------------

      // Acerto do formato de MESREF e MESCOB - inserção da "/"

      if Registro.MesReferencia <> '' then
      begin
         sMesR := copy(Registro.MesReferencia, 1, 4) + '/' + copy(Registro.MesReferencia, 5, 2);
         ParamByName('PMESREFERENCIA').AsString := sMesR;
      end;

      if Registro.MesCobranca <> '' then
      begin
         sMesC := copy(Registro.MesCobranca, 1, 4) + '/' + copy(Registro.MesCobranca, 5, 2);
         ParamByName('PMESCOBRANCA').AsString   := sMesC;
      end;

      // -------------------------------------------------------------------------------------------

      if Registro.Descricao <> ''         then ParamByName('PDESCRICAO').AsString         := Registro.Descricao;
      if Registro.ComplDocumento <> ''    then ParamByName('PCOMPLDOCUMENTO').AsString    := Registro.ComplDocumento;
      if Registro.FlgTipoDesc <> ''       then ParamByName('PFLGTIPODESC').AsString       := Registro.FlgTipoDesc;
      if Registro.CodCentroCustoD <> ''   then ParamByName('PCODCENTROCUSTOD').AsString   := Registro.CodCentroCustoD;
      if Registro.CodCentroCustoC <> ''   then ParamByName('PCODCENTROCUSTOC').AsString   := Registro.CodCentroCustoC;
      if Registro.CodCentroRespon <> ''   then ParamByName('PCODCENTRORESPON').AsString   := Registro.CodCentroRespon;
      if Registro.PlaContaD <> ''         then ParamByName('PPLACONTAD').AsString         := Registro.PlaContaD;
      if Registro.PlaContaC <> ''         then ParamByName('PPLACONTAC').AsString         := Registro.PlaContaC;
      if Registro.FlgAtrasoDevol <> ''    then ParamByName('PFLGATRASODEVOL').AsString    := Registro.FlgAtrasoDevol;
      if Registro.CodTipRecDes <> ''      then ParamByName('PCODTIPRECDES').AsString      := Registro.CodTipRecDes;

      // -------------------------------------------------------------------------------------------

      if Registro.FlgDescFolha <> ''      then ParamByName('PFLGDESCFOLHA').AsString      := Registro.FlgDescFolha;

      if Registro.FlgDescFolha = 'P' then
      begin
         if Registro.CodProvDesc <> ''    then ParamByName('PCODPROVDESC').AsString       := Registro.CodProvDesc;
      end;

      // -------------------------------------------------------------------------------------------

      if Registro.SitEnvio <> ''          then ParamByName('PSITENVIO').AsString          := Registro.SitEnvio;

      if Registro.Referencia <> ''        then ParamByName('PREFERENCIA').AsString        := Registro.Referencia;
      if Registro.RecPag <> ''            then ParamByName('PRECPAG').AsString            := Registro.RecPag;
      if Registro.DataReferencia <> 0     then ParamByName('PDATAREFERENCIA').AsDate      := Registro.DataReferencia;
      if Registro.DataCobranca <> 0       then ParamByName('PDATACOBRANCA').AsDate        := Registro.DataCobranca;


      if Registro.ValorInfo <> 0          then ParamByName('PVALORINFO').AsFloat          := Registro.ValorInfo;
      if Registro.Parcela <> 0            then ParamByName('PPARCELA').AsInteger          := Registro.Parcela;
      if Registro.NumParcelas <> 0        then ParamByName('PNUMPARCELAS').AsInteger      := Registro.NumParcelas;

      // -------------------------------------------------------------------------------------------
            
      if Sistema.TipoCliente = 19991 then
      begin
         // Marchetti - Pendencia 22641
         dDataInicio := BuscaDataInicioTipoContr(Registro.IDPessoa, Registro.IDTipoContrEmptmo);

         if dDataInicio = -1 then
         // Fim Marchetti - Pendencia 22641

            // André Pontes - 25/01/2006 - pendência 21214
            dDataInicio := BuscaDataInicio(Registro.IDDesconto);
            // FIM André Pontes - 25/01/2006 - pendência 21214

            ParamByName('PDATAINICIO').AsDateTime      := dDataInicio;
      end;

      // -------------------------------------------------------------------------------------------
      // Como o envio passa a ser agrupado, o valor é o parâmetro passado para a função (já acumulado),
      // e não mais o valor do registro
      // if fValor <> 0 then   ParamByName('PVALOR').AsCurrency    := abs(fValor); // Vinicius Ferreira SOL 176629 KINTANA 1614326 //edilaine - SIG101022
      //if fValor <> 0 then   ParamByName('PVALOR').AsCurrency    := fValor; // Vinicius Ferreira SOL 176629 KINTANA 1614326 //edilaine - SIG101022 // Leandro - WO12789
      if fValor <> 0 then   ParamByName('PVALOR').AsCurrency    := abs(fValor); // Vinicius Ferreira SOL 176629 KINTANA 1614326 //edilaine - SIG101022 // Leandro - WO12789
      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------

      try

        ExecSQL;
        Result := True;
      except
         Result := False;
      end;

   end;  // with dtmIntegraEmptmo.qryInsertTmpDesc do
end;



function TIntegraEmptmo.MarcaBaixaTMPDESC(const IDTmpDesc: Extended): Boolean;
begin
   Result := True;

   // Atualiza TMPDESC com SITENVIO = 9
   try
      with dtmIntegraEmptmo.qryUpdateTmpDesc do
      begin
         LimpaParametros(dtmIntegraEmptmo.qryUpdateTmpDesc);
         ParamByName('PIDTMPDESC').AsFloat := IDTmpDesc;
         ExecSql;
      end;
   except
      Result := False;
   end;
end;

function TIntegraEmptmo.DefineEstruturaTabelaTEMP(var T: TTable): Boolean;
begin
   Result := True;

   try
      // define a estrutura da tabela
      T.FieldDefs.Clear;
      T.FieldDefs.Add('IDTMPDESC',           ftFloat,     0, False);
      T.FieldDefs.Add('IDHISTMOVEMPTMO',     ftFloat,     0, False);
      T.FieldDefs.Add('HMEVLRPREVISTO',      ftFloat,     0, False);
      T.FieldDefs.Add('DATALANCTO',          ftDate,      0, False);
      T.FieldDefs.Add('IDTITULAR',           ftInteger,   0, False);
      T.FieldDefs.Add('IDBENEF',             ftInteger,   0, False);
      T.FieldDefs.Add('IDPATRO',             ftInteger,   0, False);
      T.FieldDefs.Add('IDPLANOPREV',         ftInteger,   0, False);
      T.FieldDefs.Add('IDPLANOPREVCONTAB',   ftInteger,   0, False);
      T.FieldDefs.Add('IDRUBRICA',           ftInteger,   0, False);
      T.FieldDefs.Add('IDCONTRATOEMPTMO',    ftFloat,     0, False);
      T.FieldDefs.Add('IDEMPRESA',           ftInteger,   0, False);
      T.FieldDefs.Add('EXERCICIO',           ftInteger,   0, False);
      T.FieldDefs.Add('PERIODO',             ftInteger,   0, False);
      T.FieldDefs.Add('PLANO',               ftInteger,   0, False);
      T.FieldDefs.Add('UNIDNEGOC',           ftInteger,   0, False);
      T.FieldDefs.Add('INSCRICAONUMERO',     ftInteger,   0, False);
      T.FieldDefs.Add('ANOMESCOMPETENCIA',   ftString,    6, False);
      T.FieldDefs.Add('CCUSTDEB',            ftString,   10, False);
      T.FieldDefs.Add('CCUSTCRED',           ftString,   10, False);
      T.FieldDefs.Add('CODCENTRORESPON',     ftString,   10, False);
      T.FieldDefs.Add('MATRICULA',           ftString,   13, False);
      T.FieldDefs.Add('CCDEB',               ftString,   18, False);
      T.FieldDefs.Add('CCCRED',              ftString,   18, False);
      T.FieldDefs.Add('TIPCODIGO',           ftString,    2, False);
      T.FieldDefs.Add('TIPORECDES',          ftString,   15, False);
      T.FieldDefs.Add('RECPAG',              ftString,    1, False);
      T.FieldDefs.Add('CODPROVDESC',         ftString,   15, False);
      T.FieldDefs.Add('HMEFORMACOBRANCA',    ftString,    1, False);
      T.FieldDefs.Add('ITCPRIORIDADE',       ftInteger,   0, False);
      T.FieldDefs.Add('HMEPARCELA',          ftInteger,   0, False);
      T.FieldDefs.Add('HMENUMPARCELAS',      ftInteger,   0, False);
      T.FieldDefs.Add('HMETIPOFOLHA',        ftString,    1, False);

      // Marchetti - Pendencia 23083
      T.FieldDefs.Add('HMETIPOMOV',          ftInteger,   0, False);
      // Fim Marchetti - Pendencia 23083

      // cria efetivamente a tabela
      T.CreateTable;
      T.Open;

   except
      Result := False;
   end;
end;



function TIntegraEmptmo.GravaTabelaTemp(var   T                : TTable;
                                        const qry              : TwwQuery;
                                        const rParamIntegra    : TParamIntegra;
                                        const dDataLanc        : TDateTime;
                                        const iExercicio       : Integer;
                                        const iPeriodo         : Integer
                                       ): Boolean;
var
   sSQL	             : String;
   qryAux             : TwwQuery;
   sAnoMesCompetencia : String;
begin
   // Operação realizada com sucesso - Retorno da Função
   Result := True;

   // Cria a Query Auxiliar
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   sAnoMesCompetencia := qry.FieldByName('ANOMESCOMPETENCIA').AsString;

   //*****************************************************************************
   // Marchetti - 21/07/2003
   // Implementada a solução abaixo para que a Folha possa agrupar por referencia
   // e rubrica
   //*****************************************************************************
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      if qry.FieldByName('HMETIPOMOV').AsInteger = 4 then
      begin
         sSQL :=
         'SELECT '                                                                      + #13 +
         '   (LTRIM(RTRIM(TO_CHAR(HMEANOCOMPETENCIA, ''0000'')))) '                     + #13 +
         '   || '                                                                       + #13 +
         '   (LTRIM(RTRIM(TO_CHAR(HMEMESCOMPETENCIA, ''00'')))) AS ANOMESCOMPETENCIA '  + #13 +
         'FROM '                                                                        + #13 +
         '  HISTMOVEMPTMO '                                                             + #13 +
         'WHERE '                                                                       + #13 +
         '      IDCONTRATOEMPTMO = ' + qry.FieldByName('IDCONTRATOEMPTMO').AsString     + #13 +
         '  AND HMEPARCELA       = ' + qry.FieldByName('HMEPARCELA').AsString           + #13 +
         '  AND HMETIPOMOV       = 1 '                                                  + #13 +
         '  AND (NVL(FLGESTORNADO,0) = 0) ';  // renato visoni NVL

         qryAux.Close;
         qryAux.SQL.Text := sSQL;
         qryAux.Open;

         if not(qryAux.IsEmpty) then sAnoMesCompetencia := qryAux.FieldByName('ANOMESCOMPETENCIA').AsString;
      end;
   end;
   //*****************************************************************************
   //*****************************************************************************

   if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) then
   begin

      if trim(qry.FieldByName('IDRUBRICA').AsString) = EmptyStr then
      begin
         MessageDlg('Rubrica não informada.', mtError, [mbOK], 0);
         abort;
      end;

      sSQL :=
      'SELECT '                                                                                + #13 +
      '	 DECODE(R.CODPROVDESC,NULL,SUBSTR(P.CODPROVDESC,1,4),R.CODPROVDESC) AS CODPROVDESC '   + #13 +
      'FROM '                                                                                  + #13 +
      '  RUBRICAXPESS R, PROVDESC P '                                                          + #13 +
      'WHERE '                                                                                 + #13 +
      '      R.IDPESSOA   = ' + qry.FieldByName('IDPATRO').AsString                            + #13 +
      '  AND P.IDPROVENTO = ' + qry.FieldByName('IDRUBRICA').AsString                          + #13 +
      '  AND P.IDPROVENTO = R.IDRUBRICA(+) ';

   end
   else
   begin
      sSQL :=
      'SELECT '                                                         + #13 +
      '	 CODPROVDESC '                                                 + #13 +
      'FROM '                                                           + #13 +
      '  RUBRICAXPESS '                                                 + #13 +
      'WHERE '                                                          + #13 +
      '      IDPESSOA   = ' + qry.FieldByName('IDPATRO').AsString       + #13 +
      '  AND IDRUBRICA  = ' + qry.FieldByName('IDRUBRICA').AsString;
   end;

   try
      qryAux.Close;
      qryAux.SQL.Text := sSQL;
      qryAux.Open;

      T.Append;
      T.FieldByName('IDHISTMOVEMPTMO').AsFloat     := rParamIntegra.iHistorico;
      //T.FieldByName('HMEVLRPREVISTO').AsFloat      := abs(rParamIntegra.fVlrLanc); // SOL 174494 KINTANA 1576368 comentado para retirada do ABS
      T.FieldByName('HMEVLRPREVISTO').AsFloat      := rParamIntegra.fVlrLanc;  // SOL 174494 KINTANA 1576368 nova linha sem o ABS
      T.FieldByName('DATALANCTO').AsDateTime       := dDataLanc;
      T.FieldByName('ANOMESCOMPETENCIA').AsString  := sAnoMesCompetencia;
      T.FieldByName('IDBENEF').AsInteger           := qry.FieldByName('IDBENEF').AsInteger;
      T.FieldByName('IDTITULAR').AsInteger         := qry.FieldByName('IDPESSOA').AsInteger;
      T.FieldByName('IDPATRO').AsInteger           := rParamIntegra.iPatro;
      T.FieldByName('IDPLANOPREV').AsInteger       := rParamIntegra.iPlanoPrev;
      T.FieldByName('IDPLANOPREVCONTAB').AsInteger := rParamIntegra.iPlanPrevContab;
      T.FieldByName('IDRUBRICA').AsInteger         := qry.FieldByName('IDRUBRICA').AsInteger;
      T.FieldByName('IDCONTRATOEMPTMO').AsFloat    := qry.FieldByName('IDCONTRATOEMPTMO').AsFloat;
      T.FieldByName('IDEMPRESA').AsInteger         := Sistema.IDEmpresa;
      T.FieldByName('EXERCICIO').AsInteger         := iExercicio;
      T.FieldByName('PERIODO').AsInteger           := iPeriodo;
      T.FieldByName('PLANO').AsInteger             := rParamIntegra.iPlano;
      T.FieldByName('UNIDNEGOC').AsInteger         := rParamIntegra.iUnidNegoc;
      T.FieldByName('INSCRICAONUMERO').AsInteger   := qry.FieldByName('INSCRICAONUMERO').AsInteger;
      T.FieldByName('CODCENTRORESPON').AsString    := rParamIntegra.sCentroRespon;
      T.FieldByName('MATRICULA').AsString          := qry.FieldByName('MATRICULA').AsString;
      T.FieldByName('TIPCODIGO').AsString          := rParamIntegra.sTipoPer;
      T.FieldByName('TIPORECDES').AsString         := rParamIntegra.sTipoRecDesFolha;
      T.FieldByName('RECPAG').AsString             := qry.FieldByName('HMERECPAG').AsString;
      T.FieldByName('CODPROVDESC').AsString        := qryAux.FieldByName('CODPROVDESC').AsString;
      T.FieldByName('HMEFORMACOBRANCA').AsString   := qry.FieldByName('HMEFORMACOBRANCA').AsString;
      T.FieldByName('ITCPRIORIDADE').AsInteger     := qry.FieldByName('ITCPRIORIDADE').AsInteger;
      T.FieldByName('HMEPARCELA').AsInteger        := qry.FieldByName('HMEPARCELA').AsInteger;
      T.FieldByName('HMENUMPARCELAS').AsInteger    := qry.FieldByName('HMENUMPARCELAS').AsInteger;

      T.FieldByName('HMETIPOFOLHA').AsString       := qry.FieldByName('HMETIPOFOLHA').AsString;

      // se o valor for negativo, inverte as contas e etc de débito/crédito
      if Abs(rParamIntegra.fVlrLanc) < 0 then  // SOL 174494 KINTANA 1576368 colocado o ABS para funcionar como era antes pq não inseria valores negativos
      begin
         T.FieldByName('CCDEB').AsString           := rParamIntegra.sContaCFolha;
         T.FieldByName('CCCRED').AsString          := rParamIntegra.sContaDFolha;

         if rParamIntegra.sCentroCustoDFolha <> '' then  T.FieldByName('CCUSTDEB').AsString  := rParamIntegra.sCentroCustoCFolha;
         if rParamIntegra.sCentroCustoCFolha <> '' then  T.FieldByName('CCUSTCRED').AsString := rParamIntegra.sCentroCustoDFolha;
      end
      else
      begin
         T.FieldByName('CCDEB').AsString           := rParamIntegra.sContaDFolha;
         T.FieldByName('CCCRED').AsString          := rParamIntegra.sContaCFolha;

         if rParamIntegra.sCentroCustoDFolha <> '' then  T.FieldByName('CCUSTDEB').AsString  := rParamIntegra.sCentroCustoDFolha;
         if rParamIntegra.sCentroCustoCFolha <> '' then  T.FieldByName('CCUSTCRED').AsString := rParamIntegra.sCentroCustoCFolha;

      end;

      // Marchetti - Pendencia 23083
      T.FieldByName('HMETIPOMOV').AsInteger        := qry.FieldByName('HMETIPOMOV').AsInteger;
      // Fim Marchetti - Pendencia 23083

      try
         T.Post;

      except
         Result := False;
      end;

   finally
      qryAux.Close;
      qryAux.Free;
   end;
end;



function TIntegraEmptmo.ConsolidaInsTmpDesc(const sNomePatro   : String;
                                            const sHistorico   : String;
                                            const sAnoMesCob   : String;
                                            const iLote        : Integer;
                                            const iExercicio   : Integer;
                                            const iPeriodo     : Integer;
                                            var   sErro        : TStringList;
                                            var   iTotalReg    : Integer;
                                            var   fTotalPatro  : Currency;
                                            const iAgrupa      : Integer;
                                            bEnvio             : Boolean = False; //Renato Visoni
                                            bInformativa       : Boolean = False; //BRUNO AZEVEDO SOL 123125 KINTANA 612563
                                            bAtualizaEnvio     : Boolean = True;
                                            bPgtoEmpResgate    : Boolean = False  // TADEU PASSOS SOL 182258 KINTANA 1697187
                                            ): Boolean;
var
   qryConsolida   : TwwQuery;
   rTmpDescAnt    : TDadosTmpDesc;
   rTmpDescAtu    : TDadosTmpDesc;
   rSitPart       : TSitPart;
   sSQL           : String;
   dDataRef       : TDateTime;
   i, j, k        : Integer;
   fVlrTotal      : Currency;
   vHistMov       : array of Extended;
   IDTmpDesc      : Extended;
   iCount         : Integer; //Renato Visoni

begin
   // Retorno da Função
   Result := True;
   iCount := 0; //Renato Visoni
   // ----------------------------------------------------------------------------------------------

   sSQL :=
   'SELECT '                                                               + #13 +
   '  HMEVLRPREVISTO AS VALOR, HMETIPOMOV, '                               + #13 +
   '  IDHISTMOVEMPTMO, '                                                   + #13 +
   '  IDTMPDESC, '                                                         + #13 +
   '  ANOMESCOMPETENCIA, IDTITULAR, IDBENEF, '                             + #13 +
   '  IDPLANOPREV, IDPLANOPREVCONTAB, '                                    + #13 +
   '  IDEMPRESA , IDPATRO, '                                               + #13 +
   '  CODCENTRORESPON  , IDRUBRICA, TIPORECDES , MATRICULA ,  RECPAG , '   + #13 +
   '  IDCONTRATOEMPTMO , EXERCICIO, HMEPARCELA , TIPCODIGO ,  PERIODO, '   + #13 +
   '  INSCRICAONUMERO  , CCUSTDEB , DATALANCTO , UNIDNEGOC ,  CCCRED , '   + #13 +
   '  CCUSTCRED, CODPROVDESC, CCDEB, PLANO, '                              + #13 +
   '  HMEFORMACOBRANCA , HMETIPOFOLHA, '                                   + #13 +
   '  HMENUMPARCELAS, ITCPRIORIDADE '                                      + #13 +
   'FROM '                                                                 + #13 +
   '  "TMPEMPTMO.DB" TMPEMPTMO ';

   // ----------------------------------------------------------------------------------------------

   if (dtmEmptmo.qryParamEmptmoFLGAGRUPAPARCFOL.AsInteger = 1) then
   begin
      sSQL := sSQL + #13 +
   'ORDER BY '                                                             + #13 +

   '   IDCONTRATOEMPTMO, HMEFORMACOBRANCA, HMETIPOFOLHA, HMETIPOMOV, HMEPARCELA, IDRUBRICA, CCDEB '    + #13;
   end;

   // ----------------------------------------------------------------------------------------------

   qryConsolida := TwwQuery.Create(Application);

   try
      qryConsolida.Close;
   //Jéssica Lana SOL 114575 24/04/2009
   //qryConsolida.DataBaseName  := copy(Sistema.TempDir, 1, length(Sistema.TempDir) - 1);
   //qryConsolida.DataBaseName  := copy(ftempregra + '\' , 1, length(ftempregra) - 1);
     qryConsolida.DataBaseName  := ftempregra;
     qryConsolida.SQL.Text      := sSql;

     try
       // TADEU PASSOS SOL 182258 KINTANA 1697187
       // Se false significa que a função EnviaTMPDESC não foi chamada da tela Pagamento de Emprésticmo com Resgate (FPagtoEmprestimoResgate)
        if not bPgtoEmpResgate then
          MostraEspera(sNomePatro + ' - Agrupando Contratos para envio...');

        qryConsolida.Open;
     finally
        EscondeEspera;
     end;


      // executa todos os lançamentos a débito
      with qryConsolida do
      begin
         // SUM retona sempre um registro mesmo que ZERADO
         if ( (RecordCount < 1) or (isEmpty) or (FieldByName('IDBENEF').AsInteger = 0) ) then
         begin
            Result := False;
            Exit;
         end;

         iTotalReg   := 0;
         fTotalPatro := 0;

         First;

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         MontaParamFolha(rTmpDescAnt, qryConsolida, rSitPart, iLote, iPeriodo, iExercicio, sAnoMesCob, sHistorico,true, bInformativa); // Renato Visoni TRUE
         MontaParamFolha(rTmpDescAtu, qryConsolida, rSitPart, iLote, iPeriodo, iExercicio, sAnoMesCob, sHistorico,true, bInformativa); // Renato Visoni TRUE
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------

         // TADEU PASSOS SOL 182258 KINTANA 1697187
         // Se false significa que a função EnviaTMPDESC não foi chamada da tela Pagamento de Emprésticmo com Resgate (FPagtoEmprestimoResgate)
         if not bPgtoEmpResgate then
           begin
             i := 0;
             frmProgresso.MostraFormProgresso(sNomePatro + ' - Enviando...',
                                              True,
                                              True,
                                              True,
                                              0,
                                              RecordCount,
                                             );
           end;

         while not(qryConsolida.EOF) do
         begin
            k           := 0; // tamanho do vetor de IDHistMovEmptmo
            fVlrTotal   := 0; // valor total a inserir na TmpDesc (agrupamento)

            // -------------------------------------------------------------------------------------
            // compara os campos-chaves do registro 'ATUAL' com o 'ANTERIOR'
            // -------------------------------------------------------------------------------------
            while ( not(qryConsolida.EOF)
                    and (ComparaParamFolha(rTmpDescAnt, rTmpDescAtu))
                    and ( (dtmEmptmo.qryParamEmptmoFLGAGRUPAPARCFOL.AsInteger = 1) or (k = 0) )
                  ) do
            begin
               inc(k);
               SetLength(vHistMov, k);

               fVlrTotal      := fVlrTotal + rTmpDescAtu.Valor;
               vHistMov[k-1]  := rTmpDescAtu.Ordem;

               // TADEU PASSOS SOL 182258 KINTANA 1697187
               // Se false significa que a função EnviaTMPDESC não foi chamada da tela Pagamento de Emprésticmo com Resgate (FPagtoEmprestimoResgate)
               if not bPgtoEmpResgate then
                 begin
                   inc(i);
                   frmProgresso.AndaFormProgresso(i);
                 end;

               qryConsolida.Next; // qryConsolida - loop interno - EOF + compara

               MontaParamFolha(rTmpDescAtu, qryConsolida, rSitPart, iLote, iPeriodo, iExercicio, sAnoMesCob, sHistorico,true, bInformativa); // Renato Visoni TRUE
            end;  // while de comparação
            // -------------------------------------------------------------------------------------
            //
            // -------------------------------------------------------------------------------------

            IDTmpDesc := LeUltRegistro(nil, 'TMPDESC');

            // função que grava o record de dados na tabela TMPDESC, tendo como saída True
            //   se a operação foi bem sucedida e False caso negativo
            if not(InsertTmpDesc(rTmpDescAnt, IDTmpDesc, fVlrTotal)) then   //SALVA AQUI EM tmpdesc ALEX
            begin
               // Operação com Erro - Não inseriu na TMPDESC
               sErro.Add('Erro ao inserir na TMPDESC - Contrato ' + FormatFloat('#0', rTmpDescAtu.IDDesconto));
               sErro.Add(' ');

               // Retorno da função indicará que houve pelo menos 1 registro com erro
               Result := False;
            end
            else
            begin
               // Operação bem sucedida - INSERIU na TMPDESC
               inc(iTotalReg);
               fTotalPatro := fTotalPatro + fVlrTotal;

               // TADEU PASSOS SOL 182258 KINTANA 1697187
               // Se false significa que a função EnviaTMPDESC não foi chamada da tela Pagamento de Emprésticmo com Resgate (FPagtoEmprestimoResgate)
               if not bPgtoEmpResgate then
               begin
                 //BRUNO AZEVEDO SOL 123125 KINTANA 612563
                 if (bAtualizaEnvio) then begin   //BRUNO AZEVEDO SOL 153430 KINTANA 1156998
                   for k := 0 to (length(vHistMov) - 1) do
                   begin
                      // Faz update na tabela HISTMOVEMPTMO com o FLGENVIO para enviado (NULL)
                      if not(AtualizaHistoricoComFlgEnvio(vHistMov[k], IDTmpDesc, sErro)) then
                      begin
                         sErro.Add(sNomePatro + ' - [FOLHA] Erro ao atualizar situação de envio do Contrato ' +
                                   FormatFloat('#0', rTmpDescAtu.IDDesconto));
                         sErro.Add(' ');
                      end;


                      //Ádler Souza - SOL 137847 KTN 836194
                      InsertHistEnvioEmptmo(vHistMov[k],'',floatToStr(IDTmpDesc));
                      //Fim - Ádler Souza - SOL 137847 KTN 836194

                      Application.ProcessMessages;
                   end;
                 end;
               end;
            end;

            MontaParamFolha(rTmpDescAnt, qryConsolida, rSitPart, iLote, iPeriodo, iExercicio, sAnoMesCob, sHistorico,true, bInformativa);// Renato Visoni TRUE
             //alex

            //Renato Visoni
            if bEnvio then begin
              Inc(iCount);
              if (iCount = 600) or (qryConsolida.Eof) then begin
                if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
                if (Not(dtmBaseDados.dbBaseDados.InTransaction)) and (Not(qryConsolida.Eof)) then StartTransacao;
                iCount := 0;
              end;
            end;
            //Renato Visoni


            //Pendência 26326 - 11/10/2007 - Alberto
            //inc(i);
            //frmProgresso.AndaFormProgresso(i);
            //Fim Pendência 26326
         end;  // while
      end;  // with



   finally
     // TADEU PASSOS SOL 182258 KINTANA 1697187
     // Se false significa que a função EnviaTMPDESC não foi chamada da tela Pagamento de Emprésticmo com Resgate (FPagtoEmprestimoResgate)
     if not bPgtoEmpResgate then
       frmProgresso.EscondeFormProgresso;

      qryConsolida.Free;

      Finalize(vHistMov);
   end;
end;



// Verifica se é possível excluir a folha
function TIntegraEmptmo.VerificaExclusaoFolha(const IDContratoEmptmo : Extended;
                                              const IDTmpDesc        : Extended;
                                              const IDHistMovEmptmo  : Extended;
                                              const sMesCobranca     : String = ''
                                             ): Integer;
begin
   Result := 0;

   with dtmIntegraEmptmo.qryVerificaExclusaoTmpDesc do
   begin
      LimpaParametros(dtmIntegraEmptmo.qryVerificaExclusaoTmpDesc);

      ParamByName('PIDDESCONTO').AsFloat := IDContratoEmptmo;

      if IDTmpDesc > 0 then       ParamByName('PIDTMPDESC').AsFloat        := IDTmpDesc;
      if IDHistMovEmptmo > 0 then ParamByName('PIDHISTMOVEMPTMO').AsFloat  := IDHistMovEmptmo;
      if sMesCobranca <> '' then  ParamByName('PMESCOBRANCA').AsString     := sMesCobranca;

      Open;

      if RecordCount > 0 then Result := -1;

      Close;
   end;
end;



//	Função que exclui todas as parcelas de um participante na TMPDESC
function TIntegraEmptmo.ExcluiTMPDESCPorMes(const IDContratoEmptmo : Extended;
                                            const IDHistMovEmptmo  : Extended;
                                            const sMesCobranca     : String;
                                            const bMostraMsg       : Boolean
                                           ): Boolean;
var
   qryLimpaTmpDesc   : TwwQuery;
   sMsg              : String;
begin
   sMsg    	:= '';
   Result   := True;

   // ----------------------------------------------------------------------------------------------

   if VerificaExclusaoFolha(IDContratoEmptmo, -1, IDHistMovEmptmo, sMesCobranca) < 0 then
   begin
      sMsg   := 'Os registros já foram processados pela(s) Folha(s)';
      Result := False;
      Exit;
   end;

   // ----------------------------------------------------------------------------------------------

   with dtmIntegraEmptmo.qryLimpaIDTmpDescPorHist do
   begin
      LimpaParametros(dtmIntegraEmptmo.qryLimpaIDTmpDescPorHist);
      ParamByName('PIDHISTMOVEMPTMO').AsFloat := IDHistMovEmptmo;
      ExecSQL;
   end;

   with dtmIntegraEmptmo.qryExcluiTMPDESC do
   begin
      LimpaParametros(dtmIntegraEmptmo.qryExcluiTMPDESC);

      ParamByName('PIDDESCONTO').AsFloat   := IDContratoEmptmo;
      if IDHistMovEmptmo > 0  then ParamByName('PORDEM').AsFloat        := IDHistMovEmptmo;
      if sMesCobranca <> ''   then ParamByName('PMESCOBRANCA').AsString := sMesCobranca;
   end;

   try
      dtmIntegraEmptmo.qryExcluiTMPDESC.ExecSQL;
   except
      sMsg    	:= 'Erro ao excluir registros na TMPDESC.';
      Result	:= False;
   end;

   if ( (bMostraMsg) and (Trim(sMsg) <> '') ) then MsgDlg(sMsg, 'Empréstimo', mtError, [mbOk], 0);
end;



function TIntegraEmptmo.ExcluiFinanceiro(const fDocumento : Extended;
                                         var   sMsg       : String
                                        ): Integer;
//Pendência 26441 - 29/07/2007 - Marchetti
var
   CtrlDocumento : TCtrlDocumento;
//Fim Pendência 26441
begin
   Result   := 0;
   sMsg     := '';
 
   // ----------------------------------------------------------------------------------------------
 
   if trunc(fDocumento) = 0 then Exit;
 
   // ----------------------------------------------------------------------------------------------
 
   Result := VerificaDocumento(fDocumento, sMsg);
   // -6: 'Documento está contido e estornado em um Lote.'
   // -5: 'O Documento já está contido em um Lote. A operação não pode ser efetuada.';
   // -4: 'Não foi encontrado documento.';
   // -3: 'O Documento já foi baixado. A operação não pode ser efetuada.';
   // -2: 'Arquivo de pagamento já enviado. A operação não pode ser efetuada.';
   // -1: 'ERRO'
 
   // ----------------------------------------------------------------------------------------------

   try
 
      //Pendência 26441 - 29/07/2007 - Marchetti
      CtrlDocumento := TCtrlDocumento.Create;
      CtrlDocumento.Initialize(dtmBaseDados.dbBaseDados,
                               True,
                               Sistema.ConnectionType,
                               Sistema.ConnectionSide,
                               Sistema.AppRemoteServer,
                               True
                              );

      CtrlDocumento.OpenTransaction := False;
      //Fim Pendência 26441

      if Result = 0 then
      begin
         try
            // -------------------------------------------------------------------------------------------------

            // exclui as msgs CNAB (se houver)
            with dtmEmptmo.qryDeleteMsgCnab do
            begin
               LimpaParametros(dtmEmptmo.qryDeleteMsgCnab);
               ParamByName('PCODDOCUMENTO').AsFloat := fDocumento;
               ExecSQL;
            end;

            //William Moreira da Silva - SOL 261550 PPM 771995
            //Pendência 26441 - 29/07/2007 - Marchetti
            // Limpa o codigo do documento no Historico
            //with dtmIntegraEmptmo.qryExcluiDocumentoHist do
            //begin
            //   LimpaParametros(dtmIntegraEmptmo.qryExcluiDocumentoHist);
            //   ParamByName('PCODDOCUMENTO').AsFloat := fDocumento;
            //   ExecSQL;
            //end;
            //William Moreira da Silva - SOL 261550 PPM 771995

            CtrlDocumento.Prepare(OpDocumento, odlEfetivo);
            CtrlDocumento.IdUsuario     := Sistema.idUsuario;
            CtrlDocumento.IdEspAcesso   := Sistema.idEspAcesso;
            CtrlDocumento.CodDocumento  := fDocumento;
            CtrlDocumento.UsaPlanoPatro := Sistema.UsaPlanoPatro;

            if not CtrlDocumento.Delete then Result := -1;
         except
            Result := -1;
         end;
 
      end;
 
   finally
      case result of
          0: sMsg := '';
         -1: sMsg := 'ERRO ao excluir Documento.';
         -2: sMsg := 'Arquivo de pagamento já enviado. A operação não pode ser efetuada.';
         -3: sMsg := 'O Documento já foi baixado. A operação não pode ser efetuada.';
         -4: sMsg := 'Não foi encontrado documento.';
         -5: sMsg := 'O Documento já está contido em um Lote. A operação não pode ser efetuada.';
         //Pendência 25305 - 15/05/2007 - Alberto
         -6: result := 0;
         //Fim Pendência 25305
      end;
 
      CtrlDocumento.Free;
      //Fim Pendência 26441
   end;
end;



function TIntegraEmptmo.EfetuaBaixaCAR(const iDocumento: int64) : Boolean;
var
   fSaldoDoc         : Real;
   fSaldoOutraMoeda  : Real;
   iNumLancto        : int64;
   iPlanilha         : integer;
//   CtrlDocumento     : TCtrlDocumento;
begin
   Result := True;

   Documento.Saldo.GetSaldoDoc(iDocumento,
                               '',              // Data do Saldo - Saldo Atual
                               'R',             // RecPag
                               fSaldoDoc,
                               fSaldoOutraMoeda
                              );

   iNumLancto := Documento.GerarNumLancto(dtmEmptmo.QryAux, iDocumento);

   //Pendência 24162 - 29/01/2007 - Alberto
   iPlanilha  := 0;
   //Fim Pendência 24162

   if iNumLancto <= 0 then
   begin
      Result := False;
      Exit;
   end;

   try
      Documento.CriarLanctoDoc(dtmEmptmo.QryAux,      // query auxiliar
                               iDocumento,            // iCodDocumento
                               iNumLancto,            // iNumLancto
                               -1,                    // CodAlterador
                               iPlanilha,             // PnlCodigo
                               DateToStr(SysDate),    // DataLancto
                               fSaldoDoc,             // Valor
                               0,                     // ValorOutraMoeda
                               -1,                    // Estorno
                               'C',                   // DebCre
                               '2',                   // sOperacao
                               'Estorno',             // HistoricoCompl
                               Sistema.IdUsuario,     // idUsuarioInclusao
                               False,                 // bContabiliza
                               -1,                    // iCodPortForma
                               ''                     // sNumChqBord
                              );

      with dtmIntegraEmptmo.qryBaixaDoc do
      begin
         LimpaParametros(dtmIntegraEmptmo.qryBaixaDoc);
         ParamByName('PCODDOCUMENTO').AsFloat := iDocumento;
         ExecSQL;
      end;
   except
      Result := False;
   end;
end;



function TIntegraEmptmo.ExcluiContabil(const fPlanilha : Extended;
                                       var   sMsg      : String
                                      ): Integer;
begin
   Result := 0;

   // só exclui a planilha se esta existir, é claro...
   if trunc(fPlanilha) <> -1 then
   begin
      Result := VerificaPlanilha(fPlanilha, sMsg);

      if Result = 0 then
      begin
         try
            // -------------------------------------------------------------------------------------
            // exclui os lançamentos da planilha
            with dtmIntegraEmptmo.qryExcluiLancContab do
            begin
               LimpaParametros(dtmIntegraEmptmo.qryExcluiLancContab);
               ParamByName('PPLNCODIGO').AsFloat := fPlanilha;
               ExecSQL;
            end;
            // -------------------------------------------------------------------------------------

            Application.ProcessMessages;

            // -------------------------------------------------------------------------------------
            // Como é possível não excluir a planilha, zera seus valores

            with dtmIntegraEmptmo.qryUpdateVlrPlanilha do
            begin
               LimpaParametros(dtmIntegraEmptmo.qryUpdateVlrPlanilha);
               ParamByName('PPLNCODIGO').AsFloat := fPlanilha;
               ExecSQL;
            end;
            // -------------------------------------------------------------------------------------

            Application.ProcessMessages;

            // -------------------------------------------------------------------------------------
            // Se for FUNCEF, não exclui planilha
            if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1 then
            begin
               // ----------------------------------------------------------------------------------
               // exclui própria planilha
               with dtmIntegraEmptmo.qryExcluiPlanilha do
               begin
                  LimpaParametros(dtmIntegraEmptmo.qryExcluiPlanilha);
                  ParamByName('PPLNCODIGO').AsFloat := fPlanilha;
                  ExecSQL;
               end;
               // ----------------------------------------------------------------------------------
            end;
            // -------------------------------------------------------------------------------------

         except
            Result := -1;
         end;

      end; // if Result = 0
   end; // if iPlanilha <> -1
end;



function TIntegraEmptmo.DesfazEnvio(const iContratoEmptmo: Extended;
                                    const iParcela       : Integer;
                                    const iAno           : Integer;
                                    const iMes           : Integer;
                                    const dDataPrevista  : TDateTime;
                                    const bCompetencia   : Boolean;
                                    const sFormaEnvio    : String;
                                    const bMostraMsg     : Boolean
                                    ): Boolean;
var
   bTransacao     : Boolean;
   sAnoMes        : String;
   sSQL           : String;
   sMsg           : String;
   rLogTotalPrev  : TLogTotalPrev;
begin
   bTransacao := False;

   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end;

   try
      sAnoMes := '';
      if (iAno > 0) and (iMes > 0) then sAnoMes := FormatFloat('0000', iAno) + '/' + FormatFloat('00', iMes);

      // 1º - já exclui da tmpdesc o que puder ser exlcuído...
      if ( (sFormaEnvio = '') or (sFormaEnvio = 'F') ) then
      begin
         if not(ExcluiTMPDESCPorMes(iContratoEmptmo, -1, sAnoMes, bMostraMsg)) then
         begin
            if (bTransacao and dtmBaseDados.dbBaseDados.InTransaction) then RollBackTransacao;
            Result := False;
            Exit;
         end;

      end; // if sFormaEnvio


      // 2º - exclui do CaR os registros de lá ...
      if ( (sFormaEnvio = '') or (sFormaEnvio = 'C') ) then
      begin
         sSQL :=
         'SELECT '                                                                        + #13 +
         '  CON.IDCONTRATOEMPTMO, '                                                       + #13 +
         '  HST.HMEANOCOBRANCA, '                                                         + #13 +
         '  HST.HMEMESCOBRANCA, '                                                         + #13 +
         '  HST.CODDOCUMENTO, '                                                           + #13 +
         '  HST.HMEFORMACOBRANCA, '                                                       + #13 +
         '  PES.NOME, '                                                                   + #13 +
         '  DOC.STATUS, '                                                                 + #13 +
         '  DOC.EMISBLOQ, '                                                               + #13 +
         '  SUM(HST.HMEVLRPREVISTO) AS HMEVLRPREVISTO '                                   + #13 +
         'FROM '                                                                          + #13 +
         '  PESSOA          PES, '                                                        + #13 +
         '  HISTMOVEMPTMO   HST, '                                                        + #13 +
         '  DOCUMENTO       DOC, '                                                        + #13 +
         '  CONTRATOEMPTMO  CON  '                                                        + #13 +
         'WHERE '                                                                         + #13 +
         '      ( CON.IDCONTRATOEMPTMO = ' + FormatFloat('#0', iContratoEmptmo) + ' ) '   + #13 +
         '  AND ( (HST.HMECENTRALIZA   = 1) OR (HST.HMEDESTACADO = 1)) '                  + #13 +
         '  AND ( HST.FLGENVIO         IS NULL ) '                                        + #13 +
         '  AND ( HST.FLGBAIXADO       IS NOT NULL ) '                                    + #13;

         if (not bCompetencia) and ((iMes + iAno) > 0) then
         begin
            sSQL := sSQL +
              ' AND  (HST.HMEANOCOBRANCA || ''/'' || HST.HMEMESCOBRANCA = ' + sAnoMes + ')'       + #13;
         end else if (bCompetencia) and ((iMes + iAno) > 0) then
         begin
            sSQL := sSQL +
              ' AND  (HST.HMEANOCOMPETENCIA || ''/'' || HST.HMEMESCOMPETENCIA = ' + sAnoMes + ')' + #13;
         end;

         sSQL := sSQL +
         ' AND  (CON.IDCONTRATOEMPTMO   = HST.IDCONTRATOEMPTMO)'                         + #13 +
         ' AND  (CON.IDPESSOA           = PES.IDPESSOA         )'                        + #13 +
         ' AND  (HST.CODDOCUMENTO       = DOC.CODDOCUMENTO (+) )'                        + #13 +
         ' GROUP BY CON.IDCONTRATOEMPTMO, HST.HMEANOCOBRANCA,  HST.HMEMESCOBRANCA, '     + #13 +
         '          HST.CODDOCUMENTO, HST.HMEFORMACOBRANCA, PES.NOME, DOC.STATUS,  '     + #13 +
         '          DOC.EMISBLOQ                                                   '     ;

         with dtmIntegraEmptmo.qryExcluiFinanceiro do
         begin
            Close;
            SQL.Clear;
            SQL.Text := sSql;
            Open;
            while not(EOF) do
            begin
               // só tenta excluir se o código do documento existir
               if FieldByName('CODDOCUMENTO').AsInteger > 0 then
               begin
                  ExcluiFinanceiro(FieldByName('CODDOCUMENTO').AsInteger, sMsg);

                  // -------------------------------------------------------------------------------
                  // André Pontes - 18/01/2006 - LogDocumento - OK

                  LimpaRegistroLog(rLogTotalPrev);

                  rLogTotalPrev.IDModulo   := Sistema.IDModulo;
                  rLogTotalPrev.IDContrato := -1;
                  rLogTotalPrev.IDHistMov  := -1;
                  rLogTotalPrev.CodPlanDoc := FieldByName('CODDOCUMENTO').AsInteger;
                  rLogTotalPrev.Origem     := -1;
                  rLogTotalPrev.Operacao   := 'uIntegraEmptmo - DesfazEnvio - ExcluiFinanceiro';
                  rLogTotalPrev.Data       := SysDate;
                  rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
                  rLogTotalPrev.Versao     := Sistema.Versao;

                  GravaLogTotalPrev(rLogTotalPrev);

                  // -------------------------------------------------------------------------------
               end;
               Next;
            end;
            Close;
         end;

      end; // if sFormaEnvio

      // 3º - marca novamente os registros com flgenvio = 0 

      if (sFormaEnvio = '') or (sFormaEnvio = 'C') then
      begin
         with dtmIntegraEmptmo.qryRemarcaEnvio do
         begin
            LimpaParametros(dtmIntegraEmptmo.qryRemarcaEnvio);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat     := iContratoEmptmo;

            if ( (iAno > 0) and (iMes > 0) ) then
            begin
               ParamByName('PHMEANOCOBRANCA').AsInteger  := iAno;
               ParamByName('PHMEMESCOBRANCA').AsInteger  := iMes;
            end;

            if iParcela > -1 then ParamByName('PHMEPARCELA').AsInteger := iParcela;

//            if sFormaEnvio = 'C' then ParamByName('PHMEFORMACOBRANCA').AsString := sFormaEnvio;
            if sFormaEnvio <> '' then ParamByName('PHMEFORMACOBRANCA').AsString := sFormaEnvio;

            ExecSQL;
         end;
      end;

      if (bTransacao and dtmBaseDados.dbBaseDados.InTransaction) then CommitTransacao;
      Result := True;

   except
      if (bTransacao and dtmBaseDados.dbBaseDados.InTransaction) then RollBackTransacao;
      Result := False;
   end;
end;



function TIntegraEmptmo.DesfazEnvioPorDocumento(const fDocumento : Extended;
                                                const bMostraMsg : Boolean = False;
                                                const fTipoMov : Integer = -1;
                                                const bApagaDoc : boolean = true    //edilaine SIG113052
                                               ): Boolean;
var
   bTransacao     : Boolean;
   sAnoMes        : String;
   sSQL           : String;
   sMsg           : String;
   qryAux         : TwwQuery;
   rLogTotalPrev  : TLogTotalPrev;
   sTipoMov       : String;        //TAES - SIG102325
begin
   bTransacao := False;

   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end;

   try
      try
         qryAux               := TwwQuery.Create(Application);
         qryAux.DatabaseName  := 'BaseDados';

         // ----------------------------------------------------------------------------------------
         // 1) Faz update do FLGENVIO para 0 (zero) e
         // 2) Faz update do CODDOCUMENTO na HistMovEmptmo para NULL e
         // 3) Desfaz a baixa do item, se houver

         //William Moreira da Silva - SOL 261550 PPM 771995
         {sSQL :=
         'UPDATE '                     + #13 +
         '   HISTMOVEMPTMO HME '       + #13 +
         'SET '                        + #13 +
         '   CODDOCUMENTO   = NULL, '  + #13 +
         '   IDTMPDESC      = NULL, '  + #13 +
         '   FLGENVIO       = 0, '     + #13 +
         '   FLGBAIXADO     = 0, '     + #13 +
         '   HMEDATAENVIO   = NULL, '  + #13 +
         '   HMEVLREFETIVO  = NULL, '  + #13 +
         '   HMEDATAEFETIVA = NULL '   + #13 +
         'WHERE '                      + #13 +
         '   CODDOCUMENTO = '          + FormatFloat('#0', fDocumento);}

         //TAES - SIG102325 - início
          case fTipoMov of
              0 : sTipoMov := 'HMECONCESSAO';
              1 : sTipoMov := 'HMEPRESTACAO';
              2 : sTipoMov := 'HMEAMORTIZACAO';
              3 : sTipoMov := 'HMEQUITACAO';
              4 : sTipoMov := 'HMEENCARGOS';
              5 : sTipoMov := 'HMEATUDIARIA';
              6 : sTipoMov := 'HMEMIGRACAO';
              7 : sTipoMov := 'HMEAJUSTECOBRANCA';
              8 : sTipoMov := 'HMEAJUSTESALDODEV';
          else
               sTipoMov := 'HMEALL';
          end;
          //TAES - SIG102325 - fim

          sSql := ' UPDATE '                 + #13 +
               sTipoMov + '  HME '           + #13 + //TAES - SIG102325
              ' SET '                        + #13 +
              '   FLGENVIO       = 0, '      + #13 +
              '   FLGBAIXADO     = 0, '      + #13 +
              '   VLREFETIVO  = NULL, '      + #13 +
              '   DATAEFETIVA = NULL '       + #13 +
              ' WHERE '                      + #13 +
              '  hme.idhistmovemptmo IN (SELECT hev.idhistmovemptmo ' + #13 +
              '                          FROM hmeenvio hev '          + #13 +
              '                          WHERE hev.coddocumento = ' + FormatFloat('#0', fDocumento) +')';

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
         qryAux.ExecSQL;


         //edilaine - SIG113052 : inicio
         //Exclusão do documento no último item vinculado que será apagado
         if bApagaDoc then
         begin
           sSql := 'DELETE FROM HMEENVIO WHERE CODDOCUMENTO = ' + FormatFloat('#0', fDocumento);

           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Text := sSQL;
           qryAux.ExecSQL;
           //William Moreira da Silva - SOL 261550 PPM 771995

           //TAES - SIG102325 - início
           sSql := 'DELETE FROM HISTENVIOEMPTMO WHERE CODDOCUMENTO = ' + FormatFloat('#0', fDocumento);

           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Text := sSQL;
           qryAux.ExecSQL;
           //TAES - SIG102325 - fim

           // ----------------------------------------------------------------------------------------
           // André Pontes - 11/01/2006 - LogDocumento - OK

           LimpaRegistroLog(rLogTotalPrev);

           rLogTotalPrev.IDModulo   := Sistema.IDModulo;
           rLogTotalPrev.IDContrato := -1;
           rLogTotalPrev.IDHistMov  := -1;
           rLogTotalPrev.CodPlanDoc := fDocumento;
           rLogTotalPrev.Origem     := -1;
           rLogTotalPrev.Operacao   := 'uIntegraEmptmo - DesfazEnvioPorDocumento';
           rLogTotalPrev.Data       := SysDate;
           rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
           rLogTotalPrev.Versao     := Sistema.Versao;

           GravaLogTotalPrev(rLogTotalPrev);

           // ----------------------------------------------------------------------------------------

           // ----------------------------------------------------------------------------------------
           // 3) EXCLUI o Documento

           if ExcluiFinanceiro(fDocumento, sMsg) = 0 then
           begin
              // -------------------------------------------------------------------------------------
              // André Pontes - 18/01/2006 - LogDocumento - OK

              LimpaRegistroLog(rLogTotalPrev);

              rLogTotalPrev.IDModulo   := Sistema.IDModulo;
              rLogTotalPrev.IDContrato := -1;
              rLogTotalPrev.IDHistMov  := -1;
              rLogTotalPrev.CodPlanDoc := fDocumento;
              rLogTotalPrev.Origem     := -1;
              rLogTotalPrev.Operacao   := 'uIntegraEmptmo - DesfazEnvioPorDocumento - ExcluiFinanceiro';
              rLogTotalPrev.Data       := SysDate;
              rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
              rLogTotalPrev.Versao     := Sistema.Versao;

              GravaLogTotalPrev(rLogTotalPrev);

              // -------------------------------------------------------------------------------------

              if (bTransacao and dtmBaseDados.dbBaseDados.InTransaction) then CommitTransacao;
              Result := True;
           end
           else
           begin
              if (bTransacao and dtmBaseDados.dbBaseDados.InTransaction) then RollBackTransacao;
              Result := False;
           end;
           // ----------------------------------------------------------------------------------------

         end;  //edilaine - SIG113052 : fim

      except
         if (bTransacao and dtmBaseDados.dbBaseDados.InTransaction) then RollBackTransacao;
         Result := False;
      end;

   finally
      if qryAux <> nil then
      begin
         qryAux.Close;
         qryAux.Free;
      end;
   end;
end;



function TIntegraEmptmo.DesfazEnvioPorDocumentoProc(const fDocumento : Extended;
                                                    const bMostraMsg : Boolean = False;
                                                    const iOrigem    : Integer = -1
                                                   ): Boolean;
var
   bTransacao     : Boolean;
   sAnoMes        : String;
   sSQL           : String;
   sMsg           : String;
   qryAux         : TwwQuery;
   rLogTotalPrev  : TLogTotalPrev;
begin
   bTransacao := False;

   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end;

   try
      try
         qryAux               := TwwQuery.Create(Application);
         qryAux.DatabaseName  := 'BaseDados';

         // ----------------------------------------------------------------------------------------
         // 1) Faz update do FLGENVIO para 0 (zero) e
         // 2) Faz update do CODDOCUMENTO na HistMovEmptmo para NULL e
         // 3) Desfaz a baixa do item, se houver


         sSQL :=
         'UPDATE '                        + #13 +
         '   HISTMOVEMPTMO HME '          + #13 +
         'SET '                           + #13 +
         '   CODDOCUMENTOPROC = NULL '    + #13 +
         'WHERE '                         + #13 +
         '   CODDOCUMENTOPROC = '         + FormatFloat('#0', fDocumento);

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
         qryAux.ExecSQL;

         // ----------------------------------------------------------------------------------------
         // André Pontes - 11/01/2006 - LogDocumento - OK

         LimpaRegistroLog(rLogTotalPrev);

         rLogTotalPrev.IDModulo   := Sistema.IDModulo;
         rLogTotalPrev.IDContrato := -1;
         rLogTotalPrev.IDHistMov  := -1;
         rLogTotalPrev.CodPlanDoc := fDocumento;
         rLogTotalPrev.Origem     := iOrigem;
         rLogTotalPrev.Operacao   := 'DesfazEnvioPorDocumentoProc';
         rLogTotalPrev.Data       := SysDate;
         rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
         rLogTotalPrev.Versao     := Sistema.Versao;

         GravaLogTotalPrev(rLogTotalPrev);

         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         // 3) EXCLUI o Documento

         if IntegraEmptmo.ExcluiFinanceiro(fDocumento, sMsg) = 0 then
         begin
            // -------------------------------------------------------------------------------------
            // André Pontes - 18/01/2006 - LogDocumento - OK

            LimpaRegistroLog(rLogTotalPrev);

            rLogTotalPrev.IDModulo   := Sistema.IDModulo;
            rLogTotalPrev.IDContrato := -1;
            rLogTotalPrev.IDHistMov  := -1;
            rLogTotalPrev.CodPlanDoc := fDocumento;
            rLogTotalPrev.Origem     := -1;
            rLogTotalPrev.Operacao   := 'uIntegraEmptmo - DesfazEnvioPorDocumentoProc - ExcluiFinanceiro';
            rLogTotalPrev.Data       := SysDate;
            rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
            rLogTotalPrev.Versao     := Sistema.Versao;

            GravaLogTotalPrev(rLogTotalPrev);

            // -------------------------------------------------------------------------------------

            if (bTransacao and dtmBaseDados.dbBaseDados.InTransaction) then CommitTransacao;
            Result := True;
         end
         else
         begin
            if (bTransacao and dtmBaseDados.dbBaseDados.InTransaction) then RollBackTransacao;
            Result := False;
         end;
         // ----------------------------------------------------------------------------------------

      except
         if (bTransacao and dtmBaseDados.dbBaseDados.InTransaction) then RollBackTransacao;
         Result := False;
      end;

   finally
      if qryAux <> nil then
      begin
         qryAux.Close;
         qryAux.Free;
      end;
   end;
end;



function TIntegraEmptmo.VerificaDocumento(const fDocumento : Extended;
                                          var   sMsg       : String
                                         ): Integer;
begin
   Result := 0;

   try

      try
         with dtmEmptmo.qryVerificaDocumento do
         begin
            LimpaParametros(dtmEmptmo.qryVerificaDocumento);
            ParamByName('PCODDOCUMENTO').AsFloat := fDocumento;
            Open;
         end;

         if not(dtmEmptmo.qryVerificaDocumento.isEmpty) then
         begin
            if dtmEmptmo.qryVerificaDocumentoEMISBLOQ.AsString = 'S' then
            begin
               sMsg     := 'Arquivo de pagamento já enviado. A operação não pode ser efetuada.';
               Result   := -2;
            end;

            if trim(dtmEmptmo.qryVerificaDocumentoSTATUS.AsString) = '2' then
            begin
               sMsg     := 'O Documento já foi baixado. A operação não pode ser efetuada.';
               Result   := -3;
            end;

            // André Pontes - 14/08/2003 - pendência 14826
            if     not(dtmEmptmo.qryVerificaDocumentoNUMLOTE.IsNull)
               and (dtmEmptmo.qryVerificaDocumentoFLAGCANCEL.AsString <> 'C') then
            begin

               //Pendência 25305 - 15/05/2007 - Alberto
               with dtmEmptmo.qryVerificaLanctoDocum do
               begin
                  LimpaParametros(dtmEmptmo.qryVerificaLanctoDocum);
                  ParamByName('PCODDOCUMENTO').AsFloat := fDocumento;
                  Open;
               end;

               if dtmEmptmo.qryVerificaLanctoDocumQTDLANCTODOCUM.AsInteger > 0 then
               begin
               sMsg     := 'O Documento já está contido em um Lote. A operação não pode ser efetuada.';
               Result   := -5;
               end
               else
               begin
                  sMsg     := 'Documento está contido e estornado em um Lote.';
                  Result   := -6;
               end;
               //Fim Pendência 25305
            end;
            // FIM André Pontes - 14/08/2003 - pendência 14826
         end
         else
         begin
            sMsg     := 'Não foi encontrado documento.';
            Result   := -4;
         end;

      except
         Result := -1;
      end;

   finally
      dtmEmptmo.qryVerificaDocumento.Close;
      //Pendência 25305 - 15/05/2007 - Alberto
      dtmEmptmo.qryVerificaLanctoDocum.Close;
      //Fim Pendência 25305
   end;
end;



function TIntegraEmptmo.VerificaPlanilha(const fPlanilha : Extended;
                                         var   sMsg      : String
                                        ): Integer;
var
   sSql              : String;
   qryAux            : TwwQuery;
   dDataLanc         : TDateTime;
   iEmpresa          : Integer;
   sModulo           : String;
   iExercicio        : Integer;
   iPeriodo          : Integer;
begin
   // Cria a Query Auxiliar

   try
      qryAux               := TwwQuery.Create(Application);
      qryAux.DatabaseName  := 'BaseDados';

      Result               := 0;

      //Pendência 24800 - 21/03/2007 - Alberto
      CtrlPeriodo := TCtrlPeriodo.Create;
      CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,
                             true,
                             Sistema.ConnectionType,
                             Sistema.ConnectionSide
                            );
      CtrlPeriodo.OnMessageInfo := nil;

      CtrlContab := TCtrlContab.Create;
      CtrlContab.initializeas( CtrlPeriodo );
      //Fim Pendência 24800

      try
         sSql :=
         'SELECT '         + #13 +
         '  PLNDATDIA '    + #13 +
         'FROM '           + #13 +
         '  PLANILHA '     + #13 +
         'WHERE '          + #13 +
         '  PLNCODIGO  = ' + FormatFloat('#0', fPlanilha);

         qryAux.SQL.Text := sSql;
         qryAux.Open;

         if not(qryAux.isEmpty) then
         begin
            dDataLanc := qryAux.FieldByName('PLNDATDIA').AsDateTime;

           iEmpresa       := Sistema.idEmpresa;
           sModulo        := IntToStr(Sistema.idModulo);

           //Pendência 24800 - 21/03/2007 - Alberto
           CtrlPeriodo.RetornaPeriodoExercicioData( iEmpresa, FormatDateTime('dd/mm/yyyy', dDataLanc) );
           iPeriodo   := CtrlPeriodo.Periodo;
           iExercicio := CtrlPeriodo.Exercicio;

           if (CtrlPeriodo.TestaPeriodoBloqueadoProc(iEmpresa, tbBloqueado, iPeriodo, iExercicio, False)) or
              (not CtrlContab.TestaDataBloqueadaProc(iEmpresa, Sistema.idModulo, FormatDateTime('dd/mm/yyyy', dDataLanc))) then
           //Fim Pendência 24800
           begin
              sMsg   := CtrlPeriodo.MessageInfo + ' ' + CtrlContab.MessageInfo;
              Result := -2;
           end;
         end;
      except
         Result := -1;
      end;

   finally
      qryAux.Close;
      qryAux.Free;

      //Pendência 24800 - 21/03/2007 - Alberto
      FreeAndNil( CtrlPeriodo );
      FreeAndNil( CtrlContab );
      //Fim Pendência 24800
   end;
end;




function TIntegraEmptmo.AjustaDataVenctoFolha: TDateTime;
begin
   //
end;



function TIntegraEmptmo.BuscaPortadorFormaFolha(var iPortadorForma: Int64): Integer;
begin
   //
end;



function TIntegraEmptmo.BuscaBanco(const iContaBancaria: Int64): Int64;
begin
   Result := 0;

   try
      try
         with dtmLookEmptmo.qryLookContaBancaria do
         begin
            LimpaParametros(dtmLookEmptmo.qryLookContaBancaria);
            ParamByName('PIDCBANCARIA').AsInteger := iContaBancaria;

            Open;

            if not(IsEmpty) then Result := dtmLookEmptmo.qryLookContaBancariaIDBANCO.AsInteger;

         end;

      except
         Result := -1;
      end;

   finally
      dtmLookEmptmo.qryLookContaBancaria.Close;
   end;
end;



function TIntegraEmptmo.DesfazContabilizacaoPorPlanilha(const fPlanilha : Extended;
                                                        const bMostraMsg: Boolean
                                                       ): Boolean;
var
   bTransacao     : Boolean;
   sMsg           : String;
   rLogTotalPrev  : TLogTotalPrev;
begin
   bTransacao := False;

   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end;

   try
      // -------------------------------------------------------------------------------------------
      // 1) Faz update do PLNCODIGO para NULL

      with dtmIntegraEmptmo.qryDesfazPlanilhaPorPlanilha do
      begin
         LimpaParametros(dtmIntegraEmptmo.qryDesfazPlanilhaPorPlanilha);
         ParamByName('PPLNCODIGO').AsFloat := fPlanilha;
         ExecSQL;
      end;

      with dtmIntegraEmptmo.qryDesfazPlanilhaEstornoPorPlanilha do
      begin
         LimpaParametros(dtmIntegraEmptmo.qryDesfazPlanilhaEstornoPorPlanilha);
         ParamByName('PPLNCODIGO').AsFloat := fPlanilha;
         ExecSQL;
      end;

      // -------------------------------------------------------------------------------------------
      // André Pontes - 27/01/2006 - LogPlanilha - OK

      LimpaRegistroLog(rLogTotalPrev);

      rLogTotalPrev.IDModulo   := Sistema.IDModulo;
      rLogTotalPrev.IDContrato := -1;
      rLogTotalPrev.IDHistMov  := -1;
      rLogTotalPrev.CodPlanDoc := fPlanilha;
      rLogTotalPrev.Origem     := -1;
      rLogTotalPrev.Operacao   := 'DesfazContabilizacaoPorPlanilha';
      rLogTotalPrev.Data       := SysDate;
      rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
      rLogTotalPrev.Versao     := Sistema.Versao;

      GravaLogTotalPrev(rLogTotalPrev);

      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------

      // -------------------------------------------------------------------------------------------
      // 2) EXCLUI os Lancamentos e/ou Planilha

      if IntegraEmptmo.ExcluiContabil(fPlanilha, sMsg ) = 0 then
      begin
         Result := True;
         if (bTransacao and dtmBaseDados.dbBaseDados.InTransaction) then CommitTransacao;
      end
      else
      begin
         Result := False;
         if (bTransacao and dtmBaseDados.dbBaseDados.InTransaction) then RollBackTransacao;
         if bMostraMsg then MsgDlg(sMsg, 'Empréstimo', mtError, [mbOK], 0);
      end;

      // -------------------------------------------------------------------------------------------

   except
      Result := False;
      if (bTransacao and dtmBaseDados.dbBaseDados.InTransaction) then RollBackTransacao;
      Raise;
      if bMostraMsg then MsgDlg(sMsg, 'Empréstimo', mtError, [mbOK], 0);
   end;
end;



function TIntegraEmptmo.DesfazContabilizacaoPorEvento(const dDataInicial : TDateTime;
                                                      const dDataFinal   : TDateTime;
                                                      const iEvento      : Integer
                                                     ) : Integer;
var
   iPlanilha : Extended;
   sMsg      : String;
begin
   Result := 0;

   try
      with dtmIntegraEmptmo do
      begin

         LimpaParametros(dtmIntegraEmptmo.qryPlanilhasLote);
         qryPlanilhasLote.ParamByName('PDATAINI').AsDateTime   := dDataInicial;
         qryPlanilhasLote.ParamByName('PDATAFIM').AsDateTime   := dDataFinal;
         qryPlanilhasLote.ParamByName('PHMETIPOMOV').AsInteger := iEvento;
         qryPlanilhasLote.Open;

         while not(qryPlanilhasLote.EOF) do
         begin
            iPlanilha := qryPlanilhasLotePLNCODIGO.AsFloat;

            while (iPlanilha = qryPlanilhasLotePLNCODIGO.AsFloat) and
                  not(qryPlanilhasLote.EOF) do
            begin
               LimpaParametros(dtmIntegraEmptmo.qryDesfazPlanilhaPorHist);
               dtmIntegraEmptmo.qryDesfazPlanilhaPorHist.ParamByName('PIDHISTMOVEMPTMO').AsFloat := qryPlanilhasLoteIDHISTMOVEMPTMO.AsFloat;
               dtmIntegraEmptmo.qryDesfazPlanilhaPorHist.ExecSql;

               qryPlanilhasLote.Next;
            end;

            ExcluiContabil(iPlanilha, sMsg);
         end;
      end;

   finally
      LimpaParametros(dtmIntegraEmptmo.qryPlanilhasLote);
   end;
end;




function TIntegraEmptmo.AcertaPlanoOrigem(IDContratoEmptmo : Extended;
                                          IDPessoa         : Extended;
                                          IDPlanoPrev      : Integer;
                                          bUpdate          : Boolean
                                         ): Integer;
var
   IDMutuario     : Extended;
   IDPlanoContab  : Integer;
begin
   IDMutuario := IDPessoa;
   IDPlanoContab := -1;

   //Pendências 23311 e 23312  - 25/09/2006 - Alberto
   if Sistema.TipoCliente = 19991 then begin
     with dtmIntegraEmptmo.qryPlanoPrevOrigemFUNCEF do
     begin
       LimpaParametros(dtmIntegraEmptmo.qryPlanoPrevOrigemFUNCEF);
       ParamByName('PIDPESSOA').AsFloat  := IDMutuario;
       Open;

       if not(IsEmpty) and not(dtmIntegraEmptmo.qryPlanoPrevOrigemFUNCEFIDPLANOPREV.IsNull) then
         IDPlanoContab := dtmIntegraEmptmo.qryPlanoPrevOrigemFUNCEFIDPLANOPREV.AsInteger
       else
         IDPlanoContab := -1;
     end;
   end;

   if IDPlanoContab = -1 then begin

   // Busca o plano contábil "correto" do mutuário na BenefBFCiario
   with dtmIntegraEmptmo.qryBenefBFCiario do
   begin
      LimpaParametros(dtmIntegraEmptmo.qryBenefBFCiario);
      ParamByName('PIDPESSOA').AsFloat       := IDMutuario;
      ParamByName('PIDPLANOPREV').AsInteger  := IDPlanoPrev;
      Open;

      if not(IsEmpty) and not(dtmIntegraEmptmo.qryBenefBFCiarioIDPLANPREVCONTAB.IsNull) then
      begin
         IDPlanoContab := dtmIntegraEmptmo.qryBenefBFCiarioIDPLANPREVCONTAB.AsInteger;
      end
      else
      begin
         IDPlanoContab := -1;
      end;

      Close;
   end;

   end;
   //Fim Pendências 23311 e 23312

   Result := IDPlanoContab;

   // Faz update no contrato (IDPLANOORIGEM) com o plano contábil encontrado na BenefBFCiario
   if (bUpdate) and (IDPlanoContab > 0) then
   begin
      try
         with dtmEmptmo.qryUpdatePlanoOrigem do
         begin
            LimpaParametros(dtmIntegraEmptmo.qryBenefBFCiario);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat  := IDContratoEmptmo;
            ParamByName('PIDPLANOORIGEM').AsInteger   := IDPlanoContab;
            ExecSQL;
         end;
      except
         Result := -1;
      end;
   end;
end;



function TIntegraEmptmo.EventoBaixado(const IDContratoEmptmo : Extended;
                                      const iEvento          : Integer;
                                      const dDataEvento      : TDateTime
                                     ): Boolean;
begin
   // André Pontes - 06/01/2005
   // Incluída cláusula na query que verifica se o valor baixado é diferente de ZERO,
   // para o caso em que há baixa automática por conta do valor previsto ZERO
   with dtmIntegraEmptmo.qryVerificaBaixaEvento do
   begin
      LimpaParametros(dtmIntegraEmptmo.qryVerificaBaixaEvento);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat  := IDContratoEmptmo;
      ParamByName('PHMETIPOMOV').AsInteger      := iEvento;

      if dDataEvento > 0 then ParamByName('PHMEDATAPREVISTA').AsDate   := dDataEvento;

      Open;

      Result := dtmIntegraEmptmo.qryVerificaBaixaEventoQUANT.AsInteger > 0;

      Close;
   end;
end;



function TIntegraEmptmo.EventoEnviado(const IDContratoEmptmo : Extended;
                                      const iEvento          : Integer;
                                      const dDataEvento      : TDateTime
                                     ): Boolean;
begin
   with dtmIntegraEmptmo.qryVerificaEnvioEvento do
   begin
      LimpaParametros(dtmIntegraEmptmo.qryVerificaEnvioEvento);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat  := IDContratoEmptmo;
      ParamByName('PHMETIPOMOV').AsInteger      := iEvento;

      if dDataEvento > 0 then ParamByName('PHMEDATAPREVISTA').AsDate   := dDataEvento;

      Open;

      Result := dtmIntegraEmptmo.qryVerificaEnvioEventoQUANT.AsInteger > 0;

      Close;
   end;
end;



function TIntegraEmptmo.ConciliaDocumento(const CodDocumento  : Extended;
                                          const iTipoConcilia : Integer
                                         ): Boolean;
begin
   Result := True;
   try
      with dtmIntegraEmptmo.qryUpdateDocConciliado do
      begin
         LimpaParametros(dtmIntegraEmptmo.qryUpdateDocConciliado);
         ParamByName('PCODDOCUMENTO').AsFloat       := CodDocumento;
         ParamByName('PFLGNAOCONCILIADO').AsInteger := iTipoConcilia;
         ExecSQL;
      end;
   except
      Result := False;
      MsgDlg('Não foi possível atualizar a conciliação do documento', 'Empréstimo', mtError, [mbOK], 0)
   end;
end;



function TIntegraEmptmo.ExcluiTMPDESCPorTmp(const IDContratoEmptmo : Extended;
                                            const IDTmpDesc        : Extended;
                                            var   sMsg             : String;
                                            const bMostraMsg       : Boolean = True
                                           ): Integer;
begin
   Result   := 0;
   sMsg     := '';

   // ----------------------------------------------------------------------------------------------

   if trunc(IDTmpDesc) = 0 then Exit;

   // ----------------------------------------------------------------------------------------------

   if VerificaExclusaoFolha(IDContratoEmptmo, IDTmpDesc, -1) < 0 then
   begin
      sMsg   := 'Os registros já foram processados pela(s) Folha(s)';
      Result := -1;
      Exit;
   end;

   // ----------------------------------------------------------------------------------------------

   with dtmIntegraEmptmo.qryLimpaIDTmpDescPorTmp do
   begin
      LimpaParametros(dtmIntegraEmptmo.qryLimpaIDTmpDescPorTmp);
      ParamByName('PIDTMPDESC').AsFloat         := IDTmpDesc;
      ParamByName('PIDCONTRATOEMPTMO').AsFloat  := IDContratoEmptmo;
      ExecSQL;
   end;

   with dtmIntegraEmptmo.qryDeleteTMPDESCporTmp do
   begin
      LimpaParametros(dtmIntegraEmptmo.qryDeleteTMPDESCporTmp);

      ParamByName('PIDTMPDESC').AsFloat   := IDTmpDesc;
      ParamByName('PIDDESCONTO').AsFloat  := IDContratoEmptmo;
   end;

   try
      dtmIntegraEmptmo.qryDeleteTMPDESCporTmp.ExecSQL;
   except
      sMsg    	:= 'Erro ao excluir registros na TMPDESC.';
      Result	:= -1;
   end;

   if ( (bMostraMsg) and (Trim(sMsg) <> '') ) then MsgDlg(sMsg, 'Empréstimo', mtError, [mbOk], 0);
end;



function TIntegraEmptmo.ExistemItensNaoContabilizados(const iAno  : Integer;
                                                      const iMes  : Integer;
                                                      const dData : TDateTime
                                                     ): Boolean;
begin
   //
end;



function TIntegraEmptmo.BuscaDataInicio(const IDContrato: Extended): TDateTime;
var
   IDContratoOrig : Extended;
begin
   try
      IDContratoOrig := ContratoOriginal(IDContrato);

      LimpaParametros(dtmIntegraEmptmo.qryDataCredito);
      dtmIntegraEmptmo.qryDataCredito.ParamByName('PIDCONTRATOEMPTMO').AsFloat := IDContratoOrig;
      dtmIntegraEmptmo.qryDataCredito.Open;

      Result := dtmIntegraEmptmo.qryDataCreditoDATACREDITO.AsDateTime;
   finally
      dtmIntegraEmptmo.qryDataCredito.Close;
   end;
end;



function TIntegraEmptmo.ContratoOriginal(const IDContrato: Extended): Extended;
begin
   try
      Result := IDContrato;

      LimpaParametros(dtmIntegraEmptmo.qryContratoQuitado);
      dtmIntegraEmptmo.qryContratoQuitado.ParamByName('PIDCONTRQUITACAO').AsFloat := IDContrato;
      dtmIntegraEmptmo.qryContratoQuitado.Open;

      // ----------------------------------------------------------------------------------------------

      if not(dtmIntegraEmptmo.qryContratoQuitado.IsEmpty) then
      begin
         Result := ContratoOriginal(dtmIntegraEmptmo.qryContratoQuitadoIDCONTRATOEMPTMO.AsFloat);
      end;

      // ----------------------------------------------------------------------------------------------

   finally
      dtmIntegraEmptmo.qryContratoQuitado.Close;
   end;
end;



function TIntegraEmptmo.VlrBaixadoDoc(const fDocumento: Extended): Currency;
begin
   try
      try
         with dtmIntegraEmptmo.qryValorBaixadoDoc do
         begin
            LimpaParametros(dtmIntegraEmptmo.qryValorBaixadoDoc);
            dtmIntegraEmptmo.qryValorBaixadoDoc.ParamByName('PCODDOCUMENTO').AsFloat := fDocumento;
            Open;

            if IsEmpty then
            begin
               Result := 0;
            end
            else // if IsEmpty
            begin
               Result := dtmIntegraEmptmo.qryValorBaixadoDocVALOR_BAIXADO.AsCurrency;
            end;

            Close;
         end;

      except
         Result := 0;
      end;

   finally
      dtmIntegraEmptmo.qryValorBaixadoDoc.Close;
   end;
end;



function TIntegraEmptmo.UltDataBaixaDoc(const fDocumento: Extended): TDateTime;
begin
   try
      try
         with dtmIntegraEmptmo.qryUltDataBaixaDoc do
         begin
            LimpaParametros(dtmIntegraEmptmo.qryUltDataBaixaDoc);
            dtmIntegraEmptmo.qryUltDataBaixaDoc.ParamByName('PCODDOCUMENTO').AsFloat := fDocumento;
            Open;

            if IsEmpty then
            begin
               with dtmIntegraEmptmo.qryUltDataLancDoc do
               begin
                  LimpaParametros(dtmIntegraEmptmo.qryUltDataLancDoc);
                  dtmIntegraEmptmo.qryUltDataLancDoc.ParamByName('PCODDOCUMENTO').AsFloat := fDocumento;
                  Open;

                  if IsEmpty then
                  begin
                     Result := 0;
                  end
                  else
                  begin
                     Result := dtmIntegraEmptmo.qryUltDataLancDocDATA_BAIXA.AsDateTime;
                  end;
               end;
            end
            else
            begin
               Result := dtmIntegraEmptmo.qryUltDataBaixaDocDATA_BAIXA.AsDateTime;
            end;

            Close;
         end;

      except
         Result := 0;
      end;

   finally
      dtmIntegraEmptmo.qryUltDataBaixaDoc.Close;
   end;
end;

function TIntegraEmptmo.VlrBaixadoTMPDESC(const IDTmpDesc: Extended): Currency;
begin
   try
      try
         with dtmIntegraEmptmo.qryVlrBaixadoTmpDesc do
         begin
            LimpaParametros(dtmIntegraEmptmo.qryVlrBaixadoTmpDesc);
            dtmIntegraEmptmo.qryVlrBaixadoTmpDesc.ParamByName('PIDTMPDESC').AsFloat := IDTmpDesc;
            Open;

            if IsEmpty then
            begin
               Result := 0;
            end
            else // if IsEmpty
            begin
               Result := dtmIntegraEmptmo.qryVlrBaixadoTmpDescVALORRECEBIDO.AsFloat;
            end;

            Close;
         end;

      except
         Result := 0;
      end;

   finally
      dtmIntegraEmptmo.qryVlrBaixadoTmpDesc.Close;
   end;
end;

function TIntegraEmptmo.ExistemItensJaContabilizados(const iTipoMov  : Integer;
                                                     const dData     : TDateTime
                                                    ): Boolean;
begin
   try
      LimpaParametros(dtmIntegraEmptmo.qryItensContabilizados);
      //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Início
      //dtmIntegraEmptmo.qryItensContabilizados.ParamByName('PHMETIPOMOV').AsInteger        := iTipoMov;
      //Wylliam Leite da Silva - SOL: 253185 PPM: 771995 - Fim
      dtmIntegraEmptmo.qryItensContabilizados.ParamByName('PHMEDATAPREVISTA').AsDateTime  := dData;

      dtmIntegraEmptmo.qryItensContabilizados.Open;

      Result := not(dtmIntegraEmptmo.qryItensContabilizados.isEmpty);

   finally
      dtmIntegraEmptmo.qryItensContabilizados.Close;
   end;
end;



function TIntegraEmptmo.BuscaDataInicioTipoContr(iPessoa, iTipoContrEmptmo: Integer): TDateTime;
begin
   Result := -1;
   try

      LimpaParametros(dtmIntegraEmptmo.qryBuscaMenorContratoPorTipo);
      dtmIntegraEmptmo.qryBuscaMenorContratoPorTipo.ParamByName('PIDPESSOA').AsInteger          := iPessoa;
      dtmIntegraEmptmo.qryBuscaMenorContratoPorTipo.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := iTipoContrEmptmo;
      dtmIntegraEmptmo.qryBuscaMenorContratoPorTipo.Open;

      if not dtmIntegraEmptmo.qryBuscaMenorContratoPorTipo.IsEmpty then
         Result := dtmIntegraEmptmo.qryBuscaMenorContratoPorTipo.FieldByName('DATACREDITO').AsDateTime;
   finally
      dtmIntegraEmptmo.qryBuscaMenorContratoPorTipo.Close;
   end;
end;


procedure TIntegraEmptmo.AbreParamIntegraNovo(const iTipoContrato, iItem,
  iPlano, iPatro: Int64);
var sSql : string;
begin
   //RENATO VISONI
   // Busca por Patrocinadora e Plano
   sSql :=
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   'SELECT '                                                                  + #13 + //renato visoni
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '  PI.IDPARAMINTEGRAEP , PI.DESCPARAMINTEGRA, PI.IDPLANOPREVCONTAB, '      + #13 +
   '  PI.IDPLANOPREV      , PI.IDPATRO         , PI.IDTIPOEMPTMO     , '      + #13 +
   '  PI.IDTIPOCONTREMPTMO, PI.IDITEMEMPTMO    , PI.IDPESSOA         , '      + #13 +
   '  PI.IDEMPRESA        , PI.PLANO           , PI.CCDEBFOLHA       , '      + #13 +

   '  PI.CCCREDFOLHA      , PI.SUBCDEBFOLHA    , PI.SUBCCREDFOLHA    , '      + #13 +
   '  PI.CCUSTDEBFOLHA    , PI.CCUSTCREDFOLHA  , PI.CCDEBFINAN       , '      + #13 +
   '  PI.CCCREDFINAN      , PI.SUBCDEBFINAN    , PI.SUBCCREDFINAN    , '      + #13 +
   '  PI.CCUSTDEBFINAN    , PI.CCUSTCREDFINAN  , PI.CODCENTRORESPON  , '      + #13 +

   '  PI.CCDEBFOLHA      , PI.CCCREDFOLHA     ,PI.CCUSTDEBFOLHA    , '      + #13 +
   '  PI.CCUSTCREDFOLHA   , PI.SUBCDEBFOLHA    ,PI.SUBCCREDFOLHA    , '      + #13 +
   '  PI.TIPORECDESFOLHA                                            , '      + #13 +

   ' PI.CCDEBFOLHARESULT,   PI.CCCREDFOLHARESULT, PI.CCUSTDEBFOLHARESULT,    ' + #13 +
   ' PI.CCUSTCREDFOLHARESULT, PI.SUBCDEBFOLHARESULT, PI.SUBCCREDFOLHARESULT, '  + #13 +
   ' PI.TIPORECDESFOLHARESULT,                                               '  + #13 +

   '  PI.UNIDNEGOC        , PI.RECPAGFINAN     , PI.TIPORECDESFINAN  , '      + #13 +
   '  PI.RECPAGFOLHA      , PI.TIPORECDESFOLHA , PI.RECPAG '                  + #13 +
   ' FROM '                                                                    + #13 +
   '  PARAMINTEGRAEP PI '                                                     + #13 +
   'WHERE '                                                                   + #13 +
   '      ( PI.IDPESSOA          = ' + IntToStr(Sistema.IDEmpresa) + ' ) '    + #13 +
   '  AND ( PI.IDITEMEMPTMO      = ' + IntToStr(iItem)             + ' ) '    + #13 +
   '  AND ( PI.IDTIPOCONTREMPTMO = ' + IntToStr(iTipoContrato)     + ' ) '    + #13 +

   '  AND ( PI.IDPLANOPREV = ' + IntToStr(iPlano) + ' ) '                     + #13 +
   '  AND ( PI.IDPATRO = ' + IntToStr(iPatro) + ' ) '                         + #13 +
   //////////////////////////////////////////////////////

   // Busca Somento por Patrocinadora
   '  UNION                                         '                         + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   'SELECT '                                     + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '  PI.IDPARAMINTEGRAEP , PI.DESCPARAMINTEGRA, PI.IDPLANOPREVCONTAB, '      + #13 +
   '  PI.IDPLANOPREV      , PI.IDPATRO         , PI.IDTIPOEMPTMO     , '      + #13 +
   '  PI.IDTIPOCONTREMPTMO, PI.IDITEMEMPTMO    , PI.IDPESSOA         , '      + #13 +
   '  PI.IDEMPRESA        , PI.PLANO           , PI.CCDEBFOLHA       , '      + #13 +
   '  PI.CCCREDFOLHA      , PI.SUBCDEBFOLHA    , PI.SUBCCREDFOLHA    , '      + #13 +
   '  PI.CCUSTDEBFOLHA    , PI.CCUSTCREDFOLHA  , PI.CCDEBFINAN       , '      + #13 +
   '  PI.CCCREDFINAN      , PI.SUBCDEBFINAN    , PI.SUBCCREDFINAN    , '      + #13 +
   '  PI.CCUSTDEBFINAN    , PI.CCUSTCREDFINAN  , PI.CODCENTRORESPON  , '      + #13 +

   '  PI.CCDEBFOLHA      , PI.CCCREDFOLHA     ,PI.CCUSTDEBFOLHA    , '      + #13 +
   '  PI.CCUSTCREDFOLHA   , PI.SUBCDEBFOLHA    ,PI.SUBCCREDFOLHA    , '      + #13 +
   '  PI.TIPORECDESFOLHA                                            , '      + #13 +

   ' PI.CCDEBFOLHARESULT,   PI.CCCREDFOLHARESULT, PI.CCUSTDEBFOLHARESULT,    ' + #13 +
   ' PI.CCUSTCREDFOLHARESULT, PI.SUBCDEBFOLHARESULT, PI.SUBCCREDFOLHARESULT, '  + #13 +
   ' PI.TIPORECDESFOLHARESULT,                                               '  + #13 +


   '  PI.UNIDNEGOC        , PI.RECPAGFINAN     , PI.TIPORECDESFINAN  , '      + #13 +
   '  PI.RECPAGFOLHA      , PI.TIPORECDESFOLHA , PI.RECPAG '                  + #13 +

   'FROM '                                                                    + #13 +
   '  PARAMINTEGRAEP PI '                                                     + #13 +
   'WHERE '                                                                   + #13 +
   '      ( PI.IDPESSOA          = ' + IntToStr(Sistema.IDEmpresa) + ' ) '    + #13 +
   '  AND ( PI.IDITEMEMPTMO      = ' + IntToStr(iItem)             + ' ) '    + #13 +
   '  AND ( PI.IDTIPOCONTREMPTMO = ' + IntToStr(iTipoContrato)     + ' ) '    + #13 +

   ' AND ( PI.IDPLANOPREV IS NULL ) '                                         + #13+
   '  AND ( PI.IDPATRO = ' + IntToStr(iPatro) + ' ) '                         + #13 +


   //////////////////////////////////////////////////////

   // Busca Somento por Plano
   '  UNION                                         '                         + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   'SELECT '                                     + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '  PI.IDPARAMINTEGRAEP , PI.DESCPARAMINTEGRA, PI.IDPLANOPREVCONTAB, '      + #13 +
   '  PI.IDPLANOPREV      , PI.IDPATRO         , PI.IDTIPOEMPTMO     , '      + #13 +
   '  PI.IDTIPOCONTREMPTMO, PI.IDITEMEMPTMO    , PI.IDPESSOA         , '      + #13 +
   '  PI.IDEMPRESA        , PI.PLANO           , PI.CCDEBFOLHA       , '      + #13 +
   '  PI.CCCREDFOLHA      , PI.SUBCDEBFOLHA    , PI.SUBCCREDFOLHA    , '      + #13 +
   '  PI.CCUSTDEBFOLHA    , PI.CCUSTCREDFOLHA  , PI.CCDEBFINAN       , '      + #13 +
   '  PI.CCCREDFINAN      , PI.SUBCDEBFINAN    , PI.SUBCCREDFINAN    , '      + #13 +
   '  PI.CCUSTDEBFINAN    , PI.CCUSTCREDFINAN  , PI.CODCENTRORESPON  , '      + #13 +

   '  PI.CCDEBFOLHA      , PI.CCCREDFOLHA     ,PI.CCUSTDEBFOLHA    , '       + #13 +
   '  PI.CCUSTCREDFOLHA   , PI.SUBCDEBFOLHA    ,PI.SUBCCREDFOLHA    , '      + #13 +
   '  PI.TIPORECDESFOLHA                                            , '      + #13 +

   ' PI.CCDEBFOLHARESULT,   PI.CCCREDFOLHARESULT, PI.CCUSTDEBFOLHARESULT,    ' + #13 +
   ' PI.CCUSTCREDFOLHARESULT, PI.SUBCDEBFOLHARESULT, PI.SUBCCREDFOLHARESULT, '  + #13 +
   ' PI.TIPORECDESFOLHARESULT,                                               '  + #13 +


   '  PI.UNIDNEGOC        , PI.RECPAGFINAN     , PI.TIPORECDESFINAN  , '      + #13 +
   '  PI.RECPAGFOLHA      , PI.TIPORECDESFOLHA , PI.RECPAG          '         + #13 +
   'FROM '                                                                    + #13 +
   '  PARAMINTEGRAEP PI '                                                     + #13 +
   'WHERE '                                                                   + #13 +
   '      ( PI.IDPESSOA          = ' + IntToStr(Sistema.IDEmpresa) + ' )  '    + #13 +
   '  AND ( PI.IDITEMEMPTMO      = ' + IntToStr(iItem)             + ' )  '    + #13 +
   '  AND ( PI.IDTIPOCONTREMPTMO = ' + IntToStr(iTipoContrato)     + ' )  '    + #13 +

   ' AND ( PI.IDPLANOPREV = ' + IntToStr(iPlano) + ' ) '                      + #13+
   ' AND ( PI.IDPATRO IS NULL)                      '                         + #13 +


   // Busca sem Parametro de PLano e Patrocinadora
   '  UNION                                         '                         + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
   'SELECT '                                     + #13 +
   //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
   '  PI.IDPARAMINTEGRAEP , PI.DESCPARAMINTEGRA, PI.IDPLANOPREVCONTAB, '      + #13 +
   '  PI.IDPLANOPREV      , PI.IDPATRO         , PI.IDTIPOEMPTMO     , '      + #13 +
   '  PI.IDTIPOCONTREMPTMO, PI.IDITEMEMPTMO    , PI.IDPESSOA         , '      + #13 +
   '  PI.IDEMPRESA        , PI.PLANO           , PI.CCDEBFOLHA       , '      + #13 +
   '  PI.CCCREDFOLHA      , PI.SUBCDEBFOLHA    , PI.SUBCCREDFOLHA    , '      + #13 +
   '  PI.CCUSTDEBFOLHA    , PI.CCUSTCREDFOLHA  , PI.CCDEBFINAN       , '      + #13 +
   '  PI.CCCREDFINAN      , PI.SUBCDEBFINAN    , PI.SUBCCREDFINAN    , '      + #13 +
   '  PI.CCUSTDEBFINAN    , PI.CCUSTCREDFINAN  , PI.CODCENTRORESPON  , '      + #13 +

   '  PI.CCDEBFOLHA      , PI.CCCREDFOLHA     ,PI.CCUSTDEBFOLHA    ,  '      + #13 +
   '  PI.CCUSTCREDFOLHA   , PI.SUBCDEBFOLHA    ,PI.SUBCCREDFOLHA    ,  '      + #13 +
   '  PI.TIPORECDESFOLHA                                            ,  '      + #13 +

   ' PI.CCDEBFOLHARESULT,   PI.CCCREDFOLHARESULT, PI.CCUSTDEBFOLHARESULT,    ' + #13 +
   ' PI.CCUSTCREDFOLHARESULT, PI.SUBCDEBFOLHARESULT, PI.SUBCCREDFOLHARESULT, '  + #13 +
   ' PI.TIPORECDESFOLHARESULT,                                               '  + #13 +


   '  PI.UNIDNEGOC        , PI.RECPAGFINAN     , PI.TIPORECDESFINAN  , '      + #13 +
   '  PI.RECPAGFOLHA      , PI.TIPORECDESFOLHA , PI.RECPAG '                  + #13 +
   'FROM '                                                                    + #13 +
   '  PARAMINTEGRAEP PI '                                                     + #13 +
   'WHERE '                                                                   + #13 +
   '      ( PI.IDPESSOA          = ' + IntToStr(Sistema.IDEmpresa) + ' ) '    + #13 +
   '  AND ( PI.IDITEMEMPTMO      = ' + IntToStr(iItem)             + ' ) '    + #13 +
   '  AND ( PI.IDTIPOCONTREMPTMO = ' + IntToStr(iTipoContrato)     + ' ) '    + #13 +

   ' AND ( PI.IDPLANOPREV IS   NULL  )'                                        + #13+
   ' AND ( PI.IDPATRO IS NULL)'                                                + #13;

   dtmEmptmo.qryParamIntegra.SQL.Clear;
   dtmEmptmo.qryParamIntegra.SQL.Text := sSql;
   dtmEmptmo.qryParamIntegra.Open;
   dtmEmptmo.qryParamIntegra.First;

end;


//teste Renato Visoni
function TIntegraEmptmo.EnviaTaxaPGA(const sSQL, sHistorico: String;
  const dDataLanc: TDateTime; const iCodTipoDoc, iMoedaCorrente: Integer;
  const sCCusto: String; const iPrograma: Integer; var iPlanilha: Integer;
  var sResult, sErro: TStringList
  ; iDocumentoPai        : Integer; plstDocumentosCapCar : TStringList = nil; pRecPag : string = ''): Integer; //teste renato visoni


var
   vContaBaixa       : Array of TContaBaixa;
   vHistDocumento    : Array of THistDocumento;

   bAchou            : Boolean;

   dDataVenc         : TDateTime;
   fTotal 				: Currency;

   w,i, j, k, y, z, x  : Integer;
   iTipoMov          : Integer;
   iFloat            : Integer;

   iTipoDocRec			: Int64;
   iTipoDocPag			: Int64;
   iBanco            : Int64;

   TabelaPDXRateio   : TTable;

   qryTipoContrato   : TwwQuery;
   qryItensCAPCAR    : TwwQuery;
   qryLancaRateio    : TwwQuery;
   qryupdCAPCAR           : TwwQuery;

   sSQLRateio        : String;
   sSQLUpd              : String;
   rParamAtual       : TParamIntegra;
   rParamAnterior    : TParamIntegra;

   CtrlDocumento     : TCtrlDocumento;
   rLogTotalPrev     : TLogTotalPrev;
   iTotalDiverg      : Integer;
   sRecPag             : String;
   sMsgMostra: String;

begin
   Result            := 0;
   iTotalDiverg      := 0;


   // incializa a tabela
   TabelaPDXRateio               := nil;


   // cria as queries necessárias
   qryItensCAPCAR                := TwwQuery.Create(Application);
   qryItensCAPCAR.DatabaseName   := 'BaseDados';

   qryUpdCAPCAR                := TwwQuery.Create(Application);
   qryUpdCAPCAR.DatabaseName   := 'BaseDados';


   qryLancaRateio                := TwwQuery.Create(Application);
 //Jéssica Lana SOL 114575 24/04/2009
 //qryLancaRateio.DatabaseName   := copy(Sistema.TempDir, 1, length(Sistema.TempDir) - 1);
 //qryLancaRateio.DatabaseName   := copy(ftempregra + '\', 1, length(ftempregra) - 1);
   qryLancaRateio.DatabaseName   := ftempregra;
   qryTipoContrato                := TwwQuery.Create(Application);
   qryTipoContrato.DatabaseName   := 'BaseDados';


   // ----------------------------------------------------------------------------------------------
   if ParametrosSistema then
   begin
      // -------------------------------------------------------------------------------------------
      if not(dtmEmptmo.qryParamEmptmoTIPODOCPAG.IsNULL) then
      begin
         iTipoDocPag := dtmEmptmo.qryParamEmptmoTIPODOCPAG.AsInteger;
      end
      else
      begin
         iTipoDocPag := -1;
      end;
      // -------------------------------------------------------------------------------------------
      if iCodTipoDoc = -1 then
      begin
         if not(dtmEmptmo.qryParamEmptmoTIPODOCREC.IsNULL) then
         begin
            iTipoDocRec := dtmEmptmo.qryParamEmptmoTIPODOCREC.AsInteger;
         end
         else
         begin
            iTipoDocRec := -1;
         end;
      end
      else
      begin
         iTipoDocRec := iCodTipoDoc;
      end;
      // -------------------------------------------------------------------------------------------
   end
   else  // if ParametrosSistema
   begin

      // A tabela Parâmetros do Sistema está vazia
      sErro.Add('Erro nos Parâmetros do Sistema.');
      Result := -1;  // ERRO ao abrir
      Exit;

   end;  // if ParametrosSistema
   // ----------------------------------------------------------------------------------------------


   // ----------------------------------------------------------------------------------------------
   try
      CtrlDocumento := TCtrlDocumento.Create;
      CtrlDocumento.Initialize(dtmBaseDados.dbBaseDados,
                               True,
                               Sistema.ConnectionType,
                               Sistema.ConnectionSide,
                               Sistema.AppRemoteServer,
                               True
                              );

      CtrlDocumento.OpenTransaction := False;

      try
         MostraEspera('Selecionando Itens para Contas a Pagar/Receber...');

         try
            qryItensCAPCAR.SQL.Clear;
            qryItensCAPCAR.SQL.Text := sSQL;
          //Jéssica Lana SOL 114575 24/04/2009
          //qryItensCAPCAR.SQL.SaveToFile(Sistema.TempDir + 'EP-ItensEnvioLote.txt');
            qryItensCAPCAR.SQL.SaveToFile(ftempregra + '\' + 'EP-ItensEnvioLote.txt');
            qryItensCAPCAR.Open;
         except
            on E:Exception do
            begin
               sErro.Add('Erro ao tentar selecionar os registros para Envio');
               sErro.Add(E.Message);
               Result := -1; // ERRO ao abrir
               Exit;
            end;
         end;

      finally
         EscondeEspera;
      end;

      if qryItensCAPCAR.isEmpty then
      begin
         sErro.Add('Não há registros para envio');
         //Ádler Souza - SOL 129014 Kintana 698559
         Result := -99;  // Não há itens PGA
         Exit;
      end;


      // -------------------------------------------------------------------------------------------
      //    Criação da tabela temporário em Paradox
      // -------------------------------------------------------------------------------------------

      // exclui a tabela Paradox
      if not(IntegraEmptmo.ExcluiTabelaPDX('RATEIOEP.DB', TabelaPDXRateio)) then
      begin
         sErro.Add('Erro ao Excluir Tabela Temporária.');
         Result := -5;  // não conseguiu excluir
         Exit;
      end;

      // cria a tabela Paradox
      try
         IntegraEmptmo.CriaTabelaPDX('RATEIOEP.DB', TabelaPDXRateio);
      except
         on E:Exception do
         begin
            sErro.Add(E.Message);
            Result := -5;  // não conseguir criar
            Exit;
         end;
      end;

      // define a estrutura da tabela Paradox
      if not(DefineEstruturaTabelaPDXRateio(TabelaPDXRateio)) then
      begin
         sErro.Add('ERRO ao tentar criar tabela para agrupamento');
         Result := -5;  // não conseguir criar
         Exit;
      end;

      // -------------------------------------------------------------------------------------------
      //    FIM Criação da tabela temporário em Paradox
      // -------------------------------------------------------------------------------------------


      // tendo conseguido, começa a iterar pela query
      with qryItensCAPCAR do
      begin
         First;
         i := 0;

         iBanco := -1;

         if pRecPag = 'P' then begin
           sMsgMostra := 'Transferindo taxa(s) administrativa(s) - CAP'
         end else if pRecPag = 'R' then begin
           sMsgMostra := 'Transferindo taxa(s) administrativa(s) - CAR'
         end else begin
           sMsgMostra := 'Transferindo taxa(s) administrativa(s)'
         end;

         frmProgresso.MostraFormProgresso(sMsgMostra,
                                          True,
                                          True,
                                          True,
                                          i,
                                          (qryItensCAPCAR.RecordCount)
                                         );

         dDataVenc   := qryItensCAPCAR.FieldByName('HMEDATAVENCTO').AsDateTime;
         iTipoMov    := qryItensCAPCAR.FieldByName('HMETIPOMOV').AsInteger;


         // ----------------------------------------------------------------------------------------
         //    Verificação do FLOAT para concessão
         // ----------------------------------------------------------------------------------------
         if dtmEmptmo.qryParamEmptmoFLGUSAFLOATCONC.AsInteger = 1 then
         begin
            with dtmEmptmo.qryBancoPortForma do
            begin
               LimpaParametros(dtmEmptmo.qryBancoPortForma);
               ParamByName('PCODPORTFORMA').AsInteger := qryItensCAPCAR.FieldByName('PORTFORMAPAG').AsInteger;
               Open;

               if not(dtmEmptmo.qryBancoPortForma.IsEmpty) then
               begin
                  iFloat      := dtmEmptmo.qryBancoPortFormaDFLOATPAGTO.AsInteger;
                  dDataVenc   := dDataVenc - iFloat;

                  if not(dtmEmptmo.qryBancoPortFormaIDFAVORECIDO.IsNull) then iBanco := dtmEmptmo.qryBancoPortFormaIDFAVORECIDO.AsInteger;
               end;  // if not(dtmEmptmo.qryBancoPortForma.IsEmpty)
            end;  // with dtmEmptmo.qryBancoPortForma
         end;  // if dtmEmptmo.qryParamEmptmoFLGUSAFLOATCONC.AsInteger = 1
         // ----------------------------------------------------------------------------------------
         //    FIM Verificação do FLOAT para concessão
         // ----------------------------------------------------------------------------------------


         // ----------------------------------------------------------------------------------------
         //    Verificação do Banco ligado ao PortadorForma (pois é o Fornecedor do documento)
         // ----------------------------------------------------------------------------------------
         if iBanco = -1 then
         begin
            with dtmEmptmo.qryBancoPortForma do
            begin
               LimpaParametros(dtmEmptmo.qryBancoPortForma);
               ParamByName('PCODPORTFORMA').AsInteger := qryItensCAPCAR.FieldByName('PORTFORMAPAG').AsInteger;
               Open;

               if not(dtmEmptmo.qryBancoPortForma.IsEmpty) then
               begin
                  if not(dtmEmptmo.qryBancoPortFormaIDFAVORECIDO.IsNull) then iBanco := dtmEmptmo.qryBancoPortFormaIDFAVORECIDO.AsInteger;
               end;
            end;
         end;

         with dtmEmptmo.qryPortadorForma do
         begin
            LimpaParametros(dtmEmptmo.qryPortadorForma);
            ParamByName('PCODPORTFORMA').AsInteger := qryItensCAPCAR.FieldByName('PORTFORMAPAG').AsInteger;
            Open;

            if not(dtmEmptmo.qryPortadorForma.IsEmpty) and not(dtmEmptmo.qryPortadorFormaIDBANCO.IsNull) then
            begin
               if iBanco = -1 then iBanco := dtmEmptmo.qryPortadorFormaIDBANCO.AsInteger;
            end
            else
            begin
               Result := -9; // Não foi encontrado banco
               sErro.Add('Não foi encontrado Banco associado à Conta de Caixa');
               Exit;
            end;  // if not(dtmEmptmo.qryBancoPortForma.IsEmpty)
         end;  // with dtmEmptmo.qryBancoPortForma
         // ----------------------------------------------------------------------------------------
         //    FIM verificação o Banco ligado ao PortadorForma (pois é o Fornecedor do documento)
         // ----------------------------------------------------------------------------------------

         // guarda os valores do 1º registro para o Documento a a LanctoDocum
         MontaParamCAPCAR(iTipoMov, iTipoDocRec, iTipoDocPag, dDataLanc, dDataVenc, qryItensCAPCAR, iMoedaCorrente, rParamAnterior);

         // passa o banco como Fornecedor para o Documento
         rParamAnterior.iPessoa := iBanco;

         // ----------------------------------------------------------------------------------------
         //    Vai-se criar um único documento para todos os itens de um contrato que tiverem
         //       o mesmo mês e ano de cobrança.  Cada item corresponderá a um RateioDocum, e haverá
         //       um LanctoDocum com o valor total dos itens.
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         //    Gravação do Documento
         // ----------------------------------------------------------------------------------------
         // cria o Documento com os dados do registro 'ANTERIOR'.
         // função que insere Cliente/Fornecedor e insere Documento
         if not(InsereDocumento(rParamAnterior, sErro, CtrlDocumento, sHistorico, True,iDocumentoPai)) then //teste renato visoni Documento Pai
         begin
            Result := -3;  // ERRO ao inserir Documento
            sErro.Add('Erro ao criar Documento');
            Exit;
         end
         else
         begin
            // atribuição do Código do Documento
            rParamAtual.iDocumento := rParamAnterior.iDocumento;
            
         end;  // if not(InsereDocumento(rParamAnterior, sErro))


         // ----------------------------------------------------------------------------------------
         //    FIM Gravação do Documento
         // ----------------------------------------------------------------------------------------


         // ----------------------------------------------------------------------------------------
         //    Preparação para gravação da RateioDocum
         // ----------------------------------------------------------------------------------------
         fTotal := 0;
         SetLength(vContaBaixa, 0);
         SetLength(vHistDocumento, 0);

         // ----------------------------------------------------------------------------------------

         while not(qryItensCAPCAR.EOF) do
         begin

            inc(i);
            frmProgresso.AndaFormProgresso(i);

            // Verifica se o usuário Cancelou a Operação
            if frmProgresso.Cancelou then
            begin
               sErro.Add('Processo interrompido pelo usuário');
               Result := -8;
               Exit;
            end;

            // Marchetti - Pendencia 19602 - 26/04/2006
            qryTipoContrato.Close;
            qryTipoContrato.Sql.Text := 'SELECT TCEMAXCONTRATO ' + #13 +
                                        'FROM   TIPOCONTREMPTMO' + #13 +
                                        'WHERE  IDTIPOCONTREMPTMO = ' + qryItensCAPCAR.FieldByName('IDTIPOCONTREMPTMO').AsString;
            qryTipoContrato.Open;

            if (qryItensCAPCAR.FieldByName('HMETIPOMOV').AsInteger = 0) and
               (qryTipoContrato.FieldByName('TCEMAXCONTRATO').AsInteger = 1) and
               (not CalcEmptmo.VerificaContratoAtivo(qryItensCAPCAR.FieldByName('IDPESSOA').AsInteger,
                                                    qryItensCAPCAR.FieldByName('IDBENEF').AsInteger,
                                                    qryItensCAPCAR.FieldByName('IDTIPOCONTREMPTMO').AsInteger,
                                                    False,
                                                    qryItensCAPCAR.FieldByName('IDCONTRATOEMPTMO').AsFloat)) then
            begin
               sErro.Add('Participante ' + qryItensCAPCAR.FieldByName('MATRICULA').AsString + ' possui outro empréstimo do mesmo tipo já ativo');
               Inc(iTotalDiverg);
               qryItensCAPCAR.Next;
               Continue;
            end;
            // Fim Marchetti - Pendencia 19602 - 26/04/2006

            // -------------------------------------------------------------------------------------
            MontaParamCAPCAR(iTipoMov,
                             iTipoDocRec,
                             iTipoDocPag,
                             dDataLanc,
                             dDataVenc,
                             qryItensCAPCAR,
                             iMoedaCorrente,
                             rParamAtual
                            );
            // -------------------------------------------------------------------------------------

            //totalizar somente os registros a pagar
            fTotal := fTotal + rParamAtual.fVlrLanc;

            GravaItemPDXRateio(rParamAnterior.iDocumento,
                               rParamAtual,
                               TabelaPDXRateio
                              );

            // -------------------------------------------------------------------------------------

            bAchou := False;
            //Pendência 28219
            x := -1;
            for y := 0 to length(vContaBaixa) - 1 do
              begin
                 if (vContaBaixa[y].sConta     = rParamAtual.sCCBaixa) and
                    (vContaBaixa[y].iPatro     = rParamAtual.iPatro) and
                    (vContaBaixa[y].iUnidNegoc = rParamAtual.iUnidNegoc) and
                    (vContaBaixa[y].iPlanoPrev = rParamAtual.iPlanPrevContab) then
                 begin
                    vContaBaixa[y].fValor := vContaBaixa[y].fValor + rParamAtual.fVlrLanc;

                    bAchou := True;
                    Break;
                 end;
            end;

            //if (y >= (length(vContaBaixa) - 1)) and not(bAchou) then
            if ((x > (length(vContaBaixa))) or (x = -1)) and not(bAchou) then
            begin
               z := length(vContaBaixa) + 1;
               SetLength(vContaBaixa, z);

               vContaBaixa[z - 1].sConta      := rParamAtual.sCCBaixa;
               vContaBaixa[z - 1].fValor      := rParamAtual.fVlrLanc;
               vContaBaixa[z - 1].iPatro      := rParamAtual.iPatro;
               vContaBaixa[z - 1].iUnidNegoc  := rParamAtual.iUnidNegoc;
               vContaBaixa[z - 1].iPlanoPrev  := rParamAtual.iPlanPrevContab;
            end;
            //Fim Pendência 2821
            // -------------------------------------------------------------------------------------


            SetLength(vHistDocumento, i);

            vHistDocumento[i - 1].IDHistMov     := qryItensCAPCAR.FieldByName('IDHISTMOVEMPTMO').AsFloat;
            vHistDocumento[i - 1].CodDocumento  := rParamAtual.iDocumento;

            if qryItensCAPCAR.FieldByname('HMERECPAG').asstring = 'P' then begin
              plstDocumentosCapCar.Add(qryItensCAPCAR.FieldByName('IDHISTMOVEMPTMO').AsString+';'+intTostr(rParamAtual.iDocumento));
            end;

            // -------------------------------------------------------------------------------------

            qryItensCAPCAR.Next;
         end;  // while not(qryItensCAPCAR.EOF)


         // Marchetti - Pendencia 19602 - 26/04/2006
         if iTotalDiverg = qryItensCAPCAR.RecordCount then
         begin
            Result := -3;  // O numero de divergencias é igual ao total de registros a enviar
            Exit;
         end;
         // Fim Marchetti - Pendencia 19602 - 26/04/2006

         // ----------------------------------------------------------------------------------------
         //    FIM Preparação para gravação da RateioDocum
         // ----------------------------------------------------------------------------------------


         // ----------------------------------------------------------------------------------------
         //    Gravação da RateioDocum
         // ----------------------------------------------------------------------------------------

         // cria as queries necessárias
         sSQLRateio :=
         'SELECT '                                             + #13 +
         '  SUM(VALOR) AS VALOR, '                             + #13 +
         '  IDPATRO, IDPLANOPREVCONTAB, '                      + #13 +
         '  UNIDNEGOC, CENTRORESPON, '                         + #13 +
         '  TIPODESEMB, CODDOCUMENTO,RECPAG '                         + #13 +
         'FROM '                                               + #13 +
         '  "RATEIOEP.DB" RATEIOEP '                           + #13 +
         'GROUP BY '                                           + #13 +
         '  IDPATRO, IDPLANOPREVCONTAB, '                      + #13 +
         '  UNIDNEGOC, CENTRORESPON, '                         + #13 +
         '  TIPODESEMB, CODDOCUMENTO,RECPAG '                         + #13;

         qryLancaRateio.Close;
         qryLancaRateio.SQL.Clear;
         qryLancaRateio.SQL.Text := sSQLRateio;

         qryLancaRateio.Open;

         // executa todos os lançamentos
         qryLancaRateio.First;
         while not(qryLancaRateio.EOF) do
         begin
            MontaParamRateio(qryLancaRateio, rParamAtual,'T');

            // cria o RateioDocum com os dados do registro 'ATUAL'
            // função que faz o Rateio do documento
            if not(LancaRateio(sCCusto, iPrograma, CtrlDocumento, rParamAtual, sErro)) then
            begin
               Result := -4;  // ERRO no Rateio do Documento
               sErro.Add('Erro ao criar Rateio do Documento');
               Exit;
            end;// Lança Rateio

            qryLancaRateio.Next;
         end;

         // ----------------------------------------------------------------------------------------
         //    FIM Gravação da RateioDocum
         // ----------------------------------------------------------------------------------------

         // -------------------------------------------------------------------------------------

         // Lança as contas de baixa no documento
         for y := 0 to length(vContaBaixa) - 1 do
         begin
           CtrlDocumento.CCBaixasXDocum.SetValues(vContaBaixa[y].fValor,        //
                                                   0,                            // liIDCcBaixasXDocum
                                                   Sistema.IDEmpresa,            // liIDPessos
                                                   rParamAnterior.iDocumento,    // liCodDocumento
                                                   vContaBaixa[y].iUnidNegoc,    // liUnidNegoc
                                                   IntegraBack.Plano,            // liPlano
                                                   vContaBaixa[y].iPlanoPrev,    // liIDPlanoPrev
                                                   vContaBaixa[y].iPatro,        // liIDPatro
                                                   -1,                           // liIDSegregaCriter
                                                   vContaBaixa[y].sConta         // sPlaConta
                                                  );

         end;

         // Limpa o vetor de contas
         SetLength(vContaBaixa, 0);

         // -------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------
         //    Gravação da LanctoDocum
         // ----------------------------------------------------------------------------------------

         // cria o LanctoDocum com os dados do registro 'ANTERIOR', mais
         // a totalização de todos os registros 'ATUAIS'
         // função que faz o lançamento na LanctoDocum

         // Primeiro documento é o A PAGAR o segubdo é o A Receber.


         if not(LancaDocumento(rParamAnterior, fTotal, sHistorico, CtrlDocumento, iPlanilha, sErro, False)) then
           begin
              Result := -6;  // ERRO ao Lançar Documento
              sErro.Add('Erro ao criar Lançamento do Documento');
              Exit;
         end;
         // ----------------------------------------------------------------------------------------
         //    FIM Gravação da LanctoDocum
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------

         if not(CtrlDocumento.Insert) then
         begin
            sErro.Add(CtrlDocumento.MessageInfo);
            Result := -3;  // ERRO ao inserir Documento
            Exit;
         end;

         // ----------------------------------------------------------------------------------------

         for y := 0 to length(vHistDocumento) - 1 do
         begin
            {
            with dtmIntegraEmptmo.qryUpdateDocumento do
            begin
               ParamByName('PCODDOCUMENTO').AsInteger    := vHistDocumento[y].CodDocumento;
               ParamByName('PIDHISTMOVEMPTMO').AsFloat   := vHistDocumento[y].IDHistMov;
               ExecSQL;
            end;
            }
            // -------------------------------------------------------------------------------------
            // André Pontes - 19/01/2006 - LogDocumento - OK

            LimpaRegistroLog(rLogTotalPrev);

            rLogTotalPrev.IDModulo   := Sistema.IDModulo;
            rLogTotalPrev.IDContrato := -1;
            rLogTotalPrev.IDHistMov  := vHistDocumento[y].IDHistMov;
            rLogTotalPrev.CodPlanDoc := vHistDocumento[y].CodDocumento;
            rLogTotalPrev.Origem     := -1;
            rLogTotalPrev.Operacao   := 'EnviaLoteConcessao - qryUpdateDocumento';
            rLogTotalPrev.Data       := SysDate;
            rLogTotalPrev.IDUsuario  := Sistema.IDUsuario;
            rLogTotalPrev.Versao     := Sistema.Versao;

            GravaLogTotalPrev(rLogTotalPrev);

            // -------------------------------------------------------------------------------------
         end;

         SetLength(vHistDocumento, 0);

         // ----------------------------------------------------------------------------------------
         if pRecPag = 'P' then begin
           sResult.Add('Valor enviado - CAP: ' + FormatFloat('#,#0.00', fTotal));
         end else begin
           sResult.Add('Valor enviado - CAR: ' + FormatFloat('#,#0.00', fTotal));
         end;
         // ----------------------------------------------------------------------------------------
      end; // with

   finally
      CtrlDocumento.Free;

      frmProgresso.EscondeFormProgresso;
      EscondeEspera;

      qryLancaRateio.Free;
      qryItensCAPCAR.Free;
      qryTipoContrato.Free;

      if TabelaPDXRateio <> nil then TabelaPDXRateio.Close;
      if TabelaPDXRateio <> nil then TabelaPDXRateio.Free;


   end;
end;

function TIntegraEmptmo.MontaEstruturaReceber(qryItensCAPCAR,
  pQryReceber: TwwQuery): Boolean;
  var Espaco : String;
  i : Integer;
  updItensCapCar : TUpdateSQL;
  ds             : TDataSource;

begin
  i := 0;
  qryItensCAPCAR.Destroy;

  ds                            := TDataSource.create(Application);
  updItensCapCar                := TUpdateSQL.create(Application);


  qryItensCAPCAR                := TwwQuery.Create(Application);
  qryItensCAPCAR.DatabaseName   := 'BaseDados';
  ds.DataSet                    := qryItensCAPCAR;



  qryItensCAPCAR.UpdateObject   := updItensCapCar;
  qryItensCAPCAR.RequestLive    := True;

  Espaco := '                                     ';
  qryItensCAPCAR.Close;
  qryItensCAPCAR.SQL.Clear;
  qryItensCAPCAR.SQL.Text :=
  ' SELECT ''R'' as HMERECPAG,'+
    QuotedStr(Espaco) + '   AS IDHISTMOVEMPTMO,'+
    QuotedStr(Espaco) + 'AS IDCONTRATOEMPTMO,    '+
    QuotedStr(Espaco) + 'AS IDITEMEMPTMO,        '+
    QuotedStr(Espaco) + 'AS HMEFORMACOBRANCA,    '+
    QuotedStr(Espaco) + 'AS IDITEMCENTRALIZA,    '+
    '00000000000000 AS HMEVLRPREVISTO,'+
    QuotedStr(Espaco) + 'AS HMEDATAPREVISTA,     '+
    QuotedStr(Espaco) + 'AS HMEDATAVENCTO,       '+
    QuotedStr(Espaco) + 'AS HMEPARCELA,          '+
    '0000000000000 HMENUMPARCELAS,   '+
    QuotedStr(Espaco) + 'AS HMESALDODEV,         '+
    QuotedStr(Espaco) + 'AS HMETIPOMOV,          '+
    QuotedStr(Espaco) + 'AS ANOMESCOMPETENCIA,   '+
    QuotedStr(Espaco) + 'AS CONTABAIXA,          '+
    QuotedStr(Espaco) + 'AS TIPCODIGO,           '+
    QuotedStr(Espaco) + 'AS ITCTRATASALDODEV,    '+
    QuotedStr(Espaco) + 'AS IDPLANOPREV,         '+
    QuotedStr(Espaco) + 'AS IDPLANOORIGEM,       '+
    QuotedStr(Espaco) + 'AS IDBENEF,             '+
    QuotedStr(Espaco) + 'AS IDPESSOA,            '+
    QuotedStr(Espaco) + 'AS IDPATRO,             '+
    QuotedStr(Espaco) + 'AS MATRICULA,           '+
    QuotedStr(Espaco) + 'AS CODFORMAPAG,         '+
    QuotedStr(Espaco) + 'AS PORTFORMAPAG,        '+
    QuotedStr(Espaco) + 'AS PORTFORMAREC,        '+
    QuotedStr(Espaco) + 'AS IDCBANCARIA,         '+
    QuotedStr(Espaco) + 'AS IDCBANCARIADEB,      '+
    QuotedStr(Espaco) + 'AS IDTIPOCONTREMPTMO,   '+
    QuotedStr(Espaco) + 'AS ITEDESCRICAO,        '+
    QuotedStr(Espaco) + 'AS FLGINTERNO,          '+
    ' 00000000000000 AS FLGATUALSALDOENV, '+
    ' -1      AS IDREGRAENVIOPARC,       '+
    QuotedStr(Espaco) + 'AS IDTIPOSUSPEMPTMO        '+
  ' FROM DUAL';

  qryItensCAPCAR.Open;


  pQryReceber.First;
  While not pQryReceber.Eof Do begin
    qryItensCAPCAR.Insert;
    for i := 0 to qryItensCAPCAR.Fields.Count -1 do begin
      qryItensCAPCAR.FieldByname(qryItensCAPCAR.Fields[i].Name).asString := pQryReceber.FieldByname(qryItensCAPCAR.Fields[i].Name).asString;
    end;
    qryItensCAPCAR.Post;
  end;

end;

//Ádler Souza - SOL 137847 KTN 836194

Procedure TIntegraEmptmo.InsertHistEnvioEmptmo(IDHistMov : Extended; CodDocumento : String; IDTmpDesc : String);
var
  qryAux       : TwwQuery;
  qryAuxUpdate : TwwQuery;
  sSQL   : String;
  sTipoFolha : String;
  sIdRubrica : String;
  sFormaCobranca : String;
begin
  try
    if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

    //==========================================================================

    qryAux              := TwwQuery.Create(Application);
    qryAux.DatabaseName := 'BaseDados';

    qryAuxUpdate              := TwwQuery.Create(Application);
    qryAuxUpdate.DatabaseName := 'BaseDados';

    sSQL := 'SELECT HST.IDHISTMOVEMPTMO, ' +#13+
            '       HST.HMEFORMACOBRANCA, ' +#13+
            '       HST.HMETIPOFOLHA, '    +#13+
            '       HST.IDRUBRICA, '        +#13+
            //Vinicius Maciel - SOL 145571 Kintana 975201
            '       HST.HMEDATAVENCTO '     +#13+
            //Vinicius Maciel - SOL 145571 Kintana 975201 - FIM
            '  FROM HISTMOVEMPTMO HST ' +#13+
            ' WHERE HST.IDHISTMOVEMPTMO = '+ floatToStr(IDHistMov);
    qryAux.Sql.Text := sSql;
    qryAux.open;

    //==========================================================================

    if CodDocumento = '' then
      CodDocumento := 'NULL';

    if IDTmpDesc = '' then
      IDTmpDesc := 'NULL';

    if qryAux.fieldByName('HMEFORMACOBRANCA').AsString = '' then
      sFormaCobranca := 'NULL'
    else
      sFormaCobranca := qryAux.fieldByName('HMEFORMACOBRANCA').AsString;

    if qryAux.fieldByName('HMETIPOFOLHA').AsString = '' then
      sTipoFolha := 'NULL'
    else
      sTipoFolha := qryAux.fieldByName('HMETIPOFOLHA').AsString;

    if qryAux.fieldByName('IDRUBRICA').AsString = '' then
      sIdRubrica := 'NULL'
    else
      sIdRubrica := qryAux.fieldByName('IDRUBRICA').AsString;

    //==========================================================================

    try
      with qryAux do
      begin
        if not(isEmpty) then
        begin
          sSQL := ' INSERT INTO HISTENVIOEMPTMO ' +#13+
                  ' (IDHISTMOVEMPTMO,'            +#13+
                  ' DATAENVIO, '                  +#13+
                  ' FORMACOBRANCA, '              +#13+
                  ' TIPOFOLHA, '                  +#13+
                  ' IDRUBRICA, '                  +#13+
                  ' IDTMPDESC, '                  +#13+
                  ' CODDOCUMENTO,'                 +#13+
                  //Vinicius Maciel - SOL 145571 Kintana 975201
                  ' DATAVENCTO) '              +#13+
                  //Vinicius Maciel - SOL 145571 Kintana 975201 - FIM
                  ' VALUES ( '                    +#13+
                  '  ' + fieldByName('IDHISTMOVEMPTMO').AsString +#13+
                  ', SYSDATE'                     +#13;
                  if sFormaCobranca = 'NULL' then
                    sSQL := sSQL + ', '+ sFormaCobranca
                  else
                    sSQL := sSQL + ', '+#39+ sFormaCobranca+#39;

                  if sTipoFolha = 'NULL' then
                    sSQL := sSQL + ', '+ sTipoFolha
                  else
                    sSQL := sSQL + ', '+#39+ sTipoFolha+#39;

                  sSQL := sSQL +
                  ', ' + sIdRubrica         +#13+
                  ', ' + IDTmpDesc          +#13+
                  ', ' + CodDocumento       +#13+
                  //Vinicius Maciel - SOL 145571 Kintana 975201
                  ', ' + QUotedStr(fieldByName('HMEDATAVENCTO').asString)                   +')';
                  //Vinicius Maciel - SOL 145571 Kintana 975201 - FIM

          qryAuxUpdate.Sql.Text := sSql;
          qryAuxUpdate.ExecSql;
        end;
      end;
    except
      MessageDlg('Não foi possivel inserir na tabela de histórico!', mtError, [mbOK], 0);
    end;
  finally
    qryAux.Free;
    qryAuxUpdate.Free;
    CommitTransacao;
  end;
end;
//Fim - Ádler Souza - SOL 137847 KTN 836194

// MARCIO SANCHES SPINOSA SOL 169010 KINTANA 1495798 - INICIO
function TIntegraEmptmo.UpdateCtrlInterface(const iIDLote: Int64;
  isEnviaFolhaResgate: integer): Boolean;
begin
   // função que atualiza na tabela CTRLINTERFACE, tendo como saída True se a operação foi
   //   bem sucedida e False caso negativo
   with dtmIntegraEmptmo.qryInsertCtrlInterface do
   begin
      LimpaParametros(dtmIntegraEmptmo.qryUpdateCtrlInterface);

      ParamByName('PIDLOTE').AsInteger            := iIDLote;
      ParamByName('PFLGRESGATE').AsInteger        := isEnviaFolhaResgate;

      try
         ExecSQL;
         Result := True;
      except
         Result := False;
      end; // try..except

   end;// with

end;
// MARCIO SANCHES SPINOSA SOL 169010 KINTANA 1495798 - FIM


//edilaine - SIG57627 - inicio
// Função para verificar se falta parametrização de Perfil de Investimento para recuperar o
// IDPLANPREVCONTAB (IDPLANOORIGEM) usado na contabilização dos Itens
function TIntegraEmptmo.ValidaParamPerfilInvestimento(const qryValida : TwwQuery;
                                                      var sErro       : TStringList) : boolean;
var
  sContratos  : TStringList;
  sLista      : string;
begin
  sContratos := TStringList.create;

  qryValida.Filtered := false;
  qryValida.Filter   := 'IDPLANOORIGEM = -1';
  qryValida.Filtered := True;

  Result := qryValida.eof;

  try
    if not qryValida.eof then
    begin
      while not qryValida.eof do
      begin
        if sContratos.IndexOf(qryValida.FieldByName('IDCONTRATOEMPTMO').AsString) = -1 then
           sContratos.Add( qryValida.FieldByName('IDCONTRATOEMPTMO').AsString );

        qryValida.next;
      end;
      sLista := sContratos.Commatext;
      sLista := StringReplace(sLista, ',', ', ', [rfReplaceAll]);
      sErro.Add('Contratos: '+sLista);
    end;
  finally
    FreeAndNil(sContratos);
  end;

  qryValida.Filter   := '';
  qryValida.Filtered := false;
end;
//edilaine - SIG57627 - fim

//edilaine - SIG101022 - Inicio
function TIntegraEmptmo.RetornaFlgDescontoProvDesc(pIdProvento: Integer) : Integer;
var
  qryAux               : TwwQuery;
begin
  qryAux              := TwwQuery.Create(Application);
  qryAux.DatabaseName := 'BaseDados';

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Text := 'SELECT FLGDESCONTO FROM PROVDESC P WHERE P.IDPROVENTO = ' + inttostr(pIdProvento);
  qryAux.Open;

  result := 0;

  if not (qryAux.isempty) then
    result := qryAux.FieldByName('FLGDESCONTO').AsInteger;

  FreeAndNil(qryAux);
end;


end.
